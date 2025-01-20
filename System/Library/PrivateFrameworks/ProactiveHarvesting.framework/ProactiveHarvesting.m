void sub_226C44414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226C44D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226C45274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void HVDataSourceAssertSingleSource(uint64_t a1, int8x8_t a2)
{
  a2.i32[0] = a1;
  uint8x8_t v3 = (uint8x8_t)vcnt_s8(a2);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.i32[0] != 1)
  {
    id v6 = [MEMORY[0x263F08690] currentHandler];
    v5 = [NSString stringWithUTF8String:"void HVDataSourceAssertSingleSource(HVDataSources)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v5, @"HVDataSources.m", 167, @"HVDataSourceAssertSingleSource(%u) failed.", a1);
  }
}

void sub_226C45610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id hv_default_log_handle()
{
  if (hv_default_log_handle__pasOnceToken2 != -1) {
    dispatch_once(&hv_default_log_handle__pasOnceToken2, &__block_literal_global_1213);
  }
  v0 = (void *)hv_default_log_handle__pasExprOnceResult;

  return v0;
}

uint64_t HVDataSourceForBundleIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"com.apple.mobilemail"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"com.apple.MobileSMS"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"com.apple.news"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"com.apple.mobilenotes"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"com.apple.parsecd"])
  {
    uint64_t v2 = 16;
  }
  else if ([v1 isEqualToString:@"com.apple.mobileslideshow"])
  {
    uint64_t v2 = 32;
  }
  else if ([v1 isEqualToString:@"com.apple.reminders"])
  {
    uint64_t v2 = 128;
  }
  else if ([v1 isEqualToString:@"com.apple.mobilesafari"])
  {
    uint64_t v2 = 256;
  }
  else if ([v1 isEqualToString:@"com.apple.siri"])
  {
    uint64_t v2 = 512;
  }
  else if ([v1 isEqualToString:@"com.apple.usernotificationsd"])
  {
    uint64_t v2 = 0x4000;
  }
  else if ([v1 hasPrefix:@"com.apple."])
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = 1024;
  }

  return v2;
}

void sub_226C46A14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
}

void sub_226C4787C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226C4800C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
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

void sub_226C48634(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_226C48C4C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void HVBatteryMonitoringStart()
{
  if (initBatteryMonitoring_onceToken != -1) {
    dispatch_once(&initBatteryMonitoring_onceToken, &__block_literal_global);
  }
}

void __initBatteryMonitoring_block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v1 = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, 0);

  uint64_t v2 = dispatch_queue_create("HVBatteryMonitoring", v1);
  int out_token = 0;
  notify_register_dispatch("com.apple.system.powersources.source", &out_token, v2, &__block_literal_global_6);
}

void __initBatteryMonitoring_block_invoke_2()
{
  updatePowerConnectionState();
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"kHVBatteryStateChangedNotification" object:0];
}

void updatePowerConnectionState()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  double v0 = IOPSGetTimeRemainingEstimate();
  if (v0 == -2.0) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  atomic_store(v1, (unsigned int *)&powerConnectionState);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    v2[0] = 67109120;
    v2[1] = v0 == -2.0;
    _os_log_debug_impl(&dword_226C41000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "AC: %i", (uint8_t *)v2, 8u);
  }
}

uint64_t HVIsConnectedToPower()
{
  double v0 = (void *)isConnectedToPowerOverrideForTesting;
  if (isConnectedToPowerOverrideForTesting)
  {
    return [v0 BOOLValue];
  }
  else
  {
    if (initBatteryMonitoring_onceToken != -1) {
      dispatch_once(&initBatteryMonitoring_onceToken, &__block_literal_global);
    }
    unsigned int v2 = atomic_load((unsigned int *)&powerConnectionState);
    if (!v2)
    {
      updatePowerConnectionState();
      unsigned int v2 = atomic_load((unsigned int *)&powerConnectionState);
    }
    return v2 == 1;
  }
}

void HVBatteryMonitoringOverrideIsConnectedToPowerForTesting(id obj)
{
}

BOOL HVPBContentStateEntryReadFrom(id *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
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
        if (v9++ >= 9)
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
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(HVPBContentState);
        objc_storeStrong(a1 + 1, v17);
        if (!PBReaderPlaceMark() || (HVPBContentStateReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_25;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    PBReaderReadString();
    v17 = (HVPBContentState *)objc_claimAutoreleasedReturnValue();
    if (v17) {
      [a1 addUniqueIds:v17];
    }
LABEL_25:

    goto LABEL_27;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_226C4A1EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__45(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__46(uint64_t a1)
{
}

uint64_t __machTimeToNanoseconds_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&machTimeToNanoseconds_machTimebaseInfo);
}

double _refillState(uint64_t a1)
{
  if (!+[HVUserDefaults harvestBudgetRefillDisabled])
  {
    if (*(_DWORD *)a1 != -1804290770)
    {
      *(_DWORD *)a1 = -1804290770;
      *(_DWORD *)(a1 + 20) = 0;
      *(void *)(a1 + 24) = 0;
    }
    uint64_t v3 = +[HVUserDefaults harvestBudgetNumberOfOperations];
    +[HVUserDefaults harvestBudgetCPUTimeSeconds];
    uint64_t v5 = 0x7FFFFFFFLL;
    if (v3 < 0x7FFFFFFF) {
      uint64_t v5 = v3;
    }
    *(_DWORD *)(a1 + 4) = v5 & ~(v5 >> 63);
    double result = v4 * 1000000000.0;
    *(void *)(a1 + 8) = (uint64_t)result;
    *(_DWORD *)(a1 + 16) = 200;
  }
  return result;
}

void sub_226C4C5EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  _Block_object_dispose(&a17, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void HVDataSourceForContentClass(uint64_t a1)
{
  if (objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1
    && objc_opt_class() != a1)
  {
    unsigned int v2 = (void *)MEMORY[0x263EFF940];
    uint64_t v3 = (void *)[[NSString alloc] initWithFormat:@"HVDataSourceForContentClass got unexpected class %@", a1];
    [v2 raise:@"HVDataSourceForContentClassUnexpectedClass" format:v3];

    __break(1u);
  }
}

id HVDataSourceDescription(int a1)
{
  unsigned int v2 = objc_opt_new();
  uint64_t v3 = v2;
  if (!a1)
  {
    double v4 = @"None";
LABEL_36:
    [v3 addObject:v4];
    goto LABEL_37;
  }
  if (a1)
  {
    [v2 addObject:@"Mail"];
    if ((a1 & 2) == 0)
    {
LABEL_4:
      if ((a1 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_22;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_4;
  }
  [v3 addObject:@"Messages"];
  if ((a1 & 4) == 0)
  {
LABEL_5:
    if ((a1 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 addObject:@"News"];
  if ((a1 & 8) == 0)
  {
LABEL_6:
    if ((a1 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 addObject:@"Notes"];
  if ((a1 & 0x10) == 0)
  {
LABEL_7:
    if ((a1 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v3 addObject:@"Parsec"];
  if ((a1 & 0x20) == 0)
  {
LABEL_8:
    if ((a1 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v3 addObject:@"Photos Photo View"];
  if ((a1 & 0x40) == 0)
  {
LABEL_9:
    if ((a1 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v3 addObject:@"Photos KnowledgeGraph"];
  if ((a1 & 0x80) == 0)
  {
LABEL_10:
    if ((a1 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v3 addObject:@"Reminders"];
  if ((a1 & 0x100) == 0)
  {
LABEL_11:
    if ((a1 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v3 addObject:@"Safari"];
  if ((a1 & 0x200) == 0)
  {
LABEL_12:
    if ((a1 & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v3 addObject:@"Siri"];
  if ((a1 & 0x400) == 0)
  {
LABEL_13:
    if ((a1 & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v3 addObject:@"Third Party App"];
  if ((a1 & 0x800) == 0)
  {
LABEL_14:
    if ((a1 & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v3 addObject:@"Interaction"];
  if ((a1 & 0x1000) == 0)
  {
LABEL_15:
    if ((a1 & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v3 addObject:@"UserActivity Metadata"];
  if ((a1 & 0x2000) == 0)
  {
LABEL_16:
    if ((a1 & 0x4000) == 0) {
      goto LABEL_17;
    }
LABEL_34:
    [v3 addObject:@"Notifications"];
    if ((a1 & 0x8000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_35;
  }
LABEL_33:
  [v3 addObject:@"Searchable UserActivity"];
  if ((a1 & 0x4000) != 0) {
    goto LABEL_34;
  }
LABEL_17:
  if ((a1 & 0x8000) != 0)
  {
LABEL_35:
    double v4 = @"Notification Stacks";
    goto LABEL_36;
  }
LABEL_37:
  uint64_t v5 = objc_msgSend(v3, "_pas_componentsJoinedByString:", @", ");

  return v5;
}

void HVDataSourceRunBlockPerSetBit(int a1, void *a2)
{
  uint64_t v3 = a2;
  char v5 = 0;
  for (uint64_t i = 1; ; uint64_t i = (2 * i))
  {
    if ((i & a1) != 0)
    {
      v3[2](v3, i, &v5);
      if (v5) {
        break;
      }
    }
    if (i > 0x4000) {
      break;
    }
  }
}

id HVDataSourceFileProtection(uint64_t a1, int8x8_t a2)
{
  int v2 = a1;
  HVDataSourceAssertSingleSource(a1, a2);
  if (v2 <= 127)
  {
    double v4 = (id *)MEMORY[0x263F08080];
    switch(v2)
    {
      case 0:
        goto LABEL_21;
      case 1:
        goto LABEL_23;
      case 2:
      case 4:
      case 8:
        goto LABEL_22;
      case 3:
      case 5:
      case 6:
      case 7:
        break;
      default:
        if ((v2 - 16) <= 0x30 && ((1 << (v2 - 16)) & 0x1000000010001) != 0) {
          goto LABEL_22;
        }
        break;
    }
  }
  else
  {
    if (v2 <= 2047)
    {
      if (v2 > 511)
      {
        if (v2 != 512)
        {
          if (v2 != 1024) {
            goto LABEL_24;
          }
          goto LABEL_21;
        }
      }
      else if (v2 != 128 && v2 != 256)
      {
        goto LABEL_24;
      }
LABEL_22:
      double v4 = (id *)MEMORY[0x263F08098];
      goto LABEL_23;
    }
    if (v2 >= 0x2000)
    {
      if (v2 != 0x2000)
      {
        if (v2 != 0x8000 && v2 != 0x4000) {
          goto LABEL_24;
        }
        goto LABEL_22;
      }
LABEL_21:
      double v4 = (id *)MEMORY[0x263F080B0];
LABEL_23:
      id v3 = *v4;
      goto LABEL_24;
    }
    if (v2 == 2048 || v2 == 4096) {
      goto LABEL_21;
    }
  }
LABEL_24:

  return v3;
}

uint64_t HVDataSourceUsedForMultipleBundles(int a1)
{
  HIDWORD(v1) = a1;
  LODWORD(v1) = a1 - 1024;
  return ((v1 >> 10) < 8) & (0x8Bu >> (v1 >> 10));
}

id HVDataSourceContentStateKey(int a1, void *a2)
{
  id v3 = a2;
  double v4 = (void *)MEMORY[0x22A6667F0]();
  char v5 = objc_opt_new();
  HIDWORD(v7) = a1;
  LODWORD(v7) = a1 - 1024;
  unsigned int v6 = v7 >> 10;
  BOOL v8 = v6 > 7;
  int v9 = (1 << v6) & 0x8B;
  if (!v8 && v9 != 0)
  {
    uint64_t v11 = [v3 bundleId];
    [v5 addObject:v11];
  }
  unint64_t v12 = [v3 uniqueId];
  [v5 addObject:v12];

  if (objc_opt_respondsToSelector())
  {
    char v13 = [v3 personaId];
    if (v13) {
      [v5 addObject:v13];
    }
  }
  v14 = objc_msgSend(v5, "_pas_componentsJoinedByString:", @":");

  return v14;
}

void sub_226C4E308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226C4ECE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void *__getSPGetDisabledBundleSetSymbolLoc_block_invoke(void *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!SearchLibraryCore_frameworkLibrary)
  {
    v5[1] = (void *)MEMORY[0x263EF8330];
    v5[2] = (void *)3221225472;
    v5[3] = __SearchLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2647D4EA0;
    uint64_t v7 = 0;
    SearchLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  int v2 = (void *)SearchLibraryCore_frameworkLibrary;
  if (!SearchLibraryCore_frameworkLibrary)
  {
    a1 = [MEMORY[0x263F08690] currentHandler];
    int v2 = [NSString stringWithUTF8String:"void * _Nonnull SearchLibrary(void)"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, @"HVContentAdmission.m", 348, @"%s", v5[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v3 = v5[0];
  if (v5[0]) {
LABEL_7:
  }
    free(v3);
  double result = dlsym(v2, "SPGetDisabledBundleSet");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  getSPGetDisabledBundleSetSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(a1[4] + 8) + 24);
  return result;
}

uint64_t __SearchLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SearchLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_226C4F320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__335(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__336(uint64_t a1)
{
}

void sub_226C4FB98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

BOOL HVPBDeprecatedContentStateEntryReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  double v4 = (int *)MEMORY[0x263F62288];
  char v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
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
        if (v9++ >= 9)
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
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        v18 = *(HVPBContentState **)(a1 + 16);
        *(void *)(a1 + 16) = v17;
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    v18 = objc_alloc_init(HVPBContentState);
    objc_storeStrong((id *)(a1 + 8), v18);
    if (!PBReaderPlaceMark() || (HVPBContentStateReadFrom((uint64_t)v18, a2) & 1) == 0)
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL HVCaseInsensitiveEqual(const __CFString *a1, const __CFString *a2)
{
  CFIndex Length = CFStringGetLength(a1);
  if (Length != CFStringGetLength(a2)) {
    return 0;
  }
  v6.location = 0;
  v6.length = Length;
  return CFStringCompareWithOptions(a1, a2, v6, 1uLL) == kCFCompareEqualTo;
}

uint64_t HVCaseInsensitiveStringHash(const __CFString *a1)
{
  unint64_t Length = CFStringGetLength(a1);
  if (Length)
  {
    unsigned int CharacterAtIndex = CFStringGetCharacterAtIndex(a1, 0);
    if (CharacterAtIndex > 0x7F)
    {
      unsigned int v4 = (unsigned __int16)__tolower(CharacterAtIndex);
    }
    else if (CharacterAtIndex - 65 >= 0x1A)
    {
      unsigned int v4 = CharacterAtIndex;
    }
    else
    {
      unsigned int v4 = CharacterAtIndex + 32;
    }
    if (Length >= 2)
    {
      unsigned int v5 = CFStringGetCharacterAtIndex(a1, Length - 1);
      if (v5 > 0x7F)
      {
        unsigned int v6 = (unsigned __int16)__tolower(v5);
      }
      else if (v5 - 65 >= 0x1A)
      {
        unsigned int v6 = v5;
      }
      else
      {
        unsigned int v6 = v5 + 32;
      }
      unsigned int v4 = 65537 * v4 + v6;
    }
  }
  else
  {
    unsigned int v4 = 0;
  }
  return v4 * Length;
}

void sub_226C519F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__630(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__631(uint64_t a1)
{
}

void sub_226C545F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__730(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__731(uint64_t a1)
{
}

void sub_226C54C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 160), 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_226C54F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226C56864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226C56C7C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_226C57260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226C58460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_226C58600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226C587E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1010(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1011(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__242(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x22A6669E0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__243(uint64_t a1)
{
}

void sub_226C5A9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_226C5B388(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_226C5B86C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226C5C478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226C5CD58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226C5D318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t __Block_byref_object_copy__1140(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1141(uint64_t a1)
{
}

void sub_226C5D840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_226C5DB7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226C5DDF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_226C5DF4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226C5E51C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_226C5E794(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_226C5F068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void __hv_default_log_handle_block_invoke()
{
  double v0 = (void *)MEMORY[0x22A6667F0]();
  os_log_t v1 = os_log_create("com.apple.proactive.ProactiveHarvesting", "Default");
  uint64_t v2 = (void *)hv_default_log_handle__pasExprOnceResult;
  hv_default_log_handle__pasExprOnceResult = (uint64_t)v1;
}

id hv_xpc_server_log_handle()
{
  if (hv_xpc_server_log_handle__pasOnceToken3 != -1) {
    dispatch_once(&hv_xpc_server_log_handle__pasOnceToken3, &__block_literal_global_5);
  }
  double v0 = (void *)hv_xpc_server_log_handle__pasExprOnceResult;

  return v0;
}

void __hv_xpc_server_log_handle_block_invoke()
{
  double v0 = (void *)MEMORY[0x22A6667F0]();
  os_log_t v1 = os_log_create("com.apple.proactive.ProactiveHarvesting", "XPCServer");
  uint64_t v2 = (void *)hv_xpc_server_log_handle__pasExprOnceResult;
  hv_xpc_server_log_handle__pasExprOnceResult = (uint64_t)v1;
}

id hv_default_signpost_handle()
{
  if (hv_default_signpost_handle__pasOnceToken4 != -1) {
    dispatch_once(&hv_default_signpost_handle__pasOnceToken4, &__block_literal_global_8);
  }
  double v0 = (void *)hv_default_signpost_handle__pasExprOnceResult;

  return v0;
}

void __hv_default_signpost_handle_block_invoke()
{
  double v0 = (void *)MEMORY[0x22A6667F0]();
  os_log_t v1 = os_log_create("com.apple.proactive.ProactiveHarvesting.Signposts", "Default");
  uint64_t v2 = (void *)hv_default_signpost_handle__pasExprOnceResult;
  hv_default_signpost_handle__pasExprOnceResult = (uint64_t)v1;
}

id hv_scheduled_task_signpost_handle()
{
  if (hv_scheduled_task_signpost_handle__pasOnceToken5 != -1) {
    dispatch_once(&hv_scheduled_task_signpost_handle__pasOnceToken5, &__block_literal_global_10_1217);
  }
  double v0 = (void *)hv_scheduled_task_signpost_handle__pasExprOnceResult;

  return v0;
}

void __hv_scheduled_task_signpost_handle_block_invoke()
{
  double v0 = (void *)MEMORY[0x22A6667F0]();
  os_log_t v1 = os_log_create("com.apple.proactive.ProactiveHarvesting.Signposts", "ScheduledTask");
  uint64_t v2 = (void *)hv_scheduled_task_signpost_handle__pasExprOnceResult;
  hv_scheduled_task_signpost_handle__pasExprOnceResult = (uint64_t)v1;
}

void sub_226C5F988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __Block_byref_object_copy__1255(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1256(uint64_t a1)
{
}

uint64_t HVPBContentStateReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  unsigned int v4 = (int *)MEMORY[0x263F62288];
  unsigned int v5 = (int *)MEMORY[0x263F62270];
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
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
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
            goto LABEL_33;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_35:
        *(_DWORD *)(a1 + 16) = v20;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        if (v17) {
          [(id)a1 addConsumers:v17];
        }
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

void sub_226C64A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1797(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1798(uint64_t a1)
{
}

void sub_226C64C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_226C64F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_226C65154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_226C6531C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_226C654FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_226C656D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_226C658B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_226C65A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_226C65C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void __bomData_block_invoke()
{
  double v0 = (void *)MEMORY[0x22A6667F0]();
  __int16 v3 = -257;
  uint64_t v1 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v3 length:2];
  uint64_t v2 = (void *)bomData__pasExprOnceResult;
  bomData__pasExprOnceResult = v1;
}

id nullByteData()
{
  if (nullByteData__pasOnceToken2 != -1) {
    dispatch_once(&nullByteData__pasOnceToken2, &__block_literal_global_1885);
  }
  double v0 = (void *)nullByteData__pasExprOnceResult;

  return v0;
}

void __nullByteData_block_invoke()
{
  double v0 = (void *)MEMORY[0x22A6667F0]();
  uint64_t v1 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:"" length:1];
  uint64_t v2 = (void *)nullByteData__pasExprOnceResult;
  nullByteData__pasExprOnceResult = v1;
}

void HVExit(int a1)
{
}

void sub_226C66DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void HVSHA256String(void *a1, CC_SHA256_CTX *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  __int16 v3 = a1;
  CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
  if (CStringPtr)
  {
    CC_SHA256_Update(a2, CStringPtr, [(__CFString *)v3 length]);
  }
  else
  {
    long long v38 = 0u;
    long long v39 = 0u;
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
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    *(_OWORD *)buffer = 0u;
    long long v9 = 0u;
    CFIndex usedBufLen = 0;
    CFIndex v5 = [(__CFString *)v3 length];
    CFIndex v6 = 0;
    while (1)
    {
      v41.location = v6;
      v41.length = v5;
      if (!CFStringGetBytes(v3, v41, 0x8000100u, 0, 0, buffer, 512, &usedBufLen)) {
        break;
      }
      CC_SHA256_Update(a2, buffer, usedBufLen);
      v6 += usedBufLen;
      v5 -= usedBufLen;
    }
  }
}

void sub_226C68A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void charactersSAX(void *a1, uint64_t a2, int a3)
{
  CFIndex v5 = a1;
  if (v5 && a3 && a2 && !*((unsigned char *)v5 + 144))
  {
    CFIndex v6 = v5;
    [v5[16] appendBytes:a2 length:a3];
    CFIndex v5 = v6;
  }
}

void endElementSAX(void *a1, const xmlChar *a2)
{
  CFIndex v6 = a1;
  if (!strcmp((const char *)a2, "title") || !strcmp((const char *)a2, "script") || !strcmp((const char *)a2, "style"))
  {
    uint64_t v4 = (uint64_t)v6;
    if (v6) {
      v6[144] = 0;
    }
  }
  else if (!strcmp((const char *)a2, "br"))
  {
    uint64_t v4 = (uint64_t)v6;
    if (v6)
    {
      v6[120] = 0;
      -[HVHtmlParser _newBlock]((uint64_t)v6);
      uint64_t v4 = (uint64_t)v6;
    }
  }
  else
  {
    __int16 v3 = htmlTagLookup(a2);
    uint64_t v4 = (uint64_t)v6;
    if (v3)
    {
      if (!v3->isinline)
      {
        int v5 = strcmp((const char *)a2, "pre");
        -[HVHtmlParser _newBlock]((uint64_t)v6);
        uint64_t v4 = (uint64_t)v6;
        if (v6)
        {
          if (!v5 && v6[145]) {
            v6[145] = 0;
          }
        }
      }
    }
  }
  -[HVHtmlParser _tagEnd](v4);
}

void startElementSAX(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  int v5 = a1;
  uint64_t v6 = (uint64_t)v5;
  if (v5) {
    ++v5[23];
  }
  if (!strcmp(a2, "title") || !strcmp(a2, "script") || !strcmp(a2, "style"))
  {
    if (v6) {
      *(unsigned char *)(v6 + 144) = 1;
    }
LABEL_37:
    int v17 = strcmp(a2, "a");
    if (!a3 || v17) {
      goto LABEL_132;
    }
    while (1)
    {
      uint64_t v18 = (void *)MEMORY[0x22A6667F0]();
      if (!strcmp(*(const char **)a3, "href")) {
        break;
      }
      uint64_t v19 = *(void *)(a3 + 16);
      a3 += 16;
      if (!v19) {
        goto LABEL_132;
      }
    }
    uint64_t v20 = *(void *)(a3 + 8);
    if (!v20)
    {
LABEL_131:
      goto LABEL_132;
    }
    long long v21 = (void *)[[NSString alloc] initWithCString:v20 encoding:4];
    if (!v21) {
      goto LABEL_130;
    }
    unint64_t v22 = 0x263EFF000uLL;
    long long v23 = (void *)[objc_alloc(NSURL) initWithString:v21];
    if (!v23)
    {
      long long v24 = (void *)MEMORY[0x22A6667F0]();
      long long v25 = v21;
      long long v26 = self;

      if (!v26) {
        goto LABEL_90;
      }
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      *(_OWORD *)buffer = 0u;
      long long v94 = 0u;
      CFIndex Length = CFStringGetLength(v25);
      CFStringRef theString = v25;
      uint64_t v104 = 0;
      CFIndex v105 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v25);
      CStringPtr = 0;
      v102 = CharactersPtr;
      if (!CharactersPtr) {
        CStringPtr = CFStringGetCStringPtr(v25, 0x600u);
      }
      int64_t v106 = 0;
      int64_t v107 = 0;
      v103 = CStringPtr;
      if (Length > 0)
      {
        v83 = v24;
        v84 = v25;
        v86 = v21;
        uint64_t v30 = 0;
        int64_t v31 = 0;
        int64_t v32 = 0;
        uint64_t v33 = 64;
        uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
        unint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
        unint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          if ((unint64_t)v32 >= 4) {
            uint64_t v37 = 4;
          }
          else {
            uint64_t v37 = v32;
          }
          CFIndex v38 = v105;
          if (v105 > v32)
          {
            if (v102)
            {
              UniChar v39 = v102[v32 + v104];
            }
            else if (v103)
            {
              UniChar v39 = v103[v104 + v32];
            }
            else
            {
              if (v107 <= v32 || v31 > v32)
              {
                uint64_t v41 = v37 + v30;
                uint64_t v42 = v33 - v37;
                int64_t v43 = v32 - v37;
                uint64_t v87 = v34;
                CFIndex v44 = v43 + 64;
                if (v43 + 64 >= v105) {
                  CFIndex v44 = v105;
                }
                int64_t v106 = v43;
                int64_t v107 = v44;
                if (v105 >= v42) {
                  CFIndex v38 = v42;
                }
                v109.length = v38 + v41;
                v109.location = v43 + v104;
                CFStringGetCharacters(theString, v109, buffer);
                uint64_t v34 = v87;
                int64_t v31 = v106;
              }
              UniChar v39 = buffer[v32 - v31];
            }
            if (v39 == 35)
            {
              if (v36 == 0x7FFFFFFFFFFFFFFFLL) {
                unint64_t v36 = v32;
              }
            }
            else if (v39 == 63)
            {
              if (v35 == 0x7FFFFFFFFFFFFFFFLL && v36 == 0x7FFFFFFFFFFFFFFFLL)
              {
                unint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
                unint64_t v35 = v32;
              }
            }
            else if (v39 == 47 && v35 == 0x7FFFFFFFFFFFFFFFLL && v36 == 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
              if (v34 == 0x7FFFFFFFFFFFFFFFLL)
              {
                unint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
                uint64_t v34 = v32;
              }
              else
              {
                if (v32 == v34 + 1) {
                  uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
                }
                unint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
              }
            }
          }
          ++v32;
          --v30;
          ++v33;
        }
        while (Length != v32);
        uint64_t v88 = v34;
        long long v25 = v84;

        if (v36 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v82 = [(__CFString *)v84 length] - (v36 + 1);
          v47 = [(__CFString *)v84 substringWithRange:v36 + 1];
          v48 = [MEMORY[0x263F08708] URLFragmentAllowedCharacterSet];
          v49 = [v47 stringByAddingPercentEncodingWithAllowedCharacters:v48];

          if (v49)
          {
            uint64_t v50 = -[__CFString stringByReplacingCharactersInRange:withString:](v84, "stringByReplacingCharactersInRange:withString:", v36 + 1, v82, v49);

            long long v25 = (__CFString *)v50;
          }
        }
        if (v35 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v52 = [(__CFString *)v25 length];
          if (v36 >= v52) {
            unint64_t v53 = v52;
          }
          else {
            unint64_t v53 = v36;
          }
          unint64_t v85 = v53 - (v35 + 1);
          v54 = [(__CFString *)v25 substringWithRange:v35 + 1];
          v55 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
          v56 = [v54 stringByAddingPercentEncodingWithAllowedCharacters:v55];

          if (v56)
          {
            uint64_t v57 = -[__CFString stringByReplacingCharactersInRange:withString:](v25, "stringByReplacingCharactersInRange:withString:", v35 + 1, v85, v56);

            long long v25 = (__CFString *)v57;
          }
        }
        if (v88 == 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v22 = 0x263EFF000;
          long long v24 = v83;
        }
        else
        {
          if (v36 >= v35) {
            unint64_t v58 = v35;
          }
          else {
            unint64_t v58 = v36;
          }
          unint64_t v59 = [(__CFString *)v25 length];
          if (v58 >= v59) {
            unint64_t v60 = v59;
          }
          else {
            unint64_t v60 = v58;
          }
          unint64_t v61 = v60 - (v88 + 1);
          v62 = -[__CFString substringWithRange:](v25, "substringWithRange:", v88 + 1, v61);
          v63 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
          v64 = [v62 stringByAddingPercentEncodingWithAllowedCharacters:v63];

          if (v64)
          {
            uint64_t v65 = -[__CFString stringByReplacingCharactersInRange:withString:](v25, "stringByReplacingCharactersInRange:withString:", v88 + 1, v61, v64);

            long long v25 = (__CFString *)v65;
          }
          long long v21 = v86;
          unint64_t v22 = 0x263EFF000uLL;
          long long v24 = v83;
        }
      }
      else
      {
LABEL_90:
      }
      v66 = [(__CFString *)v25 stringByReplacingOccurrencesOfString:@" ", @"%20", 2, 0, [(__CFString *)v25 length] withString options range];

      long long v23 = (void *)[objc_alloc(*(Class *)(v22 + 2608)) initWithString:v66];
      if (!v23)
      {
LABEL_130:

        goto LABEL_131;
      }
    }
    id v67 = [v23 host];
    if ([v67 compare:@"apple.com" options:3]
      && [v67 rangeOfString:@".apple.com" options:15] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v68 = v67;
      if ([v68 compare:@"icloud.com" options:3])
      {
        uint64_t v69 = [v68 rangeOfString:@".icloud.com" options:15];

        if (v69 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (!v6) {
            goto LABEL_129;
          }
          goto LABEL_128;
        }
LABEL_127:
        [*(id *)(v6 + 232) addObject:v23];
LABEL_128:
        v70 = *(void **)(v6 + 240);
        uint64_t v71 = *(void *)(v6 + 184);
        id v72 = v23;
        [v70 addIndex:v71];
        uint64_t v73 = -[HVHtmlParser _currentOutputLength](v6);
        v74 = *(void **)(v6 + 248);
        v75 = -[HVHtmlParserHyperlink initWithURL:range:]([HVHtmlParserHyperlink alloc], "initWithURL:range:", v72, v73, 0);

        [v74 addObject:v75];
LABEL_129:

        goto LABEL_130;
      }
    }
    goto LABEL_127;
  }
  if (!strcmp(a2, "br")) {
    goto LABEL_37;
  }
  uint64_t v7 = htmlTagLookup((const xmlChar *)a2);
  if (!v7 || v7->isinline) {
    goto LABEL_37;
  }
  int v8 = strcmp(a2, "pre");
  if (v6 && !v8) {
    *(unsigned char *)(v6 + 145) = 1;
  }
  -[HVHtmlParser _newBlock](v6);
  if (!strcmp(a2, "table"))
  {
    if (!v6) {
      goto LABEL_132;
    }
    v51 = *(void **)(v6 + 160);
LABEL_135:
    -[HVHtmlParser _enterRegion:](v6, v51);
    goto LABEL_132;
  }
  if (!strcmp(a2, "blockquote"))
  {
LABEL_99:
    if (!v6) {
      goto LABEL_132;
    }
    v51 = *(void **)(v6 + 152);
    goto LABEL_135;
  }
  if (!strcmp(a2, "div"))
  {
    if (a3) {
      goto LABEL_17;
    }
  }
  else
  {
    int v9 = strcmp(a2, "pre");
    if (a3 && !v9)
    {
LABEL_17:
      long long v10 = *(const char **)a3;
      while (1)
      {
        if (!strcmp(v10, "class"))
        {
          long long v12 = *(char **)(a3 + 8);
          if (v12)
          {
            if (!strcmp(a2, "div")
              && (strstr(v12, "gmail_quote") || strstr(v12, "yahoo_quoted") || !strcmp(v12, "domino-section")))
            {
              goto LABEL_99;
            }
            long long v91 = 0u;
            long long v92 = 0u;
            long long v89 = 0u;
            long long v90 = 0u;
            uint64_t v13 = [&unk_26DACF3B8 countByEnumeratingWithState:&v89 objects:buffer count:16];
            if (v13) {
              break;
            }
          }
        }
LABEL_19:
        long long v11 = *(const char **)(a3 + 16);
        a3 += 16;
        long long v10 = v11;
        if (!v11) {
          goto LABEL_132;
        }
      }
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v90;
LABEL_28:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v90 != v15) {
          objc_enumerationMutation(&unk_26DACF3B8);
        }
        if (strstr(v12, (const char *)[*(id *)(*((void *)&v89 + 1) + 8 * v16) UTF8String]))
        {
          break;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [&unk_26DACF3B8 countByEnumeratingWithState:&v89 objects:buffer count:16];
          if (v14) {
            goto LABEL_28;
          }
          goto LABEL_19;
        }
      }
      if (!v6) {
        goto LABEL_132;
      }
      v51 = *(void **)(v6 + 168);
      goto LABEL_135;
    }
  }
  int v76 = strcmp(a2, "hr");
  if (a3 && !v76)
  {
    v79 = *(const char **)a3;
    v78 = (const char **)(a3 + 16);
    v77 = v79;
    while (1)
    {
      if (!strcmp(v77, "id"))
      {
        v80 = *(v78 - 1);
        if (v80)
        {
          if (!strcmp(v80, "stopSpelling")) {
            break;
          }
        }
      }
      v81 = *v78;
      v78 += 2;
      v77 = v81;
      if (!v81) {
        goto LABEL_132;
      }
    }
    if (v6 && *(void *)(v6 + 224) == 0x7FFFFFFFFFFFFFFFLL) {
      *(void *)(v6 + 224) = *(void *)(v6 + 112);
    }
  }
LABEL_132:
}

void sub_226C7C2C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_226C7CEA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226C7D474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL HVPBDataSourceContentStateReadFrom(void *a1, uint64_t a2)
{
  __int16 v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  int v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
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
        if (v9++ >= 9)
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
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        int v17 = objc_alloc_init(HVPBDeprecatedContentStateEntry);
        [a1 addDeprecatedDeferredContentStates:v17];
        if (!PBReaderPlaceMark() || !HVPBDeprecatedContentStateEntryReadFrom((uint64_t)v17, a2)) {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    int v17 = objc_alloc_init(HVPBContentStateEntry);
    [a1 addDeferredContentStates:v17];
    if (!PBReaderPlaceMark() || !HVPBContentStateEntryReadFrom((id *)&v17->super.super.isa, a2))
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B30](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B38](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B40](c, data, *(void *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5058](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x270EE5190](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x270EE51A0](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTimeInterval IOPSGetTimeRemainingEstimate(void)
{
  MEMORY[0x270EF4968]();
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2AF8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x270F58560]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x270F585A0]();
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

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _PASCollapseWhitespaceAndStrip()
{
  return MEMORY[0x270F57F68]();
}

uint64_t _PASEvaluateLogFaultAndProbCrashCriteria()
{
  return MEMORY[0x270F57F70]();
}

uint64_t _PASRepairString()
{
  return MEMORY[0x270F57F98]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F00](*(void *)&a1);
}

void _exit(int a1)
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

void abort(void)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x270ED92B0](block, timeout);
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

void dispatch_suspend(dispatch_object_t object)
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

htmlParserCtxtPtr htmlCreatePushParserCtxt(htmlSAXHandlerPtr sax, void *user_data, const char *chunk, int size, const char *filename, xmlCharEncoding enc)
{
  return (htmlParserCtxtPtr)MEMORY[0x270F9BA70](sax, user_data, chunk, *(void *)&size, filename, *(void *)&enc);
}

int htmlCtxtUseOptions(htmlParserCtxtPtr ctxt, int options)
{
  return MEMORY[0x270F9BA78](ctxt, *(void *)&options);
}

void htmlFreeParserCtxt(htmlParserCtxtPtr ctxt)
{
}

int htmlParseChunk(htmlParserCtxtPtr ctxt, const char *chunk, int size, int terminate)
{
  return MEMORY[0x270F9BAA8](ctxt, chunk, *(void *)&size, *(void *)&terminate);
}

const htmlElemDesc *__cdecl htmlTagLookup(const xmlChar *tag)
{
  return (const htmlElemDesc *)MEMORY[0x270F9BAD8](tag);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDAD10](*(void *)&__fd, __buf, __nbyte, a4);
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

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDB0A0](*(void *)&__fd, __buf, __nbyte, a4);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x270F9AAF0](lhs, rhs);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x270EDBCE8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCF0](activity);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}