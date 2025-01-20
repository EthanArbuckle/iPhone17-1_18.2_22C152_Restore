uint64_t SSEIsFeatureSupported(int a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  BOOL v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t DeviceFeatures;
  uint64_t v10;
  unsigned int v11;

  v11 = 0;
  v10 = 0;
  init();
  if (_hasSSE)
  {
    v2 = SSEGetVersion(&v11);
    if (v2)
    {
      v3 = v2;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        SSEIsFeatureSupported_cold_4();
      }
    }
    else
    {
      v3 = 0;
      switch(a1)
      {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 8:
        case 9:
        case 10:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
          return v3;
        case 7:
        case 11:
        case 15:
        case 26:
        case 27:
        case 28:
          v4 = HIWORD(v11);
          goto LABEL_8;
        case 12:
        case 25:
          v5 = v11 > 1;
          goto LABEL_26;
        case 13:
        case 14:
          v5 = v11 > 2;
          goto LABEL_26;
        case 16:
        case 35:
        case 36:
        case 37:
        case 38:
        case 39:
          v4 = v11 >> 18;
          goto LABEL_8;
        case 17:
        case 40:
          v6 = v11;
          v7 = 393215;
          goto LABEL_25;
        case 29:
        case 30:
        case 31:
          v4 = v11 >> 17;
          goto LABEL_8;
        case 32:
        case 45:
        case 46:
        case 47:
        case 48:
          v4 = v11 >> 19;
LABEL_8:
          if (v4) {
            return 0;
          }
          else {
            return 4294967279;
          }
        case 33:
          v6 = v11;
          v7 = 655359;
          goto LABEL_25;
        case 34:
          DeviceFeatures = getDeviceFeatures(&v10);
          if (DeviceFeatures)
          {
            v3 = DeviceFeatures;
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              SSEIsFeatureSupported_cold_3();
            }
          }
          else if (v10)
          {
            return 0;
          }
          else
          {
            return 4294967279;
          }
          return v3;
        case 41:
        case 42:
          v5 = HIWORD(v11) > 4u;
          goto LABEL_26;
        case 43:
        case 44:
          v6 = v11;
          v7 = 458751;
          goto LABEL_25;
        case 49:
          v6 = v11;
          v7 = 589823;
LABEL_25:
          v5 = v6 > v7;
LABEL_26:
          if (v5) {
            v3 = 0;
          }
          else {
            v3 = 4294967279;
          }
          break;
        default:
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            SSEIsFeatureSupported_cold_2();
          }
          return 4294967279;
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEIsFeatureSupported_cold_1();
    }
    return 4294967279;
  }
  return v3;
}

uint64_t SSEGetVersion(_DWORD *a1)
{
  if (SSEGetVersion_protocolVersion)
  {
    uint64_t v2 = 0;
    goto LABEL_10;
  }
  uint64_t inputStruct = 0x153534563;
  unsigned int outputStruct = 0;
  uint64_t v3 = init();
  if (v3)
  {
    uint64_t v2 = v3;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEGetVersion_cold_4();
    }
  }
  else
  {
    size_t outputStructCnt = 4;
    uint64_t v4 = IOConnectCallStructMethod(_connect, 0, &inputStruct, 8uLL, &outputStruct, &outputStructCnt);
    if (!v4)
    {
      if (outputStructCnt == 4)
      {
        int v5 = outputStruct;
        if (outputStruct)
        {
          uint64_t v2 = 0;
          if (outputStruct >= 0xA0000) {
            int v5 = 655360;
          }
          SSEGetVersion_protocolVersion = v5;
          goto LABEL_10;
        }
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          SSEGetVersion_cold_1();
        }
      }
      else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        SSEGetVersion_cold_2();
      }
      uint64_t v2 = 4294967290;
      goto LABEL_10;
    }
    uint64_t v2 = v4;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEGetVersion_cold_3();
    }
  }
LABEL_10:
  if (a1) {
    *a1 = SSEGetVersion_protocolVersion;
  }
  return v2;
}

uint64_t getDeviceFeatures(void *a1)
{
  if (a1)
  {
    if (getDeviceFeatures_featuresValid)
    {
LABEL_10:
      uint64_t v5 = 0;
      *a1 = getDeviceFeatures_deviceFeatures;
      return v5;
    }
    unsigned int v10 = 0;
    uint64_t v2 = SSEGetVersion(&v10);
    if (v2)
    {
      uint64_t v5 = v2;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        getDeviceFeatures_cold_5();
      }
    }
    else
    {
      if (v10 < 0x30000)
      {
LABEL_9:
        getDeviceFeatures_featuresValid = 1;
        goto LABEL_10;
      }
      uint64_t outputStruct = 0;
      uint64_t inputStruct = 0x1E53534563;
      uint64_t v3 = init();
      if (v3)
      {
        uint64_t v5 = v3;
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          getDeviceFeatures_cold_4();
        }
      }
      else
      {
        size_t v7 = 8;
        uint64_t v4 = IOConnectCallStructMethod(_connect, 0, &inputStruct, 8uLL, &outputStruct, &v7);
        if (v4)
        {
          uint64_t v5 = v4;
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            getDeviceFeatures_cold_3();
          }
        }
        else
        {
          if (v7 == 8)
          {
            getDeviceFeatures_deviceFeatures = outputStruct;
            goto LABEL_9;
          }
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            getDeviceFeatures_cold_2();
          }
          return 4294967290;
        }
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      getDeviceFeatures_cold_1();
    }
    return 4294967292;
  }
  return v5;
}

uint64_t init()
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ((_initialized & 1) == 0)
  {
    if (isRestoreMode_onceToken != -1) {
      dispatch_once(&isRestoreMode_onceToken, &__block_literal_global_162);
    }
    if ((isRestoreMode_restoreMode & 1) != 0 || _skipSEAvailabilityCheck)
    {
      _hasSSE = 1;
    }
    else
    {
      if (getMGAnswers_onceToken != -1) {
        dispatch_once(&getMGAnswers_onceToken, &__block_literal_global_167);
      }
      _hasSSE = getMGAnswers_cachedHasSE;
      if (!getMGAnswers_cachedHasSE)
      {
        _initialized = 1;
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          init_cold_5();
        }
        goto LABEL_13;
      }
    }
    mach_port_t v1 = *MEMORY[0x263F0EC90];
    CFDictionaryRef v2 = IOServiceMatching("AppleSSE");
    io_service_t MatchingService = IOServiceGetMatchingService(v1, v2);
    if (!MatchingService)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        init_cold_1();
      }
      uint64_t v0 = 4294967276;
      goto LABEL_14;
    }
    io_object_t v4 = MatchingService;
    uint64_t v5 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, (io_connect_t *)&_connect);
    if (v5)
    {
      uint64_t v0 = v5;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        init_cold_4();
      }
      IOObjectRelease(v4);
      goto LABEL_14;
    }
    v6 = IONotificationPortCreate(v1);
    _notifyport = (uint64_t)v6;
    if (v6) {
      goto LABEL_24;
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      init_cold_3();
    }
    v6 = (IONotificationPort *)_notifyport;
    if (_notifyport)
    {
LABEL_24:
      size_t v7 = dispatch_get_global_queue(21, 0);
      IONotificationPortSetDispatchQueue(v6, v7);

      if (IOServiceAddInterestNotification((IONotificationPortRef)_notifyport, v4, "IOGeneralInterest", (IOServiceInterestCallback)serviceNotificationHandler, 0, (io_object_t *)&_notifyobj)&& os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        init_cold_2();
      }
    }
    if (getMGAnswers_onceToken != -1) {
      dispatch_once(&getMGAnswers_onceToken, &__block_literal_global_167);
    }
    if (getMGAnswers_cachedIsInternal)
    {
      if (isRestoreMode_onceToken != -1) {
        dispatch_once(&isRestoreMode_onceToken, &__block_literal_global_162);
      }
      if ((isRestoreMode_restoreMode & 1) == 0)
      {
        _logFile = (uint64_t)fopen("/var/mobile/Library/Logs/AppleSSE.log", "a");
        if (_logFile)
        {
          if (MEMORY[0x22A6B6AF0]() < 1) {
            chmod("/var/mobile/Library/Logs/AppleSSE.log", 0x1B6u);
          }
          else {
            fputs("\n", (FILE *)_logFile);
          }
          v18[1] = 0;
          *(void *)v19 = 0x4100000001;
          size_t v17 = 16;
          v18[0] = 0;
          sysctl(v19, 2u, v18, &v17, 0, 0);
          logLine("AppleSSE Log Starts - System Version %s", v8, v9, v10, v11, v12, v13, v14, (char)v18);
          logState(0, 0);
        }
      }
    }
    _initialized = 1;
    v15 = dispatch_get_global_queue(21, 0);
    dispatch_async(v15, &__block_literal_global);

    IOObjectRelease(v4);
    return 0;
  }
  if (_hasSSE) {
    return 0;
  }
LABEL_13:
  uint64_t v0 = 4294967279;
LABEL_14:
  if (_notifyobj)
  {
    IOObjectRelease(_notifyobj);
    _notifyobj = 0;
  }
  if (_notifyport)
  {
    IONotificationPortDestroy((IONotificationPortRef)_notifyport);
    _notifyport = 0;
  }
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  return v0;
}

uint64_t logCmdCall(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a2 || a3) && _logFile)
  {
    logLine("%s() -> %d", a2, a3, a4, a5, a6, a7, a8, result);
    return logState(a4, a5);
  }
  return result;
}

uint64_t baaPrepare()
{
  if (baaInit_onceToken != -1) {
    dispatch_once(&baaInit_onceToken, &__block_literal_global_203);
  }
  uint64_t v0 = (void *)_baaSupportClass;
  if (!_baaSupportClass) {
    return 4294967290;
  }

  return [v0 prepare];
}

uint64_t getCertificatesFromBuffer(int *a1, unint64_t a2, void *a3, _DWORD *a4)
{
  id v8 = (id)[MEMORY[0x263EFF980] array];
  if (!a1)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      getCertificatesFromBuffer_cold_1();
    }
    goto LABEL_32;
  }
  if (!a2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      getCertificatesFromBuffer_cold_2();
    }
    goto LABEL_32;
  }
  if ((unint64_t)a1 > a2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      getCertificatesFromBuffer_cold_3();
    }
    goto LABEL_32;
  }
  if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      getCertificatesFromBuffer_cold_4();
    }
    goto LABEL_32;
  }
  if (!a4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      getCertificatesFromBuffer_cold_5();
    }
LABEL_32:
    uint64_t v16 = 4294967292;
    goto LABEL_16;
  }
  if ((unint64_t)a1 < a2)
  {
    if (a2 - (unint64_t)a1 <= 3)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        getCertificatesFromBuffer_cold_6();
      }
LABEL_21:
      uint64_t v16 = 4294967290;
      goto LABEL_16;
    }
    int v9 = *a1;
    if (*a1)
    {
      int v10 = 0;
      uint64_t v11 = (unsigned int *)(a1 + 1);
      while (a2 - (unint64_t)v11 > 3)
      {
        unsigned int v14 = *v11;
        uint64_t v12 = v11 + 1;
        uint64_t v13 = v14;
        if ((uint64_t)(a2 - (void)v12) < v14)
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            getCertificatesFromBuffer_cold_8();
          }
          goto LABEL_21;
        }
        id v15 = (id)[MEMORY[0x263EFF8F8] dataWithBytes:v12 length:v13];
        [v8 addObject:v15];

        uint64_t v11 = (_DWORD *)((char *)v12 + v13);
        v10 += v13 + 4;
        if (!--v9) {
          goto LABEL_15;
        }
      }
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        getCertificatesFromBuffer_cold_7();
      }
      goto LABEL_21;
    }
  }
  int v10 = 0;
LABEL_15:
  uint64_t v16 = 0;
  *a3 = v8;
  *a4 = v10;
LABEL_16:

  return v16;
}

uint64_t SSEGetEntangledAuthorizationRandom(int a1, const __CFData *a2, char a3, CFDataRef *a4, CFDataRef *a5)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  int v27 = a1;
  memset(inputStruct, 0, sizeof(inputStruct));
  size_t v26 = 0;
  if (!a2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEGetEntangledAuthorizationRandom_cold_1();
    }
    goto LABEL_23;
  }
  if (!a4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEGetEntangledAuthorizationRandom_cold_2();
    }
    goto LABEL_23;
  }
  if (!a5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEGetEntangledAuthorizationRandom_cold_3();
    }
LABEL_23:
    uint64_t v21 = 4294967292;
    goto LABEL_16;
  }
  int v10 = (UInt8 *)malloc_type_calloc(0x108uLL, 1uLL, 0x2AD6A872uLL);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = init();
    if (v12)
    {
      uint64_t v21 = v12;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        SSEGetEntangledAuthorizationRandom_cold_13();
      }
      goto LABEL_15;
    }
    strcpy(inputStruct, "cESS\"");
    *(_DWORD *)&inputStruct[8] = a1;
    if ((unint64_t)CFDataGetLength(a2) >= 0x19)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        SSEGetEntangledAuthorizationRandom_cold_5();
      }
      uint64_t v21 = 4294967292;
      goto LABEL_15;
    }
    v30.length = CFDataGetLength(a2);
    v30.location = 0;
    CFDataGetBytes(a2, v30, (UInt8 *)((unint64_t)inputStruct | 0xC));
    inputStruct[36] = a3;
    size_t v26 = 264;
    uint64_t v13 = IOConnectCallStructMethod(_connect, 0, inputStruct, 0x25uLL, v11, &v26);
    if (v13)
    {
      uint64_t v21 = v13;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        SSEGetEntangledAuthorizationRandom_cold_12();
      }
      goto LABEL_15;
    }
    size_t v14 = v26;
    if (v26 <= 7)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        SSEGetEntangledAuthorizationRandom_cold_6();
      }
    }
    else if (v26 >= 0x109)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        SSEGetEntangledAuthorizationRandom_cold_7();
      }
    }
    else
    {
      unint64_t v15 = *(unsigned int *)v11;
      if (v26 - 8 >= v15)
      {
        CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFDataRef v17 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v11 + 8, v15);
        if (!v17)
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            SSEGetEntangledAuthorizationRandom_cold_9();
          }
          uint64_t v21 = 4294967291;
          goto LABEL_15;
        }
        CFDataRef v18 = v17;
        CFIndex v19 = *((unsigned int *)v11 + 1);
        if ((uint64_t)(v14 - (*(unsigned int *)v11 + 8)) < v19)
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            SSEGetEntangledAuthorizationRandom_cold_10();
          }
          uint64_t v21 = 4294967290;
        }
        else
        {
          CFDataRef v20 = CFDataCreate(v16, &v11[*(unsigned int *)v11 + 8], v19);
          if (v20)
          {
            uint64_t v21 = 0;
            *a4 = v18;
            *a5 = v20;
LABEL_15:
            free(v11);
            goto LABEL_16;
          }
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            SSEGetEntangledAuthorizationRandom_cold_11();
          }
          uint64_t v21 = 4294967291;
        }
        CFRelease(v18);
        goto LABEL_15;
      }
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        SSEGetEntangledAuthorizationRandom_cold_8();
      }
    }
    uint64_t v21 = 4294967290;
    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    SSEGetEntangledAuthorizationRandom_cold_4();
  }
  uint64_t v21 = 4294967291;
LABEL_16:
  logCmdCall((uint64_t)"SSEGetEntangledAuthorizationRandom", v21, 1, (uint64_t)&v27, (unint64_t)inputStruct | 0xC, v22, v23, v24);
  return v21;
}

uint64_t baaIssueNewCertificate()
{
  if (baaInit_onceToken != -1) {
    dispatch_once(&baaInit_onceToken, &__block_literal_global_203);
  }
  uint64_t v0 = (void *)_baaSupportClass;
  if (!_baaSupportClass) {
    return 4294967290;
  }

  return [v0 issueNewCertificate];
}

uint64_t SSEGetAttV2AuthKey(const __CFData *a1, const __CFData *a2, CFDataRef *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v17 = 0;
  long long v16 = 0u;
  *(_OWORD *)&inputStruct[4] = 0u;
  size_t outputStructCnt = 0;
  if (!a1)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEGetAttV2AuthKey_cold_1();
    }
    return 4294967292;
  }
  if (!a2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEGetAttV2AuthKey_cold_2();
    }
    return 4294967292;
  }
  if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEGetAttV2AuthKey_cold_3();
    }
    return 4294967292;
  }
  v6 = (UInt8 *)malloc_type_calloc(0x4000uLL, 1uLL, 0x7290607BuLL);
  if (v6)
  {
    size_t v7 = v6;
    uint64_t v8 = init();
    if (v8)
    {
      uint64_t v12 = v8;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        SSEGetAttV2AuthKey_cold_11();
      }
      goto LABEL_13;
    }
    strcpy(inputStruct, "cESS#");
    if ((unint64_t)CFDataGetLength(a1) >= 0x19)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        SSEGetAttV2AuthKey_cold_5();
      }
    }
    else
    {
      v19.length = CFDataGetLength(a1);
      v19.location = 0;
      CFDataGetBytes(a1, v19, &inputStruct[8]);
      if ((unint64_t)CFDataGetLength(a2) < 9)
      {
        v20.length = CFDataGetLength(a2);
        v20.location = 0;
        CFDataGetBytes(a2, v20, (UInt8 *)&v16 + 12);
        size_t outputStructCnt = 0x4000;
        uint64_t v9 = IOConnectCallStructMethod(_connect, 0, inputStruct, 0x28uLL, v7, &outputStructCnt);
        if (v9)
        {
          uint64_t v12 = v9;
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            SSEGetAttV2AuthKey_cold_10();
          }
          goto LABEL_13;
        }
        if (outputStructCnt <= 3)
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            SSEGetAttV2AuthKey_cold_7();
          }
        }
        else
        {
          CFIndex v10 = *(unsigned int *)v7;
          if (outputStructCnt - 4 == v10)
          {
            CFDataRef v11 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v7 + 4, v10);
            if (v11)
            {
              uint64_t v12 = 0;
              *a3 = v11;
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                SSEGetAttV2AuthKey_cold_8();
              }
              uint64_t v12 = 4294967291;
            }
            goto LABEL_13;
          }
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            SSEGetAttV2AuthKey_cold_9();
          }
        }
        uint64_t v12 = 4294967290;
LABEL_13:
        free(v7);
        return v12;
      }
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        SSEGetAttV2AuthKey_cold_6();
      }
    }
    uint64_t v12 = 4294967292;
    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    SSEGetAttV2AuthKey_cold_4();
  }
  return 4294967291;
}

uint64_t SSESetSEPubKey(const __CFData *a1, const __CFData *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  *(void *)buffer = 0;
  uint64_t v16 = 0;
  int v18 = 0;
  uint64_t v17 = 0;
  if (!a1)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSESetSEPubKey_cold_1();
    }
    return 4294967292;
  }
  if (!a2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSESetSEPubKey_cold_2();
    }
    return 4294967292;
  }
  io_object_t v4 = (char *)malloc_type_calloc(0x4000uLL, 1uLL, 0xB0967022uLL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = init();
    if (v6)
    {
      uint64_t v13 = v6;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        SSESetSEPubKey_cold_8();
      }
    }
    else
    {
      unint64_t Length = CFDataGetLength(a1);
      if (Length >= 0x19)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          SSESetSEPubKey_cold_4();
        }
      }
      else
      {
        v20.length = Length;
        v20.location = 0;
        CFDataGetBytes(a1, v20, buffer);
        if (CFDataGetLength(a2) >= 0x100000000)
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            SSESetSEPubKey_cold_5();
          }
        }
        else
        {
          int v18 = CFDataGetLength(a2);
          id v8 = (id)[MEMORY[0x263EFF990] dataWithBytes:buffer length:28];
          [v8 appendData:a2];
          if (!((unint64_t)[v8 length] >> 32))
          {
            LODWORD(v9) = 0;
            while (1)
            {
              strcpy(v5, "cESS%");
              unsigned int v10 = ([v8 length] - (unint64_t)v9) >> 2 > 0xFFA
                  ? 16364
                  : [v8 length] - v9;
              *((_DWORD *)v5 + 2) = [v8 length];
              *((_DWORD *)v5 + 3) = v9;
              *((_DWORD *)v5 + 4) = v10;
              id v11 = v8;
              [v11 bytes];
              __memcpy_chk();
              uint64_t v12 = IOConnectCallStructMethod(_connect, 0, v5, v10 + 20, 0, 0);
              if (v12) {
                break;
              }
              unint64_t v9 = v9 + v10;
              if ([v11 length] <= v9)
              {

                uint64_t v13 = 0;
                goto LABEL_15;
              }
            }
            uint64_t v13 = v12;
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              SSESetSEPubKey_cold_7();
            }

            goto LABEL_15;
          }
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            SSESetSEPubKey_cold_6();
          }
        }
      }
      uint64_t v13 = 4294967292;
    }
LABEL_15:
    free(v5);
    return v13;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    SSESetSEPubKey_cold_3();
  }
  return 4294967291;
}

uint64_t SSEPerformAuthKeySharing(const __CFData *a1, const __CFData *a2, const __CFData *a3, CFDataRef *a4, CFDataRef *a5)
{
  size_t outputStructCnt = 0;
  if (!a1)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEPerformAuthKeySharing_cold_1();
    }
    return 4294967292;
  }
  if (!a2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEPerformAuthKeySharing_cold_2();
    }
    return 4294967292;
  }
  if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEPerformAuthKeySharing_cold_3();
    }
    return 4294967292;
  }
  if (!a4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEPerformAuthKeySharing_cold_4();
    }
    return 4294967292;
  }
  if (!a5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEPerformAuthKeySharing_cold_5();
    }
    return 4294967292;
  }
  unsigned int v10 = (UInt8 *)malloc_type_calloc(0x4000uLL, 1uLL, 0xD2063E45uLL);
  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEPerformAuthKeySharing_cold_6();
    }
    return 4294967291;
  }
  id v11 = v10;
  uint64_t v12 = (UInt8 *)malloc_type_calloc(0x4000uLL, 1uLL, 0x43BFE140uLL);
  if (!v12)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEPerformAuthKeySharing_cold_7();
    }
    free(v11);
    return 4294967291;
  }
  uint64_t v13 = v12;
  uint64_t v14 = init();
  if (v14)
  {
    uint64_t v28 = v14;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEPerformAuthKeySharing_cold_18();
    }
    goto LABEL_20;
  }
  strcpy((char *)v11, "cESS$");
  if ((unint64_t)CFDataGetLength(a1) >= 0x19)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEPerformAuthKeySharing_cold_8();
    }
    goto LABEL_47;
  }
  v31.length = CFDataGetLength(a1);
  v31.location = 0;
  CFDataGetBytes(a1, v31, v11 + 8);
  unint64_t Length = CFDataGetLength(a2);
  if (Length >= 0x3FD9)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEPerformAuthKeySharing_cold_9();
    }
    goto LABEL_47;
  }
  unint64_t v16 = Length;
  *((_DWORD *)v11 + 8) = Length;
  v32.location = 0;
  v32.length = Length;
  CFDataGetBytes(a2, v32, v11 + 40);
  uint64_t v17 = &v11[v16 + 40];
  unint64_t v18 = CFDataGetLength(a3);
  if (v11 - v17 + 0x4000 < v18)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEPerformAuthKeySharing_cold_10();
    }
LABEL_47:
    uint64_t v28 = 4294967292;
    goto LABEL_20;
  }
  unint64_t v19 = v18;
  *((_DWORD *)v11 + 9) = v18;
  v33.location = 0;
  v33.length = v18;
  CFDataGetBytes(a3, v33, v17);
  size_t outputStructCnt = 0x4000;
  uint64_t v20 = IOConnectCallStructMethod(_connect, 0, v11, &v17[v19] - v11, v13, &outputStructCnt);
  if (v20)
  {
    uint64_t v28 = v20;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEPerformAuthKeySharing_cold_17();
    }
    goto LABEL_20;
  }
  size_t v21 = outputStructCnt;
  if (outputStructCnt <= 7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEPerformAuthKeySharing_cold_11();
    }
    goto LABEL_56;
  }
  if (outputStructCnt > 0x4000)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEPerformAuthKeySharing_cold_12();
    }
    goto LABEL_56;
  }
  unint64_t v22 = *(unsigned int *)v13;
  if (outputStructCnt - 8 < v22)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEPerformAuthKeySharing_cold_13();
    }
LABEL_56:
    uint64_t v28 = 4294967290;
    goto LABEL_20;
  }
  CFAllocatorRef v23 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef v24 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v13 + 8, v22);
  if (!v24)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEPerformAuthKeySharing_cold_14();
    }
    uint64_t v28 = 4294967291;
    goto LABEL_20;
  }
  CFDataRef v25 = v24;
  CFIndex v26 = *((unsigned int *)v13 + 1);
  if ((uint64_t)(v21 - (*(unsigned int *)v13 + 8)) < v26)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEPerformAuthKeySharing_cold_15();
    }
    uint64_t v28 = 4294967290;
    goto LABEL_66;
  }
  CFDataRef v27 = CFDataCreate(v23, &v13[*(unsigned int *)v13 + 8], v26);
  if (!v27)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SSEPerformAuthKeySharing_cold_16();
    }
    uint64_t v28 = 4294967291;
LABEL_66:
    CFRelease(v25);
    goto LABEL_20;
  }
  uint64_t v28 = 0;
  *a4 = v25;
  *a5 = v27;
LABEL_20:
  free(v11);
  free(v13);
  return v28;
}

void serviceNotificationHandler(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 == -469794813)
  {
    uint64_t v5 = (id)_authKeyRevocationNtfQueue;
    uint64_t v6 = v5;
    if (!v5) {
      uint64_t v6 = dispatch_get_global_queue(21, 0);
    }
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __serviceNotificationHandler_block_invoke_3;
    v9[3] = &__block_descriptor_40_e5_v8__0l;
    v9[4] = a4;
    size_t v7 = v9;
    goto LABEL_10;
  }
  if (a3 == -469794814)
  {
    if (!_doNotIssueNewBAACertificate)
    {
      id v8 = dispatch_get_global_queue(21, 0);
      dispatch_async(v8, &__block_literal_global_176);
    }
    goto LABEL_14;
  }
  if (a3 != -469794815)
  {
LABEL_14:
    uint64_t v5 = 0;
    goto LABEL_15;
  }
  uint64_t v5 = (id)_effacemenNtfQueue;
  uint64_t v6 = v5;
  if (!v5) {
    uint64_t v6 = dispatch_get_global_queue(21, 0);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __serviceNotificationHandler_block_invoke;
  v10[3] = &__block_descriptor_40_e5_v8__0l;
  v10[4] = a4;
  size_t v7 = v10;
LABEL_10:
  dispatch_async(v6, v7);
  if (!v5) {

  }
LABEL_15:
}

const char *__isRestoreMode_block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  size_t v2 = 1024;
  result = (const char *)sysctlbyname("kern.bootargs", __str, &v2, 0, 0);
  if (!result)
  {
    __lasts = 0;
    result = strtok_r(__str, " \t", &__lasts);
    if (result)
    {
      while (1)
      {
        result = (const char *)strcmp(result, "rd=md0");
        if (!result) {
          break;
        }
        result = strtok_r(0, " \t", &__lasts);
        if (!result) {
          return result;
        }
      }
      isRestoreMode_restoreMode = 1;
    }
  }
  return result;
}

void *__getMGAnswers_block_invoke()
{
  result = dlopen("/usr/lib/libMobileGestalt.dylib", 1);
  if (result)
  {
    mach_port_t v1 = result;
    size_t v2 = (uint64_t (*)(__CFString *))dlsym(result, "MGGetBoolAnswer");
    if (v2)
    {
      uint64_t v3 = v2;
      getMGAnswers_cachedHasSE = v2(@"0dnM19zBqLw5ZPhIo4GEkg");
      getMGAnswers_cachedIsInternal = v3(@"InternalBuild");
    }
    return (void *)dlclose(v1);
  }
  return result;
}

uint64_t __serviceNotificationHandler_block_invoke()
{
  uint64_t result = _effacemenNtfHandler;
  if (_effacemenNtfHandler) {
    return (*(uint64_t (**)(void))(_effacemenNtfHandler + 16))();
  }
  return result;
}

uint64_t __serviceNotificationHandler_block_invoke_3()
{
  uint64_t result = _authKeyRevocationNtfHandler;
  if (_authKeyRevocationNtfHandler) {
    return (*(uint64_t (**)(void))(_authKeyRevocationNtfHandler + 16))();
  }
  return result;
}

const char *logLine(const char *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (_logFile)
  {
    unint64_t v9 = result;
    *(_OWORD *)uint64_t v14 = 0u;
    long long v15 = 0u;
    time_t v13 = time(0);
    unsigned int v10 = localtime(&v13);
    strftime(v14, 0x20uLL, "%F %T (%z)", v10);
    id v11 = (FILE *)_logFile;
    uint64_t v12 = getprogname();
    fprintf(v11, "%s [%s]: ", v14, v12);
    vfprintf((FILE *)_logFile, v9, &a9);
    fputs("\n", (FILE *)_logFile);
    return (const char *)fflush((FILE *)_logFile);
  }
  return result;
}

uint64_t logState(uint64_t result, uint64_t a2)
{
  if (_logFile)
  {
    uint64_t v3 = (_DWORD *)result;
    uint64_t inputStruct = 0x953534563;
    long long v7 = 0u;
    long long v8 = 0u;
    long long outputStruct = 0u;
    size_t outputStructCnt = 48;
    uint64_t result = IOConnectCallStructMethod(_connect, 0, &inputStruct, 8uLL, &outputStruct, &outputStructCnt);
    if (!result)
    {
      if (v3) {
        fprintf((FILE *)_logFile, "\tuserID        = %u\n", *v3);
      }
      if (a2)
      {
        fwrite("\tseid          = ", 0x11uLL, 1uLL, (FILE *)_logFile);
        for (uint64_t i = 0; i != 24; ++i)
          fprintf((FILE *)_logFile, "%02x", *(unsigned __int8 *)(a2 + i));
        fputs("\n", (FILE *)_logFile);
      }
      fprintf((FILE *)_logFile, "\tsseKey hash   = %016llx\n", (void)outputStruct);
      fprintf((FILE *)_logFile, "\tauthRand hash = %016llx\n", *((void *)&outputStruct + 1));
      fprintf((FILE *)_logFile, "\tsubcounter    = %llu\n", (void)v7);
      fprintf((FILE *)_logFile, "\tentropy hash  = %016llx\n", *((void *)&v7 + 1));
      fprintf((FILE *)_logFile, "\tkeybag hash   = %016llx\n", (void)v8);
      fprintf((FILE *)_logFile, "\tnoPasscodeCnt = %u\n", DWORD2(v8));
      return fflush((FILE *)_logFile);
    }
  }
  return result;
}

void __baaInit_block_invoke()
{
  if (isRestoreMode_onceToken != -1) {
    dispatch_once(&isRestoreMode_onceToken, &__block_literal_global_162);
  }
  if ((isRestoreMode_restoreMode & 1) == 0)
  {
    init();
    if (_hasSSE)
    {
      if (isEntitledForBAA_onceToken != -1) {
        dispatch_once(&isEntitledForBAA_onceToken, &__block_literal_global_210);
      }
      if (isEntitledForBAA_entitled == 1)
      {
        if (dlopen("/usr/lib/libAppleSSEExt.dylib", 1))
        {
          Class Class = objc_getClass("BAASupport");
          _baaSupportClass Class = (uint64_t)Class;
          if (!Class)
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              __baaInit_block_invoke_cold_2();
            }
            Class Class = (Class)_baaSupportClass;
          }
          [(objc_class *)Class setDelegate:objc_opt_class()];
        }
        else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
        {
          __baaInit_block_invoke_cold_1();
        }
      }
    }
  }
}

void __isEntitledForBAA_block_invoke()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v0 = (id)[MEMORY[0x263F08AB0] processInfo];
  id v1 = (id)[v0 processName];
  int v2 = [v1 isEqualToString:@"nfcd"];

  if (v2)
  {
    isEntitledForBAA_entitled = 1;
  }
  else
  {
    uint64_t v3 = dlopen("/System/Library/Frameworks/Security.framework/Security", 1);
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = (uint64_t (*)(void))dlsym(v3, "SecTaskCreateFromSelf");
      if (v5)
      {
        uint64_t v6 = v5(*MEMORY[0x263EFFB08]);
        if (v6)
        {
          long long v7 = (const void *)v6;
          long long v8 = (uint64_t (*)(const void *, __CFString *, void))dlsym(v4, "SecTaskCopyValueForEntitlement");
          if (v8)
          {
            unint64_t v9 = v8;
            unsigned int v10 = (void *)v8(v7, @"com.apple.private.applesse.allow", 0);
            id v11 = (void *)v9(v7, @"com.apple.private.applesse.baa", 0);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if ([v10 BOOLValue])
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  if ([v11 BOOLValue]) {
                    isEntitledForBAA_entitled = 1;
                  }
                }
              }
            }
          }
          CFRelease(v7);
        }
      }
      dlclose(v4);
    }
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = isEntitledForBAA_entitled;
    _os_log_impl(&dword_229313000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "isEntitledForBAA(): entitled = %u", (uint8_t *)v12, 8u);
  }
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x30u);
}

void SSEIsFeatureSupported_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEIsFeatureSupported_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEIsFeatureSupported_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEIsFeatureSupported_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetVersion_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetVersion_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetVersion_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetVersion_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void getDeviceFeatures_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void getDeviceFeatures_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void getDeviceFeatures_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void getDeviceFeatures_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void getDeviceFeatures_cold_5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void init_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void init_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void init_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void init_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void init_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void getCertificatesFromBuffer_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void getCertificatesFromBuffer_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void getCertificatesFromBuffer_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void getCertificatesFromBuffer_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void getCertificatesFromBuffer_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void getCertificatesFromBuffer_cold_6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void getCertificatesFromBuffer_cold_7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void getCertificatesFromBuffer_cold_8()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetEntangledAuthorizationRandom_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetEntangledAuthorizationRandom_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetEntangledAuthorizationRandom_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetEntangledAuthorizationRandom_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetEntangledAuthorizationRandom_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetEntangledAuthorizationRandom_cold_6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetEntangledAuthorizationRandom_cold_7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetEntangledAuthorizationRandom_cold_8()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetEntangledAuthorizationRandom_cold_9()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetEntangledAuthorizationRandom_cold_10()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetEntangledAuthorizationRandom_cold_11()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetEntangledAuthorizationRandom_cold_12()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetEntangledAuthorizationRandom_cold_13()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetAttV2AuthKey_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetAttV2AuthKey_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetAttV2AuthKey_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetAttV2AuthKey_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetAttV2AuthKey_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetAttV2AuthKey_cold_6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetAttV2AuthKey_cold_7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetAttV2AuthKey_cold_8()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetAttV2AuthKey_cold_9()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetAttV2AuthKey_cold_10()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEGetAttV2AuthKey_cold_11()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSESetSEPubKey_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSESetSEPubKey_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSESetSEPubKey_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSESetSEPubKey_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSESetSEPubKey_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSESetSEPubKey_cold_6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSESetSEPubKey_cold_7()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, 2u);
}

void SSESetSEPubKey_cold_8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEPerformAuthKeySharing_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEPerformAuthKeySharing_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEPerformAuthKeySharing_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEPerformAuthKeySharing_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEPerformAuthKeySharing_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEPerformAuthKeySharing_cold_6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEPerformAuthKeySharing_cold_7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEPerformAuthKeySharing_cold_8()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEPerformAuthKeySharing_cold_9()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEPerformAuthKeySharing_cold_10()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEPerformAuthKeySharing_cold_11()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEPerformAuthKeySharing_cold_12()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEPerformAuthKeySharing_cold_13()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEPerformAuthKeySharing_cold_14()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEPerformAuthKeySharing_cold_15()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEPerformAuthKeySharing_cold_16()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEPerformAuthKeySharing_cold_17()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void SSEPerformAuthKeySharing_cold_18()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void __baaInit_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void __baaInit_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_229313000, MEMORY[0x263EF8438], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

std::vector<std::string> *SLAM::Error::Error(std::vector<std::string> *this, const char *a2, ...)
{
  va_start(va, a2);
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  va_copy(v18, va);
  __v.__first_ = 0;
  vasprintf((char **)&__v, a2, va);
  if (__v.__first_)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)__v.__first_);
    free(__v.__first_);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "<FAILED TO VASPRINTF>");
  }
  value = this->__end_cap_.__value_;
  std::vector<std::string>::pointer end = this->__end_;
  if (end >= value)
  {
    unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)this->__begin_) >> 3);
    unint64_t v7 = v6 + 1;
    if (v6 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)this->__begin_) >> 3);
    if (2 * v8 > v7) {
      unint64_t v7 = 2 * v8;
    }
    if (v8 >= 0x555555555555555) {
      unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v9 = v7;
    }
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)&this->__end_cap_;
    if (v9) {
      unsigned int v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&this->__end_cap_, v9);
    }
    else {
      unsigned int v10 = 0;
    }
    id v11 = v10 + v6;
    __v.__first_ = v10;
    __v.__begin_ = v11;
    __v.__end_cap_.__value_ = &v10[v9];
    long long v12 = *(_OWORD *)__p;
    v11->__r_.__value_.__r.__words[2] = v17;
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
    __p[1] = 0;
    std::string::size_type v17 = 0;
    __p[0] = 0;
    __v.__end_ = v11 + 1;
    std::vector<std::string>::__swap_out_circular_buffer(this, &__v);
    uint64_t v13 = this->__end_;
    std::__split_buffer<std::string>::~__split_buffer(&__v);
    int v14 = SHIBYTE(v17);
    this->__end_ = v13;
    if (v14 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    long long v5 = *(_OWORD *)__p;
    end->__r_.__value_.__r.__words[2] = v17;
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v5;
    this->__end_ = end + 1;
  }
  return this;
}

void sub_22931BBE4(_Unwind_Exception *a1, void *__p, uint64_t a3, int a4, __int16 a5, char a6, char a7, uint64_t a8, std::__split_buffer<std::string> *a9, void *__pa, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  if (a15 < 0) {
    operator delete(__pa);
  }
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void SLAM::SLAM::PerformScript(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  _ZNSt3__115allocate_sharedB8ne180100IN4SLAM21DefaultScriptProviderENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(v13);
  uint64_t v9 = v13[0];
  unint64_t v8 = (std::__shared_weak_count *)v13[1];
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v18, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string v18 = *(std::string *)a1;
  }
  uint64_t v10 = *a2;
  id v11 = (std::__shared_weak_count *)a2[1];
  v17[0] = v10;
  v17[1] = (uint64_t)v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  long long v12 = (std::__shared_weak_count *)a3[1];
  uint64_t v15 = *a3;
  uint64_t v16 = v12;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v8)
  {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v14[0] = v9;
  v14[1] = (uint64_t)v8;
  if (!v9) {
    std::terminate();
  }
  SLAM::SLAMPrivateInterface::PerformScript((uint64_t)&v18, v17, &v15, v14, a4);
  if (v8)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v18.__r_.__value_.__l.__data_);
  }
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

#error "22931BE14: call analysis failed (funcsize=40)"

void SLAM::SLAMPrivateInterface::PerformScript(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  std::allocate_shared[abi:ne180100]<SLAM::Logger,std::allocator<SLAM::Logger>,gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&,void>(a3, &v27);
  *(unsigned char *)a5 = 0;
  *(unsigned char *)(a5 + 24) = 0;
  uint64_t v10 = (std::__shared_weak_count *)a2[1];
  uint64_t v25 = *a2;
  CFIndex v26 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v11 = (uint64_t)v27;
  long long v12 = v28;
  if (v28)
  {
    atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
    CFDataRef v24 = v12;
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    CFDataRef v24 = 0;
  }
  uint64_t v23 = v11;
  if (!v11) {
    std::terminate();
  }
  uint64_t v13 = (std::__shared_weak_count *)a4[1];
  uint64_t v21 = *a4;
  unint64_t v22 = v13;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  SLAM::Impl::Impl(__p, &v25, &v23, &v21);
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v20, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string v20 = *(std::string *)a1;
  }
  SLAM::Impl::PerformScript((SLAM::Impl *)__p, (const char *)&v20, &v32);
  std::__optional_storage_base<SLAM::Error,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<SLAM::Error,false>>((std::vector<std::string> *)a5, (uint64_t)&v32);
  if (v33)
  {
    uint64_t v29 = &v32;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v29);
  }
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v20.__r_.__value_.__l.__data_);
  }
  SLAM::Impl::~Impl((SLAM::Impl *)__p);
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }
  if (*(unsigned char *)(a5 + 24))
  {
    int v14 = (void (***)(void, std::string *))*a3;
    uint64_t v15 = (std::__shared_weak_count *)a3[1];
    if (v15) {
      atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    ctu::join<std::__wrap_iter<std::string const*>>(*(std::string **)a5, *(std::string **)(a5 + 8), ", ", 2uLL, __p);
    (**v14)(v14, __p);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p[0].__r_.__value_.__l.__data_);
    }
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
    uint64_t v16 = v27;
    uint64_t v17 = *a3;
    std::string v18 = (std::__shared_weak_count *)a3[1];
    if (v18) {
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v30[0] = &unk_26DD73260;
    v30[1] = v17;
    v30[2] = v18;
    if (v18) {
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v30[3] = v30;
    if (v16[6]) {
      uint64_t v19 = v16[4];
    }
    else {
      uint64_t v19 = 0;
    }
    std::__function::__value_func<void ()(std::string const&)>::__value_func[abi:ne180100]((uint64_t)&v32, (uint64_t)v30);
    std::for_each[abi:ne180100]<boost::cb_details::iterator<boost::circular_buffer<std::string,std::allocator<std::string>>,boost::cb_details::const_traits<std::allocator<std::string>>>,std::function<void ()(std::string const&)>>(v16 + 2, v19, 0, (uint64_t)&v32, (uint64_t)__p);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](__p);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](&v32);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](v30);
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
  }
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v28);
  }
}

#error "22931C26C: call analysis failed (funcsize=55)"

void SLAM::SLAM::PerformRecovery(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  _ZNSt3__115allocate_sharedB8ne180100IN4SLAM21DefaultScriptProviderENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(v10);
  uint64_t v6 = v10[0];
  unint64_t v7 = (std::__shared_weak_count *)v10[1];
  unint64_t v8 = (std::__shared_weak_count *)a1[1];
  v14[0] = *a1;
  v14[1] = (uint64_t)v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v9 = (std::__shared_weak_count *)a2[1];
  uint64_t v12 = *a2;
  uint64_t v13 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v7)
  {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v11[0] = v6;
  v11[1] = (uint64_t)v7;
  if (!v6) {
    std::terminate();
  }
  SLAM::SLAMPrivateInterface::PerformRecovery(v14, &v12, v11, a3);
  if (v7)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
}

#error "22931C44C: call analysis failed (funcsize=50)"

void SLAM::SLAMPrivateInterface::PerformRecovery(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  std::allocate_shared[abi:ne180100]<SLAM::Logger,std::allocator<SLAM::Logger>,gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&,void>(a2, &v24);
  *(unsigned char *)a4 = 0;
  *(unsigned char *)(a4 + 24) = 0;
  unint64_t v8 = (std::__shared_weak_count *)a1[1];
  uint64_t v22 = *a1;
  uint64_t v23 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v9 = (uint64_t)v24;
  uint64_t v10 = v25;
  if (v25)
  {
    atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v21 = v10;
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    uint64_t v21 = 0;
  }
  uint64_t v20 = v9;
  if (!v9) {
    std::terminate();
  }
  uint64_t v11 = (std::__shared_weak_count *)a3[1];
  uint64_t v18 = *a3;
  uint64_t v19 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  SLAM::Impl::Impl(__p, &v22, &v20, &v18);
  SLAM::Impl::PerformRecovery((SLAM::Impl *)__p, &v29);
  std::__optional_storage_base<SLAM::Error,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<SLAM::Error,false>>((std::vector<std::string> *)a4, (uint64_t)&v29);
  if (v30)
  {
    CFIndex v26 = &v29;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v26);
  }
  SLAM::Impl::~Impl((SLAM::Impl *)__p);
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
  if (*(unsigned char *)(a4 + 24))
  {
    SLAM::Error::Add((std::vector<std::string> *)a4, "While performing recovery");
    uint64_t v12 = (void (***)(void, std::string *))*a2;
    uint64_t v13 = (std::__shared_weak_count *)a2[1];
    if (v13) {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    ctu::join<std::__wrap_iter<std::string const*>>(*(std::string **)a4, *(std::string **)(a4 + 8), ", ", 2uLL, __p);
    (**v12)(v12, __p);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p[0].__r_.__value_.__l.__data_);
    }
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    int v14 = v24;
    uint64_t v15 = *a2;
    uint64_t v16 = (std::__shared_weak_count *)a2[1];
    if (v16) {
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v27[0] = &unk_26DD732A8;
    v27[1] = v15;
    v27[2] = v16;
    if (v16) {
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v27[3] = v27;
    if (v14[6]) {
      uint64_t v17 = v14[4];
    }
    else {
      uint64_t v17 = 0;
    }
    std::__function::__value_func<void ()(std::string const&)>::__value_func[abi:ne180100]((uint64_t)&v29, (uint64_t)v27);
    std::for_each[abi:ne180100]<boost::cb_details::iterator<boost::circular_buffer<std::string,std::allocator<std::string>>,boost::cb_details::const_traits<std::allocator<std::string>>>,std::function<void ()(std::string const&)>>(v14 + 2, v17, 0, (uint64_t)&v29, (uint64_t)__p);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](__p);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](&v29);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](v27);
    if (v16) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v16);
    }
  }
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
}

void sub_22931C740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, std::__shared_weak_count *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100]((void *)(v31 - 88));
  std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](&a20);
  if (v30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }
  if (*(unsigned char *)(v29 + 24))
  {
    a19 = v29;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  }
  if (a18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a18);
  }
  _Unwind_Resume(a1);
}

std::vector<std::string> *std::optional<SLAM::Error>::operator=[abi:ne180100]<SLAM::Error,void>(std::vector<std::string> *this, std::vector<std::string> *a2)
{
  if (LOBYTE(this[1].__begin_))
  {
    std::vector<std::string>::__vdeallocate(this);
    *(_OWORD *)&this->__begin_ = *(_OWORD *)&a2->__begin_;
    this->__end_cap_.__value_ = a2->__end_cap_.__value_;
    a2->__begin_ = 0;
    a2->__end_ = 0;
    a2->__end_cap_.__value_ = 0;
  }
  else
  {
    this->__begin_ = 0;
    this->__end_ = 0;
    this->__end_cap_.__value_ = 0;
    *this = *a2;
    a2->__begin_ = 0;
    a2->__end_ = 0;
    a2->__end_cap_.__value_ = 0;
    LOBYTE(this[1].__begin_) = 1;
  }
  return this;
}

std::vector<std::string> *SLAM::Error::Add(std::vector<std::string> *this, const char *a2, ...)
{
  va_start(va, a2);
  va_copy(v18, va);
  __v.__first_ = 0;
  vasprintf((char **)&__v, a2, va);
  if (__v.__first_)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)__v.__first_);
    free(__v.__first_);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "<FAILED TO VASPRINTF>");
  }
  value = this->__end_cap_.__value_;
  std::vector<std::string>::pointer end = this->__end_;
  if (end >= value)
  {
    unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)this->__begin_) >> 3);
    unint64_t v7 = v6 + 1;
    if (v6 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)this->__begin_) >> 3);
    if (2 * v8 > v7) {
      unint64_t v7 = 2 * v8;
    }
    if (v8 >= 0x555555555555555) {
      unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v9 = v7;
    }
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)&this->__end_cap_;
    if (v9) {
      uint64_t v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&this->__end_cap_, v9);
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = v10 + v6;
    __v.__first_ = v10;
    __v.__begin_ = v11;
    __v.__end_cap_.__value_ = &v10[v9];
    long long v12 = *(_OWORD *)__p;
    v11->__r_.__value_.__r.__words[2] = v17;
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
    __p[1] = 0;
    std::string::size_type v17 = 0;
    __p[0] = 0;
    __v.__end_ = v11 + 1;
    std::vector<std::string>::__swap_out_circular_buffer(this, &__v);
    uint64_t v13 = this->__end_;
    std::__split_buffer<std::string>::~__split_buffer(&__v);
    int v14 = SHIBYTE(v17);
    this->__end_ = v13;
    if (v14 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    long long v5 = *(_OWORD *)__p;
    end->__r_.__value_.__r.__words[2] = v17;
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v5;
    this->__end_ = end + 1;
  }
  return this;
}

void sub_22931CAA8(_Unwind_Exception *a1, void *__p, uint64_t a3, int a4, __int16 a5, char a6, char a7, uint64_t a8, std::__split_buffer<std::string> *a9, void *__pa, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  if (a15 < 0) {
    operator delete(__pa);
  }
  _Unwind_Resume(a1);
}

void SLAM::Impl::PerformScript(SLAM::Impl *a1@<X0>, const char *a2@<X1>, std::string *a3@<X8>)
{
  void (***v10)(void ***__return_ptr, void, std::string *, void **, uint64_t);
  std::__shared_weak_count *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  void *v17[2];
  char v18;
  std::string v19;
  void *__p;
  void *v21;
  uint64_t v22;
  std::string v23;
  void *v24;
  unsigned char *v25;
  uint64_t v26;
  long long *v27;
  long long *v28;
  char v29;
  void **v30;
  long long *v31;
  char v32;
  long long *v33;
  long long *v34;
  char v35;
  uint64_t v36;

  v36 = *MEMORY[0x263EF8340];
  SLAM::Impl::GetChipId(a1, (uint64_t)&v27);
  if (!v29)
  {
    a3->__r_.__value_.__r.__words[0] = 0;
    a3->__r_.__value_.__l.__size_ = 0;
    a3->__r_.__value_.__r.__words[2] = 0;
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a3, v27, v28, 0xAAAAAAAAAAAAAAABLL * (((char *)v28 - (char *)v27) >> 3));
    a3[1].__r_.__value_.__s.__data_[0] = 1;
    goto LABEL_42;
  }
  unsigned int v6 = *(unsigned __int8 *)caulk::expected<unsigned char,SLAM::Error>::value((uint64_t)&v27);
  uint64_t v7 = 1;
  if (v6 > 0xC7)
  {
    if (v6 == 200 || v6 == 210) {
      goto LABEL_10;
    }
  }
  else if (v6 == 100 || v6 == 115)
  {
    goto LABEL_10;
  }
  uint64_t v7 = 2;
LABEL_10:
  SLAM::Impl::QueryMigrationInfo(a1, (uint64_t)&v33);
  if (v35)
  {
    uint64_t v8 = caulk::expected<SLAM::MigrationInfo,SLAM::Error>::value((uint64_t)&v33);
    CFDataRef v24 = 0;
    uint64_t v25 = 0;
    CFIndex v26 = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v24, *(const void **)(v8 + 16), *(void *)(v8 + 24), *(void *)(v8 + 24) - *(void *)(v8 + 16));
    uint64_t v10 = (void (***)(void ***__return_ptr, void, std::string *, void **, uint64_t))*((void *)a1 + 6);
    unint64_t v9 = (std::__shared_weak_count *)*((void *)a1 + 7);
    if (v9) {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (a2[23] < 0) {
      std::string::__init_copy_ctor_external(&v23, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    }
    else {
      uint64_t v23 = *(std::string *)a2;
    }
    __p = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v24, (uint64_t)v25, v25 - (unsigned char *)v24);
    (**v10)(&v30, v10, &v23, &__p, v7);
    if (__p)
    {
      uint64_t v21 = __p;
      operator delete(__p);
    }
    if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v23.__r_.__value_.__l.__data_);
    }
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
    if (v32)
    {
      long long v12 = *((void *)a1 + 8);
      uint64_t v11 = (std::__shared_weak_count *)*((void *)a1 + 9);
      if (v11) {
        atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (a2[23] < 0) {
        a2 = *(const char **)a2;
      }
      uint64_t v13 = (void *)caulk::expected<SLAM::Script,SLAM::Error>::value((uint64_t)&v30);
      SLAM::Logger::Log(v12, 1, (uint64_t)"PerformScript", 179, "Executing script %s ID 0x%llX", a2, *v13);
      if (v11) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v11);
      }
      int v14 = caulk::expected<SLAM::Script,SLAM::Error>::value((uint64_t)&v30);
      uint64_t v15 = caulk::expected<SLAM::MigrationInfo,SLAM::Error>::value((uint64_t)&v33);
      (*(void (**)(SLAM::Impl *, uint64_t, uint64_t))(*(void *)a1 + 16))(a1, v14, v15);
    }
    else
    {
      memset(&v19, 0, sizeof(v19));
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v19, (long long *)v30, v31, 0xAAAAAAAAAAAAAAABLL * (((char *)v31 - (char *)v30) >> 3));
      if (a2[23] < 0) {
        a2 = *(const char **)a2;
      }
      ctu::hex();
      if (v18 >= 0) {
        uint64_t v16 = v17;
      }
      else {
        uint64_t v16 = (void **)v17[0];
      }
      SLAM::Error::Add((std::vector<std::string> *)&v19, "with name %s, pkHash %s, platformCategory %d", a2, (const char *)v16, v7);
      if (v18 < 0) {
        operator delete(v17[0]);
      }
      *a3 = v19;
      memset(&v19, 0, sizeof(v19));
      a3[1].__r_.__value_.__s.__data_[0] = 1;
      v17[0] = &v19;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v17);
    }
    caulk::__expected_detail::base<SLAM::Script,SLAM::Error>::~base((uint64_t)&v30);
    if (v24)
    {
      uint64_t v25 = v24;
      operator delete(v24);
    }
  }
  else
  {
    a3->__r_.__value_.__r.__words[0] = 0;
    a3->__r_.__value_.__l.__size_ = 0;
    a3->__r_.__value_.__r.__words[2] = 0;
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a3, v33, v34, 0xAAAAAAAAAAAAAAABLL * (((char *)v34 - (char *)v33) >> 3));
    a3[1].__r_.__value_.__s.__data_[0] = 1;
  }
  caulk::__expected_detail::base<SLAM::MigrationInfo,SLAM::Error>::~base((uint64_t)&v33);
LABEL_42:
  if (!v29)
  {
    char v30 = (void **)&v27;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v30);
  }
}

void sub_22931CE80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,char a36,char *a37)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  __p = &a18;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  caulk::__expected_detail::base<SLAM::Script,SLAM::Error>::~base((uint64_t)&a37);
  if (a30)
  {
    a31 = (uint64_t)a30;
    operator delete(a30);
  }
  caulk::__expected_detail::base<SLAM::MigrationInfo,SLAM::Error>::~base(v37 - 128);
  if (!a36)
  {
    a37 = &a33;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a37);
  }
  _Unwind_Resume(a1);
}

uint64_t SLAM::Impl::PerformRecovery@<X0>(SLAM::Impl *this@<X0>, std::string *a2@<X8>)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  SLAM::Impl::QueryMigrationInfo(this, (uint64_t)&v7);
  if (v9)
  {
    v5[0] = this;
    v5[1] = this;
    if (v8 == -1) {
      std::__throw_bad_variant_access[abi:ne180100]();
    }
    unsigned int v6 = v5;
    ((void (*)(void **, long long **))off_26DD731B8[v8])(&v6, &v7);
  }
  else
  {
    a2->__r_.__value_.__r.__words[0] = 0;
    a2->__r_.__value_.__l.__size_ = 0;
    a2->__r_.__value_.__r.__words[2] = 0;
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a2, v7, v8, 0xAAAAAAAAAAAAAAABLL * (((char *)v8 - (char *)v7) >> 3));
    a2[1].__r_.__value_.__s.__data_[0] = 1;
  }
  return caulk::__expected_detail::base<SLAM::MigrationInfo,SLAM::Error>::~base((uint64_t)&v7);
}

void sub_22931D054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  caulk::__expected_detail::base<SLAM::MigrationInfo,SLAM::Error>::~base((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t SLAM::Impl::QueryMigrationInfo@<X0>(SLAM::Impl *this@<X0>, uint64_t a2@<X8>)
{
  void (***v3)(long long *__return_ptr);
  char *v4;
  unsigned char *v5;
  unint64_t *v6;
  void *v7;
  unint64_t *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  BOOL v15;
  void *v16;
  const void *v17;
  long long v18;
  std::string::size_type v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  BOOL v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  BOOL v34;
  void *v35;
  unsigned int v36;
  long long **v37;
  long long **v38;
  long long **v39;
  long long **v40;
  long long **v41;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  BOOL v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  unint64_t v56;
  BOOL v57;
  void *v58;
  unsigned int v59;
  unint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  unint64_t v67;
  BOOL v68;
  void *v69;
  std::string v70;
  std::string v71;
  char v72;
  std::string __p;
  char v74;
  std::vector<std::string> v75;
  char v76;
  std::string *v77;
  std::string v78;
  std::string v79;
  char v80;
  uint64_t v81;

  v81 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void (***)(long long *__return_ptr))((char *)this + 8);
  uint64_t v4 = (char *)operator new(0xEuLL);
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)(v4 + 14);
  __p.__r_.__value_.__r.__words[2] = (std::string::size_type)(v4 + 14);
  *(void *)uint64_t v4 = 0xA0080004A400;
  *((_WORD *)v4 + 4) = 20737;
  *(_DWORD *)(v4 + 10) = 0;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v4;
  SLAM::TransceiverWrapper::TransceiveAndCheckSW(v3, (uint64_t)&v75);
  if (__p.__r_.__value_.__r.__words[0])
  {
    __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v76)
  {
    caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v75);
    long long v5 = operator new(5uLL);
    __p.__r_.__value_.__l.__size_ = (std::string::size_type)(v5 + 5);
    __p.__r_.__value_.__r.__words[2] = (std::string::size_type)(v5 + 5);
    *(_DWORD *)long long v5 = 240256;
    v5[4] = 0;
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v5;
    SLAM::TransceiverWrapper::TransceiveAndCheckSW(v3, (uint64_t)&v75);
    if (__p.__r_.__value_.__r.__words[0])
    {
      __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v76)
    {
      unsigned int v6 = (unint64_t *)caulk::expected<std::vector<unsigned char>,SLAM::Error>::value((uint64_t)&v75);
      v79.__r_.__value_.__r.__words[0] = 0xC000000000000000;
      SLAM::DERParseSequenceToMap(v6, (uint64_t *)&v79, 1, (uint64_t)&__p);
      if (!v74)
      {
        v39 = (long long **)SLAM::Error::Add((std::vector<std::string> *)&__p, "While parsing migration state");
        memset(&v79, 0, sizeof(v79));
        std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v79, *v39, v39[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v39[1] - (char *)*v39) >> 3));
        SLAM::Error::Unexpected((long long **)&v79, &v71);
        *(std::string *)a2 = v71;
        memset(&v71, 0, sizeof(v71));
        *(unsigned char *)(a2 + 48) = 0;
        v78.__r_.__value_.__r.__words[0] = (std::string::size_type)&v71;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v78);
        v71.__r_.__value_.__r.__words[0] = (std::string::size_type)&v79;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v71);
LABEL_60:
        caulk::__expected_detail::base<std::map<unsigned long long,DERItem>,SLAM::Error>::~base((uint64_t)&__p);
        return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v75);
      }
      uint64_t v7 = operator new(8uLL);
      v71.__r_.__value_.__r.__words[0] = (std::string::size_type)v7;
      *uint64_t v7 = 0x53DF02FE00CA80;
      v71.__r_.__value_.__l.__size_ = (std::string::size_type)(v7 + 1);
      v71.__r_.__value_.__r.__words[2] = (std::string::size_type)(v7 + 1);
      SLAM::TransceiverWrapper::TransceiveAndCheckSW(v3, (uint64_t)&v79);
      if (v71.__r_.__value_.__r.__words[0])
      {
        v71.__r_.__value_.__l.__size_ = v71.__r_.__value_.__r.__words[0];
        operator delete(v71.__r_.__value_.__l.__data_);
      }
      if (!v80)
      {
        v40 = (long long **)SLAM::Error::Add((std::vector<std::string> *)&v79, "While querying SLAM state");
        SLAM::Error::Unexpected(v40, &v71);
        *(std::string *)a2 = v71;
        memset(&v71, 0, sizeof(v71));
        *(unsigned char *)(a2 + 48) = 0;
        v78.__r_.__value_.__r.__words[0] = (std::string::size_type)&v71;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v78);
LABEL_59:
        caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v79);
        goto LABEL_60;
      }
      uint64_t v8 = (unint64_t *)caulk::expected<std::vector<unsigned char>,SLAM::Error>::value((uint64_t)&v79);
      *(_OWORD *)&v78.__r_.__value_.__l.__data_ = xmmword_229369BA0;
      SLAM::DERParseSequenceToMap(v8, (uint64_t *)&v78, 2, (uint64_t)&v71);
      if (v72)
      {
        char v9 = caulk::expected<std::map<unsigned long long,DERItem>,SLAM::Error>::value((uint64_t)&v71);
        long long v12 = *(void **)(v9 + 8);
        uint64_t v10 = (void *)(v9 + 8);
        uint64_t v11 = v12;
        if (v12)
        {
          uint64_t v13 = v10;
          do
          {
            int v14 = v11[4];
            uint64_t v15 = v14 >= 0x8000000000000003;
            if (v14 >= 0x8000000000000003) {
              uint64_t v16 = v11;
            }
            else {
              uint64_t v16 = v11 + 1;
            }
            if (v15) {
              uint64_t v13 = v11;
            }
            uint64_t v11 = (void *)*v16;
          }
          while (*v16);
          if (v13 != v10 && v13[4] <= 0x8000000000000003 && v13[6] == 32)
          {
            std::string::size_type v17 = (const void *)v13[5];
            memset(&v78, 0, sizeof(v78));
            std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v78, v17, (uint64_t)v17 + 32, 0x20uLL);
            va_list v18 = *(_OWORD *)&v78.__r_.__value_.__l.__data_;
            uint64_t v19 = v78.__r_.__value_.__r.__words[2];
            uint64_t v20 = caulk::expected<std::map<unsigned long long,DERItem>,SLAM::Error>::value((uint64_t)&v71);
            uint64_t v23 = *(void **)(v20 + 8);
            uint64_t v21 = v20 + 8;
            uint64_t v22 = v23;
            if (!v23) {
              goto LABEL_62;
            }
            CFDataRef v24 = (void *)v21;
            do
            {
              uint64_t v25 = v22[4];
              CFIndex v26 = v25 < 0;
              if (v25 < 0) {
                CFDataRef v27 = v22;
              }
              else {
                CFDataRef v27 = v22 + 1;
              }
              if (v26) {
                CFDataRef v24 = v22;
              }
              uint64_t v22 = (void *)*v27;
            }
            while (*v27);
            if (v24 == (void *)v21 || v24[4] > 0x8000000000000000 || v24[6] != 1)
            {
LABEL_62:
              SLAM::Error::Unexpected((SLAM::Error *)"Missing or wrong length tag 0x%llx", (uint64_t)&v78, 0x8000000000000000);
              goto LABEL_63;
            }
            if (*(unsigned __int8 *)v24[5] < 2u)
            {
              v36 = 0;
            }
            else
            {
              uint64_t v28 = caulk::expected<std::map<unsigned long long,DERItem>,SLAM::Error>::value((uint64_t)&v71);
              uint64_t v31 = *(void **)(v28 + 8);
              uint64_t v29 = v28 + 8;
              char v30 = v31;
              if (!v31) {
                goto LABEL_82;
              }
              std::string v32 = (void *)v29;
              do
              {
                char v33 = v30[4];
                uint64_t v34 = v33 >= 0x8000000000000004;
                if (v33 >= 0x8000000000000004) {
                  v35 = v30;
                }
                else {
                  v35 = v30 + 1;
                }
                if (v34) {
                  std::string v32 = v30;
                }
                char v30 = (void *)*v35;
              }
              while (*v35);
              if (v32 == (void *)v29 || v32[4] > 0x8000000000000004 || v32[6] != 2)
              {
LABEL_82:
                SLAM::Error::Unexpected((SLAM::Error *)"Missing or wrong length tag 0x%llx", (uint64_t)&v78, 0x8000000000000004);
                goto LABEL_63;
              }
              v36 = bswap32(*(unsigned __int16 *)v32[5]) >> 16;
            }
            v43 = caulk::expected<std::map<unsigned long long,DERItem>,SLAM::Error>::value((uint64_t)&__p);
            v46 = *(void **)(v43 + 8);
            v44 = v43 + 8;
            v45 = v46;
            if (!v46) {
              goto LABEL_81;
            }
            v47 = (void *)v44;
            do
            {
              v48 = v45[4];
              v49 = v48 >= 0xC000000000000009;
              if (v48 >= 0xC000000000000009) {
                v50 = v45;
              }
              else {
                v50 = v45 + 1;
              }
              if (v49) {
                v47 = v45;
              }
              v45 = (void *)*v50;
            }
            while (*v50);
            if (v47 != (void *)v44 && v47[4] <= 0xC000000000000009 && v47[6] == 2)
            {
              if (*(_WORD *)v47[5] == 23130)
              {
                *(void *)a2 = 0;
                *(void *)(a2 + 8) = 1;
LABEL_80:
                *(_OWORD *)(a2 + 16) = v18;
                *(void *)(a2 + 32) = v19;
                *(_DWORD *)(a2 + 40) = v36;
                *(unsigned char *)(a2 + 48) = 1;
                goto LABEL_58;
              }
              v51 = caulk::expected<std::map<unsigned long long,DERItem>,SLAM::Error>::value((uint64_t)&__p);
              v54 = *(void **)(v51 + 8);
              v52 = v51 + 8;
              v53 = v54;
              if (!v54) {
                goto LABEL_99;
              }
              v55 = (void *)v52;
              do
              {
                v56 = v53[4];
                v57 = v56 >= 0xC00000000000000BLL;
                if (v56 >= 0xC00000000000000BLL) {
                  v58 = v53;
                }
                else {
                  v58 = v53 + 1;
                }
                if (v57) {
                  v55 = v53;
                }
                v53 = (void *)*v58;
              }
              while (*v58);
              if (v55 != (void *)v52 && v55[4] <= 0xC00000000000000BLL && v55[6] == 2)
              {
                v59 = bswap32(*(unsigned __int16 *)v55[5]) >> 16;
                if (v59 != 13260)
                {
                  if (v59 == 52275)
                  {
                    v60 = 0;
                    v61 = 3;
                  }
                  else if (v59 == 42405)
                  {
                    v60 = 0;
                    v61 = 2;
                  }
                  else
                  {
                    v61 = 0;
                    v60 = 0;
                  }
                  goto LABEL_115;
                }
                v62 = caulk::expected<std::map<unsigned long long,DERItem>,SLAM::Error>::value((uint64_t)&v71);
                v65 = *(void **)(v62 + 8);
                v63 = v62 + 8;
                v64 = v65;
                if (v65)
                {
                  v66 = (void *)v63;
                  do
                  {
                    v67 = v64[4];
                    v68 = v67 >= 0x8000000000000002;
                    if (v67 >= 0x8000000000000002) {
                      v69 = v64;
                    }
                    else {
                      v69 = v64 + 1;
                    }
                    if (v68) {
                      v66 = v64;
                    }
                    v64 = (void *)*v69;
                  }
                  while (*v69);
                  if (v66 != (void *)v63 && v66[4] <= 0x8000000000000002 && v66[6] == 8)
                  {
                    v60 = bswap64(*(void *)v66[5]);
                    v61 = 4;
LABEL_115:
                    *(void *)a2 = v60;
                    *(_DWORD *)(a2 + 8) = v61;
                    *(_DWORD *)(a2 + 12) = 0;
                    goto LABEL_80;
                  }
                }
                SLAM::Error::Unexpected((SLAM::Error *)"Missing or wrong length tag 0x%llx", (uint64_t)&v78, 0x8000000000000002);
              }
              else
              {
LABEL_99:
                SLAM::Error::Unexpected((SLAM::Error *)"Missing or wrong length tag 0x%llx", (uint64_t)&v78, 0xC00000000000000BLL);
              }
            }
            else
            {
LABEL_81:
              SLAM::Error::Unexpected((SLAM::Error *)"Missing or wrong length tag 0x%llx", (uint64_t)&v78, 0xC000000000000009);
            }
LABEL_63:
            *(std::string *)a2 = v78;
            memset(&v78, 0, sizeof(v78));
            *(unsigned char *)(a2 + 48) = 0;
            v70.__r_.__value_.__r.__words[0] = (std::string::size_type)&v78;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v70);
            if ((void)v18) {
              operator delete((void *)v18);
            }
            goto LABEL_58;
          }
        }
        SLAM::Error::Unexpected((SLAM::Error *)"Missing or wrong length tag 0x%llx", (uint64_t)&v78, 0x8000000000000003);
        *(std::string *)a2 = v78;
        memset(&v78, 0, sizeof(v78));
        *(unsigned char *)(a2 + 48) = 0;
      }
      else
      {
        v41 = (long long **)SLAM::Error::Add((std::vector<std::string> *)&v71, "While parsing the respons from SLAM state");
        memset(&v78, 0, sizeof(v78));
        std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v78, *v41, v41[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v41[1] - (char *)*v41) >> 3));
        SLAM::Error::Unexpected((long long **)&v78, &v70);
        *(std::string *)a2 = v70;
        memset(&v70, 0, sizeof(v70));
        *(unsigned char *)(a2 + 48) = 0;
        v77 = &v70;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v77);
      }
      v70.__r_.__value_.__r.__words[0] = (std::string::size_type)&v78;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v70);
LABEL_58:
      caulk::__expected_detail::base<std::map<unsigned long long,DERItem>,SLAM::Error>::~base((uint64_t)&v71);
      goto LABEL_59;
    }
    v38 = (long long **)SLAM::Error::Add(&v75, "While querying migration state");
    SLAM::Error::Unexpected(v38, &__p);
  }
  else
  {
    uint64_t v37 = (long long **)SLAM::Error::Add(&v75, "While selecting ISD");
    SLAM::Error::Unexpected(v37, &__p);
  }
  *(std::string *)a2 = __p;
  memset(&__p, 0, sizeof(__p));
  *(unsigned char *)(a2 + 48) = 0;
  v79.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v79);
  return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v75);
}

void sub_22931D838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  if (v24) {
    operator delete(v24);
  }
  caulk::__expected_detail::base<std::map<unsigned long long,DERItem>,SLAM::Error>::~base((uint64_t)&__p);
  caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base(v25 - 88);
  caulk::__expected_detail::base<std::map<unsigned long long,DERItem>,SLAM::Error>::~base((uint64_t)&a19);
  caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&a24);
  _Unwind_Resume(a1);
}

uint64_t caulk::expected<SLAM::Script,SLAM::Error>::value(uint64_t result)
{
  uint64_t v1 = (long long **)result;
  if (!*(unsigned char *)(result + 72))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    memset(&v3, 0, sizeof(v3));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v3, *v1, v1[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v1[1] - (char *)*v1) >> 3));
    caulk::bad_expected_access<SLAM::Error>::bad_expected_access((uint64_t)exception, (long long **)&v3);
  }
  return result;
}

void sub_22931D9E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

uint64_t caulk::expected<SLAM::MigrationInfo,SLAM::Error>::value(uint64_t result)
{
  uint64_t v1 = (long long **)result;
  if (!*(unsigned char *)(result + 48))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    memset(&v3, 0, sizeof(v3));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v3, *v1, v1[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v1[1] - (char *)*v1) >> 3));
    caulk::bad_expected_access<SLAM::Error>::bad_expected_access((uint64_t)exception, (long long **)&v3);
  }
  return result;
}

void sub_22931DAC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

uint64_t SLAM::Impl::GetChipId@<X0>(SLAM::Impl *this@<X0>, uint64_t a2@<X8>)
{
  void (***v4)(long long *__return_ptr);
  char *v5;
  char *v6;
  void *v7;
  uint64_t v8;
  long long **v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  char v12;
  long long v14;
  uint64_t v15;
  void v16[2];
  void *p_p;
  unsigned char *v18;
  unint64_t v19;
  std::string __p;
  char v21;
  std::vector<std::string> v22;
  char v23;
  void **v24;

  uint64_t v4 = (void (***)(long long *__return_ptr))((char *)this + 8);
  long long v5 = (char *)operator new(0xEuLL);
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)(v5 + 14);
  __p.__r_.__value_.__r.__words[2] = (std::string::size_type)(v5 + 14);
  *(void *)long long v5 = 0xA0080004A400;
  *((_WORD *)v5 + 4) = 20737;
  *(_DWORD *)(v5 + 10) = 0;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v5;
  SLAM::TransceiverWrapper::TransceiveAndCheckSW(v4, (uint64_t)&v22);
  if (__p.__r_.__value_.__r.__words[0])
  {
    __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v23)
  {
    unsigned int v6 = (char *)operator new(5uLL);
    va_list v18 = v6 + 5;
    uint64_t v19 = (unint64_t)(v6 + 5);
    *(_DWORD *)unsigned int v6 = 2141178496;
    v6[4] = 0;
    p_p = v6;
    SLAM::TransceiverWrapper::TransceiveAndCheckSW(v4, (uint64_t)&__p);
    if (p_p)
    {
      va_list v18 = p_p;
      operator delete(p_p);
    }
    if (v21)
    {
      p_p = 0;
      va_list v18 = 0;
      uint64_t v19 = 0;
      v16[0] = *(void *)caulk::expected<std::vector<unsigned char>,SLAM::Error>::value((uint64_t)&__p);
      uint64_t v7 = (void *)caulk::expected<std::vector<unsigned char>,SLAM::Error>::value((uint64_t)&__p);
      v16[1] = v7[1] - *v7;
      uint64_t v8 = DERDecodeItem((uint64_t)v16, (unint64_t *)&p_p);
      if (v8)
      {
        SLAM::Error::Unexpected((SLAM::Error *)"Failed to decode CPLC data top level tag %d", (uint64_t)&v14, v8);
LABEL_20:
        *(_OWORD *)a2 = v14;
        *(void *)(a2 + 16) = v15;
        uint64_t v15 = 0;
        int v14 = 0uLL;
        *(unsigned char *)(a2 + 24) = 0;
        CFDataRef v24 = (void **)&v14;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v24);
        goto LABEL_21;
      }
      if (p_p != (void *)0x800000000000007FLL)
      {
        SLAM::Error::Unexpected((SLAM::Error *)"Unexpected CPLC data top level tag %llu", (uint64_t)&v14, p_p);
        goto LABEL_20;
      }
      if (v19 <= 3)
      {
        SLAM::Error::Unexpected((SLAM::Error *)"Unexpected length for CPLC data %zu", (uint64_t)&v14, v19);
        goto LABEL_20;
      }
      long long v12 = v18[3];
    }
    else
    {
      uint64_t v10 = *((void *)this + 8);
      uint64_t v11 = (std::__shared_weak_count *)*((void *)this + 9);
      if (v11) {
        atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      SLAM::Logger::Log(v10, 1, (uint64_t)"GetChipId", 477, "Failed to read CPLC data; defaulting to SN210V");
      if (v11) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v11);
      }
      long long v12 = -46;
    }
    *(unsigned char *)a2 = v12;
    *(unsigned char *)(a2 + 24) = 1;
LABEL_21:
    caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&__p);
    return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v22);
  }
  char v9 = (long long **)SLAM::Error::Add(&v22, "Failed to select ISD");
  SLAM::Error::Unexpected(v9, &__p);
  *(std::string *)a2 = __p;
  memset(&__p, 0, sizeof(__p));
  *(unsigned char *)(a2 + 24) = 0;
  p_p = &__p;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_p);
  return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v22);
}

void sub_22931DD60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, char a19)
{
  caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&a19);
  caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base(v19 - 72);
  _Unwind_Resume(a1);
}

void sub_22931DDC4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20)
{
  if (__p) {
    operator delete(__p);
  }
  JUMPOUT(0x22931DDBCLL);
}

uint64_t caulk::expected<unsigned char,SLAM::Error>::value(uint64_t result)
{
  uint64_t v1 = (long long **)result;
  if (!*(unsigned char *)(result + 24))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    memset(&v3, 0, sizeof(v3));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v3, *v1, v1[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v1[1] - (char *)*v1) >> 3));
    caulk::bad_expected_access<SLAM::Error>::bad_expected_access((uint64_t)exception, (long long **)&v3);
  }
  return result;
}

void sub_22931DE80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

void SLAM::Logger::Log(uint64_t a1, int a2, uint64_t a3, uint64_t a4, char *a5, ...)
{
  va_start(va, a5);
  va_copy(v15, va);
  __s.__r_.__value_.__r.__words[0] = 0;
  vasprintf(&__s.__r_.__value_.__l.__data_, a5, va);
  if (__s.__r_.__value_.__r.__words[0])
  {
    std::string::basic_string[abi:ne180100]<0>(__p, __s.__r_.__value_.__l.__data_);
    free(__s.__r_.__value_.__l.__data_);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "<FAILED TO VASPRINTF>");
  }
  char v9 = __p;
  if (v14 < 0) {
    char v9 = (void **)__p[0];
  }
  SLAM::StringUtil::Format((SLAM::StringUtil *)"%s/%d : %s", &__s, a3, a4, v9);
  boost::circular_buffer<std::string,std::allocator<std::string>>::push_back_impl<std::string const&>(a1 + 16, &__s);
  if (a2 == 1)
  {
    uint64_t v10 = *(void (****)(void, std::string *))a1;
    uint64_t v11 = *(std::__shared_weak_count **)(a1 + 8);
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    (**v10)(v10, &__s);
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
  if (v14 < 0) {
    operator delete(__p[0]);
  }
}

void sub_22931DFEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  _Unwind_Resume(exception_object);
}

void SLAM::Impl::PerformScript(std::string::size_type a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  std::string::size_type v5 = *a2;
  v18.__r_.__value_.__r.__words[0] = a1;
  v18.__r_.__value_.__l.__size_ = a1;
  v18.__r_.__value_.__r.__words[2] = v5;
  uint64_t v6 = *(unsigned int *)(a3 + 8);
  if (v6 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  v22[0] = &v18;
  ((void (*)(long long *__return_ptr, void **, uint64_t))off_26DD73190[v6])(&v24, v22, a3);
  if (v26)
  {
    *(_OWORD *)&a4->__r_.__value_.__l.__data_ = v24;
    a4->__r_.__value_.__r.__words[2] = v25;
    std::string::size_type v25 = 0;
    long long v24 = 0uLL;
    a4[1].__r_.__value_.__s.__data_[0] = 1;
  }
  else
  {
    uint64_t v10 = *(const void **)(a3 + 16);
    size_t v11 = *(void *)(a3 + 24) - (void)v10;
    long long v12 = (const void *)a2[1];
    if (v11 == a2[2] - (void)v12 && !memcmp(v10, v12, v11))
    {
      SLAM::Impl::ExecuteScript(a1, a2 + 5, &v18);
      if (v19)
      {
        std::string::size_type v17 = (long long **)SLAM::Error::Add((std::vector<std::string> *)&v18, "While executing script 0x%llx", v5);
        a4->__r_.__value_.__r.__words[0] = 0;
        a4->__r_.__value_.__l.__size_ = 0;
        a4->__r_.__value_.__r.__words[2] = 0;
        std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a4, *v17, v17[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v17[1] - (char *)*v17) >> 3));
        a4[1].__r_.__value_.__s.__data_[0] = 1;
        if (v19)
        {
          v22[0] = &v18;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v22);
        }
      }
      else
      {
        a4->__r_.__value_.__s.__data_[0] = 0;
        a4[1].__r_.__value_.__s.__data_[0] = 0;
      }
    }
    else
    {
      ctu::hex();
      int v13 = v23;
      char v14 = (void **)v22[0];
      ctu::hex();
      va_list v15 = v22;
      if (v13 < 0) {
        va_list v15 = v14;
      }
      if (v21 >= 0) {
        p_p = (const char *)&__p;
      }
      else {
        p_p = (const char *)__p;
      }
      SLAM::Error::Error((std::vector<std::string> *)&v18, "Mismatched signing keys device %s script %s", (const char *)v15, p_p);
      *a4 = v18;
      memset(&v18, 0, sizeof(v18));
      a4[1].__r_.__value_.__s.__data_[0] = 1;
      CFDataRef v27 = &v18;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v27);
      if (v21 < 0) {
        operator delete(__p);
      }
      if (v23 < 0) {
        operator delete(v22[0]);
      }
    }
  }
  if (v26)
  {
    v18.__r_.__value_.__r.__words[0] = (std::string::size_type)&v24;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v18);
  }
}

void sub_22931E248(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char *a11, uint64_t a12, uint64_t a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,char a27,uint64_t a28,uint64_t a29,char a30)
{
  if (a30)
  {
    a11 = &a27;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a11);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SLAM::Impl::ExecuteScript@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  if (v5 != *a2)
  {
    uint64_t v7 = result;
    LODWORD(v8) = 0;
    unint64_t v9 = (v5 - *a2) >> 3;
    uint64_t v10 = (void *)(result + 8);
    do
    {
      int v11 = 0;
      while (1)
      {
        SLAM::TransceiverWrapper::Transceive(v10, v4, (uint64_t)&v21);
        if (!v22)
        {
          char v19 = (long long **)SLAM::Error::Add(&v21, "While executing APDU %d", v11);
          a3->__r_.__value_.__r.__words[0] = 0;
          a3->__r_.__value_.__l.__size_ = 0;
          a3->__r_.__value_.__r.__words[2] = 0;
          std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a3, *v19, v19[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v19[1] - (char *)*v19) >> 3));
          a3[1].__r_.__value_.__s.__data_[0] = 1;
          return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v21);
        }
        long long v12 = (void *)caulk::expected<std::vector<unsigned char>,SLAM::Error>::value((uint64_t)&v21);
        uint64_t v13 = v12[1];
        if ((unint64_t)(v13 - *v12) < 2)
        {
          unsigned int v15 = 49068;
LABEL_23:
          SLAM::Error::Error(&__p, "Failed SW 0x%hX at idx %d", v15, v11);
          *(std::vector<std::string> *)a3 = __p;
          memset(&__p, 0, sizeof(__p));
          a3[1].__r_.__value_.__s.__data_[0] = 1;
          p_p = &__p;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_p);
          return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v21);
        }
        unsigned int v14 = *(unsigned __int16 *)(v13 - 2);
        unsigned int v15 = __rev16(v14);
        if ((v15 & 0xFFF0) == 0x63C0)
        {
          unint64_t v8 = (v8 + 1);
          if (v9 > v8) {
            break;
          }
        }
        if (v14 != 144) {
          goto LABEL_23;
        }
        uint64_t result = caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v21);
        v4 += 24;
        ++v11;
        if (v4 == v5) {
          goto LABEL_20;
        }
      }
      uint64_t v17 = *(void *)(v7 + 64);
      uint64_t v16 = *(std::__shared_weak_count **)(v7 + 72);
      if (v16) {
        atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      caulk::expected<std::vector<unsigned char>,SLAM::Error>::value((uint64_t)&v21);
      ctu::hex();
      std::vector<std::string>::pointer begin = (std::vector<std::string>::pointer)&__p;
      if (SHIBYTE(__p.__end_cap_.__value_) < 0) {
        std::vector<std::string>::pointer begin = __p.__begin_;
      }
      SLAM::Logger::Log(v17, 1, (uint64_t)"ExecuteScript", 292, "Warning APDU: %s idx %d replaying %d", (const char *)begin, v11, v8);
      if (SHIBYTE(__p.__end_cap_.__value_) < 0) {
        operator delete(__p.__begin_);
      }
      if (v16) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v16);
      }
      uint64_t result = caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v21);
      uint64_t v4 = *a2;
      uint64_t v5 = a2[1];
    }
    while (*a2 != v5);
  }
LABEL_20:
  a3->__r_.__value_.__s.__data_[0] = 0;
  a3[1].__r_.__value_.__s.__data_[0] = 0;
  return result;
}

void sub_22931E4D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&a19);
  _Unwind_Resume(a1);
}

void SLAM::TransceiverWrapper::Transceive(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = a1[3];
  uint64_t v6 = (std::__shared_weak_count *)a1[4];
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ctu::hex();
  if (v15 >= 0) {
    unint64_t v8 = __p;
  }
  else {
    unint64_t v8 = (void **)__p[0];
  }
  SLAM::Logger::Log(v7, 0, (uint64_t)"Transceive", 49, "> %s", (const char *)v8);
  if (v15 < 0) {
    operator delete(__p[0]);
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  unint64_t v9 = (void (***)(void, uint64_t))a1[1];
  uint64_t v10 = (std::__shared_weak_count *)a1[2];
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (**v9)(v9, a2);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  if (*(unsigned char *)(a3 + 24))
  {
    uint64_t v12 = a1[3];
    int v11 = (std::__shared_weak_count *)a1[4];
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    caulk::expected<std::vector<unsigned char>,SLAM::Error>::value(a3);
    ctu::hex();
    if (v15 >= 0) {
      uint64_t v13 = __p;
    }
    else {
      uint64_t v13 = (void **)__p[0];
    }
    SLAM::Logger::Log(v12, 0, (uint64_t)"Transceive", 54, "< %s", (const char *)v13);
    if (v15 < 0) {
      operator delete(__p[0]);
    }
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
  }
}

void sub_22931E6A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base(v15);
  _Unwind_Resume(a1);
}

uint64_t caulk::expected<std::vector<unsigned char>,SLAM::Error>::value(uint64_t result)
{
  uint64_t v1 = (long long **)result;
  if (!*(unsigned char *)(result + 24))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    memset(&v3, 0, sizeof(v3));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v3, *v1, v1[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v1[1] - (char *)*v1) >> 3));
    caulk::bad_expected_access<SLAM::Error>::bad_expected_access((uint64_t)exception, (long long **)&v3);
  }
  return result;
}

void sub_22931E7AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

uint64_t SLAM::Impl::PerformTermination@<X0>(SLAM::Impl *this@<X0>, std::string *a2@<X8>)
{
  void (***v3)(long long *__return_ptr);
  char v4;
  long long **v5;
  _DWORD *__p;
  std::vector<std::string> v8;
  char v9;

  std::string v3 = (void (***)(long long *__return_ptr))((char *)this + 8);
  std::vector<std::string> __p = operator new(4uLL);
  void *__p = 371328;
  SLAM::TransceiverWrapper::TransceiveAndCheckSW(v3, (uint64_t)&v8);
  if (__p) {
    operator delete(__p);
  }
  if (v9)
  {
    uint64_t v4 = 0;
    a2->__r_.__value_.__s.__data_[0] = 0;
  }
  else
  {
    uint64_t v5 = (long long **)SLAM::Error::Add(&v8, "While terminating");
    a2->__r_.__value_.__r.__words[0] = 0;
    a2->__r_.__value_.__l.__size_ = 0;
    a2->__r_.__value_.__r.__words[2] = 0;
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a2, *v5, v5[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v5[1] - (char *)*v5) >> 3));
    uint64_t v4 = 1;
  }
  a2[1].__r_.__value_.__s.__data_[0] = v4;
  return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v8);
}

void sub_22931E8B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, char a13)
{
}

uint64_t SLAM::TransceiverWrapper::TransceiveAndCheckSW@<X0>(void (***a1)(long long *__return_ptr)@<X0>, uint64_t a2@<X8>)
{
  (**a1)(&v12);
  if (!v14)
  {
    *(unsigned char *)(a2 + 24) = 0;
    *(_OWORD *)a2 = v12;
    *(void *)(a2 + 16) = v13;
    long long v12 = 0uLL;
    uint64_t v13 = 0;
    return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v12);
  }
  std::string v3 = (void *)caulk::expected<std::vector<unsigned char>,SLAM::Error>::value((uint64_t)&v12);
  uint64_t v4 = v3[1];
  if ((unint64_t)(v4 - *v3) < 2)
  {
    unsigned int v7 = 49068;
LABEL_9:
    SLAM::Error::Unexpected((SLAM::Error *)"Unexpected SW 0x%hX", (uint64_t)&v10, v7);
    *(_OWORD *)a2 = v10;
    *(void *)(a2 + 16) = v11;
    uint64_t v11 = 0;
    long long v10 = 0uLL;
    *(unsigned char *)(a2 + 24) = 0;
    uint64_t v15 = (void **)&v10;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v15);
    return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v12);
  }
  unsigned int v5 = *(unsigned __int16 *)(v4 - 2);
  if (v5 != 144)
  {
    unsigned int v7 = __rev16(v5);
    goto LABEL_9;
  }
  uint64_t v6 = v12;
  if (*((void *)&v12 + 1) - (void)v12 > 1uLL)
  {
    *((void *)&v12 + 1) -= 2;
  }
  else
  {
    std::vector<unsigned char>::__append((unint64_t *)&v12, 0xFFFFFFFFFFFFFFFELL);
    uint64_t v6 = v12;
  }
  *(unsigned char *)(a2 + 24) = v14;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = v6;
  uint64_t v8 = v13;
  *(void *)(a2 + 8) = *((void *)&v12 + 1);
  *(void *)(a2 + 16) = v8;
  uint64_t v13 = 0;
  long long v12 = 0uLL;
  return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v12);
}

void sub_22931EA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)va);
  _Unwind_Resume(a1);
}

void SLAM::Error::Unexpected(long long **this@<X0>, std::string *a2@<X8>)
{
  memset(&v4, 0, sizeof(v4));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v4, *this, this[1], 0xAAAAAAAAAAAAAAABLL * (((char *)this[1] - (char *)*this) >> 3));
  *a2 = v4;
  memset(&v4, 0, sizeof(v4));
  unsigned int v5 = &v4;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v5);
}

void SLAM::DERParseSequenceToMap(unint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v5 = a1[1] - *a1;
  v20[0] = *a1;
  v20[1] = v5;
  if (a3)
  {
    uint64_t v7 = 8 * a3;
    while (1)
    {
      unint64_t v12 = 0;
      long long v13 = 0uLL;
      uint64_t v8 = DERDecodeItem((uint64_t)v20, &v12);
      uint64_t v9 = *a2;
      if (v8 || v12 != v9) {
        break;
      }
      *(_OWORD *)uint64_t v20 = v13;
      ++a2;
      v7 -= 8;
      if (!v7) {
        goto LABEL_6;
      }
    }
    SLAM::Error::Unexpected((SLAM::Error *)"Failed to decode ret %d tag 0x%llx exoected 0x%llx", (uint64_t)&v18, v8, v12, v9);
    *(_OWORD *)a4 = v18;
    *(void *)(a4 + 16) = v19;
    uint64_t v19 = 0;
    long long v18 = 0uLL;
    *(unsigned char *)(a4 + 24) = 0;
    std::vector<std::string> v21 = (void **)&v18;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v21);
  }
  else
  {
LABEL_6:
    unint64_t v12 = 0;
    *(void *)&long long v13 = &v12;
    *((void *)&v13 + 1) = 0x4002000000;
    char v14 = __Block_byref_object_copy_;
    v17[0] = 0;
    v17[1] = 0;
    uint64_t v15 = __Block_byref_object_dispose_;
    uint64_t v16 = v17;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 0x40000000;
    uint64_t v11[2] = ___ZN4SLAML21DERParseSequenceToMapERNSt3__16vectorIhNS0_9allocatorIhEEEESt16initializer_listIyE_block_invoke;
    v11[3] = &unk_264863308;
    v11[4] = &v12;
    uint64_t v10 = DERDecodeSequenceContentWithBlock(v20, (uint64_t)v11);
    if (v10)
    {
      SLAM::Error::Unexpected((SLAM::Error *)"DecodeSequenceContent returned %d", (uint64_t)&v18, v10);
      *(_OWORD *)a4 = v18;
      *(void *)(a4 + 16) = v19;
      uint64_t v19 = 0;
      long long v18 = 0uLL;
      *(unsigned char *)(a4 + 24) = 0;
      std::vector<std::string> v21 = (void **)&v18;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v21);
    }
    else
    {
      std::map<unsigned long long,DERItem>::map[abi:ne180100](a4, v13 + 40);
      *(unsigned char *)(a4 + 24) = 1;
    }
    _Block_object_dispose(&v12, 8);
    std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::destroy((uint64_t)&v16, v17[0]);
  }
}

void sub_22931ECA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  _Block_object_dispose(&a17, 8);
  std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::destroy(v23, a23);
  _Unwind_Resume(a1);
}

uint64_t caulk::expected<std::map<unsigned long long,DERItem>,SLAM::Error>::value(uint64_t result)
{
  uint64_t v1 = (long long **)result;
  if (!*(unsigned char *)(result + 24))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    memset(&v3, 0, sizeof(v3));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v3, *v1, v1[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v1[1] - (char *)*v1) >> 3));
    caulk::bad_expected_access<SLAM::Error>::bad_expected_access((uint64_t)exception, (long long **)&v3);
  }
  return result;
}

void sub_22931ED70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

void SLAM::Error::Unexpected(SLAM::Error *this@<X0>, uint64_t a2@<X8>, ...)
{
  va_start(va, a2);
  va_copy(v8, va);
  __s[0] = 0;
  vasprintf(__s, (const char *)this, va);
  if (__s[0])
  {
    std::string::basic_string[abi:ne180100]<0>(__p, __s[0]);
    free(__s[0]);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "<FAILED TO VASPRINTF>");
  }
  SLAM::Error::Error((std::string **)__s, (uint64_t)__p);
  *(_OWORD *)a2 = *(_OWORD *)__s;
  *(void *)(a2 + 16) = v5;
  __s[1] = 0;
  uint64_t v5 = 0;
  __s[0] = 0;
  uint64_t v9 = __s;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v9);
  if (v7 < 0) {
    operator delete(__p[0]);
  }
}

void sub_22931EE64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SLAM::Impl::~Impl(SLAM::Impl *this)
{
  SLAM::Impl::~Impl(this);

  JUMPOUT(0x22A6B67D0);
}

{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;

  *(void *)this = &unk_26DD73040;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 9);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  std::string v3 = (std::__shared_weak_count *)*((void *)this + 7);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  *((void *)this + 1) = &unk_26DD730C8;
  std::string v4 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  uint64_t v5 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  std::vector<std::string>::pointer begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  std::vector<std::string>::pointer end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void std::vector<std::string>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_22931F004(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  _DWORD v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
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

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    std::string v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

void *SLAM::Impl::Impl(void *a1, uint64_t *a2, uint64_t *a3, void *a4)
{
  *a1 = &unk_26DD73040;
  uint64_t v7 = *a2;
  uint64_t v8 = (std::__shared_weak_count *)a2[1];
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v10 = *a3;
  uint64_t v9 = (std::__shared_weak_count *)a3[1];
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  a1[1] = &unk_26DD730C8;
  a1[2] = v7;
  a1[3] = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  a1[4] = v10;
  a1[5] = v9;
  if (v9)
  {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  uint64_t v11 = a4[1];
  a1[6] = *a4;
  a1[7] = v11;
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v12 = a3[1];
  a1[8] = *a3;
  a1[9] = v12;
  if (v12) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
  }
  return a1;
}

void SLAM::TransceiverWrapper::~TransceiverWrapper(SLAM::TransceiverWrapper *this)
{
  *(void *)this = &unk_26DD730C8;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  std::string v3 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  uint64_t vars8;

  *(void *)this = &unk_26DD730C8;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  std::string v3 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }

  JUMPOUT(0x22A6B67D0);
}

__n128 std::__optional_storage_base<SLAM::Error,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<SLAM::Error,false>>(std::vector<std::string> *this, uint64_t a2)
{
  if (LOBYTE(this[1].__begin_) == *(unsigned __int8 *)(a2 + 24))
  {
    if (LOBYTE(this[1].__begin_))
    {
      std::vector<std::string>::__vdeallocate(this);
      __n128 result = *(__n128 *)a2;
      *(_OWORD *)&this->__begin_ = *(_OWORD *)a2;
      this->__end_cap_.__value_ = *(std::string **)(a2 + 16);
      *(void *)a2 = 0;
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
    }
  }
  else if (LOBYTE(this[1].__begin_))
  {
    size_t v5 = this;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v5);
    LOBYTE(this[1].__begin_) = 0;
  }
  else
  {
    this->__begin_ = 0;
    this->__end_ = 0;
    this->__end_cap_.__value_ = 0;
    __n128 result = *(__n128 *)a2;
    *this = *(std::vector<std::string> *)a2;
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    LOBYTE(this[1].__begin_) = 1;
  }
  return result;
}

void std::vector<std::string>::__vdeallocate(std::vector<std::string> *this)
{
  if (this->__begin_)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this);
    operator delete(this->__begin_);
    this->__begin_ = 0;
    this->__end_ = 0;
    this->__end_cap_.__value_ = 0;
  }
}

std::string *ctu::join<std::__wrap_iter<std::string const*>>@<X0>(std::string *__str@<X0>, std::string *a2@<X1>, void *a3@<X2>, size_t a4@<X3>, std::string *a5@<X8>)
{
  a5->__r_.__value_.__r.__words[0] = 0;
  a5->__r_.__value_.__l.__size_ = 0;
  a5->__r_.__value_.__r.__words[2] = 0;
  if (__str != a2)
  {
    uint64_t v8 = __str;
    __str = std::string::operator=(a5, __str);
    for (uint64_t i = v8 + 1; i != a2; ++i)
    {
      if (a3)
      {
        std::string::basic_string[abi:ne180100](&__p, a3, a4);
        std::string::size_type v11 = HIBYTE(v21);
        uint64_t v12 = (void **)__p;
        std::string::size_type v13 = v20;
      }
      else
      {
        std::string::size_type v13 = 0;
        uint64_t v12 = 0;
        std::string::size_type v11 = 0;
        std::vector<std::string> __p = 0;
        std::string::size_type v20 = 0;
        uint64_t v21 = 0;
      }
      if ((v11 & 0x80u) == 0) {
        p_p = &__p;
      }
      else {
        p_p = v12;
      }
      if ((v11 & 0x80u) == 0) {
        std::string::size_type v15 = v11;
      }
      else {
        std::string::size_type v15 = v13;
      }
      std::string::append(a5, (const std::string::value_type *)p_p, v15);
      if (SHIBYTE(v21) < 0) {
        operator delete(__p);
      }
      int v16 = SHIBYTE(i->__r_.__value_.__r.__words[2]);
      if (v16 >= 0) {
        uint64_t v17 = (const std::string::value_type *)i;
      }
      else {
        uint64_t v17 = (const std::string::value_type *)i->__r_.__value_.__r.__words[0];
      }
      if (v16 >= 0) {
        std::string::size_type size = HIBYTE(i->__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = i->__r_.__value_.__l.__size_;
      }
      __str = std::string::append(a5, v17, size);
    }
  }
  return __str;
}

void sub_22931F820(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__dst, void *__src, size_t __len)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    uint64_t v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

uint64_t std::for_each[abi:ne180100]<boost::cb_details::iterator<boost::circular_buffer<std::string,std::allocator<std::string>>,boost::cb_details::const_traits<std::allocator<std::string>>>,std::function<void ()(std::string const&)>>@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  if (a2 != a3)
  {
    uint64_t v8 = a2;
    do
    {
      uint64_t v10 = *(void *)(a4 + 24);
      if (!v10) {
        std::__throw_bad_function_call[abi:ne180100]();
      }
      (*(void (**)(uint64_t, uint64_t))(*(void *)v10 + 48))(v10, v8);
      uint64_t v11 = v8 + 24;
      if (v8 + 24 == a1[1]) {
        uint64_t v11 = *a1;
      }
      if (v11 == a1[3]) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = v11;
      }
    }
    while (v8 != a3);
  }

  return std::__function::__value_func<void ()(std::string const&)>::__value_func[abi:ne180100](a5, a4);
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__function::__value_func<void ()(std::string const&)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  std::string v3 = (void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(void *)(a1 + 24) = v4;
  }
  else
  {
    std::string v3 = (void *)(a1 + 24);
  }
  *std::string v3 = 0;
  return a1;
}

{
  uint64_t v3;

  std::string v3 = *(void *)(a2 + 24);
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

void caulk::bad_expected_access<SLAM::Error>::~bad_expected_access(std::exception *a1)
{
  a1->__vftable = (std::exception_vtbl *)&unk_26DD73160;
  uint64_t v2 = a1 + 1;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v2);
  std::exception::~exception(a1);
}

uint64_t caulk::bad_expected_access<SLAM::Error>::bad_expected_access(uint64_t a1, long long **a2)
{
  *(void *)a1 = &unk_26DD73160;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 8) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)(a1 + 8), *a2, a2[1], 0xAAAAAAAAAAAAAAABLL * (((char *)a2[1] - (char *)*a2) >> 3));
  return a1;
}

void sub_22931FC28(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

uint64_t caulk::bad_expected_access<SLAM::Error>::~bad_expected_access(std::exception *a1)
{
  a1->__vftable = (std::exception_vtbl *)&unk_26DD73160;
  std::string v3 = a1 + 1;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v3);
  std::exception::~exception(a1);
  return MEMORY[0x22A6B67D0]();
}

uint64_t caulk::__expected_detail::base<SLAM::MigrationInfo,SLAM::Error>::~base(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v2 = *(void **)(a1 + 16);
    if (v2)
    {
      *(void *)(a1 + 24) = v2;
      operator delete(v2);
    }
  }
  else
  {
    uint64_t v4 = (void **)a1;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v4);
  }
  return a1;
}

uint64_t caulk::__expected_detail::base<SLAM::Script,SLAM::Error>::~base(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    caulk::__expected_detail::destroy<SLAM::Script,(void *)0>(a1);
  }
  else
  {
    std::string v3 = (void **)a1;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v3);
  }
  return a1;
}

void caulk::__expected_detail::destroy<SLAM::Script,(void *)0>(uint64_t a1)
{
  std::string v3 = (void **)(a1 + 40);
  std::vector<std::vector<unsigned char>>::__destroy_vector::operator()[abi:ne180100](&v3);
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    *(void *)(a1 + 16) = v2;
    operator delete(v2);
  }
}

void std::vector<std::vector<unsigned char>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<unsigned char>>::__clear[abi:ne180100]((uint64_t *)v2);
    std::string v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::vector<unsigned char>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      uint64_t v6 = *(void **)(v4 - 24);
      v4 -= 24;
      size_t v5 = v6;
      if (v6)
      {
        *(void *)(v2 - 16) = v5;
        operator delete(v5);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

std::string *std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(std::string *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<std::string>::__vallocate[abi:ne180100](result, a4);
    __n128 result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_22931FEAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::string>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, long long *a2, long long *a3, std::string *this)
{
  uint64_t v4 = this;
  uint64_t v11 = this;
  uint64_t v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((void *)v6 + 1));
        uint64_t v4 = v12;
      }
      else
      {
        long long v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      uint64_t v6 = (long long *)((char *)v6 + 24);
      uint64_t v12 = ++v4;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_22931FFCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0) {
      operator delete(*(void **)(v1 - 24));
    }
    v1 -= 24;
  }
}

void SLAM::StringUtil::Format(SLAM::StringUtil *this@<X0>, void *a2@<X8>, ...)
{
  va_start(va, a2);
  std::string __s = 0;
  vasprintf(&__s, (const char *)this, va);
  if (__s)
  {
    std::string::basic_string[abi:ne180100]<0>(a2, __s);
    free(__s);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(a2, "<FAILED TO VASPRINTF>");
  }
}

void boost::circular_buffer<std::string,std::allocator<std::string>>::push_back_impl<std::string const&>(uint64_t a1, const std::string *a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v3 - *(void *)a1) >> 3) == *(void *)(a1 + 32))
  {
    if (v3 != *(void *)a1)
    {
      std::string::operator=(*(std::string **)(a1 + 24), a2);
      uint64_t v4 = *(void *)(a1 + 24) + 24;
      *(void *)(a1 + 24) = v4;
      if (v4 == *(void *)(a1 + 8))
      {
        uint64_t v4 = *(void *)a1;
        *(void *)(a1 + 24) = *(void *)a1;
      }
      *(void *)(a1 + 16) = v4;
    }
  }
  else
  {
    size_t v5 = *(std::string **)(a1 + 24);
    if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(v5, a2->__r_.__value_.__l.__data_, a2->__r_.__value_.__l.__size_);
    }
    else
    {
      long long v6 = *(_OWORD *)&a2->__r_.__value_.__l.__data_;
      v5->__r_.__value_.__r.__words[2] = a2->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
    }
    uint64_t v7 = *(void *)(a1 + 24) + 24;
    *(void *)(a1 + 24) = v7;
    if (v7 == *(void *)(a1 + 8)) {
      *(void *)(a1 + 24) = *(void *)a1;
    }
    ++*(void *)(a1 + 32);
  }
}

void std::__throw_bad_variant_access[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3A8] + 16;
}

void std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>(uint64_t a1@<X8>)
{
  SLAM::Error::Error(&v2, "Cannot proceed in OSU state");
  *(std::vector<std::string> *)a1 = v2;
  memset(&v2, 0, sizeof(v2));
  *(unsigned char *)(a1 + 24) = 1;
  uint64_t v3 = &v2;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v3);
}

void std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>(unsigned char *a1@<X8>)
{
  *a1 = 0;
  a1[24] = 0;
}

void std::__variant_detail::__visitation::__base::__dispatcher<2ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>(uint64_t a1@<X8>)
{
  SLAM::Error::Error(&v2, "Cannot proceed in SC state");
  *(std::vector<std::string> *)a1 = v2;
  memset(&v2, 0, sizeof(v2));
  *(unsigned char *)(a1 + 24) = 1;
  uint64_t v3 = &v2;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v3);
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<3ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>@<X0>(SLAM::Impl ***a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v3 = **a1;
  uint64_t v4 = *((void *)v3 + 8);
  size_t v5 = (std::__shared_weak_count *)*((void *)v3 + 9);
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  SLAM::Logger::Log(v4, 1, (uint64_t)"operator()", 198, "Recovering incomplete termination");
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }

  return SLAM::Impl::PerformTermination(v3, a2);
}

void sub_229320350(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__variant_detail::__visitation::__base::__dispatcher<4ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v4 = *a1;
  long long v6 = *(SLAM::Impl **)(*a1 + 8);
  uint64_t v5 = *(void *)(*a1 + 16);
  uint64_t v7 = *a2;
  uint64_t v8 = *((void *)v6 + 8);
  uint64_t v9 = (std::__shared_weak_count *)*((void *)v6 + 9);
  if (v5 == *a2)
  {
    if (v9)
    {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v5 = *(void *)(v4 + 16);
    }
    SLAM::Logger::Log(v8, 1, (uint64_t)"operator()", 211, "Resuming interrupted script 0x%llx", v5);
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
LABEL_11:
    a3->__r_.__value_.__s.__data_[0] = 0;
    a3[1].__r_.__value_.__s.__data_[0] = 0;
    return;
  }
  if (v9)
  {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v7 = *a2;
    uint64_t v5 = *(void *)(v4 + 16);
  }
  SLAM::Logger::Log(v8, 1, (uint64_t)"operator()", 206, "Recover interrupted script 0x%llx before running 0x%llx", v7, v5);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  SLAM::Impl::PerformRecovery(v6, a3);
  if (!a3[1].__r_.__value_.__s.__data_[0]) {
    goto LABEL_11;
  }
}

void sub_229320454(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformRecovery(void)::$_0,SLAM::Impl::PerformRecovery(void)::$_1,SLAM::Impl::PerformRecovery(void)::$_2,SLAM::Impl::PerformRecovery(void)::$_3,SLAM::Impl::PerformRecovery(void)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,std::__variant_detail::_Trait::Idle,std::__variant_detail::_Trait::SecureChannel,std::__variant_detail::_Trait::Termination,std::__variant_detail::_Trait::SLAM> const&>(unsigned char *a1@<X8>)
{
  *a1 = 0;
  a1[24] = 0;
}

void std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformRecovery(void)::$_0,SLAM::Impl::PerformRecovery(void)::$_1,SLAM::Impl::PerformRecovery(void)::$_2,SLAM::Impl::PerformRecovery(void)::$_3,SLAM::Impl::PerformRecovery(void)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,std::__variant_detail::_Trait::Idle,std::__variant_detail::_Trait::SecureChannel,std::__variant_detail::_Trait::Termination,std::__variant_detail::_Trait::SLAM> const&>(unsigned char *a1@<X8>)
{
  *a1 = 0;
  a1[24] = 0;
}

void std::__variant_detail::__visitation::__base::__dispatcher<2ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformRecovery(void)::$_0,SLAM::Impl::PerformRecovery(void)::$_1,SLAM::Impl::PerformRecovery(void)::$_2,SLAM::Impl::PerformRecovery(void)::$_3,SLAM::Impl::PerformRecovery(void)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,std::__variant_detail::_Trait::Idle,std::__variant_detail::_Trait::SecureChannel,std::__variant_detail::_Trait::Termination,std::__variant_detail::_Trait::SLAM> const&>(unsigned char *a1@<X8>)
{
  *a1 = 0;
  a1[24] = 0;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<3ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformRecovery(void)::$_0,SLAM::Impl::PerformRecovery(void)::$_1,SLAM::Impl::PerformRecovery(void)::$_2,SLAM::Impl::PerformRecovery(void)::$_3,SLAM::Impl::PerformRecovery(void)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,std::__variant_detail::_Trait::Idle,std::__variant_detail::_Trait::SecureChannel,std::__variant_detail::_Trait::Termination,std::__variant_detail::_Trait::SLAM> const&>@<X0>(SLAM::Impl ***a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v3 = **a1;
  uint64_t v4 = *((void *)v3 + 8);
  uint64_t v5 = (std::__shared_weak_count *)*((void *)v3 + 9);
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  SLAM::Logger::Log(v4, 1, (uint64_t)"operator()", 252, "Recovering incomplete termination");
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }

  return SLAM::Impl::PerformTermination(v3, a2);
}

void sub_229320518(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<4ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformRecovery(void)::$_0,SLAM::Impl::PerformRecovery(void)::$_1,SLAM::Impl::PerformRecovery(void)::$_2,SLAM::Impl::PerformRecovery(void)::$_3,SLAM::Impl::PerformRecovery(void)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,std::__variant_detail::_Trait::Idle,std::__variant_detail::_Trait::SecureChannel,std::__variant_detail::_Trait::Termination,std::__variant_detail::_Trait::SLAM> const&>@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(SLAM::Impl **)(*(void *)a1 + 8);
  uint64_t v6 = *((void *)v5 + 6);
  uint64_t v7 = (std::__shared_weak_count *)*((void *)v5 + 7);
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(void *__return_ptr))(*(void *)v6 + 8))(v18);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  if (v20)
  {
    SLAM::Impl::ExecuteScript((uint64_t)v5, v19, &v16);
    if (v17)
    {
      uint64_t v9 = *((void *)v5 + 8);
      uint64_t v8 = (std::__shared_weak_count *)*((void *)v5 + 9);
      if (v8) {
        atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v10 = *a2;
      ctu::join<std::__wrap_iter<std::string const*>>((std::string *)v16.__r_.__value_.__l.__data_, (std::string *)v16.__r_.__value_.__l.__size_, ", ", 2uLL, &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      SLAM::Logger::Log(v9, 1, (uint64_t)"operator()", 267, "Failed recovery with scriptID 0x%llx, error was %s", v10, (const char *)p_p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v8) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v8);
      }
      SLAM::Impl::PerformTermination(v5, a3);
      if (v17)
      {
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v16;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      }
    }
    else
    {
      a3->__r_.__value_.__s.__data_[0] = 0;
      a3[1].__r_.__value_.__s.__data_[0] = 0;
    }
  }
  else
  {
    uint64_t v12 = *((void *)v5 + 8);
    std::string::size_type v13 = (std::__shared_weak_count *)*((void *)v5 + 9);
    if (v13) {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    SLAM::Logger::Log(v12, 1, (uint64_t)"operator()", 260, "Recovery script 0x%llx not found, terminating!", *a2);
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    SLAM::Impl::PerformTermination(v5, a3);
  }
  return caulk::__expected_detail::base<SLAM::Script,SLAM::Error>::~base((uint64_t)v18);
}

void sub_229320720(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17, uint64_t a18, uint64_t a19, char a20,int a21,__int16 a22,char a23,char a24)
{
}

void sub_229320798()
{
  if (v0) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v0);
  }
  JUMPOUT(0x229320790);
}

uint64_t caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 24))
  {
    std::vector<std::string> v2 = *(void **)a1;
    if (*(void *)a1)
    {
      *(void *)(a1 + 8) = v2;
      operator delete(v2);
    }
  }
  else
  {
    uint64_t v4 = (void **)a1;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v4);
  }
  return a1;
}

void std::vector<unsigned char>::__append(unint64_t *a1, size_t a2)
{
  uint64_t v5 = (char *)a1[1];
  uint64_t v4 = (char *)a1[2];
  if (v4 - v5 >= a2)
  {
    if (a2)
    {
      bzero((void *)a1[1], a2);
      v5 += a2;
    }
    a1[1] = (unint64_t)v5;
  }
  else
  {
    unint64_t v6 = *a1;
    uint64_t v7 = &v5[-*a1];
    unint64_t v8 = (unint64_t)&v7[a2];
    if ((uint64_t)&v7[a2] < 0) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v9 = (unint64_t)&v4[-v6];
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v10 = v8;
    }
    if (v10) {
      unint64_t v11 = (unint64_t)operator new(v10);
    }
    else {
      unint64_t v11 = 0;
    }
    uint64_t v12 = &v7[v11];
    std::string::size_type v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      unint64_t v11 = (unint64_t)v12;
    }
    else
    {
      long long v14 = &v5[~v6];
      do
      {
        char v15 = *--v5;
        (v14--)[v11] = v15;
      }
      while (v5 != (char *)v6);
      uint64_t v5 = (char *)*a1;
    }
    *a1 = v11;
    a1[1] = (unint64_t)&v12[a2];
    a1[2] = (unint64_t)v13;
    if (v5)
    {
      operator delete(v5);
    }
  }
}

char *std::vector<unsigned char>::__vallocate[abi:ne180100](void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void *__Block_byref_object_copy_(void *result, void *a2)
{
  result[5] = a2[5];
  std::vector<std::string> v2 = a2 + 6;
  uint64_t v3 = a2[6];
  result[6] = v3;
  uint64_t v4 = result + 6;
  uint64_t v5 = a2[7];
  result[7] = v5;
  if (v5)
  {
    *(void *)(v3 + 16) = v4;
    a2[5] = v2;
    *std::vector<std::string> v2 = 0;
    a2[7] = 0;
  }
  else
  {
    result[5] = v4;
  }
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t ___ZN4SLAML21DERParseSequenceToMapERNSt3__16vectorIhNS0_9allocatorIhEEEESt16initializer_listIyE_block_invoke(uint64_t a1, uint64_t a2)
{
  std::vector<std::string> v2 = (uint64_t **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v4 = (uint64_t *)a2;
  *(_OWORD *)(std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v2, (unint64_t *)a2, (uint64_t)&std::piecewise_construct, &v4)+ 5) = *(_OWORD *)(a2 + 8);
  return 0;
}

void std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t **a1, unint64_t *a2, uint64_t a3, uint64_t **a4)
{
  uint64_t v7 = a1 + 1;
  unint64_t v6 = a1[1];
  if (v6)
  {
    unint64_t v8 = *a2;
    while (1)
    {
      while (1)
      {
        unint64_t v9 = (uint64_t **)v6;
        unint64_t v10 = v6[4];
        if (v8 >= v10) {
          break;
        }
        unint64_t v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      unint64_t v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    unint64_t v9 = a1 + 1;
LABEL_10:
    unint64_t v11 = (uint64_t *)operator new(0x38uLL);
    v11[4] = **a4;
    void v11[5] = 0;
    v11[6] = 0;
    std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__insert_node_at(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

uint64_t *std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  __n128 result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      std::vector<std::string> v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            unint64_t v9 = (uint64_t **)v2[1];
            unint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *unint64_t v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            std::vector<std::string> v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *uint64_t v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), uint64_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *std::vector<std::string> v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        std::vector<std::string> v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *std::vector<std::string> v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *uint64_t v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t std::map<unsigned long long,DERItem>::map[abi:ne180100](uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)a1 = a1 + 8;
  std::map<unsigned long long,DERItem>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<unsigned long long,DERItem>,std::__tree_node<std::__value_type<unsigned long long,DERItem>,void *> *,long>>>((_OWORD *)a1, *(void **)a2, (void *)(a2 + 8));
  return a1;
}

void sub_229320D6C(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

_OWORD *std::map<unsigned long long,DERItem>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<unsigned long long,DERItem>,std::__tree_node<std::__value_type<unsigned long long,DERItem>,void *> *,long>>>(_OWORD *result, void *a2, void *a3)
{
  if (a2 != a3)
  {
    uint64_t v4 = a2;
    uint64_t v5 = (uint64_t **)result;
    int v6 = (void *)result + 1;
    do
    {
      __n128 result = std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__emplace_hint_unique_key_args<unsigned long long,std::pair<unsigned long long const,DERItem> const&>(v5, v6, v4 + 4, (uint64_t)(v4 + 4));
      uint64_t v7 = (void *)v4[1];
      if (v7)
      {
        do
        {
          int v8 = v7;
          uint64_t v7 = (void *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          int v8 = (void *)v4[2];
          BOOL v9 = *v8 == (void)v4;
          uint64_t v4 = v8;
        }
        while (!v9);
      }
      uint64_t v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

_OWORD *std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__emplace_hint_unique_key_args<unsigned long long,std::pair<unsigned long long const,DERItem> const&>(uint64_t **a1, void *a2, unint64_t *a3, uint64_t a4)
{
  int v6 = (void **)std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__find_equal<unsigned long long>(a1, a2, &v11, &v10, a3);
  uint64_t v7 = *v6;
  if (!*v6)
  {
    int v8 = (uint64_t **)v6;
    uint64_t v7 = operator new(0x38uLL);
    v7[2] = *(_OWORD *)a4;
    *((void *)v7 + 6) = *(void *)(a4 + 16);
    std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__insert_node_at(a1, v11, v8, (uint64_t *)v7);
  }
  return v7;
}

void *std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__find_equal<unsigned long long>(void *a1, void *a2, void *a3, void *a4, unint64_t *a5)
{
  uint64_t v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, unint64_t v7 = a2[4], *a5 < v7))
  {
    uint64_t v8 = *a2;
    if ((void *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      BOOL v9 = (void *)*a2;
      do
      {
        uint64_t v10 = v9;
        BOOL v9 = (void *)v9[1];
      }
      while (v9);
    }
    else
    {
      uint64_t v13 = a2;
      do
      {
        uint64_t v10 = (void *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        uint64_t v13 = v10;
      }
      while (v14);
    }
    unint64_t v15 = *a5;
    if (v10[4] < *a5) {
      goto LABEL_17;
    }
    std::string v16 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          char v17 = v16;
          unint64_t v18 = v16[4];
          if (v15 >= v18) {
            break;
          }
          std::string v16 = (void *)*v17;
          uint64_t v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        uint64_t v5 = v17 + 1;
        std::string v16 = (void *)v17[1];
      }
      while (v16);
    }
    else
    {
      char v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    uint64_t v12 = (void *)a2[1];
    do
    {
      a4 = v12;
      uint64_t v12 = (void *)*v12;
    }
    while (v12);
  }
  else
  {
    uint64_t v19 = a2;
    do
    {
      a4 = (void *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      uint64_t v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= a4[4])
  {
    char v20 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          uint64_t v21 = v20;
          unint64_t v22 = v20[4];
          if (v6 >= v22) {
            break;
          }
          char v20 = (void *)*v21;
          uint64_t v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        uint64_t v5 = v21 + 1;
        char v20 = (void *)v21[1];
      }
      while (v20);
    }
    else
    {
      uint64_t v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

std::string **SLAM::Error::Error(std::string **a1, uint64_t a2)
{
  *(void *)&long long v6 = *MEMORY[0x263EF8340];
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v5, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v5 = *(std::string *)a2;
  }
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v3 = (std::string *)operator new(0x18uLL);
  *a1 = v3;
  a1[1] = v3;
  a1[2] = v3 + 1;
  a1[1] = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)(a1 + 2), (long long *)&v5, &v6, v3);
  if (SHIBYTE(v5.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v5.__r_.__value_.__l.__data_);
  }
  return a1;
}

void sub_229321120(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>(uint64_t a1, long long *a2, long long *a3, std::string *this)
{
  uint64_t v4 = this;
  uint64_t v11 = this;
  uint64_t v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    long long v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((void *)v6 + 1));
        uint64_t v4 = v12;
      }
      else
      {
        long long v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      long long v6 = (long long *)((char *)v6 + 24);
      uint64_t v12 = ++v4;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_229321208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t caulk::__expected_detail::base<std::map<unsigned long long,DERItem>,SLAM::Error>::~base(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 24))
  {
    std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::destroy(a1, *(void **)(a1 + 8));
  }
  else
  {
    uint64_t v3 = (void **)a1;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v3);
  }
  return a1;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    uint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    std::string v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

void *std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](void *a1)
{
  std::vector<std::string> v2 = (void *)a1[3];
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

void *_ZNSt3__115allocate_sharedB8ne180100IN4SLAM21DefaultScriptProviderENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_@<X0>(void *a1@<X8>)
{
  std::vector<std::string> v2 = operator new(0x30uLL);
  __n128 result = _ZNSt3__120__shared_ptr_emplaceIN4SLAM21DefaultScriptProviderENS_9allocatorIS2_EEEC2B8ne180100IJES4_Li0EEES4_DpOT_(v2);
  *a1 = v2 + 3;
  a1[1] = v2;
  return result;
}

void sub_2293213C8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *_ZNSt3__120__shared_ptr_emplaceIN4SLAM21DefaultScriptProviderENS_9allocatorIS2_EEEC2B8ne180100IJES4_Li0EEES4_DpOT_(void *a1)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26DD731F0;
  std::allocator<SLAM::DefaultScriptProvider>::construct[abi:ne180100]<SLAM::DefaultScriptProvider>((uint64_t)&v3, a1 + 3);
  return a1;
}

void sub_229321434(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<SLAM::DefaultScriptProvider>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD731F0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SLAM::DefaultScriptProvider>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD731F0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__shared_ptr_emplace<SLAM::DefaultScriptProvider>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16))();
}

void std::allocator<SLAM::DefaultScriptProvider>::construct[abi:ne180100]<SLAM::DefaultScriptProvider>(uint64_t a1, void *a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, "/usr/standalone/firmware/SLAM/SLAM.sefw");
  SLAM::DefaultScriptProvider::DefaultScriptProvider(a2, (uint64_t)__p);
  if (v4 < 0) {
    operator delete(__p[0]);
  }
}

void sub_229321538(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::allocate_shared[abi:ne180100]<SLAM::Logger,std::allocator<SLAM::Logger>,gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&,void>@<X0>(uint64_t *a1@<X1>, void *a2@<X8>)
{
  char v4 = operator new(0x50uLL);
  __n128 result = std::__shared_ptr_emplace<SLAM::Logger>::__shared_ptr_emplace[abi:ne180100]<gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&,std::allocator<SLAM::Logger>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_22932159C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<SLAM::Logger>::__shared_ptr_emplace[abi:ne180100]<gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&,std::allocator<SLAM::Logger>,0>(void *a1, uint64_t *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26DD73228;
  std::allocator<SLAM::Logger>::construct[abi:ne180100]<SLAM::Logger,gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&>((uint64_t)&v4, a1 + 3, a2);
  return a1;
}

void sub_22932160C(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<SLAM::Logger>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD73228;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SLAM::Logger>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD73228;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

void std::allocator<SLAM::Logger>::construct[abi:ne180100]<SLAM::Logger,gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&>(uint64_t a1, void *a2, uint64_t *a3)
{
  char v3 = (std::__shared_weak_count *)a3[1];
  uint64_t v4 = *a3;
  std::string v5 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  SLAM::Logger::Logger(a2, &v4);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
}

void sub_2293216F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void *SLAM::Logger::Logger(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  a1[6] = 0;
  uint64_t v4 = (char *)operator new(0x1E0uLL);
  a1[2] = v4;
  a1[3] = v4 + 480;
  a1[4] = v4;
  a1[5] = v4;
  return a1;
}

void sub_22932175C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_emplace<SLAM::Logger>::__on_zero_shared_impl[abi:ne180100]<std::allocator<SLAM::Logger>,0>(uint64_t a1)
{
  boost::circular_buffer<std::string,std::allocator<std::string>>::destroy((uint64_t *)(a1 + 40));
  std::vector<std::string> v2 = *(std::__shared_weak_count **)(a1 + 32);
  if (v2)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
}

void boost::circular_buffer<std::string,std::allocator<std::string>>::destroy(uint64_t *a1)
{
  if (*a1) {
    operator delete((void *)*a1);
  }
}

void boost::circular_buffer<std::string,std::allocator<std::string>>::destroy_content(uint64_t *a1)
{
  if (a1[4])
  {
    unint64_t v2 = 0;
    uint64_t v3 = a1[2];
    do
    {
      if (*(char *)(v3 + 23) < 0)
      {
        operator delete(*(void **)v3);
        uint64_t v3 = a1[2];
      }
      v3 += 24;
      a1[2] = v3;
      if (v3 == a1[1])
      {
        uint64_t v3 = *a1;
        a1[2] = *a1;
      }
      ++v2;
    }
    while (v2 < a1[4]);
  }
}

void *std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::~__func(void *a1)
{
  *a1 = &unk_26DD73260;
  unint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::~__func(void *a1)
{
  *a1 = &unk_26DD73260;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void *std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  void *result = &unk_26DD73260;
  result[1] = v4;
  result[2] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::__clone(uint64_t result, void *a2)
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v2 = *(void *)(result + 16);
  *a2 = &unk_26DD73260;
  a2[1] = v3;
  a2[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::operator()(uint64_t a1)
{
  uint64_t v2 = *(void (****)(void))(a1 + 8);
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (**v2)(v2);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void sub_229321A8C(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::__function::__func<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::~__func(void *a1)
{
  *a1 = &unk_26DD732A8;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::~__func(void *a1)
{
  *a1 = &unk_26DD732A8;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void *std::__function::__func<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  void *result = &unk_26DD732A8;
  result[1] = v4;
  result[2] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::__clone(uint64_t result, void *a2)
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v2 = *(void *)(result + 16);
  *a2 = &unk_26DD732A8;
  a2[1] = v3;
  a2[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::operator()(uint64_t a1)
{
  uint64_t v2 = *(void (****)(void))(a1 + 8);
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (**v2)(v2);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void sub_229321CC0(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    std::string::size_type v6 = result;
    __n128 result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_229321D38(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *SLAM::DefaultScriptProvider::DefaultScriptProvider(void *a1, uint64_t a2)
{
  *a1 = &unk_26DD732F0;
  applesauce::v1::mapped_file::mapped_file(a1 + 1, a2, 1);
  return a1;
}

void *SLAM::DefaultScriptProvider::GetScriptByID@<X0>(SLAM::DefaultScriptProvider *this@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v5[4] = *MEMORY[0x263EF8340];
  uint64_t v4 = a2;
  v5[0] = &unk_26DD733A0;
  v5[1] = &v4;
  v5[3] = v5;
  SLAM::DefaultScriptProvider::FindScriptMatching((uint64_t)this, (uint64_t)v5, a3);
  return std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::~__value_func[abi:ne180100](v5);
}

void sub_229321E28(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void SLAM::DefaultScriptProvider::FindScriptMatching(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v66[4] = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v5 = *(void *)(a1 + 16);
  if (v5 < 7
    || (*(_DWORD *)SLAM::DefaultScriptProvider::FindScriptMatching(std::function<BOOL ()(SLAMScriptDERObj const&)>)::plist_header == *(_DWORD *)v6
      ? (BOOL v7 = *(unsigned __int16 *)&SLAM::DefaultScriptProvider::FindScriptMatching(std::function<BOOL ()(SLAMScriptDERObj const&)>)::plist_header[4] == *(unsigned __int16 *)(v6 + 4))
      : (BOOL v7 = 0),
        !v7))
  {
    v64[0] = *(void *)(a1 + 8);
    v64[1] = v5;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v8 = DERParseSequence((uint64_t)v64, (unsigned __int16)slamSEFWItemSpecLen, (uint64_t)&slamSEFWItemSpec, (unint64_t)&v62, 0x20uLL);
    if (v8)
    {
      SLAM::Error::Unexpected((SLAM::Error *)"Failed to parse top level %d", (uint64_t)&v54, v8);
LABEL_18:
      *(std::string *)a3 = v54;
      memset(&v54, 0, sizeof(v54));
      *(unsigned char *)(a3 + 72) = 0;
      *(void *)&long long v40 = &v54;
      uint64_t v12 = (void ***)&v40;
      goto LABEL_19;
    }
    if (*((void *)&v62 + 1) != 4)
    {
      SLAM::Error::Unexpected((SLAM::Error *)"Unexpected SLAM version length %zu", (uint64_t)&v54, *((void *)&v62 + 1));
      goto LABEL_18;
    }
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x2020000000;
    int v61 = 0;
    uint64_t v9 = bswap32(*(_DWORD *)v62);
    int v61 = v9;
    if ((v9 - 1) >= 2)
    {
      SLAM::Error::Unexpected((SLAM::Error *)"Unexpected SLAM SEFW version %u", (uint64_t)&v54, v9);
      *(std::string *)a3 = v54;
      memset(&v54, 0, sizeof(v54));
      *(unsigned char *)(a3 + 72) = 0;
      *(void *)&long long v40 = &v54;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v40);
LABEL_22:
      _Block_object_dispose(v60, 8);
      return;
    }
    v54.__r_.__value_.__r.__words[0] = 0;
    v54.__r_.__value_.__l.__size_ = (std::string::size_type)&v54;
    v54.__r_.__value_.__r.__words[2] = 0xA812000000;
    v55 = __Block_byref_object_copy__0;
    v56 = __Block_byref_object_dispose__0;
    uint64_t v57 = 0;
    char v58 = 0;
    char v59 = 0;
    v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x5012000000;
    v49 = __Block_byref_object_copy__5;
    v50 = __Block_byref_object_dispose__6;
    uint64_t v51 = 0;
    char v52 = 0;
    char v53 = 0;
    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 3321888768;
    v65[2] = ___ZN4SLAM21DefaultScriptProvider18FindScriptMatchingENSt3__18functionIFbRK16SLAMScriptDERObjEEE_block_invoke;
    v65[3] = &unk_26DD73318;
    v65[4] = v60;
    v65[5] = &v46;
    std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::__value_func[abi:ne180100]((uint64_t)v66, a2);
    v65[6] = &v54;
    uint64_t v10 = DERDecodeSequenceContentWithBlock((unint64_t *)&v63, (uint64_t)v65);
    if (v10)
    {
      SLAM::Error::Unexpected((SLAM::Error *)"Failed to decode script %d", (uint64_t)&v40, v10);
      *(_OWORD *)a3 = v40;
      *(void *)(a3 + 16) = v41;
      *(void *)&long long v41 = 0;
      long long v40 = 0uLL;
      *(unsigned char *)(a3 + 72) = 0;
      v35.__begin_ = (std::vector<std::string>::pointer)&v40;
      p_p = &v35;
    }
    else
    {
      if (*((unsigned char *)v47 + 72))
      {
        ctu::join<std::__wrap_iter<std::string const*>>(v47[6], v47[7], ", ", 2uLL, &__p);
        SLAM::Error::Error(&v35.__begin_, (uint64_t)&__p);
        long long v40 = 0uLL;
        *(void *)&long long v41 = 0;
        std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)&v40, (long long *)v35.__begin_, (long long *)v35.__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)v35.__end_ - (char *)v35.__begin_) >> 3));
        *(_OWORD *)a3 = v40;
        *(void *)(a3 + 16) = v41;
        *(void *)&long long v41 = 0;
        long long v40 = 0uLL;
        *(unsigned char *)(a3 + 72) = 0;
        v32[0] = &v40;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v32);
        v32[0] = &v35;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v32);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        goto LABEL_13;
      }
      if (*(unsigned char *)(v54.__r_.__value_.__l.__size_ + 160))
      {
        long long v13 = *(_OWORD *)(v54.__r_.__value_.__l.__size_ + 96);
        long long v14 = *(_OWORD *)(v54.__r_.__value_.__l.__size_ + 128);
        long long v15 = *(_OWORD *)(v54.__r_.__value_.__l.__size_ + 144);
        v44[0] = *(_OWORD *)(v54.__r_.__value_.__l.__size_ + 112);
        v44[1] = v14;
        long long v45 = v15;
        long long v16 = *(_OWORD *)(v54.__r_.__value_.__l.__size_ + 64);
        long long v42 = *(_OWORD *)(v54.__r_.__value_.__l.__size_ + 80);
        long long v43 = v13;
        long long v40 = *(_OWORD *)(v54.__r_.__value_.__l.__size_ + 48);
        long long v41 = v16;
        v35.__begin_ = 0;
        v35.__end_ = (std::vector<std::string>::pointer)&v35;
        v35.__end_cap_.__value_ = (std::string *)0x4812000000;
        v36 = __Block_byref_object_copy__11;
        uint64_t v37 = __Block_byref_object_dispose__12;
        v38 = "";
        memset(v39, 0, sizeof(v39));
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = ___ZN4SLAM21DefaultScriptProvider18FindScriptMatchingENSt3__18functionIFbRK16SLAMScriptDERObjEEE_block_invoke_13;
        v34[3] = &unk_264863330;
        v34[4] = &v35;
        uint64_t v17 = DERDecodeSequenceContentWithBlock((unint64_t *)v44, (uint64_t)v34);
        if (v17)
        {
          SLAM::Error::Unexpected((SLAM::Error *)"Failed to decode APDUs %d", (uint64_t)&__p, v17);
          *(std::string *)a3 = __p;
          memset(&__p, 0, sizeof(__p));
          *(unsigned char *)(a3 + 72) = 0;
          v32[0] = &__p;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v32);
        }
        else
        {
          v32[1] = 0;
          uint64_t v33 = 0;
          v32[0] = 0;
          std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v32, (const void *)v42, v42 + *((void *)&v42 + 1), *((size_t *)&v42 + 1));
          unsigned int v18 = v45;
          if ((void)v45) {
            unsigned int v18 = bswap32(*(_DWORD *)v45);
          }
          unint64_t v19 = bswap64(*(void *)v40);
          uint64_t v20 = v33;
          long long v21 = *(_OWORD *)v32;
          v32[1] = 0;
          uint64_t v33 = 0;
          v32[0] = 0;
          std::vector<std::string>::pointer end = v35.__end_;
          std::string::pointer data = v35.__end_[2].__r_.__value_.__l.__data_;
          long long v24 = *(_OWORD *)&v35.__end_[2].__r_.__value_.__r.__words[1];
          *(_OWORD *)(a3 + 48) = v24;
          end[2].__r_.__value_.__l.__size_ = 0;
          end[2].__r_.__value_.__r.__words[2] = 0;
          end[2].__r_.__value_.__r.__words[0] = 0;
          unsigned int v31 = v18;
          *(void *)a3 = v19;
          *(_OWORD *)(a3 + 8) = v21;
          *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v19;
          __p.__r_.__value_.__r.__words[2] = 0;
          uint64_t v26 = 0;
          *(void *)(a3 + 24) = v20;
          *(void *)(a3 + 32) = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v24 - (void)data) >> 3);
          *(void *)(a3 + 40) = data;
          unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v24 - (void)data) >> 3);
          uint64_t v28 = 0;
          uint64_t v29 = 0;
          uint64_t v30 = 0;
          *(_DWORD *)(a3 + 64) = v18;
          *(unsigned char *)(a3 + 72) = 1;
          SLAM::Script::~Script((SLAM::Script *)&__p);
          if (v32[0])
          {
            v32[1] = v32[0];
            operator delete(v32[0]);
          }
        }
        _Block_object_dispose(&v35, 8);
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v39;
        std::vector<std::vector<unsigned char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
        goto LABEL_13;
      }
      SLAM::Error::Error(&v35, "Could not find script within SEFW");
      long long v40 = 0uLL;
      *(void *)&long long v41 = 0;
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)&v40, (long long *)v35.__begin_, (long long *)v35.__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)v35.__end_ - (char *)v35.__begin_) >> 3));
      *(_OWORD *)a3 = v40;
      *(void *)(a3 + 16) = v41;
      *(void *)&long long v41 = 0;
      long long v40 = 0uLL;
      *(unsigned char *)(a3 + 72) = 0;
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v40;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v35;
      p_p = (std::vector<std::string> *)&__p;
    }
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)p_p);
LABEL_13:
    std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::~__value_func[abi:ne180100](v66);
    _Block_object_dispose(&v46, 8);
    if (v53)
    {
      *(void *)&long long v40 = &v52;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v40);
    }
    _Block_object_dispose(&v54, 8);
    goto LABEL_22;
  }
  SLAM::Error::Error((std::vector<std::string> *)&v40, "Legacy (plist) SLAM SEFW path is no longer supported");
  memset(&v54, 0, sizeof(v54));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v54, (long long *)v40, *((long long **)&v40 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v40 + 1) - v40) >> 3));
  *(std::string *)a3 = v54;
  memset(&v54, 0, sizeof(v54));
  *(unsigned char *)(a3 + 72) = 0;
  v46 = &v54;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v46);
  v46 = (std::string *)&v40;
  uint64_t v12 = (void ***)&v46;
LABEL_19:
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v12);
}

void sub_2293224EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,int a63)
{
  _Block_object_dispose(&a30, 8);
  std::vector<std::vector<unsigned char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::~__value_func[abi:ne180100](v64);
  _Block_object_dispose(&a53, 8);
  if (a62) {
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a39);
  }
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose((const void *)(v65 - 224), 8);
  _Unwind_Resume(a1);
}

void *SLAM::DefaultScriptProvider::GetScript@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  v12[4] = *MEMORY[0x263EF8340];
  int v11 = a4;
  uint64_t v9 = operator new(0x20uLL);
  *uint64_t v9 = &unk_26DD733E8;
  v9[1] = a2;
  v9[2] = a3;
  void v9[3] = &v11;
  void v12[3] = v9;
  SLAM::DefaultScriptProvider::FindScriptMatching(a1, (uint64_t)v12, a5);
  return std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::~__value_func[abi:ne180100](v12);
}

void sub_229322698(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 48);
  long long v3 = *(_OWORD *)(a2 + 64);
  long long v4 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v4;
  *(_OWORD *)(a1 + 48) = v2;
  *(_OWORD *)(a1 + 64) = v3;
  __n128 result = *(__n128 *)(a2 + 112);
  long long v6 = *(_OWORD *)(a2 + 128);
  long long v7 = *(_OWORD *)(a2 + 144);
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  *(_OWORD *)(a1 + 128) = v6;
  *(_OWORD *)(a1 + 144) = v7;
  *(__n128 *)(a1 + 112) = result;
  return result;
}

__n128 __Block_byref_object_copy__5(uint64_t a1, __n128 *a2)
{
  *(unsigned char *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 72) = 0;
  if (a2[4].n128_u8[8])
  {
    *(void *)(a1 + 48) = 0;
    *(void *)(a1 + 56) = 0;
    *(void *)(a1 + 64) = 0;
    __n128 result = a2[3];
    *(__n128 *)(a1 + 48) = result;
    *(void *)(a1 + 64) = a2[4].n128_u64[0];
    a2[3].n128_u64[0] = 0;
    a2[3].n128_u64[1] = 0;
    a2[4].n128_u64[0] = 0;
    *(unsigned char *)(a1 + 72) = 1;
  }
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v1 = (void **)(a1 + 48);
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v1);
  }
}

unint64_t *___ZN4SLAM21DefaultScriptProvider18FindScriptMatchingENSt3__18functionIFbRK16SLAMScriptDERObjEEE_block_invoke(void *a1, uint64_t a2, unsigned char *a3)
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  unint64_t v5 = DERParseSequenceContent((unint64_t *)(a2 + 8), (unsigned __int16)slamScriptItemSpecLen, (uint64_t)&slamScriptItemSpec, (unint64_t)&v20, 0x70uLL);
  if (!v5)
  {
    if (*(_DWORD *)(*(void *)(a1[4] + 8) + 24) >= 2u && *((void *)&v25 + 1) != 4)
    {
      std::string::basic_string[abi:ne180100](__p, (void *)v21, *((size_t *)&v21 + 1));
      if (v18 >= 0) {
        long long v7 = __p;
      }
      else {
        long long v7 = (void **)__p[0];
      }
      SLAM::Error::Error(&v19, "Platform Category absent for a script with name %s", (const char *)v7);
      std::optional<SLAM::Error>::operator=[abi:ne180100]<SLAM::Error,void>((std::vector<std::string> *)(*(void *)(a1[5] + 8) + 48), &v19);
      unint64_t v27 = &v19;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v27);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      *a3 = 1;
    }
    uint64_t v8 = a1[10];
    if (!v8) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    if ((*(unsigned int (**)(uint64_t, long long *))(*(void *)v8 + 48))(v8, &v20))
    {
      uint64_t v9 = *(void *)(a1[6] + 8);
      long long v11 = v25;
      long long v10 = v26;
      *(_OWORD *)(v9 + 112) = v24;
      *(_OWORD *)(v9 + 128) = v11;
      *(_OWORD *)(v9 + 144) = v10;
      long long v12 = v21;
      long long v14 = v22;
      long long v13 = v23;
      *(_OWORD *)(v9 + 48) = v20;
      *(_OWORD *)(v9 + 64) = v12;
      int v15 = *(unsigned __int8 *)(v9 + 160);
      *(_OWORD *)(v9 + 80) = v14;
      *(_OWORD *)(v9 + 96) = v13;
      if (!v15) {
        *(unsigned char *)(v9 + 160) = 1;
      }
      *a3 = 1;
    }
  }
  return v5;
}

void sub_2293228CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  *(void *)(v17 - 40) = v16;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v17 - 40));
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_56c46_ZTSNSt3__18functionIFbRK16SLAMScriptDERObjEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::__value_func[abi:ne180100](a1 + 56, a2 + 56);
}

void *__destroy_helper_block_ea8_56c46_ZTSNSt3__18functionIFbRK16SLAMScriptDERObjEEE(uint64_t a1)
{
  return std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::~__value_func[abi:ne180100]((void *)(a1 + 56));
}

__n128 __Block_byref_object_copy__11(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 48);
  std::vector<std::vector<unsigned char>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

uint64_t ___ZN4SLAM21DefaultScriptProvider18FindScriptMatchingENSt3__18functionIFbRK16SLAMScriptDERObjEEE_block_invoke_13(uint64_t a1, void *a2)
{
  if (*a2 != 4) {
    return 2;
  }
  long long v2 = *(uint64_t **)(*(void *)(a1 + 32) + 8);
  unint64_t v5 = (const void *)a2[1];
  size_t v4 = a2[2];
  long long v3 = (const void **)(a2 + 1);
  uint64_t v9 = (uint64_t)v5 + v4;
  long long v6 = (void *)v2[7];
  if ((unint64_t)v6 >= v2[8])
  {
    uint64_t v7 = std::vector<std::vector<unsigned char>>::__emplace_back_slow_path<unsigned char *&,unsigned char *>(v2 + 6, v3, &v9);
  }
  else
  {
    void *v6 = 0;
    v6[1] = 0;
    v6[2] = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v6, v5, (uint64_t)v5 + v4, v4);
    uint64_t v7 = (uint64_t)(v6 + 3);
    v2[7] = (uint64_t)(v6 + 3);
  }
  uint64_t result = 0;
  v2[7] = v7;
  return result;
}

void sub_2293229F0(_Unwind_Exception *a1)
{
  *(void *)(v2 + 56) = v1;
  _Unwind_Resume(a1);
}

void SLAM::Script::~Script(SLAM::Script *this)
{
  long long v3 = (void **)((char *)this + 40);
  std::vector<std::vector<unsigned char>>::__destroy_vector::operator()[abi:ne180100](&v3);
  uint64_t v2 = (void *)*((void *)this + 1);
  if (v2)
  {
    *((void *)this + 2) = v2;
    operator delete(v2);
  }
}

void SLAM::DefaultScriptProvider::~DefaultScriptProvider(SLAM::DefaultScriptProvider *this)
{
  *(void *)this = &unk_26DD732F0;
  uint64_t v2 = (void *)*((void *)this + 1);
  if (v2) {
    munmap(v2, *((void *)this + 2));
  }
  *((void *)this + 2) = 0;
}

{
  void *v2;
  uint64_t vars8;

  *(void *)this = &unk_26DD732F0;
  uint64_t v2 = (void *)*((void *)this + 1);
  if (v2) {
    munmap(v2, *((void *)this + 2));
  }
  *((void *)this + 2) = 0;

  JUMPOUT(0x22A6B67D0);
}

void *applesauce::v1::mapped_file::mapped_file(void *a1, uint64_t a2, __int16 a3)
{
  *a1 = 0;
  a1[1] = 0;
  if (*(char *)(a2 + 23) >= 0) {
    long long v6 = (const char *)a2;
  }
  else {
    long long v6 = *(const char **)a2;
  }
  int v7 = open(v6, 0);
  if (v7 < 0)
  {
    exception = (std::ios_base::failure *)__cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v22, "open()");
    int v15 = __error();
  }
  int v8 = v7;
  if (fstat(v7, &v22) < 0)
  {
    uint64_t v16 = (std::ios_base::failure *)__cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v20, "fstat()");
    uint64_t v17 = __error();
  }
  st_std::string::size_type size = v22.st_size;
  a1[1] = v22.st_size;
  if (a3)
  {
    int v10 = 0x7FFFFFFF;
    if (st_size < 0x7FFFFFFF) {
      int v10 = st_size;
    }
    int v21 = v10;
    long long v20 = 0;
    fcntl(v8, 44, &v20);
    st_std::string::size_type size = a1[1];
  }
  if ((a3 & 0x100) != 0) {
    int v11 = 1;
  }
  else {
    int v11 = 1025;
  }
  long long v12 = mmap(0, st_size, 1, v11, v8, 0);
  *a1 = v12;
  if (v12 == (void *)-1)
  {
    char v18 = (std::ios_base::failure *)__cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v20, "mmap()");
    std::vector<std::string> v19 = __error();
  }
  close(v8);
  return a1;
}

void sub_229322D08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0)
  {
    operator delete(__p);
    if ((v23 & 1) == 0)
    {
LABEL_6:
      close(v21);
      _Unwind_Resume(a1);
    }
  }
  else if (!v23)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v22);
  goto LABEL_6;
}

void applesauce::v1::anonymous namespace'::io_failure_exception(const void **a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, std::ios_base::failure *a4@<X8>)
{
  if (*((char *)a1 + 23) >= 0) {
    size_t v8 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v8 = (size_t)a1[1];
  }
  uint64_t v9 = &v19;
  std::string::basic_string[abi:ne180100]((uint64_t)&v19, v8 + 13);
  if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    uint64_t v9 = (std::string *)v19.__r_.__value_.__r.__words[0];
  }
  if (v8)
  {
    if (*((char *)a1 + 23) >= 0) {
      int v10 = a1;
    }
    else {
      int v10 = *a1;
    }
    memmove(v9, v10, v8);
  }
  strcpy((char *)v9 + v8, " failed for '");
  int v11 = *(char *)(a2 + 23);
  if (v11 >= 0) {
    long long v12 = (const std::string::value_type *)a2;
  }
  else {
    long long v12 = *(const std::string::value_type **)a2;
  }
  if (v11 >= 0) {
    std::string::size_type v13 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    std::string::size_type v13 = *(void *)(a2 + 8);
  }
  long long v14 = std::string::append(&v19, v12, v13);
  long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v20.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v20.__r_.__value_.__l.__data_ = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  uint64_t v16 = std::string::append(&v20, "'");
  long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  __msg.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__msg.__r_.__value_.__l.__data_ = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  *(void *)&__ec.__val_ = a3;
  __ec.__cat_ = std::generic_category();
  std::ios_base::failure::failure(a4, &__msg, &__ec);
  if (SHIBYTE(__msg.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__msg.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v20.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v19.__r_.__value_.__l.__data_);
  }
}

void sub_229322F00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    long long v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000;
    *(void *)a1 = v6;
  }
  else
  {
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 23) = a2;
  }
  return a1;
}

void std::__function::__func<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::~__func()
{
}

void *std::__function::__func<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26DD733A0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26DD733A0;
  a2[1] = v2;
  return result;
}

BOOL std::__function::__func<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::operator()(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 8) == 8 && bswap64(**(void **)a2) == **(void **)(a1 + 8);
}

void *std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
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

void std::__function::__func<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::~__func()
{
}

__n128 std::__function::__func<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)uint64_t v2 = &unk_26DD733E8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26DD733E8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

BOOL std::__function::__func<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::operator()(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 88) == 4) {
    unsigned int v4 = bswap32(**(_DWORD **)(a2 + 80));
  }
  else {
    unsigned int v4 = 1;
  }
  size_t v5 = *(void *)(a2 + 24);
  long long v6 = *(void **)(a1 + 8);
  if (*((char *)v6 + 23) < 0)
  {
    if (v5 != v6[1]) {
      return 0;
    }
    long long v6 = (void *)*v6;
  }
  else if (v5 != *((unsigned __int8 *)v6 + 23))
  {
    return 0;
  }
  if (memcmp(v6, *(const void **)(a2 + 16), v5)) {
    return 0;
  }
  size_t v7 = *(void *)(a2 + 40);
  uint64_t v8 = *(void *)(a1 + 16);
  if (v7 != *(void *)(v8 + 8) - *(void *)v8 || memcmp(*(const void **)v8, *(const void **)(a2 + 32), v7)) {
    return 0;
  }
  return !v4 || **(_DWORD **)(a1 + 24) == v4;
}

uint64_t std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
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

uint64_t std::vector<std::vector<unsigned char>>::__emplace_back_slow_path<unsigned char *&,unsigned char *>(uint64_t *a1, const void **a2, uint64_t *a3)
{
  uint64_t v4 = *a1;
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v6 = v5 + 1;
  if (v5 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v9 = (uint64_t)(a1 + 2);
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v4) >> 3);
  if (2 * v10 > v6) {
    unint64_t v6 = 2 * v10;
  }
  if (v10 >= 0x555555555555555) {
    unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v11 = v6;
  }
  stat v22 = a1 + 2;
  if (v11) {
    long long v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v9, v11);
  }
  else {
    long long v12 = 0;
  }
  std::string::size_type v13 = &v12[24 * v5];
  v19[0] = v12;
  v19[1] = v13;
  std::string v20 = v13;
  int v21 = &v12[24 * v11];
  long long v14 = *a2;
  uint64_t v15 = *a3;
  size_t v16 = *a3 - (void)*a2;
  *(void *)std::string::size_type v13 = 0;
  *((void *)v13 + 1) = 0;
  *((void *)v13 + 2) = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v13, v14, v15, v16);
  v20 += 24;
  std::vector<std::vector<unsigned char>>::__swap_out_circular_buffer(a1, v19);
  uint64_t v17 = a1[1];
  std::__split_buffer<std::vector<unsigned char>>::~__split_buffer((uint64_t)v19);
  return v17;
}

void sub_229323424(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::vector<unsigned char>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<unsigned char>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<unsigned char>>,std::reverse_iterator<std::vector<unsigned char>*>,std::reverse_iterator<std::vector<unsigned char>*>,std::reverse_iterator<std::vector<unsigned char>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<unsigned char>>,std::reverse_iterator<std::vector<unsigned char>*>,std::reverse_iterator<std::vector<unsigned char>*>,std::reverse_iterator<std::vector<unsigned char>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  uint64_t v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      long long v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(void *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 24;
      *((void *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<unsigned char>>,std::reverse_iterator<std::vector<unsigned char>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<unsigned char>>,std::reverse_iterator<std::vector<unsigned char>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<unsigned char>>,std::reverse_iterator<std::vector<unsigned char>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<unsigned char>>,std::reverse_iterator<std::vector<unsigned char>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(void **)v1;
    if (*(void *)v1)
    {
      *(void *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<unsigned char>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::vector<unsigned char>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    uint64_t v5 = *(void **)(v2 - 24);
    *(void *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(void *)(v2 - 16) = v5;
      operator delete(v5);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  uint64_t v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_68;
  }
  uint64_t v5 = &v4[v3];
  uint64_t v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    char v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      long long v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15) {
            unint64_t v17 = *v12;
          }
          else {
            unint64_t v17 = v7 - 1;
          }
          BOOL v10 = v5 >= v14;
          unint64_t v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3) {
              return 0;
            }
LABEL_34:
            uint64_t result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4) {
        goto LABEL_69;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_69;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_70;
        }
        unsigned int v24 = *v14++;
        unint64_t v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (a3) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v15 > v22;
          }
          char v26 = v25;
          uint64_t result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0) {
            return result;
          }
          if (v15 >= v22) {
            unint64_t v27 = v22;
          }
          else {
            unint64_t v27 = v15;
          }
          BOOL v10 = (unint64_t)v5 >= v23;
          uint64_t v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28) {
            goto LABEL_69;
          }
          a2[1] = v23;
          a2[2] = v27;
          if (a3) {
            goto LABEL_34;
          }
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  uint64_t result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_68;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_69;
    }
    char v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = DERParseInteger64(a1, v4);
  if (!result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7;
    }
    else
    {
      uint64_t result = 0;
      *a2 = v4[0];
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2 = (unint64_t)a1[1];
  if (!v2) {
    return 3;
  }
  unint64_t v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0) {
    return 3;
  }
  if (**a1)
  {
    if (v2 > 8) {
      return 7;
    }
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0) {
      return 3;
    }
    if (v2 > 9) {
      return 7;
    }
  }
LABEL_10:
  unint64_t v5 = 0;
  do
  {
    unsigned int v6 = *v3++;
    unint64_t v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  uint64_t result = 0;
  *a2 = v5;
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, void *a2, void *a3)
{
  v8[3] = *MEMORY[0x263EF8340];
  memset(v8, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v8, 0);
  if (!result)
  {
    unint64_t v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        unint64_t v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          uint64_t result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2 = *result;
  unint64_t v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    unint64_t v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  v10[2] = *MEMORY[0x263EF8340];
  v10[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 >= v3) {
    return 1;
  }
  v10[0] = *a1;
  v10[1] = v3 - v2;
  uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!result)
  {
    unint64_t v8 = a2[1];
    unint64_t v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      unint64_t v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        uint64_t result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t DERParseSequenceToObject(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  void v12[3] = *MEMORY[0x263EF8340];
  memset(v12, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v12, 0);
  if (!result)
  {
    if (v12[0] == 0x2000000000000010) {
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t DERParseSequenceContentToObject(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unint64_t v32 = 0;
  if (a6)
  {
    if (a6 > a5) {
      goto LABEL_59;
    }
    bzero((void *)a4, a6);
  }
  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  if (__CFADD__(*a1, v11)) {
    goto LABEL_58;
  }
  unint64_t v12 = v10 + v11;
  if (v10 > v12) {
LABEL_59:
  }
    __break(0x5519u);
  unint64_t v32 = *a1;
  unint64_t v33 = v12;
  if (a2)
  {
    unsigned __int16 v13 = 0;
    uint64_t v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      unint64_t v15 = v32;
      unint64_t v14 = v33;
      uint64_t result = DERDecodeSeqNext(&v32, v31);
      if (result) {
        break;
      }
      if (a2 <= v13) {
        return 2;
      }
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3) {
          goto LABEL_58;
        }
        unsigned __int16 v17 = v13;
        __int16 v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(void *)(a3 + 24 * v13 + 8)) {
          break;
        }
        uint64_t result = 2;
        if (v18)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1)) {
            continue;
          }
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        unint64_t v19 = *(void *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5) {
          return 7;
        }
        if (v19 > ~a4) {
          goto LABEL_58;
        }
        uint64_t v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4) {
          goto LABEL_59;
        }
        *(_OWORD *)uint64_t v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((void *)v21 + 1) <= v14 - v15)
            {
              *(void *)uint64_t v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29) {
            goto LABEL_59;
          }
          uint64_t v23 = *((void *)v21 + 1);
          unint64_t v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15) {
            goto LABEL_59;
          }
          *(void *)uint64_t v21 = v15;
          *((void *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          unint64_t v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            unint64_t v10 = v31[1] + v31[2];
            unint64_t v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        unint64_t v10 = v32;
        unint64_t v12 = v33;
        goto LABEL_47;
      }
    }
    if (result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        BOOL v25 = (__int16 *)(a3 + 24 * v13 + 16);
        unint64_t v26 = a2 - (unint64_t)v13;
        uint64_t result = 0;
        while (1)
        {
          __int16 v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0) {
            break;
          }
          if (!--v26) {
            return result;
          }
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12) {
      return 0;
    }
    else {
      return 3;
    }
  }
  return result;
}

uint64_t DERParseSequence(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return DERParseSequenceToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

unint64_t *DERParseSequenceContent(unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return (unint64_t *)DERParseSequenceContentToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSequenceWithBlock(uint64_t a1, uint64_t a2)
{
  v4[3] = *MEMORY[0x263EF8340];
  memset(v4, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v4, 0);
  if (!result)
  {
    if (v4[0] - 0x2000000000000012 >= 0xFFFFFFFFFFFFFFFELL) {
      return DERDecodeSequenceContentWithBlock(&v4[1], a2);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t DERDecodeSequenceContentWithBlock(unint64_t *a1, uint64_t a2)
{
  v9[2] = *MEMORY[0x263EF8340];
  v9[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (__CFADD__(*a1, v3))
  {
    __break(0x5513u);
LABEL_13:
    __break(0x5519u);
  }
  unint64_t v4 = v2 + v3;
  if (v2 > v4) {
    goto LABEL_13;
  }
  v9[0] = *a1;
  v9[1] = v4;
  memset(v8, 170, sizeof(v8));
  char v7 = 0;
  while (1)
  {
    LODWORD(result) = DERDecodeSeqNext(v9, v8);
    if (result) {
      break;
    }
    LODWORD(result) = (*(uint64_t (**)(uint64_t, unint64_t *, char *))(a2 + 16))(a2, v8, &v7);
    if (result) {
      break;
    }
    if (v7) {
      return 0;
    }
  }
  if (result <= 1) {
    return 0;
  }
  else {
    return result;
  }
}

unint64_t DEREncodeLengthSized(unint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4)
{
  if (result >= 0x80)
  {
    uint64_t v5 = 0;
    unint64_t v6 = result;
    do
    {
      --v5;
      BOOL v7 = v6 > 0xFF;
      v6 >>= 8;
    }
    while (v7);
    unint64_t v8 = -v5;
    uint64_t v9 = 7;
    if (-v5 < a3 && v8 <= 0x7E)
    {
      if (*a4)
      {
        uint64_t v4 = 1 - v5;
        *(unsigned char *)a2 = -(char)v5 | 0x80;
        if (v8 < ~a2)
        {
          unint64_t v10 = (unsigned char *)(a2 - v5);
          if (a2 - v5 != -2)
          {
            unint64_t v11 = (unsigned char *)(a2 + *a4);
            while (v10 != (unsigned char *)-1)
            {
              if (v10 >= v11 || (unint64_t)v10 < a2) {
                goto LABEL_23;
              }
              *v10-- = result;
              BOOL v7 = result > 0xFF;
              result >>= 8;
              if (!v7)
              {
                if (v8 >= *a4) {
                  goto LABEL_23;
                }
                goto LABEL_19;
              }
            }
          }
        }
        __break(0x5513u);
      }
      goto LABEL_23;
    }
    return v9;
  }
  if (!a3) {
    return 7;
  }
  if (*a4)
  {
    *(unsigned char *)a2 = result;
    if (*a4)
    {
      uint64_t v4 = 1;
LABEL_19:
      uint64_t v9 = 0;
      *a4 = v4;
      return v9;
    }
  }
LABEL_23:
  __break(0x5519u);
  return result;
}

uint64_t DEREncodeTag(uint64_t result, unint64_t a2, unint64_t *a3)
{
  unint64_t v3 = result & 0x1FFFFFFFFFFFFFFFLL;
  if ((result & 0x1FFFFFFFFFFFFFFFuLL) < 0x1F)
  {
    if (*a3)
    {
      *(unsigned char *)a2 = HIBYTE(result) & 0xE0 | result;
      unint64_t v8 = 1;
      goto LABEL_17;
    }
    return 7;
  }
  unint64_t v4 = 0;
  unint64_t v5 = result & 0x1FFFFFFFFFFFFFFFLL;
  do
  {
    ++v4;
    BOOL v6 = v5 > 0x7F;
    v5 >>= 7;
  }
  while (v6);
  unint64_t v7 = *a3;
  if (v4 >= *a3) {
    return 7;
  }
  if (v4 >= ~a2 || (*(unsigned char *)a2 = HIBYTE(result) | 0x1F, a2 + v4 == -2))
  {
LABEL_20:
    __break(0x5513u);
    goto LABEL_21;
  }
  if (a2 + v4 >= a2)
  {
    unint64_t v8 = v4 + 1;
    *(unsigned char *)(a2 + v4) = result & 0x7F;
    if (v3 >= 0x80)
    {
      uint64_t v9 = (unsigned char *)(a2 + v4 - 1);
      unint64_t v10 = (unsigned char *)(a2 + v7);
      while (v9 != (unsigned char *)-2)
      {
        if (v9 >= v10 || (unint64_t)v9 < a2) {
          goto LABEL_21;
        }
        unint64_t v11 = v3 >> 14;
        v3 >>= 7;
        *v9-- = v3 | 0x80;
        if (!v11) {
          goto LABEL_17;
        }
      }
      goto LABEL_20;
    }
LABEL_17:
    if (v8 <= *a3)
    {
      uint64_t result = 0;
      *a3 = v8;
      return result;
    }
  }
LABEL_21:
  __break(0x5519u);
  return result;
}

uint64_t DEREncodeSequenceFromObject(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4, uint64_t a5, unint64_t a6, unint64_t a7, unint64_t *a8)
{
  v45[1] = *MEMORY[0x263EF8340];
  unint64_t v8 = ~a6;
  if (~a6 < a7) {
    goto LABEL_73;
  }
  unint64_t v11 = *a8;
  unint64_t v44 = a7;
  v45[0] = 0;
  if (v11 < a7) {
    goto LABEL_74;
  }
  uint64_t result = DEREncodeTag(a1, a6, &v44);
  if (result) {
    return result;
  }
  if (v44 > v8) {
    goto LABEL_73;
  }
  unint64_t v17 = a7 - v44;
  if (a7 < v44) {
    goto LABEL_75;
  }
  unint64_t v18 = a6 + a7;
  unint64_t v19 = a6 + v44;
  if (a6 + v44 < v18)
  {
    uint64_t result = DERContentLengthOfEncodedSequence(a2, a3, a4, a5, v45);
    if (result) {
      return result;
    }
    unint64_t v44 = v17;
    if (v19 > a6 + v11 || v19 < a6 || v17 > a6 + v11 - v19) {
      goto LABEL_74;
    }
    unint64_t v42 = a6 + v11;
    unint64_t v20 = v45[0];
    uint64_t result = DEREncodeLengthSized(v45[0], v19, v17, (uint64_t *)&v44);
    if (result) {
      return result;
    }
    unint64_t v21 = v42;
    if (__CFADD__(v19, v44))
    {
LABEL_73:
      __break(0x5513u);
      goto LABEL_74;
    }
    unint64_t v22 = v17 - v44;
    if (v17 >= v44)
    {
      uint64_t v23 = (unsigned char *)(v19 + v44);
      if (!__CFADD__(v19 + v44, v20))
      {
        if ((unint64_t)&v23[v20] > v18) {
          return 7;
        }
        if (a4)
        {
          unint64_t v24 = 0;
          unint64_t v25 = a2 + a3;
          uint64_t v41 = 24 * a4;
          while (1)
          {
            if (v24 > ~a5) {
              goto LABEL_73;
            }
            unint64_t v26 = *(void *)(a5 + v24);
            if (v26 > ~a2) {
              goto LABEL_73;
            }
            __int16 v27 = (const void **)(a2 + v26);
            __int16 v28 = *(_WORD *)(a5 + v24 + 16);
            if ((v28 & 0x200) != 0) {
              break;
            }
            if ((v28 & 1) == 0) {
              goto LABEL_29;
            }
            if ((unint64_t)v27 < a2 || (unint64_t)(v27 + 2) > v25) {
              goto LABEL_74;
            }
            if (v27[1])
            {
LABEL_29:
              unint64_t v44 = v22;
              if ((unint64_t)v23 > v21 || (unint64_t)v23 < a6 || v22 > v21 - (unint64_t)v23) {
                goto LABEL_74;
              }
              uint64_t result = DEREncodeTag(*(void *)(a5 + v24 + 8), (unint64_t)v23, &v44);
              if (result) {
                return result;
              }
              if (__CFADD__(v23, v44)) {
                goto LABEL_73;
              }
              unint64_t v30 = v22 - v44;
              if (v22 < v44) {
                goto LABEL_75;
              }
              if ((unint64_t)v27 < a2 || (unint64_t)(v27 + 2) > v25) {
                goto LABEL_74;
              }
              unint64_t v31 = (unint64_t)v27[1];
              v45[0] = v31;
              char v32 = 1;
              if ((v28 & 0x100) != 0 && v31 && *(char *)*v27 < 0)
              {
                char v32 = 0;
                v45[0] = ++v31;
              }
              unint64_t v33 = (unint64_t)&v23[v44];
              unint64_t v44 = v30;
              if (v33 > v42 || v33 < a6 || v30 > v42 - v33) {
                goto LABEL_74;
              }
              uint64_t result = DEREncodeLengthSized(v31, v33, v30, (uint64_t *)&v44);
              if (result) {
                return result;
              }
              unint64_t v34 = v44;
              if (__CFADD__(v33, v44)) {
                goto LABEL_73;
              }
              unint64_t v35 = v30 - v44;
              if (v30 < v44) {
                goto LABEL_75;
              }
              uint64_t v23 = (unsigned char *)(v33 + v44);
              if ((v32 & 1) == 0)
              {
                if (v23 == (unsigned char *)-1) {
                  goto LABEL_73;
                }
                if ((unint64_t)v23 >= v42 || (unint64_t)v23 < a6) {
                  goto LABEL_74;
                }
                *uint64_t v23 = 0;
                --v35;
                if (v30 == v34) {
                  goto LABEL_75;
                }
                ++v23;
              }
              if ((unint64_t)v23 > v42) {
                goto LABEL_74;
              }
              if ((unint64_t)v23 < a6) {
                goto LABEL_74;
              }
              size_t v36 = (size_t)v27[1];
              if (v36 > v42 - (unint64_t)v23) {
                goto LABEL_74;
              }
              uint64_t result = (uint64_t)memmove(v23, *v27, v36);
              unint64_t v21 = v42;
              unint64_t v37 = (unint64_t)v27[1];
              if (__CFADD__(v23, v37)) {
                goto LABEL_73;
              }
              unint64_t v22 = v35 - v37;
              if (v35 < v37) {
                goto LABEL_75;
              }
              goto LABEL_69;
            }
LABEL_70:
            v24 += 24;
            if (v41 == v24) {
              goto LABEL_71;
            }
          }
          if ((unint64_t)v27 < a2 || (unint64_t)(v27 + 2) > v25) {
            goto LABEL_74;
          }
          if ((unint64_t)v23 > v21) {
            goto LABEL_74;
          }
          if ((unint64_t)v23 < a6) {
            goto LABEL_74;
          }
          size_t v39 = (size_t)v27[1];
          if (v39 > v21 - (unint64_t)v23) {
            goto LABEL_74;
          }
          uint64_t result = (uint64_t)memmove(v23, *v27, v39);
          unint64_t v21 = v42;
          unint64_t v37 = (unint64_t)v27[1];
          if (__CFADD__(v23, v37)) {
            goto LABEL_73;
          }
          BOOL v40 = v22 >= v37;
          v22 -= v37;
          if (!v40) {
            goto LABEL_75;
          }
LABEL_69:
          v23 += v37;
          goto LABEL_70;
        }
LABEL_71:
        if ((unint64_t)&v23[-a6] <= *a8)
        {
          uint64_t result = 0;
          *a8 = (unint64_t)&v23[-a6];
          return result;
        }
LABEL_74:
        __break(0x5519u);
      }
      goto LABEL_73;
    }
LABEL_75:
    __break(0x5515u);
    return result;
  }
  return 7;
}

unint64_t DERContentLengthOfEncodedSequence(unint64_t result, unint64_t a2, int a3, uint64_t a4, void *a5)
{
  uint64_t v5 = 0;
  if (!a3)
  {
LABEL_38:
    uint64_t result = 0;
LABEL_40:
    *a5 = v5;
    return result;
  }
  unsigned int v6 = 0;
  unint64_t v7 = result + a2;
  while (24 * (unint64_t)v6 <= ~a4)
  {
    unint64_t v8 = *(void *)(a4 + 24 * v6);
    BOOL v9 = v8 > 0xFFFFFFFFFFFFFFEFLL || v8 + 16 > a2;
    if (v9)
    {
      uint64_t v5 = 0;
      uint64_t result = 7;
      goto LABEL_40;
    }
    if (v8 > ~result) {
      break;
    }
    unint64_t v10 = (unsigned __int8 **)(result + v8);
    __int16 v11 = *(_WORD *)(a4 + 24 * v6 + 16);
    if ((v11 & 0x200) == 0)
    {
      if (v11)
      {
        if ((unint64_t)v10 < result || (unint64_t)(v10 + 2) > v7) {
          goto LABEL_43;
        }
        if (!v10[1]) {
          goto LABEL_37;
        }
      }
      unint64_t v13 = *(void *)(a4 + 24 * v6 + 8) & 0x1FFFFFFFFFFFFFFFLL;
      uint64_t v14 = 1;
      if (v13 >= 0x1F)
      {
        do
        {
          ++v14;
          BOOL v9 = v13 > 0x7F;
          v13 >>= 7;
        }
        while (v9);
      }
      BOOL v15 = __CFADD__(v5, v14);
      uint64_t v16 = v5 + v14;
      if (v15) {
        goto LABEL_42;
      }
      if ((unint64_t)v10 < result || (unint64_t)(v10 + 2) > v7) {
        goto LABEL_43;
      }
      unint64_t v17 = (unint64_t)v10[1];
      if ((*(_WORD *)(a4 + 24 * v6 + 16) & 0x100) != 0)
      {
        if (v17)
        {
          v17 += (unint64_t)**v10 >> 7;
          goto LABEL_24;
        }
LABEL_25:
        uint64_t v18 = 1;
      }
      else
      {
LABEL_24:
        if (v17 < 0x80) {
          goto LABEL_25;
        }
        uint64_t v18 = 1;
        unint64_t v21 = v17;
        do
        {
          ++v18;
          BOOL v9 = v21 > 0xFF;
          v21 >>= 8;
        }
        while (v9);
      }
      BOOL v15 = __CFADD__(v16, v18);
      uint64_t v22 = v16 + v18;
      if (v15) {
        goto LABEL_42;
      }
      BOOL v15 = __CFADD__(v22, v17);
      uint64_t v5 = v22 + v17;
      if (v15) {
        goto LABEL_42;
      }
      goto LABEL_37;
    }
    if ((unint64_t)v10 < result || (unint64_t)(v10 + 2) > v7) {
      goto LABEL_43;
    }
    unint64_t v20 = v10[1];
    BOOL v15 = __CFADD__(v5, v20);
    v5 += (uint64_t)v20;
    if (v15) {
      goto LABEL_42;
    }
LABEL_37:
    if (++v6 == a3) {
      goto LABEL_38;
    }
  }
  __break(0x5513u);
LABEL_42:
  __break(0x5500u);
LABEL_43:
  __break(0x5519u);
  return result;
}

uint64_t DEREncodeSequence(uint64_t result, unint64_t a2, unsigned int a3, uint64_t a4, unint64_t a5, unint64_t *a6)
{
  if ((a2 | 0x7FFFFFFFFFFFFFFFLL) >= a2) {
    return DEREncodeSequenceFromObject(result, a2, ~a2 & 0x7FFFFFFFFFFFFFFFLL, a3, a4, a5, *a6, a6);
  }
  __break(0x5519u);
  return result;
}

unint64_t DERLengthOfEncodedSequenceFromObject(uint64_t a1, unint64_t a2, unint64_t a3, int a4, uint64_t a5, uint64_t *a6)
{
  v17[1] = *MEMORY[0x263EF8340];
  v17[0] = 0;
  unint64_t result = DERContentLengthOfEncodedSequence(a2, a3, a4, a5, v17);
  if (!result)
  {
    unint64_t v9 = a1 & 0x1FFFFFFFFFFFFFFFLL;
    uint64_t v10 = 1;
    if ((a1 & 0x1FFFFFFFFFFFFFFFuLL) >= 0x1F)
    {
      do
      {
        ++v10;
        BOOL v11 = v9 > 0x7F;
        v9 >>= 7;
      }
      while (v11);
    }
    uint64_t v12 = 1;
    if (v17[0] >= 0x80uLL)
    {
      unint64_t v13 = v17[0];
      do
      {
        ++v12;
        BOOL v11 = v13 > 0xFF;
        v13 >>= 8;
      }
      while (v11);
    }
    BOOL v14 = __CFADD__(v10, v12);
    uint64_t v15 = v10 + v12;
    if (v14 || (BOOL v14 = __CFADD__(v15, v17[0]), v16 = v15 + v17[0], v14))
    {
      __break(0x5500u);
    }
    else
    {
      unint64_t result = 0;
      *a6 = v16;
    }
  }
  return result;
}

uint64_t DERLengthOfEncodedSequence(uint64_t a1, unint64_t a2, int a3, uint64_t a4)
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if ((a2 | 0x7FFFFFFFFFFFFFFFLL) < a2) {
    __break(0x5519u);
  }
  if (DERLengthOfEncodedSequenceFromObject(a1, a2, ~a2 & 0x7FFFFFFFFFFFFFFFLL, a3, a4, v5)) {
    return 0;
  }
  else {
    return v5[0];
  }
}

SERestoreInfo::SN300V2DeviceInfo *SERestoreInfo::SN300V2DeviceInfo::SN300V2DeviceInfo(SERestoreInfo::SN300V2DeviceInfo *this, const SERestoreInfo::BLOB *a2)
{
  unint64_t v3 = SERestoreInfo::P73BaseDeviceInfo::P73BaseDeviceInfo(this, a2);
  *(void *)unint64_t v3 = &unk_26DD73430;
  if (*((_DWORD *)v3 + 14) != 54)
  {
    exception = (SERestoreInfo::SEWrongDeviceInfo *)__cxa_allocate_exception(0x48uLL);
    SERestoreInfo::SEWrongDeviceInfo::SEWrongDeviceInfo(exception);
  }
  return this;
}

void sub_22932498C(_Unwind_Exception *a1)
{
  SERestoreInfo::P73BaseDeviceInfo::~P73BaseDeviceInfo(v1);
  _Unwind_Resume(a1);
}

void SERestoreInfo::P73BaseDeviceInfo::~P73BaseDeviceInfo(SERestoreInfo::P73BaseDeviceInfo *this)
{
  *(void *)this = &unk_26DD739B8;
  unint64_t v2 = (void *)*((void *)this + 19);
  if (v2)
  {
    *((void *)this + 20) = v2;
    operator delete(v2);
  }
  unint64_t v3 = (void *)*((void *)this + 14);
  if (v3)
  {
    *((void *)this + 15) = v3;
    operator delete(v3);
  }
  unint64_t v4 = (void *)*((void *)this + 11);
  if (v4)
  {
    *((void *)this + 12) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 8);
  if (v5)
  {
    *((void *)this + 9) = v5;
    operator delete(v5);
  }
  unsigned int v6 = (void *)*((void *)this + 4);
  if (v6)
  {
    *((void *)this + 5) = v6;
    operator delete(v6);
  }
}

{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  *(void *)this = &unk_26DD739B8;
  unint64_t v2 = (void *)*((void *)this + 19);
  if (v2)
  {
    *((void *)this + 20) = v2;
    operator delete(v2);
  }
  unint64_t v3 = (void *)*((void *)this + 14);
  if (v3)
  {
    *((void *)this + 15) = v3;
    operator delete(v3);
  }
  unint64_t v4 = (void *)*((void *)this + 11);
  if (v4)
  {
    *((void *)this + 12) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 8);
  if (v5)
  {
    *((void *)this + 9) = v5;
    operator delete(v5);
  }
  unsigned int v6 = (void *)*((void *)this + 4);
  if (v6)
  {
    *((void *)this + 5) = v6;
    operator delete(v6);
  }
}

{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t vars8;

  *(void *)this = &unk_26DD739B8;
  unint64_t v2 = (void *)*((void *)this + 19);
  if (v2)
  {
    *((void *)this + 20) = v2;
    operator delete(v2);
  }
  unint64_t v3 = (void *)*((void *)this + 14);
  if (v3)
  {
    *((void *)this + 15) = v3;
    operator delete(v3);
  }
  unint64_t v4 = (void *)*((void *)this + 11);
  if (v4)
  {
    *((void *)this + 12) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 8);
  if (v5)
  {
    *((void *)this + 9) = v5;
    operator delete(v5);
  }
  unsigned int v6 = (void *)*((void *)this + 4);
  if (v6)
  {
    *((void *)this + 5) = v6;
    operator delete(v6);
  }

  JUMPOUT(0x22A6B67D0);
}

void SERestoreInfo::SN300V2DeviceInfo::~SN300V2DeviceInfo(SERestoreInfo::SN300V2DeviceInfo *this)
{
  *(void *)this = &unk_26DD739B8;
  unint64_t v2 = (void *)*((void *)this + 19);
  if (v2)
  {
    *((void *)this + 20) = v2;
    operator delete(v2);
  }
  unint64_t v3 = (void *)*((void *)this + 14);
  if (v3)
  {
    *((void *)this + 15) = v3;
    operator delete(v3);
  }
  unint64_t v4 = (void *)*((void *)this + 11);
  if (v4)
  {
    *((void *)this + 12) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 8);
  if (v5)
  {
    *((void *)this + 9) = v5;
    operator delete(v5);
  }
  unsigned int v6 = (void *)*((void *)this + 4);
  if (v6)
  {
    *((void *)this + 5) = v6;
    operator delete(v6);
  }
}

{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t vars8;

  *(void *)this = &unk_26DD739B8;
  unint64_t v2 = (void *)*((void *)this + 19);
  if (v2)
  {
    *((void *)this + 20) = v2;
    operator delete(v2);
  }
  unint64_t v3 = (void *)*((void *)this + 14);
  if (v3)
  {
    *((void *)this + 15) = v3;
    operator delete(v3);
  }
  unint64_t v4 = (void *)*((void *)this + 11);
  if (v4)
  {
    *((void *)this + 12) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 8);
  if (v5)
  {
    *((void *)this + 9) = v5;
    operator delete(v5);
  }
  unsigned int v6 = (void *)*((void *)this + 4);
  if (v6)
  {
    *((void *)this + 5) = v6;
    operator delete(v6);
  }

  JUMPOUT(0x22A6B67D0);
}

void *SERestoreInfo::P73BaseDeviceInfo::getOsKeyId@<X0>(SERestoreInfo::P73BaseDeviceInfo *this@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a2, *((const void **)this + 14), *((void *)this + 15), *((void *)this + 15) - *((void *)this + 14));
}

uint64_t SERestoreInfo::P73BaseDeviceInfo::getChipID(SERestoreInfo::P73BaseDeviceInfo *this)
{
  return *((unsigned int *)this + 14);
}

SERestoreInfo::SEWrongDeviceInfo *SERestoreInfo::SEWrongDeviceInfo::SEWrongDeviceInfo(SERestoreInfo::SEWrongDeviceInfo *this)
{
  std::string::basic_string[abi:ne180100]<0>(__p, "Wrong DeviceInfo");
  SERestoreInfo::SEException::SEException((uint64_t)this, (long long *)__p, 2, @"SEUpdaterErrorDomain");
  if (v4 < 0) {
    operator delete(__p[0]);
  }
  *(void *)this = &unk_26DD73498;
  return this;
}

void SERestoreInfo::SEWrongDeviceInfo::~SEWrongDeviceInfo(std::exception *this)
{
  SERestoreInfo::SEException::~SEException(this);

  JUMPOUT(0x22A6B67D0);
}

uint64_t SERestoreInfo::SEException::what(SERestoreInfo::SEException *this)
{
  uint64_t result = (uint64_t)this + 8;
  if (*((char *)this + 31) < 0) {
    return *(void *)result;
  }
  return result;
}

void AlohaVerificationOptions::print(AlohaVerificationOptions *this)
{
  unint64_t v2 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  unint64_t v3 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v2);
  }
  char v4 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  SEUpdaterUtil::SELogObj::printLog(v3, (SEUpdaterUtil::SELogObj *)2, 0, 1, "print", (SEUpdaterUtil::SELogObj *)"Verify options:\n");
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  uint64_t v5 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  unsigned int v6 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v5);
  }
  unint64_t v7 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  SEUpdaterUtil::SELogObj::printLog(v6, (SEUpdaterUtil::SELogObj *)2, 0, 1, "print", (SEUpdaterUtil::SELogObj *)"  useDebugSSEInterface: %d\n", this->var0);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  unint64_t v8 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  unint64_t v9 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v8);
  }
  uint64_t v10 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  SEUpdaterUtil::SELogObj::printLog(v9, (SEUpdaterUtil::SELogObj *)2, 0, 1, "print", (SEUpdaterUtil::SELogObj *)"  restoreEnvironment: %d\n", this->var1);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

void sub_229324E8C(_Unwind_Exception *a1)
{
}

void verifyAlohaPairing(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  unsigned int v6 = [AlohaPairingVerifier alloc];
  unint64_t v7 = (std::__shared_weak_count *)a1[1];
  uint64_t v10 = *a1;
  BOOL v11 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  unint64_t v8 = [(AlohaPairingVerifier *)v6 initWithController:&v10 options:a2];
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  unint64_t v9 = [(AlohaPairingVerifier *)v8 performAlohaVerification];
  _ObjCLog((SEUpdaterUtil::SELogObj *)2, "verifyAlohaPairing", &cfstr_VerifiedResult.isa, v9);
  [(AlohaPairingVerifier *)v8 invalidate];
  if (v9)
  {
    *a3 = v9;
    CFRetain(v9);
  }
  else
  {
    *a3 = 0;
  }
}

void sub_229324FD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2293250B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }

  _Unwind_Resume(a1);
}

void sub_2293254A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va3, a4);
  va_start(va2, a4);
  va_start(va1, a4);
  va_start(va, a4);
  unint64_t v9 = va_arg(va1, const void *);
  uint64_t v11 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v12 = va_arg(va2, const void *);
  uint64_t v14 = va_arg(va2, void);
  va_copy(va3, va2);
  uint64_t v15 = va_arg(va3, const void *);
  ctu::cf::detail::TakeOwnershipProxy<__CFData const>::~TakeOwnershipProxy((const void **)va);
  ctu::cf::detail::TakeOwnershipProxy<__CFData const>::~TakeOwnershipProxy((const void **)va1);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va2);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va3);

  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get(uint64_t a1)
{
  return *(void *)a1;
}

void sub_229325768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t getSSEIOConnect(void)
{
  kern_return_t v4;

  if ((_MergedGlobals_0 & 1) == 0)
  {
    mach_port_t v0 = *MEMORY[0x263F0EC88];
    CFDictionaryRef v1 = IOServiceMatching("AppleSSE");
    io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
    if (MatchingService)
    {
      io_object_t v3 = MatchingService;
      char v4 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, (io_connect_t *)&dword_26AD82994);
      IOObjectRelease(v3);
      if (!v4) {
        _MergedGlobals_0 = 1;
      }
    }
  }
  return dword_26AD82994;
}

void sub_229325AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);

  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::get(uint64_t a1)
{
  return *(void *)a1;
}

void sub_229325CA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_229325E10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *SEUpdaterUtil::SELogObj::printLog(SEUpdaterUtil::SELogObj *this, SEUpdaterUtil::SELogObj *a2, int a3, int a4, const char *a5, SEUpdaterUtil::SELogObj *a6, ...)
{
  va_start(va, a6);
  return SEUpdaterUtil::SELogObj::printLogv(this, a2, a3, a4, a5, a6, va);
}

void SEUpdaterUtil::SELogObj::create_default_global(SEUpdaterUtil::SELogObj *this)
{
}

void sub_229325EFC(_Unwind_Exception *a1)
{
  MEMORY[0x22A6B67D0](v1, 0x10B0C409C89B6A6);
  _Unwind_Resume(a1);
}

void std::shared_ptr<SEUpdaterUtil::SELogObj>::shared_ptr[abi:ne180100]<SEUpdaterUtil::SELogObj,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_229325FA4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<SEUpdaterUtil::SELogObj>::reset[abi:ne180100]((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void std::shared_ptr<SEUpdaterUtil::SELogObj>::__enable_weak_this[abi:ne180100]<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,void>(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    char v4 = (std::__shared_weak_count *)a2[1];
    if (!v4 || v4->__shared_owners_ == -1)
    {
      uint64_t v5 = *(std::__shared_weak_count **)(a1 + 8);
      if (v5)
      {
        atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
        atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        char v4 = (std::__shared_weak_count *)a2[1];
      }
      *a2 = a3;
      a2[1] = v5;
      if (v4) {
        std::__shared_weak_count::__release_weak(v4);
      }
      if (v5)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v5);
      }
    }
  }
}

void std::__shared_ptr_pointer<SEUpdaterUtil::SELogObj *,std::shared_ptr<SEUpdaterUtil::SELogObj>::__shared_ptr_default_delete<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj>,std::allocator<SEUpdaterUtil::SELogObj>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__shared_ptr_pointer<SEUpdaterUtil::SELogObj *,std::shared_ptr<SEUpdaterUtil::SELogObj>::__shared_ptr_default_delete<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj>,std::allocator<SEUpdaterUtil::SELogObj>>::__on_zero_shared(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 24);
  if (v1)
  {
    boost::circular_buffer<unsigned char,std::allocator<unsigned char>>::destroy((char **)(v1 + 56));
    ctu::SharedSynchronizable<SEUpdaterUtil::Error>::~SharedSynchronizable((void *)v1);
    JUMPOUT(0x22A6B67D0);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<SEUpdaterUtil::SELogObj *,std::shared_ptr<SEUpdaterUtil::SELogObj>::__shared_ptr_default_delete<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj>,std::allocator<SEUpdaterUtil::SELogObj>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

uint64_t *std::unique_ptr<SEUpdaterUtil::SELogObj>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  void *result = a2;
  if (v2)
  {
    boost::circular_buffer<unsigned char,std::allocator<unsigned char>>::destroy((char **)(v2 + 56));
    ctu::SharedSynchronizable<SEUpdaterUtil::Error>::~SharedSynchronizable((void *)v2);
    JUMPOUT(0x22A6B67D0);
  }
  return result;
}

void *SEUpdaterUtil::SELogObj::printLogv(SEUpdaterUtil::SELogObj *this, SEUpdaterUtil::SELogObj *a2, int a3, int a4, const char *a5, SEUpdaterUtil::SELogObj *a6, va_list a7)
{
  v14[4] = *MEMORY[0x263EF8340];
  SEUpdaterUtil::SELogObj::FormatMsgv(a6, a7, &v13);
  if (v13) {
    SEUpdaterUtil::SELogObj::printFormattedLog(this, a2, a3, a4, (uint64_t)a5, &v13);
  }
  std::unique_ptr<char const,std::function<void ()(char const*)>>::reset[abi:ne180100]((uint64_t *)&v13, 0);
  return std::__function::__value_func<void ()(char const*)>::~__value_func[abi:ne180100](v14);
}

void sub_22932629C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::unique_ptr<char const,std::function<void ()(char const*)>>::reset[abi:ne180100](&a9, 0);
  std::__function::__value_func<void ()(char const*)>::~__value_func[abi:ne180100]((void *)(v9 + 8));
  _Unwind_Resume(a1);
}

uint64_t SEUpdaterUtil::SELogObj::FormatMsgv@<X0>(SEUpdaterUtil::SELogObj *this@<X0>, va_list a2@<X1>, void *a3@<X8>)
{
  unint64_t v8[4] = *MEMORY[0x263EF8340];
  unint64_t v7 = 0;
  uint64_t result = vasprintf(&v7, (const char *)this, a2);
  if ((int)result < 1 || v7 == 0)
  {
    *a3 = 0;
    a3[4] = 0;
  }
  else
  {
    v8[0] = &unk_26DD734C0;
    unint64_t v8[3] = v8;
    *a3 = v7;
    std::__function::__value_func<void ()(char const*)>::__value_func[abi:ne180100]((uint64_t)(a3 + 1), (uint64_t)v8);
    return (uint64_t)std::__function::__value_func<void ()(char const*)>::~__value_func[abi:ne180100](v8);
  }
  return result;
}

void SEUpdaterUtil::SELogObj::printFormattedLog(SEUpdaterUtil::SELogObj *a1, SEUpdaterUtil::SELogObj *this, int a3, int a4, uint64_t a5, const char **a6)
{
  int v8 = (int)this;
  v15[4] = *MEMORY[0x263EF8340];
  uint64_t v10 = *a6;
  if (!a4
    || (SEUpdaterUtil::SELogObj::createVerboseLogString(this, *a6, (const char *)1, a5, &v14),
        std::unique_ptr<char const,std::function<void ()(char const*)>>::operator=[abi:ne180100]((uint64_t *)a6, &v14),
        std::unique_ptr<char const,std::function<void ()(char const*)>>::reset[abi:ne180100](&v14, 0),
        std::__function::__value_func<void ()(char const*)>::~__value_func[abi:ne180100](v15),
        (uint64_t v10 = *a6) != 0))
  {
    size_t v11 = strlen(v10);
    SEUpdaterUtil::SELogObj::addLog(a1, v10, v11);
    if (*((_DWORD *)a1 + 12) > v8)
    {
      if (a3)
      {
        SEUpdaterUtil::SELogObj::print(a1, "********************************************************************************\n");
        SEUpdaterUtil::SELogObj::print(a1, *a6);
        uint64_t v12 = a1;
        unint64_t v13 = "********************************************************************************\n";
      }
      else
      {
        unint64_t v13 = *a6;
        uint64_t v12 = a1;
      }
      SEUpdaterUtil::SELogObj::print(v12, v13);
    }
  }
}

void std::__function::__func<SEUpdaterUtil::SELogObj::FormatMsgv(char const*,char *)::{lambda(char const*)#1},std::allocator<SEUpdaterUtil::SELogObj::FormatMsgv(char const*,char *)::{lambda(char const*)#1}>,void ()(char const*)>::~__func()
{
}

void *std::__function::__func<SEUpdaterUtil::SELogObj::FormatMsgv(char const*,char *)::{lambda(char const*)#1},std::allocator<SEUpdaterUtil::SELogObj::FormatMsgv(char const*,char *)::{lambda(char const*)#1}>,void ()(char const*)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_26DD734C0;
  return result;
}

void std::__function::__func<SEUpdaterUtil::SELogObj::FormatMsgv(char const*,char *)::{lambda(char const*)#1},std::allocator<SEUpdaterUtil::SELogObj::FormatMsgv(char const*,char *)::{lambda(char const*)#1}>,void ()(char const*)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26DD734C0;
}

void std::__function::__func<SEUpdaterUtil::SELogObj::FormatMsgv(char const*,char *)::{lambda(char const*)#1},std::allocator<SEUpdaterUtil::SELogObj::FormatMsgv(char const*,char *)::{lambda(char const*)#1}>,void ()(char const*)>::operator()(uint64_t a1, void **a2)
{
}

uint64_t std::__function::__func<SEUpdaterUtil::SELogObj::FormatMsgv(char const*,char *)::{lambda(char const*)#1},std::allocator<SEUpdaterUtil::SELogObj::FormatMsgv(char const*,char *)::{lambda(char const*)#1}>,void ()(char const*)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<SEUpdaterUtil::SELogObj::FormatMsgv(char const*,char *)::{lambda(char const*)#1},std::allocator<SEUpdaterUtil::SELogObj::FormatMsgv(char const*,char *)::{lambda(char const*)#1}>,void ()(char const*)>::target_type()
{
}

uint64_t std::__function::__value_func<void ()(char const*)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(void *)(a1 + 24) = v4;
  }
  else
  {
    uint64_t v3 = (void *)(a1 + 24);
  }
  *uint64_t v3 = 0;
  return a1;
}

void *std::__function::__value_func<void ()(char const*)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
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

uint64_t SEUpdaterUtil::SELogObj::createVerboseLogString@<X0>(SEUpdaterUtil::SELogObj *this@<X0>, const char *a2@<X2>, const char *a3@<X3>, uint64_t a4@<X1>, void *a5@<X8>)
{
  if (this >= 5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v13, "Assertion: ");
    size_t v11 = std::string::append(&v13, "level >= 0 && level < _LOG_LEVEL_MAX && \"level is not good\"");
    timeval v12 = *(timeval *)&v11->__r_.__value_.__l.__data_;
    std::string::size_type v15 = v11->__r_.__value_.__r.__words[2];
    timeval v14 = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, &v14);
  }
  int v7 = (int)this;
  if (!a3) {
    return SEUpdaterUtil::SELogObj::FormatMsg((SEUpdaterUtil::SELogObj *)"[%s] %s: %s", a5, SEUpdaterUtil::logLevelNames[this], a4, a2);
  }
  v14.tv_sec = 0;
  *(void *)&v14.tv_usec = 0;
  gettimeofday(&v14, 0);
  return SEUpdaterUtil::SELogObj::FormatMsg((SEUpdaterUtil::SELogObj *)"[%3.3ld.%1.1d] [%s] %s: %s", a5, v14.tv_sec, (v14.tv_usec / 1000), SEUpdaterUtil::logLevelNames[v7], a4, a2);
}

void sub_2293267B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  if (a19 < 0)
  {
    operator delete(a14);
    if ((v26 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v26)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v25);
  goto LABEL_8;
}

uint64_t *std::unique_ptr<char const,std::function<void ()(char const*)>>::operator=[abi:ne180100](uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *a2 = 0;
  std::unique_ptr<char const,std::function<void ()(char const*)>>::reset[abi:ne180100](a1, v4);
  std::__function::__value_func<void ()(char const*)>::operator=[abi:ne180100](a1 + 1, (uint64_t)(a2 + 1));
  return a1;
}

void SEUpdaterUtil::SELogObj::addLog(SEUpdaterUtil::SELogObj *this, const char *a2, uint64_t a3)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  unint64_t v4[2] = ___ZN13SEUpdaterUtil8SELogObj6addLogEPKcm_block_invoke;
  v4[3] = &__block_descriptor_56_e5_v8__0l;
  unint64_t v4[4] = this;
  v4[5] = a2;
  v4[6] = a3;
  uint64_t v5 = v4;
  ctu::SharedSynchronizable<SEUpdaterUtil::SELogObj>::execute_wrapped_sync<void({block_pointer} {__strong}&)(void)>((uint64_t)this, (uint64_t)&v5);
}

void SEUpdaterUtil::SELogObj::print(SEUpdaterUtil::SELogObj *this, const char *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = ___ZN13SEUpdaterUtil8SELogObj5printEPKc_block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = this;
  v3[5] = a2;
  uint64_t v4 = v3;
  ctu::SharedSynchronizable<SEUpdaterUtil::SELogObj>::execute_wrapped_sync<void({block_pointer} {__strong}&)(void)>((uint64_t)this, (uint64_t)&v4);
}

uint64_t SEUpdaterUtil::SELogObj::FormatMsg@<X0>(SEUpdaterUtil::SELogObj *this@<X0>, void *a2@<X8>, ...)
{
  va_start(va, a2);
  return SEUpdaterUtil::SELogObj::FormatMsgv(this, va, a2);
}

uint64_t *std::unique_ptr<char const,std::function<void ()(char const*)>>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v3 = *result;
  void *result = a2;
  if (v3) {
    return (uint64_t *)std::function<void ()(char const*)>::operator()((uint64_t)(result + 1), v3);
  }
  return result;
}

uint64_t std::function<void ()(char const*)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v4);
}

void *std::__function::__value_func<void ()(char const*)>::operator=[abi:ne180100](void *a1, uint64_t a2)
{
  std::__function::__value_func<void ()(char const*)>::operator=[abi:ne180100](a1);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      a1[3] = a1;
      (*(void (**)(void, void *))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      a1[3] = v4;
      *(void *)(a2 + 24) = 0;
    }
  }
  else
  {
    a1[3] = 0;
  }
  return a1;
}

void *std::__function::__value_func<void ()(char const*)>::operator=[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  a1[3] = 0;
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

void *___ZN13SEUpdaterUtil8SELogObj6addLogEPKcm_block_invoke(void *a1)
{
  uint64_t v1 = a1[5];
  v3[0] = (void *)(a1[4] + 56);
  v3[1] = 0;
  return boost::circular_buffer<unsigned char,std::allocator<unsigned char>>::insert<char const*>(v3[0], (uint64_t)v3, v1, v1 + a1[6]);
}

void ctu::SharedSynchronizable<SEUpdaterUtil::SELogObj>::execute_wrapped_sync<void({block_pointer} {__strong}&)(void)>(uint64_t a1, uint64_t a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = ___ZNK3ctu20SharedSynchronizableIN13SEUpdaterUtil8SELogObjEE20execute_wrapped_syncIRU8__strongU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS9__block_invoke;
  v6[3] = &__block_descriptor_48_e5_v8__0l;
  v6[4] = a1;
  v6[5] = a2;
  uint64_t v3 = (void *)MEMORY[0x22A6B6DA0](v6);
  uint64_t v4 = (id *)(a1 + 16);
  if (*(void *)(a1 + 24))
  {
    uint64_t v5 = dispatch::queue::operator*(v4);
    dispatch_async_and_wait(v5, v3);
  }
  else
  {
    uint64_t v5 = dispatch::queue::operator*(v4);
    dispatch_sync(v5, v3);
  }
}

void *___ZNK3ctu20SharedSynchronizableIN13SEUpdaterUtil8SELogObjEE20execute_wrapped_syncIRU8__strongU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS9__block_invoke(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 40) + 16))(*(void **)(a1 + 40));
}

id dispatch::queue::operator*(id *a1)
{
  return *a1;
}

void *boost::circular_buffer<unsigned char,std::allocator<unsigned char>>::insert<char const*>(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = (unsigned char *)(a4 - a3);
  if (a4 != a3)
  {
    int v7 = result;
    uint64_t v9 = *result;
    int v8 = (char *)result[1];
    v14[0] = result;
    v14[1] = 0;
    uint64_t result = (void *)boost::cb_details::iterator<boost::circular_buffer<unsigned char,std::allocator<unsigned char>>,boost::cb_details::nonconst_traits<std::allocator<unsigned char>>>::operator-<boost::cb_details::nonconst_traits<std::allocator<unsigned char>>>((uint64_t)v14, a2);
    if ((char *)result + v9 != v8)
    {
      unint64_t v10 = v8 - ((char *)result + v9);
      size_t v11 = &v4[-v10];
      if ((unint64_t)v4 < v10) {
        size_t v11 = 0;
      }
      timeval v12 = &v11[a3];
      if ((unint64_t)v4 >= v10) {
        std::string v13 = (unsigned char *)(v8 - ((char *)result + v9));
      }
      else {
        std::string v13 = v4;
      }
      v14[0] = v12;
      return boost::circular_buffer<unsigned char,std::allocator<unsigned char>>::insert_n<boost::cb_details::iterator_wrapper<char const*>>(v7, a2, v13, v14);
    }
  }
  return result;
}

uint64_t boost::cb_details::iterator<boost::circular_buffer<unsigned char,std::allocator<unsigned char>>,boost::cb_details::nonconst_traits<std::allocator<unsigned char>>>::operator-<boost::cb_details::nonconst_traits<std::allocator<unsigned char>>>(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unint64_t **)a1;
  unint64_t v3 = *(void *)(a1 + 8);
  if (!v3)
  {
    unint64_t v3 = *v2;
    unint64_t v5 = v2[4];
    goto LABEL_5;
  }
  unint64_t v4 = v2[2];
  if (v3 < v4)
  {
    unint64_t v5 = v2[1] - v4;
LABEL_5:
    uint64_t v6 = v3 + v5;
    goto LABEL_7;
  }
  uint64_t v6 = *v2 + v3 - v4;
LABEL_7:
  unint64_t v7 = *(void *)(a2 + 8);
  if (v7)
  {
    unint64_t v8 = v2[2];
    if (v7 >= v8)
    {
      uint64_t v10 = *v2 + v7 - v8;
      return v6 - v10;
    }
    unint64_t v9 = v2[1] - v8;
  }
  else
  {
    unint64_t v7 = *v2;
    unint64_t v9 = v2[4];
  }
  uint64_t v10 = v7 + v9;
  return v6 - v10;
}

void *boost::circular_buffer<unsigned char,std::allocator<unsigned char>>::insert_n<boost::cb_details::iterator_wrapper<char const*>>(void *result, uint64_t a2, unsigned char *a3, void *a4)
{
  unint64_t v5 = (unsigned char *)*result;
  unint64_t v4 = (unsigned char *)result[1];
  uint64_t v6 = (unsigned char *)result[3];
  uint64_t v7 = result[4] + *result;
  unint64_t v8 = &v4[-v7];
  if (&v4[-v7] >= a3) {
    unint64_t v9 = a3;
  }
  else {
    unint64_t v9 = &v4[-v7];
  }
  uint64_t v10 = *(unsigned char **)(a2 + 8);
  if (v10)
  {
    if (v6 != v10)
    {
      uint64_t v11 = v4 - v6;
      uint64_t v12 = (uint64_t)&v5[a3 - 1 - v4];
      if (v11 > (uint64_t)(a3 - 1)) {
        uint64_t v12 = (uint64_t)(a3 - 1);
      }
      std::string v13 = &v6[v12];
      do
      {
        if (v6 == v5) {
          uint64_t v6 = (unsigned char *)result[1];
        }
        char v14 = *--v6;
        *std::string v13 = v14;
        unint64_t v5 = (unsigned char *)*result;
        if (v13 == (unsigned char *)*result) {
          std::string v13 = (unsigned char *)result[1];
        }
        --v13;
      }
      while (v6 != *(unsigned char **)(a2 + 8));
    }
    if (a3)
    {
      std::string::size_type v15 = a3;
      do
      {
        uint64_t v16 = (unsigned char *)(*a4)++;
        *v10++ = *v16;
        unint64_t v4 = (unsigned char *)result[1];
        if (v10 == v4) {
          uint64_t v10 = (unsigned char *)*result;
        }
        --v15;
      }
      while (v15);
    }
    else
    {
      unint64_t v4 = (unsigned char *)result[1];
    }
  }
  else
  {
    if (v9)
    {
      unint64_t v17 = v9;
      do
      {
        uint64_t v18 = (unsigned char *)(*a4)++;
        *v6++ = *v18;
        unint64_t v4 = (unsigned char *)result[1];
        if (v6 == v4) {
          uint64_t v6 = (unsigned char *)*result;
        }
        --v17;
      }
      while (v17);
    }
    if (v8 < a3)
    {
      uint64_t v19 = a3 - v9;
      do
      {
        unint64_t v20 = (unsigned char *)(*a4)++;
        *v6++ = *v20;
        unint64_t v4 = (unsigned char *)result[1];
        if (v6 == v4) {
          uint64_t v6 = (unsigned char *)*result;
        }
        --v19;
      }
      while (v19);
    }
  }
  uint64_t v21 = result[3];
  uint64_t v22 = a3;
  if ((uint64_t)&v4[-v21] <= (uint64_t)a3) {
    uint64_t v22 = (unsigned char *)(a3 - v4 + *result);
  }
  result[3] = &v22[v21];
  uint64_t v23 = result[2];
  uint64_t v24 = a3 - v9;
  if ((uint64_t)&v4[-v23] <= a3 - v9) {
    uint64_t v24 = v24 - (void)v4 + *result;
  }
  result[2] = v23 + v24;
  result[4] += v9;
  return result;
}

uint64_t ___ZN13SEUpdaterUtil8SELogObj5printEPKc_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 32))(*(void *)(*(void *)(a1 + 32) + 40), *(void *)(a1 + 40));
}

const void **ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::cf::detail::TakeOwnershipProxy<__CFData const>::~TakeOwnershipProxy(const void **a1)
{
  uint64_t v2 = (const void **)a1[1];
  if (*a1)
  {
    unint64_t v3 = *v2;
    *uint64_t v2 = *a1;
    uint64_t v6 = v3;
  }
  else
  {
    unint64_t v4 = *v2;
    *uint64_t v2 = 0;
    uint64_t v6 = v4;
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v6);
  return a1;
}

const void **ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy(const void **a1)
{
  uint64_t v2 = (const void **)a1[1];
  if (*a1)
  {
    unint64_t v3 = *v2;
    *uint64_t v2 = *a1;
    uint64_t v6 = v3;
  }
  else
  {
    unint64_t v4 = *v2;
    *uint64_t v2 = 0;
    uint64_t v6 = v4;
  }
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(&v6);
  return a1;
}

uint64_t DERParseDERSequenceSpecContent(unint64_t *a1, uint64_t a2, char *a3, size_t a4)
{
  if (a4) {
    bzero(a3, a4);
  }
  unint64_t v23 = 0;
  unint64_t v24 = 0;
  DERDecodeSeqContentInit(a1, &v23);
  if (!*(_WORD *)(a2 + 8))
  {
LABEL_20:
    if (v23 > v24) {
      return 3;
    }
    if (v23 < v24 && !*(unsigned char *)(a2 + 10)) {
      return 2;
    }
    return 0;
  }
  unsigned int v7 = 0;
  while (1)
  {
    unint64_t v21 = 0;
    long long v22 = 0uLL;
    unint64_t v8 = v23;
    uint64_t result = DERDecodeSeqNext(&v23, &v21);
    if (result) {
      break;
    }
    uint64_t v10 = *(unsigned __int16 *)(a2 + 8);
    if (v7 >= v10)
    {
      if (!*(unsigned char *)(a2 + 10)) {
        return 2;
      }
    }
    else
    {
      uint64_t v11 = v7;
      uint64_t v12 = (_WORD *)(*(void *)a2 + 24 * v7 + 16);
      while (1)
      {
        __int16 v13 = *v12;
        if ((*v12 & 2) != 0 || v21 == *((void *)v12 - 1)) {
          break;
        }
        if ((v13 & 1) == 0) {
          return 2;
        }
        ++v11;
        v12 += 12;
        if (v10 == v11) {
          goto LABEL_19;
        }
      }
      if ((v13 & 4) == 0)
      {
        char v14 = &a3[*((void *)v12 - 2)];
        *(_OWORD *)char v14 = v22;
        if ((v13 & 8) != 0)
        {
          unint64_t v15 = v22 - v8 + *((void *)v14 + 1);
          *(void *)char v14 = v8;
          *((void *)v14 + 1) = v15;
        }
      }
      unsigned int v7 = (unsigned __int16)v11 + 1;
      LODWORD(v10) = *(unsigned __int16 *)(a2 + 8);
      if (v7 == v10) {
        goto LABEL_20;
      }
    }
LABEL_19:
    if (v7 >= v10) {
      goto LABEL_20;
    }
  }
  if (result == 1)
  {
    unsigned int v16 = *(unsigned __int16 *)(a2 + 8);
    if (v7 < v16)
    {
      unint64_t v17 = (__int16 *)(*(void *)a2 + 24 * v7 + 16);
      uint64_t v18 = v7 + 1;
      while (1)
      {
        __int16 v19 = *v17;
        v17 += 12;
        if ((v19 & 1) == 0) {
          break;
        }
        if (v16 == (unsigned __int16)v18++) {
          return 0;
        }
      }
      return 5;
    }
    return 0;
  }
  return result;
}

void SEUpdater::GetPackageInfo()
{
  v1[11] = *MEMORY[0x263EF8340];
  SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v0, 0x2037uLL);
  mach_port_t v0 = &unk_26DD735C8;
  SEUpdater::CommandSelectISD::CommandSelectISD((SEUpdater::CommandSelectISD *)v1);
}

void sub_229327A58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,std::__shared_weak_count *a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,int a40,__int16 a41,char a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *a49,uint64_t a50,int a51,__int16 a52,char a53,char a54)
{
  if (*(char *)(v54 - 185) < 0) {
    operator delete(*(void **)(v54 - 208));
  }
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a26);
  }
  _Unwind_Resume(exception_object);
}

void SEUpdater::CommandSelectISD::~CommandSelectISD(SEUpdater::CommandSelectISD *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

uint64_t SERestoreInfo::Apdu::SetP2(uint64_t this, char a2)
{
  uint64_t v2 = *(uint64_t **)(this + 8);
  if (!v2 || (uint64_t v3 = *v2, (unint64_t)(*(void *)(*(void *)(this + 8) + 8) - v3) <= 4)) {
    __assert_rtn("SetP2", "Apdu.hpp", 164, "bytes && bytes->size() >= sizeof(CApduHeader_t)");
  }
  *(unsigned char *)(v3 + 3) = a2;
  return this;
}

void SEUpdater::CommandGetStatusProprietaryPackages::~CommandGetStatusProprietaryPackages(SEUpdater::CommandGetStatusProprietaryPackages *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SERestoreInfo::RApdu::~RApdu(SERestoreInfo::RApdu *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::GetInstanceInfo()
{
  v1[15] = *MEMORY[0x263EF8340];
  SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v0, 0x2037uLL);
  mach_port_t v0 = &unk_26DD735C8;
  SEUpdater::CommandSelectISD::CommandSelectISD((SEUpdater::CommandSelectISD *)v1);
}

void sub_229328838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, std::__shared_weak_count *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,std::__shared_weak_count *a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,int a42,__int16 a43,char a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,void *a51,uint64_t a52,int a53,__int16 a54,char a55,char a56)
{
  std::string __p = &unk_26DD73620;
  if (a18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a18);
  }
  std::vector<SEUpdater::InstanceInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  a23 = &unk_26DD73620;
  if (a25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a25);
  }
  _Unwind_Resume(a1);
}

void SEUpdater::CommandGetStatusProprietaryInstance::~CommandGetStatusProprietaryInstance(SEUpdater::CommandGetStatusProprietaryInstance *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::GetAvailableMemory()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v1, 0x2037uLL);
  uint64_t v1 = &unk_26DD735C8;
  SEUpdater::CommandSelectISD::CommandSelectISD((SEUpdater::CommandSelectISD *)&v0);
}

void sub_229329368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, std::__shared_weak_count *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, std::__shared_weak_count *a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  if (a13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a13);
  }
  if (a20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a20);
  }
  _Unwind_Resume(a1);
}

void SEUpdater::CommandGetAvailableMemory::~CommandGetAvailableMemory(SEUpdater::CommandGetAvailableMemory *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

SERestoreInfo::Apdu *SERestoreInfo::Apdu::Apdu(SERestoreInfo::Apdu *this, size_t a2)
{
  size_t v7 = a2;
  *(void *)this = &unk_26DD73620;
  uint64_t v3 = (unint64_t **)((char *)this + 8);
  std::allocate_shared[abi:ne180100]<std::vector<unsigned char>,std::allocator<std::vector<unsigned char>>,unsigned long &,void>(&v7, (void *)this + 1);
  if (v7 >> 3 > 0x406)
  {
    unint64_t v5 = "len <= MAX_APDU_LEN";
    int v6 = 102;
    goto LABEL_8;
  }
  if (!*v3)
  {
    unint64_t v5 = "bytes";
    int v6 = 103;
LABEL_8:
    __assert_rtn("Apdu", "Apdu.hpp", v6, v5);
  }
  if (v7 <= 0x2036) {
    std::vector<unsigned char>::reserve(*v3, 0x2037uLL);
  }
  return this;
}

void sub_229329728(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 16);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SERestoreInfo::Apdu::updateSize(uint64_t this, unint64_t a2)
{
  uint64_t v2 = *(void **)(this + 8);
  unint64_t v3 = v2[1] - *v2;
  if (v3 < a2) {
    __assert_rtn("updateSize", "Apdu.hpp", 125, "len <= bytes->size()");
  }
  if (v3 > a2) {
    v2[1] = *v2 + a2;
  }
  return this;
}

void *SERestoreInfo::Apdu::assign(SERestoreInfo::Apdu *this, char *a2, unint64_t a3)
{
  if (!a2) {
    __assert_rtn("assign", "Apdu.hpp", 133, "data");
  }
  if (a3 >> 3 >= 0x407) {
    __assert_rtn("assign", "Apdu.hpp", 134, "len <= MAX_APDU_LEN");
  }
  unint64_t v4 = (void *)*((void *)this + 1);
  unint64_t v5 = &a2[a3];

  return std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(v4, a2, v5, a3);
}

void std::vector<unsigned char>::reserve(unint64_t *a1, size_t __sz)
{
  unint64_t v2 = *a1;
  if (a1[2] - *a1 < __sz)
  {
    if ((__sz & 0x8000000000000000) != 0) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v5 = (char *)a1[1];
    int v6 = operator new(__sz);
    size_t v7 = &v5[(void)v6 - v2];
    unint64_t v8 = v7;
    if (v5 != (char *)v2)
    {
      unint64_t v9 = &v5[~v2];
      do
      {
        char v10 = *--v5;
        (v9--)[(void)v6] = v10;
      }
      while (v5 != (char *)v2);
      unint64_t v8 = v6;
    }
    *a1 = (unint64_t)v8;
    a1[1] = (unint64_t)v7;
    a1[2] = (unint64_t)&v6[__sz];
    if (v2)
    {
      operator delete((void *)v2);
    }
  }
}

void SERestoreInfo::Apdu::~Apdu(SERestoreInfo::Apdu *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void *std::allocate_shared[abi:ne180100]<std::vector<unsigned char>,std::allocator<std::vector<unsigned char>>,unsigned long &,void>@<X0>(size_t *a1@<X1>, void *a2@<X8>)
{
  unint64_t v4 = operator new(0x30uLL);
  uint64_t result = std::__shared_ptr_emplace<std::vector<unsigned char>>::__shared_ptr_emplace[abi:ne180100]<unsigned long &,std::allocator<std::vector<unsigned char>>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_229329A3C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<std::vector<unsigned char>>::__shared_ptr_emplace[abi:ne180100]<unsigned long &,std::allocator<std::vector<unsigned char>>,0>(void *a1, size_t *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26DD73650;
  std::vector<unsigned char>::vector(a1 + 3, *a2);
  return a1;
}

void sub_229329A9C(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<std::vector<unsigned char>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD73650;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::vector<unsigned char>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD73650;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

void std::__shared_ptr_emplace<std::vector<unsigned char>>::__on_zero_shared(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(void *)(a1 + 32) = v2;
    operator delete(v2);
  }
}

void *std::vector<unsigned char>::vector(void *a1, size_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned char>::__vallocate[abi:ne180100](a1, a2);
    unint64_t v4 = (char *)a1[1];
    unint64_t v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_229329B98(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(void *result, char *__src, char *a3, unint64_t a4)
{
  size_t v7 = result;
  unint64_t v8 = result[2];
  unint64_t v9 = (char *)*result;
  if (v8 - *result < a4)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      unint64_t v8 = 0;
      *size_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if ((a4 & 0x8000000000000000) != 0) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = 2 * v8;
    if (2 * v8 <= a4) {
      uint64_t v10 = a4;
    }
    if (v8 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v11 = v10;
    }
    uint64_t result = std::vector<unsigned char>::__vallocate[abi:ne180100](v7, v11);
    unint64_t v9 = (char *)v7[1];
    goto LABEL_17;
  }
  uint64_t v12 = (unsigned char *)result[1];
  size_t v13 = v12 - v9;
  if (v12 - v9 >= a4)
  {
LABEL_17:
    size_t v16 = a3 - __src;
    if (v16) {
      uint64_t result = memmove(v9, __src, v16);
    }
    unint64_t v15 = &v9[v16];
    goto LABEL_20;
  }
  char v14 = &__src[v13];
  if (v12 != v9)
  {
    uint64_t result = memmove((void *)*result, __src, v13);
    unint64_t v9 = (char *)v7[1];
  }
  if (a3 != v14) {
    uint64_t result = memmove(v9, v14, a3 - v14);
  }
  unint64_t v15 = &v9[a3 - v14];
LABEL_20:
  v7[1] = v15;
  return result;
}

void SEUpdater::CommandSelectISD::CommandSelectISD(SEUpdater::CommandSelectISD *this)
{
}

void SERestoreInfo::CApdu::CApdu(void *a1)
{
}

void sub_229329DC8(_Unwind_Exception *exception_object)
{
  *uint64_t v1 = &unk_26DD73620;
  unint64_t v3 = (std::__shared_weak_count *)v1[2];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

void *SERestoreInfo::CApdu::updateSize(SERestoreInfo::CApdu *this, unint64_t a2)
{
  unint64_t v2 = (uint64_t *)*((void *)this + 1);
  uint64_t v3 = *v2;
  if (v2[1] - *v2 <= a2) {
    __assert_rtn("updateSize", "Apdu.hpp", 295, "len < bytes->size()");
  }
  v2[1] = v3 + a2;
  if (a2 >= 6) {
    unint64_t v4 = a2 - 5;
  }
  else {
    unint64_t v4 = 0;
  }
  if (a2 >= 6) {
    uint64_t v5 = v3 + 5;
  }
  else {
    uint64_t v5 = 0;
  }
  *((void *)this + 3) = v3;
  *((void *)this + 4) = v5;
  *((void *)this + 5) = v4;

  return SERestoreInfo::CApdu::validate(this);
}

void *SERestoreInfo::CApdu::assign(SERestoreInfo::CApdu *this, char *a2, unint64_t a3)
{
  uint64_t result = SERestoreInfo::Apdu::assign(this, a2, a3);
  uint64_t v5 = **((void **)this + 1);
  unint64_t v6 = *(void *)(*((void *)this + 1) + 8) - v5;
  BOOL v7 = v6 >= 6;
  if (v6 >= 6) {
    unint64_t v8 = v6 - 5;
  }
  else {
    unint64_t v8 = 0;
  }
  if (v7) {
    uint64_t v9 = v5 + 5;
  }
  else {
    uint64_t v9 = 0;
  }
  *((void *)this + 4) = v9;
  *((void *)this + 5) = v8;
  *((void *)this + 3) = v5;
  return result;
}

void SERestoreInfo::Apdu::Apdu(void *a1)
{
  *a1 = &unk_26DD73620;
  a1[1] = 0;
  a1[2] = 0;
  operator new();
}

void sub_229329FF0(_Unwind_Exception *a1)
{
  unint64_t v4 = *(void **)v2;
  if (*(void *)v2)
  {
    *(void *)(v2 + 8) = v4;
    operator delete(v4);
  }
  MEMORY[0x22A6B67D0](v2, 0x10C402FEFCB83);
  uint64_t v5 = *(std::__shared_weak_count **)(v1 + 16);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  _Unwind_Resume(a1);
}

void *SERestoreInfo::CApdu::validate(void *this)
{
  uint64_t v1 = this[3];
  uint64_t v2 = (void *)this[1];
  if (v1 != *v2) {
    __assert_rtn("validate", "Apdu.hpp", 303, "header == reinterpret_cast<CApduHeader_t*>(&((*bytes)[0]))");
  }
  uint64_t v3 = this[5];
  if (v3)
  {
    if (v3 + 5 != v2[1] - v1) {
      __assert_rtn("validate", "Apdu.hpp", 306, "sizeof(CApduHeader_t) + payloadLen == bytes->size()");
    }
    if (this[4] != v1 + 5) {
      __assert_rtn("validate", "Apdu.hpp", 307, "payload == &((*bytes)[sizeof(CApduHeader_t)])");
    }
  }
  else
  {
    if ((unint64_t)(v2[1] - v1) >= 6) {
      __assert_rtn("validate", "Apdu.hpp", 311, "sizeof(CApduHeader_t) >= bytes->size()");
    }
    if (this[4]) {
      __assert_rtn("validate", "Apdu.hpp", 312, "payload == nullptr");
    }
  }
  return this;
}

void SERestoreInfo::CApdu::~CApdu(SERestoreInfo::CApdu *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void std::shared_ptr<std::vector<unsigned char>>::reset[abi:ne180100]<std::vector<unsigned char>,void>(uint64_t a1, uint64_t a2)
{
  std::shared_ptr<std::vector<unsigned char>>::shared_ptr[abi:ne180100]<std::vector<unsigned char>,void>(&v2, a2);
}

void std::shared_ptr<std::vector<unsigned char>>::shared_ptr[abi:ne180100]<std::vector<unsigned char>,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_22932A2B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  a10 = 0;
  if (v10) {
    std::default_delete<std::vector<unsigned char>>::operator()[abi:ne180100]((uint64_t)&a10, v10);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<std::vector<unsigned char> *,std::shared_ptr<std::vector<unsigned char>>::__shared_ptr_default_delete<std::vector<unsigned char>,std::vector<unsigned char>>,std::allocator<std::vector<unsigned char>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

void std::__shared_ptr_pointer<std::vector<unsigned char> *,std::shared_ptr<std::vector<unsigned char>>::__shared_ptr_default_delete<std::vector<unsigned char>,std::vector<unsigned char>>,std::allocator<std::vector<unsigned char>>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<std::vector<unsigned char> *,std::shared_ptr<std::vector<unsigned char>>::__shared_ptr_default_delete<std::vector<unsigned char>,std::vector<unsigned char>>,std::allocator<std::vector<unsigned char>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::default_delete<std::vector<unsigned char>>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    long long v2 = *(void **)a2;
    if (*(void *)a2)
    {
      *(void *)(a2 + 8) = v2;
      operator delete(v2);
    }
    JUMPOUT(0x22A6B67D0);
  }
}

uint64_t SERestoreInfo::CallAndThrow<DERReturn>(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v2 = result;
    exception = __cxa_allocate_exception(0x48uLL);
    uint64_t v5 = (void *)SERestoreInfo::SEException::SEException(exception, a2, v2, @"libDERErrorDomain");
  }
  return result;
}

__n128 __Block_byref_object_copy__1(void *a1, uint64_t a2)
{
  a1[5] = 0;
  a1[6] = 0;
  a1[7] = 0;
  *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 40);
  a1[7] = *(void *)(a2 + 56);
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  a1[8] = 0;
  a1[9] = 0;
  a1[10] = 0;
  __n128 result = *(__n128 *)(a2 + 64);
  *((__n128 *)a1 + 4) = result;
  a1[10] = *(void *)(a2 + 80);
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  *(void *)(a2 + 80) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  uint64_t v3 = (void **)(a1 + 64);
  std::vector<std::vector<unsigned char>>::__destroy_vector::operator()[abi:ne180100](&v3);
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(void *)(a1 + 48) = v2;
    operator delete(v2);
  }
}

void SEUpdater::PackageInfo::~PackageInfo(SEUpdater::PackageInfo *this)
{
  uint64_t v3 = (void **)((char *)this + 24);
  std::vector<std::vector<unsigned char>>::__destroy_vector::operator()[abi:ne180100](&v3);
  uint64_t v2 = *(void **)this;
  if (*(void *)this)
  {
    *((void *)this + 1) = v2;
    operator delete(v2);
  }
}

uint64_t ___ZN9SEUpdaterL11ParseE3TLVsERKN13SERestoreInfo5RApduERNSt3__16vectorINS_11PackageInfoENS4_9allocatorIS6_EEEE_block_invoke(uint64_t a1, void *a2)
{
  if (*a2 == 0x8000000000000004)
  {
    BOOL v7 = *(uint64_t **)(*(void *)(a1 + 32) + 8);
    uint64_t v10 = (char *)a2[1];
    size_t v9 = a2[2];
    unint64_t v8 = (const void **)(a2 + 1);
    *(void *)&long long v14 = &v10[v9];
    size_t v11 = (void *)v7[9];
    if ((unint64_t)v11 >= v7[10])
    {
      uint64_t v12 = std::vector<std::vector<unsigned char>>::__emplace_back_slow_path<unsigned char *&,unsigned char *>(v7 + 8, v8, (uint64_t *)&v14);
    }
    else
    {
      *size_t v11 = 0;
      v11[1] = 0;
      uint64_t v11[2] = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v11, v10, (uint64_t)&v10[v9], v9);
      uint64_t v12 = (uint64_t)(v11 + 3);
      v7[9] = (uint64_t)(v11 + 3);
    }
    v7[9] = v12;
  }
  else
  {
    if (*a2 != 0x400000000000000FLL) {
      __assert_rtn("ParseE3TLVs_block_invoke", "QueryAppletStatus.cpp", 75, "0");
    }
    unint64_t v4 = (const void *)a2[1];
    size_t v3 = a2[2];
    uint64_t v15 = 0;
    long long v14 = 0uLL;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v14, v4, (uint64_t)v4 + v3, v3);
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
    unint64_t v6 = (void *)v5[5];
    if (v6)
    {
      v5[6] = v6;
      operator delete(v6);
      void v5[5] = 0;
      v5[6] = 0;
      v5[7] = 0;
    }
    *(_OWORD *)(v5 + 5) = v14;
    v5[7] = v15;
  }
  return 0;
}

void sub_22932A674(_Unwind_Exception *a1)
{
  *(void *)(v2 + 72) = v1;
  _Unwind_Resume(a1);
}

void *std::allocator<SEUpdater::PackageInfo>::construct[abi:ne180100]<SEUpdater::PackageInfo,SEUpdater::PackageInfo const&>(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a1, *(const void **)a2, *(void *)(a2 + 8), *(void *)(a2 + 8) - *(void *)a2);
  a1[3] = 0;
  a1[4] = 0;
  a1[5] = 0;
  return std::vector<std::vector<unsigned char>>::__init_with_size[abi:ne180100]<std::vector<unsigned char>*,std::vector<unsigned char>*>(a1 + 3, *(void *)(a2 + 24), *(void *)(a2 + 32), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 32) - *(void *)(a2 + 24)) >> 3));
}

void sub_22932A6E0(_Unwind_Exception *exception_object)
{
  size_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<std::vector<unsigned char>>::__init_with_size[abi:ne180100]<std::vector<unsigned char>*,std::vector<unsigned char>*>(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    std::vector<std::string>::__vallocate[abi:ne180100](result, a4);
    __n128 result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<unsigned char>>,std::vector<unsigned char>*,std::vector<unsigned char>*,std::vector<unsigned char>*>((uint64_t)(v6 + 2), a2, a3, (void *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_22932A764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::vector<unsigned char>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<unsigned char>>,std::vector<unsigned char>*,std::vector<unsigned char>*,std::vector<unsigned char>*>(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  unint64_t v4 = a4;
  uint64_t v10 = a4;
  size_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      *unint64_t v4 = 0;
      v4[1] = 0;
      unint64_t v4[2] = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v4, *(const void **)v6, *(void *)(v6 + 8), *(void *)(v6 + 8) - *(void *)v6);
      unint64_t v4 = v11 + 3;
      v11 += 3;
      v6 += 24;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<unsigned char>>,std::vector<unsigned char>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_22932A820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<unsigned char>>,std::vector<unsigned char>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<unsigned char>>,std::vector<unsigned char>*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<unsigned char>>,std::vector<unsigned char>*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  if (v1 != v2)
  {
    uint64_t v3 = **(void **)(a1 + 16);
    do
    {
      uint64_t v5 = *(void **)(v3 - 24);
      v3 -= 24;
      unint64_t v4 = v5;
      if (v5)
      {
        *(void *)(v1 - 16) = v4;
        operator delete(v4);
      }
      uint64_t v1 = v3;
    }
    while (v3 != v2);
  }
}

void std::allocator<SEUpdater::PackageInfo>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void **)(a2 + 24);
  std::vector<std::vector<unsigned char>>::__destroy_vector::operator()[abi:ne180100](&v4);
  uint64_t v3 = *(void **)a2;
  if (*(void *)a2)
  {
    *(void *)(a2 + 8) = v3;
    operator delete(v3);
  }
}

uint64_t std::__split_buffer<SEUpdater::PackageInfo>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(void *)(a1 + 16) = i - 48;
    std::allocator<SEUpdater::PackageInfo>::destroy[abi:ne180100](v4, i - 48);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

__n128 __Block_byref_object_copy__69(void *a1, uint64_t a2)
{
  a1[5] = 0;
  a1[6] = 0;
  a1[7] = 0;
  *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 40);
  a1[7] = *(void *)(a2 + 56);
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  a1[8] = 0;
  a1[9] = 0;
  a1[10] = 0;
  *((_OWORD *)a1 + 4) = *(_OWORD *)(a2 + 64);
  a1[10] = *(void *)(a2 + 80);
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  *(void *)(a2 + 80) = 0;
  a1[11] = 0;
  a1[12] = 0;
  a1[13] = 0;
  __n128 result = *(__n128 *)(a2 + 88);
  *(__n128 *)(a1 + 11) = result;
  a1[13] = *(void *)(a2 + 104);
  *(void *)(a2 + 88) = 0;
  *(void *)(a2 + 96) = 0;
  *(void *)(a2 + 104) = 0;
  return result;
}

void __Block_byref_object_dispose__70(void *a1)
{
  uint64_t v2 = (void *)a1[11];
  if (v2)
  {
    a1[12] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[8];
  if (v3)
  {
    a1[9] = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)a1[5];
  if (v4)
  {
    a1[6] = v4;
    operator delete(v4);
  }
}

void SEUpdater::InstanceInfo::~InstanceInfo(SEUpdater::InstanceInfo *this)
{
  uint64_t v2 = (void *)*((void *)this + 6);
  if (v2)
  {
    *((void *)this + 7) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 3);
  if (v3)
  {
    *((void *)this + 4) = v3;
    operator delete(v3);
  }
  uint64_t v4 = *(void **)this;
  if (*(void *)this)
  {
    *((void *)this + 1) = v4;
    operator delete(v4);
  }
}

uint64_t ___ZN9SEUpdaterL11ParseE3TLVsERKN13SERestoreInfo5RApduERNSt3__16vectorINS_12InstanceInfoENS4_9allocatorIS6_EEEE_block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if (*a2 == 0x400000000000000FLL)
  {
    char v9 = (const void *)a2[1];
    size_t v8 = a2[2];
    uint64_t v18 = 0;
    long long v17 = 0uLL;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v17, v9, (uint64_t)v9 + v8, v8);
    uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 8);
    size_t v11 = (void *)v10[5];
    if (v11)
    {
      v10[6] = v11;
      operator delete(v11);
    }
    *(_OWORD *)(v10 + 5) = v17;
    v10[7] = v18;
  }
  else if (v3 == 0x8000000000000070)
  {
    size_t v13 = (const void *)a2[1];
    size_t v12 = a2[2];
    uint64_t v18 = 0;
    long long v17 = 0uLL;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v17, v13, (uint64_t)v13 + v12, v12);
    long long v14 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v15 = (void *)v14[11];
    if (v15)
    {
      v14[12] = v15;
      operator delete(v15);
    }
    *(_OWORD *)(v14 + 11) = v17;
    v14[13] = v18;
  }
  else
  {
    if (v3 != 0x8000000000000004) {
      __assert_rtn("ParseE3TLVs_block_invoke", "QueryAppletStatus.cpp", 145, "0");
    }
    uint64_t v5 = (const void *)a2[1];
    size_t v4 = a2[2];
    uint64_t v18 = 0;
    long long v17 = 0uLL;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v17, v5, (uint64_t)v5 + v4, v4);
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 8);
    BOOL v7 = (void *)v6[8];
    if (v7)
    {
      v6[9] = v7;
      operator delete(v7);
    }
    *((_OWORD *)v6 + 4) = v17;
    v6[10] = v18;
  }
  return 0;
}

void *std::allocator<SEUpdater::InstanceInfo>::construct[abi:ne180100]<SEUpdater::InstanceInfo,SEUpdater::InstanceInfo const&>(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a1, *(const void **)a2, *(void *)(a2 + 8), *(void *)(a2 + 8) - *(void *)a2);
  a1[3] = 0;
  a1[4] = 0;
  a1[5] = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a1 + 3, *(const void **)(a2 + 24), *(void *)(a2 + 32), *(void *)(a2 + 32) - *(void *)(a2 + 24));
  a1[6] = 0;
  a1[7] = 0;
  a1[8] = 0;
  return std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a1 + 6, *(const void **)(a2 + 48), *(void *)(a2 + 56), *(void *)(a2 + 56) - *(void *)(a2 + 48));
}

void sub_22932ACB0(_Unwind_Exception *exception_object)
{
  size_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 32) = v4;
    operator delete(v4);
  }
  uint64_t v5 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v5;
    operator delete(v5);
  }
  _Unwind_Resume(exception_object);
}

void std::allocator<SEUpdater::InstanceInfo>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a2 + 48);
  if (v3)
  {
    *(void *)(a2 + 56) = v3;
    operator delete(v3);
  }
  size_t v4 = *(void **)(a2 + 24);
  if (v4)
  {
    *(void *)(a2 + 32) = v4;
    operator delete(v4);
  }
  uint64_t v5 = *(void **)a2;
  if (*(void *)a2)
  {
    *(void *)(a2 + 8) = v5;
    operator delete(v5);
  }
}

uint64_t std::__split_buffer<SEUpdater::InstanceInfo>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(void *)(a1 + 16) = i - 72;
    std::allocator<SEUpdater::InstanceInfo>::destroy[abi:ne180100](v4, i - 72);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t ___ZN9SEUpdaterL13ParseDF2ATLVsERKN13SERestoreInfo5RApduERNS_15AvailableMemoryE_block_invoke(uint64_t a1, uint64_t a2)
{
  switch(*(void *)a2)
  {
    case 0:
      uint64_t v2 = *(_DWORD **)(a1 + 32);
      goto LABEL_15;
    case 1:
      uint64_t v2 = (_DWORD *)(*(void *)(a1 + 32) + 4);
      goto LABEL_15;
    case 2:
      uint64_t v2 = (_DWORD *)(*(void *)(a1 + 32) + 8);
      goto LABEL_15;
    case 3:
      uint64_t v2 = (_DWORD *)(*(void *)(a1 + 32) + 12);
      goto LABEL_15;
    case 4:
      uint64_t v2 = (_DWORD *)(*(void *)(a1 + 32) + 16);
      goto LABEL_15;
    case 5:
      uint64_t v2 = (_DWORD *)(*(void *)(a1 + 32) + 20);
      goto LABEL_15;
    case 6:
      uint64_t v2 = (_DWORD *)(*(void *)(a1 + 32) + 24);
      goto LABEL_15;
    case 0xCLL:
      uint64_t v2 = (_DWORD *)(*(void *)(a1 + 32) + 28);
      goto LABEL_15;
    case 0xDLL:
      uint64_t v2 = (_DWORD *)(*(void *)(a1 + 32) + 32);
      goto LABEL_15;
    case 0xELL:
      uint64_t v2 = (_DWORD *)(*(void *)(a1 + 32) + 36);
      goto LABEL_15;
    case 0xFLL:
      uint64_t v2 = (_DWORD *)(*(void *)(a1 + 32) + 40);
      goto LABEL_15;
    case 0x10:
      uint64_t v2 = (_DWORD *)(*(void *)(a1 + 32) + 44);
      goto LABEL_15;
    case 0x11:
      uint64_t v2 = (_DWORD *)(*(void *)(a1 + 32) + 48);
LABEL_15:
      *uint64_t v2 = bswap32(**(_DWORD **)(a2 + 8));
      break;
    default:
      return 0;
  }
  return 0;
}

void std::vector<SEUpdater::PackageInfo>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48;
        std::allocator<SEUpdater::PackageInfo>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<SEUpdater::InstanceInfo>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 72;
        std::allocator<SEUpdater::InstanceInfo>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

SEUpdaterUtil::Error *SEUpdaterUtil::Error::Error(SEUpdaterUtil::Error *this)
{
  uint64_t v2 = dispatch_queue_create("Error", 0);
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = v2;
  if (v2)
  {
    uint64_t v3 = v2;
    dispatch_retain(v2);
    *((void *)this + 3) = 0;
    dispatch_release(v3);
  }
  else
  {
    *((void *)this + 3) = 0;
  }
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  return this;
}

uint64_t SEUpdaterUtil::Error::CreateCFError(SEUpdaterUtil::Error *this)
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2000000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  uint64_t v5[2] = ___ZN13SEUpdaterUtil5Error13CreateCFErrorEv_block_invoke;
  v5[3] = &unk_264863438;
  v5[4] = &v6;
  void v5[5] = this;
  uint64_t v10 = v5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableIN13SEUpdaterUtil5ErrorEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke;
  block[3] = &__block_descriptor_tmp_8;
  block[4] = this;
  block[5] = &v10;
  uint64_t v2 = (char *)this + 16;
  uint64_t v1 = *((void *)this + 2);
  if (*((void *)v2 + 1)) {
    dispatch_async_and_wait(v1, block);
  }
  else {
    dispatch_sync(v1, block);
  }
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void ___ZN13SEUpdaterUtil5Error13CreateCFErrorEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(long long **)(v1 + 32);
  uint64_t v3 = *(long long **)(v1 + 40);
  if (v2 != v3)
  {
    uint64_t v5 = 0;
    while (1)
    {
      if (*((char *)v2 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v2, *((void *)v2 + 1));
      }
      else
      {
        long long v6 = *v2;
        __p.__r_.__value_.__r.__words[2] = *((void *)v2 + 2);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v6;
      }
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = SERestoreInfo::CreateCFError((const UInt8 *)&__p, *((_DWORD *)v2 + 6), v5, @"SEUpdaterErrorDomain");
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        break;
      }
      if (v5) {
        goto LABEL_8;
      }
LABEL_9:
      uint64_t v5 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      v2 += 2;
      if (v2 == v3) {
        return;
      }
    }
    operator delete(__p.__r_.__value_.__l.__data_);
    if (!v5) {
      goto LABEL_9;
    }
LABEL_8:
    CFRelease(v5);
    goto LABEL_9;
  }
}

void sub_22932B294(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SEUpdaterUtil::Error::getErrorCode(SEUpdaterUtil::Error *this)
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2000000000;
  int v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  uint64_t v5[2] = ___ZN13SEUpdaterUtil5Error12getErrorCodeEv_block_invoke;
  v5[3] = &unk_264863460;
  v5[4] = &v6;
  void v5[5] = this;
  uint64_t v10 = v5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableIN13SEUpdaterUtil5ErrorEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke;
  block[3] = &__block_descriptor_tmp_8;
  block[4] = this;
  block[5] = &v10;
  uint64_t v2 = (char *)this + 16;
  uint64_t v1 = *((void *)this + 2);
  if (*((void *)v2 + 1)) {
    dispatch_async_and_wait(v1, block);
  }
  else {
    dispatch_sync(v1, block);
  }
  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t ___ZN13SEUpdaterUtil5Error12getErrorCodeEv_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t v2 = *(void *)(v1 + 40);
  if (v3 != v2) {
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(v2 - 8);
  }
  return result;
}

void SEUpdaterUtil::Error::addError(uint64_t a1, uint64_t a2, int a3)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  uint64_t v5[2] = ___ZN13SEUpdaterUtil5Error8addErrorERKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEi_block_invoke;
  v5[3] = &__block_descriptor_tmp_4;
  v5[4] = a1;
  void v5[5] = a2;
  int v6 = a3;
  BOOL v7 = v5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableIN13SEUpdaterUtil5ErrorEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke;
  block[3] = &__block_descriptor_tmp_8;
  block[4] = a1;
  block[5] = &v7;
  uint64_t v4 = a1 + 16;
  uint64_t v3 = *(NSObject **)(a1 + 16);
  if (*(void *)(v4 + 8)) {
    dispatch_async_and_wait(v3, block);
  }
  else {
    dispatch_sync(v3, block);
  }
}

void ___ZN13SEUpdaterUtil5Error8addErrorERKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEi_block_invoke(uint64_t a1)
{
  uint64_t v3 = *(int64x2_t **)(a1 + 32);
  uint64_t v2 = *(long long **)(a1 + 40);
  if (*((char *)v2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v2, *((void *)v2 + 1));
  }
  else
  {
    long long v4 = *v2;
    __p.__r_.__value_.__r.__words[2] = *((void *)v2 + 2);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v4;
  }
  int v5 = *(_DWORD *)(a1 + 48);
  int v20 = v5;
  unint64_t v6 = v3[3].u64[0];
  unint64_t v7 = v3[2].u64[1];
  if (v7 >= v6)
  {
    uint64_t v9 = v3[2].i64[0];
    uint64_t v10 = (uint64_t)(v7 - v9) >> 5;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 59) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    if ((uint64_t)(v6 - v9) >> 4 > v11) {
      unint64_t v11 = (uint64_t)(v6 - v9) >> 4;
    }
    if (v6 - v9 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v12 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    unint64_t v24 = v3 + 3;
    if (v12 >> 59) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    size_t v13 = (char *)operator new(32 * v12);
    long long v14 = &v13[32 * v10];
    *(std::string *)long long v14 = __p;
    memset(&__p, 0, sizeof(__p));
    *((_DWORD *)v14 + 6) = v5;
    uint64_t v15 = v14 + 32;
    if (v7 == v9)
    {
      int64x2_t v17 = vdupq_n_s64(v7);
    }
    else
    {
      do
      {
        long long v16 = *(_OWORD *)(v7 - 32);
        *((void *)v14 - 2) = *(void *)(v7 - 16);
        *((_OWORD *)v14 - 2) = v16;
        *(void *)(v7 - 24) = 0;
        *(void *)(v7 - 16) = 0;
        *(void *)(v7 - 32) = 0;
        *((_DWORD *)v14 - 2) = *(_DWORD *)(v7 - 8);
        v14 -= 32;
        v7 -= 32;
      }
      while (v7 != v9);
      int64x2_t v17 = v3[2];
      unint64_t v6 = v3[3].u64[0];
    }
    v3[2].i64[0] = (uint64_t)v14;
    v3[2].i64[1] = (uint64_t)v15;
    int64x2_t v22 = v17;
    v3[3].i64[0] = (uint64_t)&v13[32 * v12];
    unint64_t v23 = v6;
    uint64_t v21 = v17.i64[0];
    std::__split_buffer<std::pair<std::string,int>>::~__split_buffer((uint64_t)&v21);
    int v18 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
    v3[2].i64[1] = (uint64_t)v15;
    if (v18 < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    long long v8 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *(void *)(v7 + 16) = *((void *)&__p.__r_.__value_.__l + 2);
    *(_OWORD *)unint64_t v7 = v8;
    *(_DWORD *)(v7 + 24) = v20;
    v3[2].i64[1] = v7 + 32;
  }
}

void sub_22932B640(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *___ZNK3ctu20SharedSynchronizableIN13SEUpdaterUtil5ErrorEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 40) + 16))(*(void **)(a1 + 40));
}

uint64_t std::__split_buffer<std::pair<std::string,int>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void ***)(a1 + 8);
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      long long v4 = v2 - 4;
      *(void *)(a1 + 16) = v2 - 4;
      if (*((char *)v2 - 9) < 0)
      {
        operator delete(*v4);
        long long v4 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::vector<std::pair<std::string,int>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 32)
  {
    if (*(char *)(i - 9) < 0) {
      operator delete(*(void **)(i - 32));
    }
  }
  a1[1] = v2;
}

void *RootCA::getRootKeyId@<X0>(int a1@<W0>, int a2@<W1>, void *a3@<X8>)
{
  if (a2 > 199)
  {
    if (a2 != 210 && a2 != 200)
    {
LABEL_14:
      if (a1 == 1)
      {
        *a3 = 0;
        a3[1] = 0;
        long long v4 = &unk_26AD82970;
      }
      else
      {
        if (a1)
        {
          exception = __cxa_allocate_exception(0x48uLL);
          std::to_string(&v27, a1);
          int v18 = std::string::insert(&v27, 0, "Unknown RootCAId: ");
          long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
          v28.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v19;
          v18->__r_.__value_.__l.__size_ = 0;
          v18->__r_.__value_.__r.__words[2] = 0;
          v18->__r_.__value_.__r.__words[0] = 0;
          int v20 = std::string::append(&v28, " for SEChipType ");
          long long v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
          v29.__r_.__value_.__r.__words[2] = v20->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v21;
          v20->__r_.__value_.__l.__size_ = 0;
          v20->__r_.__value_.__r.__words[2] = 0;
          v20->__r_.__value_.__r.__words[0] = 0;
          std::to_string(&v26, a2);
          if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            int64x2_t v22 = &v26;
          }
          else {
            int64x2_t v22 = (std::string *)v26.__r_.__value_.__r.__words[0];
          }
          if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type size = HIBYTE(v26.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type size = v26.__r_.__value_.__l.__size_;
          }
          unint64_t v24 = std::string::append(&v29, (const std::string::value_type *)v22, size);
          std::string v30 = *v24;
          v24->__r_.__value_.__l.__size_ = 0;
          v24->__r_.__value_.__r.__words[2] = 0;
          v24->__r_.__value_.__r.__words[0] = 0;
          unint64_t v25 = (void *)SERestoreInfo::SEException::SEException((uint64_t)exception, (long long *)&v30, 16, @"SEUpdaterErrorDomain");
        }
        *a3 = 0;
        a3[1] = 0;
        long long v4 = &unk_26AD82950;
      }
      goto LABEL_11;
    }
  }
  else if (a2 != 100 && a2 != 115)
  {
    goto LABEL_14;
  }
  if (a1 == 1)
  {
    *a3 = 0;
    a3[1] = 0;
    long long v4 = &unk_26AD82930;
  }
  else
  {
    if (a1)
    {
      unint64_t v7 = __cxa_allocate_exception(0x48uLL);
      std::to_string(&v27, a1);
      long long v8 = std::string::insert(&v27, 0, "Unknown RootCAId: ");
      long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      v28.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      uint64_t v10 = std::string::append(&v28, " for SEChipType ");
      long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
      v29.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v11;
      v10->__r_.__value_.__l.__size_ = 0;
      v10->__r_.__value_.__r.__words[2] = 0;
      v10->__r_.__value_.__r.__words[0] = 0;
      std::to_string(&v26, a2);
      if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        unint64_t v12 = &v26;
      }
      else {
        unint64_t v12 = (std::string *)v26.__r_.__value_.__r.__words[0];
      }
      if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v13 = HIBYTE(v26.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v13 = v26.__r_.__value_.__l.__size_;
      }
      long long v14 = std::string::append(&v29, (const std::string::value_type *)v12, v13);
      std::string v30 = *v14;
      v14->__r_.__value_.__l.__size_ = 0;
      v14->__r_.__value_.__r.__words[2] = 0;
      v14->__r_.__value_.__r.__words[0] = 0;
      uint64_t v15 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v7, (long long *)&v30, 16, @"SEUpdaterErrorDomain");
    }
    *a3 = 0;
    a3[1] = 0;
    long long v4 = &_MergedGlobals;
  }
LABEL_11:
  a3[2] = 0;

  return std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a3, v4, (uint64_t)v4 + 32, 0x20uLL);
}

void sub_22932B9DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (*(char *)(v33 - 41) < 0) {
    operator delete(*(void **)(v33 - 64));
  }
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a33 < 0) {
    operator delete(a28);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2648631D8, MEMORY[0x263F8C068]);
}

void sub_22932BB58(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  __n128 result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

void _ObjcLogInternal(SEUpdaterUtil::SELogObj *a1, const char *a2, NSString *a3)
{
  void v13[4] = *MEMORY[0x263EF8340];
  int v5 = a3;
  unint64_t v6 = strdup([(NSString *)v5 UTF8String]);
  if (v6)
  {
    *(void *)&long long v10 = &unk_26DD73880;
    long long v11 = &v10;
    unint64_t v12 = v6;
    std::__function::__value_func<void ()(char const*)>::__value_func[abi:ne180100]((uint64_t)v13, (uint64_t)&v10);
    std::__function::__value_func<void ()(char const*)>::~__value_func[abi:ne180100](&v10);
    unint64_t v7 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    long long v8 = (SEUpdaterUtil::SELogObj *)off_268315F10;
    if (!off_268315F10) {
      SEUpdaterUtil::SELogObj::create_default_global(v7);
    }
    long long v9 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
    if (*(&off_268315F10 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    SEUpdaterUtil::SELogObj::printFormattedLog(v8, a1, 0, 1, (uint64_t)a2, (const char **)&v12);
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
    std::unique_ptr<char const,std::function<void ()(char const*)>>::reset[abi:ne180100]((uint64_t *)&v12, 0);
    std::__function::__value_func<void ()(char const*)>::~__value_func[abi:ne180100](v13);
  }
}

void sub_22932BD08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  std::unique_ptr<char const,std::function<void ()(char const*)>>::reset[abi:ne180100]((uint64_t *)va, 0);
  std::__function::__value_func<void ()(char const*)>::~__value_func[abi:ne180100](v6);

  _Unwind_Resume(a1);
}

void _ObjCLog(SEUpdaterUtil::SELogObj *a1, const char *a2, NSString *a3, ...)
{
  va_start(va, a3);
  int v5 = a3;
  unint64_t v6 = (NSString *)[[NSString alloc] initWithFormat:v5 arguments:va];
  _ObjcLogInternal(a1, a2, v6);
}

void sub_22932BDF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _ObjCLogNSError(NSError *a1, uint64_t a2, const char *a3, NSString *a4, ...)
{
  va_start(va, a4);
  void v18[2] = *MEMORY[0x263EF8340];
  unint64_t v7 = a1;
  long long v8 = a4;
  long long v9 = (NSString *)[[NSString alloc] initWithFormat:v8 arguments:va];
  _ObjcLogInternal(0, a3, v9);
  if (v7)
  {
    uint64_t v10 = *MEMORY[0x263F08608];
    v17[0] = *MEMORY[0x263F08320];
    v17[1] = v10;
    v18[0] = v9;
    v18[1] = v7;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  }
  else
  {
    uint64_t v15 = *MEMORY[0x263F08320];
    long long v16 = v9;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  }
  unint64_t v12 = (void *)v11;
  std::string::size_type v13 = [[MEMORY[0x263F087E8] errorWithDomain:@"helsinki" code:a2 userInfo:v11]

  return v13;
}

void sub_22932BF6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _ObjCLogOutError(uint64_t *a1, uint64_t a2, const char *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v22[1] = *MEMORY[0x263EF8340];
  id v12 = a4;
  std::string::size_type v13 = (NSString *)[[NSString alloc] initWithFormat:v12 arguments:&a9];
  _ObjcLogInternal(0, a3, v13);
  if (a1)
  {
    uint64_t v14 = *a1;
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    if (*a1)
    {
      uint64_t v16 = *MEMORY[0x263F08608];
      v19[0] = *MEMORY[0x263F08320];
      v19[1] = v16;
      v20[0] = v13;
      v20[1] = v14;
      int64x2_t v17 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
      int v18 = [v15 errorWithDomain:@"helsinki" code:a2 userInfo:v17];
    }
    else
    {
      uint64_t v21 = *MEMORY[0x263F08320];
      v22[0] = v13;
      int64x2_t v17 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
      int v18 = [v15 errorWithDomain:@"helsinki" code:a2 userInfo:v17];
    }
    *a1 = (uint64_t)v18;
  }
}

void sub_22932C118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _ObjCLogWrapOutError(void *a1, void *a2, uint64_t a3, const char *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void v22[2] = *MEMORY[0x263EF8340];
  id v13 = a2;
  id v14 = a5;
  uint64_t v15 = (NSString *)[[NSString alloc] initWithFormat:v14 arguments:&a9];
  _ObjcLogInternal(0, a4, v15);
  if (a1)
  {
    if (v13)
    {
      uint64_t v16 = *MEMORY[0x263F08608];
      v21[0] = *MEMORY[0x263F08320];
      v21[1] = v16;
      v22[0] = v15;
      v22[1] = v13;
      uint64_t v17 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    }
    else
    {
      uint64_t v19 = *MEMORY[0x263F08320];
      int v20 = v15;
      uint64_t v17 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    }
    int v18 = (void *)v17;
    [MEMORY[0x263F087E8] errorWithDomain:@"helsinki" code:a3 userInfo:v17];
    *a1 = (id)objc_claimAutoreleasedReturnValue();
  }
}

void sub_22932C2AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__function::__func<_ObjcLogInternal(int,char const*,NSString *)::$_0,std::allocator<_ObjcLogInternal(int,char const*,NSString *)::$_0>,void ()(char const*)>::~__func()
{
}

void *std::__function::__func<_ObjcLogInternal(int,char const*,NSString *)::$_0,std::allocator<_ObjcLogInternal(int,char const*,NSString *)::$_0>,void ()(char const*)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26DD73880;
  return result;
}

void std::__function::__func<_ObjcLogInternal(int,char const*,NSString *)::$_0,std::allocator<_ObjcLogInternal(int,char const*,NSString *)::$_0>,void ()(char const*)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26DD73880;
}

void std::__function::__func<_ObjcLogInternal(int,char const*,NSString *)::$_0,std::allocator<_ObjcLogInternal(int,char const*,NSString *)::$_0>,void ()(char const*)>::operator()(uint64_t a1, void **a2)
{
}

uint64_t std::__function::__func<_ObjcLogInternal(int,char const*,NSString *)::$_0,std::allocator<_ObjcLogInternal(int,char const*,NSString *)::$_0>,void ()(char const*)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<_ObjcLogInternal(int,char const*,NSString *)::$_0,std::allocator<_ObjcLogInternal(int,char const*,NSString *)::$_0>,void ()(char const*)>::target_type()
{
}

uint64_t SEUpdaterUtil::SN200VImage4Signer::getSigningAlgorithm(SEUpdaterUtil::SN200VImage4Signer *this)
{
  return 0;
}

void *SEUpdaterUtil::SN200VImage4Signer::getSigningKey@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(a1, &SEUpdaterUtil::SN200VImage4Signer::getSigningKey(void)const::signingKey, (uint64_t)&SEUpdaterUtil::SN200VImage4Signer::getSigningCert(void)const::signingCert, 0x79uLL);
}

void *SEUpdaterUtil::SN200VImage4Signer::getSigningCert@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(a1, &SEUpdaterUtil::SN200VImage4Signer::getSigningCert(void)const::signingCert, (uint64_t)"N13SEUpdaterUtil18SN200VImage4SignerE", 0x27DuLL);
}

void SEUpdaterUtil::SN200VImage4Signer::~SN200VImage4Signer(const void **this)
{
  *this = &unk_26DD752F8;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(this + 1);
}

{
  uint64_t vars8;

  *this = &unk_26DD752F8;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(this + 1);

  JUMPOUT(0x22A6B67D0);
}

const void **ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    unint64_t v6 = result;
    __n128 result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_22932C65C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *SERestoreInfo::BLOB::operator=(void *a1, void *a2)
{
  if (a2 != a1)
  {
    uint64_t v4 = a2[2];
    a1[1] = a2[1];
    a1[2] = v4;
    int v5 = (const void *)a1[3];
    if (v5)
    {
      CFRelease(v5);
      a1[3] = 0;
    }
    unint64_t v6 = (const void *)a2[3];
    if (v6) {
      a1[3] = CFRetain(v6);
    }
  }
  return a1;
}

void SERestoreInfo::BLOB::~BLOB(SERestoreInfo::BLOB *this)
{
  SERestoreInfo::BLOB::~BLOB(this);

  JUMPOUT(0x22A6B67D0);
}

{
  const void *v2;

  *(void *)this = &unk_26DD73970;
  uint64_t v2 = (const void *)*((void *)this + 3);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 3) = 0;
  }
}

void SERestoreInfo::SEFirmwareBase::~SEFirmwareBase(SERestoreInfo::SEFirmwareBase *this)
{
  *(void *)this = &unk_26DD751E0;
  uint64_t v2 = (const void *)*((void *)this + 1);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 1) = 0;
  }
  uint64_t v3 = (void **)((char *)this + 16);
  std::vector<SERestoreInfo::BLOB>::__destroy_vector::operator()[abi:ne180100](&v3);
}

void std::vector<SERestoreInfo::BLOB>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    int v5 = **a1;
    if (v4 != v2)
    {
      unint64_t v6 = v4 - 32;
      uint64_t v7 = v4 - 32;
      size_t v8 = v4 - 32;
      do
      {
        long long v9 = *(void (***)(char *))v8;
        v8 -= 32;
        (*v9)(v7);
        v6 -= 32;
        BOOL v10 = v7 == v2;
        uint64_t v7 = v8;
      }
      while (!v10);
      int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void SEUpdaterUtil::P73BaseImage4Signer::doObjectPropertiesCB(SEUpdaterUtil::P73BaseImage4Signer *this, unsigned __int8 **a2, unsigned int *a3)
{
  if (!a2 || !a3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v62, "Assertion: ");
    uint64_t v41 = std::string::append(&v62, "outdata && outlength");
    long long v42 = *(_OWORD *)&v41->__r_.__value_.__l.__data_;
    std::string::size_type v64 = v41->__r_.__value_.__r.__words[2];
    long long v63 = v42;
    v41->__r_.__value_.__l.__size_ = 0;
    v41->__r_.__value_.__r.__words[2] = 0;
    v41->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, &v63);
  }
  if (*((void *)this + 1)) {
    uint64_t v4 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    uint64_t v4 = 0;
  }
  if (!v4)
  {
    long long v43 = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v62, "Assertion: ");
    unint64_t v44 = std::string::append(&v62, "fRequestDict");
    long long v45 = *(_OWORD *)&v44->__r_.__value_.__l.__data_;
    std::string::size_type v64 = v44->__r_.__value_.__r.__words[2];
    long long v63 = v45;
    v44->__r_.__value_.__l.__size_ = 0;
    v44->__r_.__value_.__r.__words[2] = 0;
    v44->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](v43, &v63);
  }
  v62.__r_.__value_.__r.__words[0] = 0;
  uint64_t v5 = Img4EncodeItemBegin();
  SEUpdaterUtil::Img4EncodeCallAndThrow(v5, "Fail to Img4EncodeItemBegin: %d", v6);
  value = 0;
  if (!CFDictionaryGetValueIfPresent(*((CFDictionaryRef *)this + 1), @"SE,UpdatePayload", (const void **)&value)
    || (CFTypeID v7 = CFGetTypeID(value), v7 != CFDictionaryGetTypeID()))
  {
    v46 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(&v63, "Missing kSETagMeasurementUpdatePayload or wrong type");
    v47 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v46, &v63, 2, @"SEUpdaterErrorDomain");
  }
  CFDictionaryRef v8 = (const __CFDictionary *)value;
  if (CFDictionaryGetValueIfPresent((CFDictionaryRef)value, @"DevelopmentUpdatePayloadHash", (const void **)&value))
  {
    CFTypeID v9 = CFGetTypeID(value);
    if (v9 == CFDataGetTypeID())
    {
      CFDataRef v10 = (const __CFData *)value;
      CFDataGetBytePtr((CFDataRef)value);
      CFDataGetLength(v10);
      uint64_t v11 = Img4EncodeItemPropertyData();
      SEUpdaterUtil::Img4EncodeCallAndThrow(v11, "Fail to add sedh", v12);
    }
  }
  if (CFDictionaryGetValueIfPresent(v8, @"ProductionUpdatePayloadHash", (const void **)&value))
  {
    CFTypeID v13 = CFGetTypeID(value);
    if (v13 == CFDataGetTypeID())
    {
      CFDataRef v14 = (const __CFData *)value;
      CFDataGetBytePtr((CFDataRef)value);
      CFDataGetLength(v14);
      uint64_t v15 = Img4EncodeItemPropertyData();
      SEUpdaterUtil::Img4EncodeCallAndThrow(v15, "Fail to add seph", v16);
    }
  }
  CFTypeRef cf = 0;
  if (CFDictionaryGetValueIfPresent(*((CFDictionaryRef *)this + 1), @"SEAC", &cf))
  {
    CFTypeID v17 = CFGetTypeID(cf);
    if (v17 == CFNumberGetTypeID())
    {
      uint64_t v18 = Img4EncodeItemPropertyBool();
      SEUpdaterUtil::Img4EncodeCallAndThrow(v18, "Failed to add seac", v19);
    }
  }
  if (CFDictionaryGetValueIfPresent(*((CFDictionaryRef *)this + 1), @"SERS", &cf))
  {
    CFTypeID v20 = CFGetTypeID(cf);
    if (v20 == CFNumberGetTypeID())
    {
      uint64_t v21 = Img4EncodeItemPropertyBool();
      SEUpdaterUtil::Img4EncodeCallAndThrow(v21, "Failed to add sers", v22);
    }
  }
  if (CFDictionaryGetValueIfPresent(*((CFDictionaryRef *)this + 1), @"SESA", &cf))
  {
    CFTypeID v23 = CFGetTypeID(cf);
    if (v23 == CFNumberGetTypeID())
    {
      uint64_t v24 = Img4EncodeItemPropertyBool();
      SEUpdaterUtil::Img4EncodeCallAndThrow(v24, "Failed to add sesa", v25);
    }
  }
  if (CFDictionaryGetValueIfPresent(*((CFDictionaryRef *)this + 1), @"SE,RapRTKitOS", (const void **)&value))
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID != CFGetTypeID(value))
    {
      uint64_t v48 = __cxa_allocate_exception(0x48uLL);
      std::string::basic_string[abi:ne180100]<0>(&v63, "Wrong type for kRoseTagMeasurementRTKitOS");
      v49 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v48, &v63, 2, @"SEUpdaterErrorDomain");
    }
    if (!CFDictionaryGetValueIfPresent((CFDictionaryRef)value, @"Digest", (const void **)&value))
    {
      v50 = __cxa_allocate_exception(0x48uLL);
      std::string::basic_string[abi:ne180100]<0>(&v63, "Missing kRoseTagDigest in kRoseTagMeasurementRTKitOS");
      uint64_t v51 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v50, &v63, 2, @"SEUpdaterErrorDomain");
    }
    CFTypeID v27 = CFDataGetTypeID();
    if (v27 != CFGetTypeID(value))
    {
      char v52 = __cxa_allocate_exception(0x48uLL);
      std::string::basic_string[abi:ne180100]<0>(&v63, "Wrong type for kRoseTagDigest");
      char v53 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v52, &v63, 2, @"SEUpdaterErrorDomain");
    }
    CFDataRef v28 = (const __CFData *)value;
    CFDataGetBytePtr((CFDataRef)value);
    CFDataGetLength(v28);
    uint64_t v29 = Img4EncodeItemPropertyData();
    SEUpdaterUtil::Img4EncodeCallAndThrow(v29, "Failed to add rtod", v30);
  }
  if (CFDictionaryGetValueIfPresent(*((CFDictionaryRef *)this + 1), @"SE,RapSwBinDsp", (const void **)&value))
  {
    CFTypeID v31 = CFDictionaryGetTypeID();
    if (v31 != CFGetTypeID(value))
    {
      uint64_t v54 = __cxa_allocate_exception(0x48uLL);
      std::string::basic_string[abi:ne180100]<0>(&v63, "Wrong type for kRoseTagMeasurementSwBinDsp1");
      v55 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v54, &v63, 2, @"SEUpdaterErrorDomain");
    }
    if (!CFDictionaryGetValueIfPresent((CFDictionaryRef)value, @"Digest", (const void **)&value))
    {
      v56 = __cxa_allocate_exception(0x48uLL);
      std::string::basic_string[abi:ne180100]<0>(&v63, "Missing kRoseTagDigest in kRoseTagMeasurementSwBinDsp1");
      uint64_t v57 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v56, &v63, 2, @"SEUpdaterErrorDomain");
    }
    CFTypeID v32 = CFDataGetTypeID();
    if (v32 != CFGetTypeID(value))
    {
      char v58 = __cxa_allocate_exception(0x48uLL);
      std::string::basic_string[abi:ne180100]<0>(&v63, "Wrong type for kRoseTagDigest");
      char v59 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v58, &v63, 2, @"SEUpdaterErrorDomain");
    }
    CFDataRef v33 = (const __CFData *)value;
    CFDataGetBytePtr((CFDataRef)value);
    CFDataGetLength(v33);
    uint64_t v34 = Img4EncodeItemPropertyData();
    SEUpdaterUtil::Img4EncodeCallAndThrow(v34, "Failed to add rbdd", v35);
  }
  uint64_t v36 = Img4EncodeItemEnd();
  SEUpdaterUtil::Img4EncodeCallAndThrow(v36, "Fail to Img4EncodeItemEnd", v37);
  uint64_t v38 = Img4EncodeItemCopyBuffer();
  SEUpdaterUtil::Img4EncodeCallAndThrow(v38, "Fail to Img4EncodeItemCopyBuffer", v39);
  SEUpdaterUtil::SEImg4EncodeContext::~SEImg4EncodeContext((SEUpdaterUtil::SEImg4EncodeContext *)&v62);
}

void sub_22932D050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  SEUpdaterUtil::SEImg4EncodeContext::~SEImg4EncodeContext((SEUpdaterUtil::SEImg4EncodeContext *)&a12);
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get(uint64_t a1)
{
  return *(void *)a1;
}

void SEUpdaterUtil::SEImg4EncodeContext::~SEImg4EncodeContext(SEUpdaterUtil::SEImg4EncodeContext *this)
{
  if (*(void *)this)
  {
    Img4EncodeItemDestroy();
    *(void *)this = 0;
  }
}

void SERestoreInfo::P73BaseDeviceInfo::parseManifest(SERestoreInfo::P73BaseDeviceInfo *this@<X0>, unsigned __int8 **a2@<X8>)
{
  uint64_t v4 = *((void *)this + 2);
  v27[0] = *((void *)this + 1);
  v27[1] = v4;
  uint64_t v5 = DERDecodeItem((uint64_t)v27, &v28);
  std::string::basic_string[abi:ne180100]<0>(v25, "Fail to parse MQR: cannot decode top level tag");
  SERestoreInfo::CallAndThrow<DERReturn>(v5, (uint64_t)v25);
  if (v26 < 0) {
    operator delete(v25[0]);
  }
  if (v28 != 0xE00000000000001ELL)
  {
    exception = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(&v24, "Fail to parse MQR: wrong top level tag");
    uint64_t v11 = (void *)SERestoreInfo::SEException::SEException((uint64_t)exception, (long long *)&v24, 2, @"SEUpdaterErrorDomain");
  }
  v23[0] = 0;
  v23[1] = 0;
  unint64_t v6 = DERParseSequenceContent(&v29, 1u, (uint64_t)&P73BaseManifestQueryResponseDerSpec::ManifestResponseItemSpec, (unint64_t)v23, 0x10uLL);
  std::string::basic_string[abi:ne180100]<0>(__p, "Fail to parse MQR");
  SERestoreInfo::CallAndThrow<DERReturn>((uint64_t)v6, (uint64_t)__p);
  if (v22 < 0) {
    operator delete(__p[0]);
  }
  *((_OWORD *)a2 + 13) = 0u;
  *((_OWORD *)a2 + 14) = 0u;
  *((_OWORD *)a2 + 11) = 0u;
  *((_OWORD *)a2 + 12) = 0u;
  *((_OWORD *)a2 + 9) = 0u;
  *((_OWORD *)a2 + 10) = 0u;
  *((_OWORD *)a2 + 7) = 0u;
  *((_OWORD *)a2 + 8) = 0u;
  *((_OWORD *)a2 + 5) = 0u;
  *((_OWORD *)a2 + 6) = 0u;
  *((_OWORD *)a2 + 3) = 0u;
  *((_OWORD *)a2 + 4) = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  *((_OWORD *)a2 + 2) = 0u;
  *(_OWORD *)a2 = 0u;
  CFTypeID v7 = DERParseSequenceContent(v23, 0xFu, (uint64_t)&P73BaseManifestQueryResponseDerSpec::ManifestResponseDataItemSpec, (unint64_t)a2, 0xF0uLL);
  std::string::basic_string[abi:ne180100]<0>(v19, "Fail to parse MQR.data");
  SERestoreInfo::CallAndThrow<DERReturn>((uint64_t)v7, (uint64_t)v19);
  if (v20 < 0) {
    operator delete(v19[0]);
  }
  if (a2[1] != (unsigned __int8 *)1
    || (unint64_t)a2[3] > 2
    || (unint64_t)a2[5] > 2
    || (unint64_t)a2[7] > 2
    || (unint64_t)a2[9] > 2
    || a2[15] != (unsigned __int8 *)1
    || (unint64_t)a2[25] > 2
    || a2[13] != (unsigned __int8 *)24
    || a2[17] != (unsigned __int8 *)20
    || a2[19] != (unsigned __int8 *)32
    || a2[21] != (unsigned __int8 *)32
    || a2[11] != (unsigned __int8 *)2
    || a2[23] != (unsigned __int8 *)1)
  {
    CFDictionaryRef v8 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(&v24, "size of MQRD doesn't match");
    CFTypeID v9 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v8, (long long *)&v24, 2, @"SEUpdaterErrorDomain");
  }
  if (**a2 == 1)
  {
    if (a2[27] != (unsigned __int8 *)3 || a2[29] != (unsigned __int8 *)32) {
      goto LABEL_30;
    }
  }
  else
  {
    if (**a2)
    {
      uint64_t v14 = **a2;
      uint64_t v15 = __cxa_allocate_exception(0x48uLL);
      std::to_string(&v18, v14);
      uint64_t v16 = std::string::insert(&v18, 0, "Unsupported manifest query version: ");
      std::string v24 = *v16;
      v16->__r_.__value_.__l.__size_ = 0;
      v16->__r_.__value_.__r.__words[2] = 0;
      v16->__r_.__value_.__r.__words[0] = 0;
      CFTypeID v17 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v15, (long long *)&v24, 7, @"SEUpdaterErrorDomain");
    }
    if ((unint64_t)a2[27] | (unint64_t)a2[29])
    {
LABEL_30:
      id v12 = __cxa_allocate_exception(0x48uLL);
      std::string::basic_string[abi:ne180100]<0>(&v24, "size of factoryPostflightState or cometRootKeyId doesn't match");
      CFTypeID v13 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v12, (long long *)&v24, 2, @"SEUpdaterErrorDomain");
    }
  }
}

void sub_22932D52C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,uint64_t a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  if (a35 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

SERestoreInfo::P73BaseDeviceInfo *SERestoreInfo::P73BaseDeviceInfo::P73BaseDeviceInfo(SERestoreInfo::P73BaseDeviceInfo *this)
{
  *(void *)this = &unk_26DD739B8;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  *((_OWORD *)this + 4) = 0u;
  *((void *)this + 19) = 0;
  *((void *)this + 20) = 0;
  *((void *)this + 21) = 0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((void *)this + 16) = 0;
  SERestoreInfo::P73BaseDeviceInfo::init(this);
  return this;
}

void sub_22932D660(_Unwind_Exception *exception_object)
{
  uint64_t v5 = v2;
  CFTypeID v7 = *v5;
  if (*v5)
  {
    v1[20] = v7;
    operator delete(v7);
  }
  CFDictionaryRef v8 = (void *)v1[14];
  if (v8)
  {
    v1[15] = v8;
    operator delete(v8);
  }
  CFTypeID v9 = (void *)v1[11];
  if (v9)
  {
    v1[12] = v9;
    operator delete(v9);
  }
  CFDataRef v10 = *v4;
  if (*v4)
  {
    v1[9] = v10;
    operator delete(v10);
  }
  uint64_t v11 = *v3;
  if (*v3)
  {
    v1[5] = v11;
    operator delete(v11);
  }
  _Unwind_Resume(exception_object);
}

double SERestoreInfo::P73BaseDeviceInfo::init(SERestoreInfo::P73BaseDeviceInfo *this)
{
  *((_DWORD *)this + 14) = 0;
  *((_DWORD *)this + 2) = 1;
  char v7 = 0;
  std::vector<unsigned char>::assign((char **)this + 4, 0x18uLL, &v7);
  char v6 = 0;
  std::vector<unsigned char>::assign((char **)this + 8, 0x14uLL, &v6);
  char v5 = 0;
  std::vector<unsigned char>::assign((char **)this + 11, 0x20uLL, &v5);
  char v4 = 0;
  std::vector<unsigned char>::assign((char **)this + 14, 0x20uLL, &v4);
  *((void *)this + 17) = 0;
  *(void *)((char *)this + 20) = 0;
  *(void *)((char *)this + 12) = 0;
  *((_DWORD *)this + 7) = 23195;
  *((_DWORD *)this + 36) = 0;
  char v3 = 0;
  std::vector<unsigned char>::assign((char **)this + 19, 0x20uLL, &v3);
  double result = 0.0;
  *((void *)this + 22) = 0;
  *((_DWORD *)this + 46) = 0;
  return result;
}

SERestoreInfo::P73BaseDeviceInfo *SERestoreInfo::P73BaseDeviceInfo::P73BaseDeviceInfo(SERestoreInfo::P73BaseDeviceInfo *this, const SERestoreInfo::BLOB *a2)
{
  *(void *)this = &unk_26DD739B8;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  *((_OWORD *)this + 4) = 0u;
  *((void *)this + 19) = 0;
  *((void *)this + 20) = 0;
  *((void *)this + 21) = 0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((void *)this + 16) = 0;
  SERestoreInfo::P73BaseDeviceInfo::init(this);
  memset(v5, 0, sizeof(v5));
  SERestoreInfo::P73BaseDeviceInfo::parseManifest(a2, (unsigned __int8 **)v5);
  SERestoreInfo::P73BaseDeviceInfo::updateDeviceInfo((uint64_t)this, (unsigned __int8 **)v5);
  return this;
}

void sub_22932D84C(_Unwind_Exception *exception_object)
{
  char v6 = *v4;
  if (*v4)
  {
    v1[20] = v6;
    operator delete(v6);
  }
  char v7 = (void *)v1[14];
  if (v7)
  {
    v1[15] = v7;
    operator delete(v7);
  }
  CFDictionaryRef v8 = (void *)v1[11];
  if (v8)
  {
    v1[12] = v8;
    operator delete(v8);
  }
  CFTypeID v9 = *v3;
  if (*v3)
  {
    v1[9] = v9;
    operator delete(v9);
  }
  CFDataRef v10 = *v2;
  if (*v2)
  {
    v1[5] = v10;
    operator delete(v10);
  }
  _Unwind_Resume(exception_object);
}

void *SERestoreInfo::P73BaseDeviceInfo::updateDeviceInfo(uint64_t a1, unsigned __int8 **a2)
{
  v75[3] = *MEMORY[0x263EF8340];
  char v4 = a2[1];
  if (v4)
  {
    int v5 = 0;
    char v6 = *a2;
    do
    {
      int v7 = *v6++;
      int v5 = v7 | (v5 << 8);
      --v4;
    }
    while (v4);
  }
  else
  {
    int v5 = 0;
  }
  *(_DWORD *)(a1 + 8) = v5;
  CFDictionaryRef v8 = a2[3];
  if (v8)
  {
    unsigned int v9 = 0;
    CFDataRef v10 = a2[2];
    do
    {
      int v11 = *v10++;
      unsigned int v9 = v11 | (v9 << 8);
      --v8;
    }
    while (v8);
  }
  else
  {
    unsigned int v9 = 0;
  }
  *(_DWORD *)(a1 + 12) = v9;
  id v12 = a2[5];
  if (v12)
  {
    int v13 = 0;
    uint64_t v14 = a2[4];
    do
    {
      int v15 = *v14++;
      int v13 = v15 | (v13 << 8);
      --v12;
    }
    while (v12);
  }
  else
  {
    int v13 = 0;
  }
  *(_DWORD *)(a1 + 16) = v13;
  uint64_t v16 = a2[7];
  if (v16)
  {
    int v17 = 0;
    std::string v18 = a2[6];
    do
    {
      int v19 = *v18++;
      int v17 = v19 | (v17 << 8);
      --v16;
    }
    while (v16);
  }
  else
  {
    int v17 = 0;
  }
  *(_DWORD *)(a1 + 20) = v17;
  char v20 = a2[9];
  if (v20)
  {
    int v21 = 0;
    char v22 = a2[8];
    do
    {
      int v23 = *v22++;
      int v21 = v23 | (v21 << 8);
      --v20;
    }
    while (v20);
  }
  else
  {
    int v21 = 0;
  }
  *(_DWORD *)(a1 + 24) = v21;
  std::string v24 = a2[15];
  if (!v24)
  {
    *(_DWORD *)(a1 + 56) = 0;
    goto LABEL_88;
  }
  int v25 = 0;
  char v26 = a2[14];
  do
  {
    int v27 = *v26++;
    int v25 = v27 | (v25 << 8);
    --v24;
  }
  while (v24);
  *(_DWORD *)(a1 + 56) = v25;
  if (v25 > 114)
  {
    if (v25 != 115)
    {
      if (v25 != 210 && v25 != 200)
      {
LABEL_88:
        exception = __cxa_allocate_exception(0x48uLL);
        std::string::basic_string[abi:ne180100]<0>(v69, "Unsupported chip ID");
        uint64_t v57 = (void *)SERestoreInfo::SEException::SEException((uint64_t)exception, v69, 2, @"SEUpdaterErrorDomain");
      }
      goto LABEL_37;
    }
    unsigned int v28 = 2;
  }
  else if ((v25 - 54) < 2)
  {
    unsigned int v28 = 5;
  }
  else
  {
    if (v25 != 44)
    {
      if (v25 != 100) {
        goto LABEL_88;
      }
LABEL_37:
      unsigned int v28 = 3;
      goto LABEL_41;
    }
    unsigned int v28 = 4;
  }
LABEL_41:
  *(_DWORD *)(a1 + 180) = v28;
  if ((atomic_load_explicit((atomic_uchar *volatile)&_MergedGlobals_1, memory_order_acquire) & 1) == 0)
  {
    unsigned int v60 = v28;
    int v58 = __cxa_guard_acquire(&_MergedGlobals_1);
    unsigned int v28 = v60;
    if (v58)
    {
      uint64_t v68 = 0x1400000F00;
      std::map<unsigned int,unsigned int>::map[abi:ne180100](v64, (unsigned int *)&v68, 1);
      LODWORD(v69[0]) = 3;
      std::map<unsigned int,unsigned int>::map[abi:ne180100]((uint64_t *)v69 + 1, v64);
      uint64_t v67 = 0x1400000300;
      std::map<unsigned int,unsigned int>::map[abi:ne180100](v63, (unsigned int *)&v67, 1);
      int v70 = 4;
      std::map<unsigned int,unsigned int>::map[abi:ne180100](v71, v63);
      uint64_t v66 = 0x1400000100;
      std::map<unsigned int,unsigned int>::map[abi:ne180100](v62, (unsigned int *)&v66, 1);
      int v72 = 5;
      std::map<unsigned int,unsigned int>::map[abi:ne180100](v73, v62);
      uint64_t v65 = 0x1400000000;
      std::map<unsigned int,unsigned int>::map[abi:ne180100](v61, (unsigned int *)&v65, 1);
      int v74 = 6;
      std::map<unsigned int,unsigned int>::map[abi:ne180100](v75, v61);
      std::map<unsigned int,std::map<unsigned int,unsigned int>>::map[abi:ne180100]((uint64_t *)v69, 4);
      for (uint64_t i = 7; i != -1; i -= 2)
        std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(*(void **)&v69[i]);
      std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy((void *)v61[1]);
      std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy((void *)v62[1]);
      std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy((void *)v63[1]);
      std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy((void *)v64[1]);
      __cxa_guard_release(&_MergedGlobals_1);
      unsigned int v28 = v60;
    }
  }
  uint64_t v29 = qword_26AD829A8;
  if (!qword_26AD829A8)
  {
LABEL_48:
    int v32 = -1;
    goto LABEL_64;
  }
  uint64_t v30 = qword_26AD829A8;
  while (1)
  {
    unsigned int v31 = *(_DWORD *)(v30 + 32);
    if (v28 >= v31) {
      break;
    }
LABEL_47:
    uint64_t v30 = *(void *)v30;
    if (!v30) {
      goto LABEL_48;
    }
  }
  if (v31 < v28)
  {
    v30 += 8;
    goto LABEL_47;
  }
  while (1)
  {
    while (1)
    {
      unsigned int v33 = *(_DWORD *)(v29 + 32);
      if (v33 <= v28) {
        break;
      }
      uint64_t v29 = *(void *)v29;
      if (!v29) {
LABEL_86:
      }
        std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
    }
    if (v33 >= v28) {
      break;
    }
    uint64_t v29 = *(void *)(v29 + 8);
    if (!v29) {
      goto LABEL_86;
    }
  }
  std::map<unsigned int,unsigned int>::map[abi:ne180100]((uint64_t *)v69, (void *)(v29 + 40));
  uint64_t v34 = *(long long **)&v69[0];
  int v32 = -1;
  if (*(long long **)&v69[0] != (long long *)((char *)v69 + 8))
  {
    do
    {
      if (*((_DWORD *)v34 + 7) <= v9) {
        int v32 = *((_DWORD *)v34 + 8);
      }
      unint64_t v35 = (long long *)*((void *)v34 + 1);
      if (v35)
      {
        do
        {
          uint64_t v36 = v35;
          unint64_t v35 = *(long long **)v35;
        }
        while (v35);
      }
      else
      {
        do
        {
          uint64_t v36 = (long long *)*((void *)v34 + 2);
          BOOL v37 = *(void *)v36 == (void)v34;
          uint64_t v34 = v36;
        }
        while (!v37);
      }
      uint64_t v34 = v36;
    }
    while (v36 != (long long *)((char *)v69 + 8));
  }
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(*((void **)&v69[0] + 1));
LABEL_64:
  *(_DWORD *)(a1 + 184) = v32;
  uint64_t v38 = a2[25];
  if (v38)
  {
    int v39 = 0;
    BOOL v40 = a2[24];
    do
    {
      int v41 = *v40++;
      int v39 = v41 | (v39 << 8);
      --v38;
    }
    while (v38);
  }
  else
  {
    int v39 = 0;
  }
  *(_DWORD *)(a1 + 140) = v39;
  long long v42 = a2[23];
  if (v42)
  {
    int v43 = 0;
    unint64_t v44 = a2[22];
    do
    {
      int v45 = *v44++;
      int v43 = v45 | (v43 << 8);
      --v42;
    }
    while (v42);
  }
  else
  {
    int v43 = 0;
  }
  *(_DWORD *)(a1 + 136) = v43;
  v46 = a2[27];
  if (v46)
  {
    int v47 = 0;
    uint64_t v48 = a2[26];
    do
    {
      int v49 = *v48++;
      int v47 = v49 | (v47 << 8);
      --v46;
    }
    while (v46);
    *(_DWORD *)(a1 + 144) = v47;
  }
  std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>((void *)(a1 + 32), (char *)a2[12], (char *)&a2[13][(void)a2[12]], (unint64_t)a2[13]);
  std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>((void *)(a1 + 64), (char *)a2[16], (char *)&a2[17][(void)a2[16]], (unint64_t)a2[17]);
  std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>((void *)(a1 + 88), (char *)a2[18], (char *)&a2[19][(void)a2[18]], (unint64_t)a2[19]);
  double result = std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>((void *)(a1 + 112), (char *)a2[20], (char *)&a2[21][(void)a2[20]], (unint64_t)a2[21]);
  unint64_t v51 = (unint64_t)a2[29];
  if (v51) {
    double result = std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>((void *)(a1 + 152), (char *)a2[28], (char *)&a2[28][v51], v51);
  }
  char v52 = a2[11];
  if (v52)
  {
    int v53 = 0;
    uint64_t v54 = a2[10];
    do
    {
      int v55 = *v54++;
      int v53 = v55 | (v53 << 8);
      --v52;
    }
    while (v52);
  }
  else
  {
    int v53 = 0;
  }
  *(_DWORD *)(a1 + 28) = v53;
  return result;
}

void sub_22932DE0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  for (uint64_t i = 112; i != -16; i -= 32)
    std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(*(void **)(v31 + i));
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(a11);
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(a14);
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(a17);
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(a20);
  __cxa_guard_abort(&_MergedGlobals_1);
  _Unwind_Resume(a1);
}

void SERestoreInfo::P73BaseDeviceInfo::updateDict(SERestoreInfo::P73BaseDeviceInfo *this, __CFDictionary *a2, char a3)
{
  int valuePtr = *((_DWORD *)this + 14);
  CFNumberRef v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
  if (!v6) {
    __assert_rtn("_CFDictionarySetInteger32", "SERestoreInfoHelpers.hpp", 42, "num != nullptr");
  }
  CFNumberRef v7 = v6;
  CFDictionarySetValue(a2, @"SE,ChipID", v6);
  CFRelease(v7);
  CFDataRef v8 = CFDataCreate(0, *((const UInt8 **)this + 4), *((void *)this + 5) - *((void *)this + 4));
  if (!v8) {
    goto LABEL_9;
  }
  CFDataRef v9 = v8;
  CFDictionarySetValue(a2, @"SE,ID", v8);
  CFRelease(v9);
  CFDataRef v10 = CFDataCreate(0, *((const UInt8 **)this + 8), *((void *)this + 9) - *((void *)this + 8));
  if (!v10) {
    goto LABEL_9;
  }
  CFDataRef v11 = v10;
  CFDictionarySetValue(a2, @"SE,Nonce", v10);
  CFRelease(v11);
  CFDataRef v12 = CFDataCreate(0, *((const UInt8 **)this + 11), *((void *)this + 12) - *((void *)this + 11));
  if (!v12) {
    goto LABEL_9;
  }
  CFDataRef v13 = v12;
  CFDictionarySetValue(a2, @"SE,RootKeyIdentifier", v12);
  CFRelease(v13);
  if (a3) {
    return;
  }
  CFDataRef v14 = CFDataCreate(0, *((const UInt8 **)this + 14), *((void *)this + 15) - *((void *)this + 14));
  if (!v14) {
LABEL_9:
  }
    __assert_rtn("_CFDictionarySetData", "SERestoreInfoHelpers.hpp", 59, "tmpData");
  CFDataRef v15 = v14;
  CFDictionarySetValue(a2, @"SE,OSUPubKeyID", v14);
  CFRelease(v15);
}

void SERestoreInfo::P73BaseDeviceInfo::getStateName(int a1@<W0>, std::string *a2@<X8>)
{
  v45[3] = *MEMORY[0x263EF8340];
  v30[0] = 23195;
  std::string::basic_string[abi:ne180100]<0>(v31, "EXPORT_REQUIRED");
  int v32 = 47411;
  std::string::basic_string[abi:ne180100]<0>(v33, "IMPORT_REQUIRED");
  int v34 = 47361;
  std::string::basic_string[abi:ne180100]<0>(v35, "UOS1");
  int v36 = 47362;
  std::string::basic_string[abi:ne180100]<0>(v37, "UOS2");
  int v38 = 42241;
  std::string::basic_string[abi:ne180100]<0>(v39, "UOS1_ERROR");
  int v40 = 42242;
  std::string::basic_string[abi:ne180100]<0>(v41, "UOS2_ERROR");
  int v42 = 47545;
  std::string::basic_string[abi:ne180100]<0>(v43, "EXPORT_FINISHED");
  int v44 = 47377;
  std::string::basic_string[abi:ne180100]<0>(v45, "UOS1_KTP");
  char v3 = 0;
  uint64_t v4 = 0;
  unsigned int v28 = 0;
  uint64_t v29 = 0;
  int v27 = &v28;
  int v5 = &v28;
  while (1)
  {
    CFNumberRef v6 = &v30[8 * v4];
    int v7 = *v6;
    CFDataRef v8 = &v28;
    if (v5 == &v28) {
      goto LABEL_8;
    }
    CFDataRef v9 = v3;
    CFDataRef v10 = &v28;
    if (v3)
    {
      do
      {
        CFDataRef v8 = (uint64_t **)v9;
        CFDataRef v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      do
      {
        CFDataRef v8 = (uint64_t **)v10[2];
        BOOL v11 = *v8 == (uint64_t *)v10;
        CFDataRef v10 = v8;
      }
      while (v11);
    }
    if (*((_DWORD *)v8 + 8) < v7)
    {
LABEL_8:
      if (v3) {
        CFDataRef v12 = v8;
      }
      else {
        CFDataRef v12 = &v28;
      }
      if (v3)
      {
        CFDataRef v13 = v8 + 1;
      }
      else
      {
        CFDataRef v8 = (uint64_t **)&v27;
        CFDataRef v13 = &v28;
      }
      if (v8[1]) {
        goto LABEL_30;
      }
LABEL_24:
      uint64_t v16 = (char *)operator new(0x40uLL);
      *((_DWORD *)v16 + 8) = v7;
      int v17 = (std::string *)(v16 + 40);
      std::string v18 = &v30[8 * v4];
      int v19 = (const std::string::value_type **)(v18 + 2);
      if (*((char *)v6 + 31) < 0)
      {
        std::string::__init_copy_ctor_external(v17, *v19, *((void *)v18 + 2));
      }
      else
      {
        *(_OWORD *)&v17->__r_.__value_.__l.__data_ = *(_OWORD *)v19;
        *((void *)v16 + 7) = *((void *)v18 + 3);
      }
      *(void *)uint64_t v16 = 0;
      *((void *)v16 + 1) = 0;
      *((void *)v16 + 2) = v12;
      *CFDataRef v13 = (uint64_t *)v16;
      if (*v27)
      {
        int v27 = (uint64_t **)*v27;
        uint64_t v16 = (char *)*v13;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v28, (uint64_t *)v16);
      ++v29;
      goto LABEL_30;
    }
    CFDataRef v13 = &v28;
    CFDataRef v12 = &v28;
    if (!v3) {
      goto LABEL_24;
    }
    CFDataRef v14 = v3;
    while (1)
    {
      while (1)
      {
        CFDataRef v12 = (uint64_t **)v14;
        int v15 = *((_DWORD *)v14 + 8);
        if (v15 <= v7) {
          break;
        }
        CFDataRef v14 = *v12;
        CFDataRef v13 = v12;
        if (!*v12) {
          goto LABEL_24;
        }
      }
      if (v15 >= v7) {
        break;
      }
      CFDataRef v14 = v12[1];
      if (!v14)
      {
        CFDataRef v13 = v12 + 1;
        goto LABEL_24;
      }
    }
LABEL_30:
    if (++v4 == 8) {
      break;
    }
    int v5 = v27;
    char v3 = v28;
  }
  for (uint64_t i = 0; i != -32; i -= 4)
  {
    if (SHIBYTE(v45[i + 2]) < 0) {
      operator delete((void *)v45[i]);
    }
  }
  int v21 = v28;
  if (!v28)
  {
LABEL_42:
    std::string::basic_string[abi:ne180100]<0>(a2, "UNK_STATE");
    goto LABEL_43;
  }
  char v22 = v28;
  while (2)
  {
    int v23 = *((_DWORD *)v22 + 8);
    if (v23 > a1)
    {
LABEL_41:
      char v22 = (uint64_t *)*v22;
      if (!v22) {
        goto LABEL_42;
      }
      continue;
    }
    break;
  }
  if (v23 < a1)
  {
    ++v22;
    goto LABEL_41;
  }
  while (1)
  {
    while (1)
    {
      int v24 = *((_DWORD *)v21 + 8);
      if (v24 <= a1) {
        break;
      }
      int v21 = (uint64_t *)*v21;
      if (!v21) {
LABEL_52:
      }
        std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
    }
    if (v24 >= a1) {
      break;
    }
    int v21 = (uint64_t *)v21[1];
    if (!v21) {
      goto LABEL_52;
    }
  }
  if (*((char *)v21 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(a2, (const std::string::value_type *)v21[5], v21[6]);
  }
  else
  {
    long long v25 = *(_OWORD *)(v21 + 5);
    a2->__r_.__value_.__r.__words[2] = v21[7];
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = v25;
  }
LABEL_43:
  std::__tree<std::__value_type<SERestoreInfo::AMS_UOS_ID,std::string>,std::__map_value_compare<SERestoreInfo::AMS_UOS_ID,std::__value_type<SERestoreInfo::AMS_UOS_ID,std::string>,std::less<SERestoreInfo::AMS_UOS_ID>,true>,std::allocator<std::__value_type<SERestoreInfo::AMS_UOS_ID,std::string>>>::destroy((char *)v28);
}

void sub_22932E450(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  while (1)
  {
    if (*(v13 - 1) < 0) {
      operator delete(*((void **)v13 - 3));
    }
    v13 -= 32;
    if (v13 == &a13) {
      _Unwind_Resume(exception_object);
    }
  }
}

void SERestoreInfo::P73BaseDeviceInfo::getIm4State(SERestoreInfo::P73BaseDeviceInfo *this@<X0>, std::string *a2@<X8>)
{
  unsigned int v2 = this;
  uint64_t v39[3] = *MEMORY[0x263EF8340];
  v30[0] = 23130;
  std::string::basic_string[abi:ne180100]<0>(v31, "Idle");
  int v32 = 47545;
  std::string::basic_string[abi:ne180100]<0>(v33, "IM4M_validated");
  int v34 = 26471;
  std::string::basic_string[abi:ne180100]<0>(v35, "IM4P_validated");
  int v36 = 59367;
  std::string::basic_string[abi:ne180100]<0>(v37, "IM4P_Resent");
  int v38 = 42405;
  std::string::basic_string[abi:ne180100]<0>(v39, "Im4_error");
  char v3 = 0;
  uint64_t v4 = 0;
  unsigned int v28 = 0;
  uint64_t v29 = 0;
  int v27 = &v28;
  int v5 = &v28;
  while (1)
  {
    CFNumberRef v6 = &v30[8 * v4];
    unsigned int v7 = *v6;
    CFDataRef v8 = &v28;
    if (v5 == &v28) {
      goto LABEL_8;
    }
    CFDataRef v9 = v3;
    CFDataRef v10 = &v28;
    if (v3)
    {
      do
      {
        CFDataRef v8 = (uint64_t **)v9;
        CFDataRef v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      do
      {
        CFDataRef v8 = (uint64_t **)v10[2];
        BOOL v11 = *v8 == (uint64_t *)v10;
        CFDataRef v10 = v8;
      }
      while (v11);
    }
    if (*((_DWORD *)v8 + 8) < v7)
    {
LABEL_8:
      if (v3) {
        CFDataRef v12 = v8;
      }
      else {
        CFDataRef v12 = &v28;
      }
      if (v3)
      {
        CFDataRef v13 = v8 + 1;
      }
      else
      {
        CFDataRef v8 = (uint64_t **)&v27;
        CFDataRef v13 = &v28;
      }
      if (v8[1]) {
        goto LABEL_30;
      }
LABEL_24:
      uint64_t v16 = (char *)operator new(0x40uLL);
      *((_DWORD *)v16 + 8) = v7;
      int v17 = (std::string *)(v16 + 40);
      std::string v18 = &v30[8 * v4];
      int v19 = (const std::string::value_type **)(v18 + 2);
      if (*((char *)v6 + 31) < 0)
      {
        std::string::__init_copy_ctor_external(v17, *v19, *((void *)v18 + 2));
      }
      else
      {
        *(_OWORD *)&v17->__r_.__value_.__l.__data_ = *(_OWORD *)v19;
        *((void *)v16 + 7) = *((void *)v18 + 3);
      }
      *(void *)uint64_t v16 = 0;
      *((void *)v16 + 1) = 0;
      *((void *)v16 + 2) = v12;
      *CFDataRef v13 = (uint64_t *)v16;
      if (*v27)
      {
        int v27 = (uint64_t **)*v27;
        uint64_t v16 = (char *)*v13;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v28, (uint64_t *)v16);
      ++v29;
      goto LABEL_30;
    }
    CFDataRef v13 = &v28;
    CFDataRef v12 = &v28;
    if (!v3) {
      goto LABEL_24;
    }
    CFDataRef v14 = v3;
    while (1)
    {
      while (1)
      {
        CFDataRef v12 = (uint64_t **)v14;
        unsigned int v15 = *((_DWORD *)v14 + 8);
        if (v15 <= v7) {
          break;
        }
        CFDataRef v14 = *v12;
        CFDataRef v13 = v12;
        if (!*v12) {
          goto LABEL_24;
        }
      }
      if (v15 >= v7) {
        break;
      }
      CFDataRef v14 = v12[1];
      if (!v14)
      {
        CFDataRef v13 = v12 + 1;
        goto LABEL_24;
      }
    }
LABEL_30:
    if (++v4 == 5) {
      break;
    }
    int v5 = v27;
    char v3 = v28;
  }
  for (uint64_t i = 0; i != -20; i -= 4)
  {
    if (SHIBYTE(v39[i + 2]) < 0) {
      operator delete((void *)v39[i]);
    }
  }
  int v21 = v28;
  if (!v28)
  {
LABEL_42:
    std::string::basic_string[abi:ne180100]<0>(a2, "UNK_IM4_STATE");
    goto LABEL_43;
  }
  char v22 = v28;
  while (2)
  {
    unsigned int v23 = *((_DWORD *)v22 + 8);
    if (v23 > v2)
    {
LABEL_41:
      char v22 = (uint64_t *)*v22;
      if (!v22) {
        goto LABEL_42;
      }
      continue;
    }
    break;
  }
  if (v23 < v2)
  {
    ++v22;
    goto LABEL_41;
  }
  while (1)
  {
    while (1)
    {
      unsigned int v24 = *((_DWORD *)v21 + 8);
      if (v24 <= v2) {
        break;
      }
      int v21 = (uint64_t *)*v21;
      if (!v21) {
LABEL_52:
      }
        std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
    }
    if (v24 >= v2) {
      break;
    }
    int v21 = (uint64_t *)v21[1];
    if (!v21) {
      goto LABEL_52;
    }
  }
  if (*((char *)v21 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(a2, (const std::string::value_type *)v21[5], v21[6]);
  }
  else
  {
    long long v25 = *(_OWORD *)(v21 + 5);
    a2->__r_.__value_.__r.__words[2] = v21[7];
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = v25;
  }
LABEL_43:
  std::__tree<std::__value_type<SERestoreInfo::AMS_UOS_ID,std::string>,std::__map_value_compare<SERestoreInfo::AMS_UOS_ID,std::__value_type<SERestoreInfo::AMS_UOS_ID,std::string>,std::less<SERestoreInfo::AMS_UOS_ID>,true>,std::allocator<std::__value_type<SERestoreInfo::AMS_UOS_ID,std::string>>>::destroy((char *)v28);
}

void sub_22932E830(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  while (1)
  {
    if (*(v13 - 1) < 0) {
      operator delete(*((void **)v13 - 3));
    }
    v13 -= 32;
    if (v13 == &a13) {
      _Unwind_Resume(exception_object);
    }
  }
}

uint64_t SERestoreInfo::P73BaseDeviceInfo::print(SERestoreInfo::P73BaseDeviceInfo *this)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v18);
  BOOL isDev = SERestoreInfo::P73BaseDeviceInfo::isDev(this);
  if (isDev) {
    char v3 = "DEV ";
  }
  else {
    char v3 = "PROD ";
  }
  if (isDev) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = 5;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)v3, v4);
  int v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"{ ", 2);
  SERestoreInfo::P73BaseDeviceInfo::getStateName(*((_DWORD *)this + 7), &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)p_p, size);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  *(_DWORD *)((char *)&v18[1] + *(void *)(v18[0] - 24)) = *(_DWORD *)((unsigned char *)&v18[1] + *(void *)(v18[0] - 24)) & 0xFFFFFFB5 | 8;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)" rsn=0x", 7);
  CFDataRef v8 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)" csn=0x", 7);
  CFDataRef v9 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)" fsn=0x", 7);
  CFDataRef v10 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)" bsn=0x", 7);
  BOOL v11 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)" FPState=0x", 11);
  std::ostream::operator<<();
  CFDataRef v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)" ", 1);
  SERestoreInfo::P73BaseDeviceInfo::getIm4State((SERestoreInfo::P73BaseDeviceInfo *)*((unsigned int *)this + 35), &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    CFDataRef v13 = &__p;
  }
  else {
    CFDataRef v13 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v14 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v14 = __p.__r_.__value_.__l.__size_;
  }
  unsigned int v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)v13, v14);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" }", 2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::stringbuf::str();
  v18[0] = *MEMORY[0x263F8C2C8];
  *(void *)((char *)v18 + *(void *)(v18[0] - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  v18[1] = MEMORY[0x263F8C318] + 16;
  if (v19 < 0) {
    operator delete((void *)v18[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x22A6B6710](&v20);
}

void sub_22932EB98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C340] + 64;
  *(void *)(a1 + 112) = MEMORY[0x263F8C340] + 64;
  uint64_t v3 = *(void *)(MEMORY[0x263F8C2C8] + 16);
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2C8] + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  int v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 8));
  uint64_t v6 = MEMORY[0x263F8C340] + 24;
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)a1 = v6;
  *(void *)(a1 + 112) = v2;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_22932ED40(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x22A6B6710](v1);
  _Unwind_Resume(a1);
}

BOOL SERestoreInfo::P73BaseDeviceInfo::isDev(SERestoreInfo::P73BaseDeviceInfo *this)
{
  int v2 = (*(uint64_t (**)(SERestoreInfo::P73BaseDeviceInfo *))(*(void *)this + 32))(this);
  BOOL v3 = 1;
  RootCA::getRootKeyId(1, v2, &v8);
  uint64_t v4 = (const void *)*((void *)this + 11);
  size_t v5 = *((void *)this + 12) - (void)v4;
  uint64_t v6 = v8;
  if (v5 == v9 - v8) {
    BOOL v3 = memcmp(v4, v8, v5) != 0;
  }
  if (v6)
  {
    CFDataRef v9 = v6;
    operator delete(v6);
  }
  return v3;
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2C8];
  uint64_t v3 = *MEMORY[0x263F8C2C8];
  *(void *)a1 = *MEMORY[0x263F8C2C8];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x22A6B6710](a1 + 112);
  return a1;
}

BOOL SERestoreInfo::P73BaseDeviceInfo::isProdEval(SERestoreInfo::P73BaseDeviceInfo *this)
{
  uint64_t v2 = operator new(0x20uLL);
  *uint64_t v2 = constinit;
  v2[1] = unk_22936AA18;
  uint64_t v3 = operator new(0x20uLL);
  *uint64_t v3 = constinit_34;
  v3[1] = unk_22936AA38;
  uint64_t v4 = (uint64_t *)*((void *)this + 14);
  if (*((void *)this + 15) - (void)v4 == 32)
  {
    if (*v4 == *(void *)v2
      && v4[1] == *((void *)v2 + 1)
      && v4[2] == *((void *)v2 + 2)
      && v4[3] == *((void *)v2 + 3))
    {
      BOOL v15 = 1;
    }
    else
    {
      uint64_t v8 = *v4;
      uint64_t v9 = v4[1];
      uint64_t v11 = v4[2];
      uint64_t v10 = v4[3];
      BOOL v15 = v8 == *(void *)v3 && v9 == *((void *)v3 + 1) && v11 == *((void *)v3 + 2) && v10 == *((void *)v3 + 3);
    }
  }
  else
  {
    BOOL v15 = 0;
  }
  operator delete(v3);
  operator delete(v2);
  return v15;
}

void sub_22932EFD4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

char *std::vector<unsigned char>::assign(char **a1, unint64_t a2, char *a3)
{
  unint64_t v4 = a2;
  unint64_t v6 = (unint64_t)a1[2];
  double result = *a1;
  if (v6 - (unint64_t)result >= a2)
  {
    unint64_t v12 = a1[1] - result;
    if (v12 >= a2) {
      unint64_t v13 = a2;
    }
    else {
      unint64_t v13 = a1[1] - result;
    }
    for (; v13; --v13)
      *result++ = *a3;
    BOOL v14 = a2 >= v12;
    unint64_t v15 = a2 - v12;
    if (v15 != 0 && v14)
    {
      uint64_t v16 = a1[1];
      int v17 = &v16[v15];
      do
      {
        *v16++ = *a3;
        --v15;
      }
      while (v15);
      a1[1] = v17;
    }
    else
    {
      a1[1] = &(*a1)[a2];
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      unint64_t v6 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if ((v4 & 0x8000000000000000) != 0) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v8 = 2 * v6;
    if (2 * v6 <= v4) {
      uint64_t v8 = v4;
    }
    if (v6 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v9 = v8;
    }
    double result = std::vector<unsigned char>::__vallocate[abi:ne180100](a1, v9);
    uint64_t v10 = a1[1];
    uint64_t v11 = &v10[v4];
    do
    {
      *v10++ = *a3;
      --v4;
    }
    while (v4);
    a1[1] = v11;
  }
  return result;
}

uint64_t *std::map<unsigned int,unsigned int>::map[abi:ne180100](uint64_t *a1, unsigned int *a2, uint64_t a3)
{
  a1[1] = 0;
  unint64_t v4 = a1 + 1;
  a1[2] = 0;
  *a1 = (uint64_t)(a1 + 1);
  if (a3)
  {
    uint64_t v6 = 8 * a3;
    do
    {
      std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__emplace_hint_unique_key_args<unsigned int,std::pair<unsigned int const,unsigned int> const&>(a1, v4, *a2, *(void *)a2);
      a2 += 2;
      v6 -= 8;
    }
    while (v6);
  }
  return a1;
}

void sub_22932F294(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(*v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__emplace_hint_unique_key_args<unsigned int,std::pair<unsigned int const,unsigned int> const&>(uint64_t *result, uint64_t *a2, unsigned int a3, uint64_t a4)
{
  size_t v5 = (uint64_t **)a2;
  uint64_t v6 = result;
  unsigned int v7 = (uint64_t **)(result + 1);
  if (result + 1 != a2)
  {
    unsigned int v8 = *((_DWORD *)a2 + 7);
    if (v8 <= a3)
    {
      if (v8 >= a3) {
        return result;
      }
      unint64_t v13 = (uint64_t **)(a2 + 1);
      unint64_t v12 = (uint64_t *)a2[1];
      if (v12)
      {
        do
        {
          unint64_t v13 = (uint64_t **)v12;
          unint64_t v12 = (uint64_t *)*v12;
          size_t v5 = v13;
          BOOL v14 = v13;
        }
        while (v12);
      }
      else
      {
        BOOL v14 = (uint64_t **)a2;
        do
        {
          uint64_t v20 = (uint64_t *)v14;
          BOOL v14 = (uint64_t **)v14[2];
        }
        while (*v14 != v20);
      }
      if (v14 == v7) {
        goto LABEL_42;
      }
      if (*((_DWORD *)v14 + 7) > a3) {
        goto LABEL_42;
      }
      int v21 = *v7;
      unint64_t v13 = (uint64_t **)(result + 1);
      size_t v5 = (uint64_t **)(result + 1);
      if (!*v7) {
        goto LABEL_42;
      }
      while (1)
      {
        while (1)
        {
          size_t v5 = (uint64_t **)v21;
          unsigned int v22 = *((_DWORD *)v21 + 7);
          if (v22 <= a3) {
            break;
          }
          int v21 = (uint64_t *)*v21;
          unint64_t v13 = v5;
          if (!*v5) {
            goto LABEL_42;
          }
        }
        if (v22 >= a3) {
          return result;
        }
        int v21 = (uint64_t *)v21[1];
        if (!v21)
        {
LABEL_30:
          unint64_t v13 = v5 + 1;
          goto LABEL_42;
        }
      }
    }
  }
  size_t v9 = (uint64_t *)*a2;
  if ((uint64_t *)*result == a2)
  {
    uint64_t v11 = a2;
  }
  else
  {
    if (v9)
    {
      uint64_t v10 = (uint64_t *)*a2;
      do
      {
        uint64_t v11 = v10;
        uint64_t v10 = (uint64_t *)v10[1];
      }
      while (v10);
    }
    else
    {
      unint64_t v15 = a2;
      do
      {
        uint64_t v11 = (uint64_t *)v15[2];
        BOOL v16 = *v11 == (void)v15;
        unint64_t v15 = v11;
      }
      while (v16);
    }
    if (*((_DWORD *)v11 + 7) >= a3)
    {
      std::string v18 = *v7;
      unint64_t v13 = (uint64_t **)(result + 1);
      size_t v5 = (uint64_t **)(result + 1);
      if (!*v7) {
        goto LABEL_42;
      }
      while (1)
      {
        while (1)
        {
          size_t v5 = (uint64_t **)v18;
          unsigned int v19 = *((_DWORD *)v18 + 7);
          if (v19 <= a3) {
            break;
          }
          std::string v18 = (uint64_t *)*v18;
          unint64_t v13 = v5;
          if (!*v5) {
            goto LABEL_42;
          }
        }
        if (v19 >= a3) {
          return result;
        }
        std::string v18 = (uint64_t *)v18[1];
        if (!v18) {
          goto LABEL_30;
        }
      }
    }
  }
  if (v9) {
    int v17 = (uint64_t **)v11;
  }
  else {
    int v17 = (uint64_t **)a2;
  }
  if (v9) {
    unint64_t v13 = (uint64_t **)(v11 + 1);
  }
  else {
    unint64_t v13 = (uint64_t **)a2;
  }
  if (!*v13)
  {
    size_t v5 = v17;
LABEL_42:
    unsigned int v23 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v23 + 28) = a4;
    *unsigned int v23 = 0;
    v23[1] = 0;
    unint64_t v23[2] = (uint64_t)v5;
    *unint64_t v13 = v23;
    uint64_t v24 = *(void *)*v6;
    if (v24)
    {
      uint64_t *v6 = v24;
      long long v25 = *v13;
    }
    else
    {
      long long v25 = v23;
    }
    double result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v6[1], v25);
    ++v6[2];
  }
  return result;
}

void std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(*a1);
    std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

uint64_t *std::map<unsigned int,std::map<unsigned int,unsigned int>>::map[abi:ne180100](uint64_t *result, uint64_t a2)
{
  qword_26AD829B0 = 0;
  qword_26AD829A8 = 0;
  qword_26AD829A0 = (uint64_t)&qword_26AD829A8;
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t v3 = 0;
    unint64_t v4 = &result[4 * a2];
    size_t v5 = &qword_26AD829A8;
    while (1)
    {
      unsigned int v6 = *(_DWORD *)v2;
      if (v5 == &qword_26AD829A8) {
        break;
      }
      unsigned int v7 = (uint64_t *)v3;
      if (v3)
      {
        do
        {
          unsigned int v8 = v7;
          unsigned int v7 = (uint64_t *)v7[1];
        }
        while (v7);
      }
      else
      {
        size_t v9 = &qword_26AD829A8;
        do
        {
          unsigned int v8 = (uint64_t *)v9[2];
          BOOL v10 = *v8 == (void)v9;
          size_t v9 = v8;
        }
        while (v10);
      }
      if (*((_DWORD *)v8 + 8) < v6) {
        goto LABEL_11;
      }
      if (!v3) {
        goto LABEL_22;
      }
      uint64_t v12 = v3;
      while (1)
      {
        while (1)
        {
          unsigned int v8 = (uint64_t *)v12;
          unsigned int v13 = *(_DWORD *)(v12 + 32);
          if (v13 <= v6) {
            break;
          }
          uint64_t v12 = *v8;
          uint64_t v11 = v8;
          if (!*v8) {
            goto LABEL_23;
          }
        }
        if (v13 >= v6) {
          break;
        }
        uint64_t v12 = v8[1];
        if (!v12)
        {
          uint64_t v11 = v8 + 1;
          goto LABEL_23;
        }
      }
LABEL_26:
      v2 += 4;
      if (v2 == v4) {
        return result;
      }
      size_t v5 = (uint64_t *)qword_26AD829A0;
      uint64_t v3 = qword_26AD829A8;
    }
    unsigned int v8 = &qword_26AD829A8;
LABEL_11:
    if (v3)
    {
      uint64_t v11 = v8 + 1;
      if (v8[1]) {
        goto LABEL_26;
      }
    }
    else
    {
LABEL_22:
      uint64_t v11 = &qword_26AD829A8;
      unsigned int v8 = &qword_26AD829A8;
    }
LABEL_23:
    uint64_t v14 = (uint64_t)operator new(0x40uLL);
    *(_DWORD *)(v14 + 32) = v6;
    std::map<unsigned int,unsigned int>::map[abi:ne180100]((uint64_t *)(v14 + 40), v2 + 1);
    *(void *)uint64_t v14 = 0;
    *(void *)(v14 + 8) = 0;
    *(void *)(v14 + 16) = v8;
    *uint64_t v11 = v14;
    if (*(void *)qword_26AD829A0)
    {
      qword_26AD829A0 = *(void *)qword_26AD829A0;
      uint64_t v14 = *v11;
    }
    double result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)qword_26AD829A8, (uint64_t *)v14);
    ++qword_26AD829B0;
    goto LABEL_26;
  }
  return result;
}

void sub_22932F654(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<unsigned int,std::map<unsigned int,unsigned int>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::map<unsigned int,unsigned int>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::map<unsigned int,unsigned int>>>>::destroy(v1);
  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<unsigned int,std::map<unsigned int,unsigned int>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::map<unsigned int,unsigned int>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::map<unsigned int,unsigned int>>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<unsigned int,std::map<unsigned int,unsigned int>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::map<unsigned int,unsigned int>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::map<unsigned int,unsigned int>>>>::destroy(*a1);
    std::__tree<std::__value_type<unsigned int,std::map<unsigned int,unsigned int>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::map<unsigned int,unsigned int>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::map<unsigned int,unsigned int>>>>::destroy(a1[1]);
    std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy((void *)a1[6]);
    operator delete(a1);
  }
}

uint64_t *std::map<unsigned int,unsigned int>::map[abi:ne180100](uint64_t *a1, void *a2)
{
  a1[1] = 0;
  uint64_t v3 = a1 + 1;
  a1[2] = 0;
  *a1 = (uint64_t)(a1 + 1);
  unint64_t v4 = a2 + 1;
  size_t v5 = (void *)*a2;
  if ((void *)*a2 != a2 + 1)
  {
    do
    {
      std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__emplace_hint_unique_key_args<unsigned int,std::pair<unsigned int const,unsigned int> const&>(a1, v3, *((_DWORD *)v5 + 7), *(void *)((char *)v5 + 28));
      unsigned int v6 = (void *)v5[1];
      if (v6)
      {
        do
        {
          unsigned int v7 = v6;
          unsigned int v6 = (void *)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          unsigned int v7 = (void *)v5[2];
          BOOL v8 = *v7 == (void)v5;
          size_t v5 = v7;
        }
        while (!v8);
      }
      size_t v5 = v7;
    }
    while (v7 != v4);
  }
  return a1;
}

void sub_22932F76C(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(*v1);
  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<SERestoreInfo::AMS_UOS_ID,std::string>,std::__map_value_compare<SERestoreInfo::AMS_UOS_ID,std::__value_type<SERestoreInfo::AMS_UOS_ID,std::string>,std::less<SERestoreInfo::AMS_UOS_ID>,true>,std::allocator<std::__value_type<SERestoreInfo::AMS_UOS_ID,std::string>>>::destroy(char *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<SERestoreInfo::AMS_UOS_ID,std::string>,std::__map_value_compare<SERestoreInfo::AMS_UOS_ID,std::__value_type<SERestoreInfo::AMS_UOS_ID,std::string>,std::less<SERestoreInfo::AMS_UOS_ID>,true>,std::allocator<std::__value_type<SERestoreInfo::AMS_UOS_ID,std::string>>>::destroy(*(void *)a1);
    std::__tree<std::__value_type<SERestoreInfo::AMS_UOS_ID,std::string>,std::__map_value_compare<SERestoreInfo::AMS_UOS_ID,std::__value_type<SERestoreInfo::AMS_UOS_ID,std::string>,std::less<SERestoreInfo::AMS_UOS_ID>,true>,std::allocator<std::__value_type<SERestoreInfo::AMS_UOS_ID,std::string>>>::destroy(*((void *)a1 + 1));
    if (a1[63] < 0) {
      operator delete(*((void **)a1 + 5));
    }
    operator delete(a1);
  }
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22A6B6510](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      BOOL v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x22A6B6520](v13);
  return a1;
}

void sub_22932F918(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x22A6B6520](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x22932F8F8);
}

void sub_22932F96C(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      unsigned int v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_22932FAEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

void SERestoreInfo::UpdateTableEntry::~UpdateTableEntry(SERestoreInfo::UpdateTableEntry *this)
{
  uint64_t v2 = (void *)*((void *)this + 3);
  if (v2)
  {
    *((void *)this + 4) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void **)this;
  std::vector<std::vector<unsigned short>>::__destroy_vector::operator()[abi:ne180100](&v3);
}

uint64_t SERestoreInfo::ImageBinary::print(int *a1, uint64_t a2)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v21);
  int v4 = *(char *)(a2 + 23);
  if (v4 >= 0) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = *(void *)a2;
  }
  if (v4 >= 0) {
    uint64_t v6 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    uint64_t v6 = *(void *)(a2 + 8);
  }
  size_t v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)"[", 1);
  size_t v8 = (void *)std::ostream::operator<<();
  int v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"] ", 2);
  BOOL v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"{", 1);
  size_t v11 = strlen(off_264863500[*a1]);
  int64_t v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)off_264863500[*a1], v11);
  unsigned int v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"}: ", 3);
  std::string::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(__p, *((char **)a1 + 2), (char *)(*((void *)a1 + 2) + *((void *)a1 + 3)), *((void *)a1 + 3));
  if ((v20 & 0x80u) == 0) {
    uint64_t v14 = __p;
  }
  else {
    uint64_t v14 = (void **)__p[0];
  }
  if ((v20 & 0x80u) == 0) {
    uint64_t v15 = v20;
  }
  else {
    uint64_t v15 = (uint64_t)__p[1];
  }
  BOOL v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)v14, v15);
  std::ios_base::getloc((const std::ios_base *)((char *)v16 + *(void *)(*v16 - 24)));
  int v17 = std::locale::use_facet(&v24, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v17->__vftable[2].~facet_0)(v17, 10);
  std::locale::~locale(&v24);
  std::ostream::put();
  std::ostream::flush();
  if ((char)v20 < 0) {
    operator delete(__p[0]);
  }
  std::stringbuf::str();
  v21[0] = *MEMORY[0x263F8C2C8];
  *(void *)((char *)v21 + *(void *)(v21[0] - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  v21[1] = MEMORY[0x263F8C318] + 16;
  if (v22 < 0) {
    operator delete((void *)v21[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x22A6B6710](&v23);
}

void sub_22932FE88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
}

uint64_t SERestoreInfo::P73BaseDeliveryObject::updateMeasurement(SERestoreInfo::P73BaseDeliveryObject *this, CFDictionaryRef theDict, __CFError **a3)
{
  if (!theDict || !a3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&value, "Assertion: ");
    int v21 = std::string::append(&value, "outError && outMeasurementDict");
    long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
    uint64_t v29 = (char *)v21->__r_.__value_.__r.__words[2];
    long long v28 = v22;
    v21->__r_.__value_.__l.__size_ = 0;
    v21->__r_.__value_.__r.__words[2] = 0;
    v21->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, &v28);
  }
  value.__r_.__value_.__r.__words[0] = 0;
  if (CFDictionaryGetValueIfPresent(theDict, @"SE,UpdatePayload", (const void **)&value.__r_.__value_.__l.__data_))
  {
    BOOL v6 = value.__r_.__value_.__r.__words[0] == 0;
  }
  else
  {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    CFTypeID v7 = CFGetTypeID(value.__r_.__value_.__l.__data_);
    if (v7 == CFDictionaryGetTypeID())
    {
      if (value.__r_.__value_.__r.__words[0]) {
        size_t v8 = (__CFDictionary *)CFRetain(value.__r_.__value_.__l.__data_);
      }
      else {
        size_t v8 = 0;
      }
LABEL_12:
      BOOL v10 = (size_t *)ccsha256_di();
      long long v28 = 0uLL;
      uint64_t v29 = 0;
      size_t v11 = *v10;
      if (*v10)
      {
        if ((v11 & 0x8000000000000000) != 0) {
          std::vector<std::string>::__throw_length_error[abi:ne180100]();
        }
        int64_t v12 = (char *)operator new(*v10);
        bzero(v12, v11);
        *(void *)&long long v28 = v12;
        *((void *)&v28 + 1) = &v12[v11];
        uint64_t v29 = &v12[v11];
      }
      ccdigest();
      unsigned int v13 = (void *)v28;
      CFDataRef v14 = CFDataCreate(0, (const UInt8 *)v28, *((void *)&v28 + 1) - v28);
      if (v14)
      {
        BOOL isDev = SERestoreInfo::P73BaseDeliveryObject::isDev(*((SERestoreInfo::P73BaseDeliveryObject **)this + 8), *((void *)this + 9));
        BOOL v16 = kSETagMeasurementDevHash;
        if (!isDev) {
          BOOL v16 = kSETagMeasurementProdHash;
        }
        CFDictionarySetValue(v8, *v16, v14);
        int v17 = 0;
        if (v13) {
LABEL_19:
        }
          operator delete(v13);
      }
      else
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "Fail to allocate tmpData");
        *a3 = SERestoreInfo::CreateCFError((const UInt8 *)__p, 3, 0, @"SEUpdaterErrorDomain");
        if (v24 < 0) {
          operator delete(__p[0]);
        }
        int v17 = 6;
        if (v13) {
          goto LABEL_19;
        }
      }
      if (v17 == 6)
      {
        char v18 = 0;
        if (!v8)
        {
LABEL_23:
          if (v14) {
            CFRelease(v14);
          }
          return v18 & 1;
        }
      }
      else
      {
        char v18 = 1;
        if (!v8) {
          goto LABEL_23;
        }
      }
      CFRelease(v8);
      goto LABEL_23;
    }
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    size_t v8 = Mutable;
    CFDictionarySetValue(theDict, @"SE,UpdatePayload", Mutable);
    goto LABEL_12;
  }
  std::string::basic_string[abi:ne180100]<0>(v25, "Fail to allocate imageProps");
  *a3 = SERestoreInfo::CreateCFError((const UInt8 *)v25, 3, 0, @"SEUpdaterErrorDomain");
  if (v26 < 0) {
    operator delete(v25[0]);
  }
  char v18 = 0;
  return v18 & 1;
}

void sub_2293301AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL SERestoreInfo::P73BaseDeliveryObject::isDev(SERestoreInfo::P73BaseDeliveryObject *this, uint64_t a2)
{
  if (a2 - (void)this != 32) {
    return 0;
  }
  if (*(void *)this == 0x7B77E47DEC309FF8
    && *((void *)this + 1) == 0x8BF8D2A44AE3A97CLL
    && *((void *)this + 2) == 0xAD34DB13A59CC364
    && *((void *)this + 3) == 0xAC0A2E6B4C223984)
  {
    return 1;
  }
  BOOL v5 = *(void *)this == 0x74975A216330E276 && *((void *)this + 1) == 0x1F7F7DD3B6FB8D34;
  BOOL v6 = v5 && *((void *)this + 2) == 0x3FA240FAC488FFFLL;
  if (v6 && *((void *)this + 3) == 0x21EC7881080683DALL) {
    return 1;
  }
  BOOL v8 = *(void *)this == 0xD314CD88B2A173ABLL && *((void *)this + 1) == 0xD0014B39DB0B4552;
  BOOL v9 = v8 && *((void *)this + 2) == 0xC3B3802C47832D1BLL;
  if (v9 && *((void *)this + 3) == 0x102CA645D536B9F3) {
    return 1;
  }
  BOOL v11 = *(void *)this == 0x43028028D9EE140FLL && *((void *)this + 1) == 0x764EF91F0B455B82;
  BOOL v12 = v11 && *((void *)this + 2) == 0x74D2E6CF8CD1659BLL;
  if (v12 && *((void *)this + 3) == 0xBD4FC5BCF7FB4792) {
    return 1;
  }
  BOOL v14 = *(void *)this == 0x19016EC184635976 && *((void *)this + 1) == 0xD25BD62A9019D9A3;
  BOOL v15 = v14 && *((void *)this + 2) == 0xFD6855BA8DAED7D1;
  if (v15 && *((void *)this + 3) == 0x3E6F156DACCAB98) {
    return 1;
  }
  BOOL v17 = *(void *)this == 0x4B4B6EEF8151F8B0 && *((void *)this + 1) == 0x80D0BF7EE34277A5;
  BOOL v18 = v17 && *((void *)this + 2) == 0xA6421FFAFBC6C2D3;
  if (v18 && *((void *)this + 3) == 0x11CF79E52F051694) {
    return 1;
  }
  BOOL v20 = *(void *)this == 0x3B369AD4F6E8946ALL && *((void *)this + 1) == 0x3A6B9A9BB3089AACLL;
  BOOL v21 = v20 && *((void *)this + 2) == 0x8FA19016C1B6DB7CLL;
  if (v21 && *((void *)this + 3) == 0x40ACEFB5D4F4787) {
    return 1;
  }
  BOOL v23 = *(void *)this == 0xFC41962122793EF7 && *((void *)this + 1) == 0xB912209BBCCC0208;
  BOOL v24 = v23 && *((void *)this + 2) == 0xA845838AEC9D85B0;
  if (v24 && *((void *)this + 3) == 0x1DAD2E5A3D9AD8A8) {
    return 1;
  }
  return *(void *)this == 0xCBD1BDB61BAAD564
      && *((void *)this + 1) == 0x957F8100699D3DAALL
      && *((void *)this + 2) == 0xB07184D6337E1DBCLL
      && *((void *)this + 3) == 0x710CE2BFF2A6DF1CLL;
}

uint64_t SERestoreInfo::P73BaseDeliveryObject::updateVersionDict(SERestoreInfo::P73BaseDeliveryObject *this, __CFDictionary *a2, __CFError **a3)
{
  if (!a2 || !a3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v12, "Assertion: ");
    BOOL v10 = std::string::append(&v12, "outError && outDict");
    long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
    std::string::size_type v14 = v10->__r_.__value_.__r.__words[2];
    long long v13 = v11;
    v10->__r_.__value_.__l.__size_ = 0;
    v10->__r_.__value_.__r.__words[2] = 0;
    v10->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, &v13);
  }
  CFStringRef v5 = CFStringCreateWithBytes(0, *((const UInt8 **)this + 12), *((void *)this + 13), 0x8000100u, 0);
  BOOL isDev = SERestoreInfo::P73BaseDeliveryObject::isDev(*((SERestoreInfo::P73BaseDeliveryObject **)this + 8), *((void *)this + 9));
  CFTypeID v7 = kSETagVersionDev;
  if (!isDev) {
    CFTypeID v7 = kSETagVersionProd;
  }
  CFDictionarySetValue(a2, *v7, v5);
  if (v5) {
    CFRelease(v5);
  }
  return 1;
}

void sub_2293306C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

BOOL SERestoreInfo::P73BaseDeliveryObject::matchID(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t **)a2;
  if (*(void *)(a2 + 8) - *(void *)a2 != 32) {
    return 0;
  }
  uint64_t v3 = *(uint64_t **)(a1 + 64);
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = *v2;
  uint64_t v7 = v2[1];
  uint64_t v9 = v3[2];
  uint64_t v8 = v3[3];
  uint64_t v11 = v2[2];
  uint64_t v10 = v2[3];
  return v4 == v6 && v5 == v7 && v9 == v11 && v8 == v10;
}

uint64_t SERestoreInfo::P73BaseDeliveryObject::print(SERestoreInfo::P73BaseDeliveryObject *this)
{
  v93[3] = *MEMORY[0x263EF8340];
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v71);
  uint64_t v2 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v71, (uint64_t)"Details: ", 9);
  std::string::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(__p, *((char **)this + 12), (char *)(*((void *)this + 12) + *((void *)this + 13)), *((void *)this + 13));
  if ((__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v3 = __p;
  }
  else {
    uint64_t v3 = (std::string *)__p[0].__r_.__value_.__r.__words[0];
  }
  if ((__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__p[0].__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __p[0].__r_.__value_.__l.__size_;
  }
  uint64_t v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)v3, size);
  std::ios_base::getloc((const std::ios_base *)((char *)v5 + *(void *)(*v5 - 24)));
  uint64_t v6 = std::locale::use_facet(&v77, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v6->__vftable[2].~facet_0)(v6, 10);
  std::locale::~locale(&v77);
  std::ostream::put();
  std::ostream::flush();
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p[0].__r_.__value_.__l.__data_);
  }
  uint64_t v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v71, (uint64_t)"FactoryPostflight revision: ", 28);
  std::to_string(__p, *((unsigned __int8 *)this + 152));
  if ((__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v8 = __p;
  }
  else {
    uint64_t v8 = (std::string *)__p[0].__r_.__value_.__r.__words[0];
  }
  if ((__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v9 = HIBYTE(__p[0].__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v9 = __p[0].__r_.__value_.__l.__size_;
  }
  uint64_t v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)v8, v9);
  std::ios_base::getloc((const std::ios_base *)((char *)v10 + *(void *)(*v10 - 24)));
  uint64_t v11 = std::locale::use_facet(&v77, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v11->__vftable[2].~facet_0)(v11, 10);
  std::locale::~locale(&v77);
  std::ostream::put();
  std::ostream::flush();
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p[0].__r_.__value_.__l.__data_);
  }
  std::string v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v71, (uint64_t)"UpdateTable: ", 13);
  std::ios_base::getloc((const std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  long long v13 = std::locale::use_facet((const std::locale *)__p, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 10);
  std::locale::~locale((std::locale *)__p);
  std::ostream::put();
  std::ostream::flush();
  std::string::basic_string[abi:ne180100]<0>(&v68, "\t");
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v77);
  unsigned int v60 = v12;
  if ((v68.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v14 = &v68;
  }
  else {
    std::string::size_type v14 = (std::string *)v68.__r_.__value_.__r.__words[0];
  }
  if ((v68.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v15 = HIBYTE(v68.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v15 = v68.__r_.__value_.__l.__size_;
  }
  BOOL v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v77, (uint64_t)v14, v15);
  BOOL v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"BSN: ", 5);
  *(_DWORD *)((char *)v17 + *(void *)(*v17 - 24) + 8) = *(_DWORD *)((unsigned char *)v17 + *(void *)(*v17 - 24) + 8) & 0xFFFFFFB5 | 8;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"0x", 2);
  BOOL v18 = (void *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v18 + *(void *)(*v18 - 24)));
  unsigned int v19 = std::locale::use_facet((const std::locale *)__p, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v19->__vftable[2].~facet_0)(v19, 10);
  std::locale::~locale((std::locale *)__p);
  std::ostream::put();
  std::ostream::flush();
  uint64_t v65 = (unsigned __int16 ***)*((void *)this + 16);
  long long v63 = (unsigned __int16 ***)*((void *)this + 17);
  if (v65 != v63)
  {
    std::string::size_type v61 = *MEMORY[0x263F8C2C8];
    std::string::size_type v62 = *(void *)(MEMORY[0x263F8C2C8] + 24);
    do
    {
      if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v74, v68.__r_.__value_.__l.__data_, v68.__r_.__value_.__l.__size_);
      }
      else {
        std::string v74 = v68;
      }
      std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)__p);
      if ((v74.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        BOOL v20 = &v74;
      }
      else {
        BOOL v20 = (std::string *)v74.__r_.__value_.__r.__words[0];
      }
      if ((v74.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v21 = HIBYTE(v74.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v21 = v74.__r_.__value_.__l.__size_;
      }
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__p, (uint64_t)v20, v21);
      if (v65[1] == *v65) {
        std::vector<std::vector<unsigned short>>::__throw_out_of_range[abi:ne180100]();
      }
      int v22 = ***v65;
      BOOL v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__p, (uint64_t)"|", 1);
      SERestoreInfo::P73BaseDeviceInfo::getStateName(v22, &v89);
      if ((v89.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        BOOL v24 = &v89;
      }
      else {
        BOOL v24 = (std::string *)v89.__r_.__value_.__r.__words[0];
      }
      if ((v89.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v25 = HIBYTE(v89.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v25 = v89.__r_.__value_.__l.__size_;
      }
      char v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)v24, v25);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)"| ", 2);
      if (SHIBYTE(v89.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v89.__r_.__value_.__l.__data_);
      }
      int v27 = operator new(0x10uLL);
      *int v27 = xmmword_22936AA90;
      std::string::basic_string[abi:ne180100]<0>(&v89, "AMS");
      std::string::basic_string[abi:ne180100]<0>(v90, "RSN");
      std::string::basic_string[abi:ne180100]<0>(v91, "CSN");
      std::string::basic_string[abi:ne180100]<0>(v92, "FSN");
      std::string::basic_string[abi:ne180100]<0>(v93, "ACTION");
      uint64_t v28 = 0;
      std::string::size_type v64 = v27;
      do
      {
        uint64_t v29 = &v89 + *((int *)v27 + v28);
        int v30 = SHIBYTE(v29->__r_.__value_.__r.__words[2]);
        if (v30 >= 0) {
          uint64_t v31 = &v89 + *((int *)v27 + v28);
        }
        else {
          uint64_t v31 = (std::string *)v29->__r_.__value_.__r.__words[0];
        }
        if (v30 >= 0) {
          uint64_t v32 = HIBYTE(v29->__r_.__value_.__r.__words[2]);
        }
        else {
          uint64_t v32 = v29->__r_.__value_.__l.__size_;
        }
        unsigned int v33 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__p, (uint64_t)v31, v32);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v33, (uint64_t)" { ", 3);
        unint64_t v34 = *((int *)v27 + v28);
        if (0xAAAAAAAAAAAAAAABLL * (v65[1] - *v65) <= v34) {
          std::vector<std::vector<unsigned short>>::__throw_out_of_range[abi:ne180100]();
        }
        uint64_t v35 = (uint64_t)&(*v65)[3 * (int)v34];
        v83 = 0;
        v82.__locale_ = 0;
        uint64_t v84 = 0;
        std::vector<unsigned short>::__init_with_size[abi:ne180100]<unsigned short *,unsigned short *>(&v82, *(const void **)v35, *(void *)(v35 + 8), (uint64_t)(*(void *)(v35 + 8) - *(void *)v35) >> 1);
        locale = v82.__locale_;
        BOOL v37 = v83;
        if (v82.__locale_ != v83)
        {
          int v38 = 0;
          int v39 = v82.__locale_;
          do
          {
            if (v38) {
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__p, (uint64_t)",", 1);
            }
            *(_DWORD *)((char *)&__p[0].__r_.__value_.__r.__words[1]
                      + *(void *)(__p[0].__r_.__value_.__r.__words[0] - 24)) = *(_DWORD *)((unsigned char *)&__p[0].__r_.__value_.__r.__words[1]
                                                                                           + *(void *)(__p[0].__r_.__value_.__r.__words[0] - 24)) & 0xFFFFFFB5 | 8;
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__p, (uint64_t)"0x", 2);
            int v40 = (void *)std::ostream::operator<<();
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v40, (uint64_t)" ", 1);
            int v39 = (std::locale::__imp *)((char *)v39 + 2);
            --v38;
          }
          while (v39 != v37);
        }
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__p, (uint64_t)"} ", 2);
        int v27 = v64;
        if (locale) {
          operator delete(locale);
        }
        ++v28;
      }
      while (v28 != 4);
      std::ios_base::getloc((const std::ios_base *)((char *)__p + *(void *)(__p[0].__r_.__value_.__r.__words[0] - 24)));
      int v41 = std::locale::use_facet(&v82, MEMORY[0x263F8C108]);
      ((void (*)(const std::locale::facet *, uint64_t))v41->__vftable[2].~facet_0)(v41, 10);
      std::locale::~locale(&v82);
      std::ostream::put();
      std::ostream::flush();
      std::stringbuf::str();
      for (uint64_t i = 0; i != -15; i -= 3)
      {
        if (SHIBYTE(v93[i + 2]) < 0) {
          operator delete((void *)v93[i]);
        }
      }
      operator delete(v64);
      __p[0].__r_.__value_.__r.__words[0] = v61;
      *(std::string::size_type *)((char *)__p[0].__r_.__value_.__r.__words + *(void *)(v61 - 24)) = v62;
      __p[0].__r_.__value_.__l.__size_ = MEMORY[0x263F8C318] + 16;
      if (v87 < 0) {
        operator delete(v86);
      }
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      MEMORY[0x22A6B6710](&v88);
      if ((v76 & 0x80u) == 0) {
        int v43 = v75;
      }
      else {
        int v43 = (void **)v75[0];
      }
      if ((v76 & 0x80u) == 0) {
        uint64_t v44 = v76;
      }
      else {
        uint64_t v44 = (uint64_t)v75[1];
      }
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v77, (uint64_t)v43, v44);
      if ((char)v76 < 0) {
        operator delete(v75[0]);
      }
      if (SHIBYTE(v74.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v74.__r_.__value_.__l.__data_);
      }
      v65 += 6;
    }
    while (v65 != v63);
  }
  std::stringbuf::str();
  v77.__locale_ = (std::locale::__imp *)*MEMORY[0x263F8C2C8];
  int v45 = v77.__locale_;
  v46 = *(std::locale::__imp **)(MEMORY[0x263F8C2C8] + 24);
  *(std::locale::__imp **)((char *)&v77.__locale_ + *((void *)v77.__locale_ - 3)) = v46;
  uint64_t v78 = MEMORY[0x263F8C318] + 16;
  if (v80 < 0) {
    operator delete(v79);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x22A6B6710](&v81);
  if ((v70 & 0x80u) == 0) {
    int v47 = v69;
  }
  else {
    int v47 = (void **)v69[0];
  }
  if ((v70 & 0x80u) == 0) {
    uint64_t v48 = v70;
  }
  else {
    uint64_t v48 = (uint64_t)v69[1];
  }
  int v49 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v60, (uint64_t)v47, v48);
  std::ios_base::getloc((const std::ios_base *)((char *)v49 + *(void *)(*v49 - 24)));
  v50 = std::locale::use_facet((const std::locale *)__p, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v50->__vftable[2].~facet_0)(v50, 10);
  std::locale::~locale((std::locale *)__p);
  std::ostream::put();
  std::ostream::flush();
  if ((char)v70 < 0) {
    operator delete(v69[0]);
  }
  if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v68.__r_.__value_.__l.__data_);
  }
  unint64_t v51 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v71, (uint64_t)"Binaries: ", 10);
  std::ios_base::getloc((const std::ios_base *)((char *)v51 + *(void *)(*v51 - 24)));
  char v52 = std::locale::use_facet((const std::locale *)__p, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v52->__vftable[2].~facet_0)(v52, 10);
  std::locale::~locale((std::locale *)__p);
  std::ostream::put();
  std::ostream::flush();
  int v53 = (SERestoreInfo::P73BaseDeliveryObject *)*((void *)this + 1);
  if (v53 != (SERestoreInfo::P73BaseDeliveryObject *)((char *)this + 16))
  {
    do
    {
      std::string::basic_string[abi:ne180100]<0>(v66, "\t");
      SERestoreInfo::ImageBinary::print((int *)v53 + 10, (uint64_t)v66);
      if ((__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v54 = __p;
      }
      else {
        uint64_t v54 = (std::string *)__p[0].__r_.__value_.__r.__words[0];
      }
      if ((__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v55 = HIBYTE(__p[0].__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v55 = __p[0].__r_.__value_.__l.__size_;
      }
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v71, (uint64_t)v54, v55);
      if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p[0].__r_.__value_.__l.__data_);
      }
      if (v67 < 0) {
        operator delete(v66[0]);
      }
      v56 = (SERestoreInfo::P73BaseDeliveryObject *)*((void *)v53 + 1);
      if (v56)
      {
        do
        {
          uint64_t v57 = v56;
          v56 = *(SERestoreInfo::P73BaseDeliveryObject **)v56;
        }
        while (v56);
      }
      else
      {
        do
        {
          uint64_t v57 = (SERestoreInfo::P73BaseDeliveryObject *)*((void *)v53 + 2);
          BOOL v58 = *(void *)v57 == (void)v53;
          int v53 = v57;
        }
        while (!v58);
      }
      int v53 = v57;
    }
    while (v57 != (SERestoreInfo::P73BaseDeliveryObject *)((char *)this + 16));
  }
  std::stringbuf::str();
  v71[0] = v45;
  *(void *)((char *)v71 + *((void *)v45 - 3)) = v46;
  v71[1] = MEMORY[0x263F8C318] + 16;
  if (v72 < 0) {
    operator delete((void *)v71[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x22A6B6710](&v73);
}

void sub_2293313D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33,void *a34,uint64_t a35,uint64_t a36,char a37)
{
  if (a33 < 0) {
    operator delete(__p);
  }
  std::ostringstream::~ostringstream((uint64_t)&a37);
  _Unwind_Resume(a1);
}

BOOL SERestoreInfo::P73BaseDeliveryObject::isFpAvailable(SERestoreInfo::P73BaseDeliveryObject *this)
{
  uint64_t v1 = (char *)*((void *)this + 1);
  uint64_t v2 = (char *)this + 16;
  if (v1 == (char *)this + 16) {
    return 0;
  }
  do
  {
    int v3 = *((_DWORD *)v1 + 10);
    BOOL result = v3 == 3;
    if (v3 == 3) {
      break;
    }
    uint64_t v5 = (char *)*((void *)v1 + 1);
    if (v5)
    {
      do
      {
        uint64_t v6 = v5;
        uint64_t v5 = *(char **)v5;
      }
      while (v5);
    }
    else
    {
      do
      {
        uint64_t v6 = (char *)*((void *)v1 + 2);
        BOOL v7 = *(void *)v6 == (void)v1;
        uint64_t v1 = v6;
      }
      while (!v7);
    }
    uint64_t v1 = v6;
  }
  while (v6 != v2);
  return result;
}

uint64_t SERestoreInfo::P73BaseDeliveryObject::findNextAction(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int16 ****)(a1 + 128);
  int v3 = *(unsigned __int16 ****)(a1 + 136);
  if (v2 == v3)
  {
LABEL_42:
    exception = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(&v28, "No update table entry match found.");
    int v27 = (void *)SERestoreInfo::SEException::SEException((uint64_t)exception, &v28, 32, @"SEUpdaterErrorDomain");
  }
  uint64_t v4 = 0;
  int v5 = *(_DWORD *)(*(void *)a2 + 28);
  unsigned int v6 = *(_DWORD *)(*(void *)a2 + 12);
  unsigned int v7 = *(_DWORD *)(*(void *)a2 + 16);
  int v8 = (unsigned __int16)v7;
  int v9 = (unsigned __int16)v6;
  int v10 = *(_DWORD *)(*(void *)a2 + 20);
  BOOL v13 = v5 != 23195 || v7 != v6 || v6 != v10;
  unsigned int v14 = HIWORD(v7);
  unsigned int v15 = HIWORD(v6);
  while (1)
  {
    BOOL v16 = *v2;
    uint64_t v17 = (char *)v2[1] - (char *)*v2;
    if (!v17) {
      goto LABEL_43;
    }
    if (v5 != **v16) {
      goto LABEL_37;
    }
    unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * (v17 >> 3);
    if (v18 <= 1) {
      goto LABEL_43;
    }
    unsigned int v19 = v16[4];
    if (v14)
    {
LABEL_19:
      BOOL v20 = v16[4];
    }
    else
    {
      BOOL v20 = v16[3];
      if (v20 != v19)
      {
        while (*v20 != v8)
        {
          if (++v20 == v19) {
            goto LABEL_19;
          }
        }
      }
    }
    if (v20 == v19) {
      goto LABEL_37;
    }
    if (v18 <= 2) {
      goto LABEL_43;
    }
    std::string::size_type v21 = v16[7];
    if (v15)
    {
LABEL_26:
      int v22 = v16[7];
    }
    else
    {
      int v22 = v16[6];
      if (v22 != v21)
      {
        while (*v22 != v9)
        {
          if (++v22 == v21) {
            goto LABEL_26;
          }
        }
      }
    }
    if (v22 == v21) {
      goto LABEL_37;
    }
    if (!v13)
    {
      if (!v4) {
        goto LABEL_36;
      }
      if (0xAAAAAAAAAAAAAAABLL * (v4[1] - *v4) <= 3 || v18 <= 3) {
        goto LABEL_43;
      }
      if (*(*v4)[9] < *v16[9]) {
LABEL_36:
      }
        uint64_t v4 = v2;
      goto LABEL_37;
    }
    if (v18 <= 3) {
      goto LABEL_43;
    }
    if (v10 == *v16[9]) {
      break;
    }
LABEL_37:
    v2 += 6;
    if (v2 == v3)
    {
      if (!v4) {
        goto LABEL_42;
      }
      goto LABEL_39;
    }
  }
  uint64_t v4 = v2;
  if (!v2) {
    goto LABEL_42;
  }
LABEL_39:
  BOOL v24 = v4;
  BOOL v23 = *v4;
  if (0xAAAAAAAAAAAAAAABLL * (v24[1] - v23) <= 4) {
LABEL_43:
  }
    std::vector<std::vector<unsigned short>>::__throw_out_of_range[abi:ne180100]();
  return *v23[12];
}

void sub_2293319F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SERestoreInfo::P73BaseDeliveryObject::findFactoryPostflightAction(SERestoreInfo::P73BaseDeliveryObject *this)
{
  _ZNSt3__115allocate_sharedB8ne180100IN13SERestoreInfo17P73BaseDeviceInfoENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v7);
  uint64_t v2 = v7;
  *(_DWORD *)(v7 + 20) = 0xFFFF;
  *(void *)(v2 + 12) = 0xFFFF0000FFFFLL;
  *(_DWORD *)(v2 + 28) = 23195;
  int v3 = v8;
  v6[0] = v2;
  v6[1] = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t NextAction = SERestoreInfo::P73BaseDeliveryObject::findNextAction((uint64_t)this, (uint64_t)v6);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  return NextAction;
}

void sub_229331AB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::__shared_weak_count *a13)
{
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  if (a13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a13);
  }
  _Unwind_Resume(exception_object);
}

void SERestoreInfo::P73BaseFirmware::getDeliveryObject(SERestoreInfo::SEFirmwareBase *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (!*((void *)a1 + 1))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v34, "Assertion: ");
    int v30 = std::string::append(&v34, "fSource");
    long long v31 = *(_OWORD *)&v30->__r_.__value_.__l.__data_;
    std::string::size_type v36 = v30->__r_.__value_.__r.__words[2];
    *(_OWORD *)std::string __p = v31;
    v30->__r_.__value_.__l.__size_ = 0;
    v30->__r_.__value_.__r.__words[2] = 0;
    v30->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, __p);
  }
  (*(void (**)(void **__return_ptr))(**(void **)a2 + 16))(__p);
  int v6 = *(_DWORD *)(*(void *)a2 + 176);
  memset(&v34, 0, sizeof(v34));
  uint64_t v7 = (*((void *)a1 + 3) - *((void *)a1 + 2)) >> 5;
  if (v7)
  {
    uint64_t v32 = a3;
    unsigned int v8 = 0;
    do
    {
      SERestoreInfo::SEFirmwareBase::get(a1, v8);
      int v9 = (std::__shared_weak_count *)*((void *)&v33 + 1);
      if (*((void *)&v33 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v33 + 1) + 8), 1uLL, memory_order_relaxed);
      }
      if ((*(unsigned int (**)(void, void **))(*(void *)v33 + 32))(v33, __p))
      {
        int v10 = *(_DWORD *)(v33 + 160);
        if (!v10 || v10 == v6)
        {
          std::string::size_type size = (void *)v34.__r_.__value_.__l.__size_;
          if (v34.__r_.__value_.__l.__size_ >= v34.__r_.__value_.__r.__words[2])
          {
            unsigned int v14 = (void *)v34.__r_.__value_.__r.__words[0];
            uint64_t v15 = (uint64_t)(v34.__r_.__value_.__l.__size_ - v34.__r_.__value_.__r.__words[0]) >> 4;
            unint64_t v16 = v15 + 1;
            if ((unint64_t)(v15 + 1) >> 60) {
              std::vector<std::string>::__throw_length_error[abi:ne180100]();
            }
            int64_t v17 = v34.__r_.__value_.__r.__words[2] - v34.__r_.__value_.__r.__words[0];
            if ((uint64_t)(v34.__r_.__value_.__r.__words[2] - v34.__r_.__value_.__r.__words[0]) >> 3 > v16) {
              unint64_t v16 = v17 >> 3;
            }
            if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v18 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v18 = v16;
            }
            if (v18 >> 60) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            unsigned int v19 = (char *)operator new(16 * v18);
            BOOL v20 = &v19[16 * v15];
            *(_OWORD *)BOOL v20 = v33;
            if (v9)
            {
              atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
              std::string::size_type size = (void *)v34.__r_.__value_.__l.__size_;
            }
            std::string::size_type v21 = (std::string::size_type)&v19[16 * v18];
            std::string::size_type v13 = (std::string::size_type)(v20 + 16);
            if (size == v14)
            {
              v34.__r_.__value_.__r.__words[0] = (std::string::size_type)&v19[16 * v15];
              v34.__r_.__value_.__l.__size_ = (std::string::size_type)(v20 + 16);
              v34.__r_.__value_.__r.__words[2] = v21;
            }
            else
            {
              do
              {
                long long v22 = *((_OWORD *)size - 1);
                size -= 2;
                *((_OWORD *)v20 - 1) = v22;
                v20 -= 16;
                *std::string::size_type size = 0;
                size[1] = 0;
              }
              while (size != v14);
              std::string::size_type v23 = v34.__r_.__value_.__l.__size_;
              unsigned int v14 = (void *)v34.__r_.__value_.__r.__words[0];
              v34.__r_.__value_.__r.__words[0] = (std::string::size_type)v20;
              v34.__r_.__value_.__l.__size_ = v13;
              v34.__r_.__value_.__r.__words[2] = v21;
              while ((void *)v23 != v14)
              {
                BOOL v24 = *(std::__shared_weak_count **)(v23 - 8);
                if (v24) {
                  std::__shared_weak_count::__release_shared[abi:ne180100](v24);
                }
                v23 -= 16;
              }
            }
            if (v14) {
              operator delete(v14);
            }
          }
          else
          {
            *(void *)v34.__r_.__value_.__l.__size_ = v33;
            size[1] = v9;
            if (v9) {
              atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            std::string::size_type v13 = (std::string::size_type)(size + 2);
          }
          v34.__r_.__value_.__l.__size_ = v13;
        }
      }
      if (v9) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v9);
      }
      if (*((void *)&v33 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v33 + 1));
      }
      ++v8;
    }
    while (v8 != v7);
    std::string::size_type v26 = v34.__r_.__value_.__l.__size_;
    std::string::size_type v25 = (uint64_t *)v34.__r_.__value_.__r.__words[0];
    a3 = v32;
  }
  else
  {
    std::string::size_type v25 = 0;
    std::string::size_type v26 = 0;
  }
  if (v26 - (void)v25 == 16)
  {
    uint64_t v28 = *v25;
    uint64_t v27 = v25[1];
    *a3 = v28;
    a3[1] = v27;
    if (v27) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v27 + 8), 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
  }
  *(void *)&long long v33 = &v34;
  std::vector<std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v33);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_229331DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }
  if (a14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a14);
  }
  *(void *)(v28 - 88) = &a16;
  std::vector<std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v28 - 88));
  if (__p)
  {
    a23 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void SERestoreInfo::P73BaseFirmware::updateMeasurementDict(SERestoreInfo::SEFirmwareBase *this, uint64_t a2, uint64_t a3)
{
  *(void *)int v49 = 0;
  if (*(void *)a3)
  {
    (*(void (**)(long long *__return_ptr))(**(void **)a3 + 16))(&__p);
    operator new();
  }
  int v47 = 0;
  uint64_t v48 = 0;
  v46 = &v47;
  uint64_t v4 = (*((void *)this + 3) - *((void *)this + 2)) >> 5;
  if (!v4)
  {
LABEL_66:
    exception = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(&__p, "No matching delivery object found.");
    int v42 = (void *)SERestoreInfo::SEException::SEException((uint64_t)exception, &__p, 24, @"SEUpdaterErrorDomain");
  }
  unsigned int v5 = 0;
  do
  {
    SERestoreInfo::SEFirmwareBase::get(this, v5);
    int v6 = v45;
    if (v45) {
      atomic_fetch_add_explicit(&v45->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (*(void *)v49)
    {
      unsigned int v8 = *(unsigned __int8 **)(v44 + 64);
      uint64_t v7 = *(unsigned __int8 **)(v44 + 72);
      if (v7 - v8 != *(void *)(*(void *)v49 + 8) - **(void **)v49
        || memcmp(*(const void **)(v44 + 64), **(const void ***)v49, v7 - v8))
      {
LABEL_44:
        if (!v45) {
          goto LABEL_46;
        }
LABEL_45:
        std::__shared_weak_count::__release_shared[abi:ne180100](v6);
        goto LABEL_46;
      }
    }
    else
    {
      unsigned int v8 = *(unsigned __int8 **)(v44 + 64);
      uint64_t v7 = *(unsigned __int8 **)(v44 + 72);
    }
    int v9 = v47;
    if (!v47) {
      goto LABEL_43;
    }
    int v10 = &v47;
    do
    {
      if (v8 == v7)
      {
LABEL_23:
        int v10 = (uint64_t **)v9;
      }
      else
      {
        uint64_t v11 = (unsigned __int8 *)v9[4];
        std::string v12 = v8 + 1;
        while (v11 != (unsigned __int8 *)v9[5])
        {
          unsigned int v13 = *v11;
          unsigned int v14 = *(v12 - 1);
          if (v13 < v14) {
            break;
          }
          ++v11;
          BOOL v15 = v14 < v13 || v12++ == v7;
          if (v15) {
            goto LABEL_23;
          }
        }
        ++v9;
      }
      int v9 = (uint64_t *)*v9;
    }
    while (v9);
    if (&v47 == v10) {
      goto LABEL_43;
    }
    int64_t v17 = v10[4];
    unint64_t v16 = v10[5];
    if (v17 != v16)
    {
      unint64_t v18 = (uint64_t *)((char *)v17 + 1);
      unsigned int v19 = v8;
      while (v19 != v7)
      {
        unsigned int v20 = *v19;
        unsigned int v21 = *((unsigned __int8 *)v18 - 1);
        if (v20 < v21) {
          break;
        }
        ++v19;
        BOOL v22 = v21 < v20 || v18 == v16;
        unint64_t v18 = (uint64_t *)((char *)v18 + 1);
        if (v22) {
          goto LABEL_36;
        }
      }
LABEL_43:
      uint64_t v29 = (uint64_t **)std::__tree<std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>>>::__find_equal<std::vector<unsigned char>>((uint64_t)&v46, &v52, v8, v7);
      if (*v29) {
        goto LABEL_44;
      }
      int v30 = v29;
      long long v31 = *(const void **)(v44 + 64);
      uint64_t v32 = *(void *)(v44 + 72);
      long long v33 = (uint64_t *)operator new(0x48uLL);
      *(void *)&long long __p = v33;
      *((void *)&__p + 1) = &v47;
      char v51 = 0;
      v33[5] = 0;
      v33[6] = 0;
      v33[4] = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v33 + 4, v31, v32, v32 - (void)v31);
      v33[7] = v44;
      v33[8] = (uint64_t)v45;
      char v51 = 1;
      uint64_t v34 = v52;
      *long long v33 = 0;
      v33[1] = 0;
      v33[2] = v34;
      *int v30 = v33;
      if (*v46)
      {
        v46 = (uint64_t **)*v46;
        long long v33 = *v30;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v47, v33);
      ++v48;
      *(void *)&long long __p = 0;
      std::unique_ptr<std::__tree_node<std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>,void *>>>>::reset[abi:ne180100]((uint64_t)&__p);
      goto LABEL_46;
    }
LABEL_36:
    if (*(_DWORD *)(v44 + 160) <= *((_DWORD *)v10[7] + 40)) {
      goto LABEL_44;
    }
    std::string::size_type v23 = (uint64_t **)std::__tree<std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>>>::__find_equal<std::vector<unsigned char>>((uint64_t)&v46, &v52, v8, v7);
    BOOL v24 = *v23;
    if (!*v23)
    {
      std::string::size_type v25 = v23;
      BOOL v24 = (uint64_t *)operator new(0x48uLL);
      *(void *)&long long __p = v24;
      *((void *)&__p + 1) = &v47;
      char v51 = 0;
      v24[5] = 0;
      v24[6] = 0;
      v24[4] = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v24 + 4, *(const void **)(v44 + 64), *(void *)(v44 + 72), *(void *)(v44 + 72) - *(void *)(v44 + 64));
      v24[7] = 0;
      v24[8] = 0;
      char v51 = 1;
      uint64_t v26 = v52;
      *BOOL v24 = 0;
      v24[1] = 0;
      v24[2] = v26;
      *std::string::size_type v25 = v24;
      uint64_t v27 = v24;
      if (*v46)
      {
        v46 = (uint64_t **)*v46;
        uint64_t v27 = *v25;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v47, v27);
      ++v48;
      *(void *)&long long __p = 0;
      std::unique_ptr<std::__tree_node<std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>,void *>>>>::reset[abi:ne180100]((uint64_t)&__p);
    }
    uint64_t v28 = (std::__shared_weak_count *)v24[8];
    v24[7] = v44;
    v24[8] = (uint64_t)v45;
    int v6 = v28;
    if (v28) {
      goto LABEL_45;
    }
LABEL_46:
    if (v45) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v45);
    }
    ++v5;
  }
  while (v5 != v4);
  if (!v48) {
    goto LABEL_66;
  }
  uint64_t v35 = v46;
  if (v46 != &v47)
  {
    do
    {
      *(void *)&long long __p = 0;
      (*(void (**)(uint64_t *, uint64_t, long long *))(*v35[7] + 16))(v35[7], a2, &__p);
      if ((void)__p)
      {
        int v39 = (SERestoreInfo::SEException *)__cxa_allocate_exception(0x48uLL);
        int v40 = SERestoreInfo::SEException::SEException(v39, (CFErrorRef)__p);
      }
      std::string::size_type v36 = v35[1];
      if (v36)
      {
        do
        {
          BOOL v37 = (uint64_t **)v36;
          std::string::size_type v36 = (uint64_t *)*v36;
        }
        while (v36);
      }
      else
      {
        do
        {
          BOOL v37 = (uint64_t **)v35[2];
          BOOL v15 = *v37 == (uint64_t *)v35;
          uint64_t v35 = v37;
        }
        while (!v15);
      }
      uint64_t v35 = v37;
    }
    while (v37 != &v47);
  }
  std::__tree<std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>>>::destroy(v47);
  int v38 = *(const void ***)v49;
  *(void *)int v49 = 0;
  if (v38) {
    std::default_delete<std::vector<unsigned char>>::operator()[abi:ne180100]((uint64_t)v49, (uint64_t)v38);
  }
}

void sub_2293324B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  operator delete(v24);
  uint64_t v26 = a18;
  a18 = 0;
  if (v26) {
    std::default_delete<std::vector<unsigned char>>::operator()[abi:ne180100]((uint64_t)&a18, v26);
  }
  _Unwind_Resume(a1);
}

uint64_t SERestoreInfo::P73BaseFirmware::makeDeliveryObject@<X0>(DERItem *a1@<X1>, void *a2@<X8>)
{
  if (a1->data) {
    BOOL v3 = a1->length == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(__str, "Assertion: ");
    v120 = std::string::append((std::string *)__str, "input.data && input.length");
    long long v121 = *(_OWORD *)&v120->__r_.__value_.__l.__data_;
    __src = (void *)v120->__r_.__value_.__r.__words[2];
    long long v191 = v121;
    v120->__r_.__value_.__l.__size_ = 0;
    v120->__r_.__value_.__r.__words[2] = 0;
    v120->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, &v191);
  }
  unsigned int v4 = DERParseSequenceContent((unint64_t *)a1, 5u, (uint64_t)&P73BaseFirmwareDERSpec::DeliveryObjectItemSpec, (unint64_t)&v191, 0x50uLL);
  if (v4)
  {
    int v151 = v4;
    v152 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(__str, "Failed to parse as per DeliveryObjectItemSpec");
    v153 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v152, (long long *)__str, v151, @"libDERErrorDomain");
  }
  *(_DWORD *)__str = 0;
  if (DERParseInteger((char **)&v191, __str) || *(_DWORD *)__str || v193 != 32)
  {
    v154 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(__str, "Failed to validate delivery object");
    v155 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v154, (long long *)__str, 15, @"SEUpdaterErrorDomain");
  }
  unsigned int v5 = operator new(0xC0uLL);
  v5[1] = 0;
  uint64_t v5[2] = 0;
  *unsigned int v5 = &unk_26DD73B08;
  *((_OWORD *)v5 + 8) = 0u;
  *((_OWORD *)v5 + 9) = 0u;
  *((_OWORD *)v5 + 10) = 0u;
  *((_OWORD *)v5 + 11) = 0u;
  *((_OWORD *)v5 + 7) = 0u;
  int v6 = v5 + 14;
  v174 = (char *)(v5 + 3);
  void v5[5] = 0;
  v5[3] = &unk_26DD73A60;
  v5[4] = v5 + 5;
  v178 = v5 + 5;
  v179 = v5;
  v175 = v5 + 7;
  void v5[6] = 0;
  v5[7] = &unk_26DD73970;
  *((_OWORD *)v5 + 4) = 0u;
  *((_OWORD *)v5 + 5) = 0u;
  *((_OWORD *)v5 + 6) = 0u;
  v5[19] = 0;
  v177 = (char *)(v5 + 19);
  v5[14] = &unk_26DD73970;
  v5[20] = 0;
  v5[21] = 0;
  std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(v5 + 11, (char *)__src, (char *)__src + 32, 0x20uLL);
  *(void *)__str = &unk_26DD73970;
  *(_OWORD *)&__str[8] = v194;
  *(void *)&__str[24] = 0;
  SERestoreInfo::BLOB::operator=(v6, __str);
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)__str);
  v180 = &unk_26DD73970;
  long long v181 = *(_OWORD *)(v179 + 15);
  uint64_t v182 = v179[17];
  if (!(void)v181 || !*((void *)&v181 + 1))
  {
    v114 = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(v207, "Assertion: ");
    v115 = std::string::append((std::string *)v207, "data.data && data.length");
    long long v116 = *(_OWORD *)&v115->__r_.__value_.__l.__data_;
    *(void *)&__str[16] = *((void *)&v115->__r_.__value_.__l + 2);
    *(_OWORD *)__str = v116;
    v115->__r_.__value_.__l.__size_ = 0;
    v115->__r_.__value_.__r.__words[2] = 0;
    v115->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](v114, __str);
  }
  std::string::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(__str, (char *)v181, (char *)(v181 + *((void *)&v181 + 1)), *((unint64_t *)&v181 + 1));
  std::string::size_type v7 = std::string::rfind((const std::string *)__str, 45, 0xFFFFFFFFFFFFFFFFLL);
  if (v7 == -1) {
    goto LABEL_24;
  }
  std::string::basic_string((std::string *)v207, (const std::string *)__str, v7 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)v215);
  if ((__str[23] & 0x80000000) != 0) {
    operator delete(*(void **)__str);
  }
  *(void *)&__str[16] = *(void *)&v207[16];
  *(_OWORD *)__str = *(_OWORD *)v207;
  if ((v207[23] & 0x80000000) != 0)
  {
    if (*(void *)&__str[8] != 2) {
      goto LABEL_24;
    }
    unsigned int v8 = *(unsigned char **)__str;
  }
  else
  {
    if (v207[23] != 2) {
      goto LABEL_24;
    }
    unsigned int v8 = __str;
  }
  char v9 = 0;
  uint64_t v10 = 0;
  while (1)
  {
    char v11 = v9;
    if ((char)v8[v10] < 0 || (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v8[v10] + 60) & 0x400) == 0) {
      break;
    }
    char v9 = 1;
    uint64_t v10 = 1;
    if (v11)
    {
      char v12 = std::stoul((const std::string *)__str, 0, 10);
      goto LABEL_25;
    }
  }
LABEL_24:
  char v12 = -18;
LABEL_25:
  if ((__str[23] & 0x80000000) != 0) {
    operator delete(*(void **)__str);
  }
  *((unsigned char *)v179 + 176) = v12;
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)&v180);
  int v13 = DERParseSequence((uint64_t)&v195, 3u, (uint64_t)&P73BaseFirmwareDERSpec::UpdatePayloadItemSpec, (unint64_t)v189, 0x30uLL);
  if (v13)
  {
    v156 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(__str, "Failed to parse updatePayload as per UpdatePayloadItemSpec");
    v157 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v156, (long long *)__str, v13, @"libDERErrorDomain");
  }
  int v14 = DERParseSequenceContent(v190, 2u, (uint64_t)&P73BaseFirmwareDERSpec::SignedSectionItemSpec, (unint64_t)v187, 0x20uLL);
  if (v14)
  {
    v158 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(__str, "Failed to parse signedSection as per SignedSectionItemSpec");
    v159 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v158, (long long *)__str, v14, @"libDERErrorDomain");
  }
  int64x2_t v198 = 0uLL;
  v199 = 0;
  int v15 = DERParseSequenceContent(v187, 3u, (uint64_t)&P73BaseFirmwareDERSpec::UpdateTableItemSpec, (unint64_t)__str, 0x30uLL);
  if (v15)
  {
    v160 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(v207, "Cannot parse UpdateTable.");
    v161 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v160, (long long *)v207, v15, @"libDERErrorDomain");
  }
  int v16 = DERParseInteger((char **)&__str[16], &v197);
  if (v16)
  {
    v162 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(v207, "Cannot parse UpdateTable.bsn.");
    v163 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v162, (long long *)v207, v16, @"libDERErrorDomain");
  }
  int v17 = DERDecodeSeqContentInit(&v203, v212);
  if (v17)
  {
    v164 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(v207, "Cannot parse UpdateTable entries");
    v165 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v164, (long long *)v207, v17, @"libDERErrorDomain");
  }
  while (1)
  {
    int v18 = DERDecodeSeqNext(v212, &v210);
    int v19 = v18;
    if (v18) {
      break;
    }
    unsigned int v20 = (char *)v211.i64[0];
    if (v211.i64[0]) {
      BOOL v21 = v211.i64[1] == 0;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21)
    {
      v110 = __cxa_allocate_exception(0x10uLL);
      v111 = (std::string *)std::string::basic_string[abi:ne180100]<0>(&v213, "Assertion: ");
      v112 = std::string::append(v111, "entry.data && entry.length");
      long long v113 = *(_OWORD *)&v112->__r_.__value_.__l.__data_;
      *(void *)&v215[16] = *((void *)&v112->__r_.__value_.__l + 2);
      *(_OWORD *)v215 = v113;
      v112->__r_.__value_.__l.__size_ = 0;
      v112->__r_.__value_.__r.__words[2] = 0;
      v112->__r_.__value_.__r.__words[0] = 0;
      MEMORY[0x22A6B63F0](v110, v215);
    }
    int v22 = 0;
    long long v208 = 0u;
    memset(v207, 0, sizeof(v207));
    do
    {
      if ((unint64_t)v20 >= v211.i64[0] + v211.i64[1]) {
        break;
      }
      int v23 = *v20;
      if (*v20) {
        BOOL v24 = (v23 & 1) == 0;
      }
      else {
        BOOL v24 = 0;
      }
      if (!v24)
      {
        v125 = __cxa_allocate_exception(0x48uLL);
        std::string::basic_string[abi:ne180100]<0>(v215, "Wrong length for updateTableEnry");
        v126 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v125, (long long *)v215, 2, @"SEUpdaterErrorDomain");
      }
      std::string::size_type v25 = 0;
      unint64_t v26 = 0;
      uint64_t v27 = 0;
      ++v20;
      memset(v215, 0, sizeof(v215));
      do
      {
        unsigned int v28 = *(unsigned __int16 *)v20;
        v20 += 2;
        unsigned int v29 = bswap32(v28) >> 16;
        if ((unint64_t)v27 >= v26)
        {
          uint64_t v30 = v27 - v25;
          if (v27 - v25 <= -3) {
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v31 = v30 >> 1;
          if (v26 - (unint64_t)v25 <= (v30 >> 1) + 1) {
            uint64_t v32 = v31 + 1;
          }
          else {
            uint64_t v32 = v26 - (void)v25;
          }
          if (v26 - (unint64_t)v25 >= 0x7FFFFFFFFFFFFFFELL) {
            uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v33 = v32;
          }
          if (v33) {
            uint64_t v33 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v33);
          }
          else {
            uint64_t v34 = 0;
          }
          uint64_t v35 = (char *)(v33 + 2 * v31);
          *(_WORD *)uint64_t v35 = v29;
          std::string::size_type v36 = v35 + 2;
          while (v27 != v25)
          {
            __int16 v37 = *((_WORD *)v27 - 1);
            v27 -= 2;
            *((_WORD *)v35 - 1) = v37;
            v35 -= 2;
          }
          unint64_t v26 = v33 + 2 * v34;
          *(void *)v215 = v35;
          *(void *)&v215[8] = v36;
          *(void *)&v215[16] = v26;
          if (v25) {
            operator delete(v25);
          }
          std::string::size_type v25 = v35;
          uint64_t v27 = v36;
        }
        else
        {
          *(_WORD *)uint64_t v27 = v29;
          v27 += 2;
        }
        *(void *)&v215[8] = v27;
        v23 -= 2;
      }
      while ((_BYTE)v23);
      int v38 = *(void **)&v207[8];
      if (*(void *)&v207[8] >= *(void *)&v207[16])
      {
        uint64_t v39 = std::vector<std::vector<unsigned short>>::__emplace_back_slow_path<std::vector<unsigned short>&>((uint64_t *)v207, (uint64_t)v215);
      }
      else
      {
        **(_OWORD **)&v207[8] = 0uLL;
        v38[2] = 0;
        std::vector<unsigned short>::__init_with_size[abi:ne180100]<unsigned short *,unsigned short *>(v38, *(const void **)v215, (uint64_t)v27, (uint64_t)&v27[-*(void *)v215] >> 1);
        uint64_t v39 = (uint64_t)(v38 + 3);
      }
      *(void *)&v207[8] = v39;
      if (*(void *)v215) {
        operator delete(*(void **)v215);
      }
      ++v22;
    }
    while (v22 != 4);
    int v41 = v20 + 1;
    uint64_t v40 = *v20;
    if (*v20)
    {
      __int16 v42 = 0;
      int v43 = *v20;
      do
      {
        --v43;
        __int16 v44 = *v41++;
        __int16 v42 = v44 | (v42 << 8);
      }
      while ((_BYTE)v43);
      int v45 = (unsigned __int8 *)&v20[(v40 - 1)];
      v20 += v40;
      int v41 = v45 + 2;
    }
    else
    {
      __int16 v42 = 0;
    }
    v46 = operator new(2uLL);
    _WORD *v46 = v42;
    *(void *)&v215[8] = v46 + 1;
    *(void *)&v215[16] = v46 + 1;
    int v47 = *(void **)&v207[8];
    *(void *)v215 = v46;
    if (*(void *)&v207[8] >= *(void *)&v207[16])
    {
      uint64_t v48 = std::vector<std::vector<unsigned short>>::__emplace_back_slow_path<std::vector<unsigned short>&>((uint64_t *)v207, (uint64_t)v215);
    }
    else
    {
      **(_OWORD **)&v207[8] = 0uLL;
      v47[2] = 0;
      std::vector<unsigned short>::__init_with_size[abi:ne180100]<unsigned short *,unsigned short *>(v47, v46, (uint64_t)(v46 + 1), 1);
      uint64_t v48 = (uint64_t)(v47 + 3);
    }
    *(void *)&v207[8] = v48;
    operator delete(v46);
    if (*v41 != 32)
    {
      v133 = __cxa_allocate_exception(0x48uLL);
      std::string::basic_string[abi:ne180100]<0>(v215, "wrong updateTableEnry with wrong hash size");
      v134 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v133, (long long *)v215, 15, @"SEUpdaterErrorDomain");
    }
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(&v207[24], v20 + 2, v20 + 34, 0x20uLL);
    if (*(void *)&v207[8] - *(void *)v207 != 120)
    {
      v131 = __cxa_allocate_exception(0x48uLL);
      std::string::basic_string[abi:ne180100]<0>(v215, "Missing element in updateTableEnry");
      v132 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v131, (long long *)v215, 15, @"SEUpdaterErrorDomain");
    }
    uint64_t v49 = v198.i64[1];
    if (v198.i64[1] >= (unint64_t)v199)
    {
      unint64_t v51 = 0xAAAAAAAAAAAAAAABLL * ((v198.i64[1] - v198.i64[0]) >> 4);
      unint64_t v52 = v51 + 1;
      if (v51 + 1 > 0x555555555555555) {
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * ((uint64_t)&v199[-v198.i64[0]] >> 4) > v52) {
        unint64_t v52 = 0x5555555555555556 * ((uint64_t)&v199[-v198.i64[0]] >> 4);
      }
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v199[-v198.i64[0]] >> 4) >= 0x2AAAAAAAAAAAAAALL) {
        unint64_t v53 = 0x555555555555555;
      }
      else {
        unint64_t v53 = v52;
      }
      v217 = &v199;
      if (v53)
      {
        if (v53 > 0x555555555555555) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        uint64_t v54 = (char *)operator new(48 * v53);
      }
      else
      {
        uint64_t v54 = 0;
      }
      *(void *)v215 = v54;
      *(void *)&v215[8] = &v54[48 * v51];
      *(void *)&v215[16] = *(void *)&v215[8];
      v216 = &v54[48 * v53];
      std::allocator<SERestoreInfo::UpdateTableEntry>::construct[abi:ne180100]<SERestoreInfo::UpdateTableEntry,SERestoreInfo::UpdateTableEntry&>(*(void **)&v215[8], (uint64_t *)v207);
      uint64_t v55 = *(void *)&v215[8];
      uint64_t v50 = *(void *)&v215[16] + 48;
      *(void *)&v215[16] += 48;
      int64x2_t v56 = v198;
      if (v198.i64[1] == v198.i64[0])
      {
        int64x2_t v60 = vdupq_n_s64(v198.u64[1]);
      }
      else
      {
        uint64_t v57 = 0;
        do
        {
          uint64_t v58 = v55 + v57;
          uint64_t v59 = v56.i64[1] + v57;
          *(void *)(v58 - 48) = 0;
          *(void *)(v58 - 40) = 0;
          *(void *)(v58 - 32) = 0;
          *(_OWORD *)(v58 - 48) = *(_OWORD *)(v56.i64[1] + v57 - 48);
          *(void *)(v58 - 32) = *(void *)(v56.i64[1] + v57 - 32);
          *(void *)(v59 - 48) = 0;
          *(void *)(v59 - 40) = 0;
          *(void *)(v59 - 32) = 0;
          *(void *)(v58 - 24) = 0;
          *(void *)(v58 - 16) = 0;
          *(void *)(v58 - 8) = 0;
          *(_OWORD *)(v58 - 24) = *(_OWORD *)(v56.i64[1] + v57 - 24);
          *(void *)(v58 - 8) = *(void *)(v56.i64[1] + v57 - 8);
          *(void *)(v59 - 24) = 0;
          *(void *)(v59 - 16) = 0;
          *(void *)(v59 - 8) = 0;
          v57 -= 48;
        }
        while (v56.i64[1] + v57 != v56.i64[0]);
        int64x2_t v60 = v198;
        uint64_t v50 = *(void *)&v215[16];
        v55 += v57;
      }
      v198.i64[0] = v55;
      v198.i64[1] = v50;
      *(int64x2_t *)&v215[8] = v60;
      std::string::size_type v61 = v199;
      v199 = v216;
      v216 = v61;
      *(void *)v215 = v60.i64[0];
      std::__split_buffer<SERestoreInfo::UpdateTableEntry>::~__split_buffer((uint64_t)v215);
    }
    else
    {
      std::allocator<SERestoreInfo::UpdateTableEntry>::construct[abi:ne180100]<SERestoreInfo::UpdateTableEntry,SERestoreInfo::UpdateTableEntry&>((void *)v198.i64[1], (uint64_t *)v207);
      uint64_t v50 = v49 + 48;
    }
    v198.i64[1] = v50;
    if (*(void *)&v207[24])
    {
      *(void *)&long long v208 = *(void *)&v207[24];
      operator delete(*(void **)&v207[24]);
    }
    *(void *)v215 = v207;
    std::vector<std::vector<unsigned short>>::__destroy_vector::operator()[abi:ne180100]((void ***)v215);
  }
  if (v18 != 1)
  {
    v129 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(v207, "Wrong UpdateTable entries");
    v130 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v129, (long long *)v207, v19, @"libDERErrorDomain");
  }
  uint64_t v63 = v198.i64[1];
  uint64_t v62 = v198.i64[0];
  if (v198.i64[0] == v198.i64[1])
  {
    v166 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(v207, "Size of UpdateTable.entries is zero");
    v167 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v166, (long long *)v207, 15, @"SEUpdaterErrorDomain");
  }
  std::string::size_type v64 = v179;
  *((_DWORD *)v179 + 36) = v197;
  uint64_t v65 = v179[19];
  if (v65)
  {
    uint64_t v66 = v179[20];
    char v67 = (void *)v179[19];
    if (v66 != v65)
    {
      do
      {
        v66 -= 48;
        std::allocator<SERestoreInfo::UpdateTableEntry>::destroy[abi:ne180100](v66);
      }
      while (v66 != v65);
      char v67 = *(void **)v177;
    }
    std::string::size_type v64 = v179;
    v179[20] = v65;
    operator delete(v67);
    *(void *)v177 = 0;
    *((void *)v177 + 1) = 0;
    *((void *)v177 + 2) = 0;
    uint64_t v63 = v198.i64[1];
    uint64_t v62 = v198.i64[0];
  }
  v64[19] = v62;
  v64[20] = v63;
  v64[21] = v199;
  v199 = 0;
  int64x2_t v198 = 0uLL;
  *(void *)__str = &v198;
  std::vector<SERestoreInfo::UpdateTableEntry>::__destroy_vector::operator()[abi:ne180100]((void ***)__str);
  if (!v196[0] || !v196[1])
  {
    v122 = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(v207, "Assertion: ");
    v123 = std::string::append((std::string *)v207, "binaryItem.data && binaryItem.length");
    long long v124 = *(_OWORD *)&v123->__r_.__value_.__l.__data_;
    *(void *)&__str[16] = *((void *)&v123->__r_.__value_.__l + 2);
    *(_OWORD *)__str = v124;
    v123->__r_.__value_.__l.__size_ = 0;
    v123->__r_.__value_.__r.__words[2] = 0;
    v123->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](v122, __str);
  }
  int v68 = DERDecodeSeqContentInit(v196, v212);
  if (v68)
  {
    v168 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(__str, "Cannot init sequence for DeliveryObject.binaries");
    v169 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v168, (long long *)__str, v68, @"libDERErrorDomain");
  }
  while (1)
  {
    int v69 = DERDecodeSeqNext(v212, &v213);
    int v70 = v69;
    if (v69) {
      break;
    }
    *(_DWORD *)__str = 0;
    *(void *)&__str[8] = &unk_26DD73970;
    unint64_t v203 = 0;
    int v204 = 0;
    v206[0] = 0;
    long long v205 = 0uLL;
    unsigned int v201 = 0;
    int v71 = DERParseSequenceContent(&v214, 4u, (uint64_t)&P73BaseFirmwareDERSpec::ImageBinaryItemSpec, (unint64_t)v207, 0x40uLL);
    if (v71)
    {
      v135 = __cxa_allocate_exception(0x48uLL);
      std::string::basic_string[abi:ne180100]<0>(v215, "Cannot parse ImageBinary.");
      v136 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v135, (long long *)v215, v71, @"libDERErrorDomain");
    }
    int v72 = DERParseInteger((char **)v207, &v201);
    if (v72 || v201 >= 5)
    {
      v127 = __cxa_allocate_exception(0x48uLL);
      std::string::basic_string[abi:ne180100]<0>(v215, "ImageBinary.type is out of range.");
      v128 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v127, (long long *)v215, v72, @"libDERErrorDomain");
    }
    *(_DWORD *)__str = v201;
    *(void *)v215 = &unk_26DD73970;
    *(_OWORD *)&v215[8] = *(_OWORD *)&v207[16];
    v216 = 0;
    SERestoreInfo::BLOB::operator=(&__str[8], v215);
    SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)v215);
    int v73 = DERParseInteger((char **)&v208, &v204);
    if (v73)
    {
      v137 = __cxa_allocate_exception(0x48uLL);
      std::string::basic_string[abi:ne180100]<0>(v215, "Cannot parse ImageBinary.index.");
      v138 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v137, (long long *)v215, v73, @"libDERErrorDomain");
    }
    int v74 = DERDecodeSeqContentInit(&v209, v200);
    if (v74)
    {
      v139 = __cxa_allocate_exception(0x48uLL);
      std::string::basic_string[abi:ne180100]<0>(v215, "Cannot init sequence for ImageBinary.apdus");
      v140 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v139, (long long *)v215, v74, @"libDERErrorDomain");
    }
    while (1)
    {
      int v75 = DERDecodeSeqNext(v200, &v210);
      int v76 = v75;
      if (v75) {
        break;
      }
      v197 = &unk_26DD73970;
      int64x2_t v198 = v211;
      v199 = 0;
      uint64_t v77 = *((void *)&v205 + 1);
      if (*((void *)&v205 + 1) >= v206[0])
      {
        uint64_t v80 = *((void *)&v205 + 1) - v205;
        uint64_t v81 = (uint64_t)(*((void *)&v205 + 1) - v205) >> 5;
        unint64_t v82 = v81 + 1;
        if ((unint64_t)(v81 + 1) >> 59) {
          std::vector<std::string>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v83 = v206[0] - v205;
        if ((uint64_t)(v206[0] - v205) >> 4 > v82) {
          unint64_t v82 = v83 >> 4;
        }
        if ((unint64_t)v83 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v84 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v84 = v82;
        }
        v217 = (char **)v206;
        if (v84) {
          v85 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SERestoreInfo::BLOB>>((uint64_t)v206, v84);
        }
        else {
          v85 = 0;
        }
        v86 = &v85[32 * v81];
        *(void *)v86 = &unk_26DD73970;
        int64x2_t v87 = v198;
        *((void *)v86 + 3) = v199;
        *(int64x2_t *)(v86 + 8) = v87;
        uint64_t v89 = *((void *)&v205 + 1);
        uint64_t v88 = v205;
        if (*((void *)&v205 + 1) == (void)v205)
        {
          int64x2_t v93 = vdupq_n_s64(*((unint64_t *)&v205 + 1));
          v91 = &v85[32 * v81];
        }
        else
        {
          uint64_t v90 = (uint64_t)&v85[v80 - 32];
          v91 = &v85[32 * v81];
          do
          {
            *((void *)v91 - 4) = &unk_26DD73970;
            v91 -= 32;
            long long v92 = *(_OWORD *)(v89 - 24);
            *((void *)v91 + 3) = *(void *)(v89 - 8);
            *(_OWORD *)(v91 + 8) = v92;
            v90 -= 32;
            v89 -= 32;
          }
          while (v89 != v88);
          int64x2_t v93 = (int64x2_t)v205;
        }
        v79 = v86 + 32;
        *(void *)&long long v205 = v91;
        *((void *)&v205 + 1) = v86 + 32;
        *(int64x2_t *)&v215[8] = v93;
        v94 = (char *)v206[0];
        v206[0] = &v85[32 * v84];
        v216 = v94;
        *(void *)v215 = v93.i64[0];
        std::__split_buffer<SERestoreInfo::BLOB>::~__split_buffer((uint64_t)v215);
      }
      else
      {
        **((void **)&v205 + 1) = &unk_26DD73970;
        int64x2_t v78 = v198;
        *(void *)(v77 + 24) = v199;
        *(int64x2_t *)(v77 + 8) = v78;
        v79 = (char *)(v77 + 32);
      }
      *((void *)&v205 + 1) = v79;
      SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)&v197);
    }
    if (v75 != 1)
    {
      v117 = __cxa_allocate_exception(0x48uLL);
      std::string::basic_string[abi:ne180100]<0>(v215, "Cannot parse ImageBinary.apdus");
      v118 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v117, (long long *)v215, v76, @"libDERErrorDomain");
    }
    int v95 = v204;
    v96 = operator new(0x70uLL);
    v96[11] = 0;
    *((_WORD *)v96 + 16) = v95;
    *((_DWORD *)v96 + 10) = *(_DWORD *)__str;
    v96[6] = &unk_26DD73970;
    *(_OWORD *)(v96 + 7) = *(_OWORD *)&__str[16];
    v96[9] = v203;
    *((_DWORD *)v96 + 20) = v95;
    v96[12] = 0;
    v96[13] = 0;
    std::vector<SERestoreInfo::BLOB>::__init_with_size[abi:ne180100]<SERestoreInfo::BLOB*,SERestoreInfo::BLOB*>((char *)v96 + 88, v205, *((uint64_t *)&v205 + 1), (uint64_t)(*((void *)&v205 + 1) - v205) >> 5);
    v97 = v178;
    v98 = (uint64_t *)*v178;
    v99 = v178;
    if (*v178)
    {
      unsigned int v100 = *((unsigned __int16 *)v96 + 16);
      while (1)
      {
        while (1)
        {
          v97 = v98;
          unsigned int v101 = *((unsigned __int16 *)v98 + 16);
          if (v100 >= v101) {
            break;
          }
          v98 = (uint64_t *)*v98;
          v99 = v97;
          if (!*v97) {
            goto LABEL_145;
          }
        }
        if (v101 >= v100) {
          break;
        }
        v98 = (uint64_t *)v98[1];
        if (!v98)
        {
          v99 = v97 + 1;
          goto LABEL_145;
        }
      }
      *(void *)v215 = v96 + 11;
      std::vector<SERestoreInfo::BLOB>::__destroy_vector::operator()[abi:ne180100]((void ***)v215);
      SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)(v96 + 6));
      operator delete(v96);
    }
    else
    {
LABEL_145:
      void *v96 = 0;
      v96[1] = 0;
      v96[2] = v97;
      void *v99 = v96;
      uint64_t v102 = *(void *)v179[4];
      if (v102)
      {
        v179[4] = v102;
        v96 = (void *)*v99;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v179[5], v96);
      ++v179[6];
    }
    *(void *)v215 = &v205;
    std::vector<SERestoreInfo::BLOB>::__destroy_vector::operator()[abi:ne180100]((void ***)v215);
    SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)&__str[8]);
  }
  if (v69 != 1)
  {
    v141 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(__str, "Cannot parse DeliveryObject.binaries");
    v142 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v141, (long long *)__str, v70, @"libDERErrorDomain");
  }
  *(void *)__str = &unk_26DD73970;
  *(_OWORD *)&__str[8] = v195;
  *(void *)&__str[24] = 0;
  SERestoreInfo::BLOB::operator=(v175, __str);
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)__str);
  *((_DWORD *)v179 + 45) = 0;
  *((_DWORD *)v179 + 46) = 0;
  uint64_t result = (uint64_t)DERParseSequenceContent(&v188, 2u, (uint64_t)&P73BaseFirmwareDERSpec::UpdatePropertiesItemSpec, (unint64_t)v185, 0x20uLL);
  int v104 = result;
  if (result)
  {
    if (result != 5)
    {
      v170 = __cxa_allocate_exception(0x48uLL);
      std::string::basic_string[abi:ne180100]<0>(__str, "Failed to parse updateProperties as per UpdatePropertiesItemSpec.");
      v171 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v170, (long long *)__str, v104, @"libDERErrorDomain");
    }
  }
  else
  {
    v197 = 0;
    int v105 = DERDecodeSeqInit((uint64_t)&v186, &v197, v215);
    if (v105)
    {
      v172 = __cxa_allocate_exception(0x48uLL);
      std::string::basic_string[abi:ne180100]<0>(__str, "Cannot parse properties entries");
      v173 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v172, (long long *)__str, v105, @"libDERErrorDomain");
    }
    while (1)
    {
      uint64_t result = DERDecodeSeqNext((unint64_t *)v215, (unint64_t *)__str);
      if (result) {
        break;
      }
      int v106 = DERDecodeItem((uint64_t)&__str[8], (unint64_t *)__str);
      if (v106)
      {
        v143 = __cxa_allocate_exception(0x48uLL);
        std::string::basic_string[abi:ne180100]<0>(v207, "Cannot parse property");
        v144 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v143, (long long *)v207, v106, @"libDERErrorDomain");
      }
      int v107 = DERParseSequenceContent((unint64_t *)&__str[8], 2u, (uint64_t)&P73BaseFirmwareDERSpec::PropertyItemSpec, (unint64_t)v183, 0x20uLL);
      if (v107)
      {
        v145 = __cxa_allocate_exception(0x48uLL);
        std::string::basic_string[abi:ne180100]<0>(v207, "Failed to parse as per PropertyItemSpec");
        v146 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v145, (long long *)v207, v107, @"libDERErrorDomain");
      }
      if (v183[1] == 4)
      {
        if (*(_DWORD *)v183[0] == 1768121715)
        {
          LODWORD(v213) = 0;
          int v109 = DERParseInteger(v184, &v213);
          if (v109)
          {
            v147 = __cxa_allocate_exception(0x48uLL);
            std::string::basic_string[abi:ne180100]<0>(v207, "Failed to parse 'seci' value");
            v148 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v147, (long long *)v207, v109, @"libDERErrorDomain");
          }
          *((_DWORD *)v179 + 45) = v213;
        }
        else if (*(_DWORD *)v183[0] == 1986553203)
        {
          LODWORD(v213) = 0;
          int v108 = DERParseInteger(v184, &v213);
          if (v108)
          {
            v149 = __cxa_allocate_exception(0x48uLL);
            std::string::basic_string[abi:ne180100]<0>(v207, "Failed to parse 'sehv' value");
            v150 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v149, (long long *)v207, v108, @"libDERErrorDomain");
          }
          *((_DWORD *)v179 + 46) = v213;
        }
      }
    }
  }
  *a2 = v174;
  a2[1] = v179;
  return result;
}

void sub_229333E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, std::__shared_weak_count *a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,void *a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,void *__p,uint64_t a62,int a63)
{
  if (a66 < 0) {
    operator delete(__p);
  }
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)&a21);
  std::__shared_weak_count::__release_shared[abi:ne180100](a19);
  _Unwind_Resume(a1);
}

void SERestoreInfo::P73BaseFirmware::~P73BaseFirmware(SERestoreInfo::P73BaseFirmware *this)
{
  SERestoreInfo::SEFirmwareBase::~SEFirmwareBase(this);

  JUMPOUT(0x22A6B67D0);
}

void SERestoreInfo::P73BaseDeliveryObject::~P73BaseDeliveryObject(SERestoreInfo::P73BaseDeliveryObject *this)
{
  *(void *)this = &unk_26DD73A60;
  BOOL v3 = (void **)((char *)this + 128);
  std::vector<SERestoreInfo::UpdateTableEntry>::__destroy_vector::operator()[abi:ne180100](&v3);
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::P73BaseDeliveryObject *)((char *)this + 88));
  uint64_t v2 = (void *)*((void *)this + 8);
  if (v2)
  {
    *((void *)this + 9) = v2;
    operator delete(v2);
  }
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::P73BaseDeliveryObject *)((char *)this + 32));
  std::__tree<std::__value_type<unsigned short,SERestoreInfo::ImageBinary>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SERestoreInfo::ImageBinary>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SERestoreInfo::ImageBinary>>>::destroy(*((char **)this + 2));
}

{
  void *v2;
  void **v3;
  uint64_t vars8;

  *(void *)this = &unk_26DD73A60;
  BOOL v3 = (void **)((char *)this + 128);
  std::vector<SERestoreInfo::UpdateTableEntry>::__destroy_vector::operator()[abi:ne180100](&v3);
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::P73BaseDeliveryObject *)((char *)this + 88));
  uint64_t v2 = (void *)*((void *)this + 8);
  if (v2)
  {
    *((void *)this + 9) = v2;
    operator delete(v2);
  }
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::P73BaseDeliveryObject *)((char *)this + 32));
  std::__tree<std::__value_type<unsigned short,SERestoreInfo::ImageBinary>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SERestoreInfo::ImageBinary>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SERestoreInfo::ImageBinary>>>::destroy(*((char **)this + 2));

  JUMPOUT(0x22A6B67D0);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(uint64_t a1)
{
  if (a1 < 0) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(2 * a1);
}

uint64_t std::vector<std::vector<unsigned short>>::__emplace_back_slow_path<std::vector<unsigned short>&>(uint64_t *a1, uint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v3 = v2 + 1;
  if (v2 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  int v6 = a1 + 2;
  if (0x5555555555555556 * ((a1[2] - *a1) >> 3) > v3) {
    unint64_t v3 = 0x5555555555555556 * ((a1[2] - *a1) >> 3);
  }
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - *a1) >> 3) >= 0x555555555555555) {
    unint64_t v7 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v7 = v3;
  }
  BOOL v21 = v6;
  if (v7) {
    unint64_t v7 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<unsigned short>>>(v7);
  }
  else {
    uint64_t v8 = 0;
  }
  char v9 = (void *)(v7 + 24 * v2);
  unint64_t v18 = v7;
  v19.i64[0] = (uint64_t)v9;
  v19.i64[1] = (uint64_t)v9;
  unint64_t v20 = v7 + 24 * v8;
  *char v9 = 0;
  v9[1] = 0;
  v9[2] = 0;
  std::vector<unsigned short>::__init_with_size[abi:ne180100]<unsigned short *,unsigned short *>(v9, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 1);
  uint64_t v10 = v19.i64[0];
  uint64_t v11 = v19.i64[1] + 24;
  v19.i64[1] += 24;
  int v13 = (void *)*a1;
  char v12 = (void *)a1[1];
  if (v12 == (void *)*a1)
  {
    int64x2_t v15 = vdupq_n_s64((unint64_t)v12);
  }
  else
  {
    do
    {
      *(void *)(v10 - 24) = 0;
      *(void *)(v10 - 16) = 0;
      v10 -= 24;
      *(void *)(v10 + 16) = 0;
      long long v14 = *(_OWORD *)(v12 - 3);
      v12 -= 3;
      *(_OWORD *)uint64_t v10 = v14;
      *(void *)(v10 + 16) = v12[2];
      *char v12 = 0;
      v12[1] = 0;
      _DWORD v12[2] = 0;
    }
    while (v12 != v13);
    int64x2_t v15 = *(int64x2_t *)a1;
    uint64_t v11 = v19.i64[1];
  }
  *a1 = v10;
  a1[1] = v11;
  int64x2_t v19 = v15;
  unint64_t v16 = a1[2];
  a1[2] = v20;
  unint64_t v20 = v16;
  unint64_t v18 = v15.i64[0];
  std::__split_buffer<std::vector<unsigned short>>::~__split_buffer((uint64_t)&v18);
  return v11;
}

void sub_229334564(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::vector<unsigned short>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<unsigned short>>>(unint64_t a1)
{
  if (a1 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a1);
}

uint64_t std::__split_buffer<std::vector<unsigned short>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != v3)
  {
    unsigned int v4 = *(void **)(v2 - 24);
    *(void *)(a1 + 16) = v2 - 24;
    if (v4)
    {
      *(void *)(v2 - 16) = v4;
      operator delete(v4);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::vector<std::vector<unsigned short>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    unsigned int v4 = (char *)v1[1];
    unsigned int v5 = **a1;
    if (v4 != v2)
    {
      int v6 = (char *)v1[1];
      do
      {
        uint64_t v8 = (void *)*((void *)v6 - 3);
        v6 -= 24;
        unint64_t v7 = v8;
        if (v8)
        {
          *((void *)v4 - 2) = v7;
          operator delete(v7);
        }
        unsigned int v4 = v6;
      }
      while (v6 != v2);
      unsigned int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::allocator<SERestoreInfo::UpdateTableEntry>::destroy[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(void *)(a1 + 32) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void **)a1;
  std::vector<std::vector<unsigned short>>::__destroy_vector::operator()[abi:ne180100](&v3);
}

void SERestoreInfo::ImageBinary::~ImageBinary(SERestoreInfo::ImageBinary *this)
{
  uint64_t v2 = (void **)((char *)this + 48);
  std::vector<SERestoreInfo::BLOB>::__destroy_vector::operator()[abi:ne180100](&v2);
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::ImageBinary *)((char *)this + 8));
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<SERestoreInfo::BLOB>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a2);
}

uint64_t std::__split_buffer<SERestoreInfo::BLOB>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    unsigned int v4 = *(void (***)(void))(i - 32);
    *(void *)(a1 + 16) = i - 32;
    (*v4)();
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

char *std::vector<SERestoreInfo::BLOB>::__init_with_size[abi:ne180100]<SERestoreInfo::BLOB*,SERestoreInfo::BLOB*>(char *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    int v6 = result;
    uint64_t result = std::vector<SERestoreInfo::BLOB>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = *((void *)v6 + 1);
    if (a2 != a3)
    {
      uint64_t v8 = *((void *)v6 + 1);
      do
      {
        *(void *)uint64_t v7 = &unk_26DD73970;
        long long v9 = *(_OWORD *)(a2 + 8);
        *(void *)(v7 + 24) = *(void *)(a2 + 24);
        *(_OWORD *)(v7 + 8) = v9;
        a2 += 32;
        v7 += 32;
        v8 += 32;
      }
      while (a2 != a3);
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_229334880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

char *std::vector<SERestoreInfo::BLOB>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SERestoreInfo::BLOB>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

void std::__tree<std::__value_type<unsigned short,SERestoreInfo::ImageBinary>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SERestoreInfo::ImageBinary>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SERestoreInfo::ImageBinary>>>::destroy(char *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<unsigned short,SERestoreInfo::ImageBinary>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SERestoreInfo::ImageBinary>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SERestoreInfo::ImageBinary>>>::destroy(*(void *)a1);
    std::__tree<std::__value_type<unsigned short,SERestoreInfo::ImageBinary>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SERestoreInfo::ImageBinary>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SERestoreInfo::ImageBinary>>>::destroy(*((void *)a1 + 1));
    uint64_t v2 = (void **)(a1 + 88);
    std::vector<SERestoreInfo::BLOB>::__destroy_vector::operator()[abi:ne180100](&v2);
    SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)(a1 + 48));
    operator delete(a1);
  }
}

void std::vector<SERestoreInfo::UpdateTableEntry>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unsigned int v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48;
        std::allocator<SERestoreInfo::UpdateTableEntry>::destroy[abi:ne180100](v4);
      }
      while ((void *)v4 != v2);
      unsigned int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *std::allocator<SERestoreInfo::UpdateTableEntry>::construct[abi:ne180100]<SERestoreInfo::UpdateTableEntry,SERestoreInfo::UpdateTableEntry&>(void *a1, uint64_t *a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  if (v5 != *a2)
  {
    unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a2) >> 3);
    if (v6 >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v7 = std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<unsigned short>>>(v6);
    *a1 = v7;
    a1[1] = v7;
    a1[2] = &v7[3 * v8];
    int v13 = v7;
    long long v14 = v7;
    v11[0] = a1 + 2;
    v11[1] = &v13;
    uint64_t v11[2] = &v14;
    char v12 = 0;
    long long v9 = v7;
    do
    {
      *long long v9 = 0;
      v9[1] = 0;
      v9[2] = 0;
      std::vector<unsigned short>::__init_with_size[abi:ne180100]<unsigned short *,unsigned short *>(v9, *(const void **)v4, *(void *)(v4 + 8), (uint64_t)(*(void *)(v4 + 8) - *(void *)v4) >> 1);
      long long v9 = v14 + 3;
      v14 += 3;
      v4 += 24;
    }
    while (v4 != v5);
    char v12 = 1;
    std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<unsigned short>>,std::vector<unsigned short>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
    a1[1] = v9;
  }
  a1[3] = 0;
  a1[4] = 0;
  a1[5] = 0;
  return std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a1 + 3, (const void *)a2[3], a2[4], a2[4] - a2[3]);
}

void sub_229334AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::vector<std::vector<unsigned short>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<unsigned short>>,std::vector<unsigned short>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v2 = **(void **)(a1 + 8);
    uint64_t v3 = **(void **)(a1 + 16);
    if (v3 != v2)
    {
      uint64_t v4 = **(void **)(a1 + 16);
      do
      {
        unint64_t v6 = *(void **)(v4 - 24);
        v4 -= 24;
        uint64_t v5 = v6;
        if (v6)
        {
          *(void *)(v3 - 16) = v5;
          operator delete(v5);
        }
        uint64_t v3 = v4;
      }
      while (v4 != v2);
    }
  }
  return a1;
}

uint64_t std::__split_buffer<SERestoreInfo::UpdateTableEntry>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 48;
    std::allocator<SERestoreInfo::UpdateTableEntry>::destroy[abi:ne180100](i - 48);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void *std::string::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(void *result, char *a2, char *a3, unint64_t a4)
{
  uint64_t v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a4 > 0x16)
  {
    uint64_t v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17) {
      uint64_t v8 = a4 | 7;
    }
    uint64_t v9 = v8 + 1;
    uint64_t result = operator new(v8 + 1);
    v4[1] = a4;
    unint64_t v4[2] = v9 | 0x8000000000000000;
    *uint64_t v4 = result;
    uint64_t v4 = result;
  }
  else
  {
    *((unsigned char *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    char v10 = *a2++;
    *(unsigned char *)uint64_t v4 = v10;
    uint64_t v4 = (void *)((char *)v4 + 1);
  }
  *(unsigned char *)uint64_t v4 = 0;
  return result;
}

void std::vector<std::vector<unsigned short>>::__throw_out_of_range[abi:ne180100]()
{
}

void *std::vector<unsigned short>::__init_with_size[abi:ne180100]<unsigned short *,unsigned short *>(void *result, const void *a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    uint64_t v4 = result;
    if (a4 < 0) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    uint64_t result = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(a4);
    uint64_t v7 = result;
    *uint64_t v4 = result;
    v4[1] = result;
    unint64_t v4[2] = (char *)result + 2 * v8;
    size_t v9 = a3 - (void)a2;
    if (v9) {
      uint64_t result = memmove(result, a2, v9);
    }
    v4[1] = (char *)v7 + v9;
  }
  return result;
}

void sub_229334D00(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *_ZNSt3__115allocate_sharedB8ne180100IN13SERestoreInfo17P73BaseDeviceInfoENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_@<X0>(void *a1@<X8>)
{
  uint64_t v2 = operator new(0xD8uLL);
  uint64_t result = _ZNSt3__120__shared_ptr_emplaceIN13SERestoreInfo17P73BaseDeviceInfoENS_9allocatorIS2_EEEC2B8ne180100IJES4_Li0EEES4_DpOT_(v2);
  *a1 = v2 + 3;
  a1[1] = v2;
  return result;
}

void sub_229334D54(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *_ZNSt3__120__shared_ptr_emplaceIN13SERestoreInfo17P73BaseDeviceInfoENS_9allocatorIS2_EEEC2B8ne180100IJES4_Li0EEES4_DpOT_(void *a1)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26DD73AB8;
  SERestoreInfo::P73BaseDeviceInfo::P73BaseDeviceInfo((SERestoreInfo::P73BaseDeviceInfo *)(a1 + 3));
  return a1;
}

void sub_229334DB0(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<SERestoreInfo::P73BaseDeviceInfo>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD73AB8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SERestoreInfo::P73BaseDeviceInfo>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD73AB8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__shared_ptr_emplace<SERestoreInfo::P73BaseDeviceInfo>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::vector<std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        unint64_t v6 = (std::__shared_weak_count *)*((void *)v4 - 1);
        if (v6) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v6);
        }
        v4 -= 16;
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__tree<std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>>>::destroy(*a1);
    std::__tree<std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>>>::destroy(a1[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::vector<unsigned char> const,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>,0>((uint64_t)(a1 + 4));
    operator delete(a1);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::vector<unsigned char> const,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>,0>(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 32);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v3;
    operator delete(v3);
  }
}

void *std::__tree<std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>>>::__find_equal<std::vector<unsigned char>>(uint64_t a1, void *a2, unsigned __int8 *a3, unsigned __int8 *a4)
{
  unint64_t v6 = *(void **)(a1 + 8);
  uint64_t result = (void *)(a1 + 8);
  uint64_t v5 = v6;
  if (v6)
  {
    do
    {
      while (1)
      {
        uint64_t v7 = v5;
        uint64_t v8 = (unsigned __int8 *)v5[4];
        size_t v9 = (unsigned __int8 *)v7[5];
        if (v8 != v9) {
          break;
        }
LABEL_11:
        if (a3 != a4)
        {
          int64x2_t v15 = a3 + 1;
          while (v8 != v9)
          {
            unsigned int v16 = *v8;
            unsigned int v17 = *(v15 - 1);
            if (v16 < v17) {
              break;
            }
            ++v8;
            if (v17 < v16 || v15++ == a4) {
              goto LABEL_26;
            }
          }
          uint64_t result = v7 + 1;
          uint64_t v5 = (void *)v7[1];
          if (v5) {
            continue;
          }
        }
        goto LABEL_26;
      }
      char v10 = v8 + 1;
      uint64_t v11 = a3;
      while (v11 != a4)
      {
        unsigned int v12 = *v11;
        unsigned int v13 = *(v10 - 1);
        if (v12 < v13) {
          break;
        }
        ++v11;
        if (v13 < v12 || v10++ == v9) {
          goto LABEL_11;
        }
      }
      uint64_t v5 = (void *)*v7;
      uint64_t result = v7;
    }
    while (*v7);
  }
  else
  {
    uint64_t v7 = result;
  }
LABEL_26:
  *a2 = v7;
  return result;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::vector<unsigned char>,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(void *)a1 = 0;
  if (v1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::vector<unsigned char> const,std::shared_ptr<SERestoreInfo::P73BaseDeliveryObject const>>,0>((uint64_t)v1 + 32);
    }
    operator delete(v1);
  }
}

void std::__shared_ptr_emplace<SERestoreInfo::P73BaseDeliveryObject>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD73B08;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SERestoreInfo::P73BaseDeliveryObject>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD73B08;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__shared_ptr_emplace<SERestoreInfo::P73BaseDeliveryObject>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

uint64_t SEUpdaterUtil::SE310SImage4Signer::getSigningAlgorithm(SEUpdaterUtil::SE310SImage4Signer *this)
{
  return 1;
}

void *SEUpdaterUtil::SE310SImage4Signer::getSigningKey@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(a1, &SEUpdaterUtil::SE310SImage4Signer::getSigningKey(void)const::signingKey, (uint64_t)&SEUpdaterUtil::SE310SImage4Signer::getSigningCert(void)const::signingCert, 0xA7uLL);
}

void *SEUpdaterUtil::SE310SImage4Signer::getSigningCert@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(a1, &SEUpdaterUtil::SE310SImage4Signer::getSigningCert(void)const::signingCert, (uint64_t)"N13SEUpdaterUtil18SE310SImage4SignerE", 0x2E0uLL);
}

void SEUpdaterUtil::SE310SImage4Signer::~SE310SImage4Signer(const void **this)
{
  *this = &unk_26DD752F8;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(this + 1);
}

{
  uint64_t vars8;

  *this = &unk_26DD752F8;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(this + 1);

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::P73BaseSEController::~P73BaseSEController(const void **this)
{
  *this = &unk_26DD73BB8;
  uint64_t v2 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  uint64_t v3 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v2);
  }
  uint64_t v4 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  SEUpdaterUtil::SELogObj::printLog(v3, (SEUpdaterUtil::SELogObj *)2, 0, 1, "~P73BaseSEController", (SEUpdaterUtil::SELogObj *)"Destroy BaseSEController\n");
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  SEUpdater::SEControllerBase::shutdown(this);
  SEUpdater::SEControllerBase::~SEControllerBase(this);
}

{
  uint64_t vars8;

  SEUpdater::P73BaseSEController::~P73BaseSEController(this);

  JUMPOUT(0x22A6B67D0);
}

void sub_229335354(void *a1)
{
}

uint64_t SEUpdater::P73BaseSEController::initDevice(SEUpdater::P73BaseSEController *this)
{
  if (*((void *)this + 1))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    uint64_t v5 = (std::string *)std::string::basic_string[abi:ne180100]<0>(&v19, "Assertion: ");
    unint64_t v6 = std::string::append(v5, "fSeHandle == nullptr");
    long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
    *(void *)&long long v11 = *((void *)&v6->__r_.__value_.__l + 2);
    long long v10 = v7;
    v6->__r_.__value_.__l.__size_ = 0;
    v6->__r_.__value_.__r.__words[2] = 0;
    v6->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, &v10);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  uint64_t v2 = NfRestoreOpenWithSE();
  *((void *)this + 1) = v2;
  if (!v2)
  {
    uint64_t v8 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(&v19, "Fail to enumerate");
    size_t v9 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v8, &v19, 17, @"SEUpdaterErrorDomain");
  }
  return 1;
}

void sub_229335500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v16 - 33) < 0)
  {
    operator delete(*(void **)(v16 - 56));
    if ((v15 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v15)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v14);
  goto LABEL_8;
}

uint64_t SEUpdater::P73BaseSEController::reboot(SEUpdater::P73BaseSEController *this)
{
  uint64_t v2 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  uint64_t v3 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v2);
  }
  uint64_t v4 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  SEUpdaterUtil::SELogObj::printLog(v3, (SEUpdaterUtil::SELogObj *)2, 0, 1, "reboot", (SEUpdaterUtil::SELogObj *)"rebooting\n");
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  if (!*((void *)this + 1))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v15, "Assertion: ");
    size_t v9 = std::string::append(&v15, "fSeHandle");
    long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    std::string::size_type v17 = v9->__r_.__value_.__r.__words[2];
    long long v16 = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, &v16);
  }
  uint64_t v5 = NfRestoreToggleSEPower();
  std::string::basic_string[abi:ne180100]<0>(__p, "Failed to toggle SE power off");
  SERestoreInfo::CallAndThrow<NfResult>(v5, (uint64_t)__p);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v6 = NfRestoreToggleSEPower();
  std::string::basic_string[abi:ne180100]<0>(v11, "Failed to toggle SE power on");
  SERestoreInfo::CallAndThrow<NfResult>(v6, (uint64_t)v11);
  if (v12 < 0) {
    operator delete(v11[0]);
  }
  return 1;
}

void sub_229335740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
}

uint64_t SERestoreInfo::CallAndThrow<NfResult>(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v2 = result;
    exception = __cxa_allocate_exception(0x48uLL);
    uint64_t v5 = (void *)SERestoreInfo::SEException::SEException(exception, a2, v2, @"libNfRestoreErrorDomain");
  }
  return result;
}

void SEUpdater::P73BaseSEController::doRestrictedMode(SEUpdater::P73BaseSEController *this)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v1 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  uint64_t v2 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v1);
  }
  uint64_t v3 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  SEUpdaterUtil::SELogObj::printLog(v2, (SEUpdaterUtil::SELogObj *)1, 0, 1, "doRestrictedMode", (SEUpdaterUtil::SELogObj *)"This process may take a long time (~16 min)\n");
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v5, 0x2037uLL);
  uint64_t v5 = &unk_26DD735C8;
  int v6 = 20608;
  char v7 = 8;
  uint64_t v8 = 0;
  char v9 = 0;
  SERestoreInfo::CApdu::CApdu(&v4);
}

void sub_229336038(_Unwind_Exception *a1)
{
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  _Unwind_Resume(a1);
}

void sub_2293361B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  if (a17) {
    JUMPOUT(0x2293361E4);
  }
  JUMPOUT(0x2293361E8);
}

void sub_2293362C8(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  __cxa_end_catch();
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  _Unwind_Resume(a1);
}

void SEUpdater::P73BaseSEController::transceive(uint64_t a1, uint64_t a2, uint64_t a3, int a4, SEUpdaterUtil::SELogObj *a5)
{
  uint64_t v8 = *(void *)(a3 + 8);
  unint64_t v9 = *(void *)(v8 + 16) - *(void *)v8;
  LOBYTE(v14) = 0;
  std::vector<unsigned char>::assign((char **)v8, v9, (char *)&v14);
  uint64_t v10 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  long long v11 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v10);
  }
  char v12 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  SEUpdaterUtil::SELogObj::printLog(v11, a5, 0, 1, "transceive", (SEUpdaterUtil::SELogObj *)"Transmitting C-APDU %d: %zu\n", a4, *(void *)(*(void *)(a2 + 8) + 8) - **(void **)(a2 + 8));
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  if (*(void *)(*(void *)(a2 + 8) + 8) - **(void **)(a2 + 8) >= 5uLL) {
    uint64_t v13 = 5;
  }
  else {
    uint64_t v13 = *(void *)(*(void *)(a2 + 8) + 8) - **(void **)(a2 + 8);
  }
  SEUpdaterUtil::SELogPrintBinary(a5, *(void *)(a2 + 24), (const unsigned __int8 *)v13);
}

void sub_2293365B4(_Unwind_Exception *a1)
{
}

void *SEUpdater::P73BaseSEController::doRestrictedMode(void)::FakeInitializeUpdate::~FakeInitializeUpdate(void *a1)
{
  *a1 = &unk_26DD73620;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void *SEUpdater::P73BaseSEController::doRestrictedMode(void)::FakeExternalAuthenticate::~FakeExternalAuthenticate(void *a1)
{
  *a1 = &unk_26DD73620;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void SEUpdater::P73BaseSEController::transceive(SEUpdater::P73BaseSEController *this, const unsigned __int8 *a2, const unsigned __int8 *a3, unsigned __int8 *a4, unint64_t *a5, SEUpdaterUtil::SELogObj *a6)
{
  int v8 = (int)a2;
  int v9 = *((unsigned __int8 *)this + 16);
  uint64_t v10 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  long long v11 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v10);
  }
  char v12 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  SEUpdaterUtil::SELogObj::printLog(v11, a6, 0, 1, "transceive", (SEUpdaterUtil::SELogObj *)"Transmitting C-APDU %d: %zu\n", 2 * v9, (size_t)a3);
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  SEUpdaterUtil::SELogPrintBinary(a6, v8, a3);
}

void sub_229336890(_Unwind_Exception *a1)
{
}

void SEUpdater::P73BaseSEController::transceiveInternal(uint64_t a1)
{
  if (!a1)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v7, "Assertion: ");
    uint64_t v3 = std::string::append(&v7, "fSeHandle");
    long long v4 = *(_OWORD *)&v3->__r_.__value_.__l.__data_;
    std::string::size_type v9 = v3->__r_.__value_.__r.__words[2];
    long long v8 = v4;
    v3->__r_.__value_.__l.__size_ = 0;
    v3->__r_.__value_.__r.__words[2] = 0;
    v3->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, &v8);
  }
  uint64_t v1 = NfRestoreSETransceiveToOS();
  std::string::basic_string[abi:ne180100]<0>(__p, "Fail to NfRestoreSETransceive");
  SERestoreInfo::CallAndThrow<NfResult>(v1, (uint64_t)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
}

void sub_2293369DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SEUpdater::P73BaseSEController::transceive(SEUpdater::P73BaseSEController *this, const SERestoreInfo::CApdu *a2, SERestoreInfo::RApdu *a3, SEUpdaterUtil::SELogObj *a4)
{
}

uint64_t SEUpdater::P73BaseSEController::transceiveInternal(SEUpdater::P73BaseSEController *this, const unsigned __int8 *a2, unint64_t a3, unsigned __int8 *a4, unint64_t *a5)
{
  return 0;
}

void SEUpdater::P73BaseSEController::doRestrictedMode(void)::FakeInitializeUpdate::~FakeInitializeUpdate(void *a1)
{
  *a1 = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::P73BaseSEController::doRestrictedMode(void)::FakeExternalAuthenticate::~FakeExternalAuthenticate(void *a1)
{
  *a1 = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

SEUpdater::P73BaseUpdateController *SEUpdater::P73BaseUpdateController::P73BaseUpdateController(SEUpdater::P73BaseUpdateController *this, char a2)
{
  updated = SEUpdater::UpdateControllerBase::UpdateControllerBase(this);
  *(void *)updated = &unk_26DD73CB0;
  *((_OWORD *)updated + 8) = 0u;
  *((_OWORD *)updated + 9) = 0u;
  *((_OWORD *)updated + 10) = 0u;
  *((_OWORD *)updated + 11) = 0u;
  *((_OWORD *)updated + 12) = 0u;
  *((_OWORD *)updated + 13) = 0u;
  *((unsigned char *)updated + 224) = 0;
  uint64_t v5 = operator new(0x30uLL);
  v5[1] = 0;
  uint64_t v5[2] = 0;
  *uint64_t v5 = &unk_26DD749A0;
  v5[3] = &unk_26DD73BB8;
  v5[4] = 0;
  *((unsigned char *)v5 + 40) = a2;
  *((void *)this + 20) = v5 + 3;
  *((void *)this + 21) = v5;
  if (*((unsigned char *)this + 80))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v14, "Assertion: ");
    std::string::size_type v9 = std::string::append(&v14, "!fIsDone");
    long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    std::string::size_type v16 = v9->__r_.__value_.__r.__words[2];
    long long v15 = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, &v15);
  }
  if (*((void *)this + 14)) {
    char v6 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    char v6 = 0;
  }
  if (!v6)
  {
    long long v11 = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v14, "Assertion: ");
    char v12 = std::string::append(&v14, "fOutput");
    long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
    std::string::size_type v16 = v12->__r_.__value_.__r.__words[2];
    long long v15 = v13;
    v12->__r_.__value_.__l.__size_ = 0;
    v12->__r_.__value_.__r.__words[2] = 0;
    v12->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](v11, &v15);
  }
  return this;
}

void sub_229336D5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (*(char *)(v21 + 223) < 0) {
    operator delete(*(void **)(v21 + 200));
  }
  if (*(char *)(v21 + 199) < 0) {
    operator delete(*(void **)(v21 + 176));
  }
  int v23 = *(std::__shared_weak_count **)(v21 + 168);
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
  BOOL v24 = *(std::__shared_weak_count **)(v21 + 152);
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  std::string::size_type v25 = *(std::__shared_weak_count **)(v21 + 136);
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
  SEUpdater::UpdateControllerBase::~UpdateControllerBase((const void **)v21);
  _Unwind_Resume(a1);
}

void SEUpdater::UpdateControllerBase::~UpdateControllerBase(const void **this)
{
  *this = &unk_26DD74E00;
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(this + 15);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(this + 14);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)(this + 11), this[12]);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(this + 9);
  std::__optional_destruct_base<AlohaPairingOptions,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)(this + 2));
}

void SEUpdater::P73BaseUpdateController::~P73BaseUpdateController(void **this)
{
  *this = &unk_26DD73CB0;
  uint64_t v2 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  uint64_t v3 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v2);
  }
  long long v4 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  SEUpdaterUtil::SELogObj::printLog(v3, 0, 0, 1, "~P73BaseUpdateController", (SEUpdaterUtil::SELogObj *)"Destroying Update Controller\n");
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  if (*((char *)this + 223) < 0) {
    operator delete(this[25]);
  }
  if (*((char *)this + 199) < 0) {
    operator delete(this[22]);
  }
  uint64_t v5 = (std::__shared_weak_count *)this[21];
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  char v6 = (std::__shared_weak_count *)this[19];
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  std::string v7 = (std::__shared_weak_count *)this[17];
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  SEUpdater::UpdateControllerBase::~UpdateControllerBase((const void **)this);
}

{
  uint64_t vars8;

  SEUpdater::P73BaseUpdateController::~P73BaseUpdateController(this);

  JUMPOUT(0x22A6B67D0);
}

void sub_229336FB4(void *a1)
{
}

void SEUpdater::P73BaseUpdateController::doStart(SEUpdater::P73BaseUpdateController *this)
{
  v51[4] = *MEMORY[0x263EF8340];
  SEUpdater::UpdateControllerBase::parseStartOptions(this);
  SEUpdater::UpdateControllerBase::getStringfromOption((CFDictionaryRef *)this, __p);
  uint64_t v2 = (void **)((char *)this + 176);
  if (*((char *)this + 199) < 0) {
    operator delete(*v2);
  }
  *(_OWORD *)uint64_t v2 = *(_OWORD *)__p;
  *((void *)this + 24) = v48;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)&unk_22936E3AF);
  int v43 = this;
  std::string::basic_string[abi:ne180100]<0>(v49, "Default");
  std::string::basic_string[abi:ne180100]<0>(v50, "Force");
  std::string::basic_string[abi:ne180100]<0>(v51, "Skip");
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  int v45 = 0;
  uint64_t v46 = 0;
  __int16 v44 = &v45;
  uint64_t v5 = &v45;
  while (1)
  {
    char v6 = &__p[3 * v4];
    if (v5 == &v45)
    {
      long long v8 = &v45;
    }
    else
    {
      std::string v7 = &v45;
      if (v3)
      {
        do
        {
          long long v8 = (uint64_t **)v3;
          uint64_t v3 = (uint64_t *)v3[1];
        }
        while (v3);
      }
      else
      {
        do
        {
          long long v8 = (uint64_t **)v7[2];
          BOOL v9 = *v8 == (uint64_t *)v7;
          std::string v7 = v8;
        }
        while (v9);
      }
      BOOL v10 = std::less<std::string>::operator()[abi:ne180100]((uint64_t)&v46, (const void **)v8 + 4, (const void **)&__p[3 * v4]);
      uint64_t v3 = v45;
      if (!v10)
      {
        long long v11 = &v45;
        char v12 = &v45;
        if (v45)
        {
          char v12 = &v45;
          while (1)
          {
            while (1)
            {
              long long v11 = (uint64_t **)v3;
              long long v13 = (const void **)(v3 + 4);
              if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)&v46, (const void **)&__p[3 * v4], (const void **)v3 + 4))break; {
              uint64_t v3 = *v11;
              }
              char v12 = v11;
              if (!*v11) {
                goto LABEL_22;
              }
            }
            if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)&v46, v13, (const void **)&__p[3 * v4])) {
              break;
            }
            char v12 = v11 + 1;
            uint64_t v3 = v11[1];
            if (!v3) {
              goto LABEL_22;
            }
          }
LABEL_21:
          if (*v12) {
            goto LABEL_28;
          }
          goto LABEL_22;
        }
        goto LABEL_22;
      }
    }
    long long v11 = &v45;
    char v12 = &v45;
    if (v3)
    {
      char v12 = v8 + 1;
      long long v11 = v8;
      goto LABEL_21;
    }
LABEL_22:
    std::string v14 = (uint64_t *)operator new(0x38uLL);
    long long v15 = (std::string *)(v14 + 4);
    if (*((char *)v6 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v15, (const std::string::value_type *)*v6, (std::string::size_type)v6[1]);
    }
    else
    {
      *(_OWORD *)&v15->__r_.__value_.__l.__data_ = *(_OWORD *)v6;
      v14[6] = (uint64_t)v6[2];
    }
    *std::string v14 = 0;
    v14[1] = 0;
    void v14[2] = (uint64_t)v11;
    *char v12 = v14;
    if (*v44)
    {
      __int16 v44 = (uint64_t **)*v44;
      std::string v14 = *v12;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v45, v14);
    ++v46;
LABEL_28:
    if (++v4 == 4)
    {
      uint64_t v16 = 0;
      while (1)
      {
        if (SHIBYTE(v51[v16 + 2]) < 0) {
          operator delete((void *)v51[v16]);
        }
        v16 -= 3;
        if (v16 == -12)
        {
          std::string::size_type v17 = v45;
          if (v45)
          {
            long long v18 = &v45;
            do
            {
              long long v19 = v18;
              unint64_t v20 = v17 + 4;
              BOOL v21 = std::less<std::string>::operator()[abi:ne180100]((uint64_t)&v46, (const void **)v17 + 4, (const void **)v2);
              if (v21) {
                int v22 = v17 + 1;
              }
              else {
                int v22 = v17;
              }
              if (v21) {
                long long v18 = v19;
              }
              else {
                long long v18 = (uint64_t **)v17;
              }
              std::string::size_type v17 = (uint64_t *)*v22;
            }
            while (*v22);
            if (v18 != &v45)
            {
              int v23 = v21 ? (const void **)(v19 + 4) : (const void **)v20;
              if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)&v46, (const void **)v2, v23))
              {
                BOOL v24 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
                std::string::size_type v25 = (SEUpdaterUtil::SELogObj *)off_268315F10;
                if (!off_268315F10) {
                  SEUpdaterUtil::SELogObj::create_default_global(v24);
                }
                unint64_t v26 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
                if (*(&off_268315F10 + 1)) {
                  atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
                }
                pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
                uint64_t v27 = (char *)this + 176;
                if (*((char *)this + 199) < 0) {
                  uint64_t v27 = (const char *)*v2;
                }
                SEUpdaterUtil::SELogObj::printLog(v25, (SEUpdaterUtil::SELogObj *)2, 0, 1, "parseStartOptions", (SEUpdaterUtil::SELogObj *)"SE Health Test Policy: %s\n", v27);
                if (v26) {
                  std::__shared_weak_count::__release_shared[abi:ne180100](v26);
                }
                *((unsigned char *)this + 224) = SEUpdater::UpdateControllerBase::getBooleanOption((CFDictionaryRef *)this, @"performFactoryConfiguration", 0);
                unsigned int v28 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
                unsigned int v29 = (SEUpdaterUtil::SELogObj *)off_268315F10;
                if (!off_268315F10) {
                  SEUpdaterUtil::SELogObj::create_default_global(v28);
                }
                uint64_t v30 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
                if (*(&off_268315F10 + 1)) {
                  atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
                }
                pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
                if (*((unsigned char *)this + 224)) {
                  uint64_t v31 = "YES";
                }
                else {
                  uint64_t v31 = "NO";
                }
                SEUpdaterUtil::SELogObj::printLog(v29, (SEUpdaterUtil::SELogObj *)2, 0, 1, "parseStartOptions", (SEUpdaterUtil::SELogObj *)"Perform Factory Postflight requested? %s\n", v31);
                if (v30) {
                  std::__shared_weak_count::__release_shared[abi:ne180100](v30);
                }
                std::string::basic_string[abi:ne180100]<0>(__p, "dumpSE");
                uint64_t v32 = (char *)this + 96;
                uint64_t v33 = (char *)*((void *)this + 12);
                if (!v33) {
                  goto LABEL_72;
                }
                uint64_t v34 = (char *)this + 96;
                do
                {
                  BOOL v35 = std::less<std::string>::operator()[abi:ne180100]((uint64_t)this + 104, (const void **)v33 + 4, (const void **)__p);
                  std::string::size_type v36 = (char **)(v33 + 8);
                  if (!v35)
                  {
                    std::string::size_type v36 = (char **)v33;
                    uint64_t v34 = v33;
                  }
                  uint64_t v33 = *v36;
                }
                while (*v36);
                if (v34 == v32
                  || std::less<std::string>::operator()[abi:ne180100]((uint64_t)this + 104, (const void **)__p, (const void **)v34 + 4))
                {
LABEL_72:
                  uint64_t v34 = (char *)this + 96;
                }
                if (SHIBYTE(v48) < 0) {
                  operator delete(__p[0]);
                }
                if (v32 != v34)
                {
                  __int16 v37 = (char *)this + 200;
                  std::string::operator=((std::string *)((char *)v43 + 200), (const std::string *)(v34 + 56));
                  int v38 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
                  uint64_t v39 = (SEUpdaterUtil::SELogObj *)off_268315F10;
                  if (!off_268315F10) {
                    SEUpdaterUtil::SELogObj::create_default_global(v38);
                  }
                  uint64_t v40 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
                  if (*(&off_268315F10 + 1)) {
                    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
                  }
                  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
                  if (*((char *)v43 + 223) < 0) {
                    __int16 v37 = *(const char **)v37;
                  }
                  SEUpdaterUtil::SELogObj::printLog(v39, (SEUpdaterUtil::SELogObj *)2, 0, 1, "parseStartOptions", (SEUpdaterUtil::SELogObj *)"Will dump SE to file --> %s\n", v37);
                  if (v40) {
                    std::__shared_weak_count::__release_shared[abi:ne180100](v40);
                  }
                }
                std::__tree<std::string>::destroy((char *)v45);
                (*(void (**)(void, void))(**((void **)v43 + 20) + 40))(*((void *)v43 + 20), 0);
                SEUpdater::P73BaseUpdateController::doQuery(v43);
              }
            }
          }
          exception = __cxa_allocate_exception(0x48uLL);
          std::operator+<char>();
          __int16 v42 = (void *)SERestoreInfo::SEException::SEException((uint64_t)exception, (long long *)__p, 2, @"SEUpdaterErrorDomain");
        }
      }
    }
    uint64_t v5 = v44;
    uint64_t v3 = v45;
  }
}

void sub_2293379C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
}

void sub_229337AA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  std::__tree<std::string>::destroy(a13);
  JUMPOUT(0x229337B74);
}

void sub_229337AB4(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void sub_229337AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char *a13)
{
}

void sub_229337ACC(_Unwind_Exception *a1)
{
}

void sub_229337AD8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char *a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  std::__tree<std::string>::destroy(a13);
  JUMPOUT(0x229337B74);
}

void sub_229337AF0()
{
  __cxa_free_exception(v0);
  JUMPOUT(0x229337AFCLL);
}

void sub_229337B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  while (1)
  {
    if (*((char *)v15 - 1) < 0) {
      operator delete(*(v15 - 3));
    }
    v15 -= 3;
    if (v15 == (void **)&a15) {
      _Unwind_Resume(a1);
    }
  }
}

void sub_229337B30(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char *a13, uint64_t a14, char a15)
{
  operator delete(v15);
  std::__tree<std::string>::destroy(a13);
  uint64_t v16 = 0;
  while (1)
  {
    if (*(&a15 + v16 + 95) < 0) {
      operator delete(*(void **)(&a15 + v16 + 72));
    }
    v16 -= 24;
    if (v16 == -96) {
      JUMPOUT(0x229337B74);
    }
  }
}

void SEUpdater::P73BaseUpdateController::doQuery(SEUpdater::P73BaseUpdateController *this)
{
  if (*((void *)this + 20))
  {
    SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v6, 0x2037uLL);
    *(void *)&long long v6 = &unk_26DD735C8;
    SEUpdater::P73BaseUpdateController::sendManifestQuery(this);
  }
  exception = __cxa_allocate_exception(0x10uLL);
  std::string::basic_string[abi:ne180100]<0>(&v5, "Assertion: ");
  uint64_t v3 = std::string::append(&v5, "fSeController");
  long long v4 = *(_OWORD *)&v3->__r_.__value_.__l.__data_;
  std::string::size_type v7 = v3->__r_.__value_.__r.__words[2];
  long long v6 = v4;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  MEMORY[0x22A6B63F0](exception, &v6);
}

void sub_229337CB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, std::__shared_weak_count *a18)
{
  if (a18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a18);
  }
  _Unwind_Resume(exception_object);
}

void SEUpdaterUtil::SELogObj::dumpLogBuffer(SEUpdaterUtil::SELogObj *this)
{
  void v14[5] = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  std::string::size_type v7 = &v6;
  uint64_t v8 = 0x4002000000;
  BOOL v9 = __Block_byref_object_copy__2;
  BOOL v10 = __Block_byref_object_dispose__2;
  std::vector<unsigned char>::vector(__p, 0xF001uLL);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  uint64_t v5[2] = ___ZN13SEUpdaterUtil8SELogObj13dumpLogBufferEv_block_invoke;
  v5[3] = &unk_264863550;
  v5[4] = &v6;
  void v5[5] = this;
  char v12 = v5;
  block = (const char *)MEMORY[0x263EF8330];
  v14[0] = 0x40000000;
  v14[1] = ___ZNK3ctu20SharedSynchronizableIN13SEUpdaterUtil8SELogObjEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke;
  void v14[2] = &__block_descriptor_tmp_277;
  v14[3] = this;
  v14[4] = &v12;
  uint64_t v2 = *((void *)this + 2);
  if (*((void *)this + 3)) {
    dispatch_async_and_wait(v2, &block);
  }
  else {
    dispatch_sync(v2, &block);
  }
  SEUpdaterUtil::SELogObj::print(this, "********************************************************************************\n");
  SEUpdaterUtil::SELogObj::print(this, "Start of LogBuffer\n");
  SEUpdaterUtil::SELogObj::print(this, "********************************************************************************\n");
  uint64_t v3 = strtok((char *)v7[5], "\n");
  if (v3)
  {
    long long v4 = v3;
    do
    {
      SEUpdaterUtil::SELogObj::FormatMsg((SEUpdaterUtil::SELogObj *)"%s\n", &block, v4);
      SEUpdaterUtil::SELogObj::print(this, block);
      long long v4 = strtok(0, "\n");
      std::unique_ptr<char const,std::function<void ()(char const*)>>::reset[abi:ne180100]((uint64_t *)&block, 0);
      std::__function::__value_func<void ()(char const*)>::~__value_func[abi:ne180100](v14);
    }
    while (v4);
  }
  SEUpdaterUtil::SELogObj::print(this, "********************************************************************************\n");
  SEUpdaterUtil::SELogObj::print(this, "End of LogBuffer\n");
  SEUpdaterUtil::SELogObj::print(this, "********************************************************************************\n");
  _Block_object_dispose(&v6, 8);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_229337F90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23)
{
}

void SEUpdater::P73BaseUpdateController::dumpDebugInfo(SEUpdater::P73BaseUpdateController *this)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  (*(void (**)(void, void))(**((void **)this + 20) + 48))(*((void *)this + 20), 0);
  v1[8] = xmmword_22936B4EB;
  LOWORD(v2) = 0;
  SERestoreInfo::CApdu::CApdu(v1);
}

#error "229338F84: call analysis failed (funcsize=76)"

BOOL std::operator!=[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(uint64_t *a1)
{
  int v1 = *((char *)a1 + 23);
  if (v1 < 0)
  {
    if (a1[1] != 5) {
      return 1;
    }
    a1 = (uint64_t *)*a1;
  }
  else if (v1 != 5)
  {
    return 1;
  }
  return *(_DWORD *)a1 != 1668443974 || *((unsigned char *)a1 + 4) != 101;
}

void SEUpdater::P73BaseUpdateController::printManifest(SEUpdater::P73BaseUpdateController *this)
{
  uint64_t v2 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  uint64_t v3 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v2);
  }
  long long v4 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  std::string v5 = (SERestoreInfo::P73BaseDeviceInfo *)*((void *)this + 16);
  if (v5)
  {
    SERestoreInfo::P73BaseDeviceInfo::print(v5);
    if (v8 >= 0) {
      uint64_t v6 = (const char *)__p;
    }
    else {
      uint64_t v6 = (const char *)__p[0];
    }
  }
  else
  {
    uint64_t v6 = "NULL deviceInfo";
  }
  SEUpdaterUtil::SELogObj::printLog(v3, (SEUpdaterUtil::SELogObj *)2, 0, 1, "printManifest", (SEUpdaterUtil::SELogObj *)"MQ: %s\n", v6);
  if (v5 && v8 < 0) {
    operator delete(__p[0]);
  }
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

void sub_22933912C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
}

uint64_t SEUpdater::P73BaseUpdateController::doCommand(SEUpdater::P73BaseUpdateController *this, CFStringRef theString1, const __CFDictionary **a3)
{
  if (!theString1)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v19, "Assertion: ");
    long long v13 = std::string::append(&v19, "command");
    long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    std::string::size_type v21 = v13->__r_.__value_.__r.__words[2];
    *(_OWORD *)err = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, err);
  }
  if (CFEqual(theString1, @"queryInfo")) {
    SEUpdater::P73BaseUpdateController::doQuery(this);
  }
  if (CFEqual(theString1, @"performNextStage")) {
    SEUpdater::P73BaseUpdateController::doPerform(this);
  }
  if (CFStringCompare(theString1, @"verifyPairing", 0)) {
    return 0;
  }
  uint64_t v6 = (SERestoreInfo::P73BaseDeviceInfo *)*((void *)this + 16);
  if (*((_DWORD *)v6 + 14) != 54) {
    goto LABEL_17;
  }
  if (!SERestoreInfo::P73BaseDeviceInfo::isProdEval(v6))
  {
    uint64_t v6 = (SERestoreInfo::P73BaseDeviceInfo *)*((void *)this + 16);
LABEL_17:
    (*(void (**)(SERestoreInfo::P73BaseDeviceInfo *))(*(void *)v6 + 32))(v6);
    BOOL v10 = (std::__shared_weak_count *)*((void *)this + 21);
    uint64_t v17 = *((void *)this + 20);
    long long v18 = v10;
    if (v10) {
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (!*((unsigned char *)this + 66)) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    verifyAlohaPairing(&v17, (uint64_t)this + 64, err);
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
    if (err[0]) {
      long long v11 = ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::get;
    }
    else {
      long long v11 = 0;
    }
    if (v11)
    {
      long long v15 = (SERestoreInfo::SEException *)__cxa_allocate_exception(0x48uLL);
      uint64_t v16 = SERestoreInfo::SEException::SEException(v15, err[0]);
    }
    ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef((const void **)err);
    return 1;
  }
  std::string::size_type v7 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  char v8 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v7);
  }
  BOOL v9 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  SEUpdaterUtil::SELogObj::printLog(v8, (SEUpdaterUtil::SELogObj *)2, 0, 1, "doCommand", (SEUpdaterUtil::SELogObj *)"SE is PROD_EVAL -> Skip SE-SEP pairing verification\n");
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  return 1;
}

#error "229339610: call analysis failed (funcsize=153)"

void sub_229339708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void sub_2293397B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  if (a17 < 0)
  {
    operator delete(a12);
    if ((v24 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v24)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v23);
  goto LABEL_8;
}

void SEUpdater::P73BaseUpdateController::doPerform(SEUpdater::P73BaseUpdateController *this)
{
  uint64_t v180 = *MEMORY[0x263EF8340];
  v137 = (SERestoreInfo::P73BaseDeviceInfo **)((char *)this + 128);
  if (!*((void *)this + 16))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    unsigned int v101 = (std::string *)std::string::basic_string[abi:ne180100]<0>(&value, "Assertion: ");
    uint64_t v102 = std::string::append(v101, "fDeviceInfo");
    long long v103 = *(_OWORD *)&v102->__r_.__value_.__l.__data_;
    *(void *)&long long v149 = *((void *)&v102->__r_.__value_.__l + 2);
    *(_OWORD *)long long __p = v103;
    v102->__r_.__value_.__l.__size_ = 0;
    v102->__r_.__value_.__r.__words[2] = 0;
    v102->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, __p);
  }
  int v1 = (const void **)((char *)this + 72);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef((const void **)theDict, (const void **)this + 9);
  if (!@"FirmwareData")
  {
    int v104 = __cxa_allocate_exception(0x10uLL);
    int v105 = (std::string *)std::string::basic_string[abi:ne180100]<0>(&value, "Assertion: ");
    int v106 = std::string::append(v105, "key");
    long long v107 = *(_OWORD *)&v106->__r_.__value_.__l.__data_;
    *(void *)&long long v149 = *((void *)&v106->__r_.__value_.__l + 2);
    *(_OWORD *)long long __p = v107;
    v106->__r_.__value_.__l.__size_ = 0;
    v106->__r_.__value_.__r.__words[2] = 0;
    v106->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](v104, __p);
  }
  value.__r_.__value_.__r.__words[0] = 0;
  v178.__r_.__value_.__r.__words[0] = 0;
  if (theDict[0]) {
    uint64_t v3 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    uint64_t v3 = 0;
  }
  if (v3)
  {
    if (!CFDictionaryGetValueIfPresent(theDict[0], @"FirmwareData", (const void **)&value.__r_.__value_.__l.__data_)|| (CFTypeID v4 = CFGetTypeID(value.__r_.__value_.__l.__data_), v4 != CFDataGetTypeID()))
    {
      v99 = "data is either not found or in wrong CFType";
      goto LABEL_239;
    }
    v177.__r_.__value_.__r.__words[0] = value.__r_.__value_.__r.__words[0];
    ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(__p, (CFTypeRef *)&v177.__r_.__value_.__l.__data_);
    std::string v5 = (void *)v178.__r_.__value_.__r.__words[0];
    v178.__r_.__value_.__l.__data_ = (std::string::pointer)__p[0];
    __p[0] = v5;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
    CFDataRef v6 = (const __CFData *)v178.__r_.__value_.__r.__words[0];
    if (v178.__r_.__value_.__r.__words[0]) {
      std::string::size_type v7 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
    }
    else {
      std::string::size_type v7 = 0;
    }
    if (v7)
    {
      char v8 = operator new(0x40uLL);
      v8[1] = 0;
      v8[2] = 0;
      *char v8 = &unk_26DD74C70;
      BOOL v9 = (SERestoreInfo::SEFirmwareBase *)(v8 + 3);
      SERestoreInfo::SEFirmwareBase::SEFirmwareBase((SERestoreInfo::SEFirmwareBase *)(v8 + 3), v6);
      *(void *)BOOL v9 = &unk_26DD73A18;
      goto LABEL_14;
    }
  }
  v99 = "fail to get Data";
LABEL_239:
  SEUpdaterUtil::_AddError((SEUpdaterUtil *)2, 1, (uint64_t)"getDataFromDict", (SEUpdaterUtil::SELogObj *)v99, v2);
  BOOL v9 = 0;
LABEL_14:
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v178.__r_.__value_.__l.__data_);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)theDict);
  if (!v9)
  {
    int v108 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(__p, "Not FW found in option");
    int v109 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v108, (long long *)__p, 2, @"SEUpdaterErrorDomain");
  }
  SERestoreInfo::P73BaseFirmware::getDeliveryObject(v9, (uint64_t)v137, __p);
  long long v11 = __p[0];
  BOOL v10 = __p[1];
  if (__p[1]) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)__p[1] + 1, 1uLL, memory_order_relaxed);
  }
  char v12 = (std::__shared_weak_count *)*((void *)this + 19);
  *((void *)this + 18) = v11;
  *((void *)this + 19) = v10;
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  if (__p[1]) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p[1]);
  }
  if (!*((void *)this + 18))
  {
    v110 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(__p, "No matching FW found");
    v111 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v110, (long long *)__p, 15, @"SEUpdaterErrorDomain");
  }
  if (*((_DWORD *)*v137 + 14) == 54 && SERestoreInfo::P73BaseDeviceInfo::isDev(*v137))
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "skipReperso");
    uint64_t v13 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__count_unique<std::string>((uint64_t)this + 88, (const void **)__p);
    uint64_t v14 = v13;
    if (SBYTE7(v149) < 0)
    {
      operator delete(__p[0]);
      if (!v14) {
        goto LABEL_28;
      }
    }
    else if (!v13)
    {
LABEL_28:
      long long v15 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
      uint64_t v16 = (SEUpdaterUtil::SELogObj *)off_268315F10;
      if (!off_268315F10) {
        SEUpdaterUtil::SELogObj::create_default_global(v15);
      }
      uint64_t v17 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
      if (*(&off_268315F10 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
      }
      pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
      SEUpdaterUtil::SELogObj::printLog(v16, (SEUpdaterUtil::SELogObj *)2, 0, 1, "doPerform", (SEUpdaterUtil::SELogObj *)"Forcing local signing\n");
      if (v17) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v17);
      }
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      v147[0] = Mutable;
      if (Mutable) {
        std::string v19 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
      }
      else {
        std::string v19 = 0;
      }
      if (!v19)
      {
        v127 = __cxa_allocate_exception(0x48uLL);
        std::string::basic_string[abi:ne180100]<0>(__p, "Fail to create dictionary for request");
        v128 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v127, (long long *)__p, 3, @"SEUpdaterErrorDomain");
      }
      int v20 = (*(uint64_t (**)(void))(*(void *)*v137 + 32))();
      std::string::size_type v21 = kSETagRequestTicket;
      if (v20 <= 199)
      {
        if (v20 != 100 && v20 != 115) {
          goto LABEL_45;
        }
      }
      else if (v20 != 200 && v20 != 210 && v20 != 131601)
      {
LABEL_45:
        std::string::size_type v21 = kSETagRequestTicketEC384;
      }
      CFDictionaryAddValue(Mutable, *v21, (const void *)*MEMORY[0x263EFFB40]);
      int v22 = v147[0];
      LODWORD(__p[0]) = *((_DWORD *)*v137 + 14);
      CFNumberRef v23 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, __p);
      if (v23)
      {
        CFDictionarySetValue(v22, @"SE,ChipID", v23);
        CFRelease(v23);
        int v24 = v147[0];
        CFDataRef v25 = CFDataCreate(0, *((const UInt8 **)*v137 + 4), *((void *)*v137 + 5) - *((void *)*v137 + 4));
        if (v25)
        {
          CFDictionarySetValue(v24, @"SE,ID", v25);
          CFRelease(v25);
          unint64_t v26 = v147[0];
          CFDataRef v27 = CFDataCreate(0, *((const UInt8 **)*v137 + 8), *((void *)*v137 + 9) - *((void *)*v137 + 8));
          if (v27)
          {
            CFDictionarySetValue(v26, @"SE,Nonce", v27);
            CFRelease(v27);
            unsigned int v28 = v147[0];
            CFDataRef v29 = CFDataCreate(0, *((const UInt8 **)*v137 + 11), *((void *)*v137 + 12) - *((void *)*v137 + 11));
            if (v29)
            {
              CFDictionarySetValue(v28, @"SE,RootKeyIdentifier", v29);
              CFRelease(v29);
              uint64_t v30 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
              v144[0] = v30;
              if (v30) {
                uint64_t v31 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
              }
              else {
                uint64_t v31 = 0;
              }
              if (!v31)
              {
                v129 = __cxa_allocate_exception(0x48uLL);
                std::string::basic_string[abi:ne180100]<0>(__p, "Fail to create dictionary for request image properties");
                v130 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v129, (long long *)__p, 3, @"SEUpdaterErrorDomain");
              }
              CFDictionarySetValue(v147[0], @"SE,UpdatePayload", v30);
              size_t v32 = *(void *)ccsha256_di();
              memset(&v178, 0, sizeof(v178));
              if (v32)
              {
                std::vector<unsigned char>::__vallocate[abi:ne180100](&v178, v32);
                std::string::size_type size = v178.__r_.__value_.__l.__size_;
                bzero((void *)v178.__r_.__value_.__l.__size_, v32);
                v178.__r_.__value_.__l.__size_ = size + v32;
              }
              ccdigest();
              CFDictionaryRef v34 = CFDataCreate(0, (const UInt8 *)v178.__r_.__value_.__l.__data_, v178.__r_.__value_.__l.__size_ - v178.__r_.__value_.__r.__words[0]);
              theDict[1] = v34;
              if (v34) {
                BOOL v35 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
              }
              else {
                BOOL v35 = 0;
              }
              if (!v35)
              {
                v131 = __cxa_allocate_exception(0x48uLL);
                std::string::basic_string[abi:ne180100]<0>(__p, "Fail to create data for SEDH in request");
                v132 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v131, (long long *)__p, 3, @"SEUpdaterErrorDomain");
              }
              CFDictionarySetValue(v144[0], @"DevelopmentUpdatePayloadHash", v34);
              ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef((const void **)&v141, v1);
              int v36 = (*(uint64_t (**)(void))(*(void *)*v137 + 32))();
              uint64_t v39 = kSETagResponseTicket;
              if (v36 <= 199)
              {
                if (v36 != 100 && v36 != 115) {
                  goto LABEL_67;
                }
              }
              else if (v36 != 200 && v36 != 210 && v36 != 131601)
              {
LABEL_67:
                uint64_t v39 = kSETagResponseTicketEC384;
              }
              SEUpdaterUtil::getDataFromDict<SERestoreInfo::BLOB>(&v177, v141, *v39, v37, v38);
              ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v141);
              if (v177.__r_.__value_.__r.__words[0])
              {
                uint64_t v176 = 0;
                long long v174 = 0u;
                long long v175 = 0u;
                long long v172 = 0u;
                long long v173 = 0u;
                long long v170 = 0u;
                long long v171 = 0u;
                long long v168 = 0u;
                long long v169 = 0u;
                long long v166 = 0u;
                long long v167 = 0u;
                long long v164 = 0u;
                long long v165 = 0u;
                long long v162 = 0u;
                long long v163 = 0u;
                long long v160 = 0u;
                long long v161 = 0u;
                long long v158 = 0u;
                long long v159 = 0u;
                long long v156 = 0u;
                long long v157 = 0u;
                long long v154 = 0u;
                long long v155 = 0u;
                long long v152 = 0u;
                long long v153 = 0u;
                long long v150 = 0u;
                long long v151 = 0u;
                *(_OWORD *)long long __p = 0u;
                long long v149 = 0u;
                if (!Img4DecodeInitManifest())
                {
                  SEUpdater::getOBJPOctetString(&value);
                  if (value.__r_.__value_.__r.__words[0]) {
                    uint64_t v40 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
                  }
                  else {
                    uint64_t v40 = 0;
                  }
                  if (v40)
                  {
                    v146 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                    CFDictionaryAddValue((CFMutableDictionaryRef)v146, @"Digest", value.__r_.__value_.__l.__data_);
                    CFDictionaryAddValue(v147[0], @"SE,RapRTKitOS", v146);
                    ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&v146);
                  }
                  SEUpdater::getOBJPOctetString(&v146);
                  if (v146) {
                    int v41 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
                  }
                  else {
                    int v41 = 0;
                  }
                  if (v41)
                  {
                    CFTypeRef cf = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                    CFDictionaryAddValue((CFMutableDictionaryRef)cf, @"Digest", v146);
                    CFDictionaryAddValue(v147[0], @"SE,RapSwBinDsp", cf);
                    ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(&cf);
                  }
                  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v146);
                  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&value.__r_.__value_.__l.__data_);
                }
              }
              unsigned int v42 = *((_DWORD *)*v137 + 14);
              if (v42 == 54) {
                operator new();
              }
              v133 = __cxa_allocate_exception(0x48uLL);
              std::to_string(&value, v42);
              v134 = std::string::insert(&value, 0, "Can't retrieve Image4 signer; unknown ChipID: ");
              *(_OWORD *)long long __p = *(_OWORD *)&v134->__r_.__value_.__l.__data_;
              *(void *)&long long v149 = *((void *)&v134->__r_.__value_.__l + 2);
              v134->__r_.__value_.__l.__size_ = 0;
              v134->__r_.__value_.__r.__words[2] = 0;
              v134->__r_.__value_.__r.__words[0] = 0;
              v135 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v133, (long long *)__p, 30, @"SEUpdaterErrorDomain");
            }
          }
        }
        v120 = "tmpData";
        int v121 = 59;
        v122 = "_CFDictionarySetData";
      }
      else
      {
        v120 = "num != nullptr";
        int v121 = 42;
        v122 = "_CFDictionarySetInteger32";
      }
      __assert_rtn(v122, "SERestoreInfoHelpers.hpp", v121, v120);
    }
  }
  int v43 = *v137;
  int v44 = *((_DWORD *)*v137 + 7);
  if (v44 == 23195 || v44 == 47545 || v44 == 47411) {
    SEUpdater::P73BaseUpdateController::getSEHealthCheckResult(this);
  }
  if (*((_DWORD *)v43 + 3) != *((_DWORD *)v43 + 6) || *((_DWORD *)v43 + 7) != 23195)
  {
LABEL_106:
    BOOL v50 = 0;
    int v51 = *((_DWORD *)v43 + 7);
    if (v51 != 23195 && v51 != 47411) {
      BOOL v50 = v51 != 47545;
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "skipSeshatCheck");
    v136 = (uint64_t **)((char *)this + 88);
    uint64_t v52 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__count_unique<std::string>((uint64_t)this + 88, (const void **)__p);
    if (SBYTE7(v149) < 0) {
      operator delete(__p[0]);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "ignoreSecureChannelAM");
    uint64_t v53 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__count_unique<std::string>((uint64_t)v136, (const void **)__p);
    if (SBYTE7(v149) < 0) {
      operator delete(__p[0]);
    }
    uint64_t v54 = *v137;
    BOOL v55 = *((_DWORD *)*v137 + 3) != *((_DWORD *)*v137 + 6) || *((_DWORD *)v54 + 7) != 23195;
    if (v53) {
      char v56 = 1;
    }
    else {
      char v56 = v50;
    }
    if ((v56 & 1) == 0)
    {
      SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v178, 0x2037uLL);
      v178.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26DD735C8;
      SEUpdater::CommandSelectISD::CommandSelectISD((SEUpdater::CommandSelectISD *)__p);
    }
    BOOL v57 = *((_DWORD *)v54 + 14) == 115 && *((_DWORD *)v54 + 3) < 0x1DBu;
    if (*((unsigned char *)this + 9)) {
      BOOL v58 = 0;
    }
    else {
      BOOL v58 = v52 == 0;
    }
    if (!v58) {
      BOOL v57 = 1;
    }
    if (!v50 && !v55 && !v57)
    {
      SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&value, 0x2037uLL);
      value.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26DD735C8;
      SEUpdater::CommandSelectSeshat::CommandSelectSeshat((SEUpdater::CommandSelectSeshat *)__p);
    }
    if (*(_DWORD *)(*((void *)this + 18) + 120) <= *((_DWORD *)v54 + 4))
    {
      std::string::basic_string[abi:ne180100]<0>(&v141, "forceUpdate");
      if (!std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__count_unique<std::string>((uint64_t)v136, (const void **)&v141)|| (uint64_t v59 = *v137, *((_DWORD *)*v137 + 3) != *((_DWORD *)*v137 + 6))|| *((_DWORD *)v59 + 7) != 23195|| *((_DWORD *)v59 + 14) != 44)
      {
        if (v142 < 0) {
          operator delete(v141);
        }
LABEL_143:
        std::string::basic_string[abi:ne180100]<0>(__p, "forceDeviceHwVersion");
        uint64_t v60 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__count_unique<std::string>((uint64_t)v136, (const void **)__p);
        if (SBYTE7(v149) < 0) {
          operator delete(__p[0]);
        }
        if (v60)
        {
          v125 = __cxa_allocate_exception(0x48uLL);
          std::string::basic_string[abi:ne180100]<0>(__p, "Update was going to proceed but bailing out due to forceDeviceHwVersion debug arg; don't want to brick SEs");
          v126 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v125, (long long *)__p, 2, @"SEUpdaterErrorDomain");
        }
        if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD829C0, memory_order_acquire) & 1) == 0
          && __cxa_guard_acquire(&qword_26AD829C0))
        {
          _MergedGlobals_2 = SEUpdater::getForceUpdateLoop(v136);
          __cxa_guard_release(&qword_26AD829C0);
        }
        std::string::size_type v61 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
        uint64_t v62 = (SEUpdaterUtil::SELogObj *)off_268315F10;
        if (!off_268315F10) {
          SEUpdaterUtil::SELogObj::create_default_global(v61);
        }
        uint64_t v63 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
        if (*(&off_268315F10 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
        SEUpdaterUtil::SELogObj::printLog(v62, (SEUpdaterUtil::SELogObj *)3, 0, 1, "doPerform", (SEUpdaterUtil::SELogObj *)"Found forceUpdateLoop: %lu\n", _MergedGlobals_2);
        if (v63) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v63);
        }
        std::string::size_type v64 = (SERestoreInfo::P73BaseDeviceInfo *)*((void *)this + 16);
        if (*(_DWORD *)(*((void *)this + 18) + 120) <= *((_DWORD *)v64 + 4) && !_MergedGlobals_2)
        {
          if (*((_DWORD *)v64 + 3) == *((_DWORD *)v64 + 6) && *((_DWORD *)v64 + 7) == 23195)
          {
            std::string::basic_string[abi:ne180100]<0>(__p, "forceFPF");
            uint64_t v75 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__count_unique<std::string>((uint64_t)v136, (const void **)__p);
            if (SBYTE7(v149) < 0) {
              operator delete(__p[0]);
            }
            int v76 = *v137;
            if (*((_DWORD *)*v137 + 2) && *((_DWORD *)v76 + 7) == 23195 && *((_DWORD *)v76 + 36) == 0xFFFFFF)
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "ignoreFPTear");
              BOOL v77 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__count_unique<std::string>((uint64_t)v136, (const void **)__p) == 0;
              if (SBYTE7(v149) < 0) {
                operator delete(__p[0]);
              }
              int v76 = *v137;
            }
            else
            {
              BOOL v77 = 0;
            }
            uint64_t v78 = *((void *)this + 18);
            int v79 = *((_DWORD *)v76 + 7);
            unsigned int v80 = *((_DWORD *)v76 + 36);
            int v81 = *(_DWORD *)(v78 + 120);
            int v82 = *(unsigned __int8 *)(v78 + 152);
            unsigned int v83 = v80 >> 8;
            int v84 = v80;
            BOOL v87 = v79 == 23195 && (v83 != v81 || v80 != v82) && v82 != 238;
            uint64_t v88 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
            uint64_t v89 = (SEUpdaterUtil::SELogObj *)off_268315F10;
            if (!off_268315F10) {
              SEUpdaterUtil::SELogObj::create_default_global(v88);
            }
            uint64_t v90 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
            if (*(&off_268315F10 + 1)) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
            }
            pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
            SEUpdaterUtil::SELogObj::printLog(v89, (SEUpdaterUtil::SELogObj *)1, 0, 1, "isFPRequired", (SEUpdaterUtil::SELogObj *)"deviceFPFBSN 0x%x deviceFPREV %d deliveryBSN 0x%x deliveryFPFRev %d amStateOK %d bsnChanged %d revChanged %d ret %d\n", v83, v84, v81, v82, v79 == 23195, v83 != v81, v84 != v82, v87);
            if (v90) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v90);
            }
            int v91 = *(_DWORD *)(*((void *)this + 18) + 120);
            int v92 = *(_DWORD *)(*((void *)this + 16) + 24);
            int64x2_t v93 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
            v94 = (SEUpdaterUtil::SELogObj *)off_268315F10;
            if (!off_268315F10) {
              SEUpdaterUtil::SELogObj::create_default_global(v93);
            }
            int v95 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
            if (*(&off_268315F10 + 1)) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
            }
            pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
            SEUpdaterUtil::SELogObj::printLog(v94, (SEUpdaterUtil::SELogObj *)2, 0, 1, "doPerform", (SEUpdaterUtil::SELogObj *)"FPF: forced %d, torn %d, requested %d, required %d, allowed %d\n", v75 != 0, v77, *((unsigned __int8 *)this + 224), v87, v91 == v92);
            if (v95) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v95);
            }
            if (v75)
            {
              if (v91 != v92)
              {
                v112 = __cxa_allocate_exception(0x48uLL);
                std::string::basic_string[abi:ne180100]<0>(__p, "Forced FPF with device BSN != firmware BSN");
                long long v113 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v112, (long long *)__p, 2, @"SEUpdaterErrorDomain");
              }
            }
            else if (v91 != v92 || !v77 && (!v87 || !*((unsigned char *)this + 224)))
            {
              if (*((unsigned char *)this + 9))
              {
                SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&value, 0x2037uLL);
                value.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26DD735C8;
                SEUpdater::CommandSelectCRS::CommandSelectCRS((SEUpdater::CommandSelectCRS *)__p);
              }
              SEUpdater::P73BaseUpdateController::getSEHealthCheckResult(this);
            }
            if (SERestoreInfo::P73BaseDeliveryObject::isFpAvailable(*((SERestoreInfo::P73BaseDeliveryObject **)this + 18)))
            {
              SEUpdater::P73BaseUpdateController::sendIm4M((const void **)this);
              SEUpdater::P73BaseUpdateController::sendIm4P(this);
              v96 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
              v97 = (SEUpdaterUtil::SELogObj *)off_268315F10;
              if (!off_268315F10) {
                SEUpdaterUtil::SELogObj::create_default_global(v96);
              }
              v98 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
              if (*(&off_268315F10 + 1)) {
                atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
              }
              pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
              SEUpdaterUtil::SELogObj::printLog(v97, (SEUpdaterUtil::SELogObj *)2, 0, 1, "runFactoryPostflight", (SEUpdaterUtil::SELogObj *)"\n");
              if (v98) {
                std::__shared_weak_count::__release_shared[abi:ne180100](v98);
              }
              if (*((void *)this + 18)) {
                SEUpdater::P73BaseUpdateController::deactivateAll(this, "FPF");
              }
              long long v116 = __cxa_allocate_exception(0x10uLL);
              v117 = (std::string *)std::string::basic_string[abi:ne180100]<0>(&value, "Assertion: ");
              v118 = std::string::append(v117, "fDeliveryObj");
              long long v119 = *(_OWORD *)&v118->__r_.__value_.__l.__data_;
              *(void *)&long long v149 = *((void *)&v118->__r_.__value_.__l + 2);
              *(_OWORD *)long long __p = v119;
              v118->__r_.__value_.__l.__size_ = 0;
              v118->__r_.__value_.__r.__words[2] = 0;
              v118->__r_.__value_.__r.__words[0] = 0;
              MEMORY[0x22A6B63F0](v116, __p);
            }
            v114 = __cxa_allocate_exception(0x48uLL);
            std::string::basic_string[abi:ne180100]<0>(__p, "No factory postflight in the update bundle");
            v115 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v114, (long long *)__p, 15, @"SEUpdaterErrorDomain");
          }
          v123 = __cxa_allocate_exception(0x48uLL);
          std::string::basic_string[abi:ne180100]<0>(__p, "SE OS not in idle state");
          long long v124 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v123, (long long *)__p, 1, @"SEUpdaterErrorDomain");
        }
        int v65 = *((_DWORD *)v64 + 7);
        if (v65 == 23195 || v65 == 47545 || v65 == 47411)
        {
          SEUpdater::P73BaseUpdateController::sendIm4M((const void **)this);
          SEUpdater::P73BaseUpdateController::sendIm4P(this);
          std::string::size_type v64 = *v137;
        }
        if (!*(unsigned char *)(*((void *)this + 20) + 16))
        {
          if (*((_DWORD *)v64 + 7) != 47545)
          {
            if (*((char *)this + 223) < 0)
            {
              if (!*((void *)this + 26)) {
                goto LABEL_171;
              }
            }
            else if (!*((unsigned char *)this + 223))
            {
              goto LABEL_171;
            }
          }
          SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&value, 0x2037uLL);
          value.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26DD735C8;
          (*(void (**)(void, void))(**((void **)this + 20) + 48))(*((void *)this + 20), 0);
          v178.__r_.__value_.__r.__words[0] = 0xBEADDE041380704FLL;
          LOWORD(v178.__r_.__value_.__r.__words[1]) = 239;
          SERestoreInfo::CApdu::CApdu(__p);
        }
LABEL_171:
        int v69 = (std::__shared_weak_count *)*((void *)this + 17);
        uint64_t v68 = *((void *)this + 18);
        v139 = v64;
        v140 = v69;
        if (v69) {
          atomic_fetch_add_explicit(&v69->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        unsigned int NextAction = SERestoreInfo::P73BaseDeliveryObject::findNextAction(v68, (uint64_t)&v139);
        if (v140) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v140);
        }
        int v71 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
        int v72 = (SEUpdaterUtil::SELogObj *)off_268315F10;
        if (!off_268315F10) {
          SEUpdaterUtil::SELogObj::create_default_global(v71);
        }
        int v73 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
        if (*(&off_268315F10 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
        SEUpdaterUtil::SELogObj::printLog(v72, (SEUpdaterUtil::SELogObj *)2, 0, 1, "doPerform", (SEUpdaterUtil::SELogObj *)"Found action %d\n", NextAction);
        if (v73) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v73);
        }
        SEUpdater::P73BaseUpdateController::doOneAction(this, NextAction);
        int v74 = (unsigned char *)*((void *)this + 20);
        if (v74[16]) {
          (*(void (**)(unsigned char *, void))(*(void *)v74 + 48))(v74, 0);
        }
        SEUpdater::P73BaseUpdateController::sendManifestQuery(this);
      }
    }
    else if (*((_DWORD *)v54 + 3) != *((_DWORD *)v54 + 6) {
           || *((_DWORD *)v54 + 7) != 23195
    }
           || *((_DWORD *)v54 + 14) != 44)
    {
      goto LABEL_143;
    }
    SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&value, 0x2037uLL);
    value.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26DD735C8;
    SEUpdater::CommandSelectCRS::CommandSelectCRS((SEUpdater::CommandSelectCRS *)__p);
  }
  int v45 = (*(uint64_t (**)(SERestoreInfo::P73BaseDeviceInfo *))(*(void *)v43 + 32))(v43);
  if (v45 > 114)
  {
    if (v45 == 115)
    {
LABEL_105:
      int v43 = *v137;
      goto LABEL_106;
    }
    if (v45 != 210 && v45 != 200)
    {
LABEL_102:
      uint64_t v46 = operator new(0x10uLL);
      value.__r_.__value_.__l.__size_ = (std::string::size_type)(v46 + 4);
      value.__r_.__value_.__r.__words[2] = (std::string::size_type)(v46 + 4);
      *(void *)uint64_t v46 = 0x5011D004070000A0;
      v46[2] = 0;
      v46[3] = 1;
      value.__r_.__value_.__r.__words[0] = (std::string::size_type)v46;
      int v47 = (char *)operator new(0x10uLL);
      *(void *)int v47 = 0x5011D004070000A0;
      *((_DWORD *)v47 + 2) = 0;
      v47[12] = 0;
      *(_WORD *)(v47 + 13) = 2;
      v47[15] = 6;
      uint64_t v48 = (char *)operator new(0x10uLL);
      *(void *)uint64_t v48 = 0x5011D004070000A0;
      *((_DWORD *)v48 + 2) = 0;
      v48[12] = 0;
      *(_WORD *)(v48 + 13) = 258;
      v48[15] = 17;
      uint64_t v49 = (atomic_ullong *)*((void *)this + 21);
      v144[0] = *((CFMutableDictionaryRef *)this + 20);
      v144[1] = (CFMutableDictionaryRef)v49;
      if (v49) {
        atomic_fetch_add_explicit(v49 + 1, 1uLL, memory_order_relaxed);
      }
      SEUpdater::GetPackageInfo();
    }
  }
  else
  {
    if (v45 == 44)
    {
      if (*((_DWORD *)*v137 + 3) >= 0x298u) {
        goto LABEL_102;
      }
      goto LABEL_105;
    }
    if (v45 == 54)
    {
      if (*((_DWORD *)*v137 + 3) >= 0xBFu) {
        goto LABEL_102;
      }
      goto LABEL_105;
    }
    if (v45 != 100) {
      goto LABEL_102;
    }
  }
  if (*((_DWORD *)*v137 + 3) >= 0xE18u) {
    goto LABEL_102;
  }
  goto LABEL_105;
}

void sub_2293439E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, std::__shared_weak_count *a18)
{
  if (a18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a18);
  }
  _Unwind_Resume(a1);
}

void sub_229346314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if (a68 < 0) {
    JUMPOUT(0x229346324);
  }
  *(void *)(v68 - 176) = &unk_26DD73620;
  if (!*(void *)(v68 - 160)) {
    JUMPOUT(0x229346300);
  }
  JUMPOUT(0x2293462FCLL);
}

void sub_22934632C()
{
  __cxa_free_exception(v0);
  JUMPOUT(0x229346338);
}

uint64_t std::map<std::string,std::string>::at(uint64_t a1, const void **a2)
{
  uint64_t v2 = *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_equal<std::string>(a1, &v4, a2);
  if (!v2) {
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  }
  return v2 + 56;
}

void SEUpdater::CommandGetOsInfo::~CommandGetOsInfo(SEUpdater::CommandGetOsInfo *this)
{
  *(void *)this = &unk_26DD73620;
  int v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  int v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandSelectOSU::~CommandSelectOSU(SEUpdater::CommandSelectOSU *this)
{
  *(void *)this = &unk_26DD73620;
  int v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  int v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandGetAMExportInfo::~CommandGetAMExportInfo(SEUpdater::CommandGetAMExportInfo *this)
{
  *(void *)this = &unk_26DD73620;
  int v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  int v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::P73BaseUpdateController::sendManifestQuery(SEUpdater::P73BaseUpdateController *this)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  (*(void (**)(void, void))(**((void **)this + 20) + 48))(*((void *)this + 20), 0);
  SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v2, 0x2037uLL);
  uint64_t v2 = &unk_26DD735C8;
  long long v3 = xmmword_22936B4EB;
  LOWORD(v4) = 0;
  SERestoreInfo::CApdu::CApdu(&v1);
}

void sub_2293477C8(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  *(void *)(v1 - 200) = &unk_26DD73620;
  long long v3 = *(std::__shared_weak_count **)(v1 - 184);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  *(void *)(v1 - 144) = &unk_26DD73620;
  uint64_t v4 = *(std::__shared_weak_count **)(v1 - 128);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  *(void *)(v1 - 224) = &unk_26DD73620;
  uint64_t v5 = *(std::__shared_weak_count **)(v1 - 208);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  _Unwind_Resume(a1);
}

void sub_229347A24(_Unwind_Exception *a1)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  *(void *)(v2 - 224) = &unk_26DD73620;
  uint64_t v4 = *(void *)(v2 - 208);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  _Unwind_Resume(a1);
}

void sub_229347A38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (a2 == 2)
  {
    __cxa_begin_catch(a1);
    exception = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>((void *)(v15 - 144), "Failed to parse forceDeviceHwVersion debug argument");
    long long v18 = (void *)SERestoreInfo::SEException::SEException((uint64_t)exception, (long long *)(v15 - 144), 2, @"SEUpdaterErrorDomain");
  }
  *(void *)(v15 - 224) = &unk_26DD73620;
  std::string v19 = *(std::__shared_weak_count **)(v15 - 208);
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  _Unwind_Resume(a1);
}

void sub_229347ADC(_Unwind_Exception *a1)
{
  if (*(char *)(v1 - 121) < 0) {
    operator delete(*(void **)(v1 - 144));
  }
  __cxa_end_catch();
  *(void *)(v1 - 224) = &unk_26DD73620;
  long long v3 = *(std::__shared_weak_count **)(v1 - 208);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(a1);
}

void sub_229347B08(void *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  JUMPOUT(0x229347C7CLL);
}

void sub_229347B20(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 - 121) < 0) {
    operator delete(*(void **)(v1 - 144));
  }
  *(void *)(v1 - 224) = &unk_26DD73620;
  long long v3 = *(std::__shared_weak_count **)(v1 - 208);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_229347B3C(_Unwind_Exception *a1)
{
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)(v1 - 144));
  *(void *)(v1 - 224) = &unk_26DD73620;
  long long v3 = *(std::__shared_weak_count **)(v1 - 208);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(a1);
}

void sub_229347B70()
{
}

void sub_229347BA8()
{
}

void sub_229347BB4(_Unwind_Exception *a1)
{
  *(void *)(v1 - 224) = &unk_26DD73620;
  uint64_t v3 = *(void *)(v1 - 208);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(a1);
}

void sub_229347BBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (*(char *)(v19 - 121) < 0) {
    operator delete(*(void **)(v19 - 144));
  }
  if (*(char *)(v19 - 177) < 0)
  {
    operator delete(*(void **)(v19 - 200));
    if ((v18 & 1) == 0)
    {
LABEL_7:
      *(void *)(v19 - 224) = &unk_26DD73620;
      std::string::size_type v21 = *(std::__shared_weak_count **)(v19 - 208);
      if (v21) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v21);
      }
      _Unwind_Resume(a1);
    }
  }
  else if (!v18)
  {
    goto LABEL_7;
  }
  JUMPOUT(0x229347C48);
}

void sub_229347C2C()
{
  if (*(char *)(v0 - 121) < 0) {
    JUMPOUT(0x229347C3CLL);
  }
  JUMPOUT(0x229347C48);
}

void sub_229347C44()
{
  __cxa_free_exception(v0);
  JUMPOUT(0x229347C50);
}

void SEUpdater::CommandMQ::~CommandMQ(SEUpdater::CommandMQ *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::P73BaseUpdateController::sendIm4M(const void **this)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef((const void **)&theDict, this + 9);
  int v2 = (*(uint64_t (**)(const void *))(*(void *)this[16] + 32))(this[16]);
  uint64_t v5 = kSETagResponseTicket;
  if (v2 <= 199)
  {
    if (v2 != 100 && v2 != 115) {
LABEL_10:
    }
      uint64_t v5 = kSETagResponseTicketEC384;
  }
  else if (v2 != 200 && v2 != 210 && v2 != 131601)
  {
    goto LABEL_10;
  }
  SEUpdaterUtil::getDataFromDict<SERestoreInfo::BLOB>(&v26, theDict, *v5, v3, v4);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&theDict);
  if (!v26 || !*(void *)(v26 + 8) || !*(void *)(v26 + 16))
  {
    exception = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(&__p, "Cannot find SE ticket in restore option");
    int v20 = (void *)SERestoreInfo::SEException::SEException((uint64_t)exception, &__p, 9, @"SEUpdaterErrorDomain");
  }
  std::string::size_type v7 = v27;
  if (v27) {
    atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v59 = 0;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long __p = 0u;
  long long v32 = 0u;
  if (Img4DecodeInitManifest())
  {
    std::string::size_type v21 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(&v28, "Failed to decode manifest");
    int v22 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v21, &v28, 18, @"SEUpdaterErrorDomain");
  }
  if (Img4DecodeGetObjectPropertyData() || !v30 || v29 != 20)
  {
    CFNumberRef v23 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(&v28, "Failed to get nonce from manifest");
    int v24 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v23, &v28, 18, @"SEUpdaterErrorDomain");
  }
  char v8 = this[16];
  BOOL v9 = (uint64_t *)v8[8];
  if (v8[9] - (void)v9 != 20)
  {
    BOOL v15 = 0;
    if (!v7) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v12 = *((unsigned int *)v9 + 4);
  BOOL v15 = v10 == *(void *)v30 && v11 == *(void *)(v30 + 8) && v12 == *(_DWORD *)(v30 + 16);
  if (v7) {
LABEL_33:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
LABEL_34:
  if (v15)
  {
    (*(void (**)(const void *, void))(*(void *)this[20] + 48))(this[20], 0);
    SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v28, 0x2037uLL);
    *(void *)&long long v28 = &unk_26DD735C8;
    SEUpdater::CommandTriggerImg4::CommandTriggerImg4((SEUpdater::CommandTriggerImg4 *)&__p);
  }
  uint64_t v16 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  uint64_t v17 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v16);
  }
  int v18 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  SEUpdaterUtil::SELogObj::printLog(v17, (SEUpdaterUtil::SELogObj *)2, 0, 1, "sendIm4M", (SEUpdaterUtil::SELogObj *)"Skip sending the Manifest because of nonce mismatch\n");
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }
}

void sub_2293483A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,std::__shared_weak_count *a21,void *a22,uint64_t a23,std::__shared_weak_count *a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a24);
  }
  if (a21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a21);
  }
  _Unwind_Resume(a1);
}

void SEUpdater::P73BaseUpdateController::sendIm4P(SEUpdater::P73BaseUpdateController *this)
{
  int v2 = *(_DWORD *)(*((void *)this + 16) + 140);
  if (v2 == 47545 || v2 == 59367)
  {
    (*(void (**)(void, void))(**((void **)this + 20) + 48))(*((void *)this + 20), 0);
    SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v9, 0x2037uLL);
    BOOL v9 = &unk_26DD735C8;
    SEUpdater::CommandTriggerImg4::CommandTriggerImg4((SEUpdater::CommandTriggerImg4 *)&__p);
  }
  uint64_t v4 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  uint64_t v5 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v4);
  }
  CFDataRef v6 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  SERestoreInfo::P73BaseDeviceInfo::getIm4State((SERestoreInfo::P73BaseDeviceInfo *)*(unsigned int *)(*((void *)this + 16) + 140), &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  SEUpdaterUtil::SELogObj::printLog(v5, (SEUpdaterUtil::SELogObj *)2, 0, 1, "sendIm4P", (SEUpdaterUtil::SELogObj *)"Skip sending the Update Payload because of IM4 state %s\n", (const char *)p_p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

void sub_229348998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
}

const void **SEUpdaterUtil::getDataFromDict<SERestoreInfo::BLOB>(void *a1, CFDictionaryRef theDict, void *key, uint64_t a4, const char *a5)
{
  if (!key)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&value, "Assertion: ");
    uint64_t v13 = std::string::append(&value, "key");
    long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    std::string::size_type v19 = v13->__r_.__value_.__r.__words[2];
    long long v18 = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, &v18);
  }
  uint64_t v16 = 0;
  value.__r_.__value_.__r.__words[0] = 0;
  if (theDict) {
    CFDataRef v6 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    CFDataRef v6 = 0;
  }
  if (!v6) {
    goto LABEL_14;
  }
  if (!CFDictionaryGetValueIfPresent(theDict, key, (const void **)&value.__r_.__value_.__l.__data_)
    || (CFTypeID v7 = CFGetTypeID(value.__r_.__value_.__l.__data_), v7 != CFDataGetTypeID()))
  {
    uint64_t v11 = "data is either not found or in wrong CFType";
    goto LABEL_16;
  }
  std::string::size_type v15 = value.__r_.__value_.__r.__words[0];
  ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(&v18, (CFTypeRef *)&v15);
  char v8 = v16;
  uint64_t v16 = (const void *)v18;
  *(void *)&long long v18 = v8;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v18);
  if (!(v16
       ? ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get
       : 0))
  {
LABEL_14:
    uint64_t v11 = "fail to get Data";
LABEL_16:
    SEUpdaterUtil::_AddError((SEUpdaterUtil *)2, 1, (uint64_t)"getDataFromDict", (SEUpdaterUtil::SELogObj *)v11, a5);
    *a1 = 0;
    a1[1] = 0;
    return ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v16);
  }
  *(void *)&long long v18 = v16;
  std::allocate_shared[abi:ne180100]<SERestoreInfo::BLOB,std::allocator<SERestoreInfo::BLOB>,__CFData const*,void>((CFTypeRef *)&v18, a1);
  return ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v16);
}

void sub_229348C70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, const void *a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
}

void SEUpdater::CommandTriggerImg4::~CommandTriggerImg4(SEUpdater::CommandTriggerImg4 *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::sendImage4Apdu(void *a1, uint64_t a2, void *a3)
{
  if (*(void *)(a2 + 8)) {
    BOOL v3 = *(void *)(a2 + 16) == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v29, "Assertion: ");
    CFDataRef v27 = std::string::append(&v29, "b.data && b.length");
    long long v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
    uint64_t v31 = (std::__shared_weak_count *)v27->__r_.__value_.__r.__words[2];
    long long v30 = v28;
    v27->__r_.__value_.__l.__size_ = 0;
    v27->__r_.__value_.__r.__words[2] = 0;
    v27->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, &v30);
  }
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  unint64_t v9 = 240;
  do
  {
    SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v30, 0x2037uLL);
    *(void *)&long long v30 = &unk_26DD735C8;
    uint64_t v10 = a3[3];
    *(unsigned char *)(v10 + 3) = 1;
    unint64_t v11 = *(void *)(a2 + 16);
    unint64_t v12 = v8 + 240;
    if (v11 <= v8 + 240) {
      *(unsigned char *)(v10 + 3) = 0;
    }
    if (v11 >= v9) {
      unint64_t v13 = v9;
    }
    else {
      unint64_t v13 = v11;
    }
    uint64_t v14 = *(void *)(a2 + 8);
    if (!v14)
    {
      int v24 = 250;
      CFDataRef v25 = "data";
      goto LABEL_31;
    }
    if (v11 >= v9) {
      unint64_t v11 = v9;
    }
    if (v11 + v7 - 8243 < 0xFFFFFFFFFFFFDFC8)
    {
      int v24 = 251;
      CFDataRef v25 = "(sizeof(CApduHeader_t)+len)<=MAX_APDU_LEN";
LABEL_31:
      __assert_rtn("copyPayload", "Apdu.hpp", v24, v25);
    }
    SERestoreInfo::CApdu::validate(a3);
    std::string::size_type v15 = (unint64_t *)a3[1];
    unint64_t v16 = *v15;
    unint64_t v17 = v15[1] - *v15;
    if (v17 > 4)
    {
      if (v17 != 5) {
        v15[1] = v16 + 5;
      }
    }
    else
    {
      std::vector<unsigned char>::__append(v15, 5 - v17);
      std::string::size_type v15 = (unint64_t *)a3[1];
      unint64_t v16 = *v15;
    }
    std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>((uint64_t)v15, (char *)(v16 + 5), (char *)(v14 + v8), (char *)(v14 + v8 + v13 + v7), v13 + v7);
    uint64_t v18 = *(void *)a3[1];
    unint64_t v19 = *(void *)(a3[1] + 8) - v18;
    BOOL v20 = v19 >= 6;
    if (v19 >= 6) {
      unint64_t v21 = v19 - 5;
    }
    else {
      unint64_t v21 = 0;
    }
    if (v20) {
      uint64_t v22 = v18 + 5;
    }
    else {
      uint64_t v22 = 0;
    }
    a3[4] = v22;
    a3[5] = v21;
    a3[3] = v18;
    SERestoreInfo::CApdu::validate(a3);
    *(unsigned char *)(a3[3] + 4) = a3[5];
    (*(void (**)(void, void *, long long *, uint64_t, uint64_t))(*(void *)*a1 + 16))(*a1, a3, &v30, 3, 1);
    SEUpdaterUtil::assertSW((uint64_t)&v30, (const SERestoreInfo::RApdu *)"Failed to send IM4 APDU", v23);
    ++*(unsigned char *)(a3[3] + 2);
    *(void *)&long long v30 = &unk_26DD73620;
    if (v31) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v31);
    }
    v7 -= 240;
    v9 += 240;
    v8 += 240;
  }
  while (*(void *)(a2 + 16) > v12);
}

void sub_229348FF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

void SEUpdater::CommandImage4::~CommandImage4(SEUpdater::CommandImage4 *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandIm4m::~CommandIm4m(SEUpdater::CommandIm4m *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandUpdatePayload::~CommandUpdatePayload(SEUpdater::CommandUpdatePayload *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::P73BaseUpdateController::doOneAction(SEUpdater::P73BaseUpdateController *this, unsigned int a2)
{
  BOOL v3 = *(uint64_t **)(*((void *)this + 18) + 16);
  if (!v3)
  {
LABEL_7:
    exception = __cxa_allocate_exception(0x48uLL);
    std::to_string(&v66, a2);
    uint64_t v8 = std::string::insert(&v66, 0, "No update item with index: ");
    long long v59 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    *(void *)&long long v60 = *((void *)&v8->__r_.__value_.__l + 2);
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    unint64_t v9 = (void *)SERestoreInfo::SEException::SEException((uint64_t)exception, &v59, 31, @"SEUpdaterErrorDomain");
  }
  uint64_t v5 = *(uint64_t ***)(*((void *)this + 18) + 16);
  while (1)
  {
    unsigned int v6 = *((unsigned __int16 *)v5 + 16);
    if (v6 <= a2) {
      break;
    }
LABEL_6:
    uint64_t v5 = (uint64_t **)*v5;
    if (!v5) {
      goto LABEL_7;
    }
  }
  if (v6 < a2)
  {
    ++v5;
    goto LABEL_6;
  }
  while (1)
  {
    while (1)
    {
      unsigned int v10 = *((unsigned __int16 *)v3 + 16);
      if (v10 <= a2) {
        break;
      }
      BOOL v3 = (uint64_t *)*v3;
      if (!v3) {
LABEL_88:
      }
        std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
    }
    if (v10 >= a2) {
      break;
    }
    BOOL v3 = (uint64_t *)v3[1];
    if (!v3) {
      goto LABEL_88;
    }
  }
  LODWORD(v59) = *((_DWORD *)v3 + 10);
  long long v60 = *(_OWORD *)(v3 + 7);
  uint64_t v11 = v3[9];
  *((void *)&v59 + 1) = &unk_26DD73970;
  uint64_t v61 = v11;
  int v62 = *((_DWORD *)v3 + 20);
  uint64_t v64 = 0;
  uint64_t v65 = 0;
  uint64_t v63 = 0;
  std::vector<SERestoreInfo::BLOB>::__init_with_size[abi:ne180100]<SERestoreInfo::BLOB*,SERestoreInfo::BLOB*>((char *)&v63, v3[11], v3[12], (v3[12] - v3[11]) >> 5);
  unint64_t v12 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  unint64_t v13 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v12);
  }
  uint64_t v14 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)&unk_22936E3AF);
  SERestoreInfo::ImageBinary::print((int *)&v59, (uint64_t)__p);
  if ((v66.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v15 = &v66;
  }
  else {
    std::string::size_type v15 = (std::string *)v66.__r_.__value_.__r.__words[0];
  }
  SEUpdaterUtil::SELogObj::printLog(v13, (SEUpdaterUtil::SELogObj *)3, 0, 1, "doOneAction", (SEUpdaterUtil::SELogObj *)"%s: \n", (const char *)v15);
  if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v66.__r_.__value_.__l.__data_);
  }
  if (v58 < 0) {
    operator delete(__p[0]);
  }
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  unsigned int v49 = v59;
  long long v50 = &unk_26DD73970;
  long long v51 = v60;
  uint64_t v52 = v61;
  int v53 = v62;
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  uint64_t v54 = 0;
  std::vector<SERestoreInfo::BLOB>::__init_with_size[abi:ne180100]<SERestoreInfo::BLOB*,SERestoreInfo::BLOB*>((char *)&v54, v63, v64, (v64 - v63) >> 5);
  unint64_t v16 = 0;
  if (v49 != 1 && v49 <= 4)
  {
    if ((unint64_t)(((v55 - v54) >> 4) + ((v55 - v54) >> 5)) <= 0x14) {
      unint64_t v16 = 20;
    }
    else {
      unint64_t v16 = ((v55 - v54) >> 4) + ((v55 - v54) >> 5);
    }
  }
  char v17 = 0;
  int v18 = 0;
  long long v46 = (char *)this + 88;
  while (1)
  {
    uint64_t v19 = v54;
    if (v54 != v55) {
      break;
    }
    char v38 = v17;
    char v17 = 1;
    if ((v38 & 1) == 0) {
      goto LABEL_65;
    }
  }
  uint64_t v20 = v54;
  do
  {
    SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v68, 0x2037uLL);
    uint64_t v68 = &unk_26DD735C8;
    unint64_t v21 = v69[2] - *v69;
    v66.__r_.__value_.__s.__data_[0] = 0;
    std::vector<unsigned char>::assign(v69, v21, (char *)&v66);
    unint64_t v67 = 0;
    unint64_t v67 = v69[1] - *v69;
    (*(void (**)(void, void, void))(**((void **)this + 20) + 24))(*((void *)this + 20), *(void *)(v20 + 8), *(void *)(v20 + 16));
    SERestoreInfo::Apdu::updateSize((uint64_t)&v68, v67);
    CFNumberRef v23 = v69[1];
    if ((unint64_t)(v23 - *v69) >= 2)
    {
      int v24 = *(v23 - 2);
      int v25 = *(v23 - 1);
      if ((v25 | (v24 << 8)) == 0x6F24 || (v25 & 0xF0 | (v24 << 8)) == 25536)
      {
        int v27 = v18 + 1;
        if (v16 > v18 && v49 != 1 && v49 <= 4)
        {
          std::string::basic_string[abi:ne180100]<0>(&v66, "disableAMRetry");
          uint64_t v28 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__count_unique<std::string>((uint64_t)v46, (const void **)&v66.__r_.__value_.__l.__data_);
          uint64_t v29 = v28;
          if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(v66.__r_.__value_.__l.__data_);
            if (!v29)
            {
LABEL_51:
              long long v30 = *v69;
              uint64_t v31 = v69[1];
              long long v32 = (const unsigned __int8 *)(v31 - *v69);
              if ((unint64_t)v32 >= 2
                && (*(v31 - 1) | (v30[(void)v32 - 2] << 8)) == 0x6F24)
              {
                long long v33 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
                long long v34 = (SEUpdaterUtil::SELogObj *)off_268315F10;
                if (!off_268315F10) {
                  SEUpdaterUtil::SELogObj::create_default_global(v33);
                }
                long long v35 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
                if (*(&off_268315F10 + 1)) {
                  atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
                }
                pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
                long long v36 = v69[1];
                if ((unint64_t)(v36 - *v69) < 2) {
                  int v37 = 43947;
                }
                else {
                  int v37 = *(v36 - 1) | (*(v36 - 2) << 8);
                }
                SEUpdaterUtil::SELogObj::printLog(v34, (SEUpdaterUtil::SELogObj *)1, 0, 1, "sendApdus", (SEUpdaterUtil::SELogObj *)"Resetting due to 0x%hx", v37);
                if (v35) {
                  std::__shared_weak_count::__release_shared[abi:ne180100](v35);
                }
                (*(void (**)(void, void))(**((void **)this + 20) + 48))(*((void *)this + 20), 0);
                long long v30 = *v69;
                long long v32 = (const unsigned __int8 *)(v69[1] - *v69);
              }
              SEUpdaterUtil::SELogPrintBinary((SEUpdaterUtil *)1, (int)v30, v32);
            }
          }
          else if (!v28)
          {
            goto LABEL_51;
          }
        }
        int v18 = v27;
      }
    }
    SEUpdaterUtil::assertSW((uint64_t)&v68, (const SERestoreInfo::RApdu *)"Fail to sendApdus", v22);
    uint64_t v68 = &unk_26DD73620;
    if (v70) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v70);
    }
    v20 += 32;
    v19 += 32;
  }
  while (v20 != v55);
LABEL_65:
  v66.__r_.__value_.__r.__words[0] = (std::string::size_type)&v54;
  std::vector<SERestoreInfo::BLOB>::__destroy_vector::operator()[abi:ne180100]((void ***)&v66);
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)&v50);
  long long v39 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  long long v40 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v39);
  }
  long long v41 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  std::string::basic_string[abi:ne180100]<0>(v47, (char *)&unk_22936E3AF);
  SERestoreInfo::ImageBinary::print((int *)&v59, (uint64_t)v47);
  if ((v66.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    long long v42 = &v66;
  }
  else {
    long long v42 = (std::string *)v66.__r_.__value_.__r.__words[0];
  }
  SEUpdaterUtil::SELogObj::printLog(v40, (SEUpdaterUtil::SELogObj *)2, 0, 1, "doOneAction", (SEUpdaterUtil::SELogObj *)"Successfully pushed binary: %s\n", (const char *)v42);
  if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v66.__r_.__value_.__l.__data_);
  }
  if (v48 < 0) {
    operator delete(v47[0]);
  }
  if (v41) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v41);
  }
  std::string::basic_string[abi:ne180100]<0>(&v66, "singleStep");
  uint64_t v43 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__count_unique<std::string>((uint64_t)v46, (const void **)&v66.__r_.__value_.__l.__data_);
  if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v66.__r_.__value_.__l.__data_);
  }
  if (v43)
  {
    puts("type return to continue");
    do
      int v44 = getchar() << 24;
    while (v44 != 167772160 && v44 != 218103808);
  }
  v66.__r_.__value_.__r.__words[0] = (std::string::size_type)&v63;
  std::vector<SERestoreInfo::BLOB>::__destroy_vector::operator()[abi:ne180100]((void ***)&v66);
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)((char *)&v59 + 8));
}

void sub_229349A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, SERestoreInfo::BLOB *a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,void *a39,uint64_t a40,int a41,__int16 a42,char a43,char a44)
{
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  *(void *)(v44 - 128) = &unk_26DD73620;
  long long v46 = *(std::__shared_weak_count **)(v44 - 112);
  if (v46) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v46);
  }
  SERestoreInfo::ImageBinary::~ImageBinary((SERestoreInfo::ImageBinary *)&a24);
  SERestoreInfo::ImageBinary::~ImageBinary((SERestoreInfo::ImageBinary *)&a39);
  _Unwind_Resume(a1);
}

void SEUpdater::CommandTriggerOSU::~CommandTriggerOSU(SEUpdater::CommandTriggerOSU *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandSelectCRS::~CommandSelectCRS(SEUpdater::CommandSelectCRS *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandSetFTAActivation::~CommandSetFTAActivation(SEUpdater::CommandSetFTAActivation *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::P73BaseUpdateController::getSEHealthCheckResult(SEUpdater::P73BaseUpdateController *this)
{
  SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v3, 0x2037uLL);
  BOOL v3 = &unk_26DD735C8;
  if (*(unsigned char *)(*((void *)this + 20) + 16)) {
    SEUpdater::CommandGetLogStatus::CommandGetLogStatus((SEUpdater::CommandGetLogStatus *)&v2);
  }
  SEUpdater::CommandSelectISD::CommandSelectISD((SEUpdater::CommandSelectISD *)&v2);
}

void sub_22934AA04(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  *(void *)(v1 - 104) = &unk_26DD73620;
  BOOL v3 = *(std::__shared_weak_count **)(v1 - 88);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(a1);
}

void SEUpdater::CommandGetLogStatus::~CommandGetLogStatus(SEUpdater::CommandGetLogStatus *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

unint64_t SERestoreInfo::RApdu::getDataSize(SERestoreInfo::RApdu *this)
{
  unint64_t v1 = *(void *)(*((void *)this + 1) + 8) - **((void **)this + 1);
  if (v1 <= 1) {
    __assert_rtn("getDataSize", "Apdu.hpp", 382, "len >= 2");
  }
  return v1 - 2;
}

void SEUpdater::CommandMarkForDeleteAll::~CommandMarkForDeleteAll(SEUpdater::CommandMarkForDeleteAll *this)
{
  *(void *)this = &unk_26DD73620;
  unint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  unint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandSelectSeshat::~CommandSelectSeshat(SEUpdater::CommandSelectSeshat *this)
{
  *(void *)this = &unk_26DD73620;
  unint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  unint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandSeshatKillAllSlots::~CommandSeshatKillAllSlots(SEUpdater::CommandSeshatKillAllSlots *this)
{
  *(void *)this = &unk_26DD73620;
  unint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  unint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::P73BaseUpdateController::deactivateAll(SEUpdater::P73BaseUpdateController *this, const char *a2)
{
  SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v3, 0x2037uLL);
  BOOL v3 = &unk_26DD735C8;
  SEUpdater::CommandSelectCRS::CommandSelectCRS((SEUpdater::CommandSelectCRS *)&v2);
}

void sub_22934B120(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  *(void *)(v1 - 64) = &unk_26DD73620;
  BOOL v3 = *(std::__shared_weak_count **)(v1 - 48);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(a1);
}

void SEUpdater::CommandCRSDeactivateAll::~CommandCRSDeactivateAll(SEUpdater::CommandCRSDeactivateAll *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandCRSGetDataPersoState::~CommandCRSGetDataPersoState(SEUpdater::CommandCRSGetDataPersoState *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

uint64_t SEUpdater::getForceUpdateLoop(uint64_t **a1)
{
  std::string::basic_string[abi:ne180100]<0>(&__p, "forceUpdate");
  uint64_t v2 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__count_unique<std::string>((uint64_t)a1, (const void **)&__p.__r_.__value_.__l.__data_);
  unint64_t v3 = v2;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (!v3) {
      return v3;
    }
  }
  else if (!v2)
  {
    return v3;
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "forceUpdate");
  v9[0] = &__p;
  uint64_t v4 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(a1, (const void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, (_OWORD **)v9);
  if (*((char *)v4 + 79) < 0) {
    uint64_t v5 = *((void *)v4 + 8);
  }
  else {
    uint64_t v5 = *((unsigned __int8 *)v4 + 79);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (v5) {
      goto LABEL_10;
    }
    return 1;
  }
  if (!v5) {
    return 1;
  }
LABEL_10:
  std::string::basic_string[abi:ne180100]<0>(v9, "forceUpdate");
  unint64_t v12 = v9;
  unsigned int v6 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(a1, (const void **)v9, (uint64_t)&std::piecewise_construct, (_OWORD **)&v12);
  uint64_t v7 = (char *)v6 + 56;
  if (*((char *)v6 + 79) < 0) {
    uint64_t v7 = *(char **)v7;
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, v7);
  unint64_t v3 = std::stoul(&__p, 0, 10);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v10 < 0) {
    operator delete(v9[0]);
  }
  return v3;
}

#error "22934B518: call analysis failed (funcsize=74)"

void SEUpdater::P73BaseUpdateController::PerformSLAMMigrations(SEUpdater::P73BaseUpdateController *this)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v1 = *((void *)this + 21);
  uint64_t v2 = *((void *)this + 20);
  uint64_t v3 = v1;
  if (v1) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v1 + 8), 1uLL, memory_order_relaxed);
  }
  SEUpdater::GetPackageInfo();
}

void sub_22934D04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  if (SLOBYTE(STACK[0x357]) < 0) {
    operator delete((void *)STACK[0x340]);
  }
  if (LOBYTE(STACK[0x558]))
  {
    STACK[0x340] = (unint64_t)&STACK[0x540];
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&STACK[0x340]);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v45);
  if (v46) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v46);
  }
  STACK[0x540] = (unint64_t)&a40;
  std::vector<SLAM::Migration::Trigger>::__destroy_vector::operator()[abi:ne180100]((void ***)&STACK[0x540]);
  STACK[0x540] = (unint64_t)&a45;
  std::vector<SEUpdater::PackageInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&STACK[0x540]);
  _Unwind_Resume(a1);
}

void SEUpdater::P73BaseUpdateController::doPerform(void)::CommandGetDataOBKG::CommandGetDataOBKG(void *a1)
{
}

void *SEUpdater::P73BaseUpdateController::doPerform(void)::CommandGetDataOBKG::~CommandGetDataOBKG(void *a1)
{
  *a1 = &unk_26DD73620;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void *SEUpdater::P73BaseUpdateController::doPerform(void)::CommandSelectASD::~CommandSelectASD(void *a1)
{
  *a1 = &unk_26DD73620;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void SEUpdater::CommandGetAMState::~CommandGetAMState(SEUpdater::CommandGetAMState *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandSeshatGetData::~CommandSeshatGetData(SEUpdater::CommandSeshatGetData *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandGetOSUpdateLog::~CommandGetOSUpdateLog(SEUpdater::CommandGetOSUpdateLog *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandGetPlatformIdentifier::~CommandGetPlatformIdentifier(SEUpdater::CommandGetPlatformIdentifier *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandUpdateTableQuery::~CommandUpdateTableQuery(SEUpdater::CommandUpdateTableQuery *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandGetAllLogs::~CommandGetAllLogs(SEUpdater::CommandGetAllLogs *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandGetAttackLog::~CommandGetAttackLog(SEUpdater::CommandGetAttackLog *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandDumpSENVM::~CommandDumpSENVM(SEUpdater::CommandDumpSENVM *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void *std::ofstream::~ofstream(void *a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B0];
  uint64_t v3 = *MEMORY[0x263F8C2B0];
  *a1 = *MEMORY[0x263F8C2B0];
  *(void *)((char *)a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  MEMORY[0x22A6B64D0](a1 + 1);
  std::ostream::~ostream();
  MEMORY[0x22A6B6710](a1 + 52);
  return a1;
}

void *SEUpdater::P73BaseUpdateController::CheckAndInstallOasisApplet(void)::CommandSelectOasis::~CommandSelectOasis(void *a1)
{
  *a1 = &unk_26DD73620;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void *SEUpdater::P73BaseUpdateController::CheckAndInstallOasisApplet(void)::CommandGetConfigID::~CommandGetConfigID(void *a1)
{
  *a1 = &unk_26DD73620;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void SEUpdater::P73BaseUpdateController::isSIMDetectGPIOConfiguredWithWPD(SERestoreInfo::P73BaseDeviceInfo **this)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  SERestoreInfo::CApdu::CApdu((SERestoreInfo::CApdu *)&v3);
  if (SERestoreInfo::P73BaseDeviceInfo::isDev(this[16]))
  {
    long long v8 = xmmword_22936BAC7;
    v9[0] = unk_22936BAD7;
    *(_OWORD *)((char *)v9 + 15) = unk_22936BAE6;
    long long v4 = xmmword_22936BA87;
    long long v5 = unk_22936BA97;
    long long v6 = xmmword_22936BAA7;
    long long v7 = unk_22936BAB7;
    SERestoreInfo::CApdu::CApdu(&v2);
  }
  long long v8 = xmmword_22936BA28;
  v9[0] = unk_22936BA38;
  *(_OWORD *)((char *)v9 + 15) = unk_22936BA47;
  long long v4 = xmmword_22936B9E8;
  long long v5 = unk_22936B9F8;
  long long v6 = xmmword_22936BA08;
  long long v7 = unk_22936BA18;
  SERestoreInfo::CApdu::CApdu(&v2);
}

void sub_22934E0A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,std::__shared_weak_count *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,std::__shared_weak_count *a35)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  if (a35) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a35);
  }
  if (a28) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a28);
  }
  _Unwind_Resume(exception_object);
}

void SEUpdater::CommandGetConfigItem4143_Eos_Prod::~CommandGetConfigItem4143_Eos_Prod(SEUpdater::CommandGetConfigItem4143_Eos_Prod *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandGetConfigItem4143_Eos_Dev::~CommandGetConfigItem4143_Eos_Dev(SEUpdater::CommandGetConfigItem4143_Eos_Dev *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandSetConfigItem4143_WPD_Eos_Prod::~CommandSetConfigItem4143_WPD_Eos_Prod(SEUpdater::CommandSetConfigItem4143_WPD_Eos_Prod *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandSetConfigItem4143_HiZ_Eos_Prod::~CommandSetConfigItem4143_HiZ_Eos_Prod(SEUpdater::CommandSetConfigItem4143_HiZ_Eos_Prod *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandSetConfigItem4143_WPD_Eos_Dev::~CommandSetConfigItem4143_WPD_Eos_Dev(SEUpdater::CommandSetConfigItem4143_WPD_Eos_Dev *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandSetConfigItem4143_HiZ_Eos_Dev::~CommandSetConfigItem4143_HiZ_Eos_Dev(SEUpdater::CommandSetConfigItem4143_HiZ_Eos_Dev *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandGetConfigItem412A_Mem_Reserve_Eos_Prod::~CommandGetConfigItem412A_Mem_Reserve_Eos_Prod(SEUpdater::CommandGetConfigItem412A_Mem_Reserve_Eos_Prod *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandGetConfigItem412A_Mem_Reserve_Eos_ProdEval::~CommandGetConfigItem412A_Mem_Reserve_Eos_ProdEval(SEUpdater::CommandGetConfigItem412A_Mem_Reserve_Eos_ProdEval *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandGetConfigItem412A_Mem_Reserve_Eos_Dev::~CommandGetConfigItem412A_Mem_Reserve_Eos_Dev(SEUpdater::CommandGetConfigItem412A_Mem_Reserve_Eos_Dev *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandSetConfigItem412A_Mem_Reserve_Eos_Prod::~CommandSetConfigItem412A_Mem_Reserve_Eos_Prod(SEUpdater::CommandSetConfigItem412A_Mem_Reserve_Eos_Prod *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandSetConfigItem412A_Mem_Reserve_Eos_ProdEval::~CommandSetConfigItem412A_Mem_Reserve_Eos_ProdEval(SEUpdater::CommandSetConfigItem412A_Mem_Reserve_Eos_ProdEval *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandSetConfigItem412A_Mem_Reserve_Eos_Dev::~CommandSetConfigItem412A_Mem_Reserve_Eos_Dev(SEUpdater::CommandSetConfigItem412A_Mem_Reserve_Eos_Dev *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandGetConfigItem415E_Index_Table_Defragmentation_Eos_Prod::~CommandGetConfigItem415E_Index_Table_Defragmentation_Eos_Prod(SEUpdater::CommandGetConfigItem415E_Index_Table_Defragmentation_Eos_Prod *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandGetConfigItem415E_Index_Table_Defragmentation_Eos_ProdEval::~CommandGetConfigItem415E_Index_Table_Defragmentation_Eos_ProdEval(SEUpdater::CommandGetConfigItem415E_Index_Table_Defragmentation_Eos_ProdEval *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandGetConfigItem415E_Index_Table_Defragmentation_Eos_Dev::~CommandGetConfigItem415E_Index_Table_Defragmentation_Eos_Dev(SEUpdater::CommandGetConfigItem415E_Index_Table_Defragmentation_Eos_Dev *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandSetConfigItem415E_Index_Table_Defragmentation_Disable_Eos_Dev::~CommandSetConfigItem415E_Index_Table_Defragmentation_Disable_Eos_Dev(SEUpdater::CommandSetConfigItem415E_Index_Table_Defragmentation_Disable_Eos_Dev *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

uint64_t ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t SEUpdater::getOBJPOctetString(void *a1)
{
  Img4DecodeGetObjectPropertyData();
  uint64_t result = 0;
  *a1 = 0;
  return result;
}

void std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0)
  {
    long long v2 = *(void **)a1;
    operator delete(v2);
  }
}

uint64_t std::__optional_destruct_base<AlohaPairingOptions,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)(a1 + 24));
    ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)(a1 + 16));
    ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)(a1 + 8));
  }
  return a1;
}

const void **ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(const void **a1)
{
  long long v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *___ZNK3ctu20SharedSynchronizableIN13SEUpdaterUtil8SELogObjEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 40) + 16))(*(void **)(a1 + 40));
}

__n128 __Block_byref_object_copy__2(void *a1, uint64_t a2)
{
  a1[5] = 0;
  a1[6] = 0;
  a1[7] = 0;
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 5) = result;
  a1[7] = *(void *)(a2 + 56);
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(void *)(a1 + 48) = v2;
    operator delete(v2);
  }
}

void ___ZN13SEUpdaterUtil8SELogObj13dumpLogBufferEv_block_invoke(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  long long v4 = (char **)(v2 + 7);
  if (v2[11]) {
    long long v5 = (char *)v2[9];
  }
  else {
    long long v5 = 0;
  }
  v37[0] = v2 + 7;
  v37[1] = v5;
  v36[0] = v2 + 7;
  v36[1] = 0;
  unint64_t v6 = boost::cb_details::iterator<boost::circular_buffer<unsigned char,std::allocator<unsigned char>>,boost::cb_details::nonconst_traits<std::allocator<unsigned char>>>::operator-<boost::cb_details::nonconst_traits<std::allocator<unsigned char>>>((uint64_t)v36, (uint64_t)v37);
  unint64_t v7 = v3[7];
  long long v8 = (unsigned char *)v3[5];
  if (v7 - (unint64_t)v8 < v6)
  {
    if (v8)
    {
      void v3[6] = v8;
      operator delete(v8);
      unint64_t v7 = 0;
      v3[5] = 0;
      void v3[6] = 0;
      v3[7] = 0;
    }
    if ((v6 & 0x8000000000000000) != 0) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v9 = 2 * v7;
    if (2 * v7 <= v6) {
      uint64_t v9 = v6;
    }
    if (v7 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v10 = v9;
    }
    std::vector<unsigned char>::__vallocate[abi:ne180100](v3 + 5, v10);
    uint64_t v11 = (unsigned char *)v3[6];
    if (v5)
    {
      do
      {
        char v12 = *v5++;
        *uint64_t v11 = v12;
        if (v5 == (char *)v2[8]) {
          long long v5 = *v4;
        }
        ++v11;
      }
      while (v5 && v5 != (char *)v2[10]);
    }
    goto LABEL_48;
  }
  unint64_t v13 = (unsigned char *)v3[6];
  uint64_t v14 = v13 - v8;
  if (v13 - v8 < v6)
  {
    if (v14 < 1)
    {
      if ((v14 & 0x8000000000000000) == 0)
      {
LABEL_40:
        uint64_t v19 = v13;
        if (v5)
        {
          uint64_t v19 = v13;
          uint64_t v20 = v13;
          do
          {
            char v21 = *v5++;
            *uint64_t v20 = v21;
            if (v5 == (char *)v2[8]) {
              long long v5 = *v4;
            }
            ++v19;
            if (!v5) {
              break;
            }
            ++v20;
          }
          while (v5 != (char *)v2[10]);
        }
        uint64_t v11 = v19;
        goto LABEL_48;
      }
      long long v35 = v5;
      if (!v5) {
        long long v35 = (char *)v2[10];
      }
      if (v35 - *v4 < v8 - v13) {
        uint64_t v14 = v14 - (void)*v4 + v2[8];
      }
      unint64_t v16 = &v35[v14];
    }
    else
    {
      uint64_t v15 = v2[8];
      if (v15 - (uint64_t)v5 <= v14) {
        uint64_t v14 = (uint64_t)&(*v4)[v14 - v15];
      }
      unint64_t v16 = &v5[v14];
      if (v16 == (char *)v2[10]) {
        unint64_t v16 = 0;
      }
    }
    if (v16 != v5)
    {
      do
      {
        char v17 = *v5++;
        *long long v8 = v17;
        if (v5 == (char *)v2[8]) {
          long long v5 = *v4;
        }
        if (v5 == (char *)v2[10]) {
          long long v5 = 0;
        }
        ++v8;
      }
      while (v5 != v16);
      unint64_t v13 = (unsigned char *)v3[6];
      long long v5 = v16;
    }
    goto LABEL_40;
  }
  if (v5)
  {
    uint64_t v11 = (unsigned char *)v3[5];
    do
    {
      char v18 = *v5++;
      *long long v8 = v18;
      if (v5 == (char *)v2[8]) {
        long long v5 = *v4;
      }
      ++v11;
      if (!v5) {
        break;
      }
      ++v8;
    }
    while (v5 != (char *)v2[10]);
  }
  else
  {
    uint64_t v11 = (unsigned char *)v3[5];
  }
LABEL_48:
  void v3[6] = v11;
  int v22 = *(void **)(*(void *)(a1 + 32) + 8);
  int v24 = (unsigned char *)v22[6];
  unint64_t v23 = v22[7];
  if ((unint64_t)v24 >= v23)
  {
    unint64_t v26 = v22[5];
    int v27 = &v24[-v26];
    uint64_t v28 = (uint64_t)&v24[-v26 + 1];
    if (v28 < 0) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v29 = v23 - v26;
    if (2 * v29 > v28) {
      uint64_t v28 = 2 * v29;
    }
    if (v29 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v30 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v30 = v28;
    }
    if (v30) {
      uint64_t v31 = operator new(v30);
    }
    else {
      uint64_t v31 = 0;
    }
    long long v32 = &v31[v30];
    v27[(void)v31] = 0;
    uint64_t v25 = (uint64_t)&v27[(void)v31 + 1];
    if (v24 == (unsigned char *)v26)
    {
      uint64_t v31 = &v27[(void)v31];
    }
    else
    {
      long long v33 = &v24[~v26];
      do
      {
        char v34 = *--v24;
        (v33--)[(void)v31] = v34;
      }
      while (v24 != (unsigned char *)v26);
      int v24 = (unsigned char *)v22[5];
    }
    v22[5] = v31;
    v22[6] = v25;
    v22[7] = v32;
    if (v24) {
      operator delete(v24);
    }
  }
  else
  {
    *int v24 = 0;
    uint64_t v25 = (uint64_t)(v24 + 1);
  }
  v22[6] = v25;
}

void std::__throw_bad_optional_access[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3B0] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C200], MEMORY[0x263F8C088]);
}

SERestoreInfo::CApdu *SERestoreInfo::CApdu::CApdu(SERestoreInfo::CApdu *this)
{
  long long v2 = SERestoreInfo::Apdu::Apdu(this, 0x2037uLL);
  *(void *)long long v2 = &unk_26DD73700;
  uint64_t v3 = **((void **)v2 + 1);
  unint64_t v4 = *(void *)(*((void *)v2 + 1) + 8) - v3;
  unint64_t v5 = v4 - 5;
  BOOL v6 = v4 >= 6;
  uint64_t v7 = v3 + 5;
  if (!v6)
  {
    unint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *((void *)v2 + 4) = v7;
  *((void *)v2 + 5) = v5;
  *((void *)v2 + 3) = v3;
  SERestoreInfo::CApdu::validate(v2);
  *((void *)this + 6) = 0;
  return this;
}

void sub_22934EC40(_Unwind_Exception *exception_object)
{
  *uint64_t v1 = &unk_26DD73620;
  uint64_t v3 = (std::__shared_weak_count *)v1[2];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

void SEUpdater::CommandMQ::CommandMQ(SEUpdater::CommandMQ *this)
{
}

const void **ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(const void **a1, const void **a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  if (v3) {
    CFRetain(v3);
  }
  return a1;
}

void SEUpdater::CommandTriggerImg4::CommandTriggerImg4(SEUpdater::CommandTriggerImg4 *this)
{
}

void SEUpdater::CommandSelectCRS::CommandSelectCRS(SEUpdater::CommandSelectCRS *this)
{
}

void SEUpdater::CommandGetLogStatus::CommandGetLogStatus(SEUpdater::CommandGetLogStatus *this)
{
}

void SEUpdater::CommandSelectSeshat::CommandSelectSeshat(SEUpdater::CommandSelectSeshat *this)
{
}

const void **ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(const void **a1)
{
  long long v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

_OWORD *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, _OWORD **a4)
{
  BOOL v6 = (void **)std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_equal<std::string>((uint64_t)a1, &v14, a2);
  uint64_t v7 = *v6;
  if (!*v6)
  {
    long long v8 = (uint64_t **)v6;
    uint64_t v7 = operator new(0x50uLL);
    v12[1] = a1 + 1;
    uint64_t v9 = *a4;
    uint64_t v10 = *((void *)*a4 + 2);
    v7[2] = **a4;
    *((void *)v7 + 6) = v10;
    v9[1] = 0;
    _OWORD v9[2] = 0;
    *uint64_t v9 = 0;
    *((void *)v7 + 8) = 0;
    *((void *)v7 + 9) = 0;
    *((void *)v7 + 7) = 0;
    char v13 = 1;
    std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__insert_node_at(a1, v14, v8, (uint64_t *)v7);
    v12[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)v12, 0);
  }
  return v7;
}

void *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_equal<std::string>(uint64_t a1, void *a2, const void **a3)
{
  unint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        long long v8 = (void *)v4;
        uint64_t v9 = (const void **)(v4 + 32);
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v8;
        unint64_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!std::less<std::string>::operator()[abi:ne180100](v7, v9, a3)) {
        break;
      }
      unint64_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    long long v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

BOOL std::less<std::string>::operator()[abi:ne180100](uint64_t a1, const void **a2, const void **a3)
{
  int v3 = *((char *)a3 + 23);
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  if (v4 >= 0) {
    BOOL v6 = a2;
  }
  else {
    BOOL v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    long long v8 = a3;
  }
  else {
    long long v8 = *a3;
  }
  if (v7 >= v5) {
    size_t v9 = v5;
  }
  else {
    size_t v9 = v7;
  }
  int v10 = memcmp(v6, v8, v9);
  if (v10) {
    return v10 < 0;
  }
  else {
    return v5 < v7;
  }
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  long long v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

void SEUpdater::P73BaseUpdateController::doPerform(void)::CommandGetDataOBKG::~CommandGetDataOBKG(void *a1)
{
  *a1 = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::P73BaseUpdateController::doPerform(void)::CommandSelectASD::~CommandSelectASD(void *a1)
{
  *a1 = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<SLAM::Deletion::Trigger>,SLAM::Deletion::Trigger*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v3 = **(void **)(a1 + 8);
    for (uint64_t i = **(void **)(a1 + 16); i != v3; i -= 48)
    {
      size_t v5 = *(void **)(i - 40);
      if (v5)
      {
        *(void *)(i - 32) = v5;
        operator delete(v5);
      }
    }
  }
  return a1;
}

void std::vector<SLAM::Deletion::Trigger>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  long long v2 = (char *)**a1;
  if (v2)
  {
    int v4 = (char *)v1[1];
    size_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        BOOL v6 = (void *)*((void *)v4 - 5);
        if (v6)
        {
          *((void *)v4 - 4) = v6;
          operator delete(v6);
        }
        v4 -= 48;
      }
      while (v4 != v2);
      size_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t SEUpdater::find_if<std::vector<SEUpdater::PackageInfo>,SEUpdater::FindPackageForModule(std::vector<SEUpdater::PackageInfo> const&,std::vector<unsigned char> const&)::{lambda(std::vector<SEUpdater::PackageInfo> const&)#1}>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a1;
  if (a1 != a2)
  {
    BOOL v6 = *(const void **)a3;
    while (1)
    {
      uint64_t v8 = *(void *)(v3 + 24);
      uint64_t v7 = *(void *)(v3 + 32);
      if (v8 == v7)
      {
LABEL_8:
        uint64_t v8 = v7;
      }
      else
      {
        size_t v9 = *(void *)(a3 + 8) - (void)v6;
        while (*(void *)(v8 + 8) - *(void *)v8 != v9 || memcmp(*(const void **)v8, v6, v9))
        {
          v8 += 24;
          if (v8 == v7) {
            goto LABEL_8;
          }
        }
      }
      if (v7 != v8) {
        break;
      }
      v3 += 48;
      if (v3 == a2) {
        return a2;
      }
    }
  }
  return v3;
}

void SEUpdater::P73BaseUpdateController::CheckAndInstallOasisApplet(void)::CommandSelectOasis::~CommandSelectOasis(void *a1)
{
  *a1 = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::P73BaseUpdateController::CheckAndInstallOasisApplet(void)::CommandGetConfigID::~CommandGetConfigID(void *a1)
{
  *a1 = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<SEUpdater::SLAM::Installation::InstallationTrigger>,SEUpdater::SLAM::Installation::InstallationTrigger*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v2 = **(void **)(a1 + 8);
    uint64_t v3 = **(void **)(a1 + 16);
    if (v3 != v2)
    {
      do
      {
        uint64_t v4 = v3 - 48;
        BOOL v6 = (void **)(v3 - 40);
        std::vector<std::vector<unsigned char>>::__destroy_vector::operator()[abi:ne180100](&v6);
        uint64_t v3 = v4;
      }
      while (v4 != v2);
    }
  }
  return a1;
}

void std::vector<SEUpdater::SLAM::Installation::InstallationTrigger>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    size_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        BOOL v6 = v4 - 48;
        uint64_t v7 = (void **)(v4 - 40);
        std::vector<std::vector<unsigned char>>::__destroy_vector::operator()[abi:ne180100](&v7);
        uint64_t v4 = v6;
      }
      while (v6 != v2);
      size_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void SLAM::Migration::AppletInfo::~AppletInfo(SLAM::Migration::AppletInfo *this)
{
  uint64_t v2 = (void *)*((void *)this + 3);
  if (v2)
  {
    *((void *)this + 4) = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(void **)this;
  if (*(void *)this)
  {
    *((void *)this + 1) = v3;
    operator delete(v3);
  }
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<SLAM::Migration::AppletInfo>,SLAM::Migration::AppletInfo const*,SLAM::Migration::AppletInfo const*,SLAM::Migration::AppletInfo*>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = a1 + v6;
      uint64_t v8 = (void *)(a3 + v6);
      *uint64_t v8 = 0;
      v8[1] = 0;
      v8[2] = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>((void *)(a3 + v6), *(const void **)(a1 + v6), *(void *)(a1 + v6 + 8), *(void *)(a1 + v6 + 8) - *(void *)(a1 + v6));
      void v8[3] = 0;
      unint64_t v8[4] = 0;
      size_t v9 = (void *)(a3 + v6 + 24);
      _OWORD v9[2] = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v9, *(const void **)(v7 + 24), *(void *)(v7 + 32), *(void *)(v7 + 32) - *(void *)(v7 + 24));
      uint64_t v10 = a3 + v6;
      long long v11 = *(_OWORD *)(a1 + v6 + 48);
      *(void *)(v10 + 64) = *(void *)(a1 + v6 + 64);
      *(_OWORD *)(v10 + 48) = v11;
      v6 += 72;
    }
    while (v7 + 72 != a2);
    a3 += v6;
  }
  return a3;
}

void sub_229350168(_Unwind_Exception *exception_object)
{
  uint64_t v4 = *(void **)(v1 + v2);
  if (v4)
  {
    *(void *)(v1 + v2 + 8) = v4;
    operator delete(v4);
  }
  if (v2)
  {
    uint64_t v5 = v1 - 72;
    do
    {
      std::allocator<SLAM::Migration::AppletInfo>::destroy[abi:ne180100](v5 + v2);
      v2 -= 72;
    }
    while (v2);
  }
  _Unwind_Resume(exception_object);
}

void std::allocator<SLAM::Migration::AppletInfo>::destroy[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(void *)(a1 + 32) = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v3;
    operator delete(v3);
  }
}

void std::vector<SLAM::Migration::AppletInfo>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 72;
        std::allocator<SLAM::Migration::AppletInfo>::destroy[abi:ne180100](v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<SLAM::Migration::Trigger>,SLAM::Migration::Trigger*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v2 = **(void **)(a1 + 8);
    uint64_t v3 = **(void **)(a1 + 16);
    if (v3 != v2)
    {
      do
      {
        uint64_t v4 = v3 - 48;
        uint64_t v6 = (void **)(v3 - 40);
        std::vector<SLAM::Migration::AppletInfo>::__destroy_vector::operator()[abi:ne180100](&v6);
        uint64_t v3 = v4;
      }
      while (v4 != v2);
    }
  }
  return a1;
}

void std::vector<SLAM::Migration::Trigger>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v6 = v4 - 48;
        uint64_t v7 = (void **)(v4 - 40);
        std::vector<SLAM::Migration::AppletInfo>::__destroy_vector::operator()[abi:ne180100](&v7);
        uint64_t v4 = v6;
      }
      while (v6 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

unint64_t SEUpdater::bigEndianFromRange(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 - a3;
  if (a4 <= a3) {
    return 0;
  }
  unint64_t v6 = a2 - a1 - a3;
  if (a2 - a1 < a3) {
    unint64_t v6 = 0;
  }
  if (v6 <= a4 + ~a3) {
    std::vector<std::vector<unsigned short>>::__throw_out_of_range[abi:ne180100]();
  }
  unint64_t result = 0;
  uint64_t v8 = (unsigned __int8 *)(a1 + a3);
  do
  {
    unsigned int v9 = *v8++;
    unint64_t result = v9 | (result << 8);
    --v4;
  }
  while (v4);
  return result;
}

void *ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(void *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf) {
    CFRetain(cf);
  }
  return a1;
}

const void **ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(uint64_t a1, char *__dst, char *__src, char *a4, int64_t a5)
{
  if (a5 < 1) {
    return;
  }
  uint64_t v10 = *(unsigned char **)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9 - (uint64_t)v10 < a5)
  {
    long long v11 = *(char **)a1;
    uint64_t v12 = (uint64_t)&v10[a5 - *(void *)a1];
    if (v12 < 0) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    char v13 = (char *)(__dst - v11);
    unint64_t v14 = v9 - (void)v11;
    if (2 * v14 > v12) {
      uint64_t v12 = 2 * v14;
    }
    if (v14 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v15 = v12;
    }
    if (v15) {
      unint64_t v16 = (char *)operator new(v15);
    }
    else {
      unint64_t v16 = 0;
    }
    unint64_t v26 = &v13[(void)v16];
    memcpy(&v13[(void)v16], __src, a5);
    if (v11 == __dst)
    {
      int v27 = &v13[(void)v16];
    }
    else
    {
      do
      {
        v13[(void)v16 - 1] = v13[(void)(v11 - 1)];
        --v13;
      }
      while (v13);
      uint64_t v10 = *(unsigned char **)(a1 + 8);
      int v27 = v16;
    }
    uint64_t v28 = &v26[a5];
    unint64_t v29 = &v16[v15];
    if (v10 != __dst) {
      memmove(v28, __dst, v10 - __dst);
    }
    size_t v30 = *(char **)a1;
    *(void *)a1 = v27;
    *(void *)(a1 + 8) = &v28[v10 - __dst];
    *(void *)(a1 + 16) = v29;
    if (v30)
    {
      operator delete(v30);
    }
    return;
  }
  uint64_t v17 = v10 - __dst;
  if (v10 - __dst >= a5)
  {
    char v18 = &__src[a5];
    uint64_t v20 = *(unsigned char **)(a1 + 8);
LABEL_17:
    char v21 = &__dst[a5];
    int v22 = &v20[-a5];
    unint64_t v23 = v20;
    if (&v20[-a5] < v10)
    {
      int v24 = (char *)(&v10[a5] - v20);
      unint64_t v23 = v20;
      do
      {
        char v25 = *v22++;
        *v23++ = v25;
        --v24;
      }
      while (v24);
    }
    *(void *)(a1 + 8) = v23;
    if (v20 != v21) {
      memmove(&__dst[a5], __dst, v20 - v21);
    }
    if (v18 != __src)
    {
      memmove(__dst, __src, v18 - __src);
    }
    return;
  }
  char v18 = &__src[v17];
  int64_t v19 = a4 - &__src[v17];
  if (a4 != &__src[v17]) {
    memmove(*(void **)(a1 + 8), &__src[v17], a4 - &__src[v17]);
  }
  uint64_t v20 = &v10[v19];
  *(void *)(a1 + 8) = &v10[v19];
  if (v17 >= 1) {
    goto LABEL_17;
  }
}

uint64_t std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__count_unique<std::string>(uint64_t a1, const void **a2)
{
  uint64_t v2 = *(const void ***)(a1 + 8);
  if (v2)
  {
    uint64_t v4 = a1 + 16;
    uint64_t v5 = 1;
    do
    {
      if (!std::less<std::string>::operator()[abi:ne180100](v4, a2, v2 + 4))
      {
        if (!std::less<std::string>::operator()[abi:ne180100](v4, v2 + 4, a2)) {
          return v5;
        }
        ++v2;
      }
      uint64_t v2 = (const void **)*v2;
    }
    while (v2);
  }
  return 0;
}

void std::__shared_ptr_emplace<SEUpdater::P73BaseSEController>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD749A0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SEUpdater::P73BaseSEController>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD749A0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__shared_ptr_emplace<SEUpdater::P73BaseSEController>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__tree<std::string>::destroy(char *a1)
{
  if (a1)
  {
    std::__tree<std::string>::destroy(*(void *)a1);
    std::__tree<std::string>::destroy(*((void *)a1 + 1));
    if (a1[55] < 0) {
      operator delete(*((void **)a1 + 4));
    }
    operator delete(a1);
  }
}

void std::__shared_ptr_emplace<SERestoreInfo::P73DeviceInfo>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD749F0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SERestoreInfo::P73DeviceInfo>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD749F0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__shared_ptr_emplace<SERestoreInfo::P73DeviceInfo>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<SERestoreInfo::SN100VDeviceInfo>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD74A40;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SERestoreInfo::SN100VDeviceInfo>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD74A40;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__shared_ptr_emplace<SERestoreInfo::SN100VDeviceInfo>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<SERestoreInfo::SN200VDeviceInfo>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD74A90;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SERestoreInfo::SN200VDeviceInfo>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD74A90;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__shared_ptr_emplace<SERestoreInfo::SN200VDeviceInfo>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<SERestoreInfo::SN210VDeviceInfo>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD74AE0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SERestoreInfo::SN210VDeviceInfo>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD74AE0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__shared_ptr_emplace<SERestoreInfo::SN210VDeviceInfo>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<SERestoreInfo::SN300VDeviceInfo>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD74B30;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SERestoreInfo::SN300VDeviceInfo>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD74B30;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__shared_ptr_emplace<SERestoreInfo::SN300VDeviceInfo>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<SERestoreInfo::SE310SDeviceInfo>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD74B80;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SERestoreInfo::SE310SDeviceInfo>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD74B80;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__shared_ptr_emplace<SERestoreInfo::SE310SDeviceInfo>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<SERestoreInfo::SN300V2DeviceInfo>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD74BD0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SERestoreInfo::SN300V2DeviceInfo>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD74BD0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__shared_ptr_emplace<SERestoreInfo::SN300V2DeviceInfo>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void SEUpdaterUtil::_AddError(SEUpdaterUtil *this, int a2, uint64_t a3, SEUpdaterUtil::SELogObj *a4, const char *a5, ...)
{
  va_start(va, a5);
  if (!a4) {
    __assert_rtn("_AddError", "Error.hpp", 66, "fmt");
  }
  int v6 = (int)this;
  va_copy(v17, va);
  SEUpdaterUtil::SELogToStrv(0, a4, va, 0, a3, __p);
  uint64_t v7 = (SEUpdaterUtil::Error *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::Error,SEUpdaterUtil::Error,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::Error>>::sInstance);
  uint64_t v8 = xmmword_268315F60;
  if (!(void)xmmword_268315F60) {
    SEUpdaterUtil::Error::create_default_global(v7);
  }
  uint64_t v9 = (std::__shared_weak_count *)*((void *)&xmmword_268315F60 + 1);
  if (*((void *)&xmmword_268315F60 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_268315F60 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::Error,SEUpdaterUtil::Error,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::Error>>::sInstance);
  SEUpdaterUtil::Error::addError(v8, (uint64_t)__p, v6);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  if (a2)
  {
    unint64_t v10 = v16;
    if ((v16 & 0x80u) != 0) {
      unint64_t v10 = (unint64_t)__p[1];
    }
    if (v10)
    {
      long long v11 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
      uint64_t v12 = (SEUpdaterUtil::SELogObj *)off_268315F10;
      if (!off_268315F10) {
        SEUpdaterUtil::SELogObj::create_default_global(v11);
      }
      char v13 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
      if (*(&off_268315F10 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
      }
      pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
      unint64_t v14 = __p;
      if ((v16 & 0x80u) != 0) {
        unint64_t v14 = (void **)__p[0];
      }
      SEUpdaterUtil::SELogObj::printLog(v12, 0, 0, 0, 0, (SEUpdaterUtil::SELogObj *)"%s\n", (const char *)v14);
      if (v13) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v13);
      }
    }
  }
  if ((char)v16 < 0) {
    operator delete(__p[0]);
  }
}

void sub_2293514E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void *SEUpdaterUtil::SELogToStrv@<X0>(SEUpdaterUtil *this@<X0>, SEUpdaterUtil::SELogObj *a2@<X2>, va_list a3@<X3>, char *a4@<X4>, uint64_t a5@<X1>, void *a6@<X8>)
{
  v16[4] = *MEMORY[0x263EF8340];
  SEUpdaterUtil::SELogObj::FormatMsgv(a2, a3, &v15);
  if (!v15) {
    goto LABEL_11;
  }
  unint64_t v10 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v10);
  }
  long long v11 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  SEUpdaterUtil::SELogObj::createVerboseLogString(this, v15, a4, a5, &__s);
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  if (!__s)
  {
    std::unique_ptr<char const,std::function<void ()(char const*)>>::reset[abi:ne180100]((uint64_t *)&__s, 0);
    std::__function::__value_func<void ()(char const*)>::~__value_func[abi:ne180100](v14);
LABEL_11:
    *a6 = 0;
    a6[1] = 0;
    a6[2] = 0;
    goto LABEL_12;
  }
  std::string::basic_string[abi:ne180100]<0>(a6, __s);
  std::unique_ptr<char const,std::function<void ()(char const*)>>::reset[abi:ne180100]((uint64_t *)&__s, 0);
  std::__function::__value_func<void ()(char const*)>::~__value_func[abi:ne180100](v14);
LABEL_12:
  std::unique_ptr<char const,std::function<void ()(char const*)>>::reset[abi:ne180100]((uint64_t *)&v15, 0);
  return std::__function::__value_func<void ()(char const*)>::~__value_func[abi:ne180100](v16);
}

void sub_2293516C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  std::unique_ptr<char const,std::function<void ()(char const*)>>::reset[abi:ne180100]((uint64_t *)va, 0);
  std::__function::__value_func<void ()(char const*)>::~__value_func[abi:ne180100]((uint64_t *)va1);
  _Unwind_Resume(a1);
}

void SEUpdaterUtil::Error::create_default_global(SEUpdaterUtil::Error *this)
{
}

void std::shared_ptr<SEUpdaterUtil::Error>::shared_ptr[abi:ne180100]<SEUpdaterUtil::Error,std::shared_ptr<SEUpdaterUtil::Error> ctu::SharedSynchronizable<SEUpdaterUtil::Error>::make_shared_ptr<SEUpdaterUtil::Error>(SEUpdaterUtil::Error*)::{lambda(SEUpdaterUtil::Error*)#1},void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_229351818(void *a1)
{
  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[2], v1, (dispatch_function_t)std::shared_ptr<SEUpdaterUtil::Error> ctu::SharedSynchronizable<SEUpdaterUtil::Error>::make_shared_ptr<SEUpdaterUtil::Error>(SEUpdaterUtil::Error*)::{lambda(SEUpdaterUtil::Error*)#1}::operator() const(SEUpdaterUtil::Error*)::{lambda(void *)#1}::__invoke);
  __cxa_rethrow();
}

void sub_229351840(_Unwind_Exception *a1)
{
}

void std::__shared_ptr_pointer<SEUpdaterUtil::Error *,std::shared_ptr<SEUpdaterUtil::Error> ctu::SharedSynchronizable<SEUpdaterUtil::Error>::make_shared_ptr<SEUpdaterUtil::Error>(SEUpdaterUtil::Error*)::{lambda(SEUpdaterUtil::Error *)#1},std::allocator<SEUpdaterUtil::Error>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

void std::__shared_ptr_pointer<SEUpdaterUtil::Error *,std::shared_ptr<SEUpdaterUtil::Error> ctu::SharedSynchronizable<SEUpdaterUtil::Error>::make_shared_ptr<SEUpdaterUtil::Error>(SEUpdaterUtil::Error*)::{lambda(SEUpdaterUtil::Error *)#1},std::allocator<SEUpdaterUtil::Error>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<SEUpdaterUtil::Error *,std::shared_ptr<SEUpdaterUtil::Error> ctu::SharedSynchronizable<SEUpdaterUtil::Error>::make_shared_ptr<SEUpdaterUtil::Error>(SEUpdaterUtil::Error*)::{lambda(SEUpdaterUtil::Error *)#1},std::allocator<SEUpdaterUtil::Error>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t std::shared_ptr<SEUpdaterUtil::Error> ctu::SharedSynchronizable<SEUpdaterUtil::Error>::make_shared_ptr<SEUpdaterUtil::Error>(SEUpdaterUtil::Error*)::{lambda(SEUpdaterUtil::Error*)#1}::operator() const(SEUpdaterUtil::Error*)::{lambda(void *)#1}::__invoke(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    uint64_t v3 = (void **)(result + 32);
    std::vector<std::pair<std::string,int>>::__destroy_vector::operator()[abi:ne180100](&v3);
    uint64_t v2 = ctu::SharedSynchronizable<SEUpdaterUtil::Error>::~SharedSynchronizable(v1);
    return MEMORY[0x22A6B67D0](v2, 0x20C400FA29667);
  }
  return result;
}

void *ctu::SharedSynchronizable<SEUpdaterUtil::Error>::~SharedSynchronizable(void *a1)
{
  uint64_t v2 = a1[3];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[2];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[1];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void std::vector<std::pair<std::string,int>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::pair<std::string,int>>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void *ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(void *a1, CFTypeRef *a2)
{
  CFTypeRef v3 = *a2;
  if (*a2)
  {
    CFTypeID v4 = CFGetTypeID(*a2);
    if (v4 == CFDataGetTypeID()) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(a1, v5);
}

void *std::allocate_shared[abi:ne180100]<SERestoreInfo::BLOB,std::allocator<SERestoreInfo::BLOB>,__CFData const*,void>@<X0>(CFTypeRef *a1@<X1>, void *a2@<X8>)
{
  CFTypeID v4 = operator new(0x38uLL);
  unint64_t result = std::__shared_ptr_emplace<SERestoreInfo::BLOB>::__shared_ptr_emplace[abi:ne180100]<__CFData const*,std::allocator<SERestoreInfo::BLOB>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_229351A94(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<SERestoreInfo::BLOB>::__shared_ptr_emplace[abi:ne180100]<__CFData const*,std::allocator<SERestoreInfo::BLOB>,0>(void *a1, CFTypeRef *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26DD74C20;
  SERestoreInfo::BLOB::BLOB((SERestoreInfo::BLOB *)(a1 + 3), *a2);
  return a1;
}

void sub_229351AF4(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<SERestoreInfo::BLOB>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD74C20;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SERestoreInfo::BLOB>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD74C20;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__shared_ptr_emplace<SERestoreInfo::BLOB>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

SERestoreInfo::BLOB *SERestoreInfo::BLOB::BLOB(SERestoreInfo::BLOB *this, CFTypeRef cf)
{
  *(void *)this = &unk_26DD73970;
  CFDataRef v3 = (const __CFData *)CFRetain(cf);
  *((void *)this + 3) = v3;
  *((void *)this + 1) = CFDataGetBytePtr(v3);
  *((void *)this + 2) = CFDataGetLength(*((CFDataRef *)this + 3));
  return this;
}

void std::__shared_ptr_emplace<SERestoreInfo::P73BaseFirmware>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD74C70;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SERestoreInfo::P73BaseFirmware>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD74C70;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__shared_ptr_emplace<SERestoreInfo::P73BaseFirmware>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::allocate_shared[abi:ne180100]<SEUpdater::SEHandleShim,std::allocator<SEUpdater::SEHandleShim>,std::shared_ptr<SEUpdater::P73BaseSEController> &,void>(void *a1, uint64_t a2, std::__shared_weak_count *a3)
{
  int v6 = operator new(0x30uLL);
  uint64_t v7 = v6;
  v6[1] = 0;
  void v6[2] = 0;
  void *v6 = &unk_26DD74CC0;
  uint64_t v8 = v6 + 3;
  if (a3)
  {
    atomic_fetch_add_explicit(&a3->__shared_owners_, 1uLL, memory_order_relaxed);
    v6[3] = &unk_26DD74D10;
    v6[4] = a2;
    v6[5] = a3;
    atomic_fetch_add_explicit(&a3->__shared_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](a3);
  }
  else
  {
    v6[3] = &unk_26DD74D10;
    v6[4] = a2;
    v6[5] = 0;
  }
  *a1 = v8;
  a1[1] = v7;
}

void std::__shared_ptr_emplace<SEUpdater::SEHandleShim>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD74CC0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SEUpdater::SEHandleShim>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD74CC0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__shared_ptr_emplace<SEUpdater::SEHandleShim>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 8))();
}

void SEUpdater::SEHandleShim::Transceive(uint64_t a1, uint64_t a2)
{
  SERestoreInfo::CApdu::CApdu((SERestoreInfo::CApdu *)&v2, *(const unsigned __int8 **)a2, *(void *)(a2 + 8) - *(void *)a2);
}

void sub_229351F28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, uint64_t a16, uint64_t a17, std::__shared_weak_count *a18)
{
  if (a15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a15);
  }
  if (a18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a18);
  }
  _Unwind_Resume(exception_object);
}

void SEUpdater::SEHandleShim::~SEHandleShim(SEUpdater::SEHandleShim *this)
{
  *(void *)this = &unk_26DD74D10;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD74D10;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SERestoreInfo::CApdu::CApdu(SERestoreInfo::CApdu *this, const unsigned __int8 *a2, unint64_t a3)
{
}

void sub_2293520C8(_Unwind_Exception *exception_object)
{
  *uint64_t v1 = &unk_26DD73620;
  CFDataRef v3 = (std::__shared_weak_count *)v1[2];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

void SERestoreInfo::Apdu::Apdu(SERestoreInfo::Apdu *this, const unsigned __int8 *a2, unint64_t a3)
{
  *(void *)this = &unk_26DD73620;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  if (a2)
  {
    if (a3 >> 3 < 0x407) {
      operator new();
    }
    CFDataRef v3 = "len <= MAX_APDU_LEN";
    int v4 = 113;
  }
  else
  {
    CFDataRef v3 = "data";
    int v4 = 112;
  }
  __assert_rtn("Apdu", "Apdu.hpp", v4, v3);
}

void sub_2293521F0(_Unwind_Exception *a1)
{
  MEMORY[0x22A6B67D0](v2, 0x10C402FEFCB83);
  int v4 = *(std::__shared_weak_count **)(v1 + 16);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<SEUpdater::LogSinkShim>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD74D60;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SEUpdater::LogSinkShim>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD74D60;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__shared_ptr_emplace<SEUpdater::LogSinkShim>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 8))();
}

void SEUpdater::LogSinkShim::Log(uint64_t a1, uint64_t a2)
{
  CFDataRef v3 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  int v4 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v3);
  }
  uint64_t v5 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  if (*(char *)(a2 + 23) >= 0) {
    int v6 = (const char *)a2;
  }
  else {
    int v6 = *(const char **)a2;
  }
  SEUpdaterUtil::SELogObj::printLog(v4, (SEUpdaterUtil::SELogObj *)2, 0, 0, 0, (SEUpdaterUtil::SELogObj *)"%s\n", v6);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
}

void sub_22935239C(_Unwind_Exception *a1)
{
}

void SEUpdater::LogSinkShim::~LogSinkShim(SEUpdater::LogSinkShim *this)
{
}

uint64_t *std::unique_ptr<SEUpdaterUtil::SN300V2Image4Signer>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  void *result = a2;
  if (v2)
  {
    *(void *)uint64_t v2 = &unk_26DD752F8;
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)(v2 + 8));
    JUMPOUT(0x22A6B67D0);
  }
  return result;
}

id DERDecodeData(NSData *a1, uint64_t a2)
{
  CFDataRef v3 = a1;
  unint64_t v9 = 0;
  v10[0] = 0;
  v10[1] = 0;
  v8[0] = [(NSData *)v3 DERItem];
  v8[1] = v4;
  uint64_t v5 = DERDecodeItem((uint64_t)v8, &v9);
  if (v5)
  {
    _ObjCLog(0, "DERDecodeData", &cfstr_FailedToDecode_4.isa, v5);
LABEL_3:
    int v6 = 0;
    goto LABEL_7;
  }
  if (a2 != -1 && v9 != a2)
  {
    _ObjCLog(0, "DERDecodeData", &cfstr_UnexpectedTagE.isa, v9, a2);
    goto LABEL_3;
  }
  int v6 = [MEMORY[0x263EFF8F8] dataWithDERItem:v10];
LABEL_7:

  return v6;
}

void sub_229352540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DERParseSequence(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, size_t a5)
{
  bzero(a4, a5);
  unint64_t v13 = 0;
  v14[0] = 0;
  v14[1] = 0;
  uint64_t v10 = DERDecodeItem(a1, &v13);
  if (v10)
  {
    uint64_t v11 = v10;
    _ObjCLog(0, "DERParseSequence", &cfstr_FailedToDecode_4.isa, v10);
  }
  else if (a3 == -1 || v13 == a3)
  {
    return (uint64_t)DERParseSequenceContent(v14, *(unsigned __int16 *)(a2 + 8), *(void *)a2, (unint64_t)a4, a5);
  }
  else
  {
    _ObjCLog(0, "DERParseSequence", &cfstr_ExpectedTag0xL.isa, a3, v13);
    return 2;
  }
  return v11;
}

uint64_t DERParseSequenceSpec(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, size_t a5)
{
  bzero(a4, a5);
  unint64_t v11 = 0;
  v12[0] = 0;
  v12[1] = 0;
  uint64_t result = DERDecodeItem(a2, &v11);
  if (!result)
  {
    if (v11 == a1) {
      return (uint64_t)DERParseSequenceContent(v12, *(unsigned __int16 *)(a3 + 8), *(void *)a3, (unint64_t)a4, a5);
    }
    else {
      return 2;
    }
  }
  return result;
}

unint64_t *DERParseSequenceSpecContent(void *a1, uint64_t a2, unint64_t a3, size_t a4)
{
  id v7 = a1;
  v11[0] = [v7 DERItem];
  v11[1] = v8;
  unint64_t v9 = DERParseSequenceContent(v11, *(unsigned __int16 *)(a2 + 8), *(void *)a2, a3, a4);

  return v9;
}

void sub_229352748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id encodeSequence(uint64_t a1, unint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v12 = DERLengthOfEncodedSequence(a1, a2, a3, a4);
  id v8 = [MEMORY[0x263EFF990] dataWithLength:v12];
  uint64_t v9 = DEREncodeSequence(a1, a2, a3, a4, [v8 mutableBytes], (unint64_t *)&v12);
  if (v9)
  {
    _ObjCLog(0, "encodeSequence", &cfstr_WhileEncodingE.isa, v9);
    id v10 = 0;
  }
  else
  {
    id v10 = v8;
  }

  return v10;
}

void sub_229352828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id splitDERSeq(NSData *a1, uint64_t a2)
{
  CFDataRef v3 = a1;
  v13[0] = [(NSData *)v3 DERItem];
  v13[1] = v4;
  v12[0] = 0;
  v12[1] = 0;
  uint64_t v5 = DERDecodeSeqContentInit(v13, v12);
  if (v5)
  {
    _ObjCLog(0, "splitDERSeq", &cfstr_AttemptingToSp.isa, v5);
    id v6 = 0;
  }
  else
  {
    id v7 = objc_opt_new();
    while (1)
    {
      unint64_t v8 = v12[0];
      memset(v11, 0, sizeof(v11));
      if (DERDecodeSeqNext(v12, v11) == 1)
      {
        id v6 = v7;
        goto LABEL_9;
      }
      if (v11[0] != a2) {
        break;
      }
      uint64_t v9 = [MEMORY[0x263EFF8F8] dataWithBytes:v8 length:v12[0] - v8];
      [v7 addObject:v9];
    }
    _ObjCLog(0, "splitDERSeq", &cfstr_UnexpectedTagE.isa, v11[0], a2);
    id v6 = 0;
LABEL_9:
  }

  return v6;
}

void sub_229352970(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

SERestoreInfo::SN210VDeviceInfo *SERestoreInfo::SN210VDeviceInfo::SN210VDeviceInfo(SERestoreInfo::SN210VDeviceInfo *this, const SERestoreInfo::BLOB *a2)
{
  CFDataRef v3 = SERestoreInfo::P73BaseDeviceInfo::P73BaseDeviceInfo(this, a2);
  *(void *)CFDataRef v3 = &unk_26DD74EB8;
  if (*((_DWORD *)v3 + 14) != 210)
  {
    exception = (SERestoreInfo::SEWrongDeviceInfo *)__cxa_allocate_exception(0x48uLL);
    SERestoreInfo::SEWrongDeviceInfo::SEWrongDeviceInfo(exception);
  }
  return this;
}

void sub_229352A34(_Unwind_Exception *a1)
{
  SERestoreInfo::P73BaseDeviceInfo::~P73BaseDeviceInfo(v1);
  _Unwind_Resume(a1);
}

void SERestoreInfo::SN210VDeviceInfo::~SN210VDeviceInfo(SERestoreInfo::SN210VDeviceInfo *this)
{
  *(void *)this = &unk_26DD739B8;
  uint64_t v2 = (void *)*((void *)this + 19);
  if (v2)
  {
    *((void *)this + 20) = v2;
    operator delete(v2);
  }
  CFDataRef v3 = (void *)*((void *)this + 14);
  if (v3)
  {
    *((void *)this + 15) = v3;
    operator delete(v3);
  }
  unint64_t v4 = (void *)*((void *)this + 11);
  if (v4)
  {
    *((void *)this + 12) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 8);
  if (v5)
  {
    *((void *)this + 9) = v5;
    operator delete(v5);
  }
  id v6 = (void *)*((void *)this + 4);
  if (v6)
  {
    *((void *)this + 5) = v6;
    operator delete(v6);
  }
}

{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t vars8;

  *(void *)this = &unk_26DD739B8;
  uint64_t v2 = (void *)*((void *)this + 19);
  if (v2)
  {
    *((void *)this + 20) = v2;
    operator delete(v2);
  }
  CFDataRef v3 = (void *)*((void *)this + 14);
  if (v3)
  {
    *((void *)this + 15) = v3;
    operator delete(v3);
  }
  unint64_t v4 = (void *)*((void *)this + 11);
  if (v4)
  {
    *((void *)this + 12) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 8);
  if (v5)
  {
    *((void *)this + 9) = v5;
    operator delete(v5);
  }
  id v6 = (void *)*((void *)this + 4);
  if (v6)
  {
    *((void *)this + 5) = v6;
    operator delete(v6);
  }

  JUMPOUT(0x22A6B67D0);
}

uint64_t SEUpdaterUtil::SN300V2Image4Signer::getSigningAlgorithm(SEUpdaterUtil::SN300V2Image4Signer *this)
{
  return 1;
}

void *SEUpdaterUtil::SN300V2Image4Signer::getSigningKey@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(a1, &SEUpdaterUtil::SN300V2Image4Signer::getSigningKey(void)const::signingKey, (uint64_t)&SEUpdaterUtil::SN300V2Image4Signer::getSigningCert(void)const::signingCert, 0xA7uLL);
}

void *SEUpdaterUtil::SN300V2Image4Signer::getSigningCert@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(a1, &SEUpdaterUtil::SN300V2Image4Signer::getSigningCert(void)const::signingCert, (uint64_t)"N13SEUpdaterUtil19SN300V2Image4SignerE", 0x2E3uLL);
}

void SEUpdaterUtil::SN300V2Image4Signer::~SN300V2Image4Signer(const void **this)
{
  *this = &unk_26DD752F8;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(this + 1);
}

{
  uint64_t vars8;

  *this = &unk_26DD752F8;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(this + 1);

  JUMPOUT(0x22A6B67D0);
}

void **SERestoreInfo::P73DeviceInfo::P73DeviceInfo(void **this, const SERestoreInfo::BLOB *a2)
{
  CFDataRef v3 = SERestoreInfo::P73BaseDeviceInfo::P73BaseDeviceInfo((SERestoreInfo::P73BaseDeviceInfo *)this, a2);
  *(void *)CFDataRef v3 = &unk_26DD74F68;
  if (*((_DWORD *)v3 + 14) != 115)
  {
    exception = (SERestoreInfo::SEWrongDeviceInfo *)__cxa_allocate_exception(0x48uLL);
    SERestoreInfo::SEWrongDeviceInfo::SEWrongDeviceInfo(exception);
  }
  if (SERestoreInfo::isDummyRootCaKeyId((uint64_t)(this + 11))) {
    SERestoreInfo::fixRootCaKeyId(this + 11, (uint64_t)(this + 14));
  }
  return this;
}

void sub_229352D60(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  SERestoreInfo::P73BaseDeviceInfo::~P73BaseDeviceInfo(v1);
  _Unwind_Resume(a1);
}

BOOL SERestoreInfo::isDummyRootCaKeyId(uint64_t a1)
{
  id v7 = 0;
  unint64_t v8 = 0;
  uint64_t v9 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(&v7, &SERestoreInfo::isDummyRootCaKeyId(std::vector<unsigned char> const&)::dummyRootCaKeyIdArray, (uint64_t)&SERestoreInfo::isProdCometIm4KeyId(std::vector<unsigned char> const&)::prodCometIm4KeyIdArray, 0x20uLL);
  uint64_t v2 = *(const void **)a1;
  size_t v3 = *(void *)(a1 + 8) - *(void *)a1;
  unint64_t v4 = v7;
  if (v3 == v8 - v7)
  {
    BOOL v5 = memcmp(v2, v7, v3) == 0;
    if (!v4) {
      return v5;
    }
    goto LABEL_5;
  }
  BOOL v5 = 0;
  if (v7)
  {
LABEL_5:
    unint64_t v8 = v4;
    operator delete(v4);
  }
  return v5;
}

void SERestoreInfo::fixRootCaKeyId(void **a1, uint64_t a2)
{
  id v10 = 0;
  unint64_t v11 = 0;
  uint64_t v12 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(&v10, &SERestoreInfo::isProdCometIm4KeyId(std::vector<unsigned char> const&)::prodCometIm4KeyIdArray, (uint64_t)&unk_22936CF92, 0x20uLL);
  unint64_t v4 = *(const void **)a2;
  size_t v5 = *(void *)(a2 + 8) - *(void *)a2;
  id v6 = v10;
  if (v5 != v11 - v10)
  {
    BOOL v7 = 0;
    if (!v10) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  BOOL v7 = memcmp(v4, v10, v5) == 0;
  if (v6)
  {
LABEL_5:
    unint64_t v11 = v6;
    operator delete(v6);
  }
LABEL_6:
  RootCA::getRootKeyId(v7, 115, &__p);
  if (&__p != a1) {
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(a1, (char *)__p, v9, v9 - (unsigned char *)__p);
  }
  if (__p)
  {
    uint64_t v9 = (char *)__p;
    operator delete(__p);
  }
}

void sub_229352EE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SERestoreInfo::P73DeviceInfo::~P73DeviceInfo(SERestoreInfo::P73DeviceInfo *this)
{
  *(void *)this = &unk_26DD739B8;
  uint64_t v2 = (void *)*((void *)this + 19);
  if (v2)
  {
    *((void *)this + 20) = v2;
    operator delete(v2);
  }
  size_t v3 = (void *)*((void *)this + 14);
  if (v3)
  {
    *((void *)this + 15) = v3;
    operator delete(v3);
  }
  unint64_t v4 = (void *)*((void *)this + 11);
  if (v4)
  {
    *((void *)this + 12) = v4;
    operator delete(v4);
  }
  size_t v5 = (void *)*((void *)this + 8);
  if (v5)
  {
    *((void *)this + 9) = v5;
    operator delete(v5);
  }
  id v6 = (void *)*((void *)this + 4);
  if (v6)
  {
    *((void *)this + 5) = v6;
    operator delete(v6);
  }
}

{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t vars8;

  *(void *)this = &unk_26DD739B8;
  uint64_t v2 = (void *)*((void *)this + 19);
  if (v2)
  {
    *((void *)this + 20) = v2;
    operator delete(v2);
  }
  size_t v3 = (void *)*((void *)this + 14);
  if (v3)
  {
    *((void *)this + 15) = v3;
    operator delete(v3);
  }
  unint64_t v4 = (void *)*((void *)this + 11);
  if (v4)
  {
    *((void *)this + 12) = v4;
    operator delete(v4);
  }
  size_t v5 = (void *)*((void *)this + 8);
  if (v5)
  {
    *((void *)this + 9) = v5;
    operator delete(v5);
  }
  id v6 = (void *)*((void *)this + 4);
  if (v6)
  {
    *((void *)this + 5) = v6;
    operator delete(v6);
  }

  JUMPOUT(0x22A6B67D0);
}

void PTCUtil::deletePTCKeysWithNoStoredPK(uint64_t *a1, uint64_t *a2)
{
  v46[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  int v4 = *(_DWORD *)(*a2 + 56);
  if (v4 == 100)
  {
    unsigned int v5 = *(_DWORD *)(v3 + 12) - 2719;
  }
  else
  {
    if (v4 != 115) {
      return;
    }
    unsigned int v5 = *(_DWORD *)(v3 + 12) - 2451;
  }
  if (v5 >= 0xFFFFFF79)
  {
    _ObjCLog((SEUpdaterUtil::SELogObj *)2, "deletePTCKeysWithNoStoredPK", &cfstr_PerformingClea.isa);
    id v6 = [SETransceiveHelper alloc];
    BOOL v7 = (std::__shared_weak_count *)a1[1];
    uint64_t v42 = *a1;
    uint64_t v43 = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    char v25 = [(SETransceiveHelper *)v6 initWithSEController:&v42];
    if (v43) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v43);
    }
    v46[0] = @"A000000704C0000000000001";
    v46[1] = @"A000000704C0000000000002";
    [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:2];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
    if (v23)
    {
      uint64_t v22 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v39 != v22) {
            objc_enumerationMutation(obj);
          }
          unint64_t v26 = *(SETransceiveHelper **)(*((void *)&v38 + 1) + 8 * i);
          -[SETransceiveHelper selectWithAID:](v25, "selectWithAID:");
          id v8 = (id)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            _ObjCLog(0, "deletePTCKeysWithNoStoredPK", &cfstr_FailedToSelect_7.isa, v26);
          }
          else
          {
            id v37 = 0;
            uint64_t v9 = PTCCommand::ptc_listKeys(v25, v26, (uint64_t *)&v37);
            id v8 = v37;
            if (!v9)
            {
              exception = __cxa_allocate_exception(0x48uLL);
              std::string::basic_string[abi:ne180100]<0>(&v27, "While listing keys");
              uint64_t v20 = (void *)SERestoreInfo::SEException::SEException((uint64_t)exception, &v27, 1, @"SEUpdaterErrorDomain");
            }
            long long v35 = 0u;
            long long v36 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            id v10 = v9;
            uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v44 count:16];
            if (v11)
            {
              uint64_t v12 = *(void *)v34;
              do
              {
                for (uint64_t j = 0; j != v11; ++j)
                {
                  if (*(void *)v34 != v12) {
                    objc_enumerationMutation(v10);
                  }
                  unint64_t v14 = *(void **)(*((void *)&v33 + 1) + 8 * j);
                  long long v31 = 0u;
                  long long v32 = 0u;
                  long long v29 = 0u;
                  long long v30 = 0u;
                  long long v27 = 0u;
                  long long v28 = 0u;
                  size_t v15 = DERParseSequenceSpecContent(v14, (uint64_t)&PTKeyInSlotSpec, (unint64_t)&v27, 0x60uLL);
                  if (v15)
                  {
                    unsigned __int8 v16 = [v14 asHexString];
                    _ObjCLog(0, "deletePTCKeysWithNoStoredPK", &cfstr_FailedToParseK.isa, v15, v16);
                  }
                  else
                  {
                    va_list v17 = (NSString *)(bswap32(*(unsigned __int16 *)v28) >> 16);
                    _ObjCLog((SEUpdaterUtil::SELogObj *)2, "deletePTCKeysWithNoStoredPK", &cfstr_PtcKeyInSlotDT.isa, v17, *((void *)&v31 + 1) == 0);
                    if (!*((void *)&v31 + 1))
                    {
                      uint64_t v18 = PTCCommand::ptc_DeleteKey((PTCCommand *)v25, v26, v17);

                      id v8 = (id)v18;
                      _ObjCLog((SEUpdaterUtil::SELogObj *)2, "deletePTCKeysWithNoStoredPK", &cfstr_PtcKeyDeletedW.isa, v18);
                    }
                  }
                }
                uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v44 count:16];
              }
              while (v11);
            }
          }
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
      }
      while (v23);
    }

    _ObjCLog((SEUpdaterUtil::SELogObj *)2, "deletePTCKeysWithNoStoredPK", &cfstr_CleanupComplet.isa);
  }
}

void sub_229353454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53)
{
  _Unwind_Resume(a1);
}

void PTCUtil::workaroundForPTCExport(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(*(void *)a2 + 12) == *(_DWORD *)(*(void *)a2 + 24)
    && *(_DWORD *)(*(void *)a2 + 28) == 23195)
  {
    SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v5, 0x2037uLL);
    unsigned int v5 = &unk_26DD735C8;
    SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v4, 0x2037uLL);
    int v4 = &unk_26DD735C8;
    SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v3, 0x2037uLL);
    uint64_t v3 = &unk_26DD735C8;
    long long v6 = xmmword_22936D028;
    __int16 v7 = 1;
    SERestoreInfo::CApdu::CApdu(&v2);
  }
}

void sub_22935394C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,std::__shared_weak_count *a22,uint64_t a23,uint64_t a24,std::__shared_weak_count *a25)
{
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  if (a22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a22);
  }
  if (a25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a25);
  }
  *(void *)(v25 - 88) = &unk_26DD73620;
  long long v27 = *(std::__shared_weak_count **)(v25 - 72);
  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }
  _Unwind_Resume(a1);
}

void sub_229353A7C()
{
}

void sub_229353A84()
{
}

void sub_229353A8C()
{
}

void SEUpdater::CommandSelectPTInstance1::~CommandSelectPTInstance1(SEUpdater::CommandSelectPTInstance1 *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void SEUpdater::CommandSelectPTInstance2::~CommandSelectPTInstance2(SEUpdater::CommandSelectPTInstance2 *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

uint64_t SEUpdaterUtil::SN100VImage4Signer::getSigningAlgorithm(SEUpdaterUtil::SN100VImage4Signer *this)
{
  return 0;
}

void *SEUpdaterUtil::SN100VImage4Signer::getSigningKey@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(a1, &SEUpdaterUtil::SN100VImage4Signer::getSigningKey(void)const::signingKey, (uint64_t)&SEUpdaterUtil::SN100VImage4Signer::getSigningCert(void)const::signingCert, 0x79uLL);
}

void *SEUpdaterUtil::SN100VImage4Signer::getSigningCert@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(a1, &SEUpdaterUtil::SN100VImage4Signer::getSigningCert(void)const::signingCert, (uint64_t)"N13SEUpdaterUtil18SN100VImage4SignerE", 0x274uLL);
}

void SEUpdaterUtil::SN100VImage4Signer::~SN100VImage4Signer(const void **this)
{
  *this = &unk_26DD752F8;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(this + 1);
}

{
  uint64_t vars8;

  *this = &unk_26DD752F8;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(this + 1);

  JUMPOUT(0x22A6B67D0);
}

void WriteEvent(uint64_t a1, void *a2)
{
  v38[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSString stringWithFormat:@"%@%@", *a2, @"SEUpdaterEventsLog.plist"];
  if (v3)
  {
    long long v33 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v3];
    int v4 = objc_opt_new();
    if (v33)
    {
      id v36 = 0;
      unsigned int v5 = [MEMORY[0x263F08AC0] propertyListWithData:v33 options:2 format:0 error:&v36];
      id v6 = v36;
      __int16 v7 = v6;
      if (!v5 || v6)
      {
        uint64_t v12 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
        unint64_t v13 = (SEUpdaterUtil::SELogObj *)off_268315F10;
        if (!off_268315F10) {
          SEUpdaterUtil::SELogObj::create_default_global(v12);
        }
        unint64_t v14 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
        if (*(&off_268315F10 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
        SEUpdaterUtil::SELogObj::printLog(v13, (SEUpdaterUtil::SELogObj *)2, 0, 1, "WriteEvent", (SEUpdaterUtil::SELogObj *)"EVENT LOGGING: Could not recreate log events properties from file - Defaulting to empty file\n");
        if (v14) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v14);
        }
      }
      else
      {
        uint64_t v8 = [v5 objectForKeyedSubscript:@"events"];
        if (v8) {
          [v4 addObjectsFromArray:v8];
        }
      }
    }
    else
    {
      __int16 v7 = 0;
    }
    size_t v15 = [NSNumber numberWithUnsignedInt:a1];
    if (([v4 containsObject:v15] & 1) == 0) {
      [v4 addObject:v15];
    }
    v37[0] = @"version";
    unsigned __int8 v16 = [NSNumber numberWithUnsignedInteger:1];
    v37[1] = @"events";
    v38[0] = v16;
    v38[1] = v4;
    va_list v17 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];

    id v35 = 0;
    uint64_t v18 = [MEMORY[0x263F08AC0] dataWithPropertyList:v17 format:200 options:0 error:&v35];
    id v19 = v35;

    if (!v18 || v19)
    {
      long long v27 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
      long long v28 = (SEUpdaterUtil::SELogObj *)off_268315F10;
      if (!off_268315F10) {
        SEUpdaterUtil::SELogObj::create_default_global(v27);
      }
      uint64_t v23 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
      if (*(&off_268315F10 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
      }
      pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
      id v29 = [v19 description];
      SEUpdaterUtil::SELogObj::printLog(v28, (SEUpdaterUtil::SELogObj *)2, 0, 1, "WriteEvent", (SEUpdaterUtil::SELogObj *)"EVENT LOGGING: Unable to serialize data - %s\n", (const char *)[v29 UTF8String]);
      BOOL v26 = v23 == 0;
    }
    else
    {
      id v34 = 0;
      char v20 = [v18 writeToFile:v3 options:0 error:&v34];
      id v19 = v34;
      if (v20)
      {
        char v21 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
        uint64_t v22 = (SEUpdaterUtil::SELogObj *)off_268315F10;
        if (!off_268315F10) {
          SEUpdaterUtil::SELogObj::create_default_global(v21);
        }
        uint64_t v23 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
        if (*(&off_268315F10 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
        int v24 = (const char *)[v3 UTF8String];
        id v25 = [v4 description];
        SEUpdaterUtil::SELogObj::printLog(v22, (SEUpdaterUtil::SELogObj *)2, 0, 1, "WriteEvent", (SEUpdaterUtil::SELogObj *)"EVENT LOGGING: Successfully wrote to file %s with events %s:\n", v24, (const char *)[v25 UTF8String]);
        BOOL v26 = v23 == 0;
      }
      else
      {
        long long v30 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
        long long v31 = (SEUpdaterUtil::SELogObj *)off_268315F10;
        if (!off_268315F10) {
          SEUpdaterUtil::SELogObj::create_default_global(v30);
        }
        uint64_t v23 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
        if (*(&off_268315F10 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
        id v32 = [v19 description];
        SEUpdaterUtil::SELogObj::printLog(v31, (SEUpdaterUtil::SELogObj *)2, 0, 1, "WriteEvent", (SEUpdaterUtil::SELogObj *)"EVENT LOGGING: Error writing to file - %s\n", (const char *)[v32 UTF8String]);
        BOOL v26 = v23 == 0;
      }
    }
    if (!v26) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v23);
    }
  }
  else
  {
    uint64_t v9 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    id v10 = (SEUpdaterUtil::SELogObj *)off_268315F10;
    if (!off_268315F10) {
      SEUpdaterUtil::SELogObj::create_default_global(v9);
    }
    uint64_t v11 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
    if (*(&off_268315F10 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    SEUpdaterUtil::SELogObj::printLog(v10, (SEUpdaterUtil::SELogObj *)2, 0, 1, "WriteEvent", (SEUpdaterUtil::SELogObj *)"EVENT LOGGING: Unable to recreate full file name with path\n");
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
  }
}

void sub_229354584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);

  _Unwind_Resume(a1);
}

void SEUpdater::SEControllerBase::~SEControllerBase(const void **this)
{
  *this = &unk_26DD750A8;
  SEUpdater::SEControllerBase::shutdown(this);
}

const void *SEUpdater::SEControllerBase::shutdown(const void **this)
{
  long long v2 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  uint64_t v3 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v2);
  }
  int v4 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  SEUpdaterUtil::SELogObj::printLog(v3, (SEUpdaterUtil::SELogObj *)2, 0, 1, "shutdown", (SEUpdaterUtil::SELogObj *)"Shutdown fSeHandle %p\n", this[1]);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  uint64_t result = this[1];
  if (result)
  {
    uint64_t result = (const void *)NfRestoreSEClose();
    this[1] = 0;
  }
  return result;
}

void sub_229354860(_Unwind_Exception *a1)
{
}

uint64_t SEUpdater::SEControllerBase::transceiveInternal(SEUpdater::SEControllerBase *this, const unsigned __int8 *a2, unint64_t a3, unsigned __int8 *a4, unint64_t *a5)
{
  uint64_t v5 = NfRestoreSETransceive();
  if (!v5) {
    return 0;
  }
  uint64_t v7 = 25;
  SEUpdaterUtil::_AddError((SEUpdaterUtil *)0x19, 1, (uint64_t)"transceiveInternal", (SEUpdaterUtil::SELogObj *)"NfRestoreSETransceive returns %d", v6, v5);
  return v7;
}

void SEUpdater::SEControllerBase::transceive(SEUpdater::SEControllerBase *this, const unsigned __int8 *a2, const unsigned __int8 *a3, unsigned __int8 *a4, unint64_t *a5, SEUpdaterUtil::SELogObj *a6)
{
  if (*((void *)this + 1))
  {
    int v8 = (int)a2;
    uint64_t v9 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    id v10 = (SEUpdaterUtil::SELogObj *)off_268315F10;
    if (!off_268315F10) {
      SEUpdaterUtil::SELogObj::create_default_global(v9);
    }
    uint64_t v11 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
    if (*(&off_268315F10 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    SEUpdaterUtil::SELogObj::printLog(v10, a6, 0, 1, "transceive", (SEUpdaterUtil::SELogObj *)"transmitting C-APDU: %zu \n", (size_t)a3);
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
    SEUpdaterUtil::SELogPrintBinary(a6, v8, a3);
  }
  exception = __cxa_allocate_exception(0x10uLL);
  std::string::basic_string[abi:ne180100]<0>(&v15, "Assertion: ");
  unint64_t v13 = std::string::append(&v15, "fSeHandle");
  long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  std::string::size_type v17 = v13->__r_.__value_.__r.__words[2];
  long long v16 = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  MEMORY[0x22A6B63F0](exception, &v16);
}

void sub_229354B7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
}

void SEUpdater::SEControllerBase::transceive(SEUpdater::SEControllerBase *this, const SERestoreInfo::CApdu *a2, SERestoreInfo::RApdu *a3, SEUpdaterUtil::SELogObj *a4)
{
  if (*((void *)this + 1))
  {
    uint64_t v7 = *((void *)a3 + 1);
    unint64_t v8 = *(void *)(v7 + 16) - *(void *)v7;
    LOBYTE(v17) = 0;
    std::vector<unsigned char>::assign((char **)v7, v8, (char *)&v17);
    v16.__r_.__value_.__r.__words[0] = *(void *)(*((void *)a3 + 1) + 8) - **((void **)a3 + 1);
    uint64_t v9 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    id v10 = (SEUpdaterUtil::SELogObj *)off_268315F10;
    if (!off_268315F10) {
      SEUpdaterUtil::SELogObj::create_default_global(v9);
    }
    uint64_t v11 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
    if (*(&off_268315F10 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    SEUpdaterUtil::SELogObj::printLog(v10, a4, 0, 1, "transceive", (SEUpdaterUtil::SELogObj *)"transmitting C-APDU: %zu \n", *(void *)(*((void *)a2 + 1) + 8) - **((void **)a2 + 1));
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
    if (*(void *)(*((void *)a2 + 1) + 8) - **((void **)a2 + 1) >= 5uLL) {
      uint64_t v12 = 5;
    }
    else {
      uint64_t v12 = *(void *)(*((void *)a2 + 1) + 8) - **((void **)a2 + 1);
    }
    SEUpdaterUtil::SELogPrintBinary(a4, *((void *)a2 + 3), (const unsigned __int8 *)v12);
  }
  exception = __cxa_allocate_exception(0x10uLL);
  std::string::basic_string[abi:ne180100]<0>(&v16, "Assertion: ");
  long long v14 = std::string::append(&v16, "fSeHandle");
  long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  std::string::size_type v18 = v14->__r_.__value_.__r.__words[2];
  long long v17 = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  MEMORY[0x22A6B63F0](exception, &v17);
}

void sub_229354F7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
}

id PTCCommand::ptc_DeleteKey(PTCCommand *this, SETransceiveHelper *a2, NSString *a3)
{
  unsigned int v3 = a3;
  uint64_t v5 = this;
  id v6 = a2;
  char v15 = 1;
  unsigned __int16 v16 = __rev16(v3);
  v14[0] = &v15;
  v14[1] = 1;
  unint64_t v14[2] = &v16;
  v14[3] = 2;
  uint64_t v7 = PTCCommand::CreateCommand(0xA001u, (unint64_t)v14, (uint64_t)&PTDeleteKeyInputSpec);
  if (v7)
  {
    id v13 = 0;
    id v8 = PTCCommand::ExecuteCommand(v5, v6, v7, &v13);
    uint64_t v9 = (NSError *)v13;
    id v10 = v9;
    if (v9)
    {
      uint64_t v11 = _ObjCLogNSError(v9, 0, "ptc_DeleteKey", &cfstr_WhileDeletingK.isa, v16);
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = _ObjCLogNSError(0, 0, "ptc_DeleteKey", &cfstr_CouldNotCreate.isa);
  }

  return v11;
}

void sub_229355170(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PTCCommand::CreateCommand(unsigned int a1, unint64_t a2, uint64_t a3)
{
  unsigned int v3 = 0;
  char v8 = 1;
  __int16 v9 = __rev16(a1);
  if (a2
    && a3
    && (encodeSequence(0x2000000000000010, a2, *(unsigned __int16 *)(a3 + 8), *(void *)a3),
        (unsigned int v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v5 = 0;
  }
  else
  {
    v7[0] = &v8;
    v7[1] = 1;
    v7[2] = &v9;
    v7[3] = 2;
    v7[4] = [v3 DERItem];
    v7[5] = v4;
    uint64_t v5 = encodeSequence(0x2000000000000010, (unint64_t)v7, 3u, (uint64_t)&PTCommandSpecItems);
  }

  return v5;
}

void sub_229355268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PTCCommand::ExecuteCommand(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = [v7 selectWithAID:v8];
  id v11 = v10;
  if (v10)
  {
    if (a4)
    {
      id v11 = v10;
      id v12 = 0;
      *a4 = v11;
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    uint64_t v52 = a4;
    id v54 = v7;
    id v59 = 0;
    id v13 = v7;
    id v53 = v9;
    id v14 = v9;
    SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v60, 0x2037uLL);
    long long v60 = &unk_26DD735C8;
    unint64_t v15 = [v14 length];
    uint64_t v16 = 0;
    char v17 = 0;
    while (v15)
    {
      if (v15 >= 0x2BC) {
        uint64_t v18 = 700;
      }
      else {
        uint64_t v18 = v15;
      }
      if (v16 || v18 != [v14 length])
      {
        [v14 subdataWithRange:v16, v18];
        id v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v19 = v14;
      }
      char v20 = v19;
      +[APDUUtil getCXXApduWithCla:128 ins:160 p1:(v15 < 0x2BD) << 7 p2:0 payload:v19];
      int v24 = [v13 transceiveAndRecordCapdu:v63 rapdu:&v60];
      if (!v24
        && (uint64_t v25 = v61[1], (unint64_t)(v25 - *v61) >= 2)
        && ((int v26 = *(unsigned __int8 *)(v25 - 2), (v26 & 0xFFFFFFFD) == 0x61)
         || (*(unsigned __int8 *)(v25 - 1) | (v26 << 8)) == 0x9000))
      {
        v16 += v18;
        v15 -= v18;
        char v27 = 1;
      }
      else
      {
        _ObjCLogWrapOutError(&v59, v24, 0, "WriteCommand", @"Failed to write at offset 0x%x\n", v21, v22, v23, v16);
        char v27 = 0;
        char v17 = 1;
      }

      v63[0] = &unk_26DD73620;
      if (v64) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v64);
      }

      if ((v27 & 1) == 0)
      {
        if ((v17 & 1) == 0)
        {
          long long v60 = &unk_26DD73620;
          if (v62) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v62);
          }
        }
        break;
      }
    }

    id v28 = v59;
    if (v28)
    {
      id v11 = v28;
      id v12 = 0;
      _ObjCLogWrapOutError(v52, v28, 0, "ExecuteCommand", @"While writing command\n", v29, v30, v31, v51);
      id v7 = v54;
      id v9 = v53;
    }
    else
    {
      id v32 = v61;
      long long v57 = v61;
      char v58 = v62;
      if (v62)
      {
        atomic_fetch_add_explicit(&v62->__shared_owners_, 1uLL, memory_order_relaxed);
        id v32 = v57;
      }
      id v55 = 0;
      uint64_t v56 = &unk_26DD735C8;
      id v33 = v13;
      if (v32[1] - *v32 <= 1uLL) {
        __assert_rtn("getDataSize", "Apdu.hpp", 382, "len >= 2");
      }
      id v34 = [MEMORY[0x263EFF8F8] dataWithBytes:length:];
      id v35 = (void *)[v34 mutableCopy];

      uint64_t v36 = *v57;
      unint64_t v37 = v57[1] - *v57;
      if (v37 >= 2)
      {
        while ((*(unsigned char *)(v37 + v36 - 2) & 0xFD) == 0x61)
        {
          +[APDUUtil getCXXApduWithCla:128 ins:176 p1:0 p2:0 payload:0];
          long long v41 = [v33 transceiveAndRecordCapdu:v63 rapdu:&v56];
          if (v41
            || (uint64_t v42 = v57[1], v43 = v42 - *v57, v43 < 2)
            || (int v44 = *(unsigned __int8 *)(*v57 + v43 - 2), (v44 & 0xFFFFFFFD) != 0x61)
            && (*(unsigned __int8 *)(v42 - 1) | (v44 << 8)) != 0x9000)
          {
            _ObjCLogWrapOutError(&v55, v41, 0, "ReadResponse", @"Failed to read response\n", v38, v39, v40, v51);

            v63[0] = &unk_26DD73620;
            if (v64) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v64);
            }
            id v46 = 0;
            goto LABEL_45;
          }
          long long v45 = [MEMORY[0x263EFF8F8] dataWithBytes:x0 length:x1];
          [v35 appendData:v45];

          v63[0] = &unk_26DD73620;
          if (v64) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v64);
          }
          uint64_t v36 = *v57;
          unint64_t v37 = v57[1] - *v57;
          if (v37 <= 1) {
            break;
          }
        }
      }
      id v46 = v35;
LABEL_45:

      id v11 = v55;
      uint64_t v56 = &unk_26DD73620;
      if (v58) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v58);
      }
      id v7 = v54;
      id v9 = v53;
      if (v11 || !v46)
      {
        _ObjCLogWrapOutError(v52, v11, 0, "ExecuteCommand", @"While reading response for command\n", v47, v48, v49, v51);
        id v12 = 0;
      }
      else
      {
        id v12 = v46;
      }
    }
    long long v60 = &unk_26DD73620;
    if (v62) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v62);
    }
  }

  return v12;
}

void sub_229355804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, std::__shared_weak_count *a18, uint64_t a19, uint64_t a20,uint64_t a21,std::__shared_weak_count *a22,uint64_t a23,uint64_t a24,std::__shared_weak_count *a25)
{
  if (a25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a25);
  }

  if (a18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a18);
  }
  if (a22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a22);
  }

  _Unwind_Resume(a1);
}

id PTCCommand::ptc_listKeys(void *a1, void *a2, uint64_t *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v11 = PTCCommand::CreateCommand(0x1002u, 0, 0);
  if (!v11)
  {
    _ObjCLogOutError(a3, 7, "ptc_listKeys", @"Could not create listKeysCommandData\n", v7, v8, v9, v10, v30);
    id v18 = 0;
    goto LABEL_9;
  }
  id v41 = 0;
  id v12 = PTCCommand::ExecuteCommand(v5, v6, v11, &v41);
  id v13 = v41;
  if (v13)
  {
    id v14 = [v11 asHexString];
    _ObjCLogWrapOutError(a3, v13, 0, "ptc_listKeys", @"While listing keys: %@\n", v15, v16, v17, (uint64_t)v14);
  }
  else
  {
    v40[0] = [v12 DERItem];
    v40[1] = v19;
    long long v38 = 0u;
    long long v39 = 0u;
    if (!DERParseSequenceSpec(0x2000000000000010, (uint64_t)v40, (uint64_t)&PTListKeysOutputSpec, &v38, 0x20uLL))
    {
      uint64_t v32 = 0;
      id v33 = &v32;
      uint64_t v34 = 0x3032000000;
      id v35 = __Block_byref_object_copy__3;
      uint64_t v36 = __Block_byref_object_dispose__3;
      id v37 = (id)objc_opt_new();
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = ___ZN10PTCCommand12ptc_listKeysEP18SETransceiveHelperP8NSStringPU15__autoreleasingP7NSError_block_invoke;
      uint64_t v31[3] = &unk_264863330;
      v31[4] = &v32;
      if (DERDecodeSequenceWithBlock((uint64_t)&v39, (uint64_t)v31))
      {
        uint64_t v25 = [v12 asHexString];
        _ObjCLogOutError(a3, 0, "ptc_listKeys", @"Invalid listKeys output %@\n", v26, v27, v28, v29, (uint64_t)v25);

        id v18 = 0;
      }
      else
      {
        id v18 = (id)v33[5];
      }
      _Block_object_dispose(&v32, 8);

      goto LABEL_8;
    }
    id v14 = [v12 asHexString];
    _ObjCLogOutError(a3, 0, "ptc_listKeys", @"Invalid listKeys output %@\n", v20, v21, v22, v23, (uint64_t)v14);
  }

  id v18 = 0;
LABEL_8:

LABEL_9:

  return v18;
}

void sub_229355C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

uint64_t ___ZN10PTCCommand12ptc_listKeysEP18SETransceiveHelperP8NSStringPU15__autoreleasingP7NSError_block_invoke(uint64_t a1, uint64_t a2)
{
  long long v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  unsigned int v3 = [MEMORY[0x263EFF8F8] dataWithDERItem:a2 + 8];
  [v2 addObject:v3];

  return 0;
}

void sub_229355D18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SEUpdater::PreflightUpdateController::doCommand(SEUpdater::PreflightUpdateController *this, ctu::cf *theString1, const __CFDictionary **a3)
{
  if (CFStringCompare((CFStringRef)theString1, @"queryInfo", 0))
  {
    exception = __cxa_allocate_exception(0x48uLL);
    ctu::cf::show((uint64_t *)&v51, theString1, v36);
    id v37 = std::string::insert(&v51, 0, "Unknown command: ");
    std::string v45 = *v37;
    v37->__r_.__value_.__l.__size_ = 0;
    v37->__r_.__value_.__r.__words[2] = 0;
    v37->__r_.__value_.__r.__words[0] = 0;
    long long v38 = (void *)SERestoreInfo::SEException::SEException((uint64_t)exception, (long long *)&v45, 2, @"SEUpdaterErrorDomain");
  }
  id v5 = (void *)MEMORY[0x22A6B6C00]();
  if (getNFHardwareManagerClass())
  {
    id v6 = [getNFHardwareManagerClass() sharedHardwareManager];
    uint64_t v7 = v6;
    if (!v6)
    {
      long long v39 = __cxa_allocate_exception(0x48uLL);
      std::string::basic_string[abi:ne180100]<0>(&v45, "Couldn't get sharedHardwareManager");
      uint64_t v40 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v39, (long long *)&v45, 31, @"SEUpdaterErrorDomain");
    }
    unint64_t v43 = v5;
    unsigned int v8 = [v6 getHwSupport];
    unsigned int v9 = v8;
    if (v8 != 2)
    {
      if (v8 == 4)
      {
        uint64_t v10 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
        id v11 = (SEUpdaterUtil::SELogObj *)off_268315F10;
        if (!off_268315F10) {
          SEUpdaterUtil::SELogObj::create_default_global(v10);
        }
        id v12 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
        if (*(&off_268315F10 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
        SEUpdaterUtil::SELogObj::printLog(v11, (SEUpdaterUtil::SELogObj *)2, 0, 1, "doCommand", (SEUpdaterUtil::SELogObj *)"HWState returns UnSupported, bailing out\n");
        if (v12) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v12);
        }
LABEL_47:

        goto LABEL_48;
      }
      int v16 = 1;
      do
      {
        if (v16 == 11)
        {
          uint64_t v32 = __cxa_allocate_exception(0x48uLL);
          std::to_string(&v51, v9);
          id v33 = std::string::insert(&v51, 0, "Hardware still not in a valid state: ");
          std::string v45 = *v33;
          v33->__r_.__value_.__l.__size_ = 0;
          v33->__r_.__value_.__r.__words[2] = 0;
          v33->__r_.__value_.__r.__words[0] = 0;
          uint64_t v34 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v32, (long long *)&v45, 31, @"SEUpdaterErrorDomain");
        }
        uint64_t v17 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
        id v18 = (SEUpdaterUtil::SELogObj *)off_268315F10;
        if (!off_268315F10) {
          SEUpdaterUtil::SELogObj::create_default_global(v17);
        }
        uint64_t v19 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
        if (*(&off_268315F10 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
        SEUpdaterUtil::SELogObj::printLog(v18, (SEUpdaterUtil::SELogObj *)1, 0, 1, "doCommand", (SEUpdaterUtil::SELogObj *)"Attempt %d state %d is not yet ready, sleeping a bit\n", v16, v9);
        if (v19) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v19);
        }
        usleep(0xF4240u);
        unsigned int v9 = [v7 queryHardwareSupport:0];
        uint64_t v20 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
        uint64_t v21 = (SEUpdaterUtil::SELogObj *)off_268315F10;
        if (!off_268315F10) {
          SEUpdaterUtil::SELogObj::create_default_global(v20);
        }
        uint64_t v22 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
        if (*(&off_268315F10 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
        SEUpdaterUtil::SELogObj::printLog(v21, (SEUpdaterUtil::SELogObj *)1, 0, 1, "doCommand", (SEUpdaterUtil::SELogObj *)"new state --> %d\n", v9);
        if (v22) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v22);
        }
        ++v16;
      }
      while (v9 != 2);
    }
    uint64_t v23 = [v7 secureElements];
    if (![v23 count])
    {
      id v41 = __cxa_allocate_exception(0x48uLL);
      std::string::basic_string[abi:ne180100]<0>(&v45, "Error getting secure element array");
      uint64_t v42 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v41, (long long *)&v45, 31, @"SEUpdaterErrorDomain");
    }
    v45.__r_.__value_.__r.__words[0] = 0;
    v45.__r_.__value_.__l.__size_ = (std::string::size_type)&v45;
    v45.__r_.__value_.__r.__words[2] = 0x3812000000;
    id v46 = __Block_byref_object_copy__4;
    uint64_t v47 = __Block_byref_object_dispose__4;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    _OWORD v44[2] = ___ZN9SEUpdater25PreflightUpdateController9doCommandEPK10__CFStringPPK14__CFDictionary_block_invoke;
    v44[3] = &unk_2648635A8;
    v44[4] = &v45;
    [v23 enumerateObjectsUsingBlock:v44];
    int v24 = *(const void **)(v45.__r_.__value_.__l.__size_ + 48);
    if (v24) {
      uint64_t v25 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
    }
    else {
      uint64_t v25 = 0;
    }
    if (v25)
    {
      uint64_t v26 = (std::__shared_weak_count *)operator new(0xB8uLL);
      v26->__shared_owners_ = 0;
      v26->__shared_weak_owners_ = 0;
      v26->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD75150;
      SERestoreInfo::BLOB::BLOB((SERestoreInfo::BLOB *)&v51, v24);
      SERestoreInfo::IcefallDeviceInfo::IcefallDeviceInfo((SERestoreInfo::IcefallDeviceInfo *)&v26[1], (const SERestoreInfo::BLOB *)&v51);
      SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)&v51);
      ((void (*)(std::__shared_weak_count *))v26[1].__on_zero_shared_weak)(&v26[1]);
      CFMutableDictionaryRef Dict = SERestoreInfo::SEDeviceInfo::createDict((SERestoreInfo::SEDeviceInfo *)&v26[1], 0);
      uint64_t v28 = (const void *)*((void *)this + 14);
      *((void *)this + 14) = Dict;
      long long v50 = v28;
      ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v50);
    }
    else
    {
      uint64_t v29 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
      uint64_t v30 = (SEUpdaterUtil::SELogObj *)off_268315F10;
      if (!off_268315F10) {
        SEUpdaterUtil::SELogObj::create_default_global(v29);
      }
      uint64_t v26 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
      if (*(&off_268315F10 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
      }
      pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
      SEUpdaterUtil::SELogObj::printLog(v30, (SEUpdaterUtil::SELogObj *)2, 0, 1, "doCommand", (SEUpdaterUtil::SELogObj *)"No personalisable SEs found\n");
    }
    if (v26) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v26);
    }
    _Block_object_dispose(&v45, 8);
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v49);

    id v5 = v43;
    goto LABEL_47;
  }
  id v13 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  id v14 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v13);
  }
  uint64_t v15 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  SEUpdaterUtil::SELogObj::printLog(v14, (SEUpdaterUtil::SELogObj *)2, 0, 1, "doCommand", (SEUpdaterUtil::SELogObj *)"Can't get softlinked NFHM class, nothing to personalize\n");
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
LABEL_48:
  return 1;
}

void sub_229356458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  _Block_object_dispose(va, 8);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v13);

  _Unwind_Resume(a1);
}

void sub_229356470(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);

  _Unwind_Resume(a1);
}

void sub_229356488()
{
}

void sub_2293564A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  if (v38) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v38);
  }
  _Block_object_dispose(&__p, 8);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v37);

  _Unwind_Resume(a1);
}

void sub_229356570()
{
}

void sub_2293566D4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a32 < 0) {
    operator delete(__p);
  }
  JUMPOUT(0x229356560);
}

void sub_2293566EC()
{
  __cxa_free_exception(v0);
  JUMPOUT(0x229356560);
}

void sub_2293566FC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a32 < 0) {
    operator delete(__p);
  }
  if (v32) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v32);
  }
  JUMPOUT(0x229356560);
}

void sub_229356728()
{
}

void sub_2293568A8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a32 < 0) {
    operator delete(__p);
  }
  _Block_object_dispose(&a19, 8);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v32);
  JUMPOUT(0x229356924);
}

void sub_2293568C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  __cxa_free_exception(v10);
  _Block_object_dispose(va, 8);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v11);
  JUMPOUT(0x229356924);
}

void sub_2293568D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_2293568EC()
{
  if (v0) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v0);
  }
  JUMPOUT(0x2293569F4);
}

void sub_229356944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v25 - 105) < 0) {
    JUMPOUT(0x229356964);
  }

  _Unwind_Resume(a1);
}

void sub_22935696C()
{
  if (*(char *)(v0 - 105) < 0) {
    operator delete(*(void **)(v0 - 128));
  }
  JUMPOUT(0x2293569B8);
}

void sub_229356984(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);

  _Unwind_Resume(a1);
}

void sub_22935699C(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);

  _Unwind_Resume(a1);
}

void sub_2293569B4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);

  _Unwind_Resume(a1);
}

void sub_2293569CC(_Unwind_Exception *a1)
{
  if (v2) {
    JUMPOUT(0x2293569E4);
  }

  _Unwind_Resume(a1);
}

id getNFHardwareManagerClass(void)
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)_MergedGlobals_3;
  uint64_t v7 = _MergedGlobals_3;
  if (!_MergedGlobals_3)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = ___ZL25getNFHardwareManagerClassv_block_invoke;
    v3[3] = &unk_2648635D0;
    v3[4] = &v4;
    ___ZL25getNFHardwareManagerClassv_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_229356AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 48) = 0;
  *(void *)(result + 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 48) = 0;
  return result;
}

const void **__Block_byref_object_dispose__4(uint64_t a1)
{
  return ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(a1 + 48));
}

void ___ZN9SEUpdater25PreflightUpdateController9doCommandEPK10__CFStringPPK14__CFDictionary_block_invoke(uint64_t a1, void *a2, int a3, unsigned char *a4)
{
  id v7 = a2;
  unsigned int v8 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  unsigned int v9 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v8);
  }
  uint64_t v10 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  id v11 = [v7 info];
  SEUpdaterUtil::SELogObj::printLog(v9, (SEUpdaterUtil::SELogObj *)2, 0, 1, "doCommand_block_invoke", (SEUpdaterUtil::SELogObj *)"SE %u personalisable %d\n", a3, [v11 personalisable]);

  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  id v12 = [v7 info];
  int v13 = [v12 personalisable];

  if (v13)
  {
    id v14 = [v7 info];
    uint64_t v15 = [v14 manifestQuery];
    int v16 = v15;
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
    if (v15) {
      CFRetain(v15);
    }
    uint64_t v18 = *(void *)(v17 + 48);
    *(void *)(v17 + 48) = v16;
    *(void *)&v22[0] = v18;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)v22);

    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48)) {
      uint64_t v19 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
    }
    else {
      uint64_t v19 = 0;
    }
    if (!v19)
    {
      exception = __cxa_allocate_exception(0x48uLL);
      std::string::basic_string[abi:ne180100]<0>(v22, "Got personalisable SE with nil manifestQuery?!");
      uint64_t v21 = (void *)SERestoreInfo::SEException::SEException((uint64_t)exception, v22, 31, @"SEUpdaterErrorDomain");
    }
    *a4 = 1;
  }
}

void sub_229356CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void SEUpdater::PreflightUpdateController::~PreflightUpdateController(const void **this)
{
  SEUpdater::UpdateControllerBase::~UpdateControllerBase(this);

  JUMPOUT(0x22A6B67D0);
}

Class ___ZL25getNFHardwareManagerClassv_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!qword_26AD829D0)
  {
    v4[1] = MEMORY[0x263EF8330];
    unint64_t v4[2] = 3221225472;
    v4[3] = ___ZL20NearFieldLibraryCorePPc_block_invoke;
    unint64_t v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2648635F0;
    uint64_t v6 = 0;
    qword_26AD829D0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_26AD829D0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("NFHardwareManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  _MergedGlobals_3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ___ZL20NearFieldLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_26AD829D0 = result;
  return result;
}

void std::__shared_ptr_emplace<SERestoreInfo::IcefallDeviceInfo>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD75150;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SERestoreInfo::IcefallDeviceInfo>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD75150;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__shared_ptr_emplace<SERestoreInfo::IcefallDeviceInfo>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::allocate_shared[abi:ne180100]<SERestoreInfo::P73DeviceInfo,std::allocator<SERestoreInfo::P73DeviceInfo>,__CFData const* const&,void>(void *a1, const void *a2)
{
  uint64_t v4 = (char *)operator new(0xD8uLL);
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *(void *)uint64_t v4 = &unk_26DD749F0;
  SERestoreInfo::BLOB::BLOB((SERestoreInfo::BLOB *)v5, a2);
  SERestoreInfo::P73DeviceInfo::P73DeviceInfo((void **)v4 + 3, (const SERestoreInfo::BLOB *)v5);
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)v5);
  *a1 = v4 + 24;
  a1[1] = v4;
}

void sub_2293570B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)&a9);
  std::__shared_weak_count::~__shared_weak_count(v9);
  operator delete(v11);
  _Unwind_Resume(a1);
}

void std::allocate_shared[abi:ne180100]<SERestoreInfo::SN100VDeviceInfo,std::allocator<SERestoreInfo::SN100VDeviceInfo>,__CFData const* const&,void>(void *a1, const void *a2)
{
  uint64_t v4 = operator new(0xD8uLL);
  v4[1] = 0;
  unint64_t v4[2] = 0;
  *uint64_t v4 = &unk_26DD74A40;
  SERestoreInfo::BLOB::BLOB((SERestoreInfo::BLOB *)v5, a2);
  SERestoreInfo::SN100VDeviceInfo::SN100VDeviceInfo((SERestoreInfo::SN100VDeviceInfo *)(v4 + 3), (const SERestoreInfo::BLOB *)v5);
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)v5);
  *a1 = v4 + 3;
  a1[1] = v4;
}

void sub_229357168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)&a9);
  std::__shared_weak_count::~__shared_weak_count(v9);
  operator delete(v11);
  _Unwind_Resume(a1);
}

void std::allocate_shared[abi:ne180100]<SERestoreInfo::SN200VDeviceInfo,std::allocator<SERestoreInfo::SN200VDeviceInfo>,__CFData const* const&,void>(void *a1, const void *a2)
{
  uint64_t v4 = operator new(0xD8uLL);
  v4[1] = 0;
  unint64_t v4[2] = 0;
  *uint64_t v4 = &unk_26DD74A90;
  SERestoreInfo::BLOB::BLOB((SERestoreInfo::BLOB *)v5, a2);
  SERestoreInfo::SN200VDeviceInfo::SN200VDeviceInfo((SERestoreInfo::SN200VDeviceInfo *)(v4 + 3), (const SERestoreInfo::BLOB *)v5);
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)v5);
  *a1 = v4 + 3;
  a1[1] = v4;
}

void sub_229357218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)&a9);
  std::__shared_weak_count::~__shared_weak_count(v9);
  operator delete(v11);
  _Unwind_Resume(a1);
}

void std::allocate_shared[abi:ne180100]<SERestoreInfo::SN210VDeviceInfo,std::allocator<SERestoreInfo::SN210VDeviceInfo>,__CFData const* const&,void>(void *a1, const void *a2)
{
  uint64_t v4 = operator new(0xD8uLL);
  v4[1] = 0;
  unint64_t v4[2] = 0;
  *uint64_t v4 = &unk_26DD74AE0;
  SERestoreInfo::BLOB::BLOB((SERestoreInfo::BLOB *)v5, a2);
  SERestoreInfo::SN210VDeviceInfo::SN210VDeviceInfo((SERestoreInfo::SN210VDeviceInfo *)(v4 + 3), (const SERestoreInfo::BLOB *)v5);
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)v5);
  *a1 = v4 + 3;
  a1[1] = v4;
}

void sub_2293572C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)&a9);
  std::__shared_weak_count::~__shared_weak_count(v9);
  operator delete(v11);
  _Unwind_Resume(a1);
}

void std::allocate_shared[abi:ne180100]<SERestoreInfo::SN300VDeviceInfo,std::allocator<SERestoreInfo::SN300VDeviceInfo>,__CFData const* const&,void>(void *a1, const void *a2)
{
  uint64_t v4 = operator new(0xD8uLL);
  v4[1] = 0;
  unint64_t v4[2] = 0;
  *uint64_t v4 = &unk_26DD74B30;
  SERestoreInfo::BLOB::BLOB((SERestoreInfo::BLOB *)v5, a2);
  SERestoreInfo::SN300VDeviceInfo::SN300VDeviceInfo((SERestoreInfo::SN300VDeviceInfo *)(v4 + 3), (const SERestoreInfo::BLOB *)v5);
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)v5);
  *a1 = v4 + 3;
  a1[1] = v4;
}

void sub_229357378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)&a9);
  std::__shared_weak_count::~__shared_weak_count(v9);
  operator delete(v11);
  _Unwind_Resume(a1);
}

void std::allocate_shared[abi:ne180100]<SERestoreInfo::SE310SDeviceInfo,std::allocator<SERestoreInfo::SE310SDeviceInfo>,__CFData const* const&,void>(void *a1, const void *a2)
{
  uint64_t v4 = operator new(0xD8uLL);
  v4[1] = 0;
  unint64_t v4[2] = 0;
  *uint64_t v4 = &unk_26DD74B80;
  SERestoreInfo::BLOB::BLOB((SERestoreInfo::BLOB *)v5, a2);
  SERestoreInfo::SE310SDeviceInfo::SE310SDeviceInfo((SERestoreInfo::SE310SDeviceInfo *)(v4 + 3), (const SERestoreInfo::BLOB *)v5);
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)v5);
  *a1 = v4 + 3;
  a1[1] = v4;
}

void sub_229357428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)&a9);
  std::__shared_weak_count::~__shared_weak_count(v9);
  operator delete(v11);
  _Unwind_Resume(a1);
}

void std::allocate_shared[abi:ne180100]<SERestoreInfo::SN300V2DeviceInfo,std::allocator<SERestoreInfo::SN300V2DeviceInfo>,__CFData const* const&,void>(void *a1, const void *a2)
{
  uint64_t v4 = operator new(0xD8uLL);
  v4[1] = 0;
  unint64_t v4[2] = 0;
  *uint64_t v4 = &unk_26DD74BD0;
  SERestoreInfo::BLOB::BLOB((SERestoreInfo::BLOB *)v5, a2);
  SERestoreInfo::SN300V2DeviceInfo::SN300V2DeviceInfo((SERestoreInfo::SN300V2DeviceInfo *)(v4 + 3), (const SERestoreInfo::BLOB *)v5);
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)v5);
  *a1 = v4 + 3;
  a1[1] = v4;
}

void sub_2293574D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)&a9);
  std::__shared_weak_count::~__shared_weak_count(v9);
  operator delete(v11);
  _Unwind_Resume(a1);
}

CFMutableDictionaryRef SERestoreInfo::SEDeviceInfo::createDict(SERestoreInfo::SEDeviceInfo *this, uint64_t a2)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    exception = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(&v9, "Cannot allocate for dict");
    unsigned int v8 = (void *)SERestoreInfo::SEException::SEException((uint64_t)exception, &v9, 3, @"SEUpdaterErrorDomain");
  }
  CFMutableDictionaryRef v5 = Mutable;
  (*(void (**)(SERestoreInfo::SEDeviceInfo *, CFMutableDictionaryRef, uint64_t))(*(void *)this + 24))(this, Mutable, a2);
  return v5;
}

void sub_2293575E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SERestoreInfo::SEException::SEException(uint64_t a1, long long *a2, int a3, CFTypeRef cf)
{
  v26[2] = *MEMORY[0x263EF8340];
  *(void *)a1 = &unk_26DD751A0;
  *(void *)(a1 + 8) = 0;
  uint64_t v7 = (void **)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  unsigned int v8 = (std::string::value_type *)(a1 + 32);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 32), *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v9 = *a2;
    *(void *)(a1 + 48) = *((void *)a2 + 2);
    *(_OWORD *)unsigned int v8 = v9;
  }
  *(_DWORD *)(a1 + 64) = a3;
  if (cf)
  {
    CFTypeRef v10 = CFRetain(cf);
    a3 = *(_DWORD *)(a1 + 64);
  }
  else
  {
    CFTypeRef v10 = 0;
  }
  *(void *)(a1 + 56) = v10;
  std::to_string(&v23, a3);
  id v11 = std::string::insert(&v23, 0, "(");
  long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  v24.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v24.__r_.__value_.__l.__data_ = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  int v13 = std::string::append(&v24, ") ");
  long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  v25.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v25.__r_.__value_.__l.__data_ = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  int v15 = *(char *)(a1 + 55);
  if (v15 >= 0) {
    int v16 = v8;
  }
  else {
    int v16 = *(const std::string::value_type **)(a1 + 32);
  }
  if (v15 >= 0) {
    std::string::size_type v17 = *(unsigned __int8 *)(a1 + 55);
  }
  else {
    std::string::size_type v17 = *(void *)(a1 + 40);
  }
  uint64_t v18 = std::string::append(&v25, v16, v17);
  std::string::size_type v19 = v18->__r_.__value_.__r.__words[0];
  v26[0] = v18->__r_.__value_.__l.__size_;
  *(void *)((char *)v26 + 7) = *(std::string::size_type *)((char *)&v18->__r_.__value_.__r.__words[1] + 7);
  char v20 = HIBYTE(v18->__r_.__value_.__r.__words[2]);
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*v7);
  }
  uint64_t v21 = v26[0];
  *(void *)(a1 + 8) = v19;
  *(void *)(a1 + 16) = v21;
  *(void *)(a1 + 23) = *(void *)((char *)v26 + 7);
  *(unsigned char *)(a1 + 31) = v20;
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v25.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v23.__r_.__value_.__l.__data_);
  }
  return a1;
}

void sub_2293577E8(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

SERestoreInfo::SEException *SERestoreInfo::SEException::SEException(SERestoreInfo::SEException *this, CFErrorRef err)
{
  v34[2] = *MEMORY[0x263EF8340];
  *(void *)this = &unk_26DD751A0;
  *(_OWORD *)((char *)this + 8) = 0u;
  uint64_t v4 = (void **)((char *)this + 8);
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  CFStringRef v5 = CFErrorCopyDescription(err);
  CFStringRef v6 = v5;
  if (v5)
  {
    CFIndex Length = CFStringGetLength(v5);
    usedBufLen.__r_.__value_.__r.__words[0] = 0;
    v35.location = 0;
    v35.length = Length;
    CFIndex Bytes = CFStringGetBytes(v6, v35, 0x8000100u, 0, 0, 0, 0, (CFIndex *)&usedBufLen);
    if (!usedBufLen.__r_.__value_.__r.__words[0] || !Bytes)
    {
LABEL_22:
      CFRelease(v6);
      goto LABEL_23;
    }
    std::vector<unsigned char>::vector(&__p, usedBufLen.__r_.__value_.__r.__words[0]);
    v36.location = 0;
    v36.length = Length;
    if (!CFStringGetBytes(v6, v36, 0x8000100u, 0, 0, (UInt8 *)__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0], 0))
    {
LABEL_20:
      if (__p.__r_.__value_.__r.__words[0])
      {
        __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      goto LABEL_22;
    }
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
    long long v9 = (char *)__p.__r_.__value_.__r.__words[0];
    std::string::size_type v11 = __p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0];
    if (*((char *)this + 55) < 0)
    {
      uint64_t v14 = *((void *)this + 6);
      std::string::size_type v13 = (v14 & 0x7FFFFFFFFFFFFFFFLL) - 1;
      if (v13 >= v11)
      {
        if ((v14 & 0x8000000000000000) == 0) {
          goto LABEL_11;
        }
        goto LABEL_13;
      }
      std::string::size_type v12 = *((void *)this + 5);
    }
    else
    {
      if (v11 <= 0x16)
      {
LABEL_11:
        int v15 = (char *)this + 32;
LABEL_14:
        if ((char *)size != v9)
        {
          std::string::size_type v16 = v11;
          do
          {
            char v17 = *v9++;
            *v15++ = v17;
            --v16;
          }
          while (v16);
        }
        unsigned char *v15 = 0;
        if (*((char *)this + 55) < 0) {
          *((void *)this + 5) = v11;
        }
        else {
          *((unsigned char *)this + 55) = v11 & 0x7F;
        }
        goto LABEL_20;
      }
      std::string::size_type v12 = *((unsigned __int8 *)this + 55);
      std::string::size_type v13 = 22;
    }
    std::string::__grow_by((std::string *)((char *)this + 32), v13, v11 - v13, v12, 0, v12, 0);
    *((void *)this + 5) = 0;
    if ((*((unsigned char *)this + 55) & 0x80) == 0) {
      goto LABEL_11;
    }
LABEL_13:
    int v15 = (unsigned char *)*((void *)this + 4);
    goto LABEL_14;
  }
LABEL_23:
  *((_DWORD *)this + 16) = CFErrorGetCode(err);
  Domain = CFErrorGetDomain(err);
  if (Domain) {
    Domain = CFRetain(Domain);
  }
  *((void *)this + 7) = Domain;
  std::to_string(&v31, *((int *)this + 16));
  std::string::size_type v19 = std::string::insert(&v31, 0, "CF=(");
  long long v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  usedBufLen.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&usedBufLen.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  uint64_t v21 = std::string::append(&usedBufLen, ") ");
  long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v22;
  v21->__r_.__value_.__l.__size_ = 0;
  v21->__r_.__value_.__r.__words[2] = 0;
  v21->__r_.__value_.__r.__words[0] = 0;
  int v23 = *((char *)this + 55);
  if (v23 >= 0) {
    std::string v24 = (char *)this + 32;
  }
  else {
    std::string v24 = (const std::string::value_type *)*((void *)this + 4);
  }
  if (v23 >= 0) {
    std::string::size_type v25 = *((unsigned __int8 *)this + 55);
  }
  else {
    std::string::size_type v25 = *((void *)this + 5);
  }
  uint64_t v26 = std::string::append(&__p, v24, v25);
  std::string::size_type v27 = v26->__r_.__value_.__r.__words[0];
  v34[0] = v26->__r_.__value_.__l.__size_;
  *(void *)((char *)v34 + 7) = *(std::string::size_type *)((char *)&v26->__r_.__value_.__r.__words[1] + 7);
  char v28 = HIBYTE(v26->__r_.__value_.__r.__words[2]);
  v26->__r_.__value_.__l.__size_ = 0;
  v26->__r_.__value_.__r.__words[2] = 0;
  v26->__r_.__value_.__r.__words[0] = 0;
  if (*((char *)this + 31) < 0) {
    operator delete(*v4);
  }
  uint64_t v29 = v34[0];
  *((void *)this + 1) = v27;
  *((void *)this + 2) = v29;
  *(void *)((char *)this + 23) = *(void *)((char *)v34 + 7);
  *((unsigned char *)this + 31) = v28;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(usedBufLen.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(usedBufLen.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v31.__r_.__value_.__l.__data_);
  }
  return this;
}

void sub_229357B08(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void SERestoreInfo::SEException::~SEException(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_26DD751A0;
  uint64_t v2 = this[7].__vftable;
  if (v2)
  {
    CFRelease(v2);
    this[7].__vftable = 0;
  }
  if (SHIBYTE(this[6].__vftable) < 0) {
    operator delete(this[4].__vftable);
  }
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }

  std::exception::~exception(this);
}

{
  uint64_t vars8;

  SERestoreInfo::SEException::~SEException(this);

  JUMPOUT(0x22A6B67D0);
}

uint64_t SERestoreInfo::SEFirmwareBase::get(SERestoreInfo::SEFirmwareBase *this, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0
    || (uint64_t v2 = *((void *)this + 2), a2 >= (unint64_t)((*((void *)this + 3) - v2) >> 5)))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v7, "Assertion: ");
    CFStringRef v5 = std::string::append(&v7, "index>=0 && index<fObjs.size()");
    long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
    std::string::size_type v9 = v5->__r_.__value_.__r.__words[2];
    long long v8 = v6;
    v5->__r_.__value_.__l.__size_ = 0;
    v5->__r_.__value_.__r.__words[2] = 0;
    v5->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, &v8);
  }
  long long v8 = *(_OWORD *)(v2 + 32 * a2 + 8);
  return (*(uint64_t (**)(SERestoreInfo::SEFirmwareBase *, long long *))(*(void *)this + 24))(this, &v8);
}

void sub_229357CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

SERestoreInfo::SEFirmwareBase *SERestoreInfo::SEFirmwareBase::SEFirmwareBase(SERestoreInfo::SEFirmwareBase *this, CFDataRef theData)
{
  *(void *)this = &unk_26DD751E0;
  *((void *)this + 2) = 0;
  uint64_t v4 = (int64x2_t *)((char *)this + 16);
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  uint64_t v45 = 0;
  v43[0] = CFDataGetBytePtr(theData);
  v43[1] = CFDataGetLength(theData);
  int v5 = DERParseSequence((uint64_t)v43, 2u, (uint64_t)&SEFirmwareDERSpec::SEFirmwareItemSpec, (unint64_t)v46, 0x20uLL);
  if (v5)
  {
    exception = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(&v48, "Fail to parse SEFW.");
    uint64_t v30 = (void *)SERestoreInfo::SEException::SEException((uint64_t)exception, (long long *)&v48, v5, @"libDERErrorDomain");
  }
  unsigned int __val = 0;
  int v6 = DERParseInteger(v46, &__val);
  if (v6)
  {
    std::string v31 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(&v48, "Failed to parse SEFirmware.version.");
    uint64_t v32 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v31, (long long *)&v48, v6, @"libDERErrorDomain");
  }
  if (__val >= 2)
  {
    id v33 = __cxa_allocate_exception(0x48uLL);
    std::to_string(&v38, __val);
    uint64_t v34 = std::string::insert(&v38, 0, "Unsupported firmware version: ");
    std::string v48 = *v34;
    v34->__r_.__value_.__l.__size_ = 0;
    v34->__r_.__value_.__r.__words[2] = 0;
    v34->__r_.__value_.__r.__words[0] = 0;
    CFRange v35 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v33, (long long *)&v48, 7, @"SEUpdaterErrorDomain");
  }
  int v7 = DERDecodeSeqInit((uint64_t)&v47, &v45, v44);
  if (v7)
  {
    CFRange v36 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(&v48, "Fail to DERDecodeSeqInit firmwareArray.");
    id v37 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v36, (long long *)&v48, v7, @"libDERErrorDomain");
  }
  while (!v7)
  {
    int v7 = DERDecodeSeqNext(v44, &v40);
    if (!v7)
    {
      v38.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26DD73970;
      *(_OWORD *)&v38.__r_.__value_.__r.__words[1] = v41;
      uint64_t v39 = 0;
      unint64_t v8 = *((void *)this + 3);
      unint64_t v9 = *((void *)this + 4);
      if (v8 >= v9)
      {
        uint64_t v12 = (uint64_t)(v8 - v4->i64[0]) >> 5;
        unint64_t v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 59) {
          std::vector<std::string>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v14 = v9 - v4->i64[0];
        if (v14 >> 4 > v13) {
          unint64_t v13 = v14 >> 4;
        }
        if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v15 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v15 = v13;
        }
        long long v50 = (char *)this + 32;
        if (v15) {
          std::string::size_type v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SERestoreInfo::BLOB>>((uint64_t)this + 32, v15);
        }
        else {
          std::string::size_type v16 = 0;
        }
        char v17 = &v16[32 * v12];
        *(void *)char v17 = &unk_26DD73970;
        long long v18 = *(_OWORD *)&v38.__r_.__value_.__r.__words[1];
        *((void *)v17 + 3) = v39;
        *(_OWORD *)(v17 + 8) = v18;
        uint64_t v19 = *((void *)this + 2);
        unint64_t v20 = *((void *)this + 3);
        if (v20 == v19)
        {
          int64x2_t v24 = vdupq_n_s64(v20);
          int v22 = &v16[32 * v12];
        }
        else
        {
          uint64_t v21 = v17 - 32;
          int v22 = &v16[32 * v12];
          do
          {
            *((void *)v22 - 4) = &unk_26DD73970;
            v22 -= 32;
            long long v23 = *(_OWORD *)(v20 - 24);
            *((void *)v22 + 3) = *(void *)(v20 - 8);
            *(_OWORD *)(v22 + 8) = v23;
            v21 -= 32;
            v20 -= 32;
          }
          while (v20 != v19);
          int64x2_t v24 = *v4;
        }
        std::string::size_type v11 = v17 + 32;
        *((void *)this + 2) = v22;
        *((void *)this + 3) = v17 + 32;
        *(int64x2_t *)&v48.__r_.__value_.__r.__words[1] = v24;
        uint64_t v25 = *((void *)this + 4);
        *((void *)this + 4) = &v16[32 * v15];
        uint64_t v49 = v25;
        v48.__r_.__value_.__r.__words[0] = v24.i64[0];
        std::__split_buffer<SERestoreInfo::BLOB>::~__split_buffer((uint64_t)&v48);
      }
      else
      {
        *(void *)unint64_t v8 = &unk_26DD73970;
        long long v10 = *(_OWORD *)&v38.__r_.__value_.__r.__words[1];
        *(void *)(v8 + 24) = v39;
        *(_OWORD *)(v8 + 8) = v10;
        std::string::size_type v11 = (char *)(v8 + 32);
      }
      *((void *)this + 3) = v11;
      SERestoreInfo::BLOB::~BLOB((SERestoreInfo::BLOB *)&v38);
    }
  }
  if (v7 != 1)
  {
    std::string::size_type v27 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(&v48, "Fail to DERDecodeSeqNext firmwareArray.");
    char v28 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v27, (long long *)&v48, v7, @"libDERErrorDomain");
  }
  *((void *)this + 1) = CFRetain(theData);
  return this;
}

void sub_2293581DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  if (a35 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  std::vector<SERestoreInfo::BLOB>::__destroy_vector::operator()[abi:ne180100]((void ***)&a26);
  _Unwind_Resume(a1);
}

void SERestoreInfo::SEFirmwareBase::updateMeasurementDict(SERestoreInfo::SEFirmwareBase *this, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (*((void *)this + 3) - *((void *)this + 2)) >> 5;
  if (!v3) {
    goto LABEL_15;
  }
  char v7 = 0;
  unsigned int v8 = 0;
  do
  {
    SERestoreInfo::SEFirmwareBase::get(this, v8);
    if (!*(void *)a3) {
      goto LABEL_7;
    }
    uint64_t v9 = v16;
    (*(void (**)(void **__return_ptr))(**(void **)a3 + 16))(__p);
    int v10 = (*(uint64_t (**)(uint64_t, void **))(*(void *)v9 + 32))(v9, __p);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v10)
    {
LABEL_7:
      __p[0] = 0;
      (*(void (**)(uint64_t, uint64_t, void **))(*(void *)v16 + 16))(v16, a2, __p);
      if (__p[0])
      {
        exception = (SERestoreInfo::SEException *)__cxa_allocate_exception(0x48uLL);
        uint64_t v12 = SERestoreInfo::SEException::SEException(exception, (CFErrorRef)__p[0]);
      }
      char v7 = 1;
    }
    if (v17) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v17);
    }
    ++v8;
  }
  while (v3 != v8);
  if ((v7 & 1) == 0)
  {
LABEL_15:
    unint64_t v13 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(__p, "Cannot found any matched delivery object");
    uint64_t v14 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v13, (long long *)__p, 24, @"SEUpdaterErrorDomain");
  }
}

void sub_22935845C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

SEUpdaterUtil::SELogObj *SEUpdaterUtil::SELogObj::SELogObj(SEUpdaterUtil::SELogObj *this)
{
  uint64_t v2 = dispatch_queue_create("SELogObj", 0);
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = v2;
  if (v2)
  {
    uint64_t v3 = v2;
    dispatch_retain(v2);
    *((void *)this + 3) = 0;
    dispatch_release(v3);
  }
  else
  {
    *((void *)this + 3) = 0;
  }
  *((void *)this + 11) = 0;
  uint64_t v4 = (char *)operator new(0xF000uLL);
  *((void *)this + 7) = v4;
  *((void *)this + 8) = v4 + 61440;
  *((void *)this + 9) = v4;
  *((void *)this + 10) = v4;
  *((void *)this + 4) = SEUpdaterUtil::SELogObj::_defaultLogFunc;
  *((void *)this + 5) = 0;
  *((_DWORD *)this + 12) = 3;
  return this;
}

void sub_229358534(_Unwind_Exception *a1)
{
  ctu::SharedSynchronizable<SEUpdaterUtil::Error>::~SharedSynchronizable(v1);
  _Unwind_Resume(a1);
}

void *SEUpdaterUtil::SELogObj::_defaultLogFunc(SEUpdaterUtil::SELogObj *this, char *__s, const char *a3)
{
  size_t v4 = strlen(__s);
  int v5 = (void *)MEMORY[0x263F8C100];

  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)__s, v4);
}

void SEUpdaterUtil::SELogPrintBinary(SEUpdaterUtil *this, int a2, const unsigned __int8 *a3)
{
}

void sub_229358824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11)
{
}

void boost::circular_buffer<unsigned char,std::allocator<unsigned char>>::destroy(char **a1)
{
  uint64_t v3 = a1[1];
  uint64_t v2 = a1[2];
  size_t v4 = a1[4];
  int v5 = *a1;
  uint64_t v6 = v3 - v2;
  char v7 = &v5[v4 - v3];
  if (v6 <= (uint64_t)v4) {
    size_t v4 = v7;
  }
  a1[2] = &v4[(void)v2];
  if (v5) {
    operator delete(v5);
  }
}

void std::__shared_ptr_pointer<char *,std::shared_ptr<char>::__shared_ptr_default_delete<char,char>,std::allocator<char>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__shared_ptr_pointer<char *,std::shared_ptr<char>::__shared_ptr_default_delete<char,char>,std::allocator<char>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    JUMPOUT(0x22A6B67D0);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<char *,std::shared_ptr<char>::__shared_ptr_default_delete<char,char>,std::allocator<char>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t SEUpdaterUtil::Img4EncodeCallAndThrow(uint64_t this, char *a2, const char *a3)
{
  if (this != 100)
  {
    int v3 = this;
    exception = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(&v7, a2);
    uint64_t v6 = (void *)SERestoreInfo::SEException::SEException((uint64_t)exception, &v7, v3, @"libImage4Encode");
  }
  return this;
}

void sub_229358A24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SEUpdaterUtil::SN300VImage4Signer::getSigningAlgorithm(SEUpdaterUtil::SN300VImage4Signer *this)
{
  return 1;
}

void *SEUpdaterUtil::SN300VImage4Signer::getSigningKey@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(a1, &SEUpdaterUtil::SN300VImage4Signer::getSigningKey(void)const::signingKey, (uint64_t)&SEUpdaterUtil::SN300VImage4Signer::getSigningCert(void)const::signingCert, 0xA7uLL);
}

void *SEUpdaterUtil::SN300VImage4Signer::getSigningCert@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(a1, &SEUpdaterUtil::SN300VImage4Signer::getSigningCert(void)const::signingCert, (uint64_t)"N13SEUpdaterUtil18SN300VImage4SignerE", 0x31EuLL);
}

void SEUpdaterUtil::SN300VImage4Signer::~SN300VImage4Signer(const void **this)
{
  *this = &unk_26DD752F8;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(this + 1);
}

{
  uint64_t vars8;

  *this = &unk_26DD752F8;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(this + 1);

  JUMPOUT(0x22A6B67D0);
}

uint64_t SEUpdaterUtil::SEImage4Signer::sign@<X0>(const __CFDictionary **a1@<X0>, void *a2@<X8>)
{
  ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v5, *a1);
  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v6, "SE,ChipID");
  int Int = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v5, v6);
  MEMORY[0x22A6B62C0](&v6);
  if (Int <= 99)
  {
    switch(Int)
    {
      case ',':
        operator new();
      case '6':
        operator new();
      case '7':
        operator new();
    }
  }
  else if (Int > 199)
  {
    if (Int == 200) {
      operator new();
    }
    if (Int == 210) {
      operator new();
    }
  }
  else
  {
    if (Int == 100) {
      operator new();
    }
    if (Int == 115) {
      operator new();
    }
  }
  *a2 = 0;
  return MEMORY[0x22A6B62E0](v5);
}

void sub_229358F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va1, a5);
  va_start(va, a5);
  long long v7 = va_arg(va1, const void *);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)va);
  std::unique_ptr<SEUpdaterUtil::P73Image4Signer>::reset[abi:ne180100]((uint64_t *)(v5 - 40));
  MEMORY[0x22A6B62E0](va1);
  _Unwind_Resume(a1);
}

void SEUpdaterUtil::SEImage4Signer::signInternal(CFDataRef *a1, void **a2, const void **a3)
{
  if (*a3) {
    int v3 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    int v3 = 0;
  }
  if (!v3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    uint64_t v25 = (std::string *)std::string::basic_string[abi:ne180100]<0>(v46, "Assertion: ");
    uint64_t v26 = std::string::append(v25, "requestDict");
    long long v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
    uint64_t v39 = (void *)v26->__r_.__value_.__r.__words[2];
    *(_OWORD *)std::string __p = v27;
    v26->__r_.__value_.__l.__size_ = 0;
    v26->__r_.__value_.__r.__words[2] = 0;
    v26->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, __p);
  }
  *a1 = 0;
  uint64_t valuePtr = 0;
  uint64_t v45 = 0;
  long long v7 = a2 + 1;
  CFDataRef v43 = 0;
  if (a2 + 1 != (void **)a3)
  {
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef((const void **)__p, a3);
    unsigned int v8 = *v7;
    *long long v7 = __p[0];
    __p[0] = v8;
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)__p);
  }
  int v9 = (*((uint64_t (**)(void **))*a2 + 4))(a2);
  (*((void (**)(void **__return_ptr, void **))*a2 + 5))(v46, a2);
  (*((void (**)(void **__return_ptr, void **))*a2 + 6))(&v41, a2);
  LODWORD(__p[0]) = v9;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  __p[1] = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p[1], v41, (uint64_t)v42, v42 - (unsigned char *)v41);
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)*a3, @"SE,ChipID");
  if (!Value)
  {
    uint64_t v12 = 0;
    SEUpdaterUtil::_AddError((SEUpdaterUtil *)0x1D, 1, (uint64_t)"signInternal", (SEUpdaterUtil::SELogObj *)"Missing SE,ChipID in request dictionary", v11);
    goto LABEL_22;
  }
  if (!CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr))
  {
    char v28 = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v35, "Assertion: ");
    uint64_t v29 = std::string::append(&v35, "CFNumberGetValue(tmp, kCFNumberSInt32Type, (void *)&chipID)");
    long long v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
    int64_t v37 = v29->__r_.__value_.__r.__words[2];
    *(_OWORD *)CFRange v36 = v30;
    v29->__r_.__value_.__l.__size_ = 0;
    v29->__r_.__value_.__r.__words[2] = 0;
    v29->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](v28, v36);
  }
  RootCA::getRootKeyId(0, valuePtr, v36);
  uint64_t v12 = v36[0];
  unint64_t v13 = v36[1];
  v35.__r_.__value_.__r.__words[0] = (std::string::size_type)CFDictionaryGetValue((CFDictionaryRef)*a3, @"SE,RootKeyIdentifier");
  ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(v36, (CFTypeRef *)&v35.__r_.__value_.__l.__data_);
  CFDataRef v14 = v43;
  CFDataRef v43 = (const __CFData *)v36[0];
  v36[0] = v14;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)v36);
  if (v43) {
    uint64_t v16 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  }
  else {
    uint64_t v16 = 0;
  }
  if (!v16)
  {
    uint64_t v21 = "Missing SE,RootKeyIdentifier in request dictionary";
    goto LABEL_44;
  }
  BytePtr = CFDataGetBytePtr(v43);
  long long v18 = CFDataGetBytePtr(v43);
  CFIndex Length = CFDataGetLength(v43);
  unint64_t v20 = (const void *)(v13 - v12);
  if (v13 - v12 == &v18[Length] - BytePtr && !memcmp(v12, BytePtr, (size_t)v20))
  {
    id v33 = a2;
    uint64_t v34 = __p;
    if (Img4EncodeCreateManifest() == 100)
    {
      uint64_t v21 = "manifest is null or zero manifesetLen";
      if (v45 && HIDWORD(valuePtr))
      {
        CFDataRef v22 = CFDataCreate(0, v45, HIDWORD(valuePtr));
        *a1 = v22;
        v36[0] = 0;
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)v36);
        if (v22) {
          long long v23 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
        }
        else {
          long long v23 = 0;
        }
        if (v23) {
          goto LABEL_22;
        }
        uint64_t v21 = "failed to CFDataCreate for manifest data";
      }
    }
    else
    {
      uint64_t v21 = "failed to Img4EncodeCreateManifest";
    }
LABEL_44:
    SEUpdaterUtil::_AddError((SEUpdaterUtil *)0x1D, 1, (uint64_t)"signInternal", (SEUpdaterUtil::SELogObj *)v21, v15, v33, v34);
    goto LABEL_22;
  }
  ctu::cf::show((ctu::cf *)1, (uint64_t)v43, v20);
  if (v37 >= 0) {
    uint64_t v32 = v36;
  }
  else {
    uint64_t v32 = (void **)v36[0];
  }
  SEUpdaterUtil::_AddError((SEUpdaterUtil *)0x1D, 1, (uint64_t)"signInternal", (SEUpdaterUtil::SELogObj *)"KeyID %s is not localCA!", v31, v32);
  if (SHIBYTE(v37) < 0) {
    operator delete(v36[0]);
  }
LABEL_22:
  if (v45)
  {
    free(v45);
    uint64_t v45 = 0;
  }
  if (__p[1])
  {
    uint64_t v39 = __p[1];
    operator delete(__p[1]);
  }
  if (v41)
  {
    uint64_t v42 = v41;
    operator delete(v41);
  }
  if (v46[0])
  {
    v46[1] = v46[0];
    operator delete(v46[0]);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v43);
  if (v12) {
    operator delete(v12);
  }
}

void sub_2293594E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  if (a26) {
    operator delete(a26);
  }
  if (a30) {
    operator delete(a30);
  }
  std::string v35 = *(void **)(v33 - 88);
  if (v35)
  {
    *(void *)(v33 - 80) = v35;
    operator delete(v35);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v33 - 112));
  if (v32) {
    operator delete(v32);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v31);
  _Unwind_Resume(a1);
}

uint64_t SEUpdaterUtil::manifestPropertiesCallback(SEUpdaterUtil *this, unsigned __int8 **a2, unsigned int *a3, void *a4)
{
  if (!a2 || !this || !a3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v8, "Assertion: ");
    CFStringRef v6 = std::string::append(&v8, "context && outdata && outlength");
    long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
    std::string::size_type v10 = v6->__r_.__value_.__r.__words[2];
    long long v9 = v7;
    v6->__r_.__value_.__l.__size_ = 0;
    v6->__r_.__value_.__r.__words[2] = 0;
    v6->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, &v9);
  }
  (*(void (**)(unsigned int *, SEUpdaterUtil *, unsigned __int8 **, void *))(*(void *)a3 + 16))(a3, this, a2, a4);
  return 100;
}

void sub_22935973C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t SEUpdaterUtil::objectPropertiesCallback(SEUpdaterUtil *this, unsigned __int8 **a2, unsigned int *a3, void *a4)
{
  if (!a2 || !this || !a3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v8, "Assertion: ");
    CFStringRef v6 = std::string::append(&v8, "context && outdata && outlength");
    long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
    std::string::size_type v10 = v6->__r_.__value_.__r.__words[2];
    long long v9 = v7;
    v6->__r_.__value_.__l.__size_ = 0;
    v6->__r_.__value_.__r.__words[2] = 0;
    v6->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, &v9);
  }
  (*(void (**)(unsigned int *, SEUpdaterUtil *, unsigned __int8 **, void *))(*(void *)a3 + 24))(a3, this, a2, a4);
  return 100;
}

void sub_229359888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t SEUpdaterUtil::_createDataSignature(SEUpdaterUtil *this, uint64_t a2, const unsigned __int8 *a3, void *a4, unsigned __int8 **a5, unint64_t *a6, void *a7)
{
  if (!a6)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v28, "Assertion: ");
    unint64_t v15 = std::string::append(&v28, "context");
    long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
    v29.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v16;
    v15->__r_.__value_.__l.__size_ = 0;
    v15->__r_.__value_.__r.__words[2] = 0;
    v15->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, &v29);
  }
  if (!a4 || !a5)
  {
    char v17 = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v28, "Assertion: ");
    long long v18 = std::string::append(&v28, "outDataSignature && outDataSignatureLength");
    long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    v29.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](v17, &v29);
  }
  if (!a2 || !a3)
  {
    unint64_t v20 = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v28, "Assertion: ");
    uint64_t v21 = std::string::append(&v28, "dataToSign && dataToSignLength");
    long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
    v29.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v22;
    v21->__r_.__value_.__l.__size_ = 0;
    v21->__r_.__value_.__r.__words[2] = 0;
    v21->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](v20, &v29);
  }
  int v9 = *(_DWORD *)a6;
  if (*(_DWORD *)a6 == 2)
  {
    SignatureSha512 = AMSupportEcDsaCreateSignatureSha512();
  }
  else if (v9 == 1)
  {
    SignatureSha512 = AMSupportEcDsaCreateSignatureSha384();
  }
  else
  {
    if (v9)
    {
      uint64_t v25 = __cxa_allocate_exception(0x48uLL);
      std::to_string(&v28, *(_DWORD *)a6);
      uint64_t v26 = std::string::insert(&v28, 0, "Unknown algorithm ");
      std::string v29 = *v26;
      v26->__r_.__value_.__l.__size_ = 0;
      v26->__r_.__value_.__r.__words[2] = 0;
      v26->__r_.__value_.__r.__words[0] = 0;
      long long v27 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v25, (long long *)&v29, 29, @"SEUpdaterErrorDomain");
    }
    SignatureSha512 = AMSupportEcDsaCreateSignatureSha256();
  }
  uint64_t v12 = SignatureSha512;
  if (SignatureSha512)
  {
    SEUpdaterUtil::_AddError((SEUpdaterUtil *)0x1D, 1, (uint64_t)"_createDataSignature", (SEUpdaterUtil::SELogObj *)"Failed to sign: %d", v11, SignatureSha512);
    return v12;
  }
  if (!*a4)
  {
    long long v23 = "*outDataSignature is nullptr";
LABEL_23:
    SEUpdaterUtil::_AddError((SEUpdaterUtil *)0x1D, 1, (uint64_t)"_createDataSignature", (SEUpdaterUtil::SELogObj *)v23, v11);
    return 0;
  }
  if (!*a5)
  {
    long long v23 = "*outDataSignatureLength is 0";
    goto LABEL_23;
  }
  return 100;
}

void sub_229359C24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

void SEUpdaterUtil::SEImage4Signer::doManifestPropertiesCB(CFDictionaryRef *this, unsigned __int8 **a2, unsigned int *a3)
{
  if (!a2 || !a3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v43, "Assertion: ");
    char v17 = std::string::append(&v43, "outdata && outlength");
    long long v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
    std::string::size_type v45 = v17->__r_.__value_.__r.__words[2];
    long long v44 = v18;
    v17->__r_.__value_.__l.__size_ = 0;
    v17->__r_.__value_.__r.__words[2] = 0;
    v17->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, &v44);
  }
  uint64_t v42 = 0;
  int valuePtr = 0;
  if (Img4EncodeItemBegin() != 100)
  {
    std::string v29 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(&v44, "Fail to Img4EncodeItemBegin");
    long long v30 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v29, &v44, 29, @"SEUpdaterErrorDomain");
  }
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(this[1], @"SE,ChipID");
  if (!Value)
  {
    long long v19 = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v43, "Assertion: ");
    unint64_t v20 = std::string::append(&v43, "tmpNum");
    long long v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
    std::string::size_type v45 = v20->__r_.__value_.__r.__words[2];
    long long v44 = v21;
    v20->__r_.__value_.__l.__size_ = 0;
    v20->__r_.__value_.__r.__words[2] = 0;
    v20->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](v19, &v44);
  }
  if (!CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr))
  {
    long long v22 = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v43, "Assertion: ");
    long long v23 = std::string::append(&v43, "CFNumberGetValue(tmpNum, kCFNumberSInt32Type, (void*)&tmpValue)");
    long long v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
    std::string::size_type v45 = v23->__r_.__value_.__r.__words[2];
    long long v44 = v24;
    v23->__r_.__value_.__l.__size_ = 0;
    v23->__r_.__value_.__r.__words[2] = 0;
    v23->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](v22, &v44);
  }
  int v5 = Img4EncodeItemPropertyInt32();
  if (v5 != 100)
  {
    std::string v31 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(&v44, "Fail to add chip ID");
    uint64_t v32 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v31, &v44, v5, @"libImage4Encode");
  }
  CFDataRef v6 = (const __CFData *)CFDictionaryGetValue(this[1], @"SE,ID");
  CFDataRef v7 = v6;
  if (!v6 || (CFTypeID v8 = CFGetTypeID(v6), v8 != CFDataGetTypeID()))
  {
    uint64_t v25 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(&v44, "Fail to get SEID from the request");
    uint64_t v26 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v25, &v44, 29, @"SEUpdaterErrorDomain");
  }
  CFDataGetBytePtr(v7);
  CFDataGetLength(v7);
  int v9 = Img4EncodeItemPropertyData();
  if (v9 != 100)
  {
    uint64_t v33 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(&v44, "Fail to add SEID");
    uint64_t v34 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v33, &v44, v9, @"libImage4Encode");
  }
  CFDataRef v10 = (const __CFData *)CFDictionaryGetValue(this[1], @"SE,Nonce");
  CFDataRef v11 = v10;
  if (!v10 || (CFTypeID v12 = CFGetTypeID(v10), v12 != CFDataGetTypeID()))
  {
    long long v27 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(&v44, "Fail to get Nonce from the request");
    std::string v28 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v27, &v44, 100, @"libImage4Encode");
  }
  CFDataGetBytePtr(v11);
  CFDataGetLength(v11);
  int v13 = Img4EncodeItemPropertyData();
  if (v13 != 100)
  {
    std::string v35 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(&v44, "Fail to add Nonce");
    CFRange v36 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v35, &v44, v13, @"libImage4Encode");
  }
  int v14 = Img4EncodeItemEnd();
  if (v14 != 100)
  {
    int64_t v37 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(&v44, "Fail to Img4EncodeItemEnd");
    std::string v38 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v37, &v44, v14, @"libImage4Encode");
  }
  int v15 = Img4EncodeItemCopyBuffer();
  if (v15 != 100)
  {
    uint64_t v39 = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(&v44, "Fail to Img4EncodeItemCopyBuffer");
    uint64_t v40 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v39, &v44, v15, @"libImage4Encode");
  }
  SEUpdaterUtil::SEImg4EncodeContext::~SEImg4EncodeContext((SEUpdaterUtil::SEImg4EncodeContext *)&v42);
}

void sub_22935A2E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  SEUpdaterUtil::SEImg4EncodeContext::~SEImg4EncodeContext((SEUpdaterUtil::SEImg4EncodeContext *)&a11);
  _Unwind_Resume(a1);
}

uint64_t *std::unique_ptr<SEUpdaterUtil::P73Image4Signer>::reset[abi:ne180100](uint64_t *result)
{
  uint64_t v1 = *result;
  const void *result = 0;
  if (v1)
  {
    *(void *)uint64_t v1 = &unk_26DD752F8;
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)(v1 + 8));
    JUMPOUT(0x22A6B67D0);
  }
  return result;
}

void sub_22935A544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22935A5B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  CFDataRef v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)SETransceiveHelper;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_22935A804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::__shared_weak_count *a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a13);
  }
  if (a16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a16);
  }

  _Unwind_Resume(a1);
}

void sub_22935AADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::__shared_weak_count *a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a13);
  }
  if (a16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a16);
  }
  _Unwind_Resume(a1);
}

void sub_22935B1B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, std::__shared_weak_count *a20,uint64_t a21,uint64_t a22,std::__shared_weak_count *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,std::__shared_weak_count *a30)
{
  if (a20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a20);
  }

  if (a23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a23);
  }
  if (a30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a30);
  }
  *(void *)(v32 - 144) = &unk_26DD73620;
  uint64_t v34 = *(std::__shared_weak_count **)(v32 - 128);
  if (v34) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v34);
  }

  _Unwind_Resume(a1);
}

void sub_22935B5D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::__shared_weak_count *a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a13);
  }
  if (a16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a16);
  }
  _Unwind_Resume(a1);
}

void sub_22935BB60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::__shared_weak_count *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, std::__shared_weak_count *a20,uint64_t a21,uint64_t a22,std::__shared_weak_count *a23)
{
  if (a13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a13);
  }

  if (a20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a20);
  }
  if (a23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a23);
  }

  _Unwind_Resume(a1);
}

void sub_22935BFC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15)
{
  if (a15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a15);
  }

  _Unwind_Resume(a1);
}

void sub_22935C318(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::__shared_weak_count *a13)
{
  if (a13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a13);
  }
  *(void *)(v13 - 56) = &unk_26DD73620;
  int v15 = *(std::__shared_weak_count **)(v13 - 40);
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  _Unwind_Resume(exception_object);
}

void sub_22935C564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::__shared_weak_count *a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a13);
  }
  if (a16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a16);
  }

  _Unwind_Resume(a1);
}

void sub_22935C5F0()
{
}

void sub_22935C7EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::__shared_weak_count *a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (a13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a13);
  }
  _Unwind_Resume(exception_object);
}

void sub_22935C8DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22935CC50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,std::__shared_weak_count *a21)
{
  if (a14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a14);
  }
  if (a21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a21);
  }
  _Unwind_Resume(exception_object);
}

void SEUpdater::CommandCRSRetrieveSEPK::~CommandCRSRetrieveSEPK(SEUpdater::CommandCRSRetrieveSEPK *this)
{
  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD73620;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x22A6B67D0);
}

void sub_22935CFD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, std::__shared_weak_count *a20)
{
  if (a20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a20);
  }

  _Unwind_Resume(a1);
}

uint64_t SEUpdaterUtil::P73Image4Signer::getSigningAlgorithm(SEUpdaterUtil::P73Image4Signer *this)
{
  return 0;
}

double SEUpdaterUtil::P73Image4Signer::getSigningKey@<D0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  int v3 = operator new(0x79uLL);
  a1[1] = (char *)v3 + 121;
  a1[2] = (char *)v3 + 121;
  v3[4] = xmmword_22936DAB1;
  void v3[5] = unk_22936DAC1;
  void v3[6] = xmmword_22936DAD1;
  *(_OWORD *)((char *)v3 + 105) = *(long long *)((char *)&xmmword_22936DAD1 + 9);
  *int v3 = xmmword_22936DA71;
  v3[1] = unk_22936DA81;
  double result = -1.178079e-152;
  v3[2] = xmmword_22936DA91;
  v3[3] = unk_22936DAA1;
  *a1 = v3;
  return result;
}

void *SEUpdaterUtil::P73Image4Signer::getSigningCert@<X0>(char **a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  int v3 = (char *)operator new(0x26EuLL);
  *a1 = v3;
  size_t v4 = v3 + 622;
  a1[2] = v3 + 622;
  double result = memcpy(v3, &unk_22936DAEA, 0x26EuLL);
  a1[1] = v4;
  return result;
}

void SEUpdaterUtil::P73Image4Signer::~P73Image4Signer(const void **this)
{
  *this = &unk_26DD752F8;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(this + 1);
}

{
  uint64_t vars8;

  *this = &unk_26DD752F8;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(this + 1);

  JUMPOUT(0x22A6B67D0);
}

SERestoreInfo::IcefallDeviceInfo *SERestoreInfo::IcefallDeviceInfo::IcefallDeviceInfo(SERestoreInfo::IcefallDeviceInfo *this, const SERestoreInfo::BLOB *a2)
{
  *(void *)this = &unk_26DD753F8;
  *((_OWORD *)this + 1) = 0u;
  int v3 = (void *)((char *)this + 40);
  *((_OWORD *)this + 4) = 0u;
  size_t v4 = (void *)((char *)this + 64);
  int v5 = (void *)((char *)this + 88);
  *((_OWORD *)this + 7) = 0u;
  CFDataRef v6 = (void *)((char *)this + 112);
  *((void *)this + 16) = 0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_DWORD *)this + 37) = 6;
  *((_WORD *)this + 76) = 7;
  uint64_t v7 = *((void *)a2 + 1);
  if (!v7) {
    goto LABEL_6;
  }
  if ((*((void *)a2 + 2) & 0xFFFFFFFFFFFFFFFDLL) != 0x9D) {
    goto LABEL_6;
  }
  if (*(_WORD *)v7 != 257) {
    goto LABEL_6;
  }
  *((unsigned char *)this + 10) = *(unsigned char *)(v7 + 3) == 0;
  std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>((void *)this + 2, (char *)(v7 + 4), (char *)(v7 + 28), 0x18uLL);
  std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(v3, (char *)(v7 + 28), (char *)(v7 + 48), 0x14uLL);
  std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(v4, (char *)(v7 + 48), (char *)(v7 + 80), 0x20uLL);
  std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(v5, (char *)(v7 + 112), (char *)(v7 + 144), 0x20uLL);
  std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(v6, (char *)(v7 + 80), (char *)(v7 + 112), 0x20uLL);
  *((void *)this + 17) = *(void *)(v7 + 144);
  int v8 = *(_DWORD *)(v7 + 153);
  int v9 = *(unsigned __int8 *)(v7 + 2);
  *((_DWORD *)this + 36) = v8;
  *((_DWORD *)this + 37) = v9;
  if (v8 != 131601)
  {
LABEL_6:
    exception = (SERestoreInfo::SEWrongDeviceInfo *)__cxa_allocate_exception(0x48uLL);
    SERestoreInfo::SEWrongDeviceInfo::SEWrongDeviceInfo(exception);
  }
  return this;
}

void sub_22935D4E8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v7);
  int v9 = *v6;
  if (*v6)
  {
    v1[15] = v9;
    operator delete(v9);
  }
  CFDataRef v10 = *v5;
  if (*v5)
  {
    v1[12] = v10;
    operator delete(v10);
  }
  CFDataRef v11 = *v4;
  if (*v4)
  {
    _OWORD v1[9] = v11;
    operator delete(v11);
  }
  CFTypeID v12 = *v3;
  if (*v3)
  {
    v1[6] = v12;
    operator delete(v12);
  }
  uint64_t v13 = *v2;
  if (*v2)
  {
    v1[3] = v13;
    operator delete(v13);
  }
  _Unwind_Resume(a1);
}

void SERestoreInfo::IcefallDeviceInfo::updateDict(SERestoreInfo::IcefallDeviceInfo *this, __CFDictionary *a2, char a3)
{
  int valuePtr = *((_DWORD *)this + 36);
  CFNumberRef v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
  if (!v6) {
    __assert_rtn("_CFDictionarySetInteger32", "SERestoreInfoHelpers.hpp", 42, "num != nullptr");
  }
  CFNumberRef v7 = v6;
  CFDictionarySetValue(a2, @"SE,ChipID", v6);
  CFRelease(v7);
  CFDataRef v8 = CFDataCreate(0, *((const UInt8 **)this + 2), *((void *)this + 3) - *((void *)this + 2));
  if (!v8) {
    goto LABEL_15;
  }
  CFDataRef v9 = v8;
  CFDictionarySetValue(a2, @"SE,ID", v8);
  CFRelease(v9);
  CFDataRef v10 = CFDataCreate(0, *((const UInt8 **)this + 5), *((void *)this + 6) - *((void *)this + 5));
  if (!v10) {
    goto LABEL_15;
  }
  CFDataRef v11 = v10;
  CFDictionarySetValue(a2, @"SE,Nonce", v10);
  CFRelease(v11);
  uint64_t v12 = MEMORY[0x263EFFB40];
  if (*((unsigned char *)this + 153)) {
    CFDictionarySetValue(a2, @"SE,FactoryMode", (const void *)*MEMORY[0x263EFFB40]);
  }
  CFDataRef v13 = CFDataCreate(0, *((const UInt8 **)this + 8), *((void *)this + 9) - *((void *)this + 8));
  if (!v13) {
    goto LABEL_15;
  }
  CFDataRef v14 = v13;
  CFDictionarySetValue(a2, @"SE,RootKeyIdentifier", v13);
  CFRelease(v14);
  if (a3) {
    return;
  }
  int v15 = (const void **)(*((unsigned char *)this + 10) ? v12 : MEMORY[0x263EFFB38]);
  CFDictionarySetValue(a2, @"SE,IsDev", *v15);
  CFDataRef v16 = CFDataCreate(0, *((const UInt8 **)this + 14), *((void *)this + 15) - *((void *)this + 14));
  if (!v16
    || (CFDataRef v17 = v16,
        CFDictionarySetValue(a2, @"SE,BLFWKeysIdentifier", v16),
        CFRelease(v17),
        (CFDataRef v18 = CFDataCreate(0, *((const UInt8 **)this + 11), *((void *)this + 12) - *((void *)this + 11))) == 0))
  {
LABEL_15:
    __assert_rtn("_CFDictionarySetData", "SERestoreInfoHelpers.hpp", 59, "tmpData");
  }
  CFDataRef v19 = v18;
  CFDictionarySetValue(a2, @"SE,OsKeysIdentifier", v18);
  CFRelease(v19);
}

void SERestoreInfo::IcefallDeviceInfo::~IcefallDeviceInfo(SERestoreInfo::IcefallDeviceInfo *this)
{
  SERestoreInfo::IcefallDeviceInfo::~IcefallDeviceInfo(this);

  JUMPOUT(0x22A6B67D0);
}

{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  *(void *)this = &unk_26DD753F8;
  uint64_t v2 = (void *)*((void *)this + 14);
  if (v2)
  {
    *((void *)this + 15) = v2;
    operator delete(v2);
  }
  int v3 = (void *)*((void *)this + 11);
  if (v3)
  {
    *((void *)this + 12) = v3;
    operator delete(v3);
  }
  size_t v4 = (void *)*((void *)this + 8);
  if (v4)
  {
    *((void *)this + 9) = v4;
    operator delete(v4);
  }
  int v5 = (void *)*((void *)this + 5);
  if (v5)
  {
    *((void *)this + 6) = v5;
    operator delete(v5);
  }
  CFNumberRef v6 = (void *)*((void *)this + 2);
  if (v6)
  {
    *((void *)this + 3) = v6;
    operator delete(v6);
  }
}

void *SERestoreInfo::IcefallDeviceInfo::getOsKeyId@<X0>(SERestoreInfo::IcefallDeviceInfo *this@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a2, *((const void **)this + 11), *((void *)this + 12), *((void *)this + 12) - *((void *)this + 11));
}

uint64_t SERestoreInfo::IcefallDeviceInfo::getChipID(SERestoreInfo::IcefallDeviceInfo *this)
{
  return *((unsigned int *)this + 36);
}

SERestoreInfo::SN300VDeviceInfo *SERestoreInfo::SN300VDeviceInfo::SN300VDeviceInfo(SERestoreInfo::SN300VDeviceInfo *this, const SERestoreInfo::BLOB *a2)
{
  int v3 = SERestoreInfo::P73BaseDeviceInfo::P73BaseDeviceInfo(this, a2);
  *(void *)int v3 = &unk_26DD75448;
  if (*((_DWORD *)v3 + 14) != 44)
  {
    exception = (SERestoreInfo::SEWrongDeviceInfo *)__cxa_allocate_exception(0x48uLL);
    SERestoreInfo::SEWrongDeviceInfo::SEWrongDeviceInfo(exception);
  }
  return this;
}

void sub_22935D920(_Unwind_Exception *a1)
{
  SERestoreInfo::P73BaseDeviceInfo::~P73BaseDeviceInfo(v1);
  _Unwind_Resume(a1);
}

void SERestoreInfo::SN300VDeviceInfo::~SN300VDeviceInfo(SERestoreInfo::SN300VDeviceInfo *this)
{
  *(void *)this = &unk_26DD739B8;
  uint64_t v2 = (void *)*((void *)this + 19);
  if (v2)
  {
    *((void *)this + 20) = v2;
    operator delete(v2);
  }
  int v3 = (void *)*((void *)this + 14);
  if (v3)
  {
    *((void *)this + 15) = v3;
    operator delete(v3);
  }
  size_t v4 = (void *)*((void *)this + 11);
  if (v4)
  {
    *((void *)this + 12) = v4;
    operator delete(v4);
  }
  int v5 = (void *)*((void *)this + 8);
  if (v5)
  {
    *((void *)this + 9) = v5;
    operator delete(v5);
  }
  CFNumberRef v6 = (void *)*((void *)this + 4);
  if (v6)
  {
    *((void *)this + 5) = v6;
    operator delete(v6);
  }
}

{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t vars8;

  *(void *)this = &unk_26DD739B8;
  uint64_t v2 = (void *)*((void *)this + 19);
  if (v2)
  {
    *((void *)this + 20) = v2;
    operator delete(v2);
  }
  int v3 = (void *)*((void *)this + 14);
  if (v3)
  {
    *((void *)this + 15) = v3;
    operator delete(v3);
  }
  size_t v4 = (void *)*((void *)this + 11);
  if (v4)
  {
    *((void *)this + 12) = v4;
    operator delete(v4);
  }
  int v5 = (void *)*((void *)this + 8);
  if (v5)
  {
    *((void *)this + 9) = v5;
    operator delete(v5);
  }
  CFNumberRef v6 = (void *)*((void *)this + 4);
  if (v6)
  {
    *((void *)this + 5) = v6;
    operator delete(v6);
  }

  JUMPOUT(0x22A6B67D0);
}

void getAlohaPairingOptions(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = *a1;
  size_t v4 = [v3 objectForKeyedSubscript:@"Options"];
  if (!v4) {
    _ObjCLog((SEUpdaterUtil::SELogObj *)2, "getAlohaPairingOptions", &cfstr_OptionsNotPres.isa);
  }
  uint64_t v5 = [v4 objectForKeyedSubscript:@"DebugLogPath"];
  CFNumberRef v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    _ObjCLog((SEUpdaterUtil::SELogObj *)2, "getAlohaPairingOptions", &cfstr_DebuglogpathNo.isa);
  }
  CFDataRef v8 = [v3 objectForKeyedSubscript:@"RestoreOptions"];
  CFDataRef v9 = v8;
  if (!v8)
  {
    _ObjCLog((SEUpdaterUtil::SELogObj *)2, "getAlohaPairingOptions", &cfstr_SkipPairingDue.isa);
LABEL_15:
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 40) = 0;
    goto LABEL_27;
  }
  CFDataRef v10 = [v8 objectForKeyedSubscript:@"PairStockholm"];
  char v11 = [v10 BOOLValue];

  if ((v11 & 1) == 0)
  {
    _ObjCLog((SEUpdaterUtil::SELogObj *)2, "getAlohaPairingOptions", &cfstr_PairingNotEnab.isa);
    goto LABEL_15;
  }
  uint64_t v12 = [v9 objectForKeyedSubscript:@"StockholmPairingProtocolVersion"];
  CFDataRef v13 = [NSNumber numberWithInteger:[v12 integerValue]];
  if ([v13 integerValue] > 1)
  {
    CFDataRef v14 = [v9 objectForKeyedSubscript:@"StockholmPairingServerURL"];
    if (!v14)
    {
      _ObjCLog(0, "getAlohaPairingOptions", &cfstr_PairingIsReque.isa);
      exception = __cxa_allocate_exception(0x48uLL);
      std::string::basic_string[abi:ne180100]<0>(&v17, "Pairing is requested but no server URL is provided\n");
      CFDataRef v16 = (void *)SERestoreInfo::SEException::SEException((uint64_t)exception, &v17, 2, @"SEUpdaterErrorDomain");
    }
    long long v24 = v13;
    if (v13) {
      CFRetain(v13);
    }
    long long v23 = v14;
    CFRetain(v14);
    long long v22 = v6;
    if (v6) {
      CFRetain(v6);
    }
    LOBYTE(v17) = v11;
    if (v13) {
      CFRetain(v13);
    }
    CFRetain(v14);
    if (v6) {
      CFRetain(v6);
    }
    __int16 v20 = 1;
    char v21 = 1;
    *(unsigned char *)a2 = v11;
    *(void *)(a2 + 8) = v13;
    *(void *)(a2 + 16) = v14;
    *((void *)&v17 + 1) = 0;
    CFDataRef v18 = 0;
    *(void *)(a2 + 24) = v6;
    CFDataRef v19 = 0;
    *(_WORD *)(a2 + 32) = 1;
    *(unsigned char *)(a2 + 34) = 1;
    *(unsigned char *)(a2 + 40) = 1;
    ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v19);
    ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v18);
    ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)&v17 + 1);
    ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v22);
    ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v23);
    ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(&v24);
  }
  else
  {
    _ObjCLog((SEUpdaterUtil::SELogObj *)2, "getAlohaPairingOptions", &cfstr_SkipPairingDue_0.isa, v12);
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 40) = 0;
  }

LABEL_27:
}

void sub_22935DDA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_22935DE40()
{
}

void doAlohaPairing(unsigned __int8 *a1, uint64_t *a2)
{
  size_t v4 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  uint64_t v5 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v4);
  }
  CFNumberRef v6 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  SEUpdaterUtil::SELogObj::printLog(v5, (SEUpdaterUtil::SELogObj *)2, 0, 1, "print", (SEUpdaterUtil::SELogObj *)"Pairing options:\n");
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  BOOL v7 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  CFDataRef v8 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v7);
  }
  CFDataRef v9 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  SEUpdaterUtil::SELogObj::printLog(v8, (SEUpdaterUtil::SELogObj *)2, 0, 1, "print", (SEUpdaterUtil::SELogObj *)"Pairing selected: %d\n", *a1);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  CFDataRef v10 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  char v11 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v10);
  }
  uint64_t v12 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  uint64_t v14 = *((void *)a1 + 1);
  if (v14) {
    int v15 = ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::get;
  }
  else {
    int v15 = 0;
  }
  if (v15)
  {
    ctu::cf::show((ctu::cf *)1, v14, v13);
    if (v66 >= 0) {
      CFDataRef v16 = (const char *)&v65;
    }
    else {
      CFDataRef v16 = (const char *)v65;
    }
  }
  else
  {
    CFDataRef v16 = 0;
  }
  SEUpdaterUtil::SELogObj::printLog(v11, (SEUpdaterUtil::SELogObj *)2, 0, 1, "print", (SEUpdaterUtil::SELogObj *)"Pairing protocol version: %s\n", v16);
  if (v15 && v66 < 0) {
    operator delete((void *)v65);
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  long long v17 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  CFDataRef v18 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v17);
  }
  CFDataRef v19 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  uint64_t v21 = *((void *)a1 + 2);
  if (v21) {
    long long v22 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
  }
  else {
    long long v22 = 0;
  }
  if (v22)
  {
    ctu::cf::show((ctu::cf *)1, v21, v20);
    if (v64 >= 0) {
      long long v23 = __p;
    }
    else {
      long long v23 = (void **)__p[0];
    }
  }
  else
  {
    long long v23 = 0;
  }
  SEUpdaterUtil::SELogObj::printLog(v18, (SEUpdaterUtil::SELogObj *)2, 0, 1, "print", (SEUpdaterUtil::SELogObj *)"Pairing hostname URL: %s\n", (const char *)v23);
  if (v22 && v64 < 0) {
    operator delete(__p[0]);
  }
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  long long v24 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  uint64_t v25 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v24);
  }
  uint64_t v26 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  uint64_t v28 = *((void *)a1 + 3);
  if (v28) {
    std::string v29 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
  }
  else {
    std::string v29 = 0;
  }
  if (v29)
  {
    ctu::cf::show((ctu::cf *)1, v28, v27);
    if (v62 >= 0) {
      long long v30 = v61;
    }
    else {
      long long v30 = (void **)v61[0];
    }
  }
  else
  {
    long long v30 = 0;
  }
  SEUpdaterUtil::SELogObj::printLog(v25, (SEUpdaterUtil::SELogObj *)2, 0, 1, "print", (SEUpdaterUtil::SELogObj *)"Pairing error debug log path: %s\n", (const char *)v30);
  if (v29 && v62 < 0) {
    operator delete(v61[0]);
  }
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }
  std::string v31 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  uint64_t v32 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v31);
  }
  uint64_t v33 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  SEUpdaterUtil::SELogObj::printLog(v32, (SEUpdaterUtil::SELogObj *)2, 0, 1, "print", (SEUpdaterUtil::SELogObj *)"Pairing with reverse proxy: %d\n", a1[32]);
  if (v33) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v33);
  }
  uint64_t v34 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  std::string v35 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v34);
  }
  CFRange v36 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  SEUpdaterUtil::SELogObj::printLog(v35, (SEUpdaterUtil::SELogObj *)2, 0, 1, "print", (SEUpdaterUtil::SELogObj *)"Submitting sePK to FDR: %d\n", a1[34]);
  if (v36) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  }
  int64_t v37 = [AlohaPairingController alloc];
  std::string v38 = (std::__shared_weak_count *)a2[1];
  uint64_t v59 = *a2;
  long long v60 = v38;
  if (v38) {
    atomic_fetch_add_explicit(&v38->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v39 = [(AlohaPairingController *)v37 initWithOptions:a1 seController:&v59];
  if (v60) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v60);
  }
  uint64_t v40 = [(AlohaPairingController *)v39 performAlohaPairing];
  int v41 = v40;
  _ObjCLog((SEUpdaterUtil::SELogObj *)2, "doAlohaPairing", &cfstr_ApcFinishedWit.isa, v40);
  if (v41)
  {
    std::string::size_type v45 = [(AlohaPairingController *)v39 debugRecordPath];

    if (v45)
    {
      uint64_t v52 = [(AlohaPairingController *)v39 transceiver];
      id v53 = [v52 capduRecord];
      [(AlohaPairingController *)v39 writeRecord:v53 fileExtension:@"capdu"];

      id v54 = [(AlohaPairingController *)v39 transceiver];
      id v55 = [v54 rapduRecord];
      [(AlohaPairingController *)v39 writeRecord:v55 fileExtension:@"rapdu"];

      uint64_t v56 = [(AlohaPairingController *)v39 alohaPlistRecord];
      [(AlohaPairingController *)v39 writeRecord:v56 fileExtension:@"plist"];
    }
    else
    {
      _ObjCLog((SEUpdaterUtil::SELogObj *)2, "doAlohaPairing", &cfstr_DebuglogpathIs.isa);
    }
    [(AlohaPairingController *)v39 invalidate];
    exception = __cxa_allocate_exception(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(v58, "Aloha Pairing failed with return code\n");
    uint64_t v47 = (void *)SERestoreInfo::SEException::SEException((uint64_t)exception, v58, v41, @"SEUpdaterErrorDomain");
  }
  if (a1[34])
  {
    id v57 = 0;
    BOOL v42 = [(AlohaPairingController *)v39 submitPairingRecord:&v57];
    std::string v43 = (__CFError *)v57;
    if (v43) {
      BOOL v44 = 0;
    }
    else {
      BOOL v44 = v42;
    }
    if (!v44)
    {
      std::string v48 = v43;
      id v49 = [(__CFError *)v43 description];
      _ObjCLog(0, "doAlohaPairing", &cfstr_FailedToQueryS_2.isa, [v49 UTF8String]);

      [(AlohaPairingController *)v39 invalidate];
      long long v50 = (SERestoreInfo::SEException *)__cxa_allocate_exception(0x48uLL);
      std::string v51 = SERestoreInfo::SEException::SEException(v50, v48);
    }
  }
  [(AlohaPairingController *)v39 invalidate];
}

void sub_22935E5F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  _Unwind_Resume(a1);
}

void sub_22935E8D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }

  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::get(uint64_t a1)
{
  return *(void *)a1;
}

void sub_22935E968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  CFDataRef v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)AlohaPairingController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_22935EF50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22935F544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_22935FB90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, void *a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_22935FF84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_22936011C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_229360530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose((const void *)(v34 - 136), 8);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_229360724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_229360C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  id v19 = va_arg(va1, id);
  std::exception_ptr::~exception_ptr((std::exception_ptr *)(v11 - 112));
  if (*(unsigned char *)(v11 - 96)) {
    std::mutex::unlock(*(std::mutex **)(v11 - 104));
  }
  if (!atomic_fetch_add(v10 + 1, 0xFFFFFFFFFFFFFFFFLL)) {
    (*(void (**)(atomic_ullong *))(*v10 + 16))(v10);
  }
  _Block_object_dispose(va, 8);

  _Block_object_dispose(va1, 8);
  std::promise<BOOL>::~promise(v9);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__187(uint64_t result, uint64_t a2)
{
  *(void *)(result + 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 48) = 0;
  return result;
}

uint64_t *__Block_byref_object_dispose__188(uint64_t a1)
{
  return std::promise<BOOL>::~promise((uint64_t *)(a1 + 48));
}

void sub_229360E94(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_22936101C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_229361194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2293615A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__assoc_state<BOOL>::~__assoc_state(uint64_t a1)
{
  *(void *)a1 = MEMORY[0x263F8C320] + 16;
  uint64_t v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);

  std::__shared_count::~__shared_count((std::__shared_count *)a1);
}

{
  std::exception_ptr *v2;
  uint64_t vars8;

  *(void *)a1 = MEMORY[0x263F8C320] + 16;
  uint64_t v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__assoc_state<BOOL>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t *std::promise<BOOL>::~promise(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    if ((*(unsigned char *)(v2 + 136) & 1) == 0)
    {
      v10.__ptr_ = 0;
      uint64_t v3 = *(void *)(v2 + 16);
      std::exception_ptr::~exception_ptr(&v10);
      uint64_t v2 = *a1;
      if (!v3 && *(uint64_t *)(v2 + 8) >= 1)
      {
        uint64_t v5 = std::future_category();
        MEMORY[0x22A6B6490](&v8, 4, v5);
        exception = (std::logic_error *)__cxa_allocate_exception(0x20uLL);
        BOOL v7 = std::logic_error::logic_error(exception, &v8);
        v7->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C2E0] + 16);
        v7[1] = v9;
        __cxa_throw(v7, MEMORY[0x263F8C1A0], MEMORY[0x263F8C0C0]);
      }
    }
    if (!atomic_fetch_add((atomic_ullong *volatile)(v2 + 8), 0xFFFFFFFFFFFFFFFFLL)) {
      (*(void (**)(uint64_t))(*(void *)v2 + 16))(v2);
    }
  }
  return a1;
}

void sub_2293617F8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__assoc_sub_state *a10, char a11)
{
  __cxa_begin_catch(a1);
  std::current_exception();
  __cxa_end_catch();
  v12.__ptr_ = (void *)(v11 - 32);
  std::__assoc_sub_state::set_exception(a10, v12);
  std::exception_ptr::~exception_ptr((std::exception_ptr *)(v11 - 32));
  MEMORY[0x22A6B64A0](&a11);
  JUMPOUT(0x229361744);
}

void std::__throw_future_error[abi:ne180100](unsigned int a1)
{
  exception = __cxa_allocate_exception(0x20uLL);
  uint64_t v3 = std::future_category();
  MEMORY[0x22A6B6490](exception, a1, v3);
  __cxa_throw(exception, MEMORY[0x263F8C1A0], MEMORY[0x263F8C0C0]);
}

void sub_229361888(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void _GLOBAL__sub_I_AlohaPairingController_mm()
{
  uint64_t v0 = (void *)MEMORY[0x22A6B6C00]();
  _MergedGlobals_4 = [NSNumber numberWithInt:1];
  qword_26AD829E0 = [NSNumber numberWithInt:1];
  qword_26AD829E8 = [NSNumber numberWithInt:0];
}

CFErrorRef SERestoreInfo::CreateCFError(const UInt8 *a1, int a2, const void *a3, const __CFString *a4)
{
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v23, "Assertion: ");
    uint64_t v18 = std::string::append(&v23, "userInfo");
    long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    std::string::size_type v25 = v18->__r_.__value_.__r.__words[2];
    long long v24 = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, &v24);
  }
  std::exception_ptr v10 = Mutable;
  if ((char)a1[23] < 0)
  {
    std::exception_ptr v12 = a1;
    a1 = *(const UInt8 **)a1;
    CFIndex v11 = *((void *)v12 + 1);
  }
  else
  {
    CFIndex v11 = a1[23];
  }
  CFStringRef v13 = CFStringCreateWithBytes(v8, a1, v11, 0x8000100u, 0);
  if (!v13)
  {
    __int16 v20 = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v23, "Assertion: ");
    uint64_t v21 = std::string::append(&v23, "description");
    long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
    std::string::size_type v25 = v21->__r_.__value_.__r.__words[2];
    long long v24 = v22;
    v21->__r_.__value_.__l.__size_ = 0;
    v21->__r_.__value_.__r.__words[2] = 0;
    v21->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](v20, &v24);
  }
  CFStringRef v14 = v13;
  CFDictionaryAddValue(v10, (const void *)*MEMORY[0x263EFFC70], v13);
  CFRelease(v14);
  if (a3) {
    CFDictionaryAddValue(v10, (const void *)*MEMORY[0x263EFFC88], a3);
  }
  CFErrorRef v15 = CFErrorCreate(v8, a4, a2, v10);
  CFRelease(v10);
  return v15;
}

void sub_229361B24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  if (v22) {
    __cxa_free_exception(v21);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SEUpdaterUtil::SN210VImage4Signer::getSigningAlgorithm(SEUpdaterUtil::SN210VImage4Signer *this)
{
  return 0;
}

void *SEUpdaterUtil::SN210VImage4Signer::getSigningKey@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(a1, &SEUpdaterUtil::SN210VImage4Signer::getSigningKey(void)const::signingKey, (uint64_t)&SEUpdaterUtil::SN210VImage4Signer::getSigningCert(void)const::signingCert, 0x79uLL);
}

void *SEUpdaterUtil::SN210VImage4Signer::getSigningCert@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(a1, &SEUpdaterUtil::SN210VImage4Signer::getSigningCert(void)const::signingCert, (uint64_t)"N13SEUpdaterUtil18SN210VImage4SignerE", 0x276uLL);
}

void SEUpdaterUtil::SN210VImage4Signer::~SN210VImage4Signer(const void **this)
{
  *this = &unk_26DD752F8;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(this + 1);
}

{
  uint64_t vars8;

  *this = &unk_26DD752F8;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(this + 1);

  JUMPOUT(0x22A6B67D0);
}

SERestoreInfo::SE310SDeviceInfo *SERestoreInfo::SE310SDeviceInfo::SE310SDeviceInfo(SERestoreInfo::SE310SDeviceInfo *this, const SERestoreInfo::BLOB *a2)
{
  uint64_t v3 = SERestoreInfo::P73BaseDeviceInfo::P73BaseDeviceInfo(this, a2);
  *(void *)uint64_t v3 = &unk_26DD75540;
  if (*((_DWORD *)v3 + 14) != 55)
  {
    exception = (SERestoreInfo::SEWrongDeviceInfo *)__cxa_allocate_exception(0x48uLL);
    SERestoreInfo::SEWrongDeviceInfo::SEWrongDeviceInfo(exception);
  }
  return this;
}

void sub_229361D34(_Unwind_Exception *a1)
{
  SERestoreInfo::P73BaseDeviceInfo::~P73BaseDeviceInfo(v1);
  _Unwind_Resume(a1);
}

void SERestoreInfo::SE310SDeviceInfo::~SE310SDeviceInfo(SERestoreInfo::SE310SDeviceInfo *this)
{
  *(void *)this = &unk_26DD739B8;
  uint64_t v2 = (void *)*((void *)this + 19);
  if (v2)
  {
    *((void *)this + 20) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 14);
  if (v3)
  {
    *((void *)this + 15) = v3;
    operator delete(v3);
  }
  size_t v4 = (void *)*((void *)this + 11);
  if (v4)
  {
    *((void *)this + 12) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 8);
  if (v5)
  {
    *((void *)this + 9) = v5;
    operator delete(v5);
  }
  CFNumberRef v6 = (void *)*((void *)this + 4);
  if (v6)
  {
    *((void *)this + 5) = v6;
    operator delete(v6);
  }
}

{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t vars8;

  *(void *)this = &unk_26DD739B8;
  uint64_t v2 = (void *)*((void *)this + 19);
  if (v2)
  {
    *((void *)this + 20) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 14);
  if (v3)
  {
    *((void *)this + 15) = v3;
    operator delete(v3);
  }
  size_t v4 = (void *)*((void *)this + 11);
  if (v4)
  {
    *((void *)this + 12) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 8);
  if (v5)
  {
    *((void *)this + 9) = v5;
    operator delete(v5);
  }
  CFNumberRef v6 = (void *)*((void *)this + 4);
  if (v6)
  {
    *((void *)this + 5) = v6;
    operator delete(v6);
  }

  JUMPOUT(0x22A6B67D0);
}

void ___ZN13SERestoreInfo16SERestoreInfoLog3getEv_block_invoke()
{
}

void SERestoreInfo::SERestoreInfoLog::printToOsLog(SERestoreInfo::SERestoreInfoLog *this, char *a2, const char *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  std::string::basic_string[abi:ne180100]<0>(&__str, a2);
  unint64_t v3 = 0;
  size_t v4 = MEMORY[0x263EF8438];
  while ((SHIBYTE(__str.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (v3 >= HIBYTE(__str.__r_.__value_.__r.__words[2])) {
      return;
    }
LABEL_6:
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      std::string::basic_string(&v6, &__str, v3, 0x3E8uLL, (std::allocator<char> *)&v8);
      if ((v6.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v5 = &v6;
      }
      else {
        uint64_t v5 = (std::string *)v6.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)buf = 136315138;
      std::exception_ptr v10 = v5;
      _os_log_impl(&dword_229313000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
      if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v6.__r_.__value_.__l.__data_);
      }
    }
    v3 += 1000;
  }
  if (v3 < __str.__r_.__value_.__l.__size_) {
    goto LABEL_6;
  }
  operator delete(__str.__r_.__value_.__l.__data_);
}

void sub_229362038(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
}

char *SERestoreInfo::SERestoreInfoLog::FormatMsg(SERestoreInfo::SERestoreInfoLog *this, const char *a2, ...)
{
  va_start(va, a2);
  uint64_t v5 = 0;
  int v2 = vasprintf(&v5, "[%3.3ld.%1.1d] [%s] %s: %s", va);
  if (v5) {
    BOOL v3 = v2 <= 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    return 0;
  }
  else {
    return v5;
  }
}

char *SERestoreInfo::SERestoreInfoLog::createVerboseLogString(SERestoreInfo::SERestoreInfoLog *this, unsigned int a2, const char *a3, const char *a4)
{
  if (a2 >= 5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v13, "Assertion: ");
    uint64_t v11 = std::string::append(&v13, "level >= 0 && level < _LOG_LEVEL_MAX && \"level is not good\"");
    timeval v12 = *(timeval *)&v11->__r_.__value_.__l.__data_;
    std::string::size_type v15 = v11->__r_.__value_.__r.__words[2];
    timeval v14 = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, &v14);
  }
  v14.tv_sec = 0;
  *(void *)&v14.tv_usec = 0;
  BOOL v7 = (SERestoreInfo::SERestoreInfoLog *)gettimeofday(&v14, 0);
  return SERestoreInfo::SERestoreInfoLog::FormatMsg(v7, v8, v14.tv_sec, (v14.tv_usec / 1000), SERestoreInfo::logLevelNames[a2], a3, a4);
}

void sub_2293621AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  if (a19 < 0)
  {
    operator delete(a14);
    if ((v26 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v26)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v25);
  goto LABEL_8;
}

void SERestoreInfo::SERestoreInfoLog::printLogv(SERestoreInfo::SERestoreInfoLog *this, unsigned int a2, const char *a3, const char *a4, va_list a5)
{
  timeval v12 = 0;
  char v8 = (SERestoreInfo::SERestoreInfoLog *)vasprintf(&v12, a4, a5);
  std::logic_error v9 = v12;
  if ((int)v8 >= 1 && v12 != 0)
  {
    VerboseLogString = SERestoreInfo::SERestoreInfoLog::createVerboseLogString(v8, a2, a3, v12);
    free(v9);
    if (VerboseLogString)
    {
      std::mutex::lock((std::mutex *)((char *)this + 24));
      (*(void (**)(void, char *))this)(*((void *)this + 1), VerboseLogString);
      std::mutex::unlock((std::mutex *)((char *)this + 24));
      free(VerboseLogString);
    }
  }
}

void SERestoreInfo::SERestoreInfoLog::printLog(SERestoreInfo::SERestoreInfoLog *this, signed int a2, const char *a3, const char *a4, ...)
{
  va_start(va, a4);
  if (*((_DWORD *)this + 4) >= a2) {
    SERestoreInfo::SERestoreInfoLog::printLogv(this, a2, a3, a4, va);
  }
}

const void *SEUpdaterCreate(const __CFDictionary *a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a2)
  {
    char v8 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    uint64_t v9 = off_268315F10;
    if (!off_268315F10) {
      SEUpdaterUtil::SELogObj::create_default_global(v8);
    }
    std::exception_ptr v10 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
    if (*(&off_268315F10 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    __p[0] = (void *)MEMORY[0x263EF8330];
    __p[1] = (void *)0x40000000;
    id v46 = ___ZN13SEUpdaterUtil8SELogObj15registerLogSinkEPvPFvS1_PKcE_block_invoke;
    uint64_t v47 = &__block_descriptor_tmp_26;
    uint64_t v48 = v9;
    uint64_t v49 = a2;
    uint64_t v50 = a3;
    std::string v51 = __p;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZNK3ctu20SharedSynchronizableIN13SEUpdaterUtil8SELogObjEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke_0;
    block[3] = &__block_descriptor_tmp_27;
    block[4] = v9;
    block[5] = &v51;
    uint64_t v11 = *(NSObject **)(v9 + 16);
    if (*(void *)(v9 + 24))
    {
      dispatch_async_and_wait(v11, block);
      if (!v10) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    dispatch_sync(v11, block);
    if (v10) {
LABEL_8:
    }
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
LABEL_9:
  timeval v12 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  std::string v13 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v12);
  }
  timeval v14 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  std::string::basic_string[abi:ne180100]<0>(__p, "root");
  if (SHIBYTE(v46) >= 0) {
    std::string::size_type v15 = __p;
  }
  else {
    std::string::size_type v15 = (void **)__p[0];
  }
  SEUpdaterUtil::SELogObj::printLog(v13, (SEUpdaterUtil::SELogObj *)2, 0, 1, "SEUpdaterCreate", (SEUpdaterUtil::SELogObj *)"Project version%s: %s\n", " beta", (const char *)v15);
  if (SHIBYTE(v46) < 0) {
    operator delete(__p[0]);
  }
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a1, @"Options");
  CFDictionaryRef v17 = Value;
  if (Value && (CFTypeID v18 = CFGetTypeID(Value), v18 == CFDictionaryGetTypeID()))
  {
    long long v19 = (ctu::cf *)CFDictionaryGetValue(v17, @"PreflightContext");
    __int16 v20 = v19;
    if (v19)
    {
      CFTypeID v21 = CFGetTypeID(v19);
      if (v21 == CFStringGetTypeID())
      {
        char v22 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
        std::string v23 = (SEUpdaterUtil::SELogObj *)off_268315F10;
        if (!off_268315F10) {
          SEUpdaterUtil::SELogObj::create_default_global(v22);
        }
        long long v24 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
        if (*(&off_268315F10 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
        ctu::cf::show((uint64_t *)__p, v20, v25);
        if (SHIBYTE(v46) >= 0) {
          int v26 = __p;
        }
        else {
          int v26 = (void **)__p[0];
        }
        SEUpdaterUtil::SELogObj::printLog(v23, (SEUpdaterUtil::SELogObj *)1, 0, 1, "IsBootedOS", (SEUpdaterUtil::SELogObj *)"Got Updater Context %s\n", (const char *)v26);
        if (SHIBYTE(v46) < 0) {
          operator delete(__p[0]);
        }
        if (v24) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v24);
        }
        BOOL v27 = CFEqual((CFStringRef)v20, @"BootedOS");
        goto LABEL_51;
      }
    }
    std::string v31 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    uint64_t v32 = (SEUpdaterUtil::SELogObj *)off_268315F10;
    if (!off_268315F10) {
      SEUpdaterUtil::SELogObj::create_default_global(v31);
    }
    long long v30 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
    if (*(&off_268315F10 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    SEUpdaterUtil::SELogObj::printLog(v32, (SEUpdaterUtil::SELogObj *)1, 0, 1, "IsBootedOS", (SEUpdaterUtil::SELogObj *)"No updater context hint, defaulting to limited environment\n");
  }
  else
  {
    uint64_t v28 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    std::string v29 = (SEUpdaterUtil::SELogObj *)off_268315F10;
    if (!off_268315F10) {
      SEUpdaterUtil::SELogObj::create_default_global(v28);
    }
    long long v30 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
    if (*(&off_268315F10 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    SEUpdaterUtil::SELogObj::printLog(v29, (SEUpdaterUtil::SELogObj *)1, 0, 1, "IsBootedOS", (SEUpdaterUtil::SELogObj *)"No RestoreOptions dictionary? Defaulting to limited environment\n");
  }
  if (v30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }
  BOOL v27 = 0;
LABEL_51:
  SEUpdater::makeUpdateController((SEUpdater *)v27, __p);
  if (__p[0])
  {
    if (_MergedGlobals_5 != -1) {
      dispatch_once(&_MergedGlobals_5, &__block_literal_global_1);
    }
    if (qword_26AD829F8)
    {
      uint64_t Instance = _CFRuntimeCreateInstance();
      int64_t v37 = (const void *)Instance;
      if (Instance)
      {
        *(void *)(Instance + 16) = 0;
        SEUpdater::UpdateControllerBase::start((const void **)__p[0], a1, v35, v36);
        goto LABEL_57;
      }
      BOOL v44 = "fail to create SEUpdaterObj";
    }
    else
    {
      BOOL v44 = "fail to register kLibSEUpdaterClass";
    }
  }
  else
  {
    BOOL v44 = "no controller instance";
  }
  SEUpdaterUtil::_AddError((SEUpdaterUtil *)3, 1, (uint64_t)"SEUpdaterCreate", (SEUpdaterUtil::SELogObj *)v44, v33);
  int64_t v37 = 0;
LABEL_57:
  std::string v38 = (SEUpdaterUtil *)__p[1];
  if (__p[1]) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p[1]);
  }
  ErrorCode = (SEUpdaterUtil *)SEUpdaterUtil::GetErrorCode(v38);
  if (ErrorCode)
  {
    if (a4) {
      *a4 = SEUpdaterUtil::CreateCFError(ErrorCode);
    }
    if (v37)
    {
      CFRelease(v37);
      int64_t v37 = 0;
    }
  }
  uint64_t v40 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  int v41 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v40);
  }
  BOOL v42 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  SEUpdaterUtil::SELogObj::printLog(v41, (SEUpdaterUtil::SELogObj *)2, 0, 1, "SEUpdaterCreate", (SEUpdaterUtil::SELogObj *)"Created updater %p\n", v37);
  if (v42) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v42);
  }
  return v37;
}

void sub_229362920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  if (a2 == 3)
  {
    CFTypeID v18 = (unsigned int *)__cxa_begin_catch(a1);
    long long v19 = (SEUpdaterUtil *)v18[16];
    (*(void (**)(unsigned int *))(*(void *)v18 + 16))(v18);
    SEUpdaterUtil::_AddError(v19, 1, (uint64_t)"SEUpdaterCreate", (SEUpdaterUtil::SELogObj *)"%s", v20);
  }
  else
  {
    if (a2 != 2) {
      _Unwind_Resume(a1);
    }
    CFTypeID v21 = __cxa_begin_catch(a1);
    (*(void (**)(void *))(*(void *)v21 + 16))(v21);
    SEUpdaterUtil::_AddError((SEUpdaterUtil *)0x1F, 1, (uint64_t)"SEUpdaterCreate", (SEUpdaterUtil::SELogObj *)"%s", v22);
  }
  __cxa_end_catch();
  JUMPOUT(0x2293627F0);
}

void sub_229362B34()
{
}

void sub_229362B40()
{
}

uint64_t __SEUpdaterCreate_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  qword_26AD829F8 = result;
  return result;
}

void SEUpdaterDestroy(const void *a1)
{
  int v2 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  BOOL v3 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v2);
  }
  size_t v4 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  SEUpdaterUtil::SELogObj::printLog(v3, (SEUpdaterUtil::SELogObj *)2, 0, 1, "SEUpdaterDestroy", (SEUpdaterUtil::SELogObj *)"Called SEUpdaterDestroy updater %p\n", a1);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  if (a1)
  {
    pthread_mutex_lock(&ctu::Singleton<SEUpdater::UpdateControllerBase,SEUpdater::UpdateControllerBase,ctu::PthreadMutexGuardPolicy<SEUpdater::UpdateControllerBase>>::sInstance);
    uint64_t v5 = (std::__shared_weak_count *)*((void *)&xmmword_268316058 + 1);
    xmmword_268316058 = 0uLL;
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
    pthread_mutex_unlock(&ctu::Singleton<SEUpdater::UpdateControllerBase,SEUpdater::UpdateControllerBase,ctu::PthreadMutexGuardPolicy<SEUpdater::UpdateControllerBase>>::sInstance);
    pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::Error,SEUpdaterUtil::Error,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::Error>>::sInstance);
    std::string v6 = (std::__shared_weak_count *)*((void *)&xmmword_268315F60 + 1);
    xmmword_268315F60 = 0uLL;
    if (v6) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
    pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::Error,SEUpdaterUtil::Error,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::Error>>::sInstance);
    pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    BOOL v7 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
    off_268315F10 = 0;
    *(&off_268315F10 + 1) = 0;
    if (v7) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
    pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  }
}

void sub_229362CC0(_Unwind_Exception *a1)
{
}

CFStringRef SEUpdaterCreateDescribe(CFStringRef result)
{
  if (result)
  {
    CFStringRef v1 = result;
    CFAllocatorRef v2 = CFGetAllocator(result);
    CFAllocatorRef v3 = CFGetAllocator(v1);
    return CFStringCreateWithFormat(v2, 0, @"<libSEUpdater %p [%p]>{}", v1, v3);
  }
  return result;
}

uint64_t SEUpdaterUtil::GetErrorCode(SEUpdaterUtil *this)
{
  CFStringRef v1 = (SEUpdaterUtil::Error *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::Error,SEUpdaterUtil::Error,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::Error>>::sInstance);
  CFAllocatorRef v2 = (SEUpdaterUtil::Error *)xmmword_268315F60;
  if (!(void)xmmword_268315F60) {
    SEUpdaterUtil::Error::create_default_global(v1);
  }
  CFAllocatorRef v3 = (std::__shared_weak_count *)*((void *)&xmmword_268315F60 + 1);
  if (*((void *)&xmmword_268315F60 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_268315F60 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::Error,SEUpdaterUtil::Error,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::Error>>::sInstance);
  uint64_t ErrorCode = SEUpdaterUtil::Error::getErrorCode(v2);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  return ErrorCode;
}

void sub_229362E00(_Unwind_Exception *a1)
{
}

uint64_t SEUpdaterUtil::CreateCFError(SEUpdaterUtil *this)
{
  CFStringRef v1 = (SEUpdaterUtil::Error *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::Error,SEUpdaterUtil::Error,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::Error>>::sInstance);
  CFAllocatorRef v2 = (SEUpdaterUtil::Error *)xmmword_268315F60;
  if (!(void)xmmword_268315F60) {
    SEUpdaterUtil::Error::create_default_global(v1);
  }
  CFAllocatorRef v3 = (std::__shared_weak_count *)*((void *)&xmmword_268315F60 + 1);
  if (*((void *)&xmmword_268315F60 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_268315F60 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::Error,SEUpdaterUtil::Error,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::Error>>::sInstance);
  uint64_t CFError = SEUpdaterUtil::Error::CreateCFError(v2);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  return CFError;
}

void sub_229362EC8(_Unwind_Exception *a1)
{
}

BOOL SEUpdaterExecCommand(uint64_t a1, const __CFString *a2, const __CFDictionary *a3, const __CFDictionary **a4, char *a5)
{
  if (!a1 || !a2)
  {
    int v15 = 2;
    SEUpdaterUtil::_AddError((SEUpdaterUtil *)2, 0, (uint64_t)"SEUpdaterExecCommand", (SEUpdaterUtil::SELogObj *)"Invalid input", a5);
    goto LABEL_14;
  }
  pthread_mutex_lock(&ctu::Singleton<SEUpdater::UpdateControllerBase,SEUpdater::UpdateControllerBase,ctu::PthreadMutexGuardPolicy<SEUpdater::UpdateControllerBase>>::sInstance);
  uint64_t v9 = (const void **)xmmword_268316058;
  if (!(void)xmmword_268316058)
  {
    std::exception_ptr v10 = (std::__shared_weak_count *)*((void *)&xmmword_268316058 + 1);
    xmmword_268316058 = 0uLL;
    if (!v10)
    {
      uint64_t v9 = 0;
      uint64_t v11 = 0;
      goto LABEL_9;
    }
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    uint64_t v9 = (const void **)xmmword_268316058;
  }
  uint64_t v11 = (std::__shared_weak_count *)*((void *)&xmmword_268316058 + 1);
  if (*((void *)&xmmword_268316058 + 1))
  {
    char v12 = 0;
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_268316058 + 1) + 8), 1uLL, memory_order_relaxed);
    goto LABEL_10;
  }
LABEL_9:
  char v12 = 1;
LABEL_10:
  pthread_mutex_unlock(&ctu::Singleton<SEUpdater::UpdateControllerBase,SEUpdater::UpdateControllerBase,ctu::PthreadMutexGuardPolicy<SEUpdater::UpdateControllerBase>>::sInstance);
  if (v9)
  {
    timeval v14 = (SEUpdaterUtil *)SEUpdater::UpdateControllerBase::execCommand(v9, a2, a3, a4);
    int v15 = (int)v14;
  }
  else
  {
    int v15 = 2;
    SEUpdaterUtil::_AddError((SEUpdaterUtil *)2, 0, (uint64_t)"SEUpdaterExecCommand", (SEUpdaterUtil::SELogObj *)"no controller instance", v13);
  }
  if ((v12 & 1) == 0) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
LABEL_14:
  if (a5 && v15)
  {
    *(void *)a5 = SEUpdaterUtil::CreateCFError(v14);
    uint64_t v16 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    CFDictionaryRef v17 = (SEUpdaterUtil::SELogObj *)off_268315F10;
    if (!off_268315F10) {
      SEUpdaterUtil::SELogObj::create_default_global(v16);
    }
    CFTypeID v18 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
    if (*(&off_268315F10 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    SEUpdaterUtil::SELogObj::printLog(v17, (SEUpdaterUtil::SELogObj *)2, 0, 1, "SEUpdaterExecCommand", (SEUpdaterUtil::SELogObj *)"Returning outError:\n");
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
    SEUpdaterUtil::SELogPrintCFType((SEUpdaterUtil *)2, (ctu::cf *)1, *(const void **)a5, v19);
  }
  return v15 == 0;
}

void sub_2293630CC(_Unwind_Exception *a1)
{
}

void sub_229363100(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if ((v10 & 1) == 0) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  if (a2 == 2)
  {
    std::string v13 = (unsigned int *)__cxa_begin_catch(a1);
    timeval v14 = (SEUpdaterUtil *)v13[16];
    (*(void (**)(unsigned int *))(*(void *)v13 + 16))(v13);
    SEUpdaterUtil::_AddError(v14, 1, (uint64_t)"SEUpdaterExecCommand", (SEUpdaterUtil::SELogObj *)"%s", v15);
    __cxa_end_catch();
  }
  else
  {
    if (a2 != 1) {
      JUMPOUT(0x2293630F4);
    }
    uint64_t v16 = __cxa_begin_catch(a1);
    (*(void (**)(void *))(*(void *)v16 + 16))(v16);
    SEUpdaterUtil::_AddError((SEUpdaterUtil *)0x1F, 1, (uint64_t)"SEUpdaterExecCommand", (SEUpdaterUtil::SELogObj *)"%s", v17);
    __cxa_end_catch();
  }
  JUMPOUT(0x229362FA8);
}

void sub_2293631E4()
{
}

void sub_2293631F0()
{
}

void SEUpdaterUtil::SELogPrintCFType(SEUpdaterUtil *this, ctu::cf *a2, const void *a3, const void *a4)
{
  ctu::cf::show(a2, (uint64_t)a3, a3);
  uint64_t v5 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  std::string v6 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v5);
  }
  BOOL v7 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  p_p = (const char *)&__p;
  if (v10 < 0) {
    p_p = (const char *)__p;
  }
  SEUpdaterUtil::SELogObj::printLog(v6, this, 0, 1, 0, (SEUpdaterUtil::SELogObj *)"%s\n", p_p);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  if (v10 < 0) {
    operator delete(__p);
  }
}

void sub_2293632FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

BOOL SEUpdaterIsDone(uint64_t a1, CFErrorRef *a2)
{
  if (!a1) {
    return 0;
  }
  pthread_mutex_lock(&ctu::Singleton<SEUpdater::UpdateControllerBase,SEUpdater::UpdateControllerBase,ctu::PthreadMutexGuardPolicy<SEUpdater::UpdateControllerBase>>::sInstance);
  uint64_t v3 = xmmword_268316058;
  if (!(void)xmmword_268316058)
  {
    size_t v4 = (std::__shared_weak_count *)*((void *)&xmmword_268316058 + 1);
    xmmword_268316058 = 0uLL;
    if (!v4)
    {
      uint64_t v3 = 0;
      uint64_t v5 = 0;
      goto LABEL_8;
    }
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    uint64_t v3 = xmmword_268316058;
  }
  uint64_t v5 = (std::__shared_weak_count *)*((void *)&xmmword_268316058 + 1);
  if (*((void *)&xmmword_268316058 + 1))
  {
    char v6 = 0;
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_268316058 + 1) + 8), 1uLL, memory_order_relaxed);
    goto LABEL_9;
  }
LABEL_8:
  char v6 = 1;
LABEL_9:
  pthread_mutex_unlock(&ctu::Singleton<SEUpdater::UpdateControllerBase,SEUpdater::UpdateControllerBase,ctu::PthreadMutexGuardPolicy<SEUpdater::UpdateControllerBase>>::sInstance);
  if (v3)
  {
    BOOL v7 = *(unsigned char *)(v3 + 80) != 0;
    if (v6) {
      return v7;
    }
    goto LABEL_16;
  }
  if (a2)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "no controller instance");
    *a2 = SERestoreInfo::CreateCFError((const UInt8 *)__p, 3, 0, @"SEUpdaterErrorDomain");
    if (v10 < 0) {
      operator delete(__p[0]);
    }
  }
  BOOL v7 = 1;
  if ((v6 & 1) == 0) {
LABEL_16:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  return v7;
}

void sub_229363454(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if ((v16 & 1) == 0) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  _Unwind_Resume(exception_object);
}

void *___ZN13SEUpdaterUtil8SELogObj15registerLogSinkEPvPFvS1_PKcE_block_invoke(void *result)
{
  uint64_t v1 = result[5];
  if (!v1)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v6, "Assertion: ");
    size_t v4 = std::string::append(&v6, "logSink");
    long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
    std::string::size_type v8 = v4->__r_.__value_.__r.__words[2];
    long long v7 = v5;
    v4->__r_.__value_.__l.__size_ = 0;
    v4->__r_.__value_.__r.__words[2] = 0;
    v4->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, &v7);
  }
  uint64_t v2 = result[4];
  *(void *)(v2 + 32) = v1;
  *(void *)(v2 + 40) = result[6];
  return result;
}

void sub_229363548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

void *___ZNK3ctu20SharedSynchronizableIN13SEUpdaterUtil8SELogObjEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke_0(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 40) + 16))(*(void **)(a1 + 40));
}

void SEUpdater::cbNfRestoreSEEnumerate(_DWORD *a1, unsigned int a2, _OWORD *a3)
{
  if (!a3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v21, "Assertion: ");
    long long v19 = std::string::append(&v21, "ctx");
    long long v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
    std::string::size_type v23 = v19->__r_.__value_.__r.__words[2];
    long long v22 = v20;
    v19->__r_.__value_.__l.__size_ = 0;
    v19->__r_.__value_.__r.__words[2] = 0;
    v19->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, &v22);
  }
  if (a2)
  {
    uint64_t v5 = a2;
    while (1)
    {
      std::string v6 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
      long long v7 = (SEUpdaterUtil::SELogObj *)off_268315F10;
      if (!off_268315F10) {
        SEUpdaterUtil::SELogObj::create_default_global(v6);
      }
      std::string::size_type v8 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
      if (*(&off_268315F10 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
      }
      pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
      SEUpdaterUtil::SELogObj::printLog(v7, (SEUpdaterUtil::SELogObj *)3, 0, 1, "cbNfRestoreSEEnumerate", (SEUpdaterUtil::SELogObj *)"found SE with ID: %d \n", *a1);
      if (v8) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v8);
      }
      if (*((unsigned char *)a1 + 4)) {
        break;
      }
      a1 += 36;
      if (!--v5) {
        return;
      }
    }
    *a3 = *(_OWORD *)a1;
    long long v9 = *((_OWORD *)a1 + 1);
    long long v10 = *((_OWORD *)a1 + 2);
    long long v11 = *((_OWORD *)a1 + 4);
    a3[3] = *((_OWORD *)a1 + 3);
    a3[4] = v11;
    a3[1] = v9;
    a3[2] = v10;
    long long v12 = *((_OWORD *)a1 + 5);
    long long v13 = *((_OWORD *)a1 + 6);
    long long v14 = *((_OWORD *)a1 + 8);
    a3[7] = *((_OWORD *)a1 + 7);
    a3[8] = v14;
    a3[5] = v12;
    a3[6] = v13;
    int v15 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    char v16 = (SEUpdaterUtil::SELogObj *)off_268315F10;
    if (!off_268315F10) {
      SEUpdaterUtil::SELogObj::create_default_global(v15);
    }
    CFDictionaryRef v17 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
    if (*(&off_268315F10 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    SEUpdaterUtil::SELogObj::printLog(v16, (SEUpdaterUtil::SELogObj *)3, 0, 1, "cbNfRestoreSEEnumerate", (SEUpdaterUtil::SELogObj *)"Selecting SE with ID: %d \n", *a1);
    if (v17) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v17);
    }
  }
}

void sub_22936380C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
}

void SEUpdater::makeUpdateController(SEUpdater *this@<X0>, void *a2@<X8>)
{
  int v2 = (int)this;
  pthread_mutex_lock(&ctu::Singleton<SEUpdater::UpdateControllerBase,SEUpdater::UpdateControllerBase,ctu::PthreadMutexGuardPolicy<SEUpdater::UpdateControllerBase>>::sInstance);
  size_t v4 = (std::__shared_weak_count *)*((void *)&xmmword_268316058 + 1);
  xmmword_268316058 = 0uLL;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdater::UpdateControllerBase,SEUpdater::UpdateControllerBase,ctu::PthreadMutexGuardPolicy<SEUpdater::UpdateControllerBase>>::sInstance);
  uint64_t v5 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  std::string v6 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v5);
  }
  long long v7 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  SEUpdaterUtil::SELogObj::printLog(v6, (SEUpdaterUtil::SELogObj *)2, 0, 1, "makeUpdateController", (SEUpdaterUtil::SELogObj *)"Are we in booted OS? %d\n", v2);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  if (v2)
  {
    std::string::size_type v8 = (char *)operator new(0x98uLL);
    *((void *)v8 + 1) = 0;
    *((void *)v8 + 2) = 0;
    *(void *)std::string::size_type v8 = &unk_26DD75630;
    *(_OWORD *)(v8 + 24) = 0u;
    *(_OWORD *)(v8 + 40) = 0u;
    *(_OWORD *)(v8 + 56) = 0u;
    *(_OWORD *)(v8 + 72) = 0u;
    *(_OWORD *)(v8 + 88) = 0u;
    *(_OWORD *)(v8 + 104) = 0u;
    *(_OWORD *)(v8 + 120) = 0u;
    *(_OWORD *)(v8 + 136) = 0u;
    SEUpdater::UpdateControllerBase::UpdateControllerBase((SEUpdater::UpdateControllerBase *)(v8 + 24));
    *((void *)v8 + 3) = &unk_26DD75108;
    pthread_mutex_lock(&ctu::Singleton<SEUpdater::UpdateControllerBase,SEUpdater::UpdateControllerBase,ctu::PthreadMutexGuardPolicy<SEUpdater::UpdateControllerBase>>::sInstance);
    long long v9 = (std::__shared_weak_count *)*((void *)&xmmword_268316058 + 1);
    *(void *)&xmmword_268316058 = v8 + 24;
    *((void *)&xmmword_268316058 + 1) = v8;
    pthread_mutex_unlock(&ctu::Singleton<SEUpdater::UpdateControllerBase,SEUpdater::UpdateControllerBase,ctu::PthreadMutexGuardPolicy<SEUpdater::UpdateControllerBase>>::sInstance);
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
    pthread_mutex_lock(&ctu::Singleton<SEUpdater::UpdateControllerBase,SEUpdater::UpdateControllerBase,ctu::PthreadMutexGuardPolicy<SEUpdater::UpdateControllerBase>>::sInstance);
    uint64_t v10 = xmmword_268316058;
    if (!(void)xmmword_268316058)
    {
      long long v11 = (std::__shared_weak_count *)*((void *)&xmmword_268316058 + 1);
      xmmword_268316058 = 0uLL;
      if (!v11)
      {
        *a2 = 0;
        a2[1] = 0;
LABEL_41:
        pthread_mutex_unlock(&ctu::Singleton<SEUpdater::UpdateControllerBase,SEUpdater::UpdateControllerBase,ctu::PthreadMutexGuardPolicy<SEUpdater::UpdateControllerBase>>::sInstance);
        return;
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
      uint64_t v10 = xmmword_268316058;
    }
    uint64_t v12 = *((void *)&xmmword_268316058 + 1);
    *a2 = v10;
    a2[1] = v12;
    if (v12) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
    }
    goto LABEL_41;
  }
  uint64_t v13 = NfRestoreSEEnumerate();
  if (v13 == 1)
  {
    long long v14 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    int v15 = (SEUpdaterUtil::SELogObj *)off_268315F10;
    if (!off_268315F10) {
      SEUpdaterUtil::SELogObj::create_default_global(v14);
    }
    char v16 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
    if (*(&off_268315F10 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    SEUpdaterUtil::SELogObj::printLog(v15, 0, 0, 1, "getSEInfo", (SEUpdaterUtil::SELogObj *)"Ignoring NFC load stack error\n");
    if (v16) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v16);
    }
  }
  else
  {
    uint64_t v17 = v13;
    std::string::basic_string[abi:ne180100]<0>(&v26, "Failed to load NFC stack");
    SERestoreInfo::CallAndThrow<NfResult>(v17, (uint64_t)&v26);
    if (v27 < 0) {
      operator delete((void *)v26);
    }
  }
  CFTypeID v18 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  long long v19 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v18);
  }
  long long v20 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  SEUpdaterUtil::SELogObj::printLog(v19, (SEUpdaterUtil::SELogObj *)2, 0, 1, "makeUpdateController", (SEUpdaterUtil::SELogObj *)"No personalizable SE found\n");
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  _ZNSt3__115allocate_sharedB8ne180100IN9SEUpdater19NOPUpdateControllerENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_((SEUpdater::UpdateControllerBase **)&v26);
  long long v21 = v26;
  long long v26 = 0uLL;
  pthread_mutex_lock(&ctu::Singleton<SEUpdater::UpdateControllerBase,SEUpdater::UpdateControllerBase,ctu::PthreadMutexGuardPolicy<SEUpdater::UpdateControllerBase>>::sInstance);
  long long v22 = (std::__shared_weak_count *)*((void *)&xmmword_268316058 + 1);
  xmmword_268316058 = v21;
  pthread_mutex_unlock(&ctu::Singleton<SEUpdater::UpdateControllerBase,SEUpdater::UpdateControllerBase,ctu::PthreadMutexGuardPolicy<SEUpdater::UpdateControllerBase>>::sInstance);
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  pthread_mutex_lock(&ctu::Singleton<SEUpdater::UpdateControllerBase,SEUpdater::UpdateControllerBase,ctu::PthreadMutexGuardPolicy<SEUpdater::UpdateControllerBase>>::sInstance);
  uint64_t v23 = xmmword_268316058;
  if ((void)xmmword_268316058) {
    goto LABEL_38;
  }
  long long v24 = (std::__shared_weak_count *)*((void *)&xmmword_268316058 + 1);
  xmmword_268316058 = 0uLL;
  if (v24)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
    uint64_t v23 = xmmword_268316058;
LABEL_38:
    uint64_t v25 = *((void *)&xmmword_268316058 + 1);
    *a2 = v23;
    a2[1] = v25;
    if (v25) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v25 + 8), 1uLL, memory_order_relaxed);
    }
    goto LABEL_43;
  }
  *a2 = 0;
  a2[1] = 0;
LABEL_43:
  pthread_mutex_unlock(&ctu::Singleton<SEUpdater::UpdateControllerBase,SEUpdater::UpdateControllerBase,ctu::PthreadMutexGuardPolicy<SEUpdater::UpdateControllerBase>>::sInstance);
}

void sub_229363F40(_Unwind_Exception *a1)
{
}

void std::__shared_ptr_emplace<SEUpdater::PreflightUpdateController>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD75630;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SEUpdater::PreflightUpdateController>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD75630;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__shared_ptr_emplace<SEUpdater::PreflightUpdateController>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

SEUpdater::UpdateControllerBase *_ZNSt3__115allocate_sharedB8ne180100IN9SEUpdater19NOPUpdateControllerENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(SEUpdater::UpdateControllerBase **a1)
{
  int v2 = operator new(0x98uLL);
  v2[1] = 0;
  v2[2] = 0;
  *int v2 = &unk_26DD75680;
  uint64_t result = SEUpdater::UpdateControllerBase::UpdateControllerBase((SEUpdater::UpdateControllerBase *)(v2 + 3));
  v2[3] = &unk_26DD756D0;
  *((unsigned char *)v2 + 104) = 1;
  *a1 = result;
  a1[1] = (SEUpdater::UpdateControllerBase *)v2;
  return result;
}

void sub_2293641A4(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<SEUpdater::NOPUpdateController>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD75680;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SEUpdater::NOPUpdateController>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD75680;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__shared_ptr_emplace<SEUpdater::NOPUpdateController>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void SEUpdater::NOPUpdateController::~NOPUpdateController(const void **this)
{
  SEUpdater::UpdateControllerBase::~UpdateControllerBase(this);

  JUMPOUT(0x22A6B67D0);
}

uint64_t SEUpdater::NOPUpdateController::doCommand(SEUpdater::NOPUpdateController *this, const __CFString *a2, const __CFDictionary **a3)
{
  return 1;
}

void std::__shared_ptr_emplace<SEUpdater::P73BaseUpdateController>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD75718;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SEUpdater::P73BaseUpdateController>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DD75718;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A6B67D0);
}

uint64_t std::__shared_ptr_emplace<SEUpdater::P73BaseUpdateController>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

uint64_t SEUpdaterUtil::RegisterDebugSignals(SEUpdaterUtil *this)
{
  uint64_t v1 = 0;
  v3.__sigaction_u.__sa_handler = (void (__cdecl *)(int))SEUpdaterUtil::_handleSignals;
  *(void *)&v3.sa_mask = 0;
  do
    uint64_t result = sigaction(dword_22936E24C[v1++], &v3, 0);
  while (v1 != 6);
  return result;
}

void SEUpdaterUtil::_handleSignals(SEUpdaterUtil *this, int a2, __siginfo *a3, void *a4)
{
  size_t v4 = (FILE **)MEMORY[0x263EF8348];
  fprintf((FILE *)*MEMORY[0x263EF8348], "caught signal %d\n", this);
  uint64_t v5 = operator new(0x400uLL);
  bzero(v5, 0x400uLL);
  int v6 = backtrace((void **)v5, 128);
  backtrace_symbols_fd((void *const *)v5, v6, 2);
  operator delete(v5);
  fwrite("->pls attach debugger\n", 0x16uLL, 1uLL, *v4);
  __break(1u);
}

void sub_229364420(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void SEUpdaterUtil::parseArgs(uint64_t a1)
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v48, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string v48 = *(std::string *)a1;
  }
  MEMORY[0x22A6B66B0](&v82);
  LODWORD(v86) = 0x4000;
  std::locale::locale(&v87, &v82);
  LODWORD(v65) = v86;
  std::locale::locale(v66, &v87);
  if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v1 = &v48;
  }
  else {
    uint64_t v1 = (std::string *)v48.__r_.__value_.__r.__words[0];
  }
  if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v48.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v48.__r_.__value_.__l.__size_;
  }
  sigaction v3 = (std::string *)((char *)v1 + size);
  LODWORD(v93) = v65;
  std::locale::locale(&v94, v66);
  LODWORD(v102) = v93;
  std::locale::locale(&v103, &v94);
  size_t v4 = (std::locale::id *)MEMORY[0x263F8C108];
  while (size)
  {
    std::string::size_type v5 = size;
    uint64_t v6 = v1->__r_.__value_.__s.__data_[size - 1];
    long long v7 = std::locale::use_facet(&v103, v4);
    if ((v6 & 0x80) != 0)
    {
      uint64_t v1 = v3;
      break;
    }
    sigaction v3 = (std::string *)((char *)v3 - 1);
    int v8 = *((_DWORD *)&v7[1].~facet + v6);
    std::string::size_type size = v5 - 1;
    if ((v8 & v102) == 0)
    {
      uint64_t v1 = (std::string *)((char *)v1 + v5);
      break;
    }
  }
  std::locale::~locale(&v103);
  std::string::size_type v9 = HIBYTE(v48.__r_.__value_.__r.__words[2]);
  if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v10 = &v48;
  }
  else {
    uint64_t v10 = (std::string *)v48.__r_.__value_.__r.__words[0];
  }
  if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v9 = v48.__r_.__value_.__l.__size_;
  }
  std::string::erase(&v48, (char *)v1 - (char *)v10, (char *)v10 + v9 - (char *)v1);
  std::locale::~locale(&v94);
  std::locale::~locale(v66);
  LODWORD(v93) = v86;
  std::locale::locale(&v94, &v87);
  if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    long long v11 = &v48;
  }
  else {
    long long v11 = (std::string *)v48.__r_.__value_.__r.__words[0];
  }
  if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v12 = HIBYTE(v48.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v12 = v48.__r_.__value_.__l.__size_;
  }
  LODWORD(v102) = v93;
  std::locale::locale(&v103, &v94);
  if (v12)
  {
    uint64_t v13 = (std::string *)((char *)v11 + v12);
    long long v14 = (std::locale::id *)MEMORY[0x263F8C108];
    int v15 = v11;
    while (1)
    {
      uint64_t v16 = v15->__r_.__value_.__s.__data_[0];
      uint64_t v17 = std::locale::use_facet(&v103, v14);
      if ((v16 & 0x80) != 0 || (*((_DWORD *)&v17[1].~facet + v16) & v102) == 0) {
        break;
      }
      int v15 = (std::string *)((char *)v15 + 1);
      if (!--v12)
      {
        int v15 = v13;
        break;
      }
    }
  }
  else
  {
    int v15 = v11;
  }
  CFTypeID v18 = &v48;
  if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    CFTypeID v18 = (std::string *)v48.__r_.__value_.__r.__words[0];
  }
  std::string::erase(&v48, (char *)v11 - (char *)v18, (char *)v15 - (char *)v11);
  std::locale::~locale(&v103);
  std::locale::~locale(&v94);
  std::locale::~locale(&v87);
  std::locale::~locale(&v82);
  std::string::size_type v19 = HIBYTE(v48.__r_.__value_.__r.__words[2]);
  char v20 = HIBYTE(v48.__r_.__value_.__r.__words[2]);
  if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v19 = v48.__r_.__value_.__l.__size_;
  }
  if (v19)
  {
    long long v46 = 0uLL;
    std::string value = 0;
    MEMORY[0x22A6B66B0](&v68);
    int v44 = 0x4000;
    std::locale::locale(&v45, &v68);
    std::locale::locale((std::locale *)&v42 + 1, &v45);
    LODWORD(v102) = 0x4000;
    std::locale::locale(&v103, (const std::locale *)&v42 + 1);
    LODWORD(v49.__begin_) = v102;
    std::locale::locale((std::locale *)&v49.__end_, &v103);
    LODWORD(v49.__end_cap_.__value_) = 0;
    std::locale::~locale(&v103);
    if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      long long v21 = &v48;
    }
    else {
      long long v21 = (std::string *)v48.__r_.__value_.__r.__words[0];
    }
    if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v22 = HIBYTE(v48.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v22 = v48.__r_.__value_.__l.__size_;
    }
    LODWORD(__dst) = v49.__begin_;
    std::locale::locale(&v75, (const std::locale *)&v49.__end_);
    LODWORD(v76) = v49.__end_cap_.__value_;
    LODWORD(v50) = __dst;
    std::locale::locale(&v51, &v75);
    int v52 = v76;
    LODWORD(v78) = v50;
    std::locale::locale(&v79, &v51);
    LODWORD(end) = v52;
    uint64_t v56 = 0;
    LODWORD(v82.__locale_) = v78;
    std::locale::locale(&v83, &v79);
    LODWORD(v84) = end;
    LODWORD(v86) = v82.__locale_;
    std::locale::locale(&v87, &v83);
    LODWORD(v88) = v84;
    LODWORD(v93) = v86;
    std::locale::locale(&v94, &v87);
    LODWORD(v95) = v88;
    LODWORD(v102) = v93;
    std::locale::locale(&v103, &v94);
    LODWORD(v104) = v95;
    LODWORD(v57) = v102;
    std::locale::locale(&v58, &v103);
    int v59 = v104;
    std::locale::~locale(&v103);
    std::locale::~locale(&v94);
    std::locale::~locale(&v87);
    uint64_t v56 = &boost::function2<boost::iterator_range<std::__wrap_iter<char *>>,std::__wrap_iter<char *>,std::__wrap_iter<char *>>::assign_to<boost::algorithm::detail::token_finderF<boost::algorithm::detail::is_classifiedF>>(boost::algorithm::detail::token_finderF<boost::algorithm::detail::is_classifiedF>)::stored_vtable;
    std::locale::~locale(&v83);
    std::locale::~locale(&v79);
    std::locale::~locale(&v51);
    long long v60 = v21;
    uint64_t v61 = v21;
    char v62 = v21;
    uint64_t v63 = (char *)v21 + v22;
    char v64 = 0;
    if (v22) {
      boost::algorithm::split_iterator<std::__wrap_iter<char *>>::increment((uint64_t)&v56);
    }
    boost::algorithm::split_iterator<std::__wrap_iter<char *>>::split_iterator((uint64_t)&v65, (uint64_t *)&v56);
    boost::function2<boost::iterator_range<std::__wrap_iter<char *>>,std::__wrap_iter<char *>,std::__wrap_iter<char *>>::~function2((uint64_t *)&v56);
    std::locale::~locale(&v75);
    uint64_t v50 = 0;
    long long v53 = 0u;
    long long v54 = 0u;
    char v55 = 1;
    boost::algorithm::split_iterator<std::__wrap_iter<char *>>::split_iterator((uint64_t)&v86, &v50);
    boost::function2<boost::iterator_range<std::__wrap_iter<char *>>,std::__wrap_iter<char *>,std::__wrap_iter<char *>>::~function2(&v50);
    boost::algorithm::split_iterator<std::__wrap_iter<char *>>::split_iterator((uint64_t)&v82, &v65);
    boost::algorithm::split_iterator<std::__wrap_iter<char *>>::split_iterator((uint64_t)&v78, (uint64_t *)&v86);
    memset(&v67, 0, sizeof(v67));
    boost::algorithm::split_iterator<std::__wrap_iter<char *>>::split_iterator((uint64_t)&v102, (uint64_t *)&v82);
    boost::algorithm::split_iterator<std::__wrap_iter<char *>>::split_iterator((uint64_t)&v93, (uint64_t *)&v78);
    int v71 = &v67;
    char v72 = 0;
    while (1)
    {
      if (!v102)
      {
        if (v93) {
          BOOL v23 = v101 == 0;
        }
        else {
          BOOL v23 = 0;
        }
        if (!v23)
        {
LABEL_85:
          boost::function2<boost::iterator_range<std::__wrap_iter<char *>>,std::__wrap_iter<char *>,std::__wrap_iter<char *>>::~function2((uint64_t *)&v93);
          boost::function2<boost::iterator_range<std::__wrap_iter<char *>>,std::__wrap_iter<char *>,std::__wrap_iter<char *>>::~function2((uint64_t *)&v102);
          boost::function2<boost::iterator_range<std::__wrap_iter<char *>>,std::__wrap_iter<char *>,std::__wrap_iter<char *>>::~function2((uint64_t *)&v78);
          boost::function2<boost::iterator_range<std::__wrap_iter<char *>>,std::__wrap_iter<char *>,std::__wrap_iter<char *>>::~function2((uint64_t *)&v82);
          long long v40 = v46;
          long long v46 = *(_OWORD *)&v67.__begin_;
          *(_OWORD *)&v67.__begin_ = v40;
          int v41 = value;
          std::string value = v67.__end_cap_.__value_;
          v67.__end_cap_.__value_ = v41;
          uint64_t v102 = &v67;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v102);
          boost::function2<boost::iterator_range<std::__wrap_iter<char *>>,std::__wrap_iter<char *>,std::__wrap_iter<char *>>::~function2((uint64_t *)&v86);
          boost::function2<boost::iterator_range<std::__wrap_iter<char *>>,std::__wrap_iter<char *>,std::__wrap_iter<char *>>::~function2(&v65);
          std::locale::~locale((std::locale *)&v49.__end_);
          std::locale::~locale((std::locale *)&v42 + 1);
          std::locale::~locale(&v45);
          std::locale::~locale(&v68);
          if ((void)v46 != *((void *)&v46 + 1))
          {
            long long v42 = 0uLL;
            uint64_t v43 = 0;
            size_t __n = 1;
            __src = (void *)61;
            std::__sort<std::__less<char,char> &,char *>();
            size_t v73 = __n;
            int v71 = 0;
            if (__n < 0x11)
            {
              memcpy(&v71, &__src, __n);
              size_t v104 = v73;
              uint64_t v102 = 0;
              if (v73 < 0x11)
              {
                memcpy(&v102, &v71, v73);
                size_t v76 = v104;
                uint64_t __dst = 0;
                if (v104 <= 0x10)
                {
                  memcpy(&__dst, &v102, v104);
                  int v77 = 1;
                  size_t v91 = v76;
                  v90[0] = 0;
                  if (v76 < 0x11)
                  {
                    memcpy(v90, &__dst, v76);
                    int v92 = 1;
                    __v.__end_ = (std::__split_buffer<std::string>::pointer)v91;
                    __v.__first_ = 0;
                    if (v91 < 0x11)
                    {
                      memcpy(&__v, v90, v91);
                      LODWORD(__v.__end_cap_.__value_) = 1;
                      size_t end = (size_t)__v.__end_;
                      uint64_t v78 = 0;
                      if (__v.__end_ < (std::__split_buffer<std::string>::pointer)0x11)
                      {
                        memcpy(&v78, &__v, (size_t)__v.__end_);
                        int v81 = 1;
                        uint64_t v56 = 0;
                        size_t v84 = end;
                        v82.__locale_ = 0;
                        if (end < 0x11)
                        {
                          memcpy(&v82, &v78, end);
                          int v85 = 1;
                          size_t v88 = v84;
                          v86 = 0;
                          if (v84 < 0x11)
                          {
                            memcpy(&v86, &v82, v84);
                            int v89 = 1;
                            size_t v95 = v88;
                            int64x2_t v93 = 0;
                            if (v88 < 0x11)
                            {
                              memcpy(&v93, &v86, v88);
                              int v96 = 1;
                              size_t v104 = v95;
                              uint64_t v102 = 0;
                              if (v95 < 0x11)
                              {
                                memcpy(&v102, &v93, v95);
                                int v105 = 1;
                                operator new();
                              }
                              operator new[]();
                            }
                            operator new[]();
                          }
                          operator new[]();
                        }
                        operator new[]();
                      }
                      operator new[]();
                    }
                    operator new[]();
                  }
                  operator new[]();
                }
                operator new[]();
              }
              operator new[]();
            }
            operator new[]();
          }
          uint64_t v102 = (std::vector<std::string> *)&v46;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v102);
          char v20 = HIBYTE(v48.__r_.__value_.__r.__words[2]);
          goto LABEL_117;
        }
        goto LABEL_59;
      }
      if (!v93) {
        break;
      }
      if (v101 | v110)
      {
        if ((v110 != 0) == (v101 != 0)) {
          goto LABEL_85;
        }
LABEL_59:
        long long v24 = v106;
        uint64_t v25 = v107;
        unint64_t v26 = v107 - v106;
        goto LABEL_60;
      }
      long long v24 = v106;
      uint64_t v25 = v107;
      unint64_t v26 = v107 - v106;
      if (v107 - v106 == v98 - (void)__s2 && !memcmp(v106, __s2, v107 - v106) && v108 == v99 && v109 == v100) {
        goto LABEL_85;
      }
LABEL_60:
      if (v26 > 0x7FFFFFFFFFFFFFF7) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      if (v26 > 0x16)
      {
        uint64_t v28 = (v26 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v26 | 7) != 0x17) {
          uint64_t v28 = v26 | 7;
        }
        uint64_t v29 = v28 + 1;
        char v27 = operator new(v28 + 1);
        size_t v91 = v29 | 0x8000000000000000;
        v90[0] = v27;
        v90[1] = (void *)v26;
      }
      else
      {
        HIBYTE(v91) = v26;
        char v27 = v90;
      }
      while (v24 != v25)
      {
        char v30 = *v24++;
        *v27++ = v30;
      }
      *char v27 = 0;
      std::vector<std::string>::pointer v31 = v67.__end_;
      if (v67.__end_ >= v67.__end_cap_.__value_)
      {
        unint64_t v34 = 0xAAAAAAAAAAAAAAABLL * (((char *)v67.__end_ - (char *)v67.__begin_) >> 3);
        unint64_t v35 = v34 + 1;
        if (v34 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<std::string>::__throw_length_error[abi:ne180100]();
        }
        if (0x5555555555555556 * (((char *)v67.__end_cap_.__value_ - (char *)v67.__begin_) >> 3) > v35) {
          unint64_t v35 = 0x5555555555555556 * (((char *)v67.__end_cap_.__value_ - (char *)v67.__begin_) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v67.__end_cap_.__value_ - (char *)v67.__begin_) >> 3) >= 0x555555555555555) {
          unint64_t v36 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v36 = v35;
        }
        __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v67.__end_cap_;
        if (v36) {
          int64_t v37 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v67.__end_cap_, v36);
        }
        else {
          int64_t v37 = 0;
        }
        std::string v38 = v37 + v34;
        __v.__first_ = v37;
        __v.__begin_ = v38;
        __v.__end_cap_.__value_ = &v37[v36];
        long long v39 = *(_OWORD *)v90;
        v38->__r_.__value_.__r.__words[2] = v91;
        *(_OWORD *)&v38->__r_.__value_.__l.__data_ = v39;
        size_t v91 = 0;
        v90[1] = 0;
        v90[0] = 0;
        __v.__end_ = v38 + 1;
        std::vector<std::string>::__swap_out_circular_buffer(&v67, &__v);
        uint64_t v33 = v67.__end_;
        std::__split_buffer<std::string>::~__split_buffer(&__v);
      }
      else
      {
        long long v32 = *(_OWORD *)v90;
        v67.__end_->__r_.__value_.__r.__words[2] = v91;
        *(_OWORD *)&v31->__r_.__value_.__l.__data_ = v32;
        uint64_t v33 = v31 + 1;
      }
      v67.__end_ = v33;
      boost::algorithm::split_iterator<std::__wrap_iter<char *>>::increment((uint64_t)&v102);
    }
    if (v110) {
      goto LABEL_85;
    }
    goto LABEL_59;
  }
LABEL_117:
  if (v20 < 0) {
    operator delete(v48.__r_.__value_.__l.__data_);
  }
}

void sub_229365744(_Unwind_Exception *a1)
{
}

void SEUpdaterUtil::cbPrintLog(SEUpdaterUtil *this, void *a2, SEUpdaterUtil::SELogObj *a3, const char *a4, ...)
{
  va_start(va, a4);
  unsigned int v5 = a2;
  uint64_t v6 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  long long v7 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v6);
  }
  int v8 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  if (v5 > 6) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = dword_22936E2E4[v5];
  }
  SEUpdaterUtil::SELogObj::printLogv(v7, (SEUpdaterUtil::SELogObj *)v9, 0, 1, 0, a3, va);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

void sub_229365D00(_Unwind_Exception *a1)
{
}

uint64_t SEUpdaterUtil::assertSW(uint64_t this, const SERestoreInfo::RApdu *a2, const char *a3)
{
  uint64_t v3 = *(void *)(*(void *)(this + 8) + 8);
  if ((unint64_t)(v3 - **(void **)(this + 8)) < 2)
  {
    uint64_t v4 = 43947;
LABEL_5:
    SEUpdaterUtil::SELogToStr(&v7, a2, v4);
    exception = __cxa_allocate_exception(0x48uLL);
    uint64_t v6 = (void *)SERestoreInfo::SEException::SEException((uint64_t)exception, &v7, 8, @"SEUpdaterErrorDomain");
  }
  uint64_t v4 = *(unsigned __int8 *)(v3 - 1) | (*(unsigned __int8 *)(v3 - 2) << 8);
  if (v4 != 36864) {
    goto LABEL_5;
  }
  return this;
}

void sub_229365DD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *SEUpdaterUtil::SELogToStr@<X0>(void *a1@<X8>, ...)
{
  va_start(va, a1);
  return SEUpdaterUtil::SELogToStrv(0, (SEUpdaterUtil::SELogObj *)"%s : 0x%x", va, (char *)1, (uint64_t)"assertSW", a1);
}

uint64_t *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, const void **a2, long long **a3)
{
  unsigned int v5 = (uint64_t **)std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_equal<std::string>((uint64_t)a1, &v16, a2);
  uint64_t v6 = *v5;
  if (!*v5)
  {
    long long v7 = v5;
    int v8 = *a3;
    uint64_t v9 = operator new(0x50uLL);
    v14[0] = v9;
    v14[1] = a1 + 1;
    char v15 = 0;
    uint64_t v10 = (std::string *)(v9 + 4);
    if (*((char *)v8 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v10, *(const std::string::value_type **)v8, *((void *)v8 + 1));
      std::string::size_type v12 = (uint64_t *)v14[0];
    }
    else
    {
      long long v11 = *v8;
      v9[6] = *((void *)v8 + 2);
      *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
      std::string::size_type v12 = v9;
    }
    v9[7] = 0;
    v9[8] = 0;
    v9[9] = 0;
    char v15 = 1;
    std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__insert_node_at(a1, v16, v7, v12);
    uint64_t v6 = (uint64_t *)v14[0];
    v14[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)v14, 0);
  }
  return v6;
}

void sub_229365F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t boost::algorithm::split_iterator<std::__wrap_iter<char *>>::split_iterator(uint64_t a1, uint64_t *a2)
{
  *(void *)a1 = 0;
  uint64_t v4 = *a2;
  if (*a2)
  {
    *(void *)a1 = v4;
    if (v4)
    {
      long long v5 = *(_OWORD *)(a2 + 1);
      *(void *)(a1 + 24) = a2[3];
      *(_OWORD *)(a1 + 8) = v5;
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t, void))(v4 & 0xFFFFFFFFFFFFFFFELL))(a2 + 1, a1 + 8, 0);
    }
  }
  *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
  *(void *)(a1 + 48) = a2[6];
  *(void *)(a1 + 56) = a2[7];
  *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
  return a1;
}

uint64_t boost::algorithm::split_iterator<std::__wrap_iter<char *>>::increment(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (*(void *)a1)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t))((*(void *)a1 & 0xFFFFFFFFFFFFFFFELL) + 8))(a1 + 8, *(void *)(a1 + 48), v2);
    uint64_t v2 = *(void *)(a1 + 56);
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t result = v4;
  }
  BOOL v5 = result == v2 && v4 == v2;
  if (v5 && *(void *)(a1 + 40) == v2) {
    *(unsigned char *)(a1 + 64) = 1;
  }
  *(void *)(a1 + 32) = *(void *)(a1 + 48);
  *(void *)(a1 + 4std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)&a9, 0) = result;
  *(void *)(a1 + 48) = v4;
  return result;
}

void boost::detail::function::functor_manager<boost::algorithm::detail::token_finderF<boost::algorithm::detail::is_classifiedF>>::manage(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3 == 4) {
    goto LABEL_2;
  }
  if (a3 <= 1)
  {
    *(_DWORD *)a2 = *(_DWORD *)a1;
    std::locale::locale((std::locale *)(a2 + 8), (const std::locale *)(a1 + 8));
    *(_DWORD *)(a2 + 16) = *(_DWORD *)(a1 + 16);
    if (a3 != 1) {
      return;
    }
    uint64_t v6 = (std::locale *)(a1 + 8);
    goto LABEL_10;
  }
  if (a3 != 3)
  {
    if (a3 != 2)
    {
LABEL_2:
      *(_WORD *)(a2 + 8) = 0;
      return;
    }
    uint64_t v6 = (std::locale *)(a2 + 8);
LABEL_10:
    std::locale::~locale(v6);
    return;
  }
  long long v7 = (const char *)(*(void *)(*(void *)a2 + 8) & 0x7FFFFFFFFFFFFFFFLL);
  if (v7 == (const char *)(0x800000022936E264 & 0x7FFFFFFFFFFFFFFFLL)
    || !strcmp(v7, (const char *)(0x800000022936E264 & 0x7FFFFFFFFFFFFFFFLL)))
  {
    *(void *)a2 = a1;
  }
  else
  {
    *(void *)a2 = 0;
  }
}

unsigned __int8 *boost::detail::function::function_obj_invoker2<boost::algorithm::detail::token_finderF<boost::algorithm::detail::is_classifiedF>,boost::iterator_range<std::__wrap_iter<char *>>,std::__wrap_iter<char *>,std::__wrap_iter<char *>>::invoke(std::locale *a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v6 = a1 + 1;
  int locale = (int)a1->__locale_;
  std::locale::locale(&v16, a1 + 1);
  if (a2 == a3)
  {
    std::locale::~locale(&v16);
    return a3;
  }
  long long v7 = (std::locale::id *)MEMORY[0x263F8C108];
  while (1)
  {
    uint64_t v8 = *a2;
    uint64_t v9 = std::locale::use_facet(&v16, v7);
    if ((v8 & 0x80) == 0 && (*((_DWORD *)&v9[1].~facet + v8) & locale) != 0) {
      break;
    }
    if (++a2 == a3)
    {
      a2 = a3;
      break;
    }
  }
  std::locale::~locale(&v16);
  if (a2 == a3) {
    return a3;
  }
  if (!LODWORD(a1[2].__locale_))
  {
    long long v11 = (std::locale::id *)MEMORY[0x263F8C108];
    std::string::size_type v12 = (char *)a2;
    do
    {
      int v13 = *v12;
      long long v14 = std::locale::use_facet(v6, v11);
      if (v13 < 0) {
        break;
      }
      if ((*((_DWORD *)&v14[1].~facet + v13) & (uint64_t)a1->__locale_) == 0) {
        break;
      }
      ++v12;
    }
    while (v12 != (char *)a3);
  }
  return a2;
}

void sub_22936624C(_Unwind_Exception *a1)
{
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

uint64_t *boost::function2<boost::iterator_range<std::__wrap_iter<char *>>,std::__wrap_iter<char *>,std::__wrap_iter<char *>>::~function2(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    if ((v2 & 1) == 0)
    {
      uint64_t v3 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v2 & 0xFFFFFFFFFFFFFFFELL);
      if (v3) {
        v3(a1 + 1, a1 + 1, 2);
      }
    }
    *a1 = 0;
  }
  return a1;
}

uint64_t boost::detail::function::functor_manager<boost::algorithm::detail::token_finderF<boost::algorithm::detail::is_any_ofF<char>>>::manage(uint64_t result, _WORD *a2, int a3)
{
  uint64_t v4 = (void *)result;
  switch(a3)
  {
    case 0:
      operator new();
    case 1:
      *(void *)a2 = *(void *)result;
      *(void *)uint64_t result = 0;
      return result;
    case 2:
      BOOL v5 = *(void **)a2;
      if (*(void *)a2)
      {
        if (v5[2] >= 0x11uLL)
        {
          if (*v5) {
            MEMORY[0x22A6B67B0](*v5, 0x1000C8077774924);
          }
        }
        uint64_t result = MEMORY[0x22A6B67D0](v5, 0x1012C405C87E9CELL);
      }
      goto LABEL_12;
    case 3:
      uint64_t result = *(void *)(*(void *)a2 + 8) & 0x7FFFFFFFFFFFFFFFLL;
      if (result == (0x800000022936E2A4 & 0x7FFFFFFFFFFFFFFFLL)
        || (uint64_t result = strcmp((const char *)result, (const char *)(0x800000022936E2A4 & 0x7FFFFFFFFFFFFFFFLL)),
            !result))
      {
        *(void *)a2 = *v4;
      }
      else
      {
LABEL_12:
        *(void *)a2 = 0;
      }
      break;
    default:
      a2[4] = 0;
      break;
  }
  return result;
}

void sub_229366434(_Unwind_Exception *a1)
{
  MEMORY[0x22A6B67D0](v1, 0x1012C405C87E9CELL);
  _Unwind_Resume(a1);
}

char *boost::detail::function::function_obj_invoker2<boost::algorithm::detail::token_finderF<boost::algorithm::detail::is_any_ofF<char>>,boost::iterator_range<std::__wrap_iter<char const*>>,std::__wrap_iter<char const*>,std::__wrap_iter<char const*>>::invoke(uint64_t a1, char *a2, char *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v5 = *(_DWORD **)a1;
  size_t v6 = *(void *)(*(void *)a1 + 16);
  unint64_t v10 = v6;
  v9[0] = 0;
  if (v6 >= 0x11) {
    operator new[]();
  }
  memcpy(v9, v5, v6);
  while (a2 != a3)
  {
    if (boost::algorithm::detail::is_any_ofF<char>::operator()<char>(v9, *a2)) {
      goto LABEL_8;
    }
    ++a2;
  }
  a2 = a3;
LABEL_8:
  if (v10 >= 0x11 && v9[0]) {
    MEMORY[0x22A6B67B0](v9[0], 0x1000C8077774924);
  }
  if (a2 == a3) {
    return a3;
  }
  if (!v5[6])
  {
    long long v7 = a2;
    do
    {
      if (!boost::algorithm::detail::is_any_ofF<char>::operator()<char>(v5, *v7)) {
        break;
      }
      ++v7;
    }
    while (v7 != a3);
  }
  return a2;
}

BOOL boost::algorithm::detail::is_any_ofF<char>::operator()<char>(void *a1, int a2)
{
  unint64_t v2 = a1[2];
  if (v2 >= 0x11)
  {
    a1 = (void *)*a1;
    uint64_t v3 = (void *)((char *)a1 + v2);
  }
  else
  {
    uint64_t v3 = (void *)((char *)a1 + v2);
    if (!v2) {
      return a1 != v3 && *(char *)a1 <= a2;
    }
  }
  do
  {
    uint64_t v4 = (char *)a1 + (v2 >> 1);
    int v6 = *v4;
    BOOL v5 = v4 + 1;
    unint64_t v7 = v2 >> 1;
    v2 += ~(v2 >> 1);
    if (v6 < a2) {
      a1 = v5;
    }
    else {
      unint64_t v2 = v7;
    }
  }
  while (v2);
  return a1 != v3 && *(char *)a1 <= a2;
}

uint64_t *boost::function2<boost::iterator_range<std::__wrap_iter<char const*>>,std::__wrap_iter<char const*>,std::__wrap_iter<char const*>>::~function2(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    if ((v2 & 1) == 0)
    {
      uint64_t v3 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v2 & 0xFFFFFFFFFFFFFFFELL);
      if (v3) {
        v3(a1 + 1, a1 + 1, 2);
      }
    }
    *a1 = 0;
  }
  return a1;
}

SERestoreInfo::SN100VDeviceInfo *SERestoreInfo::SN100VDeviceInfo::SN100VDeviceInfo(SERestoreInfo::SN100VDeviceInfo *this, const SERestoreInfo::BLOB *a2)
{
  uint64_t v3 = SERestoreInfo::P73BaseDeviceInfo::P73BaseDeviceInfo(this, a2);
  *(void *)uint64_t v3 = &unk_26DD757A8;
  if (*((_DWORD *)v3 + 14) != 100)
  {
    exception = (SERestoreInfo::SEWrongDeviceInfo *)__cxa_allocate_exception(0x48uLL);
    SERestoreInfo::SEWrongDeviceInfo::SEWrongDeviceInfo(exception);
  }
  return this;
}

void sub_2293666F8(_Unwind_Exception *a1)
{
  SERestoreInfo::P73BaseDeviceInfo::~P73BaseDeviceInfo(v1);
  _Unwind_Resume(a1);
}

void SERestoreInfo::SN100VDeviceInfo::~SN100VDeviceInfo(SERestoreInfo::SN100VDeviceInfo *this)
{
  *(void *)this = &unk_26DD739B8;
  uint64_t v2 = (void *)*((void *)this + 19);
  if (v2)
  {
    *((void *)this + 2std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)&a9, 0) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 14);
  if (v3)
  {
    *((void *)this + 15) = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 11);
  if (v4)
  {
    *((void *)this + 12) = v4;
    operator delete(v4);
  }
  BOOL v5 = (void *)*((void *)this + 8);
  if (v5)
  {
    *((void *)this + 9) = v5;
    operator delete(v5);
  }
  int v6 = (void *)*((void *)this + 4);
  if (v6)
  {
    *((void *)this + 5) = v6;
    operator delete(v6);
  }
}

{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t vars8;

  *(void *)this = &unk_26DD739B8;
  uint64_t v2 = (void *)*((void *)this + 19);
  if (v2)
  {
    *((void *)this + 2std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)&a9, 0) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 14);
  if (v3)
  {
    *((void *)this + 15) = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 11);
  if (v4)
  {
    *((void *)this + 12) = v4;
    operator delete(v4);
  }
  BOOL v5 = (void *)*((void *)this + 8);
  if (v5)
  {
    *((void *)this + 9) = v5;
    operator delete(v5);
  }
  int v6 = (void *)*((void *)this + 4);
  if (v6)
  {
    *((void *)this + 5) = v6;
    operator delete(v6);
  }

  JUMPOUT(0x22A6B67D0);
}

SERestoreInfo::SN200VDeviceInfo *SERestoreInfo::SN200VDeviceInfo::SN200VDeviceInfo(SERestoreInfo::SN200VDeviceInfo *this, const SERestoreInfo::BLOB *a2)
{
  uint64_t v3 = SERestoreInfo::P73BaseDeviceInfo::P73BaseDeviceInfo(this, a2);
  *(void *)uint64_t v3 = &unk_26DD757F8;
  if (*((_DWORD *)v3 + 14) != 200)
  {
    exception = (SERestoreInfo::SEWrongDeviceInfo *)__cxa_allocate_exception(0x48uLL);
    SERestoreInfo::SEWrongDeviceInfo::SEWrongDeviceInfo(exception);
  }
  return this;
}

void sub_2293668E8(_Unwind_Exception *a1)
{
  SERestoreInfo::P73BaseDeviceInfo::~P73BaseDeviceInfo(v1);
  _Unwind_Resume(a1);
}

void SERestoreInfo::SN200VDeviceInfo::~SN200VDeviceInfo(SERestoreInfo::SN200VDeviceInfo *this)
{
  *(void *)this = &unk_26DD739B8;
  uint64_t v2 = (void *)*((void *)this + 19);
  if (v2)
  {
    *((void *)this + 2std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)&a9, 0) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 14);
  if (v3)
  {
    *((void *)this + 15) = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 11);
  if (v4)
  {
    *((void *)this + 12) = v4;
    operator delete(v4);
  }
  BOOL v5 = (void *)*((void *)this + 8);
  if (v5)
  {
    *((void *)this + 9) = v5;
    operator delete(v5);
  }
  int v6 = (void *)*((void *)this + 4);
  if (v6)
  {
    *((void *)this + 5) = v6;
    operator delete(v6);
  }
}

{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t vars8;

  *(void *)this = &unk_26DD739B8;
  uint64_t v2 = (void *)*((void *)this + 19);
  if (v2)
  {
    *((void *)this + 2std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)&a9, 0) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 14);
  if (v3)
  {
    *((void *)this + 15) = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 11);
  if (v4)
  {
    *((void *)this + 12) = v4;
    operator delete(v4);
  }
  BOOL v5 = (void *)*((void *)this + 8);
  if (v5)
  {
    *((void *)this + 9) = v5;
    operator delete(v5);
  }
  int v6 = (void *)*((void *)this + 4);
  if (v6)
  {
    *((void *)this + 5) = v6;
    operator delete(v6);
  }

  JUMPOUT(0x22A6B67D0);
}

void sub_229366B18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_229366BA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

SEUpdater::UpdateControllerBase *SEUpdater::UpdateControllerBase::UpdateControllerBase(SEUpdater::UpdateControllerBase *this)
{
  *(void *)this = &unk_26DD74E00;
  *((unsigned char *)this + 16) = 0;
  *((unsigned char *)this + 56) = 0;
  *((unsigned char *)this + 64) = 0;
  *((unsigned char *)this + 66) = 0;
  *((void *)this + 9) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 11) = (char *)this + 96;
  *((unsigned char *)this + 8std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)&a9, 0) = 0;
  *((void *)this + 13) = 0;
  *((_DWORD *)this + 2) = 0;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<__CFDictionary,void>((void *)this + 14, (CFTypeRef *)&Mutable);
  *((void *)this + 15) = 0;
  return this;
}

void sub_229366C84(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v3, *v4);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(v2);
  std::__optional_destruct_base<AlohaPairingOptions,false>::~__optional_destruct_base[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

const void **SEUpdater::UpdateControllerBase::start(const void **this, const __CFDictionary *a2, uint64_t a3, const void *a4)
{
  if (a2) {
    SEUpdaterUtil::SELogPrintCFType((SEUpdaterUtil *)3, (ctu::cf *)1, a2, a4);
  }
  *(void *)&v10[0].var0 = a2;
  ctu::cf::CFSharedRef<__CFDictionary const>::reset(this + 9, (CFTypeRef *)v10);
  SEUpdater::UpdateControllerBase::setDebugOptions((SEUpdater::UpdateControllerBase *)this);
  (*((void (**)(const void **))*this + 2))(this);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(&v9, this + 9);
  getAlohaPairingOptions((id *)&v9, (uint64_t)v10);
  std::__optional_storage_base<AlohaPairingOptions,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<AlohaPairingOptions,false>>(this + 2, (uint64_t)v10);
  std::__optional_destruct_base<AlohaPairingOptions,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v10);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v9);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(&v8, this + 9);
  v10[0] = (AlohaVerificationOptions)256;
  AlohaVerificationOptions::print(v10);
  AlohaVerificationOptions v6 = v10[0];
  *((unsigned char *)this + 66) = 1;
  *((AlohaVerificationOptions *)this + 32) = v6;
  return ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v8);
}

void sub_229366DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

const void **ctu::cf::CFSharedRef<__CFDictionary const>::reset(const void **a1, CFTypeRef *a2)
{
  CFTypeRef v3 = *a2;
  if (*a2) {
    CFRetain(*a2);
  }
  uint64_t v4 = *a1;
  *a1 = v3;
  AlohaVerificationOptions v6 = v4;
  return ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v6);
}

void SEUpdater::UpdateControllerBase::setDebugOptions(SEUpdater::UpdateControllerBase *this)
{
  *((_WORD *)this + 5) = SEUpdater::UpdateControllerBase::getBooleanOption((CFDictionaryRef *)this, @"RestoreInternal", 0) | 0x100;
  uint64_t v2 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  CFTypeRef v3 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v2);
  }
  uint64_t v4 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  if (!*((unsigned char *)this + 11)) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  if (*((unsigned char *)this + 10)) {
    BOOL v5 = "YES";
  }
  else {
    BOOL v5 = "NO";
  }
  SEUpdaterUtil::SELogObj::printLog(v3, (SEUpdaterUtil::SELogObj *)1, 0, 1, "setDebugOptions", (SEUpdaterUtil::SELogObj *)"Internal Restore? %s\n", v5);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  SEUpdater::UpdateControllerBase::getStringfromOption((CFDictionaryRef *)this, __p);
  SEUpdaterUtil::parseArgs((uint64_t)__p);
  if (v26 < 0) {
    operator delete(__p[0]);
  }
  AlohaVerificationOptions v6 = (void *)*((void *)this + 9);
  if (v6) {
    unint64_t v7 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    unint64_t v7 = 0;
  }
  if (v7)
  {
    id v8 = v6;
    uint64_t v9 = [v8 objectForKeyedSubscript:@"Options"];
    unint64_t v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 objectForKeyedSubscript:@"DebugLogPath"];
      std::string::size_type v12 = v11;
      if (v11) {
        CFRetain(v11);
      }
      int v13 = (void *)*((void *)this + 15);
      *((void *)this + 15) = v12;
      __p[0] = v13;
      ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)__p);

      if (*((void *)this + 15)) {
        long long v14 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
      }
      else {
        long long v14 = 0;
      }
      if (v14)
      {
        char v15 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
        std::locale v16 = (SEUpdaterUtil::SELogObj *)off_268315F10;
        if (!off_268315F10) {
          SEUpdaterUtil::SELogObj::create_default_global(v15);
        }
        uint64_t v17 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
        if (*(&off_268315F10 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
        SEUpdaterUtil::SELogObj::printLog(v16, (SEUpdaterUtil::SELogObj *)2, 0, 1, "setDebugOptions", (SEUpdaterUtil::SELogObj *)"EVENT LOGGING: debugLogPath obtained\n");
      }
      else
      {
        BOOL v23 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
        long long v24 = (SEUpdaterUtil::SELogObj *)off_268315F10;
        if (!off_268315F10) {
          SEUpdaterUtil::SELogObj::create_default_global(v23);
        }
        uint64_t v17 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
        if (*(&off_268315F10 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
        SEUpdaterUtil::SELogObj::printLog(v24, (SEUpdaterUtil::SELogObj *)2, 0, 1, "setDebugOptions", (SEUpdaterUtil::SELogObj *)"EVENT LOGGING: debugLogPath not present\n");
      }
    }
    else
    {
      long long v21 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
      std::string::size_type v22 = (SEUpdaterUtil::SELogObj *)off_268315F10;
      if (!off_268315F10) {
        SEUpdaterUtil::SELogObj::create_default_global(v21);
      }
      uint64_t v17 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
      if (*(&off_268315F10 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
      }
      pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
      SEUpdaterUtil::SELogObj::printLog(v22, (SEUpdaterUtil::SELogObj *)2, 0, 1, "setDebugOptions", (SEUpdaterUtil::SELogObj *)"EVENT LOGGING: Options not present\n");
    }
    if (v17) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v17);
    }
  }
  else
  {
    CFTypeID v18 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    std::string::size_type v19 = (SEUpdaterUtil::SELogObj *)off_268315F10;
    if (!off_268315F10) {
      SEUpdaterUtil::SELogObj::create_default_global(v18);
    }
    char v20 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
    if (*(&off_268315F10 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    SEUpdaterUtil::SELogObj::printLog(v19, (SEUpdaterUtil::SELogObj *)2, 0, 1, "setDebugOptions", (SEUpdaterUtil::SELogObj *)"EVENT LOGGING: Invalid options parameter\n");
    if (v20) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v20);
    }
  }
}

void sub_229367248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);

  _Unwind_Resume(a1);
}

uint64_t SEUpdater::UpdateControllerBase::execCommand(const void **this, const __CFString *a2, const __CFDictionary *a3, const __CFDictionary **a4)
{
  if (!a2)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&__p, "Assertion: ");
    uint64_t v33 = std::string::append(&__p, "command");
    long long v34 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
    std::string::size_type v37 = v33->__r_.__value_.__r.__words[2];
    long long v36 = v34;
    v33->__r_.__value_.__l.__size_ = 0;
    v33->__r_.__value_.__r.__words[2] = 0;
    v33->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22A6B63F0](exception, &v36);
  }
  long long v36 = 0uLL;
  std::string::size_type v37 = 0;
  ctu::cf::assign();
  memset(&__p, 0, sizeof(__p));
  id v8 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  uint64_t v9 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v8);
  }
  unint64_t v10 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  p_p = &__p;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  SEUpdaterUtil::SELogObj::printLog(v9, (SEUpdaterUtil::SELogObj *)2, 0, 1, "execCommand", (SEUpdaterUtil::SELogObj *)"Start processing command: %s\n", (const char *)p_p);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  if (a3)
  {
    SEUpdaterUtil::SELogPrintCFType((SEUpdaterUtil *)2, (ctu::cf *)1, a3, v12);
    *(void *)&long long v36 = a3;
    ctu::cf::CFSharedRef<__CFDictionary const>::reset(this + 9, (CFTypeRef *)&v36);
  }
  if (((*((uint64_t (**)(const void **, const __CFString *, const __CFDictionary **))*this + 3))(this, a2, a4) & 1) == 0)
  {
    long long v14 = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      long long v14 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    SEUpdaterUtil::_AddError((SEUpdaterUtil *)2, 1, (uint64_t)"execCommand", (SEUpdaterUtil::SELogObj *)"Unrecognized command %s", v13, v14);
  }
  if (a4)
  {
    if (CFDictionaryGetCount((CFDictionaryRef)this[14]))
    {
      char v15 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
      std::locale v16 = (SEUpdaterUtil::SELogObj *)off_268315F10;
      if (!off_268315F10) {
        SEUpdaterUtil::SELogObj::create_default_global(v15);
      }
      uint64_t v17 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
      if (*(&off_268315F10 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
      }
      pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
      SEUpdaterUtil::SELogObj::printLog(v16, (SEUpdaterUtil::SELogObj *)2, 0, 1, "execCommand", (SEUpdaterUtil::SELogObj *)"Command output:\n");
      if (v17) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v17);
      }
      SEUpdaterUtil::SELogPrintCFType((SEUpdaterUtil *)2, (ctu::cf *)1, this[14], v18);
      CFDictionaryRef v19 = (const __CFDictionary *)CFRetain(this[14]);
      *a4 = v19;
    }
    else
    {
      BOOL v23 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
      long long v24 = (SEUpdaterUtil::SELogObj *)off_268315F10;
      if (!off_268315F10) {
        SEUpdaterUtil::SELogObj::create_default_global(v23);
      }
      uint64_t v25 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
      if (*(&off_268315F10 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
      }
      pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
      CFDictionaryRef v19 = (const __CFDictionary *)SEUpdaterUtil::SELogObj::printLog(v24, (SEUpdaterUtil::SELogObj *)2, 0, 1, "execCommand", (SEUpdaterUtil::SELogObj *)"No command output, returning NULL\n");
      if (v25) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v25);
      }
      *a4 = 0;
    }
  }
  else
  {
    char v20 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    long long v21 = (SEUpdaterUtil::SELogObj *)off_268315F10;
    if (!off_268315F10) {
      SEUpdaterUtil::SELogObj::create_default_global(v20);
    }
    std::string::size_type v22 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
    if (*(&off_268315F10 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    CFDictionaryRef v19 = (const __CFDictionary *)SEUpdaterUtil::SELogObj::printLog(v21, (SEUpdaterUtil::SELogObj *)1, 0, 1, "execCommand", (SEUpdaterUtil::SELogObj *)"Caller did not provide an output dictionary\n");
    if (v22) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v22);
    }
  }
  uint64_t ErrorCode = SEUpdaterUtil::GetErrorCode(v19);
  char v27 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  uint64_t v28 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v27);
  }
  uint64_t v29 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  char v30 = &__p;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    char v30 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  SEUpdaterUtil::SELogObj::printLog(v28, (SEUpdaterUtil::SELogObj *)2, 0, 1, "execCommand", (SEUpdaterUtil::SELogObj *)"Finish processing command: %s and returning %d \n", (const char *)v30, ErrorCode);
  if (v29) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v29);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return ErrorCode;
}

void sub_229367848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void SEUpdater::UpdateControllerBase::parseStartOptions(SEUpdater::UpdateControllerBase *this)
{
  uint64_t v2 = (uint64_t **)((char *)this + 88);
  std::string::basic_string[abi:ne180100]<0>(__p, "logLevel");
  uint64_t v3 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__count_unique<std::string>((uint64_t)v2, (const void **)__p);
  if (SHIBYTE(v40) < 0) {
    operator delete(__p[0]);
  }
  if (v3)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "logLevel");
    v37[0] = __p;
    uint64_t v4 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v2, (const void **)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)v37);
    int v5 = std::stoi((const std::string *)((char *)v4 + 56), 0, 10);
    if (SHIBYTE(v40) < 0) {
      operator delete(__p[0]);
    }
    AlohaVerificationOptions v6 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    unint64_t v7 = (SEUpdaterUtil::SELogObj *)off_268315F10;
    if (!off_268315F10) {
      SEUpdaterUtil::SELogObj::create_default_global(v6);
    }
    id v8 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
    if (*(&off_268315F10 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    SEUpdaterUtil::SELogObj::printLog(v7, 0, 0, 1, "parseStartOptions", (SEUpdaterUtil::SELogObj *)"Setting loglevel to %d\n", v5);
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
    uint64_t v9 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    uint64_t v10 = off_268315F10;
    if (!off_268315F10) {
      SEUpdaterUtil::SELogObj::create_default_global(v9);
    }
    uint64_t v11 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
    if (*(&off_268315F10 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    __p[0] = (void *)MEMORY[0x263EF8330];
    __p[1] = (void *)3221225472;
    long long v40 = ___ZN13SEUpdaterUtil8SELogObj11setLogLevelEi_block_invoke;
    int v41 = &__block_descriptor_44_e5_v8__0l;
    uint64_t v42 = v10;
    int v43 = v5;
    v37[0] = __p;
    ctu::SharedSynchronizable<SEUpdaterUtil::SELogObj>::execute_wrapped_sync<void({block_pointer} {__strong}&)(void)>(v10, (uint64_t)v37);

    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
  }
  if (!*((unsigned char *)this + 11)) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  if (*((unsigned char *)this + 10))
  {
    std::string::basic_string[abi:ne180100]<0>(v37, "haltOnCrash");
    uint64_t v12 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__count_unique<std::string>((uint64_t)v2, (const void **)v37);
    uint64_t v13 = v12;
    if (v38 < 0)
    {
      operator delete(v37[0]);
      if (!v13) {
        goto LABEL_31;
      }
    }
    else if (!v12)
    {
      goto LABEL_31;
    }
    long long v14 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    char v15 = (SEUpdaterUtil::SELogObj *)off_268315F10;
    if (!off_268315F10) {
      SEUpdaterUtil::SELogObj::create_default_global(v14);
    }
    std::locale v16 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
    if (*(&off_268315F10 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
    uint64_t v17 = (SEUpdaterUtil *)SEUpdaterUtil::SELogObj::printLog(v15, 0, 0, 1, "parseStartOptions", (SEUpdaterUtil::SELogObj *)"Install signal handlers\n");
    if (v16) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v16);
    }
    SEUpdaterUtil::RegisterDebugSignals(v17);
  }
LABEL_31:
  *((unsigned char *)this + 8) = SEUpdater::UpdateControllerBase::getBooleanOption((CFDictionaryRef *)this, @"FactoryRFTest", 0);
  std::string::basic_string[abi:ne180100]<0>(v37, "setActivateFTA");
  uint64_t v18 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__count_unique<std::string>((uint64_t)v2, (const void **)v37);
  if (v38 < 0) {
    operator delete(v37[0]);
  }
  if (v18) {
    *((unsigned char *)this + 8) = 1;
  }
  CFDictionaryRef v19 = (const __CFDictionary *)*((void *)this + 9);
  if (v19) {
    char v20 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    char v20 = 0;
  }
  if (v20)
  {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v19, @"RestoreOptions");
    if (Value)
    {
      CFDictionaryRef v22 = Value;
      CFTypeID v23 = CFGetTypeID(Value);
      if (v23 != CFDictionaryGetTypeID())
      {
        exception = __cxa_allocate_exception(0x48uLL);
        std::string::basic_string[abi:ne180100]<0>(v37, "RestoreOptions not a dict?");
        long long v36 = (void *)SERestoreInfo::SEException::SEException((uint64_t)exception, (long long *)v37, 2, @"SEUpdaterErrorDomain");
      }
      CFBooleanRef v24 = (const __CFBoolean *)CFDictionaryGetValue(v22, @"CreateFilesystemPartitions");
      if (!v24 || (v25 = v24, CFTypeID v26 = CFGetTypeID(v24), v26 != CFBooleanGetTypeID()))
      {
        uint64_t v33 = __cxa_allocate_exception(0x48uLL);
        std::string::basic_string[abi:ne180100]<0>(v37, "CreateFilesystemPartitions missing or wrong type");
        long long v34 = (void *)SERestoreInfo::SEException::SEException((uint64_t)v33, (long long *)v37, 2, @"SEUpdaterErrorDomain");
      }
      *((unsigned char *)this + 9) = CFBooleanGetValue(v25) != 0;
    }
    else
    {
      *((unsigned char *)this + 9) = 0;
    }
    std::string::basic_string[abi:ne180100]<0>(v37, "setEraseInstall");
    uint64_t v27 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__count_unique<std::string>((uint64_t)v2, (const void **)v37);
    if (v38 < 0) {
      operator delete(v37[0]);
    }
    if (v27) {
      *((unsigned char *)this + 9) = 1;
    }
  }
  uint64_t v28 = (SEUpdaterUtil::SELogObj *)pthread_mutex_lock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  uint64_t v29 = (SEUpdaterUtil::SELogObj *)off_268315F10;
  if (!off_268315F10) {
    SEUpdaterUtil::SELogObj::create_default_global(v28);
  }
  char v30 = (std::__shared_weak_count *)*(&off_268315F10 + 1);
  if (*(&off_268315F10 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_268315F10 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SEUpdaterUtil::SELogObj,SEUpdaterUtil::SELogObj,ctu::PthreadMutexGuardPolicy<SEUpdaterUtil::SELogObj>>::sInstance);
  std::vector<std::string>::pointer v31 = "activated";
  if (!*((unsigned char *)this + 8)) {
    std::vector<std::string>::pointer v31 = "deactivated";
  }
  if (*((unsigned char *)this + 9)) {
    long long v32 = (const char *)&unk_22936E3AF;
  }
  else {
    long long v32 = "not ";
  }
  SEUpdaterUtil::SELogObj::printLog(v29, (SEUpdaterUtil::SELogObj *)1, 0, 1, "parseStartOptions", (SEUpdaterUtil::SELogObj *)"Additional actions: FTA will be %s, MFD will %sbe performed\n", v31, v32);
  if (v30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }
}

void sub_229367F7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
}

BOOL SEUpdater::UpdateControllerBase::getBooleanOption(CFDictionaryRef *this, const __CFString *a2, uint64_t a3)
{
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(this[9], @"Options");
  if (Value)
  {
    CFDictionaryRef v6 = Value;
    CFTypeID v7 = CFGetTypeID(Value);
    if (v7 == CFDictionaryGetTypeID())
    {
      CFBooleanRef v8 = (const __CFBoolean *)CFDictionaryGetValue(v6, a2);
      if (v8)
      {
        CFBooleanRef v9 = v8;
        CFTypeID v10 = CFGetTypeID(v8);
        if (v10 == CFBooleanGetTypeID()) {
          return CFBooleanGetValue(v9) != 0;
        }
      }
    }
  }
  return a3;
}

const void *SEUpdater::UpdateControllerBase::getStringfromOption@<X0>(CFDictionaryRef *this@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  uint64_t result = CFDictionaryGetValue(this[9], @"Options");
  if (result)
  {
    int v5 = result;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    uint64_t result = (const void *)CFGetTypeID(v5);
    if ((const void *)TypeID == result)
    {
      ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v9, (const __CFDictionary *)v5);
      ctu::cf::map_adapter::getString();
      *(_OWORD *)a2 = v7;
      a2[2] = v8;
      return (const void *)MEMORY[0x22A6B62E0](v9);
    }
  }
  return result;
}

void sub_2293681DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  MEMORY[0x22A6B62E0](&a18);
  _Unwind_Resume(a1);
}

const void **std::__optional_storage_base<AlohaPairingOptions,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<AlohaPairingOptions,false>>(const void **result, uint64_t a2)
{
  uint64_t v3 = result;
  if (*((unsigned __int8 *)result + 40) == *(unsigned __int8 *)(a2 + 40))
  {
    if (*((unsigned char *)result + 40))
    {
      *(unsigned char *)uint64_t result = *(unsigned char *)a2;
      if (result != (const void **)a2)
      {
        uint64_t v4 = result[1];
        result[1] = 0;
        CFBooleanRef v9 = v4;
        result[1] = *(const void **)(a2 + 8);
        *(void *)(a2 + 8) = 0;
        ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(&v9);
        int v5 = v3[2];
        v3[2] = 0;
        CFBooleanRef v9 = v5;
        v3[2] = *(const void **)(a2 + 16);
        *(void *)(a2 + 16) = 0;
        ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v9);
        CFDictionaryRef v6 = v3[3];
        v3[3] = 0;
        CFBooleanRef v9 = v6;
        v3[3] = *(const void **)(a2 + 24);
        *(void *)(a2 + 24) = 0;
        uint64_t result = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v9);
      }
      __int16 v7 = *(_WORD *)(a2 + 32);
      *((unsigned char *)v3 + 34) = *(unsigned char *)(a2 + 34);
      *((_WORD *)v3 + 16) = v7;
    }
  }
  else if (*((unsigned char *)result + 40))
  {
    ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(result + 3);
    ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(v3 + 2);
    uint64_t result = ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(v3 + 1);
    *((unsigned char *)v3 + 4std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)&a9, 0) = 0;
  }
  else
  {
    *(unsigned char *)uint64_t result = *(unsigned char *)a2;
    result[1] = 0;
    result[1] = *(const void **)(a2 + 8);
    *(void *)(a2 + 8) = 0;
    result[2] = 0;
    result[2] = *(const void **)(a2 + 16);
    *(void *)(a2 + 16) = 0;
    result[3] = 0;
    result[3] = *(const void **)(a2 + 24);
    *(void *)(a2 + 24) = 0;
    __int16 v8 = *(_WORD *)(a2 + 32);
    *((unsigned char *)result + 34) = *(unsigned char *)(a2 + 34);
    *((_WORD *)result + 16) = v8;
    *((unsigned char *)result + 4std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)&a9, 0) = 1;
  }
  return result;
}

uint64_t ___ZN13SEUpdaterUtil8SELogObj11setLogLevelEi_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(_DWORD *)(result + 40);
  if (v2 >= 6)
  {
    int v2 = 5;
LABEL_4:
    *(_DWORD *)(v1 + 48) = v2;
    return result;
  }
  if ((v2 & 0x80000000) == 0) {
    goto LABEL_4;
  }
  *(_DWORD *)(v1 + 48) = 0;
  return result;
}

void *ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<__CFDictionary,void>(void *a1, CFTypeRef *a2)
{
  CFTypeRef v4 = *a2;
  if (*a2 && (CFTypeID v5 = CFGetTypeID(*a2), v5 == CFDictionaryGetTypeID()))
  {
    *a1 = v4;
  }
  else
  {
    *a1 = 0;
    if (*a2) {
      CFRelease(*a2);
    }
  }
  return a1;
}

void _GLOBAL__sub_I_UpdateControllerBase_cpp()
{
  uint64_t v0 = (void *)MEMORY[0x22A6B6C00]();
  qword_26AD82A08 = [NSNumber numberWithInt:1];
  qword_26AD82A10 = [NSNumber numberWithInt:1];
  qword_26AD82A18 = [NSNumber numberWithInt:0];
}

uint64_t AMFDRDataPutForRestore()
{
  return MEMORY[0x270F91E50]();
}

uint64_t AMFDRSealingMapCopyLocalData()
{
  return MEMORY[0x270F91F78]();
}

uint64_t AMFDRSealingMapCopyLocalDataForClass()
{
  return MEMORY[0x270F91F80]();
}

uint64_t AMSupportDigestSha256()
{
  return MEMORY[0x270F97A50]();
}

uint64_t AMSupportEcDsaCreateSignatureSha256()
{
  return MEMORY[0x270F97A60]();
}

uint64_t AMSupportEcDsaCreateSignatureSha384()
{
  return MEMORY[0x270F97A68]();
}

uint64_t AMSupportEcDsaCreateSignatureSha512()
{
  return MEMORY[0x270F97A70]();
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

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
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

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
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

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x270EE49D8](err);
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

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x270EF4A80](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
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

uint64_t Img4DecodeGetObjectPropertyData()
{
  return MEMORY[0x270F97C30]();
}

uint64_t Img4DecodeInitManifest()
{
  return MEMORY[0x270F97C70]();
}

uint64_t Img4EncodeCreateManifest()
{
  return MEMORY[0x270F97C98]();
}

uint64_t Img4EncodeItemBegin()
{
  return MEMORY[0x270F97CA8]();
}

uint64_t Img4EncodeItemCopyBuffer()
{
  return MEMORY[0x270F97CB0]();
}

uint64_t Img4EncodeItemDestroy()
{
  return MEMORY[0x270F97CB8]();
}

uint64_t Img4EncodeItemEnd()
{
  return MEMORY[0x270F97CC0]();
}

uint64_t Img4EncodeItemPropertyBool()
{
  return MEMORY[0x270F97CC8]();
}

uint64_t Img4EncodeItemPropertyData()
{
  return MEMORY[0x270F97CD0]();
}

uint64_t Img4EncodeItemPropertyInt32()
{
  return MEMORY[0x270F97CD8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetSInt64Answer()
{
  return MEMORY[0x270F95FF0]();
}

uint64_t NfRestoreOpenWithSE()
{
  return MEMORY[0x270F9A200]();
}

uint64_t NfRestoreSEClose()
{
  return MEMORY[0x270F9A218]();
}

uint64_t NfRestoreSEEnumerate()
{
  return MEMORY[0x270F9A228]();
}

uint64_t NfRestoreSETransceive()
{
  return MEMORY[0x270F9A238]();
}

uint64_t NfRestoreSETransceiveToOS()
{
  return MEMORY[0x270F9A248]();
}

uint64_t NfRestoreToggleSEPower()
{
  return MEMORY[0x270F9A250]();
}

uint64_t RPCopyProxyDictionary()
{
  return MEMORY[0x270F96718]();
}

uint64_t RPRegisterForAvailability()
{
  return MEMORY[0x270F96730]();
}

uint64_t RPRegistrationInvalidate()
{
  return MEMORY[0x270F96738]();
}

uint64_t RPRegistrationResume()
{
  return MEMORY[0x270F96748]();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t capabilities::euicc::shouldEnableEUICCDetectPullDown(capabilities::euicc *this)
{
  return MEMORY[0x270F96CC8](this);
}

uint64_t ctu::cf::MakeCFString::MakeCFString(ctu::cf::MakeCFString *this, const char *a2)
{
  return MEMORY[0x270F974F0](this, a2);
}

void ctu::cf::MakeCFString::~MakeCFString(ctu::cf::MakeCFString *this)
{
}

uint64_t ctu::cf::dict_adapter::dict_adapter(ctu::cf::dict_adapter *this, const __CFDictionary *a2)
{
  return MEMORY[0x270F97518](this, a2);
}

void ctu::cf::dict_adapter::~dict_adapter(ctu::cf::dict_adapter *this)
{
}

uint64_t ctu::cf::show(ctu::cf *this, const void *a2)
{
  return MEMORY[0x270F97540](this, a2);
}

uint64_t ctu::cf::show(ctu::cf *this, uint64_t a2, const void *a3)
{
  return MEMORY[0x270F97548](this, a2, a3);
}

uint64_t ctu::cf::assign()
{
  return MEMORY[0x270F97550]();
}

uint64_t ctu::hex(ctu *this, const void *a2)
{
  return MEMORY[0x270F97628](this, a2);
}

uint64_t ctu::hex()
{
  return MEMORY[0x270F97630]();
}

uint64_t ctu::cf::map_adapter::getInt(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x270F97908](this, a2);
}

uint64_t ctu::cf::map_adapter::getString()
{
  return MEMORY[0x270F97920]();
}

std::string::size_type std::string::rfind(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x270F98240](this, __c, __pos);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

const char *__cdecl std::exception::what(const std::exception *this)
{
  return (const char *)MEMORY[0x270F98310](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x270F98340](this, a2);
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x270F98398](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F98480](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984E0](this, __pos, __s);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x270F98548](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x270F985E0](this, *(void *)&__ec.__val_, __ec.__cat_);
}

void std::future_error::~future_error(std::future_error *this)
{
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x270F98638]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x270F98650]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x270F98658]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x270F98740]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x270F98750]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987D0]();
}

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

const std::error_category *std::future_category(void)
{
  return (const std::error_category *)MEMORY[0x270F988E0]();
}

const std::error_category *std::generic_category(void)
{
  return (const std::error_category *)MEMORY[0x270F98918]();
}

void std::__assoc_sub_state::__sub_wait(std::__assoc_sub_state *this, std::unique_lock<std::mutex> *__lk)
{
}

void std::__assoc_sub_state::set_exception(std::__assoc_sub_state *this, std::exception_ptr __p)
{
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
}

void std::condition_variable::__do_timed_wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x270F98B78](__str, __idx, *(void *)&__base);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

unint64_t std::stoul(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x270F98BC8](__str, __idx, *(void *)&__base);
}

uint64_t std::__sort<std::__less<char,char> &,char *>()
{
  return MEMORY[0x270F98BD0]();
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x270F98C18]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x270F98C28]();
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x270F98C70](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x270F98C78](this);
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

std::ios_base::failure *__cdecl std::ios_base::failure::failure(std::ios_base::failure *this, const std::string *__msg, const std::error_code *__ec)
{
  return (std::ios_base::failure *)MEMORY[0x270F98D78](this, __msg, __ec);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x270F98E10](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E20](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E28](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
}

void std::exception::~exception(std::exception *this)
{
}

std::exception_ptr std::current_exception(void)
{
  return (std::exception_ptr)MEMORY[0x270F98E98]();
}

void std::rethrow_exception(std::exception_ptr a1)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
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

void operator new[]()
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x270ED8718](a1, *(void *)&a2);
}

void backtrace_symbols_fd(void *const *a1, int a2, int a3)
{
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccdigest()
{
  return MEMORY[0x270ED8A40]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x270ED8D70]();
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x270ED8EC8](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int dlclose(void *__handle)
{
  return MEMORY[0x270ED9618](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

int getchar(void)
{
  return MEMORY[0x270ED9BC8]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x270EDA098](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return MEMORY[0x270EDB4B8](*(void *)&a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x270EDB5F0](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strtok(char *__str, const char *__sep)
{
  return (char *)MEMORY[0x270EDB6C8](__str, __sep);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x270EDB6D0](__str, __sep, __lasts);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA58](a1, a2, a3);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA70](a1, a2, a3);
}