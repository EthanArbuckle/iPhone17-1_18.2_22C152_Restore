uint64_t MTDeviceSetReport(uint64_t a1, int a2, uint64_t a3, signed int a4)
{
  uint64_t result;

  result = 3758097090;
  if (a1)
  {
    if (a4 <= 512)
    {
      if (*(_DWORD *)(a1 + 212)) {
        return mt_DeviceSetReportViaDriver(a1, a2, a3, a4);
      }
      else {
        return mt_DeviceSetReportViaDriverLegacyUSB(a1, a2, a3, a4);
      }
    }
    else
    {
      return 3758097095;
    }
  }
  return result;
}

uint64_t mt_DeviceSetReportViaDriver(uint64_t a1, int a2, uint64_t a3, unsigned int a4)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  uint64_t v4 = 3758097084;
  if (!a1) {
    return 3758097101;
  }
  *(_DWORD *)&v46[15] = -1431655766;
  size_t outputStructCnt = 520;
  char outputStruct = a2;
  if (a4 > 0x200)
  {
    puts("Too many bytes for the report to be set");
    return 3758097128;
  }
  unsigned int v47 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  *(_OWORD *)v46 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  __memmove_chk();
  io_connect_t v8 = *(_DWORD *)(a1 + 20);
  io_connect_t connect = v8;
  if (v8)
  {
    uint64_t v4 = IOConnectCallStructMethod(v8, 2u, &outputStruct, 0x208uLL, &outputStruct, &outputStructCnt);
    if (!v4) {
      return v4;
    }
    goto LABEL_13;
  }
  io_service_t v9 = *(_DWORD *)(a1 + 16);
  mach_timespec_t waitTime = (mach_timespec_t)5;
  if (IOServiceWaitQuiet(v9, &waitTime) == -536870186) {
    printf("MT Error: service still busy after %d seconds\n", waitTime.tv_sec);
  }
  if (!IOServiceOpen(v9, *MEMORY[0x263EF8960], 0, &connect)) {
    uint64_t v4 = IOConnectCallStructMethod(connect, 2u, &outputStruct, 0x208uLL, &outputStruct, &outputStructCnt);
  }
  IOServiceClose(connect);
  if (v4)
  {
LABEL_13:
    if (!gMT_BE_LESS_VERBOSE) {
      printf("Error 0x%08X setting report 0x%02X with length %d\n", v4, a2, a4);
    }
  }
  return v4;
}

__CFArray *MTDeviceCreateList()
{
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 25, MEMORY[0x263EFFF70]);
  ListForDriverType = __MTDeviceCreateListForDriverType(2u);
  if (ListForDriverType)
  {
    CFArrayRef v2 = ListForDriverType;
    if (CFArrayGetCount(ListForDriverType) >= 1)
    {
      v6.length = CFArrayGetCount(v2);
      v6.location = 0;
      CFArrayAppendArray(Mutable, v2, v6);
    }
    CFRelease(v2);
  }
  v3 = __MTDeviceCreateListForDriverType(4u);
  if (v3)
  {
    CFArrayRef v4 = v3;
    if (CFArrayGetCount(v3) >= 1)
    {
      v7.length = CFArrayGetCount(v4);
      v7.location = 0;
      CFArrayAppendArray(Mutable, v4, v7);
    }
    CFRelease(v4);
  }
  return Mutable;
}

__CFArray *__MTDeviceCreateListForDriverType(unsigned int a1)
{
  kern_return_t MatchingServices;
  io_object_t v6;
  io_object_t v7;
  uint64_t v8;
  _DWORD *v9;
  io_iterator_t existing;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 25, MEMORY[0x263EFFF70]);
  if (Mutable)
  {
    existing = -1431655766;
    if (a1 > 4) {
      v3 = "UnknownMultiouchDriverType";
    }
    else {
      v3 = off_26479B2E8[a1];
    }
    CFDictionaryRef v4 = IOServiceMatching(v3);
    if (v4)
    {
      MatchingServices = IOServiceGetMatchingServices(0, v4, &existing);
      if (MatchingServices)
      {
        printf("IOServiceGetMatchingServices() returned 0x%08X\n", MatchingServices);
      }
      else
      {
        CFRange v6 = IOIteratorNext(existing);
        if (v6)
        {
          CFRange v7 = v6;
          do
          {
            io_connect_t v8 = MTDeviceCreateFromService(v7);
            if (v8)
            {
              io_service_t v9 = (_DWORD *)v8;
              if (*(unsigned char *)(v8 + 133)) {
                mt_CachePropertiesForDevice(v8);
              }
              if (v9[16]) {
                CFArrayAppendValue(Mutable, v9);
              }
              CFRelease(v9);
            }
            IOObjectRelease(v7);
            CFRange v7 = IOIteratorNext(existing);
          }
          while (v7);
        }
        IOObjectRelease(existing);
      }
    }
    else
    {
      puts("IOServiceMatching() returned a NULL dictionary.");
    }
  }
  return Mutable;
}

__CFArray *MTDeviceCreateListFromDeviceUsagePairs(const __CFArray *a1)
{
  if (!a1) {
    return 0;
  }
  CFIndex Count = CFArrayGetCount(a1);
  List = MTDeviceCreateList();
  CFArrayRef v4 = List;
  if (!Count) {
    return List;
  }
  if (!List) {
    return 0;
  }
  CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  if (Mutable)
  {
    CFIndex v6 = CFArrayGetCount(v4);
    if (v6 >= 1)
    {
      CFIndex v7 = v6;
      for (CFIndex i = 0; i != v7; ++i)
      {
        ValueAtIndex = (io_registry_entry_t *)CFArrayGetValueAtIndex(v4, i);
        if (ValueAtIndex)
        {
          v10 = ValueAtIndex;
          io_registry_entry_t v11 = ValueAtIndex[4];
          if (v11)
          {
            CFArrayRef CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty(v11, @"DeviceUsagePairs", allocator, 0);
            if (CFProperty)
            {
              CFArrayRef v13 = CFProperty;
              if (Count >= 1)
              {
                CFIndex v14 = 0;
                while (1)
                {
                  CFIndex v15 = CFArrayGetCount(v13);
                  long long v16 = CFArrayGetValueAtIndex(a1, v14);
                  v19.location = 0;
                  v19.length = v15;
                  if (CFArrayContainsValue(v13, v19, v16)) {
                    break;
                  }
                  if (Count == ++v14) {
                    goto LABEL_16;
                  }
                }
                CFArrayAppendValue(Mutable, v10);
              }
LABEL_16:
              CFRelease(v13);
            }
          }
        }
      }
    }
  }
  CFRelease(v4);
  return Mutable;
}

uint64_t MTDeviceGetService(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 16);
  }
  return result;
}

uint64_t MTDeviceCreateFromService(io_object_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = MTDeviceCreate(a1);
  if (IOObjectConformsTo(a1, "AppleMultitouchSPI"))
  {
    int v3 = 2;
  }
  else if (IOObjectConformsTo(a1, "AppleUSBMultitouchDriver"))
  {
    int v3 = 1;
  }
  else if (IOObjectConformsTo(a1, "AppleMultitouchDevice"))
  {
    int v3 = 4;
  }
  else if (IOObjectConformsTo(a1, "AppleMultitouchDummy"))
  {
    int v3 = 3;
  }
  else if (IOObjectConformsTo(a1, "MultitouchDriver"))
  {
    int v3 = 0;
  }
  else
  {
    int v3 = 255;
  }
  *(_DWORD *)(v2 + 212) = v3;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(a1, @"Transport", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFStringRef v6 = CFProperty;
  if (!CFProperty || (CFTypeID v7 = CFGetTypeID(CFProperty), v7 != CFStringGetTypeID()))
  {
    if (IOObjectConformsTo(a1, "AppleMultitouchSPI"))
    {
      int v8 = 2;
    }
    else if (IOObjectConformsTo(a1, "AppleUSBMultitouchDriver"))
    {
      int v8 = 1;
    }
    else if (IOObjectConformsTo(a1, "AppleMultitouchDevice"))
    {
      int v8 = 4;
    }
    else if (IOObjectConformsTo(a1, "AppleMultitouchDummy"))
    {
      int v8 = 3;
    }
    else if (IOObjectConformsTo(a1, "MultitouchDriver"))
    {
      int v8 = 0;
    }
    else
    {
      int v8 = 255;
    }
    if (!v6) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  if (CFStringCompare(v6, @"SPI", 0))
  {
    if (CFEqual(v6, @"USB"))
    {
      int v8 = 1;
      goto LABEL_41;
    }
    if (CFEqual(v6, @"Bluetooth")
      || CFEqual(v6, @"BluetoothLowEnergy"))
    {
      int v8 = 4;
      goto LABEL_41;
    }
    if (CFStringCompare(v6, @"SPU", 0))
    {
      if (CFStringCompare(v6, @"Dummy", 0))
      {
        if (CFStringCompare(v6, @"Dummy Network", 0))
        {
          if (CFStringCompare(v6, @"Dummy Playback", 0)) {
            int v8 = 255;
          }
          else {
            int v8 = 6;
          }
        }
        else
        {
          int v8 = 5;
        }
      }
      else
      {
        int v8 = 6;
      }
      goto LABEL_41;
    }
  }
  int v8 = 2;
LABEL_41:
  CFRelease(v6);
LABEL_42:
  *(_DWORD *)(v2 + 216) = v8;
  if (CFPreferencesGetAppBooleanValue(@"Recording", @"com.apple.MultitouchSupport", 0) == 1 || !geteuid()) {
    *(void *)(v2 + 2104) = dispatch_semaphore_create(1);
  }
  if (*(_DWORD *)(v2 + 212) == 3)
  {
    BOOL v12 = 0;
    if (mt_ServiceGetBoolProperty(*(_DWORD *)(v2 + 16), @"FramePumperPresent", &v12) || !v12)
    {
      CFRelease((CFTypeRef)v2);
      uint64_t v2 = 0;
    }
  }
  CFNumberRef v9 = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"Multitouch Subdevice ID", v4, 0);
  if (v9)
  {
    CFNumberRef v10 = v9;
    CFNumberGetValue(v9, kCFNumberSInt8Type, (void *)(v2 + 2152));
    CFRelease(v10);
  }
  return v2;
}

uint64_t MTDeviceGetGUID(uint64_t a1, _DWORD *a2)
{
  if (!a1) {
    return 3758097090;
  }
  if (*(unsigned char *)(a1 + 133)) {
    mt_CachePropertiesForDevice(a1);
  }
  uint64_t result = 0;
  *a2 = *(void *)(a1 + 64);
  return result;
}

CFStringRef mt_CreateSavedNameForDevice(uint64_t a1)
{
  if (!a1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = 0;
    return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"0x%016qX,0x%x", v3, v2);
  }
  if (!*(unsigned char *)(a1 + 133))
  {
    uint64_t v2 = *(unsigned int *)(a1 + 72);
    goto LABEL_8;
  }
  mt_CachePropertiesForDevice(a1);
  uint64_t v2 = *(unsigned int *)(a1 + 72);
  if (!*(unsigned char *)(a1 + 133))
  {
LABEL_8:
    uint64_t v3 = *(void *)(a1 + 64);
    goto LABEL_9;
  }
  mt_CachePropertiesForDevice(a1);
  uint64_t v3 = *(void *)(a1 + 64);
  if (*(unsigned char *)(a1 + 133)) {
    mt_CachePropertiesForDevice(a1);
  }
LABEL_9:
  unsigned int v4 = *(_DWORD *)(a1 + 216);
  if (v4 <= 6 && ((1 << v4) & 0x68) != 0) {
    return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"0x%016qX", v3);
  }
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"0x%016qX,0x%x", v3, v2);
}

uint64_t MTDeviceGetFamilyID(uint64_t a1, _DWORD *a2)
{
  uint64_t result = 3758097090;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a1 + 133)) {
      mt_CachePropertiesForDevice(a1);
    }
    uint64_t result = 0;
    *a2 = *(_DWORD *)(a1 + 72);
  }
  return result;
}

uint64_t MTDeviceGetDeviceID(uint64_t a1, void *a2)
{
  uint64_t result = 3758097090;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a1 + 133)) {
      mt_CachePropertiesForDevice(a1);
    }
    uint64_t result = 0;
    *a2 = *(void *)(a1 + 64);
  }
  return result;
}

uint64_t MTDeviceGetTransportMethod(uint64_t a1, _DWORD *a2)
{
  uint64_t result = 3758097090;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a1 + 133)) {
      mt_CachePropertiesForDevice(a1);
    }
    uint64_t result = 0;
    *a2 = *(_DWORD *)(a1 + 216);
  }
  return result;
}

const void *MTDeviceCreateDefault()
{
  List = MTDeviceCreateList();
  if (List)
  {
    CFArrayRef v1 = List;
    if (CFArrayGetCount(List) < 1)
    {
      ValueAtIndex = 0;
      goto LABEL_21;
    }
    CFStringRef v2 = (const __CFString *)CFPreferencesCopyAppValue(@"DefaultDevice", @"com.apple.MultitouchSupport");
    CFArrayRef v3 = (const __CFArray *)CFPreferencesCopyAppValue(@"DisabledDevices", @"com.apple.MultitouchSupport");
    CFArrayRef v4 = v3;
    if (v2)
    {
      if (v3)
      {
        v18.length = CFArrayGetCount(v3);
        v18.location = 0;
        if (CFArrayContainsValue(v4, v18, v2))
        {
          puts("(the specified Default device is Disabled)");
          ValueAtIndex = 0;
LABEL_18:
          CFRelease(v2);
          goto LABEL_19;
        }
      }
      if (CFArrayGetCount(v1) >= 1)
      {
        CFIndex v6 = 0;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v1, v6);
          CFStringRef SavedNameForDevice = mt_CreateSavedNameForDevice((uint64_t)ValueAtIndex);
          if (CFStringCompare(v2, SavedNameForDevice, 1uLL))
          {
            CFRelease(SavedNameForDevice);
          }
          else
          {
            CFRetain(ValueAtIndex);
            CFRelease(SavedNameForDevice);
            if (ValueAtIndex) {
              goto LABEL_17;
            }
          }
          ++v6;
        }
        while (CFArrayGetCount(v1) > v6);
      }
      puts("(the specified Default device could not be found)");
LABEL_16:
      ValueAtIndex = 0;
LABEL_17:
      if (v2) {
        goto LABEL_18;
      }
    }
    else
    {
      if (v3 && CFArrayGetCount(v3))
      {
        if (CFArrayGetCount(v1) < 1)
        {
          ValueAtIndex = 0;
          goto LABEL_20;
        }
        CFIndex v9 = 0;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v1, v9);
          CFStringRef v10 = mt_CreateSavedNameForDevice((uint64_t)ValueAtIndex);
          v19.length = CFArrayGetCount(v4);
          v19.location = 0;
          io_registry_entry_t v11 = CFArrayContainsValue(v4, v19, v10) ? 0 : ValueAtIndex;
          int v12 = v11[2152];
          CFRelease(v10);
          if (!v12 && v11 != 0) {
            break;
          }
          if (CFArrayGetCount(v1) <= ++v9) {
            goto LABEL_16;
          }
        }
        long long v17 = v11;
      }
      else
      {
        CFIndex Count = CFArrayGetCount(v1);
        if (Count < 1)
        {
          ValueAtIndex = 0;
          goto LABEL_19;
        }
        CFIndex v15 = Count;
        CFIndex v16 = 0;
        while (1)
        {
          long long v17 = CFArrayGetValueAtIndex(v1, v16);
          if (!v17[2152]) {
            break;
          }
          if (++v16 >= v15) {
            goto LABEL_16;
          }
        }
        ValueAtIndex = v17;
      }
      CFRetain(v17);
    }
LABEL_19:
    if (v4) {
LABEL_20:
    }
      CFRelease(v4);
LABEL_21:
    CFRelease(v1);
    return ValueAtIndex;
  }
  return 0;
}

_DWORD *MTDeviceCreateFromGUID(int a1)
{
  List = MTDeviceCreateList();
  if (!List) {
    return 0;
  }
  CFArrayRef v3 = List;
  CFIndex Count = CFArrayGetCount(List);
  if (Count < 1)
  {
LABEL_9:
    int v8 = 0;
  }
  else
  {
    CFIndex v5 = Count;
    CFIndex v6 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v3, v6);
      if (ValueAtIndex)
      {
        int v8 = ValueAtIndex;
        if (*((unsigned char *)ValueAtIndex + 133)) {
          mt_CachePropertiesForDevice((uint64_t)ValueAtIndex);
        }
        if (v8[16] == a1) {
          break;
        }
      }
      if (v5 == ++v6) {
        goto LABEL_9;
      }
    }
    CFRetain(v8);
  }
  CFRelease(v3);
  return v8;
}

uint64_t mt_DeviceCreateFromDeviceID(uint64_t a1, int a2)
{
  uint64_t valuePtr = a1;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  if (v4)
  {
    CFNumberRef v5 = v4;
    io_iterator_t existing = 0;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v3, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (Mutable)
    {
      CFTypeID v7 = Mutable;
      int v8 = CFDictionaryCreateMutable(v3, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (v8)
      {
        CFIndex v9 = v8;
        CFDictionarySetValue(v8, @"Multitouch ID", v5);
        if (a2) {
          CFDictionarySetValue(v9, @"MTHIDDevice", (const void *)*MEMORY[0x263EFFB40]);
        }
        CFDictionarySetValue(v7, @"IOPropertyMatch", v9);
        CFRelease(v9);
        if (!IOServiceGetMatchingServices(0, v7, &existing))
        {
          while (1)
          {
            io_object_t v12 = IOIteratorNext(existing);
            if (!v12) {
              break;
            }
            io_object_t v10 = v12;
            uint64_t v11 = MTDeviceCreateFromService(v12);
            IOObjectRelease(v10);
            if (v11) {
              goto LABEL_11;
            }
          }
          uint64_t v11 = 0;
LABEL_11:
          IOObjectRelease(existing);
          goto LABEL_15;
        }
      }
      else
      {
        CFRelease(v7);
      }
    }
    uint64_t v11 = 0;
LABEL_15:
    CFRelease(v5);
    return v11;
  }
  return 0;
}

uint64_t MTDeviceCreateFromDeviceID(uint64_t a1)
{
  return mt_DeviceCreateFromDeviceID(a1, 0);
}

uint64_t mt_DeviceGetBoolProperty(uint64_t a1, const __CFString *a2, BOOL *a3)
{
  if (a1 && a2 && a3) {
    return mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), a2, a3);
  }
  else {
    return 3758097090;
  }
}

void MTDeviceRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

BOOL MTDeviceIsAvailable()
{
  Default = MTDeviceCreateDefault();
  CFArrayRef v1 = Default;
  if (Default) {
    CFRelease(Default);
  }
  return v1 != 0;
}

uint64_t mt_ParseExternalMessageIDs(uint64_t a1, CFTypeRef cf)
{
  CFTypeID v4 = CFGetTypeID(cf);
  uint64_t result = CFArrayGetTypeID();
  if (v4 == result)
  {
    uint64_t result = CFArrayGetCount((CFArrayRef)cf);
    if (result <= 7)
    {
      uint64_t v6 = result;
      if (result < 1)
      {
LABEL_8:
        *(unsigned char *)(a1 + 5655) = v6;
      }
      else
      {
        CFIndex v7 = 0;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)cf, v7);
          CFTypeID v9 = CFGetTypeID(ValueAtIndex);
          uint64_t result = CFNumberGetTypeID();
          if (v9 != result) {
            break;
          }
          uint64_t result = CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberSInt8Type, (void *)(a1 + 5648 + v7));
          if (!result) {
            break;
          }
          if (v6 == ++v7) {
            goto LABEL_8;
          }
        }
      }
    }
  }
  return result;
}

void mt_CachePropertiesForDevice(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  if (a1)
  {
    int v53 = 0;
    CFStringRef v2 = *(const void **)(a1 + 152);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(a1 + 152) = 0;
    }
    *(unsigned char *)(a1 + 2232) = 1;
    CFAllocatorRef v3 = (uint64_t *)(a1 + 64);
    if (mt_ServiceGetInt64Property(*(_DWORD *)(a1 + 16), @"Multitouch ID", (void *)(a1 + 64))) {
      uint64_t *v3 = 0;
    }
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), @"Family ID", (_DWORD *)(a1 + 72))) {
      *(_DWORD *)(a1 + 72) = 0;
    }
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), @"bcdVersion", (_DWORD *)(a1 + 76))) {
      *(_DWORD *)(a1 + 76) = 0;
    }
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), @"ExpectedVersion", (_DWORD *)(a1 + 80))) {
      *(_DWORD *)(a1 + 80) = 0;
    }
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), @"Sensor Rows", (_DWORD *)(a1 + 84))) {
      *(_DWORD *)(a1 + 84) = 0;
    }
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), @"Sensor Columns", (_DWORD *)(a1 + 88))) {
      *(_DWORD *)(a1 + 88) = 0;
    }
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), @"Endianness", (_DWORD *)(a1 + 100))) {
      *(_DWORD *)(a1 + 100) = 1;
    }
    CFTypeID v4 = (_DWORD *)(a1 + 92);
    int Int32Property = mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), @"Sensor Surface Width", (_DWORD *)(a1 + 92));
    BOOL v6 = Int32Property != 0;
    if (Int32Property) {
      *CFTypeID v4 = 5000;
    }
    CFIndex v7 = (_DWORD *)(a1 + 96);
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), @"Sensor Surface Height", (_DWORD *)(a1 + 96)))
    {
      *CFIndex v7 = 7500;
      BOOL v6 = 1;
    }
    uint64_t v52 = 0;
    if (!mt_ServiceGetStringProperty(*(_DWORD *)(a1 + 16), @"Multitouch Serial Number", &v52))
    {
      uint64_t v8 = v52;
      if (v52)
      {
        CFTypeID v9 = *(const void **)(a1 + 104);
        if (v9)
        {
          CFRelease(v9);
          uint64_t v8 = v52;
        }
        *(void *)(a1 + 104) = v8;
      }
    }
    BOOL v51 = 0;
    int BoolProperty = mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), @"Driver is Ready", &v51);
    BOOL v11 = v51;
    if (BoolProperty) {
      BOOL v11 = 1;
    }
    *(unsigned char *)(a1 + 134) = v11;
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), @"parser-type", (_DWORD *)(a1 + 2072))) {
      *(_DWORD *)(a1 + 2072) = 0;
    }
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), @"parser-options", (_DWORD *)(a1 + 2076))) {
      *(_DWORD *)(a1 + 2076) = 0;
    }
    BOOL v50 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), @"MTHIDDevice", &v50)) {
      *(unsigned char *)(a1 + 2080) = v50;
    }
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), @"touch-size-id", (_DWORD *)(a1 + 2084))) {
      *(_DWORD *)(a1 + 2084) = 0;
    }
    BOOL v49 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), @"MT Built-In", &v49)) {
      *(unsigned char *)(a1 + 2088) = v49;
    }
    BOOL v48 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), @"MaintainPowerInUILock", &v48)) {
      *(unsigned char *)(a1 + 114) = v48;
    }
    BOOL v47 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), @"PowerControlSupported", &v47)) {
      *(unsigned char *)(a1 + 115) = v47;
    }
    BOOL v46 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), @"SupportTapToWake", &v46)) {
      *(unsigned char *)(a1 + 116) = v46;
    }
    BOOL v45 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), @"SupportTouchReadyNotification", &v45)) {
      *(unsigned char *)(a1 + 117) = v45;
    }
    BOOL v44 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), @"ShouldSkipFaceDetectionMode", &v44)) {
      *(unsigned char *)(a1 + 129) = v44;
    }
    BOOL v43 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), @"FirstPowerOffSuppressed", &v43)) {
      *(unsigned char *)(a1 + 119) = v43;
    }
    int v42 = 0;
    if (!mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), @"SATelemetryReportID", &v42)) {
      *(unsigned char *)(a1 + 5677) = v42;
    }
    BOOL v41 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), @"ContextualPower", &v41)) {
      *(unsigned char *)(a1 + 118) = v41;
    }
    int v40 = 0;
    if (!mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), @"ResetOnLockMs", &v40)) {
      *(_DWORD *)(a1 + 120) = v40;
    }
    int v39 = 0;
    if (!mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), @"ResetOnUnlockMs", &v39)) {
      *(_DWORD *)(a1 + 124) = v39;
    }
    BOOL v38 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), @"ShouldResetOnButton", &v38)) {
      *(unsigned char *)(a1 + 128) = v38;
    }
    BOOL v37 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), @"AlwaysNeedsVelocityCalculated", &v37)) {
      *(unsigned char *)(a1 + 130) = v37;
    }
    BOOL v36 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), @"ShouldDispatchNormalizedVelocity", &v36)) {
      *(unsigned char *)(a1 + 131) = v36;
    }
    BOOL v35 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), @"ShouldDispatchRelativeCoordinates", &v35))*(unsigned char *)(a1 + 132) = v35; {
    BOOL v34 = 0;
    }
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), @"ActuationSupported", &v34)) {
      *(unsigned char *)(a1 + 24) = v34;
    }
    BOOL v33 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), @"ForceSupported", &v33)) {
      *(unsigned char *)(a1 + 40) = v33;
    }
    BOOL v32 = 0;
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), @"WirelessChargingNotificationSupported", &v32))*(unsigned char *)(a1 + 42) = v32; {
    BOOL v31 = 0;
    }
    if (!mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), @"USBChargingNotificationSupported", &v31)) {
      *(unsigned char *)(a1 + 43) = v31;
    }
    CFTypeRef cf = 0;
    if (!mt_DeviceCopyArrayProperty(a1, @"ExternalMessageIDs", &cf) && cf)
    {
      mt_ParseExternalMessageIDs(a1, cf);
      CFRelease(cf);
    }
    if (mt_ServiceCFPropertyExists(*(_DWORD *)(a1 + 16), @"SupportsSilentClick")
      && mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), @"SupportsSilentClick", (BOOL *)(a1 + 41)))
    {
      *(unsigned char *)(a1 + 41) = 0;
    }
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), @"MinDigitizerPressureValue", (_DWORD *)(a1 + 44)))*(_DWORD *)(a1 + 44) = 0; {
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), @"AccurateMaxDigitizerPressureValue", (_DWORD *)(a1 + 48)))*(_DWORD *)(a1 + 48) = 0;
    }
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), @"ExtendedMaxDigitizerPressureValue", (_DWORD *)(a1 + 52)))*(_DWORD *)(a1 + 52) = 0; {
    if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), @"MaxHoverHeight", (_DWORD *)(a1 + 56)))
    }
      *(_DWORD *)(a1 + 56) = 0;
    long long v29 = 0;
    int v28 = 0;
    long long v27 = 0;
    int v26 = 0;
    long long v25 = 0;
    int v24 = 0;
    mt_ServiceGetDataProperty(*(_DWORD *)(a1 + 16), @"Sensor Region Descriptor", (UInt8 **)&v29, &v28);
    MTParseSensorRegionsReport((unsigned __int8 *)v29, v28, (char *)(a1 + 220), 20);
    mt_ServiceGetDataProperty(*(_DWORD *)(a1 + 16), @"Sensor Surface Descriptor", (UInt8 **)&v25, &v24);
    if (MTParseSensorSurfaceDescriptor((uint64_t)v25, v24, a1 + 368, a1))
    {
      if (v6) {
        *(void *)CFTypeID v4 = *(void *)(a1 + 368);
      }
    }
    else
    {
      *(void *)(a1 + 368) = *(void *)(a1 + 92);
      *(void *)(a1 + 376) = 0;
    }
    mt_ServiceGetDataProperty(*(_DWORD *)(a1 + 16), @"Sensor Region Param", (UInt8 **)&v27, &v26);
    if ((MTParseSensorRegionParam((unsigned __int16 *)v27, v26, (_WORD *)(a1 + 360), a1) & 1) == 0)
    {
      *(_DWORD *)(a1 + 360) = 0;
      *(_WORD *)(a1 + 364) = 255;
    }
    if (v29) {
      free(v29);
    }
    if (v27) {
      free(v27);
    }
    if (v25) {
      free(v25);
    }
    if (!mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), @"WANTS_FRAMES_IGNORED", &v53))
    {
      if (CFPreferencesGetAppBooleanValue(@"NoBrick", @"com.apple.MultitouchSupport", 0))
      {
        *(unsigned char *)(a1 + 135) = 0;
      }
      else
      {
        *(unsigned char *)(a1 + 135) = 1;
        puts("Multitouch: Ignoring frames from device!");
      }
    }
    if (CFPreferencesGetAppBooleanValue(@"BrickDevice", @"com.apple.MultitouchSupport", 0) == 1)
    {
      *(unsigned char *)(a1 + 135) = 1;
      puts("Multitouch: Ignoring frames from device!");
    }
    long long v23 = 0;
    int v22 = 0;
    if (!mt_ServiceGetDataProperty(*(_DWORD *)(a1 + 16), @"AnimationThresholds", (UInt8 **)&v23, &v22))
    {
      io_object_t v12 = v23;
      if (v22 == 20)
      {
        long long v13 = *(_OWORD *)v23;
        *(_DWORD *)(a1 + 2172) = *((_DWORD *)v23 + 4);
        *(_OWORD *)(a1 + 2156) = v13;
      }
      free(v12);
    }
    long long v23 = 0;
    int v22 = 0;
    if (!mt_ServiceGetDataProperty(*(_DWORD *)(a1 + 16), @"ActivationThresholds", (UInt8 **)&v23, &v22))
    {
      CFIndex v14 = v23;
      if (v22 == 20)
      {
        long long v15 = *(_OWORD *)v23;
        *(_DWORD *)(a1 + 2192) = *((_DWORD *)v23 + 4);
        *(_OWORD *)(a1 + 2176) = v15;
      }
      free(v14);
    }
    uint64_t v21 = 0;
    if (!mt_DeviceCopyDictionaryProperty(a1, @"MultipleFirmwaresConfig", &v21))
    {
      CFIndex v16 = *(const void **)(a1 + 5680);
      if (v16) {
        CFRelease(v16);
      }
      *(void *)(a1 + 5680) = v21;
    }
    *(unsigned char *)(a1 + 133) = 0;
    if (v6)
    {
      long long v17 = MTLoggingFramework();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *v4;
        uint64_t v19 = *v7;
        uint64_t v20 = *v3;
        *(_DWORD *)buf = 134218496;
        uint64_t v55 = v18;
        __int16 v56 = 2048;
        uint64_t v57 = v19;
        __int16 v58 = 2048;
        uint64_t v59 = v20;
        _os_log_impl(&dword_2262CF000, v17, OS_LOG_TYPE_ERROR, "Sensor Surface dimensions not provided. Using defaults or getting from descriptor (%lu x %lu) (deviceID 0x%llX)", buf, 0x20u);
      }
    }
  }
}

void mt_TerminateAlgorithmsForDevice(uint64_t a1)
{
  if (a1)
  {
    CFStringRef v2 = *(const void **)(a1 + 152);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(a1 + 152) = 0;
    }
    *(unsigned char *)(a1 + 2232) = 1;
  }
}

uint64_t mt_DeviceGetInt64Property(uint64_t a1, const __CFString *a2, void *a3)
{
  if (a1 && a2 && a3) {
    return mt_ServiceGetInt64Property(*(_DWORD *)(a1 + 16), a2, a3);
  }
  else {
    return 3758097090;
  }
}

uint64_t mt_DeviceGetInt32Property(uint64_t a1, const __CFString *a2, _DWORD *a3)
{
  if (a1 && a2 && a3) {
    return mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), a2, a3);
  }
  else {
    return 3758097090;
  }
}

uint64_t mt_DeviceGetStringProperty(uint64_t a1, const __CFString *a2, void *a3)
{
  if (a1 && a2 && a3) {
    return mt_ServiceGetStringProperty(*(_DWORD *)(a1 + 16), a2, a3);
  }
  else {
    return 3758097090;
  }
}

uint64_t mt_DeviceCopyArrayProperty(uint64_t a1, const __CFString *a2, void *a3)
{
  uint64_t result = 3758097090;
  if (a1)
  {
    if (a3)
    {
      if (a2)
      {
        io_registry_entry_t v6 = *(_DWORD *)(a1 + 16);
        if (v6)
        {
          CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v6, a2, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
          *a3 = 0;
          if (CFProperty)
          {
            uint64_t v8 = CFProperty;
            CFTypeID v9 = CFGetTypeID(CFProperty);
            if (v9 == CFArrayGetTypeID())
            {
              uint64_t result = 0;
              *a3 = v8;
              return result;
            }
            CFRelease(v8);
          }
          return 3758097084;
        }
      }
    }
  }
  return result;
}

uint64_t mt_DeviceCFPropertyExists(uint64_t a1, const __CFString *a2)
{
  if (a1 && a2) {
    return mt_ServiceCFPropertyExists(*(_DWORD *)(a1 + 16), a2);
  }
  else {
    return 0;
  }
}

uint64_t mt_DeviceGetSensorRegionDescriptor(uint64_t a1, UInt8 **a2, _DWORD *a3)
{
  if (a1 && a2 && a3) {
    return mt_ServiceGetDataProperty(*(_DWORD *)(a1 + 16), @"Sensor Region Descriptor", a2, a3);
  }
  else {
    return 3758097090;
  }
}

uint64_t mt_DeviceGetSensorSurfaceDescriptor(uint64_t a1, UInt8 **a2, _DWORD *a3)
{
  if (a1 && a2 && a3) {
    return mt_ServiceGetDataProperty(*(_DWORD *)(a1 + 16), @"Sensor Surface Descriptor", a2, a3);
  }
  else {
    return 3758097090;
  }
}

uint64_t mt_DeviceGetSensorRegionParam(uint64_t a1, UInt8 **a2, _DWORD *a3)
{
  if (a1 && a2 && a3) {
    return mt_ServiceGetDataProperty(*(_DWORD *)(a1 + 16), @"Sensor Region Param", a2, a3);
  }
  else {
    return 3758097090;
  }
}

uint64_t mt_DeviceGetDataProperty(uint64_t a1, const __CFString *a2, UInt8 **a3, _DWORD *a4)
{
  if (a1 && a2 && a3 && a4) {
    return mt_ServiceGetDataProperty(*(_DWORD *)(a1 + 16), a2, a3, a4);
  }
  else {
    return 3758097090;
  }
}

uint64_t mt_DeviceCopyDictionaryProperty(uint64_t a1, const __CFString *a2, void *a3)
{
  uint64_t result = 3758097090;
  if (a1 && a2 && a3)
  {
    io_registry_entry_t v6 = *(_DWORD *)(a1 + 16);
    if (v6)
    {
      CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v6, a2, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
      *a3 = 0;
      if (CFProperty)
      {
        uint64_t v8 = CFProperty;
        CFTypeID v9 = CFGetTypeID(CFProperty);
        if (v9 == CFDictionaryGetTypeID())
        {
          uint64_t result = 0;
          *a3 = v8;
          return result;
        }
        CFRelease(v8);
      }
      return 3758097084;
    }
    else
    {
      return 3758097090;
    }
  }
  return result;
}

uint64_t MTDeviceStart(uint64_t a1, int a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = 3758097090;
  if (a1)
  {
    if (*(_DWORD *)(a1 + 20))
    {
      return 3758097109;
    }
    else
    {
      *(_DWORD *)(a1 + 160) = a2;
      if ((a2 & 0x10000000) != 0) {
        gMT_BE_LESS_VERBOSE = 1;
      }
      if (*(unsigned char *)(a1 + 133)) {
        mt_CachePropertiesForDevice(a1);
      }
      if (!*(_DWORD *)(a1 + 72) && (*(unsigned char *)(a1 + 163) & 0x40) == 0)
      {
        MTDeviceForcePropertiesRecache((io_service_t *)a1);
        mt_CachePropertiesForDevice(a1);
        if (!*(_DWORD *)(a1 + 72))
        {
          if (*(unsigned char *)(a1 + 133)) {
            mt_CachePropertiesForDevice(a1);
          }
          CFTypeID v4 = MTLoggingFramework();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
          {
            uint64_t v5 = *(void *)(a1 + 64);
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v5;
            _os_log_impl(&dword_2262CF000, v4, OS_LOG_TYPE_ERROR, "familyID is invalid, even after AMD re-fetching properties (deviceID 0x%llX)", buf, 0xCu);
          }
        }
      }
      io_connect_t connect = 0;
      *(void *)buf = 5;
      if (IOServiceWaitQuiet(*(_DWORD *)(a1 + 16), (mach_timespec_t *)buf) == -536870186) {
        printf("MT Error: service still busy after %d seconds\n", *(_DWORD *)buf);
      }
      if (*(_DWORD *)(a1 + 212) == 4) {
        uint32_t v6 = (*(unsigned __int8 *)(a1 + 163) << 25 >> 31) & 0x464C5452;
      }
      else {
        uint32_t v6 = 0;
      }
      uint64_t v2 = IOServiceOpen(*(_DWORD *)(a1 + 16), *MEMORY[0x263EF8960], v6, &connect);
      if (!v2)
      {
        *(_DWORD *)(a1 + 20) = connect;
        if (!*(void *)(a1 + 152)) {
          mt_InitializeAlgorithmsForDevice(a1, v7, v8, v9, v10, v11, v12, v13);
        }
        int v14 = *(_DWORD *)(a1 + 160);
        if ((v14 & 1) == 0)
        {
          *(unsigned char *)(a1 + 2040) = 0;
          if ((v14 & 0x20000000) == 0)
          {
            *(_DWORD *)(a1 + 160) = v14 | 0x20000000;
            pthread_t v17 = 0;
            long long v15 = (CFTypeRef *)malloc_type_calloc(0x10uLL, 1uLL, 0xCB32A5F7uLL);
            *long long v15 = (CFTypeRef)a1;
            v15[1] = MTDeviceCreateMultitouchRunLoopSource((__CFMachPort *)a1);
            CFRetain((CFTypeRef)a1);
            if (pthread_create(&v17, 0, (void *(__cdecl *)(void *))mt_ThreadedMTEntry, v15))
            {
              CFRelease(*v15);
              CFRelease(v15[1]);
              free(v15);
            }
          }
        }
      }
    }
  }
  return v2;
}

BOOL MTDeviceIsRunning(BOOL result)
{
  if (result) {
    return *(_DWORD *)(result + 20) != 0;
  }
  return result;
}

uint64_t MTDeviceForcePropertiesRecache(io_service_t *a1)
{
  uint64_t v1 = 3758097090;
  if (a1)
  {
    io_service_t v3 = a1[53];
    if (v3)
    {
      if (v3 != 4 && v3 != 1) {
        return 3758097095;
      }
      uint32_t v5 = 9;
    }
    else
    {
      uint32_t v5 = 22;
    }
    mach_port_t v6 = a1[5];
    if (v6)
    {
      outputCnt[0] = 0;
      return IOConnectCallScalarMethod(v6, v5, 0, 0, 0, outputCnt);
    }
    else
    {
      io_connect_t connect = 0;
      *(void *)outputCnt = 5;
      if (IOServiceWaitQuiet(a1[4], (mach_timespec_t *)outputCnt) == -536870186) {
        printf("MT Error: service still busy after %d seconds\n", outputCnt[0]);
      }
      uint64_t v1 = IOServiceOpen(a1[4], *MEMORY[0x263EF8960], 0, &connect);
      if (!v1)
      {
        uint32_t v8 = 0;
        uint64_t v1 = IOConnectCallScalarMethod(connect, v5, 0, 0, 0, &v8);
      }
      IOServiceClose(connect);
    }
  }
  return v1;
}

uint64_t mt_InitializeAlgorithmsForDevice(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    uint64_t v8 = result;
    uint64_t result = mtalg_CreateAlgLibraryForDevice(result, *(unsigned int *)(result + 84), *(_DWORD *)(result + 88), *(unsigned int *)(result + 72), result + 220, 20, *(__int16 *)(result + 364), a8, *(void *)(result + 368), *(void *)(result + 376));
    *(void *)(v8 + 152) = result;
  }
  return result;
}

CFMachPortRef MTDeviceCreateMultitouchRunLoopSource(__CFMachPort *a1)
{
  CFMachPortRef result = MTDeviceCreateMultitouchMachPort(a1);
  if (result)
  {
    uint64_t v2 = result;
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    return CFMachPortCreateRunLoopSource(v3, v2, 0);
  }
  return result;
}

void mt_ThreadedMTEntry(void *a1)
{
  uint64_t v2 = (void *)*a1;
  CFAllocatorRef v3 = (__CFRunLoopSource *)a1[1];
  v2[256] = CFRunLoopGetCurrent();
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, v3, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
  CFRelease(v3);
  CFRunLoopRun();
  CFRelease(v2);
  free(a1);
}

uint64_t MTDeviceStop(uint64_t a1)
{
  uint64_t result = 3758097090;
  if (a1)
  {
    if (*(_DWORD *)(a1 + 20))
    {
      if (*(void *)(a1 + 2032)) {
        mt_DeviceUnregisterForHotplugNotifications(a1);
      }
      *(unsigned char *)(a1 + 2040) = 1;
      if (*(void *)(a1 + 2048))
      {
        Current = CFRunLoopGetCurrent();
        CFTypeID v4 = *(__CFRunLoop **)(a1 + 2048);
        if (Current == v4)
        {
          CFRunLoopStop(Current);
        }
        else
        {
          uint64_t v9 = 0;
          uint64_t v10 = &v9;
          uint64_t v11 = 0x2000000000;
          char v12 = 0;
          uint32_t v5 = (const void *)*MEMORY[0x263EFFE78];
          v8[0] = MEMORY[0x263EF8330];
          v8[1] = 0x40000000;
          v8[2] = __MTDeviceStop_block_invoke;
          v8[3] = &unk_26479B260;
          v8[4] = &v9;
          v8[5] = a1;
          CFRunLoopPerformBlock(v4, v5, v8);
          CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 2048));
          while (!*((unsigned char *)v10 + 24))
            usleep(0x3E8u);
          _Block_object_dispose(&v9, 8);
        }
        *(void *)(a1 + 2048) = 0;
      }
      if (*(void *)(a1 + 2016))
      {
        mt_StopDequeueOfMultitouchDataFromDevice(a1);
        *(void *)(a1 + 2016) = 0;
      }
      uint64_t v6 = *(unsigned int *)(a1 + 20);
      if (*(void *)(a1 + 2200))
      {
        MEMORY[0x22A64C330](v6, 0, *MEMORY[0x263EF8960]);
        *(void *)(a1 + 2200) = 0;
        *(void *)(a1 + 2208) = 0;
        LODWORD(v6) = *(_DWORD *)(a1 + 20);
      }
      if (v6)
      {
        IOServiceClose(v6);
        *(_DWORD *)(a1 + 20) = 0;
      }
      if (*(unsigned char *)(a1 + 2096)) {
        MTDeviceEndRecording(a1);
      }
      uint64_t v7 = *(const void **)(a1 + 152);
      if (v7)
      {
        CFRelease(v7);
        *(void *)(a1 + 152) = 0;
      }
      uint64_t result = 0;
      *(unsigned char *)(a1 + 2232) = 1;
      *(_WORD *)(a1 + 133) = 1;
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

void mt_DeviceUnregisterForHotplugNotifications(uint64_t a1)
{
  uint64_t v2 = *(__CFRunLoopSource **)(a1 + 2032);
  if (v2)
  {
    CFRunLoopSourceInvalidate(v2);
    CFRelease(*(CFTypeRef *)(a1 + 2032));
    *(void *)(a1 + 2032) = 0;
  }
}

void __MTDeviceStop_block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

CFMachPortRef MTDeviceCreateMultitouchMachPort(CFMachPortRef result)
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    if (*((_DWORD *)result + 5)
      && *((_DWORD *)result + 4)
      && !*((void *)result + 252)
      && (*((unsigned char *)result + 163) & 0x20) != 0)
    {
      unsigned int MaxPacketSizeByKey = _MTDeviceGetMaxPacketSizeByKey((uint64_t)result, @"Max Injection Packet Size", 0);
      unsigned int v3 = _MTDeviceGetMaxPacketSizeByKey(v1, @"Max Packet Size", 4096);
      if (MaxPacketSizeByKey > v3) {
        unsigned int v3 = MaxPacketSizeByKey;
      }
      *(_DWORD *)(v1 + 384) = v3;
      if (*(void *)(v1 + 392))
      {
        ParsedMultitouchFrameRepDestroy(*(void **)(v1 + 392));
        unsigned int v3 = *(_DWORD *)(v1 + 384);
      }
      *(void *)(v1 + 392) = MT_ParsedMultitouchFrameRepCreate(v3);
      CFTypeID v4 = (unsigned int *)malloc_type_malloc(0x28uLL, 0x1030040C0747FF5uLL);
      *(_OWORD *)CFTypeID v4 = 0u;
      *((_OWORD *)v4 + 1) = 0u;
      *((void *)v4 + 4) = 0;
      uint32_t v5 = malloc_type_malloc(*(unsigned int *)(v1 + 384), 0xB32D588uLL);
      *(void *)(v1 + 136) = v5;
      *(void *)CFTypeID v4 = v1;
      *((void *)v4 + 1) = v5;
      v4[4] = *(_DWORD *)(v1 + 20);
      context.version = 0;
      context.info = v4;
      memset(&context.retain, 0, 24);
      if (v5)
      {
        bzero(v5, *(unsigned int *)(v1 + 384));
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t NotificationPort = IODataQueueAllocateNotificationPort();
        uint64_t v7 = (ipc_space_t *)MEMORY[0x263EF8960];
        if (NotificationPort)
        {
          if (MEMORY[0x22A64C320](v4[4], 0, NotificationPort, 0))
          {
            printf("IOConnectSetNotificationPort returned %d\n");
          }
          else if (MEMORY[0x22A64C300](v4[4], 0, *v7, &v13, &v12, 1))
          {
            printf("IOConnectMapMemory returned %d\n");
          }
          else
          {
            uint64_t v8 = v12;
            *((void *)v4 + 3) = v13;
            *((void *)v4 + 4) = v8;
            if ((*(unsigned char *)(v1 + 160) & 1) != 0
              || ((input = 1, outputCnt = 0, *(_DWORD *)(v1 + 212)) ? (uint32_t v9 = 0) : (uint32_t v9 = 21),
                  !IOConnectCallScalarMethod(v4[4], v9, &input, 1u, 0, &outputCnt)))
            {
              LOBYTE(input) = -86;
              uint64_t result = CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x263EFFB08], NotificationPort, (CFMachPortCallBack)mt_DequeueMultitouchDataMachPortCallBack, &context, (Boolean *)&input);
              if (input == 1)
              {
                printf("CFMachPortCreateWithPort returned a re-used CFMachPort for port %d\n");
              }
              else if (result)
              {
                *(void *)(v1 + 2016) = result;
                return result;
              }
            }
            else
            {
              printf("IOConnectMethodScalarIScalarO/IOConnectCallScalarMethod returned %d\n");
            }
          }
        }
        else
        {
          puts("IODataQueueAllocateNotificationPort returned a NULL mach_port_t");
        }
        free(v4);
        mach_port_mod_refs(*v7, NotificationPort, 1u, -1);
      }
    }
    return 0;
  }
  return result;
}

uint64_t MTDeviceGetMaxPacketSize(uint64_t a1)
{
  unsigned int MaxPacketSizeByKey = _MTDeviceGetMaxPacketSizeByKey(a1, @"Max Injection Packet Size", 0);
  LODWORD(result) = _MTDeviceGetMaxPacketSizeByKey(a1, @"Max Packet Size", 4096);
  if (MaxPacketSizeByKey <= result) {
    return result;
  }
  else {
    return MaxPacketSizeByKey;
  }
}

NSObject *MTDeviceCreateMultitouchDispatchSource(__CFMachPort *a1, NSObject *a2)
{
  MultitouchMachmach_port_t Port = MTDeviceCreateMultitouchMachPort(a1);
  if (!MultitouchMachPort) {
    return 0;
  }
  mach_port_t Port = CFMachPortGetPort(MultitouchMachPort);
  uint64_t v6 = dispatch_source_create(MEMORY[0x263EF83C8], Port, 0, a2);
  uint64_t v7 = v6;
  if (v6)
  {
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = __MTDeviceCreateMultitouchDispatchSource_block_invoke;
    handler[3] = &__block_descriptor_tmp_178;
    handler[4] = a1;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v7);
  }
  return v7;
}

void __MTDeviceCreateMultitouchDispatchSource_block_invoke(uint64_t a1)
{
  mach_msg_return_t v6;
  mach_msg_return_t v7;
  long long v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  NSObject *v15;
  CFMachPortContext v16;
  uint64_t v17;

  pthread_t v17 = *MEMORY[0x263EF8340];
  CFRetain(*(CFTypeRef *)(a1 + 32));
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  unsigned int v3 = 92;
  for (CFIndex i = (mach_msg_header_t *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], 92, 0);
        ;
        CFIndex i = (mach_msg_header_t *)CFAllocatorReallocate(v2, i, v3, 0))
  {
    i->msgh_bits = 0;
    i->msgh_size = v3;
    mach_port_t Port = CFMachPortGetPort(*(CFMachPortRef *)(*(void *)(a1 + 32) + 2016));
    i->msgh_remote_port = 0;
    i->msgh_local_port = Port;
    i->msgh_id = 0;
    uint64_t v6 = mach_msg(i, 117440774, 0, i->msgh_size, Port, 0x3E8u, 0);
    if (v6 != 268451844) {
      break;
    }
    unsigned int v3 = (i->msgh_size + 71) & 0xFFFFFFFC;
  }
  uint64_t v7 = v6;
  if (!v6)
  {
    v16.copyDescription = (CFStringRef (__cdecl *)(const void *))0xAAAAAAAAAAAAAAAALL;
    *(void *)&uint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v16.version = v8;
    *(_OWORD *)&v16.retain = v8;
    CFMachPortGetContext(*(CFMachPortRef *)(*(void *)(a1 + 32) + 2016), &v16);
    mt_DequeueMultitouchDataMachPortCallBack(*(CFMachPortRef *)(*(void *)(a1 + 32) + 2016), 0, 0, (uint64_t)v16.info);
    goto LABEL_12;
  }
  uint32_t v9 = *(void *)(a1 + 32);
  if (!v9)
  {
    long long v15 = MTLoggingFramework();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      goto LABEL_12;
    }
    LODWORD(v16.version) = 67109120;
    HIDWORD(v16.version) = v7;
    uint64_t v12 = "mach_msg failed: 0x%08x";
    uint64_t v13 = v15;
    int v14 = 8;
    goto LABEL_11;
  }
  if (*(unsigned char *)(v9 + 133)) {
    mt_CachePropertiesForDevice(v9);
  }
  uint64_t v10 = MTLoggingFramework();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 64);
    LODWORD(v16.version) = 67109376;
    HIDWORD(v16.version) = v7;
    LOWORD(v16.info) = 2048;
    *(void **)((char *)&v16.info + 2) = v11;
    uint64_t v12 = "mach_msg failed: 0x%08x (deviceID 0x%llX)";
    uint64_t v13 = v10;
    int v14 = 18;
LABEL_11:
    _os_log_impl(&dword_2262CF000, v13, OS_LOG_TYPE_FAULT, v12, (uint8_t *)&v16, v14);
  }
LABEL_12:
  CFAllocatorDeallocate(v2, i);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t MTDeviceGetPeripheralRunLoopSource()
{
  return 0;
}

void mt_DeviceRegisterForHotplugNotifications(void *a1, __CFRunLoop *a2, const __CFString *a3)
{
  io_iterator_t iterator = -1431655766;
  io_iterator_t notification = -1431655766;
  uint64_t v6 = IONotificationPortCreate(0);
  CFRunLoopSourceRef RunLoopSource = IONotificationPortGetRunLoopSource(v6);
  a1[254] = CFRetain(RunLoopSource);
  CFRunLoopAddSource(a2, RunLoopSource, a3);
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v9 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, a1 + 8);
  uint64_t v10 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
  uint64_t v11 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v8, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v13 = CFDictionaryCreateMutable(v8, 1, v10, v11);
  int v14 = v13;
  if (v9) {
    BOOL v15 = Mutable == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15 || v13 == 0)
  {
    if (!v9)
    {
      if (!Mutable) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else
  {
    CFDictionarySetValue(v13, @"Multitouch ID", v9);
    CFDictionarySetValue(Mutable, @"IOPropertyMatch", v14);
    CFRetain(Mutable);
    if (!IOServiceAddMatchingNotification(v6, "IOServiceFirstMatch", Mutable, (IOServiceMatchingCallback)mt_HotPlugMatchingDeviceAdded, a1, &notification))
    {
      CFRetain(Mutable);
      if (!IOServiceAddMatchingNotification(v6, "IOServiceTerminate", Mutable, (IOServiceMatchingCallback)mt_HotPlugMatchingDeviceRemoved, a1, &iterator))
      {
        mt_HotPlugMatchingDeviceAdded(0, notification);
        mt_HotPlugMatchingDeviceRemoved(0, iterator);
      }
    }
  }
  CFRelease(v9);
  if (Mutable) {
LABEL_11:
  }
    CFRelease(Mutable);
LABEL_12:
  if (v14) {
    CFRelease(v14);
  }
}

uint64_t mt_HotPlugMatchingDeviceAdded(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    io_service_t v5 = result;
    uint64_t v6 = (task_port_t *)MEMORY[0x263EF8960];
    do
    {
      if (a1 && !*(_DWORD *)(a1 + 16) && !*(_DWORD *)(a1 + 20))
      {
        io_connect_t connect = 0;
        mach_timespec_t waitTime = (mach_timespec_t)5;
        if (IOServiceWaitQuiet(v5, &waitTime) == -536870186) {
          printf("MT Error: service still busy after %d seconds\n", waitTime.tv_sec);
        }
        if (!IOServiceOpen(v5, *v6, 0, &connect))
        {
          *(_DWORD *)(a1 + 16) = v5;
          IOObjectRetain(v5);
          *(_DWORD *)(a1 + 20) = connect;
          *(void *)(a1 + 2056) = 0;
          *(_DWORD *)(a1 + 2064) = 0;
          *(unsigned char *)(a1 + 2068) = 0;
          *(_DWORD *)(a1 + 180) = 0;
          *(void *)(a1 + 184) = 0;
          mt_CachePropertiesForDevice(a1);
          mt_PostNotificationEvent(a1, 5);
          MultitouchCFRunLoopSourceRef RunLoopSource = MTDeviceCreateMultitouchRunLoopSource((__CFMachPort *)a1);
          if (MultitouchRunLoopSource)
          {
            CFAllocatorRef v8 = MultitouchRunLoopSource;
            Current = CFRunLoopGetCurrent();
            CFRunLoopAddSource(Current, v8, *(CFRunLoopMode *)(a1 + 2024));
            CFRelease(v8);
          }
        }
      }
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      io_service_t v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t mt_HotPlugMatchingDeviceRemoved(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    io_object_t v5 = result;
    uint64_t v6 = (void *)(a1 + 2200);
    uint64_t v7 = (unsigned int *)MEMORY[0x263EF8960];
    do
    {
      if (a1)
      {
        uint64_t v8 = *(unsigned int *)(a1 + 20);
        if (v8)
        {
          if (*(void *)(a1 + 2016))
          {
            mt_StopDequeueOfMultitouchDataFromDevice(a1);
            *(void *)(a1 + 2016) = 0;
            uint64_t v8 = *(unsigned int *)(a1 + 20);
          }
          if (*v6)
          {
            MEMORY[0x22A64C330](v8, 0, *v7);
            *uint64_t v6 = 0;
            *(void *)(a1 + 2208) = 0;
            LODWORD(v8) = *(_DWORD *)(a1 + 20);
          }
          IOServiceClose(v8);
          *(_DWORD *)(a1 + 20) = 0;
          IOObjectRelease(*(_DWORD *)(a1 + 16));
          *(_DWORD *)(a1 + 16) = 0;
        }
      }
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      io_object_t v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t MTDeviceScheduleOnRunLoop(uint64_t a1, __CFRunLoop *a2, const __CFString *a3)
{
  uint64_t result = 3758097090;
  if (a1 && a2 && a3)
  {
    if (*(_DWORD *)(a1 + 20))
    {
      if (*(_DWORD *)(a1 + 16) && !*(void *)(a1 + 2016) && (*(unsigned char *)(a1 + 163) & 0x20) != 0)
      {
        MultitouchCFRunLoopSourceRef RunLoopSource = MTDeviceCreateMultitouchRunLoopSource((__CFMachPort *)a1);
        if (MultitouchRunLoopSource)
        {
          uint64_t v8 = MultitouchRunLoopSource;
          *(void *)(a1 + 2024) = a3;
          mt_DeviceRegisterForHotplugNotifications((void *)a1, a2, a3);
          CFRunLoopAddSource(a2, v8, a3);
          CFRelease(v8);
          return 0;
        }
        else
        {
          return 3758097084;
        }
      }
      else
      {
        return 3758096385;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

uint64_t MTActuatorCreateFromDeviceID(uint64_t a1)
{
  uint64_t valuePtr = a1;
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v2 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  if (v2)
  {
    CFNumberRef v3 = v2;
    io_iterator_t existing = 0;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v1, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (Mutable)
    {
      io_object_t v5 = Mutable;
      uint64_t v6 = CFDictionaryCreateMutable(v1, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (v6)
      {
        uint64_t v7 = v6;
        CFDictionarySetValue(v6, @"Multitouch Actuator ID", v3);
        CFDictionarySetValue(v5, @"IOPropertyMatch", v7);
        CFRelease(v7);
        if (!IOServiceGetMatchingServices(0, v5, &existing))
        {
          while (1)
          {
            io_object_t v10 = IOIteratorNext(existing);
            if (!v10) {
              break;
            }
            io_object_t v8 = v10;
            uint64_t v9 = MTActuatorCreate(v10, 0);
            IOObjectRelease(v8);
            if (v9) {
              goto LABEL_9;
            }
          }
          uint64_t v9 = 0;
LABEL_9:
          IOObjectRelease(existing);
          goto LABEL_13;
        }
      }
      else
      {
        CFRelease(v5);
      }
    }
    uint64_t v9 = 0;
LABEL_13:
    CFRelease(v3);
    return v9;
  }
  return 0;
}

uint64_t MTActuatorCreateFromService(io_object_t a1)
{
  if (a1) {
    return MTActuatorCreate(a1, 0);
  }
  else {
    return 0;
  }
}

uint64_t MTDeviceSupportsActuation(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 133)) {
      mt_CachePropertiesForDevice(result);
    }
    return *(unsigned char *)(v1 + 24) != 0;
  }
  return result;
}

uint64_t MTDeviceGetMTActuator(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 133)) {
    mt_CachePropertiesForDevice(a1);
  }
  if (!*(unsigned char *)(a1 + 24)) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    if (*(unsigned char *)(a1 + 133)) {
      mt_CachePropertiesForDevice(a1);
    }
    uint64_t v3 = MTActuatorCreateFromDeviceID(*(void *)(a1 + 64));
    if (v3)
    {
      uint64_t v2 = v3;
      MTActuatorSetMTDevice(v3, a1);
      *(void *)(a1 + 32) = v2;
    }
    else
    {
      return *(void *)(a1 + 32);
    }
  }
  return v2;
}

uint64_t MTActuatorGetService(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 16);
  }
  return result;
}

uint64_t MTActuatorGetMTDevice(uint64_t result)
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

uint64_t MTActuatorOpen(uint64_t a1, int a2)
{
  uint64_t v2 = 3758097090;
  if (a1)
  {
    io_connect_t connect = 0;
    mach_timespec_t waitTime = (mach_timespec_t)5;
    if (*(_DWORD *)(a1 + 20)) {
      return MTActuatorChangeHostClickControl(a1, 1u);
    }
    *(_DWORD *)(a1 + 24) = a2;
    if (IOServiceWaitQuiet(*(_DWORD *)(a1 + 16), &waitTime) == -536870186) {
      printf("MTActuator Error: service still busy after %d seconds\n", waitTime.tv_sec);
    }
    uint64_t v2 = IOServiceOpen(*(_DWORD *)(a1 + 16), *MEMORY[0x263EF8960], 0, &connect);
    if (!v2)
    {
      *(_DWORD *)(a1 + 20) = connect;
      if (*(unsigned char *)(a1 + 48))
      {
        mt_CachePropertiesForActuator(a1);
        MTActuatorLoadActuations(a1);
      }
      return MTActuatorRequestHostClickControl(a1);
    }
  }
  return v2;
}

BOOL MTActuatorIsOpen(BOOL result)
{
  if (result) {
    return *(_DWORD *)(result + 20) != 0;
  }
  return result;
}

uint64_t MTActuatorReclaimHostClickControl(uint64_t a1)
{
  return MTActuatorChangeHostClickControl(a1, 1u);
}

uint64_t mt_CachePropertiesForActuator(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 56);
  if (mt_ServiceGetInt64Property(*(_DWORD *)(a1 + 16), @"Multitouch Actuator ID", (void *)(a1 + 56)))*uint64_t v2 = 0; {
  if (mt_ServiceGetInt64Property(*(_DWORD *)(a1 + 16), @"Transport", (void *)(a1 + 64)))
  }
    *(_DWORD *)(a1 + 64) = 0;
  uint64_t result = mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), @"ActuatorRevision", (_DWORD *)(a1 + 68));
  if (result) {
    *(_DWORD *)(a1 + 68) = 0;
  }
  *(unsigned char *)(a1 + 48) = 0;
  return result;
}

uint64_t MTActuatorRequestHostClickControl(uint64_t a1)
{
  uint64_t v1 = 3758097090;
  if (a1)
  {
    mach_port_t v2 = *(_DWORD *)(a1 + 20);
    if (v2)
    {
      uint64_t input = 1;
      uint64_t v3 = IOConnectCallScalarMethod(v2, 0, &input, 1u, 0, 0);
      uint64_t v1 = v3;
      if (v3) {
        printf("MTActuator Error: Could not request host click control. Status = 0x%08x\n", v3);
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return v1;
}

uint64_t MTActuatorChangeHostClickControl(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = 3758097090;
  if (a1)
  {
    mach_port_t v3 = *(_DWORD *)(a1 + 20);
    if (v3)
    {
      uint64_t input = a2;
      uint64_t v4 = IOConnectCallScalarMethod(v3, 5u, &input, 1u, 0, 0);
      uint64_t v2 = v4;
      if (v4) {
        printf("MTActuator Error: Could not reclaim host click control. Status = 0x%08x\n", v4);
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return v2;
}

uint64_t MTActuatorHandoffHostClickControl(uint64_t a1)
{
  return MTActuatorChangeHostClickControl(a1, 0);
}

uint64_t MTActuatorClose(uint64_t a1)
{
  uint64_t result = 3758097090;
  if (a1)
  {
    if (*(_DWORD *)(a1 + 20))
    {
      IOServiceClose(*(_DWORD *)(a1 + 20));
      uint64_t result = 0;
      *(_DWORD *)(a1 + 20) = 0;
      *(unsigned char *)(a1 + 48) = 1;
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

uint64_t MTActuatorGetDeviceID(uint64_t a1, void *a2)
{
  uint64_t result = 3758097090;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a1 + 48)) {
      mt_CachePropertiesForActuator(a1);
    }
    uint64_t result = 0;
    *a2 = *(void *)(a1 + 56);
  }
  return result;
}

uint64_t MTActuatorGetTransportMethod(uint64_t a1, _DWORD *a2)
{
  uint64_t result = 3758097090;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a1 + 48)) {
      mt_CachePropertiesForActuator(a1);
    }
    uint64_t result = 0;
    *a2 = *(_DWORD *)(a1 + 64);
  }
  return result;
}

uint64_t MTActuatorIssueDriverRequest(uint64_t a1, void *inputStruct, void *outputStruct)
{
  uint64_t v3 = 3758097090;
  if (a1 && inputStruct && outputStruct)
  {
    mach_port_t v7 = *(_DWORD *)(a1 + 20);
    if (v7)
    {
      mach_timespec_t outputStructCnt = (mach_timespec_t)516;
      return IOConnectCallStructMethod(v7, 4u, inputStruct, 0x204uLL, outputStruct, (size_t *)&outputStructCnt);
    }
    else
    {
      io_connect_t connect = 0;
      mach_timespec_t outputStructCnt = (mach_timespec_t)5;
      if (IOServiceWaitQuiet(*(_DWORD *)(a1 + 16), &outputStructCnt) == -536870186) {
        printf("MT Error: service still busy after %d seconds\n", outputStructCnt.tv_sec);
      }
      uint64_t v3 = IOServiceOpen(*(_DWORD *)(a1 + 16), *MEMORY[0x263EF8960], 0, &connect);
      if (!v3)
      {
        size_t v9 = 516;
        uint64_t v3 = IOConnectCallStructMethod(connect, 4u, inputStruct, 0x204uLL, outputStruct, &v9);
      }
      IOServiceClose(connect);
    }
  }
  return v3;
}

uint64_t MTActuatorSetSystemActuationsEnabled(uint64_t a1, char a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v38 = v3;
  long long v39 = v3;
  uint64_t result = 3758097086;
  long long v36 = v3;
  long long v37 = v3;
  long long v34 = v3;
  long long v35 = v3;
  long long v32 = v3;
  long long v33 = v3;
  long long v30 = v3;
  long long v31 = v3;
  long long v28 = v3;
  long long v29 = v3;
  long long v26 = v3;
  long long v27 = v3;
  long long v24 = v3;
  long long v25 = v3;
  long long v23 = v3;
  long long v22 = v3;
  long long v21 = v3;
  long long v20 = v3;
  long long v19 = v3;
  long long v18 = v3;
  long long v17 = v3;
  long long v16 = v3;
  long long v15 = v3;
  long long v14 = v3;
  long long v13 = v3;
  long long v12 = v3;
  long long v11 = v3;
  long long v10 = v3;
  long long v9 = v3;
  long long v8 = v3;
  int inputStruct = 13;
  LOBYTE(v8) = a2;
  if (a1)
  {
    io_object_t v5 = *(io_service_t **)(a1 + 32);
    if (v5)
    {
      memset(v6, 170, sizeof(v6));
      uint64_t result = MTActuatorIssueDriverRequest(a1, &inputStruct, v6);
      if (!result)
      {
        uint64_t result = v6[0];
        if (!v6[0])
        {
          mt_PostNotificationEventToDriver(v5, 27);
          return 0;
        }
      }
    }
  }
  return result;
}

BOOL MTActuatorGetSystemActuationsEnabled(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v37 = v2;
  long long v38 = v2;
  long long v35 = v2;
  long long v36 = v2;
  long long v33 = v2;
  long long v34 = v2;
  long long v31 = v2;
  long long v32 = v2;
  long long v29 = v2;
  long long v30 = v2;
  long long v27 = v2;
  long long v28 = v2;
  long long v25 = v2;
  long long v26 = v2;
  long long v23 = v2;
  long long v24 = v2;
  long long v22 = v2;
  long long v21 = v2;
  long long v20 = v2;
  long long v19 = v2;
  long long v18 = v2;
  long long v17 = v2;
  long long v16 = v2;
  long long v15 = v2;
  long long v14 = v2;
  long long v13 = v2;
  long long v12 = v2;
  long long v11 = v2;
  long long v10 = v2;
  long long v9 = v2;
  long long v8 = v2;
  long long v7 = v2;
  memset(v5, 170, sizeof(v5));
  int inputStruct = 14;
  int v3 = MTActuatorIssueDriverRequest(a1, &inputStruct, v5);
  return !(v3 | v5[0]) && LOBYTE(v5[1]) != 0;
}

uint64_t mt_ServiceCFPropertyExists(io_registry_entry_t entry, const __CFString *a2)
{
  uint64_t result = 0;
  if (entry && a2)
  {
    uint64_t result = (uint64_t)IORegistryEntryCreateCFProperty(entry, a2, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (result)
    {
      CFRelease((CFTypeRef)result);
      return 1;
    }
  }
  return result;
}

uint64_t mt_ServiceGetInt32Property(io_registry_entry_t entry, const __CFString *a2, _DWORD *a3)
{
  uint64_t v4 = 3758097084;
  uint64_t result = 3758097090;
  if (entry && a2 && a3)
  {
    CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, a2, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (CFProperty)
    {
      CFNumberRef v8 = CFProperty;
      CFTypeID v9 = CFGetTypeID(CFProperty);
      if (v9 == CFNumberGetTypeID())
      {
        int valuePtr = 0;
        if (CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr) == 1)
        {
          uint64_t v4 = 0;
          *a3 = valuePtr;
        }
      }
      CFRelease(v8);
      return v4;
    }
    else
    {
      return 3758097084;
    }
  }
  return result;
}

uint64_t mt_ServiceGetInt64Property(io_registry_entry_t entry, const __CFString *a2, void *a3)
{
  uint64_t v4 = 3758097084;
  uint64_t result = 3758097090;
  if (entry && a2 && a3)
  {
    CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, a2, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (CFProperty)
    {
      CFNumberRef v8 = CFProperty;
      CFTypeID v9 = CFGetTypeID(CFProperty);
      if (v9 == CFNumberGetTypeID())
      {
        uint64_t valuePtr = 0;
        if (CFNumberGetValue(v8, kCFNumberSInt64Type, &valuePtr) == 1)
        {
          uint64_t v4 = 0;
          *a3 = valuePtr;
        }
      }
      CFRelease(v8);
      return v4;
    }
    else
    {
      return 3758097084;
    }
  }
  return result;
}

uint64_t mt_ServiceGetDataProperty(io_registry_entry_t entry, const __CFString *a2, UInt8 **a3, _DWORD *a4)
{
  uint64_t v5 = 3758097084;
  uint64_t result = 3758097090;
  if (entry && a2 && a3 && a4)
  {
    CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(entry, a2, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (CFProperty)
    {
      CFDataRef v10 = CFProperty;
      CFTypeID v11 = CFGetTypeID(CFProperty);
      if (v11 == CFDataGetTypeID())
      {
        size_t Length = CFDataGetLength(v10);
        *a3 = (UInt8 *)malloc_type_malloc(Length, 0x6340D677uLL);
        v13.length = CFDataGetLength(v10);
        v13.location = 0;
        CFDataGetBytes(v10, v13, *a3);
        uint64_t v5 = 0;
        *a4 = CFDataGetLength(v10);
      }
      CFRelease(v10);
      return v5;
    }
    else
    {
      return 3758097084;
    }
  }
  return result;
}

uint64_t mt_ServiceGetStringProperty(io_registry_entry_t entry, const __CFString *a2, void *a3)
{
  uint64_t result = 3758097090;
  if (entry && a2 && a3)
  {
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(entry, a2, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (CFProperty)
    {
      long long v7 = CFProperty;
      CFTypeID v8 = CFGetTypeID(CFProperty);
      if (v8 == CFStringGetTypeID())
      {
        uint64_t result = 0;
        *a3 = v7;
        return result;
      }
      *a3 = 0;
      CFRelease(v7);
    }
    else
    {
      *a3 = 0;
    }
    return 3758097084;
  }
  return result;
}

uint64_t mt_ServiceGetBoolProperty(io_registry_entry_t entry, const __CFString *a2, BOOL *a3)
{
  uint64_t v4 = 3758097084;
  uint64_t result = 3758097090;
  if (entry && a2 && a3)
  {
    CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(entry, a2, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (CFProperty)
    {
      CFBooleanRef v8 = CFProperty;
      CFTypeID v9 = CFGetTypeID(CFProperty);
      if (v9 == CFBooleanGetTypeID())
      {
        uint64_t v4 = 0;
        *a3 = CFBooleanGetValue(v8) != 0;
      }
      CFRelease(v8);
      return v4;
    }
    else
    {
      return 3758097084;
    }
  }
  return result;
}

uint64_t mt_ActuatorCFPropertyExists(uint64_t a1, const __CFString *a2)
{
  return mt_ServiceCFPropertyExists(*(_DWORD *)(a1 + 16), a2);
}

uint64_t mt_ActuatorGetInt32Property(uint64_t a1, const __CFString *a2, _DWORD *a3)
{
  return mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), a2, a3);
}

uint64_t mt_ActuatorGetInt64Property(uint64_t a1, const __CFString *a2, void *a3)
{
  return mt_ServiceGetInt64Property(*(_DWORD *)(a1 + 16), a2, a3);
}

uint64_t mt_ActuatorGetDataProperty(uint64_t a1, const __CFString *a2, UInt8 **a3, _DWORD *a4)
{
  return mt_ServiceGetDataProperty(*(_DWORD *)(a1 + 16), a2, a3, a4);
}

uint64_t mt_ActuatorGetStringProperty(uint64_t a1, const __CFString *a2, void *a3)
{
  return mt_ServiceGetStringProperty(*(_DWORD *)(a1 + 16), a2, a3);
}

uint64_t mt_ActuatorGetBoolProperty(uint64_t a1, const __CFString *a2, BOOL *a3)
{
  return mt_ServiceGetBoolProperty(*(_DWORD *)(a1 + 16), a2, a3);
}

uint64_t MTDeviceIsOpaqueSurface(uint64_t a1)
{
  if (a1) {
    return mtalg_IsOpaqueSurface(a1);
  }
  return a1;
}

uint64_t MTDeviceGetVersion(uint64_t a1, _DWORD *a2)
{
  uint64_t result = 3758097090;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a1 + 133)) {
      mt_CachePropertiesForDevice(a1);
    }
    uint64_t result = 0;
    *a2 = *(_DWORD *)(a1 + 76);
  }
  return result;
}

uint64_t MTDeviceHasExpectedVersion(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 133)) {
      mt_CachePropertiesForDevice(result);
    }
    int v2 = *(_DWORD *)(v1 + 80);
    return !v2 || *(_DWORD *)(v1 + 76) == v2;
  }
  return result;
}

uint64_t MTDeviceGetSensorDimensions(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t result = 3758097090;
  if (a1 && a2 | a3)
  {
    if (*(unsigned char *)(a1 + 133)) {
      mt_CachePropertiesForDevice(a1);
    }
    if (a2) {
      *(_DWORD *)a2 = *(_DWORD *)(a1 + 84);
    }
    uint64_t result = 0;
    if (a3) {
      *(_DWORD *)a3 = *(_DWORD *)(a1 + 88);
    }
  }
  return result;
}

uint64_t MTDeviceGetSensorSurfaceDimensions(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t result = 3758097090;
  if (a1 && a2 | a3)
  {
    if (*(unsigned char *)(a1 + 133)) {
      mt_CachePropertiesForDevice(a1);
    }
    if (a2) {
      *(_DWORD *)a2 = *(_DWORD *)(a1 + 92);
    }
    uint64_t result = 0;
    if (a3) {
      *(_DWORD *)a3 = *(_DWORD *)(a1 + 96);
    }
  }
  return result;
}

uint64_t MTDeviceGetSerialNumber(uint64_t a1, void *a2)
{
  uint64_t result = 3758097090;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a1 + 133)) {
      mt_CachePropertiesForDevice(a1);
    }
    uint64_t result = 0;
    *a2 = *(void *)(a1 + 104);
  }
  return result;
}

uint64_t MTDeviceGetDriverType(uint64_t a1, _DWORD *a2)
{
  uint64_t result = 3758097090;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a1 + 133)) {
      mt_CachePropertiesForDevice(a1);
    }
    uint64_t result = 0;
    *a2 = *(_DWORD *)(a1 + 212);
  }
  return result;
}

uint64_t MTDeviceDriverIsReady(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 133)) {
      mt_CachePropertiesForDevice(result);
    }
    if (*(unsigned char *)(v1 + 134))
    {
      int v2 = 1;
    }
    else
    {
      BOOL v5 = 0;
      int BoolProperty = mt_ServiceGetBoolProperty(*(_DWORD *)(v1 + 16), @"Driver is Ready", &v5);
      BOOL v4 = v5;
      if (BoolProperty) {
        BOOL v4 = 1;
      }
      *(unsigned char *)(v1 + 134) = v4;
      if (v4)
      {
        mt_CachePropertiesForDevice(v1);
        int v2 = *(unsigned __int8 *)(v1 + 134);
      }
      else
      {
        int v2 = 0;
      }
    }
    return v2 != 0;
  }
  return result;
}

uint64_t MTDeviceGetSensorRegionMaxTypes(uint64_t a1, _DWORD *a2)
{
  uint64_t result = 3758097090;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a1 + 133)) {
      mt_CachePropertiesForDevice(a1);
    }
    uint64_t result = 0;
    *a2 = 20;
  }
  return result;
}

uint64_t MTDeviceGetSensorRegionOfType(uint64_t a1, _DWORD *a2, unsigned int a3)
{
  uint64_t result = 3758097090;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a1 + 133)) {
      mt_CachePropertiesForDevice(a1);
    }
    if (a3 > 0x13)
    {
      return 3758097136;
    }
    else
    {
      uint64_t v7 = a1 - a3 + 8 * a3;
      int v9 = *(unsigned __int8 *)(v7 + 220);
      CFBooleanRef v8 = (int *)(v7 + 220);
      uint64_t result = 3758097136;
      if (v9 == a3)
      {
        uint64_t result = 0;
        int v10 = *v8;
        *(_DWORD *)((char *)a2 + 3) = *(int *)((char *)v8 + 3);
        *a2 = v10;
      }
    }
  }
  return result;
}

uint64_t MTDeviceGetThresholdsForSensorRegionOfType(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 3758097090;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a1 + 133)) {
      mt_CachePropertiesForDevice(a1);
    }
    if (a3 == 1)
    {
      uint64_t v3 = 0;
      int v7 = *(_DWORD *)(a1 + 360);
      *(_WORD *)(a2 + 4) = *(_WORD *)(a1 + 364);
      *(_DWORD *)a2 = v7;
    }
    else
    {
      return 3758097136;
    }
  }
  return v3;
}

uint64_t MTAlg_DeviceGetSensorRegionArray(uint64_t a1, void *a2, _DWORD *a3)
{
  uint64_t result = 3758097090;
  if (a1 && a2 && a3)
  {
    if (*(unsigned char *)(a1 + 133)) {
      mt_CachePropertiesForDevice(a1);
    }
    uint64_t result = 0;
    *a3 = 20;
    *a2 = a1 + 220;
  }
  return result;
}

uint64_t MTDeviceGetParserType(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 133)) {
      mt_CachePropertiesForDevice(result);
    }
    return *(unsigned int *)(v1 + 2072);
  }
  return result;
}

uint64_t MTDeviceGetParserOptions(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 133)) {
      mt_CachePropertiesForDevice(result);
    }
    return *(unsigned int *)(v1 + 2076);
  }
  return result;
}

uint64_t MTDeviceIsMTHIDDevice(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 133)) {
      mt_CachePropertiesForDevice(result);
    }
    return *(unsigned char *)(v1 + 2080) != 0;
  }
  return result;
}

uint64_t MTDeviceGetTouchSizeIdentifier(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 133)) {
      mt_CachePropertiesForDevice(result);
    }
    return *(unsigned int *)(v1 + 2084);
  }
  return result;
}

uint64_t MTDeviceIsBuiltIn(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 133)) {
      mt_CachePropertiesForDevice(result);
    }
    return *(unsigned char *)(v1 + 2088) != 0;
  }
  return result;
}

uint64_t MTDeviceSupportsWirelessChargingNotification(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 133)) {
      mt_CachePropertiesForDevice(result);
    }
    return *(unsigned char *)(v1 + 42) != 0;
  }
  return result;
}

uint64_t MTDeviceSupportsUSBChargingNotification(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 133)) {
      mt_CachePropertiesForDevice(result);
    }
    return *(unsigned char *)(v1 + 43) != 0;
  }
  return result;
}

uint64_t MTDeviceSupportsForce(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 133)) {
      mt_CachePropertiesForDevice(result);
    }
    return *(unsigned char *)(v1 + 40) != 0;
  }
  return result;
}

uint64_t MTDeviceSupportsSilentClick(uint64_t a1, unsigned char *a2)
{
  uint64_t result = 3758097090;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a1 + 133)) {
      mt_CachePropertiesForDevice(a1);
    }
    uint64_t result = 0;
    *a2 = *(unsigned char *)(a1 + 41);
  }
  return result;
}

uint64_t MTDeviceGetMinDigitizerPressureValue(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 133)) {
      mt_CachePropertiesForDevice(result);
    }
    return *(unsigned int *)(v1 + 44);
  }
  return result;
}

uint64_t MTDeviceGetAccurateMaxDigitizerPressureValue(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 133)) {
      mt_CachePropertiesForDevice(result);
    }
    return *(unsigned int *)(v1 + 48);
  }
  return result;
}

uint64_t MTDeviceGetExtendedMaxDigitizerPressureValue(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 133)) {
      mt_CachePropertiesForDevice(result);
    }
    return *(unsigned int *)(v1 + 52);
  }
  return result;
}

uint64_t MTDeviceGetMaxHoverHeightValue(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 133)) {
      mt_CachePropertiesForDevice(result);
    }
    return *(unsigned int *)(v1 + 56);
  }
  return result;
}

uint64_t MTDeviceShouldDispatchNormalizedVelocity(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 133)) {
      mt_CachePropertiesForDevice(result);
    }
    return *(unsigned char *)(v1 + 131) != 0;
  }
  return result;
}

uint64_t MTDeviceShouldDispatchRelativeCoordinates(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 133)) {
      mt_CachePropertiesForDevice(result);
    }
    return *(unsigned char *)(v1 + 132) != 0;
  }
  return result;
}

void MTDeviceForcePropertiesRecacheForAll()
{
  List = MTDeviceCreateList();
  if (List)
  {
    CFArrayRef v1 = List;
    if (CFArrayGetCount(List) >= 1)
    {
      int Count = CFArrayGetCount(v1);
      if (Count >= 1)
      {
        CFIndex v3 = 0;
        uint64_t v4 = Count;
        do
        {
          ValueAtIndex = (io_service_t *)CFArrayGetValueAtIndex(v1, v3);
          MTDeviceForcePropertiesRecache(ValueAtIndex);
          ++v3;
        }
        while (v4 != v3);
      }
    }
    CFRelease(v1);
  }
}

uint64_t MTDeviceIssueDriverRequest(io_service_t *a1, void *inputStruct, void *outputStruct)
{
  uint64_t v3 = 3758097090;
  if (a1 && inputStruct && outputStruct)
  {
    unsigned int v7 = a1[53];
    BOOL v8 = v7 > 4;
    int v9 = (1 << v7) & 0x16;
    if (v8 || v9 == 0)
    {
      return 3758097095;
    }
    else
    {
      mach_port_t v11 = a1[5];
      if (v11)
      {
        mach_timespec_t outputStructCnt = (mach_timespec_t)516;
        return IOConnectCallStructMethod(v11, 4u, inputStruct, 0x204uLL, outputStruct, (size_t *)&outputStructCnt);
      }
      else
      {
        io_connect_t connect = 0;
        mach_timespec_t outputStructCnt = (mach_timespec_t)5;
        if (IOServiceWaitQuiet(a1[4], &outputStructCnt) == -536870186) {
          printf("MT Error: service still busy after %d seconds\n", outputStructCnt.tv_sec);
        }
        uint64_t v3 = IOServiceOpen(a1[4], *MEMORY[0x263EF8960], 0, &connect);
        if (!v3)
        {
          size_t v13 = 516;
          uint64_t v3 = IOConnectCallStructMethod(connect, 4u, inputStruct, 0x204uLL, outputStruct, &v13);
        }
        IOServiceClose(connect);
      }
    }
  }
  return v3;
}

uint64_t MTDeviceEnableBinaryFilters(uint64_t a1, char a2)
{
  uint64_t v2 = 3758097090;
  if (a1)
  {
    BinaryFilters = *(NSObject **)(a1 + 2224);
    if (a2)
    {
      if (!BinaryFilters)
      {
        *(unsigned char *)(a1 + 2232) = 0;
        BinaryFilters = mt_CreateBinaryFilters(a1);
        *(void *)(a1 + 2224) = BinaryFilters;
      }
      *(unsigned char *)(a1 + 2216) = a2;
      if (BinaryFilters) {
        return 0;
      }
      else {
        return 3758097095;
      }
    }
    else
    {
      if (BinaryFilters)
      {
        CFRelease(BinaryFilters);
        *(void *)(a1 + 2224) = 0;
      }
      uint64_t v2 = 0;
      *(unsigned char *)(a1 + 2216) = a2;
    }
  }
  return v2;
}

uint64_t MTDeviceSetBinaryFiltersProperty(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 3758097090;
  if (a1)
  {
    if (*(void *)(a1 + 2224))
    {
      mt_SetBinaryFiltersProperty(a1, a2, a3);
      return 0;
    }
    else
    {
      return 3758097095;
    }
  }
  return result;
}

uint64_t MTDeviceGetMultipleFirmwaresConfig(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 133)) {
      mt_CachePropertiesForDevice(result);
    }
    return *(void *)(v1 + 5680);
  }
  return result;
}

uint64_t MTAlg_GetAlgLibStateRef(uint64_t result)
{
  if (result) {
    return *(void *)(result + 152);
  }
  return result;
}

double MTAbsoluteTimeGetCurrent()
{
  mach_timebase_info info = (mach_timebase_info)0xAAAAAAAAAAAAAAAALL;
  uint64_t v0 = mach_absolute_time();
  mach_timebase_info(&info);
  return (double)v0 / 1000000000.0 * (double)(info.numer / info.denom);
}

unint64_t mt_GetTimeDifference_ms(double a1, double a2)
{
  return (unint64_t)((a2 - a1) * 1000.0);
}

unint64_t mt_GetTimeStamp_ms(uint64_t a1)
{
  double Current = MTAbsoluteTimeGetCurrent();
  if (a1)
  {
    double v3 = *(double *)(a1 + 144);
  }
  else
  {
    double v3 = *(double *)&mt_GetTimeStamp_ms_globalStartTime;
    if (*(double *)&mt_GetTimeStamp_ms_globalStartTime == 0.0)
    {
      mt_GetTimeStamp_ms_globalStartTime = *(void *)&Current;
      double v3 = Current;
    }
  }
  return (unint64_t)((Current - v3) * 1000.0);
}

uint64_t MTDeviceGetForceThresholdForMotion(uint64_t a1, _DWORD *a2, _DWORD *a3, unsigned int a4)
{
  uint64_t result = 3758097090;
  if (a1 && a2 && a3 && a4 <= 4)
  {
    if (*(unsigned char *)(a1 + 133)) {
      mt_CachePropertiesForDevice(a1);
    }
    int v9 = *(_DWORD *)(a1 + 4 * a4 + 2156);
    if (v9 && (uint64_t v10 = a1 + 4 * a4, *(_DWORD *)(v10 + 2176)))
    {
      uint64_t result = 0;
      *a2 = v9;
      *a3 = *(_DWORD *)(v10 + 2176);
    }
    else
    {
      return 3758096385;
    }
  }
  return result;
}

BOOL MTDeviceIsAlive(BOOL result)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (result)
  {
    uint64_t v1 = (io_service_t *)result;
    *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v36 = v2;
    long long v37 = v2;
    long long v34 = v2;
    long long v35 = v2;
    long long v32 = v2;
    long long v33 = v2;
    long long v30 = v2;
    long long v31 = v2;
    long long v28 = v2;
    long long v29 = v2;
    long long v26 = v2;
    long long v27 = v2;
    long long v24 = v2;
    long long v25 = v2;
    long long v22 = v2;
    long long v23 = v2;
    long long v21 = v2;
    long long v20 = v2;
    long long v19 = v2;
    long long v18 = v2;
    long long v17 = v2;
    long long v16 = v2;
    long long v15 = v2;
    long long v14 = v2;
    long long v13 = v2;
    long long v12 = v2;
    long long v11 = v2;
    long long v10 = v2;
    long long v9 = v2;
    long long v8 = v2;
    long long v7 = v2;
    long long v6 = v2;
    memset(v4, 170, sizeof(v4));
    int inputStruct = 0;
    int v3 = MTDeviceIssueDriverRequest(v1, &inputStruct, v4);
    return (v3 | v4[0]) == 0;
  }
  return result;
}

uint64_t MTDeviceGetSubdeviceID(uint64_t a1, unsigned char *a2)
{
  if (!a1) {
    return 3758097090;
  }
  if (*(unsigned char *)(a1 + 133)) {
    mt_CachePropertiesForDevice(a1);
  }
  uint64_t result = 0;
  *a2 = *(unsigned char *)(a1 + 2152);
  return result;
}

uint64_t MTDeviceGetDeviceTimestampOffset(uint64_t a1, void *a2)
{
  if (!a1) {
    return 3758097090;
  }
  uint64_t result = 0;
  *a2 = *(void *)(a1 + 184);
  return result;
}

uint64_t MTDeviceCopyDeviceUsagePairs(uint64_t a1, void *a2)
{
  if (a1) {
    return mt_DeviceCopyArrayProperty(a1, @"DeviceUsagePairs", a2);
  }
  else {
    return 3758097090;
  }
}

uint64_t MTDeviceSetGenerateRingCentroid(uint64_t result, char a2)
{
  *(unsigned char *)(result + 2153) = a2;
  return result;
}

uint64_t MTDeviceGetGenerateRingCentroid(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 2153);
}

uint64_t MTDeviceSetDisableTipCentroid(uint64_t result, char a2)
{
  *(unsigned char *)(result + 2154) = a2;
  return result;
}

uint64_t MTDeviceGetDisableTipCentroid(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 2154);
}

uint64_t MTDeviceGetDriverMaxPacketSize(uint64_t a1)
{
  return _MTDeviceGetMaxPacketSizeByKey(a1, @"Max Packet Size", 4096);
}

uint64_t _MTDeviceGetMaxPacketSizeByKey(uint64_t a1, const __CFString *a2, uint64_t a3)
{
  if (!a1) {
    return 0;
  }
  io_registry_entry_t v3 = *(_DWORD *)(a1 + 16);
  if (!v3) {
    return 0;
  }
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v3, a2, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v6 = CFProperty;
    CFTypeID v7 = CFGetTypeID(CFProperty);
    if (v7 == CFNumberGetTypeID())
    {
      int valuePtr = 0;
      int Value = CFNumberGetValue(v6, kCFNumberSInt32Type, &valuePtr);
      if (valuePtr > 511 && Value == 1) {
        a3 = valuePtr;
      }
      else {
        a3 = a3;
      }
    }
    CFRelease(v6);
  }
  return a3;
}

uint64_t MTDeviceGetInjectionMaxPacketSize(uint64_t a1)
{
  return _MTDeviceGetMaxPacketSizeByKey(a1, @"Max Injection Packet Size", 0);
}

uint64_t MTDeviceSetInjectionMaxPacketSize(io_service_t *a1, int a2)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v42[12] = v4;
  long long v41 = v4;
  *(_OWORD *)int v42 = v4;
  long long v39 = v4;
  long long v40 = v4;
  long long v37 = v4;
  long long v38 = v4;
  long long v35 = v4;
  long long v36 = v4;
  long long v33 = v4;
  long long v34 = v4;
  long long v31 = v4;
  long long v32 = v4;
  long long v29 = v4;
  long long v30 = v4;
  long long v28 = v4;
  long long v27 = v4;
  long long v26 = v4;
  long long v25 = v4;
  long long v24 = v4;
  long long v23 = v4;
  long long v22 = v4;
  long long v21 = v4;
  long long v20 = v4;
  long long v19 = v4;
  long long v18 = v4;
  long long v17 = v4;
  long long v16 = v4;
  long long v15 = v4;
  long long v14 = v4;
  long long v13 = v4;
  long long v12 = v4;
  memset(v6, 170, sizeof(v6));
  int inputStruct = 19;
  char v8 = HIBYTE(a2);
  char v9 = BYTE2(a2);
  char v10 = BYTE1(a2);
  char v11 = a2;
  LODWORD(result) = MTDeviceIssueDriverRequest(a1, &inputStruct, v6);
  if (result) {
    return result;
  }
  else {
    return v6[0];
  }
}

uint64_t MTDeviceGetSATelemetryReportID(uint64_t result)
{
  if (result) {
    return *(unsigned __int8 *)(result + 5677);
  }
  return result;
}

BOOL MTDeviceSupportsTapToWake(BOOL result)
{
  if (result) {
    return *(unsigned char *)(result + 116) != 0;
  }
  return result;
}

BOOL MTDeviceSupportsTouchReadyNotification(BOOL result)
{
  if (result) {
    return *(unsigned char *)(result + 117) != 0;
  }
  return result;
}

BOOL MTDeviceNeedsFirstPowerOffSuppressed(BOOL result)
{
  if (result) {
    return (*(_DWORD *)(result + 72) - 93) <= 1
  }
        && !*(unsigned char *)(result + 42)
        && *(unsigned char *)(result + 119) == 0;
  return result;
}

uint64_t MTDeviceNotifyFirstPowerOffSuppressed(uint64_t a1)
{
  if (!a1) {
    return 3758097090;
  }
  *(unsigned char *)(a1 + 119) = 1;
  return IORegistryEntrySetCFProperty(*(_DWORD *)(a1 + 16), @"FirstPowerOffSuppressed", (CFTypeRef)*MEMORY[0x263EFFB40]);
}

BOOL MTDeviceUseContextualPower(BOOL result)
{
  if (result) {
    return *(unsigned char *)(result + 118) != 0;
  }
  return result;
}

uint64_t MTDeviceGetResetOnLockMs(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 120);
  }
  return result;
}

uint64_t MTDeviceGetResetOnUnlockMs(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 124);
  }
  return result;
}

BOOL MTDeviceShouldResetOnButton(BOOL result)
{
  if (result) {
    return *(unsigned char *)(result + 128) != 0;
  }
  return result;
}

BOOL MTDeviceShouldSkipFaceDetectionMode(BOOL result)
{
  if (result) {
    return *(unsigned char *)(result + 129) != 0;
  }
  return result;
}

uint64_t MTDeviceUpdateUILockState(uint64_t result, int a2)
{
  long long v2 = (io_service_t *)result;
  if (*(unsigned char *)(result + 112))
  {
    int v3 = *(unsigned __int8 *)(result + 113);
    *(unsigned char *)(result + 112) = 1;
    *(unsigned char *)(result + 113) = a2;
    if (v3 == a2) {
      return result;
    }
  }
  else
  {
    *(unsigned char *)(result + 112) = 1;
    *(unsigned char *)(result + 113) = a2;
  }
  BOOL v4 = a2 == 0;
  if (a2) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 4;
  }
  if (v4) {
    char v6 = 104;
  }
  else {
    char v6 = 103;
  }
  mt_PostNotificationEvent(result, v5);
  return mt_PostNotificationEventToDriver(v2, v6);
}

BOOL MTDevicePowerControlSupported(BOOL result)
{
  if (result) {
    return *(unsigned char *)(result + 115) != 0;
  }
  return result;
}

uint64_t MTDevicePowerSetEnabled(io_service_t *a1, int a2)
{
  if (a2) {
    int v2 = 2;
  }
  else {
    int v2 = 0;
  }
  return MTDevicePowerSetState(a1, v2);
}

uint64_t MTDevicePowerSetState(io_service_t *a1, int a2)
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v41 = v4;
  long long v42 = v4;
  long long v39 = v4;
  long long v40 = v4;
  long long v37 = v4;
  long long v38 = v4;
  long long v35 = v4;
  long long v36 = v4;
  long long v33 = v4;
  long long v34 = v4;
  long long v31 = v4;
  long long v32 = v4;
  long long v29 = v4;
  long long v30 = v4;
  long long v27 = v4;
  long long v28 = v4;
  long long v26 = v4;
  long long v25 = v4;
  long long v24 = v4;
  long long v23 = v4;
  long long v22 = v4;
  long long v21 = v4;
  long long v20 = v4;
  long long v19 = v4;
  long long v18 = v4;
  long long v17 = v4;
  long long v16 = v4;
  long long v15 = v4;
  long long v14 = v4;
  long long v13 = v4;
  long long v12 = v4;
  long long v11 = v4;
  memset(__b, 170, sizeof(__b));
  int v10 = 4;
  if (!a2)
  {
    char v5 = 0;
LABEL_6:
    LOBYTE(v11) = v5;
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v75 = v6;
    long long v76 = v6;
    long long v73 = v6;
    long long v74 = v6;
    long long v71 = v6;
    long long v72 = v6;
    long long v69 = v6;
    long long v70 = v6;
    long long v67 = v6;
    long long v68 = v6;
    long long v65 = v6;
    long long v66 = v6;
    long long v63 = v6;
    long long v64 = v6;
    long long v61 = v6;
    long long v62 = v6;
    long long v60 = v6;
    long long v59 = v6;
    long long v58 = v6;
    long long v57 = v6;
    long long v56 = v6;
    long long v55 = v6;
    long long v54 = v6;
    long long v53 = v6;
    long long v52 = v6;
    long long v51 = v6;
    long long v50 = v6;
    long long v49 = v6;
    long long v48 = v6;
    long long v47 = v6;
    long long v46 = v6;
    long long v45 = v6;
    memset(outputStruct, 170, sizeof(outputStruct));
    int inputStruct = 12;
    MTDeviceIssueDriverRequest(a1, &inputStruct, outputStruct);
    unsigned int v7 = MTDeviceIssueDriverRequest(a1, &v10, __b);
    MTDeviceUpdateUILockState((uint64_t)a1, 1);
    goto LABEL_8;
  }
  if (a2 != 2)
  {
    if (a2 != 1) {
      return 3758097090;
    }
    char v5 = 1;
    goto LABEL_6;
  }
  LOBYTE(v11) = 2;
  unsigned int v7 = MTDeviceIssueDriverRequest(a1, &v10, __b);
LABEL_8:
  if (v7) {
    return v7;
  }
  else {
    return __b[0];
  }
}

uint64_t MTDeviceUpdatePowerStatistics(io_service_t *a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v37 = v2;
  long long v38 = v2;
  long long v35 = v2;
  long long v36 = v2;
  long long v33 = v2;
  long long v34 = v2;
  long long v31 = v2;
  long long v32 = v2;
  long long v29 = v2;
  long long v30 = v2;
  long long v27 = v2;
  long long v28 = v2;
  long long v25 = v2;
  long long v26 = v2;
  long long v23 = v2;
  long long v24 = v2;
  long long v22 = v2;
  long long v21 = v2;
  long long v20 = v2;
  long long v19 = v2;
  long long v18 = v2;
  long long v17 = v2;
  long long v16 = v2;
  long long v15 = v2;
  long long v14 = v2;
  long long v13 = v2;
  long long v12 = v2;
  long long v11 = v2;
  long long v10 = v2;
  long long v9 = v2;
  long long v8 = v2;
  long long v7 = v2;
  memset(v5, 170, sizeof(v5));
  int inputStruct = 12;
  LODWORD(result) = MTDeviceIssueDriverRequest(a1, &inputStruct, v5);
  if (v5[0]) {
    BOOL v4 = result == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    return v5[0];
  }
  else {
    return result;
  }
}

uint64_t MTDevicePowerGetEnabled(io_service_t *a1, BOOL *a2)
{
  int v4 = -1431655766;
  uint64_t result = MTDevicePowerGetState(a1, &v4);
  if (a2)
  {
    if (!result) {
      *a2 = v4 == 2;
    }
  }
  return result;
}

uint64_t MTDevicePowerGetState(io_service_t *a1, _DWORD *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v38 = v4;
  long long v39 = v4;
  long long v36 = v4;
  long long v37 = v4;
  long long v34 = v4;
  long long v35 = v4;
  long long v32 = v4;
  long long v33 = v4;
  long long v30 = v4;
  long long v31 = v4;
  long long v28 = v4;
  long long v29 = v4;
  long long v26 = v4;
  long long v27 = v4;
  long long v24 = v4;
  long long v25 = v4;
  long long v23 = v4;
  long long v22 = v4;
  long long v21 = v4;
  long long v20 = v4;
  long long v19 = v4;
  long long v18 = v4;
  long long v17 = v4;
  long long v16 = v4;
  long long v15 = v4;
  long long v14 = v4;
  long long v13 = v4;
  long long v12 = v4;
  long long v11 = v4;
  long long v10 = v4;
  long long v9 = v4;
  long long v8 = v4;
  memset(v6, 170, sizeof(v6));
  int inputStruct = 3;
  uint64_t result = MTDeviceIssueDriverRequest(a1, &inputStruct, v6);
  if (!result)
  {
    uint64_t result = v6[0];
    if (a2)
    {
      if (!v6[0])
      {
        if (LOBYTE(v6[1]) > 2u)
        {
          return 3758096385;
        }
        else
        {
          uint64_t result = 0;
          *a2 = LOBYTE(v6[1]);
        }
      }
    }
  }
  return result;
}

uint64_t mt_RecursiveMakeDirectory(const char *a1, mode_t a2, uid_t a3, gid_t a4, int a5)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  memset(__b, 170, sizeof(__b));
  snprintf(__b, 0x400uLL, "%s", a1);
  size_t v10 = strlen(__b);
  if (v10 >= 2)
  {
    size_t v11 = v10;
    int v12 = 0;
    for (uint64_t i = 1; v11 != i; ++i)
    {
      if (__b[i] == 47)
      {
        if (v12 >= a5)
        {
          __b[i] = 0;
          uint64_t v14 = mkdir(__b, a2);
          if (v14)
          {
            uint64_t v15 = v14;
            if (*__error() != 17) {
              return v15;
            }
          }
          v16.tv_sec = 0xAAAAAAAAAAAAAAAALL;
          v16.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
          *(timespec *)&v19.st_blksize = v16;
          *(timespec *)v19.st_qspare = v16;
          v19.st_birthtimespec = v16;
          *(timespec *)&v19.st_size = v16;
          v19.st_mtimespec = v16;
          v19.st_ctimespec = v16;
          *(timespec *)&v19.st_uid = v16;
          v19.st_atimespec = v16;
          *(timespec *)&v19.st_dev = v16;
          uint64_t v17 = stat(__b, &v19);
          if (v17) {
            return v17;
          }
          if (v19.st_uid != a3 || v19.st_gid != a4)
          {
            uint64_t v17 = chown(__b, a3, a4);
            if (v17) {
              return v17;
            }
          }
          __b[i] = 47;
        }
        else
        {
          ++v12;
        }
      }
    }
  }
  return 0;
}

uint64_t MTDeviceUpdateDynamicCalibration(uint64_t a1)
{
  CFPropertyListRef v16 = 0;
  uint64_t v1 = mt_DeviceCopyDictionaryProperty(a1, @"Dynamic Calibration", &v16);
  if (v16)
  {
    v2.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v2.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v15.st_blksize = v2;
    *(timespec *)v15.st_qspare = v2;
    uint64_t v3 = 3758097086;
    v15.st_birthtimespec = v2;
    *(timespec *)&v15.st_size = v2;
    v15.st_mtimespec = v2;
    v15.st_ctimespec = v2;
    *(timespec *)&v15.st_uid = v2;
    v15.st_atimespec = v2;
    *(timespec *)&v15.st_dev = v2;
    if (!stat("/var/mobile/Library/Application Support/Multitouch/", &v15)
      || !stat("/var/mobile/Library/", &v15)
      && (!mt_RecursiveMakeDirectory("/var/mobile/Library/Application Support/Multitouch/", 0x1C0u, v15.st_uid, v15.st_gid, 3)|| *__error() == 17))
    {
      int v4 = open("/var/mobile/Library/Application Support/Multitouch/multitouch.dycal", 512, 420);
      if ((v4 & 0x80000000) == 0)
      {
        int v5 = v4;
        v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
        v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
        *(timespec *)&v14.st_blksize = v6;
        *(timespec *)v14.st_qspare = v6;
        v14.st_birthtimespec = v6;
        *(timespec *)&v14.st_size = v6;
        v14.st_mtimespec = v6;
        v14.st_ctimespec = v6;
        *(timespec *)&v14.st_uid = v6;
        v14.st_atimespec = v6;
        *(timespec *)&v14.st_dev = v6;
        if (!fstat(v4, &v14))
        {
          if (v14.st_uid == v15.st_uid)
          {
            gid_t st_gid = v15.st_gid;
            if (v14.st_gid == v15.st_gid)
            {
LABEL_13:
              if (fcntl(v5, 64, 4))
              {
                uint64_t v3 = 3758097095;
              }
              else
              {
                close(v5);
                CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
                CFStringRef v9 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], "/var/mobile/Library/Application Support/Multitouch/multitouch.dycal", 0);
                CFURLRef v10 = CFURLCreateWithFileSystemPath(v8, v9, kCFURLPOSIXPathStyle, 0);
                size_t v11 = CFWriteStreamCreateWithFile(v8, v10);
                uint64_t v3 = 3758097085;
                if (v9)
                {
                  if (v10)
                  {
                    int v12 = v11;
                    if (v11)
                    {
                      if (CFWriteStreamOpen(v11))
                      {
                        CFPropertyListWrite(v16, v12, kCFPropertyListXMLFormat_v1_0, 0, 0);
                        CFWriteStreamClose(v12);
                      }
                      else
                      {
                        uint64_t v1 = 3758097101;
                      }
                      CFRelease(v12);
                      CFRelease(v9);
                      CFRelease(v10);
                      uint64_t v3 = v1;
                    }
                  }
                }
              }
              goto LABEL_22;
            }
          }
          else
          {
            gid_t st_gid = v15.st_gid;
          }
          if (!chown("/var/mobile/Library/Application Support/Multitouch/multitouch.dycal", v15.st_uid, st_gid)) {
            goto LABEL_13;
          }
        }
      }
    }
LABEL_22:
    CFRelease(v16);
    return v3;
  }
  return v1;
}

uint64_t MTDeviceSetParserEnabled(io_service_t *a1, char a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v38 = v4;
  long long v39 = v4;
  long long v36 = v4;
  long long v37 = v4;
  long long v34 = v4;
  long long v35 = v4;
  long long v32 = v4;
  long long v33 = v4;
  long long v30 = v4;
  long long v31 = v4;
  long long v28 = v4;
  long long v29 = v4;
  long long v26 = v4;
  long long v27 = v4;
  long long v24 = v4;
  long long v25 = v4;
  long long v23 = v4;
  long long v22 = v4;
  long long v21 = v4;
  long long v20 = v4;
  long long v19 = v4;
  long long v18 = v4;
  long long v17 = v4;
  long long v16 = v4;
  long long v15 = v4;
  long long v14 = v4;
  long long v13 = v4;
  long long v12 = v4;
  long long v11 = v4;
  long long v10 = v4;
  long long v9 = v4;
  long long v8 = v4;
  memset(v6, 170, sizeof(v6));
  int inputStruct = 17;
  LOBYTE(v8) = a2;
  uint64_t result = MTDeviceIssueDriverRequest(a1, &inputStruct, v6);
  if (!result)
  {
    uint64_t result = v6[0];
    if (!v6[0])
    {
      mt_PostNotificationEventToDriver(a1, 26);
      return 0;
    }
  }
  return result;
}

uint64_t MTDeviceGetParserEnabled(io_service_t *a1, BOOL *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v39 = v4;
  long long v40 = v4;
  long long v37 = v4;
  long long v38 = v4;
  long long v35 = v4;
  long long v36 = v4;
  long long v33 = v4;
  long long v34 = v4;
  long long v31 = v4;
  long long v32 = v4;
  long long v29 = v4;
  long long v30 = v4;
  long long v27 = v4;
  long long v28 = v4;
  long long v25 = v4;
  long long v26 = v4;
  long long v24 = v4;
  long long v23 = v4;
  long long v22 = v4;
  long long v21 = v4;
  long long v20 = v4;
  long long v19 = v4;
  long long v18 = v4;
  long long v17 = v4;
  long long v16 = v4;
  long long v15 = v4;
  long long v14 = v4;
  long long v13 = v4;
  long long v12 = v4;
  long long v11 = v4;
  long long v10 = v4;
  long long v9 = v4;
  memset(v7, 170, sizeof(v7));
  int inputStruct = 18;
  LODWORD(result) = MTDeviceIssueDriverRequest(a1, &inputStruct, v7);
  unsigned int v6 = v7[0];
  if (a2 && !result && !v7[0]) {
    *a2 = LOBYTE(v7[1]) == 1;
  }
  if (result) {
    return result;
  }
  else {
    return v6;
  }
}

uint64_t MTDeviceSetSystemForceResponseEnabled(io_service_t *a1, char a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v38 = v4;
  long long v39 = v4;
  long long v36 = v4;
  long long v37 = v4;
  long long v34 = v4;
  long long v35 = v4;
  long long v32 = v4;
  long long v33 = v4;
  long long v30 = v4;
  long long v31 = v4;
  long long v28 = v4;
  long long v29 = v4;
  long long v26 = v4;
  long long v27 = v4;
  long long v24 = v4;
  long long v25 = v4;
  long long v23 = v4;
  long long v22 = v4;
  long long v21 = v4;
  long long v20 = v4;
  long long v19 = v4;
  long long v18 = v4;
  long long v17 = v4;
  long long v16 = v4;
  long long v15 = v4;
  long long v14 = v4;
  long long v13 = v4;
  long long v12 = v4;
  long long v11 = v4;
  long long v10 = v4;
  long long v9 = v4;
  long long v8 = v4;
  memset(v6, 170, sizeof(v6));
  int inputStruct = 15;
  LOBYTE(v8) = a2;
  uint64_t result = MTDeviceIssueDriverRequest(a1, &inputStruct, v6);
  if (!result)
  {
    uint64_t result = v6[0];
    if (!v6[0])
    {
      mt_PostNotificationEventToDriver(a1, 28);
      return 0;
    }
  }
  return result;
}

BOOL MTDeviceGetSystemForceResponseEnabled(io_service_t *a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v37 = v2;
  long long v38 = v2;
  long long v35 = v2;
  long long v36 = v2;
  long long v33 = v2;
  long long v34 = v2;
  long long v31 = v2;
  long long v32 = v2;
  long long v29 = v2;
  long long v30 = v2;
  long long v27 = v2;
  long long v28 = v2;
  long long v25 = v2;
  long long v26 = v2;
  long long v23 = v2;
  long long v24 = v2;
  long long v22 = v2;
  long long v21 = v2;
  long long v20 = v2;
  long long v19 = v2;
  long long v18 = v2;
  long long v17 = v2;
  long long v16 = v2;
  long long v15 = v2;
  long long v14 = v2;
  long long v13 = v2;
  long long v12 = v2;
  long long v11 = v2;
  long long v10 = v2;
  long long v9 = v2;
  long long v8 = v2;
  long long v7 = v2;
  memset(v5, 170, sizeof(v5));
  int inputStruct = 16;
  int v3 = MTDeviceIssueDriverRequest(a1, &inputStruct, v5);
  return !(v3 | v5[0]) && LOBYTE(v5[1]) != 0;
}

uint64_t MTDeviceEnableWorkIntervalNotification(uint64_t a1)
{
  uint64_t v1 = 3758097084;
  if (!a1) {
    return 3758097090;
  }
  if (*(void *)(a1 + 5664)) {
    return 3758097109;
  }
  int v5 = -1431655766;
  if (mt_ServiceGetInt32Property(*(_DWORD *)(a1 + 16), @"FrameProcessingTimeoutUs", &v5)) {
    return 3758097095;
  }
  mach_timebase_info v4 = (mach_timebase_info)0xAAAAAAAAAAAAAAAALL;
  mach_timebase_info(&v4);
  *(void *)(a1 + 5656) = 1000 * v5 * (unint64_t)v4.denom / v4.numer;
  if (!work_interval_create()) {
    return 0;
  }
  *(void *)(a1 + 5664) = 0;
  return v1;
}

uint64_t MTDeviceNotifyWorkInterval(uint64_t a1, int a2)
{
  if (!a1) {
    return 3758097090;
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 5672) = a2;
  *(unsigned char *)(a1 + 5676) = 1;
  return result;
}

void _MTDriverAppendIOReporterChannelsToResetInfo()
{
  uint64_t v0 = IOReportCopyChannelsForDriver();
  if (v0)
  {
    uint64_t v1 = (const void *)v0;
    if ((int)IOReportGetChannelCount() >= 1) {
      IOReportCreateSubscription();
    }
    CFRelease(v1);
  }
}

__CFArray *MTDriverCreateResetInfo()
{
  theArray = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  if (theArray)
  {
    uint64_t v0 = 0;
    CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    char v2 = 1;
    CFStringRef v3 = @"ResetCount";
    mach_timebase_info v4 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
    do
    {
      char v5 = v2;
      unsigned int v6 = kRootDriverNames[v0];
      CFDictionaryRef v7 = IOServiceNameMatching(v6);
      if (v7)
      {
        uint64_t MatchingService = IOServiceGetMatchingService(0, v7);
        io_registry_entry_t ChildServiceWithProperty = findChildServiceWithProperty(MatchingService, v3);
        if (ChildServiceWithProperty)
        {
          io_registry_entry_t v10 = ChildServiceWithProperty;
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v1, 0, v4, MEMORY[0x263EFFF90]);
          if (Mutable)
          {
            long long v12 = Mutable;
            CFStringRef v13 = CFStringCreateWithCString(0, v6, 0x8000100u);
            if (v13)
            {
              CFStringRef v14 = v13;
              CFStringRef v15 = v3;
              CFDictionarySetValue(v12, @"Name", v13);
              for (uint64_t i = 0; i != 24; i += 8)
              {
                CFStringRef v17 = *(const __CFString **)((char *)&off_26479B2D0 + i);
                CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v10, v17, v1, 0);
                if (CFProperty)
                {
                  long long v19 = CFProperty;
                  CFDictionarySetValue(v12, v17, CFProperty);
                  CFRelease(v19);
                }
              }
              _MTDriverAppendIOReporterChannelsToResetInfo();
              CFTypeRef v20 = CFRetain(v12);
              CFRelease(v14);
              CFStringRef v3 = v15;
              mach_timebase_info v4 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
            }
            else
            {
              CFTypeRef v20 = 0;
            }
            CFRelease(v12);
            IOObjectRelease(v10);
            if (v20)
            {
              CFArrayAppendValue(theArray, v20);
              CFRelease(v20);
            }
          }
          else
          {
            IOObjectRelease(v10);
          }
        }
      }
      char v2 = 0;
      uint64_t v0 = 1;
    }
    while ((v5 & 1) != 0);
  }
  return theArray;
}

uint64_t findChildServiceWithProperty(uint64_t a1, const __CFString *a2)
{
  uint64_t v3 = 0;
  io_iterator_t iterator = 0;
  if (a1 && a2)
  {
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a1, a2, 0, 0);
    if (CFProperty)
    {
      unsigned int v6 = CFProperty;
      IOObjectRetain(a1);
      uint64_t v3 = a1;
    }
    else
    {
      if (!MEMORY[0x22A64C460](a1, "IOService", &iterator))
      {
        while (1)
        {
          uint64_t v8 = IOIteratorNext(iterator);
          if (!v8) {
            break;
          }
          uint64_t ChildServiceWithProperty = findChildServiceWithProperty(v8, a2);
          if (ChildServiceWithProperty)
          {
            uint64_t v3 = ChildServiceWithProperty;
            unsigned int v6 = 0;
            goto LABEL_10;
          }
        }
      }
      unsigned int v6 = 0;
      uint64_t v3 = 0;
    }
LABEL_10:
    if (iterator)
    {
      IOObjectRelease(iterator);
      io_iterator_t iterator = 0;
    }
    if (v6) {
      CFRelease(v6);
    }
  }
  if (a1) {
    IOObjectRelease(a1);
  }
  return v3;
}

uint64_t MTDeviceGetResetCount(uint64_t a1, _DWORD *a2)
{
  uint64_t v3 = 0;
  for (char i = 1; ; char i = 0)
  {
    char v5 = i;
    CFDictionaryRef v6 = IOServiceNameMatching(kRootDriverNames[v3]);
    if (v6)
    {
      uint64_t MatchingService = IOServiceGetMatchingService(0, v6);
      io_registry_entry_t ChildServiceWithProperty = findChildServiceWithProperty(MatchingService, @"ResetCount");
      if (ChildServiceWithProperty)
      {
        io_object_t v9 = ChildServiceWithProperty;
        CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(ChildServiceWithProperty, @"ResetCount", 0, 0);
        IOObjectRelease(v9);
        if (CFProperty)
        {
          int valuePtr = 0;
          int Value = CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
          CFRelease(CFProperty);
          if (Value)
          {
            if ((valuePtr & 0x80000000) == 0) {
              break;
            }
          }
        }
      }
    }
    uint64_t v3 = 1;
    if ((v5 & 1) == 0) {
      return 3758097136;
    }
  }
  if (a2) {
    *a2 = valuePtr;
  }
  return 0;
}

uint64_t MTSwapInt16DeviceToHost(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = __rev16(a2);
  if (*(_DWORD *)(a1 + 100) == 1) {
    return a2;
  }
  else {
    return v2;
  }
}

uint64_t MTSwapInt16PtrDeviceToHost(uint64_t result, unsigned __int16 *a2)
{
  unsigned int v2 = bswap32(*a2) >> 16;
  if (*(_DWORD *)(result + 100) == 1) {
    unsigned __int16 v3 = *a2;
  }
  else {
    unsigned __int16 v3 = v2;
  }
  *a2 = v3;
  return result;
}

uint64_t MTSwapInt16HostToDevice(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = __rev16(a2);
  if (*(_DWORD *)(a1 + 100) == 1) {
    return a2;
  }
  else {
    return v2;
  }
}

uint64_t MTSwapInt16PtrHostToDevice(uint64_t result, unsigned __int16 *a2)
{
  unsigned int v2 = bswap32(*a2) >> 16;
  if (*(_DWORD *)(result + 100) == 1) {
    unsigned __int16 v3 = *a2;
  }
  else {
    unsigned __int16 v3 = v2;
  }
  *a2 = v3;
  return result;
}

uint64_t MTSwapInt32DeviceToHost(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = bswap32(a2);
  if (*(_DWORD *)(a1 + 100) == 1) {
    return a2;
  }
  else {
    return v2;
  }
}

uint64_t MTSwapInt32PtrDeviceToHost(uint64_t result, unsigned int *a2)
{
  unsigned int v2 = bswap32(*a2);
  if (*(_DWORD *)(result + 100) == 1) {
    unsigned int v3 = *a2;
  }
  else {
    unsigned int v3 = v2;
  }
  *a2 = v3;
  return result;
}

uint64_t MTSwapInt32HostToDevice(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = bswap32(a2);
  if (*(_DWORD *)(a1 + 100) == 1) {
    return a2;
  }
  else {
    return v2;
  }
}

uint64_t MTSwapInt32PtrHostToDevice(uint64_t result, unsigned int *a2)
{
  unsigned int v2 = bswap32(*a2);
  if (*(_DWORD *)(result + 100) == 1) {
    unsigned int v3 = *a2;
  }
  else {
    unsigned int v3 = v2;
  }
  *a2 = v3;
  return result;
}

NSObject *mt_CreateBinaryFilters(uint64_t a1)
{
  uint64_t v163 = *MEMORY[0x263EF8340];
  unint64_t v147 = 0xAAAAAAAAAAAAAAAALL;
  if (mt_DeviceCopyArrayProperty(a1, @"BinaryFilters", &v147))
  {
    unsigned int v2 = 0;
    unint64_t v147 = 0;
  }
  else
  {
    unsigned int v2 = (void *)v147;
  }
  if ([v2 count])
  {
    unsigned int v3 = objc_opt_new();
    mach_timebase_info v4 = (void *)[objc_alloc(NSURL) initFileURLWithPath:@"/System/Library/MultitouchPlugins" isDirectory:1];
    uint64_t v142 = a1;
    if (v4)
    {
      uint64_t v5 = objc_opt_new();
      CFDictionaryRef v6 = v5;
      if (v5)
      {
        v120 = v5;
        v121 = v2;
        uint64_t v7 = a1;
        uint64_t v8 = +[MTAHTSupport getInterfaceInServiceTree:MTDeviceGetService(a1)];
        io_object_t v9 = v8;
        io_registry_entry_t v10 = v3;
        v122 = v3;
        v123 = v4;
        if (!v8)
        {
          if (v142)
          {
            CFStringRef v14 = v2;
            if (*(unsigned char *)(v142 + 133)) {
              mt_CachePropertiesForDevice(v142);
            }
            long long v12 = MTLoggingFramework();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              uint64_t v29 = *(void *)(v142 + 64);
              *(_DWORD *)buf = 134217984;
              *(void *)&uint8_t buf[4] = v29;
              _os_log_impl(&dword_2262CF000, v12, OS_LOG_TYPE_ERROR, "MTDevice doesn't have an AHTInterface (deviceID 0x%llX)", buf, 0xCu);
            }
            CFStringRef v13 = 0;
            goto LABEL_58;
          }
          long long v12 = MTLoggingFramework();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2262CF000, v12, OS_LOG_TYPE_ERROR, "MTDevice doesn't have an AHTInterface", buf, 2u);
          }
          CFStringRef v13 = 0;
          CFStringRef v14 = v121;
          io_registry_entry_t v10 = v122;
          goto LABEL_57;
        }
        long long v11 = [v8 getBootLoader];
        if (v11)
        {
LABEL_9:
          *(void *)buf = MEMORY[0x263EF8330];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __mt_CreateGetPropertyBlock_block_invoke;
          v160 = &unk_26479B338;
          uint64_t v7 = v142;
          id v161 = v11;
          uint64_t v162 = v142;
          long long v12 = v11;
          CFStringRef v13 = (void *)MEMORY[0x22A64CAF0](buf);

          CFStringRef v14 = v121;
LABEL_58:

          if (v13) {
            uint64_t v39 = v13;
          }
          else {
            uint64_t v39 = &__block_literal_global;
          }
          uint64_t v124 = MEMORY[0x22A64CAF0](v39);

          uint64_t v40 = objc_opt_new();
          LODWORD(v148) = -1431655766;
          if (!MTDeviceGetVersion(v7, &v148))
          {
            uint64_t v41 = [NSString stringWithFormat:@"%@0x%08X", @"MTFW-", v148];
            [v40 addObject:v41];
          }
          long long v42 = (void *)[objc_alloc(MEMORY[0x263F086E0]) initWithPath:@"/System/Library/Extensions/AppleMultitouchSPI.kext/PlugIns/MultitouchHID.plugin/"];
          uint64_t v43 = v42;
          unint64_t v44 = 0x263EFF000;
          if (v42)
          {
            long long v45 = [v42 objectForInfoDictionaryKey:@"CFBundleVersion"];
            if (v45)
            {
              long long v46 = [NSString stringWithFormat:@"%@%@", @"MultitouchHID.plugin-", v45];
              [v40 addObject:v46];
            }
          }
          long long v47 = (void *)[objc_alloc(MEMORY[0x263F086E0]) initWithPath:@"/System/Library/PrivateFrameworks/MultitouchSupport.framework/"];
          if (v47)
          {
            long long v48 = [v43 objectForInfoDictionaryKey:@"CFBundleVersion"];
            if (v48)
            {
              long long v49 = [NSString stringWithFormat:@"%@%@", @"MultitouchSupport.framework-", v48];
              [v40 addObject:v49];

              unint64_t v44 = 0x263EFF000uLL;
            }
          }
          if ([v40 count])
          {
            id v50 = v40;
          }
          else if (v142)
          {
            if (*(unsigned char *)(v142 + 133)) {
              mt_CachePropertiesForDevice(v142);
            }
            long long v51 = MTLoggingFramework();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              uint64_t v52 = *(void *)(v142 + 64);
              *(_DWORD *)buf = 134217984;
              *(void *)&uint8_t buf[4] = v52;
              _os_log_impl(&dword_2262CF000, v51, OS_LOG_TYPE_ERROR, "No versions could be retrieved (deviceID 0x%llX)", buf, 0xCu);
            }

            id v50 = 0;
          }
          else
          {
            v118 = MTLoggingFramework();
            if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2262CF000, v118, OS_LOG_TYPE_ERROR, "No versions could be retrieved", buf, 2u);
            }

            id v50 = 0;
            CFStringRef v14 = v121;
            io_registry_entry_t v10 = v122;
          }
          long long v24 = v124;

          long long v145 = 0u;
          long long v146 = 0u;
          long long v143 = 0u;
          long long v144 = 0u;
          id obj = v14;
          uint64_t v53 = v142;
          uint64_t v135 = [obj countByEnumeratingWithState:&v143 objects:v154 count:16];
          unsigned int v3 = v10;
          if (v135)
          {
            unint64_t v54 = 0x263EFF000uLL;
            uint64_t v133 = *(void *)v144;
            id v134 = v50;
            do
            {
              uint64_t v55 = 0;
              do
              {
                if (*(void *)v144 != v133) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v139 = v55;
                long long v56 = *(void **)(*((void *)&v143 + 1) + 8 * v55);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v152 = @"Name";
                  v153 = v56;
                  long long v58 = [*(id *)(v54 + 2352) dictionaryWithObjects:&v153 forKeys:&v152 count:1];
                  long long v57 = (void *)[v58 mutableCopy];

                  unint64_t v54 = 0x263EFF000;
                  if (!v50) {
                    goto LABEL_89;
                  }
LABEL_88:
                  long long v59 = (void *)[v50 mutableCopy];
                  [v57 setObject:v59 forKey:@"Versions"];

                  unint64_t v54 = 0x263EFF000;
                  goto LABEL_89;
                }
                long long v57 = (void *)[v56 mutableCopy];
                if (v50) {
                  goto LABEL_88;
                }
LABEL_89:
                id v60 = v4;
                id v61 = v57;
                v140 = v24;
                v141 = v61;
                long long v62 = [v61 objectForKeyedSubscript:@"Name"];
                v138 = v60;
                if (!v62)
                {
                  id v64 = 0;
                  uint64_t v65 = v139;
                  goto LABEL_149;
                }
                v137 = v62;
                v136 = [NSString stringWithFormat:@"%@.plugin", v62];
                long long v63 = (void *)[objc_alloc(*(Class *)(v44 + 2608)) initWithString:v136 relativeToURL:v60];
                id v64 = 0;
                uint64_t v65 = v139;
                if ([v63 checkResourceIsReachableAndReturnError:0])
                {
                  id v66 = v63;
                  id v67 = v141;
                  v132 = v140;
                  long long v68 = (void *)[objc_alloc(MEMORY[0x263F086E0]) initWithURL:v66];
                  v130 = v67;
                  v131 = v63;
                  if ([v68 load])
                  {
                    long long v69 = v4;
                    long long v70 = v3;
                    id v128 = v66;
                    long long v71 = v68;
                    long long v72 = (objc_class *)[v68 principalClass];
                    if ([(objc_class *)v72 conformsToProtocol:&unk_26D9FF830])
                    {
                      id v73 = [v72 alloc];
                      if (objc_opt_respondsToSelector())
                      {
                        id v64 = (id)[v73 initWithInfo:v67 getProperty:v132];
                        id v66 = v128;
                        goto LABEL_98;
                      }
                      id v74 = v67;
                      long long v75 = v132;
                      v127 = v74;
                      uint64_t v76 = [v74 objectForKeyedSubscript:@"PropertyNames"];
                      objc_opt_class();
                      v126 = (void *)v76;
                      v125 = v73;
                      if (objc_opt_isKindOfClass())
                      {
                        uint64_t v77 = objc_opt_new();
                        if (v77)
                        {
                          v78 = v77;
                          long long v150 = 0u;
                          long long v151 = 0u;
                          long long v148 = 0u;
                          long long v149 = 0u;
                          id v79 = v126;
                          uint64_t v80 = [v79 countByEnumeratingWithState:&v148 objects:buf count:16];
                          if (!v80) {
                            goto LABEL_120;
                          }
                          uint64_t v81 = v80;
                          uint64_t v82 = *(void *)v149;
                          while (1)
                          {
                            uint64_t v83 = 0;
                            do
                            {
                              if (*(void *)v149 != v82) {
                                objc_enumerationMutation(v79);
                              }
                              uint64_t v84 = *(void *)(*((void *)&v148 + 1) + 8 * v83);
                              v85 = (*(void (**)(NSObject *, uint64_t))(v124 + 16))(v75, v84);
                              if (v85)
                              {
                                [v78 setObject:v85 forKeyedSubscript:v84];
                                goto LABEL_115;
                              }
                              if (v53)
                              {
                                if (*(unsigned char *)(v53 + 133)) {
                                  mt_CachePropertiesForDevice(v53);
                                }
                                v86 = MTLoggingFramework();
                                if (!os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
                                  goto LABEL_114;
                                }
                                uint64_t v87 = *(void *)(v142 + 64);
                                *(_DWORD *)v155 = 138543618;
                                uint64_t v156 = v84;
                                __int16 v157 = 2048;
                                uint64_t v158 = v87;
                                v88 = v86;
                                v89 = "Could not retrieve the property %{public}@ (deviceID 0x%llX)";
                                uint32_t v90 = 22;
                              }
                              else
                              {
                                v86 = MTLoggingFramework();
                                if (!os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
                                  goto LABEL_114;
                                }
                                *(_DWORD *)v155 = 138543362;
                                uint64_t v156 = v84;
                                v88 = v86;
                                v89 = "Could not retrieve the property %{public}@";
                                uint32_t v90 = 12;
                              }
                              _os_log_impl(&dword_2262CF000, v88, OS_LOG_TYPE_ERROR, v89, v155, v90);
LABEL_114:

                              uint64_t v53 = v142;
LABEL_115:

                              ++v83;
                            }
                            while (v81 != v83);
                            long long v68 = v71;
                            uint64_t v91 = [v79 countByEnumeratingWithState:&v148 objects:buf count:16];
                            uint64_t v81 = v91;
                            if (!v91)
                            {
LABEL_120:

                              [v127 setObject:v78 forKeyedSubscript:@"Properties"];
                              unsigned int v3 = v122;
                              mach_timebase_info v4 = v123;
                              unint64_t v44 = 0x263EFF000;
                              uint64_t v65 = v139;
                              id v66 = v128;
                              goto LABEL_133;
                            }
                          }
                        }
                        if (v53)
                        {
                          unsigned int v3 = v70;
                          if (*(unsigned char *)(v53 + 133)) {
                            mt_CachePropertiesForDevice(v53);
                          }
                          v93 = MTLoggingFramework();
                          mach_timebase_info v4 = v69;
                          if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                          {
                            uint64_t v94 = *(void *)(v53 + 64);
                            *(_DWORD *)buf = 134217984;
                            *(void *)&uint8_t buf[4] = v94;
                            _os_log_impl(&dword_2262CF000, v93, OS_LOG_TYPE_ERROR, "Could not allocate properties dict (deviceID 0x%llX)", buf, 0xCu);
                          }

                          v78 = 0;
                          id v66 = v128;
                          goto LABEL_132;
                        }
                        v109 = MTLoggingFramework();
                        unsigned int v3 = v70;
                        if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_2262CF000, v109, OS_LOG_TYPE_ERROR, "Could not allocate properties dict", buf, 2u);
                        }

                        v78 = 0;
                        id v66 = v128;
                      }
                      else
                      {
                        if (v53)
                        {
                          id v66 = v128;
                          unsigned int v3 = v70;
                          if (*(unsigned char *)(v53 + 133)) {
                            mt_CachePropertiesForDevice(v53);
                          }
                          v78 = MTLoggingFramework();
                          mach_timebase_info v4 = v69;
                          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
                          {
                            uint64_t v92 = *(void *)(v53 + 64);
                            *(_DWORD *)buf = 134217984;
                            *(void *)&uint8_t buf[4] = v92;
                            _os_log_impl(&dword_2262CF000, v78, OS_LOG_TYPE_DEBUG, "No property names to read (deviceID 0x%llX)", buf, 0xCu);
                          }
                          goto LABEL_132;
                        }
                        v78 = MTLoggingFramework();
                        id v66 = v128;
                        unsigned int v3 = v70;
                        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_2262CF000, v78, OS_LOG_TYPE_DEBUG, "No property names to read", buf, 2u);
                        }
                      }
                      mach_timebase_info v4 = v69;
LABEL_132:
                      unint64_t v44 = 0x263EFF000;
LABEL_133:

                      id v64 = (id)[v125 initWithInfo:v127];
                      long long v24 = v124;
                    }
                    else
                    {
                      id v66 = v128;
                      id v64 = [[MTBinaryFilterLegacy alloc] initFromURL:v128 device:v53];
LABEL_98:
                      unsigned int v3 = v70;
                      mach_timebase_info v4 = v69;
                      unint64_t v44 = 0x263EFF000;
                    }
                  }
                  else
                  {
                    id v64 = 0;
                  }

                  id v95 = v66;
                  if (v64)
                  {
                    if (v53)
                    {
                      if (*(unsigned char *)(v53 + 133)) {
                        mt_CachePropertiesForDevice(v53);
                      }
                      v96 = MTLoggingFramework();
                      if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
                      {
                        uint64_t v97 = *(void *)(v53 + 64);
                        *(_DWORD *)buf = 138543618;
                        *(void *)&uint8_t buf[4] = v95;
                        *(_WORD *)&buf[12] = 2048;
                        *(void *)&buf[14] = v97;
                        v98 = v96;
                        os_log_type_t v99 = OS_LOG_TYPE_INFO;
                        v100 = "Created binary filter from %{public}@ (deviceID 0x%llX)";
                        goto LABEL_145;
                      }
LABEL_147:

                      unint64_t v54 = 0x263EFF000;
                      long long v63 = v131;
                      goto LABEL_148;
                    }
                    v96 = MTLoggingFramework();
                    if (!os_log_type_enabled(v96, OS_LOG_TYPE_INFO)) {
                      goto LABEL_147;
                    }
                    *(_DWORD *)buf = 138543362;
                    *(void *)&uint8_t buf[4] = v95;
                    v98 = v96;
                    os_log_type_t v99 = OS_LOG_TYPE_INFO;
                    v100 = "Created binary filter from %{public}@";
LABEL_166:
                    uint32_t v102 = 12;
                  }
                  else
                  {
                    if (!v53)
                    {
                      v96 = MTLoggingFramework();
                      if (!os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_147;
                      }
                      *(_DWORD *)buf = 138543362;
                      *(void *)&uint8_t buf[4] = v95;
                      v98 = v96;
                      os_log_type_t v99 = OS_LOG_TYPE_ERROR;
                      v100 = "Couldn't create binary filter from %{public}@";
                      goto LABEL_166;
                    }
                    if (*(unsigned char *)(v53 + 133)) {
                      mt_CachePropertiesForDevice(v53);
                    }
                    v96 = MTLoggingFramework();
                    if (!os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_147;
                    }
                    uint64_t v101 = *(void *)(v53 + 64);
                    *(_DWORD *)buf = 138543618;
                    *(void *)&uint8_t buf[4] = v95;
                    *(_WORD *)&buf[12] = 2048;
                    *(void *)&buf[14] = v101;
                    v98 = v96;
                    os_log_type_t v99 = OS_LOG_TYPE_ERROR;
                    v100 = "Couldn't create binary filter from %{public}@ (deviceID 0x%llX)";
LABEL_145:
                    uint32_t v102 = 22;
                  }
                  _os_log_impl(&dword_2262CF000, v98, v99, v100, buf, v102);
                  goto LABEL_147;
                }
LABEL_148:

                long long v62 = v137;
LABEL_149:

                if (v64)
                {
                  mt_UpdateMaxPacketSize(v53, v64);
                  [v3 addObject:v64];
                  goto LABEL_158;
                }
                if (v53)
                {
                  if (*(unsigned char *)(v53 + 133)) {
                    mt_CachePropertiesForDevice(v53);
                  }
                  v103 = MTLoggingFramework();
                  if (!os_log_type_enabled(v103, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_157;
                  }
                  v104 = [v141 objectForKeyedSubscript:@"Name"];
                  uint64_t v105 = *(void *)(v142 + 64);
                  *(_DWORD *)buf = 138543618;
                  *(void *)&uint8_t buf[4] = v104;
                  *(_WORD *)&buf[12] = 2048;
                  *(void *)&buf[14] = v105;
                  v106 = v103;
                  v107 = "Cannot create filter %{public}@ (deviceID 0x%llX)";
                  uint32_t v108 = 22;
                }
                else
                {
                  v103 = MTLoggingFramework();
                  if (!os_log_type_enabled(v103, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_157;
                  }
                  v104 = [v141 objectForKeyedSubscript:@"Name"];
                  *(_DWORD *)buf = 138543362;
                  *(void *)&uint8_t buf[4] = v104;
                  v106 = v103;
                  v107 = "Cannot create filter %{public}@";
                  uint32_t v108 = 12;
                }
                _os_log_impl(&dword_2262CF000, v106, OS_LOG_TYPE_ERROR, v107, buf, v108);

                uint64_t v53 = v142;
LABEL_157:

                unint64_t v54 = 0x263EFF000;
LABEL_158:

                uint64_t v55 = v65 + 1;
                id v50 = v134;
              }
              while (v55 != v135);
              uint64_t v110 = [obj countByEnumeratingWithState:&v143 objects:v154 count:16];
              uint64_t v135 = v110;
            }
            while (v110);
          }

          if ((unint64_t)[v3 count] < 0xB)
          {
            CFDictionaryRef v6 = v120;
            if ([v3 count]) {
              long long v19 = v3;
            }
            else {
              long long v19 = 0;
            }
            unsigned int v2 = v121;
          }
          else
          {
            uint64_t v111 = v53;
            CFDictionaryRef v6 = v120;
            if (v111)
            {
              if (*(unsigned char *)(v111 + 133)) {
                mt_CachePropertiesForDevice(v142);
              }
              v112 = MTLoggingFramework();
              unsigned int v2 = v121;
              if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
              {
                int v113 = [v3 count];
                uint64_t v114 = *(void *)(v142 + 64);
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)&uint8_t buf[4] = v113;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = 10;
                *(_WORD *)&buf[14] = 2048;
                *(void *)&buf[16] = v114;
                _os_log_impl(&dword_2262CF000, v112, OS_LOG_TYPE_ERROR, "Too many filters. Found %u, max supported: %u (deviceID 0x%llX)", buf, 0x18u);
              }

              long long v19 = 0;
            }
            else
            {
              v116 = MTLoggingFramework();
              if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
              {
                int v117 = [v3 count];
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v117;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = 10;
                _os_log_impl(&dword_2262CF000, v116, OS_LOG_TYPE_ERROR, "Too many filters. Found %u, max supported: %u", buf, 0xEu);
              }

              long long v19 = 0;
              CFDictionaryRef v6 = v120;
              unsigned int v2 = v121;
              mach_timebase_info v4 = v123;
              long long v24 = v124;
            }
          }

          goto LABEL_186;
        }
        uint64_t v30 = v142;
        if (v142)
        {
          if (*(unsigned char *)(v142 + 133)) {
            mt_CachePropertiesForDevice(v142);
          }
          long long v31 = MTLoggingFramework();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v32 = *(void *)(v142 + 64);
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v32;
            _os_log_impl(&dword_2262CF000, v31, OS_LOG_TYPE_DEFAULT, "AHTInterface doesn't have an AHTBootloader. Trying with AHTDevice (deviceID 0x%llX)", buf, 0xCu);
          }
        }
        else
        {
          long long v31 = MTLoggingFramework();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2262CF000, v31, OS_LOG_TYPE_DEFAULT, "AHTInterface doesn't have an AHTBootloader. Trying with AHTDevice", buf, 2u);
          }
          io_registry_entry_t v10 = v3;
          uint64_t v30 = 0;
        }

        long long v33 = +[MTAHTSupport getDeviceInServiceTree:MTDeviceGetService(v30)];
        long long v12 = v33;
        if (v33)
        {
          uint64_t v34 = [v33 getBootLoader];
          if (v34)
          {
            long long v11 = (void *)v34;

            goto LABEL_9;
          }
          if (v142)
          {
            CFStringRef v14 = v121;
            if (*(unsigned char *)(v142 + 133)) {
              mt_CachePropertiesForDevice(v142);
            }
            long long v35 = MTLoggingFramework();
            if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
              goto LABEL_56;
            }
            uint64_t v38 = *(void *)(v142 + 64);
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v38;
            long long v37 = "AHTDevice doesn't have an AHTBootloader (deviceID 0x%llX)";
            goto LABEL_55;
          }
          long long v35 = MTLoggingFramework();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v119 = "AHTDevice doesn't have an AHTBootloader";
            goto LABEL_211;
          }
        }
        else
        {
          if (v30)
          {
            CFStringRef v14 = v121;
            if (*(unsigned char *)(v30 + 133)) {
              mt_CachePropertiesForDevice(v142);
            }
            long long v35 = MTLoggingFramework();
            if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
              goto LABEL_56;
            }
            uint64_t v36 = *(void *)(v142 + 64);
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v36;
            long long v37 = "MTDevice doesn't have an AHTDevice (deviceID 0x%llX)";
LABEL_55:
            _os_log_impl(&dword_2262CF000, v35, OS_LOG_TYPE_ERROR, v37, buf, 0xCu);
LABEL_56:

            CFStringRef v13 = 0;
LABEL_57:
            uint64_t v7 = v142;
            goto LABEL_58;
          }
          long long v35 = MTLoggingFramework();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v119 = "MTDevice doesn't have an AHTDevice";
LABEL_211:
            _os_log_impl(&dword_2262CF000, v35, OS_LOG_TYPE_ERROR, v119, buf, 2u);
          }
        }
        CFStringRef v14 = v121;
        io_registry_entry_t v10 = v122;
        goto LABEL_56;
      }
      if (a1)
      {
        if (*(unsigned char *)(a1 + 133)) {
          mt_CachePropertiesForDevice(a1);
        }
        long long v24 = MTLoggingFramework();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          goto LABEL_30;
        }
        uint64_t v25 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v25;
        long long v26 = "Cannot allocate bundles (deviceID 0x%llX)";
        long long v27 = v24;
        uint32_t v28 = 12;
      }
      else
      {
        long long v24 = MTLoggingFramework();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          goto LABEL_30;
        }
        *(_WORD *)buf = 0;
        long long v26 = "Cannot allocate bundles";
        long long v27 = v24;
        uint32_t v28 = 2;
      }
      _os_log_impl(&dword_2262CF000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
LABEL_30:
      long long v19 = 0;
LABEL_186:

      goto LABEL_187;
    }
    if (a1)
    {
      if (*(unsigned char *)(a1 + 133)) {
        mt_CachePropertiesForDevice(a1);
      }
      CFDictionaryRef v6 = MTLoggingFramework();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      uint64_t v20 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v20;
      long long v21 = "Cannot create URL from default path (deviceID 0x%llX)";
      long long v22 = v6;
      uint32_t v23 = 12;
    }
    else
    {
      CFDictionaryRef v6 = MTLoggingFramework();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      *(_WORD *)buf = 0;
      long long v21 = "Cannot create URL from default path";
      long long v22 = v6;
      uint32_t v23 = 2;
    }
    _os_log_impl(&dword_2262CF000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
LABEL_23:
    long long v19 = 0;
LABEL_187:

    goto LABEL_188;
  }
  if (a1)
  {
    if (*(unsigned char *)(a1 + 133)) {
      mt_CachePropertiesForDevice(a1);
    }
    unsigned int v3 = MTLoggingFramework();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_16;
    }
    uint64_t v15 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v15;
    long long v16 = "No binary filters found (deviceID 0x%llX)";
    CFStringRef v17 = v3;
    uint32_t v18 = 12;
  }
  else
  {
    unsigned int v3 = MTLoggingFramework();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    long long v16 = "No binary filters found";
    CFStringRef v17 = v3;
    uint32_t v18 = 2;
  }
  _os_log_impl(&dword_2262CF000, v17, OS_LOG_TYPE_DEBUG, v16, buf, v18);
LABEL_16:
  long long v19 = 0;
LABEL_188:

  return v19;
}

void mt_UpdateMaxPacketSize(uint64_t a1, void *a2)
{
  *(void *)&v23[7] = *MEMORY[0x263EF8340];
  id v3 = a2;
  unsigned int v4 = [v3 maxFrameSize];
  if (v4 <= MTDeviceGetDriverMaxPacketSize(a1)) {
    goto LABEL_16;
  }
  if (a1)
  {
    if (*(unsigned char *)(a1 + 133)) {
      mt_CachePropertiesForDevice(a1);
    }
    uint64_t v5 = MTLoggingFramework();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = [v3 maxFrameSize];
      uint64_t v7 = *(void *)(a1 + 64);
      int v20 = 67109376;
      int v21 = v6;
      __int16 v22 = 2048;
      *(void *)uint32_t v23 = v7;
      uint64_t v8 = "Setting a max injection packet size of %u (deviceID 0x%llX)";
      io_object_t v9 = v5;
      uint32_t v10 = 18;
LABEL_7:
      _os_log_impl(&dword_2262CF000, v9, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)&v20, v10);
    }
  }
  else
  {
    uint64_t v5 = MTLoggingFramework();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 67109120;
      int v21 = [v3 maxFrameSize];
      uint64_t v8 = "Setting a max injection packet size of %u";
      io_object_t v9 = v5;
      uint32_t v10 = 8;
      goto LABEL_7;
    }
  }

  int v11 = MTDeviceSetInjectionMaxPacketSize((io_service_t *)a1, [v3 maxFrameSize]);
  if (v11)
  {
    int v12 = v11;
    if (a1)
    {
      if (*(unsigned char *)(a1 + 133)) {
        mt_CachePropertiesForDevice(a1);
      }
      CFStringRef v13 = MTLoggingFramework();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      int v14 = [v3 maxFrameSize];
      uint64_t v15 = *(void *)(a1 + 64);
      int v20 = 67109632;
      int v21 = v14;
      __int16 v22 = 1024;
      *(_DWORD *)uint32_t v23 = v12;
      v23[2] = 2048;
      *(void *)&v23[3] = v15;
      long long v16 = "Error setting max injection packet size to %u: 0x%08X (deviceID 0x%llX)";
      CFStringRef v17 = v13;
      uint32_t v18 = 24;
    }
    else
    {
      CFStringRef v13 = MTLoggingFramework();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      int v19 = [v3 maxFrameSize];
      int v20 = 67109376;
      int v21 = v19;
      __int16 v22 = 1024;
      *(_DWORD *)uint32_t v23 = v12;
      long long v16 = "Error setting max injection packet size to %u: 0x%08X";
      CFStringRef v17 = v13;
      uint32_t v18 = 14;
    }
    _os_log_impl(&dword_2262CF000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v20, v18);
LABEL_15:
  }
LABEL_16:
}

void mt_ApplyBinaryFilters(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned int a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 2232))
  {
    *(unsigned char *)(a1 + 2232) = 0;
    if (*(unsigned char *)(a1 + 133)) {
      mt_CachePropertiesForDevice(a1);
    }
    uint64_t v8 = MTLoggingFramework();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 134217984;
      uint64_t v21 = v9;
      _os_log_impl(&dword_2262CF000, v8, OS_LOG_TYPE_INFO, "Resetting Binary Filters (deviceID 0x%llX)", buf, 0xCu);
    }

    id v10 = *(id *)(a1 + 2224);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:buf count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          [v15 reset];
          mt_UpdateMaxPacketSize(a1, v15);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:buf count:16];
      }
      while (v12);
    }
  }
  kdebug_trace();
  mt_ApplyBinaryFilter(a1, 0, a2, a3, a4, 1);
}

void mt_ApplyBinaryFilter(uint64_t a1, unsigned int a2, unsigned __int8 *a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  long long v17 = a3;
  unsigned int v15 = a5;
  unsigned int v16 = a4;
  id v11 = *(id *)(a1 + 2224);
  if ([v11 count] == a2)
  {
    if (a6) {
      kdebug_trace();
    }
    mt_ProcessMultitouchFrame(a1, a3, a4);
  }
  else
  {
    uint64_t v12 = [v11 objectAtIndexedSubscript:a2];
    kdebug_trace();
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __mt_ApplyBinaryFilter_block_invoke;
    v13[3] = &__block_descriptor_41_e14_v24__0_8I16I20l;
    char v14 = a2;
    v13[4] = a1;
    [v12 filterFrame:&v17 size:&v16 maxSize:&v15 extraFrame:v13];
    kdebug_trace();
    if (v16)
    {
      mt_ApplyBinaryFilter(a1, (a2 + 1), v17, v16, v15, a6);
    }
    else if (a6)
    {
      kdebug_trace();
    }
  }
}

void mt_SetBinaryFiltersProperty(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (*(unsigned char *)(a1 + 133)) {
      mt_CachePropertiesForDevice(a1);
    }
    int v6 = MTLoggingFramework();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = a2;
      __int16 v24 = 2114;
      uint64_t v25 = a3;
      __int16 v26 = 2048;
      uint64_t v27 = v7;
      uint64_t v8 = "Setting Binary Filters property %{public}@ = %{public}@ (deviceID 0x%llX)";
      uint64_t v9 = v6;
      uint32_t v10 = 32;
LABEL_6:
      _os_log_impl(&dword_2262CF000, v9, OS_LOG_TYPE_INFO, v8, buf, v10);
    }
  }
  else
  {
    int v6 = MTLoggingFramework();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = a2;
      __int16 v24 = 2114;
      uint64_t v25 = a3;
      uint64_t v8 = "Setting Binary Filters property %{public}@ = %{public}@";
      uint64_t v9 = v6;
      uint32_t v10 = 22;
      goto LABEL_6;
    }
  }

  id v11 = *(id *)(a1 + 2224);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        unsigned int v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v16 setProperty:a2 withValue:a3];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

uint64_t MTSet16BitScalingRange(uint64_t result, unsigned int a2)
{
  if (a2 > result)
  {
    gMT16BitConversionRange = result;
    word_26812BE2A = a2;
  }
  return result;
}

__int16 *mt_Scale8BitBufferTo16BitRange(__int16 *result, int a2, int a3)
{
  if (a2 >= 1)
  {
    uint64_t v3 = a2;
    do
    {
      *uint64_t result = *result * a3 / 256;
      ++result;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t mt_Scale16BitRangeTo8Bits(uint64_t result, int a2, int a3, int a4, int a5)
{
  if (a2 >= 1)
  {
    uint64_t v5 = (__int16 *)(result + 134);
    uint64_t v6 = 1;
    do
    {
      if (a3 >= 1)
      {
        uint64_t v7 = (a3 + 1) - 1;
        uint64_t v8 = v5;
        do
        {
          *uint64_t v8 = ((*v8 - a4) * (65280 / (a5 - a4))) >> 8;
          ++v8;
          --v7;
        }
        while (v7);
      }
      ++v6;
      v5 += 66;
    }
    while (v6 != a2 + 1);
  }
  return result;
}

uint64_t mt_UncompressTouchpadCodecV1Force(void *a1, uint64_t a2, unint64_t a3, int a4, unsigned int a5, int a6, _DWORD *a7)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  *a7 = 0;
  if (a3 > 0xF)
  {
    *a7 = 16;
    bzero(a1, 2 * a5 * a4);
    for (uint64_t i = 0; i != 4; ++i)
    {
      unsigned int v18 = ((3 * a5) >> 1) - 1;
      unsigned __int16 v19 = a5;
      switch((char)i)
      {
        case 0:
          unsigned int v18 = (3 * a5) >> 1;
          unsigned __int16 v19 = 2 * a5 - 4;
          break;
        case 1:
          break;
        case 2:
          unsigned __int16 v19 = 0;
          LOWORD(v18) = (a5 >> 1) - 1;
          break;
        case 3:
          unsigned int v18 = a5 >> 1;
          unsigned __int16 v19 = a5 - 4;
          break;
        default:
          uint64_t v22 = MTLoggingFramework();
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            return 3758096385;
          }
          LOWORD(v23[0]) = 0;
          uint64_t v9 = "Invalid force sensor index\n";
          uint32_t v10 = v22;
          uint32_t v11 = 2;
          goto LABEL_4;
      }
      unsigned int v20 = *(_DWORD *)(a2 + 4 * i);
      if (a6)
      {
        unsigned int v21 = (unsigned __int16)v18;
      }
      else
      {
        *((_WORD *)a1 + (unsigned __int16)v18) = v20 >> 8;
        *((_WORD *)a1 + v19 + 2) = HIWORD(v20);
        unsigned int v21 = v19 + 3;
      }
      *((_WORD *)a1 + v21) = v20;
    }
    return 0;
  }
  else
  {
    int v7 = a3;
    uint64_t v8 = MTLoggingFramework();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v23[0] = 67109376;
      v23[1] = v7;
      __int16 v24 = 1024;
      int v25 = 16;
      uint64_t v9 = "Uncompressed image buffer(%u) was too small to handle expected number of force bytes(%u)\n";
      uint32_t v10 = v8;
      uint32_t v11 = 14;
LABEL_4:
      _os_log_impl(&dword_2262CF000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)v23, v11);
    }
    return 3758096385;
  }
}

uint64_t mt_UncompressTouchpadCodecV1Touch(uint64_t a1, uint64_t a2, unint64_t a3, unsigned __int16 a4, unsigned int a5)
{
  uint64_t v9 = touchpadCodecCreate((unsigned __int16)a5, a4, 16, 0, 0);
  if (v9)
  {
    uint64_t v10 = touchpadCodecDecodeImage((uint64_t)v9, a1, 2 * a5, a2, a3);
    uint64_t v11 = 0;
    if (!v10)
    {
      uint64_t v11 = 3758097084;
      uint64_t v12 = MTLoggingFramework();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        __int16 v16 = 0;
        uint64_t v13 = "Touchpad codec v1 failed to decode the provided image\n";
        uint64_t v14 = (uint8_t *)&v16;
LABEL_7:
        _os_log_impl(&dword_2262CF000, v12, OS_LOG_TYPE_ERROR, v13, v14, 2u);
      }
    }
  }
  else
  {
    uint64_t v11 = 3758097084;
    uint64_t v12 = MTLoggingFramework();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v13 = "Touchpad codec v1 failed to create codec\n";
      uint64_t v14 = buf;
      goto LABEL_7;
    }
  }
  return v11;
}

uint64_t mt_UncompressTouchpadCodecV1Image(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5, unsigned int a6, int a7)
{
  uint64_t result = 3758097085;
  unsigned int v9 = a5 - 2;
  if (a5 < 2) {
    return 3758097090;
  }
  if (a2 >= 2 * (unint64_t)(a6 * a5))
  {
    unsigned int v13 = 0;
    uint64_t result = mt_UncompressTouchpadCodecV1Force((void *)(a1 + 2 * v9 * a6), a3, a4, 2, a6, a7, &v13);
    if (!result) {
      return mt_UncompressTouchpadCodecV1Touch(a1, a3 + v13, a4 - v13, v9, a6);
    }
  }
  return result;
}

double alg_InitTimeState(uint64_t a1, int a2)
{
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 20) = 12000 / a2;
  *(_DWORD *)(a1 + 24) = 12000 / a2;
  *(_DWORD *)(a1 + 28) = ((10923 * (__int16)(12000 / a2)) >> 21) + ((10923 * (__int16)(12000 / a2)) >> 31);
  return result;
}

_DWORD *alg_UpdateTimeState(_DWORD *result, int a2, int a3)
{
  int v3 = result[1];
  *double result = v3;
  result[1] = a2;
  int v4 = result[3];
  result[3] = a3;
  result[4] = v4;
  result[2] = a2 - v3;
  if (v3 && (int v5 = a3 - v4, v5 >= 3))
  {
    result[5] = 12 * v5;
    int v6 = 16 * v5;
  }
  else
  {
    int v7 = result[6];
    result[5] = v7 * (a2 - v3);
    int v6 = v7 / 192;
  }
  result[7] = v6;
  return result;
}

uint64_t mtalg_LibraryGetTypeID()
{
  uint64_t result = __kmtalg_LibraryTypeID;
  if (!__kmtalg_LibraryTypeID)
  {
    pthread_once(&__mtalgLibraryTypeInit, (void (*)(void))__mtalgLibraryRegister);
    return __kmtalg_LibraryTypeID;
  }
  return result;
}

uint64_t __mtalgLibraryRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kmtalg_LibraryTypeID = result;
  return result;
}

uint64_t mtalg_CreateAlgLibraryForDevice(uint64_t a1, size_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  if (!a1) {
    return 0;
  }
  if (!__kmtalg_LibraryTypeID) {
    pthread_once(&__mtalgLibraryTypeInit, (void (*)(void))__mtalgLibraryRegister);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v18 = Instance;
  if (Instance)
  {
    mt_InitImagerGridAndTimeState(Instance + 24, a2, a3, a4, a5, a6, a7, v17, a9, a10);
    mt_InitPathLifeCycles(v18);
  }
  return v18;
}

void mt_InitImagerGridAndTimeState(uint64_t a1, size_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  int v12 = a4;
  int v13 = a2;
  memset(v19, 170, 7);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_OWORD *)(a1 + 384) = 0u;
  *(_OWORD *)(a1 + 400) = 0u;
  *(_OWORD *)(a1 + 416) = 0u;
  *(_OWORD *)(a1 + 432) = 0u;
  *(_OWORD *)(a1 + 448) = 0u;
  *(_OWORD *)(a1 + 464) = 0u;
  uint64_t v15 = a1 + 464;
  *(_OWORD *)(a1 + 480) = 0u;
  mt_FillDefaultMultitouchRegion(a2, a3, a5, a4, (uint64_t)v19);
  if (a7 >= 1) {
    __int16 v16 = a7;
  }
  else {
    __int16 v16 = 256;
  }
  alg_InitSurfaceGrid(a1, v12, v19, (int *)(a5 + 84), (int *)(a5 + 91), v16);
  alg_InitTimeState(v15, 60);
  if (WORD2(a10) || a10 || HIWORD(a10))
  {
    *(_WORD *)(a1 + 354) = a10;
    *(_WORD *)(a1 + 352) = WORD2(a10);
    *(_WORD *)(a1 + 356) = HIWORD(a10);
    *(_WORD *)(a1 + 358) = WORD1(a10);
    char v17 = 1;
  }
  else
  {
    char v17 = 0;
  }
  *(unsigned char *)(a1 + 459) = v17;
  if (!gMT_BE_LESS_VERBOSE) {
    printf("*** %s (0x%lx) family*** (%2d cols X %2d rows)\n", *(const char **)(a1 + 32), *(unsigned int *)(a1 + 24), a3, v13);
  }
}

size_t mt_FillDefaultMultitouchRegion(size_t result, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v8 = result;
  if ((int)result > 64 || a2 >= 65)
  {
    uint64_t result = fprintf((FILE *)*MEMORY[0x263EF8348], "Image Buffer from device (%dx%d) larger than host arrays (%dx%d)!\n", result, a2, 64, 64);
    if (v8 >= 65) {
      mt_FillDefaultMultitouchRegion_cold_1();
    }
    if (a2 >= 65) {
      mt_FillDefaultMultitouchRegion_cold_2();
    }
  }
  if (!a3) {
    uint64_t result = fwrite("WARNING:  No Multitouch Device image regions specified!\n", 0x38uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
  }
  int v10 = *(unsigned __int8 *)(a3 + 7);
  unsigned int v9 = (int *)(a3 + 7);
  if (v10 == 1)
  {
    int v11 = *v9;
    *(_DWORD *)(a5 + 3) = *(int *)((char *)v9 + 3);
    *(_DWORD *)a5 = v11;
  }
  else
  {
    *(_WORD *)a5 = 1;
    *(_WORD *)(a5 + 3) = 1;
    *(unsigned char *)(a5 + 2) = v8;
    *(unsigned char *)(a5 + 5) = a2;
    *(unsigned char *)(a5 + 6) = 0;
  }
  return result;
}

uint64_t mt_ForwardPathFrame(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  MTAlg_IssueOpticalProximityCallback(a1, *(__int16 *)(a2 + 62));
  MTAlg_IssueInputDetectionStateCallback(a1, *(_DWORD *)(a2 + 68), *(__int16 *)(a2 + 62), *(__int16 *)(a2 + 66));
  MTAlg_IssueFarfieldProximityCallback(a1, *(__int16 *)(a2 + 66), *(__int16 *)(a2 + 66));
  return mt_ForwardBinaryContacts(a1, (unsigned char *)a2, a3, a4);
}

uint64_t mt_ExpandImageAndForward(uint64_t a1, __int16 *a2, uint64_t a3, uint64_t a4)
{
  int v8 = *(__int16 *)(a3 + 14);
  int v9 = *(unsigned __int16 *)(a3 + 12);
  int v10 = v9 + v8;
  int v11 = *(_DWORD *)a3;
  if (*(_DWORD *)a3)
  {
    uint64_t v12 = *(unsigned int *)(a3 + 4);
  }
  else if (*(unsigned char *)(a3 + 17))
  {
    if (*(unsigned char *)(a3 + 16) == 8)
    {
      mt_Scale8BitBufferTo16BitRange(a2, *(unsigned __int16 *)(a3 + 10) * *(unsigned __int16 *)(a3 + 8), (__int16)v9);
      int v11 = *(_DWORD *)a3;
      uint64_t v12 = 66562;
    }
    else
    {
      int v11 = 0;
      if (*(unsigned char *)(a3 + 18)) {
        uint64_t v12 = 65794;
      }
      else {
        uint64_t v12 = 258;
      }
    }
  }
  else
  {
    int v11 = 0;
    int v10 = 34816;
    int v8 = 30720;
    uint64_t v12 = 66;
  }
  mtp_ForwardDeviceImageBuffer(a1, a2, *(_WORD *)(a3 + 8), *(_WORD *)(a3 + 10), a4, v11, v12, v8, v10, 1);
  return v12;
}

void __mtalgLibraryInit(uint64_t a1)
{
  if (a1) {
    bzero((void *)(a1 + 16), 0x4EF8uLL);
  }
}

uint64_t MTDeviceGetTypeID()
{
  uint64_t result = __kMTDeviceTypeID;
  if (!__kMTDeviceTypeID)
  {
    pthread_once(&__deviceTypeInit, (void (*)(void))__MTDeviceRegister);
    return __kMTDeviceTypeID;
  }
  return result;
}

uint64_t __MTDeviceRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kMTDeviceTypeID = result;
  return result;
}

uint64_t MTDeviceCreate(io_object_t a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (!__kMTDeviceTypeID) {
    pthread_once(&__deviceTypeInit, (void (*)(void))__MTDeviceRegister);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    if (a1)
    {
      IOObjectRetain(a1);
      *(_DWORD *)(Instance + 16) = a1;
    }
    *(unsigned char *)(Instance + 41) = 1;
    *(unsigned char *)(Instance + 135) = 0;
    *(unsigned char *)(Instance + 114) = 0;
    *(_WORD *)(Instance + 130) = 0;
    *(unsigned char *)(Instance + 132) = 0;
    *(double *)(Instance + 144) = MTAbsoluteTimeGetCurrent();
    *(void *)(Instance + 104) = CFStringCreateWithCString(v2, "", 0x600u);
    *(_DWORD *)(Instance + 384) = 0;
    *(void *)(Instance + 392) = 0;
  }
  return Instance;
}

void ParsedMultitouchFrameRepInitialize(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = *(_DWORD *)(a1 + 48);
  bzero((void *)a1, 0x678uLL);
  *(void *)(a1 + 40) = v2;
  *(_DWORD *)(a1 + 48) = v3;
}

void *MT_ParsedMultitouchFrameRepCreate(unsigned int a1)
{
  uint64_t v2 = malloc_type_malloc(0x678uLL, 0x10100404899599CuLL);
  if (v2)
  {
    int v3 = malloc_type_malloc(a1, 0x9803198FuLL);
    if (v3)
    {
      int v4 = v3;
      bzero(v2, 0x678uLL);
      *((void *)v2 + 5) = v4;
      *((_DWORD *)v2 + 12) = a1;
    }
    else
    {
      free(v2);
      return 0;
    }
  }
  return v2;
}

void ParsedMultitouchFrameRepDestroy(void *a1)
{
  if (a1)
  {
    uint64_t v2 = (void *)a1[5];
    if (v2) {
      free(v2);
    }
    free(a1);
  }
}

double __MTDeviceInit(uint64_t a1)
{
  if (a1)
  {
    bzero((void *)(a1 + 16), 0x1628uLL);
    *(void *)(a1 + 16) = 0;
    *(void *)(a1 + 136) = 0;
    double Current = MTAbsoluteTimeGetCurrent();
    *(_OWORD *)(a1 + 220) = 0u;
    *(double *)(a1 + 144) = Current;
    *(_DWORD *)(a1 + 160) = 0;
    *(void *)(a1 + 168) = 0;
    *(unsigned char *)(a1 + 176) = 0;
    *(_DWORD *)(a1 + 180) = 0;
    *(void *)(a1 + 184) = 0;
    *(void *)(a1 + 212) = 0xFF000000FFLL;
    *(void *)(a1 + 192) = 0xFFFFFFFF00000000;
    *(void *)(a1 + 200) = 0;
    *(_DWORD *)(a1 + 207) = 0;
    *(_OWORD *)(a1 + 236) = 0u;
    *(_OWORD *)(a1 + 252) = 0u;
    *(_OWORD *)(a1 + 268) = 0u;
    *(_OWORD *)(a1 + 284) = 0u;
    *(_OWORD *)(a1 + 300) = 0u;
    *(_OWORD *)(a1 + 316) = 0u;
    *(_OWORD *)(a1 + 332) = 0u;
    *(_WORD *)(a1 + 133) = 1;
    *(_OWORD *)(a1 + 344) = 0u;
    bzero((void *)(a1 + 400), 0x650uLL);
    uint64_t v3 = 0;
    do
    {
      *(_DWORD *)(a1 + 400 + 4 * v3 + 1500) = 0;
      uint64_t v4 = a1 + 400 + 8 * v3;
      *(void *)(v4 + 1560) = 0;
      int v5 = malloc_type_malloc(0xFAuLL, 0xB32C598BuLL);
      *(void *)(v4 + 1560) = v5;
      if (v5)
      {
        int v6 = (char **)(v4 + 1560);
        *(_OWORD *)((char *)v5 + 234) = 0u;
        v5[13] = 0u;
        v5[14] = 0u;
        v5[11] = 0u;
        v5[12] = 0u;
        v5[9] = 0u;
        v5[10] = 0u;
        v5[7] = 0u;
        v5[8] = 0u;
        v5[5] = 0u;
        v5[6] = 0u;
        v5[3] = 0u;
        v5[4] = 0u;
        v5[1] = 0u;
        v5[2] = 0u;
        *int v5 = 0u;
        uint64_t v7 = v3 + 1;
        snprintf(*v6, 8uLL, "Channel %d", v3 + 1);
      }
      else
      {
        uint64_t v7 = v3 + 1;
      }
      *(void *)(a1 + 8 * v3 + 1920) = 0x40C000003F800000;
      uint64_t v3 = v7;
    }
    while (v7 != 5);
    *(unsigned char *)(a1 + 2000) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 2048) = 0u;
    *(void *)(a1 + 2016) = 0;
    *(void *)(a1 + 2032) = 0;
    *(void *)(a1 + 2024) = 0;
    *(unsigned char *)(a1 + 2040) = 0;
    *(_DWORD *)(a1 + 2064) = 0;
    *(unsigned char *)(a1 + 2068) = 0;
    *(_DWORD *)(a1 + 2092) = 0;
    *(unsigned char *)(a1 + 2096) = 0;
    *(void *)(a1 + 2104) = 0;
    *(_DWORD *)(a1 + 2112) = -1;
    *(_WORD *)(a1 + 2153) = 0;
    *(_OWORD *)(a1 + 2120) = 0u;
    *(_OWORD *)(a1 + 2136) = 0u;
  }
  return result;
}

void __MTDeviceRelease(uint64_t a1)
{
  if (a1)
  {
    MTDeviceStop(a1);
    io_object_t v2 = *(_DWORD *)(a1 + 16);
    if (v2)
    {
      IOObjectRelease(v2);
      *(_DWORD *)(a1 + 16) = 0;
    }
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      MTActuatorSetMTDevice(v3, 0);
      CFRelease(*(CFTypeRef *)(a1 + 32));
      *(void *)(a1 + 32) = 0;
    }
    uint64_t v4 = *(const void **)(a1 + 104);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(a1 + 104) = 0;
    }
    int v5 = *(void **)(a1 + 392);
    if (v5)
    {
      ParsedMultitouchFrameRepDestroy(v5);
      *(void *)(a1 + 392) = 0;
    }
    uint64_t v6 = 0;
    uint64_t v7 = a1 + 1960;
    do
    {
      int v8 = *(void **)(v7 + v6);
      if (v8)
      {
        free(v8);
        *(void *)(v7 + v6) = 0;
      }
      v6 += 8;
    }
    while (v6 != 40);
    int v9 = *(const void **)(a1 + 152);
    if (v9)
    {
      CFRelease(v9);
      *(void *)(a1 + 152) = 0;
    }
    int v10 = *(const void **)(a1 + 2224);
    if (v10)
    {
      CFRelease(v10);
      *(void *)(a1 + 2224) = 0;
    }
    int v11 = *(const void **)(a1 + 2016);
    if (v11)
    {
      CFRelease(v11);
      *(void *)(a1 + 2016) = 0;
    }
    uint64_t v12 = *(__CFRunLoopSource **)(a1 + 2032);
    if (v12)
    {
      CFRunLoopSourceInvalidate(v12);
      CFRelease(*(CFTypeRef *)(a1 + 2032));
      *(void *)(a1 + 2032) = 0;
    }
    int v13 = *(NSObject **)(a1 + 2104);
    if (v13)
    {
      dispatch_release(v13);
      *(void *)(a1 + 2104) = 0;
    }
    uint64_t v14 = 0;
    uint64_t v15 = a1 + 5376;
    do
    {
      MTImageInfoRelease(*(void **)(v15 + v14));
      *(void *)(v15 + v14) = 0;
      v14 += 8;
    }
    while (v14 != 256);
    if (*(void *)(a1 + 5664))
    {
      work_interval_destroy();
      *(void *)(a1 + 5664) = 0;
    }
    __int16 v16 = *(const void **)(a1 + 5680);
    if (v16)
    {
      CFRelease(v16);
      *(void *)(a1 + 5680) = 0;
    }
  }
}

uint64_t mtalg_ProcessPathFrame(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t result = MTAlg_GetAlgLibStateRef(a1);
  if (result)
  {
    alg_UpdateTimeState((_DWORD *)(result + 488), a3, a4);
    return mt_ForwardPathFrame(a1, a2, a3, a4);
  }
  return result;
}

uint64_t mtalg_ProcessImageFrame(uint64_t a1, uint64_t a2, __int16 *a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = MTAlg_GetAlgLibStateRef(a1);
  if (result)
  {
    uint64_t v11 = result + 488;
    alg_UpdateTimeState((_DWORD *)(result + 488), a4, a5);
    if (*(unsigned char *)(a2 + 11) && *(unsigned char *)(a2 + 12)) {
      mt_ForwardPathFrame(a1, a2, a4, a5);
    }
    else {
      MTAlg_IssueOpticalProximityCallback(a1, *(__int16 *)(a2 + 62));
    }
    return mt_ExpandImageAndForward(a1, a3, a2 + 20, v11);
  }
  return result;
}

float Ypos2Erow_float(int a1, uint64_t a2)
{
  return (float)(*(unsigned __int8 *)(a2 + 2) - 1)
       - (float)((float)((float)a1 * (float)*(__int16 *)(a2 + 52)) / (float)(100 * *(_DWORD *)(a2 + 48)));
}

float Xpos2Ecol_float(int a1, uint64_t a2)
{
  return (float)(*(unsigned __int8 *)(a2 + 5) - 1)
       - (float)((float)((float)a1 * (float)*(__int16 *)(a2 + 60)) / (float)(100 * *(_DWORD *)(a2 + 56)));
}

uint64_t Ypos2Brow(int a1, uint64_t a2)
{
  return (*(__int16 *)(a2 + 52) * a1 / (100 * *(_DWORD *)(a2 + 48)) + 1);
}

uint64_t Xpos2Bcol(int a1, uint64_t a2)
{
  return (*(__int16 *)(a2 + 60) * a1 / (100 * *(_DWORD *)(a2 + 56)) + 1);
}

uint64_t alg_ClipPosPointToScreenEdge(int a1, unsigned __int16 *a2)
{
  unsigned __int16 v2 = a1;
  int v3 = a1 >> 16;
  if ((__int16)a1 >= (__int16)*a2) {
    unsigned __int16 v2 = *a2;
  }
  if ((__int16)a2[1] > (__int16)a1) {
    unsigned __int16 v2 = a2[1];
  }
  if (v3 >= (__int16)a2[2]) {
    LOWORD(v3) = a2[2];
  }
  if ((__int16)a2[3] > a1 >> 16) {
    LOWORD(v3) = a2[3];
  }
  return v2 | ((unsigned __int16)v3 << 16);
}

uint64_t alg_DeriveExtrapolationGain(int a1)
{
  uint64_t result = 89;
  if ((a1 - 96) >= 8)
  {
    unsigned int v3 = a1 - 112;
    if (v3 > 0x30 || ((1 << v3) & 0x1000000030001) == 0) {
      return 51;
    }
  }
  return result;
}

uint64_t alg_ComputeMinDistToSideElectrodes(uint64_t a1, __int16 a2, int a3)
{
  if ((__int16)(a2 - *(_WORD *)(a1 + 362)) >= (__int16)(*(_WORD *)(a1 + 360) - a2)) {
    int v3 = (__int16)(*(_WORD *)(a1 + 360) - a2);
  }
  else {
    int v3 = (__int16)(a2 - *(_WORD *)(a1 + 362));
  }
  if (v3 < 0 && a3) {
    int v3 = ((__int16)v3 << 8) / *(_DWORD *)(a1 + 64);
  }
  return (__int16)v3;
}

uint64_t alg_ComputeMinDistToTopBottomElectrodes(uint64_t a1, int a2, int a3)
{
  if ((__int16)(*(_WORD *)(a1 + 364) - HIWORD(a2)) >= (__int16)(HIWORD(a2) - *(_WORD *)(a1 + 366))) {
    int v3 = (__int16)(HIWORD(a2) - *(_WORD *)(a1 + 366));
  }
  else {
    int v3 = (__int16)(*(_WORD *)(a1 + 364) - HIWORD(a2));
  }
  if (v3 < 0 && a3) {
    int v3 = ((__int16)v3 << 8) / *(_DWORD *)(a1 + 68);
  }
  return (__int16)v3;
}

uint64_t alg_FindSwipeEdgeType(uint64_t a1, int a2, int a3, int a4)
{
  if ((__int16)(a2 - *(_WORD *)(a1 + 362)) >= (__int16)(*(_WORD *)(a1 + 360) - a2)) {
    int v4 = (__int16)(*(_WORD *)(a1 + 360) - a2);
  }
  else {
    int v4 = (__int16)(a2 - *(_WORD *)(a1 + 362));
  }
  if (v4 < 0) {
    int v4 = ((__int16)v4 << 8) / *(_DWORD *)(a1 + 64);
  }
  int v5 = (__int16)(*(_WORD *)(a1 + 364) - HIWORD(a2));
  if (v5 >= (__int16)(HIWORD(a2) - *(_WORD *)(a1 + 366))) {
    int v5 = (__int16)(HIWORD(a2) - *(_WORD *)(a1 + 366));
  }
  if (v5 < 0) {
    int v5 = ((__int16)v5 << 8) / *(_DWORD *)(a1 + 68);
  }
  if ((__int16)v4 >= (__int16)v5)
  {
    int v9 = (a2 >> 16) - *(__int16 *)(a1 + 366);
    int v10 = *(__int16 *)(a1 + 364) - (a2 >> 16);
    if (a4 < 1 || v9 >= v10)
    {
      if (v9 > v10)
      {
        BOOL v14 = __OFSUB__(a4, 1);
        BOOL v13 = a4 - 1 < 0;
      }
      else
      {
        BOOL v14 = 0;
        BOOL v13 = 0;
      }
      if (v13 != v14) {
        return 2;
      }
      else {
        return 4;
      }
    }
    else
    {
      return 3;
    }
  }
  else
  {
    int v6 = (__int16)a2 - *(__int16 *)(a1 + 362);
    int v7 = *(__int16 *)(a1 + 360) - (__int16)a2;
    if (a3 < 1 || v6 >= v7)
    {
      if (v6 > v7)
      {
        BOOL v12 = __OFSUB__(a3, 1);
        BOOL v11 = a3 - 1 < 0;
      }
      else
      {
        BOOL v12 = 0;
        BOOL v11 = 0;
      }
      if (v11 != v12) {
        return 1;
      }
      else {
        return 4;
      }
    }
    else
    {
      return 0;
    }
  }
}

uint64_t alg_ComputeMinDistToEdges(uint64_t a1, int a2, __int16 a3)
{
  if ((a3 & 0xC) == 0)
  {
    LOWORD(v3) = 0x7FFF;
    goto LABEL_11;
  }
  if ((__int16)(a2 - *(_WORD *)(a1 + 362)) >= (__int16)(*(_WORD *)(a1 + 360) - a2)) {
    int v3 = (__int16)(*(_WORD *)(a1 + 360) - a2);
  }
  else {
    int v3 = (__int16)(a2 - *(_WORD *)(a1 + 362));
  }
  if (v3 < 0)
  {
    int v3 = ((__int16)v3 << 8) / *(_DWORD *)(a1 + 64);
    if ((a3 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (a3) {
LABEL_10:
  }
    LOWORD(v3) = *(_WORD *)(a1 + 346) + v3;
LABEL_11:
  if ((a3 & 0x30) != 0)
  {
    if ((__int16)(*(_WORD *)(a1 + 364) - HIWORD(a2)) >= (__int16)(HIWORD(a2) - *(_WORD *)(a1 + 366))) {
      int v4 = (__int16)(HIWORD(a2) - *(_WORD *)(a1 + 366));
    }
    else {
      int v4 = (__int16)(*(_WORD *)(a1 + 364) - HIWORD(a2));
    }
    if (v4 < 0)
    {
      int v4 = ((__int16)v4 << 8) / *(_DWORD *)(a1 + 68);
      if ((a3 & 1) == 0)
      {
LABEL_17:
        if ((a3 & 0x100) == 0) {
          goto LABEL_18;
        }
LABEL_21:
        int v3 = (int)hypot((double)(__int16)v3, (double)(__int16)v4);
        return (__int16)v3;
      }
    }
    else if ((a3 & 1) == 0)
    {
      goto LABEL_17;
    }
    LOWORD(v4) = *(_WORD *)(a1 + 348) + v4;
    if ((a3 & 0x100) != 0) {
      goto LABEL_21;
    }
  }
  else
  {
    LOWORD(v4) = 0x7FFF;
    if ((a3 & 0x100) != 0) {
      goto LABEL_21;
    }
  }
LABEL_18:
  if ((__int16)v3 >= (__int16)v4) {
    LOWORD(v3) = v4;
  }
  return (__int16)v3;
}

uint64_t alg_InitRowColXYConvert(uint64_t a1)
{
  uint64_t v2 = 0;
  int v3 = 100 * *(_DWORD *)(a1 + 48);
  int v4 = *(__int16 *)(a1 + 52);
  int v5 = v3 * ~*(_DWORD *)(a1 + 72);
  do
  {
    *(_WORD *)(a1 + 212 + v2) = v5 / v4;
    v5 += v3;
    v2 += 2;
  }
  while (v2 != 132);
  int v6 = 100 * *(_DWORD *)(a1 + 56);
  int v7 = *(__int16 *)(a1 + 60);
  int v8 = v6 * ~*(_DWORD *)(a1 + 76);
  for (uint64_t i = 80; i != 212; i += 2)
  {
    *(_WORD *)(a1 + i) = v8 / v7;
    v8 += v6;
  }
  uint64_t v10 = *(unsigned __int8 *)(a1 + 5);
  __int16 v25 = *(_WORD *)(a1 + 2 * *(unsigned __int8 *)(a1 + 2) + 212);
  *(_WORD *)(a1 + 364) = v25;
  __int16 v11 = *(_WORD *)(a1 + 214);
  *(_WORD *)(a1 + 366) = v11;
  __int16 v12 = *(_WORD *)(a1 + 2 * v10 + 80);
  *(_WORD *)(a1 + 360) = v12;
  __int16 v13 = *(_WORD *)(a1 + 82);
  *(_WORD *)(a1 + 362) = v13;
  int v14 = *(_DWORD *)(a1 + 24);
  unsigned int v15 = v14 - 87;
  if ((v14 - 87) >= 6)
  {
    int v17 = 373;
    int v16 = 343;
    switch(v14)
    {
      case 20:
      case 21:
        int v16 = 384;
        int v17 = 384;
        break;
      case 23:
        break;
      case 25:
        int v17 = 340;
        int v16 = 448;
        break;
      case 26:
        int v17 = 330;
        break;
      default:
        int v16 = 256;
        int v17 = 256;
        break;
    }
  }
  else
  {
    int v16 = 512;
    int v17 = 512;
  }
  int v18 = v6 / v7;
  uint64_t result = alg_DeriveExtrapolationGain(v14);
  if (v15 >= 6) {
    int v20 = 384;
  }
  else {
    int v20 = 424;
  }
  unsigned int v21 = ((result * v20) & 0xFF00u) / (((unsigned __int16)(result * v20) >> 8) | 0x100u);
  int v22 = v18 * v21;
  *(_DWORD *)(a1 + 64) = v16;
  *(_DWORD *)(a1 + 68) = v17;
  int v23 = (__int16)((int)(v3 / v4 * v21) / 256) * v17 / 256;
  *(_WORD *)(a1 + 348) = v23;
  *(_WORD *)(a1 + 350) = v23;
  int v24 = (__int16)(v22 / 256) * v16 / 256;
  *(_WORD *)(a1 + 346) = v24;
  *(_WORD *)(a1 + 344) = v24;
  if (!*(unsigned char *)(a1 + 459))
  {
    *(_WORD *)(a1 + 356) = v25 + v23;
    *(_WORD *)(a1 + 358) = v11 - v23;
    *(_WORD *)(a1 + 352) = v12 + v24;
    *(_WORD *)(a1 + 354) = v13 - v24;
  }
  return result;
}

uint64_t alg_InitZephyrPlatformSpecifics(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 24);
  switch(v1)
  {
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
      *(void *)(result + 32) = "Recognized";
      *(unsigned char *)(result + 457) = 1;
      *(void *)(result + 40) = 0x1D4C00001388;
      *(_DWORD *)(result + 48) = 36;
      *(_WORD *)(result + 52) = 7;
      *(_DWORD *)(result + 56) = 56;
      __int16 v12 = 11;
      goto LABEL_52;
    case 85:
    case 86:
    case 93:
    case 94:
    case 95:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 127:
LABEL_20:
      *(unsigned char *)(result + 457) = 1;
      *(void *)(result + 40) = 0x1D4C00001388;
      *(_DWORD *)(result + 48) = 36;
      *(_WORD *)(result + 52) = 7;
      *(_DWORD *)(result + 56) = 56;
      *(_WORD *)(result + 60) = 11;
      *(void *)(result + 32) = "Recognized";
      return result;
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
      *(void *)(result + 32) = "Recognized";
      *(unsigned char *)(result + 457) = 1;
      int v5 = v1 - 89;
      if ((v1 - 89) > 3)
      {
        __int16 v11 = 150;
        int v10 = 749;
        LOWORD(v9) = 92;
        int v8 = 409;
        int v7 = 8900;
        int v6 = 5000;
      }
      else
      {
        int v6 = dword_2262EEE90[v5];
        int v7 = dword_2262EEEA0[v5];
        int v8 = dword_2262EEEB0[v5];
        unint64_t v9 = 0xA0064000A0064uLL >> (16 * v5);
        int v10 = dword_2262EEEC0[v5];
        __int16 v11 = 25;
      }
      *(_DWORD *)(result + 40) = v6;
      *(_DWORD *)(result + 44) = v7;
      *(_DWORD *)(result + 48) = v8;
      *(_WORD *)(result + 52) = v9;
      *(_DWORD *)(result + 56) = v10;
      *(_WORD *)(result + 60) = v11;
      return result;
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 128:
    case 129:
LABEL_2:
      *(void *)(result + 32) = "Recognized";
      BOOL v2 = (v1 - 96) < 8 || v1 == 160;
      *(unsigned char *)(result + 457) = v2;
      *(unsigned char *)(result + 458) = 1;
      if (v1 <= 127)
      {
        int v3 = 7600;
        switch(v1)
        {
          case 'a':
            uint64_t v4 = 0x12DE00002742;
            goto LABEL_36;
          case 'b':
          case 'c':
          case 'e':
            goto LABEL_43;
          case 'd':
            *(void *)(result + 40) = 0x186A00002904;
            int v15 = (unsigned __int16)((*(unsigned __int8 *)(result + 5)
                                    - 1
                                    + (((*(unsigned __int8 *)(result + 5) - 1) & 0x8000u) >> 15)) >> 1);
            *(_DWORD *)(result + 72) = 0;
            *(_DWORD *)(result + 76) = v15;
LABEL_46:
            LOWORD(v1) = 10;
            int v24 = 57;
LABEL_47:
            *(_DWORD *)(result + 48) = v24;
            *(_WORD *)(result + 52) = v1;
            goto LABEL_48;
          case 'f':
            *(void *)(result + 40) = 0x1A7F00002BA2;
            int v16 = (unsigned __int16)((*(unsigned __int8 *)(result + 5)
                                    - 1
                                    + (((*(unsigned __int8 *)(result + 5) - 1) & 0x8000u) >> 15)) >> 1);
            *(_DWORD *)(result + 72) = 0;
            *(_DWORD *)(result + 76) = v16;
LABEL_49:
            *(_DWORD *)(result + 48) = 539;
            *(_WORD *)(result + 52) = 100;
            goto LABEL_50;
          case 'g':
            *(void *)(result + 40) = 0x1DB000002904;
            int v17 = (unsigned __int16)((*(unsigned __int8 *)(result + 5)
                                    - 1
                                    + (((*(unsigned __int8 *)(result + 5) - 1) & 0x8000u) >> 15)) >> 1);
            *(_DWORD *)(result + 72) = 0;
            *(_DWORD *)(result + 76) = v17;
LABEL_44:
            *(_DWORD *)(result + 48) = 60;
            *(_WORD *)(result + 52) = 10;
            goto LABEL_45;
          default:
            goto LABEL_42;
        }
      }
      if (v1 == 128)
      {
        uint64_t v4 = 0x2AF8000032C8;
LABEL_36:
        *(void *)(result + 40) = v4;
        int v21 = (unsigned __int16)((*(unsigned __int8 *)(result + 5)
                                - 1
                                + (((*(unsigned __int8 *)(result + 5) - 1) & 0x8000u) >> 15)) >> 1);
        *(_DWORD *)(result + 72) = 0;
        *(_DWORD *)(result + 76) = v21;
LABEL_37:
        *(_DWORD *)(result + 48) = 242;
        *(_WORD *)(result + 52) = 47;
        if (v1 > 128)
        {
          __int16 v12 = 100;
          int v25 = 513;
        }
        else if ((v1 - 99) < 2)
        {
LABEL_48:
          __int16 v12 = 100;
          int v25 = 501;
        }
        else if (v1 == 102)
        {
LABEL_50:
          __int16 v12 = 100;
          int v25 = 493;
        }
        else
        {
LABEL_45:
          __int16 v12 = 41;
          int v25 = 212;
        }
        goto LABEL_51;
      }
      if (v1 == 129)
      {
        uint64_t v4 = 0x2B2000003CF0;
        goto LABEL_36;
      }
      if (v1 != 160)
      {
LABEL_42:
        int v3 = 6300;
LABEL_43:
        *(_DWORD *)(result + 40) = 10500;
        *(_DWORD *)(result + 44) = v3;
        int v22 = *(unsigned __int8 *)(result + 5) - 1;
        *(_DWORD *)(result + 72) = 0;
        *(_DWORD *)(result + 76) = (unsigned __int16)((v22 + ((unsigned __int16)(v22 & 0x8000) >> 15)) >> 1);
        int v23 = v1 - 99;
        int v1 = 8;
        int v24 = 47;
        switch(v23)
        {
          case 0:
            goto LABEL_47;
          case 1:
            goto LABEL_46;
          case 2:
          case 4:
            goto LABEL_44;
          case 3:
            goto LABEL_49;
          default:
            goto LABEL_37;
        }
      }
      *(void *)(result + 40) = 0xE3800000D84;
      int v13 = (unsigned __int16)((*(unsigned __int8 *)(result + 5)
                              - 1
                              + (((*(unsigned __int8 *)(result + 5) - 1) & 0x8000u) >> 15)) >> 1);
      *(_DWORD *)(result + 72) = 0;
      *(_DWORD *)(result + 76) = v13;
      *(_DWORD *)(result + 48) = 44;
      *(_WORD *)(result + 52) = 10;
      __int16 v12 = 10;
      int v25 = 49;
LABEL_51:
      *(_DWORD *)(result + 56) = v25;
LABEL_52:
      *(_WORD *)(result + 60) = v12;
      return result;
    case 112:
      *(void *)(result + 32) = "Recognized";
      *(_WORD *)(result + 457) = 257;
      *(void *)(result + 40) = 0x236000001420;
      int v14 = *(unsigned __int8 *)(result + 5) - 1;
      *(_DWORD *)(result + 72) = 0;
      *(_DWORD *)(result + 76) = (unsigned __int16)((v14 + ((unsigned __int16)(v14 & 0x8000) >> 15)) >> 1);
      *(_DWORD *)(result + 48) = 242;
      *(_WORD *)(result + 52) = 47;
      *(_DWORD *)(result + 56) = 212;
      __int16 v12 = 41;
      goto LABEL_52;
    default:
      switch(v1)
      {
        case 17:
          *(void *)(result + 32) = "Recognized";
          *(void *)(result + 40) = 0x399900004CCCLL;
          goto LABEL_26;
        case 18:
          *(void *)(result + 32) = "Recognized";
          unsigned int v18 = *(unsigned __int8 *)(result + 5) - 1 + (((*(unsigned __int8 *)(result + 5) - 1) & 0x8000u) >> 15);
          int v19 = *(unsigned __int8 *)(result + 2) - 1;
          *(void *)(result + 40) = 0x69780000A7F8;
          *(_DWORD *)(result + 72) = (unsigned __int16)((v19 + ((unsigned __int16)(v19 & 0x8000) >> 15)) >> 1);
          *(_DWORD *)(result + 76) = (unsigned __int16)(v18 >> 1);
LABEL_26:
          *(_DWORD *)(result + 48) = 139;
          *(_WORD *)(result + 52) = 28;
          *(_DWORD *)(result + 56) = 104;
          __int16 v12 = 21;
          goto LABEL_52;
        case 19:
          *(void *)(result + 32) = "Recognized";
          uint64_t v20 = 0x4CCC00003999;
          goto LABEL_30;
        case 20:
          *(void *)(result + 32) = "Recognized";
          *(void *)(result + 40) = 0x3E6600002ECCLL;
          *(_DWORD *)(result + 48) = 126;
          *(_WORD *)(result + 52) = 25;
          *(_DWORD *)(result + 56) = 91;
          __int16 v12 = 18;
          goto LABEL_52;
        case 21:
          *(void *)(result + 32) = "Recognized";
          uint64_t v20 = 0x4CC900003999;
LABEL_30:
          *(void *)(result + 40) = v20;
          *(_DWORD *)(result + 48) = 104;
          *(_WORD *)(result + 52) = 21;
          *(_DWORD *)(result + 56) = 139;
          __int16 v12 = 28;
          break;
        case 22:
        case 24:
          goto LABEL_20;
        case 23:
          *(void *)(result + 32) = "Recognized";
          *(void *)(result + 40) = 0x667300004CCCLL;
          *(_DWORD *)(result + 48) = 4127;
          __int16 v12 = 1000;
          *(_WORD *)(result + 52) = 1000;
          int v25 = 4121;
          goto LABEL_51;
        case 25:
          *(void *)(result + 32) = "Recognized";
          *(void *)(result + 40) = 0x4CCA00003998;
          *(_DWORD *)(result + 48) = 41298;
          __int16 v12 = 10000;
          *(_WORD *)(result + 52) = 10000;
          int v25 = 41196;
          goto LABEL_51;
        case 26:
          *(void *)(result + 32) = "Recognized";
          *(void *)(result + 40) = 0x3E6600002ECCLL;
          *(_DWORD *)(result + 48) = 40320;
          __int16 v12 = 10000;
          *(_WORD *)(result + 52) = 10000;
          int v25 = 40450;
          goto LABEL_51;
        default:
          if (v1 != 160) {
            goto LABEL_20;
          }
          goto LABEL_2;
      }
      goto LABEL_52;
  }
}

uint64_t alg_InitGridPitchAndEdgeOptions(uint64_t a1)
{
  *(_WORD *)(a1 + 368) = 413;
  int v1 = *(_DWORD *)(a1 + 24);
  if ((v1 - 19) > 7) {
    __int16 v2 = 9;
  }
  else {
    __int16 v2 = word_2262EEED0[v1 - 19];
  }
  *(_WORD *)(a1 + 370) = v2;
  *(unsigned char *)(a1 + 455) = *(unsigned char *)(a1 + 458);
  *(unsigned char *)(a1 + 454) = v1 == 112;
  *(unsigned char *)(a1 + 456) = ((v1 - 87) < 0x1A) & (0x200003Fu >> (v1 - 87));
  *(unsigned char *)(a1 + 453) = (v1 - 87) < 6;
  unsigned int v3 = v1 - 27;
  if (*(unsigned char *)(a1 + 457)) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v3 >= 0xFFFFFFFC;
  }
  char v5 = !v4;
  *(unsigned char *)(a1 + 452) = v5;
  return alg_InitRowColXYConvert(a1);
}

uint64_t alg_InitPathTrackingParams(uint64_t result, int a2, int a3)
{
  unsigned int v3 = a2 & 0xFFFFFFFE;
  if ((a2 & 0xFFFFFFFE) == 0x80) {
    __int16 v4 = 64;
  }
  else {
    __int16 v4 = 23;
  }
  if (v3 == 128) {
    __int16 v5 = 38;
  }
  else {
    __int16 v5 = 12;
  }
  *(_WORD *)uint64_t result = v4;
  *(_WORD *)(result + 2) = v5;
  *(void *)(result + 4) = 0x1E007900790099;
  *(_WORD *)(result + 12) = 40;
  if (a2 == 112) {
    __int16 v6 = 9;
  }
  else {
    __int16 v6 = 12;
  }
  *(_WORD *)(result + 16) = v6;
  if (a2 == 112) {
    int v7 = 399;
  }
  else {
    int v7 = 1536;
  }
  *(_DWORD *)(result + 20) = v7;
  *(_DWORD *)(result + 24) = 179;
  *(_WORD *)(result + 28) = 1;
  if (a3)
  {
    *(_WORD *)(result + 16) = 12;
    *(void *)(result + 20) = 563;
  }
  if (a2 == 128)
  {
    *(void *)(result + 32) = 0x258000F00000082;
    *(_WORD *)(result + 40) = 430;
    *(unsigned char *)(result + 43) = 0;
    *(_WORD *)(result + 6) = 217;
    return result;
  }
  *(void *)(result + 32) = 0x258000F00000066;
  *(_WORD *)(result + 40) = 430;
  unsigned int v8 = a2 - 23;
  if ((a2 - 23) > 3)
  {
    *(unsigned char *)(result + 43) = 0;
    if (a2 == 112)
    {
      *(_DWORD *)(result + 4) = 12058841;
      *(_WORD *)(result + 40) = 440;
      *(_DWORD *)(result + 36) = 40632420;
      return result;
    }
  }
  else
  {
    *(unsigned char *)(result + 43) = 1;
  }
  if ((a2 - 128) <= 0x20 && ((1 << (a2 + 0x80)) & 0x100000003) != 0)
  {
    if (a2 == 129) {
      __int16 v9 = 140;
    }
    else {
      __int16 v9 = 217;
    }
    if (a2 == 160) {
      __int16 v9 = 102;
    }
    *(_WORD *)(result + 6) = v9;
LABEL_29:
    if (v8 >= 4) {
      return result;
    }
    goto LABEL_30;
  }
  if (v3 == 20)
  {
    *(_DWORD *)(result + 38) = 28181065;
    goto LABEL_29;
  }
  if (v8 > 3) {
    return result;
  }
LABEL_30:
  *(_WORD *)(result + 4) = 184;
  *(_DWORD *)(result + 38) = 26214900;
  return result;
}

uint64_t alg_InitSurfaceGrid(uint64_t a1, int a2, int *a3, int *a4, int *a5, __int16 a6)
{
  *(_OWORD *)(a1 + 432) = 0u;
  *(_OWORD *)(a1 + 448) = 0u;
  *(_OWORD *)(a1 + 400) = 0u;
  *(_OWORD *)(a1 + 416) = 0u;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_OWORD *)(a1 + 384) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_DWORD *)(a1 + 24) = a2;
  if (a3)
  {
    int v7 = *a3;
    *(_DWORD *)(a1 + 3) = *(int *)((char *)a3 + 3);
    *(_DWORD *)a1 = v7;
  }
  if (a4)
  {
    int v8 = *a4;
    *(_DWORD *)(a1 + 10) = *(int *)((char *)a4 + 3);
    *(_DWORD *)(a1 + 7) = v8;
  }
  if (a5)
  {
    int v9 = *a5;
    *(_DWORD *)(a1 + 17) = *(int *)((char *)a5 + 3);
    *(_DWORD *)(a1 + 14) = v9;
  }
  *(_WORD *)(a1 + 386) = a6;
  *(_WORD *)(a1 + 392) = a6;
  *(_WORD *)(a1 + 398) = a6;
  *(_WORD *)(a1 + 404) = a6;
  *(_WORD *)(a1 + 380) = a6;
  alg_InitZephyrPlatformSpecifics(a1);
  alg_InitGridPitchAndEdgeOptions(a1);
  int v10 = *(_DWORD *)(a1 + 24);
  int v11 = *(unsigned __int8 *)(a1 + 458);
  return alg_InitPathTrackingParams(a1 + 408, v10, v11);
}

uint64_t MTDeviceGetReport(uint64_t a1, int a2, void *a3, unsigned int a4, _DWORD *a5)
{
  if (!a1) {
    return 3758097090;
  }
  if (*(_DWORD *)(a1 + 212)) {
    return mt_DeviceGetReportViaDriver(a1, a2, a3, a4, a5);
  }
  return mt_DeviceGetReportViaDriverLegacyUSB(a1, a2, a3, a4, a5);
}

uint64_t MTDeviceSetZephyrParameter(uint64_t a1, int a2, char a3)
{
  char v4 = a3;
  return MTDeviceSetReport(a1, a2, (uint64_t)&v4, 1);
}

uint64_t MTDeviceGetCriticalErrors(uint64_t a1, _DWORD *a2)
{
  uint64_t Report = 3758097090;
  if (a1)
  {
    if (a2)
    {
      uint64_t v6 = 0;
      uint64_t Report = MTDeviceGetReport(a1, 127, (char *)&v6 + 4, 4u, &v6);
      if (!Report && v6 == 4) {
        *a2 = MTSwapInt32DeviceToHost(a1, HIDWORD(v6));
      }
    }
  }
  return Report;
}

uint64_t MTDeviceGetOpenRows(uint64_t a1, void *a2)
{
  uint64_t v2 = 3758097095;
  if (!a2) {
    return 3758097090;
  }
  if (MTDeviceHasExpectedVersion(a1))
  {
    int v7 = -1431655766;
    if (!mt_DeviceGetInt32Property(a1, @"OpenRowsReportID", &v7))
    {
      int v6 = 0;
      *a2 = 0;
      return MTDeviceGetReport(a1, v7, a2, 8u, &v6);
    }
  }
  return v2;
}

uint64_t MTActuatorGetReport(uint64_t a1, char a2, void *a3, int a4, _DWORD *a5)
{
  if (a1) {
    return mt_ActuatorGetReportViaDriver(a1, a2, a3, a4, a5);
  }
  else {
    return 3758097090;
  }
}

uint64_t MTActuatorSetReport(uint64_t a1, char a2, uint64_t a3, signed int a4)
{
  uint64_t result = 3758097090;
  if (a1)
  {
    if (a4 <= 512) {
      return mt_ActuatorSetReportViaDriver(a1, a2, a3, a4);
    }
    else {
      return 3758097095;
    }
  }
  return result;
}

uint64_t MTActuatorSetWaveform(uint64_t a1, char a2, uint64_t a3, signed int a4)
{
  uint64_t v8 = 3758097090;
  kdebug_trace();
  if (!a1) {
    return v8;
  }
  if (a4 > 512) {
    return 3758097095;
  }
  return mt_ActuatorSetWaveformViaDriver(a1, a2, a3, a4);
}

uint64_t MTDeviceSetHostOperationState(uint64_t a1, char a2)
{
  char v3 = a2;
  return MTDeviceSetReport(a1, 113, (uint64_t)&v3, 1);
}

uint64_t MTDeviceGetHostOperationState(uint64_t a1)
{
  char v4 = -86;
  int Report = MTDeviceGetReport(a1, 113, &v4, 1u, 0);
  unsigned __int8 v2 = v4;
  if (Report) {
    return 0;
  }
  return v2;
}

uint64_t MTDeviceSendExternalMessage(uint64_t a1, const void *a2, __int16 a3, size_t a4, size_t a5)
{
  v13[1] = *MEMORY[0x263EF8340];
  size_t v9 = a4 + 6;
  if (a5)
  {
    size_t v10 = a5;
    if (v9 > a5) {
      return 3758097121;
    }
    MEMORY[0x270FA5388]();
    __int16 v12 = (_WORD *)((char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  }
  else
  {
    MEMORY[0x270FA5388]();
    __int16 v12 = (_WORD *)((char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (!v9)
    {
      size_t v10 = 0;
      goto LABEL_9;
    }
    size_t v10 = v9;
  }
  memset(v12, 170, v10);
LABEL_9:
  *__int16 v12 = 595;
  v12[1] = a4;
  v12[2] = a3;
  memcpy(v12 + 3, a2, a4);
  bzero((char *)v12 + v9, v10 - v9);
  return MTDeviceSetReport(a1, 98, (uint64_t)v12, v10);
}

void mt_DequeueMultitouchDataMachPortCallBack(CFMachPortRef port, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    uint64_t v5 = *(void *)a4;
    while (!*(unsigned char *)(v5 + 2040))
    {
      if (!CFMachPortIsValid(port) || !IODataQueueDataAvailable(*(IODataQueueMemory **)(a4 + 24))) {
        break;
      }
      uint32_t dataSize = *(_DWORD *)(v5 + 384);
      IOReturn v7 = IODataQueueDequeue(*(IODataQueueMemory **)(a4 + 24), *(void **)(a4 + 8), &dataSize);
      if (v7 == -536870181)
      {
        IODataQueueDequeue(*(IODataQueueMemory **)(a4 + 24), 0, 0);
      }
      else if (!v7)
      {
        mt_HandleMultitouchFrame(v5, *(unsigned __int8 **)(a4 + 8), dataSize, *(_DWORD *)(v5 + 384));
      }
    }
  }
}

void mt_StopDequeueOfMultitouchDataFromDevice(uint64_t a1)
{
  if (a1)
  {
    unsigned __int8 v2 = *(__CFMachPort **)(a1 + 2016);
    if (v2)
    {
      memset(&v8, 0, sizeof(v8));
      CFMachPortGetContext(v2, &v8);
      CFMachPortInvalidate(*(CFMachPortRef *)(a1 + 2016));
      mach_timebase_info info = v8.info;
      if (v8.info)
      {
        mach_port_t Port = CFMachPortGetPort(*(CFMachPortRef *)(a1 + 2016));
        uint64_t v5 = info[3];
        int v6 = (ipc_space_t *)MEMORY[0x263EF8960];
        if (v5) {
          MEMORY[0x22A64C330](*(unsigned int *)(a1 + 20), 0, *MEMORY[0x263EF8960]);
        }
        if (Port) {
          mach_port_mod_refs(*v6, Port, 1u, -1);
        }
        IOReturn v7 = *(void **)(a1 + 136);
        if (v7)
        {
          free(v7);
          *(void *)(a1 + 136) = 0;
        }
        CFRelease(*(CFTypeRef *)(a1 + 2016));
        *(void *)(a1 + 2016) = 0;
        free(v8.info);
      }
    }
  }
}

uint64_t mt_DeviceGetReportViaDriverLegacyUSB(uint64_t a1, int a2, void *a3, int a4, _DWORD *a5)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 3758097101;
  }
  *(_DWORD *)&v15[15] = -1431655766;
  size_t outputStructCnt = 520;
  char outputStruct = a2;
  *(_OWORD *)int v15 = 0u;
  memset(v14, 0, sizeof(v14));
  int v16 = 0;
  uint64_t v9 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 9u, &outputStruct, 0x208uLL, &outputStruct, &outputStructCnt);
  uint64_t v10 = v9;
  if (v9)
  {
    printf("Error 0x%08X getting report 0x%02X with length %d\n", v9, a2, a4);
  }
  else
  {
    if (a5) {
      *a5 = v16;
    }
    memmove(a3, v14, a4);
  }
  return v10;
}

uint64_t mt_DeviceSetReportViaDriverLegacyUSB(uint64_t a1, int a2, uint64_t a3, unsigned int a4)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v4 = 3758097101;
  if (a1)
  {
    *(_DWORD *)&v43[15] = -1431655766;
    size_t outputStructCnt = 520;
    char outputStruct = a2;
    if (a4 > 0x200)
    {
      puts("Too many bytes for the report to be set");
      return 3758097128;
    }
    else
    {
      unsigned int v44 = a4;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      *(_OWORD *)uint64_t v43 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      __memmove_chk();
      uint64_t v8 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0xAu, &outputStruct, 0x208uLL, &outputStruct, &outputStructCnt);
      uint64_t v4 = v8;
      if (v8) {
        printf("Error 0x%08X setting report 0x%02X with length %d\n", v8, a2, a4);
      }
    }
  }
  return v4;
}

uint64_t mt_DeviceGetReportViaDriver(uint64_t a1, int a2, void *a3, unsigned int a4, _DWORD *a5)
{
  kern_return_t v12;
  size_t v13;
  unsigned int v14;
  mach_timespec_t waitTime;
  size_t outputStructCnt;
  io_connect_t connect;
  char outputStruct;
  _OWORD v20[31];
  unsigned char v21[19];
  _DWORD __len[3];

  *(void *)&__len[1] = *MEMORY[0x263EF8340];
  if (!a1) {
    return 3758097101;
  }
  *(_DWORD *)&v21[15] = -1431655766;
  size_t outputStructCnt = 520;
  char outputStruct = a2;
  *(_OWORD *)long long v21 = 0u;
  memset(v20, 0, sizeof(v20));
  __len[0] = 0;
  io_connect_t v9 = *(_DWORD *)(a1 + 20);
  io_connect_t connect = v9;
  if (v9)
  {
    LODWORD(v10) = IOConnectCallStructMethod(v9, 1u, &outputStruct, 0x208uLL, &outputStruct, &outputStructCnt);
  }
  else
  {
    io_service_t v11 = *(_DWORD *)(a1 + 16);
    mach_timespec_t waitTime = (mach_timespec_t)5;
    if (IOServiceWaitQuiet(v11, &waitTime) == -536870186) {
      printf("MT Error: service still busy after %d seconds\n", waitTime.tv_sec);
    }
    long long v12 = IOServiceOpen(v11, *MEMORY[0x263EF8960], 0, &connect);
    LODWORD(v10) = -536870212;
    if (!v12) {
      LODWORD(v10) = IOConnectCallStructMethod(connect, 1u, &outputStruct, 0x208uLL, &outputStruct, &outputStructCnt);
    }
    IOServiceClose(connect);
  }
  long long v13 = __len[0];
  long long v14 = -536870181;
  if (__len[0] <= a4) {
    long long v14 = 0;
  }
  if (v10) {
    uint64_t v10 = v10;
  }
  else {
    uint64_t v10 = v14;
  }
  if (v10)
  {
    if (!gMT_BE_LESS_VERBOSE) {
      printf("Error 0x%08X getting report 0x%02X with length %d\n", v10, a2, a4);
    }
  }
  else
  {
    if (a5) {
      *a5 = __len[0];
    }
    memmove(a3, v20, v13);
  }
  return v10;
}

uint64_t mt_ActuatorGetReportViaDriver(uint64_t a1, char a2, void *a3, int a4, _DWORD *a5)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = 3758097084;
  if (!a1) {
    return 3758097090;
  }
  *(_DWORD *)&v17[15] = -1431655766;
  size_t outputStructCnt = 520;
  char outputStruct = a2;
  *(_OWORD *)long long v17 = 0u;
  memset(v16, 0, sizeof(v16));
  int v18 = 0;
  io_connect_t v9 = *(_DWORD *)(a1 + 20);
  io_connect_t connect = v9;
  if (v9)
  {
    uint64_t v5 = IOConnectCallStructMethod(v9, 1u, &outputStruct, 0x208uLL, &outputStruct, &outputStructCnt);
    if (v5) {
      return v5;
    }
    goto LABEL_11;
  }
  io_service_t v10 = *(_DWORD *)(a1 + 16);
  mach_timespec_t waitTime = (mach_timespec_t)5;
  if (IOServiceWaitQuiet(v10, &waitTime) == -536870186) {
    printf("MTActuator Error: service still busy after %d seconds\n", waitTime.tv_sec);
  }
  if (!IOServiceOpen(v10, *MEMORY[0x263EF8960], 0, &connect)) {
    uint64_t v5 = IOConnectCallStructMethod(connect, 1u, &outputStruct, 0x208uLL, &outputStruct, &outputStructCnt);
  }
  IOServiceClose(connect);
  if (!v5)
  {
LABEL_11:
    if (a5) {
      *a5 = v18;
    }
    memmove(a3, v16, a4);
  }
  return v5;
}

uint64_t mt_ActuatorSetReportViaDriver(uint64_t a1, char a2, uint64_t a3, unsigned int a4)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v4 = 3758097084;
  if (!a1) {
    return 3758097090;
  }
  *(_DWORD *)&v44[15] = -1431655766;
  size_t outputStructCnt = 520;
  char outputStruct = a2;
  if (a4 > 0x200) {
    return 3758097128;
  }
  unsigned int v45 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  *(_OWORD *)unsigned int v44 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  __memmove_chk();
  io_connect_t v6 = *(_DWORD *)(a1 + 20);
  io_connect_t connect = v6;
  if (v6) {
    return IOConnectCallStructMethod(v6, 2u, &outputStruct, 0x208uLL, &outputStruct, &outputStructCnt);
  }
  io_service_t v7 = *(_DWORD *)(a1 + 16);
  mach_timespec_t waitTime = (mach_timespec_t)5;
  if (IOServiceWaitQuiet(v7, &waitTime) == -536870186) {
    printf("MTActuator Error: service still busy after %d seconds\n", waitTime.tv_sec);
  }
  if (!IOServiceOpen(v7, *MEMORY[0x263EF8960], 0, &connect)) {
    uint64_t v4 = IOConnectCallStructMethod(connect, 2u, &outputStruct, 0x208uLL, &outputStruct, &outputStructCnt);
  }
  IOServiceClose(connect);
  return v4;
}

uint64_t mt_ActuatorSetWaveformViaDriver(uint64_t a1, char a2, uint64_t a3, unsigned int a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = 3758097090;
  if (a1)
  {
    mach_port_t v5 = *(_DWORD *)(a1 + 20);
    if (v5)
    {
      bzero(v9, 0x204uLL);
      if (a4 <= 0x200)
      {
        v9[0] = a2;
        unsigned int v10 = a4;
        __memcpy_chk();
        return IOConnectCallStructMethod(v5, 6u, v9, 0x208uLL, 0, 0);
      }
      else
      {
        return 3758097128;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return v4;
}

uint64_t MTDeviceDispatchRelativeMouseEvent()
{
  return 3758097095;
}

uint64_t MTDeviceDispatchButtonEvent()
{
  return 3758097095;
}

uint64_t MTDeviceDispatchScrollWheelEvent()
{
  return 3758097095;
}

uint64_t MTDeviceDispatchMomentumScrollStartStopEvent()
{
  return 3758097095;
}

uint64_t MTDeviceDispatchMomentumScrollEvent()
{
  return 3758097095;
}

uint64_t MTDeviceDispatchKeyboardEvent()
{
  return 3758097095;
}

uint64_t MTDeviceSetPickButtonShouldSendSecondaryClick()
{
  return 3758097095;
}

uint64_t MTDeviceInjectFrame(uint64_t a1, void *__src, int a3)
{
  kern_return_t v8;
  kern_return_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint32_t outputCnt;
  uint64_t input;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  unsigned char v25[18];
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  long long v28 = *MEMORY[0x263EF8340];
  uint64_t v4 = 3758097084;
  if (!*(_DWORD *)(a1 + 20))
  {
    uint64_t v4 = 3758097101;
    goto LABEL_24;
  }
  if (*(_DWORD *)(a1 + 212) != 4)
  {
    uint64_t v4 = 3758097095;
    goto LABEL_24;
  }
  io_service_t v7 = *(void **)(a1 + 2200);
  if (!v7)
  {
    long long v22 = -1;
    long long v23 = -1;
    uint64_t v8 = MEMORY[0x22A64C300]();
    if (v8)
    {
      io_connect_t v9 = v8;
LABEL_13:
      if (*(unsigned char *)(a1 + 133)) {
        mt_CachePropertiesForDevice(a1);
      }
      unsigned int v10 = MTLoggingFramework();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)long long v25 = v9;
        *(_WORD *)&v25[4] = 2048;
        *(void *)&v25[6] = v11;
        _os_log_impl(&dword_2262CF000, v10, OS_LOG_TYPE_ERROR, "Inject frame kernel operation failed with error %x (deviceID 0x%llX)", buf, 0x12u);
      }
      goto LABEL_24;
    }
    *(void *)(a1 + 2200) = v23;
    long long v12 = v22;
    *(void *)(a1 + 2208) = v22;
    if (v12 != *(_DWORD *)(a1 + 384))
    {
      if (*(unsigned char *)(a1 + 133)) {
        mt_CachePropertiesForDevice(a1);
      }
      long long v13 = MTLoggingFramework();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        long long v14 = *(unsigned int *)(a1 + 384);
        long long v15 = *(void *)(a1 + 2208);
        long long v16 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 134218496;
        *(void *)long long v25 = v14;
        *(_WORD *)&v25[8] = 2048;
        *(void *)&v25[10] = v15;
        long long v26 = 2048;
        long long v27 = v16;
        _os_log_impl(&dword_2262CF000, v13, OS_LOG_TYPE_ERROR, "Expecting %lu frame injection size, but driver allocated %lu (deviceID 0x%llX)", buf, 0x20u);
      }
    }
    io_service_t v7 = *(void **)(a1 + 2200);
    if (!v7)
    {
      uint64_t v4 = 3758097085;
      goto LABEL_24;
    }
  }
  if (!__src)
  {
    uint64_t v4 = 3758097090;
    goto LABEL_24;
  }
  if (*(void *)(a1 + 2208) >= (unint64_t)a3)
  {
    memcpy(v7, __src, a3);
    uint64_t input = a3;
    uint32_t outputCnt = 0;
    io_connect_t v9 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0xBu, &input, 1u, 0, &outputCnt);
    if (!v9) {
      return 0;
    }
    goto LABEL_13;
  }
  uint64_t v4 = 3758097115;
LABEL_24:
  if (*(unsigned char *)(a1 + 133)) {
    mt_CachePropertiesForDevice(a1);
  }
  long long v17 = MTLoggingFramework();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    long long v18 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)long long v25 = v4;
    *(_WORD *)&v25[4] = 2048;
    *(void *)&v25[6] = v18;
    _os_log_impl(&dword_2262CF000, v17, OS_LOG_TYPE_ERROR, "Inject frame failed with error %x (deviceID 0x%llX)", buf, 0x12u);
  }
  return v4;
}

uint64_t MTLoggingFramework()
{
  if (MTLoggingFramework_onceToken != -1) {
    dispatch_once(&MTLoggingFramework_onceToken, &__block_literal_global_0);
  }
  return MTLoggingFramework___logObj;
}

os_log_t __MTLoggingFramework_block_invoke()
{
  os_log_t result = os_log_create("com.apple.Multitouch", "Framework");
  MTLoggingFramework___logObj = (uint64_t)result;
  return result;
}

uint64_t mt_CheckForTimestampErrors(uint64_t result, unsigned int a2)
{
  uint64_t v2 = result;
  uint64_t v44 = *MEMORY[0x263EF8340];
  unsigned int v3 = *(_DWORD *)(result + 2056 + 4 * *(unsigned __int8 *)(result + 2068));
  unsigned __int16 v4 = *(unsigned __int8 *)(result + 2068)
     + 1
     - 3 * ((21846 * (*(unsigned __int8 *)(result + 2068) + 1)) >> 16);
  *(unsigned char *)(result + 2068) = v4;
  *(_DWORD *)(result + 2056 + 4 * v4) = a2;
  if (a2)
  {
    if (v3 <= a2) {
      return result;
    }
    puts("\nERROR: timestamps out of order (time travel, eh?)!");
    printf("last == %u, curr == %u\n", v3, a2);
  }
  else
  {
    puts("\nERROR: timestamp invalid!");
  }
  printf("timestamps: (most recent timestamp is at index %d\n\t", *(unsigned __int8 *)(v2 + 2068));
  for (uint64_t i = 2056; i != 2068; i += 4)
    printf("0x%08X (%ums)  ", *(_DWORD *)(v2 + i), *(_DWORD *)(v2 + i));
  puts("\n");
  if (*(unsigned char *)(v2 + 1224))
  {
    for (uint64_t j = 0; j != 32; j += 8)
    {
      uint64_t v8 = *(void (**)(uint64_t, uint64_t, void))(v2 + j + 1192);
      if (v8) {
        v8(v2, 2, *(void *)(v2 + j + 1232));
      }
    }
  }
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v42 = v9;
  long long v43 = v9;
  long long v40 = v9;
  long long v41 = v9;
  long long v38 = v9;
  long long v39 = v9;
  long long v36 = v9;
  long long v37 = v9;
  long long v34 = v9;
  long long v35 = v9;
  long long v32 = v9;
  long long v33 = v9;
  long long v30 = v9;
  long long v31 = v9;
  long long v28 = v9;
  long long v29 = v9;
  long long v27 = v9;
  long long v26 = v9;
  long long v25 = v9;
  long long v24 = v9;
  long long v23 = v9;
  long long v22 = v9;
  long long v21 = v9;
  long long v20 = v9;
  long long v19 = v9;
  long long v18 = v9;
  long long v17 = v9;
  long long v16 = v9;
  long long v15 = v9;
  long long v14 = v9;
  long long v13 = v9;
  long long v12 = v9;
  memset(__b, 170, sizeof(__b));
  int inputStruct = 8;
  LOBYTE(v12) = 102;
  return MTDeviceIssueDriverRequest((io_service_t *)v2, &inputStruct, __b);
}

uint64_t mt_PostNotificationEvent(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)(result + 1224))
  {
    uint64_t v3 = result;
    for (uint64_t i = 0; i != 32; i += 8)
    {
      mach_port_t v5 = *(uint64_t (**)(uint64_t, uint64_t, void))(v3 + i + 1192);
      if (v5) {
        os_log_t result = v5(v3, a2, *(void *)(v3 + i + 1232));
      }
    }
  }
  return result;
}

uint64_t mt_PostNotificationEventToDriver(io_service_t *a1, char a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v38 = v4;
  long long v39 = v4;
  long long v36 = v4;
  long long v37 = v4;
  long long v34 = v4;
  long long v35 = v4;
  long long v32 = v4;
  long long v33 = v4;
  long long v30 = v4;
  long long v31 = v4;
  long long v28 = v4;
  long long v29 = v4;
  long long v26 = v4;
  long long v27 = v4;
  long long v24 = v4;
  long long v25 = v4;
  long long v23 = v4;
  long long v22 = v4;
  long long v21 = v4;
  long long v20 = v4;
  long long v19 = v4;
  long long v18 = v4;
  long long v17 = v4;
  long long v16 = v4;
  long long v15 = v4;
  long long v14 = v4;
  long long v13 = v4;
  long long v12 = v4;
  long long v11 = v4;
  long long v10 = v4;
  long long v9 = v4;
  long long v8 = v4;
  memset(v6, 170, sizeof(v6));
  int inputStruct = 8;
  LOBYTE(v8) = a2;
  return MTDeviceIssueDriverRequest(a1, &inputStruct, v6);
}

BOOL mt_IsExternalMessage(uint64_t a1, int a2)
{
  unint64_t v2 = *(unsigned __int8 *)(a1 + 5655);
  if (!*(unsigned char *)(a1 + 5655)) {
    return 0;
  }
  if (*(unsigned __int8 *)(a1 + 5648) == a2) {
    return 1;
  }
  uint64_t v4 = 0;
  do
  {
    uint64_t v5 = v4;
    if (v2 - 1 == v4) {
      break;
    }
    int v6 = *(unsigned __int8 *)(a1 + 5649 + v4++);
  }
  while (v6 != a2);
  return v5 + 1 < v2;
}

void mt_HandleMultitouchFrame(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned int a4)
{
  if (a2) {
    __memcpy_chk();
  }
  kdebug_trace();
  if (a2 && a3 && !*(unsigned char *)(a1 + 135))
  {
    if (*(void *)(a1 + 5664))
    {
      *(unsigned char *)(a1 + 5676) = 0;
      mach_absolute_time();
    }
    if (*(void *)(a1 + 2224)) {
      mt_ApplyBinaryFilters(a1, a2, a3, a4);
    }
    else {
      mt_ProcessMultitouchFrame(a1, a2, a3);
    }
    if (*(void *)(a1 + 5664))
    {
      if (*(unsigned char *)(a1 + 5676))
      {
        mach_absolute_time();
        work_interval_join();
        work_interval_notify();
        work_interval_leave();
      }
    }
  }
}

void mt_ProcessMultitouchFrame(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  if (!a2 || !a3) {
    return;
  }
  int v6 = (unsigned __int8 *)(a1 + 5648);
  uint64_t v7 = *(void *)(a1 + 392);
  MTProcessedFrameInit(a1);
  mt_PostFullFrameCallbacks(a1, (uint64_t)a2, a3);
  ParsedMultitouchFrameRepInitialize(v7);
  *(_WORD *)(v7 + 30) = *(_DWORD *)(a1 + 88);
  *(_WORD *)(v7 + 28) = *(_DWORD *)(a1 + 84);
  *(_WORD *)(v7 + 32) = *(_WORD *)(a1 + 364);
  uint64_t v8 = *a2;
  unint64_t v9 = v6[7];
  if (v6[7])
  {
    if (*v6 == v8) {
      goto LABEL_9;
    }
    uint64_t v10 = 0;
    do
    {
      uint64_t v11 = v10;
      if (v9 - 1 == v10) {
        break;
      }
      int v12 = *(unsigned __int8 *)(a1 + 5649 + v10++);
    }
    while (v12 != v8);
    if (v11 + 1 < v9)
    {
LABEL_9:
      uint64_t v13 = (uint64_t)(a2 + 1);
      uint64_t v14 = (a3 - 1);
LABEL_10:
      mt_PostExternalMessage(a1, v13, v8, v14);
      goto LABEL_98;
    }
  }
  if (*a2 <= 0x72u)
  {
    switch(*a2)
    {
      case '$':
      case '%':
      case '&':
        MTParse_CompactBinaryPath(a2, a3, v7, (__MTDevice *)a1);
        if (v15) {
          goto LABEL_59;
        }
        goto LABEL_98;
      case '\'':
      case ')':
        if (MTParse_CompactV3orV5BinaryPath(a2, a3, v7, a1)) {
          goto LABEL_59;
        }
        goto LABEL_98;
      case '(':
        if (MTParse_CompactV4BinaryPath(a2, a3, v7, a1)) {
          goto LABEL_59;
        }
        goto LABEL_98;
      case '*':
      case '+':
      case ',':
      case '-':
      case '.':
      case '/':
      case '0':
        goto LABEL_40;
      case '1':
        if (MTParse_CompactV7BinaryPath(a2, a3, v7, a1)) {
          goto LABEL_59;
        }
        goto LABEL_98;
      case '2':
        if (MTParse_CompactV8BinaryPath(a2, a3, v7, a1)) {
          goto LABEL_59;
        }
        goto LABEL_98;
      case '3':
        if (MTParse_CompactV9BinaryPath((uint64_t)a2, a3, v7, a1)) {
          goto LABEL_59;
        }
        goto LABEL_98;
      case '4':
        if (MTParse_CompactV10BinaryPath((uint64_t)a2, a3, v7, (__MTDevice *)a1)) {
          goto LABEL_59;
        }
        goto LABEL_98;
      default:
        if ((v8 - 67) < 3)
        {
          if (MTParse_BinaryPathOrImage(a2, a3, v7, (__MTDevice *)a1)) {
            goto LABEL_59;
          }
          goto LABEL_98;
        }
        if (v8 != 90) {
          goto LABEL_40;
        }
        if (!MTParse_SABinary((uint64_t)a2, a3, v7, a1)) {
          goto LABEL_98;
        }
        goto LABEL_59;
    }
  }
  if (*a2 <= 0xC4u)
  {
    switch(*a2)
    {
      case 's':
      case 't':
        if (MTParse_V3BinaryPathOrImage(a2, a3, v7, (__MTDevice *)a1)) {
          goto LABEL_59;
        }
        break;
      case 'u':
      case 'v':
      case 'w':
        if (MTParse_V4PrecisePathAndImage(a2, a3, v7, (__MTDevice *)a1)) {
          goto LABEL_59;
        }
        break;
      case 'x':
        if (MTParse_SensorImage(a2, a3, v7, (__MTDevice *)a1)) {
          goto LABEL_59;
        }
        break;
      case 'y':
        if (MTParse_HostPathAndImage(a2, a3, v7)) {
          goto LABEL_59;
        }
        break;
      default:
        goto LABEL_40;
    }
    goto LABEL_98;
  }
  if ((v8 - 197) < 2)
  {
    if (MTProcess_0xC5_Data(a2, a3, (MTParsedMultitouchFrameRep_t *)v7, (__MTDevice *)a1)) {
      goto LABEL_59;
    }
  }
  else
  {
    if (v8 == 204 || v8 == 206)
    {
      if ((MTProcess_0xCC_Data(a2, a3, v7, a1) & 1) == 0) {
        goto LABEL_98;
      }
LABEL_59:
      mt_CheckForTimestampErrors(a1, *(_DWORD *)v7);
      if (!*(void *)(a1 + 152))
      {
        if (*(unsigned char *)(a1 + 133)) {
          mt_CachePropertiesForDevice(a1);
        }
        else {
          mt_InitializeAlgorithmsForDevice(a1, v19, v20, v21, v22, v23, v24, v25);
        }
      }
      mt_UpdateDeviceOrientation(a1, 2 * *(unsigned __int8 *)(v7 + 53), 0);
      uint64_t v26 = *(unsigned __int8 *)(v7 + 16);
      if (v26 >= *(unsigned __int8 *)(a1 + 176)) {
        uint64_t v27 = *(void *)(a1 + 168);
      }
      else {
        uint64_t v27 = *(void *)(a1 + 168) + 256;
      }
      *(void *)(a1 + 168) = v27 & 0xFFFFFFFFFFFFFF00 | v26;
      *(unsigned char *)(a1 + 176) = v26;
      if (*(unsigned __int8 *)(a1 + 210) != *(unsigned __int8 *)(v7 + 55))
      {
        if (*(unsigned char *)(v7 + 55))
        {
          if (*(unsigned char *)(a1 + 1224))
          {
            for (uint64_t i = 0; i != 32; i += 8)
            {
              long long v29 = *(void (**)(uint64_t, uint64_t, void))(a1 + i + 1192);
              if (v29) {
                v29(a1, 29, *(void *)(a1 + i + 1232));
              }
            }
          }
        }
        else if (*(unsigned char *)(a1 + 1224))
        {
          for (uint64_t j = 0; j != 32; j += 8)
          {
            long long v31 = *(void (**)(uint64_t, uint64_t, void))(a1 + j + 1192);
            if (v31) {
              v31(a1, 30, *(void *)(a1 + j + 1232));
            }
          }
        }
        *(unsigned char *)(a1 + 210) = *(unsigned char *)(v7 + 55);
      }
      mt_PostLegacyFrameHeaderCallbacks(a1, v7);
      mt_PostButtonStateCallbacks(a1, *(unsigned __int8 *)(v7 + 52));
      if (*(unsigned char *)(a1 + 1080))
      {
        for (uint64_t k = 0; k != 32; k += 8)
        {
          long long v33 = *(void (**)(uint64_t, void, uint64_t, uint64_t, void))(a1 + k + 1048);
          if (v33) {
            v33(a1, *(void *)(a1 + 168), a3, 1, *(void *)(a1 + k + 1088));
          }
        }
      }
      mt_PostForceCentroidCallbacks(a1, v7);
      if (!*(void *)(a1 + 152))
      {
        puts("Algorithms uninitialized!");
        goto LABEL_92;
      }
      if (*(unsigned char *)(v7 + 39))
      {
LABEL_92:
        if (*(unsigned char *)(a1 + 1080))
        {
          for (uint64_t m = 0; m != 32; m += 8)
          {
            long long v37 = *(void (**)(uint64_t, void, uint64_t, void, void))(a1 + m + 1048);
            if (v37) {
              v37(a1, *(void *)(a1 + 168), a3, 0, *(void *)(a1 + m + 1088));
            }
          }
        }
        *(_DWORD *)(a1 + 180) = *(void *)v7;
        goto LABEL_98;
      }
      unsigned int v34 = *(unsigned __int8 *)(v7 + 8);
      if (v34 > 0x73)
      {
        if (v34 == 116 || v34 == 204 || v34 == 206) {
          goto LABEL_90;
        }
      }
      else
      {
        unsigned int v35 = v34 - 36;
        if (v35 <= 0x20 && ((1 << v35) & 0x10000E03DLL) != 0)
        {
LABEL_90:
          mtalg_ProcessPathFrame(a1, v7, *(void *)(a1 + 168), *(void *)v7);
          goto LABEL_92;
        }
      }
      if (!*(unsigned char *)(v7 + 11) || *(unsigned char *)(v7 + 12))
      {
        mtalg_ProcessImageFrame(a1, v7, *(__int16 **)(v7 + 40), *(void *)(a1 + 168), *(void *)v7);
        goto LABEL_92;
      }
      goto LABEL_90;
    }
LABEL_40:
    if (a3 >= 2 && v8 == 64)
    {
      if (a3 < 3 || a2[1])
      {
        switch(a2[1])
        {
          case 1u:
            if (*(unsigned char *)(a1 + 1224))
            {
              for (uint64_t n = 0; n != 32; n += 8)
              {
                uint64_t v46 = *(void (**)(uint64_t, uint64_t, void))(a1 + n + 1192);
                if (v46) {
                  v46(a1, 1, *(void *)(a1 + n + 1232));
                }
              }
            }
            break;
          case 2u:
            *(_DWORD *)(a1 + 2064) = 0;
            *(void *)(a1 + 2056) = 0;
            *(unsigned char *)(a1 + 2068) = 0;
            *(_DWORD *)(a1 + 180) = 0;
            *(unsigned char *)(a1 + 176) = 0;
            mt_CachePropertiesForDevice(a1);
            if (*(unsigned char *)(a1 + 1224))
            {
              for (iuint64_t i = 0; ii != 32; ii += 8)
              {
                id v67 = *(void (**)(uint64_t, uint64_t, void))(a1 + ii + 1192);
                if (v67) {
                  v67(a1, 5, *(void *)(a1 + ii + 1232));
                }
              }
            }
            break;
          case 3u:
            if (*(unsigned char *)(a1 + 1224))
            {
              for (juint64_t j = 0; jj != 32; jj += 8)
              {
                long long v69 = *(void (**)(uint64_t, uint64_t, void))(a1 + jj + 1192);
                if (v69) {
                  v69(a1, 6, *(void *)(a1 + jj + 1232));
                }
              }
            }
            goto LABEL_196;
          case 4u:
            if (*(unsigned char *)(a1 + 1224))
            {
              for (kuint64_t k = 0; kk != 32; kk += 8)
              {
                long long v71 = *(void (**)(uint64_t, uint64_t, void))(a1 + kk + 1192);
                if (v71) {
                  v71(a1, 7, *(void *)(a1 + kk + 1232));
                }
              }
            }
            break;
          case 5u:
            *(void *)(a1 + 184) = 0;
            if (*(unsigned char *)(a1 + 1224))
            {
              for (muint64_t m = 0; mm != 32; mm += 8)
              {
                id v73 = *(void (**)(uint64_t, uint64_t, void))(a1 + mm + 1192);
                if (v73) {
                  v73(a1, 8, *(void *)(a1 + mm + 1232));
                }
              }
            }
LABEL_196:
            mt_FlushInternalStateForDevice(a1);
            break;
          case 6u:
            if (*(unsigned char *)(a1 + 1224))
            {
              for (nuint64_t n = 0; nn != 32; nn += 8)
              {
                long long v75 = *(void (**)(uint64_t, uint64_t, void))(a1 + nn + 1192);
                if (v75) {
                  v75(a1, 14, *(void *)(a1 + nn + 1232));
                }
              }
            }
            break;
          case 7u:
            if (*(unsigned char *)(a1 + 1224))
            {
              for (uint64_t i1 = 0; i1 != 32; i1 += 8)
              {
                uint64_t v77 = *(void (**)(uint64_t, uint64_t, void))(a1 + i1 + 1192);
                if (v77) {
                  v77(a1, 15, *(void *)(a1 + i1 + 1232));
                }
              }
            }
            break;
          case 8u:
            if (*(unsigned char *)(a1 + 1224))
            {
              for (uint64_t i2 = 0; i2 != 32; i2 += 8)
              {
                id v79 = *(void (**)(uint64_t, uint64_t, void))(a1 + i2 + 1192);
                if (v79) {
                  v79(a1, 12, *(void *)(a1 + i2 + 1232));
                }
              }
            }
            break;
          case 9u:
            if (*(unsigned char *)(a1 + 1224))
            {
              for (uint64_t i3 = 0; i3 != 32; i3 += 8)
              {
                uint64_t v81 = *(void (**)(uint64_t, uint64_t, void))(a1 + i3 + 1192);
                if (v81) {
                  v81(a1, 13, *(void *)(a1 + i3 + 1232));
                }
              }
            }
            break;
          case 0xAu:
            if (*(unsigned char *)(a1 + 1224))
            {
              for (uint64_t i4 = 0; i4 != 32; i4 += 8)
              {
                uint64_t v83 = *(void (**)(uint64_t, uint64_t, void))(a1 + i4 + 1192);
                if (v83) {
                  v83(a1, 16, *(void *)(a1 + i4 + 1232));
                }
              }
            }
            break;
          case 0xBu:
            if (*(unsigned char *)(a1 + 1224))
            {
              for (uint64_t i5 = 0; i5 != 32; i5 += 8)
              {
                v85 = *(void (**)(uint64_t, uint64_t, void))(a1 + i5 + 1192);
                if (v85) {
                  v85(a1, 17, *(void *)(a1 + i5 + 1232));
                }
              }
            }
            break;
          case 0xEu:
            if (*(unsigned char *)(a1 + 1224))
            {
              for (uint64_t i6 = 0; i6 != 32; i6 += 8)
              {
                uint64_t v87 = *(void (**)(uint64_t, uint64_t, void))(a1 + i6 + 1192);
                if (v87) {
                  v87(a1, 32, *(void *)(a1 + i6 + 1232));
                }
              }
            }
            break;
          case 0xFu:
            if (*(unsigned char *)(a1 + 1224))
            {
              for (uint64_t i7 = 0; i7 != 32; i7 += 8)
              {
                v89 = *(void (**)(uint64_t, uint64_t, void))(a1 + i7 + 1192);
                if (v89) {
                  v89(a1, 33, *(void *)(a1 + i7 + 1232));
                }
              }
            }
            break;
          case 0x10u:
            if (*(unsigned char *)(a1 + 1224))
            {
              for (uint64_t i8 = 0; i8 != 32; i8 += 8)
              {
                uint64_t v91 = *(void (**)(uint64_t, uint64_t, void))(a1 + i8 + 1192);
                if (v91) {
                  v91(a1, 34, *(void *)(a1 + i8 + 1232));
                }
              }
            }
            break;
          default:
            goto LABEL_98;
        }
      }
      else if (*(unsigned char *)(a1 + 1224))
      {
        uint64_t v16 = 0;
        uint64_t v17 = a2[2];
        do
        {
          long long v18 = *(void (**)(uint64_t, uint64_t, void))(a1 + v16 + 1192);
          if (v18) {
            v18(a1, v17, *(void *)(a1 + v16 + 1232));
          }
          v16 += 8;
        }
        while (v16 != 32);
      }
      goto LABEL_98;
    }
    if (v8 != 80)
    {
      if (a3 >= 2 && v8 == 96)
      {
        int v39 = a2[1];
        if (*(unsigned char *)(a1 + 1224))
        {
          uint64_t v40 = 0;
          uint64_t v41 = (v39 + 300);
          do
          {
            long long v42 = *(void (**)(uint64_t, uint64_t, void))(a1 + v40 + 1192);
            if (v42) {
              v42(a1, v41, *(void *)(a1 + v40 + 1232));
            }
            v40 += 8;
          }
          while (v40 != 32);
          int v39 = a2[1];
        }
        if (v39 == 2)
        {
          *(_DWORD *)(a1 + 2064) = 0;
          *(void *)(a1 + 2056) = 0;
          *(unsigned char *)(a1 + 2068) = 0;
          *(_DWORD *)(a1 + 180) = 0;
          *(void *)(a1 + 184) = 0;
          mt_CachePropertiesForDevice(a1);
          if (*(unsigned char *)(a1 + 1224))
          {
            for (uint64_t i9 = 0; i9 != 32; i9 += 8)
            {
              unint64_t v54 = *(void (**)(uint64_t, uint64_t, void))(a1 + i9 + 1192);
              if (v54) {
                v54(a1, 5, *(void *)(a1 + i9 + 1232));
              }
            }
          }
        }
        else if (v39 == 1)
        {
          if (*(unsigned char *)(a1 + 1224))
          {
            for (uint64_t i10 = 0; i10 != 32; i10 += 8)
            {
              uint64_t v44 = *(void (**)(uint64_t, uint64_t, void))(a1 + i10 + 1192);
              if (v44) {
                v44(a1, 6, *(void *)(a1 + i10 + 1232));
              }
            }
          }
        }
        else if (a3 >= 3 && v39 == 48)
        {
          uint64_t v55 = a2[2] ? 35 : 36;
          if (*(unsigned char *)(a1 + 1224))
          {
            for (uint64_t i11 = 0; i11 != 32; i11 += 8)
            {
              long long v57 = *(void (**)(uint64_t, uint64_t, void))(a1 + i11 + 1192);
              if (v57) {
                v57(a1, v55, *(void *)(a1 + i11 + 1232));
              }
            }
          }
        }
        goto LABEL_98;
      }
      if (*a2 > 0x7Fu)
      {
        if (v8 != 128)
        {
          if (v8 == 129)
          {
            *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
            if (MTParse_HIDOffTableHeightReport((uint64_t)a2, a3, (uint64_t)buf)) {
              mt_PostOffTableHeightCallbacks(a1, *(unsigned int *)&buf[4], 0, 0xFFFFFFFFLL);
            }
            goto LABEL_98;
          }
          if (v8 != 130) {
            goto LABEL_169;
          }
          *(void *)&long long v47 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v47 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)buf = v47;
          *(_OWORD *)&buf[16] = v47;
          if (!MTParse_HIDRelativePointerV2Report((uint64_t)a2, a3, (uint64_t)buf)) {
            goto LABEL_98;
          }
          mt_PostTrackingCallbacks(a1, *(unsigned int *)&buf[8], *(unsigned int *)&buf[12], *(unsigned __int16 *)&buf[2]);
          uint64_t v48 = *(unsigned int *)&buf[8];
          uint64_t v49 = *(unsigned int *)&buf[12];
          uint64_t v50 = *(unsigned int *)&buf[4];
          uint64_t v51 = *(void *)&buf[24];
          uint64_t v52 = a1;
LABEL_166:
          mt_PostRelativePointerCallbacks(v52, v48, v49, v50, v51);
          goto LABEL_98;
        }
        memset(buf, 170, 24);
        if (!MTParse_HIDRelativePointerReport((uint64_t)a2, a3, (uint64_t)buf)) {
          goto LABEL_98;
        }
        mt_PostTrackingCallbacks(a1, *(unsigned int *)&buf[8], *(unsigned int *)&buf[12], *(unsigned __int16 *)&buf[2]);
        uint64_t v62 = *(unsigned int *)&buf[8];
        uint64_t v61 = *(unsigned int *)&buf[12];
        uint64_t v60 = *(unsigned int *)&buf[4];
        uint64_t v51 = mach_absolute_time();
        uint64_t v52 = a1;
        uint64_t v48 = v62;
        uint64_t v49 = v61;
      }
      else
      {
        if (v8 != 2)
        {
          if (v8 == 82)
          {
            MTParse_TimestampSync(a2, a3, a1);
            goto LABEL_98;
          }
          if (v8 == 83)
          {
            *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
            unsigned __int16 v93 = -21846;
            unsigned int v92 = -1431655766;
            if (MTParse_ExternalMessage((uint64_t)a2, a3, buf, &v93, &v92))
            {
              uint64_t v13 = *(void *)buf;
              uint64_t v8 = v93;
              uint64_t v14 = v92;
              goto LABEL_10;
            }
            goto LABEL_98;
          }
LABEL_169:
          if (*(unsigned char *)(a1 + 133)) {
            mt_CachePropertiesForDevice(a1);
          }
          long long v63 = MTLoggingFramework();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
          {
            int v64 = *a2;
            uint64_t v65 = *(void *)(a1 + 64);
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)&uint8_t buf[4] = v64;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = a3;
            *(_WORD *)&buf[14] = 2048;
            *(void *)&buf[16] = v65;
            _os_log_impl(&dword_2262CF000, v63, OS_LOG_TYPE_DEBUG, "Data packet with format 0x%02X length %u. Ignoring... (deviceID 0x%llX)", buf, 0x18u);
          }
          goto LABEL_98;
        }
        memset(buf, 170, 6);
        if (!MTParse_HIDMouseReport(a2, a3, buf)) {
          goto LABEL_98;
        }
        mt_PostTrackingCallbacks(a1, (char)buf[2], (char)buf[3], 400);
        uint64_t v58 = (char)buf[2];
        uint64_t v59 = (char)buf[3];
        uint64_t v60 = buf[1];
        uint64_t v51 = mach_absolute_time();
        uint64_t v52 = a1;
        uint64_t v48 = v58;
        uint64_t v49 = v59;
      }
      uint64_t v50 = v60;
      goto LABEL_166;
    }
  }
LABEL_98:
  long long v38 = *(void (**)(uint64_t, uint64_t, void))(a1 + 1768);
  if (v38)
  {
    if ((*(_DWORD *)(a1 + 2004) & *(_DWORD *)(a1 + 2240)) != 0) {
      v38(a1, a1 + 2240, *(void *)(a1 + 1808));
    }
  }
}

double MTProcessedFrameInit(uint64_t a1)
{
  *(_DWORD *)(a1 + 2240) = 0;
  *(void *)(a1 + 2248) = 0;
  *(_DWORD *)(a1 + 2256) = 0;
  *(_DWORD *)(a1 + 2284) = 0;
  *(void *)(a1 + 2260) = 0;
  *(_OWORD *)(a1 + 2268) = 0u;
  bzero((void *)(a1 + 2296), 0xC00uLL);
  double result = 0.0;
  *(_OWORD *)(a1 + 5632) = 0u;
  *(_DWORD *)(a1 + 2288) = 0;
  *(_DWORD *)(a1 + 5368) = 0;
  return result;
}

uint64_t mt_PostFullFrameCallbacks(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
  if (*(unsigned char *)(result + 2004))
  {
    *(_DWORD *)(result + 2240) |= 1u;
    *(void *)(result + 2248) = a2;
    *(_DWORD *)(result + 2256) = a3;
  }
  if (*(unsigned char *)(result + 1152))
  {
    for (uint64_t i = 0; i != 32; i += 8)
    {
      uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v5 + i + 1120);
      if (v7) {
        double result = v7(v5, a2, a3, *(void *)(v5 + i + 1160));
      }
    }
  }
  return result;
}

uint64_t mt_PostExternalMessage(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(result + 5632) = a2;
  *(_DWORD *)(result + 5640) = a4;
  *(_WORD *)(result + 5644) = a3;
  *(_DWORD *)(result + 2240) |= 0x10u;
  if (*(unsigned char *)(result + 1584))
  {
    uint64_t v7 = result;
    for (uint64_t i = 0; i != 32; i += 8)
    {
      unint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(v7 + i + 1552);
      if (v9) {
        double result = v9(v7, a2, a3, a4, *(void *)(v7 + i + 1592));
      }
    }
  }
  return result;
}

uint64_t mt_FlushInternalStateForDevice(uint64_t a1)
{
  MTAlg_IssueInputDetectionStateCallback(a1, 0, 0, 0);
  mt_PostButtonStateCallbacks(a1, 0);
  return mt_PostOffTableHeightCallbacks(a1, 0, 0, 0xFFFFFFFFLL);
}

void mt_PostLegacyFrameHeaderCallbacks(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 1296) || (*(unsigned char *)(a1 + 2004) & 2) != 0)
  {
    memset(v7, 170, 28);
    if (*(unsigned char *)(a2 + 9))
    {
      switch(*(unsigned char *)(a2 + 15))
      {
        case 0:
        case 1:
        case 2:
          MTConvert_CompactHeaderToV2Header(a2 + 80, (uint64_t)v7);
          goto LABEL_14;
        case 3:
        case 4:
        case 8:
          MTConvert_CompactV3HeaderToV2Header(a2 + 80, (uint64_t)v7);
          goto LABEL_14;
        case 5:
          MTConvert_CompactV5HeaderToV2Header(a2 + 80, (uint64_t)v7);
          goto LABEL_14;
        case 9:
          MTConvert_CompactV9HeaderToV2Header(a2 + 80, (uint64_t)v7);
          goto LABEL_14;
        case 0xA:
          MTConvert_CompactV10HeaderToV2Header(a2 + 80, (uint64_t)v7);
          goto LABEL_14;
        default:
          return;
      }
    }
    else
    {
      switch(*(unsigned char *)(a2 + 15))
      {
        case 0:
        case 1:
        case 2:
          v7[0] = *(_OWORD *)(a2 + 80);
          *(_OWORD *)((char *)v7 + 12) = *(_OWORD *)(a2 + 92);
          goto LABEL_14;
        case 3:
          MTConvert_V3HeaderToV2Header((uint64_t *)(a2 + 80), (uint64_t)v7);
          goto LABEL_14;
        case 4:
          MTConvert_V4HeaderToV2Header(a2 + 80, (uint64_t)v7);
LABEL_14:
          if ((*(unsigned char *)(a1 + 2004) & 2) != 0)
          {
            *(_DWORD *)(a1 + 2240) |= 2u;
            *(_OWORD *)(a1 + 2272) = *(_OWORD *)((char *)v7 + 12);
            *(_OWORD *)(a1 + 2260) = v7[0];
          }
          if (*(unsigned char *)(a1 + 1296))
          {
            for (uint64_t i = 0; i != 32; i += 8)
            {
              uint64_t v4 = *(void (**)(uint64_t, _OWORD *, uint64_t))(a1 + i + 1264);
              if (v4)
              {
                uint64_t v5 = *(void *)(a1 + i + 1304);
                v6[0] = v7[0];
                *(_OWORD *)((char *)v6 + 12) = *(_OWORD *)((char *)v7 + 12);
                v4(a1, v6, v5);
              }
            }
          }
          break;
        default:
          return;
      }
    }
  }
}

uint64_t mt_PostFrameProcessingEntryExitEvent(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(result + 1080))
  {
    uint64_t v5 = result;
    for (uint64_t i = 0; i != 32; i += 8)
    {
      uint64_t v7 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t, void))(v5 + i + 1048);
      if (v7) {
        double result = v7(v5, *(void *)(v5 + 168), a2, a3, *(void *)(v5 + i + 1088));
      }
    }
  }
  return result;
}

uint64_t mt_PostProcessedFrameCallbacks(uint64_t result)
{
  int v1 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 1768);
  if (v1)
  {
    if ((*(_DWORD *)(result + 2004) & *(_DWORD *)(result + 2240)) != 0) {
      return v1(result, result + 2240, *(void *)(result + 1808));
    }
  }
  return result;
}

uint64_t MTRegisterFrameProcessingEntryExitCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2) {
    return 0;
  }
  uint64_t v3 = 0;
  while (1)
  {
    uint64_t v4 = a1 + 8 * v3;
    if (!*(void *)(v4 + 1048)) {
      break;
    }
    if (++v3 == 4) {
      return 0;
    }
  }
  *(void *)(v4 + 1048) = a2;
  *(void *)(v4 + 1088) = a3;
  uint64_t v5 = 1;
  *(unsigned char *)(a1 + 1080) |= 1 << v3;
  return v5;
}

uint64_t MTUnregisterFrameProcessingEntryExitCallback(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v2 = 0;
  uint64_t v3 = a1 + 1048;
  while (*(void *)(v3 + 8 * v2) != a2)
  {
    if (++v2 == 4) {
      return 0;
    }
  }
  *(void *)(v3 + 8 * v2) = 0;
  uint64_t v4 = 1;
  *(unsigned char *)(a1 + 1080) &= ~(1 << v2);
  return v4;
}

uint64_t MTRegisterFullFrameCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2) {
    return 0;
  }
  uint64_t v3 = 0;
  while (1)
  {
    uint64_t v4 = a1 + 8 * v3;
    if (!*(void *)(v4 + 1120)) {
      break;
    }
    if (++v3 == 4) {
      return 0;
    }
  }
  *(void *)(v4 + 1120) = a2;
  *(void *)(v4 + 1160) = a3;
  uint64_t v5 = 1;
  *(unsigned char *)(a1 + 1152) |= 1 << v3;
  return v5;
}

uint64_t MTUnregisterFullFrameCallback(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v2 = 0;
  uint64_t v3 = a1 + 1120;
  while (*(void *)(v3 + 8 * v2) != a2)
  {
    if (++v2 == 4) {
      return 0;
    }
  }
  *(void *)(v3 + 8 * v2) = 0;
  uint64_t v4 = 1;
  *(unsigned char *)(a1 + 1152) &= ~(1 << v2);
  return v4;
}

uint64_t MTRegisterNotificationEventCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2) {
    return 0;
  }
  uint64_t v3 = 0;
  while (1)
  {
    uint64_t v4 = a1 + 8 * v3;
    if (!*(void *)(v4 + 1192)) {
      break;
    }
    if (++v3 == 4) {
      return 0;
    }
  }
  *(void *)(v4 + 1192) = a2;
  *(void *)(v4 + 1232) = a3;
  uint64_t v5 = 1;
  *(unsigned char *)(a1 + 1224) |= 1 << v3;
  return v5;
}

uint64_t MTUnregisterNotificationEventCallback(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v2 = 0;
  uint64_t v3 = a1 + 1192;
  while (*(void *)(v3 + 8 * v2) != a2)
  {
    if (++v2 == 4) {
      return 0;
    }
  }
  *(void *)(v3 + 8 * v2) = 0;
  uint64_t v4 = 1;
  *(unsigned char *)(a1 + 1224) &= ~(1 << v2);
  return v4;
}

uint64_t MTRegisterFrameHeaderCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2) {
    return 0;
  }
  uint64_t v3 = 0;
  while (1)
  {
    uint64_t v4 = a1 + 8 * v3;
    if (!*(void *)(v4 + 1264)) {
      break;
    }
    if (++v3 == 4) {
      return 0;
    }
  }
  *(void *)(v4 + 1264) = a2;
  *(void *)(v4 + 1304) = a3;
  uint64_t v5 = 1;
  *(unsigned char *)(a1 + 1296) |= 1 << v3;
  return v5;
}

uint64_t MTUnregisterFrameHeaderCallback(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v2 = 0;
  while (1)
  {
    uint64_t v3 = a1 + 8 * v2;
    if (*(void *)(v3 + 1264) == a2) {
      break;
    }
    if (++v2 == 4) {
      return 0;
    }
  }
  *(void *)(v3 + 1264) = 0;
  *(void *)(v3 + 1304) = 0;
  uint64_t v4 = 1;
  *(unsigned char *)(a1 + 1296) &= ~(1 << v2);
  return v4;
}

uint64_t MTRegisterExternalMessageCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2) {
    return 0;
  }
  uint64_t v3 = 0;
  while (1)
  {
    uint64_t v4 = a1 + 8 * v3;
    if (!*(void *)(v4 + 1552)) {
      break;
    }
    if (++v3 == 4) {
      return 0;
    }
  }
  *(void *)(v4 + 1552) = a2;
  *(void *)(v4 + 1592) = a3;
  uint64_t v5 = 1;
  *(unsigned char *)(a1 + 1584) |= 1 << v3;
  return v5;
}

uint64_t MTUnregisterExternalMessageCallback(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v2 = 0;
  while (1)
  {
    uint64_t v3 = a1 + 8 * v2;
    if (*(void *)(v3 + 1552) == a2) {
      break;
    }
    if (++v2 == 4) {
      return 0;
    }
  }
  *(void *)(v3 + 1552) = 0;
  *(void *)(v3 + 1592) = 0;
  uint64_t v4 = 1;
  *(unsigned char *)(a1 + 1584) &= ~(1 << v2);
  return v4;
}

uint64_t MTRegisterProcessedFrameCallback(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  if (!a2 || *(void *)(a1 + 1768)) {
    return 0;
  }
  *(void *)(a1 + 1768) = a2;
  *(void *)(a1 + 1808) = a5;
  *(void *)(a1 + 2004) = a3;
  *(_DWORD *)(a1 + 2012) = a4;
  return 1;
}

uint64_t MTUnregisterProcessedFrameCallback(uint64_t a1)
{
  *(void *)(a1 + 1768) = 0;
  *(void *)(a1 + 1808) = 0;
  *(_DWORD *)(a1 + 2012) = 0;
  *(void *)(a1 + 2004) = 0;
  return 1;
}

double MTParse_CompactBinaryFrameHeader(unsigned __int8 *a1, int a2, MTParsedMultitouchFrameRep_t *a3, __MTDevice *a4)
{
  unint64_t v4 = (unint64_t)a1;
  if (a1) {
    BOOL v5 = a2 <= 3;
  }
  else {
    BOOL v5 = 1;
  }
  int v6 = !v5;
  if (v6 == 1)
  {
    *((void *)a3 + 10) = 0;
    char v7 = *(unsigned char *)v4;
    *((unsigned char *)a3 + 80) = *(unsigned char *)v4;
    unsigned __int8 v8 = *(unsigned char *)(v4 + 1);
    *((unsigned char *)a3 + 81) = v8;
    unsigned __int8 v9 = *(unsigned char *)(v4 + 2);
    *((unsigned char *)a3 + 82) = v9;
    unsigned __int8 v10 = *(unsigned char *)(v4 + 3);
    *((unsigned char *)a3 + 83) = v10;
    LODWORD(v4) = *(_DWORD *)(v4 + 4);
    unsigned int v11 = bswap32(v4);
    if (a4->var21 == 1) {
      unint64_t v4 = v4;
    }
    else {
      unint64_t v4 = v11;
    }
    *((_DWORD *)a3 + 21) = v4;
    *((unsigned char *)a3 + 8) = v7;
    *((unsigned char *)a3 + 72) = v9;
    *((unsigned char *)a3 + 52) = v8;
    *((unsigned char *)a3 + 54) = v10;
    *(void *)a3 = v4;
    *((unsigned char *)a3 + 9) = 1;
    *((unsigned char *)a3 + 15) = 1;
    *((unsigned char *)a3 + 16) = a4->var45 + 1;
    *(_WORD *)((char *)a3 + 37) = 1;
    *((unsigned char *)a3 + 39) = 0;
    *((_WORD *)a3 + 31) = 0;
    *((_WORD *)a3 + 33) = 0;
    *((_DWORD *)a3 + 17) = 0;
    double result = -1.55737508e-207;
    *(_DWORD *)((char *)a3 + 73) = -1795162112;
  }
  return result;
}

uint64_t MTCompactBinaryContactUnpack(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v3 = 0;
  if (a1 && a2 && a3 >= 0xC)
  {
    unsigned int v4 = a2[1];
    int v5 = a2[3];
    int v6 = (4 * a2[2]) | (v5 << 10) | (v4 >> 6);
    unsigned int v7 = a2[7];
    __int16 v8 = a2[6] | ((v7 & 0xF) << 8);
    __int16 v9 = a2[4];
    __int16 v10 = a2[5];
    int v11 = (v7 >> 4) | (16 * a2[8]);
    __int16 v12 = a2[9];
    __int16 v13 = a2[10];
    int v14 = *a2 << 18;
    unsigned __int8 v15 = a2[11];
    *(_WORD *)(a1 + 8) = v8;
    *(_WORD *)(a1 + 10) = v11;
    *(unsigned char *)(a1 + 15) = v15;
    *(_WORD *)a1 = (int)(v14 | (v4 << 26)) >> 18;
    *(_WORD *)(a1 + 2) = (__int16)(4 * v6) >> 2;
    *(_WORD *)(a1 + 4) = (__int16)((4 * v5) & 0x3C0 | (v9 << 10)) >> 4;
    *(_WORD *)(a1 + 6) = (__int16)(v9 & 0xC0 | (v10 << 8)) >> 4;
    *(_WORD *)(a1 + 12) = (v12 << 6) & 0x3000 | (v13 << 14) | (32 * (v12 & 0x3F));
    *(unsigned char *)(a1 + 14) = v13 & 0xFC;
    return 12;
  }
  return v3;
}

void MTParse_CompactBinaryPath(unsigned __int8 *a1, int a2, uint64_t a3, __MTDevice *a4)
{
  char v6 = a2;
  MTParse_CompactBinaryFrameHeader(a1, a2, (MTParsedMultitouchFrameRep_t *)a3, a4);
  if (v8)
  {
    unsigned __int8 v9 = v6 - 8;
    if (v6 != 8)
    {
      unsigned int v10 = *(unsigned __int8 *)(a3 + 82);
      if (*(unsigned char *)(a3 + 82))
      {
        int var55 = a4->var55;
        unsigned int v12 = v9 / v10;
        if ((var55 == 6 || var55 == 3) && *(unsigned char *)(a3 + 8) == 37 && v12 > 0xC) {
          unsigned int v12 = 12;
        }
        unint64_t v14 = 0;
        unsigned __int8 v15 = a1 + 16;
        uint64_t v16 = (int8x8_t *)(a3 + 144);
        uint64_t v17 = v12;
        do
        {
          unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
          unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
          int v18 = *(unsigned __int8 *)(a3 + 8);
          if (v18 == 37 && v17 >= 0xC)
          {
            MTCompactBinaryContactUnpack((uint64_t)&v31, v15 - 8, v17);
            unsigned int v25 = WORD2(v32);
            unsigned int v27 = HIBYTE(v32);
            int8x8_t v21 = (int8x8_t)v31;
            LOWORD(v22) = v32;
            LOWORD(v23) = WORD1(v32);
            __int16 v26 = BYTE6(v32);
          }
          else
          {
            if (v18 == 36)
            {
              if (v17 >= 0x10) {
                goto LABEL_18;
              }
            }
            else if (v18 == 38 && v17 > 0xF)
            {
LABEL_18:
              BOOL v20 = a4->var21 == 1;
              int8x8_t v21 = vbsl_s8((int8x8_t)vcltz_s16(vshl_n_s16(vdup_n_s16(v20), 0xFuLL)), *(int8x8_t *)(v15 - 8), vrev16_s8(*(int8x8_t *)(v15 - 8)));
              unint64_t v31 = (unint64_t)v21;
              unsigned int v22 = bswap32(*(unsigned __int16 *)v15) >> 16;
              if (v20) {
                LOWORD(v22) = *(_WORD *)v15;
              }
              LOWORD(v32) = v22;
              unsigned int v23 = *((unsigned __int16 *)v15 + 1);
              unsigned int v24 = bswap32(v23) >> 16;
              if (!v20) {
                LOWORD(v23) = v24;
              }
              WORD1(v32) = v23;
              unsigned int v25 = v15[4] | ((v15[5] & 0xF) << 8) & 0xFFF | (v15[5] >> 4 << 12);
              WORD2(v32) = v15[4] | ((v15[5] & 0xF) << 8) & 0xFFF | (v15[5] >> 4 << 12);
              __int16 v26 = v15[6];
              BYTE6(v32) = v15[6];
              unsigned int v27 = v15[7];
              HIBYTE(v32) = v15[7];
              goto LABEL_29;
            }
            __int16 v26 = 170;
            int8x8_t v21 = (int8x8_t)0xAAAAAAAAAAAAAAAALL;
            LOWORD(v23) = -21846;
            LOWORD(v22) = -21846;
            unsigned int v27 = 170;
            unsigned int v25 = 43690;
          }
LABEL_29:
          v16[-4].i8[4] = v25 >> 12;
          v16[-4].i8[5] = v27 & 0xF;
          v16[-4].i8[6] = v27 >> 4;
          v16[-4].i8[7] = 1;
          v16[-3] = v21;
          v16[-2].i16[0] = v22;
          v16[-2].i16[1] = v23;
          v16[-2].i16[2] = v26 << 8;
          v16[-2].i16[3] = v25 & 0xFFF;
          if (v18 == 38)
          {
            unsigned int v29 = bswap32(*((unsigned __int16 *)v15 + 4)) >> 16;
            if (a4->var21 == 1) {
              unsigned __int16 v30 = *((_WORD *)v15 + 4);
            }
            else {
              unsigned __int16 v30 = v29;
            }
          }
          else
          {
            unsigned __int16 v30 = mtalg_ComputeContactDensityFromRadii((uint64_t)a4, v25 & 0xFFF, (__int16)v22, (__int16)v23);
            unsigned int v10 = *(unsigned __int8 *)(a3 + 82);
          }
          v16[-1].i16[0] = v30;
          v16[-1].i16[1] = v30;
          v16[-1].i32[1] = 0;
          v16->i16[0] = 0;
          uint64_t v16 = (int8x8_t *)((char *)v16 + 30);
          ++v14;
          v15 += v17;
        }
        while (v14 < v10);
      }
    }
    *(unsigned char *)(a3 + 8) = 36;
  }
}

uint64_t MTCompactV3HeaderUnpack(uint64_t a1, unsigned char *a2, unsigned int a3)
{
  uint64_t v3 = 0;
  if (a1 && a2 && a3 >= 6)
  {
    *(unsigned char *)a1 = *a2;
    *(unsigned char *)(a1 + 1) = a2[1];
    *(unsigned char *)(a1 + 2) = a2[2];
    *(unsigned char *)(a1 + 3) = a2[3] & 3;
    *(_DWORD *)(a1 + 4) = (a2[3] >> 2) | (a2[4] << 6) | (a2[5] << 14);
    return 8;
  }
  return v3;
}

uint64_t MTCompactV5HeaderUnpack(uint64_t a1, unsigned char *a2, unsigned int a3)
{
  uint64_t v3 = 0;
  if (a1 && a2 && a3 >= 6)
  {
    *(unsigned char *)a1 = *a2;
    unsigned int v4 = a2[3] & 0xC;
    int v5 = a2[1] | (((v4 >> 2) & 3) << 8);
    *(_WORD *)(a1 + 2) = a2[1] | (((v4 >> 2) & 3) << 8);
    unsigned int v6 = a2[3] & 0x30;
    int v7 = a2[2] | (((v6 >> 4) & 3) << 8);
    *(_WORD *)(a1 + 4) = a2[2] | (((v6 >> 4) & 3) << 8);
    if (v4 >= 8) {
      *(_WORD *)(a1 + 2) = v5 | 0xFC00;
    }
    if (v6 >= 0x20) {
      *(_WORD *)(a1 + 4) = v7 | 0xFC00;
    }
    *(unsigned char *)(a1 + 6) = a2[3] & 3;
    *(_DWORD *)(a1 + 8) = (a2[3] >> 6) | (4 * a2[4]) | (a2[5] << 10);
    return 12;
  }
  return v3;
}

uint64_t MTCompactV3orV5BinaryContactUnpack(uint64_t a1, unsigned __int8 *a2, int a3)
{
  uint64_t v3 = 0;
  if (a1 && a2 && a3 == 8)
  {
    __int16 v4 = *a2 | ((a2[1] & 0xF) << 8);
    *(_WORD *)a1 = v4;
    int v5 = (a2[1] >> 4) | (16 * a2[2]);
    *(_WORD *)(a1 + 2) = (a2[1] >> 4) | (16 * a2[2]);
    LODWORD(v6) = a2[3];
    LODWORD(v7) = a2[4];
    __int16 v8 = a2[5] & 0x3F;
    *(_WORD *)(a1 + 8) = v8;
    *(unsigned char *)(a1 + 10) = (a2[5] >> 6) & 0xF3 | (4 * (a2[6] & 3));
    *(_WORD *)(a1 + 12) = (a2[6] & 0xFC) << 7;
    *(unsigned char *)(a1 + 15) = (a2[7] >> 4) & 7;
    *(unsigned char *)(a1 + 14) = a2[7] & 0xF;
    *(unsigned char *)(a1 + 16) = a2[7] >> 7;
    *(_WORD *)a1 = (__int16)(16 * v4) >> 3;
    *(_WORD *)(a1 + 2) = ((__int16)(16 * v5) >> 3) + 4095;
    *(_WORD *)(a1 + 8) = 32 * v8;
    if (v6)
    {
      if (v6 > 0x31)
      {
        if (v6 > 0xA9) {
          unint64_t v6 = (((unint64_t)(((v6 << 10) - 169984) * (uint64_t)((v6 << 10) - 169984)) >> 12)
        }
              + 958464) >> 10;
        else {
          LODWORD(v6) = ((v6 << 21) + 629145600) >> 20;
        }
      }
      else
      {
        LODWORD(v6) = (((0xFFFFFFFD8
                                     * ((unint64_t)(((v6 << 10) - 76800)
                                                         * (uint64_t)((v6 << 10) - 76800)) >> 10)) >> 10)
                     + 742400) >> 10;
      }
    }
    *(_WORD *)(a1 + 4) = v6;
    if (v7)
    {
      if (v7 > 0x31)
      {
        if (v7 > 0x95) {
          unint64_t v7 = (((87 * ((unint64_t)(((v7 << 10) - 141552) * (uint64_t)((v7 << 10) - 141552)) >> 10)) >> 10)
        }
              + 807152) >> 10;
        else {
          LODWORD(v7) = ((v7 << 21) + 524288000) >> 20;
        }
      }
      else
      {
        LODWORD(v7) = (((0xFFFFFFFD8
                                     * ((unint64_t)(((v7 << 10) - 76800)
                                                         * (uint64_t)((v7 << 10) - 76800)) >> 10)) >> 10)
                     + 640000) >> 10;
      }
    }
    *(_WORD *)(a1 + 6) = v7;
    return 8;
  }
  return v3;
}

double MTParse_CompactV3BinaryFrameHeader(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(a2 + 8) = *(unsigned char *)a1;
  *(unsigned char *)(a2 + 52) = *(unsigned char *)(a1 + 3);
  *(unsigned char *)(a2 + 54) = 0;
  unsigned int v3 = *(_DWORD *)(a1 + 4) & 0x3FFFFF;
  int v4 = *(_DWORD *)(a3 + 180);
  unsigned int v5 = v4 & 0x3FFFFF;
  uint64_t v6 = v4 & 0xFFC00000 | v3;
  uint64_t v7 = v6 + 0x400000;
  if (v3 >= v5) {
    uint64_t v7 = v6;
  }
  *(void *)a2 = v7;
  *(_DWORD *)(a1 + 4) = v7;
  *(unsigned char *)(a2 + 9) = 1;
  *(unsigned char *)(a2 + 15) = 3;
  *(unsigned char *)(a2 + 16) = *(unsigned char *)(a3 + 176) + 1;
  *(_WORD *)(a2 + 37) = 1;
  *(unsigned char *)(a2 + 39) = 0;
  *(_WORD *)(a2 + 62) = 0;
  *(_WORD *)(a2 + 66) = 0;
  *(_DWORD *)(a2 + 68) = 0;
  double result = -1.55737508e-207;
  *(_DWORD *)(a2 + 73) = -1795162112;
  return result;
}

double MTParse_CompactV5BinaryFrameHeader(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(a2 + 8) = *(unsigned char *)a1;
  *(unsigned char *)(a2 + 52) = *(unsigned char *)(a1 + 6);
  *(unsigned char *)(a2 + 54) = 0;
  unsigned int v3 = *(_DWORD *)(a1 + 8) & 0x3FFFF;
  int v4 = *(_DWORD *)(a3 + 180);
  unsigned int v5 = v4 & 0x3FFFF;
  uint64_t v6 = v4 & 0xFFFC0000 | v3;
  uint64_t v7 = v6 + 0x40000;
  if (v3 >= v5) {
    uint64_t v7 = v6;
  }
  *(void *)a2 = v7;
  *(_DWORD *)(a1 + 8) = v7;
  *(unsigned char *)(a2 + 9) = 1;
  *(unsigned char *)(a2 + 15) = 5;
  *(unsigned char *)(a2 + 16) = *(unsigned char *)(a3 + 176) + 1;
  *(_WORD *)(a2 + 37) = 1;
  *(unsigned char *)(a2 + 39) = 0;
  *(_WORD *)(a2 + 62) = 0;
  *(_WORD *)(a2 + 66) = 0;
  *(_DWORD *)(a2 + 68) = 0;
  double result = -1.55737508e-207;
  *(_DWORD *)(a2 + 73) = -1795162112;
  return result;
}

uint64_t MTParse_CompactV3orV5BinaryPath(unsigned char *a1, signed int a2, uint64_t a3, uint64_t a4)
{
  int v8 = *a1;
  if (v8 == 39)
  {
    if (MTCompactV3HeaderUnpack(a3 + 80, a1, a2))
    {
      MTParse_CompactV3BinaryFrameHeader(a3 + 80, a3, a4);
      goto LABEL_8;
    }
    int v8 = *a1;
  }
  if (v8 != 41) {
    return 0;
  }
  uint64_t result = MTCompactV5HeaderUnpack(a3 + 80, a1, a2);
  if (!result) {
    return result;
  }
  MTParse_CompactV5BinaryFrameHeader(a3 + 80, a3, a4);
LABEL_8:
  int v10 = a2 - 6;
  if (a2 < 6) {
    int v10 = a2 + 1;
  }
  int v11 = v10 >> 3;
  *(unsigned char *)(a3 + 72) = v11;
  uint64_t result = 1;
  *(unsigned char *)(a3 + 10) = 1;
  unsigned int v12 = v11;
  if ((_BYTE)v11)
  {
    unint64_t v13 = 0;
    uint64_t v14 = a3 + 116;
    unsigned __int8 v15 = a1 + 6;
    do
    {
      memset(v20, 170, 18);
      if (MTCompactV3orV5BinaryContactUnpack((uint64_t)v20, v15, 8))
      {
        *(unsigned char *)uint64_t v14 = BYTE2(v20[1]);
        *(unsigned char *)(v14 + 1) = HIBYTE(v20[1]);
        *(unsigned char *)(v14 + 2) = BYTE6(v20[1]);
        *(unsigned char *)(v14 + 3) = 1;
        *(_DWORD *)(v14 + 4) = v20[0];
        if (LOBYTE(v20[2])) {
          *(_DWORD *)(v14 + 8) = -1;
        }
        int v16 = SWORD2(v20[0]);
        *(_WORD *)(v14 + 12) = WORD2(v20[0]);
        int v17 = SHIWORD(v20[0]);
        *(_WORD *)(v14 + 14) = HIWORD(v20[0]);
        *(_WORD *)(v14 + 16) = WORD2(v20[1]);
        int v18 = SLOWORD(v20[1]);
        *(_WORD *)(v14 + 18) = v20[1];
        __int16 v19 = mtalg_ComputeContactDensityFromRadii(a4, v18, v16, v17);
        *(_WORD *)(v14 + 20) = v19;
        *(_WORD *)(v14 + 22) = v19;
        *(_DWORD *)(v14 + 24) = 0;
        *(_WORD *)(v14 + 28) = 0;
        unsigned int v12 = *(unsigned __int8 *)(a3 + 72);
      }
      ++v13;
      v15 += 8;
      v14 += 30;
    }
    while (v13 < v12);
    return 1;
  }
  return result;
}

uint64_t MTCompactV4HeaderUnpack(uint64_t a1, unsigned char *a2, unsigned int a3)
{
  uint64_t v3 = 0;
  if (a1 && a2 && a3 >= 4)
  {
    *(unsigned char *)a1 = *a2;
    *(unsigned char *)(a1 + 1) = a2[1] & 1;
    *(unsigned char *)(a1 + 2) = (a2[1] & 2) != 0;
    *(_DWORD *)(a1 + 4) = (a2[1] >> 2) | (a2[2] << 6) | (a2[3] << 14);
    return 8;
  }
  return v3;
}

uint64_t MTCompactV4BinaryContactUnpack(uint64_t a1, unsigned __int8 *a2, int a3)
{
  uint64_t v3 = 0;
  if (a1 && a2 && a3 == 9)
  {
    __int16 v4 = *a2 | ((a2[1] & 0x1F) << 8);
    *(_WORD *)a1 = v4;
    int v5 = (8 * a2[2]) & 0xE7FF | ((a2[3] & 3) << 11) | (a2[1] >> 5);
    *(_WORD *)(a1 + 2) = v5;
    int v6 = a2[3] >> 2;
    *(_WORD *)(a1 + 18) = v6;
    LODWORD(v7) = a2[4];
    LODWORD(v8) = a2[5];
    __int16 v9 = a2[6] & 0x3F;
    *(_WORD *)(a1 + 8) = v9;
    *(unsigned char *)(a1 + 10) = (a2[6] >> 6) & 0xF3 | (4 * (a2[7] & 3));
    *(_WORD *)(a1 + 12) = (a2[7] & 0xFC) << 7;
    *(unsigned char *)(a1 + 15) = (a2[8] >> 4) & 7;
    *(unsigned char *)(a1 + 14) = a2[8] & 0xF;
    *(unsigned char *)(a1 + 16) = a2[8] >> 7;
    *(_WORD *)a1 = (__int16)(8 * v4) >> 2;
    *(_WORD *)(a1 + 2) = ((__int16)(8 * v5) >> 2) + 5000;
    *(_WORD *)(a1 + 18) = 8 * v6;
    *(_WORD *)(a1 + 8) = 32 * v9;
    if (v7)
    {
      if (v7 > 0x31)
      {
        if (v7 > 0xA9) {
          unint64_t v7 = (((unint64_t)(((v7 << 10) - 169984) * (uint64_t)((v7 << 10) - 169984)) >> 12)
        }
              + 958464) >> 10;
        else {
          LODWORD(v7) = ((v7 << 21) + 629145600) >> 20;
        }
      }
      else
      {
        LODWORD(v7) = (((0xFFFFFFFD8
                                     * ((unint64_t)(((v7 << 10) - 76800)
                                                         * (uint64_t)((v7 << 10) - 76800)) >> 10)) >> 10)
                     + 742400) >> 10;
      }
    }
    *(_WORD *)(a1 + 4) = v7;
    if (v8)
    {
      if (v8 > 0x31)
      {
        if (v8 > 0x95) {
          unint64_t v8 = (((87 * ((unint64_t)(((v8 << 10) - 141552) * (uint64_t)((v8 << 10) - 141552)) >> 10)) >> 10)
        }
              + 807152) >> 10;
        else {
          LODWORD(v8) = ((v8 << 21) + 524288000) >> 20;
        }
      }
      else
      {
        LODWORD(v8) = (((0xFFFFFFFD8
                                     * ((unint64_t)(((v8 << 10) - 76800)
                                                         * (uint64_t)((v8 << 10) - 76800)) >> 10)) >> 10)
                     + 640000) >> 10;
      }
    }
    *(_WORD *)(a1 + 6) = v8;
    return 8;
  }
  return v3;
}

double MTParse_CompactV4BinaryFrameHeader(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(a2 + 8) = *(unsigned char *)a1;
  *(unsigned char *)(a2 + 52) = *(unsigned char *)(a1 + 1);
  *(unsigned char *)(a2 + 53) = *(unsigned char *)(a1 + 2) != 0;
  *(unsigned char *)(a2 + 54) = 0;
  unsigned int v3 = *(_DWORD *)(a1 + 4) & 0x3FFFFF;
  int v4 = *(_DWORD *)(a3 + 180);
  unsigned int v5 = v4 & 0x3FFFFF;
  uint64_t v6 = v4 & 0xFFC00000 | v3;
  uint64_t v7 = v6 + 0x400000;
  if (v3 >= v5) {
    uint64_t v7 = v6;
  }
  *(void *)a2 = v7;
  *(_DWORD *)(a1 + 4) = v7;
  *(unsigned char *)(a2 + 9) = 1;
  *(unsigned char *)(a2 + 15) = 4;
  *(unsigned char *)(a2 + 16) = *(unsigned char *)(a3 + 176) + 1;
  *(_WORD *)(a2 + 37) = 1;
  *(unsigned char *)(a2 + 39) = 0;
  *(_WORD *)(a2 + 62) = 0;
  *(_WORD *)(a2 + 66) = 0;
  *(_DWORD *)(a2 + 68) = 0;
  double result = -1.55737508e-207;
  *(_DWORD *)(a2 + 73) = -1795162112;
  return result;
}

BOOL MTParse_CompactV4BinaryPath(unsigned char *a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = a3 + 80;
  int v9 = MTCompactV4HeaderUnpack(a3 + 80, a1, a2);
  if (v9)
  {
    MTParse_CompactV4BinaryFrameHeader(v8, a3, a4);
    unsigned int v10 = ((int)(a2 - 4) / 9);
    *(unsigned char *)(a3 + 72) = (int)(a2 - 4) / 9;
    *(unsigned char *)(a3 + 10) = 1;
    if (((int)(a2 - 4) / 9) && v10 != 0)
    {
      unint64_t v12 = 0;
      uint64_t v13 = a3 + 116;
      uint64_t v14 = a1 + 4;
      do
      {
        memset(v20, 170, 20);
        if (MTCompactV4BinaryContactUnpack((uint64_t)v20, v14, 9))
        {
          *(unsigned char *)uint64_t v13 = BYTE2(v20[1]);
          *(unsigned char *)(v13 + 1) = HIBYTE(v20[1]);
          *(unsigned char *)(v13 + 2) = BYTE6(v20[1]);
          *(unsigned char *)(v13 + 3) = 1;
          *(_DWORD *)(v13 + 4) = v20[0];
          if (LOBYTE(v20[2])) {
            *(_DWORD *)(v13 + 8) = -1;
          }
          int v15 = SWORD2(v20[0]);
          *(_WORD *)(v13 + 12) = WORD2(v20[0]);
          int v16 = SHIWORD(v20[0]);
          *(_WORD *)(v13 + 14) = HIWORD(v20[0]);
          *(_WORD *)(v13 + 16) = WORD2(v20[1]);
          int v17 = SLOWORD(v20[1]);
          *(_WORD *)(v13 + 18) = v20[1];
          __int16 v18 = mtalg_ComputeContactDensityFromRadii(a4, v17, v15, v16);
          *(_WORD *)(v13 + 20) = v18;
          *(_WORD *)(v13 + 22) = v18;
          *(_DWORD *)(v13 + 24) = 0;
          *(_WORD *)(v13 + 28) = 0;
          unsigned int v10 = *(unsigned __int8 *)(a3 + 72);
        }
        ++v12;
        v14 += 9;
        v13 += 30;
      }
      while (v12 < v10);
    }
  }
  return v9 != 0;
}

uint64_t MTCompactV7HeaderUnpack(uint64_t a1, unsigned char *a2, unsigned int a3)
{
  uint64_t v3 = 0;
  if (a1 && a2 && a3 >= 4)
  {
    *(unsigned char *)a1 = *a2;
    *(unsigned char *)(a1 + 1) = a2[1] & 1;
    *(unsigned char *)(a1 + 2) = (a2[1] & 2) != 0;
    *(unsigned char *)(a1 + 3) = (a2[1] & 4) != 0;
    *(_DWORD *)(a1 + 4) = (a2[1] >> 3) | (32 * a2[2]) | (a2[3] << 13);
    return 8;
  }
  return v3;
}

uint64_t MTCompactV7BinaryContactUnpack(uint64_t a1, unsigned __int8 *a2, int a3)
{
  uint64_t v3 = 0;
  if (a1 && a2 && a3 == 9)
  {
    __int16 v4 = *a2 | ((a2[1] & 0x1F) << 8);
    *(_WORD *)a1 = v4;
    int v5 = (8 * a2[2]) & 0xE7FF | ((a2[3] & 3) << 11) | (a2[1] >> 5);
    *(_WORD *)(a1 + 2) = v5;
    int v6 = (a2[3] >> 2) & 7;
    *(unsigned char *)(a1 + 14) = (a2[3] >> 2) & 7;
    *(unsigned char *)(a1 + 15) = a2[3] >> 5;
    LODWORD(v7) = a2[4];
    LODWORD(v8) = a2[5];
    LODWORD(v9) = a2[6];
    LODWORD(v10) = a2[7];
    *(unsigned char *)(a1 + 10) = a2[8] & 0xF;
    *(unsigned char *)(a1 + 16) = (a2[8] & 0x10) != 0;
    int v11 = a2[8] >> 5;
    *(_WORD *)(a1 + 12) = v11;
    *(_WORD *)a1 = (__int16)(8 * v4) >> 2;
    *(_WORD *)(a1 + 2) = ((__int16)(8 * v5) >> 2) + 5000;
    if (v6 == 7) {
      *(unsigned char *)(a1 + 14) = 12;
    }
    if (v7)
    {
      if (v7 > 0x31)
      {
        if (v7 > 0xA9) {
          unint64_t v7 = (((unint64_t)(((v7 << 10) - 169984) * (uint64_t)((v7 << 10) - 169984)) >> 12)
        }
              + 958464) >> 10;
        else {
          LODWORD(v7) = ((v7 << 21) + 629145600) >> 20;
        }
      }
      else
      {
        LODWORD(v7) = (((0xFFFFFFFD8
                                     * ((unint64_t)(((v7 << 10) - 76800)
                                                         * (uint64_t)((v7 << 10) - 76800)) >> 10)) >> 10)
                     + 742400) >> 10;
      }
    }
    *(_WORD *)(a1 + 4) = v7;
    if (v8)
    {
      if (v8 > 0x31)
      {
        if (v8 > 0x95) {
          unint64_t v8 = (((87 * ((unint64_t)(((v8 << 10) - 141552) * (uint64_t)((v8 << 10) - 141552)) >> 10)) >> 10)
        }
              + 807152) >> 10;
        else {
          LODWORD(v8) = ((v8 << 21) + 524288000) >> 20;
        }
      }
      else
      {
        LODWORD(v8) = (((0xFFFFFFFD8
                                     * ((unint64_t)(((v8 << 10) - 76800)
                                                         * (uint64_t)((v8 << 10) - 76800)) >> 10)) >> 10)
                     + 640000) >> 10;
      }
    }
    *(_WORD *)(a1 + 6) = v8;
    if (v9)
    {
      if (v9 > 0x95) {
        unint64_t v9 = (((138 * ((unint64_t)(((v9 << 10) - 114670) * (uint64_t)((v9 << 10) - 114670)) >> 10)) >> 10)
      }
            + 1373544) >> 10;
      else {
        LODWORD(v9) = (10485 * v9) >> 10;
      }
    }
    *(_WORD *)(a1 + 8) = v9;
    if (v10)
    {
      if ((v10 & 0x80) != 0) {
        unint64_t v10 = (((unint64_t)(((v10 << 10) - 98939) * (uint64_t)((v10 << 10) - 98939)) >> 15)
      }
             + 230011) >> 10;
      else {
        LOWORD(v10) = 2 * v10;
      }
    }
    *(_WORD *)(a1 + 18) = v10;
    *(_WORD *)(a1 + 12) = (_WORD)v11 << 12;
    return 8;
  }
  return v3;
}

uint64_t MTParse_CompactV7BinaryFrameHeader(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(a2 + 8) = *(unsigned char *)result;
  *(unsigned char *)(a2 + 52) = *(unsigned char *)(result + 1);
  *(unsigned char *)(a2 + 53) = *(unsigned char *)(result + 2) != 0;
  *(unsigned char *)(a2 + 54) = 0;
  unsigned int v3 = *(_DWORD *)(result + 4) & 0x1FFFFF;
  int v4 = *(_DWORD *)(a3 + 180);
  unsigned int v5 = v4 & 0x1FFFFF;
  uint64_t v6 = v4 & 0xFFE00000 | v3;
  uint64_t v7 = v6 + 0x200000;
  if (v3 >= v5) {
    uint64_t v7 = v6;
  }
  *(void *)a2 = v7;
  *(_DWORD *)(result + 4) = v7;
  *(unsigned char *)(a2 + 9) = 1;
  *(unsigned char *)(a2 + 15) = 4;
  *(unsigned char *)(a2 + 16) = *(unsigned char *)(a3 + 176) + 1;
  *(_WORD *)(a2 + 37) = 1;
  *(unsigned char *)(a2 + 39) = 0;
  *(_WORD *)(a2 + 62) = 0;
  *(_WORD *)(a2 + 66) = 0;
  *(_DWORD *)(a2 + 68) = 0;
  *(_DWORD *)(a2 + 73) = -1795162112;
  *(unsigned char *)(a2 + 55) = *(unsigned char *)(result + 3) != 0;
  return result;
}

uint64_t MTParse_CompactV7BinaryPath(unsigned char *a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  if (*a1 != 49) {
    return 0;
  }
  uint64_t v8 = a3 + 80;
  if (!MTCompactV7HeaderUnpack(a3 + 80, a1, a2)) {
    return 0;
  }
  MTParse_CompactV7BinaryFrameHeader(v8, a3, a4);
  unsigned int v9 = ((int)(a2 - 4) / 9);
  *(unsigned char *)(a3 + 72) = (int)(a2 - 4) / 9;
  uint64_t v10 = 1;
  *(unsigned char *)(a3 + 10) = 1;
  if (v9)
  {
    unint64_t v11 = 0;
    uint64_t v12 = a3 + 116;
    uint64_t v13 = a1 + 4;
    do
    {
      memset(v19, 170, 20);
      if (MTCompactV7BinaryContactUnpack((uint64_t)v19, v13, 9))
      {
        *(unsigned char *)uint64_t v12 = BYTE2(v19[1]);
        *(unsigned char *)(v12 + 1) = HIBYTE(v19[1]);
        *(unsigned char *)(v12 + 2) = BYTE6(v19[1]);
        *(unsigned char *)(v12 + 3) = 1;
        *(_DWORD *)(v12 + 4) = v19[0];
        if (LOBYTE(v19[2])) {
          *(_DWORD *)(v12 + 8) = -1;
        }
        int v14 = SWORD2(v19[0]);
        *(_WORD *)(v12 + 12) = WORD2(v19[0]);
        int v15 = SHIWORD(v19[0]);
        *(_WORD *)(v12 + 14) = HIWORD(v19[0]);
        *(_WORD *)(v12 + 16) = WORD2(v19[1]);
        int v16 = SLOWORD(v19[1]);
        *(_WORD *)(v12 + 18) = v19[1];
        __int16 v17 = mtalg_ComputeContactDensityFromRadii(a4, v16, v14, v15);
        *(_WORD *)(v12 + 20) = v17;
        *(_WORD *)(v12 + 22) = v17;
        *(_WORD *)(v12 + 26) = WORD1(v19[2]);
        *(_WORD *)(v12 + 28) = 0;
        unsigned int v9 = *(unsigned __int8 *)(a3 + 72);
      }
      ++v11;
      v13 += 9;
      v12 += 30;
    }
    while (v11 < v9);
    return 1;
  }
  return v10;
}

uint64_t MTCompactV9HeaderUnpack(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = 0;
  if (a1 && a2 && a3 >= 7)
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    char v4 = *(unsigned char *)(a2 + 1);
    *(unsigned char *)(a1 + 1) = *(unsigned char *)(a1 + 1) & 0xFC | v4 & 3;
    *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1) & 0xFC | v4 & 3;
    *(_DWORD *)(a1 + 2) = *(_DWORD *)(a2 + 2);
    *(unsigned char *)(a1 + 6) = *(unsigned char *)(a2 + 6);
    return 7;
  }
  return v3;
}

uint64_t MTCompactV9BinaryContactUnpack(uint64_t a1, unsigned __int8 *a2, int a3)
{
  uint64_t v3 = 0;
  if (a1 && a2 && a3 == 13)
  {
    __int16 v4 = a2[3] | ((a2[4] & 0xF) << 8);
    *(_WORD *)a1 = v4;
    if ((char)*a2 < 0) {
      *(_WORD *)a1 = v4 | 0xF000;
    }
    int v5 = (a2[4] >> 4) | (16 * a2[5]);
    *(_WORD *)(a1 + 2) = (a2[4] >> 4) | (16 * a2[5]);
    if ((char)a2[2] < 0) {
      *(_WORD *)(a1 + 2) = v5 | 0xF000;
    }
    *(_WORD *)(a1 + 4) = a2[6] | ((a2[7] & 0xF) << 8);
    *(_WORD *)(a1 + 6) = (a2[7] >> 4) | (16 * a2[8]);
    *(_WORD *)(a1 + 8) = a2[10] | ((a2[11] & 0xF) << 8);
    *(_WORD *)(a1 + 10) = (a2[11] >> 4) | (16 * a2[12]);
    char v6 = *a2 & 3;
    if (!v6) {
      char v6 = 4;
    }
    *(unsigned char *)(a1 + 12) = v6;
    *(_WORD *)(a1 + 14) = (23860930 * (unint64_t)(a2[9] << 15)) >> 32;
    *(unsigned char *)(a1 + 16) = a2[1] & 0xF;
    *(unsigned char *)(a1 + 17) = (*a2 >> 2) & 7;
    *(_WORD *)(a1 + 18) = 0;
    int v7 = (*a2 >> 5) & 1;
    *(_WORD *)(a1 + 18) = (*a2 & 0x20) != 0;
    if ((*a2 & 0x40) != 0) {
      *(_WORD *)(a1 + 18) = v7 | 0x10;
    }
    *(_WORD *)(a1 + 20) = (a2[1] >> 4) & 0xF | (16 * (a2[2] & 0x7F));
    return 7;
  }
  return v3;
}

double MTParse_CompactV9BinaryFrameHeader(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(a2 + 8) = *(unsigned char *)a1;
  *(unsigned char *)(a2 + 72) = *(unsigned char *)(a1 + 1) & 3;
  *(_DWORD *)(a2 + 68) = *(unsigned __int8 *)(a1 + 1) >> 2;
  *(void *)a2 = *(unsigned int *)(a1 + 2);
  *(unsigned char *)(a2 + 9) = 1;
  *(unsigned char *)(a2 + 15) = 9;
  *(unsigned char *)(a2 + 16) = *(unsigned char *)(a3 + 176) + 1;
  *(_WORD *)(a2 + 37) = 1;
  *(unsigned char *)(a2 + 39) = 0;
  *(_WORD *)(a2 + 62) = 0;
  *(_WORD *)(a2 + 66) = 0;
  double result = -6.68887507e-198;
  *(_DWORD *)(a2 + 73) = -1761607680;
  return result;
}

BOOL MTParse_CompactV9BinaryPath(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  int v7 = MTCompactV9HeaderUnpack(a3 + 80, a1, a2);
  if (v7)
  {
    MTParse_CompactV9BinaryFrameHeader(a3 + 80, a3, a4);
    *(unsigned char *)(a3 + 10) = 1;
    uint64_t v8 = *(unsigned __int8 *)(a3 + 72);
    if (*(unsigned char *)(a3 + 72))
    {
      uint64_t v9 = a3 + 116;
      uint64_t v10 = (unsigned __int8 *)(a1 + 7);
      do
      {
        memset(v15, 170, 22);
        if (MTCompactV9BinaryContactUnpack((uint64_t)v15, v10, 13))
        {
          *(unsigned char *)uint64_t v9 = BYTE4(v15[1]);
          *(unsigned char *)(v9 + 1) = BYTE1(v15[2]);
          *(unsigned char *)(v9 + 2) = v15[2];
          int v11 = HIDWORD(v15[0]);
          *(_DWORD *)(v9 + 4) = v15[0];
          *(unsigned char *)(v9 + 3) = 0;
          *(_DWORD *)(v9 + 12) = v11;
          *(_WORD *)(v9 + 16) = HIWORD(v15[1]);
          *(_WORD *)(v9 + 18) = v15[1];
          __int16 v12 = WORD1(v15[1]);
          *(_WORD *)(v9 + 20) = WORD1(v15[1]);
          *(_WORD *)(v9 + 22) = v12;
          *(_WORD *)(v9 + 24) = 0;
          HIDWORD(v13) = *(_DWORD *)((char *)&v15[2] + 2);
          LODWORD(v13) = *(_DWORD *)((char *)&v15[2] + 2);
          *(_DWORD *)(v9 + 26) = v13 >> 16;
        }
        v10 += 13;
        v9 += 30;
        --v8;
      }
      while (v8);
    }
  }
  return v7 != 0;
}

uint64_t MTCompactV8HeaderUnpack(uint64_t a1, unsigned char *a2, unsigned int a3)
{
  uint64_t v3 = 0;
  if (a1 && a2 && a3 >= 4)
  {
    *(unsigned char *)a1 = *a2;
    *(unsigned char *)(a1 + 1) = a2[1] & 1;
    *(_DWORD *)(a1 + 4) = (a2[1] >> 1) | (a2[2] << 7);
    return 8;
  }
  return v3;
}

uint64_t MTCompactV8BinaryContactUnpack(uint64_t a1, unsigned __int8 *a2, int a3, unsigned int a4)
{
  uint64_t v4 = 0;
  if (a1 && a2 && a3 == 7)
  {
    __int16 v5 = *a2 | ((a2[1] & 0xF) << 8);
    *(_WORD *)a1 = v5;
    int v6 = (a2[1] >> 4) | (16 * a2[2]);
    *(_WORD *)(a1 + 2) = (a2[1] >> 4) | (16 * a2[2]);
    LODWORD(v7) = a2[3];
    LODWORD(v8) = a2[4];
    LODWORD(v9) = a2[5];
    if ((a2[6] & 8) != 0) {
      char v10 = 1;
    }
    else {
      char v10 = 2;
    }
    *(unsigned char *)(a1 + 10) = v10;
    int v11 = a2[6] >> 5;
    *(_WORD *)(a1 + 12) = v11;
    *(unsigned char *)(a1 + 15) = a2[6] & 7;
    *(unsigned char *)(a1 + 16) = (a2[6] & 0x10) != 0;
    *(_WORD *)(a1 + 20) = (a4 >> 2) & 3;
    *(_WORD *)a1 = ((__int16)(16 * v5) >> 3) + 2000;
    *(_WORD *)(a1 + 2) = ((__int16)(16 * v6) >> 3) + 2000;
    if (v9)
    {
      if (v9 > 0x95) {
        unint64_t v9 = (((138 * ((unint64_t)(((v9 << 10) - 114670) * (uint64_t)((v9 << 10) - 114670)) >> 10)) >> 10)
      }
            + 1373544) >> 10;
      else {
        LODWORD(v9) = (10485 * v9) >> 10;
      }
    }
    *(_WORD *)(a1 + 8) = v9;
    *(_WORD *)(a1 + 12) = (_WORD)v11 << 12;
    if (v7)
    {
      if (v7 > 0x31)
      {
        if (v7 > 0xA9) {
          unint64_t v7 = (((unint64_t)(((v7 << 10) - 169984) * (uint64_t)((v7 << 10) - 169984)) >> 12)
        }
              + 958464) >> 10;
        else {
          LODWORD(v7) = ((v7 << 21) + 629145600) >> 20;
        }
      }
      else
      {
        LODWORD(v7) = (((0xFFFFFFFD8
                                     * ((unint64_t)(((v7 << 10) - 76800)
                                                         * (uint64_t)((v7 << 10) - 76800)) >> 10)) >> 10)
                     + 742400) >> 10;
      }
    }
    *(_WORD *)(a1 + 4) = v7;
    if (v8)
    {
      if (v8 > 0x31)
      {
        if (v8 > 0x95) {
          unint64_t v8 = (((87 * ((unint64_t)(((v8 << 10) - 141552) * (uint64_t)((v8 << 10) - 141552)) >> 10)) >> 10)
        }
              + 807152) >> 10;
        else {
          LODWORD(v8) = ((v8 << 21) + 524288000) >> 20;
        }
      }
      else
      {
        LODWORD(v8) = (((0xFFFFFFFD8
                                     * ((unint64_t)(((v8 << 10) - 76800)
                                                         * (uint64_t)((v8 << 10) - 76800)) >> 10)) >> 10)
                     + 640000) >> 10;
      }
    }
    *(_WORD *)(a1 + 6) = v8;
    *(unsigned char *)(a1 + 14) = byte_2262EEF00[a4 & 3];
    if (((a4 >> 2) & 3) >= 2) {
      *(_WORD *)(a1 + 20) = (a4 >> 2) & 1 | 0x20;
    }
    return 8;
  }
  return v4;
}

double MTParse_CompactV8BinaryFrameHeader(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(a2 + 8) = *(unsigned char *)a1;
  *(unsigned char *)(a2 + 52) = *(unsigned char *)(a1 + 1);
  *(_WORD *)(a2 + 53) = 0;
  uint64_t v3 = (*(_DWORD *)(a3 + 180) & 0xFFFF8000 | *(_DWORD *)(a1 + 4) & 0x7FFF) + 0x8000;
  if ((*(_DWORD *)(a1 + 4) & 0x7FFFu) >= (*(_DWORD *)(a3 + 180) & 0x7FFFu)) {
    uint64_t v3 = *(_DWORD *)(a3 + 180) & 0xFFFF8000 | *(_DWORD *)(a1 + 4) & 0x7FFF;
  }
  *(void *)a2 = v3;
  *(_DWORD *)(a1 + 4) = v3;
  *(unsigned char *)(a2 + 9) = 1;
  *(unsigned char *)(a2 + 15) = 8;
  *(unsigned char *)(a2 + 16) = *(unsigned char *)(a3 + 176) + 1;
  *(_WORD *)(a2 + 37) = 1;
  *(unsigned char *)(a2 + 39) = 0;
  *(_WORD *)(a2 + 62) = 0;
  *(_WORD *)(a2 + 66) = 0;
  *(_DWORD *)(a2 + 68) = 0;
  double result = -1.55737508e-207;
  *(_DWORD *)(a2 + 73) = -1795162112;
  return result;
}

uint64_t MTParse_CompactV8BinaryPath(unsigned char *a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  if (a1) {
    BOOL v4 = a2 > 3;
  }
  else {
    BOOL v4 = 0;
  }
  int v5 = v4;
  unsigned int v21 = v5;
  if (v5 == 1)
  {
    *(unsigned char *)(a3 + 80) = *a1;
    *(unsigned char *)(a3 + 81) = a1[1] & 1;
    *(_DWORD *)(a3 + 84) = (a1[1] >> 1) | (a1[2] << 7);
    MTParse_CompactV8BinaryFrameHeader(a3 + 80, a3, a4);
    int v10 = (int)(a2 - 4) / 7;
    unsigned __int8 v11 = v10 <= 2u ? v10 : 2;
    *(unsigned char *)(a3 + 72) = v11;
    *(unsigned char *)(a3 + 10) = 1;
    if (v11)
    {
      char v12 = 0;
      unint64_t v13 = 0;
      uint64_t v14 = a3 + 116;
      int v15 = a1 + 4;
      do
      {
        memset(v22, 170, 22);
        if (MTCompactV8BinaryContactUnpack((uint64_t)v22, v15, 7, (a1[3] >> v12) & 0xF))
        {
          *(unsigned char *)uint64_t v14 = BYTE2(v22[1]);
          *(unsigned char *)(v14 + 1) = HIBYTE(v22[1]);
          *(unsigned char *)(v14 + 2) = BYTE6(v22[1]);
          *(unsigned char *)(v14 + 3) = 1;
          *(_DWORD *)(v14 + 4) = v22[0];
          if (LOBYTE(v22[2])) {
            *(_DWORD *)(v14 + 8) = -1;
          }
          int v16 = SWORD2(v22[0]);
          *(_WORD *)(v14 + 12) = WORD2(v22[0]);
          int v17 = SHIWORD(v22[0]);
          *(_WORD *)(v14 + 14) = HIWORD(v22[0]);
          *(_WORD *)(v14 + 16) = WORD2(v22[1]);
          int v18 = SLOWORD(v22[1]);
          *(_WORD *)(v14 + 18) = v22[1];
          __int16 v19 = mtalg_ComputeContactDensityFromRadii(a4, v18, v16, v17);
          *(_WORD *)(v14 + 20) = v19;
          *(_WORD *)(v14 + 22) = v19;
          *(_DWORD *)(v14 + 24) = 0;
          *(_WORD *)(v14 + 28) = WORD2(v22[2]);
          unsigned __int8 v11 = *(unsigned char *)(a3 + 72);
        }
        ++v13;
        v12 += 4;
        v15 += 7;
        v14 += 30;
      }
      while (v13 < v11);
    }
  }
  return v21;
}

uint64_t MTCompactV10HeaderUnpack(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = 0;
  if (a1 && a2 && a3 >= 0x11)
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    *(_DWORD *)(a1 + 1) = (*(unsigned __int16 *)(a2 + 1) | (*(unsigned __int8 *)(a2 + 3) << 16)) & 0xF0FFFFFF | ((*(unsigned char *)(a2 + 4) & 0xF) << 24);
    *(void *)(a1 + 5) = *(void *)(a2 + 5);
    char v4 = *(unsigned char *)(a2 + 13);
    *(unsigned char *)(a1 + 13) = *(unsigned char *)(a1 + 13) & 0xF0 | v4 & 0xF;
    *(unsigned char *)(a1 + 13) = *(unsigned char *)(a2 + 13) & 0xF0 | v4 & 0xF;
    *(unsigned char *)(a1 + 14) = *(unsigned char *)(a2 + 14);
    *(unsigned char *)(a1 + 15) = *(unsigned char *)(a2 + 15);
    *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
    return 17;
  }
  return v3;
}

uint64_t MTCompactV10BinaryContactUnpack(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = 0;
  if (a1 && a2 && a3 >= 0x13)
  {
    *(_WORD *)a1 = *(_WORD *)a2;
    *(_WORD *)(a1 + 2) = *(_WORD *)(a2 + 2);
    *(_WORD *)(a1 + 4) = *(_WORD *)(a2 + 4);
    *(_WORD *)(a1 + 6) = *(unsigned __int8 *)(a2 + 5) | (*(unsigned __int8 *)(a2 + 7) << 8);
    *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
    *(_WORD *)(a1 + 10) = *(_WORD *)(a2 + 10);
    *(_WORD *)(a1 + 12) = *(_WORD *)(a2 + 12);
    *(_WORD *)(a1 + 14) = *(_WORD *)(a2 + 14);
    char v4 = *(unsigned char *)(a2 + 16);
    *(unsigned char *)(a1 + 16) = *(unsigned char *)(a1 + 16) & 0xF0 | v4 & 0xF;
    *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16) & 0xF0 | v4 & 0xF;
    *(_WORD *)(a1 + 17) = *(_WORD *)(a2 + 17);
    return 19;
  }
  return v3;
}

double MTParse_CompactV10BinaryFrameHeader(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(a2 + 8) = *(unsigned char *)a1;
  *(unsigned char *)(a2 + 72) = *(unsigned char *)(a1 + 13) >> 4;
  *(_DWORD *)(a2 + 68) = 0;
  unsigned int v3 = *(_DWORD *)(a3 + 180);
  unint64_t v4 = ((3125 * (unint64_t)*(unsigned int *)(a1 + 1) * (unsigned __int128)0x68DB8BAC710CCuLL) >> 64)
     + 83886080 * (v3 / 0x5000000);
  if (v4 >= v3) {
    uint64_t v5 = ((3125 * (unint64_t)*(unsigned int *)(a1 + 1) * (unsigned __int128)0x68DB8BAC710CCuLL) >> 64)
  }
       + 83886080 * (v3 / 0x5000000);
  else {
    LODWORD(v5) = v4 + 83886080;
  }
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 9) = 1;
  *(unsigned char *)(a2 + 15) = 10;
  *(unsigned char *)(a2 + 16) = *(unsigned char *)(a3 + 176) + 1;
  *(void *)&double result = 268;
  *(_DWORD *)(a2 + 36) = 268;
  *(_WORD *)(a2 + 62) = 0;
  *(_WORD *)(a2 + 66) = 0;
  *(unsigned char *)(a2 + 73) = *(unsigned char *)(a1 + 14);
  *(_WORD *)(a2 + 74) = 1536;
  *(unsigned char *)(a2 + 76) = -105;
  *(unsigned char *)(a2 + 64) = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a2 + 11) = (*(unsigned char *)(a1 + 13) & 2) != 0;
  *(unsigned char *)(a2 + 12) = (*(unsigned char *)(a1 + 13) & 4) != 0;
  return result;
}

uint64_t MTParse_CompactV10BinaryPath(uint64_t a1, unsigned int a2, uint64_t a3, __MTDevice *a4)
{
  uint64_t result = MTCompactV10HeaderUnpack(a3 + 80, a1, a2);
  if (result)
  {
    MTParse_CompactV10BinaryFrameHeader(a3 + 80, a3, (uint64_t)a4);
    *(unsigned char *)(a3 + 10) = 0;
    unsigned int v8 = *(unsigned __int8 *)(a3 + 93);
    unsigned int v9 = v8 >> 4;
    *(unsigned char *)(a3 + 72) = *(unsigned char *)(a3 + 93) >> 4;
    if (v8 >= 0x10)
    {
      if (v9 <= 1) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = v9;
      }
      uint64_t v11 = *(unsigned __int8 *)(a3 + 95) + a1 + 17;
      char v12 = (_WORD *)(a3 + 144);
      do
      {
        memset(v15, 170, 19);
        if (MTCompactV10BinaryContactUnpack((uint64_t)v15, v11, 0x13u))
        {
          unsigned int v13 = LOBYTE(v15[2]);
          *((unsigned char *)v12 - 28) = v15[2] & 0xF;
          *((unsigned char *)v12 - 27) = v13 >> 4;
          *(v12 - 13) = 2;
          *((void *)v12 - 3) = v15[0];
          *((_DWORD *)v12 - 4) = v15[1];
          *(v12 - 5) = WORD2(v15[1]);
          LOWORD(v13) = HIWORD(v15[1]);
          *(v12 - 4) = HIWORD(v15[1]);
          *(v12 - 3) = v13;
          *(v12 - 6) = 0;
          *((_DWORD *)v12 - 1) = 0;
          *char v12 = *(_WORD *)((char *)&v15[2] + 1);
        }
        v11 += 19;
        v12 += 15;
        --v10;
      }
      while (v10);
    }
    unint64_t v14 = *(void *)(a3 + 85);
    if (v14)
    {
      unint64_t v14 = v14 / 0x3E8 - *(void *)a3;
      if (*(void *)(a3 + 85) / 0x3E8uLL == *(void *)a3) {
        unint64_t v14 = 1;
      }
    }
    a4->var47 = v14;
    if (*(unsigned char *)(a3 + 12)) {
      return MTParse_BinaryImagePayload((unsigned __int8 *)(a1 + 17), *(unsigned __int8 *)(a3 + 95), (MTParsedMultitouchFrameRep_t *)a3, a4);
    }
    else {
      return 1;
    }
  }
  return result;
}

uint64_t MTParse_BinaryImagePayload(unsigned __int8 *__src, int a2, MTParsedMultitouchFrameRep_t *a3, __MTDevice *a4)
{
  int v4 = *((unsigned __int8 *)a3 + 36);
  uint64_t v5 = a4->var17 * a4->var18;
  unint64_t v6 = *((unsigned int *)a3 + 12);
  if (v6 < vcvtps_u32_f32((float)(v5 * v4) * 0.125))
  {
    printf("Buffer too small to uncompress image to %d bytes! (Buffer is only %u)\n");
    return 0;
  }
  unint64_t v7 = __src;
  if (v4 != 12)
  {
    if (v4 == 8)
    {
      if (!*((unsigned char *)a3 + 38))
      {
        if (v5 != a2)
        {
          printf("Raw data only had %d 8-bit words! (expected %u)\n");
          return 0;
        }
        unsigned int v8 = (void *)*((void *)a3 + 5);
        size_t v9 = a2;
        goto LABEL_41;
      }
    }
    else
    {
      int v10 = 0;
      int v11 = *((unsigned __int8 *)a3 + 14);
      if (a2 >= 1 && *((unsigned char *)a3 + 14))
      {
        unint64_t v7 = __src + 1;
        int v10 = *__src;
        --a2;
      }
      if (a2 >= 0) {
        int v12 = a2;
      }
      else {
        int v12 = a2 + 1;
      }
      uint64_t v13 = (v12 >> 1);
      if (a2 > 1)
      {
        unsigned int var21 = a4->var21;
        uint64_t v15 = v13;
        int v16 = v7;
        do
        {
          unsigned int v17 = *(unsigned __int16 *)v16;
          unsigned int v18 = bswap32(v17) >> 16;
          if (var21 != 1) {
            LOWORD(v17) = v18;
          }
          *(_WORD *)int v16 = v17;
          v16 += 2;
          --v15;
        }
        while (v15);
      }
      if (!*((unsigned char *)a3 + 38))
      {
        if (v11 && v10)
        {
          if (mt_UncompressTouchpadCodecV1Image(*((void *)a3 + 5), v6, (uint64_t)v7, a2, *((unsigned __int16 *)a3 + 14), *((unsigned __int16 *)a3 + 15), (*((unsigned __int8 *)a3 + 75) >> 2) & 1))
          {
            printf("Failed to decompress touchpad codec v1 compressed image. Failed with error(0x%X)\n");
            return 0;
          }
          return 1;
        }
        if (v13 != v5)
        {
          printf("Raw data only had %d 16-bit words! (expected %u)\n");
          return 0;
        }
        unsigned int v8 = (void *)*((void *)a3 + 5);
        size_t v9 = 2 * (int)v5;
LABEL_41:
        memcpy(v8, v7, v9);
        return 1;
      }
    }
LABEL_23:
    puts("Unsupported format RLECompressed");
    return 0;
  }
  if (*((unsigned char *)a3 + 38)) {
    goto LABEL_23;
  }
  if ((unint64_t)((v5 & 1) + ((3 * v5) >> 1)) < a2)
  {
    printf("Raw data only had %d bytes! (expected %u)\n");
    return 0;
  }
  if (!v5) {
    return 1;
  }
  uint64_t v20 = 0;
  int v21 = 0;
  uint64_t v22 = *((void *)a3 + 5);
  uint64_t result = 1;
  do
  {
    unsigned int v23 = v7[v21];
    uint64_t v24 = v21 + 1;
    int v25 = v7[v24];
    int v26 = (v23 >> 4) | (16 * v25);
    v21 += 2;
    unsigned int v27 = v23 & 0xFFFFF0FF | ((v25 & 0xF) << 8);
    if (v20)
    {
      unsigned int v28 = v26;
    }
    else
    {
      int v21 = v24;
      unsigned int v28 = v27;
    }
    if (v28 >= 0x800) {
      LOWORD(v28) = v28 | 0xF000;
    }
    *(_WORD *)(v22 + 2 * v20++) = v28;
  }
  while (v5 != v20);
  return result;
}

BOOL MTParse_V3BinaryFrameHeader(unsigned __int8 *a1, int a2, MTParsedMultitouchFrameRep_t *a3, __MTDevice *a4)
{
  if (a1) {
    BOOL v5 = a2 <= 7;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL result = !v5;
  if (result)
  {
    *((void *)a3 + 10) = 0;
    *((void *)a3 + 11) = 0;
    *((_DWORD *)a3 + 26) = 0;
    *((void *)a3 + 12) = 0;
    char v7 = *a1;
    *((unsigned char *)a3 + 80) = *a1;
    unsigned __int8 v8 = a1[1];
    *((unsigned char *)a3 + 81) = v8;
    unsigned int v9 = a1[2];
    *((unsigned char *)a3 + 82) = v9;
    unsigned __int8 v10 = a1[3];
    *((unsigned char *)a3 + 83) = v10;
    unsigned int var21 = a4->var21;
    LODWORD(v12) = *((_DWORD *)a1 + 1);
    unsigned int v13 = bswap32(v12);
    if (var21 == 1) {
      uint64_t v12 = v12;
    }
    else {
      uint64_t v12 = v13;
    }
    *((_DWORD *)a3 + 21) = v12;
    if (v9 < 0x10)
    {
      int v28 = 0;
      unsigned __int8 v19 = 0;
      unsigned __int8 v18 = 0;
      unsigned int v20 = 0;
      LOWORD(v22) = 0;
      LOWORD(v24) = 0;
      unsigned int v14 = 0;
    }
    else
    {
      *((unsigned char *)a3 + 88) = a1[8];
      *((unsigned char *)a3 + 89) = a1[9];
      unsigned int v14 = a1[10];
      *((unsigned char *)a3 + 90) = v14;
      *((unsigned char *)a3 + 91) = a1[11];
      unsigned int v15 = bswap32(*((unsigned __int16 *)a1 + 6)) >> 16;
      BOOL v16 = var21 == 1;
      if (var21 == 1) {
        __int16 v17 = *((_WORD *)a1 + 6);
      }
      else {
        __int16 v17 = v15;
      }
      *((_WORD *)a3 + 46) = v17;
      unsigned __int8 v18 = a1[14];
      *((unsigned char *)a3 + 94) = v18;
      unsigned __int8 v19 = a1[15];
      *((unsigned char *)a3 + 95) = v19;
      unsigned int v20 = *((_DWORD *)a1 + 4);
      unsigned int v21 = bswap32(v20);
      if (!v16) {
        unsigned int v20 = v21;
      }
      *((_DWORD *)a3 + 24) = v20;
      unsigned int v22 = *((unsigned __int16 *)a1 + 10);
      unsigned int v23 = bswap32(v22) >> 16;
      if (!v16) {
        LOWORD(v22) = v23;
      }
      *((_WORD *)a3 + 50) = v22;
      unsigned int v24 = *((unsigned __int16 *)a1 + 11);
      unsigned int v25 = bswap32(v24) >> 16;
      if (!v16) {
        LOWORD(v24) = v25;
      }
      *((_WORD *)a3 + 51) = v24;
      unsigned int v26 = *((unsigned __int16 *)a1 + 12);
      unsigned int v27 = bswap32(v26) >> 16;
      if (!v16) {
        LOWORD(v26) = v27;
      }
      *((_WORD *)a3 + 52) = v26;
      int v28 = *((_DWORD *)a3 + 22);
    }
    *((unsigned char *)a3 + 8) = v7;
    *((unsigned char *)a3 + 9) = 0;
    *((unsigned char *)a3 + 15) = v10;
    *((unsigned char *)a3 + 16) = v8;
    *((unsigned char *)a3 + 37) = (v14 & 4) != 0;
    *((unsigned char *)a3 + 38) = (v14 & 8) != 0;
    *((unsigned char *)a3 + 39) = v14 >> 7;
    *((_WORD *)a3 + 31) = v24;
    *((_WORD *)a3 + 33) = v22;
    *((_DWORD *)a3 + 17) = v20;
    *((unsigned char *)a3 + 72) = v18;
    *(_DWORD *)((char *)a3 + 73) = v28;
    *((unsigned char *)a3 + 55) = 1;
    *((unsigned char *)a3 + 36) = 0x100C0806u >> (8 * (v14 & 3));
    *((unsigned char *)a3 + 52) = v19;
    *((unsigned char *)a3 + 54) = v28;
    *(void *)a3 = v12;
  }
  return result;
}

uint64_t MTParse_V3BinaryPathOrImage(unsigned __int8 *a1, int a2, uint64_t a3, __MTDevice *a4)
{
  uint64_t result = MTParse_V3BinaryFrameHeader(a1, a2, (MTParsedMultitouchFrameRep_t *)a3, a4);
  if (result)
  {
    unsigned int v9 = *(unsigned __int8 *)(a3 + 94);
    unsigned int v10 = *(unsigned __int16 *)(a3 + 92);
    if (*(unsigned char *)(a3 + 94))
    {
      if (*(_WORD *)(a3 + 92) && !(unsigned __int16)(v10 % v9))
      {
        uint64_t v11 = 0;
        uint64_t v12 = (v10 / v9);
        unsigned int v13 = (_WORD *)(a3 + 144);
        while (v12 > 0x13)
        {
          unsigned int v14 = &a1[*(unsigned __int8 *)(a3 + 82) + v11 * v12];
          *((unsigned char *)v13 - 28) = *v14;
          *((unsigned char *)v13 - 27) = v14[1];
          *((unsigned char *)v13 - 26) = v14[2];
          *((unsigned char *)v13 - 25) = v14[3];
          unsigned int var21 = a4->var21;
          unsigned int v16 = *((unsigned __int16 *)v14 + 2);
          unsigned int v17 = bswap32(v16) >> 16;
          if (var21 != 1) {
            LOWORD(v16) = v17;
          }
          *(v13 - 12) = v16;
          unsigned int v18 = *((unsigned __int16 *)v14 + 3);
          unsigned int v19 = bswap32(v18) >> 16;
          if (var21 != 1) {
            LOWORD(v18) = v19;
          }
          *(v13 - 11) = v18;
          unsigned int v20 = *((unsigned __int16 *)v14 + 4);
          unsigned int v21 = bswap32(v20) >> 16;
          if (var21 != 1) {
            LOWORD(v20) = v21;
          }
          *(v13 - 10) = v20;
          unsigned int v22 = *((unsigned __int16 *)v14 + 5);
          unsigned int v23 = bswap32(v22) >> 16;
          if (var21 != 1) {
            LOWORD(v22) = v23;
          }
          *(v13 - 9) = v22;
          unsigned int v24 = *((unsigned __int16 *)v14 + 6);
          unsigned int v25 = bswap32(v24) >> 16;
          if (var21 != 1) {
            LOWORD(v24) = v25;
          }
          *(v13 - 8) = v24;
          unsigned int v26 = *((unsigned __int16 *)v14 + 7);
          unsigned int v27 = bswap32(v26) >> 16;
          if (var21 != 1) {
            LOWORD(v26) = v27;
          }
          *(v13 - 7) = v26;
          unsigned int v28 = *((unsigned __int16 *)v14 + 8);
          unsigned int v29 = bswap32(v28) >> 16;
          if (var21 != 1) {
            LOWORD(v28) = v29;
          }
          *(v13 - 6) = v28;
          unsigned int v30 = *((unsigned __int16 *)v14 + 9);
          unsigned int v31 = bswap32(v30) >> 16;
          if (var21 != 1) {
            LOWORD(v30) = v31;
          }
          *(v13 - 5) = v30;
          if (v12 <= 0x15) {
            goto LABEL_40;
          }
          unsigned int v32 = bswap32(*((unsigned __int16 *)v14 + 10)) >> 16;
          if (var21 == 1) {
            __int16 v33 = *((_WORD *)v14 + 10);
          }
          else {
            __int16 v33 = v32;
          }
          *(v13 - 4) = v33;
          if (v12 <= 0x17) {
            goto LABEL_41;
          }
          unsigned int v34 = *((unsigned __int16 *)v14 + 11);
          unsigned int v35 = bswap32(v34) >> 16;
          if (var21 != 1) {
            LOWORD(v34) = v35;
          }
          *(v13 - 3) = v34;
          if (v12 <= 0x19) {
            goto LABEL_42;
          }
          unsigned int v36 = *((unsigned __int16 *)v14 + 12);
          unsigned int v37 = bswap32(v36) >> 16;
          if (var21 != 1) {
            LOWORD(v36) = v37;
          }
          *(v13 - 2) = v36;
          if (v12 > 0x1B)
          {
            unsigned int v38 = *((unsigned __int16 *)v14 + 13);
            unsigned int v39 = bswap32(v38) >> 16;
            if (var21 != 1) {
              LOWORD(v38) = v39;
            }
            *(v13 - 1) = v38;
            if (v12 < 0x1E)
            {
              LOWORD(v40) = 0;
            }
            else
            {
              unsigned int v40 = *((unsigned __int16 *)v14 + 14);
              unsigned int v41 = bswap32(v40) >> 16;
              if (var21 != 1) {
                LOWORD(v40) = v41;
              }
            }
            goto LABEL_44;
          }
LABEL_43:
          LOWORD(v40) = 0;
          *(v13 - 1) = 0;
LABEL_44:
          *unsigned int v13 = v40;
          v13 += 15;
          if (++v11 >= (unint64_t)v9) {
            return 1;
          }
        }
        LOWORD(v30) = *(v13 - 5);
        LOWORD(v24) = *(v13 - 8);
        LOWORD(v26) = *(v13 - 7);
LABEL_40:
        __int16 v33 = mtalg_ComputeContactDensityFromRadii((uint64_t)a4, (__int16)v30, (__int16)v24, (__int16)v26);
        *(v13 - 4) = v33;
        unsigned int v9 = *(unsigned __int8 *)(a3 + 94);
LABEL_41:
        *(v13 - 3) = v33;
LABEL_42:
        *(v13 - 2) = 0;
        goto LABEL_43;
      }
      return 1;
    }
    if (!*(_WORD *)(a3 + 92)) {
      return 1;
    }
    uint64_t v42 = *(unsigned __int8 *)(a3 + 82);
    if ((int)(v42 + v10) <= a2)
    {
      return MTParse_BinaryImagePayload(&a1[v42], v10, (MTParsedMultitouchFrameRep_t *)a3, a4);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

BOOL MTParse_V4BinaryFrameHeader(unsigned __int8 *a1, int a2, MTParsedMultitouchFrameRep_t *a3, __MTDevice *a4)
{
  if (a1) {
    BOOL v5 = a2 <= 7;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL result = !v5;
  if (result)
  {
    *((_OWORD *)a3 + 5) = 0u;
    *((_OWORD *)a3 + 6) = 0u;
    char v7 = *a1;
    *((unsigned char *)a3 + 80) = *a1;
    unsigned __int8 v8 = a1[1];
    *((unsigned char *)a3 + 81) = v8;
    unsigned int v9 = a1[2];
    *((unsigned char *)a3 + 82) = v9;
    unsigned __int8 v10 = a1[3];
    *((unsigned char *)a3 + 83) = v10;
    unsigned int var21 = a4->var21;
    LODWORD(v12) = *((_DWORD *)a1 + 1);
    unsigned int v13 = bswap32(v12);
    if (var21 == 1) {
      uint64_t v12 = v12;
    }
    else {
      uint64_t v12 = v13;
    }
    *((_DWORD *)a3 + 21) = v12;
    if (v9 < 0x10)
    {
      int v34 = 0;
      unsigned __int8 v27 = 0;
      LOBYTE(v17) = 0;
      unsigned __int8 v26 = 0;
      unsigned int v28 = 0;
      LOWORD(v30) = 0;
      LOWORD(v33) = 0;
      unsigned int v14 = 0;
    }
    else
    {
      *((unsigned char *)a3 + 88) = a1[8];
      *((unsigned char *)a3 + 89) = a1[9];
      unsigned int v14 = a1[10];
      *((unsigned char *)a3 + 90) = v14;
      *((unsigned char *)a3 + 91) = a1[11];
      unsigned int v15 = bswap32(*((unsigned __int16 *)a1 + 6)) >> 16;
      BOOL v16 = var21 == 1;
      if (var21 == 1) {
        __int16 v17 = *((_WORD *)a1 + 6);
      }
      else {
        __int16 v17 = v15;
      }
      *((_WORD *)a3 + 46) = v17;
      unsigned int v18 = *((unsigned __int16 *)a1 + 7);
      unsigned int v19 = bswap32(v18) >> 16;
      if (!v16) {
        LOWORD(v18) = v19;
      }
      *((_WORD *)a3 + 47) = v18;
      unsigned int v20 = *((unsigned __int16 *)a1 + 8);
      unsigned int v21 = bswap32(v20) >> 16;
      if (!v16) {
        LOWORD(v20) = v21;
      }
      *((_WORD *)a3 + 48) = v20;
      unsigned int v22 = *((unsigned __int16 *)a1 + 9);
      unsigned int v23 = bswap32(v22) >> 16;
      if (!v16) {
        LOWORD(v22) = v23;
      }
      *((_WORD *)a3 + 49) = v22;
      unsigned int v24 = *((unsigned __int16 *)a1 + 10);
      unsigned int v25 = bswap32(v24) >> 16;
      if (!v16) {
        LOWORD(v24) = v25;
      }
      *((_WORD *)a3 + 50) = v24;
      unsigned __int8 v26 = a1[22];
      *((unsigned char *)a3 + 102) = v26;
      unsigned __int8 v27 = a1[23];
      *((unsigned char *)a3 + 103) = v27;
      unsigned int v28 = *((_DWORD *)a1 + 6);
      unsigned int v29 = bswap32(v28);
      if (!v16) {
        unsigned int v28 = v29;
      }
      *((_DWORD *)a3 + 26) = v28;
      unsigned int v30 = *((unsigned __int16 *)a1 + 14);
      unsigned int v31 = bswap32(v30) >> 16;
      if (!v16) {
        LOWORD(v30) = v31;
      }
      *((_WORD *)a3 + 54) = v30;
      unsigned int v32 = *((unsigned __int16 *)a1 + 15);
      unsigned int v33 = bswap32(v32) >> 16;
      if (v16) {
        LOWORD(v33) = v32;
      }
      *((_WORD *)a3 + 55) = v33;
      int v34 = *((_DWORD *)a3 + 22);
    }
    *((unsigned char *)a3 + 8) = v7;
    *((unsigned char *)a3 + 9) = 0;
    *((unsigned char *)a3 + 15) = v10;
    *((unsigned char *)a3 + 16) = v8;
    *((unsigned char *)a3 + 37) = (v14 & 4) != 0;
    *((unsigned char *)a3 + 38) = (v14 & 8) != 0;
    *((unsigned char *)a3 + 39) = v14 >> 7;
    *((_WORD *)a3 + 31) = v33;
    *((_WORD *)a3 + 33) = v30;
    *((_DWORD *)a3 + 17) = v28;
    *((unsigned char *)a3 + 72) = v26;
    *(_DWORD *)((char *)a3 + 73) = v34;
    *((unsigned char *)a3 + 55) = v17 & 1;
    *((unsigned char *)a3 + 12) = (v17 & 4) != 0;
    *((unsigned char *)a3 + 11) = (v17 & 2) != 0;
    *((unsigned char *)a3 + 14) = (v14 & 0x40) != 0;
    *((unsigned char *)a3 + 36) = 0x100C0806u >> (8 * (v14 & 3));
    *((unsigned char *)a3 + 52) = v27;
    *((unsigned char *)a3 + 54) = v34;
    *(void *)a3 = v12;
  }
  return result;
}

BOOL MTParse_PrecisePathPayload(unsigned __int8 *a1, int a2, MTParsedMultitouchFrameRep_t *a3, __MTDevice *a4, int a5, int a6, unsigned int a7, int a8)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  if (!*((unsigned char *)a3 + 11)) {
    return a7 == 0;
  }
  int v9 = a8 ? 2 : 32;
  if (!a7) {
    return a7 == 0;
  }
  if (v9 < a5) {
    return a7 == 0;
  }
  if (a5 < 1) {
    return a7 == 0;
  }
  int v10 = a6;
  if ((int)(a7 + a6) > a2 || a7 % a5) {
    return a7 == 0;
  }
  int v14 = 0;
  size_t v15 = (a7 / a5);
  BOOL v16 = (char *)a3 + 116;
  uint64_t v17 = a5;
  int32x2_t v18 = vdup_n_s32(0x42C80000u);
  unsigned int v19 = (char *)a3 + 116;
  do
  {
    if (a8) {
      unsigned int v20 = (unsigned int *)v19;
    }
    else {
      unsigned int v20 = (unsigned int *)v16;
    }
    memcpy(v20, &a1[(v10 + v15 * v14)], v15);
    unsigned int v21 = v20[2];
    unsigned int v22 = bswap32(v20[1]);
    if (a4->var21 == 1) {
      unsigned int v23 = v20[1];
    }
    else {
      unsigned int v23 = v22;
    }
    v20[1] = v23;
    unsigned int v24 = bswap32(v21);
    if (a4->var21 == 1) {
      unsigned int v25 = v21;
    }
    else {
      unsigned int v25 = v24;
    }
    v20[2] = v25;
    unsigned int v26 = v20[4];
    unsigned int v27 = bswap32(v20[3]);
    if (a4->var21 == 1) {
      unsigned int v28 = v20[3];
    }
    else {
      unsigned int v28 = v27;
    }
    void v20[3] = v28;
    unsigned int v29 = bswap32(v26);
    if (a4->var21 == 1) {
      unsigned int v30 = v26;
    }
    else {
      unsigned int v30 = v29;
    }
    v20[4] = v30;
    unsigned int v31 = v20[6];
    unsigned int v32 = bswap32(v20[5]);
    if (a4->var21 == 1) {
      float v33 = *((float *)v20 + 5);
    }
    else {
      float v33 = *(float *)&v32;
    }
    *((float *)v20 + 5) = v33;
    unsigned int v34 = bswap32(v31);
    if (a4->var21 == 1) {
      unsigned int v35 = v31;
    }
    else {
      unsigned int v35 = v34;
    }
    v20[6] = v35;
    unsigned int v36 = v20[8];
    unsigned int v37 = bswap32(v20[7]);
    if (a4->var21 == 1) {
      unsigned int v38 = v20[7];
    }
    else {
      unsigned int v38 = v37;
    }
    v20[7] = v38;
    unsigned int v40 = v20[9];
    unsigned int v39 = v20[10];
    unsigned int v41 = bswap32(v39);
    if (a4->var21 != 1) {
      unsigned int v39 = v41;
    }
    v20[10] = v39;
    unsigned int v42 = bswap32(v36);
    if (a4->var21 == 1) {
      unsigned int v43 = v36;
    }
    else {
      unsigned int v43 = v42;
    }
    v20[8] = v43;
    unsigned int v44 = bswap32(v40);
    if (a4->var21 == 1) {
      unsigned int v45 = v40;
    }
    else {
      unsigned int v45 = v44;
    }
    v20[9] = v45;
    unsigned int var21 = a4->var21;
    unsigned int v47 = *((unsigned __int16 *)v20 + 22);
    unsigned int v48 = bswap32(v47) >> 16;
    if (var21 != 1) {
      LOWORD(v47) = v48;
    }
    *((_WORD *)v20 + 22) = v47;
    unsigned int v49 = *((unsigned __int16 *)v20 + 23);
    unsigned int v50 = bswap32(v49) >> 16;
    if (var21 != 1) {
      LOWORD(v49) = v50;
    }
    *((_WORD *)v20 + 23) = v49;
    if (a8)
    {
      float v51 = v33;
      BOOL v52 = var21 == 1;
      unsigned int v53 = *((_DWORD *)v19 + 12);
      unsigned int v54 = *((_DWORD *)v19 + 13);
      unsigned int v55 = bswap32(v53);
      if (!v52) {
        unsigned int v53 = v55;
      }
      *((_DWORD *)v19 + 12) = v53;
      unsigned int v56 = bswap32(v54);
      if (a4->var21 == 1) {
        unsigned int v57 = v54;
      }
      else {
        unsigned int v57 = v56;
      }
      *((_DWORD *)v19 + 13) = v57;
      unsigned int v58 = bswap32(*((_DWORD *)v19 + 14));
      if (a4->var21 == 1) {
        unsigned int v59 = *((_DWORD *)v19 + 14);
      }
      else {
        unsigned int v59 = v58;
      }
      *((_DWORD *)v19 + 14) = v59;
      *((unsigned char *)a3 + 113) = 1;
      *((_WORD *)v20 + 22) = v47 | 0x1000;
      if (v19[2] != 7 && a4->var47)
      {
        if (a4->var37) {
          mt_CachePropertiesForDevice((uint64_t)a4);
        }
        uint64_t v60 = MTLoggingFramework();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t var13 = a4->var13;
          *(_DWORD *)buf = 134217984;
          unint64_t v65 = var13;
          _os_log_impl(&dword_2262CF000, v60, OS_LOG_TYPE_DEFAULT, "Non tstamp-synced contact detected. Clearing device timestamp offset (deviceID 0x%llX)", buf, 0xCu);
        }
        a4->var47 = 0;
        float v51 = *((float *)v20 + 5);
        int v10 = a6;
      }
      if (v51 == 0.0 || *((float *)v20 + 6) == 0.0) {
        *(int32x2_t *)(v20 + 5) = v18;
      }
    }
    else
    {
      *((unsigned char *)a3 + 112) = 1;
    }
    ++v14;
    v19 += 60;
    v16 += 48;
    --v17;
  }
  while (v17);
  return 1;
}

BOOL MTParse_V4BinaryPathPayload(unsigned __int8 *a1, int a2, MTParsedMultitouchFrameRep_t *a3, __MTDevice *a4, unsigned int a5, int a6, unsigned int a7)
{
  if (!a7) {
    return a7 == 0;
  }
  BOOL v8 = !*((unsigned char *)a3 + 11) || (int)a5 < 1;
  BOOL v9 = !v8 && (int)(a7 + a6) <= a2;
  if (!v9 || a7 % a5) {
    return a7 == 0;
  }
  int v13 = 0;
  unsigned int v14 = (a7 / a5);
  size_t v15 = (_WORD *)((char *)a3 + 144);
  uint64_t v16 = a5;
  do
  {
    if (v14 <= 0x13)
    {
      LOWORD(v33) = *(v15 - 5);
      LOWORD(v27) = *(v15 - 8);
      LOWORD(v29) = *(v15 - 7);
LABEL_47:
      __int16 v36 = mtalg_ComputeContactDensityFromRadii((uint64_t)a4, (__int16)v33, (__int16)v27, (__int16)v29);
      *(v15 - 4) = v36;
LABEL_48:
      *(v15 - 3) = v36;
LABEL_49:
      *(v15 - 2) = 0;
LABEL_50:
      LOWORD(v43) = 0;
      *(v15 - 1) = 0;
      goto LABEL_51;
    }
    uint64_t v17 = &a1[a6 + v14 * v13];
    *((unsigned char *)v15 - 28) = *v17;
    *((unsigned char *)v15 - 27) = v17[1];
    *((unsigned char *)v15 - 26) = v17[2];
    *((unsigned char *)v15 - 25) = v17[3];
    unsigned int var21 = a4->var21;
    unsigned int v19 = *((unsigned __int16 *)v17 + 2);
    unsigned int v20 = bswap32(v19) >> 16;
    if (var21 != 1) {
      LOWORD(v19) = v20;
    }
    *(v15 - 12) = v19;
    unsigned int v21 = *((unsigned __int16 *)v17 + 3);
    unsigned int v22 = bswap32(v21) >> 16;
    if (var21 != 1) {
      LOWORD(v21) = v22;
    }
    *(v15 - 11) = v21;
    unsigned int v23 = *((unsigned __int16 *)v17 + 4);
    unsigned int v24 = bswap32(v23) >> 16;
    if (var21 != 1) {
      LOWORD(v23) = v24;
    }
    *(v15 - 10) = v23;
    unsigned int v25 = *((unsigned __int16 *)v17 + 5);
    unsigned int v26 = bswap32(v25) >> 16;
    if (var21 != 1) {
      LOWORD(v25) = v26;
    }
    *(v15 - 9) = v25;
    unsigned int v27 = *((unsigned __int16 *)v17 + 6);
    unsigned int v28 = bswap32(v27) >> 16;
    if (var21 != 1) {
      LOWORD(v27) = v28;
    }
    *(v15 - 8) = v27;
    unsigned int v29 = *((unsigned __int16 *)v17 + 7);
    unsigned int v30 = bswap32(v29) >> 16;
    if (var21 != 1) {
      LOWORD(v29) = v30;
    }
    *(v15 - 7) = v29;
    unsigned int v31 = *((unsigned __int16 *)v17 + 8);
    unsigned int v32 = bswap32(v31) >> 16;
    if (var21 != 1) {
      LOWORD(v31) = v32;
    }
    *(v15 - 6) = v31;
    unsigned int v33 = *((unsigned __int16 *)v17 + 9);
    unsigned int v34 = bswap32(v33) >> 16;
    if (var21 != 1) {
      LOWORD(v33) = v34;
    }
    *(v15 - 5) = v33;
    if (v14 <= 0x15) {
      goto LABEL_47;
    }
    unsigned int v35 = bswap32(*((unsigned __int16 *)v17 + 10)) >> 16;
    if (var21 == 1) {
      __int16 v36 = *((_WORD *)v17 + 10);
    }
    else {
      __int16 v36 = v35;
    }
    *(v15 - 4) = v36;
    if (v14 <= 0x17) {
      goto LABEL_48;
    }
    unsigned int v37 = *((unsigned __int16 *)v17 + 11);
    unsigned int v38 = bswap32(v37) >> 16;
    if (var21 != 1) {
      LOWORD(v37) = v38;
    }
    *(v15 - 3) = v37;
    if (v14 <= 0x19) {
      goto LABEL_49;
    }
    unsigned int v39 = *((unsigned __int16 *)v17 + 12);
    unsigned int v40 = bswap32(v39) >> 16;
    if (var21 != 1) {
      LOWORD(v39) = v40;
    }
    *(v15 - 2) = v39;
    if (v14 <= 0x1B) {
      goto LABEL_50;
    }
    unsigned int v41 = *((unsigned __int16 *)v17 + 13);
    unsigned int v42 = bswap32(v41) >> 16;
    if (var21 != 1) {
      LOWORD(v41) = v42;
    }
    *(v15 - 1) = v41;
    if (v14 < 0x1E)
    {
      LOWORD(v43) = 0;
    }
    else
    {
      unsigned int v43 = *((unsigned __int16 *)v17 + 14);
      unsigned int v44 = bswap32(v43) >> 16;
      if (var21 != 1) {
        LOWORD(v43) = v44;
      }
    }
LABEL_51:
    *size_t v15 = v43;
    v15 += 15;
    ++v13;
    --v16;
  }
  while (v16);
  return 1;
}

BOOL MTParse_GenerateRingCentroids(MTParsedMultitouchFrameRep_t *a1, __MTDevice *a2)
{
  unint64_t v2 = *((unsigned __int8 *)a1 + 72);
  if (*((unsigned char *)a1 + 72))
  {
    uint64_t v3 = 0;
    BOOL v4 = 0;
    BOOL v5 = (_OWORD *)((char *)a1 + 116);
    unsigned __int8 v6 = *((unsigned char *)a1 + 72);
    do
    {
      if (a2->var84)
      {
        char v7 = (char *)v5;
      }
      else
      {
        *((unsigned char *)a1 + 72) = v6 + 1;
        if ((v6 + 1) > 2u) {
          return v4;
        }
        char v7 = (char *)a1 + 60 * v6 + 116;
        long long v9 = v5[1];
        long long v8 = v5[2];
        long long v10 = *v5;
        *(_OWORD *)(v7 + 44) = *(_OWORD *)((char *)v5 + 44);
        *((_OWORD *)v7 + 1) = v9;
        *((_OWORD *)v7 + 2) = v8;
        *(_OWORD *)char v7 = v10;
        *char v7 = 1;
        ++v6;
      }
      ++v7[2];
      *(float32x2_t *)(v7 + 4) = vadd_f32(*(float32x2_t *)(v7 + 52), *(float32x2_t *)(v7 + 4));
      *((_DWORD *)v7 + 13) = 0;
      *((_DWORD *)v7 + 14) = 0;
      BOOL v4 = ++v3 >= v2;
      BOOL v5 = (_OWORD *)((char *)v5 + 60);
    }
    while (v2 != v3);
  }
  BOOL v4 = 1;
  *((unsigned char *)a1 + 10) = 1;
  return v4;
}

uint64_t MTParse_V4PrecisePathAndImage(unsigned __int8 *a1, int a2, uint64_t a3, __MTDevice *a4)
{
  uint64_t result = MTParse_V4BinaryFrameHeader(a1, a2, (MTParsedMultitouchFrameRep_t *)a3, a4);
  if (!result) {
    return result;
  }
  int v9 = *(unsigned __int8 *)(a3 + 94);
  unsigned int v10 = *(unsigned __int16 *)(a3 + 96);
  uint64_t v11 = *(unsigned __int8 *)(a3 + 82);
  int v12 = v11 + v9;
  if (*(unsigned char *)(a3 + 94))
  {
    if (v9 == 6 && v12 <= a2)
    {
      size_t v15 = &a1[v11];
      unsigned int var21 = a4->var21;
      unsigned int v17 = bswap32(*(unsigned __int16 *)v15) >> 16;
      BOOL v18 = var21 == 1;
      if (var21 == 1) {
        __int16 v19 = *(_WORD *)v15;
      }
      else {
        __int16 v19 = v17;
      }
      *(_WORD *)(a3 + 56) = v19;
      unsigned int v20 = *((unsigned __int16 *)v15 + 1);
      unsigned int v21 = bswap32(v20) >> 16;
      if (!v18) {
        LOWORD(v20) = v21;
      }
      *(_WORD *)(a3 + 58) = v20;
      unsigned int v22 = *((unsigned __int16 *)v15 + 2);
      unsigned int v23 = bswap32(v22) >> 16;
      if (!v18) {
        LOWORD(v22) = v23;
      }
      *(_WORD *)(a3 + 60) = v22;
      int v14 = 1;
      *(unsigned char *)(a3 + 13) = 1;
    }
    else
    {
      int v14 = 0;
    }
  }
  else
  {
    int v14 = 1;
  }
  int v24 = *(unsigned __int16 *)(a3 + 98);
  int v25 = *(unsigned __int8 *)(a3 + 80);
  if (v25 != 119)
  {
    if (v25 == 118)
    {
      BOOL RingCentroids = MTParse_PrecisePathPayload(a1, a2, (MTParsedMultitouchFrameRep_t *)a3, a4, *(unsigned __int8 *)(a3 + 102), v12, v10, 0);
      goto LABEL_26;
    }
    if (v25 == 117)
    {
      BOOL RingCentroids = MTParse_V4BinaryPathPayload(a1, a2, (MTParsedMultitouchFrameRep_t *)a3, a4, *(unsigned __int8 *)(a3 + 102), v12, v10);
LABEL_26:
      int v27 = RingCentroids;
      goto LABEL_27;
    }
LABEL_24:
    int v27 = 0;
    goto LABEL_27;
  }
  if (!MTParse_PrecisePathPayload(a1, a2, (MTParsedMultitouchFrameRep_t *)a3, a4, *(unsigned __int8 *)(a3 + 102), v12, v10, 1))goto LABEL_24; {
  if (a4->var83)
  }
  {
    BOOL RingCentroids = MTParse_GenerateRingCentroids((MTParsedMultitouchFrameRep_t *)a3, a4);
    goto LABEL_26;
  }
  int v27 = 1;
LABEL_27:
  if (*(unsigned char *)(a3 + 12) && v24 && v24 + (unsigned __int16)(v10 + v12) <= a2) {
    unsigned int v28 = MTParse_BinaryImagePayload(&a1[(unsigned __int16)(v10 + v12)], v24, (MTParsedMultitouchFrameRep_t *)a3, a4);
  }
  else {
    unsigned int v28 = v24 == 0;
  }
  if (v14) {
    return v27 & v28;
  }
  else {
    return 0;
  }
}

uint64_t MTParse_HostPathAndImage(_OWORD *a1, signed int a2, uint64_t a3)
{
  if (a2 < 0x1C) {
    return 0;
  }
  long long v4 = *(_OWORD *)((char *)a1 + 12);
  *(_OWORD *)(a3 + 80) = *a1;
  *(_OWORD *)(a3 + 92) = v4;
  *(unsigned char *)(a3 + 8) = *(unsigned char *)(a3 + 80);
  *(unsigned char *)(a3 + 9) = 0;
  *(unsigned char *)(a3 + 15) = *(unsigned char *)(a3 + 83);
  *(unsigned char *)(a3 + 16) = *(unsigned char *)(a3 + 81);
  *(_WORD *)(a3 + 62) = *(_WORD *)(a3 + 102);
  *(unsigned char *)(a3 + 64) = *(unsigned char *)(a3 + 104);
  *(_WORD *)(a3 + 66) = *(_WORD *)(a3 + 98);
  *(_DWORD *)(a3 + 68) = *(unsigned __int16 *)(a3 + 100);
  uint64_t v5 = *(unsigned __int8 *)(a3 + 96);
  BOOL v6 = *(unsigned char *)(a3 + 96) != 0;
  *(unsigned char *)(a3 + 72) = v5;
  uint64_t v8 = *(unsigned int *)(a3 + 84);
  int v7 = *(_DWORD *)(a3 + 88);
  *(_DWORD *)(a3 + 73) = v7;
  *(_DWORD *)(a3 + 36) = 272;
  *(unsigned char *)(a3 + 52) = 0;
  *(unsigned char *)(a3 + 54) = v7;
  *(void *)a3 = v8;
  *(unsigned char *)(a3 + 11) = v6;
  size_t v9 = *(unsigned __int16 *)(a3 + 94);
  *(unsigned char *)(a3 + 12) = *(_WORD *)(a3 + 94) != 0;
  *(unsigned char *)(a3 + 113) = 1;
  if (v5)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 60 * v5;
    uint64_t v12 = 124;
    float32x4_t v13 = (float32x4_t)vdupq_n_s32(0x447A0000u);
    while (v12 <= a2)
    {
      uint64_t v14 = a3 + v10;
      int16x8_t v15 = *(int16x8_t *)((char *)a1 + v12 - 80);
      *(int16x4_t *)v15.uint64_t i8 = vmovn_s32((int32x4_t)v15);
      *(_DWORD *)(v14 + 116) = vmovn_s16(v15).u32[0];
      *(float32x4_t *)(v14 + 120) = vmulq_f32(*(float32x4_t *)((char *)a1 + v12 - 28), v13);
      *(float32x2_t *)(v14 + 136) = vmul_f32(*(float32x2_t *)((char *)a1 + v12 - 36), *(float32x2_t *)v13.f32);
      int v16 = *(_DWORD *)((char *)a1 + v12 - 44);
      int v17 = *(_DWORD *)((char *)a1 + v12 - 48);
      *(_DWORD *)(v14 + 144) = *(_DWORD *)((char *)a1 + v12 - 40);
      *(_DWORD *)(v14 + 148) = v17;
      int v18 = *(_DWORD *)((char *)a1 + v12 - 8);
      *(_DWORD *)(v14 + 152) = *(_DWORD *)((char *)a1 + v12 - 4);
      *(_DWORD *)(v14 + 156) = v16;
      *(_WORD *)(v14 + 160) = *(_WORD *)((char *)a1 + v12 - 12);
      *(_DWORD *)(v14 + 164) = v18;
      *(void *)(v14 + 168) = 0;
      v10 += 60;
      v12 += 96;
      if (v11 == v10)
      {
        int v19 = v12 - 96;
        goto LABEL_9;
      }
    }
    return 0;
  }
  int v19 = 28;
LABEL_9:
  if (v19 + (int)v9 > a2) {
    return 0;
  }
  memcpy(*(void **)(a3 + 40), (char *)a1 + v19, v9);
  return 1;
}

BOOL MTParse_SABinary(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  BOOL result = 0;
  v15[0] = a3;
  v15[1] = a4;
  uint64_t v11 = 0;
  uint64_t v12 = v15;
  uint64_t v9 = a1 + 1;
  unint64_t v10 = a2 - 1;
  unint64_t v13 = 0xAAAAAAAAAAAAAA00;
  uint64_t v14 = 0;
  if (v10 >= 2)
  {
    if (*(unsigned char *)(a1 + 1) == 1 && *(unsigned char *)(a1 + 2) == 2)
    {
      *(unsigned char *)(a3 + 80) = 90;
      *(_WORD *)(a3 + 82) = 540;
      *(unsigned char *)(a3 + 8) = 90;
      *(unsigned char *)(a3 + 15) = 2;
      *(_WORD *)(a3 + 62) = *(_WORD *)(a3 + 102);
      *(unsigned char *)(a3 + 64) = *(unsigned char *)(a3 + 104);
      *(_WORD *)(a3 + 66) = *(_WORD *)(a3 + 98);
      *(_DWORD *)(a3 + 68) = *(unsigned __int16 *)(a3 + 100);
      *(unsigned char *)(a3 + 72) = *(unsigned char *)(a3 + 96);
      int v7 = *(_DWORD *)(a3 + 88);
      *(_DWORD *)(a3 + 73) = v7;
      *(unsigned char *)(a3 + 36) = 16;
      *(unsigned char *)(a3 + 52) = 0;
      *(unsigned char *)(a3 + 54) = v7;
      *(unsigned char *)(a3 + 11) = 0;
      *(unsigned char *)(a3 + 12) = *(_WORD *)(a3 + 94) != 0;
      *(unsigned char *)(a3 + 113) = 0;
      int v8 = SABinaryParser::parseRunFrame(&v9, (unsigned int (*)(void))MTParse_SABinary::$_0::__invoke, (uint64_t (*)(uint64_t, unsigned __int8 *, char *))MTParse_SABinary::$_1::__invoke, (uint64_t (*)(void, unsigned __int8 *, unsigned __int8 *))MTParse_SABinary::$_2::__invoke);
      BOOL result = 0;
      if (v8) {
        return *(unsigned char *)(a3 + 11) != 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t SABinaryParser::parseRunFrame(void *a1, unsigned int (*a2)(void), uint64_t (*a3)(uint64_t, unsigned __int8 *, char *), uint64_t (*a4)(void, unsigned __int8 *, unsigned __int8 *))
{
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  if ((unint64_t)(v4 - v5) < 2) {
    return 0;
  }
  a1[2] = v5 + 2;
  if ((unint64_t)(v4 - (v5 + 2)) < 4) {
    return 0;
  }
  uint64_t v8 = *a1 + v5 + 2;
  uint64_t v9 = v5 + 6;
  a1[2] = v9;
  unint64_t v10 = *(unsigned __int16 *)(v8 + 2);
  if (v4 - v9 < v10) {
    return 0;
  }
  a1[2] = v9 + v10;
  if (a2)
  {
    if (!a2(a1[3])) {
      return 0;
    }
  }
  return SABinaryParser::parseInjExtData((uint64_t)a1, a3, a4, 0);
}

BOOL MTParse_SensorImageHeader(unsigned __int8 *a1, int a2, MTParsedMultitouchFrameRep_t *a3, __MTDevice *a4)
{
  if (a1) {
    BOOL v5 = a2 <= 7;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL result = !v5;
  if (result)
  {
    *((_OWORD *)a3 + 5) = 0u;
    *((_OWORD *)a3 + 6) = 0u;
    char v7 = *a1;
    *((unsigned char *)a3 + 80) = *a1;
    unsigned __int8 v8 = a1[1];
    *((unsigned char *)a3 + 81) = v8;
    unsigned int v9 = a1[2];
    *((unsigned char *)a3 + 82) = v9;
    unsigned __int8 v10 = a1[3];
    *((unsigned char *)a3 + 83) = v10;
    unsigned int var21 = a4->var21;
    LODWORD(v12) = *((_DWORD *)a1 + 1);
    unsigned int v13 = bswap32(v12);
    if (var21 == 1) {
      uint64_t v12 = v12;
    }
    else {
      uint64_t v12 = v13;
    }
    *((_DWORD *)a3 + 21) = v12;
    if (v9 < 0x10)
    {
      int v32 = 0;
      unsigned int v14 = 0;
      __int16 v17 = 0;
      LOWORD(v18) = 0;
      LOWORD(v26) = 0;
      LOWORD(v20) = 0;
      unsigned int v31 = 0;
      unsigned int v28 = 0;
    }
    else
    {
      *((unsigned char *)a3 + 88) = a1[8];
      *((unsigned char *)a3 + 89) = a1[9];
      unsigned int v14 = a1[10];
      *((unsigned char *)a3 + 90) = v14;
      *((unsigned char *)a3 + 91) = a1[11];
      unsigned int v15 = bswap32(*((unsigned __int16 *)a1 + 6)) >> 16;
      BOOL v16 = var21 == 1;
      if (var21 == 1) {
        __int16 v17 = *((_WORD *)a1 + 6);
      }
      else {
        __int16 v17 = v15;
      }
      *((_WORD *)a3 + 46) = v17;
      unsigned int v18 = *((unsigned __int16 *)a1 + 7);
      unsigned int v19 = bswap32(v18) >> 16;
      if (!v16) {
        LOWORD(v18) = v19;
      }
      *((_WORD *)a3 + 47) = v18;
      unsigned int v20 = *((unsigned __int16 *)a1 + 8);
      unsigned int v21 = bswap32(v20) >> 16;
      if (!v16) {
        LOWORD(v20) = v21;
      }
      *((_WORD *)a3 + 48) = v20;
      unsigned int v22 = *((unsigned __int16 *)a1 + 9);
      unsigned int v23 = bswap32(v22) >> 16;
      if (!v16) {
        LOWORD(v22) = v23;
      }
      *((_WORD *)a3 + 49) = v22;
      unsigned int v24 = *((unsigned __int16 *)a1 + 10);
      unsigned int v25 = bswap32(v24) >> 16;
      if (!v16) {
        LOWORD(v24) = v25;
      }
      *((_WORD *)a3 + 50) = v24;
      unsigned int v26 = *((unsigned __int16 *)a1 + 11);
      unsigned int v27 = bswap32(v26) >> 16;
      if (!v16) {
        LOWORD(v26) = v27;
      }
      *((_WORD *)a3 + 51) = v26;
      unsigned int v28 = *((_DWORD *)a1 + 6);
      unsigned int v29 = bswap32(v28);
      if (!v16) {
        unsigned int v28 = v29;
      }
      *((_DWORD *)a3 + 26) = v28;
      unsigned int v30 = *((_DWORD *)a1 + 7);
      unsigned int v31 = bswap32(v30);
      if (v16) {
        unsigned int v31 = v30;
      }
      *((_DWORD *)a3 + 27) = v31;
      int v32 = *((_DWORD *)a3 + 22);
    }
    *((unsigned char *)a3 + 8) = v7;
    *((unsigned char *)a3 + 9) = 0;
    *((unsigned char *)a3 + 15) = v10;
    *((unsigned char *)a3 + 16) = v8;
    *((_DWORD *)a3 + 5) = v28;
    *((_DWORD *)a3 + 6) = v31;
    *((_WORD *)a3 + 17) = v20;
    *((_WORD *)a3 + 16) = v26;
    *((_WORD *)a3 + 15) = v18;
    *((_WORD *)a3 + 14) = v17;
    *((unsigned char *)a3 + 37) = (v14 & 4) != 0;
    *((unsigned char *)a3 + 38) = (v14 & 8) != 0;
    *((unsigned char *)a3 + 39) = v14 >> 7;
    *(_DWORD *)((char *)a3 + 73) = v32;
    *(_WORD *)((char *)a3 + 11) = 256;
    *((unsigned char *)a3 + 36) = 0x100C0806u >> (8 * (v14 & 3));
    *((unsigned char *)a3 + 54) = v32;
    *(void *)a3 = v12;
  }
  return result;
}

uint64_t MTParse_SensorImage(unsigned __int8 *a1, int a2, uint64_t a3, __MTDevice *a4)
{
  uint64_t result = MTParse_SensorImageHeader(a1, a2, (MTParsedMultitouchFrameRep_t *)a3, a4);
  if (result)
  {
    int v9 = *(unsigned __int16 *)(a3 + 98);
    if (*(unsigned char *)(a3 + 12)) {
      BOOL v10 = v9 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10) {
      return v9 == 0;
    }
    uint64_t v11 = *(unsigned __int8 *)(a3 + 82);
    if ((int)v11 + v9 > a2)
    {
      return v9 == 0;
    }
    else
    {
      return MTParse_BinaryImagePayload(&a1[v11], v9, (MTParsedMultitouchFrameRep_t *)a3, a4);
    }
  }
  return result;
}

BOOL MTParse_BinaryFrameHeader(unsigned __int8 *a1, int a2, MTParsedMultitouchFrameRep_t *a3, __MTDevice *a4)
{
  if (a1) {
    BOOL v5 = a2 <= 7;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL result = !v5;
  if (result)
  {
    *((void *)a3 + 10) = 0;
    *((void *)a3 + 11) = 0;
    *((_DWORD *)a3 + 26) = 0;
    *((void *)a3 + 12) = 0;
    int v7 = *a1;
    *((unsigned char *)a3 + 80) = v7;
    unsigned __int8 v8 = a1[1];
    *((unsigned char *)a3 + 81) = v8;
    unsigned int v9 = a1[2];
    *((unsigned char *)a3 + 82) = v9;
    unsigned int v10 = a1[3];
    *((unsigned char *)a3 + 83) = v10;
    unsigned int var21 = a4->var21;
    LODWORD(v12) = *((_DWORD *)a1 + 1);
    unsigned int v13 = bswap32(v12);
    if (var21 == 1) {
      uint64_t v12 = v12;
    }
    else {
      uint64_t v12 = v13;
    }
    *((_DWORD *)a3 + 21) = v12;
    if (v9 < 0x10)
    {
      unsigned __int8 v19 = 0;
      LOWORD(v22) = 0;
      LOWORD(v20) = 0;
      unsigned __int8 v24 = 0;
      __int16 v25 = 0;
      unsigned int v14 = 0;
    }
    else
    {
      *((unsigned char *)a3 + 88) = a1[8];
      *((unsigned char *)a3 + 89) = a1[9];
      unsigned int v14 = a1[10];
      *((unsigned char *)a3 + 90) = v14;
      *((unsigned char *)a3 + 91) = a1[11];
      unsigned int v15 = *((unsigned __int16 *)a1 + 6);
      unsigned int v16 = bswap32(v15) >> 16;
      if (var21 != 1) {
        LOWORD(v15) = v16;
      }
      *((_WORD *)a3 + 46) = v15;
      unsigned int v17 = *((unsigned __int16 *)a1 + 7);
      unsigned int v18 = bswap32(v17) >> 16;
      if (var21 != 1) {
        LOWORD(v17) = v18;
      }
      *((_WORD *)a3 + 47) = v17;
      if (v9 < 0x16)
      {
        unsigned __int8 v19 = 0;
        LOWORD(v22) = 0;
        LOWORD(v20) = 0;
      }
      else
      {
        unsigned __int8 v19 = a1[16];
        *((unsigned char *)a3 + 96) = v19;
        *((unsigned char *)a3 + 97) = a1[17];
        unsigned int v20 = *((unsigned __int16 *)a1 + 9);
        unsigned int v21 = bswap32(v20) >> 16;
        if (var21 != 1) {
          LOWORD(v20) = v21;
        }
        *((_WORD *)a3 + 49) = v20;
        if (v10 < 2)
        {
          LOWORD(v22) = 0;
        }
        else
        {
          unsigned int v22 = *((unsigned __int16 *)a1 + 10);
          unsigned int v23 = bswap32(v22) >> 16;
          if (var21 != 1) {
            LOWORD(v22) = v23;
          }
        }
        *((_WORD *)a3 + 50) = v22;
        if (v9 >= 0x18)
        {
          unsigned int v26 = bswap32(*((unsigned __int16 *)a1 + 11)) >> 16;
          if (var21 == 1) {
            __int16 v25 = *((_WORD *)a1 + 11);
          }
          else {
            __int16 v25 = v26;
          }
          *((_WORD *)a3 + 51) = v25;
          if (v9 == 24)
          {
            unsigned __int8 v24 = 0;
          }
          else
          {
            unsigned __int8 v24 = a1[24];
            *((unsigned char *)a3 + 104) = v24;
          }
          goto LABEL_32;
        }
      }
      unsigned __int8 v24 = 0;
      __int16 v25 = 0;
    }
LABEL_32:
    *((unsigned char *)a3 + 8) = v7;
    *((unsigned char *)a3 + 9) = 0;
    *((unsigned char *)a3 + 15) = v10;
    *((unsigned char *)a3 + 16) = v8;
    *((unsigned char *)a3 + 37) = (v14 & 4) != 0;
    *((unsigned char *)a3 + 38) = (v14 & 8) != 0;
    *((unsigned char *)a3 + 39) = v14 >> 7;
    *((_WORD *)a3 + 31) = v25;
    *((unsigned char *)a3 + 64) = v24;
    *((_WORD *)a3 + 33) = v20;
    *((_DWORD *)a3 + 17) = (unsigned __int16)v22;
    *((unsigned char *)a3 + 72) = v19;
    int v27 = *((_DWORD *)a3 + 22);
    *(_DWORD *)((char *)a3 + 73) = v27;
    *((unsigned char *)a3 + 36) = 0x100C0806u >> (8 * (v14 & 3));
    *((unsigned char *)a3 + 52) = 0;
    *((unsigned char *)a3 + 54) = v27;
    *(void *)a3 = v12;
    *((unsigned char *)a3 + 12) = v7 == 69;
    *((unsigned char *)a3 + 11) = v7 == 69;
  }
  return result;
}

uint64_t MTParse_BinaryPathOrImage(unsigned __int8 *a1, int a2, uint64_t a3, __MTDevice *a4)
{
  uint64_t result = MTParse_BinaryFrameHeader(a1, a2, (MTParsedMultitouchFrameRep_t *)a3, a4);
  if (result)
  {
    int v9 = *(unsigned __int16 *)(a3 + 94);
    if (*(_WORD *)(a3 + 94) && (uint64_t v10 = *(unsigned __int8 *)(a3 + 82), (int)v10 + v9 <= a2))
    {
      uint64_t result = MTParse_BinaryImagePayload(&a1[v10], v9, (MTParsedMultitouchFrameRep_t *)a3, a4);
      int v9 = *(unsigned __int16 *)(a3 + 94);
    }
    else
    {
      uint64_t result = 0;
    }
    unint64_t v11 = *(unsigned __int8 *)(a3 + 97);
    if (v9 + *(unsigned __int8 *)(a3 + 82) + *(unsigned __int8 *)(a3 + 96) * (int)v11 <= a2)
    {
      if (*(unsigned char *)(a3 + 96))
      {
        uint64_t v12 = 0;
        for (uint64_t i = (_WORD *)(a3 + 144); ; i += 15)
        {
          unsigned int v14 = &a1[*(unsigned __int16 *)(a3 + 94) + *(unsigned __int8 *)(a3 + 82) + v12 * v11];
          if (v11 <= 0x13) {
            break;
          }
          *((unsigned char *)i - 28) = *v14;
          *((unsigned char *)i - 27) = v14[1];
          *((unsigned char *)i - 26) = v14[2];
          *((unsigned char *)i - 25) = v14[3];
          unsigned int var21 = a4->var21;
          unsigned int v16 = *((unsigned __int16 *)v14 + 2);
          unsigned int v17 = bswap32(v16) >> 16;
          if (var21 != 1) {
            LOWORD(v16) = v17;
          }
          *(i - 12) = v16;
          unsigned int v18 = *((unsigned __int16 *)v14 + 3);
          unsigned int v19 = bswap32(v18) >> 16;
          if (var21 != 1) {
            LOWORD(v18) = v19;
          }
          *(i - 11) = v18;
          unsigned int v20 = *((unsigned __int16 *)v14 + 4);
          unsigned int v21 = bswap32(v20) >> 16;
          if (var21 != 1) {
            LOWORD(v20) = v21;
          }
          *(i - 10) = v20;
          unsigned int v22 = *((unsigned __int16 *)v14 + 5);
          unsigned int v23 = bswap32(v22) >> 16;
          if (var21 != 1) {
            LOWORD(v22) = v23;
          }
          *(i - 9) = v22;
          unsigned int v24 = *((unsigned __int16 *)v14 + 6);
          unsigned int v25 = bswap32(v24) >> 16;
          if (var21 != 1) {
            LOWORD(v24) = v25;
          }
          *(i - 8) = v24;
          unsigned int v26 = *((unsigned __int16 *)v14 + 7);
          unsigned int v27 = bswap32(v26) >> 16;
          if (var21 != 1) {
            LOWORD(v26) = v27;
          }
          *(i - 7) = v26;
          unsigned int v28 = *((unsigned __int16 *)v14 + 8);
          unsigned int v29 = bswap32(v28) >> 16;
          if (var21 != 1) {
            LOWORD(v28) = v29;
          }
          *(i - 6) = v28;
          unsigned int v30 = *((unsigned __int16 *)v14 + 9);
          unsigned int v31 = bswap32(v30) >> 16;
          if (var21 != 1) {
            LOWORD(v30) = v31;
          }
          *(i - 5) = v30;
          if (v11 < 0x16) {
            goto LABEL_32;
          }
          unsigned int v32 = bswap32(*((unsigned __int16 *)v14 + 10)) >> 16;
          if (var21 == 1) {
            __int16 v33 = *((_WORD *)v14 + 10);
          }
          else {
            __int16 v33 = v32;
          }
          *(i - 4) = v33;
LABEL_33:
          if (v11 <= 0x17)
          {
            *(i - 3) = v33;
LABEL_47:
            *(i - 2) = 0;
            goto LABEL_48;
          }
          unsigned int v34 = a4->var21;
          unsigned int v35 = *((unsigned __int16 *)v14 + 11);
          unsigned int v36 = bswap32(v35) >> 16;
          if (v34 != 1) {
            LOWORD(v35) = v36;
          }
          *(i - 3) = v35;
          if (v11 <= 0x19) {
            goto LABEL_47;
          }
          unsigned int v37 = *((unsigned __int16 *)v14 + 12);
          unsigned int v38 = bswap32(v37) >> 16;
          if (v34 != 1) {
            LOWORD(v37) = v38;
          }
          *(i - 2) = v37;
          if (v11 > 0x1B)
          {
            unsigned int v39 = *((unsigned __int16 *)v14 + 13);
            unsigned int v40 = bswap32(v39) >> 16;
            if (v34 != 1) {
              LOWORD(v39) = v40;
            }
            *(i - 1) = v39;
            if (v11 < 0x1E)
            {
              __int16 v42 = 0;
            }
            else
            {
              unsigned int v41 = bswap32(*((unsigned __int16 *)v14 + 14)) >> 16;
              if (v34 == 1) {
                __int16 v42 = *((_WORD *)v14 + 14);
              }
              else {
                __int16 v42 = v41;
              }
            }
            goto LABEL_49;
          }
LABEL_48:
          __int16 v42 = 0;
          *(i - 1) = 0;
LABEL_49:
          *uint64_t i = v42;
          if (++v12 >= (unint64_t)*(unsigned __int8 *)(a3 + 96)) {
            return 1;
          }
        }
        LOWORD(v30) = *(i - 5);
        LOWORD(v24) = *(i - 8);
        LOWORD(v26) = *(i - 7);
LABEL_32:
        __int16 v33 = mtalg_ComputeContactDensityFromRadii((uint64_t)a4, (__int16)v30, (__int16)v24, (__int16)v26);
        *(i - 4) = v33;
        unint64_t v11 = *(unsigned __int8 *)(a3 + 97);
        goto LABEL_33;
      }
      return 1;
    }
  }
  return result;
}

uint64_t MTParse_TimestampSync(const void *a1, unsigned int a2, uint64_t a3)
{
  memset(__dst, 170, 20);
  if (a2 > 0x14) {
    return 0;
  }
  size_t v5 = a2;
  bzero((char *)__dst + a2, 20 - a2);
  memcpy(__dst, a1, v5);
  if (BYTE1(__dst[0]) != 255) {
    return 0;
  }
  if (*(void *)((char *)&__dst[1] + 4))
  {
    uint64_t v7 = *(void *)((char *)&__dst[1] + 4) - *(void *)((char *)__dst + 4);
    if (*(void *)((char *)&__dst[1] + 4) == *(void *)((char *)__dst + 4)) {
      uint64_t v7 = 1;
    }
    *(void *)(a3 + 184) = v7;
  }
  else
  {
    *(void *)(a3 + 184) = 0;
  }
  return 1;
}

uint64_t MTParse_ExternalMessage(uint64_t a1, int a2, void *a3, _WORD *a4, _DWORD *a5)
{
  if ((*(unsigned char *)(a1 + 1) & 0xFE) != 2) {
    return 0;
  }
  unint64_t v5 = *(unsigned __int16 *)(a1 + 2);
  if (a2 - 6 < v5) {
    return 0;
  }
  __int16 v7 = *(_WORD *)(a1 + 4);
  *a3 = a1 + 6;
  *a4 = v7;
  *a5 = v5;
  return 1;
}

uint64_t MTProcess_0xC5_Data(unsigned __int8 *a1, int a2, MTParsedMultitouchFrameRep_t *a3, __MTDevice *a4)
{
  int v8 = *a1;
  *((unsigned char *)a3 + 8) = v8;
  *((unsigned char *)a3 + 16) = a1[1];
  if (v8 == 198)
  {
    unsigned int var21 = a4->var21;
    unsigned int v14 = bswap32(*((unsigned __int16 *)a1 + 4)) >> 16;
    BOOL v15 = var21 == 1;
    if (var21 == 1) {
      char v16 = *((_WORD *)a1 + 4);
    }
    else {
      char v16 = v14;
    }
    *((unsigned char *)a3 + 37) = (v16 & 4) != 0;
    LODWORD(v17) = *((_DWORD *)a1 + 1);
    unsigned int v18 = bswap32(v17);
    if (v15) {
      uint64_t v17 = v17;
    }
    else {
      uint64_t v17 = v18;
    }
    if ((v16 & 2) != 0) {
      char v19 = 16;
    }
    else {
      char v19 = 8;
    }
    *((unsigned char *)a3 + 36) = v19;
    *((unsigned char *)a3 + 38) = v16 & 1;
    *((unsigned char *)a3 + 39) = v16 < 0;
    *((unsigned char *)a3 + 52) = a1[2];
    *((unsigned char *)a3 + 54) = a1[3];
    *(void *)a3 = v17;
    unsigned int v20 = a1[10];
  }
  else
  {
    if (v8 == 197)
    {
      *((unsigned char *)a3 + 37) = (a1[2] & 4) != 0;
      if ((a1[2] & 2) != 0) {
        char v9 = 16;
      }
      else {
        char v9 = 8;
      }
      *((unsigned char *)a3 + 36) = v9;
      *((unsigned char *)a3 + 38) = a1[2] & 1;
      *((unsigned char *)a3 + 39) = a1[2] >> 7;
      *((unsigned char *)a3 + 52) = a1[3];
      *((unsigned char *)a3 + 54) = a1[4];
      unsigned int v10 = *(_DWORD *)(a1 + 6);
      unsigned int v11 = bswap32(v10);
      if (a4->var21 == 1) {
        uint64_t v12 = v10;
      }
      else {
        uint64_t v12 = v11;
      }
      *(void *)a3 = v12;
    }
    else
    {
      printf("Unknown data format %x\n", v8);
    }
    unsigned int v20 = 10;
  }
  return MTParse_BinaryImagePayload(&a1[v20], a2 - v20, a3, a4);
}

uint64_t MTProcess_0xCC_Data(unsigned __int8 *a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = 0;
  if (!a1 || a2 < 10) {
    return v4;
  }
  *(void *)(a3 + 80) = 0;
  *(void *)(a3 + 88) = 0;
  *(_DWORD *)(a3 + 104) = 0;
  *(void *)(a3 + 96) = 0;
  unsigned int v5 = 10;
  *(unsigned char *)(a3 + 82) = 10;
  int v6 = *a1;
  *(unsigned char *)(a3 + 80) = v6;
  unsigned __int8 v7 = a1[1];
  *(unsigned char *)(a3 + 81) = v7;
  unsigned __int8 v8 = a1[2];
  uint64_t v9 = a1[3];
  *(unsigned char *)(a3 + 96) = v9;
  if (v6 != 206)
  {
    LOBYTE(v10) = 0;
LABEL_10:
    int v17 = *(_DWORD *)(a4 + 100);
    unsigned int v18 = bswap32(*((unsigned __int16 *)a1 + 2)) >> 16;
    BOOL v19 = v17 == 1;
    if (v17 == 1) {
      LOWORD(v15) = *((_WORD *)a1 + 2);
    }
    else {
      LOWORD(v15) = v18;
    }
    unsigned int v12 = *(_DWORD *)(a1 + 6);
    unsigned int v20 = bswap32(v12);
    if (!v19) {
      unsigned int v12 = v20;
    }
    goto LABEL_15;
  }
  unsigned int v5 = a1[10];
  *(unsigned char *)(a3 + 82) = v5;
  unsigned int v10 = a1[11];
  *(unsigned char *)(a3 + 83) = v10;
  if (v10 < 2) {
    goto LABEL_10;
  }
  int v11 = *(_DWORD *)(a4 + 100);
  unsigned int v12 = *((_DWORD *)a1 + 1);
  unsigned int v13 = bswap32(v12);
  BOOL v14 = v11 == 1;
  if (v11 != 1) {
    unsigned int v12 = v13;
  }
  unsigned int v15 = *((unsigned __int16 *)a1 + 4);
  unsigned int v16 = bswap32(v15) >> 16;
  if (!v14) {
    LOWORD(v15) = v16;
  }
LABEL_15:
  *(_DWORD *)(a3 + 84) = v12;
  *(_WORD *)(a3 + 102) = v15;
  *(unsigned char *)(a3 + 8) = v6;
  *(unsigned char *)(a3 + 9) = 0;
  *(unsigned char *)(a3 + 15) = v10;
  *(unsigned char *)(a3 + 16) = v7;
  *(_WORD *)(a3 + 36) = 264;
  *(unsigned char *)(a3 + 52) = v8;
  *(unsigned char *)(a3 + 54) = 0;
  *(void *)a3 = v12;
  *(_WORD *)(a3 + 62) = v15;
  *(_WORD *)(a3 + 66) = 0;
  *(_DWORD *)(a3 + 68) = 0;
  *(unsigned char *)(a3 + 72) = v9;
  *(_DWORD *)(a3 + 73) = 0;
  if (v5 >= 0x14)
  {
    unsigned int v21 = bswap32(*((unsigned __int16 *)a1 + 8)) >> 16;
    if (*(_DWORD *)(a4 + 100) == 1) {
      __int16 v22 = *((_WORD *)a1 + 8);
    }
    else {
      __int16 v22 = v21;
    }
    *(_WORD *)(a3 + 98) = v22;
  }
  if (v5 + 32 * v9 > a2) {
    return 0;
  }
  if (v9)
  {
    uint64_t v23 = 0;
    int v24 = *(_DWORD *)(a4 + 100);
    uint64_t v25 = 30 * v9;
    unsigned int v26 = (unsigned __int16 *)&a1[v5 + 16];
    do
    {
      unsigned int v27 = (int16x4_t *)(a3 + v23);
      v27[14].i8[4] = *((unsigned char *)v26 - 16);
      v27[14].i8[5] = *((unsigned char *)v26 - 15);
      v27[14].i8[6] = *((unsigned char *)v26 - 14);
      v27[14].i8[7] = *((unsigned char *)v26 - 13);
      int v28 = *(_DWORD *)(a4 + 100);
      if (v6 == 204)
      {
        LOWORD(v29) = 0;
        v27[15] = vmovn_s32((int32x4_t)vshlq_u32((uint32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v28 == 1)), 0x1FuLL)), *(int8x16_t *)(v26 - 6), vrev32q_s8(*(int8x16_t *)(v26 - 6))), (uint32x4_t)xmmword_2262EEEF0));
        v27[17].i16[0] = 0;
      }
      else
      {
        unsigned int v30 = *(v26 - 6);
        unsigned int v31 = bswap32(v30) >> 16;
        BOOL v32 = v28 == 1;
        if (v28 != 1) {
          LOWORD(v30) = v31;
        }
        v27[15].i16[0] = v30;
        unsigned int v33 = *(v26 - 5);
        unsigned int v34 = bswap32(v33) >> 16;
        if (!v32) {
          LOWORD(v33) = v34;
        }
        v27[15].i16[1] = v33;
        unsigned int v35 = *(v26 - 4);
        unsigned int v36 = bswap32(v35) >> 16;
        if (!v32) {
          LOWORD(v35) = v36;
        }
        v27[15].i16[2] = v35;
        unsigned int v37 = *(v26 - 3);
        unsigned int v38 = bswap32(v37) >> 16;
        if (!v32) {
          LOWORD(v37) = v38;
        }
        v27[15].i16[3] = v37;
        unsigned int v39 = *v26;
        unsigned int v40 = bswap32(v39) >> 16;
        if (!v32) {
          LOWORD(v39) = v40;
        }
        v27[17].i16[0] = v39;
        unsigned int v29 = bswap32(v26[1]) >> 16;
        if (v32) {
          LOWORD(v29) = v26[1];
        }
      }
      unsigned int v41 = (_WORD *)(a3 + v23);
      *(_WORD *)(a3 + v23 + 140) = v29;
      unsigned int v42 = v26[2];
      unsigned int v43 = bswap32(v42) >> 16;
      if (v24 != 1) {
        LOWORD(v42) = v43;
      }
      v41[67] = v42;
      unsigned int v44 = v26[3];
      unsigned int v45 = bswap32(v44) >> 16;
      if (v24 != 1) {
        LOWORD(v44) = v45;
      }
      v41[69] = v44;
      unsigned int v46 = v26[4];
      unsigned int v47 = bswap32(v46) >> 16;
      if (v24 != 1) {
        LOWORD(v46) = v47;
      }
      v41[71] = v46;
      unsigned int v48 = v26[5];
      unsigned int v49 = bswap32(v48) >> 16;
      if (v24 != 1) {
        LOWORD(v48) = v49;
      }
      v41[66] = v48;
      unsigned int v50 = v26[6];
      unsigned int v51 = bswap32(v50) >> 16;
      if (v24 != 1) {
        LOWORD(v50) = v51;
      }
      v41[64] = v50;
      unsigned int v52 = v26[7];
      unsigned int v53 = bswap32(v52) >> 16;
      if (v24 != 1) {
        LOWORD(v52) = v53;
      }
      v41[65] = v52;
      v41[72] = 0;
      v23 += 30;
      v26 += 16;
    }
    while (v25 != v23);
  }
  return 1;
}

uint64_t MTParseSensorRegionsReport(unsigned __int8 *a1, int a2, char *a3, int a4)
{
  uint64_t result = 0;
  if (a3)
  {
    if (a4 >= 1)
    {
      bzero(a3, 7 * a4);
      uint64_t result = 0;
      if (a1)
      {
        if (a2 >= 1)
        {
          LODWORD(v9) = (a2 - 1) / 7u;
          uint64_t result = 0;
          uint64_t v9 = v9 >= *a1 ? *a1 : v9;
          if (v9)
          {
            unsigned int v10 = (char *)(a1 + 3);
            do
            {
              uint64_t v11 = *(v10 - 2);
              if ((int)v11 < a4)
              {
                unsigned int v12 = &a3[8 * v11 - v11];
                *unsigned int v12 = v11;
                v12[1] = *(v10 - 1);
                v12[2] = *v10;
                unsigned int v13 = v10[1];
                if (v13 <= 1) {
                  LOBYTE(v13) = 1;
                }
                v12[3] = v13;
                v12[4] = v10[2];
                v12[5] = v10[3];
                v12[6] = v10[4];
                uint64_t result = (result + 1);
              }
              v10 += 7;
              --v9;
            }
            while (v9);
          }
        }
      }
    }
  }
  return result;
}

uint64_t MTParseSensorRegionParam(unsigned __int16 *a1, int a2, _WORD *a3, uint64_t a4)
{
  if (a1) {
    BOOL v4 = a2 == 6;
  }
  else {
    BOOL v4 = 0;
  }
  BOOL v5 = !v4 || a3 == 0;
  int v6 = v5;
  if (!v5)
  {
    int v7 = *(_DWORD *)(a4 + 100);
    unsigned int v8 = bswap32(*a1) >> 16;
    BOOL v9 = v7 == 1;
    if (v7 == 1) {
      __int16 v10 = *a1;
    }
    else {
      __int16 v10 = v8;
    }
    *a3 = v10;
    unsigned int v11 = a1[1];
    unsigned int v12 = bswap32(v11) >> 16;
    if (!v9) {
      LOWORD(v11) = v12;
    }
    a3[1] = v11;
    unsigned int v13 = a1[2];
    unsigned int v14 = bswap32(v13) >> 16;
    if (!v9) {
      LOWORD(v13) = v14;
    }
    a3[2] = v13;
  }
  return v6 ^ 1u;
}

uint64_t MTParseSensorSurfaceDescriptor(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if (a1) {
    BOOL v4 = a2 == 16;
  }
  else {
    BOOL v4 = 0;
  }
  BOOL v5 = !v4 || a3 == 0;
  int v6 = v5;
  if (!v5)
  {
    int v7 = *(_DWORD *)(a4 + 100);
    unsigned int v8 = bswap32(*(_DWORD *)a1);
    BOOL v9 = v7 == 1;
    if (v7 == 1) {
      unsigned int v10 = *(_DWORD *)a1;
    }
    else {
      unsigned int v10 = v8;
    }
    *(_DWORD *)a3 = v10;
    unsigned int v11 = *(_DWORD *)(a1 + 4);
    unsigned int v12 = bswap32(v11);
    if (!v9) {
      unsigned int v11 = v12;
    }
    *(_DWORD *)(a3 + 4) = v11;
    unsigned int v13 = *(unsigned __int16 *)(a1 + 8);
    unsigned int v14 = bswap32(v13) >> 16;
    if (!v9) {
      LOWORD(v13) = v14;
    }
    *(_WORD *)(a3 + 8) = v13;
    unsigned int v15 = *(unsigned __int16 *)(a1 + 10);
    unsigned int v16 = bswap32(v15) >> 16;
    if (!v9) {
      LOWORD(v15) = v16;
    }
    *(_WORD *)(a3 + 10) = v15;
    unsigned int v17 = *(unsigned __int16 *)(a1 + 12);
    unsigned int v18 = bswap32(v17) >> 16;
    if (!v9) {
      LOWORD(v17) = v18;
    }
    *(_WORD *)(a3 + 12) = v17;
    unsigned int v19 = *(unsigned __int16 *)(a1 + 14);
    unsigned int v20 = bswap32(v19) >> 16;
    if (!v9) {
      LOWORD(v19) = v20;
    }
    *(_WORD *)(a3 + 14) = v19;
  }
  return v6 ^ 1u;
}

uint64_t MTParse_HIDMouseReport(unsigned char *a1, int a2, unsigned char *a3)
{
  if (a1) {
    BOOL v3 = a3 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  BOOL v4 = v3 || a2 < 4;
  int v5 = v4;
  if (!v4)
  {
    *a3 = *a1;
    a3[1] = a1[1];
    a3[2] = a1[2];
    a3[3] = a1[3];
    if (a2 < 5)
    {
      char v6 = 0;
      a3[4] = 0;
    }
    else
    {
      a3[4] = a1[4];
      char v6 = a1[5];
    }
    a3[5] = v6;
  }
  return v5 ^ 1u;
}

uint64_t MTParse_HIDRelativePointerReport(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3 = 0;
  if (a2 >= 24 && a1 && a3)
  {
    *(unsigned char *)a3 = *(unsigned char *)a1;
    int v4 = *(unsigned __int8 *)(a1 + 1);
    *(unsigned char *)(a3 + 1) = v4;
    if (v4 == 1)
    {
      int v5 = *(unsigned __int16 *)(a1 + 2);
      *(_WORD *)(a3 + 2) = v5;
      *(_DWORD *)(a3 + 4) = *(_DWORD *)(a1 + 4);
      *(_DWORD *)(a3 + 8) = *(_DWORD *)(a1 + 8);
      *(_DWORD *)(a3 + 12) = *(_DWORD *)(a1 + 12);
      *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 16);
      *(_DWORD *)(a3 + 20) = *(_DWORD *)(a1 + 20);
      if (!v5) {
        *(_WORD *)(a3 + 2) = 400;
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

uint64_t MTParse_HIDRelativePointerV2Report(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3 = 0;
  if (a2 >= 32 && a1 && a3)
  {
    *(unsigned char *)a3 = *(unsigned char *)a1;
    int v4 = *(unsigned __int8 *)(a1 + 1);
    *(unsigned char *)(a3 + 1) = v4;
    if (v4 == 1)
    {
      int v5 = *(unsigned __int16 *)(a1 + 2);
      *(_WORD *)(a3 + 2) = v5;
      *(_DWORD *)(a3 + 4) = *(_DWORD *)(a1 + 4);
      *(_DWORD *)(a3 + 8) = *(_DWORD *)(a1 + 8);
      *(_DWORD *)(a3 + 12) = *(_DWORD *)(a1 + 12);
      *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 16);
      *(_DWORD *)(a3 + 20) = *(_DWORD *)(a1 + 20);
      *(void *)(a3 + 24) = *(void *)(a1 + 24);
      if (!v5) {
        *(_WORD *)(a3 + 2) = 400;
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

uint64_t MTParse_HIDOffTableHeightReport(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result = 0;
  if (a2 >= 8 && a1 && a3)
  {
    *(unsigned char *)a3 = *(unsigned char *)a1;
    int v5 = *(unsigned __int8 *)(a1 + 1);
    *(unsigned char *)(a3 + 1) = v5;
    if (v5 == 1)
    {
      *(_WORD *)(a3 + 2) = *(_WORD *)(a1 + 2);
      *(_DWORD *)(a3 + 4) = *(_DWORD *)(a1 + 4);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t MTConvert_V4HeaderToV2Header@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 24) = -1431655766;
  *(void *)a2 = *(void *)result;
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(result + 8);
  *(_WORD *)(a2 + 12) = 0;
  *(_WORD *)(a2 + 14) = *(_WORD *)(result + 18);
  unsigned int v2 = *(unsigned __int8 *)(result + 22);
  *(unsigned char *)(a2 + 16) = v2;
  if (v2) {
    unsigned int v3 = *(unsigned __int16 *)(result + 16) / v2;
  }
  else {
    LOBYTE(v3) = 96;
  }
  *(unsigned char *)(a2 + 17) = v3;
  *(_WORD *)(a2 + 18) = *(_WORD *)(result + 28);
  *(_WORD *)(a2 + 20) = *(_DWORD *)(result + 24);
  *(_WORD *)(a2 + 22) = *(_WORD *)(result + 30);
  *(unsigned char *)(a2 + 24) = 0;
  return result;
}

uint64_t *MTConvert_V3HeaderToV2Header@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  __int16 v2 = 0;
  *(_DWORD *)(a2 + 24) = -1431655766;
  uint64_t v3 = *result;
  *(void *)a2 = *result;
  *(_DWORD *)(a2 + 8) = *((_DWORD *)result + 2);
  *(_WORD *)(a2 + 12) = 0;
  if (v3 == 115) {
    __int16 v2 = *((_WORD *)result + 6);
  }
  *(_WORD *)(a2 + 14) = v2;
  unsigned int v4 = *((unsigned __int8 *)result + 14);
  *(unsigned char *)(a2 + 16) = v4;
  if (v4) {
    unsigned int v5 = *((unsigned __int16 *)result + 6) / v4;
  }
  else {
    LOBYTE(v5) = 96;
  }
  *(unsigned char *)(a2 + 17) = v5;
  *(_WORD *)(a2 + 18) = *((_WORD *)result + 10);
  *(_WORD *)(a2 + 20) = *((_DWORD *)result + 4);
  *(_WORD *)(a2 + 22) = *((_WORD *)result + 11);
  *(unsigned char *)(a2 + 24) = 0;
  return result;
}

uint64_t MTConvert_CompactHeaderToV2Header@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 24) = -1431655766;
  *(unsigned char *)a2 = *(unsigned char *)result;
  *(_WORD *)(a2 + 1) = 2048;
  *(unsigned char *)(a2 + 3) = 1;
  *(_DWORD *)(a2 + 4) = *(_DWORD *)(result + 4);
  *(unsigned char *)(a2 + 8) = *(unsigned char *)(result + 3);
  *(_WORD *)(a2 + 9) = 0;
  *(unsigned char *)(a2 + 11) = 4;
  *(_DWORD *)(a2 + 12) = 0;
  *(unsigned char *)(a2 + 16) = *(unsigned char *)(result + 2);
  *(unsigned char *)(a2 + 17) = 16;
  *(_DWORD *)(a2 + 18) = 0;
  *(_DWORD *)(a2 + 21) = 0;
  return result;
}

double MTConvert_CompactV3HeaderToV2Header@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 24) = -1431655766;
  *(unsigned char *)a2 = *(unsigned char *)a1;
  *(_WORD *)(a2 + 1) = 2048;
  *(unsigned char *)(a2 + 3) = 1;
  *(_DWORD *)(a2 + 4) = *(_DWORD *)(a1 + 4);
  double result = 2.05226843e-289;
  *(_DWORD *)(a2 + 8) = 0x4000000;
  *(_DWORD *)(a2 + 12) = 0;
  *(_WORD *)(a2 + 16) = 4608;
  *(_DWORD *)(a2 + 18) = 0;
  *(_DWORD *)(a2 + 21) = 0;
  return result;
}

double MTConvert_CompactV5HeaderToV2Header@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 24) = -1431655766;
  *(unsigned char *)a2 = *(unsigned char *)a1;
  *(_WORD *)(a2 + 1) = 3072;
  *(unsigned char *)(a2 + 3) = 1;
  *(_DWORD *)(a2 + 4) = *(_DWORD *)(a1 + 8);
  double result = 2.05226843e-289;
  *(_DWORD *)(a2 + 8) = 0x4000000;
  *(_DWORD *)(a2 + 12) = 0;
  *(_WORD *)(a2 + 16) = 4608;
  *(_DWORD *)(a2 + 18) = 0;
  *(_DWORD *)(a2 + 21) = 0;
  return result;
}

double MTConvert_CompactV9HeaderToV2Header@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 24) = -1431655766;
  *(unsigned char *)a2 = *(unsigned char *)a1;
  *(_WORD *)(a2 + 1) = 1792;
  *(unsigned char *)(a2 + 3) = 2;
  *(_DWORD *)(a2 + 4) = *(_DWORD *)(a1 + 2);
  double result = 2.05226843e-289;
  *(_DWORD *)(a2 + 8) = 0x4000000;
  *(_DWORD *)(a2 + 12) = 0;
  unsigned int v3 = *(unsigned __int8 *)(a1 + 1);
  *(unsigned char *)(a2 + 16) = v3 & 3;
  *(unsigned char *)(a2 + 17) = 22;
  *(_WORD *)(a2 + 18) = 0;
  *(_WORD *)(a2 + 20) = v3 >> 2;
  *(_WORD *)(a2 + 22) = 0;
  *(unsigned char *)(a2 + 24) = *(unsigned char *)(a1 + 6);
  return result;
}

uint64_t MTConvert_CompactV10HeaderToV2Header@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 24) = -1431655766;
  *(unsigned char *)a2 = *(unsigned char *)result;
  *(_WORD *)(a2 + 1) = 4352;
  *(unsigned char *)(a2 + 3) = 2;
  *(_DWORD *)(a2 + 4) = (3125 * (unint64_t)*(unsigned int *)(result + 1) * (unsigned __int128)0x68DB8BAC710CCuLL) >> 64;
  *(unsigned char *)(a2 + 8) = *(unsigned char *)(result + 14);
  *(_WORD *)(a2 + 9) = 1536;
  *(unsigned char *)(a2 + 11) = 4;
  *(_WORD *)(a2 + 12) = 0;
  *(_WORD *)(a2 + 14) = *(unsigned __int8 *)(result + 15);
  *(unsigned char *)(a2 + 16) = *(unsigned char *)(result + 13) >> 4;
  *(unsigned char *)(a2 + 17) = 19;
  *(_DWORD *)(a2 + 18) = 0;
  *(_WORD *)(a2 + 22) = 0;
  *(unsigned char *)(a2 + 24) = *(unsigned char *)(result + 16);
  return result;
}

uint64_t SABinaryParser::parseInjExtData(uint64_t a1, uint64_t (*a2)(uint64_t, unsigned __int8 *, char *), uint64_t (*a3)(void, unsigned __int8 *, unsigned __int8 *), uint64_t (*a4)(void))
{
  unint64_t v4 = *(void *)(a1 + 8);
  unint64_t v5 = *(void *)(a1 + 16);
  if (v4 <= v5) {
    return 1;
  }
  while (1)
  {
    unsigned int v10 = (unsigned __int8 *)(*(void *)a1 + v5);
    int v11 = (char)*v10;
    if ((v11 & 0x80000000) == 0)
    {
      if (v4 - v5 < 0x12) {
        return 0;
      }
      int v12 = *v10;
      *(void *)(a1 + 16) = v5 + 18;
      if (v12 == 3)
      {
        if (a4 && (a4(*(void *)(a1 + 24)) & 1) == 0) {
          return 0;
        }
      }
      else
      {
        if (v4 - (v5 + 18) < 4) {
          return 0;
        }
        unint64_t v19 = v5 + 22;
        *(void *)(a1 + 16) = v19;
        unint64_t v20 = *((unsigned __int16 *)v10 + 10);
        if (v4 - v19 < v20) {
          return 0;
        }
        *(void *)(a1 + 16) = v19 + v20;
        if (v12 == 2)
        {
          if (a3)
          {
            uint64_t result = a3(*(void *)(a1 + 24), v10, v10 + 22);
            if (!result) {
              return result;
            }
          }
          goto LABEL_27;
        }
        if (v12 != 1) {
          return 0;
        }
        if (a2)
        {
          uint64_t v17 = *(void *)(a1 + 24);
          unsigned int v18 = (char *)(v10 + 22);
LABEL_20:
          if ((a2(v17, v10, v18) & 1) == 0) {
            return 0;
          }
          goto LABEL_27;
        }
      }
      goto LABEL_27;
    }
    uint64_t v13 = *(void *)(a1 + 40);
    if (!v13) {
      return 0;
    }
    unsigned int v14 = v11 & 0x7F;
    if (v14 >= *(unsigned __int8 *)(a1 + 32)) {
      return 0;
    }
    unsigned int v15 = (unsigned __int8 *)(v13 + 22 * v14);
    unint64_t v16 = *((unsigned __int16 *)v15 + 10);
    if (v4 - v5 <= v16) {
      return 0;
    }
    *(void *)(a1 + 16) = v5 + v16 + 1;
    if (*v15 == 1)
    {
      if (!a2) {
        goto LABEL_27;
      }
      uint64_t v17 = *(void *)(a1 + 24);
      unsigned int v18 = (char *)(v10 + 1);
      unsigned int v10 = v15;
      goto LABEL_20;
    }
    if (a3 && (a3(*(void *)(a1 + 24), v15, v10 + 1) & 1) == 0) {
      return 0;
    }
LABEL_27:
    unint64_t v4 = *(void *)(a1 + 8);
    unint64_t v5 = *(void *)(a1 + 16);
    if (v4 <= v5) {
      return 1;
    }
  }
}

uint64_t MTParse_SABinary::$_0::__invoke(uint64_t *a1, uint64_t a2)
{
  if (*(_WORD *)a2 != 0x2000 || *(unsigned __int16 *)(a2 + 2) < 0x10u) {
    return 0;
  }
  int v3 = *(_DWORD *)(a2 + 12);
  if (!*(void *)(a2 + 4) && v3 == 0) {
    return 0;
  }
  uint64_t v5 = *a1;
  unint64_t v6 = *(void *)(a2 + 4) / 0x3E8uLL;
  *(_DWORD *)(v5 + 84) = v6;
  *(unsigned char *)(v5 + 81) = v3;
  *(unsigned char *)(v5 + 16) = v3;
  *(void *)uint64_t v5 = v6;
  return 1;
}

uint64_t MTParse_SABinary::$_1::__invoke(uint64_t *a1, uint64_t a2, unsigned __int8 *a3)
{
  int v5 = *(unsigned __int16 *)(a2 + 18);
  uint64_t v3 = a2 + 18;
  int v4 = v5;
  if (v5 == 12293) {
    return MTParse_SABinary_FireflyPaths(v3, a3, *a1, a1[1]);
  }
  if (v4 == 12288) {
    return MTParse_SABinary_Paths(v3, a3, *a1, (__MTDevice *)a1[1]);
  }
  return 1;
}

BOOL MTParse_SABinary_Paths(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __MTDevice *a4)
{
  unsigned int v4 = *(unsigned __int16 *)(a1 + 2);
  if (v4 < 4) {
    return 0;
  }
  int v5 = *a2;
  if (((16 * ((3 * v5) & 0x3FF)) | 4u) > v4) {
    return 0;
  }
  *(unsigned char *)(a3 + 96) = v5;
  int v7 = *((unsigned __int16 *)a2 + 1);
  *(_WORD *)(a3 + 100) = v7;
  *(unsigned char *)(a3 + 97) = 48;
  *(unsigned char *)(a3 + 72) = v5;
  *(_DWORD *)(a3 + 68) = v7;
  *(unsigned char *)(a3 + 11) = 1;
  return MTParse_PrecisePathPayload(a2 + 4, *(unsigned __int16 *)(a1 + 2) - 4, (MTParsedMultitouchFrameRep_t *)a3, a4, *a2, 0, 48 * v5, 0);
}

uint64_t MTParse_SABinary_FireflyPaths(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  unint64_t v4 = *(unsigned __int16 *)(a1 + 2);
  if (v4 < 4) {
    return 0;
  }
  uint64_t v6 = *a2;
  if (((v6 << 6) | 4uLL) > v4) {
    return 0;
  }
  *(unsigned char *)(a3 + 96) = v6;
  int v8 = *((unsigned __int16 *)a2 + 1);
  *(_WORD *)(a3 + 100) = v8;
  *(unsigned char *)(a3 + 97) = 60;
  *(unsigned char *)(a3 + 72) = v6;
  *(_DWORD *)(a3 + 68) = v8;
  *(unsigned char *)(a3 + 11) = 1;
  if (*a2 - 3 < 0xFFFFFFFE) {
    return 0;
  }
  unint64_t v11 = 0;
  uint64_t v12 = a3 + 116;
  uint64_t v13 = (unsigned int *)(a2 + 64);
  int32x2_t v14 = vdup_n_s32(0x42C80000u);
  do
  {
    uint64_t v15 = *(void *)(v13 - 3);
    unsigned int v16 = *(v13 - 1);
    *(_DWORD *)(v12 + 56) = v16;
    *(void *)(v12 + 48) = v15;
    unsigned int v17 = bswap32(v15);
    if (*(_DWORD *)(a4 + 100) != 1) {
      LODWORD(v15) = v17;
    }
    *(_DWORD *)(v12 + 48) = v15;
    unsigned int v18 = bswap32(*(_DWORD *)(v12 + 52));
    if (*(_DWORD *)(a4 + 100) == 1) {
      unsigned int v19 = *(_DWORD *)(v12 + 52);
    }
    else {
      unsigned int v19 = v18;
    }
    *(_DWORD *)(v12 + 52) = v19;
    unsigned int v20 = bswap32(v16);
    if (*(_DWORD *)(a4 + 100) == 1) {
      unsigned int v21 = v16;
    }
    else {
      unsigned int v21 = v20;
    }
    *(_DWORD *)(v12 + 56) = v21;
    long long v22 = *(_OWORD *)(v13 - 15);
    long long v23 = *(_OWORD *)(v13 - 7);
    *(_OWORD *)(v12 + 16) = *(_OWORD *)(v13 - 11);
    *(_OWORD *)(v12 + 32) = v23;
    *(_OWORD *)uint64_t v12 = v22;
    unsigned int v24 = *(_DWORD *)(v12 + 8);
    unsigned int v25 = bswap32(*(_DWORD *)(v12 + 4));
    if (*(_DWORD *)(a4 + 100) == 1) {
      unsigned int v26 = *(_DWORD *)(v12 + 4);
    }
    else {
      unsigned int v26 = v25;
    }
    *(_DWORD *)(v12 + 4) = v26;
    unsigned int v27 = bswap32(v24);
    if (*(_DWORD *)(a4 + 100) == 1) {
      unsigned int v28 = v24;
    }
    else {
      unsigned int v28 = v27;
    }
    *(_DWORD *)(v12 + 8) = v28;
    unsigned int v29 = *(_DWORD *)(v12 + 16);
    unsigned int v30 = bswap32(*(_DWORD *)(v12 + 12));
    if (*(_DWORD *)(a4 + 100) == 1) {
      unsigned int v31 = *(_DWORD *)(v12 + 12);
    }
    else {
      unsigned int v31 = v30;
    }
    *(_DWORD *)(v12 + 12) = v31;
    unsigned int v32 = bswap32(v29);
    if (*(_DWORD *)(a4 + 100) == 1) {
      unsigned int v33 = v29;
    }
    else {
      unsigned int v33 = v32;
    }
    *(_DWORD *)(v12 + 16) = v33;
    unsigned int v34 = *(_DWORD *)(v12 + 24);
    unsigned int v35 = bswap32(*(_DWORD *)(v12 + 20));
    if (*(_DWORD *)(a4 + 100) == 1) {
      float v36 = *(float *)(v12 + 20);
    }
    else {
      float v36 = *(float *)&v35;
    }
    *(float *)(v12 + 20) = v36;
    unsigned int v37 = bswap32(v34);
    if (*(_DWORD *)(a4 + 100) == 1) {
      unsigned int v38 = v34;
    }
    else {
      unsigned int v38 = v37;
    }
    *(_DWORD *)(v12 + 24) = v38;
    unsigned int v39 = *(_DWORD *)(v12 + 32);
    unsigned int v40 = bswap32(*(_DWORD *)(v12 + 28));
    if (*(_DWORD *)(a4 + 100) == 1) {
      unsigned int v41 = *(_DWORD *)(v12 + 28);
    }
    else {
      unsigned int v41 = v40;
    }
    *(_DWORD *)(v12 + 28) = v41;
    unsigned int v43 = *(_DWORD *)(v12 + 36);
    unsigned int v42 = *(_DWORD *)(v12 + 40);
    unsigned int v44 = bswap32(v42);
    if (*(_DWORD *)(a4 + 100) != 1) {
      unsigned int v42 = v44;
    }
    *(_DWORD *)(v12 + 40) = v42;
    unsigned int v45 = bswap32(v39);
    if (*(_DWORD *)(a4 + 100) == 1) {
      unsigned int v45 = v39;
    }
    *(_DWORD *)(v12 + 32) = v45;
    unsigned int v46 = bswap32(v43);
    if (*(_DWORD *)(a4 + 100) == 1) {
      unsigned int v47 = v43;
    }
    else {
      unsigned int v47 = v46;
    }
    *(_DWORD *)(v12 + 36) = v47;
    unsigned int v48 = bswap32(*(unsigned __int16 *)(v12 + 44)) >> 16;
    if (*(_DWORD *)(a4 + 100) == 1) {
      __int16 v49 = *(_WORD *)(v12 + 44);
    }
    else {
      __int16 v49 = v48;
    }
    _S0 = *v13;
    __asm { FCVT            H0, S0 }
    __int16 v55 = _S0;
    __int16 v56 = __rev16(_S0);
    if (!_ZF) {
      __int16 v55 = v56;
    }
    *(_WORD *)(v12 + 46) = v55;
    *(unsigned char *)(a3 + 113) = 1;
    *(_WORD *)(v12 + 44) = v49 | 0x1000;
    float v57 = v36;
    if (*(unsigned char *)(v12 + 2) != 7 && *(void *)(a4 + 184))
    {
      if (*(unsigned char *)(a4 + 133)) {
        mt_CachePropertiesForDevice(a4);
      }
      unsigned int v58 = MTLoggingFramework();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v59 = *(void *)(a4 + 64);
        *(_DWORD *)buf = 134217984;
        uint64_t v61 = v59;
        _os_log_impl(&dword_2262CF000, v58, OS_LOG_TYPE_DEFAULT, "Non tstamp-synced contact detected. Clearing device timestamp offset (deviceID 0x%llX)", buf, 0xCu);
      }
      *(void *)(a4 + 184) = 0;
      float v57 = *(float *)(v12 + 20);
    }
    if (v57 == 0.0 || *(float *)(v12 + 24) == 0.0) {
      *(int32x2_t *)(v12 + 20) = v14;
    }
    ++v11;
    v12 += 60;
    v13 += 16;
  }
  while (v11 < *a2);
  return 1;
}

uint64_t MTParse_SABinary::$_2::__invoke(uint64_t *a1, uint64_t a2, unsigned __int8 *a3)
{
  int v5 = *(unsigned __int16 *)(a2 + 18);
  uint64_t v3 = a2 + 18;
  int v4 = v5;
  if (v5 == 12293) {
    return MTParse_SABinary_FireflyPaths(v3, a3, *a1, a1[1]);
  }
  if (v4 == 12288) {
    return MTParse_SABinary_Paths(v3, a3, *a1, (__MTDevice *)a1[1]);
  }
  return 1;
}

uint64_t MTRegisterMultitouchImageCallback(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = 0;
  for (uint64_t i = (void *)(a1 + 1336); *i; ++i)
  {
    if (++v2 == 4) {
      return 0;
    }
  }
  *uint64_t i = a2;
  i[5] = 0;
  uint64_t v4 = 1;
  *(unsigned char *)(a1 + 1368) |= 1 << v2;
  *(void *)((char *)i + 532) = 0x1000000000002;
  return v4;
}

uint64_t MTRegisterImageCallback(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = 0;
  for (uint64_t i = a1 + 1336; *(void *)i; i += 8)
  {
    if (++v4 == 4) {
      return 0;
    }
  }
  *(void *)uint64_t i = a2;
  *(void *)(i + 40) = 0;
  uint64_t v6 = 1;
  *(unsigned char *)(a1 + 1368) |= 1 << v4;
  *(_DWORD *)(i + 532) = a3;
  *(_DWORD *)(i + 536) = a4;
  return v6;
}

uint64_t MTRegisterImageCallbackWithRefcon(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  if (!a1) {
    return 0;
  }
  uint64_t v5 = 0;
  for (uint64_t i = a1 + 1336; *(void *)i; i += 8)
  {
    if (++v5 == 4) {
      return 0;
    }
  }
  *(void *)uint64_t i = a2;
  *(void *)(i + 40) = a5;
  uint64_t v7 = 1;
  *(unsigned char *)(a1 + 1368) |= 1 << v5;
  *(_DWORD *)(i + 532) = a3;
  *(_DWORD *)(i + 536) = a4;
  return v7;
}

uint64_t MTUnregisterImageCallback(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v2 = 0;
    char v3 = 0;
    do
    {
      uint64_t v4 = a1 + 8 * v2;
      if (*(void *)(v4 + 1336) == a2)
      {
        *(void *)(v4 + 1336) = 0;
        char v3 = 1;
        *(unsigned char *)(a1 + 1368) &= ~(1 << v2);
        *(void *)(v4 + 1868) = 0;
      }
      ++v2;
    }
    while (v2 != 4);
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

uint64_t MTAlg_IssueImageCallbacks(uint64_t result, const void *a2, long long *a3)
{
  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v5 = result;
        if (*(unsigned char *)(result + 1368) || (*(unsigned char *)(result + 2004) & 8) != 0)
        {
          uint64_t result = mtalg_FillinValidPixelRange(result, (uint64_t)a3);
          if ((*(unsigned char *)(v5 + 2004) & 8) != 0)
          {
            uint64_t v9 = *(void *)(v5 + 2008);
            uint64_t result = mt_ImageDescriptorMatchesFilter((uint64_t)a3, (int *)&v9);
            if (result)
            {
              uint64_t v6 = MTImageInfoCreate(a3, *(__int16 **)(v5 + 5376 + 8 * *(unsigned int *)(v5 + 5368)));
              *(void *)(v5 + 5376 + 8 * *(unsigned int *)(v5 + 5368)) = v6;
              *(_DWORD *)(v5 + 2240) |= 8u;
              uint64_t result = (uint64_t)memcpy(v6 + 20, a2, 2 * v6[9] * (uint64_t)v6[8]);
              ++*(_DWORD *)(v5 + 5368);
            }
          }
          if (*(unsigned char *)(v5 + 1368))
          {
            for (uint64_t i = 0; i != 32; i += 8)
            {
              int v8 = *(uint64_t (**)(uint64_t, const void *, long long *, void))(v5 + i + 1336);
              if (v8)
              {
                uint64_t result = mt_ImageDescriptorMatchesFilter((uint64_t)a3, (int *)(v5 + i + 1868));
                if (result) {
                  uint64_t result = v8(v5, a2, a3, *(void *)(v5 + i + 1376));
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL mt_ImageDescriptorMatchesFilter(uint64_t a1, int *a2)
{
  int v2 = *a2;
  BOOL v4 = *a2 == 2147483646 || v2 == 254;
  int v5 = *(_DWORD *)(a1 + 20);
  BOOL v6 = v5 == 2147483646 || v2 == 2147483646;
  if (!v6 && v2 != 254) {
    return (v5 & v2) != 0 && (a2[1] & *(_DWORD *)(a1 + 24)) != 0;
  }
  return v5 == 2147483646 && v4;
}

__int16 *MTImageInfoCreate(long long *a1, __int16 *a2)
{
  if (!a1) {
    return 0;
  }
  if (a2 && a2[9] * a2[8] >= *((__int16 *)a1 + 9) * *((__int16 *)a1 + 8)
    || (free(a2),
        (a2 = (__int16 *)malloc_type_malloc(2 * *((__int16 *)a1 + 8) * (uint64_t)*((__int16 *)a1 + 9) + 40, 0x95035B00uLL)) != 0))
  {
    long long v3 = *a1;
    long long v4 = a1[1];
    *((void *)a2 + 4) = *((void *)a1 + 4);
    *(_OWORD *)a2 = v3;
    *((_OWORD *)a2 + 1) = v4;
  }
  return a2;
}

double MTEasyInstallPrintCallbacks(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7)
{
  if (a4)
  {
    if (!a1) {
      goto LABEL_33;
    }
    uint64_t v7 = 0;
    int v8 = (uint64_t (**)(uint64_t, uint64_t, uint64_t *))(a1 + 1336);
    while (*v8)
    {
      ++v7;
      ++v8;
      if (v7 == 4) {
        goto LABEL_6;
      }
    }
    *int v8 = MTImagePrintCallback;
    v8[5] = 0;
    *(unsigned char *)(a1 + 1368) |= 1 << v7;
    *(void *)&double result = 0x1000000002;
    *(uint64_t (**)(uint64_t, uint64_t, uint64_t *))((char *)v8 + 532) = (uint64_t (*)(uint64_t, uint64_t, uint64_t *))0x1000000002;
  }
  else
  {
LABEL_6:
    if (!a1) {
      goto LABEL_13;
    }
  }
  if (a3)
  {
    uint64_t v9 = 0;
    unsigned int v10 = (uint64_t (**)(uint64_t, uint64_t, uint64_t *))(a1 + 1336);
    while (*v10)
    {
      ++v9;
      ++v10;
      if (v9 == 4) {
        goto LABEL_13;
      }
    }
    unsigned __int8 *v10 = MTImagePrintCallback;
    v10[5] = 0;
    *(unsigned char *)(a1 + 1368) |= 1 << v9;
    *(void *)&double result = 0x27FFFFFFELL;
    *(uint64_t (**)(uint64_t, uint64_t, uint64_t *))((char *)v10 + 532) = (uint64_t (*)(uint64_t, uint64_t, uint64_t *))0x27FFFFFFELL;
  }
LABEL_13:
  if (a5)
  {
    if (!a1) {
      goto LABEL_33;
    }
    uint64_t v12 = 0;
    uint64_t v13 = (uint64_t (**)(uint64_t, uint64_t, uint64_t *))(a1 + 1336);
    while (*v13)
    {
      ++v12;
      ++v13;
      if (v12 == 4) {
        goto LABEL_21;
      }
    }
    *uint64_t v13 = MTImagePrintCallback;
    void v13[5] = 0;
    *(unsigned char *)(a1 + 1368) |= 1 << v12;
    *(void *)&double result = 0x1000000000002;
    *(uint64_t (**)(uint64_t, uint64_t, uint64_t *))((char *)v13 + 532) = (uint64_t (*)(uint64_t, uint64_t, uint64_t *))0x1000000000002;
  }
LABEL_21:
  if (a1 && a6)
  {
    uint64_t v14 = 0;
    uint64_t v15 = (uint64_t (**)(uint64_t, uint64_t, uint64_t *))(a1 + 1336);
    while (*v15)
    {
      ++v14;
      ++v15;
      if (v14 == 4) {
        goto LABEL_26;
      }
    }
    *uint64_t v15 = MTImagePrintCallback;
    v15[5] = 0;
    *(unsigned char *)(a1 + 1368) |= 1 << v14;
    double result = 2.22507386e-308;
    *(uint64_t (**)(uint64_t, uint64_t, uint64_t *))((char *)v15 + 532) = (uint64_t (*)(uint64_t, uint64_t, uint64_t *))0x10000000000002;
  }
  else
  {
LABEL_26:
    if (!a1) {
      goto LABEL_33;
    }
  }
  if (!a7)
  {
LABEL_33:
    if (!a2) {
      return result;
    }
    goto LABEL_34;
  }
  uint64_t v16 = 0;
  unsigned int v17 = (uint64_t (**)(uint64_t, uint64_t, uint64_t *))(a1 + 1336);
  while (*v17)
  {
    ++v16;
    ++v17;
    if (v16 == 4) {
      goto LABEL_33;
    }
  }
  *unsigned int v17 = MTImagePrintCallback;
  v17[5] = 0;
  *(unsigned char *)(a1 + 1368) |= 1 << v16;
  double result = 2.84809454e-306;
  *(uint64_t (**)(uint64_t, uint64_t, uint64_t *))((char *)v17 + 532) = (uint64_t (*)(uint64_t, uint64_t, uint64_t *))0x80000000000002;
  if (a2) {
LABEL_34:
  }
    MTRegisterPathCallback(a1, (uint64_t)MTPathPrintCallback);
  return result;
}

uint64_t MTImagePrintCallback(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = *a3;
  int v5 = MTGetImageRegionName(*((_DWORD *)a3 + 5));
  BOOL v6 = MTGetImageProcessingStepName(*((_DWORD *)a3 + 6));
  uint64_t result = printf("\nImage #%lu '%s %s': %d X %d  Timestamp: %.3f s\n", v4, v5, v6, *((__int16 *)a3 + 8), *((__int16 *)a3 + 9), *((double *)a3 + 1));
  if (*((__int16 *)a3 + 9) >= 1)
  {
    int v8 = 0;
    do
    {
      if (*((__int16 *)a3 + 8) >= 1)
      {
        uint64_t v9 = 0;
        do
        {
          if ((*((_DWORD *)a3 + 6) - 16) > 0x30) {
            printf("%3d ");
          }
          else {
            printf("%4x ");
          }
          ++v9;
        }
        while ((int)v9 < *((__int16 *)a3 + 8));
      }
      uint64_t result = putchar(10);
      ++v8;
    }
    while (v8 < *((__int16 *)a3 + 9));
  }
  return result;
}

const char *MTGetImageRegionName(int a1)
{
  uint64_t result = "AllRegions";
  if (a1 <= 511)
  {
    if (a1 <= 7)
    {
      if (a1 == 2) {
        return "Multitouch";
      }
      if (a1 == 4) {
        return "Force";
      }
      return "Unknown";
    }
    if (a1 == 8) {
      return "Optical";
    }
    if (a1 != 254)
    {
      if (a1 == 256) {
        return "CommonMode";
      }
      return "Unknown";
    }
  }
  else
  {
    if (a1 < 0x10000)
    {
      switch(a1)
      {
        case 0x200:
          return "NoiseSPA";
        case 0x1000:
          return "StylusX";
        case 0x2000:
          return "StylusY";
      }
      return "Unknown";
    }
    if (a1 == 0x10000) {
      return "OrbCore";
    }
    if (a1 == 0x40000) {
      return "OrbCrashpad";
    }
    if (a1 != 2147483646) {
      return "Unknown";
    }
  }
  return result;
}

const char *MTGetImageProcessingStepName(int a1)
{
  if (a1 > 4095)
  {
    if (a1 >= 0x100000)
    {
      if (a1 == 0x100000) {
        return "Smoothed";
      }
      if (a1 == 0x800000) {
        return "Patches";
      }
    }
    else
    {
      if (a1 == 4096) {
        return "NoiseAdded";
      }
      if (a1 == 0x10000) {
        return "Clipped";
      }
    }
  }
  else if (a1 > 255)
  {
    if (a1 == 256) {
      return "Baselined";
    }
    if (a1 == 1024) {
      return "Scaled8bit";
    }
  }
  else
  {
    if (a1 == 16) {
      return "IsBaseline";
    }
    if (a1 == 64) {
      return "Unbaselined";
    }
  }
  return "? Step";
}

uint64_t MTPrintImageRegionDescriptors(uint64_t a1)
{
  unsigned int v10 = 0;
  uint64_t v9 = 0;
  uint64_t result = MTAlg_DeviceGetSensorRegionArray(a1, &v9, &v10);
  if (!result)
  {
    printf("Raw Image Buffer %d X %d has sensor regions:\n", *(_DWORD *)(a1 + 84), *(_DWORD *)(a1 + 88));
    unint64_t v3 = v10;
    if (v10)
    {
      uint64_t v4 = 0;
      unint64_t v5 = 0;
      do
      {
        uint64_t v6 = v9;
        int v7 = *(unsigned __int8 *)(v9 + v4);
        if (*(unsigned char *)(v9 + v4))
        {
          int v8 = MTGetImageRegionName(1 << v7);
          printf("\tType %d (%s): start_row=%d rows=%d row_skip=%d : start_col=%d cols=%d hardware_coloffset=%d\n", v7, v8, *(unsigned __int8 *)(v6 + v4 + 1), *(unsigned __int8 *)(v6 + v4 + 2), *(unsigned __int8 *)(v6 + v4 + 3), *(unsigned __int8 *)(v6 + v4 + 4), *(unsigned __int8 *)(v6 + v4 + 5), *(unsigned __int8 *)(v6 + v4 + 6));
          unint64_t v3 = v10;
        }
        ++v5;
        v4 += 7;
      }
      while (v5 < v3);
    }
    return putchar(10);
  }
  return result;
}

uint64_t MTRegisterForceCentroidCallback(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = 0;
  while (1)
  {
    uint64_t v3 = a1 + 8 * v2;
    if (!*(void *)(v3 + 1480)) {
      break;
    }
    if (++v2 == 4) {
      return 0;
    }
  }
  *(void *)(v3 + 1480) = a2;
  *(void *)(v3 + 1520) = 0;
  uint64_t v4 = 1;
  *(unsigned char *)(a1 + 1512) |= 1 << v2;
  return v4;
}

uint64_t MTRegisterForceCentroidCallbackWithRefcon(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = 0;
  while (1)
  {
    uint64_t v4 = a1 + 8 * v3;
    if (!*(void *)(v4 + 1480)) {
      break;
    }
    if (++v3 == 4) {
      return 0;
    }
  }
  *(void *)(v4 + 1480) = a2;
  *(void *)(v4 + 1520) = a3;
  uint64_t v5 = 1;
  *(unsigned char *)(a1 + 1512) |= 1 << v3;
  return v5;
}

uint64_t MTUnregisterForceCentroidCallback(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = 0;
  uint64_t v3 = a1 + 1480;
  while (*(void *)(v3 + 8 * v2) != a2)
  {
    if (++v2 == 4) {
      return 0;
    }
  }
  *(void *)(v3 + 8 * v2) = 0;
  uint64_t v4 = 1;
  *(unsigned char *)(a1 + 1512) &= ~(1 << v2);
  return v4;
}

BOOL MTAlg_AlwaysNeedsVelocityCalculated(BOOL result)
{
  if (result) {
    return *(unsigned char *)(result + 130) != 0;
  }
  return result;
}

float MTSurface_mmToPixels(uint64_t a1, float a2, double a3, float a4, double a5, float a6)
{
  mtalg_getSurfaceBounds_mm(a1);
  return a4 + (float)((float)(a2 - v9) * (float)(a6 / v10));
}

void mt_PostForceCentroidCallbacks(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (*(unsigned char *)(a2 + 13))
    {
      v6[0] = xmmword_2262EEF48;
      v6[1] = unk_2262EEF58;
      unint64_t v7 = 0xAAAAAAAAFFFFFFFFLL;
      *(void *)&v6[0] = *(unsigned int *)(a1 + 168);
      *((double *)v6 + 1) = (double)*(unint64_t *)a2;
      v3.n128_f32[0] = mtalg_ConvertBinaryForceCentroidToMTFC(a1, *(unsigned int *)(a2 + 56) | ((unint64_t)*(unsigned __int16 *)(a2 + 60) << 32), (float *)v6);
      if (*(unsigned char *)(a1 + 1512))
      {
        for (uint64_t i = 0; i != 32; i += 8)
        {
          uint64_t v5 = *(void (**)(uint64_t, _OWORD *, void, __n128))(a1 + i + 1480);
          if (v5) {
            v5(a1, v6, *(void *)(a1 + i + 1520), v3);
          }
        }
      }
    }
  }
}

float MTContact_getCentroidPixel(uint64_t a1, float a2, double a3, float a4)
{
  return a2 + (float)(*(float *)(a1 + 32) * a4);
}

float MTContact_getEllipseEccentricity(uint64_t a1)
{
  float result = 1.0;
  if (a1)
  {
    float v2 = *(float *)(a1 + 60);
    float v3 = *(float *)(a1 + 64);
    if (v3 <= 6.0)
    {
      if (v2 > 6.0) {
        return v2 / 6.0;
      }
    }
    else
    {
      return v2 / v3;
    }
  }
  return result;
}

double MTContact_getEllipseOrientationDegrees(uint64_t a1)
{
  if (!a1) {
    return 0.0;
  }
  double result = *(float *)(a1 + 56) * 180.0 / 3.14159265;
  *(float *)&double result = result;
  return result;
}

double MTContact_getEllipseMeanRadius(uint64_t a1)
{
  if (!a1) {
    return 0.0;
  }
  *(float *)&double result = sqrtf(*(float *)(a1 + 60) * *(float *)(a1 + 64));
  return result;
}

double MTContact_getEllipseMajorAxisRadius(uint64_t a1)
{
  if (!a1) {
    return 0.0;
  }
  LODWORD(result) = *(_DWORD *)(a1 + 60);
  return result;
}

double MTContact_getEllipseMajorAxisVector(uint64_t a1)
{
  if (!a1) {
    return 0.0;
  }
  double v1 = *(float *)(a1 + 60);
  double result = __sincos_stret(*(float *)(a1 + 56)).__cosval * v1;
  *(float *)&double result = result;
  return result;
}

double MTContact_getEllipseMinorAxisRadius(uint64_t a1)
{
  if (!a1) {
    return 0.0;
  }
  LODWORD(result) = *(_DWORD *)(a1 + 64);
  return result;
}

double MTContact_getEllipseMinorAxisVector(uint64_t a1)
{
  if (!a1) {
    return 0.0;
  }
  double v1 = *(float *)(a1 + 60);
  double result = __sincos_stret(*(float *)(a1 + 56) + 1.57079633).__cosval * v1;
  *(float *)&double result = result;
  return result;
}

uint64_t MTRegisterContactFrameCallback(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = 0;
  while (1)
  {
    uint64_t v3 = a1 + 8 * v2;
    if (!*(void *)(v3 + 400)) {
      break;
    }
    if (++v2 == 4) {
      return 0;
    }
  }
  *(void *)(v3 + 400) = a2;
  *(void *)(v3 + 440) = 0;
  uint64_t v4 = 1;
  *(unsigned char *)(a1 + 432) |= 1 << v2;
  return v4;
}

uint64_t MTRegisterContactFrameCallbackWithRefcon(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = 0;
  while (1)
  {
    uint64_t v4 = a1 + 8 * v3;
    if (!*(void *)(v4 + 400)) {
      break;
    }
    if (++v3 == 4) {
      return 0;
    }
  }
  *(void *)(v4 + 400) = a2;
  *(void *)(v4 + 440) = a3;
  uint64_t v5 = 1;
  *(unsigned char *)(a1 + 432) |= 1 << v3;
  return v5;
}

uint64_t MTUnregisterContactFrameCallback(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = 0;
  uint64_t v3 = a1 + 400;
  while (*(void *)(v3 + 8 * v2) != a2)
  {
    if (++v2 == 4) {
      return 0;
    }
  }
  *(void *)(v3 + 8 * v2) = 0;
  uint64_t v4 = 1;
  *(unsigned char *)(a1 + 432) &= ~(1 << v2);
  return v4;
}

uint64_t MTAlg_IssueContactFrameCallbacks(uint64_t result, uint64_t a2, double a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (result)
  {
    uint64_t v3 = result;
    if (*(unsigned char *)(result + 432))
    {
      memcpy(__dst, &unk_2262EEF70, sizeof(__dst));
      double result = MTGetPathFrame(v3, (uint64_t)__dst);
      uint64_t v6 = result;
      if ((int)result > 0 || *(int *)(v3 + 1840) >= 1)
      {
        for (uint64_t i = 0; i != 32; i += 8)
        {
          int v8 = *(uint64_t (**)(uint64_t, unsigned char *, uint64_t, uint64_t, void, double))(v3 + i + 400);
          if (v8) {
            double result = v8(v3, __dst, v6, a2, *(void *)(v3 + i + 440), a3);
          }
        }
      }
      *(_DWORD *)(v3 + 1840) = v6;
    }
  }
  return result;
}

uint64_t MTGetPathFrame(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    uint64_t v2 = 0;
    for (unsigned int i = 0; i != 32; ++i)
    {
      uint64_t PathLifeCycle = mtalg_getPathLifeCycle(a1, i);
      if (PathLifeCycle
        && (*(float *)(PathLifeCycle + 56) > 0.0 || (*(_DWORD *)(PathLifeCycle + 28) - 1) <= 6))
      {
        unint64_t v7 = (_OWORD *)(a2 + 96 * (int)v2);
        uint64_t v2 = (v2 + 1);
        long long v8 = *(_OWORD *)(PathLifeCycle + 24);
        *unint64_t v7 = *(_OWORD *)(PathLifeCycle + 8);
        v7[1] = v8;
        long long v9 = *(_OWORD *)(PathLifeCycle + 40);
        long long v10 = *(_OWORD *)(PathLifeCycle + 56);
        long long v11 = *(_OWORD *)(PathLifeCycle + 88);
        v7[4] = *(_OWORD *)(PathLifeCycle + 72);
        v7[5] = v11;
        _OWORD v7[2] = v9;
        v7[3] = v10;
      }
    }
  }
  return v2;
}

BOOL MTContact_isActive(uint64_t a1)
{
  return *(float *)(a1 + 48) > 0.0 || (*(_DWORD *)(a1 + 20) - 1) < 6;
}

uint64_t MTRegisterPathCallback(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = 0;
  uint64_t v3 = a1 + 472;
  while (*(void *)(v3 + 8 * v2))
  {
    if (++v2 == 4) {
      return 0;
    }
  }
  *(void *)(v3 + 8 * v2) = a2;
  uint64_t v4 = 1;
  *(unsigned char *)(a1 + 504) |= 1 << v2;
  return v4;
}

uint64_t MTRegisterPathCallbackWithRefcon(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = 0;
  while (1)
  {
    uint64_t v4 = a1 + 8 * v3;
    if (!*(void *)(v4 + 1624)) {
      break;
    }
    if (++v3 == 4) {
      return 0;
    }
  }
  *(void *)(v4 + 1624) = a2;
  *(void *)(v4 + 1664) = a3;
  uint64_t v5 = 1;
  *(unsigned char *)(a1 + 1656) |= 1 << v3;
  return v5;
}

uint64_t MTUnregisterPathCallback(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = 0;
  uint64_t v3 = a1 + 472;
  while (*(void *)(v3 + 8 * v2) != a2)
  {
    if (++v2 == 4) {
      return 0;
    }
  }
  *(void *)(v3 + 8 * v2) = 0;
  uint64_t v4 = 1;
  *(unsigned char *)(a1 + 504) &= ~(1 << v2);
  return v4;
}

uint64_t MTUnregisterPathCallbackWithRefcon(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = 0;
  uint64_t v3 = a1 + 1624;
  while (*(void *)(v3 + 8 * v2) != a2)
  {
    if (++v2 == 4) {
      return 0;
    }
  }
  *(void *)(v3 + 8 * v2) = 0;
  uint64_t v4 = 1;
  *(unsigned char *)(a1 + 1656) &= ~(1 << v2);
  return v4;
}

void MTPathPrintCallback(uint64_t a1, int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v4 = *(_DWORD *)(a4 + 24);
  if (v4 > 0xE) {
    return;
  }
  if (a3 <= 7) {
    uint64_t v6 = mt_PathStageNames[a3];
  }
  else {
    uint64_t v6 = "INVALID      ";
  }
  float v7 = *(float *)(a4 + 60);
  float v8 = *(float *)(a4 + 64);
  double v9 = v7;
  double v10 = v8;
  if (v8 <= 6.0)
  {
    float v11 = 1.0;
    if (v7 <= 6.0) {
      goto LABEL_9;
    }
    float v8 = 6.0;
  }
  float v11 = v7 / v8;
LABEL_9:
  double v12 = v11;
  float v13 = *(float *)(a4 + 56) * 180.0 / 3.14159265;
  printf("F%3ld @%.3f P%d %s H%d F%d(%5.9fX, %5.9fY)mm(%5.9fX, %5.9fY) %3.2fZTot %3.2fZDen %3.0fg %5.2fMR/%5.2fmR=%4.2f %4.1fdeg %4.1fdeg flags:0x%04X(%5.2fvx, %5.2fvy)-> %5.2fmm/s\n", *(void *)a4, *(double *)(a4 + 8), a2, v6, *(_DWORD *)(a4 + 28), v4, *(float *)(a4 + 68), *(float *)(a4 + 72), *(float *)(a4 + 32), *(float *)(a4 + 36), *(float *)(a4 + 48), *(float *)(a4 + 92), *(float *)(a4 + 52), v9, v10, v12, v13,
    *(float *)(a4 + 88) * 180.0 / 3.14159265,
    *(unsigned __int16 *)(a4 + 84),
    *(float *)(a4 + 76),
    *(float *)(a4 + 80),
    sqrt((float)((float)(*(float *)(a4 + 80) * *(float *)(a4 + 80)) + (float)(*(float *)(a4 + 76) * *(float *)(a4 + 76)))));
  if (!a3)
  {
    putchar(10);
  }
}

const char *MTGetPathStageName(unsigned int a1)
{
  if (a1 <= 7) {
    return mt_PathStageNames[a1];
  }
  else {
    return "INVALID      ";
  }
}

uint64_t MTAlg_IssuePathCallbacks(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4)
{
  if (!*(unsigned char *)(a1 + 504) && !*(unsigned char *)(a1 + 1656) && (*(unsigned char *)(a1 + 2004) & 4) == 0) {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 2004) & 4) != 0)
  {
    *(_DWORD *)(a1 + 2240) |= 4u;
    unsigned int v9 = *(_DWORD *)(a1 + 2288);
    *(_DWORD *)(a1 + 2288) = v9 + 1;
    uint64_t v10 = a1 + 2240 + 96 * v9;
    long long v11 = *a4;
    *(_OWORD *)(v10 + 72) = a4[1];
    *(_OWORD *)(v10 + 56) = v11;
    long long v12 = a4[2];
    long long v13 = a4[3];
    long long v14 = a4[4];
    *(_OWORD *)(v10 + 136) = a4[5];
    *(_OWORD *)(v10 + 120) = v14;
    *(_OWORD *)(v10 + 104) = v13;
    *(_OWORD *)(v10 + 88) = v12;
  }
  uint64_t v15 = 0;
  char v16 = 0;
  do
  {
    unsigned int v17 = *(void (**)(uint64_t, uint64_t, uint64_t, long long *))(a1 + v15 + 472);
    if (v17)
    {
      v17(a1, a2, a3, a4);
      char v16 = 1;
    }
    unsigned int v18 = *(void (**)(uint64_t, uint64_t, uint64_t, long long *, void))(a1 + v15 + 1624);
    if (v18)
    {
      v18(a1, a2, a3, a4, *(void *)(a1 + v15 + 1664));
      char v16 = 1;
    }
    v15 += 8;
  }
  while (v15 != 32);
  return v16 & 1;
}

__n128 MTPath_getTouchdownContact@<Q0>(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t PathLifeCycle = mtalg_getPathLifeCycle(a1, a2);
  long long v5 = *(_OWORD *)(PathLifeCycle + 152);
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(PathLifeCycle + 136);
  *(_OWORD *)(a3 + 48) = v5;
  long long v6 = *(_OWORD *)(PathLifeCycle + 184);
  *(_OWORD *)(a3 + 64) = *(_OWORD *)(PathLifeCycle + 168);
  *(_OWORD *)(a3 + 80) = v6;
  __n128 result = *(__n128 *)(PathLifeCycle + 104);
  long long v8 = *(_OWORD *)(PathLifeCycle + 120);
  *(__n128 *)a3 = result;
  *(_OWORD *)(a3 + 16) = v8;
  return result;
}

__n128 MTPath_getMakeContact@<Q0>(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t PathLifeCycle = mtalg_getPathLifeCycle(a1, a2);
  long long v5 = *(_OWORD *)(PathLifeCycle + 248);
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(PathLifeCycle + 232);
  *(_OWORD *)(a3 + 48) = v5;
  long long v6 = *(_OWORD *)(PathLifeCycle + 216);
  *(_OWORD *)a3 = *(_OWORD *)(PathLifeCycle + 200);
  *(_OWORD *)(a3 + 16) = v6;
  __n128 result = *(__n128 *)(PathLifeCycle + 264);
  long long v8 = *(_OWORD *)(PathLifeCycle + 280);
  *(__n128 *)(a3 + 64) = result;
  *(_OWORD *)(a3 + 80) = v8;
  return result;
}

__n128 MTPath_getProximityPeakContact@<Q0>(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t PathLifeCycle = mtalg_getPathLifeCycle(a1, a2);
  long long v5 = *(_OWORD *)(PathLifeCycle + 344);
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(PathLifeCycle + 328);
  *(_OWORD *)(a3 + 48) = v5;
  long long v6 = *(_OWORD *)(PathLifeCycle + 376);
  *(_OWORD *)(a3 + 64) = *(_OWORD *)(PathLifeCycle + 360);
  *(_OWORD *)(a3 + 80) = v6;
  __n128 result = *(__n128 *)(PathLifeCycle + 296);
  long long v8 = *(_OWORD *)(PathLifeCycle + 312);
  *(__n128 *)a3 = result;
  *(_OWORD *)(a3 + 16) = v8;
  return result;
}

__n128 MTPath_getBreakContact@<Q0>(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t PathLifeCycle = mtalg_getPathLifeCycle(a1, a2);
  long long v5 = *(_OWORD *)(PathLifeCycle + 440);
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(PathLifeCycle + 424);
  *(_OWORD *)(a3 + 48) = v5;
  long long v6 = *(_OWORD *)(PathLifeCycle + 472);
  *(_OWORD *)(a3 + 64) = *(_OWORD *)(PathLifeCycle + 456);
  *(_OWORD *)(a3 + 80) = v6;
  __n128 result = *(__n128 *)(PathLifeCycle + 392);
  long long v8 = *(_OWORD *)(PathLifeCycle + 408);
  *(__n128 *)a3 = result;
  *(_OWORD *)(a3 + 16) = v8;
  return result;
}

__n128 MTPath_getLiftoffContact@<Q0>(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t PathLifeCycle = mtalg_getPathLifeCycle(a1, a2);
  long long v5 = *(_OWORD *)(PathLifeCycle + 536);
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(PathLifeCycle + 520);
  *(_OWORD *)(a3 + 48) = v5;
  long long v6 = *(_OWORD *)(PathLifeCycle + 568);
  *(_OWORD *)(a3 + 64) = *(_OWORD *)(PathLifeCycle + 552);
  *(_OWORD *)(a3 + 80) = v6;
  __n128 result = *(__n128 *)(PathLifeCycle + 488);
  long long v8 = *(_OWORD *)(PathLifeCycle + 504);
  *(__n128 *)a3 = result;
  *(_OWORD *)(a3 + 16) = v8;
  return result;
}

double MTPath_getPositionBounds_mm(uint64_t a1, unsigned int a2)
{
  uint64_t PathLifeCycle = mtalg_getPathLifeCycle(a1, a2);
  if (!PathLifeCycle) {
    return 0.0;
  }
  LODWORD(result) = *(_DWORD *)(PathLifeCycle + 584);
  return result;
}

double MTPath_getMaxSpeed_mm_s(uint64_t a1, unsigned int a2)
{
  uint64_t PathLifeCycle = mtalg_getPathLifeCycle(a1, a2);
  if (!PathLifeCycle) {
    return 0.0;
  }
  LODWORD(result) = *(_DWORD *)(PathLifeCycle + 600);
  return result;
}

double MTPath_getMaxPressure(uint64_t a1, unsigned int a2)
{
  uint64_t PathLifeCycle = mtalg_getPathLifeCycle(a1, a2);
  if (!PathLifeCycle) {
    return 0.0;
  }
  LODWORD(result) = *(_DWORD *)(PathLifeCycle + 604);
  return result;
}

double MTPath_getMaxProximity(uint64_t a1, unsigned int a2)
{
  uint64_t PathLifeCycle = mtalg_getPathLifeCycle(a1, a2);
  if (!PathLifeCycle) {
    return 0.0;
  }
  LODWORD(result) = *(_DWORD *)(PathLifeCycle + 608);
  return result;
}

double MTPath_getMaxEccentricity(uint64_t a1, unsigned int a2)
{
  uint64_t PathLifeCycle = mtalg_getPathLifeCycle(a1, a2);
  if (!PathLifeCycle) {
    return 0.0;
  }
  LODWORD(result) = *(_DWORD *)(PathLifeCycle + 612);
  return result;
}

uint64_t MTZephyrCaptureBaseline(uint64_t a1)
{
  return MTDeviceSetZephyrParameter(a1, 160, 1);
}

uint64_t MTZephyrDeriveImagingParams(uint64_t a1, char a2)
{
  return MTDeviceSetZephyrParameter(a1, 176, a2);
}

uint64_t MTZephyrSetInputDetectionControl(uint64_t a1, int8x8_t *a2, int32x2_t a3, int32x2_t a4)
{
  v5[1] = *MEMORY[0x263EF8340];
  a3.i32[0] = 1;
  a4.i32[0] = *(_DWORD *)(a1 + 100);
  v5[0] = vbsl_s8((int8x8_t)vdup_lane_s32(vceq_s32(a4, a3), 0), *a2, vrev16_s8(*a2));
  return MTDeviceSetReport(a1, 191, (uint64_t)v5, 8);
}

int32x2_t MTZephyrGetInputDetectionControl(uint64_t a1, int8x8_t *a2)
{
  v7[1] = *(int8x8_t *)MEMORY[0x263EF8340];
  v7[0] = (int8x8_t)0xAAAAAAAAAAAAAAAALL;
  int v6 = -1431655766;
  if (!MTDeviceGetReport(a1, 191, v7, 8u, &v6) && v6 == 8)
  {
    result.i32[0] = 1;
    v5.i32[0] = *(_DWORD *)(a1 + 100);
    int32x2_t result = (int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vceq_s32(v5, result), 0), v7[0], vrev16_s8(v7[0]));
    *a2 = (int8x8_t)result;
  }
  return result;
}

uint64_t MTZephyrSetNoiseThresholdAndRange(uint64_t a1, int a2, unsigned int a3, unsigned int a4, __int16 a5)
{
  int v5 = *(_DWORD *)(a1 + 100);
  unsigned int v6 = bswap32(a3) >> 16;
  BOOL v7 = v5 == 1;
  if (v5 == 1) {
    __int16 v8 = a3;
  }
  else {
    __int16 v8 = v6;
  }
  v12[0] = v8;
  unsigned int v9 = bswap32(a4) >> 16;
  if (v7) {
    LOWORD(v9) = a4;
  }
  v12[1] = v9;
  __int16 v10 = __rev16(a5);
  if (v7) {
    __int16 v10 = a5;
  }
  v12[2] = v10;
  return MTDeviceSetReport(a1, a2, (uint64_t)v12, 6);
}

uint64_t MTZephyrSetAdditiveCompensationParams(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int32x4_t v2 = *(int32x4_t *)(a2 + 16);
  int8x16_t v6 = *(int8x16_t *)a2;
  int32x4_t v3 = (int32x4_t)v6;
  int8x16_t v7 = (int8x16_t)v2;
  v2.i32[0] = 1;
  v3.i32[0] = *(_DWORD *)(a1 + 100);
  int8x16_t v4 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_s32(v3, v2), 0);
  int8x16_t v6 = vbslq_s8(v4, v6, vrev16q_s8(v6));
  int8x16_t v7 = vbslq_s8(v4, v7, vrev16q_s8(v7));
  return MTDeviceSetReport(a1, 178, (uint64_t)&v6, 32);
}

uint64_t MTZephyrRequestBaselinedRLE8(uint64_t a1)
{
  MTDeviceSetZephyrParameter(a1, 163, 1);
  MTDeviceSetZephyrParameter(a1, 164, 0);
  return MTDeviceSetZephyrParameter(a1, 165, 1);
}

uint64_t MTZephyrRequestBaselined16(uint64_t a1, char a2)
{
  MTDeviceSetZephyrParameter(a1, 163, a2);
  MTDeviceSetZephyrParameter(a1, 164, 1);
  return MTDeviceSetZephyrParameter(a1, 165, 1);
}

uint64_t MTZephyrRequestUnBaselinedRaw16(uint64_t a1)
{
  MTDeviceSetZephyrParameter(a1, 163, 0);
  MTDeviceSetZephyrParameter(a1, 164, 1);
  return MTDeviceSetZephyrParameter(a1, 165, 0);
}

uint64_t MTZephyrRequestRaw16ForCalibration(uint64_t a1)
{
  return MTDeviceSetZephyrParameter(a1, 65, 130);
}

uint64_t MTZephyrSetCalibrationCookie(uint64_t a1, char a2)
{
  return MTDeviceSetZephyrParameter(a1, 64, a2);
}

uint64_t MTZephyrSetRFBuniversal(uint64_t a1, char a2)
{
  return MTDeviceSetZephyrParameter(a1, 71, a2);
}

uint64_t MTZephyrGetRFBuniversal(uint64_t a1, void *a2)
{
  int v3 = 0;
  return MTDeviceGetReport(a1, 71, a2, 1u, &v3);
}

uint64_t MTZephyrSetRowCalibTable(uint64_t a1, int a2, const char *a3, unsigned __int8 *a4, int a5, int a6)
{
  uint64_t v9 = 0;
  uint64_t v27 = *MEMORY[0x263EF8340];
  unint64_t v26 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v25[5] = v10;
  v25[6] = v10;
  uint64_t v23 = a6;
  v25[3] = v10;
  v25[4] = v10;
  v25[1] = v10;
  v25[2] = v10;
  v25[0] = v10;
  uint64_t v22 = a6;
  long long v11 = v25;
  long long v12 = a4;
  do
  {
    if (a3) {
      printf("\nStoring freq%d %s: ", v9, a3);
    }
    if (a6 >= 1)
    {
      uint64_t v13 = v22;
      long long v14 = v12;
      uint64_t v15 = v11;
      do
      {
        int v16 = a5;
        if (a4) {
          int v16 = *v14;
        }
        *uint64_t v15 = v16;
        if (a3) {
          printf("%2u ", v16);
        }
        ++v15;
        ++v14;
        --v13;
      }
      while (v13);
    }
    ++v9;
    long long v11 = (_OWORD *)((char *)v11 + v23);
    v12 += 40;
  }
  while (v9 != 3);
  if (a3) {
    printf("\n ");
  }
  uint64_t v17 = MTDeviceSetReport(a1, a2, (uint64_t)v25, 3 * a6);
  uint64_t v18 = v17;
  if (v17) {
    printf("(error 0x%x setting report)\n", v17);
  }
  return v18;
}

uint64_t MTZephyrGetRowCalibTable(uint64_t a1, int a2, const char *a3, unsigned char *a4, int a5)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a3) {
    printf("Querying %s table\n", a3);
  }
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20[5] = v10;
  v20[6] = v10;
  void v20[3] = v10;
  v20[4] = v10;
  v20[1] = v10;
  v20[2] = v10;
  v20[0] = v10;
  unsigned int Report = MTDeviceGetReport(a1, a2, v20, 3 * a5, 0);
  if (a5 <= 40 && a4 && !Report)
  {
    uint64_t v11 = 0;
    long long v12 = (unsigned __int8 *)v20;
    do
    {
      if (a3) {
        printf("\nFound freq%d %s: ", v11, a3);
      }
      if (a5 >= 1)
      {
        uint64_t v13 = a5;
        long long v14 = a4;
        uint64_t v15 = v12;
        do
        {
          int v17 = *v15++;
          int v16 = v17;
          *long long v14 = v17;
          if (a3) {
            printf("%2u ", v16);
          }
          ++v14;
          --v13;
        }
        while (v13);
      }
      ++v11;
      v12 += a5;
      a4 += 40;
    }
    while (v11 != 3);
  }
  return Report;
}

uint64_t MTZephyrSetColCalibTable(uint64_t a1, int a2, uint64_t a3)
{
  return MTDeviceSetReport(a1, a2, a3, 54);
}

uint64_t MTZephyrGetColCalibTable(uint64_t a1, int a2, void *a3)
{
  int v4 = 64;
  return MTDeviceGetReport(a1, a2, a3, 0x40u, &v4);
}

uint64_t MTZephyrSetPhantomACDMIDCalib(uint64_t a1, uint64_t a2)
{
  return MTDeviceSetReport(a1, 203, a2, 4);
}

uint64_t MTZephyrGetPhantomACDMIDCalib(uint64_t a1, void *a2)
{
  int v3 = 0;
  return MTDeviceGetReport(a1, 203, a2, 4u, &v3);
}

uint64_t MTZephyrGetPhantomACDMIDColumnSamples(uint64_t a1, int a2, _WORD *a3, int a4)
{
  int v5 = a3;
  int v12 = 0;
  MTDeviceGetReport(a1, a2, a3, 2 * a4, &v12);
  if (a4 >= 1)
  {
    int v7 = *(_DWORD *)(a1 + 100);
    uint64_t v8 = a4;
    do
    {
      unsigned int v9 = (unsigned __int16)*v5;
      unsigned int v10 = bswap32(v9) >> 16;
      if (v7 != 1) {
        LOWORD(v9) = v10;
      }
      *v5++ = v9;
      --v8;
    }
    while (v8);
  }
  return 0;
}

uint64_t MTZephyrGetPhantomACDMIDCookie(uint64_t a1, void *a2)
{
  int v3 = 0;
  return MTDeviceGetReport(a1, 204, a2, 1u, &v3);
}

uint64_t MTZephyrSetDemodTable(uint64_t a1, uint64_t a2, signed int a3)
{
  if (a3 > 512)
  {
    printf("Error:  table length (%d) cannot exceed %d!\n", a3, 512);
    return 0;
  }
  else
  {
    return MTDeviceSetReport(a1, 78, a2, a3);
  }
}

uint64_t MTZephyrGetDemodTable(uint64_t a1, void *a2, unsigned int *a3)
{
  unsigned int v6 = 0;
  if ((int)*a3 > 512)
  {
    printf("Error:  table length (%d) cannot exceed %d!\n", *a3, 512);
    unsigned int v5 = 0;
    uint64_t result = 0;
  }
  else
  {
    uint64_t result = MTDeviceGetReport(a1, 78, a2, *a3, &v6);
    unsigned int v5 = v6;
  }
  *a3 = v5;
  return result;
}

uint64_t MTZephyrWriteLookupTable(uint64_t a1)
{
  char v2 = -86;
  return MTDeviceSetReport(a1, 79, (uint64_t)&v2, 1);
}

uint64_t MTZephyrRequestDemodulationStimCount()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v22 = *MEMORY[0x263EF8340];
  v21[8] = xmmword_2262EFBF0;
  v21[9] = unk_2262EFC00;
  v21[10] = xmmword_2262EFC10;
  v21[4] = xmmword_2262EFBB0;
  v21[5] = unk_2262EFBC0;
  v21[6] = xmmword_2262EFBD0;
  v21[7] = unk_2262EFBE0;
  v21[0] = xmmword_2262EFB70;
  v21[1] = unk_2262EFB80;
  v21[2] = xmmword_2262EFB90;
  v21[3] = unk_2262EFBA0;
  v20[9] = unk_2262EFCB0;
  v20[10] = xmmword_2262EFCC0;
  v20[11] = unk_2262EFCD0;
  v20[12] = xmmword_2262EFCE0;
  v20[5] = unk_2262EFC70;
  v20[6] = xmmword_2262EFC80;
  _OWORD v20[7] = unk_2262EFC90;
  v20[8] = xmmword_2262EFCA0;
  v20[1] = unk_2262EFC30;
  v20[2] = xmmword_2262EFC40;
  void v20[3] = unk_2262EFC50;
  v20[4] = xmmword_2262EFC60;
  v19[12] = xmmword_2262EFDB0;
  v19[13] = unk_2262EFDC0;
  v19[14] = xmmword_2262EFDD0;
  v20[0] = xmmword_2262EFC20;
  v19[8] = xmmword_2262EFD70;
  v19[9] = unk_2262EFD80;
  v19[10] = xmmword_2262EFD90;
  v19[11] = unk_2262EFDA0;
  v19[4] = xmmword_2262EFD30;
  v19[5] = unk_2262EFD40;
  v19[6] = xmmword_2262EFD50;
  v19[7] = unk_2262EFD60;
  v19[0] = xmmword_2262EFCF0;
  v19[1] = unk_2262EFD00;
  int v19[2] = xmmword_2262EFD10;
  void v19[3] = unk_2262EFD20;
  v18[12] = xmmword_2262EFEA0;
  v18[13] = unk_2262EFEB0;
  v18[14] = xmmword_2262EFEC0;
  v18[15] = unk_2262EFED0;
  v18[8] = xmmword_2262EFE60;
  v18[9] = unk_2262EFE70;
  v18[10] = xmmword_2262EFE80;
  v18[11] = unk_2262EFE90;
  v18[4] = xmmword_2262EFE20;
  v18[5] = unk_2262EFE30;
  v18[6] = xmmword_2262EFE40;
  v18[7] = unk_2262EFE50;
  v18[0] = xmmword_2262EFDE0;
  v18[1] = unk_2262EFDF0;
  v18[2] = xmmword_2262EFE00;
  v18[3] = unk_2262EFE10;
  memcpy(__dst, &unk_2262EFEE0, sizeof(__dst));
  memcpy(v16, &unk_2262EFFF0, sizeof(v16));
  memcpy(v15, &unk_2262F0120, sizeof(v15));
  memcpy(v14, &unk_2262F0270, sizeof(v14));
  memcpy(v13, &unk_2262F03E0, sizeof(v13));
  memcpy(v12, &unk_2262F0570, sizeof(v12));
  memcpy(v11, &unk_2262F0720, sizeof(v11));
  memcpy(v10, &unk_2262F08F0, sizeof(v10));
  signed int v4 = 496;
  unsigned int v5 = v9;
  memcpy(v9, &unk_2262F0AD0, sizeof(v9));
  if ((int)v2 <= 31)
  {
    if (v2 == 31)
    {
      unsigned int v5 = v10;
      signed int v4 = 480;
    }
    else if ((int)v2 <= 29)
    {
      if ((int)v2 <= 27)
      {
        if ((int)v2 <= 25)
        {
          if ((int)v2 <= 23)
          {
            if ((int)v2 <= 21)
            {
              if ((int)v2 <= 19)
              {
                if ((int)v2 <= 17)
                {
                  if (v2 == 17)
                  {
                    unsigned int v5 = v18;
                    signed int v4 = 256;
                  }
                  else if ((int)v2 <= 15)
                  {
                    BOOL v6 = (int)v2 <= 13;
                    if ((int)v2 <= 13) {
                      uint64_t v2 = 12;
                    }
                    else {
                      uint64_t v2 = 14;
                    }
                    if (v6) {
                      signed int v4 = 176;
                    }
                    else {
                      signed int v4 = 208;
                    }
                    if (v6) {
                      unsigned int v5 = v21;
                    }
                    else {
                      unsigned int v5 = v20;
                    }
                  }
                  else
                  {
                    unsigned int v5 = v19;
                    signed int v4 = 240;
                    uint64_t v2 = 16;
                  }
                }
                else
                {
                  unsigned int v5 = __dst;
                  signed int v4 = 272;
                  uint64_t v2 = 18;
                }
              }
              else
              {
                unsigned int v5 = v16;
                signed int v4 = 304;
                uint64_t v2 = 20;
              }
            }
            else
            {
              unsigned int v5 = v15;
              signed int v4 = 336;
              uint64_t v2 = 22;
            }
          }
          else
          {
            unsigned int v5 = v14;
            signed int v4 = 368;
            uint64_t v2 = 24;
          }
        }
        else
        {
          unsigned int v5 = v13;
          signed int v4 = 400;
          uint64_t v2 = 26;
        }
      }
      else
      {
        unsigned int v5 = v12;
        signed int v4 = 432;
        uint64_t v2 = 28;
      }
    }
    else
    {
      unsigned int v5 = v11;
      signed int v4 = 464;
      uint64_t v2 = 30;
    }
  }
  else
  {
    uint64_t v2 = 32;
  }
  MTZephyrSetDemodTable(v3, (uint64_t)v5, v4);
  char v8 = -86;
  MTDeviceSetReport(v3, 79, (uint64_t)&v8, 1);
  return v2;
}

uint64_t mt_PostButtonStateCallbacks(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = result;
    int v4 = *(_DWORD *)(result + 200);
    if (v4 != a2)
    {
      if (*(unsigned char *)(result + 648))
      {
        for (uint64_t i = 0; i != 32; i += 8)
        {
          BOOL v6 = *(uint64_t (**)(uint64_t, uint64_t, void, void))(v3 + i + 616);
          if (v6) {
            uint64_t result = v6(v3, a2, *(unsigned int *)(v3 + 200), *(void *)(v3 + i + 656));
          }
        }
        int v4 = *(_DWORD *)(v3 + 200);
      }
      if ((v4 & ~a2) != 0)
      {
        uint64_t result = mt_PostNotificationEvent(v3, 17);
        int v4 = *(_DWORD *)(v3 + 200);
      }
      if ((a2 & ~v4) != 0) {
        uint64_t result = mt_PostNotificationEvent(v3, 16);
      }
      *(_DWORD *)(v3 + 200) = a2;
    }
  }
  return result;
}

uint64_t MTRegisterButtonStateCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  if (a1 && a2)
  {
    uint64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = a1 + 8 * v4;
      if (!*(void *)(v5 + 616)) {
        break;
      }
      if (++v4 == 4) {
        return 0;
      }
    }
    *(void *)(v5 + 616) = a2;
    *(void *)(v5 + 656) = a3;
    uint64_t v3 = 1;
    *(unsigned char *)(a1 + 648) |= 1 << v4;
  }
  return v3;
}

uint64_t MTUnregisterButtonStateCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = a1 + 616;
    while (*(void *)(v4 + 8 * v3) != a2)
    {
      if (++v3 == 4) {
        return 0;
      }
    }
    *(void *)(v4 + 8 * v3) = 0;
    uint64_t v2 = 1;
    *(unsigned char *)(a1 + 648) &= ~(1 << v3);
  }
  return v2;
}

uint64_t mt_PostTrackingCallbacks(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 | a2)
  {
    uint64_t v4 = result;
    if (result)
    {
      if (*(unsigned char *)(result + 720))
      {
        for (uint64_t i = 0; i != 32; i += 8)
        {
          unsigned int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(v4 + i + 688);
          if (v9) {
            uint64_t result = v9(v4, a2, a3, a4, *(void *)(v4 + i + 728));
          }
        }
      }
    }
  }
  return result;
}

uint64_t mt_PostRelativePointerCallbacks(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (result)
  {
    uint64_t v5 = result;
    if (*(unsigned char *)(result + 1728))
    {
      for (uint64_t i = 0; i != 32; i += 8)
      {
        uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v5 + i + 1696);
        if (v11) {
          uint64_t result = v11(v5, a2, a3, a4, a5, *(void *)(v5 + i + 1736));
        }
      }
    }
  }
  return result;
}

uint64_t MTRegisterRelativePointerCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  if (a1 && a2)
  {
    uint64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = a1 + 8 * v4;
      if (!*(void *)(v5 + 1696)) {
        break;
      }
      if (++v4 == 4) {
        return 0;
      }
    }
    *(void *)(v5 + 1696) = a2;
    *(void *)(v5 + 1736) = a3;
    uint64_t v3 = 1;
    *(unsigned char *)(a1 + 1728) |= 1 << v4;
  }
  return v3;
}

uint64_t MTUnregisterRelativePointerCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = a1 + 1696;
    while (*(void *)(v4 + 8 * v3) != a2)
    {
      if (++v3 == 4) {
        return 0;
      }
    }
    *(void *)(v4 + 8 * v3) = 0;
    uint64_t v2 = 1;
    *(unsigned char *)(a1 + 1728) &= ~(1 << v3);
  }
  return v2;
}

uint64_t MTRegisterTrackingCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  if (a1 && a2)
  {
    uint64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = a1 + 8 * v4;
      if (!*(void *)(v5 + 688)) {
        break;
      }
      if (++v4 == 4) {
        return 0;
      }
    }
    *(void *)(v5 + 688) = a2;
    *(void *)(v5 + 728) = a3;
    uint64_t v3 = 1;
    *(unsigned char *)(a1 + 720) |= 1 << v4;
  }
  return v3;
}

uint64_t MTUnregisterTrackingCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = a1 + 688;
    while (*(void *)(v4 + 8 * v3) != a2)
    {
      if (++v3 == 4) {
        return 0;
      }
    }
    *(void *)(v4 + 8 * v3) = 0;
    uint64_t v2 = 1;
    *(unsigned char *)(a1 + 720) &= ~(1 << v3);
  }
  return v2;
}

uint64_t mt_PostOffTableHeightCallbacks(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    uint64_t v5 = result;
    if (*(_DWORD *)(result + 204) != a2)
    {
      if (*(unsigned char *)(result + 792))
      {
        for (uint64_t i = 0; i != 32; i += 8)
        {
          unsigned int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(v5 + i + 760);
          if (v9) {
            uint64_t result = v9(v5, a2, a3, a4, *(void *)(v5 + i + 800));
          }
        }
      }
      *(_DWORD *)(v5 + 204) = a2;
    }
  }
  return result;
}

uint64_t MTRegisterOffTableHeightCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  if (a1 && a2)
  {
    uint64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = a1 + 8 * v4;
      if (!*(void *)(v5 + 760)) {
        break;
      }
      if (++v4 == 4) {
        return 0;
      }
    }
    *(void *)(v5 + 760) = a2;
    *(void *)(v5 + 800) = a3;
    uint64_t v3 = 1;
    *(unsigned char *)(a1 + 792) |= 1 << v4;
  }
  return v3;
}

uint64_t MTUnregisterOffTableHeightCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = a1 + 760;
    while (*(void *)(v4 + 8 * v3) != a2)
    {
      if (++v3 == 4) {
        return 0;
      }
    }
    *(void *)(v4 + 8 * v3) = 0;
    uint64_t v2 = 1;
    *(unsigned char *)(a1 + 792) &= ~(1 << v3);
  }
  return v2;
}

uint64_t MTRegisterOpticalProximityChangedCallback(uint64_t a1, uint64_t a2, __int16 a3)
{
  uint64_t v3 = 0;
  if (a1 && a2)
  {
    uint64_t v4 = 0;
    while (*(void *)(a1 + 1844 + 8 * v4 - 1012))
    {
      if (++v4 == 4) {
        return 0;
      }
    }
    *(void *)(a1 + 1844 + 8 * v4 - 1012) = a2;
    *(_WORD *)(a1 + 1844 + 2 * v4) = a3;
    uint64_t v3 = 1;
    *(unsigned char *)(a1 + 864) |= 1 << v4;
  }
  return v3;
}

uint64_t MTUnregisterOpticalProximityChangedCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    uint64_t v3 = 0;
    while (*(void *)(a1 + 1844 + 8 * v3 - 1012) != a2)
    {
      if (++v3 == 4) {
        return 0;
      }
    }
    *(void *)(a1 + 1844 + 8 * v3 - 1012) = 0;
    *(_WORD *)(a1 + 1844 + 2 * v3) = 0;
    uint64_t v2 = 1;
    *(unsigned char *)(a1 + 864) &= ~(1 << v3);
  }
  return v2;
}

uint64_t MTAlg_IssueOpticalProximityCallback(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = result;
    float v4 = *(float *)(result + 1852);
    float v5 = v4 * 0.875 + (double)(int)a2 * 0.125;
    *(float *)(result + 1852) = v5;
    if (*(unsigned char *)(result + 864))
    {
      for (uint64_t i = 0; i != 4; ++i)
      {
        int v7 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8 * i + 832);
        if (v7)
        {
          unsigned int v8 = *(unsigned __int16 *)(v3 + 2 * i + 1844);
          uint64_t v9 = a2;
          if (*(_WORD *)(v3 + 2 * i + 1844))
          {
            float v10 = (float)v8;
            if (v4 <= (float)v8 || (float v11 = *(float *)(v3 + 1852), v11 >= v10))
            {
              if (v4 >= v10) {
                continue;
              }
              float v11 = *(float *)(v3 + 1852);
              if (v11 <= v10) {
                continue;
              }
            }
            uint64_t v9 = (int)v11;
          }
          uint64_t result = v7(v3, v9);
        }
      }
    }
  }
  return result;
}

uint64_t MTRegisterFarfieldProximityChangedCallback(uint64_t a1, uint64_t a2, __int16 a3)
{
  uint64_t v3 = 0;
  if (a1 && a2)
  {
    uint64_t v4 = 0;
    while (*(void *)(a1 + 1856 + 8 * v4 - 952))
    {
      if (++v4 == 4) {
        return 0;
      }
    }
    *(void *)(a1 + 1856 + 8 * v4 - 952) = a2;
    *(_WORD *)(a1 + 1856 + 2 * v4) = a3;
    uint64_t v3 = 1;
    *(unsigned char *)(a1 + 936) |= 1 << v4;
  }
  return v3;
}

uint64_t MTUnregisterFarfieldProximityChangedCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    uint64_t v3 = 0;
    while (*(void *)(a1 + 1856 + 8 * v3 - 952) != a2)
    {
      if (++v3 == 4) {
        return 0;
      }
    }
    *(void *)(a1 + 1856 + 8 * v3 - 952) = 0;
    *(_WORD *)(a1 + 1856 + 2 * v3) = 0;
    uint64_t v2 = 1;
    *(unsigned char *)(a1 + 936) &= ~(1 << v3);
  }
  return v2;
}

uint64_t MTAlg_IssueFarfieldProximityCallback(uint64_t result, int a2, uint64_t a3)
{
  if (result)
  {
    uint64_t v3 = result;
    float v4 = *(float *)(result + 1864);
    *(float *)(result + 1864) = (float)a2;
    if (*(unsigned char *)(result + 936))
    {
      for (uint64_t i = 0; i != 4; ++i)
      {
        int v7 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8 * i + 904);
        if (v7)
        {
          unsigned int v8 = *(unsigned __int16 *)(v3 + 2 * i + 1856);
          uint64_t v9 = a3;
          if (*(_WORD *)(v3 + 2 * i + 1856))
          {
            float v10 = (float)v8;
            if (v4 <= (float)v8 || (float v11 = *(float *)(v3 + 1864), v11 >= v10))
            {
              if (v4 >= v10) {
                continue;
              }
              float v11 = *(float *)(v3 + 1864);
              if (v11 <= v10) {
                continue;
              }
            }
            uint64_t v9 = (int)v11;
          }
          uint64_t result = v7(v3, v9);
        }
      }
    }
  }
  return result;
}

uint64_t MTRegisterInputDetectionCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  if (a1 && a2)
  {
    uint64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = a1 + 8 * v4;
      if (!*(void *)(v5 + 976)) {
        break;
      }
      if (++v4 == 4) {
        return 0;
      }
    }
    *(void *)(v5 + 976) = a2;
    *(void *)(v5 + 1016) = a3;
    uint64_t v3 = 1;
    *(unsigned char *)(a1 + 1008) |= 1 << v4;
  }
  return v3;
}

uint64_t MTUnregisterInputDetectionCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = a1 + 976;
    while (*(void *)(v4 + 8 * v3) != a2)
    {
      if (++v3 == 4) {
        return 0;
      }
    }
    *(void *)(v4 + 8 * v3) = 0;
    uint64_t v2 = 1;
    *(unsigned char *)(a1 + 1008) &= ~(1 << v3);
  }
  return v2;
}

uint64_t MTDeviceSetInputDetectionCallbackTriggerMask(uint64_t result, int a2)
{
  if (result) {
    *(_DWORD *)(result + 196) = a2;
  }
  return result;
}

uint64_t MTAlg_IssueInputDetectionStateCallback(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(_DWORD *)(result + 196) & a2;
    if (*(_DWORD *)(result + 192) != v5)
    {
      if (*(unsigned char *)(result + 1008))
      {
        for (uint64_t i = 0; i != 32; i += 8)
        {
          uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(v4 + i + 976);
          if (v9) {
            uint64_t result = v9(v4, v5, a3, a4, *(void *)(v4 + i + 1016));
          }
        }
      }
      *(_DWORD *)(v4 + 192) = v5;
    }
  }
  return result;
}

uint64_t MTInputDetectionSetEnabled(uint64_t result, __int16 a2)
{
  if (result) {
    return mt_SetDetectableInputTypes(result, a2);
  }
  return result;
}

uint64_t MTSetDetectableAndSuppressingInputs(uint64_t a1, __int16 a2, __int16 a3, __int16 a4, __int16 a5)
{
  if (!a1) {
    return 3758097090;
  }
  int v5 = *(_DWORD *)(a1 + 100);
  __int16 v6 = __rev16(a2);
  BOOL v7 = v5 == 1;
  if (v5 == 1) {
    __int16 v8 = a2;
  }
  else {
    __int16 v8 = v6;
  }
  v14[0] = v8;
  __int16 v9 = __rev16(a3);
  if (v7) {
    __int16 v9 = a3;
  }
  v14[1] = v9;
  __int16 v10 = __rev16(a4);
  if (v7) {
    __int16 v10 = a4;
  }
  v14[2] = v10;
  __int16 v11 = __rev16(a5);
  if (v7) {
    __int16 v11 = a5;
  }
  v14[3] = v11;
  if (*(unsigned char *)(a1 + 114)) {
    signed int v12 = 8;
  }
  else {
    signed int v12 = 4;
  }
  return MTDeviceSetReport(a1, 191, (uint64_t)v14, v12);
}

uint64_t MTSetDetectableInputs(uint64_t a1, unsigned int a2)
{
  if (!a1) {
    return 3758097090;
  }
  unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = MTDeviceGetReport(a1, 191, &v8, 8u, 0);
  if (!result)
  {
    __int16 v5 = __rev16(a2);
    if (*(_DWORD *)(a1 + 100) == 1) {
      __int16 v6 = a2;
    }
    else {
      __int16 v6 = v5;
    }
    LOWORD(v8) = v6;
    if (*(unsigned char *)(a1 + 114)) {
      signed int v7 = 8;
    }
    else {
      signed int v7 = 4;
    }
    return MTDeviceSetReport(a1, 191, (uint64_t)&v8, v7);
  }
  return result;
}

uint64_t MTGetDetectableInputs(uint64_t a1)
{
  if (a1)
  {
    unint64_t v5 = 0xAAAAAAAAAAAAAAAALL;
    if (MTDeviceGetReport(a1, 191, &v5, 8u, 0))
    {
      return 0;
    }
    else
    {
      unsigned int v3 = bswap32((unsigned __int16)v5) >> 16;
      if (*(_DWORD *)(a1 + 100) == 1) {
        return (unsigned __int16)v5;
      }
      else {
        return (unsigned __int16)v3;
      }
    }
  }
  else
  {
    return 0;
  }
}

uint64_t MTSetInputsThatSuppressFingers(uint64_t a1, unsigned int a2)
{
  if (!a1) {
    return 3758097090;
  }
  unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = MTDeviceGetReport(a1, 191, &v8, 8u, 0);
  if (!result)
  {
    __int16 v5 = __rev16(a2);
    if (*(_DWORD *)(a1 + 100) == 1) {
      __int16 v6 = a2;
    }
    else {
      __int16 v6 = v5;
    }
    WORD1(v8) = v6;
    if (*(unsigned char *)(a1 + 114)) {
      signed int v7 = 8;
    }
    else {
      signed int v7 = 4;
    }
    return MTDeviceSetReport(a1, 191, (uint64_t)&v8, v7);
  }
  return result;
}

uint64_t MTGetInputsThatSuppressFingers(uint64_t a1)
{
  if (a1)
  {
    unint64_t v5 = 0xAAAAAAAAAAAAAAAALL;
    if (MTDeviceGetReport(a1, 191, &v5, 8u, 0))
    {
      return 0;
    }
    else
    {
      unsigned int v3 = bswap32(WORD1(v5)) >> 16;
      if (*(_DWORD *)(a1 + 100) == 1) {
        return (unsigned __int16)WORD1(v5);
      }
      else {
        return (unsigned __int16)v3;
      }
    }
  }
  else
  {
    return 0;
  }
}

uint64_t MTDeviceSetFaceDetectionModeEnabled(uint64_t a1, char a2)
{
  if (!a1 || MTDeviceShouldSkipFaceDetectionMode(a1)) {
    return 0;
  }
  return MTDeviceSetZephyrParameter(a1, 175, a2);
}

uint64_t MTDeviceSetInputDetectionMode(uint64_t a1, int a2)
{
  return MTDeviceSetInputDetectionModeForOrientation(a1, a2, 0);
}

uint64_t MTDeviceSetInputDetectionModeForOrientation(uint64_t a1, int a2, int a3)
{
  if (!a1) {
    return 3758097090;
  }
  kdebug_trace();
  uint64_t v6 = 3758096385;
  if (a2 > 252)
  {
    if (a2 == 253)
    {
      __int16 v18 = *(unsigned __int8 *)(a1 + 114) << 12;
      uint64_t v19 = a1;
      __int16 v20 = 4096;
    }
    else
    {
      if (a2 != 254)
      {
        if (a2 == 255)
        {
          mt_PostNotificationEvent(a1, 23);
          mt_PostNotificationEventToDriver((io_service_t *)a1, 123);
          uint64_t v6 = 0;
        }
        goto LABEL_48;
      }
      __int16 v18 = *(unsigned __int8 *)(a1 + 114) << 12;
      uint64_t v19 = a1;
      __int16 v20 = 4097;
    }
    uint64_t v6 = MTSetDetectableAndSuppressingInputs(v19, v20, 9, v18, 0);
    mt_PostNotificationEvent(a1, 31);
    mt_PostNotificationEventToDriver((io_service_t *)a1, 131);
  }
  else
  {
    switch(a2)
    {
      case 0:
        if ((a3 - 3) >= 2) {
          __int16 v7 = 413;
        }
        else {
          __int16 v7 = 409;
        }
        uint64_t v8 = 9;
        uint64_t v6 = MTSetDetectableAndSuppressingInputs(a1, v7, 9, *(unsigned __int8 *)(a1 + 114) << 12, 0);
        char v9 = 109;
        goto LABEL_37;
      case 1:
        if ((a3 - 3) >= 2) {
          __int16 v10 = 477;
        }
        else {
          __int16 v10 = 473;
        }
        uint64_t v6 = MTSetDetectableAndSuppressingInputs(a1, v10, 73, *(unsigned __int8 *)(a1 + 114) << 12, 0);
        char v9 = 110;
        uint64_t v8 = 10;
        goto LABEL_37;
      case 2:
        if ((a3 - 3) >= 2) {
          __int16 v11 = -32355;
        }
        else {
          __int16 v11 = -32359;
        }
        uint64_t v6 = MTSetDetectableAndSuppressingInputs(a1, v11, 32777, *(unsigned __int8 *)(a1 + 114) << 12, 0);
        char v9 = 120;
        uint64_t v8 = 20;
        goto LABEL_37;
      case 3:
        if ((a3 - 3) >= 2) {
          __int16 v12 = 2461;
        }
        else {
          __int16 v12 = 2457;
        }
        uint64_t v6 = MTSetDetectableAndSuppressingInputs(a1, v12, 9, *(unsigned __int8 *)(a1 + 114) << 12, 0);
        char v9 = 121;
        uint64_t v8 = 21;
        goto LABEL_37;
      case 4:
        if ((a3 - 3) >= 2) {
          __int16 v13 = 2525;
        }
        else {
          __int16 v13 = 2521;
        }
        uint64_t v6 = MTSetDetectableAndSuppressingInputs(a1, v13, 73, *(unsigned __int8 *)(a1 + 114) << 12, 0);
        char v9 = 122;
        uint64_t v8 = 22;
        goto LABEL_37;
      case 5:
        if ((a3 - 3) >= 2) {
          __int16 v14 = 927;
        }
        else {
          __int16 v14 = 923;
        }
        uint64_t v6 = MTSetDetectableAndSuppressingInputs(a1, v14, 523, *(unsigned __int8 *)(a1 + 114) << 12, 0);
        char v9 = 124;
        uint64_t v8 = 24;
        goto LABEL_37;
      case 6:
        if ((a3 - 3) >= 2) {
          __int16 v15 = 2975;
        }
        else {
          __int16 v15 = 2971;
        }
        uint64_t v6 = MTSetDetectableAndSuppressingInputs(a1, v15, 523, *(unsigned __int8 *)(a1 + 114) << 12, 0);
        char v9 = 125;
        uint64_t v8 = 25;
LABEL_37:
        mt_PostNotificationEvent(a1, v8);
        mt_PostNotificationEventToDriver((io_service_t *)a1, v9);
        if (!v6)
        {
          char v17 = a2 == 4 || (a2 - 1) < 2;
          uint64_t v6 = MTDeviceSetFaceDetectionModeEnabled(a1, v17);
        }
        break;
      default:
        break;
    }
  }
LABEL_48:
  BOOL v22 = a2 == 253 || (a2 & 0xFFFE) == 254;
  MTDeviceUpdateUILockState(a1, v22);
  return v6;
}

uint64_t MTDeviceSetTouchMode(uint64_t a1, int a2, int a3)
{
  kdebug_trace();
  uint64_t v6 = 3758096385;
  if (a2 > 252)
  {
    if (a2 == 253)
    {
      __int16 v12 = *(unsigned __int8 *)(a1 + 114) << 12;
      uint64_t v13 = a1;
      __int16 v14 = 4096;
    }
    else
    {
      if (a2 != 254)
      {
        if (a2 == 255)
        {
          mt_PostNotificationEvent(a1, 23);
          mt_PostNotificationEventToDriver((io_service_t *)a1, 123);
          uint64_t v6 = 0;
        }
        goto LABEL_26;
      }
      __int16 v12 = *(unsigned __int8 *)(a1 + 114) << 12;
      uint64_t v13 = a1;
      __int16 v14 = 4097;
    }
    uint64_t v6 = MTSetDetectableAndSuppressingInputs(v13, v14, 9, v12, 0);
    mt_PostNotificationEvent(a1, 31);
    mt_PostNotificationEventToDriver((io_service_t *)a1, 131);
    goto LABEL_26;
  }
  if (a2)
  {
    if (a2 == 1)
    {
      if ((a3 - 3) >= 2) {
        __int16 v11 = -31841;
      }
      else {
        __int16 v11 = -31845;
      }
      uint64_t v6 = MTSetDetectableAndSuppressingInputs(a1, v11, 523, *(unsigned __int8 *)(a1 + 114) << 12, 0);
      uint64_t v9 = 25;
      char v8 = 25;
    }
    else
    {
      if (a2 != 2) {
        goto LABEL_26;
      }
      if ((a3 - 3) >= 2) {
        __int16 v7 = -32355;
      }
      else {
        __int16 v7 = -32359;
      }
      uint64_t v6 = MTSetDetectableAndSuppressingInputs(a1, v7, 32777, *(unsigned __int8 *)(a1 + 114) << 12, 0);
      char v8 = 110;
      uint64_t v9 = 10;
    }
  }
  else
  {
    if ((a3 - 3) >= 2) {
      __int16 v10 = -32355;
    }
    else {
      __int16 v10 = -32359;
    }
    uint64_t v6 = MTSetDetectableAndSuppressingInputs(a1, v10, 9, *(unsigned __int8 *)(a1 + 114) << 12, 0);
    uint64_t v9 = 21;
    char v8 = 21;
  }
  mt_PostNotificationEvent(a1, v9);
  mt_PostNotificationEventToDriver((io_service_t *)a1, v8);
  if (!v6) {
    uint64_t v6 = MTDeviceSetFaceDetectionModeEnabled(a1, a2 == 2);
  }
LABEL_26:
  BOOL v16 = a2 == 253 || (a2 & 0xFFFE) == 254;
  MTDeviceUpdateUILockState(a1, v16);
  return v6;
}

uint64_t mt_UpdateDeviceOrientation(uint64_t result, int a2, int a3)
{
  if (*(unsigned __int16 *)(result + 208) != a2)
  {
    *(_WORD *)(result + 208) = a2;
    if (a2 == 2)
    {
      if (a3)
      {
        char v3 = 19;
        return mt_PostNotificationEventToDriver((io_service_t *)result, v3);
      }
      uint64_t v4 = 119;
      return mt_PostNotificationEvent(result, v4);
    }
    if (!a2)
    {
      if (a3)
      {
        char v3 = 118;
        return mt_PostNotificationEventToDriver((io_service_t *)result, v3);
      }
      uint64_t v4 = 18;
      return mt_PostNotificationEvent(result, v4);
    }
  }
  return result;
}

uint64_t MTDeviceSetSurfaceOrientation(uint64_t a1, int a2)
{
  uint64_t result = 3758097090;
  if (a1)
  {
    if (a2)
    {
      if (a2 != 2) {
        return 3758097095;
      }
      char v5 = 2;
    }
    else
    {
      char v5 = 0;
    }
    char v6 = v5;
    uint64_t result = MTDeviceSetReport(a1, 220, (uint64_t)&v6, 1);
    if (!result)
    {
      mt_UpdateDeviceOrientation(a1, a2, 1);
      return 0;
    }
  }
  return result;
}

uint64_t MTDeviceSetSurfaceOrientationMode(uint64_t a1, int a2)
{
  uint64_t v4 = 3758097090;
  if (a1)
  {
    if (a2)
    {
      if (a2 != 1) {
        return 3758097095;
      }
      char v5 = 1;
    }
    else
    {
      char v5 = 2;
    }
    uint64_t v8 = v2;
    uint64_t v9 = v3;
    char v7 = v5;
    return MTDeviceSetReport(a1, 221, (uint64_t)&v7, 1);
  }
  return v4;
}

uint64_t mt_PostStatisticsChannelEvent(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 1440))
    {
      for (uint64_t i = 0; i != 32; i += 8)
      {
        uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, float, float))(v1 + i + 1408);
        if (v3) {
          uint64_t result = v3(v1, 5, v1 + 1900, *(float *)(v1 + i + 1920), *(float *)(v1 + i + 1924));
        }
      }
    }
  }
  return result;
}

uint64_t mt_StatisticsChannelFrameProcessingEntryExitCallbackFunc(uint64_t result, uint64_t a2, uint64_t a3, char a4)
{
  if (result)
  {
    if ((a4 & 1) == 0) {
      return mt_PostStatisticsChannelEvent(result);
    }
  }
  return result;
}

uint64_t mt_InitializeStatisticsChannelState(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (!*(unsigned char *)(result + 2000))
    {
      uint64_t result = MTRegisterFrameProcessingEntryExitCallback(result, (uint64_t)mt_StatisticsChannelFrameProcessingEntryExitCallbackFunc, 0);
      *(unsigned char *)(v1 + 2000) = 1;
    }
  }
  return result;
}

uint64_t MTRegisterStatisticsChannelCallback(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    if (!*(unsigned char *)(a1 + 2000))
    {
      MTRegisterFrameProcessingEntryExitCallback(a1, (uint64_t)mt_StatisticsChannelFrameProcessingEntryExitCallbackFunc, 0);
      *(unsigned char *)(a1 + 2000) = 1;
    }
    uint64_t v5 = 0;
    uint64_t v6 = a1 + 1408;
    while (*(void *)(v6 + 8 * v5) != a2)
    {
      if (++v5 == 4) {
        return 0;
      }
    }
    *(void *)(v6 + 8 * v5) = 0;
    uint64_t result = 1;
    *(unsigned char *)(a1 + 1440) |= 1 << v5;
  }
  return result;
}

uint64_t MTUnregisterStatisticsChannelCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = a1 + 1408;
    while (*(void *)(v4 + 8 * v3) != a2)
    {
      if (++v3 == 4) {
        return 0;
      }
    }
    *(void *)(v4 + 8 * v3) = 0;
    uint64_t v2 = 1;
    *(unsigned char *)(a1 + 1440) &= ~(1 << v3);
  }
  return v2;
}

uint64_t MTStatisticsChannelGetValues(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4)
{
  if (result && a2)
  {
    uint64_t v7 = result;
    if (!*(unsigned char *)(result + 2000))
    {
      uint64_t result = MTRegisterFrameProcessingEntryExitCallback(result, (uint64_t)mt_StatisticsChannelFrameProcessingEntryExitCallbackFunc, 0);
      *(unsigned char *)(v7 + 2000) = 1;
    }
    uint64_t v8 = 0;
    if (a2 >= 5) {
      uint64_t v9 = 5;
    }
    else {
      uint64_t v9 = a2;
    }
    uint64_t v10 = v7 + 1900;
    do
    {
      if (a3) {
        *(_DWORD *)(a3 + 4 * v8) = *(_DWORD *)(v10 + 4 * v8);
      }
      if (a4) {
        *(void *)(a4 + 8 * v8) = *(void *)(v10 + 8 * v8 + 20);
      }
      ++v8;
    }
    while (v9 != v8);
  }
  return result;
}

uint64_t MTStatisticsChannelGetName(uint64_t result, int a2)
{
  if (result)
  {
    uint64_t v3 = result;
    if (!*(unsigned char *)(result + 2000))
    {
      MTRegisterFrameProcessingEntryExitCallback(result, (uint64_t)mt_StatisticsChannelFrameProcessingEntryExitCallbackFunc, 0);
      *(unsigned char *)(v3 + 2000) = 1;
    }
    if ((a2 - 6) >= 0xFFFFFFFB) {
      return *(void *)(v3 + 8 * (a2 - 1) + 1960);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t MTGetGenericParameterValue()
{
  return 0;
}

uint64_t lsqrt(unsigned int a1)
{
  unsigned int v1 = 0;
  unsigned int v2 = 0;
  int v3 = 16;
  do
  {
    int v4 = 2 * v1;
    unsigned int v5 = __PAIR64__(v2, a1) >> 30;
    a1 *= 4;
    unsigned int v6 = (2 * v1) | 1;
    unsigned int v1 = 2 * v1 + 2;
    if (v6 > v5)
    {
      unsigned int v6 = 0;
      unsigned int v1 = v4;
    }
    unsigned int v2 = v5 - v6;
    --v3;
  }
  while (v3);
  return (unsigned __int16)(v1 >> 1);
}

BOOL MTSetCallModeForFrameworkNotDevice(uint64_t a1, int a2)
{
  uint64_t AlgLibStateRef = MTAlg_GetAlgLibStateRef(a1);
  if (AlgLibStateRef)
  {
    if (a2) {
      __int16 v4 = 989;
    }
    else {
      __int16 v4 = 413;
    }
    if (a2) {
      __int16 v5 = 73;
    }
    else {
      __int16 v5 = 9;
    }
    *(_WORD *)(AlgLibStateRef + 392) = v4;
    *(_WORD *)(AlgLibStateRef + 394) = v5;
  }
  return AlgLibStateRef != 0;
}

uint64_t mt_SetDetectableInputTypes(uint64_t result, __int16 a2)
{
  if (result)
  {
    uint64_t result = MTAlg_GetAlgLibStateRef(result);
    if (result) {
      *(_WORD *)(result + 392) = a2;
    }
  }
  return result;
}

uint64_t plalgs_GetDetectableInputTypes(uint64_t a1)
{
  uint64_t result = MTAlg_GetAlgLibStateRef(a1);
  if (result) {
    return *(unsigned __int16 *)(result + 392);
  }
  return result;
}

uint64_t mt_SetSuppressableInputTypes(uint64_t a1, __int16 a2)
{
  uint64_t result = MTAlg_GetAlgLibStateRef(a1);
  if (result) {
    *(_WORD *)(result + 394) = a2;
  }
  return result;
}

uint64_t mt_GetSuppressableInputTypes(uint64_t a1)
{
  uint64_t result = MTAlg_GetAlgLibStateRef(a1);
  if (result) {
    return *(unsigned __int16 *)(result + 394);
  }
  return result;
}

uint64_t _mthid_anyAvailableDevice()
{
  return _mthid_anyAvailableDeviceOfType(0);
}

uint64_t _mthid_anyAvailableDeviceOfType(const __CFString *a1)
{
  unsigned int v2 = _mthid_copyAvailableDevicesInfo();
  int v3 = v2;
  if (!v2)
  {
    if (a1) {
      return 0;
    }
    CFIndex v5 = 0;
LABEL_14:
    if (v3) {
      BOOL v10 = v5 <= 0;
    }
    else {
      BOOL v10 = 1;
    }
    uint64_t v9 = !v10;
    if (!v3) {
      return v9;
    }
LABEL_21:
    CFRelease(v3);
    return v9;
  }
  CFIndex Count = CFArrayGetCount(v2);
  CFIndex v5 = Count;
  if (!a1) {
    goto LABEL_14;
  }
  if (Count < 1)
  {
    uint64_t v9 = 0;
    goto LABEL_21;
  }
  CFIndex v6 = 0;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, v6);
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"Device Type");
    if (Value)
    {
      if (CFEqual(Value, a1)) {
        break;
      }
    }
    if (v5 == ++v6)
    {
      uint64_t v9 = 0;
      if (v3) {
        goto LABEL_21;
      }
      return v9;
    }
  }
  uint64_t v9 = 1;
  if (v3) {
    goto LABEL_21;
  }
  return v9;
}

__CFArray *_mthid_copyAvailableDevicesInfo()
{
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 10, MEMORY[0x263EFFF70]);
  unsigned int v1 = Mutable;
  if (Mutable)
  {
    appendAvailableDevicesInfo(Mutable, "AppleUSBMultitouchDriver");
    appendAvailableDevicesInfo(v1, "AppleMultitouchDevice");
  }
  return v1;
}

void appendAvailableDevicesInfo(__CFArray *a1, char *name)
{
  if (name)
  {
    io_iterator_t existing = 0;
    CFMutableDictionaryRef v3 = IOServiceMatching(name);
    if (v3)
    {
      __int16 v4 = v3;
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (Mutable)
      {
        CFIndex v6 = Mutable;
        CFDictionarySetValue(Mutable, @"MTHIDDevice", (const void *)*MEMORY[0x263EFFB40]);
        CFDictionarySetValue(v4, @"IOPropertyMatch", v6);
        CFRelease(v6);
        if (!IOServiceGetMatchingServices(0, v4, &existing))
        {
          io_object_t v7 = IOIteratorNext(existing);
          if (v7)
          {
            io_object_t v8 = v7;
            do
            {
              uint64_t v9 = MTDeviceCreateFromService(v8);
              if (v9)
              {
                BOOL v10 = (const void *)v9;
                DeviceInfoForDevice = createDeviceInfoForDevice(v9);
                if (DeviceInfoForDevice)
                {
                  __int16 v12 = DeviceInfoForDevice;
                  CFArrayAppendValue(a1, DeviceInfoForDevice);
                  CFRelease(v12);
                }
                CFRelease(v10);
              }
              IOObjectRelease(v8);
              io_object_t v8 = IOIteratorNext(existing);
            }
            while (v8);
          }
          IOObjectRelease(existing);
        }
      }
      else
      {
        CFRelease(v4);
      }
    }
  }
}

uint64_t _mthid_copyDeviceInfo(uint64_t a1)
{
  uint64_t result = mt_DeviceCreateFromDeviceID(a1, 0);
  if (result)
  {
    unsigned int v2 = (const void *)result;
    DeviceInfoForDevice = createDeviceInfoForDevice(result);
    CFRelease(v2);
    return (uint64_t)DeviceInfoForDevice;
  }
  return result;
}

__CFDictionary *createDeviceInfoForDevice(uint64_t a1)
{
  uint64_t valuePtr = 0;
  unsigned int v28 = -1431655766;
  unsigned int v29 = -1431655766;
  unsigned int ParserType = MTDeviceGetParserType(a1);
  IsBuiltIuint64_t n = MTDeviceIsBuiltIn(a1);
  int v4 = MTDeviceSupportsActuation(a1);
  int v5 = MTDeviceSupportsForce(a1);
  BOOL v8 = ParserType > 0x3E7 && ParserType - 4000 < 0xFFFFFC18 || ParserType == 2;
  CFMutableDictionaryRef Mutable = 0;
  if (!MTDeviceGetDeviceID(a1, &valuePtr))
  {
    CFMutableDictionaryRef Mutable = 0;
    if (!MTDeviceGetSensorSurfaceDimensions(a1, (unint64_t)&v29, (unint64_t)&v28))
    {
      if (valuePtr)
      {
        if (v29)
        {
          if (v28)
          {
            CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
            CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
            if (Mutable)
            {
              unsigned int v26 = v28 / 0x64;
              unsigned int v27 = v29 / 0x64;
              CFNumberRef v12 = CFNumberCreate(v11, kCFNumberSInt64Type, &valuePtr);
              if (v12)
              {
                CFNumberRef v13 = v12;
                CFDictionarySetValue(Mutable, @"Device ID", v12);
                CFRelease(v13);
              }
              __int16 v14 = (const void *)*MEMORY[0x263EFFB40];
              __int16 v15 = (const void *)*MEMORY[0x263EFFB38];
              if (IsBuiltIn) {
                BOOL v16 = (const void *)*MEMORY[0x263EFFB40];
              }
              else {
                BOOL v16 = (const void *)*MEMORY[0x263EFFB38];
              }
              CFDictionarySetValue(Mutable, @"Built-in", v16);
              if (v8) {
                char v17 = v14;
              }
              else {
                char v17 = v15;
              }
              CFDictionarySetValue(Mutable, @"Opaque", v17);
              if (v4) {
                __int16 v18 = v14;
              }
              else {
                __int16 v18 = v15;
              }
              CFDictionarySetValue(Mutable, @"SupportsActuation", v18);
              if (v5) {
                uint64_t v19 = v14;
              }
              else {
                uint64_t v19 = v15;
              }
              CFDictionarySetValue(Mutable, @"SupportsForce", v19);
              CFNumberRef v20 = CFNumberCreate(v11, kCFNumberSInt32Type, &v27);
              if (v20)
              {
                CFNumberRef v21 = v20;
                CFDictionarySetValue(Mutable, @"Surface Width mm", v20);
                CFRelease(v21);
              }
              CFNumberRef v22 = CFNumberCreate(v11, kCFNumberSInt32Type, &v26);
              if (v22)
              {
                CFNumberRef v23 = v22;
                CFDictionarySetValue(Mutable, @"Surface Height mm", v22);
                CFRelease(v23);
              }
              if (ParserType - 2000 >= 0x3E8) {
                unsigned int v24 = @"Simple";
              }
              else {
                unsigned int v24 = @"Mouse";
              }
              if (ParserType - 1000 >= 0x3E8) {
                unsigned int v25 = v24;
              }
              else {
                unsigned int v25 = @"Trackpad";
              }
              CFDictionarySetValue(Mutable, @"Device Type", v25);
            }
          }
        }
      }
    }
  }
  return Mutable;
}

uint64_t _mthid_copyDeviceInfoForService(io_object_t a1)
{
  uint64_t result = MTDeviceCreateFromService(a1);
  if (result)
  {
    unsigned int v2 = (const void *)result;
    DeviceInfoForDevice = createDeviceInfoForDevice(result);
    CFRelease(v2);
    return (uint64_t)DeviceInfoForDevice;
  }
  return result;
}

uint64_t _mthid_getDeviceIDForService(io_registry_entry_t a1)
{
  uint64_t valuePtr = 0;
  if (a1)
  {
    CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"mt-device-id", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (!CFProperty) {
      goto LABEL_6;
    }
    CFNumberRef v4 = CFProperty;
    CFTypeID v5 = CFGetTypeID(CFProperty);
    if (v5 == CFNumberGetTypeID()) {
      CFNumberGetValue(v4, kCFNumberSInt64Type, &valuePtr);
    }
    CFRelease(v4);
    if (!valuePtr)
    {
LABEL_6:
      CFNumberRef v6 = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"Multitouch ID", v2, 0);
      if (v6)
      {
        CFNumberRef v7 = v6;
        CFTypeID v8 = CFGetTypeID(v6);
        if (v8 == CFNumberGetTypeID()) {
          CFNumberGetValue(v7, kCFNumberSInt64Type, &valuePtr);
        }
        CFRelease(v7);
      }
    }
  }
  return valuePtr;
}

uint64_t _mthid_getDeviceIDForRegistryEntryID(uint64_t a1)
{
  CFDictionaryRef v1 = IORegistryEntryIDMatching(a1);
  io_service_t MatchingService = IOServiceGetMatchingService(0, v1);
  if (!MatchingService) {
    return 0;
  }
  io_object_t v3 = MatchingService;
  uint64_t DeviceIDForService = _mthid_getDeviceIDForService(MatchingService);
  IOObjectRelease(v3);
  return DeviceIDForService;
}

uint64_t _mthid_isPathCollection(uint64_t result)
{
  if (result)
  {
    if (IOHIDEventGetType() == 11)
    {
      uint64_t result = IOHIDEventGetIntegerValue();
      if (result) {
        return _mthid_pathCollectionGetDeviceID() != 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

CFArrayRef _mthid_pathCollectionGetDeviceID()
{
  CFArrayRef result = (const __CFArray *)IOHIDEventGetChildren();
  if (result)
  {
    CFArrayRef v1 = result;
    int Count = CFArrayGetCount(result);
    if (Count >= 1)
    {
      CFIndex v3 = (Count - 1);
      do
      {
        CFArrayGetValueAtIndex(v1, v3);
        if (IOHIDEventGetType() == 1) {
          IOHIDEventGetVendorDefinedData();
        }
      }
      while (v3-- > 0);
    }
    return 0;
  }
  return result;
}

BOOL _mthid_pathCollectionIsTouching()
{
  return IOHIDEventGetIntegerValue() == 1;
}

CFArrayRef _mthid_pathCollectionCopyAllPaths()
{
  CFArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  if (Mutable)
  {
    Childreuint64_t n = (const __CFArray *)IOHIDEventGetChildren();
    if (Children)
    {
      CFArrayRef v2 = Children;
      CFIndex Count = CFArrayGetCount(Children);
      if (Count >= 1)
      {
        CFIndex v4 = Count;
        for (CFIndex i = 0; i != v4; ++i)
        {
          CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(v2, i);
          if (_mthid_isPath((BOOL)ValueAtIndex))
          {
            CFIndex v7 = CFArrayGetCount(Mutable);
            CFArrayInsertValueAtIndex(Mutable, v7, ValueAtIndex);
          }
        }
      }
    }
  }
  return Mutable;
}

BOOL _mthid_isPath(BOOL result)
{
  if (result) {
    return IOHIDEventGetType() == 11 && IOHIDEventGetIntegerValue() == 0;
  }
  return result;
}

CFArrayRef _mthid_pathCollectionCopyTouchingPaths()
{
  CFArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  if (Mutable)
  {
    Childreuint64_t n = (const __CFArray *)IOHIDEventGetChildren();
    if (Children)
    {
      CFArrayRef v2 = Children;
      CFIndex Count = CFArrayGetCount(Children);
      if (Count >= 1)
      {
        CFIndex v4 = Count;
        for (CFIndex i = 0; i != v4; ++i)
        {
          CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(v2, i);
          if (_mthid_isPath((BOOL)ValueAtIndex) && IOHIDEventGetIntegerValue() == 1)
          {
            CFIndex v7 = CFArrayGetCount(Mutable);
            CFArrayInsertValueAtIndex(Mutable, v7, ValueAtIndex);
          }
        }
      }
    }
  }
  return Mutable;
}

BOOL _mthid_pathIsTouching()
{
  return IOHIDEventGetIntegerValue() == 1;
}

double _mthid_pathCollectionGetPosition()
{
  IOHIDEventGetFloatValue();
  double v1 = v0;
  IOHIDEventGetFloatValue();
  return v1;
}

uint64_t _mthid_pathCollectionGetForce()
{
  return IOHIDEventGetFloatValue();
}

unint64_t _mthid_pathIsResting()
{
  return ((unint64_t)IOHIDEventGetIntegerValue() >> 9) & 1;
}

BOOL _mthid_pathIsStationary()
{
  return (IOHIDEventGetIntegerValue() & 4) == 0;
}

BOOL _mthid_pathWasRejected()
{
  return IOHIDEventGetIntegerValue() < 1 || IOHIDEventGetIntegerValue() > 5;
}

uint64_t _mthid_pathGetIndex()
{
  return IOHIDEventGetIntegerValue();
}

double _mthid_pathGetPosition()
{
  IOHIDEventGetFloatValue();
  double v1 = v0;
  IOHIDEventGetFloatValue();
  return v1;
}

double _mthid_pathGetVelocity()
{
  if (!IOHIDEventGetEvent()) {
    return 0.0;
  }
  IOHIDEventGetFloatValue();
  double v1 = v0;
  IOHIDEventGetFloatValue();
  return v1;
}

uint64_t _mthid_pathGetForce()
{
  return IOHIDEventGetFloatValue();
}

CFDictionaryRef _mthid_createGestureConfiguration()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int valuePtr = 1;
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v1 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &valuePtr);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(v0, 0, MEMORY[0x263EFFF70]);
  CFMutableArrayRef v3 = Mutable;
  *(_OWORD *)keys = xmmword_26479B408;
  values[0] = v1;
  values[1] = Mutable;
  if (v1) {
    BOOL v4 = Mutable == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    CFDictionaryRef v7 = CFDictionaryCreate(v0, (const void **)keys, (const void **)values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    goto LABEL_10;
  }
  CFDictionaryRef v7 = 0;
  CFDictionaryRef v5 = 0;
  if (v1)
  {
LABEL_10:
    CFRelease(v1);
    CFDictionaryRef v5 = v7;
    if (!v3) {
      return v5;
    }
    goto LABEL_8;
  }
  if (Mutable) {
LABEL_8:
  }
    CFRelease(v3);
  return v5;
}

uint64_t _mthid_isGestureConfigurationValid(uint64_t result)
{
  if (result)
  {
    CFDictionaryRef v1 = (const __CFDictionary *)result;
    CFTypeID v2 = CFGetTypeID((CFTypeRef)result);
    if (v2 != CFDictionaryGetTypeID()) {
      return 0;
    }
    int valuePtr = -1;
    CFStringRef Value = CFDictionaryGetValue(v1, @"Version");
    BOOL v4 = CFDictionaryGetValue(v1, @"Behaviors");
    if (!Value) {
      return 0;
    }
    CFDictionaryRef v5 = v4;
    CFTypeID v6 = CFGetTypeID(Value);
    if (v6 != CFNumberGetTypeID()) {
      return 0;
    }
    int v7 = CFNumberGetValue((CFNumberRef)Value, kCFNumberIntType, &valuePtr);
    CFArrayRef result = 0;
    if (v7)
    {
      if (v5)
      {
        CFTypeID v8 = CFGetTypeID(v5);
        CFTypeID TypeID = CFArrayGetTypeID();
        CFArrayRef result = 0;
        if (v8 == TypeID && valuePtr == 1)
        {
          if (CFArrayGetCount((CFArrayRef)v5) < 1) {
            return 1;
          }
          CFIndex v10 = 0;
          while (1)
          {
            CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v5, v10);
            CFTypeID v12 = CFGetTypeID(ValueAtIndex);
            if (v12 != CFDictionaryGetTypeID()) {
              break;
            }
            CFArrayRef result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"BehaviorID");
            if (!result) {
              return result;
            }
            CFTypeID v13 = CFGetTypeID((CFTypeRef)result);
            if (v13 != CFNumberGetTypeID()) {
              break;
            }
            ++v10;
            CFIndex Count = CFArrayGetCount((CFArrayRef)v5);
            CFArrayRef result = 1;
            if (v10 >= Count) {
              return result;
            }
          }
          return 0;
        }
      }
    }
  }
  return result;
}

CFDictionaryRef _mthid_appendBehaviorToGestureConfiguration(const __CFDictionary *a1, void *a2)
{
  keys[1] = *(void **)MEMORY[0x263EF8340];
  int isGestureConfigurationValid = _mthid_isGestureConfigurationValid((uint64_t)a1);
  CFDictionaryRef result = 0;
  if (a2)
  {
    if (isGestureConfigurationValid)
    {
      values = a2;
      keys[0] = @"BehaviorID";
      CFDictionaryRef result = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (result)
      {
        CFTypeID v6 = result;
        CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a1, @"Behaviors");
        v10.length = CFArrayGetCount(Value);
        v10.locatiouint64_t n = 0;
        if (!CFArrayContainsValue(Value, v10, v6)) {
          CFArrayAppendValue(Value, v6);
        }
        CFRelease(v6);
        return (CFDictionaryRef)1;
      }
    }
  }
  return result;
}

CFDictionaryRef _mthid_createAggregateGestureConfiguration(const __CFArray *a1)
{
  if (!a1) {
    return 0;
  }
  GestureConfiguratiouint64_t n = _mthid_createGestureConfiguration();
  if (GestureConfiguration && CFArrayGetCount(a1) >= 1)
  {
    CFIndex v3 = 0;
    do
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v3);
      if (_mthid_isGestureConfigurationValid((uint64_t)ValueAtIndex))
      {
        CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, @"Behaviors");
        if (CFArrayGetCount(Value) >= 1)
        {
          CFIndex v6 = 0;
          do
          {
            CFDictionaryRef v7 = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, v6);
            CFTypeID v8 = (void *)CFDictionaryGetValue(v7, @"BehaviorID");
            _mthid_appendBehaviorToGestureConfiguration(GestureConfiguration, v8);
            ++v6;
          }
          while (v6 < CFArrayGetCount(Value));
        }
      }
      ++v3;
    }
    while (v3 < CFArrayGetCount(a1));
  }
  return GestureConfiguration;
}

CFDataRef _mthid_serializeGestureConfiguration(const void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  CFErrorRef error = 0;
  CFDataRef v2 = 0;
  if (_mthid_isGestureConfigurationValid((uint64_t)a1))
  {
    CFDataRef v2 = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x263EFFB08], a1, kCFPropertyListBinaryFormat_v1_0, 0, &error);
    if (error)
    {
      CFIndex v3 = MTLoggingFramework();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CFIndex Code = CFErrorGetCode(error);
        *(_DWORD *)buf = 134217984;
        CFIndex v8 = Code;
        _os_log_impl(&dword_2262CF000, v3, OS_LOG_TYPE_ERROR, "Error serializing gesture configuration. ErrorCode=%ld.", buf, 0xCu);
      }
      CFRelease(error);
    }
  }
  return v2;
}

CFPropertyListRef _mthid_unserializeGestureConfiguration(CFDataRef data)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!data) {
    return 0;
  }
  CFErrorRef error = 0;
  CFPropertyListRef v1 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], data, 0, 0, &error);
  if (error)
  {
    CFDataRef v2 = MTLoggingFramework();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      CFIndex Code = CFErrorGetCode(error);
      *(_DWORD *)buf = 134217984;
      CFIndex v7 = Code;
      _os_log_impl(&dword_2262CF000, v2, OS_LOG_TYPE_ERROR, "Error unserializing gesture configuration. ErrorCode=%ld.", buf, 0xCu);
    }
    CFRelease(error);
  }
  if (v1 && (_mthid_isGestureConfigurationValid((uint64_t)v1) & 1) == 0)
  {
    CFRelease(v1);
    return 0;
  }
  return v1;
}

CFDataRef _mthid_serializePropertiesEvent(CFDataRef result)
{
  if (result)
  {
    CFDictionaryRef result = IOCFSerialize(result, 1uLL);
    if (!result)
    {
      CFPropertyListRef v1 = MTLoggingFramework();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CFDataRef v2 = 0;
        _os_log_impl(&dword_2262CF000, v1, OS_LOG_TYPE_ERROR, "Error serializing properties dictionary", v2, 2u);
      }
      return 0;
    }
  }
  return result;
}

CFStringRef _mthid_unserializePropertiesEvent(const void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!a1 || (CFTypeID v2 = CFGetTypeID(a1), v2 != CFDataGetTypeID()))
  {
    uint64_t v8 = MTLoggingFramework();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2262CF000, v8, OS_LOG_TYPE_ERROR, "Error unserializing properties event: Invalid data provided", buf, 2u);
    }
    return 0;
  }
  CFStringRef errorString = 0;
  BytePtr = (const char *)CFDataGetBytePtr((CFDataRef)a1);
  size_t Length = CFDataGetLength((CFDataRef)a1);
  CFStringRef v5 = (const __CFString *)IOCFUnserializeBinary(BytePtr, Length, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &errorString);
  if (errorString)
  {
    CFIndex v6 = MTLoggingFramework();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v14 = errorString;
      _os_log_impl(&dword_2262CF000, v6, OS_LOG_TYPE_ERROR, "Error unserializing properties event vendor defined data Error: %{public}@", buf, 0xCu);
    }
    CFStringRef v7 = errorString;
    goto LABEL_7;
  }
  CFStringRef v9 = v5;
  if (v5)
  {
    CFTypeID v11 = CFGetTypeID(v5);
    if (v11 != CFDictionaryGetTypeID())
    {
      CFStringRef v7 = v9;
LABEL_7:
      CFRelease(v7);
      return 0;
    }
  }
  return v9;
}

uint64_t quantizeFrequencyToPeriodByte(float a1, float a2)
{
  LOBYTE(v2) = 0;
  if (a1 > 0.0 && a2 > 0.0)
  {
    int v3 = (int)(roundf(1.0 / (float)(a1 * a2)) + -1.0);
    if (v3 >= 255) {
      int v3 = 255;
    }
    return (v3 & ~(v3 >> 31));
  }
  return v2;
}

uint64_t quantizeDurationToByte(float a1, float a2)
{
  if (a2 <= 0.0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    int v2 = llroundf(a1 / a2);
    if (v2 >= 255) {
      int v2 = 255;
    }
    return (v2 & ~(v2 >> 31));
  }
  return v3;
}

uint64_t quantizeAmplitudeToByte(float a1)
{
  int v1 = llroundf(a1 * 255.0);
  if (v1 >= 255) {
    int v1 = 255;
  }
  return v1 & ~(v1 >> 31);
}

double MTActuationWaveformCreateWithBase@<D0>(int a1@<W0>, uint64_t a2@<X8>, float a3@<S0>, float a4@<S1>)
{
  *(_DWORD *)(a2 + 136) = 0;
  *(_OWORD *)(a2 + 120) = 0u;
  *(_OWORD *)(a2 + 104) = 0u;
  *(_OWORD *)(a2 + 88) = 0u;
  *(_OWORD *)(a2 + 72) = 0u;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_DWORD *)a2 = a1;
  *(float *)(a2 + 4) = a3;
  *(float *)(a2 + 8) = a4;
  __asm { FMOV            V0.4S, #1.0 }
  *(_OWORD *)(a2 + 12) = _Q0;
  __asm { FMOV            V0.2S, #1.0 }
  *(double *)(a2 + 28) = result;
  *(_DWORD *)(a2 + 36) = 0;
  return result;
}

uint64_t MTActuationAppendToWaveform(uint64_t a1, int a2, float a3, float a4, float a5, float a6)
{
  if (!a1) {
    return 0;
  }
  int v6 = *(_DWORD *)(a1 + 36);
  if (v6 > 4) {
    return 0;
  }
  uint64_t v7 = a1 + 20 * v6;
  *(_DWORD *)(v7 + 40) = a2;
  *(float *)(v7 + 44) = a3;
  *(float *)(v7 + 48) = a4;
  *(float *)(v7 + 52) = a5;
  *(float *)(v7 + 56) = a6;
  uint64_t v8 = (v6 + 1);
  *(_DWORD *)(a1 + 36) = v8;
  return v8;
}

BOOL MTActuationSetBaseMultipliers(float *a1, float a2, float a3, float a4)
{
  if (a1)
  {
    a1[3] = a2;
    a1[4] = a3;
    a1[5] = a4;
  }
  return a1 != 0;
}

BOOL MTActuationSetToneMultipliers(float *a1, float a2, float a3, float a4)
{
  if (a1)
  {
    a1[6] = a2;
    a1[7] = a3;
    a1[8] = a4;
  }
  return a1 != 0;
}

uint64_t MTActuationFillParametricBufferWithWaveform(uint64_t a1, unsigned char *a2, float a3, float a4, float a5, float a6, float a7, float a8, float a9, float a10)
{
  float v10 = *(float *)(a1 + 4) * a4;
  float v11 = 1.0;
  float v12 = 1.0;
  if (v10 > 0.0)
  {
    if (v10 < a8) {
      a8 = *(float *)(a1 + 4) * a4;
    }
    if (a8 >= a7) {
      a7 = a8;
    }
    float v12 = (float)(a7 / v10) * a4;
  }
  float v13 = *(float *)(a1 + 8) * a6;
  if (v13 > 0.0)
  {
    if (v13 >= a10) {
      float v14 = a10;
    }
    else {
      float v14 = *(float *)(a1 + 8) * a6;
    }
    if (v14 < a9) {
      float v14 = a9;
    }
    float v11 = (float)(v14 / v13) * a6;
  }
  *a2 = *(_DWORD *)a1;
  a2[1] = llroundf(v12 * *(float *)(a1 + 4));
  if (a3 <= 0.0)
  {
    LOBYTE(v16) = 0;
  }
  else
  {
    int v15 = llroundf((float)(v11 * *(float *)(a1 + 8)) / a3);
    if (v15 >= 255) {
      int v15 = 255;
    }
    int v16 = v15 & ~(v15 >> 31);
  }
  a2[2] = v16;
  if (*(int *)(a1 + 36) < 1) {
    return 3;
  }
  char v17 = (float *)(a1 + 56);
  unint64_t v18 = 3;
  uint64_t v19 = 1;
  do
  {
    CFNumberRef v20 = &a2[v18];
    a2[v18] = *((_DWORD *)v17 - 4);
    int v21 = llroundf((float)(*(v17 - 1) * a5) * 255.0);
    if (v21 >= 255) {
      int v21 = 255;
    }
    v20[1] = v21 & ~(v21 >> 31);
    if (a3 <= 0.0)
    {
      LOBYTE(v25) = 0;
      *((_WORD *)v20 + 1) = 0;
    }
    else
    {
      int v22 = llroundf((float)(v11 * *(v17 - 3)) / a3);
      if (v22 >= 255) {
        int v22 = 255;
      }
      v20[2] = v22 & ~(v22 >> 31);
      int v23 = llroundf((float)(v11 * *(v17 - 2)) / a3);
      if (v23 >= 255) {
        int v23 = 255;
      }
      void v20[3] = v23 & ~(v23 >> 31);
      if (*v17 <= 0.0)
      {
        LOBYTE(v25) = 0;
      }
      else
      {
        int v24 = (int)(roundf(1.0 / (float)(*v17 * a3)) + -1.0);
        if (v24 >= 255) {
          int v24 = 255;
        }
        int v25 = v24 & ~(v24 >> 31);
      }
    }
    unint64_t v26 = v18 + 5;
    a2[v18 + 4] = v25;
    if (v19 >= *(int *)(a1 + 36)) {
      break;
    }
    ++v19;
    v17 += 5;
    BOOL v27 = v18 >= 0x33;
    v18 += 5;
  }
  while (!v27);
  return v26;
}

uint64_t MTActuationBaseWaveformGetTypeForKey(const char *a1)
{
  uint64_t result = strncmp(a1, "None", 0x40uLL);
  if (result) {
    return strncmp(a1, "Gaussian", 0x40uLL) == 0;
  }
  return result;
}

uint64_t MTActuationToneWaveformGetTypeForKey(const char *a1)
{
  uint64_t result = strncmp(a1, "None", 0x40uLL);
  if (result)
  {
    if (!strncmp(a1, "Sine", 0x40uLL))
    {
      return 1;
    }
    else if (!strncmp(a1, "Square", 0x40uLL))
    {
      return 2;
    }
    else if (!strncmp(a1, "Sawtooth", 0x40uLL))
    {
      return 3;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t mt_GetSurfaceScreenEdges(uint64_t a1)
{
  uint64_t AlgLibStateRef = MTAlg_GetAlgLibStateRef(a1);
  if (AlgLibStateRef) {
    return AlgLibStateRef + 376;
  }
  else {
    return 0;
  }
}

uint64_t mtalg_getSurfaceBounds_mm(uint64_t result)
{
  if (result) {
    return MTAlg_GetAlgLibStateRef(result);
  }
  return result;
}

uint64_t mtalg_IsOpaqueSurface(uint64_t a1)
{
  uint64_t result = MTAlg_GetAlgLibStateRef(a1);
  if (result) {
    return *(unsigned char *)(result + 482) != 0;
  }
  return result;
}

float mtalg_ConvertBinaryForceCentroidToMTFC(uint64_t a1, uint64_t a2, float *a3)
{
  if (a1)
  {
    int v4 = a2;
    uint64_t v5 = a2 << 16 >> 48;
    uint64_t AlgLibStateRef = MTAlg_GetAlgLibStateRef(a1);
    uint64_t v7 = (__int16 *)(AlgLibStateRef + 376);
    if (!AlgLibStateRef) {
      uint64_t v7 = 0;
    }
    float v8 = (float)((v4 >> 16) - v7[3]) / (float)(v7[2] - v7[3]);
    a3[4] = (float)((__int16)v4 - v7[1]) / (float)(*v7 - v7[1]);
    a3[5] = v8;
    a3[6] = (float)(__int16)v4 / 100.0;
    a3[7] = (float)(v4 >> 16) / 100.0;
    float result = (float)(int)v5;
    a3[8] = (float)(int)v5;
  }
  return result;
}

uint64_t mtalg_ComputeContactDensityFromRadii(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t result = MTAlg_GetAlgLibStateRef(a1);
  if (result) {
    LOWORD(result) = alg_ComputeContactDensityFromRadii(a2, a3, a4, *(__int16 *)(result + 470), *(__int16 *)(result + 472));
  }
  return (unsigned __int16)result;
}

uint64_t mtalg_getPathLifeCycle(uint64_t a1, unsigned int a2)
{
  uint64_t AlgLibStateRef = MTAlg_GetAlgLibStateRef(a1);
  uint64_t v4 = AlgLibStateRef + 520;
  if (a2 - 1 <= 0x1E) {
    uint64_t v4 = AlgLibStateRef + 616 * a2 + 520;
  }
  if (AlgLibStateRef) {
    return v4;
  }
  else {
    return 0;
  }
}

void mt_InitPathLifeCycles(uint64_t a1)
{
  uint64_t v2 = 0;
  int v3 = (_DWORD *)(a1 + 520);
  uint64_t v4 = (_DWORD *)(a1 + 520);
  do
  {
    if ((v2 - 1) >= 0x1F) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v4;
    }
    if (a1) {
      int v6 = v5;
    }
    else {
      int v6 = 0;
    }
    resetPathLifeCycle(v6, v2++);
    v4 += 154;
  }
  while (v2 != 32);
}

double resetPathLifeCycle(_DWORD *a1, int a2)
{
  if (a1)
  {
    bzero(a1, 0x268uLL);
    *a1 = a2;
    *(_OWORD *)(a1 + 146) = xmmword_2262F0CD0;
    double result = 0.0;
    *(_OWORD *)(a1 + 150) = 0u;
  }
  return result;
}

uint64_t mt_CleanupOldPaths(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v6 = a2;
  uint64_t v7 = 1232;
  uint64_t v8 = 31;
  do
  {
    uint64_t result = MTAlg_GetAlgLibStateRef(a1);
    if (result)
    {
      uint64_t v10 = result + v7;
      if (*(void *)(result + v7 - 88) != a2)
      {
        int v11 = *(_DWORD *)(v10 - 68);
        if (v11)
        {
          if (v11 == 7) {
            uint64_t v12 = 0;
          }
          else {
            uint64_t v12 = 7;
          }
          *(_DWORD *)(v10 - 68) = v12;
          float v13 = (void *)(result + v7);
          *((_DWORD *)v13 - 23) = v12;
          *(v13 - 5) = 0;
          *float v13 = 0;
          *((double *)v13 - 10) = a3;
          *(void *)(v10 - 88) = v6;
          uint64_t result = MTAlg_IssuePathCallbacks(a1, *(unsigned int *)(v10 - 96), v12, (long long *)(result + v7 - 88));
        }
      }
    }
    v7 += 616;
    --v8;
  }
  while (v8);
  return result;
}

uint64_t mt_CalculateMTBinaryContactVelocity(uint64_t result, uint64_t a2, double a3)
{
  if (result && a2)
  {
    if (*(unsigned __int8 *)(a2 + 1) - 7 < 0xFFFFFFFD
      || *(__int16 *)(a2 + 8) == -1 && *(__int16 *)(a2 + 10) == -1)
    {
      *(_DWORD *)(a2 + 8) = 0;
    }
    else
    {
      double v3 = a3 - *(double *)(result + 8);
      float v4 = (float)((float)*(__int16 *)(a2 + 6) / 100.0) - *(float *)(result + 72);
      int v5 = (int)((float)((float)((float)((float)*(__int16 *)(a2 + 4) / 100.0) - *(float *)(result + 68)) * 8.0) / v3);
      *(_WORD *)(a2 + 8) = v5;
      double v6 = (float)(v4 * 8.0) / v3;
      *(_WORD *)(a2 + 10) = (int)v6;
      if (!(v5 | (int)v6)) {
        *(_WORD *)(a2 + 8) = 1;
      }
    }
  }
  return result;
}

uint64_t mt_CalculateMTPreciseContactVelocity(uint64_t result, uint64_t a2, double a3)
{
  if (result && a2)
  {
    if (*(unsigned __int8 *)(a2 + 1) - 7 < 0xFFFFFFFD
      || *(float *)(a2 + 12) == 3.4028e38 && *(float *)(a2 + 16) == 3.4028e38)
    {
      *(_DWORD *)(a2 + 12) = 0;
      *(_DWORD *)(a2 + 16) = 0;
    }
    else
    {
      float32x2_t v3 = (float32x2_t)vdup_n_s32(0x447A0000u);
      float32x2_t v4 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(vmul_f32(vsub_f32(vdiv_f32(*(float32x2_t *)(a2 + 4), v3), *(float32x2_t *)(result + 68)), v3)), (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3 - *(double *)(result + 8)), 0)));
      *(float32x2_t *)(a2 + 12) = v4;
      if (v4.f32[0] == 0.0 && v4.f32[1] == 0.0) {
        *(_DWORD *)(a2 + 12) = 1123680256;
      }
    }
  }
  return result;
}

float mt_FillMTContactDirectFromBinary(unsigned __int16 *a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, char a5, double a6)
{
  if (a1 && a2 && a3)
  {
    double v10 = *(double *)(a2 + 8);
    unsigned int v9 = *(_DWORD *)(a2 + 20);
    *(void *)a2 = a4;
    *(double *)(a2 + 8) = a6;
    a6 = a6 - v10;
    WORD1(v10) = 18350;
    if (a6 < 0.04 && v9 < 5 && v9 > 2 && a3[1] == 0) {
      int v14 = 7;
    }
    else {
      int v14 = a3[1];
    }
    *(_DWORD *)(a2 + 16) = *a3;
    *(_DWORD *)(a2 + 20) = v14;
    int v15 = (char)a3[3];
    *(_DWORD *)(a2 + 24) = a3[2];
    *(_DWORD *)(a2 + 28) = v15;
    LOWORD(a6) = *((_WORD *)a3 + 13);
    float v16 = (float)LODWORD(a6);
    LOWORD(v10) = *((_WORD *)a3 + 9);
    *(float *)(a2 + 48) = (float)LODWORD(v10) * 0.0039062;
    *(float *)(a2 + 52) = v16;
    LOWORD(v16) = *((_WORD *)a3 + 10);
    HIWORD(v17) = 14336;
    *(float *)(a2 + 88) = (float)((float)*((__int16 *)a3 + 12) * 3.1416) * 0.000030518;
    *(float *)(a2 + 92) = (float)LODWORD(v16) * 0.0039062;
    float v18 = (float)(2 * *((__int16 *)a3 + 4));
    float v19 = (float)(2 * *((__int16 *)a3 + 5));
    *(float *)(a2 + 76) = v18 * 0.0625;
    *(float *)(a2 + 80) = v19 * 0.0625;
    double v20 = (float)(v18 / 160.0) * 1000.0;
    int v21 = (__int16)a1[1];
    *(float *)&a6 = (float)((__int16)*a1 - v21);
    *(float *)&double v20 = v20 / *(float *)&a6;
    int v22 = (__int16)a1[3];
    float v23 = (float)((__int16)a1[2] - v22);
    float v24 = (float)(v19 / 160.0) * 1000.0 / v23;
    *(_DWORD *)(a2 + 40) = LODWORD(v20);
    *(float *)(a2 + 44) = v24;
    *(float *)&unsigned int v25 = (float)((float)*((__int16 *)a3 + 8) * 3.1416) * 0.000030518;
    LOWORD(v17) = *((_WORD *)a3 + 6);
    *(float *)(a2 + 56) = *(float *)&v25;
    *(float *)(a2 + 60) = (float)v17 / 100.0;
    LOWORD(v25) = *((_WORD *)a3 + 7);
    *(float *)(a2 + 64) = (float)v25 / 100.0;
    unsigned int v26 = *((unsigned __int16 *)a3 + 2);
    unsigned int v27 = *((unsigned __int16 *)a3 + 3);
    if ((a5 & 1) == 0)
    {
      unsigned int v26 = alg_ClipPosPointToScreenEdge(v26 | (v27 << 16), a1);
      unsigned int v27 = HIWORD(v26);
      int v21 = (__int16)a1[1];
      int v22 = (__int16)a1[3];
      *(float *)&a6 = (float)((__int16)*a1 - v21);
      float v23 = (float)((__int16)a1[2] - v22);
    }
    *(float *)(a2 + 68) = (float)(__int16)v26 / 100.0;
    *(float *)(a2 + 72) = (float)(__int16)v27 / 100.0;
    *(float *)&a6 = (float)((__int16)v26 - v21) / *(float *)&a6;
    *(_DWORD *)(a2 + 32) = LODWORD(a6);
    *(float *)(a2 + 36) = (float)((__int16)v27 - v22) / v23;
    *(_WORD *)(a2 + 84) = *((_WORD *)a3 + 14);
  }
  return *(float *)&a6;
}

unsigned __int16 mt_FillMTContactDirectFromPrecise@<H0>(__int16 *a1@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X3>, __n128 a5@<Q0>)
{
  if (a1 && a2 && a3)
  {
    double v5 = *(double *)(a2 + 8);
    unsigned int v6 = *(_DWORD *)(a2 + 20);
    *(void *)a2 = a4;
    *(void *)(a2 + 8) = a5.n128_u64[0];
    if (a5.n128_f64[0] - v5 < 0.04 && v6 < 5 && v6 > 2 && a3[1] == 0) {
      int v10 = 7;
    }
    else {
      int v10 = a3[1];
    }
    *(_DWORD *)(a2 + 16) = *a3;
    *(_DWORD *)(a2 + 20) = v10;
    int v11 = (char)a3[3];
    *(_DWORD *)(a2 + 24) = a3[2];
    *(_DWORD *)(a2 + 28) = v11;
    int v13 = *((_DWORD *)a3 + 9);
    int v12 = *((_DWORD *)a3 + 10);
    *(_DWORD *)(a2 + 48) = *((_DWORD *)a3 + 8);
    *(_DWORD *)(a2 + 52) = v12;
    *(_DWORD *)(a2 + 92) = v13;
    float32x4_t v14 = (float32x4_t)vdupq_n_s32(0x447A0000u);
    float32x2_t v15 = vdiv_f32(*(float32x2_t *)(a3 + 12), *(float32x2_t *)v14.f32);
    int v16 = a1[1];
    float v17 = (float)(*a1 - v16);
    *(float32x2_t *)(a2 + 76) = v15;
    float v18 = v17 / 100.0;
    int v19 = a1[3];
    float v20 = (float)(a1[2] - v19) / 100.0;
    *(float *)(a2 + 40) = v15.f32[0] / v18;
    *(float *)(a2 + 44) = v15.f32[1] / v20;
    *(_DWORD *)(a2 + 56) = *((_DWORD *)a3 + 7);
    v21.i64[0] = *(void *)(a3 + 20);
    v21.i64[1] = *(void *)(a3 + 4);
    a5 = (__n128)vdivq_f32(v21, v14);
    *(__n128 *)(a2 + 60) = a5;
    *(float *)(a2 + 32) = (float)(a5.n128_f32[2] - (float)((float)v16 / 100.0)) / v18;
    *(float *)(a2 + 36) = (float)(a5.n128_f32[3] - (float)((float)v19 / 100.0)) / v20;
    *(_DWORD *)(a2 + 88) = 0;
    *(_WORD *)(a2 + 84) = *((_WORD *)a3 + 22);
    a5.n128_u16[0] = *((_WORD *)a3 + 23);
    *(_WORD *)(a2 + 86) = a5.n128_u16[0];
  }
  return a5.n128_u16[0];
}

int *mt_PathLifeCycleFromPreciseContact(uint64_t a1, __int16 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5, double a6)
{
  unsigned int v12 = *a3;
  uint64_t AlgLibStateRef = MTAlg_GetAlgLibStateRef(a1);
  if (!AlgLibStateRef) {
    return 0;
  }
  float32x4_t v14 = (int *)(v12 - 1 >= 0x1F ? AlgLibStateRef + 520 : AlgLibStateRef + 520 + 616 * v12);
  if (!a4) {
    return 0;
  }
  if (a3[1] == 1)
  {
    int v15 = *v14;
    bzero(v14, 0x268uLL);
    *float32x4_t v14 = v15;
    *(_OWORD *)(v14 + 146) = xmmword_2262F0CD0;
    *(_OWORD *)(v14 + 150) = 0u;
  }
  if (*(unsigned char *)(a4 + 10) || MTAlg_AlwaysNeedsVelocityCalculated(a1)) {
    mt_CalculateMTPreciseContactVelocity((uint64_t)(v14 + 2), (uint64_t)a3, a6);
  }
  v16.n128_f64[0] = a6;
  mt_FillMTContactDirectFromPrecise(a2, (uint64_t)(v14 + 2), a3, a5, v16);
  return v14;
}

uint64_t mt_ForwardBinaryContacts(uint64_t a1, unsigned char *a2, uint64_t a3, unint64_t a4)
{
  uint64_t result = MTAlg_GetAlgLibStateRef(a1);
  if (result) {
    uint64_t v8 = (__int16 *)(result + 376);
  }
  else {
    uint64_t v8 = 0;
  }
  if (a2 && result)
  {
    double v9 = (double)a4 / 1000.0;
    if (a2[72])
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      unint64_t v12 = 0;
      uint64_t v13 = 116;
      do
      {
        if (a2[113])
        {
          float32x4_t v14 = mt_PathLifeCycleFromPreciseContact(a1, v8, &a2[v10 + 116], (uint64_t)a2, a3, v9);
          if (v14)
          {
            int v15 = (long long *)(v14 + 2);
            v14[24] = *(_DWORD *)&a2[v10 + 164];
            uint64_t v16 = *v14;
            goto LABEL_14;
          }
        }
        else
        {
          if (!a2[112])
          {
            unsigned int v19 = a2[v11 + 116];
            uint64_t AlgLibStateRef = MTAlg_GetAlgLibStateRef(a1);
            if (!AlgLibStateRef) {
              goto LABEL_16;
            }
            if (v19 - 1 >= 0x1F) {
              float32x4_t v21 = (unsigned int *)(AlgLibStateRef + 520);
            }
            else {
              float32x4_t v21 = (unsigned int *)(AlgLibStateRef + 520 + 616 * v19);
            }
            if (a2[v11 + 117] == 1)
            {
              unsigned int v22 = *v21;
              bzero(v21, 0x268uLL);
              *float32x4_t v21 = v22;
              *(_OWORD *)(v21 + 146) = xmmword_2262F0CD0;
              *(_OWORD *)(v21 + 150) = 0u;
            }
            if (a2[10] || MTAlg_AlwaysNeedsVelocityCalculated(a1)) {
              mt_CalculateMTBinaryContactVelocity((uint64_t)(v21 + 2), (uint64_t)&a2[v11 + 116], v9);
            }
            mt_FillMTContactDirectFromBinary((unsigned __int16 *)v8, (uint64_t)(v21 + 2), &a2[v11 + 116], a3, (a2[76] & 2) != 0, v9);
            uint64_t v16 = *v21;
            uint64_t v17 = v21[7];
            uint64_t v18 = a1;
            int v15 = (long long *)(v21 + 2);
            goto LABEL_15;
          }
          float32x4_t v14 = mt_PathLifeCycleFromPreciseContact(a1, v8, &a2[v13], (uint64_t)a2, a3, v9);
          if (v14)
          {
            uint64_t v16 = *v14;
            int v15 = (long long *)(v14 + 2);
LABEL_14:
            uint64_t v17 = v14[7];
            uint64_t v18 = a1;
LABEL_15:
            MTAlg_IssuePathCallbacks(v18, v16, v17, v15);
          }
        }
LABEL_16:
        ++v12;
        v11 += 30;
        v13 += 48;
        v10 += 60;
      }
      while (v12 < a2[72]);
    }
    mt_CleanupOldPaths(a1, a3, v9);
    return MTAlg_IssueContactFrameCallbacks(a1, a3, v9);
  }
  return result;
}

uint64_t MTDeviceBeginRecordingToFile(uint64_t a1, const char *a2, int a3)
{
  uint64_t result = 3758097090;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 2104))
    {
      if (*(unsigned char *)(a1 + 2096))
      {
        return 3758097093;
      }
      else
      {
        CFDataRef RecordingHeader = _mt_CreateRecordingHeader(a1);
        *(_DWORD *)(a1 + 2092) = a3;
        *(_OWORD *)(a1 + 2136) = 0u;
        if (!RecordingHeader) {
          return 3758097084;
        }
        CFDataRef v8 = RecordingHeader;
        int v9 = open(a2, 1537, 420);
        *(_DWORD *)(a1 + 2112) = v9;
        if ((v9 & 0x80000000) == 0)
        {
          fchmod(v9, 0x1A4u);
          dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 2104), 0xFFFFFFFFFFFFFFFFLL);
          *(unsigned char *)(a1 + 2096) = 1;
          char __buf = 2;
          int Length = CFDataGetLength(v8);
          unint64_t TimeStamp_ms = mt_GetTimeStamp_ms(a1);
          write(*(_DWORD *)(a1 + 2112), &__buf, 1uLL);
          ++*(void *)(a1 + 2144);
          unint64_t v18 = TimeStamp_ms;
          write(*(_DWORD *)(a1 + 2112), &v18, 8uLL);
          *(void *)(a1 + 2144) += 8;
          int v17 = Length;
          write(*(_DWORD *)(a1 + 2112), &v17, 4uLL);
          *(void *)(a1 + 2144) += 4;
          int v12 = *(_DWORD *)(a1 + 2112);
          BytePtr = CFDataGetBytePtr(v8);
          size_t v14 = CFDataGetLength(v8);
          write(v12, BytePtr, v14);
          *(void *)(a1 + 2144) += CFDataGetLength(v8);
          v15.tv_sec = 0xAAAAAAAAAAAAAAAALL;
          v15.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
          *(timespec *)&v16.st_blksize = v15;
          *(timespec *)v16.st_qspare = v15;
          v16.st_birthtimespec = v15;
          *(timespec *)&v16.st_size = v15;
          v16.st_mtimespec = v15;
          v16.st_ctimespec = v15;
          *(timespec *)&v16.st_uid = v15;
          v16.st_atimespec = v15;
          *(timespec *)&v16.st_dev = v15;
          if (!fstat(*(_DWORD *)(a1 + 2112), &v16)) {
            *(void *)(a1 + 2144) = v16.st_size;
          }
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 2104));
          MTRegisterFullFrameCallback(a1, (uint64_t)_mt_RecordingFullFrameCallback, 0);
        }
        CFRelease(v8);
        if ((*(_DWORD *)(a1 + 2112) & 0x80000000) != 0) {
          return 3758097084;
        }
        else {
          return 0;
        }
      }
    }
    else
    {
      return 3758097095;
    }
  }
  return result;
}

CFDataRef _mt_CreateRecordingHeader(uint64_t a1)
{
  CFMutableDictionaryRef properties = 0;
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef Data = 0;
  if (IORegistryEntryCreateCFProperties(*(_DWORD *)(a1 + 16), &properties, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0)) {
    goto LABEL_34;
  }
  if (!CFDictionaryGetValue(properties, @"LocationID"))
  {
    CFMutableDictionaryRef v19 = 0;
    MTDeviceGetDeviceID(a1, &v19);
    unsigned int valuePtr = v19;
    CFNumberRef v4 = CFNumberCreate(v2, kCFNumberSInt32Type, &valuePtr);
    if (v4)
    {
      CFNumberRef v5 = v4;
      CFDictionarySetValue(properties, @"LocationID", v4);
      CFRelease(v5);
    }
  }
  unsigned int valuePtr = -1431655766;
  CFMutableDictionaryRef v19 = 0;
  MTDeviceGetDriverType(a1, &valuePtr);
  *(void *)io_iterator_t iterator = 0;
  io_registry_entry_t Service = MTDeviceGetService(a1);
  char v7 = 0;
  io_registry_entry_t parent = Service;
  if (valuePtr >= 4)
  {
    if (valuePtr == 4)
    {
      IORegistryEntryGetParentEntry(Service, "IOService", &parent);
      char v7 = 1;
      if (parent)
      {
LABEL_7:
        if (!MEMORY[0x22A64C460]())
        {
          do
          {
            uint64_t v8 = IOIteratorNext(iterator[1]);
            if (!v8) {
              break;
            }
            uint64_t v9 = v8;
            if (IOObjectConformsTo(v8, "IOHIDInterface"))
            {
              if (!MEMORY[0x22A64C460](v9, "IOService", iterator) && v19 == 0)
              {
                do
                {
                  io_object_t v11 = IOIteratorNext(iterator[0]);
                  if (!v11) {
                    break;
                  }
                  io_registry_entry_t v12 = v11;
                  if (IOObjectConformsTo(v11, "IOHIDEventService")) {
                    IORegistryEntryCreateCFProperties(v12, &v19, v2, 0);
                  }
                  IOObjectRelease(v12);
                }
                while (!v19);
              }
            }
            IOObjectRelease(v9);
          }
          while (!v19);
        }
      }
    }
  }
  else if (Service)
  {
    goto LABEL_7;
  }
  if (iterator[1]) {
    IOObjectRelease(iterator[1]);
  }
  if (iterator[0]) {
    IOObjectRelease(iterator[0]);
  }
  char v13 = v7 ^ 1;
  if (!parent) {
    char v13 = 1;
  }
  if ((v13 & 1) == 0) {
    IOObjectRelease(parent);
  }
  CFMutableDictionaryRef v14 = v19;
  if (v19)
  {
    CFDictionarySetValue(properties, @"Event Driver Properties", v19);
    CFRelease(v14);
  }
  CFDataRef Data = CFPropertyListCreateData(v2, properties, kCFPropertyListBinaryFormat_v1_0, 0, 0);
LABEL_34:
  if (properties) {
    CFRelease(properties);
  }
  return Data;
}

intptr_t _mt_RecordingFullFrameCallback(uint64_t a1, const void *a2, unsigned int a3)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 2104), 0xFFFFFFFFFFFFFFFFLL);
  if (*(unsigned char *)(a1 + 2096))
  {
    unsigned int __buf = a3;
    *(void *)bytes = mt_GetTimeStamp_ms(a1);
    UInt8 v9 = 0;
    int v6 = *(_DWORD *)(a1 + 2112);
    if ((v6 & 0x80000000) == 0)
    {
      write(v6, &__buf, 4uLL);
      write(*(_DWORD *)(a1 + 2112), bytes, 8uLL);
      write(*(_DWORD *)(a1 + 2112), &v9, 1uLL);
      write(*(_DWORD *)(a1 + 2112), a2, a3);
    }
    char v7 = *(__CFData **)(a1 + 2120);
    if (v7)
    {
      CFDataAppendBytes(v7, (const UInt8 *)&__buf, 4);
      CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 2120), bytes, 8);
      CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 2120), &v9, 1);
      CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 2120), (const UInt8 *)a2, a3);
    }
    ++*(void *)(a1 + 2136);
    _mt_truncateRecordingIfNeeded(a1);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 2104));
}

uint64_t MTDeviceBeginRecordingToData(uint64_t a1, const void *a2, int a3)
{
  uint64_t result = 3758097090;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 2104))
    {
      if (*(unsigned char *)(a1 + 2096))
      {
        return 3758097093;
      }
      else
      {
        CFDataRef RecordingHeader = _mt_CreateRecordingHeader(a1);
        *(_DWORD *)(a1 + 2092) = a3;
        *(_OWORD *)(a1 + 2136) = 0u;
        if (RecordingHeader)
        {
          CFDataRef v8 = RecordingHeader;
          dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 2104), 0xFFFFFFFFFFFFFFFFLL);
          CFRetain(a2);
          *(void *)(a1 + 2120) = a2;
          *(unsigned char *)(a1 + 2096) = 1;
          UInt8 bytes = 2;
          int Length = CFDataGetLength(v8);
          unint64_t TimeStamp_ms = mt_GetTimeStamp_ms(a1);
          CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 2120), &bytes, 1);
          *(void *)timespec v15 = TimeStamp_ms;
          CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 2120), v15, 8);
          *(_DWORD *)CFMutableDictionaryRef v14 = Length;
          CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 2120), v14, 4);
          io_object_t v11 = *(__CFData **)(a1 + 2120);
          BytePtr = CFDataGetBytePtr(v8);
          CFIndex v13 = CFDataGetLength(v8);
          CFDataAppendBytes(v11, BytePtr, v13);
          *(void *)(a1 + 2144) = CFDataGetLength(*(CFDataRef *)(a1 + 2120));
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 2104));
          MTRegisterFullFrameCallback(a1, (uint64_t)_mt_RecordingFullFrameCallback, 0);
          CFRelease(v8);
          return 0;
        }
        else
        {
          return 3758097084;
        }
      }
    }
    else
    {
      return 3758097095;
    }
  }
  return result;
}

uint64_t MTDeviceEndRecording(uint64_t a1)
{
  uint64_t result = 3758097090;
  if (a1)
  {
    if (*(void *)(a1 + 2104))
    {
      if (*(unsigned char *)(a1 + 2096))
      {
        dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 2104), 0xFFFFFFFFFFFFFFFFLL);
        _mt_truncateRecordingIfNeeded(a1);
        *(unsigned char *)(a1 + 2096) = 0;
        MTUnregisterFullFrameCallback(a1, (uint64_t)_mt_RecordingFullFrameCallback);
        float32x2_t v3 = *(const void **)(a1 + 2120);
        if (v3)
        {
          CFRelease(v3);
          *(void *)(a1 + 2120) = 0;
        }
        int v4 = *(_DWORD *)(a1 + 2112);
        if ((v4 & 0x80000000) == 0)
        {
          close(v4);
          *(_DWORD *)(a1 + 2112) = -1;
        }
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 2104));
        return 0;
      }
      else
      {
        return 3758097101;
      }
    }
    else
    {
      return 3758097095;
    }
  }
  return result;
}

void _mt_truncateRecordingIfNeeded(uint64_t a1)
{
  CFAllocatorRef v2 = *(__CFData **)(a1 + 2120);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 2128);
    if (v3)
    {
      if (*(void *)(a1 + 2136) >= (unint64_t)(2 * v3))
      {
        MutableBytePtr = CFDataGetMutableBytePtr(v2);
        v5.locatiouint64_t n = *(void *)(a1 + 2144);
        unint64_t v6 = *(void *)(a1 + 2136);
        unint64_t v7 = *(void *)(a1 + 2128);
        if (v6 <= v7)
        {
          v5.length = 0;
        }
        else
        {
          v5.length = 0;
          do
          {
            v5.length += *(unsigned int *)&MutableBytePtr[v5.location + v5.length] + 13;
            --v6;
          }
          while (v6 > v7);
        }
        CFDataDeleteBytes(*(CFMutableDataRef *)(a1 + 2120), v5);
        *(void *)(a1 + 2136) = *(void *)(a1 + 2128);
      }
    }
  }
}

intptr_t MTDeviceMarkRecording(intptr_t result, const char *a2)
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(unsigned char *)(result + 2096))
    {
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(result + 2104), 0xFFFFFFFFFFFFFFFFLL);
      if (!a2) {
        a2 = "";
      }
      if (*(unsigned char *)(v2 + 2096))
      {
        int v4 = strlen(a2);
        size_t v5 = (v4 + 1);
        int __buf = v4 + 1;
        *(void *)UInt8 bytes = mt_GetTimeStamp_ms(v2);
        UInt8 v8 = 1;
        int v6 = *(_DWORD *)(v2 + 2112);
        if (v6)
        {
          write(v6, &__buf, 4uLL);
          write(*(_DWORD *)(v2 + 2112), bytes, 8uLL);
          write(*(_DWORD *)(v2 + 2112), &v8, 1uLL);
          write(*(_DWORD *)(v2 + 2112), a2, v5);
        }
        unint64_t v7 = *(__CFData **)(v2 + 2120);
        if (v7)
        {
          CFDataAppendBytes(v7, (const UInt8 *)&__buf, 4);
          CFDataAppendBytes(*(CFMutableDataRef *)(v2 + 2120), bytes, 8);
          CFDataAppendBytes(*(CFMutableDataRef *)(v2 + 2120), &v8, 1);
          CFDataAppendBytes(*(CFMutableDataRef *)(v2 + 2120), (const UInt8 *)a2, v5);
        }
      }
      return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 2104));
    }
  }
  return result;
}

NSObject *MTDeviceSetRecordingDesiredFrameCount(NSObject *result, uint64_t a2)
{
  if (result)
  {
    uint64_t v2 = (uint64_t)result;
    uint64_t result = result[263].isa;
    if (result)
    {
      dispatch_semaphore_wait(result, 0xFFFFFFFFFFFFFFFFLL);
      *(void *)(v2 + 2128) = a2;
      if (*(unsigned char *)(v2 + 2096)) {
        _mt_truncateRecordingIfNeeded(v2);
      }
      int v4 = *(NSObject **)(v2 + 2104);
      return dispatch_semaphore_signal(v4);
    }
  }
  return result;
}

NSObject *MTDeviceSetMaxRecordingLength(NSObject *a1, uint64_t a2)
{
  return MTDeviceSetRecordingDesiredFrameCount(a1, 60 * a2);
}

CFDataRef MTPlayerCreateFromData(CFDataRef theData, char a2)
{
  CFDataRef v2 = theData;
  uint64_t v146 = *MEMORY[0x263EF8340];
  if (!theData) {
    return v2;
  }
  BytePtr = CFDataGetBytePtr(theData);
  unsigned int v5 = CFDataGetLength(v2);
  unsigned int v6 = v5;
  if (!v5) {
    return 0;
  }
  int v7 = *BytePtr;
  unsigned int v8 = v5 - 1;
  if (v7 != 2)
  {
    if (v7 == 1)
    {
      int8x16_t v9 = 0uLL;
      memset(__src, 0, sizeof(__src));
      if (v8 >= 0x21C)
      {
        long long v94 = 0uLL;
        memset(length, 0, 240);
        long long valuePtr = 0uLL;
        long long v100 = 0uLL;
        long long v101 = 0uLL;
        long long v102 = 0uLL;
        long long v103 = 0uLL;
        long long v104 = 0uLL;
        long long v105 = 0uLL;
        long long v106 = 0uLL;
        long long v107 = 0uLL;
        long long v108 = 0uLL;
        long long v109 = 0uLL;
        long long v110 = 0uLL;
        long long v111 = 0uLL;
        long long v112 = 0uLL;
        long long v113 = 0uLL;
        unsigned int v10 = v5 - 13;
        int v93 = *(_DWORD *)(BytePtr + 1);
        if (v5 - 13 >= 0x21C)
        {
          int8x16_t v9 = *(int8x16_t *)(BytePtr + 13);
          unsigned int v12 = *(_DWORD *)(BytePtr + 29);
          long long v18 = *(_OWORD *)(BytePtr + 241);
          *(_OWORD *)&length[176] = *(_OWORD *)(BytePtr + 225);
          *(_OWORD *)&length[192] = v18;
          long long v19 = *(_OWORD *)(BytePtr + 177);
          *(_OWORD *)&length[112] = *(_OWORD *)(BytePtr + 161);
          *(_OWORD *)&length[128] = v19;
          long long v20 = *(_OWORD *)(BytePtr + 209);
          *(_OWORD *)&length[144] = *(_OWORD *)(BytePtr + 193);
          *(_OWORD *)&length[160] = v20;
          long long v21 = *(_OWORD *)(BytePtr + 113);
          *(_OWORD *)&length[48] = *(_OWORD *)(BytePtr + 97);
          *(_OWORD *)&length[64] = v21;
          long long v22 = *(_OWORD *)(BytePtr + 145);
          *(_OWORD *)&length[80] = *(_OWORD *)(BytePtr + 129);
          *(_OWORD *)&length[96] = v22;
          long long v23 = *(_OWORD *)(BytePtr + 49);
          long long v94 = *(_OWORD *)(BytePtr + 33);
          *(_OWORD *)length = v23;
          long long v24 = *(_OWORD *)(BytePtr + 81);
          *(_OWORD *)&length[16] = *(_OWORD *)(BytePtr + 65);
          *(_OWORD *)&length[32] = v24;
          long long v25 = *(_OWORD *)(BytePtr + 273);
          *(_OWORD *)&length[208] = *(_OWORD *)(BytePtr + 257);
          *(_OWORD *)&length[224] = v25;
          unsigned int v13 = *(_DWORD *)(BytePtr + 289);
          long long v26 = *(_OWORD *)(BytePtr + 501);
          long long v111 = *(_OWORD *)(BytePtr + 485);
          long long v112 = v26;
          long long v113 = *(_OWORD *)(BytePtr + 517);
          long long v27 = *(_OWORD *)(BytePtr + 437);
          long long v107 = *(_OWORD *)(BytePtr + 421);
          long long v108 = v27;
          long long v28 = *(_OWORD *)(BytePtr + 469);
          long long v109 = *(_OWORD *)(BytePtr + 453);
          long long v110 = v28;
          long long v29 = *(_OWORD *)(BytePtr + 373);
          long long v103 = *(_OWORD *)(BytePtr + 357);
          long long v104 = v29;
          long long v30 = *(_OWORD *)(BytePtr + 405);
          long long v105 = *(_OWORD *)(BytePtr + 389);
          long long v106 = v30;
          long long v31 = *(_OWORD *)(BytePtr + 309);
          long long valuePtr = *(_OWORD *)(BytePtr + 293);
          long long v100 = v31;
          long long v32 = *(_OWORD *)(BytePtr + 341);
          long long v101 = *(_OWORD *)(BytePtr + 325);
          long long v102 = v32;
          int v11 = BytePtr[533];
          CFMutableDictionaryRef v14 = BytePtr + 553;
          unsigned int v10 = v5 - 553;
          if (*(_DWORD *)(BytePtr + 549) == -1)
          {
            int8x16_t v9 = vrev32q_s8(v9);
            unsigned int v12 = bswap32(v12);
            unsigned int v13 = bswap32(v13);
          }
          int v90 = *(_DWORD *)(BytePtr + 549);
        }
        else
        {
          int v90 = 0;
          int v11 = 0;
          unsigned int v12 = 0;
          unsigned int v13 = 0;
          CFMutableDictionaryRef v14 = BytePtr + 13;
        }
        long long v142 = *(_OWORD *)&length[176];
        long long v143 = *(_OWORD *)&length[192];
        long long v144 = *(_OWORD *)&length[208];
        long long v145 = *(_OWORD *)&length[224];
        long long v138 = *(_OWORD *)&length[112];
        long long v139 = *(_OWORD *)&length[128];
        long long v140 = *(_OWORD *)&length[144];
        long long v141 = *(_OWORD *)&length[160];
        long long v134 = *(_OWORD *)&length[48];
        long long v135 = *(_OWORD *)&length[64];
        long long v136 = *(_OWORD *)&length[80];
        long long v137 = *(_OWORD *)&length[96];
        long long v130 = v94;
        long long v131 = *(_OWORD *)length;
        long long v132 = *(_OWORD *)&length[16];
        long long v133 = *(_OWORD *)&length[32];
        long long v127 = v111;
        long long v128 = v112;
        long long v129 = v113;
        long long v123 = v107;
        long long v124 = v108;
        long long v126 = v110;
        long long v125 = v109;
        long long v119 = v103;
        long long v120 = v104;
        long long v122 = v106;
        long long v121 = v105;
        long long v115 = valuePtr;
        long long v116 = v100;
        BOOL v33 = v10 > 0x1FF && v11 == 1;
        int v34 = v33;
        long long v118 = v102;
        long long v117 = v101;
        int v92 = v34;
        *(int8x16_t *)UInt8 bytes = v9;
        if (v33)
        {
          long long v89 = *(_OWORD *)v14;
          v14 += 512;
          v10 -= 512;
          memset(__src, 0, sizeof(__src));
        }
        else
        {
          long long v89 = 0u;
        }
        CFAllocatorRef v35 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFMutableArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        long long v94 = *(_OWORD *)bytes;
        *(_OWORD *)&length[244] = v145;
        *(_OWORD *)&length[196] = v142;
        *(_DWORD *)length = v12;
        *(_OWORD *)&length[212] = v143;
        *(_OWORD *)&length[228] = v144;
        *(_OWORD *)&length[132] = v138;
        *(_OWORD *)&length[148] = v139;
        *(_OWORD *)&length[164] = v140;
        *(_OWORD *)&length[180] = v141;
        *(_OWORD *)&length[68] = v134;
        *(_OWORD *)&length[84] = v135;
        *(_OWORD *)&length[100] = v136;
        *(_OWORD *)&length[116] = v137;
        *(_OWORD *)&length[4] = v130;
        *(_OWORD *)&length[20] = v131;
        *(_OWORD *)&length[36] = v132;
        *(_OWORD *)&length[52] = v133;
        *(_DWORD *)&length[260] = v13;
        *(_OWORD *)&length[456] = v127;
        *(_OWORD *)&length[472] = v128;
        *(_OWORD *)&length[488] = v129;
        *(_OWORD *)&length[392] = v123;
        *(_OWORD *)&length[408] = v124;
        *(_OWORD *)&length[424] = v125;
        *(_OWORD *)&length[440] = v126;
        *(_OWORD *)&length[328] = v119;
        *(_OWORD *)&length[344] = v120;
        *(_OWORD *)&length[360] = v121;
        *(_OWORD *)&length[376] = v122;
        *(_OWORD *)&length[264] = v115;
        *(_OWORD *)&length[280] = v116;
        *(_OWORD *)&length[296] = v117;
        *(_OWORD *)&length[312] = v118;
        char v96 = v11;
        memset(v97, 0, sizeof(v97));
        int v98 = v90;
        *(void *)&long long valuePtr = 2880294925;
        CFNumberRef v37 = CFNumberCreate(v35, kCFNumberSInt64Type, &valuePtr);
        if (v37)
        {
          CFNumberRef v38 = v37;
          CFDictionarySetValue(Mutable, @"LocationID", v37);
          CFRelease(v38);
        }
        CFDictionarySetValue(Mutable, @"Transport", @"Dummy");
        CFDictionarySetValue(Mutable, @"HIDServiceSupport", (const void *)*MEMORY[0x263EFFB40]);
        unsigned int v39 = CFDictionaryCreateMutable(v35, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        if (v39)
        {
          unsigned int v40 = v39;
          CFDictionaryAddValue(v39, @"0516B563-B15B-11DA-96EB-0014519758EF", @"AppleMultitouchDriver.kext/Contents/PlugIns/MultitouchHID.plugin");
          CFDictionarySetValue(Mutable, @"IOCFPlugInTypes", v40);
          CFRelease(v40);
        }
        CFNumberRef v41 = CFNumberCreate(v35, kCFNumberSInt32Type, &v94);
        if (v41)
        {
          CFNumberRef v42 = v41;
          CFDictionarySetValue(Mutable, @"Family ID", v41);
          CFRelease(v42);
        }
        CFNumberRef v43 = CFNumberCreate(v35, kCFNumberSInt32Type, (char *)&v94 + 4);
        if (v43)
        {
          CFNumberRef v44 = v43;
          CFDictionarySetValue(Mutable, @"Sensor Rows", v43);
          CFRelease(v44);
        }
        CFNumberRef v45 = CFNumberCreate(v35, kCFNumberSInt32Type, (char *)&v94 + 8);
        if (v45)
        {
          CFNumberRef v46 = v45;
          CFDictionarySetValue(Mutable, @"Sensor Columns", v45);
          CFRelease(v46);
        }
        CFNumberRef v47 = CFNumberCreate(v35, kCFNumberSInt32Type, (const void *)((unint64_t)&v94 | 0xC));
        if (v47)
        {
          CFNumberRef v48 = v47;
          CFDictionarySetValue(Mutable, @"bcdVersion", v47);
          CFRelease(v48);
        }
        CFDataRef v49 = CFDataCreate(v35, &length[4], *(unsigned int *)length);
        if (v49)
        {
          CFDataRef v50 = v49;
          CFDictionarySetValue(Mutable, @"Sensor Region Descriptor", v49);
          CFRelease(v50);
        }
        CFDataRef v51 = CFDataCreate(v35, &length[264], *(unsigned int *)&length[260]);
        if (v51)
        {
          CFDataRef v52 = v51;
          CFDictionarySetValue(Mutable, @"Sensor Region Param", v51);
          CFRelease(v52);
        }
        if (v92)
        {
          long long v94 = v89;
          memcpy(length, __src, 0x1F0uLL);
          CFNumberRef v53 = CFNumberCreate(v35, kCFNumberSInt32Type, &v94);
          if (v53)
          {
            CFNumberRef v54 = v53;
            CFDictionarySetValue(Mutable, @"Sensor Surface Width", v53);
            CFRelease(v54);
          }
          CFNumberRef v55 = CFNumberCreate(v35, kCFNumberSInt32Type, (char *)&v94 + 4);
          if (v55)
          {
            CFNumberRef v56 = v55;
            CFDictionarySetValue(Mutable, @"Sensor Surface Height", v55);
            CFRelease(v56);
          }
          CFNumberRef v57 = CFNumberCreate(v35, kCFNumberSInt32Type, (char *)&v94 + 8);
          if (v57)
          {
            CFNumberRef v58 = v57;
            CFDictionarySetValue(Mutable, @"parser-type", v57);
            CFRelease(v58);
          }
          CFNumberRef v59 = CFNumberCreate(v35, kCFNumberSInt32Type, (const void *)((unint64_t)&v94 | 0xC));
          if (v59)
          {
            CFNumberRef v60 = v59;
            CFDictionarySetValue(Mutable, @"parser-options", v59);
            CFRelease(v60);
          }
        }
        CFDataRef v2 = (CFDataRef)MTPlayerCreate(Mutable, a2);
        CFRelease(Mutable);
        if (v2)
        {
          if (v10 >= 8 && (v10 & 0xFFFFFFFC) != 8)
          {
            unint64_t v61 = 0;
            do
            {
              unsigned int v62 = *((_DWORD *)v14 + 2);
              unsigned int v63 = v10 - 12;
              unint64_t v64 = bswap64(*(void *)v14);
              unsigned int v65 = bswap32(v62);
              if (v93 == -1) {
                unint64_t v66 = v64;
              }
              else {
                unint64_t v66 = *(void *)v14;
              }
              if (v93 == -1) {
                size_t v67 = v65;
              }
              else {
                size_t v67 = v62;
              }
              unsigned int v10 = v63 - v67;
              if (v63 < v67) {
                break;
              }
              long long v68 = malloc_type_malloc(0x28uLL, 0x1030040B1B30B78uLL);
              v68[28] = 0;
              *(void *)long long v68 = 0;
              *((void *)v68 + 1) = *((void *)v2 + 7);
              long long v69 = malloc_type_malloc(v67, 0x3FE07F93uLL);
              *((void *)v68 + 2) = v69;
              memcpy(v69, v14 + 12, v67);
              *((_DWORD *)v68 + 6) = v67;
              if (*((void *)v2 + 6))
              {
                double v70 = (double)(v66 - v61) / 1000.0;
              }
              else
              {
                unint64_t v61 = (unint64_t)((double)v66 / 1000.0);
                double v70 = (double)v61;
                *((void *)v2 + 6) = v68;
              }
              *((double *)v68 + 4) = v70;
              long long v71 = (void *)*((void *)v2 + 7);
              if (v71) {
                *long long v71 = v68;
              }
              *((void *)v2 + 7) = v68;
              if (v10 < 8) {
                break;
              }
              v14 += v67 + 12;
            }
            while ((v10 & 0xFFFFFFFC) != 8);
          }
LABEL_73:
          *((void *)v2 + 8) = *((void *)v2 + 6);
          return v2;
        }
        return v2;
      }
    }
    return 0;
  }
  CFDataRef v2 = 0;
  if (v5 < 9) {
    return v2;
  }
  if ((v8 & 0xFFFFFFFC) == 8) {
    return v2;
  }
  size_t v15 = *(unsigned int *)(BytePtr + 9);
  CFDataRef v16 = (const __CFData *)malloc_type_malloc(v15, 0x3B9331C7uLL);
  CFDataRef v2 = v16;
  if (!v16) {
    return v2;
  }
  unsigned int v17 = v6 - 13;
  if (v6 - 13 < v15)
  {
    free(v16);
    return 0;
  }
  long long v72 = (char *)(BytePtr + 13);
  memcpy(v16, v72, v15);
  CFAllocatorRef v73 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef v74 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)v2, v15);
  if (!v74) {
    return 0;
  }
  CFDataRef v75 = v74;
  CFDictionaryRef v76 = (const __CFDictionary *)CFPropertyListCreateWithData(v73, v74, 2uLL, 0, 0);
  CFRelease(v75);
  free(v2);
  if (!v76) {
    return 0;
  }
  CFDataRef v2 = (CFDataRef)MTPlayerCreate(v76, a2);
  CFRelease(v76);
  if (v2)
  {
    unsigned int v77 = v17 - v15;
    if (v17 - v15 >= 4)
    {
      uint64_t v79 = 0;
      uint64_t v80 = &v72[v15];
      do
      {
        if (v77 - 4 < 8) {
          break;
        }
        if (v77 == 12) {
          break;
        }
        size_t v81 = *(unsigned int *)v80;
        unsigned int v82 = v77 - 13;
        unsigned int v77 = v77 - 13 - v81;
        if (v82 < v81) {
          break;
        }
        uint64_t v83 = *(void *)(v80 + 4);
        char v84 = v80[12];
        v85 = v80 + 13;
        v86 = malloc_type_malloc(0x28uLL, 0x1030040B1B30B78uLL);
        v86[28] = v84;
        *(void *)v86 = 0;
        *((void *)v86 + 1) = *((void *)v2 + 7);
        uint64_t v87 = malloc_type_malloc(v81, 0x14DBD39AuLL);
        *((void *)v86 + 2) = v87;
        memcpy(v87, v85, v81);
        *((_DWORD *)v86 + 6) = v81;
        if (!*((void *)v2 + 6))
        {
          *((void *)v2 + 6) = v86;
          uint64_t v79 = v83;
        }
        *((double *)v86 + 4) = (double)(unint64_t)(v83 - v79) / 1000.0;
        v88 = (void *)*((void *)v2 + 7);
        if (v88) {
          void *v88 = v86;
        }
        uint64_t v80 = &v85[v81];
        *((void *)v2 + 7) = v86;
      }
      while (v77 > 3);
    }
    goto LABEL_73;
  }
  return v2;
}

CFDataRef MTPlayerCreateFromFile(const char *a1, char a2)
{
  int v3 = open(a1, 0);
  if (v3 < 0) {
    return 0;
  }
  int v4 = v3;
  v5.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v5.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v12.st_blksize = v5;
  *(timespec *)v12.st_qspare = v5;
  v12.st_birthtimespec = v5;
  *(timespec *)&v12.st_size = v5;
  v12.st_mtimespec = v5;
  v12.st_ctimespec = v5;
  *(timespec *)&v12.st_uid = v5;
  v12.st_atimespec = v5;
  *(timespec *)&v12.st_dev = v5;
  if (fstat(v3, &v12) || (int v7 = (const UInt8 *)mmap(0, v12.st_size, 1, 2, v4, 0), v7 == (const UInt8 *)-1))
  {
    CFDataRef v6 = 0;
  }
  else
  {
    unsigned int v8 = (UInt8 *)v7;
    CFDataRef v9 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], v7, v12.st_size, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
    if (v9)
    {
      CFDataRef v10 = v9;
      CFDataRef v6 = MTPlayerCreateFromData(v9, a2);
      CFRelease(v10);
    }
    else
    {
      CFDataRef v6 = 0;
    }
    munmap(v8, v12.st_size);
  }
  close(v4);
  return v6;
}

uint64_t MTPlayerLoad(uint64_t a1)
{
  if (!a1) {
    return 3758097090;
  }
  if (*(_DWORD *)(a1 + 112)) {
    return 3758097093;
  }
  io_iterator_t existing = -1431655766;
  CFDictionaryRef v4 = IOServiceMatching("AppleMultitouchDummyV2");
  if (!v4) {
    return 3758097084;
  }
  uint64_t v2 = 3758097084;
  if (!IOServiceGetMatchingServices(0, v4, &existing))
  {
    if (*(_DWORD *)(a1 + 112))
    {
      IOObjectRelease(existing);
LABEL_10:
      if (!*(_DWORD *)(a1 + 112)) {
        return 3758097086;
      }
      timespec v5 = *(void (**)(uint64_t, uint64_t, void, void))(a1 + 136);
      if (v5) {
        v5(a1, 3, 0, *(void *)(a1 + 144));
      }
      return 0;
    }
    io_object_t v6 = IOIteratorNext(existing);
    if (v6)
    {
      io_service_t v7 = v6;
      CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFDataRef v9 = (task_port_t *)MEMORY[0x263EF8960];
      CFDataRef v10 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
      int v11 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
      do
      {
        connect[0] = 0;
        uint64_t v2 = IOServiceOpen(v7, *v9, 0, connect);
        if (!v2)
        {
          *(_DWORD *)(a1 + 112) = connect[0];
          CFMutableArrayRef Mutable = CFDictionaryCreateMutable(v8, 0, v10, v11);
          if (!Mutable
            || (unsigned int v13 = Mutable,
                CFDictionarySetValue(Mutable, @"Multitouch Properties", *(const void **)(a1 + 16)),
                uint64_t v2 = IOConnectSetCFProperties(*(_DWORD *)(a1 + 112), v13),
                CFRelease(v13),
                !v2))
          {
            uint64_t v24 = 0;
            uint64_t v25 = 0;
            uint64_t NotificationPort = IODataQueueAllocateNotificationPort();
            if (NotificationPort)
            {
              unsigned int v15 = NotificationPort;
              if (!MEMORY[0x22A64C320](*(unsigned int *)(a1 + 112), 32, NotificationPort, 0)
                && !MEMORY[0x22A64C300](*(unsigned int *)(a1 + 112), 32, *v9, &v25, &v24, 1))
              {
                uint64_t v16 = v25;
                unsigned int v17 = dispatch_source_create(MEMORY[0x263EF83C8], v15, 0, *(dispatch_queue_t *)(a1 + 24));
                *(void *)(a1 + 128) = v17;
                handler[0] = MEMORY[0x263EF8330];
                handler[1] = 0x40000000;
                handler[2] = __mt_PlayerLoadForService_block_invoke;
                handler[3] = &__block_descriptor_tmp_73;
                handler[4] = a1;
                void handler[5] = v25;
                unsigned int v23 = v15;
                dispatch_source_set_cancel_handler(v17, handler);
                long long v18 = *(NSObject **)(a1 + 128);
                v20[0] = MEMORY[0x263EF8330];
                v20[1] = 0x40000000;
                v20[2] = __mt_PlayerLoadForService_block_invoke_2;
                void v20[3] = &__block_descriptor_tmp_76;
                v20[4] = a1;
                v20[5] = v16;
                unsigned int v21 = v15;
                dispatch_source_set_event_handler(v18, v20);
                dispatch_resume(*(dispatch_object_t *)(a1 + 128));
              }
            }
            uint64_t v2 = 0;
          }
        }
        IOObjectRelease(v7);
        if (*(_DWORD *)(a1 + 112)) {
          break;
        }
        io_service_t v7 = IOIteratorNext(existing);
      }
      while (v7);
    }
    else
    {
      uint64_t v2 = 0;
    }
    IOObjectRelease(existing);
    if (!v2) {
      goto LABEL_10;
    }
  }
  return v2;
}

uint64_t MTPlayerUnload(uint64_t a1)
{
  uint64_t result = 3758097090;
  if (a1)
  {
    io_connect_t v3 = *(_DWORD *)(a1 + 112);
    if (v3)
    {
      if (*(void *)(a1 + 128))
      {
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
        dispatch_source_cancel(*(dispatch_source_t *)(a1 + 128));
        dispatch_release(*(dispatch_object_t *)(a1 + 128));
        *(void *)(a1 + 128) = 0;
        io_connect_t v3 = *(_DWORD *)(a1 + 112);
      }
      IOServiceClose(v3);
      *(_DWORD *)(a1 + 112) = 0;
      CFDictionaryRef v4 = *(void (**)(uint64_t, uint64_t, void, void))(a1 + 136);
      if (v4) {
        v4(a1, 4, 0, *(void *)(a1 + 144));
      }
      return 0;
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

uint64_t MTPlayerSetEventCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    *(void *)(result + 136) = a2;
    *(void *)(result + 144) = a3;
  }
  return result;
}

uint64_t MTPlayerSetFramePlaybackCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    *(void *)(result + 152) = a2;
    *(void *)(result + 160) = a3;
  }
  return result;
}

uint64_t MTPlayerSetAnnotationCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    *(void *)(result + 168) = a2;
    *(void *)(result + 176) = a3;
  }
  return result;
}

double MTPlayerGetLength(uint64_t a1)
{
  double result = 0.0;
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 48);
    if (v2)
    {
      uint64_t v3 = *(void *)(a1 + 56);
      if (v3) {
        return *(double *)(v3 + 32) - *(double *)(v2 + 32);
      }
    }
  }
  return result;
}

void mt_PlayerPlaybackTimerHandler(uint64_t a1)
{
  double v2 = *(double *)(a1 + 88);
  double Current = MTAbsoluteTimeGetCurrent();
  if (*(void *)(a1 + 40))
  {
    double v4 = Current;
    double v5 = *(double *)(a1 + 96) + v2 * (Current - *(double *)(a1 + 80));
    uint64_t v6 = *(void *)(a1 + 64);
    if (!v6)
    {
LABEL_22:
      *(void *)(a1 + 64) = 0;
      *(double *)(a1 + 80) = v4;
      *(double *)(a1 + 96) = v5;
      *(double *)(a1 + 104) = v5;
      int v11 = *(NSObject **)(a1 + 24);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = __mt_PlayerPlaybackTimerHandler_block_invoke;
      block[3] = &__block_descriptor_tmp_1;
      block[4] = a1;
      dispatch_async(v11, block);
      return;
    }
    while (1)
    {
      if (v2 > 0.0 && (double v7 = *(double *)(v6 + 32), v7 <= v5))
      {
        if (v7 >= *(double *)(a1 + 96)) {
          goto LABEL_13;
        }
        if (v2 >= 0.0) {
          goto LABEL_19;
        }
      }
      else
      {
        if (v2 >= 0.0 || (double v7 = *(double *)(v6 + 32), v7 < v5))
        {
          *(void *)(a1 + 64) = v6;
          *(double *)(a1 + 80) = v4;
          *(double *)(a1 + 96) = v5;
          *(double *)(a1 + 104) = v5;
          return;
        }
        if (v2 > 0.0 && v7 >= *(double *)(a1 + 96))
        {
LABEL_13:
          if (*(unsigned char *)(v6 + 28) == 1)
          {
            CFDataRef v9 = *(void (**)(uint64_t, void, void))(a1 + 168);
            if (v9) {
              v9(a1, *(void *)(v6 + 16), *(void *)(a1 + 176));
            }
          }
          else if (!*(unsigned char *)(v6 + 28))
          {
            mt_PlayerDispatchFrame(a1, *(const void **)(v6 + 16), *(_DWORD *)(v6 + 24));
            CFAllocatorRef v8 = *(void (**)(uint64_t, void, void, void, double))(a1 + 152);
            if (v8)
            {
              v8(a1, *(void *)(v6 + 16), *(unsigned int *)(v6 + 24), *(void *)(a1 + 160), *(double *)(v6 + 32));
              *(void *)(a1 + 104) = *(void *)(v6 + 32);
            }
          }
          goto LABEL_19;
        }
      }
      if (v7 <= *(double *)(a1 + 96)) {
        goto LABEL_13;
      }
LABEL_19:
      CFDataRef v10 = (uint64_t *)(v6 + 8);
      if (v2 >= 0.0) {
        CFDataRef v10 = (uint64_t *)v6;
      }
      uint64_t v6 = *v10;
      if (!*v10) {
        goto LABEL_22;
      }
    }
  }
}

BOOL MTPlayerIsPlaying(BOOL result)
{
  if (result) {
    return *(void *)(result + 40) != 0;
  }
  return result;
}

uint64_t mt_PlayerDispatchFrame(uint64_t a1, const void *a2, unsigned int a3)
{
  input[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = 3758097101;
  if (*(_DWORD *)(a1 + 112))
  {
    if (*(_DWORD *)(a1 + 116) >= a3)
    {
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 216), 0xFFFFFFFFFFFFFFFFLL);
      memcpy(*(void **)(a1 + 120), a2, a3);
      uint32_t outputCnt = 0;
      mach_port_t v7 = *(_DWORD *)(a1 + 112);
      uint64_t v8 = *(unsigned int *)(a1 + 116);
      input[0] = *(void *)(a1 + 120);
      input[1] = v8;
      input[2] = a3;
      uint64_t v3 = IOConnectCallScalarMethod(v7, 0, input, 3u, 0, &outputCnt);
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 216));
    }
    else
    {
      return 3758097128;
    }
  }
  return v3;
}

uint64_t MTPlayerStop(void *a1)
{
  if (!a1) {
    return 3758097090;
  }
  _doMTPlayerPause((uint64_t)a1);
  a1[12] = 0;
  a1[13] = 0;
  a1[8] = a1[6];
  double v2 = (void (*)(void *, void, void, void))a1[17];
  if (v2) {
    v2(a1, 0, 0, a1[18]);
  }
  return 0;
}

uint64_t MTPlayerPlay(uint64_t a1)
{
  uint64_t result = 3758097090;
  if (a1)
  {
    if (*(void *)(a1 + 40))
    {
      return 3758097093;
    }
    else
    {
      dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
      double Current = MTAbsoluteTimeGetCurrent();
      *(double *)(a1 + 72) = Current;
      *(double *)(a1 + 80) = Current;
      double v4 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *(dispatch_queue_t *)(a1 + 24));
      *(void *)(a1 + 40) = v4;
      dispatch_source_set_timer(v4, 0, 0xF4240uLL, 0);
      double v5 = *(NSObject **)(a1 + 40);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 0x40000000;
      handler[2] = __MTPlayerPlay_block_invoke;
      handler[3] = &__block_descriptor_tmp_4;
      handler[4] = a1;
      dispatch_source_set_event_handler(v5, handler);
      dispatch_resume(*(dispatch_object_t *)(a1 + 40));
      uint64_t v6 = *(void (**)(uint64_t, uint64_t, void, void))(a1 + 136);
      if (v6) {
        v6(a1, 1, 0, *(void *)(a1 + 144));
      }
      return 0;
    }
  }
  return result;
}

void __MTPlayerPlay_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v1 + 24);
  double v2 = *(NSObject **)(v1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __MTPlayerPlay_block_invoke_2;
  block[3] = &__block_descriptor_tmp_3;
  block[4] = v1;
  dispatch_group_async(v2, v3, block);
}

void __MTPlayerPlay_block_invoke_2(uint64_t a1)
{
}

uint64_t MTPlayerPlayNextFrame(void *a1)
{
  uint64_t result = 3758097090;
  if (a1)
  {
    if (a1[5])
    {
      return 3758097093;
    }
    else
    {
      uint64_t v3 = (uint64_t *)a1[8];
      if (v3)
      {
        if (*((unsigned char *)v3 + 28) == 1)
        {
          double v5 = (void (*)(void *, uint64_t, void, double))a1[21];
          if (v5) {
            v5(a1, v3[2], a1[22], *((double *)v3 + 4));
          }
        }
        else if (!*((unsigned char *)v3 + 28))
        {
          mt_PlayerDispatchFrame((uint64_t)a1, (const void *)v3[2], *((_DWORD *)v3 + 6));
          double v4 = (void (*)(void *, uint64_t, void, void, double))a1[19];
          if (v4) {
            v4(a1, v3[2], *((unsigned int *)v3 + 6), a1[20], *((double *)v3 + 4));
          }
        }
        double v6 = *(double *)v3;
        a1[8] = *v3;
        uint64_t v7 = v3[4];
        a1[12] = v7;
        a1[13] = v7;
        if (v6 == 0.0)
        {
          uint64_t v8 = a1[3];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 0x40000000;
          block[2] = __MTPlayerPlayNextFrame_block_invoke;
          block[3] = &__block_descriptor_tmp_5;
          block[4] = a1;
          dispatch_async(v8, block);
        }
        return 0;
      }
      else
      {
        return 3758097128;
      }
    }
  }
  return result;
}

uint64_t __MTPlayerPlayNextFrame_block_invoke(uint64_t a1)
{
  return MTPlayerStop(*(void **)(a1 + 32));
}

uint64_t MTPlayerPlayPreviousFrame(void *a1)
{
  uint64_t result = 3758097128;
  if (!a1) {
    return 3758097090;
  }
  if (a1[5]) {
    return 3758097093;
  }
  uint64_t v3 = a1[8];
  if (v3)
  {
    uint64_t v4 = *(void *)(v3 + 8);
    if (v4)
    {
      double v5 = *(uint64_t **)(v4 + 8);
      if (v5)
      {
        if (*((unsigned char *)v5 + 28) == 1)
        {
          uint64_t v7 = (void (*)(void *, uint64_t, void, double))a1[21];
          if (v7) {
            v7(a1, v5[2], a1[22], *((double *)v5 + 4));
          }
        }
        else if (!*((unsigned char *)v5 + 28))
        {
          mt_PlayerDispatchFrame((uint64_t)a1, (const void *)v5[2], *((_DWORD *)v5 + 6));
          double v6 = (void (*)(void *, uint64_t, void, void, double))a1[19];
          if (v6) {
            v6(a1, v5[2], *((unsigned int *)v5 + 6), a1[20], *((double *)v5 + 4));
          }
        }
        double v8 = *(double *)v5;
        a1[8] = *v5;
        uint64_t v9 = v5[4];
        a1[12] = v9;
        a1[13] = v9;
        if (!*(void *)(*(void *)(*(void *)&v8 + 8) + 8))
        {
          CFDataRef v10 = a1[3];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 0x40000000;
          block[2] = __MTPlayerPlayPreviousFrame_block_invoke;
          block[3] = &__block_descriptor_tmp_6;
          block[4] = a1;
          dispatch_async(v10, block);
        }
        return 0;
      }
    }
  }
  return result;
}

uint64_t __MTPlayerPlayPreviousFrame_block_invoke(uint64_t a1)
{
  return MTPlayerStop(*(void **)(a1 + 32));
}

uint64_t MTPlayerPause(uint64_t a1)
{
  if (!a1) {
    return 3758097090;
  }
  if (!_doMTPlayerPause(a1))
  {
    double v2 = *(void (**)(uint64_t, uint64_t, void, void))(a1 + 136);
    if (v2) {
      v2(a1, 2, 0, *(void *)(a1 + 144));
    }
  }
  return 0;
}

uint64_t _doMTPlayerPause(uint64_t a1)
{
  uint64_t result = 3758097101;
  if (a1)
  {
    if (*(void *)(a1 + 40))
    {
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
      dispatch_release(*(dispatch_object_t *)(a1 + 40));
      uint64_t result = 0;
      *(void *)(a1 + 40) = 0;
      *(void *)(a1 + 72) = 0;
      *(void *)(a1 + 80) = 0;
    }
  }
  return result;
}

double MTPlayerGetRate(uint64_t a1)
{
  return *(double *)(a1 + 88);
}

void MTPlayerSetRate(uint64_t a1, double a2)
{
  if (!a1 || !*(void *)(a1 + 40))
  {
    uint64_t v4 = *(uint64_t ***)(a1 + 64);
    if (v4)
    {
      double v5 = v4[1];
      if (v5 && a2 < 0.0 && *(double *)(a1 + 88) > 0.0)
      {
        uint64_t v6 = v5[1];
        *(void *)(a1 + 64) = v6;
        if (!v6)
        {
          uint64_t v7 = *(NSObject **)(a1 + 24);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 0x40000000;
          block[2] = __MTPlayerSetRate_block_invoke;
          block[3] = &__block_descriptor_tmp_7;
          block[4] = a1;
          dispatch_async(v7, block);
          goto LABEL_14;
        }
LABEL_13:
        uint64_t v9 = *(void *)(v6 + 32);
        *(void *)(a1 + 96) = v9;
        *(void *)(a1 + 104) = v9;
        goto LABEL_14;
      }
      double v8 = *v4;
      if (v8 && a2 > 0.0 && *(double *)(a1 + 88) < 0.0)
      {
        uint64_t v6 = *v8;
        *(void *)(a1 + 64) = v6;
        goto LABEL_13;
      }
    }
  }
LABEL_14:
  *(double *)(a1 + 88) = a2;
}

uint64_t __MTPlayerSetRate_block_invoke(uint64_t a1)
{
  return MTPlayerStop(*(void **)(a1 + 32));
}

double MTPlayerGetPosition(uint64_t a1)
{
  return *(double *)(a1 + 104);
}

void MTPlayerSetPosition(uint64_t a1, double a2)
{
  double v4 = *(double *)(a1 + 96);
  if (v4 > a2 && *(double *)(a1 + 88) > 0.0) {
    *(void *)(a1 + 64) = *(void *)(a1 + 48);
  }
  if (v4 < a2 && *(double *)(a1 + 88) < 0.0) {
    *(void *)(a1 + 64) = *(void *)(a1 + 56);
  }
  double v5 = *(NSObject **)(a1 + 40);
  if (v5)
  {
    dispatch_suspend(v5);
    *(double *)(a1 + 96) = a2;
    *(double *)(a1 + 104) = a2;
    dispatch_resume(*(dispatch_object_t *)(a1 + 40));
  }
  else
  {
    *(double *)(a1 + 96) = a2;
    *(double *)(a1 + 104) = a2;
  }
  uint64_t v6 = *(double **)(a1 + 64);
  if (v6)
  {
    while (v6[4] > a2)
    {
      uint64_t v6 = (double *)*((void *)v6 + 1);
      if (!v6) {
        goto LABEL_16;
      }
    }
    do
    {
      if (v6[4] >= a2) {
        break;
      }
      uint64_t v6 = *(double **)v6;
    }
    while (v6);
  }
LABEL_16:
  *(void *)(a1 + 64) = v6;
}

uint64_t MTPlayerGetDeviceProperties(uint64_t result)
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

uint64_t MTPlayerDispatchFrame(uint64_t a1, const void *a2, unsigned int a3)
{
  if (a1) {
    return mt_PlayerDispatchFrame(a1, a2, a3);
  }
  else {
    return 3758097090;
  }
}

uint64_t MTPlayerSetGetReportHandler(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    *(void *)(result + 184) = a2;
    *(void *)(result + 192) = a3;
  }
  return result;
}

uint64_t MTPlayerSetSetReportHandler(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    *(void *)(result + 200) = a2;
    *(void *)(result + 208) = a3;
  }
  return result;
}

uint64_t MTPlayerGetTypeID()
{
  uint64_t result = __kMTPlayerTypeID;
  if (!__kMTPlayerTypeID)
  {
    pthread_once(&__playerTypeInit, (void (*)(void))__MTPlayerRegister);
    return __kMTPlayerTypeID;
  }
  return result;
}

uint64_t __MTPlayerRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kMTPlayerCFTypeID TypeID = result;
  return result;
}

uint64_t MTPlayerCreate(const __CFDictionary *a1, char a2)
{
  if (!a1) {
    return 0;
  }
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (!__kMTPlayerTypeID) {
    pthread_once(&__playerTypeInit, (void (*)(void))__MTPlayerRegister);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    MutableCopy = CFDictionaryCreateMutableCopy(v4, 0, a1);
    *(void *)(Instance + 16) = MutableCopy;
    if (a2)
    {
      CFDictionaryRemoveValue(MutableCopy, @"IOCFPlugInTypes");
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(Instance + 16), @"MTHIDDevice");
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(Instance + 16), @"parser-type");
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(Instance + 16), @"parser-options");
      MutableCopy = *(__CFDictionary **)(Instance + 16);
    }
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(MutableCopy, @"Max Packet Size");
    if (Value)
    {
      CFNumberRef v8 = Value;
      CFTypeID v9 = CFGetTypeID(Value);
      unsigned int v10 = 4096;
      if (v9 == CFNumberGetTypeID())
      {
        int valuePtr = 0;
        int v11 = CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr);
        if (valuePtr > 511 && v11 == 1) {
          unsigned int v10 = valuePtr;
        }
        else {
          unsigned int v10 = 4096;
        }
      }
    }
    else
    {
      unsigned int v10 = 4096;
    }
    *(_DWORD *)(Instance + 116) = v10;
    *(void *)(Instance + 120) = malloc_type_malloc(v10, 0x6FD9EA78uLL);
  }
  return Instance;
}

dispatch_semaphore_t __MTPlayerInit(dispatch_semaphore_t result)
{
  if (result)
  {
    dispatch_semaphore_t v1 = result;
    *(_OWORD *)&result[24].isa = 0u;
    *(_OWORD *)&result[26].isa = 0u;
    *(_OWORD *)&result[20].isa = 0u;
    *(_OWORD *)&result[22].isa = 0u;
    *(_OWORD *)&result[16].isa = 0u;
    *(_OWORD *)&result[18].isa = 0u;
    *(_OWORD *)&result[12].isa = 0u;
    *(_OWORD *)&result[14].isa = 0u;
    *(_OWORD *)&result[8].isa = 0u;
    *(_OWORD *)&result[10].isa = 0u;
    *(_OWORD *)&result[4].isa = 0u;
    *(_OWORD *)&result[6].isa = 0u;
    *(_OWORD *)&result[2].isa = 0u;
    result[3].isa = (Class)dispatch_queue_create("com.apple.MultitouchSupport.playback", 0);
    v1[4].isa = (Class)dispatch_group_create();
    v1[5].isa = 0;
    v1[7].isa = 0;
    v1[8].isa = 0;
    v1[12].isa = 0;
    v1[13].isa = 0;
    v1[11].isa = (Class)0x3FF0000000000000;
    *(_OWORD *)&v1[16].isa = 0u;
    *(_OWORD *)&v1[18].isa = 0u;
    *(_OWORD *)&v1[20].isa = 0u;
    *(_OWORD *)&v1[22].isa = 0u;
    *(_OWORD *)&v1[24].isa = 0u;
    v1[26].isa = 0;
    uint64_t result = dispatch_semaphore_create(1);
    v1[27].isa = (Class)result;
    HIDWORD(v1[14].isa) = 4096;
    v1[15].isa = 0;
  }
  return result;
}

void __MTPlayerRelease(uint64_t a1)
{
  if (a1 && *(void *)(a1 + 40)) {
    MTPlayerStop((void *)a1);
  }
  if (*(_DWORD *)(a1 + 112)) {
    MTPlayerUnload(a1);
  }
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  *(void *)(a1 + 32) = 0;
  dispatch_release(*(dispatch_object_t *)(a1 + 24));
  *(void *)(a1 + 24) = 0;
  dispatch_release(*(dispatch_object_t *)(a1 + 216));
  double v2 = *(const void **)(a1 + 16);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 16) = 0;
  }
  CFAllocatorRef v4 = (void *)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 48);
  if (v3)
  {
    do
    {
      double v5 = (void *)*v3;
      free(v3);
      *CFAllocatorRef v4 = v5;
      uint64_t v3 = v5;
    }
    while (v5);
  }
  *CFAllocatorRef v4 = 0;
  *(void *)(a1 + 56) = 0;
  uint64_t v6 = *(void **)(a1 + 120);
  if (v6)
  {
    free(v6);
    *(void *)(a1 + 120) = 0;
  }
}

uint64_t mtalg_FillinValidPixelRange(uint64_t result, uint64_t a2)
{
  if (result)
  {
    if ((*(unsigned char *)(a2 + 24) & 0x50) != 0) {
      uint64_t v2 = 0x780000008800;
    }
    else {
      uint64_t v2 = *(unsigned __int16 *)(a2 + 36);
    }
    *(void *)(a2 + 28) = v2;
  }
  return result;
}

uint64_t mt_ForwardSpecificImageRegion()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  char v2 = v1;
  int v4 = v3;
  uint64_t v6 = v5;
  __int16 v8 = v7;
  unsigned int v10 = v9;
  int v12 = v11;
  uint64_t v14 = v13;
  uint64_t v15 = v0;
  uint64_t v28 = *MEMORY[0x263EF8340];
  memset(__b, 170, sizeof(__b));
  *(_OWORD *)long long v26 = xmmword_2262F0CF8;
  memset(&v26[2], 170, 24);
  *(double *)&v26[1] = (double)*(int *)(v6 + 12) / 1000.0;
  v26[0] = *(unsigned int *)(v6 + 4);
  HIDWORD(v26[2]) = 1 << *v10;
  LODWORD(v26[3]) = v4;
  uint64_t v16 = v10[5];
  LOWORD(v26[2]) = v10[5];
  unint64_t v17 = v10[2];
  WORD1(v26[2]) = v10[2];
  WORD2(v26[4]) = v8;
  BYTE6(v26[4]) = v2;
  if (v17)
  {
    unint64_t v18 = 0;
    uint64_t v19 = v10[3];
    int v20 = v12 * v10[1];
    unsigned int v21 = __b;
    do
    {
      if (v16)
      {
        int v22 = v20 + v10[4];
        uint64_t v23 = v16;
        uint64_t v24 = v21;
        do
        {
          *v24++ = *(_WORD *)(v14 + 2 * v22++);
          --v23;
        }
        while (v23);
      }
      v18 += v19;
      v21 += 2 * v16 * v19;
      v20 += v12 * v19;
    }
    while (v18 < v17);
  }
  return MTAlg_IssueImageCallbacks(v15, __b, (long long *)v26);
}

uint64_t mt_ForwardCombinedImageRegions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11)
{
  uint64_t v11 = MEMORY[0x270FA5388]();
  int v13 = v12;
  int v15 = v14;
  uint64_t v17 = v16;
  int v19 = v18;
  uint64_t v21 = v20;
  uint64_t v22 = v11;
  uint64_t v49 = *MEMORY[0x263EF8340];
  *(_OWORD *)CFNumberRef v47 = xmmword_2262F0CF8;
  memset(&v47[2], 170, 24);
  *(double *)&v47[1] = (double)*(int *)(a9 + 12) / 1000.0;
  v47[0] = *(unsigned int *)(a9 + 4);
  LODWORD(v47[3]) = a10;
  LOWORD(v47[2]) = v12;
  WORD1(v47[2]) = v23;
  WORD2(v47[4]) = v24;
  BYTE6(v47[4]) = a11;
  bzero(v48, 0x8000uLL);
  if (v15 < 1)
  {
    int v28 = 0;
  }
  else
  {
    uint64_t v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    uint64_t v29 = v15;
    do
    {
      uint64_t v30 = v17 - v25;
      long long v31 = (unsigned char *)(v17 - v25 + 8 * v25);
      if (v25)
      {
        uint64_t v32 = v25 - 1;
        if (v31[1] != *(v31 - 6)) {
          v26 += *(unsigned __int8 *)(v17 - v32 + 8 * v32 + 2);
        }
        uint64_t v33 = v17 - v32 + 8 * v32;
        if (*(unsigned __int8 *)(v30 + 8 * v25 + 4) != *(unsigned __int8 *)(v33 + 4)) {
          v27 += *(unsigned __int8 *)(v33 + 5);
        }
      }
      unsigned int v34 = v31[2];
      if (v31[2])
      {
        unsigned int v35 = 0;
        float v36 = (unsigned __int8 *)(v30 + 8 * v25);
        int v37 = v36[1];
        uint64_t v38 = v36[5];
        unsigned int v39 = v36 + 4;
        int v40 = v36[3];
        int v41 = v27 + v13 * v26;
        int v42 = v19 * v37;
        do
        {
          if (v38)
          {
            int v43 = v42 + *v39;
            uint64_t v44 = v38;
            int v45 = v41;
            do
            {
              v48[v45++] = *(_WORD *)(v21 + 2 * v43++);
              --v44;
            }
            while (v44);
          }
          v35 += v40;
          v41 += v13 * v40;
          v42 += v19 * v40;
        }
        while (v35 < v34);
      }
      v28 |= 1 << *v31;
      ++v25;
    }
    while (v25 != v29);
  }
  HIDWORD(v47[2]) = v28;
  return MTAlg_IssueImageCallbacks(v22, v48, (long long *)v47);
}

uint64_t mt_ForwardImageRegion(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9 = MEMORY[0x270FA5388]();
  __int16 v11 = v10;
  unsigned int v13 = v12;
  uint64_t v15 = v14;
  int v17 = v16;
  uint64_t v19 = v18;
  unsigned int v21 = v20;
  unsigned int v23 = v22;
  uint64_t v24 = v9;
  uint64_t v40 = *MEMORY[0x263EF8340];
  memset(__b, 170, sizeof(__b));
  *(_DWORD *)((char *)v38 + 3) = -1431655766;
  v38[0] = -1431655766;
  uint64_t result = MTDeviceGetSensorRegionOfType(v24, v38, v23);
  if (!result)
  {
    v37[0] = xmmword_2262F0CF8;
    memset(&v37[1], 170, 24);
    *((double *)v37 + 1) = (double)*(int *)(v15 + 12) / 1000.0;
    *(void *)&v37[0] = *(unsigned int *)(v15 + 4);
    *(void *)((char *)&v37[1] + 4) = __PAIR64__(v13, v21);
    uint64_t v26 = BYTE1(v38[1]);
    LOWORD(v37[1]) = BYTE1(v38[1]);
    unint64_t v27 = BYTE2(v38[0]);
    WORD1(v37[1]) = BYTE2(v38[0]);
    WORD2(v37[2]) = v11;
    BYTE6(v37[2]) = a9;
    if (BYTE2(v38[0]))
    {
      unint64_t v28 = 0;
      uint64_t v29 = HIBYTE(v38[0]);
      unint64_t v30 = 2 * BYTE1(v38[1]) * (unint64_t)HIBYTE(v38[0]);
      int v31 = LOBYTE(v38[1]) + v17 * BYTE1(v38[0]);
      int v32 = v17 * HIBYTE(v38[0]);
      uint64_t v33 = __b;
      do
      {
        if (v26)
        {
          uint64_t v34 = v26;
          int v35 = v31;
          float v36 = v33;
          do
          {
            *v36++ = *(_WORD *)(v19 + 2 * v35++);
            --v34;
          }
          while (v34);
        }
        v28 += v29;
        v33 += v30;
        v31 += v32;
      }
      while (v28 < v27);
    }
    return MTAlg_IssueImageCallbacks(v24, __b, v37);
  }
  return result;
}

uint64_t mtp_ForwardDeviceImageSubRegions(uint64_t a1)
{
  unsigned int v6 = 0;
  uint64_t v5 = 0;
  uint64_t result = MTAlg_DeviceGetSensorRegionArray(a1, &v5, &v6);
  if (!result)
  {
    unint64_t v2 = v6;
    if (v6)
    {
      uint64_t v3 = 0;
      unint64_t v4 = 0;
      do
      {
        if (*(unsigned char *)(v5 + v3))
        {
          uint64_t result = mt_ForwardSpecificImageRegion();
          unint64_t v2 = v6;
        }
        ++v4;
        v3 += 7;
      }
      while (v4 < v2);
    }
  }
  return result;
}

uint64_t mtp_ForwardDeviceImageBuffer(uint64_t a1, const void *a2, __int16 a3, __int16 a4, uint64_t a5, int a6, unsigned int a7, int a8, int a9, char a10)
{
  double v11 = (double)*(int *)(a5 + 12);
  *(void *)&v14[0] = 0xAAAAAAAAAAAAAAAALL;
  memset(&v14[1], 170, 24);
  *((double *)v14 + 1) = v11 / 1000.0;
  *(void *)&v14[0] = *(unsigned int *)(a5 + 4);
  if (a6) {
    int v12 = a6;
  }
  else {
    int v12 = 2147483646;
  }
  *(void *)((char *)&v14[1] + 4) = __PAIR64__(a7, v12);
  LOWORD(v14[1]) = a4;
  WORD1(v14[1]) = a3;
  WORD2(v14[2]) = a9 - a8;
  BYTE6(v14[2]) = a10;
  HIDWORD(v14[1]) = a9;
  LODWORD(v14[2]) = a8;
  uint64_t result = MTAlg_IssueImageCallbacks(a1, a2, v14);
  if (DWORD1(v14[1]) == 2147483646) {
    return mtp_ForwardDeviceImageSubRegions(a1);
  }
  return result;
}

uint64_t MTActuatorGetTypeID()
{
  uint64_t result = __kMTActuatorTypeID;
  if (!__kMTActuatorTypeID)
  {
    pthread_once(&__actuatorTypeInit, (void (*)(void))__MTActuatorRegister);
    return __kMTActuatorTypeID;
  }
  return result;
}

uint64_t __MTActuatorRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kMTActuatorCFTypeID TypeID = result;
  return result;
}

uint64_t MTActuatorCreate(io_object_t a1, uint64_t a2)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (!__kMTActuatorTypeID) {
    pthread_once(&__actuatorTypeInit, (void (*)(void))__MTActuatorRegister);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    if (a1)
    {
      IOObjectRetain(a1);
      *(_DWORD *)(Instance + 16) = a1;
    }
    *(_DWORD *)(Instance + 20) = 0;
    *(_DWORD *)(Instance + 24) = 0;
    *(void *)(Instance + 32) = a2;
    *(unsigned char *)(Instance + 48) = 1;
    *(void *)(Instance + 56) = 0;
    *(_OWORD *)(Instance + 72) = xmmword_2262F0D20;
    CFNumberRef CFProperty = (void *)IORegistryEntryCreateCFProperty(a1, @"ActuatorLimits", v4, 0);
    __int16 v7 = CFProperty;
    if (CFProperty)
    {
      __int16 v8 = [CFProperty objectForKeyedSubscript:@"AmplitudeMin"];
      uint64_t v9 = v8;
      if (v8)
      {
        [v8 floatValue];
        *(_DWORD *)(Instance + 72) = v10;
      }
      double v11 = [v7 objectForKeyedSubscript:@"AmplitudeMax"];
      int v12 = v11;
      if (v11)
      {
        [v11 floatValue];
        *(_DWORD *)(Instance + 76) = v13;
      }
      uint64_t v14 = [v7 objectForKeyedSubscript:@"DurationMin"];
      uint64_t v15 = v14;
      if (v14)
      {
        [v14 floatValue];
        *(_DWORD *)(Instance + 80) = v16;
      }
      int v17 = [v7 objectForKeyedSubscript:@"DurationMax"];
      uint64_t v18 = v17;
      if (v17)
      {
        [v17 floatValue];
        *(_DWORD *)(Instance + 84) = v19;
      }
    }
  }
  return Instance;
}

uint64_t MTActuatorSetMTDevice(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = a2;
  return result;
}

uint64_t MTActuatorSetFirmwareClicks(uint64_t a1, char a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = 3758097084;
  if (!a1) {
    return 3758097090;
  }
  if (!MTActuatorIsOpen(a1)) {
    return 3758097101;
  }
  id v5 = *(id *)(a1 + 40);
  if (v5)
  {
    if ((a2 & 8) != 0) {
      uint64_t v6 = 4294967294;
    }
    else {
      uint64_t v6 = 2;
    }
    __int16 v7 = [NSNumber numberWithInt:v6];
    __int16 v8 = [v5 objectForKeyedSubscript:v7];

    if (v8)
    {
      int v9 = MTActuationSetFirmwareDownClick((uint64_t)v8, (float *)a1);
      if (v9)
      {
        int v10 = v9;
        double v11 = MTLoggingFramework();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          int v19 = 67109120;
          int v20 = v10;
          _os_log_impl(&dword_2262CF000, v11, OS_LOG_TYPE_ERROR, "Error updating firmware primary down click, 0x%08x", (uint8_t *)&v19, 8u);
        }
      }
    }
    if ((a2 & 8) != 0) {
      uint64_t v12 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v12 = 1;
    }
    int v13 = [NSNumber numberWithInt:v12];
    uint64_t v14 = [v5 objectForKeyedSubscript:v13];

    if (v14)
    {
      int v15 = MTActuationSetFirmwareUpClick((uint64_t)v14, (float *)a1);
      if (v15)
      {
        int v16 = v15;
        int v17 = MTLoggingFramework();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          int v19 = 67109120;
          int v20 = v16;
          _os_log_impl(&dword_2262CF000, v17, OS_LOG_TYPE_ERROR, "Error updating firmware primary up click, 0x%08x", (uint8_t *)&v19, 8u);
        }
      }
    }

    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t MTActuatorActuate(uint64_t a1, unsigned int a2, char a3)
{
  uint64_t v3 = 3758097090;
  if (a1)
  {
    if (MTActuatorIsOpen(a1))
    {
      id v7 = *(id *)(a1 + 40);
      if (v7)
      {
        if (a2 <= 0x24)
        {
          if ((a3 & 8) != 0) {
            uint64_t v8 = -a2;
          }
          else {
            uint64_t v8 = a2;
          }
          int v9 = [NSNumber numberWithInt:v8];
          int v10 = [v7 objectForKeyedSubscript:v9];

          if (v10) {
            uint64_t v3 = MTActuationActuate((uint64_t)v10, (float *)a1);
          }
          else {
            uint64_t v3 = 3758097136;
          }
        }
      }
      else
      {
        uint64_t v3 = 3758097084;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return v3;
}

void _MTActuationLoadActuationsFromPropertyListV2orV3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"Actuator_%d", *(unsigned int *)(a1 + 68));
    uint64_t v8 = [v5 objectForKeyedSubscript:v7];
    if (v8
      || ([v5 objectForKeyedSubscript:@"Default"],
          (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v29 = v7;
      id v30 = v5;
      id v9 = *(id *)(a1 + 40);
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      int v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (!v11) {
        goto LABEL_29;
      }
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v33;
      id obj = v10;
      while (1)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(obj);
          }
          int v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          int v16 = [v15 objectForKeyedSubscript:@"ActuationID"];
          int v17 = objc_msgSend(NSNumber, "numberWithInt:", -objc_msgSend(v16, "intValue"));
          if ([v6 intValue] == 3)
          {
            id v18 = [v15 objectForKeyedSubscript:@"Default"];
          }
          else
          {
            id v18 = v15;
          }
          int v19 = v18;
          id v20 = [v15 objectForKeyedSubscript:@"Silent"];
          if (([v16 intValue] & 0x80000000) != 0 || !v19)
          {
            uint64_t v25 = MTLoggingFramework();
            if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              goto LABEL_26;
            }
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)int v37 = v16 == 0;
            *(_WORD *)&v37[4] = 1024;
            *(_DWORD *)&v37[6] = v19 == 0;
            uint64_t v26 = v25;
            unint64_t v27 = "Error parsing click playlist, unable to determine actuation id(%d) or default waveform not defined(%d)";
            uint32_t v28 = 14;
LABEL_25:
            _os_log_impl(&dword_2262CF000, v26, OS_LOG_TYPE_ERROR, v27, buf, v28);
            goto LABEL_26;
          }
          CFDictionaryRef v21 = MTActuationCreateFromDictionary(v19, 0);
          [v9 setObject:v21 forKeyedSubscript:v16];

          unsigned int v22 = [v9 objectForKeyedSubscript:v16];

          if (!v22)
          {
            uint64_t v25 = MTLoggingFramework();
            if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              goto LABEL_26;
            }
            *(_DWORD *)buf = 138412290;
            *(void *)int v37 = v16;
            uint64_t v26 = v25;
            unint64_t v27 = "Error parsing click playlist, failed to create default waveform for actuationID=%@";
LABEL_24:
            uint32_t v28 = 12;
            goto LABEL_25;
          }
          if (!v20) {
            id v20 = v19;
          }
          CFDictionaryRef v23 = MTActuationCreateFromDictionary(v20, 0);
          [v9 setObject:v23 forKeyedSubscript:v17];

          uint64_t v24 = [v9 objectForKeyedSubscript:v17];

          if (!v24)
          {
            [v9 setObject:0 forKeyedSubscript:v16];
            uint64_t v25 = MTLoggingFramework();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)int v37 = v17;
              uint64_t v26 = v25;
              unint64_t v27 = "Error parsing click playlist, failed to create silent waveform for actuationID=%@";
              goto LABEL_24;
            }
LABEL_26:
          }
        }
        int v10 = obj;
        uint64_t v12 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
        if (!v12)
        {
LABEL_29:

          id v7 = v29;
          id v5 = v30;
          goto LABEL_30;
        }
      }
    }
    int v10 = MTLoggingFramework();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)int v37 = v6;
      _os_log_impl(&dword_2262CF000, v10, OS_LOG_TYPE_ERROR, "Error parsing click playlist, revision %@ and default not found", buf, 0xCu);
    }
LABEL_30:
  }
}

void _MTActuationLoadActuationsFromPropertyList(uint64_t a1, void *cf)
{
  if (cf && (CFTypeID v4 = CFGetTypeID(cf), v4 == CFDictionaryGetTypeID()))
  {
    id v5 = cf;
    id v6 = [v5 objectForKeyedSubscript:@"Version"];
    if (([v6 intValue] & 0xFFFFFFFE) == 2)
    {
      _MTActuationLoadActuationsFromPropertyListV2orV3(a1, v5, v6);
    }
    else
    {
      id v7 = MTLoggingFramework();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_2262CF000, v7, OS_LOG_TYPE_ERROR, "Error parsing click playlist, unknown version", v8, 2u);
      }
    }
  }
  else
  {
    id v5 = MTLoggingFramework();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2262CF000, v5, OS_LOG_TYPE_ERROR, "Failed to load actuations from plist - Invalid plist reference", buf, 2u);
    }
  }
}

void MTActuatorLoadActuations(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(const void **)(a1 + 40);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(a1 + 40) = 0;
    }
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    *(void *)(a1 + 40) = Mutable;
    if (Mutable)
    {
      unint64_t size = 0xAAAAAAAAAAAAAAAALL;
      id v5 = getsectiondata((const mach_header_64 *)&dword_2262CF000, "__TEXT", "__tpad_act_plist", &size);
      if (v5)
      {
        CFDataRef v6 = CFDataCreate(v3, v5, size);
        if (v6)
        {
          CFDataRef v7 = v6;
          uint64_t v8 = (void *)CFPropertyListCreateWithData(v3, v6, 0, 0, 0);
          if (v8)
          {
            id v9 = v8;
            _MTActuationLoadActuationsFromPropertyList(a1, v8);
            CFRelease(v9);
          }
          CFRelease(v7);
        }
      }
      if (CFPreferencesGetAppBooleanValue(@"ClickOverrideEnabled", @"com.apple.MultitouchSupport", 0))
      {
        int v10 = (void *)CFPreferencesCopyAppValue(@"ClickOverridePlaylist", @"com.apple.MultitouchSupport");
        if (v10)
        {
          uint64_t v11 = v10;
          _MTActuationLoadActuationsFromPropertyList(a1, v10);
          CFRelease(v11);
        }
      }
    }
  }
}

uint64_t _GetMTActuationID(int a1)
{
  if ((a1 - 1) > 5) {
    return 0;
  }
  else {
    return dword_2262F0D38[a1 - 1];
  }
}

double __MTActuatorInit(uint64_t a1)
{
  if (a1)
  {
    *(void *)(a1 + 80) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
  }
  return result;
}

uint64_t __MTActuatorRelease(uint64_t result)
{
  uint64_t v1 = result;
  if (result)
  {
    MTActuatorClose(result);
    uint64_t v2 = *(const void **)(v1 + 40);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(v1 + 40) = 0;
    }
    double result = *(unsigned int *)(v1 + 16);
    if (result)
    {
      double result = IOObjectRelease(result);
      *(_DWORD *)(v1 + 16) = 0;
    }
  }
  *(void *)(v1 + 32) = 0;
  return result;
}

uint64_t alg_ComputeContactDensity(int a1, int a2, int a3, int a4)
{
  if (a2 <= a3) {
    int v4 = a3;
  }
  else {
    int v4 = a2;
  }
  return (__int16)(400 * a1 / (v4 - a4));
}

uint64_t alg_ComputeContactDensityFromRadii(int a1, int a2, int a3, int a4, int a5)
{
  if (a3 <= a4) {
    int v8 = a4;
  }
  else {
    int v8 = a3;
  }
  if (a2 <= a4) {
    int v9 = a4;
  }
  else {
    int v9 = a2;
  }
  int v10 = (__int16)lsqrt(v8 * v9);
  if (v10 <= a4) {
    int v10 = a4;
  }
  return (__int16)(400 * a1 / (v10 - a5));
}

uint64_t MTActuationGetTypeID()
{
  uint64_t result = __kMTActuationTypeID;
  if (!__kMTActuationTypeID)
  {
    pthread_once(&__actuationTypeInit, (void (*)(void))__MTActuationRegister);
    return __kMTActuationTypeID;
  }
  return result;
}

uint64_t __MTActuationRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kMTActuationCFTypeID TypeID = result;
  return result;
}

CFDictionaryRef MTActuationCreateFromDictionary(const void *a1, int a2)
{
  if (!a1) {
    return 0;
  }
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 != CFDictionaryGetTypeID()) {
    return 0;
  }
  CFNumberRef Value = CFDictionaryGetValue((CFDictionaryRef)a1, @"BaseWaveform");
  if (!Value) {
    return 0;
  }
  CFTypeID v6 = CFGetTypeID(Value);
  if (v6 != CFDictionaryGetTypeID()) {
    return 0;
  }
  return _MTActuationCreateFromParameterizedWaveform((const __CFDictionary *)a1, a2);
}

CFDictionaryRef _MTActuationCreateFromParameterizedWaveform(const __CFDictionary *result, int a2)
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  double v75 = 0.0;
  double valuePtr = 0.0;
  if (result)
  {
    CFDictionaryRef v3 = result;
    uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(result, @"BaseWaveform");
    if (result)
    {
      CFDictionaryRef v4 = result;
      CFTypeID v5 = CFGetTypeID(result);
      if (v5 == CFDictionaryGetTypeID())
      {
        *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
        buffer[2] = v6;
        buffer[3] = v6;
        buffer[0] = v6;
        buffer[1] = v6;
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v4, @"Type");
        CFStringRef v8 = Value;
        if (Value)
        {
          CFTypeID v9 = CFGetTypeID(Value);
          if (v9 == CFStringGetTypeID() && CFStringGetCString(v8, (char *)buffer, 64, 0x600u)) {
            LODWORD(v8) = MTActuationBaseWaveformGetTypeForKey((const char *)buffer);
          }
          else {
            LODWORD(v8) = 0;
          }
        }
        CFNumberRef v10 = (const __CFNumber *)CFDictionaryGetValue(v4, @"DurationMS");
        if (v10)
        {
          CFNumberRef v11 = v10;
          CFTypeID v12 = CFGetTypeID(v10);
          if (v12 == CFNumberGetTypeID()) {
            CFNumberGetValue(v11, kCFNumberDoubleType, &valuePtr);
          }
        }
        CFNumberRef v13 = (const __CFNumber *)CFDictionaryGetValue(v4, @"Amplitude");
        if (v13)
        {
          CFNumberRef v14 = v13;
          CFTypeID v15 = CFGetTypeID(v13);
          if (v15 == CFNumberGetTypeID()) {
            CFNumberGetValue(v14, kCFNumberDoubleType, &v75);
          }
        }
        float v16 = v75;
        float v17 = valuePtr;
        MTActuationWaveformCreateWithBase((int)v8, (uint64_t)v73, v16, v17);
        v77[5] = v73[5];
        v77[6] = v73[6];
        v78[0] = v74[0];
        *(_OWORD *)((char *)v78 + 12) = *(_OWORD *)((char *)v74 + 12);
        v77[2] = v73[2];
        v77[3] = v73[3];
        v77[4] = v73[4];
        v77[0] = v73[0];
        v77[1] = v73[1];
        CFArrayRef v18 = (const __CFArray *)CFDictionaryGetValue(v3, @"Tones");
        if (v18)
        {
          CFArrayRef v19 = v18;
          CFTypeID v20 = CFGetTypeID(v18);
          if (v20 == CFArrayGetTypeID() && CFArrayGetCount(v19) >= 1)
          {
            CFIndex v21 = 0;
            do
            {
              CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v19, v21);
              if (ValueAtIndex)
              {
                CFDictionaryRef v23 = ValueAtIndex;
                CFTypeID v24 = CFGetTypeID(ValueAtIndex);
                if (v24 == CFDictionaryGetTypeID())
                {
                  double v72 = 0.0;
                  *(void *)&v73[0] = 0;
                  double v70 = 0.0;
                  double v71 = 0.0;
                  CFStringRef v25 = (const __CFString *)CFDictionaryGetValue(v23, @"Type");
                  CFStringRef v26 = v25;
                  if (v25)
                  {
                    CFTypeID v27 = CFGetTypeID(v25);
                    if (v27 == CFStringGetTypeID() && CFStringGetCString(v26, (char *)buffer, 64, 0x600u)) {
                      LODWORD(v26) = MTActuationToneWaveformGetTypeForKey((const char *)buffer);
                    }
                    else {
                      LODWORD(v26) = 0;
                    }
                  }
                  CFNumberRef v28 = (const __CFNumber *)CFDictionaryGetValue(v23, @"DelayMS");
                  if (v28)
                  {
                    CFNumberRef v29 = v28;
                    CFTypeID v30 = CFGetTypeID(v28);
                    if (v30 == CFNumberGetTypeID()) {
                      CFNumberGetValue(v29, kCFNumberDoubleType, v73);
                    }
                  }
                  CFNumberRef v31 = (const __CFNumber *)CFDictionaryGetValue(v23, @"DurationMS");
                  if (v31)
                  {
                    CFNumberRef v32 = v31;
                    CFTypeID v33 = CFGetTypeID(v31);
                    if (v33 == CFNumberGetTypeID()) {
                      CFNumberGetValue(v32, kCFNumberDoubleType, &v72);
                    }
                  }
                  CFNumberRef v34 = (const __CFNumber *)CFDictionaryGetValue(v23, @"Amplitude");
                  if (v34)
                  {
                    CFNumberRef v35 = v34;
                    CFTypeID v36 = CFGetTypeID(v34);
                    if (v36 == CFNumberGetTypeID()) {
                      CFNumberGetValue(v35, kCFNumberDoubleType, &v71);
                    }
                  }
                  CFNumberRef v37 = (const __CFNumber *)CFDictionaryGetValue(v23, @"FrequencykHz");
                  if (v37)
                  {
                    CFNumberRef v38 = v37;
                    CFTypeID v39 = CFGetTypeID(v37);
                    if (v39 == CFNumberGetTypeID()) {
                      CFNumberGetValue(v38, kCFNumberDoubleType, &v70);
                    }
                  }
                  float v40 = *(double *)v73;
                  float v41 = v72;
                  float v42 = v71;
                  float v43 = v70;
                  MTActuationAppendToWaveform((uint64_t)v77, (int)v26, v40, v41, v42, v43);
                }
              }
              ++v21;
            }
            while (CFArrayGetCount(v19) > v21);
          }
        }
        CFDictionaryRef v44 = (const __CFDictionary *)CFDictionaryGetValue(v3, @"BaseMultipliers");
        if (v44)
        {
          CFDictionaryRef v45 = v44;
          CFTypeID v46 = CFGetTypeID(v44);
          if (v46 == CFDictionaryGetTypeID())
          {
            LODWORD(v73[0]) = 1065353216;
            LODWORD(v72) = 1065353216;
            LODWORD(v71) = 1065353216;
            CFNumberRef v47 = (const __CFNumber *)CFDictionaryGetValue(v45, @"Light");
            if (v47)
            {
              CFNumberRef v48 = v47;
              CFTypeID v49 = CFGetTypeID(v47);
              if (v49 == CFNumberGetTypeID()) {
                CFNumberGetValue(v48, kCFNumberFloatType, v73);
              }
            }
            CFNumberRef v50 = (const __CFNumber *)CFDictionaryGetValue(v45, @"Medium");
            if (v50)
            {
              CFNumberRef v51 = v50;
              CFTypeID v52 = CFGetTypeID(v50);
              if (v52 == CFNumberGetTypeID()) {
                CFNumberGetValue(v51, kCFNumberFloatType, &v72);
              }
            }
            CFNumberRef v53 = (const __CFNumber *)CFDictionaryGetValue(v45, @"Firm");
            float v54 = 1.0;
            if (v53)
            {
              CFNumberRef v55 = v53;
              CFTypeID v56 = CFGetTypeID(v53);
              if (v56 == CFNumberGetTypeID())
              {
                CFNumberGetValue(v55, kCFNumberFloatType, &v71);
                float v54 = *(float *)&v71;
              }
            }
            MTActuationSetBaseMultipliers((float *)v77, *(float *)v73, *(float *)&v72, v54);
          }
        }
        CFDictionaryRef v57 = (const __CFDictionary *)CFDictionaryGetValue(v3, @"ToneMultipliers");
        if (v57)
        {
          CFDictionaryRef v58 = v57;
          CFTypeID v59 = CFGetTypeID(v57);
          if (v59 == CFDictionaryGetTypeID())
          {
            LODWORD(v73[0]) = 1065353216;
            LODWORD(v72) = 1065353216;
            LODWORD(v71) = 1065353216;
            CFNumberRef v60 = (const __CFNumber *)CFDictionaryGetValue(v58, @"Light");
            if (v60)
            {
              CFNumberRef v61 = v60;
              CFTypeID v62 = CFGetTypeID(v60);
              if (v62 == CFNumberGetTypeID()) {
                CFNumberGetValue(v61, kCFNumberFloatType, v73);
              }
            }
            CFNumberRef v63 = (const __CFNumber *)CFDictionaryGetValue(v58, @"Medium");
            if (v63)
            {
              CFNumberRef v64 = v63;
              CFTypeID v65 = CFGetTypeID(v63);
              if (v65 == CFNumberGetTypeID()) {
                CFNumberGetValue(v64, kCFNumberFloatType, &v72);
              }
            }
            CFNumberRef v66 = (const __CFNumber *)CFDictionaryGetValue(v58, @"Firm");
            float v67 = 1.0;
            if (v66)
            {
              CFNumberRef v68 = v66;
              CFTypeID v69 = CFGetTypeID(v66);
              if (v69 == CFNumberGetTypeID())
              {
                CFNumberGetValue(v68, kCFNumberFloatType, &v71);
                float v67 = *(float *)&v71;
              }
            }
            MTActuationSetToneMultipliers((float *)v77, *(float *)v73, *(float *)&v72, v67);
          }
        }
        return (const __CFDictionary *)_MTActuationCreateFromWaveform(v77, a2);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t _MTActuationCreateFromWaveform(_OWORD *a1, int a2)
{
  if (!__kMTActuationTypeID) {
    pthread_once(&__actuationTypeInit, (void (*)(void))__MTActuationRegister);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v5 = 0;
  if (a1 && Instance)
  {
    *(_OWORD *)(Instance + 24) = *a1;
    long long v6 = a1[1];
    long long v7 = a1[2];
    long long v8 = a1[3];
    *(_OWORD *)(Instance + 88) = a1[4];
    *(_OWORD *)(Instance + 72) = v8;
    *(_OWORD *)(Instance + 56) = v7;
    *(_OWORD *)(Instance + 40) = v6;
    long long v9 = a1[5];
    long long v10 = a1[6];
    long long v11 = a1[7];
    *(_OWORD *)(Instance + 148) = *(_OWORD *)((char *)a1 + 124);
    *(_OWORD *)(Instance + 136) = v11;
    *(_OWORD *)(Instance + 120) = v10;
    *(_OWORD *)(Instance + 104) = v9;
    *(_DWORD *)(Instance + 16) = 2;
    *(_DWORD *)(Instance + 20) = a2;
    return Instance;
  }
  return v5;
}

uint64_t MTActuationCalculateWaveform(uint64_t result, float *a2, unsigned char *a3, float a4, float a5, uint64_t a6, char a7)
{
  if (!result) {
    return result;
  }
  if (a7)
  {
    float v9 = *(float *)(result + 36);
    float v10 = *(float *)(result + 48);
  }
  else if ((a7 & 2) != 0)
  {
    float v9 = *(float *)(result + 40);
    float v10 = *(float *)(result + 52);
  }
  else
  {
    if ((a7 & 4) == 0)
    {
      float v8 = a4;
      goto LABEL_10;
    }
    float v9 = *(float *)(result + 44);
    float v10 = *(float *)(result + 56);
  }
  float v8 = v10 * a4;
  a4 = v9 * a4;
LABEL_10:
  int v12 = *(_DWORD *)(result + 24);
  long long v11 = (_OWORD *)(result + 24);
  if (!v12) {
    return 0;
  }
  if (v8 > 2.0) {
    float v8 = 2.0;
  }
  if (v8 >= 0.0) {
    float v13 = v8;
  }
  else {
    float v13 = 0.0;
  }
  float v14 = a2[18];
  float v15 = a2[19];
  float v16 = a2[20];
  float v17 = a2[21];
  if (a4 > 2.0) {
    a4 = 2.0;
  }
  if (a4 >= 0.0) {
    float v18 = a4;
  }
  else {
    float v18 = 0.0;
  }
  long long v19 = v11[7];
  v23[6] = v11[6];
  v24[0] = v19;
  *(_OWORD *)((char *)v24 + 12) = *(_OWORD *)((char *)v11 + 124);
  long long v20 = v11[3];
  _DWORD v23[2] = v11[2];
  v23[3] = v20;
  long long v21 = v11[5];
  v23[4] = v11[4];
  v23[5] = v21;
  long long v22 = v11[1];
  v23[0] = *v11;
  v23[1] = v22;
  return MTActuationFillParametricBufferWithWaveform((uint64_t)v23, a3, 0.041667, v18, v13, a5, v14, v15, v16, v17);
}

uint64_t MTActuationSetFirmwareDownClick(uint64_t a1, float *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = 3758097090;
  if (a1 && a2)
  {
    uint64_t v4 = MEMORY[0x270FA5388]();
    *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v12[12] = v5;
    v11[1] = v5;
    *(_OWORD *)int v12 = v5;
    v11[0] = v5;
    signed int v9 = MTActuationCalculateWaveform(v4, a2, v11, v7, v8, 60, v6);
    if (v9 < 1) {
      return 3758097084;
    }
    else {
      return MTActuatorSetReport((uint64_t)a2, 34, (uint64_t)v11, v9);
    }
  }
  return v2;
}

uint64_t MTActuationSetFirmwareUpClick(uint64_t a1, float *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = 3758097090;
  if (a1 && a2)
  {
    uint64_t v4 = MEMORY[0x270FA5388]();
    *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v12[12] = v5;
    v11[1] = v5;
    *(_OWORD *)int v12 = v5;
    v11[0] = v5;
    signed int v9 = MTActuationCalculateWaveform(v4, a2, v11, v7, v8, 60, v6);
    if (v9 < 1) {
      return 3758097084;
    }
    else {
      return MTActuatorSetReport((uint64_t)a2, 35, (uint64_t)v11, v9);
    }
  }
  return v2;
}

uint64_t MTActuationActuate(uint64_t a1, float *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = 3758097090;
  if (a1 && a2)
  {
    uint64_t v4 = MEMORY[0x270FA5388]();
    *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v12[12] = v5;
    v11[1] = v5;
    *(_OWORD *)int v12 = v5;
    v11[0] = v5;
    signed int v9 = MTActuationCalculateWaveform(v4, a2, v11, v7, v8, 60, v6);
    if (v9 < 1) {
      return 3758097084;
    }
    else {
      return MTActuatorSetWaveform((uint64_t)a2, 83, (uint64_t)v11, v9);
    }
  }
  return v2;
}

double __MTActuationInit(uint64_t a1)
{
  if (a1)
  {
    *(void *)(a1 + 160) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 128) = 0u;
    *(_OWORD *)(a1 + 144) = 0u;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 112) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

uint64_t touchpadCodecDecodeImage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v85 = 0;
  char v86 = 0;
  unint64_t v6 = *(unsigned int *)(a1 + 664);
  uint64_t v78 = *(unsigned int *)(a1 + 668);
  uint64_t v90 = 0;
  unint64_t v91 = 0;
  uint64_t v87 = a4;
  unint64_t v88 = a5;
  unint64_t v89 = 0;
  if (!codecReadHeader(&v87, (uint64_t)&v85)) {
    return 0;
  }
  unsigned __int8 v76 = v85;
  if (v85)
  {
    if (*(void *)(a1 + 664) != __PAIR64__(HIWORD(v85), WORD2(v85)) || v86 != *(unsigned char *)(a1 + 672)) {
      return 0;
    }
    codecResetModel(a1);
  }
  if (v78)
  {
    unsigned int v7 = 0;
    uint64_t v8 = 0;
    unint64_t v9 = v89;
    uint64_t v10 = v90;
    uint64_t v75 = *(void *)(a1 + 632);
    unsigned int v11 = v91;
    int v12 = HIDWORD(v91);
    while (1)
    {
      uint64_t v13 = (v76 & (v8 != 0)) != 0 ? -(uint64_t)v6 : 0;
      unsigned int v80 = v7;
      uint64_t v79 = v8;
      if (v6) {
        break;
      }
LABEL_100:
      uint64_t v8 = v79 + 1;
      a2 += a3;
      unsigned int v7 = v80 + v6;
      if (v79 + 1 == v78) {
        goto LABEL_103;
      }
    }
    uint64_t v14 = 0;
    unint64_t v16 = v88;
    uint64_t v82 = v87;
    uint64_t v83 = v75 + 2 * v7;
    uint64_t v81 = v83 + 2 * v13;
    int v17 = *(__int16 *)(v75 + 2 * (v6 * v8) + 2 * v13);
    int v15 = v17;
    int v18 = v17;
    uint64_t v19 = v10;
    int v20 = v17;
    while (1)
    {
      uint64_t v21 = v14 + 1;
      if (v14 + 1 < v6) {
        int v20 = *(__int16 *)(v81 + 2 * v14 + 2);
      }
      int v22 = v15 - v17;
      if (v15 - v17 <= -2) {
        int v23 = -2;
      }
      else {
        int v23 = 0;
      }
      if (v22 > 1) {
        int v23 = 2;
      }
      if (v22 < -40) {
        int v23 = -1;
      }
      if (v22 <= 40) {
        int v24 = v23;
      }
      else {
        int v24 = 1;
      }
      int v25 = 25 * v24;
      int v26 = v17 - v18;
      if (v17 - v18 <= -2) {
        int v27 = -2;
      }
      else {
        int v27 = 0;
      }
      if (v26 > 1) {
        int v27 = 2;
      }
      if (v26 < -40) {
        int v27 = -1;
      }
      if (v26 <= 40) {
        int v28 = v27;
      }
      else {
        int v28 = 1;
      }
      int v29 = 5 * v28 + v25;
      int v30 = v18 - v20;
      if (v18 - v20 <= -2) {
        int v31 = -2;
      }
      else {
        int v31 = 0;
      }
      if (v30 > 1) {
        int v31 = 2;
      }
      if (v30 < -40) {
        int v31 = -1;
      }
      if (v30 <= 40) {
        int v32 = v31;
      }
      else {
        int v32 = 1;
      }
      int v33 = v29 + v32;
      int v34 = v18 - v17 + v15;
      if (v34 <= v15) {
        int v35 = v15;
      }
      else {
        int v35 = v34;
      }
      if (v34 < v15) {
        int v15 = v34;
      }
      if (v35 >= v18) {
        int v36 = v18;
      }
      else {
        int v36 = v35;
      }
      if (v15 <= v36) {
        __int16 v37 = v36;
      }
      else {
        __int16 v37 = v15;
      }
      if (v33 >= 0) {
        unsigned int v38 = v33;
      }
      else {
        unsigned int v38 = -v33;
      }
      if (v12 <= 15)
      {
        unint64_t v39 = v9 + 1;
        unint64_t v89 = v9 + 1;
        if (v9 < v16)
        {
          uint64_t v10 = v19 + 1;
          uint64_t v90 = v19 + 1;
          v11 |= *(unsigned __int8 *)(v82 + v19) << v12;
          v12 += 8;
          unint64_t v91 = __PAIR64__(v12, v11);
          ++v19;
        }
        v9 += 2;
        unint64_t v89 = v9;
        if (v39 < v16)
        {
          uint64_t v10 = v19 + 1;
          uint64_t v90 = v19 + 1;
          v11 |= *(unsigned __int8 *)(v82 + v19) << v12;
          v12 += 8;
          ++v19;
        }
      }
      uint64_t v40 = a1 + 10 * v38;
      int v41 = *(unsigned __int8 *)(v40 + 8);
      unsigned int v42 = __clz(__rbit32((unsigned __int16)v11 | 0x10000));
      if (v42 > 0xF)
      {
        unsigned int v47 = HIWORD(v11);
        int v48 = v12 - 16;
        LODWORD(v91) = HIWORD(v11);
        HIDWORD(v91) = v12 - 16;
        if (v12 <= 31)
        {
          unint64_t v49 = v9 + 1;
          unint64_t v89 = v9 + 1;
          if (v9 < v16)
          {
            uint64_t v10 = v19 + 1;
            uint64_t v90 = v19 + 1;
            v47 |= *(unsigned __int8 *)(v82 + v19) << v48;
            int v48 = v12 - 8;
            LODWORD(v91) = v47;
            HIDWORD(v91) = v12 - 8;
            ++v19;
          }
          v9 += 2;
          unint64_t v89 = v9;
          if (v49 < v16)
          {
            uint64_t v10 = v19 + 1;
            uint64_t v90 = v19 + 1;
            v47 |= *(unsigned __int8 *)(v82 + v19) << v48;
            v48 += 8;
            ++v19;
          }
        }
        unsigned int v11 = HIWORD(v47);
        int v12 = v48 - 16;
        LODWORD(v91) = HIWORD(v47);
        HIDWORD(v91) = v48 - 16;
      }
      else
      {
        unsigned int v43 = v11 >> (v42 + 1);
        int v44 = v12 - (v42 + 1);
        unint64_t v91 = __PAIR64__(v44, v43);
        if (v44 <= 15)
        {
          unint64_t v45 = v9 + 1;
          unint64_t v89 = v9 + 1;
          if (v9 < v16)
          {
            uint64_t v10 = v19 + 1;
            uint64_t v90 = v19 + 1;
            v43 |= *(unsigned __int8 *)(v82 + v19) << v44;
            v44 += 8;
            unint64_t v91 = __PAIR64__(v44, v43);
            ++v19;
          }
          v9 += 2;
          unint64_t v89 = v9;
          if (v45 < v16)
          {
            uint64_t v10 = v19 + 1;
            uint64_t v90 = v19 + 1;
            v43 |= *(unsigned __int8 *)(v82 + v19) << v44;
            v44 += 8;
            ++v19;
          }
        }
        int v46 = v43 & ((-1 << v41) ^ 0xFFFF);
        unsigned int v11 = v43 >> v41;
        int v12 = v44 - v41;
        unint64_t v91 = __PAIR64__(v12, v11);
        unsigned int v47 = v46 + (v42 << v41);
      }
      int v50 = *(_DWORD *)(v40 + 4);
      int v51 = ((unsigned __int16)v47 >> 1) ^ -(v47 & 1);
      int v52 = *(_DWORD *)v40;
      uint64_t v53 = a1 + 10 * v38;
      char v55 = *(unsigned char *)(v53 + 9);
      float v54 = (unsigned char *)(v53 + 9);
      unsigned __int8 v56 = v55 + 1;
      *float v54 = v55 + 1;
      if (v51 >= 0) {
        int v57 = v51;
      }
      else {
        int v57 = -v51;
      }
      if (v51 <= 0)
      {
        if ((v51 & 0x80000000) == 0) {
          goto LABEL_84;
        }
        int v58 = -1;
      }
      else
      {
        int v58 = 1;
      }
      *(_DWORD *)(v40 + 4) = v50 + v58;
LABEL_84:
      int v59 = v57 + v52;
      int v60 = v56;
      int v61 = v56 << v41;
      int v63 = v61 >= 2 * v59 && v41 != 0;
      int v64 = v63 << 31 >> 31;
      if (v61 >= v59) {
        char v65 = v64;
      }
      else {
        char v65 = 1;
      }
      *(_DWORD *)uint64_t v40 = v59;
      *(unsigned char *)(v40 + 8) = v41 + v65;
      if (v60 == 64)
      {
        *float v54 = 32;
        *(_DWORD *)uint64_t v40 = v59 - (v59 >> 1);
      }
      int v66 = (__int16)(v51 + ((v50 + 8) >> 4));
      if (v33 < 0) {
        int v66 = -v66;
      }
      __int16 v67 = v66 + v37;
      int v15 = (__int16)(v66 + v37);
      *(_WORD *)(a2 + 2 * v14) = v67;
      *(_WORD *)(v83 + 2 * v14++) = v67;
      int v17 = v18;
      int v18 = v20;
      if (v6 == v21) {
        goto LABEL_100;
      }
    }
  }
  int v12 = HIDWORD(v91);
LABEL_103:
  if (v12 <= 15)
  {
    unint64_t v68 = v89;
    unint64_t v69 = ++v89;
    if (v68 < v88)
    {
      uint64_t v70 = v90++;
      int v71 = *(unsigned __int8 *)(v87 + v70) << v12;
      v12 += 8;
      LODWORD(v91) = v71 | v91;
      HIDWORD(v91) = v12;
    }
    unint64_t v89 = v68 + 2;
    if (v69 < v88)
    {
      uint64_t v72 = v90++;
      LODWORD(v91) = v91 | (*(unsigned __int8 *)(v87 + v72) << v12);
      v12 += 8;
    }
  }
  int v73 = v91 & 0xFFF;
  LODWORD(v91) = v91 >> 12;
  HIDWORD(v91) = v12 - 12;
  if (v73 == codecGetFooterID(a1) && (v91 & 0x8000000000000000) == 0) {
    return v90 - ((unint64_t)HIDWORD(v91) >> 3);
  }
  return 0;
}

uint64_t touchpadGetInfoWithCompressedBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = 0;
  v6[0] = a3;
  v6[1] = a4;
  memset(&v6[2], 0, 24);
  if (a2 == 9)
  {
    if (codecReadHeader(v6, a1)) {
      return 9;
    }
    else {
      return 0;
    }
  }
  return result;
}

BOOL codecReadHeader(uint64_t *a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 8) = 0;
  *(void *)a2 = 0;
  int v2 = *((_DWORD *)a1 + 9);
  if (v2 <= 15)
  {
    unint64_t v4 = a1[1];
    unint64_t v3 = a1[2];
    a1[2] = v3 + 1;
    if (v3 < v4)
    {
      uint64_t v5 = *a1;
      uint64_t v6 = a1[3];
      a1[3] = v6 + 1;
      LODWORD(v5) = (*(unsigned __int8 *)(v5 + v6) << v2) | *((_DWORD *)a1 + 8);
      v2 += 8;
      *((_DWORD *)a1 + 8) = v5;
      *((_DWORD *)a1 + 9) = v2;
    }
    a1[2] = v3 + 2;
    if (v3 + 1 < v4)
    {
      uint64_t v7 = *a1;
      uint64_t v8 = a1[3];
      a1[3] = v8 + 1;
      *((_DWORD *)a1 + 8) |= *(unsigned __int8 *)(v7 + v8) << v2;
      v2 += 8;
    }
  }
  unsigned int v9 = a1[4] & 0x1F;
  unsigned int v10 = *((_DWORD *)a1 + 8) >> 5;
  int v11 = v2 - 5;
  *((_DWORD *)a1 + 8) = v10;
  *((_DWORD *)a1 + 9) = v2 - 5;
  unsigned int v12 = v9 - 16;
  if (v9 > 0x10)
  {
    if (v2 <= 20)
    {
      unint64_t v24 = a1[1];
      unint64_t v23 = a1[2];
      a1[2] = v23 + 1;
      if (v23 < v24)
      {
        uint64_t v25 = *a1;
        uint64_t v26 = a1[3];
        a1[3] = v26 + 1;
        v10 |= *(unsigned __int8 *)(v25 + v26) << v11;
        int v11 = v2 + 3;
        *((_DWORD *)a1 + 8) = v10;
        *((_DWORD *)a1 + 9) = v2 + 3;
      }
      a1[2] = v23 + 2;
      if (v23 + 1 < v24)
      {
        uint64_t v27 = *a1;
        uint64_t v28 = a1[3];
        a1[3] = v28 + 1;
        v10 |= *(unsigned __int8 *)(v27 + v28) << v11;
        v11 += 8;
      }
    }
    unsigned int v29 = HIWORD(v10);
    int v30 = v11 - 16;
    *((_DWORD *)a1 + 8) = HIWORD(v10);
    *((_DWORD *)a1 + 9) = v11 - 16;
    if (v11 <= 31)
    {
      unint64_t v32 = a1[1];
      unint64_t v31 = a1[2];
      a1[2] = v31 + 1;
      if (v31 < v32)
      {
        uint64_t v33 = *a1;
        uint64_t v34 = a1[3];
        a1[3] = v34 + 1;
        v29 |= *(unsigned __int8 *)(v33 + v34) << v30;
        int v30 = v11 - 8;
        *((_DWORD *)a1 + 8) = v29;
        *((_DWORD *)a1 + 9) = v11 - 8;
      }
      a1[2] = v31 + 2;
      if (v31 + 1 < v32)
      {
        uint64_t v35 = *a1;
        uint64_t v36 = a1[3];
        a1[3] = v36 + 1;
        v29 |= *(unsigned __int8 *)(v35 + v36) << v30;
        v30 += 8;
      }
    }
    int v37 = v29 & ~(-1 << v12);
    unsigned int v20 = v29 >> v12;
    int v21 = v30 - v12;
    *((_DWORD *)a1 + 8) = v20;
    *((_DWORD *)a1 + 9) = v30 - v12;
    int v22 = (unsigned __int16)v10 | (v37 << 16);
    int v19 = -1 << v9;
  }
  else
  {
    if (v2 <= 20)
    {
      unint64_t v14 = a1[1];
      unint64_t v13 = a1[2];
      a1[2] = v13 + 1;
      if (v13 < v14)
      {
        uint64_t v15 = *a1;
        uint64_t v16 = a1[3];
        a1[3] = v16 + 1;
        v10 |= *(unsigned __int8 *)(v15 + v16) << v11;
        int v11 = v2 + 3;
        *((_DWORD *)a1 + 8) = v10;
        *((_DWORD *)a1 + 9) = v2 + 3;
      }
      a1[2] = v13 + 2;
      if (v13 + 1 < v14)
      {
        uint64_t v17 = *a1;
        uint64_t v18 = a1[3];
        a1[3] = v18 + 1;
        v10 |= *(unsigned __int8 *)(v17 + v18) << v11;
        v11 += 8;
      }
    }
    int v19 = -1 << v9;
    unsigned int v20 = v10 >> v9;
    int v21 = v11 - v9;
    *((_DWORD *)a1 + 8) = v10 >> v9;
    *((_DWORD *)a1 + 9) = v21;
    int v22 = v10 & (unsigned __int16)~(unsigned __int16)(-1 << v9);
  }
  int v38 = v22 + ~v19;
  *(_DWORD *)a2 = v38;
  if (v38)
  {
    if (v21 <= 15)
    {
      unint64_t v40 = a1[1];
      unint64_t v39 = a1[2];
      a1[2] = v39 + 1;
      if (v39 < v40)
      {
        uint64_t v41 = *a1;
        uint64_t v42 = a1[3];
        a1[3] = v42 + 1;
        v20 |= *(unsigned __int8 *)(v41 + v42) << v21;
        v21 += 8;
        *((_DWORD *)a1 + 8) = v20;
        *((_DWORD *)a1 + 9) = v21;
      }
      a1[2] = v39 + 2;
      if (v39 + 1 < v40)
      {
        uint64_t v43 = *a1;
        uint64_t v44 = a1[3];
        a1[3] = v44 + 1;
        v20 |= *(unsigned __int8 *)(v43 + v44) << v21;
        v21 += 8;
      }
    }
    int v45 = v20 & 0xF;
    unsigned int v46 = v20 >> 4;
    int v47 = v21 - 4;
    *((_DWORD *)a1 + 8) = v46;
    *((_DWORD *)a1 + 9) = v21 - 4;
    int v48 = v45 + 1;
    if (v21 <= 19)
    {
      unint64_t v50 = a1[1];
      unint64_t v49 = a1[2];
      a1[2] = v49 + 1;
      if (v49 < v50)
      {
        uint64_t v51 = *a1;
        uint64_t v52 = a1[3];
        a1[3] = v52 + 1;
        v46 |= *(unsigned __int8 *)(v51 + v52) << v47;
        int v47 = v21 + 4;
        *((_DWORD *)a1 + 8) = v46;
        *((_DWORD *)a1 + 9) = v21 + 4;
      }
      a1[2] = v49 + 2;
      if (v49 + 1 < v50)
      {
        uint64_t v53 = *a1;
        uint64_t v54 = a1[3];
        a1[3] = v54 + 1;
        v46 |= *(unsigned __int8 *)(v53 + v54) << v47;
        v47 += 8;
      }
    }
    __int16 v55 = ~(unsigned __int16)(-2 << v45);
    __int16 v56 = v46 & v55;
    unsigned int v57 = v46 >> v48;
    int v58 = v47 - v48;
    *((_DWORD *)a1 + 8) = v57;
    *((_DWORD *)a1 + 9) = v47 - v48;
    *(_WORD *)(a2 + 4) = v56;
    if (v47 - v48 <= 15)
    {
      unint64_t v60 = a1[1];
      unint64_t v59 = a1[2];
      a1[2] = v59 + 1;
      if (v59 < v60)
      {
        uint64_t v61 = *a1;
        uint64_t v62 = a1[3];
        a1[3] = v62 + 1;
        v57 |= *(unsigned __int8 *)(v61 + v62) << v58;
        v58 += 8;
        *((_DWORD *)a1 + 8) = v57;
        *((_DWORD *)a1 + 9) = v58;
      }
      a1[2] = v59 + 2;
      if (v59 + 1 < v60)
      {
        uint64_t v63 = *a1;
        uint64_t v64 = a1[3];
        a1[3] = v64 + 1;
        v57 |= *(unsigned __int8 *)(v63 + v64) << v58;
        v58 += 8;
      }
    }
    __int16 v65 = v57 & v55;
    unsigned int v66 = v57 >> v48;
    int v67 = v58 - v48;
    *((_DWORD *)a1 + 8) = v66;
    *((_DWORD *)a1 + 9) = v67;
    *(_WORD *)(a2 + 6) = v65;
    if (v67 <= 15)
    {
      unint64_t v69 = a1[1];
      unint64_t v68 = a1[2];
      a1[2] = v68 + 1;
      if (v68 < v69)
      {
        uint64_t v70 = *a1;
        uint64_t v71 = a1[3];
        a1[3] = v71 + 1;
        v66 |= *(unsigned __int8 *)(v70 + v71) << v67;
        v67 += 8;
        *((_DWORD *)a1 + 8) = v66;
        *((_DWORD *)a1 + 9) = v67;
      }
      a1[2] = v68 + 2;
      if (v68 + 1 < v69)
      {
        uint64_t v72 = *a1;
        uint64_t v73 = a1[3];
        a1[3] = v73 + 1;
        v66 |= *(unsigned __int8 *)(v72 + v73) << v67;
        v67 += 8;
      }
    }
    char v74 = v66 & 0x1F;
    unsigned int v75 = v66 >> 5;
    int v21 = v67 - 5;
    *((_DWORD *)a1 + 8) = v75;
    *((_DWORD *)a1 + 9) = v67 - 5;
    *(unsigned char *)(a2 + 8) = v74 + 1;
  }
  return (v21 & 0x80000000) == 0 && a1[3] != v21 >> 3;
}

uint64_t *codecWriteHeader(uint64_t *result, int a2, int a3, __int16 a4, int a5)
{
  unsigned int v5 = __clz(a5 + 1);
  unsigned int v6 = 31 - v5;
  int v7 = *((_DWORD *)result + 9);
  unsigned int v8 = *((_DWORD *)result + 8) | ((unsigned __int16)(31 - v5) << v7);
  int v9 = v7 + 5;
  *((_DWORD *)result + 8) = v8;
  *((_DWORD *)result + 9) = v7 + 5;
  if (v7 >= 12)
  {
    unint64_t v10 = result[1];
    unint64_t v11 = result[2];
    unint64_t v12 = v11 + 1;
    result[2] = v11 + 1;
    if (v11 < v10)
    {
      uint64_t v13 = *result;
      uint64_t v14 = result[3];
      result[3] = v14 + 1;
      *(unsigned char *)(v13 + v14) = v8;
      unsigned int v8 = *((_DWORD *)result + 8);
      int v9 = *((_DWORD *)result + 9);
      unint64_t v10 = result[1];
      unint64_t v12 = result[2];
    }
    unsigned int v15 = v8 >> 8;
    int v16 = v9 - 8;
    *((_DWORD *)result + 8) = v15;
    *((_DWORD *)result + 9) = v16;
    result[2] = v12 + 1;
    if (v12 < v10)
    {
      uint64_t v17 = *result;
      uint64_t v18 = result[3];
      result[3] = v18 + 1;
      *(unsigned char *)(v17 + v18) = v15;
      unsigned int v15 = *((_DWORD *)result + 8);
      int v16 = *((_DWORD *)result + 9);
    }
    unsigned int v8 = v15 >> 8;
    int v9 = v16 - 8;
  }
  unsigned int v19 = v8 | ((unsigned __int16)(a5 + 1 - (0x80000000 >> v5)) << v9);
  int v20 = v9 + v6;
  *((_DWORD *)result + 8) = v19;
  *((_DWORD *)result + 9) = v9 + v6;
  if ((int)(v9 + v6) >= 17)
  {
    unint64_t v21 = result[1];
    unint64_t v22 = result[2];
    unint64_t v23 = v22 + 1;
    result[2] = v22 + 1;
    if (v22 < v21)
    {
      uint64_t v24 = *result;
      uint64_t v25 = result[3];
      result[3] = v25 + 1;
      *(unsigned char *)(v24 + v25) = v19;
      unsigned int v19 = *((_DWORD *)result + 8);
      int v20 = *((_DWORD *)result + 9);
      unint64_t v21 = result[1];
      unint64_t v23 = result[2];
    }
    unsigned int v26 = v19 >> 8;
    int v27 = v20 - 8;
    *((_DWORD *)result + 8) = v26;
    *((_DWORD *)result + 9) = v27;
    result[2] = v23 + 1;
    if (v23 < v21)
    {
      uint64_t v28 = *result;
      uint64_t v29 = result[3];
      result[3] = v29 + 1;
      *(unsigned char *)(v28 + v29) = v26;
      unsigned int v26 = *((_DWORD *)result + 8);
      int v27 = *((_DWORD *)result + 9);
    }
    unsigned int v19 = v26 >> 8;
    int v20 = v27 - 8;
    *((_DWORD *)result + 8) = v19;
    *((_DWORD *)result + 9) = v20;
  }
  if (a5)
  {
    unsigned int v30 = __clz(a3 | a2);
    unsigned int v31 = v19 | ((unsigned __int16)(31 - v30) << v20);
    int v32 = v20 + 4;
    *((_DWORD *)result + 8) = v31;
    *((_DWORD *)result + 9) = v20 + 4;
    if (v20 >= 13)
    {
      unint64_t v33 = result[1];
      unint64_t v34 = result[2];
      unint64_t v35 = v34 + 1;
      result[2] = v34 + 1;
      if (v34 < v33)
      {
        uint64_t v36 = *result;
        uint64_t v37 = result[3];
        result[3] = v37 + 1;
        *(unsigned char *)(v36 + v37) = v31;
        unsigned int v31 = *((_DWORD *)result + 8);
        int v32 = *((_DWORD *)result + 9);
        unint64_t v33 = result[1];
        unint64_t v35 = result[2];
      }
      unsigned int v38 = v31 >> 8;
      int v39 = v32 - 8;
      *((_DWORD *)result + 8) = v38;
      *((_DWORD *)result + 9) = v39;
      result[2] = v35 + 1;
      if (v35 < v33)
      {
        uint64_t v40 = *result;
        uint64_t v41 = result[3];
        result[3] = v41 + 1;
        *(unsigned char *)(v40 + v41) = v38;
        unsigned int v38 = *((_DWORD *)result + 8);
        int v39 = *((_DWORD *)result + 9);
      }
      unsigned int v31 = v38 >> 8;
      int v32 = v39 - 8;
    }
    unsigned int v42 = 32 - v30;
    unsigned int v43 = v31 | ((unsigned __int16)a2 << v32);
    unsigned int v44 = v32 + v42;
    *((_DWORD *)result + 8) = v43;
    *((_DWORD *)result + 9) = v32 + v42;
    if ((int)(v32 + v42) >= 17)
    {
      unint64_t v45 = result[1];
      unint64_t v46 = result[2];
      unint64_t v47 = v46 + 1;
      result[2] = v46 + 1;
      if (v46 < v45)
      {
        uint64_t v48 = *result;
        uint64_t v49 = result[3];
        result[3] = v49 + 1;
        *(unsigned char *)(v48 + v49) = v43;
        unsigned int v43 = *((_DWORD *)result + 8);
        unsigned int v44 = *((_DWORD *)result + 9);
        unint64_t v45 = result[1];
        unint64_t v47 = result[2];
      }
      unsigned int v50 = v43 >> 8;
      unsigned int v51 = v44 - 8;
      *((_DWORD *)result + 8) = v50;
      *((_DWORD *)result + 9) = v51;
      result[2] = v47 + 1;
      if (v47 < v45)
      {
        uint64_t v52 = *result;
        uint64_t v53 = result[3];
        result[3] = v53 + 1;
        *(unsigned char *)(v52 + v53) = v50;
        unsigned int v50 = *((_DWORD *)result + 8);
        unsigned int v51 = *((_DWORD *)result + 9);
      }
      unsigned int v43 = v50 >> 8;
      unsigned int v44 = v51 - 8;
    }
    unsigned int v54 = v43 | ((unsigned __int16)a3 << v44);
    int v55 = v44 + v42;
    *((_DWORD *)result + 8) = v54;
    *((_DWORD *)result + 9) = v55;
    if (v55 >= 17)
    {
      unint64_t v56 = result[1];
      unint64_t v57 = result[2];
      unint64_t v58 = v57 + 1;
      result[2] = v57 + 1;
      if (v57 < v56)
      {
        uint64_t v59 = *result;
        uint64_t v60 = result[3];
        result[3] = v60 + 1;
        *(unsigned char *)(v59 + v60) = v54;
        unsigned int v54 = *((_DWORD *)result + 8);
        int v55 = *((_DWORD *)result + 9);
        unint64_t v56 = result[1];
        unint64_t v58 = result[2];
      }
      unsigned int v61 = v54 >> 8;
      int v62 = v55 - 8;
      *((_DWORD *)result + 8) = v61;
      *((_DWORD *)result + 9) = v62;
      result[2] = v58 + 1;
      if (v58 < v56)
      {
        uint64_t v63 = *result;
        uint64_t v64 = result[3];
        result[3] = v64 + 1;
        *(unsigned char *)(v63 + v64) = v61;
        unsigned int v61 = *((_DWORD *)result + 8);
        int v62 = *((_DWORD *)result + 9);
      }
      unsigned int v54 = v61 >> 8;
      int v55 = v62 - 8;
    }
    unsigned int v65 = v54 | ((unsigned __int16)(a4 - 1) << v55);
    int v66 = v55 + 5;
    *((_DWORD *)result + 8) = v65;
    *((_DWORD *)result + 9) = v55 + 5;
    if (v55 >= 12)
    {
      unint64_t v67 = result[1];
      unint64_t v68 = result[2];
      unint64_t v69 = v68 + 1;
      result[2] = v68 + 1;
      if (v68 < v67)
      {
        uint64_t v70 = *result;
        uint64_t v71 = result[3];
        result[3] = v71 + 1;
        *(unsigned char *)(v70 + v71) = v65;
        unsigned int v65 = *((_DWORD *)result + 8);
        int v66 = *((_DWORD *)result + 9);
        unint64_t v67 = result[1];
        unint64_t v69 = result[2];
      }
      unsigned int v72 = v65 >> 8;
      int v73 = v66 - 8;
      *((_DWORD *)result + 8) = v72;
      *((_DWORD *)result + 9) = v73;
      result[2] = v69 + 1;
      if (v69 < v67)
      {
        uint64_t v74 = *result;
        uint64_t v75 = result[3];
        result[3] = v75 + 1;
        *(unsigned char *)(v74 + v75) = v72;
        unsigned int v72 = *((_DWORD *)result + 8);
        int v73 = *((_DWORD *)result + 9);
      }
      *((_DWORD *)result + 8) = v72 >> 8;
      *((_DWORD *)result + 9) = v73 - 8;
    }
  }
  return result;
}

void *touchpadCodecCreate(int a1, int a2, int a3, int a4, uint64_t a5)
{
  unsigned int v5 = 0;
  if (a1)
  {
    if (a2)
    {
      if (a3 == 16 && !a4 && !a5)
      {
        unsigned int v8 = calloc(1uLL, 0x2A8uLL);
        unsigned int v5 = v8;
        if (v8)
        {
          v8[81] = (a2 * a1);
          v8[80] = 2 * (a2 * a1);
          v8[82] = 0;
          *((_DWORD *)v8 + 166) = a1;
          *((_DWORD *)v8 + 167) = a2;
          *((unsigned char *)v8 + 672) = 16;
          int v9 = malloc(2 * (a2 * a1));
          v5[79] = v9;
          if (v9)
          {
            bzero(v9, 2 * (a2 * a1));
            for (uint64_t i = 0; i != 630; i += 10)
            {
              unint64_t v11 = (char *)v5 + i;
              *(void *)unint64_t v11 = 32;
              *((_WORD *)v11 + 4) = 261;
            }
            v5[82] = 0;
          }
          else
          {
            free(v5);
            return 0;
          }
        }
      }
    }
  }
  return v5;
}

void codecResetModel(uint64_t a1)
{
  bzero(*(void **)(a1 + 632), *(void *)(a1 + 640));
  for (uint64_t i = 0; i != 630; i += 10)
  {
    uint64_t v3 = a1 + i;
    *(void *)uint64_t v3 = 32;
    *(_WORD *)(v3 + 8) = 261;
  }
  *(void *)(a1 + 656) = 0;
}

void touchpadCodecDestroy(void **a1)
{
  if (a1)
  {
    free(a1[79]);
    free(a1);
  }
}

uint64_t codecGetFooterID(uint64_t a1)
{
  uint64_t v1 = 0;
  int v2 = 0;
  do
  {
    int v2 = *(_DWORD *)(a1 + v1) ^ __ROR4__(v2, 31);
    v1 += 10;
  }
  while (v1 != 630);
  return (-1640531535 * v2) >> 20;
}

void mt_FillDefaultMultitouchRegion_cold_1()
{
  __assert_rtn("mt_FillDefaultMultitouchRegion", "mt_PassThruShared.c", 131, "ysize_rowsinuse <= MULTITOUCH_ROWS");
}

void mt_FillDefaultMultitouchRegion_cold_2()
{
  __assert_rtn("mt_FillDefaultMultitouchRegion", "mt_PassThruShared.c", 132, "xsize_colsinuse <= MULTITOUCH_COLS");
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void *__cdecl CFAllocatorReallocate(CFAllocatorRef allocator, void *ptr, CFIndex newsize, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE42B0](allocator, ptr, newsize, hint);
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE42E8](theArray, range.location, range.length, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x270EE45B8](allocator, bundleURL);
}

void *__cdecl CFBundleGetFunctionPointerForName(CFBundleRef bundle, CFStringRef functionName)
{
  return (void *)MEMORY[0x270EE45D8](bundle, functionName);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

void CFDataDeleteBytes(CFMutableDataRef theData, CFRange range)
{
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x270EE4830](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4AE8](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x270EE4AF0](allocator, *(void *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortGetContext(CFMachPortRef port, CFMachPortContext *context)
{
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x270EE4B00](port);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
}

Boolean CFMachPortIsValid(CFMachPortRef port)
{
  return MEMORY[0x270EE4B10](port);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x270EE4D60](propertyList, stream, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRun(void)
{
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x270EE5538](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x270EE5558](stream);
}

CFDataRef IOCFSerialize(CFTypeRef object, CFOptionFlags options)
{
  return (CFDataRef)MEMORY[0x270EF3EF0](object, options);
}

CFTypeRef IOCFUnserializeBinary(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x270EF3F00](buffer, bufferSize, allocator, options, errorString);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x270EF3F50](*(void *)&connect, *(void *)&memoryType, *(void *)&intoTask, atAddress, ofSize, *(void *)&options);
}

kern_return_t IOConnectSetCFProperties(io_connect_t connect, CFTypeRef properties)
{
  return MEMORY[0x270EF3F68](*(void *)&connect, properties);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x270EF3F78](*(void *)&connect, *(void *)&type, *(void *)&port, reference);
}

kern_return_t IOConnectUnmapMemory(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x270EF3FB8](*(void *)&connect, *(void *)&memoryType, *(void *)&fromTask, atAddress);
}

mach_port_t IODataQueueAllocateNotificationPort(void)
{
  return MEMORY[0x270EF3FD8]();
}

Boolean IODataQueueDataAvailable(IODataQueueMemory *dataQueue)
{
  return MEMORY[0x270EF3FE0](dataQueue);
}

IOReturn IODataQueueDequeue(IODataQueueMemory *dataQueue, void *data, uint32_t *dataSize)
{
  return MEMORY[0x270EF3FE8](dataQueue, data, dataSize);
}

IOReturn IODataQueueWaitForAvailableData(IODataQueueMemory *dataQueue, mach_port_t notificationPort)
{
  return MEMORY[0x270EF3FF8](dataQueue, *(void *)&notificationPort);
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x270EF4310]();
}

uint64_t IOHIDEventGetEvent()
{
  return MEMORY[0x270EF4328]();
}

uint64_t IOHIDEventGetFloatValue()
{
  return MEMORY[0x270EF4340]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x270EF4348]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x270EF4380]();
}

uint64_t IOHIDEventGetVendorDefinedData()
{
  return MEMORY[0x270EF4398]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EF47D0](notify);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x270EF47E0](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x270EF4828](*(void *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x270EF49D0](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x270EF49F8](*(void *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x270EF4A18](*(void *)&entry, plane, parent);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x270EF4A38](*(void *)&entry, entryID);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4A40](entryID);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x270EF4A60](*(void *)&entry, propertyName, property);
}

uint64_t IOReportChannelGetChannelName()
{
  return MEMORY[0x270F92718]();
}

uint64_t IOReportCopyChannelsForDriver()
{
  return MEMORY[0x270F92750]();
}

uint64_t IOReportCreateSamples()
{
  return MEMORY[0x270F92780]();
}

uint64_t IOReportCreateSubscription()
{
  return MEMORY[0x270F92798]();
}

uint64_t IOReportGetChannelCount()
{
  return MEMORY[0x270F927A0]();
}

uint64_t IOReportIterate()
{
  return MEMORY[0x270F927D8]();
}

uint64_t IOReportSimpleGetIntegerValue()
{
  return MEMORY[0x270F92800]();
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x270EF4A88](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

kern_return_t IOServiceWaitQuiet(io_service_t service, mach_timespec_t *waitTime)
{
  return MEMORY[0x270EF4AF0](*(void *)&service, waitTime);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x270ED7E40]();
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x270ED87B0](__count, __size);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x270ED8ED0](a1, *(void *)&a2, *(void *)&a3);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x270ED9580](source);
}

void dispatch_suspend(dispatch_object_t object)
{
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x270ED98A0](*(void *)&a1, a2);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
}

uint8_t *__cdecl getsectiondata(const mach_header_64 *mhp, const char *segname, const char *sectname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x270ED9D60](mhp, segname, sectname, size);
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x270ED9E58](__x, __y);
  return result;
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDA190](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDA210](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}

int putchar(int a1)
{
  return MEMORY[0x270EDB090](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

uint64_t work_interval_create()
{
  return MEMORY[0x270EDBC08]();
}

uint64_t work_interval_destroy()
{
  return MEMORY[0x270EDBC10]();
}

uint64_t work_interval_join()
{
  return MEMORY[0x270EDBC18]();
}

uint64_t work_interval_leave()
{
  return MEMORY[0x270EDBC20]();
}

uint64_t work_interval_notify()
{
  return MEMORY[0x270EDBC28]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}