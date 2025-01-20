void sub_222D805EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double align_cropped_packed_raw10_rectangle(double a1)
{
  return (double)((unint64_t)a1 & 0xFFFFFFFFFFFFFFFCLL);
}

unint64_t stride_of_packed_raw10_minimum(double a1, double a2, double a3)
{
  return 5
       * (((unint64_t)(double)((((unint64_t)(a3 + (double)(unint64_t)a1) + 3) & 0xFFFFFFFFFFFFFFFCLL)
                                    - ((unint64_t)a1 & 0xFFFFFFFFFFFFFFFCLL))
         + 3) >> 2);
}

unint64_t stride_of_packed_raw10_for_alignment(int a1, double a2, double a3, double a4)
{
  return (5
        * (((unint64_t)(double)((((unint64_t)(a4 + (double)(unint64_t)a2) + 3) & 0xFFFFFFFFFFFFFFFCLL)
                                     - ((unint64_t)a2 & 0xFFFFFFFFFFFFFFFCLL))
          + 3) >> 2)
        + a1
        - 1)
       / a1
       * a1;
}

unint64_t size_of_minimum_cropped_packed_raw10(double a1, double a2, double a3, double a4)
{
  return (unint64_t)(a4
                          * (double)(5
                                   * (((unint64_t)(double)((((unint64_t)(a3 + (double)(unint64_t)a1)
                                                                  + 3) & 0xFFFFFFFFFFFFFFFCLL)
                                                                - ((unint64_t)a1 & 0xFFFFFFFFFFFFFFFCLL))
                                     + 3) >> 2)));
}

double crop_packed_raw10(uint64_t a1, int a2, unint64_t a3, unint64_t a4, char *__dst, double a6, double a7, double a8, double a9, uint64_t a10)
{
  unint64_t v11 = (unint64_t)a6 & 0xFFFFFFFFFFFFFFFCLL;
  double v12 = (double)v11;
  double v13 = (double)((((unint64_t)(a8 + (double)(unint64_t)a6) + 3) & 0xFFFFFFFFFFFFFFFCLL) - v11);
  unint64_t v14 = (unint64_t)a7;
  unint64_t v15 = (unint64_t)(a9 + (double)(unint64_t)a7);
  unint64_t v16 = (unint64_t)((double)(unint64_t)v12 + v13) - (unint64_t)v12;
  if (v16) {
    BOOL v17 = v14 == v15;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
    unint64_t v19 = 5 * ((unint64_t)v12 >> 2);
    if (v19 >= a4) {
      crop_packed_raw10_cold_4();
    }
    size_t v20 = 5 * (v16 >> 2);
    if (v20 + v19 > a4) {
      crop_packed_raw10_cold_1();
    }
    if (v14 >= a3) {
      crop_packed_raw10_cold_3();
    }
    if (v15 > a3) {
      crop_packed_raw10_cold_2();
    }
    if (a9 > 0.0)
    {
      v23 = (char *)(a1 + v19 + v14 * a4);
      int v24 = 1;
      do
      {
        memcpy(__dst, v23, v20);
        __dst += a10;
        double v25 = (double)v24++;
        v23 += a4;
      }
      while (a9 > v25);
    }
  }
  return v12;
}

void sub_222D82698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __LoggingStateNotificationCallback(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (__osLogTrace) {
    v10 = __osLogTrace;
  }
  else {
    v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 134219010;
    uint64_t v14 = a1;
    __int16 v15 = 2048;
    unint64_t v16 = a2;
    __int16 v17 = 2112;
    uint64_t v18 = a3;
    __int16 v19 = 2048;
    uint64_t v20 = a4;
    __int16 v21 = 2112;
    uint64_t v22 = a5;
    _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_DEBUG, "__LoggingStateNotificationCallback %p %p %@ %p %@\n", (uint8_t *)&v13, 0x34u);
  }
  unint64_t v11 = [MEMORY[0x263F2AAB8] sharedInstance];
  [v11 synchronize];

  return [a2 updateLoggingState];
}

uint64_t __AutoRetryModeNotificationCallback(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (__osLogTrace) {
    v10 = __osLogTrace;
  }
  else {
    v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 134219010;
    uint64_t v14 = a1;
    __int16 v15 = 2048;
    unint64_t v16 = a2;
    __int16 v17 = 2112;
    uint64_t v18 = a3;
    __int16 v19 = 2048;
    uint64_t v20 = a4;
    __int16 v21 = 2112;
    uint64_t v22 = a5;
    _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_DEBUG, "__AutoRetryModeNotificationCallback %p %p %@ %p %@\n", (uint8_t *)&v13, 0x34u);
  }
  unint64_t v11 = [MEMORY[0x263F2AAB8] sharedInstance];
  [v11 synchronize];

  return [a2 updateAutoRetryMode];
}

uint64_t __CombinedSequenceModeNotificationCallback(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (__osLogTrace) {
    v10 = __osLogTrace;
  }
  else {
    v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 134219010;
    uint64_t v14 = a1;
    __int16 v15 = 2048;
    unint64_t v16 = a2;
    __int16 v17 = 2112;
    uint64_t v18 = a3;
    __int16 v19 = 2048;
    uint64_t v20 = a4;
    __int16 v21 = 2112;
    uint64_t v22 = a5;
    _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_DEBUG, "__CombinedSequenceModeNotificationCallback %p %p %@ %p %@\n", (uint8_t *)&v13, 0x34u);
  }
  unint64_t v11 = [MEMORY[0x263F2AAB8] sharedInstance];
  [v11 synchronize];

  return [a2 updateCombinedSequenceMode];
}

uint64_t __CoachingHintsEnabledNotificationCallback(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (__osLogTrace) {
    v10 = __osLogTrace;
  }
  else {
    v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 134219010;
    uint64_t v14 = a1;
    __int16 v15 = 2048;
    unint64_t v16 = a2;
    __int16 v17 = 2112;
    uint64_t v18 = a3;
    __int16 v19 = 2048;
    uint64_t v20 = a4;
    __int16 v21 = 2112;
    uint64_t v22 = a5;
    _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_DEBUG, "__CoachingHintsEnabledNotificationCallback %p %p %@ %p %@\n", (uint8_t *)&v13, 0x34u);
  }
  unint64_t v11 = [MEMORY[0x263F2AAB8] sharedInstance];
  [v11 synchronize];

  return [a2 updateCoachingHintsEnabled];
}

uint64_t __EntitlementOverrideFlagsNotificationCallback(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (__osLogTrace) {
    v10 = __osLogTrace;
  }
  else {
    v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 134219010;
    uint64_t v14 = a1;
    __int16 v15 = 2048;
    unint64_t v16 = a2;
    __int16 v17 = 2112;
    uint64_t v18 = a3;
    __int16 v19 = 2048;
    uint64_t v20 = a4;
    __int16 v21 = 2112;
    uint64_t v22 = a5;
    _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_DEBUG, "__EntitlementOverrideFlagsNotificationCallback %p %p %@ %p %@\n", (uint8_t *)&v13, 0x34u);
  }
  unint64_t v11 = [MEMORY[0x263F2AAB8] sharedInstance];
  [v11 synchronize];

  return [a2 updateEntitlementOverrideFlags];
}

void __serviceMatch(void *a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a1;
  if (__osLog) {
    v4 = __osLog;
  }
  else {
    v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 134218242;
    id v6 = v3;
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEBUG, "__serviceMatch %p(%@) --> serviceMatch:\n", (uint8_t *)&v5, 0x16u);
  }
  [v3 serviceMatch:a2];
}

void sub_222D838E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __serviceStatus(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = (void *)os_transaction_create();
  uint64_t v9 = (void *)MEMORY[0x223CA8CA0]();
  id v10 = a1;
  if (__osLog) {
    unint64_t v11 = __osLog;
  }
  else {
    unint64_t v11 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134218242;
    id v13 = v10;
    __int16 v14 = 2112;
    id v15 = v10;
    _os_log_impl(&dword_222D7E000, v11, OS_LOG_TYPE_DEBUG, "__serviceStatus %p(%@) --> serviceStatus:type:inValue:\n", (uint8_t *)&v12, 0x16u);
  }
  [v10 serviceStatus:a2 type:a3 inValue:a4];
}

void __firstUnlockCallback(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = a2;
  id v3 = MEMORY[0x263EF8438];
  if (__osLog) {
    v4 = __osLog;
  }
  else {
    v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 134218242;
    uint64_t v9 = v2;
    __int16 v10 = 2112;
    unint64_t v11 = v2;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEBUG, "__firstUnlockCallback %p(%@) --> handleFirstUnlock\n", (uint8_t *)&v8, 0x16u);
  }
  int v5 = [v2 handleFirstUnlock];
  if (v5)
  {
    int v6 = v5;
    if (__osLog) {
      __int16 v7 = __osLog;
    }
    else {
      __int16 v7 = v3;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136316162;
      uint64_t v9 = "[this handleFirstUnlock] == 0 ";
      __int16 v10 = 2048;
      unint64_t v11 = (char *)v6;
      __int16 v12 = 2080;
      id v13 = &unk_222DFB9BF;
      __int16 v14 = 2080;
      id v15 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v16 = 1024;
      int v17 = 726;
      _os_log_impl(&dword_222D7E000, v7, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v8, 0x30u);
    }
  }
}

void sub_222D860B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
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

void sub_222D87938(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222D89038(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getSTActivityAttributionClass()
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getSTActivityAttributionClass_softClass;
  uint64_t v7 = getSTActivityAttributionClass_softClass;
  if (!getSTActivityAttributionClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSTActivityAttributionClass_block_invoke;
    v3[3] = &unk_26466F888;
    v3[4] = &v4;
    __getSTActivityAttributionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_222D89318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222D89918(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222D89FB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222D8A490(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222D8AF70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222D8BB00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj, id a11)
{
}

void sub_222D8C204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj, id a10)
{
}

void sub_222D8D488(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t getSensorSerialNumStringUT(char *a1, size_t a2, uint64_t a3)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  strcpy(__s, "0123456789ABCDEFGHJKLMNPQRSTUVWXYZ");
  if (!a3)
  {
    if (__osLog) {
      v38 = __osLog;
    }
    else {
      v38 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      return 261;
    }
    int v39 = 136316162;
    v40 = "serialBase";
    __int16 v41 = 2048;
    uint64_t v42 = 0;
    __int16 v43 = 2080;
    v44 = &unk_222DFB9BF;
    __int16 v45 = 2080;
    v46 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v47 = 1024;
    int v48 = 4002;
    goto LABEL_25;
  }
  if (a2 <= 0x11)
  {
    if (__osLog) {
      v38 = __osLog;
    }
    else {
      v38 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      return 261;
    }
    int v39 = 136316162;
    v40 = "sizeSN > 17";
    __int16 v41 = 2048;
    uint64_t v42 = 0;
    __int16 v43 = 2080;
    v44 = &unk_222DFB9BF;
    __int16 v45 = 2080;
    v46 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v47 = 1024;
    int v48 = 4003;
    goto LABEL_25;
  }
  unsigned int v4 = bswap32(*(_DWORD *)a3);
  int v5 = *(unsigned __int8 *)(a3 + 4);
  int v6 = *(unsigned __int8 *)(a3 + 5) << 8;
  int v7 = *(unsigned __int8 *)(a3 + 6);
  int v8 = *(unsigned __int8 *)(a3 + 7);
  int v9 = *(unsigned __int8 *)(a3 + 8) << 16;
  int v10 = *(unsigned __int8 *)(a3 + 9) << 8;
  int v11 = *(unsigned __int8 *)(a3 + 10);
  bzero(a1, a2);
  uint64_t v12 = 0;
  id v13 = &dword_222E01034;
  do
  {
    unsigned int v14 = *v13--;
    char v15 = __s[v4 / v14];
    v4 %= v14;
    a1[v12++] = v15;
  }
  while (v12 != 6);
  unsigned int v16 = v6 | (v5 << 16) | v7;
  int v17 = &dword_222E01030;
  for (uint64_t i = 6; i != 11; ++i)
  {
    unsigned int v19 = *v17--;
    char v20 = __s[v16 / v19];
    v16 %= v19;
    a1[i] = v20;
  }
  unsigned int v21 = v9 | (v8 << 24) | v10 | v11;
  uint64_t v22 = 11;
  uint64_t v23 = &dword_222E01034;
  do
  {
    unsigned int v24 = *v23--;
    char v25 = __s[v21 / v24];
    v21 %= v24;
    a1[v22++] = v25;
  }
  while (v22 != 17);
  int v26 = strlen(a1);
  int v27 = v26;
  uint64_t v28 = v26 - 1;
  if (v26 >= 2)
  {
    int v29 = 0;
    uint64_t v30 = v26;
    v31 = &a1[v28 - 1];
    uint64_t v32 = 1;
    while (1)
    {
      int v33 = *v31--;
      v34 = strchr(__s, v33);
      if (!v34) {
        break;
      }
      unsigned int v35 = v34 - __s;
      if (v32) {
        v35 *= 3;
      }
      v29 += v35;
      if (v30 == ++v32)
      {
        if (v29 % 34 < 1) {
          goto LABEL_17;
        }
        int v36 = __s[-(v29 % 34) + 34];
        goto LABEL_18;
      }
    }
    if (__osLog) {
      v38 = __osLog;
    }
    else {
      v38 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      int v39 = 136316162;
      v40 = "foundDigit";
      __int16 v41 = 2048;
      uint64_t v42 = 0;
      __int16 v43 = 2080;
      v44 = &unk_222DFB9BF;
      __int16 v45 = 2080;
      v46 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
      __int16 v47 = 1024;
      int v48 = 4044;
      goto LABEL_25;
    }
    return 261;
  }
LABEL_17:
  int v36 = 48;
LABEL_18:
  if (v36 == a1[v28])
  {
    uint64_t result = 0;
    a1[v27] = 0;
    return result;
  }
  if (__osLog) {
    v38 = __osLog;
  }
  else {
    v38 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    int v39 = 136316162;
    v40 = "(snStr[length] == checkDigit)";
    __int16 v41 = 2048;
    uint64_t v42 = 0;
    __int16 v43 = 2080;
    v44 = &unk_222DFB9BF;
    __int16 v45 = 2080;
    v46 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v47 = 1024;
    int v48 = 4059;
LABEL_25:
    _os_log_impl(&dword_222D7E000, v38, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v39, 0x30u);
  }
  return 261;
}

void sub_222D9D444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222D9F7DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a21);
  _Unwind_Resume(a1);
}

void sub_222D9FCE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj, id a16)
{
}

void sub_222DA01DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222DA13D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222DA1738(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222DA32C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222DA3A4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222DA3DBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void BKDMTerminate()
{
  v0 = (void *)__xpcListenerQueue;
  if (__xpcListenerQueue)
  {
    __xpcListenerQueue = 0;
  }
  id v1 = (void *)__xpcServer;
  if (__xpcServer)
  {
    __xpcServer = 0;
  }
  v2 = (void *)__listener;
  if (__listener)
  {
    __listener = 0;
  }
  id v3 = __osLog;
  if (__osLog)
  {
    if (os_log_type_enabled((os_log_t)__osLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v4 = 0;
      _os_log_impl(&dword_222D7E000, v3, OS_LOG_TYPE_DEFAULT, "--- biometrickitd (Pearl) ends ---\n", v4, 2u);
    }
  }
}

uint64_t BKDMInitialize()
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  os_log_t v0 = os_log_create("com.apple.BiometricKit", "Daemon-Pearl");
  id v1 = (void *)__osLog;
  __osLog = (uint64_t)v0;

  v2 = (void *)__osLog;
  if (!__osLog)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      BKDMInitialize_cold_1();
    }
    v2 = (void *)__osLog;
  }
  objc_storeStrong((id *)&__osLogTrace, v2);
  id v3 = MEMORY[0x263EF8438];
  if (__osLog) {
    unsigned int v4 = __osLog;
  }
  else {
    unsigned int v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_DEFAULT, "--- biometrickitd (Pearl) starts ---\n", (uint8_t *)&v13, 2u);
  }
  uint64_t v5 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.pearld"];
  int v6 = (void *)__listener;
  __listener = v5;

  if (!__listener)
  {
    if (__osLog) {
      uint64_t v12 = __osLog;
    }
    else {
      uint64_t v12 = v3;
    }
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    int v13 = 136316162;
    unsigned int v14 = "__listener";
    __int16 v15 = 2048;
    uint64_t v16 = 0;
    __int16 v17 = 2080;
    uint64_t v18 = &unk_222DFB9BF;
    __int16 v19 = 2080;
    char v20 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v21 = 1024;
    int v22 = 7022;
    goto LABEL_29;
  }
  uint64_t v7 = objc_opt_new();
  int v8 = (void *)__xpcServer;
  __xpcServer = v7;

  if (!__xpcServer)
  {
    if (__osLog) {
      uint64_t v12 = __osLog;
    }
    else {
      uint64_t v12 = v3;
    }
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    int v13 = 136316162;
    unsigned int v14 = "__xpcServer";
    __int16 v15 = 2048;
    uint64_t v16 = 0;
    __int16 v17 = 2080;
    uint64_t v18 = &unk_222DFB9BF;
    __int16 v19 = 2080;
    char v20 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v21 = 1024;
    int v22 = 7026;
    goto LABEL_29;
  }
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.biometrickitd.xpcListenerQueue", 0);
  int v10 = (void *)__xpcListenerQueue;
  __xpcListenerQueue = (uint64_t)v9;

  if (__xpcListenerQueue)
  {
    [(id)__listener setDelegate:__xpcServer];
    [(id)__listener _setQueue:__xpcListenerQueue];
    [(id)__listener resume];
    return 0;
  }
  if (__osLog) {
    uint64_t v12 = __osLog;
  }
  else {
    uint64_t v12 = v3;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v13 = 136316162;
    unsigned int v14 = "__xpcListenerQueue";
    __int16 v15 = 2048;
    uint64_t v16 = 0;
    __int16 v17 = 2080;
    uint64_t v18 = &unk_222DFB9BF;
    __int16 v19 = 2080;
    char v20 = "/Library/Caches/com.apple.xbs/Sources/Pearl/pearld/BiometricKitXPCServerPearl.m";
    __int16 v21 = 1024;
    int v22 = 7030;
LABEL_29:
    _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v13, 0x30u);
  }
LABEL_30:
  BKDMTerminate();
  return 22;
}

void __getSTMediaStatusDomainPublisherClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("STMediaStatusDomainPublisher");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSTMediaStatusDomainPublisherClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSTMediaStatusDomainPublisherClass_block_invoke_cold_1();
    SystemStatusLibrary();
  }
}

void SystemStatusLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!SystemStatusLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __SystemStatusLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_26466F8A8;
    uint64_t v3 = 0;
    SystemStatusLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  os_log_t v0 = (void *)v1[0];
  if (!SystemStatusLibraryCore_frameworkLibrary)
  {
    os_log_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __SystemStatusLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SystemStatusLibraryCore_frameworkLibrary = result;
  return result;
}

void __getSTActivityAttributionClass_block_invoke(uint64_t a1)
{
  SystemStatusLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("STActivityAttribution");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSTActivityAttributionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    long long v2 = (AWDBiometricKitBioLockoutEvent *)__getSTActivityAttributionClass_block_invoke_cold_1();
    [(AWDBiometricKitBioLockoutEvent *)v2 setTimestamp:v4];
  }
}

uint64_t AWDBiometricKitBioLockoutEventReadFrom(uint64_t a1, uint64_t a2)
{
  SEL v3 = (int *)MEMORY[0x263F62298];
  unint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 20) |= 2u;
        while (1)
        {
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(a2 + v26);
          if (v27 == -1 || v27 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
          *(void *)(a2 + v26) = v27 + 1;
          v25 |= (unint64_t)(v28 & 0x7F) << v23;
          if ((v28 & 0x80) == 0) {
            goto LABEL_41;
          }
          v23 += 7;
          BOOL v14 = v24++ >= 9;
          if (v14)
          {
            LODWORD(v25) = 0;
            goto LABEL_43;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_43:
        *(_DWORD *)(a1 + 16) = v25;
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_37;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_39;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_39:
        *(void *)(a1 + 8) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_222DA9D90(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222DAA23C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222DB17AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_222DB1948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_222DB2414(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222DB2BE4(_Unwind_Exception *exception_object)
{
}

uint64_t AWDBiometricKitAttentionCheckReadFrom(uint64_t a1, uint64_t a2)
{
  SEL v3 = (int *)MEMORY[0x263F62298];
  unint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 120) |= 2uLL;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_267;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_269;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_267:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_269:
          uint64_t v208 = 16;
          goto LABEL_274;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 120) |= 1uLL;
          while (2)
          {
            uint64_t v26 = *v3;
            unint64_t v27 = *(void *)(a2 + v26);
            if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
              *(void *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_273;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_273:
          uint64_t v208 = 8;
LABEL_274:
          *(void *)(a1 + v208) = v19;
          continue;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x2000uLL;
          while (2)
          {
            uint64_t v32 = *v3;
            unint64_t v33 = *(void *)(a2 + v32);
            if (v33 == -1 || v33 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
              *(void *)(a2 + v32) = v33 + 1;
              v31 |= (unint64_t)(v34 & 0x7F) << v29;
              if (v34 < 0)
              {
                v29 += 7;
                BOOL v14 = v30++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_278;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_278:
          uint64_t v209 = 68;
          goto LABEL_403;
        case 4u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x200uLL;
          while (2)
          {
            uint64_t v37 = *v3;
            unint64_t v38 = *(void *)(a2 + v37);
            if (v38 == -1 || v38 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v39 = *(unsigned char *)(*(void *)(a2 + *v7) + v38);
              *(void *)(a2 + v37) = v38 + 1;
              v31 |= (unint64_t)(v39 & 0x7F) << v35;
              if (v39 < 0)
              {
                v35 += 7;
                BOOL v14 = v36++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_282;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_282:
          uint64_t v209 = 52;
          goto LABEL_403;
        case 5u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x800uLL;
          while (2)
          {
            uint64_t v42 = *v3;
            unint64_t v43 = *(void *)(a2 + v42);
            if (v43 == -1 || v43 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v43);
              *(void *)(a2 + v42) = v43 + 1;
              v31 |= (unint64_t)(v44 & 0x7F) << v40;
              if (v44 < 0)
              {
                v40 += 7;
                BOOL v14 = v41++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_286;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_286:
          uint64_t v209 = 60;
          goto LABEL_403;
        case 6u:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x1000uLL;
          while (2)
          {
            uint64_t v47 = *v3;
            unint64_t v48 = *(void *)(a2 + v47);
            if (v48 == -1 || v48 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
              *(void *)(a2 + v47) = v48 + 1;
              v31 |= (unint64_t)(v49 & 0x7F) << v45;
              if (v49 < 0)
              {
                v45 += 7;
                BOOL v14 = v46++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_290;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_290:
          uint64_t v209 = 64;
          goto LABEL_403;
        case 7u:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x400uLL;
          while (2)
          {
            uint64_t v52 = *v3;
            unint64_t v53 = *(void *)(a2 + v52);
            if (v53 == -1 || v53 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v54 = *(unsigned char *)(*(void *)(a2 + *v7) + v53);
              *(void *)(a2 + v52) = v53 + 1;
              v31 |= (unint64_t)(v54 & 0x7F) << v50;
              if (v54 < 0)
              {
                v50 += 7;
                BOOL v14 = v51++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_294;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_294:
          uint64_t v209 = 56;
          goto LABEL_403;
        case 8u:
          char v55 = 0;
          unsigned int v56 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 4uLL;
          while (2)
          {
            uint64_t v57 = *v3;
            unint64_t v58 = *(void *)(a2 + v57);
            if (v58 == -1 || v58 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v59 = *(unsigned char *)(*(void *)(a2 + *v7) + v58);
              *(void *)(a2 + v57) = v58 + 1;
              v31 |= (unint64_t)(v59 & 0x7F) << v55;
              if (v59 < 0)
              {
                v55 += 7;
                BOOL v14 = v56++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_298;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_298:
          uint64_t v209 = 24;
          goto LABEL_403;
        case 9u:
          char v60 = 0;
          unsigned int v61 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x80uLL;
          while (2)
          {
            uint64_t v62 = *v3;
            unint64_t v63 = *(void *)(a2 + v62);
            if (v63 == -1 || v63 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v64 = *(unsigned char *)(*(void *)(a2 + *v7) + v63);
              *(void *)(a2 + v62) = v63 + 1;
              v31 |= (unint64_t)(v64 & 0x7F) << v60;
              if (v64 < 0)
              {
                v60 += 7;
                BOOL v14 = v61++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_302;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_302:
          uint64_t v209 = 44;
          goto LABEL_403;
        case 0xAu:
          char v65 = 0;
          unsigned int v66 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x200000uLL;
          while (2)
          {
            uint64_t v67 = *v3;
            unint64_t v68 = *(void *)(a2 + v67);
            if (v68 == -1 || v68 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v69 = *(unsigned char *)(*(void *)(a2 + *v7) + v68);
              *(void *)(a2 + v67) = v68 + 1;
              v31 |= (unint64_t)(v69 & 0x7F) << v65;
              if (v69 < 0)
              {
                v65 += 7;
                BOOL v14 = v66++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_306;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_306:
          uint64_t v209 = 100;
          goto LABEL_403;
        case 0xBu:
          char v70 = 0;
          unsigned int v71 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x4000uLL;
          while (2)
          {
            uint64_t v72 = *v3;
            unint64_t v73 = *(void *)(a2 + v72);
            if (v73 == -1 || v73 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v74 = *(unsigned char *)(*(void *)(a2 + *v7) + v73);
              *(void *)(a2 + v72) = v73 + 1;
              v31 |= (unint64_t)(v74 & 0x7F) << v70;
              if (v74 < 0)
              {
                v70 += 7;
                BOOL v14 = v71++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_310;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_310:
          uint64_t v209 = 72;
          goto LABEL_403;
        case 0xCu:
          char v75 = 0;
          unsigned int v76 = 0;
          uint64_t v77 = 0;
          *(void *)(a1 + 120) |= 0x400000000uLL;
          while (2)
          {
            uint64_t v78 = *v3;
            unint64_t v79 = *(void *)(a2 + v78);
            if (v79 == -1 || v79 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v80 = *(unsigned char *)(*(void *)(a2 + *v7) + v79);
              *(void *)(a2 + v78) = v79 + 1;
              v77 |= (unint64_t)(v80 & 0x7F) << v75;
              if (v80 < 0)
              {
                v75 += 7;
                BOOL v14 = v76++ >= 9;
                if (v14)
                {
                  uint64_t v77 = 0;
                  goto LABEL_314;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v77 = 0;
          }
LABEL_314:
          BOOL v210 = v77 != 0;
          uint64_t v211 = 116;
          goto LABEL_408;
        case 0xDu:
          char v81 = 0;
          unsigned int v82 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x20uLL;
          while (2)
          {
            uint64_t v83 = *v3;
            unint64_t v84 = *(void *)(a2 + v83);
            if (v84 == -1 || v84 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v85 = *(unsigned char *)(*(void *)(a2 + *v7) + v84);
              *(void *)(a2 + v83) = v84 + 1;
              v31 |= (unint64_t)(v85 & 0x7F) << v81;
              if (v85 < 0)
              {
                v81 += 7;
                BOOL v14 = v82++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_318;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_318:
          uint64_t v209 = 36;
          goto LABEL_403;
        case 0xEu:
          char v86 = 0;
          unsigned int v87 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x40uLL;
          while (2)
          {
            uint64_t v88 = *v3;
            unint64_t v89 = *(void *)(a2 + v88);
            if (v89 == -1 || v89 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v90 = *(unsigned char *)(*(void *)(a2 + *v7) + v89);
              *(void *)(a2 + v88) = v89 + 1;
              v31 |= (unint64_t)(v90 & 0x7F) << v86;
              if (v90 < 0)
              {
                v86 += 7;
                BOOL v14 = v87++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_322;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_322:
          uint64_t v209 = 40;
          goto LABEL_403;
        case 0xFu:
          char v91 = 0;
          unsigned int v92 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x10uLL;
          while (2)
          {
            uint64_t v93 = *v3;
            unint64_t v94 = *(void *)(a2 + v93);
            if (v94 == -1 || v94 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v95 = *(unsigned char *)(*(void *)(a2 + *v7) + v94);
              *(void *)(a2 + v93) = v94 + 1;
              v31 |= (unint64_t)(v95 & 0x7F) << v91;
              if (v95 < 0)
              {
                v91 += 7;
                BOOL v14 = v92++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_326;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_326:
          uint64_t v209 = 32;
          goto LABEL_403;
        case 0x10u:
          char v96 = 0;
          unsigned int v97 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 8uLL;
          while (2)
          {
            uint64_t v98 = *v3;
            unint64_t v99 = *(void *)(a2 + v98);
            if (v99 == -1 || v99 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v100 = *(unsigned char *)(*(void *)(a2 + *v7) + v99);
              *(void *)(a2 + v98) = v99 + 1;
              v31 |= (unint64_t)(v100 & 0x7F) << v96;
              if (v100 < 0)
              {
                v96 += 7;
                BOOL v14 = v97++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_330;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_330:
          uint64_t v209 = 28;
          goto LABEL_403;
        case 0x11u:
          char v101 = 0;
          unsigned int v102 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x100000uLL;
          while (2)
          {
            uint64_t v103 = *v3;
            unint64_t v104 = *(void *)(a2 + v103);
            if (v104 == -1 || v104 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v105 = *(unsigned char *)(*(void *)(a2 + *v7) + v104);
              *(void *)(a2 + v103) = v104 + 1;
              v31 |= (unint64_t)(v105 & 0x7F) << v101;
              if (v105 < 0)
              {
                v101 += 7;
                BOOL v14 = v102++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_334;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_334:
          uint64_t v209 = 96;
          goto LABEL_403;
        case 0x12u:
          char v106 = 0;
          unsigned int v107 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x80000uLL;
          while (2)
          {
            uint64_t v108 = *v3;
            unint64_t v109 = *(void *)(a2 + v108);
            if (v109 == -1 || v109 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v110 = *(unsigned char *)(*(void *)(a2 + *v7) + v109);
              *(void *)(a2 + v108) = v109 + 1;
              v31 |= (unint64_t)(v110 & 0x7F) << v106;
              if (v110 < 0)
              {
                v106 += 7;
                BOOL v14 = v107++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_338;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_338:
          uint64_t v209 = 92;
          goto LABEL_403;
        case 0x13u:
          char v111 = 0;
          unsigned int v112 = 0;
          uint64_t v113 = 0;
          *(void *)(a1 + 120) |= 0x200000000uLL;
          while (2)
          {
            uint64_t v114 = *v3;
            unint64_t v115 = *(void *)(a2 + v114);
            if (v115 == -1 || v115 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v116 = *(unsigned char *)(*(void *)(a2 + *v7) + v115);
              *(void *)(a2 + v114) = v115 + 1;
              v113 |= (unint64_t)(v116 & 0x7F) << v111;
              if (v116 < 0)
              {
                v111 += 7;
                BOOL v14 = v112++ >= 9;
                if (v14)
                {
                  uint64_t v113 = 0;
                  goto LABEL_342;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v113 = 0;
          }
LABEL_342:
          BOOL v210 = v113 != 0;
          uint64_t v211 = 115;
          goto LABEL_408;
        case 0x14u:
          char v117 = 0;
          unsigned int v118 = 0;
          uint64_t v119 = 0;
          *(void *)(a1 + 120) |= 0x400000uLL;
          while (2)
          {
            uint64_t v120 = *v3;
            unint64_t v121 = *(void *)(a2 + v120);
            if (v121 == -1 || v121 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v122 = *(unsigned char *)(*(void *)(a2 + *v7) + v121);
              *(void *)(a2 + v120) = v121 + 1;
              v119 |= (unint64_t)(v122 & 0x7F) << v117;
              if (v122 < 0)
              {
                v117 += 7;
                BOOL v14 = v118++ >= 9;
                if (v14)
                {
                  uint64_t v119 = 0;
                  goto LABEL_346;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v119 = 0;
          }
LABEL_346:
          BOOL v210 = v119 != 0;
          uint64_t v211 = 104;
          goto LABEL_408;
        case 0x15u:
          char v123 = 0;
          unsigned int v124 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x100uLL;
          while (2)
          {
            uint64_t v125 = *v3;
            unint64_t v126 = *(void *)(a2 + v125);
            if (v126 == -1 || v126 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v127 = *(unsigned char *)(*(void *)(a2 + *v7) + v126);
              *(void *)(a2 + v125) = v126 + 1;
              v31 |= (unint64_t)(v127 & 0x7F) << v123;
              if (v127 < 0)
              {
                v123 += 7;
                BOOL v14 = v124++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_350;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_350:
          uint64_t v209 = 48;
          goto LABEL_403;
        case 0x16u:
          char v128 = 0;
          unsigned int v129 = 0;
          uint64_t v130 = 0;
          *(void *)(a1 + 120) |= 0x10000000uLL;
          while (2)
          {
            uint64_t v131 = *v3;
            unint64_t v132 = *(void *)(a2 + v131);
            if (v132 == -1 || v132 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v133 = *(unsigned char *)(*(void *)(a2 + *v7) + v132);
              *(void *)(a2 + v131) = v132 + 1;
              v130 |= (unint64_t)(v133 & 0x7F) << v128;
              if (v133 < 0)
              {
                v128 += 7;
                BOOL v14 = v129++ >= 9;
                if (v14)
                {
                  uint64_t v130 = 0;
                  goto LABEL_354;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v130 = 0;
          }
LABEL_354:
          BOOL v210 = v130 != 0;
          uint64_t v211 = 110;
          goto LABEL_408;
        case 0x17u:
          char v134 = 0;
          unsigned int v135 = 0;
          uint64_t v136 = 0;
          *(void *)(a1 + 120) |= 0x2000000uLL;
          while (2)
          {
            uint64_t v137 = *v3;
            unint64_t v138 = *(void *)(a2 + v137);
            if (v138 == -1 || v138 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v139 = *(unsigned char *)(*(void *)(a2 + *v7) + v138);
              *(void *)(a2 + v137) = v138 + 1;
              v136 |= (unint64_t)(v139 & 0x7F) << v134;
              if (v139 < 0)
              {
                v134 += 7;
                BOOL v14 = v135++ >= 9;
                if (v14)
                {
                  uint64_t v136 = 0;
                  goto LABEL_358;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v136 = 0;
          }
LABEL_358:
          BOOL v210 = v136 != 0;
          uint64_t v211 = 107;
          goto LABEL_408;
        case 0x18u:
          char v140 = 0;
          unsigned int v141 = 0;
          uint64_t v142 = 0;
          *(void *)(a1 + 120) |= 0x4000000uLL;
          while (2)
          {
            uint64_t v143 = *v3;
            unint64_t v144 = *(void *)(a2 + v143);
            if (v144 == -1 || v144 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v145 = *(unsigned char *)(*(void *)(a2 + *v7) + v144);
              *(void *)(a2 + v143) = v144 + 1;
              v142 |= (unint64_t)(v145 & 0x7F) << v140;
              if (v145 < 0)
              {
                v140 += 7;
                BOOL v14 = v141++ >= 9;
                if (v14)
                {
                  uint64_t v142 = 0;
                  goto LABEL_362;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v142 = 0;
          }
LABEL_362:
          BOOL v210 = v142 != 0;
          uint64_t v211 = 108;
          goto LABEL_408;
        case 0x19u:
          char v146 = 0;
          unsigned int v147 = 0;
          uint64_t v148 = 0;
          *(void *)(a1 + 120) |= 0x100000000uLL;
          while (2)
          {
            uint64_t v149 = *v3;
            unint64_t v150 = *(void *)(a2 + v149);
            if (v150 == -1 || v150 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v151 = *(unsigned char *)(*(void *)(a2 + *v7) + v150);
              *(void *)(a2 + v149) = v150 + 1;
              v148 |= (unint64_t)(v151 & 0x7F) << v146;
              if (v151 < 0)
              {
                v146 += 7;
                BOOL v14 = v147++ >= 9;
                if (v14)
                {
                  uint64_t v148 = 0;
                  goto LABEL_366;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v148 = 0;
          }
LABEL_366:
          BOOL v210 = v148 != 0;
          uint64_t v211 = 114;
          goto LABEL_408;
        case 0x1Au:
          char v152 = 0;
          unsigned int v153 = 0;
          uint64_t v154 = 0;
          *(void *)(a1 + 120) |= 0x8000000uLL;
          while (2)
          {
            uint64_t v155 = *v3;
            unint64_t v156 = *(void *)(a2 + v155);
            if (v156 == -1 || v156 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v157 = *(unsigned char *)(*(void *)(a2 + *v7) + v156);
              *(void *)(a2 + v155) = v156 + 1;
              v154 |= (unint64_t)(v157 & 0x7F) << v152;
              if (v157 < 0)
              {
                v152 += 7;
                BOOL v14 = v153++ >= 9;
                if (v14)
                {
                  uint64_t v154 = 0;
                  goto LABEL_370;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v154 = 0;
          }
LABEL_370:
          BOOL v210 = v154 != 0;
          uint64_t v211 = 109;
          goto LABEL_408;
        case 0x1Bu:
          char v158 = 0;
          unsigned int v159 = 0;
          uint64_t v160 = 0;
          *(void *)(a1 + 120) |= 0x1000000uLL;
          while (2)
          {
            uint64_t v161 = *v3;
            unint64_t v162 = *(void *)(a2 + v161);
            if (v162 == -1 || v162 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v163 = *(unsigned char *)(*(void *)(a2 + *v7) + v162);
              *(void *)(a2 + v161) = v162 + 1;
              v160 |= (unint64_t)(v163 & 0x7F) << v158;
              if (v163 < 0)
              {
                v158 += 7;
                BOOL v14 = v159++ >= 9;
                if (v14)
                {
                  uint64_t v160 = 0;
                  goto LABEL_374;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v160 = 0;
          }
LABEL_374:
          BOOL v210 = v160 != 0;
          uint64_t v211 = 106;
          goto LABEL_408;
        case 0x1Cu:
          char v164 = 0;
          unsigned int v165 = 0;
          uint64_t v166 = 0;
          *(void *)(a1 + 120) |= 0x800000uLL;
          while (2)
          {
            uint64_t v167 = *v3;
            unint64_t v168 = *(void *)(a2 + v167);
            if (v168 == -1 || v168 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v169 = *(unsigned char *)(*(void *)(a2 + *v7) + v168);
              *(void *)(a2 + v167) = v168 + 1;
              v166 |= (unint64_t)(v169 & 0x7F) << v164;
              if (v169 < 0)
              {
                v164 += 7;
                BOOL v14 = v165++ >= 9;
                if (v14)
                {
                  uint64_t v166 = 0;
                  goto LABEL_378;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v166 = 0;
          }
LABEL_378:
          BOOL v210 = v166 != 0;
          uint64_t v211 = 105;
          goto LABEL_408;
        case 0x1Du:
          char v170 = 0;
          unsigned int v171 = 0;
          uint64_t v172 = 0;
          *(void *)(a1 + 120) |= 0x40000000uLL;
          while (2)
          {
            uint64_t v173 = *v3;
            unint64_t v174 = *(void *)(a2 + v173);
            if (v174 == -1 || v174 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v175 = *(unsigned char *)(*(void *)(a2 + *v7) + v174);
              *(void *)(a2 + v173) = v174 + 1;
              v172 |= (unint64_t)(v175 & 0x7F) << v170;
              if (v175 < 0)
              {
                v170 += 7;
                BOOL v14 = v171++ >= 9;
                if (v14)
                {
                  uint64_t v172 = 0;
                  goto LABEL_382;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v172 = 0;
          }
LABEL_382:
          BOOL v210 = v172 != 0;
          uint64_t v211 = 112;
          goto LABEL_408;
        case 0x1Eu:
          char v176 = 0;
          unsigned int v177 = 0;
          uint64_t v178 = 0;
          *(void *)(a1 + 120) |= 0x80000000uLL;
          while (2)
          {
            uint64_t v179 = *v3;
            unint64_t v180 = *(void *)(a2 + v179);
            if (v180 == -1 || v180 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v181 = *(unsigned char *)(*(void *)(a2 + *v7) + v180);
              *(void *)(a2 + v179) = v180 + 1;
              v178 |= (unint64_t)(v181 & 0x7F) << v176;
              if (v181 < 0)
              {
                v176 += 7;
                BOOL v14 = v177++ >= 9;
                if (v14)
                {
                  uint64_t v178 = 0;
                  goto LABEL_386;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v178 = 0;
          }
LABEL_386:
          BOOL v210 = v178 != 0;
          uint64_t v211 = 113;
          goto LABEL_408;
        case 0x1Fu:
          char v182 = 0;
          unsigned int v183 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x8000uLL;
          while (2)
          {
            uint64_t v184 = *v3;
            unint64_t v185 = *(void *)(a2 + v184);
            if (v185 == -1 || v185 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v186 = *(unsigned char *)(*(void *)(a2 + *v7) + v185);
              *(void *)(a2 + v184) = v185 + 1;
              v31 |= (unint64_t)(v186 & 0x7F) << v182;
              if (v186 < 0)
              {
                v182 += 7;
                BOOL v14 = v183++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_390;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_390:
          uint64_t v209 = 76;
          goto LABEL_403;
        case 0x20u:
          char v187 = 0;
          unsigned int v188 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x10000uLL;
          while (2)
          {
            uint64_t v189 = *v3;
            unint64_t v190 = *(void *)(a2 + v189);
            if (v190 == -1 || v190 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v191 = *(unsigned char *)(*(void *)(a2 + *v7) + v190);
              *(void *)(a2 + v189) = v190 + 1;
              v31 |= (unint64_t)(v191 & 0x7F) << v187;
              if (v191 < 0)
              {
                v187 += 7;
                BOOL v14 = v188++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_394;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_394:
          uint64_t v209 = 80;
          goto LABEL_403;
        case 0x21u:
          char v192 = 0;
          unsigned int v193 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x40000uLL;
          while (2)
          {
            uint64_t v194 = *v3;
            unint64_t v195 = *(void *)(a2 + v194);
            if (v195 == -1 || v195 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v196 = *(unsigned char *)(*(void *)(a2 + *v7) + v195);
              *(void *)(a2 + v194) = v195 + 1;
              v31 |= (unint64_t)(v196 & 0x7F) << v192;
              if (v196 < 0)
              {
                v192 += 7;
                BOOL v14 = v193++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_398;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_398:
          uint64_t v209 = 88;
          goto LABEL_403;
        case 0x22u:
          char v197 = 0;
          unsigned int v198 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x20000uLL;
          while (2)
          {
            uint64_t v199 = *v3;
            unint64_t v200 = *(void *)(a2 + v199);
            if (v200 == -1 || v200 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v201 = *(unsigned char *)(*(void *)(a2 + *v7) + v200);
              *(void *)(a2 + v199) = v200 + 1;
              v31 |= (unint64_t)(v201 & 0x7F) << v197;
              if (v201 < 0)
              {
                v197 += 7;
                BOOL v14 = v198++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_402;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_402:
          uint64_t v209 = 84;
LABEL_403:
          *(_DWORD *)(a1 + v209) = v31;
          continue;
        case 0x23u:
          char v202 = 0;
          unsigned int v203 = 0;
          uint64_t v204 = 0;
          *(void *)(a1 + 120) |= 0x20000000uLL;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v205 = *v3;
        unint64_t v206 = *(void *)(a2 + v205);
        if (v206 == -1 || v206 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v207 = *(unsigned char *)(*(void *)(a2 + *v7) + v206);
        *(void *)(a2 + v205) = v206 + 1;
        v204 |= (unint64_t)(v207 & 0x7F) << v202;
        if ((v207 & 0x80) == 0) {
          goto LABEL_405;
        }
        v202 += 7;
        BOOL v14 = v203++ >= 9;
        if (v14)
        {
          uint64_t v204 = 0;
          goto LABEL_407;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_405:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v204 = 0;
      }
LABEL_407:
      BOOL v210 = v204 != 0;
      uint64_t v211 = 111;
LABEL_408:
      *(unsigned char *)(a1 + v211) = v210;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t AWDBiometricKitPassCodeChallengeAttemptReadFrom(uint64_t a1, uint64_t a2)
{
  SEL v3 = (int *)MEMORY[0x263F62298];
  unint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = &OBJC_IVAR___PearlCoreAnalyticsDailyTemplateMatchCountsEvent__identity0BaseTemplateFeatureCountType1;
    char v8 = &OBJC_IVAR___PearlCoreAnalyticsDailyTemplateMatchCountsEvent__identity0BaseTemplateFeatureCountType1;
    unsigned int v9 = (int *)MEMORY[0x263F62268];
    unint64_t v10 = &OBJC_IVAR___PearlCoreAnalyticsDailyTemplateMatchCountsEvent__identity0BaseTemplateFeatureCountType1;
    uint64_t v11 = &OBJC_IVAR___PearlCoreAnalyticsDailyTemplateMatchCountsEvent__identity0BaseTemplateFeatureCountType1;
    unint64_t v12 = &OBJC_IVAR___PearlCoreAnalyticsDailyTemplateMatchCountsEvent__identity0BaseTemplateFeatureCountType1;
    char v13 = &OBJC_IVAR___PearlCoreAnalyticsDailyTemplateMatchCountsEvent__identity0BaseTemplateFeatureCountType1;
    BOOL v14 = &OBJC_IVAR___PearlCoreAnalyticsDailyTemplateMatchCountsEvent__identity0BaseTemplateFeatureCountType1;
    int v15 = &OBJC_IVAR___PearlCoreAnalyticsDailyTemplateMatchCountsEvent__identity0BaseTemplateFeatureCountType1;
    uint64_t v16 = &OBJC_IVAR___PearlCoreAnalyticsDailyTemplateMatchCountsEvent__identity0BaseTemplateFeatureCountType1;
    char v17 = &OBJC_IVAR___PearlCoreAnalyticsDailyTemplateMatchCountsEvent__identity0BaseTemplateFeatureCountType1;
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v18 = 0;
      unsigned int v19 = 0;
      unint64_t v20 = 0;
      while (1)
      {
        uint64_t v21 = *v3;
        unint64_t v22 = *(void *)(a2 + v21);
        if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v23 = *(unsigned char *)(*(void *)(a2 + *v9) + v22);
        *(void *)(a2 + v21) = v22 + 1;
        v20 |= (unint64_t)(v23 & 0x7F) << v18;
        if ((v23 & 0x80) == 0) {
          goto LABEL_12;
        }
        v18 += 7;
        BOOL v24 = v19++ >= 9;
        if (v24)
        {
          unint64_t v20 = 0;
          int v25 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v25 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v20 = 0;
      }
LABEL_14:
      if (v25 || (v20 & 7) == 4) {
        break;
      }
      switch((v20 >> 3))
      {
        case 1u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          *(_WORD *)(a1 + v7[85]) |= 2u;
          while (1)
          {
            uint64_t v30 = *v3;
            unint64_t v31 = *(void *)(a2 + v30);
            if (v31 == -1 || v31 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v32 = *(unsigned char *)(*(void *)(a2 + *v9) + v31);
            *(void *)(a2 + v30) = v31 + 1;
            v29 |= (unint64_t)(v32 & 0x7F) << v27;
            if ((v32 & 0x80) == 0) {
              goto LABEL_120;
            }
            v27 += 7;
            BOOL v24 = v28++ >= 9;
            if (v24)
            {
              uint64_t v29 = 0;
              goto LABEL_122;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_120:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v29 = 0;
          }
LABEL_122:
          uint64_t v108 = v8[86];
          goto LABEL_127;
        case 2u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v29 = 0;
          *(_WORD *)(a1 + v7[85]) |= 1u;
          while (2)
          {
            uint64_t v41 = *v3;
            unint64_t v42 = *(void *)(a2 + v41);
            if (v42 == -1 || v42 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)(a2 + *v9) + v42);
              *(void *)(a2 + v41) = v42 + 1;
              v29 |= (unint64_t)(v43 & 0x7F) << v39;
              if (v43 < 0)
              {
                v39 += 7;
                BOOL v24 = v40++ >= 9;
                if (v24)
                {
                  uint64_t v29 = 0;
                  goto LABEL_126;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v29 = 0;
          }
LABEL_126:
          uint64_t v108 = v10[87];
LABEL_127:
          *(void *)(a1 + v108) = v29;
          continue;
        case 3u:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v46 = 0;
          *(_WORD *)(a1 + v7[85]) |= 0x1000u;
          while (2)
          {
            uint64_t v47 = *v3;
            unint64_t v48 = *(void *)(a2 + v47);
            if (v48 == -1 || v48 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v49 = *(unsigned char *)(*(void *)(a2 + *v9) + v48);
              *(void *)(a2 + v47) = v48 + 1;
              v46 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                BOOL v24 = v45++ >= 9;
                if (v24)
                {
                  uint64_t v46 = 0;
                  goto LABEL_131;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v46 = 0;
          }
LABEL_131:
          BOOL v109 = v46 != 0;
          uint64_t v110 = v11[88];
          goto LABEL_156;
        case 4u:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v52 = 0;
          *(_WORD *)(a1 + v7[85]) |= 0x2000u;
          while (2)
          {
            uint64_t v53 = *v3;
            unint64_t v54 = *(void *)(a2 + v53);
            if (v54 == -1 || v54 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v55 = *(unsigned char *)(*(void *)(a2 + *v9) + v54);
              *(void *)(a2 + v53) = v54 + 1;
              v52 |= (unint64_t)(v55 & 0x7F) << v50;
              if (v55 < 0)
              {
                v50 += 7;
                BOOL v24 = v51++ >= 9;
                if (v24)
                {
                  uint64_t v52 = 0;
                  goto LABEL_135;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v52 = 0;
          }
LABEL_135:
          BOOL v109 = v52 != 0;
          uint64_t v110 = v12[89];
          goto LABEL_156;
        case 5u:
          char v56 = 0;
          unsigned int v57 = 0;
          uint64_t v58 = 0;
          *(_WORD *)(a1 + v7[85]) |= 4u;
          while (2)
          {
            uint64_t v59 = *v3;
            unint64_t v60 = *(void *)(a2 + v59);
            if (v60 == -1 || v60 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v61 = *(unsigned char *)(*(void *)(a2 + *v9) + v60);
              *(void *)(a2 + v59) = v60 + 1;
              v58 |= (unint64_t)(v61 & 0x7F) << v56;
              if (v61 < 0)
              {
                v56 += 7;
                BOOL v24 = v57++ >= 9;
                if (v24)
                {
                  LODWORD(v58) = 0;
                  goto LABEL_139;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v58) = 0;
          }
LABEL_139:
          uint64_t v111 = v13[90];
          goto LABEL_177;
        case 6u:
          char v62 = 0;
          unsigned int v63 = 0;
          uint64_t v58 = 0;
          *(_WORD *)(a1 + v7[85]) |= 0x400u;
          while (2)
          {
            uint64_t v64 = *v3;
            unint64_t v65 = *(void *)(a2 + v64);
            if (v65 == -1 || v65 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v66 = *(unsigned char *)(*(void *)(a2 + *v9) + v65);
              *(void *)(a2 + v64) = v65 + 1;
              v58 |= (unint64_t)(v66 & 0x7F) << v62;
              if (v66 < 0)
              {
                v62 += 7;
                BOOL v24 = v63++ >= 9;
                if (v24)
                {
                  LODWORD(v58) = 0;
                  goto LABEL_143;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v58) = 0;
          }
LABEL_143:
          uint64_t v111 = v14[91];
          goto LABEL_177;
        case 7u:
          char v67 = 0;
          unsigned int v68 = 0;
          uint64_t v58 = 0;
          *(_WORD *)(a1 + v7[85]) |= 0x20u;
          while (2)
          {
            uint64_t v69 = *v3;
            unint64_t v70 = *(void *)(a2 + v69);
            if (v70 == -1 || v70 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v71 = *(unsigned char *)(*(void *)(a2 + *v9) + v70);
              *(void *)(a2 + v69) = v70 + 1;
              v58 |= (unint64_t)(v71 & 0x7F) << v67;
              if (v71 < 0)
              {
                v67 += 7;
                BOOL v24 = v68++ >= 9;
                if (v24)
                {
                  LODWORD(v58) = 0;
                  goto LABEL_147;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v58) = 0;
          }
LABEL_147:
          uint64_t v111 = v15[92];
          goto LABEL_177;
        case 8u:
          char v72 = 0;
          unsigned int v73 = 0;
          uint64_t v58 = 0;
          *(_WORD *)(a1 + v7[85]) |= 8u;
          while (2)
          {
            uint64_t v74 = *v3;
            unint64_t v75 = *(void *)(a2 + v74);
            if (v75 == -1 || v75 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v76 = *(unsigned char *)(*(void *)(a2 + *v9) + v75);
              *(void *)(a2 + v74) = v75 + 1;
              v58 |= (unint64_t)(v76 & 0x7F) << v72;
              if (v76 < 0)
              {
                v72 += 7;
                BOOL v24 = v73++ >= 9;
                if (v24)
                {
                  LODWORD(v58) = 0;
                  goto LABEL_151;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v58) = 0;
          }
LABEL_151:
          uint64_t v111 = v16[93];
          goto LABEL_177;
        case 9u:
          char v77 = 0;
          unsigned int v78 = 0;
          uint64_t v79 = 0;
          *(_WORD *)(a1 + v7[85]) |= 0x800u;
          while (2)
          {
            uint64_t v80 = *v3;
            unint64_t v81 = *(void *)(a2 + v80);
            if (v81 == -1 || v81 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v82 = *(unsigned char *)(*(void *)(a2 + *v9) + v81);
              *(void *)(a2 + v80) = v81 + 1;
              v79 |= (unint64_t)(v82 & 0x7F) << v77;
              if (v82 < 0)
              {
                v77 += 7;
                BOOL v24 = v78++ >= 9;
                if (v24)
                {
                  uint64_t v79 = 0;
                  goto LABEL_155;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v79 = 0;
          }
LABEL_155:
          BOOL v109 = v79 != 0;
          uint64_t v110 = v17[94];
LABEL_156:
          *(unsigned char *)(a1 + v110) = v109;
          continue;
        case 0xAu:
          char v83 = 0;
          unsigned int v84 = 0;
          uint64_t v58 = 0;
          *(_WORD *)(a1 + v7[85]) |= 0x200u;
          while (2)
          {
            uint64_t v85 = *v3;
            unint64_t v86 = *(void *)(a2 + v85);
            if (v86 == -1 || v86 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v87 = *(unsigned char *)(*(void *)(a2 + *v9) + v86);
              *(void *)(a2 + v85) = v86 + 1;
              v58 |= (unint64_t)(v87 & 0x7F) << v83;
              if (v87 < 0)
              {
                v83 += 7;
                BOOL v24 = v84++ >= 9;
                if (v24)
                {
                  LODWORD(v58) = 0;
                  goto LABEL_160;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v58) = 0;
          }
LABEL_160:
          uint64_t v111 = 52;
          goto LABEL_177;
        case 0xBu:
          char v88 = 0;
          unsigned int v89 = 0;
          uint64_t v58 = 0;
          *(_WORD *)(a1 + v7[85]) |= 0x100u;
          while (2)
          {
            uint64_t v90 = *v3;
            unint64_t v91 = *(void *)(a2 + v90);
            if (v91 == -1 || v91 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v92 = *(unsigned char *)(*(void *)(a2 + *v9) + v91);
              *(void *)(a2 + v90) = v91 + 1;
              v58 |= (unint64_t)(v92 & 0x7F) << v88;
              if (v92 < 0)
              {
                v88 += 7;
                BOOL v24 = v89++ >= 9;
                if (v24)
                {
                  LODWORD(v58) = 0;
                  goto LABEL_164;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v58) = 0;
          }
LABEL_164:
          uint64_t v111 = 48;
          goto LABEL_177;
        case 0xCu:
          char v93 = 0;
          unsigned int v94 = 0;
          uint64_t v58 = 0;
          *(_WORD *)(a1 + v7[85]) |= 0x10u;
          while (2)
          {
            uint64_t v95 = *v3;
            unint64_t v96 = *(void *)(a2 + v95);
            if (v96 == -1 || v96 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v97 = *(unsigned char *)(*(void *)(a2 + *v9) + v96);
              *(void *)(a2 + v95) = v96 + 1;
              v58 |= (unint64_t)(v97 & 0x7F) << v93;
              if (v97 < 0)
              {
                v93 += 7;
                BOOL v24 = v94++ >= 9;
                if (v24)
                {
                  LODWORD(v58) = 0;
                  goto LABEL_168;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v58) = 0;
          }
LABEL_168:
          uint64_t v111 = 32;
          goto LABEL_177;
        case 0xDu:
          char v98 = 0;
          unsigned int v99 = 0;
          uint64_t v58 = 0;
          *(_WORD *)(a1 + v7[85]) |= 0x40u;
          while (2)
          {
            uint64_t v100 = *v3;
            unint64_t v101 = *(void *)(a2 + v100);
            if (v101 == -1 || v101 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v102 = *(unsigned char *)(*(void *)(a2 + *v9) + v101);
              *(void *)(a2 + v100) = v101 + 1;
              v58 |= (unint64_t)(v102 & 0x7F) << v98;
              if (v102 < 0)
              {
                v98 += 7;
                BOOL v24 = v99++ >= 9;
                if (v24)
                {
                  LODWORD(v58) = 0;
                  goto LABEL_172;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v58) = 0;
          }
LABEL_172:
          uint64_t v111 = 40;
          goto LABEL_177;
        case 0xEu:
          char v103 = 0;
          unsigned int v104 = 0;
          uint64_t v58 = 0;
          *(_WORD *)(a1 + v7[85]) |= 0x80u;
          break;
        default:
          unint64_t v33 = v8;
          char v34 = v10;
          char v35 = v11;
          unsigned int v36 = v7;
          uint64_t v37 = v12;
          uint64_t result = PBReaderSkipValueWithTag();
          uint64_t v5 = (int *)MEMORY[0x263F62270];
          unint64_t v12 = v37;
          char v13 = &OBJC_IVAR___PearlCoreAnalyticsDailyTemplateMatchCountsEvent__identity0BaseTemplateFeatureCountType1;
          uint64_t v7 = v36;
          BOOL v14 = &OBJC_IVAR___PearlCoreAnalyticsDailyTemplateMatchCountsEvent__identity0BaseTemplateFeatureCountType1;
          uint64_t v11 = v35;
          int v15 = &OBJC_IVAR___PearlCoreAnalyticsDailyTemplateMatchCountsEvent__identity0BaseTemplateFeatureCountType1;
          unint64_t v10 = v34;
          char v17 = &OBJC_IVAR___PearlCoreAnalyticsDailyTemplateMatchCountsEvent__identity0BaseTemplateFeatureCountType1;
          char v8 = v33;
          uint64_t v16 = &OBJC_IVAR___PearlCoreAnalyticsDailyTemplateMatchCountsEvent__identity0BaseTemplateFeatureCountType1;
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v105 = *v3;
        unint64_t v106 = *(void *)(a2 + v105);
        if (v106 == -1 || v106 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v107 = *(unsigned char *)(*(void *)(a2 + *v9) + v106);
        *(void *)(a2 + v105) = v106 + 1;
        v58 |= (unint64_t)(v107 & 0x7F) << v103;
        if ((v107 & 0x80) == 0) {
          goto LABEL_174;
        }
        v103 += 7;
        BOOL v24 = v104++ >= 9;
        if (v24)
        {
          LODWORD(v58) = 0;
          goto LABEL_176;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_174:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v58) = 0;
      }
LABEL_176:
      uint64_t v111 = 44;
LABEL_177:
      *(_DWORD *)(a1 + v111) = v58;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t AWDBiometricKitEnrollAttemptReadFrom(uint64_t a1, uint64_t a2)
{
  SEL v3 = (int *)MEMORY[0x263F62298];
  unint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 232) |= 8uLL;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_400;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_402;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_400:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_402:
          uint64_t v293 = 32;
          goto LABEL_567;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          *(void *)(a1 + 232) |= 0x20000000000000uLL;
          while (2)
          {
            uint64_t v27 = *v3;
            unint64_t v28 = *(void *)(a2 + v27);
            if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
              *(void *)(a2 + v27) = v28 + 1;
              v26 |= (unint64_t)(v29 & 0x7F) << v24;
              if (v29 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  uint64_t v26 = 0;
                  goto LABEL_406;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v26 = 0;
          }
LABEL_406:
          BOOL v294 = v26 != 0;
          uint64_t v295 = 230;
          goto LABEL_584;
        case 3u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 232) |= 1uLL;
          while (2)
          {
            uint64_t v32 = *v3;
            unint64_t v33 = *(void *)(a2 + v32);
            if (v33 == -1 || v33 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
              *(void *)(a2 + v32) = v33 + 1;
              v19 |= (unint64_t)(v34 & 0x7F) << v30;
              if (v34 < 0)
              {
                v30 += 7;
                BOOL v14 = v31++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_410;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_410:
          uint64_t v293 = 8;
          goto LABEL_567;
        case 4u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x10000uLL;
          while (2)
          {
            uint64_t v38 = *v3;
            unint64_t v39 = *(void *)(a2 + v38);
            if (v39 == -1 || v39 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
              *(void *)(a2 + v38) = v39 + 1;
              v37 |= (unint64_t)(v40 & 0x7F) << v35;
              if (v40 < 0)
              {
                v35 += 7;
                BOOL v14 = v36++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_414;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_414:
          uint64_t v296 = 88;
          goto LABEL_617;
        case 5u:
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x2000uLL;
          while (2)
          {
            uint64_t v43 = *v3;
            unint64_t v44 = *(void *)(a2 + v43);
            if (v44 == -1 || v44 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v45 = *(unsigned char *)(*(void *)(a2 + *v7) + v44);
              *(void *)(a2 + v43) = v44 + 1;
              v37 |= (unint64_t)(v45 & 0x7F) << v41;
              if (v45 < 0)
              {
                v41 += 7;
                BOOL v14 = v42++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_418;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_418:
          uint64_t v296 = 76;
          goto LABEL_617;
        case 6u:
          char v46 = 0;
          unsigned int v47 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x8000uLL;
          while (2)
          {
            uint64_t v48 = *v3;
            unint64_t v49 = *(void *)(a2 + v48);
            if (v49 == -1 || v49 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v50 = *(unsigned char *)(*(void *)(a2 + *v7) + v49);
              *(void *)(a2 + v48) = v49 + 1;
              v37 |= (unint64_t)(v50 & 0x7F) << v46;
              if (v50 < 0)
              {
                v46 += 7;
                BOOL v14 = v47++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_422;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_422:
          uint64_t v296 = 84;
          goto LABEL_617;
        case 7u:
          char v51 = 0;
          unsigned int v52 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x200uLL;
          while (2)
          {
            uint64_t v53 = *v3;
            unint64_t v54 = *(void *)(a2 + v53);
            if (v54 == -1 || v54 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v55 = *(unsigned char *)(*(void *)(a2 + *v7) + v54);
              *(void *)(a2 + v53) = v54 + 1;
              v37 |= (unint64_t)(v55 & 0x7F) << v51;
              if (v55 < 0)
              {
                v51 += 7;
                BOOL v14 = v52++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_426;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_426:
          uint64_t v296 = 60;
          goto LABEL_617;
        case 8u:
          char v56 = 0;
          unsigned int v57 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x4000uLL;
          while (2)
          {
            uint64_t v58 = *v3;
            unint64_t v59 = *(void *)(a2 + v58);
            if (v59 == -1 || v59 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v60 = *(unsigned char *)(*(void *)(a2 + *v7) + v59);
              *(void *)(a2 + v58) = v59 + 1;
              v37 |= (unint64_t)(v60 & 0x7F) << v56;
              if (v60 < 0)
              {
                v56 += 7;
                BOOL v14 = v57++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_430;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_430:
          uint64_t v296 = 80;
          goto LABEL_617;
        case 9u:
          char v61 = 0;
          unsigned int v62 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x400uLL;
          while (2)
          {
            uint64_t v63 = *v3;
            unint64_t v64 = *(void *)(a2 + v63);
            if (v64 == -1 || v64 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v65 = *(unsigned char *)(*(void *)(a2 + *v7) + v64);
              *(void *)(a2 + v63) = v64 + 1;
              v37 |= (unint64_t)(v65 & 0x7F) << v61;
              if (v65 < 0)
              {
                v61 += 7;
                BOOL v14 = v62++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_434;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_434:
          uint64_t v296 = 64;
          goto LABEL_617;
        case 0xAu:
          char v66 = 0;
          unsigned int v67 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x800uLL;
          while (2)
          {
            uint64_t v68 = *v3;
            unint64_t v69 = *(void *)(a2 + v68);
            if (v69 == -1 || v69 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v70 = *(unsigned char *)(*(void *)(a2 + *v7) + v69);
              *(void *)(a2 + v68) = v69 + 1;
              v37 |= (unint64_t)(v70 & 0x7F) << v66;
              if (v70 < 0)
              {
                v66 += 7;
                BOOL v14 = v67++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_438;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_438:
          uint64_t v296 = 68;
          goto LABEL_617;
        case 0xBu:
          char v71 = 0;
          unsigned int v72 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x40000uLL;
          while (2)
          {
            uint64_t v73 = *v3;
            unint64_t v74 = *(void *)(a2 + v73);
            if (v74 == -1 || v74 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v75 = *(unsigned char *)(*(void *)(a2 + *v7) + v74);
              *(void *)(a2 + v73) = v74 + 1;
              v37 |= (unint64_t)(v75 & 0x7F) << v71;
              if (v75 < 0)
              {
                v71 += 7;
                BOOL v14 = v72++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_442;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_442:
          uint64_t v296 = 96;
          goto LABEL_617;
        case 0xCu:
          char v76 = 0;
          unsigned int v77 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x100uLL;
          while (2)
          {
            uint64_t v78 = *v3;
            unint64_t v79 = *(void *)(a2 + v78);
            if (v79 == -1 || v79 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v80 = *(unsigned char *)(*(void *)(a2 + *v7) + v79);
              *(void *)(a2 + v78) = v79 + 1;
              v37 |= (unint64_t)(v80 & 0x7F) << v76;
              if (v80 < 0)
              {
                v76 += 7;
                BOOL v14 = v77++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_446;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_446:
          uint64_t v296 = 56;
          goto LABEL_617;
        case 0xDu:
          char v81 = 0;
          unsigned int v82 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x20000uLL;
          while (2)
          {
            uint64_t v83 = *v3;
            unint64_t v84 = *(void *)(a2 + v83);
            if (v84 == -1 || v84 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v85 = *(unsigned char *)(*(void *)(a2 + *v7) + v84);
              *(void *)(a2 + v83) = v84 + 1;
              v37 |= (unint64_t)(v85 & 0x7F) << v81;
              if (v85 < 0)
              {
                v81 += 7;
                BOOL v14 = v82++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_450;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_450:
          uint64_t v296 = 92;
          goto LABEL_617;
        case 0xEu:
          char v86 = 0;
          unsigned int v87 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x400000000000uLL;
          while (2)
          {
            uint64_t v88 = *v3;
            unint64_t v89 = *(void *)(a2 + v88);
            if (v89 == -1 || v89 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v90 = *(unsigned char *)(*(void *)(a2 + *v7) + v89);
              *(void *)(a2 + v88) = v89 + 1;
              v37 |= (unint64_t)(v90 & 0x7F) << v86;
              if (v90 < 0)
              {
                v86 += 7;
                BOOL v14 = v87++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_454;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_454:
          uint64_t v296 = 208;
          goto LABEL_617;
        case 0xFu:
          char v91 = 0;
          unsigned int v92 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x80000000000uLL;
          while (2)
          {
            uint64_t v93 = *v3;
            unint64_t v94 = *(void *)(a2 + v93);
            if (v94 == -1 || v94 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v95 = *(unsigned char *)(*(void *)(a2 + *v7) + v94);
              *(void *)(a2 + v93) = v94 + 1;
              v37 |= (unint64_t)(v95 & 0x7F) << v91;
              if (v95 < 0)
              {
                v91 += 7;
                BOOL v14 = v92++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_458;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_458:
          uint64_t v296 = 196;
          goto LABEL_617;
        case 0x10u:
          char v96 = 0;
          unsigned int v97 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x200000000000uLL;
          while (2)
          {
            uint64_t v98 = *v3;
            unint64_t v99 = *(void *)(a2 + v98);
            if (v99 == -1 || v99 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v100 = *(unsigned char *)(*(void *)(a2 + *v7) + v99);
              *(void *)(a2 + v98) = v99 + 1;
              v37 |= (unint64_t)(v100 & 0x7F) << v96;
              if (v100 < 0)
              {
                v96 += 7;
                BOOL v14 = v97++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_462;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_462:
          uint64_t v296 = 204;
          goto LABEL_617;
        case 0x11u:
          char v101 = 0;
          unsigned int v102 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x8000000000uLL;
          while (2)
          {
            uint64_t v103 = *v3;
            unint64_t v104 = *(void *)(a2 + v103);
            if (v104 == -1 || v104 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v105 = *(unsigned char *)(*(void *)(a2 + *v7) + v104);
              *(void *)(a2 + v103) = v104 + 1;
              v37 |= (unint64_t)(v105 & 0x7F) << v101;
              if (v105 < 0)
              {
                v101 += 7;
                BOOL v14 = v102++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_466;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_466:
          uint64_t v296 = 180;
          goto LABEL_617;
        case 0x12u:
          char v106 = 0;
          unsigned int v107 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x100000000000uLL;
          while (2)
          {
            uint64_t v108 = *v3;
            unint64_t v109 = *(void *)(a2 + v108);
            if (v109 == -1 || v109 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v110 = *(unsigned char *)(*(void *)(a2 + *v7) + v109);
              *(void *)(a2 + v108) = v109 + 1;
              v37 |= (unint64_t)(v110 & 0x7F) << v106;
              if (v110 < 0)
              {
                v106 += 7;
                BOOL v14 = v107++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_470;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_470:
          uint64_t v296 = 200;
          goto LABEL_617;
        case 0x13u:
          char v111 = 0;
          unsigned int v112 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x10000000000uLL;
          while (2)
          {
            uint64_t v113 = *v3;
            unint64_t v114 = *(void *)(a2 + v113);
            if (v114 == -1 || v114 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v115 = *(unsigned char *)(*(void *)(a2 + *v7) + v114);
              *(void *)(a2 + v113) = v114 + 1;
              v37 |= (unint64_t)(v115 & 0x7F) << v111;
              if (v115 < 0)
              {
                v111 += 7;
                BOOL v14 = v112++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_474;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_474:
          uint64_t v296 = 184;
          goto LABEL_617;
        case 0x14u:
          char v116 = 0;
          unsigned int v117 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x20000000000uLL;
          while (2)
          {
            uint64_t v118 = *v3;
            unint64_t v119 = *(void *)(a2 + v118);
            if (v119 == -1 || v119 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v120 = *(unsigned char *)(*(void *)(a2 + *v7) + v119);
              *(void *)(a2 + v118) = v119 + 1;
              v37 |= (unint64_t)(v120 & 0x7F) << v116;
              if (v120 < 0)
              {
                v116 += 7;
                BOOL v14 = v117++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_478;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_478:
          uint64_t v296 = 188;
          goto LABEL_617;
        case 0x15u:
          char v121 = 0;
          unsigned int v122 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x1000000000000uLL;
          while (2)
          {
            uint64_t v123 = *v3;
            unint64_t v124 = *(void *)(a2 + v123);
            if (v124 == -1 || v124 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v125 = *(unsigned char *)(*(void *)(a2 + *v7) + v124);
              *(void *)(a2 + v123) = v124 + 1;
              v37 |= (unint64_t)(v125 & 0x7F) << v121;
              if (v125 < 0)
              {
                v121 += 7;
                BOOL v14 = v122++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_482;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_482:
          uint64_t v296 = 216;
          goto LABEL_617;
        case 0x16u:
          char v126 = 0;
          unsigned int v127 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x4000000000uLL;
          while (2)
          {
            uint64_t v128 = *v3;
            unint64_t v129 = *(void *)(a2 + v128);
            if (v129 == -1 || v129 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v130 = *(unsigned char *)(*(void *)(a2 + *v7) + v129);
              *(void *)(a2 + v128) = v129 + 1;
              v37 |= (unint64_t)(v130 & 0x7F) << v126;
              if (v130 < 0)
              {
                v126 += 7;
                BOOL v14 = v127++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_486;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_486:
          uint64_t v296 = 176;
          goto LABEL_617;
        case 0x17u:
          char v131 = 0;
          unsigned int v132 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x800000000000uLL;
          while (2)
          {
            uint64_t v133 = *v3;
            unint64_t v134 = *(void *)(a2 + v133);
            if (v134 == -1 || v134 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v135 = *(unsigned char *)(*(void *)(a2 + *v7) + v134);
              *(void *)(a2 + v133) = v134 + 1;
              v37 |= (unint64_t)(v135 & 0x7F) << v131;
              if (v135 < 0)
              {
                v131 += 7;
                BOOL v14 = v132++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_490;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_490:
          uint64_t v296 = 212;
          goto LABEL_617;
        case 0x18u:
          char v136 = 0;
          unsigned int v137 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x20000000uLL;
          while (2)
          {
            uint64_t v138 = *v3;
            unint64_t v139 = *(void *)(a2 + v138);
            if (v139 == -1 || v139 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v140 = *(unsigned char *)(*(void *)(a2 + *v7) + v139);
              *(void *)(a2 + v138) = v139 + 1;
              v37 |= (unint64_t)(v140 & 0x7F) << v136;
              if (v140 < 0)
              {
                v136 += 7;
                BOOL v14 = v137++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_494;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_494:
          uint64_t v296 = 140;
          goto LABEL_617;
        case 0x19u:
          char v141 = 0;
          unsigned int v142 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x40000000uLL;
          while (2)
          {
            uint64_t v143 = *v3;
            unint64_t v144 = *(void *)(a2 + v143);
            if (v144 == -1 || v144 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v145 = *(unsigned char *)(*(void *)(a2 + *v7) + v144);
              *(void *)(a2 + v143) = v144 + 1;
              v37 |= (unint64_t)(v145 & 0x7F) << v141;
              if (v145 < 0)
              {
                v141 += 7;
                BOOL v14 = v142++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_498;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_498:
          uint64_t v296 = 144;
          goto LABEL_617;
        case 0x1Au:
          char v146 = 0;
          unsigned int v147 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x80000000uLL;
          while (2)
          {
            uint64_t v148 = *v3;
            unint64_t v149 = *(void *)(a2 + v148);
            if (v149 == -1 || v149 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v150 = *(unsigned char *)(*(void *)(a2 + *v7) + v149);
              *(void *)(a2 + v148) = v149 + 1;
              v37 |= (unint64_t)(v150 & 0x7F) << v146;
              if (v150 < 0)
              {
                v146 += 7;
                BOOL v14 = v147++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_502;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_502:
          uint64_t v296 = 148;
          goto LABEL_617;
        case 0x1Bu:
          char v151 = 0;
          unsigned int v152 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x100000000uLL;
          while (2)
          {
            uint64_t v153 = *v3;
            unint64_t v154 = *(void *)(a2 + v153);
            if (v154 == -1 || v154 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v155 = *(unsigned char *)(*(void *)(a2 + *v7) + v154);
              *(void *)(a2 + v153) = v154 + 1;
              v37 |= (unint64_t)(v155 & 0x7F) << v151;
              if (v155 < 0)
              {
                v151 += 7;
                BOOL v14 = v152++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_506;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_506:
          uint64_t v296 = 152;
          goto LABEL_617;
        case 0x1Cu:
          char v156 = 0;
          unsigned int v157 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x200000000uLL;
          while (2)
          {
            uint64_t v158 = *v3;
            unint64_t v159 = *(void *)(a2 + v158);
            if (v159 == -1 || v159 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v160 = *(unsigned char *)(*(void *)(a2 + *v7) + v159);
              *(void *)(a2 + v158) = v159 + 1;
              v37 |= (unint64_t)(v160 & 0x7F) << v156;
              if (v160 < 0)
              {
                v156 += 7;
                BOOL v14 = v157++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_510;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_510:
          uint64_t v296 = 156;
          goto LABEL_617;
        case 0x1Du:
          char v161 = 0;
          unsigned int v162 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x400000000uLL;
          while (2)
          {
            uint64_t v163 = *v3;
            unint64_t v164 = *(void *)(a2 + v163);
            if (v164 == -1 || v164 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v165 = *(unsigned char *)(*(void *)(a2 + *v7) + v164);
              *(void *)(a2 + v163) = v164 + 1;
              v37 |= (unint64_t)(v165 & 0x7F) << v161;
              if (v165 < 0)
              {
                v161 += 7;
                BOOL v14 = v162++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_514;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_514:
          uint64_t v296 = 160;
          goto LABEL_617;
        case 0x1Eu:
          char v166 = 0;
          unsigned int v167 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x800000000uLL;
          while (2)
          {
            uint64_t v168 = *v3;
            unint64_t v169 = *(void *)(a2 + v168);
            if (v169 == -1 || v169 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v170 = *(unsigned char *)(*(void *)(a2 + *v7) + v169);
              *(void *)(a2 + v168) = v169 + 1;
              v37 |= (unint64_t)(v170 & 0x7F) << v166;
              if (v170 < 0)
              {
                v166 += 7;
                BOOL v14 = v167++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_518;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_518:
          uint64_t v296 = 164;
          goto LABEL_617;
        case 0x1Fu:
          char v171 = 0;
          unsigned int v172 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x1000000000uLL;
          while (2)
          {
            uint64_t v173 = *v3;
            unint64_t v174 = *(void *)(a2 + v173);
            if (v174 == -1 || v174 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v175 = *(unsigned char *)(*(void *)(a2 + *v7) + v174);
              *(void *)(a2 + v173) = v174 + 1;
              v37 |= (unint64_t)(v175 & 0x7F) << v171;
              if (v175 < 0)
              {
                v171 += 7;
                BOOL v14 = v172++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_522;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_522:
          uint64_t v296 = 168;
          goto LABEL_617;
        case 0x20u:
          char v176 = 0;
          unsigned int v177 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x2000000000uLL;
          while (2)
          {
            uint64_t v178 = *v3;
            unint64_t v179 = *(void *)(a2 + v178);
            if (v179 == -1 || v179 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v180 = *(unsigned char *)(*(void *)(a2 + *v7) + v179);
              *(void *)(a2 + v178) = v179 + 1;
              v37 |= (unint64_t)(v180 & 0x7F) << v176;
              if (v180 < 0)
              {
                v176 += 7;
                BOOL v14 = v177++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_526;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_526:
          uint64_t v296 = 172;
          goto LABEL_617;
        case 0x21u:
          char v181 = 0;
          unsigned int v182 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x20uLL;
          while (2)
          {
            uint64_t v183 = *v3;
            unint64_t v184 = *(void *)(a2 + v183);
            if (v184 == -1 || v184 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v185 = *(unsigned char *)(*(void *)(a2 + *v7) + v184);
              *(void *)(a2 + v183) = v184 + 1;
              v37 |= (unint64_t)(v185 & 0x7F) << v181;
              if (v185 < 0)
              {
                v181 += 7;
                BOOL v14 = v182++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_530;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_530:
          uint64_t v296 = 44;
          goto LABEL_617;
        case 0x22u:
          char v186 = 0;
          unsigned int v187 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x10uLL;
          while (2)
          {
            uint64_t v188 = *v3;
            unint64_t v189 = *(void *)(a2 + v188);
            if (v189 == -1 || v189 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v190 = *(unsigned char *)(*(void *)(a2 + *v7) + v189);
              *(void *)(a2 + v188) = v189 + 1;
              v37 |= (unint64_t)(v190 & 0x7F) << v186;
              if (v190 < 0)
              {
                v186 += 7;
                BOOL v14 = v187++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_534;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_534:
          uint64_t v296 = 40;
          goto LABEL_617;
        case 0x23u:
          char v191 = 0;
          unsigned int v192 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x10000000uLL;
          while (2)
          {
            uint64_t v193 = *v3;
            unint64_t v194 = *(void *)(a2 + v193);
            if (v194 == -1 || v194 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v195 = *(unsigned char *)(*(void *)(a2 + *v7) + v194);
              *(void *)(a2 + v193) = v194 + 1;
              v37 |= (unint64_t)(v195 & 0x7F) << v191;
              if (v195 < 0)
              {
                v191 += 7;
                BOOL v14 = v192++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_538;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_538:
          uint64_t v296 = 136;
          goto LABEL_617;
        case 0x24u:
          char v196 = 0;
          unsigned int v197 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x100000uLL;
          while (2)
          {
            uint64_t v198 = *v3;
            unint64_t v199 = *(void *)(a2 + v198);
            if (v199 == -1 || v199 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v200 = *(unsigned char *)(*(void *)(a2 + *v7) + v199);
              *(void *)(a2 + v198) = v199 + 1;
              v37 |= (unint64_t)(v200 & 0x7F) << v196;
              if (v200 < 0)
              {
                v196 += 7;
                BOOL v14 = v197++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_542;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_542:
          uint64_t v296 = 104;
          goto LABEL_617;
        case 0x25u:
          char v201 = 0;
          unsigned int v202 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x40uLL;
          while (2)
          {
            uint64_t v203 = *v3;
            unint64_t v204 = *(void *)(a2 + v203);
            if (v204 == -1 || v204 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v205 = *(unsigned char *)(*(void *)(a2 + *v7) + v204);
              *(void *)(a2 + v203) = v204 + 1;
              v37 |= (unint64_t)(v205 & 0x7F) << v201;
              if (v205 < 0)
              {
                v201 += 7;
                BOOL v14 = v202++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_546;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_546:
          uint64_t v296 = 48;
          goto LABEL_617;
        case 0x26u:
          char v206 = 0;
          unsigned int v207 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x200000uLL;
          while (2)
          {
            uint64_t v208 = *v3;
            unint64_t v209 = *(void *)(a2 + v208);
            if (v209 == -1 || v209 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v210 = *(unsigned char *)(*(void *)(a2 + *v7) + v209);
              *(void *)(a2 + v208) = v209 + 1;
              v37 |= (unint64_t)(v210 & 0x7F) << v206;
              if (v210 < 0)
              {
                v206 += 7;
                BOOL v14 = v207++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_550;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_550:
          uint64_t v296 = 108;
          goto LABEL_617;
        case 0x27u:
          char v211 = 0;
          unsigned int v212 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x8000000uLL;
          while (2)
          {
            uint64_t v213 = *v3;
            unint64_t v214 = *(void *)(a2 + v213);
            if (v214 == -1 || v214 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v215 = *(unsigned char *)(*(void *)(a2 + *v7) + v214);
              *(void *)(a2 + v213) = v214 + 1;
              v37 |= (unint64_t)(v215 & 0x7F) << v211;
              if (v215 < 0)
              {
                v211 += 7;
                BOOL v14 = v212++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_554;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_554:
          uint64_t v296 = 132;
          goto LABEL_617;
        case 0x28u:
          char v216 = 0;
          unsigned int v217 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x4000000000000uLL;
          while (2)
          {
            uint64_t v218 = *v3;
            unint64_t v219 = *(void *)(a2 + v218);
            if (v219 == -1 || v219 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v220 = *(unsigned char *)(*(void *)(a2 + *v7) + v219);
              *(void *)(a2 + v218) = v219 + 1;
              v37 |= (unint64_t)(v220 & 0x7F) << v216;
              if (v220 < 0)
              {
                v216 += 7;
                BOOL v14 = v217++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_558;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_558:
          uint64_t v296 = 224;
          goto LABEL_617;
        case 0x29u:
          char v221 = 0;
          unsigned int v222 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 232) |= 4uLL;
          while (2)
          {
            uint64_t v223 = *v3;
            unint64_t v224 = *(void *)(a2 + v223);
            if (v224 == -1 || v224 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v225 = *(unsigned char *)(*(void *)(a2 + *v7) + v224);
              *(void *)(a2 + v223) = v224 + 1;
              v19 |= (unint64_t)(v225 & 0x7F) << v221;
              if (v225 < 0)
              {
                v221 += 7;
                BOOL v14 = v222++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_562;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_562:
          uint64_t v293 = 24;
          goto LABEL_567;
        case 0x2Au:
          char v226 = 0;
          unsigned int v227 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 232) |= 2uLL;
          while (2)
          {
            uint64_t v228 = *v3;
            unint64_t v229 = *(void *)(a2 + v228);
            if (v229 == -1 || v229 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v230 = *(unsigned char *)(*(void *)(a2 + *v7) + v229);
              *(void *)(a2 + v228) = v229 + 1;
              v19 |= (unint64_t)(v230 & 0x7F) << v226;
              if (v230 < 0)
              {
                v226 += 7;
                BOOL v14 = v227++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_566;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_566:
          uint64_t v293 = 16;
LABEL_567:
          *(void *)(a1 + v293) = v19;
          continue;
        case 0x2Bu:
          char v231 = 0;
          unsigned int v232 = 0;
          uint64_t v233 = 0;
          *(void *)(a1 + 232) |= 0x8000000000000uLL;
          while (2)
          {
            uint64_t v234 = *v3;
            unint64_t v235 = *(void *)(a2 + v234);
            if (v235 == -1 || v235 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v236 = *(unsigned char *)(*(void *)(a2 + *v7) + v235);
              *(void *)(a2 + v234) = v235 + 1;
              v233 |= (unint64_t)(v236 & 0x7F) << v231;
              if (v236 < 0)
              {
                v231 += 7;
                BOOL v14 = v232++ >= 9;
                if (v14)
                {
                  uint64_t v233 = 0;
                  goto LABEL_571;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v233 = 0;
          }
LABEL_571:
          BOOL v294 = v233 != 0;
          uint64_t v295 = 228;
          goto LABEL_584;
        case 0x2Cu:
          char v237 = 0;
          unsigned int v238 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x80uLL;
          while (2)
          {
            uint64_t v239 = *v3;
            unint64_t v240 = *(void *)(a2 + v239);
            if (v240 == -1 || v240 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v241 = *(unsigned char *)(*(void *)(a2 + *v7) + v240);
              *(void *)(a2 + v239) = v240 + 1;
              v37 |= (unint64_t)(v241 & 0x7F) << v237;
              if (v241 < 0)
              {
                v237 += 7;
                BOOL v14 = v238++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_575;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_575:
          uint64_t v296 = 52;
          goto LABEL_617;
        case 0x2Du:
          char v242 = 0;
          unsigned int v243 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x800000uLL;
          while (2)
          {
            uint64_t v244 = *v3;
            unint64_t v245 = *(void *)(a2 + v244);
            if (v245 == -1 || v245 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v246 = *(unsigned char *)(*(void *)(a2 + *v7) + v245);
              *(void *)(a2 + v244) = v245 + 1;
              v37 |= (unint64_t)(v246 & 0x7F) << v242;
              if (v246 < 0)
              {
                v242 += 7;
                BOOL v14 = v243++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_579;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_579:
          uint64_t v296 = 116;
          goto LABEL_617;
        case 0x2Eu:
          char v247 = 0;
          unsigned int v248 = 0;
          uint64_t v249 = 0;
          *(void *)(a1 + 232) |= 0x10000000000000uLL;
          while (2)
          {
            uint64_t v250 = *v3;
            unint64_t v251 = *(void *)(a2 + v250);
            if (v251 == -1 || v251 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v252 = *(unsigned char *)(*(void *)(a2 + *v7) + v251);
              *(void *)(a2 + v250) = v251 + 1;
              v249 |= (unint64_t)(v252 & 0x7F) << v247;
              if (v252 < 0)
              {
                v247 += 7;
                BOOL v14 = v248++ >= 9;
                if (v14)
                {
                  uint64_t v249 = 0;
                  goto LABEL_583;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v249 = 0;
          }
LABEL_583:
          BOOL v294 = v249 != 0;
          uint64_t v295 = 229;
LABEL_584:
          *(unsigned char *)(a1 + v295) = v294;
          continue;
        case 0x2Fu:
          char v253 = 0;
          unsigned int v254 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x80000uLL;
          while (2)
          {
            uint64_t v255 = *v3;
            unint64_t v256 = *(void *)(a2 + v255);
            if (v256 == -1 || v256 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v257 = *(unsigned char *)(*(void *)(a2 + *v7) + v256);
              *(void *)(a2 + v255) = v256 + 1;
              v37 |= (unint64_t)(v257 & 0x7F) << v253;
              if (v257 < 0)
              {
                v253 += 7;
                BOOL v14 = v254++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_588;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_588:
          uint64_t v296 = 100;
          goto LABEL_617;
        case 0x30u:
          char v258 = 0;
          unsigned int v259 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x1000uLL;
          while (2)
          {
            uint64_t v260 = *v3;
            unint64_t v261 = *(void *)(a2 + v260);
            if (v261 == -1 || v261 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v262 = *(unsigned char *)(*(void *)(a2 + *v7) + v261);
              *(void *)(a2 + v260) = v261 + 1;
              v37 |= (unint64_t)(v262 & 0x7F) << v258;
              if (v262 < 0)
              {
                v258 += 7;
                BOOL v14 = v259++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_592;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_592:
          uint64_t v296 = 72;
          goto LABEL_617;
        case 0x31u:
          char v263 = 0;
          unsigned int v264 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x2000000000000uLL;
          while (2)
          {
            uint64_t v265 = *v3;
            unint64_t v266 = *(void *)(a2 + v265);
            if (v266 == -1 || v266 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v267 = *(unsigned char *)(*(void *)(a2 + *v7) + v266);
              *(void *)(a2 + v265) = v266 + 1;
              v37 |= (unint64_t)(v267 & 0x7F) << v263;
              if (v267 < 0)
              {
                v263 += 7;
                BOOL v14 = v264++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_596;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_596:
          uint64_t v296 = 220;
          goto LABEL_617;
        case 0x32u:
          char v268 = 0;
          unsigned int v269 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x40000000000uLL;
          while (2)
          {
            uint64_t v270 = *v3;
            unint64_t v271 = *(void *)(a2 + v270);
            if (v271 == -1 || v271 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v272 = *(unsigned char *)(*(void *)(a2 + *v7) + v271);
              *(void *)(a2 + v270) = v271 + 1;
              v37 |= (unint64_t)(v272 & 0x7F) << v268;
              if (v272 < 0)
              {
                v268 += 7;
                BOOL v14 = v269++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_600;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_600:
          uint64_t v296 = 192;
          goto LABEL_617;
        case 0x33u:
          char v273 = 0;
          unsigned int v274 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x400000uLL;
          while (2)
          {
            uint64_t v275 = *v3;
            unint64_t v276 = *(void *)(a2 + v275);
            if (v276 == -1 || v276 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v277 = *(unsigned char *)(*(void *)(a2 + *v7) + v276);
              *(void *)(a2 + v275) = v276 + 1;
              v37 |= (unint64_t)(v277 & 0x7F) << v273;
              if (v277 < 0)
              {
                v273 += 7;
                BOOL v14 = v274++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_604;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_604:
          uint64_t v296 = 112;
          goto LABEL_617;
        case 0x34u:
          char v278 = 0;
          unsigned int v279 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x2000000uLL;
          while (2)
          {
            uint64_t v280 = *v3;
            unint64_t v281 = *(void *)(a2 + v280);
            if (v281 == -1 || v281 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v282 = *(unsigned char *)(*(void *)(a2 + *v7) + v281);
              *(void *)(a2 + v280) = v281 + 1;
              v37 |= (unint64_t)(v282 & 0x7F) << v278;
              if (v282 < 0)
              {
                v278 += 7;
                BOOL v14 = v279++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_608;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_608:
          uint64_t v296 = 124;
          goto LABEL_617;
        case 0x35u:
          char v283 = 0;
          unsigned int v284 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x4000000uLL;
          while (2)
          {
            uint64_t v285 = *v3;
            unint64_t v286 = *(void *)(a2 + v285);
            if (v286 == -1 || v286 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v287 = *(unsigned char *)(*(void *)(a2 + *v7) + v286);
              *(void *)(a2 + v285) = v286 + 1;
              v37 |= (unint64_t)(v287 & 0x7F) << v283;
              if (v287 < 0)
              {
                v283 += 7;
                BOOL v14 = v284++ >= 9;
                if (v14)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_612;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_612:
          uint64_t v296 = 128;
          goto LABEL_617;
        case 0x36u:
          char v288 = 0;
          unsigned int v289 = 0;
          uint64_t v37 = 0;
          *(void *)(a1 + 232) |= 0x1000000uLL;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v290 = *v3;
        unint64_t v291 = *(void *)(a2 + v290);
        if (v291 == -1 || v291 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v292 = *(unsigned char *)(*(void *)(a2 + *v7) + v291);
        *(void *)(a2 + v290) = v291 + 1;
        v37 |= (unint64_t)(v292 & 0x7F) << v288;
        if ((v292 & 0x80) == 0) {
          goto LABEL_614;
        }
        v288 += 7;
        BOOL v14 = v289++ >= 9;
        if (v14)
        {
          LODWORD(v37) = 0;
          goto LABEL_616;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_614:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v37) = 0;
      }
LABEL_616:
      uint64_t v296 = 120;
LABEL_617:
      *(_DWORD *)(a1 + v296) = v37;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t AWDBiometricKitMatchAttemptReadFrom(uint64_t a1, uint64_t a2)
{
  SEL v3 = (int *)MEMORY[0x263F62298];
  unint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v8 = 0;
        unsigned int v9 = 0;
        unint64_t v10 = 0;
        while (1)
        {
          uint64_t v11 = *v3;
          unint64_t v12 = *(void *)(a2 + v11);
          if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v12 + 1;
          v10 |= (unint64_t)(v13 & 0x7F) << v8;
          if ((v13 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          BOOL v14 = v9++ >= 9;
          if (v14)
          {
            unint64_t v10 = 0;
            int v15 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        if (*(unsigned char *)(a2 + *v5)) {
          unint64_t v10 = 0;
        }
LABEL_14:
        int v16 = v10 & 7;
        if (!v15 && v16 != 4)
        {
          switch((v10 >> 3))
          {
            case 1u:
              char v18 = 0;
              unsigned int v19 = 0;
              uint64_t v20 = 0;
              *(void *)(a1 + 380) |= 0x100uLL;
              while (1)
              {
                uint64_t v21 = *v3;
                unint64_t v22 = *(void *)(a2 + v21);
                if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
                  break;
                }
                char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
                *(void *)(a2 + v21) = v22 + 1;
                v20 |= (unint64_t)(v23 & 0x7F) << v18;
                if ((v23 & 0x80) == 0) {
                  goto LABEL_708;
                }
                v18 += 7;
                BOOL v14 = v19++ >= 9;
                if (v14)
                {
                  uint64_t v20 = 0;
                  goto LABEL_710;
                }
              }
              *(unsigned char *)(a2 + *v5) = 1;
LABEL_708:
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v20 = 0;
              }
LABEL_710:
              uint64_t v537 = 96;
              goto LABEL_1083;
            case 2u:
              char v25 = 0;
              unsigned int v26 = 0;
              uint64_t v27 = 0;
              *(_DWORD *)(a1 + 388) |= 0x20000000u;
              while (2)
              {
                uint64_t v28 = *v3;
                unint64_t v29 = *(void *)(a2 + v28);
                if (v29 == -1 || v29 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
                  *(void *)(a2 + v28) = v29 + 1;
                  v27 |= (unint64_t)(v30 & 0x7F) << v25;
                  if (v30 < 0)
                  {
                    v25 += 7;
                    BOOL v14 = v26++ >= 9;
                    if (v14)
                    {
                      uint64_t v27 = 0;
                      goto LABEL_714;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v27 = 0;
              }
LABEL_714:
              BOOL v538 = v27 != 0;
              uint64_t v539 = 377;
              goto LABEL_1088;
            case 3u:
              char v31 = 0;
              unsigned int v32 = 0;
              uint64_t v20 = 0;
              *(void *)(a1 + 380) |= 4uLL;
              while (2)
              {
                uint64_t v33 = *v3;
                unint64_t v34 = *(void *)(a2 + v33);
                if (v34 == -1 || v34 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
                  *(void *)(a2 + v33) = v34 + 1;
                  v20 |= (unint64_t)(v35 & 0x7F) << v31;
                  if (v35 < 0)
                  {
                    v31 += 7;
                    BOOL v14 = v32++ >= 9;
                    if (v14)
                    {
                      uint64_t v20 = 0;
                      goto LABEL_718;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v20 = 0;
              }
LABEL_718:
              uint64_t v537 = 48;
              goto LABEL_1083;
            case 4u:
              char v36 = 0;
              unsigned int v37 = 0;
              uint64_t v20 = 0;
              *(void *)(a1 + 380) |= 2uLL;
              while (2)
              {
                uint64_t v38 = *v3;
                unint64_t v39 = *(void *)(a2 + v38);
                if (v39 == -1 || v39 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
                  *(void *)(a2 + v38) = v39 + 1;
                  v20 |= (unint64_t)(v40 & 0x7F) << v36;
                  if (v40 < 0)
                  {
                    v36 += 7;
                    BOOL v14 = v37++ >= 9;
                    if (v14)
                    {
                      uint64_t v20 = 0;
                      goto LABEL_722;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v20 = 0;
              }
LABEL_722:
              uint64_t v537 = 40;
              goto LABEL_1083;
            case 5u:
              char v41 = 0;
              unsigned int v42 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x20000000000uLL;
              while (2)
              {
                uint64_t v44 = *v3;
                unint64_t v45 = *(void *)(a2 + v44);
                if (v45 == -1 || v45 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v46 = *(unsigned char *)(*(void *)(a2 + *v7) + v45);
                  *(void *)(a2 + v44) = v45 + 1;
                  v43 |= (unint64_t)(v46 & 0x7F) << v41;
                  if (v46 < 0)
                  {
                    v41 += 7;
                    BOOL v14 = v42++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_726;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_726:
              uint64_t v540 = 244;
              goto LABEL_1093;
            case 6u:
              char v47 = 0;
              unsigned int v48 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x800000000uLL;
              while (2)
              {
                uint64_t v49 = *v3;
                unint64_t v50 = *(void *)(a2 + v49);
                if (v50 == -1 || v50 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v51 = *(unsigned char *)(*(void *)(a2 + *v7) + v50);
                  *(void *)(a2 + v49) = v50 + 1;
                  v43 |= (unint64_t)(v51 & 0x7F) << v47;
                  if (v51 < 0)
                  {
                    v47 += 7;
                    BOOL v14 = v48++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_730;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_730:
              uint64_t v540 = 220;
              goto LABEL_1093;
            case 7u:
              char v52 = 0;
              unsigned int v53 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x2000000000uLL;
              while (2)
              {
                uint64_t v54 = *v3;
                unint64_t v55 = *(void *)(a2 + v54);
                if (v55 == -1 || v55 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v56 = *(unsigned char *)(*(void *)(a2 + *v7) + v55);
                  *(void *)(a2 + v54) = v55 + 1;
                  v43 |= (unint64_t)(v56 & 0x7F) << v52;
                  if (v56 < 0)
                  {
                    v52 += 7;
                    BOOL v14 = v53++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_734;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_734:
              uint64_t v540 = 228;
              goto LABEL_1093;
            case 8u:
              char v57 = 0;
              unsigned int v58 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x4000000000uLL;
              while (2)
              {
                uint64_t v59 = *v3;
                unint64_t v60 = *(void *)(a2 + v59);
                if (v60 == -1 || v60 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v61 = *(unsigned char *)(*(void *)(a2 + *v7) + v60);
                  *(void *)(a2 + v59) = v60 + 1;
                  v43 |= (unint64_t)(v61 & 0x7F) << v57;
                  if (v61 < 0)
                  {
                    v57 += 7;
                    BOOL v14 = v58++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_738;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_738:
              uint64_t v540 = 232;
              goto LABEL_1093;
            case 9u:
              char v62 = 0;
              unsigned int v63 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x1000000000uLL;
              while (2)
              {
                uint64_t v64 = *v3;
                unint64_t v65 = *(void *)(a2 + v64);
                if (v65 == -1 || v65 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v66 = *(unsigned char *)(*(void *)(a2 + *v7) + v65);
                  *(void *)(a2 + v64) = v65 + 1;
                  v43 |= (unint64_t)(v66 & 0x7F) << v62;
                  if (v66 < 0)
                  {
                    v62 += 7;
                    BOOL v14 = v63++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_742;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_742:
              uint64_t v540 = 224;
              goto LABEL_1093;
            case 0xAu:
              char v67 = 0;
              unsigned int v68 = 0;
              uint64_t v20 = 0;
              *(void *)(a1 + 380) |= 1uLL;
              while (2)
              {
                uint64_t v69 = *v3;
                unint64_t v70 = *(void *)(a2 + v69);
                if (v70 == -1 || v70 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v71 = *(unsigned char *)(*(void *)(a2 + *v7) + v70);
                  *(void *)(a2 + v69) = v70 + 1;
                  v20 |= (unint64_t)(v71 & 0x7F) << v67;
                  if (v71 < 0)
                  {
                    v67 += 7;
                    BOOL v14 = v68++ >= 9;
                    if (v14)
                    {
                      uint64_t v20 = 0;
                      goto LABEL_746;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v20 = 0;
              }
LABEL_746:
              uint64_t v537 = 32;
              goto LABEL_1083;
            case 0xBu:
              char v72 = 0;
              unsigned int v73 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x200000uLL;
              while (2)
              {
                uint64_t v74 = *v3;
                unint64_t v75 = *(void *)(a2 + v74);
                if (v75 == -1 || v75 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v76 = *(unsigned char *)(*(void *)(a2 + *v7) + v75);
                  *(void *)(a2 + v74) = v75 + 1;
                  v43 |= (unint64_t)(v76 & 0x7F) << v72;
                  if (v76 < 0)
                  {
                    v72 += 7;
                    BOOL v14 = v73++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_750;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_750:
              uint64_t v540 = 152;
              goto LABEL_1093;
            case 0xCu:
              char v77 = 0;
              unsigned int v78 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x8000uLL;
              while (2)
              {
                uint64_t v79 = *v3;
                unint64_t v80 = *(void *)(a2 + v79);
                if (v80 == -1 || v80 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v81 = *(unsigned char *)(*(void *)(a2 + *v7) + v80);
                  *(void *)(a2 + v79) = v80 + 1;
                  v43 |= (unint64_t)(v81 & 0x7F) << v77;
                  if (v81 < 0)
                  {
                    v77 += 7;
                    BOOL v14 = v78++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_754;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_754:
              uint64_t v540 = 128;
              goto LABEL_1093;
            case 0xDu:
              char v82 = 0;
              unsigned int v83 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x20000uLL;
              while (2)
              {
                uint64_t v84 = *v3;
                unint64_t v85 = *(void *)(a2 + v84);
                if (v85 == -1 || v85 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v86 = *(unsigned char *)(*(void *)(a2 + *v7) + v85);
                  *(void *)(a2 + v84) = v85 + 1;
                  v43 |= (unint64_t)(v86 & 0x7F) << v82;
                  if (v86 < 0)
                  {
                    v82 += 7;
                    BOOL v14 = v83++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_758;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_758:
              uint64_t v540 = 136;
              goto LABEL_1093;
            case 0xEu:
              char v87 = 0;
              unsigned int v88 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x40000uLL;
              while (2)
              {
                uint64_t v89 = *v3;
                unint64_t v90 = *(void *)(a2 + v89);
                if (v90 == -1 || v90 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v91 = *(unsigned char *)(*(void *)(a2 + *v7) + v90);
                  *(void *)(a2 + v89) = v90 + 1;
                  v43 |= (unint64_t)(v91 & 0x7F) << v87;
                  if (v91 < 0)
                  {
                    v87 += 7;
                    BOOL v14 = v88++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_762;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_762:
              uint64_t v540 = 140;
              goto LABEL_1093;
            case 0xFu:
              char v92 = 0;
              unsigned int v93 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x10000uLL;
              while (2)
              {
                uint64_t v94 = *v3;
                unint64_t v95 = *(void *)(a2 + v94);
                if (v95 == -1 || v95 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v96 = *(unsigned char *)(*(void *)(a2 + *v7) + v95);
                  *(void *)(a2 + v94) = v95 + 1;
                  v43 |= (unint64_t)(v96 & 0x7F) << v92;
                  if (v96 < 0)
                  {
                    v92 += 7;
                    BOOL v14 = v93++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_766;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_766:
              uint64_t v540 = 132;
              goto LABEL_1093;
            case 0x10u:
              char v97 = 0;
              unsigned int v98 = 0;
              uint64_t v20 = 0;
              *(void *)(a1 + 380) |= 0x10uLL;
              while (2)
              {
                uint64_t v99 = *v3;
                unint64_t v100 = *(void *)(a2 + v99);
                if (v100 == -1 || v100 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v101 = *(unsigned char *)(*(void *)(a2 + *v7) + v100);
                  *(void *)(a2 + v99) = v100 + 1;
                  v20 |= (unint64_t)(v101 & 0x7F) << v97;
                  if (v101 < 0)
                  {
                    v97 += 7;
                    BOOL v14 = v98++ >= 9;
                    if (v14)
                    {
                      uint64_t v20 = 0;
                      goto LABEL_770;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v20 = 0;
              }
LABEL_770:
              uint64_t v537 = 64;
              goto LABEL_1083;
            case 0x11u:
              char v102 = 0;
              unsigned int v103 = 0;
              uint64_t v43 = 0;
              *(_DWORD *)(a1 + 388) |= 2u;
              while (2)
              {
                uint64_t v104 = *v3;
                unint64_t v105 = *(void *)(a2 + v104);
                if (v105 == -1 || v105 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v106 = *(unsigned char *)(*(void *)(a2 + *v7) + v105);
                  *(void *)(a2 + v104) = v105 + 1;
                  v43 |= (unint64_t)(v106 & 0x7F) << v102;
                  if (v106 < 0)
                  {
                    v102 += 7;
                    BOOL v14 = v103++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_774;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_774:
              uint64_t v540 = 340;
              goto LABEL_1093;
            case 0x12u:
              char v107 = 0;
              unsigned int v108 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x2000000000000000uLL;
              while (2)
              {
                uint64_t v109 = *v3;
                unint64_t v110 = *(void *)(a2 + v109);
                if (v110 == -1 || v110 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v111 = *(unsigned char *)(*(void *)(a2 + *v7) + v110);
                  *(void *)(a2 + v109) = v110 + 1;
                  v43 |= (unint64_t)(v111 & 0x7F) << v107;
                  if (v111 < 0)
                  {
                    v107 += 7;
                    BOOL v14 = v108++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_778;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_778:
              uint64_t v540 = 324;
              goto LABEL_1093;
            case 0x13u:
              char v112 = 0;
              unsigned int v113 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x8000000000000000;
              while (2)
              {
                uint64_t v114 = *v3;
                unint64_t v115 = *(void *)(a2 + v114);
                if (v115 == -1 || v115 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v116 = *(unsigned char *)(*(void *)(a2 + *v7) + v115);
                  *(void *)(a2 + v114) = v115 + 1;
                  v43 |= (unint64_t)(v116 & 0x7F) << v112;
                  if (v116 < 0)
                  {
                    v112 += 7;
                    BOOL v14 = v113++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_782;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_782:
              uint64_t v540 = 332;
              goto LABEL_1093;
            case 0x14u:
              char v117 = 0;
              unsigned int v118 = 0;
              uint64_t v43 = 0;
              *(_DWORD *)(a1 + 388) |= 1u;
              while (2)
              {
                uint64_t v119 = *v3;
                unint64_t v120 = *(void *)(a2 + v119);
                if (v120 == -1 || v120 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v121 = *(unsigned char *)(*(void *)(a2 + *v7) + v120);
                  *(void *)(a2 + v119) = v120 + 1;
                  v43 |= (unint64_t)(v121 & 0x7F) << v117;
                  if (v121 < 0)
                  {
                    v117 += 7;
                    BOOL v14 = v118++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_786;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_786:
              uint64_t v540 = 336;
              goto LABEL_1093;
            case 0x15u:
              char v122 = 0;
              unsigned int v123 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x4000000000000000uLL;
              while (2)
              {
                uint64_t v124 = *v3;
                unint64_t v125 = *(void *)(a2 + v124);
                if (v125 == -1 || v125 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v126 = *(unsigned char *)(*(void *)(a2 + *v7) + v125);
                  *(void *)(a2 + v124) = v125 + 1;
                  v43 |= (unint64_t)(v126 & 0x7F) << v122;
                  if (v126 < 0)
                  {
                    v122 += 7;
                    BOOL v14 = v123++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_790;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_790:
              uint64_t v540 = 328;
              goto LABEL_1093;
            case 0x16u:
              char v127 = 0;
              unsigned int v128 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x200uLL;
              while (2)
              {
                uint64_t v129 = *v3;
                unint64_t v130 = *(void *)(a2 + v129);
                if (v130 == -1 || v130 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v131 = *(unsigned char *)(*(void *)(a2 + *v7) + v130);
                  *(void *)(a2 + v129) = v130 + 1;
                  v43 |= (unint64_t)(v131 & 0x7F) << v127;
                  if (v131 < 0)
                  {
                    v127 += 7;
                    BOOL v14 = v128++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_794;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_794:
              uint64_t v540 = 104;
              goto LABEL_1093;
            case 0x17u:
              char v132 = 0;
              unsigned int v133 = 0;
              uint64_t v134 = 0;
              *(_DWORD *)(a1 + 388) |= 0x80000000;
              while (2)
              {
                uint64_t v135 = *v3;
                unint64_t v136 = *(void *)(a2 + v135);
                if (v136 == -1 || v136 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v137 = *(unsigned char *)(*(void *)(a2 + *v7) + v136);
                  *(void *)(a2 + v135) = v136 + 1;
                  v134 |= (unint64_t)(v137 & 0x7F) << v132;
                  if (v137 < 0)
                  {
                    v132 += 7;
                    BOOL v14 = v133++ >= 9;
                    if (v14)
                    {
                      uint64_t v134 = 0;
                      goto LABEL_798;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v134 = 0;
              }
LABEL_798:
              BOOL v538 = v134 != 0;
              uint64_t v539 = 379;
              goto LABEL_1088;
            case 0x18u:
              char v138 = 0;
              unsigned int v139 = 0;
              uint64_t v140 = 0;
              *(_DWORD *)(a1 + 388) |= 0x8000000u;
              while (2)
              {
                uint64_t v141 = *v3;
                unint64_t v142 = *(void *)(a2 + v141);
                if (v142 == -1 || v142 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v143 = *(unsigned char *)(*(void *)(a2 + *v7) + v142);
                  *(void *)(a2 + v141) = v142 + 1;
                  v140 |= (unint64_t)(v143 & 0x7F) << v138;
                  if (v143 < 0)
                  {
                    v138 += 7;
                    BOOL v14 = v139++ >= 9;
                    if (v14)
                    {
                      uint64_t v140 = 0;
                      goto LABEL_802;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v140 = 0;
              }
LABEL_802:
              BOOL v538 = v140 != 0;
              uint64_t v539 = 375;
              goto LABEL_1088;
            case 0x19u:
              char v144 = 0;
              unsigned int v145 = 0;
              uint64_t v146 = 0;
              *(_DWORD *)(a1 + 388) |= 0x1000000u;
              while (2)
              {
                uint64_t v147 = *v3;
                unint64_t v148 = *(void *)(a2 + v147);
                if (v148 == -1 || v148 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v149 = *(unsigned char *)(*(void *)(a2 + *v7) + v148);
                  *(void *)(a2 + v147) = v148 + 1;
                  v146 |= (unint64_t)(v149 & 0x7F) << v144;
                  if (v149 < 0)
                  {
                    v144 += 7;
                    BOOL v14 = v145++ >= 9;
                    if (v14)
                    {
                      uint64_t v146 = 0;
                      goto LABEL_806;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v146 = 0;
              }
LABEL_806:
              BOOL v538 = v146 != 0;
              uint64_t v539 = 372;
              goto LABEL_1088;
            case 0x1Au:
              char v150 = 0;
              unsigned int v151 = 0;
              uint64_t v152 = 0;
              *(_DWORD *)(a1 + 388) |= 0x2000000u;
              while (2)
              {
                uint64_t v153 = *v3;
                unint64_t v154 = *(void *)(a2 + v153);
                if (v154 == -1 || v154 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v155 = *(unsigned char *)(*(void *)(a2 + *v7) + v154);
                  *(void *)(a2 + v153) = v154 + 1;
                  v152 |= (unint64_t)(v155 & 0x7F) << v150;
                  if (v155 < 0)
                  {
                    v150 += 7;
                    BOOL v14 = v151++ >= 9;
                    if (v14)
                    {
                      uint64_t v152 = 0;
                      goto LABEL_810;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v152 = 0;
              }
LABEL_810:
              BOOL v538 = v152 != 0;
              uint64_t v539 = 373;
              goto LABEL_1088;
            case 0x1Bu:
              char v156 = 0;
              unsigned int v157 = 0;
              uint64_t v158 = 0;
              *(_DWORD *)(a1 + 388) |= 0x40u;
              while (2)
              {
                uint64_t v159 = *v3;
                unint64_t v160 = *(void *)(a2 + v159);
                if (v160 == -1 || v160 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v161 = *(unsigned char *)(*(void *)(a2 + *v7) + v160);
                  *(void *)(a2 + v159) = v160 + 1;
                  v158 |= (unint64_t)(v161 & 0x7F) << v156;
                  if (v161 < 0)
                  {
                    v156 += 7;
                    BOOL v14 = v157++ >= 9;
                    if (v14)
                    {
                      uint64_t v158 = 0;
                      goto LABEL_814;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v158 = 0;
              }
LABEL_814:
              BOOL v538 = v158 != 0;
              uint64_t v539 = 354;
              goto LABEL_1088;
            case 0x1Cu:
              char v162 = 0;
              unsigned int v163 = 0;
              uint64_t v164 = 0;
              *(_DWORD *)(a1 + 388) |= 0x10u;
              while (2)
              {
                uint64_t v165 = *v3;
                unint64_t v166 = *(void *)(a2 + v165);
                if (v166 == -1 || v166 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v167 = *(unsigned char *)(*(void *)(a2 + *v7) + v166);
                  *(void *)(a2 + v165) = v166 + 1;
                  v164 |= (unint64_t)(v167 & 0x7F) << v162;
                  if (v167 < 0)
                  {
                    v162 += 7;
                    BOOL v14 = v163++ >= 9;
                    if (v14)
                    {
                      uint64_t v164 = 0;
                      goto LABEL_818;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v164 = 0;
              }
LABEL_818:
              BOOL v538 = v164 != 0;
              uint64_t v539 = 352;
              goto LABEL_1088;
            case 0x1Du:
              char v168 = 0;
              unsigned int v169 = 0;
              uint64_t v170 = 0;
              *(_DWORD *)(a1 + 388) |= 0x10000000u;
              while (2)
              {
                uint64_t v171 = *v3;
                unint64_t v172 = *(void *)(a2 + v171);
                if (v172 == -1 || v172 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v173 = *(unsigned char *)(*(void *)(a2 + *v7) + v172);
                  *(void *)(a2 + v171) = v172 + 1;
                  v170 |= (unint64_t)(v173 & 0x7F) << v168;
                  if (v173 < 0)
                  {
                    v168 += 7;
                    BOOL v14 = v169++ >= 9;
                    if (v14)
                    {
                      uint64_t v170 = 0;
                      goto LABEL_822;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v170 = 0;
              }
LABEL_822:
              BOOL v538 = v170 != 0;
              uint64_t v539 = 376;
              goto LABEL_1088;
            case 0x1Eu:
              char v174 = 0;
              unsigned int v175 = 0;
              uint64_t v176 = 0;
              *(_DWORD *)(a1 + 388) |= 0x40000000u;
              while (2)
              {
                uint64_t v177 = *v3;
                unint64_t v178 = *(void *)(a2 + v177);
                if (v178 == -1 || v178 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v179 = *(unsigned char *)(*(void *)(a2 + *v7) + v178);
                  *(void *)(a2 + v177) = v178 + 1;
                  v176 |= (unint64_t)(v179 & 0x7F) << v174;
                  if (v179 < 0)
                  {
                    v174 += 7;
                    BOOL v14 = v175++ >= 9;
                    if (v14)
                    {
                      uint64_t v176 = 0;
                      goto LABEL_826;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v176 = 0;
              }
LABEL_826:
              BOOL v538 = v176 != 0;
              uint64_t v539 = 378;
              goto LABEL_1088;
            case 0x1Fu:
              char v180 = 0;
              unsigned int v181 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x8000000000000uLL;
              while (2)
              {
                uint64_t v182 = *v3;
                unint64_t v183 = *(void *)(a2 + v182);
                if (v183 == -1 || v183 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v184 = *(unsigned char *)(*(void *)(a2 + *v7) + v183);
                  *(void *)(a2 + v182) = v183 + 1;
                  v43 |= (unint64_t)(v184 & 0x7F) << v180;
                  if (v184 < 0)
                  {
                    v180 += 7;
                    BOOL v14 = v181++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_830;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_830:
              uint64_t v540 = 284;
              goto LABEL_1093;
            case 0x20u:
              char v185 = 0;
              unsigned int v186 = 0;
              uint64_t v43 = 0;
              *(_DWORD *)(a1 + 388) |= 4u;
              while (2)
              {
                uint64_t v187 = *v3;
                unint64_t v188 = *(void *)(a2 + v187);
                if (v188 == -1 || v188 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v189 = *(unsigned char *)(*(void *)(a2 + *v7) + v188);
                  *(void *)(a2 + v187) = v188 + 1;
                  v43 |= (unint64_t)(v189 & 0x7F) << v185;
                  if (v189 < 0)
                  {
                    v185 += 7;
                    BOOL v14 = v186++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_834;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_834:
              uint64_t v540 = 344;
              goto LABEL_1093;
            case 0x21u:
              char v190 = 0;
              unsigned int v191 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x40000000000uLL;
              while (2)
              {
                uint64_t v192 = *v3;
                unint64_t v193 = *(void *)(a2 + v192);
                if (v193 == -1 || v193 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v194 = *(unsigned char *)(*(void *)(a2 + *v7) + v193);
                  *(void *)(a2 + v192) = v193 + 1;
                  v43 |= (unint64_t)(v194 & 0x7F) << v190;
                  if (v194 < 0)
                  {
                    v190 += 7;
                    BOOL v14 = v191++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_838;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_838:
              uint64_t v540 = 248;
              goto LABEL_1093;
            case 0x22u:
              char v195 = 0;
              unsigned int v196 = 0;
              uint64_t v197 = 0;
              *(_DWORD *)(a1 + 388) |= 0x400000u;
              while (2)
              {
                uint64_t v198 = *v3;
                unint64_t v199 = *(void *)(a2 + v198);
                if (v199 == -1 || v199 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v200 = *(unsigned char *)(*(void *)(a2 + *v7) + v199);
                  *(void *)(a2 + v198) = v199 + 1;
                  v197 |= (unint64_t)(v200 & 0x7F) << v195;
                  if (v200 < 0)
                  {
                    v195 += 7;
                    BOOL v14 = v196++ >= 9;
                    if (v14)
                    {
                      uint64_t v197 = 0;
                      goto LABEL_842;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v197 = 0;
              }
LABEL_842:
              BOOL v538 = v197 != 0;
              uint64_t v539 = 370;
              goto LABEL_1088;
            case 0x23u:
              char v201 = 0;
              unsigned int v202 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x2000000uLL;
              while (2)
              {
                uint64_t v203 = *v3;
                unint64_t v204 = *(void *)(a2 + v203);
                if (v204 == -1 || v204 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v205 = *(unsigned char *)(*(void *)(a2 + *v7) + v204);
                  *(void *)(a2 + v203) = v204 + 1;
                  v43 |= (unint64_t)(v205 & 0x7F) << v201;
                  if (v205 < 0)
                  {
                    v201 += 7;
                    BOOL v14 = v202++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_846;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_846:
              uint64_t v540 = 168;
              goto LABEL_1093;
            case 0x24u:
              char v206 = 0;
              unsigned int v207 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x4000000uLL;
              while (2)
              {
                uint64_t v208 = *v3;
                unint64_t v209 = *(void *)(a2 + v208);
                if (v209 == -1 || v209 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v210 = *(unsigned char *)(*(void *)(a2 + *v7) + v209);
                  *(void *)(a2 + v208) = v209 + 1;
                  v43 |= (unint64_t)(v210 & 0x7F) << v206;
                  if (v210 < 0)
                  {
                    v206 += 7;
                    BOOL v14 = v207++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_850;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_850:
              uint64_t v540 = 172;
              goto LABEL_1093;
            case 0x25u:
              char v211 = 0;
              unsigned int v212 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x1000000uLL;
              while (2)
              {
                uint64_t v213 = *v3;
                unint64_t v214 = *(void *)(a2 + v213);
                if (v214 == -1 || v214 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v215 = *(unsigned char *)(*(void *)(a2 + *v7) + v214);
                  *(void *)(a2 + v213) = v214 + 1;
                  v43 |= (unint64_t)(v215 & 0x7F) << v211;
                  if (v215 < 0)
                  {
                    v211 += 7;
                    BOOL v14 = v212++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_854;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_854:
              uint64_t v540 = 164;
              goto LABEL_1093;
            case 0x26u:
              char v216 = 0;
              unsigned int v217 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x800000uLL;
              while (2)
              {
                uint64_t v218 = *v3;
                unint64_t v219 = *(void *)(a2 + v218);
                if (v219 == -1 || v219 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v220 = *(unsigned char *)(*(void *)(a2 + *v7) + v219);
                  *(void *)(a2 + v218) = v219 + 1;
                  v43 |= (unint64_t)(v220 & 0x7F) << v216;
                  if (v220 < 0)
                  {
                    v216 += 7;
                    BOOL v14 = v217++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_858;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_858:
              uint64_t v540 = 160;
              goto LABEL_1093;
            case 0x27u:
              char v221 = 0;
              unsigned int v222 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x10000000000uLL;
              while (2)
              {
                uint64_t v223 = *v3;
                unint64_t v224 = *(void *)(a2 + v223);
                if (v224 == -1 || v224 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v225 = *(unsigned char *)(*(void *)(a2 + *v7) + v224);
                  *(void *)(a2 + v223) = v224 + 1;
                  v43 |= (unint64_t)(v225 & 0x7F) << v221;
                  if (v225 < 0)
                  {
                    v221 += 7;
                    BOOL v14 = v222++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_862;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_862:
              uint64_t v540 = 240;
              goto LABEL_1093;
            case 0x28u:
              char v226 = 0;
              unsigned int v227 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x8000000000uLL;
              while (2)
              {
                uint64_t v228 = *v3;
                unint64_t v229 = *(void *)(a2 + v228);
                if (v229 == -1 || v229 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v230 = *(unsigned char *)(*(void *)(a2 + *v7) + v229);
                  *(void *)(a2 + v228) = v229 + 1;
                  v43 |= (unint64_t)(v230 & 0x7F) << v226;
                  if (v230 < 0)
                  {
                    v226 += 7;
                    BOOL v14 = v227++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_866;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_866:
              uint64_t v540 = 236;
              goto LABEL_1093;
            case 0x29u:
              char v231 = 0;
              unsigned int v232 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x100000uLL;
              while (2)
              {
                uint64_t v233 = *v3;
                unint64_t v234 = *(void *)(a2 + v233);
                if (v234 == -1 || v234 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v235 = *(unsigned char *)(*(void *)(a2 + *v7) + v234);
                  *(void *)(a2 + v233) = v234 + 1;
                  v43 |= (unint64_t)(v235 & 0x7F) << v231;
                  if (v235 < 0)
                  {
                    v231 += 7;
                    BOOL v14 = v232++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_870;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_870:
              uint64_t v540 = 148;
              goto LABEL_1093;
            case 0x2Au:
              char v236 = 0;
              unsigned int v237 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x80000uLL;
              while (2)
              {
                uint64_t v238 = *v3;
                unint64_t v239 = *(void *)(a2 + v238);
                if (v239 == -1 || v239 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v240 = *(unsigned char *)(*(void *)(a2 + *v7) + v239);
                  *(void *)(a2 + v238) = v239 + 1;
                  v43 |= (unint64_t)(v240 & 0x7F) << v236;
                  if (v240 < 0)
                  {
                    v236 += 7;
                    BOOL v14 = v237++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_874;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_874:
              uint64_t v540 = 144;
              goto LABEL_1093;
            case 0x2Bu:
              char v241 = 0;
              unsigned int v242 = 0;
              uint64_t v20 = 0;
              *(void *)(a1 + 380) |= 0x40uLL;
              while (2)
              {
                uint64_t v243 = *v3;
                unint64_t v244 = *(void *)(a2 + v243);
                if (v244 == -1 || v244 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v245 = *(unsigned char *)(*(void *)(a2 + *v7) + v244);
                  *(void *)(a2 + v243) = v244 + 1;
                  v20 |= (unint64_t)(v245 & 0x7F) << v241;
                  if (v245 < 0)
                  {
                    v241 += 7;
                    BOOL v14 = v242++ >= 9;
                    if (v14)
                    {
                      uint64_t v20 = 0;
                      goto LABEL_878;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v20 = 0;
              }
LABEL_878:
              uint64_t v537 = 80;
              goto LABEL_1083;
            case 0x2Cu:
              char v246 = 0;
              unsigned int v247 = 0;
              uint64_t v20 = 0;
              *(void *)(a1 + 380) |= 0x20uLL;
              while (2)
              {
                uint64_t v248 = *v3;
                unint64_t v249 = *(void *)(a2 + v248);
                if (v249 == -1 || v249 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v250 = *(unsigned char *)(*(void *)(a2 + *v7) + v249);
                  *(void *)(a2 + v248) = v249 + 1;
                  v20 |= (unint64_t)(v250 & 0x7F) << v246;
                  if (v250 < 0)
                  {
                    v246 += 7;
                    BOOL v14 = v247++ >= 9;
                    if (v14)
                    {
                      uint64_t v20 = 0;
                      goto LABEL_882;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v20 = 0;
              }
LABEL_882:
              uint64_t v537 = 72;
              goto LABEL_1083;
            case 0x2Du:
              char v251 = 0;
              unsigned int v252 = 0;
              uint64_t v253 = 0;
              *(_DWORD *)(a1 + 388) |= 0x400u;
              while (2)
              {
                uint64_t v254 = *v3;
                unint64_t v255 = *(void *)(a2 + v254);
                if (v255 == -1 || v255 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v256 = *(unsigned char *)(*(void *)(a2 + *v7) + v255);
                  *(void *)(a2 + v254) = v255 + 1;
                  v253 |= (unint64_t)(v256 & 0x7F) << v251;
                  if (v256 < 0)
                  {
                    v251 += 7;
                    BOOL v14 = v252++ >= 9;
                    if (v14)
                    {
                      uint64_t v253 = 0;
                      goto LABEL_886;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v253 = 0;
              }
LABEL_886:
              BOOL v538 = v253 != 0;
              uint64_t v539 = 358;
              goto LABEL_1088;
            case 0x2Eu:
              char v257 = 0;
              unsigned int v258 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x8000000uLL;
              while (2)
              {
                uint64_t v259 = *v3;
                unint64_t v260 = *(void *)(a2 + v259);
                if (v260 == -1 || v260 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v261 = *(unsigned char *)(*(void *)(a2 + *v7) + v260);
                  *(void *)(a2 + v259) = v260 + 1;
                  v43 |= (unint64_t)(v261 & 0x7F) << v257;
                  if (v261 < 0)
                  {
                    v257 += 7;
                    BOOL v14 = v258++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_890;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_890:
              uint64_t v540 = 176;
              goto LABEL_1093;
            case 0x2Fu:
              char v262 = 0;
              unsigned int v263 = 0;
              uint64_t v264 = 0;
              *(_DWORD *)(a1 + 388) |= 0x4000000u;
              while (2)
              {
                uint64_t v265 = *v3;
                unint64_t v266 = *(void *)(a2 + v265);
                if (v266 == -1 || v266 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v267 = *(unsigned char *)(*(void *)(a2 + *v7) + v266);
                  *(void *)(a2 + v265) = v266 + 1;
                  v264 |= (unint64_t)(v267 & 0x7F) << v262;
                  if (v267 < 0)
                  {
                    v262 += 7;
                    BOOL v14 = v263++ >= 9;
                    if (v14)
                    {
                      uint64_t v264 = 0;
                      goto LABEL_894;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v264 = 0;
              }
LABEL_894:
              BOOL v538 = v264 != 0;
              uint64_t v539 = 374;
              goto LABEL_1088;
            case 0x30u:
              char v268 = 0;
              unsigned int v269 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x4000000000000uLL;
              while (2)
              {
                uint64_t v270 = *v3;
                unint64_t v271 = *(void *)(a2 + v270);
                if (v271 == -1 || v271 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v272 = *(unsigned char *)(*(void *)(a2 + *v7) + v271);
                  *(void *)(a2 + v270) = v271 + 1;
                  v43 |= (unint64_t)(v272 & 0x7F) << v268;
                  if (v272 < 0)
                  {
                    v268 += 7;
                    BOOL v14 = v269++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_898;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_898:
              uint64_t v540 = 280;
              goto LABEL_1093;
            case 0x31u:
              char v273 = 0;
              unsigned int v274 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x2000000000000uLL;
              while (2)
              {
                uint64_t v275 = *v3;
                unint64_t v276 = *(void *)(a2 + v275);
                if (v276 == -1 || v276 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v277 = *(unsigned char *)(*(void *)(a2 + *v7) + v276);
                  *(void *)(a2 + v275) = v276 + 1;
                  v43 |= (unint64_t)(v277 & 0x7F) << v273;
                  if (v277 < 0)
                  {
                    v273 += 7;
                    BOOL v14 = v274++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_902;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_902:
              uint64_t v540 = 276;
              goto LABEL_1093;
            case 0x32u:
              char v278 = 0;
              unsigned int v279 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x1000000000000uLL;
              while (2)
              {
                uint64_t v280 = *v3;
                unint64_t v281 = *(void *)(a2 + v280);
                if (v281 == -1 || v281 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v282 = *(unsigned char *)(*(void *)(a2 + *v7) + v281);
                  *(void *)(a2 + v280) = v281 + 1;
                  v43 |= (unint64_t)(v282 & 0x7F) << v278;
                  if (v282 < 0)
                  {
                    v278 += 7;
                    BOOL v14 = v279++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_906;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_906:
              uint64_t v540 = 272;
              goto LABEL_1093;
            case 0x33u:
              char v283 = 0;
              unsigned int v284 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x800000000000uLL;
              while (2)
              {
                uint64_t v285 = *v3;
                unint64_t v286 = *(void *)(a2 + v285);
                if (v286 == -1 || v286 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v287 = *(unsigned char *)(*(void *)(a2 + *v7) + v286);
                  *(void *)(a2 + v285) = v286 + 1;
                  v43 |= (unint64_t)(v287 & 0x7F) << v283;
                  if (v287 < 0)
                  {
                    v283 += 7;
                    BOOL v14 = v284++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_910;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_910:
              uint64_t v540 = 268;
              goto LABEL_1093;
            case 0x34u:
              char v288 = 0;
              unsigned int v289 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x400000uLL;
              while (2)
              {
                uint64_t v290 = *v3;
                unint64_t v291 = *(void *)(a2 + v290);
                if (v291 == -1 || v291 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v292 = *(unsigned char *)(*(void *)(a2 + *v7) + v291);
                  *(void *)(a2 + v290) = v291 + 1;
                  v43 |= (unint64_t)(v292 & 0x7F) << v288;
                  if (v292 < 0)
                  {
                    v288 += 7;
                    BOOL v14 = v289++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_914;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_914:
              uint64_t v540 = 156;
              goto LABEL_1093;
            case 0x35u:
              char v293 = 0;
              unsigned int v294 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x10000000000000uLL;
              while (2)
              {
                uint64_t v295 = *v3;
                unint64_t v296 = *(void *)(a2 + v295);
                if (v296 == -1 || v296 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v297 = *(unsigned char *)(*(void *)(a2 + *v7) + v296);
                  *(void *)(a2 + v295) = v296 + 1;
                  v43 |= (unint64_t)(v297 & 0x7F) << v293;
                  if (v297 < 0)
                  {
                    v293 += 7;
                    BOOL v14 = v294++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_918;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_918:
              uint64_t v540 = 288;
              goto LABEL_1093;
            case 0x36u:
              char v298 = 0;
              unsigned int v299 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x80000000000000uLL;
              while (2)
              {
                uint64_t v300 = *v3;
                unint64_t v301 = *(void *)(a2 + v300);
                if (v301 == -1 || v301 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v302 = *(unsigned char *)(*(void *)(a2 + *v7) + v301);
                  *(void *)(a2 + v300) = v301 + 1;
                  v43 |= (unint64_t)(v302 & 0x7F) << v298;
                  if (v302 < 0)
                  {
                    v298 += 7;
                    BOOL v14 = v299++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_922;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_922:
              uint64_t v540 = 300;
              goto LABEL_1093;
            case 0x37u:
              char v303 = 0;
              unsigned int v304 = 0;
              uint64_t v43 = 0;
              *(_DWORD *)(a1 + 388) |= 8u;
              while (2)
              {
                uint64_t v305 = *v3;
                unint64_t v306 = *(void *)(a2 + v305);
                if (v306 == -1 || v306 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v307 = *(unsigned char *)(*(void *)(a2 + *v7) + v306);
                  *(void *)(a2 + v305) = v306 + 1;
                  v43 |= (unint64_t)(v307 & 0x7F) << v303;
                  if (v307 < 0)
                  {
                    v303 += 7;
                    BOOL v14 = v304++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_926;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_926:
              uint64_t v540 = 348;
              goto LABEL_1093;
            case 0x38u:
              char v308 = 0;
              unsigned int v309 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x400000000uLL;
              while (2)
              {
                uint64_t v310 = *v3;
                unint64_t v311 = *(void *)(a2 + v310);
                if (v311 == -1 || v311 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v312 = *(unsigned char *)(*(void *)(a2 + *v7) + v311);
                  *(void *)(a2 + v310) = v311 + 1;
                  v43 |= (unint64_t)(v312 & 0x7F) << v308;
                  if (v312 < 0)
                  {
                    v308 += 7;
                    BOOL v14 = v309++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_930;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_930:
              uint64_t v540 = 216;
              goto LABEL_1093;
            case 0x39u:
              char v313 = 0;
              unsigned int v314 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x100000000uLL;
              while (2)
              {
                uint64_t v315 = *v3;
                unint64_t v316 = *(void *)(a2 + v315);
                if (v316 == -1 || v316 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v317 = *(unsigned char *)(*(void *)(a2 + *v7) + v316);
                  *(void *)(a2 + v315) = v316 + 1;
                  v43 |= (unint64_t)(v317 & 0x7F) << v313;
                  if (v317 < 0)
                  {
                    v313 += 7;
                    BOOL v14 = v314++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_934;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_934:
              uint64_t v540 = 208;
              goto LABEL_1093;
            case 0x3Au:
              char v318 = 0;
              unsigned int v319 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x200000000uLL;
              while (2)
              {
                uint64_t v320 = *v3;
                unint64_t v321 = *(void *)(a2 + v320);
                if (v321 == -1 || v321 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v322 = *(unsigned char *)(*(void *)(a2 + *v7) + v321);
                  *(void *)(a2 + v320) = v321 + 1;
                  v43 |= (unint64_t)(v322 & 0x7F) << v318;
                  if (v322 < 0)
                  {
                    v318 += 7;
                    BOOL v14 = v319++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_938;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_938:
              uint64_t v540 = 212;
              goto LABEL_1093;
            case 0x3Bu:
              char v323 = 0;
              unsigned int v324 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x80000000uLL;
              while (2)
              {
                uint64_t v325 = *v3;
                unint64_t v326 = *(void *)(a2 + v325);
                if (v326 == -1 || v326 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v327 = *(unsigned char *)(*(void *)(a2 + *v7) + v326);
                  *(void *)(a2 + v325) = v326 + 1;
                  v43 |= (unint64_t)(v327 & 0x7F) << v323;
                  if (v327 < 0)
                  {
                    v323 += 7;
                    BOOL v14 = v324++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_942;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_942:
              uint64_t v540 = 204;
              goto LABEL_1093;
            case 0x3Cu:
              char v328 = 0;
              unsigned int v329 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x40000000uLL;
              while (2)
              {
                uint64_t v330 = *v3;
                unint64_t v331 = *(void *)(a2 + v330);
                if (v331 == -1 || v331 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v332 = *(unsigned char *)(*(void *)(a2 + *v7) + v331);
                  *(void *)(a2 + v330) = v331 + 1;
                  v43 |= (unint64_t)(v332 & 0x7F) << v328;
                  if (v332 < 0)
                  {
                    v328 += 7;
                    BOOL v14 = v329++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_946;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_946:
              uint64_t v540 = 200;
              goto LABEL_1093;
            case 0x3Du:
              char v333 = 0;
              unsigned int v334 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x4000uLL;
              while (2)
              {
                uint64_t v335 = *v3;
                unint64_t v336 = *(void *)(a2 + v335);
                if (v336 == -1 || v336 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v337 = *(unsigned char *)(*(void *)(a2 + *v7) + v336);
                  *(void *)(a2 + v335) = v336 + 1;
                  v43 |= (unint64_t)(v337 & 0x7F) << v333;
                  if (v337 < 0)
                  {
                    v333 += 7;
                    BOOL v14 = v334++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_950;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_950:
              uint64_t v540 = 124;
              goto LABEL_1093;
            case 0x3Eu:
              char v338 = 0;
              unsigned int v339 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x1000uLL;
              while (2)
              {
                uint64_t v340 = *v3;
                unint64_t v341 = *(void *)(a2 + v340);
                if (v341 == -1 || v341 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v342 = *(unsigned char *)(*(void *)(a2 + *v7) + v341);
                  *(void *)(a2 + v340) = v341 + 1;
                  v43 |= (unint64_t)(v342 & 0x7F) << v338;
                  if (v342 < 0)
                  {
                    v338 += 7;
                    BOOL v14 = v339++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_954;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_954:
              uint64_t v540 = 116;
              goto LABEL_1093;
            case 0x3Fu:
              char v343 = 0;
              unsigned int v344 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x2000uLL;
              while (2)
              {
                uint64_t v345 = *v3;
                unint64_t v346 = *(void *)(a2 + v345);
                if (v346 == -1 || v346 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v347 = *(unsigned char *)(*(void *)(a2 + *v7) + v346);
                  *(void *)(a2 + v345) = v346 + 1;
                  v43 |= (unint64_t)(v347 & 0x7F) << v343;
                  if (v347 < 0)
                  {
                    v343 += 7;
                    BOOL v14 = v344++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_958;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_958:
              uint64_t v540 = 120;
              goto LABEL_1093;
            case 0x40u:
              char v348 = 0;
              unsigned int v349 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x800uLL;
              while (2)
              {
                uint64_t v350 = *v3;
                unint64_t v351 = *(void *)(a2 + v350);
                if (v351 == -1 || v351 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v352 = *(unsigned char *)(*(void *)(a2 + *v7) + v351);
                  *(void *)(a2 + v350) = v351 + 1;
                  v43 |= (unint64_t)(v352 & 0x7F) << v348;
                  if (v352 < 0)
                  {
                    v348 += 7;
                    BOOL v14 = v349++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_962;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_962:
              uint64_t v540 = 112;
              goto LABEL_1093;
            case 0x41u:
              char v353 = 0;
              unsigned int v354 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x400uLL;
              while (2)
              {
                uint64_t v355 = *v3;
                unint64_t v356 = *(void *)(a2 + v355);
                if (v356 == -1 || v356 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v357 = *(unsigned char *)(*(void *)(a2 + *v7) + v356);
                  *(void *)(a2 + v355) = v356 + 1;
                  v43 |= (unint64_t)(v357 & 0x7F) << v353;
                  if (v357 < 0)
                  {
                    v353 += 7;
                    BOOL v14 = v354++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_966;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_966:
              uint64_t v540 = 108;
              goto LABEL_1093;
            case 0x42u:
              char v358 = 0;
              unsigned int v359 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x1000000000000000uLL;
              while (2)
              {
                uint64_t v360 = *v3;
                unint64_t v361 = *(void *)(a2 + v360);
                if (v361 == -1 || v361 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v362 = *(unsigned char *)(*(void *)(a2 + *v7) + v361);
                  *(void *)(a2 + v360) = v361 + 1;
                  v43 |= (unint64_t)(v362 & 0x7F) << v358;
                  if (v362 < 0)
                  {
                    v358 += 7;
                    BOOL v14 = v359++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_970;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_970:
              uint64_t v540 = 320;
              goto LABEL_1093;
            case 0x43u:
              char v363 = 0;
              unsigned int v364 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x400000000000000uLL;
              while (2)
              {
                uint64_t v365 = *v3;
                unint64_t v366 = *(void *)(a2 + v365);
                if (v366 == -1 || v366 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v367 = *(unsigned char *)(*(void *)(a2 + *v7) + v366);
                  *(void *)(a2 + v365) = v366 + 1;
                  v43 |= (unint64_t)(v367 & 0x7F) << v363;
                  if (v367 < 0)
                  {
                    v363 += 7;
                    BOOL v14 = v364++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_974;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_974:
              uint64_t v540 = 312;
              goto LABEL_1093;
            case 0x44u:
              char v368 = 0;
              unsigned int v369 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x800000000000000uLL;
              while (2)
              {
                uint64_t v370 = *v3;
                unint64_t v371 = *(void *)(a2 + v370);
                if (v371 == -1 || v371 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v372 = *(unsigned char *)(*(void *)(a2 + *v7) + v371);
                  *(void *)(a2 + v370) = v371 + 1;
                  v43 |= (unint64_t)(v372 & 0x7F) << v368;
                  if (v372 < 0)
                  {
                    v368 += 7;
                    BOOL v14 = v369++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_978;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_978:
              uint64_t v540 = 316;
              goto LABEL_1093;
            case 0x45u:
              char v373 = 0;
              unsigned int v374 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x200000000000000uLL;
              while (2)
              {
                uint64_t v375 = *v3;
                unint64_t v376 = *(void *)(a2 + v375);
                if (v376 == -1 || v376 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v377 = *(unsigned char *)(*(void *)(a2 + *v7) + v376);
                  *(void *)(a2 + v375) = v376 + 1;
                  v43 |= (unint64_t)(v377 & 0x7F) << v373;
                  if (v377 < 0)
                  {
                    v373 += 7;
                    BOOL v14 = v374++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_982;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_982:
              uint64_t v540 = 308;
              goto LABEL_1093;
            case 0x46u:
              char v378 = 0;
              unsigned int v379 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x100000000000000uLL;
              while (2)
              {
                uint64_t v380 = *v3;
                unint64_t v381 = *(void *)(a2 + v380);
                if (v381 == -1 || v381 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v382 = *(unsigned char *)(*(void *)(a2 + *v7) + v381);
                  *(void *)(a2 + v380) = v381 + 1;
                  v43 |= (unint64_t)(v382 & 0x7F) << v378;
                  if (v382 < 0)
                  {
                    v378 += 7;
                    BOOL v14 = v379++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_986;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_986:
              uint64_t v540 = 304;
              goto LABEL_1093;
            case 0x47u:
              char v383 = 0;
              unsigned int v384 = 0;
              uint64_t v385 = 0;
              *(_DWORD *)(a1 + 388) |= 0x20u;
              while (2)
              {
                uint64_t v386 = *v3;
                unint64_t v387 = *(void *)(a2 + v386);
                if (v387 == -1 || v387 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v388 = *(unsigned char *)(*(void *)(a2 + *v7) + v387);
                  *(void *)(a2 + v386) = v387 + 1;
                  v385 |= (unint64_t)(v388 & 0x7F) << v383;
                  if (v388 < 0)
                  {
                    v383 += 7;
                    BOOL v14 = v384++ >= 9;
                    if (v14)
                    {
                      uint64_t v385 = 0;
                      goto LABEL_990;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v385 = 0;
              }
LABEL_990:
              BOOL v538 = v385 != 0;
              uint64_t v539 = 353;
              goto LABEL_1088;
            case 0x48u:
              char v389 = 0;
              unsigned int v390 = 0;
              uint64_t v391 = 0;
              *(_DWORD *)(a1 + 388) |= 0x80u;
              while (2)
              {
                uint64_t v392 = *v3;
                unint64_t v393 = *(void *)(a2 + v392);
                if (v393 == -1 || v393 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v394 = *(unsigned char *)(*(void *)(a2 + *v7) + v393);
                  *(void *)(a2 + v392) = v393 + 1;
                  v391 |= (unint64_t)(v394 & 0x7F) << v389;
                  if (v394 < 0)
                  {
                    v389 += 7;
                    BOOL v14 = v390++ >= 9;
                    if (v14)
                    {
                      uint64_t v391 = 0;
                      goto LABEL_994;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v391 = 0;
              }
LABEL_994:
              BOOL v538 = v391 != 0;
              uint64_t v539 = 355;
              goto LABEL_1088;
            case 0x49u:
              char v395 = 0;
              unsigned int v396 = 0;
              uint64_t v397 = 0;
              *(_DWORD *)(a1 + 388) |= 0x100u;
              while (2)
              {
                uint64_t v398 = *v3;
                unint64_t v399 = *(void *)(a2 + v398);
                if (v399 == -1 || v399 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v400 = *(unsigned char *)(*(void *)(a2 + *v7) + v399);
                  *(void *)(a2 + v398) = v399 + 1;
                  v397 |= (unint64_t)(v400 & 0x7F) << v395;
                  if (v400 < 0)
                  {
                    v395 += 7;
                    BOOL v14 = v396++ >= 9;
                    if (v14)
                    {
                      uint64_t v397 = 0;
                      goto LABEL_998;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v397 = 0;
              }
LABEL_998:
              BOOL v538 = v397 != 0;
              uint64_t v539 = 356;
              goto LABEL_1088;
            case 0x4Au:
              char v401 = 0;
              unsigned int v402 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x20000000uLL;
              while (2)
              {
                uint64_t v403 = *v3;
                unint64_t v404 = *(void *)(a2 + v403);
                if (v404 == -1 || v404 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v405 = *(unsigned char *)(*(void *)(a2 + *v7) + v404);
                  *(void *)(a2 + v403) = v404 + 1;
                  v43 |= (unint64_t)(v405 & 0x7F) << v401;
                  if (v405 < 0)
                  {
                    v401 += 7;
                    BOOL v14 = v402++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_1002;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_1002:
              uint64_t v540 = 196;
              goto LABEL_1093;
            case 0x4Bu:
              char v406 = 0;
              unsigned int v407 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x20000000000000uLL;
              while (2)
              {
                uint64_t v408 = *v3;
                unint64_t v409 = *(void *)(a2 + v408);
                if (v409 == -1 || v409 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v410 = *(unsigned char *)(*(void *)(a2 + *v7) + v409);
                  *(void *)(a2 + v408) = v409 + 1;
                  v43 |= (unint64_t)(v410 & 0x7F) << v406;
                  if (v410 < 0)
                  {
                    v406 += 7;
                    BOOL v14 = v407++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_1006;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_1006:
              uint64_t v540 = 292;
              goto LABEL_1093;
            case 0x4Cu:
              uint64_t v411 = PBReaderReadString();
              v412 = *(void **)(a1 + 184);
              *(void *)(a1 + 184) = v411;

              goto LABEL_1094;
            case 0x4Du:
              char v413 = 0;
              unsigned int v414 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x10000000uLL;
              while (2)
              {
                uint64_t v415 = *v3;
                unint64_t v416 = *(void *)(a2 + v415);
                if (v416 == -1 || v416 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v417 = *(unsigned char *)(*(void *)(a2 + *v7) + v416);
                  *(void *)(a2 + v415) = v416 + 1;
                  v43 |= (unint64_t)(v417 & 0x7F) << v413;
                  if (v417 < 0)
                  {
                    v413 += 7;
                    BOOL v14 = v414++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_1010;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_1010:
              uint64_t v540 = 192;
              goto LABEL_1093;
            case 0x4Eu:
              char v418 = 0;
              unsigned int v419 = 0;
              uint64_t v420 = 0;
              *(_DWORD *)(a1 + 388) |= 0x20000u;
              while (2)
              {
                uint64_t v421 = *v3;
                unint64_t v422 = *(void *)(a2 + v421);
                if (v422 == -1 || v422 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v423 = *(unsigned char *)(*(void *)(a2 + *v7) + v422);
                  *(void *)(a2 + v421) = v422 + 1;
                  v420 |= (unint64_t)(v423 & 0x7F) << v418;
                  if (v423 < 0)
                  {
                    v418 += 7;
                    BOOL v14 = v419++ >= 9;
                    if (v14)
                    {
                      uint64_t v420 = 0;
                      goto LABEL_1014;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v420 = 0;
              }
LABEL_1014:
              BOOL v538 = v420 != 0;
              uint64_t v539 = 365;
              goto LABEL_1088;
            case 0x4Fu:
              char v424 = 0;
              unsigned int v425 = 0;
              uint64_t v426 = 0;
              *(_DWORD *)(a1 + 388) |= 0x4000u;
              while (2)
              {
                uint64_t v427 = *v3;
                unint64_t v428 = *(void *)(a2 + v427);
                if (v428 == -1 || v428 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v429 = *(unsigned char *)(*(void *)(a2 + *v7) + v428);
                  *(void *)(a2 + v427) = v428 + 1;
                  v426 |= (unint64_t)(v429 & 0x7F) << v424;
                  if (v429 < 0)
                  {
                    v424 += 7;
                    BOOL v14 = v425++ >= 9;
                    if (v14)
                    {
                      uint64_t v426 = 0;
                      goto LABEL_1018;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v426 = 0;
              }
LABEL_1018:
              BOOL v538 = v426 != 0;
              uint64_t v539 = 362;
              goto LABEL_1088;
            case 0x50u:
              char v430 = 0;
              unsigned int v431 = 0;
              uint64_t v432 = 0;
              *(_DWORD *)(a1 + 388) |= 0x8000u;
              while (2)
              {
                uint64_t v433 = *v3;
                unint64_t v434 = *(void *)(a2 + v433);
                if (v434 == -1 || v434 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v435 = *(unsigned char *)(*(void *)(a2 + *v7) + v434);
                  *(void *)(a2 + v433) = v434 + 1;
                  v432 |= (unint64_t)(v435 & 0x7F) << v430;
                  if (v435 < 0)
                  {
                    v430 += 7;
                    BOOL v14 = v431++ >= 9;
                    if (v14)
                    {
                      uint64_t v432 = 0;
                      goto LABEL_1022;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v432 = 0;
              }
LABEL_1022:
              BOOL v538 = v432 != 0;
              uint64_t v539 = 363;
              goto LABEL_1088;
            case 0x51u:
              char v436 = 0;
              unsigned int v437 = 0;
              uint64_t v438 = 0;
              *(_DWORD *)(a1 + 388) |= 0x200000u;
              while (2)
              {
                uint64_t v439 = *v3;
                unint64_t v440 = *(void *)(a2 + v439);
                if (v440 == -1 || v440 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v441 = *(unsigned char *)(*(void *)(a2 + *v7) + v440);
                  *(void *)(a2 + v439) = v440 + 1;
                  v438 |= (unint64_t)(v441 & 0x7F) << v436;
                  if (v441 < 0)
                  {
                    v436 += 7;
                    BOOL v14 = v437++ >= 9;
                    if (v14)
                    {
                      uint64_t v438 = 0;
                      goto LABEL_1026;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v438 = 0;
              }
LABEL_1026:
              BOOL v538 = v438 != 0;
              uint64_t v539 = 369;
              goto LABEL_1088;
            case 0x52u:
              char v442 = 0;
              unsigned int v443 = 0;
              uint64_t v444 = 0;
              *(_DWORD *)(a1 + 388) |= 0x10000u;
              while (2)
              {
                uint64_t v445 = *v3;
                unint64_t v446 = *(void *)(a2 + v445);
                if (v446 == -1 || v446 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v447 = *(unsigned char *)(*(void *)(a2 + *v7) + v446);
                  *(void *)(a2 + v445) = v446 + 1;
                  v444 |= (unint64_t)(v447 & 0x7F) << v442;
                  if (v447 < 0)
                  {
                    v442 += 7;
                    BOOL v14 = v443++ >= 9;
                    if (v14)
                    {
                      uint64_t v444 = 0;
                      goto LABEL_1030;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v444 = 0;
              }
LABEL_1030:
              BOOL v538 = v444 != 0;
              uint64_t v539 = 364;
              goto LABEL_1088;
            case 0x53u:
              char v448 = 0;
              unsigned int v449 = 0;
              uint64_t v450 = 0;
              *(_DWORD *)(a1 + 388) |= 0x2000u;
              while (2)
              {
                uint64_t v451 = *v3;
                unint64_t v452 = *(void *)(a2 + v451);
                if (v452 == -1 || v452 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v453 = *(unsigned char *)(*(void *)(a2 + *v7) + v452);
                  *(void *)(a2 + v451) = v452 + 1;
                  v450 |= (unint64_t)(v453 & 0x7F) << v448;
                  if (v453 < 0)
                  {
                    v448 += 7;
                    BOOL v14 = v449++ >= 9;
                    if (v14)
                    {
                      uint64_t v450 = 0;
                      goto LABEL_1034;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v450 = 0;
              }
LABEL_1034:
              BOOL v538 = v450 != 0;
              uint64_t v539 = 361;
              goto LABEL_1088;
            case 0x54u:
              char v454 = 0;
              unsigned int v455 = 0;
              uint64_t v456 = 0;
              *(_DWORD *)(a1 + 388) |= 0x1000u;
              while (2)
              {
                uint64_t v457 = *v3;
                unint64_t v458 = *(void *)(a2 + v457);
                if (v458 == -1 || v458 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v459 = *(unsigned char *)(*(void *)(a2 + *v7) + v458);
                  *(void *)(a2 + v457) = v458 + 1;
                  v456 |= (unint64_t)(v459 & 0x7F) << v454;
                  if (v459 < 0)
                  {
                    v454 += 7;
                    BOOL v14 = v455++ >= 9;
                    if (v14)
                    {
                      uint64_t v456 = 0;
                      goto LABEL_1038;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v456 = 0;
              }
LABEL_1038:
              BOOL v538 = v456 != 0;
              uint64_t v539 = 360;
              goto LABEL_1088;
            case 0x55u:
              char v460 = 0;
              unsigned int v461 = 0;
              uint64_t v462 = 0;
              *(_DWORD *)(a1 + 388) |= 0x80000u;
              while (2)
              {
                uint64_t v463 = *v3;
                unint64_t v464 = *(void *)(a2 + v463);
                if (v464 == -1 || v464 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v465 = *(unsigned char *)(*(void *)(a2 + *v7) + v464);
                  *(void *)(a2 + v463) = v464 + 1;
                  v462 |= (unint64_t)(v465 & 0x7F) << v460;
                  if (v465 < 0)
                  {
                    v460 += 7;
                    BOOL v14 = v461++ >= 9;
                    if (v14)
                    {
                      uint64_t v462 = 0;
                      goto LABEL_1042;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v462 = 0;
              }
LABEL_1042:
              BOOL v538 = v462 != 0;
              uint64_t v539 = 367;
              goto LABEL_1088;
            case 0x56u:
              char v466 = 0;
              unsigned int v467 = 0;
              uint64_t v468 = 0;
              *(_DWORD *)(a1 + 388) |= 0x800u;
              while (2)
              {
                uint64_t v469 = *v3;
                unint64_t v470 = *(void *)(a2 + v469);
                if (v470 == -1 || v470 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v471 = *(unsigned char *)(*(void *)(a2 + *v7) + v470);
                  *(void *)(a2 + v469) = v470 + 1;
                  v468 |= (unint64_t)(v471 & 0x7F) << v466;
                  if (v471 < 0)
                  {
                    v466 += 7;
                    BOOL v14 = v467++ >= 9;
                    if (v14)
                    {
                      uint64_t v468 = 0;
                      goto LABEL_1046;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v468 = 0;
              }
LABEL_1046:
              BOOL v538 = v468 != 0;
              uint64_t v539 = 359;
              goto LABEL_1088;
            case 0x57u:
              char v472 = 0;
              unsigned int v473 = 0;
              uint64_t v20 = 0;
              *(void *)(a1 + 380) |= 8uLL;
              while (2)
              {
                uint64_t v474 = *v3;
                unint64_t v475 = *(void *)(a2 + v474);
                if (v475 == -1 || v475 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v476 = *(unsigned char *)(*(void *)(a2 + *v7) + v475);
                  *(void *)(a2 + v474) = v475 + 1;
                  v20 |= (unint64_t)(v476 & 0x7F) << v472;
                  if (v476 < 0)
                  {
                    v472 += 7;
                    BOOL v14 = v473++ >= 9;
                    if (v14)
                    {
                      uint64_t v20 = 0;
                      goto LABEL_1050;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v20 = 0;
              }
LABEL_1050:
              uint64_t v537 = 56;
              goto LABEL_1083;
            case 0x58u:
              char v477 = 0;
              unsigned int v478 = 0;
              uint64_t v479 = 0;
              *(_DWORD *)(a1 + 388) |= 0x200u;
              while (2)
              {
                uint64_t v480 = *v3;
                unint64_t v481 = *(void *)(a2 + v480);
                if (v481 == -1 || v481 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v482 = *(unsigned char *)(*(void *)(a2 + *v7) + v481);
                  *(void *)(a2 + v480) = v481 + 1;
                  v479 |= (unint64_t)(v482 & 0x7F) << v477;
                  if (v482 < 0)
                  {
                    v477 += 7;
                    BOOL v14 = v478++ >= 9;
                    if (v14)
                    {
                      uint64_t v479 = 0;
                      goto LABEL_1054;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v479 = 0;
              }
LABEL_1054:
              BOOL v538 = v479 != 0;
              uint64_t v539 = 357;
              goto LABEL_1088;
            case 0x59u:
              if (v16 == 2)
              {
                uint64_t result = PBReaderPlaceMark();
                if (!result) {
                  return result;
                }
                while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
                {
                  char v483 = 0;
                  unsigned int v484 = 0;
                  uint64_t v485 = 0;
                  while (1)
                  {
                    uint64_t v486 = *v3;
                    unint64_t v487 = *(void *)(a2 + v486);
                    if (v487 == -1 || v487 >= *(void *)(a2 + *v4)) {
                      break;
                    }
                    char v488 = *(unsigned char *)(*(void *)(a2 + *v7) + v487);
                    *(void *)(a2 + v486) = v487 + 1;
                    v485 |= (unint64_t)(v488 & 0x7F) << v483;
                    if (v488 < 0)
                    {
                      v483 += 7;
                      BOOL v14 = v484++ >= 9;
                      if (!v14) {
                        continue;
                      }
                    }
                    goto LABEL_643;
                  }
                  *(unsigned char *)(a2 + *v5) = 1;
LABEL_643:
                  PBRepeatedUInt64Add();
                }
                PBReaderRecallMark();
              }
              else
              {
                char v541 = 0;
                unsigned int v542 = 0;
                uint64_t v543 = 0;
                while (1)
                {
                  uint64_t v544 = *v3;
                  unint64_t v545 = *(void *)(a2 + v544);
                  if (v545 == -1 || v545 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v546 = *(unsigned char *)(*(void *)(a2 + *v7) + v545);
                  *(void *)(a2 + v544) = v545 + 1;
                  v543 |= (unint64_t)(v546 & 0x7F) << v541;
                  if (v546 < 0)
                  {
                    v541 += 7;
                    BOOL v14 = v542++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_1105;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_1105:
                PBRepeatedUInt64Add();
              }
LABEL_1094:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
            case 0x5Au:
              char v489 = 0;
              unsigned int v490 = 0;
              uint64_t v491 = 0;
              *(_DWORD *)(a1 + 388) |= 0x800000u;
              while (2)
              {
                uint64_t v492 = *v3;
                unint64_t v493 = *(void *)(a2 + v492);
                if (v493 == -1 || v493 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v494 = *(unsigned char *)(*(void *)(a2 + *v7) + v493);
                  *(void *)(a2 + v492) = v493 + 1;
                  v491 |= (unint64_t)(v494 & 0x7F) << v489;
                  if (v494 < 0)
                  {
                    v489 += 7;
                    BOOL v14 = v490++ >= 9;
                    if (v14)
                    {
                      uint64_t v491 = 0;
                      goto LABEL_1058;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v491 = 0;
              }
LABEL_1058:
              BOOL v538 = v491 != 0;
              uint64_t v539 = 371;
              goto LABEL_1088;
            case 0x5Bu:
              char v495 = 0;
              unsigned int v496 = 0;
              uint64_t v497 = 0;
              *(_DWORD *)(a1 + 388) |= 0x100000u;
              while (2)
              {
                uint64_t v498 = *v3;
                unint64_t v499 = *(void *)(a2 + v498);
                if (v499 == -1 || v499 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v500 = *(unsigned char *)(*(void *)(a2 + *v7) + v499);
                  *(void *)(a2 + v498) = v499 + 1;
                  v497 |= (unint64_t)(v500 & 0x7F) << v495;
                  if (v500 < 0)
                  {
                    v495 += 7;
                    BOOL v14 = v496++ >= 9;
                    if (v14)
                    {
                      uint64_t v497 = 0;
                      goto LABEL_1062;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v497 = 0;
              }
LABEL_1062:
              BOOL v538 = v497 != 0;
              uint64_t v539 = 368;
              goto LABEL_1088;
            case 0x5Cu:
              char v501 = 0;
              unsigned int v502 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x80000000000uLL;
              while (2)
              {
                uint64_t v503 = *v3;
                unint64_t v504 = *(void *)(a2 + v503);
                if (v504 == -1 || v504 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v505 = *(unsigned char *)(*(void *)(a2 + *v7) + v504);
                  *(void *)(a2 + v503) = v504 + 1;
                  v43 |= (unint64_t)(v505 & 0x7F) << v501;
                  if (v505 < 0)
                  {
                    v501 += 7;
                    BOOL v14 = v502++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_1066;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_1066:
              uint64_t v540 = 252;
              goto LABEL_1093;
            case 0x5Du:
              char v506 = 0;
              unsigned int v507 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x100000000000uLL;
              while (2)
              {
                uint64_t v508 = *v3;
                unint64_t v509 = *(void *)(a2 + v508);
                if (v509 == -1 || v509 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v510 = *(unsigned char *)(*(void *)(a2 + *v7) + v509);
                  *(void *)(a2 + v508) = v509 + 1;
                  v43 |= (unint64_t)(v510 & 0x7F) << v506;
                  if (v510 < 0)
                  {
                    v506 += 7;
                    BOOL v14 = v507++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_1070;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_1070:
              uint64_t v540 = 256;
              goto LABEL_1093;
            case 0x5Eu:
              char v511 = 0;
              unsigned int v512 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x400000000000uLL;
              while (2)
              {
                uint64_t v513 = *v3;
                unint64_t v514 = *(void *)(a2 + v513);
                if (v514 == -1 || v514 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v515 = *(unsigned char *)(*(void *)(a2 + *v7) + v514);
                  *(void *)(a2 + v513) = v514 + 1;
                  v43 |= (unint64_t)(v515 & 0x7F) << v511;
                  if (v515 < 0)
                  {
                    v511 += 7;
                    BOOL v14 = v512++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_1074;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_1074:
              uint64_t v540 = 264;
              goto LABEL_1093;
            case 0x5Fu:
              char v516 = 0;
              unsigned int v517 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x200000000000uLL;
              while (2)
              {
                uint64_t v518 = *v3;
                unint64_t v519 = *(void *)(a2 + v518);
                if (v519 == -1 || v519 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v520 = *(unsigned char *)(*(void *)(a2 + *v7) + v519);
                  *(void *)(a2 + v518) = v519 + 1;
                  v43 |= (unint64_t)(v520 & 0x7F) << v516;
                  if (v520 < 0)
                  {
                    v516 += 7;
                    BOOL v14 = v517++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_1078;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_1078:
              uint64_t v540 = 260;
              goto LABEL_1093;
            case 0x60u:
              char v521 = 0;
              unsigned int v522 = 0;
              uint64_t v20 = 0;
              *(void *)(a1 + 380) |= 0x80uLL;
              while (2)
              {
                uint64_t v523 = *v3;
                unint64_t v524 = *(void *)(a2 + v523);
                if (v524 == -1 || v524 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v525 = *(unsigned char *)(*(void *)(a2 + *v7) + v524);
                  *(void *)(a2 + v523) = v524 + 1;
                  v20 |= (unint64_t)(v525 & 0x7F) << v521;
                  if (v525 < 0)
                  {
                    v521 += 7;
                    BOOL v14 = v522++ >= 9;
                    if (v14)
                    {
                      uint64_t v20 = 0;
                      goto LABEL_1082;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v20 = 0;
              }
LABEL_1082:
              uint64_t v537 = 88;
LABEL_1083:
              *(void *)(a1 + v537) = v20;
              goto LABEL_1094;
            case 0x61u:
              char v526 = 0;
              unsigned int v527 = 0;
              uint64_t v528 = 0;
              *(_DWORD *)(a1 + 388) |= 0x40000u;
              while (2)
              {
                uint64_t v529 = *v3;
                unint64_t v530 = *(void *)(a2 + v529);
                if (v530 == -1 || v530 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v531 = *(unsigned char *)(*(void *)(a2 + *v7) + v530);
                  *(void *)(a2 + v529) = v530 + 1;
                  v528 |= (unint64_t)(v531 & 0x7F) << v526;
                  if (v531 < 0)
                  {
                    v526 += 7;
                    BOOL v14 = v527++ >= 9;
                    if (v14)
                    {
                      uint64_t v528 = 0;
                      goto LABEL_1087;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v528 = 0;
              }
LABEL_1087:
              BOOL v538 = v528 != 0;
              uint64_t v539 = 366;
LABEL_1088:
              *(unsigned char *)(a1 + v539) = v538;
              goto LABEL_1094;
            case 0x62u:
              char v532 = 0;
              unsigned int v533 = 0;
              uint64_t v43 = 0;
              *(void *)(a1 + 380) |= 0x40000000000000uLL;
              while (2)
              {
                uint64_t v534 = *v3;
                unint64_t v535 = *(void *)(a2 + v534);
                if (v535 == -1 || v535 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v536 = *(unsigned char *)(*(void *)(a2 + *v7) + v535);
                  *(void *)(a2 + v534) = v535 + 1;
                  v43 |= (unint64_t)(v536 & 0x7F) << v532;
                  if (v536 < 0)
                  {
                    v532 += 7;
                    BOOL v14 = v533++ >= 9;
                    if (v14)
                    {
                      LODWORD(v43) = 0;
                      goto LABEL_1092;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v43) = 0;
              }
LABEL_1092:
              uint64_t v540 = 296;
LABEL_1093:
              *(_DWORD *)(a1 + v540) = v43;
              goto LABEL_1094;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
              goto LABEL_1094;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t addDirectoryEntrySize(uint64_t a1, uint64_t a2)
{
  __directorySize += *(void *)(a2 + 96);
  return 0;
}

uint64_t AWDBiometricKitFaceDetectAttemptReadFrom(uint64_t a1, uint64_t a2)
{
  SEL v3 = (int *)MEMORY[0x263F62298];
  unint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 120) |= 2uLL;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_267;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_269;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_267:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_269:
          uint64_t v208 = 16;
          goto LABEL_274;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 120) |= 1uLL;
          while (2)
          {
            uint64_t v26 = *v3;
            unint64_t v27 = *(void *)(a2 + v26);
            if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
              *(void *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_273;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_273:
          uint64_t v208 = 8;
LABEL_274:
          *(void *)(a1 + v208) = v19;
          continue;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x2000uLL;
          while (2)
          {
            uint64_t v32 = *v3;
            unint64_t v33 = *(void *)(a2 + v32);
            if (v33 == -1 || v33 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
              *(void *)(a2 + v32) = v33 + 1;
              v31 |= (unint64_t)(v34 & 0x7F) << v29;
              if (v34 < 0)
              {
                v29 += 7;
                BOOL v14 = v30++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_278;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_278:
          uint64_t v209 = 68;
          goto LABEL_403;
        case 4u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x200uLL;
          while (2)
          {
            uint64_t v37 = *v3;
            unint64_t v38 = *(void *)(a2 + v37);
            if (v38 == -1 || v38 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v39 = *(unsigned char *)(*(void *)(a2 + *v7) + v38);
              *(void *)(a2 + v37) = v38 + 1;
              v31 |= (unint64_t)(v39 & 0x7F) << v35;
              if (v39 < 0)
              {
                v35 += 7;
                BOOL v14 = v36++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_282;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_282:
          uint64_t v209 = 52;
          goto LABEL_403;
        case 5u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x800uLL;
          while (2)
          {
            uint64_t v42 = *v3;
            unint64_t v43 = *(void *)(a2 + v42);
            if (v43 == -1 || v43 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v43);
              *(void *)(a2 + v42) = v43 + 1;
              v31 |= (unint64_t)(v44 & 0x7F) << v40;
              if (v44 < 0)
              {
                v40 += 7;
                BOOL v14 = v41++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_286;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_286:
          uint64_t v209 = 60;
          goto LABEL_403;
        case 6u:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x1000uLL;
          while (2)
          {
            uint64_t v47 = *v3;
            unint64_t v48 = *(void *)(a2 + v47);
            if (v48 == -1 || v48 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
              *(void *)(a2 + v47) = v48 + 1;
              v31 |= (unint64_t)(v49 & 0x7F) << v45;
              if (v49 < 0)
              {
                v45 += 7;
                BOOL v14 = v46++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_290;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_290:
          uint64_t v209 = 64;
          goto LABEL_403;
        case 7u:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x400uLL;
          while (2)
          {
            uint64_t v52 = *v3;
            unint64_t v53 = *(void *)(a2 + v52);
            if (v53 == -1 || v53 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v54 = *(unsigned char *)(*(void *)(a2 + *v7) + v53);
              *(void *)(a2 + v52) = v53 + 1;
              v31 |= (unint64_t)(v54 & 0x7F) << v50;
              if (v54 < 0)
              {
                v50 += 7;
                BOOL v14 = v51++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_294;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_294:
          uint64_t v209 = 56;
          goto LABEL_403;
        case 8u:
          char v55 = 0;
          unsigned int v56 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 4uLL;
          while (2)
          {
            uint64_t v57 = *v3;
            unint64_t v58 = *(void *)(a2 + v57);
            if (v58 == -1 || v58 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v59 = *(unsigned char *)(*(void *)(a2 + *v7) + v58);
              *(void *)(a2 + v57) = v58 + 1;
              v31 |= (unint64_t)(v59 & 0x7F) << v55;
              if (v59 < 0)
              {
                v55 += 7;
                BOOL v14 = v56++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_298;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_298:
          uint64_t v209 = 24;
          goto LABEL_403;
        case 9u:
          char v60 = 0;
          unsigned int v61 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x80uLL;
          while (2)
          {
            uint64_t v62 = *v3;
            unint64_t v63 = *(void *)(a2 + v62);
            if (v63 == -1 || v63 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v64 = *(unsigned char *)(*(void *)(a2 + *v7) + v63);
              *(void *)(a2 + v62) = v63 + 1;
              v31 |= (unint64_t)(v64 & 0x7F) << v60;
              if (v64 < 0)
              {
                v60 += 7;
                BOOL v14 = v61++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_302;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_302:
          uint64_t v209 = 44;
          goto LABEL_403;
        case 0xAu:
          char v65 = 0;
          unsigned int v66 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x200000uLL;
          while (2)
          {
            uint64_t v67 = *v3;
            unint64_t v68 = *(void *)(a2 + v67);
            if (v68 == -1 || v68 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v69 = *(unsigned char *)(*(void *)(a2 + *v7) + v68);
              *(void *)(a2 + v67) = v68 + 1;
              v31 |= (unint64_t)(v69 & 0x7F) << v65;
              if (v69 < 0)
              {
                v65 += 7;
                BOOL v14 = v66++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_306;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_306:
          uint64_t v209 = 100;
          goto LABEL_403;
        case 0xBu:
          char v70 = 0;
          unsigned int v71 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x4000uLL;
          while (2)
          {
            uint64_t v72 = *v3;
            unint64_t v73 = *(void *)(a2 + v72);
            if (v73 == -1 || v73 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v74 = *(unsigned char *)(*(void *)(a2 + *v7) + v73);
              *(void *)(a2 + v72) = v73 + 1;
              v31 |= (unint64_t)(v74 & 0x7F) << v70;
              if (v74 < 0)
              {
                v70 += 7;
                BOOL v14 = v71++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_310;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_310:
          uint64_t v209 = 72;
          goto LABEL_403;
        case 0xCu:
          char v75 = 0;
          unsigned int v76 = 0;
          uint64_t v77 = 0;
          *(void *)(a1 + 120) |= 0x400000000uLL;
          while (2)
          {
            uint64_t v78 = *v3;
            unint64_t v79 = *(void *)(a2 + v78);
            if (v79 == -1 || v79 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v80 = *(unsigned char *)(*(void *)(a2 + *v7) + v79);
              *(void *)(a2 + v78) = v79 + 1;
              v77 |= (unint64_t)(v80 & 0x7F) << v75;
              if (v80 < 0)
              {
                v75 += 7;
                BOOL v14 = v76++ >= 9;
                if (v14)
                {
                  uint64_t v77 = 0;
                  goto LABEL_314;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v77 = 0;
          }
LABEL_314:
          BOOL v210 = v77 != 0;
          uint64_t v211 = 116;
          goto LABEL_408;
        case 0xDu:
          char v81 = 0;
          unsigned int v82 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x20uLL;
          while (2)
          {
            uint64_t v83 = *v3;
            unint64_t v84 = *(void *)(a2 + v83);
            if (v84 == -1 || v84 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v85 = *(unsigned char *)(*(void *)(a2 + *v7) + v84);
              *(void *)(a2 + v83) = v84 + 1;
              v31 |= (unint64_t)(v85 & 0x7F) << v81;
              if (v85 < 0)
              {
                v81 += 7;
                BOOL v14 = v82++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_318;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_318:
          uint64_t v209 = 36;
          goto LABEL_403;
        case 0xEu:
          char v86 = 0;
          unsigned int v87 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x40uLL;
          while (2)
          {
            uint64_t v88 = *v3;
            unint64_t v89 = *(void *)(a2 + v88);
            if (v89 == -1 || v89 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v90 = *(unsigned char *)(*(void *)(a2 + *v7) + v89);
              *(void *)(a2 + v88) = v89 + 1;
              v31 |= (unint64_t)(v90 & 0x7F) << v86;
              if (v90 < 0)
              {
                v86 += 7;
                BOOL v14 = v87++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_322;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_322:
          uint64_t v209 = 40;
          goto LABEL_403;
        case 0xFu:
          char v91 = 0;
          unsigned int v92 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x10uLL;
          while (2)
          {
            uint64_t v93 = *v3;
            unint64_t v94 = *(void *)(a2 + v93);
            if (v94 == -1 || v94 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v95 = *(unsigned char *)(*(void *)(a2 + *v7) + v94);
              *(void *)(a2 + v93) = v94 + 1;
              v31 |= (unint64_t)(v95 & 0x7F) << v91;
              if (v95 < 0)
              {
                v91 += 7;
                BOOL v14 = v92++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_326;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_326:
          uint64_t v209 = 32;
          goto LABEL_403;
        case 0x10u:
          char v96 = 0;
          unsigned int v97 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 8uLL;
          while (2)
          {
            uint64_t v98 = *v3;
            unint64_t v99 = *(void *)(a2 + v98);
            if (v99 == -1 || v99 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v100 = *(unsigned char *)(*(void *)(a2 + *v7) + v99);
              *(void *)(a2 + v98) = v99 + 1;
              v31 |= (unint64_t)(v100 & 0x7F) << v96;
              if (v100 < 0)
              {
                v96 += 7;
                BOOL v14 = v97++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_330;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_330:
          uint64_t v209 = 28;
          goto LABEL_403;
        case 0x11u:
          char v101 = 0;
          unsigned int v102 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x100000uLL;
          while (2)
          {
            uint64_t v103 = *v3;
            unint64_t v104 = *(void *)(a2 + v103);
            if (v104 == -1 || v104 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v105 = *(unsigned char *)(*(void *)(a2 + *v7) + v104);
              *(void *)(a2 + v103) = v104 + 1;
              v31 |= (unint64_t)(v105 & 0x7F) << v101;
              if (v105 < 0)
              {
                v101 += 7;
                BOOL v14 = v102++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_334;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_334:
          uint64_t v209 = 96;
          goto LABEL_403;
        case 0x12u:
          char v106 = 0;
          unsigned int v107 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x80000uLL;
          while (2)
          {
            uint64_t v108 = *v3;
            unint64_t v109 = *(void *)(a2 + v108);
            if (v109 == -1 || v109 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v110 = *(unsigned char *)(*(void *)(a2 + *v7) + v109);
              *(void *)(a2 + v108) = v109 + 1;
              v31 |= (unint64_t)(v110 & 0x7F) << v106;
              if (v110 < 0)
              {
                v106 += 7;
                BOOL v14 = v107++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_338;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_338:
          uint64_t v209 = 92;
          goto LABEL_403;
        case 0x13u:
          char v111 = 0;
          unsigned int v112 = 0;
          uint64_t v113 = 0;
          *(void *)(a1 + 120) |= 0x200000000uLL;
          while (2)
          {
            uint64_t v114 = *v3;
            unint64_t v115 = *(void *)(a2 + v114);
            if (v115 == -1 || v115 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v116 = *(unsigned char *)(*(void *)(a2 + *v7) + v115);
              *(void *)(a2 + v114) = v115 + 1;
              v113 |= (unint64_t)(v116 & 0x7F) << v111;
              if (v116 < 0)
              {
                v111 += 7;
                BOOL v14 = v112++ >= 9;
                if (v14)
                {
                  uint64_t v113 = 0;
                  goto LABEL_342;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v113 = 0;
          }
LABEL_342:
          BOOL v210 = v113 != 0;
          uint64_t v211 = 115;
          goto LABEL_408;
        case 0x14u:
          char v117 = 0;
          unsigned int v118 = 0;
          uint64_t v119 = 0;
          *(void *)(a1 + 120) |= 0x400000uLL;
          while (2)
          {
            uint64_t v120 = *v3;
            unint64_t v121 = *(void *)(a2 + v120);
            if (v121 == -1 || v121 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v122 = *(unsigned char *)(*(void *)(a2 + *v7) + v121);
              *(void *)(a2 + v120) = v121 + 1;
              v119 |= (unint64_t)(v122 & 0x7F) << v117;
              if (v122 < 0)
              {
                v117 += 7;
                BOOL v14 = v118++ >= 9;
                if (v14)
                {
                  uint64_t v119 = 0;
                  goto LABEL_346;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v119 = 0;
          }
LABEL_346:
          BOOL v210 = v119 != 0;
          uint64_t v211 = 104;
          goto LABEL_408;
        case 0x15u:
          char v123 = 0;
          unsigned int v124 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x100uLL;
          while (2)
          {
            uint64_t v125 = *v3;
            unint64_t v126 = *(void *)(a2 + v125);
            if (v126 == -1 || v126 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v127 = *(unsigned char *)(*(void *)(a2 + *v7) + v126);
              *(void *)(a2 + v125) = v126 + 1;
              v31 |= (unint64_t)(v127 & 0x7F) << v123;
              if (v127 < 0)
              {
                v123 += 7;
                BOOL v14 = v124++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_350;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_350:
          uint64_t v209 = 48;
          goto LABEL_403;
        case 0x16u:
          char v128 = 0;
          unsigned int v129 = 0;
          uint64_t v130 = 0;
          *(void *)(a1 + 120) |= 0x10000000uLL;
          while (2)
          {
            uint64_t v131 = *v3;
            unint64_t v132 = *(void *)(a2 + v131);
            if (v132 == -1 || v132 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v133 = *(unsigned char *)(*(void *)(a2 + *v7) + v132);
              *(void *)(a2 + v131) = v132 + 1;
              v130 |= (unint64_t)(v133 & 0x7F) << v128;
              if (v133 < 0)
              {
                v128 += 7;
                BOOL v14 = v129++ >= 9;
                if (v14)
                {
                  uint64_t v130 = 0;
                  goto LABEL_354;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v130 = 0;
          }
LABEL_354:
          BOOL v210 = v130 != 0;
          uint64_t v211 = 110;
          goto LABEL_408;
        case 0x17u:
          char v134 = 0;
          unsigned int v135 = 0;
          uint64_t v136 = 0;
          *(void *)(a1 + 120) |= 0x2000000uLL;
          while (2)
          {
            uint64_t v137 = *v3;
            unint64_t v138 = *(void *)(a2 + v137);
            if (v138 == -1 || v138 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v139 = *(unsigned char *)(*(void *)(a2 + *v7) + v138);
              *(void *)(a2 + v137) = v138 + 1;
              v136 |= (unint64_t)(v139 & 0x7F) << v134;
              if (v139 < 0)
              {
                v134 += 7;
                BOOL v14 = v135++ >= 9;
                if (v14)
                {
                  uint64_t v136 = 0;
                  goto LABEL_358;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v136 = 0;
          }
LABEL_358:
          BOOL v210 = v136 != 0;
          uint64_t v211 = 107;
          goto LABEL_408;
        case 0x18u:
          char v140 = 0;
          unsigned int v141 = 0;
          uint64_t v142 = 0;
          *(void *)(a1 + 120) |= 0x4000000uLL;
          while (2)
          {
            uint64_t v143 = *v3;
            unint64_t v144 = *(void *)(a2 + v143);
            if (v144 == -1 || v144 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v145 = *(unsigned char *)(*(void *)(a2 + *v7) + v144);
              *(void *)(a2 + v143) = v144 + 1;
              v142 |= (unint64_t)(v145 & 0x7F) << v140;
              if (v145 < 0)
              {
                v140 += 7;
                BOOL v14 = v141++ >= 9;
                if (v14)
                {
                  uint64_t v142 = 0;
                  goto LABEL_362;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v142 = 0;
          }
LABEL_362:
          BOOL v210 = v142 != 0;
          uint64_t v211 = 108;
          goto LABEL_408;
        case 0x19u:
          char v146 = 0;
          unsigned int v147 = 0;
          uint64_t v148 = 0;
          *(void *)(a1 + 120) |= 0x100000000uLL;
          while (2)
          {
            uint64_t v149 = *v3;
            unint64_t v150 = *(void *)(a2 + v149);
            if (v150 == -1 || v150 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v151 = *(unsigned char *)(*(void *)(a2 + *v7) + v150);
              *(void *)(a2 + v149) = v150 + 1;
              v148 |= (unint64_t)(v151 & 0x7F) << v146;
              if (v151 < 0)
              {
                v146 += 7;
                BOOL v14 = v147++ >= 9;
                if (v14)
                {
                  uint64_t v148 = 0;
                  goto LABEL_366;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v148 = 0;
          }
LABEL_366:
          BOOL v210 = v148 != 0;
          uint64_t v211 = 114;
          goto LABEL_408;
        case 0x1Au:
          char v152 = 0;
          unsigned int v153 = 0;
          uint64_t v154 = 0;
          *(void *)(a1 + 120) |= 0x8000000uLL;
          while (2)
          {
            uint64_t v155 = *v3;
            unint64_t v156 = *(void *)(a2 + v155);
            if (v156 == -1 || v156 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v157 = *(unsigned char *)(*(void *)(a2 + *v7) + v156);
              *(void *)(a2 + v155) = v156 + 1;
              v154 |= (unint64_t)(v157 & 0x7F) << v152;
              if (v157 < 0)
              {
                v152 += 7;
                BOOL v14 = v153++ >= 9;
                if (v14)
                {
                  uint64_t v154 = 0;
                  goto LABEL_370;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v154 = 0;
          }
LABEL_370:
          BOOL v210 = v154 != 0;
          uint64_t v211 = 109;
          goto LABEL_408;
        case 0x1Bu:
          char v158 = 0;
          unsigned int v159 = 0;
          uint64_t v160 = 0;
          *(void *)(a1 + 120) |= 0x1000000uLL;
          while (2)
          {
            uint64_t v161 = *v3;
            unint64_t v162 = *(void *)(a2 + v161);
            if (v162 == -1 || v162 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v163 = *(unsigned char *)(*(void *)(a2 + *v7) + v162);
              *(void *)(a2 + v161) = v162 + 1;
              v160 |= (unint64_t)(v163 & 0x7F) << v158;
              if (v163 < 0)
              {
                v158 += 7;
                BOOL v14 = v159++ >= 9;
                if (v14)
                {
                  uint64_t v160 = 0;
                  goto LABEL_374;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v160 = 0;
          }
LABEL_374:
          BOOL v210 = v160 != 0;
          uint64_t v211 = 106;
          goto LABEL_408;
        case 0x1Cu:
          char v164 = 0;
          unsigned int v165 = 0;
          uint64_t v166 = 0;
          *(void *)(a1 + 120) |= 0x800000uLL;
          while (2)
          {
            uint64_t v167 = *v3;
            unint64_t v168 = *(void *)(a2 + v167);
            if (v168 == -1 || v168 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v169 = *(unsigned char *)(*(void *)(a2 + *v7) + v168);
              *(void *)(a2 + v167) = v168 + 1;
              v166 |= (unint64_t)(v169 & 0x7F) << v164;
              if (v169 < 0)
              {
                v164 += 7;
                BOOL v14 = v165++ >= 9;
                if (v14)
                {
                  uint64_t v166 = 0;
                  goto LABEL_378;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v166 = 0;
          }
LABEL_378:
          BOOL v210 = v166 != 0;
          uint64_t v211 = 105;
          goto LABEL_408;
        case 0x1Du:
          char v170 = 0;
          unsigned int v171 = 0;
          uint64_t v172 = 0;
          *(void *)(a1 + 120) |= 0x40000000uLL;
          while (2)
          {
            uint64_t v173 = *v3;
            unint64_t v174 = *(void *)(a2 + v173);
            if (v174 == -1 || v174 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v175 = *(unsigned char *)(*(void *)(a2 + *v7) + v174);
              *(void *)(a2 + v173) = v174 + 1;
              v172 |= (unint64_t)(v175 & 0x7F) << v170;
              if (v175 < 0)
              {
                v170 += 7;
                BOOL v14 = v171++ >= 9;
                if (v14)
                {
                  uint64_t v172 = 0;
                  goto LABEL_382;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v172 = 0;
          }
LABEL_382:
          BOOL v210 = v172 != 0;
          uint64_t v211 = 112;
          goto LABEL_408;
        case 0x1Eu:
          char v176 = 0;
          unsigned int v177 = 0;
          uint64_t v178 = 0;
          *(void *)(a1 + 120) |= 0x80000000uLL;
          while (2)
          {
            uint64_t v179 = *v3;
            unint64_t v180 = *(void *)(a2 + v179);
            if (v180 == -1 || v180 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v181 = *(unsigned char *)(*(void *)(a2 + *v7) + v180);
              *(void *)(a2 + v179) = v180 + 1;
              v178 |= (unint64_t)(v181 & 0x7F) << v176;
              if (v181 < 0)
              {
                v176 += 7;
                BOOL v14 = v177++ >= 9;
                if (v14)
                {
                  uint64_t v178 = 0;
                  goto LABEL_386;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v178 = 0;
          }
LABEL_386:
          BOOL v210 = v178 != 0;
          uint64_t v211 = 113;
          goto LABEL_408;
        case 0x1Fu:
          char v182 = 0;
          unsigned int v183 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x8000uLL;
          while (2)
          {
            uint64_t v184 = *v3;
            unint64_t v185 = *(void *)(a2 + v184);
            if (v185 == -1 || v185 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v186 = *(unsigned char *)(*(void *)(a2 + *v7) + v185);
              *(void *)(a2 + v184) = v185 + 1;
              v31 |= (unint64_t)(v186 & 0x7F) << v182;
              if (v186 < 0)
              {
                v182 += 7;
                BOOL v14 = v183++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_390;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_390:
          uint64_t v209 = 76;
          goto LABEL_403;
        case 0x20u:
          char v187 = 0;
          unsigned int v188 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x10000uLL;
          while (2)
          {
            uint64_t v189 = *v3;
            unint64_t v190 = *(void *)(a2 + v189);
            if (v190 == -1 || v190 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v191 = *(unsigned char *)(*(void *)(a2 + *v7) + v190);
              *(void *)(a2 + v189) = v190 + 1;
              v31 |= (unint64_t)(v191 & 0x7F) << v187;
              if (v191 < 0)
              {
                v187 += 7;
                BOOL v14 = v188++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_394;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_394:
          uint64_t v209 = 80;
          goto LABEL_403;
        case 0x21u:
          char v192 = 0;
          unsigned int v193 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x40000uLL;
          while (2)
          {
            uint64_t v194 = *v3;
            unint64_t v195 = *(void *)(a2 + v194);
            if (v195 == -1 || v195 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v196 = *(unsigned char *)(*(void *)(a2 + *v7) + v195);
              *(void *)(a2 + v194) = v195 + 1;
              v31 |= (unint64_t)(v196 & 0x7F) << v192;
              if (v196 < 0)
              {
                v192 += 7;
                BOOL v14 = v193++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_398;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_398:
          uint64_t v209 = 88;
          goto LABEL_403;
        case 0x22u:
          char v197 = 0;
          unsigned int v198 = 0;
          uint64_t v31 = 0;
          *(void *)(a1 + 120) |= 0x20000uLL;
          while (2)
          {
            uint64_t v199 = *v3;
            unint64_t v200 = *(void *)(a2 + v199);
            if (v200 == -1 || v200 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v201 = *(unsigned char *)(*(void *)(a2 + *v7) + v200);
              *(void *)(a2 + v199) = v200 + 1;
              v31 |= (unint64_t)(v201 & 0x7F) << v197;
              if (v201 < 0)
              {
                v197 += 7;
                BOOL v14 = v198++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_402;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v31) = 0;
          }
LABEL_402:
          uint64_t v209 = 84;
LABEL_403:
          *(_DWORD *)(a1 + v209) = v31;
          continue;
        case 0x23u:
          char v202 = 0;
          unsigned int v203 = 0;
          uint64_t v204 = 0;
          *(void *)(a1 + 120) |= 0x20000000uLL;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v205 = *v3;
        unint64_t v206 = *(void *)(a2 + v205);
        if (v206 == -1 || v206 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v207 = *(unsigned char *)(*(void *)(a2 + *v7) + v206);
        *(void *)(a2 + v205) = v206 + 1;
        v204 |= (unint64_t)(v207 & 0x7F) << v202;
        if ((v207 & 0x80) == 0) {
          goto LABEL_405;
        }
        v202 += 7;
        BOOL v14 = v203++ >= 9;
        if (v14)
        {
          uint64_t v204 = 0;
          goto LABEL_407;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_405:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v204 = 0;
      }
LABEL_407:
      BOOL v210 = v204 != 0;
      uint64_t v211 = 111;
LABEL_408:
      *(unsigned char *)(a1 + v211) = v210;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t AWDBiometricKitDailyUpdateReadFrom(uint64_t a1, uint64_t a2)
{
  SEL v3 = (int *)MEMORY[0x263F62298];
  unint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v8 = 0;
        unsigned int v9 = 0;
        unint64_t v10 = 0;
        while (1)
        {
          uint64_t v11 = *v3;
          unint64_t v12 = *(void *)(a2 + v11);
          if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v12 + 1;
          v10 |= (unint64_t)(v13 & 0x7F) << v8;
          if ((v13 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          BOOL v14 = v9++ >= 9;
          if (v14)
          {
            unint64_t v10 = 0;
            int v15 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        if (*(unsigned char *)(a2 + *v5)) {
          unint64_t v10 = 0;
        }
LABEL_14:
        int v16 = v10 & 7;
        if (!v15 && v16 != 4)
        {
          switch((v10 >> 3))
          {
            case 1u:
              char v18 = 0;
              unsigned int v19 = 0;
              uint64_t v20 = 0;
              *(void *)(a1 + 436) |= 2uLL;
              while (1)
              {
                uint64_t v21 = *v3;
                unint64_t v22 = *(void *)(a2 + v21);
                if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
                  break;
                }
                char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
                *(void *)(a2 + v21) = v22 + 1;
                v20 |= (unint64_t)(v23 & 0x7F) << v18;
                if ((v23 & 0x80) == 0) {
                  goto LABEL_532;
                }
                v18 += 7;
                BOOL v14 = v19++ >= 9;
                if (v14)
                {
                  uint64_t v20 = 0;
                  goto LABEL_534;
                }
              }
              *(unsigned char *)(a2 + *v5) = 1;
LABEL_532:
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v20 = 0;
              }
LABEL_534:
              uint64_t v362 = 232;
              goto LABEL_591;
            case 2u:
              if (v16 != 2)
              {
                char v366 = 0;
                unsigned int v367 = 0;
                uint64_t v368 = 0;
                while (1)
                {
                  uint64_t v369 = *v3;
                  unint64_t v370 = *(void *)(a2 + v369);
                  if (v370 == -1 || v370 >= *(void *)(a2 + *v4)) {
                    goto LABEL_823;
                  }
                  char v371 = *(unsigned char *)(*(void *)(a2 + *v7) + v370);
                  *(void *)(a2 + v369) = v370 + 1;
                  v368 |= (unint64_t)(v371 & 0x7F) << v366;
                  if (v371 < 0)
                  {
                    v366 += 7;
                    BOOL v14 = v367++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_824;
                }
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v25 = 0;
                unsigned int v26 = 0;
                uint64_t v27 = 0;
                while (1)
                {
                  uint64_t v28 = *v3;
                  unint64_t v29 = *(void *)(a2 + v28);
                  if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
                  *(void *)(a2 + v28) = v29 + 1;
                  v27 |= (unint64_t)(v30 & 0x7F) << v25;
                  if (v30 < 0)
                  {
                    v25 += 7;
                    BOOL v14 = v26++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_40;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_40:
                PBRepeatedUInt32Add();
              }
              goto LABEL_229;
            case 3u:
              if (v16 != 2)
              {
                char v372 = 0;
                unsigned int v373 = 0;
                uint64_t v374 = 0;
                while (1)
                {
                  uint64_t v375 = *v3;
                  unint64_t v376 = *(void *)(a2 + v375);
                  if (v376 == -1 || v376 >= *(void *)(a2 + *v4)) {
                    goto LABEL_823;
                  }
                  char v377 = *(unsigned char *)(*(void *)(a2 + *v7) + v376);
                  *(void *)(a2 + v375) = v376 + 1;
                  v374 |= (unint64_t)(v377 & 0x7F) << v372;
                  if (v377 < 0)
                  {
                    v372 += 7;
                    BOOL v14 = v373++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_824;
                }
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v31 = 0;
                unsigned int v32 = 0;
                uint64_t v33 = 0;
                while (1)
                {
                  uint64_t v34 = *v3;
                  unint64_t v35 = *(void *)(a2 + v34);
                  if (v35 == -1 || v35 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
                  *(void *)(a2 + v34) = v35 + 1;
                  v33 |= (unint64_t)(v36 & 0x7F) << v31;
                  if (v36 < 0)
                  {
                    v31 += 7;
                    BOOL v14 = v32++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_53;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_53:
                PBRepeatedUInt32Add();
              }
              goto LABEL_229;
            case 4u:
              if (v16 != 2)
              {
                char v378 = 0;
                unsigned int v379 = 0;
                uint64_t v380 = 0;
                while (1)
                {
                  uint64_t v381 = *v3;
                  unint64_t v382 = *(void *)(a2 + v381);
                  if (v382 == -1 || v382 >= *(void *)(a2 + *v4)) {
                    goto LABEL_823;
                  }
                  char v383 = *(unsigned char *)(*(void *)(a2 + *v7) + v382);
                  *(void *)(a2 + v381) = v382 + 1;
                  v380 |= (unint64_t)(v383 & 0x7F) << v378;
                  if (v383 < 0)
                  {
                    v378 += 7;
                    BOOL v14 = v379++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_824;
                }
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v37 = 0;
                unsigned int v38 = 0;
                uint64_t v39 = 0;
                while (1)
                {
                  uint64_t v40 = *v3;
                  unint64_t v41 = *(void *)(a2 + v40);
                  if (v41 == -1 || v41 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v42 = *(unsigned char *)(*(void *)(a2 + *v7) + v41);
                  *(void *)(a2 + v40) = v41 + 1;
                  v39 |= (unint64_t)(v42 & 0x7F) << v37;
                  if (v42 < 0)
                  {
                    v37 += 7;
                    BOOL v14 = v38++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_66;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_66:
                PBRepeatedUInt32Add();
              }
              goto LABEL_229;
            case 5u:
              char v43 = 0;
              unsigned int v44 = 0;
              uint64_t v45 = 0;
              *(void *)(a1 + 436) |= 0x80000000000000uLL;
              while (2)
              {
                uint64_t v46 = *v3;
                unint64_t v47 = *(void *)(a2 + v46);
                if (v47 == -1 || v47 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v48 = *(unsigned char *)(*(void *)(a2 + *v7) + v47);
                  *(void *)(a2 + v46) = v47 + 1;
                  v45 |= (unint64_t)(v48 & 0x7F) << v43;
                  if (v48 < 0)
                  {
                    v43 += 7;
                    BOOL v14 = v44++ >= 9;
                    if (v14)
                    {
                      uint64_t v45 = 0;
                      goto LABEL_538;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v45 = 0;
              }
LABEL_538:
              BOOL v363 = v45 != 0;
              uint64_t v364 = 434;
              goto LABEL_728;
            case 6u:
              char v49 = 0;
              unsigned int v50 = 0;
              uint64_t v51 = 0;
              *(void *)(a1 + 436) |= 0x2000000000000uLL;
              while (2)
              {
                uint64_t v52 = *v3;
                unint64_t v53 = *(void *)(a2 + v52);
                if (v53 == -1 || v53 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v54 = *(unsigned char *)(*(void *)(a2 + *v7) + v53);
                  *(void *)(a2 + v52) = v53 + 1;
                  v51 |= (unint64_t)(v54 & 0x7F) << v49;
                  if (v54 < 0)
                  {
                    v49 += 7;
                    BOOL v14 = v50++ >= 9;
                    if (v14)
                    {
                      uint64_t v51 = 0;
                      goto LABEL_542;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v51 = 0;
              }
LABEL_542:
              BOOL v363 = v51 != 0;
              uint64_t v364 = 428;
              goto LABEL_728;
            case 7u:
              char v55 = 0;
              unsigned int v56 = 0;
              uint64_t v57 = 0;
              *(void *)(a1 + 436) |= 0x4000000000000uLL;
              while (2)
              {
                uint64_t v58 = *v3;
                unint64_t v59 = *(void *)(a2 + v58);
                if (v59 == -1 || v59 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v60 = *(unsigned char *)(*(void *)(a2 + *v7) + v59);
                  *(void *)(a2 + v58) = v59 + 1;
                  v57 |= (unint64_t)(v60 & 0x7F) << v55;
                  if (v60 < 0)
                  {
                    v55 += 7;
                    BOOL v14 = v56++ >= 9;
                    if (v14)
                    {
                      uint64_t v57 = 0;
                      goto LABEL_546;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v57 = 0;
              }
LABEL_546:
              BOOL v363 = v57 != 0;
              uint64_t v364 = 429;
              goto LABEL_728;
            case 8u:
              char v61 = 0;
              unsigned int v62 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x80000uLL;
              while (2)
              {
                uint64_t v64 = *v3;
                unint64_t v65 = *(void *)(a2 + v64);
                if (v65 == -1 || v65 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v66 = *(unsigned char *)(*(void *)(a2 + *v7) + v65);
                  *(void *)(a2 + v64) = v65 + 1;
                  v63 |= (unint64_t)(v66 & 0x7F) << v61;
                  if (v66 < 0)
                  {
                    v61 += 7;
                    BOOL v14 = v62++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_550;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_550:
              uint64_t v365 = 308;
              goto LABEL_757;
            case 9u:
              char v67 = 0;
              unsigned int v68 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x100000uLL;
              while (2)
              {
                uint64_t v69 = *v3;
                unint64_t v70 = *(void *)(a2 + v69);
                if (v70 == -1 || v70 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v71 = *(unsigned char *)(*(void *)(a2 + *v7) + v70);
                  *(void *)(a2 + v69) = v70 + 1;
                  v63 |= (unint64_t)(v71 & 0x7F) << v67;
                  if (v71 < 0)
                  {
                    v67 += 7;
                    BOOL v14 = v68++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_554;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_554:
              uint64_t v365 = 312;
              goto LABEL_757;
            case 0xAu:
              char v72 = 0;
              unsigned int v73 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x200000uLL;
              while (2)
              {
                uint64_t v74 = *v3;
                unint64_t v75 = *(void *)(a2 + v74);
                if (v75 == -1 || v75 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v76 = *(unsigned char *)(*(void *)(a2 + *v7) + v75);
                  *(void *)(a2 + v74) = v75 + 1;
                  v63 |= (unint64_t)(v76 & 0x7F) << v72;
                  if (v76 < 0)
                  {
                    v72 += 7;
                    BOOL v14 = v73++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_558;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_558:
              uint64_t v365 = 316;
              goto LABEL_757;
            case 0xBu:
              char v77 = 0;
              unsigned int v78 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x400000uLL;
              while (2)
              {
                uint64_t v79 = *v3;
                unint64_t v80 = *(void *)(a2 + v79);
                if (v80 == -1 || v80 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v81 = *(unsigned char *)(*(void *)(a2 + *v7) + v80);
                  *(void *)(a2 + v79) = v80 + 1;
                  v63 |= (unint64_t)(v81 & 0x7F) << v77;
                  if (v81 < 0)
                  {
                    v77 += 7;
                    BOOL v14 = v78++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_562;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_562:
              uint64_t v365 = 320;
              goto LABEL_757;
            case 0xCu:
              char v82 = 0;
              unsigned int v83 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x20000000000uLL;
              while (2)
              {
                uint64_t v84 = *v3;
                unint64_t v85 = *(void *)(a2 + v84);
                if (v85 == -1 || v85 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v86 = *(unsigned char *)(*(void *)(a2 + *v7) + v85);
                  *(void *)(a2 + v84) = v85 + 1;
                  v63 |= (unint64_t)(v86 & 0x7F) << v82;
                  if (v86 < 0)
                  {
                    v82 += 7;
                    BOOL v14 = v83++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_566;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_566:
              uint64_t v365 = 396;
              goto LABEL_757;
            case 0xDu:
              char v87 = 0;
              unsigned int v88 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x8000000uLL;
              while (2)
              {
                uint64_t v89 = *v3;
                unint64_t v90 = *(void *)(a2 + v89);
                if (v90 == -1 || v90 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v91 = *(unsigned char *)(*(void *)(a2 + *v7) + v90);
                  *(void *)(a2 + v89) = v90 + 1;
                  v63 |= (unint64_t)(v91 & 0x7F) << v87;
                  if (v91 < 0)
                  {
                    v87 += 7;
                    BOOL v14 = v88++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_570;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_570:
              uint64_t v365 = 340;
              goto LABEL_757;
            case 0xEu:
              char v92 = 0;
              unsigned int v93 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x4000000000uLL;
              while (2)
              {
                uint64_t v94 = *v3;
                unint64_t v95 = *(void *)(a2 + v94);
                if (v95 == -1 || v95 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v96 = *(unsigned char *)(*(void *)(a2 + *v7) + v95);
                  *(void *)(a2 + v94) = v95 + 1;
                  v63 |= (unint64_t)(v96 & 0x7F) << v92;
                  if (v96 < 0)
                  {
                    v92 += 7;
                    BOOL v14 = v93++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_574;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_574:
              uint64_t v365 = 384;
              goto LABEL_757;
            case 0xFu:
              if (v16 != 2)
              {
                char v384 = 0;
                unsigned int v385 = 0;
                uint64_t v386 = 0;
                while (1)
                {
                  uint64_t v387 = *v3;
                  unint64_t v388 = *(void *)(a2 + v387);
                  if (v388 == -1 || v388 >= *(void *)(a2 + *v4)) {
                    goto LABEL_823;
                  }
                  char v389 = *(unsigned char *)(*(void *)(a2 + *v7) + v388);
                  *(void *)(a2 + v387) = v388 + 1;
                  v386 |= (unint64_t)(v389 & 0x7F) << v384;
                  if (v389 < 0)
                  {
                    v384 += 7;
                    BOOL v14 = v385++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_824;
                }
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v97 = 0;
                unsigned int v98 = 0;
                uint64_t v99 = 0;
                while (1)
                {
                  uint64_t v100 = *v3;
                  unint64_t v101 = *(void *)(a2 + v100);
                  if (v101 == -1 || v101 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v102 = *(unsigned char *)(*(void *)(a2 + *v7) + v101);
                  *(void *)(a2 + v100) = v101 + 1;
                  v99 |= (unint64_t)(v102 & 0x7F) << v97;
                  if (v102 < 0)
                  {
                    v97 += 7;
                    BOOL v14 = v98++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_149;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_149:
                PBRepeatedUInt32Add();
              }
              goto LABEL_229;
            case 0x10u:
              if (v16 != 2)
              {
                char v390 = 0;
                unsigned int v391 = 0;
                uint64_t v392 = 0;
                while (1)
                {
                  uint64_t v393 = *v3;
                  unint64_t v394 = *(void *)(a2 + v393);
                  if (v394 == -1 || v394 >= *(void *)(a2 + *v4)) {
                    goto LABEL_823;
                  }
                  char v395 = *(unsigned char *)(*(void *)(a2 + *v7) + v394);
                  *(void *)(a2 + v393) = v394 + 1;
                  v392 |= (unint64_t)(v395 & 0x7F) << v390;
                  if (v395 < 0)
                  {
                    v390 += 7;
                    BOOL v14 = v391++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_824;
                }
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v103 = 0;
                unsigned int v104 = 0;
                uint64_t v105 = 0;
                while (1)
                {
                  uint64_t v106 = *v3;
                  unint64_t v107 = *(void *)(a2 + v106);
                  if (v107 == -1 || v107 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v108 = *(unsigned char *)(*(void *)(a2 + *v7) + v107);
                  *(void *)(a2 + v106) = v107 + 1;
                  v105 |= (unint64_t)(v108 & 0x7F) << v103;
                  if (v108 < 0)
                  {
                    v103 += 7;
                    BOOL v14 = v104++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_162;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_162:
                PBRepeatedUInt32Add();
              }
              goto LABEL_229;
            case 0x11u:
              char v109 = 0;
              unsigned int v110 = 0;
              uint64_t v111 = 0;
              *(void *)(a1 + 436) |= 0x10000000000000uLL;
              while (2)
              {
                uint64_t v112 = *v3;
                unint64_t v113 = *(void *)(a2 + v112);
                if (v113 == -1 || v113 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v114 = *(unsigned char *)(*(void *)(a2 + *v7) + v113);
                  *(void *)(a2 + v112) = v113 + 1;
                  v111 |= (unint64_t)(v114 & 0x7F) << v109;
                  if (v114 < 0)
                  {
                    v109 += 7;
                    BOOL v14 = v110++ >= 9;
                    if (v14)
                    {
                      uint64_t v111 = 0;
                      goto LABEL_578;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v111 = 0;
              }
LABEL_578:
              BOOL v363 = v111 != 0;
              uint64_t v364 = 431;
              goto LABEL_728;
            case 0x12u:
              if (v16 != 2)
              {
                char v396 = 0;
                unsigned int v397 = 0;
                uint64_t v398 = 0;
                while (1)
                {
                  uint64_t v399 = *v3;
                  unint64_t v400 = *(void *)(a2 + v399);
                  if (v400 == -1 || v400 >= *(void *)(a2 + *v4)) {
                    goto LABEL_823;
                  }
                  char v401 = *(unsigned char *)(*(void *)(a2 + *v7) + v400);
                  *(void *)(a2 + v399) = v400 + 1;
                  v398 |= (unint64_t)(v401 & 0x7F) << v396;
                  if (v401 < 0)
                  {
                    v396 += 7;
                    BOOL v14 = v397++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_824;
                }
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v115 = 0;
                unsigned int v116 = 0;
                uint64_t v117 = 0;
                while (1)
                {
                  uint64_t v118 = *v3;
                  unint64_t v119 = *(void *)(a2 + v118);
                  if (v119 == -1 || v119 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v120 = *(unsigned char *)(*(void *)(a2 + *v7) + v119);
                  *(void *)(a2 + v118) = v119 + 1;
                  v117 |= (unint64_t)(v120 & 0x7F) << v115;
                  if (v120 < 0)
                  {
                    v115 += 7;
                    BOOL v14 = v116++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_182;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_182:
                PBRepeatedUInt32Add();
              }
              goto LABEL_229;
            case 0x13u:
              if (v16 != 2)
              {
                char v402 = 0;
                unsigned int v403 = 0;
                uint64_t v404 = 0;
                while (1)
                {
                  uint64_t v405 = *v3;
                  unint64_t v406 = *(void *)(a2 + v405);
                  if (v406 == -1 || v406 >= *(void *)(a2 + *v4)) {
                    goto LABEL_823;
                  }
                  char v407 = *(unsigned char *)(*(void *)(a2 + *v7) + v406);
                  *(void *)(a2 + v405) = v406 + 1;
                  v404 |= (unint64_t)(v407 & 0x7F) << v402;
                  if (v407 < 0)
                  {
                    v402 += 7;
                    BOOL v14 = v403++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_824;
                }
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v121 = 0;
                unsigned int v122 = 0;
                uint64_t v123 = 0;
                while (1)
                {
                  uint64_t v124 = *v3;
                  unint64_t v125 = *(void *)(a2 + v124);
                  if (v125 == -1 || v125 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v126 = *(unsigned char *)(*(void *)(a2 + *v7) + v125);
                  *(void *)(a2 + v124) = v125 + 1;
                  v123 |= (unint64_t)(v126 & 0x7F) << v121;
                  if (v126 < 0)
                  {
                    v121 += 7;
                    BOOL v14 = v122++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_195;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_195:
                PBRepeatedUInt32Add();
              }
              goto LABEL_229;
            case 0x14u:
              if (v16 != 2)
              {
                char v408 = 0;
                unsigned int v409 = 0;
                uint64_t v410 = 0;
                while (1)
                {
                  uint64_t v411 = *v3;
                  unint64_t v412 = *(void *)(a2 + v411);
                  if (v412 == -1 || v412 >= *(void *)(a2 + *v4)) {
                    goto LABEL_823;
                  }
                  char v413 = *(unsigned char *)(*(void *)(a2 + *v7) + v412);
                  *(void *)(a2 + v411) = v412 + 1;
                  v410 |= (unint64_t)(v413 & 0x7F) << v408;
                  if (v413 < 0)
                  {
                    v408 += 7;
                    BOOL v14 = v409++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_824;
                }
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v127 = 0;
                unsigned int v128 = 0;
                uint64_t v129 = 0;
                while (1)
                {
                  uint64_t v130 = *v3;
                  unint64_t v131 = *(void *)(a2 + v130);
                  if (v131 == -1 || v131 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v132 = *(unsigned char *)(*(void *)(a2 + *v7) + v131);
                  *(void *)(a2 + v130) = v131 + 1;
                  v129 |= (unint64_t)(v132 & 0x7F) << v127;
                  if (v132 < 0)
                  {
                    v127 += 7;
                    BOOL v14 = v128++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_208;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_208:
                PBRepeatedUInt32Add();
              }
              goto LABEL_229;
            case 0x15u:
              char v133 = 0;
              unsigned int v134 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x80uLL;
              while (2)
              {
                uint64_t v135 = *v3;
                unint64_t v136 = *(void *)(a2 + v135);
                if (v136 == -1 || v136 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v137 = *(unsigned char *)(*(void *)(a2 + *v7) + v136);
                  *(void *)(a2 + v135) = v136 + 1;
                  v63 |= (unint64_t)(v137 & 0x7F) << v133;
                  if (v137 < 0)
                  {
                    v133 += 7;
                    BOOL v14 = v134++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_582;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_582:
              uint64_t v365 = 260;
              goto LABEL_757;
            case 0x16u:
              if (v16 == 2)
              {
                uint64_t result = PBReaderPlaceMark();
                if (!result) {
                  return result;
                }
                while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
                {
                  char v138 = 0;
                  unsigned int v139 = 0;
                  uint64_t v140 = 0;
                  while (1)
                  {
                    uint64_t v141 = *v3;
                    unint64_t v142 = *(void *)(a2 + v141);
                    if (v142 == -1 || v142 >= *(void *)(a2 + *v4)) {
                      break;
                    }
                    char v143 = *(unsigned char *)(*(void *)(a2 + *v7) + v142);
                    *(void *)(a2 + v141) = v142 + 1;
                    v140 |= (unint64_t)(v143 & 0x7F) << v138;
                    if (v143 < 0)
                    {
                      v138 += 7;
                      BOOL v14 = v139++ >= 9;
                      if (!v14) {
                        continue;
                      }
                    }
                    goto LABEL_228;
                  }
                  *(unsigned char *)(a2 + *v5) = 1;
LABEL_228:
                  PBRepeatedUInt32Add();
                }
LABEL_229:
                PBReaderRecallMark();
              }
              else
              {
                char v414 = 0;
                unsigned int v415 = 0;
                uint64_t v416 = 0;
                while (1)
                {
                  uint64_t v417 = *v3;
                  unint64_t v418 = *(void *)(a2 + v417);
                  if (v418 == -1 || v418 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v419 = *(unsigned char *)(*(void *)(a2 + *v7) + v418);
                  *(void *)(a2 + v417) = v418 + 1;
                  v416 |= (unint64_t)(v419 & 0x7F) << v414;
                  if (v419 < 0)
                  {
                    v414 += 7;
                    BOOL v14 = v415++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_824;
                }
LABEL_823:
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_824:
                PBRepeatedUInt32Add();
              }
LABEL_758:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
            case 0x17u:
              char v144 = 0;
              unsigned int v145 = 0;
              uint64_t v146 = 0;
              *(void *)(a1 + 436) |= 0x20000000000000uLL;
              while (2)
              {
                uint64_t v147 = *v3;
                unint64_t v148 = *(void *)(a2 + v147);
                if (v148 == -1 || v148 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v149 = *(unsigned char *)(*(void *)(a2 + *v7) + v148);
                  *(void *)(a2 + v147) = v148 + 1;
                  v146 |= (unint64_t)(v149 & 0x7F) << v144;
                  if (v149 < 0)
                  {
                    v144 += 7;
                    BOOL v14 = v145++ >= 9;
                    if (v14)
                    {
                      uint64_t v146 = 0;
                      goto LABEL_586;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v146 = 0;
              }
LABEL_586:
              BOOL v363 = v146 != 0;
              uint64_t v364 = 432;
              goto LABEL_728;
            case 0x18u:
              char v150 = 0;
              unsigned int v151 = 0;
              uint64_t v20 = 0;
              *(void *)(a1 + 436) |= 1uLL;
              while (2)
              {
                uint64_t v152 = *v3;
                unint64_t v153 = *(void *)(a2 + v152);
                if (v153 == -1 || v153 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v154 = *(unsigned char *)(*(void *)(a2 + *v7) + v153);
                  *(void *)(a2 + v152) = v153 + 1;
                  v20 |= (unint64_t)(v154 & 0x7F) << v150;
                  if (v154 < 0)
                  {
                    v150 += 7;
                    BOOL v14 = v151++ >= 9;
                    if (v14)
                    {
                      uint64_t v20 = 0;
                      goto LABEL_590;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v20 = 0;
              }
LABEL_590:
              uint64_t v362 = 224;
LABEL_591:
              *(void *)(a1 + v362) = v20;
              goto LABEL_758;
            case 0x19u:
              char v155 = 0;
              unsigned int v156 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x40uLL;
              while (2)
              {
                uint64_t v157 = *v3;
                unint64_t v158 = *(void *)(a2 + v157);
                if (v158 == -1 || v158 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v159 = *(unsigned char *)(*(void *)(a2 + *v7) + v158);
                  *(void *)(a2 + v157) = v158 + 1;
                  v63 |= (unint64_t)(v159 & 0x7F) << v155;
                  if (v159 < 0)
                  {
                    v155 += 7;
                    BOOL v14 = v156++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_595;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_595:
              uint64_t v365 = 256;
              goto LABEL_757;
            case 0x1Au:
              char v160 = 0;
              unsigned int v161 = 0;
              uint64_t v162 = 0;
              *(void *)(a1 + 436) |= 0x8000000000000uLL;
              while (2)
              {
                uint64_t v163 = *v3;
                unint64_t v164 = *(void *)(a2 + v163);
                if (v164 == -1 || v164 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v165 = *(unsigned char *)(*(void *)(a2 + *v7) + v164);
                  *(void *)(a2 + v163) = v164 + 1;
                  v162 |= (unint64_t)(v165 & 0x7F) << v160;
                  if (v165 < 0)
                  {
                    v160 += 7;
                    BOOL v14 = v161++ >= 9;
                    if (v14)
                    {
                      uint64_t v162 = 0;
                      goto LABEL_599;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v162 = 0;
              }
LABEL_599:
              BOOL v363 = v162 != 0;
              uint64_t v364 = 430;
              goto LABEL_728;
            case 0x1Bu:
              char v166 = 0;
              unsigned int v167 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x1000000000000uLL;
              while (2)
              {
                uint64_t v168 = *v3;
                unint64_t v169 = *(void *)(a2 + v168);
                if (v169 == -1 || v169 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v170 = *(unsigned char *)(*(void *)(a2 + *v7) + v169);
                  *(void *)(a2 + v168) = v169 + 1;
                  v63 |= (unint64_t)(v170 & 0x7F) << v166;
                  if (v170 < 0)
                  {
                    v166 += 7;
                    BOOL v14 = v167++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_603;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_603:
              uint64_t v365 = 424;
              goto LABEL_757;
            case 0x1Cu:
              char v171 = 0;
              unsigned int v172 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x100000000000uLL;
              while (2)
              {
                uint64_t v173 = *v3;
                unint64_t v174 = *(void *)(a2 + v173);
                if (v174 == -1 || v174 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v175 = *(unsigned char *)(*(void *)(a2 + *v7) + v174);
                  *(void *)(a2 + v173) = v174 + 1;
                  v63 |= (unint64_t)(v175 & 0x7F) << v171;
                  if (v175 < 0)
                  {
                    v171 += 7;
                    BOOL v14 = v172++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_607;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_607:
              uint64_t v365 = 408;
              goto LABEL_757;
            case 0x1Du:
              char v176 = 0;
              unsigned int v177 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x800000000000uLL;
              while (2)
              {
                uint64_t v178 = *v3;
                unint64_t v179 = *(void *)(a2 + v178);
                if (v179 == -1 || v179 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v180 = *(unsigned char *)(*(void *)(a2 + *v7) + v179);
                  *(void *)(a2 + v178) = v179 + 1;
                  v63 |= (unint64_t)(v180 & 0x7F) << v176;
                  if (v180 < 0)
                  {
                    v176 += 7;
                    BOOL v14 = v177++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_611;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_611:
              uint64_t v365 = 420;
              goto LABEL_757;
            case 0x1Eu:
              char v181 = 0;
              unsigned int v182 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x400000000000uLL;
              while (2)
              {
                uint64_t v183 = *v3;
                unint64_t v184 = *(void *)(a2 + v183);
                if (v184 == -1 || v184 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v185 = *(unsigned char *)(*(void *)(a2 + *v7) + v184);
                  *(void *)(a2 + v183) = v184 + 1;
                  v63 |= (unint64_t)(v185 & 0x7F) << v181;
                  if (v185 < 0)
                  {
                    v181 += 7;
                    BOOL v14 = v182++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_615;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_615:
              uint64_t v365 = 416;
              goto LABEL_757;
            case 0x1Fu:
              char v186 = 0;
              unsigned int v187 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x200000000000uLL;
              while (2)
              {
                uint64_t v188 = *v3;
                unint64_t v189 = *(void *)(a2 + v188);
                if (v189 == -1 || v189 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v190 = *(unsigned char *)(*(void *)(a2 + *v7) + v189);
                  *(void *)(a2 + v188) = v189 + 1;
                  v63 |= (unint64_t)(v190 & 0x7F) << v186;
                  if (v190 < 0)
                  {
                    v186 += 7;
                    BOOL v14 = v187++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_619;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_619:
              uint64_t v365 = 412;
              goto LABEL_757;
            case 0x20u:
              char v191 = 0;
              unsigned int v192 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x20000uLL;
              while (2)
              {
                uint64_t v193 = *v3;
                unint64_t v194 = *(void *)(a2 + v193);
                if (v194 == -1 || v194 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v195 = *(unsigned char *)(*(void *)(a2 + *v7) + v194);
                  *(void *)(a2 + v193) = v194 + 1;
                  v63 |= (unint64_t)(v195 & 0x7F) << v191;
                  if (v195 < 0)
                  {
                    v191 += 7;
                    BOOL v14 = v192++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_623;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_623:
              uint64_t v365 = 300;
              goto LABEL_757;
            case 0x21u:
              char v196 = 0;
              unsigned int v197 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x8000uLL;
              while (2)
              {
                uint64_t v198 = *v3;
                unint64_t v199 = *(void *)(a2 + v198);
                if (v199 == -1 || v199 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v200 = *(unsigned char *)(*(void *)(a2 + *v7) + v199);
                  *(void *)(a2 + v198) = v199 + 1;
                  v63 |= (unint64_t)(v200 & 0x7F) << v196;
                  if (v200 < 0)
                  {
                    v196 += 7;
                    BOOL v14 = v197++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_627;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_627:
              uint64_t v365 = 292;
              goto LABEL_757;
            case 0x22u:
              char v201 = 0;
              unsigned int v202 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x2000uLL;
              while (2)
              {
                uint64_t v203 = *v3;
                unint64_t v204 = *(void *)(a2 + v203);
                if (v204 == -1 || v204 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v205 = *(unsigned char *)(*(void *)(a2 + *v7) + v204);
                  *(void *)(a2 + v203) = v204 + 1;
                  v63 |= (unint64_t)(v205 & 0x7F) << v201;
                  if (v205 < 0)
                  {
                    v201 += 7;
                    BOOL v14 = v202++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_631;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_631:
              uint64_t v365 = 284;
              goto LABEL_757;
            case 0x23u:
              char v206 = 0;
              unsigned int v207 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x800uLL;
              while (2)
              {
                uint64_t v208 = *v3;
                unint64_t v209 = *(void *)(a2 + v208);
                if (v209 == -1 || v209 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v210 = *(unsigned char *)(*(void *)(a2 + *v7) + v209);
                  *(void *)(a2 + v208) = v209 + 1;
                  v63 |= (unint64_t)(v210 & 0x7F) << v206;
                  if (v210 < 0)
                  {
                    v206 += 7;
                    BOOL v14 = v207++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_635;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_635:
              uint64_t v365 = 276;
              goto LABEL_757;
            case 0x24u:
              char v211 = 0;
              unsigned int v212 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x40000uLL;
              while (2)
              {
                uint64_t v213 = *v3;
                unint64_t v214 = *(void *)(a2 + v213);
                if (v214 == -1 || v214 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v215 = *(unsigned char *)(*(void *)(a2 + *v7) + v214);
                  *(void *)(a2 + v213) = v214 + 1;
                  v63 |= (unint64_t)(v215 & 0x7F) << v211;
                  if (v215 < 0)
                  {
                    v211 += 7;
                    BOOL v14 = v212++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_639;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_639:
              uint64_t v365 = 304;
              goto LABEL_757;
            case 0x25u:
              char v216 = 0;
              unsigned int v217 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x10000uLL;
              while (2)
              {
                uint64_t v218 = *v3;
                unint64_t v219 = *(void *)(a2 + v218);
                if (v219 == -1 || v219 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v220 = *(unsigned char *)(*(void *)(a2 + *v7) + v219);
                  *(void *)(a2 + v218) = v219 + 1;
                  v63 |= (unint64_t)(v220 & 0x7F) << v216;
                  if (v220 < 0)
                  {
                    v216 += 7;
                    BOOL v14 = v217++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_643;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_643:
              uint64_t v365 = 296;
              goto LABEL_757;
            case 0x26u:
              char v221 = 0;
              unsigned int v222 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x4000uLL;
              while (2)
              {
                uint64_t v223 = *v3;
                unint64_t v224 = *(void *)(a2 + v223);
                if (v224 == -1 || v224 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v225 = *(unsigned char *)(*(void *)(a2 + *v7) + v224);
                  *(void *)(a2 + v223) = v224 + 1;
                  v63 |= (unint64_t)(v225 & 0x7F) << v221;
                  if (v225 < 0)
                  {
                    v221 += 7;
                    BOOL v14 = v222++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_647;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_647:
              uint64_t v365 = 288;
              goto LABEL_757;
            case 0x27u:
              char v226 = 0;
              unsigned int v227 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x1000uLL;
              while (2)
              {
                uint64_t v228 = *v3;
                unint64_t v229 = *(void *)(a2 + v228);
                if (v229 == -1 || v229 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v230 = *(unsigned char *)(*(void *)(a2 + *v7) + v229);
                  *(void *)(a2 + v228) = v229 + 1;
                  v63 |= (unint64_t)(v230 & 0x7F) << v226;
                  if (v230 < 0)
                  {
                    v226 += 7;
                    BOOL v14 = v227++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_651;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_651:
              uint64_t v365 = 280;
              goto LABEL_757;
            case 0x28u:
              char v231 = 0;
              unsigned int v232 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x40000000000uLL;
              while (2)
              {
                uint64_t v233 = *v3;
                unint64_t v234 = *(void *)(a2 + v233);
                if (v234 == -1 || v234 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v235 = *(unsigned char *)(*(void *)(a2 + *v7) + v234);
                  *(void *)(a2 + v233) = v234 + 1;
                  v63 |= (unint64_t)(v235 & 0x7F) << v231;
                  if (v235 < 0)
                  {
                    v231 += 7;
                    BOOL v14 = v232++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_655;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_655:
              uint64_t v365 = 400;
              goto LABEL_757;
            case 0x29u:
              char v236 = 0;
              unsigned int v237 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x10000000uLL;
              while (2)
              {
                uint64_t v238 = *v3;
                unint64_t v239 = *(void *)(a2 + v238);
                if (v239 == -1 || v239 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v240 = *(unsigned char *)(*(void *)(a2 + *v7) + v239);
                  *(void *)(a2 + v238) = v239 + 1;
                  v63 |= (unint64_t)(v240 & 0x7F) << v236;
                  if (v240 < 0)
                  {
                    v236 += 7;
                    BOOL v14 = v237++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_659;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_659:
              uint64_t v365 = 344;
              goto LABEL_757;
            case 0x2Au:
              char v241 = 0;
              unsigned int v242 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x8000000000uLL;
              while (2)
              {
                uint64_t v243 = *v3;
                unint64_t v244 = *(void *)(a2 + v243);
                if (v244 == -1 || v244 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v245 = *(unsigned char *)(*(void *)(a2 + *v7) + v244);
                  *(void *)(a2 + v243) = v244 + 1;
                  v63 |= (unint64_t)(v245 & 0x7F) << v241;
                  if (v245 < 0)
                  {
                    v241 += 7;
                    BOOL v14 = v242++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_663;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_663:
              uint64_t v365 = 388;
              goto LABEL_757;
            case 0x2Bu:
              char v246 = 0;
              unsigned int v247 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x80000000000uLL;
              while (2)
              {
                uint64_t v248 = *v3;
                unint64_t v249 = *(void *)(a2 + v248);
                if (v249 == -1 || v249 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v250 = *(unsigned char *)(*(void *)(a2 + *v7) + v249);
                  *(void *)(a2 + v248) = v249 + 1;
                  v63 |= (unint64_t)(v250 & 0x7F) << v246;
                  if (v250 < 0)
                  {
                    v246 += 7;
                    BOOL v14 = v247++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_667;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_667:
              uint64_t v365 = 404;
              goto LABEL_757;
            case 0x2Cu:
              char v251 = 0;
              unsigned int v252 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x20000000uLL;
              while (2)
              {
                uint64_t v253 = *v3;
                unint64_t v254 = *(void *)(a2 + v253);
                if (v254 == -1 || v254 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v255 = *(unsigned char *)(*(void *)(a2 + *v7) + v254);
                  *(void *)(a2 + v253) = v254 + 1;
                  v63 |= (unint64_t)(v255 & 0x7F) << v251;
                  if (v255 < 0)
                  {
                    v251 += 7;
                    BOOL v14 = v252++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_671;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_671:
              uint64_t v365 = 348;
              goto LABEL_757;
            case 0x2Du:
              char v256 = 0;
              unsigned int v257 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x10000000000uLL;
              while (2)
              {
                uint64_t v258 = *v3;
                unint64_t v259 = *(void *)(a2 + v258);
                if (v259 == -1 || v259 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v260 = *(unsigned char *)(*(void *)(a2 + *v7) + v259);
                  *(void *)(a2 + v258) = v259 + 1;
                  v63 |= (unint64_t)(v260 & 0x7F) << v256;
                  if (v260 < 0)
                  {
                    v256 += 7;
                    BOOL v14 = v257++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_675;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_675:
              uint64_t v365 = 392;
              goto LABEL_757;
            case 0x2Eu:
              char v261 = 0;
              unsigned int v262 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 4uLL;
              while (2)
              {
                uint64_t v263 = *v3;
                unint64_t v264 = *(void *)(a2 + v263);
                if (v264 == -1 || v264 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v265 = *(unsigned char *)(*(void *)(a2 + *v7) + v264);
                  *(void *)(a2 + v263) = v264 + 1;
                  v63 |= (unint64_t)(v265 & 0x7F) << v261;
                  if (v265 < 0)
                  {
                    v261 += 7;
                    BOOL v14 = v262++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_679;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_679:
              uint64_t v365 = 240;
              goto LABEL_757;
            case 0x2Fu:
              char v266 = 0;
              unsigned int v267 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x40000000uLL;
              while (2)
              {
                uint64_t v268 = *v3;
                unint64_t v269 = *(void *)(a2 + v268);
                if (v269 == -1 || v269 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v270 = *(unsigned char *)(*(void *)(a2 + *v7) + v269);
                  *(void *)(a2 + v268) = v269 + 1;
                  v63 |= (unint64_t)(v270 & 0x7F) << v266;
                  if (v270 < 0)
                  {
                    v266 += 7;
                    BOOL v14 = v267++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_683;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_683:
              uint64_t v365 = 352;
              goto LABEL_757;
            case 0x30u:
              char v271 = 0;
              unsigned int v272 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x400000000uLL;
              while (2)
              {
                uint64_t v273 = *v3;
                unint64_t v274 = *(void *)(a2 + v273);
                if (v274 == -1 || v274 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v275 = *(unsigned char *)(*(void *)(a2 + *v7) + v274);
                  *(void *)(a2 + v273) = v274 + 1;
                  v63 |= (unint64_t)(v275 & 0x7F) << v271;
                  if (v275 < 0)
                  {
                    v271 += 7;
                    BOOL v14 = v272++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_687;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_687:
              uint64_t v365 = 368;
              goto LABEL_757;
            case 0x31u:
              char v276 = 0;
              unsigned int v277 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 8uLL;
              while (2)
              {
                uint64_t v278 = *v3;
                unint64_t v279 = *(void *)(a2 + v278);
                if (v279 == -1 || v279 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v280 = *(unsigned char *)(*(void *)(a2 + *v7) + v279);
                  *(void *)(a2 + v278) = v279 + 1;
                  v63 |= (unint64_t)(v280 & 0x7F) << v276;
                  if (v280 < 0)
                  {
                    v276 += 7;
                    BOOL v14 = v277++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_691;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_691:
              uint64_t v365 = 244;
              goto LABEL_757;
            case 0x32u:
              char v281 = 0;
              unsigned int v282 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x80000000uLL;
              while (2)
              {
                uint64_t v283 = *v3;
                unint64_t v284 = *(void *)(a2 + v283);
                if (v284 == -1 || v284 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v285 = *(unsigned char *)(*(void *)(a2 + *v7) + v284);
                  *(void *)(a2 + v283) = v284 + 1;
                  v63 |= (unint64_t)(v285 & 0x7F) << v281;
                  if (v285 < 0)
                  {
                    v281 += 7;
                    BOOL v14 = v282++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_695;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_695:
              uint64_t v365 = 356;
              goto LABEL_757;
            case 0x33u:
              char v286 = 0;
              unsigned int v287 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x800000000uLL;
              while (2)
              {
                uint64_t v288 = *v3;
                unint64_t v289 = *(void *)(a2 + v288);
                if (v289 == -1 || v289 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v290 = *(unsigned char *)(*(void *)(a2 + *v7) + v289);
                  *(void *)(a2 + v288) = v289 + 1;
                  v63 |= (unint64_t)(v290 & 0x7F) << v286;
                  if (v290 < 0)
                  {
                    v286 += 7;
                    BOOL v14 = v287++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_699;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_699:
              uint64_t v365 = 372;
              goto LABEL_757;
            case 0x34u:
              char v291 = 0;
              unsigned int v292 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x10uLL;
              while (2)
              {
                uint64_t v293 = *v3;
                unint64_t v294 = *(void *)(a2 + v293);
                if (v294 == -1 || v294 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v295 = *(unsigned char *)(*(void *)(a2 + *v7) + v294);
                  *(void *)(a2 + v293) = v294 + 1;
                  v63 |= (unint64_t)(v295 & 0x7F) << v291;
                  if (v295 < 0)
                  {
                    v291 += 7;
                    BOOL v14 = v292++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_703;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_703:
              uint64_t v365 = 248;
              goto LABEL_757;
            case 0x35u:
              char v296 = 0;
              unsigned int v297 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x100000000uLL;
              while (2)
              {
                uint64_t v298 = *v3;
                unint64_t v299 = *(void *)(a2 + v298);
                if (v299 == -1 || v299 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v300 = *(unsigned char *)(*(void *)(a2 + *v7) + v299);
                  *(void *)(a2 + v298) = v299 + 1;
                  v63 |= (unint64_t)(v300 & 0x7F) << v296;
                  if (v300 < 0)
                  {
                    v296 += 7;
                    BOOL v14 = v297++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_707;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_707:
              uint64_t v365 = 360;
              goto LABEL_757;
            case 0x36u:
              char v301 = 0;
              unsigned int v302 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x1000000000uLL;
              while (2)
              {
                uint64_t v303 = *v3;
                unint64_t v304 = *(void *)(a2 + v303);
                if (v304 == -1 || v304 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v305 = *(unsigned char *)(*(void *)(a2 + *v7) + v304);
                  *(void *)(a2 + v303) = v304 + 1;
                  v63 |= (unint64_t)(v305 & 0x7F) << v301;
                  if (v305 < 0)
                  {
                    v301 += 7;
                    BOOL v14 = v302++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_711;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_711:
              uint64_t v365 = 376;
              goto LABEL_757;
            case 0x37u:
              char v306 = 0;
              unsigned int v307 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x20uLL;
              while (2)
              {
                uint64_t v308 = *v3;
                unint64_t v309 = *(void *)(a2 + v308);
                if (v309 == -1 || v309 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v310 = *(unsigned char *)(*(void *)(a2 + *v7) + v309);
                  *(void *)(a2 + v308) = v309 + 1;
                  v63 |= (unint64_t)(v310 & 0x7F) << v306;
                  if (v310 < 0)
                  {
                    v306 += 7;
                    BOOL v14 = v307++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_715;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_715:
              uint64_t v365 = 252;
              goto LABEL_757;
            case 0x38u:
              char v311 = 0;
              unsigned int v312 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x200000000uLL;
              while (2)
              {
                uint64_t v313 = *v3;
                unint64_t v314 = *(void *)(a2 + v313);
                if (v314 == -1 || v314 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v315 = *(unsigned char *)(*(void *)(a2 + *v7) + v314);
                  *(void *)(a2 + v313) = v314 + 1;
                  v63 |= (unint64_t)(v315 & 0x7F) << v311;
                  if (v315 < 0)
                  {
                    v311 += 7;
                    BOOL v14 = v312++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_719;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_719:
              uint64_t v365 = 364;
              goto LABEL_757;
            case 0x39u:
              char v316 = 0;
              unsigned int v317 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x2000000000uLL;
              while (2)
              {
                uint64_t v318 = *v3;
                unint64_t v319 = *(void *)(a2 + v318);
                if (v319 == -1 || v319 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v320 = *(unsigned char *)(*(void *)(a2 + *v7) + v319);
                  *(void *)(a2 + v318) = v319 + 1;
                  v63 |= (unint64_t)(v320 & 0x7F) << v316;
                  if (v320 < 0)
                  {
                    v316 += 7;
                    BOOL v14 = v317++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_723;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_723:
              uint64_t v365 = 380;
              goto LABEL_757;
            case 0x3Au:
              char v321 = 0;
              unsigned int v322 = 0;
              uint64_t v323 = 0;
              *(void *)(a1 + 436) |= 0x40000000000000uLL;
              while (2)
              {
                uint64_t v324 = *v3;
                unint64_t v325 = *(void *)(a2 + v324);
                if (v325 == -1 || v325 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v326 = *(unsigned char *)(*(void *)(a2 + *v7) + v325);
                  *(void *)(a2 + v324) = v325 + 1;
                  v323 |= (unint64_t)(v326 & 0x7F) << v321;
                  if (v326 < 0)
                  {
                    v321 += 7;
                    BOOL v14 = v322++ >= 9;
                    if (v14)
                    {
                      uint64_t v323 = 0;
                      goto LABEL_727;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v323 = 0;
              }
LABEL_727:
              BOOL v363 = v323 != 0;
              uint64_t v364 = 433;
LABEL_728:
              *(unsigned char *)(a1 + v364) = v363;
              goto LABEL_758;
            case 0x3Bu:
              char v327 = 0;
              unsigned int v328 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x200uLL;
              while (2)
              {
                uint64_t v329 = *v3;
                unint64_t v330 = *(void *)(a2 + v329);
                if (v330 == -1 || v330 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v331 = *(unsigned char *)(*(void *)(a2 + *v7) + v330);
                  *(void *)(a2 + v329) = v330 + 1;
                  v63 |= (unint64_t)(v331 & 0x7F) << v327;
                  if (v331 < 0)
                  {
                    v327 += 7;
                    BOOL v14 = v328++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_732;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_732:
              uint64_t v365 = 268;
              goto LABEL_757;
            case 0x3Cu:
              char v332 = 0;
              unsigned int v333 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x400uLL;
              while (2)
              {
                uint64_t v334 = *v3;
                unint64_t v335 = *(void *)(a2 + v334);
                if (v335 == -1 || v335 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v336 = *(unsigned char *)(*(void *)(a2 + *v7) + v335);
                  *(void *)(a2 + v334) = v335 + 1;
                  v63 |= (unint64_t)(v336 & 0x7F) << v332;
                  if (v336 < 0)
                  {
                    v332 += 7;
                    BOOL v14 = v333++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_736;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_736:
              uint64_t v365 = 272;
              goto LABEL_757;
            case 0x3Du:
              char v337 = 0;
              unsigned int v338 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x100uLL;
              while (2)
              {
                uint64_t v339 = *v3;
                unint64_t v340 = *(void *)(a2 + v339);
                if (v340 == -1 || v340 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v341 = *(unsigned char *)(*(void *)(a2 + *v7) + v340);
                  *(void *)(a2 + v339) = v340 + 1;
                  v63 |= (unint64_t)(v341 & 0x7F) << v337;
                  if (v341 < 0)
                  {
                    v337 += 7;
                    BOOL v14 = v338++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_740;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_740:
              uint64_t v365 = 264;
              goto LABEL_757;
            case 0x3Eu:
              char v342 = 0;
              unsigned int v343 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x800000uLL;
              while (2)
              {
                uint64_t v344 = *v3;
                unint64_t v345 = *(void *)(a2 + v344);
                if (v345 == -1 || v345 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v346 = *(unsigned char *)(*(void *)(a2 + *v7) + v345);
                  *(void *)(a2 + v344) = v345 + 1;
                  v63 |= (unint64_t)(v346 & 0x7F) << v342;
                  if (v346 < 0)
                  {
                    v342 += 7;
                    BOOL v14 = v343++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_744;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_744:
              uint64_t v365 = 324;
              goto LABEL_757;
            case 0x3Fu:
              char v347 = 0;
              unsigned int v348 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x1000000uLL;
              while (2)
              {
                uint64_t v349 = *v3;
                unint64_t v350 = *(void *)(a2 + v349);
                if (v350 == -1 || v350 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v351 = *(unsigned char *)(*(void *)(a2 + *v7) + v350);
                  *(void *)(a2 + v349) = v350 + 1;
                  v63 |= (unint64_t)(v351 & 0x7F) << v347;
                  if (v351 < 0)
                  {
                    v347 += 7;
                    BOOL v14 = v348++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_748;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_748:
              uint64_t v365 = 328;
              goto LABEL_757;
            case 0x40u:
              char v352 = 0;
              unsigned int v353 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x2000000uLL;
              while (2)
              {
                uint64_t v354 = *v3;
                unint64_t v355 = *(void *)(a2 + v354);
                if (v355 == -1 || v355 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v356 = *(unsigned char *)(*(void *)(a2 + *v7) + v355);
                  *(void *)(a2 + v354) = v355 + 1;
                  v63 |= (unint64_t)(v356 & 0x7F) << v352;
                  if (v356 < 0)
                  {
                    v352 += 7;
                    BOOL v14 = v353++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_752;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_752:
              uint64_t v365 = 332;
              goto LABEL_757;
            case 0x41u:
              char v357 = 0;
              unsigned int v358 = 0;
              uint64_t v63 = 0;
              *(void *)(a1 + 436) |= 0x4000000uLL;
              while (2)
              {
                uint64_t v359 = *v3;
                unint64_t v360 = *(void *)(a2 + v359);
                if (v360 == -1 || v360 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v361 = *(unsigned char *)(*(void *)(a2 + *v7) + v360);
                  *(void *)(a2 + v359) = v360 + 1;
                  v63 |= (unint64_t)(v361 & 0x7F) << v357;
                  if (v361 < 0)
                  {
                    v357 += 7;
                    BOOL v14 = v358++ >= 9;
                    if (v14)
                    {
                      LODWORD(v63) = 0;
                      goto LABEL_756;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v63) = 0;
              }
LABEL_756:
              uint64_t v365 = 336;
LABEL_757:
              *(_DWORD *)(a1 + v365) = v63;
              goto LABEL_758;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
              goto LABEL_758;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t cpGetInternalComponents(__CFArray **a1)
{
  kern_return_t RegistryEntryID;
  CFNumberRef v12;
  CFNumberRef v13;
  CFTypeRef v14;
  int v15;
  int v16;
  __CFString *v17;
  CFTypeRef v18;
  CFTypeRef v19;
  CFTypeRef v20;
  const void *v21;
  CFTypeRef v22;
  __CFDictionary *v23;
  __CFArray **v25;
  __CFArray *theArray;
  CFAllocatorRef v27;
  CFBooleanRef cf;
  io_iterator_t existing;
  uint64_t entryID;
  int valuePtr;

  uint64_t v1 = 3758097090;
  if (a1)
  {
    existing = 0;
    SEL v3 = IOServiceMatching("AppleAuthCP");
    CFDictionarySetValue(v3, @"InternalComponent", (const void *)*MEMORY[0x263EFFB40]);
    uint64_t MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x263F0EC90], v3, &existing);
    if (MatchingServices)
    {
      return MatchingServices;
    }
    else
    {
      char v25 = a1;
      CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      theArray = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
      io_object_t v6 = IOIteratorNext(existing);
      if (v6)
      {
        io_registry_entry_t v7 = v6;
        uint64_t v27 = v5;
        do
        {
          CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v7, @"InternalComponent", v5, 0);
          if (!CFProperty)
          {
            char v23 = 0;
LABEL_38:
            int v16 = -536870206;
            goto LABEL_40;
          }
          CFBooleanRef v9 = CFProperty;
          valuePtr = 0;
          entryID = 0;
          if (!CFBooleanGetValue(CFProperty))
          {
            char v23 = 0;
            Mutable = 0;
            unint64_t v22 = v9;
            int v16 = -536870206;
            goto LABEL_34;
          }
          Mutable = CFDictionaryCreateMutable(v5, 5, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
          if (!Mutable) {
            goto LABEL_45;
          }
          RegistryEntryID = IORegistryEntryGetRegistryEntryID(v7, &entryID);
          if (RegistryEntryID)
          {
            int v16 = RegistryEntryID;
            char v23 = 0;
LABEL_49:
            unint64_t v22 = v9;
LABEL_34:
            CFRelease(v22);
            goto LABEL_35;
          }
          unint64_t v12 = CFNumberCreate(v5, kCFNumberSInt64Type, &entryID);
          if (!v12)
          {
LABEL_45:
            char v23 = 0;
            int v16 = -536870181;
            goto LABEL_49;
          }
          char v13 = v12;
          CFDictionaryAddValue(Mutable, @"IORegistryEntryID", v12);
          BOOL v14 = IORegistryEntryCreateCFProperty(v7, @"flags", v5, 0);
          if (v14) {
            CFDictionaryAddValue(Mutable, @"flags", v14);
          }
          CFNumberGetValue((CFNumberRef)v14, kCFNumberSInt32Type, &valuePtr);
          int v15 = BYTE2(valuePtr) << 16;
          int v16 = -536870201;
          cf = v9;
          if (v15 == 0x10000)
          {
            char v17 = @"Battery";
          }
          else
          {
            if (v15 != 196608)
            {
              char v23 = 0;
              unsigned int v19 = 0;
              uint64_t v21 = 0;
              unint64_t v22 = 0;
              char v18 = 0;
              goto LABEL_25;
            }
            char v17 = @"TouchController";
          }
          CFDictionaryAddValue(Mutable, @"ComponentName", v17);
          char v18 = IORegistryEntryCreateCFProperty(v7, @"authErrorDescription", v5, 0);
          if (v18)
          {
            CFDictionaryAddValue(Mutable, @"authErrorDescription", v18);
            unsigned int v19 = IORegistryEntryCreateCFProperty(v7, @"AuthPassed", v5, 0);
            if (v19) {
              CFDictionaryAddValue(Mutable, @"AuthPassed", v19);
            }
            uint64_t v20 = IORegistryEntryCreateCFProperty(v7, @"isTrusted", v5, 0);
            uint64_t v21 = v20;
            if (v20) {
              CFDictionaryAddValue(Mutable, @"isTrusted", v20);
            }
            unint64_t v22 = IORegistryEntryCreateCFProperty(v7, @"isTrustedForUI", v5, 0);
            if (v22) {
              CFDictionaryAddValue(Mutable, @"isTrustedForUI", v22);
            }
            int v16 = 0;
            char v23 = Mutable;
          }
          else
          {
            char v23 = 0;
            unsigned int v19 = 0;
            uint64_t v21 = 0;
            unint64_t v22 = 0;
          }
LABEL_25:
          CFRelease(cf);
          CFRelease(v13);
          if (v14) {
            CFRelease(v14);
          }
          if (v18) {
            CFRelease(v18);
          }
          if (v19) {
            CFRelease(v19);
          }
          if (v21) {
            CFRelease(v21);
          }
          if (v22) {
            goto LABEL_34;
          }
LABEL_35:
          if (Mutable)
          {
            CFAllocatorRef v5 = v27;
            if (!v16) {
              goto LABEL_40;
            }
            CFRelease(Mutable);
            goto LABEL_38;
          }
          CFAllocatorRef v5 = v27;
LABEL_40:
          IOObjectRelease(v7);
          if (v23 && !v16)
          {
            CFArrayAppendValue(theArray, v23);
            CFRelease(v23);
          }
          io_registry_entry_t v7 = IOIteratorNext(existing);
        }
        while (v7);
      }
      IOObjectRelease(existing);
      uint64_t v1 = 0;
      *char v25 = theArray;
    }
  }
  return v1;
}

uint64_t Img4DecodeSecureBootRsa4kSha384IM4C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&SecureBoot_root_rsa4k_pub, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeLocalRsa4kSha384IM4C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&Local_root_rsa4k_pub, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeShamRsa4kSha384IM4C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&Sham_root_rsa4k_pub, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

void Img4DecodeEvaluateTrust(unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
}

double Img4DecodeCopyPayloadHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyPayloadHashWithCallback(a1, (void (*)(void, void, long long *))sha1_digest, a2, a3);
}

double Img4DecodeCopyManifestHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyManifestHashWithCallback(a1, (void (*)(void))sha1_digest, a2, a3);
}

double DERImg4DecodeFindInSequence(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  unint64_t v7 = 0;
  long long v8 = 0uLL;
  while (!DERDecodeSeqNext(a1, &v7))
  {
    if (v7 == a2)
    {
      double result = *(double *)&v8;
      *a3 = v8;
      return result;
    }
  }
  return result;
}

double DERImg4DecodeContentFindItemWithTag(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  v6[0] = 0;
  v6[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v6)) {
    return DERImg4DecodeFindInSequence(v6, a2, a3);
  }
  return result;
}

uint64_t DERImg4DecodeTagCompare(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 < 4) {
    return 0xFFFFFFFFLL;
  }
  if (v2 != 4) {
    return 1;
  }
  unsigned int v5 = 0;
  if (DERParseInteger((char **)a1, &v5)) {
    return 4294967294;
  }
  if (v5 < a2) {
    return 0xFFFFFFFFLL;
  }
  return v5 > a2;
}

uint64_t DERImg4Decode(void *a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      unint64_t v6 = 0;
      unint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t result = DERDecodeItem((uint64_t)a1, &v6);
      if (!result)
      {
        if (v6 == 0x2000000000000010)
        {
          uint64_t v5 = a1[1];
          if (__CFADD__(*a1, v5) || __CFADD__(v7, v8))
          {
            __break(0x5513u);
          }
          else if (*a1 + v5 == v7 + v8)
          {
            uint64_t result = DERParseSequenceContentToObject(&v7, 4u, (uint64_t)&DERImg4ItemSpecs, a2, 0x40uLL, 0);
            if (!result) {
              return 2 * (DERImg4DecodeTagCompare(a2, 0x494D4734u) != 0);
            }
          }
          else
          {
            return 7;
          }
        }
        else
        {
          return 2;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadCompression(unint64_t *a1, char **a2)
{
  unsigned int v5 = 2;
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceContentToObject(a1, 2u, (uint64_t)&DERImg4CompressionItemSpecs, (unint64_t)a2, 0x20uLL, 0);
      if (!result)
      {
        uint64_t result = DERParseInteger(a2, &v5);
        if (!result)
        {
          if (v5 <= 1) {
            return 0;
          }
          else {
            return 6;
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadWithProperties(uint64_t a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceToObject(a1, 7u, (uint64_t)&DERImg4PayloadWithPropertiesItemSpecs, a2, 0xA0uLL, 0);
      if (!result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else if (!*(void *)(a2 + 80) {
               || (long long v7 = 0u,
        }
                   long long v8 = 0u,
                   uint64_t result = DERImg4DecodePayloadCompression((unint64_t *)(a2 + 80), (char **)&v7),
                   !result))
        {
          uint64_t v6 = *(void *)(a2 + 96);
          uint64_t v5 = a2 + 96;
          if (!v6) {
            return 0;
          }
          long long v7 = 0u;
          long long v8 = 0u;
          uint64_t result = DERImg4DecodePayloadProperties(v5, (unint64_t)&v7);
          if (!result) {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadProperties(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4PayloadPropertiesItemSpecs, a2, 0x20uLL, 0);
      if (result) {
        return result;
      }
      if (DERImg4DecodeTagCompare(a2, 0x50415950u)) {
        return 2;
      }
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodePayload(uint64_t a1, unint64_t a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t result = 6;
  if (a1 && a2)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t result = DERImg4DecodePayloadWithProperties(a1, (unint64_t)&v11);
    if (result)
    {
      uint64_t result = DERParseSequenceToObject(a1, 6u, (uint64_t)&DERImg4PayloadItemSpecs, a2, 0x90uLL, 0);
      if (!result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else
        {
          uint64_t v6 = *(void *)(a2 + 80);
          uint64_t v5 = (unint64_t *)(a2 + 80);
          if (!v6) {
            return 0;
          }
          memset(v10, 0, sizeof(v10));
          uint64_t result = DERImg4DecodePayloadCompression(v5, (char **)v10);
          if (!result) {
            return 0;
          }
        }
      }
    }
    else
    {
      long long v7 = v12;
      *(_OWORD *)a2 = v11;
      *(_OWORD *)(a2 + 16) = v7;
      long long v8 = v14;
      *(_OWORD *)(a2 + 32) = v13;
      *(_OWORD *)(a2 + 48) = v8;
      long long v9 = v16;
      *(_OWORD *)(a2 + 64) = v15;
      *(_OWORD *)(a2 + 80) = v9;
    }
  }
  return result;
}

uint64_t DERImg4DecodeManifest(void *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 5uLL, (uint64_t)&DERImg4ManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t DERImg4DecodeManifestCommon(void *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5)
{
  uint64_t result = 6;
  if (a1 && a4)
  {
    if (!*a1 || !a1[1]) {
      return 0;
    }
    if (a2 >= 0x10000)
    {
      __break(0x5507u);
      return result;
    }
    uint64_t result = DERParseSequenceToObject((uint64_t)a1, (unsigned __int16)a2, a3, a4, 0xC0uLL, 0);
    if (!result)
    {
      if (DERImg4DecodeTagCompare(a4, a5)) {
        return 2;
      }
      unsigned int v9 = 0;
      uint64_t result = DERParseInteger((char **)(a4 + 16), &v9);
      if (result) {
        return result;
      }
      if (v9 > 2) {
        return 2;
      }
      return 0;
    }
  }
  return result;
}

uint64_t DERImg4DecodeUnsignedManifest(void *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t DERImg4DecodeCertificate(void *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 4uLL, (uint64_t)&DERImg4CertificateItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeUnsignedCertificate(void *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeCertificatePropertiesAndPubKey(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  unint64_t v18 = 0;
  unint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              v21[0] = a1;
              v21[1] = a2;
              long long v16 = 0u;
              long long v17 = 0u;
              long long v14 = 0u;
              long long v15 = 0u;
              uint64_t result = DERDecodeItem((uint64_t)v21, &v18);
              if (!result)
              {
                if (v18 != 0x2000000000000011) {
                  return 2;
                }
                if (!DERParseSequenceContentToObject(&v19, 2u, (uint64_t)&DERIM4CItemSpecs, (unint64_t)&v16, 0x20uLL, 0))
                {
                  uint64_t result = DERDecodeItem((uint64_t)&v16, &v18);
                  if (result) {
                    return result;
                  }
                  if (v18 != 0x2000000000000010) {
                    return 2;
                  }
                  if (!DERParseSequenceContentToObject(&v19, 2u, (uint64_t)&DERCRTPSequenceItemSpecs, (unint64_t)&v14, 0x20uLL, 0))
                  {
                    uint64_t v12 = *((void *)&v15 + 1);
                    *a3 = v15;
                    *a4 = v12;
                    uint64_t result = DERDecodeItem((uint64_t)&v17, &v18);
                    if (result) {
                      return result;
                    }
                    if (v18 == 4)
                    {
                      uint64_t result = 0;
                      uint64_t v13 = v20;
                      *a5 = v19;
                      *a6 = v13;
                      return result;
                    }
                    return 2;
                  }
                }
                return 0xFFFFFFFFLL;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodeRestoreInfo(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4RestoreInfoItemSpecs, a2, 0x20uLL, 0);
      if (result) {
        return result;
      }
      if (DERImg4DecodeTagCompare(a2, 0x494D3452u)) {
        return 2;
      }
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodeProperty(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a3)
    {
      unint64_t v14 = 0;
      long long v15 = 0uLL;
      long long v13 = 0uLL;
      uint64_t v11 = 0;
      unint64_t v12 = 0;
      uint64_t v9 = 0;
      unint64_t v10 = 0;
      unsigned int v8 = 0;
      uint64_t result = DERDecodeSeqInit((uint64_t)a1, &v9, &v10);
      if (!result)
      {
        if (v9 != 0x2000000000000010) {
          return 2;
        }
        uint64_t result = DERDecodeSeqNext(&v10, &v14);
        if (result) {
          return result;
        }
        if (v14 != 22) {
          return 2;
        }
        uint64_t result = DERParseInteger((char **)&v15, &v8);
        if (result) {
          return result;
        }
        if ((v8 | 0xE000000000000000) != a2) {
          return 2;
        }
        *(_OWORD *)a3 = v15;
        uint64_t result = DERDecodeSeqNext(&v10, &v12);
        if (result) {
          return result;
        }
        *(void *)(a3 + 40) = v12;
        *(_OWORD *)(a3 + 24) = v13;
        uint64_t result = DERDecodeSeqNext(&v10, &v12);
        if (result != 1) {
          return 2;
        }
        uint64_t v7 = a1[1];
        if (__CFADD__(*a1, v7))
        {
          __break(0x5513u);
        }
        else if (v11 == *a1 + v7)
        {
          return 0;
        }
        else
        {
          return 7;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePropertyWithItem(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unsigned int v8 = 0;
  v9[0] = 0;
  v9[2] = 0;
  v9[1] = 22;
  v9[3] = 24;
  long long v10 = a3;
  uint64_t result = DERParseSequenceToObject(a1, 2u, (uint64_t)v9, a4, 0x30uLL, 0);
  if (!result)
  {
    uint64_t result = DERParseInteger((char **)a4, &v8);
    if (!result)
    {
      if ((v8 | 0xE000000000000000) == a2)
      {
        uint64_t result = 0;
        *(void *)(a4 + 16) = a2 | 0xE000000000000000;
        *(void *)(a4 + 40) = a3;
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

void DERImg4DecodeFindPropertyInSequence(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  long long v8 = 0uLL;
  DERImg4DecodeFindInSequence(a1, a2, &v8);
  if (!v7) {
    DERImg4DecodePropertyWithItem((uint64_t)&v8, a2, a3, a4);
  }
}

void DERImg4DecodeFindProperty(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  v7[0] = 0;
  v7[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v7)) {
    DERImg4DecodeFindPropertyInSequence(v7, a2, a3, a4);
  }
}

void DERImg4DecodeParseManifestProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

void DERImg4DecodeParseManifestPropertiesInternal(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4)
{
  int v11 = 0;
  if (a1)
  {
    if (a2 | a3)
    {
      unint64_t v14 = 0;
      v15[0] = 0;
      v15[1] = 0;
      memset(v13, 0, sizeof(v13));
      memset(v12, 0, sizeof(v12));
      if (!DERDecodeItem(a1 + 264, &v14)
        && v14 == 0x2000000000000011
        && !DERParseInteger((char **)(a1 + 248), &v11))
      {
        unint64_t v8 = v11 == 2 ? 0x2000000000000010 : 0x2000000000000011;
        DERImg4DecodeFindProperty(v15, a4 | 0xE000000000000000, v8, (unint64_t)v13);
        if (!v9)
        {
          if (a2) {
            *(_OWORD *)a2 = *(_OWORD *)((char *)&v13[1] + 8);
          }
          DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, 0xE00000004D414E50, 0x2000000000000011uLL, (unint64_t)v12);
          if (a3)
          {
            if (!v10) {
              *(_OWORD *)a3 = *(_OWORD *)((char *)&v12[1] + 8);
            }
          }
        }
      }
    }
  }
}

void DERImg4DecodeParseCertificateProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

uint64_t Img4DecodeParseLengthFromBufferWithTag(uint64_t a1, uint64_t a2, unsigned int a3, void *a4)
{
  unint64_t v11 = 0;
  unint64_t v12 = 0;
  v16[0] = 0;
  v16[1] = 0;
  v14[1] = 0;
  unint64_t v15 = 0;
  uint64_t result = 0xFFFFFFFFLL;
  unint64_t v13 = 0;
  v14[0] = 0;
  if (a1)
  {
    if (a4)
    {
      v17[0] = a1;
      v17[1] = a2;
      uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v17, &v15, &v12);
      if (!result)
      {
        if (v12)
        {
          if (v15 != 0x2000000000000010) {
            return 2;
          }
          uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v16, &v13, &v11);
          if (result) {
            return result;
          }
          if (v11)
          {
            uint64_t result = DERImg4DecodeTagCompare((uint64_t)v14, a3);
            if (!result)
            {
              uint64_t v8 = v16[0] - a1;
              if (v12 >= ~(v16[0] - a1)) {
                return 7;
              }
              BOOL v9 = __CFADD__(v12, v8);
              uint64_t v10 = v12 + v8;
              if (v9)
              {
                __break(0x5500u);
              }
              else
              {
                uint64_t result = 0;
                *a4 = v10;
              }
              return result;
            }
            return 2;
          }
        }
        return 3;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeParseLengthFromBuffer(uint64_t a1, uint64_t a2, void *a3)
{
  return Img4DecodeParseLengthFromBufferWithTag(a1, a2, 0x494D4734u, a3);
}

uint64_t Img4DecodePayloadExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 136)) {
      BOOL v4 = *(void *)(a1 + 144) != 0;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayload(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!result)
    {
      if (v5)
      {
        uint64_t result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 136);
        return result;
      }
      uint64_t result = 1;
    }
    goto LABEL_9;
  }
  uint64_t result = 6;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadType(uint64_t a1, _DWORD *a2)
{
  BOOL v5 = 0;
  uint64_t result = 6;
  if (!a1 || !a2 || (uint64_t result = Img4DecodePayloadExists(a1, &v5), result))
  {
LABEL_6:
    if (!a2) {
      return result;
    }
    goto LABEL_7;
  }
  if (v5)
  {
    uint64_t result = DERParseInteger((char **)(a1 + 104), a2);
    goto LABEL_6;
  }
  uint64_t result = 1;
  if (!a2) {
    return result;
  }
LABEL_7:
  if (result) {
    *a2 = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadVersion(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!result)
    {
      if (v5)
      {
        uint64_t result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 120);
        return result;
      }
      uint64_t result = 1;
    }
    goto LABEL_9;
  }
  uint64_t result = 6;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodePayloadKeybagExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 152)) {
      BOOL v4 = *(void *)(a1 + 160) != 0;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadKeybag(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!result)
    {
      if (v5)
      {
        uint64_t result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 152);
        return result;
      }
      uint64_t result = 1;
    }
    goto LABEL_9;
  }
  uint64_t result = 6;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodePayloadCompressionInfoExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 168)) {
      BOOL v4 = *(void *)(a1 + 176) != 0;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadCompressionInfo(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  BOOL v11 = 0;
  uint64_t result = 6;
  if (!a1) {
    goto LABEL_14;
  }
  if (!a2) {
    goto LABEL_14;
  }
  if (!a3) {
    goto LABEL_14;
  }
  uint64_t result = Img4DecodePayloadExists(a1, &v11);
  if (result) {
    goto LABEL_14;
  }
  if (!v11) {
    goto LABEL_13;
  }
  uint64_t result = Img4DecodePayloadCompressionInfoExists(a1, &v11);
  if (result) {
    goto LABEL_14;
  }
  if (!v11)
  {
LABEL_13:
    uint64_t result = 1;
    goto LABEL_14;
  }
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v8 = *(void *)(a1 + 168);
  int v7 = (unint64_t *)(a1 + 168);
  if (!v8)
  {
    uint64_t result = 0xFFFFFFFFLL;
    if (!a2) {
      return result;
    }
LABEL_15:
    if (a3)
    {
      *a2 = -1;
      *a3 = -1;
    }
    return result;
  }
  uint64_t result = DERParseSequenceContentToObject(v7, 2u, (uint64_t)&DERImg4CompressionItemSpecs, (unint64_t)&v9, 0x20uLL, 0);
  if (result
    || (uint64_t result = DERParseInteger((char **)&v9, a2), result)
    || (uint64_t result = DERParseInteger((char **)&v10, a3), result))
  {
LABEL_14:
    if (!a2) {
      return result;
    }
    goto LABEL_15;
  }
  return result;
}

double Img4DecodeCopyPayloadHashWithCallback(uint64_t a1, void (*a2)(void, void, long long *), uint64_t a3, int a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3) {
      return *(double *)&v7;
    }
LABEL_9:
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    return *(double *)&v7;
  }
  BOOL v9 = 0;
  if (Img4DecodePayloadExists(a1, &v9) || !v9) {
    goto LABEL_9;
  }
  if (*(unsigned char *)a1)
  {
    long long v7 = *(_OWORD *)(a1 + 184);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 200);
    *(_OWORD *)a3 = v7;
  }
  else
  {
    long long v10 = 0uLL;
    int v11 = 0;
    a2(*(void *)(a1 + 8), *(void *)(a1 + 16), &v10);
    *(void *)&long long v7 = v10;
    *(_OWORD *)a3 = v10;
    *(_DWORD *)(a3 + 16) = v11;
  }
  return *(double *)&v7;
}

uint64_t Img4DecodeCopyPayloadDigest(uint64_t a1, void *a2, size_t a3, uint64_t (**a4)(void, void, _OWORD *, size_t, void))
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = 6;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          BOOL v10 = 0;
          if (*a4)
          {
            if (!Img4DecodePayloadExists(a1, &v10))
            {
              if (v10)
              {
                if (a3 > 0x30)
                {
                  return 7;
                }
                else if (*(unsigned char *)a1)
                {
                  memcpy(a2, (const void *)(a1 + 184), a3);
                  return 0;
                }
                else
                {
                  memset(__src, 0, sizeof(__src));
                  uint64_t v4 = (*a4)(*(void *)(a1 + 8), *(void *)(a1 + 16), __src, a3, a4);
                  if (!v4) {
                    memcpy(a2, __src, a3);
                  }
                }
              }
              else
              {
                return 1;
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t Img4DecodeManifestExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(void *)(a1 + 24) != 0;
    }
  }
  return result;
}

double Img4DecodeCopyManifestHashWithCallback(uint64_t a1, void (*a2)(void), uint64_t a3, int a4)
{
  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3) {
      return *(double *)&v5;
    }
LABEL_8:
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    return *(double *)&v5;
  }
  if (!*(void *)(a1 + 24)) {
    goto LABEL_8;
  }
  if (*(unsigned char *)(a1 + 1))
  {
    long long v5 = *(_OWORD *)(a1 + 328);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 344);
    *(_OWORD *)a3 = v5;
  }
  else
  {
    a2();
    *(void *)&long long v5 = 0;
    *(_OWORD *)a3 = 0uLL;
    *(_DWORD *)(a3 + 16) = 0;
  }
  return *(double *)&v5;
}

uint64_t Img4DecodeCopyManifestDigest(uint64_t a1, void *__dst, size_t __n, uint64_t (**a4)(uint64_t, void, _OWORD *, size_t, void))
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = 6;
  if (a1)
  {
    if (__dst)
    {
      if (__n)
      {
        if (a4)
        {
          long long v7 = *a4;
          if (*a4)
          {
            uint64_t v8 = *(void *)(a1 + 24);
            if (v8)
            {
              if (__n > 0x30)
              {
                return 7;
              }
              else if (*(unsigned char *)(a1 + 1))
              {
                memcpy(__dst, (const void *)(a1 + 328), __n);
                return 0;
              }
              else
              {
                memset(v10, 0, sizeof(v10));
                uint64_t v4 = v7(v8, *(void *)(a1 + 32), v10, __n, a4);
                if (!v4) {
                  memcpy(__dst, v10, __n);
                }
              }
            }
            else
            {
              return 1;
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t Img4DecodeGetManifest(uint64_t a1, void *a2, _DWORD *a3)
{
  uint64_t result = 6;
  if (a1 && a2 && a3)
  {
    uint64_t v5 = *(void *)(a1 + 24);
    *a2 = v5;
    int v6 = *(_DWORD *)(a1 + 32);
    *a3 = v6;
    if (v5) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    int v8 = v7;
    return (v8 << 31 >> 31);
  }
  return result;
}

uint64_t Img4DecodeSectionExists(void *a1, unsigned int a2, char *a3)
{
  uint64_t v3 = 6;
  if (a2 <= 1 && a1 && a3)
  {
    if (a2 == 1)
    {
      if (!a1[55] || !a1[56]) {
        goto LABEL_11;
      }
    }
    else if (!a1[33] || !a1[34])
    {
LABEL_11:
      char v4 = 0;
      goto LABEL_12;
    }
    char v4 = 1;
LABEL_12:
    uint64_t v3 = 0;
    *a3 = v4;
  }
  return v3;
}

uint64_t Img4DecodeRestoreInfoExists(void *a1, char *a2)
{
  return Img4DecodeSectionExists(a1, 1u, a2);
}

uint64_t Img4DecodeGetRestoreInfoBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  return Img4DecodeGetBooleanFromSection(a1, 1u, a2, a3);
}

uint64_t Img4DecodeGetBooleanFromSection(uint64_t a1, unsigned int a2, uint64_t a3, BOOL *a4)
{
  memset(v8, 0, sizeof(v8));
  uint64_t v4 = 6;
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 1uLL, v8);
      uint64_t v4 = v6;
      if (!v6) {
        return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
      }
    }
  }
  return v4;
}

void Img4DecodeGetRestoreInfoInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
}

void Img4DecodeGetIntegerFromSection(uint64_t a1, unsigned int a2, uint64_t a3, _DWORD *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (!v5)
      {
        if (DERParseInteger((char **)&v6[1] + 1, a4)) {
          *a4 = 0;
        }
      }
    }
  }
}

void Img4DecodeGetRestoreInfoInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
}

void Img4DecodeGetInteger64FromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (!v5)
      {
        if (DERParseInteger64((char **)&v6[1] + 1, a4)) {
          *a4 = 0;
        }
      }
    }
  }
}

void Img4DecodeGetRestoreInfoData(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
}

void Img4DecodeGetDataFromSection(uint64_t a1, unsigned int a2, uint64_t a3, void *a4, void *a5)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      *a5 = 0;
      *a4 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
      *a5 = v8;
    }
  }
}

uint64_t Img4DecodePayloadPropertiesExists(uint64_t a1, BOOL *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 6;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t result = 6;
  memset(v7, 0, sizeof(v7));
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    uint64_t v5 = a1 + 8;
    if (v6)
    {
      uint64_t result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v7);
      if (!result) {
        *a2 = (void)v8 != 0;
      }
    }
  }
  return result;
}

void Img4DecodePayloadProperty(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (a4)
    {
      if (*(void *)(a1 + 8))
      {
        long long v10 = 0uLL;
        long long v9 = 0uLL;
        memset(v11, 0, sizeof(v11));
        memset(v12, 0, sizeof(v12));
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)v11))
        {
          if (*(void *)&v12[0])
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)v12, 0x2000000000000010, &v10);
            if (!v7)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011, &v9);
              if (!v8) {
                DERImg4DecodeFindProperty((unint64_t *)&v9, a2, a3, a4);
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodePayloadPropertyExistsByTag(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a1)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0uLL;
    long long v9 = 0uLL;
    long long v8 = 0uLL;
    if (a3)
    {
      if (*(void *)(a1 + 8))
      {
        long long v19 = 0uLL;
        long long v20 = 0uLL;
        long long v17 = 0uLL;
        long long v18 = 0uLL;
        long long v15 = 0uLL;
        long long v16 = 0uLL;
        long long v13 = 0uLL;
        long long v14 = 0uLL;
        long long v11 = 0uLL;
        long long v12 = 0uLL;
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)&v11))
        {
          if ((void)v17)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v17, 0x2000000000000010, &v10);
            if (!v5)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011, &v9);
              if (!v6)
              {
                DERImg4DecodeContentFindItemWithTag((unint64_t *)&v9, a2, &v8);
                if (!v7) {
                  *a3 = (void)v8 != 0;
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t Img4DecodeGetPayloadProperties(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 6;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t result = 6;
  memset(v8, 0, sizeof(v8));
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    uint64_t v5 = a1 + 8;
    if (v6)
    {
      uint64_t result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v8);
      if (!result)
      {
        if ((void)v9)
        {
          uint64_t result = 0;
          uint64_t v7 = *((void *)&v9 + 1);
          *a2 = v9;
          a2[1] = v7;
          return result;
        }
        return 6;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeCopyPayloadPropertiesDigest(void *a1, void *a2, size_t a3, uint64_t (**a4)(void, void, _OWORD *, size_t, void))
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t result = 6;
  if (a1 && a2 && a3)
  {
    if (a3 > 0x30)
    {
      return 7;
    }
    else if (a4)
    {
      long long v8 = *a4;
      if (*a4)
      {
        memset(v9, 0, sizeof(v9));
        uint64_t result = v8(*a1, a1[1], v9, a3, a4);
        if (!result)
        {
          memcpy(a2, v9, a3);
          return 0;
        }
      }
    }
  }
  return result;
}

void Img4DecodePayloadPropertiesFindItemWithTag(unint64_t *a1, unsigned int a2, void *a3)
{
  if (a1)
  {
    v23[0] = 0;
    v23[1] = 0;
    v22[0] = 0;
    v22[1] = 0;
    v21[0] = 0;
    v21[1] = 0;
    unint64_t v20 = 0;
    v19[0] = 0;
    v19[1] = 0;
    unint64_t v18 = 0;
    memset(v17, 0, sizeof(v17));
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    unint64_t v14 = 0;
    long long v13 = 0uLL;
    long long v12 = 0uLL;
    long long v11 = 0uLL;
    if (a3)
    {
      if (*a1)
      {
        DERImg4DecodeContentFindItemWithTag(a1, 0x2000000000000010, &v11);
        if (!v5)
        {
          if ((void)v11)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 22, &v13);
            if (!v6 && !DERImg4DecodeTagCompare((uint64_t)&v13, 0x50415950u))
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 0x2000000000000011, &v12);
              if (!v7 && !DERDecodeSeqContentInit((unint64_t *)&v12, v23))
              {
                while (1)
                {
                  do
                  {
                    while (1)
                    {
                      int v8 = DERDecodeSeqNext(v23, &v20);
                      if (!v8) {
                        break;
                      }
                      if (v8 == 1) {
                        return;
                      }
                    }
                  }
                  while (DERDecodeItem((uint64_t)v21, &v18));
                  DERImg4DecodeContentFindItemWithTag(v19, 22, &v13);
                  if (v9) {
                    break;
                  }
                  if (!DERImg4DecodeTagCompare((uint64_t)&v13, a2)
                    && !DERDecodeSeqContentInit(v19, v22)
                    && !DERDecodeSeqNext(v22, v17)
                    && v17[0] == 22
                    && !DERDecodeSeqNext(v22, &v14))
                  {
                    if (v15)
                    {
                      uint64_t v10 = v16;
                      *a3 = v15;
                      a3[1] = v10;
                    }
                    return;
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

void Img4DecodeGetPayloadPropertiesBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 1uLL, (unint64_t)v5);
  if (!v4) {
    DERParseBoolean((unsigned __int8 **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 2uLL, (unint64_t)v5);
  if (!v4) {
    DERParseInteger((char **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 2uLL, (unint64_t)v5);
  if (!v4) {
    DERParseInteger64((char **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesData(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  Img4DecodePayloadProperty(a1, a2, 4uLL, (unint64_t)&v8);
  if (!v6)
  {
    uint64_t v7 = v10;
    *a3 = *((void *)&v9 + 1);
    *a4 = v7;
  }
}

double Img4DecodeGetObjectProperty(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  v14[0] = 0;
  v14[1] = 0;
  double result = 0.0;
  memset(v13, 0, sizeof(v13));
  if (a1)
  {
    if (a5)
    {
      DERImg4DecodeParseManifestProperties(a1, (unint64_t)v14, 0);
      if (v10
        || (DERImg4DecodeFindProperty(v14, a2 | 0xE000000000000000, 0x2000000000000011uLL, (unint64_t)v13), v11)
        || (DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, a3, a4, (unint64_t)a5), v12))
      {
        double result = 0.0;
        a5[1] = 0u;
        a5[2] = 0u;
        *a5 = 0u;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeGetObjectPropertyBoolean(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  memset(v8, 0, sizeof(v8));
  uint64_t v4 = 6;
  if (a1 && a4)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 1uLL, v8);
    if (!v6) {
      return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
    }
    return v6;
  }
  return v4;
}

void Img4DecodeGetObjectPropertyInteger(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (v5 || DERParseInteger((char **)&v6[1] + 1, a4)) {
        *a4 = 0;
      }
    }
  }
}

void Img4DecodeGetObjectPropertyInteger64(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (v5 || DERParseInteger64((char **)&v6[1] + 1, a4)) {
        *a4 = 0;
      }
    }
  }
}

void Img4DecodeGetObjectPropertyData(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      uint64_t v8 = 0;
      *a4 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
    }
    *a5 = v8;
  }
}

void Img4DecodeGetObjectPropertyString(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 0x16uLL, &v9);
    if (v7)
    {
      uint64_t v8 = 0;
      *a4 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
    }
    *a5 = v8;
  }
}

void Img4DecodeGetPayloadVersionPropertyString(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (a3 && a4)
  {
    uint64_t v14 = 0;
    v15[0] = 0;
    v15[1] = 0;
    memset(v13, 0, sizeof(v13));
    long long v12 = 0uLL;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    if (DERDecodeItem(a1, (unint64_t *)&v14)
      || DERImg4DecodeProperty(v15, v14, (uint64_t)v13)
      || (DERImg4DecodeContentFindItemWithTag((unint64_t *)&v13[1] + 1, a2, &v12), v7)
      || DERImg4DecodeProperty(&v12, a2, (uint64_t)&v9))
    {
      uint64_t v8 = 0;
      *a3 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a3 = *((void *)&v10 + 1);
    }
    *a4 = v8;
  }
}

double Img4DecodeGetPropertyFromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  *(_OWORD *)long long v13 = 0uLL;
  if (a2 <= 1 && a1 && a5)
  {
    char v14 = 0;
    if (!Img4DecodeSectionExists((void *)a1, a2, &v14) && v14)
    {
      if (a2)
      {
        *(_OWORD *)long long v13 = *(_OWORD *)(a1 + 440);
        goto LABEL_9;
      }
      DERImg4DecodeParseManifestProperties(a1, 0, (unint64_t)v13);
      if (!v10)
      {
LABEL_9:
        DERImg4DecodeFindProperty(v13, a3, a4, (unint64_t)a5);
        if (!v12) {
          return result;
        }
      }
    }
    double result = 0.0;
    a5[1] = 0u;
    a5[2] = 0u;
    *a5 = 0u;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!result)
  {
    if (*((void *)&v9 + 1) != 2)
    {
      uint64_t result = 2;
      if (!a3) {
        return result;
      }
      goto LABEL_6;
    }
    if (!a3) {
      return 6;
    }
    uint64_t result = DERParseInteger((char **)&v8 + 1, a3);
  }
  if (!a3) {
    return result;
  }
LABEL_6:
  if (result) {
    *a3 = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!result)
  {
    if (*((void *)&v9 + 1) != 2)
    {
      uint64_t result = 2;
      if (!a3) {
        return result;
      }
      goto LABEL_6;
    }
    if (!a3) {
      return 6;
    }
    uint64_t result = DERParseInteger64((char **)&v8 + 1, a3);
  }
  if (!a3) {
    return result;
  }
LABEL_6:
  if (result) {
    *a3 = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!result)
  {
    if (*((void *)&v9 + 1) == 1)
    {
      if (a3) {
        return DERParseBoolean((unsigned __int8 **)&v8 + 1, a3);
      }
      else {
        return 6;
      }
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t Img4DecodeGetPropertyData(uint64_t *a1, uint64_t a2, void *a3, _DWORD *a4)
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  uint64_t result = 6;
  if (a3 && a4)
  {
    uint64_t v8 = *a1;
    uint64_t v9 = *((unsigned int *)a1 + 2);
    v11[0] = v8;
    v11[1] = v9;
    uint64_t result = DERImg4DecodeProperty(v11, a2 | 0xE000000000000000, (uint64_t)&v12);
    if (!result)
    {
      if (*((void *)&v14 + 1) == 4)
      {
        uint64_t result = 0;
        *a3 = *((void *)&v13 + 1);
        int v10 = v14;
LABEL_6:
        *a4 = v10;
        return result;
      }
      uint64_t result = 2;
    }
    int v10 = 0;
    *a3 = 0;
    goto LABEL_6;
  }
  return result;
}

void Img4DecodeEvaluateCertificateProperties(void *a1)
{
}

void Img4DecodeEvaluateCertificatePropertiesInternal(void *a1, _OWORD *a2)
{
  v21[0] = 0;
  v21[1] = 0;
  v20[0] = 0;
  v20[1] = 0;
  uint64_t v19 = 0;
  long long v18 = 0uLL;
  size_t __n = 0;
  uint64_t v17 = 0;
  uint64_t v14 = 0;
  __s1 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  memset(v9, 0, sizeof(v9));
  long long __s2 = 0uLL;
  long long v7 = 0uLL;
  if (a1 && a1[40] && !DERDecodeSeqInit((uint64_t)(a1 + 39), &v19, v21) && v19 == 0x2000000000000011)
  {
    while (1)
    {
      if (DERDecodeSeqNext(v21, (unint64_t *)&v17)) {
        return;
      }
      uint64_t v4 = (long long *)(a1 + 7);
      switch(v17)
      {
        case 0xE00000004D414E50:
LABEL_11:
          long long v7 = *v4;
          if (DERImg4DecodeProperty(&v18, v17, (uint64_t)&v11)
            || *((void *)&v13 + 1) != 0x2000000000000011
            || DERDecodeSeqContentInit((unint64_t *)&v12 + 1, v20))
          {
            return;
          }
          while (1)
          {
            int v5 = DERDecodeSeqNext(v20, (unint64_t *)&v14);
            if (v5) {
              break;
            }
            if (DERImg4DecodeProperty(&__s1, v14, (uint64_t)v9)) {
              return;
            }
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v7, v14, &__s2);
            if (*((void *)&v10 + 1) <= 4uLL && ((1 << SBYTE8(v10)) & 0x16) != 0)
            {
              if (v6) {
                return;
              }
              if (__n != *((void *)&__s2 + 1)) {
                return;
              }
              int v6 = memcmp(__s1, (const void *)__s2, __n);
              if (v6) {
                return;
              }
            }
            else if (*((void *)&v10 + 1) != 0xA000000000000000)
            {
              if (*((void *)&v10 + 1) != 0xA000000000000001 || v6 != 1) {
                return;
              }
              int v6 = 0;
            }
            if (v6) {
              return;
            }
          }
          if (v5 != 1) {
            return;
          }
          break;
        case 0xE00000006D616E78:
          if (a2) {
            *a2 = v18;
          }
          break;
        case 0xE00000004F424A50:
          uint64_t v4 = (long long *)(a1 + 9);
          if (a1[9]) {
            goto LABEL_11;
          }
          uint64_t v4 = (long long *)(a1 + 9);
          if (a1[10]) {
            goto LABEL_11;
          }
          break;
        default:
          return;
      }
    }
  }
}

void Img4DecodeCopyManifestTrustedBootPolicyMeasurement(void *a1, uint64_t a2, uint64_t a3, void *a4, size_t a5)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a4)
  {
    if (a5)
    {
      if (a5 <= 0x30)
      {
        memset(v17, 0, sizeof(v17));
        memset(v16, 0, sizeof(v16));
        v10[0] = Img4DecodeDigestInit;
        v10[1] = Img4DecodeDigestUpdate;
        _OWORD v10[2] = Img4DecodeDigestReturnHash;
        *(void *)&long long v13 = &default_manifest_property_exclude;
        *((void *)&v13 + 1) = 156;
        uint64_t v14 = a3;
        uint64_t v15 = v10;
        Img4DecodeEvaluateCertificatePropertiesInternal(a1, &v13);
        if (!v9)
        {
          if (a1)
          {
            if (a2)
            {
              v11[0] = &v13;
              v11[1] = a2;
              void v11[2] = a1;
              long long v12 = v17;
              if (!((unsigned int (*)(void, unsigned char **))*v15)(*(void *)(v14 + 32), &v12)
                && !Img4DecodeEvaluateDictionaryProperties(a1 + 7, 0, (uint64_t (*)(unint64_t, uint64_t *, uint64_t, uint64_t))_Img4DecodeValidateManifestPropertyInterposer, (uint64_t)v11)&& !((unsigned int (*)(void, unsigned char **, uint64_t, unsigned char *))v15[2])(*(void *)(v14 + 32), &v12, 48, v16))
              {
                memcpy(a4, v16, a5);
              }
            }
          }
        }
      }
    }
  }
}

uint64_t Img4DecodeEvaluateManifestProperties(uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 56), 0, a2, a3);
}

uint64_t Img4DecodeEvaluateDictionaryProperties(unint64_t *a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v15 = 0;
  unint64_t v16 = 0;
  unint64_t v14 = 0;
  v13[0] = 0;
  v13[1] = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v10 = 0;
  memset(v8, 0, sizeof(v8));
  long long v9 = 0u;
  if (!a3) {
    return 6;
  }
  uint64_t result = (uint64_t)DERDecodeSeqContentInit(a1, v13);
  if (!result)
  {
    while (1)
    {
      uint64_t result = DERDecodeSeqNext(v13, &v14);
      if (result == 1) {
        return 0;
      }
      if (result) {
        return result;
      }
      uint64_t result = DERImg4DecodeProperty(&v15, v14, (uint64_t)v8);
      if (result) {
        return result;
      }
      uint64_t result = 2;
      if (*((void *)&v9 + 1) > 0x16uLL
        || ((1 << SBYTE8(v9)) & 0x400016) == 0
        || !(v14 >> 62)
        || (v14 & 0x2000000000000000) == 0)
      {
        return result;
      }
      if (HIDWORD(v16)) {
        break;
      }
      uint64_t v10 = v15;
      LODWORD(v11) = v16;
      uint64_t v12 = *((void *)&v9 + 1);
      uint64_t result = a3(v14, &v10, a2, a4);
      if (result) {
        return result;
      }
    }
    return 7;
  }
  return result;
}

uint64_t Img4DecodeEvaluateObjectProperties(uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 72), 1, a2, a3);
}

double Img4DecodeInit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a3)
    {
      v9[0] = a1;
      v9[1] = a2;
      long long v7 = 0u;
      long long v8 = 0u;
      long long v5 = 0u;
      long long v6 = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 128) = 0u;
      *(_OWORD *)(a3 + 144) = 0u;
      *(_OWORD *)(a3 + 160) = 0u;
      *(_OWORD *)(a3 + 176) = 0u;
      *(_OWORD *)(a3 + 192) = 0u;
      *(_OWORD *)(a3 + 208) = 0u;
      *(_OWORD *)(a3 + 224) = 0u;
      *(_OWORD *)(a3 + 240) = 0u;
      *(_OWORD *)(a3 + 256) = 0u;
      *(_OWORD *)(a3 + 272) = 0u;
      *(_OWORD *)(a3 + 288) = 0u;
      *(_OWORD *)(a3 + 304) = 0u;
      *(_OWORD *)(a3 + 320) = 0u;
      *(_OWORD *)(a3 + 336) = 0u;
      *(_OWORD *)(a3 + 352) = 0u;
      *(_OWORD *)(a3 + 368) = 0u;
      *(_OWORD *)(a3 + 384) = 0u;
      *(_OWORD *)(a3 + 400) = 0u;
      *(_OWORD *)(a3 + 416) = 0u;
      *(_OWORD *)(a3 + 432) = 0u;
      *(void *)(a3 + 448) = 0;
      if (!DERImg4Decode(v9, (unint64_t)&v5)
        && !DERImg4DecodePayload((uint64_t)&v6, a3 + 88)
        && !DERImg4DecodeManifest(&v7, a3 + 232)
        && !DERImg4DecodeRestoreInfo((uint64_t)&v8, a3 + 424))
      {
        *(_OWORD *)(a3 + 8) = v6;
        double result = *(double *)&v7;
        *(_OWORD *)(a3 + 24) = v7;
      }
    }
  }
  return result;
}

double Img4DecodeInitPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a3)
  {
    *(void *)&long long v5 = a1;
    *((void *)&v5 + 1) = a2;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 80) = 0u;
    *(_OWORD *)(a3 + 96) = 0u;
    *(_OWORD *)(a3 + 112) = 0u;
    *(_OWORD *)(a3 + 128) = 0u;
    *(_OWORD *)(a3 + 144) = 0u;
    *(_OWORD *)(a3 + 160) = 0u;
    *(_OWORD *)(a3 + 176) = 0u;
    *(_OWORD *)(a3 + 192) = 0u;
    *(_OWORD *)(a3 + 208) = 0u;
    *(_OWORD *)(a3 + 224) = 0u;
    *(_OWORD *)(a3 + 240) = 0u;
    *(_OWORD *)(a3 + 256) = 0u;
    *(_OWORD *)(a3 + 272) = 0u;
    *(_OWORD *)(a3 + 288) = 0u;
    *(_OWORD *)(a3 + 304) = 0u;
    *(_OWORD *)(a3 + 320) = 0u;
    *(_OWORD *)(a3 + 336) = 0u;
    *(_OWORD *)(a3 + 352) = 0u;
    *(_OWORD *)(a3 + 368) = 0u;
    *(_OWORD *)(a3 + 384) = 0u;
    *(_OWORD *)(a3 + 400) = 0u;
    *(_OWORD *)(a3 + 416) = 0u;
    *(_OWORD *)(a3 + 432) = 0u;
    *(void *)(a3 + 448) = 0;
    if (!DERImg4DecodePayload((uint64_t)&v5, a3 + 88))
    {
      double result = *(double *)&v5;
      *(_OWORD *)(a3 + 8) = v5;
    }
  }
  return result;
}

uint64_t Img4DecodeInitManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 1, a3, 1229796429);
}

uint64_t Img4DecodeInitManifestCommon(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t result = 6;
  if (a1 && a4)
  {
    uint64_t v15 = a1;
    uint64_t v16 = a2;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)(a4 + 64) = 0u;
    *(_OWORD *)(a4 + 80) = 0u;
    *(_OWORD *)(a4 + 96) = 0u;
    *(_OWORD *)(a4 + 112) = 0u;
    *(_OWORD *)(a4 + 128) = 0u;
    *(_OWORD *)(a4 + 144) = 0u;
    *(_OWORD *)(a4 + 160) = 0u;
    *(_OWORD *)(a4 + 176) = 0u;
    *(_OWORD *)(a4 + 192) = 0u;
    *(_OWORD *)(a4 + 208) = 0u;
    *(_OWORD *)(a4 + 224) = 0u;
    *(_OWORD *)(a4 + 240) = 0u;
    *(_OWORD *)(a4 + 256) = 0u;
    *(_OWORD *)(a4 + 272) = 0u;
    *(_OWORD *)(a4 + 288) = 0u;
    *(_OWORD *)(a4 + 304) = 0u;
    *(_OWORD *)(a4 + 320) = 0u;
    *(_OWORD *)(a4 + 336) = 0u;
    *(_OWORD *)(a4 + 352) = 0u;
    *(_OWORD *)(a4 + 368) = 0u;
    *(_OWORD *)(a4 + 384) = 0u;
    *(_OWORD *)(a4 + 400) = 0u;
    *(_OWORD *)(a4 + 416) = 0u;
    *(_OWORD *)(a4 + 432) = 0u;
    *(void *)(a4 + 448) = 0;
    if (a5 == 1229796419)
    {
      unint64_t v10 = a4 + 232;
      if (a3) {
        uint64_t result = DERImg4DecodeCertificate(&v15, v10);
      }
      else {
        uint64_t result = DERImg4DecodeUnsignedCertificate(&v15, v10);
      }
    }
    else
    {
      if (a5 != 1229796429) {
        return 2;
      }
      unint64_t v9 = a4 + 232;
      if (a3) {
        uint64_t result = DERImg4DecodeManifest(&v15, v9);
      }
      else {
        uint64_t result = DERImg4DecodeUnsignedManifest(&v15, v9);
      }
    }
    if (!result)
    {
      if (*(void *)(a4 + 264))
      {
        unint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v15 = a1;
        uint64_t v16 = a2;
        uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)&v15, &v12, 0);
        if (!result)
        {
          *(void *)(a4 + 24) = a1;
          uint64_t v11 = v14 + v13 - a1;
          if (__CFADD__(v14, v13 - a1))
          {
            __break(0x5500u);
          }
          else
          {
            *(void *)(a4 + 32) = v11;
            if (v11 == a2) {
              return 0;
            }
            else {
              return 7;
            }
          }
        }
      }
      else
      {
        return 3;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeInitUnsignedManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 0, a3, 1229796429);
}

uint64_t Img4DecodeInitCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 1, a3, 1229796419);
}

uint64_t Img4DecodeInitUnsignedCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 0, a3, 1229796419);
}

uint64_t Img4DecodeEvaluateCertificateChain(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = 6;
  if (a1 && a2 && a3 && a4 && a7 && a6)
  {
    unint64_t v9 = *(void (**)(uint64_t))(a4 + 8);
    if (v9)
    {
      v9(a1);
      return 3;
    }
  }
  return result;
}

void Img4DecodeEvaluateTrustWithCallbacks(unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), unsigned int (*a4)(void, void, void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), unsigned int (*a5)(uint64_t, uint64_t), void (*a6)(void, void, uint64_t), uint64_t a7)
{
  memset(v17, 0, sizeof(v17));
  if (a2)
  {
    if (a3)
    {
      if (*(void *)(a2 + 24))
      {
        BOOL v16 = 0;
        a6(*(void *)(a2 + 264), *(void *)(a2 + 272), a2 + 376);
        if (!a4(*(void *)(a2 + 296), *(unsigned int *)(a2 + 304), *(void *)(a2 + 280), *(unsigned int *)(a2 + 288), a2 + 376, 20, a2 + 312, a2 + 320, a7))
        {
          DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
          if (!v14)
          {
            DERImg4DecodeFindProperty((unint64_t *)(a2 + 40), a1 | 0xE000000000000000, 0x2000000000000011uLL, (unint64_t)v17);
            if (!v15)
            {
              *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v17[1] + 8);
              if (!a5(a2, a7) && !Img4DecodePayloadExists(a2, &v16))
              {
                if (v16)
                {
                  a6(*(void *)(a2 + 8), *(void *)(a2 + 16), a2 + 184);
                  *(unsigned char *)a2 = 1;
                }
                if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0, a3, a7)
                  && !Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1, a3, a7))
                {
                  a6(*(void *)(a2 + 24), *(void *)(a2 + 32), a2 + 328);
                  *(unsigned char *)(a2 + 1) = 1;
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodePerformTrustEvaluation(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[1] = 0;
  v5[2] = 0;
  v5[0] = a3;
  _Img4DecodePerformTrustEvaluationWithCallbacksInternal(a1, a2, (uint64_t)v5, a4, 0, a5);
}

void Img4DecodePerformTrustEvaluatationWithCallbacks(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void Img4DecodePerformTrustEvaluatation(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[1] = 0;
  v5[2] = 0;
  v5[0] = a3;
  _Img4DecodePerformTrustEvaluationWithCallbacksInternal(a1, a2, (uint64_t)v5, a4, 0, a5);
}

uint64_t Img4DecodeVerifyChainIM4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, uint64_t a9, uint64_t a10)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v41 = 0;
  long long v39 = 0u;
  memset(v40, 0, sizeof(v40));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t result = 6;
  long long v17 = 0u;
  long long v18 = 0u;
  if (a3 && a4 && a5 && a6 && a7 && a8 && a9)
  {
    if (Img4DecodeInitManifestCommon(a3, a4, 1, (uint64_t)&v17, 1229796419)
      || (*(unsigned int (**)(void, void, char *, void, uint64_t))a9)(*((void *)&v33 + 1), v34, (char *)v40 + 8, **(void **)(a9 + 32), a9)|| (*(unsigned int (**)(uint64_t, uint64_t, void, void, char *, void, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))(a9 + 16))(a1, a2, *((void *)&v34 + 1), v35, (char *)v40 + 8, **(void **)(a9 + 32), a9, a10, v17, *((void *)&v17 + 1), v18, *((void *)&v18 + 1), v19,
           *((void *)&v19 + 1),
           v20,
           *((void *)&v20 + 1),
           v21,
           *((void *)&v21 + 1),
           v22,
           *((void *)&v22 + 1),
           v23,
           *((void *)&v23 + 1),
           v24,
           *((void *)&v24 + 1),
           v25,
           *((void *)&v25 + 1),
           v26,
           *((void *)&v26 + 1),
           v27,
           *((void *)&v27 + 1),
           v28,
           *((void *)&v28 + 1),
           v29,
           *((void *)&v29 + 1),
           v30,
           *((void *)&v30 + 1),
           v31,
           *((void *)&v31 + 1),
           v32,
           *((void *)&v32 + 1),
           v33))
    {
      return 0xFFFFFFFFLL;
    }
    else if (DERImg4DecodeCertificatePropertiesAndPubKey(*((uint64_t *)&v33 + 1), v34, a7, a8, a5, a6))
    {
      return 0xFFFFFFFFLL;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void Img4DecodePerformTrustEvaluationWithCallbacks(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void _Img4DecodePerformTrustEvaluationWithCallbacksInternal(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  memset(v24, 0, sizeof(v24));
  if (a2)
  {
    if (a3)
    {
      BOOL v21 = 0;
      if (a4)
      {
        if (*(void *)a3)
        {
          if (*(void *)a4)
          {
            if (*(void *)(a4 + 24))
            {
              if (*(void *)(a4 + 8))
              {
                if (*(void *)(a4 + 16))
                {
                  unint64_t v9 = *(void **)(a4 + 32);
                  if (v9)
                  {
                    if (*(void *)(a2 + 24) && *v9 <= 0x30uLL && !(*(unsigned int (**)(void))a4)())
                    {
                      *(unsigned char *)(a2 + 1) = 1;
                      uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 8);
                      if (v13
                        && (int v14 = (const void *)v13(a2, a6)) != 0
                        && !memcmp((const void *)(a2 + 328), v14, **(void **)(a4 + 32)))
                      {
                        int v15 = 0;
                      }
                      else
                      {
                        if ((*(unsigned int (**)(void, void, uint64_t *, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 8))(*(void *)(a2 + 296), *(void *)(a2 + 304), &v22, &v23, a2 + 312, a2 + 320, a4, a6)|| **(void **)(a4 + 32) > 0x30uLL|| (*(unsigned int (**)(void, void, uint64_t))a4)(*(void *)(a2 + 264), *(void *)(a2 + 272), a2 + 376)|| (*(unsigned int (**)(uint64_t, uint64_t, void, void, uint64_t, void, uint64_t, uint64_t))(a4 + 16))(v22, v23, *(void *)(a2 + 280), *(void *)(a2 + 288), a2 + 376,
                               **(void **)(a4 + 32),
                               a4,
                               a6))
                        {
                          return;
                        }
                        int v15 = 1;
                      }
                      DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
                      if (v16) {
                        return;
                      }
                      if ((a5 & 1) == 0)
                      {
                        long long v17 = *(unsigned int (**)(unint64_t *, unint64_t, uint64_t, _OWORD *, uint64_t))(a3 + 16);
                        unint64_t v18 = a1 | 0xE000000000000000;
                        long long v19 = (unint64_t *)(a2 + 40);
                        if (v17)
                        {
                          if (v17(v19, v18, 0x2000000000000011, v24, a6)) {
                            return;
                          }
                        }
                        else
                        {
                          DERImg4DecodeFindProperty(v19, v18, 0x2000000000000011uLL, (unint64_t)v24);
                          if (v20) {
                            return;
                          }
                        }
                        *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v24[1] + 8);
                      }
                      if ((!v15 || !(*(unsigned int (**)(uint64_t, uint64_t))(a4 + 24))(a2, a6))
                        && **(void **)(a4 + 32) <= 0x30uLL
                        && !Img4DecodePayloadExists(a2, &v21))
                      {
                        if (v21)
                        {
                          if ((*(unsigned int (**)(void, void, uint64_t, void, uint64_t))a4)(*(void *)(a2 + 8), *(void *)(a2 + 16), a2 + 184, **(void **)(a4 + 32), a4))
                          {
                            return;
                          }
                          *(unsigned char *)a2 = 1;
                        }
                        if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0, *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3, a6)&& (a5 & 1) == 0)
                        {
                          Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1, *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3, a6);
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

void Img4DecodePerformManifestTrustEvaluationWithCallbacks(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t _Img4DecodeValidateManifestPropertyInterposer(unsigned int a1, uint64_t a2, int a3, uint64_t a4)
{
  unsigned int v10 = a1;
  if (a3) {
    return 0xFFFFFFFFLL;
  }
  long long v8 = *(void **)a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  v12[0] = 0;
  v12[1] = 0;
  memset(v11, 0, sizeof(v11));
  if (v8
    && !DERImg4DecodeProperty(v8, 0xE00000006D616E78, (uint64_t)&v13)
    && *((void *)&v15 + 1) == 0x2000000000000011
    && !DERDecodeSeqContentInit((unint64_t *)&v14 + 1, v12))
  {
    unint64_t v9 = a1 | 0xE000000000000000;
    while (!DERDecodeSeqNext(v12, v11))
    {
      if (v11[0] == v9)
      {
        (*(void (**)(void, uint64_t, uint64_t, unsigned int *))(*(void *)(*(void *)a4 + 24) + 8))(*(void *)(*(void *)(*(void *)a4 + 16) + 32), a4 + 24, 4, &v10);
        return 0;
      }
    }
  }
  (*(void (**)(void, uint64_t, void, void))(*(void *)(*(void *)a4 + 24) + 8))(*(void *)(*(void *)(*(void *)a4 + 16) + 32), a4 + 24, *(unsigned int *)(a2 + 8), *(void *)a2);
  return 0;
}

uint64_t sha1_digest()
{
  return ccdigest();
}

uint64_t verify_signature_rsa3k(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v13[0] = a1;
  v13[1] = a2;
  v12[0] = a3;
  v12[1] = a4;
  v11[0] = a5;
  v11[1] = a6;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  if (!a4) {
    return 0xFFFFFFFFLL;
  }
  if (!a5) {
    return 0xFFFFFFFFLL;
  }
  if (!a6) {
    return 0xFFFFFFFFLL;
  }
  if (!a7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = *(void *)(a7 + 32);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  long long v8 = *(void ***)(v7 + 16);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v9 = *v8;
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  if (*v9 != a6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = verify_pkcs1_sig((uint64_t)v13, v9[4], (uint64_t)v11, (uint64_t)v12, 3072);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t verify_pkcs1_sig(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v18[4] = *MEMORY[0x263EF8340];
  if (a5 != 4096 && a5 != 3072) {
    return 0xFFFFFFFFLL;
  }
  v18[2] = 0;
  v18[3] = 0;
  unint64_t v6 = (unint64_t)(a5 + 63) >> 6;
  MEMORY[0x270FA5388]();
  long long v8 = (unint64_t *)((char *)v17 - v7);
  bzero((char *)v17 - v7, v7);
  *long long v8 = v6;
  uint64_t v9 = *(unsigned int *)(a1 + 8);
  v18[0] = *(void *)a1;
  v18[1] = v9;
  memset(v17, 0, sizeof(v17));
  uint64_t result = DERParseSequenceToObject((uint64_t)v18, (unsigned __int16)DERNumRSAPubKeyPKCS1ItemSpecs, (uint64_t)&DERRSAPubKeyPKCS1ItemSpecs, (unint64_t)v17, 0x20uLL, 0x20uLL);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v11 = *((void *)&v17[0] + 1);
  for (uint64_t i = *(unsigned char **)&v17[0]; v11; --v11)
  {
    if (*i) {
      break;
    }
    if (i == (unsigned char *)-1) {
      __break(0x5513u);
    }
    ++i;
  }
  if (v11 >= 0xFFFFFFFFFFFFFFF8)
  {
    __break(0x5500u);
    return result;
  }
  unint64_t v13 = (v11 + 7) >> 3;
  if (v13 > *v8) {
    return 0xFFFFFFFFLL;
  }
  *long long v8 = v13;
  if (ccrsa_make_pub()) {
    return 0xFFFFFFFFLL;
  }
  if (MEMORY[0x263EF87F8]) {
    BOOL v14 = MEMORY[0x263EF8010] == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    int v16 = ccrsa_verify_pkcs1v15_digest();
    if (!v16 && !cc_cmp_safe()) {
      return 0;
    }
    return 0xFFFFFFFFLL;
  }
  LOBYTE(v17[0]) = 0;
  int v15 = ccrsa_verify_pkcs1v15();
  uint64_t result = 0xFFFFFFFFLL;
  if (!v15 && LOBYTE(v17[0])) {
    return 0;
  }
  return result;
}

uint64_t verify_signature_rsa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v13[0] = a1;
  v13[1] = a2;
  v12[0] = a3;
  v12[1] = a4;
  v11[0] = a5;
  v11[1] = a6;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  if (!a4) {
    return 0xFFFFFFFFLL;
  }
  if (!a5) {
    return 0xFFFFFFFFLL;
  }
  if (!a6) {
    return 0xFFFFFFFFLL;
  }
  if (!a7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = *(void *)(a7 + 32);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  long long v8 = *(void ***)(v7 + 16);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = *v8;
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  if (*v9 != a6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = verify_pkcs1_sig((uint64_t)v13, v9[4], (uint64_t)v11, (uint64_t)v12, 4096);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

void verify_signature_ecdsa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              if (a7)
              {
                uint64_t v7 = *(void **)(a7 + 32);
                if (v7)
                {
                  if (v7[2] && *(void *)(a7 + 48) && *v7 == a6)
                  {
                    v8[0] = a1;
                    v8[1] = a2;
                    verify_ecdsa_sig(v8);
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

void verify_ecdsa_sig(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v12[7] = 0;
  ccec_x963_import_pub_size();
  if (ccec_keysize_is_supported())
  {
    cp = (void *)ccec_get_cp();
    uint64_t v3 = *cp;
    if (*cp >> 61 || !is_mul_ok(8 * v3, 3uLL))
    {
      __break(0x550Cu);
    }
    else
    {
      uint64_t v4 = 24 * v3;
      BOOL v5 = __CFADD__(v4, 16);
      uint64_t v6 = v4 + 16;
      if (!v5)
      {
        BOOL v5 = __CFADD__(v6, 16);
        uint64_t v7 = v6 + 16;
        if (!v5)
        {
          long long v8 = cp;
          unint64_t v9 = v7 - 1;
          MEMORY[0x270FA5388]();
          unint64_t v11 = &v12[-v10];
          bzero(&v12[-v10], v10);
          if (v9 < 0x10)
          {
            __break(1u);
          }
          else
          {
            *unint64_t v11 = v8;
            if (!MEMORY[0x223CA8960](v8, a1[1], *a1, v11)) {
              ccec_verify();
            }
          }
          return;
        }
      }
    }
    __break(0x5500u);
  }
}

uint64_t verify_chain_img4_v1(unint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v9 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(&v28, 0x2F0uLL);
        v26[0] = a1;
        v26[1] = v9;
        v27[0] = &ROOT_CA_CERTIFICATE;
        v27[1] = 1215;
        if (!_crack_chain_with_anchor(v26, (uint64_t)v27, 3u)
          && !parse_chain((uint64_t)v27, 3u, (uint64_t)&v29, (uint64_t)v31, (uint64_t)v34, (uint64_t)v37))
        {
          long long v24 = a6;
          uint64_t v15 = 0;
          int v16 = (const void **)v32;
          long long v17 = &v30;
          unint64_t v18 = (const void **)v32;
          while (1)
          {
            long long v19 = &v26[20 * v15];
            size_t v20 = v19[37];
            BOOL v21 = *v18;
            v18 += 20;
            if ((const void *)v20 != v21) {
              break;
            }
            if (memcmp((const void *)v19[36], *(v16 - 1), v20)) {
              break;
            }
            uint64_t result = verify_chain_signatures(&v34[v15], v17, a7);
            if (result) {
              break;
            }
            v17 += 6;
            ++v15;
            int v16 = v18;
            if (v15 == 2)
            {
              long long v25 = 0uLL;
              if ((unint64_t)v31 > 0xFFFFFFFFFFFFFF5FLL)
              {
LABEL_34:
                __break(0x5513u);
                return result;
              }
              v42[0] = 0;
              v42[1] = 0;
              unint64_t v40 = 0;
              v41[0] = 0;
              v41[1] = 0;
              if (DERDecodeSeqContentInit(v33, v42)) {
                return 0xFFFFFFFFLL;
              }
LABEL_14:
              if (!DERDecodeSeqNext(v42, &v40) && v40 == 0x2000000000000011)
              {
                v47[0] = 0;
                v47[1] = 0;
                unint64_t v45 = 0;
                v46[0] = 0;
                v46[1] = 0;
                long long v43 = 0u;
                long long v44 = 0u;
                if (!DERDecodeSeqContentInit(v41, v47))
                {
                  do
                  {
                    int v22 = DERDecodeSeqNext(v47, &v45);
                    if (v22)
                    {
                      if (v22 == 1) {
                        goto LABEL_14;
                      }
                      return 0xFFFFFFFFLL;
                    }
                    if (v45 != 0x2000000000000010
                      || DERParseSequenceContentToObject(v46, (unsigned __int16)DERNumAttributeTypeAndValueItemSpecs, (uint64_t)&DERAttributeTypeAndValueItemSpecs, (unint64_t)&v43, 0x20uLL, 0x20uLL))
                    {
                      return 0xFFFFFFFFLL;
                    }
                  }
                  while (!DEROidCompare((uint64_t)&oidCommonName, (uint64_t)&v43));
                  long long v25 = v44;
                  uint64_t result = DEROidCompare((uint64_t)&verify_chain_img4_v1_sboot_item, (uint64_t)&v25);
                  if (!result) {
                    return 0xFFFFFFFFLL;
                  }
                  if ((unint64_t)v34 > 0xFFFFFFFFFFFFFFDFLL) {
                    goto LABEL_34;
                  }
                  *a3 = v35;
                  *a4 = v36;
                  if ((unint64_t)v37 > 0xFFFFFFFFFFFFFFDFLL) {
                    goto LABEL_34;
                  }
                  if (!v38) {
                    return 0;
                  }
                  uint64_t v23 = v39;
                  if (!v39) {
                    return 0;
                  }
                  uint64_t result = 0;
                  if (a5)
                  {
                    if (v24)
                    {
                      uint64_t result = 0;
                      *a5 = v38;
                      *long long v24 = v23;
                    }
                  }
                  return result;
                }
              }
              return 0xFFFFFFFFLL;
            }
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t parse_chain(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = 0;
  uint64_t v15 = result;
  unint64_t v18 = ~result;
  unint64_t v17 = ~a3;
  unint64_t v14 = ~a4;
  unint64_t v13 = ~a5;
  unint64_t v11 = ~a6;
  uint64_t v10 = a2;
  while (1)
  {
    unint64_t v9 = 16 * v8;
    if (16 * v8 > v18 || 48 * v8 > v17) {
      break;
    }
    uint64_t result = DERParseSequenceToObject(v15 + 16 * v8, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a3 + 48 * v8, 0x30uLL, 0x30uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (160 * v8 > v14) {
      break;
    }
    uint64_t result = DERParseSequenceToObject(a3 + 48 * v8, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, a4 + 160 * v8, 0xA0uLL, 0xA0uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v13) {
      break;
    }
    long long v22 = 0u;
    long long v23 = 0u;
    char v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)(a4 + 160 * v8 + 96), (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v22, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL; {
    if (DERParseSequenceContentToObject((unint64_t *)&v22, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v19, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    }
    uint64_t result = DEROidCompare((uint64_t)&v19, (uint64_t)&oidRsa);
    if (!result) {
      return 0xFFFFFFFFLL;
    }
    if (*((void *)&v20 + 1))
    {
      if (*((void *)&v20 + 1) != 2 || *(unsigned char *)v20 != 5) {
        return 0xFFFFFFFFLL;
      }
      if ((void)v20 == -1) {
        break;
      }
      if (*(unsigned char *)(v20 + 1)) {
        return 0xFFFFFFFFLL;
      }
    }
    uint64_t result = DERParseBitString((uint64_t)&v23, (unint64_t *)(a5 + 16 * v8), &v21);
    if (result || v21) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v11) {
      break;
    }
    uint64_t result = parse_extensions(a4 + 160 * v8, (void *)(a6 + 16 * v8));
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (++v8 == v10) {
      return 0;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t verify_chain_signatures(void *a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  char v10 = 0;
  memset(v13, 0, sizeof(v13));
  unint64_t v8 = 0;
  uint64_t v9 = 0;
  BOOL v5 = *(void **)(a3 + 32);
  if (!v5
    || !v5[2]
    || !*(void *)a3
    || !*(void *)(a3 + 40)
    || *v5 > 0x30uLL
    || DERParseSequenceContentToObject(a2 + 2, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v11, 0x20uLL, 0x20uLL))
  {
    return 0xFFFFFFFFLL;
  }
  if (*((void *)&v12 + 1))
  {
    uint64_t result = DEROidCompare((uint64_t)&v11, (uint64_t)&oidEcPubKey);
    if ((result & 1) == 0)
    {
      if (*((void *)&v12 + 1) != 2 || *(unsigned char *)v12 != 5) {
        return 0xFFFFFFFFLL;
      }
      if ((void)v12 == -1)
      {
        __break(0x5513u);
        return result;
      }
      if (*(unsigned char *)(v12 + 1)) {
        return 0xFFFFFFFFLL;
      }
    }
  }
  if (!DEROidCompare((uint64_t)&v11, *(void *)(a3 + 40))) {
    return 0xFFFFFFFFLL;
  }
  if ((*(unsigned int (**)(void, void, _OWORD *, void, uint64_t))a3)(*a2, a2[1], v13, **(void **)(a3 + 32), a3))
  {
    return 0xFFFFFFFFLL;
  }
  if (DERParseBitString((uint64_t)(a2 + 4), &v8, &v10)) {
    return 0xFFFFFFFFLL;
  }
  if (v10) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = (*(uint64_t (**)(void, void, unint64_t, uint64_t, _OWORD *, void, uint64_t, void))(a3 + 16))(*a1, a1[1], v8, v9, v13, **(void **)(a3 + 32), a3, 0);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t verify_chain_img4_x86(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_x86);
}

uint64_t verify_chain_img4_v2_with_crack_callback(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, unsigned char *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v22, 0x300uLL);
        v21[0] = a1;
        v21[1] = v10;
        if (a8(v21, v22, 2)) {
          return 0xFFFFFFFFLL;
        }
        uint64_t result = parse_chain((uint64_t)v22, 2u, (uint64_t)v23, (uint64_t)&v24, (uint64_t)v27, (uint64_t)v28);
        if (result)
        {
          return 0xFFFFFFFFLL;
        }
        else
        {
          char v16 = 1;
          uint64_t v17 = 1;
          while ((v16 & 1) != 0)
          {
            unint64_t v18 = &v21[20 * v17];
            if (__n == v18[33] && !memcmp(__s1, (const void *)v18[32], __n))
            {
              uint64_t result = verify_chain_signatures(v27, &v23[3 * v17], a7);
              char v16 = 0;
              uint64_t v17 = 2;
              if (!result) {
                continue;
              }
            }
            return 0xFFFFFFFFLL;
          }
          if ((unint64_t)v27 > 0xFFFFFFFFFFFFFFEFLL
            || (*a3 = v27[2], *a4 = v27[3], (unint64_t)v28 > 0xFFFFFFFFFFFFFFEFLL))
          {
            __break(0x5513u);
          }
          else if (v29 && (uint64_t v19 = v30) != 0)
          {
            uint64_t result = 0;
            if (a5 && a6)
            {
              uint64_t result = 0;
              *a5 = v29;
              *a6 = v19;
            }
          }
          else
          {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t crack_chain_rsa4k_sha384_x86(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_X86_ROOT_CA_CERTIFICATE;
  a2[1] = 1382;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ddi(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_ddi);
}

uint64_t crack_chain_rsa4k_sha384_ddi(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_ROOT_CA_CERTIFICATE;
  a2[1] = 1394;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ddi_global(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_ddi_global);
}

uint64_t crack_chain_rsa4k_sha384_ddi_global(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1404;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ddi_fake(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_ddi_fake);
}

uint64_t crack_chain_rsa4k_sha384_ddi_fake(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_ROOT_CA_CERTIFICATE;
  a2[1] = 1425;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ddi_fake_global(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_ddi_fake_global);
}

uint64_t crack_chain_rsa4k_sha384_ddi_fake_global(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1435;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_avp(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_avp);
}

uint64_t crack_chain_rsa4k_sha384_avp(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_AVP_ROOT_CA_CERTIFICATE;
  a2[1] = 1431;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_tatsu_local_policy(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_tatsu_local_policy);
}

uint64_t crack_chain_rsa4k_sha384_tatsu_local_policy(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1382;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_tatsu_local_policy_hacktivate(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_tatsu_local_policy_hacktivate);
}

uint64_t crack_chain_rsa4k_sha384_tatsu_local_policy_hacktivate(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1442;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_v2_rsa3k(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa3k_sha384);
}

uint64_t crack_chain_rsa3k_sha384(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA3K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1118;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_v2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384);
}

uint64_t crack_chain_rsa4k_sha384(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1374;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_v2_AWG1(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_AWG1);
}

uint64_t crack_chain_rsa4k_sha384_AWG1(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE_AWG1;
  a2[1] = 1404;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_v2_PED(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_PED);
}

uint64_t crack_chain_rsa4k_sha384_PED(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_PED_ROOT_CA_CERTIFICATE;
  a2[1] = 1400;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ec_v1(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, unsigned char *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v27, 0x330uLL);
        v26[0] = a1;
        v26[1] = v10;
        if (!a8(v26, v27, 3)
          && !parse_ec_chain((uint64_t)v27, 3u, (uint64_t)&v28, (uint64_t)&v30, (unint64_t)v32, (unint64_t)&v35, (uint64_t)v36))
        {
          long long v25 = a4;
          uint64_t v15 = 0;
          char v16 = (const void **)v31;
          uint64_t v17 = &v29;
          unint64_t v18 = (const void **)v31;
          while (1)
          {
            uint64_t v19 = &v26[20 * v15];
            size_t v20 = v19[37];
            char v21 = *v18;
            v18 += 20;
            if ((const void *)v20 != v21) {
              break;
            }
            if (memcmp((const void *)v19[36], *(v16 - 1), v20)) {
              break;
            }
            uint64_t result = verify_chain_signatures(&v32[v15], v17, a7);
            if (result) {
              break;
            }
            v17 += 6;
            ++v15;
            char v16 = v18;
            if (v15 == 2)
            {
              if ((unint64_t)v32 > 0xFFFFFFFFFFFFFFDFLL
                || (*a3 = v33, *long long v25 = v34, (unint64_t)v36 > 0xFFFFFFFFFFFFFFDFLL))
              {
                __break(0x5513u);
              }
              else if (v37 && (uint64_t v22 = v38) != 0)
              {
                uint64_t result = 0;
                if (a5)
                {
                  if (a6)
                  {
                    uint64_t result = 0;
                    *a5 = v37;
                    *a6 = v22;
                  }
                }
              }
              else
              {
                return 0;
              }
              return result;
            }
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t parse_ec_chain(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7)
{
  if (!a2) {
    return 0;
  }
  unint64_t v9 = 0;
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  uint64_t v21 = result;
  unint64_t v24 = ~result;
  unint64_t v23 = ~a3;
  unint64_t v20 = ~a4;
  if (a5 <= a6) {
    unint64_t v12 = a6;
  }
  else {
    unint64_t v12 = a5;
  }
  unint64_t v19 = ~v12;
  unint64_t v16 = ~a7;
  uint64_t v15 = 16 * a2;
  while (v11 <= v24 && v10 <= v23)
  {
    uint64_t result = DERParseSequenceToObject(v21 + v11, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a3 + v10, 0x30uLL, 0x30uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v20) {
      break;
    }
    uint64_t result = DERParseSequenceToObject(a3 + v10, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, a4 + v9, 0xA0uLL, 0xA0uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (v11 > v19) {
      break;
    }
    long long v31 = 0u;
    long long v32 = 0u;
    char v30 = 0;
    long long v28 = 0u;
    long long v29 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)(a4 + v9 + 96), (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v31, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL; {
    if (DERParseSequenceContentToObject((unint64_t *)&v31, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v28, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    }
    if (!DEROidCompare((uint64_t)&v28, (uint64_t)&oidEcPubKey)) {
      return 0xFFFFFFFFLL;
    }
    if (DERParseBitString((uint64_t)&v32, (unint64_t *)(a5 + v11), &v30)) {
      return 0xFFFFFFFFLL;
    }
    if (v30) {
      return 0xFFFFFFFFLL;
    }
    unint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t result = DERDecodeItem((uint64_t)&v29, &v25);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    unint64_t v13 = (void *)(a6 + v11);
    uint64_t v14 = v27;
    *unint64_t v13 = v26;
    v13[1] = v14;
    if (v11 > v16) {
      break;
    }
    uint64_t result = parse_extensions(a4 + v9, (void *)(a7 + v11));
    if (result) {
      return 0xFFFFFFFFLL;
    }
    v11 += 16;
    v10 += 48;
    v9 += 160;
    if (v15 == v11) {
      return 0;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t verify_chain_img4_ecdsa256(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v2(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_ecdsa256_sha256);
}

uint64_t verify_chain_img4_ec_v2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, unsigned char *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1) {
    return result;
  }
  unsigned int v10 = a2;
  if (!a2 || !a3 || !a4) {
    return result;
  }
  bzero(v20, 0x220uLL);
  v19[0] = a1;
  v19[1] = v10;
  if (a8(v19, v20, 2)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = parse_ec_chain((uint64_t)v20, 2u, (uint64_t)v21, (uint64_t)v23, (unint64_t)v28, (unint64_t)&v29, (uint64_t)v30);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)v23 > 0xFFFFFFFFFFFFFF5FLL) {
    goto LABEL_22;
  }
  if (__n != v27) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = memcmp(__s1, __s2, __n);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)v21 > 0xFFFFFFFFFFFFFFCFLL)
  {
LABEL_22:
    __break(0x5513u);
    return result;
  }
  uint64_t result = verify_chain_signatures(v28, v22, a7);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)v28 > 0xFFFFFFFFFFFFFFEFLL) {
    goto LABEL_22;
  }
  uint64_t v16 = v28[3];
  *a3 = v28[2];
  *a4 = v16;
  if ((unint64_t)v30 > 0xFFFFFFFFFFFFFFEFLL) {
    goto LABEL_22;
  }
  if (!v31) {
    return 0;
  }
  uint64_t v17 = v32;
  if (!v32) {
    return 0;
  }
  uint64_t result = 0;
  if (a5)
  {
    if (a6)
    {
      uint64_t result = 0;
      *a5 = v31;
      *a6 = v17;
    }
  }
  return result;
}

uint64_t crack_chain_ecdsa256_sha256(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC256_SHA256_ROOT_CA_CERTIFICATE;
  a2[1] = 551;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ecdsa384(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v2(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_ecdsa384_sha384_hacktivate);
}

uint64_t crack_chain_ecdsa384_sha384_hacktivate(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 610;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ecdsa384_local_policy(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_ecdsa384_sha384);
}

uint64_t crack_chain_ecdsa384_sha384(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &EC384_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 542;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ecdsa384_hacktivate(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_ecdsa384_sha384_hacktivate);
}

uint64_t verify_chain_img4_ecdsa384_qa(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_ecdsa384_sha384_qa);
}

uint64_t crack_chain_ecdsa384_sha384_qa(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &QA_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 540;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t Img4DecodeDigestInit(uint64_t a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v1 = *(void **)(a1 + 16);
  if (!v1 || !*v1) {
    return 0xFFFFFFFFLL;
  }
  ccdigest_init();
  return 0;
}

uint64_t Img4DecodeDigestUpdate(uint64_t a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!**(void **)(a1 + 16)) {
    return 0xFFFFFFFFLL;
  }
  ccdigest_update();
  return 0;
}

uint64_t Img4DecodeDigestReturnHash(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = **(void **)(a1 + 16);
  if (!v4 || *(void *)v4 > a3) {
    return 0xFFFFFFFFLL;
  }
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 56))(v4, *a2, a4);
  return 0;
}

uint64_t Img4DecodeDigestFinal(uint64_t a1, void *a2, uint64_t a3)
{
  if (a1 && (uint64_t v3 = **(unint64_t ***)(a1 + 16)) != 0) {
    return Img4DecodeDigestReturnHash(a1, a2, *v3, a3);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t Img4DecodeComputeDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a5)
  {
    unint64_t v8 = *(void **)(a5 + 32);
    if (v8 && (unint64_t v9 = (void *)v8[2]) != 0 && *v8 == a4 && *v9 && *(void *)*v9 == a4)
    {
      ccdigest();
      return 0;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t img4_verify_signature_with_chain(unint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, void *a7, void *a8)
{
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  if (verify_chain_img4_v1(a1, a2, &v17, &v18, &v15, &v16, (uint64_t)kImg4DecodeSecureBootRsa1kSha1)) {
    return 0xFFFFFFFFLL;
  }
  *a7 = v15;
  *a8 = v16;
  uint64_t result = verify_signature_rsa(v17, v18, a3, a4, a5, a6, (uint64_t)kImg4DecodeSecureBootRsa1kSha1);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t _crack_chain_with_anchor(unint64_t *a1, uint64_t a2, unsigned int a3)
{
  unint64_t v18 = 0;
  unint64_t v19 = 0;
  unint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  unint64_t v5 = ~a2;
  unsigned int v6 = 1;
  unint64_t v7 = *a1;
  unint64_t v8 = a1[1];
  while (1)
  {
    unint64_t v18 = v7;
    unint64_t v19 = v8;
    uint64_t result = DERDecodeItem((uint64_t)&v18, &v15);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (__CFADD__(v16, v17)) {
      break;
    }
    unint64_t v10 = v16 + v17;
    unint64_t v11 = v16 + v17 - v7;
    BOOL v12 = !(v11 >> 17) && v8 >= v11;
    if (!v12 || v6 >= a3) {
      return 0xFFFFFFFFLL;
    }
    if (v5 < 16 * (unint64_t)v6) {
      break;
    }
    uint64_t v14 = (unint64_t *)(a2 + 16 * v6);
    *uint64_t v14 = v7;
    v14[1] = v11;
    if (v10 < v7) {
      break;
    }
    BOOL v12 = v8 >= v11;
    v8 -= v11;
    if (!v12) {
      goto LABEL_21;
    }
    ++v6;
    unint64_t v7 = v10;
    if (!v8)
    {
      if (v6 == a3) {
        return 0;
      }
      return 0xFFFFFFFFLL;
    }
  }
  __break(0x5513u);
LABEL_21:
  __break(0x5515u);
  return result;
}

uint64_t parse_extensions(uint64_t a1, void *a2)
{
  v11[0] = 0;
  v11[1] = 0;
  v9[1] = 0;
  uint64_t v10 = 0;
  unint64_t v8 = 0;
  v9[0] = 0;
  long long v7 = 0u;
  memset(v6, 0, sizeof(v6));
  *a2 = 0;
  a2[1] = 0;
  if (!*(void *)(a1 + 152)) {
    return 0;
  }
  if (DERDecodeSeqInit(a1 + 144, &v10, v11) || v10 != 0x2000000000000010) {
    return 0xFFFFFFFFLL;
  }
  char v3 = 1;
  while (1)
  {
    int v4 = DERDecodeSeqNext(v11, &v8);
    if (v4) {
      break;
    }
    if (v8 != 0x2000000000000010
      || DERParseSequenceContentToObject(v9, (unsigned __int16)DERNumExtensionItemSpecs, (uint64_t)&DERExtensionItemSpecs, (unint64_t)v6, 0x30uLL, 0x30uLL))
    {
      return 0xFFFFFFFFLL;
    }
    char v3 = 0;
    if (DEROidCompare((uint64_t)&oidAppleImg4ManifestCertSpec, (uint64_t)v6))
    {
      memset(v12, 0, sizeof(v12));
      if (DERDecodeItem((uint64_t)&v7, v12) || v12[0] != 0x2000000000000011) {
        return 0xFFFFFFFFLL;
      }
      char v3 = 0;
      *(_OWORD *)a2 = v7;
    }
  }
  if (v4 != 1 || (v3 & 1) != 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
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
  int v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_68;
  }
  unint64_t v5 = &v4[v3];
  unsigned int v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    BOOL v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      uint64_t v14 = v12 + 1;
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
          long long v28 = &v5[-v23];
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
    BOOL v12 = (char *)(v6 + 1);
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

uint64_t DERDecodeItemPartialBuffer(uint64_t result, unint64_t *a2, int a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  int v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_54;
  }
  unint64_t v5 = &v4[v3];
  unsigned int v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    BOOL v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_55;
      }
      uint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        BOOL v17 = v16 < v15 && a3 == 0;
        unint64_t v18 = (unint64_t)(v12 + 1);
        if (v17) {
          return 3;
        }
LABEL_28:
        if (v15 > (~v18 & 0x7FFFFFFFFFFFFFFFLL)) {
          return 7;
        }
        if (v18 <= v18 + v15)
        {
          uint64_t result = 0;
          a2[1] = v18;
          a2[2] = v15;
          return result;
        }
        goto LABEL_55;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4)
      {
LABEL_55:
        __break(0x5519u);
LABEL_56:
        __break(0x5515u);
        return result;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v18 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_55;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_56;
        }
        unsigned int v23 = *v14++;
        unint64_t v15 = (v15 << 8) | v23;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (v15 <= v22) {
            char v24 = 1;
          }
          else {
            char v24 = a3;
          }
          uint64_t result = 3;
          if (v15 >= 0x80 && (v24 & 1) != 0) {
            goto LABEL_28;
          }
          return result;
        }
      }
    }
LABEL_54:
    __break(0x5513u);
    goto LABEL_55;
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
      goto LABEL_54;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_55;
    }
    BOOL v12 = (char *)(v6 + 1);
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

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, unsigned char *a3)
{
  *a3 = 0;
  *a2 = 0;
  a2[1] = 0;
  if (!*(void *)(result + 8)) {
    return 3;
  }
  unsigned int v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  uint64_t v4 = *(void *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      unint64_t v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }
      unint64_t v6 = *(void *)result;
      unint64_t v7 = *(void *)result + v4;
      unint64_t v8 = (unsigned __int8 *)(*(void *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }
      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }
        unint64_t v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          uint64_t result = 0;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }
        goto LABEL_19;
      }
    }
    return 3;
  }
  if (v3) {
    return 3;
  }
  else {
    return 0;
  }
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  if (a1[1] != (unsigned __int8 *)1) {
    return 3;
  }
  int v2 = **a1;
  if (v2 != 255 && v2 != 0) {
    return 3;
  }
  uint64_t result = 0;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseBooleanWithDefault(unsigned __int8 **a1, BOOL a2, BOOL *a3)
{
  unsigned int v3 = a1[1];
  if (!v3) {
    goto LABEL_9;
  }
  if (v3 == (unsigned __int8 *)1)
  {
    int v4 = **a1;
    if (v4 == 255 || v4 == 0)
    {
      a2 = v4 != 0;
LABEL_9:
      uint64_t result = 0;
      *a3 = a2;
      return result;
    }
  }
  return 3;
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
  unsigned int v3 = (unsigned __int8 *)*a1;
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
  _OWORD v8[3] = *MEMORY[0x263EF8340];
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
  _OWORD v10[2] = *MEMORY[0x263EF8340];
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
  unint64_t v12[3] = *MEMORY[0x263EF8340];
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
  unint64_t v9[2] = *MEMORY[0x263EF8340];
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

BOOL DEROidCompare(uint64_t a1, uint64_t a2)
{
  BOOL result = 0;
  if (a1 && a2)
  {
    size_t v4 = *(void *)(a1 + 8);
    return v4 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v4) == 0;
  }
  return result;
}

void crop_packed_raw10_cold_1()
{
  __assert_rtn("crop_packed_raw10", "crop_packed_raw10.cpp", 173, "byteIndex+byteCount <= input_stride");
}

void crop_packed_raw10_cold_2()
{
  __assert_rtn("crop_packed_raw10", "crop_packed_raw10.cpp", 175, "y1 <= height");
}

void crop_packed_raw10_cold_3()
{
}

void crop_packed_raw10_cold_4()
{
}

void BKDMInitialize_cold_1()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_error_impl(&dword_222D7E000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.Daemon-Pearl'!\n", v0, 2u);
}

uint64_t __getSTMediaStatusDomainPublisherClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSTActivityAttributionClass_block_invoke_cold_1(v0);
}

uint64_t __getSTActivityAttributionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[BioLog initialize](v0);
}

uint64_t AMFDRSealingMapCopyLocalDataForClass()
{
  return MEMORY[0x270F91F80]();
}

uint64_t AMFDRSealingMapCopyLocalDictForClass()
{
  return MEMORY[0x270F91F90]();
}

uint64_t BKLogCode()
{
  return MEMORY[0x270F10C58]();
}

uint64_t BKLogEvent()
{
  return MEMORY[0x270F10C60]();
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

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
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

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE54D8](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, timeout);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x270EF3F50](*(void *)&connect, *(void *)&memoryType, *(void *)&intoTask, atAddress, ofSize, *(void *)&options);
}

kern_return_t IOConnectUnmapMemory(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x270EF3FB8](*(void *)&connect, *(void *)&memoryType, *(void *)&fromTask, atAddress);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
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

CFTypeRef IOPSCopyPowerSourcesInfo(void)
{
  return (CFTypeRef)MEMORY[0x270EF4910]();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return (CFArrayRef)MEMORY[0x270EF4918](blob);
}

CFDictionaryRef IOPSGetPowerSourceDescription(CFTypeRef blob, CFTypeRef ps)
{
  return (CFDictionaryRef)MEMORY[0x270EF4950](blob, ps);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x270EF49E8](*(void *)&mainPort, path);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x270EF4A38](*(void *)&entry, entryID);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x270EF4A80](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x270EF4A88](notifyPort, notificationType, matching, callback, refCon, notification);
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

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

void NSLog(NSString *format, ...)
{
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x270F58560]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x270F58568]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x270F585B0]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x270F585B8]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x270F585D8]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x270F585F8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

uint64_t PBRepeatedUInt32Add()
{
  return MEMORY[0x270F586F8]();
}

uint64_t PBRepeatedUInt32Clear()
{
  return MEMORY[0x270F58708]();
}

uint64_t PBRepeatedUInt32Copy()
{
  return MEMORY[0x270F58710]();
}

uint64_t PBRepeatedUInt32Hash()
{
  return MEMORY[0x270F58720]();
}

uint64_t PBRepeatedUInt32IsEqual()
{
  return MEMORY[0x270F58730]();
}

uint64_t PBRepeatedUInt32NSArray()
{
  return MEMORY[0x270F58740]();
}

uint64_t PBRepeatedUInt64Add()
{
  return MEMORY[0x270F58760]();
}

uint64_t PBRepeatedUInt64Clear()
{
  return MEMORY[0x270F58768]();
}

uint64_t PBRepeatedUInt64Copy()
{
  return MEMORY[0x270F58770]();
}

uint64_t PBRepeatedUInt64Hash()
{
  return MEMORY[0x270F58778]();
}

uint64_t PBRepeatedUInt64IsEqual()
{
  return MEMORY[0x270F58780]();
}

uint64_t PBRepeatedUInt64NSArray()
{
  return MEMORY[0x270F58788]();
}

uint64_t SecCMSCreateEnvelopedData()
{
  return MEMORY[0x270EFD6D0]();
}

uint64_t SecCertificateCreateWithPEM()
{
  return MEMORY[0x270EFD7F0]();
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

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

uint64_t absoluteToMiliseconds()
{
  return MEMORY[0x270F10C68]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x270ED87D8]();
}

uint64_t ccdigest()
{
  return MEMORY[0x270ED8A40]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x270ED8A48]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x270ED8A50]();
}

uint64_t ccec_get_cp()
{
  return MEMORY[0x270ED8AD0]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x270ED8AD8]();
}

uint64_t ccec_keysize_is_supported()
{
  return MEMORY[0x270ED8AE0]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x270ED8B00]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x270ED8B28]();
}

uint64_t ccrsa_make_pub()
{
  return MEMORY[0x270ED8D20]();
}

uint64_t ccrsa_verify_pkcs1v15()
{
  return MEMORY[0x270ED8D38]();
}

uint64_t ccrsa_verify_pkcs1v15_digest()
{
  return MEMORY[0x270ED8D48]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x270ED8D78]();
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x270ED8ED0](a1, *(void *)&a2, *(void *)&a3);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x270ED8F30](a1);
}

uint64_t dictionaryGetBool()
{
  return MEMORY[0x270F10C70]();
}

uint64_t dictionaryGetDouble()
{
  return MEMORY[0x270F10C78]();
}

uint64_t dictionaryGetInteger()
{
  return MEMORY[0x270F10C80]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x270ED95B8](when, delta);
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9AB8](a1, a2, a3, *(void *)&a4);
}

int ftw(const char *a1, int (__cdecl *a2)(const char *, const stat *, int), int a3)
{
  return MEMORY[0x270ED9B70](a1, a2, *(void *)&a3);
}

uint64_t getBootArgs()
{
  return MEMORY[0x270F10C88]();
}

uint64_t isEphemeralMultiUser()
{
  return MEMORY[0x270F10C90]();
}

uint64_t isInternalBuild()
{
  return MEMORY[0x270F10C98]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
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

uint64_t nanosecondsToAbsolute()
{
  return MEMORY[0x270F10CA0]();
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x270EDA858](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x270EDB128](a1);
}

uint64_t rootless_check_datavault_flag()
{
  return MEMORY[0x270EDB270]();
}

uint64_t rootless_mkdir_datavault()
{
  return MEMORY[0x270EDB280]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x270EDB4D0](*(void *)&a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

uint64_t tailspin_dump_output_with_options_sync()
{
  return MEMORY[0x270F9B9B8]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x270EDB868](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}