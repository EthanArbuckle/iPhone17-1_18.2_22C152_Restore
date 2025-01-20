uint64_t _IPv4ToHostByteOrder(void *a1)
{
  int v1;
  unsigned int v2;
  unsigned int v4;

  v4 = 0;
  v1 = inet_pton(2, (const char *)[a1 UTF8String], &v4);
  v2 = bswap32(v4);
  if (v1 == 1) {
    return v2;
  }
  else {
    return 0;
  }
}

id _IPv6ToHostByteOrder(void *a1)
{
  long long v7 = 0uLL;
  id v1 = 0;
  if (inet_pton(30, (const char *)[a1 UTF8String], &v7) == 1)
  {
    v2 = [MEMORY[0x263EFF990] dataWithLength:16];
    id v1 = v2;
    if (v7 == 254 && (BYTE1(v7) & 0xC0) == 0x80)
    {
      id v3 = v2;
      v4 = (_OWORD *)[v3 mutableBytes];
      _OWORD *v4 = v7;
      id v5 = v3;
      *(unsigned char *)([v5 mutableBytes] + 2) = 0;
      id v1 = v5;
      *(unsigned char *)([v1 mutableBytes] + 3) = 0;
    }
  }

  return v1;
}

id _IPAddress(int a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v11 = 0;
  int v4 = getifaddrs(&v11);
  id v5 = 0;
  v6 = v11;
  if (!v4 && v11)
  {
    while (1)
    {
      long long v7 = [NSString stringWithUTF8String:v6->ifa_name];
      if ([v7 isEqualToString:v3])
      {
        ifa_addr = v6->ifa_addr;
        if (ifa_addr->sa_family == a1 && !getnameinfo(ifa_addr, ifa_addr->sa_len, v12, 0x401u, 0, 0, 2)) {
          break;
        }
      }
      v6 = v6->ifa_next;

      if (!v6)
      {
        id v5 = 0;
        goto LABEL_9;
      }
    }

    id v5 = v12;
LABEL_9:
    v6 = v11;
  }
  if (v6) {
    MEMORY[0x230F6CB10](v6);
  }
  if (v5)
  {
    v9 = [NSString stringWithUTF8String:v5];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void sub_22C801DC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22C801F40(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_22C802424(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22C802530(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22C8028EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_22C802DF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_22C8034A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22C803BC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t __CurrentTimeStamp_block_invoke()
{
  CurrentTimeStamp_ISO8601DateFormatter = (uint64_t)objc_alloc_init(MEMORY[0x263F088C0]);

  return MEMORY[0x270F9A758]();
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_22C8046C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t softBKSHIDServicesRequestProximityDetectionMode(uint64_t a1)
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v2 = (uint64_t (*)(uint64_t))getBKSHIDServicesRequestProximityDetectionModeSymbolLoc_ptr;
  v9 = getBKSHIDServicesRequestProximityDetectionModeSymbolLoc_ptr;
  if (!getBKSHIDServicesRequestProximityDetectionModeSymbolLoc_ptr)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __getBKSHIDServicesRequestProximityDetectionModeSymbolLoc_block_invoke;
    v5[3] = &unk_26491E868;
    v5[4] = &v6;
    __getBKSHIDServicesRequestProximityDetectionModeSymbolLoc_block_invoke((uint64_t)v5);
    uint64_t v2 = (uint64_t (*)(uint64_t))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    int v4 = (_Unwind_Exception *)softBKSHIDServicesRequestProximityDetectionMode_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v4);
  }
  return v2(a1);
}

void sub_22C805528(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void *__getBKSHIDServicesRequestProximityDetectionModeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!BackBoardServicesLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __BackBoardServicesLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    void v5[5] = v5;
    long long v6 = xmmword_26491E888;
    uint64_t v7 = 0;
    BackBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    id v3 = (void *)v5[0];
    uint64_t v2 = (void *)BackBoardServicesLibraryCore_frameworkLibrary;
    if (BackBoardServicesLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)BackBoardServicesLibraryCore_frameworkLibrary;
LABEL_5:
  result = dlsym(v2, "BKSHIDServicesRequestProximityDetectionMode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBKSHIDServicesRequestProximityDetectionModeSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                             + 24);
  return result;
}

uint64_t __BackBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BackBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void _UnregisterHIDSystemClient(void *a1)
{
  id v1 = a1;
  if (v1[1])
  {
    if (_TVLLogDefault_onceToken_2 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
    }
    uint64_t v2 = _TVLLogDefault_log_2;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_22C7FF000, v2, OS_LOG_TYPE_INFO, "UnregisterHIDSystemClient", v3, 2u);
    }
    CFRunLoopGetMain();
    IOHIDEventSystemClientUnscheduleWithRunLoop();
    IOHIDEventSystemClientUnregisterEventCallback();
    v1[1] = 0;
  }
}

void _ALSIOHIDEventCallback(void *a1, uint64_t a2, __IOHIDServiceClient *a3)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  if (_TVLLogDefault_onceToken_2 != -1) {
    dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
  }
  id v5 = _TVLLogDefault_log_2;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C7FF000, v5, OS_LOG_TYPE_INFO, "ALSIOHIDEventCallback", buf, 2u);
  }
  id v6 = a1;
  if (IOHIDEventGetType() == 12)
  {
    uint64_t v7 = (void (**)(void, void))MEMORY[0x230F6CE70](*((void *)v6 + 2));
    if (a3)
    {
      uint64_t v8 = (void *)IOHIDServiceClientCopyProperty(a3, @"LocationID");
      v9 = (void *)IOHIDServiceClientCopyProperty(a3, @"Built-In");
      if (v8 && [v8 intValue]) {
        [v8 intValue];
      }
      if ([v9 BOOLValue])
      {
        IOHIDEventGetFloatValue();
        float v11 = v10;
        IOHIDEventGetDoubleValue();
        double v13 = v12;
        IOHIDEventGetDoubleValue();
        double v15 = v14;
        IOHIDEventGetDoubleValue();
        double v17 = v16;
        IOHIDEventGetDoubleValue();
        double v19 = v18;
        long long v59 = 0u;
        memset(v60, 0, 25);
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        *(_OWORD *)buf = 0u;
        long long v54 = 0u;
        CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
        v52 = v9;
        if (Children)
        {
          if (CFArrayGetValueAtIndex(Children, 0))
          {
            uint64_t DataValue = IOHIDEventGetDataValue();
            if (DataValue)
            {
              v22 = (_OWORD *)DataValue;
              if (IOHIDEventGetIntegerValue() == 137)
              {
                long long v58 = v22[5];
                long long v59 = v22[6];
                v60[0] = v22[7];
                *(_OWORD *)((char *)v60 + 9) = *(_OWORD *)((char *)v22 + 121);
                long long v54 = v22[1];
                long long v55 = v22[2];
                long long v56 = v22[3];
                long long v57 = v22[4];
                *(_OWORD *)buf = *v22;
                unsigned int v23 = buf[4];
LABEL_28:
                v28 = objc_alloc_init(TVLALSData);
                float v25 = v13;
                *(float *)&double v29 = v25;
                v30 = [NSNumber numberWithFloat:v29];
                [(TVLALSData *)v28 setX:v30];

                float v26 = v15;
                *(float *)&double v31 = v26;
                v32 = [NSNumber numberWithFloat:v31];
                [(TVLALSData *)v28 setY:v32];

                float v27 = v17;
                *(float *)&double v33 = v27;
                v34 = [NSNumber numberWithFloat:v33];
                [(TVLALSData *)v28 setZ:v34];

                *(float *)&double v35 = v11;
                v36 = [NSNumber numberWithFloat:v35];
                [(TVLALSData *)v28 setLux:v36];

                *(float *)&double v37 = v19;
                v38 = [NSNumber numberWithFloat:v37];
                [(TVLALSData *)v28 setCct:v38];

                id v39 = objc_alloc_init(MEMORY[0x263EFF980]);
                if (v23)
                {
                  uint64_t v41 = v23;
                  v42 = (int *)&v54 + 3;
                  do
                  {
                    int v43 = *v42++;
                    LODWORD(v40) = v43;
                    v44 = [NSNumber numberWithFloat:v40];
                    [v39 addObject:v44];

                    --v41;
                  }
                  while (v41);
                }
                v45 = [MEMORY[0x263EFF8C0] arrayWithArray:v39];
                [(TVLALSData *)v28 setChannelData:v45];

                if (_TVLLogDefault_onceToken_2 != -1) {
                  dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
                }
                v9 = v52;
                v46 = _TVLLogDefault_log_2;
                if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_INFO))
                {
                  uint64_t v47 = *((void *)v6 + 4);
                  *(_DWORD *)v61 = 134217984;
                  uint64_t v62 = v47;
                  _os_log_impl(&dword_22C7FF000, v46, OS_LOG_TYPE_INFO, "ALSIOHIDEventCallback store ALS result (remaining count=%lu)", v61, 0xCu);
                }
                [*((id *)v6 + 3) addObject:v28];
                unint64_t v48 = *((void *)v6 + 4);
                BOOL v49 = v48 > 1;
                unint64_t v50 = v48 - 1;
                if (v49)
                {
                  *((void *)v6 + 4) = v50;
                }
                else
                {
                  *((void *)v6 + 4) = 0;
                  if (v7)
                  {
                    v51 = (void *)[*((id *)v6 + 3) copy];
                    ((void (**)(void, void *))v7)[2](v7, v51);
                  }
                }

LABEL_40:
                goto LABEL_41;
              }
              if (_TVLLogDefault_onceToken_2 != -1) {
                dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
              }
              if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_FAULT)) {
                _ALSIOHIDEventCallback_cold_1();
              }
            }
          }
        }
        unsigned int v23 = 0;
        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v8 = 0;
      v9 = 0;
    }
    if (_TVLLogDefault_onceToken_2 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
    }
    v24 = _TVLLogDefault_log_2;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C7FF000, v24, OS_LOG_TYPE_INFO, "ALSIOHIDEventCallback external event", buf, 2u);
    }
    if (v7) {
      v7[2](v7, 0);
    }
    goto LABEL_40;
  }
LABEL_41:
}

id _TVLLogDefault()
{
  if (_TVLLogDefault_onceToken_2 != -1) {
    dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
  }
  v0 = (void *)_TVLLogDefault_log_2;

  return v0;
}

void sub_22C807DB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

CFTypeID __isInternalBuild_block_invoke()
{
  CFTypeID result = MGCopyAnswer();
  if (result)
  {
    CFBooleanRef v1 = (const __CFBoolean *)result;
    CFTypeID v2 = CFGetTypeID((CFTypeRef)result);
    CFTypeID result = CFBooleanGetTypeID();
    if (v2 == result)
    {
      CFTypeID result = CFBooleanGetValue(v1);
      isInternalBuild_internalBuild = result != 0;
    }
  }
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void print_HmClData(uint64_t a1, os_log_t oslog)
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  if (!a1) {
    print_HmClData_cold_1();
  }
  uint64_t v3 = a1;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    print_HmClData_cold_16();
  }
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    print_HmClData_cold_15();
  }
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    print_HmClData_cold_14(v3, oslog);
  }
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    print_HmClData_cold_13();
  }
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    print_HmClData_cold_12();
  }
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    print_HmClData_cold_11();
  }
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    print_HmClData_cold_10();
  }
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    print_HmClData_cold_9();
  }
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    print_HmClData_cold_8();
  }
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    print_HmClData_cold_7(v3, oslog);
  }
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    print_HmClData_cold_6(v3, oslog);
  }
  uint64_t v4 = 0;
  uint64_t v64 = v3 + 204;
  uint64_t v65 = v3 + 96;
  uint64_t v62 = v3 + 228;
  uint64_t v63 = v3 + 216;
  uint64_t v60 = v3 + 240;
  uint64_t v61 = v3 + 234;
  uint64_t v66 = v3 + 288;
  uint64_t v58 = v3 + 300;
  uint64_t v59 = v3 + 264;
  uint64_t v57 = v3 + 324;
  char v5 = 1;
  do
  {
    char v67 = v5;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v22 = *(unsigned __int8 *)(v3 + 5080 * v4 + 76);
      *(_DWORD *)buf = 67109120;
      LODWORD(v75) = v22;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "source:           %d\n", buf, 8u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v23 = *(unsigned __int8 *)(v3 + 5080 * v4 + 77);
      *(_DWORD *)buf = 67109120;
      LODWORD(v75) = v23;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "algo_version:       %d\n", buf, 8u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v24 = *(unsigned __int16 *)(v3 + 5080 * v4 + 78);
      *(_DWORD *)buf = 67109120;
      LODWORD(v75) = v24;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "size:               %d\n", buf, 8u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v25 = *(unsigned __int8 *)(v3 + 5080 * v4 + 80);
      *(_DWORD *)buf = 67109120;
      LODWORD(v75) = v25;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "numChannels:        %d\n", buf, 8u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v26 = *(unsigned __int8 *)(v3 + 5080 * v4 + 81);
      *(_DWORD *)buf = 67109120;
      LODWORD(v75) = v26;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "numGains:           %d\n", buf, 8u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v27 = *(unsigned __int16 *)(v3 + 5080 * v4 + 82);
      *(_DWORD *)buf = 67109120;
      LODWORD(v75) = v27;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "slow_int:           %d\n", buf, 8u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v28 = *(unsigned __int16 *)(v3 + 5080 * v4 + 84);
      *(_DWORD *)buf = 67109120;
      LODWORD(v75) = v28;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "fast_int:           %d\n", buf, 8u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v29 = *(unsigned __int16 *)(v3 + 5080 * v4 + 86);
      *(_DWORD *)buf = 67109120;
      LODWORD(v75) = v29;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "rapid_int:          %d\n", buf, 8u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v30 = *(unsigned __int16 *)(v3 + 5080 * v4 + 88);
      *(_DWORD *)buf = 67109120;
      LODWORD(v75) = v30;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "occlusion_int:      %d\n", buf, 8u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      long double v31 = ldexp(1.0, *(unsigned __int8 *)(v3 + 5080 * v4 + 90));
      *(_DWORD *)buf = 134217984;
      double v75 = v31;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "slow_gain:           %f\n", buf, 0xCu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      long double v32 = ldexp(1.0, *(unsigned __int8 *)(v3 + 5080 * v4 + 91));
      *(_DWORD *)buf = 134217984;
      double v75 = v32;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "fast_gain:           %f\n", buf, 0xCu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      long double v33 = ldexp(1.0, *(unsigned __int8 *)(v3 + 5080 * v4 + 92));
      *(_DWORD *)buf = 134217984;
      double v75 = v33;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "rapid_gain:          %f\n", buf, 0xCu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      long double v34 = ldexp(1.0, *(unsigned __int8 *)(v3 + 5080 * v4 + 93));
      *(_DWORD *)buf = 134217984;
      double v75 = v34;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "occlusion_gain:      %f\n", buf, 0xCu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v6) = *(_WORD *)(v3 + 5080 * v4 + 94);
      *(_DWORD *)buf = 134217984;
      double v75 = (float)((float)v6 * 0.000061035);
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "lux_correction:      %f\n", buf, 0xCu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
      print_HmClData_cold_5(&v72, v73);
    }
    uint64_t v7 = v3 + 5080 * v4;
    int v9 = *(unsigned __int8 *)(v7 + 80);
    uint64_t v8 = (unsigned char *)(v7 + 80);
    if (v9)
    {
      unint64_t v10 = 0;
      uint64_t v11 = v4;
      uint64_t v12 = 5080 * v4;
      uint64_t v13 = v3;
      double v14 = (unsigned __int8 *)(v3 + v12 + 81);
      uint64_t v15 = v65 + v12;
      do
      {
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v75) = v10;
          _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "\tch%d: ", buf, 8u);
        }
        unsigned __int8 v16 = *v14;
        if (*v14)
        {
          unint64_t v17 = 0;
          do
          {
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v18) = *(_WORD *)(v15 + 2 * v17);
              *(_DWORD *)buf = 134217984;
              double v75 = (float)((float)v18 * 0.000061035);
              _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "%f\t", buf, 0xCu);
              unsigned __int8 v16 = *v14;
            }
            ++v17;
          }
          while (v17 < v16);
        }
        ++v10;
        unint64_t v19 = *v8;
        v15 += 18;
      }
      while (v10 < v19);
      uint64_t v3 = v13;
      uint64_t v4 = v11;
    }
    else
    {
      LODWORD(v19) = 0;
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "azOffset: ", buf, 2u);
      LODWORD(v19) = *v8;
      if (!*v8) {
        goto LABEL_75;
      }
    }
    else if (!v19)
    {
      goto LABEL_75;
    }
    unint64_t v20 = 0;
    do
    {
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        int v21 = *(__int16 *)(v64 + 5080 * v4 + 2 * v20);
        *(_DWORD *)buf = 67109120;
        LODWORD(v75) = v21;
        _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "%d\t", buf, 8u);
        LODWORD(v19) = *v8;
      }
      ++v20;
    }
    while (v20 < v19);
LABEL_75:
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "adcOffset: ", buf, 2u);
      LODWORD(v19) = *v8;
      if (!*v8) {
        goto LABEL_83;
      }
    }
    else if (!v19)
    {
      goto LABEL_83;
    }
    unint64_t v35 = 0;
    do
    {
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        double v36 = (float)((float)*(__int16 *)(v63 + 5080 * v4 + 2 * v35) * 0.0039062);
        *(_DWORD *)buf = 134217984;
        double v75 = v36;
        _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "%f\t", buf, 0xCu);
        LODWORD(v19) = *v8;
      }
      ++v35;
    }
    while (v35 < v19);
LABEL_83:
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "darkCounts: ", buf, 2u);
      LODWORD(v19) = *v8;
      if (!*v8) {
        goto LABEL_91;
      }
    }
    else if (!v19)
    {
      goto LABEL_91;
    }
    unint64_t v37 = 0;
    do
    {
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        int v38 = *(unsigned __int8 *)(v62 + 5080 * v4 + v37);
        *(_DWORD *)buf = 67109120;
        LODWORD(v75) = v38;
        _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "%d\t", buf, 8u);
        LODWORD(v19) = *v8;
      }
      ++v37;
    }
    while (v37 < v19);
LABEL_91:
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "backlightCounts: ", buf, 2u);
      LODWORD(v19) = *v8;
      if (!*v8) {
        goto LABEL_99;
      }
    }
    else if (!v19)
    {
      goto LABEL_99;
    }
    unint64_t v39 = 0;
    do
    {
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        int v40 = *(char *)(v61 + 5080 * v4 + v39);
        *(_DWORD *)buf = 67109120;
        LODWORD(v75) = v40;
        _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "%d\t", buf, 8u);
        LODWORD(v19) = *v8;
      }
      ++v39;
    }
    while (v39 < v19);
LABEL_99:
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "luxCoeff: ", buf, 2u);
      LODWORD(v19) = *v8;
      if (!*v8) {
        goto LABEL_107;
      }
    }
    else if (!v19)
    {
      goto LABEL_107;
    }
    unint64_t v41 = 0;
    do
    {
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        double v42 = (float)((float)*(int *)(v60 + 5080 * v4 + 4 * v41) * 0.000015259);
        *(_DWORD *)buf = 134217984;
        double v75 = v42;
        _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "%f\t", buf, 0xCu);
        LODWORD(v19) = *v8;
      }
      ++v41;
    }
    while (v41 < v19);
LABEL_107:
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "cctCoeff: ", buf, 2u);
      LODWORD(v19) = *v8;
      if (!*v8) {
        goto LABEL_115;
      }
    }
    else if (!v19)
    {
      goto LABEL_115;
    }
    unint64_t v43 = 0;
    do
    {
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        double v44 = (float)((float)*(int *)(v59 + 5080 * v4 + 4 * v43) * 0.000015259);
        *(_DWORD *)buf = 134217984;
        double v75 = v44;
        _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "%f\t", buf, 0xCu);
        LODWORD(v19) = *v8;
      }
      ++v43;
    }
    while (v43 < v19);
LABEL_115:
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
      print_HmClData_cold_4(&v70, v71);
    }
    for (uint64_t i = 0; i != 8; i += 2)
    {
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v46) = *(_WORD *)(v66 + 5080 * v4 + i);
        *(_DWORD *)buf = 134217984;
        double v75 = (float)((float)v46 * 0.000030518);
        _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "%f\t", buf, 0xCu);
      }
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      double v52 = (float)((float)*(unsigned int *)(v3 + 5080 * v4 + 296) * 0.000015259);
      *(_DWORD *)buf = 134217984;
      double v75 = v52;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "spectrum_normalization:      %f\n", buf, 0xCu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
      print_HmClData_cold_3(&v68, v69);
    }
    unsigned int v47 = *v8;
    if (*v8)
    {
      unint64_t v48 = 0;
      do
      {
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          double v49 = (float)((float)*(unsigned int *)(v58 + 5080 * v4 + 4 * v48) * 0.000015259);
          *(_DWORD *)buf = 134217984;
          double v75 = v49;
          _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "%f\t", buf, 0xCu);
          unsigned int v47 = *v8;
        }
        ++v48;
      }
      while (v48 < v47);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "pia: ", buf, 2u);
      unsigned int v47 = *v8;
      if (!*v8) {
        goto LABEL_138;
      }
    }
    else if (!v47)
    {
      goto LABEL_138;
    }
    unint64_t v50 = 0;
    do
    {
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v51) = *(_WORD *)(v57 + 5080 * v4 + 2 * v50);
        *(_DWORD *)buf = 134217984;
        double v75 = (float)((float)v51 * 0.000061035);
        _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "%f\t", buf, 0xCu);
        unsigned int v47 = *v8;
      }
      ++v50;
    }
    while (v50 < v47);
LABEL_138:
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v53 = *(unsigned __int16 *)(v3 + 5080 * v4 + 336);
      *(_DWORD *)buf = 67109120;
      LODWORD(v75) = v53;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "wavelength_start_visible:           %d\n", buf, 8u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v54 = *(unsigned __int16 *)(v3 + 5080 * v4 + 338);
      *(_DWORD *)buf = 67109120;
      LODWORD(v75) = v54;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "wavelength_start_nir:               %d\n", buf, 8u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v55 = *(unsigned __int16 *)(v3 + 5080 * v4 + 340);
      *(_DWORD *)buf = 67109120;
      LODWORD(v75) = v55;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "wavelength_end:                     %d\n", buf, 8u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v56 = *(unsigned __int8 *)(v3 + 5080 * v4 + 342);
      *(_DWORD *)buf = 67109120;
      LODWORD(v75) = v56;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "wavelength_step:                    %d\n", buf, 8u);
    }
    char v5 = 0;
    uint64_t v4 = 1;
  }
  while ((v67 & 1) != 0);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    print_HmClData_cold_2();
  }
}

void print_HmCl_VD6287_v3(unsigned __int8 *a1, os_log_t oslog)
{
  uint64_t v123 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    print_HmCl_VD6287_v3_cold_11();
  }
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    print_HmCl_VD6287_v3_cold_10();
  }
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    print_HmCl_VD6287_v3_cold_9();
  }
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    print_HmCl_VD6287_v3_cold_8();
  }
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    print_HmCl_VD6287_v3_cold_7();
  }
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    print_HmCl_VD6287_v3_cold_6();
  }
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    print_HmCl_VD6287_v3_cold_5();
  }
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    print_HmCl_VD6287_v3_cold_4();
  }
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    print_HmCl_VD6287_v3_cold_3(a1);
  }
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    print_HmCl_VD6287_v3_cold_2(a1);
  }
  uint64_t v4 = 0;
  char v5 = 1;
  do
  {
    char v6 = v5;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109378;
      uint64_t v11 = "ASYNC";
      if (v6) {
        uint64_t v11 = "SYNC";
      }
      int v110 = v4;
      __int16 v111 = 2080;
      *(void *)v112 = v11;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d] (%s)\n", buf, 0x12u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v12 = a1[5134 * v4 + 80];
      *(_DWORD *)buf = 67109376;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v12;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].source = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v13 = a1[5134 * v4 + 81];
      *(_DWORD *)buf = 67109376;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v13;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].algo_version = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v14 = *(unsigned __int16 *)&a1[5134 * v4 + 82];
      *(_DWORD *)buf = 67109376;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v14;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].size = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v15 = a1[5134 * v4 + 84];
      *(_DWORD *)buf = 67109376;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v15;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].num_channels = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v16 = a1[5134 * v4 + 85];
      *(_DWORD *)buf = 67109376;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v16;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].num_gains = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v17 = a1[5134 * v4 + 86];
      *(_DWORD *)buf = 67109376;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v17;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].lux_coefficient_gain = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v18 = *(unsigned __int16 *)&a1[5134 * v4 + 87];
      *(_DWORD *)buf = 67109376;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v18;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].lux_coefficient_tint_time = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v19 = *(unsigned __int16 *)&a1[5134 * v4 + 89];
      *(_DWORD *)buf = 67109376;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v19;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].lux_coefficient_tint_nsamples = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v20 = &a1[5134 * v4];
      int v21 = v20[91];
      int v22 = v20[92];
      int v23 = v20[93];
      int v24 = v20[94];
      int v25 = v20[95];
      LODWORD(v20) = v20[96];
      *(_DWORD *)buf = 67110656;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v21;
      *(_WORD *)&v112[4] = 1024;
      *(_DWORD *)&v112[6] = v22;
      __int16 v113 = 1024;
      int v114 = v23;
      __int16 v115 = 1024;
      int v116 = v24;
      __int16 v117 = 1024;
      int v118 = v25;
      __int16 v119 = 1024;
      int v120 = (int)v20;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].occlusion = [%u,%u,%u,%u,%u,%u]\n", buf, 0x2Cu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v26 = *(unsigned __int16 *)&a1[5134 * v4 + 97];
      *(_DWORD *)buf = 67109376;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v26;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].temperature_mod100 = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v27 = *(unsigned __int16 *)&a1[5134 * v4 + 99];
      *(_DWORD *)buf = 67109376;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v27;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].lux_correction_mod16384 = %u\n", buf, 0xEu);
    }
    uint64_t v7 = 0;
    uint64_t v8 = (uint64_t)&a1[5134 * v4 + 101];
    do
    {
      for (uint64_t i = 0; i != 9; ++i)
      {
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          int v10 = *(unsigned __int16 *)(v8 + 2 * i);
          *(_DWORD *)buf = 67109888;
          int v110 = v4;
          __int16 v111 = 1024;
          *(_DWORD *)v112 = v7;
          *(_WORD *)&v112[4] = 1024;
          *(_DWORD *)&v112[6] = i;
          __int16 v113 = 1024;
          int v114 = v10;
          _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].gain_scaling_mod16384[%u][%u] = %u\n", buf, 0x1Au);
        }
      }
      ++v7;
      v8 += 18;
    }
    while (v7 != 6);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v28 = &a1[5134 * v4];
      int v29 = *(__int16 *)(v28 + 209);
      int v30 = *(__int16 *)(v28 + 211);
      int v31 = *(__int16 *)(v28 + 213);
      int v32 = *(__int16 *)(v28 + 215);
      int v33 = *(__int16 *)(v28 + 217);
      LODWORD(v28) = *(__int16 *)(v28 + 219);
      *(_DWORD *)buf = 67110656;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v29;
      *(_WORD *)&v112[4] = 1024;
      *(_DWORD *)&v112[6] = v30;
      __int16 v113 = 1024;
      int v114 = v31;
      __int16 v115 = 1024;
      int v116 = v32;
      __int16 v117 = 1024;
      int v118 = v33;
      __int16 v119 = 1024;
      int v120 = (int)v28;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].dark_counts_offset = [%d,%d,%d,%d,%d,%d]\n", buf, 0x2Cu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      long double v34 = &a1[5134 * v4];
      int v35 = *(__int16 *)(v34 + 221);
      int v36 = *(__int16 *)(v34 + 223);
      int v37 = *(__int16 *)(v34 + 225);
      int v38 = *(__int16 *)(v34 + 227);
      int v39 = *(__int16 *)(v34 + 229);
      LODWORD(v34) = *(__int16 *)(v34 + 231);
      *(_DWORD *)buf = 67110656;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v35;
      *(_WORD *)&v112[4] = 1024;
      *(_DWORD *)&v112[6] = v36;
      __int16 v113 = 1024;
      int v114 = v37;
      __int16 v115 = 1024;
      int v116 = v38;
      __int16 v117 = 1024;
      int v118 = v39;
      __int16 v119 = 1024;
      int v120 = (int)v34;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].cnt_ratio_mod16384 = [%d,%d,%d,%d,%d,%d]\n", buf, 0x2Cu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v40 = &a1[5134 * v4];
      int v41 = *(_DWORD *)(v40 + 233);
      int v42 = *(_DWORD *)(v40 + 237);
      int v43 = *(_DWORD *)(v40 + 241);
      int v44 = *(_DWORD *)(v40 + 245);
      int v45 = *(_DWORD *)(v40 + 249);
      LODWORD(v40) = *(_DWORD *)(v40 + 253);
      *(_DWORD *)buf = 67110656;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v41;
      *(_WORD *)&v112[4] = 1024;
      *(_DWORD *)&v112[6] = v42;
      __int16 v113 = 1024;
      int v114 = v43;
      __int16 v115 = 1024;
      int v116 = v44;
      __int16 v117 = 1024;
      int v118 = v45;
      __int16 v119 = 1024;
      int v120 = (int)v40;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].lux_coefficient_mod65536 = [%d,%d,%d,%d,%d,%d]\n", buf, 0x2Cu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v46 = *(_DWORD *)&a1[5134 * v4 + 257];
      int v47 = *(_DWORD *)&a1[5134 * v4 + 261];
      int v48 = *(_DWORD *)&a1[5134 * v4 + 265];
      int v49 = *(_DWORD *)&a1[5134 * v4 + 269];
      int v50 = *(_DWORD *)&a1[5134 * v4 + 273];
      int v51 = *(_DWORD *)&a1[5134 * v4 + 277];
      *(_DWORD *)buf = 67110656;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v46;
      *(_WORD *)&v112[4] = 1024;
      *(_DWORD *)&v112[6] = v47;
      __int16 v113 = 1024;
      int v114 = v48;
      __int16 v115 = 1024;
      int v116 = v49;
      __int16 v117 = 1024;
      int v118 = v50;
      __int16 v119 = 1024;
      int v120 = v51;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].cct_coefficient_mod256 = [%d,%d,%d,%d,%d,%d]\n", buf, 0x2Cu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v52 = *(_DWORD *)&a1[5134 * v4 + 281];
      *(_DWORD *)buf = 67109376;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v52;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].normalization_factor_mod65536 = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v53 = *(_DWORD *)&a1[5134 * v4 + 285];
      int v54 = *(_DWORD *)&a1[5134 * v4 + 289];
      int v55 = *(_DWORD *)&a1[5134 * v4 + 293];
      int v56 = *(_DWORD *)&a1[5134 * v4 + 297];
      int v57 = *(_DWORD *)&a1[5134 * v4 + 301];
      int v58 = *(_DWORD *)&a1[5134 * v4 + 305];
      *(_DWORD *)buf = 67110656;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v53;
      *(_WORD *)&v112[4] = 1024;
      *(_DWORD *)&v112[6] = v54;
      __int16 v113 = 1024;
      int v114 = v55;
      __int16 v115 = 1024;
      int v116 = v56;
      __int16 v117 = 1024;
      int v118 = v57;
      __int16 v119 = 1024;
      int v120 = v58;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].nir_scaling_mod65536 = [%d,%d,%d,%d,%d,%d]\n", buf, 0x2Cu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v59 = *(unsigned __int16 *)&a1[5134 * v4 + 309];
      *(_DWORD *)buf = 67109376;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v59;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].wl_start_visible = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v60 = *(unsigned __int16 *)&a1[5134 * v4 + 311];
      *(_DWORD *)buf = 67109376;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v60;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].wl_start_nir = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v61 = *(unsigned __int16 *)&a1[5134 * v4 + 313];
      *(_DWORD *)buf = 67109376;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v61;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].wl_end = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v62 = a1[5134 * v4 + 315];
      *(_DWORD *)buf = 67109376;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v62;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].wl_step = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v63 = *(unsigned __int16 *)&a1[5134 * v4 + 5130];
      *(_DWORD *)buf = 67109376;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v63;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].alsh.als_location_x = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v64 = *(unsigned __int16 *)&a1[5134 * v4 + 5132];
      *(_DWORD *)buf = 67109376;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v64;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].alsh.als_location_y = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v65 = a1[5134 * v4 + 5134];
      *(_DWORD *)buf = 67109376;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v65;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].alsh.num_nits = %u\n", buf, 0xEu);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v66 = *(unsigned __int16 *)&a1[5134 * v4 + 5135];
      int v67 = *(unsigned __int16 *)&a1[5134 * v4 + 5137];
      int v68 = *(unsigned __int16 *)&a1[5134 * v4 + 5139];
      int v69 = *(unsigned __int16 *)&a1[5134 * v4 + 5141];
      int v70 = *(unsigned __int16 *)&a1[5134 * v4 + 5143];
      int v71 = *(unsigned __int16 *)&a1[5134 * v4 + 5145];
      int v72 = *(unsigned __int16 *)&a1[5134 * v4 + 5147];
      *(_DWORD *)buf = 67110912;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v66;
      *(_WORD *)&v112[4] = 1024;
      *(_DWORD *)&v112[6] = v67;
      __int16 v113 = 1024;
      int v114 = v68;
      __int16 v115 = 1024;
      int v116 = v69;
      __int16 v117 = 1024;
      int v118 = v70;
      __int16 v119 = 1024;
      int v120 = v71;
      __int16 v121 = 1024;
      int v122 = v72;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].alsh.nits = [%u,%u,%u,%u,%u,%u,%u]\n", buf, 0x32u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v73 = *(unsigned __int16 *)&a1[5134 * v4 + 5149];
      int v74 = *(unsigned __int16 *)&a1[5134 * v4 + 5151];
      int v75 = *(unsigned __int16 *)&a1[5134 * v4 + 5153];
      int v76 = *(unsigned __int16 *)&a1[5134 * v4 + 5155];
      int v77 = *(unsigned __int16 *)&a1[5134 * v4 + 5157];
      int v78 = *(unsigned __int16 *)&a1[5134 * v4 + 5159];
      int v79 = *(unsigned __int16 *)&a1[5134 * v4 + 5161];
      *(_DWORD *)buf = 67110912;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v73;
      *(_WORD *)&v112[4] = 1024;
      *(_DWORD *)&v112[6] = v74;
      __int16 v113 = 1024;
      int v114 = v75;
      __int16 v115 = 1024;
      int v116 = v76;
      __int16 v117 = 1024;
      int v118 = v77;
      __int16 v119 = 1024;
      int v120 = v78;
      __int16 v121 = 1024;
      int v122 = v79;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].alsh.line_delay = [%u,%u,%u,%u,%u,%u,%u]\n", buf, 0x32u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v80 = a1[5134 * v4 + 5177];
      int v81 = a1[5134 * v4 + 5178];
      int v82 = a1[5134 * v4 + 5179];
      int v83 = a1[5134 * v4 + 5180];
      int v84 = a1[5134 * v4 + 5181];
      int v85 = a1[5134 * v4 + 5182];
      int v86 = a1[5134 * v4 + 5183];
      *(_DWORD *)buf = 67110912;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v80;
      *(_WORD *)&v112[4] = 1024;
      *(_DWORD *)&v112[6] = v81;
      __int16 v113 = 1024;
      int v114 = v82;
      __int16 v115 = 1024;
      int v116 = v83;
      __int16 v117 = 1024;
      int v118 = v84;
      __int16 v119 = 1024;
      int v120 = v85;
      __int16 v121 = 1024;
      int v122 = v86;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].alsh.tint_gain = [%u,%u,%u,%u,%u,%u,%u]\n", buf, 0x32u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v87 = *(unsigned __int16 *)&a1[5134 * v4 + 5163];
      int v88 = *(unsigned __int16 *)&a1[5134 * v4 + 5165];
      int v89 = *(unsigned __int16 *)&a1[5134 * v4 + 5167];
      int v90 = *(unsigned __int16 *)&a1[5134 * v4 + 5169];
      int v91 = *(unsigned __int16 *)&a1[5134 * v4 + 5171];
      int v92 = *(unsigned __int16 *)&a1[5134 * v4 + 5173];
      int v93 = *(unsigned __int16 *)&a1[5134 * v4 + 5175];
      *(_DWORD *)buf = 67110912;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v87;
      *(_WORD *)&v112[4] = 1024;
      *(_DWORD *)&v112[6] = v88;
      __int16 v113 = 1024;
      int v114 = v89;
      __int16 v115 = 1024;
      int v116 = v90;
      __int16 v117 = 1024;
      int v118 = v91;
      __int16 v119 = 1024;
      int v120 = v92;
      __int16 v121 = 1024;
      int v122 = v93;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].alsh.tint_time = [%u,%u,%u,%u,%u,%u,%u]\n", buf, 0x32u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v94 = (unsigned __int16 *)&a1[5134 * v4];
      int v95 = v94[2599];
      int v96 = v94[2600];
      int v97 = v94[2601];
      int v98 = v94[2602];
      int v99 = v94[2603];
      int v100 = v94[2604];
      LODWORD(v94) = v94[2605];
      *(_DWORD *)buf = 67110912;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v95;
      *(_WORD *)&v112[4] = 1024;
      *(_DWORD *)&v112[6] = v96;
      __int16 v113 = 1024;
      int v114 = v97;
      __int16 v115 = 1024;
      int v116 = v98;
      __int16 v117 = 1024;
      int v118 = v99;
      __int16 v119 = 1024;
      int v120 = v100;
      __int16 v121 = 1024;
      int v122 = (int)v94;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].alsh.tint_interval = [%u,%u,%u,%u,%u,%u,%u]\n", buf, 0x32u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v101 = (unsigned __int16 *)&a1[5134 * v4];
      int v102 = v101[2592];
      int v103 = v101[2593];
      int v104 = v101[2594];
      int v105 = v101[2595];
      int v106 = v101[2596];
      int v107 = v101[2597];
      LODWORD(v101) = v101[2598];
      *(_DWORD *)buf = 67110912;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v102;
      *(_WORD *)&v112[4] = 1024;
      *(_DWORD *)&v112[6] = v103;
      __int16 v113 = 1024;
      int v114 = v104;
      __int16 v115 = 1024;
      int v116 = v105;
      __int16 v117 = 1024;
      int v118 = v106;
      __int16 v119 = 1024;
      int v120 = v107;
      __int16 v121 = 1024;
      int v122 = (int)v101;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].alsh.tint_nsamples = [%u,%u,%u,%u,%u,%u,%u]\n", buf, 0x32u);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v108 = a1[5134 * v4 + 5212];
      *(_DWORD *)buf = 67109376;
      int v110 = v4;
      __int16 v111 = 1024;
      *(_DWORD *)v112 = v108;
      _os_log_debug_impl(&dword_22C7FF000, oslog, OS_LOG_TYPE_DEBUG, "blobs[%d].alsh.num_regions = %u\n", buf, 0xEu);
    }
    char v5 = 0;
    uint64_t v4 = 1;
  }
  while ((v6 & 1) != 0);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    print_HmCl_VD6287_v3_cold_1();
  }
}

CFDataRef convertNighthawkHmClv1Tov3()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  *(void *)&v32[10268] = *MEMORY[0x263EF8340];
  bzero(v32, 0x281CuLL);
  uint64_t v1 = 0;
  *(void *)bytes = *(void *)v0;
  int v25 = *(_DWORD *)(v0 + 8);
  uint64_t v26 = *(void *)(v0 + 12);
  int v27 = *(_DWORD *)(v0 + 20);
  *(_OWORD *)&v29[12] = *(_OWORD *)(v0 + 52);
  *(_OWORD *)int v29 = *(_OWORD *)(v0 + 40);
  long long v2 = *(_OWORD *)(v0 + 24);
  char v3 = 1;
  uint64_t v30 = *(void *)(v0 + 68);
  int v31 = *(_DWORD *)(v0 + 76);
  long long v28 = v2;
  do
  {
    uint64_t v4 = 0;
    uint64_t v5 = v0 + 5180 * v1;
    char v6 = &bytes[5134 * v1];
    *((_DWORD *)v6 + 20) = *(_DWORD *)(v5 + 80);
    v6[84] = *(unsigned char *)(v5 + 84);
    *(_WORD *)(v6 + 85) = *(_WORD *)(v5 + 85);
    *(_DWORD *)(v6 + 91) = *(_DWORD *)(v5 + 89);
    *(_WORD *)(v6 + 95) = *(_WORD *)(v5 + 93);
    *(_WORD *)(v6 + 97) = *(_WORD *)(v5 + 99);
    *(_WORD *)(v6 + 99) = *(_WORD *)(v5 + 101);
    char v7 = v3;
    *(_DWORD *)(v6 + 87) = -1;
    long long v8 = *(_OWORD *)(v5 + 103);
    long long v9 = *(_OWORD *)(v5 + 119);
    *(_OWORD *)(v6 + 133) = *(_OWORD *)(v5 + 135);
    *(_OWORD *)(v6 + 117) = v9;
    *(_OWORD *)(v6 + 101) = v8;
    long long v10 = *(_OWORD *)(v5 + 151);
    long long v11 = *(_OWORD *)(v5 + 167);
    long long v12 = *(_OWORD *)(v5 + 183);
    *(_OWORD *)(v6 + 193) = *(_OWORD *)(v5 + 195);
    *(_OWORD *)(v6 + 181) = v12;
    *(_OWORD *)(v6 + 165) = v11;
    *(_OWORD *)(v6 + 149) = v10;
    do
    {
      *(_WORD *)&v32[5134 * v1 + 129 + 2 * v4] = *(char *)(v0 + 217 + 5180 * v1 + v4);
      ++v4;
    }
    while (v4 != 6);
    uint64_t v13 = v0 + 5180 * v1;
    int v14 = &bytes[5134 * v1];
    *(void *)(v14 + 221) = *(void *)(v13 + 223);
    *(_DWORD *)(v14 + 229) = *(_DWORD *)(v13 + 231);
    *(_OWORD *)(v14 + 233) = *(_OWORD *)(v13 + 235);
    *(void *)(v14 + 249) = *(void *)(v13 + 251);
    *(_OWORD *)(v14 + 257) = *(_OWORD *)(v13 + 259);
    *(void *)(v14 + 273) = *(void *)(v13 + 275);
    *(_DWORD *)(v14 + 281) = *(_DWORD *)(v13 + 283);
    *(void *)(v14 + 301) = *(void *)(v13 + 303);
    *(_OWORD *)(v14 + 285) = *(_OWORD *)(v13 + 287);
    *(_WORD *)(v14 + 309) = *(_WORD *)(v13 + 311);
    *(_DWORD *)(v14 + 311) = *(_DWORD *)(v13 + 313);
    v14[315] = *(unsigned char *)(v13 + 317);
    memcpy(v14 + 318, (const void *)(v13 + 319), 0x12D0uLL);
    LOWORD(v15) = *(unsigned __int8 *)(v13 + 5135) + 1;
    v14[5134] = *(unsigned char *)(v13 + 5135) + 1;
    *(void *)(v14 + 5137) = *(void *)(v13 + 5136);
    uint64_t v16 = *(void *)(v13 + 5144);
    *(void *)(v14 + 5151) = v16;
    *(_WORD *)(v14 + 5149) = v16;
    if ((v15 & 0x100) == 0)
    {
      uint64_t v15 = v15;
      __int16 v17 = *(_WORD *)(v0 + 5180 * v1 + 5153);
      char v18 = *(unsigned char *)(v0 + 5180 * v1 + 5152);
      __int16 v19 = *(_WORD *)(v0 + 5180 * v1 + 5157);
      __int16 v20 = *(_WORD *)(v0 + 5180 * v1 + 5155);
      int v21 = &v32[5134 * v1 + 5118];
      int v22 = &v32[5134 * v1 + 5097];
      do
      {
        *(_WORD *)((char *)v21 - 35) = v17;
        *v22++ = v18;
        *(v21 - 7) = v19;
        *v21++ = v20;
        --v15;
      }
      while (v15);
    }
    char v3 = 0;
    v32[5134 * v1 + 5132] = *(unsigned char *)(v0 + 5180 * v1 + 5159);
    uint64_t v1 = 1;
  }
  while ((v7 & 1) != 0);
  return CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, 10348);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

double OUTLINED_FUNCTION_2_0()
{
  return 2.0542726e-289;
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

unsigned char *OUTLINED_FUNCTION_4_0(unsigned char *result, unsigned char *a2)
{
  void *result = 0;
  *a2 = 0;
  return result;
}

void TapToRadar()
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263F08BA0];
  uint64_t v1 = [NSURL URLWithString:@"tap-to-radar://new"];
  long long v2 = [v0 componentsWithURL:v1 resolvingAgainstBaseURL:0];

  __int16 v20 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentName" value:@"AMP tvOS Core"];
  __int16 v19 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentVersion" value:@"AV Calibration"];
  char v18 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentID" value:@"992338"];
  char v3 = [MEMORY[0x263F08BD0] queryItemWithName:@"DeviceClasses" value:@"iPhone,AppleTV"];
  uint64_t v4 = [MEMORY[0x263F08BD0] queryItemWithName:@"AutoDiagnostics" value:@"phone"];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  char v6 = +[TVLPersistenceManager allRecordingPaths];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v21 + 1) + 8 * v10) path];
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v12 = (void *)MEMORY[0x263F08BD0];
  uint64_t v13 = [v5 componentsJoinedByString:@","];
  int v14 = [v12 queryItemWithName:@"Attachments" value:v13];

  v25[0] = v20;
  v25[1] = v19;
  v25[2] = v18;
  v25[3] = v3;
  v25[4] = v4;
  v25[5] = v14;
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:6];
  [v2 setQueryItems:v15];

  uint64_t v16 = [v2 URL];
  __int16 v17 = [MEMORY[0x263F01880] defaultWorkspace];
  [v17 openURL:v16 configuration:0 completionHandler:0];
}

id AllRecordings()
{
  return +[TVLPersistenceManager allRecordingPaths];
}

uint64_t EraseAllRecordings()
{
  return +[TVLPersistenceManager eraseAllRecordings];
}

void sub_22C80A98C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_22C80AB80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_22C80AD60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22C80B424(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22C80B8B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22C80BFC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22C80C430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22C80C6D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __DeviceProductType_block_invoke()
{
  uint64_t v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    uint64_t v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      objc_storeStrong((id *)&DeviceProductType_type, v1);
    }
  }
}

void __OSBuildVersion_block_invoke()
{
  uint64_t v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    uint64_t v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      objc_storeStrong((id *)&OSBuildVersion_build, v1);
    }
  }
}

CFTypeID __isInternalBuild_block_invoke_0()
{
  CFTypeID result = MGCopyAnswer();
  if (result)
  {
    CFBooleanRef v1 = (const __CFBoolean *)result;
    CFTypeID v2 = CFGetTypeID((CFTypeRef)result);
    CFTypeID result = CFBooleanGetTypeID();
    if (v2 == result)
    {
      CFTypeID result = CFBooleanGetValue(v1);
      isInternalBuild_internalBuild_0 = result != 0;
    }
  }
  return result;
}

NSObject *tvl_schedule_block_at_time(dispatch_time_t a1, NSObject *a2, void *a3)
{
  id v5 = a3;
  char v6 = dispatch_source_create(MEMORY[0x263EF8400], 0, 1uLL, a2);
  uint64_t v7 = v6;
  if (v6)
  {
    dispatch_source_set_timer(v6, a1, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_set_event_handler(v7, v5);
    dispatch_resume(v7);
  }

  return v7;
}

void sub_22C80D798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22C80E238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22C80E3BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22C80EB54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22C80EE70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __DeviceProductType_block_invoke_0()
{
  uint64_t v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    CFBooleanRef v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      objc_storeStrong((id *)&DeviceProductType_type_0, v1);
    }
  }
}

void __OSBuildVersion_block_invoke_0()
{
  uint64_t v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    CFBooleanRef v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      objc_storeStrong((id *)&OSBuildVersion_build_0, v1);
    }
  }
}

BOOL _TVLNetworkMonitorTypeOptionsAreEqual(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

void sub_22C81050C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  objc_destroyWeak(v27);
  objc_destroyWeak((id *)(v29 - 112));
  _Unwind_Resume(a1);
}

void sub_22C8107A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22C81119C(_Unwind_Exception *exception_object)
{
}

void sub_22C811384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_22C811908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_22C81202C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22C812BD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PriorityOfAVAudioSessionOrientation(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x263EF9170]])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:*MEMORY[0x263EF9160]])
  {
    uint64_t v2 = 1;
  }
  else if (([v1 isEqualToString:*MEMORY[0x263EF9178]] & 1) != 0 {
         || ([v1 isEqualToString:*MEMORY[0x263EF9180]] & 1) != 0)
  }
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:*MEMORY[0x263EF9168]])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:*MEMORY[0x263EF9188]])
  {
    uint64_t v2 = 4;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t softBKSHIDServicesRequestProximityDetectionMode_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[TVLRGBColorDetector _setupCaptureSession](v0);
}

void _ALSIOHIDEventCallback_cold_1()
{
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_22C7FF000, v0, OS_LOG_TYPE_FAULT, "ColorSensorVendorEventData size mismatch", v1, 2u);
}

void print_HmClData_cold_1()
{
}

void print_HmClData_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_22C7FF000, v0, v1, "HmCl Calibration - END", v2);
}

void print_HmClData_cold_3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_3_0(&dword_22C7FF000, v2, (uint64_t)v2, "nir_scaling: ", v3);
}

void print_HmClData_cold_4(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_3_0(&dword_22C7FF000, v2, (uint64_t)v2, "segment_correction: ", v3);
}

void print_HmClData_cold_5(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_3_0(&dword_22C7FF000, v2, (uint64_t)v2, "gain_scaling:\n", v3);
}

void print_HmClData_cold_6(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1 + 62;
  _os_log_debug_impl(&dword_22C7FF000, a2, OS_LOG_TYPE_DEBUG, "dut_sn: %12s", (uint8_t *)&v2, 0xCu);
}

void print_HmClData_cold_7(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1 + 18;
  _os_log_debug_impl(&dword_22C7FF000, a2, OS_LOG_TYPE_DEBUG, "cg_sn: %44s", (uint8_t *)&v2, 0xCu);
}

void print_HmClData_cold_8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22C7FF000, v0, v1, "upstreamPassFatpTest:           0x%02X\n", v2, v3, v4, v5, v6);
}

void print_HmClData_cold_9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22C7FF000, v0, v1, "device_id:                      0x%02X\n", v2, v3, v4, v5, v6);
}

void print_HmClData_cold_10()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22C7FF000, v0, v1, "chip_id:                        0x%08X\n", v2, v3, v4, v5, v6);
}

void print_HmClData_cold_11()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22C7FF000, v0, v1, "offsetCalBlobs:                 %d\n", v2, v3, v4, v5, v6);
}

void print_HmClData_cold_12()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22C7FF000, v0, v1, "numCalBlobs:                    %d\n", v2, v3, v4, v5, v6);
}

void print_HmClData_cold_13()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22C7FF000, v0, v1, "size:                           %d\n", v2, v3, v4, v5, v6);
}

void print_HmClData_cold_14(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 4);
  int v3 = *(unsigned __int8 *)(a1 + 5);
  v4[0] = 67109376;
  v4[1] = v2;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_debug_impl(&dword_22C7FF000, a2, OS_LOG_TYPE_DEBUG, "version:                        v%d.%d\n", (uint8_t *)v4, 0xEu);
}

void print_HmClData_cold_15()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_22C7FF000, v0, OS_LOG_TYPE_DEBUG, "magic:                          %c%c%c%c\n", v1, 0x1Au);
}

void print_HmClData_cold_16()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_22C7FF000, v0, v1, "HmCl Calibration - BEGIN", v2);
}

void print_HmCl_VD6287_v3_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_22C7FF000, v0, v1, "HmClv3 Calibration - END", v2);
}

void print_HmCl_VD6287_v3_cold_2(unsigned __int8 *a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  int v1 = a1[68];
  int v2 = a1[69];
  int v3 = a1[70];
  int v4 = a1[71];
  int v5 = a1[72];
  int v6 = a1[73];
  int v7 = a1[74];
  int v8 = a1[75];
  int v9 = a1[76];
  int v10 = a1[77];
  v12[0] = 67111936;
  v12[1] = v1;
  __int16 v13 = 1024;
  int v14 = v2;
  __int16 v15 = 1024;
  int v16 = v3;
  __int16 v17 = 1024;
  int v18 = v4;
  __int16 v19 = 1024;
  int v20 = v5;
  __int16 v21 = 1024;
  int v22 = v6;
  __int16 v23 = 1024;
  int v24 = v7;
  __int16 v25 = 1024;
  int v26 = v8;
  __int16 v27 = 1024;
  int v28 = v9;
  __int16 v29 = 1024;
  int v30 = v10;
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_22C7FF000, v11, OS_LOG_TYPE_DEBUG, "dut_sn = {0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x}\n", (uint8_t *)v12, 0x4Au);
}

void print_HmCl_VD6287_v3_cold_3(unsigned __int8 *a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  int v1 = a1[12];
  int v2 = a1[13];
  int v3 = a1[14];
  int v4 = a1[15];
  int v5 = a1[16];
  int v6 = a1[17];
  int v7 = a1[18];
  int v8 = a1[19];
  int v9 = a1[20];
  int v10 = a1[21];
  v12[0] = 67111936;
  v12[1] = v1;
  __int16 v13 = 1024;
  int v14 = v2;
  __int16 v15 = 1024;
  int v16 = v3;
  __int16 v17 = 1024;
  int v18 = v4;
  __int16 v19 = 1024;
  int v20 = v5;
  __int16 v21 = 1024;
  int v22 = v6;
  __int16 v23 = 1024;
  int v24 = v7;
  __int16 v25 = 1024;
  int v26 = v8;
  __int16 v27 = 1024;
  int v28 = v9;
  __int16 v29 = 1024;
  int v30 = v10;
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_22C7FF000, v11, OS_LOG_TYPE_DEBUG, "cfsn = {0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x}\n", (uint8_t *)v12, 0x4Au);
}

void print_HmCl_VD6287_v3_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22C7FF000, v0, v1, "offset_blobs = %u\n", v2, v3, v4, v5, v6);
}

void print_HmCl_VD6287_v3_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22C7FF000, v0, v1, "num_blobs = %u\n", v2, v3, v4, v5, v6);
}

void print_HmCl_VD6287_v3_cold_6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22C7FF000, v0, v1, "crc16 = %u\n", v2, v3, v4, v5, v6);
}

void print_HmCl_VD6287_v3_cold_7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22C7FF000, v0, v1, "size = %u\n", v2, v3, v4, v5, v6);
}

void print_HmCl_VD6287_v3_cold_8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22C7FF000, v0, v1, "version_minor = %u\n", v2, v3, v4, v5, v6);
}

void print_HmCl_VD6287_v3_cold_9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22C7FF000, v0, v1, "version_major = %u\n", v2, v3, v4, v5, v6);
}

void print_HmCl_VD6287_v3_cold_10()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_22C7FF000, v0, OS_LOG_TYPE_DEBUG, "magic = %c%c%c%c\n", v1, 0x1Au);
}

void print_HmCl_VD6287_v3_cold_11()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_22C7FF000, v0, v1, "HmClv3 Calibration - BEGIN\n", v2);
}

uint64_t AMFDRSealingMapCopyLocalDataForClass()
{
  return MEMORY[0x270F91F80]();
}

OSStatus AudioUnitSetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x270F0FDB0](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, inData, *(void *)&inDataSize);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
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

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x270EE7C48](sbuf);
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x270EF4310]();
}

uint64_t IOHIDEventGetDataValue()
{
  return MEMORY[0x270EF4318]();
}

uint64_t IOHIDEventGetDoubleValue()
{
  return MEMORY[0x270EF4320]();
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

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x270EF4428]();
}

uint64_t IOHIDEventSystemClientRegisterEventCallback()
{
  return MEMORY[0x270EF4450]();
}

uint64_t IOHIDEventSystemClientScheduleWithRunLoop()
{
  return MEMORY[0x270EF4478]();
}

uint64_t IOHIDEventSystemClientUnregisterEventCallback()
{
  return MEMORY[0x270EF44B0]();
}

uint64_t IOHIDEventSystemClientUnscheduleWithRunLoop()
{
  return MEMORY[0x270EF44D0]();
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EF4658](service, key);
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x270EF47B0](*(void *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x270EF49E8](*(void *)&mainPort, path);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF4A50](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x270ED9C68](a1);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return MEMORY[0x270ED9CA8](a1, *(void *)&a2, a3, *(void *)&a4, a5, *(void *)&a6, *(void *)&a7);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x270ED9EC8](*(void *)&a1, a2, a3);
}

long double ldexp(long double __x, int __e)
{
  MEMORY[0x270EDA028](*(void *)&__e, __x);
  return result;
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return (const char *)MEMORY[0x270EF8380](interface);
}

uint64_t nw_interface_get_subtype()
{
  return MEMORY[0x270EF8398]();
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return MEMORY[0x270EF83A0](interface);
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x270EF8518]();
}

void nw_parameters_set_include_peer_to_peer(nw_parameters_t parameters, BOOL include_peer_to_peer)
{
}

uint64_t nw_parameters_set_required_interface_subtype()
{
  return MEMORY[0x270EF8718]();
}

void nw_parameters_set_required_interface_type(nw_parameters_t parameters, nw_interface_type_t interface_type)
{
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x270EF87E8]();
}

void nw_path_enumerate_interfaces(nw_path_t path, nw_path_enumerate_interfaces_block_t enumerate_block)
{
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x270EF8928](path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
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

void objc_copyWeak(id *to, id *from)
{
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}