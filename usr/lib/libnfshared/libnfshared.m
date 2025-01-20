uint64_t NFIsInternalBuild()
{
  if (NFIsInternalBuild_onceToken != -1) {
    dispatch_once(&NFIsInternalBuild_onceToken, &__block_literal_global_73);
  }
  return NFIsInternalBuild_bVal;
}

uint64_t NFLogGetLogger(unint64_t a1)
{
  if (a1 >= 4) {
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  return (uint64_t)*(&_NFLogCustomLoggers + a1);
}

uint64_t NFSharedMiddlewareSignpostLog(int a1)
{
  if (qword_1EB4D2858 != -1) {
    dispatch_once(&qword_1EB4D2858, &__block_literal_global_9);
  }
  uint64_t v2 = 24;
  if (a1) {
    uint64_t v2 = 16;
  }
  return *(void *)&_MergedGlobals_4[v2];
}

os_log_t __NFSharedLogInitialize_block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  _NFSharedLogClient[0] = (uint64_t)os_log_create("com.apple.nfc", "Logging");
  qword_1EB4D2928 = (uint64_t)os_log_create("com.apple.nfc", "CoreNFC");
  qword_1EB4D2930 = (uint64_t)os_log_create("com.apple.greentea", "Nfc");
  os_log_t result = os_log_create("com.apple.nfc", "Accessory");
  qword_1EB4D2938 = (uint64_t)result;
  if (!_NFSharedSignpostLog)
  {
    LOWORD(v4) = 0;
    long long v2 = 0u;
    long long v3 = 0u;
    *(_OWORD *)__str = 0u;
    snprintf(__str, 0x31uLL, "%s.signpost", "com.apple.nfc");
    os_log_t result = os_log_create(__str, "GeneralSignposts");
    _NFSharedSignpostLog = (uint64_t)result;
  }
  if (!_NFSecondarySignpostLog)
  {
    long long v3 = 0u;
    long long v4 = 0u;
    *(_OWORD *)__str = 0u;
    long long v2 = 0u;
    snprintf(__str, 0x3FuLL, "%s.accessory.signpost", "com.apple.nfc");
    os_log_t result = os_log_create(__str, "GeneralSignposts");
    _NFSecondarySignpostLog = (uint64_t)result;
  }
  return result;
}

uint64_t NFSharedLogGetLogger(uint64_t a1)
{
  if (NFSharedLogInitialize_onceToken != -1) {
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  }
  return _NFSharedLogClient[a1];
}

void sub_1CA51C36C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CA51CF8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id obj)
{
}

void sub_1CA51DA24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id obj)
{
}

uint64_t NFSharedSignpostLog()
{
  if (NFSharedLogInitialize_onceToken != -1) {
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  }
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v1 = &_NFSecondarySignpostLog;
  if (specific != (void *)3) {
    v1 = &_NFSharedSignpostLog;
  }
  return *v1;
}

void sub_1CA51F780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t NF_isFeatureSupported(unsigned int a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return (*(&featureFuncs + a1))();
  }
}

uint64_t NFProductIsDevBoard()
{
  if (qword_1EB4D27F0 != -1) {
    dispatch_once(&qword_1EB4D27F0, &__block_literal_global_89);
  }
  return byte_1EB4D277B;
}

uint64_t featureExpress()
{
  if (qword_1EB4D2818 != -1) {
    dispatch_once(&qword_1EB4D2818, &__block_literal_global_121);
  }
  return byte_1EB4D277D;
}

unint64_t GetElapsedTimeInMillisecondsFromMachTime(uint64_t a1, uint64_t a2)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  return (a1 - a2) * (unint64_t)info.numer / (1000000 * (unint64_t)info.denom);
}

uint64_t NFIsUIBuild()
{
  if (qword_1EB4D27C8 != -1) {
    dispatch_once(&qword_1EB4D27C8, &__block_literal_global_49);
  }
  return byte_1EB4D2776;
}

BOOL NFProductIsNED()
{
  v0 = (const void *)MGCopyAnswer();
  v1 = v0;
  long long v2 = (const void *)*MEMORY[0x1E4F1CFD0];
  if (v0 == (const void *)*MEMORY[0x1E4F1CFD0] || v0) {
    CFRelease(v0);
  }
  return v1 == v2;
}

uint64_t featureESEReader()
{
  if (qword_1EB4D2820 != -1) {
    dispatch_once(&qword_1EB4D2820, &__block_literal_global_124);
  }
  return byte_1EB4D277E;
}

uint64_t NFIsDarwinOS()
{
  if (qword_1EB4D27D0 != -1) {
    dispatch_once(&qword_1EB4D27D0, &__block_literal_global_55);
  }
  return byte_1EB4D2777;
}

void sub_1CA51FC4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CA51FCDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CA51FFF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *__getAnalyticsSendEventLazySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!qword_1EB4D2768)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __CoreAnalyticsLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E65AB948;
    uint64_t v7 = 0;
    qword_1EB4D2768 = _sl_dlopen();
    long long v3 = (void *)v5[0];
    long long v2 = (void *)qword_1EB4D2768;
    if (qword_1EB4D2768)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      long long v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  long long v2 = (void *)qword_1EB4D2768;
LABEL_5:
  os_log_t result = dlsym(v2, "AnalyticsSendEventLazy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1EB4D2760 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreAnalyticsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB4D2768 = result;
  return result;
}

BOOL NFProductIsPhone()
{
  if (qword_1EB4D2828 != -1) {
    dispatch_once(&qword_1EB4D2828, &__block_literal_global_127);
  }
  return dword_1EB4D2784 == 1;
}

BOOL NFProductIsPad()
{
  if (qword_1EB4D2828 != -1) {
    dispatch_once(&qword_1EB4D2828, &__block_literal_global_127);
  }
  return dword_1EB4D2784 == 3;
}

uint64_t NFProductIsWatch()
{
  return 0;
}

uint64_t NFProductIsBridge()
{
  return 0;
}

uint64_t NFProductIsMac()
{
  return 0;
}

uint64_t NFProductIsASMac()
{
  return 0;
}

uint64_t NFProductGetName()
{
  if (qword_1EB4D2790 != -1) {
    dispatch_once(&qword_1EB4D2790, &__block_literal_global_0);
  }
  return qword_1EB4D2788;
}

void __NFProductGetName_block_invoke()
{
  qword_1EB4D2788 = MGCopyAnswer();
  if (qword_1EB4D2788)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID((CFTypeRef)qword_1EB4D2788)) {
      return;
    }
    CFRelease((CFTypeRef)qword_1EB4D2788);
  }
  qword_1EB4D2788 = @"???";
}

uint64_t NFIsChinaSku()
{
  if (qword_1EB4D2798 != -1) {
    dispatch_once(&qword_1EB4D2798, &__block_literal_global_7);
  }
  return _MergedGlobals_1;
}

void __NFIsChinaSku_block_invoke()
{
  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    _MergedGlobals_1 = CFEqual(v0, @"CH") != 0;
    CFRelease(v1);
  }
  else
  {
    _MergedGlobals_1 = 0;
  }
}

uint64_t NFIsGreenTea()
{
  if (qword_1EB4D27A0 != -1) {
    dispatch_once(&qword_1EB4D27A0, &__block_literal_global_16);
  }
  return byte_1EB4D2771;
}

uint64_t __NFIsGreenTea_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EB4D2771 = result;
  return result;
}

uint64_t NFProductHasNFCRadio()
{
  if (qword_1EB4D27A8 != -1) {
    dispatch_once(&qword_1EB4D27A8, &__block_literal_global_22);
  }
  return byte_1EB4D2772;
}

uint64_t __NFProductHasNFCRadio_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EB4D2772 = result;
  return result;
}

uint64_t NFProductHasThermistor()
{
  if (qword_1EB4D27B0 != -1) {
    dispatch_once(&qword_1EB4D27B0, &__block_literal_global_28);
  }
  return byte_1EB4D2773;
}

void __NFProductHasThermistor_block_invoke()
{
  if (qword_1EB4D2808 != -1) {
    dispatch_once(&qword_1EB4D2808, &__block_literal_global_108);
  }
  if ((dword_1EB4D2780 - 73) < 0xD || (dword_1EB4D2780 - 68) <= 3) {
    byte_1EB4D2773 = 1;
  }
}

uint64_t NFGetProductType()
{
  if (qword_1EB4D2808 != -1) {
    dispatch_once(&qword_1EB4D2808, &__block_literal_global_108);
  }
  return dword_1EB4D2780;
}

uint64_t NFThermalMonitorProvidedBySMC()
{
  if (qword_1EB4D27B0 != -1) {
    dispatch_once(&qword_1EB4D27B0, &__block_literal_global_28);
  }
  return byte_1EB4D2773;
}

BOOL NFProductHasB0LPKey()
{
  if (qword_1EB4D27B8 != -1) {
    dispatch_once(&qword_1EB4D27B8, &__block_literal_global_31);
  }
  return (byte_1EB4D2774 & 1) == 0;
}

void __NFProductHasB0LPKey_block_invoke()
{
  if (qword_1EB4D27A8 != -1) {
    dispatch_once(&qword_1EB4D27A8, &__block_literal_global_22);
  }
  if (!byte_1EB4D2772) {
    byte_1EB4D2774 = 1;
  }
  if (qword_1EB4D2808 != -1) {
    dispatch_once(&qword_1EB4D2808, &__block_literal_global_108);
  }
  if ((dword_1EB4D2780 - 5) <= 0x3E
    && ((1 << (dword_1EB4D2780 - 5)) & 0x4000003CFF0001FFLL) != 0)
  {
    byte_1EB4D2774 = 1;
  }
}

uint64_t NFProductIsSIP()
{
  return 0;
}

uint64_t NFProductSupportsNFCReader()
{
  if (qword_1EB4D27C0 != -1) {
    dispatch_once(&qword_1EB4D27C0, &__block_literal_global_43);
  }
  return byte_1EB4D2775;
}

uint64_t __NFProductSupportsNFCReader_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EB4D2775 = result;
  return result;
}

uint64_t __NFIsUIBuild_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EB4D2776 = result;
  return result;
}

void __NFIsDarwinOS_block_invoke()
{
  CFStringRef v0 = (const __CFString *)MGGetStringAnswer();
  if (v0)
  {
    CFStringRef v1 = v0;
    if (CFStringCompare(v0, @"Darwin", 0)) {
      BOOL v2 = CFEqual(v1, @"Darwin Internal");
    }
    else {
      BOOL v2 = 1;
    }
    byte_1EB4D2777 = v2;
    CFRelease(v1);
  }
}

uint64_t NFIsRestoreOS()
{
  if (qword_1EB4D27D8 != -1) {
    dispatch_once(&qword_1EB4D27D8, &__block_literal_global_67);
  }
  return byte_1EB4D2778;
}

uint64_t __NFIsRestoreOS_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EB4D2778 = result;
  return result;
}

uint64_t __NFIsInternalBuild_block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  NFIsInternalBuild_bVal = result;
  return result;
}

uint64_t NFIsSimulator()
{
  if (qword_1EB4D27E0 != -1) {
    dispatch_once(&qword_1EB4D27E0, &__block_literal_global_77);
  }
  return byte_1EB4D2779;
}

uint64_t __NFIsSimulator_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EB4D2779 = result;
  return result;
}

uint64_t NFProductIsVM()
{
  if (qword_1EB4D27E8 != -1) {
    dispatch_once(&qword_1EB4D27E8, &__block_literal_global_83);
  }
  return byte_1EB4D277A;
}

uint64_t __NFProductIsVM_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EB4D277A = result;
  return result;
}

BOOL NFPlatformShouldLimitAccessoryReaderTime()
{
  if (qword_1EB4D2808 != -1) {
    dispatch_once(&qword_1EB4D2808, &__block_literal_global_108);
  }
  return (dword_1EB4D2780 - 73) < 0xD;
}

BOOL NFPlatformShouldUseLookbackRestrictor()
{
  if (qword_1EB4D2808 != -1) {
    dispatch_once(&qword_1EB4D2808, &__block_literal_global_108);
  }
  return dword_1EB4D2780 != 67
      && (dword_1EB4D2780 - 11) > 4
      && (dword_1EB4D2780 & 0x77) != 16
      && (dword_1EB4D2780 - 17) > 3
      && (dword_1EB4D2780 & 0x7C) != 68
      && dword_1EB4D2780 != 72;
}

void __NFProductIsDevBoard_block_invoke()
{
  CFStringRef v0 = (const __CFString *)MGCopyAnswer();
  if (v0)
  {
    CFStringRef v1 = v0;
    if (CFStringHasSuffix(v0, @"DEV")) {
      BOOL v2 = 1;
    }
    else {
      BOOL v2 = CFStringHasSuffix(v1, @"dev") != 0;
    }
    byte_1EB4D277B = v2;
    CFRelease(v1);
  }
}

uint64_t NFBuildVersion()
{
  if (qword_1EB4D2800 != -1) {
    dispatch_once(&qword_1EB4D2800, &__block_literal_global_98);
  }
  return qword_1EB4D27F8;
}

void __NFBuildVersion_block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  qword_1EB4D27F8 = MGCopyAnswer();
  if (!qword_1EB4D27F8)
  {
    CFStringRef v0 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    BOOL v2 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (v2)
    {
      v2(3, "%s:%i Failed to query build", "NFBuildVersion_block_invoke", 540);
      CFStringRef v0 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    long long v3 = dispatch_get_specific(v0);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    long long v4 = _NFSharedLogClient[(void)v3];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      long long v6 = "NFBuildVersion_block_invoke";
      __int16 v7 = 1024;
      int v8 = 540;
      _os_log_impl(&dword_1CA51A000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to query build", buf, 0x12u);
    }
    qword_1EB4D27F8 = @"UnknownBuild";
  }
}

BOOL NFIsProductType(int a1)
{
  if (qword_1EB4D2808 != -1) {
    dispatch_once(&qword_1EB4D2808, &__block_literal_global_108);
  }
  return dword_1EB4D2780 == a1;
}

BOOL NFIsNonRFDeviceWithLPMSupport()
{
  if (qword_1EB4D2808 != -1) {
    dispatch_once(&qword_1EB4D2808, &__block_literal_global_108);
  }
  return dword_1EB4D2780 == 95 || dword_1EB4D2780 == 96;
}

uint64_t __NFGetProductType_block_invoke()
{
  uint64_t result = MGGetProductType();
  if (result > 2089455187)
  {
    if (result <= 3001488777)
    {
      if (result > 2634105756)
      {
        if (result > 2795618602)
        {
          if (result > 2943112656)
          {
            switch(result)
            {
              case 2943112657:
                int v1 = 45;
                goto LABEL_231;
              case 2959111092:
                int v1 = 96;
                goto LABEL_231;
              case 2979575960:
                int v1 = 51;
                goto LABEL_231;
            }
          }
          else
          {
            switch(result)
            {
              case 2795618603:
                int v1 = 81;
                goto LABEL_231;
              case 2940697645:
                int v1 = 75;
                goto LABEL_231;
              case 2941181571:
                int v1 = 78;
                goto LABEL_231;
            }
          }
        }
        else if (result > 2751865417)
        {
          switch(result)
          {
            case 2751865418:
              int v1 = 39;
              goto LABEL_231;
            case 2781508713:
              int v1 = 1;
              goto LABEL_231;
            case 2793418701:
              int v1 = 79;
              goto LABEL_231;
          }
        }
        else
        {
          switch(result)
          {
            case 2634105757:
              int v1 = 94;
              goto LABEL_231;
            case 2688879999:
              int v1 = 76;
              goto LABEL_231;
            case 2722529672:
              int v1 = 15;
              goto LABEL_231;
          }
        }
      }
      else if (result > 2418348557)
      {
        if (result > 2619317133)
        {
          switch(result)
          {
            case 2619317134:
              int v1 = 97;
              goto LABEL_231;
            case 2622433984:
              int v1 = 92;
              goto LABEL_231;
            case 2625074843:
              int v1 = 59;
              goto LABEL_231;
          }
        }
        else
        {
          switch(result)
          {
            case 2418348558:
              int v1 = 31;
              goto LABEL_231;
            case 2487868872:
              int v1 = 100;
              goto LABEL_231;
            case 2566016329:
              int v1 = 95;
              goto LABEL_231;
          }
        }
      }
      else if (result > 2270970152)
      {
        switch(result)
        {
          case 2270970153:
            int v1 = 6;
            goto LABEL_231;
          case 2309863438:
            int v1 = 69;
            goto LABEL_231;
          case 2311900306:
            int v1 = 5;
            goto LABEL_231;
        }
      }
      else
      {
        switch(result)
        {
          case 2089455188:
            int v1 = 89;
            goto LABEL_231;
          case 2132302344:
            int v1 = 46;
            goto LABEL_231;
          case 2159747553:
            int v1 = 20;
            goto LABEL_231;
        }
      }
    }
    else if (result <= 3742999857)
    {
      if (result > 3361025852)
      {
        if (result > 3663011140)
        {
          switch(result)
          {
            case 3663011141:
              int v1 = 53;
              goto LABEL_231;
            case 3677894691:
              int v1 = 93;
              goto LABEL_231;
            case 3683904382:
              int v1 = 33;
              goto LABEL_231;
          }
        }
        else
        {
          switch(result)
          {
            case 3361025853:
              int v1 = 88;
              goto LABEL_231;
            case 3571532206:
              int v1 = 47;
              goto LABEL_231;
            case 3585085679:
              int v1 = 71;
              goto LABEL_231;
          }
        }
      }
      else if (result > 3228373940)
      {
        switch(result)
        {
          case 3228373941:
            int v1 = 86;
            goto LABEL_231;
          case 3241053352:
            int v1 = 99;
            goto LABEL_231;
          case 3242623367:
            int v1 = 7;
            goto LABEL_231;
        }
      }
      else
      {
        switch(result)
        {
          case 3001488778:
            int v1 = 18;
            goto LABEL_231;
          case 3143587592:
            int v1 = 64;
            goto LABEL_231;
          case 3196805751:
            int v1 = 3;
            goto LABEL_231;
        }
      }
    }
    else if (result <= 3867318490)
    {
      if (result > 3819635029)
      {
        switch(result)
        {
          case 3819635030:
            int v1 = 57;
            goto LABEL_231;
          case 3825599860:
            int v1 = 80;
            goto LABEL_231;
          case 3839750255:
            int v1 = 62;
            goto LABEL_231;
        }
      }
      else
      {
        switch(result)
        {
          case 3742999858:
            int v1 = 56;
            goto LABEL_231;
          case 3743999268:
            int v1 = 11;
            goto LABEL_231;
          case 3767261006:
            int v1 = 49;
            goto LABEL_231;
        }
      }
    }
    else if (result <= 4067129263)
    {
      switch(result)
      {
        case 3867318491:
          int v1 = 58;
          goto LABEL_231;
        case 3885279870:
          int v1 = 16;
          goto LABEL_231;
        case 4025247511:
          int v1 = 29;
          goto LABEL_231;
      }
    }
    else if (result > 4172444930)
    {
      if (result == 4172444931)
      {
        int v1 = 30;
        goto LABEL_231;
      }
      if (result == 4201643249)
      {
        int v1 = 19;
        goto LABEL_231;
      }
    }
    else
    {
      if (result == 4067129264)
      {
        int v1 = 35;
        goto LABEL_231;
      }
      if (result == 4068102502)
      {
        int v1 = 66;
        goto LABEL_231;
      }
    }
LABEL_230:
    int v1 = 0;
    goto LABEL_231;
  }
  if (result <= 1325975681)
  {
    if (result > 689804741)
    {
      if (result > 1085318933)
      {
        if (result > 1280909811)
        {
          switch(result)
          {
            case 1280909812:
              int v1 = 50;
              goto LABEL_231;
            case 1294429942:
              int v1 = 44;
              goto LABEL_231;
            case 1309571158:
              int v1 = 38;
              goto LABEL_231;
          }
        }
        else
        {
          switch(result)
          {
            case 1085318934:
              int v1 = 27;
              goto LABEL_231;
            case 1169082144:
              int v1 = 17;
              goto LABEL_231;
            case 1234705395:
              int v1 = 67;
              goto LABEL_231;
          }
        }
      }
      else if (result > 851437780)
      {
        switch(result)
        {
          case 851437781:
            int v1 = 83;
            goto LABEL_231;
          case 910181310:
            int v1 = 12;
            goto LABEL_231;
          case 1060988941:
            int v1 = 70;
            goto LABEL_231;
        }
      }
      else
      {
        switch(result)
        {
          case 689804742:
            int v1 = 68;
            goto LABEL_231;
          case 749116821:
            int v1 = 63;
            goto LABEL_231;
          case 810906663:
            int v1 = 91;
            goto LABEL_231;
        }
      }
    }
    else if (result > 355234907)
    {
      if (result > 555503453)
      {
        switch(result)
        {
          case 555503454:
            int v1 = 98;
            goto LABEL_231;
          case 574536383:
            int v1 = 84;
            goto LABEL_231;
          case 676119128:
            int v1 = 43;
            goto LABEL_231;
        }
      }
      else
      {
        switch(result)
        {
          case 355234908:
            int v1 = 25;
            goto LABEL_231;
          case 425046865:
            int v1 = 54;
            goto LABEL_231;
          case 502329937:
            int v1 = 8;
            goto LABEL_231;
        }
      }
    }
    else if (result > 133314239)
    {
      switch(result)
      {
        case 133314240:
          int v1 = 77;
          goto LABEL_231;
        case 330877086:
          int v1 = 82;
          goto LABEL_231;
        case 337183581:
          int v1 = 2;
          goto LABEL_231;
      }
    }
    else
    {
      switch(result)
      {
        case 40511012:
          int v1 = 32;
          goto LABEL_231;
        case 42878382:
          int v1 = 4;
          goto LABEL_231;
        case 118623495:
          int v1 = 90;
          goto LABEL_231;
      }
    }
    goto LABEL_230;
  }
  if (result <= 1625227433)
  {
    if (result > 1419435330)
    {
      if (result > 1554479184)
      {
        switch(result)
        {
          case 1554479185:
            int v1 = 65;
            goto LABEL_231;
          case 1573906122:
            int v1 = 36;
            goto LABEL_231;
          case 1602181456:
            int v1 = 52;
            goto LABEL_231;
        }
      }
      else
      {
        switch(result)
        {
          case 1419435331:
            int v1 = 40;
            goto LABEL_231;
          case 1429914406:
            int v1 = 10;
            goto LABEL_231;
          case 1434404433:
            int v1 = 73;
            goto LABEL_231;
        }
      }
    }
    else if (result > 1408738133)
    {
      switch(result)
      {
        case 1408738134:
          int v1 = 48;
          goto LABEL_231;
        case 1412429328:
          int v1 = 22;
          goto LABEL_231;
        case 1415625992:
          int v1 = 34;
          goto LABEL_231;
      }
    }
    else
    {
      switch(result)
      {
        case 1325975682:
          int v1 = 23;
          goto LABEL_231;
        case 1371389549:
          int v1 = 14;
          goto LABEL_231;
        case 1402208364:
          int v1 = 28;
          goto LABEL_231;
      }
    }
    goto LABEL_230;
  }
  if (result <= 1990293941)
  {
    if (result > 1733600852)
    {
      switch(result)
      {
        case 1733600853:
          int v1 = 26;
          goto LABEL_231;
        case 1756509290:
          int v1 = 42;
          goto LABEL_231;
        case 1770142589:
          int v1 = 61;
          goto LABEL_231;
      }
    }
    else
    {
      switch(result)
      {
        case 1625227434:
          int v1 = 87;
          goto LABEL_231;
        case 1644180312:
          int v1 = 41;
          goto LABEL_231;
        case 1721691077:
          int v1 = 9;
          goto LABEL_231;
      }
    }
    goto LABEL_230;
  }
  if (result <= 2078329140)
  {
    switch(result)
    {
      case 1990293942:
        int v1 = 37;
        goto LABEL_231;
      case 2021146989:
        int v1 = 74;
        goto LABEL_231;
      case 2032616841:
        int v1 = 13;
        goto LABEL_231;
    }
    goto LABEL_230;
  }
  if (result > 2084894488)
  {
    if (result == 2084894489)
    {
      int v1 = 60;
      goto LABEL_231;
    }
    if (result == 2085054105)
    {
      int v1 = 55;
      goto LABEL_231;
    }
    goto LABEL_230;
  }
  if (result == 2078329141)
  {
    int v1 = 72;
    goto LABEL_231;
  }
  if (result != 2080700391) {
    goto LABEL_230;
  }
  int v1 = 24;
LABEL_231:
  dword_1EB4D2780 = v1;
  return result;
}

uint64_t NFProductSupportsAC()
{
  if (qword_1EB4D2810 != -1) {
    dispatch_once(&qword_1EB4D2810, &__block_literal_global_111);
  }
  return byte_1EB4D277C;
}

uint64_t __NFProductSupportsAC_block_invoke()
{
  mach_port_t v0 = *MEMORY[0x1E4F2EEF0];
  CFDictionaryRef v1 = IOServiceNameMatching("AppleHammerfestSPMI");
  io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService) {
    byte_1EB4D277C = 1;
  }

  return IOObjectRelease(MatchingService);
}

BOOL NFProductAllowsWiredInDLMode(int a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  mach_port_t v1 = *MEMORY[0x1E4F2EEF0];
  if (a1) {
    BOOL v2 = "hammerfest-spmi";
  }
  else {
    BOOL v2 = "stockholm-spmi";
  }
  CFDictionaryRef v3 = IOServiceNameMatching(v2);
  io_service_t MatchingService = IOServiceGetMatchingService(v1, v3);
  if (MatchingService)
  {
    io_object_t v5 = MatchingService;
    CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, @"nfccModel", 0, 0);
    if (CFProperty)
    {
      CFDataRef v7 = CFProperty;
      CFTypeID v8 = CFGetTypeID(CFProperty);
      if (v8 == CFDataGetTypeID() && CFDataGetLength(v7)) {
        int v9 = *CFDataGetBytePtr(v7);
      }
      else {
        int v9 = 0;
      }
      CFRelease(v7);
    }
    else
    {
      int v9 = 0;
    }
    IOObjectRelease(v5);
  }
  else
  {
    v10 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    v12 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (v12)
    {
      v12(3, "%s:%i Failed find IOKit service", "NFProductAllowsWiredInDLMode", 1189);
      v10 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v13 = dispatch_get_specific(v10);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    v14 = _NFSharedLogClient[(void)v13];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "NFProductAllowsWiredInDLMode";
      __int16 v18 = 1024;
      int v19 = 1189;
      _os_log_impl(&dword_1CA51A000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed find IOKit service", buf, 0x12u);
    }
    int v9 = 0;
  }
  return (v9 - 209) < 3;
}

BOOL NFProductHasModuleCal()
{
  if (qword_1EB4D2808 != -1) {
    dispatch_once(&qword_1EB4D2808, &__block_literal_global_108);
  }
  return dword_1EB4D2780 != 85;
}

uint64_t featureUnknown()
{
  return 0;
}

BOOL featurePlatformHostWakeSupported()
{
  if (qword_1EB4D2828 != -1) {
    dispatch_once(&qword_1EB4D2828, &__block_literal_global_127);
  }
  return dword_1EB4D2784 == 1;
}

void __featureExpress_block_invoke()
{
  if (qword_1EB4D27A8 != -1) {
    dispatch_once(&qword_1EB4D27A8, &__block_literal_global_22);
  }
  byte_1EB4D277D = byte_1EB4D2772;
}

void __featureESEReader_block_invoke()
{
  if (qword_1EB4D27C0 != -1) {
    dispatch_once(&qword_1EB4D27C0, &__block_literal_global_43);
  }
  byte_1EB4D277E = byte_1EB4D2775;
  if (byte_1EB4D2775)
  {
    if (qword_1EB4D2808 != -1) {
      dispatch_once(&qword_1EB4D2808, &__block_literal_global_108);
    }
    if ((dword_1EB4D2780 - 1) <= 8) {
      byte_1EB4D277E = 0;
    }
  }
}

void sub_1CA523934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void postAnalyticsHardwareExceptionEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  v14 = (void *)MEMORY[0x1CB7976C0]();
  v15 = 0;
  if (a6 && a7)
  {
    v15 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a6 length:a7];
  }
  +[NFExceptionsCALogger postHardwareExceptionEventWithAssertionCounter:a2 hardwareType:a1 wdogDump:a3 hwFltDump:a4 wdgTickInfo:a5 assertionData:v15];
}

void postAnalyticsMiddlewareExceptionEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const char *a7)
{
  v13 = (void *)MEMORY[0x1CB7976C0]();
  unsigned int v14 = strlen(a7);
  if (v14)
  {
    if (v14 >= 0xC8) {
      uint64_t v15 = 200;
    }
    else {
      uint64_t v15 = v14;
    }
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a7 length:v15];
    v17 = (__CFString *)[[NSString alloc] initWithData:v16 encoding:4];
  }
  else
  {
    v17 = @"No description provided";
  }
  +[NFExceptionsCALogger postMiddlewareExceptionEvent:a1 mwVersion:a2 errorType:a3 errorCode:a4 breadcrumb:a5 description:v17];
  +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:&unk_1F24D2068];
}

void postAnalyticsMainSERemovedEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  long long v6 = (void *)MEMORY[0x1CB7976C0]();
  +[NFExceptionsCALogger postAnalyticsSERemovedEvent:a2 hasExpressTransactionStarted:0 hasCardEmulationStarted:a3 hardwareType:a1];
  CFDataRef v7 = +[NFCALogger sharedCALogger];
  uint64_t v8 = [v7 generateDailyUUIDForCA];
  int v9 = (void *)v8;
  v12[0] = @"seRemovedEvt0Count";
  v12[1] = @"dailyDeviceUUID";
  v10 = @"noUUID";
  if (v8) {
    v10 = (__CFString *)v8;
  }
  v13[0] = &unk_1F24D1E50;
  v13[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v7 postCAEventFor:@"com.apple.nfcd.deviceExceptionStatistic" eventInput:v11];
}

void postAnalyticsTxLdoOverCurrentErrorEvent()
{
  mach_port_t v0 = (void *)MEMORY[0x1CB7976C0]();
  +[NFGeneralStatisticsCALogger updateGeneralDeviceStatistic:&unk_1F24D2090];
}

void postAnalyticsTxLdoErrorEvent(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  v10[1] = *MEMORY[0x1E4F143B8];
  long long v4 = (void *)MEMORY[0x1CB7976C0]();
  if (v2 >= 0x32) {
    uint64_t v2 = 50;
  }
  else {
    uint64_t v2 = v2;
  }
  io_object_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a1 length:v2];
  long long v6 = [v5 NF_asHexString];
  if (v6)
  {
    CFDataRef v7 = +[NFCALogger sharedCALogger];
    int v9 = @"status";
    v10[0] = v6;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [v7 postCAEventFor:@"com.apple.nfcd.exceptions.txLdoErrors" eventInput:v8];
  }
}

uint64_t ValidateAPDUWithAIDAllowList(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if ([v3 instruction] == 164
    && [v3 p1] == 4
    && ([v3 payload],
        io_object_t v5 = objc_claimAutoreleasedReturnValue(),
        [v4 member:v5],
        long long v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    int v9 = [v3 payload];
    v10 = [v9 NF_asHexString];

    v11 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    v13 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (v13)
    {
      v13(3, "%s:%i %{public}@ not in allow list", "ValidateAPDUWithAIDAllowList", 62, v10);
      v11 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    unsigned int v14 = dispatch_get_specific(v11);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    uint64_t v15 = (id)_NFSharedLogClient[(void)v14];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v17 = "ValidateAPDUWithAIDAllowList";
      __int16 v18 = 1024;
      int v19 = 62;
      __int16 v20 = 2114;
      v21 = v10;
      _os_log_impl(&dword_1CA51A000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%i %{public}@ not in allow list", buf, 0x1Cu);
    }

    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

id NFBootUUID()
{
  if (_MergedGlobals_2 != -1) {
    dispatch_once(&_MergedGlobals_2, &__block_literal_global_1);
  }
  mach_port_t v0 = (void *)qword_1EB4D2838;

  return v0;
}

void __NFBootUUID_block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)in = 0u;
  memset(v5, 0, sizeof(v5));
  size_t v2 = 37;
  if (!sysctlbyname("kern.bootsessionuuid", in, &v2, 0, 0))
  {
    memset(uu, 0, sizeof(uu));
    uuid_parse(in, uu);
    uint64_t v0 = [MEMORY[0x1E4F1C9B8] dataWithBytes:uu length:16];
    mach_port_t v1 = (void *)qword_1EB4D2838;
    qword_1EB4D2838 = v0;
  }
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

void sub_1CA52ED38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1CA52F6A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void NFSimulateCrash(int a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (NFSharedLogInitialize_onceToken != -1) {
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  }
  id v4 = _NFSharedLogClient[0];
  if (os_log_type_enabled((os_log_t)_NFSharedLogClient[0], OS_LOG_TYPE_FAULT))
  {
    v5[0] = 67109378;
    v5[1] = a1;
    __int16 v6 = 2082;
    uint64_t v7 = a2;
    _os_log_fault_impl(&dword_1CA51A000, v4, OS_LOG_TYPE_FAULT, "Error 0x%02X : %{public}s", (uint8_t *)v5, 0x12u);
  }
}

void sub_1CA5373B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CA537530(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void NFSharedLogInitialize()
{
  if (NFSharedLogInitialize_onceToken != -1) {
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  }
}

os_log_t __NFSharedMiddlewareSignpostLog_block_invoke()
{
  qword_1EB4D2860 = (uint64_t)os_log_create("com.apple.nfc.middleware.signpost", "Primary");
  os_log_t result = os_log_create("com.apple.nfc.middleware.signpost", "Secondary");
  qword_1EB4D2868 = (uint64_t)result;
  return result;
}

void NFSharedDumpTransport(int a1, const char *a2, uint64_t a3, unint64_t a4, int a5)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (qword_1EB4D28A0 != -1) {
    dispatch_once(&qword_1EB4D28A0, &__block_literal_global_34);
  }
  if (_MergedGlobals_4[0])
  {
    long long v35 = 0u;
    memset(v34, 0, sizeof(v34));
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    v10 = specific;
    v11 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    v12 = _NFSharedLogClient[(void)v10];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v27 = (uint8_t *)"NFSharedDumpTransport";
      __int16 v28 = 1024;
      int v29 = 137;
      __int16 v30 = 2082;
      v31 = a2;
      __int16 v32 = 2048;
      unint64_t v33 = a4;
      _os_log_impl(&dword_1CA51A000, v12, OS_LOG_TYPE_ERROR, "%s:%i %{public}s %lu bytes", buf, 0x26u);
    }
    if (v11) {
      v11(4, "%s:%i %s %lu bytes :", "NFSharedDumpTransport", 137, a2, a4);
    }
    if (a4)
    {
      uint64_t v13 = 0;
      do
      {
        unint64_t v14 = 0;
        uint64_t v15 = (char *)&v34[__sprintf_chk((char *)v34, 0, 0x30uLL, "%04lX: ", v13)];
        do
        {
          unint64_t v16 = v14 + 1;
          unint64_t v17 = v14 + 1 + v13;
          int v18 = sprintf(v15, "0x%02X ", *(unsigned __int8 *)(a3 + v13 + v14));
          if (v14 > 6) {
            break;
          }
          v15 += v18;
          ++v14;
        }
        while (v17 < a4);
        int v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if (NFSharedLogInitialize_onceToken != -1) {
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        }
        __int16 v20 = _NFSharedLogClient[(void)v19];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          v27 = v34;
          _os_log_impl(&dword_1CA51A000, v20, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
        }
        if (v11) {
          v11(4, "%s", (const char *)v34);
        }
        v13 += v16;
      }
      while (v17 < a4);
    }
  }
  else
  {
    os_log_t v21 = (os_log_t)qword_1EB4D2870;
    if (!a1
      || qword_1EB4D2870
      || (os_log_t v21 = os_log_create("com.apple.nfc", "nci.primary.dump"), (qword_1EB4D2870 = (uint64_t)v21) != 0))
    {
      uint64_t v22 = qword_1EB4D2878;
      if ((a1 & 1) == 0 && !qword_1EB4D2878)
      {
        os_log_t v23 = os_log_create("com.apple.nfc", "nci.secondary.dump");
        qword_1EB4D2878 = (uint64_t)v23;
        if (!v23) {
          return;
        }
        uint64_t v22 = (uint64_t)v23;
        os_log_t v21 = (os_log_t)qword_1EB4D2870;
      }
      if (a1) {
        v24 = v21;
      }
      else {
        v24 = v22;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v34 = 136446722;
        *(void *)&v34[4] = a2;
        *(_WORD *)&v34[12] = 1040;
        *(_DWORD *)&v34[14] = a4;
        *(_WORD *)&v34[18] = 2098;
        *(void *)&v34[20] = a3;
        _os_log_impl(&dword_1CA51A000, v24, OS_LOG_TYPE_ERROR, "%{public}s %{public,stockholm:NCI}.*P", v34, 0x1Cu);
      }
      if (a5)
      {
        if (a1)
        {
          os_release((void *)qword_1EB4D2870);
          qword_1EB4D2870 = 0;
        }
        else
        {
          os_release((void *)qword_1EB4D2878);
          qword_1EB4D2878 = 0;
        }
      }
    }
  }
}

void NFSharedLogTransport(char a1, const char *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (qword_1EB4D28A0 != -1) {
    dispatch_once(&qword_1EB4D28A0, &__block_literal_global_34);
  }
  if (_MergedGlobals_4[0])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    *(_OWORD *)__int16 v30 = 0u;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    uint64_t v8 = specific;
    int v9 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    v10 = _NFSharedLogClient[(void)v8];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      os_log_t v23 = "NFSharedLogTransport";
      __int16 v24 = 1024;
      int v25 = 179;
      __int16 v26 = 2082;
      v27 = a2;
      __int16 v28 = 2048;
      unint64_t v29 = a4;
      _os_log_impl(&dword_1CA51A000, v10, OS_LOG_TYPE_DEFAULT, "%s:%i %{public}s %lu bytes", buf, 0x26u);
    }
    if (v9) {
      v9(5, "%s:%i %s %lu bytes :", "NFSharedLogTransport", 179, a2, a4);
    }
    if (a4)
    {
      uint64_t v11 = 0;
      do
      {
        unint64_t v12 = 0;
        uint64_t v13 = &v30[__sprintf_chk(v30, 0, 0x30uLL, "%04lX: ", v11)];
        do
        {
          unint64_t v14 = v12 + 1;
          unint64_t v15 = v12 + 1 + v11;
          int v16 = sprintf(v13, "0x%02X ", *(unsigned __int8 *)(a3 + v11 + v12));
          if (v12 > 6) {
            break;
          }
          v13 += v16;
          ++v12;
        }
        while (v15 < a4);
        unint64_t v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if (NFSharedLogInitialize_onceToken != -1) {
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        }
        int v18 = _NFSharedLogClient[(void)v17];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446210;
          os_log_t v23 = v30;
          _os_log_impl(&dword_1CA51A000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
        if (v9) {
          v9(5, "%s", v30);
        }
        v11 += v14;
      }
      while (v15 < a4);
    }
  }
  else
  {
    if (qword_1EB4D2880 != -1) {
      dispatch_once(&qword_1EB4D2880, &__block_literal_global_21);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 0x40000000;
    block[2] = __NFSharedLogTransport_block_invoke_2;
    block[3] = &__block_descriptor_tmp_25;
    char v21 = a1;
    block[4] = a2;
    block[5] = a4;
    block[6] = a3;
    dispatch_sync((dispatch_queue_t)qword_1EB4D2888, block);
  }
}

os_log_t __NFSharedLogTransport_block_invoke()
{
  uint64_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  mach_port_t v1 = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);
  qword_1EB4D2888 = (uint64_t)dispatch_queue_create("com.apple.stockholm.NCILog", v1);
  qword_1EB4D2890 = (uint64_t)os_log_create("com.apple.nfc", "nci.primary.stream");
  os_log_t result = os_log_create("com.apple.nfc", "nci.secondary.stream");
  qword_1EB4D2898 = (uint64_t)result;
  return result;
}

void __NFSharedLogTransport_block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56)) {
    size_t v2 = &qword_1EB4D2890;
  }
  else {
    size_t v2 = &qword_1EB4D2898;
  }
  id v3 = *v2;
  if (os_log_type_enabled((os_log_t)*v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    int v7 = 136446722;
    uint64_t v8 = v4;
    __int16 v9 = 1040;
    int v10 = v5;
    __int16 v11 = 2098;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1CA51A000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s %{public,stockholm:NCI}.*P", (uint8_t *)&v7, 0x1Cu);
  }
}

unint64_t NFLogSetLogger(unint64_t result, void *a2)
{
  if (result >= 4) {
    __assert_rtn("NFLogSetLogger", "NFSharedLog.c", 209, "category < NFLogCategoryMax");
  }
  *(&_NFLogCustomLoggers + result) = a2;
  return result;
}

void ___isInRestoreOS_block_invoke()
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  if (v0)
  {
    CFBooleanRef v1 = v0;
    _MergedGlobals_4[0] = CFBooleanGetValue(v0) != 0;
    CFRelease(v1);
  }
}

void sub_1CA539A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void postCADynamicRFChangedEvent()
{
  CFBooleanRef v0 = (void *)MEMORY[0x1CB7976C0]();
  +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:&unk_1F24D20E0];
}

void resetCALoadStackExceptionCount()
{
  CFBooleanRef v0 = (void *)MEMORY[0x1CB7976C0]();
  CFBooleanRef v1 = +[NFCALogger sharedCALogger];
  [v1 resetCALoadStackExceptionCount];
}

void *TLVCreateWithData(void *a1)
{
  return _TLVCreateWithBytes(&v2, *a1 + a1[1], 0);
}

void *_TLVCreateWithBytes(unint64_t *a1, unint64_t a2, _WORD *a3)
{
  os_log_t result = 0;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  v71 = 0;
  uint64_t v5 = (unsigned __int8 *)*a1;
  if (*a1 >= a2) {
    return result;
  }
  uint64_t v8 = 0;
  while (1)
  {
    __int16 v9 = v5 + 1;
    *a1 = (unint64_t)(v5 + 1);
    unsigned int v10 = *v5;
    if ((~v10 & 0x1F) == 0)
    {
      int v11 = v10;
      while ((unint64_t)v9 < a2)
      {
        uint64_t v12 = v9 + 1;
        *a1 = (unint64_t)(v9 + 1);
        int v13 = (char)*v9;
        int v14 = *v9++ | (v11 << 8);
        int v11 = v14;
        if ((v13 & 0x80000000) == 0) {
          goto LABEL_9;
        }
      }
      v27 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)specific < 4)
      {
        unint64_t v29 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
        if (v29)
        {
          v29(3, "%s:%i Underflow", "_TLVCreateWithBytes", 126);
          v27 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        __int16 v30 = dispatch_get_specific(v27);
        if (NFSharedLogInitialize_onceToken != -1) {
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        }
        long long v31 = _NFSharedLogClient[(void)v30];
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          goto LABEL_70;
        }
        *(_DWORD *)buf = 136446466;
        v73 = "_TLVCreateWithBytes";
        __int16 v74 = 1024;
        int v75 = 126;
        long long v32 = "%{public}s:%i Underflow";
        uint64_t v33 = v31;
        uint32_t v34 = 18;
LABEL_69:
        _os_log_impl(&dword_1CA51A000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
        goto LABEL_70;
      }
LABEL_117:
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    uint64_t v12 = v9;
    int v14 = v10;
LABEL_9:
    if ((unint64_t)v12 >= a2) {
      break;
    }
    unint64_t v15 = v12 + 1;
    *a1 = (unint64_t)(v12 + 1);
    unsigned int v16 = *v12;
    if (a3)
    {
      unint64_t v17 = a3;
      do
      {
        int v18 = (unsigned __int16)*v17;
        if (!*v17) {
          goto LABEL_19;
        }
        ++v17;
      }
      while (v18 != (unsigned __int16)v14);
      if (v16 == 255)
      {
        if ((unint64_t)v15 >= a2)
        {
          v62 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          v63 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          if ((unint64_t)v63 >= 4) {
            goto LABEL_117;
          }
          v64 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v63);
          if (v64)
          {
            v64(3, "%s:%i Underflow: tag=0x%x", "_TLVCreateWithBytes", 152, v14);
            v62 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          }
          v65 = dispatch_get_specific(v62);
          if (NFSharedLogInitialize_onceToken != -1) {
            dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
          }
          v39 = _NFSharedLogClient[(void)v65];
          if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            goto LABEL_70;
          }
          *(_DWORD *)buf = 136446722;
          v73 = "_TLVCreateWithBytes";
          __int16 v74 = 1024;
          int v75 = 152;
          __int16 v76 = 1024;
          int v77 = v14;
          long long v32 = "%{public}s:%i Underflow: tag=0x%x";
        }
        else
        {
          *a1 = (unint64_t)(v12 + 2);
          if ((unint64_t)(v12 + 2) < a2)
          {
            int v19 = (char)v12[1];
            unint64_t v15 = v12 + 3;
            *a1 = (unint64_t)(v12 + 3);
            unsigned int v16 = v12[2] | (v19 << 8);
            goto LABEL_18;
          }
          v66 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          v67 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          if ((unint64_t)v67 >= 4) {
            goto LABEL_117;
          }
          v68 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v67);
          if (v68)
          {
            v68(3, "%s:%i Underflow: tag=0x%x", "_TLVCreateWithBytes", 154, v14);
            v66 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          }
          v69 = dispatch_get_specific(v66);
          if (NFSharedLogInitialize_onceToken != -1) {
            dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
          }
          v39 = _NFSharedLogClient[(void)v69];
          if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            goto LABEL_70;
          }
          *(_DWORD *)buf = 136446722;
          v73 = "_TLVCreateWithBytes";
          __int16 v74 = 1024;
          int v75 = 154;
          __int16 v76 = 1024;
          int v77 = v14;
          long long v32 = "%{public}s:%i Underflow: tag=0x%x";
        }
LABEL_68:
        uint64_t v33 = v39;
        uint32_t v34 = 24;
        goto LABEL_69;
      }
LABEL_18:
      int v20 = 1;
      goto LABEL_21;
    }
LABEL_19:
    if ((v16 & 0x80) == 0)
    {
      int v20 = 0;
      goto LABEL_21;
    }
    int v20 = v16 & 0x7F;
    if ((v16 & 0x7F) != 0)
    {
      unsigned int v16 = 0;
      while ((unint64_t)v15 < a2)
      {
        __int16 v26 = v15 + 1;
        *a1 = (unint64_t)(v15 + 1);
        unsigned int v16 = *v15++ | (v16 << 8);
        if (!--v20)
        {
          unint64_t v15 = v26;
          goto LABEL_21;
        }
      }
      long long v35 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      uint64_t v36 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)v36 < 4)
      {
        v37 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v36);
        if (v37)
        {
          v37(3, "%s:%i Underflow: tag=0x%x", "_TLVCreateWithBytes", 143, v14);
          long long v35 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v38 = dispatch_get_specific(v35);
        if (NFSharedLogInitialize_onceToken != -1) {
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        }
        v39 = _NFSharedLogClient[(void)v38];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v73 = "_TLVCreateWithBytes";
          __int16 v74 = 1024;
          int v75 = 143;
          __int16 v76 = 1024;
          int v77 = v14;
          long long v32 = "%{public}s:%i Underflow: tag=0x%x";
          goto LABEL_68;
        }
        goto LABEL_70;
      }
      goto LABEL_117;
    }
    unsigned int v16 = 0;
LABEL_21:
    if (!(v14 | v16)) {
      return v71;
    }
    if ((v20 ^ 1) & (v10 >> 5))
    {
      if (v16 == 128)
      {
        size_t v24 = 128;
        int v25 = (unsigned __int8 *)a2;
      }
      else
      {
        if ((uint64_t)(a2 - (void)v15) < v16)
        {
          v58 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          if ((unint64_t)v59 >= 4) {
            goto LABEL_117;
          }
          v60 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v59);
          if (v60)
          {
            v60(3, "%s:%i Underflow: tag=0x%x len=%u", "_TLVCreateWithBytes", 184, v14, v16);
            v58 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          }
          v61 = dispatch_get_specific(v58);
          if (NFSharedLogInitialize_onceToken != -1) {
            dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
          }
          v48 = _NFSharedLogClient[(void)v61];
          if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            goto LABEL_70;
          }
          *(_DWORD *)buf = 136446978;
          v73 = "_TLVCreateWithBytes";
          __int16 v74 = 1024;
          int v75 = 184;
          __int16 v76 = 1024;
          int v77 = v14;
          __int16 v78 = 1024;
          unsigned int v79 = v16;
          long long v32 = "%{public}s:%i Underflow: tag=0x%x len=%u";
LABEL_102:
          uint64_t v33 = v48;
          uint32_t v34 = 30;
          goto LABEL_69;
        }
        size_t v24 = v16;
        int v25 = &v15[v16];
      }
      char v21 = NFDataCreateWithBytes(v15, v24);
      v70 = 0;
      v70 = (void *)_TLVCreateWithBytes(a1, v25, a3);
      Child = TLVCreateWithFirstChild(v14, v70);
      TLVRelease(&v70);
      if (!Child)
      {
        v49 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        v50 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if ((unint64_t)v50 >= 4) {
          goto LABEL_117;
        }
        v51 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v50);
        if (v51)
        {
          v51(3, "%s:%i NULL error: tag=0x%x len=%u", "_TLVCreateWithBytes", 196, v14, v16);
          v49 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v52 = dispatch_get_specific(v49);
        if (NFSharedLogInitialize_onceToken != -1) {
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        }
        v53 = _NFSharedLogClient[(void)v52];
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          v73 = "_TLVCreateWithBytes";
          __int16 v74 = 1024;
          int v75 = 196;
          __int16 v76 = 1024;
          int v77 = v14;
          __int16 v78 = 1024;
          unsigned int v79 = v16;
          goto LABEL_93;
        }
LABEL_94:
        NFDataRelease(v21);
        goto LABEL_70;
      }
      Child[5] = v21;
      if (v8) {
        v8[3] = Child;
      }
      else {
        v71 = Child;
      }
      uint64_t v5 = (unsigned __int8 *)*a1;
    }
    else
    {
      if ((uint64_t)(a2 - (void)v15) < v16)
      {
        v44 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if ((unint64_t)v45 >= 4) {
          goto LABEL_117;
        }
        v46 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v45);
        if (v46)
        {
          v46(3, "%s:%i Underflow: tag=0x%x len=%u", "_TLVCreateWithBytes", 169, v14, v16);
          v44 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v47 = dispatch_get_specific(v44);
        if (NFSharedLogInitialize_onceToken != -1) {
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        }
        v48 = _NFSharedLogClient[(void)v47];
        if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          goto LABEL_70;
        }
        *(_DWORD *)buf = 136446978;
        v73 = "_TLVCreateWithBytes";
        __int16 v74 = 1024;
        int v75 = 169;
        __int16 v76 = 1024;
        int v77 = v14;
        __int16 v78 = 1024;
        unsigned int v79 = v16;
        long long v32 = "%{public}s:%i Underflow: tag=0x%x len=%u";
        goto LABEL_102;
      }
      char v21 = NFDataCreateWithBytes(v15, v16);
      uint64_t v22 = TLVCreateWithValue(v14, (uint64_t)v21);
      if (!v22)
      {
        v54 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        v55 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if ((unint64_t)v55 >= 4) {
          goto LABEL_117;
        }
        v56 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v55);
        if (v56)
        {
          v56(3, "%s:%i NULL error: tag=0x%x len=%u", "_TLVCreateWithBytes", 172, v14, v16);
          v54 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v57 = dispatch_get_specific(v54);
        if (NFSharedLogInitialize_onceToken != -1) {
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        }
        v53 = _NFSharedLogClient[(void)v57];
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          v73 = "_TLVCreateWithBytes";
          __int16 v74 = 1024;
          int v75 = 172;
          __int16 v76 = 1024;
          int v77 = v14;
          __int16 v78 = 1024;
          unsigned int v79 = v16;
LABEL_93:
          _os_log_impl(&dword_1CA51A000, v53, OS_LOG_TYPE_ERROR, "%{public}s:%i NULL error: tag=0x%x len=%u", buf, 0x1Eu);
        }
        goto LABEL_94;
      }
      Child = v22;
      NFDataRelease(v21);
      if (v8) {
        v8[3] = Child;
      }
      else {
        v71 = Child;
      }
      uint64_t v5 = (unsigned __int8 *)(*a1 + v16);
      *a1 = (unint64_t)v5;
    }
    uint64_t v8 = Child;
    if ((unint64_t)v5 >= a2) {
      return v71;
    }
  }
  v40 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v41 >= 4) {
    goto LABEL_117;
  }
  v42 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v41);
  if (v42)
  {
    v42(3, "%s:%i Underflow: tag=0x%x", "_TLVCreateWithBytes", 134, v14);
    v40 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v43 = dispatch_get_specific(v40);
  if (NFSharedLogInitialize_onceToken != -1) {
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  }
  v39 = _NFSharedLogClient[(void)v43];
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v73 = "_TLVCreateWithBytes";
    __int16 v74 = 1024;
    int v75 = 134;
    __int16 v76 = 1024;
    int v77 = v14;
    long long v32 = "%{public}s:%i Underflow: tag=0x%x";
    goto LABEL_68;
  }
LABEL_70:
  TLVRelease(&v71);
  return 0;
}

_DWORD *TLVCreateWithValue(int a1, uint64_t a2)
{
  uint64_t v4 = malloc_type_calloc(1uLL, 0x30uLL, 0x102004093326106uLL);
  uint64_t v5 = v4;
  if (v4)
  {
    *(void *)uint64_t v4 = 1;
    v4[8] = a1;
    NFDataRetain(a2);
    *((void *)v5 + 5) = a2;
  }
  return v5;
}

_DWORD *TLVCreateWithFirstChild(int a1, void *a2)
{
  os_log_t result = malloc_type_calloc(1uLL, 0x30uLL, 0x102004093326106uLL);
  if (result)
  {
    *(void *)os_log_t result = 1;
    result[8] = a1;
    if (a2) {
      ++*a2;
    }
    *((void *)result + 2) = a2;
  }
  return result;
}

void *TLVRetain(void *result)
{
  if (result) {
    ++*result;
  }
  return result;
}

void *TLVCreateWithDataMixed(void *a1, _WORD *a2)
{
  return _TLVCreateWithBytes(&v3, *a1 + a1[1], a2);
}

void TLVRelease(void **a1)
{
  if (a1)
  {
    unint64_t v2 = *a1;
    if (*a1)
    {
      if ((*v2)-- == 1)
      {
        uint64_t v4 = v2[2];
        uint64_t v5 = v2[3];
        uint64_t v6 = v4;
        NFDataRelease((void *)v2[5]);
        TLVRelease(&v6);
        TLVRelease(&v5);
        free(v2);
        *a1 = 0;
      }
    }
  }
}

BOOL NFDataScannerEOF(void *a1)
{
  return !a1 || !*a1 || (unint64_t v1 = *(void *)(*a1 + 8)) == 0 || a1[1] >= v1;
}

BOOL NFDataScannerRead(uint64_t **a1, uint64_t a2, unsigned char *a3)
{
  unint64_t v3 = (unint64_t)a1[1] + a2;
  unint64_t v4 = (*a1)[1];
  if (a2 && v3 <= v4)
  {
    do
    {
      uint64_t v5 = a1[1];
      uint64_t v6 = **a1;
      a1[1] = (uint64_t *)((char *)v5 + 1);
      *a3++ = *((unsigned char *)v5 + v6);
      --a2;
    }
    while (a2);
  }
  return v3 <= v4;
}

BOOL NFDataScannerRead8(uint64_t **a1, unsigned char *a2)
{
  *a2 = 0;
  unint64_t v2 = a1[1];
  unint64_t v3 = (unint64_t)v2 + 1;
  unint64_t v4 = (*a1)[1];
  if ((unint64_t)v2 + 1 <= v4)
  {
    uint64_t v5 = **a1;
    a1[1] = (uint64_t *)v3;
    *a2 = *((unsigned char *)v2 + v5);
  }
  return v3 <= v4;
}

BOOL NFDataScannerRead16(uint64_t **a1, uint64_t a2, _WORD *a3)
{
  *a3 = 0;
  unint64_t v3 = a1[1];
  unint64_t v4 = (unint64_t)v3 + a2;
  unint64_t v5 = (*a1)[1];
  if (a2 && v4 <= v5)
  {
    int v6 = 0;
    uint64_t v7 = **a1;
    do
    {
      a1[1] = (uint64_t *)((char *)v3 + 1);
      int v6 = *((unsigned __int8 *)v3 + v7) | (v6 << 8);
      *a3 = v6;
      unint64_t v3 = (uint64_t *)((char *)v3 + 1);
      --a2;
    }
    while (a2);
  }
  return v4 <= v5;
}

BOOL NFDataScannerRead32(uint64_t **a1, uint64_t a2, int *a3)
{
  *a3 = 0;
  unint64_t v3 = a1[1];
  unint64_t v4 = (unint64_t)v3 + a2;
  unint64_t v5 = (*a1)[1];
  if (a2 && v4 <= v5)
  {
    int v6 = 0;
    uint64_t v7 = **a1;
    do
    {
      a1[1] = (uint64_t *)((char *)v3 + 1);
      int v6 = *((unsigned __int8 *)v3 + v7) | (v6 << 8);
      *a3 = v6;
      unint64_t v3 = (uint64_t *)((char *)v3 + 1);
      --a2;
    }
    while (a2);
  }
  return v4 <= v5;
}

void **NFDataScannerReadData(void *a1, size_t a2)
{
  uint64_t v2 = a1[1];
  if (v2 + a2 > *(void *)(*a1 + 8)) {
    return 0;
  }
  os_log_t result = NFDataCreateWithBytes((const void *)(*(void *)*a1 + v2), a2);
  a1[1] += a2;
  return result;
}

void *NFDataScannerCreateWithData(uint64_t a1)
{
  uint64_t v2 = malloc_type_calloc(1uLL, 0x18uLL, 0x10A00409D8FE3EAuLL);
  if (v2)
  {
    unint64_t v3 = malloc_type_calloc(1uLL, 0x48uLL, 0x1000040FF89C88EuLL);
    v2[2] = v3;
    if (!v3)
    {
      free(v2);
      return 0;
    }
    NFDataRetain(a1);
    *uint64_t v2 = a1;
    v2[1] = 0;
    uint64_t v4 = v2[2];
    *(void *)uint64_t v4 = 1;
    if (pthread_mutex_init((pthread_mutex_t *)(v4 + 8), 0))
    {
      _NFDataScannerDestroy((void **)v2);
      return 0;
    }
  }
  return v2;
}

void _NFDataScannerDestroy(void **a1)
{
  pthread_mutex_destroy((pthread_mutex_t *)(a1[2] + 1));
  free(a1[2]);
  a1[2] = 0;
  if (*a1) {
    NFDataRelease(*a1);
  }

  free(a1);
}

uint64_t NFDataScannerRetain(uint64_t a1)
{
  if (a1)
  {
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 16) + 8));
    uint64_t v2 = *(void *)(a1 + 16);
    ++*(void *)v2;
    pthread_mutex_unlock((pthread_mutex_t *)(v2 + 8));
  }
  return a1;
}

void NFDataScannerRelease(uint64_t a1)
{
  if (a1)
  {
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 16) + 8));
    uint64_t v2 = *(void *)(a1 + 16);
    uint64_t v3 = *(void *)v2 - 1;
    *(void *)uint64_t v2 = v3;
    pthread_mutex_unlock((pthread_mutex_t *)(v2 + 8));
    if (!v3)
    {
      _NFDataScannerDestroy((void **)a1);
    }
  }
}

void *NFDataCreateWithBytesNoCopy(uint64_t a1, uint64_t a2, char a3)
{
  int v6 = malloc_type_calloc(1uLL, 0x18uLL, 0x1080040EEF68E16uLL);
  uint64_t v7 = v6;
  if (v6)
  {
    *int v6 = 0;
    uint64_t v8 = (char *)malloc_type_calloc(1uLL, 0x50uLL, 0x100004092262432uLL);
    v7[2] = v8;
    if (v8)
    {
      *(void *)uint64_t v8 = 1;
      v8[72] = a3;
      if (!pthread_mutex_init((pthread_mutex_t *)(v8 + 8), 0))
      {
        *uint64_t v7 = a1;
        v7[1] = a2;
        return v7;
      }
      _NFDataDestroy(v7);
    }
    else
    {
      free(v7);
    }
    return 0;
  }
  return v7;
}

void _NFDataDestroy(void *a1)
{
  uint64_t v2 = *((void *)a1 + 2);
  if (*(unsigned char *)(v2 + 72))
  {
    uint64_t v3 = *(void **)a1;
    if (*(void *)a1)
    {
      free(v3);
      uint64_t v2 = *((void *)a1 + 2);
    }
  }
  *(void *)a1 = 0;
  pthread_mutex_destroy((pthread_mutex_t *)(v2 + 8));
  free(*((void **)a1 + 2));

  free(a1);
}

void *NFDataCreateWithLength(size_t size)
{
  if (size)
  {
    os_log_t result = malloc_type_calloc(1uLL, size, 0x100004077774924uLL);
    uint64_t v3 = result;
    if (!result) {
      return result;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  os_log_t result = NFDataCreateWithBytesNoCopy((uint64_t)v3, size, 1);
  if (v3)
  {
    if (!result)
    {
      free(v3);
      return 0;
    }
  }
  return result;
}

void **NFDataCreateWithBytes(const void *a1, size_t size)
{
  uint64_t v4 = (void **)NFDataCreateWithLength(size);
  unint64_t v5 = v4;
  if (v4) {
    memcpy(*v4, a1, size);
  }
  return v5;
}

void *NFDataCreateWithHexString(const char *a1)
{
  if (!a1) {
    return 0;
  }
  size_t v2 = strlen(a1);
  size_t v3 = v2;
  if (v2) {
    return 0;
  }
  uint64_t v4 = NFDataCreateWithLength(v2 >> 1);
  unint64_t v5 = v4;
  if (v4)
  {
    int v6 = (unsigned char *)*v4;
    if (*v4)
    {
      __str[2] = 0;
      if (v3)
      {
        size_t v7 = 0;
        uint64_t v8 = MEMORY[0x1E4F14390];
        while (1)
        {
          __str[0] = a1[v7];
          uint64_t v9 = a1[v7 + 1];
          __str[1] = a1[v7 + 1];
          if (__str[0] < 0
            || (*(_DWORD *)(v8 + 4 * __str[0] + 60) & 0x10000) == 0
            || (char)v9 < 0
            || (*(_DWORD *)(v8 + 4 * v9 + 60) & 0x10000) == 0)
          {
            break;
          }
          *v6++ = strtoul(__str, 0, 16);
          v7 += 2;
          if (v3 <= v7) {
            return v5;
          }
        }
        _NFDataDestroy(v5);
        return 0;
      }
    }
  }
  return v5;
}

void *NFDataCreateWithFile(const char *a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  size_t v2 = fopen(a1, "r");
  if (!v2)
  {
    uint64_t v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      int v11 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
      if (v11)
      {
        uint64_t v12 = __error();
        int v13 = strerror(*v12);
        int v14 = __error();
        v11(3, "%s:%i \"%s\" errno=%d Failed to open %s", "NFDataCreateWithFile", 121, v13, *v14, a1);
        uint64_t v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      unint64_t v15 = dispatch_get_specific(v9);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      unsigned int v16 = _NFSharedLogClient[(void)v15];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        unint64_t v17 = __error();
        int v18 = strerror(*v17);
        int v19 = *__error();
        *(_DWORD *)buf = 136447234;
        v38 = "NFDataCreateWithFile";
        __int16 v39 = 1024;
        int v40 = 121;
        __int16 v41 = 2080;
        uint64_t v42 = (uint64_t)v18;
        __int16 v43 = 1024;
        int v44 = v19;
        __int16 v45 = 2080;
        v46 = a1;
        _os_log_impl(&dword_1CA51A000, v16, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d Failed to open %s", buf, 0x2Cu);
      }
      return 0;
    }
    goto LABEL_31;
  }
  size_t v3 = v2;
  fseek(v2, 0, 2);
  uint64_t v4 = MEMORY[0x1CB797630](v3);
  fseek(v3, 0, 0);
  unint64_t v5 = malloc_type_calloc(1uLL, v4, 0x100004077774924uLL);
  if (!v5)
  {
    int v20 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    char v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)v21 < 4)
    {
      uint64_t v22 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v21);
      if (v22)
      {
        v22(3, "%s:%i Failed to alloc %ld", "NFDataCreateWithFile", 133, v4);
        int v20 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      os_log_t v23 = dispatch_get_specific(v20);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      size_t v24 = _NFSharedLogClient[(void)v23];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v38 = "NFDataCreateWithFile";
        __int16 v39 = 1024;
        int v40 = 133;
        __int16 v41 = 2048;
        uint64_t v42 = v4;
        _os_log_impl(&dword_1CA51A000, v24, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to alloc %ld", buf, 0x1Cu);
      }
      fclose(v3);
      return 0;
    }
LABEL_31:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  int v6 = v5;
  size_t v7 = fread(v5, 1uLL, v4, v3);
  if (v7 != v4)
  {
    size_t v25 = v7;
    __int16 v26 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)v27 < 4)
    {
      __int16 v28 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v27);
      if (v28)
      {
        unint64_t v29 = __error();
        __int16 v30 = strerror(*v29);
        long long v31 = __error();
        v28(3, "%s:%i \"%s\" errno=%d Failed to read data %ld/%ld", "NFDataCreateWithFile", 140, v30, *v31, v25, v4);
        __int16 v26 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      long long v32 = dispatch_get_specific(v26);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      uint64_t v33 = _NFSharedLogClient[(void)v32];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint32_t v34 = __error();
        long long v35 = strerror(*v34);
        int v36 = *__error();
        *(_DWORD *)buf = 136447490;
        v38 = "NFDataCreateWithFile";
        __int16 v39 = 1024;
        int v40 = 140;
        __int16 v41 = 2080;
        uint64_t v42 = (uint64_t)v35;
        __int16 v43 = 1024;
        int v44 = v36;
        __int16 v45 = 2048;
        v46 = (const char *)v25;
        __int16 v47 = 2048;
        uint64_t v48 = v4;
        _os_log_impl(&dword_1CA51A000, v33, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d Failed to read data %ld/%ld", buf, 0x36u);
      }
      fclose(v3);
      free(v6);
      return 0;
    }
    goto LABEL_31;
  }
  fclose(v3);

  return NFDataCreateWithBytesNoCopy((uint64_t)v6, v4, 1);
}

uint64_t NFDataRetain(uint64_t a1)
{
  if (a1)
  {
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 16) + 8));
    uint64_t v2 = *(void *)(a1 + 16);
    ++*(void *)v2;
    pthread_mutex_unlock((pthread_mutex_t *)(v2 + 8));
  }
  return a1;
}

void NFDataRelease(void *a1)
{
  if (a1)
  {
    pthread_mutex_lock((pthread_mutex_t *)(a1[2] + 8));
    uint64_t v2 = a1[2];
    uint64_t v3 = *(void *)v2 - 1;
    *(void *)uint64_t v2 = v3;
    pthread_mutex_unlock((pthread_mutex_t *)(v2 + 8));
    if (!v3)
    {
      _NFDataDestroy(a1);
    }
  }
}

BOOL NFDataAppendBytes(BOOL result, const void *a2, size_t a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v4 = result;
    os_log_t result = 1;
    if (a2)
    {
      if (a3)
      {
        int v6 = (char *)malloc_type_calloc(1uLL, *(void *)(v4 + 8) + a3, 0x100004077774924uLL);
        if (v6)
        {
          size_t v7 = v6;
          memcpy(v6, *(const void **)v4, *(void *)(v4 + 8));
          memcpy(&v7[*(void *)(v4 + 8)], a2, a3);
          free(*(void **)v4);
          size_t v8 = *(void *)(v4 + 8) + a3;
          *(void *)uint64_t v4 = v7;
          *(void *)(v4 + 8) = v8;
          return 1;
        }
        else
        {
          uint64_t v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          if ((unint64_t)specific >= 4) {
            __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
          }
          int v11 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
          if (v11)
          {
            uint64_t v12 = __error();
            int v13 = strerror(*v12);
            int v14 = __error();
            v11(3, "%s:%i \"%s\" errno=%d Failed to realloc to %zu bytes", "NFDataAppendBytes", 180, v13, *v14, *(void *)(v4 + 8) + a3);
            uint64_t v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          }
          unint64_t v15 = dispatch_get_specific(v9);
          if (NFSharedLogInitialize_onceToken != -1) {
            dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
          }
          unsigned int v16 = _NFSharedLogClient[(void)v15];
          os_log_t result = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
          if (result)
          {
            unint64_t v17 = __error();
            int v18 = strerror(*v17);
            int v19 = *__error();
            size_t v20 = *(void *)(v4 + 8) + a3;
            *(_DWORD *)buf = 136447234;
            uint64_t v22 = "NFDataAppendBytes";
            __int16 v23 = 1024;
            int v24 = 180;
            __int16 v25 = 2080;
            __int16 v26 = v18;
            __int16 v27 = 1024;
            int v28 = v19;
            __int16 v29 = 2048;
            size_t v30 = v20;
            _os_log_impl(&dword_1CA51A000, v16, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d Failed to realloc to %zu bytes", buf, 0x2Cu);
            return 0;
          }
        }
      }
    }
  }
  return result;
}

BOOL NFDataAppend(BOOL a1, uint64_t a2)
{
  return !a2 || NFDataAppendBytes(a1, *(const void **)a2, *(void *)(a2 + 8));
}

char *NFDataAsHexString(uint64_t *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = a1[1];
  if (!v2 || !*a1) {
    return 0;
  }
  uint64_t v3 = (char *)malloc_type_calloc(1uLL, (2 * v2) | 1, 0x100004077774924uLL);
  uint64_t v4 = v3;
  if (a1[1])
  {
    unint64_t v5 = 0;
    uint64_t v6 = *a1;
    size_t v7 = v3;
    do
    {
      sprintf(v7, "%02X", *(unsigned __int8 *)(v6 + v5++));
      v7 += 2;
    }
    while (a1[1] > v5);
  }
  return v4;
}

void NFDataPrintAsHexString(uint64_t a1, const char *a2, uint64_t *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = NFDataAsHexString(a3);
  if (v5)
  {
    uint64_t v6 = v5;
    if (_NFLogCustomLoggers)
    {
      if (a2) {
        size_t v7 = a2;
      }
      else {
        size_t v7 = "";
      }
      _NFLogCustomLoggers(a1, "%s:%i %s: %s", "NFDataPrintAsHexString", 219, v7, v5);
    }
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    size_t v8 = _NFSharedLogClient[0];
    if ((a1 - 3) >= 6) {
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    }
    else {
      os_log_type_t v9 = (0x20200001010uLL >> (8 * (a1 - 3)));
    }
    if (os_log_type_enabled((os_log_t)_NFSharedLogClient[0], (os_log_type_t)(v9 & 0xFE)))
    {
      if (a2) {
        unsigned int v10 = a2;
      }
      else {
        unsigned int v10 = "";
      }
      *(_DWORD *)buf = 136446978;
      uint64_t v12 = "NFDataPrintAsHexString";
      __int16 v13 = 1024;
      int v14 = 219;
      __int16 v15 = 2080;
      unsigned int v16 = v10;
      __int16 v17 = 2080;
      int v18 = v6;
      _os_log_impl(&dword_1CA51A000, v8, v9, "%{public}s:%i %s: %s", buf, 0x26u);
    }
    free(v6);
  }
}

CFDataRef NFDataToCFDataCreateOwnership(uint64_t a1, char a2)
{
  if (a2)
  {
    BOOL v3 = *(unsigned char *)(*(void *)(a1 + 16) + 72) == 0;
    uint64_t v4 = (const __CFAllocator **)MEMORY[0x1E4F1CF80];
    if (!*(unsigned char *)(*(void *)(a1 + 16) + 72)) {
      uint64_t v4 = (const __CFAllocator **)MEMORY[0x1E4F1CFA0];
    }
    CFAllocatorRef v5 = *v4;
  }
  else
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CFA0];
    BOOL v3 = 1;
  }
  CFDataRef result = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)a1, *(void *)(a1 + 8), v5);
  if (!v3)
  {
    if (result) {
      *(unsigned char *)(*(void *)(a1 + 16) + 72) = 0;
    }
  }
  return result;
}

void sub_1CA53E694(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void NFPreferencesChangedHandler(uint64_t a1, void *a2)
{
  BOOL v3 = (void *)MEMORY[0x1CB7976C0]();
  [a2 handlePreferencesOrProfileChanged];
}

void sub_1CA53E778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1CA53E7F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t NFSetThreadPriority(int a1)
{
  sched_param v5 = 0;
  int v4 = 0;
  uint64_t v2 = pthread_self();
  pthread_getschedparam(v2, &v4, &v5);
  v5.sched_priority = a1;
  return pthread_setschedparam(v2, v4, &v5);
}

uint64_t NFGetThreadPriority()
{
  sched_param v3 = 0;
  int v2 = 0;
  CFBooleanRef v0 = pthread_self();
  pthread_getschedparam(v0, &v2, &v3);
  return v3.sched_priority;
}

uint64_t NFGetRootQueue()
{
  pthread_mutex_lock(&gRootQueueMutex);
  uint64_t v0 = gRootQueue;
  pthread_mutex_unlock(&gRootQueueMutex);
  return v0;
}

NSObject *NFGetOrCreateRootQueue(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock(&gRootQueueMutex);
  sched_param v3 = gRootQueue;
  if (!gRootQueue)
  {
    memset(&v6, 0, sizeof(v6));
    pthread_attr_init(&v6);
    sched_param v5 = 0;
    pthread_attr_getschedparam(&v6, &v5);
    v5.sched_priority = a2;
    pthread_attr_setschedpolicy(&v6, 2);
    pthread_attr_setschedparam(&v6, &v5);
    pthread_attr_setinheritsched(&v6, 2);
    sched_param v3 = dispatch_pthread_root_queue_create();
    pthread_attr_destroy(&v6);
    dispatch_set_finalizer_f(v3, (dispatch_function_t)_NFRootQueueFinalizer);
    gRootQueue = (uint64_t)v3;
  }
  pthread_mutex_unlock(&gRootQueueMutex);
  return v3;
}

NSObject *NFCreateWorkLoop(const char *a1)
{
  inactive = dispatch_workloop_create_inactive(a1);
  dispatch_workloop_set_scheduler_priority();
  dispatch_activate(inactive);
  return inactive;
}

void _NFRootQueueFinalizer()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  unint64_t specific = (unint64_t)dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if (specific >= 4) {
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  int v2 = (void (*)(uint64_t, const char *, ...))_NFLogCustomLoggers[specific];
  if (v2)
  {
    v2(3, "%s:%i Dispatch queue has been destroyed !", "_NFRootQueueFinalizer", 43);
    uint64_t v0 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  sched_param v3 = dispatch_get_specific(v0);
  if (NFSharedLogInitialize_onceToken != -1) {
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  }
  int v4 = _NFSharedLogClient[(void)v3];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    pthread_attr_t v6 = "_NFRootQueueFinalizer";
    __int16 v7 = 1024;
    int v8 = 43;
    _os_log_impl(&dword_1CA51A000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%i Dispatch queue has been destroyed !", buf, 0x12u);
  }
  NFSimulateCrash(65261, (uint64_t)"Root queue has been destroyed");
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFDictionaryRef CFBundleCopyInfoDictionaryForURL(CFURLRef url)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7478](url);
}

CFDictionaryRef CFBundleCopyInfoDictionaryInDirectory(CFURLRef bundleURL)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7480](bundleURL);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1F40D8608](theString, suffix);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1F40E8678](*(void *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x1F40E8778](notifier);
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

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1F40E8F88](AssertionProperties, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1F40E8FA8](*(void *)&AssertionID);
}

uint64_t IOPSGetPercentRemaining()
{
  return MEMORY[0x1F40E9110]();
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1F40E9148](refcon, thePortRef, callback, notifier);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1F40E9240](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9278](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE18]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1F40D9450]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1F40C9CA0](a1, *(void *)&a2, a3, a4);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
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
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_isMetaClass(Class cls)
{
  return MEMORY[0x1F4181568](cls);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t dispatch_pthread_root_queue_create()
{
  return MEMORY[0x1F40CBB98]();
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCA0](source);
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
  return MEMORY[0x1F40CBD30](when, delta);
}

uint64_t dispatch_time_to_nsec()
{
  return MEMORY[0x1F40CBD38]();
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD58](label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x1F40CBD88]();
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1F40CC290](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1F40CC2E0](a1);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
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
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1F4181A60](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_release(void *object)
{
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD888](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD918](a1);
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return MEMORY[0x1F40CD920](a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD930](a1);
}

int pthread_attr_setinheritsched(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1F40CD948](a1, *(void *)&a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x1F40CD950](a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1F40CD958](a1, *(void *)&a2);
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x1F40CDA18](a1, a2, a3);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return MEMORY[0x1F40CDB68](a1, *(void *)&a2, a3);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0A0](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

uint64_t ucurr_getDefaultFractionDigits()
{
  return MEMORY[0x1F417FE40]();
}

uint64_t ucurr_getNumericCode()
{
  return MEMORY[0x1F417FE50]();
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1F40CE660](in, uu);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

uint64_t xpc_connection_send_notification()
{
  return MEMORY[0x1F40CEC70]();
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1F40CEE88](xdict);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1F40CF040](object1, object2);
}

uint64_t xpc_event_publisher_activate()
{
  return MEMORY[0x1F40CF048]();
}

uint64_t xpc_event_publisher_create()
{
  return MEMORY[0x1F40CF060]();
}

uint64_t xpc_event_publisher_fire()
{
  return MEMORY[0x1F40CF068]();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return MEMORY[0x1F40CF090]();
}

uint64_t xpc_event_publisher_set_handler()
{
  return MEMORY[0x1F40CF0A8]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF188](value);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1F40CF288]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x1F40CF310](type);
}