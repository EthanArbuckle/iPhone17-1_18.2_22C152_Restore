__CFArray *DHCPSDHCPLeaseListCreate()
{
  __CFArray *Mutable;
  unsigned int *v1;
  const CFDictionaryKeyCallBacks *v2;
  const CFDictionaryValueCallBacks *v3;
  uint64_t v4;
  unint64_t v5;
  __CFDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  CFStringRef v9;
  CFStringRef v10;
  CFStringRef v11;
  BOOL v12;
  double Current;
  int Count;
  CFIndex v15;
  __darwin_time_t tv_sec;
  uint64_t v17;
  CFDictionaryRef ValueAtIndex;
  CFStringRef Value;
  CFStringRef v20;
  uint64_t v21;
  CFDateRef v22;
  timeval v24;
  CFIndex usedBufLen;
  UInt8 buffer[8];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CFRange v30;

  v29 = *MEMORY[0x263EF8340];
  *(void *)buffer = 0;
  v27 = 0;
  v28 = 0;
  sub_22149A34C(buffer);
  sub_22149A360((uint64_t)buffer, 104857600);
  if (!sub_22149A42C((uint64_t)buffer, "/var/db/dhcpd_leases")) {
    return 0;
  }
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  v1 = *(unsigned int **)buffer;
  if (!*(void *)buffer) {
    goto LABEL_24;
  }
  v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
  v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  do
  {
    if (!*v1) {
      goto LABEL_23;
    }
    v4 = 0;
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = *((void *)v1 + 1);
      if (!*(_DWORD *)(v7 + v4 + 8)) {
        goto LABEL_17;
      }
      if (!v6) {
        v6 = CFDictionaryCreateMutable(0, 0, v2, v3);
      }
      v8 = v7 + v4;
      v9 = sub_22149A248(*(char **)(v7 + v4));
      v10 = sub_22149A248(**(char ***)(v8 + 16));
      v11 = v10;
      if (v9) {
        v12 = v10 == 0;
      }
      else {
        v12 = 1;
      }
      if (v12)
      {
        if (!v9)
        {
          if (!v10) {
            goto LABEL_17;
          }
LABEL_16:
          CFRelease(v11);
          goto LABEL_17;
        }
      }
      else
      {
        CFDictionarySetValue(v6, v9, v10);
      }
      CFRelease(v9);
      if (v11) {
        goto LABEL_16;
      }
LABEL_17:
      ++v5;
      v4 += 24;
    }
    while (v5 < *v1);
    if (v6)
    {
      CFArrayAppendValue(Mutable, v6);
      CFRelease(v6);
    }
LABEL_23:
    v1 = (unsigned int *)*((void *)v1 + 4);
  }
  while (v1);
LABEL_24:
  if (!CFArrayGetCount(Mutable))
  {
    CFRelease(Mutable);
    sub_22149A3EC((uint64_t *)buffer);
    return 0;
  }
  sub_22149A3EC((uint64_t *)buffer);
  if (Mutable)
  {
    v24.tv_sec = 0;
    *(void *)&v24.tv_usec = 0;
    gettimeofday(&v24, 0);
    Current = CFAbsoluteTimeGetCurrent();
    Count = CFArrayGetCount(Mutable);
    if (Count >= 1)
    {
      v15 = 0;
      tv_sec = v24.tv_sec;
      v17 = Count;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Mutable, v15);
        Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"lease");
        if (Value)
        {
          v20 = Value;
          usedBufLen = 0;
          v30.length = CFStringGetLength(Value);
          v30.location = 0;
          CFStringGetBytes(v20, v30, 0, 0, 0, buffer, 128, &usedBufLen);
          buffer[usedBufLen] = 0;
          v21 = strtol((const char *)buffer, 0, 0);
          v22 = CFDateCreate(0, Current + (double)(v21 - tv_sec));
          CFDictionarySetValue(ValueAtIndex, @"lease", v22);
          CFRelease(v22);
        }
        ++v15;
      }
      while (v17 != v15);
    }
  }
  return Mutable;
}

const void *DHCPSCopyDisabledInterfaces()
{
  CFDictionaryRef v0 = (const __CFDictionary *)SCDynamicStoreCopyValue(0, @"com.apple.bootpd.DHCPServer");
  if (!v0) {
    return 0;
  }
  CFDictionaryRef v1 = v0;
  Value = CFDictionaryGetValue(v0, @"DisabledInterfaces");
  v3 = Value;
  if (Value) {
    CFRetain(Value);
  }
  CFRelease(v1);
  return v3;
}

CFStringRef sub_22149A248(char *cStr)
{
  CFStringRef result = CFStringCreateWithCString(0, cStr, 0x8000100u);
  if (!result)
  {
    return CFStringCreateWithCString(0, cStr, 0);
  }
  return result;
}

void *sub_22149A2A4(unsigned int a1, uint64_t a2)
{
  v4 = malloc_type_malloc(0x30uLL, 0x10A0040A76AC297uLL);
  if (v4)
  {
    void *v4 = sub_22149A99C(a1, a2);
    v4[1] = v5;
    v4[4] = 0;
    v4[5] = 0;
  }
  return v4;
}

void sub_22149A308(uint64_t a1)
{
  sub_22149A930((unsigned int *)a1);
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;

  free((void *)a1);
}

void *sub_22149A34C(void *result)
{
  result[1] = 0;
  result[2] = 0;
  *CFStringRef result = 0;
  *((_DWORD *)result + 4) = 256;
  return result;
}

void sub_22149A360(uint64_t a1, int a2)
{
  if (a2 <= 10) {
    int v2 = 10;
  }
  else {
    int v2 = a2;
  }
  *(_DWORD *)(a1 + 16) = v2;
  int v3 = *(_DWORD *)(a1 + 20);
  int v4 = v3 - v2;
  if (v3 > v2)
  {
    if (v4 <= 0)
    {
      *(void *)(a1 + 8) = 0;
      v8 = (void *)a1;
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 8);
      do
      {
        uint64_t v7 = v6;
        uint64_t v6 = *(void *)(v6 + 40);
        sub_22149A308(v7);
        --v4;
      }
      while (v4);
      *(void *)(a1 + 8) = v6;
      v8 = (void *)(v6 + 32);
      if (!v6) {
        v8 = (void *)a1;
      }
    }
    void *v8 = 0;
    *(_DWORD *)(a1 + 20) = *(_DWORD *)(a1 + 16);
  }
}

uint64_t sub_22149A3EC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result)
  {
    do
    {
      uint64_t v3 = *(void *)(result + 32);
      sub_22149A308(result);
      uint64_t result = v3;
    }
    while (v3);
  }
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return result;
}

uint64_t sub_22149A42C(uint64_t a1, char *__filename)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v3 = fopen(__filename, "r");
  if (v3)
  {
    int v4 = v3;
    int v5 = 0;
    int v6 = 0;
LABEL_3:
    int v7 = v6;
    while (1)
    {
      int v8 = 1023;
      v9 = __s;
      do
      {
        int v10 = fgetc(v4);
        if ((v10 + 1) < 2) {
          break;
        }
        if (v8 >= 1)
        {
          *v9++ = v10;
          --v8;
        }
      }
      while (v10 != 10);
      if (v9 == __s) {
        break;
      }
      char *v9 = 0;
      ++v5;
      if (!(*(unsigned __int16 *)__s ^ 0xA7B | v32))
      {
        int v6 = 1;
        if (v7 && v7 != 3)
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "unexpected '{' at line %d\n");
          goto LABEL_35;
        }
        goto LABEL_3;
      }
      if (!(*(unsigned __int16 *)__s ^ 0xA7D | v32))
      {
        if ((v7 - 3) <= 0xFFFFFFFD)
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "unexpected '}' at line %d\n");
          goto LABEL_35;
        }
        int v6 = 3;
        if (v23)
        {
          v17 = sub_22149A2A4(v23, v24);
          if (v17)
          {
            v17[4] = 0;
            uint64_t v18 = *(void *)(a1 + 8);
            v17[5] = v18;
            v19 = (void *)(v18 + 32);
            if (!*(void *)a1) {
              v19 = (void *)a1;
            }
            void *v19 = v17;
            *(void *)(a1 + 8) = v17;
            ++*(_DWORD *)(a1 + 20);
          }
          sub_22149A930((unsigned int *)&v23);
          int v6 = 3;
        }
        goto LABEL_3;
      }
      bzero(v29, 0x300uLL);
      int v11 = strlen(__s);
      v12 = strchr(__s, 61);
      int v13 = strspn(__s, " \t\n");
      if (v13 != v11)
      {
        if (v12)
        {
          unsigned int v14 = v12 - __s;
          int v15 = v14 - v13;
          if (v14 - v13 >= 0x80)
          {
            int v15 = 127;
            fprintf((FILE *)*MEMORY[0x263EF8348], "property name truncated to %d bytes at line %d\n", 127, v5);
            unsigned int v14 = v12 - __s;
          }
          unsigned int v16 = v11 - v14 - 2;
          if (v16 >= 0x300)
          {
            unsigned int v16 = 767;
            fprintf((FILE *)*MEMORY[0x263EF8348], "value truncated to %d bytes at line %d\n", 767, v5);
          }
          __strncpy_chk();
          v30[v15] = 0;
          __strncpy_chk();
          v29[v16] = 0;
          *((void *)&v27 + 1) = 0;
          uint64_t v28 = 0;
          *(void *)&long long v27 = v30;
          sub_22149AB18((unsigned int *)&v27 + 2, v29, 0);
        }
        else
        {
          unsigned int v20 = ~v13 + v11;
          if (v20 >= 0x80)
          {
            unsigned int v20 = 127;
            fprintf((FILE *)*MEMORY[0x263EF8348], "property name truncated to %d bytes at line %d\n", 127, v5);
          }
          __strncpy_chk();
          v30[v20] = 0;
          *((void *)&v27 + 1) = 0;
          uint64_t v28 = 0;
          *(void *)&long long v27 = v30;
        }
        long long v25 = v27;
        uint64_t v26 = v28;
        sub_22149A7E8((unsigned int *)&v23, (uint64_t)&v25, 0xFFFFFFFFFFFFFFFFLL);
        sub_22149AAAC((void *)&v27 + 1);
        int v6 = 2;
        goto LABEL_3;
      }
    }
    if ((v7 - 1) <= 1) {
      fwrite("file ends prematurely\n", 0x16uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    }
LABEL_35:
    fclose(v4);
  }
  else
  {
    perror(__filename);
  }
  sub_22149A930((unsigned int *)&v23);
  return 1;
}

uint64_t sub_22149A7E8(unsigned int *a1, uint64_t a2, unint64_t a3)
{
  int v6 = (void *)*((void *)a1 + 1);
  unsigned int v7 = *a1 + 1;
  if (v6) {
    int v8 = (char *)malloc_type_realloc(v6, 24 * v7, 0x1090040D67CC068uLL);
  }
  else {
    int v8 = (char *)malloc_type_malloc(24 * v7, 0x1090040D67CC068uLL);
  }
  *((void *)a1 + 1) = v8;
  unint64_t v9 = *a1;
  if (v9 <= a3)
  {
    a3 = *a1;
  }
  else
  {
    uint64_t v10 = 24 * v9;
    do
    {
      uint64_t v11 = *((void *)a1 + 1) + v10;
      --v9;
      *(_OWORD *)uint64_t v11 = *(_OWORD *)(v11 - 24);
      *(void *)(v11 + 16) = *(void *)(v11 - 8);
      v10 -= 24;
    }
    while (v9 > a3);
    int v8 = (char *)*((void *)a1 + 1);
  }
  v12 = (char **)&v8[24 * a3];
  int v13 = *(const char **)a2;
  uint64_t v14 = *(void *)(a2 + 8);
  int v15 = *(const char ***)(a2 + 16);
  unsigned int v16 = strdup(v13);
  uint64_t result = sub_22149AA34(v14, v15);
  char *v12 = v16;
  v12[1] = (char *)result;
  v12[2] = v18;
  ++*a1;
  return result;
}

void sub_22149A8EC(uint64_t a1)
{
  int v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(void *)a1 = 0;
  }

  sub_22149AAAC((void *)(a1 + 8));
}

void sub_22149A930(unsigned int *a1)
{
  int v2 = (void *)*((void *)a1 + 1);
  if (v2)
  {
    if (*a1)
    {
      uint64_t v3 = 0;
      unint64_t v4 = 0;
      do
      {
        sub_22149A8EC(*((void *)a1 + 1) + v3);
        ++v4;
        v3 += 24;
      }
      while (v4 < *a1);
      int v2 = (void *)*((void *)a1 + 1);
    }
    free(v2);
    *(void *)a1 = 0;
    *((void *)a1 + 1) = 0;
  }
}

uint64_t sub_22149A99C(unsigned int a1, uint64_t a2)
{
  uint64_t v3 = a1;
  unint64_t v4 = (char *)malloc_type_malloc(24 * a1, 0x1090040D67CC068uLL);
  if (v3)
  {
    int v5 = v4 + 16;
    int v6 = (const char ***)(a2 + 16);
    uint64_t v7 = v3;
    do
    {
      *(v5 - 2) = strdup((const char *)*(v6 - 2));
      *(v5 - 1) = sub_22149AA34(*(v6 - 1), *v6);
      *int v5 = v8;
      v5 += 3;
      v6 += 3;
      --v7;
    }
    while (v7);
  }
  return v3;
}

uint64_t sub_22149AA34(unsigned int a1, const char **a2)
{
  uint64_t v3 = a1;
  unint64_t v4 = (char **)malloc_type_malloc(8 * a1, 0x10040436913F5uLL);
  if (v3)
  {
    int v5 = v4;
    uint64_t v6 = v3;
    do
    {
      uint64_t v7 = *a2++;
      *v5++ = strdup(v7);
      --v6;
    }
    while (v6);
  }
  return v3;
}

void sub_22149AAAC(void *a1)
{
  int v2 = (void *)a1[1];
  if (v2)
  {
    unint64_t v3 = *(unsigned int *)a1;
    if (v3)
    {
      for (unint64_t i = 0; i < v3; ++i)
      {
        uint64_t v5 = a1[1];
        uint64_t v6 = *(void **)(v5 + 8 * i);
        if (v6)
        {
          free(v6);
          *(void *)(v5 + 8 * i) = 0;
          unint64_t v3 = *(unsigned int *)a1;
        }
      }
      int v2 = (void *)a1[1];
    }
    free(v2);
    *a1 = 0;
    a1[1] = 0;
  }
}

char *sub_22149AB18(unsigned int *a1, const char *a2, unint64_t a3)
{
  uint64_t v6 = (void *)*((void *)a1 + 1);
  if (v6) {
    uint64_t v7 = malloc_type_realloc(v6, 8 * (*a1 + 1), 0x10040436913F5uLL);
  }
  else {
    uint64_t v7 = malloc_type_malloc(8 * (*a1 + 1), 0x10040436913F5uLL);
  }
  uint64_t v8 = v7;
  *((void *)a1 + 1) = v7;
  unint64_t v9 = *a1;
  unint64_t v10 = v9;
  if (v9 > a3)
  {
    unint64_t v11 = *a1;
    do
    {
      *(void *)(*((void *)a1 + 1) + 8 * v11) = *(void *)(*((void *)a1 + 1) + 8 * v11 - 8);
      --v11;
    }
    while (v11 > a3);
    uint64_t v8 = (void *)*((void *)a1 + 1);
    unint64_t v10 = a3;
  }
  uint64_t result = strdup(a2);
  v8[v10] = result;
  *a1 = v9 + 1;
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x270EE4860](allocator, at);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x270F05500](store, key);
}

uint64_t __strncpy_chk()
{
  return MEMORY[0x270ED7EF0]();
}

void bzero(void *a1, size_t a2)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fgetc(FILE *a1)
{
  return MEMORY[0x270ED9950](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void perror(const char *a1)
{
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x270EDB698](__s, __charset);
}