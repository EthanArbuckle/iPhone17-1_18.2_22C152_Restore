void sub_25C70A1DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getTUCallProviderManagerClass_block_invoke(uint64_t a1)
{
  TelephonyUtilitiesLibraryCore();
  Class result = objc_getClass("TUCallProviderManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getTUCallProviderManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t TelephonyUtilitiesLibraryCore()
{
  if (!TelephonyUtilitiesLibraryCore_frameworkLibrary) {
    TelephonyUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return TelephonyUtilitiesLibraryCore_frameworkLibrary;
}

Class __getTUDialRequestClass_block_invoke(uint64_t a1)
{
  TelephonyUtilitiesLibraryCore();
  Class result = objc_getClass("TUDialRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getTUDialRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getTUCallSourceIdentifierSpeakerRouteSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)TelephonyUtilitiesLibraryCore();
  if (!v2)
  {
    v4 = (void *)abort_report_np();
    free(v4);
  }
  Class result = dlsym(v2, "TUCallSourceIdentifierSpeakerRoute");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getTUCallSourceIdentifierSpeakerRouteSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __TelephonyUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TelephonyUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_25C70ACF4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id _SCDAAssertionCreateDescriptionOfProperties(void *a1)
{
  v1 = (objc_class *)NSString;
  id v2 = a1;
  id v19 = [v1 alloc];
  v3 = [v2 uuid];
  v21 = [v2 context];
  uint64_t v4 = [v21 timestamp];
  v20 = [v2 context];
  v5 = [v20 reason];
  v6 = [v2 context];
  v7 = [v6 effectiveDate];
  v8 = [v2 context];
  v9 = [v8 effectiveDate];
  [v9 timeIntervalSinceNow];
  uint64_t v11 = v10;
  v12 = [v2 context];
  [v12 expirationDuration];
  uint64_t v14 = v13;
  v15 = [v2 context];

  v16 = [v15 userInfo];
  v17 = (void *)[v19 initWithFormat:@"uuid = %@, timestamp = %llu, reason = %@, effectiveDate = %@ (%f), expirationDuration = %f, userInfo = %@", v3, v4, v5, v7, v11, v14, v16];

  return v17;
}

void sub_25C710990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23)
{
  _Block_object_dispose(&a23, 8);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
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

void sub_25C711184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void SCDALogInitIfNeeded()
{
  if (SCDALogInitIfNeeded_once != -1) {
    dispatch_once(&SCDALogInitIfNeeded_once, &__block_literal_global_511);
  }
}

uint64_t __SCDALogInitIfNeeded_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.siri", (const char *)SCDALogContext);
  v1 = (void *)SCDALogContextCore;
  SCDALogContextCore = (uint64_t)v0;

  SCDALogContextAnalytics = (uint64_t)os_log_create("com.apple.siri", (const char *)SCDALogContext);
  return MEMORY[0x270F9A758]();
}

id SCDALogForCategory(int a1)
{
  if (SCDALogForCategory_onceToken != -1) {
    dispatch_once(&SCDALogForCategory_onceToken, &__block_literal_global_4);
  }
  id v2 = (void *)SCDALogForCategory_oslog[a1];
  return v2;
}

uint64_t __SCDALogForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.siri.SCDA", "SCDA");
  v1 = (void *)SCDALogForCategory_oslog;
  SCDALogForCategory_oslog = (uint64_t)v0;

  qword_26B352EF8 = (uint64_t)os_log_create("com.apple.siri.SCDA", "Summary");
  return MEMORY[0x270F9A758]();
}

void extractMyriadDataFromAudioContext(void *a1, _WORD *a2, unsigned char *a3, unsigned char *a4, void *a5, unsigned char *a6)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v11 = a1;
  v12 = v11;
  if (!v11 || (unint64_t)[v11 length] < 4)
  {
    v15 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "extractMyriadDataFromAudioContext";
      __int16 v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_25C707000, v15, OS_LOG_TYPE_INFO, "%s SCDARecord invalid data during init: %@", buf, 0x16u);
    }
    if (a2) {
      *a2 = 0;
    }
    if (a3) {
      *a3 = 0;
    }
    if (a4) {
      *a4 = 0;
    }
    goto LABEL_32;
  }
  if (!a2) {
    goto LABEL_28;
  }
  int v13 = (unsigned __int16)arc4random_uniform(0x10000u);
  while (!v13 || v13 == (unsigned __int16)*a2)
  {
    unsigned __int16 v14 = arc4random_uniform(0x10000u);
    if ((v14 & 0xFFFB) == 0xF0) {
      goto LABEL_11;
    }
    int v13 = v14;
    if (v14 > 0xF9F8u)
    {
      if (v14 == 63993 || v14 == 0xFFFF) {
        goto LABEL_11;
      }
    }
    else if (v14 - 208 <= 0x2F && ((1 << (v14 + 48)) & 0x830080010001) != 0 || !v14)
    {
LABEL_11:
      int v13 = 0;
    }
  }
  v16 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "_generateRandomHash";
    __int16 v20 = 1024;
    LODWORD(v21) = v13;
    _os_log_impl(&dword_25C707000, v16, OS_LOG_TYPE_INFO, "%s Generated myriad hash: %hu", buf, 0x12u);
  }
  *a2 = v13;
LABEL_28:
  if (a3) {
    objc_msgSend(v12, "getBytes:range:", a3, 2, 1);
  }
  if (a4) {
    objc_msgSend(v12, "getBytes:range:", a4, 3, 1);
  }
LABEL_32:
  if (a5)
  {
    *(void *)buf = 0;
    unint64_t v17 = [v12 length];
    uint64_t v18 = 0;
    if (v17 >= 0xC)
    {
      objc_msgSend(v12, "getBytes:range:", buf, 4, 8, 0.0);
      uint64_t v18 = *(void *)buf;
    }
    *a5 = v18;
  }
  if (a6)
  {
    if ((unint64_t)[v12 length] < 0xD) {
      *a6 = 0;
    }
    else {
      objc_msgSend(v12, "getBytes:range:", a6, 12, 1);
    }
  }
}

void _SCDAAssistantPreferencesSetValueForKeyWithContext(void *a1, const __CFString *a2, const __CFString *a3, void *a4)
{
  id value = a1;
  v7 = [a4 preferencesSubdomain];
  if (v7)
  {
    v8 = (__CFString *)[[NSString alloc] initWithFormat:@"%@/%@", v7, a2];
    CFPreferencesSetAppValue(v8, value, a3);
  }
  else
  {
    CFPreferencesSetAppValue(a2, value, a3);
  }
}

id _SCDAAssistantPreferencesValueForKeyWithContext(const __CFString *a1, const __CFString *a2, void *a3)
{
  v5 = [a3 preferencesSubdomain];
  if (v5)
  {
    v6 = (__CFString *)[[NSString alloc] initWithFormat:@"%@/%@", v5, a1];
    v7 = (void *)CFPreferencesCopyAppValue(v6, a2);
  }
  else
  {
    v7 = (void *)CFPreferencesCopyAppValue(a1, a2);
  }

  return v7;
}

uint64_t _SCDAAssistantPreferencesBoolFromValueWithDefault(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a1;
  if (objc_opt_respondsToSelector())
  {
    a3 = [v5 BOOLValue];
  }
  else if (v5)
  {
    v6 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315906;
      v9 = "_SCDAAssistantPreferencesBoolFromValueWithDefault";
      __int16 v10 = 1024;
      int v11 = a3;
      __int16 v12 = 2112;
      uint64_t v13 = a2;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_error_impl(&dword_25C707000, v6, OS_LOG_TYPE_ERROR, "%s Expected a value responding to -BOOLValue, but found something else. Returning %{BOOL}d. {key: %@, value: %@}", (uint8_t *)&v8, 0x26u);
    }
  }

  return a3;
}

uint64_t _SCDAAssistantPreferencesDidChangeCallback(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    v6 = "_SCDAAssistantPreferencesDidChangeCallback";
    _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s Preferences Changed!", (uint8_t *)&v5, 0xCu);
  }
  return [a2 _preferencesDidChangeExternally];
}

void _SCDAAssistantPreferencesSetValueForKey(void *a1, const __CFString *a2)
{
}

id _SCDAAssistantPreferencesValueForKey(const __CFString *a1)
{
  return _SCDAAssistantPreferencesValueForKeyWithContext(a1, @"com.apple.assistant", 0);
}

uint64_t SCDASupportPreferencesSynchronize()
{
  return CFPreferencesAppSynchronize(@"com.apple.assistant.support");
}

uint64_t SCDABackedUpPreferencesSynchronize()
{
  return CFPreferencesAppSynchronize(@"com.apple.assistant.backedup");
}

uint64_t SCDAInternalPreferencesSynchronize()
{
  return CFPreferencesAppSynchronize(@"com.apple.assistant");
}

double SCDAMaxNoOperationDelay()
{
  if (SCDAMaxNoOperationDelay_onceToken != -1) {
    dispatch_once(&SCDAMaxNoOperationDelay_onceToken, &__block_literal_global_1041);
  }
  return *(double *)&SCDAMaxNoOperationDelay_noopDelay;
}

void __SCDAMaxNoOperationDelay_block_invoke()
{
  SCDAMaxNoOperationDelay_noopDelay = 0x3F747AE147AE147BLL;
  id v1 = +[SCDAAssistantPreferences sharedPreferences];
  [v1 myriadMaxNoOperationDelay];
  SCDAMaxNoOperationDelay_noopDelay = v0;
}

uint64_t SCDAMaxNoOperationAccessoryMessageCount()
{
  return 3;
}

double SCDADecisionGetWaitTime()
{
  return 2.9000001;
}

double SCDAMonitorDecisionGetWaitTime()
{
  return 5.80000019;
}

double SCDAPreheatGetWaitTime()
{
  return 2.0;
}

void sub_25C71872C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1090(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1091(uint64_t a1)
{
}

uint64_t SCDAAssertionRelinquishmentOptionsValidate(char a1)
{
  return a1 & 1;
}

id SCDAAssertionRelinquishmentOptionsGetNames(uint64_t a1)
{
  if (a1)
  {
    char v1 = a1;
    id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
    v3 = v2;
    if (v1) {
      [v2 addObject:@"inactiveOnly"];
    }
    uint64_t v4 = (void *)[v3 copy];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x263EFFA68];
  }
  return v4;
}

uint64_t SCDAAssertionRelinquishmentOptionsGetFromNames(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if ([v1 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v12 = v1;
    id v2 = v1;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = 0;
      uint64_t v6 = *(void *)v14;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v2);
          }
          id v8 = *(id *)(*((void *)&v13 + 1) + 8 * v7);
          if ([v8 length])
          {
            if (_SCDAAssertionRelinquishmentOptionsGetFromName_onceToken != -1) {
              dispatch_once(&_SCDAAssertionRelinquishmentOptionsGetFromName_onceToken, &__block_literal_global_1223);
            }
            v9 = [(id)_SCDAAssertionRelinquishmentOptionsGetFromName_map objectForKey:v8];
            uint64_t v10 = [v9 unsignedIntegerValue];
          }
          else
          {
            uint64_t v10 = 0;
          }

          v5 |= v10;
          ++v7;
        }
        while (v4 != v7);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v4);
    }
    else
    {
      uint64_t v5 = 0;
    }

    id v1 = v12;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_25C71A27C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25C71A41C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __libAccessibilityLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  libAccessibilityLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_MKBGetDeviceLockState()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(void))getMKBGetDeviceLockStateSymbolLoc_ptr;
  uint64_t v7 = getMKBGetDeviceLockStateSymbolLoc_ptr;
  if (!getMKBGetDeviceLockStateSymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getMKBGetDeviceLockStateSymbolLoc_block_invoke;
    v3[3] = &unk_2654B7FF8;
    v3[4] = &v4;
    __getMKBGetDeviceLockStateSymbolLoc_block_invoke((uint64_t)v3);
    uint64_t v0 = (uint64_t (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    id v2 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v2);
  }
  return v0(0);
}

void *__getMKBGetDeviceLockStateSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!MobileKeyBagLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __MobileKeyBagLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2654B7928;
    uint64_t v7 = 0;
    MobileKeyBagLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    id v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
    if (MobileKeyBagLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "MKBGetDeviceLockState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBGetDeviceLockStateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MobileKeyBagLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileKeyBagLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t SCDAIsInternalInstall()
{
  if (SCDAIsInternalInstall_onceToken != -1) {
    dispatch_once(&SCDAIsInternalInstall_onceToken, &__block_literal_global_1260);
  }
  return SCDAIsInternalInstall_isInternal;
}

uint64_t __SCDAIsInternalInstall_block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  SCDAIsInternalInstall_isInternal = result;
  return result;
}

dispatch_queue_t SCDADispatchSerialQueueWithRelativePriority(const char *a1, dispatch_qos_class_t a2, int a3)
{
  long long v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v7 = dispatch_queue_attr_make_with_qos_class(v6, a2, a3);

  dispatch_queue_t v8 = dispatch_queue_create(a1, v7);
  return v8;
}

dispatch_queue_t SCDADispatchSerialQueueWithQOS(const char *a1, dispatch_qos_class_t a2)
{
  return SCDADispatchSerialQueueWithRelativePriority(a1, a2, 0);
}

uint64_t SCDASupportsHAL()
{
  return +[SCDAUtilities isNano] ^ 1;
}

id SCDAProductType()
{
  uint64_t v0 = (void *)MGCopyAnswer();
  return v0;
}

dispatch_time_t SCDADispatchTimeGetFromDateAndOffset(void *a1, double a2)
{
  if (a1)
  {
    float64_t __y = 0.0;
    [a1 timeIntervalSince1970];
    long double v4 = modf(v3, (long double *)&__y);
    v5.f64[0] = __y;
    v5.f64[1] = v4 * 1000000000.0;
    timespec v7 = (timespec)vcvtq_s64_f64(vminnmq_f64(vmaxnmq_f64(v5, (float64x2_t)vdupq_n_s64(0xC3E0000000000000)), (float64x2_t)vdupq_n_s64(0x43E0000000000000uLL)));
    return dispatch_walltime(&v7, (uint64_t)(a2 * 1000000000.0));
  }
  else
  {
    return dispatch_walltime(0, (uint64_t)(a2 * 1000000000.0));
  }
}

double SCDAMachAbsoluteTimeGetTimeInterval(unint64_t a1)
{
  if (_SCDAMachAbsoluteTimeRate_onceToken != -1) {
    dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_36);
  }
  return *(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)a1 / 1000000000.0;
}

unint64_t SCDAMachAbsoluteTimeGetMilliseconds(unint64_t a1)
{
  if (_SCDAMachAbsoluteTimeRate_onceToken != -1) {
    dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_36);
  }
  return (unint64_t)(*(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)a1 / 1000000.0);
}

unint64_t SCDAMachAbsoluteTimeGetNanoseconds(unint64_t a1)
{
  if (_SCDAMachAbsoluteTimeRate_onceToken != -1) {
    dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_36);
  }
  return (unint64_t)(*(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)a1);
}

id SCDAToSISchemaUUID(void *a1)
{
  if (a1)
  {
    id v1 = (objc_class *)MEMORY[0x263F6EEE0];
    id v2 = a1;
    long double v3 = (void *)[[v1 alloc] initWithNSUUID:v2];
  }
  else
  {
    long double v3 = 0;
  }
  return v3;
}

BOOL SCDAGoodnessScoreOverrideOptionGetIsValid(unint64_t a1)
{
  return a1 < 3;
}

BOOL SCDAGoodnessScoreOverrideOptionGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

__CFString *SCDAGoodnessScoreOverrideOptionGetName(unint64_t a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return off_2654B7A28[a1];
  }
}

uint64_t SCDAGoodnessScoreOverrideOptionGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SCDAGoodnessScoreOverrideOptionGetFromName_onceToken != -1) {
      dispatch_once(&SCDAGoodnessScoreOverrideOptionGetFromName_onceToken, &__block_literal_global_1528);
    }
    id v2 = [(id)SCDAGoodnessScoreOverrideOptionGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SCDAGoodnessScoreOverrideOptionGetFromName_block_invoke()
{
  uint64_t v0 = (void *)SCDAGoodnessScoreOverrideOptionGetFromName_map;
  SCDAGoodnessScoreOverrideOptionGetFromName_map = (uint64_t)&unk_2709D7BD0;
}

void sub_25C71D79C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, char a16)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a16, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1654(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1655(uint64_t a1)
{
}

unsigned int SCDAGoodnessComputeExponentialBoost(double a1, double a2, double a3, double a4, double a5)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  double v5 = exp(-((a2 - a1) * a4 + a3 * ((a2 - a1) * (a2 - a1)) + a5));
  long long v6 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    v9 = "SCDAGoodnessComputeExponentialBoost";
    __int16 v10 = 2048;
    double v11 = v5;
    _os_log_impl(&dword_25C707000, v6, OS_LOG_TYPE_INFO, "%s #scda exponential bump %f", (uint8_t *)&v8, 0x16u);
  }
  return llround(v5);
}

BOOL SCDAGoodnessScoreBumpReasonGetIsValid(unint64_t a1)
{
  return a1 < 4;
}

BOOL SCDAGoodnessScoreBumpReasonGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 3;
}

__CFString *SCDAGoodnessScoreBumpReasonGetName(unint64_t a1)
{
  if (a1 > 3) {
    return @"(unknown)";
  }
  else {
    return off_2654B7A68[a1];
  }
}

uint64_t SCDAGoodnessScoreBumpReasonGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SCDAGoodnessScoreBumpReasonGetFromName_onceToken != -1) {
      dispatch_once(&SCDAGoodnessScoreBumpReasonGetFromName_onceToken, &__block_literal_global_1732);
    }
    id v2 = [(id)SCDAGoodnessScoreBumpReasonGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SCDAGoodnessScoreBumpReasonGetFromName_block_invoke()
{
  uint64_t v0 = (void *)SCDAGoodnessScoreBumpReasonGetFromName_map;
  SCDAGoodnessScoreBumpReasonGetFromName_map = (uint64_t)&unk_2709D7BF8;
}

SCDANotifyStatePublisher *SCDAElectionBeginNotifyStatePublisher(void *a1, void *a2)
{
  return publisherWithNotificationName((uint64_t)"com.apple.siri.myriad.decision.begin", a1, a2);
}

SCDANotifyStatePublisher *publisherWithNotificationName(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  long long v6 = getEffectiveNotificationName(a1, a2);
  timespec v7 = [[SCDANotifyStatePublisher alloc] initWithName:v6 queue:v5];

  return v7;
}

id getEffectiveNotificationName(uint64_t a1, void *a2)
{
  uint64_t v3 = NSString;
  id v4 = a2;
  id v5 = [v3 stringWithCString:a1 encoding:4];
  long long v6 = [v4 info];

  uint64_t v7 = [v6 applicationType];
  int IsValidAndSpecified = AFInstanceApplicationTypeGetIsValidAndSpecified();
  if (v7 != 1 && IsValidAndSpecified)
  {
    v9 = AFInstanceApplicationTypeGetName();
    __int16 v10 = [v5 stringByAppendingFormat:@".%@", v9];

    double v11 = [v6 applicationUUID];
    uint64_t v12 = v11;
    if (v11)
    {
      long long v13 = [v11 UUIDString];
      uint64_t v14 = [v10 stringByAppendingFormat:@".%@", v13];

      __int16 v10 = (void *)v14;
    }

    id v5 = v10;
  }

  return v5;
}

SCDANotifyStatePublisher *SCDAElectionWinNotifyStatePublisher(void *a1, void *a2)
{
  return publisherWithNotificationName((uint64_t)"com.apple.siri.myriad.decision.won", a1, a2);
}

SCDANotifyStatePublisher *SCDAElectionLossNotifyStatePublisher(void *a1, void *a2)
{
  return publisherWithNotificationName((uint64_t)"com.apple.siri.myriad.decision.lost", a1, a2);
}

SCDANotifyStatePublisher *SCDAElectionRepostWinDecisionNotifyStatePublisher(void *a1, void *a2)
{
  return publisherWithNotificationName((uint64_t)"com.apple.siri.myriad.repost.decision.won", a1, a2);
}

SCDANotifyStatePublisher *SCDAPreferencesChangedNotifyStatePublisher(void *a1, void *a2)
{
  return publisherWithNotificationName((uint64_t)"com.apple.siri.myriad.readdefaults", a1, a2);
}

id SCDAForceNoActivityNotifyStatePublisher(void *a1, void *a2)
{
  uint64_t v3 = (void *)SCDA_MYRIAD_FORCE_NO_ACTIVITY_NOTIFICATION;
  id v4 = a2;
  id v5 = a1;
  long long v6 = publisherWithNotificationName([v3 UTF8String], v5, v4);

  return v6;
}

SCDANotifyObserver *SCDAElectionBeginNotifyStateObserver(void *a1, uint64_t a2, void *a3, void *a4)
{
  return observerWithNotificationName((uint64_t)"com.apple.siri.myriad.decision.begin", a1, a2, a3, a4);
}

SCDANotifyObserver *observerWithNotificationName(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a5;
  id v10 = a4;
  double v11 = getEffectiveNotificationName(a1, a2);
  uint64_t v12 = [[SCDANotifyObserver alloc] initWithName:v11 options:a3 queue:v9 delegate:v10];

  return v12;
}

SCDANotifyObserver *SCDAElectionWinNotifyStateObserver(void *a1, uint64_t a2, void *a3, void *a4)
{
  return observerWithNotificationName((uint64_t)"com.apple.siri.myriad.decision.won", a1, a2, a3, a4);
}

SCDANotifyObserver *SCDAElectionLossNotifyStateObserver(void *a1, uint64_t a2, void *a3, void *a4)
{
  return observerWithNotificationName((uint64_t)"com.apple.siri.myriad.decision.lost", a1, a2, a3, a4);
}

SCDANotifyObserver *SCDAElectionDecisionRequestNotifyStateObserver(void *a1, uint64_t a2, void *a3, void *a4)
{
  return observerWithNotificationName((uint64_t)"com.apple.siri.myriad.get.decision", a1, a2, a3, a4);
}

SCDANotifyObserver *SCDAElectionRepostWinDecisionNotifyStateObserver(void *a1, uint64_t a2, void *a3, void *a4)
{
  return observerWithNotificationName((uint64_t)"com.apple.siri.myriad.repost.decision.won", a1, a2, a3, a4);
}

SCDANotifyObserver *SCDAPreferencesChangedNotifyStateObserver(void *a1, uint64_t a2, void *a3, void *a4)
{
  return observerWithNotificationName((uint64_t)"com.apple.siri.myriad.readdefaults", a1, a2, a3, a4);
}

id SCDAForceNoActivityNotifyStateObserver(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7 = (void *)SCDA_MYRIAD_FORCE_NO_ACTIVITY_NOTIFICATION;
  id v8 = a4;
  id v9 = a3;
  id v10 = a1;
  double v11 = observerWithNotificationName([v7 UTF8String], v10, a2, v9, v8);

  return v11;
}

id SCDAReadDefaultsNotificationName(void *a1)
{
  return getEffectiveNotificationName((uint64_t)"com.apple.siri.myriad.readdefaults", a1);
}

void sub_25C722128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void notificationNearMissCallback(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "notificationNearMissCallback";
    _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s #scda #feedback near miss!", (uint8_t *)&v4, 0xCu);
  }
  [v2 _publishFeedbackArbitrationRecordForNearMiss];
}

id getWPHeySiriKeyManufacturerData()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getWPHeySiriKeyManufacturerDataSymbolLoc_ptr;
  uint64_t v8 = getWPHeySiriKeyManufacturerDataSymbolLoc_ptr;
  if (!getWPHeySiriKeyManufacturerDataSymbolLoc_ptr)
  {
    id v1 = (void *)WirelessProximityLibrary();
    v6[3] = (uint64_t)dlsym(v1, "WPHeySiriKeyManufacturerData");
    getWPHeySiriKeyManufacturerDataSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    int v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

void *__getWPHeySiriKeyManufacturerDataSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)WirelessProximityLibrary();
  uint64_t result = dlsym(v2, "WPHeySiriKeyManufacturerData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWPHeySiriKeyManufacturerDataSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t WirelessProximityLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!WirelessProximityLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __WirelessProximityLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_2654B8018;
    uint64_t v5 = 0;
    WirelessProximityLibraryCore_frameworkLibrary = _sl_dlopen();
    id v1 = (void *)v3[0];
    uint64_t v0 = WirelessProximityLibraryCore_frameworkLibrary;
    if (WirelessProximityLibraryCore_frameworkLibrary)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      id v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return WirelessProximityLibraryCore_frameworkLibrary;
}

uint64_t __WirelessProximityLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  WirelessProximityLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_25C725950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getWPHeySiriKeyDeviceAddressSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)WirelessProximityLibrary();
  uint64_t result = dlsym(v2, "WPHeySiriKeyDeviceAddress");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWPHeySiriKeyDeviceAddressSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_25C726988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSFDiagnosticsClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!SharingLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __SharingLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2654B8050;
    uint64_t v6 = 0;
    SharingLibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!SharingLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("SFDiagnostics");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  getSFDiagnosticsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SharingLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SharingLibraryCore_frameworkLibrary = result;
  return result;
}

id getWPHeySiriAdvertisingData()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getWPHeySiriAdvertisingDataSymbolLoc_ptr;
  uint64_t v8 = getWPHeySiriAdvertisingDataSymbolLoc_ptr;
  if (!getWPHeySiriAdvertisingDataSymbolLoc_ptr)
  {
    id v1 = (void *)WirelessProximityLibrary();
    v6[3] = (uint64_t)dlsym(v1, "WPHeySiriAdvertisingData");
    getWPHeySiriAdvertisingDataSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

void *__getWPHeySiriAdvertisingDataSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)WirelessProximityLibrary();
  uint64_t result = dlsym(v2, "WPHeySiriAdvertisingData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWPHeySiriAdvertisingDataSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_25C72A018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_25C72BA28(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_25C72EFD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25C731C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose((const void *)(v43 - 240), 8);
  _Block_object_dispose((const void *)(v43 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2362(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2363(uint64_t a1)
{
}

id safelyGetAudioData()
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v0 = NSHomeDirectory();
  id v1 = [v0 stringByAppendingPathComponent:@"Library/VoiceTrigger"];
  uint64_t v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    v33 = "SCDACoordinatorAudioHashFileBaseDirectory";
    __int16 v34 = 2113;
    uint64_t v35 = (uint64_t)v1;
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s BTLE audio hash base directory %{private}@", buf, 0x16u);
  }

  uint64_t v3 = [v1 stringByAppendingPathComponent:@"siriBC"];
  long long v4 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    v33 = "SCDACoordinatorAudioHashFilePath";
    __int16 v34 = 2113;
    uint64_t v35 = (uint64_t)v3;
    _os_log_impl(&dword_25C707000, v4, OS_LOG_TYPE_INFO, "%s BTLE audio hash file path %{private}@", buf, 0x16u);
  }

  uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  if ([v5 fileExistsAtPath:v3]) {
    uint64_t v6 = (const char *)[v3 UTF8String];
  }
  else {
    uint64_t v6 = 0;
  }

  uint64_t v7 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    v33 = "safelyGetAudioData";
    __int16 v34 = 2081;
    uint64_t v35 = (uint64_t)v6;
    _os_log_impl(&dword_25C707000, v7, OS_LOG_TYPE_INFO, "%s #scda BTLE opening audio file at path %{private}s", buf, 0x16u);
  }
  if (v6)
  {
    int v8 = open(v6, 0);
    id v9 = SCDALogContextCore;
    if ((v8 & 0x80000000) == 0)
    {
      int v10 = v8;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v33 = "safelyGetAudioData";
        __int16 v34 = 1024;
        LODWORD(v35) = 12;
        _os_log_error_impl(&dword_25C707000, v9, OS_LOG_TYPE_ERROR, "%s #scda BTLE could open audio data file, MYR_EXT_FINGERPRINT_LEN: %d", buf, 0x12u);
      }
      ssize_t v11 = read(v10, v44, 0xDuLL);
      switch(v11)
      {
        case 4:
          uint64_t v12 = (void *)MEMORY[0x263EFF8F8];
          long long v13 = v44;
          break;
        case 13:
          uint64_t v12 = (void *)MEMORY[0x263EFF8F8];
          long long v13 = v44;
          uint64_t v14 = 13;
          goto LABEL_28;
        case 12:
          uint64_t v12 = (void *)MEMORY[0x263EFF8F8];
          long long v13 = v44;
          uint64_t v14 = 12;
LABEL_28:
          long long v15 = [v12 dataWithBytes:v13 length:v14];
          close(v10);
          uint64_t v31 = 0;
          if ((unint64_t)[v15 length] >= 0xC) {
            objc_msgSend(v15, "getBytes:range:", &v31, 4, 8);
          }
          unsigned __int16 v30 = 0;
          __int16 v29 = 0;
          unint64_t v28 = 0;
          unsigned __int8 v27 = 0;
          objc_msgSend(v15, "getBytes:range:", &v30, 0, 2);
          objc_msgSend(v15, "getBytes:range:", (char *)&v29 + 1, 2, 1);
          objc_msgSend(v15, "getBytes:range:", &v29, 3, 1);
          if ((unint64_t)[v15 length] >= 0xC) {
            objc_msgSend(v15, "getBytes:range:", &v28, 4, 8);
          }
          if ((unint64_t)[v15 length] >= 0xD) {
            objc_msgSend(v15, "getBytes:range:", &v27, 12, 1);
          }
          unint64_t v17 = SCDALogContextCore;
          if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
          {
            v23 = v17;
            v24 = [v15 debugDescription];
            *(_DWORD *)buf = 136315650;
            v33 = "safelyGetAudioData";
            __int16 v34 = 2112;
            uint64_t v35 = (uint64_t)v24;
            __int16 v36 = 2048;
            *(void *)v37 = v31;
            _os_log_debug_impl(&dword_25C707000, v23, OS_LOG_TYPE_DEBUG, "%s data=%@, voiceTriggerTimeRaw=%f", buf, 0x20u);

            unint64_t v17 = SCDALogContextCore;
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            v25 = v17;
            v26 = [v15 debugDescription];
            *(_DWORD *)buf = 136316674;
            v33 = "safelyGetAudioData";
            __int16 v34 = 2112;
            uint64_t v35 = (uint64_t)v26;
            __int16 v36 = 1024;
            *(_DWORD *)v37 = v30;
            *(_WORD *)&v37[4] = 1024;
            *(_DWORD *)&v37[6] = HIBYTE(v29);
            __int16 v38 = 1024;
            int v39 = v29;
            __int16 v40 = 2048;
            unint64_t v41 = v28;
            __int16 v42 = 1024;
            int v43 = v27;
            _os_log_debug_impl(&dword_25C707000, v25, OS_LOG_TYPE_DEBUG, "%s data=%@, hash=%hu, good=%hu, conf=%hu, absTime=%llu, frac=%hu", buf, 0x38u);
          }
          uint64_t v18 = mach_absolute_time();
          if (_SCDAMachAbsoluteTimeRate_onceToken != -1) {
            dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_36);
          }
          double v19 = *(double *)&_SCDAMachAbsoluteTimeRate_rate;
          unint64_t v20 = v28;
          v21 = SCDALogContextCore;
          if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v33 = "safelyGetAudioData";
            __int16 v34 = 2048;
            uint64_t v35 = v18;
            __int16 v36 = 2048;
            *(double *)v37 = v19 * (double)v18 / 1000000000.0
                           - *(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)v20 / 1000000000.0;
            _os_log_impl(&dword_25C707000, v21, OS_LOG_TYPE_INFO, "%s currentTime=%llu timeSinceActivationInSeconds=%f", buf, 0x20u);
          }
          goto LABEL_42;
        default:
          long long v16 = SCDALogContextCore;
          if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v33 = "safelyGetAudioData";
            _os_log_error_impl(&dword_25C707000, v16, OS_LOG_TYPE_ERROR, "%s #scda BTLE could not read 4 bytes from audio data file", buf, 0xCu);
          }
          *(_DWORD *)buf = 0;
          uint64_t v12 = (void *)MEMORY[0x263EFF8F8];
          long long v13 = buf;
          break;
      }
      uint64_t v14 = 4;
      goto LABEL_28;
    }
  }
  else
  {
    id v9 = SCDALogContextCore;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "safelyGetAudioData";
    _os_log_impl(&dword_25C707000, v9, OS_LOG_TYPE_INFO, "%s #scda BTLE could not open audio data file", buf, 0xCu);
  }
  *(_DWORD *)buf = 0;
  long long v15 = [MEMORY[0x263EFF8F8] dataWithBytes:buf length:4];
LABEL_42:

  return v15;
}

void sub_25C736930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getWPHeySiriClass_block_invoke(uint64_t a1)
{
  WirelessProximityLibrary();
  Class result = objc_getClass("WPHeySiri");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getWPHeySiriClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__36__SCDACoordinator_initWithDelegate___block_invoke(v3);
  }
  return result;
}

uint64_t carplayTriggerSeenCallback()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v0 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v2 = 136315138;
    uint64_t v3 = "carplayTriggerSeenCallback";
    _os_log_impl(&dword_25C707000, v0, OS_LOG_TYPE_INFO, "%s #scda BTLE CarPlay trigger signal received", (uint8_t *)&v2, 0xCu);
  }
  uint64_t result = _currentCoordinator;
  if (_currentCoordinator) {
    return [(id)_currentCoordinator startAdvertisingFromCarPlayTrigger];
  }
  return result;
}

uint64_t inEarTriggerSeenCallback()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v0 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v2 = 136315138;
    uint64_t v3 = "inEarTriggerSeenCallback";
    _os_log_impl(&dword_25C707000, v0, OS_LOG_TYPE_INFO, "%s #scda BTLE in ear trigger signal received", (uint8_t *)&v2, 0xCu);
  }
  uint64_t result = _currentCoordinator;
  if (_currentCoordinator) {
    return [(id)_currentCoordinator startAdvertisingFromInEarTrigger];
  }
  return result;
}

uint64_t myriadDecisionRequestCallback()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v0 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v2 = 136315138;
    uint64_t v3 = "myriadDecisionRequestCallback";
    _os_log_impl(&dword_25C707000, v0, OS_LOG_TYPE_INFO, "%s #scda BTLE myriad decision fetch signal received", (uint8_t *)&v2, 0xCu);
  }
  uint64_t result = _currentCoordinator;
  if (_currentCoordinator) {
    return [(id)_currentCoordinator notifyCurrentDecisionResult];
  }
  return result;
}

uint64_t emergencyCallback()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v0 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v2 = 136315138;
    uint64_t v3 = "emergencyCallback";
    _os_log_impl(&dword_25C707000, v0, OS_LOG_TYPE_INFO, "%s #scda BTLE emergency signal received", (uint8_t *)&v2, 0xCu);
  }
  uint64_t result = _currentCoordinator;
  if (_currentCoordinator) {
    return [(id)_currentCoordinator startAdvertisingEmergency];
  }
  return result;
}

uint64_t outputTriggerSeenCallback()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v0 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v2 = 136315138;
    uint64_t v3 = "outputTriggerSeenCallback";
    _os_log_impl(&dword_25C707000, v0, OS_LOG_TYPE_INFO, "%s #scda BTLE self trigger signal received", (uint8_t *)&v2, 0xCu);
  }
  uint64_t result = _currentCoordinator;
  if (_currentCoordinator) {
    return [(id)_currentCoordinator startAdvertisingFromOutgoingTrigger];
  }
  return result;
}

uint64_t notificationCallback()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  kdebug_trace();
  uint64_t v0 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v2 = 136315138;
    uint64_t v3 = "notificationCallback";
    _os_log_impl(&dword_25C707000, v0, OS_LOG_TYPE_INFO, "%s #scda BTLE audio data signal received", (uint8_t *)&v2, 0xCu);
  }
  uint64_t result = _currentCoordinator;
  if (_currentCoordinator) {
    return [(id)_currentCoordinator startAdvertisingFromVoiceTrigger];
  }
  return result;
}

uint64_t hammingDistance(int a1, int a2)
{
  int v2 = a2 ^ a1;
  if (a2 == a1) {
    return 0;
  }
  LODWORD(result) = 0;
  do
  {
    uint64_t result = (result + 1);
    v2 &= v2 - 1;
  }
  while (v2);
  return result;
}

BOOL SCDAAdvertisementRecordTypeGetIsValid(unint64_t a1)
{
  return a1 < 0xB;
}

BOOL SCDAAdvertisementRecordTypeGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 0xA;
}

__CFString *SCDAAdvertisementRecordTypeGetName(unint64_t a1)
{
  if (a1 > 0xA) {
    return @"(unknown)";
  }
  else {
    return off_2654B8250[a1];
  }
}

uint64_t SCDAAdvertisementRecordTypeGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SCDAAdvertisementRecordTypeGetFromName_onceToken != -1) {
      dispatch_once(&SCDAAdvertisementRecordTypeGetFromName_onceToken, &__block_literal_global_2664);
    }
    int v2 = [(id)SCDAAdvertisementRecordTypeGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SCDAAdvertisementRecordTypeGetFromName_block_invoke()
{
  uint64_t v0 = (void *)SCDAAdvertisementRecordTypeGetFromName_map;
  SCDAAdvertisementRecordTypeGetFromName_map = (uint64_t)&unk_2709D7C20;
}

uint64_t AFInstanceApplicationTypeGetIsValidAndSpecified()
{
  return MEMORY[0x270F0ED70]();
}

uint64_t AFInstanceApplicationTypeGetName()
{
  return MEMORY[0x270F0ED78]();
}

uint64_t AFSiriActivationSourceGetName()
{
  return MEMORY[0x270F0EF48]();
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

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x270EF4840](AssertionType, *(void *)&AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x270EF4868](*(void *)&AssertionID);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x270ED9470](queue);
}

void dispatch_resume(dispatch_object_t object)
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

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x270ED9580](source);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x270ED95B8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

long double modf(long double __x, long double *__y)
{
  MEMORY[0x270EDA5A8](__y, __x);
  return result;
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x270EDA798](*(void *)&token, state64);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x270EDBA28](uu);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}