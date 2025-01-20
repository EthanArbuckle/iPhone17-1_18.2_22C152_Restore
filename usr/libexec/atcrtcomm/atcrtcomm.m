double sub_1000023F4(void *a1, uint64_t a2)
{
  void *v2;
  double result;

  v2 = sub_100002BDC(a1, a2);
  *v2 = &off_1000041C8;
  result = 0.0;
  *(_OWORD *)(v2 + 3) = 0u;
  *(_OWORD *)(v2 + 5) = 0u;
  *(_OWORD *)(v2 + 7) = 0u;
  *(_OWORD *)(v2 + 9) = 0u;
  *(_OWORD *)(v2 + 11) = 0u;
  *(_OWORD *)(v2 + 13) = 0u;
  *(_OWORD *)(v2 + 15) = 0u;
  return result;
}

uint64_t sub_100002448(uint64_t a1)
{
  uint64_t v6 = 255;
  uint64_t v2 = sub_100002D7C(a1);
  if (!v2)
  {
    sub_100003370(a1, &v6);
    v3 = &unk_100003B84;
    if (v6 == 1) {
      int v4 = 3;
    }
    else {
      int v4 = 2;
    }
    if (v6 == 1) {
      v3 = &unk_100003B78;
    }
    *(_DWORD *)(a1 + 124) = v4;
    *(void *)(a1 + 128) = v3;
  }
  return v2;
}

void sub_1000024C0(const char *a1, const char *a2, const char *a3, const void *a4, size_t a5)
{
  size_t v10 = strlen(a1);
  size_t v11 = v10 + strlen(a2) + 2;
  v12 = (char *)malloc_type_malloc(v11, 0x9CE72B84uLL);
  snprintf(v12, v11, "%s/%s", a1, a2);
  printf("writing to file %s \n", v12);
  v13 = fopen(v12, a3);
  if (v13)
  {
    v14 = v13;
    fwrite(a4, a5, 1uLL, v13);
    fclose(v14);
  }
  else
  {
    puts("Error in opening output file for section data");
  }

  free(v12);
}

uint64_t sub_1000025B4(uint64_t a1)
{
  *(_DWORD *)(a1 + 120) = 0;
  if (!*(_DWORD *)(a1 + 124)) {
    return 0;
  }
  uint64_t v2 = 0;
  for (i = (uint64_t *)(a1 + 32); ; i += 4)
  {
    uint64_t v4 = sub_100003208(a1, *(unsigned int *)(*(void *)(a1 + 128) + 4 * v2), i, 1uLL);
    if (v4) {
      break;
    }
    uint64_t v5 = *i;
    *(_DWORD *)(a1 + 120) += *i;
    int v6 = *(_DWORD *)(*(void *)(a1 + 128) + 4 * v2);
    *((_DWORD *)i - 2) = v6;
    printf("section %u size is %llu bytes\n", v6, v5);
    if (++v2 >= (unint64_t)*(int *)(a1 + 124)) {
      return 0;
    }
  }
  uint64_t v7 = v4;
  fwrite("getSectionsSizes not responsive assuming retimer not active \n", 0x3DuLL, 1uLL, __stderrp);
  return v7;
}

uint64_t sub_100002690(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 124);
  if (v1)
  {
    unint64_t v3 = 0;
    uint64_t v4 = (void **)(a1 + 48);
    do
    {
      if (*(v4 - 2))
      {
        uint64_t v5 = malloc_type_calloc(1uLL, (size_t)*(v4 - 1), 0x838F0C46uLL);
        *uint64_t v4 = v5;
        if (!v5) {
          return 5;
        }
        uint64_t v6 = sub_10000329C(a1, *((unsigned int *)v4 - 6), v5, (size_t)*(v4 - 1), 1uLL);
        if (v6)
        {
          uint64_t v9 = v6;
          fwrite("\t<ERROR: getSectionData\n", 0x18uLL, 1uLL, __stderrp);
          free(*v4);
          *uint64_t v4 = 0;
          return v9;
        }
        CFStringRef v7 = sub_100002798(a1, *((_DWORD *)v4 - 6));
        CStringPtr = CFStringGetCStringPtr(v7, 0);
        printf("got data done filename is %s \n", CStringPtr);
        int v1 = *(_DWORD *)(a1 + 124);
      }
      ++v3;
      v4 += 4;
    }
    while (v3 < v1);
  }
  return 0;
}

CFStringRef sub_100002798(uint64_t a1, int a2)
{
  if ((a2 - 3) > 9) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = off_100004210[a2 - 3];
  }
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@_%@.bin", v2, *(void *)(a1 + 8));
}

uint64_t sub_1000027FC(uint64_t result, unsigned int a2)
{
  if (*(_DWORD *)(result + 124))
  {
    uint64_t v2 = result;
    unint64_t v3 = 0;
    float v4 = (float)a2;
    uint64_t v5 = (unint64_t *)(result + 40);
    do
    {
      unint64_t v6 = (unint64_t)(float)((float)((float)*(v5 - 1) / (float)*(unsigned int *)(v2 + 120)) * v4) & 0xFFFFFFFFFFFFFFFCLL;
      *uint64_t v5 = v6;
      result = printf("size to read for section %u is %llu\n", *((_DWORD *)v5 - 4), v6);
      ++v3;
      v5 += 4;
    }
    while (v3 < *(int *)(v2 + 124));
  }
  return result;
}

void sub_100002898(uint64_t a1, const char *a2)
{
  if (*(_DWORD *)(a1 + 124))
  {
    unint64_t v4 = 0;
    uint64_t v5 = (const void **)(a1 + 48);
    do
    {
      if (*(v5 - 2) && *v5)
      {
        CFStringRef v6 = sub_100002798(a1, *((_DWORD *)v5 - 6));
        CStringPtr = CFStringGetCStringPtr(v6, 0);
        if (CStringPtr) {
          sub_1000024C0(a2, CStringPtr, "wb", *v5, (size_t)*(v5 - 1));
        }
      }
      ++v4;
      v5 += 4;
    }
    while (v4 < *(int *)(a1 + 124));
  }
}

void sub_100002934(uint64_t a1, const char *a2)
{
  char v7 = 0;
  memset(outputStruct, 0, sizeof(outputStruct));
  if (sub_100003324(a1, outputStruct, 0x80uLL))
  {
    puts("Error in reading FW version");
  }
  else
  {
    CFStringRef v4 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@_version.txt", *(void *)(a1 + 8));
    CStringPtr = CFStringGetCStringPtr(v4, 0);
    sub_1000024C0(a2, CStringPtr, "w", outputStruct, 0x80uLL);
  }
}

void sub_100002A0C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 124);
  if (v1)
  {
    unint64_t v3 = 0;
    CFStringRef v4 = (void **)(a1 + 48);
    do
    {
      if (*v4)
      {
        free(*v4);
        *CFStringRef v4 = 0;
        int v1 = *(_DWORD *)(a1 + 124);
      }
      ++v3;
      v4 += 4;
    }
    while (v3 < v1);
  }
}

uint64_t sub_100002A68(uint64_t a1)
{
  return *(unsigned int *)(a1 + 120);
}

uint64_t sub_100002A70(uint64_t a1, uint64_t a2)
{
  if (a2) {
    operator new();
  }
  return 0;
}

void sub_100002B18()
{
}

void sub_100002B3C(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_100002C54(a2);
    operator delete();
  }
}

void *sub_100002B80(void *a1, const char *a2)
{
  CFStringRef v3 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  *a1 = &off_100004270;
  a1[1] = v3;
  a1[2] = 0;
  return a1;
}

void *sub_100002BDC(void *result, uint64_t a2)
{
  *result = &off_100004270;
  result[1] = a2;
  result[2] = 0;
  return result;
}

uint64_t sub_100002C00(uint64_t a1, io_object_t object)
{
  *(void *)a1 = &off_100004270;
  IOObjectRetain(object);
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = object;
  *(_DWORD *)(a1 + 20) = 0;
  return a1;
}

void *sub_100002C54(void *a1)
{
  *a1 = &off_100004270;
  sub_100002CAC((uint64_t)a1);
  uint64_t v2 = (const void *)a1[1];
  if (v2) {
    CFRelease(v2);
  }
  a1[1] = 0;
  return a1;
}

uint64_t sub_100002CAC(uint64_t a1)
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

void sub_100002CEC(void *a1)
{
}

uint64_t sub_100002D04(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &off_100004270;
  *(void *)(a1 + 8) = CFStringCreateCopy(kCFAllocatorDefault, *(CFStringRef *)(a2 + 8));
  io_object_t v4 = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 16) = v4;
  IOObjectRetain(v4);
  io_connect_t v5 = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 20) = v5;
  IOConnectAddRef(v5);
  return a1;
}

uint64_t sub_100002D7C(uint64_t a1)
{
  io_service_t MatchingService = *(_DWORD *)(a1 + 16);
  if (!MatchingService)
  {
    CFStringRef v3 = IOServiceMatching("AppleTypeCRetimer");
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

uint64_t sub_100002E5C(uint64_t a1, unsigned int a2)
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

uint64_t sub_100002ED4(uint64_t a1, BOOL *a2)
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

uint64_t sub_100002F68(uint64_t a1, unsigned int a2)
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

uint64_t sub_100002FE0(uint64_t a1, uint64_t a2)
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

__CFArray *sub_100003054()
{
  io_iterator_t existing = 0;
  CFDictionaryRef v0 = IOServiceMatching("AppleTypeCRetimer");
  mach_error_t MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v0, &existing);
  if (MatchingServices)
  {
    mach_port_t v2 = __stderrp;
    CFStringRef v3 = mach_error_string(MatchingServices);
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
      CFArraySortValues(Mutable, v11, (CFComparatorFunction)&CFStringCompare, 0);
    }
    else
    {
      fwrite("ERROR: failed to allocate an array\n", 0x23uLL, 1uLL, __stderrp);
    }
  }
  return Mutable;
}

uint64_t sub_100003208(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
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

uint64_t sub_10000329C(uint64_t a1, uint64_t a2, void *outputStruct, size_t a4, uint64_t a5)
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

uint64_t sub_100003324(uint64_t a1, void *outputStruct, size_t a3)
{
  size_t v4 = a3;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 6u, 0, 0, 0, 0, 0, 0, outputStruct, &v4);
}

uint64_t sub_100003370(uint64_t a1, uint64_t *a2)
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

uint64_t start(int a1, uint64_t a2)
{
  CFStringRef v3 = *(const char **)(a2 + 8);
  puts("atcrtcomm v0.1");
  if (a1 <= 1)
  {
    printf("Path not provided");
    return 1;
  }
  mach_port_t v5 = sub_100003054();
  CFIndex Count = CFArrayGetCount(v5);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, (const CFArrayCallBacks *)&unk_1000041D0);
  if (Count)
  {
    CFArrayGetValueAtIndex(v5, 0);
    operator new();
  }
  if (v5) {
    CFRelease(v5);
  }
  if (!CFArrayGetCount(Mutable))
  {
    if (Mutable) {
      CFRelease(Mutable);
    }
    return 1;
  }
  CFIndex v8 = CFArrayGetCount(Mutable);
  if (v8)
  {
    CFIndex v9 = v8;
    for (CFIndex i = 0; i != v9; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(Mutable, i);
      sub_100002934((uint64_t)ValueAtIndex, v3);
    }
  }
  CFIndex v12 = CFArrayGetCount(Mutable);
  if (v12)
  {
    CFIndex v13 = 0;
    unsigned int v14 = 0;
    do
    {
      v15 = CFArrayGetValueAtIndex(Mutable, v13);
      v14 += sub_100002A68((uint64_t)v15);
      ++v13;
    }
    while (v12 != v13);
  }
  else
  {
    unsigned int v14 = 0;
  }
  v16 = CFArrayGetValueAtIndex(Mutable, 0);
  uint64_t v34 = 255;
  sub_100003370((uint64_t)v16, &v34);
  if (v34 == 1) {
    int v17 = 27800;
  }
  else {
    int v17 = 0;
  }
  if (v34) {
    unsigned int v18 = v17;
  }
  else {
    unsigned int v18 = 10800;
  }
  unsigned int v19 = ((double)v18 * 4.49999999);
  printf("transfer_rate %d approx_total_size %d \n", v18, v19);
  if (v12)
  {
    for (CFIndex j = 0; j != v12; ++j)
    {
      v21 = CFArrayGetValueAtIndex(Mutable, j);
      unsigned int v22 = sub_100002A68((uint64_t)v21);
      unsigned int v23 = v22;
      if (v14 > v19) {
        unsigned int v23 = (float)((float)((float)v22 / (float)v14) * (float)v19);
      }
      sub_1000027FC((uint64_t)v21, v23);
    }
  }
  if (CFArrayGetCount(Mutable))
  {
    unint64_t v24 = 0;
    do
    {
      v25 = CFArrayGetValueAtIndex(Mutable, v24);
      if (sub_100002690((uint64_t)v25)) {
        fprintf(__stderrp, "\t<ERROR: extractSectionsData reader index is %zu\n", v24);
      }
      ++v24;
    }
    while (v24 < CFArrayGetCount(Mutable));
  }
  CFIndex v26 = CFArrayGetCount(Mutable);
  if (v26)
  {
    CFIndex v27 = v26;
    for (CFIndex k = 0; k != v27; ++k)
    {
      v29 = CFArrayGetValueAtIndex(Mutable, k);
      sub_100002898((uint64_t)v29, v3);
    }
  }
  CFIndex v30 = CFArrayGetCount(Mutable);
  if (v30)
  {
    CFIndex v31 = v30;
    for (CFIndex m = 0; m != v31; ++m)
    {
      v33 = CFArrayGetValueAtIndex(Mutable, m);
      sub_100002A0C((uint64_t)v33);
      sub_100002CAC((uint64_t)v33);
      puts("closed interface ");
    }
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return 0;
}

void sub_100003848()
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}