uint64_t MKBSetDeviceConfigurations(const __CFData *a1, const __CFDictionary *a2)
{
  uint64_t v3;
  uint64_t vars8;

  handleToUse(a2);
  if (a1)
  {
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
  }
  v3 = aks_set_configuration();

  return convertAKSErrorToMKB(v3);
}

uint64_t MKBUserUnlockedSinceBoot(int a1)
{
  if (!a1 && gSystemUnlockedSinceBoot) {
    return 1;
  }
  uint64_t lock_state = aks_get_lock_state();
  if (convertAKSErrorToMKB(lock_state))
  {
    debuglog("MKBUserUnlockedSinceBoot", @"MKBUserUnlockedSinceBoot for user(%d) fails with error(%d), returning 0", v4, v5, v6, v7, v8, v9, a1);
    return 0;
  }
  else
  {
    uint64_t result = 0;
    if (!a1) {
      gSystemUnlockedSinceBoot = 0;
    }
  }
  return result;
}

__CFDictionary *MKBDeviceGetGracePeriod(const __CFDictionary *a1)
{
  uint64_t v1 = MKBGetDeviceConfigurations(a1);
  if (v1)
  {
    CFDictionaryRef v8 = (const __CFDictionary *)v1;
    dict = create_dict();
    Value = CFDictionaryGetValue(v8, @"GracePeriod");
    if (Value)
    {
      v11 = Value;
      CFTypeID v12 = CFGetTypeID(Value);
      if (v12 == CFNumberGetTypeID()) {
        CFDictionarySetValue(dict, @"GracePeriod", v11);
      }
    }
    CFRelease(v8);
  }
  else
  {
    debuglog("MKBDeviceGetGracePeriod", @"MKBGetDeviceConfigurations failed to return a dictionary", v2, v3, v4, v5, v6, v7, v14);
    return 0;
  }
  return dict;
}

uint64_t MKBGetDeviceConfigurations(const __CFDictionary *a1)
{
  handleToUse(a1);
  uint64_t configuration = aks_get_configuration();
  char v2 = convertAKSErrorToMKB(configuration);
  debuglog("MKBGetDeviceConfigurations", @"aks_get_configuration result: %d\n", v3, v4, v5, v6, v7, v8, v2);
  return 0;
}

void debuglog(const char *a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  memcpy(__dst, "Error creating CFString", sizeof(__dst));
  if (!a1) {
    a1 = "";
  }
  CFStringRef v11 = CFStringCreateWithFormatAndArguments(0, 0, a2, &a9);
  if (v11)
  {
    CFStringRef v12 = v11;
    CFStringGetCString(v11, __dst, 1024, 0x8000100u);
    CFRelease(v12);
  }
  snprintf(__str, 0x400uLL, "%s: %s", a1, __dst);
  if (_log_func)
  {
    _log_func(__str);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    char v14 = __str;
    _os_log_impl(&dword_1B8EA4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s\n", buf, 0xCu);
  }
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  memset(&v1, 0, 512);
  if (statfs("/var", &v1) >= 0) {
    return (v1.f_flags >> 7) & 1;
  }
  else {
    return 4294967290;
  }
}

__CFDictionary *MKBUserTypeDeviceMode(uint64_t a1, CFErrorRef *a2)
{
  uint32_t v22 = 0;
  dict = create_dict();
  int hostmultiuserconfig = get_hostmultiuserconfig(&v22);
  int v11 = hostmultiuserconfig;
  if (hostmultiuserconfig)
  {
    debuglog("MKBUserTypeDeviceMode", @"Failed to get multiuser_config flags from kernel with error:%d", v5, v6, v7, v8, v9, v10, hostmultiuserconfig);
    if (v11 == 2) {
      CFStringRef v18 = @"FAILED to MKBUserTypeDeviceMode, EPERM";
    }
    else {
      CFStringRef v18 = @"FAILED to MKBUserTypeDeviceMode, EINVAL";
    }
    if (v11 == 2) {
      CFIndex v19 = 1;
    }
    else {
      CFIndex v19 = 22;
    }
    debuglog("MKBUserTypeDeviceMode", v18, v12, v13, v14, v15, v16, v17, v21);
  }
  else
  {
    if ((v22 & 0x80000000) != 0)
    {
      CFDictionarySetValue(dict, kMKBDeviceModeKey, kMKBDeviceModeSharedIPad);
      CFDictionarySetValue(dict, kMKBUserTypeKey, kMKBUserTypeEphemeral);
      return dict;
    }
    CFIndex v19 = 0;
  }
  CFDictionarySetValue(dict, kMKBDeviceModeKey, kMKBDeviceModeSingleUser);
  CFDictionarySetValue(dict, kMKBUserTypeKey, kMKBUserTypePermanent);
  if (a2 && v11) {
    *a2 = CFErrorCreate(0, (CFErrorDomain)*MEMORY[0x1E4F1D160], v19, 0);
  }
  return dict;
}

void __handleToUse_block_invoke()
{
  uint32_t v8 = 0;
  int hostmultiuserconfig = get_hostmultiuserconfig(&v8);
  if (hostmultiuserconfig)
  {
    debuglog("handleToUse_block_invoke", @"failed to determine whether we are multi-user: 0x%x", v1, v2, v3, v4, v5, v6, hostmultiuserconfig);
  }
  else if ((v8 & 0x80000000) != 0)
  {
    handleToUse_handle = -3;
    uint32_t v7 = v8 & 0x3FFFFFFF;
    if (v7 != voucher_get_current_persona()) {
      handleToUse_handle = 0;
    }
  }
  else
  {
    handleToUse_handle = 0;
  }
}

uint64_t get_hostmultiuserconfig(uint32_t *a1)
{
  uint32_t multiuser_flags = 0;
  host_t v2 = MEMORY[0x1BA9CE2B0]();
  uint64_t result = host_get_multiuser_config_flags(v2, &multiuser_flags);
  if (a1)
  {
    if (!result) {
      *a1 = multiuser_flags;
    }
  }
  return result;
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  if (gUserUnlockedSinceBoot) {
    return 1;
  }
  handleToUse(0);
  uint64_t lock_state = aks_get_lock_state();
  uint64_t v2 = convertAKSErrorToMKB(lock_state);
  if (v2)
  {
    uint64_t v0 = v2;
    debuglog("MKBDeviceUnlockedSinceBoot", @"MKBDeviceUnlockedSinceBoot fails with error(%d) for handle(%d) with AKS error(%d)", v3, v4, v5, v6, v7, v8, v2);
  }
  else
  {
    uint64_t v0 = 0;
    gUserUnlockedSinceBoot = 0;
  }
  return v0;
}

__CFDictionary *MKBGetDeviceLockStateInfo(const __CFDictionary *a1)
{
  CFDictionaryRef Int = a1;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  __int16 v14 = 0;
  memset(v13, 0, sizeof(v13));
  if (_get_device_lock_state(a1, (uint64_t)v13)) {
    return 0;
  }
  dict = create_dict();
  uint64_t v3 = dict;
  if (dict)
  {
    set_longlongvalue_for_key(dict, @"ls", DWORD1(v13[0]));
    set_longlongvalue_for_key(v3, @"state", LODWORD(v13[0]));
    if (handleToUse(Int))
    {
      if (Int)
      {
        if (CFDictionaryContainsKey(Int, kMKBUserSessionIDKey)) {
          CFDictionaryRef Int = (const __CFDictionary *)_getInt(Int, kMKBUserSessionIDKey);
        }
        else {
          CFDictionaryRef Int = 0;
        }
      }
      uint64_t v4 = +[MKBKeyStoreDevice sharedService];
      uint64_t v5 = [v4 getLockStateForUser:Int];

      if (v5)
      {
        CFTypeID v6 = CFGetTypeID(v5);
        if (v6 == CFDictionaryGetTypeID())
        {
          uint64_t v7 = 0;
          v12[0] = @"IsWipePending";
          v12[1] = @"sw";
          v12[2] = @"IsPermanentlyBlocked";
          v12[3] = @"pb";
          v12[4] = @"FailedPasscodeAttempts";
          v12[5] = @"fa";
          v12[6] = @"TimeUntilUnblockedSinceReferenceDate";
          v12[7] = @"boff";
          do
          {
            uint64_t v8 = (const void *)v12[v7];
            if (CFDictionaryContainsKey((CFDictionaryRef)v5, v8))
            {
              uint64_t v9 = (const void *)v12[v7 + 1];
              Value = CFDictionaryGetValue((CFDictionaryRef)v5, v8);
              CFDictionarySetValue(v3, v9, Value);
            }
            v7 += 2;
          }
          while (v7 != 8);
          CFRelease(v5);
        }
      }
    }
    else
    {
      set_longlongvalue_for_key(v3, @"boff", *((uint64_t *)&v13[0] + 1));
      set_longlongvalue_for_key(v3, @"fa", LODWORD(v13[1]));
      set_longlongvalue_for_key(v3, @"countdown", *(uint64_t *)((char *)&v13[1] + 10));
    }
  }
  return v3;
}

uint64_t MKBGetDeviceLockState(const __CFDictionary *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  __int16 v3 = 0;
  memset(v2, 0, sizeof(v2));
  LODWORD(result) = _get_device_lock_state(a1, (uint64_t)v2);
  if (result) {
    return result;
  }
  else {
    return DWORD1(v2[0]);
  }
}

uint64_t _get_device_lock_state(const __CFDictionary *a1, uint64_t a2)
{
  int valuePtr = handleToUse(a1);
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a1)
  {
LABEL_13:
    uint64_t device_state = aks_get_device_state();
    return convertAKSErrorToMKB(device_state);
  }
  CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(a1, @"ExtendedDeviceLockState");
  v7 = Value && (CFBooleanRef v5 = Value, v6 = CFGetTypeID(Value), v6 == CFBooleanGetTypeID()) && CFBooleanGetValue(v5) != 0;
  CFNumberRef v8 = (const __CFNumber *)CFDictionaryGetValue(a1, kMKBUserSessionIDKey);
  if (v8)
  {
    CFNumberRef v9 = v8;
    CFTypeID v10 = CFGetTypeID(v8);
    if (v10 == CFNumberGetTypeID())
    {
      if (CFNumberGetValue(v9, kCFNumberIntType, &valuePtr))
      {
        int valuePtr = -valuePtr;
        goto LABEL_11;
      }
      return 0xFFFFFFFFLL;
    }
  }
LABEL_11:
  if (!v7) {
    goto LABEL_13;
  }
  uint64_t device_state = aks_get_extended_device_state();
  return convertAKSErrorToMKB(device_state);
}

uint64_t handleToUse(const __CFDictionary *a1)
{
  int v2 = 0;
  if (_get_userid_from_options(a1, &v2)) {
    return -v2;
  }
  if (handleToUse_handleOnce != -1) {
    dispatch_once(&handleToUse_handleOnce, &__block_literal_global_260);
  }
  return handleToUse_handle;
}

uint64_t _get_userid_from_options(CFDictionaryRef theDict, _DWORD *a2)
{
  uint64_t result = 0;
  if (theDict)
  {
    if (a2)
    {
      uint64_t result = (uint64_t)CFDictionaryGetValue(theDict, @"DeviceHandle");
      if (result)
      {
        CFNumberRef v5 = (const __CFNumber *)result;
        CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
        if (v6 == CFNumberGetTypeID())
        {
          int valuePtr = 0;
          uint64_t result = CFNumberGetValue(v5, kCFNumberIntType, &valuePtr);
          if (result)
          {
            *a2 = valuePtr;
            return 1;
          }
        }
        else
        {
          debuglog("_get_userid_from_options", @"handle is of wrong type", v7, v8, v9, v10, v11, v12, v13);
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t convertAKSErrorToMKB(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if ((int)a1 > -536363001)
  {
    switch(a1)
    {
      case 0xE007C00E:
        return 4294967283;
      case 0xE007C00F:
      case 0xE007C010:
      case 0xE007C011:
      case 0xE007C012:
      case 0xE007C016:
      case 0xE007C017:
        goto LABEL_20;
      case 0xE007C013:
        return 4294967276;
      case 0xE007C014:
        return 0;
      case 0xE007C015:
        return 4294967282;
      case 0xE007C018:
        return 4294967277;
      default:
        if (a1 == -536363000) {
          return 4294967282;
        }
        if (!a1) {
          return v1;
        }
        break;
    }
    goto LABEL_20;
  }
  uint64_t v2 = 4294967294;
  if ((int)a1 <= -536870195)
  {
    switch(a1)
    {
      case 0xE00002C1:
        return v2;
      case 0xE00002C2:
        return 4294967279;
      case 0xE00002C9:
        return 4294967287;
    }
LABEL_20:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = v1;
      _os_log_impl(&dword_1B8EA4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unexpected AppleKeyStore error: %d\n", (uint8_t *)v4, 8u);
    }
    return 0xFFFFFFFFLL;
  }
  if ((int)a1 > -536870175)
  {
    if (a1 == -536870174) {
      return v2;
    }
    if (a1 == -536870160) {
      return 4294967288;
    }
    goto LABEL_20;
  }
  if (a1 == -536870194) {
    return 4294967293;
  }
  if (a1 != -536870184) {
    goto LABEL_20;
  }
  return 4294967283;
}

void set_longlongvalue_for_key(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  if (a1 && a2)
  {
    CFNumberRef v5 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
    if (v5)
    {
      CFNumberRef v6 = v5;
      CFDictionarySetValue(a1, a2, v5);
      CFRelease(v6);
    }
  }
}

CFMutableDictionaryRef create_dict()
{
  CFMutableDictionaryRef result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!result)
  {
    debuglog("create_dict", @"Out of Memory!!! Dying!...so...cold....", v1, v2, v3, v4, v5, v6, vars0);
    exit(-1);
  }
  return result;
}

void aksNotificationCB(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    char v9 = 0;
LABEL_8:
    debuglog("aksNotificationCB", @"invalid context %d %d", a3, a4, a5, a6, a7, a8, v9);
    return;
  }
  if (*(_DWORD *)(a1 + 20) != 1918985081)
  {
    char v9 = 1;
    goto LABEL_8;
  }
  if (a3 == -469774321)
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 8) + 16);
  }
  else
  {
    if (a3 != -469774323) {
      return;
    }
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 8) + 16);
  }

  v8();
}

uint64_t storeBlastableBytes(unsigned int a1, const void *a2, size_t a3)
{
  io_connect_t connect = 0;
  uint64_t input = a1;
  mach_port_t v5 = *MEMORY[0x1E4F2EEF0];
  CFDictionaryRef v6 = IOServiceMatching("AppleEffaceableStorage");
  io_service_t MatchingService = IOServiceGetMatchingService(v5, v6);
  io_object_t v14 = MatchingService;
  if (MatchingService)
  {
    uint64_t v15 = IOServiceOpen(MatchingService, *MEMORY[0x1E4F14960], 0, &connect);
    if (v15)
    {
      uint64_t v29 = v15;
      debuglog("storeBlastableBytes", @"Unable to open service: 0x%08x", v16, v17, v18, v19, v20, v21, v15);
    }
    else
    {
      uint64_t v22 = IOConnectCallMethod(connect, 6u, &input, 1u, a2, a3, 0, 0, 0, 0);
      uint64_t v29 = v22;
      if (v22) {
        debuglog("storeBlastableBytes", @"Can't store blastable bytes: %08x", v23, v24, v25, v26, v27, v28, v22);
      }
    }
  }
  else
  {
    debuglog("storeBlastableBytes", @"Can't find EffaceableStorage kext!", v8, v9, v10, v11, v12, v13, outputStruct);
    uint64_t v29 = 3758097084;
  }
  if (connect) {
    IOServiceClose(connect);
  }
  if (v14) {
    IOObjectRelease(v14);
  }
  return v29;
}

uint64_t loadBlastableBytes(unsigned int a1, void *a2, size_t *a3)
{
  io_connect_t connect = 0;
  uint64_t input = a1;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  mach_port_t v5 = *MEMORY[0x1E4F2EEF0];
  CFDictionaryRef v6 = IOServiceMatching("AppleEffaceableStorage");
  io_service_t MatchingService = IOServiceGetMatchingService(v5, v6);
  io_object_t v14 = MatchingService;
  if (MatchingService)
  {
    uint64_t v15 = IOServiceOpen(MatchingService, *MEMORY[0x1E4F14960], 0, &connect);
    if (v15)
    {
      uint64_t v29 = v15;
      debuglog("loadBlastableBytes", @"Unable to open service: 0x%08x", v16, v17, v18, v19, v20, v21, v15);
    }
    else
    {
      uint64_t v22 = IOConnectCallMethod(connect, 5u, &input, 1u, 0, 0, &output, &outputCnt, a2, a3);
      uint64_t v29 = v22;
      if (v22) {
        debuglog("loadBlastableBytes", @"Can't load blastable bytes: %08x", v23, v24, v25, v26, v27, v28, v22);
      }
    }
  }
  else
  {
    debuglog("loadBlastableBytes", @"Can't find EffaceableStorage kext!", v8, v9, v10, v11, v12, v13, outputStruct);
    uint64_t v29 = 3758097084;
  }
  if (connect) {
    IOServiceClose(connect);
  }
  if (v14) {
    IOObjectRelease(v14);
  }
  return v29;
}

uint64_t effaceBlastableBytes(unsigned int a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  bzero(v34, 0x400uLL);
  size_t v33 = 1024;
  io_connect_t connect = 0;
  uint64_t input = a1;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  mach_port_t v2 = *MEMORY[0x1E4F2EEF0];
  CFDictionaryRef v3 = IOServiceMatching("AppleEffaceableStorage");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  io_object_t v11 = MatchingService;
  if (MatchingService)
  {
    uint64_t v12 = IOServiceOpen(MatchingService, *MEMORY[0x1E4F14960], 0, &connect);
    if (v12)
    {
      uint64_t v19 = v12;
      debuglog("effaceBlastableBytes", @"Unable to open service: 0x%08x", v13, v14, v15, v16, v17, v18, v12);
    }
    else
    {
      uint64_t v19 = IOConnectCallMethod(connect, 5u, &input, 1u, 0, 0, &output, &outputCnt, v34, &v33);
      if (!v19)
      {
        uint64_t v20 = IOConnectCallMethod(connect, 7u, &input, 1u, 0, 0, &output, &outputCnt, 0, 0);
        uint64_t v19 = v20;
        if (v20) {
          debuglog("effaceBlastableBytes", @"efface failed: 0x%x", v21, v22, v23, v24, v25, v26, v20);
        }
      }
    }
  }
  else
  {
    debuglog("effaceBlastableBytes", @"Can't find EffaceableStorage kext!", v5, v6, v7, v8, v9, v10, outputStruct);
    uint64_t v19 = 3758097084;
  }
  if (connect) {
    IOServiceClose(connect);
  }
  if (v11) {
    IOObjectRelease(v11);
  }
  return v19;
}

uint64_t libkeybaglog(uint64_t result, uint64_t a2)
{
  if (_logFunction) {
    return _logFunction(result, a2);
  }
  return result;
}

uint64_t _libkeybaglog(uint64_t result, uint64_t a2)
{
  mach_port_t v2 = _logFunction;
  if (_logFunction)
  {
    if (_logFunction_v) {
      mach_port_t v2 = (uint64_t (*)(uint64_t, uint64_t))_logFunction_v;
    }
    return v2(result, a2);
  }
  return result;
}

uint64_t (*KBSetLogger(uint64_t (*result)(void, void)))(void, void)
{
  _logFunction = result;
  return result;
}

uint64_t KBSetLogger_v(uint64_t result)
{
  _logFunction_v = result;
  return result;
}

CFDictionaryRef HealthPlistGetBuild(const __CFDictionary *result)
{
  if (result) {
    return (const __CFDictionary *)CFDictionaryGetValue(result, @"_DSEUN");
  }
  return result;
}

uint64_t HealthPlistSetBuild(CFMutableDictionaryRef theDict, void *value)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (theDict)
  {
    if (value)
    {
      CFDictionarySetValue(theDict, @"_DSEUN", value);
      return 0;
    }
  }
  return result;
}

CFDictionaryRef HealthPlistGetFailed(const __CFDictionary *result)
{
  uint64_t valuePtr = 0;
  if (result)
  {
    uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(result, @"_DFAIL");
    if (result)
    {
      CFNumberRef v1 = result;
      CFTypeID v2 = CFGetTypeID(result);
      if (v2 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
        return (const __CFDictionary *)valuePtr;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t HealthPlistSetFailed(__CFDictionary *a1, uint64_t a2)
{
  uint64_t valuePtr = a2;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt64Type, &valuePtr);
  if (!v3)
  {
    debuglog("HealthPlistSetFailed", @"unable to allocate", v4, v5, v6, v7, v8, v9, v11);
    return 0xFFFFFFFFLL;
  }
  CFDictionarySetValue(a1, @"_DFAIL", v3);
  return 0;
}

uint64_t HealthPlistSetTTR(CFMutableDictionaryRef theDict, uint64_t a2)
{
  uint64_t valuePtr = a2;
  if (!theDict) {
    return 0xFFFFFFFFLL;
  }
  if (a2 < 1)
  {
    CFDictionaryRemoveValue(theDict, @"_DTTR");
    return 0;
  }
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt64Type, &valuePtr);
  if (!v3)
  {
    debuglog("HealthPlistSetTTR", @"unable to allocate", v4, v5, v6, v7, v8, v9, v12);
    return 0xFFFFFFFFLL;
  }
  CFNumberRef v10 = v3;
  CFDictionarySetValue(theDict, @"_DTTR", v3);
  CFRelease(v10);
  return 0;
}

CFDictionaryRef HealthPlistGetTTR(const __CFDictionary *result)
{
  if (result) {
    return (const __CFDictionary *)CFDictionaryGetValue(result, @"_DTTR");
  }
  return result;
}

uint64_t HealthPlistConsumeTTR(CFDictionaryRef theDict, void *a2)
{
  uint64_t valuePtr = 0;
  uint64_t result = 0xFFFFFFFFLL;
  if (theDict && a2)
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"_DTTR");
    if (Value)
    {
      if (CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr))
      {
        CFDictionaryRemoveValue(theDict, @"_DTTR");
        uint64_t result = 0;
        *a2 = valuePtr;
        return result;
      }
      debuglog("HealthPlistConsumeTTR", @"invalid ttr format", v6, v7, v8, v9, v10, v11, v12);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

CFDictionaryRef HealthPlistGetVersion(const __CFDictionary *result)
{
  if (result) {
    return (const __CFDictionary *)CFDictionaryGetValue(result, @"_DVERS");
  }
  return result;
}

uint64_t HealthPlistSetVersion(__CFDictionary *a1, int a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
  if (v3)
  {
    CFDictionarySetValue(a1, @"_DVERS", v3);
    return 0;
  }
  else
  {
    debuglog("HealthPlistSetVersion", @"cant allocate mem", v4, v5, v6, v7, v8, v9, v11);
    return 0xFFFFFFFFLL;
  }
}

uint64_t HealthPlistSetCurrentVersion(__CFDictionary *a1)
{
  return HealthPlistSetVersion(a1, 7);
}

CFDictionaryRef HealthPlistGetTime(const __CFDictionary *result)
{
  uint64_t valuePtr = 0;
  if (result)
  {
    uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(result, @"_DTIME");
    if (result)
    {
      CFNumberRef v1 = result;
      CFTypeID v2 = CFGetTypeID(result);
      if (v2 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
        return (const __CFDictionary *)valuePtr;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t HealthPlistSetTime(__CFDictionary *a1, uint64_t a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt64Type, &valuePtr);
  if (v3)
  {
    CFDictionarySetValue(a1, @"_DTIME", v3);
    return 0;
  }
  else
  {
    debuglog("HealthPlistSetTime", @"cant allocate mem", v4, v5, v6, v7, v8, v9, v11);
    return 0xFFFFFFFFLL;
  }
}

CFDictionaryRef HealthPlistGetData(const __CFDictionary *result)
{
  if (result) {
    return (const __CFDictionary *)CFDictionaryGetValue(result, @"_DDATA");
  }
  return result;
}

uint64_t HealthPlistSetData(__CFDictionary *a1, void *value)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  CFDictionarySetValue(a1, @"_DDATA", value);
  return 0;
}

uint64_t HealthPlistAddToData(const __CFDictionary *a1, uint64_t a2)
{
  uint64_t valuePtr = a2;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFNumberRef v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt64Type, &valuePtr);
  if (!v4)
  {
    debuglog("HealthPlistAddToData", @"unable to allocate", v5, v6, v7, v8, v9, v10, v21);
    return 0xFFFFFFFFLL;
  }
  CFNumberRef v11 = v4;
  CFNumberRef Value = (__CFArray *)CFDictionaryGetValue(a1, @"_DDATA");
  if (Value)
  {
    Mutable = Value;
    CFRetain(Value);
  }
  else
  {
    Mutable = CFArrayCreateMutable(v3, 0, MEMORY[0x1E4F1D510]);
  }
  CFArrayAppendValue(Mutable, v11);
  if (CFArrayGetCount(Mutable) >= 15)
  {
    debuglog("HealthPlistAddToData", @"at capacity, forgetting oldest data entry", v14, v15, v16, v17, v18, v19, v21);
    CFArrayRemoveValueAtIndex(Mutable, 0);
  }
  CFDictionarySetValue(a1, @"_DDATA", Mutable);
  CFRelease(v11);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return 0;
}

const char *_HealthPlistGetPlistPath()
{
  return "/var/root/.mkb_seshat_health";
}

CFDictionaryRef HealthPlistCopyOrCreateNew()
{
  CFDictionaryRef binary_dict = (const __CFDictionary *)load_binary_dict("/var/root/.mkb_seshat_health");
  if (binary_dict)
  {
    CFDictionaryRef Mutable = binary_dict;
    int valuePtr = 0;
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(binary_dict, @"_DVERS");
    if (!Value)
    {
      CFStringRef v54 = @"no version";
      goto LABEL_34;
    }
    CFNumberRef v15 = Value;
    CFTypeID v16 = CFGetTypeID(Value);
    if (v16 == CFNumberGetTypeID())
    {
      uint64_t v58 = 0;
      if (CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr))
      {
        if (valuePtr != 7)
        {
          debuglog("validate_health_plist", @"non-current version %d", v9, v10, v11, v12, v13, v14, valuePtr);
          goto LABEL_28;
        }
        CFNumberRef v17 = (const __CFNumber *)CFDictionaryGetValue(Mutable, @"_DTIME");
        if (v17)
        {
          CFNumberRef v18 = v17;
          CFTypeID v19 = CFGetTypeID(v17);
          if (v19 != CFNumberGetTypeID())
          {
            CFStringRef v54 = @"time stamp is of wrong type";
            goto LABEL_34;
          }
          if (!CFNumberGetValue(v18, kCFNumberLongType, &v58))
          {
            CFStringRef v54 = @"invalid timestamp";
            goto LABEL_34;
          }
        }
        uint64_t v20 = (__CFArray *)CFDictionaryGetValue(Mutable, @"_DDATA");
        CFMutableArrayRef MutableCopy = v20;
        if (!v20)
        {
LABEL_17:
          CFNumberRef v26 = (const __CFNumber *)CFDictionaryGetValue(Mutable, @"_DFAIL");
          if (!v26) {
            goto LABEL_20;
          }
          CFNumberRef v27 = v26;
          uint64_t v57 = 0;
          CFTypeID v28 = CFGetTypeID(v26);
          if (v28 != CFNumberGetTypeID())
          {
            CFStringRef v55 = @"fail indicator is of wrong type";
            goto LABEL_47;
          }
          if (!CFNumberGetValue(v27, kCFNumberLongType, &v57))
          {
            CFStringRef v55 = @"invalid fail indicator";
          }
          else
          {
LABEL_20:
            uint64_t v35 = CFDictionaryGetValue(Mutable, @"_DSEUN");
            if (v35 && (CFTypeID v36 = CFGetTypeID(v35), v36 != CFStringGetTypeID()))
            {
              CFStringRef v55 = @"build is of wrong type";
            }
            else
            {
              CFNumberRef v37 = (const __CFNumber *)CFDictionaryGetValue(Mutable, @"_DTTR");
              if (!v37) {
                goto LABEL_25;
              }
              CFNumberRef v38 = v37;
              CFTypeID v39 = CFGetTypeID(v37);
              if (v39 == CFNumberGetTypeID())
              {
                if (CFNumberGetValue(v38, kCFNumberSInt64Type, &v58))
                {
LABEL_25:
                  char v40 = 1;
                  if (!MutableCopy) {
                    goto LABEL_27;
                  }
                  goto LABEL_26;
                }
                CFStringRef v55 = @"invalid ttr timestamp";
              }
              else
              {
                CFStringRef v55 = @"ttr time stamp is of wrong type";
              }
            }
          }
LABEL_47:
          debuglog("validate_health_plist", v55, v29, v30, v31, v32, v33, v34, v56);
          char v40 = 0;
          if (!MutableCopy)
          {
LABEL_27:
            if (v40) {
              goto LABEL_30;
            }
            goto LABEL_28;
          }
LABEL_26:
          CFRelease(MutableCopy);
          goto LABEL_27;
        }
        CFTypeID v22 = CFGetTypeID(v20);
        if (v22 == CFArrayGetTypeID())
        {
          if (CFArrayGetCount(MutableCopy) >= 1)
          {
            CFIndex v23 = 0;
            while (1)
            {
              ValueAtIndex = CFArrayGetValueAtIndex(MutableCopy, v23);
              if (!ValueAtIndex) {
                break;
              }
              CFTypeID v25 = CFGetTypeID(ValueAtIndex);
              if (v25 != CFNumberGetTypeID()) {
                break;
              }
              if (CFArrayGetCount(MutableCopy) <= ++v23) {
                goto LABEL_16;
              }
            }
            CFStringRef v54 = @"data inconsistent";
            goto LABEL_34;
          }
LABEL_16:
          CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MutableCopy);
          CFDictionarySetValue(Mutable, @"_DDATA", MutableCopy);
          goto LABEL_17;
        }
        CFStringRef v54 = @"data is of wrong type";
      }
      else
      {
        CFStringRef v54 = @"invalid version format";
      }
    }
    else
    {
      CFStringRef v54 = @"version is of wrong type";
    }
LABEL_34:
    debuglog("validate_health_plist", v54, v9, v10, v11, v12, v13, v14, v56);
LABEL_28:
    CFRelease(Mutable);
  }
  debuglog("HealthPlistCopyOrCreateNew", @"health plist doesnt exist or wrong version, creating new one", v1, v2, v3, v4, v5, v6, v56);
  CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!Mutable)
  {
    debuglog("HealthPlistCopyOrCreateNew", @"Can't create dict", v41, v42, v43, v44, v45, v46, v56);
    return Mutable;
  }
LABEL_30:
  if (HealthPlistSetVersion(Mutable, 7))
  {
    debuglog("HealthPlistCopyOrCreateNew", @"cant set version", v47, v48, v49, v50, v51, v52, v56);
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

uint64_t HealthPlistSerialize(const void *a1)
{
  if (store_binary_dict(a1, "/var/root/.mkb_seshat_health")) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t HealthPlistTest()
{
  unlink("/var/root/.mkb_seshat_health");
  CFDictionaryRef New = HealthPlistCopyOrCreateNew();
  if (!New) {
    goto LABEL_88;
  }
  CFDictionaryRef v7 = New;
  if (CFDictionaryGetCount(New) != 1) {
    goto LABEL_89;
  }
  if (store_binary_dict(v7, "/var/root/.mkb_seshat_health")) {
    goto LABEL_90;
  }
  CFRelease(v7);
  CFDictionaryRef v14 = HealthPlistCopyOrCreateNew();
  if (!v14)
  {
LABEL_88:
    CFStringRef v72 = @"failed to copy health plist";
LABEL_95:
    debuglog("HealthPlistTest", v72, v1, v2, v3, v4, v5, v6, v76);
    return 0xFFFFFFFFLL;
  }
  CFDictionaryRef v7 = v14;
  if (CFDictionaryGetCount(v14) != 1)
  {
LABEL_89:
    debuglog("HealthPlistTest", @"unexpected contents", v8, v9, v10, v11, v12, v13, v76);
    goto LABEL_90;
  }
  CFRelease(v7);
  plist_with_version = _create_plist_with_version(8);
  if (!plist_with_version)
  {
LABEL_94:
    CFStringRef v72 = @"cant create dict";
    goto LABEL_95;
  }
  CFDictionaryRef v7 = plist_with_version;
  if (store_binary_dict(plist_with_version, "/var/root/.mkb_seshat_health"))
  {
LABEL_90:
    CFNumberRef v28 = 0;
    goto LABEL_56;
  }
  CFRelease(v7);
  CFDictionaryRef v16 = HealthPlistCopyOrCreateNew();
  if (!v16) {
    goto LABEL_88;
  }
  CFDictionaryRef v7 = v16;
  if (CFDictionaryGetCount(v16) != 1) {
    goto LABEL_89;
  }
  CFRelease(v7);
  CFNumberRef v17 = _create_plist_with_version(6);
  if (!v17) {
    goto LABEL_94;
  }
  CFDictionaryRef v7 = v17;
  if (store_binary_dict(v17, "/var/root/.mkb_seshat_health")) {
    goto LABEL_90;
  }
  CFRelease(v7);
  CFDictionaryRef v18 = HealthPlistCopyOrCreateNew();
  if (!v18) {
    goto LABEL_88;
  }
  CFDictionaryRef v7 = v18;
  if (CFDictionaryGetCount(v18) != 1) {
    goto LABEL_89;
  }
  CFRelease(v7);
  CFTypeID v19 = _create_plist_with_version(7);
  if (!v19) {
    goto LABEL_94;
  }
  CFDictionaryRef v7 = v19;
  if (store_binary_dict(v19, "/var/root/.mkb_seshat_health")) {
    goto LABEL_90;
  }
  CFRelease(v7);
  CFDictionaryRef v20 = HealthPlistCopyOrCreateNew();
  if (!v20) {
    goto LABEL_88;
  }
  CFDictionaryRef v7 = v20;
  if (CFDictionaryGetCount(v20) != 1) {
    goto LABEL_89;
  }
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v7, @"_DVERS");
  CFNumberRef v28 = Value;
  if (!Value)
  {
    CFStringRef v73 = @"missing version";
    goto LABEL_110;
  }
  int valuePtr = 0;
  if (!CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr))
  {
    CFStringRef v73 = @"cant get version";
    goto LABEL_110;
  }
  if (valuePtr != 7)
  {
    CFStringRef v73 = @"version is invalid";
    goto LABEL_110;
  }
  CFRelease(v7);
  uint64_t v29 = _create_plist_with_version(7);
  if (!v29) {
    goto LABEL_96;
  }
  CFDictionaryRef v7 = v29;
  CFDictionarySetValue(v29, @"_DSEUN", @"15A123");
  if (store_binary_dict(v7, "/var/root/.mkb_seshat_health")) {
    goto LABEL_56;
  }
  CFRelease(v7);
  CFDictionaryRef v36 = HealthPlistCopyOrCreateNew();
  if (!v36)
  {
LABEL_102:
    CFStringRef v75 = @"failed to copy health plist";
    goto LABEL_103;
  }
  CFDictionaryRef v7 = v36;
  if (CFDictionaryGetCount(v36) != 2)
  {
    CFStringRef v73 = @"unexpected contents";
    goto LABEL_110;
  }
  CFRelease(v7);
  CFNumberRef v37 = _create_plist_with_version(7);
  if (!v37)
  {
LABEL_96:
    CFStringRef v75 = @"cant create dict";
LABEL_103:
    debuglog("HealthPlistTest", v75, v30, v31, v32, v33, v34, v35, v76);
    uint64_t v63 = 0xFFFFFFFFLL;
    goto LABEL_82;
  }
  CFDictionaryRef v7 = v37;
  if (HealthPlistAddToData(v37, 1) || HealthPlistAddToData(v7, 2))
  {
LABEL_97:
    CFStringRef v73 = @"cant add";
    goto LABEL_110;
  }
  if (store_binary_dict(v7, "/var/root/.mkb_seshat_health")) {
    goto LABEL_56;
  }
  CFRelease(v7);
  CFDictionaryRef v38 = HealthPlistCopyOrCreateNew();
  if (!v38) {
    goto LABEL_102;
  }
  CFDictionaryRef v7 = v38;
  CFArrayRef v39 = (const __CFArray *)CFDictionaryGetValue(v38, @"_DDATA");
  if (!v39)
  {
LABEL_92:
    CFStringRef v73 = @"failed to get data";
LABEL_110:
    debuglog("HealthPlistTest", v73, v22, v23, v24, v25, v26, v27, v76);
    goto LABEL_56;
  }
  if (CFArrayGetCount(v39) != 2)
  {
LABEL_98:
    CFStringRef v73 = @"invalid count";
    goto LABEL_110;
  }
  CFRelease(v7);
  char v40 = _create_plist_with_version(7);
  if (!v40) {
    goto LABEL_96;
  }
  CFDictionaryRef v7 = v40;
  for (uint64_t i = 0; i != 28; ++i)
  {
    if (HealthPlistAddToData(v7, i))
    {
      CFStringRef v71 = @"cant add";
LABEL_85:
      debuglog("HealthPlistTest", v71, v42, v43, v44, v45, v46, v47, v76);
LABEL_86:
      if (v7) {
        goto LABEL_56;
      }
LABEL_57:
      uint64_t v63 = 0xFFFFFFFFLL;
      if (v28) {
        goto LABEL_82;
      }
      return v63;
    }
  }
  if (store_binary_dict(v7, "/var/root/.mkb_seshat_health")) {
    goto LABEL_86;
  }
  CFRelease(v7);
  CFDictionaryRef v48 = HealthPlistCopyOrCreateNew();
  if (!v48) {
    goto LABEL_93;
  }
  CFDictionaryRef v7 = v48;
  CFArrayRef v55 = (const __CFArray *)CFDictionaryGetValue(v48, @"_DDATA");
  if (!v55) {
    goto LABEL_92;
  }
  CFArrayRef v56 = v55;
  if (CFArrayGetCount(v55) != 14) {
    goto LABEL_98;
  }
  if (HealthPlistAddToData(v7, 10)) {
    goto LABEL_97;
  }
  if (CFArrayGetCount(v56) != 14) {
    goto LABEL_98;
  }
  CFRelease(v7);
  uint64_t v57 = _create_plist_with_version(7);
  if (!v57) {
    goto LABEL_99;
  }
  CFDictionaryRef v7 = v57;
  if (HealthPlistGetTime(v57))
  {
    CFStringRef v73 = @"no time";
    goto LABEL_110;
  }
  if (HealthPlistSetTime(v7, 123)) {
    goto LABEL_104;
  }
  if (store_binary_dict(v7, "/var/root/.mkb_seshat_health")) {
    goto LABEL_56;
  }
  CFRelease(v7);
  CFDictionaryRef v58 = HealthPlistCopyOrCreateNew();
  if (!v58)
  {
LABEL_93:
    CFStringRef v74 = @"failed to copy health plist";
LABEL_100:
    debuglog("HealthPlistTest", v74, v49, v50, v51, v52, v53, v54, v76);
    goto LABEL_57;
  }
  CFDictionaryRef v7 = v58;
  CFDictionaryRef Time = HealthPlistGetTime(v58);
  if (Time != (const __CFDictionary *)123) {
    goto LABEL_91;
  }
  if (HealthPlistSetTime(v7, 1123))
  {
LABEL_104:
    CFStringRef v73 = @"cant set time";
    goto LABEL_110;
  }
  CFDictionaryRef Time = HealthPlistGetTime(v7);
  if (Time != (const __CFDictionary *)1123)
  {
LABEL_91:
    if (Time) {
      goto LABEL_56;
    }
    goto LABEL_92;
  }
  CFRelease(v7);
  v60 = _create_plist_with_version(7);
  if (!v60) {
    goto LABEL_99;
  }
  CFDictionaryRef v7 = v60;
  if (CFDictionaryGetValue(v60, @"_DSEUN")
    || (CFDictionarySetValue(v7, @"_DSEUN", @"12A123"),
        CFDictionarySetValue(v7, @"_DSEUN", @"12A124"),
        store_binary_dict(v7, "/var/root/.mkb_seshat_health")))
  {
LABEL_56:
    CFRelease(v7);
    goto LABEL_57;
  }
  CFRelease(v7);
  CFDictionaryRef v61 = HealthPlistCopyOrCreateNew();
  if (!v61) {
    goto LABEL_93;
  }
  CFDictionaryRef v7 = v61;
  CFStringRef v62 = (const __CFString *)CFDictionaryGetValue(v61, @"_DSEUN");
  if (!v62 || CFStringCompare(v62, @"12A124", 0)) {
    goto LABEL_56;
  }
  CFRelease(v7);
  v64 = _create_plist_with_version(7);
  if (!v64)
  {
LABEL_99:
    CFStringRef v74 = @"cant create dict";
    goto LABEL_100;
  }
  CFDictionaryRef v7 = v64;
  if (HealthPlistGetFailed(v64)
    || HealthPlistSetFailed(v7, -1)
    || HealthPlistGetFailed(v7) != (const __CFDictionary *)-1
    || store_binary_dict(v7, "/var/root/.mkb_seshat_health"))
  {
    goto LABEL_56;
  }
  CFRelease(v7);
  CFDictionaryRef v65 = HealthPlistCopyOrCreateNew();
  if (!v65) {
    goto LABEL_93;
  }
  CFDictionaryRef v7 = v65;
  if (HealthPlistGetFailed(v65) != (const __CFDictionary *)-1) {
    goto LABEL_56;
  }
  CFRelease(v7);
  uint64_t v76 = 0;
  v66 = _create_plist_with_version(7);
  CFDictionaryRef v7 = v66;
  if (!v66) {
    goto LABEL_112;
  }
  if (CFDictionaryGetValue(v66, @"_DTTR")) {
    goto LABEL_101;
  }
  CFDictionaryRemoveValue(v7, @"_DTTR");
  if (CFDictionaryGetValue(v7, @"_DTTR")) {
    goto LABEL_101;
  }
  time_t v67 = time(0);
  if (HealthPlistSetTTR(v7, v67)) {
    goto LABEL_111;
  }
  if (!CFDictionaryGetValue(v7, @"_DTTR")) {
    goto LABEL_101;
  }
  if (HealthPlistConsumeTTR(v7, &v76))
  {
LABEL_113:
    CFStringRef v71 = @"failed to consume TTR entry";
    goto LABEL_85;
  }
  if (v76 < 1)
  {
LABEL_114:
    CFStringRef v71 = @"empty time";
    goto LABEL_85;
  }
  if (CFDictionaryGetValue(v7, @"_DTTR"))
  {
LABEL_101:
    CFStringRef v71 = @"unexpected TTR entry";
    goto LABEL_85;
  }
  time_t v68 = time(0);
  if (HealthPlistSetTTR(v7, v68))
  {
LABEL_111:
    CFStringRef v71 = @"addition of TTR failed";
    goto LABEL_85;
  }
  if (store_binary_dict(v7, "/var/root/.mkb_seshat_health")) {
    goto LABEL_86;
  }
  CFRelease(v7);
  CFDictionaryRef v69 = HealthPlistCopyOrCreateNew();
  CFDictionaryRef v7 = v69;
  if (!v69)
  {
LABEL_112:
    CFStringRef v71 = @"cant create dict";
    goto LABEL_85;
  }
  if (!CFDictionaryGetValue(v69, @"_DTTR"))
  {
    CFStringRef v71 = @"no TTR entry";
    goto LABEL_85;
  }
  if (HealthPlistConsumeTTR(v7, &v76)) {
    goto LABEL_113;
  }
  if (v76 < 1) {
    goto LABEL_114;
  }
  if (CFDictionaryGetValue(v7, @"_DTTR")) {
    goto LABEL_101;
  }
  CFRelease(v7);
  uint64_t v63 = 0;
  if (!v28) {
    return v63;
  }
LABEL_82:
  CFRelease(v28);
  return v63;
}

__CFDictionary *_create_plist_with_version(int a1)
{
  unlink("/var/root/.mkb_seshat_health");
  CFDictionaryRef New = HealthPlistCopyOrCreateNew();
  uint64_t v9 = New;
  if (New)
  {
    if (HealthPlistSetVersion(New, a1))
    {
      CFRelease(v9);
      return 0;
    }
  }
  else
  {
    debuglog("_create_plist_with_version", @"failed to copy health plist", v3, v4, v5, v6, v7, v8, v11);
  }
  return v9;
}

CFDictionaryRef KBLoadSystemKeyBag()
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v15 = 0;
  snprintf(__str, 0x401uLL, "%s%s", "/private/var/", "keybags");
  CFDictionaryRef v6 = 0;
  if (!KBLoadLoadKeyBagFile(__str, "systembag", (CFPropertyListRef *)&v15))
  {
    CFDictionaryRef v6 = v15;
    if (v15)
    {
      if (!_getData(v15, @"KeyBagKeys"))
      {
        debuglog("KBLoadSystemKeyBag", @"Keybag %s doesn't actually contain keys", v8, v9, v10, v11, v12, v13, (char)__str);
        CFRelease(v6);
        return 0;
      }
    }
    else
    {
      debuglog("KBLoadSystemKeyBag", @" Empty Keybag returned from KBLoadLoadKeyBagFile", v0, v1, v2, v3, v4, v5, v14);
    }
  }
  return v6;
}

uint64_t KBLoadLoadKeyBagFile(const char *a1, const char *a2, CFPropertyListRef *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  snprintf((char *)__str, 0x401uLL, "%s/%s.kb", a1, a2);
  CFDictionaryRef binary_dict = (const __CFDictionary *)load_binary_dict((const char *)__str);
  CFDictionaryRef v5 = binary_dict;
  if (binary_dict) {
    BOOL v6 = CFDictionaryGetValue(binary_dict, @"KeybagxART") != 0;
  }
  else {
    BOOL v6 = 0;
  }
  int v7 = MKBDeviceTreeContainsKey(":/defaults", @"no-effaceable-storage");
  if (v6 || v7)
  {
    *a3 = 0;
    CFDictionaryRef v16 = load_binary_dict((const char *)__str);
    *a3 = v16;
    if (!v16)
    {
      snprintf(v26, 0x401uLL, "%s.writing", (const char *)__str);
      uint64_t v17 = load_binary_dict(v26);
      *a3 = v17;
      if (!v17)
      {
        uint64_t v15 = 4294967289;
        debuglog("KBLoadLoadKeyBagFile", @"Unable to load keybag with No Crypto: %d", v18, v19, v20, v21, v22, v23, -7);
        if (!v5) {
          return v15;
        }
        goto LABEL_13;
      }
    }
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t ObjectWithCrypto = KBSecureLoadObjectWithCrypto(__str, a3);
    uint64_t v15 = ObjectWithCrypto;
    if (ObjectWithCrypto)
    {
      debuglog("KBLoadLoadKeyBagFile", @"Unable to load keybag with Crypto: %d", v9, v10, v11, v12, v13, v14, ObjectWithCrypto);
      if (!v5) {
        return v15;
      }
      goto LABEL_13;
    }
  }
  if (v5) {
LABEL_13:
  }
    CFRelease(v5);
  return v15;
}

void KBCleanupSystemKeyBag(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  snprintf(__str, 0x401uLL, "%s%s/%s.kb", "/private/var/", "keybags", "systembag");
  if (unlink(__str))
  {
    if (*__error() != 2)
    {
      uint64_t v15 = __error();
      char v16 = strerror(*v15);
      debuglog("KBCleanupSystemKeyBag", @"Failed to delete System KeyBag plist: %s", v17, v18, v19, v20, v21, v22, v16);
    }
  }
  else
  {
    debuglog("KBCleanupSystemKeyBag", @"Deleted System KeyBag plist", v9, v10, v11, v12, v13, v14, a9);
  }
}

CFMutableDictionaryRef KBLoadUserKeybag(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v17 = 0;
  snprintf(__str, 0x401uLL, "%s%s", "/private/var/", "keybags");
  int KeyBagFile = KBLoadLoadKeyBagFile(__str, "userbag", (CFPropertyListRef *)&v17);
  CFDictionaryRef v3 = v17;
  if (!KeyBagFile && v17)
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFStringRef v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%d", a1);
    if (!v5)
    {
      CFMutableDictionaryRef MutableCopy = 0;
      goto LABEL_10;
    }
    CFDictionaryRef v6 = (const __CFDictionary *)v5;
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v3, v5);
    if (Value)
    {
      CFDictionaryRef v8 = Value;
      if (_getData(Value, @"KeyBagKeys"))
      {
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v4, 0, v8);
LABEL_9:
        CFRelease(v3);
        CFDictionaryRef v3 = v6;
LABEL_10:
        CFRelease(v3);
        return MutableCopy;
      }
      debuglog("KBLoadUserKeybag", @"Keybag %s doesn't actually contain keys", v9, v10, v11, v12, v13, v14, (char)__str);
    }
    CFMutableDictionaryRef MutableCopy = 0;
    goto LABEL_9;
  }
  CFMutableDictionaryRef MutableCopy = 0;
  CFMutableDictionaryRef result = 0;
  if (v17) {
    goto LABEL_10;
  }
  return result;
}

uint64_t KBSavePublicBackupBag(const void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  snprintf(__str, 0x401uLL, "%s/%s", "/private/var/", "keybags");
  uint64_t v2 = KBLoadSystemKeyBag();
  if (!v2) {
    return 0;
  }
  CFDictionaryRef v3 = v2;
  if (a1) {
    CFDictionarySetValue(v2, @"BackupKeyBagKeys", a1);
  }
  else {
    CFDictionaryRemoveValue(v2, @"BackupKeyBagKeys");
  }
  if (KBSaveKeyBag(v3, __str, 1111574321, "systembag", 0, v4, v5, v6)) {
    uint64_t v7 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v7 = 0;
  }
  CFRelease(v3);
  return v7;
}

uint64_t KBSaveKeyBag(const __CFDictionary *a1, const char *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a5;
  unsigned int v10 = a3;
  uint64_t v197 = *MEMORY[0x1E4F143B8];
  unsigned int v13 = KBisxARTBasedKeyBag(-1, a1, a3, (uint64_t)a4, a5, a6, a7, a8);
  CFDictionarySetValue(a1, @"KeyBagVersion", @"1");
  if (v13) {
    CFDictionarySetValue(a1, @"KeybagxART", @"1");
  }
  if (mkdir(a2, 0x1C0u) && *__error() != 17)
  {
    char v40 = __error();
    strerror(*v40);
    debuglog("KBSaveKeyBag", @"Can't create %s: %s", v41, v42, v43, v44, v45, v46, (char)a2);
    return 0xFFFFFFFFLL;
  }
  snprintf((char *)__str, 0x401uLL, "%s/%s.kb", a2, a4);
  if (MKBDeviceTreeContainsKey(":/defaults", @"no-effaceable-storage")) {
    char v14 = 1;
  }
  else {
    char v14 = v13;
  }
  if (v14)
  {
    if (v13 && !MKBDeviceTreeContainsKey(":/defaults", @"no-effaceable-storage")) {
      effaceBlastableBytes(0x42414731u);
    }
    bzero(&__from, 0x401uLL);
    uint64_t v15 = 0xFFFFFFFFLL;
    int v193 = -1;
    snprintf((char *)&__from, 0x401uLL, "%s.writing", (const char *)__str);
    if (!store_binary_dict_fd(a1, (const char *)&__from, &v193))
    {
      if (renamex_np((const char *)&__from, (const char *)__str, 2u) && (__error(), rename(&__from, __str, v16), v17))
      {
        v172 = __error();
        strerror(*v172);
        debuglog("KBSecureSaveObjectNoCrypto", @"could not rename %s to %s: %s (%d)", v173, v174, v175, v176, v177, v178, (char)&__from);
      }
      else if (fcntl(v193, 51))
      {
        v155 = __error();
        strerror(*v155);
        debuglog("KBSecureSaveObjectNoCrypto", @"Unable to fsync %s: %s", v156, v157, v158, v159, v160, v161, (char)&__from);
      }
      else
      {
        if (unlink((const char *)&__from))
        {
          uint64_t v18 = __error();
          char v19 = strerror(*v18);
          debuglog("KBSecureSaveObjectNoCrypto", @"unlink failed: %s", v20, v21, v22, v23, v24, v25, v19);
        }
        uint64_t v15 = 0;
      }
    }
    if (v193 != -1 && close(v193))
    {
      char v26 = v193;
      uint64_t v27 = __error();
      strerror(*v27);
      debuglog("KBSecureSaveObjectNoCrypto", @"failed to close(%d): %s", v28, v29, v30, v31, v32, v33, v26);
    }
    return v15;
  }
  size_t dataOutMoved = 0;
  CCCryptorRef cryptorRef = 0;
  size_t v184 = 52;
  memset(v191, 0, sizeof(v191));
  int v192 = 0;
  if (!v8)
  {
    uint64_t v47 = (const __SecRandom *)*MEMORY[0x1E4F3BC60];
    if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], 0x20uLL, (char *)&v191[1] + 4))
    {
      CFStringRef v180 = @"Can't create key";
    }
    else
    {
      if (!SecRandomCopyBytes(v47, 0x10uLL, (char *)v191 + 4))
      {
LABEL_28:
        CFDataRef v54 = CFDataCreate(0, (const UInt8 *)&v191[1] + 4, 32);
        if (v54)
        {
          CFDataRef v61 = v54;
          CFDataRef v62 = CFDataCreate(0, (const UInt8 *)v191 + 4, 16);
          if (v62)
          {
            CFDataRef v69 = v62;
            CFDataRef v70 = (const __CFData *)convertObjectToBinary(a1);
            if (!v70)
            {
              debuglog("KBSecureSaveObjectWithCrypto", @"Can't serialize object", v71, v72, v73, v74, v75, v76, v181);
              v94 = 0;
              uint64_t v15 = 4294967291;
LABEL_59:
              CFRelease(v61);
              CFRelease(v69);
              if (v94) {
                CFRelease(v94);
              }
              goto LABEL_61;
            }
            CFDataRef v77 = v70;
            CCCryptorStatus v78 = CCCryptorCreate(0, 0, 1u, (char *)&v191[1] + 4, 0x20uLL, (char *)v191 + 4, &cryptorRef);
            if (v78)
            {
              debuglog("KBSecureSaveObjectWithCrypto", @"Can't create cryptor: %d", v79, v80, v81, v82, v83, v84, v78);
              v94 = 0;
            }
            else
            {
              size_t Length = CFDataGetLength(v77);
              Outputsize_t Length = CCCryptorGetOutputLength(cryptorRef, Length, 1);
              CFDictionaryRef Mutable = CFDataCreateMutable(0, OutputLength);
              v94 = Mutable;
              if (!Mutable)
              {
                v162 = "KBSecureSaveObjectWithCrypto";
                CFStringRef v163 = @"Can't create crypt buffer";
LABEL_74:
                debuglog(v162, v163, v88, v89, v90, v91, v92, v93, v181);
                uint64_t v15 = 4294967291;
                goto LABEL_58;
              }
              CFDataSetLength(Mutable, OutputLength);
              v95 = cryptorRef;
              BytePtr = CFDataGetBytePtr(v77);
              MutableBytePtr = CFDataGetMutableBytePtr(v94);
              CCCryptorStatus v98 = CCCryptorUpdate(v95, BytePtr, Length, MutableBytePtr, OutputLength, &dataOutMoved);
              if (!v98)
              {
                v105 = cryptorRef;
                v106 = CFDataGetMutableBytePtr(v94);
                CCCryptorFinal(v105, &v106[dataOutMoved], OutputLength - dataOutMoved, &dataOutMoved);
                unsigned int valuePtr = v10;
                CFTypeRef cf = 0;
                int v187 = -1;
                CFMutableDictionaryRef v107 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
                if (v107)
                {
                  v108 = v107;
                  CFNumberRef v109 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
                  if (!v109) {
                    goto LABEL_81;
                  }
                  CFDictionaryAddValue(v108, @"_MKBIV", v69);
                  CFDictionaryAddValue(v108, @"_MKBWIPEID", v109);
                  CFDictionaryAddValue(v108, @"_MKBPAYLOAD", v94);
                  snprintf((char *)&__from, 0x401uLL, "%s.writing", (const char *)__str);
                  if (store_binary_dict_fd(v108, (const char *)&__from, &v187)) {
                    goto LABEL_81;
                  }
                  if (renamex_np((const char *)&__from, (const char *)__str, 2u))
                  {
                    __error();
                    rename(&__from, __str, v110);
                    if (v111)
                    {
                      v179 = __error();
                      strerror(*v179);
                      p_from = &__from;
                      CFStringRef v171 = @"could not rename %s to %s: %s (%d)";
LABEL_80:
                      debuglog("KBSecureSaveObject", v171, v132, v133, v134, v135, v136, v137, (char)p_from);
                      goto LABEL_81;
                    }
                  }
                  if (fcntl(v187, 51))
                  {
                    v164 = __error();
                    strerror(*v164);
                    debuglog("KBSecureSaveObject", @"Unable to fsync %s: %s", v165, v166, v167, v168, v169, v170, (char)&__from);
LABEL_81:
                    uint64_t v15 = 0xFFFFFFFFLL;
LABEL_51:
                    if (v187 != -1 && close(v187))
                    {
                      char v146 = v187;
                      v147 = __error();
                      strerror(*v147);
                      debuglog("KBSecureSaveObject", @"failed to close(%d): %s", v148, v149, v150, v151, v152, v153, v146);
                    }
                    CFRelease(v108);
                    if (cf) {
                      CFRelease(cf);
                    }
                    if (v109) {
                      CFRelease(v109);
                    }
                    goto LABEL_58;
                  }
                  if ((v8 & 1) == 0)
                  {
                    unsigned int v112 = valuePtr;
                    if (CFDataGetLength(v69) != 16 || CFDataGetLength(v61) != 32)
                    {
                      debuglog("storeWipeIDInfo", @"trying to store invalid iv or secret", v113, v114, v115, v116, v117, v118, (char)p_from);
                      goto LABEL_46;
                    }
                    memset(v195, 0, 32);
                    long long v194 = 0u;
                    int v193 = v112;
                    v198.location = 0;
                    v198.length = 16;
                    CFDataGetBytes(v69, v198, (UInt8 *)&v194);
                    v199.location = 0;
                    v199.length = 32;
                    CFDataGetBytes(v61, v199, v195);
                    int v119 = storeBlastableBytes(v112, &v193, 0x34uLL);
                    if (v119)
                    {
                      debuglog("storeWipeIDInfo", @"Unable to save wipe info: %08x", v120, v121, v122, v123, v124, v125, v119);
LABEL_46:
                      debuglog("KBSecureSaveObject", @"Oh no! Can't save wipe ID", v126, v127, v128, v129, v130, v131, v183);
                    }
                  }
                  if (!KBSecureLoadObjectWithCrypto(__str, &cf))
                  {
                    if (unlink((const char *)&__from))
                    {
                      v138 = __error();
                      char v139 = strerror(*v138);
                      debuglog("KBSecureSaveObject", @"unlink failed: %s", v140, v141, v142, v143, v144, v145, v139);
                    }
                    uint64_t v15 = 0;
                    goto LABEL_51;
                  }
                  CFStringRef v171 = @"failed to validate newly created bag -- should never happen";
                  goto LABEL_80;
                }
                v162 = "KBSecureSaveObject";
                CFStringRef v163 = @"Can't create dict";
                goto LABEL_74;
              }
              debuglog("KBSecureSaveObjectWithCrypto", @"Can't encrypt: %d", v99, v100, v101, v102, v103, v104, v98);
            }
            uint64_t v15 = 4294967289;
LABEL_58:
            CFRelease(v77);
            goto LABEL_59;
          }
          debuglog("KBSecureSaveObjectWithCrypto", @"Can't create iv data", v63, v64, v65, v66, v67, v68, v181);
          CFRelease(v61);
        }
        else
        {
          debuglog("KBSecureSaveObjectWithCrypto", @"Can't create key data", v55, v56, v57, v58, v59, v60, v181);
        }
        uint64_t v15 = 4294967291;
        goto LABEL_61;
      }
      CFStringRef v180 = @"Can't create IV";
    }
    debuglog("KBSecureSaveObjectWithCrypto", v180, v48, v49, v50, v51, v52, v53, v181);
    goto LABEL_85;
  }
  if (!loadBlastableBytes(v10, v191, &v184)) {
    goto LABEL_28;
  }
  debuglog("KBSecureSaveObjectWithCrypto", @"Unable to load wipe info:%08x", v34, v35, v36, v37, v38, v39, v10);
LABEL_85:
  uint64_t v15 = 0xFFFFFFFFLL;
LABEL_61:
  if (cryptorRef) {
    CCCryptorRelease(cryptorRef);
  }
  return v15;
}

uint64_t KBSaveSystemBagHandle(int a1, const char *a2, const void *a3, int a4, uint64_t a5)
{
  v41[129] = *(UInt8 **)MEMORY[0x1E4F143B8];
  if (MKBDeviceSupportsEnhancedAPFS() && a1) {
    return 0;
  }
  if (a5) {
    CFStringRef v16 = @"Saving SystemBag with NO EFFACEABLE ROLL";
  }
  else {
    CFStringRef v16 = @"Saving SystemBag with EFFACEABLE ROLL";
  }
  debuglog("KBSaveSystemBagHandle", v16, v10, v11, v12, v13, v14, v15, v38);
  int v17 = MKBDeviceSupportsEnhancedAPFS();
  if (a1 || !v17)
  {
    v41[0] = 0;
    *(_DWORD *)bytes = 0;
    if (!aks_save_bag())
    {
      CFDataRef v26 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v41[0], *(int *)bytes, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
      if (v26)
      {
        CFDataRef v25 = v26;
        goto LABEL_14;
      }
    }
    return 0xFFFFFFFFLL;
  }
  *(_DWORD *)bytes = 1752065072;
  LODWORD(v41[0]) = -1;
  if (aks_load_bag()) {
    return 0xFFFFFFFFLL;
  }
  aks_unload_bag();
  CFDataRef v18 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], bytes, 4);
  if (!v18) {
    return 0xFFFFFFFFLL;
  }
  CFDataRef v25 = v18;
  debuglog("KBSaveSystemBagHandle", @"Saving handle 0 with the magic handle", v19, v20, v21, v22, v23, v24, v39);
LABEL_14:
  dict = create_dict();
  if (dict)
  {
    uint64_t v28 = dict;
    CFDictionaryAddValue(dict, @"KeyBagKeys", v25);
    if (a3) {
      CFDictionaryAddValue(v28, @"OpaqueStuff", a3);
    }
    if (a4)
    {
      CFDictionaryRef v29 = KBLoadSystemKeyBag();
      if (v29)
      {
        CFDictionaryRef v30 = v29;
        CFDictionaryRef Value = CFDictionaryGetValue(v29, @"BackupKeyBagKeys");
        if (Value)
        {
          uint64_t v32 = Value;
          CFRetain(Value);
          CFRelease(v30);
          CFDictionarySetValue(v28, @"BackupKeyBagKeys", v32);
          CFDictionaryRef v30 = (const __CFDictionary *)v32;
        }
        CFRelease(v30);
      }
    }
    snprintf((char *)v41, 0x401uLL, "%s/%s", a2, "keybags");
    if (KBSaveKeyBag(v28, (const char *)v41, 1111574321, "systembag", a5, v33, v34, v35)) {
      uint64_t v36 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v36 = 0;
    }
    CFRelease(v28);
  }
  else
  {
    uint64_t v36 = 0xFFFFFFFFLL;
  }
  CFRelease(v25);
  return v36;
}

uint64_t MKBDeviceSupportsEnhancedAPFS()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((MKBDeviceSupportsEnhancedAPFS_once & 1) == 0)
  {
    int v0 = MKBDeviceTreeContainsKey(":/filesystems", @"e-apfs");
    size_t __len = 1023;
    bzero(__big, 0x400uLL);
    if ((check_apfs_shared_datavolume_bootarg_init & 1) == 0)
    {
      if (!sysctlbyname("kern.bootargs", __big, &__len, 0, 0) && strnstr(__big, "-apfs_shared_datavolume", __len)) {
        check_apfs_shared_datavolume_bootarg_value = 1;
      }
      check_apfs_shared_datavolume_bootarg_init = 1;
    }
    if (v0 == 1) {
      char v7 = 1;
    }
    else {
      char v7 = check_apfs_shared_datavolume_bootarg_value;
    }
    MKBDeviceSupportsEnhancedAPFS_answer = v7;
    debuglog("MKBDeviceSupportsEnhancedAPFS", @"dt = %d, bootarg = %d", v1, v2, v3, v4, v5, v6, v0);
    MKBDeviceSupportsEnhancedAPFS_once = 1;
  }
  return MKBDeviceSupportsEnhancedAPFS_answer;
}

uint64_t KBSaveUserBagHandle(int a1, uint64_t a2, const void *a3, int a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  memset((char *)&theDict[1] + 4, 0, 12);
  theDict[0] = 0;
  if (MKBDeviceSupportsEnhancedAPFS()) {
    return 0;
  }
  if (a4) {
    CFStringRef v14 = @"Saving UserBag for uid %d with NO EFFACEABLE ROLL";
  }
  else {
    CFStringRef v14 = @"Saving UserBag for uid %d with EFFACEABLE ROLL";
  }
  debuglog("KBSaveUserBagHandle", v14, v8, v9, v10, v11, v12, v13, a2);
  snprintf(__str, 0x401uLL, "%s%s", "/private/var/", "keybags");
  uint64_t KeyBagFile = KBLoadLoadKeyBagFile(__str, "userbag", (CFPropertyListRef *)theDict);
  CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (!KeyBagFile
    || (theDict[0] = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540])) != 0)
  {
    CFStringRef v17 = CFStringCreateWithFormat(v16, 0, @"%d", a2);
    if (v17)
    {
      if (a1 == -1)
      {
        uint64_t v22 = theDict[0];
        CFDictionaryRemoveValue(theDict[0], v17);
        CFDataRef v19 = 0;
        uint64_t v21 = 0;
        goto LABEL_16;
      }
      if (!aks_save_bag())
      {
        CFDataRef v18 = CFDataCreateWithBytesNoCopy(v16, (const UInt8 *)theDict[2], SHIDWORD(theDict[1]), v16);
        if (v18)
        {
          CFDataRef v19 = v18;
          CFDictionaryRef Mutable = CFDictionaryCreateMutable(v16, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          if (!Mutable)
          {
            CFDateRef v24 = 0;
            CFDateRef v26 = 0;
LABEL_32:
            CFRelease(v19);
LABEL_33:
            if (theDict[0])
            {
              CFRelease(theDict[0]);
              theDict[0] = 0;
            }
            if (v17) {
              CFRelease(v17);
            }
            if (v24) {
              CFRelease(v24);
            }
            if (v26) {
              CFRelease(v26);
            }
            return KeyBagFile;
          }
          uint64_t v21 = Mutable;
          CFDictionarySetValue(Mutable, @"KeyBagKeys", v19);
          if (a3) {
            CFDictionarySetValue(v21, @"OpaqueStuff", a3);
          }
          uint64_t v22 = theDict[0];
          CFDictionarySetValue(theDict[0], v17, v21);
LABEL_16:
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          CFDateRef v24 = CFDateCreate(v16, Current);
          if (CFDictionaryGetValue(v22, @"LastWipeKeyUpdateTimeStamp"))
          {
            double v25 = MEMORY[0x1BA9CD6E0]();
            CFDateRef v26 = CFDateCreate(v16, v25 + 86400.0);
            if (CFDateCompare(v26, v24, 0) != kCFCompareLessThan)
            {
              if ((a4 & 1) == 0) {
                CFDictionarySetValue(v22, @"WipeKeyUpdatePending", (const void *)*MEMORY[0x1E4F1CFD0]);
              }
              goto LABEL_23;
            }
            CFDictionaryRef Value = CFDictionaryGetValue(v22, @"WipeKeyUpdatePending");
            if (!CFEqual(Value, (CFTypeRef)*MEMORY[0x1E4F1CFD0]) && (a4 & 1) != 0)
            {
LABEL_23:
              uint64_t v31 = 1;
              goto LABEL_26;
            }
            CFDictionarySetValue(v22, @"LastWipeKeyUpdateTimeStamp", v24);
            CFDictionarySetValue(v22, @"WipeKeyUpdatePending", (const void *)*MEMORY[0x1E4F1CFC8]);
          }
          else
          {
            CFDictionarySetValue(v22, @"WipeKeyUpdatePending", (const void *)*MEMORY[0x1E4F1CFC8]);
            CFDictionarySetValue(v22, @"LastWipeKeyUpdateTimeStamp", v24);
            CFDateRef v26 = 0;
          }
          uint64_t v31 = 0;
LABEL_26:
          if (KBSaveKeyBag(v22, __str, 1111574322, "userbag", v31, v27, v28, v29)) {
            uint64_t KeyBagFile = KeyBagFile;
          }
          else {
            uint64_t KeyBagFile = 0;
          }
          if (v21) {
            CFRelease(v21);
          }
          if (!v19) {
            goto LABEL_33;
          }
          goto LABEL_32;
        }
      }
    }
    CFDateRef v24 = 0;
    CFDateRef v26 = 0;
    goto LABEL_33;
  }
  return KeyBagFile;
}

BOOL seshat_supports_upgraded_jcop_kud_policy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v30 = 0;
  v29[0] = 0;
  v29[1] = 0;
  theunint64_t Data = 0;
  uint64_t v27 = 0;
  char v25 = -1;
  uint64_t v28 = SeshatCreateSessionWithTimeoutVerbose(65000, &v30, (uint64_t)v29, a4, a5, a6, a7, a8);
  if (v28)
  {
    unint64_t Data = SeshatGetData((id *)&v28, (CFTypeRef *)&theData, (uint64_t)&v25, (uint64_t)&v27, (uint64_t)&v27 + 4);
    if (Data == 0x900000000000)
    {
      BOOL v22 = CFDataGetLength(theData) > 10;
    }
    else
    {
      debuglog("seshat_supports_upgraded_jcop_kud_policy", @"getData() -> 0x%x:0x%x", v9, v10, v11, v12, v13, v14, Data);
      BOOL v22 = 0;
    }
    if (v28) {
      SeshatEndSession((id *)&v28, v15, v16, v17, v18, v19, v20, v21, v24);
    }
  }
  else
  {
    BOOL v22 = 0;
  }
  if (theData) {
    CFRelease(theData);
  }
  return v22;
}

uint64_t seshat_migrate_slot_to_v2(int a1, int a2, CFDataRef theData, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8)
{
  if (!theData)
  {
    char Length = -1;
LABEL_7:
    debuglog("seshat_migrate_slot_to_v2", @"Invalid args %ld", (uint64_t)theData, a4, a5, a6, (uint64_t)a7, a8, Length);
    uint64_t v19 = 28;
    goto LABEL_9;
  }
  if (CFDataGetLength(theData) != 16)
  {
    char Length = CFDataGetLength(theData);
    goto LABEL_7;
  }
  int reset_pubkey = aks_se_get_reset_pubkey();
  if (reset_pubkey)
  {
    debuglog("seshat_migrate_slot_to_v2", @"failed to fetch pubkey 0x%x", v11, v12, v13, v14, v15, v16, reset_pubkey);
    uint64_t v19 = 21;
  }
  else
  {
    debuglog("seshat_migrate_slot_to_v2", @"invalid pubkey %zu", v11, v12, v13, v14, v15, v16, 0);
    uint64_t v19 = 22;
  }
LABEL_9:
  if (a7) {
    *a7 = v19;
  }
  free(0);
  return 0xFFFFFFFFLL;
}

uint64_t seshat_arm_nonce(uint64_t a1, uint64_t a2, unsigned int a3)
{
  char v13 = 0;
  int v12 = 0;
  SeshatCreateNonceBlob(a2, a3, (uint64_t)&v12);
  int v3 = aks_se_set_nonce();
  uint64_t v10 = 0;
  if (v3)
  {
    debuglog("seshat_arm_nonce", @"failed to set nonce 0x%x", v4, v5, v6, v7, v8, v9, v3);
    return 0xFFFFFFFFLL;
  }
  return v10;
}

uint64_t seshat_get_reset_sig(uint64_t a1, CFDataRef *a2, CFDataRef *a3)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t reset_sig = aks_se_get_reset_sig();
  if (reset_sig)
  {
    uint64_t v14 = reset_sig;
    debuglog("seshat_get_reset_sig", @"failed to get sig %x", v6, v7, v8, v9, v10, v11, reset_sig);
    return v14;
  }
  CFDataRef v12 = CFDataCreate(0, 0, 0);
  *a2 = v12;
  if (v12 && (!a3 || (CFDataRef v13 = CFDataCreate(0, 0, 0), (*a3 = v13) != 0))) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

const void *KBSystemKeyBagCopyOpaqueStuff()
{
  CFDictionaryRef v0 = KBLoadSystemKeyBag();
  if (!v0) {
    return 0;
  }
  CFDictionaryRef v1 = v0;
  CFDictionaryRef Value = CFDictionaryGetValue(v0, @"OpaqueStuff");
  int v3 = Value;
  if (Value) {
    CFRetain(Value);
  }
  CFRelease(v1);
  return v3;
}

uint64_t seshat_is_supported()
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  uint64_t v1 = MGCopyAnswer();
  CFBooleanRef v8 = (const __CFBoolean *)v1;
  if (v0) {
    BOOL v9 = v1 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    if (CFBooleanGetValue(v0))
    {
      if (CFBooleanGetValue(v8))
      {
        uint64_t v16 = SeshatAvailable();
        goto LABEL_8;
      }
      CFStringRef v18 = @"seshat_support: cond 2 not satisfied";
    }
    else
    {
      CFStringRef v18 = @"seshat_support: cond 1 not satisfied";
    }
    debuglog("seshat_is_supported", v18, v10, v11, v12, v13, v14, v15, v19);
  }
  uint64_t v16 = 0;
LABEL_8:
  if ((seshat_is_supported_once & 1) == 0)
  {
    debuglog("seshat_is_supported", @"result: %d", v2, v3, v4, v5, v6, v7, v16);
    seshat_is_supported_once = 1;
  }
  if (v0) {
    CFRelease(v0);
  }
  if (v8) {
    CFRelease(v8);
  }
  return v16;
}

void seshat_sep_rm_init()
{
  if (aks_se_support_in_rm_is_set())
  {
    CFStringRef v6 = @"cant fetch state";
LABEL_3:
    debuglog("seshat_sep_rm_init", v6, v0, v1, v2, v3, v4, v5, v30);
    return;
  }
  uint64_t is_supported = seshat_is_supported();
  if (is_supported)
  {
    BOOL v15 = seshat_supports_upgraded_jcop_kud_policy(is_supported, v8, v9, v10, v11, v12, v13, v14);
    char v22 = v15;
    if (v15) {
      aks_set_jcop_supports_updated_kud_policy();
    }
    debuglog("seshat_sep_rm_init", @"JCOP kud support: %d, %d", v16, v17, v18, v19, v20, v21, v22);
    char v23 = SeshatAvailableinRestrictedMode();
    debuglog("seshat_sep_rm_init", @"SERM support: %d", v24, v25, v26, v27, v28, v29, v23);
    if (aks_se_support_in_rm())
    {
      CFStringRef v6 = @"failed to indicate se rm support (expected on devices where feature is disabled)";
      goto LABEL_3;
    }
  }
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> seshat_augment_preflight_result(uint64_t a1, char a2)
{
  unsigned int v12 = 0;
  SeshatAugmentPreflightResult(&v13);
  BYTE6(v13) = ((v13 | ((unint64_t)(WORD2(v13) | (BYTE6(v13) << 16)) << 32)) & 0xFFF9FFFFFFFFFFFFLL | ((unint64_t)(a2 & 3) << 49)) >> 48;
  CFDictionaryRef New = HealthPlistCopyOrCreateNew();
  if (New)
  {
    CFDictionaryRef v4 = New;
    if (HealthPlistGetFailed(New)) {
      BYTE6(v13) = (v13 | ((unint64_t)(WORD2(v13) | (BYTE6(v13) << 16)) << 32) | 0x1000000000000) >> 48;
    }
    CFDictionaryRef Data = HealthPlistGetData(v4);
    if (Data)
    {
      CFArrayRef v6 = Data;
      CFTypeID v7 = CFGetTypeID(Data);
      if (v7 == CFArrayGetTypeID())
      {
        unsigned int v8 = seshat_count_failures(v6, &v12);
        unsigned __int8 v9 = -1;
        if (v8 <= 0xFE) {
          unsigned __int8 v9 = seshat_count_failures(v6, &v12);
        }
        unint64_t v10 = (v13 | ((unint64_t)(WORD2(v13) | (BYTE6(v13) << 16)) << 32)) & 0xFFFF0000FFFFFFFFLL;
        if (v12 >= 0xFF) {
          uint64_t v11 = 255;
        }
        else {
          uint64_t v11 = v12;
        }
        WORD2(v13) = (v10 | ((unint64_t)v9 << 32) | (v11 << 40)) >> 32;
        BYTE6(v13) = (v10 | ((unint64_t)v9 << 32) | (v11 << 40)) >> 48;
      }
    }
    CFRelease(v4);
  }
}

uint64_t seshat_count_failures(CFArrayRef theArray, _DWORD *a2)
{
  if (!theArray) {
    return 0;
  }
  if (a2)
  {
    if (CFArrayGetCount(theArray) < 0) {
      int Count = 0;
    }
    else {
      int Count = CFArrayGetCount(theArray);
    }
    *a2 = Count;
  }
  uint64_t valuePtr = 0;
  if (CFArrayGetCount(theArray) < 1) {
    return 0;
  }
  CFIndex v5 = 0;
  LODWORD(v6) = 0;
  do
  {
    CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(theArray, v5);
    if (CFNumberGetValue(ValueAtIndex, kCFNumberSInt64Type, &valuePtr)) {
      BOOL v8 = valuePtr == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8) {
      uint64_t v6 = v6;
    }
    else {
      uint64_t v6 = (v6 + 1);
    }
    ++v5;
  }
  while (CFArrayGetCount(theArray) > v5);
  return v6;
}

void KBSeshatEffaceUnusedSlots(id *p_SessionWithTimeout, uint64_t a2)
{
  unsigned __int8 v21 = -18;
  uint64_t v19 = 0;
  theCFDictionaryRef Data = 0;
  char v18 = -1;
  uint64_t SessionWithTimeout = 0;
  if ((seshat_is_supported() & 1) == 0)
  {
    CFStringRef v15 = @"unsupported";
    goto LABEL_25;
  }
  if (!p_SessionWithTimeout)
  {
    uint64_t SessionWithTimeout = SeshatCreateSessionWithTimeout(65000, v4, v5, v6, v7, v8, v9, v10);
    if (!SessionWithTimeout)
    {
      CFStringRef v15 = @"CreateSession() failed";
      goto LABEL_25;
    }
    p_uint64_t SessionWithTimeout = (id *)&SessionWithTimeout;
  }
  if (KBGetSEStuffForMementoPasscode(a2, 0, 0, &v21, 0, 0)) {
    int v11 = 238;
  }
  else {
    int v11 = v21;
  }
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  if (aks_memento_get_state() || (v23 & 0x400000000) == 0)
  {
    int v12 = 238;
  }
  else
  {
    int v12 = v22;
    unsigned __int8 v21 = v22;
  }
  if (SeshatGetData(p_SessionWithTimeout, (CFTypeRef *)&theData, (uint64_t)&v18, (uint64_t)&v19, (uint64_t)&v19 + 4) != 0x900000000000)
  {
    CFStringRef v15 = @"SeshatGetData() failed";
    goto LABEL_25;
  }
  uint64_t v13 = 0;
  while (1)
  {
    if (CFDataGetBytePtr(theData)[v13] != 238)
    {
      if (v11 == v13 || v12 == v13)
      {
        debuglog("KBSeshatEffaceUnusedSlots", @"not effacing slot %d thats currently referenced by handle %d, (main:%d, memento:%d)", v5, v6, v7, v8, v9, v10, v13);
        goto LABEL_19;
      }
      debuglog("KBSeshatEffaceUnusedSlots", @"effacing se slot %d", v5, v6, v7, v8, v9, v10, v13);
      if (SeshatDeleteSlot(p_SessionWithTimeout, v13, (uint64_t)&v19 + 4) != 0x900000000000) {
        break;
      }
    }
LABEL_19:
    if (++v13 == 10) {
      goto LABEL_20;
    }
  }
  char v16 = v13;
  CFStringRef v15 = @"SeshatDeleteSlot() failed %d";
LABEL_25:
  debuglog("KBSeshatEffaceUnusedSlots", v15, v5, v6, v7, v8, v9, v10, v16);
LABEL_20:
  if (theData)
  {
    CFRelease(theData);
    theCFDictionaryRef Data = 0;
  }
  if (SessionWithTimeout) {
    SeshatEndSession((id *)&SessionWithTimeout, v14, v5, v6, v7, v8, v9, v10, v16);
  }
}

uint64_t KBGetSEStuff(uint64_t a1, unsigned char *a2, uint64_t a3, _DWORD *a4)
{
  return KBGetSEStuffForMementoPasscode(a1, 0, 0, a2, a3, a4);
}

uint64_t KBGetMementoSESlot()
{
  return 0xFFFFFFFFLL;
}

uint64_t KBGetSEStuffForMementoPasscode(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, uint64_t a5, _DWORD *a6)
{
  if (a3) {
    uint64_t reset_token_for_memento_secret = aks_se_get_reset_token_for_memento_secret();
  }
  else {
    uint64_t reset_token_for_memento_secret = aks_se_get_reset_token();
  }
  uint64_t v17 = reset_token_for_memento_secret;
  if (reset_token_for_memento_secret)
  {
    debuglog("KBGetSEStuffForMementoPasscode", @"aks_se_get_reset_token(memento:%d) -> 0x%x", v11, v12, v13, v14, v15, v16, a3 != 0);
  }
  else
  {
    if (a4) {
      *a4 = 0;
    }
    if (a6) {
      *a6 = 1;
    }
    if (a5)
    {
      debuglog("KBGetSEStuffForMementoPasscode", @"no resetToken avaialble", v11, v12, v13, v14, v15, v16, v19);
      return 4294967283;
    }
    else
    {
      return 0;
    }
  }
  return v17;
}

uint64_t getNVRam(char *cStr, _DWORD *a2, char **a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  CFStringRef v5 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  io_registry_entry_t v6 = IORegistryEntryFromPath(*MEMORY[0x1E4F2EEF0], "IODeviceTree:/options");
  if (v6)
  {
    io_object_t v13 = v6;
    CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v6, v5, 0, 0);
    if (CFProperty)
    {
      CFStringRef v21 = CFProperty;
      if (a2) {
        *a2 = 1;
      }
      if (a3)
      {
        CFTypeID v22 = CFGetTypeID(CFProperty);
        if (v22 == CFStringGetTypeID())
        {
          if (CFStringGetCString(v21, buffer, 1024, 0x8000100u)) {
            *a3 = strdup(buffer);
          }
        }
        else
        {
          CFTypeID v24 = CFGetTypeID(v21);
          if (v24 == CFDataGetTypeID())
          {
            size_t Length = CFDataGetLength((CFDataRef)v21);
            uint64_t v26 = (char *)malloc_type_calloc(1uLL, Length + 1, 0xEFD9411AuLL);
            *a3 = v26;
            if (v26)
            {
              uint64_t v27 = v26;
              BytePtr = CFDataGetBytePtr((CFDataRef)v21);
              memcpy(v27, BytePtr, Length);
            }
          }
          else
          {
            *a3 = 0;
          }
        }
      }
      CFRelease(v21);
    }
    else
    {
      debuglog("getNVRam", @"Could not create string for value", v15, v16, v17, v18, v19, v20, v30);
      if (a2) {
        *a2 = 0;
      }
    }
    IOObjectRelease(v13);
    uint64_t v23 = 0;
  }
  else
  {
    debuglog("getNVRam", @"Could not get options entry from the device tree", v7, v8, v9, v10, v11, v12, v30);
    uint64_t v23 = 0xFFFFFFFFLL;
  }
  CFRelease(v5);
  return v23;
}

uint64_t setNVRam(char *cStr, const char *a2)
{
  kern_return_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v29;

  CFStringRef v3 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  io_registry_entry_t v4 = IORegistryEntryFromPath(*MEMORY[0x1E4F2EEF0], "IODeviceTree:/options");
  if (v4)
  {
    io_registry_entry_t v11 = v4;
    CFStringRef v12 = CFStringCreateWithCString(0, a2, 0x8000100u);
    if (v12)
    {
      CFStringRef v19 = v12;
      uint64_t v20 = IORegistryEntrySetCFProperty(v11, v3, v12);
      if (v20)
      {
        debuglog("setNVRam", @"Could not save value:%08x", v21, v22, v23, v24, v25, v26, v20);
        uint64_t v27 = 0xFFFFFFFFLL;
      }
      else
      {
        uint64_t v27 = 0;
      }
      CFRelease(v19);
    }
    else
    {
      debuglog("setNVRam", @"Could not create string for value", v13, v14, v15, v16, v17, v18, v29);
      uint64_t v27 = 0xFFFFFFFFLL;
    }
    IOObjectRelease(v11);
  }
  else
  {
    debuglog("setNVRam", @"Could not get options entry from the device tree", v5, v6, v7, v8, v9, v10, v29);
    uint64_t v27 = 0xFFFFFFFFLL;
  }
  CFRelease(v3);
  return v27;
}

uint64_t removeNVRam(const char *a1)
{
  return setNVRam("IONVRAM-DELETE-PROPERTY", a1);
}

uint64_t is_user_primary(int a1, BOOL *a2)
{
  if (!MKBDeviceSupportsEnhancedAPFS())
  {
    CFUUIDRef v13 = 0;
    CFUUIDRef v23 = 0;
    BOOL v24 = a1 == 0;
LABEL_14:
    uint64_t v25 = 0;
    *a2 = v24;
    goto LABEL_15;
  }
  if (!AKSIdentityGetPrimary() || aks_get_configuration()) {
    goto LABEL_21;
  }
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(0, (const void *)*MEMORY[0x1E4F4D958]);
  if (!Value || (v11 = Value, CFTypeID v12 = CFGetTypeID(Value), v12 != CFDataGetTypeID()) || CFDataGetLength(v11) != 16)
  {
    debuglog("is_user_primary", @"no user uuid in the bag %d", v5, v6, v7, v8, v9, v10, a1);
LABEL_21:
    CFUUIDRef v13 = 0;
    goto LABEL_23;
  }
  CFUUIDBytes v27 = *(CFUUIDBytes *)CFDataGetBytePtr(v11);
  CFUUIDRef v13 = CFUUIDCreateFromUUIDBytes(0, v27);
  CFDataRef v14 = (const __CFData *)CFDictionaryGetValue(0, (const void *)*MEMORY[0x1E4F4D950]);
  if (v14)
  {
    CFDataRef v21 = v14;
    CFTypeID v22 = CFGetTypeID(v14);
    if (v22 == CFDataGetTypeID() && CFDataGetLength(v21) == 16)
    {
      CFUUIDBytes v28 = *(CFUUIDBytes *)CFDataGetBytePtr(v21);
      CFUUIDRef v23 = CFUUIDCreateFromUUIDBytes(0, v28);
      if (CFEqual(v23, 0)) {
        BOOL v24 = CFEqual(v13, 0) != 0;
      }
      else {
        BOOL v24 = 0;
      }
      goto LABEL_14;
    }
  }
  debuglog("is_user_primary", @"no group uuid in the bag %d", v15, v16, v17, v18, v19, v20, a1);
LABEL_23:
  CFUUIDRef v23 = 0;
  uint64_t v25 = 0xFFFFFFFFLL;
LABEL_15:
  if (v13) {
    CFRelease(v13);
  }
  if (v23) {
    CFRelease(v23);
  }
  return v25;
}

uint64_t get_se_recovery_count()
{
  int v7 = 0;
  __str = 0;
  int NVRam = getNVRam("seshat-count", &v7, &__str);
  uint64_t v1 = __str;
  if (NVRam) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = __str == 0;
  }
  if (v2
    || (__endptr = 0, *__error() = 0, LODWORD(v3) = strtol(__str, &__endptr, 10), uint64_t v1 = __str, !*__str)
    || *__endptr)
  {
    uint64_t v3 = 0;
    if (v1) {
LABEL_8:
    }
      free(v1);
  }
  else
  {
    if (*__error() == 34) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = v3;
    }
    uint64_t v1 = __str;
    if (__str) {
      goto LABEL_8;
    }
  }
  return v3;
}

uint64_t _se_unenrollment_condition(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0 && !aks_memento_get_state()) {
    aks_get_lock_state();
  }
  return 0;
}

uint64_t KBChangeSystemSecret(int a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFData *a5, uint64_t a6, const void *a7, unsigned int a8)
{
  uint64_t v15 = 0xFFFFFFFFLL;
  unsigned int v291 = -1;
  if (!aks_get_system())
  {
    v284 = a7;
    uint64_t v285 = a3;
    CFDataRef v288 = a5;
    int v290 = 0;
    aks_get_lock_state();
    unsigned int v286 = a8;
    int v16 = _se_unenrollment_condition(v291, a8);
    BOOL v17 = 0;
    if (seshat_is_supported())
    {
      if (SeshatEnabled()) {
        BOOL v17 = !IsConfiguredMultiUser();
      }
      else {
        BOOL v17 = 0;
      }
    }
    BOOL v289 = 0;
    int Debug = SeshatGetDebug();
    if ((Debug & 0x20000) != 0) {
      debuglog("KBChangeSystemSecret", @"disabled immediate enrollment", v18, v19, v20, v21, v22, v23, v277);
    }
    if (!v17)
    {
      BOOL v40 = 0;
      goto LABEL_26;
    }
    LODWORD(v294[0]) = 0;
    CFDictionaryRef New = HealthPlistCopyOrCreateNew();
    CFDictionaryRef v26 = New;
    if (New && HealthPlistGetData(New) && HealthPlistGetFailed(v26))
    {
      debuglog("seshat_preflight_for_passcode_change", @"health data contains failures", v27, v28, v29, v30, v31, v32, v277);
      int v64 = -1;
    }
    else
    {
      if (!MGGetBoolAnswer() || (SeshatGetDebug() & 0x800) != 0)
      {
        unsigned int se_recovery_count = get_se_recovery_count();
        if (se_recovery_count >= 2)
        {
          debuglog("seshat_preflight_for_passcode_change", @"bad user experience = %u", v42, v43, v44, v45, v46, v47, se_recovery_count);
          int v64 = -1;
          if (!v26) {
            goto LABEL_25;
          }
          goto LABEL_24;
        }
      }
      else
      {
        char v33 = get_se_recovery_count();
        debuglog("seshat_preflight_for_passcode_change", @"ignoring recovery count (%d)", v34, v35, v36, v37, v38, v39, v33);
      }
      uint64_t v48 = SeshatPreflightCheck(1, (uint64_t)&__block_literal_global, v294);
      seshat_augment_preflight_result(v48, 2);
      debuglog("seshat_preflight_for_passcode_change", @"Seshat preflight = %llx (%llx)", v49, v50, v51, v52, v53, v54, v48);
      uint64_t v306 = v48;
      analytics_send_preflight_result((unsigned int *)&v306, v55, v56, v57, v58, v59, v60, v61, v278);
      int v63 = v48 != 14 && v48 != 0;
      int v64 = v63 << 31 >> 31;
      if (!v26) {
        goto LABEL_25;
      }
    }
LABEL_24:
    CFRelease(v26);
LABEL_25:
    BOOL v40 = v64 == 0;
LABEL_26:
    if (is_user_primary(a1, &v289))
    {
      debuglog("KBChangeSystemSecret", @"unable to determine if handle:%d is pirmary", v65, v66, v67, v68, v69, v70, a1);
      return 0xFFFFFFFFLL;
    }
    BOOL v71 = v289;
    debuglog("KBChangeSystemSecret", @"handle: %d, se-support: %d, primary-user: %d, no-passcode: %d, preflight: %d, se_bound: %d, se_unenroll:%d, dis-imm-enr: %d", v65, v66, v67, v68, v69, v70, a1);
    if (!v17
      || (v288 ? (BOOL v72 = !v71) : (BOOL v72 = 1),
          !v72 ? (BOOL v73 = a6 == 0) : (BOOL v73 = 1),
          !v73 ? (BOOL v74 = v40) : (BOOL v74 = 0),
          (*(void *)&Debug & 0x20000) != 0 || ((!v74 | v16) & 1) != 0))
    {
      if (KBChangeSystemNonSeSecret(a1, a2, v285, a4, (uint64_t)v288, a6, a7, v286))
      {
        CFStringRef v273 = @"Failed to change non-se pw";
        goto LABEL_147;
      }
      return 0;
    }
    uint64_t v75 = v291;
    CFTypeRef v303 = 0;
    CFTypeRef v304 = 0;
    CFDataRef v301 = 0;
    CFDataRef v302 = 0;
    uint64_t v299 = 0;
    CFDataRef v300 = 0;
    unsigned __int8 v298 = -1;
    unsigned __int8 v297 = 0;
    int v296 = -1;
    unsigned __int8 v295 = 0;
    v294[0] = 0;
    v294[1] = 0;
    int v293 = 0;
    int lock_state = aks_get_lock_state();
    BOOL v84 = (v293 & 0x2000) == 0 || lock_state != 0;
    unsigned int v283 = KBisxARTBasedKeyBag(v75, 0, v77, v78, v79, v80, v81, v82);
    if (v283) {
      v85 = "single";
    }
    else {
      v85 = "two";
    }
    seshat_sep_rm_init();
    debuglog("KBChangeSystemSeSecret", @"changing SE bound passcode %s phase, memento_recovery: %s", v86, v87, v88, v89, v90, v91, (char)v85);
    uint64_t v305 = SeshatCreateSessionWithTimeoutVerbose(65000, &v295, (uint64_t)v294, v92, v93, v94, v95, v96);
    uint64_t v281 = (int)a6;
    if (v305)
    {
      uint64_t v282 = a6;
      CFDataRef DerivedPasscode = SeshatCreateDerivedPasscode(v288);
      if (!DerivedPasscode)
      {
        debuglog("KBChangeSystemSeSecret", @"failed to derive SE passcode", v104, v105, v106, v107, v108, v109, v279);
        LODWORD(v118) = 0;
        int v245 = 0;
        uint64_t v248 = 0;
        CFTypeRef cf = 0;
        int v167 = -1;
        char v246 = 1;
LABEL_185:
        int v247 = 1;
        int v249 = 1;
        goto LABEL_186;
      }
      uint64_t v110 = (uint64_t)DerivedPasscode;
      unint64_t Data = SeshatGetData((id *)&v305, (CFTypeRef *)&v300, (uint64_t)&v298, (uint64_t)&v299, (uint64_t)&v299 + 4);
      unint64_t v118 = HIDWORD(Data);
      CFTypeRef cf = (CFTypeRef)v110;
      if (Data == 0x900000000000)
      {
        if (v84)
        {
          BOOL v119 = 0;
          uint64_t v120 = v285;
        }
        else
        {
          uint64_t v120 = v285;
          if (v286)
          {
            uint64_t v306 = 0;
            uint64_t v307 = 0;
            if (aks_memento_get_state() || (v307 & 0x400000000) == 0)
            {
              CFStringRef v159 = @"KBGetMementoSESlot() failed";
              goto LABEL_172;
            }
            unsigned __int8 v297 = v306;
          }
          else
          {
            int v133 = KBGetSEStuffForMementoPasscode(v75, 0, 0, &v297, 0, 0);
            if (v133)
            {
              int v167 = v133;
              CFStringRef v276 = @"KBGetSEStuff() failed";
              goto LABEL_182;
            }
          }
          BytePtr = CFDataGetBytePtr(v300);
          if (BytePtr[v297] == 238)
          {
            BOOL v119 = 0;
          }
          else
          {
            uint64_t v141 = CFDataGetBytePtr(v300);
            BOOL v119 = (v141[v297] & 0x80u) != 0;
          }
        }
        unsigned int AvailableSlot = SeshatNextAvailableSlot(v300);
        int v149 = AvailableSlot;
        if (AvailableSlot >= 0xA)
        {
          debuglog("KBChangeSystemSeSecret", @"unexpected slot %d", v143, v144, v145, v146, v147, v148, AvailableSlot);
          int v245 = 0;
          int v249 = 0;
          int v167 = -1;
          uint64_t v248 = 0x400000000000000;
          char v246 = 1;
          LODWORD(v118) = 36864;
LABEL_157:
          int v247 = 1;
LABEL_186:
          uint64_t v178 = v284;
          goto LABEL_187;
        }
        if (!v84 && v119 && seshat_arm_nonce(v75, 0, HIDWORD(v299)))
        {
          int v245 = 0;
          uint64_t v248 = 0;
          int v167 = -1000;
LABEL_184:
          char v246 = 1;
          LODWORD(v118) = 36864;
          goto LABEL_185;
        }
        if (v286)
        {
          int v151 = aks_verify_password_memento();
          if (v151)
          {
            debuglog("KBChangeSystemSeSecret", @"cant verify old memento passcode 0x%x", v152, v153, v154, v155, v156, v157, v151);
LABEL_173:
            int v245 = 0;
            uint64_t v248 = 0;
            int v167 = -1;
            goto LABEL_184;
          }
        }
        else
        {
          int v158 = aks_verify_password();
          if (v158)
          {
            char v279 = v158;
            CFStringRef v159 = @"cant verify old passcode 0x%x";
            goto LABEL_172;
          }
        }
        if (v84) {
          goto LABEL_78;
        }
        if (v119)
        {
          if (seshat_get_reset_sig(v75, &v302, 0))
          {
            CFStringRef v159 = @"cant fetch sig";
LABEL_172:
            debuglog("KBChangeSystemSeSecret", v159, v127, v128, v129, v130, v131, v132, v279);
            goto LABEL_173;
          }
          goto LABEL_78;
        }
        if (v286)
        {
          int v160 = KBGetSEStuffForMementoPasscode(v75, v120, (int)a4, 0, (uint64_t)&v302, 0);
          if (v160)
          {
            int v167 = v160;
            debuglog("KBChangeSystemSeSecret", @"KBGetSEStuffForMementoPasscode() -> 0x%x", v161, v162, v163, v164, v165, v166, v160);
LABEL_183:
            int v245 = 0;
            uint64_t v248 = 0;
            goto LABEL_184;
          }
LABEL_78:
          char v169 = v297;
          if (v84)
          {
            char v169 = -18;
            CFDataRef v170 = 0;
          }
          else
          {
            CFDataRef v170 = v302;
          }
          unint64_t Slot = SeshatAllocateSlot((id *)&v305, v149, v169, (uint64_t)v170, (CFTypeRef *)&v301, (uint64_t)&v299 + 4);
          unint64_t v118 = HIDWORD(Slot);
          if (Slot == 0x900000000000)
          {
            uint64_t v178 = v284;
            if (!v301)
            {
              CFStringRef v275 = @"no reset token returned";
              goto LABEL_175;
            }
            unint64_t v179 = SeshatDerive((id *)&v305, v149, v110, &v304, (uint64_t)&v299 + 4, (uint64_t)v294);
            unint64_t v118 = HIDWORD(v179);
            if (v179 == 0x900000000000)
            {
              unint64_t v186 = SeshatDerive((id *)&v305, v149, v110, &v303, (uint64_t)&v299 + 4, (uint64_t)v294);
              unint64_t v118 = HIDWORD(v186);
              if (v186 == 0x900000000000)
              {
                if (!CFEqual(v304, v303))
                {
                  debuglog("KBChangeSystemSeSecret", @"se-sec comparisson failed", v193, v194, v195, v196, v197, v198, v279);
                  int v245 = 0;
                  char v246 = 0;
                  int v249 = 0;
                  int v167 = -1;
                  uint64_t v248 = 0x900000000000000;
                  int v247 = 1;
                  LODWORD(v118) = 36864;
LABEL_187:
                  char v207 = v283;
                  goto LABEL_107;
                }
                unint64_t v199 = SeshatResetCounter((id *)&v305, v149, (uint64_t)v301, (uint64_t)&v299 + 4, v195, v196, v197, v198);
                unint64_t v118 = HIDWORD(v199);
                if (v199 == 0x900000000000)
                {
                  if (v304)
                  {
                    CFDataGetBytePtr((CFDataRef)v304);
                    if (v304) {
                      CFDataGetLength((CFDataRef)v304);
                    }
                  }
                  char Length = (char)v301;
                  if (v301)
                  {
                    CFDataGetBytePtr(v301);
                    char Length = (char)v301;
                    if (v301) {
                      char Length = CFDataGetLength(v301);
                    }
                  }
                  char v207 = v283;
                  char v279 = Length;
                  int v208 = aks_change_secret_opts();
                  if (v208)
                  {
                    debuglog("KBChangeSystemSeSecret", @"change passcode: %x", v172, v173, v174, v175, v176, v177, v208);
                    int v245 = 0;
                    char v246 = 0;
                    uint64_t v248 = 0;
                    int v167 = -1;
                    int v247 = 1;
                    LODWORD(v118) = 36864;
                    int v249 = 1;
LABEL_107:
                    if (v300) {
                      CFRelease(v300);
                    }
                    uint64_t v250 = v305;
                    if (v305) {
                      char v251 = v246;
                    }
                    else {
                      char v251 = 1;
                    }
                    if ((v251 & 1) == 0)
                    {
                      KBSeshatEffaceUnusedSlots((id *)&v305, v75);
                      uint64_t v250 = v305;
                    }
                    if (v250) {
                      SeshatEndSession((id *)&v305, v150, v121, v122, v123, v124, v125, v126, v279);
                    }
                    if (v304) {
                      CFRelease(v304);
                    }
                    if (v303) {
                      CFRelease(v303);
                    }
                    if (cf) {
                      CFRelease(cf);
                    }
                    if (v302) {
                      CFRelease(v302);
                    }
                    if (v301) {
                      CFRelease(v301);
                    }
                    if (v296 == -1) {
                      char v252 = 1;
                    }
                    else {
                      char v252 = v207;
                    }
                    if ((v252 & 1) == 0) {
                      aks_unload_bag();
                    }
                    if (v245 && KBSaveSystemBagHandle(v75, "/private/var/", v178, 1, 1)) {
                      debuglog("KBChangeSystemSeSecret", @"welp, unable to persist old bag", v121, v122, v123, v124, v125, v126, v279);
                    }
                    if ((v286 | v249))
                    {
LABEL_141:
                      if (v167) {
                        goto LABEL_138;
                      }
                      return 0;
                    }
                    SeshatReportIfNeeded(v118, v150, v121, v122, v123, v124, v125, v126);
                    unint64_t v292 = ((unint64_t)(unsigned __int16)v118 << 40) | ((unint64_t)v295 << 6) | v248 | 8;
                    analytics_send_seshat_recovery_required(&v292, v253, v254, v255, v256, v257, v258, v259, v279);
                    debuglog("KBChangeSystemSeSecret", @"SE failed, trying soft recovery (%d)", v260, v261, v262, v263, v264, v265, v247);
                    if (v247)
                    {
                      int v266 = aks_se_recover();
                      if (!v266)
                      {
                        KBSeshatEffaceUnusedSlots(0, v75);
                        if (KBChangeSystemNonSeSecret(v75, 0, v285, (int)a4, (uint64_t)v288, v281, v178, v286))
                        {
LABEL_138:
                          CFStringRef v273 = @"Failed to change pw";
LABEL_147:
                          debuglog("KBChangeSystemSecret", v273, v121, v122, v123, v124, v125, v126, v279);
                          return 0xFFFFFFFFLL;
                        }
                        return 0;
                      }
                      goto LABEL_140;
                    }
                    int v266 = aks_se_recover();
                    if (v266)
                    {
LABEL_140:
                      debuglog("KBChangeSystemSeSecret", @"soft recovery failed 0x%x", v267, v268, v269, v270, v271, v272, v266);
                      int v167 = -1;
                      goto LABEL_141;
                    }
                    KBSeshatEffaceUnusedSlots(0, v75);
                    return 0;
                  }
                  if (v283)
                  {
                    int v296 = v75;
                    uint64_t v215 = v281;
                    if (KBSaveSystemBagHandle(v75, "/private/var/", v284, 1, 0)) {
                      goto LABEL_166;
                    }
                    goto LABEL_101;
                  }
                  uint64_t v215 = v281;
                  if (v296 != -1 && v296 != v75)
                  {
                    int v216 = KBSaveSystemBagHandle(v296, "/private/var/", v284, 1, 0);
                    uint64_t v210 = v282;
                    if (v216)
                    {
LABEL_166:
                      debuglog("KBChangeSystemSeSecret", @"unable to save bag %d", v209, v210, v211, v212, v213, v214, v296);
LABEL_176:
                      int v245 = 0;
                      char v246 = 0;
                      uint64_t v248 = 0;
                      int v167 = -1;
                      int v247 = 1;
                      LODWORD(v118) = 36864;
LABEL_177:
                      int v249 = 1;
                      goto LABEL_187;
                    }
                    int v217 = aks_set_system_with_passcode();
                    if (v217)
                    {
                      debuglog("KBChangeSystemSeSecret", @"set-system failed %d", v218, v219, v220, v221, v222, v223, v217);
                      char v246 = 0;
                      uint64_t v248 = 0;
                      int v167 = -1;
                      int v245 = 1;
                      LODWORD(v118) = 36864;
                      int v247 = 1;
                      goto LABEL_177;
                    }
LABEL_101:
                    int v224 = aks_change_secret_epilogue();
                    if (!v224)
                    {
                      char v207 = v283;
                      if (v298 == 238
                        || (unint64_t v231 = SeshatAuthorizeUpdate((id *)&v305, 1, v149, (uint64_t)v301, (uint64_t)&v299 + 4),
                            unint64_t v118 = HIDWORD(v231),
                            v231 == 0x900000000000))
                      {
                        uint64_t v306 = 0;
                        if (seshat_migrate_slot_to_v2(v75, v149, v301, (uint64_t)&v305, (uint64_t)v288, v215, &v306, v230))
                        {
                          uint64_t v237 = v306;
                          seshat_augment_preflight_result(v306, 2);
                          unint64_t v292 = v237;
                          analytics_send_preflight_result((unsigned int *)&v292, v238, v239, v240, v241, v242, v243, v244, v279);
                        }
                        int v245 = 0;
                        char v246 = 0;
                        int v247 = 0;
                        uint64_t v248 = 0;
                        int v167 = 0;
                        int v249 = 1;
                        LODWORD(v118) = 36864;
                      }
                      else
                      {
                        debuglog("KBChangeSystemSeSecret", @"AuthorizeUpdate() -> 0x%x:0x%x", v232, v233, v234, v235, v236, v230, v231);
                        int v245 = 0;
                        char v246 = 0;
                        int v247 = 0;
                        int v249 = 0;
                        int v167 = 0;
                        uint64_t v248 = 0xA00000000000000;
                      }
                      goto LABEL_107;
                    }
                    int v167 = v224;
                    debuglog("KBChangeSystemSeSecret", @"aks_change_secret_epilogue() failed %x", v225, v226, v227, v228, v229, v230, v224);
                    int v245 = 0;
                    char v246 = 0;
                    uint64_t v248 = 0;
                    int v247 = 1;
                    LODWORD(v118) = 36864;
                    int v249 = 1;
                    goto LABEL_187;
                  }
                  char v279 = v296;
                  CFStringRef v275 = @"temp handle is invalid: %d";
LABEL_175:
                  debuglog("KBChangeSystemSeSecret", v275, v172, v173, v174, v175, v176, v177, v279);
                  goto LABEL_176;
                }
                debuglog("KBChangeSystemSeSecret", @"resetCounter() -> 0x%x:0x%x", v200, v201, v202, v203, v204, v205, v199);
                int v245 = 0;
                char v246 = 0;
                int v249 = 0;
                int v167 = -1;
                uint64_t v248 = 0x800000000000000;
LABEL_164:
                int v247 = 1;
                goto LABEL_187;
              }
              debuglog("KBChangeSystemSeSecret", @"derive2() -> 0x%x:0x%x", v187, v188, v189, v190, v191, v192, v186);
            }
            else
            {
              debuglog("KBChangeSystemSeSecret", @"derive() -> 0x%x:0x%x", v180, v181, v182, v183, v184, v185, v179);
            }
            int v245 = 0;
            char v246 = 0;
            int v249 = 0;
            int v167 = -1;
            uint64_t v248 = 0x700000000000000;
            goto LABEL_164;
          }
          debuglog("KBChangeSystemSeSecret", @"allocateSlot() -> 0x%x:0x%x", v172, v173, v174, v175, v176, v177, Slot);
          int v245 = 0;
          int v249 = 0;
          int v167 = -1;
          uint64_t v248 = 0x600000000000000;
          goto LABEL_156;
        }
        int v168 = KBGetSEStuffForMementoPasscode(v75, 0, 0, 0, (uint64_t)&v302, 0);
        if (!v168) {
          goto LABEL_78;
        }
        int v167 = v168;
        CFStringRef v276 = @"KBGetSEStuff() failed -- unlock required to change passcode";
LABEL_182:
        debuglog("KBChangeSystemSeSecret", v276, v134, v135, v136, v137, v138, v139, v279);
        goto LABEL_183;
      }
      debuglog("KBChangeSystemSeSecret", @"SeshatGetData() failed", v112, v113, v114, v115, v116, v117, v279);
      int v245 = 0;
      int v249 = 0;
      int v167 = -1;
      uint64_t v248 = 0x300000000000000;
    }
    else
    {
      debuglog("KBChangeSystemSeSecret", @"CreateSession() failed", v97, v98, v99, v100, v101, v102, v279);
      LODWORD(v118) = 0;
      int v245 = 0;
      int v249 = 0;
      CFTypeRef cf = 0;
      int v167 = -1;
      uint64_t v248 = 0x200000000000000;
    }
LABEL_156:
    char v246 = 1;
    goto LABEL_157;
  }
  return v15;
}

uint64_t KBChangeSystemNonSeSecret(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const void *a7, uint64_t a8)
{
  int v65 = -1;
  unsigned int v11 = KBisxARTBasedKeyBag(a1, 0, a3, a4, a5, a6, (uint64_t)a7, a8);
  char v18 = v11;
  uint64_t v19 = "two";
  if (v11) {
    uint64_t v19 = "single";
  }
  debuglog("KBChangeSystemNonSeSecret", @"changing non-SE passcode %s phase, (params:%d)", v12, v13, v14, v15, v16, v17, (char)v19);
  char v64 = 0;
  int v20 = aks_change_secret_opts();
  if (v20)
  {
    debuglog("KBChangeSystemNonSeSecret", @"change-secret failed %x", v21, v22, v23, v24, v25, v26, v20);
    goto LABEL_31;
  }
  if ((v18 & 1) == 0)
  {
    debuglog("KBChangeSystemNonSeSecret", @"temp handle is invalid: %d", v21, v22, v23, v24, v25, v26, -1);
LABEL_31:
    int v55 = 0;
    goto LABEL_32;
  }
  int v65 = a1;
  if (a1)
  {
    uint64_t v27 = KBSaveUserBagHandle(a1, a2, a7, 0);
    if (v27)
    {
      uint64_t v34 = v27;
      debuglog("KBChangeSystemNonSeSecret", @"unable to save bag %d", v28, v29, v30, v31, v32, v33, a1);
LABEL_15:
      int v55 = 0;
      goto LABEL_16;
    }
    goto LABEL_11;
  }
  if (KBSaveSystemBagHandle(0, "/private/var/", a7, 1, 0))
  {
    debuglog("KBChangeSystemNonSeSecret", @"unable to save bag %d", v35, v36, v37, v38, v39, v40, a1);
    goto LABEL_31;
  }
LABEL_11:
  if ((v18 & 1) != 0 || (int v41 = aks_set_system_with_passcode()) == 0)
  {
    uint64_t v48 = aks_change_secret_epilogue();
    uint64_t v34 = v48;
    if (v48) {
      debuglog("KBChangeSystemNonSeSecret", @"aks_change_secret_epilogue() failed %x", v49, v50, v51, v52, v53, v54, v48);
    }
    goto LABEL_15;
  }
  debuglog("KBChangeSystemNonSeSecret", @"set-system failed %d", v42, v43, v44, v45, v46, v47, v41);
  int v55 = 1;
LABEL_32:
  uint64_t v34 = 0xFFFFFFFFLL;
LABEL_16:
  if (v65 == -1) {
    char v56 = 1;
  }
  else {
    char v56 = v18;
  }
  if ((v56 & 1) == 0) {
    aks_unload_bag();
  }
  if (v55)
  {
    if (!a1)
    {
      if (!KBSaveSystemBagHandle(0, "/private/var/", a7, 1, 1)) {
        return v34;
      }
      goto LABEL_24;
    }
    if (KBSaveUserBagHandle(a1, a2, a7, 1)) {
LABEL_24:
    }
      debuglog("KBChangeSystemNonSeSecret", @"welp, unable to persist old bag", v57, v58, v59, v60, v61, v62, v64);
  }
  return v34;
}

uint64_t KBChangeSystemSecretWithEscrow(const __CFData *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const void *a7)
{
  if (a1)
  {
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
  }
  if (aks_recover_with_escrow_bag()) {
    return 0xFFFFFFFFLL;
  }
  if (MKBDeviceSupportsEnhancedAPFS()) {
    return 0;
  }

  return KBSaveSystemBagHandle(0, "/private/var/", a7, 1, 0);
}

uint64_t MKBDeviceTreeContainsKey(const char *a1, const __CFString *a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  size_t v4 = strlen(a1) + 13;
  uint64_t v5 = (char *)malloc_type_malloc(v4, 0x5189311FuLL);
  if (!v5) {
    return 4294967291;
  }
  uint64_t v6 = v5;
  snprintf(v5, v4, "%s%s", "IODeviceTree", a1);
  io_registry_entry_t v7 = IORegistryEntryFromPath(*MEMORY[0x1E4F2EEF0], v6);
  if (v7)
  {
    io_object_t v8 = v7;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v7, a2, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    if (CFProperty)
    {
      CFRelease(CFProperty);
      uint64_t v10 = 1;
    }
    else
    {
      uint64_t v10 = 0;
    }
    IOObjectRelease(v8);
  }
  else
  {
    uint64_t v10 = 4294967288;
  }
  free(v6);
  return v10;
}

uint64_t MKBDeviceSupportsContentProtection()
{
  return MKBDeviceTreeContainsKey(":/defaults", @"content-protect");
}

BOOL MKBDeviceSupportsEffaceableStorage()
{
  return MKBDeviceTreeContainsKey(":/defaults", @"no-effaceable-storage") == 0;
}

uint64_t KBUpdateKeyBag(int a1, uint64_t a2)
{
  if (a1) {
    CFDictionaryRef v4 = KBLoadUserKeybag(-a1);
  }
  else {
    CFDictionaryRef v4 = KBLoadSystemKeyBag();
  }
  CFDictionaryRef v11 = v4;
  if (v4)
  {
    CFDataRef Value = CFDictionaryGetValue(v4, @"OpaqueStuff");
    uint64_t v13 = Value;
    if (Value) {
      CFRetain(Value);
    }
    CFRelease(v11);
    debuglog("KBUpdateKeyBag", @"Got opaqueStuff from ondisk keybag", v14, v15, v16, v17, v18, v19, v29);
    if (aks_get_system())
    {
      uint64_t v27 = 0xFFFFFFFFLL;
      if (!v13) {
        return v27;
      }
      goto LABEL_13;
    }
    if (a1) {
      uint64_t v20 = KBSaveUserBagHandle(0, -a1, v13, a2);
    }
    else {
      uint64_t v20 = KBSaveSystemBagHandle(0, "/private/var/", v13, 1, a2);
    }
    uint64_t v27 = v20;
    debuglog("KBUpdateKeyBag", @"Saved new keybag for handle %d with result %d", v21, v22, v23, v24, v25, v26, a1);
    if (v13) {
LABEL_13:
    }
      CFRelease(v13);
  }
  else
  {
    debuglog("KBUpdateKeyBag", @"failed to open ondisk keybag, failing UpdateKeyBag", v5, v6, v7, v8, v9, v10, v29);
    return 0xFFFFFFFFLL;
  }
  return v27;
}

void KBSetCookie(uint64_t a1, uint64_t a2, void *a3, void *a4, int a5)
{
  uint64_t v9 = dlopen("/System/Library/PrivateFrameworks/APFS.framework/APFS", 2);
  if (!v9)
  {
    CFStringRef v24 = @"Failed to open APFS framework";
    goto LABEL_8;
  }
  uint64_t v16 = dlsym(v9, "APFSVolumePayloadSet");
  if (!v16)
  {
    CFStringRef v24 = @"Failed to resolve gAPFSVolumePayloadSet";
LABEL_8:
    debuglog("KBSetCookie", v24, v10, v11, v12, v13, v14, v15, v34);
    uint64_t v16 = 0;
    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  if (a5)
  {
LABEL_4:
    int v17 = aks_copy_volume_cookie_persona();
    if (v17)
    {
      debuglog("KBSetCookie", @"Failed to get keybag persona Cookiefrom AKS:0x%x", v18, v19, v20, v21, v22, v23, v17);
      goto LABEL_17;
    }
    CFStringRef v26 = @"Retrieved keybag persona Cookie from AKS, setting in APFS volume";
    goto LABEL_13;
  }
LABEL_9:
  int v25 = aks_copy_volume_cookie();
  if (v25)
  {
    debuglog("KBSetCookie", @"Failed to get keybag Cookie from AKS:0x%x", v18, v19, v20, v21, v22, v23, v25);
    goto LABEL_17;
  }
  CFStringRef v26 = @"Retrieved keybag Cookie from AKS, setting in APFS volume";
LABEL_13:
  debuglog("KBSetCookie", v26, v18, v19, v20, v21, v22, v23, v34);
  if (v16)
  {
    int v27 = ((uint64_t (*)(uint64_t, void, void, void))v16)(a2, 0, 0, 0);
    if (v27) {
      debuglog("KBSetCookie", @"APFSVolumePayloadSet failed with %d", v28, v29, v30, v31, v32, v33, v27);
    }
    else {
      debuglog("KBSetCookie", @"APFSVolumePayloadSet succeeded", v28, v29, v30, v31, v32, v33, v35);
    }
  }
LABEL_17:
  if (a3)
  {
    if (a4)
    {
      *a3 = 0;
      *a4 = 0;
    }
  }
}

uint64_t KBMapVolume(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  size_t size = 0;
  int v65 = 0;
  uint64_t v8 = dlopen("/System/Library/PrivateFrameworks/APFS.framework/APFS", 2);
  if (!v8)
  {
    CFStringRef v43 = @"Failed to open APFS framework";
    goto LABEL_11;
  }
  uint64_t v15 = v8;
  uint64_t v22 = dlsym(v8, "APFSVolumePayloadGet");
  if (!v22) {
    debuglog("KBMapVolume", @"Failed to resolve gAPFSVolumePayloadGet", v16, v17, v18, v19, v20, v21, v63);
  }
  if (!dlsym(v15, "APFSVolumePayloadSet")) {
    debuglog("KBMapVolume", @"Failed to resolve gAPFSVolumePayloadSet", v23, v24, v25, v26, v27, v28, v63);
  }
  if (v22)
  {
    int v29 = ((uint64_t (*)(uint64_t, void, void, size_t *))v22)(a3, 0, 0, &size);
    if (v29)
    {
      int v36 = v29;
      debuglog("KBMapVolume", @"APFSVolumePayloadGet failed with %d", v30, v31, v32, v33, v34, v35, v29);
      if (v36 == 49154)
      {
        debuglog("KBMapVolume", @"Not cookie in this volume, attempting to write it", v37, v38, v39, v40, v41, v42, v63);
        KBSetCookie(a1, a3, &v65, &size, a5);
      }
      goto LABEL_12;
    }
    debuglog("KBMapVolume", @"APFSVolumePayloadGet len reveived to be %zd", v30, v31, v32, v33, v34, v35, size);
    int v55 = malloc_type_malloc(size, 0x21D0A9C3uLL);
    int v65 = v55;
    if (v55)
    {
      int v56 = ((uint64_t (*)(uint64_t, void, void *, size_t *))v22)(a3, 0, v55, &size);
      if (v56) {
        debuglog("KBMapVolume", @"Failed to  obtain cookie from the volume with error %d", v57, v58, v59, v60, v61, v62, v56);
      }
      else {
        debuglog("KBMapVolume", @"Successfully obtained the cookie for the volume with length:%zd", v57, v58, v59, v60, v61, v62, size);
      }
      goto LABEL_12;
    }
    CFStringRef v43 = @"Failed to allocate Cookie malloc space";
LABEL_11:
    debuglog("KBMapVolume", v43, v9, v10, v11, v12, v13, v14, v63);
  }
LABEL_12:
  if (a5)
  {
    uint64_t v44 = aks_set_keybag_for_volume_with_cookie_persona();
    uint64_t v51 = v44;
    if (v44)
    {
      debuglog("KBMapVolume", @"aks_set_keybag_for_volume_with_cookie_persona FAIL with 0x%x", v45, v46, v47, v48, v49, v50, v44);
      goto LABEL_20;
    }
    CFStringRef v53 = @"aks_set_keybag_for_volume_with_cookie_persona SUCCESS";
  }
  else
  {
    uint64_t v52 = aks_set_keybag_for_volume_with_cookie();
    uint64_t v51 = v52;
    if (v52)
    {
      debuglog("KBMapVolume", @"aks_set_keybag_for_volume_with_cookie FAIL with 0x%x", v45, v46, v47, v48, v49, v50, v52);
      goto LABEL_20;
    }
    CFStringRef v53 = @"aks_set_keybag_for_volume_with_cookie SUCCESS";
  }
  debuglog("KBMapVolume", v53, v45, v46, v47, v48, v49, v50, v63);
LABEL_20:
  if (v65) {
    free(v65);
  }
  return v51;
}

uint64_t KBMapDeviceBag(const char *a1, int a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  memset(v48, 0, 512);
  memset(&v50, 0, 512);
  if (statfs(a1, &v50))
  {
    uint64_t v10 = __error();
    char v44 = strerror(*v10);
    debuglog("has_data_protection", @"Statfs failed due to:%s on  (%s)", v11, v12, v13, v14, v15, v16, v44);
LABEL_5:
    debuglog("has_data_protection", @"mount point (%s) does not support Data Protection", v17, v18, v19, v20, v21, v22, (char)a1);
    return 0;
  }
  if ((v50.f_flags & 0x80) == 0)
  {
    debuglog("has_data_protection", @"mount is with NO CPROTECT:0x%x on  (%s)", v4, v5, v6, v7, v8, v9, v50.f_flags);
    goto LABEL_5;
  }
  LOWORD(v45) = 5;
  LODWORD(v46) = -2147188736;
  if (getattrlist(a1, &v45, v48, 0x41CuLL, 0))
  {
    __error();
    debuglog("KBMapDeviceBag", @"Could not get %s volume attributes (errno=%d)", v30, v31, v32, v33, v34, v35, (char)a1);
    return 4294967290;
  }
  int v36 = (char *)v48 + SDWORD1(v48[0]) + 4;
  if (v36 >= v49 || &v36[DWORD2(v48[0])] >= v49)
  {
    debuglog("KBMapDeviceBag", @"Attribute buffer too small. offset=%d, lenght=%u", (uint64_t)v36, v25, v26, v27, v28, v29, SBYTE4(v48[0]));
    return 4294967290;
  }
  uint64_t v37 = KBMapVolume(0, 0, (uint64_t)v36, (unint64_t)v48 | 0xC, a2);
  uint64_t v23 = convertAKSErrorToMKB(v37);
  if (v23) {
    debuglog("KBMapDeviceBag", @"Could not map %s volume (ret=%d)", v38, v39, v40, v41, v42, v43, (char)a1);
  }
  return v23;
}

uint64_t KBSecureLoadObjectWithCrypto(const std::__fs::filesystem::path *a1, CFPropertyListRef *a2)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  theunint64_t Data = 0;
  CFDataRef v80 = 0;
  size_t v77 = 0;
  CCCryptorRef cryptorRef = 0;
  size_t dataOutMoved = 0;
  *a2 = 0;
  bzero(__str, 0x401uLL);
  CFDataRef v81 = 0;
  int v4 = validateSecureFile((const char *)a1, &v81, (CFTypeRef *)&v80, (CFTypeRef *)&theData);
  if (v4)
  {
    debuglog("KBSecureLoadObject", @"Failed to validate keybag file: %d, %d", v5, v6, v7, v8, v9, v10, v4);
    snprintf((char *)__str, 0x401uLL, "%s.writing", (const char *)a1);
    int v11 = validateSecureFile((const char *)__str, &v81, (CFTypeRef *)&v80, (CFTypeRef *)&theData);
    if (v11 || !v81)
    {
      debuglog("KBSecureLoadObject", @"Failed to validate keybag file: %d", (uint64_t)v12, v13, v14, v15, v16, v17, v11);
    }
    else
    {
      rename(__str, a1, v12);
      if (!v18) {
        goto LABEL_5;
      }
      uint64_t v68 = __error();
      strerror(*v68);
      debuglog("KBSecureLoadObject", @"could not rename %s to %s: %s", v69, v70, v71, v72, v73, v74, (char)__str);
    }
    uint64_t v60 = 4294967288;
    debuglog("KBSecureLoadObjectWithCrypto", @"Can't load secure keybag Object: %d", v62, v63, v64, v65, v66, v67, -8);
    CFDataRef v19 = 0;
    goto LABEL_12;
  }
LABEL_5:
  CFDataRef v19 = v81;
  BytePtr = CFDataGetBytePtr(theData);
  size_t Length = CFDataGetLength(theData);
  uint64_t v22 = CFDataGetBytePtr(v80);
  CCCryptorStatus v23 = CCCryptorCreate(1u, 0, 1u, BytePtr, Length, v22, &cryptorRef);
  if (v23)
  {
    debuglog("KBSecureLoadObjectWithCrypto", @"Can't create decryptor: %d", v24, v25, v26, v27, v28, v29, v23);
    uint64_t v60 = 4294967289;
    goto LABEL_12;
  }
  uint64_t v30 = CFDataGetBytePtr(v19);
  size_t v31 = CFDataGetLength(v19);
  uint64_t v32 = (UInt8 *)malloc_type_malloc(v31, 0x47E4BB70uLL);
  if (!v32)
  {
    debuglog("KBSecureLoadObjectWithCrypto", @"Can't allocate decryption buffer", v33, v34, v35, v36, v37, v38, v75);
    uint64_t v60 = 4294967291;
    goto LABEL_12;
  }
  uint64_t v39 = v32;
  uint64_t v40 = cryptorRef;
  size_t v41 = CFDataGetLength(v19);
  size_t v42 = CFDataGetLength(v19);
  CCCryptorStatus v43 = CCCryptorUpdate(v40, v30, v41, v39, v42, &dataOutMoved);
  if (v43)
  {
    debuglog("KBSecureLoadObjectWithCrypto", @"Unable to decrypt: %d", v44, v45, v46, v47, v48, v49, v43);
  }
  else
  {
    statfs v50 = cryptorRef;
    uint64_t v51 = &v39[dataOutMoved];
    CFIndex v52 = CFDataGetLength(v19);
    CCCryptorStatus v53 = CCCryptorFinal(v50, v51, v52 - dataOutMoved, &v77);
    if (!v53)
    {
      uint64_t v60 = 0;
      *a2 = convertBinaryToObject(v39, (v77 + dataOutMoved));
      goto LABEL_10;
    }
    debuglog("KBSecureLoadObjectWithCrypto", @"Unable to finalize: %d", v54, v55, v56, v57, v58, v59, v53);
  }
  uint64_t v60 = 4294967289;
LABEL_10:
  if (v39 != v30) {
    free(v39);
  }
LABEL_12:
  if (v80)
  {
    CFRelease(v80);
    CFDataRef v80 = 0;
  }
  if (theData)
  {
    CFRelease(theData);
    theunint64_t Data = 0;
  }
  if (v19) {
    CFRelease(v19);
  }
  CCCryptorRelease(cryptorRef);
  return v60;
}

uint64_t validateSecureFile(const char *a1, void *a2, CFTypeRef *a3, CFTypeRef *a4)
{
  char v7 = (char)a1;
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef binary_dict = (const __CFDictionary *)load_binary_dict(a1);
  if (!binary_dict)
  {
    debuglog("validateSecureFile", @"Unable to load %s", v9, v10, v11, v12, v13, v14, v7);
    return 0xFFFFFFFFLL;
  }
  CFDictionaryRef v15 = binary_dict;
  unsigned int valuePtr = 0;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(binary_dict, @"_MKBWIPEID");
  if (!Value || (CFNumberRef v23 = Value, v24 = CFGetTypeID(Value), v24 != CFNumberGetTypeID()))
  {
    debuglog("validateSecureFile", @"%s missing wipeID", v17, v18, v19, v20, v21, v22, v7);
LABEL_35:
    CFRelease(v15);
    return 0xFFFFFFFFLL;
  }
  uint64_t v25 = CFDictionaryGetValue(v15, @"_MKBIV");
  if (!v25 || (v32 = v25, CFTypeID v33 = CFGetTypeID(v25), v33 != CFDataGetTypeID()))
  {
    debuglog("validateSecureFile", @"%s missing IV", v26, v27, v28, v29, v30, v31, v7);
    goto LABEL_35;
  }
  uint64_t v34 = CFDictionaryGetValue(v15, @"_MKBPAYLOAD");
  if (!v34 || (size_t v41 = v34, v42 = CFGetTypeID(v34), v42 != CFDataGetTypeID()))
  {
    debuglog("validateSecureFile", @"%s missing payload", v35, v36, v37, v38, v39, v40, v7);
    goto LABEL_35;
  }
  CFNumberGetValue(v23, kCFNumberIntType, &valuePtr);
  unsigned int v43 = valuePtr;
  int v86 = 0;
  memset(v85, 0, sizeof(v85));
  size_t v84 = 52;
  int v44 = loadBlastableBytes(valuePtr, v85, &v84);
  if (v44)
  {
    debuglog("loadWipeIDInfo", @"Unable to load wipe info: %08x", v45, v46, v47, v48, v49, v50, v44);
LABEL_34:
    debuglog("validateSecureFile", @"Can't load wipe info for ID:%08x", v76, v77, v78, v79, v80, v81, valuePtr);
    goto LABEL_35;
  }
  if (LODWORD(v85[0]) != v43)
  {
    debuglog("loadWipeIDInfo", @"Wipe Info ID is wrong: %d", v45, v46, v47, v48, v49, v50, v85[0]);
    goto LABEL_34;
  }
  CFDataRef v51 = CFDataCreate(0, (const UInt8 *)v85 + 4, 16);
  if (!v51)
  {
    debuglog("loadWipeIDInfo", @"Can't create iv data", v52, v53, v54, v55, v56, v57, v82);
    goto LABEL_34;
  }
  CFDataRef v58 = v51;
  CFDataRef v59 = CFDataCreate(0, (const UInt8 *)&v85[1] + 4, 32);
  if (!v59)
  {
    debuglog("loadWipeIDInfo", @"Can't create key data", v60, v61, v62, v63, v64, v65, v82);
    CFRelease(v58);
    goto LABEL_34;
  }
  CFDataRef v66 = v59;
  if (CFEqual(v32, v58))
  {
    if (a3) {
      *a3 = CFRetain(v58);
    }
    if (a4) {
      *a4 = CFRetain(v66);
    }
    if (!a2)
    {
      uint64_t v74 = 0;
      goto LABEL_23;
    }
    CFTypeRef v73 = CFRetain(v41);
    uint64_t v74 = 0;
    goto LABEL_21;
  }
  debuglog("validateSecureFile", @"fileIV to wipeIV mismatch, no payload returned", v67, v68, v69, v70, v71, v72, v82);
  CFShow(v32);
  CFShow(v58);
  uint64_t v74 = 4294967287;
  if (a2)
  {
    CFTypeRef v73 = 0;
LABEL_21:
    *a2 = v73;
  }
LABEL_23:
  CFRelease(v15);
  CFRelease(v58);
  CFRelease(v66);
  return v74;
}

CFDataRef KBisxARTBasedKeyBag(int a1, const __CFDictionary *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 != -1)
  {
    int lock_state = aks_get_lock_state();
    if (!lock_state)
    {
      CFDataRef v9 = 0;
      goto LABEL_7;
    }
    debuglog("KBisxARTBasedKeyBag", @"get_lock_state() -> 0x%x", a3, a4, a5, a6, a7, a8, lock_state);
LABEL_9:
    CFDataRef v9 = 0;
    goto LABEL_7;
  }
  if (!a2) {
    goto LABEL_9;
  }
  CFDataRef Data = (const __CFData *)_getData(a2, @"KeyBagKeys");
  CFDataRef v9 = Data;
  if (Data)
  {
    CFDataGetBytePtr(Data);
    CFDataGetLength(v9);
    CFDataRef v9 = (const __CFData *)aks_bag_in_xart();
  }
LABEL_7:
  debuglog("KBisxARTBasedKeyBag", @"Result = %d", a3, a4, a5, a6, a7, a8, (char)v9);
  return v9;
}

uint64_t seshat_preflight_condition_for_pw_change_block_invoke()
{
  if (!aks_get_lock_state()) {
    return 1;
  }
  debuglog("seshat_preflight_condition_for_pw_change_block_invoke", @"no lock state", v0, v1, v2, v3, v4, v5, v7);
  return 0;
}

uint64_t (*MKBSetLogFunction(uint64_t (*a1)(void)))(void, void)
{
  _log_func = a1;
  return KBSetLogger((uint64_t (*)(void, void))debuglog);
}

uint64_t MKBLockDevice(CFDictionaryRef theDict)
{
  if (theDict)
  {
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"LockDeviceNow");
    if (Value)
    {
      CFBooleanRef v3 = Value;
      CFTypeID v4 = CFGetTypeID(Value);
      if (v4 == CFBooleanGetTypeID()) {
        CFBooleanGetValue(v3);
      }
    }
  }
  handleToUse(theDict);
  uint64_t v5 = aks_lock_device();

  return convertAKSErrorToMKB(v5);
}

uint64_t MKBLockDeviceNow(const __CFDictionary *a1)
{
  handleToUse(a1);
  uint64_t v1 = aks_lock_device();

  return convertAKSErrorToMKB(v1);
}

uint64_t MKBSeshatDebug(uint64_t a1)
{
  uint64_t v2 = +[MKBKeyStoreDevice sharedService];
  [v2 SeshatDebug:a1];

  return 0;
}

uint64_t MKBUnlockDevice(const __CFData *a1, const __CFDictionary *a2)
{
  return MKBUnlockDeviceForACMRef(a1, a2, 0);
}

uint64_t MKBUnlockDeviceForACMRef(const __CFData *a1, const __CFDictionary *a2, const __CFData *a3)
{
  int v6 = handleToUse(a2);
  CFDictionaryRef v7 = should_use_memento(a2);
  if (a2)
  {
    CFBooleanRef Value = CFDictionaryGetValue(a2, @"VerifyOnly");
    BOOL v9 = (BOOL)Value;
    if (!Value) {
      goto LABEL_5;
    }
    CFTypeID v10 = CFGetTypeID(Value);
    if (v10 == CFBooleanGetTypeID())
    {
      BOOL v9 = CFBooleanGetValue((CFBooleanRef)v9) != 0;
      goto LABEL_5;
    }
    debuglog("verify_only_opt", @"key is of wrong type", v11, v12, v13, v14, v15, v16, v34);
  }
  BOOL v9 = 0;
LABEL_5:
  unsigned __int8 v17 = ShouldSkipSE(a2);
  if (v6)
  {
    uint64_t v18 = +[MKBKeyStoreDevice sharedService];
    [v18 passcodeUnlockStart];
  }
  if (v7)
  {
    if (a1)
    {
      CFDataGetBytePtr(a1);
      CFDataGetLength(a1);
      if (!a3)
      {
LABEL_18:
        uint64_t v19 = aks_verify_password_memento();
        goto LABEL_22;
      }
    }
    else if (!a3)
    {
      goto LABEL_18;
    }
    CFDataGetBytePtr(a3);
    CFDataGetLength(a3);
    goto LABEL_18;
  }
  if (v9)
  {
    if (a1)
    {
      CFDataGetBytePtr(a1);
      CFDataGetLength(a1);
      if (!a3)
      {
LABEL_20:
        uint64_t v19 = aks_verify_password();
        goto LABEL_22;
      }
    }
    else if (!a3)
    {
      goto LABEL_20;
    }
    CFDataGetBytePtr(a3);
    CFDataGetLength(a3);
    goto LABEL_20;
  }
  if (a1)
  {
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
  }
  uint64_t v19 = aks_unlock_device();
LABEL_22:
  uint64_t v26 = v19;
  if (v6)
  {
    if (!v19 || v19 == -536362988)
    {
      uint64_t v27 = +[MKBKeyStoreDevice sharedService];
      [v27 passcodeUnlockSuccess];

      if (v26 != -536362988)
      {
        if (v26 != -536362987)
        {
LABEL_37:
          int v29 = 0;
          if (v26) {
            goto LABEL_40;
          }
          goto LABEL_38;
        }
LABEL_33:
        uint64_t v30 = +[MKBKeyStoreDevice sharedService];
        uint64_t v26 = [v30 SeshatUnlock:a1 withMemento:v7 verifyOnly:v9 withACMRef:a3];

        int v29 = 2;
        if (v26) {
          goto LABEL_40;
        }
LABEL_38:
        v29 |= 1u;
        goto LABEL_39;
      }
      goto LABEL_35;
    }
    uint64_t v28 = +[MKBKeyStoreDevice sharedService];
    [v28 passcodeUnlockFailed];
  }
  if (v26 == -536362987) {
    goto LABEL_33;
  }
  if (v26 == -536362988)
  {
LABEL_35:
    uint64_t v26 = 3758604308;
    if (v17)
    {
      debuglog("MKBUnlockDeviceForACMRef", @"Skipping enrollment", v20, v21, v22, v23, v24, v25, v34);
    }
    else
    {
      debuglog("MKBUnlockDeviceForACMRef", @"Prompted to SE enroll", v20, v21, v22, v23, v24, v25, v34);
      CFTypeID v33 = +[MKBKeyStoreDevice sharedService];
      [v33 SeshatEnroll:a1];
    }
    int v29 = 0;
    if (a1) {
      goto LABEL_41;
    }
    return convertAKSErrorToMKB(v26);
  }
  if (v26 != -536870184) {
    goto LABEL_37;
  }
  MKBKeyBagChangeSystemGeneration((uint64_t)a1, 3);
  int v29 = 1;
LABEL_39:
  uint64_t v26 = 0;
LABEL_40:
  if (a1)
  {
LABEL_41:
    uint64_t v31 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __MKBUnlockDeviceForACMRef_block_invoke;
    block[3] = &__block_descriptor_36_e5_v8__0l;
    int v36 = v29;
    dispatch_async(v31, block);
  }
  return convertAKSErrorToMKB(v26);
}

uint64_t MKBVerifyPasswordWithContext(const __CFDictionary *a1, const __CFData *a2, const __CFData *a3)
{
  unsigned int v6 = should_use_memento(a1);
  unsigned int v13 = v6;
  if (a3 && v6)
  {
    debuglog("MKBVerifyPasswordWithContext", @"memento verifiers and acm context are unsupported", v7, v8, v9, v10, v11, v12, v18);
    return 4294967279;
  }
  handleToUse(a1);
  if (v13)
  {
    if (a2)
    {
      CFDataGetBytePtr(a2);
      CFDataGetLength(a2);
      if (!a3)
      {
LABEL_12:
        uint64_t v15 = aks_verify_password_memento();
        goto LABEL_15;
      }
    }
    else if (!a3)
    {
      goto LABEL_12;
    }
    CFDataGetBytePtr(a3);
    CFDataGetLength(a3);
    goto LABEL_12;
  }
  if (!a2)
  {
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  CFDataGetBytePtr(a2);
  CFDataGetLength(a2);
  if (a3)
  {
LABEL_10:
    CFDataGetBytePtr(a3);
    CFDataGetLength(a3);
  }
LABEL_14:
  uint64_t v15 = aks_verify_password();
LABEL_15:
  if (v15 == -536362987)
  {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, a1);
    CFDictionaryAddValue(MutableCopy, @"VerifyOnly", (const void *)*MEMORY[0x1E4F1CFD0]);
    uint64_t v17 = MKBUnlockDeviceForACMRef(a2, MutableCopy, a3);
    CFRelease(MutableCopy);
    return v17;
  }
  else
  {
    return convertAKSErrorToMKB(v15);
  }
}

CFDictionaryRef should_use_memento(const __CFDictionary *result)
{
  if (result)
  {
    CFMutableDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, @"UseMementoBlob");
    if (result)
    {
      CFBooleanRef v1 = result;
      CFTypeID v2 = CFGetTypeID(result);
      if (v2 == CFBooleanGetTypeID())
      {
        return (const __CFDictionary *)(CFBooleanGetValue(v1) != 0);
      }
      else
      {
        debuglog("should_use_memento", @"key is of wrong type", v3, v4, v5, v6, v7, v8, v9);
        return 0;
      }
    }
  }
  return result;
}

uint64_t MKBGetDeviceLockStateIndirect(const __CFDictionary *a1)
{
  uint64_t Int = 0xFFFFFFFFLL;
  unsigned int v7 = -1;
  if (a1)
  {
    if (CFDictionaryContainsKey(a1, @"ExtendedDeviceLockState")) {
      BOOL v3 = _getBool(a1, @"ExtendedDeviceLockState") != 0;
    }
    else {
      BOOL v3 = 0;
    }
    if (CFDictionaryContainsKey(a1, @"DeviceHandle")) {
      uint64_t Int = _getInt(a1, @"DeviceHandle");
    }
    if (CFDictionaryContainsKey(a1, kMKBUserSessionIDKey)) {
      uint64_t Int = _getInt(a1, kMKBUserSessionIDKey);
    }
  }
  else
  {
    BOOL v3 = 0;
  }
  uint64_t v4 = +[MKBKeyStoreDevice sharedService];
  int v5 = [v4 getDeviceLockStateForUser:Int extendedState:v3 withLockStateInfo:&v7];

  if (v5) {
    return v7;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t MKBSetSpacedRepetitionMode(uint64_t a1)
{
  CFTypeID v2 = +[MKBKeyStoreDevice sharedService];
  uint64_t v3 = [v2 setSpacedRepetitionMode:a1];

  return v3;
}

uint64_t MKBDeviceSetGracePeriod(const __CFData *a1, const __CFDictionary *a2)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!Mutable) {
    return 4294967291;
  }
  int v5 = Mutable;
  CFBooleanRef Value = CFDictionaryGetValue(a2, @"GracePeriod");
  if (Value)
  {
    unsigned int v7 = Value;
    CFTypeID v8 = CFGetTypeID(Value);
    if (v8 == CFNumberGetTypeID()) {
      CFDictionarySetValue(v5, @"GracePeriod", v7);
    }
  }
  uint64_t v9 = MKBSetDeviceConfigurations(a1, v5);
  CFRelease(v5);
  LongLonguint64_t Int = _getLongLongInt(a2, @"GracePeriod");
  debuglog("MKBDeviceSetGracePeriod", @"MKBDeviceSetGracePeriod: To (%lld)AKS return Value is %d\n", v11, v12, v13, v14, v15, v16, LongLongInt);
  return v9;
}

uint64_t MKBKeyBagKeyStashSupport(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  debuglog("MKBKeyBagKeyStashSupport", @"CFMutableDictionaryRef result = %d", a3, a4, a5, a6, a7, a8, 0);
  return 0;
}

uint64_t MKBKeyBagKeyStashCreateWithOpts(const __CFDictionary *a1, uint64_t a2, const __CFData *a3, const __CFData *a4)
{
  handleToUse(0);
  unsigned int v14 = ShouldSkipSE(a1);
  unsigned int v55 = 0;
  if (a2 && (a3 != 0) == (a4 != 0))
  {
    debuglog("MKBKeyBagKeyStashCreateWithOpts", @"passcode and acm are mutually exclusive", v8, v9, v10, v11, v12, v13, v54);
    uint64_t v45 = 4294967279;
  }
  else
  {
    if (_get_userid_from_options(a1, &v55)) {
      int v15 = 2;
    }
    else {
      int v15 = 0;
    }
    BOOL v16 = a3 != 0;
    unsigned int v17 = v15 | v16;
    if (!a3) {
      a3 = a4;
    }
    if (v14) {
      uint64_t v18 = v17 | 4;
    }
    else {
      uint64_t v18 = v17;
    }
    if (a1)
    {
      CFBooleanRef Value = CFDictionaryGetValue(a1, @"Manifest");
      if (Value)
      {
        uint64_t v20 = Value;
        CFTypeID v21 = CFGetTypeID(Value);
        if (v21 != CFDataGetTypeID())
        {
          char v47 = CFGetTypeID(v20);
          debuglog("MKBKeyBagKeyStashCreateWithOpts", @"manifest is of wrong type %lu", v48, v49, v50, v51, v52, v53, v47);
          uint64_t v45 = 0xFFFFFFFFLL;
          goto LABEL_19;
        }
        BytePtr = (unsigned __int8 *)CFDataGetBytePtr((CFDataRef)v20);
        CFIndex Length = CFDataGetLength((CFDataRef)v20);
        log_blob((char)"first manifest", BytePtr, Length, v24, v25, v26, v27, v28);
        CFIndex v29 = CFDataGetLength((CFDataRef)v20);
        uint64_t v30 = CFDataGetBytePtr((CFDataRef)v20);
        if (!quick_der_check((uint64_t)v30, v29))
        {
          uint64_t v45 = 4294967277;
          goto LABEL_19;
        }
        if (a3)
        {
          CFDataGetBytePtr(a3);
          CFDataGetLength(a3);
        }
        CFDataGetBytePtr((CFDataRef)v20);
        CFDataGetLength((CFDataRef)v20);
        uint64_t v37 = aks_migrate_s_key();
        if (v37)
        {
          uint64_t v45 = v37;
          debuglog("MKBKeyBagKeyStashCreateWithOpts", @"failed to migrate skey, opts: %u", v38, v39, v40, v41, v42, v43, v16);
          goto LABEL_19;
        }
      }
    }
    int v44 = +[MKBKeyStoreDevice sharedService];
    uint64_t v45 = [v44 stashCreateWithSecret:a3 withMode:a2 withUID:v55 WithFlags:v18];
  }
LABEL_19:
  debuglog("MKBKeyBagKeyStashCreateWithOpts", @"CFMutableDictionaryRef result = %d (stash_mode:%d, uid:%d, flags:0x%x)", v31, v32, v33, v34, v35, v36, v45);
  return v45;
}

CFDictionaryRef ShouldSkipSE(const __CFDictionary *result)
{
  if (result)
  {
    CFMutableDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, @"SkipSE");
    if (result)
    {
      CFBooleanRef v1 = result;
      CFTypeID v2 = CFGetTypeID(result);
      if (v2 == CFBooleanGetTypeID()) {
        return (const __CFDictionary *)(CFBooleanGetValue(v1) != 0);
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

void log_blob(char a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a3;
  debuglog("log_blob", @"%s (%d):\n", a3, a4, a5, a6, a7, a8, a1);
  if (v8 >= 1)
  {
    do
    {
      if (v8 >= 64) {
        uint64_t v10 = 64;
      }
      else {
        uint64_t v10 = v8;
      }
      uint64_t v11 = v10;
      uint64_t v12 = a2;
      uint64_t v13 = (char *)&log_blob_buf;
      do
      {
        int v14 = *v12++;
        snprintf(v13, 3uLL, "%02x", v14);
        v13 += 2;
        --v11;
      }
      while (v11);
      debuglog("log_blob", @"%d: %s\n", v15, v16, v17, v18, v19, v20, v10);
      a2 += v10;
      BOOL v21 = __OFSUB__(v8, v10);
      v8 -= v10;
    }
    while (!((v8 < 0) ^ v21 | (v8 == 0)));
  }
}

BOOL quick_der_check(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = a1 + a2;
  ccder_decode_tag();
  unint64_t v3 = ccder_decode_len();
  if (v3) {
    BOOL v4 = v2 > v3;
  }
  else {
    BOOL v4 = 0;
  }
  return v4 && v2 == v3;
}

uint64_t MKBKeyBagKeyStashCreateWithMode(uint64_t a1, const __CFData *a2)
{
  return MKBKeyBagKeyStashCreateWithOpts(0, a1, 0, a2);
}

uint64_t MKBKeyBagKeyStashCreate(const __CFData *a1)
{
  return MKBKeyBagKeyStashCreateWithOpts(0, 1, 0, a1);
}

uint64_t MKBKeyBagKeyStashCreateWithManifest(uint64_t a1, const __CFData *a2, const void *a3)
{
  if (!a3) {
    return 4294966296;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!Mutable) {
    return 4294966296;
  }
  CFDictionaryRef v7 = Mutable;
  CFDictionaryAddValue(Mutable, @"Manifest", a3);
  uint64_t v8 = MKBKeyBagKeyStashCreateWithOpts(v7, a1, 0, a2);
  CFRelease(v7);
  return v8;
}

uint64_t _MKBKeyBagKeyStashSetManifest(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    goto LABEL_7;
  }
  CFTypeID v9 = CFGetTypeID(a1);
  if (v9 != CFDataGetTypeID())
  {
    char v14 = CFGetTypeID(a1);
    debuglog("_MKBKeyBagKeyStashSetManifest", @"manifest is of wrong type %lu", v15, v16, v17, v18, v19, v20, v14);
LABEL_7:
    uint64_t v12 = 4294966296;
    goto LABEL_5;
  }
  CFIndex Length = CFDataGetLength((CFDataRef)a1);
  BytePtr = CFDataGetBytePtr((CFDataRef)a1);
  if (quick_der_check((uint64_t)BytePtr, Length))
  {
    CFDataGetBytePtr((CFDataRef)a1);
    CFDataGetLength((CFDataRef)a1);
    uint64_t v12 = aks_migrate_s_key();
  }
  else
  {
    uint64_t v12 = 4294967277;
  }
LABEL_5:
  debuglog("_MKBKeyBagKeyStashSetManifest", @"CFMutableDictionaryRef result = %d", a3, a4, a5, a6, a7, a8, v12);
  return v12;
}

uint64_t MKBKeyBagKeyStashSetManifest(const void *a1)
{
  uint64_t v2 = handleToUse(0);

  return _MKBKeyBagKeyStashSetManifest(a1, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t MKBKeyBagKeyStashEnableWithManifest(const void *a1)
{
  if (!a1) {
    return 4294966296;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!Mutable) {
    return 4294966296;
  }
  CFDictionaryRef v3 = Mutable;
  CFDictionaryAddValue(Mutable, @"Manifest", a1);
  uint64_t v4 = MKBKeyBagKeyStashEnableWithOpts(v3);
  CFRelease(v3);
  return v4;
}

uint64_t MKBKeyBagKeyStashEnableWithOpts(const __CFDictionary *a1)
{
  uint64_t v2 = handleToUse(a1);
  if (!a1
    || (CFBooleanRef Value = CFDictionaryGetValue(a1, @"Manifest")) == 0
    || (uint64_t v10 = _MKBKeyBagKeyStashSetManifest(Value, v2, v4, v5, v6, v7, v8, v9), !v10))
  {
    uint64_t v17 = aks_stash_enable();
    uint64_t v10 = convertAKSErrorToMKB(v17);
  }
  uint64_t v18 = v10;
  debuglog("MKBKeyBagKeyStashEnableWithOpts", @"CFMutableDictionaryRef result = %d, (handle:%d)", v11, v12, v13, v14, v15, v16, v10);
  return v18;
}

uint64_t MKBKeyBagKeyStashEnable()
{
  return MKBKeyBagKeyStashEnableWithOpts(0);
}

uint64_t MKBKeyBagKeyStashCommitWithOpts(const __CFDictionary *a1)
{
  unsigned int v13 = 0;
  int userid_from_options = _get_userid_from_options(a1, &v13);
  uint64_t v2 = +[MKBKeyStoreDevice sharedService];
  CFDictionaryRef v3 = v2;
  if (userid_from_options) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [v2 stashCommit:v13 WithFlags:v4];

  debuglog("MKBKeyBagKeyStashCommitWithOpts", @"CFMutableDictionaryRef result = %d, (uid:%u, flags:0x%x)", v6, v7, v8, v9, v10, v11, v5);
  return v5;
}

uint64_t MKBKeyBagKeyStashCommit()
{
  return MKBKeyBagKeyStashCommitWithOpts(0);
}

uint64_t MKBKeyBagKeyStashDestroy()
{
  uint64_t v0 = +[MKBKeyStoreDevice sharedService];
  uint64_t v1 = [v0 stashDestroy];

  debuglog("MKBKeyBagKeyStashDestroy", @"CFMutableDictionaryRef result = %d", v2, v3, v4, v5, v6, v7, v1);
  return v1;
}

uint64_t MKBKeyBagKeyStashPersistWithOpts(const __CFDictionary *a1)
{
  handleToUse(a1);
  uint64_t v1 = aks_stash_persist();
  uint64_t v2 = convertAKSErrorToMKB(v1);
  debuglog("MKBKeyBagKeyStashPersistWithOpts", @"CFMutableDictionaryRef result = %d, (handle:%d)", v3, v4, v5, v6, v7, v8, v2);
  return v2;
}

uint64_t MKBKeyBagKeyStashPersist()
{
  return MKBKeyBagKeyStashPersistWithOpts(0);
}

__CFDictionary *MKBKeyBagKeyStashVerifyWithOpts(const __CFDictionary *a1)
{
  int v11 = 0;
  int valuePtr = 2;
  uint64_t v1 = (const void **)MEMORY[0x1E4F1CFC8];
  unsigned int v10 = 0;
  if (_get_userid_from_options(a1, &v10)) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 0;
  }
  dict = create_dict();
  if (dict) {
    int valuePtr = 2;
  }
  uint64_t v4 = *v1;
  uint64_t v5 = +[MKBKeyStoreDevice sharedService];
  int v6 = [v5 stashVerifywithValidity:&valuePtr WithUID:v10 WithFlags:v2];

  if (v6) {
    int valuePtr = 2;
  }
  CFNumberRef v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(dict, @"StashBagValidOnDisk", v7);
  CFRelease(v7);
  uint64_t lock_state = aks_get_lock_state();
  if (!convertAKSErrorToMKB(lock_state) && (v11 & 0x400) != 0) {
    uint64_t v4 = (const void *)*MEMORY[0x1E4F1CFD0];
  }
  CFDictionarySetValue(dict, @"StashStagedManifest", v4);
  CFRelease(v4);
  return dict;
}

__CFDictionary *MKBKeyBagKeyStashVerify()
{
  return MKBKeyBagKeyStashVerifyWithOpts(0);
}

uint64_t MKBKeyBagKeyStashLoadWithOpts(const __CFDictionary *a1)
{
  handleToUse(a1);
  if (aks_get_current_sep_measurement())
  {
    debuglog("MKBKeyBagKeyStashLoadWithOpts", @"failed to fetch measurement\n", v1, v2, v3, v4, v5, v6, v17);
  }
  else
  {
    log_blob((char)"sep measurement", 0, 0, v2, v3, v4, v5, v6);
    free(0);
  }
  int v7 = aks_stash_load();
  if (v7) {
    uint64_t v14 = 4294967287;
  }
  else {
    uint64_t v14 = 0;
  }
  char v15 = -9;
  if (!v7) {
    char v15 = 0;
  }
  debuglog("MKBKeyBagKeyStashLoadWithOpts", @"CFMutableDictionaryRef result = %d, (handle: %d)", v8, v9, v10, v11, v12, v13, v15);
  return v14;
}

uint64_t MKBKeyBagKeyStashLoad()
{
  return MKBKeyBagKeyStashLoadWithOpts(0);
}

uint64_t MKBKeyBagChangeSystemSecret(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = +[MKBKeyStoreDevice sharedService];
  uint64_t v7 = [v6 changeSystemSecretFromOldPasscode:a1 ToNew:a2 withOpaqueData:a3 withParams:0];

  return v7;
}

uint64_t MKBKeyBagChangeSystemSecretOpts(uint64_t a1, uint64_t a2, uint64_t a3, CFDictionaryRef theDict, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!theDict) {
    goto LABEL_10;
  }
  CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"OverrideMemento");
  CFBooleanRef v13 = Value;
  if (!Value) {
    goto LABEL_5;
  }
  CFTypeID v14 = CFGetTypeID(Value);
  if (v14 != CFBooleanGetTypeID())
  {
    debuglog("__options_to_change_secret_params", @"key is of wrong type", v15, v16, v17, v18, v19, v20, v33);
LABEL_10:
    CFBooleanRef v13 = 0;
    goto LABEL_8;
  }
  CFBooleanRef v13 = (const __CFBoolean *)(2 * (CFBooleanGetValue(v13) != 0));
LABEL_5:
  CFBooleanRef v21 = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"UseMementoBlob");
  if (v21)
  {
    CFBooleanRef v22 = v21;
    CFTypeID v23 = CFGetTypeID(v21);
    if (v23 == CFBooleanGetTypeID()) {
      CFBooleanRef v13 = (const __CFBoolean *)(v13 | (CFBooleanGetValue(v22) != 0));
    }
    else {
      debuglog("__options_to_change_secret_params", @"key is of wrong type", v24, v25, v26, v27, v28, v29, v33);
    }
  }
LABEL_8:
  debuglog("MKBKeyBagChangeSystemSecretOpts", @"params = %d", a3, (uint64_t)theDict, a5, a6, a7, a8, (char)v13);
  uint64_t v30 = +[MKBKeyStoreDevice sharedService];
  uint64_t v31 = [v30 changeSystemSecretFromOldPasscode:a1 ToNew:a2 withOpaqueData:a3 withParams:v13];

  return v31;
}

uint64_t MKBKeyBagEffaceMementoBlob(const __CFDictionary *a1)
{
  handleToUse(a1);
  uint64_t v1 = aks_memento_efface_blob();

  return convertAKSErrorToMKB(v1);
}

unint64_t MKBKeyBagMementoIsSupported(const __CFDictionary *a1)
{
  CFDictionaryRef v1 = (const __CFDictionary *)MKBGetDeviceConfigurations(a1);
  if (!v1) {
    return 0;
  }
  CFDictionaryRef v2 = v1;
  CFBooleanRef Value = CFDictionaryGetValue(v1, @"MementoSupported");
  unint64_t v4 = (unint64_t)Value;
  if (Value)
  {
    CFTypeID v5 = CFGetTypeID(Value);
    unint64_t v4 = v5 == CFBooleanGetTypeID() && v4 == *MEMORY[0x1E4F1CFD0];
  }
  CFRelease(v2);
  return v4;
}

uint64_t MKBKeyBagMementoGetBlobState(const __CFDictionary *a1, CFMutableDictionaryRef *a2)
{
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!Mutable) {
    return 0xFFFFFFFFLL;
  }
  CFMutableDictionaryRef v6 = Mutable;
  handleToUse(a1);
  uint64_t state = aks_memento_get_state();
  if (state)
  {
    uint64_t v12 = convertAKSErrorToMKB(state);
LABEL_15:
    CFRelease(v6);
    return v12;
  }
  CFNumberRef v8 = CFNumberCreate(v4, kCFNumberSInt8Type, &v14);
  CFDictionarySetValue(v6, @"MementoBlobSeSlot", v8);
  if (v8) {
    CFRelease(v8);
  }
  CFNumberRef v9 = CFNumberCreate(v4, kCFNumberSInt32Type, (char *)&v14 + 4);
  CFDictionarySetValue(v6, @"MementoBlobFailedAttempts", v9);
  if (v9) {
    CFRelease(v9);
  }
  CFNumberRef v10 = CFNumberCreate(v4, kCFNumberSInt32Type, &v15);
  CFDictionarySetValue(v6, @"MementoBlobMaxUnlockAttempts", v10);
  if (v10) {
    CFRelease(v10);
  }
  CFNumberRef v11 = CFNumberCreate(v4, kCFNumberSInt32Type, (char *)&v15 + 4);
  CFDictionarySetValue(v6, @"MementoBlobState", v11);
  if (v11) {
    CFRelease(v11);
  }
  uint64_t v12 = 0;
  if (!a2) {
    goto LABEL_15;
  }
  *a2 = v6;
  return v12;
}

uint64_t MKBKeyBagCopySytemSecretBlob(uint64_t *a1)
{
  CFDictionaryRef v2 = +[MKBKeyStoreDevice sharedService];
  uint64_t v3 = [v2 copySytemSecretBlob];

  if (a1) {
    *a1 = v3;
  }
  return 0;
}

uint64_t MKBKeyBagCopySystemOpaqueBlob(void *a1)
{
  CFDictionaryRef v2 = KBSystemKeyBagCopyOpaqueStuff();
  if (a1) {
    *a1 = v2;
  }
  return 0;
}

uint64_t MKBKeyBagCleanupAfterMigration()
{
  CFDictionaryRef Value = KBLoadSystemKeyBag();
  if (Value && (CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(Value, @"KeybagxART")) == 0)
  {
    debuglog("MKBKeyBagCleanupAfterMigration", @"System KeyBag plist still contains keys! Not xART based! Do not delete!", v2, v3, v4, v5, v6, v7, vars0);
    return 0xFFFFFFFFLL;
  }
  else
  {
    KBCleanupSystemKeyBag((uint64_t)Value, v1, v2, v3, v4, v5, v6, v7, vars0);
    return 0;
  }
}

uint64_t MKBKeyBagSetSystemSecretBlob(uint64_t a1)
{
  uint64_t v2 = +[MKBKeyStoreDevice sharedService];
  uint64_t v3 = [v2 SetSystemSecretBlob:a1];

  return v3;
}

uint64_t MKBAssertionGetTypeID()
{
  return __gMKBAssertionTypeID;
}

uint64_t __MKBAssertionnRegisterClass()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __gMKBAssertionTypeID = result;
  return result;
}

_DWORD *MKBDeviceLockAssertion(const __CFDictionary *a1, CFErrorRef *a2)
{
  uint64_t valuePtr = 0;
  pthread_once(&MKBAssertionGetTypeID_typeIDInit, (void (*)(void))__MKBAssertionnRegisterClass);
  uint64_t Instance = _CFRuntimeCreateInstance();
  CFNumberRef v11 = (_DWORD *)Instance;
  if (!Instance
    || (*(void *)(Instance + 16) = 0,
        *(void *)(Instance + 24) = 0,
        uint64_t v12 = (int *)(Instance + 16),
        *(_DWORD *)(Instance + 16) = 0,
        *(_DWORD *)(Instance + 24) = handleToUse(a1),
        CFDictionaryRef Value = CFDictionaryGetValue(a1, @"MKBAssertionKey"),
        (uint64_t v14 = Value) == 0))
  {
    unsigned int v32 = 12;
    if (!a2) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  if (CFEqual(Value, @"Other"))
  {
    int v15 = 0;
    int v16 = 0;
  }
  else if (CFEqual(v14, @"RemoteProfile"))
  {
    int v15 = 1;
    int v16 = 1;
  }
  else if (CFEqual(v14, @"SBTransient"))
  {
    int v15 = 0;
    int v16 = 2;
  }
  else if (CFEqual(v14, @"RestoreFromBackup"))
  {
    int v15 = 0;
    int v16 = 3;
  }
  else
  {
    if (!CFEqual(v14, @"TimeMachine"))
    {
      debuglog("MKBDeviceLockAssertion", @"Invalid assertion type", v17, v18, v19, v20, v21, v22, v36);
      goto LABEL_18;
    }
    int v15 = 0;
    v11[6] = -1;
    int v16 = 4;
  }
  *uint64_t v12 = v16;
  CFNumberRef v23 = (const __CFNumber *)CFDictionaryGetValue(a1, @"MKBAssertionTimeout");
  if (v23 && (CFNumberRef v30 = v23, v31 = CFGetTypeID(v23), v31 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v30, kCFNumberLongLongType, &valuePtr);
  }
  else if (v15)
  {
    debuglog("MKBDeviceLockAssertion", @"Status missing from response", v24, v25, v26, v27, v28, v29, v36);
    goto LABEL_18;
  }
  int v33 = aks_assert_hold();
  unsigned int v32 = 1;
  if (v33 <= -536870175)
  {
    if (v33 == -536870207) {
      goto LABEL_33;
    }
    if (v33 != -536870187) {
      goto LABEL_18;
    }
    goto LABEL_32;
  }
  if (v33 > -536362995)
  {
    if (v33 != -536362994)
    {
      if (!v33)
      {
        v11[5] = 1;
        int v34 = v11[6];
        goto LABEL_38;
      }
      goto LABEL_18;
    }
LABEL_32:
    unsigned int v32 = 16;
    goto LABEL_33;
  }
  if (v33 != -536870174)
  {
    if (v33 == -536363000)
    {
      unsigned int v32 = 103;
      if (!a2) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
LABEL_18:
    unsigned int v32 = 22;
    if (!a2) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_33:
  if (a2) {
LABEL_34:
  }
    *a2 = CFErrorCreate(0, (CFErrorDomain)*MEMORY[0x1E4F1D160], v32, 0);
LABEL_35:
  if (v11)
  {
    CFRelease(v11);
    CFNumberRef v11 = 0;
  }
  LOBYTE(v34) = -1;
LABEL_38:
  debuglog("MKBDeviceLockAssertion", @"handle:%d, asserttype:%d, timeout:%llu, result:%d, ioret: 0x%x, ret:%d", v5, v6, v7, v8, v9, v10, v34);
  return v11;
}

uint64_t MKBDeviceLockAssertionPromote(uint64_t a1)
{
  if (!a1) {
    return 4294967279;
  }
  uint64_t result = aks_assert_promote();
  if ((int)result > -536870188)
  {
    switch(result)
    {
      case 0xE00002D5:
        return 4294967278;
      case 0:
        return result;
      case 0xE00002E2:
        return 4294967284;
    }
    return 0xFFFFFFFFLL;
  }
  if (result == -536870207) {
    return 4294967280;
  }
  if (result == -536870206) {
    return 4294967279;
  }
  return 0xFFFFFFFFLL;
}

const void *MKBDeviceLockAssertionConsume(const __CFDictionary *a1, CFErrorRef *a2)
{
  pthread_once(&MKBAssertionGetTypeID_typeIDInit, (void (*)(void))__MKBAssertionnRegisterClass);
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    uint64_t v5 = (const void *)Instance;
    *(void *)(Instance + 16) = 0;
    *(void *)(Instance + 24) = 0;
    uint64_t v6 = (void *)(Instance + 16);
    *(_DWORD *)(Instance + 24) = handleToUse(a1);
    int v7 = aks_assert_consume();
    CFIndex v8 = 1;
    if (v7 <= -536870188)
    {
      if (v7 == -536870207) {
        goto LABEL_11;
      }
    }
    else
    {
      switch(v7)
      {
        case 0:
          *uint64_t v6 = 0x100000000;
          return v5;
        case -536870174:
LABEL_11:
          CFRelease(v5);
          if (a2) {
            goto LABEL_12;
          }
          return 0;
        case -536870187:
          CFIndex v8 = 16;
          goto LABEL_11;
      }
    }
    CFIndex v8 = 22;
    goto LABEL_11;
  }
  CFIndex v8 = 12;
  if (a2)
  {
LABEL_12:
    uint64_t v5 = 0;
    *a2 = CFErrorCreate(0, (CFErrorDomain)*MEMORY[0x1E4F1D160], v8, 0);
    return v5;
  }
  return 0;
}

uint64_t MKBKeyBagUnload()
{
  return 4294967290;
}

uint64_t MKBKeyBagGetAKSHandle(uint64_t a1, _DWORD *a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(_DWORD *)(a1 + 16);
    }
  }
  return result;
}

uint64_t MKBKeyBagHandleGetTypeID()
{
  if (MKBKeyBagHandleGetTypeID_onlyOnce != -1) {
    dispatch_once(&MKBKeyBagHandleGetTypeID_onlyOnce, &__block_literal_global_0);
  }
  return MKBKeyBagHandleGetTypeID___MKBKeyBagHandleTypeID;
}

uint64_t __MKBKeyBagHandleGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  MKBKeyBagHandleGetTypeID___MKBKeyBagHandleTypeID = result;
  return result;
}

uint64_t MKBKeyBagCreateEscrow(const __CFData *a1, uint64_t *a2)
{
  if (a1)
  {
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
  }
  uint64_t escrow_bag = aks_create_escrow_bag();
  if (escrow_bag) {
    return convertAKSErrorToMKB(escrow_bag);
  }
  uint64_t v6 = __kbHandleWithKernelHandle(0, 0);
  *a2 = v6;
  if (v6) {
    return 0;
  }
  else {
    return 4294967291;
  }
}

uint64_t __kbHandleWithKernelHandle(int a1, char a2)
{
  if (MKBKeyBagHandleGetTypeID_onlyOnce != -1) {
    dispatch_once(&MKBKeyBagHandleGetTypeID_onlyOnce, &__block_literal_global_0);
  }
  uint64_t result = _CFRuntimeCreateInstance();
  if (result)
  {
    *(_DWORD *)(result + 16) = a1;
    *(unsigned char *)(result + 20) = a2;
    *(void *)(result + 24) = 0;
  }
  return result;
}

uint64_t MKBKeyBagCreateEscrowWithAuth(const __CFData *a1, CFDataRef theData, uint64_t *a3)
{
  if (theData)
  {
    CFDataGetBytePtr(theData);
    CFDataGetLength(theData);
    if (!a1) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  if (a1)
  {
LABEL_3:
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
  }
LABEL_5:
  uint64_t escrow_bag_with_auth = aks_create_escrow_bag_with_auth();
  if (escrow_bag_with_auth) {
    return convertAKSErrorToMKB(escrow_bag_with_auth);
  }
  uint64_t v8 = __kbHandleWithKernelHandle(0, 0);
  *a3 = v8;
  if (v8) {
    return 0;
  }
  else {
    return 4294967291;
  }
}

uint64_t MKBKeyBagCreateBackup(CFDataRef theData, uint64_t *a2)
{
  if (theData)
  {
    CFDataGetBytePtr(theData);
    CFDataGetLength(theData);
  }
  uint64_t result = aks_create_bag();
  if (result) {
    return convertAKSErrorToMKB(result);
  }
  uint64_t v5 = __kbHandleWithKernelHandle(0, 0);
  *a2 = v5;
  uint64_t result = v5 ? 0 : 4294967291;
  if (theData && v5)
  {
    if (CFDataGetLength(theData) < 1) {
      return 0;
    }
    CFDataGetBytePtr(theData);
    CFDataGetLength(theData);
    uint64_t result = aks_prederived_create();
    if (result) {
      return convertAKSErrorToMKB(result);
    }
  }
  return result;
}

uint64_t MKBKeyBagCreateOTABackup(const __CFData *a1, uint64_t *a2)
{
  if (a1)
  {
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
  }
  uint64_t bag = aks_create_bag();
  if (bag) {
    return convertAKSErrorToMKB(bag);
  }
  uint64_t v6 = __kbHandleWithKernelHandle(0, 1);
  *a2 = v6;
  if (v6) {
    return 0;
  }
  else {
    return 4294967291;
  }
}

uint64_t MKBKeyBagRegisterOTABackup(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = +[MKBKeyStoreDevice sharedService];
  uint64_t v5 = [v4 registerOTABackup:a1 withSecret:a2];

  return v5;
}

uint64_t MKBBackupEnableForVolume(uint64_t a1, uint64_t a2, void *a3, CFDataRef *a4)
{
  uint64_t v8 = +[MKBKeyStoreDevice sharedService];
  id v12 = 0;
  uint64_t v9 = [v8 enableBackupForVolume:a1 withSecret:a2 bagData:&v12];
  CFDataRef v10 = (const __CFData *)v12;

  if (a4 && v10) {
    uint64_t v9 = MKBBackupCopyBackupBagUUIDForBag(v10, a4);
  }
  if (!v9) {
    *a3 = v10;
  }

  return v9;
}

uint64_t MKBBackupCopyBackupBagUUIDForBag(const __CFData *a1, CFDataRef *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  *(void *)bytes = 0;
  uint64_t v14 = 0;
  CFDataGetBytePtr(a1);
  CFDataGetLength(a1);
  uint64_t v4 = aks_backup_copy_bag_uuid();
  uint64_t v11 = v4;
  if (v4) {
    debuglog("MKBBackupCopyBackupBagUUIDForBag", @"Failed to get backup bag uuid from data: %x", v5, v6, v7, v8, v9, v10, v4);
  }
  else {
    *a2 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], bytes, 16);
  }
  return convertAKSErrorToMKB(v11);
}

uint64_t MKBBackupDisableForVolume(uint64_t a1)
{
  uint64_t v2 = +[MKBKeyStoreDevice sharedService];
  uint64_t v3 = [v2 disableBackupForVolume:a1];

  return v3;
}

uint64_t MKBBackupCopyBackupBagUUIDForVolume(const __CFData *a1, CFDataRef *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  memset(dst, 0, sizeof(dst));
  *(void *)bytes = 0;
  uint64_t v14 = 0;
  BytePtr = CFDataGetBytePtr(a1);
  uuid_copy(dst, BytePtr);
  uint64_t v4 = aks_backup_copy_current_bag_uuid();
  uint64_t v11 = v4;
  if (v4) {
    debuglog("MKBBackupCopyBackupBagUUIDForVolume", @"Failed to get backup bag uuid for volume: %x", v5, v6, v7, v8, v9, v10, v4);
  }
  else {
    *a2 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], bytes, 16);
  }
  return convertAKSErrorToMKB(v11);
}

uint64_t MKBKeyBagLock(uint64_t a1)
{
  return MEMORY[0x1F410A618](*(unsigned int *)(a1 + 16));
}

uint64_t MKBKeyBagUnlock(uint64_t a1, CFDataRef theData)
{
  if (*(void *)(a1 + 24))
  {
    if (theData)
    {
      CFDataGetBytePtr(theData);
      CFDataGetLength(theData);
    }
    uint64_t v4 = aks_prederived_unlock_keybag();
    if (v4)
    {
      uint64_t v11 = v4;
      debuglog("MKBKeyBagUnlock", @"aks_prederived_unlock_keybag() returned %d", v5, v6, v7, v8, v9, v10, v4);
      goto LABEL_11;
    }
  }
  else
  {
    if (theData)
    {
      CFDataGetBytePtr(theData);
      CFDataGetLength(theData);
    }
    uint64_t v12 = aks_unlock_bag();
    if (v12)
    {
      uint64_t v11 = v12;
      debuglog("MKBKeyBagUnlock", @"aks_unlock_bag() returned %d", v5, v6, v7, v8, v9, v10, v12);
      goto LABEL_11;
    }
  }
  debuglog("MKBKeyBagUnlock", @"unlocked bag %d", v5, v6, v7, v8, v9, v10, *(_DWORD *)(a1 + 16));
  uint64_t v11 = 0;
LABEL_11:

  return convertAKSErrorToMKB(v11);
}

uint64_t MKBKeyBagCopyData(uint64_t a1, CFDataRef *a2)
{
  if (aks_save_bag()) {
    return 0xFFFFFFFFLL;
  }
  if (a2)
  {
    CFDataRef v4 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
    *a2 = v4;
    if (!v4) {
      return 4294967291;
    }
  }
  return 0;
}

uint64_t MKBKeyBagCreateWithData(const __CFData *a1, uint64_t *a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  CFDataGetBytePtr(a1);
  CFDataGetLength(a1);
  if (aks_load_bag()) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = __kbHandleWithKernelHandle(0, 0);
  *a2 = v5;
  if (!v5) {
    return 4294967291;
  }
  aks_prederived_is_enabled();
  return 0;
}

uint64_t MKBOTABackupKeyBag()
{
  return __kbHandleWithKernelHandle(-2, 1);
}

uint64_t MKBKeyBagChangeSecret(uint64_t a1, CFDataRef theData, const __CFData *a3)
{
  if (*(void *)(a1 + 24))
  {
    if (theData)
    {
      CFDataGetBytePtr(theData);
      CFDataGetLength(theData);
      if (!a3)
      {
LABEL_9:
        uint64_t v5 = aks_prederived_change_secret();
        goto LABEL_12;
      }
    }
    else if (!a3)
    {
      goto LABEL_9;
    }
    CFDataGetBytePtr(a3);
    CFDataGetLength(a3);
    goto LABEL_9;
  }
  if (!theData)
  {
    if (!a3) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  CFDataGetBytePtr(theData);
  CFDataGetLength(theData);
  if (a3)
  {
LABEL_7:
    CFDataGetBytePtr(a3);
    CFDataGetLength(a3);
  }
LABEL_11:
  uint64_t v5 = aks_change_secret();
LABEL_12:

  return convertAKSErrorToMKB(v5);
}

uint64_t MKBKeyBagRelease(const void *a1)
{
  return 0;
}

uint64_t MKBDeviceObliterateClassDKey()
{
  uint64_t v0 = aks_obliterate_class_d();

  return convertAKSErrorToMKB(v0);
}

uint64_t MKBKeyBagCreateSystemUnwrapped(const __CFData *a1, const char *a2)
{
  return _MKBKeyBagCreateSystem(a1, a2);
}

uint64_t _MKBKeyBagCreateSystem(const __CFData *a1, const char *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!MKBDeviceSupportsEnhancedAPFS())
  {
    int v43 = 0;
    memset(&v42, 0, sizeof(v42));
    snprintf(__str, 0x401uLL, "%s/%s/%s.kb", a2, "keybags", "systembag");
    if (!stat(__str, &v42))
    {
      debuglog("_MKBKeyBagCreateSystem", @"%s already exists", v11, v12, v13, v14, v15, v16, (char)__str);
      return 4294967292;
    }
    if (a1)
    {
      CFDataGetBytePtr(a1);
      CFDataGetLength(a1);
    }
    uint64_t bag = aks_create_bag();
    if (bag)
    {
      uint64_t v40 = bag;
      debuglog("_MKBKeyBagCreateSystem", @"AKS can't create bag: %08x", v18, v19, v20, v21, v22, v23, bag);
    }
    else
    {
      uint64_t v24 = aks_set_system();
      if (!v24)
      {
        uint64_t v31 = KBSaveSystemBagHandle(0, a2, 0, 0, 0);
        if (v31)
        {
          uint64_t v10 = v31;
          debuglog("_MKBKeyBagCreateSystem", @"Can't save the bag: %d", v32, v33, v34, v35, v36, v37, v31);
          goto LABEL_14;
        }
        if (MKBDeviceSupportsEnhancedAPFS())
        {
          uint64_t v10 = 0;
LABEL_14:
          aks_unload_bag();
          return v10;
        }
        uint64_t v38 = KBMapDeviceBag(a2, 0);
LABEL_13:
        uint64_t v10 = v38;
        goto LABEL_14;
      }
      uint64_t v40 = v24;
      debuglog("_MKBKeyBagCreateSystem", @"Can't set the system bag: %08x", v25, v26, v27, v28, v29, v30, v24);
    }
    uint64_t v38 = convertAKSErrorToMKB(v40);
    goto LABEL_13;
  }
  debuglog("_MKBKeyBagCreateSystem", @"_MKBKeyBagCreateSystem does nothing, returning success", v4, v5, v6, v7, v8, v9, v41);
  return 0;
}

uint64_t MKBKeyBagCreateSystem(const __CFData *a1, const char *a2)
{
  return _MKBKeyBagCreateSystem(a1, a2);
}

uint64_t _MKBKeyBagChangeSystemSecretDirect(const __CFData *a1, const __CFData *a2, const void *a3)
{
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  uint64_t v8 = CFDataGetBytePtr(a2);
  CFIndex v9 = CFDataGetLength(a2);

  return KBChangeSystemSecret(0, 0, (uint64_t)BytePtr, Length, (const __CFData *)v8, v9, a3, 0);
}

uint64_t MKBKeyBagPerformRecovery(const __CFData *a1, const __CFDictionary *a2)
{
  uint64_t v4 = +[MKBKeyStoreDevice sharedService];
  [v4 Event:4];

  handleToUse(a2);
  if (a1)
  {
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
  }
  uint64_t v5 = aks_change_secret();
  if (v5 == -536362987)
  {
    uint64_t v6 = +[MKBKeyStoreDevice sharedService];
    uint64_t v5 = [v6 SeshatRecover:a1];
  }

  return convertAKSErrorToMKB(v5);
}

uint64_t make_random_key(uint64_t a1)
{
  if (*(void *)(a1 + 1072)) {
    return 0;
  }
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], 0x20uLL, (void *)(a1 + 1036))) {
    return 0xFFFFFFFFLL;
  }
  if (CCCryptorCreate(0, 0, 1u, (const void *)(a1 + 1036), 0x20uLL, 0, (CCCryptorRef *)(a1 + 1072))) {
    return 0xFFFFFFFFLL;
  }
  return 0;
}

uint64_t MKBFileOpenForBackup(const __CFString *a1, void *a2)
{
  uint64_t v4 = (char *)malloc_type_malloc(0x558uLL, 0x10A004079D672F0uLL);
  if (!v4) {
    return 4294967291;
  }
  uint64_t v5 = v4;
  bzero(v4, 0x558uLL);
  uint64_t v6 = 0xFFFFFFFFLL;
  *((_DWORD *)v5 + 257) = -1;
  if (!CFStringGetCString(a1, v5, 1025, 0x8000100u)) {
    goto LABEL_17;
  }
  if (stat(v5, (stat *)(v5 + 1088))) {
    goto LABEL_16;
  }
  int v14 = open(v5, 256);
  *((_DWORD *)v5 + 257) = v14;
  if (v14 == -1)
  {
    if (*__error() == 1)
    {
      int v14 = open_dprotected_np(v5, 256, 0, 1);
      *((_DWORD *)v5 + 257) = v14;
      if (v14 != -1)
      {
        v5[1080] = 1;
        goto LABEL_9;
      }
LABEL_16:
      uint64_t v6 = 4294967290;
LABEL_17:
      MKBFileClose(v5, v7, v8, v9, v10, v11, v12, v13);
      return v6;
    }
    int v14 = *((_DWORD *)v5 + 257);
    if (v14 == -1) {
      goto LABEL_16;
    }
  }
LABEL_9:
  int v15 = fcntl(v14, 63);
  *((_DWORD *)v5 + 308) = v15;
  if (v15 == -1) {
    goto LABEL_16;
  }
  if ((v15 - 8) < 0xFFFFFFF9)
  {
    uint64_t v6 = 0xFFFFFFFFLL;
    goto LABEL_17;
  }
  if ((v15 - 1) >= 2 && v5[1080])
  {
    close(*((_DWORD *)v5 + 257));
    return 4294967294;
  }
  else
  {
    uint64_t v6 = 0;
    *a2 = v5;
  }
  return v6;
}

uint64_t MKBFileClose(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = a1[257];
  if (v9 != -1) {
    close(v9);
  }
  uint64_t v10 = (_CCCryptor *)*((void *)a1 + 134);
  if (v10) {
    CCCryptorRelease(v10);
  }
  uint64_t v11 = *((void *)a1 + 170);
  if (v11) {
    deallocate_page_aligned_buffer(v11, 4096, a3, a4, a5, a6, a7, a8, v13);
  }
  bzero(a1, 0x558uLL);
  free(a1);
  return 0;
}

uint64_t MKBFileCreateForRestore(const __CFString *a1, int a2, CFDataRef theData, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!theData) {
    return 0xFFFFFFFFLL;
  }
  BytePtr = CFDataGetBytePtr(theData);
  if (!CFStringGetCString(a1, buffer, 1025, 0x8000100u)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = (char *)malloc_type_malloc(0x558uLL, 0x10A004079D672F0uLL);
  if (!v8) {
    return 4294967291;
  }
  int v9 = v8;
  bzero(v8, 0x558uLL);
  *((_DWORD *)v9 + 257) = -1;
  CFIndex Length = CFDataGetLength(theData);
  if (Length == 76 || Length == 44)
  {
    unsigned int v11 = *(_DWORD *)BytePtr;
    CFDataGetLength(theData);
    if (!aks_unwrap_key())
    {
      if (CCCryptorCreate(1u, 0, 1u, v9 + 1036, 0x20uLL, 0, (CCCryptorRef *)v9 + 134))
      {
        uint64_t v22 = 4294967289;
        goto LABEL_18;
      }
      goto LABEL_8;
    }
LABEL_17:
    uint64_t v22 = 0xFFFFFFFFLL;
    goto LABEL_18;
  }
  CC_SHA1_Init((CC_SHA1_CTX *)(v9 + 1236));
  v9[1080] = 1;
  *((_DWORD *)v9 + 271) = bswap32(*((_DWORD *)BytePtr + 5));
  unsigned int v11 = bswap32(*((_DWORD *)BytePtr + 6));
  CFDataGetLength(theData);
  if (aks_unwrap_key()) {
    goto LABEL_17;
  }
LABEL_8:
  if (v11 == 1) {
    int v19 = 2;
  }
  else {
    int v19 = v11;
  }
  if (v19 == 17) {
    int v20 = 7;
  }
  else {
    int v20 = v19;
  }
  int v21 = open_dprotected_np(buffer, 2817, v20, 0, 420);
  *((_DWORD *)v9 + 257) = v21;
  if (v21 != -1)
  {
    uint64_t v22 = 0;
    *a4 = v9;
    return v22;
  }
  uint64_t v24 = __error();
  strerror(*v24);
  debuglog("MKBFileCreateForRestore", @"Can't create file to restore to (class: %d): %s", v25, v26, v27, v28, v29, v30, v19);
  uint64_t v22 = 4294967290;
LABEL_18:
  if (*((_DWORD *)v9 + 257) != -1) {
    unlink(buffer);
  }
  MKBFileClose(v9, v12, v13, v14, v15, v16, v17, v18);
  return v22;
}

uint64_t init_ota(uint64_t a1, int a2)
{
  CC_SHA1_Init((CC_SHA1_CTX *)(a1 + 1236));
  if (!a2) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 1080) || (*(_DWORD *)(a1 + 1232) - 1) > 1) {
    goto LABEL_6;
  }
  int v4 = open_dprotected_np((const char *)a1, 256, 0, 1);
  if (v4 != -1)
  {
    int v5 = v4;
    close(*(_DWORD *)(a1 + 1028));
    *(_DWORD *)(a1 + 1028) = v5;
    *(unsigned char *)(a1 + 1080) = 1;
LABEL_6:
    uint64_t result = 0;
    *(_DWORD *)(a1 + 1084) = 4096;
    return result;
  }
  return 4294967290;
}

uint64_t MKBFileEncryptedBlockSize(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 1080)) {
    return *(unsigned int *)(a1 + 1084);
  }
  else {
    return 4096;
  }
}

size_t MKBFileWrite(uint64_t a1, char *data, size_t size, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8 = size;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 1080))
  {
    size_t v21 = 0;
    size_t dataOutMoved = 0;
    size_t dataIn = 0;
    if (*(_DWORD *)(a1 + 1032)) {
      return v21;
    }
    if ((size & 0xF) != 0)
    {
      debuglog("MKBFileWriteTranscrypt", @"buffer size %zu not a multiple of %d\n", size, a4, a5, a6, a7, a8, size);
    }
    else if (size)
    {
      uint64_t v22 = (char *)malloc_type_malloc(size, 0xDC01CF7uLL);
      if (v22)
      {
        uint64_t v29 = v22;
        CCCryptorStatus v30 = CCCryptorUpdate(*(CCCryptorRef *)(a1 + 1072), data, v8, v22, v8, &dataOutMoved);
        if (v30)
        {
          debuglog("MKBFileWriteTranscrypt", @"CCCryptorUpdate() failed: %d\n", v31, v32, v33, v34, v35, v36, v30);
        }
        else
        {
          size_t v21 = writen(*(_DWORD *)(a1 + 1028), v29, dataOutMoved);
          if (v21 == dataOutMoved)
          {
LABEL_36:
            free(v29);
            return v21;
          }
          uint64_t v51 = __error();
          char dataOuta = strerror(*v51);
          debuglog("MKBFileWriteTranscrypt", @"write failed: %s\n", v52, v53, v54, v55, v56, v57, dataOuta);
        }
        size_t v21 = -1;
        goto LABEL_36;
      }
      debuglog("MKBFileWriteTranscrypt", @"Couldn't allocate work buffer of %zu bytes\n", v23, v24, v25, v26, v27, v28, v8);
    }
    else
    {
      *(_DWORD *)(a1 + 1032) = 1;
      CCCryptorStatus v41 = CCCryptorFinal(*(CCCryptorRef *)(a1 + 1072), md, 0x10uLL, &dataIn);
      if (v41)
      {
        debuglog("MKBFileWriteTranscrypt", @"CCCryptorFinal() failed: %d\n", v42, v43, v44, v45, v46, v47, v41);
      }
      else
      {
        size_t v48 = writen(*(_DWORD *)(a1 + 1028), (char *)md, dataIn);
        if (v48 == dataIn) {
          return v48;
        }
        CFDataRef v58 = __error();
        char dataOutb = strerror(*v58);
        debuglog("MKBFileWriteTranscrypt", @"write failed: %s\n", v59, v60, v61, v62, v63, v64, dataOutb);
      }
    }
    return -1;
  }
  if (!*(void *)(a1 + 1360)) {
    *(void *)(a1 + 1360) = allocate_page_aligned_buffer(0x1000uLL);
  }
  if (!v8) {
    return v8;
  }
  unint64_t v11 = v8;
  while (v11 >= 0x1000)
  {
    uint64_t v12 = *(void *)(a1 + 1336);
    if (v12 <= 0) {
      uint64_t v13 = -(-v12 & 0xFFF);
    }
    else {
      uint64_t v13 = *(void *)(a1 + 1336) & 0xFFFLL;
    }
    size_t v14 = 4096 - v13;
    if (v11 >= v14) {
      size_t dataOutAvailable = v14;
    }
    else {
      size_t dataOutAvailable = v11;
    }
    if (!(v12 % *(unsigned int *)(a1 + 1084)))
    {
      CC_SHA1((const void *)(a1 + 1036), 0x20u, md);
      unsigned int v16 = *(_DWORD *)(a1 + 1336);
      if (v16) {
        unsigned int v17 = (v16 >> 1) ^ 0x80000061;
      }
      else {
        unsigned int v17 = v16 >> 1;
      }
      unsigned int v18 = v17 >> 1;
      if (v17) {
        unsigned int v18 = (v17 >> 1) ^ 0x80000061;
      }
      size_t dataIn = __PAIR64__(v18, v17);
      unsigned int v19 = v18 >> 1;
      if (v18) {
        unsigned int v19 = (v18 >> 1) ^ 0x80000061;
      }
      unsigned int v20 = v19 >> 1;
      if (v19) {
        unsigned int v20 = (v19 >> 1) ^ 0x80000061;
      }
      unsigned int v70 = v19;
      unsigned int v71 = v20;
      if (CCCrypt(0, 0, 0, md, 0x10uLL, 0, &dataIn, 0x10uLL, (void *)(a1 + 1344), 0x10uLL, 0)) {
        return -1;
      }
    }
    CC_SHA1_Update((CC_SHA1_CTX *)(a1 + 1236), data, dataOutAvailable);
    if (CCCrypt(1u, 0, 0, (const void *)(a1 + 1036), 0x20uLL, (const void *)(a1 + 1344), data, dataOutAvailable, *(void **)(a1 + 1360), dataOutAvailable, 0))
    {
      return -1;
    }
    if ((*(void *)(a1 + 1336) + dataOutAvailable) % *(unsigned int *)(a1 + 1084)) {
      *(_OWORD *)(a1 + 1344) = *(_OWORD *)&data[dataOutAvailable - 16];
    }
    if (writen(*(_DWORD *)(a1 + 1028), *(char **)(a1 + 1360), dataOutAvailable) != dataOutAvailable)
    {
      uint64_t v50 = __error();
      char dataOut = strerror(*v50);
      CFStringRef v40 = @"write failed: %s\n";
      goto LABEL_58;
    }
    data += dataOutAvailable;
    *(void *)(a1 + 1336) += dataOutAvailable;
    v11 -= dataOutAvailable;
    if (!v11) {
      return v8;
    }
  }
  if (v11 != 28)
  {
    CFStringRef v40 = @"Unknown trailer blob";
LABEL_58:
    debuglog("MKBFileWriteEncrypted", v40, size, a4, a5, a6, a7, a8, dataOut);
    return -1;
  }
  CC_SHA1_Final(md, (CC_SHA1_CTX *)(a1 + 1236));
  if (*((void *)data + 1) != *(void *)md
    || *((void *)data + 2) != v73
    || *((_DWORD *)data + 6) != (unint64_t)v74)
  {
    ftruncate(*(_DWORD *)(a1 + 1028), 0);
    return -1;
  }
  off_t v39 = bswap64(*(void *)data);
  if (v39 > *(void *)(a1 + 1336))
  {
    CFStringRef v40 = @"file cannot be larger than backup";
    goto LABEL_58;
  }
  if (ftruncate(*(_DWORD *)(a1 + 1028), v39))
  {
    CFStringRef v40 = @"ftruncate() failed";
    goto LABEL_58;
  }
  return v8;
}

uint64_t MKBFileReadEncrypted(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 1032)) {
    return 0;
  }
  if (!*(unsigned char *)(a1 + 1080)) {
    return -1;
  }
  uint64_t v10 = a3;
  if (!*(void *)(a1 + 1360)) {
    *(void *)(a1 + 1360) = allocate_page_aligned_buffer(0x1000uLL);
  }
  if ((v10 & 0xFFF) != 0)
  {
    debuglog("MKBFileReadEncrypted", @"Buffer size %zu not multiple of %zu\n", a3, a4, a5, a6, a7, a8, v10);
    return -1;
  }
  memset(&v32, 0, sizeof(v32));
  if (fstat(*(_DWORD *)(a1 + 1028), &v32) < 0)
  {
    unsigned int v16 = __error();
    char v30 = strerror(*v16);
    debuglog("MKBFileReadEncrypted", @"fstat() failed:%s\n", v17, v18, v19, v20, v21, v22, v30);
    return -1;
  }
  if (v10 < 1) {
    return 0;
  }
  uint64_t v8 = 0;
  while (!*(_DWORD *)(a1 + 1032))
  {
    size_t v13 = readn(*(_DWORD *)(a1 + 1028), *(char **)(a1 + 1360), 0x1000uLL);
    if ((v13 & 0x8000000000000000) != 0)
    {
      uint64_t v23 = __error();
      char v31 = strerror(*v23);
      debuglog("MKBFileReadEncrypted", @"read() failed:%s\n", v24, v25, v26, v27, v28, v29, v31);
      return -1;
    }
    if (!v13
      || (unint64_t v14 = (v13 + 4095) & 0xFFFFFFFFFFFFF000,
          memcpy(a2, *(const void **)(a1 + 1360), v14),
          CC_SHA1_Update((CC_SHA1_CTX *)(a1 + 1236), *(const void **)(a1 + 1360), v14),
          (*(void *)(a1 + 1336) += v14) == 0))
    {
      *(_DWORD *)(a1 + 1032) = 1;
      *(void *)a2 = bswap64(*(void *)(a1 + 1184));
      CC_SHA1_Final(a2 + 8, (CC_SHA1_CTX *)(a1 + 1236));
      unint64_t v14 = 28;
    }
    a2 += v14;
    v8 += v14;
    BOOL v15 = v10 > v14;
    if (v10 >= v14) {
      v10 -= v14;
    }
    else {
      uint64_t v10 = 0;
    }
    if (!v15) {
      return v8;
    }
  }
  return v8;
}

vm_address_t allocate_page_aligned_buffer(vm_size_t size)
{
  vm_address_t address = 0;
  if (vm_allocate(*MEMORY[0x1E4F14960], &address, size, -268435455)) {
    debuglog("allocate_page_aligned_buffer", @"Failed to allocate page aligned buffer", v1, v2, v3, v4, v5, v6, v8);
  }
  return address;
}

size_t readn(int a1, char *a2, size_t a3)
{
  if (a3)
  {
    size_t v6 = a3;
    while (1)
    {
      ssize_t v7 = read(a1, a2, v6);
      if (v7 == -1)
      {
        if (*__error() != 4) {
          return -1;
        }
        ssize_t v7 = 0;
      }
      else if (!v7)
      {
        return a3 - v6;
      }
      a2 += v7;
      v6 -= v7;
      if (!v6) {
        return a3 - v6;
      }
    }
  }
  size_t v6 = 0;
  return a3 - v6;
}

uint64_t MKBFileRead(uint64_t a1, char *a2, int64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(unsigned char *)(a1 + 1080))
  {
    size_t v44 = 0;
    size_t dataOutMoved = 0;
    if (!make_random_key(a1))
    {
      if ((a3 & 0xF) == 0)
      {
        if (*(_DWORD *)(a1 + 1032)) {
          return 0;
        }
        size_t v18 = readn(*(_DWORD *)(a1 + 1028), a2, a3);
        if ((v18 & 0x8000000000000000) != 0)
        {
          uint64_t v27 = __error();
          char v43 = strerror(*v27);
          debuglog("MKBFileReadTranscrypt", @"read() failed:%s\n", v28, v29, v30, v31, v32, v33, v43);
          return -1;
        }
        int64_t v19 = v18;
        if (v18)
        {
          CCCryptorStatus v20 = CCCryptorUpdate(*(CCCryptorRef *)(a1 + 1072), a2, v18, a2, a3, &dataOutMoved);
          if (v20)
          {
            debuglog("MKBFileReadTranscrypt", @"CCCryptorUpdate() failed:%d\n", v21, v22, v23, v24, v25, v26, v20);
            return -1;
          }
          size_t v34 = dataOutMoved;
        }
        else
        {
          size_t v34 = 0;
        }
        if (v19 >= a3)
        {
          size_t v42 = 0;
        }
        else
        {
          *(_DWORD *)(a1 + 1032) = 1;
          CCCryptorStatus v35 = CCCryptorFinal(*(CCCryptorRef *)(a1 + 1072), &a2[v34], a3 - v34, &v44);
          if (v35)
          {
            debuglog("MKBFileReadTranscrypt", @"CCCCryptorFinal() failed:%d\n", v36, v37, v38, v39, v40, v41, v35);
            return -1;
          }
          size_t v42 = v44;
          size_t v34 = dataOutMoved;
        }
        return v34 + v42;
      }
      debuglog("MKBFileReadTranscrypt", @"Buffer size %zu not multiple of %d\n", v12, v13, v14, v15, v16, v17, a3);
    }
    return -1;
  }

  return MKBFileReadEncrypted(a1, (unsigned __int8 *)a2, a3, a4, a5, a6, a7, a8);
}

uint64_t MKBFileValidateWrappedKey(uint64_t a1, uint64_t a2, CFDataRef theData)
{
  if (!theData || !*(unsigned char *)(a2 + 20)) {
    return 0xFFFFFFFFLL;
  }
  CFIndex Length = CFDataGetLength(theData);
  if (Length == 76 || Length == 44)
  {
    if (!*(void *)(a1 + 1072) || (unint64_t)CFDataGetLength(theData) < 4) {
      return 0xFFFFFFFFLL;
    }
    unsigned int v6 = *(_DWORD *)CFDataGetBytePtr(theData);
  }
  else
  {
    if ((unint64_t)CFDataGetLength(theData) < 0x1C) {
      return 0xFFFFFFFFLL;
    }
    BytePtr = CFDataGetBytePtr(theData);
    if (*((_DWORD *)BytePtr + 3) != *(_DWORD *)(a1 + 1096)
      || *(_DWORD *)BytePtr != *(_DWORD *)(a1 + 1168)
      || *((_DWORD *)BytePtr + 1) != *(_DWORD *)(a1 + 1176))
    {
      return 0xFFFFFFFFLL;
    }
    unsigned int v6 = bswap32(*((_DWORD *)CFDataGetBytePtr(theData) + 6));
  }
  if (!init_ota(a1, 1) && *(_DWORD *)(a1 + 1232) == v6) {
    return 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t MKBFileCopyWrappedKey_OTA(int64x2_t *a1, __CFData **a2)
{
  CFMutableDictionaryRef Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  *(int32x2_t *)bytes = vmovn_s64(a1[73]);
  __int32 v23 = a1[68].i32[0];
  uint64_t v24 = a1[68].i64[1];
  CFDataAppendBytes(Mutable, bytes, 20);
  *(_DWORD *)uint64_t v21 = bswap32(a1[67].u32[3]);
  CFDataAppendBytes(Mutable, v21, 4);
  if (!a1[67].i8[8] || (int v5 = open(a1->i8, 256), v5 < 0))
  {
    int v7 = a1[64].i32[1];
    int v6 = v7;
  }
  else
  {
    int v6 = v5;
    int v7 = a1[64].i32[1];
  }
  CFDataRef v8 = MKBCopyCryptoIDKeysForFileDescriptor(v7, 0, 0);
  if (v8)
  {
    CFDataRef v9 = v8;
    if ((unint64_t)CFDataGetLength(v8) >= 8)
    {
      BytePtr = CFDataGetBytePtr(v9);
      unsigned int v17 = bswap32(*((_DWORD *)BytePtr + 6));
      if (v17 == a1[77].i32[0])
      {
        size_t v18 = BytePtr;
        CFDataAppendBytes(Mutable, BytePtr + 24, 4);
        CFIndex Length = CFDataGetLength(v9);
        CFDataAppendBytes(Mutable, v18 + 36, Length - 36);
        *a2 = Mutable;
        CFRelease(v9);
        return 0;
      }
      debuglog("MKBFileCopyWrappedKey_OTA", @"Protection class changed from %d to %d", v11, v12, v13, v14, v15, v16, v17);
      CFRelease(v9);
    }
  }
  if (v6 != -1) {
    close(v6);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  *a2 = 0;
  return 0xFFFFFFFFLL;
}

CFMutableDataRef MKBCopyCryptoIDKeysForFileDescriptor(int a1, const __CFData *a2, void *a3)
{
  int v5 = a1;
  v159[2] = *MEMORY[0x1E4F143B8];
  v159[0] = 0;
  v159[1] = 0;
  *(void *)uu2 = 0;
  uint64_t v158 = 0;
  if (ffsctl(a1, 0x40104A60uLL, v159, 0))
  {
    int v6 = __error();
    strerror(*v6);
    debuglog("MKBCopyCryptoIDKeysForFileDescriptor", @"Can't get volume uuid for fd %d: %s", v7, v8, v9, v10, v11, v12, v5);
    return 0;
  }
  int v13 = aks_backup_copy_current_bag_uuid();
  if (v13)
  {
    debuglog("MKBCopyCryptoIDKeysForFileDescriptor", @"Error from aks_backup_copy_current_bag_uuid: %d", v14, v15, v16, v17, v18, v19, v13);
    return 0;
  }
  all_crypto_ids = _apfs_get_all_crypto_ids(v5);
  if (!all_crypto_ids)
  {
    memset(&dst, 0, sizeof(dst));
    if (!fstat(v5, &dst)) {
      debuglog("MKBCopyCryptoIDKeysForFileDescriptor", @"file size %lld bytes", v130, v131, v132, v133, v134, v135, dst.st_size);
    }
    return 0;
  }
  uint64_t v29 = all_crypto_ids;
  debuglog("MKBCopyCryptoIDKeysForFileDescriptor", @"found %d extent%s", v23, v24, v25, v26, v27, v28, all_crypto_ids[4]);
  KBPostAggdDistribution(@"com.apple.mobile.keybagd.db.file.extents.number", 0, 0xAu);
  CFMutableDataRef Mutable = CFDataCreateMutable(0, 0);
  CFMutableDataRef v20 = Mutable;
  if (v29[4])
  {
    uint64_t v138 = a3;
    uint64_t v37 = 0;
    uint64_t v144 = 0;
    uint64_t v146 = v29 + 8;
    uint64_t v137 = *MEMORY[0x1E4F28760];
    CFDataRef v139 = a2;
    int v140 = v5;
    CFMutableDataRef cf = Mutable;
    uint64_t v142 = v29;
    while (1)
    {
      memset(&dst.st_atimespec, 0, 76);
      *(_OWORD *)&dst.st_dev = 0u;
      *(_OWORD *)&dst.st_uid = 0xFFFFFFFFFFFFFFFFLL;
      uint64_t v38 = &v146[12 * v37];
      unint64_t v39 = *((void *)v38 + 2);
      unint64_t v41 = *((void *)v38 + 1);
      uint64_t v40 = v38 + 4;
      *(void *)bytes = bswap64(v41);
      if (v39 == -1) {
        break;
      }
      if ((v39 & 0x8000000000000000) == 0)
      {
        debuglog("MKBCopyCryptoIDKeysForFileDescriptor", @"looking for backup key for crypto_id 0x%016qx (%d of %u)", v31, v32, v33, v34, v35, v36, v39);
        if (a2)
        {
          BytePtr = CFDataGetBytePtr(a2);
          unint64_t Length = CFDataGetLength(a2);
          if (_MKBBackupCheckKey((uint64_t)BytePtr, Length, v44, v45, v46, v47, v48, v49))
          {
            uint64_t v66 = -19;
          }
          else
          {
            if (Length)
            {
              unint64_t v56 = 0;
              uint64_t v57 = BytePtr;
              while (1)
              {
                uint64_t v58 = bswap32(*((_DWORD *)v57 + 8));
                unint64_t v59 = bswap64(*((void *)v57 + 2));
                debuglog("copy_rewrapped_key_from_existing_key", @"crypto_id = 0x%016llx, extent_size_t size = %llu, key class = %u", v50, v51, v52, v53, v54, v55, v59);
                if (v59 == v39)
                {
                  debuglog("copy_rewrapped_key_from_existing_key", @"Found target crypto_id", v50, v51, v52, v53, v54, v55, (char)v136);
                  if (!uuid_compare(v57, uu2))
                  {
                    __memcpy_chk();
                    id v145 = 0;
                    id v90 = 0;
                    a2 = v139;
                    int v5 = v140;
                    CFMutableDataRef v20 = cf;
                    uint64_t v29 = v142;
                    goto LABEL_49;
                  }
                  debuglog("copy_rewrapped_key_from_existing_key", @"Bag uuid mismatch, ignore", v60, v61, v62, v63, v64, v65, (char)v136);
                }
                v56 += v58 + 44;
                uint64_t v57 = &BytePtr[v56];
                if (v56 >= Length)
                {
                  uint64_t v66 = -8;
                  a2 = v139;
                  int v5 = v140;
                  goto LABEL_25;
                }
              }
            }
            uint64_t v66 = -8;
          }
LABEL_25:
          id v145 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MobileKeyBagError" code:v66 userInfo:0];
          uint64_t v29 = v142;
        }
        else
        {
          id v145 = 0;
        }
        id v147 = 0;
        unsigned int v74 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v159 length:16 freeWhenDone:0];
        uint64_t v75 = +[MKBKeyStoreDevice sharedService];
        uint64_t v76 = [v75 getBackupkeyForVolume:v74 andCryptoID:v39 withError:&v147];

        if (v76)
        {
          debuglog("copy_rewrapped_key_from_db", @"found rewrapped key in MKB backup db", v77, v78, v79, v80, v81, v82, (char)v136);
          objc_msgSend(v76, "getBytes:length:", &dst, objc_msgSend(v76, "length"));
          if (uuid_compare((const unsigned __int8 *)&dst, uu2))
          {
            debuglog("copy_rewrapped_key_from_db", @"key found in db doesn't match current backup bag!!", v83, v84, v85, v86, v87, v88, (char)v136);
            goto LABEL_29;
          }
          char v89 = 1;
        }
        else
        {
LABEL_29:
          char v89 = 0;
        }

        id v90 = v147;
        if (v89)
        {
          CFMutableDataRef v20 = cf;
          goto LABEL_49;
        }
        uint64_t v143 = v90;
        id v149 = 0;
        p_stat dst = &dst;
        debuglog("copy_rewrapped_key_from_file", @"getting wrapped key from aks", v91, v92, v93, v94, v95, v96, (char)v136);
        uint64_t v97 = _apfs_copy_wrapped_key_from_file(v5, v39, (CFTypeRef *)&v149);
        if (!v97)
        {
          id v100 = v149;
          goto LABEL_43;
        }
        uint64_t v98 = v97;
        if (v144)
        {
          uint64_t v136 = &dst;
          int v99 = aks_backup_rewrap_ek();
        }
        else
        {
          int v99 = aks_backup_rewrap_key();
        }
        int v101 = v99;
        free(v98);
        if (v101)
        {
          id v100 = [MEMORY[0x1E4F28C58] errorWithDomain:v137 code:v101 userInfo:0];
          debuglog("copy_rewrapped_key_from_file", @"aks_backup_rewrap_key() failed: %d", v102, v103, v104, v105, v106, v107, v101);
          goto LABEL_43;
        }
        if (uuid_compare((const unsigned __int8 *)&dst, uu2))
        {
          debuglog("copy_rewrapped_key_from_file", @"backup key doesn't match current bag uuid!!", v91, v92, v93, v94, v95, v96, (char)v136);
          id v100 = 0;
LABEL_43:
          id v108 = v100;
          debuglog("MKBCopyCryptoIDKeysForFileDescriptor", @"Could not get the backup key for crypto ID 0x%016qx (%d of %u, existing keys: %s, found1:%d, found2:%d, found3:%d)", v109, v110, v111, v112, v113, v114, v39);
          uint64_t v115 = (void *)MEMORY[0x1E4F28C58];
          int v151 = @"cryptoId";
          uint64_t v116 = [NSNumber numberWithUnsignedLongLong:v39];
          v155[0] = v116;
          uint64_t v152 = @"existingKeyError";
          uint64_t v117 = ObjectOrNull(v145);
          v155[1] = v117;
          uint64_t v153 = @"dbError";
          unint64_t v118 = ObjectOrNull(v143);
          v155[2] = v118;
          uint64_t v154 = @"fileError";
          BOOL v119 = ObjectOrNull(v108);
          v155[3] = v119;
          uint64_t v120 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v155 forKeys:&v151 count:4];
          uint64_t v121 = [v115 errorWithDomain:@"MobileKeyBagError" code:-8 userInfo:v120];

          debuglog("MKBCopyCryptoIDKeysForFileDescriptor", @"Error: %@", v122, v123, v124, v125, v126, v127, (char)v121);
          if (v138) {
            void *v138 = v121;
          }
          free(v144);
          uint64_t v29 = v142;
          free(v142);
          CFMutableDataRef v20 = cf;
          CFRelease(cf);

          char v128 = 0;
          unsigned int v73 = 0;
          a2 = v139;
          int v5 = v140;
          id v90 = v143;
        }
        else
        {
          if (bswap64(*(unint64_t *)&dst.st_uid) != v39)
          {
            debuglog("copy_rewrapped_key_from_file", @"whoa, cryptoID does not match backup_key.inode: %llu vs %llu", v91, v92, v93, v94, v95, v96, bswap64((unint64_t)v152));
            *(void *)&p_dst->st_uid = bswap64(v39);
          }
          int v5 = v140;
          CFMutableDataRef v20 = cf;
          id v90 = v143;
LABEL_49:
          if (LODWORD(dst.st_atimespec.tv_sec))
          {
            uint64_t v121 = 0;
            unsigned int v73 = bswap32(dst.st_atimespec.tv_sec);
            char v128 = 1;
          }
          else
          {
            id v129 = v90;
            debuglog("MKBCopyCryptoIDKeysForFileDescriptor", @"got zero-length key for non-sparse crypto id", v91, v92, v93, v94, v95, v96, (char)v136);
            free(v29);
            CFRelease(v20);
            id v90 = v129;
            char v128 = 0;
            unsigned int v73 = 0;
            uint64_t v121 = 0;
          }
        }

        if ((v128 & 1) == 0) {
          return 0;
        }
LABEL_53:
        debuglog("MKBCopyCryptoIDKeysForFileDescriptor", @"got extent size %llu, keysize %d", v67, v68, v69, v70, v71, v72, *v40);
        CFDataAppendBytes(v20, (const UInt8 *)&dst, v73 + 36);
        CFDataAppendBytes(v20, bytes, 8);
        goto LABEL_54;
      }
      debuglog("MKBCopyCryptoIDKeysForFileDescriptor", @"looking for ekwk, crypto_id 0x%016qx (%d of %u)", v31, v32, v33, v34, v35, v36, v39);
      uint64_t v144 = _apfs_copy_wrapped_key_from_file(v5, v39, 0);
LABEL_54:
      if (++v37 >= (unint64_t)v29[4]) {
        goto LABEL_60;
      }
    }
    debuglog("MKBCopyCryptoIDKeysForFileDescriptor", @"found sparse extent (%d of %u)", v31, v32, v33, v34, v35, v36, v37);
    uuid_copy((unsigned __int8 *)&dst, uu2);
    unsigned int v73 = 0;
    goto LABEL_53;
  }
  uint64_t v144 = 0;
LABEL_60:
  free(v144);
  free(v29);
  return v20;
}

uint64_t MKBFileCopyWrappedKey()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t v3 = (int64x2_t *)v0;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int length = 0x8000;
  if (*(unsigned char *)(v4 + 20) && init_ota(v0, 1)) {
    return 0xFFFFFFFFLL;
  }
  if (!v3[67].i8[8])
  {
    if (!make_random_key((uint64_t)v3))
    {
      if (v3[77].i32[0] == 7) {
        int v7 = 17;
      }
      else {
        int v7 = v3[77].i32[0];
      }
      *(_DWORD *)bytes = v7;
      uint64_t v8 = aks_wrap_key();
      uint64_t v9 = convertAKSErrorToMKB(v8);
      if (v9)
      {
        uint64_t v6 = v9;
        debuglog("MKBFileCopyWrappedKey", @"aks_wrap_key error class: %d (%d) result: %d", v10, v11, v12, v13, v14, v15, v7);
      }
      else
      {
        CFMutableDataRef Mutable = CFDataCreateMutable(0, 76);
        if (Mutable)
        {
          uint64_t v17 = Mutable;
          CFDataAppendBytes(Mutable, bytes, 4);
          CFDataAppendBytes(v17, &length_4, length);
          uint64_t v6 = 0;
          *uint64_t v2 = v17;
        }
        else
        {
          return 4294967291;
        }
      }
      return v6;
    }
    return 0xFFFFFFFFLL;
  }

  return MKBFileCopyWrappedKey_OTA(v3, v2);
}

uint64_t MKBFileGetFD(uint64_t a1)
{
  return *(unsigned int *)(a1 + 1028);
}

void deallocate_page_aligned_buffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (MEMORY[0x1BA9CE790](*MEMORY[0x1E4F14960], a1, a2))
  {
    debuglog("deallocate_page_aligned_buffer", @"Failed to deallocate page aligned buffer", v9, v10, v11, v12, v13, v14, a9);
  }
}

uint64_t MKBBackupOpen(const char *a1, void *a2)
{
  memset(&v32, 0, sizeof(v32));
  int v4 = open_dprotected_np(a1, 256, 0, 1);
  int v5 = __error();
  if (v4 == -1)
  {
    int v8 = *v5;
    strerror(*v5);
    debuglog("MKBBackupOpen", @"failed to open_dprotected_np(%s): %s", v19, v20, v21, v22, v23, v24, (char)a1);
LABEL_10:
    *__error() = v8;
    return 0xFFFFFFFFLL;
  }
  int v6 = fstat(v4, &v32);
  int v7 = __error();
  int v8 = *v7;
  if (v6 == -1)
  {
    strerror(*v7);
    debuglog("MKBBackupOpen", @"failed to stat(%s): %s", v25, v26, v27, v28, v29, v30, (char)a1);
LABEL_9:
    close(v4);
    goto LABEL_10;
  }
  uint64_t v9 = malloc_type_calloc(1uLL, 0x28uLL, 0x1080040265FDEEEuLL);
  if (!v9)
  {
    debuglog("MKBBackupOpen", @"failed to allocate handle", v10, v11, v12, v13, v14, v15, v31);
    goto LABEL_9;
  }
  uint64_t v16 = v9;
  *uint64_t v9 = v4;
  int v17 = open(a1, 256);
  uint64_t result = 0;
  v16[1] = v17;
  *((void *)v16 + 1) = 0;
  *((void *)v16 + 2) = 0;
  *((void *)v16 + 3) = v32.st_ino;
  *((void *)v16 + 4) = v32.st_size;
  *a2 = v16;
  return result;
}

uint64_t MKBBackupGetFileDescriptors(_DWORD *a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a2 = a1[1];
      *a3 = *a1;
    }
  }
  return result;
}

uint64_t MKBBackupCreateFromFileDescriptors(int a1, int a2, int **a3)
{
  memset(&v23, 0, sizeof(v23));
  if (fstat(a2, &v23) == -1)
  {
    uint64_t v15 = __error();
    strerror(*v15);
    debuglog("MKBBackupCreateFromFileDescriptors", @"failed to fstat encryptedfd(%d): %s", v16, v17, v18, v19, v20, v21, a2);
    return 0xFFFFFFFFLL;
  }
  int v6 = (int *)malloc_type_calloc(1uLL, 0x28uLL, 0x1080040265FDEEEuLL);
  if (!v6)
  {
    debuglog("MKBBackupCreateFromFileDescriptors", @"failed to allocate handle", v7, v8, v9, v10, v11, v12, v22);
    return 0xFFFFFFFFLL;
  }
  uint64_t v13 = v6;
  uint64_t result = 0;
  *uint64_t v13 = a2;
  v13[1] = a1;
  *((void *)v13 + 1) = 0;
  *((void *)v13 + 2) = 0;
  *((void *)v13 + 3) = v23.st_ino;
  *((void *)v13 + 4) = v23.st_size;
  *a3 = v13;
  return result;
}

uint64_t MKBBackupActualFileSize(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

unint64_t MKBBackupSize(uint64_t a1)
{
  return (*(void *)(a1 + 32) + 15) & 0xFFFFFFFFFFFFFFF0;
}

uint64_t MKBBackupPread(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8 = 0;
  if (a3 && (uint64_t)((*(void *)(a1 + 32) + 15) & 0xFFFFFFFFFFFFFFF0) >= a4)
  {
    int64_t v12 = a4 + a3;
    int64_t v13 = (a4 + a3 + 4095) & 0xFFFFFFFFFFFFF000;
    unint64_t v14 = v13 - (a4 & 0xFFFFFFFFFFFFF000);
    if (v13 <= (uint64_t)(a4 & 0xFFFFFFFFFFFFF000)) {
      return -1;
    }
    page_aligned_buffer = *(void **)(a1 + 8);
    unint64_t v17 = *(void *)(a1 + 16);
    if (v14 > v17)
    {
      if (v17 && page_aligned_buffer) {
        deallocate_page_aligned_buffer(*(void *)(a1 + 8), *(void *)(a1 + 16), a3, a4, a5, a6, a7, a8, v35);
      }
      *(void *)(a1 + 16) = v14;
      page_aligned_buffer = (void *)allocate_page_aligned_buffer(v13 - (a4 & 0xFFFFFFFFFFFFF000));
      *(void *)(a1 + 8) = page_aligned_buffer;
    }
    unint64_t v18 = pread(*(_DWORD *)a1, page_aligned_buffer, v13 - (a4 & 0xFFFFFFFFFFFFF000), a4 & 0xFFFFFFFFFFFFF000);
    if ((v18 & 0x8000000000000000) != 0)
    {
      uint64_t v26 = __error();
      char v36 = strerror(*v26);
      debuglog("MKBBackupPread", @"pread() failed: %s\n", v27, v28, v29, v30, v31, v32, v36);
      return -1;
    }
    int64_t v25 = *(void *)(a1 + 32);
    if (v18 < v14 && v13 <= v25)
    {
      debuglog("MKBBackupPread", @"bytes_read(%ld) < read_size(%ld), but effective_start(%lld) + read_size(%ld) <= file_size(%lld)\n", v19, v20, v21, v22, v23, v24, v18);
      return -1;
    }
    int64_t v34 = (v25 + 15) & 0xFFFFFFFFFFFFFFF0;
    if (v12 <= v34) {
      size_t v8 = a3;
    }
    else {
      size_t v8 = v34 - a4;
    }
    memcpy(a2, (const void *)(*(void *)(a1 + 8) + (a4 & 0xFFF)), v8);
  }
  return v8;
}

uint64_t MKBBackupClose(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *a1;
  uint64_t v10 = *((void *)*a1 + 2);
  if (v10)
  {
    uint64_t v11 = *((void *)v9 + 1);
    if (v11) {
      deallocate_page_aligned_buffer(v11, v10, a3, a4, a5, a6, a7, a8, v14);
    }
  }
  if (*(_DWORD *)v9 != -1) {
    close(*(_DWORD *)v9);
  }
  int v12 = *((_DWORD *)v9 + 1);
  if (v12 != -1) {
    close(v12);
  }
  free(*a1);
  *a1 = 0;
  return 0;
}

uint64_t MKBBackupValidateKeyUUID(uint64_t a1, CFDataRef theData)
{
  CFDataRef theDataa = 0;
  BytePtr = CFDataGetBytePtr(theData);
  CFIndex Length = CFDataGetLength(theData);
  if (_MKBBackupCheckKey((uint64_t)BytePtr, Length, v6, v7, v8, v9, v10, v11)) {
    return 0xFFFFFFFFLL;
  }
  if (MKBKeyBagCopyUUID(a1, &theDataa))
  {
    debuglog("MKBBackupValidateKeyUUID", @"Failed to get bag uuid", v12, v13, v14, v15, v16, v17, v28);
    CFDataRef v18 = theDataa;
LABEL_11:
    if (v18) {
      CFRelease(v18);
    }
    return 0xFFFFFFFFLL;
  }
  CFDataRef v18 = theDataa;
  uint64_t v19 = CFDataGetBytePtr(theDataa);
  if (*(void *)BytePtr != *(void *)v19 || *((void *)BytePtr + 1) != *((void *)v19 + 1))
  {
    debuglog("MKBBackupValidateKeyUUID", @"Bag uuid mismatch", v20, v21, v22, v23, v24, v25, v28);
    goto LABEL_11;
  }
  CFRelease(v18);
  return 0;
}

uint64_t _MKBBackupCheckKey(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 <= 0x23)
  {
    debuglog("_MKBBackupCheckKey", @"corrupt blob size %zu, expected at least %zu", a3, a4, a5, a6, a7, a8, a2);
    return 0xFFFFFFFFLL;
  }
  uint64_t v10 = bswap32(*(_DWORD *)(a1 + 32));
  if (v10 + 36 != a2)
  {
    if (v10 + 44 <= a2)
    {
      debuglog("_MKBBackupCheckKey", @"found extent-based key_blob, size %zu", a3, a4, a5, a6, a7, a8, a2);
      unint64_t v18 = 0;
      uint64_t v19 = a1;
      do
      {
        if (a2 - v18 <= 0x23)
        {
          debuglog("_MKBBackupCheckKey", @"remaining blob size too short offset=%zu blob_size=%zu", v12, v13, v14, v15, v16, v17, v18);
          return 0xFFFFFFFFLL;
        }
        unsigned int v20 = bswap32(*(_DWORD *)(v19 + 32));
        if (v20 >= 0x49)
        {
          debuglog("_MKBBackupCheckKey", @"wrapped key size too big (%lu>%u)", v12, v13, v14, v15, v16, v17, a2);
          return 0xFFFFFFFFLL;
        }
        debuglog("_MKBBackupCheckKey", @"offset = %zu, keysize_t size = %u, extent size_t size = %llu", v12, v13, v14, v15, v16, v17, v18);
        v18 += v20 + 44;
        uint64_t v19 = v18 + a1;
      }
      while (v18 < a2);
      if (v18 == a2) {
        return 0;
      }
      debuglog("_MKBBackupCheckKey", @"odd blob size %zu, offset = %zu", v12, v13, v14, v15, v16, v17, a2);
    }
    else
    {
      debuglog("_MKBBackupCheckKey", @"odd blob size %zu", a3, a4, a5, a6, a7, a8, a2);
    }
    return 0xFFFFFFFFLL;
  }
  debuglog("_MKBBackupCheckKey", @"found single-extent key_blob, size %zu", a3, a4, a5, a6, a7, a8, a2);
  return 0;
}

uint64_t MKBKeyBagCopyUUID(uint64_t a1, CFDataRef *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  *(void *)bytes = 0;
  uint64_t v14 = 0;
  uint64_t bag_uuid = aks_get_bag_uuid();
  uint64_t v11 = convertAKSErrorToMKB(bag_uuid);
  if (v11) {
    debuglog("MKBKeyBagCopyUUID", @"failed to get uuid for handle %d", v5, v6, v7, v8, v9, v10, *(_DWORD *)(a1 + 16));
  }
  else {
    *a2 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], bytes, 16);
  }
  return v11;
}

uint64_t MKBBackupValidateBackupKeyWithUUID(const __CFData *a1, const __CFData *a2)
{
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  if (!_MKBBackupCheckKey((uint64_t)BytePtr, Length, v6, v7, v8, v9, v10, v11))
  {
    uint64_t v12 = CFDataGetBytePtr(a2);
    if (*(void *)BytePtr == *(void *)v12 && *((void *)BytePtr + 1) == *((void *)v12 + 1)) {
      return 0;
    }
    debuglog("MKBBackupValidateBackupKeyWithUUID", @"BackupKey uuid mismatch", v13, v14, v15, v16, v17, v18, v21);
  }
  return 0xFFFFFFFFLL;
}

uint64_t MKBBackupValidateKey(uint64_t a1, CFDataRef theData)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  BytePtr = CFDataGetBytePtr(theData);
  unint64_t Length = CFDataGetLength(theData);
  if (_MKBBackupCheckKey((uint64_t)BytePtr, Length, v6, v7, v8, v9, v10, v11)) {
    return 0xFFFFFFFFLL;
  }
  if (Length < (unint64_t)bswap32(*((_DWORD *)BytePtr + 8)) + 44)
  {
    debuglog("MKBBackupValidateKey", @"truncated key size: %zd", v12, v13, v14, v15, v16, v17, Length);
    return 0xFFFFFFFFLL;
  }
  memset(out, 0, 37);
  uuid_unparse(BytePtr, out);
  all_crypto_ids = _apfs_get_all_crypto_ids(*(_DWORD *)a1);
  if (!all_crypto_ids)
  {
    uint64_t v37 = *(void *)(a1 + 24);
    uint64_t v38 = __error();
    strerror(*v38);
    debuglog("MKBBackupValidateKey", @"Can't get crypto keys for inode %llu (fd %d): %s", v39, v40, v41, v42, v43, v44, v37);
    return 0xFFFFFFFFLL;
  }
  if (Length)
  {
    unint64_t v24 = 0;
    unint64_t v25 = 0;
    uint64_t v26 = (uint64_t *)(all_crypto_ids + 16);
    uint64_t v27 = BytePtr;
    while (v24 < all_crypto_ids[4])
    {
      uint64_t v28 = bswap32(*((_DWORD *)v27 + 8));
      unint64_t v29 = bswap64(*((void *)v27 + 2));
      unint64_t v30 = bswap64(*(void *)&v27[v28 + 36]);
      memset(v47, 0, 37);
      uuid_unparse(v27, v47);
      debuglog("MKBBackupValidateKey", @"[%d] crypto_id = 0x%016llx, extent_size_t size = %llu, key class = %u, bag uuid = %s", v31, v32, v33, v34, v35, v36, v24);
      if (*v26 >= -1)
      {
        if (v29 != *v26)
        {
          debuglog("MKBBackupValidateKey", @"crypto_id mismatch (0x%016llx != 0x%016llx)", v18, v19, v20, v21, v22, v23, v29);
          goto LABEL_25;
        }
        if (v30 != *(v26 - 1))
        {
          debuglog("MKBBackupValidateKey", @"extent_size mismatch (%llu != %llu)", v18, v19, v20, v21, v22, v23, v30);
          goto LABEL_25;
        }
        if (uuid_compare(v27, BytePtr))
        {
          debuglog("MKBBackupValidateKey", @"bag uuid mismatch (%s != %s)", v18, v19, v20, v21, v22, v23, (char)v47);
          goto LABEL_25;
        }
        v25 += v28 + 44;
        uint64_t v27 = &BytePtr[v25];
      }
      ++v24;
      v26 += 3;
      if (v25 >= Length) {
        break;
      }
    }
  }
  else
  {
    LODWORD(v24) = 0;
    unint64_t v25 = 0;
  }
  if (v25 != Length || v24 != all_crypto_ids[4])
  {
    debuglog("MKBBackupValidateKey", @"extent count mismatch i=%d, count=%d, offset=%zu, key_blob_size=%zu", v18, v19, v20, v21, v22, v23, v24);
LABEL_25:
    free(all_crypto_ids);
    return 0xFFFFFFFFLL;
  }
  free(all_crypto_ids);
  return 0;
}

uint64_t MKBBackupUpdateKeyWithError(int *a1, const __CFData *a2, CFTypeRef *a3, void *a4)
{
  if (!a3) {
    return 4294967279;
  }
  CFMutableDataRef v6 = MKBCopyCryptoIDKeysForFileDescriptor(*a1, a2, a4);
  *a3 = v6;
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0;
  }
  uint64_t result = CFEqual(v6, a2);
  if (result)
  {
    CFRelease(*a3);
    uint64_t result = 0;
    *a3 = 0;
  }
  return result;
}

uint64_t MKBBackupUpdateKey(int *a1, const __CFData *a2, CFTypeRef *a3)
{
  return MKBBackupUpdateKeyWithError(a1, a2, a3, 0);
}

uint64_t MKBBackupCopyKeyWithError(int *a1, CFMutableDataRef *a2, void *a3)
{
  CFMutableDataRef v4 = MKBCopyCryptoIDKeysForFileDescriptor(*a1, 0, a3);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  CFMutableDataRef v5 = v4;
  uint64_t result = 0;
  *a2 = v5;
  return result;
}

uint64_t MKBBackupCopyKey(int *a1, CFMutableDataRef *a2)
{
  CFMutableDataRef v3 = MKBCopyCryptoIDKeysForFileDescriptor(*a1, 0, 0);
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  CFMutableDataRef v4 = v3;
  uint64_t result = 0;
  *a2 = v4;
  return result;
}

uint64_t MKBBackupCopyBackupKeyUUID(const __CFData *a1, CFDataRef *a2)
{
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  if (_MKBBackupCheckKey((uint64_t)BytePtr, Length, v6, v7, v8, v9, v10, v11))
  {
    debuglog("MKBBackupCopyBackupKeyUUID", @"Bad key passed in, does not validate", v12, v13, v14, v15, v16, v17, v21);
    CFDataRef v18 = 0;
    uint64_t v19 = 0xFFFFFFFFLL;
  }
  else
  {
    CFDataRef v18 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], BytePtr, 16);
    uint64_t v19 = 0;
  }
  *a2 = v18;
  return v19;
}

uint64_t MKBBackupSetKeyEncryptionModeToXTS(const __CFData *a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  uint64_t result = _MKBBackupCheckKey((uint64_t)BytePtr, Length, v4, v5, v6, v7, v8, v9);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  *((unsigned char *)BytePtr + 29) = 1;
  return result;
}

uint64_t ANS_AKDF2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  ccaes_cbc_encrypt_mode();
  uint64_t v12 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v14 = &v22 - 2 * v13;
  MEMORY[0x1F4188790](v12);
  uint64_t v17 = &v22 - 2 * v16;
  uint64_t v18 = 0xFFFFFFFFLL;
  if (a5)
  {
    if (a6)
    {
      if ((a6 & 0xF) == 0)
      {
        if (a4)
        {
          if (a1)
          {
            if (a2)
            {
              if (a3)
              {
                uint64_t v23 = v15;
                if (!cccmac_init())
                {
                  unint64_t v24 = 1;
                  if (a6 < 0x10)
                  {
LABEL_15:
                    uint64_t v18 = 0;
                  }
                  else
                  {
                    unint64_t v19 = a6 >> 4;
                    size_t v20 = 80 * v23;
                    while (1)
                    {
                      memcpy(v17, v14, v20);
                      if (cccmac_update()
                        || cccmac_update()
                        || cccmac_final_generate())
                      {
                        break;
                      }
                      ++v24;
                      a5 += 16;
                      if (v24 > v19) {
                        goto LABEL_15;
                      }
                    }
                    uint64_t v18 = 0xFFFFFFFFLL;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  cc_clear();
  cc_clear();
  return v18;
}

uint64_t ANS_AKDF2_construct_fixed_data(void *a1, uint64_t a2, char *__s, uint64_t a4)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 == 8 && __s && a1 && a4 == 15)
  {
    memset_s(__s, 0xFuLL, 0, 0xFuLL);
    uint64_t v7 = 0;
    strcpy(__s, "ANS2");
    *(void *)(__s + 5) = *a1;
    *(_WORD *)(__s + 13) = 1;
    for (uint64_t i = 14; i != 7; --i)
    {
      char v9 = __s[v7];
      __s[v7] = __s[i];
      __s[i] = v9;
      ++v7;
    }
    return 0;
  }
  return result;
}

uint64_t MKBBackupDecryptInPlace(uint64_t a1, const char *a2, off_t a3, CFDataRef theData)
{
  return __MKBBackupDecryptInPlace(0, *(unsigned int *)(a1 + 16), a2, a3, theData);
}

uint64_t __MKBBackupDecryptInPlace(uint64_t a1, uint64_t a2, const char *a3, off_t a4, CFDataRef theData)
{
  uint64_t v178 = *MEMORY[0x1E4F143B8];
  BytePtr = CFDataGetBytePtr(theData);
  unint64_t Length = CFDataGetLength(theData);
  long long data = 0u;
  long long v177 = 0u;
  size_t v163 = 32;
  long long v175 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  long long v172 = 0u;
  uint64_t v162 = ccaes_xts_decrypt_mode();
  uint64_t v12 = MEMORY[0x1F4188790](v162);
  uint64_t v14 = (char *)&v143 - v13;
  MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v143 - v15;
  uint64_t v170 = 0;
  uint64_t v171 = 0;
  int v23 = _MKBBackupCheckKey((uint64_t)BytePtr, Length, v17, v18, v19, v20, v21, v22);
  uint64_t v30 = bswap32(*((_DWORD *)BytePtr + 8));
  if (v23)
  {
    debuglog("__MKBBackupDecryptInPlace", @"corrupt key; blob size %lu, key size %u",
      v24,
      v25,
      v26,
      v27,
      v28,
      v29,
      Length);
    return 0xFFFFFFFFLL;
  }
  uint64_t v157 = BytePtr;
  uint64_t v152 = a1;
  uint64_t v150 = a2;
  unint64_t v32 = v30 + 36;
  uint64_t v33 = "false";
  unint64_t v153 = v32;
  if (Length > v32) {
    uint64_t v33 = "true";
  }
  debuglog("__MKBBackupDecryptInPlace", @"extents = %s", v24, v25, v26, v27, v28, v29, (char)v33);
  int v34 = open(a3, 2);
  if (v34 == -1)
  {
    uint64_t v114 = __error();
    strerror(*v114);
    debuglog("__MKBBackupDecryptInPlace", @"open(%s) failed: %s", v115, v116, v117, v118, v119, v120, (char)a3);
    uint64_t v42 = 0;
LABEL_95:
    uint64_t v31 = 0xFFFFFFFFLL;
    goto LABEL_81;
  }
  off_t v154 = a4;
  vm_address_t page_aligned_buffer = allocate_page_aligned_buffer(0x8000uLL);
  uint64_t v42 = page_aligned_buffer;
  if (!page_aligned_buffer)
  {
    debuglog("__MKBBackupDecryptInPlace", @"Failed to initialize crypto_buffer", v36, v37, v38, v39, v40, v41, (char)v143);
    goto LABEL_95;
  }
  uint64_t v161 = v16;
  uint64_t v148 = &v157[Length];
  if (&v157[Length] <= v157) {
    goto LABEL_77;
  }
  off_t v43 = 0;
  int v44 = 0;
  uint64_t v143 = &v177;
  int v149 = 1;
  int v160 = v14;
  id v147 = &v143;
  int v156 = v34;
  vm_address_t v146 = page_aligned_buffer;
  uint64_t v144 = a3;
  unint64_t v155 = Length;
  while (2)
  {
    uint64_t v45 = v157;
    unsigned int v46 = *((_DWORD *)v157 + 8);
    uint64_t v151 = bswap32(v46);
    unsigned int v159 = v46;
    if (v46)
    {
      uint64_t v47 = v42;
      unsigned int v48 = *((_DWORD *)v157 + 6);
      unsigned int v49 = bswap32(v48);
      debuglog("__MKBBackupDecryptInPlace", @"key class %d", v36, v37, v38, v39, v40, v41, v49);
      char v50 = (char)v45;
      if (*((_DWORD *)v45 + 7) == 0x1000000)
      {
        int v51 = 0;
      }
      else if (v45[28] == 1)
      {
        int v51 = v45[29];
      }
      else
      {
        int v51 = v45[28];
      }
      if (v149)
      {
        unsigned int v53 = v48 == 285212672 ? 7 : v49;
        uint64_t v54 = v53 == 1 ? 2 : v53;
        if (fcntl(v34, 64, v54))
        {
          uint64_t v121 = __error();
          strerror(*v121);
          debuglog("__MKBBackupDecryptInPlace", @"Can't set key class to %d: %s", v122, v123, v124, v125, v126, v127, v54);
          uint64_t v31 = 0xFFFFFFFFLL;
          uint64_t v42 = v47;
          goto LABEL_81;
        }
      }
      char v55 = v50 + 36;
      if (v150 == -1)
      {
        uint64_t v42 = v47;
        if (aks_backup_unwrap_key())
        {
          debuglog("__MKBBackupDecryptInPlace", @"Failed to unwrap key (%p,%d) in class %d with keypair: 0x%08x", v57, v58, v59, v60, v61, v62, v55);
          goto LABEL_99;
        }
      }
      else
      {
        LODWORD(md) = v163;
        int v56 = aks_unwrap_key();
        size_t v163 = (int)md;
        uint64_t v42 = v47;
        if (v56)
        {
          debuglog("__MKBBackupDecryptInPlace", @"Failed to unwrap key (%p,%d) in class %d with handle %d: 0x%08x", v57, v58, v59, v60, v61, v62, v55);
LABEL_99:
          uint64_t v31 = 0xFFFFFFFFLL;
          goto LABEL_81;
        }
      }
      if (v51 != 2)
      {
        uint64_t v63 = v160;
        if (v51 == 1)
        {
          debuglog("__MKBBackupDecryptInPlace", @"xts mode", v57, v58, v59, v60, v61, v62, (char)v143);
          (*(void (**)(uint64_t, char *, uint64_t, long long *, long long *))(v162 + 24))(v162, v63, 16, &data, v143);
          int v149 = 0;
          int v44 = 1;
        }
        else
        {
          if (v51)
          {
            debuglog("__MKBBackupDecryptInPlace", @"error: unexpected encryption mode : %d", v57, v58, v59, v60, v61, v62, v51);
            goto LABEL_87;
          }
          debuglog("__MKBBackupDecryptInPlace", @"cbc mode", v57, v58, v59, v60, v61, v62, (char)v143);
          int v44 = 0;
          int v149 = 0;
        }
        goto LABEL_38;
      }
      unint64_t dataIn = 0;
      iv[0] = 0x100000000000000;
      *(void *)((char *)&md + 7) = 0;
      *(void *)&long long md = 0;
      debuglog("__MKBBackupDecryptInPlace", @"xts ans kdf2 mode", v57, v58, v59, v60, v61, v62, (char)v143);
      int v64 = ANS_AKDF2_construct_fixed_data(&dataIn, 8, (char *)&md, 15);
      uint64_t v71 = v160;
      if (v64)
      {
        CFStringRef v128 = @"Failed to construct tweak key fixed data";
      }
      else if (ANS_AKDF2((uint64_t)&data, v163, (uint64_t)&md, 15, (uint64_t)&v172, 0x20uLL))
      {
        CFStringRef v128 = @"Failed to construct tweak key";
      }
      else if (ANS_AKDF2_construct_fixed_data(iv, 8, (char *)&md, 15))
      {
        CFStringRef v128 = @"Failed to construct data key fixed data";
      }
      else
      {
        if (!ANS_AKDF2((uint64_t)&data, v163, (uint64_t)&md, 15, (uint64_t)&v174, 0x20uLL))
        {
          (*(void (**)(uint64_t, char *, uint64_t, long long *, long long *))(v162 + 24))(v162, v71, 32, &v174, &v172);
          int v149 = 0;
          int v44 = 2;
LABEL_38:
          uint64_t v52 = (char *)v42;
          goto LABEL_39;
        }
        CFStringRef v128 = @"Failed to construct data key";
      }
      debuglog("__MKBBackupDecryptInPlace", v128, v65, v66, v67, v68, v69, v70, (char)v143);
      goto LABEL_87;
    }
    uint64_t v52 = 0;
LABEL_39:
    if (Length <= v153)
    {
      unint64_t v72 = -1;
    }
    else
    {
      unint64_t v72 = bswap64(*(void *)&v157[v151 + 36]);
      debuglog("__MKBBackupDecryptInPlace", @"extent = %llu bytes", v36, v37, v38, v39, v40, v41, v72);
    }
    if (!v159)
    {
      if ((uint64_t)(v72 + v43) <= v154)
      {
        *(void *)&long long md = 0;
        *((void *)&md + 1) = v43;
        unint64_t v169 = v72;
        if (fcntl(v34, 99, &md))
        {
          uint64_t v136 = __error();
          strerror(*v136);
          debuglog("__MKBBackupDecryptInPlace", @"F_PUNCHHOLE failed on %s for range (%lld:%llu): %s", v137, v138, v139, v140, v141, v142, (char)v144);
LABEL_106:
          uint64_t v31 = 0xFFFFFFFFLL;
LABEL_80:
          uint64_t v42 = v146;
          goto LABEL_81;
        }
      }
      else if (ftruncate(v34, v43))
      {
        id v129 = __error();
        strerror(*v129);
        debuglog("__MKBBackupDecryptInPlace", @"Failed to shrink %s to %lld: %s", v130, v131, v132, v133, v134, v135, (char)v144);
        goto LABEL_106;
      }
    }
    int v145 = v44;
    unsigned int v73 = v44 - 1;
    do
    {
      if (v72 >= 0x8000) {
        ssize_t v74 = 0x8000;
      }
      else {
        ssize_t v74 = v72;
      }
      if (v159)
      {
        ssize_t v75 = pread(v34, v52, v74, v43);
        debuglog("__MKBBackupDecryptInPlace", @"nbytes = %zd, bytes_read = %zd", v76, v77, v78, v79, v80, v81, v74);
        if (!v75) {
          break;
        }
        if (v75 <= 0)
        {
          uint64_t v107 = __error();
          strerror(*v107);
          debuglog("__MKBBackupDecryptInPlace", @"Failed to pread(%zu, %llu) from %s (%s)", v108, v109, v110, v111, v112, v113, v74);
          goto LABEL_92;
        }
        if ((v75 & 0xF) != 0)
        {
          debuglog("__MKBBackupDecryptInPlace", @"bytes_read(%zd) not multiple of encryption block size", v36, v37, v38, v39, v40, v41, v75);
          goto LABEL_92;
        }
        unint64_t v158 = v72;
        if (((v75 + 4095) & 0xFFFFFFFF000) != 0)
        {
          int v82 = 0;
          uint64_t v83 = v43 >> 12;
          for (uint64_t i = ((unint64_t)(v75 + 4095) >> 12); i; --i)
          {
            if (v73 > 1)
            {
              CC_SHA1(&data, v163, (unsigned __int8 *)&md);
              unsigned int v90 = ((v43 + v82) >> 1) ^ 0x80000061;
              if ((v43 & 1) == 0) {
                unsigned int v90 = (v43 + v82) >> 1;
              }
              unsigned int v91 = v90 >> 1;
              if (v90) {
                unsigned int v91 = (v90 >> 1) ^ 0x80000061;
              }
              unint64_t dataIn = __PAIR64__(v91, v90);
              unsigned int v92 = v91 >> 1;
              if (v91) {
                unsigned int v92 = (v91 >> 1) ^ 0x80000061;
              }
              unsigned int v93 = v92 >> 1;
              if (v92) {
                unsigned int v93 = (v92 >> 1) ^ 0x80000061;
              }
              unsigned int v166 = v92;
              unsigned int v167 = v93;
              if (CCCrypt(0, 0, 0, &md, 0x10uLL, 0, &dataIn, 0x10uLL, iv, 0x10uLL, 0)
                || CCCrypt(1u, 0, 0, &data, v163, iv, &v52[v82], 0x1000uLL, &v52[v82], 0x1000uLL, 0))
              {
                uint64_t v31 = 0xFFFFFFFFLL;
                int v34 = v156;
                goto LABEL_80;
              }
            }
            else
            {
              uint64_t v170 = v83;
              uint64_t v171 = v83;
              uint64_t v85 = v162;
              uint64_t v86 = v160;
              off_t v87 = v43;
              uint64_t v88 = v161;
              (*(void (**)(char *, char *, uint64_t *))(v162 + 40))(v160, v161, &v170);
              char v89 = v88;
              off_t v43 = v87;
              (*(void (**)(char *, char *, uint64_t, char *, char *))(v85 + 48))(v86, v89, 256, &v52[v82 & 0xFFFFF000], &v52[v82 & 0xFFFFF000]);
            }
            v82 += 4096;
            ++v83;
          }
        }
        int v34 = v156;
        ssize_t v74 = pwrite(v156, v52, v75, v43);
        unint64_t Length = v155;
        unint64_t v72 = v158;
      }
      else
      {
        ssize_t v75 = v74;
      }
      if (v74 <= 0)
      {
        debuglog("__MKBBackupDecryptInPlace", @"Failed to pwrite(%lu, %llu) from %s", v36, v37, v38, v39, v40, v41, 0);
LABEL_92:
        uint64_t v31 = 0xFFFFFFFFLL;
        goto LABEL_80;
      }
      if (v75 != v74)
      {
        debuglog("__MKBBackupDecryptInPlace", @"bytes_read(%lu) != bytes_written(%lu)", v36, v37, v38, v39, v40, v41, v75);
        goto LABEL_92;
      }
      v43 += v75;
      if (v75 < 1) {
        break;
      }
      v72 -= v75;
    }
    while (v72);
    v157 += v151 + 44;
    uint64_t v42 = v146;
    LOBYTE(a3) = (_BYTE)v144;
    int v44 = v145;
    if (v148 > v157) {
      continue;
    }
    break;
  }
LABEL_77:
  if (!ftruncate(v34, v154))
  {
    uint64_t v31 = 0;
    goto LABEL_81;
  }
  debuglog("__MKBBackupDecryptInPlace", @"Failed to truncate %s to %lld", v94, v95, v96, v97, v98, v99, (char)a3);
LABEL_87:
  uint64_t v31 = 0xFFFFFFFFLL;
LABEL_81:
  __memset_chk();
  long long v173 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  long long v172 = 0u;
  cc_clear();
  cc_clear();
  cc_clear();
  if (v42) {
    deallocate_page_aligned_buffer(v42, 0x8000, v100, v101, v102, v103, v104, v105, (char)v143);
  }
  if (v34 != -1) {
    close(v34);
  }
  return v31;
}

uint64_t MKBOTABackupBagOpen(const __CFData *a1, const __CFData *a2, void *a3)
{
  uint64_t v6 = malloc_type_calloc(1uLL, 0x44uLL, 0x100004069DB8102uLL);
  if (v6)
  {
    uint64_t v13 = v6;
    *uint64_t v6 = -1;
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
    if (a2)
    {
      CFDataGetBytePtr(a2);
      CFDataGetLength(a2);
    }
    if (!aks_backup_unwrap_bag())
    {
      debuglog("MKBOTABackupBagOpen", @"Unwrapped userland backup bag", v14, v15, v16, v17, v18, v19, v35);
LABEL_10:
      uint64_t result = 0;
      *a3 = v13;
      return result;
    }
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
    int bag = aks_load_bag();
    if (bag)
    {
      debuglog("MKBOTABackupBagOpen", @"Failed to load in-kernel backup bag: 0x%08x", v21, v22, v23, v24, v25, v26, bag);
    }
    else
    {
      if (a2)
      {
        CFDataGetBytePtr(a2);
        CFDataGetLength(a2);
      }
      int v27 = aks_unlock_bag();
      if (!v27) {
        goto LABEL_10;
      }
      debuglog("MKBOTABackupBagOpen", @"Failed to unlock in-kernel backup bag: 0x%08x", v28, v29, v30, v31, v32, v33, v27);
    }
    if (*v13 != -1) {
      aks_unload_bag();
    }
    free(v13);
  }
  else
  {
    debuglog("MKBOTABackupBagOpen", @"failed to allocate backup bag handle", v7, v8, v9, v10, v11, v12, v35);
  }
  return 0xFFFFFFFFLL;
}

uint64_t MKBOTABackupBagClose(char *a1)
{
  if (*(_DWORD *)a1 != -1) {
    aks_unload_bag();
  }
  *(_OWORD *)(a1 + 52) = 0u;
  *(_OWORD *)(a1 + 36) = 0u;
  *(_OWORD *)(a1 + 20) = 0u;
  *(_OWORD *)(a1 + 4) = 0u;
  free(a1);
  return 0;
}

uint64_t MKBOTABackupBagCopyUUID(uint64_t a1, CFDataRef *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)a1 == -1)
  {
    CFDataRef v12 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UInt8 *)(a1 + 36), 16);
    uint64_t v11 = 0;
LABEL_6:
    *a2 = v12;
    return v11;
  }
  *(void *)bytes = 0;
  uint64_t v15 = 0;
  uint64_t bag_uuid = aks_get_bag_uuid();
  uint64_t v11 = convertAKSErrorToMKB(bag_uuid);
  if (!v11)
  {
    CFDataRef v12 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], bytes, 16);
    goto LABEL_6;
  }
  debuglog("MKBOTABackupBagCopyUUID", @"failed to get uuid for handle %d", v5, v6, v7, v8, v9, v10, *(_DWORD *)a1);
  return v11;
}

uint64_t MKBOTABackupBagIsKernel(_DWORD *a1, BOOL *a2)
{
  *a2 = *a1 != -1;
  return 0;
}

uint64_t MKBOTABackupDecryptInPlace(unsigned int *a1, const char *a2, off_t a3, CFDataRef theData)
{
  return __MKBBackupDecryptInPlace((uint64_t)(a1 + 1), *a1, a2, a3, theData);
}

uint64_t MKBKeyBagChangeSystemSecretWithEscrow(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = +[MKBKeyStoreDevice sharedService];
  uint64_t v11 = [v10 ChangeSystemSecretWithEscrow:a1 FromOldPasscode:a2 ToNew:a3 withOpaqueDats:a5 withKeepState:a4];

  return v11;
}

uint64_t MKBOTABackupStart()
{
  uint64_t v0 = +[MKBKeyStoreDevice sharedService];
  uint64_t v1 = [v0 startBackupSessionForVolume:0];

  return v1;
}

uint64_t MKBOTABackupStop()
{
  uint64_t v0 = +[MKBKeyStoreDevice sharedService];
  uint64_t v1 = [v0 stopBackupSessionForVolume:0];

  return v1;
}

uint64_t MKBOTABackupStartForVolume(uint64_t a1)
{
  uint64_t v2 = +[MKBKeyStoreDevice sharedService];
  uint64_t v3 = [v2 startBackupSessionForVolume:a1];

  return v3;
}

uint64_t MKBOTABackupStopForVolume(uint64_t a1)
{
  uint64_t v2 = +[MKBKeyStoreDevice sharedService];
  uint64_t v3 = [v2 stopBackupSessionForVolume:a1];

  return v3;
}

uint64_t MKBKeyBagChangeSystemGeneration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = +[MKBKeyStoreDevice sharedService];
  uint64_t v5 = [v4 changeClassKeysGenerationWithSecret:a1 withGenerationOption:a2];

  return v5;
}

uint64_t MKBKeyBagGetSystemGeneration()
{
  if (aks_generation()) {
    return 4294966296;
  }
  else {
    return 0;
  }
}

uint64_t MKBKeyBagIsKeyRolling(_DWORD *a1)
{
  int v5 = 0;
  uint64_t v2 = +[MKBKeyStoreDevice sharedService];
  uint64_t v3 = [v2 isKeyRollingWithKeyStatus:&v5];

  if (a1 && !v3) {
    *a1 = v5;
  }
  return v3;
}

uint64_t MKBKeyBagMigrateFS()
{
  uint64_t v0 = +[MKBKeyStoreDevice sharedService];
  uint64_t v1 = [v0 migrateFS];

  return v1;
}

uint64_t MKBPrewarmSPS(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  debuglog("MKBPrewarmSPS", @"Prewarming SPSs with %@", a3, a4, a5, a6, a7, a8, a1);
  uint64_t result = aks_prewarm_sps();
  if (result)
  {
    debuglog("MKBPrewarmSPS", @"Error prewarming SPSs: %d", v9, v10, v11, v12, v13, v14, result);
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t MKBForgottenPasscodeEvent()
{
  uint64_t v0 = +[MKBKeyStoreDevice sharedService];
  uint64_t v1 = [v0 forgottenPasscodeEvent];

  return v1;
}

void __MKBUnlockDeviceForACMRef_block_invoke(uint64_t a1)
{
  id v2 = +[MKBKeyStoreDevice sharedService];
  [v2 Event:*(unsigned int *)(a1 + 32)];
}

void __MKBAssertionFinalize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1) {
    int v9 = *(_DWORD *)(a1 + 24);
  }
  else {
    LOBYTE(v9) = -1;
  }
  debuglog("__MKBAssertionFinalize", @"dropping lock assertion for: handle:%d, type:%d, status:%d", a3, a4, a5, a6, a7, a8, v9);
  if (*(_DWORD *)(a1 + 20))
  {
    if (!aks_assert_drop()) {
      *(_DWORD *)(a1 + 20) = 0;
    }
  }
}

__CFString *__MKBAssertionCopyDescription(unsigned int *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  CFAllocatorRef v3 = v2;
  uint64_t v4 = a1[4];
  if (v4 <= 4) {
    int v5 = __AssertionTypes[v4];
  }
  else {
    int v5 = @"Other";
  }
  CFMutableDataRef Mutable = CFStringCreateMutable(v2, 0);
  uint64_t v7 = a1[4];
  CFIndex v8 = CFGetRetainCount(a1);
  CFStringAppendFormat(Mutable, 0, @"<MKBAssertion %p [%p]> { AssertionType '%@' (%d), Assertion Retain: (%d)", a1, v3, v5, v7, v8);
  CFStringAppendFormat(Mutable, 0, @"}");
  return Mutable;
}

uint64_t __MKBKeyBagHandleFinalize(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    aks_prederived_free();
  }
  uint64_t result = *(unsigned int *)(a1 + 16);
  if ((result & 0x80000000) == 0)
  {
    uint64_t result = aks_unload_bag();
    *(_DWORD *)(a1 + 16) = -1;
  }
  return result;
}

id ObjectOrNull(void *a1)
{
  id v1 = a1;
  CFAllocatorRef v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v4 = v3;

  return v4;
}

uint64_t KBPostAggdScalar(uint64_t a1, int a2, unsigned int a3)
{
  if (MEMORY[0x1E4F49EC0]) {
    BOOL v3 = MEMORY[0x1E4F49ED8] == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3 || a1 == 0) {
    return 0xFFFFFFFFLL;
  }
  if (a3 && arc4random() % a3) {
    return 0xFFFFFFFFLL;
  }
  if (a2) {
    ADClientSetValueForScalarKey();
  }
  else {
    ADClientAddValueForScalarKey();
  }
  return 0;
}

uint64_t KBPostAggdDistribution(uint64_t a1, int a2, unsigned int a3)
{
  if (MEMORY[0x1E4F49EC8]) {
    BOOL v3 = MEMORY[0x1E4F49ED0] == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3 || a1 == 0) {
    return 0xFFFFFFFFLL;
  }
  if (a3 && arc4random() % a3) {
    return 0xFFFFFFFFLL;
  }
  if (a2) {
    ADClientSetValueForDistributionKey();
  }
  else {
    ADClientPushValueForDistributionKey();
  }
  return 0;
}

uint64_t analytics_persist_event(CFStringRef theString1, unsigned int a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  if (!theString1 || a2 && arc4random() % a2) {
    return 0xFFFFFFFFLL;
  }
  int id = analytics_persistance_report_get_id(theString1);
  uint64_t v79 = id;
  if (id == -1)
  {
    CFStringRef v73 = @"unsupported key";
LABEL_32:
    debuglog("analytics_persist_event", v73, v5, v6, v7, v8, v9, v10, v77);
    return 0xFFFFFFFFLL;
  }
  CFDictionaryRef Mutable = CopyPersistedReports();
  if (!Mutable)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (!Mutable)
    {
      CFStringRef v73 = @"Can't create dict";
      goto LABEL_32;
    }
  }
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(Mutable, @"DATA");
  if (Value)
  {
    CFArrayRef v13 = Value;
    CFTypeID v14 = CFGetTypeID(Value);
    if (v14 != CFArrayGetTypeID())
    {
      CFStringRef v74 = @"wrong type";
      goto LABEL_45;
    }
    CFAllocatorRef v21 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v13);
  }
  else
  {
    CFAllocatorRef v21 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFMutableArrayRef MutableCopy = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  }
  uint64_t v23 = MutableCopy;
  if (!MutableCopy)
  {
    CFStringRef v74 = @"unable to allocate array";
LABEL_45:
    debuglog("analytics_persist_event", v74, v15, v16, v17, v18, v19, v20, v77);
    CFDictionaryRef v75 = Mutable;
    goto LABEL_46;
  }
  CFNumberRef v24 = CFNumberCreate(v21, kCFNumberSInt64Type, &valuePtr);
  if (!v24)
  {
    debuglog("analytics_persist_event", @"unable to allocate", v25, v26, v27, v28, v29, v30, v77);
    CFRelease(Mutable);
    CFDictionaryRef v75 = v23;
LABEL_46:
    CFRelease(v75);
    return 0xFFFFFFFFLL;
  }
  CFNumberRef v31 = v24;
  CFNumberRef v38 = CFNumberCreate(v21, kCFNumberSInt64Type, &v79);
  if (v38)
  {
    uint64_t v39 = CFArrayCreateMutable(v21, 0, MEMORY[0x1E4F1D510]);
    uint64_t v40 = v39;
    if (v39)
    {
      CFArrayAppendValue(v39, v38);
      CFArrayAppendValue(v40, v31);
      CFArrayAppendValue(v23, v40);
      if (CFArrayGetCount(v23) >= 6)
      {
        debuglog("analytics_persist_event", @"at capacity, discarding oldest data entry", v41, v42, v43, v44, v45, v46, v77);
        CFArrayRemoveValueAtIndex(v23, 0);
      }
      CFDictionarySetValue(Mutable, @"DATA", v23);
      int v78 = 0;
      CFNumberRef v47 = CFNumberCreate(v21, kCFNumberSInt32Type, &v78);
      if (v47)
      {
        CFNumberRef v48 = v47;
        CFDictionarySetValue(Mutable, @"VERS", v47);
        io_registry_entry_t v49 = IORegistryEntryFromPath(*MEMORY[0x1E4F2EEF0], "IODeviceTree:/options");
        CFTypeRef v50 = convertObjectToBinary(Mutable);
        if (v50)
        {
          uint64_t v57 = v50;
          if (IORegistryEntrySetCFProperty(v49, @"mkb-reports", v50))
          {
            debuglog("SetPersistedReports", @"cant set", v58, v59, v60, v61, v62, v63, v77);
            int v64 = -1;
          }
          else
          {
            int v64 = 0;
          }
          CFRelease(v57);
          if (!v49) {
            goto LABEL_23;
          }
        }
        else
        {
          debuglog("SetPersistedReports", @"Can't serialize dictionary", v51, v52, v53, v54, v55, v56, v77);
          int v64 = -1;
          if (!v49) {
            goto LABEL_23;
          }
        }
        IOObjectRelease(v49);
LABEL_23:
        if (v64)
        {
          debuglog("analytics_persist_event", @"failed to persist dict", v65, v66, v67, v68, v69, v70, v77);
          uint64_t v71 = 0xFFFFFFFFLL;
        }
        else
        {
          uint64_t v71 = 0;
        }
        CFRelease(v48);
        CFRelease(Mutable);
        CFRelease(v31);
        goto LABEL_26;
      }
      CFStringRef v76 = @"cant allocate mem";
    }
    else
    {
      CFStringRef v76 = @"cant allocate";
    }
  }
  else
  {
    uint64_t v40 = 0;
    CFStringRef v76 = @"unable to allocate";
  }
  debuglog("analytics_persist_event", v76, v32, v33, v34, v35, v36, v37, v77);
  CFRelease(Mutable);
  CFRelease(v31);
  uint64_t v71 = 0xFFFFFFFFLL;
  if (v38) {
LABEL_26:
  }
    CFRelease(v38);
  CFRelease(v23);
  if (v40) {
    CFRelease(v40);
  }
  return v71;
}

uint64_t analytics_persistance_report_get_id(CFStringRef theString1)
{
  if (!theString1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = 0;
  for (uint64_t i = (CFStringRef *)&persisted_keys_table; !*i || CFStringCompare(theString1, *i, 1uLL); i += 2)
  {
    if (++v2 == 4) {
      return 0xFFFFFFFFLL;
    }
  }
  return v2;
}

CFDictionaryRef CopyPersistedReports()
{
  io_registry_entry_t v0 = IORegistryEntryFromPath(*MEMORY[0x1E4F2EEF0], "IODeviceTree:/options");
  if (!v0) {
    return 0;
  }
  io_object_t v1 = v0;
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v0, @"mkb-reports", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  if (!CFProperty)
  {
    IOObjectRelease(v1);
    return 0;
  }
  CFDataRef v3 = CFProperty;
  BytePtr = (UInt8 *)CFDataGetBytePtr(CFProperty);
  CFIndex Length = CFDataGetLength(v3);
  CFDictionaryRef binary_dict_from_buffer = (const __CFDictionary *)load_binary_dict_from_buffer(BytePtr, Length);
  CFDictionaryRef v7 = binary_dict_from_buffer;
  if (!binary_dict_from_buffer) {
    goto LABEL_24;
  }
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(binary_dict_from_buffer, @"VERS");
  if (!Value)
  {
    CFStringRef v28 = @"no version";
LABEL_22:
    debuglog("analytics_persistance_validate_dict", v28, v9, v10, v11, v12, v13, v14, v36);
LABEL_23:
    CFRelease(v7);
    debuglog("CopyPersistedReports", @"invalid dict", v29, v30, v31, v32, v33, v34, v37);
    CFDictionaryRef v7 = 0;
    goto LABEL_24;
  }
  CFNumberRef v15 = Value;
  CFTypeID v16 = CFGetTypeID(Value);
  if (v16 != CFNumberGetTypeID())
  {
    CFStringRef v28 = @"version is of wrong type";
    goto LABEL_22;
  }
  int valuePtr = 0;
  if (!CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr))
  {
    CFStringRef v28 = @"invalid version format";
    goto LABEL_22;
  }
  if (valuePtr)
  {
    debuglog("analytics_persistance_validate_dict", @"non-current version %d", v9, v10, v11, v12, v13, v14, valuePtr);
    goto LABEL_23;
  }
  CFArrayRef v17 = (const __CFArray *)CFDictionaryGetValue(v7, @"DATA");
  if (!v17)
  {
    CFStringRef v28 = @"no data";
    goto LABEL_22;
  }
  CFArrayRef v18 = v17;
  CFTypeID v19 = CFGetTypeID(v17);
  if (v19 != CFArrayGetTypeID())
  {
    CFStringRef v28 = @"data is of wrong type";
    goto LABEL_22;
  }
  if (CFArrayGetCount(v18) > 5)
  {
    CFStringRef v28 = @"too many entries";
    goto LABEL_22;
  }
  if (CFArrayGetCount(v18) >= 1)
  {
    CFIndex v20 = 0;
    while (2)
    {
      CFNumberRef ValueAtIndex = CFArrayGetValueAtIndex(v18, v20);
      CFTypeID v22 = CFGetTypeID(ValueAtIndex);
      if (v22 == CFArrayGetTypeID())
      {
        if (CFArrayGetCount((CFArrayRef)ValueAtIndex) == 2)
        {
          CFIndex v23 = 0;
          char v24 = 1;
          do
          {
            char v25 = v24;
            uint64_t v26 = CFArrayGetValueAtIndex((CFArrayRef)ValueAtIndex, v23);
            if (!v26 || (CFTypeID v27 = CFGetTypeID(v26), v27 != CFNumberGetTypeID()))
            {
              char v36 = v23;
              CFStringRef v28 = @"sub%d is of wrong type";
              goto LABEL_22;
            }
            char v24 = 0;
            CFIndex v23 = 1;
          }
          while ((v25 & 1) != 0);
          if (CFArrayGetCount(v18) > ++v20) {
            continue;
          }
          break;
        }
        CFStringRef v28 = @"sub has unexpected number of data";
      }
      else
      {
        CFStringRef v28 = @"sub is of wrong type";
      }
      goto LABEL_22;
    }
  }
LABEL_24:
  IOObjectRelease(v1);
  CFRelease(v3);
  return v7;
}

uint64_t analytics_iterate_persisted_eventsWithBlock(uint64_t a1)
{
  unint64_t v20 = 0;
  uint64_t valuePtr = 0;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  CFDictionaryRef v2 = CopyPersistedReports();
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  CFDictionaryRef v3 = v2;
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v2, @"DATA");
  if (Value)
  {
    CFArrayRef v11 = Value;
    if (CFArrayGetCount(Value) >= 1)
    {
      CFIndex v12 = 0;
      do
      {
        CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(v11, v12);
        CFNumberRef v14 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 0);
        CFNumberGetValue(v14, kCFNumberSInt64Type, &v20);
        CFNumberRef v15 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 1);
        CFNumberGetValue(v15, kCFNumberSInt64Type, &valuePtr);
        if (v20 <= 0xFFFFFFFE && (v20 & 0xFFFFFFFC) == 0)
        {
          uint64_t v17 = *((void *)&persisted_keys_table + 2 * v20);
          if (v17) {
            (*(void (**)(uint64_t, uint64_t, uint64_t, void, uint64_t))(a1 + 16))(a1, v17, 1, 0, valuePtr);
          }
        }
        ++v12;
      }
      while (CFArrayGetCount(v11) > v12);
    }
    uint64_t v18 = 0;
  }
  else
  {
    debuglog("analytics_iterate_persisted_eventsWithBlock", @"no data", v5, v6, v7, v8, v9, v10, v20);
    uint64_t v18 = 0xFFFFFFFFLL;
  }
  CFRelease(v3);
  return v18;
}

uint64_t analytics_submit_persisted_eventsWithBlock(uint64_t a1)
{
  kern_return_t v8;
  char v10;

  if (analytics_iterate_persisted_eventsWithBlock(a1)) {
    return 0xFFFFFFFFLL;
  }
  io_registry_entry_t v1 = IORegistryEntryFromPath(*MEMORY[0x1E4F2EEF0], "IODeviceTree:/options");
  uint64_t v8 = IORegistryEntrySetCFProperty(v1, @"IONVRAM-DELETE-PROPERTY", @"mkb-reports");
  if (v8)
  {
    debuglog("DeletePersistedReports", @"cant delete", v2, v3, v4, v5, v6, v7, v10);
    if (!v1) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (v1) {
LABEL_4:
  }
    IOObjectRelease(v1);
LABEL_5:
  if (!v8) {
    return 0;
  }
  debuglog("analytics_submit_persisted_eventsWithBlock", @"cant delete", v2, v3, v4, v5, v6, v7, v10);
  return 0xFFFFFFFFLL;
}

uint64_t analytics_is_event_persisted(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = a1;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000;
  char v15 = 0;
  if (a1)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 0x40000000;
    v11[2] = __analytics_is_event_persisted_block_invoke;
    v11[3] = &unk_1E61CAD70;
    v11[4] = &v12;
    v11[5] = a1;
    analytics_iterate_persisted_eventsWithBlock((uint64_t)v11);
  }
  debuglog("analytics_is_event_persisted", @"event %@ is already persisted: %d", a3, a4, a5, a6, a7, a8, v8);
  uint64_t v9 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t __analytics_is_event_persisted_block_invoke(uint64_t a1, const void *a2)
{
  if (CFEqual(*(CFTypeRef *)(a1 + 40), a2)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return 0;
}

uint64_t analytics_submit_persisted_events()
{
  return analytics_submit_persisted_eventsWithBlock((uint64_t)&__block_literal_global_1);
}

uint64_t __analytics_submit_persisted_events_block_invoke(int a1, CFStringRef theString, int a3, uint64_t a4, uint64_t a5)
{
  char CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
  debuglog("analytics_submit_persisted_events_block_invoke", @"persisted-report-submit %s:%llx", v9, v10, v11, v12, v13, v14, CStringPtr);
  unsigned int id = analytics_persistance_report_get_id(theString);
  if (id <= 3) {
    (*((void (**)(uint64_t))&persisted_keys_table + 2 * id + 1))(a5);
  }

  return KBPostAggdScalar((uint64_t)theString, a3, 0);
}

uint64_t analytics_persistance_test()
{
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x2000000000;
  int v17 = 0;
  if (geteuid())
  {
    CFStringRef v9 = @"must be privileged";
    goto LABEL_18;
  }
  if (analytics_persist_event(@"com.apple.mobile.keybagd.seshat.report", 0, 0)
    || analytics_persist_event(@"com.apple.mobile.keybagd.seshat.recovery_required", 0, 0))
  {
    CFStringRef v9 = @"post failed";
LABEL_18:
    debuglog("analytics_persistance_test", v9, v0, v1, v2, v3, v4, v5, v10);
LABEL_19:
    uint64_t v7 = 0xFFFFFFFFLL;
    goto LABEL_13;
  }
  if (!analytics_persist_event(@"example.that.doesnt.exist", 0, 0))
  {
    CFStringRef v9 = @"post succeeded unexpectedly";
    goto LABEL_18;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 0x40000000;
  v13[2] = __analytics_persistance_test_block_invoke;
  v13[3] = &unk_1E61CADB8;
  _OWORD v13[4] = &v14;
  if (analytics_submit_persisted_eventsWithBlock((uint64_t)v13))
  {
    CFStringRef v9 = @"submission failed";
    goto LABEL_18;
  }
  if (*((_DWORD *)v15 + 6) != 2) {
    goto LABEL_19;
  }
  *((_DWORD *)v15 + 6) = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 0x40000000;
  v12[2] = __analytics_persistance_test_block_invoke_2;
  v12[3] = &unk_1E61CADE0;
  v12[4] = &v14;
  analytics_submit_persisted_eventsWithBlock((uint64_t)v12);
  if (*((_DWORD *)v15 + 6)) {
    goto LABEL_19;
  }
  uint64_t v6 = 0;
  *((_DWORD *)v15 + 6) = 0;
  do
    analytics_persist_event(@"com.apple.mobile.keybagd.seshat.report", 0, v6++);
  while (v6 != 10);
  analytics_iterate_persisted_eventsWithBlock((uint64_t)&__block_literal_global_70);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 0x40000000;
  v11[2] = __analytics_persistance_test_block_invoke_4;
  v11[3] = &unk_1E61CAE28;
  v11[4] = &v14;
  analytics_submit_persisted_eventsWithBlock((uint64_t)v11);
  if (*((_DWORD *)v15 + 6) == 35) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 0xFFFFFFFFLL;
  }
LABEL_13:
  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __analytics_persistance_test_block_invoke(uint64_t a1)
{
  return 0;
}

uint64_t __analytics_persistance_test_block_invoke_2(uint64_t a1)
{
  return 0;
}

uint64_t __analytics_persistance_test_block_invoke_3()
{
  return 0;
}

uint64_t __analytics_persistance_test_block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += a5;
  return 0;
}

uint64_t MKBUserSessionLoadWithPasscode(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (!v6)
  {
    CFStringRef v15 = @"Failed to dlopen UserManagement.framework";
LABEL_8:
    debuglog("MKBUserSessionLoadWithPasscode", v15, v7, v8, v9, v10, v11, v12, v16);
    return 0;
  }
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))dlsym(v6, "UMUserSessionLoadWithPasscode");
  if (!v13)
  {
    CFStringRef v15 = @"Failed to find UMUserSessionLoadWithPasscode in UM";
    goto LABEL_8;
  }

  return v13(a1, a2, a3);
}

uint64_t MKBUserSessionSetSecureBackupBlob(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (!v6)
  {
    CFStringRef v15 = @"Failed to dlopen UserManagement.framework";
LABEL_8:
    debuglog("MKBUserSessionSetSecureBackupBlob", v15, v7, v8, v9, v10, v11, v12, v16);
    return 0;
  }
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))dlsym(v6, "UMUserSessionSetSecureBackupBlob");
  if (!v13)
  {
    CFStringRef v15 = @"Failed to find UMUserSessionSetSecureBackupBlob in UM";
    goto LABEL_8;
  }

  return v13(a1, a2, a3);
}

uint64_t MKBUserSessionRetrieveSecureBackupBlob(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (!v6)
  {
    CFStringRef v15 = @"Failed to dlopen UserManagement.framework";
LABEL_8:
    debuglog("MKBUserSessionRetrieveSecureBackupBlob", v15, v7, v8, v9, v10, v11, v12, v16);
    return 0;
  }
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))dlsym(v6, "UMUserSessionRetrieveSecureBackupBlob");
  if (!v13)
  {
    CFStringRef v15 = @"Failed to find UMUserSessionRetrieveSecureBackupBlob in UM";
    goto LABEL_8;
  }

  return v13(a1, a2, a3);
}

uint64_t MKBUserSessionDeleteSecureBackupBlob(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (!v4)
  {
    CFStringRef v13 = @"Failed to dlopen UserManagement.framework";
LABEL_8:
    debuglog("MKBUserSessionDeleteSecureBackupBlob", v13, v5, v6, v7, v8, v9, v10, v14);
    return 0;
  }
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))dlsym(v4, "UMUserSessionDeleteSecureBackupBlob");
  if (!v11)
  {
    CFStringRef v13 = @"Failed to find UMUserSessionDeleteSecureBackupBlob in UM";
    goto LABEL_8;
  }

  return v11(a1, a2);
}

BOOL MKBUserSessionIsLoginWindow(uint64_t a1, CFErrorRef *a2)
{
  return MKBForegroundUserSessionID(a2) == 502;
}

uint64_t MKBForegroundUserSessionID(CFErrorRef *a1)
{
  uint32_t v20 = 0;
  int hostmultiuserconfig = get_hostmultiuserconfig(&v20);
  if (hostmultiuserconfig)
  {
    int v9 = hostmultiuserconfig;
    debuglog("MKBForegroundUserSessionID", @"Failed to get multiuser_config flags from kernel with error:%d", v3, v4, v5, v6, v7, v8, hostmultiuserconfig);
    if (v9 == 2) {
      CFStringRef v16 = @"FAILED to MKBUserTypeDeviceMode, EPERM";
    }
    else {
      CFStringRef v16 = @"FAILED to MKBUserTypeDeviceMode, EINVAL";
    }
    if (v9 == 2) {
      CFIndex v17 = 1;
    }
    else {
      CFIndex v17 = 22;
    }
    debuglog("MKBForegroundUserSessionID", v16, v10, v11, v12, v13, v14, v15, v19);
    if (!a1) {
      return 0xFFFFFFFFLL;
    }
LABEL_9:
    *a1 = CFErrorCreate(0, (CFErrorDomain)*MEMORY[0x1E4F1D160], v17, 0);
    return 0xFFFFFFFFLL;
  }
  if ((v20 & 0x80000000) == 0)
  {
    CFIndex v17 = 2;
    if (!a1) {
      return 0xFFFFFFFFLL;
    }
    goto LABEL_9;
  }
  return v20 & 0x3FFFFFFF;
}

uint64_t MKBUserSessionIsLoginSession(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (!v4)
  {
    CFStringRef v13 = @"Failed to dlopen UserManagement.framework";
LABEL_8:
    debuglog("MKBUserSessionIsLoginSession", v13, v5, v6, v7, v8, v9, v10, v14);
    return 0;
  }
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))dlsym(v4, "UMUserSessionIsLoginSession");
  if (!v11)
  {
    CFStringRef v13 = @"Failed to find UMUserSessionIsLoginSession in UM";
    goto LABEL_8;
  }

  return v11(a1, a2);
}

uint64_t MKBUserSessionConfigureLoginWindow(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (!v4)
  {
    CFStringRef v13 = @"Failed to dlopen UserManagement.framework";
LABEL_8:
    debuglog("MKBUserSessionConfigureLoginWindow", v13, v5, v6, v7, v8, v9, v10, v14);
    return 0;
  }
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))dlsym(v4, "UMUserSessionConfigureLoginWindow");
  if (!v11)
  {
    CFStringRef v13 = @"Failed to find UMUserSessionConfigureLoginWindow in UM";
    goto LABEL_8;
  }

  return v11(a1, a2);
}

uint64_t MKBUserSessionSwitchToLoginWindow(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (!v4)
  {
    CFStringRef v13 = @"Failed to dlopen UserManagement.framework";
LABEL_8:
    debuglog("MKBUserSessionSwitchToLoginWindow", v13, v5, v6, v7, v8, v9, v10, v14);
    return 0;
  }
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))dlsym(v4, "UMUserSessionSwitchToLoginWindow");
  if (!v11)
  {
    CFStringRef v13 = @"Failed to find UMUserSessionSwitchToLoginWindow in UM";
    goto LABEL_8;
  }

  return v11(a1, a2);
}

uint64_t MKBForegroundUserSession(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (!v4)
  {
    CFStringRef v13 = @"Failed to dlopen UserManagement.framework";
LABEL_8:
    debuglog("MKBForegroundUserSession", v13, v5, v6, v7, v8, v9, v10, v14);
    return 0;
  }
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))dlsym(v4, "UMUserSessionForegroundSession");
  if (!v11)
  {
    CFStringRef v13 = @"Failed to find UMUserSessionForegroundSession in UM";
    goto LABEL_8;
  }

  return v11(a1, a2);
}

uint64_t MKBUserSessionListSyncMachServices(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (!v4)
  {
    CFStringRef v13 = @"Failed to dlopen UserManagement.framework";
LABEL_8:
    debuglog("MKBUserSessionListSyncMachServices", v13, v5, v6, v7, v8, v9, v10, v14);
    return 0;
  }
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))dlsym(v4, "UMUserSessionListSyncMachServices");
  if (!v11)
  {
    CFStringRef v13 = @"Failed to find UMUserSessionListSyncMachServices in UM";
    goto LABEL_8;
  }

  return v11(a1, a2);
}

uint64_t MKBCurrentSyncBubbleSessionID(uint64_t a1)
{
  uint64_t v2 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (!v2)
  {
    CFStringRef v11 = @"Failed to dlopen UserManagement.framework";
LABEL_8:
    debuglog("MKBCurrentSyncBubbleSessionID", v11, v3, v4, v5, v6, v7, v8, v12);
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = (uint64_t (*)(uint64_t))dlsym(v2, "UMCurrentSyncBubbleSessionID");
  if (!v9)
  {
    CFStringRef v11 = @"Failed to find UMCurrentSyncBubbleSessionID in UM";
    goto LABEL_8;
  }

  return v9(a1);
}

__CFDictionary *MKBUserSessionGetUserLockStateInfo(CFDictionaryRef theDict)
{
  CFDictionaryRef Int = theDict;
  v11[8] = *MEMORY[0x1E4F143B8];
  if (theDict)
  {
    if (CFDictionaryContainsKey(theDict, kMKBUserSessionIDKey)) {
      CFDictionaryRef Int = (const __CFDictionary *)_getInt(Int, kMKBUserSessionIDKey);
    }
    else {
      CFDictionaryRef Int = 0;
    }
  }
  uint64_t v2 = +[MKBKeyStoreDevice sharedService];
  uint64_t v3 = [v2 getLockStateForUser:Int];

  if (!v3) {
    return 0;
  }
  CFTypeID v4 = CFGetTypeID(v3);
  if (v4 == CFDictionaryGetTypeID())
  {
    dict = create_dict();
    if (dict)
    {
      uint64_t v6 = 0;
      v11[0] = @"IsWipePending";
      v11[1] = @"sw";
      v11[2] = @"IsPermanentlyBlocked";
      v11[3] = @"pb";
      v11[4] = @"FailedPasscodeAttempts";
      void v11[5] = @"fa";
      void v11[6] = @"TimeUntilUnblockedSinceReferenceDate";
      v11[7] = @"boff";
      do
      {
        uint64_t v7 = (const void *)v11[v6];
        if (CFDictionaryContainsKey((CFDictionaryRef)v3, v7))
        {
          uint64_t v8 = (const void *)v11[v6 + 1];
          CFArrayRef Value = CFDictionaryGetValue((CFDictionaryRef)v3, v7);
          CFDictionarySetValue(dict, v8, Value);
        }
        v6 += 2;
      }
      while (v6 != 8);
    }
  }
  else
  {
    dict = 0;
  }
  CFRelease(v3);
  return dict;
}

uint64_t MKBUserSessionLoadKeybagForUser(const __CFDictionary *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  if (!a6)
  {
    char v19 = +[MKBKeyStoreDevice sharedService];
    uint64_t v20 = [v19 loadKeybagForUserSession:a1 withSessionID:a2 withSecret:a3 shouldSetGracePeriod:a4 withGracePeriod:a5 isInEarlyStar:0];

    return v20;
  }
  uint64_t system = aks_get_system();
  if (system != -536870160)
  {
    uint64_t v15 = system;
    if (system) {
      return convertAKSErrorToMKB(system);
    }
    return v15;
  }
  debuglog("MKBUserSessionLoadKeybagForUser", @"From EARLYSTART skip check switch between users", v9, v10, v11, v12, v13, v14, v60);
  CFDictionaryRef v22 = KBLoadUserKeybag(a2);
  if (v22)
  {
    CFDictionaryRef v29 = v22;
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v22, @"KeyBagKeys");
    if (Value)
    {
      CFDataRef v37 = Value;
      CFDataGetBytePtr(Value);
      CFDataGetLength(v37);
      uint64_t bag = aks_load_bag();
      if (bag)
      {
        uint64_t v45 = bag;
        debuglog("MKBUserSessionLoadKeybagForUser", @"failed to load bag for user %d: 0x%x", v39, v40, v41, v42, v43, v44, a2);
      }
      else
      {
        uint64_t v46 = aks_set_system();
        if (v46)
        {
          uint64_t v45 = v46;
          debuglog("MKBUserSessionLoadKeybagForUser", @"failed to set bag handle %d as session bag for UID %d: 0x%x", v47, v48, v49, v50, v51, v52, -1);
        }
        else
        {
          uint64_t v53 = aks_get_system();
          if (!v53)
          {
            if (a2 != 502)
            {
              debuglog("MKBUserSessionLoadKeybagForUser", @"seting APFSVolumeID For KeyBag ", v54, v55, v56, v57, v58, v59, v61);
              setAPFSVolumeIDForKeyBag(0xFFFFFFFFLL, a2, a1);
            }
            uint64_t v15 = 0;
            goto LABEL_17;
          }
          uint64_t v45 = v53;
          debuglog("MKBUserSessionLoadKeybagForUser", @"loaded bag handle %ld as session bag for %d, but got no session handle back: 0x%x", v54, v55, v56, v57, v58, v59, -1);
        }
      }
      uint64_t v15 = convertAKSErrorToMKB(v45);
    }
    else
    {
      debuglog("MKBUserSessionLoadKeybagForUser", @"no keybag in user bag plist", v31, v32, v33, v34, v35, v36, v61);
      uint64_t v15 = 4294966296;
    }
LABEL_17:
    CFRelease(v29);
    return v15;
  }
  debuglog("MKBUserSessionLoadKeybagForUser", @"no user bag found for UID %d", v23, v24, v25, v26, v27, v28, a2);
  return 4294967288;
}

void setAPFSVolumeIDForKeyBag(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  bzero(v23, 0x3FBuLL);
  qmemcpy(v22, "/dev/", sizeof(v22));
  memset(v24, 0, sizeof(v24));
  _getCString(a3, kMKBUserSessionVolumeDeviceNodeKey, (char *)v24, 256);
  if (LODWORD(v24[0]) == 1802725732) {
    __strlcat_chk();
  }
  if (a3)
  {
    if (CFDictionaryContainsKey(a3, kMKBUserSessionVolumeUUIDKey))
    {
      String = _getString(a3, kMKBUserSessionVolumeUUIDKey);
      if (String)
      {
        memset(uu, 0, sizeof(uu));
        debuglog("setAPFSVolumeIDForKeyBag", @"Updating VolumeUUID %@", v7, v8, v9, v10, v11, v12, (char)String);
        bzero(in, 0x400uLL);
        _getCString(a3, kMKBUserSessionVolumeUUIDKey, in, 1024);
        if (uuid_parse(in, uu))
        {
          debuglog("setAPFSVolumeIDForKeyBag", @"uuid_parse failed", v13, v14, v15, v16, v17, v18, v19);
        }
        else
        {
          debuglog("setAPFSVolumeIDForKeyBag", @"uuid_parse SUCCESS", v13, v14, v15, v16, v17, v18, v19);
          KBMapVolume(a1, a2, (uint64_t)v22, (uint64_t)uu, 0);
        }
      }
    }
  }
}

uint64_t MKBUserSessionCreateKeybagForUser(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = +[MKBKeyStoreDevice sharedService];
  uint64_t v11 = [v10 createKeybagForUserSession:a1 withSessionUID:a2 WithSecret:a3 withGracePeriod:a4 withOpaqeStuff:a5];

  return v11;
}

uint64_t MKBUserSessionUnloadKeybagForUser(uint64_t a1)
{
  uint64_t v2 = +[MKBKeyStoreDevice sharedService];
  uint64_t v3 = [v2 unloadKeybagForUserSession:a1];

  return v3;
}

uint64_t MKBUserSessionDeleteKeybagForUser(uint64_t a1)
{
  uint64_t v2 = +[MKBKeyStoreDevice sharedService];
  uint64_t v3 = [v2 deleteKeybagForUserSession:a1];

  return v3;
}

uint64_t MKBUserSessionSetVolumeToPersona(const __CFString *a1, const __CFString *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  memset(uu, 0, sizeof(uu));
  bzero(buffer, 0x400uLL);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  *(_OWORD *)in = 0u;
  long long v23 = 0u;
  if (!CFStringGetCString(a1, buffer, 1024, 0x8000100u))
  {
    CFStringRef v10 = @"Failed to get cstring from volumePath";
    goto LABEL_7;
  }
  if (!CFStringGetCString(a2, in, 256, 0x8000100u))
  {
    CFStringRef v10 = @"Failed to get cstring from uuidString";
    goto LABEL_7;
  }
  if (uuid_parse(in, uu))
  {
    CFStringRef v10 = @"Failed to parse to uuid_t";
LABEL_7:
    debuglog("MKBUserSessionSetVolumeToPersona", v10, v4, v5, v6, v7, v8, v9, v20);
    return 0xFFFFFFFFLL;
  }
  uint64_t v13 = KBMapDeviceBag(buffer, 1);
  uint64_t v11 = v13;
  if (v13) {
    debuglog("MKBUserSessionSetVolumeToPersona", @"KBMapDeviceBag failed with error %d", v14, v15, v16, v17, v18, v19, v13);
  }
  else {
    debuglog("MKBUserSessionSetVolumeToPersona", @"KBMapDeviceBag Success", v14, v15, v16, v17, v18, v19, v20);
  }
  return v11;
}

uint64_t MKBUserSessionCreateSyncBagForUser(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = +[MKBKeyStoreDevice sharedService];
  uint64_t v5 = [v4 createSyncBagForUserSession:a1 withSessionUID:a2];

  return v5;
}

uint64_t MKBUserSessionLoadSyncBagForUser(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = +[MKBKeyStoreDevice sharedService];
  uint64_t v5 = [v4 loadSyncBagForUserSession:a1 withSessionUID:a2];

  return v5;
}

uint64_t MKBUserSessionVerifySyncBagForUser(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = +[MKBKeyStoreDevice sharedService];
  uint64_t v5 = [v4 verifySyncBagForUserSession:a1 withSessionUID:a2];

  return v5;
}

uint64_t MKBUserSessionUnLoadSyncBagForUser(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = +[MKBKeyStoreDevice sharedService];
  uint64_t v5 = [v4 unloadSyncBagForUserSession:a1 withSessionUID:a2];

  return v5;
}

uint64_t MKBUserSessionRemoveSyncBagForUser(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = +[MKBKeyStoreDevice sharedService];
  uint64_t v5 = [v4 removeSyncBagForUserSession:a1 withSessionUID:a2];

  return v5;
}

uint64_t MKBUserSessionUnloadSessionBags()
{
  uint64_t result = aks_unload_session_bags();
  if (result)
  {
    debuglog("MKBUserSessionUnloadSessionBags", @"Failed to unload session keybags: 0x%x", v1, v2, v3, v4, v5, v6, result);
    return 0xFFFFFFFFLL;
  }
  return result;
}

CFDataRef MKBUserSessionWrapSession(int a1, CFDataRef theData, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)&length[19] = *MEMORY[0x1E4F143B8];
  if (!theData)
  {
    debuglog("MKBUserSessionWrapSession", @"Data to Wrap is NULL", a3, a4, a5, a6, a7, a8, v30);
    goto LABEL_6;
  }
  char v9 = CFDataGetLength(theData);
  debuglog("MKBUserSessionWrapSession", @"Data to Wrap with length:%d", v10, v11, v12, v13, v14, v15, v9);
  if (CFDataGetLength(theData) < 1)
  {
LABEL_6:
    debuglog("MKBUserSessionWrapSession", @"Invalid Blob entry for wrap", v16, v17, v18, v19, v20, v21, v31);
    return 0;
  }
  CFDataGetBytePtr(theData);
  CFDataGetLength(theData);
  int v22 = aks_wrap_key();
  if (!v22)
  {
    debuglog("MKBUserSessionWrapSession", @"key_class_f wrap Completed with size %d", v23, v24, v25, v26, v27, v28, 72);
    return CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UInt8 *)&length[1], 72);
  }
  debuglog("MKBUserSessionWrapSession", @"failed to key_class_f wrap by aks_wrap_key: 0x%x", v23, v24, v25, v26, v27, v28, v22);
  return 0;
}

CFDataRef MKBUserSessionUnWrapSession(int a1, CFDataRef theData, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)&length[44] = *MEMORY[0x1E4F143B8];
  memset(&length[4], 0, 32);
  if (theData && CFDataGetLength(theData) >= 1)
  {
    char v9 = CFDataGetLength(theData);
    debuglog("MKBUserSessionUnWrapSession", @"sessionblob length:%ld", v10, v11, v12, v13, v14, v15, v9);
    CFDataGetBytePtr(theData);
    CFDataGetLength(theData);
    if (!aks_unwrap_key())
    {
      debuglog("MKBUserSessionUnWrapSession", @"deCryptnextsession: session decrypt length:%d(expected: 32)", a3, a4, a5, a6, a7, a8, 32);
      return CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &length[4], 32);
    }
    CFStringRef v16 = @"Failed to unwrap dict blob with classF";
  }
  else
  {
    CFStringRef v16 = @"Invalid Blob entry for unwrap";
  }
  debuglog("MKBUserSessionUnWrapSession", v16, a3, a4, a5, a6, a7, a8, v18);
  return 0;
}

uint64_t MKBUserSessionCreatePersonaKeyForUser(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v9 = +[MKBKeyStoreDevice sharedService];
  uint64_t v10 = [v9 addPersonaKeyForUserSession:a2 withSecret:a3 withPersonaUUIDString:a4 forPath:a5];

  return v10;
}

uint64_t MKBUserSessionRemovePersonaKeyForUser(CFDictionaryRef theDict, uint64_t a2, uint64_t a3)
{
  CFDictionaryRef String = theDict;
  if (!theDict
    || CFDictionaryContainsKey(theDict, kMKBUserSessionVolumeUUIDKey)
    && (CFDictionaryRef String = (const __CFDictionary *)_getString(String, kMKBUserSessionVolumeUUIDKey)) != 0)
  {
    uint64_t v12 = +[MKBKeyStoreDevice sharedService];
    uint64_t v13 = [v12 removePersonaKeyForUserSession:a2 withPersonaUUIDString:a3 withVolumeUUIDString:String];

    return v13;
  }
  else
  {
    debuglog("MKBUserSessionRemovePersonaKeyForUser", @"Cannot find proper VolumeUUID String to remove personakey with volume unmap", v6, v7, v8, v9, v10, v11, v15);
    return 22;
  }
}

const void *_getData(const __CFDictionary *a1, const void *a2)
{
  uint64_t result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    uint64_t v3 = result;
    CFTypeID v4 = CFGetTypeID(result);
    if (v4 == CFDataGetTypeID()) {
      return v3;
    }
    else {
      return 0;
    }
  }
  return result;
}

const void *_getArray(const __CFDictionary *a1, const void *a2)
{
  uint64_t result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    uint64_t v3 = result;
    CFTypeID v4 = CFGetTypeID(result);
    if (v4 == CFArrayGetTypeID()) {
      return v3;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t _getInt(const __CFDictionary *a1, const void *a2)
{
  uint64_t v2 = 0xFFFFFFFFLL;
  unsigned int valuePtr = -1;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    CFNumberRef v4 = Value;
    CFTypeID v5 = CFGetTypeID(Value);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
      return valuePtr;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return v2;
}

uint64_t _getLongLongInt(const __CFDictionary *a1, const void *a2)
{
  uint64_t v2 = -1;
  uint64_t valuePtr = -1;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    CFNumberRef v4 = Value;
    CFTypeID v5 = CFGetTypeID(Value);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberLongLongType, &valuePtr);
      return valuePtr;
    }
    else
    {
      return -1;
    }
  }
  return v2;
}

uint64_t _getSInt64(const __CFDictionary *a1, const void *a2)
{
  uint64_t v2 = -1;
  uint64_t valuePtr = -1;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    CFNumberRef v4 = Value;
    CFTypeID v5 = CFGetTypeID(Value);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberSInt64Type, &valuePtr);
      return valuePtr;
    }
    else
    {
      return -1;
    }
  }
  return v2;
}

CFBooleanRef _getBool(const __CFDictionary *a1, const void *a2)
{
  CFBooleanRef result = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    CFBooleanRef v3 = result;
    CFTypeID v4 = CFGetTypeID(result);
    if (v4 == CFBooleanGetTypeID()) {
      return (const __CFBoolean *)(CFBooleanGetValue(v3) != 0);
    }
    else {
      return 0;
    }
  }
  return result;
}

const void *_getString(const __CFDictionary *a1, const void *a2)
{
  CFNumberRef Value = CFDictionaryGetValue(a1, a2);
  if (!Value) {
    return 0;
  }
  CFBooleanRef v3 = Value;
  CFTypeID v4 = CFGetTypeID(Value);
  if (v4 != CFStringGetTypeID()) {
    return 0;
  }
  return v3;
}

BOOL _getCString(const __CFDictionary *a1, const void *a2, char *a3, int a4)
{
  CFStringRef String = (const __CFString *)_getString(a1, a2);
  return String && CFStringGetCString(String, a3, a4, 0x8000100u);
}

CFTypeRef _getRetainedDict(const __CFDictionary *a1, const void *a2)
{
  CFNumberRef Value = CFDictionaryGetValue(a1, a2);
  if (!Value) {
    return 0;
  }
  CFBooleanRef v3 = Value;
  CFTypeID v4 = CFGetTypeID(Value);
  if (v4 != CFDictionaryGetTypeID()) {
    return 0;
  }

  return CFRetain(v3);
}

CFTypeRef convertObjectToBinary(const void *a1)
{
  uint64_t v2 = CFWriteStreamCreateWithAllocatedBuffers((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (!v2) {
    return 0;
  }
  CFBooleanRef v3 = v2;
  if (CFWriteStreamOpen(v2))
  {
    if (CFPropertyListWrite(a1, v3, kCFPropertyListBinaryFormat_v1_0, 0, 0) < 1) {
      CFTypeRef v4 = 0;
    }
    else {
      CFTypeRef v4 = CFWriteStreamCopyProperty(v3, (CFStreamPropertyKey)*MEMORY[0x1E4F1D440]);
    }
    CFWriteStreamClose(v3);
  }
  else
  {
    CFTypeRef v4 = 0;
  }
  CFRelease(v3);
  return v4;
}

CFPropertyListRef convertBinaryToObject(UInt8 *bytes, CFIndex length)
{
  CFPropertyListFormat format = kCFPropertyListBinaryFormat_v1_0;
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFBooleanRef v3 = CFReadStreamCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], bytes, length, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  if (v3)
  {
    uint64_t v10 = v3;
    if (CFReadStreamOpen(v3))
    {
      CFPropertyListRef v23 = CFPropertyListCreateWithStream(v2, v10, 0, 2uLL, &format, 0);
      if (!v23) {
        debuglog("convertBinaryToObject", @"Could not create object from stream", v17, v18, v19, v20, v21, v22, v25);
      }
      CFReadStreamClose(v10);
    }
    else
    {
      debuglog("convertBinaryToObject", @"Could not open the stream", v11, v12, v13, v14, v15, v16, v25);
      CFPropertyListRef v23 = 0;
    }
    CFRelease(v10);
  }
  else
  {
    debuglog("convertBinaryToObject", @"Could not create stream for serialized data", v4, v5, v6, v7, v8, v9, v25);
    return 0;
  }
  return v23;
}

size_t writen(int __fd, char *__buf, size_t __nbyte)
{
  size_t v3 = __nbyte;
  if (__nbyte)
  {
    size_t v6 = __nbyte;
    do
    {
      ssize_t v7 = write(__fd, __buf, v6);
      if (v7 == -1)
      {
        if (*__error() != 4) {
          return -1;
        }
        ssize_t v7 = 0;
      }
      __buf += v7;
      v6 -= v7;
    }
    while (v6);
  }
  return v3;
}

uint64_t store_binary_dict_fd(const void *a1, const char *a2, int *a3)
{
  CFDataRef v5 = (const __CFData *)convertObjectToBinary(a1);
  if (!v5)
  {
    debuglog("store_binary_dict_fd", @"Can't serialize dictionary", v6, v7, v8, v9, v10, v11, v34);
    return 0xFFFFFFFFLL;
  }
  CFDataRef v12 = v5;
  int v13 = open_dprotected_np(a2, 1537, 4, 0, 420);
  if (v13 == -1)
  {
    uint64_t v18 = __error();
    strerror(*v18);
    debuglog("store_binary_dict_fd", @"Could not create %s: %s", v19, v20, v21, v22, v23, v24, (char)a2);
    uint64_t v17 = 0xFFFFFFFFLL;
    goto LABEL_7;
  }
  int v14 = v13;
  BytePtr = (char *)CFDataGetBytePtr(v12);
  size_t Length = CFDataGetLength(v12);
  if (writen(v14, BytePtr, Length) == -1)
  {
    CFStringRef v25 = @"Could not write to %s: %s";
LABEL_12:
    uint64_t v26 = __error();
    strerror(*v26);
    debuglog("store_binary_dict_fd", v25, v27, v28, v29, v30, v31, v32, (char)a2);
    uint64_t v17 = 0xFFFFFFFFLL;
    goto LABEL_13;
  }
  if (fcntl(v14, 51))
  {
    CFStringRef v25 = @"Unable to fsync %s: %s";
    goto LABEL_12;
  }
  uint64_t v17 = 0;
  if (!a3)
  {
LABEL_13:
    CFRelease(v12);
    close(v14);
    return v17;
  }
  *a3 = v14;
LABEL_7:
  CFRelease(v12);
  return v17;
}

uint64_t store_binary_dict(const void *a1, const char *a2)
{
  return store_binary_dict_fd(a1, a2, 0);
}

const void *load_binary_dict_from_buffer(UInt8 *bytes, CFIndex length)
{
  CFAllocatorRef v2 = 0;
  CFPropertyListFormat format = kCFPropertyListBinaryFormat_v1_0;
  if (bytes && length)
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFDataRef v5 = CFReadStreamCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], bytes, length, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
    if (!v5)
    {
      debuglog("load_binary_dict_from_buffer", @"Could not create stream from serialized data", v6, v7, v8, v9, v10, v11, v28);
      return 0;
    }
    CFDataRef v12 = v5;
    if (CFReadStreamOpen(v5))
    {
      CFPropertyListRef v19 = CFPropertyListCreateWithStream(v4, v12, length, 2uLL, &format, 0);
      CFAllocatorRef v2 = v19;
      if (!v19)
      {
        debuglog("load_binary_dict_from_buffer", @"Could not create dictionary from stream", v20, v21, v22, v23, v24, v25, v28);
        goto LABEL_9;
      }
      CFTypeID v26 = CFGetTypeID(v19);
      if (v26 == CFDictionaryGetTypeID())
      {
LABEL_9:
        CFReadStreamClose(v12);
        CFRelease(v12);
        return v2;
      }
      CFRelease(v2);
    }
    else
    {
      debuglog("load_binary_dict_from_buffer", @"Could not open the stream", v13, v14, v15, v16, v17, v18, v28);
    }
    CFAllocatorRef v2 = 0;
    goto LABEL_9;
  }
  return v2;
}

const void *load_binary_dict(const char *a1)
{
  char v1 = (char)a1;
  memset(&v31, 0, sizeof(v31));
  int v2 = open(a1, 0);
  if (v2 == -1)
  {
    uint64_t v14 = __error();
    strerror(*v14);
    debuglog("load_binary_dict", @"Could not open %s: %s", v15, v16, v17, v18, v19, v20, v1);
    uint64_t v10 = 0;
    CFDictionaryRef binary_dict_from_buffer = 0;
    goto LABEL_7;
  }
  int v3 = v2;
  if (fstat(v2, &v31))
  {
    uint64_t v21 = __error();
    strerror(*v21);
    debuglog("load_binary_dict", @"Could not fstat %s: %s", v22, v23, v24, v25, v26, v27, v1);
    CFDictionaryRef binary_dict_from_buffer = 0;
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  uint64_t v10 = malloc_type_malloc(LODWORD(v31.st_size), 0x9026304CuLL);
  if (!v10)
  {
    CFStringRef v28 = @"Could not allocate buffer";
LABEL_12:
    debuglog("load_binary_dict", v28, v4, v5, v6, v7, v8, v9, v30);
    CFDictionaryRef binary_dict_from_buffer = 0;
    goto LABEL_6;
  }
  ssize_t v11 = read(v3, v10, v31.st_size);
  if (v11 != v31.st_size)
  {
    uint64_t v29 = __error();
    char v30 = v1;
    strerror(*v29);
    CFStringRef v28 = @"Could not read %s: %s";
    goto LABEL_12;
  }
  CFDictionaryRef binary_dict_from_buffer = load_binary_dict_from_buffer((UInt8 *)v10, v11);
LABEL_6:
  close(v3);
LABEL_7:
  free(v10);
  return binary_dict_from_buffer;
}

CFMutableDictionaryRef create_mutable_dict(CFDictionaryRef theDict)
{
  CFMutableDictionaryRef result = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, theDict);
  if (!result)
  {
    debuglog("create_mutable_dict", @"Out of Memory!!! Dying!...so...cold....", v2, v3, v4, v5, v6, v7, vars0);
    exit(-1);
  }
  return result;
}

CFMutableArrayRef create_array()
{
  CFMutableArrayRef result = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  if (!result)
  {
    debuglog("create_array", @"Out of Memory!!! Dying!...so...cold....", v1, v2, v3, v4, v5, v6, vars0);
    exit(-1);
  }
  return result;
}

CFStringRef create_string(char *cStr)
{
  CFStringRef result = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], cStr, 0x8000100u);
  if (!result)
  {
    debuglog("create_string", @"Out of Memory!!! Dying!...so...cold....", v2, v3, v4, v5, v6, v7, vars0);
    exit(-1);
  }
  return result;
}

uint64_t set_hostmultiuserconfig(uint32_t a1)
{
  host_priv_t v2 = MEMORY[0x1BA9CE2B0]();

  return host_set_multiuser_config_flags(v2, a1);
}

uint64_t GetConfiguredForegroundUserID()
{
  int v3 = 0;
  int hostmultiuserconfig = get_hostmultiuserconfig((uint32_t *)&v3);
  if (v3 >= 0) {
    uint32_t v1 = -1;
  }
  else {
    uint32_t v1 = v3 & 0x3FFFFFFF;
  }
  if (hostmultiuserconfig) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v1;
  }
}

BOOL IsConfiguredMultiUser()
{
  int v2 = 0;
  return !get_hostmultiuserconfig((uint32_t *)&v2) && v2 < 0;
}

uint64_t get_port_type(mach_port_name_t name)
{
  mach_port_type_t ptype = 0;
  if (mach_port_type(*MEMORY[0x1E4F14960], name, &ptype)) {
    return 0;
  }
  else {
    return ptype;
  }
}

void log_port_type(mach_port_name_t name)
{
  kern_return_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  mach_port_type_t v9;
  BOOL v10;
  CFStringRef v11;
  mach_port_type_t ptype;

  char v1 = name;
  mach_port_type_t ptype = 0;
  int v2 = mach_port_type(*MEMORY[0x1E4F14960], name, &ptype);
  uint64_t v9 = ptype;
  if (v2) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = ptype == 0;
  }
  if (v10)
  {
    ssize_t v11 = @"Port:%d has NORIGHTS";
LABEL_16:
    debuglog("log_port_type", v11, v3, v4, v5, v6, v7, v8, v1);
    return;
  }
  if ((ptype & 0x10000) != 0)
  {
    debuglog("log_port_type", @"Port:%d has SENDRIGHT", v3, v4, v5, v6, v7, v8, v1);
    if ((v9 & 0x20000) == 0)
    {
LABEL_9:
      if ((v9 & 0x40000) == 0) {
        goto LABEL_10;
      }
LABEL_14:
      debuglog("log_port_type", @"Port:%d has SENDONCERIGHT", v3, v4, v5, v6, v7, v8, v1);
      if ((v9 & 0x100000) == 0) {
        return;
      }
      goto LABEL_15;
    }
  }
  else if ((ptype & 0x20000) == 0)
  {
    goto LABEL_9;
  }
  debuglog("log_port_type", @"Port:%d has RECEIVERIGHT", v3, v4, v5, v6, v7, v8, v1);
  if ((v9 & 0x40000) != 0) {
    goto LABEL_14;
  }
LABEL_10:
  if ((v9 & 0x100000) != 0)
  {
LABEL_15:
    ssize_t v11 = @"Port:%d has DEADNAME";
    goto LABEL_16;
  }
}

unsigned __int16 *_apfs_get_all_crypto_ids(int a1)
{
  v23[96] = *MEMORY[0x1E4F143B8];
  long long v19 = xmmword_1B8ECD010;
  uint64_t v20 = &v21;
  uint64_t v8 = 0;
  if (ffsctl(a1, 0x80184A07uLL, &v19, 0))
  {
LABEL_12:
    debuglog("_apfs_get_all_crypto_ids", @"APFSIOC_GET_CRYPTO_IDS fail", v2, v3, v4, v5, v6, v7, v19);
    free(v8);
    return 0;
  }
  else
  {
    while (1)
    {
      uint64_t v9 = v22;
      if (!v22) {
        break;
      }
      if (v8) {
        int v10 = v8[4];
      }
      else {
        int v10 = 0;
      }
      ssize_t v11 = (unsigned __int16 *)reallocf(v8, 24 * (v10 + v22) + 16);
      uint64_t v8 = v11;
      if (!v11)
      {
        debuglog("_apfs_get_all_crypto_ids", @"realloc failed", v12, v13, v14, v15, v16, v17, v19);
        return v8;
      }
      if ((void)v19 == -1)
      {
        memset_s(v11, 0x10uLL, 0, 0x10uLL);
        uint64_t v9 = v22;
      }
      memcpy(&v8[12 * v8[4] + 8], v23, 24 * v9);
      v8[4] += v9;
      if (v9) {
        *(void *)&long long v19 = v23[3 * (unsigned __int16)(v9 - 1) + 1] + v23[3 * (unsigned __int16)(v9 - 1)];
      }
      if (ffsctl(a1, 0x80184A07uLL, &v19, 0)) {
        goto LABEL_12;
      }
    }
  }
  return v8;
}

void *_apfs_copy_wrapped_key_from_file(int a1, uint64_t a2, CFTypeRef *a3)
{
  uint64_t v6 = malloc_type_malloc(0x400uLL, 0x56D46FCCuLL);
  v18[0] = a2;
  v18[1] = 1024;
  v18[2] = v6;
  if (ffsctl(a1, 0x80184A08uLL, v18, 0) < 0)
  {
    uint64_t v7 = __error();
    strerror(*v7);
    debuglog("_apfs_copy_wrapped_key_from_file", @"Could not get wrapped crypto key for inode %llu right now: %s", v8, v9, v10, v11, v12, v13, a2);
    if (a3)
    {
      if (*a3)
      {
        CFRelease(*a3);
        *a3 = 0;
      }
      CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFStringRef v15 = (const __CFString *)*MEMORY[0x1E4F1D160];
      uint64_t v16 = __error();
      *a3 = CFErrorCreate(v14, v15, *v16, 0);
    }
    free(v6);
    return 0;
  }
  return v6;
}

uint64_t mkb_time_start(uint64_t result)
{
  if (result)
  {
    char v1 = (void *)result;
    CFStringRef result = mach_absolute_time();
    *char v1 = result;
  }
  return result;
}

double mkb_time_stop(uint64_t a1, void *a2)
{
  uint64_t v4 = mach_absolute_time();
  if (mkb_time_stop_time_overhead_measured)
  {
    if (!a2) {
      return result;
    }
  }
  else
  {
    uint64_t v6 = mach_absolute_time();
    mkb_time_stop_time_overhead_measured = mach_absolute_time() - v6;
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    LODWORD(v8) = info.denom;
    LODWORD(v7) = info.numer;
    double result = (double)v7 / (double)v8;
    mkb_time_stop_timebase_factor = *(void *)&result;
    if (!a2) {
      return result;
    }
  }
  double result = *(double *)&mkb_time_stop_timebase_factor * (double)(v4 - a1 - mkb_time_stop_time_overhead_measured) / 1000.0;
  *a2 = (unint64_t)result;
  return result;
}

void sub_1B8EB6CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EB6F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EB7170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EB7338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1B8EB7600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B8EB792C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EB7ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EB7D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EB7F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EB8134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EB8404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B8EB8638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EB8834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EB8A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EB8BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EB8DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EB900C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EB9208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EB945C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EB9650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EB9834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EB9A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B8EB9C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B8EB9E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EBA074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EBA360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EBA624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EBA898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B8EBAA60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EBAD20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EBAF98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EBB140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EBB2E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EBB4BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EBB67C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EBB83C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EBB9FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EBBBBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EBBD7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EBBFBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8EBC198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SeshatHWAvailable(uint64_t a1)
{
  int v24 = 0;
  uint64_t v23 = 0;
  if ((SeshatHWAvailable_cached_answer & 1) == 0)
  {
    unint64_t v21 = 0;
    uint64_t v22 = 0;
    mkb_time_start((uint64_t)&v22);
    uint64_t v2 = objc_alloc_init(NFHWMonitor);
    objc_msgSend((id)objc_msgSend((id)getNFHardwareManagerClass(), "sharedHardwareManager"), "registerEventListener:", v2);
    int v3 = objc_msgSend((id)objc_msgSend((id)getNFHardwareManagerClass(), "sharedHardwareManager"), "getHwSupport");
    if ((v3 & 0xFFFFFFFD) == 1)
    {
      LOBYTE(v23) = [(NFHWMonitor *)v2 waitForNotificationOrTimeout:a1] != 0;
      int v4 = objc_msgSend((id)objc_msgSend((id)getNFHardwareManagerClass(), "sharedHardwareManager"), "getHwSupport");
    }
    else
    {
      int v4 = v3;
    }
    objc_msgSend((id)objc_msgSend((id)getNFHardwareManagerClass(), "sharedHardwareManager"), "unregisterEventListener:", v2);

    uint64_t v11 = &SeshatHWAvailable_answer;
    if (v4 != 2 && v4 != 5)
    {
      debuglog("SeshatHWAvailable", @"getHwSupport=%d, prev=%d. timedout=%d, intepreting as unsupported.", v5, v6, v7, v8, v9, v10, v4);
      SeshatHWAvailable_answer = 0;
      uint64_t v11 = &SeshatHWAvailable_cached_answer;
    }
    char *v11 = 1;
    mkb_time_stop(v22, &v21);
    HIDWORD(v23) = v21 / 0xF4240;
    int v24 = v4;
    analytics_send_nfc_hardware_state((uint64_t)&v23, v12, v13, v14, v15, v16, v17, v18, v20);
  }
  return SeshatHWAvailable_answer;
}

uint64_t getNFHardwareManagerClass()
{
  uint64_t v3 = 0;
  int v4 = &v3;
  uint64_t v5 = 0x3052000000;
  uint64_t v6 = __Block_byref_object_copy__0;
  uint64_t v7 = __Block_byref_object_dispose__0;
  uint64_t v0 = getNFHardwareManagerClass_softClass;
  uint64_t v8 = getNFHardwareManagerClass_softClass;
  if (!getNFHardwareManagerClass_softClass)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __getNFHardwareManagerClass_block_invoke;
    v2[3] = &unk_1E61CB0E8;
    _OWORD v2[4] = &v3;
    __getNFHardwareManagerClass_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B8EBC5B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SeshatAvailable()
{
  uint64_t result = SeshatFwkAvailable();
  if (result)
  {
    return SeshatHWAvailable(20);
  }
  return result;
}

uint64_t SeshatFwkAvailable()
{
  if (SeshatFwkAvailable_seshat_available) {
    return 1;
  }
  uint64_t result = NearFieldLibraryCore();
  if (result) {
    uint64_t result = getNFHardwareManagerClass() != 0;
  }
  SeshatFwkAvailable_seshat_available = result;
  return result;
}

void SeshatTTR(time_t a1)
{
  time_t v18 = a1;
  char v1 = (void *)MEMORY[0x1BA9CE380]();
  if (SeshatFwkAvailable())
  {
    debuglog("SeshatTTR", @"requesting NF TTR", v2, v3, v4, v5, v6, v7, v16);
    uint64_t v20 = 0;
    unint64_t v21 = &v20;
    uint64_t v22 = 0x3052000000;
    uint64_t v23 = __Block_byref_object_copy__0;
    int v24 = __Block_byref_object_dispose__0;
    uint64_t v8 = (void *)getNFTapToRadarClass_softClass;
    uint64_t v25 = getNFTapToRadarClass_softClass;
    if (!getNFTapToRadarClass_softClass)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __getNFTapToRadarClass_block_invoke;
      v19[3] = &unk_1E61CB0E8;
      v19[4] = &v20;
      __getNFTapToRadarClass_block_invoke((uint64_t)v19);
      uint64_t v8 = (void *)v21[5];
    }
    _Block_object_dispose(&v20, 8);
    uint64_t v9 = NSString;
    char v17 = ctime(&v18);
    [v8 requestTapToRadar:objc_msgSend(v9, "stringWithFormat:", @"SesHat session failure on %s", @"com.apple.keybagd.ttr" preferences];
    debuglog("SeshatTTR", @"requested NF TTR", v10, v11, v12, v13, v14, v15, v17);
  }
}

void sub_1B8EBC7A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SeshatCreateSessionWithTimeoutVerbose(int a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  SeshatPowerAssertion(1, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v27);
  unsigned int v17 = 0;
  uint64_t v18 = 1000000 * a1;
  do
  {
    if (v17)
    {
      timespec __rqtp = (timespec)xmmword_1B8ECD040;
      nanosleep(&__rqtp, 0);
    }
    debuglog("SeshatCreateSessionWithTimeoutVerbose", @"asking for session with timeout of %lld nsec (attempt: %d)", v11, v12, v13, v14, v15, v16, v18);
    if (a3)
    {
      *(void *)a3 = 0;
      *(_DWORD *)(a3 + 8) = 0;
    }
    if (a2) {
      *a2 = 0;
    }
    uint64_t v45 = 0;
    uint64_t v46 = &v45;
    uint64_t v47 = 0x3052000000;
    uint64_t v48 = __Block_byref_object_copy__0;
    uint64_t v49 = __Block_byref_object_dispose__0;
    uint64_t v50 = 0;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x2020000000;
    char v44 = 0;
    uint64_t v37 = 0;
    CFNumberRef v38 = &v37;
    uint64_t v39 = 0x3052000000;
    uint64_t v40 = __Block_byref_object_copy__0;
    uint64_t v41 = __Block_byref_object_dispose__0;
    uint64_t v42 = 0;
    if (SeshatFwkAvailable() && (SeshatHWAvailable(20) & 1) != 0 && (seshat_debug_mask & 0x100) == 0)
    {
      if (a2) {
        *a2 = 0;
      }
      if (_SeshatCreateSessionWithTimeout_onceToken != -1) {
        dispatch_once(&_SeshatCreateSessionWithTimeout_onceToken, &__block_literal_global_3);
      }
      long long v19 = dispatch_semaphore_create(0);
      dispatch_retain(v19);
      uint64_t v20 = (void *)[(id)getNFHardwareManagerClass() sharedHardwareManager];
      __rqtp.tv_sec = MEMORY[0x1E4F143A8];
      __rqtp.tv_nsec = 3221225472;
      stat v31 = ___SeshatCreateSessionWithTimeout_block_invoke_2;
      uint64_t v32 = &unk_1E61CB150;
      long long v33 = v19;
      char v34 = v43;
      long long v35 = &v37;
      long long v36 = &v45;
      uint64_t v21 = [v20 startSesHatSession:&__rqtp];
      dispatch_time_t v22 = dispatch_time(0, v18);
      dispatch_semaphore_wait(v19, v22);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = ___SeshatCreateSessionWithTimeout_block_invoke_4;
      block[3] = &unk_1E61CB178;
      void block[4] = v21;
      block[5] = v43;
      block[6] = a2;
      dispatch_sync((dispatch_queue_t)_SeshatCreateSessionWithTimeout_queue, block);
      dispatch_release(v19);
    }
    uint64_t v23 = (void *)v38[5];
    if (a3 && v23)
    {
      *(_DWORD *)(a3 + 8) = [(id)getNFSeshatSessionClass() smallCrumbsFromError:v38[5]];
      *(void *)a3 = [(id)getNFSeshatSessionClass() largeCrumbsFromError:v38[5]];
      uint64_t v23 = (void *)v38[5];
    }
    if (v23) {

    }
    uint64_t v24 = v46[5];
    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(v43, 8);
    _Block_object_dispose(&v45, 8);
    if (v17 > 3) {
      break;
    }
    ++v17;
  }
  while (!v24);
  if (!v24) {
    SeshatPowerAssertion(0, v25, v11, v12, v13, v14, v15, v16, v28);
  }
  return v24;
}

void sub_1B8EBCB00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 200), 8);
  _Block_object_dispose((const void *)(v32 - 168), 8);
  _Unwind_Resume(a1);
}

void SeshatPowerAssertion(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (SeshatPowerAssertion_taken == a1)
  {
    debuglog("SeshatPowerAssertion", @"not doing anything %d:%d", a3, a4, a5, a6, a7, a8, a1);
  }
  else if (a1)
  {
    if (IOPMAssertionDeclareSystemActivity()) {
      debuglog("SeshatPowerAssertion", @"Unable to take power assertion.", v9, v10, v11, v12, v13, v14, v21);
    }
    else {
      SeshatPowerAssertion_taken = 1;
    }
  }
  else if (IOPMAssertionRelease(SeshatPowerAssertion__powerAssertionId))
  {
    debuglog("SeshatPowerAssertion", @"Unable to remove power assertion.", v15, v16, v17, v18, v19, v20, a9);
  }
  else
  {
    SeshatPowerAssertion_taken = 0;
  }
}

uint64_t SeshatCreateSessionWithTimeout(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return SeshatCreateSessionWithTimeoutVerbose(a1, 0, 0, a4, a5, a6, a7, a8);
}

void SeshatEndSession(id *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (SeshatFwkAvailable())
  {
    int v10 = SeshatHWAvailable(20);
    if (a1)
    {
      if (v10)
      {
        id v11 = *a1;
        if (*a1)
        {
          [*a1 endSession];

          *a1 = 0;
          SeshatPowerAssertion(0, v12, v13, v14, v15, v16, v17, v18, a9);
        }
      }
    }
  }
}

uint64_t SeshatAugmentPreflightResult(unint64_t *a1)
{
  unint64_t v2 = *a1;
  uint64_t result = SeshatFwkAvailable();
  if (result)
  {
    uint64_t result = SeshatHWAvailable(20);
    if (result)
    {
      uint64_t result = [(id)getNFSecureElementClass() embeddedSecureElement];
      if (result)
      {
        uint64_t v4 = (void *)result;
        unint64_t v5 = v2 & 0xFF00000000000000;
        int v6 = [(id)result hwType];
        if (v6 == 3)
        {
          unint64_t v7 = v2 & 0xE7FFFFFFFFFFFFLL | ((unint64_t)((unint64_t)objc_msgSend((id)objc_msgSend(v4, "sequenceCounter"), "unsignedLongValue") > 0x1E9) << 51);
          BOOL v8 = (unint64_t)objc_msgSend((id)objc_msgSend(v4, "sequenceCounter"), "unsignedLongValue") > 0x22F;
        }
        else
        {
          if (v6 != 1)
          {
            uint64_t v10 = v2 & 0xF7FFFFFFFFFFFFLL;
LABEL_13:
            *a1 = v10 | v5;
            return 1;
          }
          unint64_t v7 = v2 & 0xE7FFFFFFFFFFFFLL | ((unint64_t)((unint64_t)objc_msgSend((id)objc_msgSend(v4, "sequenceCounter"), "unsignedLongValue") >> 4 > 0x102) << 51);
          BOOL v8 = (unint64_t)objc_msgSend((id)objc_msgSend(v4, "sequenceCounter"), "unsignedLongValue") >> 2 > 0x48E;
        }
        uint64_t v9 = v8;
        uint64_t v10 = v7 | (v9 << 52);
        goto LABEL_13;
      }
    }
  }
  return result;
}

uint64_t getNFSecureElementClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x3052000000;
  int v6 = __Block_byref_object_copy__0;
  unint64_t v7 = __Block_byref_object_dispose__0;
  uint64_t v0 = getNFSecureElementClass_softClass;
  uint64_t v8 = getNFSecureElementClass_softClass;
  if (!getNFSecureElementClass_softClass)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __getNFSecureElementClass_block_invoke;
    v2[3] = &unk_1E61CB0E8;
    _OWORD v2[4] = &v3;
    __getNFSecureElementClass_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B8EBCE54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SeshatPreWarm()
{
  if (!SeshatFwkAvailable() || !SeshatHWAvailable(20)) {
    return 0;
  }
  uint64_t v0 = (void *)[(id)getNFHardwareManagerClass() sharedHardwareManager];

  return [v0 preWarm];
}

unint64_t SeshatRetry(id *a1, uint64_t a2)
{
  if (SeshatFwkAvailable() && SeshatHWAvailable(20))
  {
    unsigned int v10 = 0;
    unsigned int v11 = 0;
    uint64_t v12 = 0;
    uint64_t SessionWithTimeoutVerbose = (uint64_t)*a1;
    while (1)
    {
      if (v10)
      {
        long long v36 = xmmword_1B8ECD040;
        nanosleep((const timespec *)&v36, 0);
      }
      if (v10 > 2 || v11 == 7)
      {
        debuglog("SeshatRetry", @"transient error, re-creating session", v4, v5, v6, v7, v8, v9, v36);
        SeshatEndSession(a1, v14, v15, v16, v17, v18, v19, v20, v36);
        uint64_t SessionWithTimeoutVerbose = SeshatCreateSessionWithTimeoutVerbose(65000, 0, 0, v21, v22, v23, v24, v25);
        *a1 = (id)SessionWithTimeoutVerbose;
        if (!SessionWithTimeoutVerbose) {
          break;
        }
      }
      if ((seshat_debug_mask & 0x400) != 0 && (arc4random() & 0xF) == 0)
      {
        uint64_t v12 = 0xFFFFLL;
        unsigned int v11 = 7;
      }
      else
      {
        unint64_t v32 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, SessionWithTimeoutVerbose);
        unsigned int v11 = v32;
        uint64_t v12 = HIDWORD(v32);
      }
      if (v11) {
        BOOL v33 = 0;
      }
      else {
        BOOL v33 = v12 == 36864;
      }
      char v34 = !v33;
      if (v10 <= 3)
      {
        ++v10;
        if (v34) {
          continue;
        }
      }
      return v11 | (unint64_t)(v12 << 32);
    }
    debuglog("SeshatRetry", @"failed to re-create session", v26, v27, v28, v29, v30, v31, v36);
  }
  else
  {
    uint64_t v12 = 0xFFFFLL;
    unsigned int v11 = 6;
  }
  return v11 | (unint64_t)(v12 << 32);
}

unint64_t SeshatAllocateSlot(id *a1, char a2, char a3, uint64_t a4, CFTypeRef *a5, uint64_t a6)
{
  unint64_t v6 = 0xFFFF0000000ALL;
  if (a1 && *a1 && (seshat_debug_mask & 1) == 0)
  {
    uint64_t v13 = (void *)MEMORY[0x1BA9CE380]();
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3052000000;
    uint64_t v22 = __Block_byref_object_copy__0;
    uint64_t v23 = __Block_byref_object_dispose__0;
    uint64_t v24 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __SeshatAllocateSlot_block_invoke;
    v16[3] = &unk_1E61CB010;
    char v17 = a2;
    char v18 = a3;
    v16[4] = &v19;
    v16[5] = a4;
    v16[6] = a6;
    unint64_t v6 = SeshatRetry(a1, (uint64_t)v16);
    uint64_t v14 = (const void *)v20[5];
    if (v14) {
      *a5 = CFRetain(v14);
    }
    _Block_object_dispose(&v19, 8);
  }
  return v6;
}

void sub_1B8EBD164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t __SeshatAllocateSlot_block_invoke(uint64_t a1, void *a2)
{
  return [a2 allocateSlot:*(unsigned __int8 *)(a1 + 56) authorizingUser:*(unsigned __int8 *)(a1 + 57) authorizingUserToken:*(void *)(a1 + 40) outToken:*(void *)(*(void *)(a1 + 32) + 8) + 40 outWriteCount:*(void *)(a1 + 48)];
}

unint64_t SeshatDerive(id *a1, char a2, uint64_t a3, CFTypeRef *a4, uint64_t a5, uint64_t a6)
{
  unint64_t v6 = 0xFFFF0000000ALL;
  if (a1 && *a1 && (seshat_debug_mask & 2) == 0)
  {
    uint64_t v13 = (void *)MEMORY[0x1BA9CE380]();
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3052000000;
    uint64_t v27 = __Block_byref_object_copy__0;
    uint64_t v28 = __Block_byref_object_dispose__0;
    uint64_t v29 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3052000000;
    uint64_t v21 = __Block_byref_object_copy__0;
    uint64_t v22 = __Block_byref_object_dispose__0;
    uint64_t v23 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __SeshatDerive_block_invoke;
    v16[3] = &unk_1E61CB038;
    char v17 = a2;
    v16[6] = a3;
    void v16[7] = a5;
    v16[4] = &v24;
    v16[5] = &v18;
    unint64_t v6 = SeshatRetry(a1, (uint64_t)v16);
    uint64_t v14 = (const void *)v25[5];
    if (v14) {
      *a4 = CFRetain(v14);
    }
    if (v19[5])
    {
      *(_DWORD *)(a6 + 8) = [(id)getNFSeshatSessionClass() smallCrumbsFromError:v19[5]];
      *(void *)a6 = [(id)getNFSeshatSessionClass() largeCrumbsFromError:v19[5]];
    }
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }
  return v6;
}

void sub_1B8EBD37C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __SeshatDerive_block_invoke(uint64_t a1, void *a2)
{
  return [a2 derive:*(unsigned __int8 *)(a1 + 64) userHash:*(void *)(a1 + 48) outData:*(void *)(*(void *)(a1 + 32) + 8) + 40 outWriteCount:*(void *)(a1 + 56) trackingError:*(void *)(*(void *)(a1 + 40) + 8) + 40];
}

uint64_t getNFSeshatSessionClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x3052000000;
  unint64_t v6 = __Block_byref_object_copy__0;
  uint64_t v7 = __Block_byref_object_dispose__0;
  uint64_t v0 = getNFSeshatSessionClass_softClass;
  uint64_t v8 = getNFSeshatSessionClass_softClass;
  if (!getNFSeshatSessionClass_softClass)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __getNFSeshatSessionClass_block_invoke;
    v2[3] = &unk_1E61CB0E8;
    _OWORD v2[4] = &v3;
    __getNFSeshatSessionClass_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B8EBD4A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t SeshatResetCounter(id *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = 0xFFFF0000000ALL;
  if (a1 && *a1 && (seshat_debug_mask & 4) == 0)
  {
    CFDataRef v11 = (const __CFData *)a3;
    if ((seshat_debug_mask & 0x2000) != 0)
    {
      debuglog("SeshatResetCounter", @"corrupting reset token", a3, a4, a5, a6, a7, a8, v17);
      CFIndex Length = CFDataGetLength(v11);
      CFMutableArrayRef MutableCopy = CFDataCreateMutableCopy(0, Length, v11);
      v20.location = 0;
      v20.int length = 4;
      CFDataReplaceBytes(MutableCopy, v20, (const UInt8 *)"0000", 4);
      CFDataRef v11 = MutableCopy;
    }
    else
    {
      CFMutableArrayRef MutableCopy = 0;
    }
    uint64_t v15 = (void *)MEMORY[0x1BA9CE380]();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __SeshatResetCounter_block_invoke;
    void v18[3] = &__block_descriptor_49_e30____II_16__0__NFSeshatSession_8l;
    char v19 = a2;
    v18[4] = v11;
    v18[5] = a4;
    unint64_t v8 = SeshatRetry(a1, (uint64_t)v18);
    if (MutableCopy) {
      CFRelease(MutableCopy);
    }
  }
  return v8;
}

uint64_t __SeshatResetCounter_block_invoke(uint64_t a1, void *a2)
{
  return [a2 resetCounter:*(unsigned __int8 *)(a1 + 48) userToken:*(void *)(a1 + 32) outWriteCount:*(void *)(a1 + 40)];
}

unint64_t SeshatAuthorizeUpdate(id *a1, int a2, char a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5 = 0xFFFF0000000ALL;
  if (a1 && (seshat_debug_mask & 8) == 0 && *a1)
  {
    CFDataRef v11 = (void *)MEMORY[0x1BA9CE380]();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __SeshatAuthorizeUpdate_block_invoke;
    v13[3] = &__block_descriptor_53_e30____II_16__0__NFSeshatSession_8l;
    int v14 = a2;
    char v15 = a3;
    _OWORD v13[4] = a4;
    void v13[5] = a5;
    unint64_t v5 = SeshatRetry(a1, (uint64_t)v13);
  }
  return v5;
}

uint64_t __SeshatAuthorizeUpdate_block_invoke(uint64_t a1, void *a2)
{
  return [a2 authorizeUpdate:*(_DWORD *)(a1 + 48) != 0 slotIndex:*(unsigned __int8 *)(a1 + 52) userToken:*(void *)(a1 + 32) outWriteCount:*(void *)(a1 + 40)];
}

unint64_t SeshatDeleteSlot(id *a1, char a2, uint64_t a3)
{
  unint64_t v3 = 0xFFFF0000000ALL;
  if (a1 && *a1 && (seshat_debug_mask & 0x10) == 0)
  {
    uint64_t v7 = (void *)MEMORY[0x1BA9CE380]();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __SeshatDeleteSlot_block_invoke;
    v9[3] = &__block_descriptor_41_e30____II_16__0__NFSeshatSession_8l;
    char v10 = a2;
    v9[4] = a3;
    unint64_t v3 = SeshatRetry(a1, (uint64_t)v9);
  }
  return v3;
}

uint64_t __SeshatDeleteSlot_block_invoke(uint64_t a1, void *a2)
{
  return [a2 deleteSlot:*(unsigned __int8 *)(a1 + 40) outWriteCount:*(void *)(a1 + 32)];
}

unint64_t SeshatUpgradeSlot(id *a1, char a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = 0xFFFF0000000ALL;
  if (a1 && (seshat_debug_mask & 0x1000) == 0 && *a1)
  {
    uint64_t v9 = (void *)MEMORY[0x1BA9CE380]();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __SeshatUpgradeSlot_block_invoke;
    v11[3] = &__block_descriptor_49_e30____II_16__0__NFSeshatSession_8l;
    char v12 = a2;
    v11[4] = a3;
    void v11[5] = a4;
    unint64_t v4 = SeshatRetry(a1, (uint64_t)v11);
  }
  return v4;
}

uint64_t __SeshatUpgradeSlot_block_invoke(uint64_t a1, void *a2)
{
  return [a2 upgradeKey:*(unsigned __int8 *)(a1 + 48) inputData:*(void *)(a1 + 32) outWriteCount:*(void *)(a1 + 40)];
}

unint64_t SeshatGetData(id *a1, CFTypeRef *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5 = 0xFFFF0000000ALL;
  if (a1 && *a1 && (seshat_debug_mask & 0x20) == 0)
  {
    CFDataRef v11 = (void *)MEMORY[0x1BA9CE380]();
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3052000000;
    uint64_t v18 = __Block_byref_object_copy__0;
    char v19 = __Block_byref_object_dispose__0;
    uint64_t v20 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __SeshatGetData_block_invoke;
    v14[3] = &unk_1E61CB0C0;
    v14[4] = &v15;
    v14[5] = a3;
    v14[6] = a4;
    v14[7] = a5;
    unint64_t v5 = SeshatRetry(a1, (uint64_t)v14);
    char v12 = (const void *)v16[5];
    if (v12) {
      *a2 = CFRetain(v12);
    }
    _Block_object_dispose(&v15, 8);
  }
  return v5;
}

void sub_1B8EBDA08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SeshatGetData_block_invoke(void *a1, void *a2)
{
  return [a2 getData:*(void *)(a1[4] + 8) + 40 updateKUD:a1[5] outWriteLimit:a1[6] outWriteCount:a1[7]];
}

uint64_t isTransientError(uint64_t a1)
{
  unint64_t v2 = (void *)MEMORY[0x1BA9CE380]();
  uint64_t v3 = [(id)getNFSeshatSessionClass() isTransientError:a1];
  return v3;
}

uint64_t SeshatSeHistoryTest()
{
  uint64_t v0 = (void *)MEMORY[0x1BA9CE380]();
  id v4 = 0;
  uint64_t v1 = 0xFFFFFFFFLL;
  if (objc_msgSend((id)objc_msgSend((id)getNFHardwareManagerClass(), "sharedHardwareManager"), "secureElementBootHistory:", &v4)&& v4)
  {
    if ((int)[v4 count] < 1)
    {
      uint64_t v1 = 0;
    }
    else
    {
      uint64_t v2 = 0;
      LODWORD(v1) = 0;
      do
        uint64_t v1 = objc_msgSend((id)objc_msgSend(v4, "objectAtIndex:", v2++), "intValue") + v1;
      while (v2 < (int)[v4 count]);
    }
  }
  return v1;
}

CFDataRef SeshatCreateDerivedPasscode(CFDataRef result)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  memset(v1, 0, sizeof(v1));
  if (result)
  {
    ccsha256_di();
    ccdigest();
    return CFDataCreate(0, (const UInt8 *)v1, 32);
  }
  return result;
}

uint64_t SeshatDebug(uint64_t a1)
{
  uint64_t v1 = seshat_debug_mask;
  seshat_debug_mask = a1;
  return v1;
}

uint64_t SeshatGetDebug()
{
  return seshat_debug_mask;
}

BOOL SeshatIsReportingEnabled(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = seshat_debug_mask;
  if (seshat_debug_mask) {
    debuglog("SeshatIsReportingEnabled", @"not reporting aggd data, since debugging mode is enabled", a3, a4, a5, a6, a7, a8, v10);
  }
  return v8 == 0;
}

uint64_t SeshatGetNumberOfUsedSlots(CFDataRef theData)
{
  if (theData)
  {
    uint64_t v2 = 0;
    unsigned __int8 v3 = 0;
    do
    {
      if (CFDataGetBytePtr(theData)[v2] != 238) {
        ++v3;
      }
      ++v2;
    }
    while (v2 != 10);
    debuglog("SeshatGetNumberOfUsedSlots", @"number of enrolled slots %d", v4, v5, v6, v7, v8, v9, v3);
  }
  else
  {
    return 0;
  }
  return v3;
}

uint64_t SeshatNextAvailableSlot(CFDataRef theData)
{
  if (theData)
  {
    uint64_t v2 = 0;
    while (CFDataGetBytePtr(theData)[v2] != 238)
    {
      if (++v2 == 10) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    LOBYTE(v2) = -1;
  }
  return v2;
}

uint64_t SeshatPreflightCheck(int a1, uint64_t a2, unsigned char *a3)
{
  CFTypeRef v71 = 0;
  CFDataRef v72 = 0;
  CFTypeRef v70 = 0;
  CFTypeRef cf = 0;
  theunint64_t Data = 0;
  CFTypeRef v67 = 0;
  char v66 = -1;
  unsigned int v64 = 0;
  unsigned int v65 = 0;
  id v63 = 0;
  char v62 = 0;
  v61[0] = 0;
  v61[1] = 0;
  CFDataRef v11 = CFDataCreate(0, goodHash, 32);
  if (a1)
  {
    int v12 = SeshatSeHistoryTest();
    if ((SeshatAvailableinRestrictedMode() & 1) == 0)
    {
      if (v12)
      {
        int v15 = 0;
        LOBYTE(v16) = -1;
        uint64_t v17 = 1;
        goto LABEL_63;
      }
    }
  }
  uint64_t v18 = (void *)SeshatCreateSessionWithTimeoutVerbose(65000, &v62, (uint64_t)v61, v6, v7, v8, v9, v10);
  id v63 = v18;
  if (!v18)
  {
    uint64_t v17 = 2;
    goto LABEL_67;
  }
  if (a2 && ((*(uint64_t (**)(uint64_t, void *))(a2 + 16))(a2, v18) & 1) == 0)
  {
    debuglog("SeshatPreflightCheck", @"unsatisfactory condition for preflight", v19, v20, v21, v22, v23, v24, v59);
    int v15 = 0;
    LOBYTE(v16) = -1;
    uint64_t v17 = 14;
    goto LABEL_63;
  }
  unint64_t Data = SeshatGetData(&v63, (CFTypeRef *)&theData, (uint64_t)&v66, (uint64_t)&v65, (uint64_t)&v64);
  unsigned __int8 v33 = Data;
  unint64_t v34 = HIDWORD(Data);
  if (Data != 0x900000000000)
  {
    if (HIDWORD(Data) == 27266)
    {
      debuglog("SeshatPreflightCheck", @"no seshat applet", v27, v28, v29, v30, v31, v32, v59);
      uint64_t v36 = 13;
    }
    else if (HIDWORD(Data) == 26277)
    {
      debuglog("SeshatPreflightCheck", @"restricted mode", v27, v28, v29, v30, v31, v32, v59);
      uint64_t v36 = 12;
    }
    else
    {
      debuglog("SeshatPreflightCheck", @"unknown getData() -> 0x%x:0x%x", v27, v28, v29, v30, v31, v32, Data);
      uint64_t v36 = 3;
    }
    int v15 = 0;
    uint64_t v17 = (v34 << 16) | ((unint64_t)v33 << 8) | v36;
LABEL_62:
    LOBYTE(v16) = -1;
    goto LABEL_63;
  }
  uint64_t v60 = 1000 * ((v64 + 999) / 0x3E8);
  analytics_send_seshat_write_count(&v60, v26, v27, v28, v29, v30, v31, v32, v59);
  CFDataRef v35 = theData;
  if (!theData)
  {
    int v15 = 0;
    LOBYTE(v16) = -1;
LABEL_88:
    uint64_t v17 = 4;
    goto LABEL_63;
  }
  uint64_t v16 = 0;
  uint64_t v17 = 4;
  while (CFDataGetBytePtr(v35)[v16] != 238)
  {
    if (++v16 == 10)
    {
      int v15 = 0;
      goto LABEL_62;
    }
  }
  if (v16 > 9u)
  {
    int v15 = 0;
    goto LABEL_88;
  }
  uint64_t v17 = 2415919109;
  debuglog("SeshatPreflightCheck", @"globalWriteCounter = %d, globalWriteCounterLimit = %d, slot = %d\n", v14, v6, v7, v8, v9, v10, v64);
  int v15 = 0;
  if (v65 >= 0x2711 && v64 < v65 - 10000)
  {
    unint64_t v37 = SeshatAllocateSlot(&v63, v16, 238, 0, (CFTypeRef *)&v72, (uint64_t)&v64);
    if (v37 || HIDWORD(v37) != 36864)
    {
      int v15 = 0;
      uint64_t v17 = (HIDWORD(v37) << 16) | ((unint64_t)v37 << 8) | 6;
      goto LABEL_63;
    }
    CFDataRef v38 = v72;
    if (!v72)
    {
      debuglog("SeshatPreflightCheck", @"no reset token returned", v14, v6, v7, v8, v9, v10, v59);
      int v15 = 1;
      uint64_t v17 = 6;
      goto LABEL_63;
    }
    CFRelease(v35);
    theunint64_t Data = 0;
    unint64_t v39 = SeshatGetData(&v63, (CFTypeRef *)&theData, (uint64_t)&v66, (uint64_t)&v65, (uint64_t)&v64);
    unsigned __int8 v40 = v39;
    if (v39 || HIDWORD(v39) != 36864)
    {
      unint64_t v58 = (HIDWORD(v39) << 16) | ((unint64_t)v39 << 8);
LABEL_100:
      uint64_t v17 = v58 | 3;
      goto LABEL_105;
    }
    CFDataRef v41 = theData;
    if (CFDataGetBytePtr(theData)[v16] != 238 && (char)CFDataGetBytePtr(v41)[v16] < 0)
    {
      unint64_t v56 = (unint64_t)v40 << 8;
      uint64_t v57 = 2415919110;
      goto LABEL_104;
    }
    unint64_t v42 = SeshatDerive(&v63, v16, (uint64_t)v11, &v71, (uint64_t)&v64, (uint64_t)v61);
    unint64_t v43 = HIDWORD(v42);
    if (!v42 && v43 == 36864)
    {
      unint64_t v44 = SeshatResetCounter(&v63, v16, (uint64_t)v38, (uint64_t)&v64, v7, v8, v9, v10);
      unint64_t v45 = HIDWORD(v44);
      if (v44 || v45 != 36864) {
        goto LABEL_85;
      }
      unint64_t v42 = SeshatDerive(&v63, v16, (uint64_t)v11, &v70, (uint64_t)&v64, (uint64_t)v61);
      unint64_t v43 = HIDWORD(v42);
      if (!v42 && v43 == 36864)
      {
        if (!CFEqual(v70, v71))
        {
          int v15 = 1;
          uint64_t v17 = 9;
          goto LABEL_63;
        }
        unint64_t v44 = SeshatResetCounter(&v63, v16, (uint64_t)v38, (uint64_t)&v64, v7, v8, v9, v10);
        unint64_t v45 = HIDWORD(v44);
        if (!v44 && v45 == 36864)
        {
          unint64_t v46 = SeshatAuthorizeUpdate(&v63, 1, v16, (uint64_t)v38, (uint64_t)&v64);
          if (v46 || HIDWORD(v46) != 36864)
          {
            unint64_t v56 = (HIDWORD(v46) << 16) | ((unint64_t)v46 << 8);
          }
          else
          {
            unint64_t v47 = SeshatAuthorizeUpdate(&v63, 0, v16, (uint64_t)v38, (uint64_t)&v64);
            unsigned __int8 v48 = v47;
            if (!v47 && HIDWORD(v47) == 36864)
            {
              if (a3) {
                *a3 |= 1u;
              }
              if (SeshatPreflightGetResetStuff(v64, v38, (CFDataRef *)&cf, (CFDataRef *)&v67))
              {
                unint64_t v56 = (unint64_t)v48 << 8;
                uint64_t v57 = 2415919120;
                goto LABEL_104;
              }
              unint64_t v49 = SeshatUpgradeSlot(&v63, v16, (uint64_t)cf, (uint64_t)&v64);
              if (!v49 && HIDWORD(v49) == 36864)
              {
                unint64_t v50 = SeshatResetCounter(&v63, v16, (uint64_t)v67, (uint64_t)&v64, v7, v8, v9, v10);
                if (!v50 && HIDWORD(v50) == 36864)
                {
                  if (v41)
                  {
                    CFRelease(v41);
                    theunint64_t Data = 0;
                  }
                  unint64_t v51 = SeshatGetData(&v63, (CFTypeRef *)&theData, (uint64_t)&v66, (uint64_t)&v65, (uint64_t)&v64);
                  unsigned __int8 v52 = v51;
                  if (!v51 && HIDWORD(v51) == 36864)
                  {
                    CFDataRef v53 = theData;
                    if (CFDataGetBytePtr(theData)[v16] == 238 || ((char)CFDataGetBytePtr(v53)[v16] & 0x80000000) == 0)
                    {
                      unint64_t v56 = (unint64_t)v52 << 8;
                      uint64_t v57 = 2415919123;
                    }
                    else if ((CFDataGetBytePtr(v53)[v16] & 0x7F) != 0)
                    {
                      unint64_t v56 = (unint64_t)v52 << 8;
                      uint64_t v57 = 2415919124;
                    }
                    else
                    {
                      if (a3) {
                        *a3 |= 2u;
                      }
                      unint64_t v54 = SeshatDeleteSlot(&v63, v16, (uint64_t)&v64);
                      if (!v54 && HIDWORD(v54) == 36864)
                      {
                        int v15 = 0;
                        uint64_t v17 = 0;
                        goto LABEL_63;
                      }
                      unint64_t v56 = (HIDWORD(v54) << 16) | ((unint64_t)v54 << 8);
                      uint64_t v57 = 11;
                    }
                    goto LABEL_104;
                  }
                  unint64_t v58 = (HIDWORD(v51) << 16) | ((unint64_t)v51 << 8);
                  goto LABEL_100;
                }
                unint64_t v56 = (HIDWORD(v50) << 16) | ((unint64_t)v50 << 8);
                uint64_t v57 = 18;
LABEL_104:
                uint64_t v17 = v56 | v57;
                goto LABEL_105;
              }
              uint64_t v17 = (HIDWORD(v49) << 16) | ((unint64_t)v49 << 8) | 0xF;
LABEL_105:
              int v15 = 1;
              goto LABEL_63;
            }
            unint64_t v56 = (HIDWORD(v47) << 16) | ((unint64_t)v47 << 8);
          }
          uint64_t v57 = 10;
          goto LABEL_104;
        }
LABEL_85:
        uint64_t v17 = (v45 << 16) | ((unint64_t)v44 << 8) | 8;
        goto LABEL_105;
      }
    }
    uint64_t v17 = (v43 << 16) | ((unint64_t)v42 << 8) | 7;
    goto LABEL_105;
  }
LABEL_63:
  if (v63)
  {
    if (v15) {
      SeshatDeleteSlot(&v63, v16, (uint64_t)&v64);
    }
    SeshatEndSession(&v63, v13, v14, v6, v7, v8, v9, v10, v59);
  }
LABEL_67:
  if (v72) {
    CFRelease(v72);
  }
  if (v71) {
    CFRelease(v71);
  }
  if (v70) {
    CFRelease(v70);
  }
  if (theData) {
    CFRelease(theData);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v67) {
    CFRelease(v67);
  }
  return v17;
}

uint64_t SeshatAvailableinRestrictedMode()
{
  uint64_t result = SeshatFwkAvailable();
  if (result)
  {
    uint64_t result = SeshatHWAvailable(20);
    if (result)
    {
      uint64_t v1 = (void *)[(id)getNFSecureElementClass() embeddedSecureElement];
      if (v1) {
        LODWORD(v1) = [v1 isSeshatAvailabledInRestrictedMode];
      }
      return v1 | ((BYTE1(seshat_debug_mask) & 0x40) >> 6);
    }
  }
  return result;
}

uint64_t SeshatPreflightGetResetStuff(unsigned int a1, const __CFData *a2, CFDataRef *a3, CFDataRef *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int v20 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  MEMORY[0x1BA9CE060]();
  MEMORY[0x1F4188790]();
  LOBYTE(v19[1]) = 0;
  v19[0] = 2;
  long long v23 = xmmword_1B8ECD075;
  long long v24 = unk_1B8ECD085;
  long long v25 = xmmword_1B8ECD095;
  long long v26 = unk_1B8ECD0A5;
  long long v21 = xmmword_1B8ECD055;
  long long v22 = unk_1B8ECD065;
  char v27 = -121;
  cczp_bitlen();
  MEMORY[0x1F4188790]();
  uint64_t v9 = (const UInt8 *)&v17 - ((v8 + 24) & 0x7FFFFFFFFFFFFFF0);
  CFIndex v18 = v10;
  uint64_t v11 = 0xFFFFFFFFLL;
  if (a2)
  {
    if (a3)
    {
      if (a4)
      {
        ccrng();
        if (!v20)
        {
          if (ccec_x963_import_priv()) {
            return 0xFFFFFFFFLL;
          }
          *(_DWORD *)((char *)v19 + 1) = bswap32(a1);
          ccsha256_di();
          ccdigest();
          if (ccec_sign())
          {
            return 0xFFFFFFFFLL;
          }
          else
          {
            unint64_t v12 = (((unint64_t)(cczp_bitlen() + 7) >> 2) | 1) + 16;
            uint64_t v13 = (UInt8 *)malloc_type_malloc(v12, 0xE0546DF0uLL);
            ccec_x963_export();
            *(_OWORD *)uint64_t v13 = *(_OWORD *)CFDataGetBytePtr(a2);
            MEMORY[0x1F4188790]();
            ccec_x963_import_pub();
            HIBYTE(v17) = 0;
            if (ccec_verify() || !HIBYTE(v17))
            {
              puts("validation failed");
              uint64_t v11 = 0xFFFFFFFFLL;
            }
            else
            {
              CFDataRef v14 = CFDataCreate(0, v13, v12);
              *a3 = v14;
              if (v14)
              {
                CFDataRef v15 = CFDataCreate(0, v9, v18);
                *a4 = v15;
                if (v15) {
                  uint64_t v11 = 0;
                }
                else {
                  uint64_t v11 = 0xFFFFFFFFLL;
                }
              }
              else
              {
                uint64_t v11 = 0xFFFFFFFFLL;
              }
            }
            if (v13) {
              free(v13);
            }
          }
        }
      }
    }
  }
  return v11;
}

void SeshatReportIfNeeded(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 == 27268)
  {
    v11[1] = v8;
    v11[2] = v9;
    v11[0] = 1;
    analytics_send_seshat_eol(v11, a2, a3, a4, a5, a6, a7, a8, v10);
  }
}

uint64_t SeshatEnabled()
{
  return 1;
}

uint64_t SeshatForceEOL()
{
  return BYTE1(seshat_debug_mask) >> 7;
}

uint64_t KBSeshatGetSeSecret(id *a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, void *a6, size_t *a7)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  theunint64_t Data = 0;
  *(_OWORD *)bytes = 0u;
  long long v24 = 0u;
  int v21 = 0;
  if (a1 && *a1)
  {
    uint64_t v8 = 4294967293;
    if (a4)
    {
      if (a5)
      {
        uint64_t v8 = 4294967292;
        if (a6)
        {
          if (a7)
          {
            ccsha256_di();
            ccdigest();
            CFDataRef v12 = CFDataCreateWithBytesNoCopy(0, bytes, 32, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
            unint64_t v13 = SeshatDerive(a1, a3, (uint64_t)v12, (CFTypeRef *)&theData, (uint64_t)&v21, (uint64_t)&v20);
            CFDataRef v14 = theData;
            if (v13 == 0x900000000000)
            {
              size_t Length = CFDataGetLength(theData);
              uint64_t v16 = malloc_type_malloc(Length, 0x89E86EC7uLL);
              if (v16)
              {
                uint64_t v17 = v16;
                BytePtr = CFDataGetBytePtr(v14);
                memcpy(v17, BytePtr, Length);
                uint64_t v8 = 0;
                *a6 = v17;
                *a7 = Length;
              }
              else
              {
                uint64_t v8 = 4294967290;
              }
            }
            else
            {
              uint64_t v8 = 4294967291;
            }
            if (v14) {
              CFRelease(v14);
            }
            if (v12) {
              CFRelease(v12);
            }
          }
        }
      }
    }
  }
  else
  {
    uint64_t v8 = 4294967294;
  }
  memset_s(bytes, 0x20uLL, 0, 0x20uLL);
  return v8;
}

BOOL SeshatIsPreflightResultTransient(__int16 a1)
{
  return (a1 & 0x1F) == 2 || (a1 & 0x1F) == 14 || (a1 & 0xFF00) == 1792;
}

uint64_t SeshatCreateNonceBlob(uint64_t result, unsigned int a2, uint64_t a3)
{
  *(_DWORD *)a3 = 0;
  *(unsigned char *)(a3 + 4) = 0;
  *(unsigned char *)a3 = result;
  *(_DWORD *)(a3 + 1) = bswap32(a2);
  return result;
}

CFDataRef SeshatIsNonceEquivalent(char a1, unsigned int a2, CFDataRef theData, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((seshat_debug_mask & 0x10000) != 0)
  {
    debuglog("SeshatIsNonceEquivalent", @"not eq", (uint64_t)theData, a4, a5, a6, a7, a8, v13);
    return 0;
  }
  else
  {
    CFDataRef v8 = theData;
    v14[0] = a1;
    *(_DWORD *)&v14[1] = bswap32(a2);
    if (theData)
    {
      if (CFDataGetLength(theData) == 5)
      {
        BytePtr = CFDataGetBytePtr(v8);
        CFDataRef v8 = (const __CFData *)(*(_DWORD *)v14 == *(_DWORD *)BytePtr && v14[4] == BytePtr[4]);
      }
      else
      {
        CFDataRef v8 = 0;
      }
    }
    debuglog("SeshatIsNonceEquivalent", @"nonce eq: %d,%u -> %d", (uint64_t)theData, a4, a5, a6, a7, a8, a1);
  }
  return v8;
}

Class __getNFHardwareManagerClass_block_invoke(uint64_t a1)
{
  NearFieldLibrary();
  Class result = objc_getClass("NFHardwareManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    __getNFHardwareManagerClass_block_invoke_cold_1();
  }
  getNFHardwareManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

void NearFieldLibrary()
{
  uint64_t v0 = 0;
  if (!NearFieldLibraryCore()) {
    NearFieldLibrary_cold_1(&v0);
  }
}

uint64_t NearFieldLibraryCore()
{
  if (!NearFieldLibraryCore_frameworkLibrary) {
    NearFieldLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return NearFieldLibraryCore_frameworkLibrary;
}

uint64_t __NearFieldLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NearFieldLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getNFTapToRadarClass_block_invoke(uint64_t a1)
{
  NearFieldLibrary();
  Class result = objc_getClass("NFTapToRadar");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    __getNFTapToRadarClass_block_invoke_cold_1();
  }
  getNFTapToRadarClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

Class __getNFSecureElementClass_block_invoke(uint64_t a1)
{
  NearFieldLibrary();
  Class result = objc_getClass("NFSecureElement");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    __getNFSecureElementClass_block_invoke_cold_1();
  }
  getNFSecureElementClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

Class __getNFSeshatSessionClass_block_invoke(uint64_t a1)
{
  NearFieldLibrary();
  Class result = objc_getClass("NFSeshatSession");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    __getNFSeshatSessionClass_block_invoke_cold_1();
  }
  getNFSeshatSessionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

void *MKBEventsRegister(NSObject *a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  io_object_t notification = 0;
  if (!a1 || !a2)
  {
    CFStringRef v44 = @"bad arguments";
LABEL_13:
    debuglog("MKBEventsRegister", v44, a3, a4, a5, a6, a7, a8, v48);
    return 0;
  }
  mach_port_t v10 = *MEMORY[0x1E4F2EEF0];
  CFDictionaryRef v11 = IOServiceMatching("AppleKeyStore");
  io_service_t MatchingService = IOServiceGetMatchingService(v10, v11);
  if (!MatchingService)
  {
    debuglog("MKBEventsRegister", @"failed to find %s service", v13, v14, v15, v16, v17, v18, (char)"AppleKeyStore");
    return 0;
  }
  io_service_t v19 = MatchingService;
  IONotificationPortRef v20 = IONotificationPortCreate(v10);
  if (!v20)
  {
    CFStringRef v44 = @"failed to create notification port for AKS";
    goto LABEL_13;
  }
  int v21 = v20;
  long long v22 = malloc_type_calloc(1uLL, 0x20uLL, 0x10A0040648D5F1CuLL);
  long long v29 = v22;
  if (!v22)
  {
    debuglog("MKBEventsRegister", @"failed to allocate memory for event callback", v23, v24, v25, v26, v27, v28, v48);
    IONotificationPortDestroy(v21);
    return v29;
  }
  *long long v22 = v21;
  uint64_t v30 = _Block_copy(a2);
  v29[1] = v30;
  if (v30)
  {
    unint64_t v37 = dispatch_queue_create_with_target_V2("mkb events", 0, a1);
    v29[3] = v37;
    IONotificationPortSetDispatchQueue(v21, v37);
    if (!IOServiceAddInterestNotification(v21, v19, "IOGeneralInterest", (IOServiceInterestCallback)aksNotificationCB, v29, &notification))
    {
      *((_DWORD *)v29 + 4) = notification;
      *((_DWORD *)v29 + 5) = 1918985081;
      return v29;
    }
    debuglog("MKBEventsRegister", @"failed to add interest notification", v38, v39, v40, v41, v42, v43, v48);
    if (notification) {
      IOObjectRelease(notification);
    }
  }
  else
  {
    debuglog("MKBEventsRegister", @"failed to copy block", v31, v32, v33, v34, v35, v36, v48);
  }
  IONotificationPortDestroy(v21);
  unint64_t v46 = v29[3];
  if (v46) {
    dispatch_release(v46);
  }
  unint64_t v47 = (const void *)v29[1];
  if (v47) {
    _Block_release(v47);
  }
  free(v29);
  return 0;
}

void MKBEventsUnregister(uint64_t a1)
{
  if (a1)
  {
    IOObjectRelease(*(_DWORD *)(a1 + 16));
    IONotificationPortDestroy(*(IONotificationPortRef *)a1);
    uint64_t v2 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 0x40000000;
    block[2] = __MKBEventsUnregister_block_invoke;
    block[3] = &__block_descriptor_tmp_1;
    void block[4] = a1;
    dispatch_barrier_async(v2, block);
  }
}

void __MKBEventsUnregister_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  *(_DWORD *)(v2 + 20) = 0;
  _Block_release(*(const void **)(v2 + 8));
  dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
  unsigned __int8 v3 = *(void **)(a1 + 32);

  free(v3);
}

void analytics_send_persisted_seshat_recovery_required(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9 = a1;
  analytics_send_seshat_recovery_required(&v9, a2, a3, a4, a5, a6, a7, a8, v8);
}

void analytics_send_persisted_seshat_report(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1;
  analytics_send_seshat_report(&v9, a2, a3, a4, a5, a6, a7, a8, v8);
}

void analytics_send_persisted_sidp_recovery(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1;
  analytics_send_sidp_recovery(&v9, a2, a3, a4, a5, a6, a7, a8, v8);
}

void analytics_send_persisted_forgotten_passcode_event(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1;
  analytics_send_forgotten_passcode_event(&v9, a2, a3, a4, a5, a6, a7, a8, v8);
}

void analytics_send_nfc_hardware_state(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (MEMORY[0x1E4F5B210])
  {
    analytics_send_event_lazy();
  }
  else
  {
    debuglog("analytics_send_nfc_hardware_state", @"CA fwk missing, not sending event", a3, a4, a5, a6, a7, a8, a9);
  }
}

xpc_object_t __analytics_send_nfc_hardware_state_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, "timedout", **(unsigned char **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "duration", *(unsigned int *)(*(void *)(a1 + 32) + 4));
  xpc_dictionary_set_uint64(v2, "state", *(unsigned int *)(*(void *)(a1 + 32) + 8));
  return v2;
}

void analytics_send_passcode_status(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  debuglog("analytics_send_passcode_status", @"AnalyticsEvent: is_set: %llu, type: %llu, activation_status: %llu, inactivity_reboot: %llu, hours_since_locked: %llu, version: %llu", a3, a4, a5, a6, a7, a8, *a1);
  if (MEMORY[0x1E4F5B210])
  {
    analytics_send_event_lazy();
  }
  else
  {
    debuglog("analytics_send_passcode_status", @"CA fwk missing, not sending event", v9, v10, v11, v12, v13, v14, a9);
  }
}

xpc_object_t __analytics_send_passcode_status_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, "is_set", **(unsigned char **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "type", *(unsigned int *)(*(void *)(a1 + 32) + 4));
  xpc_dictionary_set_uint64(v2, "activation_status", *(unsigned int *)(*(void *)(a1 + 32) + 8));
  xpc_dictionary_set_BOOL(v2, "inactivity_reboot", *(unsigned char *)(*(void *)(a1 + 32) + 12));
  xpc_dictionary_set_uint64(v2, "hours_since_locked", *(unsigned int *)(*(void *)(a1 + 32) + 16));
  xpc_dictionary_set_uint64(v2, "version", *(unsigned __int8 *)(*(void *)(a1 + 32) + 20));
  return v2;
}

void analytics_send_kek_stats(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  debuglog("analytics_send_kek_stats", @"AnalyticsEvent: xart_policy: %llu, xart_policy_enforced: %llu, xart_policy_missing: %llu", a3, a4, a5, a6, a7, a8, *a1);
  if (MEMORY[0x1E4F5B210])
  {
    analytics_send_event_lazy();
  }
  else
  {
    debuglog("analytics_send_kek_stats", @"CA fwk missing, not sending event", v9, v10, v11, v12, v13, v14, a9);
  }
}

xpc_object_t __analytics_send_kek_stats_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, "xart_policy", **(unsigned char **)(a1 + 32));
  xpc_dictionary_set_BOOL(v2, "xart_policy_enforced", *(unsigned char *)(*(void *)(a1 + 32) + 1));
  xpc_dictionary_set_BOOL(v2, "xart_policy_missing", *(unsigned char *)(*(void *)(a1 + 32) + 2));
  return v2;
}

void analytics_send_seshat_debug(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  debuglog("analytics_send_seshat_debug", @"AnalyticsEvent: debug: %llu", a3, a4, a5, a6, a7, a8, *a1);
  if (MEMORY[0x1E4F5B210])
  {
    analytics_send_event_lazy();
  }
  else
  {
    debuglog("analytics_send_seshat_debug", @"CA fwk missing, not sending event", v9, v10, v11, v12, v13, v14, a9);
  }
}

xpc_object_t __analytics_send_seshat_debug_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "debug", **(void **)(a1 + 32));
  return v2;
}

void analytics_send_seshat_enroll(__int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  __int16 v9 = *a1;
  *a1 = *a1 & 0xFC3F | 0x80;
  debuglog("analytics_send_seshat_enroll", @"AnalyticsEvent: X: %llu, Sampling: %llu, Vslot: %llu, version: %llu, WCProtected: %llu, SEPRMProtected: %llu, AKPUProtected: %llu, PSProtected: %llu, SeshatRM: %llu, unhealthy: %llu", a3, a4, a5, a6, a7, a8, v9 & 1);
  if (SeshatIsReportingEnabled(v10, v11, v12, v13, v14, v15, v16, v17))
  {
    if (MEMORY[0x1E4F5B210])
    {
      analytics_send_event_lazy();
      return;
    }
    CFStringRef v24 = @"CA fwk missing, not sending event";
  }
  else
  {
    CFStringRef v24 = @"runtime condition not sastisifed";
  }

  debuglog("analytics_send_seshat_enroll", v24, v18, v19, v20, v21, v22, v23, a9);
}

xpc_object_t __analytics_send_seshat_enroll_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "X", **(_WORD **)(a1 + 32) & 1);
  xpc_dictionary_set_uint64(v2, "Sampling", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 1) & 1);
  xpc_dictionary_set_uint64(v2, "Vslot", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 2) & 0xF);
  xpc_dictionary_set_uint64(v2, "version", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 6) & 0xF);
  xpc_dictionary_set_uint64(v2, "WCProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 10) & 1);
  xpc_dictionary_set_uint64(v2, "SEPRMProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 11) & 1);
  xpc_dictionary_set_uint64(v2, "AKPUProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 12) & 1);
  xpc_dictionary_set_uint64(v2, "PSProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 13) & 1);
  xpc_dictionary_set_uint64(v2, "SeshatRM", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 14) & 1);
  xpc_dictionary_set_uint64(v2, "unhealthy", (unint64_t)**(unsigned __int16 **)(a1 + 32) >> 15);
  return v2;
}

void analytics_send_seshat_unenroll(__int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  __int16 v9 = *a1;
  *a1 = *a1 & 0xFC3F | 0x80;
  debuglog("analytics_send_seshat_unenroll", @"AnalyticsEvent: X: %llu, Sampling: %llu, Vslot: %llu, version: %llu, WCProtected: %llu, SEPRMProtected: %llu, AKPUProtected: %llu, PSProtected: %llu, SeshatRM: %llu, unhealthy: %llu", a3, a4, a5, a6, a7, a8, v9 & 1);
  if (SeshatIsReportingEnabled(v10, v11, v12, v13, v14, v15, v16, v17))
  {
    if (MEMORY[0x1E4F5B210])
    {
      analytics_send_event_lazy();
      return;
    }
    CFStringRef v24 = @"CA fwk missing, not sending event";
  }
  else
  {
    CFStringRef v24 = @"runtime condition not sastisifed";
  }

  debuglog("analytics_send_seshat_unenroll", v24, v18, v19, v20, v21, v22, v23, a9);
}

xpc_object_t __analytics_send_seshat_unenroll_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "X", **(_WORD **)(a1 + 32) & 1);
  xpc_dictionary_set_uint64(v2, "Sampling", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 1) & 1);
  xpc_dictionary_set_uint64(v2, "Vslot", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 2) & 0xF);
  xpc_dictionary_set_uint64(v2, "version", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 6) & 0xF);
  xpc_dictionary_set_uint64(v2, "WCProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 10) & 1);
  xpc_dictionary_set_uint64(v2, "SEPRMProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 11) & 1);
  xpc_dictionary_set_uint64(v2, "AKPUProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 12) & 1);
  xpc_dictionary_set_uint64(v2, "PSProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 13) & 1);
  xpc_dictionary_set_uint64(v2, "SeshatRM", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 14) & 1);
  xpc_dictionary_set_uint64(v2, "unhealthy", (unint64_t)**(unsigned __int16 **)(a1 + 32) >> 15);
  return v2;
}

void analytics_send_seshat_eol(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  debuglog("analytics_send_seshat_eol", @"AnalyticsEvent: occured: %llu", a3, a4, a5, a6, a7, a8, *a1 & 1);
  if (SeshatIsReportingEnabled(v9, v10, v11, v12, v13, v14, v15, v16))
  {
    if (MEMORY[0x1E4F5B210])
    {
      analytics_send_event_lazy();
      return;
    }
    CFStringRef v23 = @"CA fwk missing, not sending event";
  }
  else
  {
    CFStringRef v23 = @"runtime condition not sastisifed";
  }

  debuglog("analytics_send_seshat_eol", v23, v17, v18, v19, v20, v21, v22, a9);
}

xpc_object_t __analytics_send_seshat_eol_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "occured", **(unsigned char **)(a1 + 32) & 1);
  return v2;
}

void analytics_send_preflight_result(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v9 = *((unsigned __int16 *)a1 + 2);
  int v10 = v9 | (*((unsigned __int8 *)a1 + 6) << 16);
  unsigned int v11 = *a1;
  *((_WORD *)a1 + 2) = v9;
  *((unsigned char *)a1 + 6) = BYTE2(v10);
  *a1 = v11 & 0xFFFFFF1F | 0x60;
  debuglog("analytics_send_preflight_result", @"AnalyticsEvent: reason: %llu, version: %llu, nf_result: %llu, applet_result: %llu, num_fails: %llu, num_preflights: %llu, failed: %llu, calling_ctx: %llu, jcop_seq_gen: %llu, jcop_seq_gen2: %llu", a3, a4, a5, a6, a7, a8, v11 & 0x1F);
  if (SeshatIsReportingEnabled(v12, v13, v14, v15, v16, v17, v18, v19))
  {
    if (MEMORY[0x1E4F5B210])
    {
      analytics_send_event_lazy();
      return;
    }
    CFStringRef v26 = @"CA fwk missing, not sending event";
  }
  else
  {
    CFStringRef v26 = @"runtime condition not sastisifed";
  }

  debuglog("analytics_send_preflight_result", v26, v20, v21, v22, v23, v24, v25, a9);
}

xpc_object_t __analytics_send_preflight_result_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "reason", **(_DWORD **)(a1 + 32) & 0x1FLL);
  xpc_dictionary_set_uint64(v2, "version", **(_DWORD **)(a1 + 32) >> 5);
  xpc_dictionary_set_uint64(v2, "nf_result", *(unsigned __int8 *)(*(void *)(a1 + 32) + 1));
  xpc_dictionary_set_uint64(v2, "applet_result", *(unsigned __int16 *)(*(void *)(a1 + 32) + 2));
  xpc_dictionary_set_uint64(v2, "num_fails", *(unsigned __int8 *)(*(void *)(a1 + 32) + 4));
  xpc_dictionary_set_uint64(v2, "num_preflights", *(unsigned __int8 *)(*(void *)(a1 + 32) + 5));
  xpc_dictionary_set_uint64(v2, "failed", *(unsigned char *)(*(void *)(a1 + 32) + 6) & 1);
  xpc_dictionary_set_uint64(v2, "calling_ctx", ((unint64_t)*(unsigned __int8 *)(*(void *)(a1 + 32) + 6) >> 1) & 3);
  xpc_dictionary_set_uint64(v2, "jcop_seq_gen", ((unint64_t)*(unsigned __int8 *)(*(void *)(a1 + 32) + 6) >> 3) & 1);
  xpc_dictionary_set_uint64(v2, "jcop_seq_gen2", ((unint64_t)*(unsigned __int8 *)(*(void *)(a1 + 32) + 6) >> 4) & 1);
  return v2;
}

void analytics_send_seshat_recovery_required(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  *a1 = *a1 & 0xFFFFFFFFFFFFFFF8 | 5;
  debuglog("analytics_send_seshat_recovery_required", @"AnalyticsEvent: version: %llu, context: %llu, timedout: %llu, padding: %llu, nf_result: %llu, applet_result: %llu, reason: %llu", a3, a4, a5, a6, a7, a8, 5);
  if (SeshatIsReportingEnabled(v9, v10, v11, v12, v13, v14, v15, v16))
  {
    if (MEMORY[0x1E4F5B210])
    {
      analytics_send_event_lazy();
      return;
    }
    CFStringRef v23 = @"CA fwk missing, not sending event";
  }
  else
  {
    CFStringRef v23 = @"runtime condition not sastisifed";
  }

  debuglog("analytics_send_seshat_recovery_required", v23, v17, v18, v19, v20, v21, v22, a9);
}

xpc_object_t __analytics_send_seshat_recovery_required_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "version", **(void **)(a1 + 32) & 7);
  xpc_dictionary_set_uint64(v2, "context", (**(void **)(a1 + 32) >> 3) & 7);
  xpc_dictionary_set_uint64(v2, "timedout", (**(void **)(a1 + 32) >> 6) & 1);
  xpc_dictionary_set_uint64(v2, "padding", (**(void **)(a1 + 32) >> 7) & 1);
  xpc_dictionary_set_uint64(v2, "nf_result", *(unsigned int *)(*(void *)(a1 + 32) + 1));
  xpc_dictionary_set_uint64(v2, "applet_result", *(unsigned __int16 *)(*(void *)(a1 + 32) + 5));
  xpc_dictionary_set_uint64(v2, "reason", *(unsigned __int8 *)(*(void *)(a1 + 32) + 7));
  return v2;
}

void analytics_send_seshat_recovery_success(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  debuglog("analytics_send_seshat_recovery_success", @"AnalyticsEvent: occured: %llu", a3, a4, a5, a6, a7, a8, *a1 & 1);
  if (SeshatIsReportingEnabled(v9, v10, v11, v12, v13, v14, v15, v16))
  {
    if (MEMORY[0x1E4F5B210])
    {
      analytics_send_event_lazy();
      return;
    }
    CFStringRef v23 = @"CA fwk missing, not sending event";
  }
  else
  {
    CFStringRef v23 = @"runtime condition not sastisifed";
  }

  debuglog("analytics_send_seshat_recovery_success", v23, v17, v18, v19, v20, v21, v22, a9);
}

xpc_object_t __analytics_send_seshat_recovery_success_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "occured", **(unsigned char **)(a1 + 32) & 1);
  return v2;
}

void analytics_send_seshat_unexpected_sentinel(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  debuglog("analytics_send_seshat_unexpected_sentinel", @"AnalyticsEvent: occured: %llu", a3, a4, a5, a6, a7, a8, *a1);
  if (SeshatIsReportingEnabled(v9, v10, v11, v12, v13, v14, v15, v16))
  {
    if (MEMORY[0x1E4F5B210])
    {
      analytics_send_event_lazy();
      return;
    }
    CFStringRef v23 = @"CA fwk missing, not sending event";
  }
  else
  {
    CFStringRef v23 = @"runtime condition not sastisifed";
  }

  debuglog("analytics_send_seshat_unexpected_sentinel", v23, v17, v18, v19, v20, v21, v22, a9);
}

xpc_object_t __analytics_send_seshat_unexpected_sentinel_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "occured", **(void **)(a1 + 32));
  return v2;
}

void analytics_send_seshat_write_count(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  debuglog("analytics_send_seshat_write_count", @"AnalyticsEvent: writes: %llu", a3, a4, a5, a6, a7, a8, *a1);
  if (SeshatIsReportingEnabled(v9, v10, v11, v12, v13, v14, v15, v16))
  {
    HIDWORD(v23) = -858993459 * arc4random();
    LODWORD(v23) = HIDWORD(v23);
    if ((v23 >> 1) >= 0x1999999A)
    {
      CFStringRef v24 = @"sampling condition not sastisifed";
    }
    else
    {
      if (MEMORY[0x1E4F5B210])
      {
        analytics_send_event_lazy();
        return;
      }
      CFStringRef v24 = @"CA fwk missing, not sending event";
    }
  }
  else
  {
    CFStringRef v24 = @"runtime condition not sastisifed";
  }

  debuglog("analytics_send_seshat_write_count", v24, v17, v18, v19, v20, v21, v22, a9);
}

xpc_object_t __analytics_send_seshat_write_count_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "writes", **(void **)(a1 + 32));
  return v2;
}

void analytics_send_seshat_report(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  debuglog("analytics_send_seshat_report", @"AnalyticsEvent: key: %llu, value: %llu", a3, a4, a5, a6, a7, a8, *a1);
  if (SeshatIsReportingEnabled(v9, v10, v11, v12, v13, v14, v15, v16))
  {
    if (MEMORY[0x1E4F5B210])
    {
      analytics_send_event_lazy();
      return;
    }
    CFStringRef v23 = @"CA fwk missing, not sending event";
  }
  else
  {
    CFStringRef v23 = @"runtime condition not sastisifed";
  }

  debuglog("analytics_send_seshat_report", v23, v17, v18, v19, v20, v21, v22, a9);
}

xpc_object_t __analytics_send_seshat_report_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "key", **(unsigned int **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "value", *(unsigned int *)(*(void *)(a1 + 32) + 4));
  return v2;
}

void analytics_send_sidp_recovery(_WORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  *a1 = *a1 & 0xFFF0 | 1;
  debuglog("analytics_send_sidp_recovery", @"AnalyticsEvent: version: %llu, type: %llu, event: %llu, recoverable: %llu, recovery_required: %llu, se_entangled: %llu, se_recovery_required: %llu, smdk_entalgned: %llu", a3, a4, a5, a6, a7, a8, 1);
  if (MEMORY[0x1E4F5B210])
  {
    analytics_send_event_lazy();
  }
  else
  {
    debuglog("analytics_send_sidp_recovery", @"CA fwk missing, not sending event", v9, v10, v11, v12, v13, v14, a9);
  }
}

xpc_object_t __analytics_send_sidp_recovery_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "version", **(_WORD **)(a1 + 32) & 0xFLL);
  xpc_dictionary_set_uint64(v2, "type", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 4) & 3);
  xpc_dictionary_set_uint64(v2, "event", **(_WORD **)(a1 + 32) >> 6);
  xpc_dictionary_set_uint64(v2, "recoverable", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 8) & 1);
  xpc_dictionary_set_uint64(v2, "recovery_required", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 9) & 1);
  xpc_dictionary_set_uint64(v2, "se_entangled", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 10) & 1);
  xpc_dictionary_set_uint64(v2, "se_recovery_required", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 11) & 1);
  xpc_dictionary_set_uint64(v2, "smdk_entalgned", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 12) & 1);
  return v2;
}

void analytics_send_first_unlock(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  *a1 &= 0xE0u;
  debuglog("analytics_send_first_unlock", @"AnalyticsEvent: version: %llu, se_entangled: %llu, smdk_entalgned: %llu", a3, a4, a5, a6, a7, a8, 0);
  if (SeshatIsReportingEnabled(v9, v10, v11, v12, v13, v14, v15, v16))
  {
    if (MEMORY[0x1E4F5B210])
    {
      analytics_send_event_lazy();
      return;
    }
    CFStringRef v23 = @"CA fwk missing, not sending event";
  }
  else
  {
    CFStringRef v23 = @"runtime condition not sastisifed";
  }

  debuglog("analytics_send_first_unlock", v23, v17, v18, v19, v20, v21, v22, a9);
}

xpc_object_t __analytics_send_first_unlock_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "version", **(unsigned char **)(a1 + 32) & 0x1F);
  xpc_dictionary_set_uint64(v2, "se_entangled", ((unint64_t)**(unsigned __int8 **)(a1 + 32) >> 5) & 1);
  xpc_dictionary_set_uint64(v2, "smdk_entalgned", ((unint64_t)**(unsigned __int8 **)(a1 + 32) >> 6) & 1);
  return v2;
}

void analytics_send_db_filekey_found(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  debuglog("analytics_send_db_filekey_found", @"AnalyticsEvent: filekey_count: %llu", a3, a4, a5, a6, a7, a8, *a1);
  if (MEMORY[0x1E4F5B210])
  {
    analytics_send_event_lazy();
  }
  else
  {
    debuglog("analytics_send_db_filekey_found", @"CA fwk missing, not sending event", v9, v10, v11, v12, v13, v14, a9);
  }
}

xpc_object_t __analytics_send_db_filekey_found_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "filekey_count", **(void **)(a1 + 32));
  return v2;
}

void analytics_send_db_filekey_not_found(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  debuglog("analytics_send_db_filekey_not_found", @"AnalyticsEvent: filekey_count: %llu", a3, a4, a5, a6, a7, a8, *a1);
  if (MEMORY[0x1E4F5B210])
  {
    analytics_send_event_lazy();
  }
  else
  {
    debuglog("analytics_send_db_filekey_not_found", @"CA fwk missing, not sending event", v9, v10, v11, v12, v13, v14, a9);
  }
}

xpc_object_t __analytics_send_db_filekey_not_found_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "filekey_count", **(void **)(a1 + 32));
  return v2;
}

void analytics_send_db_add(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (MEMORY[0x1E4F5B210])
  {
    analytics_send_event_lazy();
  }
  else
  {
    debuglog("analytics_send_db_add", @"CA fwk missing, not sending event", a3, a4, a5, a6, a7, a8, a9);
  }
}

xpc_object_t __analytics_send_db_add_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "status", **(void **)(a1 + 32));
  return v2;
}

void analytics_send_db_get(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (MEMORY[0x1E4F5B210])
  {
    analytics_send_event_lazy();
  }
  else
  {
    debuglog("analytics_send_db_get", @"CA fwk missing, not sending event", a3, a4, a5, a6, a7, a8, a9);
  }
}

xpc_object_t __analytics_send_db_get_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "status", **(void **)(a1 + 32));
  return v2;
}

void analytics_send_passphrase_change(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  debuglog("analytics_send_passphrase_change", @"AnalyticsEvent: change_count: %llu", a3, a4, a5, a6, a7, a8, *a1);
  if (MEMORY[0x1E4F5B210])
  {
    analytics_send_event_lazy();
  }
  else
  {
    debuglog("analytics_send_passphrase_change", @"CA fwk missing, not sending event", v9, v10, v11, v12, v13, v14, a9);
  }
}

xpc_object_t __analytics_send_passphrase_change_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "change_count", **(void **)(a1 + 32));
  return v2;
}

void analytics_send_backup_key_drain(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (MEMORY[0x1E4F5B210])
  {
    analytics_send_event_lazy();
  }
  else
  {
    debuglog("analytics_send_backup_key_drain", @"CA fwk missing, not sending event", a3, a4, a5, a6, a7, a8, a9);
  }
}

xpc_object_t __analytics_send_backup_key_drain_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "filekey_count", **(void **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "fault", *(unsigned int *)(*(void *)(a1 + 32) + 8));
  xpc_dictionary_set_BOOL(v2, "first_unlocked", *(unsigned char *)(*(void *)(a1 + 32) + 12));
  xpc_dictionary_set_uint64(v2, "add_error", *(unsigned int *)(*(void *)(a1 + 32) + 16));
  xpc_dictionary_set_uint64(v2, "open_error", *(unsigned int *)(*(void *)(a1 + 32) + 20));
  xpc_dictionary_set_uint64(v2, "sqlite_error", *(unsigned int *)(*(void *)(a1 + 32) + 24));
  xpc_dictionary_set_BOOL(v2, "truncated", *(unsigned char *)(*(void *)(a1 + 32) + 28));
  xpc_dictionary_set_BOOL(v2, "unlinked", *(unsigned char *)(*(void *)(a1 + 32) + 29));
  return v2;
}

void analytics_send_fv_status(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  debuglog("analytics_send_fv_status", @"AnalyticsEvent: fv_enabled: %llu, fv_users_count: %llu, icloud_recovery_key: %llu, institutional_recovery_key: %llu, personal_recovery_key: %llu, mdm_recovery_key: %llu, installer_user: %llu, icloud_recovery_user: %llu, institutional_recovery_user: %llu, vek_device_protected: %llu, vek_ephemeral: %llu, vek_is_owner: %llu, vek_boot_policy: %llu, vek_imported: %llu, kek_sidp_count: %llu, kek_ps_count: %llu, kek_last_count: %llu, kek_imported_count: %llu, kek_bad_sig_count: %llu, kek_xart_policy_missing_count: %llu, kek_ps_missing_count: %llu", *(unsigned __int8 *)(a1 + 26), *(unsigned __int8 *)(a1 + 27), *(void *)(a1 + 80), a6, a7, a8, *(unsigned char *)a1);
  if (MEMORY[0x1E4F5B210])
  {
    analytics_send_event_lazy();
  }
  else
  {
    debuglog("analytics_send_fv_status", @"CA fwk missing, not sending event", v9, v10, v11, v12, v13, v14, a9);
  }
}

xpc_object_t __analytics_send_fv_status_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, "fv_enabled", **(unsigned char **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "fv_users_count", *(void *)(*(void *)(a1 + 32) + 8));
  xpc_dictionary_set_BOOL(v2, "icloud_recovery_key", *(unsigned char *)(*(void *)(a1 + 32) + 16));
  xpc_dictionary_set_BOOL(v2, "institutional_recovery_key", *(unsigned char *)(*(void *)(a1 + 32) + 17));
  xpc_dictionary_set_BOOL(v2, "personal_recovery_key", *(unsigned char *)(*(void *)(a1 + 32) + 18));
  xpc_dictionary_set_BOOL(v2, "mdm_recovery_key", *(unsigned char *)(*(void *)(a1 + 32) + 19));
  xpc_dictionary_set_BOOL(v2, "installer_user", *(unsigned char *)(*(void *)(a1 + 32) + 20));
  xpc_dictionary_set_BOOL(v2, "icloud_recovery_user", *(unsigned char *)(*(void *)(a1 + 32) + 21));
  xpc_dictionary_set_BOOL(v2, "institutional_recovery_user", *(unsigned char *)(*(void *)(a1 + 32) + 22));
  xpc_dictionary_set_BOOL(v2, "vek_device_protected", *(unsigned char *)(*(void *)(a1 + 32) + 23));
  xpc_dictionary_set_BOOL(v2, "vek_ephemeral", *(unsigned char *)(*(void *)(a1 + 32) + 24));
  xpc_dictionary_set_BOOL(v2, "vek_is_owner", *(unsigned char *)(*(void *)(a1 + 32) + 25));
  xpc_dictionary_set_BOOL(v2, "vek_boot_policy", *(unsigned char *)(*(void *)(a1 + 32) + 26));
  xpc_dictionary_set_BOOL(v2, "vek_imported", *(unsigned char *)(*(void *)(a1 + 32) + 27));
  xpc_dictionary_set_uint64(v2, "kek_sidp_count", *(void *)(*(void *)(a1 + 32) + 32));
  xpc_dictionary_set_uint64(v2, "kek_ps_count", *(void *)(*(void *)(a1 + 32) + 40));
  xpc_dictionary_set_uint64(v2, "kek_last_count", *(void *)(*(void *)(a1 + 32) + 48));
  xpc_dictionary_set_uint64(v2, "kek_imported_count", *(void *)(*(void *)(a1 + 32) + 56));
  xpc_dictionary_set_uint64(v2, "kek_bad_sig_count", *(void *)(*(void *)(a1 + 32) + 64));
  xpc_dictionary_set_uint64(v2, "kek_xart_policy_missing_count", *(void *)(*(void *)(a1 + 32) + 72));
  xpc_dictionary_set_uint64(v2, "kek_ps_missing_count", *(void *)(*(void *)(a1 + 32) + 80));
  return v2;
}

void analytics_send_forgotten_passcode_event(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  debuglog("analytics_send_forgotten_passcode_event", @"AnalyticsEvent: days_since_passcode_change: %llu, passcode_reset_expired: %llu, passcode_reset_exists: %llu", a3, a4, a5, a6, a7, a8, *a1);
  if (MEMORY[0x1E4F5B210])
  {
    analytics_send_event_lazy();
  }
  else
  {
    debuglog("analytics_send_forgotten_passcode_event", @"CA fwk missing, not sending event", v9, v10, v11, v12, v13, v14, a9);
  }
}

xpc_object_t __analytics_send_forgotten_passcode_event_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "days_since_passcode_change", **(unsigned int **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "passcode_reset_expired", *(unsigned char *)(*(void *)(a1 + 32) + 4) & 1);
  xpc_dictionary_set_uint64(v2, "passcode_reset_exists", ((unint64_t)*(unsigned __int8 *)(*(void *)(a1 + 32) + 4) >> 1) & 1);
  return v2;
}

void analytics_send_user_keybag(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  debuglog("analytics_send_user_keybag", @"AnalyticsEvent: report_version: %llu, grace_period: %llu, failed_unlock_attempts: %llu, max_unlock_attempts: %llu, recovery_iterations: %llu, recovery_target_iterations: %llu, recovery_wc_protected: %llu, recovery_restricted: %llu, recovery_ps_protected: %llu, recovery_akpu_protected: %llu, recovery_auto: %llu, memento_supported: %llu, memento_exists: %llu, memento_passcode_generation: %llu, passcode_generation: %llu, inactivity_reboot_enabled: %llu, oneness_automatic_mode: %llu, user_uuid_mismatch: %llu, zero_user_uuid: %llu, group_uuid_mismatch: %llu, zero_group_uuid: %llu, keybag_state_no_pin: %llu, keybag_state_been_unlocked: %llu, keybag_state_passcode_threshold: %llu, keybag_state_mesa_token: %llu, keybag_state_recovery_required: %llu, keybag_state_not_recoverable: %llu, keybag_state_stash_unlocked: %llu, keybag_state_escrow_unwrap_required: %llu, keybag_state_smdk_entangled: %llu, keybag_state_staged_manifest: %llu, keybag_state_se_unrecoverable: %llu, keybag_state_se_recovery_required: %llu, keybag_state_se_entangled: %llu, keybag_state_se_healthy: %llu, keybag_state_se_been_unlocked: %llu, keybag_state_art_loaded: %llu, keybag_state_xart_unlock_policy: %llu, keybag_state_xart_policy_cached: %llu, keybag_state_xart_policy_dirty: %llu, keybag_state_xart_policy_enforced: %llu, keybag_state_ps_entangled: %llu, keybag_state_from_xart: %llu, keybag_state_allow_test_keys: %llu, keybag_state_remote_session_unlocked: %llu, keybag_state_has_group_seed: %llu, keybag_state_been_passcode_unlocked: %llu, keybag_state_has_auto_recovery: %llu, keybag_state_has_lkgp_recovery: %llu, keybag_state_has_fv_recovery: %llu, keybag_state_has_memento_blob: %llu, keybag_more_state_cx_expiring: %llu, keybag_more_state_cx_expired: %llu, keybag_more_state_recovery_ps_fua_cached: %llu, keybag_more_state_unlocked_with_escrow: %llu, keybag_more_state_oneness_assert: %llu, hours_since_locked: %llu, cx_hours_remaining: %llu, days_since_passcode_change: %llu, memento_flags_blob_exists: %llu, memento_flags_se: %llu, memento_flags_ps: %llu, memento_flags_se_reset_token: %llu, memento_flags_tombstone: %llu, memento_failed_unlock_attempts: %llu, memento_se_slot: %llu, aks_get_extended_device_state_failure: %llu, AKSIdentityGetSessionTimeWindowsFailure: %llu, aks_get_seconds_since_passcode_change_failure: %llu, aks_memento_get_state_failure: %llu", *(unsigned int *)(a1 + 120), *(unsigned int *)(a1 + 116), *(unsigned __int8 *)(a1 + 112), *(unsigned __int8 *)(a1 + 111), *(unsigned __int8 *)(a1 + 110), *(unsigned __int8 *)(a1 + 109), *(_OWORD *)a1);
  if (MEMORY[0x1E4F5B210])
  {
    analytics_send_event_lazy();
  }
  else
  {
    debuglog("analytics_send_user_keybag", @"CA fwk missing, not sending event", v9, v10, v11, v12, v13, v14, a9);
  }
}

xpc_object_t __analytics_send_user_keybag_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "report_version", **(void **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "grace_period", *(void *)(*(void *)(a1 + 32) + 8));
  xpc_dictionary_set_uint64(v2, "failed_unlock_attempts", *(void *)(*(void *)(a1 + 32) + 16));
  xpc_dictionary_set_uint64(v2, "max_unlock_attempts", *(void *)(*(void *)(a1 + 32) + 24));
  xpc_dictionary_set_uint64(v2, "recovery_iterations", *(void *)(*(void *)(a1 + 32) + 32));
  xpc_dictionary_set_uint64(v2, "recovery_target_iterations", *(void *)(*(void *)(a1 + 32) + 40));
  xpc_dictionary_set_BOOL(v2, "recovery_wc_protected", *(unsigned char *)(*(void *)(a1 + 32) + 48));
  xpc_dictionary_set_BOOL(v2, "recovery_restricted", *(unsigned char *)(*(void *)(a1 + 32) + 49));
  xpc_dictionary_set_BOOL(v2, "recovery_ps_protected", *(unsigned char *)(*(void *)(a1 + 32) + 50));
  xpc_dictionary_set_BOOL(v2, "recovery_akpu_protected", *(unsigned char *)(*(void *)(a1 + 32) + 51));
  xpc_dictionary_set_BOOL(v2, "recovery_auto", *(unsigned char *)(*(void *)(a1 + 32) + 52));
  xpc_dictionary_set_BOOL(v2, "memento_supported", *(unsigned char *)(*(void *)(a1 + 32) + 53));
  xpc_dictionary_set_BOOL(v2, "memento_exists", *(unsigned char *)(*(void *)(a1 + 32) + 54));
  xpc_dictionary_set_uint64(v2, "memento_passcode_generation", *(void *)(*(void *)(a1 + 32) + 56));
  xpc_dictionary_set_uint64(v2, "passcode_generation", *(void *)(*(void *)(a1 + 32) + 64));
  xpc_dictionary_set_BOOL(v2, "inactivity_reboot_enabled", *(unsigned char *)(*(void *)(a1 + 32) + 72));
  xpc_dictionary_set_BOOL(v2, "oneness_automatic_mode", *(unsigned char *)(*(void *)(a1 + 32) + 73));
  xpc_dictionary_set_BOOL(v2, "user_uuid_mismatch", *(unsigned char *)(*(void *)(a1 + 32) + 74));
  xpc_dictionary_set_BOOL(v2, "zero_user_uuid", *(unsigned char *)(*(void *)(a1 + 32) + 75));
  xpc_dictionary_set_BOOL(v2, "group_uuid_mismatch", *(unsigned char *)(*(void *)(a1 + 32) + 76));
  xpc_dictionary_set_BOOL(v2, "zero_group_uuid", *(unsigned char *)(*(void *)(a1 + 32) + 77));
  xpc_dictionary_set_BOOL(v2, "keybag_state_no_pin", *(unsigned char *)(*(void *)(a1 + 32) + 78));
  xpc_dictionary_set_BOOL(v2, "keybag_state_been_unlocked", *(unsigned char *)(*(void *)(a1 + 32) + 79));
  xpc_dictionary_set_BOOL(v2, "keybag_state_passcode_threshold", *(unsigned char *)(*(void *)(a1 + 32) + 80));
  xpc_dictionary_set_BOOL(v2, "keybag_state_mesa_token", *(unsigned char *)(*(void *)(a1 + 32) + 81));
  xpc_dictionary_set_BOOL(v2, "keybag_state_recovery_required", *(unsigned char *)(*(void *)(a1 + 32) + 82));
  xpc_dictionary_set_BOOL(v2, "keybag_state_not_recoverable", *(unsigned char *)(*(void *)(a1 + 32) + 83));
  xpc_dictionary_set_BOOL(v2, "keybag_state_stash_unlocked", *(unsigned char *)(*(void *)(a1 + 32) + 84));
  xpc_dictionary_set_BOOL(v2, "keybag_state_escrow_unwrap_required", *(unsigned char *)(*(void *)(a1 + 32) + 85));
  xpc_dictionary_set_BOOL(v2, "keybag_state_smdk_entangled", *(unsigned char *)(*(void *)(a1 + 32) + 86));
  xpc_dictionary_set_BOOL(v2, "keybag_state_staged_manifest", *(unsigned char *)(*(void *)(a1 + 32) + 87));
  xpc_dictionary_set_BOOL(v2, "keybag_state_se_unrecoverable", *(unsigned char *)(*(void *)(a1 + 32) + 88));
  xpc_dictionary_set_BOOL(v2, "keybag_state_se_recovery_required", *(unsigned char *)(*(void *)(a1 + 32) + 89));
  xpc_dictionary_set_BOOL(v2, "keybag_state_se_entangled", *(unsigned char *)(*(void *)(a1 + 32) + 90));
  xpc_dictionary_set_BOOL(v2, "keybag_state_se_healthy", *(unsigned char *)(*(void *)(a1 + 32) + 91));
  xpc_dictionary_set_BOOL(v2, "keybag_state_se_been_unlocked", *(unsigned char *)(*(void *)(a1 + 32) + 92));
  xpc_dictionary_set_BOOL(v2, "keybag_state_art_loaded", *(unsigned char *)(*(void *)(a1 + 32) + 93));
  xpc_dictionary_set_BOOL(v2, "keybag_state_xart_unlock_policy", *(unsigned char *)(*(void *)(a1 + 32) + 94));
  xpc_dictionary_set_BOOL(v2, "keybag_state_xart_policy_cached", *(unsigned char *)(*(void *)(a1 + 32) + 95));
  xpc_dictionary_set_BOOL(v2, "keybag_state_xart_policy_dirty", *(unsigned char *)(*(void *)(a1 + 32) + 96));
  xpc_dictionary_set_BOOL(v2, "keybag_state_xart_policy_enforced", *(unsigned char *)(*(void *)(a1 + 32) + 97));
  xpc_dictionary_set_BOOL(v2, "keybag_state_ps_entangled", *(unsigned char *)(*(void *)(a1 + 32) + 98));
  xpc_dictionary_set_BOOL(v2, "keybag_state_from_xart", *(unsigned char *)(*(void *)(a1 + 32) + 99));
  xpc_dictionary_set_BOOL(v2, "keybag_state_allow_test_keys", *(unsigned char *)(*(void *)(a1 + 32) + 100));
  xpc_dictionary_set_BOOL(v2, "keybag_state_remote_session_unlocked", *(unsigned char *)(*(void *)(a1 + 32) + 101));
  xpc_dictionary_set_BOOL(v2, "keybag_state_has_group_seed", *(unsigned char *)(*(void *)(a1 + 32) + 102));
  xpc_dictionary_set_BOOL(v2, "keybag_state_been_passcode_unlocked", *(unsigned char *)(*(void *)(a1 + 32) + 103));
  xpc_dictionary_set_BOOL(v2, "keybag_state_has_auto_recovery", *(unsigned char *)(*(void *)(a1 + 32) + 104));
  xpc_dictionary_set_BOOL(v2, "keybag_state_has_lkgp_recovery", *(unsigned char *)(*(void *)(a1 + 32) + 105));
  xpc_dictionary_set_BOOL(v2, "keybag_state_has_fv_recovery", *(unsigned char *)(*(void *)(a1 + 32) + 106));
  xpc_dictionary_set_BOOL(v2, "keybag_state_has_memento_blob", *(unsigned char *)(*(void *)(a1 + 32) + 107));
  xpc_dictionary_set_BOOL(v2, "keybag_more_state_cx_expiring", *(unsigned char *)(*(void *)(a1 + 32) + 108));
  xpc_dictionary_set_BOOL(v2, "keybag_more_state_cx_expired", *(unsigned char *)(*(void *)(a1 + 32) + 109));
  xpc_dictionary_set_BOOL(v2, "keybag_more_state_recovery_ps_fua_cached", *(unsigned char *)(*(void *)(a1 + 32) + 110));
  xpc_dictionary_set_BOOL(v2, "keybag_more_state_unlocked_with_escrow", *(unsigned char *)(*(void *)(a1 + 32) + 111));
  xpc_dictionary_set_BOOL(v2, "keybag_more_state_oneness_assert", *(unsigned char *)(*(void *)(a1 + 32) + 112));
  xpc_dictionary_set_uint64(v2, "hours_since_locked", *(unsigned int *)(*(void *)(a1 + 32) + 116));
  xpc_dictionary_set_uint64(v2, "cx_hours_remaining", *(unsigned int *)(*(void *)(a1 + 32) + 120));
  xpc_dictionary_set_uint64(v2, "days_since_passcode_change", *(unsigned int *)(*(void *)(a1 + 32) + 124));
  xpc_dictionary_set_BOOL(v2, "memento_flags_blob_exists", *(unsigned char *)(*(void *)(a1 + 32) + 128));
  xpc_dictionary_set_BOOL(v2, "memento_flags_se", *(unsigned char *)(*(void *)(a1 + 32) + 129));
  xpc_dictionary_set_BOOL(v2, "memento_flags_ps", *(unsigned char *)(*(void *)(a1 + 32) + 130));
  xpc_dictionary_set_BOOL(v2, "memento_flags_se_reset_token", *(unsigned char *)(*(void *)(a1 + 32) + 131));
  xpc_dictionary_set_BOOL(v2, "memento_flags_tombstone", *(unsigned char *)(*(void *)(a1 + 32) + 132));
  xpc_dictionary_set_uint64(v2, "memento_failed_unlock_attempts", *(unsigned int *)(*(void *)(a1 + 32) + 136));
  xpc_dictionary_set_uint64(v2, "memento_se_slot", *(unsigned int *)(*(void *)(a1 + 32) + 140));
  xpc_dictionary_set_BOOL(v2, "aks_get_extended_device_state_failure", *(unsigned char *)(*(void *)(a1 + 32) + 144));
  xpc_dictionary_set_BOOL(v2, "AKSIdentityGetSessionTimeWindowsFailure", *(unsigned char *)(*(void *)(a1 + 32) + 145));
  xpc_dictionary_set_BOOL(v2, "aks_get_seconds_since_passcode_change_failure", *(unsigned char *)(*(void *)(a1 + 32) + 146));
  xpc_dictionary_set_BOOL(v2, "aks_memento_get_state_failure", *(unsigned char *)(*(void *)(a1 + 32) + 147));
  return v2;
}

void __getNFHardwareManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getNFHardwareManagerClass(void)_block_invoke"), @"SeshatSupport.m", 37, @"Unable to find class %s", "NFHardwareManager");
  __break(1u);
}

void NearFieldLibrary_cold_1(void *a1)
{
  xpc_object_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *NearFieldLibrary(void)"), @"SeshatSupport.m", 35, @"%s", *a1);
  __break(1u);
}

void __getNFTapToRadarClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getNFTapToRadarClass(void)_block_invoke"), @"SeshatSupport.m", 36, @"Unable to find class %s", "NFTapToRadar");
  __break(1u);
}

void __getNFSecureElementClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getNFSecureElementClass(void)_block_invoke"), @"SeshatSupport.m", 39, @"Unable to find class %s", "NFSecureElement");
  __break(1u);
}

void __getNFSeshatSessionClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getNFSeshatSessionClass(void)_block_invoke"), @"SeshatSupport.m", 38, @"Unable to find class %s", "NFSeshatSession");
  __break(1u);
  ADClientAddValueForScalarKey();
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x1F41071E8]();
}

uint64_t ADClientPushValueForDistributionKey()
{
  return MEMORY[0x1F4107200]();
}

uint64_t ADClientSetValueForDistributionKey()
{
  return MEMORY[0x1F4107210]();
}

uint64_t ADClientSetValueForScalarKey()
{
  return MEMORY[0x1F4107220]();
}

uint64_t AKSIdentityGetPrimary()
{
  return MEMORY[0x1F410A510]();
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1F40C94A8](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, dataIn, dataInLength);
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1F40C94B8](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorFinal(CCCryptorRef cryptorRef, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1F40C94C8](cryptorRef, dataOut, dataOutAvailable, dataOutMoved);
}

size_t CCCryptorGetOutputLength(CCCryptorRef cryptorRef, size_t inputLength, BOOL final)
{
  return MEMORY[0x1F40C9520](cryptorRef, inputLength, final);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x1F40C9528](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1F40C9538](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9738](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9740](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9748](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7198](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7810](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const UInt8 *newBytes, CFIndex newLength)
{
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x1F40D7888](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1F40D7898](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x1F40D7928](theDate);
  return result;
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1F40D7A98](allocator, domain, code, userInfo);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7B60](cf);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B68](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F58](allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x1F40D7F70](propertyList, stream, format, options, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFReadStreamRef)MEMORY[0x1F40D7FB0](alloc, bytes, length, bytesDeallocator);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1F40D7FF8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFShow(CFTypeRef obj)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1F40D8498](alloc, formatOptions, format, arguments);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1F40D89A0](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x1F40D8A90](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x1F40D8AA0](alloc, bufferAllocator);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1F40D8AD0](stream);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1F40E86C8](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1F40E8F08](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

uint64_t IOPMAssertionDeclareSystemActivity()
{
  return MEMORY[0x1F40E8F90]();
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1F40E8FA8](*(void *)&AssertionID);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1F40E9188](*(void *)&mainPort, path);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x1F40E9220](*(void *)&entry, propertyName, property);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x1F40E9230](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1F40E9240](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1F40E9280](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1F40F70F0](rnd, count, bytes);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
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

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x1F40C9C38]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1F40C9CD0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t aks_assert_consume()
{
  return MEMORY[0x1F410A518]();
}

uint64_t aks_assert_drop()
{
  return MEMORY[0x1F410A520]();
}

uint64_t aks_assert_hold()
{
  return MEMORY[0x1F410A528]();
}

uint64_t aks_assert_promote()
{
  return MEMORY[0x1F410A530]();
}

uint64_t aks_backup_copy_bag_uuid()
{
  return MEMORY[0x1F410A538]();
}

uint64_t aks_backup_copy_current_bag_uuid()
{
  return MEMORY[0x1F410A540]();
}

uint64_t aks_backup_rewrap_ek()
{
  return MEMORY[0x1F410A548]();
}

uint64_t aks_backup_rewrap_key()
{
  return MEMORY[0x1F410A550]();
}

uint64_t aks_backup_unwrap_bag()
{
  return MEMORY[0x1F410A558]();
}

uint64_t aks_backup_unwrap_key()
{
  return MEMORY[0x1F410A560]();
}

uint64_t aks_bag_in_xart()
{
  return MEMORY[0x1F410A568]();
}

uint64_t aks_change_secret()
{
  return MEMORY[0x1F410A578]();
}

uint64_t aks_change_secret_epilogue()
{
  return MEMORY[0x1F410A580]();
}

uint64_t aks_change_secret_opts()
{
  return MEMORY[0x1F410A588]();
}

uint64_t aks_copy_volume_cookie()
{
  return MEMORY[0x1F410A590]();
}

uint64_t aks_copy_volume_cookie_persona()
{
  return MEMORY[0x1F410A598]();
}

uint64_t aks_create_bag()
{
  return MEMORY[0x1F410A5A0]();
}

uint64_t aks_create_escrow_bag()
{
  return MEMORY[0x1F410A5A8]();
}

uint64_t aks_create_escrow_bag_with_auth()
{
  return MEMORY[0x1F410A5B0]();
}

uint64_t aks_generation()
{
  return MEMORY[0x1F410A5C0]();
}

uint64_t aks_get_bag_uuid()
{
  return MEMORY[0x1F410A5C8]();
}

uint64_t aks_get_configuration()
{
  return MEMORY[0x1F410A5D0]();
}

uint64_t aks_get_current_sep_measurement()
{
  return MEMORY[0x1F410A5D8]();
}

uint64_t aks_get_device_state()
{
  return MEMORY[0x1F410A5E0]();
}

uint64_t aks_get_extended_device_state()
{
  return MEMORY[0x1F410A5E8]();
}

uint64_t aks_get_lock_state()
{
  return MEMORY[0x1F410A5F0]();
}

uint64_t aks_get_system()
{
  return MEMORY[0x1F410A5F8]();
}

uint64_t aks_load_bag()
{
  return MEMORY[0x1F410A610]();
}

uint64_t aks_lock_device()
{
  return MEMORY[0x1F410A620]();
}

uint64_t aks_memento_efface_blob()
{
  return MEMORY[0x1F410A628]();
}

uint64_t aks_memento_get_state()
{
  return MEMORY[0x1F410A630]();
}

uint64_t aks_migrate_s_key()
{
  return MEMORY[0x1F410A640]();
}

uint64_t aks_obliterate_class_d()
{
  return MEMORY[0x1F410A648]();
}

uint64_t aks_prederived_change_secret()
{
  return MEMORY[0x1F410A680]();
}

uint64_t aks_prederived_create()
{
  return MEMORY[0x1F410A688]();
}

uint64_t aks_prederived_free()
{
  return MEMORY[0x1F410A690]();
}

uint64_t aks_prederived_is_enabled()
{
  return MEMORY[0x1F410A698]();
}

uint64_t aks_prederived_unlock_keybag()
{
  return MEMORY[0x1F410A6A0]();
}

uint64_t aks_prewarm_sps()
{
  return MEMORY[0x1F410A6A8]();
}

uint64_t aks_recover_with_escrow_bag()
{
  return MEMORY[0x1F410A6B0]();
}

uint64_t aks_save_bag()
{
  return MEMORY[0x1F410A740]();
}

uint64_t aks_se_delete_reset_token()
{
  return MEMORY[0x1F410A748]();
}

uint64_t aks_se_get_reset_pubkey()
{
  return MEMORY[0x1F410A750]();
}

uint64_t aks_se_get_reset_sig()
{
  return MEMORY[0x1F410A758]();
}

uint64_t aks_se_get_reset_token()
{
  return MEMORY[0x1F410A760]();
}

uint64_t aks_se_get_reset_token_for_memento_secret()
{
  return MEMORY[0x1F410A768]();
}

uint64_t aks_se_recover()
{
  return MEMORY[0x1F410A770]();
}

uint64_t aks_se_set_nonce()
{
  return MEMORY[0x1F410A778]();
}

uint64_t aks_se_support_in_rm()
{
  return MEMORY[0x1F410A780]();
}

uint64_t aks_se_support_in_rm_is_set()
{
  return MEMORY[0x1F410A788]();
}

uint64_t aks_set_configuration()
{
  return MEMORY[0x1F410A790]();
}

uint64_t aks_set_jcop_supports_updated_kud_policy()
{
  return MEMORY[0x1F410A798]();
}

uint64_t aks_set_keybag_for_volume_with_cookie()
{
  return MEMORY[0x1F410A7A0]();
}

uint64_t aks_set_keybag_for_volume_with_cookie_persona()
{
  return MEMORY[0x1F410A7A8]();
}

uint64_t aks_set_system()
{
  return MEMORY[0x1F410A7B0]();
}

uint64_t aks_set_system_with_passcode()
{
  return MEMORY[0x1F410A7B8]();
}

uint64_t aks_stash_enable()
{
  return MEMORY[0x1F410A7C8]();
}

uint64_t aks_stash_load()
{
  return MEMORY[0x1F410A7D0]();
}

uint64_t aks_stash_persist()
{
  return MEMORY[0x1F410A7D8]();
}

uint64_t aks_unload_bag()
{
  return MEMORY[0x1F410A808]();
}

uint64_t aks_unload_session_bags()
{
  return MEMORY[0x1F410A810]();
}

uint64_t aks_unlock_bag()
{
  return MEMORY[0x1F410A818]();
}

uint64_t aks_unlock_device()
{
  return MEMORY[0x1F410A820]();
}

uint64_t aks_unwrap_key()
{
  return MEMORY[0x1F410A828]();
}

uint64_t aks_verify_password()
{
  return MEMORY[0x1F410A830]();
}

uint64_t aks_verify_password_memento()
{
  return MEMORY[0x1F410A838]();
}

uint64_t aks_wrap_key()
{
  return MEMORY[0x1F410A840]();
}

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x1F41138E0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_clear()
{
  return MEMORY[0x1F40CA6A0]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x1F40CA6B8]();
}

uint64_t ccaes_xts_decrypt_mode()
{
  return MEMORY[0x1F40CA708]();
}

uint64_t cccmac_final_generate()
{
  return MEMORY[0x1F40CA7B8]();
}

uint64_t cccmac_init()
{
  return MEMORY[0x1F40CA7C0]();
}

uint64_t cccmac_update()
{
  return MEMORY[0x1F40CA7C8]();
}

uint64_t ccder_decode_len()
{
  return MEMORY[0x1F40CA890]();
}

uint64_t ccder_decode_tag()
{
  return MEMORY[0x1F40CA8C0]();
}

uint64_t ccdigest()
{
  return MEMORY[0x1F40CA9B0]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x1F40CAA40]();
}

uint64_t ccec_sign()
{
  return MEMORY[0x1F40CAB58]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x1F40CAB78]();
}

uint64_t ccec_x963_export()
{
  return MEMORY[0x1F40CAB90]();
}

uint64_t ccec_x963_import_priv()
{
  return MEMORY[0x1F40CAB98]();
}

uint64_t ccec_x963_import_pub()
{
  return MEMORY[0x1F40CABA8]();
}

uint64_t ccrng()
{
  return MEMORY[0x1F40CB030]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1F40CB148]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x1F40CB330]();
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

char *__cdecl ctime(const time_t *a1)
{
  return (char *)MEMORY[0x1F40CB8E0](a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC0D8](*(void *)&a1, a2, a3, *(void *)&a4);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1F40CC360](a1, a2, a3, a4, *(void *)&a5);
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

kern_return_t host_get_multiuser_config_flags(host_t host, uint32_t *multiuser_flags)
{
  return MEMORY[0x1F40CC600](*(void *)&host, multiuser_flags);
}

kern_return_t host_set_multiuser_config_flags(host_priv_t host_priv, uint32_t multiuser_flags)
{
  return MEMORY[0x1F40CC618](*(void *)&host_priv, *(void *)&multiuser_flags);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1F40CC950]();
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1F40CCA40](*(void *)&task, *(void *)&name, ptype);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1F40CCD40](__s, __smax, *(void *)&__c, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CCDD0](a1, a2);
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return MEMORY[0x1F40CCEA0](__rqtp, __rmtp);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1F40CD0F0](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

int pipe(int a1[2])
{
  return MEMORY[0x1F40CD760](a1);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40CD830](*(void *)&__fd, __buf, __nbyte, a4);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40CDBC0](*(void *)&__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1F40CDC88](__ptr, __size);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return MEMORY[0x1F40CDD70](a1, a2, *(void *)&a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1F40CE210](__big, __little, __len);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1F40CE630](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1F40CE660](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1F40CE6A8](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40CE6C0](*(void *)&target_task, address, size);
}

uint64_t voucher_get_current_persona()
{
  return MEMORY[0x1F40CE728]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1F40CECF0]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1F40CF288]();
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1F40CF340]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1F40CF348]();
}