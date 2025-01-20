char *AFCStringCopy(char *a1, size_t __size, char *__src, size_t a4)
{
  size_t v5;

  if (!a4) {
    return (char *)strlcpy(a1, __src, __size);
  }
  if (a4 >= __size) {
    v5 = __size;
  }
  else {
    v5 = a4;
  }
  return strncpy(a1, __src, v5);
}

uint64_t AFCValidateHeader(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*a1 == 0x434641364C504141)
  {
    AFCLog(5, "Swapped packet\n");
    unint64_t v9 = bswap64(a1[2]);
    a1[1] = bswap64(a1[1]);
    a1[2] = v9;
    a1[4] = bswap64(a1[4]);
  }
  else
  {
    if (*a1 != 0x4141504C36414643) {
      return __AFCSetErrorResult(1, a2, 3892330498, a4, 116, "Bad packet signature 0x%qx", a7, a8, *a1);
    }
    unint64_t v9 = a1[2];
  }
  if (v9 < 0x28) {
    return __AFCSetErrorResult(1, a2, 3892330498, a4, 121, "Header length 0x%qx too small or exceeds packet length", a7, a8, v9);
  }
  unint64_t v10 = a1[1];
  if (v9 > v10) {
    return __AFCSetErrorResult(1, a2, 3892330498, a4, 121, "Header length 0x%qx too small or exceeds packet length", a7, a8, v9);
  }
  if (HIDWORD(v10)) {
    return __AFCSetErrorResult(1, a2, 3892330498, a4, 126, "Implausible packet length 0x%qx", a7, a8, a1[1]);
  }
  if (HIDWORD(a1[4])) {
    return __AFCSetErrorResult(1, a2, 3892330498, a4, 130, "Implausible packet type 0x%qx", a7, a8, a1[4]);
  }
  return 0;
}

uint64_t __AFCSetErrorResult(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, const char *a6, uint64_t a7, uint64_t a8, char a9)
{
  return AFCSetErrorInfoWithArgs(a1, 0xFFFFFFFFLL, a3, "/Library/Caches/com.apple.xbs/Sources/AppleFileConduit/afc.c", a5, a6, &a9);
}

uint64_t AFCSwapHeader(void *a1)
{
  if (*a1 != 0x434641364C504141) {
    return 0;
  }
  uint64_t result = 3892330502;
  uint64_t v3 = __gAFCHeaderSwapInfo;
  if (__gAFCHeaderSwapInfo)
  {
    v4 = &__gAFCHeaderSwapInfo;
    while (v3 != a1[4])
    {
      uint64_t v5 = v4[9];
      v4 += 9;
      uint64_t v3 = v5;
      if (!v5) {
        return result;
      }
    }
    uint64_t v6 = 1;
    uint64_t result = 3892330497;
    do
    {
      unint64_t v7 = v4[v6];
      if (!v7) {
        break;
      }
      if (v7 > a1[2] - 8) {
        return result;
      }
      *(void *)((char *)a1 + (v7 & 0xFFFFFFFFFFFFFFF8)) = bswap64(*(void *)((char *)a1
                                                                                + (v7 & 0xFFFFFFFFFFFFFFF8)));
      ++v6;
    }
    while (v6 != 9);
    return 0;
  }
  return result;
}

void *AFCHeaderInit(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *uint64_t result = 0x4141504C36414643;
  result[1] = a4 + a3;
  result[2] = a3;
  result[4] = a2;
  if (a5) {
    uint64_t v5 = *(void *)(a5 + 24);
  }
  else {
    uint64_t v5 = -1;
  }
  result[3] = v5;
  return result;
}

void AFCLogPacketInfo(int a1, const char *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a3 + 32);
  if ((unint64_t)(v5 - 1) > 0x27) {
    uint64_t v6 = "Unknown";
  }
  else {
    uint64_t v6 = gAFCPacketTypeNames[v5];
  }
  snprintf(__str, 0x200uLL, "%s: PacketType=%d PacketName=%s HeaderLength=%d PacketLength=%d PacketID=%d", a2, v5, v6, *(void *)(a3 + 16), *(void *)(a3 + 8), *(void *)(a3 + 24));
  switch(*(void *)(a3 + 32))
  {
    case 1:
      CFStringRef v7 = AFCCopyErrorString(*(unsigned int *)(a3 + 40));
      if (v7)
      {
        CFStringRef v8 = v7;
        CFStringGetCString(v7, buffer, 128, 0x8000100u);
        AFCLog(a1, "%s Status=0x%x StatusName=\"%s\"\n", __str, *(void *)(a3 + 40), buffer);
        CFRelease(v8);
      }
      else
      {
        strcpy(buffer, "Unknown");
        AFCLog(a1, "%s Status=0x%x StatusName=\"%s\"\n");
      }
      break;
    case 3:
    case 4:
    case 5:
    case 6:
    case 8:
    case 9:
    case 0xALL:
    case 0xCLL:
    case 0xDLL:
    case 0x18:
    case 0x1CLL:
    case 0x1DLL:
    case 0x1ELL:
      AFCLog(a1, "%s Path=\"%s\"\n");
      break;
    case 7:
      AFCLog(a1, "PacketID=%d Path=\"%s\"\n");
      break;
    case 0xELL:
      AFCLog(a1, "%s FileRef=%d\n");
      break;
    case 0x1FLL:
      AFCLog(a1, "%s RangeStart=%lli RangeLength=%lli Path=\"%s\"\n");
      break;
    default:
      AFCLog(a1, "%s\n");
      break;
  }
}

uint64_t AFCErrnoToAFCDomainError(uint64_t result, uint64_t a2)
{
  if ((result & 0x80000000) != 0) {
    return a2;
  }
  if ((int)result > 59)
  {
    if ((int)result > 79)
    {
      if ((result - 80) < 2) {
        return 3892330506;
      }
    }
    else
    {
      switch(result)
      {
        case '<':
          return 3892330508;
        case '?':
          return 3892330503;
        case 'M':
          return 3892330499;
      }
    }
    return a2;
  }
  switch((int)result)
  {
    case 0:
      return result;
    case 1:
    case 13:
      return 3892330506;
    case 2:
    case 3:
      return 3892330504;
    case 4:
      return 3892330517;
    case 5:
      return 3892330516;
    case 6:
    case 8:
    case 10:
    case 11:
    case 14:
    case 15:
    case 18:
    case 19:
    case 20:
    case 25:
    case 26:
    case 29:
    case 30:
    case 32:
    case 33:
    case 34:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
      return a2;
    case 7:
    case 12:
    case 23:
    case 24:
    case 27:
    case 31:
      return 3892330499;
    case 9:
      goto LABEL_15;
    case 16:
      return 3892330513;
    case 17:
      return 3892330512;
    case 21:
      return 3892330505;
    case 22:
      return 3892330503;
    case 28:
      return 3892330514;
    case 35:
      return 3892330515;
    case 36:
      return 3892330518;
    case 45:
      return 3892330511;
    default:
      if (result != 57) {
        return a2;
      }
LABEL_15:
      uint64_t result = 3892330507;
      break;
  }
  return result;
}

uint64_t AFCReadPacketHeader(uint64_t a1, uint64_t a2, unint64_t a3, void *a4)
{
  CFAllocatorRef v8 = CFGetAllocator((CFTypeRef)a1);
  if (*(unsigned char *)(a1 + 68)) {
    return *(unsigned int *)(a1 + 64);
  }
  CFAllocatorRef v15 = v8;
  if (a2 && a4)
  {
    if (a3 <= 0x27)
    {
      v35 = "Static buffer too small";
      LODWORD(v26) = 0;
      uint64_t v36 = 3892330503;
      int v37 = 499;
    }
    else
    {
      uint64_t v16 = AFCReadData(a1, (char *)a2, 0x28uLL);
      if (v16 || (uint64_t v16 = AFCValidateHeader((void *)a2, v17, v18, v19, v20, v21, v22, v23), v16))
      {
        uint64_t v13 = v16;
LABEL_26:
        *a4 = 0;
        return v13;
      }
      uint64_t v24 = *(void *)(a2 + 16);
      unint64_t v25 = v24 + 1;
      if (v24 == -1)
      {
        uint64_t v36 = 3892330498;
        v35 = "Packet Size Rollover";
        LODWORD(v26) = 0;
        int v37 = 512;
      }
      else
      {
        if (v25 <= a3)
        {
          v27 = 0;
          uint64_t v28 = *(void *)(a2 + 16);
          goto LABEL_16;
        }
        v26 = CFAllocatorAllocate(v15, v24 + 1, 0);
        if (v26)
        {
          v27 = v26;
          AFCLog(5, "Allocated %llu bytes\n", v25);
          uint64_t v28 = *(void *)(a2 + 16);
          if (v27 != (void *)a2)
          {
            long long v29 = *(_OWORD *)a2;
            long long v30 = *(_OWORD *)(a2 + 16);
            v27[4] = *(void *)(a2 + 32);
            *(_OWORD *)v27 = v29;
            *((_OWORD *)v27 + 1) = v30;
            uint64_t v24 = *(void *)(a2 + 16);
            uint64_t v31 = (uint64_t)v27;
LABEL_17:
            *(unsigned char *)(v31 + v24) = 0;
            size_t v32 = v28 - 40;
            if (v28 != 40
              && (AFCLog(5, "Expecting %u bytes\n", v28 - 40),
                  uint64_t v33 = AFCReadData(a1, (char *)(v31 + 40), v32),
                  v33))
            {
              uint64_t v13 = v33;
            }
            else
            {
              AFCSwapHeader((void *)v31);
              uint64_t v13 = 0;
              *a4 = v27;
            }
            AFCLogPacketInfo(4, "AFCReadPacketHeader", v31);
            char v34 = 0;
            if (!v13) {
              return v13;
            }
            goto LABEL_21;
          }
          v27 = 0;
          uint64_t v24 = *(void *)(a2 + 16);
LABEL_16:
          uint64_t v31 = a2;
          goto LABEL_17;
        }
        uint64_t v36 = 3892330499;
        v35 = "CFAllocatorAllocate";
        int v37 = 518;
      }
    }
  }
  else
  {
    v35 = "NULL buffer";
    LODWORD(v26) = 0;
    uint64_t v36 = 3892330503;
    int v37 = 498;
  }
  uint64_t v13 = __AFCSetErrorResult((int)v26, v9, v36, v10, v37, v35, v11, v12, v38);
  uint64_t v31 = 0;
  char v34 = 1;
  if (!v13) {
    return v13;
  }
LABEL_21:
  if (v31 == a2) {
    char v34 = 1;
  }
  if ((v34 & 1) == 0) {
    CFAllocatorDeallocate(v15, (void *)v31);
  }
  if (a4) {
    goto LABEL_26;
  }
  return v13;
}

uint64_t AFCReadPacketBody(unsigned char *cf, uint64_t a2, char **a3, size_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (cf[68]) {
    return *((unsigned int *)cf + 16);
  }
  uint64_t v13 = *(void *)(a2 + 8);
  uint64_t v14 = *(void *)(a2 + 16);
  size_t v15 = v13 - v14;
  if (v13 == v14)
  {
    uint64_t v16 = 0;
LABEL_7:
    uint64_t result = 0;
    *a3 = v16;
    *a4 = v15;
    return result;
  }
  CFAllocatorRef v17 = CFGetAllocator(cf);
  uint64_t v18 = (char *)CFAllocatorAllocate(v17, v15, 0);
  if (v18)
  {
    uint64_t v16 = v18;
    uint64_t v23 = AFCReadData((uint64_t)cf, v18, v15);
    if (!v23) {
      goto LABEL_7;
    }
    uint64_t v24 = v23;
    CFAllocatorRef v25 = CFGetAllocator(cf);
    CFAllocatorDeallocate(v25, v16);
    return v24;
  }
  else
  {
    return __AFCSetErrorResult(0, v19, 3892330499, v20, 590, "CFAllocatorAllocate", v21, v22, a9);
  }
}

uint64_t AFCSendHeader(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 68)) {
    return *(unsigned int *)(a1 + 64);
  }
  AFCLogPacketInfo(4, "AFCSendHeader", a2);
  return AFCSendData(a1, (char *)a2, *(void *)(a2 + 16));
}

uint64_t AFCSendPacket(uint64_t a1, uint64_t a2, void *a3, size_t a4)
{
  uint64_t v8 = 3892330503;
  uint64_t v9 = *(void *)(a2 + 16);
  AFCLockLock(*(void *)(a1 + 144));
  if (*(_DWORD *)(a1 + 16) == 1)
  {
    if (a3 || !a4)
    {
      if (v9 + a4 <= 0x2000 && (uint64_t v10 = (char *)malloc_type_malloc(0x2000uLL, 0xAEE7660CuLL)) != 0)
      {
        uint64_t v11 = v10;
        __memcpy_chk();
        memcpy(&v11[v9], a3, a4);
        AFCLogPacketInfo(4, "AFCSendHeader", a2);
        uint64_t v8 = AFCSendData(a1, v11, v9 + a4);
        free(v11);
      }
      else
      {
        uint64_t v12 = AFCSendHeader(a1, a2);
        if (!v12) {
          uint64_t v12 = AFCSendData(a1, (char *)a3, a4);
        }
        uint64_t v8 = v12;
      }
    }
  }
  else
  {
    uint64_t v8 = 3892330507;
  }
  AFCLockUnlock(*(void *)(a1 + 144));
  return v8;
}

CFMutableDataRef __AFCCreateAFCDataWithDictionary(const __CFDictionary *a1)
{
  CFMutableDataRef Mutable = CFDataCreateMutable(0, 0);
  if (Mutable) {
    CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)__ConvertDictEntry, Mutable);
  }
  return Mutable;
}

BOOL __ConvertDictEntry(BOOL result, __CFString *a2, __CFData *a3)
{
  if (result)
  {
    if (a2)
    {
      uint64_t result = __AppendValue((__CFString *)result, a3);
      if (result)
      {
        return __AppendValue(a2, a3);
      }
    }
  }
  return result;
}

uint64_t AFCSendStatusExtended(uint64_t a1, uint64_t a2, int a3, const __CFDictionary *a4)
{
  CFDictionaryRef v4 = a4;
  AFCLog(5, "Writing status packet %d info %p\n", a3, a4);
  if (a3 && (a3 + 402636777) <= 0xFFFFFFEA) {
    AFCLog(5, "Oh no!");
  }
  if (*(unsigned char *)(a1 + 68)) {
    return *(unsigned int *)(a1 + 64);
  }
  if (!v4) {
    goto LABEL_8;
  }
  if ((*(unsigned char *)(a1 + 128) & 1) == 0)
  {
    CFDictionaryRef v4 = 0;
LABEL_8:
    CFIndex v8 = 48;
    goto LABEL_10;
  }
  CFDictionaryRef v4 = __AFCCreateAFCDataWithDictionary(v4);
  CFIndex v8 = CFDataGetLength(v4) + 48;
LABEL_10:
  v15[0] = 0x4141504C36414643;
  v15[1] = v8;
  v15[2] = 48;
  v15[4] = 1;
  if (a2) {
    uint64_t v9 = *(void *)(a2 + 24);
  }
  else {
    uint64_t v9 = -1;
  }
  v15[3] = v9;
  v15[5] = a3 & 0x1FFF;
  uint64_t v10 = AFCSendHeader(a1, (uint64_t)v15);
  if (v10)
  {
    uint64_t v13 = v10;
    if (!v4) {
      return v13;
    }
  }
  else
  {
    if (!v4) {
      return 0;
    }
    BytePtr = (char *)CFDataGetBytePtr(v4);
    CFIndex Length = CFDataGetLength(v4);
    uint64_t v13 = AFCSendData(a1, BytePtr, Length);
  }
  CFRelease(v4);
  return v13;
}

uint64_t AFCSendStatus(uint64_t a1, uint64_t a2, int a3)
{
  CFDictionaryRef ErrorInfo = (const __CFDictionary *)AFCCopyAndClearLastErrorInfo();
  uint64_t v7 = AFCSendStatusExtended(a1, a2, a3, ErrorInfo);
  if (ErrorInfo) {
    CFRelease(ErrorInfo);
  }
  return v7;
}

uint64_t AFCSendDataPacket(uint64_t a1, uint64_t a2, char *a3, unint64_t a4)
{
  AFCLog(5, "Writing data packet with data length %u\n", a4);
  if (*(unsigned char *)(a1 + 68)) {
    return *(unsigned int *)(a1 + 64);
  }
  v10[0] = 0x4141504C36414643;
  v10[1] = a4 + 40;
  v10[2] = 40;
  v10[4] = 2;
  if (a2) {
    uint64_t v9 = *(void *)(a2 + 24);
  }
  else {
    uint64_t v9 = -1;
  }
  v10[3] = v9;
  uint64_t result = AFCSendHeader(a1, (uint64_t)v10);
  if (!result) {
    return AFCSendData(a1, a3, a4);
  }
  return result;
}

uint64_t AFCDiscardData(uint64_t a1, size_t a2)
{
  size_t v2 = a2;
  uint64_t v18 = *MEMORY[0x263EF8340];
  AFCLog(5, "Discard data length %u\n", a2);
  if (*(unsigned char *)(a1 + 68)) {
    return *(unsigned int *)(a1 + 64);
  }
  if (!v2) {
    return 0;
  }
  if (v2 <= 0x40)
  {
    uint64_t v4 = AFCReadData(a1, v17, v2);
    if (!v4) {
      return v4;
    }
LABEL_20:
    size_t v15 = __error();
    AFCLog(2, "Error %d discarding data\n", *v15);
    AFCConnectionSetFatalError(a1, v4);
    return v4;
  }
  uint64_t v6 = (char *)CFAllocatorAllocate(0, *(void *)(a1 + 96), 0);
  if (!v6)
  {
    uint64_t v4 = 3892330499;
    __AFCSetErrorResult(0, v7, 3892330499, v8, 989, "CFAllocatorAllocate", v9, v10, v16);
    return v4;
  }
  uint64_t v11 = v6;
  do
  {
    if (v2 >= *(void *)(a1 + 96)) {
      size_t v12 = *(void *)(a1 + 96);
    }
    else {
      size_t v12 = v2;
    }
    uint64_t v13 = AFCReadData(a1, v11, v12);
    v2 -= v12;
    if (v13) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = v2 == 0;
    }
  }
  while (!v14);
  uint64_t v4 = v13;
  CFAllocatorDeallocate(0, v11);
  if (v4) {
    goto LABEL_20;
  }
  return v4;
}

uint64_t AFCDiscardBodyData(uint64_t a1, uint64_t a2)
{
  return AFCDiscardData(a1, *(void *)(a2 + 8) - *(void *)(a2 + 16));
}

BOOL __AppendValue(__CFString *a1, __CFData *a2)
{
  uint64_t v3 = a1;
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 != CFStringGetTypeID())
  {
    if (v4 == CFNumberGetTypeID())
    {
      if (CFNumberIsFloatType((CFNumberRef)v3))
      {
        uint64_t valuePtr = 0;
        if (!CFNumberGetValue((CFNumberRef)v3, kCFNumberDoubleType, &valuePtr)) {
          return 0;
        }
        CFStringRef v5 = CFStringCreateWithFormat(0, 0, @"%g", valuePtr);
      }
      else
      {
        uint64_t valuePtr = 0;
        if (!CFNumberGetValue((CFNumberRef)v3, kCFNumberSInt64Type, &valuePtr)) {
          return 0;
        }
        CFStringRef v5 = CFStringCreateWithFormat(0, 0, @"%qi", valuePtr);
      }
    }
    else
    {
      if (v4 == CFBooleanGetTypeID())
      {
        if ((__CFString *)*MEMORY[0x263EFFB40] == v3) {
          uint64_t v3 = @"1";
        }
        else {
          uint64_t v3 = @"0";
        }
        goto LABEL_16;
      }
      CFStringRef v5 = CFCopyDescription(v3);
    }
    uint64_t v3 = (__CFString *)v5;
    if (v5) {
      goto LABEL_16;
    }
    return 0;
  }
  CFRetain(v3);
  if (!v3) {
    return 0;
  }
LABEL_16:
  CFIndex v6 = 9 * CFStringGetLength(v3);
  uint64_t v7 = (UInt8 *)CFAllocatorAllocate(0, v6 + 1, 0);
  if (!v7)
  {
    BOOL v11 = 0;
    if (!v3) {
      return v11;
    }
    goto LABEL_20;
  }
  uint64_t v8 = v7;
  CFIndex usedBufLen = 0;
  CFIndex Length = CFStringGetLength(v3);
  v17.location = 0;
  v17.length = Length;
  CFIndex Bytes = CFStringGetBytes(v3, v17, 0x8000100u, 0, 0, v8, v6, &usedBufLen);
  BOOL v11 = Length == Bytes;
  if (Length == Bytes)
  {
    CFIndex v12 = usedBufLen++;
    CFIndex v13 = usedBufLen;
    v8[v12] = 0;
    CFDataAppendBytes(a2, v8, v13);
  }
  CFAllocatorDeallocate(0, v8);
  if (v3) {
LABEL_20:
  }
    CFRelease(v3);
  return v11;
}

void *AFCIteratorCreate(const __CFAllocator *a1, const void *a2)
{
  pthread_once(&AFCIteratorGetTypeID_typeIDInit, (void (*)(void))__AFCIteratorRegisterClass);
  uint64_t Instance = _CFRuntimeCreateInstance();
  CFStringRef v5 = (void *)Instance;
  if (a2 && Instance)
  {
    *(_OWORD *)(Instance + 16) = 0u;
    CFIndex v6 = (void *)(Instance + 16);
    *(void *)(Instance + 48) = 0;
    *(_OWORD *)(Instance + 32) = 0u;
    CFTypeID v7 = CFGetTypeID(a2);
    if (v7 == CFDictionaryGetTypeID())
    {
      CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)a2);
      if (Count)
      {
        CFIndex v9 = Count;
        uint64_t v10 = (const void **)CFAllocatorAllocate(0, 8 * Count, 0);
        if (!v10) {
          goto LABEL_15;
        }
        BOOL v11 = v10;
        CFDictionaryGetKeysAndValues((CFDictionaryRef)a2, v10, 0);
        v5[3] = CFArrayCreate(a1, v11, v9, MEMORY[0x263EFFF70]);
        CFAllocatorDeallocate(0, v11);
        CFArrayRef v12 = (CFArrayRef)v5[3];
      }
      else
      {
        CFArrayRef v12 = CFArrayCreate(a1, 0, 0, 0);
        v5[3] = v12;
      }
      if (v12) {
        goto LABEL_11;
      }
    }
    else
    {
      CFTypeID v13 = CFGetTypeID(a2);
      if (v13 == CFArrayGetTypeID())
      {
        CFIndex v6 = v5 + 3;
LABEL_11:
        *CFIndex v6 = a2;
        CFRetain(a2);
        CFMutableDataRef Mutable = CFDataCreateMutable(a1, 0);
        v5[5] = Mutable;
        if (Mutable)
        {
          CFMutableDataRef v15 = CFDataCreateMutable(a1, 0);
          v5[6] = v15;
          if (v15) {
            return v5;
          }
        }
      }
    }
LABEL_15:
    char v16 = (const void *)v5[3];
    if (v16) {
      CFRelease(v16);
    }
    CFRange v17 = (const void *)v5[2];
    if (v17) {
      CFRelease(v17);
    }
    CFRelease(v5);
    goto LABEL_20;
  }
  if (Instance) {
    goto LABEL_15;
  }
LABEL_20:
  if (a2) {
    CFRelease(a2);
  }
  return 0;
}

const void *AFCIteratorNext(uint64_t a1)
{
  CFIndex v2 = *(void *)(a1 + 32);
  if (v2 >= CFArrayGetCount(*(CFArrayRef *)(a1 + 24))) {
    return 0;
  }
  CFArrayRef v3 = *(const __CFArray **)(a1 + 24);
  CFIndex v4 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v4 + 1;

  return CFArrayGetValueAtIndex(v3, v4);
}

uint64_t AFCIteratorGetObject(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 16);
  if (!result) {
    return *(void *)(a1 + 24);
  }
  return result;
}

const UInt8 *AFCIteratorGetKeyBuffer(uint64_t a1, CFIndex a2)
{
  if (CFDataGetLength(*(CFDataRef *)(a1 + 40)) < a2) {
    CFDataSetLength(*(CFMutableDataRef *)(a1 + 40), a2);
  }
  CFDataRef v4 = *(const __CFData **)(a1 + 40);

  return CFDataGetBytePtr(v4);
}

const UInt8 *AFCIteratorGetValueBuffer(uint64_t a1, CFIndex a2)
{
  if (CFDataGetLength(*(CFDataRef *)(a1 + 48)) < a2) {
    CFDataSetLength(*(CFMutableDataRef *)(a1 + 48), a2);
  }
  CFDataRef v4 = *(const __CFData **)(a1 + 48);

  return CFDataGetBytePtr(v4);
}

const char *AFCGetClientVersionString()
{
  return "@(#)PROGRAM:afc  PROJECT:afc-279\n";
}

uint64_t __AFCIteratorRegisterClass()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __gAFCIteratorTypeID = result;
  return result;
}

void __AFCIteratorFinalize(void *a1)
{
  CFIndex v2 = (const void *)a1[2];
  if (v2) {
    CFRelease(v2);
  }
  CFArrayRef v3 = (const void *)a1[3];
  if (v3) {
    CFRelease(v3);
  }
  CFDataRef v4 = (const void *)a1[5];
  if (v4) {
    CFRelease(v4);
  }
  CFStringRef v5 = (const void *)a1[6];
  if (v5) {
    CFRelease(v5);
  }
  a1[4] = 0;
}

__CFString *__AFCIteratorCopyDescription(void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  CFMutableDataRef Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, @"<AFCIterator %p [%p]> {\n", a1, v2);
  CFStringAppendFormat(Mutable, 0, @"  Dictionary: %@\n", a1[2]);
  CFStringAppendFormat(Mutable, 0, @"  Array: %@\n", a1[3]);
  CFStringAppendFormat(Mutable, 0, @"  Index: %ld\n", a1[4]);
  CFStringAppendFormat(Mutable, 0, @"}");
  return Mutable;
}

CFStringRef AFCCopyErrorString(uint64_t a1)
{
  if (a1)
  {
    v1 = (const __CFString **)&off_26458C698;
    while (1)
    {
      CFStringRef v2 = *v1;
      if (!*v1) {
        break;
      }
      int v3 = *((_DWORD *)v1 - 2);
      v1 += 2;
      if (v3 == a1) {
        goto LABEL_7;
      }
    }
    CFStringRef v5 = CFStringCreateWithFormat(0, 0, @"Error 0x%x", a1);
    CFRelease(@"Error 0x%x");
    return v5;
  }
  else
  {
    CFStringRef v2 = @"Success";
LABEL_7:
    return CFStringCreateCopy(0, v2);
  }
}

CFDictionaryRef __AFCCreateErrorObject(const __CFAllocator *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  *(_OWORD *)keys = xmmword_26458C810;
  long long v15 = *(_OWORD *)off_26458C820;
  uint64_t valuePtr = (int)a2;
  values = @"AFCErrorDomain";
  CFTypeRef cf = CFNumberCreate(a1, kCFNumberLongType, &valuePtr);
  CFTypeRef v12 = AFCCopyErrorString(a2);
  uint64_t v13 = a3;
  if (a3) {
    CFIndex v6 = 4;
  }
  else {
    CFIndex v6 = 3;
  }
  CFDictionaryRef v7 = CFDictionaryCreate(a1, (const void **)keys, (const void **)&values, v6, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFRelease(cf);
  CFRelease(v12);
  return v7;
}

CFStringRef AFCCopyPacketTypeString(uint64_t a1)
{
  if (a1 == 1)
  {
    CFStringRef v1 = @"Status";
LABEL_6:
    MainBundle = CFBundleGetMainBundle();
    return CFBundleCopyLocalizedString(MainBundle, v1, v1, @"AFCError");
  }
  else
  {
    int v3 = (const __CFString **)&off_26458C850;
    while (1)
    {
      CFStringRef v1 = *v3;
      if (!*v3) {
        break;
      }
      uint64_t v4 = (uint64_t)*(v3 - 1);
      v3 += 3;
      if (v4 == a1) {
        goto LABEL_6;
      }
    }
    CFDictionaryRef v7 = CFBundleGetMainBundle();
    CFStringRef v8 = CFBundleCopyLocalizedString(v7, @"Packet Type %qu", @"Packet Type %qu", @"AFCError");
    CFStringRef v9 = CFStringCreateWithFormat(0, 0, v8, a1);
    CFRelease(v8);
    return v9;
  }
}

uint64_t AFCOperationGetTypeID()
{
  return __gAFCOperationTypeID;
}

uint64_t __AFCOperationRegisterClass()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __gAFCOperationTypeID = result;
  return result;
}

uint64_t AFCOperationCreate(const __CFAllocator *a1, CFIndex *a2, const void *a3, uint64_t a4, const void *a5, uint64_t a6)
{
  pthread_once(&AFCOperationGetTypeID_typeIDInit, (void (*)(void))__AFCOperationRegisterClass);
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v13 = Instance;
  if (Instance)
  {
    if (a2)
    {
      size_t v14 = a2[2];
      *(void *)(Instance + 256) = 0;
      *(_OWORD *)(Instance + 224) = 0u;
      *(_OWORD *)(Instance + 240) = 0u;
      *(_OWORD *)(Instance + 192) = 0u;
      *(_OWORD *)(Instance + 208) = 0u;
      *(_OWORD *)(Instance + 160) = 0u;
      *(_OWORD *)(Instance + 176) = 0u;
      *(_OWORD *)(Instance + 128) = 0u;
      *(_OWORD *)(Instance + 144) = 0u;
      *(_OWORD *)(Instance + 96) = 0u;
      *(_OWORD *)(Instance + 112) = 0u;
      *(_OWORD *)(Instance + 64) = 0u;
      *(_OWORD *)(Instance + 80) = 0u;
      *(_OWORD *)(Instance + 32) = 0u;
      *(_OWORD *)(Instance + 48) = 0u;
      *(_OWORD *)(Instance + 16) = 0u;
      if (v14 > 0x80)
      {
        long long v15 = CFAllocatorAllocate(a1, a2[2], 0);
        *(void *)(v13 + 88) = v15;
        CFAllocatorRef v16 = a1;
        uint64_t v17 = v14;
        if (!v15) {
          goto LABEL_14;
        }
      }
      else
      {
        long long v15 = (void *)(Instance + 112);
        *(void *)(v13 + 88) = v13 + 112;
        CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x263EFFB28];
        uint64_t v17 = 128;
      }
      *(void *)(v13 + 96) = v16;
      *(void *)(v13 + 104) = v17;
      memcpy(v15, a2, v14);
      *(void *)(v13 + 48) = a2[4];
      if (a3) {
        CFRetain(a3);
      }
      *(void *)(v13 + 64) = a3;
      *(void *)(v13 + 72) = a4;
      if (a5) {
        CFRetain(a5);
      }
      *(void *)(v13 + 80) = a5;
      uint64_t v18 = AFCConditionCreate();
      *(void *)(v13 + 256) = v18;
      if (v18)
      {
        *(void *)(v13 + 16) = a6;
        *(_DWORD *)(v13 + 24) = 1;
        uint64_t v19 = AFCLockCreate();
        *(void *)(v13 + 248) = v19;
        if (v19) {
          goto LABEL_12;
        }
      }
    }
LABEL_14:
    AFCLog(5, "AFCOperationCreate %p failed", (const void *)v13);
    CFRelease((CFTypeRef)v13);
    return 0;
  }
LABEL_12:
  AFCLog(5, "%s(%p)\n", "AFCOperationCreate", (const void *)v13);
  return v13;
}

uint64_t AFCOperationGetResultObject(uint64_t a1)
{
  return *(void *)(a1 + 240);
}

uint64_t AFCOperationGetState(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t AFCOperationGetResultStatus(uint64_t a1)
{
  AFCLockLock(*(void *)(a1 + 248));
  if (*(_DWORD *)(a1 + 24) == 5) {
    uint64_t v2 = *(unsigned int *)(a1 + 40);
  }
  else {
    uint64_t v2 = 3892330518;
  }
  AFCLockUnlock(*(void *)(a1 + 248));
  return v2;
}

uint64_t AFCOperationGetContext(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t AFCOperationSetContext(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16) = a2;
  return result;
}

uint64_t __AFCOperationGetDataLength(uint64_t a1)
{
  AFCLockLock(*(void *)(a1 + 248));
  uint64_t v2 = *(void *)(*(void *)(a1 + 88) + 8) - *(void *)(*(void *)(a1 + 88) + 16);
  AFCLockUnlock(*(void *)(a1 + 248));
  return v2;
}

uint64_t __AFCOperationSetClientErrorWithInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFAllocatorRef v6 = CFGetAllocator((CFTypeRef)a1);
  CFDictionaryRef v7 = __AFCCreateErrorObject(v6, a2, a3);
  if (!v7) {
    CFDictionaryRef v7 = (void *)CFRetain((CFTypeRef)*MEMORY[0x263EFFD08]);
  }
  AFCLockLock(*(void *)(a1 + 248));
  *(_DWORD *)(a1 + 24) = 5;
  *(_DWORD *)(a1 + 40) = a2;
  *(void *)(a1 + 240) = v7;
  uint64_t v8 = *(void *)(a1 + 248);

  return AFCLockUnlock(v8);
}

uint64_t __AFCOperationSetClientError(uint64_t a1, uint64_t a2, const char *a3, int a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFTypeRef v12 = 0;
  uint64_t v10 = AFCErrorInfoCreateWithArgs(&v12, 0xFFFFFFFFLL, a2, a3, a4, a5, &a9);
  return __AFCOperationSetClientErrorWithInfo(a1, v10, (uint64_t)v12);
}

CFDictionaryRef AFCOperationCreatePacketHeaderDictionary(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[11];
  CFAllocatorRef v3 = CFGetAllocator(a1);
  *(_OWORD *)keys = xmmword_26458CC08;
  long long v10 = *(_OWORD *)&off_26458CC18;
  long long v11 = xmmword_26458CC28;
  AFCLockLock(a1[31]);
  v8[0] = CFNumberCreate(v3, kCFNumberSInt64Type, (const void *)v2);
  v8[1] = CFNumberCreate(v3, kCFNumberSInt64Type, (const void *)(v2 + 8));
  v8[2] = CFNumberCreate(v3, kCFNumberSInt64Type, (const void *)(v2 + 16));
  v8[3] = CFNumberCreate(v3, kCFNumberSInt64Type, (const void *)(v2 + 24));
  v8[4] = CFNumberCreate(v3, kCFNumberSInt64Type, (const void *)(v2 + 32));
  v8[5] = CFDataCreate(v3, (const UInt8 *)v2, *(void *)(v2 + 16));
  AFCLockUnlock(a1[31]);
  CFAllocatorRef v4 = CFGetAllocator(a1);
  CFDictionaryRef v5 = CFDictionaryCreate(v4, (const void **)keys, v8, 6, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  for (uint64_t i = 0; i != 6; ++i)
    CFRelease(v8[i]);
  return v5;
}

CFDataRef AFCOperationCopyPacketData(void *a1)
{
  AFCLockLock(a1[31]);
  CFAllocatorRef v2 = CFGetAllocator(a1);
  CFAllocatorRef v3 = (const UInt8 *)a1[9];
  AFCLockLock(a1[31]);
  CFIndex v4 = *(void *)(a1[11] + 8) - *(void *)(a1[11] + 16);
  AFCLockUnlock(a1[31]);
  CFDataRef v5 = CFDataCreate(v2, v3, v4);
  AFCLockUnlock(a1[31]);
  return v5;
}

uint64_t AFCFileDescriptorGetTypeID()
{
  return __gAFCFileDescriptorTypeID;
}

uint64_t __AFCFileDescriptorRegisterClass()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __gAFCFileDescriptorTypeID = result;
  return result;
}

uint64_t AFCFileDescriptorCreate(uint64_t a1, const void *a2, uint64_t a3)
{
  pthread_once(&AFCFileDescriptorGetTypeID_typeIDInit, (void (*)(void))__AFCFileDescriptorRegisterClass);
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    CFRetain(a2);
    *(void *)(Instance + 16) = a2;
    *(void *)(Instance + 24) = a3;
    *(_DWORD *)(Instance + 32) = 1;
    __AFCConnectionAddFileDescriptor((uint64_t)a2, (const void *)Instance);
    *(_OWORD *)(Instance + 36) = 0u;
    *(_OWORD *)(Instance + 516) = 0u;
    *(_OWORD *)(Instance + 532) = 0u;
    *(_OWORD *)(Instance + 484) = 0u;
    *(_OWORD *)(Instance + 500) = 0u;
    *(_OWORD *)(Instance + 452) = 0u;
    *(_OWORD *)(Instance + 468) = 0u;
    *(_OWORD *)(Instance + 420) = 0u;
    *(_OWORD *)(Instance + 436) = 0u;
    *(_OWORD *)(Instance + 388) = 0u;
    *(_OWORD *)(Instance + 404) = 0u;
    *(_OWORD *)(Instance + 356) = 0u;
    *(_OWORD *)(Instance + 372) = 0u;
    *(_OWORD *)(Instance + 324) = 0u;
    *(_OWORD *)(Instance + 340) = 0u;
    *(_OWORD *)(Instance + 292) = 0u;
    *(_OWORD *)(Instance + 308) = 0u;
    *(_OWORD *)(Instance + 260) = 0u;
    *(_OWORD *)(Instance + 276) = 0u;
    *(_OWORD *)(Instance + 228) = 0u;
    *(_OWORD *)(Instance + 244) = 0u;
    *(_OWORD *)(Instance + 196) = 0u;
    *(_OWORD *)(Instance + 212) = 0u;
    *(_OWORD *)(Instance + 164) = 0u;
    *(_OWORD *)(Instance + 180) = 0u;
    *(_OWORD *)(Instance + 132) = 0u;
    *(_OWORD *)(Instance + 148) = 0u;
    *(_OWORD *)(Instance + 100) = 0u;
    *(_OWORD *)(Instance + 116) = 0u;
    *(_OWORD *)(Instance + 68) = 0u;
    *(_OWORD *)(Instance + 84) = 0u;
    *(_OWORD *)(Instance + 52) = 0u;
  }
  return Instance;
}

uint64_t AFCFileDescriptorSetRemoteName(uint64_t a1, char *__src)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  AFCStringCopy((char *)(a1 + 36), 0x200uLL, __src, 0);
  return 0;
}

uint64_t AFCFileDescriptorGetRemoteName(uint64_t a1)
{
  return a1 + 36;
}

uint64_t AFCFileDescriptorCreateReadOperation(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4, uint64_t a5)
{
  if (!*(_DWORD *)(a1 + 32)) {
    return 0;
  }
  uint64_t v14 = 0;
  long long v13 = 0u;
  memset(v12, 0, sizeof(v12));
  AFCHeaderInit(v12, 15, 56, 0, 0);
  *((void *)&v13 + 1) = *(void *)(a1 + 24);
  uint64_t v14 = a4;
  CFAllocatorRef v10 = CFGetAllocator((CFTypeRef)a1);
  return AFCOperationCreate(v10, (CFIndex *)v12, 0, a2, a3, a5);
}

uint64_t AFCFileDescriptorCreateReadAtPositionOperation(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!*(_DWORD *)(a1 + 32)) {
    return 0;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  memset(v14, 0, sizeof(v14));
  AFCHeaderInit(v14, 39, 64, 0, 0);
  *((void *)&v15 + 1) = *(void *)(a1 + 24);
  *(void *)&long long v16 = a4;
  *((void *)&v16 + 1) = a5;
  CFAllocatorRef v12 = CFGetAllocator((CFTypeRef)a1);
  return AFCOperationCreate(v12, (CFIndex *)v14, 0, a2, a3, a6);
}

uint64_t AFCFileDescriptorCreateWriteOperation(uint64_t a1, CFDataRef theData, uint64_t a3)
{
  if (!*(_DWORD *)(a1 + 32)) {
    return 0;
  }
  if (theData) {
    CFIndex Length = CFDataGetLength(theData);
  }
  else {
    CFIndex Length = 0;
  }
  long long v10 = 0u;
  memset(v9, 0, sizeof(v9));
  AFCHeaderInit(v9, 16, 48, Length, 0);
  *((void *)&v10 + 1) = *(void *)(a1 + 24);
  CFAllocatorRef v7 = CFGetAllocator((CFTypeRef)a1);
  return AFCOperationCreate(v7, (CFIndex *)v9, theData, 0, 0, a3);
}

uint64_t AFCFileDescriptorCreateWriteAtPositionOperation(uint64_t a1, CFDataRef theData, uint64_t a3, uint64_t a4)
{
  if (!*(_DWORD *)(a1 + 32)) {
    return 0;
  }
  if (theData) {
    CFIndex Length = CFDataGetLength(theData);
  }
  else {
    CFIndex Length = 0;
  }
  uint64_t v13 = 0;
  long long v12 = 0u;
  memset(v11, 0, sizeof(v11));
  AFCHeaderInit(v11, 40, 56, Length, 0);
  *((void *)&v12 + 1) = *(void *)(a1 + 24);
  uint64_t v13 = a3;
  CFAllocatorRef v9 = CFGetAllocator((CFTypeRef)a1);
  return AFCOperationCreate(v9, (CFIndex *)v11, theData, 0, 0, a4);
}

uint64_t AFCFileDescriptorCreateSetPositionOperation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!*(_DWORD *)(a1 + 32)) {
    return 0;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  memset(v10, 0, sizeof(v10));
  AFCHeaderInit(v10, 17, 64, 0, 0);
  *((void *)&v11 + 1) = *(void *)(a1 + 24);
  *(void *)&long long v12 = a2;
  *((void *)&v12 + 1) = a3;
  CFAllocatorRef v8 = CFGetAllocator((CFTypeRef)a1);
  return AFCOperationCreate(v8, (CFIndex *)v10, 0, 0, 0, a4);
}

uint64_t AFCFileDescriptorCreateGetPositionOperation(uint64_t a1, uint64_t a2)
{
  if (!*(_DWORD *)(a1 + 32)) {
    return 0;
  }
  long long v7 = 0u;
  memset(v6, 0, sizeof(v6));
  AFCHeaderInit(v6, 18, 48, 0, 0);
  *((void *)&v7 + 1) = *(void *)(a1 + 24);
  CFAllocatorRef v4 = CFGetAllocator((CFTypeRef)a1);
  return AFCOperationCreate(v4, (CFIndex *)v6, 0, 0, 0, a2);
}

uint64_t AFCFileDescriptorCreateSetSizeOperation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(_DWORD *)(a1 + 32)) {
    return 0;
  }
  uint64_t v10 = 0;
  long long v9 = 0u;
  memset(v8, 0, sizeof(v8));
  AFCHeaderInit(v8, 21, 56, 0, 0);
  *((void *)&v9 + 1) = *(void *)(a1 + 24);
  uint64_t v10 = a2;
  CFAllocatorRef v6 = CFGetAllocator((CFTypeRef)a1);
  return AFCOperationCreate(v6, (CFIndex *)v8, 0, 0, 0, a3);
}

uint64_t AFCFileDescriptorCreateLockOperation(uint64_t a1, int a2, uint64_t a3)
{
  if (!*(_DWORD *)(a1 + 32)) {
    return 0;
  }
  uint64_t v11 = 0;
  long long v10 = 0u;
  memset(v9, 0, sizeof(v9));
  AFCHeaderInit(v9, 27, 56, 0, 0);
  uint64_t v6 = 5;
  if (a2) {
    uint64_t v6 = 6;
  }
  *((void *)&v10 + 1) = *(void *)(a1 + 24);
  uint64_t v11 = v6;
  CFAllocatorRef v7 = CFGetAllocator((CFTypeRef)a1);
  return AFCOperationCreate(v7, (CFIndex *)v9, 0, 0, 0, a3);
}

uint64_t AFCFileDescriptorCreateUnlockOperation(uint64_t a1, uint64_t a2)
{
  if (!*(_DWORD *)(a1 + 32)) {
    return 0;
  }
  uint64_t v8 = 0;
  long long v7 = 0u;
  memset(v6, 0, sizeof(v6));
  AFCHeaderInit(v6, 27, 56, 0, 0);
  *((void *)&v7 + 1) = *(void *)(a1 + 24);
  uint64_t v8 = 12;
  CFAllocatorRef v4 = CFGetAllocator((CFTypeRef)a1);
  return AFCOperationCreate(v4, (CFIndex *)v6, 0, 0, 0, a2);
}

const void *AFCFileDescriptorCreateCloseOperation(uint64_t a1, uint64_t a2)
{
  long long v9 = 0u;
  memset(v8, 0, sizeof(v8));
  CFAllocatorRef v4 = (atomic_uint *)(a1 + 32);
  AFCLog(5, "AFCFileDescriptorCreateCloseOperation(%p) [valid %d]", (const void *)a1, *(_DWORD *)(a1 + 32));
  if (AFCCompareAndSwap32(1, 0, v4)
    && (AFCHeaderInit(v8, 20, 48, 0, 0), (*((void *)&v9 + 1) = *(void *)(a1 + 24)) != 0))
  {
    CFAllocatorRef v5 = CFGetAllocator((CFTypeRef)a1);
    uint64_t v6 = (const void *)AFCOperationCreate(v5, (CFIndex *)v8, 0, 0, 0, a2);
    if (v6) {
      *(void *)(a1 + 24) = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  AFCLog(5, "Close op for desc %p = %p", (const void *)a1, v6);
  return v6;
}

uint64_t AFCFileDescriptorCreateSetImmutableHintOperation(uint64_t a1, int a2, uint64_t a3)
{
  if (!*(_DWORD *)(a1 + 32)) {
    return 0;
  }
  BOOL v10 = 0;
  long long v9 = 0u;
  memset(v8, 0, sizeof(v8));
  AFCHeaderInit(v8, 32, 56, 0, 0);
  *((void *)&v9 + 1) = *(void *)(a1 + 24);
  BOOL v10 = a2 != 0;
  CFAllocatorRef v6 = CFGetAllocator((CFTypeRef)a1);
  return AFCOperationCreate(v6, (CFIndex *)v8, 0, 0, 0, a3);
}

uint64_t AFCFileDescriptorInvalidate(uint64_t a1)
{
  uint64_t result = AFCCompareAndSwap32(1, 0, (atomic_uint *)(a1 + 32));
  if (result)
  {
    uint64_t result = AFCLog(5, "AFCFileDescriptorInvalidate(%p)", (const void *)a1);
    *(void *)(a1 + 24) = 0;
  }
  return result;
}

BOOL AFCFileDescriptorIsValid(uint64_t a1)
{
  return *(_DWORD *)(a1 + 32) == 1;
}

uint64_t AFCOperationCreateGetDeviceInfo(const __CFAllocator *a1, uint64_t a2)
{
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  AFCHeaderInit(v5, 11, 40, 0, 0);
  return AFCOperationCreate(a1, (CFIndex *)v5, 0, 0, 0, a2);
}

uint64_t AFCOperationCreateGetConnectionInfo(const __CFAllocator *a1, uint64_t a2)
{
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  AFCHeaderInit(v5, 22, 40, 0, 0);
  return AFCOperationCreate(a1, (CFIndex *)v5, 0, 0, 0, a2);
}

uint64_t AFCOperationCreateSetConnectionOptions(const __CFAllocator *a1, const __CFDictionary *a2, uint64_t a3)
{
  if (!a2) {
    return 0;
  }
  CFDataRef v5 = __AFCCreateAFCDataWithDictionary(a2);
  if (!v5) {
    return 0;
  }
  CFDataRef v6 = v5;
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  CFIndex Length = CFDataGetLength(v5);
  AFCHeaderInit(v10, 23, 40, Length, 0);
  uint64_t v8 = AFCOperationCreate(a1, (CFIndex *)v10, v6, 0, 0, a3);
  CFRelease(v6);
  return v8;
}

uint64_t AFCOperationCreateGetFileInfo(const __CFAllocator *a1, CFStringRef theString, uint64_t a3)
{
  CFIndex v6 = 9 * CFStringGetLength(theString);
  long long v7 = (char *)CFAllocatorAllocate(0, v6 + 41, 0);
  if (!v7) {
    return 0;
  }
  uint64_t v8 = (CFIndex *)v7;
  CFIndex v9 = v6 + 1;
  BOOL v10 = v7 + 40;
  uint64_t CString = CFStringGetCString(theString, v7 + 40, v9, 0x8000100u);
  if (CString)
  {
    size_t v18 = strlen(v10);
    AFCHeaderInit(v8, 10, v18 + 41, 0, 0);
    uint64_t v19 = AFCOperationCreate(a1, v8, 0, 0, 0, a3);
  }
  else
  {
    __AFCSetErrorResult_0(CString, v12, v13, v14, 1035, v15, v16, v17, v21);
    uint64_t v19 = 0;
  }
  CFAllocatorDeallocate(0, v8);
  return v19;
}

uint64_t __AFCSetErrorResult_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return AFCSetErrorInfoWithArgs(0, 0xFFFFFFFFLL, 3892330503, "/Library/Caches/com.apple.xbs/Sources/AppleFileConduit/client-async.c", a5, "CFStringGetCString failed", &a9);
}

uint64_t AFCOperationCreateRemovePath(const __CFAllocator *a1, CFStringRef theString, uint64_t a3)
{
  CFIndex v6 = 9 * CFStringGetLength(theString);
  long long v7 = (char *)CFAllocatorAllocate(0, v6 + 41, 0);
  if (!v7) {
    return 0;
  }
  uint64_t v8 = (CFIndex *)v7;
  CFIndex v9 = v6 + 1;
  BOOL v10 = v7 + 40;
  uint64_t CString = CFStringGetCString(theString, v7 + 40, v9, 0x8000100u);
  if (CString)
  {
    size_t v18 = strlen(v10);
    AFCHeaderInit(v8, 8, v18 + 41, 0, 0);
    uint64_t v19 = AFCOperationCreate(a1, v8, 0, 0, 0, a3);
  }
  else
  {
    __AFCSetErrorResult_0(CString, v12, v13, v14, 1065, v15, v16, v17, v21);
    uint64_t v19 = 0;
  }
  CFAllocatorDeallocate(0, v8);
  return v19;
}

uint64_t AFCOperationCreateRenamePath(const __CFAllocator *a1, CFStringRef theString, const __CFString *a3, uint64_t a4)
{
  CFIndex Length = CFStringGetLength(theString);
  CFIndex v9 = 9 * (CFStringGetLength(a3) + Length);
  BOOL v10 = (char *)CFAllocatorAllocate(0, v9 + 44, 0);
  if (!v10) {
    return 0;
  }
  uint64_t v11 = (CFIndex *)v10;
  uint64_t v12 = v10 + 40;
  uint64_t CString = CFStringGetCString(theString, v10 + 40, v9 + 4, 0x8000100u);
  if (!CString)
  {
    int v25 = 1098;
LABEL_10:
    __AFCSetErrorResult_0(CString, v14, v15, v16, v25, v17, v18, v19, v26);
    uint64_t v23 = 0;
    goto LABEL_5;
  }
  uint64_t v20 = (char *)&v12[strlen(v12) + 1];
  uint64_t CString = CFStringGetCString(a3, v20, (char *)v11 + v9 + 44 - v20, 0x8000100u);
  if (!CString)
  {
    int v25 = 1100;
    goto LABEL_10;
  }
  size_t v21 = strlen(v12);
  size_t v22 = strlen(v20);
  AFCHeaderInit(v11, 24, v21 + v22 + 42, 0, 0);
  uint64_t v23 = AFCOperationCreate(a1, v11, 0, 0, 0, a4);
LABEL_5:
  CFAllocatorDeallocate(0, v11);
  return v23;
}

uint64_t AFCOperationCreateSetModTime(const __CFAllocator *a1, CFStringRef theString, uint64_t a3, uint64_t a4)
{
  CFIndex v8 = 9 * CFStringGetLength(theString);
  CFIndex v9 = (char *)CFAllocatorAllocate(0, v8 + 50, 0);
  if (!v9) {
    return 0;
  }
  BOOL v10 = (CFIndex *)v9;
  *((void *)v9 + 5) = a3;
  uint64_t v11 = v9 + 48;
  uint64_t CString = CFStringGetCString(theString, v9 + 48, v8 + 2, 0x8000100u);
  if (CString)
  {
    size_t v19 = strlen(v11);
    AFCHeaderInit(v10, 30, v19 + 49, 0, 0);
    uint64_t v20 = AFCOperationCreate(a1, v10, 0, 0, 0, a4);
  }
  else
  {
    __AFCSetErrorResult_0(CString, v13, v14, v15, 1132, v16, v17, v18, v22);
    uint64_t v20 = 0;
  }
  CFAllocatorDeallocate(0, v10);
  return v20;
}

uint64_t AFCOperationCreateLinkPath(const __CFAllocator *a1, uint64_t a2, CFStringRef theString, const __CFString *a4, uint64_t a5)
{
  CFIndex Length = CFStringGetLength(theString);
  CFIndex v11 = 9 * (CFStringGetLength(a4) + Length);
  uint64_t v12 = (char *)CFAllocatorAllocate(0, v11 + 52, 0);
  if (!v12) {
    return 0;
  }
  uint64_t v13 = (CFIndex *)v12;
  *((void *)v12 + 5) = a2;
  uint64_t v14 = v12 + 48;
  uint64_t CString = CFStringGetCString(theString, v12 + 48, v11 + 12, 0x8000100u);
  if (!CString)
  {
    int v27 = 1165;
LABEL_10:
    __AFCSetErrorResult_0(CString, v16, v17, v18, v27, v19, v20, v21, v28);
    uint64_t v25 = 0;
    goto LABEL_5;
  }
  char v22 = (char *)&v14[strlen(v14) + 1];
  uint64_t CString = CFStringGetCString(a4, v22, (char *)v13 + v11 + 52 - v22, 0x8000100u);
  if (!CString)
  {
    int v27 = 1168;
    goto LABEL_10;
  }
  size_t v23 = strlen(v14);
  size_t v24 = strlen(v22);
  AFCHeaderInit(v13, 28, v23 + v24 + 50, 0, 0);
  uint64_t v25 = AFCOperationCreate(a1, v13, 0, 0, 0, a5);
LABEL_5:
  CFAllocatorDeallocate(0, v13);
  return v25;
}

uint64_t AFCOperationCreateReadDirectory(const __CFAllocator *a1, CFStringRef theString, uint64_t a3)
{
  CFIndex v6 = 9 * CFStringGetLength(theString);
  long long v7 = (char *)CFAllocatorAllocate(0, v6 + 41, 0);
  if (!v7) {
    return 0;
  }
  CFIndex v8 = (CFIndex *)v7;
  CFIndex v9 = v6 + 1;
  BOOL v10 = v7 + 40;
  uint64_t CString = CFStringGetCString(theString, v7 + 40, v9, 0x8000100u);
  if (CString)
  {
    size_t v18 = strlen(v10);
    AFCHeaderInit(v8, 3, v18 + 41, 0, 0);
    uint64_t v19 = AFCOperationCreate(a1, v8, 0, 0, 0, a3);
  }
  else
  {
    __AFCSetErrorResult_0(CString, v12, v13, v14, 1200, v15, v16, v17, v21);
    uint64_t v19 = 0;
  }
  CFAllocatorDeallocate(0, v8);
  return v19;
}

uint64_t AFCOperationCreateMakeDirectory(const __CFAllocator *a1, CFStringRef theString, uint64_t a3)
{
  CFIndex v6 = 9 * CFStringGetLength(theString);
  long long v7 = (char *)CFAllocatorAllocate(0, v6 + 41, 0);
  if (!v7) {
    return 0;
  }
  CFIndex v8 = (CFIndex *)v7;
  CFIndex v9 = v6 + 1;
  BOOL v10 = v7 + 40;
  uint64_t CString = CFStringGetCString(theString, v7 + 40, v9, 0x8000100u);
  if (CString)
  {
    size_t v18 = strlen(v10);
    AFCHeaderInit(v8, 9, v18 + 41, 0, 0);
    uint64_t v19 = AFCOperationCreate(a1, v8, 0, 0, 0, a3);
  }
  else
  {
    __AFCSetErrorResult_0(CString, v12, v13, v14, 1232, v15, v16, v17, v21);
    uint64_t v19 = 0;
  }
  CFAllocatorDeallocate(0, v8);
  return v19;
}

uint64_t AFCOperationCreateOpenFile(const __CFAllocator *a1, CFStringRef theString, uint64_t a3, uint64_t a4)
{
  CFIndex v8 = 9 * CFStringGetLength(theString);
  CFIndex v9 = (char *)CFAllocatorAllocate(0, v8 + 49, 0);
  if (!v9) {
    return 0;
  }
  BOOL v10 = (CFIndex *)v9;
  *((void *)v9 + 5) = a3;
  CFIndex v11 = v9 + 48;
  uint64_t CString = CFStringGetCString(theString, v9 + 48, v8 + 1, 0x8000100u);
  if (CString)
  {
    size_t v19 = strlen(v11);
    AFCHeaderInit(v10, 13, v19 + 49, 0, 0);
    uint64_t v20 = AFCOperationCreate(a1, v10, 0, 0, 0, a4);
  }
  else
  {
    __AFCSetErrorResult_0(CString, v13, v14, v15, 1265, v16, v17, v18, v22);
    uint64_t v20 = 0;
  }
  CFAllocatorDeallocate(0, v10);
  return v20;
}

uint64_t AFCOperationCreateGetFileHash(const __CFAllocator *a1, CFStringRef theString, uint64_t a3)
{
  CFIndex v6 = 9 * CFStringGetLength(theString);
  long long v7 = (char *)CFAllocatorAllocate(0, v6 + 41, 0);
  if (!v7) {
    return 0;
  }
  CFIndex v8 = (CFIndex *)v7;
  CFIndex v9 = v6 + 1;
  BOOL v10 = v7 + 40;
  uint64_t CString = CFStringGetCString(theString, v7 + 40, v9, 0x8000100u);
  if (CString)
  {
    size_t v18 = strlen(v10);
    AFCHeaderInit(v8, 29, v18 + 41, 0, 0);
    uint64_t v19 = AFCOperationCreate(a1, v8, 0, 0, 0, a3);
  }
  else
  {
    __AFCSetErrorResult_0(CString, v12, v13, v14, 1296, v15, v16, v17, v21);
    uint64_t v19 = 0;
  }
  CFAllocatorDeallocate(0, v8);
  return v19;
}

uint64_t AFCOperationCreateGetFileHashWithRange(const __CFAllocator *a1, CFStringRef theString, uint64_t a3, uint64_t a4, uint64_t a5)
{
  CFIndex v10 = 9 * CFStringGetLength(theString);
  CFIndex v11 = (char *)CFAllocatorAllocate(0, v10 + 57, 0);
  if (!v11) {
    return 0;
  }
  uint64_t v12 = (CFIndex *)v11;
  *((void *)v11 + 5) = a3;
  *((void *)v11 + 6) = a4;
  uint64_t v13 = v11 + 56;
  uint64_t CString = CFStringGetCString(theString, v11 + 56, v10 + 1, 0x8000100u);
  if (CString)
  {
    size_t v21 = strlen(v13);
    AFCHeaderInit(v12, 31, v21 + 57, 0, 0);
    uint64_t v22 = AFCOperationCreate(a1, v12, 0, 0, 0, a5);
  }
  else
  {
    __AFCSetErrorResult_0(CString, v15, v16, v17, 1329, v18, v19, v20, v24);
    uint64_t v22 = 0;
  }
  CFAllocatorDeallocate(0, v12);
  return v22;
}

uint64_t AFCOperationCreateGetSizeOfPathContents(const __CFAllocator *a1, CFStringRef theString, uint64_t a3, uint64_t a4)
{
  CFIndex v8 = 9 * CFStringGetLength(theString);
  CFIndex v9 = (char *)CFAllocatorAllocate(0, v8 + 49, 0);
  if (!v9) {
    return 0;
  }
  CFIndex v10 = (CFIndex *)v9;
  *((void *)v9 + 5) = a3;
  CFIndex v11 = v9 + 48;
  uint64_t CString = CFStringGetCString(theString, v9 + 48, v8 + 1, 0x8000100u);
  if (CString)
  {
    size_t v19 = strlen(v11);
    AFCHeaderInit(v10, 33, v19 + 49, 0, 0);
    uint64_t v20 = AFCOperationCreate(a1, v10, 0, 0, 0, a4);
  }
  else
  {
    __AFCSetErrorResult_0(CString, v13, v14, v15, 1362, v16, v17, v18, v22);
    uint64_t v20 = 0;
  }
  CFAllocatorDeallocate(0, v10);
  return v20;
}

uint64_t AFCOperationCreateRemovePathAndContents(const __CFAllocator *a1, CFStringRef theString, uint64_t a3)
{
  CFIndex v6 = 9 * CFStringGetLength(theString);
  long long v7 = (char *)CFAllocatorAllocate(0, v6 + 41, 0);
  if (!v7) {
    return 0;
  }
  CFIndex v8 = (CFIndex *)v7;
  CFIndex v9 = v6 + 1;
  CFIndex v10 = v7 + 40;
  uint64_t CString = CFStringGetCString(theString, v7 + 40, v9, 0x8000100u);
  if (CString)
  {
    size_t v18 = strlen(v10);
    AFCHeaderInit(v8, 34, v18 + 41, 0, 0);
    uint64_t v19 = AFCOperationCreate(a1, v8, 0, 0, 0, a3);
  }
  else
  {
    __AFCSetErrorResult_0(CString, v12, v13, v14, 1393, v15, v16, v17, v21);
    uint64_t v19 = 0;
  }
  CFAllocatorDeallocate(0, v8);
  return v19;
}

void __AFCOperationFinalize(uint64_t a1)
{
  AFCLog(5, "%s(%p)\n", "__AFCOperationFinalize", (const void *)a1);
  CFAllocatorRef v2 = *(const void **)(a1 + 64);
  if (v2) {
    CFRelease(v2);
  }
  *(void *)(a1 + 64) = 0;
  CFAllocatorRef v3 = *(void **)(a1 + 72);
  if (v3)
  {
    CFAllocatorDeallocate(*(CFAllocatorRef *)(a1 + 80), v3);
    *(void *)(a1 + 72) = 0;
  }
  CFAllocatorRef v4 = *(void **)(a1 + 88);
  if (v4)
  {
    CFAllocatorDeallocate(*(CFAllocatorRef *)(a1 + 96), v4);
    *(void *)(a1 + 88) = 0;
  }
  CFDataRef v5 = *(const void **)(a1 + 240);
  if (v5) {
    CFRelease(v5);
  }
  *(void *)(a1 + 240) = 0;
  CFIndex v6 = *(const void **)(a1 + 256);
  if (v6) {
    CFRelease(v6);
  }
  *(void *)(a1 + 256) = 0;
  long long v7 = *(const void **)(a1 + 248);
  if (v7) {
    CFRelease(v7);
  }
  *(void *)(a1 + 248) = 0;
}

__CFString *__AFCOperationCopyDescription(uint64_t a1)
{
  CFAllocatorRef v2 = CFGetAllocator((CFTypeRef)a1);
  uint64_t v3 = *(unsigned int *)(a1 + 24);
  if (v3 <= 5) {
    CFAllocatorRef v4 = __OperationStates[v3];
  }
  else {
    CFAllocatorRef v4 = @"Invalid";
  }
  CFStringRef v5 = AFCCopyErrorString(*(unsigned int *)(a1 + 40));
  CFStringRef v6 = AFCCopyPacketTypeString(*(void *)(a1 + 48));
  CFMutableDataRef Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, @"<AFCOperation %p [%p]> { Packet '%@' (%qu), State '%@' (%d), Status '%@' (0x%x)", a1, v2, v6, *(void *)(a1 + 48), v4, *(unsigned int *)(a1 + 24), v5, *(unsigned int *)(a1 + 40));
  if (*(void *)(a1 + 240)) {
    CFStringAppendFormat(Mutable, 0, @" ResultObject '%@'", *(void *)(a1 + 240));
  }
  CFStringAppendFormat(Mutable, 0, @"}");
  CFRelease(v5);
  CFRelease(v6);
  return Mutable;
}

void __AFCFileDescriptorFinalize(void *a1)
{
  AFCLog(5, "__AFCFileDescriptorFinalize(%p)", a1);
  AFCFileDescriptorInvalidate((uint64_t)a1);
  uint64_t v2 = a1[2];
  if (v2)
  {
    __AFCConnectionRemoveFileDescriptor(v2, a1);
    uint64_t v3 = (const void *)a1[2];
    if (v3)
    {
      CFRelease(v3);
    }
  }
}

__CFString *__AFCFileDescriptorCopyDescription(void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  CFMutableDataRef Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, @"<AFCFileDescriptor %p [%p]> { Connection %p, FileRef %d }", a1, v2, a1[2], a1[3]);
  return Mutable;
}

uint64_t AFCConnectionSetSocketBlockSize(uint64_t *a1, uint64_t a2)
{
  return __AFCConnectionSetBlockSize(a1, 26, a2, a1 + 12) & 0x1FFF;
}

uint64_t __AFCConnectionSetBlockSize(uint64_t *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  memset(v19, 0, sizeof(v19));
  memset(v21, 0, sizeof(v21));
  ptr = 0;
  uint64_t v8 = AFCLockLock(a1[17]);
  if (v8
    || (AFCHeaderInit(v19, a2, 48, 0, 0),
        *((void *)&v20 + 1) = a3,
        uint64_t v8 = AFCSendHeader((uint64_t)a1, (uint64_t)v19),
        v8))
  {
    uint64_t v14 = v8;
LABEL_17:
    if (v14) {
      AFCConnectionSetFatalError((uint64_t)a1, v14);
    }
    goto LABEL_19;
  }
  uint64_t v9 = AFCReadPacketHeader((uint64_t)a1, (uint64_t)v21, 0x80uLL, &ptr);
  CFIndex v10 = ptr;
  if (v9)
  {
    uint64_t v14 = v9;
    char v15 = 0;
  }
  else
  {
    if (ptr) {
      CFIndex v11 = ptr;
    }
    else {
      CFIndex v11 = v21;
    }
    if (*((void *)v11 + 4) == 1)
    {
      uint64_t v12 = v21;
      if (ptr) {
        uint64_t v12 = ptr;
      }
      int v13 = *((_DWORD *)v12 + 10);
      if (v13)
      {
        uint64_t v14 = v13 | 0xE8004000;
      }
      else
      {
        uint64_t v14 = 0;
        *a4 = a3;
      }
      char v15 = 1;
    }
    else
    {
      char v15 = 0;
      uint64_t v14 = 0;
    }
  }
  if (v10)
  {
    CFAllocatorRef v16 = CFGetAllocator(a1);
    CFAllocatorDeallocate(v16, ptr);
  }
  if ((v15 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_19:
  AFCLockUnlock(a1[17]);
  return v14;
}

uint64_t AFCConnectionGetFSBlockSize(uint64_t a1)
{
  return *(void *)(a1 + 88);
}

uint64_t AFCConnectionGetSocketBlockSize(uint64_t a1)
{
  return *(void *)(a1 + 96);
}

uint64_t AFCConnectionSetFSBlockSize(uint64_t *a1, uint64_t a2)
{
  return __AFCConnectionSetBlockSize(a1, 25, a2, a1 + 11) & 0x1FFF;
}

uint64_t AFCConnectionOpen(CFSocketNativeHandle a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = AFCConnectionCreate(0, a1, 1, 0, a2);
  *a3 = v4;
  if (v4) {
    return 0;
  }
  else {
    return 3;
  }
}

uint64_t AFCConnectionClose(void *a1)
{
  return 0;
}

uint64_t AFCDeviceInfoOpen(const void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8 = 16407;
  if (a1 && a2)
  {
    CFAllocatorRef v11 = CFGetAllocator(a1);
    uint64_t DeviceInfo = AFCOperationCreateGetDeviceInfo(v11, 0);
    if (DeviceInfo)
    {
      int v13 = (const void *)DeviceInfo;
      uint64_t IOTimeout = AFCConnectionGetIOTimeout((uint64_t)a1);
      int ResultStatus = AFCConnectionProcessOperation((uint64_t)a1, (uint64_t)v13, (double)IOTimeout);
      if (ResultStatus || (int ResultStatus = AFCOperationGetResultStatus((uint64_t)v13)) != 0)
      {
        __int16 v8 = ResultStatus;
      }
      else
      {
        ResultObject = (const void *)AFCOperationGetResultObject((uint64_t)v13);
        if (ResultObject)
        {
          uint64_t v17 = ResultObject;
          CFTypeID v18 = CFGetTypeID(ResultObject);
          if (v18 == CFDictionaryGetTypeID())
          {
            CFAllocatorRef v19 = CFGetAllocator(a1);
            __int16 v8 = 0;
            *a2 = AFCIteratorCreate(v19, v17);
          }
        }
      }
      CFRelease(v13);
    }
    else
    {
      __int16 v8 = 16387;
    }
  }
  else
  {
    __int16 v8 = __AFCSetErrorResult_1((uint64_t)a1, (uint64_t)a2, 3892330503, a4, 171, "NULL argument", a7, a8, v21);
  }
  return v8 & 0x1FFF;
}

uint64_t __AFCSetErrorResult_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, const char *a6, uint64_t a7, uint64_t a8, char a9)
{
  return AFCSetErrorInfoWithArgs(0, 0xFFFFFFFFLL, a3, "/Library/Caches/com.apple.xbs/Sources/AppleFileConduit/client-sync.c", a5, a6, &a9);
}

uint64_t AFCFileInfoOpen(CFTypeRef cf, const char *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8 = 16387;
  if (cf && a2 && a3)
  {
    CFAllocatorRef v12 = CFGetAllocator(cf);
    CFStringRef v13 = CFStringCreateWithCString(v12, a2, 0x8000100u);
    if (v13)
    {
      CFStringRef v14 = v13;
      CFAllocatorRef v15 = CFGetAllocator(cf);
      FileInfo = (const void *)AFCOperationCreateGetFileInfo(v15, v14, 0);
      CFRelease(v14);
      if (FileInfo)
      {
        uint64_t IOTimeout = AFCConnectionGetIOTimeout((uint64_t)cf);
        int ResultStatus = AFCConnectionProcessOperation((uint64_t)cf, (uint64_t)FileInfo, (double)IOTimeout);
        if (ResultStatus || (int ResultStatus = AFCOperationGetResultStatus((uint64_t)FileInfo)) != 0)
        {
          __int16 v8 = ResultStatus;
        }
        else
        {
          ResultObject = (const void *)AFCOperationGetResultObject((uint64_t)FileInfo);
          if (ResultObject && (long long v20 = ResultObject, v21 = CFGetTypeID(ResultObject), v21 == CFDictionaryGetTypeID()))
          {
            CFAllocatorRef v22 = CFGetAllocator(cf);
            size_t v23 = AFCIteratorCreate(v22, v20);
            if (v23)
            {
              *a3 = v23;
              __int16 v8 = 0;
            }
          }
          else
          {
            __int16 v8 = 16407;
          }
        }
        CFRelease(FileInfo);
      }
    }
  }
  else
  {
    __int16 v8 = __AFCSetErrorResult_1((uint64_t)cf, (uint64_t)a2, 3892330503, a4, 203, "NULL argument", a7, a8, v25);
  }
  return v8 & 0x1FFF;
}

uint64_t AFCRemovePath(const void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8 = 16387;
  if (a1 && a2)
  {
    CFAllocatorRef v11 = CFGetAllocator(a1);
    CFStringRef v12 = CFStringCreateWithCString(v11, a2, 0x8000100u);
    if (v12)
    {
      CFStringRef v13 = v12;
      CFAllocatorRef v14 = CFGetAllocator(a1);
      CFAllocatorRef v15 = (const void *)AFCOperationCreateRemovePath(v14, v13, 0);
      CFRelease(v13);
      if (v15)
      {
        uint64_t IOTimeout = AFCConnectionGetIOTimeout((uint64_t)a1);
        int v17 = AFCConnectionProcessOperation((uint64_t)a1, (uint64_t)v15, (double)IOTimeout);
        if (!v17) {
          LOWORD(v17) = AFCOperationGetResultStatus((uint64_t)v15);
        }
        __int16 v8 = v17;
        CFRelease(v15);
      }
    }
  }
  else
  {
    __int16 v8 = __AFCSetErrorResult_1((uint64_t)a1, (uint64_t)a2, 3892330503, a4, 243, "NULL argument", a7, a8, v19);
  }
  return v8 & 0x1FFF;
}

uint64_t AFCRenamePath(const void *a1, const char *a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8 = 16387;
  if (!a1 || !a2 || !a3)
  {
    __int16 v8 = __AFCSetErrorResult_1((uint64_t)a1, (uint64_t)a2, 3892330503, a4, 270, "NULL argument", a7, a8, v23);
    return v8 & 0x1FFF;
  }
  CFAllocatorRef v12 = CFGetAllocator(a1);
  CFStringRef v13 = CFStringCreateWithCString(v12, a2, 0x8000100u);
  CFAllocatorRef v14 = CFGetAllocator(a1);
  CFStringRef v15 = CFStringCreateWithCString(v14, a3, 0x8000100u);
  CFStringRef v16 = v15;
  if (v13 && v15)
  {
    CFAllocatorRef v17 = CFGetAllocator(a1);
    uint64_t RenamePath = AFCOperationCreateRenamePath(v17, v13, v16, 0);
    if (RenamePath)
    {
      char v19 = (const void *)RenamePath;
      uint64_t IOTimeout = AFCConnectionGetIOTimeout((uint64_t)a1);
      int v21 = AFCConnectionProcessOperation((uint64_t)a1, (uint64_t)v19, (double)IOTimeout);
      if (!v21) {
        LOWORD(v21) = AFCOperationGetResultStatus((uint64_t)v19);
      }
      __int16 v8 = v21;
      CFRelease(v19);
    }
    goto LABEL_10;
  }
  if (v13) {
LABEL_10:
  }
    CFRelease(v13);
  if (v16) {
    CFRelease(v16);
  }
  return v8 & 0x1FFF;
}

uint64_t AFCLinkPath(const void *a1, uint64_t a2, const char *a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8 = 16387;
  if (!a1 || !a3 || !a4)
  {
    __int16 v8 = __AFCSetErrorResult_1((uint64_t)a1, a2, 3892330503, (uint64_t)a4, 299, "NULL argument", a7, a8, v24);
    return v8 & 0x1FFF;
  }
  CFAllocatorRef v13 = CFGetAllocator(a1);
  CFStringRef v14 = CFStringCreateWithCString(v13, a3, 0x8000100u);
  CFAllocatorRef v15 = CFGetAllocator(a1);
  CFStringRef v16 = CFStringCreateWithCString(v15, a4, 0x8000100u);
  CFStringRef v17 = v16;
  if (v14 && v16)
  {
    CFAllocatorRef v18 = CFGetAllocator(a1);
    uint64_t LinkPath = AFCOperationCreateLinkPath(v18, a2, v14, v17, 0);
    if (LinkPath)
    {
      long long v20 = (const void *)LinkPath;
      uint64_t IOTimeout = AFCConnectionGetIOTimeout((uint64_t)a1);
      int v22 = AFCConnectionProcessOperation((uint64_t)a1, (uint64_t)v20, (double)IOTimeout);
      if (!v22) {
        LOWORD(v22) = AFCOperationGetResultStatus((uint64_t)v20);
      }
      __int16 v8 = v22;
      CFRelease(v20);
    }
    goto LABEL_10;
  }
  if (v14) {
LABEL_10:
  }
    CFRelease(v14);
  if (v17) {
    CFRelease(v17);
  }
  return v8 & 0x1FFF;
}

uint64_t AFCFileRefOpen(const void *a1, char *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8 = 16387;
  if (a1 && a2 && a4)
  {
    CFAllocatorRef v13 = CFGetAllocator(a1);
    CFStringRef v14 = CFStringCreateWithCString(v13, a2, 0x8000100u);
    if (v14)
    {
      CFStringRef v15 = v14;
      CFAllocatorRef v16 = CFGetAllocator(a1);
      OpenFile = (const void *)AFCOperationCreateOpenFile(v16, v15, a3, 0);
      CFRelease(v15);
      if (OpenFile)
      {
        uint64_t IOTimeout = AFCConnectionGetIOTimeout((uint64_t)a1);
        int ResultStatus = AFCConnectionProcessOperation((uint64_t)a1, (uint64_t)OpenFile, (double)IOTimeout);
        if (ResultStatus || (int ResultStatus = AFCOperationGetResultStatus((uint64_t)OpenFile)) != 0)
        {
          __int16 v8 = ResultStatus;
        }
        else
        {
          ResultObject = (const void *)AFCOperationGetResultObject((uint64_t)OpenFile);
          AFCFileDescriptorSetRemoteName((uint64_t)ResultObject, a2);
          __int16 v8 = 16407;
          if (ResultObject)
          {
            CFTypeID v21 = CFGetTypeID(ResultObject);
            if (v21 == AFCFileDescriptorGetTypeID())
            {
              CFRetain(ResultObject);
              *a4 = ResultObject;
              __int16 v8 = 0;
            }
          }
        }
        CFRelease(OpenFile);
      }
    }
  }
  else
  {
    __int16 v8 = __AFCSetErrorResult_1((uint64_t)a1, (uint64_t)a2, 3892330503, (uint64_t)a4, 373, "NULL argument", a7, a8, v23);
  }
  return v8 & 0x1FFF;
}

uint64_t AFCFileRefRead(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8 = 16387;
  if (a4 && a1 && a2 && a3)
  {
    AFCFileDescriptorGetRemoteName(a2);
    uint64_t Operation = AFCFileDescriptorCreateReadOperation(a2, a3, (const void *)*MEMORY[0x263EFFB28], *a4, 0);
    if (Operation)
    {
      CFStringRef v14 = (const void *)Operation;
      uint64_t IOTimeout = AFCConnectionGetIOTimeout(a1);
      int ResultStatus = AFCConnectionProcessOperation(a1, (uint64_t)v14, (double)IOTimeout);
      if (ResultStatus || (int ResultStatus = AFCOperationGetResultStatus((uint64_t)v14)) != 0)
      {
        __int16 v8 = ResultStatus;
      }
      else
      {
        ResultObject = (const void *)AFCOperationGetResultObject((uint64_t)v14);
        CFTypeID v18 = CFGetTypeID(ResultObject);
        if (v18 == CFDataGetTypeID())
        {
          *a4 = CFDataGetLength((CFDataRef)ResultObject);
          AFCFileDescriptorGetRemoteName(a2);
          __int16 v8 = 0;
        }
        else
        {
          __int16 v8 = 16407;
        }
      }
      CFRelease(v14);
    }
  }
  else
  {
    __int16 v8 = __AFCSetErrorResult_1(a1, a2, 3892330503, (uint64_t)a4, 412, "NULL argument", a7, a8, v20);
  }
  return v8 & 0x1FFF;
}

uint64_t AFCFileRefWrite(uint64_t a1, uint64_t a2, const UInt8 *a3, CFIndex a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 ResultStatus = 16387;
  if (a1 && a2 && a3)
  {
    AFCFileDescriptorGetRemoteName(a2);
    CFDataRef v13 = CFDataCreateWithBytesNoCopy(0, a3, a4, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
    if (v13)
    {
      CFDataRef v14 = v13;
      uint64_t v15 = AFCFileDescriptorCreateWriteOperation(a2, v13, 0);
      if (v15)
      {
        CFAllocatorRef v16 = (const void *)v15;
        uint64_t IOTimeout = AFCConnectionGetIOTimeout(a1);
        int v18 = AFCConnectionProcessOperation(a1, (uint64_t)v16, (double)IOTimeout);
        if (v18)
        {
          __int16 ResultStatus = v18;
        }
        else
        {
          __int16 ResultStatus = AFCOperationGetResultStatus((uint64_t)v16);
          AFCFileDescriptorGetRemoteName(a2);
        }
        CFRelease(v16);
      }
      CFRelease(v14);
    }
  }
  else
  {
    __int16 ResultStatus = __AFCSetErrorResult_1(a1, a2, 3892330503, a4, 446, "NULL argument", a7, a8, v20);
  }
  return ResultStatus & 0x1FFF;
}

uint64_t AFCFileRefClose(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 ResultStatus = 16387;
  if (a1 && a2)
  {
    Closeuint64_t Operation = AFCFileDescriptorCreateCloseOperation((uint64_t)a2, 0);
    if (CloseOperation)
    {
      CFAllocatorRef v12 = CloseOperation;
      uint64_t IOTimeout = AFCConnectionGetIOTimeout(a1);
      int v14 = AFCConnectionProcessOperation(a1, (uint64_t)v12, (double)IOTimeout);
      if (v14)
      {
        __int16 ResultStatus = v14;
      }
      else
      {
        __int16 ResultStatus = AFCOperationGetResultStatus((uint64_t)v12);
        AFCFileDescriptorInvalidate((uint64_t)a2);
        CFRelease(a2);
      }
      CFRelease(v12);
    }
  }
  else
  {
    __int16 ResultStatus = __AFCSetErrorResult_1(a1, (uint64_t)a2, 3892330503, a4, 475, "NULL argument", a7, a8, v16);
  }
  return ResultStatus & 0x1FFF;
}

uint64_t AFCFileRefSeek(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8 = 16387;
  if (a1 && a2)
  {
    SetPositionuint64_t Operation = AFCFileDescriptorCreateSetPositionOperation(a2, a4, a3, 0);
    if (SetPositionOperation)
    {
      CFAllocatorRef v11 = (const void *)SetPositionOperation;
      uint64_t IOTimeout = AFCConnectionGetIOTimeout(a1);
      int v13 = AFCConnectionProcessOperation(a1, (uint64_t)v11, (double)IOTimeout);
      if (!v13) {
        LOWORD(v13) = AFCOperationGetResultStatus((uint64_t)v11);
      }
      __int16 v8 = v13;
      CFRelease(v11);
    }
  }
  else
  {
    __int16 v8 = __AFCSetErrorResult_1(a1, a2, 3892330503, a4, 502, "NULL argument", a7, a8, v15);
  }
  return v8 & 0x1FFF;
}

uint64_t AFCFileRefTell(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8 = 16407;
  if (a1 && a2 && a3)
  {
    Positionuint64_t Operation = AFCFileDescriptorCreateGetPositionOperation(a2, 0);
    if (PositionOperation)
    {
      CFAllocatorRef v12 = (const void *)PositionOperation;
      uint64_t IOTimeout = AFCConnectionGetIOTimeout(a1);
      int ResultStatus = AFCConnectionProcessOperation(a1, (uint64_t)v12, (double)IOTimeout);
      if (ResultStatus || (int ResultStatus = AFCOperationGetResultStatus((uint64_t)v12)) != 0)
      {
        __int16 v8 = ResultStatus;
      }
      else
      {
        CFNumberRef ResultObject = (const __CFNumber *)AFCOperationGetResultObject((uint64_t)v12);
        if (ResultObject)
        {
          CFNumberRef v16 = ResultObject;
          CFTypeID v17 = CFGetTypeID(ResultObject);
          if (v17 == CFNumberGetTypeID())
          {
            if (CFNumberGetValue(v16, kCFNumberSInt64Type, a3)) {
              __int16 v8 = 0;
            }
            else {
              __int16 v8 = 16407;
            }
          }
        }
      }
      CFRelease(v12);
    }
    else
    {
      __int16 v8 = 16387;
    }
  }
  else
  {
    __int16 v8 = __AFCSetErrorResult_1(a1, a2, 3892330503, a4, 526, "NULL argument", a7, a8, v19);
  }
  return v8 & 0x1FFF;
}

uint64_t AFCFileRefLock(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8 = 16387;
  if (a1 && a2)
  {
    Lockuint64_t Operation = AFCFileDescriptorCreateLockOperation(a2, a3, 0);
    if (LockOperation)
    {
      CFAllocatorRef v11 = (const void *)LockOperation;
      uint64_t IOTimeout = AFCConnectionGetIOTimeout(a1);
      int v13 = AFCConnectionProcessOperation(a1, (uint64_t)v11, (double)IOTimeout);
      if (!v13) {
        LOWORD(v13) = AFCOperationGetResultStatus((uint64_t)v11);
      }
      __int16 v8 = v13;
      CFRelease(v11);
    }
  }
  else
  {
    __int16 v8 = __AFCSetErrorResult_1(a1, a2, 3892330503, a4, 556, "NULL argument", a7, a8, v15);
  }
  return v8 & 0x1FFF;
}

uint64_t AFCFileRefSetFileSize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8 = 16387;
  if (a1 && a2)
  {
    SetSizeuint64_t Operation = AFCFileDescriptorCreateSetSizeOperation(a2, a3, 0);
    if (SetSizeOperation)
    {
      CFAllocatorRef v11 = (const void *)SetSizeOperation;
      uint64_t IOTimeout = AFCConnectionGetIOTimeout(a1);
      int v13 = AFCConnectionProcessOperation(a1, (uint64_t)v11, (double)IOTimeout);
      if (!v13) {
        LOWORD(v13) = AFCOperationGetResultStatus((uint64_t)v11);
      }
      __int16 v8 = v13;
      CFRelease(v11);
    }
  }
  else
  {
    __int16 v8 = __AFCSetErrorResult_1(a1, a2, 3892330503, a4, 580, "NULL argument", a7, a8, v15);
  }
  return v8 & 0x1FFF;
}

uint64_t AFCFileRefUnlock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8 = 16387;
  if (a1 && a2)
  {
    Unlockuint64_t Operation = AFCFileDescriptorCreateUnlockOperation(a2, 0);
    if (UnlockOperation)
    {
      CFAllocatorRef v11 = (const void *)UnlockOperation;
      uint64_t IOTimeout = AFCConnectionGetIOTimeout(a1);
      int v13 = AFCConnectionProcessOperation(a1, (uint64_t)v11, (double)IOTimeout);
      if (!v13) {
        LOWORD(v13) = AFCOperationGetResultStatus((uint64_t)v11);
      }
      __int16 v8 = v13;
      CFRelease(v11);
    }
  }
  else
  {
    __int16 v8 = __AFCSetErrorResult_1(a1, a2, 3892330503, a4, 604, "NULL argument", a7, a8, v15);
  }
  return v8 & 0x1FFF;
}

uint64_t AFCDirectoryOpen(const void *a1, const char *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8 = 16387;
  if (a1 && a2 && a3)
  {
    CFAllocatorRef v12 = CFGetAllocator(a1);
    CFStringRef v13 = CFStringCreateWithCString(v12, a2, 0x8000100u);
    if (v13)
    {
      CFStringRef v14 = v13;
      CFAllocatorRef v15 = CFGetAllocator(a1);
      uint64_t Directory = AFCOperationCreateReadDirectory(v15, v14, 0);
      if (Directory)
      {
        uint64_t v17 = Directory;
        uint64_t IOTimeout = AFCConnectionGetIOTimeout((uint64_t)a1);
        int ResultStatus = AFCConnectionProcessOperation((uint64_t)a1, v17, (double)IOTimeout);
        if (ResultStatus || (int ResultStatus = AFCOperationGetResultStatus(v17)) != 0)
        {
          __int16 v8 = ResultStatus;
        }
        else
        {
          CFNumberRef ResultObject = (const void *)AFCOperationGetResultObject(v17);
          __int16 v8 = 16407;
          if (ResultObject)
          {
            CFTypeID v21 = ResultObject;
            CFTypeID v22 = CFGetTypeID(ResultObject);
            if (v22 == CFArrayGetTypeID())
            {
              CFAllocatorRef v23 = CFGetAllocator(a1);
              __int16 v8 = 0;
              *a3 = AFCIteratorCreate(v23, v21);
            }
          }
        }
        CFRelease(v14);
        char v24 = (const void *)v17;
      }
      else
      {
        char v24 = v14;
      }
      CFRelease(v24);
    }
  }
  else
  {
    __int16 v8 = __AFCSetErrorResult_1((uint64_t)a1, (uint64_t)a2, 3892330503, a4, 635, "NULL argument", a7, a8, v26);
  }
  return v8 & 0x1FFF;
}

uint64_t AFCDirectoryRead(uint64_t a1, uint64_t a2, char **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || !a2 || !a3) {
    return __AFCSetErrorResult_1(a1, a2, 3892330503, a4, 675, "NULL argument", a7, a8, v15) & 0x1FFF;
  }
  uint64_t result = (uint64_t)AFCIteratorNext(a2);
  if (result)
  {
    CFStringRef v11 = (const __CFString *)result;
    CFTypeID v12 = CFGetTypeID((CFTypeRef)result);
    if (v12 == CFStringGetTypeID())
    {
      CFIndex v13 = 9 * CFStringGetLength(v11) + 1;
      ValueBuffer = (char *)AFCIteratorGetValueBuffer(a2, v13);
      *a3 = ValueBuffer;
      if (CFStringGetCString(v11, ValueBuffer, v13, 0x8000100u)) {
        return 0;
      }
      else {
        return 23;
      }
    }
    else
    {
      return 7;
    }
  }
  else
  {
    *a3 = 0;
  }
  return result;
}

uint64_t AFCDirectoryClose(uint64_t a1, CFTypeRef cf, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || !cf) {
    return __AFCSetErrorResult_1(a1, (uint64_t)cf, 3892330503, a4, 705, "NULL argument", a7, a8, vars0) & 0x1FFF;
  }
  CFRelease(cf);
  return 0;
}

uint64_t AFCDirectoryCreate(const void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8 = 16387;
  if (a1 && a2)
  {
    CFAllocatorRef v11 = CFGetAllocator(a1);
    CFStringRef v12 = CFStringCreateWithCString(v11, a2, 0x8000100u);
    if (v12)
    {
      CFStringRef v13 = v12;
      CFAllocatorRef v14 = CFGetAllocator(a1);
      uint64_t Directory = AFCOperationCreateMakeDirectory(v14, v13, 0);
      if (Directory)
      {
        CFNumberRef v16 = (const void *)Directory;
        uint64_t IOTimeout = AFCConnectionGetIOTimeout((uint64_t)a1);
        int v18 = AFCConnectionProcessOperation((uint64_t)a1, (uint64_t)v16, (double)IOTimeout);
        if (!v18) {
          LOWORD(v18) = AFCOperationGetResultStatus((uint64_t)v16);
        }
        __int16 v8 = v18;
        CFRelease(v16);
      }
      CFRelease(v13);
    }
  }
  else
  {
    __int16 v8 = __AFCSetErrorResult_1((uint64_t)a1, (uint64_t)a2, 3892330503, a4, 720, "NULL argument", a7, a8, v20);
  }
  return v8 & 0x1FFF;
}

uint64_t AFCKeyValueRead(uint64_t TypeID, uint64_t *a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (TypeID && a2 && a3)
  {
    uint64_t v10 = TypeID;
    CFStringRef v11 = (const __CFString *)AFCIteratorNext(TypeID);
    if (!v11)
    {
      *a2 = 0;
LABEL_14:
      *a3 = 0;
      return (unsigned __int16)v11 & 0x1FFF;
    }
    CFStringRef v12 = v11;
    CFTypeID v13 = CFGetTypeID(v11);
    TypeID = CFStringGetTypeID();
    if (v13 == TypeID)
    {
      Object = (const void *)AFCIteratorGetObject(v10);
      CFTypeID v15 = CFGetTypeID(Object);
      TypeID = CFDictionaryGetTypeID();
      if (v15 == TypeID)
      {
        CFDictionaryRef v16 = (const __CFDictionary *)AFCIteratorGetObject(v10);
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v16, v12);
        CFTypeID v18 = CFGetTypeID(Value);
        TypeID = CFStringGetTypeID();
        if (v18 == TypeID)
        {
          CFIndex v19 = 9 * CFStringGetLength(v12) + 1;
          TypeID = (uint64_t)AFCIteratorGetKeyBuffer(v10, v19);
          *a2 = TypeID;
          if (TypeID)
          {
            TypeID = CFStringGetCString(v12, (char *)TypeID, v19, 0x8000100u);
            if (TypeID)
            {
              CFIndex v20 = 9 * CFStringGetLength(Value) + 1;
              TypeID = (uint64_t)AFCIteratorGetValueBuffer(v10, v20);
              *a3 = TypeID;
              if (TypeID)
              {
                TypeID = CFStringGetCString(Value, (char *)TypeID, v20, 0x8000100u);
                if (TypeID)
                {
                  LOWORD(v11) = 0;
                  return (unsigned __int16)v11 & 0x1FFF;
                }
                CFTypeID v22 = "CString encoding of value failed";
                uint64_t v23 = 3892330503;
                int v24 = 781;
              }
              else
              {
                uint64_t v23 = 3892330499;
                CFTypeID v22 = "NULL value buffer";
                int v24 = 780;
              }
            }
            else
            {
              CFTypeID v22 = "CString encoding of key failed";
              uint64_t v23 = 3892330503;
              int v24 = 776;
            }
          }
          else
          {
            uint64_t v23 = 3892330499;
            CFTypeID v22 = "NULL key buffer";
            int v24 = 775;
          }
        }
        else
        {
          CFTypeID v22 = "value is not a string";
          uint64_t v23 = 3892330503;
          int v24 = 771;
        }
      }
      else
      {
        CFTypeID v22 = "iterator object is not a dictionary";
        uint64_t v23 = 3892330503;
        int v24 = 768;
      }
    }
    else
    {
      CFTypeID v22 = "key is not a string";
      uint64_t v23 = 3892330503;
      int v24 = 766;
    }
  }
  else
  {
    CFTypeID v22 = "NULL argument";
    uint64_t v23 = 3892330503;
    int v24 = 755;
  }
  LODWORD(v11) = __AFCSetErrorResult_1(TypeID, (uint64_t)a2, v23, a4, v24, v22, a7, a8, v25);
  if (v11)
  {
    if (a2) {
      *a2 = 0;
    }
    if (a3) {
      goto LABEL_14;
    }
  }
  return (unsigned __int16)v11 & 0x1FFF;
}

uint64_t AFCKeyValueClose(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return __AFCSetErrorResult_1(0, a2, 3892330503, a4, 799, "NULL argument", a7, a8, vars0) & 0x1FFF;
  }
  CFRelease(a1);
  return 0;
}

uint64_t __AFCCreateDictionaryOrArrayFromData(const __CFAllocator *a1, void *a2, uint64_t a3, int a4, CFArrayRef *a5)
{
  uint64_t v5 = 3892330503;
  if (!a2 || !a5) {
    return v5;
  }
  uint64_t v10 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
  CFArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  uint64_t v12 = (uint64_t)CFArrayCreateMutable(0, 0, v10);
  CFArrayRef v17 = (const __CFArray *)v12;
  if (Mutable) {
    BOOL v18 = v12 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (v18)
  {
    uint64_t v37 = 3892330499;
    uint64_t v36 = "CFArrayCreateMutable";
    int v38 = 45;
LABEL_33:
    uint64_t v39 = __AFCSetErrorResult_2(v12, v13, v37, v14, v38, v36, v15, v16, v40);
    goto LABEL_34;
  }
  if (a3 >= 1)
  {
    uint64_t v19 = 0;
    char v20 = 0;
    CFTypeID v21 = a2;
    while (1)
    {
      uint64_t v12 = (uint64_t)memchr(v21, 0, a3 - v19);
      if (!v12)
      {
        uint64_t v36 = "Last string is unterminated";
        uint64_t v37 = 3892330503;
        int v38 = 52;
        goto LABEL_33;
      }
      uint64_t v22 = v12;
      uint64_t v12 = (uint64_t)CFStringCreateWithBytes(a1, (const UInt8 *)v21, v12 - (void)v21, 0x8000100u, 0);
      if (!v12) {
        break;
      }
      uint64_t v23 = (const void *)v12;
      if ((v20 & 1) != 0 || a4 == 0) {
        char v25 = v17;
      }
      else {
        char v25 = Mutable;
      }
      CFArrayAppendValue(v25, v23);
      CFRelease(v23);
      CFTypeID v21 = (void *)(v22 + 1);
      ++v20;
      uint64_t v19 = v22 + 1 - (void)a2;
      if (v19 >= a3) {
        goto LABEL_18;
      }
    }
    uint64_t v36 = "Could not create string object";
    uint64_t v37 = 3892330503;
    int v38 = 55;
    goto LABEL_33;
  }
LABEL_18:
  if (!a4)
  {
    CFArrayRef Copy = CFArrayCreateCopy(0, v17);
    goto LABEL_26;
  }
  CFIndex Count = CFArrayGetCount(Mutable);
  uint64_t v12 = CFArrayGetCount(v17);
  if (Count != v12)
  {
    uint64_t v36 = "Key without value";
    uint64_t v37 = 3892330503;
    int v38 = 71;
    goto LABEL_33;
  }
  if (!Count)
  {
    CFArrayRef Copy = CFDictionaryCreate(0, 0, 0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
LABEL_26:
    uint64_t v5 = 0;
    *a5 = Copy;
    if (!Mutable) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  CFIndex v27 = CFArrayGetCount(Mutable);
  char v28 = (const void **)CFAllocatorAllocate(0, 16 * v27, 0);
  if (v28)
  {
    uint64_t v33 = v28;
    v42.location = 0;
    v42.length = Count;
    CFArrayGetValues(Mutable, v42, v28);
    v43.length = CFArrayGetCount(v17);
    v43.location = 0;
    CFArrayGetValues(v17, v43, &v33[Count]);
    *a5 = CFDictionaryCreate(0, v33, &v33[Count], Count, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
    CFAllocatorDeallocate(0, v33);
    uint64_t v5 = 0;
    if (!Mutable) {
      goto LABEL_28;
    }
LABEL_27:
    CFRelease(Mutable);
    goto LABEL_28;
  }
  uint64_t v39 = __AFCSetErrorResult_2(0, v29, 3892330499, v30, 78, "CFAllocatorAllocate failed for %d keys", v31, v32, Count);
LABEL_34:
  uint64_t v5 = v39;
  if (Mutable) {
    goto LABEL_27;
  }
LABEL_28:
  if (v17) {
    CFRelease(v17);
  }
  return v5;
}

uint64_t __AFCSetErrorResult_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, const char *a6, uint64_t a7, uint64_t a8, char a9)
{
  return AFCSetErrorInfoWithArgs(0, 0xFFFFFFFFLL, a3, "/Library/Caches/com.apple.xbs/Sources/AppleFileConduit/connection.c", a5, a6, &a9);
}

void __AFCConnectionPerformOperationCallBack(uint64_t a1)
{
  AFCLog(5, "%s(%p)\n", "__AFCConnectionPerformOperationCallBack", (const void *)a1);
  AFCLockLock(*(void *)(a1 + 136));
  CFRetain((CFTypeRef)a1);
  if (*(_DWORD *)(a1 + 16) == 1)
  {
    while (CFArrayGetCount(*(CFArrayRef *)(a1 + 160)) < *(int *)(a1 + 112))
    {
      AFCLockUnlock(*(void *)(a1 + 136));
      CFAllocatorRef v2 = __AFCDequeue(a1, *(const __CFArray **)(a1 + 152));
      if (!v2)
      {
        AFCLockLock(*(void *)(a1 + 136));
        break;
      }
      uint64_t v3 = v2;
      if (__AFCConnectionSendOperation(a1, (uint64_t)v2))
      {
        __AFCConnectionNotifyOperationComplete(a1, v3);
        CFRelease(v3);
      }
      else
      {
        __AFCEnqueue(a1, *(__CFArray **)(a1 + 160), v3);
        v3[6] = 4;
      }
      AFCLockLock(*(void *)(a1 + 136));
      if (*(_DWORD *)(a1 + 16) != 1) {
        break;
      }
    }
  }
  int v4 = *(unsigned __int8 *)(a1 + 32);
  if (*(unsigned char *)(a1 + 32))
  {
    *(unsigned char *)(a1 + 32) = 0;
    __AFCConnectionUnscheduleFromRunLoop(a1);
  }
  AFCLockUnlock(*(void *)(a1 + 136));
  if (*(_DWORD *)(a1 + 16) == 2) {
    __AFCConnectionInvalidate((const void *)a1);
  }
  if (v4) {
    AFCConditionSignal(*(void *)(a1 + 40));
  }

  CFRelease((CFTypeRef)a1);
}

const void *__AFCDequeue(uint64_t a1, const __CFArray *a2)
{
  AFCLockLock(*(void *)(a1 + 136));
  if (CFArrayGetCount(a2) < 1)
  {
    ValueAtIndex = 0;
  }
  else
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a2, 0);
    CFArrayRemoveValueAtIndex(a2, 0);
  }
  AFCLockUnlock(*(void *)(a1 + 136));
  return ValueAtIndex;
}

uint64_t __AFCConnectionSendOperation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 88);
  DataCFIndex Length = __AFCOperationGetDataLength(a2);
  BytePtr = *(const UInt8 **)(a2 + 64);
  if (BytePtr)
  {
    BytePtr = CFDataGetBytePtr((CFDataRef)BytePtr);
    CFStringRef v11 = (UInt8 *)BytePtr;
    if (!DataLength) {
      goto LABEL_6;
    }
  }
  else
  {
    CFStringRef v11 = 0;
    if (!DataLength) {
      goto LABEL_6;
    }
  }
  if (!v11) {
    return __AFCSetErrorResult_2((uint64_t)BytePtr, v5, 3892330503, v6, 1231, "Invalid data buffer in operation (%p, %d)", v7, v8, 0);
  }
LABEL_6:
  AFCLockLock(*(void *)(a1 + 136));
  uint64_t v12 = *(void *)(a1 + 80);
  *(void *)(a1 + 80) = v12 + 1;
  *(void *)(v4 + 24) = v12;
  AFCLockUnlock(*(void *)(a1 + 136));
  uint64_t v13 = AFCSendPacket(a1, v4, v11, DataLength);
  if (v13)
  {
    CFDictionaryRef ErrorInfo = AFCCopyAndClearLastErrorInfo();
    __AFCOperationSetClientErrorWithInfo(a2, v13, (uint64_t)ErrorInfo);
    if (ErrorInfo) {
      CFRelease(ErrorInfo);
    }
  }
  return v13;
}

uint64_t __AFCConnectionNotifyOperationComplete(void *a1, uint64_t a2)
{
  AFCLog(5, "%s(%p, %p) [%lu]\n", "__AFCConnectionNotifyOperationComplete", a1, (const void *)a2, *(void *)(a2 + 32) & 1);
  *(_DWORD *)(a2 + 24) = 5;
  uint64_t v4 = (void (*)(void *, uint64_t, uint64_t))a1[27];
  if (v4 && (*(unsigned char *)(a2 + 32) & 1) == 0) {
    v4(a1, 1, a2);
  }
  __AFCConnectionSignalIOLoop((uint64_t)a1);
  uint64_t v5 = *(void *)(a2 + 256);

  return AFCConditionSignal(v5);
}

uint64_t __AFCEnqueue(uint64_t a1, __CFArray *a2, const void *a3)
{
  AFCLockLock(*(void *)(a1 + 136));
  CFArrayAppendValue(a2, a3);
  CFArrayGetCount(a2);
  uint64_t v6 = *(void *)(a1 + 136);

  return AFCLockUnlock(v6);
}

void __AFCConnectionUnscheduleFromRunLoop(uint64_t a1)
{
  AFCLog(5, "__AFCConnectionUnscheduleFromRunLoop(%p)", (const void *)a1);
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 160)) > 0 || CFArrayGetCount(*(CFArrayRef *)(a1 + 152)) >= 1) {
    AFCLog(1, "WARNING: unscheduling from run loop with outstanding requests!");
  }
  CFAllocatorRef v2 = *(__CFRunLoop **)(a1 + 192);
  if (v2)
  {
    uint64_t v3 = *(__CFRunLoopSource **)(a1 + 176);
    if (v3)
    {
      CFRunLoopRemoveSource(v2, v3, *(CFRunLoopMode *)(a1 + 200));
      CFRelease(*(CFTypeRef *)(a1 + 176));
      *(void *)(a1 + 176) = 0;
      CFAllocatorRef v2 = *(__CFRunLoop **)(a1 + 192);
    }
    uint64_t v4 = *(__CFRunLoopSource **)(a1 + 184);
    if (v4)
    {
      CFRunLoopRemoveSource(v2, v4, *(CFRunLoopMode *)(a1 + 200));
      CFRelease(*(CFTypeRef *)(a1 + 184));
      *(void *)(a1 + 184) = 0;
      CFAllocatorRef v2 = *(__CFRunLoop **)(a1 + 192);
    }
    CFRelease(v2);
    *(void *)(a1 + 192) = 0;
    CFRelease(*(CFTypeRef *)(a1 + 200));
    *(void *)(a1 + 200) = 0;
  }
}

void __AFCConnectionInvalidate(const void *a1)
{
  CFTypeRef v1 = a1;
  uint64_t __buf = (uint64_t)a1;
  AFCLog(5, "__AFCConnectionInvalidate(%p)", a1);
  AFCLockLock(*((void *)v1 + 17));
  int v2 = *((_DWORD *)v1 + 4);
  if (v2 == 1)
  {
    AFCLog(2, "Warning: connection %p state going from valid->invalid", v1);
  }
  else if (!v2)
  {
    uint64_t v3 = *((void *)v1 + 17);
    AFCLockUnlock(v3);
    return;
  }
  *((_DWORD *)v1 + 4) = 0;
  CFRetain(v1);
  uint64_t v4 = (__CFSocket *)*((void *)v1 + 6);
  if (v4)
  {
    CFSocketInvalidate(v4);
    CFRelease(*((CFTypeRef *)v1 + 6));
    *((void *)v1 + 6) = 0;
  }
  int v5 = *((_DWORD *)v1 + 14);
  if (v5 != -1 && *((unsigned char *)v1 + 60))
  {
    shutdown(v5, 2);
    close(*((_DWORD *)v1 + 14));
    *((_DWORD *)v1 + 14) = -1;
  }
  int v6 = *((_DWORD *)v1 + 316);
  if (v6 != -1)
  {
    write(v6, &__buf, 1uLL);
    CFTypeRef v1 = (CFTypeRef)__buf;
  }
  uint64_t v7 = (__CFRunLoopSource *)*((void *)v1 + 22);
  if (v7)
  {
    CFRunLoopSourceInvalidate(v7);
    CFTypeRef v1 = (CFTypeRef)__buf;
    *(void *)(__buf + 176) = 0;
  }
  uint64_t v8 = (__CFRunLoopSource *)*((void *)v1 + 23);
  if (v8)
  {
    CFRunLoopSourceInvalidate(v8);
    CFTypeRef v1 = (CFTypeRef)__buf;
    *(void *)(__buf + 184) = 0;
  }
  uint64_t v9 = __AFCDequeue((uint64_t)v1, *((const __CFArray **)v1 + 19));
  if (v9)
  {
    uint64_t v13 = v9;
    do
    {
      __AFCOperationSetClientError((uint64_t)v13, 3892330507, "/Library/Caches/com.apple.xbs/Sources/AppleFileConduit/connection.c", 970, "Connection invalidated", v10, v11, v12, v21);
      __AFCConnectionNotifyOperationComplete(__buf, v13);
      CFRelease(v13);
      uint64_t v13 = __AFCDequeue(__buf, *(const __CFArray **)(__buf + 152));
    }
    while (v13);
  }
  uint64_t v14 = __AFCDequeue(__buf, *(const __CFArray **)(__buf + 160));
  if (v14)
  {
    BOOL v18 = v14;
    do
    {
      __AFCOperationSetClientError((uint64_t)v18, 3892330507, "/Library/Caches/com.apple.xbs/Sources/AppleFileConduit/connection.c", 982, "Connection invalidated", v15, v16, v17, v21);
      __AFCConnectionNotifyOperationComplete(__buf, v18);
      CFRelease(v18);
      BOOL v18 = __AFCDequeue(__buf, *(const __CFArray **)(__buf + 160));
    }
    while (v18);
  }
  AFCConditionSignal(*(void *)(__buf + 24));
  uint64_t v19 = __buf;
  char v20 = *(void (**)(void))(__buf + 216);
  if (v20)
  {
    v20();
    uint64_t v19 = __buf;
  }
  AFCLockUnlock(*(void *)(v19 + 136));
  CFRelease((CFTypeRef)__buf);
}

uint64_t __AFCConnectionProcessData(uint64_t a1)
{
  AFCLockLock(*(void *)(a1 + 136));
  CFRetain((CFTypeRef)a1);
  int v2 = *(unsigned __int8 *)(a1 + 32);
  if (*(unsigned char *)(a1 + 32))
  {
    *(unsigned char *)(a1 + 32) = 0;
    __AFCConnectionUnscheduleFromRunLoop(a1);
  }
  uint64_t v3 = 3892330507;
  AFCLockUnlock(*(void *)(a1 + 136));
  if (AFCSocketIsDisconnected(*(_DWORD *)(a1 + 56)))
  {
    AFCLog(5, "Socket closed for connection %p.");
  }
  else
  {
    uint64_t v4 = __AFCDequeue(a1, *(const __CFArray **)(a1 + 160));
    if (v4)
    {
      int v5 = v4;
      uint64_t v6 = __AFCConnectionReceiveOperation((void *)a1, (uint64_t)v4);
      if (v6 != -402636789)
      {
        uint64_t v8 = v6;
        __AFCConnectionNotifyOperationComplete((void *)a1, (uint64_t)v5);
        CFRelease(v5);
        uint64_t v3 = v8;
        if (!v2) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
      AFCLog(5, "Socket closed when reading on connection %p.", (const void *)a1);
      __AFCConnectionNotifyOperationComplete((void *)a1, (uint64_t)v5);
      CFRelease(v5);
    }
    else
    {
      AFCLog(1, "Data received on connection %p when no reply expected.");
    }
  }
  *(_DWORD *)(a1 + 16) = 2;
  __AFCConnectionInvalidate((const void *)a1);
  if (v2) {
LABEL_10:
  }
    AFCConditionSignal(*(void *)(a1 + 40));
LABEL_11:
  CFRelease((CFTypeRef)a1);
  return v3;
}

uint64_t __AFCConnectionReceiveOperation(void *a1, uint64_t a2)
{
  uint64_t v10 = 0;
  CFRetain(a1);
  uint64_t v4 = AFCReadPacketHeader((uint64_t)a1, *(void *)(a2 + 88), *(void *)(a2 + 104), &v10);
  if (v4 == -402636789)
  {
    AFCLog(5, "Socket closed when reading.\n");
    AFCConnectionInvalidate(a1);
    uint64_t v5 = 3892330507;
  }
  else
  {
    uint64_t v5 = v4;
    uint64_t v6 = v10;
    if (v10)
    {
      uint64_t v7 = *(void **)(a2 + 88);
      if (v7)
      {
        CFAllocatorDeallocate(*(CFAllocatorRef *)(a2 + 96), v7);
        uint64_t v6 = v10;
      }
      *(void *)(a2 + 88) = v6;
      *(void *)(a2 + 96) = CFGetAllocator(a1);
    }
    if (v5 || (uint64_t v5 = __AFCConnectionDispatchReply((uint64_t)a1, a2), v5))
    {
      CFDictionaryRef ErrorInfo = AFCCopyAndClearLastErrorInfo();
      __AFCOperationSetClientErrorWithInfo(a2, v5, (uint64_t)ErrorInfo);
      if (ErrorInfo) {
        CFRelease(ErrorInfo);
      }
    }
  }
  CFRelease(a1);
  return v5;
}

uint64_t __AFCConnectionAddFileDescriptor(uint64_t a1, const void *a2)
{
  AFCLockLock(*(void *)(a1 + 136));
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 168), a2);
  uint64_t v4 = *(void *)(a1 + 136);

  return AFCLockUnlock(v4);
}

uint64_t __AFCConnectionRemoveFileDescriptor(uint64_t a1, const void *a2)
{
  AFCLockLock(*(void *)(a1 + 136));
  CFSetRemoveValue(*(CFMutableSetRef *)(a1 + 168), a2);
  uint64_t v4 = *(void *)(a1 + 136);

  return AFCLockUnlock(v4);
}

size_t __AFCConnectionSetRoot(uint64_t a1, CFStringRef string)
{
  *(unsigned char *)(a1 + 224) = 0;
  uint64_t v3 = a1 + 224;
  CFStringGetFileSystemRepresentation(string, (char *)(a1 + 224), 1023);
  size_t result = strlen((const char *)v3);
  *(void *)(v3 + 1024) = result;
  if (result)
  {
    if (*(unsigned char *)(result + a1 + 223) != 47)
    {
      *(void *)(a1 + 1248) = result + 1;
      uint64_t v5 = a1 + 224;
      *(unsigned char *)(v5 + result) = 47;
      *(unsigned char *)(v5 + *(void *)(a1 + 1248)) = 0;
    }
  }
  return result;
}

uint64_t AFCConnectionCreate(const __CFAllocator *a1, CFSocketNativeHandle a2, int a3, uint64_t a4, uint64_t a5)
{
  pthread_once(&AFCConnectionGetTypeID_typeIDInit, (void (*)(void))__AFCConnectionRegisterClass);
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v11 = Instance;
  if (!Instance) {
    goto LABEL_11;
  }
  bzero((void *)(Instance + 16), 0x4E8uLL);
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = (void *)v11;
  uint64_t v12 = CFSocketCreateWithNative(a1, a2, 1uLL, (CFSocketCallBack)__AFCConnectionSocketCallBack, &context);
  *(void *)(v11 + 48) = v12;
  if (v12)
  {
    CFSocketSetSocketFlags(v12, 1uLL);
    AFCSetSocketOptions((const void *)v11, a2);
    CFMutableArrayRef Mutable = CFArrayCreateMutable(a1, 0, MEMORY[0x263EFFF70]);
    *(void *)(v11 + 152) = Mutable;
    if (Mutable)
    {
      CFMutableArrayRef v14 = CFArrayCreateMutable(a1, 0, MEMORY[0x263EFFF70]);
      *(void *)(v11 + 160) = v14;
      if (v14)
      {
        CFMutableSetRef v15 = CFSetCreateMutable(a1, 0, 0);
        *(void *)(v11 + 168) = v15;
        if (v15)
        {
          *(_DWORD *)(v11 + 56) = a2;
          *(unsigned char *)(v11 + 60) = a3 != 0;
          *(void *)(v11 + 216) = a4;
          *(_DWORD *)(v11 + 64) = 0;
          *(unsigned char *)(v11 + 68) = 0;
          *(_OWORD *)(v11 + 80) = xmmword_2210CEC60;
          *(void *)(v11 + 96) = 0x100000;
          *(void *)(v11 + 120) = a5;
          uint64_t v16 = AFCLockCreate();
          *(void *)(v11 + 136) = v16;
          if (v16)
          {
            uint64_t v17 = AFCLockCreate();
            *(void *)(v11 + 144) = v17;
            if (v17)
            {
              *(void *)(v11 + 104) = 60;
              *(_DWORD *)(v11 + 112) = 1;
              *(_DWORD *)(v11 + 1256) = kqueue();
              *(_DWORD *)(v11 + 16) = 1;
              uint64_t v18 = AFCConditionCreate();
              *(void *)(v11 + 40) = v18;
              if (v18)
              {
                uint64_t v19 = AFCConditionCreate();
                *(void *)(v11 + 24) = v19;
                if (v19)
                {
                  AFCCreateSignalFileDescriptors((int *)(v11 + 1260), (int *)(v11 + 1264));
LABEL_11:
                  AFCLog(5, "%s(%p)\n", "AFCConnectionCreate", (const void *)v11);
                  return v11;
                }
              }
            }
          }
        }
      }
    }
  }
  char v21 = *(const void **)(v11 + 136);
  if (v21) {
    CFRelease(v21);
  }
  uint64_t v22 = *(const void **)(v11 + 152);
  if (v22) {
    CFRelease(v22);
  }
  uint64_t v23 = *(const void **)(v11 + 160);
  if (v23) {
    CFRelease(v23);
  }
  int v24 = *(const void **)(v11 + 168);
  if (v24) {
    CFRelease(v24);
  }
  char v25 = *(const void **)(v11 + 48);
  if (v25) {
    CFRelease(v25);
  }
  CFRelease((CFTypeRef)v11);
  return 0;
}

uint64_t AFCConnectionGetTypeID()
{
  return __gAFCConnectionTypeID;
}

uint64_t __AFCConnectionSocketCallBack(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 == 1) {
    return __AFCConnectionProcessData(a5);
  }
  return result;
}

uint64_t AFCConnectionSetCallBack(uint64_t a1, uint64_t a2)
{
  AFCLockLock(*(void *)(a1 + 136));
  *(void *)(a1 + 216) = a2;
  uint64_t v4 = *(void *)(a1 + 136);

  return AFCLockUnlock(v4);
}

uint64_t __AFCConnectionRegisterClass()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __gAFCConnectionTypeID = result;
  return result;
}

uint64_t AFCConnectionInvalidate(void *a1)
{
  uint64_t v1 = (uint64_t)a1;
  uint64_t __buf = a1;
  AFCLog(5, "AFCConnectionInvalidate(%p)", a1);
  AFCLockLock(*(void *)(v1 + 136));
  if (*(_DWORD *)(v1 + 16) == 1)
  {
    *(_DWORD *)(v1 + 16) = 2;
    AFCLockUnlock(*(void *)(v1 + 136));
    int v2 = *(_DWORD *)(v1 + 1264);
    if (v2 != -1)
    {
      write(v2, &__buf, 1uLL);
      uint64_t v1 = (uint64_t)__buf;
    }
    __AFCConnectionSignalIOLoop(v1);
    AFCConditionWait(__buf[3], (double)(4 * __buf[13]));
    return AFCLog(5, "AFCConnectionInvalidate done");
  }
  else
  {
    uint64_t v4 = *(void *)(v1 + 136);
    return AFCLockUnlock(v4);
  }
}

void __AFCConnectionSignalIOLoop(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 16))
  {
    int v2 = *(const void **)(a1 + 192);
    if (v2 && *(void *)(a1 + 184) && (CFRunLoopRef Current = CFRunLoopGetCurrent(), !CFEqual(v2, Current)))
    {
      CFRunLoopSourceSignal(*(CFRunLoopSourceRef *)(a1 + 184));
      uint64_t v4 = *(__CFRunLoop **)(a1 + 192);
      CFRunLoopWakeUp(v4);
    }
    else
    {
      __AFCConnectionPerformOperationCallBack(a1);
    }
  }
  else
  {
    AFCLog(4, "SignalIOLoop on an invalid connection");
  }
}

uint64_t AFCConnectionGetIOTimeout(uint64_t a1)
{
  return *(void *)(a1 + 104);
}

BOOL AFCConnectionIsValid(uint64_t a1)
{
  return *(_DWORD *)(a1 + 16) == 1;
}

uint64_t AFCConnectionScheduleWithRunLoop(uint64_t a1, void *a2, const __CFString *a3)
{
  AFCLockLock(*(void *)(a1 + 136));
  if (*(_DWORD *)(a1 + 16) == 1)
  {
    if (*(void *)(a1 + 192))
    {
      uint64_t v6 = 3892330503;
      AFCLog(2, "Trying to add to run loop when already on run loop");
    }
    else
    {
      *(void *)(a1 + 192) = CFRetain(a2);
      *(void *)(a1 + 200) = CFStringCreateCopy(0, a3);
      if (!*(void *)(a1 + 176))
      {
        CFAllocatorRef v7 = CFGetAllocator((CFTypeRef)a1);
        RunLoopSource = CFSocketCreateRunLoopSource(v7, *(CFSocketRef *)(a1 + 48), 200);
        *(void *)(a1 + 176) = RunLoopSource;
        CFRunLoopAddSource((CFRunLoopRef)a2, RunLoopSource, a3);
        CFSocketEnableCallBacks(*(CFSocketRef *)(a1 + 48), 1uLL);
      }
      if (!*(void *)(a1 + 184))
      {
        v12.version = 0;
        memset(&v12.retain, 0, 56);
        v12.info = (void *)a1;
        v12.perform = (void (__cdecl *)(void *))__AFCConnectionPerformOperationCallBack;
        CFAllocatorRef v9 = CFGetAllocator((CFTypeRef)a1);
        uint64_t v10 = CFRunLoopSourceCreate(v9, 100, &v12);
        *(void *)(a1 + 184) = v10;
        CFRunLoopAddSource((CFRunLoopRef)a2, v10, a3);
      }
      AFCLockUnlock(*(void *)(a1 + 136));
      return 0;
    }
  }
  else
  {
    AFCLockUnlock(*(void *)(a1 + 136));
    return 3892330507;
  }
  return v6;
}

uint64_t AFCConnectionUnscheduleFromRunLoop(uint64_t a1, const void *a2)
{
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  AFCLog(5, "%s(%p, %p) [%p]", "AFCConnectionUnscheduleFromRunLoop", (const void *)a1, a2, Current);
  AFCConnectionInvalidate((void *)a1);
  AFCLockLock(*(void *)(a1 + 136));
  if (*(void *)(a1 + 192))
  {
    if (*(_DWORD *)(a1 + 16))
    {
      *(unsigned char *)(a1 + 32) = 1;
      AFCLockUnlock(*(void *)(a1 + 136));
      __AFCConnectionSignalIOLoop(a1);
      AFCConditionWait(*(void *)(a1 + 40), (double)(4 * *(void *)(a1 + 104)));
      return AFCLog(5, "%s(%p, %p) finished", "AFCConnectionUnscheduleFromRunLoop", (const void *)a1, a2);
    }
    AFCLog(5, "Connection %p already invalid, just unscheduling", (const void *)a1);
    __AFCConnectionUnscheduleFromRunLoop(a1);
  }
  else
  {
    AFCLog(5, "Connection %p already unscheduled", (const void *)a1);
  }
  uint64_t v6 = *(void *)(a1 + 136);

  return AFCLockUnlock(v6);
}

uint64_t __AFCConnectionDispatchReply(uint64_t a1, uint64_t a2)
{
  AFCLockLock(*(void *)(a2 + 248));
  uint64_t v4 = *(void *)(a2 + 88);
  if (v4)
  {
    uint64_t v5 = *(void *)(a2 + 48);
    uint64_t v6 = *(void *)(v4 + 32);
    AFCLockUnlock(*(void *)(a2 + 248));
    CFAllocatorRef v7 = __AFCProcessStatusPacket;
    for (uint64_t i = &qword_26D2E8D90; ; i += 3)
    {
      uint64_t v9 = *(i - 1);
      BOOL v10 = !v9 || v9 == v5;
      if (v10 && *i == v6) {
        break;
      }
      CFAllocatorRef v7 = (uint64_t (*)(uint64_t, uint64_t))i[4];
      if (!v7)
      {
        uint64_t result = 3892330502;
        *(_DWORD *)(a2 + 24) = 5;
        return result;
      }
    }
    *(_DWORD *)(a2 + 24) = 5;
    return v7(a1, a2);
  }
  else
  {
    AFCLockUnlock(*(void *)(a2 + 248));
    return 3892330519;
  }
}

uint64_t AFCConnectionSubmitOperation(uint64_t a1, _DWORD *a2)
{
  if (*(_DWORD *)(a1 + 16) != 1) {
    return 3892330507;
  }
  CFRetain(a2);
  a2[6] = 2;
  __AFCEnqueue(a1, *(__CFArray **)(a1 + 152), a2);
  __AFCConnectionSignalIOLoop(a1);
  return 0;
}

uint64_t AFCConnectionProcessOperation(uint64_t a1, uint64_t a2, double a3)
{
  double v3 = a3;
  AFCLog(5, "AFCConnectionProcessOperation(%p, %p, %g)", (const void *)a1, (const void *)a2, a3);
  AFCLockLock(*(void *)(a1 + 136));
  if (*(_DWORD *)(a1 + 16) == 1)
  {
    CFRetain((CFTypeRef)a1);
    uint64_t v6 = *(const void **)(a1 + 192);
    if (!v6)
    {
      AFCLockUnlock(*(void *)(a1 + 136));
      AFCLockLock(*(void *)(a1 + 144));
      uint64_t v11 = __AFCConnectionSendOperation(a1, a2);
      if (!v11)
      {
        *(_DWORD *)(a2 + 24) = 4;
        uint64_t v11 = __AFCConnectionReceiveOperation((void *)a1, a2);
      }
      AFCLockUnlock(*(void *)(a1 + 144));
      if (v11)
      {
        if (v11 == -402636789)
        {
          AFCLog(5, "Socket closed when reading.\n");
          __AFCConnectionInvalidate((const void *)a1);
        }
        if (!*(_DWORD *)(a2 + 40))
        {
          CFDictionaryRef ErrorInfo = AFCCopyAndClearLastErrorInfo();
          __AFCOperationSetClientErrorWithInfo(a2, v11, (uint64_t)ErrorInfo);
          if (ErrorInfo) {
            CFRelease(ErrorInfo);
          }
        }
      }
      __AFCConnectionNotifyOperationComplete((void *)a1, a2);
      goto LABEL_28;
    }
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    int v8 = CFEqual(v6, Current);
    AFCLockUnlock(*(void *)(a1 + 136));
    uint64_t v9 = AFCConnectionSubmitOperation(a1, (_DWORD *)a2);
    if (v9)
    {
      uint64_t v11 = v9;
      goto LABEL_28;
    }
    uint64_t v10 = *(void *)(a2 + 256);
    if (v8)
    {
      if (AFCConditionIsSignaled(v10))
      {
LABEL_6:
        uint64_t v11 = 0;
LABEL_28:
        CFRelease((CFTypeRef)a1);
        AFCLog(5, "ProcessOperation(%p) = %x", (const void *)a2, v11);
        return v11;
      }
      uint64_t v11 = 3892330507;
      while (1)
      {
        double v13 = CFAbsoluteTimeGetCurrent();
        CFRunLoopRunResult v14 = CFRunLoopRunInMode(@"AFCRunLoopMode", v3, 1u);
        if (v14 != kCFRunLoopRunHandledSource) {
          break;
        }
        if (v3 != 0.0)
        {
          double v3 = v3 - (CFAbsoluteTimeGetCurrent() - v13);
          if (v3 <= 0.0) {
            goto LABEL_27;
          }
        }
        if (AFCConditionIsSignaled(*(void *)(a2 + 256))) {
          goto LABEL_6;
        }
      }
      if ((v14 - 1) < 2) {
        goto LABEL_28;
      }
      if (v14 != kCFRunLoopRunTimedOut)
      {
        uint64_t v11 = 3892330497;
        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v11 = AFCConditionWait(v10, v3);
      if (v11 != -402636788) {
        goto LABEL_28;
      }
    }
LABEL_27:
    AFCLog(1, "Operation %p timed out!", (const void *)a2);
    uint64_t v11 = 3892330508;
    goto LABEL_28;
  }
  AFCLockUnlock(*(void *)(a1 + 136));
  return 3892330507;
}

uint64_t AFCConnectionProcessOperations(uint64_t a1, CFTimeInterval a2)
{
  if (*(_DWORD *)(a1 + 16) == 1) {
    return __AFCConnectionProcessOperations(a1, a2);
  }
  else {
    return 3892330507;
  }
}

uint64_t AFCConnectionGetStatus(uint64_t a1)
{
  if (!a1) {
    return 3892330503;
  }
  if (*(unsigned char *)(a1 + 68)) {
    return *(unsigned int *)(a1 + 64);
  }
  return 0;
}

uint64_t AFCConnectionCopyLastErrorInfo(uint64_t a1)
{
  AFCLockLock(*(void *)(a1 + 136));
  uint64_t v2 = *(void *)(a1 + 72);
  if (v2) {
    CFRetain(*(CFTypeRef *)(a1 + 72));
  }
  AFCLockUnlock(*(void *)(a1 + 136));
  return v2;
}

uint64_t AFCConnectionGetContext(uint64_t a1)
{
  return *(void *)(a1 + 120);
}

uint64_t AFCConnectionSetContext(uint64_t a1, uint64_t a2)
{
  AFCLockLock(*(void *)(a1 + 136));
  *(void *)(a1 + 120) = a2;
  uint64_t v4 = *(void *)(a1 + 136);

  return AFCLockUnlock(v4);
}

uint64_t AFCConnectionGetSecureContext(uint64_t a1)
{
  return *(void *)(a1 + 208);
}

uint64_t AFCConnectionSetSecureContext(uint64_t a1, uint64_t a2)
{
  AFCLockLock(*(void *)(a1 + 136));
  *(void *)(a1 + 208) = a2;
  uint64_t v4 = *(void *)(a1 + 136);

  return AFCLockUnlock(v4);
}

uint64_t AFCConnectionSetDisposeSecureContextOnInvalidate(uint64_t result, char a2)
{
  *(unsigned char *)(result + 61) = a2;
  return result;
}

uint64_t AFCConnectionSetIOTimeout(uint64_t a1, uint64_t a2)
{
  AFCLockLock(*(void *)(a1 + 136));
  *(void *)(a1 + 104) = a2;
  uint64_t v4 = *(void *)(a1 + 136);

  return AFCLockUnlock(v4);
}

uint64_t AFCConnectionSetFatalError(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 64) = a2;
  *(unsigned char *)(a1 + 68) = 1;
  AFCLockUnlock(*(void *)(a1 + 136));
  return a2;
}

uint64_t __AFCConnectionGetRequestPath(uint64_t a1, char *__src, char *a3, size_t __size)
{
  size_t v4 = __size;
  if (!*(unsigned char *)(a1 + 224)) {
    goto LABEL_4;
  }
  size_t v8 = *(void *)(a1 + 1248);
  if (v8 < __size)
  {
    memcpy(a3, (const void *)(a1 + 224), v8);
    uint64_t v9 = *(void *)(a1 + 1248);
    a3 += v9;
    v4 -= v9;
LABEL_4:
    AFCStringCopy(a3, v4, __src, 0);
    return 1;
  }
  return 0;
}

void __AFCConnectionFinalize(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 136);
  AFCLog(5, "%s(%p)", "__AFCConnectionFinalize", (const void *)a1);
  AFCLockLock((uint64_t)v2);
  int v3 = *(_DWORD *)(a1 + 16);
  if (v3 == 1)
  {
    AFCLog(1, "Finalizing connection %p which is still valid");
  }
  else if (v3 == 2)
  {
    AFCLog(1, "Finalizing connection %p which has requested invalidation");
  }
  CFSetRef Copy = CFSetCreateCopy(0, *(CFSetRef *)(a1 + 168));
  CFSetApplyFunction(Copy, (CFSetApplierFunction)__AFCConnectionInvalidateFileDescriptor, (void *)a1);
  CFRelease(Copy);
  uint64_t v5 = *(__CFSocket **)(a1 + 48);
  if (v5)
  {
    CFSocketInvalidate(v5);
    CFRelease(*(CFTypeRef *)(a1 + 48));
    *(void *)(a1 + 48) = 0;
  }
  uint64_t v6 = *(SSLContext **)(a1 + 208);
  if (v6 && *(unsigned char *)(a1 + 60) && *(unsigned char *)(a1 + 61))
  {
    SSLClose(v6);
    CFRelease(*(CFTypeRef *)(a1 + 208));
  }
  *(void *)(a1 + 208) = 0;
  CFAllocatorRef v7 = *(const void **)(a1 + 144);
  if (v7)
  {
    AFCLockLock(*(void *)(a1 + 144));
    *(void *)(a1 + 144) = 0;
    AFCLockUnlock((uint64_t)v7);
    AFCLockFree(v7);
  }
  int v8 = *(_DWORD *)(a1 + 1256);
  if (v8 != -1)
  {
    close(v8);
    *(_DWORD *)(a1 + 1256) = -1;
  }
  int v9 = *(_DWORD *)(a1 + 1260);
  if (v9 != -1)
  {
    close(v9);
    *(_DWORD *)(a1 + 1260) = -1;
  }
  int v10 = *(_DWORD *)(a1 + 1264);
  if (v10 != -1)
  {
    close(v10);
    *(_DWORD *)(a1 + 1264) = -1;
  }
  uint64_t v11 = *(const void **)(a1 + 160);
  if (v11) {
    CFRelease(v11);
  }
  CFRunLoopSourceContext v12 = *(const void **)(a1 + 152);
  if (v12) {
    CFRelease(v12);
  }
  double v13 = *(const void **)(a1 + 168);
  if (v13) {
    CFRelease(v13);
  }
  CFRunLoopRunResult v14 = *(const void **)(a1 + 184);
  if (v14) {
    CFRelease(v14);
  }
  CFMutableSetRef v15 = *(const void **)(a1 + 176);
  if (v15) {
    CFRelease(v15);
  }
  uint64_t v16 = *(const void **)(a1 + 192);
  if (v16) {
    CFRelease(v16);
  }
  uint64_t v17 = *(const void **)(a1 + 200);
  if (v17) {
    CFRelease(v17);
  }
  uint64_t v18 = *(const void **)(a1 + 72);
  if (v18) {
    CFRelease(v18);
  }
  uint64_t v19 = *(const void **)(a1 + 40);
  if (v19) {
    CFRelease(v19);
  }
  char v20 = *(const void **)(a1 + 24);
  if (v20) {
    CFRelease(v20);
  }
  *(void *)(a1 + 136) = 0;
  AFCLockUnlock((uint64_t)v2);

  AFCLockFree(v2);
}

__CFString *__AFCConnectionCopyDescription(uint64_t a1)
{
  CFAllocatorRef v2 = CFGetAllocator((CFTypeRef)a1);
  AFCLockLock(*(void *)(a1 + 136));
  CFMutableArrayRef Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, @"<AFCConnection %p [%p]> {\n", a1, v2);
  CFStringAppendFormat(Mutable, 0, @"  FileDescriptor = %d\n", *(unsigned int *)(a1 + 56));
  CFStringAppendFormat(Mutable, 0, @"  LastError = %d\n", *(unsigned int *)(a1 + 64));
  CFStringAppendFormat(Mutable, 0, @"  FatalError = %d\n", *(unsigned int *)(a1 + 64));
  CFStringAppendFormat(Mutable, 0, @"  MaxOperations = %d\n", *(unsigned int *)(a1 + 112));
  CFStringAppendFormat(Mutable, 0, @"}");
  AFCLockUnlock(*(void *)(a1 + 136));
  return Mutable;
}

uint64_t __AFCProcessStatusPacket(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 3892330499;
  uint64_t v5 = *(void *)(a2 + 88);
  DataCFIndex Length = __AFCOperationGetDataLength(a2);
  CFTypeRef cf = 0;
  CFAllocatorRef v7 = CFGetAllocator((CFTypeRef)a2);
  CFAllocatorRef v8 = v7;
  if (DataLength < 1)
  {
    int v10 = 0;
  }
  else
  {
    int v9 = (char *)CFAllocatorAllocate(v7, DataLength, 0);
    if (!v9) {
      goto LABEL_21;
    }
    int v10 = v9;
    uint64_t v11 = AFCReadData(a1, v9, DataLength);
    if (v11)
    {
      uint64_t v4 = v11;
      goto LABEL_20;
    }
    CFAllocatorRef v12 = CFGetAllocator((CFTypeRef)a2);
    if (__AFCCreateDictionaryOrArrayFromData(v12, v10, DataLength, 1, (CFArrayRef *)&cf)) {
      CFTypeRef cf = 0;
    }
  }
  int v13 = *(_DWORD *)(v5 + 40);
  unsigned int v14 = v13 | 0xE8004000;
  if (!v13) {
    unsigned int v14 = 0;
  }
  *(_DWORD *)(a2 + 40) = v14;
  if (!v13)
  {
    uint64_t v4 = 0;
    *(void *)(a2 + 240) = CFRetain((CFTypeRef)*MEMORY[0x263EFFD08]);
    if (!v10) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  CFAllocatorRef v15 = CFGetAllocator((CFTypeRef)a2);
  CFDictionaryRef v16 = __AFCCreateErrorObject(v15, *(unsigned int *)(a2 + 40), (uint64_t)cf);
  *(void *)(a2 + 240) = v16;
  if (v16) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 3892330499;
  }
  AFCLockLock(*(void *)(a1 + 136));
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 40);
  uint64_t v17 = *(const void **)(a1 + 72);
  if (v17) {
    CFRelease(v17);
  }
  uint64_t v18 = *(const void **)(a2 + 240);
  *(void *)(a1 + 72) = v18;
  if (v18) {
    CFRetain(v18);
  }
  AFCLockUnlock(*(void *)(a1 + 136));
  if (v10) {
LABEL_20:
  }
    CFAllocatorDeallocate(v8, v10);
LABEL_21:
  if (cf) {
    CFRelease(cf);
  }
  return v4;
}

uint64_t __AFCProcessFileRefOpen(const void *a1, void *cf)
{
  uint64_t v4 = cf[11];
  CFAllocatorRef v5 = CFGetAllocator(cf);
  cf[30] = AFCFileDescriptorCreate((uint64_t)v5, a1, *(void *)(v4 + 40));
  uint64_t result = AFCDiscardBodyData((uint64_t)a1, v4);
  if (!result)
  {
    if (cf[30]) {
      return 0;
    }
    else {
      return 3892330499;
    }
  }
  return result;
}

uint64_t __AFCProcessDictReply(uint64_t a1, uint64_t a2)
{
  return __AFCProcessArrayOrDictReply(a1, a2, 1);
}

uint64_t __AFCProcessArrayReply(uint64_t a1, uint64_t a2)
{
  return __AFCProcessArrayOrDictReply(a1, a2, 0);
}

uint64_t __AFCProcessDataPacket(uint64_t a1, uint64_t a2)
{
  DataCFIndex Length = __AFCOperationGetDataLength(a2);
  CFAllocatorRef v5 = CFGetAllocator((CFTypeRef)a2);
  CFAllocatorRef v6 = v5;
  if (DataLength < 1)
  {
    CFDataRef v12 = CFDataCreate(v5, 0, 0);
    *(void *)(a2 + 240) = v12;
    if (v12) {
      return 0;
    }
    else {
      return 3892330499;
    }
  }
  else
  {
    uint64_t v7 = 3892330499;
    CFAllocatorRef v8 = *(char **)(a2 + 72);
    if (!v8)
    {
      int v9 = CFAllocatorAllocate(v5, DataLength, 0);
      *(void *)(a2 + 72) = v9;
      if (!v9) {
        return v7;
      }
      *(void *)(a2 + 80) = v6;
      CFRetain(v6);
      CFAllocatorRef v8 = *(char **)(a2 + 72);
    }
    uint64_t v10 = AFCReadData(a1, v8, DataLength);
    if (v10)
    {
      return v10;
    }
    else
    {
      CFDataRef v11 = CFDataCreateWithBytesNoCopy(v6, *(const UInt8 **)(a2 + 72), DataLength, *(CFAllocatorRef *)(a2 + 80));
      *(void *)(a2 + 240) = v11;
      if (v11)
      {
        *(void *)(a2 + 72) = 0;
        CFRelease(*(CFTypeRef *)(a2 + 80));
        uint64_t v7 = 0;
        *(void *)(a2 + 80) = 0;
      }
    }
  }
  return v7;
}

uint64_t __AFCProcessFileRefTell(uint64_t a1, void *cf)
{
  uint64_t v4 = cf[11];
  uint64_t valuePtr = *(void *)(v4 + 40);
  CFAllocatorRef v5 = CFGetAllocator(cf);
  cf[30] = CFNumberCreate(v5, kCFNumberSInt64Type, &valuePtr);
  uint64_t result = AFCDiscardBodyData(a1, v4);
  if (!result)
  {
    if (cf[30]) {
      return 0;
    }
    else {
      return 3892330499;
    }
  }
  return result;
}

uint64_t __AFCProcessArrayOrDictReply(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = 3892330499;
  DataCFIndex Length = __AFCOperationGetDataLength(a2);
  CFAllocatorRef v8 = CFGetAllocator((CFTypeRef)a2);
  CFAllocatorRef v9 = v8;
  uint64_t v10 = *(char **)(a2 + 72);
  if (!v10)
  {
    CFDataRef v11 = CFAllocatorAllocate(v8, DataLength, 0);
    *(void *)(a2 + 72) = v11;
    if (!v11) {
      return v6;
    }
    *(void *)(a2 + 80) = v9;
    CFRetain(v9);
    uint64_t v10 = *(char **)(a2 + 72);
  }
  uint64_t v12 = AFCReadData(a1, v10, DataLength);
  if (v12) {
    return v12;
  }
  unsigned int v13 = __AFCCreateDictionaryOrArrayFromData(v9, *(void **)(a2 + 72), DataLength, a3, (CFArrayRef *)(a2 + 240));
  if (v13) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = *(void *)(a2 + 240) == 0;
  }
  if (v14) {
    return 3892330499;
  }
  else {
    return v13;
  }
}

BOOL AFCCompareAndSwap32(int a1, unsigned int a2, atomic_uint *a3)
{
  int v3 = a1;
  atomic_compare_exchange_strong_explicit(a3, (unsigned int *)&v3, a2, memory_order_relaxed, memory_order_relaxed);
  return v3 == a1;
}

uint64_t __AFCLockRegisterClass()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __gAFCLockTypeID = result;
  return result;
}

const void *AFCLockCreate()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v4.__sig = 0;
  *(void *)v4.__opaque = 0;
  if (pthread_mutexattr_init(&v4)
    || (pthread_mutexattr_settype(&v4, 2),
        pthread_once(&AFCLockGetTypeID_typeIDInit, (void (*)(void))__AFCLockRegisterClass),
        (uint64_t Instance = _CFRuntimeCreateInstance()) == 0))
  {
    pthread_mutexattr_destroy(&v4);
    return 0;
  }
  uint64_t v1 = (const void *)Instance;
  int v2 = pthread_mutex_init((pthread_mutex_t *)(Instance + 16), &v4);
  pthread_mutexattr_destroy(&v4);
  if (v2)
  {
    CFRelease(v1);
    return 0;
  }
  return v1;
}

uint64_t AFCLockLock(uint64_t a1)
{
  if (!a1) {
    return 3892330503;
  }
  uint64_t v1 = pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));

  return AFCErrnoToAFCDomainError(v1, 3892330519);
}

uint64_t AFCLockUnlock(uint64_t a1)
{
  if (!a1) {
    return 3892330503;
  }
  uint64_t v1 = pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));

  return AFCErrnoToAFCDomainError(v1, 3892330519);
}

uint64_t AFCReadData(uint64_t a1, char *a2, size_t a3)
{
  if (*(unsigned char *)(a1 + 68)) {
    return *(unsigned int *)(a1 + 64);
  }
  if (!a3) {
    return 0;
  }
  size_t v7 = 0;
  ssize_t v8 = 0;
  v34[0] = AFCConnectionGetIOTimeout(a1);
  v34[1] = 0;
  while (1)
  {
    unint64_t SocketBlockSize = AFCConnectionGetSocketBlockSize(a1);
    if (SocketBlockSize >= a3 - v7) {
      size_t v10 = a3 - v7;
    }
    else {
      size_t v10 = SocketBlockSize;
    }
    if (v34[0]) {
      CFDataRef v11 = (const timespec *)v34;
    }
    else {
      CFDataRef v11 = 0;
    }
    if (!*(void *)(a1 + 208))
    {
      while (1)
      {
        uint64_t v18 = __WaitForTimeoutOrEvent(a1, 1, v11);
        if (v18) {
          return v18;
        }
        ssize_t v19 = recv(*(_DWORD *)(a1 + 56), a2, v10, 0);
        if ((v19 & 0x8000000000000000) == 0) {
          break;
        }
        uint64_t v23 = *__error();
        if (v23 != 35 && v23 != 4)
        {
          LODWORD(v19) = 1;
          uint64_t v25 = 3892330500;
          int v26 = 617;
          CFIndex v27 = "recv";
LABEL_38:
          uint64_t v4 = __AFCSetErrorResult_3(v19, v23, v25, v20, v26, v27, v21, v22, v32);
          goto LABEL_31;
        }
      }
      if (v19)
      {
        uint64_t v4 = 0;
        ssize_t v8 = v19;
        goto LABEL_31;
      }
      uint64_t v25 = 3892330507;
      uint64_t v23 = 0xFFFFFFFFLL;
      int v26 = 619;
      CFIndex v27 = "recv connection closed";
      goto LABEL_38;
    }
    AFCLog(5, "%s on ctx %p for %u bytes.", "__SecureRecvWithTimeout", *(const void **)(a1 + 208), v10);
    if (v10)
    {
      SSLConnectionRef connection = 0;
      uint64_t v12 = SSLGetConnection(*(SSLContextRef *)(a1 + 208), &connection);
      if (v12)
      {
        uint64_t v28 = v12;
        int v29 = 505;
        uint64_t v30 = "SSLGetConnection";
LABEL_42:
        uint64_t v16 = __AFCSetErrorResult_3(1, v28, 3892330500, v13, v29, v30, v14, v15, v33);
      }
      else
      {
        AFCLog(5, "%s on ctx %p with fd %d.", "__SecureRecvWithTimeout", *(const void **)(a1 + 208), connection);
        while (1)
        {
          uint64_t v16 = __WaitForTimeoutOrEvent(a1, 1, v11);
          if (v16) {
            break;
          }
          SSLConnectionRef connection = 0;
          uint64_t v17 = SSLRead(*(SSLContextRef *)(a1 + 208), a2, v10, (size_t *)&connection);
          if (v17 != -9803)
          {
            uint64_t v28 = v17;
            if (v17 >> 1 == 2147478745)
            {
              ssize_t v8 = 0;
              uint64_t v4 = 0;
              SSLConnectionRef connection = 0;
              goto LABEL_30;
            }
            if (!v17)
            {
              uint64_t v4 = 0;
              ssize_t v8 = (ssize_t)connection;
              goto LABEL_30;
            }
            int v29 = 538;
            uint64_t v30 = "SSLRead";
            goto LABEL_42;
          }
          AFCLog(4, "Reading %lu bytes gets SSL error %d, amount_sent %lu\n", v10, -9803, connection);
          if (connection)
          {
            uint64_t v4 = 0;
            ssize_t v8 = (ssize_t)connection;
            goto LABEL_30;
          }
        }
      }
      uint64_t v4 = v16;
    }
    else
    {
      ssize_t v8 = 0;
      uint64_t v4 = 0;
    }
LABEL_30:
    AFCLog(5, "%s returned %d.", "__SecureRecvWithTimeout", v4);
LABEL_31:
    if (v4 || !v8) {
      break;
    }
    v7 += v8;
    a2 += v8;
    if (v7 >= a3) {
      goto LABEL_45;
    }
  }
  if (v4) {
    return v4;
  }
LABEL_45:
  if (v7)
  {
    if (v7 < v10)
    {
      uint64_t v4 = __AFCSetErrorResult_3(1, 0xFFFFFFFFLL, 3892330500, v20, 808, "Read underrun (%d < %d)", v21, v22, v7);
      AFCConnectionSetFatalError(a1, v4);
      return v4;
    }
    return 0;
  }
  return __AFCSetErrorResult_3(0, 0xFFFFFFFFLL, 3892330507, v20, 804, "Read length 0", v21, v22, v32);
}

uint64_t __AFCSetErrorResult_3(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, const char *a6, uint64_t a7, uint64_t a8, char a9)
{
  return AFCSetErrorInfoWithArgs(a1, a2, a3, "/Library/Caches/com.apple.xbs/Sources/AppleFileConduit/platform.c", a5, a6, &a9);
}

uint64_t AFCSendData(uint64_t a1, char *a2, unint64_t a3)
{
  if (*(unsigned char *)(a1 + 68)) {
    return *(unsigned int *)(a1 + 64);
  }
  if (!a3) {
    return 0;
  }
  size_t v7 = a2;
  if (!a2) {
    return 3892330503;
  }
  unint64_t v8 = 0;
  v40[0] = AFCConnectionGetIOTimeout(a1);
  v40[1] = 0;
  while (1)
  {
    unint64_t SocketBlockSize = AFCConnectionGetSocketBlockSize(a1);
    if (SocketBlockSize >= a3 - v8) {
      size_t v10 = a3 - v8;
    }
    else {
      size_t v10 = SocketBlockSize;
    }
    if (v40[0]) {
      CFDataRef v11 = (const timespec *)v40;
    }
    else {
      CFDataRef v11 = 0;
    }
    uint64_t v12 = *(const void **)(a1 + 208);
    if (!v12)
    {
      while (1)
      {
        uint64_t v25 = __WaitForTimeoutOrEvent(a1, 2, v11);
        if (v25) {
          return v25;
        }
        ssize_t v26 = send(*(_DWORD *)(a1 + 56), v7, v10, 0);
        if ((v26 & 0x8000000000000000) == 0)
        {
          size_t v19 = v26;
          uint64_t v4 = 0;
          goto LABEL_32;
        }
        uint64_t v20 = *__error();
        if (v20 != 35 && v20 != 4)
        {
          uint64_t v4 = __AFCSetErrorResult_3(1, v20, 3892330501, v21, 753, "send", v22, v23, v38);
          goto LABEL_46;
        }
      }
    }
    size_t processed = 0;
    AFCLog(5, "%s on ctx %p for %u bytes.", "__SecureSendWithTimeout", v12, v10);
    if (v10)
    {
      SSLConnectionRef connection = 0;
      uint64_t v13 = SSLGetConnection(*(SSLContextRef *)(a1 + 208), &connection);
      if (v13)
      {
        uint64_t v27 = v13;
        int v29 = 650;
        uint64_t v30 = "SSLGetConnection";
LABEL_42:
        uint64_t v17 = __AFCSetErrorResult_3(1, v27, 3892330501, v14, v29, v30, v15, v16, v39);
      }
      else
      {
        AFCLog(5, "%s on ctx %p with fd %d.", "__SecureSendWithTimeout", *(const void **)(a1 + 208), connection);
        while (1)
        {
          uint64_t v17 = __WaitForTimeoutOrEvent(a1, 2, v11);
          if (v17) {
            break;
          }
          uint64_t v18 = SSLWrite(*(SSLContextRef *)(a1 + 208), v7, v10, &processed);
          if (v18 != -9803)
          {
            uint64_t v27 = v18;
            if (!v18)
            {
              uint64_t v4 = 0;
              size_t v19 = processed;
              goto LABEL_31;
            }
            int v29 = 676;
            uint64_t v30 = "SSLWrite";
            goto LABEL_42;
          }
          AFCLog(4, "Writing %lu bytes gets SSL error %d, amount_sent %lu\n", v10, -9803, processed);
          size_t v19 = processed;
          if (processed)
          {
            uint64_t v4 = 0;
            goto LABEL_31;
          }
        }
      }
      uint64_t v4 = v17;
      size_t v19 = 0;
    }
    else
    {
      size_t v19 = 0;
      uint64_t v4 = 3892330503;
    }
LABEL_31:
    AFCLog(5, "%s returned %d.", "__SecureSendWithTimeout", v4);
LABEL_32:
    if (!v19 || v4 != 0) {
      break;
    }
    uint64_t v4 = 0;
    v8 += v19;
    v7 += v19;
    if (v8 >= a3) {
      return v4;
    }
  }
LABEL_46:
  if (v4) {
    return v4;
  }
  if (v8)
  {
    char v34 = __error();
    uint64_t v4 = __AFCSetErrorResult_3(1, *v34, 3892330501, v35, 864, "Write underrun (%d < %d)", v36, v37, v8);
    AFCConnectionSetFatalError(a1, v4);
    return v4;
  }
  return __AFCSetErrorResult_3(1, 0xFFFFFFFFLL, 3892330507, v31, 862, "Write length 0", v32, v33, v38);
}

uint64_t AFCSetSocketOptions(const void *a1, int a2)
{
  int v14 = 1;
  v13[0] = AFCConnectionGetIOTimeout((uint64_t)a1);
  v13[1] = 0;
  if (setsockopt(a2, 6, 1, &v14, 4u) < 0)
  {
    uint64_t v4 = __error();
    uint64_t v5 = strerror(*v4);
    AFCLog(5, "Setting TCP_NODELAY on connection %p failed: %s", a1, v5);
  }
  if (fcntl(a2, 4, 4) < 0)
  {
    uint64_t v6 = __error();
    size_t v7 = strerror(*v6);
    AFCLog(5, "Setting O_NONBLOCK on connection %p failed: %s\n", a1, v7);
  }
  if (setsockopt(a2, 0xFFFF, 4101, v13, 0x10u) < 0)
  {
    unint64_t v8 = __error();
    CFAllocatorRef v9 = strerror(*v8);
    AFCLog(4, "Setting SO_SNDTIMEO on connection %p failed: %s", a1, v9);
  }
  uint64_t result = setsockopt(a2, 0xFFFF, 4102, v13, 0x10u);
  if ((result & 0x80000000) != 0)
  {
    CFDataRef v11 = __error();
    uint64_t v12 = strerror(*v11);
    return AFCLog(4, "Setting SO_RCVTIMEO on connection %p failed: %s", a1, v12);
  }
  return result;
}

uint64_t AFCLog(int a1, const char *a2, ...)
{
  va_start(va, a2);
  return AFCLogV(a1, a2, va);
}

BOOL AFCSocketIsDisconnected(int a1)
{
  if (a1 == -1) {
    return 1;
  }
  uint64_t v11 = v1;
  uint64_t v12 = v2;
  int v4 = kqueue();
  if (v4 < 0) {
    return 0;
  }
  int v5 = v4;
  changelist.ident = a1;
  *(_DWORD *)&changelist.filter = 2490367;
  memset(&changelist.fflags, 0, 20);
  if (kevent(v4, &changelist, 1, 0, 0, 0))
  {
    close(v5);
    return 0;
  }
  v9.tv_sec = 0;
  v9.tv_nsec = 0;
  int v7 = kevent(v5, 0, 0, &changelist, 1, &v9);
  close(v5);
  if (v7 < 0) {
    return 0;
  }
  return v7 == 1 && (changelist.flags & 0x8000u) != 0;
}

uint64_t AFCCreateSignalFileDescriptors(int *a1, int *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  *a1 = -1;
  *a2 = -1;
  int v6 = 1;
  uint64_t result = socketpair(1, 1, 0, &v7);
  if (!result)
  {
    if (setsockopt(v7, 0xFFFF, 4130, &v6, 4u) == -1
      || (uint64_t result = setsockopt(v8, 0xFFFF, 4130, &v6, 4u), result == -1))
    {
      close(v7);
      return close(v8);
    }
    else
    {
      int v5 = v8;
      *a1 = v7;
      *a2 = v5;
    }
  }
  return result;
}

uint64_t AFCGetFilesystemInfo(const char *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  memset(&v17, 0, 512);
  if (statfs(a1, &v17))
  {
    size_t v10 = __error();
    return __AFCSetErrorResult_3(0, *v10, 3892330497, v11, 1029, "statfs", v12, v13, v16);
  }
  else
  {
    uint64_t f_bsize = v17.f_bsize;
    AFCLog(5, "Filesystem info for '%s': total %llu, free %llu, block size %lu, iosize %lu", a1, v17.f_blocks * v17.f_bsize, v17.f_bavail * v17.f_bsize, v17.f_bsize, v17.f_iosize);
    if (a4) {
      *a4 = f_bsize;
    }
    if (a2) {
      *a2 = v17.f_blocks * f_bsize;
    }
    if (a3) {
      *a3 = v17.f_bavail * f_bsize;
    }
    uint64_t result = 0;
    if (a5) {
      *a5 = v17.f_iosize;
    }
  }
  return result;
}

uint64_t AFCPlatformInitialize()
{
  return pthread_once(&__gPlatformInit, (void (*)(void))__AFCPlatformInitialize);
}

CFNumberRef __AFCPlatformInitialize()
{
  __gAFCLogLock = (uint64_t)AFCLockCreate();
  v0 = getprogname();
  __gAFCASLClient = (uint64_t)asl_open(v0, "com.apple.afc", 2u);
  pthread_key_create((pthread_key_t *)&__gAFCErrorInfoKey, MEMORY[0x263EFF3B0]);
  __AFCLogPreferencesChanged(0);
  uint64_t v1 = MEMORY[0x263EF83A0];
  notify_register_dispatch("com.apple.ManagedConfiguration.profileListChanged", (int *)&gAFCProfileNotificationToken, MEMORY[0x263EF83A0], &__block_literal_global);
  notify_register_dispatch("com.apple.afc.preferencesChanged", &gAFCLogLevelNotificationToken, v1, &__block_literal_global_53);
  CFNumberRef result = CFNumberCreate(0, kCFNumberDoubleType, &AFCafcVersionNumber);
  __gAFCVersion = (uint64_t)result;
  return result;
}

uint64_t AFCSetLogLevel(uint64_t result)
{
  gAFCLogLevel = (int)result > 0;
  return result;
}

uint64_t AFCLogV(int a1, const char *a2, va_list a3)
{
  uint64_t result = pthread_once(&__gPlatformInit, (void (*)(void))__AFCPlatformInitialize);
  if (gAFCLogLevel == 6)
  {
    int v7 = (FILE **)MEMORY[0x263EF8348];
    vfprintf((FILE *)*MEMORY[0x263EF8348], a2, a3);
    int v8 = *v7;
    return fflush(v8);
  }
  else if (gAFCLogLevel >= a1 || gAFCVerboseLogEnabled != 0)
  {
    AFCLockLock(__gAFCLogLock);
    asl_vlog((asl_object_t)__gAFCASLClient, 0, 3, a2, a3);
    uint64_t v10 = __gAFCLogLock;
    return AFCLockUnlock(v10);
  }
  return result;
}

uint64_t __AFCConditionRegisterClass()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __gAFCConditionTypeID = result;
  return result;
}

uint64_t AFCConditionCreate()
{
  pthread_once(&AFCConditionGetTypeID_typeIDInit, (void (*)(void))__AFCConditionRegisterClass);
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v1 = Instance;
  if (Instance)
  {
    if (!pthread_mutex_init((pthread_mutex_t *)(Instance + 16), 0))
    {
      if (!pthread_cond_init((pthread_cond_t *)(v1 + 80), 0))
      {
        *(unsigned char *)(v1 + 128) = 0;
        return v1;
      }
      pthread_mutex_destroy((pthread_mutex_t *)(v1 + 16));
    }
    CFRelease((CFTypeRef)v1);
    return 0;
  }
  return v1;
}

uint64_t AFCConditionIsSignaled(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 128);
}

uint64_t AFCConditionSignal(uint64_t a1)
{
  uint64_t v2 = (pthread_mutex_t *)(a1 + 16);
  uint64_t v3 = pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (!v3)
  {
    *(unsigned char *)(a1 + 128) = 1;
    int v4 = pthread_cond_broadcast((pthread_cond_t *)(a1 + 80));
    uint64_t v3 = (pthread_mutex_unlock(v2) | v4) != 0;
  }

  return AFCErrnoToAFCDomainError(v3, 3892330519);
}

uint64_t AFCConditionWait(uint64_t a1, double a2)
{
  int v4 = (pthread_mutex_t *)(a1 + 16);
  uint64_t v5 = pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (!v5)
  {
    uint64_t v6 = (uint64_t)((a2 - floor(a2)) * 1000000000.0);
    while (1)
    {
      int v7 = *(unsigned __int8 *)(a1 + 128);
      if (*(unsigned char *)(a1 + 128)) {
        break;
      }
      if (a2 == 0.0)
      {
        int v8 = pthread_cond_wait((pthread_cond_t *)(a1 + 80), v4);
      }
      else
      {
        v12.tv_sec = 0;
        v12.tv_nsec = 0;
        v12.tv_sec = time(0) + (uint64_t)a2;
        v12.tv_nsec = v6;
        int v8 = pthread_cond_timedwait((pthread_cond_t *)(a1 + 80), v4, &v12);
      }
      unsigned int v9 = v8;
      if (v8) {
        goto LABEL_10;
      }
    }
    unsigned int v9 = 0;
    *(unsigned char *)(a1 + 128) = 0;
LABEL_10:
    LODWORD(v5) = pthread_mutex_unlock(v4);
    if (v5) {
      BOOL v10 = v7 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10) {
      uint64_t v5 = v9;
    }
    else {
      uint64_t v5 = v5;
    }
  }
  return AFCErrnoToAFCDomainError(v5, 3892330519);
}

uint64_t __AFCConnectionProcessOperations(uint64_t a1, CFTimeInterval a2)
{
  if (*(void *)(a1 + 192)) {
    return 3892330513;
  }
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  AFCConnectionScheduleWithRunLoop(a1, Current, @"AFCRunLoopMode");
  do
  {
    if (!AFCConnectionIsValid(a1))
    {
      uint64_t v2 = 0;
      goto LABEL_12;
    }
    CFRunLoopRunResult v6 = CFRunLoopRunInMode(@"AFCRunLoopMode", a2, 0);
  }
  while (v6 == kCFRunLoopRunHandledSource);
  unsigned int v7 = -402636788;
  if (v6 != kCFRunLoopRunTimedOut) {
    unsigned int v7 = -402636799;
  }
  if ((v6 - 1) >= 2) {
    uint64_t v2 = v7;
  }
  else {
    uint64_t v2 = 3892330507;
  }
LABEL_12:
  CFRunLoopRef v8 = CFRunLoopGetCurrent();
  AFCConnectionUnscheduleFromRunLoop(a1, v8);
  return v2;
}

CFDictionaryRef __AFCCopyErrorInfoDescription(CFDictionaryRef theDict)
{
  CFDictionaryRef Mutable = theDict;
  if (theDict)
  {
    CFIndex Count = CFDictionaryGetCount(theDict);
    if (Count && (uint64_t v3 = Count, (v4 = (const void **)CFAllocatorAllocate(0, 16 * Count, 0)) != 0))
    {
      uint64_t v5 = v4;
      CFDictionaryGetKeysAndValues(Mutable, v4, &v4[v3]);
      CFDictionaryRef Mutable = (const __CFDictionary *)CFStringCreateMutable(0, 0);
      if (Mutable && v3 >= 1)
      {
        CFRunLoopRunResult v6 = v5;
        uint64_t v7 = v3;
        do
        {
          CFStringAppendFormat((CFMutableStringRef)Mutable, 0, @"%@=\"%@\" ", *v6, v6[v3]);
          ++v6;
          --v7;
        }
        while (v7);
      }
      CFAllocatorDeallocate(0, v5);
    }
    else
    {
      return 0;
    }
  }
  return Mutable;
}

uint64_t AFCErrorInfoCreateWithArgs(__CFDictionary **a1, uint64_t a2, uint64_t a3, const char *a4, int a5, const char *a6, va_list a7)
{
  int v10 = a2;
  uint64_t v35 = *MEMORY[0x263EF8340];
  int v32 = a5;
  int v33 = a2;
  unsigned int valuePtr = AFCErrnoToAFCDomainError(a2, a3);
  CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    CFNumberRef v13 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    if (v13)
    {
      CFNumberRef v14 = v13;
      CFDictionarySetValue(Mutable, @"AFCCode", v13);
      CFRelease(v14);
    }
    if (v10 != -1)
    {
      strerror_r(v10, __strerrbuf, 0x80uLL);
      CFStringRef v15 = CFStringCreateWithCString(0, __strerrbuf, 0x8000100u);
      if (v15)
      {
        CFStringRef v16 = v15;
        CFDictionarySetValue(Mutable, @"NSDebugDescription", v15);
        CFRelease(v16);
      }
      CFNumberRef v17 = CFNumberCreate(0, kCFNumberIntType, &v33);
      if (v17)
      {
        CFNumberRef v18 = v17;
        CFDictionarySetValue(Mutable, @"NSUnderlyingError", v17);
        CFRelease(v18);
      }
    }
    CFStringRef v19 = CFStringCreateWithCStringNoCopy(0, a6, 0x8000100u, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
    if (v19)
    {
      CFStringRef v20 = v19;
      CFStringRef v21 = CFStringCreateWithFormatAndArguments(0, 0, v19, a7);
      if (v21)
      {
        CFStringRef v22 = v21;
        CFDictionarySetValue(Mutable, @"NSDescription", v21);
        CFRelease(v22);
      }
      CFRelease(v20);
    }
    if (a4)
    {
      size_t v23 = strlen(a4);
      CFURLRef v24 = CFURLCreateFromFileSystemRepresentation(0, (const UInt8 *)a4, v23, 0);
      if (v24)
      {
        CFURLRef v25 = v24;
        CFStringRef PathComponent = CFURLCopyLastPathComponent(v24);
        if (PathComponent)
        {
          CFStringRef v27 = PathComponent;
          CFDictionarySetValue(Mutable, @"AFCFileName", PathComponent);
          CFRelease(v27);
        }
        CFNumberRef v28 = CFNumberCreate(0, kCFNumberIntType, &v32);
        if (v28)
        {
          CFNumberRef v29 = v28;
          CFDictionarySetValue(Mutable, @"AFCFileLine", v28);
          CFRelease(v29);
        }
        CFRelease(v25);
      }
    }
    if (__gAFCVersion) {
      CFDictionarySetValue(Mutable, @"AFCVersion", (const void *)__gAFCVersion);
    }
  }
  *a1 = Mutable;
  return valuePtr;
}

uint64_t AFCSetErrorInfoWithArgs(int a1, uint64_t a2, uint64_t a3, const char *a4, int a5, const char *a6, va_list a7)
{
  CFURLRef v24 = 0;
  pthread_once(&__gPlatformInit, (void (*)(void))__AFCPlatformInitialize);
  uint64_t v14 = AFCErrorInfoCreateWithArgs(&v24, a2, a3, a4, a5, a6, a7);
  CFDictionaryRef v15 = v24;
  AFCLog(5, "created error info %p", v24);
  if (v15)
  {
    if (a1 >= 1)
    {
      CFStringRef v16 = (const __CFString *)__AFCCopyErrorInfoDescription(v15);
      if (v16)
      {
        CFStringRef v17 = v16;
        CFIndex Length = CFStringGetLength(v16);
        CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
        CFStringRef v20 = (char *)CFAllocatorAllocate(0, MaximumSizeForEncoding, 0);
        if (v20)
        {
          CFStringRef v21 = v20;
          if (CFStringGetCString(v17, v20, MaximumSizeForEncoding, 0x8000100u)) {
            AFCLog(a1, "%s", v21);
          }
          CFAllocatorDeallocate(0, v21);
        }
        CFRelease(v17);
      }
    }
    CFStringRef v22 = pthread_getspecific(__gAFCErrorInfoKey);
    if (v22) {
      CFRelease(v22);
    }
    if (pthread_setspecific(__gAFCErrorInfoKey, v15))
    {
      AFCLog(5, "Error setting thread error info");
      CFRelease(v15);
    }
  }
  return v14;
}

void *AFCCopyAndClearLastErrorInfo()
{
  pthread_once(&__gPlatformInit, (void (*)(void))__AFCPlatformInitialize);
  v0 = pthread_getspecific(__gAFCErrorInfoKey);
  pthread_setspecific(__gAFCErrorInfoKey, 0);
  return v0;
}

uint64_t __AFCLockFinalize(uint64_t a1)
{
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 16));
}

__CFString *__AFCLockCopyDescription(const void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  CFDictionaryRef Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, @"<AFCLock %p [%p]> {", a1, v2);
  CFStringAppendFormat(Mutable, 0, @"}");
  return Mutable;
}

uint64_t __WaitForTimeoutOrEvent(uint64_t a1, int a2, const timespec *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  CFRunLoopRunResult v6 = *(SSLContext **)(a1 + 208);
  if (v6)
  {
    connection.int ident = 0;
    if (a2 == 1)
    {
      bufferSize.int ident = 0;
      if (SSLGetBufferedReadSize(v6, &bufferSize.ident)) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = bufferSize.ident == 0;
      }
      if (!v7) {
        return 0;
      }
      CFRunLoopRunResult v6 = *(SSLContext **)(a1 + 208);
    }
    uint64_t v8 = SSLGetConnection(v6, (SSLConnectionRef *)&connection);
    if (v8)
    {
      uint64_t v17 = v8;
      uint64_t v18 = 3892330500;
      CFStringRef v19 = "SSLGetConnection";
      int v20 = 1;
      int v21 = 354;
      return __AFCSetErrorResult_3(v20, v17, v18, v9, v21, v19, v10, v11, v28);
    }
    int ident = connection.ident;
  }
  else
  {
    int ident = *(_DWORD *)(a1 + 56);
  }
  if (ident == -1) {
    return 0;
  }
  int v13 = *(_DWORD *)(a1 + 1256);
  if (v13 == -1)
  {
    uint64_t v17 = *__error();
    uint64_t v18 = 3892330519;
    CFStringRef v19 = "kqueue";
    int v20 = 1;
    int v21 = 380;
    return __AFCSetErrorResult_3(v20, v17, v18, v9, v21, v19, v10, v11, v28);
  }
  uint64_t v14 = *(int *)(a1 + 1260);
  connection.int ident = ident;
  if (a2 == 1) {
    int16_t v15 = -1;
  }
  else {
    int16_t v15 = -2;
  }
  connection.filter = v15;
  connection.flags = 37;
  memset(&connection.fflags, 0, 20);
  if (v14 == -1)
  {
    int v16 = 1;
  }
  else
  {
    uint64_t v31 = v14;
    uint64_t v34 = 0;
    uint64_t v33 = 0;
    int v16 = 2;
    int v32 = 393215;
    int v35 = 0;
  }
  int v22 = kevent(v13, &connection, v16, &bufferSize, v16, a3);
  if (v22 == -1)
  {
    uint64_t v17 = *__error();
    uint64_t v18 = 3892330519;
    CFStringRef v19 = "kevent failed for kq %d, fd %d, signalFD %d";
    char v28 = v13;
    int v20 = 1;
    int v21 = 407;
    return __AFCSetErrorResult_3(v20, v17, v18, v9, v21, v19, v10, v11, v28);
  }
  if (!v22)
  {
    uint64_t v18 = 3892330508;
    CFStringRef v19 = "kevent timeout";
    int v20 = 1;
    uint64_t v17 = 60;
    int v21 = 411;
    return __AFCSetErrorResult_3(v20, v17, v18, v9, v21, v19, v10, v11, v28);
  }
  if (v22 < 1) {
    return 0;
  }
  uint64_t v24 = v22;
  for (uint64_t i = &bufferSize.data; ; i += 4)
  {
    int v26 = *((_DWORD *)i - 4);
    if (v14 == v26)
    {
      AFCLog(4, "Woke up due to write to signal FD");
      CFStringRef v19 = "kevent connection close wakeup";
      int v20 = 0;
      uint64_t v17 = 0xFFFFFFFFLL;
      uint64_t v18 = 3892330507;
      int v21 = 423;
      return __AFCSetErrorResult_3(v20, v17, v18, v9, v21, v19, v10, v11, v28);
    }
    if (ident == v26) {
      break;
    }
    AFCLog(1, "Unknown kevent ident %d");
LABEL_38:
    if (!--v24) {
      return 0;
    }
  }
  if ((*((_WORD *)i - 3) & 0x4000) != 0)
  {
    uint64_t v17 = *(unsigned int *)i;
    CFStringRef v19 = "kevent EV_ERROR";
    int v20 = 0;
    uint64_t v18 = 3892330507;
    int v21 = 430;
    return __AFCSetErrorResult_3(v20, v17, v18, v9, v21, v19, v10, v11, v28);
  }
  if (a2 == 1 && *((__int16 *)i - 4) == -1 && *i)
  {
    if ((*((_WORD *)i - 3) & 0x8000) != 0) {
      AFCLog(4, "EV_EOF but %ld bytes available anyway", *i);
    }
    return 0;
  }
  if ((*((_WORD *)i - 3) & 0x8000) == 0)
  {
    if (a2 == 2) {
      AFCLog(5, "kevent says ready to write %d bytes on conn %p.");
    }
    goto LABEL_38;
  }
  uint64_t v23 = 3892330507;
  AFCLog(4, "Woke up due to EOF");
  uint64_t v17 = *((unsigned int *)i - 1);
  if (!v17) {
    return v23;
  }
  CFStringRef v19 = "kevent EV_EOF";
  int v20 = 0;
  uint64_t v18 = 3892330507;
  int v21 = 452;
  return __AFCSetErrorResult_3(v20, v17, v18, v9, v21, v19, v10, v11, v28);
}

uint64_t __AFCLogPreferencesChanged(int a1)
{
  Boolean keyExistsAndHasValidFormat = 0;
  if (a1) {
    AFCLog(1, "Checking for changed log settings");
  }
  CFPreferencesSynchronize(@"com.apple.afc", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  AppBooleanCFStringRef Value = CFPreferencesGetAppBooleanValue(@"VerboseLogging", @"com.apple.afc", &keyExistsAndHasValidFormat);
  int v3 = AppBooleanValue;
  if (a1) {
    AFCLog(1, "valid %d value %d", keyExistsAndHasValidFormat, AppBooleanValue);
  }
  if (keyExistsAndHasValidFormat)
  {
    gAFCVerboseLogEnabled = v3 != 0;
    uint64_t result = CFPreferencesAppValueIsForced(@"VerboseLogging", @"com.apple.afc");
    if (!a1) {
      return result;
    }
  }
  else
  {
    uint64_t result = 0;
    if (!a1) {
      return result;
    }
  }
  if (gAFCVerboseLogEnabled) {
    uint64_t v5 = "enabled";
  }
  else {
    uint64_t v5 = "disabled";
  }
  CFRunLoopRunResult v6 = " by profile";
  if (!result) {
    CFRunLoopRunResult v6 = (const char *)&unk_2210D016F;
  }
  return AFCLog(1, "Verbose logging %s%s", v5, v6);
}

uint64_t __AFCConditionFinalize(uint64_t a1)
{
  *(unsigned char *)(a1 + 128) = 1;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 16));

  return pthread_cond_destroy((pthread_cond_t *)(a1 + 80));
}

__CFString *__AFCConditionCopyDescription(unsigned __int8 *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  CFDictionaryRef Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, @"<AFCCondition %p [%p]> { Signaled %d", a1, v2, a1[128]);
  CFStringAppendFormat(Mutable, 0, @"}");
  return Mutable;
}

uint64_t AFCDeviceAppendDeviceInfo(uint64_t a1, CFMutableDataRef theData)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  CFDataAppendBytes(theData, (const UInt8 *)"Model", 6);
  pthread_once(&GetModelName_modelInitialized, (void (*)(void))InitModelName);
  size_t v4 = strlen(gModelName);
  CFDataAppendBytes(theData, (const UInt8 *)gModelName, v4 + 1);
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v9 = 0;
  if (!AFCGetFilesystemInfo((const char *)(a1 + 224), &v9, &v10, &v11, 0))
  {
    CFDataAppendBytes(theData, (const UInt8 *)"FSTotalBytes", 13);
    snprintf(__str, 0x40uLL, "%llu", v9);
    size_t v5 = strlen(__str);
    CFDataAppendBytes(theData, (const UInt8 *)__str, v5 + 1);
    CFDataAppendBytes(theData, (const UInt8 *)"FSFreeBytes", 12);
    snprintf(__str, 0x40uLL, "%llu", v10);
    size_t v6 = strlen(__str);
    CFDataAppendBytes(theData, (const UInt8 *)__str, v6 + 1);
    CFDataAppendBytes(theData, (const UInt8 *)"FSBlockSize", 12);
    snprintf(__str, 0x40uLL, "%lu", v11);
    size_t v7 = strlen(__str);
    CFDataAppendBytes(theData, (const UInt8 *)__str, v7 + 1);
  }
  return 0;
}

char *InitModelName()
{
  size_t v3 = 127;
  uint64_t result = (char *)sysctlbyname("hw.machine", gModelName, &v3, 0, 0);
  if ((result & 0x80000000) != 0)
  {
    CFAllocatorRef v2 = __error();
    AFCLog(1, "Getting model name failed: %d\n", *v2);
    uint64_t result = AFCStringCopy(gModelName, 0x80uLL, "unknown", 0);
    size_t v1 = 7u;
  }
  else
  {
    size_t v1 = v3;
  }
  gModelName[v1] = 0;
  return result;
}

uint64_t AFCServerContextGetRootPath(uint64_t a1)
{
  return *(void *)(a1 + 64);
}

CFTypeRef AFCServerContextSetRootPath(uint64_t a1, CFTypeRef cf)
{
  size_t v4 = *(const void **)(a1 + 64);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 64) = cf;

  return CFRetain(cf);
}

uint64_t AFCServerContextGetLockdownConnection(uint64_t a1)
{
  return *(void *)(a1 + 72);
}

uint64_t AFCServerContextSetLockdownConnection(uint64_t result, uint64_t a2)
{
  *(void *)(result + 72) = a2;
  return result;
}

char *AFCCreateServerContext()
{
  pthread_once(&gAFCServerOnce, (void (*)(void))__AFCServerInit);
  size_t v0 = 40 * gAFCMaxOpenFileCount + 80;
  size_t v1 = (char *)malloc_type_malloc(v0, 0x22FD4ED9uLL);
  CFAllocatorRef v2 = v1;
  if (v1)
  {
    bzero(v1, v0);
    if (gAFCMaxOpenFileCount)
    {
      unint64_t v3 = 0;
      size_t v4 = v2 + 80;
      do
      {
        *(_DWORD *)size_t v4 = -1;
        size_t v5 = dispatch_queue_create("com.apple.afc.fileio", 0);
        *((void *)v4 + 3) = v5;
        global_queue = dispatch_get_global_queue(gAFCIOPriority, 0);
        dispatch_set_target_queue(v5, global_queue);
        ++v3;
        v4 += 40;
      }
      while (v3 < gAFCMaxOpenFileCount);
    }
    *((void *)v2 + 7) = dispatch_group_create();
    *((void *)v2 + 6) = dispatch_semaphore_create(gAFCMaxIORequests);
    size_t v7 = dispatch_queue_create("com.apple.afc.buffercache", 0);
    *((void *)v2 + 3) = v7;
    uint64_t v8 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v7);
    *((void *)v2 + 4) = v8;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = __AFCCreateServerContext_block_invoke;
    handler[3] = &__block_descriptor_tmp_0;
    handler[4] = v2;
    dispatch_source_set_event_handler(v8, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 4));
  }
  return v2;
}

uint64_t __AFCServerInit()
{
  unint64_t v5 = 0;
  size_t v4 = 8;
  if (sysctlbyname("kern.maxvnodes", &v5, &v4, 0, 0))
  {
    size_t v0 = __error();
    AFCLog(1, "sysctl kern.maxvnodes failed: %d\n", *v0);
  }
  if (getdtablesize() >= 32) {
    unint64_t v1 = getdtablesize() - 16;
  }
  else {
    unint64_t v1 = 16;
  }
  unint64_t v2 = v5 >> 4;
  if (v5 >> 4 >= v1) {
    unint64_t v2 = v1;
  }
  if (v5) {
    unint64_t v1 = v2;
  }
  gAFCMaxOpenFileCFIndex Count = v1;
  return AFCLog(5, "Max open files: %u\n", v1);
}

void __AFCCreateServerContext_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 40)) {
    __AFCFlushServerBuffers(v1);
  }
}

void __AFCFlushServerBuffers(uint64_t a1)
{
  dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  while (*(void *)(a1 + 16))
  {
    unint64_t v2 = *(void ***)(a1 + 16);
    *(void *)(a1 + 16) = *v2;
    free(v2[2]);
    free(v2);
  }
}

uint64_t AFCInitServerConnection(uint64_t a1)
{
  uint64_t Context = AFCConnectionGetContext(a1);
  unint64_t v3 = gAFCFSBlocksizeDefault;
  if (!gAFCFSBlocksizeDefault)
  {
    uint64_t v7 = 0x100000;
    int v4 = AFCGetFilesystemInfo((const char *)(a1 + 224), 0, 0, 0, &v7);
    unint64_t v3 = v7;
    if (v4) {
      unint64_t v3 = 0x100000;
    }
  }
  *(void *)(a1 + 88) = v3;
  int v5 = gAFCFSBlocksizeMax;
  if (v3 > gAFCFSBlocksizeMax)
  {
    *(void *)(a1 + 88) = gAFCFSBlocksizeMax;
    LODWORD(v3) = v5;
  }
  uint64_t result = AFCLog(5, "Setting server FS blocksize to %u\n", v3);
  *(void *)(Context + 8) = *(void *)(a1 + 88);
  return result;
}

uint64_t AFCServerConnectionSetFileCoordinationEnabled(uint64_t result, char a2)
{
  *(unsigned char *)(result + 1268) = a2;
  return result;
}

uint64_t AFCServerConnectionGetFileCoordinationEnabled(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 1268);
}

uint64_t AFCServerConnectionSetRespectDataProtectionClass(uint64_t result, char a2)
{
  *(unsigned char *)(result + 1269) = a2;
  return result;
}

uint64_t AFCServerConnectionGetRespectDataProtectionClass(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 1269);
}

void AFCFlushServerContext(uint64_t a1)
{
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL);
  if (gAFCMaxOpenFileCount)
  {
    unint64_t v2 = 0;
    unint64_t v3 = (const void **)(a1 + 112);
    do
    {
      int v4 = *((_DWORD *)v3 - 8);
      if (v4 != -1)
      {
        close(v4);
        *((_DWORD *)v3 - 8) = -1;
      }
      if (*v3)
      {
        (*((void (**)(void))*v3 + 2))();
        _Block_release(*v3);
        *unint64_t v3 = 0;
      }
      ++v2;
      v3 += 5;
    }
    while (v2 < gAFCMaxOpenFileCount);
  }
  int v5 = *(NSObject **)(a1 + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __AFCFlushServerBuffers_block_invoke;
  block[3] = &__block_descriptor_tmp_17;
  block[4] = a1;
  dispatch_sync(v5, block);
}

void AFCFreeServerContext(uint64_t a1)
{
  AFCFlushServerContext(a1);
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL);
  if (gAFCMaxOpenFileCount)
  {
    unint64_t v2 = 0;
    unint64_t v3 = (NSObject **)(a1 + 104);
    do
    {
      int v4 = *v3;
      v3 += 5;
      dispatch_release(v4);
      ++v2;
    }
    while (v2 < gAFCMaxOpenFileCount);
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
  dispatch_release(*(dispatch_object_t *)(a1 + 56));
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 24));
  int v5 = *(const void **)(a1 + 64);
  if (v5) {
    CFRelease(v5);
  }

  free((void *)a1);
}

uint64_t AFCProcessServerPacket(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v495 = *MEMORY[0x263EF8340];
  AFCLog(5, "Header packet type %d", *(void *)(a2 + 32));
  AFCLog(5, "Header len %llu", *(void *)(v2 + 16));
  AFCLog(5, "Server received packet type 0x%X\n", *(void *)(v2 + 32));
  switch(*(void *)(v2 + 32))
  {
    case 1:
      AFCLog(5, "Processing status packet\n");
      int v167 = AFCDiscardBodyData(a1, v2);
      AFCSendStatus(a1, v2, v167);
      return 0;
    case 3:
      if (__AFCConnectionGetRequestPath(a1, (char *)(v2 + 40), (char *)&theDict, 0x400uLL))
      {
        AFCLog(5, "Read directory '%s'\n", (const char *)&theDict);
        uint64_t v197 = AFCDiscardBodyData(a1, v2);
        if (v197)
        {
          uint64_t v9 = v197;
          uint64_t v206 = a1;
          v205 = 0;
          goto LABEL_354;
        }
        v198 = opendir((const char *)&theDict);
        if (v198)
        {
          v199 = v198;
          v200 = readdir(v198);
          if (v200)
          {
            v201 = v200;
            LODWORD(v9) = 0;
            do
            {
              AFCLog(5, "dir entry '%s' (%d)\n", v201->d_name, v201->d_namlen);
              uint64_t v9 = v9 + v201->d_namlen + 1;
              v201 = readdir(v199);
            }
            while (v201);
            rewinddir(v199);
            if (v9)
            {
              v205 = (char *)malloc_type_malloc(v9, 0x86EC7AF1uLL);
              if (v205)
              {
                uint64_t v206 = a1;
                v207 = readdir(v199);
                if (v207)
                {
                  v208 = v207;
                  int v209 = 0;
                  v210 = v205;
                  do
                  {
                    AFCLog(5, "dir entry '%s' (%d)\n", v208->d_name, v208->d_namlen);
                    if (v209 + v208->d_namlen > v9) {
                      break;
                    }
                    strlcpy(v210, v208->d_name, (int)v9 - v209);
                    uint64_t v211 = v208->d_namlen + 1;
                    v209 += v211;
                    v210 += v211;
                    v208 = readdir(v199);
                  }
                  while (v208);
                  uint64_t v9 = 0;
LABEL_353:
                  closedir(v199);
                  if (v9)
                  {
LABEL_354:
                    AFCSendStatus(v206, v2, v9);
                    goto LABEL_508;
                  }
LABEL_507:
                  AFCSendDataPacket(v206, v2, v205, v209);
LABEL_508:
                  if (v205) {
                    free(v205);
                  }
                  return v9;
                }
                uint64_t v9 = 0;
              }
              else
              {
                uint64_t v206 = a1;
                uint64_t v9 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330499, v202, 1001, "malloc", v203, v204, v482);
              }
              int v209 = 0;
              goto LABEL_353;
            }
            uint64_t v206 = a1;
          }
          else
          {
            uint64_t v206 = a1;
            rewinddir(v199);
            uint64_t v9 = 0;
          }
          int v209 = 0;
          v205 = 0;
          goto LABEL_353;
        }
        uint64_t v206 = a1;
        uint64_t v451 = *__error();
        uint64_t v448 = 3892330500;
        v449 = "opendir";
        int v450 = 0;
        int v452 = 988;
      }
      else
      {
        uint64_t v206 = a1;
        uint64_t v448 = 3892330498;
        v449 = "AFCConnectionGetRequestPath";
        int v450 = 1;
        uint64_t v451 = 0xFFFFFFFFLL;
        int v452 = 980;
      }
      uint64_t v9 = __AFCSetErrorResult_4(v450, v451, v448, v194, v452, v449, v195, v196, (char)p_theDict);
      v205 = 0;
      int v209 = 0;
      if (v9) {
        goto LABEL_354;
      }
      goto LABEL_507;
    case 5:
    case 6:
    case 0xCLL:
      AFCProcessObsoletePacket(a1, v2);
      return 3892330511;
    case 7:
      *(void *)&ptr[0].st_dev = 0;
      if (!__AFCConnectionGetRequestPath(a1, (char *)(v2 + 48), (char *)&theDict, 0x400uLL))
      {
        uint64_t v335 = 3892330498;
        v336 = "AFCConnectionGetRequestPath";
        int v337 = 1;
        uint64_t v334 = 0xFFFFFFFFLL;
        int v338 = 1295;
        goto LABEL_323;
      }
      int v158 = AFCDiscardBodyData(a1, v2);
      if (v158) {
        goto LABEL_324;
      }
      int v158 = AFCCheckForSpecialFile((const char *)&theDict, (const char *)(v2 + 48));
      if (v158) {
        goto LABEL_324;
      }
      AFCLog(5, "Processing truncate '%s' %lld\n", (const char *)&theDict, *(void *)(v2 + 40));
      if (*(unsigned char *)(a1 + 1268))
      {
        int v158 = __AFCCoordinateFileActivity((const char *)&theDict, 8, ptr);
        if (v158) {
          goto LABEL_324;
        }
      }
      if ((truncate((const char *)&theDict, *(void *)(v2 + 40)) & 0x80000000) == 0)
      {
        LODWORD(v9) = 0;
        goto LABEL_325;
      }
      uint64_t v334 = *__error();
      uint64_t v335 = 3892330497;
      v336 = "truncate";
      int v337 = 0;
      int v338 = 1312;
      goto LABEL_323;
    case 8:
      *(void *)&ptr[0].st_dev = 0;
      if (__AFCConnectionGetRequestPath(a1, (char *)(v2 + 40), (char *)&theDict, 0x400uLL))
      {
        AFCLog(5, "Processing remove path '%s'\n", (const char *)&theDict);
        int v158 = AFCDiscardBodyData(a1, v2);
        if (!v158
          && (!*(unsigned char *)(a1 + 1268) || (int v158 = __AFCCoordinateFileActivity((const char *)&theDict, 1, ptr)) == 0))
        {
          int v158 = RemovePath((const char *)&theDict);
        }
      }
      else
      {
        uint64_t v335 = 3892330498;
        v336 = "AFCConnectionGetRequestPath";
        int v337 = 1;
        uint64_t v334 = 0xFFFFFFFFLL;
        int v338 = 1363;
LABEL_323:
        int v158 = __AFCSetErrorResult_4(v337, v334, v335, v155, v338, v336, v156, v157, (char)p_theDict);
      }
LABEL_324:
      LODWORD(v9) = v158;
LABEL_325:
      v339 = *(const void **)&ptr[0].st_dev;
      if (*(void *)&ptr[0].st_dev)
      {
        (*(void (**)(void))(*(void *)&ptr[0].st_dev + 16))(*(void *)&ptr[0].st_dev);
        _Block_release(v339);
      }
      goto LABEL_327;
    case 9:
      memset(&valuePtr, 0, sizeof(valuePtr));
      *(void *)__str = 0;
      if (!__AFCConnectionGetRequestPath(a1, (char *)(v2 + 40), (char *)ptr, 0x400uLL))
      {
        unsigned int v177 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330498, v174, 1561, "AFCConnectionGetRequestPath", v175, v176, (char)p_theDict);
        goto LABEL_468;
      }
      AFCLog(5, "Processing make directory '%s'\n", (const char *)ptr);
      unsigned int v177 = AFCDiscardBodyData(a1, v2);
      if (v177)
      {
LABEL_468:
        unsigned int v190 = v177;
        goto LABEL_434;
      }
      size_t v178 = strlen((const char *)(a1 + 224));
      BOOL v179 = *((unsigned __int8 *)&ptr[0].st_dev + v178) == 47;
      if (*(unsigned char *)(a1 + 1268))
      {
        unsigned int v180 = __AFCCoordinateFileActivity((const char *)ptr, 8, __str);
        if (v180) {
          goto LABEL_376;
        }
      }
      size_t v181 = v178 + v179;
      int v182 = -1;
      while (1)
      {
        if (*((unsigned char *)&ptr[0].st_dev + v181))
        {
          if (*((unsigned char *)&ptr[0].st_dev + v181) != 47) {
            goto LABEL_176;
          }
          char v183 = 0;
        }
        else
        {
          char v183 = 1;
        }
        *((unsigned char *)&ptr[0].st_dev + v181) = 0;
        AFCLog(5, "Make intermediate dir '%s'\n", (const char *)ptr);
        if (mkdir((const char *)ptr, 0x1EDu) < 0) {
          break;
        }
        if (!*(unsigned char *)(a1 + 1269))
        {
          int v184 = open((const char *)ptr, 1048832);
          if (v184 < 0)
          {
            uint64_t v366 = *__error();
            v367 = __error();
            strerror(*v367);
            unsigned int v180 = __AFCSetErrorResult_4(1, v366, 3892330519, v368, 1607, "Failed to open %s : %s", v369, v370, (char)ptr);
LABEL_376:
            unsigned int v190 = v180;
            goto LABEL_434;
          }
          int v182 = v184;
          if (fcntl(v184, 64, 4))
          {
            uint64_t v185 = *__error();
            __error();
            v186 = __error();
            strerror(*v186);
            unsigned int v190 = __AFCSetErrorResult_4(1, v185, 3892330519, v187, 1612, "Failed to setclass(%d) on directory %s: (%d) %s", v188, v189, 4);
            if (*__error() != 45) {
              goto LABEL_433;
            }
            memset(&theDict, 0, 512);
            if (fstatfs(v182, &theDict) < 0)
            {
              uint64_t v397 = *__error();
              v398 = __error();
              strerror(*v398);
              unsigned int v190 = __AFCSetErrorResult_4(1, v397, 3892330519, v399, 1621, "Failed fstatfs on directory %s: %s", v400, v401, (char)ptr);
              goto LABEL_433;
            }
            if ((theDict.f_flags & 0x80) != 0)
            {
              AFCLog(3, "The path %s supports content protection, so this is an error", (const char *)ptr);
              goto LABEL_433;
            }
            AFCLog(3, "The path %s doesn't allow content protection, so this is not an error", (const char *)ptr);
          }
        }
LABEL_174:
        if (v183)
        {
          unsigned int v190 = 0;
          goto LABEL_305;
        }
        *((unsigned char *)&ptr[0].st_dev + v181) = 47;
LABEL_176:
        ++v181;
      }
      if (*__error() != 21 && *__error() != 17)
      {
        uint64_t v390 = *__error();
        uint64_t v391 = 3892330497;
        v392 = "mkdir %p";
        v481 = ptr;
        int v393 = 1598;
        goto LABEL_412;
      }
      if (stat((const char *)ptr, &valuePtr))
      {
        uint64_t v424 = *__error();
        unsigned int v394 = __AFCSetErrorResult_4(1, v424, 3892330497, v425, 1592, "stat %p", v426, v427, (char)ptr);
        goto LABEL_413;
      }
      if ((valuePtr.st_mode & 0xF000) == 0x4000) {
        goto LABEL_174;
      }
      uint64_t v391 = 3892330512;
      v392 = (const char *)ptr;
      uint64_t v390 = 0xFFFFFFFFLL;
      int v393 = 1596;
LABEL_412:
      unsigned int v394 = __AFCSetErrorResult_4(1, v390, v391, v191, v393, v392, v192, v193, (char)v481);
LABEL_413:
      unsigned int v190 = v394;
LABEL_305:
      if (v182 < 0) {
        goto LABEL_434;
      }
LABEL_433:
      close(v182);
LABEL_434:
      v412 = *(const void **)__str;
      if (*(void *)__str)
      {
        (*(void (**)(void))(*(void *)__str + 16))(*(void *)__str);
        _Block_release(v412);
      }
      unsigned int v413 = AFCSendStatus(a1, v2, v190);
      if (v190) {
        return v190;
      }
      else {
        return v413;
      }
    case 0xALL:
      memset(&valuePtr, 0, sizeof(valuePtr));
      if (__AFCConnectionGetRequestPath(a1, (char *)(v2 + 40), (char *)&theDict, 0x400uLL))
      {
        AFCLog(5, "AFCProcessGetFileInfo(%s)\n", (const char *)&theDict);
        if (__AFCPathDepthCheck((const char *)(v2 + 40)))
        {
          uint64_t v75 = AFCDiscardBodyData(a1, v2);
          if (v75) {
            goto LABEL_453;
          }
          AFCLog(5, "lstat(%s)", (const char *)&theDict);
          CFDictionaryRef Mutable = CFDataCreateMutable(0, 0);
          if (Mutable)
          {
            if (!lstat((const char *)&theDict, &valuePtr))
            {
              CFDataAppendBytes(Mutable, (const UInt8 *)"st_size", 8);
              snprintf(__str, 0x80uLL, "%lld", valuePtr.st_size);
              size_t v272 = strlen(__str);
              CFDataAppendBytes(Mutable, (const UInt8 *)__str, v272 + 1);
              CFDataAppendBytes(Mutable, (const UInt8 *)"st_blocks", 10);
              snprintf(__str, 0x80uLL, "%lld", valuePtr.st_blocks);
              size_t v273 = strlen(__str);
              CFDataAppendBytes(Mutable, (const UInt8 *)__str, v273 + 1);
              CFDataAppendBytes(Mutable, (const UInt8 *)"st_nlink", 9);
              snprintf(__str, 0x80uLL, "%d", valuePtr.st_nlink);
              size_t v274 = strlen(__str);
              CFDataAppendBytes(Mutable, (const UInt8 *)__str, v274 + 1);
              CFDataAppendBytes(Mutable, (const UInt8 *)"st_ifmt", 8);
              v275 = "S_IFREG";
              switch((unsigned __int16)((valuePtr.st_mode & 0xF000) + 24576) >> 12)
              {
                case 0:
                  CFDataAppendBytes(Mutable, (const UInt8 *)"S_IFLNK", 8);
                  ssize_t v276 = readlink((const char *)&theDict, (char *)ptr, 0x400uLL);
                  if ((v276 & 0x8000000000000000) == 0)
                  {
                    *((unsigned char *)&ptr[0].st_dev + v276) = 0;
                    CFDataAppendBytes(Mutable, (const UInt8 *)"LinkTarget", 11);
                    CFIndex v277 = strlen((const char *)ptr) + 1;
                    v278 = (const UInt8 *)ptr;
                    v279 = Mutable;
                    goto LABEL_372;
                  }
                  goto LABEL_373;
                case 2:
                  v275 = "S_IFSOCK";
                  goto LABEL_371;
                case 7:
                  v275 = "S_IFIFO";
                  goto LABEL_371;
                case 8:
                  v275 = "S_IFCHR";
                  goto LABEL_371;
                case 10:
                  v275 = "S_IFDIR";
                  goto LABEL_371;
                case 12:
                  v275 = "S_IFBLK";
                  goto LABEL_371;
                default:
LABEL_371:
                  CFIndex v277 = strlen(v275) + 1;
                  v279 = Mutable;
                  v278 = (const UInt8 *)v275;
LABEL_372:
                  CFDataAppendBytes(v279, v278, v277);
LABEL_373:
                  CFDataAppendBytes(Mutable, (const UInt8 *)"st_mtime", 9);
                  snprintf(__str, 0x80uLL, "%llu", valuePtr.st_mtimespec.tv_nsec + 1000000000 * valuePtr.st_mtimespec.tv_sec);
                  size_t v364 = strlen(__str);
                  CFDataAppendBytes(Mutable, (const UInt8 *)__str, v364 + 1);
                  CFDataAppendBytes(Mutable, (const UInt8 *)"st_birthtime", 13);
                  snprintf(__str, 0x80uLL, "%llu", valuePtr.st_birthtimespec.tv_nsec + 1000000000 * valuePtr.st_birthtimespec.tv_sec);
                  size_t v365 = strlen(__str);
                  CFDataAppendBytes(Mutable, (const UInt8 *)__str, v365 + 1);
                  break;
              }
LABEL_384:
              AFCLog(5, "Sending data buffer\n");
              BytePtr = (char *)CFDataGetBytePtr(Mutable);
              CFIndex Length = CFDataGetLength(Mutable);
              AFCSendDataPacket(a1, v2, BytePtr, Length);
              uint64_t v9 = 0;
              goto LABEL_385;
            }
            uint64_t v469 = *__error();
            uint64_t v466 = 3892330500;
            v467 = "lstat";
            int v468 = 0;
            int v470 = 1072;
          }
          else
          {
            uint64_t v466 = 3892330499;
            v467 = "CFDataCreateMutable";
            int v468 = 1;
            uint64_t v469 = 0xFFFFFFFFLL;
            int v470 = 1070;
          }
          uint64_t v9 = __AFCSetErrorResult_4(v468, v469, v466, v269, v470, v467, v270, v271, v483);
LABEL_382:
          if (!v9) {
            goto LABEL_384;
          }
LABEL_383:
          AFCSendStatus(a1, v2, v9);
LABEL_385:
          if (!Mutable) {
            return v9;
          }
          v291 = Mutable;
LABEL_387:
          CFRelease(v291);
          return v9;
        }
        v460 = "Request path is outside document root";
        int v461 = 0;
        uint64_t v459 = 3892330503;
        int v462 = 1062;
      }
      else
      {
        uint64_t v459 = 3892330498;
        v460 = "AFCConnectionGetRequestPath";
        int v461 = 1;
        int v462 = 1054;
      }
      uint64_t v9 = __AFCSetErrorResult_4(v461, 0xFFFFFFFFLL, v459, v266, v462, v460, v267, v268, (char)p_theDict);
      CFDictionaryRef Mutable = 0;
      goto LABEL_382;
    case 0xBLL:
      AFCLog(5, "Processing device info packet\n");
      uint64_t v234 = AFCDiscardBodyData(a1, v2);
      if (v234)
      {
        uint64_t v9 = v234;
        CFDataRef v238 = 0;
      }
      else
      {
        CFDataRef v238 = CFDataCreateMutable(0, 0);
        if (v238)
        {
          v239 = fopen("/Library/Preferences/SystemConfiguration/com.apple.afc.DeviceInfo.plist", "r");
          if (v239)
          {
            v240 = v239;
            AFCLog(5, "Found info plist file.\n");
            int v241 = feof(v240);
            AFCLog(5, "feof %d\n", v241);
            if (feof(v240)) {
              goto LABEL_389;
            }
            v242 = "got line: '%s'\n";
            uint64_t v243 = MEMORY[0x263EF8318];
            theData = v238;
            while (1)
            {
              v244 = fgets((char *)&theDict, 128, v240);
              if (!v244)
              {
                AFCLog(5, "no more lines\n");
LABEL_389:
                AFCLog(5, "Sending data buffer\n");
                v379 = (char *)CFDataGetBytePtr(v238);
                CFIndex v380 = CFDataGetLength(v238);
                AFCSendDataPacket(a1, v2, v379, v380);
                uint64_t v9 = 0;
LABEL_390:
                if (v238) {
                  CFRelease(v238);
                }
                if (v240) {
                  fclose(v240);
                }
                return v9;
              }
              v245 = v244;
              AFCLog(5, v242, v244);
              int v246 = *(unsigned __int8 *)v245;
              if (!*v245) {
                goto LABEL_226;
              }
              if (v246 != 35) {
                break;
              }
              AFCLog(5, "Comment line\n");
LABEL_251:
              if (feof(v240)) {
                goto LABEL_389;
              }
            }
            do
            {
              if ((v246 & 0x80) != 0)
              {
                if (!__maskrune((char)v246, 0x4000uLL)) {
                  break;
                }
              }
              else if ((*(_DWORD *)(v243 + 4 * (char)v246 + 60) & 0x4000) == 0)
              {
                break;
              }
              int v247 = *(unsigned __int8 *)++v245;
              LOBYTE(v246) = v247;
            }
            while (v247);
LABEL_226:
            for (uint64_t i = v245; ; ++i)
            {
              if (!*i) {
                goto LABEL_251;
              }
              if (*i == 61) {
                break;
              }
            }
            v249 = i;
            while (1)
            {
              *v249-- = 0;
              if (v249 <= (const char *)&theDict) {
                break;
              }
              unsigned int v250 = *v249;
              if ((v250 & 0x80000000) != 0)
              {
                if (!__maskrune(v250, 0x4000uLL)) {
                  break;
                }
              }
              else if ((*(_DWORD *)(v243 + 4 * v250 + 60) & 0x4000) == 0)
              {
                break;
              }
            }
            v251 = v242;
            uint64_t v252 = v2;
            uint64_t v253 = a1;
            AFCLog(5, "Key: '%s'\n", v245);
            while (1)
            {
              v254 = i;
              unsigned int v256 = *++i;
              unsigned int v255 = v256;
              if (!v256) {
                break;
              }
              if ((v255 & 0x80000000) != 0)
              {
                if (!__maskrune(v255, 0x4000uLL)) {
                  break;
                }
              }
              else if ((*(_DWORD *)(v243 + 4 * v255 + 60) & 0x4000) == 0)
              {
                break;
              }
            }
            unint64_t v257 = 0;
            v258 = v254;
            uint64_t v259 = 2;
            do
            {
              uint64_t v260 = v259;
              v261 = (char *)v258;
              int v262 = v254[++v257];
              ++v259;
              ++v258;
            }
            while (v262);
            a1 = v253;
            uint64_t v2 = v252;
            v242 = v251;
            if (v257 >= 3)
            {
              do
              {
                unsigned int v263 = *v261;
                if ((v263 & 0x80000000) != 0)
                {
                  if (!__maskrune(v263, 0x4000uLL)) {
                    break;
                  }
                }
                else if ((*(_DWORD *)(v243 + 4 * v263 + 60) & 0x4000) == 0)
                {
                  break;
                }
                *v261-- = 0;
                --v260;
              }
              while (v260 > 3);
            }
            AFCLog(5, "Value: '%s'\n", i);
            size_t v264 = strlen(v245);
            CFDataRef v238 = theData;
            CFDataAppendBytes(theData, (const UInt8 *)v245, v264 + 1);
            size_t v265 = strlen(i);
            CFDataAppendBytes(theData, (const UInt8 *)i, v265 + 1);
            goto LABEL_251;
          }
          AFCLog(5, "No file found\n");
          uint64_t appended = AFCDeviceAppendDeviceInfo(a1, v238);
        }
        else
        {
          uint64_t appended = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330499, v235, 1162, "CFDataCreateMutable", v236, v237, (char)p_theDict);
        }
        uint64_t v9 = appended;
        if (!appended)
        {
          v240 = 0;
          goto LABEL_389;
        }
      }
      AFCSendStatus(a1, v2, v9);
      v240 = 0;
      goto LABEL_390;
    case 0xDLL:
      uint64_t Context = AFCConnectionGetContext(a1);
      v488 = 0;
      memset(&valuePtr, 0, sizeof(valuePtr));
      if (__AFCConnectionGetRequestPath(a1, (char *)(v2 + 48), (char *)&theDict, 0x400uLL))
      {
        AFCLog(5, "Processing FileRefOpen packet\n");
        if (Context)
        {
          uint64_t v63 = AFCDiscardBodyData(a1, v2);
          if (v63)
          {
            uint64_t v9 = v63;
            int v69 = 0;
            goto LABEL_428;
          }
          if (gAFCMaxOpenFileCount)
          {
            uint64_t v67 = 0;
            uint64_t v68 = Context + 80;
            while (*(_DWORD *)v68 != -1)
            {
              ++v67;
              v68 += 40;
              if (gAFCMaxOpenFileCount == v67) {
                goto LABEL_50;
              }
            }
            v487 = (char *)a1;
            if ((v67 & 0x8000000000000000) == 0)
            {
              uint64_t v343 = *(void *)(v2 + 40);
              AFCLog(5, "AFCProcessFileRefOpen(%s) mode %d\n", (const char *)&theDict, v343);
              if ((unint64_t)(v343 - 1) >= 7)
              {
                uint64_t v356 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330503, v344, 2027, "Invalid file mode %d", v345, v346, v343);
                int v69 = 0;
                if (v356)
                {
                  uint64_t v9 = v356;
                  goto LABEL_427;
                }
              }
              else
              {
                int v69 = dword_2210CEC90[v343 - 1];
              }
              if (!gAllowSpecialFiles) {
                v69 |= 0x100u;
              }
              uint64_t v357 = AFCCheckForSpecialFile((const char *)&theDict, (const char *)(v2 + 48));
              if (v357)
              {
                uint64_t v9 = v357;
                int v69 = 0;
                goto LABEL_448;
              }
              if (v487[1268]
                && (!v69 ? (uint64_t v358 = 1) : (uint64_t v358 = 8),
                    uint64_t v359 = __AFCCoordinateFileActivity((const char *)&theDict, v358, &v488),
                    v359))
              {
                uint64_t v9 = v359;
                int v69 = 0;
              }
              else
              {
                LOBYTE(v484) = -92;
                if (v487[1269]) {
                  int v360 = open((const char *)&theDict, v69);
                }
                else {
                  int v360 = open_dprotected_np((const char *)&theDict, v69, 4, 0);
                }
                int v69 = v360;
                if (v360 == -1)
                {
                  v471 = __error();
                  uint64_t v9 = __AFCSetErrorResult_4(0, *v471, 3892330497, v472, 2055, "open", v473, v474, 164);
                  int v69 = -1;
                  goto LABEL_448;
                }
                if (v360 < 0)
                {
                  __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330503, v361, 191, "file descriptor %d is invalid", v362, v363, v360);
                  uint64_t v9 = 3892330503;
                }
                else
                {
                  if (gAllowSpecialFiles) {
                    goto LABEL_398;
                  }
                  memset(ptr, 0, 144);
                  if (fstat(v360, ptr))
                  {
                    uint64_t v405 = *__error();
                    v406 = __error();
                    char v407 = strerror(*v406);
                    __AFCSetErrorResult_4(1, v405, 3892330519, v408, 206, "failed to retrieve file information (%s)", v409, v410, v407);
                    uint64_t v9 = 23;
                  }
                  else
                  {
                    int v421 = ptr[0].st_mode & 0xF000;
                    if (v421 == 0x4000 || v421 == 0x8000)
                    {
LABEL_398:
                      if (fstat(v69, &valuePtr) == -1)
                      {
                        uint64_t v414 = *__error();
                        v415 = __error();
                        v416 = strerror(*v415);
                        uint64_t v417 = v414;
                        uint64_t v418 = 23;
                        int v419 = 2062;
                      }
                      else
                      {
                        if (valuePtr.st_nlink != 1)
                        {
                          uint64_t v420 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 1, v381, 2067, "Failed open operation as there are additional hard links (%d) to the file being opened.", v382, v383, valuePtr.st_nlink);
LABEL_447:
                          uint64_t v9 = v420;
LABEL_448:
                          a1 = (uint64_t)v487;
                          goto LABEL_52;
                        }
                        v484 = ptr;
                        if (fcntl(v69, 50) == -1)
                        {
                          uint64_t v422 = *__error();
                          v423 = __error();
                          v416 = strerror(*v423);
                          uint64_t v417 = v422;
                          uint64_t v418 = 23;
                          int v419 = 2073;
                        }
                        else
                        {
                          if (__AFCHasPrefix((const char *)ptr, v487 + 224))
                          {
                            AFCLog(5, "Setting file descriptor index %d to %d\n", v67, v69);
                            *(_DWORD *)uint64_t v68 = v69;
                            *(void *)(v68 + 8) = 0;
                            if (fcntl(v69, 76, 1) < 0)
                            {
                              v387 = __error();
                              AFCLog(5, "F_SINGLE_WRITER failed (%d)!\n", *v387);
                            }
                            if (fcntl(v69, 48, 1) < 0)
                            {
                              v388 = __error();
                              AFCLog(5, "F_NOCACHE failed (%d)!\n", *v388);
                            }
                            if (v343 == 7 && fcntl(v69, 68, 1) < 0)
                            {
                              v389 = __error();
                              AFCLog(5, "F_SETSTATICCONTENT failed (%d)!\n", *v389);
                            }
                            *(_DWORD *)(v68 + 16) = 0;
                            int v70 = v67;
                            a1 = (uint64_t)v487;
                            goto LABEL_54;
                          }
                          v416 = "Path obtained by fcntl (%s) doesn't have the correct prefix: %s.";
                          v484 = ptr;
                          uint64_t v417 = 0xFFFFFFFFLL;
                          uint64_t v418 = 1;
                          int v419 = 2078;
                        }
                      }
                      uint64_t v420 = __AFCSetErrorResult_4(1, v417, v418, v384, v419, v416, v385, v386, (char)v484);
                      goto LABEL_447;
                    }
                    uint64_t v9 = 3892330506;
                    __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330506, v402, 200, "file descriptor %d is special file", v403, v404, v69);
                  }
                }
              }
LABEL_427:
              a1 = (uint64_t)v487;
              goto LABEL_428;
            }
          }
          else
          {
LABEL_50:
            uint64_t v67 = -1;
          }
          uint64_t v9 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330499, v64, 2000, "No file slots", v65, v66, (char)p_theDict);
          int v69 = 0;
          goto LABEL_52;
        }
        uint64_t v435 = 3892330499;
        v436 = "No server context";
        int v437 = 1994;
      }
      else
      {
        uint64_t v435 = 3892330498;
        v436 = "AFCConnectionGetRequestPath";
        int v437 = 1990;
      }
      uint64_t v9 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, v435, v60, v437, v436, v61, v62, (char)p_theDict);
      int v69 = 0;
      uint64_t v67 = 0;
LABEL_52:
      if (!v9)
      {
        int v70 = v67;
LABEL_54:
        long long v490 = 0u;
        long long v491 = 0u;
        *(_OWORD *)__str = 0u;
        uint64_t v71 = Context + 40 * v67;
        AFCLog(5, "Success, returning ref %d = fd %d\n", v70, *(_DWORD *)(v71 + 80));
        AFCHeaderInit(__str, 14, 48, 0, v2);
        *((void *)&v491 + 1) = v67 + 1;
        *(void *)(v71 + 112) = v488;
        return AFCSendHeader(a1, (uint64_t)__str);
      }
LABEL_428:
      AFCLog(5, "sending status %d\n", v9);
      AFCSendStatus(a1, v2, v9);
      v411 = v488;
      if (v488)
      {
        v488[2](v488);
        _Block_release(v411);
      }
      if (v69 != -1) {
        close(v69);
      }
      return v9;
    case 0xFLL:
      uint64_t v159 = a1;
      v160 = (void *)v2;
      int v161 = 0;
      goto LABEL_209;
    case 0x10:
      uint64_t v111 = a1;
      v112 = (void *)v2;
      uint64_t v113 = 0;
      goto LABEL_124;
    case 0x11:
      *(void *)&ptr[0].st_dev = 0;
      ptr[0].__darwin_ino64_t st_ino = (__darwin_ino64_t)ptr;
      *(void *)&ptr[0].st_uid = 0x2000000000;
      ptr[0].st_rdev = 0;
      uint64_t v31 = AFCConnectionGetContext(a1);
      if (v31)
      {
        uint64_t v35 = v31;
        uint64_t v36 = AFCDiscardBodyData(a1, v2);
        *(_DWORD *)(ptr[0].st_ino + 24) = v36;
        if (v36) {
          goto LABEL_451;
        }
        unint64_t v37 = (*(_DWORD *)(v2 + 40) - 1);
        AFCLog(5, "Processing FileRefSeek ref %d offset %qd whence %d\n", *(_DWORD *)(v2 + 40) - 1, *(void *)(v2 + 56), *(void *)(v2 + 48));
        if (gAFCMaxOpenFileCount > v37)
        {
          int v41 = *(_DWORD *)(v35 + 40 * v37 + 80);
          if (v41 != -1)
          {
            BOOL v42 = __AFCAllowedToOperateOnFile(v41, (char *)(a1 + 224), v38, v32, v39, v40, v33, v34);
            __darwin_ino64_t st_ino = ptr[0].st_ino;
            *(_DWORD *)(ptr[0].st_ino + 24) = v42;
            if (v42)
            {
              uint64_t v9 = 1;
              goto LABEL_515;
            }
            *(_DWORD *)(st_ino + 24) = 0;
            unint64_t v47 = *(void *)(v2 + 48);
            if (v47 < 3)
            {
LABEL_33:
              v48 = *(NSObject **)(v35 + 40 * v37 + 104);
              *(void *)&theDict.uint64_t f_bsize = MEMORY[0x263EF8330];
              theDict.f_blocks = 0x40000000;
              theDict.f_bfree = (uint64_t)__AFCProcessFileRefSeekPacket_block_invoke;
              theDict.f_bavail = (uint64_t)&unk_26458CDB8;
              theDict.f_ffree = v35;
              theDict.f_fsid = (fsid_t)v2;
              theDict.f_owner = v37;
              theDict.f_type = v47;
              theDict.f_files = (uint64_t)ptr;
              dispatch_sync(v48, &theDict);
              goto LABEL_203;
            }
            uint64_t v36 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330503, v43, 2498, "Invalid whence argument", v44, v45, (char)p_theDict);
            *(_DWORD *)(ptr[0].st_ino + 24) = v36;
            if (!v36)
            {
              LODWORD(v47) = 0;
              goto LABEL_33;
            }
LABEL_451:
            uint64_t v9 = v36;
LABEL_515:
            AFCSendStatus(a1, v2, v9);
LABEL_207:
            *(_DWORD *)(ptr[0].st_ino + 24) = v9;
LABEL_334:
            p_stat valuePtr = ptr;
LABEL_335:
            _Block_object_dispose(p_valuePtr, 8);
            return v9;
          }
        }
        v429 = "Invalid file ref";
        uint64_t v428 = 3892330503;
        int v430 = 2480;
      }
      else
      {
        uint64_t v428 = 3892330499;
        v429 = "No server context";
        int v430 = 2471;
      }
      LODWORD(v9) = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, v428, v32, v430, v429, v33, v34, (char)p_theDict);
      *(_DWORD *)(ptr[0].st_ino + 24) = v9;
LABEL_204:
      unsigned int v233 = AFCSendStatus(a1, v2, v9);
      if (v9) {
        uint64_t v9 = v9;
      }
      else {
        uint64_t v9 = v233;
      }
      goto LABEL_207;
    case 0x12:
      *(void *)&valuePtr.st_dev = 0;
      valuePtr.__darwin_ino64_t st_ino = (__darwin_ino64_t)&valuePtr;
      *(void *)&valuePtr.st_uid = 0x2000000000;
      valuePtr.st_rdev = -402636799;
      uint64_t v212 = AFCConnectionGetContext(a1);
      *(void *)__str = 0;
      *(void *)&__str[8] = __str;
      long long v490 = 0x2000000000uLL;
      AFCLog(5, "Processing FileRefTell packet\n");
      if (v212)
      {
        uint64_t v216 = AFCDiscardBodyData(a1, v2);
        *(_DWORD *)(valuePtr.st_ino + 24) = v216;
        if (v216)
        {
          uint64_t v9 = v216;
          goto LABEL_196;
        }
        unint64_t v220 = (*(_DWORD *)(v2 + 40) - 1);
        if (gAFCMaxOpenFileCount > v220)
        {
          int v221 = *(_DWORD *)(v212 + 40 * v220 + 80);
          if (v221 != -1)
          {
            BOOL v222 = __AFCAllowedToOperateOnFile(v221, (char *)(a1 + 224), v217, v213, v218, v219, v214, v215);
            *(_DWORD *)(valuePtr.st_ino + 24) = v222;
            if (v222)
            {
              uint64_t v9 = 1;
              goto LABEL_196;
            }
            v223 = *(NSObject **)(v212 + 40 * v220 + 104);
            *(void *)&theDict.uint64_t f_bsize = MEMORY[0x263EF8330];
            theDict.f_blocks = 0x40000000;
            theDict.f_bfree = (uint64_t)__AFCProcessFileRefTellPacket_block_invoke;
            theDict.f_bavail = (uint64_t)&unk_26458CDE0;
            theDict.f_owner = v220;
            theDict.f_files = (uint64_t)__str;
            theDict.f_ffree = (uint64_t)&valuePtr;
            theDict.f_fsid = (fsid_t)v212;
            dispatch_sync(v223, &theDict);
            uint64_t v9 = *(unsigned int *)(valuePtr.st_ino + 24);
            if (v9)
            {
LABEL_196:
              AFCSendStatus(a1, v2, v9);
              *(_DWORD *)(valuePtr.st_ino + 24) = v9;
              goto LABEL_496;
            }
LABEL_495:
            memset(ptr, 0, 48);
            AFCHeaderInit(ptr, 19, 48, 0, v2);
            ptr[0].st_atimespec.tv_nsec = *(void *)(*(void *)&__str[8] + 24);
            unsigned int v465 = AFCSendHeader(a1, (uint64_t)ptr);
            *(_DWORD *)(valuePtr.st_ino + 24) = v465;
            uint64_t v9 = v465;
LABEL_496:
            _Block_object_dispose(__str, 8);
            p_stat valuePtr = &valuePtr;
            goto LABEL_335;
          }
        }
        v454 = "Invalid file ref";
        uint64_t v453 = 3892330503;
        int v455 = 2540;
      }
      else
      {
        uint64_t v453 = 3892330499;
        v454 = "No server context";
        int v455 = 2533;
      }
      uint64_t v9 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, v453, v213, v455, v454, v214, v215, (char)p_theDict);
      *(_DWORD *)(valuePtr.st_ino + 24) = v9;
      if (v9) {
        goto LABEL_196;
      }
      goto LABEL_495;
    case 0x14:
      *(void *)&ptr[0].st_dev = 0;
      ptr[0].__darwin_ino64_t st_ino = (__darwin_ino64_t)ptr;
      *(void *)&ptr[0].st_uid = 0x2000000000;
      ptr[0].st_rdev = 0;
      uint64_t v224 = AFCConnectionGetContext(a1);
      if (v224)
      {
        uint64_t v228 = v224;
        int v229 = AFCDiscardBodyData(a1, v2);
        *(_DWORD *)(ptr[0].st_ino + 24) = v229;
        if (v229) {
          goto LABEL_202;
        }
        int v230 = *(_DWORD *)(v2 + 40);
        unint64_t v231 = (v230 - 1);
        AFCLog(5, "Processing FileRefClose ref %d\n", v230 - 1);
        if (gAFCMaxOpenFileCount > v231 && *(_DWORD *)(v228 + 40 * v231 + 80) != -1)
        {
          v232 = *(NSObject **)(v228 + 40 * v231 + 104);
          *(void *)&theDict.uint64_t f_bsize = MEMORY[0x263EF8330];
          theDict.f_blocks = 0x40000000;
          theDict.f_bfree = (uint64_t)__AFCProcessFileRefClosePacket_block_invoke;
          theDict.f_bavail = (uint64_t)&unk_26458CE08;
          theDict.f_fsid.val[0] = v231;
          theDict.f_files = (uint64_t)ptr;
          theDict.f_ffree = v228;
          dispatch_sync(v232, &theDict);
          int v229 = *(_DWORD *)(ptr[0].st_ino + 24);
          goto LABEL_202;
        }
        v457 = "Invalid file ref";
        uint64_t v456 = 3892330503;
        int v458 = 2590;
      }
      else
      {
        uint64_t v456 = 3892330499;
        v457 = "No server context";
        int v458 = 2581;
      }
      int v229 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, v456, v225, v458, v457, v226, v227, (char)p_theDict);
      *(_DWORD *)(ptr[0].st_ino + 24) = v229;
LABEL_202:
      AFCLog(5, "FileRefClose returns %d (deferred %d)\n", v229, 0);
LABEL_203:
      LODWORD(v9) = *(_DWORD *)(ptr[0].st_ino + 24);
      goto LABEL_204;
    case 0x15:
      uint64_t v292 = AFCConnectionGetContext(a1);
      *(void *)&ptr[0].st_dev = 0;
      ptr[0].__darwin_ino64_t st_ino = (__darwin_ino64_t)ptr;
      *(void *)&ptr[0].st_uid = 0x2000000000;
      ptr[0].st_rdev = 0;
      if (v292)
      {
        uint64_t v296 = v292;
        unsigned int v297 = AFCDiscardBodyData(a1, v2);
        if (v297)
        {
LABEL_281:
          unsigned int v309 = v297;
          goto LABEL_331;
        }
        unint64_t v298 = (*(_DWORD *)(v2 + 40) - 1);
        AFCLog(5, "Processing FileRefSetFileSize (ref %d, size %d)\n", *(_DWORD *)(v2 + 40) - 1, *(void *)(v2 + 48));
        if (gAFCMaxOpenFileCount <= v298 || (int v302 = *(_DWORD *)(v296 + 40 * v298 + 80), v302 == -1))
        {
          v306 = "Invalid file ref";
          int v307 = 1;
          uint64_t v304 = 0xFFFFFFFFLL;
          uint64_t v305 = 3892330503;
          int v308 = 2978;
          goto LABEL_280;
        }
        if (__AFCAllowedToOperateOnFile(v302, (char *)(a1 + 224), v299, v293, v300, v301, v294, v295))
        {
          unsigned int v309 = 1;
        }
        else
        {
          v303 = *(NSObject **)(v296 + 40 * v298 + 104);
          *(void *)&theDict.uint64_t f_bsize = MEMORY[0x263EF8330];
          theDict.f_blocks = 0x40000000;
          theDict.f_bfree = (uint64_t)__AFCProcessFileRefSetFileSizePacket_block_invoke;
          theDict.f_bavail = (uint64_t)&unk_26458CE30;
          theDict.f_files = (uint64_t)ptr;
          theDict.f_ffree = v296;
          theDict.f_owner = v298;
          theDict.f_fsid = (fsid_t)v2;
          dispatch_sync(v303, &theDict);
          if (*(_DWORD *)(ptr[0].st_ino + 24))
          {
            uint64_t v304 = *__error();
            uint64_t v305 = 3892330501;
            v306 = "ftruncate";
            int v307 = 0;
            int v308 = 2991;
LABEL_280:
            unsigned int v297 = __AFCSetErrorResult_4(v307, v304, v305, v293, v308, v306, v294, v295, (char)p_theDict);
            goto LABEL_281;
          }
          unsigned int v309 = 0;
        }
LABEL_331:
        AFCLog(5, "FileRefSetFileSize returns %d\n", v309);
        unsigned int v341 = AFCSendStatus(a1, v2, v309);
        if (v309) {
          uint64_t v9 = v309;
        }
        else {
          uint64_t v9 = v341;
        }
        goto LABEL_334;
      }
      uint64_t v305 = 3892330499;
      v306 = "No server context";
      int v307 = 1;
      uint64_t v304 = 0xFFFFFFFFLL;
      int v308 = 2969;
      goto LABEL_280;
    case 0x16:
      *(__CFString **)&theDict.uint64_t f_bsize = kAFCConnectionOptionExtendedStatusKey[0];
      theDict.f_blocks = kAFCConnectionServerVersionKey;
      ptr[0].__darwin_ino64_t st_ino = 0;
      *(void *)&ptr[0].st_dev = 0;
      valuePtr.st_dev = *(_DWORD *)(a1 + 128) & 1;
      CFStringRef v280 = CFStringCreateWithCString(0, "@(#)PROGRAM:afc  PROJECT:afc-279\n", 0x8000100u);
      CFNumberRef v281 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
      CFNumberRef v282 = v281;
      if (v280 && v281)
      {
        *(void *)&ptr[0].st_dev = v281;
        ptr[0].__darwin_ino64_t st_ino = (__darwin_ino64_t)v280;
        CFDictionaryRef v283 = CFDictionaryCreate(0, (const void **)&theDict, (const void **)ptr, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        CFDictionaryRef v284 = v283;
        if (v283 && (CFDataRef v285 = __AFCCreateAFCDataWithDictionary(v283)) != 0)
        {
          CFDataRef v286 = v285;
          v287 = (char *)CFDataGetBytePtr(v285);
          CFIndex v288 = CFDataGetLength(v286);
          uint64_t v9 = AFCSendDataPacket(a1, v2, v287, v288);
        }
        else
        {
          uint64_t v9 = AFCSendStatus(a1, v2, 0);
          CFDataRef v286 = 0;
        }
      }
      else
      {
        uint64_t v9 = AFCSendStatus(a1, v2, 0);
        CFDataRef v286 = 0;
        CFDictionaryRef v284 = 0;
        CFDataRef v289 = 0;
        CFDictionaryRef v290 = 0;
        if (!v280)
        {
LABEL_267:
          if (v282) {
            CFRelease(v282);
          }
          if (v290) {
            CFRelease(v290);
          }
          if (!v289) {
            return v9;
          }
          v291 = v289;
          goto LABEL_387;
        }
      }
      CFRelease(v280);
      CFDataRef v289 = v286;
      CFDictionaryRef v290 = v284;
      goto LABEL_267;
    case 0x17:
      *(void *)&theDict.uint64_t f_bsize = 0;
      *(void *)&ptr[0].st_dev = 0;
      *(void *)&valuePtr.st_dev = 0;
      int v10 = AFCReadPacketBody((unsigned char *)a1, v2, (char **)ptr, (size_t *)&valuePtr, v5, v6, v7, v8, (char)p_theDict);
      if (v10
        || (int v10 = __AFCCreateDictionaryOrArrayFromData(0, *(void **)&ptr[0].st_dev, *(uint64_t *)&valuePtr.st_dev, 1, (CFArrayRef *)&theDict)) != 0)
      {
        int v22 = v10;
        uint64_t v13 = (const void *)a1;
        uint64_t v17 = 0;
      }
      else if (*(void *)&theDict.f_bsize {
             && (CFIndex Count = CFDictionaryGetCount(*(CFDictionaryRef *)&theDict.f_bsize), Count >= 1))
      }
      {
        CFIndex v12 = Count;
        uint64_t v13 = (const void *)a1;
        uint64_t v17 = (const void **)CFAllocatorAllocate(0, 16 * Count, 0);
        if (v17)
        {
          CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)&theDict.f_bsize, v17, &v17[v12]);
          for (uint64_t j = 0; j != v12; ++j)
          {
            CFStringRef v19 = (const __CFString *)v17[j];
            CFStringRef v20 = (const __CFString *)*(&v17[v12] + j);
            if (CFStringCompare(v19, kAFCConnectionOptionServerDebugLevelKey, 0))
            {
              if (CFStringCompare(v19, kAFCConnectionOptionExtendedStatusKey[0], 0))
              {
                if (CFEqual(v19, kAFCConnectionOptionTrailingJunkKey[0])) {
                  *(_DWORD *)(a1 + 128) = *(_DWORD *)(a1 + 128) & 0xFFFF7FFF | ((CFStringGetIntValue(v20) != 0) << 15);
                }
              }
              else
              {
                *(_DWORD *)(a1 + 128) = *(_DWORD *)(a1 + 128) & 0xFFFFFFFE | (CFStringGetIntValue(v20) != 0);
              }
            }
            else
            {
              IntCFStringRef Value = CFStringGetIntValue(v20);
              AFCSetLogLevel(IntValue);
            }
          }
          int v22 = 0;
        }
        else
        {
          int v22 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330499, v14, 3024, "malloc", v15, v16, v480);
        }
      }
      else
      {
        uint64_t v13 = (const void *)a1;
        uint64_t v17 = 0;
        int v22 = 0;
      }
      if (*(void *)&ptr[0].st_dev)
      {
        CFAllocatorRef v23 = CFGetAllocator(v13);
        CFAllocatorDeallocate(v23, *(void **)&ptr[0].st_dev);
      }
      if (v17) {
        CFAllocatorDeallocate(0, v17);
      }
      if (*(void *)&theDict.f_bsize) {
        CFRelease(*(CFTypeRef *)&theDict.f_bsize);
      }
      uint64_t v24 = (uint64_t)v13;
      uint64_t v25 = v2;
      int v26 = v22;
      return AFCSendStatus(v24, v25, v26);
    case 0x18:
      *(void *)&valuePtr.st_dev = 0;
      v114 = (std::__fs::filesystem::path *)CFAllocatorAllocate(0, 1024, 0);
      if (!v114)
      {
        uint64_t v56 = 3892330499;
        v57 = "CFAllocatorAllocate";
        int v58 = 1465;
LABEL_42:
        LODWORD(v9) = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, v56, v4, v58, v57, v7, v8, (char)p_theDict);
LABEL_327:
        unsigned int v340 = AFCSendStatus(a1, v2, v9);
        if (v9) {
          return v9;
        }
        else {
          return v340;
        }
      }
      v115 = v114;
      uint64_t v116 = v2 + 40;
      size_t v117 = strlen((const char *)(v2 + 40));
      if (!__AFCConnectionGetRequestPath(a1, (char *)(v2 + 40), (char *)&theDict, 0x400uLL))
      {
        uint64_t v138 = 3892330498;
        v135 = "AFCConnectionGetRequestPath";
        int v136 = 1;
        uint64_t v137 = 0xFFFFFFFFLL;
        int v139 = 1470;
        goto LABEL_107;
      }
      if (!__AFCConnectionGetRequestPath(a1, (char *)(v117 + v116 + 1), (char *)v115, 0x400uLL))
      {
        uint64_t v138 = 3892330498;
        v135 = "AFCConnectionGetRequestPath";
        int v136 = 1;
        uint64_t v137 = 0xFFFFFFFFLL;
        int v139 = 1474;
        goto LABEL_107;
      }
      AFCLog(5, "Processing rename path '%s'->'%s'\n", (const char *)&theDict, (const char *)v115);
      int v121 = AFCDiscardBodyData(a1, v2);
      if (v121) {
        goto LABEL_108;
      }
      if (__AFCPathContainsDots((const char *)&theDict))
      {
        int v121 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330503, v122, 1492, "Request path cannot contain dots : %s", v123, v124, (char)&theDict);
        goto LABEL_108;
      }
      if (__AFCPathContainsDots((const char *)v115))
      {
        int v121 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330503, v125, 1496, "Dest path cannot contain dots : %s", v126, v127, (char)v115);
        goto LABEL_108;
      }
      if ((__AFCPathDepthCheck((const char *)(v2 + 40)) & 1) == 0)
      {
        v135 = "Request path is outside document root";
        int v136 = 0;
        uint64_t v137 = 0xFFFFFFFFLL;
        uint64_t v138 = 3892330503;
        int v139 = 1501;
        goto LABEL_107;
      }
      if ((__AFCPathDepthCheck((const char *)(v117 + v116 + 1)) & 1) == 0)
      {
        v135 = "Request path is outside document root";
        int v136 = 0;
        uint64_t v137 = 0xFFFFFFFFLL;
        uint64_t v138 = 3892330503;
        int v139 = 1506;
        goto LABEL_107;
      }
      *(void *)&ptr[0].st_dev = &theDict;
      ptr[0].__darwin_ino64_t st_ino = 0;
      v128 = fts_open((char *const *)ptr, 20, 0);
      if (!v128) {
        goto LABEL_106;
      }
      v129 = v128;
      while (1)
      {
        v130 = fts_read(v129);
        if (!v130) {
          break;
        }
        unsigned int fts_info = v130->fts_info;
        BOOL v132 = fts_info > 0xD;
        int v133 = (1 << fts_info) & 0x3080;
        if (!v132 && v133 != 0)
        {
          fts_close(v129);
LABEL_106:
          v135 = "%s contains symlinks and cannot be renamed to %s";
          p_statfs theDict = &theDict;
          int v136 = 0;
          uint64_t v137 = 0xFFFFFFFFLL;
          uint64_t v138 = 3892330503;
          int v139 = 1511;
LABEL_107:
          int v121 = __AFCSetErrorResult_4(v136, v137, v138, v118, v139, v135, v119, v120, (char)p_theDict);
LABEL_108:
          LODWORD(v9) = v121;
LABEL_418:
          v395 = *(const void **)&valuePtr.st_dev;
          if (*(void *)&valuePtr.st_dev)
          {
            (*(void (**)(void))(*(void *)&valuePtr.st_dev + 16))(*(void *)&valuePtr.st_dev);
            _Block_release(v395);
          }
          unsigned int v396 = AFCSendStatus(a1, v2, v9);
          if (v9) {
            uint64_t v9 = v9;
          }
          else {
            uint64_t v9 = v396;
          }
          CFAllocatorDeallocate(0, v115);
          return v9;
        }
      }
      fts_close(v129);
      if (*(unsigned char *)(a1 + 1268))
      {
        int v121 = __AFCCoordinateFileActivity((const char *)&theDict, 2, &valuePtr);
        if (v121) {
          goto LABEL_108;
        }
      }
      rename((const std::__fs::filesystem::path *)&theDict, v115, v347);
      if (v348)
      {
        uint64_t v137 = *__error();
        uint64_t v138 = 3892330497;
        v135 = "rename";
        int v136 = 0;
        int v139 = 1521;
        goto LABEL_107;
      }
      if (!*(unsigned char *)(a1 + 1268)) {
        goto LABEL_417;
      }
      CFAllocatorRef v349 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      size_t v350 = strlen((const char *)&theDict);
      CFURLRef v351 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)&theDict, v350, 0);
      size_t v352 = strlen((const char *)v115);
      CFURLRef v353 = CFURLCreateFromFileSystemRepresentation(v349, (const UInt8 *)v115, v352, 0);
      CFURLRef v354 = v353;
      if (v351) {
        BOOL v355 = v353 == 0;
      }
      else {
        BOOL v355 = 1;
      }
      if (v355)
      {
        if (!v351)
        {
LABEL_415:
          if (v354) {
            CFRelease(v354);
          }
LABEL_417:
          LODWORD(v9) = 0;
          goto LABEL_418;
        }
      }
      else
      {
        _CFFileDidMove2();
      }
      CFRelease(v351);
      goto LABEL_415;
    case 0x19:
      uint64_t v27 = a1;
      uint64_t v28 = v2;
      CFNumberRef v29 = _AFCSetFSBlockSize;
      unint64_t v30 = 512;
      goto LABEL_283;
    case 0x1ALL:
      uint64_t v27 = a1;
      uint64_t v28 = v2;
      CFNumberRef v29 = (uint64_t (*)(uint64_t, uint64_t, unint64_t))_AFCSetSocketBlockSize;
      unint64_t v30 = 1;
LABEL_283:
      return AFCProcessSetBlockSize(v27, v28, v29, v30);
    case 0x1BLL:
      uint64_t v94 = AFCConnectionGetContext(a1);
      *(void *)&ptr[0].st_dev = 0;
      ptr[0].__darwin_ino64_t st_ino = (__darwin_ino64_t)ptr;
      *(void *)&ptr[0].st_uid = 0x2000000000;
      ptr[0].st_rdev = 0;
      AFCLog(5, "Processing FileRefLock packet\n");
      if (!v94)
      {
        uint64_t v107 = 3892330499;
        v108 = "No server context";
        int v109 = 1;
        uint64_t v106 = 0xFFFFFFFFLL;
        int v110 = 2645;
        goto LABEL_315;
      }
      uint64_t v98 = AFCDiscardBodyData(a1, v2);
      if (v98)
      {
        uint64_t v9 = v98;
      }
      else
      {
        unint64_t v102 = (*(_DWORD *)(v2 + 40) - 1);
        if (gAFCMaxOpenFileCount <= v102 || (int v103 = *(_DWORD *)(v94 + 40 * v102 + 80), v103 == -1))
        {
          v108 = "Invalid file ref";
          int v109 = 1;
          uint64_t v106 = 0xFFFFFFFFLL;
          uint64_t v107 = 3892330503;
          int v110 = 2652;
          goto LABEL_315;
        }
        if (!__AFCAllowedToOperateOnFile(v103, (char *)(a1 + 224), v99, v95, v100, v101, v96, v97))
        {
          unsigned int v104 = *(_DWORD *)(v2 + 48);
          if (v104 >= 0x10)
          {
            v108 = "Invalid lock type";
            int v109 = 1;
            uint64_t v106 = 0xFFFFFFFFLL;
            uint64_t v107 = 3892330503;
            int v110 = 2663;
          }
          else
          {
            v105 = *(NSObject **)(v94 + 40 * v102 + 104);
            *(void *)&theDict.uint64_t f_bsize = MEMORY[0x263EF8330];
            theDict.f_blocks = 0x40000000;
            theDict.f_bfree = (uint64_t)__AFCProcessFileRefLockPacket_block_invoke;
            theDict.f_bavail = (uint64_t)&unk_26458CE58;
            theDict.f_files = (uint64_t)ptr;
            theDict.f_ffree = v94;
            theDict.f_fsid.val[0] = v102;
            theDict.f_fsid.val[1] = v104;
            dispatch_sync(v105, &theDict);
            if (!*(_DWORD *)(ptr[0].st_ino + 24)) {
              goto LABEL_292;
            }
            uint64_t v106 = *__error();
            uint64_t v107 = 3892330497;
            v108 = "flock";
            int v109 = 0;
            int v110 = 2681;
          }
LABEL_315:
          uint64_t v9 = __AFCSetErrorResult_4(v109, v106, v107, v95, v110, v108, v96, v97, (char)p_theDict);
          uint64_t v323 = AFCSendStatus(a1, v2, v9);
          if (!v9) {
LABEL_293:
          }
            uint64_t v9 = v323;
          goto LABEL_334;
        }
        uint64_t v9 = 1;
      }
      uint64_t v464 = a1;
      uint64_t v463 = v2;
      goto LABEL_526;
    case 0x1CLL:
      uint64_t v56 = 3892330511;
      v57 = "Unsupported API.";
      int v58 = 1668;
      goto LABEL_42;
    case 0x1DLL:
      *(void *)&ptr[0].st_dev = 0;
      *(void *)&valuePtr.st_dev = 0;
      if (__AFCConnectionGetRequestPath(a1, (char *)(v2 + 40), (char *)&theDict, 0x400uLL))
      {
        uint64_t v165 = AFCDiscardBodyData(a1, v2);
        if (!v165)
        {
          uint64_t v165 = AFCCheckForSpecialFile((const char *)&theDict, (const char *)(v2 + 40));
          if (!v165)
          {
            if (!*(unsigned char *)(a1 + 1268)
              || (uint64_t v165 = __AFCCoordinateFileActivity((const char *)&theDict, 1, &valuePtr), !v165))
            {
              uint64_t v165 = __AFCGetFileHash((const char *)&theDict, (CFDataRef *)ptr, 0, 0);
            }
          }
        }
      }
      else
      {
        uint64_t v165 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330498, v162, 1895, "AFCConnectionGetRequestPath", v163, v164, (char)p_theDict);
      }
      uint64_t v9 = v165;
      v166 = *(const void **)&valuePtr.st_dev;
      if (*(void *)&valuePtr.st_dev)
      {
        (*(void (**)(void))(*(void *)&valuePtr.st_dev + 16))(*(void *)&valuePtr.st_dev);
        _Block_release(v166);
      }
      if (v9) {
        goto LABEL_144;
      }
      goto LABEL_303;
    case 0x1ELL:
      if (__AFCConnectionGetRequestPath(a1, (char *)(v2 + 48), (char *)&theDict, 0x400uLL))
      {
        AFCLog(5, "AFCProcessSetModTimePacket('%s', %lld)", (const char *)&theDict, *(void *)(v2 + 40));
        uint64_t v52 = AFCDiscardBodyData(a1, v2);
        if (v52)
        {
          uint64_t v9 = v52;
          uint64_t v172 = a1;
          uint64_t v173 = v2;
          int v171 = v9;
LABEL_147:
          AFCSendStatus(v172, v173, v171);
          return v9;
        }
        uint64_t v53 = AFCCheckForSpecialFile((const char *)&theDict, (const char *)(v2 + 48));
        if (v53) {
          goto LABEL_518;
        }
        unint64_t v54 = *(void *)(v2 + 40);
        *(void *)&ptr[0].st_uid = (v54 / 0x3B9ACA00);
        *(void *)&ptr[0].st_dev = *(void *)&ptr[0].st_uid;
        ptr[0].st_rdev = v54 % 0x3B9ACA00 / 0x3E8;
        LODWORD(ptr[0].st_ino) = ptr[0].st_rdev;
        if (!utimes((const char *)&theDict, (const timeval *)ptr))
        {
          uint64_t v24 = a1;
          uint64_t v25 = v2;
          int v26 = 0;
          return AFCSendStatus(v24, v25, v26);
        }
        uint64_t v433 = *__error();
        uint64_t v431 = 3892330516;
        v432 = "utimes";
        int v434 = 2760;
      }
      else
      {
        uint64_t v431 = 3892330498;
        v432 = "AFCConnectionGetRequestPath";
        uint64_t v433 = 0xFFFFFFFFLL;
        int v434 = 2747;
      }
      uint64_t v53 = __AFCSetErrorResult_4(1, v433, v431, v49, v434, v432, v50, v51, (char)p_theDict);
LABEL_518:
      uint64_t v9 = v53;
      uint64_t v55 = AFCSendStatus(a1, v2, v53);
      if (v9) {
        return v9;
      }
      return v55;
    case 0x1FLL:
      *(void *)&ptr[0].st_dev = 0;
      *(void *)&valuePtr.st_dev = 0;
      if (__AFCConnectionGetRequestPath(a1, (char *)(v2 + 56), (char *)&theDict, 0x400uLL))
      {
        uint64_t v327 = AFCDiscardBodyData(a1, v2);
        if (!v327)
        {
          uint64_t v327 = AFCCheckForSpecialFile((const char *)&theDict, (const char *)(v2 + 56));
          if (!v327)
          {
            if (!*(unsigned char *)(a1 + 1268)
              || (uint64_t v327 = __AFCCoordinateFileActivity((const char *)&theDict, 1, &valuePtr), !v327))
            {
              uint64_t v327 = __AFCGetFileHash((const char *)&theDict, (CFDataRef *)ptr, *(void *)(v2 + 40), *(void *)(v2 + 48));
            }
          }
        }
      }
      else
      {
        uint64_t v327 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330498, v324, 1936, "AFCConnectionGetRequestPath", v325, v326, (char)p_theDict);
      }
      uint64_t v9 = v327;
      v328 = *(const void **)&valuePtr.st_dev;
      if (*(void *)&valuePtr.st_dev)
      {
        (*(void (**)(void))(*(void *)&valuePtr.st_dev + 16))(*(void *)&valuePtr.st_dev);
        _Block_release(v328);
      }
      if (v9)
      {
LABEL_144:
        AFCSendStatus(a1, v2, v9);
        CFDictionaryRef Mutable = *(__CFData **)&ptr[0].st_dev;
      }
      else
      {
LABEL_303:
        CFDictionaryRef Mutable = *(__CFData **)&ptr[0].st_dev;
        v329 = (char *)CFDataGetBytePtr(*(CFDataRef *)&ptr[0].st_dev);
        CFIndex v330 = CFDataGetLength(Mutable);
        uint64_t v9 = AFCSendDataPacket(a1, v2, v329, v330);
      }
      goto LABEL_385;
    case 0x20:
      uint64_t v310 = AFCConnectionGetContext(a1);
      *(void *)&ptr[0].st_dev = 0;
      ptr[0].__darwin_ino64_t st_ino = (__darwin_ino64_t)ptr;
      *(void *)&ptr[0].st_uid = 0x2000000000;
      ptr[0].st_rdev = 0;
      AFCLog(5, "Processing FileRefSetImmutableHint packet");
      if (!v310)
      {
        uint64_t v107 = 3892330499;
        v108 = "No server context";
        int v109 = 1;
        uint64_t v106 = 0xFFFFFFFFLL;
        int v110 = 2704;
        goto LABEL_315;
      }
      uint64_t v311 = AFCDiscardBodyData(a1, v2);
      if (v311)
      {
        uint64_t v9 = v311;
        uint64_t v463 = v2;
        uint64_t v464 = a1;
      }
      else
      {
        unint64_t v315 = (*(_DWORD *)(v2 + 40) - 1);
        if (gAFCMaxOpenFileCount <= v315
          || (uint64_t v316 = v310 + 40 * v315,
              int v319 = *(_DWORD *)(v316 + 80),
              v318 = (unsigned int *)(v316 + 80),
              int v317 = v319,
              v319 == -1))
        {
          v108 = "Invalid file ref";
          int v109 = 1;
          uint64_t v106 = 0xFFFFFFFFLL;
          uint64_t v107 = 3892330503;
          int v110 = 2711;
          goto LABEL_315;
        }
        if (!__AFCAllowedToOperateOnFile(v317, (char *)(a1 + 224), v312, v95, v313, v314, v96, v97))
        {
          unsigned int v320 = *v318;
          BOOL v321 = *(void *)(v2 + 48) != 0;
          v322 = *(NSObject **)(v310 + 40 * v315 + 104);
          *(void *)&theDict.uint64_t f_bsize = MEMORY[0x263EF8330];
          theDict.f_blocks = 0x40000000;
          theDict.f_bfree = (uint64_t)__AFCProcessFileRefSetImmutableHintPacket_block_invoke;
          theDict.f_bavail = (uint64_t)&unk_26458CE80;
          theDict.f_files = (uint64_t)ptr;
          theDict.f_ffree = __PAIR64__(v321, v320);
          dispatch_sync(v322, &theDict);
          if (!*(_DWORD *)(ptr[0].st_ino + 24))
          {
LABEL_292:
            uint64_t v323 = AFCSendStatus(a1, v2, 0);
            goto LABEL_293;
          }
          uint64_t v106 = *__error();
          uint64_t v107 = 3892330497;
          v108 = "fcntl";
          int v109 = 0;
          int v110 = 2726;
          goto LABEL_315;
        }
        uint64_t v463 = v2;
        uint64_t v464 = a1;
        uint64_t v9 = 1;
      }
LABEL_526:
      AFCSendStatus(v464, v463, v9);
      goto LABEL_334;
    case 0x21:
      memset(ptr, 0, 144);
      uint64_t v486 = a1;
      if (__AFCConnectionGetRequestPath(a1, (char *)(v2 + 48), (char *)&theDict, 0x400uLL))
      {
        AFCLog(5, "Processing remove path '%s'\n", (const char *)&theDict);
        uint64_t v75 = AFCDiscardBodyData(a1, v2);
        if (v75)
        {
LABEL_453:
          uint64_t v9 = v75;
          CFDictionaryRef Mutable = 0;
          goto LABEL_383;
        }
        if (!lstat((const char *)&theDict, ptr))
        {
          uint64_t v9 = 0;
          uint64_t v79 = *(void *)(v2 + 40);
          int v80 = ptr[0].st_mode & 0xF000;
          BOOL v81 = v80 != 0x8000 && v79 == 1;
          if (v81) {
            off_t st_size = ptr[0].st_size;
          }
          else {
            off_t st_size = 0;
          }
          if (v81) {
            uint64_t st_blksize = ptr[0].st_blksize;
          }
          else {
            uint64_t st_blksize = 0;
          }
          if (v80 == 40960 || v80 == 0x8000) {
            goto LABEL_379;
          }
          if (v80 != 0x4000)
          {
            uint64_t v9 = __AFCSetErrorResult_4(0, 0xFFFFFFFFLL, 3892330506, v76, 2848, "Special files not allowed", v77, v78, (char)p_theDict);
            goto LABEL_379;
          }
          valuePtr.__darwin_ino64_t st_ino = 0;
          *(void *)&valuePtr.st_dev = &theDict;
          CFDictionaryRef Mutable = (__CFData *)fts_open((char *const *)&valuePtr, 84, 0);
          if (!Mutable)
          {
            v475 = __error();
            uint64_t v9 = __AFCSetErrorResult_4(0, *v475, 3892330497, v476, 2815, "Could not start directory walk", v477, v478, (char)p_theDict);
            goto LABEL_381;
          }
          while (1)
          {
            v85 = fts_read((FTS *)Mutable);
            if (!v85)
            {
              uint64_t v9 = 0;
LABEL_378:
              fts_close((FTS *)Mutable);
LABEL_379:
              v371 = CFDataCreateMutable(0, 0);
              CFDictionaryRef Mutable = v371;
              if (v371)
              {
                CFDataAppendBytes(v371, (const UInt8 *)"st_size", 8);
                snprintf((char *)&valuePtr, 0x80uLL, "%lld", st_size);
                size_t v375 = strlen((const char *)&valuePtr);
                CFDataAppendBytes(Mutable, (const UInt8 *)&valuePtr, v375 + 1);
                CFDataAppendBytes(Mutable, (const UInt8 *)"st_blocks", 10);
                snprintf((char *)&valuePtr, 0x80uLL, "%lld", st_blksize);
                size_t v376 = strlen((const char *)&valuePtr);
                CFDataAppendBytes(Mutable, (const UInt8 *)&valuePtr, v376 + 1);
              }
              else
              {
                uint64_t v9 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330499, v372, 2853, "CFDataCreateMutable", v373, v374, (char)p_theDict);
              }
LABEL_381:
              a1 = v486;
              goto LABEL_382;
            }
            v89 = v85;
            unsigned int v90 = v85->fts_info;
            if (v90 > 0xA)
            {
LABEL_78:
              fts_statp = v85->fts_statp;
              if (v79 == 1 || (fts_statp->st_mode & 0xF000) == 0x8000)
              {
                AFCLog(5, "Summing file %s = %lld bytes\n", v85->fts_path, fts_statp->st_size);
                v93 = v89->fts_statp;
                st_size += v93->st_size;
                st_blksize += v93->st_blocks;
              }
            }
            else
            {
              int v91 = 1 << v90;
              if ((v91 & 0x490) != 0)
              {
                uint64_t v9 = __AFCSetErrorResult_4(0, v85->fts_errno, 3892330497, v86, 2829, "Error during file traversal", v87, v88, (char)p_theDict);
                if (v9) {
                  goto LABEL_378;
                }
              }
              else if ((v91 & 0x22) == 0)
              {
                goto LABEL_78;
              }
            }
          }
        }
        uint64_t v441 = *__error();
        uint64_t v438 = 3892330500;
        v439 = "lstat";
        int v440 = 0;
        int v442 = 2792;
      }
      else
      {
        uint64_t v438 = 3892330498;
        v439 = "AFCConnectionGetRequestPath";
        int v440 = 1;
        uint64_t v441 = 0xFFFFFFFFLL;
        int v442 = 2785;
      }
      uint64_t v9 = __AFCSetErrorResult_4(v440, v441, v438, v72, v442, v439, v73, v74, (char)p_theDict);
      CFDictionaryRef Mutable = 0;
      goto LABEL_381;
    case 0x22:
      *(void *)&valuePtr.st_dev = 0;
      if (__AFCConnectionGetRequestPath(a1, (char *)(v2 + 40), (char *)&theDict, 0x400uLL))
      {
        AFCLog(5, "Processing remove path '%s'\n", (const char *)&theDict);
        unsigned int v143 = AFCDiscardBodyData(a1, v2);
        if (v143
          || *(unsigned char *)(a1 + 1268) && (unsigned int v143 = __AFCCoordinateFileActivity((const char *)&theDict, 1, &valuePtr)) != 0)
        {
LABEL_513:
          unsigned int v153 = v143;
LABEL_309:
          v331 = *(const void **)&valuePtr.st_dev;
          if (*(void *)&valuePtr.st_dev)
          {
            (*(void (**)(void))(*(void *)&valuePtr.st_dev + 16))(*(void *)&valuePtr.st_dev);
            _Block_release(v331);
          }
          unsigned int v332 = AFCSendStatus(a1, v2, v153);
          if (v153) {
            return v153;
          }
          else {
            return v332;
          }
        }
        ptr[0].__darwin_ino64_t st_ino = 0;
        *(void *)&ptr[0].st_dev = &theDict;
        v144 = fts_open((char *const *)ptr, 84, 0);
        if (v144)
        {
          v145 = v144;
          while (1)
          {
            v146 = fts_read(v145);
            if (!v146)
            {
              unsigned int v153 = 0;
LABEL_308:
              fts_close(v145);
              goto LABEL_309;
            }
            unsigned int v150 = v146->fts_info;
            if (v150 > 0xA) {
              break;
            }
            int v151 = 1 << v150;
            if ((v151 & 0x490) != 0)
            {
              unsigned int v152 = __AFCSetErrorResult_4(0, v146->fts_errno, 3892330497, v147, 1432, "Error during file traversal", v148, v149, (char)p_theDict);
LABEL_121:
              unsigned int v153 = v152;
              if (v152) {
                goto LABEL_308;
              }
            }
            else if ((v151 & 0x22) == 0)
            {
              break;
            }
          }
          unsigned int v152 = RemovePath(v146->fts_path);
          goto LABEL_121;
        }
        uint64_t v446 = *__error();
        uint64_t v443 = 3892330497;
        v444 = "Could not start directory walk";
        int v445 = 0;
        int v447 = 1418;
      }
      else
      {
        uint64_t v443 = 3892330498;
        v444 = "AFCConnectionGetRequestPath";
        int v445 = 1;
        uint64_t v446 = 0xFFFFFFFFLL;
        int v447 = 1400;
      }
      unsigned int v143 = __AFCSetErrorResult_4(v445, v446, v443, v140, v447, v444, v141, v142, (char)p_theDict);
      goto LABEL_513;
    case 0x27:
      uint64_t v159 = a1;
      v160 = (void *)v2;
      int v161 = 1;
LABEL_209:
      return AFCProcessFileRefReadPacket(v159, v160, v161);
    case 0x28:
      uint64_t v111 = a1;
      v112 = (void *)v2;
      uint64_t v113 = 1;
LABEL_124:
      return AFCProcessFileRefWritePacket(v111, v112, v113);
    default:
      AFCLog(5, "Processing unknown packet %d\n", *(void *)(v2 + 32));
      AFCDiscardBodyData(a1, v2);
      uint64_t v9 = 3892330502;
      int v171 = __AFCSetErrorResult_4(0, 0xFFFFFFFFLL, 3892330502, v168, 1265, "Unknown packet type %d", v169, v170, *(void *)(v2 + 32));
      uint64_t v172 = a1;
      uint64_t v173 = v2;
      goto LABEL_147;
  }
}

uint64_t AFCProcessObsoletePacket(uint64_t a1, uint64_t a2)
{
  AFCDiscardBodyData(a1, a2);
  int v7 = __AFCSetErrorResult_4(0, 0xFFFFFFFFLL, 3892330511, v4, 1279, "Obsolete packet type %d", v5, v6, *(void *)(a2 + 32));

  return AFCSendStatus(a1, a2, v7);
}

uint64_t AFCProcessFileRefReadPacket(uint64_t a1, void *a2, int a3)
{
  uint64_t v57 = 0;
  int v58 = &v57;
  uint64_t v59 = 0x2000000000;
  int v60 = 0;
  uint64_t Context = AFCConnectionGetContext(a1);
  uint64_t v53 = 0;
  unint64_t v54 = &v53;
  uint64_t v55 = 0x2000000000;
  uint64_t v56 = 0;
  uint64_t v49 = 0;
  uint64_t v50 = &v49;
  uint64_t v51 = 0x2000000000;
  uint64_t v52 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2000000000;
  uint64_t v48 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2000000000;
  v44[3] = 0;
  uint64_t v40 = 0;
  int v41 = &v40;
  uint64_t v42 = 0x2000000000;
  uint64_t v43 = 0;
  uint64_t v36 = 0;
  unint64_t v37 = &v36;
  uint64_t v38 = 0x2000000000;
  uint64_t v39 = 0;
  AFCLog(5, "Processing FileRefRead packet\n");
  if (!Context)
  {
    uint64_t v27 = "No server context";
    uint64_t v28 = 0xFFFFFFFFLL;
    uint64_t v29 = 3892330499;
    int v30 = 2223;
    goto LABEL_25;
  }
  int v10 = v54;
  if (a3)
  {
    uint64_t v11 = a2[5];
    unint64_t v12 = a2[6];
    v54[3] = v12;
    if (v12 >= 0x400000) {
      unint64_t v12 = 0x400000;
    }
    v46[3] = v12;
    unint64_t v13 = a2[7];
    uint64_t v14 = v37;
  }
  else
  {
    uint64_t v11 = a2[5];
    unint64_t v13 = a2[6];
    v54[3] = v13;
    uint64_t v14 = v46;
    if (v13 >= 0x400000) {
      unint64_t v13 = 0x400000;
    }
  }
  v14[3] = v13;
  unsigned int v15 = v11 - 1;
  AFCLog(5, "AFCFileRefRead(%d, %d, %d)\n", v11 - 1, v10[3], a3);
  int v16 = AFCDiscardBodyData(a1, (uint64_t)a2);
  *((_DWORD *)v58 + 6) = v16;
  if (!v16)
  {
    if (gAFCMaxOpenFileCount <= (unint64_t)v15
      || (uint64_t v20 = Context + 40 * v15, v21 = *(_DWORD *)(v20 + 80), v21 == -1))
    {
      uint64_t v29 = 3892330503;
      uint64_t v27 = "Invalid file ref";
      uint64_t v28 = 0xFFFFFFFFLL;
      int v30 = 2255;
      goto LABEL_25;
    }
    BOOL v22 = __AFCAllowedToOperateOnFile(*(_DWORD *)(v20 + 80), (char *)(a1 + 224), v17, v7, v18, v19, v8, v9);
    *((_DWORD *)v58 + 6) = v22;
    if (!v22)
    {
      CFAllocatorRef v23 = *(NSObject **)(Context + 40 * v15 + 104);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = __AFCProcessFileRefReadPacket_block_invoke;
      block[3] = &unk_26458CD20;
      block[4] = &v40;
      void block[5] = &v45;
      block[6] = &v57;
      block[7] = v44;
      char v35 = a3;
      block[8] = &v49;
      block[9] = &v53;
      block[10] = &v36;
      block[11] = Context;
      int v33 = v21;
      unsigned int v34 = v15;
      dispatch_sync(v23, block);
      int v16 = *((_DWORD *)v58 + 6);
      if (v16) {
        goto LABEL_16;
      }
      if ((v54[3] & 0x8000000000000000) == 0)
      {
        int v16 = AFCSendDataPacket(a1, (uint64_t)a2, *(char **)(v41[3] + 16), v50[3]);
LABEL_15:
        *((_DWORD *)v58 + 6) = v16;
        goto LABEL_16;
      }
      uint64_t v28 = *__error();
      uint64_t v29 = 3892330500;
      uint64_t v27 = "read";
      int v30 = 2301;
LABEL_25:
      int v16 = __AFCSetErrorResult_4(1, v28, v29, v7, v30, v27, v8, v9, v31);
      goto LABEL_15;
    }
    int v16 = 1;
  }
LABEL_16:
  AFCLog(5, "Sending result %d\n", v16);
  uint64_t v24 = v41[3];
  if (v24) {
    AFCReleaseBuffer(Context, v24);
  }
  uint64_t v25 = *((unsigned int *)v58 + 6);
  if (v25)
  {
    AFCSendStatus(a1, (uint64_t)a2, *((_DWORD *)v58 + 6));
    *((_DWORD *)v58 + 6) = v25;
  }
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  return v25;
}

uint64_t AFCProcessFileRefWritePacket(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v59 = 0;
  int v60 = &v59;
  uint64_t v61 = 0x2000000000;
  int v62 = 0;
  uint64_t Context = AFCConnectionGetContext(a1);
  uint64_t v55 = 0;
  uint64_t v56 = &v55;
  uint64_t v57 = 0x2000000000;
  uint64_t v58 = 0;
  AFCLog(5, "Processing FileRefWrite packet\n");
  if (Context)
  {
    uint64_t v13 = a2[1];
    uint64_t v14 = a2[2];
    uint64_t v51 = a2;
    uint64_t v15 = a2[5];
    if (a3) {
      v56[3] = a2[6];
    }
    unint64_t v16 = (v15 - 1);
    if (gAFCMaxOpenFileCount <= v16 || (int v17 = *(_DWORD *)(Context + 40 * v16 + 80), v17 == -1))
    {
      int v49 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330503, v8, 2344, "Invalid file ref", v11, v12, v50);
      *((_DWORD *)v60 + 6) = v49;
    }
    else
    {
      BOOL v18 = __AFCAllowedToOperateOnFile(v17, (char *)(v5 + 224), v7, v8, v9, v10, v11, v12);
      *((_DWORD *)v60 + 6) = v18;
      if (!v18)
      {
        int64_t v19 = v13 - v14;
        uint64_t v20 = Context + 40 * v16;
        *(_DWORD *)(v20 + 96) = 0;
        int v21 = (unsigned int *)(v20 + 96);
        if (v13 - v14 >= 1)
        {
          while (1)
          {
            if (v19 >= *(void *)(Context + 8)) {
              unint64_t v22 = *(void *)(Context + 8);
            }
            else {
              unint64_t v22 = v19;
            }
            uint64_t v23 = AFCGetBuffer(Context, v22);
            if (!v23)
            {
              int v41 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330499, v24, 2361, "AFCGetBuffer", v25, v26, v50);
              *((_DWORD *)v60 + 6) = v41;
              AFCDiscardData(v5, v19);
              goto LABEL_21;
            }
            uint64_t v27 = v23;
            int v28 = AFCReadData(v5, *(char **)(v23 + 16), v22);
            *((_DWORD *)v60 + 6) = v28;
            if (v28) {
              break;
            }
            uint64_t v29 = v5;
            uint64_t v30 = a3;
            char v31 = *(NSObject **)(Context + 48);
            uint64_t v32 = v29;
            uint64_t v33 = *(void *)(v29 + 104);
            if (v33) {
              dispatch_time_t v34 = dispatch_time(0, 1000000000 * v33 * gAFCMaxIORequests);
            }
            else {
              dispatch_time_t v34 = -1;
            }
            v19 -= v22;
            if (dispatch_semaphore_wait(v31, v34))
            {
              int v42 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330508, v35, 2378, "Dispatch queue timed out waiting for I/O", v36, v37, v50);
              *((_DWORD *)v60 + 6) = v42;
              uint64_t v5 = v32;
              AFCDiscardData(v32, v19);
              break;
            }
            uint64_t v38 = *v21;
            if (v38)
            {
              int v43 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, v38, v35, 2384, "Previous IO error", v36, v37, v50);
              *((_DWORD *)v60 + 6) = v43;
              uint64_t v5 = v32;
              AFCDiscardData(v32, v19);
              dispatch_semaphore_signal(*(dispatch_semaphore_t *)(Context + 48));
              break;
            }
            uint64_t v39 = *(NSObject **)(Context + 56);
            uint64_t v40 = *(NSObject **)(Context + 40 * v16 + 104);
            block[0] = MEMORY[0x263EF8330];
            block[1] = 0x40000000;
            block[2] = __AFCProcessFileRefWritePacket_block_invoke;
            block[3] = &unk_26458CD90;
            block[6] = v27;
            block[7] = v22;
            a3 = v30;
            char v54 = v30;
            block[8] = Context;
            int v53 = v16;
            block[4] = &v55;
            void block[5] = &v59;
            dispatch_group_async(v39, v40, block);
            uint64_t v5 = v32;
            if (v19 <= 0) {
              goto LABEL_21;
            }
          }
          dispatch_group_wait(*(dispatch_group_t *)(Context + 56), 0xFFFFFFFFFFFFFFFFLL);
          AFCReleaseBuffer(Context, v27);
          goto LABEL_25;
        }
      }
    }
LABEL_21:
    dispatch_group_wait(*(dispatch_group_t *)(Context + 56), 0xFFFFFFFFFFFFFFFFLL);
LABEL_25:
    a2 = v51;
    goto LABEL_26;
  }
  int v48 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330499, v8, 2330, "No server context", v11, v12, v50);
  *((_DWORD *)v60 + 6) = v48;
LABEL_26:
  unsigned int v44 = *((_DWORD *)v60 + 6);
  unsigned int v45 = AFCSendStatus(v5, (uint64_t)a2, v44);
  if (v44) {
    uint64_t v46 = v44;
  }
  else {
    uint64_t v46 = v45;
  }
  *((_DWORD *)v60 + 6) = v46;
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
  return v46;
}

uint64_t AFCServeWithRoot(uint64_t a1, const __CFString *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a2) {
    __AFCConnectionSetRoot(a1, a2);
  }
  memset(v10, 0, sizeof(v10));
  CFRetain((CFTypeRef)a1);
  do
  {
    ptr = 0;
    uint64_t v3 = AFCReadPacketHeader(a1, (uint64_t)v10, 0x80uLL, &ptr);
    if (v3)
    {
      uint64_t v5 = v3;
      if (v3 == -402636789)
      {
        AFCLog(5, "Disconnected during packet read");
        uint64_t v5 = 3892330507;
      }
      else
      {
        uint64_t v7 = __error();
        AFCLog(1, "packet read error %d, errno %d", v5, *v7);
      }
      goto LABEL_16;
    }
    if (ptr) {
      uint64_t v4 = ptr;
    }
    else {
      uint64_t v4 = v10;
    }
    __AFCSpinMonitorStart(*((void *)v4 + 4));
    uint64_t v5 = AFCProcessServerPacket(a1, (uint64_t)v4);
    __AFCSpinMonitorStart(v5);
    if (ptr)
    {
      CFAllocatorRef v6 = CFGetAllocator((CFTypeRef)a1);
      CFAllocatorDeallocate(v6, ptr);
    }
  }
  while (!*(unsigned char *)(a1 + 68));
  AFCLog(1, "fatal error 0x%x", *(_DWORD *)(a1 + 64));
  if (!v5) {
    uint64_t v5 = *(unsigned int *)(a1 + 64);
  }
LABEL_16:
  CFRelease((CFTypeRef)a1);
  return v5;
}

uint64_t AFCServe(uint64_t a1)
{
  return AFCServeWithRoot(a1, @"/private/var/mobile/Media");
}

void __AFCFlushServerBuffers_block_invoke(uint64_t a1)
{
}

uint64_t __AFCSetErrorResult_4(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, const char *a6, uint64_t a7, uint64_t a8, char a9)
{
  return AFCSetErrorInfoWithArgs(a1, a2, a3, "/Library/Caches/com.apple.xbs/Sources/AppleFileConduit/server.c", a5, a6, &a9);
}

char *__AFCPathDepthCheck(const char *a1)
{
  uint64_t result = strndup(a1, 0x400uLL);
  __stringp = result;
  if (result)
  {
    uint64_t v2 = result;
    int v3 = 0;
    while (1)
    {
      uint64_t v4 = strsep(&__stringp, "/");
      if (!v4)
      {
LABEL_13:
        free(v2);
        return (char *)(v3 >= 0);
      }
      if (!*v4) {
        goto LABEL_10;
      }
      if (*v4 != 46) {
        goto LABEL_9;
      }
      if (v4[1])
      {
        if (v4[1] != 46 || v4[2])
        {
LABEL_9:
          ++v3;
          goto LABEL_10;
        }
        if (--v3 < 0) {
          goto LABEL_13;
        }
      }
      else
      {
LABEL_10:
        if (v3 < 0) {
          goto LABEL_13;
        }
      }
    }
  }
  return result;
}

uint64_t AFCCheckForSpecialFile(const char *a1, const char *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  memset(&v33, 0, sizeof(v33));
  if (a2 && (__AFCPathDepthCheck(a2) & 1) == 0)
  {
    uint64_t v6 = 3892330503;
    __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330503, v3, 228, "Request path is outside document root", v4, v5, v32);
  }
  else
  {
    uint64_t v6 = 0;
    if (a1 && !gAllowSpecialFiles)
    {
      bzero(&__s, 0x400uLL);
      if (*a1 == 47)
      {
        int v7 = strlen(a1);
        if (v7 >= 1)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (a1[i] == 47 && a1[i + 1] != 47) {
              break;
            }
          }
        }
      }
      __strcpy_chk();
      while (1)
      {
        int v9 = strlen((const char *)&__s);
        if (v9 >= 2)
        {
          unint64_t v10 = v9 + 1;
          do
          {
            uint64_t v11 = (v10 - 2);
            if (v35[v11 - 16] != 47) {
              break;
            }
            v35[v11 - 16] = 0;
            --v10;
          }
          while (v10 > 2);
        }
        if (__s ^ 0x7261762F | BYTE4(__s)
          && __s ^ 0x6374652F | BYTE4(__s)
          && __s ^ 0x706D742F | BYTE4(__s))
        {
          if (!gInternalBuild) {
            goto LABEL_67;
          }
          if (((void)__s != 0x762F2F31746E6D2FLL || *(void *)((char *)&__s + 3) != 0x7261762F2F3174)
            && ((void)__s != 0x652F2F31746E6D2FLL || *(void *)((char *)&__s + 3) != 0x6374652F2F3174))
          {
            BOOL v14 = (void)__s == 0x742F2F31746E6D2FLL && *(void *)((char *)&__s + 3) == 0x706D742F2F3174;
            if (!v14
              && (unint64_t)__s ^ 0x626F6D2F7261762FLL | *((void *)&__s + 1) ^ 0x7262694C2F656C69 | *(void *)v35 ^ 0x73676F4C2F797261 | v35[8])
            {
              BOOL v15 = (void)__s == 0x7269772F7261762FLL && *((void *)&__s + 1) == 0x694C2F7373656C65;
              BOOL v16 = v15 && *(void *)v35 == 0x6F4C2F7972617262;
              if (!v16 || *(void *)&v35[3] != 0x73676F4C2F7972)
              {
                BOOL v18 = (void)__s == 0x626F6D2F7261762FLL && *((void *)&__s + 1) == 0x6964654D2F656C69;
                BOOL v19 = v18 && *(void *)v35 == 0x726F746361462F61;
                if (!v19 || *(void *)&v35[6] != 0x73676F4C79726FLL)
                {
LABEL_67:
                  if (lstat((const char *)&__s, &v33))
                  {
                    if (*__error() != 2)
                    {
                      uint64_t v27 = *__error();
                      int v28 = __error();
                      strerror(*v28);
                      __AFCSetErrorResult_4(1, v27, 3892330519, v29, 302, "failed to retrieve file information for %s (%s)", v30, v31, (char)&__s);
                      return 23;
                    }
                  }
                  else
                  {
                    int v24 = v33.st_mode & 0xF000;
                    if (v24 != 0x4000 && v24 != 0x8000)
                    {
                      uint64_t v6 = 3892330506;
                      __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330506, v21, 295, "%s is special file", v22, v23, (char)&__s);
                      return v6;
                    }
                  }
                }
              }
            }
          }
        }
        uint64_t v25 = strrchr((char *)&__s, 47);
        if (v25)
        {
          *uint64_t v25 = 0;
          if ((_BYTE)__s) {
            continue;
          }
        }
        return 0;
      }
    }
  }
  return v6;
}

uint64_t __AFCCoordinateFileActivity(const char *a1, uint64_t a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v27 = 0;
  int v28 = &v27;
  uint64_t v29 = 0x2000000000;
  uint64_t v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3002000000;
  int v24 = __Block_byref_object_copy_;
  uint64_t v25 = __Block_byref_object_dispose_;
  uint64_t v26 = 0;
  size_t v6 = strlen(a1);
  CFURLRef v7 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)a1, v6, 0);
  if (v7)
  {
    CFURLRef v11 = v7;
    uint64_t v12 = dispatch_semaphore_create(0);
    dispatch_retain(v12);
    if (a2 == 1) {
      _CFFileCoordinateReadingItemAtURL2();
    }
    else {
      _CFFileCoordinateWritingItemAtURL2();
    }
    dispatch_time_t v13 = dispatch_time(0, 25000000000);
    if (dispatch_semaphore_wait(v12, v13))
    {
      AFCLog(1, "Timeout waiting for File Coordination to release %s", a1);
      uint64_t v14 = 0;
    }
    else
    {
      BOOL v15 = (__CFError *)v28[3];
      if (v15)
      {
        memset(buffer, 0, sizeof(buffer));
        CFStringRef v16 = CFErrorCopyDescription(v15);
        if (v16)
        {
          CFStringRef v17 = v16;
          CFStringGetCString(v16, (char *)buffer, 256, 0x8000100u);
          CFRelease(v17);
        }
        AFCLog(1, "File Coordination error for path %s: %s", a1, (const char *)buffer);
        CFRelease((CFTypeRef)v28[3]);
      }
      uint64_t v14 = v22[5];
    }
    *a3 = v14;
    if (v12) {
      dispatch_release(v12);
    }
    CFRelease(v11);
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = __AFCSetErrorResult_4(0, 0xFFFFFFFFLL, 3892330499, v8, 402, "Could not create request URL", v9, v10, v20);
  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return v18;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t RemovePath(const char *a1)
{
  memset(&v11, 0, sizeof(v11));
  if (lstat(a1, &v11))
  {
    uint64_t v6 = *__error();
    CFURLRef v7 = "lstat";
    uint64_t v8 = 3892330497;
    int v9 = 1335;
    return __AFCSetErrorResult_4(0, v6, v8, v2, v9, v7, v3, v4, v11.st_dev);
  }
  int v5 = v11.st_mode & 0xF000;
  if (v5 != 0x4000)
  {
    if (!gAllowSpecialFiles && (v5 | 0x2000) != 0xA000)
    {
      uint64_t v8 = 3892330506;
      CFURLRef v7 = "Special files not allowed";
      uint64_t v6 = 0xFFFFFFFFLL;
      int v9 = 1348;
      return __AFCSetErrorResult_4(0, v6, v8, v2, v9, v7, v3, v4, v11.st_dev);
    }
    if (unlink(a1) < 0)
    {
      uint64_t v6 = *__error();
      CFURLRef v7 = "unlink";
      uint64_t v8 = 3892330497;
      int v9 = 1345;
      return __AFCSetErrorResult_4(0, v6, v8, v2, v9, v7, v3, v4, v11.st_dev);
    }
    return 0;
  }
  if ((rmdir(a1) & 0x80000000) == 0) {
    return 0;
  }
  uint64_t v6 = *__error();
  CFURLRef v7 = "rmdir";
  uint64_t v8 = 3892330497;
  int v9 = 1340;
  return __AFCSetErrorResult_4(0, v6, v8, v2, v9, v7, v3, v4, v11.st_dev);
}

BOOL __AFCHasPrefix(const char *a1, char *__s)
{
  BOOL result = 0;
  if (a1 && __s)
  {
    size_t v5 = strlen(__s);
    return strlen(a1) >= v5 && strncmp(__s, a1, v5) == 0;
  }
  return result;
}

BOOL __AFCAllowedToOperateOnFile(int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (a1 < 0 || !a2)
  {
    uint64_t v14 = "Invalid arg(s).";
    int v15 = 0;
    uint64_t v16 = 0xFFFFFFFFLL;
    uint64_t v17 = 7;
    int v18 = 2176;
LABEL_13:
    int v13 = __AFCSetErrorResult_4(v15, v16, v17, a4, v18, v14, a7, a8, (char)v24);
    return v13 != 0;
  }
  memset(&v25, 0, sizeof(v25));
  int v24 = v26;
  if (fcntl(a1, 50) == -1)
  {
    uint64_t v19 = *__error();
    char v20 = __error();
    uint64_t v14 = strerror(*v20);
    int v15 = 1;
    uint64_t v16 = v19;
    uint64_t v17 = 23;
    int v18 = 2181;
    goto LABEL_13;
  }
  if (!__AFCHasPrefix(v26, a2))
  {
    int v13 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 1, v10, 2186, "Requested path (%s) does not start with AFC root (%s)", v11, v12, (char)v26);
    return v13 != 0;
  }
  if (fstat(a1, &v25) == -1)
  {
    uint64_t v21 = *__error();
    uint64_t v22 = __error();
    uint64_t v14 = strerror(*v22);
    int v15 = 0;
    uint64_t v16 = v21;
    uint64_t v17 = 23;
    int v18 = 2191;
    goto LABEL_13;
  }
  if (v25.st_nlink != 1)
  {
    uint64_t v14 = "Can't operate on this file via AFC as there are additional hard links: %d";
    LOBYTE(v24) = v25.st_nlink;
    int v15 = 0;
    uint64_t v16 = 0xFFFFFFFFLL;
    uint64_t v17 = 1;
    int v18 = 2196;
    goto LABEL_13;
  }
  int v13 = 0;
  return v13 != 0;
}

uint64_t __AFCProcessFileRefReadPacket_block_invoke(uint64_t a1)
{
  uint64_t result = AFCGetBuffer(*(void *)(a1 + 88), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v3)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(void *)(v3 + 16);
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    for (size_t i = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
          *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) < i;
          size_t i = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      int v5 = *(_DWORD *)(a1 + 96);
      uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      if (*(unsigned char *)(a1 + 104))
      {
        uint64_t result = pread(v5, v6, i, *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24));
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = result;
        uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        if (v7 < 1) {
          return result;
        }
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += v7;
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += *(void *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                                 + 24);
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) -= *(void *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                                 + 24);
        uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
        uint64_t v9 = *(void *)(v8 + 24) + *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      }
      else
      {
        uint64_t result = read(v5, v6, i);
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = result;
        uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        if (v10 < 1) {
          return result;
        }
        uint64_t v11 = *(void *)(a1 + 88) + 40 * *(unsigned int *)(a1 + 100);
        *(void *)(v11 + 88) += v10;
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += *(void *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                                 + 24);
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += *(void *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                                 + 24);
        uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v9 = *(void *)(v8 + 24) - *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      }
      *(void *)(v8 + 24) = v9;
    }
  }
  else
  {
    uint64_t v12 = __error();
    uint64_t result = __AFCSetErrorResult_4(1, *v12, 3892330499, v13, 2269, "AFCGetBuffer failed", v14, v15, v16);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  }
  return result;
}

uint64_t AFCGetBuffer(uint64_t a1, unint64_t a2)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000;
  uint64_t v10 = 0;
  uint64_t v3 = 0;
  if (a2 <= 0x400000)
  {
    uint64_t v4 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __AFCGetBuffer_block_invoke;
    block[3] = &unk_26458CD48;
    block[4] = &v7;
    void block[5] = a1;
    block[6] = a2;
    dispatch_sync(v4, block);
    uint64_t v3 = v8[3];
  }
  _Block_object_dispose(&v7, 8);
  return v3;
}

void AFCReleaseBuffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(NSObject **)(a1 + 24);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = __AFCReleaseBuffer_block_invoke;
  v4[3] = &__block_descriptor_tmp_124;
  v4[4] = a2;
  v4[5] = a1;
  dispatch_sync(v3, v4);
}

void __AFCGetBuffer_block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[5] + 16);
  if (v2)
  {
    uint64_t v3 = a1 + 4;
    *(void *)(*(void *)(a1[4] + 8) + 24) = v2;
    *(void *)(a1[5] + 16) = **(void **)(a1[5] + 16);
    uint64_t v4 = *(void *)(*(void *)(a1[4] + 8) + 24);
    int v5 = a1 + 6;
    if (*(void *)(v4 + 24) >= a1[6]) {
      goto LABEL_6;
    }
    free(*(void **)(v4 + 16));
    malloc_type_id_t v6 = 3803305363;
  }
  else
  {
    uint64_t v3 = a1 + 4;
    *(void *)(*(void *)(a1[4] + 8) + 24) = malloc_type_malloc(0x20uLL, 0x10A0040D083E0E9uLL);
    uint64_t v7 = *(_OWORD **)(*(void *)(a1[4] + 8) + 24);
    *uint64_t v7 = 0u;
    v7[1] = 0u;
    int v5 = a1 + 6;
    malloc_type_id_t v6 = 1903766733;
  }
  *(void *)(*(void *)(*(void *)(*v3 + 8) + 24) + 16) = malloc_type_valloc(*v5, v6);
  *(void *)(*(void *)(*(void *)(*v3 + 8) + 24) + 24) = malloc_size(*(const void **)(*(void *)(*(void *)(*v3 + 8) + 24)
                                                                                              + 16));
LABEL_6:
  uint64_t v8 = a1[5];
  *(unsigned char *)(*(void *)(*(void *)(a1[4] + 8) + 24) + 8) = 1;
  uint64_t v9 = *(void *)(v8 + 40);
  if (!v9)
  {
    dispatch_source_set_timer(*(dispatch_source_t *)(v8 + 32), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    uint64_t v8 = a1[5];
    uint64_t v9 = *(void *)(v8 + 40);
  }
  *(void *)(v8 + 40) = v9 + 1;
}

void __AFCReleaseBuffer_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  *(unsigned char *)(v1 + 8) = 0;
  *(void *)uint64_t v1 = *(void *)(v2 + 16);
  *(void *)(*(void *)(a1 + 40) + 16) = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(v3 + 40) - 1;
  *(void *)(v3 + 40) = v4;
  if (!v4)
  {
    int v5 = *(NSObject **)(v3 + 32);
    dispatch_time_t v6 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
}

intptr_t __AFCProcessFileRefWritePacket_block_invoke(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 56);
  if (v2 < 1)
  {
LABEL_11:
    uint64_t v9 = __error();
    int v13 = __AFCSetErrorResult_4(0, *v9, 0xFFFFFFFFLL, v10, 2422, "file write failure", v11, v12, v16);
    uint64_t v8 = *(void *)(a1 + 64);
    *(_DWORD *)(v8 + 80 + 40 * *(unsigned int *)(a1 + 72) + 16) = v13;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(_DWORD *)(v8
                                                                            + 80
                                                                            + 40 * *(unsigned int *)(a1 + 72)
                                                                            + 16);
  }
  else
  {
    uint64_t v3 = *(char **)(*(void *)(a1 + 48) + 16);
    do
    {
      int v4 = *(_DWORD *)(*(void *)(a1 + 64) + 40 * *(unsigned int *)(a1 + 72) + 80);
      if (*(unsigned char *)(a1 + 76))
      {
        ssize_t v5 = pwrite(v4, v3, v2, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
        if (v5 < 1) {
          goto LABEL_11;
        }
        dispatch_time_t v6 = (void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      }
      else
      {
        ssize_t v5 = write(v4, v3, v2);
        if (v5 < 1) {
          goto LABEL_11;
        }
        dispatch_time_t v6 = (void *)(*(void *)(a1 + 64) + 40 * *(unsigned int *)(a1 + 72) + 88);
      }
      *v6 += v5;
      v3 += v5;
      BOOL v7 = v2 <= v5;
      v2 -= v5;
    }
    while (!v7);
    uint64_t v8 = *(void *)(a1 + 64);
  }
  AFCReleaseBuffer(v8, *(void *)(a1 + 48));
  uint64_t v14 = *(NSObject **)(*(void *)(a1 + 64) + 48);

  return dispatch_semaphore_signal(v14);
}

uint64_t __AFCProcessFileRefSeekPacket_block_invoke(uint64_t a1)
{
  off_t v2 = lseek(*(_DWORD *)(*(void *)(a1 + 40) + 40 * *(unsigned int *)(a1 + 56) + 80), *(void *)(*(void *)(a1 + 48) + 56), *(_DWORD *)(a1 + 60));
  if (v2 < 0)
  {
    ssize_t v5 = __error();
    uint64_t result = __AFCSetErrorResult_4(0, *v5, 3892330497, v6, 2509, "lseek", v7, v8, v9);
  }
  else
  {
    off_t v3 = v2;
    uint64_t result = 0;
    *(void *)(*(void *)(a1 + 40) + 40 * *(unsigned int *)(a1 + 56) + 88) = v3;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __AFCProcessFileRefTellPacket_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = lseek(*(_DWORD *)(*(void *)(a1 + 48)+ 40 * *(unsigned int *)(a1 + 56)+ 80), 0, 1);
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == -1)
  {
    off_t v3 = __error();
    uint64_t result = __AFCSetErrorResult_4(0, *v3, 3892330497, v4, 2548, "lseek", v5, v6, v7);
  }
  else
  {
    uint64_t result = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __AFCProcessFileRefClosePacket_block_invoke(uint64_t a1)
{
  if (close(*(_DWORD *)(*(void *)(a1 + 40) + 40 * *(unsigned int *)(a1 + 48) + 80)))
  {
    off_t v2 = __error();
    int v6 = __AFCSetErrorResult_4(0, *v2, 3892330497, v3, 2597, "close", v4, v5, v12);
  }
  else
  {
    int v6 = 0;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
  *(_DWORD *)(v7 + 80 + 40 * *(unsigned int *)(a1 + 48)) = -1;
  uint64_t v8 = *(void *)(v7 + 80 + 40 * *(unsigned int *)(a1 + 48) + 32);
  if (v8)
  {
    (*(void (**)(void))(v8 + 16))(*(void *)(v7 + 80 + 40 * *(unsigned int *)(a1 + 48) + 32));
    _Block_release(*(const void **)(*(void *)(a1 + 40) + 40 * *(unsigned int *)(a1 + 48) + 112));
    uint64_t v7 = *(void *)(a1 + 40);
    *(void *)(v7 + 40 * *(unsigned int *)(a1 + 48) + 112) = 0;
  }
  if (!gAFCMaxOpenFileCount) {
    goto LABEL_11;
  }
  uint64_t v9 = 0;
  unsigned int v10 = 1;
  do
  {
    if (*(_DWORD *)(v7 + 40 * v9 + 80) != -1) {
      break;
    }
    uint64_t v9 = v10;
  }
  while (gAFCMaxOpenFileCount > (unint64_t)v10++);
  if (gAFCMaxOpenFileCount == v9)
  {
LABEL_11:
    AFCFlushServerContext(v7);
  }
}

uint64_t __AFCProcessFileRefSetFileSizePacket_block_invoke(uint64_t a1)
{
  uint64_t result = ftruncate(*(_DWORD *)(*(void *)(a1 + 40) + 40 * *(unsigned int *)(a1 + 56) + 80), *(void *)(*(void *)(a1 + 48) + 48));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __AFCPathContainsDots(const char *a1)
{
  uint64_t v1 = strndup(a1, 0x400uLL);
  __stringp = v1;
  if (!v1) {
    return 0;
  }
  off_t v2 = v1;
  uint64_t v3 = strsep(&__stringp, "/");
  if (v3)
  {
    while (*v3 != 46 || v3[1] != 46 || v3[2])
    {
      uint64_t v3 = strsep(&__stringp, "/");
      if (!v3) {
        goto LABEL_7;
      }
    }
    uint64_t v4 = 1;
  }
  else
  {
LABEL_7:
    uint64_t v4 = 0;
  }
  free(v2);
  return v4;
}

uint64_t AFCProcessSetBlockSize(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, void), unint64_t a4)
{
  uint64_t Context = AFCConnectionGetContext(a1);
  AFCLog(5, "Processing SetBlockSize packet\n");
  if (Context)
  {
    int v12 = AFCDiscardBodyData(a1, a2);
    if (v12) {
      goto LABEL_10;
    }
    unint64_t v16 = *(void *)(a2 + 40);
    if (v16 > 0x400000)
    {
      int v12 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330503, v13, 2929, "%llu block size larger than maximum %llu", v14, v15, *(void *)(a2 + 40));
      goto LABEL_10;
    }
    if (v16 <= a4)
    {
      int v12 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330503, v13, 2933, "%llu block size smaller than minimum %llu", v14, v15, *(void *)(a2 + 40));
      goto LABEL_10;
    }
    uint64_t v17 = *(NSObject **)(Context + 56);
    uint64_t v18 = *(void *)(a1 + 104);
    if (v18) {
      dispatch_time_t v19 = dispatch_time(0, 1000000000 * v18 * gAFCMaxIORequests);
    }
    else {
      dispatch_time_t v19 = -1;
    }
    if (!dispatch_group_wait(v17, v19))
    {
      int v12 = a3(a1, Context, *(void *)(a2 + 40));
      goto LABEL_10;
    }
    uint64_t v21 = 3892330508;
    uint64_t v22 = "timeout waiting for all IO requests to complete";
    int v23 = 0;
    int v24 = 2937;
  }
  else
  {
    uint64_t v21 = 3892330499;
    uint64_t v22 = "No server context";
    int v23 = 1;
    int v24 = 2922;
  }
  int v12 = __AFCSetErrorResult_4(v23, 0xFFFFFFFFLL, v21, v9, v24, v22, v10, v11, v25);
LABEL_10:

  return AFCSendStatus(a1, a2, v12);
}

uint64_t _AFCSetFSBlockSize(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (*(void *)(a1 + 88) == a3 && *(void *)(a1 + 96) == a3) {
    return 0;
  }
  AFCLog(5, "Setting block size to %llu", a3);
  if (a3 > 0x400000) {
    return 3892330503;
  }
  *(void *)(a1 + 88) = a3;
  *(void *)(a1 + 96) = a3;
  AFCFlushServerContext(a2);
  uint64_t result = 0;
  *(void *)(a2 + 8) = a3;
  return result;
}

uint64_t __AFCProcessFileRefLockPacket_block_invoke(uint64_t a1)
{
  uint64_t result = flock(*(_DWORD *)(*(void *)(a1 + 40) + 40 * *(unsigned int *)(a1 + 48) + 80), *(_DWORD *)(a1 + 52));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __AFCGetFileHash(const char *a1, CFDataRef *a2, off_t a3, off_t a4)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  memset(&v40, 0, sizeof(v40));
  if (stat(a1, &v40))
  {
    uint64_t v32 = __error();
    return __AFCSetErrorResult_4(0, *v32, 3892330497, v33, 1753, "stat", v34, v35, v37);
  }
  double valuePtr = (double)v40.st_mtimespec.tv_nsec / 1000000000.0 + (double)v40.st_mtimespec.tv_sec;
  CFNumberRef v11 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  if (a4 | a3) {
    off_t st_size = a4;
  }
  else {
    off_t st_size = v40.st_size;
  }
  if (a3 < 0)
  {
    uint64_t v36 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330503, v8, 1762, "Invalid starting offset %ld.", v9, v10, a3);
    goto LABEL_36;
  }
  if (st_size <= 0)
  {
    uint64_t v36 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330503, v8, 1763, "Invalid length %ld.", v9, v10, st_size);
    goto LABEL_36;
  }
  if (st_size + a3 > v40.st_size)
  {
    uint64_t v36 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330503, v8, 1764, "File %s ain't that long!", v9, v10, (char)a1);
    goto LABEL_36;
  }
  memset(&c, 0, sizeof(c));
  CC_SHA1_Init(&c);
  int v13 = open(a1, 0);
  if (v13 < 0)
  {
    uint64_t v27 = *__error();
    uint64_t v28 = 3892330516;
    uint64_t v29 = "open";
    int v30 = 0;
    int v31 = 1825;
LABEL_35:
    uint64_t v36 = __AFCSetErrorResult_4(v30, v27, v28, v17, v31, v29, v18, v19, v37);
LABEL_36:
    uint64_t v25 = v36;
    if (!v11) {
      return v25;
    }
    goto LABEL_24;
  }
  int v14 = v13;
  if (st_size >= 0x80000) {
    unint64_t v15 = 0x80000;
  }
  else {
    unint64_t v15 = st_size;
  }
  unint64_t v16 = CFAllocatorAllocate(0, v15, 0);
  if (!v16)
  {
    uint64_t v28 = 3892330499;
    uint64_t v29 = "CFAllocatorAlocate";
    int v30 = 1;
    uint64_t v27 = 0xFFFFFFFFLL;
    int v31 = 1830;
    goto LABEL_35;
  }
  char v20 = v16;
  if (lseek(v14, a3, 0) != a3)
  {
    uint64_t v27 = *__error();
    uint64_t v28 = 3892330516;
    uint64_t v29 = "lseek";
    int v30 = 0;
    int v31 = 1832;
    goto LABEL_35;
  }
  off_t v21 = 0;
  while (1)
  {
    size_t v22 = st_size - v21 >= v15 ? v15 : st_size - v21;
    ssize_t v23 = read(v14, v20, v22);
    if (v23 < 1) {
      break;
    }
    CC_SHA1_Update(&c, v20, v23);
    v21 += v23;
    if (v21 >= st_size)
    {
      CFAllocatorDeallocate(0, v20);
      goto LABEL_22;
    }
  }
  CFAllocatorDeallocate(0, v20);
  if (v23 < 0)
  {
    uint64_t v27 = *__error();
    uint64_t v28 = 3892330516;
    uint64_t v29 = "read";
    int v30 = 1;
    int v31 = 1847;
    goto LABEL_35;
  }
LABEL_22:
  CC_SHA1_Final(md, &c);
  CFDataRef v24 = CFDataCreate(0, md, 20);
  if (!v24)
  {
    uint64_t v28 = 3892330499;
    uint64_t v29 = "CFDataCreate";
    int v30 = 1;
    uint64_t v27 = 0xFFFFFFFFLL;
    int v31 = 1852;
    goto LABEL_35;
  }
  uint64_t v25 = 0;
  *a2 = v24;
  if (!v11) {
    return v25;
  }
LABEL_24:
  CFRelease(v11);
  return v25;
}

uint64_t __AFCProcessFileRefSetImmutableHintPacket_block_invoke(uint64_t a1)
{
  uint64_t result = fcntl(*(_DWORD *)(a1 + 40), 68, *(unsigned int *)(a1 + 44));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7AF8](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7B00](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B08](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x270EE42F8](allocator, theArray);
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

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x270EE4578](bundle, key, value, tableName);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x270EE4600]();
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x270EE4788](cf);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
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

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A0](err);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x270EE4A18](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
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

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x270EE4C78](number);
}

Boolean CFPreferencesAppValueIsForced(CFStringRef key, CFStringRef applicationID)
{
  return MEMORY[0x270EE4C98](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
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

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x270EE4ED0](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4EE0](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x270EE4F58](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

CFRunLoopSourceRef CFSocketCreateRunLoopSource(CFAllocatorRef allocator, CFSocketRef s, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4FC8](allocator, s, order);
}

CFSocketRef CFSocketCreateWithNative(CFAllocatorRef allocator, CFSocketNativeHandle sock, CFOptionFlags callBackTypes, CFSocketCallBack callout, const CFSocketContext *context)
{
  return (CFSocketRef)MEMORY[0x270EE4FD0](allocator, *(void *)&sock, callBackTypes, callout, context);
}

void CFSocketEnableCallBacks(CFSocketRef s, CFOptionFlags callBackTypes)
{
}

void CFSocketInvalidate(CFSocketRef s)
{
}

void CFSocketSetSocketFlags(CFSocketRef s, CFOptionFlags flags)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE50F0](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x270EE5118](alloc, formatOptions, format, arguments);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE51B8](string, buffer, maxBufLen);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x270EE51C8](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x270EE5338](url);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53C0](allocator, buffer, bufLen, isDirectory);
}

OSStatus SSLClose(SSLContextRef context)
{
  return MEMORY[0x270EFD500](context);
}

OSStatus SSLGetBufferedReadSize(SSLContextRef context, size_t *bufferSize)
{
  return MEMORY[0x270EFD518](context, bufferSize);
}

OSStatus SSLGetConnection(SSLContextRef context, SSLConnectionRef *connection)
{
  return MEMORY[0x270EFD528](context, connection);
}

OSStatus SSLRead(SSLContextRef context, void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x270EFD588](context, data, dataLength, processed);
}

OSStatus SSLWrite(SSLContextRef context, const void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x270EFD5F8](context, data, dataLength, processed);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFFileCoordinateReadingItemAtURL2()
{
  return MEMORY[0x270EE5610]();
}

uint64_t _CFFileCoordinateWritingItemAtURL2()
{
  return MEMORY[0x270EE5618]();
}

uint64_t _CFFileDidMove2()
{
  return MEMORY[0x270EE5620]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x270ED7ED0]();
}

asl_object_t asl_open(const char *ident, const char *facility, uint32_t opts)
{
  return (asl_object_t)MEMORY[0x270ED8658](ident, facility, *(void *)&opts);
}

int asl_vlog(asl_object_t obj, asl_object_t msg, int level, const char *format, va_list ap)
{
  return MEMORY[0x270ED8680](obj, msg, *(void *)&level, format, ap);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x270ED8F30](a1);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
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

void dispatch_retain(dispatch_object_t object)
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x270ED9910](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x270ED9968](a1, *(void *)&a2, a3);
}

int flock(int a1, int a2)
{
  return MEMORY[0x270ED9998](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x270ED9B00](*(void *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x270ED9B30](*(void *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x270ED9B48](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x270ED9B50](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x270ED9B60](a1);
}

int getdtablesize(void)
{
  return MEMORY[0x270ED9BD8]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

int kevent(int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return MEMORY[0x270ED9F60](*(void *)&kq, changelist, *(void *)&nchanges, eventlist, *(void *)&nevents, timeout);
}

int kqueue(void)
{
  return MEMORY[0x270ED9F90]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDA120](a1, a2);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A8](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x270EDA830](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x270EDA858](a1);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDAD10](*(void *)&__fd, __buf, __nbyte, a4);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE50](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE58](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x270EDAE60](a1, a2);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x270EDAE78](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x270EDAEF0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x270EDAF18](a1, a2);
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

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF78](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF80](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x270EDAF98](a1, *(void *)&a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDB0A0](*(void *)&__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x270EDB128](a1);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x270EDB138](a1, a2, a3);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x270EDB190](*(void *)&a1, a2, a3, *(void *)&a4);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

void rewinddir(DIR *a1)
{
}

int rmdir(const char *a1)
{
  return MEMORY[0x270EDB268](a1);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x270EDB3B0](*(void *)&a1, a2, a3, *(void *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x270EDB440](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int shutdown(int a1, int a2)
{
  return MEMORY[0x270EDB480](*(void *)&a1, *(void *)&a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int socketpair(int a1, int a2, int a3, int *a4)
{
  return MEMORY[0x270EDB528](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x270EDB570](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x270EDB5E8](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x270EDB650](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x270EDB688](__stringp, __delim);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int truncate(const char *a1, off_t a2)
{
  return MEMORY[0x270EDB978](a1, a2);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

int utimes(const char *a1, const timeval *a2)
{
  return MEMORY[0x270EDB9F8](a1, a2);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA70](a1, a2, a3);
}