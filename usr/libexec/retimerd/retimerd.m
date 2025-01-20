void *sub_1000010B4(void *a1, const char *a2)
{
  CFStringRef v3;

  v3 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  *a1 = &off_100008418;
  a1[1] = v3;
  a1[2] = 0;
  return a1;
}

void *sub_100001110(void *result, uint64_t a2)
{
  *result = &off_100008418;
  result[1] = a2;
  result[2] = 0;
  return result;
}

uint64_t sub_100001134(uint64_t a1, io_object_t object)
{
  *(void *)a1 = &off_100008418;
  IOObjectRetain(object);
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = object;
  *(_DWORD *)(a1 + 20) = 0;
  return a1;
}

void *sub_100001188(void *a1)
{
  *a1 = &off_100008418;
  sub_1000011E0((uint64_t)a1);
  v2 = (const void *)a1[1];
  if (v2) {
    CFRelease(v2);
  }
  a1[1] = 0;
  return a1;
}

uint64_t sub_1000011E0(uint64_t a1)
{
  io_connect_t v2 = *(_DWORD *)(a1 + 20);
  if (v2)
  {
    IOConnectRelease(v2);
    *(_DWORD *)(a1 + 20) = 0;
  }
  uint64_t result = *(unsigned int *)(a1 + 16);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *(_DWORD *)(a1 + 16) = 0;
  }
  return result;
}

void sub_100001220(void *a1)
{
}

uint64_t sub_100001238(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &off_100008418;
  *(void *)(a1 + 8) = CFStringCreateCopy(kCFAllocatorDefault, *(CFStringRef *)(a2 + 8));
  io_object_t v4 = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 16) = v4;
  IOObjectRetain(v4);
  io_connect_t v5 = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 20) = v5;
  IOConnectAddRef(v5);
  return a1;
}

uint64_t sub_1000012B0(uint64_t a1)
{
  io_service_t MatchingService = *(_DWORD *)(a1 + 16);
  if (!MatchingService)
  {
    v3 = IOServiceMatching("AppleTypeCRetimer");
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryAddValue(Mutable, @"atcrt-name", *(const void **)(a1 + 8));
    CFDictionaryAddValue(v3, @"IOPropertyMatch", Mutable);
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
    *(_DWORD *)(a1 + 16) = MatchingService;
    if (!MatchingService) {
      return 56;
    }
  }
  task_port_t v5 = mach_task_self_;

  return IOServiceOpen(MatchingService, v5, 0, (io_connect_t *)(a1 + 20));
}

uint64_t sub_100001390(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = a2;
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  if (v2) {
    return IOConnectCallScalarMethod(v2, 0, &v4, 1u, 0, 0);
  }
  else {
    return 5;
  }
}

uint64_t sub_100001408(uint64_t a1, BOOL *a2)
{
  uint32_t outputCnt = 1;
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  if (!v2) {
    return 5;
  }
  uint64_t result = IOConnectCallScalarMethod(v2, 1u, 0, 0, &output, &outputCnt);
  *a2 = output == 1;
  return result;
}

uint64_t sub_10000149C(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = a2;
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  if (v2) {
    return IOConnectCallScalarMethod(v2, 3u, &v4, 1u, 0, 0);
  }
  else {
    return 5;
  }
}

uint64_t sub_100001514(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  if (v2) {
    return IOConnectCallScalarMethod(v2, 2u, &v4, 1u, 0, 0);
  }
  else {
    return 5;
  }
}

__CFArray *sub_100001588()
{
  io_iterator_t existing = 0;
  CFDictionaryRef v0 = IOServiceMatching("AppleTypeCRetimer");
  mach_error_t MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v0, &existing);
  if (MatchingServices)
  {
    mach_port_t v2 = __stderrp;
    v3 = mach_error_string(MatchingServices);
    fprintf(v2, "ERROR: failed to get matching services: %s\n", v3);
    return 0;
  }
  else
  {
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      io_object_t v5 = IOIteratorNext(existing);
      if (v5)
      {
        io_registry_entry_t v6 = v5;
        do
        {
          CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v6, @"atcrt-name", kCFAllocatorDefault, 0);
          if (CFProperty)
          {
            v8 = CFProperty;
            CFArrayAppendValue(Mutable, CFProperty);
            CFRelease(v8);
            IOObjectRelease(v6);
          }
          else
          {
            fprintf(__stderrp, "ERROR: failed to get %s property from a %s node\n", "atcrt-name", "AppleTypeCRetimer");
          }
          io_registry_entry_t v6 = IOIteratorNext(existing);
        }
        while (v6);
      }
      IOObjectRelease(existing);
      v11.length = CFArrayGetCount(Mutable);
      v11.location = 0;
      CFArraySortValues(Mutable, v11, (CFComparatorFunction)&_CFStringCompare, 0);
    }
    else
    {
      fwrite("ERROR: failed to allocate an array\n", 0x23uLL, 1uLL, __stderrp);
    }
  }
  return Mutable;
}

uint64_t sub_10000173C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  input[0] = a2;
  input[1] = a4;
  uint32_t outputCnt = 1;
  mach_port_t v4 = *(_DWORD *)(a1 + 20);
  if (!v4) {
    return 5;
  }
  uint64_t result = IOConnectCallScalarMethod(v4, 4u, input, 2u, &output, &outputCnt);
  if (!result) {
    *a3 = output;
  }
  return result;
}

uint64_t sub_1000017D0(uint64_t a1, uint64_t a2, void *outputStruct, size_t a4, uint64_t a5)
{
  input[0] = a2;
  input[1] = a5;
  size_t v7 = a4;
  mach_port_t v5 = *(_DWORD *)(a1 + 20);
  if (v5) {
    return IOConnectCallMethod(v5, 5u, input, 2u, 0, 0, 0, 0, outputStruct, &v7);
  }
  else {
    return 5;
  }
}

uint64_t sub_100001858(uint64_t a1, void *outputStruct, size_t a3)
{
  size_t v4 = a3;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 6u, 0, 0, 0, 0, 0, 0, outputStruct, &v4);
}

uint64_t sub_1000018A4(uint64_t a1, uint64_t *a2)
{
  uint32_t outputCnt = 1;
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  if (!v2) {
    return 5;
  }
  uint64_t result = IOConnectCallScalarMethod(v2, 7u, 0, 0, &output, &outputCnt);
  *a2 = output;
  return result;
}

void sub_100001930()
{
}

double sub_1000019D0(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = @"AP";
  double result = 0.0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(void *)(a1 + 80) = @"Faulting task stack frame is not available.";
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(void *)(a1 + 120) = 0;
  return result;
}

CFArrayRef sub_100001A08(uint64_t a1, const __CFDictionary *a2)
{
  CFTypeID TypeID = CFNumberGetTypeID();
  *(void *)a1 = sub_100002058(a2, @"assert_id", TypeID);
  CFTypeID v5 = CFNumberGetTypeID();
  *(void *)(a1 + 8) = sub_100002058(a2, @"retimer_version", v5);
  CFTypeID v6 = CFStringGetTypeID();
  *(void *)(a1 + 16) = sub_100002058(a2, @"instance_name", v6);
  CFTypeID v7 = CFDictionaryGetTypeID();
  CFArrayRef result = (const __CFArray *)sub_100002058(a2, @"crashlog", v7);
  if (result)
  {
    CFDictionaryRef v9 = result;
    CFTypeID v10 = CFArrayGetTypeID();
    CFArrayRef result = (const __CFArray *)sub_100002058(a2, @"memory_sections", v10);
    if (result)
    {
      CFArrayRef result = (const __CFArray *)sub_100002098((void *)(a1 + 24), v9, result);
      if (result)
      {
        char valuePtr = 0;
        CFNumberGetValue(*(CFNumberRef *)(a1 + 8), kCFNumberCharType, &valuePtr);
        if (valuePtr == 1)
        {
          CFTypeID v11 = CFDictionaryGetTypeID();
          if (sub_100002058(a2, @"phy_crashlog", v11)) {
            operator new();
          }
        }
        return (const __CFArray *)1;
      }
    }
  }
  return result;
}

double sub_100001BA0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = a2;
  double result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(void *)(a1 + 56) = @"Faulting task stack frame is not available.";
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  return result;
}

size_t sub_100001BC8(const __CFDictionary *a1, void *a2)
{
  if (a1 && (CFTypeID v4 = CFGetTypeID(a1), v4 == CFDictionaryGetTypeID()))
  {
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, @"section-name");
    if (Value && (CFStringRef v6 = Value, v7 = CFGetTypeID(Value), v7 == CFStringGetTypeID()))
    {
      CFStringRef v8 = (const __CFString *)CFDictionaryGetValue(a1, @"section-signature");
      if (v8)
      {
        CFStringRef v9 = v8;
        CFTypeID v10 = CFGetTypeID(v8);
        if (v10 == CFStringGetTypeID())
        {
          if (CFStringCompare(v9, @"Cver", 0) || CFStringCompare(v6, @"Version Section", 0))
          {
            if (CFStringCompare(v9, @"Ctim", 0) || CFStringCompare(v6, @"Time Section", 0))
            {
              if (CFStringCompare(v9, @"CrgM", 0) || CFStringCompare(v6, @"Register Frame Section", 0))
              {
                if (CFStringCompare(v9, @"Ccst", 0) || CFStringCompare(v6, @"Callstack Section", 0))
                {
                  size_t result = CFStringCompare(v9, @"Crtk", 0);
                  if (!result)
                  {
                    size_t result = CFStringCompare(v6, @"Task List Section", 0);
                    if (!result)
                    {
                      size_t result = (size_t)sub_100001ED8(a1, @"tasks");
                      a2[10] = result;
                    }
                  }
                }
                else
                {
                  a2[9] = sub_100001ED8(a1, @"stack");
                  size_t result = (size_t)sub_100001E70(a1, @"stack-description");
                  a2[8] = result;
                }
              }
              else
              {
                size_t result = (size_t)sub_100001E70(a1, @"registers");
                a2[7] = result;
              }
            }
            else
            {
              size_t result = (size_t)sub_100001E70(a1, @"time");
              a2[6] = result;
            }
          }
          else
          {
            a2[5] = sub_100001E70(a1, @"uuid");
            size_t result = (size_t)sub_100001E70(a1, @"version");
            a2[4] = result;
          }
          return result;
        }
      }
      v12 = __stderrp;
      v13 = "Invalid crash log section signature\n";
      size_t v14 = 36;
    }
    else
    {
      v12 = __stderrp;
      v13 = "Invalid crash log section name\n";
      size_t v14 = 31;
    }
  }
  else
  {
    v12 = __stderrp;
    v13 = "Invalid crash log section\n";
    size_t v14 = 26;
  }

  return fwrite(v13, v14, 1uLL, v12);
}

CFStringRef sub_100001E70(const __CFDictionary *a1, const void *a2)
{
  CFTypeID TypeID = CFStringGetTypeID();
  CFStringRef result = (const __CFString *)sub_100002058(a1, a2, TypeID);
  if (result)
  {
    return CFStringCreateCopy(kCFAllocatorDefault, result);
  }
  return result;
}

CFArrayRef sub_100001ED8(const __CFDictionary *a1, const void *a2)
{
  CFTypeID TypeID = CFArrayGetTypeID();
  CFArrayRef result = (const __CFArray *)sub_100002058(a1, a2, TypeID);
  if (result)
  {
    return CFArrayCreateCopy(kCFAllocatorDefault, result);
  }
  return result;
}

void sub_100001F40(const __CFDictionary *a1, uint64_t a2)
{
  CFIndex Count = CFDictionaryGetCount(a1);
  MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, Count, a1);
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(a1, @"data");
  BytePtr = CFDataGetBytePtr(Value);
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  if (CFDataGetLength(Value) >= 1)
  {
    CFIndex v9 = 0;
    do
      CFStringAppendFormat(Mutable, 0, @"%02x", BytePtr[v9++]);
    while (v9 < CFDataGetLength(Value));
  }
  CFDictionaryReplaceValue(MutableCopy, @"data", Mutable);
  CFArrayAppendValue(*(CFMutableArrayRef *)(a2 + 88), MutableCopy);
  CFRelease(MutableCopy);

  CFRelease(Mutable);
}

const void *sub_100002058(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  CFDataRef Value = CFDictionaryGetValue(a1, a2);
  if (!Value) {
    return 0;
  }
  CFTypeID v5 = Value;
  if (CFGetTypeID(Value) != a3) {
    return 0;
  }
  return v5;
}

BOOL sub_100002098(void *a1, const __CFDictionary *a2, const __CFArray *a3)
{
  CFTypeID TypeID = CFDataGetTypeID();
  CFTypeID v7 = sub_100002058(a2, @"data", TypeID);
  if (v7)
  {
    CFDictionaryRef v8 = (const __CFDictionary *)RTBuddyCrashlogDecode();
    if (v8)
    {
      CFDictionaryRef v9 = v8;
      a1[1] = sub_100001E70(v8, @"crashlog-version");
      a1[2] = sub_100001E70(v9, @"panic");
      a1[3] = sub_100001E70(v9, @"exception");
      CFTypeID v10 = CFArrayGetTypeID();
      CFArrayRef v11 = (const __CFArray *)sub_100002058(v9, @"sections", v10);
      if (v11)
      {
        CFArrayRef v12 = v11;
        v16.length = CFArrayGetCount(v11);
        v16.location = 0;
        CFArrayApplyFunction(v12, v16, (CFArrayApplierFunction)sub_100001BC8, a1);
      }
      CFIndex Count = CFArrayGetCount(a3);
      a1[11] = CFArrayCreateMutable(kCFAllocatorDefault, Count, &kCFTypeArrayCallBacks);
      v17.length = CFArrayGetCount(a3);
      v17.location = 0;
      CFArrayApplyFunction(a3, v17, (CFArrayApplierFunction)sub_100001F40, a1);
      CFRelease(v9);
    }
    else
    {
      CFIndex v14 = CFArrayGetCount(a3);
      a1[11] = CFArrayCreateMutable(kCFAllocatorDefault, v14, &kCFTypeArrayCallBacks);
      v18.length = CFArrayGetCount(a3);
      v18.location = 0;
      CFArrayApplyFunction(a3, v18, (CFArrayApplierFunction)sub_100001F40, a1);
    }
  }
  return v7 != 0;
}

CFStringRef sub_100002244(uint64_t a1)
{
  char valuePtr = 0;
  CFNumberGetValue(*(CFNumberRef *)(a1 + 8), kCFNumberCharType, &valuePtr);
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 2, &kCFTypeArrayCallBacks);
  v3 = sub_10000258C(a1 + 24, *(const void **)(a1 + 16));
  CFArrayAppendValue(Mutable, v3);
  if (v3) {
    CFRelease(v3);
  }
  if (valuePtr == 1)
  {
    uint64_t v4 = *(void *)(a1 + 120);
    if (v4)
    {
      CFTypeID v5 = sub_10000258C(v4, *(const void **)(a1 + 16));
      CFArrayAppendValue(Mutable, v5);
      if (v5) {
        CFRelease(v5);
      }
    }
  }
  sub_100005F00(v18, "log-version", "1.0");
  sub_100006050(v19, "accessory_type", "rtm");
  if (valuePtr == 1) {
    CFStringRef v6 = "rtm2,1";
  }
  else {
    CFStringRef v6 = "rtm1,1";
  }
  sub_10000609C(&v20, "accessory_machine_config", v6);
  if (Mutable) {
    CFRetain(Mutable);
  }
  sub_100002D00(cf, Mutable);
  sub_1000060E8((uint64_t)v21, "crashlogs", cf);
  __p[0] = v18;
  __p[1] = (void *)4;
  CFDictionaryRef v7 = sub_100002DC8((uint64_t)__p);
  uint64_t v8 = 0;
  cf[1] = v7;
  do
  {
    CFDictionaryRef v9 = *(const void **)&v21[v8 + 8];
    if (v9) {
      CFRelease(v9);
    }
    CFTypeID v10 = *(const void **)&v21[v8];
    if (v10) {
      CFRelease(v10);
    }
    v8 -= 16;
  }
  while (v8 != -64);
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  v19[1] = 0;
  sub_1000032A4(v7, 0, 0, (uint64_t)v18, (uint64_t)__p);
  sub_100005E7C(v18);
  if (v15 >= 0) {
    CFArrayRef v11 = __p;
  }
  else {
    CFArrayRef v11 = (void **)__p[0];
  }
  CFStringRef v12 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)v11, 0x8000100u);
  if ((v15 & 0x80000000) == 0)
  {
    if (!v7) {
      return v12;
    }
    goto LABEL_29;
  }
  operator delete(__p[0]);
  if (v7) {
LABEL_29:
  }
    CFRelease(v7);
  return v12;
}

void sub_1000024B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,char a22)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_100001220(exception_object);
}

__CFDictionary *sub_10000258C(uint64_t a1, const void *a2)
{
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFTypeID v5 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFStringRef v6 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryRef v7 = v6;
  uint64_t v8 = *(const void **)(a1 + 72);
  if (v8) {
    CFDictionaryAddValue(v6, @"stack", v8);
  }
  CFDictionaryRef v9 = *(const void **)(a1 + 64);
  if (v9) {
    CFDictionaryAddValue(v7, @"stack-description", v9);
  }
  if (a2) {
    CFDictionaryAddValue(v5, @"instance_name", a2);
  }
  CFTypeID v10 = *(const void **)(a1 + 16);
  if (v10) {
    CFDictionaryAddValue(v5, @"panic", v10);
  }
  CFArrayRef v11 = *(const void **)(a1 + 8);
  if (v11) {
    CFDictionaryAddValue(v5, @"crashlog-version", v11);
  }
  CFStringRef v12 = *(const void **)(a1 + 24);
  if (v12) {
    CFDictionaryAddValue(v5, @"exception", v12);
  }
  v13 = *(const void **)(a1 + 32);
  if (v13) {
    CFDictionaryAddValue(v5, @"version", v13);
  }
  CFIndex v14 = *(const void **)(a1 + 40);
  if (v14) {
    CFDictionaryAddValue(v5, @"uuid", v14);
  }
  if (v7) {
    CFDictionaryAddValue(v5, @"call-stack", v7);
  }
  char v15 = *(const void **)(a1 + 56);
  if (v15) {
    CFDictionaryAddValue(v5, @"registers", v15);
  }
  CFRange v16 = *(const void **)(a1 + 80);
  if (v16) {
    CFDictionaryAddValue(v5, @"tasks", v16);
  }
  if (*(void *)a1) {
    CFDictionaryAddValue(Mutable, @"core", *(const void **)a1);
  }
  if (v5) {
    CFDictionaryAddValue(Mutable, @"crashlog", v5);
  }
  CFRange v17 = *(const void **)(a1 + 88);
  if (v17) {
    CFDictionaryAddValue(Mutable, @"memory-sections", v17);
  }
  if (v5) {
    CFRelease(v5);
  }
  if (v7) {
    CFRelease(v7);
  }
  return Mutable;
}

uint64_t sub_100002798(uint64_t a1)
{
  mach_port_t v2 = *(const void **)(a1 + 8);
  if (v2) {
    CFRelease(v2);
  }
  if (*(void *)a1) {
    CFRelease(*(CFTypeRef *)a1);
  }
  return a1;
}

const void **sub_1000027DC(const void **a1)
{
  mach_port_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_100002810(const void **a1)
{
  mach_port_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

__CFString *sub_100002844(void *a1)
{
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  CFStringAppendFormat(Mutable, 0, @"%@\n%@\n!UUID: %@\nTime: %@\n\n", a1[5], a1[7], a1[8], a1[9]);
  CFStringAppend(Mutable, @"Faulting task stack frame:\n\n");
  CFStringAppendFormat(Mutable, 0, @"%@\n\n", a1[10]);
  CFStringAppendFormat(Mutable, 0, @"%@\n", a1[11]);
  CFStringAppend(Mutable, @"    ");
  CFArrayRef v3 = (const __CFArray *)a1[12];
  v7.length = CFArrayGetCount(v3);
  v7.location = 0;
  CFArrayApplyFunction(v3, v7, (CFArrayApplierFunction)sub_1000029CC, Mutable);
  CFStringAppend(Mutable, @"\n\n");
  CFStringAppend(Mutable, @"RTKit Task List:\n\n");
  CFArrayRef v4 = (const __CFArray *)a1[13];
  v8.length = CFArrayGetCount(v4);
  v8.location = 0;
  CFArrayApplyFunction(v4, v8, (CFArrayApplierFunction)sub_100002A00, Mutable);
  CFStringAppend(Mutable, @"Other memory sections:\n\n");
  CFArrayRef v5 = (const __CFArray *)a1[14];
  v9.length = CFArrayGetCount(v5);
  v9.location = 0;
  CFArrayApplyFunction(v5, v9, (CFArrayApplierFunction)sub_100002ADC, Mutable);
  return Mutable;
}

void sub_1000029CC(uint64_t a1, CFMutableStringRef theString)
{
}

void sub_100002A00(const __CFDictionary *a1, __CFString *a2)
{
  CFDataRef Value = CFDictionaryGetValue(a1, @"description");
  CFArrayRef v5 = (const __CFArray *)CFDictionaryGetValue(a1, @"stack");
  CFStringAppendFormat(a2, 0, @"%@\n", Value);
  if (v5)
  {
    CFStringAppend(a2, @"    ");
    v7.length = CFArrayGetCount(v5);
    v7.location = 0;
    CFArrayApplyFunction(v5, v7, (CFArrayApplierFunction)sub_1000029CC, a2);
    CFStringAppend(a2, @"\n");
  }

  CFStringAppend(a2, @"\n");
}

void sub_100002ADC(const __CFDictionary *a1, __CFString *a2)
{
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"id");
  CFNumberRef v5 = (const __CFNumber *)CFDictionaryGetValue(a1, @"address");
  CFNumberRef v6 = (const __CFNumber *)CFDictionaryGetValue(a1, @"size");
  CFRange v7 = CFDictionaryGetValue(a1, @"data");
  uint64_t valuePtr = 0;
  unsigned int v8 = 0;
  if (CFNumberGetValue(Value, kCFNumberIntType, (char *)&valuePtr + 4))
  {
    if (CFNumberGetValue(v5, kCFNumberIntType, &valuePtr))
    {
      if (CFNumberGetValue(v6, kCFNumberIntType, &v8))
      {
        CFStringAppendFormat(a2, 0, @"Section %d: %d bytes at 0x%x\n\n", HIDWORD(valuePtr), v8, valuePtr);
        if (v7) {
          CFStringAppendFormat(a2, 0, @"%@\n", v7);
        }
      }
    }
  }
  CFStringAppend(a2, @"\n");
}

uint64_t sub_100002BF8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 120);
  if (v2)
  {
    sub_100002C48(v2);
    operator delete();
  }
  sub_100002C48(a1 + 24);
  return a1;
}

uint64_t sub_100002C48(uint64_t a1)
{
  uint64_t v2 = *(const void **)a1;
  if (v2) {
    CFRelease(v2);
  }
  CFArrayRef v3 = *(const void **)(a1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  CFArrayRef v4 = *(const void **)(a1 + 16);
  if (v4) {
    CFRelease(v4);
  }
  CFNumberRef v5 = *(const void **)(a1 + 24);
  if (v5) {
    CFRelease(v5);
  }
  CFNumberRef v6 = *(const void **)(a1 + 32);
  if (v6) {
    CFRelease(v6);
  }
  CFRange v7 = *(const void **)(a1 + 40);
  if (v7) {
    CFRelease(v7);
  }
  unsigned int v8 = *(const void **)(a1 + 48);
  if (v8) {
    CFRelease(v8);
  }
  CFRange v9 = *(const void **)(a1 + 56);
  if (v9) {
    CFRelease(v9);
  }
  CFTypeID v10 = *(const void **)(a1 + 64);
  if (v10) {
    CFRelease(v10);
  }
  CFArrayRef v11 = *(const void **)(a1 + 72);
  if (v11) {
    CFRelease(v11);
  }
  CFStringRef v12 = *(const void **)(a1 + 80);
  if (v12) {
    CFRelease(v12);
  }
  v13 = *(const void **)(a1 + 88);
  if (v13) {
    CFRelease(v13);
  }
  return a1;
}

void *sub_100002D00(void *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFArrayGetTypeID())
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Could not construct");
    }
  }
  return a1;
}

void sub_100002D88(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

std::runtime_error *sub_100002DB8@<X0>(std::runtime_error *a1@<X8>)
{
  return std::runtime_error::runtime_error(a1, "Could not construct");
}

CFDictionaryRef sub_100002DC8(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 8);
  keys = 0;
  v35 = 0;
  v36 = 0;
  sub_1000030B4((void **)&keys, v2);
  values = 0;
  v32 = 0;
  v33 = 0;
  sub_1000030B4((void **)&values, v2);
  uint64_t v3 = *(void *)(a1 + 8);
  if (v3)
  {
    CFArrayRef v4 = *(void ***)a1;
    uint64_t v5 = *(void *)a1 + 16 * v3;
    do
    {
      CFNumberRef v6 = *v4;
      CFRange v7 = v35;
      if (v35 >= v36)
      {
        uint64_t v9 = v35 - keys;
        if ((unint64_t)(v9 + 1) >> 61) {
          sub_10000315C();
        }
        unint64_t v10 = ((char *)v36 - (char *)keys) >> 2;
        if (v10 <= v9 + 1) {
          unint64_t v10 = v9 + 1;
        }
        if ((unint64_t)((char *)v36 - (char *)keys) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v11 = v10;
        }
        if (v11) {
          CFStringRef v12 = (char *)sub_100003204((uint64_t)&v36, v11);
        }
        else {
          CFStringRef v12 = 0;
        }
        v13 = (void **)&v12[8 * v9];
        const void *v13 = v6;
        unsigned int v8 = v13 + 1;
        char v15 = keys;
        CFIndex v14 = v35;
        if (v35 != keys)
        {
          do
          {
            CFRange v16 = *--v14;
            *--v13 = v16;
          }
          while (v14 != v15);
          CFIndex v14 = keys;
        }
        keys = v13;
        v35 = v8;
        v36 = (void **)&v12[8 * v11];
        if (v14) {
          operator delete(v14);
        }
      }
      else
      {
        *v35 = v6;
        unsigned int v8 = v7 + 1;
      }
      v35 = v8;
      CFRange v17 = v4[1];
      CFRange v18 = v32;
      if (v32 >= v33)
      {
        uint64_t v20 = v32 - values;
        if ((unint64_t)(v20 + 1) >> 61) {
          sub_10000315C();
        }
        unint64_t v21 = ((char *)v33 - (char *)values) >> 2;
        if (v21 <= v20 + 1) {
          unint64_t v21 = v20 + 1;
        }
        if ((unint64_t)((char *)v33 - (char *)values) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v22 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v22 = v21;
        }
        if (v22) {
          v23 = (char *)sub_100003204((uint64_t)&v33, v22);
        }
        else {
          v23 = 0;
        }
        v24 = (void **)&v23[8 * v20];
        *v24 = v17;
        v19 = v24 + 1;
        v26 = values;
        v25 = v32;
        if (v32 != values)
        {
          do
          {
            v27 = *--v25;
            *--v24 = v27;
          }
          while (v25 != v26);
          v25 = values;
        }
        values = v24;
        v32 = v19;
        v33 = (void **)&v23[8 * v22];
        if (v25) {
          operator delete(v25);
        }
      }
      else
      {
        *v32 = v17;
        v19 = v18 + 1;
      }
      v32 = v19;
      v4 += 2;
    }
    while (v4 != (void **)v5);
  }
  CFDictionaryRef v28 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, v2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v28)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }
  if (values)
  {
    v32 = values;
    operator delete(values);
  }
  if (keys)
  {
    v35 = keys;
    operator delete(keys);
  }
  return v28;
}

void sub_10000305C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  __cxa_free_exception(v13);
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(a1);
}

void sub_1000030B4(void **a1, unint64_t a2)
{
  CFArrayRef v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      sub_10000315C();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    CFNumberRef v6 = (char *)sub_100003204(v3, a2);
    CFRange v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    uint64_t v9 = &v6[8 * v8];
    unint64_t v11 = (char *)*a1;
    unint64_t v10 = (char *)a1[1];
    CFStringRef v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      unint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void sub_10000315C()
{
}

void sub_100003174(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1000031D0(exception, a1);
}

void sub_1000031BC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1000031D0(std::logic_error *a1, const char *a2)
{
  CFArrayRef result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_100003204(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_10000323C();
  }
  return operator new(8 * a2);
}

void sub_10000323C()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

const void **sub_100003270(const void **a1)
{
  unint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_1000032A4(CFDictionaryRef theDict@<X0>, size_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v9 = 1;
  *(unsigned char *)(a5 + 23) = 1;
  *(_WORD *)a5 = 123;
  size_t v10 = a2 + 2;
  sub_10000488C((uint64_t)&v78, theDict);
  sub_10000488C((uint64_t)&v72, theDict);
  uint64_t v73 = (v75 - (unsigned char *)v74) >> 3;
  while (1)
  {
    if (v78 && v79 != (v81 - v80) >> 3)
    {
      uint64_t v11 = v72;
      goto LABEL_8;
    }
    uint64_t v11 = v72;
    if (!v72 || v73 == (v75 - (unsigned char *)v74) >> 3) {
      break;
    }
LABEL_8:
    if (v78 == v11 && v79 == v73) {
      break;
    }
    if (v9)
    {
      if (a3) {
        goto LABEL_25;
      }
    }
    else
    {
      std::string::append((std::string *)a5, ",");
      if (a3)
      {
        std::string::append((std::string *)a5, " ");
        goto LABEL_25;
      }
    }
    sub_100004A54(&__b, v10, 32);
    CFStringRef v12 = std::string::insert(&__b, 0, "\n");
    long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
    int64_t v66 = v12->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v13;
    v12->__r_.__value_.__l.__size_ = 0;
    v12->__r_.__value_.__r.__words[2] = 0;
    v12->__r_.__value_.__r.__words[0] = 0;
    if (v66 >= 0) {
      CFIndex v14 = __p;
    }
    else {
      CFIndex v14 = (void **)__p[0];
    }
    if (v66 >= 0) {
      std::string::size_type v15 = HIBYTE(v66);
    }
    else {
      std::string::size_type v15 = (std::string::size_type)__p[1];
    }
    std::string::append((std::string *)a5, (const std::string::value_type *)v14, v15);
    if (SHIBYTE(v66) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(__b.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__b.__r_.__value_.__l.__data_);
    }
LABEL_25:
    sub_100003D50(&v78, __p);
    BOOL v17 = 0;
    if (__p[0])
    {
      CFTypeID v16 = CFGetTypeID(__p[0]);
      if (v16 == CFStringGetTypeID()) {
        BOOL v17 = 1;
      }
    }
    if (__p[1]) {
      CFRelease(__p[1]);
    }
    if (__p[0]) {
      CFRelease(__p[0]);
    }
    if (v17)
    {
      sub_100003D50(&v78, &cf);
      if (!cf.__r_.__value_.__r.__words[0])
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Could not construct");
      }
      sub_100004C58((const __CFString *)cf.__r_.__value_.__l.__data_, (uint64_t)&v69);
      if ((v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        CFRange v18 = &v69;
      }
      else {
        CFRange v18 = (std::string *)v69.__r_.__value_.__r.__words[0];
      }
      if ((v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(v69.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = v69.__r_.__value_.__l.__size_;
      }
      memset(&v70, 0, sizeof(v70));
      for (; size; --size)
      {
        int v20 = v18->__r_.__value_.__s.__data_[0];
        if (v20 == 92 || v20 == 34)
        {
          std::string::push_back(&v70, 92);
          LOBYTE(v20) = v18->__r_.__value_.__s.__data_[0];
        }
        std::string::push_back(&v70, v20);
        CFRange v18 = (std::string *)((char *)v18 + 1);
      }
      unint64_t v21 = std::string::insert(&v70, 0, "\"");
      long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
      __b.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__b.__r_.__value_.__l.__data_ = v22;
      v21->__r_.__value_.__l.__size_ = 0;
      v21->__r_.__value_.__r.__words[2] = 0;
      v21->__r_.__value_.__r.__words[0] = 0;
      v23 = std::string::append(&__b, "\" : ");
      long long v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
      int64_t v66 = v23->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v24;
      v23->__r_.__value_.__l.__size_ = 0;
      v23->__r_.__value_.__r.__words[2] = 0;
      v23->__r_.__value_.__r.__words[0] = 0;
      if (v66 >= 0) {
        v25 = __p;
      }
      else {
        v25 = (void **)__p[0];
      }
      if (v66 >= 0) {
        std::string::size_type v26 = HIBYTE(v66);
      }
      else {
        std::string::size_type v26 = (std::string::size_type)__p[1];
      }
      std::string::append((std::string *)a5, (const std::string::value_type *)v25, v26);
      if (SHIBYTE(v66) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(__b.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__b.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v70.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v69.__r_.__value_.__l.__data_);
      }
      if (cf.__r_.__value_.__l.__size_) {
        CFRelease((CFTypeRef)cf.__r_.__value_.__l.__size_);
      }
      if (cf.__r_.__value_.__r.__words[0]) {
        CFRelease(cf.__r_.__value_.__l.__data_);
      }
      sub_100003D50(&v78, &__b);
      sub_100005D5C((uint64_t)v84, a4);
      sub_100003E84((const __CFString **)&__b.__r_.__value_.__l.__size_, v10, a3, (uint64_t)v84, (uint64_t)__p);
      if (v66 >= 0) {
        v27 = __p;
      }
      else {
        v27 = (void **)__p[0];
      }
      if (v66 >= 0) {
        std::string::size_type v28 = HIBYTE(v66);
      }
      else {
        std::string::size_type v28 = (std::string::size_type)__p[1];
      }
      std::string::append((std::string *)a5, (const std::string::value_type *)v27, v28);
      if (SHIBYTE(v66) < 0) {
        operator delete(__p[0]);
      }
      sub_100005E7C(v84);
      if (__b.__r_.__value_.__l.__size_) {
        CFRelease((CFTypeRef)__b.__r_.__value_.__l.__size_);
      }
      if (__b.__r_.__value_.__r.__words[0]) {
        CFRelease(__b.__r_.__value_.__l.__data_);
      }
    }
    else
    {
      if (!*(void *)(a4 + 24))
      {
        v57 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v57, "Error, not a json style CFDictionary");
      }
      sub_100003D50(&v78, &__b);
      v29 = (const void *)__b.__r_.__value_.__r.__words[0];
      if (__b.__r_.__value_.__r.__words[0]) {
        CFRetain(__b.__r_.__value_.__l.__data_);
      }
      CFTypeRef v63 = 0;
      CFTypeRef v64 = v29;
      uint64_t v30 = *(void *)(a4 + 24);
      if (!v30) {
        sub_100005DF4();
      }
      (*(void (**)(void **__return_ptr))(*(void *)v30 + 48))(__p);
      if (v63) {
        CFRelease(v63);
      }
      if (v64) {
        CFRelease(v64);
      }
      if (__b.__r_.__value_.__l.__size_) {
        CFRelease((CFTypeRef)__b.__r_.__value_.__l.__size_);
      }
      if (__b.__r_.__value_.__r.__words[0]) {
        CFRelease(__b.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v66) < 0)
      {
        v31 = (char *)__p[1];
        if (!__p[1])
        {
LABEL_162:
          v58 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v58, "Error, not a json style CFDictionary");
        }
        v32 = (void **)__p[0];
      }
      else
      {
        v31 = (char *)HIBYTE(v66);
        if (!HIBYTE(v66)) {
          goto LABEL_162;
        }
        v32 = __p;
      }
      memset(&v61, 0, sizeof(v61));
      do
      {
        int v33 = *(unsigned __int8 *)v32;
        if (v33 == 92 || v33 == 34)
        {
          std::string::push_back(&v61, 92);
          LOBYTE(v33) = *(unsigned char *)v32;
        }
        std::string::push_back(&v61, v33);
        v32 = (void **)((char *)v32 + 1);
        --v31;
      }
      while (v31);
      v34 = std::string::insert(&v61, 0, "\"");
      long long v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
      cf.__r_.__value_.__r.__words[2] = v34->__r_.__value_.__r.__words[2];
      *(_OWORD *)&cf.__r_.__value_.__l.__data_ = v35;
      v34->__r_.__value_.__l.__size_ = 0;
      v34->__r_.__value_.__r.__words[2] = 0;
      v34->__r_.__value_.__r.__words[0] = 0;
      v36 = std::string::append(&cf, "\" : \"");
      long long v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
      v69.__r_.__value_.__r.__words[2] = v36->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v69.__r_.__value_.__l.__data_ = v37;
      v36->__r_.__value_.__l.__size_ = 0;
      v36->__r_.__value_.__r.__words[2] = 0;
      v36->__r_.__value_.__r.__words[0] = 0;
      if ((v68 & 0x80u) == 0) {
        v38 = v67;
      }
      else {
        v38 = (void **)v67[0];
      }
      if ((v68 & 0x80u) == 0) {
        unint64_t v39 = v68;
      }
      else {
        unint64_t v39 = (unint64_t)v67[1];
      }
      memset(&v60, 0, sizeof(v60));
      if (v39)
      {
        do
        {
          int v40 = *(unsigned __int8 *)v38;
          if (v40 == 92 || v40 == 34)
          {
            std::string::push_back(&v60, 92);
            LOBYTE(v40) = *(unsigned char *)v38;
          }
          std::string::push_back(&v60, v40);
          v38 = (void **)((char *)v38 + 1);
          --v39;
        }
        while (v39);
        std::string::size_type v41 = HIBYTE(v60.__r_.__value_.__r.__words[2]);
        std::string::size_type v42 = v60.__r_.__value_.__l.__size_;
        std::string::size_type v43 = v60.__r_.__value_.__r.__words[0];
      }
      else
      {
        std::string::size_type v42 = 0;
        std::string::size_type v43 = 0;
        std::string::size_type v41 = 0;
      }
      if ((v41 & 0x80u) == 0) {
        v44 = &v60;
      }
      else {
        v44 = (std::string *)v43;
      }
      if ((v41 & 0x80u) == 0) {
        std::string::size_type v45 = v41;
      }
      else {
        std::string::size_type v45 = v42;
      }
      v46 = std::string::append(&v69, (const std::string::value_type *)v44, v45);
      long long v47 = *(_OWORD *)&v46->__r_.__value_.__l.__data_;
      v70.__r_.__value_.__r.__words[2] = v46->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v70.__r_.__value_.__l.__data_ = v47;
      v46->__r_.__value_.__l.__size_ = 0;
      v46->__r_.__value_.__r.__words[2] = 0;
      v46->__r_.__value_.__r.__words[0] = 0;
      v48 = std::string::append(&v70, "\"");
      long long v49 = *(_OWORD *)&v48->__r_.__value_.__l.__data_;
      __b.__r_.__value_.__r.__words[2] = v48->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__b.__r_.__value_.__l.__data_ = v49;
      v48->__r_.__value_.__l.__size_ = 0;
      v48->__r_.__value_.__r.__words[2] = 0;
      v48->__r_.__value_.__r.__words[0] = 0;
      if ((__b.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_b = &__b;
      }
      else {
        p_b = (std::string *)__b.__r_.__value_.__r.__words[0];
      }
      if ((__b.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v51 = HIBYTE(__b.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v51 = __b.__r_.__value_.__l.__size_;
      }
      std::string::append((std::string *)a5, (const std::string::value_type *)p_b, v51);
      if (SHIBYTE(__b.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__b.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v70.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v60.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v69.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(cf.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(cf.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v61.__r_.__value_.__l.__data_);
      }
      if ((char)v68 < 0) {
        operator delete(v67[0]);
      }
      if (SHIBYTE(v66) < 0) {
        operator delete(__p[0]);
      }
    }
    char v9 = 0;
    ++v79;
  }
  if ((a3 & 1) == 0)
  {
    sub_100004A54(&__b, a2, 32);
    v52 = std::string::insert(&__b, 0, "\n");
    long long v53 = *(_OWORD *)&v52->__r_.__value_.__l.__data_;
    int64_t v66 = v52->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v53;
    v52->__r_.__value_.__l.__size_ = 0;
    v52->__r_.__value_.__r.__words[2] = 0;
    v52->__r_.__value_.__r.__words[0] = 0;
    if (v66 >= 0) {
      v54 = __p;
    }
    else {
      v54 = (void **)__p[0];
    }
    if (v66 >= 0) {
      std::string::size_type v55 = HIBYTE(v66);
    }
    else {
      std::string::size_type v55 = (std::string::size_type)__p[1];
    }
    std::string::append((std::string *)a5, (const std::string::value_type *)v54, v55);
    if (SHIBYTE(v66) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(__b.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__b.__r_.__value_.__l.__data_);
    }
  }
  std::string::append((std::string *)a5, "}");
  if (v76)
  {
    v77 = v76;
    operator delete(v76);
  }
  if (v74)
  {
    v75 = v74;
    operator delete(v74);
  }
  if (v82)
  {
    v83 = v82;
    operator delete(v82);
  }
  if (v80)
  {
    v81 = v80;
    operator delete(v80);
  }
}

void sub_100003B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40,uint64_t a41,int a42,__int16 a43,char a44,char a45,uint64_t a46,uint64_t a47)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  if (a45 < 0) {
    operator delete(a40);
  }
  sub_100004830(&a47);
  sub_100004830((void *)(v48 - 192));
  if (*(char *)(v47 + 23) < 0) {
    operator delete(*(void **)v47);
  }
  _Unwind_Resume(a1);
}

void sub_100003D50(void *a1@<X0>, void *a2@<X8>)
{
  sub_100004B00(a1, &v3);
  sub_100004BF8(a2, (uint64_t)&v3);
  if (cf) {
    CFRelease(cf);
  }
  if (v3) {
    CFRelease(v3);
  }
}

uint64_t sub_100003DAC(uint64_t a1)
{
  unint64_t v2 = *(const void **)(a1 + 8);
  if (v2) {
    CFRelease(v2);
  }
  if (*(void *)a1) {
    CFRelease(*(CFTypeRef *)a1);
  }
  return a1;
}

void sub_100003DF0(unsigned char *a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  if (a2)
  {
    uint64_t v3 = a2;
    do
    {
      int v6 = *a1;
      if (v6 == 92 || v6 == 34)
      {
        std::string::push_back(a3, 92);
        LOBYTE(v6) = *a1;
      }
      std::string::push_back(a3, v6);
      ++a1;
      --v3;
    }
    while (v3);
  }
}

void sub_100003E68(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_100003E84(const __CFString **a1@<X0>, size_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  CFStringRef v8 = *a1;
  if (!v8) {
    goto LABEL_33;
  }
  CFTypeID v11 = CFGetTypeID(v8);
  CFTypeID TypeID = CFBooleanGetTypeID();
  CFNumberRef v13 = (const __CFNumber *)*a1;
  if (v11 == TypeID)
  {
    if (v13)
    {
      if (!sub_100005230(v13))
      {
        *(unsigned char *)(a5 + 23) = 5;
        strcpy((char *)a5, "false");
        return;
      }
      *(unsigned char *)(a5 + 23) = 4;
      int v14 = 1702195828;
      goto LABEL_41;
    }
    goto LABEL_108;
  }
  if (!v13) {
    goto LABEL_33;
  }
  CFTypeID v15 = CFGetTypeID(v13);
  CFTypeID v16 = CFNumberGetTypeID();
  CFStringRef v17 = *a1;
  if (v15 != v16)
  {
    if (v17)
    {
      CFTypeID v20 = CFGetTypeID(v17);
      if (v20 == CFStringGetTypeID())
      {
        *((unsigned char *)&v75.__r_.__value_.__s + 23) = 1;
        LOWORD(v75.__r_.__value_.__l.__data_) = 34;
        if (!*a1)
        {
          exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(exception, "Could not construct");
        }
        unint64_t v21 = &v73;
        sub_100004C58(*a1, (uint64_t)&v73);
        if ((v73.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        {
          std::string::size_type size = HIBYTE(v73.__r_.__value_.__r.__words[2]);
        }
        else
        {
          std::string::size_type size = v73.__r_.__value_.__l.__size_;
          unint64_t v21 = (std::string *)v73.__r_.__value_.__r.__words[0];
        }
        memset(&v74, 0, sizeof(v74));
        if (size)
        {
          do
          {
            int v23 = v21->__r_.__value_.__s.__data_[0];
            if (v23 == 92 || v23 == 34)
            {
              std::string::push_back(&v74, 92);
              LOBYTE(v23) = v21->__r_.__value_.__s.__data_[0];
            }
            std::string::push_back(&v74, v23);
            unint64_t v21 = (std::string *)((char *)v21 + 1);
            --size;
          }
          while (size);
          unsigned int v24 = HIBYTE(v74.__r_.__value_.__r.__words[2]);
          std::string::size_type v25 = v74.__r_.__value_.__l.__size_;
          std::string::size_type v26 = v74.__r_.__value_.__r.__words[0];
        }
        else
        {
          std::string::size_type v25 = 0;
          std::string::size_type v26 = 0;
          unsigned int v24 = 0;
        }
        if ((v24 & 0x80u) == 0) {
          std::string::size_type v55 = &v74;
        }
        else {
          std::string::size_type v55 = (std::string *)v26;
        }
        if ((v24 & 0x80u) == 0) {
          std::string::size_type v56 = v24;
        }
        else {
          std::string::size_type v56 = v25;
        }
        v57 = std::string::append(&v75, (const std::string::value_type *)v55, v56);
        long long v58 = *(_OWORD *)&v57->__r_.__value_.__l.__data_;
        v69.__r_.__value_.__r.__words[2] = v57->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v69.__r_.__value_.__l.__data_ = v58;
        v57->__r_.__value_.__l.__size_ = 0;
        v57->__r_.__value_.__r.__words[2] = 0;
        v57->__r_.__value_.__r.__words[0] = 0;
        v59 = std::string::append(&v69, "\"");
        long long v60 = *(_OWORD *)&v59->__r_.__value_.__l.__data_;
        *(void *)(a5 + 16) = *((void *)&v59->__r_.__value_.__l + 2);
        *(_OWORD *)a5 = v60;
        v59->__r_.__value_.__l.__size_ = 0;
        v59->__r_.__value_.__r.__words[2] = 0;
        v59->__r_.__value_.__r.__words[0] = 0;
        if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v69.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v74.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v74.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v73.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v75.__r_.__value_.__l.__data_);
        }
        return;
      }
      if (*a1)
      {
        CFTypeID v27 = CFGetTypeID(*a1);
        CFTypeID v28 = CFArrayGetTypeID();
        CFStringRef v29 = *a1;
        if (v27 == v28)
        {
          sub_100005D5C((uint64_t)v77, a4);
          sub_100004ED4((const __CFArray *)v29, a2, a3, (uint64_t)v77, a5);
          uint64_t v30 = v77;
LABEL_105:
          sub_100005E7C(v30);
          return;
        }
        if (v29)
        {
          CFTypeID v61 = CFGetTypeID(*a1);
          CFTypeID v62 = CFDictionaryGetTypeID();
          CFStringRef v29 = *a1;
          if (v61 == v62)
          {
            sub_100005D5C((uint64_t)v76, a4);
            sub_1000032A4((CFDictionaryRef)v29);
            uint64_t v30 = v76;
            goto LABEL_105;
          }
        }
LABEL_34:
        CFTypeID v31 = CFGetTypeID(v29);
        if (v31 == CFNullGetTypeID() || !*a1)
        {
          *(unsigned char *)(a5 + 23) = 4;
          int v14 = 1819047278;
LABEL_41:
          *(_DWORD *)a5 = v14;
          *(unsigned char *)(a5 + 4) = 0;
          return;
        }
        if (!*(void *)(a4 + 24))
        {
          CFTypeRef v63 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v63, "Error, not a json style CFDictionary");
          goto LABEL_109;
        }
        unsigned __int8 v68 = 0;
        sub_1000047B0(&v67, (CFTypeRef *)a1);
        sub_100004760(a4);
        sub_100003270(&v67);
        sub_100003270(&v68);
        if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::size_type v32 = v69.__r_.__value_.__l.__size_;
          if (v69.__r_.__value_.__l.__size_)
          {
            int v33 = (std::string *)v69.__r_.__value_.__r.__words[0];
            goto LABEL_44;
          }
        }
        else
        {
          std::string::size_type v32 = HIBYTE(v69.__r_.__value_.__r.__words[2]);
          if (*((unsigned char *)&v69.__r_.__value_.__s + 23))
          {
            int v33 = &v69;
LABEL_44:
            sub_100003DF0(v33, v32, &v66);
            v34 = std::string::insert(&v66, 0, "{ \"");
            long long v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
            v73.__r_.__value_.__r.__words[2] = v34->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v73.__r_.__value_.__l.__data_ = v35;
            v34->__r_.__value_.__l.__size_ = 0;
            v34->__r_.__value_.__r.__words[2] = 0;
            v34->__r_.__value_.__r.__words[0] = 0;
            v36 = std::string::append(&v73, "\" : \"");
            long long v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
            v74.__r_.__value_.__r.__words[2] = v36->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v74.__r_.__value_.__l.__data_ = v37;
            v36->__r_.__value_.__l.__size_ = 0;
            v36->__r_.__value_.__r.__words[2] = 0;
            v36->__r_.__value_.__r.__words[0] = 0;
            if ((v72 & 0x80u) == 0) {
              v38 = &v70;
            }
            else {
              v38 = v70;
            }
            if ((v72 & 0x80u) == 0) {
              uint64_t v39 = v72;
            }
            else {
              uint64_t v39 = v71;
            }
            sub_100003DF0(v38, v39, &__p);
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              p_p = &__p;
            }
            else {
              p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
            }
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type v41 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
            }
            else {
              std::string::size_type v41 = __p.__r_.__value_.__l.__size_;
            }
            std::string::size_type v42 = std::string::append(&v74, (const std::string::value_type *)p_p, v41);
            long long v43 = *(_OWORD *)&v42->__r_.__value_.__l.__data_;
            v75.__r_.__value_.__r.__words[2] = v42->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v75.__r_.__value_.__l.__data_ = v43;
            v42->__r_.__value_.__l.__size_ = 0;
            v42->__r_.__value_.__r.__words[2] = 0;
            v42->__r_.__value_.__r.__words[0] = 0;
            v44 = std::string::append(&v75, "\" }");
            long long v45 = *(_OWORD *)&v44->__r_.__value_.__l.__data_;
            *(void *)(a5 + 16) = *((void *)&v44->__r_.__value_.__l + 2);
            *(_OWORD *)a5 = v45;
            v44->__r_.__value_.__l.__size_ = 0;
            v44->__r_.__value_.__r.__words[2] = 0;
            v44->__r_.__value_.__r.__words[0] = 0;
            if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v75.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v74.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v74.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v73.__r_.__value_.__l.__data_);
            }
            if ((SHIBYTE(v66.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
              goto LABEL_85;
            }
            v46 = (void *)v66.__r_.__value_.__r.__words[0];
LABEL_84:
            operator delete(v46);
LABEL_85:
            sub_1000047EC((uint64_t)&v69);
            return;
          }
        }
        *((unsigned char *)&v74.__r_.__value_.__s + 23) = 1;
        LOWORD(v74.__r_.__value_.__l.__data_) = 34;
        if ((v72 & 0x80u) == 0) {
          uint64_t v47 = &v70;
        }
        else {
          uint64_t v47 = v70;
        }
        if ((v72 & 0x80u) == 0) {
          uint64_t v48 = v72;
        }
        else {
          uint64_t v48 = v71;
        }
        sub_100003DF0(v47, v48, &v73);
        if ((v73.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          long long v49 = &v73;
        }
        else {
          long long v49 = (std::string *)v73.__r_.__value_.__r.__words[0];
        }
        if ((v73.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v50 = HIBYTE(v73.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v50 = v73.__r_.__value_.__l.__size_;
        }
        std::string::size_type v51 = std::string::append(&v74, (const std::string::value_type *)v49, v50);
        long long v52 = *(_OWORD *)&v51->__r_.__value_.__l.__data_;
        v75.__r_.__value_.__r.__words[2] = v51->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v75.__r_.__value_.__l.__data_ = v52;
        v51->__r_.__value_.__l.__size_ = 0;
        v51->__r_.__value_.__r.__words[2] = 0;
        v51->__r_.__value_.__r.__words[0] = 0;
        long long v53 = std::string::append(&v75, "\"");
        long long v54 = *(_OWORD *)&v53->__r_.__value_.__l.__data_;
        *(void *)(a5 + 16) = *((void *)&v53->__r_.__value_.__l + 2);
        *(_OWORD *)a5 = v54;
        v53->__r_.__value_.__l.__size_ = 0;
        v53->__r_.__value_.__r.__words[2] = 0;
        v53->__r_.__value_.__r.__words[0] = 0;
        if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v75.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v73.__r_.__value_.__l.__data_);
        }
        if ((SHIBYTE(v74.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_85;
        }
        v46 = (void *)v74.__r_.__value_.__r.__words[0];
        goto LABEL_84;
      }
    }
LABEL_33:
    CFStringRef v29 = 0;
    goto LABEL_34;
  }
  if (!v17) {
    goto LABEL_108;
  }
  float v18 = sub_100005540((const __CFNumber *)v17);
  if (vabds_f32(floorf(v18), v18) < 0.00000011921)
  {
    if (*a1)
    {
      CFBooleanRef v19 = sub_1000058CC((const __CFNumber *)*a1);
      std::to_string((std::string *)a5, (uint64_t)v19);
      return;
    }
LABEL_108:
    CFTypeRef v63 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_100002DB8(v63);
LABEL_109:
  }

  std::to_string((std::string *)a5, v18);
}

void sub_100004598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21,int a22,__int16 a23,char a24,char a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,uint64_t a41,void *a42,uint64_t a43,int a44,__int16 a45,char a46,char a47)
{
  sub_100005E7C((void *)(v47 - 136));
  _Unwind_Resume(a1);
}

uint64_t sub_100004760(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  if (!v1) {
    sub_100005DF4();
  }
  unint64_t v2 = *(uint64_t (**)(void))(*(void *)v1 + 48);

  return v2();
}

void *sub_1000047B0(void *a1, CFTypeRef *a2)
{
  CFTypeRef v3 = *a2;
  if (*a2) {
    CFRetain(*a2);
  }
  *a1 = v3;
  return a1;
}

uint64_t sub_1000047EC(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void *sub_100004830(void *a1)
{
  unint64_t v2 = (void *)a1[5];
  if (v2)
  {
    a1[6] = v2;
    operator delete(v2);
  }
  CFTypeRef v3 = (void *)a1[2];
  if (v3)
  {
    a1[3] = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_100004874()
{
}

uint64_t sub_10000488C(uint64_t a1, CFDictionaryRef theDict)
{
  *(void *)a1 = theDict;
  *(_OWORD *)(a1 + 40) = 0u;
  uint64_t v3 = a1 + 40;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(void *)(a1 + 56) = 0;
  if (theDict)
  {
    CFIndex Count = CFDictionaryGetCount(theDict);
    sub_100004910(a1 + 16, Count);
    sub_100004910(v3, Count);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)a1, *(const void ***)(a1 + 16), *(const void ***)(a1 + 40));
  }
  return a1;
}

void sub_100004910(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }
  else
  {
    sub_100004940((void **)a1, a2 - v2);
  }
}

void sub_100004940(void **a1, unint64_t a2)
{
  int v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  int64_t v5 = v6;
  CFRange v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = v7 - (unsigned char *)*a1;
    unint64_t v9 = a2 + (v8 >> 3);
    if (v9 >> 61) {
      sub_10000315C();
    }
    uint64_t v10 = v8 >> 3;
    uint64_t v11 = v5 - (unsigned char *)*a1;
    if (v11 >> 2 > v9) {
      unint64_t v9 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      CFNumberRef v13 = (char *)sub_100003204(v4, v12);
    }
    else {
      CFNumberRef v13 = 0;
    }
    int v14 = &v13[8 * v10];
    CFTypeID v15 = &v13[8 * v12];
    bzero(v14, 8 * a2);
    CFTypeID v16 = &v14[8 * a2];
    float v18 = (char *)*a1;
    CFStringRef v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        uint64_t v19 = *((void *)v17 - 1);
        v17 -= 8;
        *((void *)v14 - 1) = v19;
        v14 -= 8;
      }
      while (v17 != v18);
      CFStringRef v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
    {
      operator delete(v17);
    }
  }
}

void *sub_100004A54(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_100004874();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    int v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *std::string __b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    int v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

void *sub_100004B00@<X0>(void *result@<X0>, void *a2@<X8>)
{
  unint64_t v3 = result[1];
  if ((v3 & 0x8000000000000000) != 0 || (uint64_t v4 = result, v5 = result[2], v3 >= (result[3] - v5) >> 3))
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    sub_100004BC4(exception, "DictionaryRef_iterator iterator out of range.");
  }
  uint64_t v6 = *(void *)(v5 + 8 * v3);
  if (v6)
  {
    CFArrayRef result = CFRetain(*(CFTypeRef *)(v5 + 8 * v3));
    unint64_t v3 = v4[1];
  }
  uint64_t v7 = v4[5];
  uint64_t v8 = *(void *)(v7 + 8 * v3);
  if (v8) {
    CFArrayRef result = CFRetain(*(CFTypeRef *)(v7 + 8 * v3));
  }
  *a2 = v6;
  a2[1] = v8;
  return result;
}

void sub_100004BB0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100004BC4(std::logic_error *a1, const char *a2)
{
  CFArrayRef result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_100004BF8(void *a1, uint64_t a2)
{
  CFTypeRef v4 = *(CFTypeRef *)a2;
  if (*(void *)a2) {
    CFRetain(*(CFTypeRef *)a2);
  }
  *a1 = v4;
  uint64_t v5 = *(const void **)(a2 + 8);
  if (v5) {
    CFRetain(v5);
  }
  a1[1] = v5;
  return a1;
}

void *sub_100004C58@<X0>(const __CFString *a1@<X0>, uint64_t a2@<X8>)
{
  if (!a1 || (CFTypeID TypeID = CFStringGetTypeID(), TypeID != CFGetTypeID(a1)))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_100004D00(exception);
  }

  return sub_100004D10(a1, a2);
}

void sub_100004CEC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::runtime_error *sub_100004D00@<X0>(std::runtime_error *a1@<X8>)
{
  return std::runtime_error::runtime_error(a1, "Could not convert");
}

void *sub_100004D10@<X0>(const __CFString *a1@<X0>, uint64_t a2@<X8>)
{
  CStringPtr = (char *)CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr)
  {
    return sub_100004E20((void *)a2, CStringPtr);
  }
  else
  {
    CFIndex Length = CFStringGetLength(a1);
    CFIndex maxBufLen = 0;
    v10.location = 0;
    v10.length = Length;
    CFStringGetBytes(a1, v10, 0x8000100u, 0, 0, 0, 0, &maxBufLen);
    sub_100004A54((void *)a2, maxBufLen, 0);
    if (*(char *)(a2 + 23) >= 0) {
      uint64_t v7 = (UInt8 *)a2;
    }
    else {
      uint64_t v7 = *(UInt8 **)a2;
    }
    v11.location = 0;
    v11.length = Length;
    return (void *)CFStringGetBytes(a1, v11, 0x8000100u, 0, 0, v7, maxBufLen, &maxBufLen);
  }
}

void sub_100004E04(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100004E20(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100004874();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

std::string *sub_100004ED4@<X0>(const __CFArray *a1@<X0>, size_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(unsigned char *)(a5 + 23) = 1;
  *(_WORD *)a5 = 91;
  if (a1)
  {
    CFIndex Count = CFArrayGetCount(a1);
    CFIndex v10 = CFArrayGetCount(a1);
    if (Count)
    {
      if (v10)
      {
        unint64_t v11 = 0;
        size_t v12 = a2 + 2;
        CFIndex v13 = v10 - 1;
        char v14 = 1;
        while (1)
        {
          if (v14)
          {
            if ((a3 & 1) == 0) {
              goto LABEL_10;
            }
          }
          else
          {
            std::string::append((std::string *)a5, ",");
            if (!a3)
            {
LABEL_10:
              sub_100004A54(&__b, v12, 32);
              CFTypeID v15 = std::string::insert(&__b, 0, "\n");
              long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
              int64_t v30 = v15->__r_.__value_.__r.__words[2];
              *(_OWORD *)std::string __p = v16;
              v15->__r_.__value_.__l.__size_ = 0;
              v15->__r_.__value_.__r.__words[2] = 0;
              v15->__r_.__value_.__r.__words[0] = 0;
              if (v30 >= 0) {
                CFStringRef v17 = __p;
              }
              else {
                CFStringRef v17 = (void **)__p[0];
              }
              if (v30 >= 0) {
                std::string::size_type v18 = HIBYTE(v30);
              }
              else {
                std::string::size_type v18 = (std::string::size_type)__p[1];
              }
              std::string::append((std::string *)a5, (const std::string::value_type *)v17, v18);
              if (SHIBYTE(v30) < 0) {
                operator delete(__p[0]);
              }
              if (SHIBYTE(__b.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__b.__r_.__value_.__l.__data_);
              }
              goto LABEL_20;
            }
            std::string::append((std::string *)a5, " ");
          }
LABEL_20:
          sub_100005C98(a1, v11, &__b);
          sub_100005D5C((uint64_t)v31, a4);
          sub_100003E84(__p, &__b, v12, a3, v31);
          if (v30 >= 0) {
            uint64_t v19 = __p;
          }
          else {
            uint64_t v19 = (void **)__p[0];
          }
          if (v30 >= 0) {
            std::string::size_type v20 = HIBYTE(v30);
          }
          else {
            std::string::size_type v20 = (std::string::size_type)__p[1];
          }
          std::string::append((std::string *)a5, (const std::string::value_type *)v19, v20);
          if (SHIBYTE(v30) < 0) {
            operator delete(__p[0]);
          }
          sub_100005E7C(v31);
          if (__b.__r_.__value_.__r.__words[0]) {
            CFRelease(__b.__r_.__value_.__l.__data_);
          }
          if (Count - 1 != v11)
          {
            char v14 = 0;
            if (v13 != v11++) {
              continue;
            }
          }
          break;
        }
      }
    }
  }
  if ((a3 & 1) == 0)
  {
    sub_100004A54(&__b, a2, 32);
    long long v22 = std::string::insert(&__b, 0, "\n");
    long long v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
    int64_t v30 = v22->__r_.__value_.__r.__words[2];
    *(_OWORD *)std::string __p = v23;
    v22->__r_.__value_.__l.__size_ = 0;
    v22->__r_.__value_.__r.__words[2] = 0;
    v22->__r_.__value_.__r.__words[0] = 0;
    if (v30 >= 0) {
      unsigned int v24 = __p;
    }
    else {
      unsigned int v24 = (void **)__p[0];
    }
    if (v30 >= 0) {
      std::string::size_type v25 = HIBYTE(v30);
    }
    else {
      std::string::size_type v25 = (std::string::size_type)__p[1];
    }
    std::string::append((std::string *)a5, (const std::string::value_type *)v24, v25);
    if (SHIBYTE(v30) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(__b.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__b.__r_.__value_.__l.__data_);
    }
  }
  return std::string::append((std::string *)a5, "]");
}

void sub_10000517C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  if (*(char *)(v22 + 23) < 0) {
    operator delete(*(void **)v22);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_100005230(const __CFNumber *a1)
{
  if (!a1) {
    goto LABEL_8;
  }
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (TypeID != CFGetTypeID(a1))
  {
    CFTypeID v4 = CFNumberGetTypeID();
    if (v4 == CFGetTypeID(a1))
    {
      LOWORD(Value) = sub_1000052F8(a1);
      if ((unsigned __int16)Value > 0xFFu)
      {
        int Value = Value;
        return Value != 0;
      }
    }
LABEL_8:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_100004D00(exception);
  }
  int Value = CFBooleanGetValue(a1);
  return Value != 0;
}

void sub_1000052E4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000052F8(const __CFNumber *a1)
{
  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      CFNumberRef v5 = a1;
      CFNumberType v6 = kCFNumberSInt16Type;
      goto LABEL_12;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v7 = a1;
      CFNumberType v8 = kCFNumberSInt32Type;
      goto LABEL_14;
    case kCFNumberSInt64Type:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberSInt64Type;
      goto LABEL_25;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberFloat32Type;
      goto LABEL_21;
    case kCFNumberFloat64Type:
      double valuePtr = 0.0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberFloat64Type;
      goto LABEL_29;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberCharType;
LABEL_10:
      int Value = CFNumberGetValue(v2, v3, &valuePtr);
      BOOL v16 = Value == 0;
      int v17 = LOBYTE(valuePtr);
      goto LABEL_15;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      CFNumberRef v5 = a1;
      CFNumberType v6 = kCFNumberShortType;
LABEL_12:
      int Value = CFNumberGetValue(v5, v6, &valuePtr);
      BOOL v16 = Value == 0;
      int v17 = LOWORD(valuePtr);
      goto LABEL_15;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v7 = a1;
      CFNumberType v8 = kCFNumberIntType;
LABEL_14:
      int Value = CFNumberGetValue(v7, v8, &valuePtr);
      BOOL v16 = Value == 0;
      int v17 = LODWORD(valuePtr);
LABEL_15:
      BOOL v18 = v16 || v17 == 0;
      goto LABEL_33;
    case kCFNumberLongType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberLongType;
      goto LABEL_25;
    case kCFNumberLongLongType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberLongLongType;
      goto LABEL_25;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberFloatType;
LABEL_21:
      int Value = CFNumberGetValue(v11, v12, &valuePtr);
      BOOL v19 = *(float *)&valuePtr == 0.0;
      goto LABEL_30;
    case kCFNumberDoubleType:
      double valuePtr = 0.0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberDoubleType;
      goto LABEL_29;
    case kCFNumberCFIndexType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberCFIndexType;
      goto LABEL_25;
    case kCFNumberNSIntegerType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberNSIntegerType;
LABEL_25:
      int Value = CFNumberGetValue(v9, v10, &valuePtr);
      if (Value) {
        BOOL v18 = *(void *)&valuePtr == 0;
      }
      else {
        BOOL v18 = 1;
      }
      goto LABEL_33;
    case kCFNumberCGFloatType:
      double valuePtr = 0.0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberCGFloatType;
LABEL_29:
      int Value = CFNumberGetValue(v13, v14, &valuePtr);
      BOOL v19 = valuePtr == 0.0;
LABEL_30:
      BOOL v18 = v19 || Value == 0;
LABEL_33:
      int v4 = !v18;
      if (!Value) {
        goto LABEL_38;
      }
      int v20 = 256;
      break;
    default:
      int v4 = 0;
LABEL_38:
      int v20 = 0;
      break;
  }
  return v20 | v4;
}

float sub_100005540(const __CFNumber *a1)
{
  unint64_t v1 = sub_1000055B4(a1);
  if ((v1 & 0xFF00000000) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_100004D00(exception);
  }
  return *(float *)&v1;
}

void sub_1000055A0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unint64_t sub_1000055B4(const __CFNumber *a1)
{
  if (a1)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(a1)) {
      return sub_100005680(a1);
    }
  }

  return sub_10000561C(a1);
}

unint64_t sub_10000561C(const __CFBoolean *a1)
{
  if (a1 && (CFTypeID TypeID = CFBooleanGetTypeID(), TypeID == CFGetTypeID(a1)))
  {
    uint64_t v3 = COERCE_UNSIGNED_INT((float)CFBooleanGetValue(a1));
    int v4 = &_mh_execute_header;
  }
  else
  {
    int v4 = 0;
    uint64_t v3 = 0;
  }
  return v3 | (unint64_t)v4;
}

unint64_t sub_100005680(const __CFNumber *a1)
{
  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      CFNumberRef v7 = a1;
      CFNumberType v8 = kCFNumberSInt16Type;
      goto LABEL_12;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberSInt32Type;
      goto LABEL_15;
    case kCFNumberSInt64Type:
      double valuePtr = 0.0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberSInt64Type;
      goto LABEL_23;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberFloat32Type;
      goto LABEL_19;
    case kCFNumberFloat64Type:
      double valuePtr = 0.0;
      CFNumberRef v15 = a1;
      CFNumberType v16 = kCFNumberFloat64Type;
      goto LABEL_25;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberCharType;
LABEL_10:
      int Value = CFNumberGetValue(v2, v3, &valuePtr);
      int v18 = SLOBYTE(valuePtr);
      goto LABEL_13;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      CFNumberRef v7 = a1;
      CFNumberType v8 = kCFNumberShortType;
LABEL_12:
      int Value = CFNumberGetValue(v7, v8, &valuePtr);
      int v18 = SLOWORD(valuePtr);
LABEL_13:
      float v19 = (float)v18;
      goto LABEL_26;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberIntType;
LABEL_15:
      int Value = CFNumberGetValue(v9, v10, &valuePtr);
      float v19 = (float)SLODWORD(valuePtr);
      goto LABEL_26;
    case kCFNumberLongType:
      double valuePtr = 0.0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberLongType;
      goto LABEL_23;
    case kCFNumberLongLongType:
      double valuePtr = 0.0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberLongLongType;
      goto LABEL_23;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberFloatType;
LABEL_19:
      int Value = CFNumberGetValue(v13, v14, &valuePtr);
      uint64_t v20 = LODWORD(valuePtr);
      goto LABEL_27;
    case kCFNumberDoubleType:
      double valuePtr = 0.0;
      CFNumberRef v15 = a1;
      CFNumberType v16 = kCFNumberDoubleType;
      goto LABEL_25;
    case kCFNumberCFIndexType:
      double valuePtr = 0.0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberCFIndexType;
      goto LABEL_23;
    case kCFNumberNSIntegerType:
      double valuePtr = 0.0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberNSIntegerType;
LABEL_23:
      int Value = CFNumberGetValue(v11, v12, &valuePtr);
      float v19 = (float)*(uint64_t *)&valuePtr;
      goto LABEL_26;
    case kCFNumberCGFloatType:
      double valuePtr = 0.0;
      CFNumberRef v15 = a1;
      CFNumberType v16 = kCFNumberCGFloatType;
LABEL_25:
      int Value = CFNumberGetValue(v15, v16, &valuePtr);
      float v19 = valuePtr;
LABEL_26:
      uint64_t v20 = LODWORD(v19);
LABEL_27:
      unint64_t v6 = v20 | (unint64_t)&_mh_execute_header;
      if (!Value) {
        unint64_t v6 = 0;
      }
      int v4 = v6 & 0xFFFFFF00;
      unint64_t v5 = v6 & (unint64_t)&_mh_execute_header;
      break;
    default:
      int v4 = 0;
      unint64_t v5 = 0;
      LOBYTE(v6) = 0;
      break;
  }
  return v5 | v4 & 0xFFFFFF00 | v6;
}

CFBooleanRef sub_1000058CC(const __CFNumber *a1)
{
  CFBooleanRef result = sub_10000593C(a1);
  if (!v2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_100004D00(exception);
  }
  return result;
}

void sub_100005928(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

CFBooleanRef sub_10000593C(const __CFNumber *a1)
{
  if (a1)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(a1)) {
      return (const __CFBoolean *)sub_100005A08(a1);
    }
  }

  return sub_1000059A4(a1);
}

CFBooleanRef sub_1000059A4(const __CFBoolean *result)
{
  if (result)
  {
    CFBooleanRef v1 = result;
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (TypeID == CFGetTypeID(v1)) {
      return (const __CFBoolean *)CFBooleanGetValue(v1);
    }
    else {
      return 0;
    }
  }
  return result;
}

unint64_t sub_100005A08(const __CFNumber *a1)
{
  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      CFNumberRef v6 = a1;
      CFNumberType v7 = kCFNumberSInt16Type;
      goto LABEL_18;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v8 = a1;
      CFNumberType v9 = kCFNumberSInt32Type;
      goto LABEL_20;
    case kCFNumberSInt64Type:
      double valuePtr = 0.0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberSInt64Type;
      goto LABEL_31;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v12 = a1;
      CFNumberType v13 = kCFNumberFloat32Type;
      goto LABEL_27;
    case kCFNumberFloat64Type:
      double valuePtr = 0.0;
      CFNumberRef v14 = a1;
      CFNumberType v15 = kCFNumberFloat64Type;
      goto LABEL_33;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberCharType;
LABEL_10:
      int Value = CFNumberGetValue(v2, v3, &valuePtr);
      if (Value) {
        char v17 = LOBYTE(valuePtr);
      }
      else {
        char v17 = 0;
      }
      if (Value != 0 && SLOBYTE(valuePtr) < 0) {
        unint64_t v4 = -256;
      }
      else {
        unint64_t v4 = 0;
      }
      LOBYTE(v5) = v17;
      return v5 | v4;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      CFNumberRef v6 = a1;
      CFNumberType v7 = kCFNumberShortType;
LABEL_18:
      BOOL v18 = CFNumberGetValue(v6, v7, &valuePtr) == 0;
      unsigned __int8 v19 = LOBYTE(valuePtr);
      uint64_t v20 = SLOWORD(valuePtr);
      goto LABEL_21;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v8 = a1;
      CFNumberType v9 = kCFNumberIntType;
LABEL_20:
      BOOL v18 = CFNumberGetValue(v8, v9, &valuePtr) == 0;
      unsigned __int8 v19 = LOBYTE(valuePtr);
      uint64_t v20 = SLODWORD(valuePtr);
LABEL_21:
      unint64_t v21 = v20 & 0xFFFFFFFFFFFFFF00 | v19;
      if (v18) {
        uint64_t v5 = 0;
      }
      else {
        uint64_t v5 = v21;
      }
      goto LABEL_37;
    case kCFNumberLongType:
      double valuePtr = 0.0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberLongType;
      goto LABEL_31;
    case kCFNumberLongLongType:
      double valuePtr = 0.0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberLongLongType;
      goto LABEL_31;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v12 = a1;
      CFNumberType v13 = kCFNumberFloatType;
LABEL_27:
      BOOL v22 = CFNumberGetValue(v12, v13, &valuePtr) == 0;
      uint64_t v5 = (uint64_t)*(float *)&valuePtr;
      goto LABEL_34;
    case kCFNumberDoubleType:
      double valuePtr = 0.0;
      CFNumberRef v14 = a1;
      CFNumberType v15 = kCFNumberDoubleType;
      goto LABEL_33;
    case kCFNumberCFIndexType:
      double valuePtr = 0.0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberCFIndexType;
      goto LABEL_31;
    case kCFNumberNSIntegerType:
      double valuePtr = 0.0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberNSIntegerType;
LABEL_31:
      BOOL v22 = CFNumberGetValue(v10, v11, &valuePtr) == 0;
      uint64_t v5 = *(void *)&valuePtr;
      goto LABEL_34;
    case kCFNumberCGFloatType:
      double valuePtr = 0.0;
      CFNumberRef v14 = a1;
      CFNumberType v15 = kCFNumberCGFloatType;
LABEL_33:
      BOOL v22 = CFNumberGetValue(v14, v15, &valuePtr) == 0;
      uint64_t v5 = (uint64_t)valuePtr;
LABEL_34:
      if (v22) {
        uint64_t v5 = 0;
      }
LABEL_37:
      unint64_t v4 = v5 & 0xFFFFFFFFFFFFFF00;
      break;
    default:
      unint64_t v4 = 0;
      LOBYTE(v5) = 0;
      break;
  }
  return v5 | v4;
}

CFTypeRef sub_100005C98@<X0>(const __CFArray *a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  if (!a1 || CFArrayGetCount(a1) <= a2 || (ValueAtIndex = CFArrayGetValueAtIndex(a1, a2), (CFNumberType v7 = ValueAtIndex) == 0))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_100005D4C(exception);
  }
  CFTypeRef result = CFRetain(ValueAtIndex);
  *a3 = v7;
  return result;
}

void sub_100005D38(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::runtime_error *sub_100005D4C@<X0>(std::runtime_error *a1@<X8>)
{
  return std::runtime_error::runtime_error(a1, "Could not find item");
}

uint64_t sub_100005D5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void sub_100005DF4()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_100008458;
}

void sub_100005E44(std::exception *a1)
{
  std::exception::~exception(a1);

  operator delete();
}

void *sub_100005E7C(void *a1)
{
  CFNumberRef v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

CFStringRef *sub_100005F00(CFStringRef *a1, char *a2, char *a3)
{
  uint64_t v5 = sub_100005F4C(a1, a2);
  sub_100005F4C(v5 + 1, a3);
  return a1;
}

void sub_100005F38(_Unwind_Exception *a1)
{
  sub_100003270(v1);
  _Unwind_Resume(a1);
}

CFStringRef *sub_100005F4C(CFStringRef *a1, char *a2)
{
  sub_100004E20(__p, a2);
  if ((v9 & 0x80u) == 0) {
    uint64_t v3 = __p;
  }
  else {
    uint64_t v3 = (void **)__p[0];
  }
  if ((v9 & 0x80u) == 0) {
    CFIndex v4 = v9;
  }
  else {
    CFIndex v4 = (CFIndex)__p[1];
  }
  CFStringRef v5 = CFStringCreateWithBytes(0, (const UInt8 *)v3, v4, 0x8000100u, 0);
  *a1 = v5;
  if (!v5)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }
  if ((char)v9 < 0) {
    operator delete(__p[0]);
  }
  return a1;
}

void sub_10000600C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (*v15) {
    CFRelease(*v15);
  }
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

CFStringRef *sub_100006050(CFStringRef *a1, char *a2, char *a3)
{
  CFStringRef v5 = sub_100005F4C(a1, a2);
  sub_100005F4C(v5 + 1, a3);
  return a1;
}

void sub_100006088(_Unwind_Exception *a1)
{
  sub_100003270(v1);
  _Unwind_Resume(a1);
}

CFStringRef *sub_10000609C(CFStringRef *a1, char *a2, char *a3)
{
  CFStringRef v5 = sub_100005F4C(a1, a2);
  sub_100005F4C(v5 + 1, a3);
  return a1;
}

void sub_1000060D4(_Unwind_Exception *a1)
{
  sub_100003270(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000060E8(uint64_t a1, char *a2, const void **a3)
{
  sub_100005F4C((CFStringRef *)a1, a2);
  CFStringRef v5 = *a3;
  if (v5) {
    CFRetain(v5);
  }
  *(void *)(a1 + 8) = v5;
  return a1;
}

uint64_t sub_10000612C(uint64_t a1, int a2)
{
  io_registry_entry_t v3 = sub_1000061C4(a1);
  io_object_t v4 = v3;
  if (v3)
  {
    CFStringRef v5 = (void *)sub_10000622C(v3);
    if (v5)
    {
      uint64_t v6 = (uint64_t)v5;
      if (a2) {
        CFStringRef v7 = sub_100002244((uint64_t)v5);
      }
      else {
        CFStringRef v7 = sub_100002844(v5);
      }
      CFStringRef v8 = v7;
      CFShow(v7);
      CFRelease(v8);
      sub_100001B9C(v6);
      operator delete();
    }
  }

  return IOObjectRelease(v4);
}

uint64_t sub_1000061C4(uint64_t a1)
{
  CFDictionaryRef v1 = IORegistryEntryIDMatching(a1);
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v1);
  uint64_t v3 = MatchingService;
  if (!MatchingService || !IOObjectConformsTo(MatchingService, "AppleTypeCRetimerReporter"))
  {
    IOObjectRelease(v3);
    return 0;
  }
  return v3;
}

uint64_t sub_10000622C(io_registry_entry_t a1)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a1, @"report", kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    CFNumberRef v2 = CFProperty;
    CFTypeID v3 = CFGetTypeID(CFProperty);
    if (v3 == CFDictionaryGetTypeID()) {
      sub_100001930();
    }
    CFRelease(v2);
  }
  return 0;
}

uint64_t start(int a1, const char **a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start\n", buf, 2u);
  }
  if (a1 == 3)
  {
    io_object_t v4 = a2[1];
    if (!strcmp(v4, "handle"))
    {
      uint64_t v5 = atoll(a2[2]);
      sub_100006554(v5);
      goto LABEL_16;
    }
  }
  else
  {
    if (a1 == 2)
    {
      if (!strcmp(a2[1], "report"))
      {
        xpc_set_event_stream_handler("com.apple.iokit.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100008490);
        CFRunLoopRun();
      }
      goto LABEL_16;
    }
    if ((a1 - 3) > 1) {
      goto LABEL_16;
    }
    io_object_t v4 = a2[1];
  }
  if (!strcmp(v4, "show"))
  {
    uint64_t v6 = atoll(a2[2]);
    int v7 = a1 == 4 && strcmp(a2[3], "json") == 0;
    sub_10000612C(v6, v7);
  }
LABEL_16:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "done\n", v9, 2u);
  }
  return 0;
}

void sub_10000649C(id a1, void *a2)
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a2, "IOMatchLaunchServiceID");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 134217984;
    uint64_t v4 = uint64;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "entry_id = 0x%llx\n", (uint8_t *)&v3, 0xCu);
  }
  sub_100006554(uint64);
}

uint64_t sub_100006554(uint64_t a1)
{
  io_registry_entry_t parent = 0;
  io_registry_entry_t v1 = sub_1000061C4(a1);
  io_registry_entry_t v2 = v1;
  if (v1)
  {
    uint64_t v3 = sub_10000622C(v1);
    if (v3)
    {
      uint64_t v4 = (__CFString *)sub_100002244(v3);
      int v5 = sub_100006784(v4);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = "failed";
        if (v5) {
          uint64_t v6 = "succeeded";
        }
        *(_DWORD *)buf = 136315138;
        CFNumberRef v10 = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "writing log for submission %s\n", buf, 0xCu);
      }
      if (!IORegistryEntryGetParentEntry(v2, "IOService", &parent))
      {
        if (IOObjectConformsTo(parent, "AppleTypeCRetimer")) {
          operator new();
        }
      }
      sub_100001B9C(v3);
      operator delete();
    }
    io_registry_entry_t v1 = 0;
  }
  IOObjectRelease(v1);
  return IOObjectRelease(v2);
}

void sub_100006758()
{
}

uint64_t sub_100006784(void *a1)
{
  io_registry_entry_t v1 = [a1 dataUsingEncoding:4 allowLossyConversion:1];
  uint64_t v12 = kOSALogOptionOverrideFilePrefix;
  CFStringRef v13 = @"RetimerCrash";
  io_registry_entry_t v2 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  id v11 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006914;
  v9[3] = &unk_1000084B8;
  id v3 = v1;
  id v10 = v3;
  uint64_t v4 = +[OSALog createForSubmission:@"305" metadata:0 options:v2 error:&v11 writing:v9];
  id v5 = v11;

  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  uint64_t v7 = v6;

  return v7;
}

void sub_1000068E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100006914(uint64_t a1, void *a2)
{
  return [a2 writeData:*(void *)(a1 + 32)];
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
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

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeID CFNullGetTypeID(void)
{
  return _CFNullGetTypeID();
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return _CFNumberGetType(number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopRun(void)
{
}

void CFShow(CFTypeRef obj)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

kern_return_t IOConnectAddRef(io_connect_t connect)
{
  return _IOConnectAddRef(connect);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

kern_return_t IOConnectRelease(io_connect_t connect)
{
  return _IOConnectRelease(connect);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return _IORegistryEntryIDMatching(entryID);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t RTBuddyCrashlogDecode()
{
  return _RTBuddyCrashlogDecode();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return std::string::append(this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return std::string::insert(this, __pos, __s);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, float __val)
{
  return std::to_string(retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return std::to_string(retstr, __val);
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t atoll(const char *a1)
{
  return _atoll(a1);
}

void bzero(void *a1, size_t a2)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}