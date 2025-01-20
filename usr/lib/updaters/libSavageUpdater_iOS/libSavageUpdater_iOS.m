CFTypeRef SavageSafeRetain(CFTypeRef cf)
{
  if (cf) {
    return CFRetain(cf);
  }
  return cf;
}

void SavageCFDictionarySetInteger32(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
  if (!v5) {
    SavageCFDictionarySetInteger32_cold_1();
  }
  CFNumberRef v6 = v5;
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v6);
}

void SavageCFDictionarySetBoolean(__CFDictionary *a1, const void *a2, int a3)
{
  v3 = (const void **)MEMORY[0x263EFFB40];
  if (!a3) {
    v3 = (const void **)MEMORY[0x263EFFB38];
  }
  CFDictionarySetValue(a1, a2, *v3);
}

void SavageCFDictionarySetData(__CFDictionary *a1, const void *a2, UInt8 *bytes, CFIndex length)
{
  CFDataRef v6 = CFDataCreate(0, bytes, length);
  if (!v6) {
    SavageCFDictionarySetData_cold_1();
  }
  CFDataRef v7 = v6;
  CFDictionarySetValue(a1, a2, v6);

  CFRelease(v7);
}

uint64_t SavageCFStringToUInt32(const __CFString *a1, _DWORD *a2, int a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t result = CFStringGetCString(a1, buffer, 32, 0x600u);
  if (result)
  {
    *__error() = 0;
    *a2 = strtol(buffer, 0, a3);
    return *__error() == 0;
  }
  return result;
}

CFErrorRef createCFErrorWithDomain(uint64_t a1, unsigned int a2, uint64_t a3, const __CFString *a4)
{
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@: %s", a4, a1);
  if (!v8) {
    return 0;
  }
  v9 = v8;
  CFStringRef v10 = CFStringCreateWithFormat(v7, 0, @"%@: Input Options: %@", v8, a3);
  if (!v10)
  {
    CFErrorRef v13 = 0;
    goto LABEL_4;
  }
  CFStringRef v11 = v10;
  Mutable = CFDictionaryCreateMutable(v7, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263EFFC70], v9);
  CFErrorRef v13 = CFErrorCreate(v7, a4, a2, Mutable);
  CFRelease(v11);
  CFRelease(v9);
  v9 = Mutable;
  if (Mutable) {
LABEL_4:
  }
    CFRelease(v9);
  return v13;
}

uint64_t GetRelevantMeasurementTags(CFDictionaryRef theDict, void *a2, void *a3)
{
  uint64_t result = 2;
  if (theDict && a2 && a3)
  {
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x263F90388]);
    if (!Value) {
      return 17;
    }
    CFBooleanRef v8 = Value;
    CFTypeID v9 = CFGetTypeID(Value);
    if (v9 != CFBooleanGetTypeID()) {
      return 17;
    }
    int v10 = CFBooleanGetValue(v8);
    CFDataRef v11 = (const __CFData *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x263F90390]);
    if (!v11) {
      return 17;
    }
    CFDataRef v12 = v11;
    CFTypeID v13 = CFGetTypeID(v11);
    if (v13 != CFDataGetTypeID()) {
      return 17;
    }
    BytePtr = CFDataGetBytePtr(v12);
    if (BytePtr)
    {
      unsigned int v15 = *BytePtr;
      int v16 = ((v15 & 0xF0) + 96) >> 4;
      if ((v16 - 8) < 2)
      {
        v19 = (void *)MEMORY[0x263F903B8];
        v20 = (void *)MEMORY[0x263F903B0];
LABEL_23:
        BOOL v22 = v10 == 0;
        if (!v10) {
          v19 = v20;
        }
        *a2 = *v19;
        v23 = (uint64_t *)MEMORY[0x263F903E8];
        v24 = (uint64_t *)MEMORY[0x263F903E0];
LABEL_26:
        if (v22) {
          v23 = v24;
        }
        uint64_t v25 = *v23;
        goto LABEL_29;
      }
      if (!(((v15 & 0xF0) + 96) >> 4))
      {
        v21 = (void *)MEMORY[0x263F903C8];
        BOOL v22 = v10 == 0;
        if (!v10) {
          v21 = (void *)MEMORY[0x263F903C0];
        }
        *a2 = *v21;
        v23 = (uint64_t *)MEMORY[0x263F903D8];
        v24 = (uint64_t *)MEMORY[0x263F903D0];
        goto LABEL_26;
      }
      if (v16 == 4)
      {
        v17 = (uint64_t *)MEMORY[0x263F903D8];
        v18 = (uint64_t *)MEMORY[0x263F903D0];
LABEL_19:
        if (!v10) {
          v17 = v18;
        }
        uint64_t v25 = *v17;
        *a2 = v25;
LABEL_29:
        uint64_t result = 0;
        *a3 = v25;
        return result;
      }
      if (v15 >= 0xF0)
      {
        v17 = (uint64_t *)MEMORY[0x263F903E8];
        v18 = (uint64_t *)MEMORY[0x263F903E0];
        goto LABEL_19;
      }
    }
    v19 = (void *)MEMORY[0x263F903A8];
    v20 = (void *)MEMORY[0x263F903A0];
    goto LABEL_23;
  }
  return result;
}

uint64_t GetYonkersMeasurementTags(CFDictionaryRef theDict, CFTypeRef *a2, CFTypeRef *a3)
{
  int valuePtr = 0;
  uint64_t result = 2;
  if (theDict && a2)
  {
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x263F904B0]);
    if (Value
      && (CFBooleanRef v8 = Value, v9 = CFGetTypeID(Value), v9 == CFBooleanGetTypeID())
      && (BOOL v10 = CFBooleanGetValue(v8) != 0,
          (CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x263F904A0])) != 0)
      && (v12 = v11, CFTypeID v13 = CFGetTypeID(v11), v13 == CFNumberGetTypeID()))
    {
      CFNumberGetValue(v12, kCFNumberSInt32Type, &valuePtr);
      return GetYonkersFabRevisionTags(valuePtr, v10, a2, a3);
    }
    else
    {
      return 17;
    }
  }
  return result;
}

uint64_t GetYonkersFabRevisionTags(int a1, int a2, CFTypeRef *a3, CFTypeRef *a4)
{
  int v8 = 0;
  uint64_t v9 = 0;
  while (dword_22F4E5FA0[v9] != a1)
  {
    ++v9;
    v8 -= 2;
    if (v9 == 6)
    {
      CFStringRef v10 = 0;
      CFStringRef v11 = 0;
      uint64_t v12 = 2;
      goto LABEL_6;
    }
  }
  BOOL v13 = a2 != 0;
  uint64_t v14 = v13 | (8 * (v9 < 4));
  CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"Yonkers,SysTopPatch%X", (v13 - v8));
  CFStringRef v11 = CFStringCreateWithFormat(v15, 0, @"Yonkers,SysTopPatch%X", v14);
  uint64_t v12 = 0;
LABEL_6:
  uint64_t v16 = 0;
  v17 = &dword_22F4E5FB8;
  while (1)
  {
    int v18 = *v17++;
    if (v18 == a1) {
      break;
    }
    v16 -= 2;
    if (v16 == -16)
    {
      if (!a3) {
        goto LABEL_17;
      }
      goto LABEL_15;
    }
  }
  BOOL v19 = a2 != 0;
  if ((v19 - v16) < 8) {
    int v20 = 8;
  }
  else {
    int v20 = -8;
  }
  uint64_t v21 = (v20 | v19) - v16;
  CFAllocatorRef v22 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"Yonkers,SysTopPatch%X", v19 - v16);
  CFStringRef v11 = CFStringCreateWithFormat(v22, 0, @"Yonkers,SysTopPatch%X", v21);
  uint64_t v12 = 0;
  if (!a3) {
    goto LABEL_17;
  }
LABEL_15:
  if (v10) {
    *a3 = CFRetain(v10);
  }
LABEL_17:
  if (a4 && v11) {
    *a4 = CFRetain(v11);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v11) {
    CFRelease(v11);
  }
  return v12;
}

uint64_t _hexStringToBytes(unsigned char *a1, uint64_t *a2, unsigned __int8 *a3, unint64_t a4)
{
  uint64_t v4 = 2;
  if ((a4 & 1) == 0 && *a2 >= a4 >> 1 && a1 && a3)
  {
    uint64_t v5 = 0;
    *a2 = 0;
    if (a4 < 2)
    {
LABEL_27:
      uint64_t v4 = 0;
      *a2 = v5;
      a1[v5] = 0;
    }
    else
    {
      if (a4 >> 1 <= 1) {
        uint64_t v5 = 1;
      }
      else {
        uint64_t v5 = a4 >> 1;
      }
      uint64_t v6 = MEMORY[0x263EF8318];
      CFAllocatorRef v7 = a1;
      uint64_t v8 = v5;
      while (1)
      {
        uint64_t v9 = *a3;
        if ((*(_DWORD *)(v6 + 4 * v9 + 60) & 0x10000) == 0) {
          return 2;
        }
        uint64_t v10 = a3[1];
        if ((*(_DWORD *)(v6 + 4 * v10 + 60) & 0x10000) == 0) {
          return 2;
        }
        unsigned int v11 = v9 - 48;
        unsigned int v12 = v9 - 97;
        if ((v9 - 65) >= 6) {
          char v13 = -1;
        }
        else {
          char v13 = v9 - 55;
        }
        char v14 = v9 - 87;
        if (v12 > 5) {
          char v14 = v13;
        }
        if (v11 < 0xA) {
          char v14 = v11;
        }
        char v15 = 16 * v14;
        unsigned int v16 = v10 - 48;
        unsigned int v17 = v10 - 97;
        if ((v10 - 65) >= 6) {
          char v18 = -1;
        }
        else {
          char v18 = v10 - 55;
        }
        char v19 = v10 - 87;
        if (v17 > 5) {
          char v19 = v18;
        }
        if (v16 < 0xA) {
          char v19 = v16;
        }
        *v7++ = v19 | v15;
        a3 += 2;
        if (!--v8) {
          goto LABEL_27;
        }
      }
    }
  }
  return v4;
}

void *YonkersDevice::getInstance(YonkersDevice *this)
{
  v1 = operator new(0x38uLL);
  *(_WORD *)v1 = 0;
  v1[1] = 0;
  v1[2] = 0;
  *((_DWORD *)v1 + 6) = 0x10000;
  *(void *)((char *)v1 + 44) = 0;
  *(void *)((char *)v1 + 36) = 0;
  *((_DWORD *)v1 + 13) = 0;
  *((unsigned char *)v1 + 28) = 0;
  YonkersDevice::SetupDevice((io_iterator_t *)v1);
  YonkersDevice::CheckProvisioningStatus((YonkersDevice *)v1);
  YonkersDevice::myInstance = (uint64_t)v1;
  return v1;
}

void sub_22F4CCBA8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void YonkersDevice::YonkersDevice(YonkersDevice *this)
{
  *(_WORD *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((_DWORD *)this + 6) = 0x10000;
  *(void *)((char *)this + 44) = 0;
  *(void *)((char *)this + 36) = 0;
  *((_DWORD *)this + 13) = 0;
  *((unsigned char *)this + 28) = 0;
  YonkersDevice::SetupDevice((io_iterator_t *)this);
  YonkersDevice::CheckProvisioningStatus(this);
}

void YonkersDevice::destroyInstance(YonkersDevice *this)
{
  if (YonkersDevice::myInstance)
  {
    YonkersDevice::~YonkersDevice((YonkersDevice *)YonkersDevice::myInstance);
    operator delete(v1);
    YonkersDevice::myInstance = 0;
  }
}

uint64_t YonkersDevice::SetupDevice(io_iterator_t *this)
{
  CFMutableDictionaryRef properties = 0;
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  io_registry_entry_t v3 = IORegistryEntryFromPath(*MEMORY[0x263F0EC88], "IODeviceTree:/chosen");
  uint64_t v4 = 0;
  uint64_t v5 = this + 9;
  while (1)
  {
    CFDictionaryRef v6 = IOServiceMatching(off_264A0A380[v4]);
    uint64_t MatchingServices = IOServiceGetMatchingServices(v2, v6, this + 9);
    if (!MatchingServices)
    {
      if (*v5) {
        break;
      }
    }
    *uint64_t v5 = 0;
    if (++v4 == 3)
    {
      LODWORD(v4) = 1;
      goto LABEL_6;
    }
  }
  if ((v4 - 1) < 2) {
    *((unsigned char *)this + 27) = 1;
  }
LABEL_6:
  uint64_t v8 = (const __CFAllocator **)MEMORY[0x263EFFB08];
  if (v3)
  {
    CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v3, @"development-cert", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (CFProperty)
    {
      CFDataRef v10 = CFProperty;
      CFTypeID v11 = CFGetTypeID(CFProperty);
      if (v11 == CFDataGetTypeID()) {
        *((unsigned char *)this + 26) = *CFDataGetBytePtr(v10) == 0;
      }
      CFRelease(v10);
    }
  }
  io_object_t v12 = IOIteratorNext(*v5);
  if (v12)
  {
    io_registry_entry_t v13 = v12;
    CFAllocatorRef v14 = *v8;
    while (1)
    {
      uint64_t MatchingServices = IORegistryEntryCreateCFProperties(v13, &properties, v14, 0);
      if (!MatchingServices)
      {
        if (this[10])
        {
          uint64_t MatchingServices = 0;
        }
        else
        {
          this[10] = v13;
          if (!v4) {
            YonkersDevice::ReadSensorType((YonkersDevice *)this);
          }
          uint64_t MatchingServices = YonkersDevice::YonkersDeviceOpen((YonkersDevice *)this);
          if (!MatchingServices)
          {
LABEL_23:
            if (properties) {
              CFRelease(properties);
            }
            return MatchingServices;
          }
          YonkersDevice::YonkersDeviceClose((YonkersDevice *)this);
          if (properties)
          {
            CFRelease(properties);
            CFMutableDictionaryRef properties = 0;
          }
          IOObjectRelease(this[10]);
          this[10] = 0;
        }
      }
      io_registry_entry_t v13 = IOIteratorNext(*v5);
      if (!v13) {
        goto LABEL_23;
      }
    }
  }
  return MatchingServices;
}

uint64_t YonkersDevice::CheckProvisioningStatus(YonkersDevice *this)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = 3758097136;
  *(void *)buffer = 0;
  uint64_t v18 = 0;
  memset(v16, 0, sizeof(v16));
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 10), @"YonkersUID", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFDataRef v5 = CFProperty;
    CFTypeID v6 = CFGetTypeID(CFProperty);
    if (v6 != CFDataGetTypeID()) {
      goto LABEL_24;
    }
    v20.location = 0;
    v20.length = 16;
    CFDataGetBytes(v5, v20, buffer);
    CFRelease(v5);
    *((void *)this + 1) = bswap64(*(unint64_t *)buffer);
    CFDataRef v7 = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 10), @"YonkersFabRevision", v3, 0);
    if (!v7) {
      return 0;
    }
    CFDataRef v5 = v7;
    CFTypeID v8 = CFGetTypeID(v7);
    if (v8 != CFDataGetTypeID())
    {
      uint64_t v2 = 0;
      goto LABEL_24;
    }
    BytePtr = CFDataGetBytePtr(v5);
    if (BytePtr) {
      unsigned int v10 = __rev16(*(unsigned __int16 *)BytePtr);
    }
    else {
      unsigned int v10 = 0;
    }
    CFRelease(v5);
    for (uint64_t i = 0; i != 5; ++i)
    {
      if (v10 == dword_22F4E5FD8[i])
      {
        *(unsigned char *)this = 0;
        goto LABEL_18;
      }
    }
    if (*(unsigned char *)this)
    {
      uint64_t v12 = 0;
      while (v10 != dword_22F4E5FEC[v12])
      {
        if (++v12 == 10) {
          goto LABEL_18;
        }
      }
      *((unsigned char *)this + 1) = 1;
    }
LABEL_18:
    CFDataRef v13 = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 10), @"YonkersPubKeyHmac", v3, 0);
    if (v13)
    {
      CFDataRef v5 = v13;
      CFTypeID v14 = CFGetTypeID(v13);
      if (v14 == CFDataGetTypeID())
      {
        v21.location = 0;
        v21.length = 32;
        CFDataGetBytes(v5, v21, (UInt8 *)v16);
        CFRelease(v5);
        uint64_t v2 = 0;
        *((void *)this + 2) = bswap64(*(unint64_t *)&v16[0]);
        return v2;
      }
LABEL_24:
      CFRelease(v5);
    }
  }
  return v2;
}

void YonkersDevice::~YonkersDevice(YonkersDevice *this)
{
  io_object_t v2 = *((_DWORD *)this + 9);
  if (v2) {
    IOObjectRelease(v2);
  }
  io_object_t v3 = *((_DWORD *)this + 10);
  if (v3) {
    IOObjectRelease(v3);
  }
  YonkersDevice::YonkersDeviceClose(this);
}

void __clang_call_terminate(void *a1)
{
}

uint64_t YonkersDevice::YonkersDeviceClose(YonkersDevice *this)
{
  if (*((unsigned char *)this + 27))
  {
    SavageCamInterfaceClose();
    uint64_t result = 0;
    *((void *)this + 6) = 0;
  }
  else
  {
    mach_port_t v3 = *((_DWORD *)this + 11);
    if (v3)
    {
      uint64_t v4 = IOConnectCallScalarMethod(v3, 4u, 0, 0, 0, 0);
      IOServiceClose(*((_DWORD *)this + 11));
      *((_DWORD *)this + 11) = 0;
      return v4;
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

void YonkersDevice::ReadSensorType(YonkersDevice *this)
{
  CFDataRef v2 = (const __CFData *)IORegistryEntrySearchCFProperty(*((_DWORD *)this + 10), "IOService", @"sensor-type", (CFAllocatorRef)*MEMORY[0x263EFFB08], 3u);
  *(_DWORD *)buffer = 0;
  if (v2)
  {
    CFDataRef v3 = v2;
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 == CFDataGetTypeID())
    {
      v6.location = 0;
      v6.length = 4;
      CFDataGetBytes(v3, v6, buffer);
      if ((*(_DWORD *)buffer - 167) <= 0x1D && ((1 << (buffer[0] + 89)) & 0x3800000F) != 0)
      {
        *(unsigned char *)this = 1;
        *((_DWORD *)this + 8) = 2;
      }
      else
      {
        *(unsigned char *)this = 0;
      }
    }
    CFRelease(v3);
  }
}

uint64_t YonkersDevice::YonkersDeviceOpen(YonkersDevice *this)
{
  v6[1] = *MEMORY[0x263EF8340];
  if (*((unsigned char *)this + 27) == 1)
  {
    v6[0] = 0;
    CFDataRef v2 = (uint64_t *)((char *)this + 48);
    uint64_t result = SavageCamInterfaceOpen();
    if (result) {
      return result;
    }
    uint64_t result = *v2;
    if (!*v2) {
      return result;
    }
    uint64_t result = SavageCamInterfaceGetSensorInfo();
    if (result) {
      return result;
    }
    *((_DWORD *)this + 8) = v6[0];
    int v4 = BYTE4(v6[0]);
    *((unsigned char *)this + 28) = BYTE4(v6[0]);
    *(unsigned char *)this = BYTE5(v6[0]);
    if (!v4) {
      YonkersDevice::YonkersDeviceClose(this);
    }
  }
  if (*((unsigned char *)this + 28)) {
    return 0;
  }
  if (*((_DWORD *)this + 11)) {
    return 3758097093;
  }
  LODWORD(result) = IOServiceOpen(*((_DWORD *)this + 10), *MEMORY[0x263EF8960], 0x2Au, (io_connect_t *)this + 11);
  mach_port_t v5 = *((_DWORD *)this + 11);
  if (v5) {
    uint64_t result = result;
  }
  else {
    uint64_t result = 3758097084;
  }
  if (!result)
  {
    v6[0] = 0;
    return IOConnectCallScalarMethod(v5, 3u, v6, 1u, 0, 0);
  }
  return result;
}

uint64_t YonkersDevice::CreateCertInfoBlob(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 3758097136;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 40), @"YonkersMNS", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (!CFProperty) {
    return v4;
  }
  CFDataRef v7 = CFProperty;
  CFTypeID v8 = CFGetTypeID(CFProperty);
  if (v8 != CFDataGetTypeID()) {
    goto LABEL_19;
  }
  BytePtr = CFDataGetBytePtr(v7);
  if (BytePtr)
  {
    int v10 = *BytePtr;
    if (v10 == 4)
    {
      *(_DWORD *)a2 = 0;
      int v10 = *BytePtr;
    }
    if (v10 == 8) {
      *(_DWORD *)a2 = 1;
    }
  }
  CFRelease(v7);
  CFDataRef v11 = (const __CFData *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 40), @"YonkersChipID", v5, 0);
  if (!v11) {
    return v4;
  }
  CFDataRef v7 = v11;
  CFTypeID v12 = CFGetTypeID(v11);
  if (v12 != CFDataGetTypeID()) {
    goto LABEL_19;
  }
  CFDataRef v13 = (unsigned int *)CFDataGetBytePtr(v7);
  if (v13) {
    *(_DWORD *)(a2 + 4) = bswap32(*v13);
  }
  CFRelease(v7);
  CFDataRef v14 = (const __CFData *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 40), @"YonkersUID", v5, 0);
  if (!v14) {
    return v4;
  }
  CFDataRef v7 = v14;
  CFTypeID v15 = CFGetTypeID(v14);
  if (v15 != CFDataGetTypeID()) {
    goto LABEL_19;
  }
  v21.location = 0;
  v21.length = 16;
  CFDataGetBytes(v7, v21, (UInt8 *)(a2 + 8));
  CFRelease(v7);
  CFDataRef v16 = (const __CFData *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 40), @"YonkersPubKey", v5, 0);
  if (!v16) {
    return v4;
  }
  CFDataRef v7 = v16;
  CFTypeID v17 = CFGetTypeID(v16);
  if (v17 != CFDataGetTypeID())
  {
LABEL_19:
    CFRelease(v7);
    return v4;
  }
  v22.location = 0;
  v22.length = 64;
  CFDataGetBytes(v7, v22, (UInt8 *)(a2 + 24));
  CFRelease(v7);
  CFDataRef v18 = (const __CFData *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 40), @"YonkersPubKeyHmac", v5, 0);
  if (v18)
  {
    CFDataRef v7 = v18;
    CFTypeID v19 = CFGetTypeID(v18);
    if (v19 == CFDataGetTypeID())
    {
      v23.location = 0;
      v23.length = 32;
      CFDataGetBytes(v7, v23, (UInt8 *)(a2 + 88));
      uint64_t v4 = 0;
    }
    goto LABEL_19;
  }
  return v4;
}

uint64_t YonkersDevice::CreateDeviceInfoDict(YonkersDevice *this, __CFDictionary *a2)
{
  uint64_t v4 = 3758097136;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(*((_DWORD *)this + 10), @"YonkersUID", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (!CFProperty) {
    return v4;
  }
  CFDataRef v7 = CFProperty;
  CFTypeID v8 = CFGetTypeID(CFProperty);
  if (v8 != CFDataGetTypeID()) {
    goto LABEL_29;
  }
  CFDictionaryAddValue(a2, (const void *)*MEMORY[0x263F90498], v7);
  CFRelease(v7);
  CFTypeRef v9 = IORegistryEntryCreateCFProperty(*((_DWORD *)this + 10), @"YonkersNonce", v5, 0);
  if (!v9) {
    return v4;
  }
  CFDataRef v7 = v9;
  CFTypeID v10 = CFGetTypeID(v9);
  if (v10 != CFDataGetTypeID()) {
    goto LABEL_29;
  }
  CFDictionaryAddValue(a2, (const void *)*MEMORY[0x263F904A8], v7);
  CFRelease(v7);
  CFTypeRef v11 = IORegistryEntryCreateCFProperty(*((_DWORD *)this + 10), @"YonkersFabRevision", v5, 0);
  if (!v11) {
    return v4;
  }
  CFDataRef v7 = v11;
  CFTypeID v12 = CFGetTypeID(v11);
  if (v12 != CFDataGetTypeID()) {
    goto LABEL_29;
  }
  BytePtr = CFDataGetBytePtr((CFDataRef)v7);
  if (BytePtr)
  {
    int v14 = __rev16(*(unsigned __int16 *)BytePtr);
    char v15 = 1;
    if (v14 > 59904)
    {
      BOOL v16 = v14 == 59905;
      int v17 = 61953;
    }
    else
    {
      BOOL v16 = v14 == 54529;
      int v17 = 56577;
    }
    if (!v16 && v14 != v17) {
      char v15 = 0;
    }
    *((unsigned char *)this + 24) = v15;
    SavageCFDictionarySetInteger32(a2, (const void *)*MEMORY[0x263F904A0], v14);
  }
  CFRelease(v7);
  CFTypeRef v19 = IORegistryEntryCreateCFProperty(*((_DWORD *)this + 10), @"YonkersChipID", v5, 0);
  if (!v19) {
    return v4;
  }
  CFDataRef v7 = v19;
  CFTypeID v20 = CFGetTypeID(v19);
  if (v20 != CFDataGetTypeID())
  {
LABEL_29:
    CFRelease(v7);
    return v4;
  }
  CFRange v21 = (unsigned int *)CFDataGetBytePtr((CFDataRef)v7);
  if (v21) {
    SavageCFDictionarySetInteger32(a2, (const void *)*MEMORY[0x263F90490], bswap32(*v21));
  }
  CFRelease(v7);
  CFTypeRef v22 = IORegistryEntryCreateCFProperty(*((_DWORD *)this + 10), @"YonkersMNS", v5, 0);
  if (v22)
  {
    CFDataRef v7 = v22;
    CFTypeID v23 = CFGetTypeID(v22);
    if (v23 == CFDataGetTypeID())
    {
      v24 = CFDataGetBytePtr((CFDataRef)v7);
      if (v24)
      {
        int v25 = *v24;
        if (v25 == 4)
        {
          *((unsigned char *)this + 25) = 0;
          int v25 = *v24;
        }
        if (v25 == 8) {
          *((unsigned char *)this + 25) = 1;
        }
      }
      SavageCFDictionarySetBoolean(a2, @"YonkersIsProvisioned", *((unsigned __int8 *)this + 8));
      uint64_t v4 = 0;
    }
    goto LABEL_29;
  }
  return v4;
}

uint64_t YonkersDevice::PrePersonalize(YonkersDevice *this, unsigned int a2)
{
  v5[1] = *MEMORY[0x263EF8340];
  if (*((unsigned char *)this + 28))
  {
    uint64_t v2 = *((void *)this + 6);
    return MEMORY[0x270F5CB70](v2, 1);
  }
  else
  {
    mach_port_t v3 = *((_DWORD *)this + 11);
    if (v3)
    {
      v5[0] = a2;
      return IOConnectCallScalarMethod(v3, 0x43u, v5, 1u, 0, 0);
    }
    else
    {
      return 3758097084;
    }
  }
}

uint64_t YonkersDevice::PreFusing(YonkersDevice *this, unsigned int a2)
{
  v5[1] = *MEMORY[0x263EF8340];
  if (*((unsigned char *)this + 28))
  {
    uint64_t v2 = *((void *)this + 6);
    return MEMORY[0x270F5CB68](v2, 1);
  }
  else
  {
    mach_port_t v3 = *((_DWORD *)this + 11);
    if (v3)
    {
      v5[0] = a2;
      return IOConnectCallScalarMethod(v3, 0x44u, v5, 1u, 0, 0);
    }
    else
    {
      return 3758097084;
    }
  }
}

uint64_t YonkersDevice::Fusing(YonkersDevice *this, unsigned int a2, const unsigned __int8 *a3, unsigned int a4)
{
  v9[3] = *MEMORY[0x263EF8340];
  if (*((unsigned char *)this + 28))
  {
    uint64_t v5 = SavageCamInterfaceSensorFusing();
LABEL_3:
    uint64_t v6 = v5;
    goto LABEL_4;
  }
  mach_port_t v8 = *((_DWORD *)this + 11);
  v9[2] = a2;
  uint64_t v6 = 3758097090;
  if (a3 && a4)
  {
    v9[0] = (uint64_t)a3;
    v9[1] = a4;
    if (!v8)
    {
      uint64_t v6 = 3758097084;
      goto LABEL_4;
    }
    uint64_t v5 = IOConnectCallScalarMethod(v8, 0x45u, v9, 3u, 0, 0);
    goto LABEL_3;
  }
LABEL_4:
  *((void *)this + 1) = 0;
  YonkersDevice::CheckProvisioningStatus(this);
  return v6;
}

uint64_t YonkersUpdateController::getInstance(YonkersUpdateController *this, const __CFDictionary *a2, void *a3, void *a4)
{
  CFDataRef v7 = (YonkersUpdateController *)operator new(0xA0uLL);
  YonkersUpdateController::YonkersUpdateController(v7);
  YonkersUpdateController::myInstance = (uint64_t)v7;
  *(void *)CFDataRef v7 = a3;
  *((void *)v7 + 1) = a2;
  YonkersUpdateController::YonkersLog(v7, "%s - %p (%p) - UpdaterIsSupported = %d; YonkersIsPresent = %d \n",
    "getInstance",
    v7,
    *((const void **)v7 + 3),
    *((unsigned __int8 *)v7 + 34),
    *(unsigned __int8 *)(*((void *)v7 + 3) + 1));
  YonkersUpdateController::start((YonkersUpdateController *)YonkersUpdateController::myInstance, this);
  return YonkersUpdateController::myInstance;
}

void sub_22F4CDA5C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void YonkersUpdateController::YonkersLog(YonkersUpdateController *this, const char *a2, ...)
{
  va_start(va, a2);
  uint64_t v2 = MEMORY[0x270FA5388](this, a2);
  uint64_t v7 = *MEMORY[0x263EF8340];
  vsnprintf(__str, 0x1000uLL, v3, va);
  if (*(void *)v2)
  {
    (*(void (**)(void, char *))v2)(*(void *)(v2 + 8), __str);
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v5 = __str;
    _os_log_impl(&dword_22F4CB000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "YonkersLog: %s \n", buf, 0xCu);
  }
}

uint64_t YonkersUpdateController::start(YonkersUpdateController *this, const __CFDictionary *a2)
{
  *((unsigned char *)this + 21) = 1;
  if (*((unsigned char *)this + 34)) {
    YonkersDevice::CheckProvisioningStatus(*((YonkersDevice **)this + 3));
  }
  YonkersUpdateController::YonkersLog(this, "%s: isProvisioned=%d; isSocProdFused=%d; persoLoop = %d\n",
    "start",
    *(void *)(*((void *)this + 3) + 8),
    *(unsigned __int8 *)(*((void *)this + 3) + 26),
    *((_DWORD *)this + 39));
  if (a2)
  {
    CFBooleanRef Value = CFDictionaryGetValue(a2, @"Options");
    CFDictionaryRef v5 = (const __CFDictionary *)SavageSafeRetain(Value);
    if (!v5 || (CFDictionaryRef v6 = v5, v7 = CFGetTypeID(v5), v7 != CFDictionaryGetTypeID()))
    {
      YonkersUpdateController::YonkersLog(this, "Yonkers: restoreOptions missing or not a dictionary\n");
      a2 = 0;
      goto LABEL_47;
    }
    if (!CFDictionaryGetCount(v6))
    {
      a2 = 0;
      *((unsigned char *)this + 32) = 1;
      goto LABEL_47;
    }
    a2 = (const __CFDictionary *)CFCopyDescription(v6);
    CStringPtr = CFStringGetCStringPtr((CFStringRef)a2, 0);
    CFTypeRef v9 = CFStringGetCStringPtr(@"Options", 0);
    CFTypeID v10 = "No C string description available.";
    if (CStringPtr) {
      CFTypeID v10 = CStringPtr;
    }
    YonkersUpdateController::YonkersLog(this, "%s [input]: %s %s \n", "start", v9, v10);
    CFTypeRef v11 = CFDictionaryGetValue(v6, (const void *)*MEMORY[0x263F90468]);
    if (v11)
    {
      CFTypeID v12 = CFGetTypeID(v11);
      if (v12 == CFBooleanGetTypeID()) {
        *((unsigned char *)this + 32) = 1;
      }
    }
    CFStringRef v13 = (const __CFString *)CFDictionaryGetValue(v6, @"PersonalizedFirmwareRootPath");
    if (v13 && (v14 = v13, CFTypeID v15 = CFGetTypeID(v13), v15 == CFStringGetTypeID()))
    {
      BOOL v16 = (CFMutableStringRef *)((char *)this + 56);
    }
    else
    {
      CFStringRef v17 = (const __CFString *)CFDictionaryGetValue(v6, @"RestoreSystemPartition");
      if (!v17) {
        goto LABEL_19;
      }
      CFStringRef v18 = v17;
      CFTypeID v19 = CFGetTypeID(v17);
      if (v19 != CFStringGetTypeID()) {
        goto LABEL_19;
      }
      BOOL v16 = (CFMutableStringRef *)((char *)this + 56);
      CFStringAppend(*((CFMutableStringRef *)this + 7), v18);
      CFStringRef v14 = @"/usr/standalone/firmware/Yonkers/";
    }
    CFStringAppend(*v16, v14);
LABEL_19:
    CFBooleanRef v20 = (const __CFBoolean *)CFDictionaryGetValue(v6, @"RestoreInternal");
    if (v20)
    {
      CFBooleanRef v21 = v20;
      CFTypeID v22 = CFGetTypeID(v20);
      if (v22 == CFBooleanGetTypeID()) {
        *((unsigned char *)this + 35) = CFBooleanGetValue(v21);
      }
    }
    CFBooleanRef v23 = (const __CFBoolean *)CFDictionaryGetValue(v6, @"PostFDRSealing");
    if (v23)
    {
      CFBooleanRef v24 = v23;
      CFTypeID v25 = CFGetTypeID(v23);
      if (v25 == CFBooleanGetTypeID())
      {
        if (*((unsigned char *)this + 33)) {
          BOOL v26 = 1;
        }
        else {
          BOOL v26 = CFBooleanGetValue(v24) != 0;
        }
        *((unsigned char *)this + 33) = v26;
      }
    }
    CFBooleanRef v27 = (const __CFBoolean *)CFDictionaryGetValue(v6, @"FlipFusingState");
    if (v27)
    {
      CFBooleanRef v28 = v27;
      CFTypeID v29 = CFGetTypeID(v27);
      if (v29 == CFBooleanGetTypeID() && CFBooleanGetValue(v28) == 1)
      {
        uint64_t v30 = *((void *)this + 3);
        if (!*(void *)(v30 + 8))
        {
          if (*(unsigned char *)(v30 + 26)) {
            int v31 = 2;
          }
          else {
            int v31 = 4;
          }
          *((_DWORD *)this + 39) = v31;
        }
      }
    }
    CFDictionaryRef v32 = (const __CFDictionary *)CFDictionaryGetValue(v6, (const void *)*MEMORY[0x263F90458]);
    if (v32)
    {
      CFDictionaryRef v33 = v32;
      CFBooleanRef v34 = (const __CFBoolean *)CFDictionaryGetValue(v32, (const void *)*MEMORY[0x263F90470]);
      if (v34)
      {
        CFBooleanRef v35 = v34;
        CFTypeID v36 = CFGetTypeID(v34);
        if (v36 == CFBooleanGetTypeID())
        {
          if (*((unsigned char *)this + 33)) {
            BOOL v37 = 1;
          }
          else {
            BOOL v37 = CFBooleanGetValue(v35) != 0;
          }
          *((unsigned char *)this + 33) = v37;
        }
      }
      if (!*(void *)(*((void *)this + 3) + 8))
      {
        CFBooleanRef v42 = (const __CFBoolean *)CFDictionaryGetValue(v33, @"FusingOption");
        if (v42)
        {
          CFBooleanRef v43 = v42;
          CFTypeID v44 = CFGetTypeID(v42);
          if (v44 == CFBooleanGetTypeID()) {
            *((unsigned char *)this + 17) = CFBooleanGetValue(v43);
          }
        }
      }
      CFStringRef v38 = (const __CFString *)CFDictionaryGetValue(v33, @"CertificationURL");
      if (v38)
      {
        CFStringRef v39 = v38;
        CFTypeID v40 = CFGetTypeID(v38);
        if (v40 == CFStringGetTypeID()) {
          *((unsigned char *)this + 19) = CFStringGetLength(v39) != 0;
        }
      }
    }
    else
    {
      YonkersUpdateController::YonkersLog(this, "Yonkers: No YonkersOptions \n");
    }
  }
LABEL_47:
  if (*((unsigned char *)this + 35))
  {
    if (*(void *)(*((void *)this + 3) + 8)
      || *((unsigned char *)this + 17)
      || *((unsigned char *)this + 19)
      || *((unsigned char *)this + 16))
    {
      *((_DWORD *)this + 39) = 1;
    }
  }
  else
  {
    *((_DWORD *)this + 39) = 1;
    if (!*(unsigned char *)(*((void *)this + 3) + 1)) {
      *((unsigned char *)this + 33) = 1;
    }
  }
  if (a2) {
    CFRelease(a2);
  }
  return 0;
}

void YonkersUpdateController::destroyInstance(YonkersUpdateController *this)
{
  if (YonkersUpdateController::myInstance)
  {
    YonkersUpdateController::YonkersLog((YonkersUpdateController *)YonkersUpdateController::myInstance, "%s - %p (%p) - UpdaterIsSupported = %d; YonkersIsPresent = %d \n",
      "destroyInstance",
      (const void *)YonkersUpdateController::myInstance,
      *(const void **)(YonkersUpdateController::myInstance + 24),
      *(unsigned __int8 *)(YonkersUpdateController::myInstance + 34),
      *(unsigned __int8 *)(*(void *)(YonkersUpdateController::myInstance + 24) + 1));
    YonkersDevice::destroyInstance(v1);
    if (YonkersUpdateController::myInstance)
    {
      YonkersUpdateController::~YonkersUpdateController((YonkersUpdateController *)YonkersUpdateController::myInstance);
      operator delete(v2);
    }
    YonkersUpdateController::myInstance = 0;
  }
}

void YonkersUpdateController::YonkersUpdateController(YonkersUpdateController *this)
{
  *((void *)this + 5) = 0;
  *((void *)this + 10) = 0;
  *((void *)this + 14) = 0;
  *((void *)this + 15) = 0;
  *((void *)this + 17) = 0;
  *((void *)this + 18) = 0;
  *((_DWORD *)this + 38) = 2;
  *((_DWORD *)this + 22) = 0;
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 16) = 0;
  Mutable = (YonkersDevice *)CFStringCreateMutable(0, 0);
  *((void *)this + 7) = Mutable;
  *((void *)this + 8) = 0;
  *((void *)this + 6) = 0;
  *((unsigned char *)this + 32) = 0;
  Instance = YonkersDevice::getInstance(Mutable);
  *((void *)this + 3) = Instance;
  int v4 = *((_DWORD *)Instance + 8);
  int v5 = *(unsigned __int8 *)Instance;
  *((unsigned char *)this + 34) = v5;
  *((unsigned char *)this + 33) = v5 == 0;
  *((_DWORD *)this + 4) = 0x10000;
  *((_WORD *)this + 10) = 1;
  *((_DWORD *)this + 38) = v4;
  *((_DWORD *)this + 39) = 1;
  *((unsigned char *)this + 35) = 0;
}

void YonkersUpdateController::~YonkersUpdateController(YonkersUpdateController *this)
{
  uint64_t v2 = (const void *)*((void *)this + 5);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 5) = 0;
  }
  mach_port_t v3 = (const void *)*((void *)this + 7);
  if (v3)
  {
    CFRelease(v3);
    *((void *)this + 7) = 0;
  }
  int v4 = (void *)*((void *)this + 10);
  if (v4)
  {
    free(v4);
    *((void *)this + 10) = 0;
  }
  int v5 = (void *)*((void *)this + 14);
  if (v5)
  {
    free(v5);
    *((void *)this + 14) = 0;
  }
  CFDictionaryRef v6 = (void *)*((void *)this + 18);
  if (v6)
  {
    free(v6);
    *((void *)this + 18) = 0;
  }
}

uint64_t YonkersUpdateController::execCommand(YonkersUpdateController *this, CFStringRef theString, const __CFDictionary *a3, const __CFDictionary **a4)
{
  if (!theString) {
    goto LABEL_26;
  }
  CStringPtr = CFStringGetCStringPtr(theString, 0);
  YonkersUpdateController::YonkersLog(this, "%s: Entering execCommand: command = %s, persoLoop = %d \n", "execCommand", CStringPtr, *((_DWORD *)this + 39));
  if (*((unsigned char *)this + 33)) {
    goto LABEL_26;
  }
  if (a3)
  {
    YonkersUpdateController::YonkersLog(this, "%s: Input specified to the processing command\n", "execCommand");
    CFTypeRef v9 = (const void *)*((void *)this + 5);
    if (v9)
    {
      CFRelease(v9);
      *((void *)this + 5) = 0;
    }
    *((void *)this + 5) = CFRetain(a3);
  }
  if (CFStringCompare(theString, @"queryInfo", 0))
  {
    if (CFStringCompare(theString, @"performNextStage", 0))
    {
      CFTypeID v10 = CFStringGetCStringPtr(theString, 0);
      YonkersUpdateController::YonkersLog(this, "%s: Unsupported command: %s\n", "execCommand", v10);
      goto LABEL_26;
    }
    if (YonkersUpdateController::getFirmware(this, (unsigned __int8 **)this + 10, (unsigned int *)this + 22, (const __CFString *)*MEMORY[0x263F90448])|| YonkersUpdateController::getFirmware(this, (unsigned __int8 **)this + 12, (unsigned int *)this + 26, (const __CFString *)*MEMORY[0x263F90450])|| YonkersUpdateController::getTSSResponse(this))
    {
      goto LABEL_26;
    }
    uint64_t Stage = YonkersUpdateController::eventCmdPerformNextStage(this);
    if (!Stage)
    {
      if (!*((unsigned char *)this + 17) && !*((unsigned char *)this + 21) && !*((unsigned char *)this + 19) && !*((unsigned char *)this + 16)) {
        *((unsigned char *)this + 33) = 1;
      }
      YonkersUpdateController::YonkersLog(this, "%s: isProvisioned=%d \n", "execCommand", *(void *)(*((void *)this + 3) + 8));
      if (!a4) {
        goto LABEL_26;
      }
      goto LABEL_23;
    }
    uint64_t v12 = Stage;
    CFStringRef v13 = 0;
  }
  else
  {
    uint64_t Info = YonkersUpdateController::eventCmdQueryInfo(this);
    uint64_t v12 = Info;
    CFStringRef v13 = 0;
    if (a4 && !Info)
    {
LABEL_23:
      CFDictionaryRef v15 = (const __CFDictionary *)*((void *)this + 6);
      if (v15)
      {
        if (*a4)
        {
          BOOL v16 = (const void *)*MEMORY[0x263F90440];
          CFBooleanRef Value = CFDictionaryGetValue(v15, (const void *)*MEMORY[0x263F90440]);
          CFDictionarySetValue(*a4, v16, Value);
          YonkersUpdateController::YonkersLog(this, "%s: Add the results of the command processed to the output \n");
        }
        else
        {
          *a4 = (const __CFDictionary *)SavageSafeRetain(v15);
          YonkersUpdateController::YonkersLog(this, "%s: Send out the results in fOutput of the command processed\n");
        }
        CFStringRef v13 = CFCopyDescription(*a4);
        CFStringRef v18 = CFStringGetCStringPtr(v13, 0);
        if (v18) {
          CFTypeID v19 = v18;
        }
        else {
          CFTypeID v19 = "No C string description available.";
        }
        YonkersUpdateController::YonkersLog(this, "%s [output]: %s %s \n", "execCommand", "output dictionary of execCommand", v19);
        goto LABEL_32;
      }
LABEL_26:
      CFStringRef v13 = 0;
LABEL_32:
      uint64_t v12 = 0;
    }
  }
  CFBooleanRef v20 = (const void *)*((void *)this + 6);
  if (v20)
  {
    CFRelease(v20);
    *((void *)this + 6) = 0;
  }
  if (v13) {
    CFRelease(v13);
  }
  CFBooleanRef v21 = CFStringGetCStringPtr(theString, 0);
  YonkersUpdateController::YonkersLog(this, "%s: Exiting execCommand: command = %s, uint64_t result = 0x%X, persoLoop = %d \n", "execCommand", v21, v12, *((_DWORD *)this + 39));
  return v12;
}

uint64_t YonkersUpdateController::eventCmdQueryInfo(YonkersUpdateController *this)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  mach_port_t v3 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
  int v4 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *((void *)this + 6) = CFDictionaryCreateMutable(v2, 0, v3, v4);
  if (*((unsigned char *)this + 17) == 1)
  {
    YonkersUpdateController::YonkersLog(this, "%s: Begin Fusing \n", "eventCmdQueryInfo");
    SavageCFDictionarySetBoolean(Mutable, (const void *)*MEMORY[0x263F904F0], 1);
    SavageCFDictionarySetBoolean(Mutable, (const void *)*MEMORY[0x263F904E8], 1);
    SavageCFDictionarySetBoolean(Mutable, (const void *)*MEMORY[0x263F904D0], 1);
    SavageCFDictionarySetBoolean(Mutable, (const void *)*MEMORY[0x263F904C0], 1);
    SavageCFDictionarySetBoolean(Mutable, (const void *)*MEMORY[0x263F904C8], 1);
    uint64_t DeviceInfoDict = YonkersDevice::PreFusing(*((YonkersDevice **)this + 3), *((_DWORD *)this + 38));
    if (DeviceInfoDict) {
      goto LABEL_28;
    }
    YonkersUpdateController::YonkersLog(this, "%s: Finished pre-fusing \n");
  }
  else if (*((unsigned char *)this + 19) == 1)
  {
    YonkersUpdateController::YonkersLog(this, "%s: Begin Certification \n", "eventCmdQueryInfo");
    SavageCFDictionarySetBoolean(Mutable, (const void *)*MEMORY[0x263F904C0], 1);
    SavageCFDictionarySetBoolean(Mutable, (const void *)*MEMORY[0x263F904C8], 1);
    SavageCFDictionarySetBoolean(Mutable, (const void *)*MEMORY[0x263F904D0], 1);
    uint64_t DeviceInfoDict = YonkersDevice::PreFusing(*((YonkersDevice **)this + 3), *((_DWORD *)this + 38));
    if (DeviceInfoDict) {
      goto LABEL_28;
    }
    YonkersUpdateController::YonkersLog(this, "%s: Finished pre-certification \n");
  }
  else if (*((unsigned char *)this + 21) == 1)
  {
    YonkersUpdateController::YonkersLog(this, "%s: Begin Personalization \n", "eventCmdQueryInfo");
    SavageCFDictionarySetBoolean(Mutable, (const void *)*MEMORY[0x263F904C8], 1);
    SavageCFDictionarySetBoolean(Mutable, (const void *)*MEMORY[0x263F90480], 1);
    SavageCFDictionarySetBoolean(Mutable, (const void *)*MEMORY[0x263F904C0], 1);
    YonkersUpdateController::YonkersLog(this, "%s: Finished pre-personalizing \n");
  }
  uint64_t DeviceInfoDict = YonkersDevice::CreateDeviceInfoDict(*((YonkersDevice **)this + 3), Mutable);
  if (DeviceInfoDict)
  {
LABEL_28:
    uint64_t YonkersMeasurementTags = DeviceInfoDict;
    if (!Mutable) {
      return YonkersMeasurementTags;
    }
    goto LABEL_26;
  }
  uint64_t v7 = *((void *)this + 3);
  if (*((unsigned char *)this + 35) == 1
    && !*(void *)(v7 + 8)
    && !*((unsigned char *)this + 17)
    && !*((unsigned char *)this + 19)
    && *((unsigned char *)this + 21) == 1)
  {
    int v8 = *((_DWORD *)this + 39);
    if (v8 == 4 || v8 == 2)
    {
      BOOL v9 = *(unsigned char *)(v7 + 24) == 0;
      *(unsigned char *)(v7 + 24) = *(unsigned char *)(v7 + 24) == 0;
      if (v9) {
        int v10 = 59905;
      }
      else {
        int v10 = 6657;
      }
      SavageCFDictionarySetInteger32(Mutable, (const void *)*MEMORY[0x263F904A0], v10);
      int v8 = *((_DWORD *)this + 39);
      uint64_t v7 = *((void *)this + 3);
    }
    if (v8 >= 3) {
      *(unsigned char *)(v7 + 25) = *(unsigned char *)(v7 + 25) == 0;
    }
  }
  SavageCFDictionarySetBoolean(Mutable, @"YonkersIsYmgt", *(unsigned __int8 *)(v7 + 24));
  SavageCFDictionarySetBoolean(Mutable, (const void *)*MEMORY[0x263F904B0], *(unsigned __int8 *)(*((void *)this + 3) + 25));
  uint64_t YonkersMeasurementTags = GetYonkersMeasurementTags(Mutable, (CFTypeRef *)this + 8, (CFTypeRef *)this + 9);
  if (!YonkersMeasurementTags) {
    CFDictionarySetValue(*((CFMutableDictionaryRef *)this + 6), (const void *)*MEMORY[0x263F90440], Mutable);
  }
  if (Mutable) {
LABEL_26:
  }
    CFRelease(Mutable);
  return YonkersMeasurementTags;
}

uint64_t YonkersUpdateController::getFirmware(YonkersUpdateController *this, unsigned __int8 **a2, unsigned int *a3, const __CFString *a4)
{
  CFDictionaryRef v5 = (const __CFDictionary *)*((void *)this + 5);
  if (!v5) {
    return 2;
  }
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v5, @"FirmwareData");
  if (!Value) {
    return 10;
  }
  CFDictionaryRef v10 = Value;
  CFTypeID v11 = CFGetTypeID(Value);
  if (v11 != CFDictionaryGetTypeID()) {
    return 10;
  }
  CFDataRef v12 = (const __CFData *)CFDictionaryGetValue(v10, a4);
  if (!v12) {
    return 10;
  }
  CFDataRef v13 = v12;
  CFTypeID v14 = CFGetTypeID(v12);
  if (v14 != CFDataGetTypeID()) {
    return 10;
  }
  unsigned int Length = CFDataGetLength(v13);
  *a3 = Length;
  if (!*((_DWORD *)this + 22)) {
    return 4;
  }
  BOOL v16 = (unsigned __int8 *)calloc(Length, 1uLL);
  *a2 = v16;
  if (!*((void *)this + 10)) {
    return 3;
  }
  v18.length = *a3;
  v18.location = 0;
  CFDataGetBytes(v13, v18, v16);
  return 0;
}

uint64_t YonkersUpdateController::getTSSResponse(YonkersUpdateController *this)
{
  CFDictionaryRef v2 = (const __CFDictionary *)*((void *)this + 5);
  if (!v2) {
    return 2;
  }
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x263F904D8]);
  if (!Value) {
    return 10;
  }
  CFDataRef v4 = Value;
  CFTypeID v5 = CFGetTypeID(Value);
  if (v5 != CFDataGetTypeID()) {
    return 10;
  }
  BytePtr = (unsigned __int8 *)CFDataGetBytePtr(v4);
  int Length = CFDataGetLength(v4);
  YonkersUpdateController::getSignedCertificate(this, BytePtr);
  if (!*((void *)this + 14)) {
    return 3;
  }
  YonkersUpdateController::YonkersLog(this, "%s - %d bytes\n", "getTSSResponse", Length);
  return 0;
}

uint64_t YonkersUpdateController::eventCmdPerformNextStage(YonkersUpdateController *this)
{
  if (*((unsigned char *)this + 17) != 1)
  {
    if (*((unsigned char *)this + 19) != 1)
    {
      if (*((unsigned char *)this + 21) == 1)
      {
        YonkersUpdateController::formatAndStitchFiles(this);
        YonkersUpdateController::writeFilesToFileSystem(this);
        int v8 = *((_DWORD *)this + 39) - 1;
        *((_DWORD *)this + 39) = v8;
        if (!v8)
        {
          *((unsigned char *)this + 21) = 0;
          YonkersUpdateController::YonkersLog(this, "%s: Finished Personalization \n", "eventCmdPerformNextStage");
        }
      }
      return 0;
    }
    YonkersUpdateController::YonkersLog(this, "%s: Begin reading info needed for certification \n", "eventCmdPerformNextStage");
    YonkersUpdateController::formatAndStitchFiles(this);
    YonkersDevice::Fusing(*((YonkersDevice **)this + 3), *((_DWORD *)this + 38), *((const unsigned __int8 **)this + 18), *((_DWORD *)this + 35));
    uint64_t v5 = *(void *)(*((void *)this + 3) + 16);
    int v6 = -536870167;
    if (v5) {
      int v6 = 0;
    }
    YonkersUpdateController::YonkersLog(this, "%s: Extracting certification data is done with uint64_t result = 0x%02X (tryAgain = %d) \n", "eventCmdPerformNextStage", v6, *((unsigned __int8 *)this + 20));
    int v7 = *((unsigned __int8 *)this + 20);
    if (v5)
    {
      *((unsigned char *)this + 19) = 0;
      if (!v7) {
        return 0;
      }
    }
    else if (!*((unsigned char *)this + 20))
    {
      uint64_t result = 3758097129;
      *((unsigned char *)this + 19) = 0;
      return result;
    }
    uint64_t result = 0;
    *((unsigned char *)this + 20) = 0;
    return result;
  }
  YonkersUpdateController::YonkersLog(this, "%s: Begin actual Fusing \n", "eventCmdPerformNextStage");
  YonkersUpdateController::formatAndStitchFiles(this);
  YonkersDevice::Fusing(*((YonkersDevice **)this + 3), *((_DWORD *)this + 38), *((const unsigned __int8 **)this + 18), *((_DWORD *)this + 35));
  uint64_t v2 = *(void *)(*((void *)this + 3) + 8);
  int v3 = -536870167;
  if (v2) {
    int v3 = 0;
  }
  YonkersUpdateController::YonkersLog(this, "%s: Finished fusing with uint64_t result = 0x%02X (tryAgain = %d) \n", "eventCmdPerformNextStage", v3, *((unsigned __int8 *)this + 18));
  int v4 = *((unsigned __int8 *)this + 18);
  if (v2)
  {
    *((unsigned char *)this + 17) = 0;
    if (!v4) {
      return 0;
    }
    goto LABEL_18;
  }
  if (*((unsigned char *)this + 18))
  {
LABEL_18:
    uint64_t result = 0;
    *((unsigned char *)this + 18) = 0;
    return result;
  }
  uint64_t result = 3758097129;
  *((unsigned char *)this + 17) = 0;
  return result;
}

void YonkersUpdateController::formatAndStitchFiles(YonkersUpdateController *this)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v1 = *((_DWORD *)this + 22);
  int v2 = *((_DWORD *)this + 30);
  HIBYTE(v23) = 0;
  if (*((void *)this + 10) && *((void *)this + 14))
  {
    int v4 = 3 * v2;
    if (*((unsigned char *)this + 17) == 1 || *((unsigned char *)this + 19) == 1) {
      int v5 = 3 * v1 + 6;
    }
    else {
      int v5 = 3 * v1;
    }
    size_t v6 = (v4 + v5 + 80);
    *((_DWORD *)this + 35) = v6;
    int v7 = (char *)calloc(v6, 1uLL);
    *((void *)this + 18) = v7;
    if (v7)
    {
      *(_DWORD *)int v7 = 0;
      *((_DWORD *)v7 + 1) = v4 + 48;
      *((_DWORD *)v7 + 2) = v5;
      *(void *)(v7 + 20) = 0;
      *(void *)(v7 + 12) = 0;
      *((_DWORD *)v7 + 7) = 0;
      YonkersUpdateController::YonkersLog(this, "%s -  theCompletePatchFileLen=%d, signedCertificateLen=%d, firmwareDataLen=%d \n", "formatAndStitchFiles", *((_DWORD *)this + 35), *((_DWORD *)this + 30), *((_DWORD *)this + 22));
      uint64_t v8 = 0;
      BOOL v9 = (char *)&v23 + 3;
      int v10 = 4608;
      while (1)
      {
        unint64_t v11 = *((unsigned int *)this + 35);
        if (v8 + 35 > v11) {
          break;
        }
        *(unsigned char *)(*((void *)this + 18) + v8 + 32) = BYTE1(v10);
        *(unsigned char *)(*((void *)this + 18) + v8 + 33) = v10;
        char v12 = *v9--;
        *(unsigned char *)(*((void *)this + 18) + v8 + 34) = v12;
        ++v10;
        v8 += 3;
        if (v8 == 48)
        {
          LODWORD(v11) = *((_DWORD *)this + 35);
          unsigned int v13 = 80;
          goto LABEL_13;
        }
      }
      unsigned int v13 = v8 + 32;
LABEL_13:
      unsigned int v14 = v13 + 3;
      if (v13 + 3 <= v11)
      {
        if (*((_DWORD *)this + 30))
        {
          unint64_t v15 = 0;
          uint64_t v16 = v13;
          int v17 = 0x2000;
          while (1)
          {
            unsigned int v13 = v16 + 3;
            if (v16 + 3 > (unint64_t)*((unsigned int *)this + 35)) {
              break;
            }
            *(unsigned char *)(*((void *)this + 18) + v16) = BYTE1(v17);
            *(unsigned char *)(*((void *)this + 18) + v16 + 1) = v17;
            *(unsigned char *)(*((void *)this + 18) + v16 + 2) = *(unsigned char *)(*((void *)this + 14) + v15++);
            ++v17;
            v16 += 3;
            if (v15 >= *((unsigned int *)this + 30))
            {
              LODWORD(v11) = *((_DWORD *)this + 35);
              goto LABEL_20;
            }
          }
          LODWORD(v11) = *((_DWORD *)this + 35);
          unsigned int v13 = v16;
LABEL_20:
          unsigned int v14 = v13 + 3;
        }
        if (v14 <= v11)
        {
          if (*((_DWORD *)this + 22))
          {
            uint64_t v18 = 0;
            unint64_t v19 = 0;
            int v20 = 9568;
            do
            {
              uint64_t v21 = v13 + v18;
              if (v21 + 3 > (unint64_t)*((unsigned int *)this + 35)) {
                break;
              }
              *(unsigned char *)(*((void *)this + 18) + v13 + v18) = BYTE1(v20);
              *(unsigned char *)(*((void *)this + 18) + v21 + 1) = v20;
              *(unsigned char *)(*((void *)this + 18) + v21 + 2) = *(unsigned char *)(*((void *)this + 10) + v19++);
              ++v20;
              v18 += 3;
            }
            while (v19 < *((unsigned int *)this + 22));
            v13 += v18;
          }
          if (*((unsigned char *)this + 17) == 1 || *((unsigned char *)this + 19) == 1)
          {
            uint64_t v22 = v13 + 3;
            if (v22 <= *((_DWORD *)this + 35))
            {
              *(unsigned char *)(*((void *)this + 18) + v13) = 17;
              *(unsigned char *)(*((void *)this + 18) + v13 + 1) = 3;
              *(unsigned char *)(*((void *)this + 18) + v13 + 2) = 1;
              if (v13 + 6 <= *((_DWORD *)this + 35))
              {
                *(unsigned char *)(*((void *)this + 18) + v22) = 17;
                *(unsigned char *)(*((void *)this + 18) + v13 + 4) = 19;
                *(unsigned char *)(*((void *)this + 18) + v13 + 5) = 1;
              }
            }
          }
        }
      }
    }
  }
}

void YonkersUpdateController::writeFilesToFileSystem(YonkersUpdateController *this)
{
  YonkersUpdateController::YonkersLog(this, "Yonkers: YonkersUpdateController::writeFilesToFileSystem: persoLoop=%d, isProd=%d, isYmgt=%d\n", *((_DWORD *)this + 39), *(unsigned __int8 *)(*((void *)this + 3) + 25), *(unsigned __int8 *)(*((void *)this + 3) + 24));
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  int v3 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  CFArrayAppendValue(Mutable, *((const void **)this + 7));
  int v5 = CFArrayCreateMutable(v2, 0, v3);
  CFArrayAppendValue(v5, *((const void **)this + 7));
  size_t v6 = CFArrayCreateMutable(v2, 0, v3);
  CFArrayAppendValue(v6, *((const void **)this + 7));
  CFArrayAppendValue(v6, @"/YonkersPatchBinaryPlusHeader.FW");
  if (*((unsigned char *)this + 17) == 1)
  {
    CFArrayAppendValue(Mutable, @"/YonkersPatchFusing.DAT");
    int v7 = @"/YonkersPatchFusing.DER";
LABEL_8:
    CFArrayAppendValue(v5, v7);
    goto LABEL_9;
  }
  if (*((unsigned char *)this + 19) == 1)
  {
    CFArrayAppendValue(Mutable, @"/YonkersPatchCertification.DAT");
    int v7 = @"/YonkersPatchCertification.DER";
    goto LABEL_8;
  }
  if (*((unsigned char *)this + 21) != 1) {
    goto LABEL_9;
  }
  uint64_t v8 = *((void *)this + 3);
  if (*(void *)(v8 + 8))
  {
    CFArrayAppendValue(Mutable, @"/YonkersPatch.DAT");
    int v7 = @"/YonkersPatch.DER";
    goto LABEL_8;
  }
  if (*(unsigned char *)(v8 + 24)) {
    unint64_t v15 = "Ymgt";
  }
  else {
    unint64_t v15 = "Ngsk";
  }
  if (*(unsigned char *)(v8 + 25)) {
    uint64_t v16 = "Prod";
  }
  else {
    uint64_t v16 = "Dev";
  }
  CFStringRef v17 = CFStringCreateWithFormat(v2, 0, @"/YonkersPatch%s%s.DAT", v15, v16);
  CFArrayAppendValue(Mutable, v17);
  if (v17) {
    CFRelease(v17);
  }
  uint64_t v18 = *((void *)this + 3);
  if (*(unsigned char *)(v18 + 24)) {
    unint64_t v19 = "Ymgt";
  }
  else {
    unint64_t v19 = "Ngsk";
  }
  if (*(unsigned char *)(v18 + 25)) {
    int v20 = "Prod";
  }
  else {
    int v20 = "Dev";
  }
  CFStringRef v21 = CFStringCreateWithFormat(v2, 0, @"/YonkersPatch%s%s.DER", v19, v20);
  CFArrayAppendValue(v5, v21);
  if (v21) {
    CFRelease(v21);
  }
LABEL_9:
  CFStringRef v9 = CFStringCreateByCombiningStrings(v2, Mutable, &stru_26E2BCFF0);
  CFStringRef v10 = CFStringCreateByCombiningStrings(v2, v5, &stru_26E2BCFF0);
  CFStringRef v11 = CFStringCreateByCombiningStrings(v2, v6, &stru_26E2BCFF0);
  CStringPtr = CFStringGetCStringPtr(v11, 0);
  YonkersUpdateController::YonkersLog(this, "%s: %s (%d)\n", "writeFilesToFileSystem", CStringPtr, *((_DWORD *)this + 22));
  YonkersUpdateController::writeDataToFileURL(this, *((unsigned __int8 **)this + 10), *((unsigned int *)this + 22), v11);
  YonkersUpdateController::writeFWFilesToFileSystem(this);
  unsigned int v13 = CFStringGetCStringPtr(v10, 0);
  YonkersUpdateController::YonkersLog(this, "%s: %s (%d)\n", "writeFilesToFileSystem", v13, *((_DWORD *)this + 30));
  YonkersUpdateController::writeDataToFileURL(this, *((unsigned __int8 **)this + 14), *((unsigned int *)this + 30), v10);
  unsigned int v14 = CFStringGetCStringPtr(v9, 0);
  YonkersUpdateController::YonkersLog(this, "%s: %s (%d)\n", "writeFilesToFileSystem", v14, *((_DWORD *)this + 35));
  YonkersUpdateController::writeDataToFileURL(this, *((unsigned __int8 **)this + 18), *((unsigned int *)this + 35), v9);
  if (v9) {
    CFRelease(v9);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v5) {
    CFRelease(v5);
  }
  if (v6)
  {
    CFRelease(v6);
  }
}

void YonkersUpdateController::getSignedCertificate(YonkersUpdateController *this, unsigned __int8 *a2)
{
  uint64_t v2 = MEMORY[0x270FA5388](this, a2);
  unsigned int v4 = v3;
  size_t v6 = v5;
  uint64_t v7 = v2;
  uint64_t v95 = *MEMORY[0x263EF8340];
  *(void *)v93 = 0;
  uint64_t v8 = (unsigned __int8 *)calloc(0x4AuLL, 1uLL);
  __dst = (unsigned __int8 *)calloc(0x4AuLL, 1uLL);
  YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "Yonkers: TSS Response:--------------Total int Length = %d \n", v4);
  if (v4)
  {
    LODWORD(v9) = 0;
    do
    {
      bzero(v94, 0x1000uLL);
      int v10 = 0;
      unint64_t v9 = v9;
      do
      {
        int v11 = snprintf(&v94[v10], 5uLL, " %02X ", v6[v9++]);
        if (v9 >= v4) {
          break;
        }
        v10 += v11;
      }
      while ((v10 + 5) < 0x1000);
      YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "Yonkers: %s \n", v94);
    }
    while (v9 < v4);
  }
  int v12 = v6[1];
  if ((char)v6[1] < 0)
  {
    unsigned int v14 = v12 & 0x7F;
    if (v14 > 2) {
      YonkersUpdateController::getSignedCertificate();
    }
    if ((v12 & 0x7F) != 0)
    {
      int v12 = v6[2];
      if (v14 != 1) {
        int v12 = v6[3] | (v12 << 8);
      }
    }
    else
    {
      int v12 = 0;
    }
    unsigned int v13 = v14 + 11;
  }
  else
  {
    unsigned int v13 = 11;
  }
  if ((char)v6[v13 + 1] < 0)
  {
    uint64_t v16 = v6[v13 + 1] & 0x7F;
    if (v16 > 2) {
      YonkersUpdateController::getSignedCertificate();
    }
    if ((v6[v13 + 1] & 0x7F) != 0)
    {
      uint64_t v17 = 0;
      int v18 = 0;
      unint64_t v19 = &v6[v13 + 2];
      do
      {
        int v20 = *v19++;
        int v18 = (v18 << v17) | v20;
        v17 += 8;
      }
      while (8 * v16 != v17);
    }
    else
    {
      int v18 = 0;
    }
    int v15 = v16 + v18;
  }
  else
  {
    int v15 = v6[v13 + 1];
  }
  int v21 = v15 + 2;
  uint64_t v22 = v6[v15 + 3 + v13];
  size_t v23 = v22 + 2;
  unsigned int v92 = v22 + 2;
  size_t __n = v15 + 2 + v13;
  int v24 = v22 + 2 + v15 + 2 + v13;
  int v25 = v6[v24 + 1];
  if ((v25 & 0x80) != 0)
  {
    uint64_t v28 = v25 & 0x7F;
    if ((v25 & 0x7Fu) > 2) {
      YonkersUpdateController::getSignedCertificate();
    }
    if ((v25 & 0x7F) != 0)
    {
      uint64_t v29 = 0;
      int v25 = 0;
      int v30 = v21 + v13 + v22 + 4;
      do
      {
        int v25 = (v25 << v29) | v6[v30++];
        v29 += 8;
      }
      while (8 * v28 != v29);
    }
    else
    {
      int v25 = 0;
    }
    int v27 = v28 + 2;
    int v26 = v24 + 9 + v28 + 2;
  }
  else
  {
    int v26 = v24 + 11;
    int v27 = 2;
  }
  if ((char)v6[v27 + v24 + 1] < 0)
  {
    uint64_t v33 = v6[v27 + v24 + 1] & 0x7F;
    if (v33 > 2) {
      YonkersUpdateController::getSignedCertificate();
    }
    if ((v6[v27 + v24 + 1] & 0x7F) != 0)
    {
      uint64_t v34 = 0;
      int v31 = 0;
      int v35 = v21 + v13 + v27 + v22 + 4;
      do
      {
        int v31 = (v31 << v34) | v6[v35++];
        v34 += 8;
      }
      while (8 * v33 != v34);
    }
    else
    {
      int v31 = 0;
    }
    int v32 = v33 + 2;
  }
  else
  {
    int v31 = v6[v27 + v24 + 1];
    int v32 = 2;
  }
  int v36 = v32 + v26;
  int v84 = v12;
  int v81 = v21;
  unsigned int v82 = v13;
  int v80 = v22;
  uint64_t v86 = (v27 + v24 + 1);
  uint64_t v87 = (v24 + 1);
  int v85 = v25;
  int v79 = v27;
  if ((char)v6[v32 + v26 + 1] < 0)
  {
    uint64_t v38 = v6[v32 + v26 + 1] & 0x7F;
    if (v38 > 2) {
      YonkersUpdateController::getSignedCertificate();
    }
    if ((v6[v32 + v26 + 1] & 0x7F) != 0)
    {
      uint64_t v39 = 0;
      int v40 = 0;
      unsigned int v41 = v26 + v32 + 2;
      do
      {
        int v40 = (v40 << v39) | v6[v41++];
        v39 += 8;
      }
      while (8 * v38 != v39);
    }
    else
    {
      int v40 = 0;
    }
    int v37 = v38 + v40;
  }
  else
  {
    int v37 = v6[v32 + v26 + 1];
  }
  int v42 = v37 + 2 + v36;
  uint64_t v43 = v6[v42 + 1];
  size_t v44 = v43 + 2;
  unsigned int v91 = v43 + 2;
  int v88 = v42;
  int v83 = v24;
  YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "Yonkers: fwSigOffset = 0x%02X, fwSigEncapLen = 0x%02X, lfManifestStartOffset = 0x%02X, im4cSeqStartOffset = 0x%02X, im4cStartOffset = 0x%02X, lfSigOffset = 0x%02X, lfSigEncapLen = 0x%02X \n", __n, v22 + 2, v24, v27 + v24, v36, v42, v43 + 2);
  memcpy(v8, &v6[__n], v23);
  YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "FirmwareSignature (Pre-validation):--------------offset = %d (%d)\n", __n, v23);
  bzero(v94, 0x1000uLL);
  size_t v45 = 0;
  int v46 = 0;
  do
  {
    int v47 = snprintf(&v94[v46], 5uLL, " %02X ", v8[v45++]);
    if (v45 >= v23) {
      break;
    }
    v46 += v47;
  }
  while ((v46 + 5) < 0x1000);
  YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "%s \n", v94);
  YonkersUpdateController::validateSignatureLen((YonkersUpdateController *)v7, v8, &v92, &v93[1]);
  size_t v48 = v92;
  YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "FirmwareSignature (Post-validation):--------------offset = %d (%d)\n", __n, v92);
  bzero(v94, 0x1000uLL);
  if (v48)
  {
    size_t v49 = 0;
    int v50 = 0;
    do
    {
      int v51 = snprintf(&v94[v50], 5uLL, " %02X ", v8[v49++]);
      if (v49 >= v48) {
        break;
      }
      v50 += v51;
    }
    while ((v50 + 5) < 0x1000);
  }
  YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "%s \n", v94);
  memcpy(__dst, &v6[v88], v44);
  YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "LeafSignature (Pre-validation):--------------offset = %d (%d)\n", v88, v44);
  bzero(v94, 0x1000uLL);
  size_t v52 = 0;
  int v53 = 0;
  do
  {
    int v54 = snprintf(&v94[v53], 5uLL, " %02X ", __dst[v52++]);
    if (v52 >= v44) {
      break;
    }
    v53 += v54;
  }
  while ((v53 + 5) < 0x1000);
  YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "%s \n", v94);
  YonkersUpdateController::validateSignatureLen((YonkersUpdateController *)v7, __dst, &v91, v93);
  size_t v55 = v91;
  YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "LeafSignature (Post-validation):--------------offset = %d (%d)\n", v88, v91);
  bzero(v94, 0x1000uLL);
  if (v55)
  {
    size_t v56 = 0;
    int v57 = 0;
    do
    {
      int v58 = snprintf(&v94[v57], 5uLL, " %02X ", __dst[v56++]);
      if (v56 >= v55) {
        break;
      }
      v57 += v58;
    }
    while ((v57 + 5) < 0x1000);
  }
  YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "%s \n", v94);
  unsigned int v59 = v93[0];
  unsigned int v60 = v93[0] + v31;
  int v61 = (char)v6[v86];
  if (v61 < 0)
  {
    uint64_t v62 = v87;
    if ((v61 & 0x7Fu) > 2) {
      YonkersUpdateController::getSignedCertificate();
    }
    if ((v6[v86] & 0x7F) != 0)
    {
      unsigned int v63 = v81 + v82 + v79 + v80 + 4;
      uint64_t v64 = 8 * (v6[v86] & 0x7F);
      do
      {
        v64 -= 8;
        v6[v63++] = v60 >> v64;
      }
      while (v64);
    }
  }
  else
  {
    v6[v86] = v60;
    uint64_t v62 = v87;
  }
  unsigned int v65 = v59 + v85;
  int v66 = (char)v6[v62];
  if (v66 < 0)
  {
    if ((v66 & 0x7Fu) > 2) {
      YonkersUpdateController::getSignedCertificate();
    }
    if ((v6[v62] & 0x7F) != 0)
    {
      unsigned int v67 = v81 + v82 + v80 + 4;
      uint64_t v68 = 8 * (v6[v62] & 0x7F);
      do
      {
        v68 -= 8;
        v6[v67++] = v65 >> v68;
      }
      while (v68);
    }
  }
  else
  {
    v6[v62] = v65;
  }
  unsigned int v69 = v59 + v84 + v93[1];
  if ((char)v6[1] < 0)
  {
    uint64_t v71 = v6[1] & 0x7F;
    if (v71 > 2) {
      YonkersUpdateController::getSignedCertificate();
    }
    if ((v6[1] & 0x7F) != 0)
    {
      int32x2_t v72 = vmovn_s64((int64x2_t)vcgeq_u64((uint64x2_t)vdupq_n_s64(v71 - 1), (uint64x2_t)xmmword_22F4E6020));
      if (v72.i8[0]) {
        uint64_t v6[2] = v69 >> (8 * v71 - 8);
      }
      if (v72.i8[4]) {
        v6[3] = v69 >> (8 * v71 - 16);
      }
    }
    unsigned int v70 = v69 + v71 + 2;
  }
  else
  {
    v6[1] = v69;
    unsigned int v70 = v69 + 2;
  }
  *(_DWORD *)(v7 + 120) = v70;
  YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "Yonkers: signedCertLen = 0x%02X, totalManifestLen = 0x%02X, lfManifestLen = 0x%02X, im4cSeqLen = 0x%02X \n", v70, v69, v65, v60);
  v73 = calloc(*(unsigned int *)(v7 + 120), 1uLL);
  *(void *)(v7 + 112) = v73;
  if (v73)
  {
    memcpy(v73, v6, __n);
    memcpy((void *)(*(void *)(v7 + 112) + __n), v8, v48);
    memcpy((void *)(*(void *)(v7 + 112) + __n + v48), &v6[v83], (v88 - v83));
    memcpy((void *)(*(void *)(v7 + 112) + __n + v48 + (v88 - v83)), __dst, v55);
    YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "Yonkers: Signed Certificate:-------------- int Length = %d \n", *(_DWORD *)(v7 + 120));
    unint64_t v74 = *(unsigned int *)(v7 + 120);
    if (v74)
    {
      unint64_t v75 = 0;
      do
      {
        bzero(v94, 0x1000uLL);
        if (v75 < v74)
        {
          uint64_t v76 = 0;
          int v77 = 0;
          do
          {
            int v78 = snprintf(&v94[v77], 5uLL, " %02X ", *(unsigned __int8 *)(*(void *)(v7 + 112) + v75 + v76++));
            if (v76 + v75 >= *(unsigned int *)(v7 + 120)) {
              break;
            }
            v77 += v78;
          }
          while ((v77 + 5) < 0x1000);
          unint64_t v75 = (v75 + v76);
        }
        YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "Yonkers: %s \n", v94);
        unint64_t v74 = *(unsigned int *)(v7 + 120);
      }
      while (v75 < v74);
    }
  }
}

void YonkersUpdateController::validateSignatureLen(YonkersUpdateController *this, unsigned __int8 *a2, unsigned int *a3, unsigned int *a4)
{
  unsigned __int8 v8 = a2[1];
  unsigned __int8 v9 = a2[3];
  uint64_t v10 = a2[5];
  YonkersUpdateController::YonkersLog(this, "\n %s -- r length = %d \n", "validateSignatureLen", a2[5]);
  if ((v10 - 34) <= 0xDEu) {
    YonkersUpdateController::validateSignatureLen();
  }
  if (v10 <= 0x1F)
  {
    size_t v11 = 32 - v10;
    YonkersUpdateController::YonkersLog(this, "\n %s -- Padding the r value with %d zero bytes \n", "validateSignatureLen", v11);
    memmove(&a2[v11 + 6], a2 + 6, *a3 - 6);
    bzero(a2 + 6, v11);
    a2[5] = 32;
    v9 += v11;
    v8 += v11;
    *a3 += v11;
  }
  unsigned __int8 v12 = a2[5] + 7;
  unsigned int v13 = &a2[v12];
  uint64_t v14 = *v13;
  YonkersUpdateController::YonkersLog(this, "\n %s -- s length = %d \n", "validateSignatureLen", *v13);
  if ((v14 - 34) <= 0xDEu) {
    YonkersUpdateController::validateSignatureLen();
  }
  if (v14 <= 0x1F)
  {
    size_t v15 = 32 - v14;
    YonkersUpdateController::YonkersLog(this, "\n %s -- Padding the s value with %d zero bytes \n", "validateSignatureLen", v15);
    memmove(&v13[v15 + 1], v13 + 1, *a3 + ~v12);
    bzero(&a2[v12 + 1], v15);
    a2[v12] = 32;
    v9 += v15;
    v8 += v15;
    *a3 += v15;
  }
  *a4 = v8 - a2[1];
  a2[3] = v9;
  a2[1] = v8;
}

void YonkersUpdateController::writeDataToFileURL(YonkersUpdateController *this, unsigned __int8 *a2, CFIndex length, const __CFString *a4)
{
  CFDataRef v6 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, length);
  CFURLRef v7 = CFURLCreateWithFileSystemPath(0, a4, kCFURLPOSIXPathStyle, 0);
  if (MEMORY[0x230FB83A0]()) {
    YonkersUpdateController::YonkersLog(this, "%s: AMSupportMakeDirectory failed with fileNameFS \n", "writeDataToFileURL");
  }
  if (AMSupportWriteDataToFileURL()) {
    YonkersUpdateController::YonkersLog(this, "%s: AMSupportWriteDataToFileURL failed with fileNameFS \n", "writeDataToFileURL");
  }
  AMSupportPlatformFileURLExists();
  YonkersUpdateController::YonkersLog(this, "%s: File does not exist\n", "writeDataToFileURL");
  if (v6) {
    CFRelease(v6);
  }
  if (v7) {
    CFRelease(v7);
  }
}

void YonkersUpdateController::writeFWFilesToFileSystem(YonkersUpdateController *this)
{
  unsigned int v2 = 0;
  uint64_t v3 = 104;
  if (*(unsigned char *)(*((void *)this + 3) + 24)) {
    uint64_t v4 = 104;
  }
  else {
    uint64_t v4 = 88;
  }
  if (*(unsigned char *)(*((void *)this + 3) + 24)) {
    uint64_t v3 = 88;
  }
  uint64_t v5 = 96;
  if (*(unsigned char *)(*((void *)this + 3) + 24)) {
    uint64_t v6 = 96;
  }
  else {
    uint64_t v6 = 80;
  }
  if (*(unsigned char *)(*((void *)this + 3) + 24)) {
    uint64_t v5 = 80;
  }
  unint64_t v19 = *(unsigned __int8 **)((char *)this + v6);
  int v20 = *(unsigned __int8 **)((char *)this + v5);
  CFIndex v7 = *(unsigned int *)((char *)this + v3);
  CFIndex v8 = *(unsigned int *)((char *)this + v4);
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  do
  {
    Mutable = CFArrayCreateMutable(v9, 0, MEMORY[0x263EFFF70]);
    if (*(unsigned char *)(*((void *)this + 3) + 25)) {
      uint64_t v11 = v2 + 1;
    }
    else {
      uint64_t v11 = v2;
    }
    CFStringRef v12 = CFStringCreateWithFormat(v9, 0, @"Yonkers,SysTopPatch%X", v11);
    CFArrayAppendValue(Mutable, *((const void **)this + 7));
    CFArrayAppendValue(Mutable, v12);
    CFStringRef v13 = CFStringCreateByCombiningStrings(v9, Mutable, &stru_26E2BCFF0);
    CStringPtr = CFStringGetCStringPtr(v13, 0);
    if (v2 > 7)
    {
      YonkersUpdateController::YonkersLog(this, "%s: %s (%d)\n", "writeFWFilesToFileSystem", CStringPtr, v7);
      size_t v15 = this;
      uint64_t v16 = v20;
      CFIndex v17 = v7;
    }
    else
    {
      YonkersUpdateController::YonkersLog(this, "%s: %s (%d)\n", "writeFWFilesToFileSystem", CStringPtr, v8);
      size_t v15 = this;
      uint64_t v16 = v19;
      CFIndex v17 = v8;
    }
    YonkersUpdateController::writeDataToFileURL(v15, v16, v17, v13);
    if (v12) {
      CFRelease(v12);
    }
    if (v13) {
      CFRelease(v13);
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    BOOL v18 = v2 >= 0xE;
    v2 += 2;
  }
  while (!v18);
}

SavageDevice *SavageDevice::getInstance(SavageDevice *this)
{
  int v1 = (SavageDevice *)operator new(0x88uLL);
  SavageDevice::SavageDevice(v1);
  SavageDevice::myInstance = (uint64_t)v1;
  return v1;
}

void sub_22F4CFF34(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void SavageDevice::destroyInstance(SavageDevice *this)
{
  if (SavageDevice::myInstance)
  {
    SavageDevice::~SavageDevice((SavageDevice *)SavageDevice::myInstance);
    operator delete(v1);
    SavageDevice::myInstance = 0;
  }
}

void SavageDevice::SavageDevice(SavageDevice *this)
{
  *((_WORD *)this + 8) = 0;
  *((void *)this + 7) = 0;
  *((_DWORD *)this + 16) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 9) = 0;
  *((void *)this + 10) = 0;
  *((void *)this + 15) = 0;
  *((void *)this + 16) = 0;
  *((void *)this + 14) = 0;
  *((unsigned char *)this + 70) = 1;
  *((_WORD *)this + 52) = 0;
  SavageDevice::SetupDevice((io_iterator_t *)this);
  SavageDevice::CheckProvisioningStatus(this);
  *((_WORD *)this + 34) = 0;
  *((unsigned char *)this + 18) = 0;
  *(void *)this = 0;
  *((void *)this + 1) = 0;
}

uint64_t SavageDevice::SetupDevice(io_iterator_t *this)
{
  CFMutableDictionaryRef properties = 0;
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  io_registry_entry_t v3 = IORegistryEntryFromPath(*MEMORY[0x263F0EC88], "IODeviceTree:/chosen");
  uint64_t v4 = 0;
  uint64_t v5 = this + 29;
  while (1)
  {
    CFDictionaryRef v6 = IOServiceMatching(off_264A0A398[v4]);
    uint64_t MatchingServices = IOServiceGetMatchingServices(v2, v6, this + 29);
    if (!MatchingServices)
    {
      if (*v5) {
        break;
      }
    }
    *uint64_t v5 = 0;
    if (++v4 == 3)
    {
      LODWORD(v4) = 1;
      goto LABEL_6;
    }
  }
  if ((v4 - 1) < 2) {
    *((unsigned char *)this + 104) = 1;
  }
LABEL_6:
  CFIndex v8 = (const __CFAllocator **)MEMORY[0x263EFFB08];
  if (v3)
  {
    CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v3, @"development-cert", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (CFProperty)
    {
      CFDataRef v10 = CFProperty;
      CFTypeID v11 = CFGetTypeID(CFProperty);
      if (v11 == CFDataGetTypeID()) {
        *((unsigned char *)this + 70) = *CFDataGetBytePtr(v10) == 0;
      }
      CFRelease(v10);
    }
  }
  io_object_t v12 = IOIteratorNext(*v5);
  if (v12)
  {
    io_registry_entry_t v13 = v12;
    CFAllocatorRef v14 = *v8;
    while (1)
    {
      uint64_t MatchingServices = IORegistryEntryCreateCFProperties(v13, &properties, v14, 0);
      if (!MatchingServices)
      {
        if (this[30])
        {
          uint64_t MatchingServices = 0;
        }
        else
        {
          this[30] = v13;
          if (!v4) {
            SavageDevice::ReadSensorType((SavageDevice *)this);
          }
          uint64_t MatchingServices = SavageDevice::SavageDeviceOpen((SavageDevice *)this);
          if (!MatchingServices)
          {
LABEL_23:
            if (properties) {
              CFRelease(properties);
            }
            return MatchingServices;
          }
          SavageDevice::SavageDeviceClose((SavageDevice *)this);
          if (properties)
          {
            CFRelease(properties);
            CFMutableDictionaryRef properties = 0;
          }
          IOObjectRelease(this[30]);
          this[30] = 0;
        }
      }
      io_registry_entry_t v13 = IOIteratorNext(*v5);
      if (!v13) {
        goto LABEL_23;
      }
    }
  }
  return MatchingServices;
}

uint64_t SavageDevice::CheckProvisioningStatus(SavageDevice *this)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v2 = 3758097136;
  *(void *)buffer = 0;
  uint64_t v39 = 0;
  *(_OWORD *)int v36 = 0u;
  long long v37 = 0u;
  *(_OWORD *)uint64_t v34 = 0u;
  long long v35 = 0u;
  v33[0] = 0;
  v33[1] = 0;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), @"SavageUID", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFDataRef v5 = CFProperty;
    CFTypeID v6 = CFGetTypeID(CFProperty);
    if (v6 != CFDataGetTypeID()) {
      goto LABEL_36;
    }
    v41.location = 0;
    v41.length = 16;
    CFDataGetBytes(v5, v41, buffer);
    CFRelease(v5);
    *((void *)this + 7) = bswap64(*(unint64_t *)buffer);
    CFDataRef v7 = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), @"SavageMNS", v3, 0);
    if (v7)
    {
      CFDataRef v5 = v7;
      CFTypeID v8 = CFGetTypeID(v7);
      if (v8 != CFDataGetTypeID()) {
        goto LABEL_36;
      }
      BytePtr = CFDataGetBytePtr(v5);
      if (BytePtr)
      {
        int v10 = *BytePtr;
        if (v10 == 10 || v10 == 6) {
          *((unsigned char *)this + 17) = 1;
        }
      }
      CFRelease(v5);
      CFDataRef v12 = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), @"SavageChipID", v3, 0);
      if (v12)
      {
        CFDataRef v5 = v12;
        CFTypeID v13 = CFGetTypeID(v12);
        if (v13 != CFDataGetTypeID()) {
          goto LABEL_36;
        }
        v42.location = 0;
        v42.length = 4;
        CFDataGetBytes(v5, v42, (UInt8 *)this + 112);
        *((_DWORD *)this + 28) = bswap32(*((_DWORD *)this + 28));
        CFRelease(v5);
        CFDataRef v14 = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), @"SavageKCV", v3, 0);
        if (v14)
        {
          CFDataRef v5 = v14;
          CFTypeID v15 = CFGetTypeID(v14);
          if (v15 != CFDataGetTypeID()) {
            goto LABEL_36;
          }
          v43.location = 0;
          v43.length = 3;
          CFDataGetBytes(v5, v43, (UInt8 *)this + 64);
          CFRelease(v5);
          CFDataRef v16 = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), @"SavageWrapOutputKey", v3, 0);
          if (v16)
          {
            CFDataRef v17 = v16;
            CFTypeID v18 = CFGetTypeID(v16);
            if (v18 == CFDataGetTypeID())
            {
              v44.location = 0;
              v44.length = 32;
              CFDataGetBytes(v17, v44, v34);
            }
            CFRelease(v17);
            unint64_t v19 = bswap64(*(unint64_t *)v34);
          }
          else
          {
            unint64_t v19 = 0;
          }
          *((void *)this + 12) = v19;
          CFDataRef v20 = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), @"SavagePubKeyHmac", v3, 0);
          if (v20)
          {
            CFDataRef v21 = v20;
            CFTypeID v22 = CFGetTypeID(v20);
            if (v22 == CFDataGetTypeID())
            {
              v45.location = 0;
              v45.length = 32;
              CFDataGetBytes(v21, v45, v36);
            }
            CFRelease(v21);
            unint64_t v23 = bswap64(*(unint64_t *)v36);
          }
          else
          {
            unint64_t v23 = 0;
          }
          *((void *)this + 9) = v23;
          CFDataRef v24 = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), @"SavageAuthPubKey", v3, 0);
          if (v24)
          {
            CFDataRef v5 = v24;
            CFTypeID v25 = CFGetTypeID(v24);
            if (v25 != CFDataGetTypeID()) {
              goto LABEL_36;
            }
            *(void *)this = SavageSafeRetain(v5);
            CFRelease(v5);
            CFDataRef v26 = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), @"SavageAuthSalt", v3, 0);
            if (v26)
            {
              CFDataRef v5 = v26;
              CFTypeID v27 = CFGetTypeID(v26);
              if (v27 != CFDataGetTypeID()) {
                goto LABEL_36;
              }
              v46.location = 0;
              v46.length = 16;
              CFDataGetBytes(v5, v46, (UInt8 *)v33);
              CFRelease(v5);
              *((void *)this + 11) = bswap64(v33[0]);
              CFDataRef v28 = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), @"SavageAuthResponse", v3, 0);
              if (v28)
              {
                CFDataRef v5 = v28;
                CFTypeID v29 = CFGetTypeID(v28);
                if (v29 != CFDataGetTypeID()) {
                  goto LABEL_36;
                }
                *((void *)this + 1) = SavageSafeRetain(v5);
                CFRelease(v5);
                CFDataRef v30 = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), @"SavageAuthPubKeyHmac", v3, 0);
                if (v30)
                {
                  CFDataRef v5 = v30;
                  CFTypeID v31 = CFGetTypeID(v30);
                  if (v31 == CFDataGetTypeID())
                  {
                    v47.location = 0;
                    v47.length = 32;
                    CFDataGetBytes(v5, v47, v36);
                    CFRelease(v5);
                    uint64_t v2 = 0;
                    *((void *)this + 10) = bswap64(*(unint64_t *)v36);
                    return v2;
                  }
LABEL_36:
                  CFRelease(v5);
                }
              }
            }
          }
        }
      }
    }
  }
  return v2;
}

void SavageDevice::~SavageDevice(SavageDevice *this)
{
  io_object_t v2 = *((_DWORD *)this + 29);
  if (v2) {
    IOObjectRelease(v2);
  }
  io_object_t v3 = *((_DWORD *)this + 30);
  if (v3) {
    IOObjectRelease(v3);
  }
  SavageDevice::SavageDeviceClose(this);
}

uint64_t SavageDevice::SavageDeviceClose(SavageDevice *this)
{
  if (*((unsigned char *)this + 104))
  {
    SavageCamInterfaceClose();
    uint64_t result = 0;
    *((void *)this + 16) = 0;
  }
  else
  {
    mach_port_t v3 = *((_DWORD *)this + 31);
    if (v3)
    {
      uint64_t v4 = IOConnectCallScalarMethod(v3, 4u, 0, 0, 0, 0);
      IOServiceClose(*((_DWORD *)this + 31));
      *((_DWORD *)this + 31) = 0;
      return v4;
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

uint64_t SavageDevice::UnallowedList(SavageDevice *this)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  io_registry_entry_t v2 = IORegistryEntryFromPath(*MEMORY[0x263F0EC88], "IODeviceTree:/");
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v2, @"target-type", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  __int16 v16 = 0;
  *(void *)buffer = 0;
  __int16 v14 = 0;
  *(void *)__s2 = 0x3132313355;
  if (CFProperty)
  {
    CFDataRef v4 = CFProperty;
    v18.length = CFDataGetLength(CFProperty);
    v18.location = 0;
    CFDataGetBytes(v4, v18, buffer);
    UInt8 v5 = buffer[0];
    if (buffer[0])
    {
      int v6 = 1;
      CFDataRef v7 = buffer;
      do
      {
        *CFDataRef v7 = v5 ^ 1;
        CFDataRef v7 = &buffer[v6];
        UInt8 v5 = *v7;
        ++v6;
      }
      while (*v7);
    }
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    int v10 = buffer;
    __int16 v11 = 2080;
    CFDataRef v12 = __s2;
    _os_log_impl(&dword_22F4CB000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "SavageDeviceLog: target-type = %s; unallowedTarget = %s \n",
      (uint8_t *)&v9,
      0x16u);
  }
  uint64_t result = strncmp((const char *)buffer, __s2, 0xAuLL);
  if (!result) {
    *((unsigned char *)this + 16) = 0;
  }
  return result;
}

void SavageDevice::ReadSensorType(SavageDevice *this)
{
  CFTypeRef v2 = IORegistryEntrySearchCFProperty(*((_DWORD *)this + 30), "IOService", @"sensor-type", (CFAllocatorRef)*MEMORY[0x263EFFB08], 3u);
  *(_DWORD *)buffer = 0;
  if (v2)
  {
    mach_port_t v3 = v2;
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 != CFDataGetTypeID())
    {
LABEL_13:
      CFRelease(v3);
      return;
    }
    v6.location = 0;
    v6.length = 4;
    CFDataGetBytes((CFDataRef)v3, v6, buffer);
    if (*(int *)buffer <= 352)
    {
      if (((*(_DWORD *)buffer - 162) > 0x22 || ((1 << (buffer[0] + 94)) & 0x700002DE5) == 0)
        && ((*(_DWORD *)buffer - 80) > 0x10 || ((1 << (buffer[0] - 80)) & 0x1000F) == 0))
      {
        goto LABEL_7;
      }
    }
    else if (*(_DWORD *)buffer != 353 && *(_DWORD *)buffer != 1701 && *(_DWORD *)buffer != 1445)
    {
LABEL_7:
      *((unsigned char *)this + 16) = 0;
      goto LABEL_13;
    }
    *((unsigned char *)this + 16) = 1;
    *((_DWORD *)this + 27) = 3;
    goto LABEL_13;
  }
}

uint64_t SavageDevice::SavageDeviceOpen(SavageDevice *this)
{
  v9[1] = *MEMORY[0x263EF8340];
  if (*((unsigned char *)this + 104) == 1)
  {
    v9[0] = 0;
    CFTypeRef v2 = (void *)((char *)this + 128);
    Sensoruint64_t Info = SavageCamInterfaceOpen();
    if (SensorInfo) {
      return SensorInfo;
    }
    if (!*v2) {
      return 0;
    }
    Sensoruint64_t Info = SavageCamInterfaceGetSensorInfo();
    if (SensorInfo) {
      return SensorInfo;
    }
    *((_DWORD *)this + 27) = v9[0];
    int v4 = BYTE4(v9[0]);
    *((unsigned char *)this + 105) = BYTE4(v9[0]);
    *((unsigned char *)this + 16) = BYTE5(v9[0]);
    if (!v4) {
      SavageDevice::SavageDeviceClose(this);
    }
  }
  if (*((unsigned char *)this + 105))
  {
    uint64_t v5 = 0;
  }
  else
  {
    if (*((_DWORD *)this + 31)) {
      return 3758097093;
    }
    unsigned int v7 = IOServiceOpen(*((_DWORD *)this + 30), *MEMORY[0x263EF8960], 0x2Au, (io_connect_t *)this + 31);
    mach_port_t v8 = *((_DWORD *)this + 31);
    if (v8) {
      uint64_t v5 = v7;
    }
    else {
      uint64_t v5 = 3758097084;
    }
    if (!v5)
    {
      v9[0] = 0;
      uint64_t v5 = IOConnectCallScalarMethod(v8, 3u, v9, 1u, 0, 0);
    }
  }
  SavageDevice::UnallowedList(this);
  return v5;
}

uint64_t SavageDevice::CreateNGIDProvBlob(uint64_t a1, UInt8 *a2)
{
  uint64_t v4 = 3758097136;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 120), @"SavageUID", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFDataRef v7 = CFProperty;
    CFTypeID v8 = CFGetTypeID(CFProperty);
    if (v8 != CFDataGetTypeID()) {
      goto LABEL_8;
    }
    v14.location = 0;
    v14.length = 16;
    CFDataGetBytes(v7, v14, a2);
    CFRelease(v7);
    CFDataRef v9 = (const __CFData *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 120), @"SavagePubKey", v5, 0);
    if (!v9) {
      return v4;
    }
    CFDataRef v7 = v9;
    CFTypeID v10 = CFGetTypeID(v9);
    if (v10 != CFDataGetTypeID())
    {
LABEL_8:
      CFRelease(v7);
      return v4;
    }
    v15.location = 0;
    v15.length = 56;
    CFDataGetBytes(v7, v15, a2 + 16);
    CFRelease(v7);
    CFDataRef v11 = (const __CFData *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 120), @"SavageKCV", v5, 0);
    if (v11)
    {
      CFDataRef v7 = v11;
      CFTypeID v12 = CFGetTypeID(v11);
      if (v12 == CFDataGetTypeID())
      {
        v16.location = 0;
        v16.length = 3;
        CFDataGetBytes(v7, v16, a2 + 144);
        uint64_t v4 = 0;
      }
      goto LABEL_8;
    }
  }
  return v4;
}

uint64_t SavageDevice::CreateDeviceInfoDict(SavageDevice *this, __CFDictionary *a2)
{
  uint64_t v4 = 3758097136;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), @"SavageUID", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFDataRef v7 = CFProperty;
    CFTypeID v8 = CFGetTypeID(CFProperty);
    if (v8 != CFDataGetTypeID()) {
      goto LABEL_24;
    }
    CFDictionaryAddValue(a2, (const void *)*MEMORY[0x263F90398], v7);
    CFRelease(v7);
    CFTypeRef v9 = IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), @"SavageNonce", v5, 0);
    if (v9)
    {
      CFDataRef v7 = v9;
      CFTypeID v10 = CFGetTypeID(v9);
      if (v10 != CFDataGetTypeID()) {
        goto LABEL_24;
      }
      CFDictionaryAddValue(a2, (const void *)*MEMORY[0x263F90380], v7);
      CFRelease(v7);
      CFTypeRef v11 = IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), @"SavageChipID", v5, 0);
      if (v11)
      {
        CFDataRef v7 = v11;
        CFTypeID v12 = CFGetTypeID(v11);
        if (v12 != CFDataGetTypeID()) {
          goto LABEL_24;
        }
        CFDictionaryAddValue(a2, (const void *)*MEMORY[0x263F90378], v7);
        CFRelease(v7);
        CFTypeRef v13 = IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), @"SavageDeviceRev", v5, 0);
        if (v13)
        {
          CFDataRef v7 = v13;
          CFTypeID v14 = CFGetTypeID(v13);
          if (v14 != CFDataGetTypeID()) {
            goto LABEL_24;
          }
          CFDictionaryAddValue(a2, (const void *)*MEMORY[0x263F90390], v7);
          BytePtr = CFDataGetBytePtr((CFDataRef)v7);
          if (BytePtr) {
            *((unsigned char *)this + 68) = (*BytePtr & 0xF0) == 160;
          }
          CFRelease(v7);
          CFTypeRef v16 = IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), @"SavageMNS", v5, 0);
          if (v16)
          {
            CFDataRef v7 = v16;
            CFTypeID v17 = CFGetTypeID(v16);
            if (v17 != CFDataGetTypeID()) {
              goto LABEL_24;
            }
            CFRange v18 = CFDataGetBytePtr((CFDataRef)v7);
            if (v18)
            {
              int v19 = *v18;
              if (v19 == 6)
              {
                *((unsigned char *)this + 69) = 0;
                int v19 = *v18;
              }
              if (v19 == 10) {
                *((unsigned char *)this + 69) = 1;
              }
            }
            CFRelease(v7);
            mach_port_t v20 = *MEMORY[0x263F0EC90];
            CFDictionaryRef v21 = IOServiceNameMatching("ApplePearlSEPDriver");
            uint64_t MatchingService = IOServiceGetMatchingService(v20, v21);
            uint64_t v4 = MatchingService;
            if (MatchingService)
            {
              CFTypeRef v23 = IORegistryEntryCreateCFProperty(MatchingService, @"FDRDataEncryptionKey", v5, 0);
              if (!v23)
              {
LABEL_22:
                IOObjectRelease(v4);
                return 0;
              }
              CFDataRef v7 = v23;
              CFTypeID v24 = CFGetTypeID(v23);
              if (v24 == CFDataGetTypeID())
              {
                v26.location = 0;
                v26.length = 32;
                CFDataGetBytes((CFDataRef)v7, v26, (UInt8 *)this + 19);
                *((unsigned char *)this + 18) = 1;
                CFRelease(v7);
                goto LABEL_22;
              }
              IOObjectRelease(v4);
              uint64_t v4 = 0;
LABEL_24:
              CFRelease(v7);
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t SavageDevice::PrePersonalize(SavageDevice *this, unsigned int a2)
{
  v5[1] = *MEMORY[0x263EF8340];
  if (*((unsigned char *)this + 105))
  {
    uint64_t v2 = *((void *)this + 16);
    return MEMORY[0x270F5CB70](v2, 0);
  }
  else
  {
    mach_port_t v3 = *((_DWORD *)this + 31);
    if (v3)
    {
      v5[0] = a2;
      return IOConnectCallScalarMethod(v3, 0, v5, 1u, 0, 0);
    }
    else
    {
      return 3758097084;
    }
  }
}

uint64_t SavageDevice::PreFusing(SavageDevice *this, unsigned int a2)
{
  v5[1] = *MEMORY[0x263EF8340];
  if (*((unsigned char *)this + 105))
  {
    uint64_t v2 = *((void *)this + 16);
    return MEMORY[0x270F5CB68](v2, 0);
  }
  else
  {
    mach_port_t v3 = *((_DWORD *)this + 31);
    if (v3)
    {
      v5[0] = a2;
      return IOConnectCallScalarMethod(v3, 1u, v5, 1u, 0, 0);
    }
    else
    {
      return 3758097084;
    }
  }
}

uint64_t SavageDevice::Fusing(SavageDevice *this, unsigned int a2, const unsigned __int8 *a3, unsigned int a4)
{
  v9[3] = *MEMORY[0x263EF8340];
  if (*((unsigned char *)this + 105))
  {
    uint64_t v5 = SavageCamInterfaceSensorFusing();
LABEL_3:
    uint64_t v6 = v5;
    goto LABEL_4;
  }
  mach_port_t v8 = *((_DWORD *)this + 31);
  uint64_t v9[2] = a2;
  uint64_t v6 = 3758097090;
  if (a3 && a4)
  {
    v9[0] = (uint64_t)a3;
    v9[1] = a4;
    if (!v8)
    {
      uint64_t v6 = 3758097084;
      goto LABEL_4;
    }
    uint64_t v5 = IOConnectCallScalarMethod(v8, 2u, v9, 3u, 0, 0);
    goto LABEL_3;
  }
LABEL_4:
  *((void *)this + 7) = 0;
  SavageDevice::CheckProvisioningStatus(this);
  return v6;
}

uint64_t SavageDevice::AuthFlow(SavageDevice *this, unsigned int a2, const unsigned __int8 *a3)
{
  uint64_t v4 = SavageCamInterfaceSensorAuth();
  SavageDevice::CheckProvisioningStatus(this);
  return v4;
}

uint64_t SavageDevice::PublishToRegistry(SavageDevice *this, const __CFString *a2, const __CFData *a3)
{
  return MEMORY[0x270F5CB50](*((void *)this + 16), a2, a3);
}

uint64_t SavageUpdateController::getInstance(SavageUpdateController *this, const __CFDictionary *a2, void *a3, void *a4)
{
  CFDataRef v7 = (SavageUpdateController *)operator new(0x1B8uLL);
  SavageUpdateController::SavageUpdateController(v7);
  SavageUpdateController::myInstance = (uint64_t)v7;
  *(void *)CFDataRef v7 = a3;
  *((void *)v7 + 1) = a2;
  SavageUpdateController::SavageLog(v7, "%s - %p (%p) - UpdaterIsSupported = %d; SavageIsPresent = %d \n",
    "getInstance",
    v7,
    *((const void **)v7 + 8),
    *((unsigned __int8 *)v7 + 250),
    *(unsigned __int8 *)(*((void *)v7 + 8) + 17));
  SavageUpdateController::start((SavageUpdateController *)SavageUpdateController::myInstance, this);
  return SavageUpdateController::myInstance;
}

void sub_22F4D11A4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void SavageUpdateController::SavageLog(SavageUpdateController *this, const char *a2, ...)
{
  va_start(va, a2);
  uint64_t v2 = MEMORY[0x270FA5388](this, a2);
  uint64_t v7 = *MEMORY[0x263EF8340];
  vsnprintf(__str, 0x1000uLL, v3, va);
  if (*(void *)v2)
  {
    (*(void (**)(void, char *))v2)(*(void *)(v2 + 8), __str);
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v5 = __str;
    _os_log_impl(&dword_22F4CB000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "SavageLog: %s \n", buf, 0xCu);
  }
}

uint64_t SavageUpdateController::start(SavageUpdateController *this, const __CFDictionary *a2)
{
  *((unsigned char *)this + 25) = 1;
  if (*((unsigned char *)this + 250)) {
    SavageDevice::CheckProvisioningStatus(*((SavageDevice **)this + 8));
  }
  SavageUpdateController::SavageLog(this, "%s: isProvisioned=0x%llX; isNGIDProvisioned=0x%X; isSocProdfused=%d; persoLoop = %d\n",
    "start",
    *(void *)(*((void *)this + 8) + 56),
    *(_DWORD *)(*((void *)this + 8) + 64),
    *(unsigned __int8 *)(*((void *)this + 8) + 70),
    *((_DWORD *)this + 107));
  if (a2)
  {
    *((void *)this + 32) = SavageSafeRetain(a2);
    CFStringRef v4 = (const __CFString *)*MEMORY[0x263F90310];
    CFDataRef Value = CFDictionaryGetValue(a2, (const void *)*MEMORY[0x263F90310]);
    CFTypeRef v6 = SavageSafeRetain(Value);
    if (v6 && (uint64_t v7 = v6, v8 = CFGetTypeID(v6), v8 == CFDictionaryGetTypeID()))
    {
      if (CFDictionaryGetCount((CFDictionaryRef)v7))
      {
        a2 = (const __CFDictionary *)CFCopyDescription(v7);
        CStringPtr = CFStringGetCStringPtr((CFStringRef)a2, 0);
        CFTypeID v10 = CFStringGetCStringPtr(v4, 0);
        CFTypeRef v11 = "No C string description available.";
        if (CStringPtr) {
          CFTypeRef v11 = CStringPtr;
        }
        SavageUpdateController::SavageLog(this, "%s [input]: %s %s \n", "start", v10, v11);
        CFTypeID v12 = CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x263F90330]);
        if (v12)
        {
          CFTypeID v13 = CFGetTypeID(v12);
          if (v13 == CFBooleanGetTypeID()) {
            *((unsigned char *)this + 248) = 1;
          }
        }
        CFBooleanRef v14 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x263F90360]);
        if (v14)
        {
          CFBooleanRef v15 = v14;
          CFTypeID v16 = CFGetTypeID(v14);
          if (v16 == CFBooleanGetTypeID()) {
            *((unsigned char *)this + 249) = CFBooleanGetValue(v15);
          }
        }
        CFBooleanRef v17 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x263F902F0]);
        if (v17)
        {
          CFBooleanRef v18 = v17;
          CFTypeID v19 = CFGetTypeID(v17);
          if (v19 == CFBooleanGetTypeID() && CFBooleanGetValue(v18) == 1)
          {
            uint64_t v20 = *((void *)this + 8);
            if (!*(void *)(v20 + 56))
            {
              if (*(unsigned char *)(v20 + 70)) {
                int v21 = 1;
              }
              else {
                int v21 = 2;
              }
              *((_DWORD *)this + 107) = v21;
            }
          }
        }
        CFBooleanRef v22 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x263F90350]);
        if (v22)
        {
          CFBooleanRef v23 = v22;
          CFTypeID v24 = CFGetTypeID(v22);
          if (v24 == CFBooleanGetTypeID()) {
            *((unsigned char *)this + 253) = CFBooleanGetValue(v23);
          }
        }
        CFBooleanRef v25 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x263F90358]);
        if (v25)
        {
          CFBooleanRef v26 = v25;
          CFTypeID v27 = CFGetTypeID(v25);
          if (v27 == CFBooleanGetTypeID()) {
            *((unsigned char *)this + 252) = CFBooleanGetValue(v26);
          }
        }
        CFBooleanRef v28 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x263F90320]);
        if (v28)
        {
          CFBooleanRef v29 = v28;
          CFTypeID v30 = CFGetTypeID(v28);
          if (v30 == CFBooleanGetTypeID()) {
            *((unsigned char *)this + 16) = CFBooleanGetValue(v29);
          }
        }
        CFBooleanRef v31 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x263F902F8]);
        if (v31)
        {
          CFBooleanRef v32 = v31;
          CFTypeID v33 = CFGetTypeID(v31);
          if (v33 == CFBooleanGetTypeID()) {
            *((unsigned char *)this + 17) = CFBooleanGetValue(v32);
          }
        }
        CFBooleanRef v34 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x263F902D0]);
        if (v34)
        {
          CFBooleanRef v35 = v34;
          CFTypeID v36 = CFGetTypeID(v34);
          if (v36 == CFBooleanGetTypeID())
          {
            *((unsigned char *)this + 21) = CFBooleanGetValue(v35);
            *((_DWORD *)this + 108) = 2;
          }
        }
        CFDataRef v37 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x263F902D8]);
        if (v37)
        {
          CFDataRef v38 = v37;
          CFTypeID v39 = CFGetTypeID(v37);
          if (v39 == CFDataGetTypeID())
          {
            uint64_t v40 = (UInt8 *)calloc(0x10uLL, 1uLL);
            *((void *)this + 4) = v40;
            v62.location = 0;
            v62.length = 16;
            CFDataGetBytes(v38, v62, v40);
            *((unsigned char *)this + 254) = 1;
            *((unsigned char *)this + 21) = 1;
            *((unsigned char *)this + 25) = 0;
          }
        }
        CFBooleanRef v41 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x263F90438]);
        if (v41)
        {
          CFBooleanRef v42 = v41;
          CFTypeID v43 = CFGetTypeID(v41);
          if (v43 == CFBooleanGetTypeID()) {
            *((unsigned char *)this + 23) = CFBooleanGetValue(v42);
          }
        }
        CFStringRef v44 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x263F902E0]);
        if (v44)
        {
          CFStringRef v45 = v44;
          CFTypeID v46 = CFGetTypeID(v44);
          if (v46 == CFStringGetTypeID()) {
            *((unsigned char *)this + 19) = CFStringGetLength(v45) != 0;
          }
        }
        CFStringRef v47 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v7, @"PersonalizedFirmwareRootPath");
        if (v47)
        {
          CFStringRef v48 = v47;
          CFTypeID v49 = CFGetTypeID(v47);
          if (v49 == CFStringGetTypeID())
          {
            Mutable = CFStringCreateMutable(0, 0);
            *((void *)this + 34) = Mutable;
            CFStringAppend(Mutable, v48);
          }
        }
        CFStringRef v51 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x263F90348]);
        if (v51)
        {
          CFStringRef v52 = v51;
          CFTypeID v53 = CFGetTypeID(v51);
          if (v53 == CFStringGetTypeID())
          {
            int v54 = CFStringCreateMutable(0, 0);
            *((void *)this + 35) = v54;
            CFStringAppend(v54, v52);
            if (!*((void *)this + 34))
            {
              size_t v55 = CFStringCreateMutable(0, 0);
              *((void *)this + 34) = v55;
              CFStringAppend(v55, v52);
              CFStringAppend(*((CFMutableStringRef *)this + 34), @"/usr/standalone/firmware/Savage/");
            }
          }
        }
        CFBooleanRef v56 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x263F90338]);
        if (v56)
        {
          CFBooleanRef v57 = v56;
          CFTypeID v58 = CFGetTypeID(v56);
          if (v58 == CFBooleanGetTypeID()) {
            *((unsigned char *)this + 251) = CFBooleanGetValue(v57);
          }
        }
      }
      else
      {
        a2 = 0;
        *((unsigned char *)this + 248) = 1;
      }
    }
    else
    {
      SavageUpdateController::SavageLog(this, "%s: restoreOptions missing or not a dictionary\n", "start");
      a2 = 0;
    }
  }
  uint64_t v59 = *((void *)this + 8);
  if (!*(unsigned char *)(v59 + 17) && !*((unsigned char *)this + 251)) {
    *((unsigned char *)this + 249) = 1;
  }
  int v60 = *((unsigned __int8 *)this + 16);
  if (*((unsigned char *)this + 16))
  {
    if (*((unsigned char *)this + 19))
    {
      if (v60 == 1)
      {
        *((unsigned char *)this + 25) = 0;
        *((unsigned char *)this + 23) = 0;
        *((unsigned char *)this + 21) = 0;
        *((unsigned char *)this + 19) = 0;
        *((unsigned char *)this + 17) = 0;
      }
    }
    else
    {
      int v60 = 0;
      *((unsigned char *)this + 16) = 0;
      *((unsigned char *)this + 249) = 1;
    }
  }
  if (*((unsigned char *)this + 252) == 1 && !*((unsigned char *)this + 17) && !*((unsigned char *)this + 19)) {
    *((unsigned char *)this + 26) = 1;
  }
  if (!*((unsigned char *)this + 251)
    || *(void *)(v59 + 56)
    || *((unsigned char *)this + 17)
    || *((unsigned char *)this + 19)
    || *((unsigned char *)this + 21)
    || *((unsigned __int8 *)this + 23) | v60)
  {
    *((_DWORD *)this + 107) = 1;
  }
  if (a2) {
    CFRelease(a2);
  }
  return 0;
}

void SavageUpdateController::destroyInstance(SavageUpdateController *this)
{
  if (SavageUpdateController::myInstance)
  {
    SavageUpdateController::SavageLog((SavageUpdateController *)SavageUpdateController::myInstance, "%s - %p (%p) - UpdaterIsSupported = %d; SavageIsPresent = %d \n",
      "destroyInstance",
      (const void *)SavageUpdateController::myInstance,
      *(const void **)(SavageUpdateController::myInstance + 64),
      *(unsigned __int8 *)(SavageUpdateController::myInstance + 250),
      *(unsigned __int8 *)(*(void *)(SavageUpdateController::myInstance + 64) + 17));
    SavageDevice::destroyInstance(v1);
    if (SavageUpdateController::myInstance)
    {
      SavageUpdateController::~SavageUpdateController((SavageUpdateController *)SavageUpdateController::myInstance);
      operator delete(v2);
    }
    SavageUpdateController::myInstance = 0;
  }
}

void SavageUpdateController::SavageUpdateController(SavageUpdateController *this)
{
  *((void *)this + 32) = 0;
  *((void *)this + 52) = 0;
  *((void *)this + 38) = 0;
  *((void *)this + 39) = 0;
  *((_DWORD *)this + 106) = 3;
  *((unsigned char *)this + 248) = 0;
  *((_WORD *)this + 126) = 0;
  *((unsigned char *)this + 254) = 0;
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 37) = 0;
  *(_OWORD *)((char *)this + 264) = 0u;
  *(_OWORD *)((char *)this + 280) = 0u;
  *((_DWORD *)this + 103) = 0;
  *(void *)((char *)this + 404) = 0;
  *(void *)((char *)this + 396) = 0;
  Instance = SavageDevice::getInstance(this);
  *((void *)this + 8) = Instance;
  *((_DWORD *)this + 106) = *((_DWORD *)Instance + 27);
  int v3 = *((unsigned __int8 *)Instance + 16);
  *((unsigned char *)this + 250) = v3;
  *((unsigned char *)this + 249) = v3 == 0;
  *((unsigned char *)this + 26) = 0;
  *((void *)this + 2) = 0x1000100010000;
  *((_WORD *)this + 12) = 1;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *((void *)this + 27) = 0;
  *((void *)this + 30) = 56;
  *((_OWORD *)this + 14) = xmmword_22F4E6050;
  *((void *)this + 48) = 0;
  *((_DWORD *)this + 98) = 0;
  *((void *)this + 40) = 0;
  *((_DWORD *)this + 82) = 0;
  *((void *)this + 42) = 0;
  *((_DWORD *)this + 86) = 0;
  *((void *)this + 46) = 0;
  *((_DWORD *)this + 94) = 0;
  *((void *)this + 44) = 0;
  *((_DWORD *)this + 90) = 0;
  *(void *)((char *)this + 428) = 0x100000001;
  *((void *)this + 4) = 0;
  *((unsigned char *)this + 251) = 0;
}

void SavageUpdateController::~SavageUpdateController(SavageUpdateController *this)
{
  uint64_t v2 = (const void *)*((void *)this + 32);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 32) = 0;
  }
  int v3 = (const void *)*((void *)this + 34);
  if (v3)
  {
    CFRelease(v3);
    *((void *)this + 34) = 0;
  }
  CFStringRef v4 = (void *)*((void *)this + 38);
  if (v4)
  {
    free(v4);
    *((void *)this + 38) = 0;
  }
  uint64_t v5 = (void *)*((void *)this + 39);
  if (v5)
  {
    free(v5);
    *((void *)this + 39) = 0;
  }
  CFTypeRef v6 = (void *)*((void *)this + 40);
  if (v6)
  {
    free(v6);
    *((void *)this + 40) = 0;
  }
  uint64_t v7 = (void *)*((void *)this + 42);
  if (v7)
  {
    free(v7);
    *((void *)this + 42) = 0;
  }
  CFTypeID v8 = (void *)*((void *)this + 46);
  if (v8)
  {
    free(v8);
    *((void *)this + 46) = 0;
  }
  CFTypeRef v9 = (void *)*((void *)this + 44);
  if (v9)
  {
    free(v9);
    *((void *)this + 44) = 0;
  }
  CFTypeID v10 = (void *)*((void *)this + 48);
  if (v10)
  {
    free(v10);
    *((void *)this + 48) = 0;
  }
  CFTypeRef v11 = (void *)*((void *)this + 52);
  if (v11)
  {
    free(v11);
    *((void *)this + 52) = 0;
  }
  CFTypeID v12 = (void *)*((void *)this + 4);
  if (v12)
  {
    free(v12);
    *((void *)this + 4) = 0;
  }
  CFTypeID v13 = (const void *)*((void *)this + 33);
  if (v13)
  {
    CFRelease(v13);
    *((void *)this + 33) = 0;
  }
}

uint64_t SavageUpdateController::libFDRCallback(uint64_t a1, uint64_t a2)
{
  MEMORY[0x270FA5388](a1, a2);
  int v3 = v2;
  CFDataRef v5 = v4;
  uint64_t v14 = *MEMORY[0x263EF8340];
  CFTypeRef v6 = (UInt8 *)calloc(0x10uLL, 1uLL);
  *(void *)(SavageUpdateController::myInstance + 32) = v6;
  v15.location = 0;
  v15.length = 16;
  CFDataGetBytes(v5, v15, v6);
  SavageUpdateController::SavageLog((SavageUpdateController *)SavageUpdateController::myInstance, "Auth challenge received from libFDR:--------------\n");
  bzero(v13, 0x1000uLL);
  unint64_t v7 = 0;
  int v8 = 0;
  do
  {
    int v9 = snprintf(&v13[v8], 5uLL, " %02X ", *(unsigned __int8 *)(*(void *)(SavageUpdateController::myInstance + 32) + v7));
    if (v7 > 0xE) {
      break;
    }
    v8 += v9;
    ++v7;
  }
  while (v8 < 4091);
  SavageUpdateController::SavageLog((SavageUpdateController *)SavageUpdateController::myInstance, "%s \n", v13);
  SavageUpdateController::formatAndStitchFiles((SavageUpdateController *)SavageUpdateController::myInstance);
  SavageDevice::Fusing(*(SavageDevice **)(SavageUpdateController::myInstance + 64), *(_DWORD *)(SavageUpdateController::myInstance + 424), *(const unsigned __int8 **)(SavageUpdateController::myInstance + 416), *(_DWORD *)(SavageUpdateController::myInstance + 412));
  uint64_t v10 = *(void *)(*(void *)(SavageUpdateController::myInstance + 64) + 8);
  if (v3) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  uint64_t result = !v11;
  if (!v11) {
    *int v3 = v10;
  }
  return result;
}

void SavageUpdateController::formatAndStitchFiles(SavageUpdateController *this)
{
  if (!*((void *)this + 38) || !*((void *)this + 48)) {
    return;
  }
  int v2 = 3 * *((_DWORD *)this + 98);
  int v3 = v2 + 3;
  int v4 = 3 * *((_DWORD *)this + 100);
  if (*((unsigned char *)this + 16)) {
    int v5 = 231;
  }
  else {
    int v5 = 0;
  }
  if (!*((unsigned char *)this + 17) && !*((unsigned char *)this + 19))
  {
    if (*((unsigned char *)this + 21) == 1) {
      int v3 = v2 + 51;
    }
    if (!*((unsigned char *)this + 21))
    {
      int v6 = v2 + 99;
      if (*((unsigned char *)this + 23) == 1) {
        int v3 = v6;
      }
    }
  }
  size_t v7 = (v4 + v5 + v3 + 35);
  *((_DWORD *)this + 103) = v7;
  int v8 = (char *)calloc(v7, 1uLL);
  *((void *)this + 52) = v8;
  if (!v8) {
    return;
  }
  *(_DWORD *)int v8 = 0;
  *((_DWORD *)v8 + 1) = v3;
  *((_DWORD *)v8 + 2) = v4 + 3;
  *((_DWORD *)v8 + 3) = 0;
  *((_DWORD *)v8 + 4) = v5;
  *(void *)(v8 + 20) = 0;
  *((_DWORD *)v8 + 7) = 0;
  if (*((unsigned char *)this + 17) || *((unsigned char *)this + 19))
  {
    LODWORD(v9) = 32;
  }
  else
  {
    if (*((unsigned char *)this + 21) == 1)
    {
      CFTypeID v36 = (char *)*((void *)this + 4);
      if (!v36)
      {
        SavageUpdateController::SavageLog(this, "%s: Using dummy auth challenge key \n", "formatAndStitchFiles");
        CFTypeID v36 = &byte_22F4E6060;
      }
      uint64_t v37 = 0;
      int v38 = 736;
      while (v37 + 35 <= (unint64_t)*((unsigned int *)this + 103))
      {
        *(unsigned char *)(*((void *)this + 52) + v37 + 32) = BYTE1(v38);
        *(unsigned char *)(*((void *)this + 52) + v37 + 33) = v38;
        char v39 = *v36++;
        *(unsigned char *)(*((void *)this + 52) + v37 + 34) = v39;
        ++v38;
        v37 += 3;
        if (v37 == 48)
        {
          LODWORD(v9) = 80;
          goto LABEL_60;
        }
      }
      LODWORD(v9) = v37 + 32;
LABEL_60:
      if (*((unsigned char *)this + 17)) {
        goto LABEL_17;
      }
    }
    else
    {
      LODWORD(v9) = 32;
    }
    if (!*((unsigned char *)this + 19) && !*((unsigned char *)this + 21) && *((unsigned char *)this + 23) == 1)
    {
      if (!*(unsigned char *)(*((void *)this + 8) + 18)) {
        SavageUpdateController::formatAndStitchFiles();
      }
      uint64_t v40 = 0;
      uint64_t v41 = v9;
      LODWORD(v9) = v9 + 96;
      int v42 = 544;
      uint64_t v43 = 19;
      while (1)
      {
        uint64_t v44 = v41 + v40;
        if (v41 + v40 + 3 > (unint64_t)*((unsigned int *)this + 103)) {
          break;
        }
        *(unsigned char *)(*((void *)this + 52) + v41 + v40) = BYTE1(v42);
        *(unsigned char *)(*((void *)this + 52) + v44 + 1) = v42;
        *(unsigned char *)(*((void *)this + 52) + v44 + 2) = *(unsigned char *)(*((void *)this + 8) + v43);
        ++v42;
        ++v43;
        v40 += 3;
        if (v40 == 96) {
          goto LABEL_17;
        }
      }
      LODWORD(v9) = v41 + v40;
    }
  }
LABEL_17:
  if (*((_DWORD *)this + 98))
  {
    unint64_t v10 = 0;
    uint64_t v9 = v9;
    int v11 = 2304;
    while (1)
    {
      int v12 = v9 + 3;
      if (v9 + 3 > (unint64_t)*((unsigned int *)this + 103)) {
        break;
      }
      *(unsigned char *)(*((void *)this + 52) + v9) = BYTE1(v11);
      *(unsigned char *)(*((void *)this + 52) + v9 + 1) = v11;
      *(unsigned char *)(*((void *)this + 52) + v9 + 2) = *(unsigned char *)(*((void *)this + 48) + v10++);
      ++v11;
      v9 += 3;
      if (v10 >= *((unsigned int *)this + 98))
      {
        LODWORD(v9) = v12;
        break;
      }
    }
  }
  int v13 = v9 + 3;
  if ((v9 + 3) <= *((_DWORD *)this + 103))
  {
    *(unsigned char *)(*((void *)this + 52) + (int)v9) = 1;
    *(unsigned char *)(*((void *)this + 52) + (int)v9 + 1) = 0;
    *(unsigned char *)(*((void *)this + 52) + (int)v9 + 2) = 4;
    if (*((_DWORD *)this + 100))
    {
      uint64_t v14 = 0;
      unint64_t v15 = 0;
      int v16 = 3072;
      do
      {
        if (*((_DWORD *)this + 103) < (v9 + v14 + 6)) {
          break;
        }
        *(unsigned char *)(*((void *)this + 52) + v9 + v14 + 3) = BYTE1(v16);
        *(unsigned char *)(*((void *)this + 52) + v9 + v14 + 4) = v16;
        *(unsigned char *)(*((void *)this + 52) + v9 + v14 + 5) = *(unsigned char *)(*((void *)this + 38) + v15++);
        ++v16;
        v14 += 3;
      }
      while (v15 < *((unsigned int *)this + 100));
      int v13 = v9 + v14 + 3;
    }
    if ((v13 + 3) <= *((_DWORD *)this + 103))
    {
      *(unsigned char *)(*((void *)this + 52) + v13) = 1;
      *(unsigned char *)(*((void *)this + 52) + v13 + 1) = 0;
      *(unsigned char *)(*((void *)this + 52) + v13 + 2) = 8;
      if (*((unsigned char *)this + 16) == 1)
      {
        uint64_t v17 = 0;
        int v18 = v13 + 51;
        CFTypeID v19 = (char *)this + 200;
        int v20 = 1906;
        while (1)
        {
          unsigned int v21 = *((_DWORD *)this + 103);
          if (v21 < v13 + (int)v17 + 6) {
            break;
          }
          *(unsigned char *)(*((void *)this + 52) + v13 + v17 + 3) = BYTE1(v20);
          *(unsigned char *)(*((void *)this + 52) + v13 + v17 + 4) = v20;
          char v22 = *v19++;
          *(unsigned char *)(*((void *)this + 52) + v13 + v17 + 5) = v22;
          ++v20;
          v17 += 3;
          if (v17 == 48)
          {
            unsigned int v21 = *((_DWORD *)this + 103);
            goto LABEL_35;
          }
        }
        int v18 = v13 + 3 + v17;
LABEL_35:
        if (v18 + 3 <= v21)
        {
          uint64_t v23 = 0;
          CFTypeID v24 = (char *)this + 216;
          int v25 = v18 + 9;
          int v26 = 1922;
          while (1)
          {
            unsigned int v27 = *((_DWORD *)this + 103);
            if (v27 < v18 + (int)v23 + 3) {
              break;
            }
            *(unsigned char *)(*((void *)this + 52) + v18 + v23) = BYTE1(v26);
            *(unsigned char *)(*((void *)this + 52) + v18 + v23 + 1) = v26;
            char v28 = *v24++;
            *(unsigned char *)(*((void *)this + 52) + v18 + v23 + 2) = v28;
            ++v26;
            v23 += 3;
            if (v23 == 9)
            {
              unsigned int v27 = *((_DWORD *)this + 103);
              goto LABEL_41;
            }
          }
          int v25 = v18 + v23;
LABEL_41:
          if (v25 + 3 <= v27)
          {
            uint64_t v29 = 0;
            int v30 = v25 + 168;
            CFBooleanRef v31 = (char *)this + 144;
            int v32 = 1834;
            while (1)
            {
              unsigned int v33 = *((_DWORD *)this + 103);
              if (v33 < v25 + (int)v29 + 3) {
                break;
              }
              *(unsigned char *)(*((void *)this + 52) + v25 + v29) = BYTE1(v32);
              *(unsigned char *)(*((void *)this + 52) + v25 + v29 + 1) = v32;
              char v34 = *v31++;
              *(unsigned char *)(*((void *)this + 52) + v25 + v29 + 2) = v34;
              ++v32;
              v29 += 3;
              if (v29 == 168)
              {
                unsigned int v33 = *((_DWORD *)this + 103);
                goto LABEL_47;
              }
            }
            int v30 = v25 + v29;
LABEL_47:
            uint64_t v35 = v30 + 3;
            if (v35 <= v33)
            {
              *(unsigned char *)(*((void *)this + 52) + v30) = 1;
              *(unsigned char *)(v30 + *((void *)this + 52) + 1) = 0;
              *(unsigned char *)(v30 + *((void *)this + 52) + 2) = 64;
              if ((v30 + 6) <= *((_DWORD *)this + 103))
              {
                *(unsigned char *)(*((void *)this + 52) + v35) = 1;
                *(unsigned char *)(v30 + *((void *)this + 52) + 4) = 0;
                *(unsigned char *)(v30 + *((void *)this + 52) + 5) = 0x80;
              }
            }
          }
        }
      }
    }
  }
}

void SavageUpdateController::getAuthChallenge(CFDictionaryRef *this)
{
  int v20 = 0;
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryGetValue(this[33], (const void *)*MEMORY[0x263F90378]);
  CFStringRef v3 = (const __CFString *)AMFDRCreateInstanceString();
  CFDictionaryGetValue(this[33], (const void *)*MEMORY[0x263F90398]);
  int v4 = (const void *)AMFDRCreateInstanceString();
  CFDataRef Value = CFDictionaryGetValue(this[33], (const void *)*MEMORY[0x263F90388]);
  int v6 = (const void *)*MEMORY[0x263EFFB40];
  Mutable = CFDictionaryCreateMutable(v2, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, @"CertifyRawPublicKey", v6);
  CFDictionarySetValue(Mutable, @"CertifyChallengeSupport128b", v6);
  CFDictionarySetValue(Mutable, @"CertifyRawECDSASignature", v6);
  CFDictionarySetValue(Mutable, @"CertifyComponentAttributesCriticalProductionMode", Value);
  if (SavageCFStringToUInt32(v3, &v20, 16))
  {
    if (v20 == 20581) {
      CFTypeID v24 = @"brunor";
    }
    else {
      SavageUpdateController::SavageLog((SavageUpdateController *)this, "%s: This sensor doesn't support auth flow \n", "getAuthChallenge");
    }
    uint64_t v25 = *(void *)this[8];
    int v26 = SavageUpdateController::libFDRCallback;
    CFStringRef v21 = CFStringCreateWithFormat(v2, 0, @"%@-%@", v3, v4);
    uint64_t v22 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    uint64_t v23 = 0;
    CStringPtr = CFStringGetCStringPtr(v21, 0x600u);
    SavageUpdateController::SavageLog((SavageUpdateController *)this, "%s moduleDataInstanceStr: %s \n", "getAuthChallenge", CStringPtr);
    uint64_t v9 = this + 5;
    AMFDRModuleCreateSignedCSR();
    CFDataRef v10 = this[6];
    if (v10)
    {
      int v11 = SavageDevice::PublishToRegistry(this[8], @"SavageAuthCSR", v10);
      CFStringRef v12 = CFCopyDescription(this[6]);
      if (v12)
      {
        CFStringRef v13 = v12;
        int CString = CFStringGetCString(v12, logString, 4096, 0);
        unint64_t v15 = "No C string description available.";
        if (CString) {
          unint64_t v15 = logString;
        }
        SavageUpdateController::SavageLog((SavageUpdateController *)this, "%s [CSR]: %s (status = 0x%08X) \n", "getAuthChallenge", v15, v11);
        CFRelease(v13);
      }
      else
      {
        SavageUpdateController::SavageLog((SavageUpdateController *)this, "%s [CSR]: %s (status = 0x%08X) \n", "getAuthChallenge", "No C string description available.", v11);
      }
    }
    if (!*v9)
    {
LABEL_16:
      if (!v4) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    CFStringRef v16 = CFErrorCopyDescription(*v9);
    if (v16)
    {
      CFStringRef v17 = v16;
      int v18 = CFStringGetCString(v16, logString, 4096, 0);
      CFTypeID v19 = "No C string description available.";
      if (v18) {
        CFTypeID v19 = logString;
      }
      SavageUpdateController::SavageLog((SavageUpdateController *)this, "%s [error]: %s \n", "getAuthChallenge", v19);
      CFRelease(v17);
      goto LABEL_16;
    }
    SavageUpdateController::SavageLog((SavageUpdateController *)this, "%s [error]: %s \n");
  }
  else
  {
    SavageUpdateController::SavageLog((SavageUpdateController *)this, "%s: No chipID from string instance \n");
  }
  if (v4) {
LABEL_17:
  }
    CFRelease(v4);
LABEL_18:
  if (v3) {
    CFRelease(v3);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

uint64_t SavageUpdateController::execCommand(SavageUpdateController *this, CFStringRef theString, const __CFDictionary *a3, const __CFDictionary **a4)
{
  if (!theString) {
    goto LABEL_36;
  }
  CStringPtr = CFStringGetCStringPtr(theString, 0);
  SavageUpdateController::SavageLog(this, "%s: Entering execCommand: command = %s, persoLoop = %d  \n", "execCommand", CStringPtr, *((_DWORD *)this + 107));
  if (*((unsigned char *)this + 249)) {
    goto LABEL_36;
  }
  if (a3)
  {
    SavageUpdateController::SavageLog(this, "%s: Input specified to the processing command\n", "execCommand");
    uint64_t v9 = (const void *)*((void *)this + 32);
    if (v9)
    {
      CFRelease(v9);
      *((void *)this + 32) = 0;
    }
    *((void *)this + 32) = SavageSafeRetain(a3);
  }
  if (CFStringCompare(theString, @"queryInfo", 0))
  {
    if (CFStringCompare(theString, @"performNextStage", 0))
    {
      CFDataRef v10 = CFStringGetCStringPtr(theString, 0);
      SavageUpdateController::SavageLog(this, "%s: Unsupported command: %s\n", "execCommand", v10);
LABEL_36:
      uint64_t Stage = 0;
      goto LABEL_37;
    }
    if (SavageUpdateController::getFirmware(this)
      || SavageUpdateController::getTSSResponse((CFDictionaryRef *)this))
    {
      goto LABEL_36;
    }
    uint64_t Stage = SavageUpdateController::eventCmdPerformNextStage(this, v14);
    unint64_t v15 = (const void *)*((void *)this + 33);
    if (v15)
    {
      CFRelease(v15);
      *((void *)this + 33) = 0;
    }
    if (!Stage)
    {
      if (!*((unsigned char *)this + 17)
        && !*((unsigned char *)this + 25)
        && !*((unsigned char *)this + 19)
        && !*((unsigned char *)this + 21)
        && !*((unsigned char *)this + 23)
        && !*((unsigned char *)this + 16))
      {
        *((unsigned char *)this + 249) = 1;
      }
      SavageUpdateController::SavageLog(this, "%s: isProvisioned=0x%llX; isNGIDProvisioned=0x%X \n",
        "execCommand",
        *(void *)(*((void *)this + 8) + 56),
        *(_DWORD *)(*((void *)this + 8) + 64));
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t Info = SavageUpdateController::eventCmdQueryInfo(this);
    if (Info)
    {
      uint64_t Stage = Info;
      goto LABEL_37;
    }
    if (*((unsigned char *)this + 253) != 1)
    {
LABEL_29:
      if (!a4) {
        goto LABEL_36;
      }
      goto LABEL_30;
    }
    SavageUpdateController::SavageLog(this, "%s: Fetching digest during SeaCookie pairing\n", "execCommand");
    if (SavageUpdateController::getTSSResponse((CFDictionaryRef *)this)) {
      goto LABEL_36;
    }
    int FirmwareDigest = SavageUpdateController::getFirmwareDigest(this);
    uint64_t Stage = 0;
    if (a4 && !FirmwareDigest)
    {
LABEL_30:
      CFStringRef v16 = (const void *)*((void *)this + 33);
      if (v16)
      {
        CFDictionaryRef v17 = (const __CFDictionary *)SavageSafeRetain(v16);
        *a4 = v17;
        CFStringRef v18 = CFCopyDescription(v17);
        CFTypeID v19 = CFStringGetCStringPtr(v18, 0);
        if (v19) {
          int v20 = v19;
        }
        else {
          int v20 = "No C string description available.";
        }
        SavageUpdateController::SavageLog(this, "%s [output]: %s %s \n", "execCommand", "output dictionary of execCommand", v20);
        if (v18) {
          CFRelease(v18);
        }
      }
      goto LABEL_36;
    }
  }
LABEL_37:
  CFStringRef v21 = CFStringGetCStringPtr(theString, 0);
  SavageUpdateController::SavageLog(this, "%s: Exiting execCommand: command = %s, uint64_t result = 0x%X, persoLoop = %d \n", "execCommand", v21, Stage, *((_DWORD *)this + 107));
  return Stage;
}

uint64_t SavageUpdateController::eventCmdQueryInfo(SavageUpdateController *this)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  *((void *)this + 33) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (*((unsigned char *)this + 16) == 1)
  {
    SavageUpdateController::SavageLog(this, "%s: Begin NGID Provisioning \n", "eventCmdQueryInfo");
    SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x263F90400], 1);
    SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x263F90408], 1);
    uint64_t DeviceInfoDict = SavageDevice::PreFusing(*((SavageDevice **)this + 8), *((_DWORD *)this + 106));
    if (!DeviceInfoDict)
    {
      SavageUpdateController::SavageLog(this, "%s: Finished pre NGID Provisioning \n");
      goto LABEL_25;
    }
    return DeviceInfoDict;
  }
  if (*((unsigned char *)this + 17) != 1)
  {
    if (*((unsigned char *)this + 19) == 1)
    {
      SavageUpdateController::SavageLog(this, "%s: Begin Certification \n", "eventCmdQueryInfo");
      SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x263F90400], 1);
      SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x263F90408], 1);
      SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x263F90410], 1);
      uint64_t DeviceInfoDict = SavageDevice::PreFusing(*((SavageDevice **)this + 8), *((_DWORD *)this + 106));
      if (DeviceInfoDict) {
        return DeviceInfoDict;
      }
      SavageUpdateController::SavageLog(this, "%s: Finished pre-certification \n");
      goto LABEL_25;
    }
    if (*((unsigned char *)this + 21) == 1)
    {
      SavageUpdateController::SavageLog(this, "%s: Begin Auth Flow \n", "eventCmdQueryInfo");
      SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x263F90400], 1);
      SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x263F90408], 1);
      SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x263F902A8], 1);
      int v4 = (__CFDictionary *)*((void *)this + 33);
      if (!*((unsigned char *)this + 254))
      {
        SavageCFDictionarySetBoolean(v4, (const void *)*MEMORY[0x263F90410], 1);
        uint64_t DeviceInfoDict = SavageDevice::PreFusing(*((SavageDevice **)this + 8), *((_DWORD *)this + 106));
        if (DeviceInfoDict) {
          return DeviceInfoDict;
        }
        SavageUpdateController::SavageLog(this, "%s: Finished pre-auth-flow \n");
        goto LABEL_25;
      }
      int v5 = "%s: Finished pre-auth-flow \n";
      int v6 = (const void **)MEMORY[0x263F90368];
    }
    else
    {
      if (*((unsigned char *)this + 23) == 1)
      {
        SavageUpdateController::SavageLog(this, "%s: Begin Wrapping \n", "eventCmdQueryInfo");
        SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x263F90408], 1);
        SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x263F902C8], 1);
        SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x263F90400], 1);
        uint64_t DeviceInfoDict = SavageDevice::PreFusing(*((SavageDevice **)this + 8), *((_DWORD *)this + 106));
        if (DeviceInfoDict) {
          return DeviceInfoDict;
        }
        SavageUpdateController::SavageLog(this, "%s: Finished pre-wrapping \n");
        goto LABEL_25;
      }
      if (*((unsigned char *)this + 25) != 1) {
        goto LABEL_25;
      }
      SavageUpdateController::SavageLog(this, "%s: Begin Personalization \n", "eventCmdQueryInfo");
      SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x263F90408], 1);
      SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x263F90368], 1);
      SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x263F90400], 1);
      uint64_t v7 = *((void *)this + 8);
      if (*(_DWORD *)(v7 + 112) < 0x5065u || !*(void *)(v7 + 56))
      {
        int v5 = "%s: Finished pre-personalizing \n";
        goto LABEL_24;
      }
      SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x263F902C0], 1);
      int v4 = (__CFDictionary *)*((void *)this + 33);
      int v5 = "%s: Finished pre-personalizing \n";
      int v6 = (const void **)MEMORY[0x263F902A8];
    }
    SavageCFDictionarySetBoolean(v4, *v6, 1);
LABEL_24:
    SavageUpdateController::SavageLog(this, v5, "eventCmdQueryInfo");
    goto LABEL_25;
  }
  SavageUpdateController::SavageLog(this, "%s: Begin Fusing \n", "eventCmdQueryInfo");
  SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x263F90428], 1);
  SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x263F90430], 1);
  SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x263F90408], 1);
  SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x263F90400], 1);
  uint64_t DeviceInfoDict = SavageDevice::PreFusing(*((SavageDevice **)this + 8), *((_DWORD *)this + 106));
  if (DeviceInfoDict) {
    return DeviceInfoDict;
  }
  SavageUpdateController::SavageLog(this, "%s: Finished pre-fusing \n");
LABEL_25:
  uint64_t DeviceInfoDict = SavageDevice::CreateDeviceInfoDict(*((SavageDevice **)this + 8), *((__CFDictionary **)this + 33));
  if (DeviceInfoDict) {
    return DeviceInfoDict;
  }
  if (*((unsigned char *)this + 252) != 1
    || *((unsigned char *)this + 251) != 1
    || (uint64_t v8 = *((void *)this + 8), !*(void *)(v8 + 56))
    || *((unsigned char *)this + 17)
    || *((unsigned char *)this + 19)
    || *((unsigned char *)this + 21)
    || *((unsigned char *)this + 23)
    || *((unsigned char *)this + 25) != 1)
  {
    CFDataRef v10 = 0;
  }
  else
  {
    if (*(unsigned char *)(v8 + 68)) {
      UInt8 v9 = -32;
    }
    else {
      UInt8 v9 = -16;
    }
    UInt8 bytes = v9;
    CFDataRef v10 = CFDataCreate(v2, &bytes, 1);
    CFDictionarySetValue(*((CFMutableDictionaryRef *)this + 33), (const void *)*MEMORY[0x263F90390], v10);
  }
  uint64_t v11 = *((void *)this + 8);
  if (*((unsigned char *)this + 251) == 1
    && !*(void *)(v11 + 56)
    && !*((unsigned char *)this + 17)
    && !*((unsigned char *)this + 19)
    && !*((unsigned char *)this + 21)
    && !*((unsigned char *)this + 23)
    && *((unsigned char *)this + 25) == 1
    && *((_DWORD *)this + 107) == 2)
  {
    *(unsigned char *)(v11 + 69) = *(unsigned char *)(v11 + 69) == 0;
  }
  SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x263F90388], *(unsigned __int8 *)(v11 + 69));
  uint64_t RelevantMeasurementTags = GetRelevantMeasurementTags(*((CFDictionaryRef *)this + 33), (void *)this + 37, (void *)this + 36);
  if (v10) {
    CFRelease(v10);
  }
  return RelevantMeasurementTags;
}

uint64_t SavageUpdateController::getTSSResponse(CFDictionaryRef *this)
{
  unsigned int v11 = 0;
  CFDictionaryGetValue(this[33], (const void *)*MEMORY[0x263F90378]);
  CFStringRef v2 = (const __CFString *)AMFDRCreateInstanceString();
  if (SavageCFStringToUInt32(v2, &v11, 16))
  {
    CFDictionaryRef v3 = this[32];
    if (v3)
    {
      if (v11 <= 0x5064) {
        int v4 = (const void **)MEMORY[0x263F90420];
      }
      else {
        int v4 = (const void **)MEMORY[0x263F902B0];
      }
      CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v3, *v4);
      if (Value && (CFDataRef v6 = Value, v7 = CFGetTypeID(Value), v7 == CFDataGetTypeID()))
      {
        BytePtr = CFDataGetBytePtr(v6);
        CFDataGetLength(v6);
        SavageUpdateController::getSignedCertificate((SavageUpdateController *)this, BytePtr);
        if (this[48]) {
          uint64_t v9 = 0;
        }
        else {
          uint64_t v9 = 3;
        }
      }
      else
      {
        uint64_t v9 = 10;
      }
    }
    else
    {
      uint64_t v9 = 2;
    }
  }
  else
  {
    uint64_t v9 = 11;
  }
  SavageUpdateController::SavageLog((SavageUpdateController *)this, "%s: - uint64_t result = 0x%08X (chipID = 0x%08X) \n", "getTSSResponse", v9, v11);
  if (v2) {
    CFRelease(v2);
  }
  return v9;
}

uint64_t SavageUpdateController::getFirmwareDigest(SavageUpdateController *this)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = *((void *)this + 46);
  int v3 = *(char *)(v2 + 1);
  if (v3 < 0)
  {
    unsigned int v5 = v3 & 0x7F;
    if (v5 >= 5) {
      SavageUpdateController::getFirmwareDigest();
    }
    unsigned int v4 = v5 + 29;
  }
  else
  {
    unsigned int v4 = 29;
  }
  if (*(unsigned __int8 *)(v2 + v4) != 135) {
    return 8;
  }
  if (*(unsigned char *)(v2 + v4 + 1) != 32) {
    return 8;
  }
  SavageUpdateController::SavageLog(this, "%s: Digest offset and length are correctly calculated \n", "getFirmwareDigest");
  MEMORY[0x270FA5388](v6, v7);
  uint64_t v8 = (_OWORD *)(*((void *)this + 46) + v4 + 2);
  long long v9 = v8[1];
  v13[0] = *v8;
  v13[1] = v9;
  CFDataRef v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)v13, 32);
  if (!v10) {
    return 8;
  }
  CFDataRef v11 = v10;
  CFDictionarySetValue(*((CFMutableDictionaryRef *)this + 33), (const void *)*MEMORY[0x263F903F0], v10);
  CFRelease(v11);
  return 0;
}

size_t SavageUpdateController::getFirmware(SavageUpdateController *this)
{
  CFDictionaryRef v2 = (const __CFDictionary *)*((void *)this + 32);
  if (!v2) {
    return 2;
  }
  CFDataRef Value = CFDictionaryGetValue(v2, (const void *)*MEMORY[0x263F90300]);
  if (!Value) {
    return 10;
  }
  unsigned int v4 = Value;
  CFTypeID v5 = CFGetTypeID(Value);
  if (v5 != CFDictionaryGetTypeID())
  {
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFDataGetTypeID())
    {
      SavageUpdateController::SavageLog(this, "%s: Savage firmware passed in as a data ref \n", "getFirmware");
      goto LABEL_8;
    }
    return 10;
  }
  SavageUpdateController::SavageLog(this, "%s: Savage firmware passed in as a dictionary \n", "getFirmware");
  unsigned int v4 = CFDictionaryGetValue((CFDictionaryRef)v4, (const void *)*MEMORY[0x263F902E8]);
  if (!v4) {
    return 10;
  }
LABEL_8:
  CFTypeID v7 = CFGetTypeID(v4);
  if (v7 != CFDataGetTypeID()) {
    return 10;
  }
  v17.location = 0;
  v17.length = 16;
  CFDataGetBytes((CFDataRef)v4, v17, (UInt8 *)this + 396);
  if (!*((_DWORD *)this + 99))
  {
    size_t v14 = *((unsigned int *)this + 100);
    if (!v14) {
      return 4;
    }
    unint64_t v15 = (UInt8 *)calloc(v14, 1uLL);
    *((void *)this + 38) = v15;
    if (v15)
    {
      v18.length = *((unsigned int *)this + 100);
      v18.location = 16;
      CFDataGetBytes((CFDataRef)v4, v18, v15);
      size_t result = *((unsigned int *)this + 101);
      if (!result) {
        return result;
      }
      CFStringRef v16 = (UInt8 *)calloc(result, 1uLL);
      *((void *)this + 39) = v16;
      if (v16)
      {
        CFDataRef v10 = v16;
        v12.location = *((unsigned int *)this + 100) + 16;
        v12.length = *((unsigned int *)this + 101);
        CFDataRef v11 = (const __CFData *)v4;
        goto LABEL_18;
      }
    }
    return 3;
  }
  *(void *)((char *)this + 396) = 0;
  *(void *)((char *)this + 404) = 0;
  unsigned int Length = CFDataGetLength((CFDataRef)v4);
  *((_DWORD *)this + 100) = Length;
  long long v9 = (UInt8 *)calloc(Length, 1uLL);
  *((void *)this + 38) = v9;
  if (!v9) {
    return 3;
  }
  CFDataRef v10 = v9;
  v12.length = *((unsigned int *)this + 100);
  CFDataRef v11 = (const __CFData *)v4;
  v12.location = 0;
LABEL_18:
  CFDataGetBytes(v11, v12, v10);
  return 0;
}

uint64_t SavageUpdateController::eventCmdPerformNextStage(SavageUpdateController *this, uint64_t a2)
{
  CFDictionaryRef v2 = (SavageUpdateController *)MEMORY[0x270FA5388](this, a2);
  int v3 = v2;
  uint64_t v32 = *MEMORY[0x263EF8340];
  int v30 = 0;
  if (*((unsigned char *)v2 + 16) == 1)
  {
    SavageUpdateController::SavageLog(v2, "%s: Begin actual NGID Provisioning \n", "eventCmdPerformNextStage");
    SavageDevice::CreateNGIDProvBlob(*((void *)v3 + 8), (UInt8 *)v3 + 72);
    CStringPtr = CFStringGetCStringPtr(*((CFStringRef *)v3 + 35), 0);
    int SavageProvisioningData = getSavageProvisioningData((uint64_t)CStringPtr, (long long *)((char *)v3 + 88), 56, (SavageUpdateController *)((char *)v3 + 72), 16, *((const void **)v3 + 46), *((unsigned int *)v3 + 94), (uint64_t)v3 + 144, (void *)v3 + 30, (SavageUpdateController *)((char *)v3 + 200), (void *)v3 + 28, (uint64_t)v3 + 216, (void *)v3 + 29);
    SavageUpdateController::SavageLog(v3, "%s: PearlStatus=%d, KCV=0x%x \n", "eventCmdPerformNextStage", SavageProvisioningData, *((_DWORD *)v3 + 54));
    SavageUpdateController::SavageLog(v3, "%s: NGID_d_e: \n", "eventCmdPerformNextStage");
    bzero(v31, 0x1000uLL);
    unint64_t v6 = 0;
    int v7 = 0;
    do
    {
      int v8 = snprintf(&v31[v7], 5uLL, " %02X ", *((unsigned __int8 *)v3 + v6 + 200));
      if (v6 > 0xE) {
        break;
      }
      v7 += v8;
      ++v6;
    }
    while (v7 < 4091);
    SavageUpdateController::SavageLog(v3, "%s \n", v31);
    SavageUpdateController::SavageLog(v3, "%s: KCV: \n", "eventCmdPerformNextStage");
    bzero(v31, 0x1000uLL);
    unint64_t v9 = 0;
    int v10 = 0;
    do
    {
      int v11 = snprintf(&v31[v10], 5uLL, " %02X ", *((unsigned __int8 *)v3 + v9 + 216));
      if (v9 > 1) {
        break;
      }
      v10 += v11;
      ++v9;
    }
    while (v10 < 4091);
    SavageUpdateController::SavageLog(v3, "%s \n", v31);
    SavageUpdateController::formatAndStitchFiles(v3);
    SavageDevice::Fusing(*((SavageDevice **)v3 + 8), *((_DWORD *)v3 + 106), *((const unsigned __int8 **)v3 + 52), *((_DWORD *)v3 + 103));
    checkSavageProvisioning(&v30);
    int v12 = v30;
    if (v30 == 1 || v30 == 4) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = 7;
    }
    *((unsigned char *)v3 + 16) = 0;
    SavageUpdateController::SavageLog(v3, "%s Tried NGID Provisioning...look for valid KCV in the ioreg (NGIDProvStatus = %d) \n", "eventCmdPerformNextStage", v12);
    return v14;
  }
  if (*((unsigned char *)v2 + 17) == 1)
  {
    SavageUpdateController::SavageLog(v2, "%s: Begin actual Fusing \n", "eventCmdPerformNextStage");
    SavageUpdateController::formatAndStitchFiles(v3);
    SavageDevice::Fusing(*((SavageDevice **)v3 + 8), *((_DWORD *)v3 + 106), *((const unsigned __int8 **)v3 + 52), *((_DWORD *)v3 + 103));
    uint64_t v15 = *(void *)(*((void *)v3 + 8) + 56);
    int v16 = -536870167;
    if (v15) {
      int v16 = 0;
    }
    SavageUpdateController::SavageLog(v3, "%s: Finished fusing with size_t result = 0x%02X (tryAgain = %d) \n", "eventCmdPerformNextStage", v16, *((unsigned __int8 *)v3 + 18));
    int v17 = *((unsigned __int8 *)v3 + 18);
    if (v15)
    {
      *((unsigned char *)v3 + 17) = 0;
      if (!v17) {
        return 0;
      }
    }
    else if (!*((unsigned char *)v3 + 18))
    {
      uint64_t v14 = 3758097129;
      *((unsigned char *)v3 + 17) = 0;
      return v14;
    }
    uint64_t v14 = 0;
    *((unsigned char *)v3 + 18) = 0;
    return v14;
  }
  if (*((unsigned char *)v2 + 19) == 1)
  {
    SavageUpdateController::SavageLog(v2, "%s Begin reading info needed for certification \n", "eventCmdPerformNextStage");
    SavageUpdateController::formatAndStitchFiles(v3);
    SavageDevice::Fusing(*((SavageDevice **)v3 + 8), *((_DWORD *)v3 + 106), *((const unsigned __int8 **)v3 + 52), *((_DWORD *)v3 + 103));
    uint64_t v18 = *(void *)(*((void *)v3 + 8) + 72);
    int v19 = -536870167;
    if (v18) {
      int v19 = 0;
    }
    SavageUpdateController::SavageLog(v3, "%s: Extracting certification data is done with size_t result = 0x%02X (tryAgain = %d) \n", "eventCmdPerformNextStage", v19, *((unsigned __int8 *)v3 + 20));
    int v20 = *((unsigned __int8 *)v3 + 20);
    if (v18)
    {
      *((unsigned char *)v3 + 19) = 0;
      if (!v20) {
        return 0;
      }
    }
    else if (!*((unsigned char *)v3 + 20))
    {
      uint64_t v14 = 3758097129;
      *((unsigned char *)v3 + 19) = 0;
      return v14;
    }
    uint64_t v14 = 0;
    *((unsigned char *)v3 + 20) = 0;
    return v14;
  }
  if (*((unsigned char *)v2 + 21) != 1)
  {
    if (*((unsigned char *)v2 + 23) != 1)
    {
      if (*((unsigned char *)v2 + 25) == 1)
      {
        SavageUpdateController::formatAndStitchFiles(v2);
        SavageUpdateController::writeFilesToFileSystem(v3);
        if (*((unsigned char *)v3 + 26) == 1)
        {
          *((unsigned char *)v3 + 26) = 0;
        }
        else if (!*((unsigned char *)v3 + 26))
        {
          --*((_DWORD *)v3 + 107);
        }
        if (!*((_DWORD *)v3 + 107))
        {
          *((unsigned char *)v3 + 25) = 0;
          SavageUpdateController::SavageLog(v3, "%s: Finished Personalization \n", "eventCmdPerformNextStage");
        }
      }
      return 0;
    }
    SavageUpdateController::SavageLog(v2, "SavageUpdateController::eventCmdPerformNextStage: Begin actual wrapping live nonce boot \n");
    if (!*(unsigned char *)(*((void *)v3 + 8) + 18))
    {
      SavageUpdateController::SavageLog(v3, "%s: Missing FDRDataEncryptionKey in ioreg \n", "eventCmdPerformNextStage");
      return 3758097136;
    }
    SavageUpdateController::SavageLog(v3, "%s: Picked up FDRDataEncryptionKey as wrap input key \n", "eventCmdPerformNextStage");
    SavageUpdateController::formatAndStitchFiles(v3);
    SavageDevice::Fusing(*((SavageDevice **)v3 + 8), *((_DWORD *)v3 + 106), *((const unsigned __int8 **)v3 + 52), *((_DWORD *)v3 + 103));
    uint64_t v24 = *(void *)(*((void *)v3 + 8) + 96);
    int v25 = -536870167;
    if (v24) {
      int v25 = 0;
    }
    SavageUpdateController::SavageLog(v3, "%s: Finished wrapping: 0x%02llx (size_t result = 0x%02X; tryAgain = %d) \n",
      "eventCmdPerformNextStage",
      v24,
      v25,
      *((unsigned __int8 *)v3 + 24));
    int v26 = *((unsigned __int8 *)v3 + 24);
    if (v24)
    {
      *((unsigned char *)v3 + 23) = 0;
      if (!v26) {
        return 0;
      }
    }
    else if (!*((unsigned char *)v3 + 24))
    {
      uint64_t v14 = 3758097129;
      *((unsigned char *)v3 + 23) = 0;
      return v14;
    }
    uint64_t v14 = 0;
    *((unsigned char *)v3 + 24) = 0;
    return v14;
  }
  SavageUpdateController::SavageLog(v2, "%s: Begin reading info needed for auth flow \n", "eventCmdPerformNextStage");
  if (*((unsigned char *)v3 + 254) || !*(void *)(*((void *)v3 + 8) + 80))
  {
    SavageUpdateController::formatAndStitchFiles(v3);
    CFStringRef v21 = (SavageDevice *)*((void *)v3 + 8);
    unsigned int v22 = *((_DWORD *)v3 + 106);
    uint64_t v23 = (const unsigned __int8 *)*((void *)v3 + 52);
    if (*((unsigned char *)v3 + 254)) {
      SavageDevice::AuthFlow(v21, v22, v23);
    }
    else {
      SavageDevice::Fusing(v21, v22, v23, *((_DWORD *)v3 + 103));
    }
  }
  else
  {
    SavageUpdateController::getAuthChallenge((CFDictionaryRef *)v3);
  }
  if (*(void *)(*((void *)v3 + 8) + 88))
  {
    uint64_t v28 = (char *)v3 + 22;
    int v27 = *((unsigned __int8 *)v3 + 22);
    if (*((_DWORD *)v3 + 108) == 1)
    {
      SavageUpdateController::SavageLog(v3, "%s: Extracting auth certification data is done with size_t result = 0x%02X (authFlowLoop = %d, tryAgain = %d) \n", "eventCmdPerformNextStage", 0, 1, v27);
      uint64_t v14 = 0;
LABEL_55:
      *((unsigned char *)v3 + 21) = 0;
      goto LABEL_56;
    }
  }
  else
  {
    uint64_t v28 = (char *)v3 + 22;
    int v27 = *((unsigned __int8 *)v3 + 22);
  }
  uint64_t v14 = 3758097129;
  SavageUpdateController::SavageLog(v3, "%s: Extracting auth certification data is done with size_t result = 0x%02X (authFlowLoop = %d, tryAgain = %d) \n", "eventCmdPerformNextStage", -536870167, *((_DWORD *)v3 + 108), v27);
  if (!*((_DWORD *)v3 + 108)) {
    goto LABEL_55;
  }
LABEL_56:
  if (*(void *)(*((void *)v3 + 8) + 88)) {
    --*((_DWORD *)v3 + 108);
  }
  if (*v28)
  {
    uint64_t v14 = 0;
    *uint64_t v28 = 0;
  }
  return v14;
}

void SavageUpdateController::writeFilesToFileSystem(SavageUpdateController *this)
{
  SavageUpdateController::SavageLog(this, "%s: persoLoop=%d, isProd=%d, isBalan=%d\n", "writeFilesToFileSystem", *((_DWORD *)this + 107), *(unsigned __int8 *)(*((void *)this + 8) + 69), *(unsigned __int8 *)(*((void *)this + 8) + 68));
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  int v3 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  CFArrayAppendValue(Mutable, *((const void **)this + 34));
  CFTypeID v5 = CFArrayCreateMutable(v2, 0, v3);
  CFArrayAppendValue(v5, *((const void **)this + 34));
  unint64_t v6 = CFArrayCreateMutable(v2, 0, v3);
  CFArrayAppendValue(v6, *((const void **)this + 34));
  int v7 = CFArrayCreateMutable(v2, 0, v3);
  CFArrayAppendValue(v7, *((const void **)this + 34));
  int v8 = CFArrayCreateMutable(v2, 0, v3);
  CFArrayAppendValue(v8, *((const void **)this + 34));
  unint64_t v9 = CFArrayCreateMutable(v2, 0, v3);
  CFArrayAppendValue(v9, *((const void **)this + 34));
  int v10 = CFArrayCreateMutable(v2, 0, v3);
  CFArrayAppendValue(v10, *((const void **)this + 34));
  CFArrayAppendValue(v10, *((const void **)this + 37));
  int v11 = CFArrayCreateMutable(v2, 0, v3);
  CFArrayAppendValue(v11, *((const void **)this + 34));
  CFArrayAppendValue(v11, *((const void **)this + 36));
  cf = Mutable;
  CFArrayRef v63 = v11;
  CFArrayRef v64 = v10;
  CFRange v62 = v8;
  if (*((unsigned char *)this + 17) == 1)
  {
    CFArrayAppendValue(Mutable, @"/SavagePatchFusing.DAT");
    CFArrayAppendValue(v5, @"/SavageLeafCertFusing.DER");
    CFArrayAppendValue(v6, @"/SavageLeafSigFusing.DER");
    CFArrayAppendValue(v7, @"/SavagePatchFusing.DER");
    CFArrayAppendValue(v8, @"/SavageFirmwareSigFusing.DER");
    CFArrayAppendValue(v9, @"/SavageFullCertFusing.DER");
    CFArrayRef v12 = v9;
    CFArrayRef v13 = v7;
    goto LABEL_11;
  }
  if (*((unsigned char *)this + 19) == 1)
  {
    CFArrayAppendValue(Mutable, @"/SavagePatchCertification.DAT");
    CFArrayAppendValue(v5, @"/SavageLeafCertCertification.DER");
    CFArrayAppendValue(v6, @"/SavageLeafSigCertification.DER");
    CFArrayRef v13 = v7;
    CFArrayAppendValue(v7, @"/SavagePatchCertification.DER");
    CFArrayAppendValue(v8, @"/SavageFirmwareSigCertification.DER");
    uint64_t v14 = @"/SavageFullCertCertification.DER";
LABEL_9:
    CFArrayRef v12 = v9;
    uint64_t v15 = v9;
LABEL_10:
    CFArrayAppendValue(v15, v14);
    goto LABEL_11;
  }
  if (*((unsigned char *)this + 21) == 1)
  {
    CFArrayAppendValue(Mutable, @"/SavagePatchAuthCertification.DAT");
    CFArrayAppendValue(v5, @"/SavageLeafCertAuthCertification.DER");
    CFArrayAppendValue(v6, @"/SavageLeafSigAuthCertification.DER");
    CFArrayRef v13 = v7;
    CFArrayAppendValue(v7, @"/SavagePatchAuthCertification.DER");
    CFArrayAppendValue(v8, @"/SavageFirmwareSigAuthCertification.DER");
    uint64_t v14 = @"/SavageFullCertAuthCertification.DER";
    goto LABEL_9;
  }
  if (*((unsigned char *)this + 23) == 1)
  {
    CFArrayAppendValue(Mutable, @"/SavagePatchWrap.DAT");
    CFArrayAppendValue(v5, @"/SavageLeafCertWrap.DER");
    CFArrayAppendValue(v6, @"/SavageLeafSigWrap.DER");
    CFArrayRef v13 = v7;
    CFArrayAppendValue(v7, @"/SavagePatchWrap.DER");
    CFArrayAppendValue(v8, @"/SavageFirmwareSigWrap.DER");
    uint64_t v14 = @"/SavageFullCertWrap.DER";
    goto LABEL_9;
  }
  CFArrayRef v12 = v9;
  CFArrayRef v13 = v7;
  if (*((unsigned char *)this + 25) == 1)
  {
    uint64_t v31 = *((void *)this + 8);
    if (*(void *)(v31 + 56))
    {
      CFArrayAppendValue(Mutable, @"/SavagePatch.DAT");
      CFArrayAppendValue(v5, @"/SavageLeafCert.DER");
      CFArrayAppendValue(v6, @"/SavageLeafSig.DER");
      CFArrayRef v13 = v7;
      CFArrayAppendValue(v7, @"/SavagePatch.DER");
      CFArrayAppendValue(v8, @"/SavageFirmwareSig.DER");
      uint64_t v14 = @"/SavageFullCert.DER";
      uint64_t v15 = v9;
      goto LABEL_10;
    }
    if (*(unsigned char *)(v31 + 68)) {
      uint64_t v32 = "BA";
    }
    else {
      uint64_t v32 = "B3";
    }
    if (*(unsigned char *)(v31 + 69)) {
      unsigned int v33 = "Prod";
    }
    else {
      unsigned int v33 = "Dev";
    }
    CFStringRef v34 = CFStringCreateWithFormat(v2, 0, @"/SavagePatch%s%s.DAT", v32, v33);
    CFArrayAppendValue(Mutable, v34);
    if (v34) {
      CFRelease(v34);
    }
    uint64_t v35 = *((void *)this + 8);
    CFTypeID v36 = "B3";
    if (*(unsigned char *)(v35 + 68)) {
      CFTypeID v36 = "BA";
    }
    if (*(unsigned char *)(v35 + 69)) {
      uint64_t v37 = "Prod";
    }
    else {
      uint64_t v37 = "Dev";
    }
    CFStringRef v38 = CFStringCreateWithFormat(v2, 0, @"/SavageLeafCert%s%s.DER", v36, v37);
    CFArrayAppendValue(v5, v38);
    if (v38) {
      CFRelease(v38);
    }
    uint64_t v39 = *((void *)this + 8);
    uint64_t v40 = "B3";
    if (*(unsigned char *)(v39 + 68)) {
      uint64_t v40 = "BA";
    }
    if (*(unsigned char *)(v39 + 69)) {
      uint64_t v41 = "Prod";
    }
    else {
      uint64_t v41 = "Dev";
    }
    CFStringRef v42 = CFStringCreateWithFormat(v2, 0, @"/SavageLeafSig%s%s.DER", v40, v41);
    CFArrayAppendValue(v6, v42);
    if (v42) {
      CFRelease(v42);
    }
    uint64_t v43 = *((void *)this + 8);
    uint64_t v44 = "B3";
    if (*(unsigned char *)(v43 + 68)) {
      uint64_t v44 = "BA";
    }
    if (*(unsigned char *)(v43 + 69)) {
      CFStringRef v45 = "Prod";
    }
    else {
      CFStringRef v45 = "Dev";
    }
    CFStringRef v46 = CFStringCreateWithFormat(v2, 0, @"/SavagePatch%s%s.DER", v44, v45);
    CFArrayAppendValue(v7, v46);
    if (v46) {
      CFRelease(v46);
    }
    uint64_t v47 = *((void *)this + 8);
    CFStringRef v48 = "B3";
    if (*(unsigned char *)(v47 + 68)) {
      CFStringRef v48 = "BA";
    }
    if (*(unsigned char *)(v47 + 69)) {
      CFTypeID v49 = "Prod";
    }
    else {
      CFTypeID v49 = "Dev";
    }
    CFStringRef v50 = CFStringCreateWithFormat(v2, 0, @"/SavageFirmwareSig%s%s.DER", v48, v49);
    CFArrayAppendValue(v8, v50);
    if (v50) {
      CFRelease(v50);
    }
    uint64_t v51 = *((void *)this + 8);
    CFStringRef v52 = "B3";
    if (*(unsigned char *)(v51 + 68)) {
      CFStringRef v52 = "BA";
    }
    if (*(unsigned char *)(v51 + 69)) {
      CFTypeID v53 = "Prod";
    }
    else {
      CFTypeID v53 = "Dev";
    }
    CFStringRef v54 = CFStringCreateWithFormat(v2, 0, @"/SavageFullCert%s%s.DER", v52, v53);
    CFArrayRef v12 = v9;
    CFArrayAppendValue(v9, v54);
    CFStringRef v55 = v54;
    CFArrayRef v13 = v7;
    if (v55) {
      CFRelease(v55);
    }
  }
LABEL_11:
  CFStringRef theString = CFStringCreateByCombiningStrings(v2, Mutable, &stru_26E2BCFF0);
  uint64_t v59 = v5;
  CFStringRef v16 = CFStringCreateByCombiningStrings(v2, v5, &stru_26E2BCFF0);
  int v60 = v6;
  CFStringRef v17 = CFStringCreateByCombiningStrings(v2, v6, &stru_26E2BCFF0);
  CFArrayRef v57 = v13;
  CFStringRef v18 = CFStringCreateByCombiningStrings(v2, v13, &stru_26E2BCFF0);
  CFStringRef v19 = CFStringCreateByCombiningStrings(v2, v8, &stru_26E2BCFF0);
  CFArrayRef v58 = v12;
  CFStringRef v20 = CFStringCreateByCombiningStrings(v2, v12, &stru_26E2BCFF0);
  CFStringRef v21 = CFStringCreateByCombiningStrings(v2, v64, &stru_26E2BCFF0);
  CFStringRef v22 = CFStringCreateByCombiningStrings(v2, v63, &stru_26E2BCFF0);
  CStringPtr = CFStringGetCStringPtr(v21, 0);
  SavageUpdateController::SavageLog(this, "%s: %s (%d)\n", "writeFilesToFileSystem", CStringPtr, *((_DWORD *)this + 100));
  SavageUpdateController::writeDataToFileURL(this, *((unsigned __int8 **)this + 38), *((unsigned int *)this + 100), v21);
  uint64_t v24 = CFStringGetCStringPtr(v22, 0);
  SavageUpdateController::SavageLog(this, "%s: %s (%d)\n", "writeFilesToFileSystem", v24, *((_DWORD *)this + 101));
  SavageUpdateController::writeDataToFileURL(this, *((unsigned __int8 **)this + 39), *((unsigned int *)this + 101), v22);
  int v25 = CFStringGetCStringPtr(v16, 0);
  SavageUpdateController::SavageLog(this, "%s: %s (%d)\n", "writeFilesToFileSystem", v25, *((_DWORD *)this + 82));
  SavageUpdateController::writeDataToFileURL(this, *((unsigned __int8 **)this + 40), *((unsigned int *)this + 82), v16);
  int v26 = CFStringGetCStringPtr(v17, 0);
  SavageUpdateController::SavageLog(this, "%s: %s (%d)\n", "writeFilesToFileSystem", v26, *((_DWORD *)this + 86));
  SavageUpdateController::writeDataToFileURL(this, *((unsigned __int8 **)this + 42), *((unsigned int *)this + 86), v17);
  int v27 = CFStringGetCStringPtr(v19, 0);
  SavageUpdateController::SavageLog(this, "%s: %s (%d)\n", "writeFilesToFileSystem", v27, *((_DWORD *)this + 90));
  SavageUpdateController::writeDataToFileURL(this, *((unsigned __int8 **)this + 44), *((unsigned int *)this + 90), v19);
  uint64_t v28 = CFStringGetCStringPtr(v18, 0);
  SavageUpdateController::SavageLog(this, "%s: %s (%d)\n", "writeFilesToFileSystem", v28, *((_DWORD *)this + 94));
  SavageUpdateController::writeDataToFileURL(this, *((unsigned __int8 **)this + 46), *((unsigned int *)this + 94), v18);
  uint64_t v29 = CFStringGetCStringPtr(v20, 0);
  SavageUpdateController::SavageLog(this, "%s: %s (%d)\n", "writeFilesToFileSystem", v29, *((_DWORD *)this + 103));
  SavageUpdateController::writeDataToFileURL(this, *((unsigned __int8 **)this + 48), *((unsigned int *)this + 98), v20);
  int v30 = CFStringGetCStringPtr(theString, 0);
  SavageUpdateController::SavageLog(this, "%s: %s (%d)\n", "writeFilesToFileSystem", v30, *((_DWORD *)this + 103));
  SavageUpdateController::writeDataToFileURL(this, *((unsigned __int8 **)this + 52), *((unsigned int *)this + 103), theString);
  if (theString) {
    CFRelease(theString);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v18) {
    CFRelease(v18);
  }
  if (v57) {
    CFRelease(v57);
  }
  if (v16) {
    CFRelease(v16);
  }
  if (v59) {
    CFRelease(v59);
  }
  if (v17) {
    CFRelease(v17);
  }
  if (v60) {
    CFRelease(v60);
  }
  if (v19) {
    CFRelease(v19);
  }
  if (v62) {
    CFRelease(v62);
  }
  if (v20) {
    CFRelease(v20);
  }
  if (v58) {
    CFRelease(v58);
  }
  if (v21) {
    CFRelease(v21);
  }
  if (v64) {
    CFRelease(v64);
  }
  if (v22) {
    CFRelease(v22);
  }
  if (v63)
  {
    CFRelease(v63);
  }
}

void SavageUpdateController::getSignedCertificate(SavageUpdateController *this, const unsigned __int8 *a2)
{
  uint64_t v2 = MEMORY[0x270FA5388](this, a2);
  unsigned int v4 = v3;
  uint64_t v5 = v2;
  uint64_t v51 = *MEMORY[0x263EF8340];
  *(void *)(v2 + 384) = 0;
  *(_DWORD *)(v2 + 392) = 0;
  *(void *)(v2 + 320) = 0;
  *(_DWORD *)(v2 + 328) = 0;
  *(void *)(v2 + 336) = 0;
  *(_DWORD *)(v2 + 344) = 0;
  *(void *)(v2 + 368) = 0;
  *(_DWORD *)(v2 + 376) = 0;
  *(void *)(v2 + 352) = 0;
  *(_DWORD *)(v2 + 360) = 0;
  if ((char)v3[1] < 0)
  {
    uint64_t v7 = v3[1] & 0x7F;
    if (v7 > 4) {
      SavageUpdateController::getSignedCertificate();
    }
    if ((v3[1] & 0x7F) != 0)
    {
      uint64_t v8 = 0;
      int v9 = 0;
      int v10 = v3 + 2;
      do
      {
        int v11 = *v10++;
        int v9 = (v9 << v8) | v11;
        *(_DWORD *)(v2 + 328) = v9;
        v8 += 8;
      }
      while (8 * v7 != v8);
    }
    else
    {
      int v9 = 0;
    }
    int v6 = v7 + v9;
  }
  else
  {
    int v6 = v3[1];
  }
  unsigned int v12 = v6 + 2;
  *(_DWORD *)(v2 + 328) = v12;
  CFArrayRef v13 = calloc(v12, 1uLL);
  *(void *)(v5 + 320) = v13;
  memcpy(v13, v4, *(unsigned int *)(v5 + 328));
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "LeafCertificate:--------------offset = %d (%d)\n", 0, *(_DWORD *)(v5 + 328));
  bzero(v50, 0x1000uLL);
  if (*(_DWORD *)(v5 + 328))
  {
    unint64_t v14 = 0;
    for (int i = 0; i < 4091; i += v16)
    {
      int v16 = snprintf(&v50[i], 5uLL, " %02X ", *(unsigned __int8 *)(*(void *)(v5 + 320) + v14++));
      if (v14 >= *(unsigned int *)(v5 + 328)) {
        break;
      }
    }
  }
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "%s \n", v50);
  uint64_t v17 = *(unsigned int *)(v5 + 328);
  *(_DWORD *)(v5 + 344) = v4[(v17 + 1)] + 2;
  CFStringRef v18 = calloc(0x40uLL, 1uLL);
  *(void *)(v5 + 336) = v18;
  memcpy(v18, &v4[v17], *(unsigned int *)(v5 + 344));
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "LeafSignature(Pre-validation):--------------offset = %d (%d)\n", v17, *(_DWORD *)(v5 + 344));
  bzero(v50, 0x1000uLL);
  if (*(_DWORD *)(v5 + 344))
  {
    unint64_t v19 = 0;
    for (int j = 0; j < 4091; j += v21)
    {
      int v21 = snprintf(&v50[j], 5uLL, " %02X ", *(unsigned __int8 *)(*(void *)(v5 + 336) + v19++));
      if (v19 >= *(unsigned int *)(v5 + 344)) {
        break;
      }
    }
  }
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "%s \n", v50);
  SavageUpdateController::validateSignatureLen((SavageUpdateController *)v5, *(unsigned __int8 **)(v5 + 336), (unsigned int *)(v5 + 344));
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "LeafSignature(Post-validation):--------------offset = %d (%d)\n", v17, *(_DWORD *)(v5 + 344));
  bzero(v50, 0x1000uLL);
  if (*(_DWORD *)(v5 + 344))
  {
    unint64_t v22 = 0;
    for (int k = 0; k < 4091; k += v24)
    {
      int v24 = snprintf(&v50[k], 5uLL, " %02X ", *(unsigned __int8 *)(*(void *)(v5 + 336) + v22++));
      if (v22 >= *(unsigned int *)(v5 + 344)) {
        break;
      }
    }
  }
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "%s \n", v50);
  int v25 = *(_DWORD *)(v5 + 344);
  int v26 = v25 + v17;
  if ((char)v4[(v25 + v17 + 1)] < 0)
  {
    uint64_t v28 = v4[(v25 + v17 + 1)] & 0x7F;
    if (v28 >= 5) {
      SavageUpdateController::getSignedCertificate();
    }
    *(_DWORD *)(v5 + 376) = 0;
    if (v28)
    {
      uint64_t v29 = 0;
      int v30 = 0;
      int v31 = v25 + v17 + 2;
      do
      {
        int v30 = (v30 << v29) | v4[v31];
        *(_DWORD *)(v5 + 376) = v30;
        ++v31;
        v29 += 8;
      }
      while (8 * v28 != v29);
    }
    else
    {
      int v30 = 0;
    }
    int v27 = v28 + v30;
  }
  else
  {
    int v27 = v4[(v25 + v17 + 1)];
  }
  unsigned int v32 = v27 + 2;
  *(_DWORD *)(v5 + 376) = v32;
  unsigned int v33 = calloc(v32, 1uLL);
  *(void *)(v5 + 368) = v33;
  memcpy(v33, &v4[v26], *(unsigned int *)(v5 + 376));
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "FirmwareCertificate:--------------offset = %d (%d)\n", v26, *(_DWORD *)(v5 + 376));
  bzero(v50, 0x1000uLL);
  if (*(_DWORD *)(v5 + 376))
  {
    unint64_t v34 = 0;
    for (int m = 0; m < 4091; m += v36)
    {
      int v36 = snprintf(&v50[m], 5uLL, " %02X ", *(unsigned __int8 *)(*(void *)(v5 + 368) + v34++));
      if (v34 >= *(unsigned int *)(v5 + 376)) {
        break;
      }
    }
  }
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "%s \n", v50);
  uint64_t v37 = (*(_DWORD *)(v5 + 376) + v26);
  *(_DWORD *)(v5 + 360) = v4[(v37 + 1)] + 2;
  CFStringRef v38 = calloc(0x40uLL, 1uLL);
  *(void *)(v5 + 352) = v38;
  memcpy(v38, &v4[v37], *(unsigned int *)(v5 + 360));
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "FirmwareSignature (Pre-validation):--------------offset = %d (%d)\n", v37, *(_DWORD *)(v5 + 360));
  bzero(v50, 0x1000uLL);
  if (*(_DWORD *)(v5 + 360))
  {
    unint64_t v39 = 0;
    for (int n = 0; n < 4091; n += v41)
    {
      int v41 = snprintf(&v50[n], 5uLL, " %02X ", *(unsigned __int8 *)(*(void *)(v5 + 352) + v39++));
      if (v39 >= *(unsigned int *)(v5 + 360)) {
        break;
      }
    }
  }
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "%s \n", v50);
  SavageUpdateController::validateSignatureLen((SavageUpdateController *)v5, *(unsigned __int8 **)(v5 + 352), (unsigned int *)(v5 + 360));
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "FirmwareSignature (Post-validation):--------------offset = %d (%d)\n", v37, *(_DWORD *)(v5 + 360));
  bzero(v50, 0x1000uLL);
  if (*(_DWORD *)(v5 + 360))
  {
    unint64_t v42 = 0;
    for (iint i = 0; ii < 4091; ii += v44)
    {
      int v44 = snprintf(&v50[ii], 5uLL, " %02X ", *(unsigned __int8 *)(*(void *)(v5 + 352) + v42++));
      if (v42 >= *(unsigned int *)(v5 + 360)) {
        break;
      }
    }
  }
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "%s \n", v50);
  size_t v45 = (*(_DWORD *)(v5 + 344) + *(_DWORD *)(v5 + 328) + *(_DWORD *)(v5 + 376) + *(_DWORD *)(v5 + 360));
  *(_DWORD *)(v5 + 392) = v45;
  CFStringRef v46 = calloc(v45, 1uLL);
  *(void *)(v5 + 384) = v46;
  memcpy(v46, *(const void **)(v5 + 320), *(unsigned int *)(v5 + 328));
  memcpy((void *)(*(void *)(v5 + 384) + *(unsigned int *)(v5 + 328)), *(const void **)(v5 + 336), *(unsigned int *)(v5 + 344));
  memcpy((void *)(*(void *)(v5 + 384) + *(unsigned int *)(v5 + 328) + *(unsigned int *)(v5 + 344)), *(const void **)(v5 + 368), *(unsigned int *)(v5 + 376));
  memcpy((void *)(*(void *)(v5 + 384)+ *(unsigned int *)(v5 + 328)+ *(unsigned int *)(v5 + 344)+ (unint64_t)*(unsigned int *)(v5 + 376)), *(const void **)(v5 + 352), *(unsigned int *)(v5 + 360));
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "Complete Signed Savage Certificate:--------------unsigned int Length = %d \n", *(_DWORD *)(v5 + 392));
  bzero(v50, 0x1000uLL);
  if (*(_DWORD *)(v5 + 392))
  {
    unint64_t v47 = 0;
    for (jint j = 0; jj < 4091; jj += v49)
    {
      int v49 = snprintf(&v50[jj], 5uLL, " %02X ", *(unsigned __int8 *)(*(void *)(v5 + 384) + v47++));
      if (v47 >= *(unsigned int *)(v5 + 392)) {
        break;
      }
    }
  }
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "%s \n", v50);
}

void SavageUpdateController::validateSignatureLen(SavageUpdateController *this, unsigned __int8 *a2, unsigned int *a3)
{
  unsigned __int8 v6 = a2[1];
  uint64_t v7 = a2[3];
  SavageUpdateController::SavageLog(this, "\n SavageUpdateController::validateSignatureLen -- r length = %d \n", a2[3]);
  if ((v7 - 30) <= 0xE2u) {
    SavageUpdateController::validateSignatureLen();
  }
  if (v7 <= 0x1B)
  {
    size_t v8 = 28 - v7;
    SavageUpdateController::SavageLog(this, "\n SavageUpdateController::validateSignatureLen -- Padding the r value with %d zero bytes \n", v8);
    memmove(&a2[v8 + 4], a2 + 4, *a3 - 4);
    bzero(a2 + 4, v8);
    a2[3] = 28;
    v6 += v8;
    *a3 += v8;
  }
  unsigned __int8 v9 = a2[3] + 5;
  int v10 = &a2[v9];
  uint64_t v11 = *v10;
  SavageUpdateController::SavageLog(this, "\n SavageUpdateController::validateSignatureLen -- s length = %d \n", *v10);
  if ((v11 - 30) <= 0xE2u) {
    SavageUpdateController::validateSignatureLen();
  }
  if (v11 <= 0x1B)
  {
    size_t v12 = 28 - v11;
    SavageUpdateController::SavageLog(this, "\n SavageUpdateController::validateSignatureLen -- Padding the s value with %d zero bytes \n", v12);
    memmove(&v10[v12 + 1], v10 + 1, *a3 + ~v9);
    bzero(&a2[v9 + 1], v12);
    a2[v9] = 28;
    v6 += v12;
    *a3 += v12;
  }
  a2[1] = v6;
}

void SavageUpdateController::writeDataToFileURL(SavageUpdateController *this, unsigned __int8 *a2, CFIndex length, const __CFString *a4)
{
  CFDataRef v6 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, length);
  CFURLRef v7 = CFURLCreateWithFileSystemPath(0, a4, kCFURLPOSIXPathStyle, 0);
  if (MEMORY[0x230FB83A0]()) {
    SavageUpdateController::SavageLog(this, "%s: AMSupportMakeDirectory failed with fileNameFS \n", "writeDataToFileURL");
  }
  if (AMSupportWriteDataToFileURL()) {
    SavageUpdateController::SavageLog(this, "%s: AMSupportWriteDataToFileURL failed with fileNameFS \n", "writeDataToFileURL");
  }
  AMSupportPlatformFileURLExists();
  SavageUpdateController::SavageLog(this, "%s: File does not exist\n", "writeDataToFileURL");
  if (v6) {
    CFRelease(v6);
  }
  if (v7) {
    CFRelease(v7);
  }
}

CFStringRef SavageUpdaterCreate(SavageUpdateController *a1, void *a2, const __CFDictionary *a3, CFTypeRef *a4)
{
  if (SavageUpdaterCreate::only_once != -1) {
    dispatch_once(&SavageUpdaterCreate::only_once, &__block_literal_global);
  }
  if (!SavageUpdaterTypeID)
  {
    CFStringRef v18 = "SavageUpdaterCreate - failed to register kLibSavageUpdaterClass";
    goto LABEL_13;
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (!Instance)
  {
    CFStringRef v18 = "SavageUpdaterCreate - failed to create SavageUpdaterObj";
LABEL_13:
    CFErrorWithDomaiint n = (const __CFString *)createCFErrorWithDomain((uint64_t)v18, 3u, (uint64_t)a1, @"SavageErrorDomain");
    if (!CFErrorWithDomain) {
      return 0;
    }
    goto LABEL_19;
  }
  CFStringRef v10 = (const __CFString *)Instance;
  uint64_t v11 = SavageUpdaterTypeID;
  *(void *)(Instance + 16) = 0;
  *(void *)(Instance + 24) = v11;
  uint64_t v12 = SavageUpdateController::getInstance(a1, a3, a2, v9);
  v10[1].isa = (void *)v12;
  if (!v12)
  {
    unint64_t v19 = "SavageUpdaterCreate - no savage controller instance";
    CFStringRef v20 = (const __CFString **)&kSavageErrorDomain;
LABEL_17:
    CFErrorRef v21 = createCFErrorWithDomain((uint64_t)v19, 0x10u, (uint64_t)a1, *v20);
    if (!v21) {
      return v10;
    }
    CFErrorWithDomaiint n = (const __CFString *)v21;
    CFRelease(v10);
LABEL_19:
    CFStringRef v10 = 0;
    if (a4) {
      *a4 = SavageSafeRetain(CFErrorWithDomain);
    }
    goto LABEL_9;
  }
  uint64_t v14 = YonkersUpdateController::getInstance(a1, a3, a2, v13);
  v10[1].info = v14;
  if (!v14)
  {
    unint64_t v19 = "SavageUpdaterCreate - no yonkers controller instance";
    CFStringRef v20 = (const __CFString **)&kYonkersErrorDomain;
    goto LABEL_17;
  }
  if (a2)
  {
    CFErrorWithDomaiint n = SavageUpdaterCreateDescription(v10);
    CStringPtr = CFStringGetCStringPtr(CFErrorWithDomain, 0);
    ((void (*)(const __CFDictionary *, const char *))a2)(a3, CStringPtr);
    if (CFErrorWithDomain) {
LABEL_9:
    }
      CFRelease(CFErrorWithDomain);
  }
  return v10;
}

uint64_t __SavageUpdaterCreate_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  SavageUpdaterTypeID = result;
  return result;
}

void SavageUpdaterDestroy(SavageUpdateController *a1)
{
  if (a1)
  {
    if (*((void *)a1 + 4))
    {
      SavageUpdateController::destroyInstance(a1);
      *((void *)a1 + 4) = 0;
    }
    if (*((void *)a1 + 5))
    {
      YonkersUpdateController::destroyInstance(a1);
      *((void *)a1 + 5) = 0;
    }
  }
}

CFStringRef SavageUpdaterCreateDescription(CFStringRef result)
{
  if (result)
  {
    CFStringRef v1 = result;
    CFAllocatorRef v2 = CFGetAllocator(result);
    CFAllocatorRef v3 = CFGetAllocator(v1);
    return CFStringCreateWithFormat(v2, 0, @"<libSavageUpdater %p [%p]>{} \n", v1, v3);
  }
  return result;
}

uint64_t SavageUpdaterExecCommand(uint64_t a1, CFStringRef theString, __CFDictionary *a3, __CFDictionary **a4, CFTypeRef *a5)
{
  if (!a1 || !theString)
  {
    CFStringRef v14 = @"SavageErrorDomain";
    uint64_t v15 = "SavageUpdaterExecCommand - invalid input to SavageUpdaterExecCommand";
    unsigned int v13 = 2;
LABEL_29:
    int v16 = 0;
    goto LABEL_15;
  }
  size_t v8 = *(SavageUpdateController **)(a1 + 32);
  if (!v8)
  {
    CFStringRef v14 = @"SavageErrorDomain";
    uint64_t v15 = "SavageUpdaterExecCommand - no savage controller instance";
LABEL_28:
    unsigned int v13 = 16;
    goto LABEL_29;
  }
  unsigned __int8 v9 = *(YonkersUpdateController **)(a1 + 40);
  if (!v9)
  {
    CFStringRef v14 = @"YonkersErrorDomain";
    uint64_t v15 = "SavageUpdaterExecCommand - no yonkers controller instance";
    goto LABEL_28;
  }
  if (!*((unsigned char *)v8 + 248) || !*((unsigned char *)v9 + 32))
  {
    if (*((unsigned char *)v8 + 249))
    {
      if (*((unsigned char *)v9 + 33))
      {
        unsigned int v13 = 2;
        goto LABEL_13;
      }
      unsigned int v19 = YonkersUpdateController::execCommand(v9, theString, a3, a4);
    }
    else
    {
      unsigned int v19 = SavageUpdateController::execCommand(v8, theString, a3, a4);
    }
    unsigned int v13 = v19;
    if (!v19) {
      return 1;
    }
LABEL_13:
    CFStringRef v14 = @"SavageErrorDomain";
    uint64_t v15 = "SavageUpdaterExecCommand - No-preflight - controller exec command error";
    goto LABEL_14;
  }
  unsigned int v12 = SavageUpdateController::execCommand(v8, theString, a3, a4);
  if (!v12)
  {
    unsigned int v12 = YonkersUpdateController::execCommand(v9, theString, a3, a4);
    if (!v12) {
      return 1;
    }
  }
  unsigned int v13 = v12;
  CFStringRef v14 = @"SavageErrorDomain";
  uint64_t v15 = "SavageUpdaterExecCommand - Preflighting - controller exec command error";
LABEL_14:
  int v16 = a3;
LABEL_15:
  CFErrorWithDomaiint n = createCFErrorWithDomain((uint64_t)v15, v13, (uint64_t)v16, v14);
  CFErrorRef v18 = CFErrorWithDomain;
  if (a5 && CFErrorWithDomain)
  {
    *a5 = SavageSafeRetain(CFErrorWithDomain);
LABEL_23:
    CFRelease(v18);
    return 0;
  }
  if (CFErrorWithDomain) {
    goto LABEL_23;
  }
  return 0;
}

uint64_t SavageUpdaterExecCmd()
{
  return 0;
}

uint64_t SavageUpdaterIsDone(uint64_t result, CFTypeRef *a2)
{
  if (result)
  {
    uint64_t v3 = *(void *)(result + 32);
    if (v3)
    {
      uint64_t v4 = *(void *)(result + 40);
      if (v4) {
        return *(unsigned char *)(v3 + 249) && *(unsigned __int8 *)(v4 + 33) != 0;
      }
      uint64_t v5 = "SavageUpdaterIsDone - no yonkers controller instance";
      CFDataRef v6 = (const __CFString **)&kYonkersErrorDomain;
    }
    else
    {
      uint64_t v5 = "SavageUpdaterIsDone - no savage controller instance";
      CFDataRef v6 = (const __CFString **)&kSavageErrorDomain;
    }
    CFErrorWithDomaiint n = createCFErrorWithDomain((uint64_t)v5, 0x10u, 0, *v6);
    CFErrorRef v8 = CFErrorWithDomain;
    if (a2 && CFErrorWithDomain)
    {
      *a2 = SavageSafeRetain(CFErrorWithDomain);
    }
    else if (!CFErrorWithDomain)
    {
      return 1;
    }
    CFRelease(v8);
    return 1;
  }
  return result;
}

uint64_t SavageUpdaterSupported()
{
  return 1;
}

uint64_t encryptFDRData(const char *a1, size_t a2, char *a3, char *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  CFErrorRef v8 = MEMORY[0x263EF8438];
  if (__osLogPearlLibTrace) {
    unsigned __int8 v9 = __osLogPearlLibTrace;
  }
  else {
    unsigned __int8 v9 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    CFErrorRef v18 = a1;
    __int16 v19 = 2048;
    size_t v20 = a2;
    __int16 v21 = 2048;
    unint64_t v22 = a3;
    __int16 v23 = 2048;
    int v24 = a4;
    _os_log_impl(&dword_22F4CB000, v9, OS_LOG_TYPE_DEFAULT, "encryptFDRData %p %zu %p %p\n", buf, 0x2Au);
  }
  uint64_t v10 = encryptFDRDataInternal(a1, a2, a3, a4, 0);
  if (v10)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v10, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 161);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v15 = __osLogPearlLib;
    }
    else {
      uint64_t v15 = v8;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      CFErrorRef v18 = "err == 0 ";
      __int16 v19 = 2048;
      size_t v20 = (int)v10;
      __int16 v21 = 2080;
      unint64_t v22 = "";
      __int16 v23 = 2080;
      int v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v25 = 1024;
      int v26 = 161;
      _os_log_impl(&dword_22F4CB000, v15, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      int v16 = __osLogPearlLibTrace;
    }
    else {
      int v16 = v8;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = v10;
      unsigned int v12 = v16;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      goto LABEL_16;
    }
  }
  else
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v11 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v11 = v8;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = 0;
      unsigned int v12 = v11;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
LABEL_16:
      _os_log_impl(&dword_22F4CB000, v12, v13, "encryptFDRData -> %d\n", buf, 8u);
    }
  }
  return v10;
}

uint64_t encryptFDRDataInternal(const char *a1, size_t a2, char *a3, char *a4, int a5)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  uint64_t v10 = MEMORY[0x263EF8438];
  if (__osLogPearlLibTrace) {
    uint64_t v11 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v11 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219008;
    __int16 v25 = a1;
    __int16 v26 = 2048;
    size_t v27 = a2;
    __int16 v28 = 2048;
    uint64_t v29 = a3;
    __int16 v30 = 2048;
    int v31 = a4;
    __int16 v32 = 1024;
    int v33 = a5;
    _os_log_impl(&dword_22F4CB000, v11, OS_LOG_TYPE_DEFAULT, "encryptFDRDataInternal %p %zu %p %p %d\n", buf, 0x30u);
  }
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 209);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      __int16 v19 = __osLogPearlLib;
    }
    else {
      __int16 v19 = v10;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_79;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v25 = "data";
    __int16 v26 = 2048;
    size_t v27 = 0;
    __int16 v28 = 2080;
    uint64_t v29 = "";
    __int16 v30 = 2080;
    int v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v32 = 1024;
    int v33 = 209;
LABEL_77:
    __int16 v21 = v19;
LABEL_78:
    _os_log_impl(&dword_22F4CB000, v21, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_79:
    uint64_t v13 = 258;
    goto LABEL_16;
  }
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength > 0", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 210);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      __int16 v19 = __osLogPearlLib;
    }
    else {
      __int16 v19 = v10;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_79;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v25 = "dataLength > 0";
    __int16 v26 = 2048;
    size_t v27 = 0;
    __int16 v28 = 2080;
    uint64_t v29 = "";
    __int16 v30 = 2080;
    int v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v32 = 1024;
    int v33 = 210;
    goto LABEL_77;
  }
  if (!a3)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "encryptedDataBuffer", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 211);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      __int16 v19 = __osLogPearlLib;
    }
    else {
      __int16 v19 = v10;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_79;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v25 = "encryptedDataBuffer";
    __int16 v26 = 2048;
    size_t v27 = 0;
    __int16 v28 = 2080;
    uint64_t v29 = "";
    __int16 v30 = 2080;
    int v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v32 = 1024;
    int v33 = 211;
    goto LABEL_77;
  }
  if (!a4)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 212);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      __int16 v19 = __osLogPearlLib;
    }
    else {
      __int16 v19 = v10;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_79;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v25 = "outLength";
    __int16 v26 = 2048;
    size_t v27 = 0;
    __int16 v28 = 2080;
    uint64_t v29 = "";
    __int16 v30 = 2080;
    int v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v32 = 1024;
    int v33 = 212;
    goto LABEL_77;
  }
  if (a2 >= 0xFFFFFFFFFFFFFFACLL)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "__os_warn_unused(__builtin_add_overflow((dataLength), (2 * 16 + __builtin_offsetof(psd2_encrypted_t, encryptedData)), (&minimalOutputBufferLength))) == 0 ", a2 >= 0xFFFFFFFFFFFFFFACLL, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 215);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      size_t v20 = __osLogPearlLib;
    }
    else {
      size_t v20 = v10;
    }
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_79;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v25 = "__os_warn_unused(__builtin_add_overflow((dataLength), (2 * 16 + __builtin_offsetof(psd2_encrypted_t, encrypted"
          "Data)), (&minimalOutputBufferLength))) == 0 ";
    __int16 v26 = 2048;
    size_t v27 = a2 >= 0xFFFFFFFFFFFFFFACLL;
    __int16 v28 = 2080;
    uint64_t v29 = "";
    __int16 v30 = 2080;
    int v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v32 = 1024;
    int v33 = 215;
    __int16 v21 = v20;
    goto LABEL_78;
  }
  if (*(void *)a4 < a2 + 84)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "*outLength >= minimalOutputBufferLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 217);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      __int16 v19 = __osLogPearlLib;
    }
    else {
      __int16 v19 = v10;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_79;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v25 = "*outLength >= minimalOutputBufferLength";
    __int16 v26 = 2048;
    size_t v27 = 0;
    __int16 v28 = 2080;
    uint64_t v29 = "";
    __int16 v30 = 2080;
    int v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v32 = 1024;
    int v33 = 217;
    goto LABEL_77;
  }
  uint64_t v12 = initialize();
  if (v12)
  {
    uint64_t v13 = v12;
    size_t v22 = (int)v12;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 220);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      __int16 v23 = __osLogPearlLib;
    }
    else {
      __int16 v23 = v10;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v25 = "err == 0 ";
      __int16 v26 = 2048;
      size_t v27 = v22;
      __int16 v28 = 2080;
      uint64_t v29 = "";
      __int16 v30 = 2080;
      int v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v32 = 1024;
      int v33 = 220;
LABEL_94:
      _os_log_impl(&dword_22F4CB000, v23, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    uint64_t v13 = performCommand(_connect, 9, a5, a1, a2, a3, a4);
    if (v13)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v13, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 223);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      __int16 v23 = (__osLogPearlLib ? __osLogPearlLib : v10);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v25 = "err == 0 ";
        __int16 v26 = 2048;
        size_t v27 = (int)v13;
        __int16 v28 = 2080;
        uint64_t v29 = "";
        __int16 v30 = 2080;
        int v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v32 = 1024;
        int v33 = 223;
        goto LABEL_94;
      }
    }
  }
LABEL_16:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  if (v13)
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      CFStringRef v14 = __osLogPearlLibTrace;
    }
    else {
      CFStringRef v14 = v10;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v13;
      uint64_t v15 = v14;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
LABEL_33:
      _os_log_impl(&dword_22F4CB000, v15, v16, "encryptFDRDataInternal -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v17 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v17 = v10;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = 0;
      uint64_t v15 = v17;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_33;
    }
  }
  return v13;
}

uint64_t verifyFDRData(const char *a1, size_t a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  uint64_t v4 = MEMORY[0x263EF8438];
  if (__osLogPearlLibTrace) {
    uint64_t v5 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v5 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    __int16 v19 = a1;
    __int16 v20 = 2048;
    size_t v21 = a2;
    _os_log_impl(&dword_22F4CB000, v5, OS_LOG_TYPE_DEFAULT, "verifyFDRData %p %zu\n", buf, 0x16u);
  }
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 179);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v13 = __osLogPearlLib;
    }
    else {
      uint64_t v13 = v4;
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_46;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v19 = "data";
    __int16 v20 = 2048;
    size_t v21 = 0;
    __int16 v22 = 2080;
    __int16 v23 = "";
    __int16 v24 = 2080;
    __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v26 = 1024;
    int v27 = 179;
    goto LABEL_45;
  }
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength > 0", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 180);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v13 = __osLogPearlLib;
    }
    else {
      uint64_t v13 = v4;
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_46;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v19 = "dataLength > 0";
    __int16 v20 = 2048;
    size_t v21 = 0;
    __int16 v22 = 2080;
    __int16 v23 = "";
    __int16 v24 = 2080;
    __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v26 = 1024;
    int v27 = 180;
LABEL_45:
    _os_log_impl(&dword_22F4CB000, v13, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_46:
    uint64_t v6 = 258;
    goto LABEL_12;
  }
  uint64_t v6 = initialize();
  if (v6)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 183);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      CFStringRef v14 = __osLogPearlLib;
    }
    else {
      CFStringRef v14 = v4;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v19 = "err == 0 ";
      __int16 v20 = 2048;
      size_t v21 = (int)v6;
      __int16 v22 = 2080;
      __int16 v23 = "";
      __int16 v24 = 2080;
      __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v26 = 1024;
      int v27 = 183;
      _os_log_impl(&dword_22F4CB000, v14, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    uint64_t v7 = performCommand(_connect, 10, 0, a1, a2, 0, 0);
    if (v7)
    {
      uint64_t v15 = v7;
      size_t v16 = (int)v7;
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v7, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 186);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        uint64_t v17 = __osLogPearlLib;
      }
      else {
        uint64_t v17 = v4;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v19 = "err == 0 ";
        __int16 v20 = 2048;
        size_t v21 = v16;
        __int16 v22 = 2080;
        __int16 v23 = "";
        __int16 v24 = 2080;
        __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v26 = 1024;
        int v27 = 186;
        _os_log_impl(&dword_22F4CB000, v17, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v6 = v15;
    }
  }
LABEL_12:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  if (v6)
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      CFErrorRef v8 = __osLogPearlLibTrace;
    }
    else {
      CFErrorRef v8 = v4;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = v6;
      unsigned __int8 v9 = v8;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
LABEL_29:
      _os_log_impl(&dword_22F4CB000, v9, v10, "verifyFDRData -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v11 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v11 = v4;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = 0;
      unsigned __int8 v9 = v11;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_29;
    }
  }
  return v6;
}

uint64_t initialize()
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  mach_port_t v0 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v1 = IOServiceMatching("ApplePearlSEPDriver");
  io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    io_object_t v3 = MatchingService;
    uint64_t v4 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, (io_connect_t *)&_connect);
    if (v4)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 129);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        uint64_t v7 = __osLogPearlLib;
      }
      else {
        uint64_t v7 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        unsigned __int8 v9 = "err == 0 ";
        __int16 v10 = 2048;
        uint64_t v11 = (int)v4;
        __int16 v12 = 2080;
        uint64_t v13 = "";
        __int16 v14 = 2080;
        uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v16 = 1024;
        int v17 = 129;
        _os_log_impl(&dword_22F4CB000, v7, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    IOObjectRelease(v3);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "service", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 126);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    uint64_t v4 = 3758097084;
    if (__osLogPearlLib) {
      uint64_t v6 = __osLogPearlLib;
    }
    else {
      uint64_t v6 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      unsigned __int8 v9 = "service";
      __int16 v10 = 2048;
      uint64_t v11 = 0;
      __int16 v12 = 2080;
      uint64_t v13 = "";
      __int16 v14 = 2080;
      uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v16 = 1024;
      int v17 = 126;
      _os_log_impl(&dword_22F4CB000, v6, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v4;
}

uint64_t performCommand(mach_port_t a1, __int16 a2, __int16 a3, const void *a4, size_t a5, void *a6, void *a7)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  size_t v14 = a5 + 8;
  uint64_t v15 = calloc(a5 + 8, 1uLL);
  if (v15)
  {
    __int16 v16 = v15;
    *uint64_t v15 = 21072;
    v15[1] = a2;
    v15[2] = 1;
    v15[3] = a3;
    if (a5) {
      memmove(v15 + 4, a4, a5);
    }
    if (a7)
    {
      *(void *)outputStructCnt = *a7;
      uint64_t v17 = IOConnectCallStructMethod(a1, 0, v16, v14, a6, (size_t *)outputStructCnt);
      *a7 = *(void *)outputStructCnt;
    }
    else
    {
      *(void *)outputStructCnt = 0;
      uint64_t v17 = IOConnectCallStructMethod(a1, 0, v16, v14, a6, (size_t *)outputStructCnt);
    }
    free(v16);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "cmd", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 99);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      __int16 v19 = __osLogPearlLib;
    }
    else {
      __int16 v19 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)outputStructCnt = 136316162;
      *(void *)&outputStructCnt[4] = "cmd";
      __int16 v21 = 2048;
      uint64_t v22 = 0;
      __int16 v23 = 2080;
      __int16 v24 = "";
      __int16 v25 = 2080;
      __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v27 = 1024;
      int v28 = 99;
      _os_log_impl(&dword_22F4CB000, v19, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", outputStructCnt, 0x30u);
    }
    return 260;
  }
  return v17;
}

uint64_t decryptFDRData(const void *a1, size_t a2, void *a3, size_t *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 241);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v11 = __osLogPearlLib;
    }
    else {
      uint64_t v11 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v17 = "data";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    __int16 v21 = "";
    __int16 v22 = 2080;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v24 = 1024;
    int v25 = 241;
    goto LABEL_46;
  }
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength > 0", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 242);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v11 = __osLogPearlLib;
    }
    else {
      uint64_t v11 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v17 = "dataLength > 0";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    __int16 v21 = "";
    __int16 v22 = 2080;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v24 = 1024;
    int v25 = 242;
    goto LABEL_46;
  }
  if (!a3)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "decryptedDataBuffer", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 243);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v11 = __osLogPearlLib;
    }
    else {
      uint64_t v11 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v17 = "decryptedDataBuffer";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    __int16 v21 = "";
    __int16 v22 = 2080;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v24 = 1024;
    int v25 = 243;
    goto LABEL_46;
  }
  if (!a4)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 244);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v11 = __osLogPearlLib;
    }
    else {
      uint64_t v11 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v17 = "outLength";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    __int16 v21 = "";
    __int16 v22 = 2080;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v24 = 1024;
    int v25 = 244;
    goto LABEL_46;
  }
  if (*a4 < a2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(*outLength > 0) && (*outLength >= dataLength)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 245);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v11 = __osLogPearlLib;
    }
    else {
      uint64_t v11 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v17 = "(*outLength > 0) && (*outLength >= dataLength)";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    __int16 v21 = "";
    __int16 v22 = 2080;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v24 = 1024;
    int v25 = 245;
LABEL_46:
    _os_log_impl(&dword_22F4CB000, v11, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_47:
    uint64_t v8 = 258;
    goto LABEL_8;
  }
  uint64_t v8 = initialize();
  if (v8)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v8, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 248);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      __int16 v12 = __osLogPearlLib;
    }
    else {
      __int16 v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v17 = "err == 0 ";
      __int16 v18 = 2048;
      uint64_t v19 = (int)v8;
      __int16 v20 = 2080;
      __int16 v21 = "";
      __int16 v22 = 2080;
      __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v24 = 1024;
      int v25 = 248;
      _os_log_impl(&dword_22F4CB000, v12, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    uint64_t v9 = performCommand(_connect, 30, 0, a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v13 = v9;
      uint64_t v14 = (int)v9;
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 251);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        uint64_t v15 = __osLogPearlLib;
      }
      else {
        uint64_t v15 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v17 = "err == 0 ";
        __int16 v18 = 2048;
        uint64_t v19 = v14;
        __int16 v20 = 2080;
        __int16 v21 = "";
        __int16 v22 = 2080;
        __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v24 = 1024;
        int v25 = 251;
        _os_log_impl(&dword_22F4CB000, v15, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v8 = v13;
    }
  }
LABEL_8:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  return v8;
}

uint64_t overridePCECalibration(const void *a1, size_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a1 && a2)
  {
    uint64_t v4 = initialize();
    if (v4)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 269);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        uint64_t v8 = __osLogPearlLib;
      }
      else {
        uint64_t v8 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v13 = "err == 0 ";
        __int16 v14 = 2048;
        uint64_t v15 = (int)v4;
        __int16 v16 = 2080;
        uint64_t v17 = "";
        __int16 v18 = 2080;
        uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v20 = 1024;
        int v21 = 269;
        _os_log_impl(&dword_22F4CB000, v8, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      uint64_t v5 = performCommand(_connect, 34, 0, a1, a2, 0, 0);
      if (v5)
      {
        uint64_t v9 = v5;
        uint64_t v10 = (int)v5;
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 272);
        if (OSLogInit_onceToken != -1) {
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        }
        if (__osLogPearlLib) {
          uint64_t v11 = __osLogPearlLib;
        }
        else {
          uint64_t v11 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v13 = "err == 0 ";
          __int16 v14 = 2048;
          uint64_t v15 = v10;
          __int16 v16 = 2080;
          uint64_t v17 = "";
          __int16 v18 = 2080;
          uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          __int16 v20 = 1024;
          int v21 = 272;
          _os_log_impl(&dword_22F4CB000, v11, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v4 = v9;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "calibration && (calibrationSize > 0)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 266);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v7 = __osLogPearlLib;
    }
    else {
      uint64_t v7 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v13 = "calibration && (calibrationSize > 0)";
      __int16 v14 = 2048;
      uint64_t v15 = 0;
      __int16 v16 = 2080;
      uint64_t v17 = "";
      __int16 v18 = 2080;
      uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v20 = 1024;
      int v21 = 266;
      _os_log_impl(&dword_22F4CB000, v7, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v4 = 258;
  }
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  return v4;
}

uint64_t decompressReferenceFrames(const void *a1, size_t a2, uint64_t a3)
{
  uint64_t v133 = *MEMORY[0x263EF8340];
  size_t v124 = 0;
  *(_OWORD *)__str = 0u;
  long long v132 = 0u;
  if (!a1 || !a2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "prf1Class && (prf1ClassSize > 0)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 309);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      v100 = __osLogPearlLib;
    }
    else {
      v100 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_191;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)v128 = "prf1Class && (prf1ClassSize > 0)";
    *(_WORD *)&v128[8] = 2048;
    uint64_t v129 = 0;
    *(_WORD *)v130 = 2080;
    *(void *)&v130[2] = "";
    *(_WORD *)&v130[10] = 2080;
    *(void *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v130[20] = 1024;
    *(_DWORD *)&v130[22] = 309;
    goto LABEL_190;
  }
  if (!a3)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "systemRootPath", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 310);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      v100 = __osLogPearlLib;
    }
    else {
      v100 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_191;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)v128 = "systemRootPath";
    *(_WORD *)&v128[8] = 2048;
    uint64_t v129 = 0;
    *(_WORD *)v130 = 2080;
    *(void *)&v130[2] = "";
    *(_WORD *)&v130[10] = 2080;
    *(void *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v130[20] = 1024;
    *(_DWORD *)&v130[22] = 310;
LABEL_190:
    _os_log_impl(&dword_22F4CB000, v100, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_191:
    uint64_t v12 = 258;
LABEL_263:
    int v36 = logString + 120;
    goto LABEL_124;
  }
  uint64_t v6 = initialize();
  if (v6)
  {
    uint64_t v12 = v6;
    uint64_t v101 = (int)v6;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 313);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      v102 = __osLogPearlLib;
    }
    else {
      v102 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v128 = "err == 0 ";
      *(_WORD *)&v128[8] = 2048;
      uint64_t v129 = v101;
      *(_WORD *)v130 = 2080;
      *(void *)&v130[2] = "";
      *(_WORD *)&v130[10] = 2080;
      *(void *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v130[20] = 1024;
      *(_DWORD *)&v130[22] = 313;
      _os_log_impl(&dword_22F4CB000, v102, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_263;
  }
  uint64_t v7 = (char *)calloc(a2 + 9, 1uLL);
  if (!v7)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "fdrInput", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 317);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      v103 = __osLogPearlLib;
    }
    else {
      v103 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_222;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)v128 = "fdrInput";
    *(_WORD *)&v128[8] = 2048;
    uint64_t v129 = 0;
    *(_WORD *)v130 = 2080;
    *(void *)&v130[2] = "";
    *(_WORD *)&v130[10] = 2080;
    *(void *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v130[20] = 1024;
    *(_DWORD *)&v130[22] = 317;
    goto LABEL_221;
  }
  uint64_t v8 = v7;
  *(_DWORD *)uint64_t v7 = 589827;
  v7[4] = 0;
  *(_DWORD *)(v7 + 5) = a2;
  memcpy(v7 + 9, a1, a2);
  uint64_t v9 = performCommand(_connect, 36, 0, v8, a2 + 9, 0, 0);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v104 = (int)v9;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 327);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      v105 = __osLogPearlLib;
    }
    else {
      v105 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v128 = "err == 0 ";
      *(_WORD *)&v128[8] = 2048;
      uint64_t v129 = v104;
      *(_WORD *)v130 = 2080;
      *(void *)&v130[2] = "";
      *(_WORD *)&v130[10] = 2080;
      *(void *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v130[20] = 1024;
      *(_DWORD *)&v130[22] = 327;
      _os_log_impl(&dword_22F4CB000, v105, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    free(v8);
    goto LABEL_263;
  }
  free(v8);
  size_t v124 = 52;
  uint64_t v10 = calloc(0x34uLL, 1uLL);
  if (!v10)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataInfo", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 334);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      v103 = __osLogPearlLib;
    }
    else {
      v103 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_222;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)v128 = "dataInfo";
    *(_WORD *)&v128[8] = 2048;
    uint64_t v129 = 0;
    *(_WORD *)v130 = 2080;
    *(void *)&v130[2] = "";
    *(_WORD *)&v130[10] = 2080;
    *(void *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v130[20] = 1024;
    *(_DWORD *)&v130[22] = 334;
LABEL_221:
    _os_log_impl(&dword_22F4CB000, v103, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_222:
    uint64_t v12 = 260;
    goto LABEL_263;
  }
  uint64_t v11 = v10;
  uint64_t v12 = performCommand(_connect, 45, 0, 0, 0, v10, &v124);
  uint64_t v13 = (FILE *)*MEMORY[0x263EF8348];
  if (v12)
  {
    fprintf(v13, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 338);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      v106 = __osLogPearlLib;
    }
    else {
      v106 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v128 = "err == 0 ";
      *(_WORD *)&v128[8] = 2048;
      uint64_t v129 = (int)v12;
      *(_WORD *)v130 = 2080;
      *(void *)&v130[2] = "";
      *(_WORD *)&v130[10] = 2080;
      *(void *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v130[20] = 1024;
      *(_DWORD *)&v130[22] = 338;
      _os_log_impl(&dword_22F4CB000, v106, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_262;
  }
  fprintf(v13, "ReferenceFramesInfo setCount: %d\n", *v11);
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  if (__osLogPearlLib) {
    __int16 v14 = __osLogPearlLib;
  }
  else {
    __int16 v14 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = *v11;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v128 = v15;
    _os_log_impl(&dword_22F4CB000, v14, OS_LOG_TYPE_DEFAULT, "ReferenceFramesInfo setCount: %d\n", buf, 8u);
  }
  if (!*v11)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataInfo->setCount > 0", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 342);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      v107 = __osLogPearlLib;
    }
    else {
      v107 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v128 = "dataInfo->setCount > 0";
      *(_WORD *)&v128[8] = 2048;
      uint64_t v129 = 0;
      *(_WORD *)v130 = 2080;
      *(void *)&v130[2] = "";
      *(_WORD *)&v130[10] = 2080;
      *(void *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v130[20] = 1024;
      *(_DWORD *)&v130[22] = 342;
      _os_log_impl(&dword_22F4CB000, v107, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v12 = 259;
    goto LABEL_262;
  }
  id v16 = [NSString stringWithFormat:@"%s%s", a3, "/System/Library/Pearl/ReferenceFrames"];
  uint64_t v17 = (FILE *)*MEMORY[0x263EF8348];
  if (!v16)
  {
    fprintf(v17, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "path", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 345);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      v108 = __osLogPearlLib;
    }
    else {
      v108 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v128 = "path";
      *(_WORD *)&v128[8] = 2048;
      uint64_t v129 = 0;
      *(_WORD *)v130 = 2080;
      *(void *)&v130[2] = "";
      *(_WORD *)&v130[10] = 2080;
      *(void *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v130[20] = 1024;
      *(_DWORD *)&v130[22] = 345;
      _os_log_impl(&dword_22F4CB000, v108, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v12 = 261;
    goto LABEL_262;
  }
  id v18 = v16;
  fprintf(v17, "ReferenceFramesPath: %s\n", (const char *)[v18 UTF8String]);
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  if (__osLogPearlLib) {
    uint64_t v19 = __osLogPearlLib;
  }
  else {
    uint64_t v19 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = v18;
    int v21 = v19;
    uint64_t v22 = [v20 UTF8String];
    *(_DWORD *)buf = 136315138;
    *(void *)v128 = v22;
    _os_log_impl(&dword_22F4CB000, v21, OS_LOG_TYPE_DEFAULT, "ReferenceFramesPath: %s\n", buf, 0xCu);
  }
  id v23 = (id)[MEMORY[0x263F08850] defaultManager];
  int v24 = [v23 fileExistsAtPath:v18];

  if (v24)
  {
    id v25 = (id)[MEMORY[0x263F08850] defaultManager];
    int v26 = [v25 removeItemAtPath:v18 error:0];

    if ((v26 & 1) == 0)
    {
      uint64_t v12 = v26 ^ 1u;
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 353);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        v109 = __osLogPearlLib;
      }
      else {
        v109 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)v128 = "err == 0 ";
        *(_WORD *)&v128[8] = 2048;
        uint64_t v129 = v12;
        *(_WORD *)v130 = 2080;
        *(void *)&v130[2] = "";
        *(_WORD *)&v130[10] = 2080;
        *(void *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        *(_WORD *)&v130[20] = 1024;
        *(_DWORD *)&v130[22] = 353;
        _os_log_impl(&dword_22F4CB000, v109, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      goto LABEL_261;
    }
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      __int16 v27 = __osLogPearlLib;
    }
    else {
      __int16 v27 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v128 = v18;
      _os_log_impl(&dword_22F4CB000, v27, OS_LOG_TYPE_DEFAULT, "Removed %@\n", buf, 0xCu);
    }
  }
  id v28 = (id)[MEMORY[0x263F08850] defaultManager];
  char v29 = [v28 fileExistsAtPath:v18];

  if (v29) {
    goto LABEL_37;
  }
  uint64_t v125 = *MEMORY[0x263F08078];
  v126 = &unk_26E2BDAB0;
  id v30 = (id)[NSDictionary dictionaryWithObjects:&v126 forKeys:&v125 count:1];
  id v31 = (id)[MEMORY[0x263F08850] defaultManager];
  uint64_t v12 = [v31 createDirectoryAtPath:v18 withIntermediateDirectories:1 attributes:v30 error:0] ^ 1;

  if (v12)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 362);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      v110 = __osLogPearlLib;
    }
    else {
      v110 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v128 = "err == 0 ";
      *(_WORD *)&v128[8] = 2048;
      uint64_t v129 = v12;
      *(_WORD *)v130 = 2080;
      *(void *)&v130[2] = "";
      *(_WORD *)&v130[10] = 2080;
      *(void *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v130[20] = 1024;
      *(_DWORD *)&v130[22] = 362;
      _os_log_impl(&dword_22F4CB000, v110, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

LABEL_261:
LABEL_262:
    free(v11);
    goto LABEL_263;
  }

LABEL_37:
  if (*v11)
  {
    uint64_t v32 = 0;
    id v120 = 0;
    id v121 = 0;
    v115 = 0;
    int v33 = 0;
    id v34 = 0;
    id v117 = 0;
    uint64_t v35 = 0;
    int v36 = &logString[120];
    v111 = v11;
    while (1)
    {
      uint64_t v37 = &v11[3 * v32];
      int v38 = v37[1];
      v116 = (unsigned int *)(++v37 + 1);
      v118 = v37;
      v114 = (unsigned int *)(v37 + 2);
      fprintf((FILE *)*MEMORY[0x263EF8348], "ReferenceFramesSetInfo, index: %d, type: %d, count: %d, size: %d\n", v32, v38, v37[1], v37[2]);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      int v122 = v32;
      if (__osLogPearlLib) {
        unint64_t v39 = __osLogPearlLib;
      }
      else {
        unint64_t v39 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        int v40 = *v118;
        unsigned int v41 = *v116;
        int v42 = *v114;
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v128 = v32;
        *(_WORD *)&v128[4] = 1024;
        *(_DWORD *)&v128[6] = v40;
        LOWORD(v129) = 1024;
        *(_DWORD *)((char *)&v129 + 2) = v41;
        HIWORD(v129) = 1024;
        *(_DWORD *)v130 = v42;
        _os_log_impl(&dword_22F4CB000, v39, OS_LOG_TYPE_DEFAULT, "ReferenceFramesSetInfo, index: %d, type: %d, count: %d, size: %d\n", buf, 0x1Au);
      }
      uint64_t v43 = *v118;
      if (v43 <= 3) {
        v115 = off_264A0A3F0[v43];
      }
      id v44 = (id)[MEMORY[0x263EFF9A0] dictionary];

      if (!v44)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "setDictionary", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 383);
        v94 = v33;
        if (OSLogInit_onceToken != -1) {
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        }
        if (__osLogPearlLib) {
          uint64_t v95 = __osLogPearlLib;
        }
        else {
          uint64_t v95 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v128 = "setDictionary";
          *(_WORD *)&v128[8] = 2048;
          uint64_t v129 = 0;
          *(_WORD *)v130 = 2080;
          *(void *)&v130[2] = "";
          *(_WORD *)&v130[10] = 2080;
          *(void *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v130[20] = 1024;
          *(_DWORD *)&v130[22] = 383;
          _os_log_impl(&dword_22F4CB000, v95, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v12 = 261;
        uint64_t v11 = v111;
        id v78 = v120;
        int v33 = v94;
        int v77 = v34;
        goto LABEL_79;
      }
      uint64_t v112 = v32;
      id v117 = v44;
      [v44 setObject:&unk_26E2BDAC8 forKeyedSubscript:@"FormatDR"];
      id v45 = (id)[NSString stringWithFormat:@"%@/reference-%@.plist", v18, v115];

      if (!v45)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dictFileName", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 388);
        id v78 = v120;
        v96 = v33;
        if (OSLogInit_onceToken != -1) {
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        }
        if (__osLogPearlLib) {
          v97 = __osLogPearlLib;
        }
        else {
          v97 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v128 = "dictFileName";
          *(_WORD *)&v128[8] = 2048;
          uint64_t v129 = 0;
          *(_WORD *)v130 = 2080;
          *(void *)&v130[2] = "";
          *(_WORD *)&v130[10] = 2080;
          *(void *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v130[20] = 1024;
          *(_DWORD *)&v130[22] = 388;
          _os_log_impl(&dword_22F4CB000, v97, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v12 = 261;
        int v77 = v44;
        uint64_t v11 = v111;
        int v33 = v96;
        goto LABEL_79;
      }
      id v113 = v45;
      if (*v116) {
        break;
      }
LABEL_68:
      char v70 = [v117 writeToFile:v113 atomically:0];
      uint64_t v71 = (FILE *)*MEMORY[0x263EF8348];
      if ((v70 & 1) == 0)
      {
        fprintf(v71, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", 1, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 438);
        v98 = v33;
        if (OSLogInit_onceToken != -1) {
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        }
        id v78 = v120;
        if (__osLogPearlLib) {
          v99 = __osLogPearlLib;
        }
        else {
          v99 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v128 = "err == 0 ";
          *(_WORD *)&v128[8] = 2048;
          uint64_t v129 = 1;
          *(_WORD *)v130 = 2080;
          *(void *)&v130[2] = "";
          *(_WORD *)&v130[10] = 2080;
          *(void *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v130[20] = 1024;
          *(_DWORD *)&v130[22] = 438;
          _os_log_impl(&dword_22F4CB000, v99, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }

        uint64_t v12 = 1;
        uint64_t v11 = v111;
        int v33 = v98;
        int v77 = v113;
        goto LABEL_79;
      }
      id v34 = v113;
      fprintf(v71, "Reference set dictionary written to %s\n", (const char *)[v34 UTF8String]);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      uint64_t v11 = v111;
      if (__osLogPearlLib) {
        int32x2_t v72 = __osLogPearlLib;
      }
      else {
        int32x2_t v72 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        id v73 = v34;
        unint64_t v74 = v72;
        uint64_t v75 = [v73 UTF8String];
        *(_DWORD *)buf = 136315138;
        *(void *)v128 = v75;
        _os_log_impl(&dword_22F4CB000, v74, OS_LOG_TYPE_DEFAULT, "Reference set dictionary written to %s\n", buf, 0xCu);
      }
      uint64_t v32 = v112 + 1;
      if (v112 + 1 >= (unint64_t)*v111)
      {

        uint64_t v12 = 0;
        int v77 = v34;
        id v78 = v120;
LABEL_79:

        uint64_t v76 = v121;
        goto LABEL_80;
      }
    }
    unsigned int v46 = 0;
    while (1)
    {
      v123[0] = v122;
      v123[1] = v46;
      size_t v124 = *v114 + 524;
      unint64_t v47 = (unsigned int *)calloc(v124, 1uLL);
      if (!v47) {
        break;
      }
      CFStringRef v48 = v47;
      uint64_t v49 = performCommand(*((_DWORD *)v36 + 1004), 46, 0, v123, 8uLL, v47, &v124);
      if (v49)
      {
        uint64_t v12 = v49;
        unsigned int v82 = v35;
        uint64_t v83 = (int)v49;
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v49, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 403);
        id v119 = v33;
        if (OSLogInit_onceToken != -1) {
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        }
        if (__osLogPearlLib) {
          int v84 = __osLogPearlLib;
        }
        else {
          int v84 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v128 = "err == 0 ";
          *(_WORD *)&v128[8] = 2048;
          uint64_t v129 = v83;
          *(_WORD *)v130 = 2080;
          *(void *)&v130[2] = "";
          *(_WORD *)&v130[10] = 2080;
          *(void *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v130[20] = 1024;
          *(_DWORD *)&v130[22] = 403;
          _os_log_impl(&dword_22F4CB000, v84, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        goto LABEL_104;
      }
      if ((snprintf(__str, 0x20uLL, "%.6f", *(double *)v48) - 32) <= 0xFFFFFFE0)
      {
        unsigned int v82 = v35;
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "ret > 0 && ret < sizeof(tempChar)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 406);
        id v119 = v33;
        if (OSLogInit_onceToken != -1) {
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        }
        if (__osLogPearlLib) {
          int v85 = __osLogPearlLib;
        }
        else {
          int v85 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v128 = "ret > 0 && ret < sizeof(tempChar)";
          *(_WORD *)&v128[8] = 2048;
          uint64_t v129 = 0;
          *(_WORD *)v130 = 2080;
          *(void *)&v130[2] = "";
          *(_WORD *)&v130[10] = 2080;
          *(void *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v130[20] = 1024;
          *(_DWORD *)&v130[22] = 406;
          _os_log_impl(&dword_22F4CB000, v85, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v12 = 261;
LABEL_104:
        uint64_t v86 = v111;
        uint64_t v51 = v82;
LABEL_121:
        id v54 = v121;
LABEL_122:
        free(v86);
        free(v48);

        int v79 = v120;
        goto LABEL_123;
      }
      id v50 = (id)[NSString stringWithUTF8String:__str];

      if (!v50)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "tempString", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 409);
        id v119 = v33;
        if (OSLogInit_onceToken != -1) {
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        }
        uint64_t v86 = v111;
        if (__osLogPearlLib) {
          uint64_t v87 = __osLogPearlLib;
        }
        else {
          uint64_t v87 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v128 = "tempString";
          *(_WORD *)&v128[8] = 2048;
          uint64_t v129 = 0;
          *(_WORD *)v130 = 2080;
          *(void *)&v130[2] = "";
          *(_WORD *)&v130[10] = 2080;
          *(void *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v130[20] = 1024;
          *(_DWORD *)&v130[22] = 409;
          _os_log_impl(&dword_22F4CB000, v87, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v51 = 0;
        uint64_t v12 = 261;
        int v36 = logString + 120;
        goto LABEL_121;
      }
      uint64_t v51 = v50;
      id v52 = (id)[NSString stringWithFormat:@"reference-%@__T_%@.bin", v115, v50];

      if (!v52)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "refFileName", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 412);
        if (OSLogInit_onceToken != -1) {
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        }
        uint64_t v86 = v111;
        if (__osLogPearlLib) {
          int v88 = __osLogPearlLib;
        }
        else {
          int v88 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v128 = "refFileName";
          *(_WORD *)&v128[8] = 2048;
          uint64_t v129 = 0;
          *(_WORD *)v130 = 2080;
          *(void *)&v130[2] = "";
          *(_WORD *)&v130[10] = 2080;
          *(void *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v130[20] = 1024;
          *(_DWORD *)&v130[22] = 412;
          _os_log_impl(&dword_22F4CB000, v88, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        id v119 = 0;
        uint64_t v12 = 261;
        goto LABEL_121;
      }
      id v53 = v52;
      id v54 = (id)[NSString stringWithFormat:@"%@/%@", v18, v52];

      id v119 = v53;
      if (!v54)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "refPath", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 415);
        if (OSLogInit_onceToken != -1) {
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        }
        if (__osLogPearlLib) {
          unsigned int v91 = __osLogPearlLib;
        }
        else {
          unsigned int v91 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v128 = "refPath";
          *(_WORD *)&v128[8] = 2048;
          uint64_t v129 = 0;
          *(_WORD *)v130 = 2080;
          *(void *)&v130[2] = "";
          *(_WORD *)&v130[10] = 2080;
          *(void *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v130[20] = 1024;
          *(_DWORD *)&v130[22] = 415;
          _os_log_impl(&dword_22F4CB000, v91, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        id v54 = 0;
        uint64_t v12 = 261;
        uint64_t v86 = v111;
        goto LABEL_122;
      }
      id v55 = v18;
      [v117 setObject:v53 forKeyedSubscript:v51];
      id v56 = (id)[MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v48 + 3 length:v48[2] freeWhenDone:0];

      if (!v56)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "refFrameData", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 423);
        if (OSLogInit_onceToken != -1) {
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        }
        id v18 = v55;
        if (__osLogPearlLib) {
          unsigned int v92 = __osLogPearlLib;
        }
        else {
          unsigned int v92 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v128 = "refFrameData";
          *(_WORD *)&v128[8] = 2048;
          uint64_t v129 = 0;
          *(_WORD *)v130 = 2080;
          *(void *)&v130[2] = "";
          *(_WORD *)&v130[10] = 2080;
          *(void *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v130[20] = 1024;
          *(_DWORD *)&v130[22] = 423;
          _os_log_impl(&dword_22F4CB000, v92, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        id v120 = 0;
        uint64_t v12 = 261;
        uint64_t v86 = v111;
        goto LABEL_122;
      }
      CFArrayRef v57 = v51;
      id v120 = v56;
      char v58 = [v56 writeToFile:v54 atomically:0];
      uint64_t v59 = (FILE *)*MEMORY[0x263EF8348];
      if ((v58 & 1) == 0)
      {
        fprintf(v59, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", 1, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 426);
        if (OSLogInit_onceToken != -1) {
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        }
        id v18 = v55;
        if (__osLogPearlLib) {
          v93 = __osLogPearlLib;
        }
        else {
          v93 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v128 = "err == 0 ";
          *(_WORD *)&v128[8] = 2048;
          uint64_t v12 = 1;
          uint64_t v129 = 1;
          *(_WORD *)v130 = 2080;
          *(void *)&v130[2] = "";
          *(_WORD *)&v130[10] = 2080;
          *(void *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v130[20] = 1024;
          *(_DWORD *)&v130[22] = 426;
          _os_log_impl(&dword_22F4CB000, v93, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        else
        {
          uint64_t v12 = 1;
        }
        uint64_t v86 = v111;
        goto LABEL_122;
      }
      double v60 = *(double *)v48;
      unsigned int v61 = v48[2];
      int v62 = *v118;
      id v121 = v54;
      fprintf(v59, "Reference frame (set=%d, frame=%d, size=%d, type=%d, temp=%f) written to %s\n", v122, v46, v61, v62, v60, (const char *)[v121 UTF8String]);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        CFArrayRef v63 = __osLogPearlLib;
      }
      else {
        CFArrayRef v63 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v64 = v48[2];
        int v65 = *v118;
        double v66 = *(double *)v48;
        id v67 = v121;
        uint64_t v68 = v63;
        uint64_t v69 = [v67 UTF8String];
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)v128 = v122;
        *(_WORD *)&v128[4] = 1024;
        *(_DWORD *)&v128[6] = v46;
        LOWORD(v129) = 1024;
        *(_DWORD *)((char *)&v129 + 2) = v64;
        HIWORD(v129) = 1024;
        *(_DWORD *)v130 = v65;
        *(_WORD *)&v130[4] = 2048;
        *(double *)&v130[6] = v66;
        int v36 = logString + 120;
        *(_WORD *)&v130[14] = 2080;
        *(void *)&v130[16] = v69;
        _os_log_impl(&dword_22F4CB000, v68, OS_LOG_TYPE_DEFAULT, "Reference frame (set=%d, frame=%d, size=%d, type=%d, temp=%f) written to %s\n", buf, 0x2Eu);
      }
      free(v48);
      ++v46;
      id v18 = v55;
      uint64_t v35 = v57;
      int v33 = v119;
      if (v46 >= *v116) {
        goto LABEL_68;
      }
    }
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "refFrame", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 400);
    int v80 = v33;
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      int v81 = __osLogPearlLib;
    }
    else {
      int v81 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v128 = "refFrame";
      *(_WORD *)&v128[8] = 2048;
      uint64_t v129 = 0;
      *(_WORD *)v130 = 2080;
      *(void *)&v130[2] = "";
      *(_WORD *)&v130[10] = 2080;
      *(void *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v130[20] = 1024;
      *(_DWORD *)&v130[22] = 400;
      _os_log_impl(&dword_22F4CB000, v81, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    free(v111);

    uint64_t v12 = 260;
  }
  else
  {
    uint64_t v76 = 0;
    int v33 = 0;
    uint64_t v35 = 0;
    id v78 = 0;
    uint64_t v12 = 0;
    int v36 = logString + 120;
LABEL_80:
    free(v11);

    int v79 = v78;
LABEL_123:
  }
LABEL_124:
  io_connect_t v89 = *((_DWORD *)v36 + 1004);
  if (v89)
  {
    IOServiceClose(v89);
    *((_DWORD *)v36 + 1004) = 0;
  }
  return v12;
}

uint64_t getSavageProvisioningData(uint64_t a1, long long *a2, uint64_t a3, _OWORD *a4, uint64_t a5, const void *a6, size_t a7, uint64_t a8, void *a9, _OWORD *a10, void *a11, uint64_t a12, void *a13)
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  long long v80 = 0u;
  memset(v81, 0, 27);
  long long v78 = 0u;
  long long v79 = 0u;
  uint64_t v65 = 75;
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "savagePubKey", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 480);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    int v42 = logString + 120;
    if (__osLogPearlLib) {
      id v50 = __osLogPearlLib;
    }
    else {
      id v50 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_126;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v69 = "savagePubKey";
    __int16 v70 = 2048;
    uint64_t v71 = 0;
    __int16 v72 = 2080;
    id v73 = "";
    __int16 v74 = 2080;
    uint64_t v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v76 = 1024;
    int v77 = 480;
    goto LABEL_125;
  }
  if (!a4)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "savageUID", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 482);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    int v42 = logString + 120;
    if (__osLogPearlLib) {
      id v50 = __osLogPearlLib;
    }
    else {
      id v50 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_126;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v69 = "savageUID";
    __int16 v70 = 2048;
    uint64_t v71 = 0;
    __int16 v72 = 2080;
    id v73 = "";
    __int16 v74 = 2080;
    uint64_t v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v76 = 1024;
    int v77 = 482;
    goto LABEL_125;
  }
  if (!a6 || !a7)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "savageFWCert && savageFWCertLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 484);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    int v42 = logString + 120;
    if (__osLogPearlLib) {
      id v50 = __osLogPearlLib;
    }
    else {
      id v50 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_126;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v69 = "savageFWCert && savageFWCertLength";
    __int16 v70 = 2048;
    uint64_t v71 = 0;
    __int16 v72 = 2080;
    id v73 = "";
    __int16 v74 = 2080;
    uint64_t v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v76 = 1024;
    int v77 = 484;
    goto LABEL_125;
  }
  if (!a8)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "hostPubKeyBuffer", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 485);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    int v42 = logString + 120;
    if (__osLogPearlLib) {
      id v50 = __osLogPearlLib;
    }
    else {
      id v50 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_126;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v69 = "hostPubKeyBuffer";
    __int16 v70 = 2048;
    uint64_t v71 = 0;
    __int16 v72 = 2080;
    id v73 = "";
    __int16 v74 = 2080;
    uint64_t v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v76 = 1024;
    int v77 = 485;
    goto LABEL_125;
  }
  if (!a9 || *a9 <= 0x37uLL)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outHostPubKeyLength && (*outHostPubKeyLength >= (448 / 8))", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 486);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    int v42 = logString + 120;
    if (__osLogPearlLib) {
      uint64_t v49 = __osLogPearlLib;
    }
    else {
      uint64_t v49 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_82;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v69 = "outHostPubKeyLength && (*outHostPubKeyLength >= (448 / 8))";
    __int16 v70 = 2048;
    uint64_t v71 = 0;
    __int16 v72 = 2080;
    id v73 = "";
    __int16 v74 = 2080;
    uint64_t v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v76 = 1024;
    int v77 = 486;
    goto LABEL_81;
  }
  if (!a10)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "ngidDEBuffer", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 487);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    int v42 = logString + 120;
    if (__osLogPearlLib) {
      id v50 = __osLogPearlLib;
    }
    else {
      id v50 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_126;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v69 = "ngidDEBuffer";
    __int16 v70 = 2048;
    uint64_t v71 = 0;
    __int16 v72 = 2080;
    id v73 = "";
    __int16 v74 = 2080;
    uint64_t v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v76 = 1024;
    int v77 = 487;
    goto LABEL_125;
  }
  if (!a11 || *a11 <= 0xFuLL)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outNGIDDELength && (*outNGIDDELength >= 16)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 488);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    int v42 = logString + 120;
    if (__osLogPearlLib) {
      uint64_t v49 = __osLogPearlLib;
    }
    else {
      uint64_t v49 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_82;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v69 = "outNGIDDELength && (*outNGIDDELength >= 16)";
    __int16 v70 = 2048;
    uint64_t v71 = 0;
    __int16 v72 = 2080;
    id v73 = "";
    __int16 v74 = 2080;
    uint64_t v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v76 = 1024;
    int v77 = 488;
    goto LABEL_81;
  }
  if (!a12)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "kcvBuffer", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 489);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    int v42 = logString + 120;
    if (__osLogPearlLib) {
      id v50 = __osLogPearlLib;
    }
    else {
      id v50 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_126;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v69 = "kcvBuffer";
    __int16 v70 = 2048;
    uint64_t v71 = 0;
    __int16 v72 = 2080;
    id v73 = "";
    __int16 v74 = 2080;
    uint64_t v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v76 = 1024;
    int v77 = 489;
LABEL_125:
    _os_log_impl(&dword_22F4CB000, v50, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_126:
    uint64_t v34 = 258;
    goto LABEL_57;
  }
  if (!a13 || *a13 <= 2uLL)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outKCVLength && (*outKCVLength >= 3)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 490);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    int v42 = logString + 120;
    if (__osLogPearlLib) {
      uint64_t v49 = __osLogPearlLib;
    }
    else {
      uint64_t v49 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_82;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v69 = "outKCVLength && (*outKCVLength >= 3)";
    __int16 v70 = 2048;
    uint64_t v71 = 0;
    __int16 v72 = 2080;
    id v73 = "";
    __int16 v74 = 2080;
    uint64_t v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v76 = 1024;
    int v77 = 490;
LABEL_81:
    _os_log_impl(&dword_22F4CB000, v49, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_82:
    uint64_t v34 = 265;
    goto LABEL_57;
  }
  uint64_t v18 = initialize();
  if (v18)
  {
    uint64_t v34 = v18;
    uint64_t v51 = (int)v18;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v18, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 494);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    int v42 = logString + 120;
    if (__osLogPearlLib) {
      id v52 = __osLogPearlLib;
    }
    else {
      id v52 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v69 = "err == 0 ";
      __int16 v70 = 2048;
      uint64_t v71 = v51;
      __int16 v72 = 2080;
      id v73 = "";
      __int16 v74 = 2080;
      uint64_t v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v76 = 1024;
      int v77 = 494;
      _os_log_impl(&dword_22F4CB000, v52, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_57;
  }
  CFArrayRef v63 = a6;
  uint64_t v19 = (void *)MEMORY[0x263EFF9A0];
  v66[0] = @"GetCombined";
  v66[1] = @"StripImg4";
  v67[0] = MEMORY[0x263EFFA88];
  v67[1] = MEMORY[0x263EFFA80];
  v66[2] = @"VerifyData";
  v67[2] = MEMORY[0x263EFFA80];
  id v20 = (id)[NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:3];
  id v21 = (id)[v19 dictionaryWithDictionary:v20];

  if (a1)
  {
    id v22 = (id)[NSString stringWithFormat:@"%s/%@", a1, @"/System/Library/Caches/com.apple.factorydata"];
    if (v22)
    {
      id v23 = (id)[NSURL URLWithString:v22];
      if (v23)
      {
        int v24 = v23;
        [v21 setObject:v23 forKeyedSubscript:@"DataDirectory"];

        goto LABEL_19;
      }
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "fileURL", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 511);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      int v42 = logString + 120;
      if (__osLogPearlLib) {
        unsigned int v61 = __osLogPearlLib;
      }
      else {
        unsigned int v61 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
LABEL_203:

        uint64_t v34 = 261;
        goto LABEL_57;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v69 = "fileURL";
      __int16 v70 = 2048;
      uint64_t v71 = 0;
      __int16 v72 = 2080;
      id v73 = "";
      __int16 v74 = 2080;
      uint64_t v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v76 = 1024;
      int v77 = 511;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "pathString", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 509);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      int v42 = logString + 120;
      if (__osLogPearlLib) {
        unsigned int v61 = __osLogPearlLib;
      }
      else {
        unsigned int v61 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_203;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v69 = "pathString";
      __int16 v70 = 2048;
      uint64_t v71 = 0;
      __int16 v72 = 2080;
      id v73 = "";
      __int16 v74 = 2080;
      uint64_t v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v76 = 1024;
      int v77 = 509;
    }
    _os_log_impl(&dword_22F4CB000, v61, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_203;
  }
LABEL_19:
  id v25 = (void *)AMFDRSealingMapCopyLocalDataForClass();
  fprintf((FILE *)*MEMORY[0x263EF8348], "%s: Loading PSPC from FDR.\n", "getSavageProvisioningData");
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  int v26 = MEMORY[0x263EF8438];
  if (__osLogPearlLib) {
    __int16 v27 = __osLogPearlLib;
  }
  else {
    __int16 v27 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v69 = "getSavageProvisioningData";
    _os_log_impl(&dword_22F4CB000, v27, OS_LOG_TYPE_DEFAULT, "%s: Loading PSPC from FDR.\n", buf, 0xCu);
  }
  id v28 = (FILE *)*MEMORY[0x263EF8348];
  if (v25)
  {
    fprintf(v28, "%s: PSPC data found.\n", "getSavageProvisioningData");
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      char v29 = __osLogPearlLib;
    }
    else {
      char v29 = v26;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v69 = "getSavageProvisioningData";
      _os_log_impl(&dword_22F4CB000, v29, OS_LOG_TYPE_DEFAULT, "%s: PSPC data found.\n", buf, 0xCu);
    }
    size_t v30 = [v25 length] + 9;
    id v31 = (char *)calloc(v30, 1uLL);
    if (v31)
    {
      uint64_t v32 = v31;
      id v62 = v21;
      bzero(v31, v30);
      *(_DWORD *)uint64_t v32 = 1048579;
      v32[4] = 0;
      *(_DWORD *)(v32 + 5) = [v25 length];
      id v33 = v25;
      memcpy(v32 + 9, (const void *)[v33 bytes], *(unsigned int *)(v32 + 5));
      uint64_t v34 = performCommand(_connect, 36, 0, v32, v30, 0, 0);
      uint64_t v35 = (FILE *)*MEMORY[0x263EF8348];
      if (v34)
      {
        fprintf(v35, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v34, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 535);
        if (OSLogInit_onceToken != -1) {
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        }
        int v42 = logString + 120;
        if (__osLogPearlLib) {
          id v55 = __osLogPearlLib;
        }
        else {
          id v55 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v69 = "err == 0 ";
          __int16 v70 = 2048;
          uint64_t v71 = (int)v34;
          __int16 v72 = 2080;
          id v73 = "";
          __int16 v74 = 2080;
          uint64_t v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          __int16 v76 = 1024;
          int v77 = 535;
          _os_log_impl(&dword_22F4CB000, v55, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        goto LABEL_56;
      }
      fprintf(v35, "%s: PSPC data loaded to SEP.\n", "getSavageProvisioningData");
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        int v36 = __osLogPearlLib;
      }
      else {
        int v36 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v69 = "getSavageProvisioningData";
        _os_log_impl(&dword_22F4CB000, v36, OS_LOG_TYPE_DEFAULT, "%s: PSPC data loaded to SEP.\n", buf, 0xCu);
      }
      if (a7 >= 0xFFFFFFFFFFFFFFB4)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", a7 >= 0xFFFFFFFFFFFFFFB4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 541);
        if (OSLogInit_onceToken != -1) {
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        }
        int v42 = logString + 120;
        if (__osLogPearlLib) {
          id v56 = __osLogPearlLib;
        }
        else {
          id v56 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v69 = "err == 0 ";
          __int16 v70 = 2048;
          uint64_t v71 = a7 >= 0xFFFFFFFFFFFFFFB4;
          __int16 v72 = 2080;
          id v73 = "";
          __int16 v74 = 2080;
          uint64_t v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          __int16 v76 = 1024;
          int v77 = 541;
          _os_log_impl(&dword_22F4CB000, v56, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v34 = 1;
      }
      else
      {
        uint64_t v37 = (char *)calloc(a7 + 76, 1uLL);
        if (!v37)
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "inData", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 544);
          if (OSLogInit_onceToken != -1) {
            dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
          }
          int v42 = logString + 120;
          if (__osLogPearlLib) {
            CFArrayRef v57 = __osLogPearlLib;
          }
          else {
            CFArrayRef v57 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v69 = "inData";
            __int16 v70 = 2048;
            uint64_t v71 = 0;
            __int16 v72 = 2080;
            id v73 = "";
            __int16 v74 = 2080;
            uint64_t v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
            __int16 v76 = 1024;
            int v77 = 544;
            _os_log_impl(&dword_22F4CB000, v57, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          uint64_t v34 = 260;
          goto LABEL_56;
        }
        int v38 = v37;
        long long v39 = *a2;
        long long v40 = a2[1];
        long long v41 = a2[2];
        *((void *)v37 + 6) = *((void *)a2 + 6);
        *((_OWORD *)v37 + 1) = v40;
        *((_OWORD *)v37 + 2) = v41;
        *(_OWORD *)uint64_t v37 = v39;
        *(_OWORD *)(v37 + 56) = *a4;
        memcpy(v37 + 76, v63, a7);
        v38[18] = a7;
        int v42 = &logString[120];
        uint64_t v43 = performCommand(_connect, 2, 0, v38, a7 + 76, &v78, &v65);
        if (v43)
        {
          uint64_t v34 = v43;
          uint64_t v58 = (int)v43;
          fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v43, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 556);
          if (OSLogInit_onceToken != -1) {
            dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
          }
          if (__osLogPearlLib) {
            uint64_t v59 = __osLogPearlLib;
          }
          else {
            uint64_t v59 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v69 = "err == 0 ";
            __int16 v70 = 2048;
            uint64_t v71 = v58;
            __int16 v72 = 2080;
            id v73 = "";
            __int16 v74 = 2080;
            uint64_t v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
            __int16 v76 = 1024;
            int v77 = 556;
            _os_log_impl(&dword_22F4CB000, v59, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
        }
        else
        {
          id v44 = MEMORY[0x263EF8438];
          if (v65 == 75)
          {
            *a9 = 56;
            long long v45 = v79;
            *(_OWORD *)a8 = v78;
            *(_OWORD *)(a8 + 16) = v45;
            *(_OWORD *)(a8 + 32) = v80;
            *(void *)(a8 + 48) = *(void *)&v81[0];
            *a11 = 16;
            *a10 = *(_OWORD *)((char *)v81 + 8);
            *a13 = 3;
            *(_WORD *)a12 = WORD4(v81[1]);
            *(unsigned char *)(a12 + 2) = BYTE10(v81[1]);
            fprintf((FILE *)*MEMORY[0x263EF8348], "%s: Successfully got provisioning data.\n", "getSavageProvisioningData");
            if (OSLogInit_onceToken != -1) {
              dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
            }
            if (__osLogPearlLib) {
              unsigned int v46 = __osLogPearlLib;
            }
            else {
              unsigned int v46 = v44;
            }
            uint64_t v34 = 0;
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              uint64_t v69 = "getSavageProvisioningData";
              _os_log_impl(&dword_22F4CB000, v46, OS_LOG_TYPE_DEFAULT, "%s: Successfully got provisioning data.\n", buf, 0xCu);
              uint64_t v34 = 0;
            }
          }
          else
          {
            fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize == sizeof(outData)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 557);
            if (OSLogInit_onceToken != -1) {
              dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
            }
            if (__osLogPearlLib) {
              double v60 = __osLogPearlLib;
            }
            else {
              double v60 = v44;
            }
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v69 = "replySize == sizeof(outData)";
              __int16 v70 = 2048;
              uint64_t v71 = 0;
              __int16 v72 = 2080;
              id v73 = "";
              __int16 v74 = 2080;
              uint64_t v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
              __int16 v76 = 1024;
              int v77 = 557;
              _os_log_impl(&dword_22F4CB000, v60, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
            }
            uint64_t v34 = 261;
          }
        }
        free(v38);
      }
      id v21 = v62;
LABEL_56:
      free(v32);

      goto LABEL_57;
    }
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "fdrInput", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 525);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    int v42 = logString + 120;
    if (__osLogPearlLib) {
      id v54 = __osLogPearlLib;
    }
    else {
      id v54 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v69 = "fdrInput";
      __int16 v70 = 2048;
      uint64_t v71 = 0;
      __int16 v72 = 2080;
      id v73 = "";
      __int16 v74 = 2080;
      uint64_t v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v76 = 1024;
      int v77 = 525;
      _os_log_impl(&dword_22F4CB000, v54, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

    uint64_t v34 = 260;
  }
  else
  {
    fprintf(v28, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "pspcData", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 519);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    int v42 = logString + 120;
    if (__osLogPearlLib) {
      id v53 = __osLogPearlLib;
    }
    else {
      id v53 = v26;
    }
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v69 = "pspcData";
      __int16 v70 = 2048;
      uint64_t v71 = 0;
      __int16 v72 = 2080;
      id v73 = "";
      __int16 v74 = 2080;
      uint64_t v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v76 = 1024;
      int v77 = 519;
      _os_log_impl(&dword_22F4CB000, v53, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

    uint64_t v34 = 259;
  }
LABEL_57:
  io_connect_t v47 = *((_DWORD *)v42 + 1004);
  if (v47)
  {
    IOServiceClose(v47);
    *((_DWORD *)v42 + 1004) = 0;
  }
  return v34;
}

uint64_t checkSavageProvisioning(_DWORD *a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  CFAllocatorRef v2 = MEMORY[0x263EF8438];
  if (__osLogPearlLibTrace) {
    io_object_t v3 = __osLogPearlLibTrace;
  }
  else {
    io_object_t v3 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F4CB000, v3, OS_LOG_TYPE_DEFAULT, "checkSavageProvisioning\n", buf, 2u);
  }
  unsigned __int8 v16 = 0;
  uint64_t v15 = 1;
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "provisioningStatus", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 598);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v9 = __osLogPearlLib;
    }
    else {
      uint64_t v9 = v2;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v18 = "provisioningStatus";
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      id v22 = "";
      __int16 v23 = 2080;
      int v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v25 = 1024;
      int v26 = 598;
      _os_log_impl(&dword_22F4CB000, v9, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v7 = 258;
    goto LABEL_53;
  }
  uint64_t v4 = initialize();
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v10 = (int)v4;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 601);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v11 = __osLogPearlLib;
    }
    else {
      uint64_t v11 = v2;
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_53;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v18 = "err == 0 ";
    __int16 v19 = 2048;
    uint64_t v20 = v10;
    __int16 v21 = 2080;
    id v22 = "";
    __int16 v23 = 2080;
    int v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v25 = 1024;
    int v26 = 601;
LABEL_44:
    _os_log_impl(&dword_22F4CB000, v11, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_53;
  }
  uint64_t v5 = performCommand(_connect, 11, 0, 0, 0, &v16, &v15);
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v12 = (int)v5;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 604);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v11 = __osLogPearlLib;
    }
    else {
      uint64_t v11 = v2;
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_53;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v18 = "err == 0 ";
    __int16 v19 = 2048;
    uint64_t v20 = v12;
    __int16 v21 = 2080;
    id v22 = "";
    __int16 v23 = 2080;
    int v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v25 = 1024;
    int v26 = 604;
    goto LABEL_44;
  }
  if (v15 == 1)
  {
    *a1 = v16;
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v6 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v6 = v2;
    }
    uint64_t v7 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = 0;
      _os_log_impl(&dword_22F4CB000, v6, OS_LOG_TYPE_DEFAULT, "checkSavageProvisioning -> %d\n", buf, 8u);
      uint64_t v7 = 0;
    }
    goto LABEL_19;
  }
  fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize == sizeof(status)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 605);
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  if (__osLogPearlLib) {
    uint64_t v13 = __osLogPearlLib;
  }
  else {
    uint64_t v13 = v2;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v18 = "replySize == sizeof(status)";
    __int16 v19 = 2048;
    uint64_t v20 = 0;
    __int16 v21 = 2080;
    id v22 = "";
    __int16 v23 = 2080;
    int v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v25 = 1024;
    int v26 = 605;
    _os_log_impl(&dword_22F4CB000, v13, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  uint64_t v7 = 261;
LABEL_53:
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  if (__osLogPearlLibTrace) {
    __int16 v14 = __osLogPearlLibTrace;
  }
  else {
    __int16 v14 = v2;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v18) = v7;
    _os_log_impl(&dword_22F4CB000, v14, OS_LOG_TYPE_ERROR, "checkSavageProvisioning -> %d\n", buf, 8u);
  }
LABEL_19:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  return v7;
}

uint64_t getPearlSelfTestResult(void *a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  CFAllocatorRef v2 = MEMORY[0x263EF8438];
  if (__osLogPearlLibTrace) {
    io_object_t v3 = __osLogPearlLibTrace;
  }
  else {
    io_object_t v3 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F4CB000, v3, OS_LOG_TYPE_DEFAULT, "getPearlSelfTestResult\n", buf, 2u);
  }
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outResult", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 626);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v9 = __osLogPearlLib;
    }
    else {
      uint64_t v9 = v2;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v18 = "outResult";
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      id v22 = "";
      __int16 v23 = 2080;
      int v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v25 = 1024;
      int v26 = 626;
      _os_log_impl(&dword_22F4CB000, v9, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v7 = 258;
    goto LABEL_53;
  }
  uint64_t v4 = initialize();
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v10 = (int)v4;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 629);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v11 = __osLogPearlLib;
    }
    else {
      uint64_t v11 = v2;
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_53;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v18 = "err == 0 ";
    __int16 v19 = 2048;
    uint64_t v20 = v10;
    __int16 v21 = 2080;
    id v22 = "";
    __int16 v23 = 2080;
    int v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v25 = 1024;
    int v26 = 629;
LABEL_44:
    _os_log_impl(&dword_22F4CB000, v11, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_53;
  }
  uint64_t v15 = 8;
  uint64_t v16 = 0;
  uint64_t v5 = performCommand(_connect, 58, 0, 0, 0, &v16, &v15);
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v12 = (int)v5;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 635);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v11 = __osLogPearlLib;
    }
    else {
      uint64_t v11 = v2;
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_53;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v18 = "err == 0 ";
    __int16 v19 = 2048;
    uint64_t v20 = v12;
    __int16 v21 = 2080;
    id v22 = "";
    __int16 v23 = 2080;
    int v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v25 = 1024;
    int v26 = 635;
    goto LABEL_44;
  }
  if (v15 == 8)
  {
    *a1 = v16;
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v6 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v6 = v2;
    }
    uint64_t v7 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = 0;
      _os_log_impl(&dword_22F4CB000, v6, OS_LOG_TYPE_DEFAULT, "getPearlSelfTestResult -> %d\n", buf, 8u);
      uint64_t v7 = 0;
    }
    goto LABEL_19;
  }
  fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "size == sizeof(response)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 636);
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  if (__osLogPearlLib) {
    uint64_t v13 = __osLogPearlLib;
  }
  else {
    uint64_t v13 = v2;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v18 = "size == sizeof(response)";
    __int16 v19 = 2048;
    uint64_t v20 = 0;
    __int16 v21 = 2080;
    id v22 = "";
    __int16 v23 = 2080;
    int v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v25 = 1024;
    int v26 = 636;
    _os_log_impl(&dword_22F4CB000, v13, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  uint64_t v7 = 263;
LABEL_53:
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  if (__osLogPearlLibTrace) {
    __int16 v14 = __osLogPearlLibTrace;
  }
  else {
    __int16 v14 = v2;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v18) = v7;
    _os_log_impl(&dword_22F4CB000, v14, OS_LOG_TYPE_ERROR, "getPearlSelfTestResult -> %d\n", buf, 8u);
  }
LABEL_19:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  return v7;
}

uint64_t simulateSelfTestFailure(int a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  CFAllocatorRef v2 = MEMORY[0x263EF8438];
  if (__osLogPearlLibTrace) {
    io_object_t v3 = __osLogPearlLibTrace;
  }
  else {
    io_object_t v3 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F4CB000, v3, OS_LOG_TYPE_DEFAULT, "simulateSelfTestFailure\n", buf, 2u);
  }
  uint64_t v4 = initialize();
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v9 = (int)v4;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 658);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v10 = __osLogPearlLib;
    }
    else {
      uint64_t v10 = v2;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v17 = "err == 0 ";
    __int16 v18 = 2048;
    uint64_t v19 = v9;
    __int16 v20 = 2080;
    __int16 v21 = "";
    __int16 v22 = 2080;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v24 = 1024;
    int v25 = 658;
    goto LABEL_34;
  }
  v13[0] = -1;
  v13[1] = -1;
  int v14 = -1;
  int v15 = a1;
  uint64_t v5 = performCommand(_connect, 44, 0, v13, 0x18uLL, 0, 0);
  if (!v5)
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v6 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v6 = v2;
    }
    uint64_t v7 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = 0;
      _os_log_impl(&dword_22F4CB000, v6, OS_LOG_TYPE_DEFAULT, "simulateSelfTestFailure -> %d\n", buf, 8u);
      uint64_t v7 = 0;
    }
    goto LABEL_17;
  }
  uint64_t v7 = v5;
  uint64_t v11 = (int)v5;
  fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 664);
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  if (__osLogPearlLib) {
    uint64_t v10 = __osLogPearlLib;
  }
  else {
    uint64_t v10 = v2;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v17 = "err == 0 ";
    __int16 v18 = 2048;
    uint64_t v19 = v11;
    __int16 v20 = 2080;
    __int16 v21 = "";
    __int16 v22 = 2080;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v24 = 1024;
    int v25 = 664;
LABEL_34:
    _os_log_impl(&dword_22F4CB000, v10, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_35:
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  if (__osLogPearlLibTrace) {
    uint64_t v12 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v12 = v2;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v17) = v7;
    _os_log_impl(&dword_22F4CB000, v12, OS_LOG_TYPE_ERROR, "simulateSelfTestFailure -> %d\n", buf, 8u);
  }
LABEL_17:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  return v7;
}

uint64_t checkSecureStreaming()
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  mach_port_t v0 = MEMORY[0x263EF8438];
  if (__osLogPearlLibTrace) {
    CFDictionaryRef v1 = __osLogPearlLibTrace;
  }
  else {
    CFDictionaryRef v1 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F4CB000, v1, OS_LOG_TYPE_DEFAULT, "checkSecureStreaming\n", buf, 2u);
  }
  uint64_t v2 = checkSecureStreamingAndVerifySignatures(0);
  if (v2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v2, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 684);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v7 = __osLogPearlLib;
    }
    else {
      uint64_t v7 = v0;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v10 = "err == 0 ";
      __int16 v11 = 2048;
      uint64_t v12 = (int)v2;
      __int16 v13 = 2080;
      int v14 = "";
      __int16 v15 = 2080;
      uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v17 = 1024;
      int v18 = 684;
      _os_log_impl(&dword_22F4CB000, v7, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v8 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v8 = v0;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v10) = v2;
      uint64_t v4 = v8;
      os_log_type_t v5 = OS_LOG_TYPE_ERROR;
      goto LABEL_16;
    }
  }
  else
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      io_object_t v3 = __osLogPearlLibTrace;
    }
    else {
      io_object_t v3 = v0;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v10) = 0;
      uint64_t v4 = v3;
      os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
LABEL_16:
      _os_log_impl(&dword_22F4CB000, v4, v5, "checkSecureStreaming -> %d\n", buf, 8u);
    }
  }
  return v2;
}

uint64_t checkSecureStreamingAndVerifySignatures(int a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  uint64_t v2 = MEMORY[0x263EF8438];
  if (__osLogPearlLibTrace) {
    io_object_t v3 = __osLogPearlLibTrace;
  }
  else {
    io_object_t v3 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v14) = a1;
    _os_log_impl(&dword_22F4CB000, v3, OS_LOG_TYPE_DEFAULT, "checkSecureStreamingAndVerifySignatures (%u)\n", buf, 8u);
  }
  uint64_t v4 = initialize();
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v9 = (int)v4;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 703);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v10 = __osLogPearlLib;
    }
    else {
      uint64_t v10 = v2;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 136316162;
    int v14 = "err == 0 ";
    __int16 v15 = 2048;
    uint64_t v16 = v9;
    __int16 v17 = 2080;
    int v18 = "";
    __int16 v19 = 2080;
    __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v21 = 1024;
    int v22 = 703;
    goto LABEL_34;
  }
  uint64_t v5 = performCommand(_connect, 59, a1, 0, 0, 0, 0);
  if (!v5)
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v6 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v6 = v2;
    }
    uint64_t v7 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v14) = 0;
      _os_log_impl(&dword_22F4CB000, v6, OS_LOG_TYPE_DEFAULT, "checkSecureStreamingAndVerifySignatures -> %d\n", buf, 8u);
      uint64_t v7 = 0;
    }
    goto LABEL_17;
  }
  uint64_t v7 = v5;
  uint64_t v11 = (int)v5;
  fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 706);
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  if (__osLogPearlLib) {
    uint64_t v10 = __osLogPearlLib;
  }
  else {
    uint64_t v10 = v2;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    int v14 = "err == 0 ";
    __int16 v15 = 2048;
    uint64_t v16 = v11;
    __int16 v17 = 2080;
    int v18 = "";
    __int16 v19 = 2080;
    __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v21 = 1024;
    int v22 = 706;
LABEL_34:
    _os_log_impl(&dword_22F4CB000, v10, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_35:
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  if (__osLogPearlLibTrace) {
    uint64_t v12 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v12 = v2;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v14) = v7;
    _os_log_impl(&dword_22F4CB000, v12, OS_LOG_TYPE_ERROR, "checkSecureStreamingAndVerifySignatures -> %d\n", buf, 8u);
  }
LABEL_17:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  return v7;
}

uint64_t prewarmCamera(int a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  uint64_t v2 = MEMORY[0x263EF8438];
  if (__osLogPearlLibTrace) {
    io_object_t v3 = __osLogPearlLibTrace;
  }
  else {
    io_object_t v3 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v14) = a1;
    _os_log_impl(&dword_22F4CB000, v3, OS_LOG_TYPE_DEFAULT, "prewarmCamera (%u)\n", buf, 8u);
  }
  uint64_t v4 = initialize();
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v9 = (int)v4;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 726);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v10 = __osLogPearlLib;
    }
    else {
      uint64_t v10 = v2;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 136316162;
    int v14 = "err == 0 ";
    __int16 v15 = 2048;
    uint64_t v16 = v9;
    __int16 v17 = 2080;
    int v18 = "";
    __int16 v19 = 2080;
    __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v21 = 1024;
    int v22 = 726;
    goto LABEL_34;
  }
  uint64_t v5 = performCommand(_connect, 43, a1, 0, 0, 0, 0);
  if (!v5)
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v6 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v6 = v2;
    }
    uint64_t v7 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v14) = 0;
      _os_log_impl(&dword_22F4CB000, v6, OS_LOG_TYPE_DEFAULT, "prewarmCamera -> %d\n", buf, 8u);
      uint64_t v7 = 0;
    }
    goto LABEL_17;
  }
  uint64_t v7 = v5;
  uint64_t v11 = (int)v5;
  fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 729);
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  if (__osLogPearlLib) {
    uint64_t v10 = __osLogPearlLib;
  }
  else {
    uint64_t v10 = v2;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    int v14 = "err == 0 ";
    __int16 v15 = 2048;
    uint64_t v16 = v11;
    __int16 v17 = 2080;
    int v18 = "";
    __int16 v19 = 2080;
    __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v21 = 1024;
    int v22 = 729;
LABEL_34:
    _os_log_impl(&dword_22F4CB000, v10, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_35:
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  if (__osLogPearlLibTrace) {
    uint64_t v12 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v12 = v2;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v14) = v7;
    _os_log_impl(&dword_22F4CB000, v12, OS_LOG_TYPE_ERROR, "prewarmCamera -> %d\n", buf, 8u);
  }
LABEL_17:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  return v7;
}

uint64_t setEntitlementOverride(int a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v13 = a1;
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  uint64_t v2 = MEMORY[0x263EF8438];
  if (__osLogPearlLibTrace) {
    io_object_t v3 = __osLogPearlLibTrace;
  }
  else {
    io_object_t v3 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v15) = a1;
    _os_log_impl(&dword_22F4CB000, v3, OS_LOG_TYPE_DEFAULT, "setEntitlementOverrideConfig (0x%x)\n", buf, 8u);
  }
  uint64_t v4 = initialize();
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v9 = (int)v4;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 749);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v10 = __osLogPearlLib;
    }
    else {
      uint64_t v10 = v2;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v15 = "err == 0 ";
    __int16 v16 = 2048;
    uint64_t v17 = v9;
    __int16 v18 = 2080;
    __int16 v19 = "";
    __int16 v20 = 2080;
    __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v22 = 1024;
    int v23 = 749;
    goto LABEL_34;
  }
  uint64_t v5 = performCommand(_connect, 64, 0, &v13, 4uLL, 0, 0);
  if (!v5)
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v6 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v6 = v2;
    }
    uint64_t v7 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v15) = 0;
      _os_log_impl(&dword_22F4CB000, v6, OS_LOG_TYPE_DEFAULT, "setEntitlementOverrideConfig -> %d\n", buf, 8u);
      uint64_t v7 = 0;
    }
    goto LABEL_17;
  }
  uint64_t v7 = v5;
  uint64_t v11 = (int)v5;
  fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 752);
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  if (__osLogPearlLib) {
    uint64_t v10 = __osLogPearlLib;
  }
  else {
    uint64_t v10 = v2;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    __int16 v15 = "err == 0 ";
    __int16 v16 = 2048;
    uint64_t v17 = v11;
    __int16 v18 = 2080;
    __int16 v19 = "";
    __int16 v20 = 2080;
    __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v22 = 1024;
    int v23 = 752;
LABEL_34:
    _os_log_impl(&dword_22F4CB000, v10, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_35:
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  if (__osLogPearlLibTrace) {
    uint64_t v12 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v12 = v2;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v15) = v7;
    _os_log_impl(&dword_22F4CB000, v12, OS_LOG_TYPE_ERROR, "setEntitlementOverrideConfig -> %d\n", buf, 8u);
  }
LABEL_17:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  return v7;
}

uint64_t pearlSeaCookieHandleMessage(int a1, const void *a2, size_t a3, void *a4, void *a5, id a6)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v42 = a6;
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  uint64_t v11 = &logString[120];
  uint64_t v12 = MEMORY[0x263EF8438];
  if (__osLogPearlLibTrace) {
    int v13 = __osLogPearlLibTrace;
  }
  else {
    int v13 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)id v44 = a1;
    *(_WORD *)&v44[4] = 2048;
    *(void *)&v44[6] = a2;
    *(_WORD *)&v44[14] = 2048;
    *(void *)&v44[16] = a3;
    *(_WORD *)&v44[24] = 2048;
    *(void *)&v44[26] = a4;
    *(_WORD *)&v44[34] = 2048;
    *(void *)&v44[36] = a5;
    _os_log_impl(&dword_22F4CB000, v13, OS_LOG_TYPE_DEFAULT, "pearlSeaCookieHandleMessage %d %p %zu %p %p\n", buf, 0x30u);
  }
  if (a1 && a1 != 7)
  {
    if (!a2)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(type == kPearlFactorySeaCookieMessageS0) || (type == kPearlFactorySeaCookieGenerateNonce) || message", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 776);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      __int16 v19 = logString + 120;
      __int16 v21 = v42;
      if (__osLogPearlLib) {
        size_t v30 = __osLogPearlLib;
      }
      else {
        size_t v30 = v12;
      }
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_110;
      }
      *(_DWORD *)buf = 136316162;
      *(void *)id v44 = "(type == kPearlFactorySeaCookieMessageS0) || (type == kPearlFactorySeaCookieGenerateNonce) || message";
      *(_WORD *)&v44[8] = 2048;
      *(void *)&v44[10] = 0;
      *(_WORD *)&v44[18] = 2080;
      *(void *)&v44[20] = "";
      *(_WORD *)&v44[28] = 2080;
      *(void *)&v44[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v44[38] = 1024;
      *(_DWORD *)&v44[40] = 776;
      goto LABEL_109;
    }
    if (!a3)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(type == kPearlFactorySeaCookieMessageS0) || (type == kPearlFactorySeaCookieGenerateNonce) || messageSize", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 777);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        long long v41 = __osLogPearlLib;
      }
      else {
        long long v41 = v12;
      }
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)id v44 = "(type == kPearlFactorySeaCookieMessageS0) || (type == kPearlFactorySeaCookieGenerateNonce) || messageSize";
        *(_WORD *)&v44[8] = 2048;
        *(void *)&v44[10] = 0;
        *(_WORD *)&v44[18] = 2080;
        *(void *)&v44[20] = "";
        *(_WORD *)&v44[28] = 2080;
        *(void *)&v44[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        *(_WORD *)&v44[38] = 1024;
        *(_DWORD *)&v44[40] = 777;
        _os_log_impl(&dword_22F4CB000, v41, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      __int16 v18 = 0;
      uint64_t v27 = 258;
      goto LABEL_71;
    }
  }
  if (a1 != 8 && !a4)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(type == kPearlFactorySeaCookieValidateTatsuTicket) || reply", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 778);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    __int16 v19 = logString + 120;
    __int16 v21 = v42;
    if (__osLogPearlLib) {
      size_t v30 = __osLogPearlLib;
    }
    else {
      size_t v30 = v12;
    }
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_110;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)id v44 = "(type == kPearlFactorySeaCookieValidateTatsuTicket) || reply";
    *(_WORD *)&v44[8] = 2048;
    *(void *)&v44[10] = 0;
    *(_WORD *)&v44[18] = 2080;
    *(void *)&v44[20] = "";
    *(_WORD *)&v44[28] = 2080;
    *(void *)&v44[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v44[38] = 1024;
    *(_DWORD *)&v44[40] = 778;
    goto LABEL_109;
  }
  if (a1 != 8 && !a5)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(type == kPearlFactorySeaCookieValidateTatsuTicket) || replySize", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 779);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    __int16 v19 = logString + 120;
    __int16 v21 = v42;
    if (__osLogPearlLib) {
      size_t v30 = __osLogPearlLib;
    }
    else {
      size_t v30 = v12;
    }
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_110;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)id v44 = "(type == kPearlFactorySeaCookieValidateTatsuTicket) || replySize";
    *(_WORD *)&v44[8] = 2048;
    *(void *)&v44[10] = 0;
    *(_WORD *)&v44[18] = 2080;
    *(void *)&v44[20] = "";
    *(_WORD *)&v44[28] = 2080;
    *(void *)&v44[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v44[38] = 1024;
    *(_DWORD *)&v44[40] = 779;
LABEL_109:
    _os_log_impl(&dword_22F4CB000, v30, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_110:
    __int16 v18 = 0;
    uint64_t v27 = 258;
    goto LABEL_129;
  }
  if (a5) {
    uint64_t v14 = *a5;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = initialize();
  if (v15)
  {
    uint64_t v27 = v15;
    uint64_t v31 = (int)v15;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v15, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 786);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v32 = __osLogPearlLib;
    }
    else {
      uint64_t v32 = v12;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)id v44 = "err == 0 ";
      *(_WORD *)&v44[8] = 2048;
      *(void *)&v44[10] = v31;
      *(_WORD *)&v44[18] = 2080;
      *(void *)&v44[20] = "";
      *(_WORD *)&v44[28] = 2080;
      *(void *)&v44[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v44[38] = 1024;
      *(_DWORD *)&v44[40] = 786;
      _os_log_impl(&dword_22F4CB000, v32, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    __int16 v18 = 0;
LABEL_71:
    __int16 v19 = logString + 120;
LABEL_119:
    __int16 v21 = v42;
    goto LABEL_129;
  }
  size_t v16 = a3 + 13;
  if (a3 >= 0xFFFFFFFFFFFFFFF3)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", a3 >= 0xFFFFFFFFFFFFFFF3, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 789);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    __int16 v19 = logString + 120;
    uint64_t v11 = logString + 120;
    if (__osLogPearlLib) {
      id v33 = __osLogPearlLib;
    }
    else {
      id v33 = v12;
    }
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)id v44 = "err == 0 ";
      *(_WORD *)&v44[8] = 2048;
      *(void *)&v44[10] = a3 >= 0xFFFFFFFFFFFFFFF3;
      *(_WORD *)&v44[18] = 2080;
      *(void *)&v44[20] = "";
      *(_WORD *)&v44[28] = 2080;
      *(void *)&v44[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v44[38] = 1024;
      *(_DWORD *)&v44[40] = 789;
      _os_log_impl(&dword_22F4CB000, v33, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    __int16 v18 = 0;
    uint64_t v27 = 1;
    goto LABEL_119;
  }
  uint64_t v17 = (char *)malloc(a3 + 13);
  if (!v17)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "inData", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 792);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    __int16 v19 = logString + 120;
    uint64_t v11 = logString + 120;
    uint64_t v27 = 3758097085;
    if (__osLogPearlLib) {
      uint64_t v34 = __osLogPearlLib;
    }
    else {
      uint64_t v34 = v12;
    }
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)id v44 = "inData";
      *(_WORD *)&v44[8] = 2048;
      *(void *)&v44[10] = 0;
      *(_WORD *)&v44[18] = 2080;
      *(void *)&v44[20] = "";
      *(_WORD *)&v44[28] = 2080;
      *(void *)&v44[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v44[38] = 1024;
      *(_DWORD *)&v44[40] = 792;
      _os_log_impl(&dword_22F4CB000, v34, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    __int16 v18 = 0;
    goto LABEL_119;
  }
  __int16 v18 = v17;
  *(_DWORD *)uint64_t v17 = a1;
  v17[4] = 1;
  *(void *)(v17 + 5) = a3;
  memcpy(v17 + 13, a2, a3);
  __int16 v19 = &logString[120];
  uint64_t v20 = performCommand(_connect, 70, 0, v18, a3 + 13, a4, a5);
  if (v20)
  {
    uint64_t v27 = v20;
    uint64_t v35 = (int)v20;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v20, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 800);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      int v36 = __osLogPearlLib;
    }
    else {
      int v36 = v12;
    }
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)id v44 = "err == 0 ";
    *(_WORD *)&v44[8] = 2048;
    *(void *)&v44[10] = v35;
    *(_WORD *)&v44[18] = 2080;
    *(void *)&v44[20] = "";
    *(_WORD *)&v44[28] = 2080;
    *(void *)&v44[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v44[38] = 1024;
    *(_DWORD *)&v44[40] = 800;
    goto LABEL_127;
  }
  __int16 v21 = v42;
  if (a1 == 2) {
    goto LABEL_27;
  }
  if (a1 != 5) {
    goto LABEL_28;
  }
  if (!v42)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "callback", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 804);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    uint64_t v11 = logString + 120;
    if (__osLogPearlLib) {
      int v38 = __osLogPearlLib;
    }
    else {
      int v38 = v12;
    }
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)id v44 = "callback";
      *(_WORD *)&v44[8] = 2048;
      *(void *)&v44[10] = 0;
      *(_WORD *)&v44[18] = 2080;
      *(void *)&v44[20] = "";
      *(_WORD *)&v44[28] = 2080;
      *(void *)&v44[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v44[38] = 1024;
      *(_DWORD *)&v44[40] = 804;
      _os_log_impl(&dword_22F4CB000, v38, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v27 = 258;
    goto LABEL_119;
  }
  uint64_t v22 = (*((uint64_t (**)(id, void, void *, void))v42 + 2))(v42, 0, a4, *a5);
  if (!v22)
  {
LABEL_27:
    v18[4] = 0;
    *a5 = v14;
    uint64_t v23 = performCommand(_connect, 70, 0, v18, v16, a4, a5);
    if (!v23)
    {
LABEL_28:
      if (a4 && a5)
      {
        if (OSLogInit_onceToken != -1) {
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        }
        if (__osLogPearlLib) {
          uint64_t v24 = __osLogPearlLib;
        }
        else {
          uint64_t v24 = v12;
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = *a5;
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)id v44 = a1;
          *(_WORD *)&v44[4] = 2048;
          *(void *)&v44[6] = v25;
          *(_WORD *)&v44[14] = 1040;
          *(_DWORD *)&v44[16] = v25;
          *(_WORD *)&v44[20] = 2096;
          *(void *)&v44[22] = a4;
          _os_log_impl(&dword_22F4CB000, v24, OS_LOG_TYPE_DEFAULT, "pearlSeaCookieHandleMessage, type=%d reply[%zu] %.*P\n", buf, 0x22u);
        }
      }
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLibTrace) {
        uint64_t v26 = __osLogPearlLibTrace;
      }
      else {
        uint64_t v26 = v12;
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)id v44 = a1;
        *(_WORD *)&v44[4] = 1024;
        *(_DWORD *)&v44[6] = 0;
        _os_log_impl(&dword_22F4CB000, v26, OS_LOG_TYPE_DEFAULT, "pearlSeaCookieHandleMessage, type=%d -> 0x%x\n", buf, 0xEu);
      }
      uint64_t v27 = 0;
LABEL_45:
      free(v18);
      goto LABEL_46;
    }
    uint64_t v27 = v23;
    uint64_t v37 = (int)v23;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v23, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 814);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      int v36 = __osLogPearlLib;
    }
    else {
      int v36 = v12;
    }
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)id v44 = "err == 0 ";
    *(_WORD *)&v44[8] = 2048;
    *(void *)&v44[10] = v37;
    *(_WORD *)&v44[18] = 2080;
    *(void *)&v44[20] = "";
    *(_WORD *)&v44[28] = 2080;
    *(void *)&v44[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v44[38] = 1024;
    *(_DWORD *)&v44[40] = 814;
    goto LABEL_127;
  }
  uint64_t v27 = v22;
  uint64_t v39 = (int)v22;
  fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v22, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 807);
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  if (__osLogPearlLib) {
    int v36 = __osLogPearlLib;
  }
  else {
    int v36 = v12;
  }
  if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_128;
  }
  *(_DWORD *)buf = 136316162;
  *(void *)id v44 = "err == 0 ";
  *(_WORD *)&v44[8] = 2048;
  *(void *)&v44[10] = v39;
  *(_WORD *)&v44[18] = 2080;
  *(void *)&v44[20] = "";
  *(_WORD *)&v44[28] = 2080;
  *(void *)&v44[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
  *(_WORD *)&v44[38] = 1024;
  *(_DWORD *)&v44[40] = 807;
LABEL_127:
  _os_log_impl(&dword_22F4CB000, v36, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_128:
  __int16 v19 = logString + 120;
  __int16 v21 = v42;
  uint64_t v11 = &logString[120];
LABEL_129:
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  if (*((void *)v11 + 498)) {
    long long v40 = *((void *)v11 + 498);
  }
  else {
    long long v40 = v12;
  }
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)id v44 = a1;
    *(_WORD *)&v44[4] = 1024;
    *(_DWORD *)&v44[6] = v27;
    _os_log_impl(&dword_22F4CB000, v40, OS_LOG_TYPE_ERROR, "pearlSeaCookieHandleMessage, type=%d -> 0x%x\n", buf, 0xEu);
  }
  if (v18) {
    goto LABEL_45;
  }
LABEL_46:
  io_connect_t v28 = *((_DWORD *)v19 + 1004);
  if (v28)
  {
    IOServiceClose(v28);
    *((_DWORD *)v19 + 1004) = 0;
  }

  return v27;
}

uint64_t mapScheme3ObjectToISPANE(int *a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  uint64_t v2 = MEMORY[0x263EF8438];
  if (__osLogPearlLibTrace) {
    io_object_t v3 = __osLogPearlLibTrace;
  }
  else {
    io_object_t v3 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68157954;
    *(_DWORD *)size_t v16 = 4;
    *(_WORD *)&v16[4] = 2080;
    *(void *)&v16[6] = a1;
    _os_log_impl(&dword_22F4CB000, v3, OS_LOG_TYPE_DEFAULT, "mapScheme3Object: fourcc:%.4s\n\n", buf, 0x12u);
  }
  int v13 = *a1;
  char v14 = *((unsigned char *)a1 + 4);
  uint64_t v4 = initialize();
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v9 = (int)v4;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 842);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v10 = __osLogPearlLib;
    }
    else {
      uint64_t v10 = v2;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)size_t v16 = "err == 0 ";
    *(_WORD *)&v16[8] = 2048;
    *(void *)&v16[10] = v9;
    __int16 v17 = 2080;
    __int16 v18 = "";
    __int16 v19 = 2080;
    uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v21 = 1024;
    int v22 = 842;
    goto LABEL_34;
  }
  uint64_t v5 = performCommand(_connect, 72, 0, &v13, 5uLL, 0, 0);
  if (!v5)
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v6 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v6 = v2;
    }
    uint64_t v7 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)size_t v16 = 0;
      _os_log_impl(&dword_22F4CB000, v6, OS_LOG_TYPE_DEFAULT, "mapScheme3Object -> 0x%x\n", buf, 8u);
      uint64_t v7 = 0;
    }
    goto LABEL_17;
  }
  uint64_t v7 = v5;
  uint64_t v11 = (int)v5;
  fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 845);
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  if (__osLogPearlLib) {
    uint64_t v10 = __osLogPearlLib;
  }
  else {
    uint64_t v10 = v2;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    *(void *)size_t v16 = "err == 0 ";
    *(_WORD *)&v16[8] = 2048;
    *(void *)&v16[10] = v11;
    __int16 v17 = 2080;
    __int16 v18 = "";
    __int16 v19 = 2080;
    uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v21 = 1024;
    int v22 = 845;
LABEL_34:
    _os_log_impl(&dword_22F4CB000, v10, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_35:
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  if (__osLogPearlLibTrace) {
    uint64_t v12 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v12 = v2;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)size_t v16 = v7;
    _os_log_impl(&dword_22F4CB000, v12, OS_LOG_TYPE_ERROR, "mapScheme3Object -> 0x%x\n", buf, 8u);
  }
LABEL_17:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  return v7;
}

uint64_t allocateAndMapObjectS3C1(int *a1, int a2, int a3)
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  uint64_t v6 = &logString[120];
  uint64_t v7 = MEMORY[0x263EF8438];
  if (__osLogPearlLibTrace) {
    uint64_t v8 = (void *)__osLogPearlLibTrace;
  }
  else {
    uint64_t v8 = (void *)MEMORY[0x263EF8438];
  }
  uint64_t v9 = v8;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68158466;
    *(_DWORD *)v93 = 4;
    *(_WORD *)&v93[4] = 2080;
    *(void *)&v93[6] = a1;
    *(_WORD *)&v93[14] = 1024;
    *(_DWORD *)&v93[16] = a2;
    LOWORD(v94) = 1024;
    *(_DWORD *)((char *)&v94 + 2) = a3;
    _os_log_impl(&dword_22F4CB000, v9, OS_LOG_TYPE_DEFAULT, "allocateAndMapObjectS3C1: fourcc:%.4s mapObj:%d unmapObj:%d\n\n", buf, 0x1Eu);
  }

  *(void *)unsigned int v91 = 0;
  *(void *)&v91[8] = 0;
  *(_DWORD *)&v91[15] = 0;
  int v87 = *a1;
  char v88 = *((unsigned char *)a1 + 4);
  char v89 = a2;
  char v90 = a3;
  unint64_t v86 = 19;
  uint64_t v10 = initialize();
  uint64_t v11 = &logString[120];
  if (v10)
  {
    uint64_t v13 = v10;
    uint64_t v81 = (int)v10;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v10, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 873);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v82 = __osLogPearlLib;
    }
    else {
      uint64_t v82 = v7;
    }
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v93 = "err == 0 ";
      *(_WORD *)&v93[8] = 2048;
      *(void *)&v93[10] = v81;
      *(_WORD *)&v93[18] = 2080;
      v94 = "";
      __int16 v95 = 2080;
      v96 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v97 = 1024;
      int v98 = 873;
      _os_log_impl(&dword_22F4CB000, v82, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_177;
  }
  uint64_t v12 = performCommand(_connect, 82, 0, &v87, 7uLL, v91, &v86);
  if (v12 != -536870201)
  {
    uint64_t v13 = v12;
    if (v12)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 877);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        uint64_t v83 = __osLogPearlLib;
      }
      else {
        uint64_t v83 = v7;
      }
      int v84 = v83;
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)v93 = "err == 0 ";
        *(_WORD *)&v93[8] = 2048;
        *(void *)&v93[10] = (int)v13;
        *(_WORD *)&v93[18] = 2080;
        v94 = "";
        __int16 v95 = 2080;
        v96 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v97 = 1024;
        int v98 = 877;
        _os_log_impl(&dword_22F4CB000, v84, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }

      uint64_t v6 = logString + 120;
    }
    char v14 = (FILE **)MEMORY[0x263EF8348];
    uint64_t v15 = (FILE *)*MEMORY[0x263EF8348];
    if (v86 <= 0x12)
    {
      fprintf(v15, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize >= sizeof(cmd_alloc_map_s3c1_out_v1_t)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 879);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      uint64_t v11 = logString + 120;
      if (__osLogPearlLib) {
        int v85 = __osLogPearlLib;
      }
      else {
        int v85 = v7;
      }
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)v93 = "replySize >= sizeof(cmd_alloc_map_s3c1_out_v1_t)";
        *(_WORD *)&v93[8] = 2048;
        *(void *)&v93[10] = 0;
        *(_WORD *)&v93[18] = 2080;
        v94 = "";
        __int16 v95 = 2080;
        v96 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v97 = 1024;
        int v98 = 879;
        _os_log_impl(&dword_22F4CB000, v85, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v13 = 3758097090;
    }
    else
    {
      fwrite("Results of Allocation and Mapping Object Scheme3 Context1:\n", 0x3BuLL, 1uLL, v15);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        size_t v16 = __osLogPearlLib;
      }
      else {
        size_t v16 = v7;
      }
      __int16 v17 = v16;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22F4CB000, v17, OS_LOG_TYPE_DEFAULT, "Results of Allocation and Mapping Object Scheme3 Context1:\n", buf, 2u);
      }

      if (v91[0]) {
        __int16 v18 = "\x1B[32mSUCCESS\x1B[0m";
      }
      else {
        __int16 v18 = "\x1B[31mFAIL\x1B[0m";
      }
      fprintf(*v14, "objectFound:\t\t%s\n", v18);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        __int16 v19 = __osLogPearlLib;
      }
      else {
        __int16 v19 = v7;
      }
      uint64_t v20 = v19;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        if (v91[0]) {
          __int16 v21 = "\x1B[32mSUCCESS\x1B[0m";
        }
        else {
          __int16 v21 = "\x1B[31mFAIL\x1B[0m";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v93 = v21;
        _os_log_impl(&dword_22F4CB000, v20, OS_LOG_TYPE_DEFAULT, "objectFound:\t\t%s\n", buf, 0xCu);
      }

      fprintf(*v14, "dvaOffset:\t\t0x%X\n", *(_DWORD *)&v91[1]);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        int v22 = __osLogPearlLib;
      }
      else {
        int v22 = v7;
      }
      uint64_t v23 = v22;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v93 = *(_DWORD *)&v91[1];
        _os_log_impl(&dword_22F4CB000, v23, OS_LOG_TYPE_DEFAULT, "dvaOffset:\t\t0x%X\n", buf, 8u);
      }

      fprintf(*v14, "objectSize:\t\t%d\n", *(_DWORD *)&v91[5]);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        uint64_t v24 = __osLogPearlLib;
      }
      else {
        uint64_t v24 = v7;
      }
      uint64_t v25 = v24;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v93 = *(_DWORD *)&v91[5];
        _os_log_impl(&dword_22F4CB000, v25, OS_LOG_TYPE_DEFAULT, "objectSize:\t\t%d\n", buf, 8u);
      }

      if (v91[9]) {
        uint64_t v26 = "\x1B[32mSUCCESS\x1B[0m";
      }
      else {
        uint64_t v26 = "\x1B[31mFAIL\x1B[0m";
      }
      fprintf(*v14, "aneMapFunction:\t\t%s\n", v26);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        uint64_t v27 = __osLogPearlLib;
      }
      else {
        uint64_t v27 = v7;
      }
      io_connect_t v28 = v27;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        if (v91[9]) {
          char v29 = "\x1B[32mSUCCESS\x1B[0m";
        }
        else {
          char v29 = "\x1B[31mFAIL\x1B[0m";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v93 = v29;
        _os_log_impl(&dword_22F4CB000, v28, OS_LOG_TYPE_DEFAULT, "aneMapFunction:\t\t%s\n", buf, 0xCu);
      }

      if (v91[10]) {
        size_t v30 = "\x1B[32mSUCCESS\x1B[0m";
      }
      else {
        size_t v30 = "\x1B[31mFAIL\x1B[0m";
      }
      fprintf(*v14, "ispMapFunction:\t\t%s\n", v30);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        uint64_t v31 = __osLogPearlLib;
      }
      else {
        uint64_t v31 = v7;
      }
      uint64_t v32 = v31;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        if (v91[10]) {
          id v33 = "\x1B[32mSUCCESS\x1B[0m";
        }
        else {
          id v33 = "\x1B[31mFAIL\x1B[0m";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v93 = v33;
        _os_log_impl(&dword_22F4CB000, v32, OS_LOG_TYPE_DEFAULT, "ispMapFunction:\t\t%s\n", buf, 0xCu);
      }

      if (v91[11]) {
        uint64_t v34 = "\x1B[32mSUCCESS\x1B[0m";
      }
      else {
        uint64_t v34 = "\x1B[31mFAIL\x1B[0m";
      }
      fprintf(*v14, "aneUnmapFunction:\t%s\n", v34);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        uint64_t v35 = __osLogPearlLib;
      }
      else {
        uint64_t v35 = v7;
      }
      int v36 = v35;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        if (v91[11]) {
          uint64_t v37 = "\x1B[32mSUCCESS\x1B[0m";
        }
        else {
          uint64_t v37 = "\x1B[31mFAIL\x1B[0m";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v93 = v37;
        _os_log_impl(&dword_22F4CB000, v36, OS_LOG_TYPE_DEFAULT, "aneUnmapFunction:\t%s\n", buf, 0xCu);
      }

      if (v91[12]) {
        int v38 = "\x1B[32mSUCCESS\x1B[0m";
      }
      else {
        int v38 = "\x1B[31mFAIL\x1B[0m";
      }
      fprintf(*v14, "ispUnmapFunction:\t%s\n", v38);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        uint64_t v39 = __osLogPearlLib;
      }
      else {
        uint64_t v39 = v7;
      }
      long long v40 = v39;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        if (v91[12]) {
          long long v41 = "\x1B[32mSUCCESS\x1B[0m";
        }
        else {
          long long v41 = "\x1B[31mFAIL\x1B[0m";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v93 = v41;
        _os_log_impl(&dword_22F4CB000, v40, OS_LOG_TYPE_DEFAULT, "ispUnmapFunction:\t%s\n", buf, 0xCu);
      }

      if (v91[13]) {
        id v42 = "\x1B[32mSUCCESS\x1B[0m";
      }
      else {
        id v42 = "\x1B[31mFAIL\x1B[0m";
      }
      fprintf(*v14, "mappedToSEP:\t\t%s\n", v42);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        uint64_t v43 = __osLogPearlLib;
      }
      else {
        uint64_t v43 = v7;
      }
      id v44 = v43;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        if (v91[13]) {
          uint64_t v45 = "\x1B[32mSUCCESS\x1B[0m";
        }
        else {
          uint64_t v45 = "\x1B[31mFAIL\x1B[0m";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v93 = v45;
        _os_log_impl(&dword_22F4CB000, v44, OS_LOG_TYPE_DEFAULT, "mappedToSEP:\t\t%s\n", buf, 0xCu);
      }

      if (v91[14]) {
        unsigned int v46 = "\x1B[32mSUCCESS\x1B[0m";
      }
      else {
        unsigned int v46 = "\x1B[31mFAIL\x1B[0m";
      }
      fprintf(*v14, "mappedToANE:\t\t%s\n", v46);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        io_connect_t v47 = __osLogPearlLib;
      }
      else {
        io_connect_t v47 = v7;
      }
      CFStringRef v48 = v47;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        if (v91[14]) {
          uint64_t v49 = "\x1B[32mSUCCESS\x1B[0m";
        }
        else {
          uint64_t v49 = "\x1B[31mFAIL\x1B[0m";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v93 = v49;
        _os_log_impl(&dword_22F4CB000, v48, OS_LOG_TYPE_DEFAULT, "mappedToANE:\t\t%s\n", buf, 0xCu);
      }

      if (v91[15]) {
        id v50 = "\x1B[32mSUCCESS\x1B[0m";
      }
      else {
        id v50 = "\x1B[31mFAIL\x1B[0m";
      }
      fprintf(*v14, "mappedToISP:\t\t%s\n", v50);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        uint64_t v51 = __osLogPearlLib;
      }
      else {
        uint64_t v51 = v7;
      }
      id v52 = v51;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        if (v91[15]) {
          id v53 = "\x1B[32mSUCCESS\x1B[0m";
        }
        else {
          id v53 = "\x1B[31mFAIL\x1B[0m";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v93 = v53;
        _os_log_impl(&dword_22F4CB000, v52, OS_LOG_TYPE_DEFAULT, "mappedToISP:\t\t%s\n", buf, 0xCu);
      }

      if (v91[18]) {
        id v54 = "\x1B[32mSUCCESS\x1B[0m";
      }
      else {
        id v54 = "\x1B[31mFAIL\x1B[0m";
      }
      fprintf(*v14, "unmappedFromISP:\t%s\n", v54);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        id v55 = __osLogPearlLib;
      }
      else {
        id v55 = v7;
      }
      id v56 = v55;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        if (v91[18]) {
          CFArrayRef v57 = "\x1B[32mSUCCESS\x1B[0m";
        }
        else {
          CFArrayRef v57 = "\x1B[31mFAIL\x1B[0m";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v93 = v57;
        _os_log_impl(&dword_22F4CB000, v56, OS_LOG_TYPE_DEFAULT, "unmappedFromISP:\t%s\n", buf, 0xCu);
      }

      if (v91[17]) {
        uint64_t v58 = "\x1B[32mSUCCESS\x1B[0m";
      }
      else {
        uint64_t v58 = "\x1B[31mFAIL\x1B[0m";
      }
      fprintf(*v14, "unmappedFromANE:\t%s\n", v58);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        uint64_t v59 = __osLogPearlLib;
      }
      else {
        uint64_t v59 = v7;
      }
      double v60 = v59;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        if (v91[17]) {
          unsigned int v61 = "\x1B[32mSUCCESS\x1B[0m";
        }
        else {
          unsigned int v61 = "\x1B[31mFAIL\x1B[0m";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v93 = v61;
        _os_log_impl(&dword_22F4CB000, v60, OS_LOG_TYPE_DEFAULT, "unmappedFromANE:\t%s\n", buf, 0xCu);
      }

      if (v91[16]) {
        id v62 = "\x1B[32mSUCCESS\x1B[0m";
      }
      else {
        id v62 = "\x1B[31mFAIL\x1B[0m";
      }
      fprintf(*v14, "unmappedFromSEP:\t%s\n", v62);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      uint64_t v11 = &logString[120];
      if (__osLogPearlLib) {
        CFArrayRef v63 = __osLogPearlLib;
      }
      else {
        CFArrayRef v63 = v7;
      }
      unsigned int v64 = v63;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        if (v91[16]) {
          uint64_t v65 = "\x1B[32mSUCCESS\x1B[0m";
        }
        else {
          uint64_t v65 = "\x1B[31mFAIL\x1B[0m";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v93 = v65;
        _os_log_impl(&dword_22F4CB000, v64, OS_LOG_TYPE_DEFAULT, "unmappedFromSEP:\t%s\n", buf, 0xCu);
      }

      uint64_t v6 = &logString[120];
      if (!v13)
      {
        if (v91[9]) {
          BOOL v68 = v91[10] == 0;
        }
        else {
          BOOL v68 = 1;
        }
        BOOL v71 = v68 || v91[13] == 0 || v91[14] == 0 || v91[15] == 0;
        int v72 = a2 ^ 1;
        if (!v71) {
          int v72 = 1;
        }
        if (v91[11]) {
          BOOL v73 = v91[12] == 0;
        }
        else {
          BOOL v73 = 1;
        }
        BOOL v76 = v73 || v91[16] == 0 || v91[17] == 0 || v91[18] == 0;
        char v77 = a3 ^ 1;
        if (!v76) {
          char v77 = 1;
        }
        uint64_t v13 = 261;
        if (v72 == 1 && (v77 & 1) != 0) {
          goto LABEL_214;
        }
      }
    }
LABEL_177:
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (*((void *)v6 + 498)) {
      double v66 = *((void *)v6 + 498);
    }
    else {
      double v66 = v7;
    }
    id v67 = v66;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v93 = v13;
      _os_log_impl(&dword_22F4CB000, v67, OS_LOG_TYPE_ERROR, "allocateAndMapObjectS3C1 -> 0x%x\n", buf, 8u);
    }
    goto LABEL_222;
  }
LABEL_214:
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  if (__osLogPearlLibTrace) {
    long long v78 = __osLogPearlLibTrace;
  }
  else {
    long long v78 = v7;
  }
  id v67 = v78;
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v93 = 0;
    _os_log_impl(&dword_22F4CB000, v67, OS_LOG_TYPE_DEFAULT, "allocateAndMapObjectS3C1 -> 0x%x\n", buf, 8u);
  }
  uint64_t v13 = 0;
LABEL_222:

  io_connect_t v79 = *((_DWORD *)v11 + 1004);
  if (v79)
  {
    IOServiceClose(v79);
    *((_DWORD *)v11 + 1004) = 0;
  }
  return v13;
}

uint64_t getBrunorCollectionKey(void *a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  uint64_t v4 = MEMORY[0x263EF8438];
  if (__osLogPearlLibTrace) {
    uint64_t v5 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v5 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F4CB000, v5, OS_LOG_TYPE_DEFAULT, "getBrunorCollectionKey\n", buf, 2u);
  }
  uint64_t v23 = 65;
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "collectionKey", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 928);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      size_t v16 = __osLogPearlLib;
    }
    else {
      size_t v16 = v4;
    }
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v25 = "collectionKey";
    __int16 v26 = 2048;
    uint64_t v27 = 0;
    __int16 v28 = 2080;
    char v29 = "";
    __int16 v30 = 2080;
    uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v32 = 1024;
    int v33 = 928;
    goto LABEL_48;
  }
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "collectionKeyLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 929);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      size_t v16 = __osLogPearlLib;
    }
    else {
      size_t v16 = v4;
    }
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v25 = "collectionKeyLength";
    __int16 v26 = 2048;
    uint64_t v27 = 0;
    __int16 v28 = 2080;
    char v29 = "";
    __int16 v30 = 2080;
    uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v32 = 1024;
    int v33 = 929;
LABEL_48:
    _os_log_impl(&dword_22F4CB000, v16, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_49:
    uint64_t v10 = 258;
    goto LABEL_15;
  }
  uint64_t v6 = initialize();
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v17 = (int)v6;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 932);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      __int16 v18 = __osLogPearlLib;
    }
    else {
      __int16 v18 = v4;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v25 = "err == 0 ";
      __int16 v26 = 2048;
      uint64_t v27 = v17;
      __int16 v28 = 2080;
      char v29 = "";
      __int16 v30 = 2080;
      uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v32 = 1024;
      int v33 = 932;
      _os_log_impl(&dword_22F4CB000, v18, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    uint64_t v7 = calloc(1uLL, 0x41uLL);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = performCommand(_connect, 73, 0, 0, 0, v7, &v23);
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v20 = (int)v9;
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 938);
        if (OSLogInit_onceToken != -1) {
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        }
        if (__osLogPearlLib) {
          __int16 v21 = __osLogPearlLib;
        }
        else {
          __int16 v21 = v4;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v25 = "err == 0 ";
          __int16 v26 = 2048;
          uint64_t v27 = v20;
          __int16 v28 = 2080;
          char v29 = "";
          __int16 v30 = 2080;
          uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          __int16 v32 = 1024;
          int v33 = 938;
          _os_log_impl(&dword_22F4CB000, v21, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      else
      {
        if (v23 == 65)
        {
          uint64_t v10 = 0;
          *a1 = v8;
          *a2 = 65;
          goto LABEL_15;
        }
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize == sizeof(cmd_get_brunor_collection_key_out_v1_t)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 939);
        if (OSLogInit_onceToken != -1) {
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        }
        if (__osLogPearlLib) {
          int v22 = __osLogPearlLib;
        }
        else {
          int v22 = v4;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v25 = "replySize == sizeof(cmd_get_brunor_collection_key_out_v1_t)";
          __int16 v26 = 2048;
          uint64_t v27 = 0;
          __int16 v28 = 2080;
          char v29 = "";
          __int16 v30 = 2080;
          uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          __int16 v32 = 1024;
          int v33 = 939;
          _os_log_impl(&dword_22F4CB000, v22, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v10 = 261;
      }
      free(v8);
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "reply", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 935);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        __int16 v19 = __osLogPearlLib;
      }
      else {
        __int16 v19 = v4;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v25 = "reply";
        __int16 v26 = 2048;
        uint64_t v27 = 0;
        __int16 v28 = 2080;
        char v29 = "";
        __int16 v30 = 2080;
        uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v32 = 1024;
        int v33 = 935;
        _os_log_impl(&dword_22F4CB000, v19, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v10 = 260;
    }
  }
LABEL_15:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  if (v10)
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v11 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v11 = v4;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v10;
      uint64_t v12 = v11;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
LABEL_32:
      _os_log_impl(&dword_22F4CB000, v12, v13, "getBrunorCollectionKey -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      char v14 = __osLogPearlLibTrace;
    }
    else {
      char v14 = v4;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = 0;
      uint64_t v12 = v14;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_32;
    }
  }
  return v10;
}

uint64_t getAttestationToBrunorCollectionKey(void *a1, size_t *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  uint64_t v4 = MEMORY[0x263EF8438];
  if (__osLogPearlLibTrace) {
    uint64_t v5 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v5 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F4CB000, v5, OS_LOG_TYPE_DEFAULT, "getAttestationToBrunorCollectionKey\n", buf, 2u);
  }
  size_t __size = 0x4000;
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "attestation", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 966);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v17 = __osLogPearlLib;
    }
    else {
      uint64_t v17 = v4;
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_51;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v27 = "attestation";
    __int16 v28 = 2048;
    uint64_t v29 = 0;
    __int16 v30 = 2080;
    uint64_t v31 = "";
    __int16 v32 = 2080;
    int v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v34 = 1024;
    int v35 = 966;
    goto LABEL_50;
  }
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "attestationLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 967);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v17 = __osLogPearlLib;
    }
    else {
      uint64_t v17 = v4;
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_51;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v27 = "attestationLength";
    __int16 v28 = 2048;
    uint64_t v29 = 0;
    __int16 v30 = 2080;
    uint64_t v31 = "";
    __int16 v32 = 2080;
    int v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v34 = 1024;
    int v35 = 967;
LABEL_50:
    _os_log_impl(&dword_22F4CB000, v17, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_51:
    uint64_t v11 = 258;
    goto LABEL_17;
  }
  uint64_t v6 = initialize();
  if (v6)
  {
    uint64_t v11 = v6;
    uint64_t v18 = (int)v6;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 970);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      __int16 v19 = __osLogPearlLib;
    }
    else {
      __int16 v19 = v4;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v27 = "err == 0 ";
      __int16 v28 = 2048;
      uint64_t v29 = v18;
      __int16 v30 = 2080;
      uint64_t v31 = "";
      __int16 v32 = 2080;
      int v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v34 = 1024;
      int v35 = 970;
      _os_log_impl(&dword_22F4CB000, v19, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    uint64_t v7 = calloc(1uLL, 0x4000uLL);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = performCommand(_connect, 74, 0, 0, 0, v7, &__size);
      if (v9)
      {
        uint64_t v11 = v9;
        uint64_t v21 = (int)v9;
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 976);
        if (OSLogInit_onceToken != -1) {
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        }
        if (__osLogPearlLib) {
          int v22 = __osLogPearlLib;
        }
        else {
          int v22 = v4;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v27 = "err == 0 ";
          __int16 v28 = 2048;
          uint64_t v29 = v21;
          __int16 v30 = 2080;
          uint64_t v31 = "";
          __int16 v32 = 2080;
          int v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          __int16 v34 = 1024;
          int v35 = 976;
          _os_log_impl(&dword_22F4CB000, v22, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      else if (__size > 0x4000)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize <= (16 * 1024)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 977);
        if (OSLogInit_onceToken != -1) {
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        }
        if (__osLogPearlLib) {
          uint64_t v23 = __osLogPearlLib;
        }
        else {
          uint64_t v23 = v4;
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v27 = "replySize <= (16 * 1024)";
          __int16 v28 = 2048;
          uint64_t v29 = 0;
          __int16 v30 = 2080;
          uint64_t v31 = "";
          __int16 v32 = 2080;
          int v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          __int16 v34 = 1024;
          int v35 = 977;
          _os_log_impl(&dword_22F4CB000, v23, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v11 = 261;
      }
      else
      {
        uint64_t v10 = calloc(1uLL, __size);
        *a1 = v10;
        if (v10)
        {
          memcpy(v10, v8, __size);
          uint64_t v11 = 0;
          *a2 = __size;
        }
        else
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "*attestation", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 980);
          if (OSLogInit_onceToken != -1) {
            dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
          }
          if (__osLogPearlLib) {
            uint64_t v24 = __osLogPearlLib;
          }
          else {
            uint64_t v24 = v4;
          }
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v27 = "*attestation";
            __int16 v28 = 2048;
            uint64_t v29 = 0;
            __int16 v30 = 2080;
            uint64_t v31 = "";
            __int16 v32 = 2080;
            int v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
            __int16 v34 = 1024;
            int v35 = 980;
            _os_log_impl(&dword_22F4CB000, v24, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          uint64_t v11 = 260;
        }
      }
      free(v8);
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "reply", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 973);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        uint64_t v20 = __osLogPearlLib;
      }
      else {
        uint64_t v20 = v4;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v27 = "reply";
        __int16 v28 = 2048;
        uint64_t v29 = 0;
        __int16 v30 = 2080;
        uint64_t v31 = "";
        __int16 v32 = 2080;
        int v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v34 = 1024;
        int v35 = 973;
        _os_log_impl(&dword_22F4CB000, v20, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v11 = 260;
    }
  }
LABEL_17:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  if (v11)
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v12 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v12 = v4;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v27) = v11;
      os_log_type_t v13 = v12;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
LABEL_34:
      _os_log_impl(&dword_22F4CB000, v13, v14, "getAttestationToBrunorCollectionKey -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v15 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v15 = v4;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v27) = 0;
      os_log_type_t v13 = v15;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_34;
    }
  }
  return v11;
}

uint64_t signDataWithBrunorCollectionKey(const void *a1, size_t a2, void *a3, size_t *a4)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  uint64_t v8 = MEMORY[0x263EF8438];
  if (__osLogPearlLibTrace) {
    uint64_t v9 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v9 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F4CB000, v9, OS_LOG_TYPE_DEFAULT, "signDataWithBrunorCollectionKey\n", buf, 2u);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v42 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  *(_OWORD *)buf = 0u;
  size_t __size = 128;
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1005);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v20 = __osLogPearlLib;
    }
    else {
      uint64_t v20 = v8;
    }
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_65;
    }
    *(_DWORD *)uint64_t v27 = 136316162;
    __int16 v28 = "data";
    __int16 v29 = 2048;
    uint64_t v30 = 0;
    __int16 v31 = 2080;
    __int16 v32 = "";
    __int16 v33 = 2080;
    __int16 v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v35 = 1024;
    int v36 = 1005;
    goto LABEL_64;
  }
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1006);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v20 = __osLogPearlLib;
    }
    else {
      uint64_t v20 = v8;
    }
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_65;
    }
    *(_DWORD *)uint64_t v27 = 136316162;
    __int16 v28 = "dataLength";
    __int16 v29 = 2048;
    uint64_t v30 = 0;
    __int16 v31 = 2080;
    __int16 v32 = "";
    __int16 v33 = 2080;
    __int16 v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v35 = 1024;
    int v36 = 1006;
    goto LABEL_64;
  }
  if (!a3)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "signature", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1007);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v20 = __osLogPearlLib;
    }
    else {
      uint64_t v20 = v8;
    }
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_65;
    }
    *(_DWORD *)uint64_t v27 = 136316162;
    __int16 v28 = "signature";
    __int16 v29 = 2048;
    uint64_t v30 = 0;
    __int16 v31 = 2080;
    __int16 v32 = "";
    __int16 v33 = 2080;
    __int16 v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v35 = 1024;
    int v36 = 1007;
    goto LABEL_64;
  }
  if (!a4)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "signatureLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1008);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v20 = __osLogPearlLib;
    }
    else {
      uint64_t v20 = v8;
    }
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_65;
    }
    *(_DWORD *)uint64_t v27 = 136316162;
    __int16 v28 = "signatureLength";
    __int16 v29 = 2048;
    uint64_t v30 = 0;
    __int16 v31 = 2080;
    __int16 v32 = "";
    __int16 v33 = 2080;
    __int16 v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v35 = 1024;
    int v36 = 1008;
LABEL_64:
    _os_log_impl(&dword_22F4CB000, v20, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v27, 0x30u);
LABEL_65:
    uint64_t v14 = 258;
    goto LABEL_17;
  }
  uint64_t v10 = initialize();
  if (v10)
  {
    uint64_t v14 = v10;
    uint64_t v21 = (int)v10;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v10, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1011);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      int v22 = __osLogPearlLib;
    }
    else {
      int v22 = v8;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v27 = 136316162;
      __int16 v28 = "err == 0 ";
      __int16 v29 = 2048;
      uint64_t v30 = v21;
      __int16 v31 = 2080;
      __int16 v32 = "";
      __int16 v33 = 2080;
      __int16 v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v35 = 1024;
      int v36 = 1011;
LABEL_80:
      _os_log_impl(&dword_22F4CB000, v22, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v27, 0x30u);
    }
  }
  else
  {
    uint64_t v11 = performCommand(_connect, 75, 0, a1, a2, buf, &__size);
    if (!v11)
    {
      if (__size >= 0x81)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize <= sizeof(reply)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1015);
        if (OSLogInit_onceToken != -1) {
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        }
        if (__osLogPearlLib) {
          uint64_t v24 = __osLogPearlLib;
        }
        else {
          uint64_t v24 = v8;
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v27 = 136316162;
          __int16 v28 = "replySize <= sizeof(reply)";
          __int16 v29 = 2048;
          uint64_t v30 = 0;
          __int16 v31 = 2080;
          __int16 v32 = "";
          __int16 v33 = 2080;
          __int16 v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          __int16 v35 = 1024;
          int v36 = 1015;
          _os_log_impl(&dword_22F4CB000, v24, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v27, 0x30u);
        }
        uint64_t v14 = 261;
      }
      else
      {
        uint64_t v12 = calloc(1uLL, __size);
        *a3 = v12;
        if (v12)
        {
          size_t v13 = __size;
          *a4 = __size;
          memcpy(v12, buf, v13);
          uint64_t v14 = 0;
        }
        else
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "*signature", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1018);
          if (OSLogInit_onceToken != -1) {
            dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
          }
          if (__osLogPearlLib) {
            uint64_t v25 = __osLogPearlLib;
          }
          else {
            uint64_t v25 = v8;
          }
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t v27 = 136316162;
            __int16 v28 = "*signature";
            __int16 v29 = 2048;
            uint64_t v30 = 0;
            __int16 v31 = 2080;
            __int16 v32 = "";
            __int16 v33 = 2080;
            __int16 v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
            __int16 v35 = 1024;
            int v36 = 1018;
            _os_log_impl(&dword_22F4CB000, v25, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v27, 0x30u);
          }
          uint64_t v14 = 260;
        }
      }
      goto LABEL_17;
    }
    uint64_t v14 = v11;
    uint64_t v23 = (int)v11;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v11, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1014);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      int v22 = __osLogPearlLib;
    }
    else {
      int v22 = v8;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v27 = 136316162;
      __int16 v28 = "err == 0 ";
      __int16 v29 = 2048;
      uint64_t v30 = v23;
      __int16 v31 = 2080;
      __int16 v32 = "";
      __int16 v33 = 2080;
      __int16 v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v35 = 1024;
      int v36 = 1014;
      goto LABEL_80;
    }
  }
LABEL_17:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  if (v14)
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v15 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v15 = v8;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v27 = 67109120;
      LODWORD(v28) = v14;
      size_t v16 = v15;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
LABEL_34:
      _os_log_impl(&dword_22F4CB000, v16, v17, "signDataWithBrunorCollectionKey -> %d\n", v27, 8u);
    }
  }
  else
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v18 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v18 = v8;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v27 = 67109120;
      LODWORD(v28) = 0;
      size_t v16 = v18;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_34;
    }
  }
  return v14;
}

uint64_t getBrunorPermanentKey(void *a1, unint64_t *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  uint64_t v4 = MEMORY[0x263EF8438];
  if (__osLogPearlLibTrace) {
    uint64_t v5 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v5 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F4CB000, v5, OS_LOG_TYPE_DEFAULT, "getBrunorPermanentKey\n", buf, 2u);
  }
  unint64_t v24 = 57;
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "permanentKey", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1040);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      os_log_type_t v17 = __osLogPearlLib;
    }
    else {
      os_log_type_t v17 = v4;
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v26 = "permanentKey";
    __int16 v27 = 2048;
    uint64_t v28 = 0;
    __int16 v29 = 2080;
    uint64_t v30 = "";
    __int16 v31 = 2080;
    __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v33 = 1024;
    int v34 = 1040;
    goto LABEL_48;
  }
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "permanentKeyLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1041);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      os_log_type_t v17 = __osLogPearlLib;
    }
    else {
      os_log_type_t v17 = v4;
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v26 = "permanentKeyLength";
    __int16 v27 = 2048;
    uint64_t v28 = 0;
    __int16 v29 = 2080;
    uint64_t v30 = "";
    __int16 v31 = 2080;
    __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v33 = 1024;
    int v34 = 1041;
LABEL_48:
    _os_log_impl(&dword_22F4CB000, v17, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_49:
    uint64_t v11 = 258;
    goto LABEL_15;
  }
  uint64_t v6 = initialize();
  if (v6)
  {
    uint64_t v11 = v6;
    uint64_t v18 = (int)v6;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1044);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      __int16 v19 = __osLogPearlLib;
    }
    else {
      __int16 v19 = v4;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v26 = "err == 0 ";
      __int16 v27 = 2048;
      uint64_t v28 = v18;
      __int16 v29 = 2080;
      uint64_t v30 = "";
      __int16 v31 = 2080;
      __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v33 = 1024;
      int v34 = 1044;
      _os_log_impl(&dword_22F4CB000, v19, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    uint64_t v7 = calloc(1uLL, 0x39uLL);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = performCommand(_connect, 76, 0, 0, 0, v7, &v24);
      if (v9)
      {
        uint64_t v11 = v9;
        uint64_t v21 = (int)v9;
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1050);
        if (OSLogInit_onceToken != -1) {
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        }
        if (__osLogPearlLib) {
          int v22 = __osLogPearlLib;
        }
        else {
          int v22 = v4;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          __int16 v26 = "err == 0 ";
          __int16 v27 = 2048;
          uint64_t v28 = v21;
          __int16 v29 = 2080;
          uint64_t v30 = "";
          __int16 v31 = 2080;
          __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          __int16 v33 = 1024;
          int v34 = 1050;
          _os_log_impl(&dword_22F4CB000, v22, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      else
      {
        unint64_t v10 = v24;
        if (v24 < 0x3A)
        {
          uint64_t v11 = 0;
          *a1 = v8;
          *a2 = v10;
          goto LABEL_15;
        }
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize <= sizeof(cmd_get_brunor_permanent_key_out_v1_t)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1051);
        if (OSLogInit_onceToken != -1) {
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        }
        if (__osLogPearlLib) {
          uint64_t v23 = __osLogPearlLib;
        }
        else {
          uint64_t v23 = v4;
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          __int16 v26 = "replySize <= sizeof(cmd_get_brunor_permanent_key_out_v1_t)";
          __int16 v27 = 2048;
          uint64_t v28 = 0;
          __int16 v29 = 2080;
          uint64_t v30 = "";
          __int16 v31 = 2080;
          __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          __int16 v33 = 1024;
          int v34 = 1051;
          _os_log_impl(&dword_22F4CB000, v23, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v11 = 261;
      }
      free(v8);
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "reply", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1047);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        uint64_t v20 = __osLogPearlLib;
      }
      else {
        uint64_t v20 = v4;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v26 = "reply";
        __int16 v27 = 2048;
        uint64_t v28 = 0;
        __int16 v29 = 2080;
        uint64_t v30 = "";
        __int16 v31 = 2080;
        __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v33 = 1024;
        int v34 = 1047;
        _os_log_impl(&dword_22F4CB000, v20, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v11 = 260;
    }
  }
LABEL_15:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  if (v11)
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v12 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v12 = v4;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = v11;
      size_t v13 = v12;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
LABEL_32:
      _os_log_impl(&dword_22F4CB000, v13, v14, "getBrunorPermanentKey -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v15 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v15 = v4;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = 0;
      size_t v13 = v15;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_32;
    }
  }
  return v11;
}

uint64_t signDataWithBrunorPermanentKey(const void *a1, size_t a2, void *a3, size_t *a4)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  uint64_t v8 = MEMORY[0x263EF8438];
  if (__osLogPearlLibTrace) {
    uint64_t v9 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v9 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F4CB000, v9, OS_LOG_TYPE_DEFAULT, "signDataWithBrunorPermanentKey\n", buf, 2u);
  }
  char v41 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  *(_OWORD *)buf = 0u;
  long long v38 = 0u;
  size_t __size = 65;
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1079);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v20 = __osLogPearlLib;
    }
    else {
      uint64_t v20 = v8;
    }
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_65;
    }
    *(_DWORD *)__int16 v27 = 136316162;
    uint64_t v28 = "data";
    __int16 v29 = 2048;
    uint64_t v30 = 0;
    __int16 v31 = 2080;
    __int16 v32 = "";
    __int16 v33 = 2080;
    int v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v35 = 1024;
    int v36 = 1079;
    goto LABEL_64;
  }
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1080);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v20 = __osLogPearlLib;
    }
    else {
      uint64_t v20 = v8;
    }
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_65;
    }
    *(_DWORD *)__int16 v27 = 136316162;
    uint64_t v28 = "dataLength";
    __int16 v29 = 2048;
    uint64_t v30 = 0;
    __int16 v31 = 2080;
    __int16 v32 = "";
    __int16 v33 = 2080;
    int v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v35 = 1024;
    int v36 = 1080;
    goto LABEL_64;
  }
  if (!a3)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "signature", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1081);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v20 = __osLogPearlLib;
    }
    else {
      uint64_t v20 = v8;
    }
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_65;
    }
    *(_DWORD *)__int16 v27 = 136316162;
    uint64_t v28 = "signature";
    __int16 v29 = 2048;
    uint64_t v30 = 0;
    __int16 v31 = 2080;
    __int16 v32 = "";
    __int16 v33 = 2080;
    int v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v35 = 1024;
    int v36 = 1081;
    goto LABEL_64;
  }
  if (!a4)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "signatureLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1082);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v20 = __osLogPearlLib;
    }
    else {
      uint64_t v20 = v8;
    }
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_65;
    }
    *(_DWORD *)__int16 v27 = 136316162;
    uint64_t v28 = "signatureLength";
    __int16 v29 = 2048;
    uint64_t v30 = 0;
    __int16 v31 = 2080;
    __int16 v32 = "";
    __int16 v33 = 2080;
    int v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v35 = 1024;
    int v36 = 1082;
LABEL_64:
    _os_log_impl(&dword_22F4CB000, v20, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v27, 0x30u);
LABEL_65:
    uint64_t v14 = 258;
    goto LABEL_17;
  }
  uint64_t v10 = initialize();
  if (v10)
  {
    uint64_t v14 = v10;
    uint64_t v21 = (int)v10;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v10, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1085);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      int v22 = __osLogPearlLib;
    }
    else {
      int v22 = v8;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v27 = 136316162;
      uint64_t v28 = "err == 0 ";
      __int16 v29 = 2048;
      uint64_t v30 = v21;
      __int16 v31 = 2080;
      __int16 v32 = "";
      __int16 v33 = 2080;
      int v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v35 = 1024;
      int v36 = 1085;
LABEL_80:
      _os_log_impl(&dword_22F4CB000, v22, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v27, 0x30u);
    }
  }
  else
  {
    uint64_t v11 = performCommand(_connect, 77, 0, a1, a2, buf, &__size);
    if (!v11)
    {
      if (__size >= 0x42)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize <= sizeof(reply)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1089);
        if (OSLogInit_onceToken != -1) {
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        }
        if (__osLogPearlLib) {
          unint64_t v24 = __osLogPearlLib;
        }
        else {
          unint64_t v24 = v8;
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v27 = 136316162;
          uint64_t v28 = "replySize <= sizeof(reply)";
          __int16 v29 = 2048;
          uint64_t v30 = 0;
          __int16 v31 = 2080;
          __int16 v32 = "";
          __int16 v33 = 2080;
          int v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          __int16 v35 = 1024;
          int v36 = 1089;
          _os_log_impl(&dword_22F4CB000, v24, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v27, 0x30u);
        }
        uint64_t v14 = 261;
      }
      else
      {
        uint64_t v12 = calloc(1uLL, __size);
        *a3 = v12;
        if (v12)
        {
          size_t v13 = __size;
          *a4 = __size;
          memcpy(v12, buf, v13);
          uint64_t v14 = 0;
        }
        else
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "*signature", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1092);
          if (OSLogInit_onceToken != -1) {
            dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
          }
          if (__osLogPearlLib) {
            uint64_t v25 = __osLogPearlLib;
          }
          else {
            uint64_t v25 = v8;
          }
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int16 v27 = 136316162;
            uint64_t v28 = "*signature";
            __int16 v29 = 2048;
            uint64_t v30 = 0;
            __int16 v31 = 2080;
            __int16 v32 = "";
            __int16 v33 = 2080;
            int v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
            __int16 v35 = 1024;
            int v36 = 1092;
            _os_log_impl(&dword_22F4CB000, v25, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v27, 0x30u);
          }
          uint64_t v14 = 260;
        }
      }
      goto LABEL_17;
    }
    uint64_t v14 = v11;
    uint64_t v23 = (int)v11;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v11, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1088);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      int v22 = __osLogPearlLib;
    }
    else {
      int v22 = v8;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v27 = 136316162;
      uint64_t v28 = "err == 0 ";
      __int16 v29 = 2048;
      uint64_t v30 = v23;
      __int16 v31 = 2080;
      __int16 v32 = "";
      __int16 v33 = 2080;
      int v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v35 = 1024;
      int v36 = 1088;
      goto LABEL_80;
    }
  }
LABEL_17:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  if (v14)
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v15 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v15 = v8;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int16 v27 = 67109120;
      LODWORD(v28) = v14;
      size_t v16 = v15;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
LABEL_34:
      _os_log_impl(&dword_22F4CB000, v16, v17, "signDataWithBrunorPermanentKey -> %d\n", v27, 8u);
    }
  }
  else
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v18 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v18 = v8;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v27 = 67109120;
      LODWORD(v28) = 0;
      size_t v16 = v18;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_34;
    }
  }
  return v14;
}

uint64_t prepareFDRDataEncryptionKey()
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  mach_port_t v0 = MEMORY[0x263EF8438];
  if (__osLogPearlLibTrace) {
    CFDictionaryRef v1 = __osLogPearlLibTrace;
  }
  else {
    CFDictionaryRef v1 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F4CB000, v1, OS_LOG_TYPE_DEFAULT, "prepareFDRDataEncryptionKey\n", buf, 2u);
  }
  uint64_t v2 = initialize();
  if (v2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v2, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1112);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      uint64_t v9 = __osLogPearlLib;
    }
    else {
      uint64_t v9 = v0;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v14 = "err == 0 ";
      __int16 v15 = 2048;
      uint64_t v16 = (int)v2;
      __int16 v17 = 2080;
      uint64_t v18 = "";
      __int16 v19 = 2080;
      uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v21 = 1024;
      int v22 = 1112;
      _os_log_impl(&dword_22F4CB000, v9, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    uint64_t v3 = performCommand(_connect, 78, 0, 0, 0, 0, 0);
    if (v3)
    {
      uint64_t v10 = v3;
      uint64_t v11 = (int)v3;
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v3, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1115);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        uint64_t v12 = __osLogPearlLib;
      }
      else {
        uint64_t v12 = v0;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v14 = "err == 0 ";
        __int16 v15 = 2048;
        uint64_t v16 = v11;
        __int16 v17 = 2080;
        uint64_t v18 = "";
        __int16 v19 = 2080;
        uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v21 = 1024;
        int v22 = 1115;
        _os_log_impl(&dword_22F4CB000, v12, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v2 = v10;
    }
  }
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  if (v2)
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v4 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v4 = v0;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v14) = v2;
      uint64_t v5 = v4;
      os_log_type_t v6 = OS_LOG_TYPE_ERROR;
LABEL_27:
      _os_log_impl(&dword_22F4CB000, v5, v6, "prepareFDRDataEncryptionKey -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v7 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v7 = v0;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v14) = 0;
      uint64_t v5 = v7;
      os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_27;
    }
  }
  return v2;
}

uint64_t setDummyWrappedFDRDataEncryptionKey(const void *a1, size_t a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  uint64_t v4 = MEMORY[0x263EF8438];
  if (__osLogPearlLibTrace) {
    uint64_t v5 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v5 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F4CB000, v5, OS_LOG_TYPE_DEFAULT, "setDummyWrappedFDRDataEncryptionKey\n", buf, 2u);
  }
  uint64_t v6 = initialize();
  if (v6)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1132);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      size_t v13 = __osLogPearlLib;
    }
    else {
      size_t v13 = v4;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v18 = "err == 0 ";
      __int16 v19 = 2048;
      uint64_t v20 = (int)v6;
      __int16 v21 = 2080;
      int v22 = "";
      __int16 v23 = 2080;
      unint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v25 = 1024;
      int v26 = 1132;
      _os_log_impl(&dword_22F4CB000, v13, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    uint64_t v7 = performCommand(_connect, 79, 0, a1, a2, 0, 0);
    if (v7)
    {
      uint64_t v14 = v7;
      uint64_t v15 = (int)v7;
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v7, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1135);
      if (OSLogInit_onceToken != -1) {
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      }
      if (__osLogPearlLib) {
        uint64_t v16 = __osLogPearlLib;
      }
      else {
        uint64_t v16 = v4;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v18 = "err == 0 ";
        __int16 v19 = 2048;
        uint64_t v20 = v15;
        __int16 v21 = 2080;
        int v22 = "";
        __int16 v23 = 2080;
        unint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v25 = 1024;
        int v26 = 1135;
        _os_log_impl(&dword_22F4CB000, v16, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v6 = v14;
    }
  }
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  if (v6)
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v8 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v8 = v4;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = v6;
      uint64_t v9 = v8;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
LABEL_27:
      _os_log_impl(&dword_22F4CB000, v9, v10, "setDummyWrappedFDRDataEncryptionKey -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v11 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v11 = v4;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = 0;
      uint64_t v9 = v11;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_27;
    }
  }
  return v6;
}

uint64_t encryptFDRDataForBrunor(const char *a1, size_t a2, uint64_t a3, char *a4, _OWORD *a5, uint64_t a6)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (OSLogInit_onceToken != -1) {
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  }
  uint64_t v12 = MEMORY[0x263EF8438];
  if (__osLogPearlLibTrace) {
    size_t v13 = __osLogPearlLibTrace;
  }
  else {
    size_t v13 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219264;
    uint64_t v27 = a1;
    __int16 v28 = 2048;
    size_t v29 = a2;
    __int16 v30 = 2048;
    __int16 v31 = (const char *)a3;
    __int16 v32 = 2048;
    __int16 v33 = a4;
    __int16 v34 = 2048;
    __int16 v35 = a5;
    __int16 v36 = 2048;
    uint64_t v37 = a6;
    _os_log_impl(&dword_22F4CB000, v13, OS_LOG_TYPE_DEFAULT, "encryptFDRDataForBrunor %p %zu %p %p %p %zu\n", buf, 0x3Eu);
  }
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "PSD2", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1152);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      int v22 = __osLogPearlLib;
    }
    else {
      int v22 = v12;
    }
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_88;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v27 = "PSD2";
    __int16 v28 = 2048;
    size_t v29 = 0;
    __int16 v30 = 2080;
    __int16 v31 = "";
    __int16 v32 = 2080;
    __int16 v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v34 = 1024;
    LODWORD(v35) = 1152;
    goto LABEL_87;
  }
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "PSD2Length", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1153);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      int v22 = __osLogPearlLib;
    }
    else {
      int v22 = v12;
    }
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_88;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v27 = "PSD2Length";
    __int16 v28 = 2048;
    size_t v29 = 0;
    __int16 v30 = 2080;
    __int16 v31 = "";
    __int16 v32 = 2080;
    __int16 v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v34 = 1024;
    LODWORD(v35) = 1153;
    goto LABEL_87;
  }
  if (!a3)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "PSD3", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1154);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      int v22 = __osLogPearlLib;
    }
    else {
      int v22 = v12;
    }
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_88;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v27 = "PSD3";
    __int16 v28 = 2048;
    size_t v29 = 0;
    __int16 v30 = 2080;
    __int16 v31 = "";
    __int16 v32 = 2080;
    __int16 v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v34 = 1024;
    LODWORD(v35) = 1154;
    goto LABEL_87;
  }
  if (!a4)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outPSD3Length", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1155);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      int v22 = __osLogPearlLib;
    }
    else {
      int v22 = v12;
    }
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_88;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v27 = "outPSD3Length";
    __int16 v28 = 2048;
    size_t v29 = 0;
    __int16 v30 = 2080;
    __int16 v31 = "";
    __int16 v32 = 2080;
    __int16 v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v34 = 1024;
    LODWORD(v35) = 1155;
    goto LABEL_87;
  }
  if (a5 && a6 != 16)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "PSD3MACLength == (16)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1160);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      int v22 = __osLogPearlLib;
    }
    else {
      int v22 = v12;
    }
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_88;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v27 = "PSD3MACLength == (16)";
    __int16 v28 = 2048;
    size_t v29 = 0;
    __int16 v30 = 2080;
    __int16 v31 = "";
    __int16 v32 = 2080;
    __int16 v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v34 = 1024;
    LODWORD(v35) = 1160;
LABEL_87:
    _os_log_impl(&dword_22F4CB000, v22, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_88:
    uint64_t v16 = 258;
    goto LABEL_18;
  }
  uint64_t v14 = initialize();
  if (v14)
  {
    uint64_t v16 = v14;
    size_t v23 = (int)v14;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v14, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1164);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      unint64_t v24 = __osLogPearlLib;
    }
    else {
      unint64_t v24 = v12;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v27 = "err == 0 ";
      __int16 v28 = 2048;
      size_t v29 = v23;
      __int16 v30 = 2080;
      __int16 v31 = "";
      __int16 v32 = 2080;
      __int16 v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v34 = 1024;
      LODWORD(v35) = 1164;
LABEL_79:
      _os_log_impl(&dword_22F4CB000, v24, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    uint64_t v15 = performCommand(_connect, 80, 0, a1, a2, (void *)a3, a4);
    if (!v15)
    {
      uint64_t v16 = 0;
      if (a5) {
        *a5 = *(_OWORD *)(a3 + 108);
      }
      goto LABEL_18;
    }
    uint64_t v16 = v15;
    size_t v25 = (int)v15;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v15, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1167);
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLib) {
      unint64_t v24 = __osLogPearlLib;
    }
    else {
      unint64_t v24 = v12;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v27 = "err == 0 ";
      __int16 v28 = 2048;
      size_t v29 = v25;
      __int16 v30 = 2080;
      __int16 v31 = "";
      __int16 v32 = 2080;
      __int16 v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v34 = 1024;
      LODWORD(v35) = 1167;
      goto LABEL_79;
    }
  }
LABEL_18:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  if (v16)
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      __int16 v17 = __osLogPearlLibTrace;
    }
    else {
      __int16 v17 = v12;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v27) = v16;
      uint64_t v18 = v17;
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
LABEL_35:
      _os_log_impl(&dword_22F4CB000, v18, v19, "encryptFDRDataForBrunor -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (OSLogInit_onceToken != -1) {
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v20 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v20 = v12;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v27) = 0;
      uint64_t v18 = v20;
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_35;
    }
  }
  return v16;
}

void __OSLogInit_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BiometricKit", "Library-PearlFactory");
  CFDictionaryRef v1 = (void *)__osLogPearlLib;
  __osLogPearlLib = (uint64_t)v0;

  uint64_t v2 = (void *)__osLogPearlLib;
  if (!__osLogPearlLib)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __OSLogInit_block_invoke_cold_1();
    }
    uint64_t v2 = (void *)__osLogPearlLib;
  }

  objc_storeStrong((id *)&__osLogPearlLibTrace, v2);
}

void __OSLogInit_block_invoke_cold_1()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_error_impl(&dword_22F4CB000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.Library-PearlFactory'!\n", v0, 2u);
}

void SavageCFDictionarySetInteger32_cold_1()
{
  __assert_rtn("SavageCFDictionarySetInteger32", "SavagePrivateHelper.cpp", 35, "num != NULL");
}

void SavageCFDictionarySetData_cold_1()
{
}

void YonkersUpdateController::getSignedCertificate()
{
  __assert_rtn("getSignedCertificate", "YonkersUpdateController.cpp", 747, "numLenOctets <= MAX_LEN_OCTETS");
}

{
  __assert_rtn("getSignedCertificate", "YonkersUpdateController.cpp", 728, "numLenOctets <= MAX_LEN_OCTETS");
}

{
  __assert_rtn("getSignedCertificate", "YonkersUpdateController.cpp", 709, "numLenOctets <= MAX_LEN_OCTETS");
}

{
  __assert_rtn("getSignedCertificate", "YonkersUpdateController.cpp", 642, "numLenOctets <= MAX_LEN_OCTETS");
}

{
  __assert_rtn("getSignedCertificate", "YonkersUpdateController.cpp", 624, "numLenOctets <= MAX_LEN_OCTETS");
}

{
  __assert_rtn("getSignedCertificate", "YonkersUpdateController.cpp", 604, "numLenOctets <= MAX_LEN_OCTETS");
}

{
  __assert_rtn("getSignedCertificate", "YonkersUpdateController.cpp", 573, "numLenOctets <= MAX_LEN_OCTETS");
}

{
  __assert_rtn("getSignedCertificate", "YonkersUpdateController.cpp", 555, "numLenOctets <= MAX_LEN_OCTETS");
}

void YonkersUpdateController::validateSignatureLen()
{
  __assert_rtn("validateSignatureLen", "YonkersUpdateController.cpp", 806, "sigRLen >= MIN_SIG_LEN && sigRLen <= MAX_ACCEPTED_SIG_LEN");
}

{
  __assert_rtn("validateSignatureLen", "YonkersUpdateController.cpp", 829, "sigSLen >= MIN_SIG_LEN && sigSLen <= MAX_ACCEPTED_SIG_LEN");
}

void SavageUpdateController::formatAndStitchFiles()
{
}

void SavageUpdateController::getFirmwareDigest()
{
  __assert_rtn("getFirmwareDigest", "SavageUpdateController.cpp", 978, "numLenOctets <= MAX_LEN_OCTETS");
}

void SavageUpdateController::getSignedCertificate()
{
  __assert_rtn("getSignedCertificate", "SavageUpdateController.cpp", 1079, "numLenOctets <= MAX_LEN_OCTETS");
}

{
  __assert_rtn("getSignedCertificate", "SavageUpdateController.cpp", 1027, "numLenOctets <= MAX_LEN_OCTETS");
}

void SavageUpdateController::validateSignatureLen()
{
  __assert_rtn("validateSignatureLen", "SavageUpdateController.cpp", 1155, "sigRLen >= MIN_SIG_LEN && sigRLen <= MAX_ACCEPTED_SIG_LEN");
}

{
  __assert_rtn("validateSignatureLen", "SavageUpdateController.cpp", 1177, "sigSLen >= MIN_SIG_LEN && sigSLen <= MAX_ACCEPTED_SIG_LEN");
}

uint64_t AMFDRCreateInstanceString()
{
  return MEMORY[0x270F91D88]();
}

uint64_t AMFDRModuleCreateSignedCSR()
{
  return MEMORY[0x270F91E90]();
}

uint64_t AMFDRSealingMapCopyLocalDataForClass()
{
  return MEMORY[0x270F91F80]();
}

uint64_t AMSupportMakeDirectory()
{
  return MEMORY[0x270F97AD0]();
}

uint64_t AMSupportPlatformFileURLExists()
{
  return MEMORY[0x270F97AE0]();
}

uint64_t AMSupportWriteDataToFileURL()
{
  return MEMORY[0x270F97B50]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x270EE4788](cf);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
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

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
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

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A0](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x270EE49C0](allocator, domain, code, userInfo);
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

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x270EE5090](alloc, theArray, separatorString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x270EF49D0](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x270EF49E8](*(void *)&mainPort, path);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF4A50](*(void *)&entry, plane, key, allocator, *(void *)&options);
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

uint64_t SavageCamInterfaceClose()
{
  return MEMORY[0x270F5CB30]();
}

uint64_t SavageCamInterfaceGetSensorInfo()
{
  return MEMORY[0x270F5CB40]();
}

uint64_t SavageCamInterfaceOpen()
{
  return MEMORY[0x270F5CB48]();
}

uint64_t SavageCamInterfaceSensorAuth()
{
  return MEMORY[0x270F5CB58]();
}

uint64_t SavageCamInterfaceSensorFusing()
{
  return MEMORY[0x270F5CB60]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}