void *sub_100001538()
{
  void *v0;

  v0 = operator new(0x38uLL);
  *(_WORD *)v0 = 0;
  v0[1] = 0;
  v0[2] = 0;
  *((_DWORD *)v0 + 6) = 0x10000;
  *(void *)((char *)v0 + 44) = 0;
  *(void *)((char *)v0 + 36) = 0;
  *((_DWORD *)v0 + 13) = 0;
  *((unsigned char *)v0 + 28) = 0;
  sub_100001634((uint64_t)v0);
  sub_100001800((uint64_t)v0);
  qword_10000C060 = (uint64_t)v0;
  return v0;
}

void sub_100001598(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000015AC(uint64_t a1)
{
  *(_WORD *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 24) = 0x10000;
  *(void *)(a1 + 44) = 0;
  *(void *)(a1 + 36) = 0;
  *(_DWORD *)(a1 + 52) = 0;
  *(unsigned char *)(a1 + 28) = 0;
  sub_100001634(a1);
  sub_100001800(a1);
  return a1;
}

void sub_1000015FC()
{
  if (qword_10000C060)
  {
    v0 = (void *)sub_100001A18(qword_10000C060);
    operator delete(v0);
    qword_10000C060 = 0;
  }
}

uint64_t sub_100001634(uint64_t a1)
{
  CFMutableDictionaryRef properties = 0;
  io_registry_entry_t v2 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/chosen");
  uint64_t v3 = 0;
  v4 = (io_iterator_t *)(a1 + 36);
  while (1)
  {
    CFDictionaryRef v5 = IOServiceMatching(off_100008308[v3]);
    uint64_t MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v5, (io_iterator_t *)(a1 + 36));
    if (!MatchingServices)
    {
      if (*v4) {
        break;
      }
    }
    io_iterator_t *v4 = 0;
    if (++v3 == 3)
    {
      LODWORD(v3) = 1;
      goto LABEL_6;
    }
  }
  if ((v3 - 1) < 2) {
    *(unsigned char *)(a1 + 27) = 1;
  }
LABEL_6:
  if (v2)
  {
    CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v2, @"development-cert", kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      CFDataRef v8 = CFProperty;
      CFTypeID v9 = CFGetTypeID(CFProperty);
      if (v9 == CFDataGetTypeID()) {
        *(unsigned char *)(a1 + 26) = *CFDataGetBytePtr(v8) == 0;
      }
      CFRelease(v8);
    }
  }
  io_object_t v10 = IOIteratorNext(*v4);
  if (v10)
  {
    io_registry_entry_t v11 = v10;
    while (1)
    {
      uint64_t MatchingServices = IORegistryEntryCreateCFProperties(v11, &properties, kCFAllocatorDefault, 0);
      if (!MatchingServices)
      {
        if (*(_DWORD *)(a1 + 40))
        {
          uint64_t MatchingServices = 0;
        }
        else
        {
          *(_DWORD *)(a1 + 40) = v11;
          if (!v3) {
            sub_100001AF0(a1);
          }
          uint64_t MatchingServices = sub_100001BC0(a1);
          if (!MatchingServices)
          {
LABEL_23:
            if (properties) {
              CFRelease(properties);
            }
            return MatchingServices;
          }
          sub_100001A74(a1);
          if (properties)
          {
            CFRelease(properties);
            CFMutableDictionaryRef properties = 0;
          }
          IOObjectRelease(*(_DWORD *)(a1 + 40));
          *(_DWORD *)(a1 + 40) = 0;
        }
      }
      io_registry_entry_t v11 = IOIteratorNext(*v4);
      if (!v11) {
        goto LABEL_23;
      }
    }
  }
  return MatchingServices;
}

uint64_t sub_100001800(uint64_t a1)
{
  uint64_t v2 = 3758097136;
  *(void *)buffer = 0;
  uint64_t v17 = 0;
  memset(v15, 0, sizeof(v15));
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 40), @"YonkersUID", kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    CFDataRef v4 = CFProperty;
    CFTypeID v5 = CFGetTypeID(CFProperty);
    if (v5 != CFDataGetTypeID()) {
      goto LABEL_24;
    }
    v18.location = 0;
    v18.length = 16;
    CFDataGetBytes(v4, v18, buffer);
    CFRelease(v4);
    *(void *)(a1 + 8) = bswap64(*(unint64_t *)buffer);
    CFDataRef v6 = (const __CFData *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 40), @"YonkersFabRevision", kCFAllocatorDefault, 0);
    if (!v6) {
      return 0;
    }
    CFDataRef v4 = v6;
    CFTypeID v7 = CFGetTypeID(v6);
    if (v7 != CFDataGetTypeID())
    {
      uint64_t v2 = 0;
      goto LABEL_24;
    }
    BytePtr = CFDataGetBytePtr(v4);
    if (BytePtr) {
      unsigned int v9 = __rev16(*(unsigned __int16 *)BytePtr);
    }
    else {
      unsigned int v9 = 0;
    }
    CFRelease(v4);
    for (uint64_t i = 0; i != 5; ++i)
    {
      if (v9 == dword_100007E44[i])
      {
        *(unsigned char *)a1 = 0;
        goto LABEL_18;
      }
    }
    if (*(unsigned char *)a1)
    {
      uint64_t v11 = 0;
      while (v9 != dword_100007E58[v11])
      {
        if (++v11 == 10) {
          goto LABEL_18;
        }
      }
      *(unsigned char *)(a1 + 1) = 1;
    }
LABEL_18:
    CFDataRef v12 = (const __CFData *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 40), @"YonkersPubKeyHmac", kCFAllocatorDefault, 0);
    if (v12)
    {
      CFDataRef v4 = v12;
      CFTypeID v13 = CFGetTypeID(v12);
      if (v13 == CFDataGetTypeID())
      {
        v19.location = 0;
        v19.length = 32;
        CFDataGetBytes(v4, v19, (UInt8 *)v15);
        CFRelease(v4);
        uint64_t v2 = 0;
        *(void *)(a1 + 16) = bswap64(*(unint64_t *)&v15[0]);
        return v2;
      }
LABEL_24:
      CFRelease(v4);
    }
  }
  return v2;
}

uint64_t sub_100001A18(uint64_t a1)
{
  io_object_t v2 = *(_DWORD *)(a1 + 36);
  if (v2) {
    IOObjectRelease(v2);
  }
  io_object_t v3 = *(_DWORD *)(a1 + 40);
  if (v3) {
    IOObjectRelease(v3);
  }
  sub_100001A74(a1);
  return a1;
}

void sub_100001A60(void *a1)
{
}

uint64_t sub_100001A74(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 27))
  {
    SavageCamInterfaceClose();
    uint64_t result = 0;
    *(void *)(a1 + 48) = 0;
  }
  else
  {
    mach_port_t v3 = *(_DWORD *)(a1 + 44);
    if (v3)
    {
      uint64_t v4 = IOConnectCallScalarMethod(v3, 4u, 0, 0, 0, 0);
      IOServiceClose(*(_DWORD *)(a1 + 44));
      *(_DWORD *)(a1 + 44) = 0;
      return v4;
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

void sub_100001AF0(uint64_t a1)
{
  CFDataRef v2 = (const __CFData *)IORegistryEntrySearchCFProperty(*(_DWORD *)(a1 + 40), "IOService", @"sensor-type", kCFAllocatorDefault, 3u);
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
        *(unsigned char *)a1 = 1;
        *(_DWORD *)(a1 + 32) = 2;
      }
      else
      {
        *(unsigned char *)a1 = 0;
      }
    }
    CFRelease(v3);
  }
}

uint64_t sub_100001BC0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 27) == 1)
  {
    uint64_t v6 = 0;
    CFDataRef v2 = (uint64_t *)(a1 + 48);
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
    *(_DWORD *)(a1 + 32) = v6;
    int v4 = BYTE4(v6);
    *(unsigned char *)(a1 + 28) = BYTE4(v6);
    *(unsigned char *)a1 = BYTE5(v6);
    if (!v4) {
      sub_100001A74(a1);
    }
  }
  if (*(unsigned char *)(a1 + 28)) {
    return 0;
  }
  if (*(_DWORD *)(a1 + 44)) {
    return 3758097093;
  }
  LODWORD(result) = IOServiceOpen(*(_DWORD *)(a1 + 40), mach_task_self_, 0x2Au, (io_connect_t *)(a1 + 44));
  mach_port_t v5 = *(_DWORD *)(a1 + 44);
  if (v5) {
    uint64_t result = result;
  }
  else {
    uint64_t result = 3758097084;
  }
  if (!result)
  {
    uint64_t v6 = 0;
    return IOConnectCallScalarMethod(v5, 3u, &v6, 1u, 0, 0);
  }
  return result;
}

uint64_t sub_100001CE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 3758097136;
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 40), @"YonkersMNS", kCFAllocatorDefault, 0);
  if (!CFProperty) {
    return v4;
  }
  CFDataRef v6 = CFProperty;
  CFTypeID v7 = CFGetTypeID(CFProperty);
  if (v7 != CFDataGetTypeID()) {
    goto LABEL_19;
  }
  BytePtr = CFDataGetBytePtr(v6);
  if (BytePtr)
  {
    int v9 = *BytePtr;
    if (v9 == 4)
    {
      *(_DWORD *)a2 = 0;
      int v9 = *BytePtr;
    }
    if (v9 == 8) {
      *(_DWORD *)a2 = 1;
    }
  }
  CFRelease(v6);
  CFDataRef v10 = (const __CFData *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 40), @"YonkersChipID", kCFAllocatorDefault, 0);
  if (!v10) {
    return v4;
  }
  CFDataRef v6 = v10;
  CFTypeID v11 = CFGetTypeID(v10);
  if (v11 != CFDataGetTypeID()) {
    goto LABEL_19;
  }
  CFDataRef v12 = (unsigned int *)CFDataGetBytePtr(v6);
  if (v12) {
    *(_DWORD *)(a2 + 4) = bswap32(*v12);
  }
  CFRelease(v6);
  CFDataRef v13 = (const __CFData *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 40), @"YonkersUID", kCFAllocatorDefault, 0);
  if (!v13) {
    return v4;
  }
  CFDataRef v6 = v13;
  CFTypeID v14 = CFGetTypeID(v13);
  if (v14 != CFDataGetTypeID()) {
    goto LABEL_19;
  }
  v20.location = 0;
  v20.length = 16;
  CFDataGetBytes(v6, v20, (UInt8 *)(a2 + 8));
  CFRelease(v6);
  CFDataRef v15 = (const __CFData *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 40), @"YonkersPubKey", kCFAllocatorDefault, 0);
  if (!v15) {
    return v4;
  }
  CFDataRef v6 = v15;
  CFTypeID v16 = CFGetTypeID(v15);
  if (v16 != CFDataGetTypeID())
  {
LABEL_19:
    CFRelease(v6);
    return v4;
  }
  v21.location = 0;
  v21.length = 64;
  CFDataGetBytes(v6, v21, (UInt8 *)(a2 + 24));
  CFRelease(v6);
  CFDataRef v17 = (const __CFData *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 40), @"YonkersPubKeyHmac", kCFAllocatorDefault, 0);
  if (v17)
  {
    CFDataRef v6 = v17;
    CFTypeID v18 = CFGetTypeID(v17);
    if (v18 == CFDataGetTypeID())
    {
      v22.location = 0;
      v22.length = 32;
      CFDataGetBytes(v6, v22, (UInt8 *)(a2 + 88));
      uint64_t v4 = 0;
    }
    goto LABEL_19;
  }
  return v4;
}

uint64_t sub_100001EE4(uint64_t a1, __CFDictionary *a2)
{
  uint64_t v4 = 3758097136;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 40), @"YonkersUID", kCFAllocatorDefault, 0);
  if (!CFProperty) {
    return v4;
  }
  CFDataRef v6 = CFProperty;
  CFTypeID v7 = CFGetTypeID(CFProperty);
  if (v7 != CFDataGetTypeID()) {
    goto LABEL_29;
  }
  CFDictionaryAddValue(a2, @"Yonkers,ECID", v6);
  CFRelease(v6);
  CFTypeRef v8 = IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 40), @"YonkersNonce", kCFAllocatorDefault, 0);
  if (!v8) {
    return v4;
  }
  CFDataRef v6 = v8;
  CFTypeID v9 = CFGetTypeID(v8);
  if (v9 != CFDataGetTypeID()) {
    goto LABEL_29;
  }
  CFDictionaryAddValue(a2, @"Yonkers,Nonce", v6);
  CFRelease(v6);
  CFTypeRef v10 = IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 40), @"YonkersFabRevision", kCFAllocatorDefault, 0);
  if (!v10) {
    return v4;
  }
  CFDataRef v6 = v10;
  CFTypeID v11 = CFGetTypeID(v10);
  if (v11 != CFDataGetTypeID()) {
    goto LABEL_29;
  }
  BytePtr = CFDataGetBytePtr((CFDataRef)v6);
  if (BytePtr)
  {
    int v13 = __rev16(*(unsigned __int16 *)BytePtr);
    char v14 = 1;
    if (v13 > 59904)
    {
      BOOL v15 = v13 == 59905;
      int v16 = 61953;
    }
    else
    {
      BOOL v15 = v13 == 54529;
      int v16 = 56577;
    }
    if (!v15 && v13 != v16) {
      char v14 = 0;
    }
    *(unsigned char *)(a1 + 24) = v14;
    sub_100003124(a2, @"Yonkers,FabRevision", v13);
  }
  CFRelease(v6);
  CFTypeRef v18 = IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 40), @"YonkersChipID", kCFAllocatorDefault, 0);
  if (!v18) {
    return v4;
  }
  CFDataRef v6 = v18;
  CFTypeID v19 = CFGetTypeID(v18);
  if (v19 != CFDataGetTypeID())
  {
LABEL_29:
    CFRelease(v6);
    return v4;
  }
  CFRange v20 = (unsigned int *)CFDataGetBytePtr((CFDataRef)v6);
  if (v20) {
    sub_100003124(a2, @"Yonkers,ChipID", bswap32(*v20));
  }
  CFRelease(v6);
  CFTypeRef v21 = IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 40), @"YonkersMNS", kCFAllocatorDefault, 0);
  if (v21)
  {
    CFDataRef v6 = v21;
    CFTypeID v22 = CFGetTypeID(v21);
    if (v22 == CFDataGetTypeID())
    {
      v23 = CFDataGetBytePtr((CFDataRef)v6);
      if (v23)
      {
        int v24 = *v23;
        if (v24 == 4)
        {
          *(unsigned char *)(a1 + 25) = 0;
          int v24 = *v23;
        }
        if (v24 == 8) {
          *(unsigned char *)(a1 + 25) = 1;
        }
      }
      sub_100003198(a2, @"YonkersIsProvisioned", *(unsigned __int8 *)(a1 + 8));
      uint64_t v4 = 0;
    }
    goto LABEL_29;
  }
  return v4;
}

uint64_t sub_100002160(uint64_t a1, unsigned int a2)
{
  if (*(unsigned char *)(a1 + 28))
  {
    uint64_t v2 = *(void *)(a1 + 48);
    return _SavageCamInterfaceSensorPrePersonalize(v2, 1);
  }
  else
  {
    mach_port_t v3 = *(_DWORD *)(a1 + 44);
    if (v3)
    {
      uint64_t v5 = a2;
      return IOConnectCallScalarMethod(v3, 0x43u, &v5, 1u, 0, 0);
    }
    else
    {
      return 3758097084;
    }
  }
}

uint64_t sub_100002220(uint64_t a1, unsigned int a2)
{
  if (*(unsigned char *)(a1 + 28))
  {
    uint64_t v2 = *(void *)(a1 + 48);
    return _SavageCamInterfaceSensorPreFusing(v2, 1);
  }
  else
  {
    mach_port_t v3 = *(_DWORD *)(a1 + 44);
    if (v3)
    {
      uint64_t v5 = a2;
      return IOConnectCallScalarMethod(v3, 0x44u, &v5, 1u, 0, 0);
    }
    else
    {
      return 3758097084;
    }
  }
}

uint64_t sub_1000022E0(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4)
{
  if (*(unsigned char *)(a1 + 28))
  {
    uint64_t v5 = SavageCamInterfaceSensorFusing();
LABEL_3:
    uint64_t v6 = v5;
    goto LABEL_4;
  }
  mach_port_t v8 = *(_DWORD *)(a1 + 44);
  v9[2] = a2;
  uint64_t v6 = 3758097090;
  if (a3 && a4)
  {
    v9[0] = a3;
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
  *(void *)(a1 + 8) = 0;
  sub_100001800(a1);
  return v6;
}

void sub_1000023B0(const __CFDictionary *a1, __CFDictionary *a2)
{
  CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,ReadECKey");
  if (Value)
  {
    CFBooleanRef v5 = Value;
    CFTypeID v6 = CFGetTypeID(Value);
    if (v6 == CFBooleanGetTypeID())
    {
      int v7 = CFBooleanGetValue(v5);
      mach_port_t v8 = (const void **)&kCFBooleanTrue;
      if (!v7) {
        mach_port_t v8 = (const void **)&kCFBooleanFalse;
      }
      CFDictionaryAddValue(a2, @"Yonkers,ReadECKey", *v8);
    }
  }
  CFBooleanRef v9 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,WriteECKey");
  if (v9)
  {
    CFBooleanRef v10 = v9;
    CFTypeID v11 = CFGetTypeID(v9);
    if (v11 == CFBooleanGetTypeID())
    {
      int v12 = CFBooleanGetValue(v10);
      int v13 = (const void **)&kCFBooleanTrue;
      if (!v12) {
        int v13 = (const void **)&kCFBooleanFalse;
      }
      CFDictionaryAddValue(a2, @"Yonkers,WriteECKey", *v13);
    }
  }
  CFBooleanRef v14 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,WriteECID");
  if (v14)
  {
    CFBooleanRef v15 = v14;
    CFTypeID v16 = CFGetTypeID(v14);
    if (v16 == CFBooleanGetTypeID())
    {
      int v17 = CFBooleanGetValue(v15);
      CFTypeRef v18 = (const void **)&kCFBooleanTrue;
      if (!v17) {
        CFTypeRef v18 = (const void **)&kCFBooleanFalse;
      }
      CFDictionaryAddValue(a2, @"Yonkers,WriteECID", *v18);
    }
  }
  CFBooleanRef v19 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,WriteEpoch");
  if (v19)
  {
    CFBooleanRef v20 = v19;
    CFTypeID v21 = CFGetTypeID(v19);
    if (v21 == CFBooleanGetTypeID())
    {
      int v22 = CFBooleanGetValue(v20);
      v23 = (const void **)&kCFBooleanTrue;
      if (!v22) {
        v23 = (const void **)&kCFBooleanFalse;
      }
      CFDictionaryAddValue(a2, @"Yonkers,WriteEpoch", *v23);
    }
  }
  CFBooleanRef v24 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,ReadGID");
  if (v24)
  {
    CFBooleanRef v25 = v24;
    CFTypeID v26 = CFGetTypeID(v24);
    if (v26 == CFBooleanGetTypeID())
    {
      int v27 = CFBooleanGetValue(v25);
      v28 = (const void **)&kCFBooleanTrue;
      if (!v27) {
        v28 = (const void **)&kCFBooleanFalse;
      }
      CFDictionaryAddValue(a2, @"Yonkers,ReadGID", *v28);
    }
  }
  CFBooleanRef v29 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,ReadFWKey");
  if (v29)
  {
    CFBooleanRef v30 = v29;
    CFTypeID v31 = CFGetTypeID(v29);
    if (v31 == CFBooleanGetTypeID())
    {
      int v32 = CFBooleanGetValue(v30);
      v33 = (const void **)&kCFBooleanTrue;
      if (!v32) {
        v33 = (const void **)&kCFBooleanFalse;
      }
      CFDictionaryAddValue(a2, @"Yonkers,ReadFWKey", *v33);
    }
  }
  CFBooleanRef v34 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,AllowOfflineBoot");
  if (v34)
  {
    CFBooleanRef v35 = v34;
    CFTypeID v36 = CFGetTypeID(v34);
    if (v36 == CFBooleanGetTypeID())
    {
      int v37 = CFBooleanGetValue(v35);
      v38 = (const void **)&kCFBooleanTrue;
      if (!v37) {
        v38 = (const void **)&kCFBooleanFalse;
      }
      CFDictionaryAddValue(a2, @"Yonkers,AllowOfflineBoot", *v38);
    }
  }
  CFBooleanRef v39 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,TempDemote");
  if (v39)
  {
    CFBooleanRef v40 = v39;
    CFTypeID v41 = CFGetTypeID(v39);
    if (v41 == CFBooleanGetTypeID())
    {
      int v42 = CFBooleanGetValue(v40);
      v43 = (const void **)&kCFBooleanTrue;
      if (!v42) {
        v43 = (const void **)&kCFBooleanFalse;
      }
      CFDictionaryAddValue(a2, @"Yonkers,TempDemote", *v43);
    }
  }
  CFBooleanRef v44 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,AccessSensor");
  if (v44)
  {
    CFBooleanRef v45 = v44;
    CFTypeID v46 = CFGetTypeID(v44);
    if (v46 == CFBooleanGetTypeID())
    {
      int v47 = CFBooleanGetValue(v45);
      v48 = (const void **)&kCFBooleanTrue;
      if (!v47) {
        v48 = (const void **)&kCFBooleanFalse;
      }
      CFDictionaryAddValue(a2, @"Yonkers,AccessSensor", *v48);
    }
  }
  CFBooleanRef v49 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,AccessSecurity");
  if (v49)
  {
    CFBooleanRef v50 = v49;
    CFTypeID v51 = CFGetTypeID(v49);
    if (v51 == CFBooleanGetTypeID())
    {
      int v52 = CFBooleanGetValue(v50);
      v53 = (const void **)&kCFBooleanTrue;
      if (!v52) {
        v53 = (const void **)&kCFBooleanFalse;
      }
      CFDictionaryAddValue(a2, @"Yonkers,AccessSecurity", *v53);
    }
  }
  CFBooleanRef v54 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,FADemote");
  if (v54)
  {
    CFBooleanRef v55 = v54;
    CFTypeID v56 = CFGetTypeID(v54);
    if (v56 == CFBooleanGetTypeID())
    {
      int v57 = CFBooleanGetValue(v55);
      v58 = (const void **)&kCFBooleanTrue;
      if (!v57) {
        v58 = (const void **)&kCFBooleanFalse;
      }
      CFDictionaryAddValue(a2, @"Yonkers,FADemote", *v58);
    }
  }
  CFBooleanRef v59 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,DebugStatus");
  if (v59)
  {
    CFBooleanRef v60 = v59;
    CFTypeID v61 = CFGetTypeID(v59);
    if (v61 == CFBooleanGetTypeID())
    {
      int v62 = CFBooleanGetValue(v60);
      v63 = (const void **)&kCFBooleanTrue;
      if (!v62) {
        v63 = (const void **)&kCFBooleanFalse;
      }
      CFDictionaryAddValue(a2, @"Yonkers,DebugStatus", *v63);
    }
  }
  CFBooleanRef v64 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,Provisioning");
  if (v64)
  {
    CFBooleanRef v65 = v64;
    CFTypeID v66 = CFGetTypeID(v64);
    if (v66 == CFBooleanGetTypeID())
    {
      int v67 = CFBooleanGetValue(v65);
      v68 = &kCFBooleanTrue;
      if (!v67) {
        v68 = &kCFBooleanFalse;
      }
      CFBooleanRef v69 = *v68;
      CFDictionaryAddValue(a2, @"Yonkers,Provisioning", v69);
    }
  }
}

uint64_t sub_1000028D4(const __CFData *a1, CFTypeRef *a2)
{
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  *(_OWORD *)md = 0u;
  long long v15 = 0u;
  CFBooleanRef v5 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFTypeID v6 = 0;
  if (v5) {
    BOOL v7 = Mutable == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v8 = 2;
    if (a1 && a2)
    {
      unint64_t Length = CFDataGetLength(a1);
      CFTypeID v6 = (UInt8 *)calloc(Length, 1uLL);
      if (v6)
      {
        v16.location = 0;
        v16.length = Length;
        CFDataGetBytes(a1, v16, v6);
        if (!(Length >> 20))
        {
          CC_SHA256_Init(&c);
          CC_SHA256_Update(&c, v6, Length);
          CC_SHA256_Final(md, &c);
        }
        CFDataRef v10 = CFDataCreate(kCFAllocatorDefault, md, 32);
        if (v10)
        {
          CFDataRef v11 = v10;
          CFDictionarySetValue(Mutable, @"Digest", v10);
          CFDictionarySetValue(v5, @"MeasurementDictPatch", Mutable);
          *a2 = sub_100003118(v5);
          CFRelease(v11);
          uint64_t v8 = 0;
        }
        else
        {
          uint64_t v8 = 8;
        }
      }
      else
      {
        uint64_t v8 = 3;
      }
    }
    goto LABEL_12;
  }
  uint64_t v8 = 3;
  if (Mutable) {
LABEL_12:
  }
    CFRelease(Mutable);
  if (v5) {
    CFRelease(v5);
  }
  if (v6) {
    free(v6);
  }
  return v8;
}

uint64_t sub_100002AA8(const __CFDictionary *a1, const __CFDictionary *a2, CFDictionaryRef theDict, uint64_t a4, CFTypeRef *a5)
{
  CFMutableDictionaryRef Mutable = 0;
  CFTypeRef v69 = 0;
  key = 0;
  int valuePtr = 0;
  uint64_t v6 = 2;
  if (!a1 || !a2 || !theDict || !a4)
  {
    CFDataRef v10 = 0;
    goto LABEL_66;
  }
  CFDataRef v10 = 0;
  if (!a5) {
    goto LABEL_66;
  }
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"MeasurementDictPatch");
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDataRef v11 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDataRef v10 = v11;
  uint64_t v6 = 3;
  if (!v11 || !Mutable || !Value) {
    goto LABEL_66;
  }
  CFDictionaryAddValue(v11, @"@Yonkers,Ticket", kCFBooleanTrue);
  int v12 = CFDictionaryGetValue(a2, @"Yonkers,BoardID");
  if (!v12) {
    goto LABEL_77;
  }
  int v13 = v12;
  CFTypeID v14 = CFGetTypeID(v12);
  if (v14 != CFNumberGetTypeID()) {
    goto LABEL_77;
  }
  CFDictionaryAddValue(v10, @"Yonkers,BoardID", v13);
  long long v15 = CFDictionaryGetValue(a2, @"Yonkers,PatchEpoch");
  if (!v15) {
    goto LABEL_77;
  }
  CFRange v16 = v15;
  CFTypeID v17 = CFGetTypeID(v15);
  if (v17 != CFNumberGetTypeID()) {
    goto LABEL_77;
  }
  CFDictionaryAddValue(v10, @"Yonkers,PatchEpoch", v16);
  CFTypeRef v18 = CFDictionaryGetValue(a1, @"Yonkers,ChipID");
  if (!v18) {
    goto LABEL_77;
  }
  CFBooleanRef v19 = v18;
  CFTypeID v20 = CFGetTypeID(v18);
  if (v20 != CFNumberGetTypeID()) {
    goto LABEL_77;
  }
  CFDictionaryAddValue(v10, @"Yonkers,ChipID", v19);
  CFNumberGetValue((CFNumberRef)v19, kCFNumberSInt32Type, &valuePtr);
  CFBooleanRef v21 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,ProductionMode");
  if (!v21) {
    goto LABEL_77;
  }
  CFBooleanRef v22 = v21;
  CFTypeID v23 = CFGetTypeID(v21);
  if (v23 != CFBooleanGetTypeID()) {
    goto LABEL_77;
  }
  int v66 = CFBooleanGetValue(v22);
  CFBooleanRef v24 = v66 ? kCFBooleanTrue : kCFBooleanFalse;
  CFDictionaryAddValue(v10, @"Yonkers,ProductionMode", v24);
  CFBooleanRef v25 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"YonkersIsProvisioned");
  if (v25 && (CFBooleanRef v26 = v25, v27 = CFGetTypeID(v25), v27 == CFBooleanGetTypeID())) {
    int v28 = CFBooleanGetValue(v26);
  }
  else {
    int v28 = 1;
  }
  CFBooleanRef v29 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"YonkersIsYmgt");
  if (v29 && (CFBooleanRef v30 = v29, v31 = CFGetTypeID(v29), v31 == CFBooleanGetTypeID())) {
    int v62 = CFBooleanGetValue(v30);
  }
  else {
    int v62 = 0;
  }
  CFBooleanRef v32 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,WriteECID");
  if (v32 && (v33 = v32, CFTypeID v34 = CFGetTypeID(v32), v34 == CFBooleanGetTypeID())) {
    int v35 = CFBooleanGetValue(v33);
  }
  else {
    int v35 = 0;
  }
  CFTypeID v36 = CFDictionaryGetValue(a1, @"Yonkers,ECID");
  if (!v36) {
    goto LABEL_77;
  }
  int v37 = v36;
  CFTypeID v38 = CFGetTypeID(v36);
  if (v38 != CFDataGetTypeID()) {
    goto LABEL_77;
  }
  CFDictionaryAddValue(v10, @"Yonkers,ECID", v37);
  CFBooleanRef v39 = CFDictionaryGetValue(a1, @"Yonkers,Nonce");
  if (!v39) {
    goto LABEL_77;
  }
  CFBooleanRef v40 = v39;
  CFTypeID v41 = CFGetTypeID(v39);
  if (v41 != CFDataGetTypeID()) {
    goto LABEL_77;
  }
  CFDictionaryAddValue(v10, @"Yonkers,Nonce", v40);
  int v42 = sub_100003580(a1, (CFTypeRef *)&key, &v69);
  v43 = key;
  uint64_t v6 = 17;
  if (!v42 && key)
  {
    CFBooleanRef v44 = CFDictionaryGetValue(theDict, @"MeasurementDictPatch");
    CFBooleanRef v45 = (__CFDictionary *)sub_100003118(v44);
    if (!v45)
    {
LABEL_66:
      v43 = key;
      goto LABEL_67;
    }
    CFTypeID v46 = v45;
    CFTypeID v47 = CFGetTypeID(v45);
    if (v47 == CFDictionaryGetTypeID())
    {
      v63 = a5;
      CFBooleanRef v64 = Mutable;
      CFDictionaryAddValue(v46, @"EPRO", v24);
      v48 = CFDictionaryGetValue(a1, @"Yonkers,FabRevision");
      CFDictionaryAddValue(v46, @"FabRevision", v48);
      CFDictionaryAddValue(v10, key, v46);
      CFRelease(v46);
      if (!(v28 | v35))
      {
        CFDictionaryRemoveValue(v10, key);
        if (valuePtr == 1300)
        {
          uint64_t v55 = 4 * (v62 != 0);
          if (v62) {
            unint64_t v56 = 8;
          }
          else {
            unint64_t v56 = 4;
          }
          while (1)
          {
            int v57 = dword_100007E98[v55];
            if (sub_10000366C(v57, v66, (CFTypeRef *)&key, 0) || key == 0) {
              goto LABEL_74;
            }
            CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, Value);
            if (!MutableCopy) {
              goto LABEL_74;
            }
            CFTypeID v46 = MutableCopy;
            CFTypeID v60 = CFGetTypeID(MutableCopy);
            if (v60 != CFDictionaryGetTypeID())
            {
LABEL_75:
              CFMutableDictionaryRef Mutable = v64;
              goto LABEL_76;
            }
            CFDictionarySetValue(v46, @"EPRO", v24);
            sub_100003124(v46, @"FabRevision", v57);
            CFDictionarySetValue(v10, key, v46);
            CFRelease(v46);
            if (++v55 >= v56) {
              goto LABEL_64;
            }
          }
        }
        if (valuePtr == 1044)
        {
          uint64_t v49 = 4 * (v62 != 0);
          if (v62) {
            unint64_t v50 = 6;
          }
          else {
            unint64_t v50 = 4;
          }
          while (1)
          {
            int v51 = dword_100007E80[v49];
            if (sub_10000366C(v51, v66, (CFTypeRef *)&key, 0) || key == 0) {
              break;
            }
            CFMutableDictionaryRef v53 = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, Value);
            if (!v53) {
              break;
            }
            CFTypeID v46 = v53;
            CFTypeID v54 = CFGetTypeID(v53);
            if (v54 != CFDictionaryGetTypeID()) {
              goto LABEL_75;
            }
            CFDictionarySetValue(v46, @"EPRO", v24);
            sub_100003124(v46, @"FabRevision", v51);
            CFDictionarySetValue(v10, key, v46);
            CFRelease(v46);
            if (++v49 >= v50) {
              goto LABEL_64;
            }
          }
LABEL_74:
          uint64_t v6 = 17;
          goto LABEL_65;
        }
      }
LABEL_64:
      sub_1000023B0(a1, v10);
      uint64_t v6 = 0;
      CFTypeRef *v63 = sub_100003118(v10);
LABEL_65:
      CFMutableDictionaryRef Mutable = v64;
      goto LABEL_66;
    }
LABEL_76:
    CFRelease(v46);
LABEL_77:
    uint64_t v6 = 17;
    goto LABEL_66;
  }
LABEL_67:
  if (v43)
  {
    CFRelease(v43);
    key = 0;
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v10) {
    CFRelease(v10);
  }
  return v6;
}

CFTypeRef sub_100003118(CFTypeRef cf)
{
  if (cf) {
    return CFRetain(cf);
  }
  return cf;
}

void sub_100003124(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  if (!v5) {
    sub_100006354();
  }
  CFNumberRef v6 = v5;
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v6);
}

void sub_100003198(__CFDictionary *a1, const void *a2, int a3)
{
  mach_port_t v3 = (const void **)&kCFBooleanTrue;
  if (!a3) {
    mach_port_t v3 = (const void **)&kCFBooleanFalse;
  }
  CFDictionarySetValue(a1, a2, *v3);
}

void sub_1000031B8(__CFDictionary *a1, const void *a2, UInt8 *bytes, CFIndex length)
{
  CFDataRef v6 = CFDataCreate(0, bytes, length);
  if (!v6) {
    sub_100006380();
  }
  CFDataRef v7 = v6;
  CFDictionarySetValue(a1, a2, v6);

  CFRelease(v7);
}

uint64_t sub_100003224(const __CFString *a1, _DWORD *a2, int a3)
{
  uint64_t result = CFStringGetCString(a1, buffer, 32, 0x600u);
  if (result)
  {
    *__error() = 0;
    *a2 = strtol(buffer, 0, a3);
    return *__error() == 0;
  }
  return result;
}

CFErrorRef sub_1000032BC(uint64_t a1, unsigned int a2, uint64_t a3, const __CFString *a4)
{
  CFStringRef v7 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@: %s", a4, a1);
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  CFStringRef v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@: Input Options: %@", v7, a3);
  if (!v9)
  {
    CFErrorRef v12 = 0;
    goto LABEL_4;
  }
  CFStringRef v10 = v9;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, kCFErrorLocalizedDescriptionKey, v8);
  CFErrorRef v12 = CFErrorCreate(kCFAllocatorDefault, a4, a2, Mutable);
  CFRelease(v10);
  CFRelease(v8);
  uint64_t v8 = Mutable;
  if (Mutable) {
LABEL_4:
  }
    CFRelease(v8);
  return v12;
}

uint64_t sub_1000033C8(CFDictionaryRef theDict, void *a2, void *a3)
{
  uint64_t result = 2;
  if (theDict && a2 && a3)
  {
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"Savage,ProductionMode");
    if (!Value) {
      return 17;
    }
    CFBooleanRef v8 = Value;
    CFTypeID v9 = CFGetTypeID(Value);
    if (v9 != CFBooleanGetTypeID()) {
      return 17;
    }
    int v10 = CFBooleanGetValue(v8);
    CFDataRef v11 = (const __CFData *)CFDictionaryGetValue(theDict, @"Savage,Revision");
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
        CFBooleanRef v19 = &kSavageTagMeasurementB2ProdPatch;
        CFTypeID v20 = &kSavageTagMeasurementB2DevPatch;
LABEL_23:
        BOOL v22 = v10 == 0;
        if (!v10) {
          CFBooleanRef v19 = v20;
        }
        *a2 = *v19;
        CFTypeID v23 = (uint64_t *)&kSavageTagMeasurementBFProdPatch;
        CFBooleanRef v24 = (uint64_t *)&kSavageTagMeasurementBFDevPatch;
LABEL_26:
        if (v22) {
          CFTypeID v23 = v24;
        }
        uint64_t v25 = *v23;
        goto LABEL_29;
      }
      if (!(((v15 & 0xF0) + 96) >> 4))
      {
        CFBooleanRef v21 = &kSavageTagMeasurementBAProdPatch;
        BOOL v22 = v10 == 0;
        if (!v10) {
          CFBooleanRef v21 = &kSavageTagMeasurementBADevPatch;
        }
        *a2 = *v21;
        CFTypeID v23 = (uint64_t *)&kSavageTagMeasurementBEProdPatch;
        CFBooleanRef v24 = (uint64_t *)&kSavageTagMeasurementBEDevPatch;
        goto LABEL_26;
      }
      if (v16 == 4)
      {
        CFTypeID v17 = (uint64_t *)&kSavageTagMeasurementBEProdPatch;
        CFTypeRef v18 = (uint64_t *)&kSavageTagMeasurementBEDevPatch;
LABEL_19:
        if (!v10) {
          CFTypeID v17 = v18;
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
        CFTypeID v17 = (uint64_t *)&kSavageTagMeasurementBFProdPatch;
        CFTypeRef v18 = (uint64_t *)&kSavageTagMeasurementBFDevPatch;
        goto LABEL_19;
      }
    }
    CFBooleanRef v19 = &kSavageTagMeasurementB0ProdPatch;
    CFTypeID v20 = &kSavageTagMeasurementB0DevPatch;
    goto LABEL_23;
  }
  return result;
}

uint64_t sub_100003580(CFDictionaryRef theDict, CFTypeRef *a2, CFTypeRef *a3)
{
  int valuePtr = 0;
  uint64_t result = 2;
  if (theDict && a2)
  {
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"Yonkers,ProductionMode");
    if (Value
      && (CFBooleanRef v8 = Value, v9 = CFGetTypeID(Value), v9 == CFBooleanGetTypeID())
      && (BOOL v10 = CFBooleanGetValue(v8) != 0,
          (CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"Yonkers,FabRevision")) != 0)
      && (CFNumberRef v12 = v11, v13 = CFGetTypeID(v11), v13 == CFNumberGetTypeID()))
    {
      CFNumberGetValue(v12, kCFNumberSInt32Type, &valuePtr);
      return sub_10000366C(valuePtr, v10, a2, a3);
    }
    else
    {
      return 17;
    }
  }
  return result;
}

uint64_t sub_10000366C(int a1, int a2, CFTypeRef *a3, CFTypeRef *a4)
{
  int v8 = 0;
  uint64_t v9 = 0;
  while (dword_100007EB8[v9] != a1)
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
  CFStringRef v10 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Yonkers,SysTopPatch%X", (v13 - v8));
  CFStringRef v11 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Yonkers,SysTopPatch%X", v14);
  uint64_t v12 = 0;
LABEL_6:
  uint64_t v15 = 0;
  int v16 = &dword_100007ED0;
  while (1)
  {
    int v17 = *v16++;
    if (v17 == a1) {
      break;
    }
    v15 -= 2;
    if (v15 == -16)
    {
      if (!a3) {
        goto LABEL_17;
      }
      goto LABEL_15;
    }
  }
  BOOL v18 = a2 != 0;
  if ((v18 - v15) < 8) {
    int v19 = 8;
  }
  else {
    int v19 = -8;
  }
  uint64_t v20 = (v19 | v18) - v15;
  CFStringRef v10 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Yonkers,SysTopPatch%X", v18 - v15);
  CFStringRef v11 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Yonkers,SysTopPatch%X", v20);
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

uint64_t sub_10000382C(unsigned char *a1, uint64_t *a2, unsigned __int8 *a3, unint64_t a4)
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
      CFDataRef v6 = a1;
      uint64_t v7 = v5;
      while (1)
      {
        uint64_t v8 = *a3;
        if ((_DefaultRuneLocale.__runetype[v8] & 0x10000) == 0) {
          return 2;
        }
        uint64_t v9 = a3[1];
        if ((_DefaultRuneLocale.__runetype[v9] & 0x10000) == 0) {
          return 2;
        }
        unsigned int v10 = v8 - 48;
        unsigned int v11 = v8 - 97;
        if ((v8 - 65) >= 6) {
          char v12 = -1;
        }
        else {
          char v12 = v8 - 55;
        }
        char v13 = v8 - 87;
        if (v11 > 5) {
          char v13 = v12;
        }
        if (v10 < 0xA) {
          char v13 = v10;
        }
        char v14 = 16 * v13;
        unsigned int v15 = v9 - 48;
        unsigned int v16 = v9 - 97;
        if ((v9 - 65) >= 6) {
          char v17 = -1;
        }
        else {
          char v17 = v9 - 55;
        }
        char v18 = v9 - 87;
        if (v16 > 5) {
          char v18 = v17;
        }
        if (v15 < 0xA) {
          char v18 = v15;
        }
        *v6++ = v18 | v14;
        a3 += 2;
        if (!--v7) {
          goto LABEL_27;
        }
      }
    }
  }
  return v4;
}

__CFDictionary *SavageUpdaterGetTagsWithLogging(const __CFDictionary *a1, uint64_t (*a2)(void, void), uint64_t a3, CFTypeRef *a4)
{
  off_10000D070 = a2;
  qword_10000D078 = a3;
  return SavageUpdaterGetTags(a1, a4);
}

__CFDictionary *SavageUpdaterGetTags(const __CFDictionary *a1, CFTypeRef *a2)
{
  v78 = 0;
  v79 = 0;
  v76 = 0;
  value = 0;
  *(_DWORD *)buffer = 0;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    CFErrorRef v55 = sub_1000032BC((uint64_t)"SavageUpdaterGetTags: Cannot allocate memory for outputDict", 3u, 0, @"SavageErrorDomain");
    CFTypeRef v28 = 0;
    uint64_t v5 = 0;
    goto LABEL_45;
  }
  if (a1)
  {
    uint64_t v5 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    if (v5)
    {
      CFDataRef v6 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
      if (v6)
      {
        uint64_t v7 = CFDictionaryGetValue(a1, @"DeviceInfo");
        if (v7)
        {
          uint64_t v8 = v7;
          CFTypeID v9 = CFGetTypeID(v7);
          if (v9 == CFDictionaryGetTypeID())
          {
            CFStringRef v10 = CFCopyDescription(v8);
            char v18 = "SavageUpdaterGetTags";
            if (v10)
            {
              CFStringRef v19 = v10;
              CFStringGetCString(v10, byte_10000C068, 4096, 0);
              sub_100005734((uint64_t)"%s [input]: DeviceInfo %s \n", v20, v21, v22, v23, v24, v25, v26, (char)"SavageUpdaterGetTags");
              CFRelease(v19);
            }
            else
            {
              sub_100005734((uint64_t)"%s [input]: DeviceInfo %s \n", v11, v12, v13, v14, v15, v16, v17, (char)"SavageUpdaterGetTags");
            }
            a1 = (const __CFDictionary *)sub_100003118(v8);
            CFTypeID v27 = CFDictionaryGetValue(a1, @"YonkersDeviceInfo");
            CFTypeRef v28 = v27;
            if (v27)
            {
              CFTypeID v29 = CFGetTypeID(v27);
              if (v29 == CFDictionaryGetTypeID())
              {
                CFTypeRef v28 = sub_100003118(v28);
                unsigned int v30 = sub_100003580((CFDictionaryRef)v28, (CFTypeRef *)&value, (CFTypeRef *)&v76);
                if (v30 || !value)
                {
                  CFStringRef v56 = @"YonkersErrorDomain";
                  int v57 = "SavageUpdaterGetTags: Unable to get kYonkersTagMeasurementPatch";
                  uint64_t v58 = (uint64_t)v28;
LABEL_52:
                  CFErrorRef v55 = sub_1000032BC((uint64_t)v57, v30, v58, v56);
                  goto LABEL_53;
                }
                CFArrayAppendValue(v5, @"SEP");
                CFArrayAppendValue(v5, @"Yonkers,BoardID");
                CFArrayAppendValue(v5, @"Yonkers,ChipID");
                CFArrayAppendValue(v5, @"Yonkers,PatchEpoch");
                CFArrayAppendValue(v5, value);
                CFArrayAppendValue(v5, v76);
                CFArrayAppendValue(v6, @"Yonkers,Ticket");
                if (v28 && CFDictionaryGetCount(a1) == 1)
                {
LABEL_28:
                  CFDictionaryAddValue(Mutable, @"BuildIdentityTags", v5);
                  CFDictionaryAddValue(Mutable, @"ResponseTags", v6);
                  CFStringRef v35 = CFCopyDescription(Mutable);
                  if (v35)
                  {
                    CFStringRef v43 = v35;
                    CFStringGetCString(v35, byte_10000C068, 4096, 0);
                    sub_100005734((uint64_t)"%s [output]: %s \n", v44, v45, v46, v47, v48, v49, v50, (char)v18);
                    CFRelease(v43);
                  }
                  else
                  {
                    sub_100005734((uint64_t)"%s [output]: %s \n", v36, v37, v38, v39, v40, v41, v42, (char)v18);
                  }
                  goto LABEL_31;
                }
              }
              else
              {
                CFTypeRef v28 = 0;
              }
            }
            unsigned int v30 = sub_1000033C8(a1, &v79, &v78);
            if (v79)
            {
              if (v78)
              {
                CFArrayAppendValue(v5, @"Savage,ChipID");
                CFArrayAppendValue(v5, @"Savage,PatchEpoch");
                CFArrayAppendValue(v5, v79);
                CFArrayAppendValue(v5, v78);
                CFDataRef v31 = (const __CFData *)CFDictionaryGetValue(a1, @"Savage,ChipID");
                if (v31)
                {
                  CFDataRef v32 = v31;
                  char v18 = (const char *)CFGetTypeID(v31);
                  CFStringRef v33 = @"Savage,Ticket";
                  BOOL v34 = v18 == (const char *)CFDataGetTypeID();
                  LOBYTE(v18) = "SavageUpdaterGetTags";
                  if (v34)
                  {
                    v80.location = 0;
                    v80.length = 4;
                    CFDataGetBytes(v32, v80, buffer);
                    *(_DWORD *)buffer = bswap32(*(unsigned int *)buffer);
                    if (*(_DWORD *)buffer > 0x5064u) {
                      CFStringRef v33 = @"Brunor,Ticket";
                    }
                  }
                }
                else
                {
                  CFStringRef v33 = @"Savage,Ticket";
                }
                CFArrayAppendValue(v6, v33);
                goto LABEL_28;
              }
              CFStringRef v56 = @"SavageErrorDomain";
              int v57 = "SavageUpdaterGetTags: Unable to get kSavageTagMeasurementPatchRepair";
            }
            else
            {
              CFStringRef v56 = @"SavageErrorDomain";
              int v57 = "SavageUpdaterGetTags: Unable to get kSavageTagMeasurementPatch";
            }
            uint64_t v58 = (uint64_t)a1;
            goto LABEL_52;
          }
        }
        int v52 = "SavageUpdaterGetTags: DeviceInfo is NULL?";
        unsigned int v53 = 17;
        uint64_t v54 = (uint64_t)a1;
      }
      else
      {
        int v52 = "SavageUpdaterGetTags: Cannot allocate memory for tagsInTssResponse";
        unsigned int v53 = 3;
        uint64_t v54 = 0;
      }
      CFErrorRef v55 = sub_1000032BC((uint64_t)v52, v53, v54, @"SavageErrorDomain");
      CFTypeRef v28 = 0;
      goto LABEL_48;
    }
    CFErrorRef v55 = sub_1000032BC((uint64_t)"SavageUpdaterGetTags: Cannot allocate memory for tagsInBI", 3u, 0, @"SavageErrorDomain");
    CFTypeRef v28 = 0;
LABEL_45:
    CFDataRef v6 = 0;
LABEL_48:
    a1 = 0;
    goto LABEL_53;
  }
  CFErrorRef v55 = sub_1000032BC((uint64_t)"SavageUpdaterGetTags: options is NULL", 2u, 0, @"SavageErrorDomain");
  CFTypeRef v28 = 0;
  uint64_t v5 = 0;
  CFDataRef v6 = 0;
LABEL_53:
  if (a2 && v55)
  {
    *a2 = sub_100003118(v55);
    CFStringRef v59 = CFErrorCopyDescription(v55);
    if (v59)
    {
      CFStringRef v67 = v59;
      CFStringGetCString(v59, byte_10000C068, 4096, 0);
      sub_100005734((uint64_t)"%s [error]: %s \n", v68, v69, v70, v71, v72, v73, v74, (char)"SavageUpdaterGetTags");
      CFRelease(v67);
    }
    else
    {
      sub_100005734((uint64_t)"%s [error]: %s \n", v60, v61, v62, v63, v64, v65, v66, (char)"SavageUpdaterGetTags");
    }
    if (Mutable)
    {
      CFRelease(Mutable);
      CFMutableDictionaryRef Mutable = 0;
    }
    goto LABEL_62;
  }
  if (v55) {
LABEL_62:
  }
    CFRelease(v55);
  if (v6) {
LABEL_31:
  }
    CFRelease(v6);
  if (v5) {
    CFRelease(v5);
  }
  if (v28) {
    CFRelease(v28);
  }
  if (a1) {
    CFRelease(a1);
  }
  if (value) {
    CFRelease(value);
  }
  return Mutable;
}

__CFData *SavageUpdaterCopyFirmwareWithLogging(const __CFDictionary *a1, uint64_t (*a2)(void, void), uint64_t a3, CFTypeRef *a4)
{
  off_10000D070 = a2;
  qword_10000D078 = a3;
  return SavageUpdaterCopyFirmware(a1, a4);
}

__CFData *SavageUpdaterCopyFirmware(const __CFDictionary *a1, CFTypeRef *a2)
{
  *(void *)bytes = 0;
  CFTypeRef v103 = 0;
  CFTypeRef cf = 0;
  CFStringRef v101 = 0;
  CFStringRef v102 = 0;
  uint64_t v99 = 0;
  CFErrorRef err = 0;
  if (!a1)
  {
    v91 = "SavageUpdaterCopyFirmware: options is NULL";
    uint64_t v92 = 0;
    goto LABEL_69;
  }
  CFBooleanRef Value = CFDictionaryGetValue(a1, @"DeviceInfo");
  if (!Value || (v4 = Value, CFTypeID v5 = CFGetTypeID(Value), v5 != CFDictionaryGetTypeID()))
  {
    v91 = "SavageUpdaterCopyFirmware: Missing device info";
    uint64_t v92 = (uint64_t)a1;
LABEL_69:
    v93 = sub_1000032BC((uint64_t)v91, 2u, v92, @"SavageErrorDomain");
    CFDataRef v32 = 0;
    CFDataRef v24 = 0;
    CFDataRef v30 = 0;
    CFDictionaryRef v22 = 0;
    CFStringRef v33 = 0;
    CFDataRef v34 = 0;
    CFDataRef v35 = 0;
    CFDictionaryRef v26 = 0;
    goto LABEL_86;
  }
  CFStringRef v6 = CFCopyDescription(v4);
  if (v6)
  {
    CFStringRef v14 = v6;
    CFStringGetCString(v6, byte_10000C068, 4096, 0);
    sub_100005734((uint64_t)"%s [input]: DeviceInfo %s \n", v15, v16, v17, v18, v19, v20, v21, (char)"SavageUpdaterCopyFirmware");
    CFRelease(v14);
  }
  else
  {
    sub_100005734((uint64_t)"%s [input]: DeviceInfo %s \n", v7, v8, v9, v10, v11, v12, v13, (char)"SavageUpdaterCopyFirmware");
  }
  CFDictionaryRef v22 = (const __CFDictionary *)sub_100003118(v4);
  CFDataRef v23 = (const __CFData *)CFDictionaryGetValue(v22, @"YonkersDeviceInfo");
  CFDataRef v24 = v23;
  if (!v23)
  {
    CFDictionaryRef v26 = 0;
    CFDataRef v30 = 0;
LABEL_22:
    CFDataRef v32 = 0;
    goto LABEL_23;
  }
  CFTypeID v25 = CFGetTypeID(v23);
  if (v25 != CFDictionaryGetTypeID())
  {
    CFDictionaryRef v26 = 0;
    CFDataRef v30 = 0;
    CFDataRef v24 = 0;
    goto LABEL_22;
  }
  CFDictionaryRef v26 = (const __CFDictionary *)sub_100003118(v24);
  unsigned int v27 = sub_100003580(v26, &cf, &v103);
  if (v27)
  {
    v93 = sub_1000032BC((uint64_t)"SavageUpdaterCopyFirmware: Didn't get yonkers patch measurement tags", v27, (uint64_t)v26, @"YonkersErrorDomain");
    CFDataRef v32 = 0;
    CFDataRef v24 = 0;
    goto LABEL_77;
  }
  CFDataRef v28 = (const __CFData *)sub_1000057DC(a1, (const __CFString *)cf, (CFTypeRef *)&err);
  CFDataRef v24 = v28;
  if (err)
  {
    CFDataRef v32 = 0;
    CFDataRef v30 = 0;
LABEL_80:
    CFStringRef v33 = 0;
    CFDataRef v34 = 0;
    goto LABEL_81;
  }
  if (!v28 || !CFDataGetLength(v28))
  {
    v93 = sub_1000032BC((uint64_t)"SavageUpdaterCopyFirmware: Empty Yonkers firmware file?", 4u, (uint64_t)a1, @"YonkersErrorDomain");
    CFDataRef v32 = 0;
LABEL_77:
    CFDataRef v30 = 0;
    goto LABEL_84;
  }
  CFDataRef v29 = (const __CFData *)sub_1000057DC(a1, (const __CFString *)v103, (CFTypeRef *)&err);
  CFDataRef v30 = v29;
  if (err)
  {
    CFDataRef v32 = 0;
    goto LABEL_80;
  }
  if (!v29 || !CFDataGetLength(v29))
  {
    v93 = sub_1000032BC((uint64_t)"SavageUpdaterCopyFirmware: Empty Yonkers alt firmware file?", 4u, (uint64_t)a1, @"YonkersErrorDomain");
    CFDataRef v32 = 0;
LABEL_84:
    CFStringRef v33 = 0;
    CFDataRef v34 = 0;
    goto LABEL_85;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDataRef v32 = Mutable;
  if (!Mutable)
  {
    v95 = "SavageUpdaterCopyFirmware: Cannot allocate memory for outputDict";
    unsigned int v94 = 3;
    uint64_t v96 = (uint64_t)a1;
LABEL_83:
    v93 = sub_1000032BC((uint64_t)v95, v94, v96, @"SavageErrorDomain");
    goto LABEL_84;
  }
  CFDictionaryAddValue(Mutable, @"YonkersFirmware", v24);
  CFDictionaryAddValue(v32, @"YonkersFirmwareAlt", v30);
  if (!v26 || CFDictionaryGetCount(v22) != 1)
  {
LABEL_23:
    unsigned int v36 = sub_1000033C8(v22, &v102, &v101);
    if (!v36)
    {
      CFDataRef v37 = (const __CFData *)sub_1000057DC(a1, v102, (CFTypeRef *)&err);
      CFDataRef v34 = v37;
      if (!err)
      {
        if (v37 && CFDataGetLength(v37))
        {
          CFDataRef v35 = (const __CFData *)sub_1000057DC(a1, v101, (CFTypeRef *)&err);
          if (err && CFErrorGetCode(err) == 19)
          {
            CFStringRef v33 = 0;
            goto LABEL_40;
          }
          CFStringRef v33 = CFDataCreateMutable(0, 0);
          if (v33)
          {
            *(_DWORD *)&bytes[4] = CFDataGetLength(v34);
            CFDataAppendBytes(v33, bytes, 16);
            BytePtr = CFDataGetBytePtr(v34);
            CFIndex Length = CFDataGetLength(v34);
            CFDataAppendBytes(v33, BytePtr, Length);
            if (v35)
            {
              LODWORD(v99) = CFDataGetLength(v35);
              v105.location = 0;
              v105.length = 16;
              CFDataReplaceBytes(v33, v105, bytes, 16);
              uint64_t v40 = CFDataGetBytePtr(v35);
              CFIndex v41 = CFDataGetLength(v35);
              CFDataAppendBytes(v33, v40, v41);
            }
            if (v32)
            {
              CFDictionaryAddValue(v32, @"SavageFirmware", v33);
              CFRelease(v33);
              CFStringRef v33 = 0;
            }
            goto LABEL_34;
          }
          v93 = sub_1000032BC((uint64_t)"SavageUpdaterCopyFirmware: Cannot allocate memory for savageFirmwareData", 3u, (uint64_t)a1, @"SavageErrorDomain");
LABEL_86:
          CFErrorRef err = v93;
          goto LABEL_40;
        }
        v93 = sub_1000032BC((uint64_t)"SavageUpdaterCopyFirmware: Empty Savage firmware file", 4u, (uint64_t)a1, @"SavageErrorDomain");
        CFStringRef v33 = 0;
LABEL_85:
        CFDataRef v35 = 0;
        goto LABEL_86;
      }
      CFStringRef v33 = 0;
LABEL_81:
      CFDataRef v35 = 0;
      goto LABEL_40;
    }
    unsigned int v94 = v36;
    v95 = "SavageUpdaterCopyFirmware: Unable to get savage patch measurement tags";
    uint64_t v96 = (uint64_t)v22;
    goto LABEL_83;
  }
  CFStringRef v33 = 0;
  CFDataRef v34 = 0;
  CFDataRef v35 = 0;
LABEL_34:
  CFStringRef v42 = CFCopyDescription(v32);
  if (v42)
  {
    CFStringRef v50 = v42;
    CFStringGetCString(v42, byte_10000C068, 4096, 0);
    sub_100005734((uint64_t)"%s [output]: %s \n", v51, v52, v53, v54, v55, v56, v57, (char)"SavageUpdaterCopyFirmware");
    CFRelease(v50);
  }
  else
  {
    sub_100005734((uint64_t)"%s [output]: %s \n", v43, v44, v45, v46, v47, v48, v49, (char)"SavageUpdaterCopyFirmware");
  }
  CFStringRef v58 = CFCopyDescription(v33);
  if (v58)
  {
    CFStringRef v66 = v58;
    CFStringGetCString(v58, byte_10000C068, 4096, 0);
    sub_100005734((uint64_t)"%s [output]: %s \n", v67, v68, v69, v70, v71, v72, v73, (char)"SavageUpdaterCopyFirmware");
    CFRelease(v66);
  }
  else
  {
    sub_100005734((uint64_t)"%s [output]: %s \n", v59, v60, v61, v62, v63, v64, v65, (char)"SavageUpdaterCopyFirmware");
  }
LABEL_40:
  if (a2 && err)
  {
    *a2 = sub_100003118(err);
    CFStringRef v74 = CFErrorCopyDescription(err);
    if (v74)
    {
      CFStringRef v82 = v74;
      CFStringGetCString(v74, byte_10000C068, 4096, 0);
      sub_100005734((uint64_t)"%s [error]: %s \n", v83, v84, v85, v86, v87, v88, v89, (char)"SavageUpdaterCopyFirmware");
      CFRelease(v82);
    }
    else
    {
      sub_100005734((uint64_t)"%s [error]: %s \n", v75, v76, v77, v78, v79, v80, v81, (char)"SavageUpdaterCopyFirmware");
    }
  }
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v103)
  {
    CFRelease(v103);
    CFTypeRef v103 = 0;
  }
  if (err)
  {
    CFRelease(err);
    CFErrorRef err = 0;
  }
  if (v26) {
    CFRelease(v26);
  }
  if (v22) {
    CFRelease(v22);
  }
  if (v34) {
    CFRelease(v34);
  }
  if (v35) {
    CFRelease(v35);
  }
  if (v24) {
    CFRelease(v24);
  }
  if (v30) {
    CFRelease(v30);
  }
  if (v32) {
    return v32;
  }
  else {
    return v33;
  }
}

CFAllocatorRef SavageUpdaterCreateRequestWithLogging(const __CFDictionary *a1, uint64_t (*a2)(void, void), uint64_t a3, CFTypeRef *a4)
{
  off_10000D070 = a2;
  qword_10000D078 = a3;
  return SavageUpdaterCreateRequest(a1, a4);
}

CFAllocatorRef SavageUpdaterCreateRequest(const __CFDictionary *a1, CFTypeRef *a2)
{
  CFTypeRef v272 = 0;
  CFTypeRef cf = 0;
  CFAllocatorRef allocator = 0;
  if (a1)
  {
    if (CFDictionaryContainsKey(a1, @"BuildIdentity"))
    {
      CFBooleanRef Value = CFDictionaryGetValue(a1, @"BuildIdentity");
      CFTypeRef v5 = sub_100003118(Value);
      CFStringRef v6 = CFCopyDescription(v5);
      if (v6)
      {
        CFStringRef v14 = v6;
        CFStringGetCString(v6, byte_10000C068, 4096, 0);
        sub_100005734((uint64_t)"%s [input]: BuildIdentity %s \n", v15, v16, v17, v18, v19, v20, v21, (char)"SavageUpdaterCreateRequest");
        CFRelease(v14);
        if (v5) {
          goto LABEL_5;
        }
      }
      else
      {
        sub_100005734((uint64_t)"%s [input]: BuildIdentity %s \n", v7, v8, v9, v10, v11, v12, v13, (char)"SavageUpdaterCreateRequest");
        if (v5)
        {
LABEL_5:
          if (CFDictionaryContainsKey(a1, @"DeviceInfo"))
          {
            CFDictionaryRef v22 = CFDictionaryGetValue(a1, @"DeviceInfo");
            CFTypeRef v23 = sub_100003118(v22);
            CFStringRef v24 = CFCopyDescription(v23);
            if (v24)
            {
              CFStringRef v32 = v24;
              CFStringGetCString(v24, byte_10000C068, 4096, 0);
              sub_100005734((uint64_t)"%s [input]: DeviceInfo %s \n", v33, v34, v35, v36, v37, v38, v39, (char)"SavageUpdaterCreateRequest");
              CFRelease(v32);
              if (v23)
              {
LABEL_8:
                if (!CFDictionaryContainsKey(a1, @"FirmwareData")) {
                  goto LABEL_34;
                }
                uint64_t v40 = CFDictionaryGetValue(a1, @"FirmwareData");
                CFStringRef v41 = CFCopyDescription(v40);
                if (v41)
                {
                  CFStringRef v49 = v41;
                  CFStringGetCString(v41, byte_10000C068, 4096, 0);
                  sub_100005734((uint64_t)"%s [input]: FirmwareData %s \n", v50, v51, v52, v53, v54, v55, v56, (char)"SavageUpdaterCreateRequest");
                  CFRelease(v49);
                  if (v40)
                  {
LABEL_11:
                    CFTypeID v57 = CFGetTypeID(v40);
                    if (v57 == CFDictionaryGetTypeID())
                    {
                      CFStringRef v58 = CFDictionaryGetValue((CFDictionaryRef)v40, @"SavageFirmware");
                      CFDataRef v59 = (const __CFData *)sub_100003118(v58);
                      if (v59)
                      {
                        CFDataRef v60 = v59;
                        unsigned int v61 = sub_100005D70(v59, &cf);
                        CFRelease(v60);
                        if (v61)
                        {
                          CFStringRef v65 = @"SavageErrorDomain";
                          CFStringRef v66 = "SavageUpdaterCreateRequest: CreateMeasurementDict fails for Savage.";
                          goto LABEL_233;
                        }
                      }
                      uint64_t v62 = CFDictionaryGetValue((CFDictionaryRef)v40, @"YonkersFirmware");
                      CFDataRef v63 = (const __CFData *)sub_100003118(v62);
                      if (v63)
                      {
                        CFDataRef v64 = v63;
                        unsigned int v61 = sub_1000028D4(v63, &v272);
                        CFRelease(v64);
                        if (v61)
                        {
                          CFStringRef v65 = @"YonkersErrorDomain";
                          CFStringRef v66 = "SavageUpdaterCreateRequest: CreateMeasurementDict fails for Yonkers.";
LABEL_233:
                          unsigned int v129 = v61;
                          uint64_t v130 = (uint64_t)v40;
                          goto LABEL_48;
                        }
                      }
                    }
                    else
                    {
                      CFTypeID v71 = CFGetTypeID(v40);
                      if (v71 == CFDataGetTypeID())
                      {
                        CFDataRef v72 = (const __CFData *)sub_100003118(v40);
                        unsigned int v61 = sub_100005D70(v72, &cf);
                        if (v72) {
                          CFRelease(v72);
                        }
                        if (v61)
                        {
                          CFStringRef v65 = @"SavageErrorDomain";
                          CFStringRef v66 = "SavageUpdaterCreateRequest: CreateMeasurementDict fails for Savage (Old way).";
                          goto LABEL_233;
                        }
                      }
                    }
                    CFStringRef v73 = CFCopyDescription(cf);
                    if (v73)
                    {
                      CFStringRef v81 = v73;
                      CFStringGetCString(v73, byte_10000C068, 4096, 0);
                      sub_100005734((uint64_t)"%s [input]: SavageMeasurementDict - %s \n", v82, v83, v84, v85, v86, v87, v88, (char)"SavageUpdaterCreateRequest");
                      CFRelease(v81);
                    }
                    else
                    {
                      sub_100005734((uint64_t)"%s [input]: SavageMeasurementDict - %s \n", v74, v75, v76, v77, v78, v79, v80, (char)"SavageUpdaterCreateRequest");
                    }
                    CFStringRef v89 = CFCopyDescription(v272);
                    if (v89)
                    {
                      CFStringRef v97 = v89;
                      CFStringGetCString(v89, byte_10000C068, 4096, 0);
                      sub_100005734((uint64_t)"%s [input]: YonkersMeasurementDict - %s \n", v98, v99, v100, v101, v102, v103, v104, (char)"SavageUpdaterCreateRequest");
                      CFRelease(v97);
                    }
                    else
                    {
                      sub_100005734((uint64_t)"%s [input]: YonkersMeasurementDict - %s \n", v90, v91, v92, v93, v94, v95, v96, (char)"SavageUpdaterCreateRequest");
                    }
LABEL_34:
                    if (!CFDictionaryContainsKey(a1, @"ReceiptManifest")) {
                      goto LABEL_47;
                    }
                    CFRange v105 = CFDictionaryGetValue(a1, @"ReceiptManifest");
                    uint64_t v40 = sub_100003118(v105);
                    CFDictionaryRef v106 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v40, @"SEP");
                    if (v106)
                    {
                      CFDictionaryRef v107 = v106;
                      CFTypeID v108 = CFGetTypeID(v106);
                      if (v108 == CFDictionaryGetTypeID())
                      {
                        v109 = CFDictionaryGetValue(v107, @"Digest");
                        CFStringRef v110 = CFCopyDescription(v109);
                        if (v110)
                        {
                          CFStringRef v118 = v110;
                          CFStringGetCString(v110, byte_10000C068, 4096, 0);
                          sub_100005734((uint64_t)"%s [input]: SEP Digest from ReceiptManifest - %s \n", v119, v120, v121, v122, v123, v124, v125, (char)"SavageUpdaterCreateRequest");
                          CFRelease(v118);
                        }
                        else
                        {
                          sub_100005734((uint64_t)"%s [input]: SEP Digest from ReceiptManifest - %s \n", v111, v112, v113, v114, v115, v116, v117, (char)"SavageUpdaterCreateRequest");
                        }
                      }
                    }
                    if (!v40)
                    {
LABEL_47:
                      CFStringRef v65 = @"SavageErrorDomain";
                      CFStringRef v66 = "SavageUpdaterCreateRequest: ReceiptManifest is missing in input options";
                      unsigned int v129 = 6;
                      uint64_t v130 = (uint64_t)a1;
LABEL_48:
                      CFErrorRef v69 = sub_1000032BC((uint64_t)v66, v129, v130, v65);
                      uint64_t v40 = 0;
                      goto LABEL_49;
                    }
                    if (CFDictionaryContainsKey((CFDictionaryRef)v23, @"YonkersDeviceInfo"))
                    {
                      v126 = CFDictionaryGetValue((CFDictionaryRef)v23, @"YonkersDeviceInfo");
                      CFDictionaryRef v70 = (const __CFDictionary *)sub_100003118(v126);
                      unsigned int v127 = sub_100002AA8(v70, (const __CFDictionary *)v5, (CFDictionaryRef)v272, (uint64_t)v40, (CFTypeRef *)&allocator);
                      if (v127 || !allocator)
                      {
                        CFErrorRef v69 = sub_1000032BC((uint64_t)"SavageUpdaterCreateRequest: CreateYonkersRequestDictForTATSU fails.", v127, (uint64_t)a1, @"YonkersErrorDomain");
                        goto LABEL_50;
                      }
                      if (v70 && CFDictionaryGetCount((CFDictionaryRef)v23) == 1)
                      {
                        CFAllocatorRef v128 = allocator;
                        goto LABEL_204;
                      }
                      v267 = a2;
                    }
                    else
                    {
                      v267 = a2;
                      CFDictionaryRef v70 = 0;
                    }
                    CFDictionaryRef v147 = (const __CFDictionary *)cf;
                    *(_DWORD *)buffer = 0;
                    uint64_t v274 = 0;
                    key = 0;
                    CFMutableDataRef Mutable = CFDataCreateMutable(0, 0);
                    CFMutableDictionaryRef v149 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                    if (!v147)
                    {
                      v150 = 0;
                      unsigned int v190 = 2;
                      goto LABEL_196;
                    }
                    if (allocator)
                    {
                      v150 = (__CFDictionary *)sub_100003118(allocator);
                    }
                    else
                    {
                      v150 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                      if (!v150)
                      {
                        unsigned int v190 = 3;
                        goto LABEL_196;
                      }
                    }
                    CFStringRef v151 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v5, @"Savage,ChipID");
                    if (!v151)
                    {
                      unsigned int v190 = 17;
                      goto LABEL_196;
                    }
                    CFStringRef v152 = v151;
                    theDict = v149;
                    CFTypeID v153 = CFGetTypeID(v151);
                    if (v153 != CFStringGetTypeID())
                    {
LABEL_222:
                      unsigned int v190 = 17;
                      goto LABEL_195;
                    }
                    if (!sub_100003224(v152, buffer, 0)) {
                      goto LABEL_223;
                    }
                    sub_100003124(v150, @"Savage,ChipID", *(int *)buffer);
                    CFStringRef v154 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v5, @"Savage,PatchEpoch");
                    if (!v154) {
                      goto LABEL_222;
                    }
                    CFStringRef v155 = v154;
                    CFTypeID v156 = CFGetTypeID(v154);
                    if (v156 != CFStringGetTypeID()) {
                      goto LABEL_222;
                    }
                    if (!sub_100003224(v155, buffer, 0))
                    {
LABEL_223:
                      unsigned int v190 = 11;
                      goto LABEL_195;
                    }
                    sub_100003124(v150, @"Savage,PatchEpoch", *(int *)buffer);
                    CFDataRef v157 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)v23, @"Savage,ChipID");
                    if (v157 && (CFDataRef v158 = v157, v159 = CFGetTypeID(v157), v159 == CFDataGetTypeID()))
                    {
                      v277.location = 0;
                      v277.length = 4;
                      CFDataGetBytes(v158, v277, buffer);
                      *(_DWORD *)buffer = bswap32(*(unsigned int *)buffer);
                      CFBooleanRef v160 = kCFBooleanTrue;
                      if (*(_DWORD *)buffer >= 0x5065u)
                      {
                        CFDictionaryAddValue(v150, @"@Brunor,Ticket", kCFBooleanTrue);
                        CFStringRef v161 = @"Brunor,FdrRootCaDigest";
                        v162 = v150;
                        CFMutableDataRef v163 = Mutable;
                        goto LABEL_78;
                      }
                    }
                    else
                    {
                      CFBooleanRef v160 = kCFBooleanTrue;
                    }
                    CFStringRef v161 = @"@Savage,Ticket";
                    v162 = v150;
                    CFMutableDataRef v163 = v160;
LABEL_78:
                    CFDictionaryAddValue(v162, v161, v163);
                    CFBooleanRef v164 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v23, @"Savage,ProductionMode");
                    if (v164)
                    {
                      CFBooleanRef v165 = v164;
                      v269 = Mutable;
                      CFTypeID v166 = CFGetTypeID(v164);
                      if (v166 != CFBooleanGetTypeID()) {
                        goto LABEL_221;
                      }
                      CFBooleanRef v167 = CFBooleanGetValue(v165) ? v160 : kCFBooleanFalse;
                      CFDictionaryAddValue(v150, @"Savage,ProductionMode", v167);
                      v168 = CFDictionaryGetValue((CFDictionaryRef)v23, @"Savage,UID");
                      if (!v168
                        || (v169 = v168, CFTypeID v170 = CFGetTypeID(v168), v170 != CFDataGetTypeID())
                        || (CFDictionaryAddValue(v150, @"Savage,UID", v169),
                            (v171 = CFDictionaryGetValue((CFDictionaryRef)v23, @"Savage,Nonce")) == 0)
                        || (v172 = v171, CFTypeID v173 = CFGetTypeID(v171), v173 != CFDataGetTypeID()))
                      {
LABEL_221:
                        unsigned int v190 = 17;
LABEL_194:
                        CFMutableDataRef Mutable = v269;
LABEL_195:
                        CFMutableDictionaryRef v149 = theDict;
                        goto LABEL_196;
                      }
                      CFDictionaryRef v268 = v70;
                      CFDictionaryAddValue(v150, @"Savage,Nonce", v172);
                      unsigned int v174 = sub_1000033C8((CFDictionaryRef)v23, &key, &v274);
                      unsigned int v175 = v174;
                      if (key && v274)
                      {
                        v176 = CFDictionaryGetValue(v147, @"MeasurementDictPatch");
                        if (v176)
                        {
                          v177 = v176;
                          CFTypeID v178 = CFGetTypeID(v176);
                          if (v178 == CFDictionaryGetTypeID())
                          {
                            CFDictionaryAddValue(v150, key, v177);
                            CFDictionaryRef v179 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v40, @"SEP");
                            if (v179)
                            {
                              CFDictionaryRef v180 = v179;
                              CFTypeID v181 = CFGetTypeID(v179);
                              if (v181 == CFDictionaryGetTypeID())
                              {
                                v182 = CFDictionaryGetValue(v180, @"Digest");
                                if (v182)
                                {
                                  v183 = v182;
                                  CFTypeID v184 = CFGetTypeID(v182);
                                  if (v184 == CFDataGetTypeID())
                                  {
                                    CFDictionarySetValue(theDict, @"Digest", v183);
                                    CFDictionaryAddValue(v150, @"SEP", theDict);
                                  }
                                }
                              }
                            }
                            CFBooleanRef v185 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v23, @"Brunor,HarvestWrap");
                            if (v185)
                            {
                              CFBooleanRef v186 = v185;
                              CFTypeID v187 = CFGetTypeID(v185);
                              if (v187 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v186)) {
                                  CFBooleanRef v188 = v160;
                                }
                                else {
                                  CFBooleanRef v188 = kCFBooleanFalse;
                                }
                                CFDictionaryAddValue(v150, @"Brunor,HarvestWrap", v188);
                              }
                            }
                            CFBooleanRef v189 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v23, @"Brunor,HarvestUnwrap");
                            unsigned int v190 = v175;
                            if (v189)
                            {
                              CFBooleanRef v191 = v189;
                              CFTypeID v192 = CFGetTypeID(v189);
                              if (v192 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v191)) {
                                  CFBooleanRef v193 = v160;
                                }
                                else {
                                  CFBooleanRef v193 = kCFBooleanFalse;
                                }
                                CFDictionaryAddValue(v150, @"Brunor,HarvestUnwrap", v193);
                              }
                            }
                            CFBooleanRef v194 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v23, @"Brunor,Authenticate");
                            CFDictionaryRef v70 = v268;
                            if (v194)
                            {
                              CFBooleanRef v195 = v194;
                              CFTypeID v196 = CFGetTypeID(v194);
                              if (v196 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v195)) {
                                  CFBooleanRef v197 = v160;
                                }
                                else {
                                  CFBooleanRef v197 = kCFBooleanFalse;
                                }
                                CFDictionaryAddValue(v150, @"Brunor,Authenticate", v197);
                              }
                            }
                            CFBooleanRef v198 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v23, @"Savage,ReadECKey");
                            if (v198)
                            {
                              CFBooleanRef v199 = v198;
                              CFTypeID v200 = CFGetTypeID(v198);
                              if (v200 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v199)) {
                                  CFBooleanRef v201 = v160;
                                }
                                else {
                                  CFBooleanRef v201 = kCFBooleanFalse;
                                }
                                CFDictionaryAddValue(v150, @"Savage,ReadECKey", v201);
                              }
                            }
                            CFBooleanRef v202 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v23, @"Savage,WriteECKey");
                            if (v202)
                            {
                              CFBooleanRef v203 = v202;
                              CFTypeID v204 = CFGetTypeID(v202);
                              if (v204 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v203)) {
                                  CFBooleanRef v205 = v160;
                                }
                                else {
                                  CFBooleanRef v205 = kCFBooleanFalse;
                                }
                                CFDictionaryAddValue(v150, @"Savage,WriteECKey", v205);
                              }
                            }
                            CFBooleanRef v206 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v23, @"Savage,WriteUID");
                            if (v206)
                            {
                              CFBooleanRef v207 = v206;
                              CFTypeID v208 = CFGetTypeID(v206);
                              if (v208 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v207)) {
                                  CFBooleanRef v209 = v160;
                                }
                                else {
                                  CFBooleanRef v209 = kCFBooleanFalse;
                                }
                                CFDictionaryAddValue(v150, @"Savage,WriteUID", v209);
                              }
                            }
                            CFBooleanRef v210 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v23, @"Savage,WriteEpoch");
                            if (v210)
                            {
                              CFBooleanRef v211 = v210;
                              CFTypeID v212 = CFGetTypeID(v210);
                              if (v212 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v211)) {
                                  CFBooleanRef v213 = v160;
                                }
                                else {
                                  CFBooleanRef v213 = kCFBooleanFalse;
                                }
                                CFDictionaryAddValue(v150, @"Savage,WriteEpoch", v213);
                              }
                            }
                            CFBooleanRef v214 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v23, @"Savage,ReadGID");
                            if (v214)
                            {
                              CFBooleanRef v215 = v214;
                              CFTypeID v216 = CFGetTypeID(v214);
                              if (v216 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v215)) {
                                  CFBooleanRef v217 = v160;
                                }
                                else {
                                  CFBooleanRef v217 = kCFBooleanFalse;
                                }
                                CFDictionaryAddValue(v150, @"Savage,ReadGID", v217);
                              }
                            }
                            CFBooleanRef v218 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v23, @"Savage,ReadFWKey");
                            if (v218)
                            {
                              CFBooleanRef v219 = v218;
                              CFTypeID v220 = CFGetTypeID(v218);
                              if (v220 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v219)) {
                                  CFBooleanRef v221 = v160;
                                }
                                else {
                                  CFBooleanRef v221 = kCFBooleanFalse;
                                }
                                CFDictionaryAddValue(v150, @"Savage,ReadFWKey", v221);
                              }
                            }
                            CFBooleanRef v222 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v23, @"Savage,AllowOfflineBoot");
                            if (v222)
                            {
                              CFBooleanRef v223 = v222;
                              CFTypeID v224 = CFGetTypeID(v222);
                              if (v224 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v223)) {
                                  CFBooleanRef v225 = v160;
                                }
                                else {
                                  CFBooleanRef v225 = kCFBooleanFalse;
                                }
                                CFDictionaryAddValue(v150, @"Savage,AllowOfflineBoot", v225);
                              }
                            }
                            CFBooleanRef v226 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v23, @"Savage,TempDemote");
                            if (v226)
                            {
                              CFBooleanRef v227 = v226;
                              CFTypeID v228 = CFGetTypeID(v226);
                              if (v228 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v227)) {
                                  CFBooleanRef v229 = v160;
                                }
                                else {
                                  CFBooleanRef v229 = kCFBooleanFalse;
                                }
                                CFDictionaryAddValue(v150, @"Savage,TempDemote", v229);
                              }
                            }
                            CFBooleanRef v230 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v23, @"Savage,AccessSensor");
                            if (v230)
                            {
                              CFBooleanRef v231 = v230;
                              CFTypeID v232 = CFGetTypeID(v230);
                              if (v232 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v231)) {
                                  CFBooleanRef v233 = v160;
                                }
                                else {
                                  CFBooleanRef v233 = kCFBooleanFalse;
                                }
                                CFDictionaryAddValue(v150, @"Savage,AccessSensor", v233);
                              }
                            }
                            CFBooleanRef v234 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v23, @"Savage,AccessSecurity");
                            if (v234)
                            {
                              CFBooleanRef v235 = v234;
                              CFTypeID v236 = CFGetTypeID(v234);
                              if (v236 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v235)) {
                                  CFBooleanRef v237 = v160;
                                }
                                else {
                                  CFBooleanRef v237 = kCFBooleanFalse;
                                }
                                CFDictionaryAddValue(v150, @"Savage,AccessSecurity", v237);
                              }
                            }
                            CFBooleanRef v238 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v23, @"Savage,FADemote");
                            if (v238)
                            {
                              CFBooleanRef v239 = v238;
                              CFTypeID v240 = CFGetTypeID(v238);
                              if (v240 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v239)) {
                                  CFBooleanRef v241 = v160;
                                }
                                else {
                                  CFBooleanRef v241 = kCFBooleanFalse;
                                }
                                CFDictionaryAddValue(v150, @"Savage,FADemote", v241);
                              }
                            }
                            CFBooleanRef v242 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v23, @"Savage,DebugStatus");
                            if (v242)
                            {
                              CFBooleanRef v243 = v242;
                              CFTypeID v244 = CFGetTypeID(v242);
                              if (v244 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v243)) {
                                  CFBooleanRef v245 = v160;
                                }
                                else {
                                  CFBooleanRef v245 = kCFBooleanFalse;
                                }
                                CFDictionaryAddValue(v150, @"Savage,DebugStatus", v245);
                              }
                            }
                            CFBooleanRef v246 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v23, @"Savage,Provisioning");
                            if (v246)
                            {
                              CFBooleanRef v247 = v246;
                              CFTypeID v248 = CFGetTypeID(v246);
                              if (v248 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v247)) {
                                  CFBooleanRef v249 = v160;
                                }
                                else {
                                  CFBooleanRef v249 = kCFBooleanFalse;
                                }
                                CFDictionaryAddValue(v150, @"Savage,Provisioning", v249);
                              }
                            }
                            if (!allocator) {
                              CFAllocatorRef allocator = (CFAllocatorRef)sub_100003118(v150);
                            }
                            goto LABEL_194;
                          }
                        }
                        unsigned int v190 = 17;
                        CFMutableDataRef Mutable = v269;
                        CFMutableDictionaryRef v149 = theDict;
                      }
                      else
                      {
                        CFMutableDataRef Mutable = v269;
                        CFMutableDictionaryRef v149 = theDict;
                        unsigned int v190 = v174;
                      }
                      CFDictionaryRef v70 = v268;
LABEL_196:
                      if (Mutable) {
                        CFRelease(Mutable);
                      }
                      if (v149) {
                        CFRelease(v149);
                      }
                      if (v150) {
                        CFRelease(v150);
                      }
                      if (v190 || (CFAllocatorRef v128 = allocator) == 0)
                      {
                        CFErrorRef v69 = sub_1000032BC((uint64_t)"SavageUpdaterCreateRequest: CreateRequestDictForTATSU fails.", v190, (uint64_t)a1, @"SavageErrorDomain");
                        a2 = v267;
                        goto LABEL_50;
                      }
LABEL_204:
                      CFStringRef v250 = CFCopyDescription(v128);
                      if (v250)
                      {
                        CFStringRef v258 = v250;
                        CFStringGetCString(v250, byte_10000C068, 4096, 0);
                        sub_100005734((uint64_t)"%s [output]: %s \n", v259, v260, v261, v262, v263, v264, v265, (char)"SavageUpdaterCreateRequest");
                        CFRelease(v258);
                      }
                      else
                      {
                        sub_100005734((uint64_t)"%s [output]: %s \n", v251, v252, v253, v254, v255, v256, v257, (char)"SavageUpdaterCreateRequest");
                      }
                      goto LABEL_207;
                    }
                    goto LABEL_222;
                  }
                }
                else
                {
                  sub_100005734((uint64_t)"%s [input]: FirmwareData %s \n", v42, v43, v44, v45, v46, v47, v48, (char)"SavageUpdaterCreateRequest");
                  if (v40) {
                    goto LABEL_11;
                  }
                }
                CFErrorRef v69 = sub_1000032BC((uint64_t)"SavageUpdaterCreateRequest: kSavageOptionFirmwareData is NULL in input options", 2u, (uint64_t)a1, @"SavageErrorDomain");
LABEL_49:
                CFDictionaryRef v70 = 0;
                goto LABEL_50;
              }
            }
            else
            {
              sub_100005734((uint64_t)"%s [input]: DeviceInfo %s \n", v25, v26, v27, v28, v29, v30, v31, (char)"SavageUpdaterCreateRequest");
              if (v23) {
                goto LABEL_8;
              }
            }
          }
          CFErrorRef v69 = sub_1000032BC((uint64_t)"SavageUpdaterCreateRequest: Cannot get DeviceInfo", 2u, (uint64_t)a1, @"SavageErrorDomain");
          uint64_t v40 = 0;
          CFTypeRef v23 = 0;
          goto LABEL_49;
        }
      }
    }
    uint64_t v67 = "SavageUpdaterCreateRequest: BuildIdentity is NULL in input options";
    uint64_t v68 = (uint64_t)a1;
  }
  else
  {
    uint64_t v67 = "SavageUpdaterCreateRequest: options is NULL";
    uint64_t v68 = 0;
  }
  CFErrorRef v69 = sub_1000032BC((uint64_t)v67, 2u, v68, @"SavageErrorDomain");
  uint64_t v40 = 0;
  CFTypeRef v23 = 0;
  CFDictionaryRef v70 = 0;
  CFTypeRef v5 = 0;
LABEL_50:
  if (a2 && v69)
  {
    *a2 = sub_100003118(v69);
    CFStringRef v131 = CFErrorCopyDescription(v69);
    if (v131)
    {
      CFStringRef v139 = v131;
      CFStringGetCString(v131, byte_10000C068, 4096, 0);
      sub_100005734((uint64_t)"%s [error]: %s \n", v140, v141, v142, v143, v144, v145, v146, (char)"SavageUpdaterCreateRequest");
      CFRelease(v139);
    }
    else
    {
      sub_100005734((uint64_t)"%s [error]: %s \n", v132, v133, v134, v135, v136, v137, v138, (char)"SavageUpdaterCreateRequest");
    }
  }
  else if (!v69)
  {
    if (!v40) {
      goto LABEL_208;
    }
LABEL_207:
    CFRelease(v40);
    goto LABEL_208;
  }
  CFRelease(v69);
  if (v40) {
    goto LABEL_207;
  }
LABEL_208:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v272)
  {
    CFRelease(v272);
    CFTypeRef v272 = 0;
  }
  if (v5) {
    CFRelease(v5);
  }
  if (v23) {
    CFRelease(v23);
  }
  if (v70) {
    CFRelease(v70);
  }
  return allocator;
}

const char *sub_100005734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result = (const char *)__chkstk_darwin();
  if (off_10000D070)
  {
    vsnprintf(__str, 0x1000uLL, result, &a9);
    return (const char *)off_10000D070(qword_10000D078, __str);
  }
  return result;
}

CFTypeRef sub_1000057DC(const void *a1, const __CFString *a2, CFTypeRef *a3)
{
  CFTypeRef cf = 0;
  CFStringRef v6 = CFCopyDescription(a1);
  if (v6)
  {
    CFStringRef v7 = v6;
    CFIndex Length = CFStringGetLength(v6);
    CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
    uint64_t v10 = (char *)malloc(MaximumSizeForEncoding + 1);
    CFStringGetCString(v7, v10, MaximumSizeForEncoding, 0x8000100u);
    sub_100005734((uint64_t)"%s [input]: Input Options - %s \n", v11, v12, v13, v14, v15, v16, v17, (char)"CreateFileData");
    CFRelease(v7);
    if (v10) {
      free(v10);
    }
  }
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)a1, @"BundleDataDict");
  if (Value)
  {
    CFDictionaryRef v26 = Value;
    sub_100005734((uint64_t)"%s: Device side restoreInfo path \n", v19, v20, v21, v22, v23, v24, v25, (char)"CreateFileData");
    uint64_t v27 = CFDictionaryGetValue(v26, a2);
    CFTypeRef cf = sub_100003118(v27);
    if (cf)
    {
      CFDictionaryRef v28 = 0;
      CFDictionaryRef v29 = 0;
      CFDictionaryRef v30 = 0;
      CFTypeRef v31 = 0;
      CFTypeRef v32 = 0;
      CFStringRef v42 = CFCopyDescription(cf);
      if (!v42)
      {
        sub_100005734((uint64_t)"%s [output]: %s \n", v43, v44, v45, v46, v47, v48, v49, (char)"CreateFileData");
        goto LABEL_17;
      }
      CFStringRef v50 = v42;
      CFStringGetCString(v42, byte_10000C068, 4096, 0);
      sub_100005734((uint64_t)"%s [output]: %s \n", v51, v52, v53, v54, v55, v56, v57, (char)"CreateFileData");
      CFErrorRef v58 = (CFErrorRef)v50;
      goto LABEL_16;
    }
    CFErrorRef v60 = sub_1000032BC((uint64_t)"CreateFileData: bundleDataDict missing expected tag", 0x13u, (uint64_t)a1, @"SavageErrorDomain");
    CFDictionaryRef v28 = 0;
    goto LABEL_30;
  }
  sub_100005734((uint64_t)"%s: Host side restoreInfo path \n", v19, v20, v21, v22, v23, v24, v25, (char)"CreateFileData");
  uint64_t v33 = CFDictionaryGetValue((CFDictionaryRef)a1, @"BuildIdentity");
  CFDictionaryRef v34 = (const __CFDictionary *)sub_100003118(v33);
  CFDictionaryRef v28 = v34;
  if (!v34)
  {
    CFErrorRef v60 = sub_1000032BC((uint64_t)"CreateFileData: Missing kSavageOptionBuildIdentity", 0xAu, (uint64_t)a1, @"SavageErrorDomain");
LABEL_30:
    CFDictionaryRef v29 = 0;
    CFDictionaryRef v30 = 0;
LABEL_33:
    CFTypeRef v31 = 0;
    CFTypeRef v32 = 0;
    goto LABEL_37;
  }
  uint64_t v35 = CFDictionaryGetValue(v34, a2);
  CFDictionaryRef v36 = (const __CFDictionary *)sub_100003118(v35);
  CFDictionaryRef v30 = v36;
  if (!v36)
  {
    CStringPtr = CFStringGetCStringPtr(a2, 0x600u);
    CFErrorRef v60 = sub_1000032BC((uint64_t)CStringPtr, 0xAu, (uint64_t)a1, @"SavageErrorDomain");
    CFDictionaryRef v29 = 0;
    goto LABEL_33;
  }
  uint64_t v37 = CFDictionaryGetValue(v36, @"Info");
  CFDictionaryRef v38 = (const __CFDictionary *)sub_100003118(v37);
  CFDictionaryRef v29 = v38;
  if (!v38)
  {
    CFErrorRef v60 = sub_1000032BC((uint64_t)"CreateFileData: Missing kSavageBuildIdentityInfoKey", 0xCu, (uint64_t)a1, @"SavageErrorDomain");
    goto LABEL_33;
  }
  uint64_t v39 = CFDictionaryGetValue(v38, @"Path");
  CFTypeRef v32 = sub_100003118(v39);
  if (v32)
  {
    uint64_t v40 = CFDictionaryGetValue((CFDictionaryRef)a1, @"BundlePath");
    CFTypeRef v31 = sub_100003118(v40);
    if (v31)
    {
      unsigned int v41 = AMSupportPlatformCopyURLWithAppendedComponent();
      uint64_t v62 = "CreateFileData: Fail to run AMSupportPlatformCopyURLWithAppendedComponent with srcBundleURL";
    }
    else
    {
      uint64_t v62 = "CreateFileData: Missing kSavageOptionSourceBundlePath";
      unsigned int v41 = 10;
    }
    CFErrorRef v60 = sub_1000032BC((uint64_t)v62, v41, (uint64_t)a1, @"SavageErrorDomain");
  }
  else
  {
    CFErrorRef v60 = sub_1000032BC((uint64_t)"CreateFileData: Missing kSavageBuildIdentityPathKey", 0xCu, (uint64_t)a1, @"SavageErrorDomain");
    CFTypeRef v31 = 0;
  }
LABEL_37:
  if (a3 && v60)
  {
    *a3 = sub_100003118(v60);
    CFStringRef v63 = CFErrorCopyDescription(v60);
    if (v63)
    {
      CFStringRef v71 = v63;
      CFStringGetCString(v63, byte_10000C068, 4096, 0);
      sub_100005734((uint64_t)"%s [error]: %s \n", v72, v73, v74, v75, v76, v77, v78, (char)"CreateFileData");
      CFRelease(v71);
    }
    else
    {
      sub_100005734((uint64_t)"%s [error]: %s \n", v64, v65, v66, v67, v68, v69, v70, (char)"CreateFileData");
    }
    goto LABEL_44;
  }
  if (v60)
  {
LABEL_44:
    CFErrorRef v58 = v60;
LABEL_16:
    CFRelease(v58);
  }
LABEL_17:
  if (v31) {
    CFRelease(v31);
  }
  if (v32) {
    CFRelease(v32);
  }
  if (v29) {
    CFRelease(v29);
  }
  if (v30) {
    CFRelease(v30);
  }
  if (v28) {
    CFRelease(v28);
  }
  return cf;
}

uint64_t sub_100005D70(const __CFData *a1, CFTypeRef *a2)
{
  *(void *)buffer = 0;
  uint64_t v14 = 0;
  CFMutableDataRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  *(_OWORD *)md = 0u;
  long long v17 = 0u;
  CFTypeRef v5 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFStringRef v6 = 0;
  if (v5) {
    BOOL v7 = Mutable == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v8 = 2;
    if (a1 && a2)
    {
      v18.location = 0;
      v18.length = 16;
      CFDataGetBytes(a1, v18, buffer);
      if (*(_DWORD *)&buffer[4])
      {
        CFStringRef v6 = (UInt8 *)calloc(*(unsigned int *)&buffer[4], 1uLL);
        if (v6)
        {
          v19.length = *(unsigned int *)&buffer[4];
          v19.location = 16;
          CFDataGetBytes(a1, v19, v6);
          CC_LONG v9 = *(_DWORD *)&buffer[4];
          if (!(*(_DWORD *)&buffer[4] >> 20))
          {
            CC_SHA256_Init(&c);
            CC_SHA256_Update(&c, v6, v9);
            CC_SHA256_Final(md, &c);
          }
          CFDataRef v10 = CFDataCreate(kCFAllocatorDefault, md, 32);
          if (v10)
          {
            CFDataRef v11 = v10;
            CFDictionarySetValue(Mutable, @"Digest", v10);
            CFDictionarySetValue(v5, @"MeasurementDictPatch", Mutable);
            *a2 = sub_100003118(v5);
            CFRelease(v11);
            uint64_t v8 = 0;
          }
          else
          {
            uint64_t v8 = 8;
          }
        }
        else
        {
          uint64_t v8 = 3;
        }
      }
      else
      {
        CFStringRef v6 = 0;
        uint64_t v8 = 4;
      }
    }
    goto LABEL_13;
  }
  uint64_t v8 = 3;
  if (Mutable) {
LABEL_13:
  }
    CFRelease(Mutable);
  if (v5) {
    CFRelease(v5);
  }
  if (v6) {
    free(v6);
  }
  return v8;
}

uint64_t sub_100005F68()
{
  v0 = (const char *)qword_10000D080;
  if (!qword_10000D080)
  {
    v0 = "YonkersUtil";
    qword_10000D080 = (uint64_t)"YonkersUtil";
  }
  printf("Usage: %s -c [-h] .....\n", v0);
  puts("OPTIONS:\n");
  puts("\t\t --certData\t\t\t\t\tGet the Yonkers certification data struct");
  puts("\t\t --help\t\t\t\t\t\tUsage");

  return puts("\n");
}

uint64_t sub_100005FE8(uint64_t a1)
{
  uint64_t v2 = 3758097136;
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(dword_10000D068, @"YonkersMNS", kCFAllocatorDefault, 0);
  if (!CFProperty) {
    return v2;
  }
  CFDataRef v4 = CFProperty;
  CFTypeID v5 = CFGetTypeID(CFProperty);
  if (v5 != CFDataGetTypeID()) {
    goto LABEL_19;
  }
  BytePtr = CFDataGetBytePtr(v4);
  if (BytePtr)
  {
    int v7 = *BytePtr;
    if (v7 == 4)
    {
      *(_DWORD *)a1 = 0;
      int v7 = *BytePtr;
    }
    if (v7 == 8) {
      *(_DWORD *)a1 = 1;
    }
  }
  CFRelease(v4);
  CFDataRef v8 = (const __CFData *)IORegistryEntryCreateCFProperty(dword_10000D068, @"YonkersChipID", kCFAllocatorDefault, 0);
  if (!v8) {
    return v2;
  }
  CFDataRef v4 = v8;
  CFTypeID v9 = CFGetTypeID(v8);
  if (v9 != CFDataGetTypeID()) {
    goto LABEL_19;
  }
  CFDataRef v10 = (unsigned int *)CFDataGetBytePtr(v4);
  if (v10) {
    *(_DWORD *)(a1 + 4) = bswap32(*v10);
  }
  CFRelease(v4);
  CFDataRef v11 = (const __CFData *)IORegistryEntryCreateCFProperty(dword_10000D068, @"YonkersUID", kCFAllocatorDefault, 0);
  if (!v11) {
    return v2;
  }
  CFDataRef v4 = v11;
  CFTypeID v12 = CFGetTypeID(v11);
  if (v12 != CFDataGetTypeID()) {
    goto LABEL_19;
  }
  v18.location = 0;
  v18.length = 16;
  CFDataGetBytes(v4, v18, (UInt8 *)(a1 + 8));
  CFRelease(v4);
  CFDataRef v13 = (const __CFData *)IORegistryEntryCreateCFProperty(dword_10000D068, @"YonkersPubKey", kCFAllocatorDefault, 0);
  if (!v13) {
    return v2;
  }
  CFDataRef v4 = v13;
  CFTypeID v14 = CFGetTypeID(v13);
  if (v14 != CFDataGetTypeID())
  {
LABEL_19:
    CFRelease(v4);
    return v2;
  }
  v19.location = 0;
  v19.length = 64;
  CFDataGetBytes(v4, v19, (UInt8 *)(a1 + 24));
  CFRelease(v4);
  CFDataRef v15 = (const __CFData *)IORegistryEntryCreateCFProperty(dword_10000D068, @"YonkersPubKeyHmac", kCFAllocatorDefault, 0);
  if (v15)
  {
    CFDataRef v4 = v15;
    CFTypeID v16 = CFGetTypeID(v15);
    if (v16 == CFDataGetTypeID())
    {
      v20.location = 0;
      v20.length = 32;
      CFDataGetBytes(v4, v20, (UInt8 *)(a1 + 88));
      uint64_t v2 = 0;
    }
    goto LABEL_19;
  }
  return v2;
}

uint64_t start(int a1, char **a2)
{
  uint64_t v4 = 0;
  uint64_t v12 = 0;
  memset(__buf, 0, sizeof(__buf));
  do
  {
    CFDictionaryRef v5 = IOServiceNameMatching((&off_1000086B0)[v4]);
    dword_10000D068 = IOServiceGetMatchingService(kIOMasterPortDefault, v5);
    if (dword_10000D068) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v4 == 2;
    }
    ++v4;
  }
  while (!v6);
  int v7 = basename(*a2);
  qword_10000D080 = (uint64_t)v7;
  if (a1 >= 2)
  {
    char v8 = 0;
    while (1)
    {
      int v9 = getopt_long(a1, a2, "c:h", (const option *)&off_10000C000, 0);
      if (v9 == -1) {
        break;
      }
      if (v9 == 99) {
        char v8 = 1;
      }
      else {
        sub_100005F68();
      }
    }
    if (v8)
    {
      sub_100005FE8((uint64_t)__buf);
      write(1, __buf, 0x78uLL);
    }
  }
  else
  {
    printf("%s: ERROR: At least one option required\n", v7);
    sub_100005F68();
  }
  if (dword_10000D068) {
    IOObjectRelease(dword_10000D068);
  }
  return 0;
}

void sub_100006354()
{
  __assert_rtn("SavageCFDictionarySetInteger32", "SavagePrivateHelper.cpp", 35, "num != NULL");
}

void sub_100006380()
{
}

uint64_t AMSupportCreateDataFromFileURL()
{
  return _AMSupportCreateDataFromFileURL();
}

uint64_t AMSupportMakeDirectory()
{
  return _AMSupportMakeDirectory();
}

uint64_t AMSupportPlatformCopyURLWithAppendedComponent()
{
  return _AMSupportPlatformCopyURLWithAppendedComponent();
}

uint64_t AMSupportPlatformFileURLExists()
{
  return _AMSupportPlatformFileURLExists();
}

uint64_t AMSupportWriteDataToFileURL()
{
  return _AMSupportWriteDataToFileURL();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _CC_SHA256_Final(md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return _CC_SHA256_Init(c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA256_Update(c, data, len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return _CFCopyDescription(cf);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const UInt8 *newBytes, CFIndex newLength)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
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

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return _CFErrorCopyDescription(err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return _CFErrorCreate(allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
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

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
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

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return _IOServiceNameMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t SavageCamInterfaceClose()
{
  return _SavageCamInterfaceClose();
}

uint64_t SavageCamInterfaceGetSensorInfo()
{
  return _SavageCamInterfaceGetSensorInfo();
}

uint64_t SavageCamInterfaceOpen()
{
  return _SavageCamInterfaceOpen();
}

uint64_t SavageCamInterfaceSensorFusing()
{
  return _SavageCamInterfaceSensorFusing();
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
  return ___cxa_begin_catch(a1);
}

int *__error(void)
{
  return ___error();
}

char *__cdecl basename(char *a1)
{
  return _basename(a1);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return _calloc(__count, __size);
}

void free(void *a1)
{
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return _getopt_long(a1, a2, a3, a4, a5);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}