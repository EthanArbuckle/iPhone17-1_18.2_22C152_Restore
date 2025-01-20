uint64_t AppleTCONDevice::getIORegPropertyValue(AppleTCONDevice *this, const __CFString *a2, unsigned __int8 *a3, int a4)
{
  uint64_t v4;
  io_registry_entry_t v5;
  CFDataRef CFProperty;
  CFDataRef v10;
  CFTypeID v11;
  CFIndex Length;
  size_t v13;
  const UInt8 *BytePtr;
  char CStringPtr;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = 3758097084;
  v5 = *((_DWORD *)this + 6);
  if (!v5) {
    return 3758097088;
  }
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v5, a2, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  v10 = CFProperty;
  if (!CFProperty)
  {
    v4 = 3758097086;
LABEL_9:
    AMSupportSafeRelease();
    CStringPtr = CFStringGetCStringPtr(a2, 0);
    AppleTCONLoggingLogMsg((uint64_t)"IOReg (%s) error: %s\n", v16, v17, v18, v19, v20, v21, v22, CStringPtr);
    return v4;
  }
  v11 = CFGetTypeID(CFProperty);
  if (v11 != CFDataGetTypeID()) {
    goto LABEL_9;
  }
  Length = CFDataGetLength(v10);
  if (Length != a4) {
    goto LABEL_9;
  }
  v13 = Length;
  BytePtr = CFDataGetBytePtr(v10);
  if (!BytePtr) {
    goto LABEL_9;
  }
  memcpy(a3, BytePtr, v13);
  AMSupportSafeRelease();
  return 0;
}

uint64_t AppleTCONDP835Device::writeGPIO(AppleTCONDP835Device *this, uint64_t a2, unsigned int a3)
{
  input[2] = *MEMORY[0x263EF8340];
  io_connect_t connect = 0;
  input[0] = a2;
  input[1] = a3;
  io_service_t v3 = *((_DWORD *)this + 10);
  if (!v3) {
    return 3758097136;
  }
  uint64_t v4 = IOServiceOpen(v3, *MEMORY[0x263EF8960], 0, &connect);
  io_connect_t v5 = connect;
  if (!v4)
  {
    if (!connect) {
      return 3758097097;
    }
    uint64_t v4 = IOConnectCallScalarMethod(connect, 1u, input, 2u, 0, 0);
    io_connect_t v5 = connect;
  }
  if (v5) {
    IOServiceClose(v5);
  }
  return v4;
}

uint64_t AppleTCONDP835Device::eraseDeviceEEPROM(AppleTCONDP835Device *this, unsigned int a2, unsigned int a3)
{
  while (a3)
  {
    if (a3 >= 0x1000) {
      int v4 = 4096;
    }
    else {
      int v4 = a3;
    }
    int v15 = v4;
    uint64_t v5 = IOAVDisplayMemoryWrite();
    a3 -= v15;
    if (v5)
    {
      uint64_t v13 = v5;
      AppleTCONLoggingLogMsg((uint64_t)"erase eeprom error (0x%08x): %s", v6, v7, v8, v9, v10, v11, v12, v5);
      return v13;
    }
  }
  return 0;
}

uint64_t AppleTCONDP835Device::writeDeviceEEPROM(AppleTCONDP835Device *this, unsigned int a2, const unsigned __int8 *a3, unsigned int a4)
{
  while (a4)
  {
    if (a4 >= 0x1000) {
      int v5 = 4096;
    }
    else {
      int v5 = a4;
    }
    uint64_t v6 = IOAVDisplayMemoryWrite();
    a4 -= v5;
    if (v6)
    {
      uint64_t v14 = v6;
      AppleTCONLoggingLogMsg((uint64_t)"write eeprom error (0x%08x): %s", v7, v8, v9, v10, v11, v12, v13, v6);
      return v14;
    }
  }
  return 0;
}

uint64_t AppleTCONDP835Device::waitForDeviceReady(AppleTCONDP835Device *this)
{
  uint64_t result = IOAVDisplayMemoryRead();
  if (!result) {
    return 0;
  }
  return result;
}

uint64_t AppleTCONDP835Device::getChipID(AppleTCONDP835Device *this, unsigned int *a2)
{
  if (!a2) {
    return 3758097090;
  }
  uint64_t result = IOAVDisplayMemoryRead();
  if (!result) {
    *a2 = bswap32(0) >> 16;
  }
  return result;
}

uint64_t AppleTCONDP835Device::getBoardID(AppleTCONDP835Device *this, unsigned int *a2)
{
  if (!a2) {
    return 3758097090;
  }
  uint64_t result = IOAVDisplayMemoryRead();
  if (!result) {
    return 3758096385;
  }
  return result;
}

uint64_t AppleTCONDP835Device::getBundleVer(AppleTCONDP835Device *this, unsigned __int8 *a2, int a3)
{
  int v5 = 20;
  uint64_t result = 3758097090;
  if (a2)
  {
    if (a3 == 3)
    {
      uint64_t result = AppleTCONDP835Device::sendCmd(this, (uint64_t)&v5, 0, 0, 0);
      if (!result)
      {
        return IOAVDisplayMemoryRead();
      }
    }
  }
  return result;
}

uint64_t AppleTCONDP835Device::sendCmd(AppleTCONDP835Device *a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  uint64_t v9 = AppleTCONDP835Device::waitForDeviceReady(a1);
  if (v9) {
    return v9;
  }
  uint64_t v10 = 3758097090;
  if (!a3 || !a4)
  {
LABEL_6:
    uint64_t v9 = IOAVDisplayMemoryWrite();
    if (!v9)
    {
      uint64_t v9 = IOAVDisplayMemoryWrite();
      if (!v9)
      {
        uint64_t v9 = AppleTCONDP835Device::waitForDeviceReady(a1);
        if (!v9)
        {
          uint64_t v9 = IOAVDisplayMemoryRead();
          if (!v9) {
            return 0;
          }
        }
      }
    }
    return v9;
  }
  if ((a5 + a4) <= 0x10)
  {
    uint64_t v9 = IOAVDisplayMemoryWrite();
    if (v9) {
      return v9;
    }
    goto LABEL_6;
  }
  return v10;
}

uint64_t AppleTCONDP835Device::dischargePanel(AppleTCONDP835Device *this)
{
  uint64_t result = IOAVDisplayMemoryRead();
  if (!result)
  {
    uint64_t result = IOAVDisplayMemoryWrite();
    if (!result)
    {
      usleep(0x493E0u);
      return 0;
    }
  }
  return result;
}

uint64_t AppleTCONDP835Device::startFWUpdate(AppleTCONDP835Device *this)
{
  uint64_t result = AppleTCONDP835Device::dischargePanel(this);
  if (!result)
  {
    uint64_t result = IOAVDisplayMemoryRead();
    if (!result)
    {
      uint64_t result = IOAVDisplayMemoryWrite();
      if (!result)
      {
        uint64_t result = IOAVDisplayMemoryRead();
        if (!result)
        {
          uint64_t result = IOAVDisplayMemoryRead();
          if (!result)
          {
            uint64_t result = IOAVDisplayMemoryWrite();
            if (!result)
            {
              uint64_t result = IOAVDisplayMemoryRead();
              if (!result)
              {
                IOAVDisplayMemoryWrite();
                usleep(0xC350u);
                uint64_t result = IOAVDisplayMemoryRead();
                if (!result)
                {
                  uint64_t result = IOAVDisplayMemoryRead();
                  if (!result)
                  {
                    uint64_t result = IOAVDisplayMemoryRead();
                    if (!result)
                    {
                      uint64_t result = IOAVDisplayMemoryWrite();
                      if (!result)
                      {
                        uint64_t result = IOAVDisplayMemoryRead();
                        if (!result)
                        {
                          uint64_t result = IOAVDisplayMemoryWrite();
                          if (!result)
                          {
                            uint64_t result = IOAVDisplayMemoryRead();
                            if (!result)
                            {
                              uint64_t result = IOAVDisplayMemoryWrite();
                              if (!result) {
                                return AppleTCONDP835Device::writeGPIO(this, 0x746E766DuLL, 0);
                              }
                            }
                          }
                        }
                      }
                    }
                  }
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

uint64_t AppleTCONDP835Device::endFWUpdate(AppleTCONDP835Device *this)
{
  uint64_t v2 = AppleTCONDP835Device::writeGPIO(this, 0x746E766DuLL, 1u);
  if (v2) {
    return v2;
  }
  uint64_t v2 = AppleTCONDP835Device::dischargePanel(this);
  if (v2) {
    return v2;
  }
  uint64_t v2 = IOAVDisplayMemoryRead();
  if (v2) {
    return v2;
  }
  uint64_t v2 = IOAVDisplayMemoryWrite();
  if (v2) {
    return v2;
  }
  uint64_t v2 = IOAVDisplayMemoryRead();
  if (v2) {
    return v2;
  }
  uint64_t v3 = 3758097129;
  IOAVDisplayMemoryWrite();
  usleep(0x493E0u);
  uint64_t v2 = IOAVDisplayMemoryRead();
  if (v2) {
    return v2;
  }
  return v3;
}

uint64_t AppleTCONDP835Device::getSDOMStatus(AppleTCONDP835Device *this, unsigned __int8 *a2)
{
  if (!a2) {
    return 3758097090;
  }
  uint64_t result = IOAVDisplayMemoryRead();
  if (!result)
  {
    AppleTCONLoggingLogMsg((uint64_t)"SDOM status %s", v4, v5, v6, v7, v8, v9, v10, (char)"OTP_STATUS_UNPROGRAMMED");
    uint64_t result = 0;
    *a2 = 0;
  }
  return result;
}

uint64_t AppleTCONDP835Device::getPRODStatus(AppleTCONDP835Device *this, unsigned __int8 *a2)
{
  if (!a2) {
    return 3758097090;
  }
  uint64_t result = IOAVDisplayMemoryRead();
  if (!result)
  {
    AppleTCONLoggingLogMsg((uint64_t)"PROD status %s", v4, v5, v6, v7, v8, v9, v10, (char)"OTP_STATUS_UNPROGRAMMED");
    uint64_t result = 0;
    *a2 = 0;
  }
  return result;
}

uint64_t AppleTCONDP835Device::setSdom(AppleTCONDP835Device *this)
{
  int v13 = 16777315;
  char v12 = 17;
  uint64_t v1 = AppleTCONDP835Device::sendCmd(this, (uint64_t)&v13, (uint64_t)&v12, 1, 0);
  if (v1)
  {
    uint64_t v10 = v1;
LABEL_7:
    AppleTCONLoggingLogMsg((uint64_t)"setSdom: update failed:0x%x phase:%u", v2, v3, v4, v5, v6, v7, v8, v10);
    return v10;
  }
  uint64_t v9 = IOAVDisplayMemoryRead();
  if (v9)
  {
    uint64_t v10 = v9;
    goto LABEL_7;
  }
  return 0;
}

uint64_t AppleTCONDP835Device::setProd(AppleTCONDP835Device *this)
{
  int v13 = 33554531;
  char v12 = 17;
  uint64_t v1 = AppleTCONDP835Device::sendCmd(this, (uint64_t)&v13, (uint64_t)&v12, 1, 1);
  if (v1)
  {
    uint64_t v10 = v1;
LABEL_7:
    AppleTCONLoggingLogMsg((uint64_t)"setProd: update failed:0x%x phase:%u", v2, v3, v4, v5, v6, v7, v8, v10);
    return v10;
  }
  uint64_t v9 = IOAVDisplayMemoryRead();
  if (v9)
  {
    uint64_t v10 = v9;
    goto LABEL_7;
  }
  return 0;
}

uint64_t AppleTCONDP835Device::getECID(AppleTCONDP835Device *this, unsigned __int8 *a2, int a3)
{
  uint64_t result = 3758097090;
  if (a2)
  {
    if (a3 == 16)
    {
      uint64_t result = IOAVDisplayMemoryRead();
      if (!result)
      {
        uint64_t v5 = 15;
        uint64_t v6 = 8;
        do
        {
          unsigned __int8 v7 = a2[v6];
          a2[v6] = a2[v5];
          a2[v5--] = v7;
          ++v6;
        }
        while (v5 != 11);
        uint64_t result = 0;
        *(void *)a2 = 0;
      }
    }
  }
  return result;
}

uint64_t AppleTCONDP835Device::getOptionsValue(AppleTCONDP835Device *this, const __CFDictionary *a2, const __CFString *a3, uint64_t Value)
{
  CFStringRef v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"Options.%@", a3);
  if (v5)
  {
    CFStringRef v6 = v5;
    CFBooleanRef ValueForKeyPathInDict = (const __CFBoolean *)AMSupportGetValueForKeyPathInDict();
    if (ValueForKeyPathInDict)
    {
      CFBooleanRef v8 = ValueForKeyPathInDict;
      CFTypeID v9 = CFGetTypeID(ValueForKeyPathInDict);
      if (v9 == CFBooleanGetTypeID()) {
        Value = CFBooleanGetValue(v8);
      }
    }
    CFRelease(v6);
  }
  return Value;
}

uint64_t AppleTCONDP835Device::updateOTP(AppleTCONDP835Device *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  AppleTCONLoggingLogMsg((uint64_t)"Fuse Prod (%d:%d)", a2, a3, a4, a5, a6, a7, a8, *((unsigned char *)this + 9));
  if (!*((unsigned char *)this + 9) && *((unsigned char *)this + 65))
  {
    uint64_t result = AppleTCONDP835Device::setProd(this);
    if (result) {
      return result;
    }
    *((unsigned char *)this + 9) = 1;
  }
  uint64_t result = AppleTCONDP835Device::setSdom(this);
  if (!result) {
    *((unsigned char *)this + 8) = 1;
  }
  return result;
}

void AppleTCONDP835Device::AppleTCONDP835Device(AppleTCONDP835Device *this, int a2)
{
  *(void *)this = &unk_26EF78440;
  int v22 = 0;
  *((_DWORD *)this + 2) = 257;
  *((unsigned char *)this + 69) = 0;
  *((_DWORD *)this + 6) = a2;
  CFDictionaryRef v3 = IOServiceMatching("AppleTCONControl");
  if (!v3)
  {
    v20 = "Failed to create AppleTCONControl matching dictionary";
LABEL_22:
    AppleTCONLoggingLogMsg((uint64_t)v20, (uint64_t)v3, v4, v5, v6, v7, v8, v9, v21);
    goto LABEL_14;
  }
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v3);
  *((_DWORD *)this + 10) = MatchingService;
  if (!MatchingService)
  {
    v20 = "Failed to find AppleTCONControl service";
    goto LABEL_22;
  }
  uint64_t v11 = IOAVDisplayMemoryCreateWithName();
  *((void *)this + 2) = v11;
  if (!v11)
  {
    v20 = "Failed to get memoryRef handle";
    goto LABEL_22;
  }
  uint64_t v12 = IOAVDisplayMemoryCreateWithName();
  *((void *)this + 4) = v12;
  if (!v12)
  {
    v20 = "Failed to get eepromRef handle";
    goto LABEL_22;
  }
  if (AppleTCONDP835Device::getPRODStatus(this, (unsigned __int8 *)&v22 + 3))
  {
    v20 = "Failed to get Prod status";
    goto LABEL_22;
  }
  *((unsigned char *)this + 9) = HIBYTE(v22) == 1;
  if (AppleTCONDP835Device::getSDOMStatus(this, (unsigned __int8 *)&v22 + 3))
  {
    v20 = "Failed to get SDOM status";
    goto LABEL_22;
  }
  *((unsigned char *)this + 8) = HIBYTE(v22) == 1;
  if (IOAVDisplayMemoryRead())
  {
    v20 = "Failed to get boot status";
    goto LABEL_22;
  }
  *((_WORD *)this + 22) = 0;
  *((unsigned char *)this + 46) = 0;
  if ((~HIBYTE(v22) & 7) != 0)
  {
    AppleTCONLoggingLogMsg((uint64_t)"Unexpected boot status: 0x%02x", (uint64_t)v3, v4, v5, v6, v7, v8, v9, SHIBYTE(v22));
  }
  else if (AppleTCONDP835Device::getBundleVer(this, (unsigned __int8 *)&v22, 3))
  {
    AppleTCONLoggingLogMsg((uint64_t)"Failed to get bundle version", v13, v14, v15, v16, v17, v18, v19, v21);
  }
  else
  {
    *((unsigned char *)this + 44) = v22;
    *(_WORD *)((char *)this + 45) = *(_WORD *)((char *)&v22 + 1);
  }
  *(_WORD *)((char *)this + 47) = 0;
  *((unsigned char *)this + 49) = 0;
  *((unsigned char *)this + 11) = 1;
LABEL_14:
  AppleTCONLoggingLogMsg((uint64_t)"AppleTconDev:(%d:%d:%d:0x%02x:0x%02x:0x%02x)", v13, v14, v15, v16, v17, v18, v19, *((unsigned char *)this + 11));
}

void sub_23BE9EB08(_Unwind_Exception *a1)
{
  *uint64_t v1 = &unk_26EF78498;
  _Unwind_Resume(a1);
}

void AppleTCONDP835Device::~AppleTCONDP835Device(AppleTCONDP835Device *this)
{
  *(void *)this = &unk_26EF78440;
  io_object_t v2 = *((_DWORD *)this + 6);
  if (v2) {
    IOObjectRelease(v2);
  }
  io_object_t v3 = *((_DWORD *)this + 10);
  if (v3) {
    IOObjectRelease(v3);
  }
  *(void *)this = &unk_26EF78498;
}

{
  uint64_t vars8;

  AppleTCONDP835Device::~AppleTCONDP835Device(this);

  JUMPOUT(0x23ECD6040);
}

void __clang_call_terminate(void *a1)
{
}

uint64_t AppleTCONDP835Device::eventCmdQueryInfo(AppleTCONDP835Device *this, const __CFDictionary *a2, __CFDictionary *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  *(void *)v39 = 0;
  uint64_t v40 = 0;
  memset(bytes, 0, 16);
  unsigned int valuePtr = 0;
  unsigned int v36 = 0;
  OptionsValue = (AppleTCONDP835Device *)AppleTCONDP835Device::getOptionsValue(this, a2, @"FuseSDOM", 0);
  *((unsigned char *)this + 64) = (_BYTE)OptionsValue;
  uint64_t v7 = (AppleTCONDP835Device *)AppleTCONDP835Device::getOptionsValue(OptionsValue, a2, @"FusePROD", 0);
  *((unsigned char *)this + 65) = (_BYTE)v7;
  uint64_t v8 = (AppleTCONDP835Device *)AppleTCONDP835Device::getOptionsValue(v7, a2, @"RestoreInternal", 0);
  *((unsigned char *)this + 66) = (_BYTE)v8;
  *((unsigned char *)this + 67) = AppleTCONDP835Device::getOptionsValue(v8, a2, @"SkipSameVersion", 1);
  if (!*((unsigned char *)this + 11)) {
    return 0;
  }
  if (AppleTCONDP835Device::getBoardID(this, &v36))
  {
    v34 = "getBoardID failed";
    goto LABEL_30;
  }
  *((_DWORD *)this + 15) = v36;
  unsigned __int16 v37 = 0;
  uint64_t v16 = IOAVDisplayMemoryRead();
  if (v16)
  {
    uint64_t v19 = v16;
    v34 = "getHWCID failed";
    goto LABEL_31;
  }
  char v17 = 1;
  if ((v37 > 0xDu || ((1 << v37) & 0x23FF) == 0) && v37 - 256 >= 6) {
    char v17 = 0;
  }
  if (*((unsigned char *)this + 8))
  {
    char v18 = 1;
  }
  else
  {
    char v18 = v17 ^ 1;
    if (!*((unsigned char *)this + 64)) {
      char v18 = 1;
    }
  }
  uint64_t v19 = 3758097085;
  *((unsigned char *)this + 69) |= v18;
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP835Device::eventCmdQueryInfo: boardID=0x%08x HWCID=0x%08x personalize=%u", v9, v10, v11, v12, v13, v14, v15, *((_DWORD *)this + 15));
  CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v21 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, (char *)this + 60);
  if (!v21)
  {
    v34 = "boardID alloc failed";
    goto LABEL_31;
  }
  CFNumberRef v22 = v21;
  v23 = AppleTCONDP835DeviceRestoreTagForBoardID(3, *((_DWORD *)this + 15));
  CFDictionaryAddValue(a3, v23, v22);
  CFRelease(v22);
  if (AppleTCONDP835Device::getChipID(this, &valuePtr))
  {
    v34 = "getChipID failed";
    goto LABEL_30;
  }
  CFNumberRef v24 = CFNumberCreate(v20, kCFNumberIntType, &valuePtr);
  if (!v24)
  {
    v34 = "chipID alloc failed";
    goto LABEL_31;
  }
  CFNumberRef v25 = v24;
  v26 = AppleTCONDP835DeviceRestoreTagForBoardID(2, *((_DWORD *)this + 15));
  CFDictionaryAddValue(a3, v26, v25);
  CFRelease(v25);
  if (*((unsigned char *)this + 69))
  {
    *(_OWORD *)bytes = AppleTCONDP835Device::getNonce(unsigned char *,unsigned int)::nonceData;
    CFDataRef v27 = CFDataCreate(v20, bytes, 16);
    if (!v27)
    {
      v34 = "nonce alloc failed";
      goto LABEL_31;
    }
    CFDataRef v28 = v27;
    v29 = AppleTCONDP835DeviceRestoreTagForBoardID(8, *((_DWORD *)this + 15));
    CFDictionaryAddValue(a3, v29, v28);
    CFRelease(v28);
    if (!AppleTCONDP835Device::getECID(this, v39, 16))
    {
      CFDataRef v30 = CFDataCreate(v20, v39, 16);
      if (v30)
      {
        CFDataRef v31 = v30;
        v32 = AppleTCONDP835DeviceRestoreTagForBoardID(10, *((_DWORD *)this + 15));
        CFDictionaryAddValue(a3, v32, v31);
        CFRelease(v31);
        goto LABEL_20;
      }
      v34 = "ecid alloc failed";
LABEL_31:
      AppleTCONLoggingLogMsg((uint64_t)"Dev:CmdQueryInfo failure %s", v9, v10, v11, v12, v13, v14, v15, (char)v34);
      return v19;
    }
    v34 = "getECID failed";
LABEL_30:
    uint64_t v19 = 15;
    goto LABEL_31;
  }
LABEL_20:
  AppleTCONDP835DeviceRestoreTagForBoardID(5, *((_DWORD *)this + 15));
  AMSupportCFDictionarySetBoolean();
  AppleTCONDP835DeviceRestoreTagForBoardID(7, *((_DWORD *)this + 15));
  AMSupportCFDictionarySetInteger32();
  return 0;
}

uint64_t AppleTCONDP835Device::isFWComponentsUpdateRequired(AppleTCONDP835Device *this, CFDictionaryRef theDict)
{
  unsigned __int8 v34 = 0;
  *(_WORD *)buffer = 0;
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(theDict, @"FirmwareData");
  CFDataRef v11 = Value;
  if (!Value || (CFTypeID v12 = CFGetTypeID(Value), v12 != CFDataGetTypeID()))
  {
    v29 = "firmware data type invalid ";
    goto LABEL_25;
  }
  CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFPropertyListRef v14 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], v11, 0, 0, 0);
  if (!v14 || (CFTypeID v15 = CFGetTypeID(v14), v15 != CFDictionaryGetTypeID()))
  {
    v29 = "fw dict create failed";
    goto LABEL_25;
  }
  if (!CFStringCreateWithFormat(v13, 0, @"%u.%s.%s", *((unsigned int *)this + 15), "nvm_image", "Payload"))
  {
    v29 = "nvm ver string create failed";
    goto LABEL_25;
  }
  CFDataRef ValueForKeyPathInDict = (const __CFData *)AMSupportGetValueForKeyPathInDict();
  if (!ValueForKeyPathInDict
    || (CFDataRef v17 = ValueForKeyPathInDict, v18 = CFGetTypeID(ValueForKeyPathInDict), v18 != CFDataGetTypeID()))
  {
    v29 = "bundle payload type invalid";
    goto LABEL_25;
  }
  v35.location = 3006464;
  v35.length = 3;
  CFDataGetBytes(v17, v35, buffer);
  *((unsigned char *)this + 49) = v34;
  *((unsigned char *)this + 47) = buffer[1];
  *((unsigned char *)this + 48) = buffer[0];
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP835Device::isFWComponentsUpdateRequired: internal:%u skipSameVersion:%u", v19, v20, v21, v22, v23, v24, v25, *((unsigned char *)this + 66));
  unsigned int v26 = buffer[1] & 0x3E;
  unsigned int v27 = *((unsigned char *)this + 44) & 0x3E;
  if (v26 < v27)
  {
    v29 = "bundle major ver < current major ver";
    goto LABEL_25;
  }
  if (v26 == v27)
  {
    unsigned int v28 = *((unsigned __int8 *)this + 45);
    if (buffer[0] < v28)
    {
      v29 = "bundle minor ver < current minor ver";
      goto LABEL_25;
    }
    if (buffer[0] == v28)
    {
      if (*((unsigned char *)this + 66) && !*((unsigned char *)this + 67))
      {
        if (v34 < *((unsigned __int8 *)this + 46))
        {
          v29 = "bundle extent ver < current extent ver";
          goto LABEL_25;
        }
      }
      else if (v34 <= *((unsigned __int8 *)this + 46))
      {
        v29 = "bundle extent ver <= current extent ver";
LABEL_25:
        AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP835Device::isFWComponentsUpdateRequired: %s", v4, v5, v6, v7, v8, v9, v10, (char)v29);
        uint64_t v31 = 0;
        CFDataRef v30 = "Skipping";
        goto LABEL_18;
      }
    }
  }
  CFDataRef v30 = "Performing";
  uint64_t v31 = 1;
LABEL_18:
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP835Device::isFWComponentsUpdateRequired: %s update to 0x%02x:0x%02x:0x%02x", v4, v5, v6, v7, v8, v9, v10, (char)v30);
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return v31;
}

uint64_t AppleTCONDP835Device::updateFWComponents(AppleTCONDP835Device *this, const __CFDictionary *a2)
{
  uint64_t v4 = 3758097088;
  AppleTCONDP835DeviceRestoreTagForBoardID(1, *((_DWORD *)this + 15));
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  AMSupportGetValueForKeyPathInDict();
  CFDataRef v13 = (const __CFData *)AMSupportSafeRetain();
  if (!v13)
  {
    unsigned int v27 = "ticket missing";
    goto LABEL_26;
  }
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(a2, @"FirmwareData");
  CFDataRef v15 = Value;
  if (!Value || (CFTypeID v16 = CFGetTypeID(Value), v16 != CFDataGetTypeID()))
  {
    unsigned int v27 = "firmware missing";
    goto LABEL_26;
  }
  CFPropertyListRef v17 = CFPropertyListCreateWithData(v5, v15, 0, 0, 0);
  if (!v17 || (CFTypeID v18 = CFGetTypeID(v17), v18 != CFDictionaryGetTypeID()))
  {
    unsigned int v27 = "firmware dict: create failed";
    goto LABEL_26;
  }
  BytePtr = CFDataGetBytePtr(v13);
  uint64_t v4 = 3758097090;
  if (BytePtr)
  {
    unsigned int Length = CFDataGetLength(v13);
    if (Length <= 0x3000)
    {
      uint64_t v21 = AppleTCONDP835Device::eraseDeviceEEPROM(this, *((_DWORD *)this + 14), 0x3000u);
      if (v21)
      {
        uint64_t v4 = v21;
        unsigned int v27 = "failed to erase personalization manifest from EEPROM";
      }
      else
      {
        uint64_t v22 = AppleTCONDP835Device::writeDeviceEEPROM(this, *((_DWORD *)this + 14), BytePtr, Length);
        if (v22)
        {
          uint64_t v4 = v22;
          unsigned int v27 = "failed to write personalization manifest to EEPROM";
        }
        else
        {
          CFStringRef v23 = CFStringCreateWithFormat(v5, 0, @"%u.%s.Payload", *((unsigned int *)this + 15), "nvm_image");
          if (v23)
          {
            AMSupportGetValueForKeyPathInDict();
            CFDataRef v24 = (const __CFData *)AMSupportSafeRetain();
            if (v24)
            {
              uint64_t updated = AppleTCONDP835Device::updateFWComponent(this, 4, v24);
              if (updated)
              {
                uint64_t v4 = updated;
                unsigned int v27 = "failed to update fw component";
              }
              else
              {
                uint64_t v4 = doPCDSUpdate();
                if (!v4)
                {
                  CFRelease(v23);
                  CFRelease(v24);
                  goto LABEL_15;
                }
                unsigned int v27 = "failed to update pcds component";
              }
            }
            else
            {
              uint64_t v4 = 0;
              unsigned int v27 = "comp: data missing";
            }
          }
          else
          {
            uint64_t v4 = 0;
            unsigned int v27 = "comp: key create failed";
          }
        }
      }
LABEL_26:
      AppleTCONLoggingLogMsg((uint64_t)"update fw error:%s", v6, v7, v8, v9, v10, v11, v12, (char)v27);
    }
  }
LABEL_15:
  AMSupportSafeFree();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return v4;
}

uint64_t AppleTCONDP835Device::updateFWComponent(AppleTCONDP835Device *this, int a2, CFDataRef theData)
{
  BytePtr = CFDataGetBytePtr(theData);
  unsigned int Length = CFDataGetLength(theData);
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP835Device::updateFWComponent: component=0x%02x, componentDataLength=0x%08x", v8, v9, v10, v11, v12, v13, v14, a2);
  uint64_t v15 = 0;
  while (1)
  {
    if (a2 == 4)
    {
      int v17 = *(_DWORD *)((char *)&tconEEPROMMap + v15 + 8);
      unsigned int v16 = *(_DWORD *)((char *)&tconEEPROMMap + v15 + 12);
      unsigned int v18 = v17 + *((_DWORD *)this + 14);
      uint64_t v19 = AppleTCONDP835Device::eraseDeviceEEPROM(this, v18, v16);
      if (v19)
      {
        uint64_t v29 = v19;
        uint64_t v31 = "eraseDeviceEEPROM failed";
        goto LABEL_13;
      }
      unsigned int v27 = v16 >= Length ? Length : v16;
      uint64_t v28 = AppleTCONDP835Device::writeDeviceEEPROM(this, *((_DWORD *)this + 14) + v17, &BytePtr[v18], v27);
      if (v28) {
        break;
      }
    }
    v15 += 16;
    if (v15 == 400) {
      return 0;
    }
  }
  uint64_t v29 = v28;
  uint64_t v31 = "writeDeviceEEPROM failed";
LABEL_13:
  AppleTCONLoggingLogMsg((uint64_t)"update fw component error:%s", v20, v21, v22, v23, v24, v25, v26, (char)v31);
  return v29;
}

uint64_t AppleTCONDP835Device::readFWPointer(AppleTCONDP835Device *this, unint64_t a2, unint64_t a3)
{
  if (!(a2 | a3)) {
    return 3758097090;
  }
  uint64_t result = IOAVDisplayMemoryRead();
  if (!result)
  {
    unsigned int v13 = bswap32(0);
    if ((v13 & 0xFFDFFFFF) == 0x100000)
    {
      if (a2) {
        *(_DWORD *)a2 = v13;
      }
      if (a3) {
        *(_DWORD *)a3 = 0x100000;
      }
      if (a2) {
        int v14 = *(_DWORD *)a2;
      }
      else {
        LOBYTE(v14) = 0;
      }
      AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP835Device::readFWPointer: activeFWPointer:0x%08x inactiveFWPointer:0x%08x", v6, v7, v8, v9, v10, v11, v12, v14);
      return 0;
    }
    else
    {
      return 3758096385;
    }
  }
  return result;
}

uint64_t AppleTCONDP835Device::writeFWPointer(AppleTCONDP835Device *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = a2;
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP835Device::writeFWPointer: fWPointer:0x%08x", a2, a3, a4, a5, a6, a7, a8, a2);
  if ((v8 & 0xFFDFFFFF) != 0x100000) {
    return 3758097090;
  }
  *(_DWORD *)uint64_t v11 = bswap32(v8);
  uint64_t result = AppleTCONDP835Device::eraseDeviceEEPROM(this, 0, 4u);
  if (!result) {
    return AppleTCONDP835Device::writeDeviceEEPROM(this, 0, v11, 4u);
  }
  return result;
}

uint64_t AppleTCONDP835Device::writeAndVerifyFWPointer(AppleTCONDP835Device *this, uint64_t a2, unsigned int *a3, unsigned int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP835Device::writeAndVerifyFWPointer: fWPointer:0x%08x", a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, a2);
  uint64_t result = AppleTCONDP835Device::writeFWPointer(this, a2, v12, v13, v14, v15, v16, v17);
  if (!result)
  {
    uint64_t result = AppleTCONDP835Device::readFWPointer(this, (unint64_t)a3, (unint64_t)a4);
    if (!result)
    {
      if (*a3 == a2) {
        return 0;
      }
      else {
        return 3758097129;
      }
    }
  }
  return result;
}

uint64_t AppleTCONDP835Device::eventCmdPerformNextStage(AppleTCONDP835Device *this, const __CFDictionary *a2, CFDictionaryRef theDict, unsigned __int8 *a4)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  *(void *)v55 = 0;
  *(_DWORD *)v54 = 0;
  int isFWComponentsUpdateRequired = AppleTCONDP835Device::isFWComponentsUpdateRequired(this, theDict);
  if (*((unsigned char *)this + 8)) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = *((unsigned char *)this + 64) == 0;
  }
  char v16 = !v15;
  AppleTCONLoggingLogMsg((uint64_t)"Fuse SDOM (%d:%d)", v7, v8, v9, v10, v11, v12, v13, *((unsigned char *)this + 8));
  if (*((unsigned char *)this + 10))
  {
    v52 = "AppleTCONDP835Device::eventCmdPerformNextStage: update done";
LABEL_51:
    AppleTCONLoggingLogMsg((uint64_t)v52, v17, v18, v19, v20, v21, v22, v23, v53);
    char v48 = 0;
    goto LABEL_46;
  }
  if (isFWComponentsUpdateRequired) {
    char v24 = 1;
  }
  else {
    char v24 = v16;
  }
  if ((v24 & 1) == 0)
  {
    v52 = "AppleTCONDP835Device::eventCmdPerformNextStage: update not required";
    goto LABEL_51;
  }
  if (*((unsigned char *)this + 8) || *((unsigned char *)this + 64))
  {
    char v25 = v16 ^ 1;
    if (!*((unsigned char *)this + 69)) {
      char v25 = 1;
    }
    if ((v25 & 1) == 0 && AppleTCONDP835Device::updateOTP(this, v17, v18, v19, v20, v21, v22, v23))
    {
      uint64_t v28 = "otp update failed";
    }
    else if (AppleTCONDP835Device::startFWUpdate(this))
    {
      uint64_t v28 = "start update failed";
    }
    else
    {
      if (AppleTCONDP835Device::readFWPointer(this, (unint64_t)&v55[1], (unint64_t)v55))
      {
        unsigned int v26 = 3145728;
        unsigned int v27 = 0x100000;
        v55[0] = 0x100000;
        v55[1] = 3145728;
      }
      else
      {
        unsigned int v27 = v55[0];
        unsigned int v26 = v55[1];
      }
      *((_DWORD *)this + 13) = v26;
      *((_DWORD *)this + 14) = v27;
      if (!AppleTCONDevice::getIORegPropertyValue(this, @"enforce-pcds-valid", v54, 4)
        && *(_DWORD *)v54
        && ((size_t v56 = 256, sysctlbyname("kern.bootargs", __s1, &v56, 0, 0)) || !strstr(__s1, "enforce-pcds-valid=0")))
      {
        if (IOAVDisplayMemoryRead())
        {
          uint64_t v28 = "failed to read PCDS 0 top-level header";
        }
        else
        {
          *((unsigned char *)this + 68) = 0;
          if (IOAVDisplayMemoryRead())
          {
            uint64_t v28 = "failed to read PCDS 1 top-level header";
          }
          else
          {
            *((unsigned char *)this + 68) = 0;
            uint64_t v28 = "PCDS must be generated and programmed before FW update can occur";
          }
        }
      }
      else if (AppleTCONDP835Device::updateFWComponents(this, theDict))
      {
        uint64_t v28 = "updates failed";
      }
      else
      {
        if (!AppleTCONDP835Device::writeAndVerifyFWPointer(this, *((unsigned int *)this + 14), &v55[1], v55, v20, v21, v22, v23))
        {
          unsigned int v29 = v55[0];
          *((_DWORD *)this + 13) = v55[1];
          *((_DWORD *)this + 14) = v29;
          if (AppleTCONDP835Device::endFWUpdate(this))
          {
            unsigned __int16 v37 = "end update failed";
            goto LABEL_37;
          }
          if (AppleTCONDP835Device::getBundleVer(this, (unsigned __int8 *)__s1, 3))
          {
            unsigned __int16 v37 = "failed to read bundle version after update";
            goto LABEL_37;
          }
          AppleTCONLoggingLogMsg((uint64_t)"expected bundle version: 0x%02x:0x%02x:0x%02x, actual bundle version: 0x%02x:0x%02x:0x%02x", v30, v31, v32, v33, v34, v35, v36, *((unsigned char *)this + 47));
          if (__s1[0] != *((unsigned __int8 *)this + 47)
            || __s1[1] != *((unsigned __int8 *)this + 48)
            || __s1[2] != *((unsigned __int8 *)this + 49))
          {
            unsigned __int16 v37 = "bundle version after update differs from update bundle version";
LABEL_37:
            AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP835Device::eventCmdPerformNextStage: failure %s", v30, v31, v32, v33, v34, v35, v36, (char)v37);
            int started = AppleTCONDP835Device::startFWUpdate(this);
            if (!started)
            {
              int started = AppleTCONDP835Device::writeAndVerifyFWPointer(this, *((unsigned int *)this + 14), &v55[1], v55, v41, v42, v43, v44);
              if (!started)
              {
                unsigned int v46 = v55[0];
                *((_DWORD *)this + 13) = v55[1];
                *((_DWORD *)this + 14) = v46;
              }
              AppleTCONDP835Device::endFWUpdate(this);
            }
            v47 = "failed";
            if (!started) {
              v47 = "succeeded";
            }
            AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP835Device::eventCmdPerformNextStage: failure: attempt to revert FW pointer %s", v38, v39, v40, v41, v42, v43, v44, (char)v47);
            goto LABEL_44;
          }
          unsigned __int8 v49 = *((unsigned char *)this + 69);
          char v48 = 1;
          if (!v49)
          {
            uint64_t v50 = 0;
            *((unsigned char *)this + 69) = 1;
            goto LABEL_48;
          }
LABEL_46:
          uint64_t v50 = 0;
          unsigned __int8 v49 = 1;
          goto LABEL_48;
        }
        uint64_t v28 = "failed to set FW pointer to update bank";
      }
    }
  }
  else
  {
    uint64_t v28 = "SDOM not fused; see rdar://84123825 for instructions";
  }
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP835Device::eventCmdPerformNextStage: failure %s", v17, v18, v19, v20, v21, v22, v23, (char)v28);
LABEL_44:
  char v48 = 0;
  unsigned __int8 v49 = 1;
  uint64_t v50 = 11;
LABEL_48:
  *((unsigned char *)this + 10) = v49;
  *a4 = v49;
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP835Device::eventCmdPerformNextStage: didUpdate=%u personalize=%u updateDone=%u", v30, v31, v32, v33, v34, v35, v36, v48);
  return v50;
}

void AppleTCONDevice::~AppleTCONDevice(AppleTCONDevice *this)
{
  *(void *)this = &unk_26EF78498;
}

{
  *(void *)this = &unk_26EF78498;
  JUMPOUT(0x23ECD6040);
}

uint64_t AppleTCONDevice::eventCmdQueryInfo(AppleTCONDevice *this, const __CFDictionary *a2, __CFDictionary *a3)
{
  return 0;
}

uint64_t AppleTCONDevice::eventCmdPerformNextStage(AppleTCONDevice *this, const __CFDictionary *a2, const __CFDictionary *a3, unsigned __int8 *a4)
{
  return *((unsigned __int8 *)this + 10);
}

uint64_t AppleTCONUpdaterCreate(uint64_t a1, const char *a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  AppleTCONLoggingRegisterLogSink(a2, a3, a3, (uint64_t)a4, a5, a6, a7, a8);
  if (AppleTCONUpdaterCreate::only_once != -1) {
    dispatch_once(&AppleTCONUpdaterCreate::only_once, &__block_literal_global);
  }
  if (AppleTCONUpdaterTypeID)
  {
    uint64_t Instance = _CFRuntimeCreateInstance();
    if (Instance)
    {
      *(void *)(Instance + 32) = AppleTCONUpdaterTypeID;
      *(void *)(Instance + 16) = 0;
      operator new();
    }
    CFErrorWithDomain = AppleTCONLoggingCreateCFErrorWithDomain((uint64_t)"AppleTCONUpdaterCreate - failed to create AppleTCONUpdater", 3u, a1, @"AppleTCONUpdaterErrorDomain");
  }
  else
  {
    CFErrorWithDomain = AppleTCONLoggingCreateCFErrorWithDomain((uint64_t)"AppleTCONUpdaterCreate - failed to register kLibAppleTCONUpdaterClass", 3u, a1, @"AppleTCONUpdaterErrorDomain");
  }
  if (CFErrorWithDomain)
  {
    CFStringRef v13 = CFErrorCopyDescription(CFErrorWithDomain);
    CFStringGetCStringPtr(v13, 0);
    AppleTCONLoggingLogMsg((uint64_t)"%s [error]: %s\n", v14, v15, v16, v17, v18, v19, v20, (char)"AppleTCONUpdaterCreate");
    CFRelease(v13);
    if (a4) {
      *a4 = AMSupportSafeRetain();
    }
    AMSupportSafeRelease();
    AMSupportSafeRelease();
  }
  return 0;
}

void sub_23BE9FE48(_Unwind_Exception *a1)
{
  MEMORY[0x23ECD6040](v1, 0x1070C4018F7BE2CLL);
  _Unwind_Resume(a1);
}

uint64_t __AppleTCONUpdaterCreate_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  AppleTCONUpdaterTypeID = result;
  return result;
}

void AppleTCONUpdaterDestroy(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(void **)(a1 + 24);
    if (v1) {
      free(v1);
    }
  }
}

CFStringRef AppleTCONUpdaterDescribe(CFStringRef result)
{
  if (result)
  {
    CFStringRef v1 = result;
    CFAllocatorRef v2 = CFGetAllocator(result);
    CFAllocatorRef v3 = CFGetAllocator(v1);
    return CFStringCreateWithFormat(v2, 0, @"<libAppleTCONUpdater %p [%p]>{}", v1, v3);
  }
  return result;
}

uint64_t AppleTCONUpdaterExecCommand(uint64_t a1, const __CFString *a2, const __CFDictionary *a3, const __CFDictionary **a4, uint64_t *a5)
{
  if (!a1 || !a2)
  {
    uint64_t v10 = "AppleTCONUpdaterExecCommand - invalid input";
    unsigned int v11 = 2;
LABEL_8:
    uint64_t v12 = 0;
    goto LABEL_10;
  }
  uint64_t v6 = *(AppleTCONUpdateController **)(a1 + 24);
  if (!v6)
  {
    uint64_t v10 = "AppleTCONUpdaterExecCommand - no AppleTCON controller instance";
    unsigned int v11 = 16;
    goto LABEL_8;
  }
  unsigned int v8 = AppleTCONUpdateController::execCommand(v6, a2, a3, a4);
  if (!v8) {
    return 1;
  }
  unsigned int v11 = v8;
  uint64_t v10 = "AppleTCONUpdaterExecCommand - execCommand error";
  uint64_t v12 = (uint64_t)a3;
LABEL_10:
  CFErrorWithDomain = AppleTCONLoggingCreateCFErrorWithDomain((uint64_t)v10, v11, v12, @"AppleTCONUpdaterErrorDomain");
  if (CFErrorWithDomain)
  {
    CFStringRef v14 = CFErrorCopyDescription(CFErrorWithDomain);
    CFStringGetCStringPtr(v14, 0);
    AppleTCONLoggingLogMsg((uint64_t)"%s [error]: %s\n", v15, v16, v17, v18, v19, v20, v21, (char)"AppleTCONUpdaterExecCommand");
    CFRelease(v14);
    if (a5) {
      *a5 = AMSupportSafeRetain();
    }
    AMSupportSafeRelease();
  }
  return 0;
}

CFErrorRef AppleTCONUpdaterIsDone(CFErrorRef result, uint64_t *a2)
{
  if (result)
  {
    uint64_t v2 = *((void *)result + 3);
    if (v2)
    {
      return (CFErrorRef)*(unsigned __int8 *)(v2 + 16);
    }
    else
    {
      uint64_t result = AppleTCONLoggingCreateCFErrorWithDomain((uint64_t)"AppleTCONUpdaterIsDone - no controller instance", 0x10u, 0, @"AppleTCONUpdaterErrorDomain");
      if (result)
      {
        CFStringRef v4 = CFErrorCopyDescription(result);
        CFStringGetCStringPtr(v4, 0);
        AppleTCONLoggingLogMsg((uint64_t)"%s [error]: %s\n", v5, v6, v7, v8, v9, v10, v11, (char)"AppleTCONUpdaterIsDone");
        CFRelease(v4);
        if (a2) {
          *a2 = AMSupportSafeRetain();
        }
        AMSupportSafeRelease();
        return 0;
      }
    }
  }
  return result;
}

CFErrorRef AppleTCONLoggingCreateCFErrorWithDomain(uint64_t a1, unsigned int a2, uint64_t a3, const __CFString *a4)
{
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    CFStringRef v9 = CFStringCreateWithFormat(v7, 0, @"%@: %s", a4, a1);
    if (v9)
    {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263EFFC70], v9);
      CFErrorRef v10 = CFErrorCreate(v7, a4, a2, Mutable);
    }
    else
    {
      CFErrorRef v10 = 0;
    }
  }
  else
  {
    CFErrorRef v10 = 0;
  }
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return v10;
}

const char *AppleTCONLoggingLogMsg(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result = (const char *)MEMORY[0x270FA5388]();
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (logSinkFunc)
  {
    vsnprintf(__str, 0x1000uLL, result, &a9);
    return (const char *)logSinkFunc(logSinkContext, __str);
  }
  return result;
}

const char *AppleTCONLoggingRegisterLogSink(const char *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  logSinkFunc = (uint64_t (*)(void, void))result;
  logSinkContext = a2;
  if (result)
  {
    if ((AppleTCONPrintVersion(void)::version_displayed & 1) == 0)
    {
      uint64_t result = AppleTCONLoggingLogMsg((uint64_t)"AppleTCONRestoreLib Version %d.%d\n", a2, a3, a4, a5, a6, a7, a8, 2);
      AppleTCONPrintVersion(void)::version_displayed = 1;
    }
  }
  return result;
}

uint64_t AppleTCONDP855Device::computeCRC(AppleTCONDP855Device *this, const unsigned __int8 *a2, unsigned int a3)
{
  if (!a3) {
    return 255;
  }
  unint64_t v3 = 0;
  LOBYTE(result) = -1;
  do
  {
    uint64_t result = AppleTCONDP855Device::computeCRC(unsigned char const*,unsigned int)::crc8Table[a2[v3] ^ AppleTCONDP855Device::computeCRC(unsigned char const*,unsigned int)::crc8Table[a2[v3 + 1] ^ AppleTCONDP855Device::computeCRC(unsigned char const*,unsigned int)::crc8Table[a2[v3 + 2] ^ AppleTCONDP855Device::computeCRC(unsigned char const*,unsigned int)::crc8Table[(a2[v3 + 3] ^ result)]]]];
    v3 += 4;
  }
  while (v3 < a3);
  return result;
}

uint64_t AppleTCONDP855Device::waitForDeviceReady(AppleTCONDP855Device *this)
{
  uint64_t result = IOAVDisplayMemoryRead();
  if (!result) {
    return 0;
  }
  return result;
}

uint64_t AppleTCONDP855Device::waitForCompletion(AppleTCONDP855Device *this)
{
  uint64_t result = AppleTCONDP855Device::waitForDeviceReady(this);
  if (!result)
  {
    uint64_t result = IOAVDisplayMemoryRead();
    if (!result)
    {
      IOAVDisplayMemoryRead();
      AppleTCONLoggingLogMsg((uint64_t)"Wait Code: 0x%02x 0x%02x", v2, v3, v4, v5, v6, v7, v8, 0);
      return 3758097084;
    }
  }
  return result;
}

uint64_t AppleTCONDP855Device::getDeviceID(AppleTCONDP855Device *this, unsigned __int8 *a2, unsigned int a3)
{
  if (a3 < 6) {
    return 3758097090;
  }
  uint64_t result = AppleTCONDevice::getIORegPropertyValue(this, @"device-id", a2, 6);
  if (result)
  {
    return IOAVDisplayMemoryRead();
  }
  return result;
}

uint64_t AppleTCONDP855Device::getBundleVer(AppleTCONDP855Device *this, unsigned __int8 *a2)
{
  uint64_t result = AppleTCONDP855Device::getBundleVerFromIOReg(this, a2);
  if (result)
  {
    return IOAVDisplayMemoryRead();
  }
  return result;
}

uint64_t AppleTCONDP855Device::getBundleVerFromIOReg(AppleTCONDP855Device *this, unsigned __int8 *a2)
{
  *(_DWORD *)uint64_t v4 = 0;
  uint64_t result = AppleTCONDevice::getIORegPropertyValue(this, @"bundle-ver", v4, 4);
  if (!result) {
    *(_WORD *)a2 = *(_WORD *)v4;
  }
  return result;
}

uint64_t AppleTCONDP855Device::getFirmwareVer(AppleTCONDP855Device *this, unsigned __int8 *a2)
{
  uint64_t result = AppleTCONDP855Device::getFirmwareVerFromIOReg(this, a2);
  if (result)
  {
    return IOAVDisplayMemoryRead();
  }
  return result;
}

uint64_t AppleTCONDP855Device::getFirmwareVerFromIOReg(AppleTCONDP855Device *this, unsigned __int8 *a2)
{
  *(_DWORD *)uint64_t v4 = 0;
  uint64_t result = AppleTCONDevice::getIORegPropertyValue(this, @"firmware-ver", v4, 4);
  if (!result) {
    *(_WORD *)a2 = *(_WORD *)v4;
  }
  return result;
}

uint64_t AppleTCONDP855Device::sendDataBuffer(AppleTCONDP855Device *this, const unsigned __int8 *a2, unsigned int a3)
{
  if (a3 > 0x10) {
    return 3758097090;
  }
  uint64_t result = IOAVDisplayMemoryWrite();
  if (a3 >= 9 && !result)
  {
    return IOAVDisplayMemoryWrite();
  }
  return result;
}

uint64_t AppleTCONDP855Device::readDataBuffer(AppleTCONDP855Device *this, const unsigned __int8 *a2, unsigned int a3)
{
  if (a3 > 0x10) {
    return 3758097090;
  }
  uint64_t result = IOAVDisplayMemoryRead();
  if (!result)
  {
    uint64_t result = IOAVDisplayMemoryRead();
    if (a3 >= 9 && !result) {
      return IOAVDisplayMemoryRead();
    }
  }
  return result;
}

uint64_t AppleTCONDP855Device::submitCmd(AppleTCONDP855Device *this)
{
  usleep(0x1388u);
  uint64_t result = IOAVDisplayMemoryWrite();
  if (!result)
  {
    usleep(0x1388u);
    return AppleTCONDP855Device::waitForCompletion(this);
  }
  return result;
}

uint64_t AppleTCONDP855Device::sendCmd(AppleTCONDP855Device *a1, char *a2, const unsigned __int8 *a3, unsigned int a4)
{
  uint64_t result = AppleTCONDP855Device::waitForDeviceReady(a1);
  if (!result)
  {
    uint64_t result = IOAVDisplayMemoryWrite();
    if (!result)
    {
      if (!a4
        || (*a2 & 0x80000000) == 0
        || (uint64_t result = AppleTCONDP855Device::sendDataBuffer(a1, a3, a4), !result))
      {
        uint64_t result = IOAVDisplayMemoryWrite();
        if (!result)
        {
          uint64_t result = AppleTCONDP855Device::submitCmd(a1);
          if (!result)
          {
            usleep(0x2710u);
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t AppleTCONDP855Device::getSDOMStatus(AppleTCONDP855Device *this, BOOL *a2)
{
  *(_DWORD *)uint64_t v5 = 0;
  uint64_t result = AppleTCONDevice::getIORegPropertyValue(this, @"sdom-status", v5, 4);
  if (result) {
    return AppleTCONDP855Device::getSDOMStatusFromDevice(this, a2);
  }
  *a2 = v5[0];
  return result;
}

uint64_t AppleTCONDP855Device::getSDOMStatusFromDevice(AppleTCONDP855Device *this, BOOL *a2)
{
  int v12 = 69378;
  uint64_t result = AppleTCONDP855Device::sendCmd(this, (char *)&v12, 0, 0);
  if (!result)
  {
    uint64_t result = IOAVDisplayMemoryRead();
    if (!result)
    {
      if (*a2 == 32) {
        uint64_t v11 = "OTP_STATUS_PROGRAMMED";
      }
      else {
        uint64_t v11 = "OTP_STATUS_UNPROGRAMMED";
      }
      AppleTCONLoggingLogMsg((uint64_t)"SDOM status %s", v4, v5, v6, v7, v8, v9, v10, (char)v11);
      uint64_t result = 0;
      *a2 = *a2 == 32;
    }
  }
  return result;
}

uint64_t AppleTCONDP855Device::getPRODStatus(AppleTCONDP855Device *this, BOOL *a2)
{
  *(_DWORD *)uint64_t v5 = 0;
  uint64_t result = AppleTCONDevice::getIORegPropertyValue(this, @"prod-status", v5, 4);
  if (result) {
    return AppleTCONDP855Device::getPRODStatusFromDevice(this, a2);
  }
  *a2 = v5[0];
  return result;
}

uint64_t AppleTCONDP855Device::getPRODStatusFromDevice(AppleTCONDP855Device *this, BOOL *a2)
{
  int v12 = 134914;
  uint64_t result = AppleTCONDP855Device::sendCmd(this, (char *)&v12, 0, 0);
  if (!result)
  {
    uint64_t result = IOAVDisplayMemoryRead();
    if (!result)
    {
      if (*a2 == 32) {
        uint64_t v11 = "OTP_STATUS_PROGRAMMED";
      }
      else {
        uint64_t v11 = "OTP_STATUS_UNPROGRAMMED";
      }
      AppleTCONLoggingLogMsg((uint64_t)"PROD status %s", v4, v5, v6, v7, v8, v9, v10, (char)v11);
      uint64_t result = 0;
      *a2 = *a2 == 32;
    }
  }
  return result;
}

uint64_t AppleTCONDP855Device::setSdom(AppleTCONDP855Device *this)
{
  int v12 = 1118083;
  uint64_t v1 = AppleTCONDP855Device::sendCmd(this, (char *)&v12, 0, 0);
  if (v1)
  {
    uint64_t v9 = v1;
  }
  else
  {
    uint64_t v10 = IOAVDisplayMemoryRead();
    if (v10)
    {
      uint64_t v9 = v10;
    }
    else
    {
      AppleTCONLoggingLogMsg((uint64_t)"setSdom: update (getDeviceStatus) error:0x%x", v2, v3, v4, v5, v6, v7, v8, 0);
      uint64_t v9 = 3758097098;
    }
  }
  AppleTCONLoggingLogMsg((uint64_t)"setSdom: update failed:0x%x phase:%d", v2, v3, v4, v5, v6, v7, v8, v9);
  return v9;
}

uint64_t AppleTCONDP855Device::setProd(AppleTCONDP855Device *this)
{
  int v12 = 1183619;
  uint64_t v1 = AppleTCONDP855Device::sendCmd(this, (char *)&v12, 0, 0);
  if (v1)
  {
    uint64_t v9 = v1;
  }
  else
  {
    uint64_t v10 = IOAVDisplayMemoryRead();
    if (v10)
    {
      uint64_t v9 = v10;
    }
    else
    {
      AppleTCONLoggingLogMsg((uint64_t)"setProd: update (getDeviceStatus) error:0x%x", v2, v3, v4, v5, v6, v7, v8, 0);
      uint64_t v9 = 3758097098;
    }
  }
  AppleTCONLoggingLogMsg((uint64_t)"setProd: update failed:0x%x phase:%d", v2, v3, v4, v5, v6, v7, v8, v9);
  return v9;
}

uint64_t AppleTCONDP855Device::getECID(AppleTCONDP855Device *this, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t result = AppleTCONDevice::getIORegPropertyValue(this, @"ecid", a2, a3);
  if (result)
  {
    return AppleTCONDP855Device::getECIDFromDevice(this, a2, a3);
  }
  return result;
}

uint64_t AppleTCONDP855Device::getECIDFromDevice(AppleTCONDP855Device *this, unsigned __int8 *a2, unsigned int a3)
{
  int v7 = 27;
  uint64_t result = AppleTCONDP855Device::sendCmd(this, (char *)&v7, 0, 0);
  if (!result)
  {
    return AppleTCONDP855Device::readDataBuffer(this, a2, a3);
  }
  return result;
}

uint64_t AppleTCONDP855Device::displayECID(AppleTCONDP855Device *this, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  memset(v15, 0, sizeof(v15));
  if (a3)
  {
    uint64_t v8 = a3;
    uint64_t v9 = a2;
    int v10 = 0;
    int v11 = 64;
    while (1)
    {
      int v12 = snprintf((char *)v15 + v10, v11, "%02x", *v9);
      if (v12 < 0) {
        break;
      }
      BOOL v13 = __OFSUB__(v11, v12);
      v11 -= v12;
      if ((v11 < 0) ^ v13 | (v11 == 0)) {
        break;
      }
      ++v9;
      v10 += v12;
      if (!--v8) {
        goto LABEL_6;
      }
    }
    AppleTCONLoggingLogMsg((uint64_t)"displayECID: Avoid buffer overflow %d\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v12);
    return 3758097084;
  }
  else
  {
LABEL_6:
    AppleTCONLoggingLogMsg((uint64_t)"AppleTconDev:ECID: 0x%s", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (char)v15);
    return 0;
  }
}

uint64_t AppleTCONDP855Device::getNonce(AppleTCONDP855Device *this, unsigned __int8 *a2, int a3)
{
  uint64_t result = AppleTCONDevice::getIORegPropertyValue(this, @"nonce", a2, a3);
  if (result)
  {
    return AppleTCONDP855Device::getNonceFromDevice(this, a2, a3);
  }
  return result;
}

uint64_t AppleTCONDP855Device::getNonceFromDevice(AppleTCONDP855Device *this, unsigned __int8 *a2, int a3)
{
  int v7 = 29;
  uint64_t result = AppleTCONDP855Device::sendCmd(this, (char *)&v7, 0, 0);
  if (!result)
  {
    return AppleTCONDP855Device::readMultiPacketData(this, a2, a3);
  }
  return result;
}

uint64_t AppleTCONDP855Device::readMultiPacketData(AppleTCONDP855Device *this, const unsigned __int8 *a2, int a3)
{
  if (a3)
  {
    uint64_t result = IOAVDisplayMemoryRead();
    if (result) {
      return result;
    }
    for (unsigned int i = 0; i < 0x61A81; i += 100)
    {
      usleep(0x64u);
      uint64_t result = IOAVDisplayMemoryRead();
      if (result) {
        return result;
      }
    }
    AppleTCONLoggingLogMsg((uint64_t)"Timeout Error: out status : %x", v5, v6, v7, v8, v9, v10, v11, 0);
  }
  return AppleTCONDP855Device::waitForCompletion(this);
}

uint64_t AppleTCONDP855Device::getProdFuseValue(AppleTCONDP855Device *this, unsigned __int8 *a2)
{
  *(_DWORD *)uint64_t v5 = 0;
  uint64_t result = AppleTCONDevice::getIORegPropertyValue(this, @"prod-fuse-value", v5, 4);
  if (result) {
    return AppleTCONDP855Device::getProdFuseValueFromDevice(this, a2);
  }
  *a2 = v5[0];
  return result;
}

uint64_t AppleTCONDP855Device::getProdFuseValueFromDevice(AppleTCONDP855Device *this, unsigned __int8 *a2)
{
  uint64_t result = IOAVDisplayMemoryRead();
  *a2 = 0;
  return result;
}

uint64_t AppleTCONDP855Device::writeMultiPacketData(AppleTCONDP855Device *this, const unsigned __int8 *a2, unsigned int a3)
{
  if (!a3) {
    return AppleTCONDP855Device::waitForCompletion(this);
  }
  unsigned int v4 = a3;
  while (1)
  {
    uint64_t result = AppleTCONDP855Device::waitForDeviceReady(this);
    if (result) {
      break;
    }
    unsigned int v7 = v4 >= 0x10 ? 16 : v4;
    uint64_t result = AppleTCONDP855Device::sendDataBuffer(this, a2, v7);
    if (result) {
      break;
    }
    uint64_t result = IOAVDisplayMemoryWrite();
    if (!result)
    {
      a2 += v7;
      v4 -= v7;
      if (v4) {
        continue;
      }
    }
    if (result) {
      return result;
    }
    return AppleTCONDP855Device::waitForCompletion(this);
  }
  return result;
}

uint64_t AppleTCONDP855Device::downloadComponentBlock(AppleTCONDP855Device *a1, int a2, char a3, char a4, unsigned __int8 *a5, unsigned int a6)
{
  int v11 = 0;
  if (a2)
  {
    char v9 = -104;
  }
  else
  {
    BYTE2(v11) = a3;
    char v9 = -102;
  }
  LOBYTE(v11) = v9;
  BYTE1(v11) = a4;
  HIBYTE(v11) = AppleTCONDP855Device::computeCRC(a1, a5, a6);
  uint64_t result = AppleTCONDP855Device::sendCmd(a1, (char *)&v11, 0, 0);
  if (!result)
  {
    uint64_t result = AppleTCONDP855Device::writeMultiPacketData(a1, a5, a6);
    if (!result)
    {
      LODWORD(result) = IOAVDisplayMemoryRead();
      if (result) {
        return result;
      }
      else {
        return 3758097084;
      }
    }
  }
  return result;
}

uint64_t AppleTCONDP855Device::downloadComponentImage(AppleTCONDP855Device *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = a5;
  char v10 = a3;
  int v11 = a2;
  unsigned int v13 = a5 + 4095;
  unsigned int v14 = (a5 + 4095) >> 12;
  AppleTCONLoggingLogMsg((uint64_t)"Download comp:0x%04x NumBlocks:%d", a2, a3, a4, a5, a6, a7, a8, a3);
  if (v13 < 0x1000) {
    return 0;
  }
  int v15 = 0;
  unsigned int v16 = 0;
  if (v14 <= 1) {
    int v17 = 1;
  }
  else {
    int v17 = v14;
  }
  while (1)
  {
    unsigned int v18 = v8 >= 0x1000 ? 4096 : v8;
    uint64_t v19 = AppleTCONDP855Device::downloadComponentBlock(a1, v11, v10, v15, (unsigned __int8 *)(a4 + v16), v18);
    if (v19) {
      break;
    }
    v16 += v18;
    v8 -= v18;
    if (v17 == ++v15) {
      return 0;
    }
  }
  uint64_t v27 = v19;
  AppleTCONLoggingLogMsg((uint64_t)"Component Download Failed:Block:%d:length:%d!", v20, v21, v22, v23, v24, v25, v26, v15);
  if (IOAVDisplayMemoryRead())
  {
    uint64_t v35 = "Could not read error code";
  }
  else
  {
    char v37 = 0;
    uint64_t v35 = "Error code 0x%02x!";
  }
  AppleTCONLoggingLogMsg((uint64_t)v35, v28, v29, v30, v31, v32, v33, v34, v37);
  return v27;
}

uint64_t AppleTCONDP855Device::getLifeCycle(AppleTCONDP855Device *this, const __CFDictionary *a2, unsigned int *a3)
{
  if (!CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"Options.LifeCycle"))
  {
    uint64_t v6 = "memory alloc failed";
    uint64_t v7 = 3;
LABEL_11:
    AMSupportSafeRelease();
    AppleTCONLoggingLogMsg((uint64_t)"getLifeCycle %s", v9, v10, v11, v12, v13, v14, v15, (char)v6);
    return v7;
  }
  CFDataRef ValueForKeyPathInDict = (const void *)AMSupportGetValueForKeyPathInDict();
  if (ValueForKeyPathInDict)
  {
    CFTypeID v5 = CFGetTypeID(ValueForKeyPathInDict);
    if (v5 == CFNumberGetTypeID())
    {
      if (AMSupportGetUInt32())
      {
        uint64_t v6 = "conversion error";
        uint64_t v7 = 11;
      }
      else
      {
        uint64_t v6 = "out of range";
        uint64_t v7 = 2;
      }
    }
    else
    {
      uint64_t v6 = "invalid type";
      uint64_t v7 = 17;
    }
    goto LABEL_11;
  }
  *a3 = 15;
  AMSupportSafeRelease();
  return 0;
}

const __CFBoolean *AppleTCONDP855Device::getOptionsValue(AppleTCONDP855Device *this, const __CFDictionary *a2, const __CFString *a3)
{
  CFStringRef v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"Options.%@", a3);
  if (!v3) {
    return 0;
  }
  CFStringRef v4 = v3;
  CFBooleanRef ValueForKeyPathInDict = (const __CFBoolean *)AMSupportGetValueForKeyPathInDict();
  CFBooleanRef Value = ValueForKeyPathInDict;
  if (ValueForKeyPathInDict)
  {
    CFTypeID v7 = CFGetTypeID(ValueForKeyPathInDict);
    if (v7 == CFBooleanGetTypeID()) {
      CFBooleanRef Value = (const __CFBoolean *)CFBooleanGetValue(Value);
    }
    else {
      CFBooleanRef Value = 0;
    }
  }
  CFRelease(v4);
  return Value;
}

uint64_t AppleTCONDP855Device::isOTPUpdateRequired(AppleTCONDP855Device *this, const __CFDictionary *a2)
{
  OptionsCFBooleanRef Value = AppleTCONDP855Device::getOptionsValue(this, a2, @"FuseSDOM");
  uint64_t v11 = *((unsigned __int8 *)this + 8);
  if (OptionsValue) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  uint64_t v13 = v12;
  AppleTCONLoggingLogMsg((uint64_t)"Fuse SDOM (%d:%d)", v4, v5, v6, v7, v8, v9, v10, v11);
  return v13;
}

uint64_t AppleTCONDP855Device::updateOTP(AppleTCONDP855Device *this, const __CFDictionary *a2)
{
  OptionsCFBooleanRef Value = AppleTCONDP855Device::getOptionsValue(this, a2, @"FusePROD");
  AppleTCONLoggingLogMsg((uint64_t)"Fuse Prod (%d:%d)", v4, v5, v6, v7, v8, v9, v10, *((unsigned char *)this + 9));
  if (OptionsValue) {
    BOOL v11 = *((unsigned char *)this + 9) == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (!v11 || (uint64_t result = AppleTCONDP855Device::setProd(this), !result))
  {
    return AppleTCONDP855Device::setSdom(this);
  }
  return result;
}

void AppleTCONDP855Device::AppleTCONDP855Device(AppleTCONDP855Device *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)this = &unk_26EF78548;
  unsigned __int8 v22 = 0;
  *(_WORD *)uint64_t v21 = 0;
  *((_DWORD *)this + 2) = 257;
  *((_DWORD *)this + 6) = a2;
  if (!a2) {
    AppleTCONLoggingLogMsg((uint64_t)"Failed to getIORegRootNode. Will Attempt fallback.", a2, a3, a4, a5, a6, a7, a8, v20);
  }
  uint64_t v9 = IOAVDisplayMemoryCreateWithName();
  *((void *)this + 2) = v9;
  if (v9)
  {
    if (AppleTCONDP855Device::getPRODStatus(this, (BOOL *)&v22))
    {
      int v17 = "Failed to get Prod status";
    }
    else
    {
      BOOL v18 = v22 == 1;
      *((unsigned char *)this + 9) = v18;
      if (v18)
      {
        if (AppleTCONDP855Device::getProdFuseValue(this, &v22))
        {
          int v17 = "Failed to get Prod value";
          goto LABEL_18;
        }
        unsigned __int8 v19 = v22;
      }
      else
      {
        unsigned __int8 v19 = 0;
      }
      *((unsigned char *)this + 30) = v19;
      if (AppleTCONDP855Device::getSDOMStatus(this, (BOOL *)&v22))
      {
        int v17 = "Failed to get SDOM status";
      }
      else
      {
        *((unsigned char *)this + 8) = v22 == 1;
        if (AppleTCONDP855Device::getBundleVer(this, v21))
        {
          int v17 = "Failed to get bundle version";
        }
        else
        {
          *((_WORD *)this + 14) = *(_WORD *)v21;
          if (!AppleTCONDP855Device::getFirmwareVer(this, v21))
          {
            *((unsigned char *)this + 11) = __rev16(*(unsigned __int16 *)v21) > 0x10B;
            goto LABEL_19;
          }
          int v17 = "Failed to get Firmware version";
        }
      }
    }
  }
  else
  {
    int v17 = "Failed to get memoryRef handle";
  }
LABEL_18:
  AppleTCONLoggingLogMsg((uint64_t)v17, v10, v11, v12, v13, v14, v15, v16, v20);
LABEL_19:
  AppleTCONLoggingLogMsg((uint64_t)"AppleTconDev(v2):(%d:%d:%d:%d:0x%02x:0x%02x(0x%04x))", v10, v11, v12, v13, v14, v15, v16, *((unsigned char *)this + 11));
}

void sub_23BEA185C(_Unwind_Exception *a1)
{
  *uint64_t v1 = &unk_26EF78498;
  _Unwind_Resume(a1);
}

void AppleTCONDP855Device::~AppleTCONDP855Device(AppleTCONDP855Device *this)
{
  *(void *)this = &unk_26EF78548;
  io_object_t v2 = *((_DWORD *)this + 6);
  if (v2) {
    IOObjectRelease(v2);
  }
  *(void *)this = &unk_26EF78498;
}

{
  uint64_t vars8;

  AppleTCONDP855Device::~AppleTCONDP855Device(this);

  JUMPOUT(0x23ECD6040);
}

uint64_t AppleTCONDP855Device::eventCmdQueryInfo(AppleTCONDP855Device *this, const __CFDictionary *a2, __CFDictionary *a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  *(void *)uint64_t v42 = 0;
  uint64_t v43 = 0;
  *(_OWORD *)bytes = 0u;
  long long v41 = 0u;
  unsigned int v39 = 0;
  ECID = (AppleTCONDP855Device *)AppleTCONDP855Device::getECID(this, v42, 0x10u);
  int v12 = (int)ECID;
  if (!ECID) {
    ECID = (AppleTCONDP855Device *)AppleTCONDP855Device::displayECID(ECID, v42, 16, v7, v8, v9, v10, v11);
  }
  if (!*((unsigned char *)this + 8) && !AppleTCONDP855Device::getOptionsValue(ECID, a2, @"FuseSDOM"))
  {
    AppleTCONLoggingLogMsg((uint64_t)"Dev:CmdQueryInfo SDOM not fused. No Fusing option. Bailing.", v13, v14, v15, v16, v17, v18, v19, v38);
    uint64_t v27 = 0;
    *((unsigned char *)this + 10) = 1;
    return v27;
  }
  if (*((unsigned char *)this + 11))
  {
    if (AppleTCONDP855Device::getNonce(this, bytes, 32))
    {
      char v37 = "getNonce failed";
    }
    else
    {
      uint64_t v27 = 3758097085;
      CFAllocatorRef v28 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFDataRef v29 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, 32);
      if (!v29)
      {
        char v37 = "nonce alloc failed";
        goto LABEL_22;
      }
      CFDataRef v30 = v29;
      CFDictionaryAddValue(a3, @"Baobab,UpdateNonce", v29);
      CFRelease(v30);
      if (!v12)
      {
        CFDataRef v31 = CFDataCreate(v28, v42, 16);
        if (v31)
        {
          CFDataRef v32 = v31;
          CFDictionaryAddValue(a3, @"Baobab,ECID", v31);
          CFRelease(v32);
          AppleTCONDP855Device::getOptionsValue(v33, a2, @"FusePROD");
          AMSupportCFDictionarySetBoolean();
          uint64_t v34 = (AppleTCONDP855Device *)AMSupportCFDictionarySetInteger32();
          uint64_t LifeCycle = AppleTCONDP855Device::getLifeCycle(v34, a2, &v39);
          uint64_t v27 = LifeCycle;
          if (!LifeCycle)
          {
            AMSupportCFDictionarySetInteger32();
            return v27;
          }
          char v37 = "getLifeCycle failed";
        }
        else
        {
          char v37 = "ecid alloc failed";
        }
LABEL_22:
        AppleTCONLoggingLogMsg((uint64_t)"Dev:CmdQueryInfo failure %s", v20, v21, v22, v23, v24, v25, v26, (char)v37);
        return v27;
      }
      char v37 = "getECID failed";
    }
    uint64_t v27 = 15;
    goto LABEL_22;
  }
  return 0;
}

uint64_t AppleTCONDP855Device::isFWComponentsUpdateRequired(AppleTCONDP855Device *this, const __CFDictionary *a2, CFDictionaryRef theDict, unsigned __int8 *a4)
{
  __int16 valuePtr = 0;
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(theDict, @"FirmwareData");
  CFDataRef v15 = Value;
  if (!Value || (CFTypeID v16 = CFGetTypeID(Value), v16 != CFDataGetTypeID()))
  {
    uint64_t v43 = "firmware data type invalid ";
    goto LABEL_19;
  }
  CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFPropertyListRef v18 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], v15, 0, 0, 0);
  if (!v18 || (CFTypeID v19 = CFGetTypeID(v18), v19 != CFDictionaryGetTypeID()))
  {
    uint64_t v43 = "fw dict create failed";
LABEL_19:
    AppleTCONLoggingLogMsg((uint64_t)"FW component update :%s", v8, v9, v10, v11, v12, v13, v14, (char)v43);
    uint64_t v41 = 0;
    goto LABEL_13;
  }
  if (!CFStringCreateWithFormat(v17, 0, @"1.%s.%s.%s.%s", "device_id", a4, "NVM_IMAGE", "Version"))
  {
    uint64_t v43 = "nvm ver string create failed";
    goto LABEL_19;
  }
  CFNumberRef ValueForKeyPathInDict = (const __CFNumber *)AMSupportGetValueForKeyPathInDict();
  if (!ValueForKeyPathInDict
    || (CFNumberRef v21 = ValueForKeyPathInDict, v22 = CFGetTypeID(ValueForKeyPathInDict), v22 != CFNumberGetTypeID()))
  {
    uint64_t v43 = "bundle version type invalid";
    goto LABEL_19;
  }
  uint64_t v23 = (AppleTCONDP855Device *)CFNumberGetValue(v21, kCFNumberSInt16Type, &valuePtr);
  if (!v23)
  {
    uint64_t v43 = "bundle ver: num: invalid";
    goto LABEL_19;
  }
  OptionsCFDataRef Value = AppleTCONDP855Device::getOptionsValue(v23, a2, @"RestoreInternal");
  int v25 = (int)OptionsValue;
  unsigned int v26 = AppleTCONDP855Device::getOptionsValue(OptionsValue, a2, @"SkipSameVersion");
  AppleTCONLoggingLogMsg((uint64_t)"FW Update Options I:%d S:%d", v27, v28, v29, v30, v31, v32, v33, v25);
  if (__PAIR64__(*((unsigned __int8 *)this + 29), *((unsigned __int8 *)this + 28)) != __PAIR64__(valuePtr, HIBYTE(valuePtr))|| (uint64_t v41 = 0, v25) && !v26)
  {
    AppleTCONLoggingLogMsg((uint64_t)"Update to 0x%02x:0x%02x", v34, v35, v36, v37, v38, v39, v40, SHIBYTE(valuePtr));
    uint64_t v41 = 1;
  }
LABEL_13:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return v41;
}

uint64_t AppleTCONDP855Device::updateFWComponents(AppleTCONDP855Device *this, const __CFDictionary *a2, unsigned __int8 *a3)
{
  uint64_t v4 = 3758097088;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  AMSupportGetValueForKeyPathInDict();
  CFDataRef v13 = (const __CFData *)AMSupportSafeRetain();
  if (!v13)
  {
    uint64_t v37 = "ticket missing";
    goto LABEL_26;
  }
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(a2, @"FirmwareData");
  if (!Value || (CFDataRef v15 = Value, v16 = CFGetTypeID(Value), v16 != CFDataGetTypeID()))
  {
    uint64_t v37 = "firmware missing";
    goto LABEL_26;
  }
  CFPropertyListRef v17 = CFPropertyListCreateWithData(v5, v15, 0, 0, 0);
  if (!v17 || (CFTypeID v18 = CFGetTypeID(v17), v18 != CFDictionaryGetTypeID()))
  {
    uint64_t v37 = "firmware dict: create failed";
    goto LABEL_26;
  }
  if (!CFStringCreateWithFormat(v5, 0, @"1.firmware.Payload"))
  {
    uint64_t v37 = "comp: key create failed";
    goto LABEL_26;
  }
  AMSupportGetValueForKeyPathInDict();
  CFDataRef v19 = (const __CFData *)AMSupportSafeRetain();
  CFDataRef v20 = v19;
  if (!v19)
  {
    uint64_t v37 = "comp: data missing";
    goto LABEL_26;
  }
  size_t v21 = CFDataGetLength(v19) + 4096;
  CFTypeID v22 = (UInt8 *)malloc_type_malloc(v21, 0x3249B97uLL);
  uint64_t v23 = v22;
  if (!v22)
  {
    uint64_t v4 = 3;
    uint64_t v37 = "alloc: failed";
    goto LABEL_26;
  }
  memset(v22, 255, v21);
  v40.length = CFDataGetLength(v13);
  v40.location = 0;
  CFDataGetBytes(v13, v40, v23);
  v41.length = CFDataGetLength(v20);
  v41.location = 0;
  CFDataGetBytes(v20, v41, v23 + 4096);
  if (AppleTCONDP855Device::downloadComponentImage(this, 1, 0, (uint64_t)v23, v21, v24, v25, v26))
  {
    uint64_t v4 = 11;
    uint64_t v37 = "download fw failed";
    goto LABEL_26;
  }
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  uint64_t v27 = 0;
  while (1)
  {
    if (!CFStringCreateWithFormat(v5, 0, @"1.%s.%s.%s.%s", "device_id", a3, *(void *)((char *)&componentHdrmap + v27 + 8), "Payload"))
    {
      uint64_t v4 = 0;
      uint64_t v37 = "comp: string create failed";
      goto LABEL_26;
    }
    AMSupportGetValueForKeyPathInDict();
    CFDataRef v28 = (const __CFData *)AMSupportSafeRetain();
    if (!v28) {
      goto LABEL_20;
    }
    CFDataRef v29 = v28;
    CFIndex Length = CFDataGetLength(v28);
    uint64_t v31 = Length;
    if (v21 >= Length)
    {
      CFIndex v32 = Length;
      goto LABEL_18;
    }
    free(v23);
    CFIndex v32 = v31;
    uint64_t v23 = (UInt8 *)malloc_type_calloc(1uLL, v31, 0x1E405118uLL);
    if (!v23) {
      break;
    }
    LODWORD(v21) = v31;
LABEL_18:
    v42.location = 0;
    v42.length = v32;
    CFDataGetBytes(v29, v42, v23);
    if (AppleTCONDP855Device::downloadComponentImage(this, 0, *(unsigned int *)((char *)&componentHdrmap + v27), (uint64_t)v23, v31, v33, v34, v35))
    {
      uint64_t v4 = 11;
      uint64_t v37 = "download comp: failed";
      goto LABEL_26;
    }
    AMSupportSafeRelease();
LABEL_20:
    AMSupportSafeRelease();
    v27 += 16;
    if (v27 == 176)
    {
      uint64_t v4 = 0;
      goto LABEL_22;
    }
  }
  uint64_t v4 = 3;
  uint64_t v37 = "re alloc failed";
LABEL_26:
  AppleTCONLoggingLogMsg((uint64_t)"update fw error:%s", v6, v7, v8, v9, v10, v11, v12, (char)v37);
LABEL_22:
  AMSupportSafeFree();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return v4;
}

uint64_t AppleTCONDP855Device::eventCmdPerformNextStage(AppleTCONDP855Device *this, const __CFDictionary *a2, const __CFDictionary *a3, unsigned __int8 *a4)
{
  *(_DWORD *)&v21[3] = 0;
  *(_DWORD *)size_t v21 = 0;
  if (AppleTCONDP855Device::getDeviceID(this, v21, 7u))
  {
    CFDataRef v19 = "get dev:id failed";
LABEL_20:
    *((unsigned char *)this + 10) = 1;
    *a4 = 1;
    AppleTCONLoggingLogMsg((uint64_t)"Dev:next stage failure %s", v8, v9, v10, v11, v12, v13, v14, (char)v19);
    uint64_t v17 = 11;
    goto LABEL_13;
  }
  AppleTCONLoggingLogMsg((uint64_t)"Dev:deviceid %s", v8, v9, v10, v11, v12, v13, v14, (char)v21);
  int isFWComponentsUpdateRequired = AppleTCONDP855Device::isFWComponentsUpdateRequired(this, a2, a3, v21);
  if (*((unsigned char *)this + 10) || !isFWComponentsUpdateRequired) {
    goto LABEL_12;
  }
  int v22 = 156;
  if (AppleTCONDP855Device::sendCmd(this, (char *)&v22, v21, 6u))
  {
    CFDataRef v19 = "submit dev:id failed";
    goto LABEL_20;
  }
  int v22 = 151;
  if (AppleTCONDP855Device::sendCmd(this, (char *)&v22, 0, 0))
  {
    CFDataRef v19 = "start update failed";
    goto LABEL_20;
  }
  if (AppleTCONDP855Device::updateFWComponents(this, a3, v21))
  {
    CFDataRef v19 = "updates failed";
    goto LABEL_20;
  }
  if (AppleTCONDP855Device::isOTPUpdateRequired(this, a2))
  {
    if (AppleTCONDP855Device::updateOTP(this, a2))
    {
      CFDataRef v19 = "otp update failed";
      goto LABEL_20;
    }
    char v16 = 1;
  }
  else
  {
    char v16 = 2;
  }
  int v22 = 153;
  BYTE1(v22) = v16;
  AppleTCONLoggingLogMsg((uint64_t)"Reset option %d", v8, v9, v10, v11, v12, v13, v14, v16);
  if (AppleTCONDP855Device::sendCmd(this, (char *)&v22, 0, 0))
  {
    CFDataRef v19 = "end update failed";
    goto LABEL_20;
  }
LABEL_12:
  uint64_t v17 = 0;
  *((unsigned char *)this + 10) = 1;
  *a4 = 1;
LABEL_13:
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP855Device::eventCmdPerformNextStage: Finished Personalization", v8, v9, v10, v11, v12, v13, v14, v20);
  return v17;
}

__CFString *AppleTCONDP835DeviceRestoreTagForBoardID(int a1, int a2)
{
  if (a2 == 2)
  {
    int v2 = 0;
  }
  else
  {
    if (a2 != 3) {
      return 0;
    }
    int v2 = 1;
  }
  switch(a1)
  {
    case 0:
      CFStringRef v3 = kAppleTCONCommonTagRequestTicket;
      uint64_t v4 = kAppleTCON2CommonTagRequestTicket;
      break;
    case 1:
      CFStringRef v3 = kAppleTCONCommonTagResponseTicket;
      uint64_t v4 = kAppleTCON2CommonTagResponseTicket;
      break;
    case 2:
      CFStringRef v3 = kAppleTCONCommonTagDeviceChipID;
      uint64_t v4 = kAppleTCON2CommonTagDeviceChipID;
      break;
    case 3:
      CFStringRef v3 = kAppleTCONCommonTagDeviceBoardID;
      uint64_t v4 = kAppleTCON2CommonTagDeviceBoardID;
      break;
    case 4:
      CFStringRef v3 = kAppleTCONCommonTagManifestEpoch;
      uint64_t v4 = kAppleTCON2CommonTagManifestEpoch;
      break;
    case 5:
      CFStringRef v3 = kAppleTCONCommonTagDeviceProductionMode;
      uint64_t v4 = kAppleTCON2CommonTagDeviceProductionMode;
      break;
    case 6:
      CFStringRef v3 = kAppleTCONCommonTagDeviceProv;
      uint64_t v4 = kAppleTCON2CommonTagDeviceProv;
      break;
    case 7:
      CFStringRef v3 = kAppleTCONCommonTagDeviceSDOM;
      uint64_t v4 = kAppleTCON2CommonTagDeviceSDOM;
      break;
    case 8:
      CFStringRef v3 = kAppleTCONCommonTagDeviceNonce;
      uint64_t v4 = kAppleTCON2CommonTagDeviceNonce;
      break;
    case 9:
      CFStringRef v3 = kAppleTCONCommonTagDeviceUpdateNonce;
      uint64_t v4 = kAppleTCON2CommonTagDeviceUpdateNonce;
      break;
    case 10:
      CFStringRef v3 = kAppleTCONCommonTagDeviceECID;
      uint64_t v4 = kAppleTCON2CommonTagDeviceECID;
      break;
    case 11:
      CFStringRef v3 = kAppleTCONCommonTagDeviceInvariantFirmware;
      uint64_t v4 = kAppleTCON2CommonTagDeviceInvariantFirmware;
      break;
    case 12:
      CFStringRef v3 = kAppleTCONCommonTagDeviceBacklightControllerFirmware;
      uint64_t v4 = kAppleTCON2CommonTagDeviceBacklightControllerFirmware;
      break;
    case 13:
      CFStringRef v3 = kAppleTCONCommonTagDeviceCabalFirmware;
      uint64_t v4 = kAppleTCON2CommonTagDeviceCabalFirmware;
      break;
    case 14:
      CFStringRef v3 = kAppleTCONCommonTagDeviceTrinityFirmware;
      uint64_t v4 = kAppleTCON2CommonTagDeviceTrinityFirmware;
      break;
    default:
      return 0;
  }
  if (v2) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v3;
  }
  return *v6;
}

uint64_t AppleTCONUpdateController::AppleTCONUpdateControllerGetDevice(AppleTCONUpdateController *this)
{
  *(_DWORD *)buffer = 2133;
  mach_port_t v1 = *MEMORY[0x263F0EC88];
  io_registry_entry_t v2 = IORegistryEntryFromPath(*MEMORY[0x263F0EC88], "IODeviceTree:/product");
  if (v2)
  {
    io_object_t v3 = v2;
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v2, @"tcon-path", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    IOObjectRelease(v3);
    if (CFProperty)
    {
      CFTypeID v6 = CFGetTypeID(CFProperty);
      if (v6 == CFDataGetTypeID())
      {
        CFIndex Length = CFDataGetLength((CFDataRef)CFProperty);
        if (Length)
        {
          CFIndex v8 = Length;
          size_t v9 = Length + 14;
          uint64_t v10 = (char *)malloc_type_malloc(Length + 14, 0x9E1EE67CuLL);
          uint64_t v11 = v10;
          if (v10)
          {
            if (snprintf(v10, v9, "%s", "IODeviceTree:/") == 14)
            {
              v33.length = CFDataGetLength((CFDataRef)CFProperty);
              v33.location = 0;
              CFDataGetBytes((CFDataRef)CFProperty, v33, (UInt8 *)v11 + 14);
              v11[v8 + 13] = 0;
              AppleTCONLoggingLogMsg((uint64_t)"Looking for entry under %s\n", v12, v13, v14, v15, v16, v17, v18, (char)v11);
              io_registry_entry_t v19 = IORegistryEntryFromPath(v1, v11);
              if (v19)
              {
                CFDataRef v20 = (const __CFData *)IORegistryEntryCreateCFProperty(v19, @"chipid", v4, 0);
                CFDataRef v21 = v20;
                if (!v20
                  || (CFTypeID v22 = CFGetTypeID(v20), v22 != CFDataGetTypeID())
                  || CFDataGetLength(v21) != 4
                  || (v34.location = 0, v34.length = 4, CFDataGetBytes(v21, v34, buffer), *(_DWORD *)buffer == 2133))
                {
                  operator new();
                }
                if (*(_DWORD *)buffer == 2101) {
                  operator new();
                }
                LOBYTE(v31) = 0;
              }
              else
              {
                uint64_t v31 = "tcon device not found";
              }
            }
            else
            {
              uint64_t v31 = "overflow";
            }
          }
          else
          {
            uint64_t v31 = "Unable to allocate memory";
          }
        }
        else
        {
          uint64_t v31 = "Invalid string";
        }
      }
      else
      {
        uint64_t v31 = "product path type mismatch";
      }
    }
    else
    {
      uint64_t v31 = "product path not found";
    }
  }
  else
  {
    uint64_t v31 = "product not found";
  }
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeFree();
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONUpdateControllerGetDevice failed: %s", v23, v24, v25, v26, v27, v28, v29, (char)v31);
  return 0;
}

void sub_23BEA2810(_Unwind_Exception *a1)
{
  MEMORY[0x23ECD6040](v1, 0x10A1C408295CFC3);
  _Unwind_Resume(a1);
}

void AppleTCONUpdateController::AppleTCONUpdateController(AppleTCONUpdateController *this)
{
  *((void *)this + 3) = 0;
  uint64_t Device = AppleTCONUpdateController::AppleTCONUpdateControllerGetDevice(this);
  *((void *)this + 1) = Device;
  if (Device) {
    int v3 = *(unsigned __int8 *)(Device + 11);
  }
  else {
    int v3 = 0;
  }
  *((unsigned char *)this + 17) = v3;
  *((unsigned char *)this + 16) = v3 == 0;
}

uint64_t AppleTCONUpdateController::start(AppleTCONUpdateController *this, const __CFDictionary *a2, __CFError **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONUpdateController::start: Dev = (%p) - updateSupported = %d", (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8, *((void *)this + 1));
  if (*((void *)this + 1))
  {
    if (!a2) {
      return 0;
    }
    CFDictionaryRef v11 = (const __CFDictionary *)AMSupportSafeRetain();
    *((void *)this + 3) = v11;
    CFDataRef Value = CFDictionaryGetValue(v11, @"Options");
    if (Value)
    {
      CFTypeID v13 = CFGetTypeID(Value);
      if (v13 == CFDictionaryGetTypeID()) {
        return 0;
      }
    }
  }
  if (AppleTCONLoggingCreateCFErrorWithDomain((uint64_t)"RestoreOptions not a dict?", 2u, (uint64_t)a2, @"AppleTCONUpdaterErrorDomain"))
  {
    if (a3) {
      *a3 = (__CFError *)AMSupportSafeRetain();
    }
    AMSupportSafeRelease();
  }
  return 19;
}

uint64_t AppleTCONUpdateController::execCmdQueryInfo(AppleTCONUpdateController *this, const __CFDictionary *a2, const __CFDictionary **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONUpdateController::execCmdQueryInfo: Begin Personalization", (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8, v37);
  if (a3)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (Mutable)
    {
      CFMutableDictionaryRef v26 = Mutable;
      if (a2)
      {
        AppleTCONLoggingLogMsg((uint64_t)"AppleTCONUpdateController::execCmdQueryInfo: Input", v19, v20, v21, v22, v23, v24, v25, v38);
        AMSupportSafeRelease();
        uint64_t v27 = AMSupportSafeRetain();
        *((void *)this + 3) = v27;
      }
      else
      {
        uint64_t v27 = *((void *)this + 3);
      }
      uint64_t v28 = (*(uint64_t (**)(void, uint64_t, CFMutableDictionaryRef))(**((void **)this + 1) + 16))(*((void *)this + 1), v27, v26);
      if (v28)
      {
        CFRelease(v26);
        AppleTCONLoggingLogMsg((uint64_t)"AppleTCONUpdateController::execCmdQueryInfo: device failure %d", v29, v30, v31, v32, v33, v34, v35, v28);
      }
      else
      {
        *a3 = v26;
      }
    }
    else
    {
      AppleTCONLoggingLogMsg((uint64_t)"AppleTCONUpdateController::execCmdQueryInfo: create output dict: failed", v19, v20, v21, v22, v23, v24, v25, v38);
      return 3;
    }
  }
  else
  {
    AppleTCONLoggingLogMsg((uint64_t)"AppleTCONUpdateController::execCmdQueryInfo: Output param missing", v11, v12, v13, v14, v15, v16, v17, v38);
    return 2;
  }
  return v28;
}

uint64_t AppleTCONUpdateController::execPerformNextStage(AppleTCONUpdateController *this, const __CFDictionary *a2)
{
  uint64_t v2 = (*(uint64_t (**)(void, void, const __CFDictionary *, char *))(**((void **)this + 1) + 24))(*((void *)this + 1), *((void *)this + 3), a2, (char *)this + 16);
  uint64_t v10 = v2;
  if (v2) {
    AppleTCONLoggingLogMsg((uint64_t)"AppleTCONUpdateController::execCommand: device failure %d", v3, v4, v5, v6, v7, v8, v9, v2);
  }
  return v10;
}

uint64_t AppleTCONUpdateController::execCommand(AppleTCONUpdateController *this, CFStringRef theString, const __CFDictionary *a3, const __CFDictionary **a4)
{
  if (!theString) {
    return 2;
  }
  char CStringPtr = CFStringGetCStringPtr(theString, 0);
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONUpdateController::execCommand: Entering execCommand: command = %s", v9, v10, v11, v12, v13, v14, v15, CStringPtr);
  uint64_t v16 = 0;
  if (!*((unsigned char *)this + 16))
  {
    if (CFStringCompare(theString, @"queryInfo", 0))
    {
      if (CFStringCompare(theString, @"performNextStage", 0))
      {
        char v22 = CFStringGetCStringPtr(theString, 0);
        AppleTCONLoggingLogMsg((uint64_t)"AppleTCONUpdateController::execCommand: Unsupported command: %s", v23, v24, v25, v26, v27, v28, v29, v22);
        uint64_t v16 = 2;
        goto LABEL_9;
      }
      uint64_t Stage = AppleTCONUpdateController::execPerformNextStage(this, a3);
    }
    else
    {
      uint64_t Stage = AppleTCONUpdateController::execCmdQueryInfo(this, a3, a4, v17, v18, v19, v20, v21);
    }
    uint64_t v16 = Stage;
  }
LABEL_9:
  char v31 = CFStringGetCStringPtr(theString, 0);
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONUpdateController::execCommand: Exiting execCommand: command = %s, uint64_t result = 0x%X", v32, v33, v34, v35, v36, v37, v38, v31);
  return v16;
}

uint64_t AMSupportCFDictionarySetBoolean()
{
  return MEMORY[0x270F979A8]();
}

uint64_t AMSupportCFDictionarySetInteger32()
{
  return MEMORY[0x270F979B0]();
}

uint64_t AMSupportGetUInt32()
{
  return MEMORY[0x270F97A88]();
}

uint64_t AMSupportGetValueForKeyPathInDict()
{
  return MEMORY[0x270F97A90]();
}

uint64_t AMSupportSafeFree()
{
  return MEMORY[0x270F97B38]();
}

uint64_t AMSupportSafeRelease()
{
  return MEMORY[0x270F97B40]();
}

uint64_t AMSupportSafeRetain()
{
  return MEMORY[0x270F97B48]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
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

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
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

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

uint64_t IOAVDisplayMemoryCreateWithName()
{
  return MEMORY[0x270EF3EC0]();
}

uint64_t IOAVDisplayMemoryRead()
{
  return MEMORY[0x270EF3EC8]();
}

uint64_t IOAVDisplayMemoryWrite()
{
  return MEMORY[0x270EF3ED0]();
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x270EF49E8](*(void *)&mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
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
  return (void *)MEMORY[0x270F98ED8](a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t doPCDSUpdate()
{
  return MEMORY[0x270F964E8]();
}

void free(void *a1)
{
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}