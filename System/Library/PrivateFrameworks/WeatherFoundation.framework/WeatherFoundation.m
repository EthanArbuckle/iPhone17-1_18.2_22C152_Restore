void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_4_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return v0;
}

void OUTLINED_FUNCTION_2_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_8(uint64_t a1, uint64_t a2)
{
  return a2;
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void __getUIApplicationClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("UIApplication");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUIApplicationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getUIApplicationClass_block_invoke_cold_1();
    UIKitLibrary();
  }
}

void UIKitLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!UIKitLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __UIKitLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_264432640;
    uint64_t v3 = 0;
    UIKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!UIKitLibraryCore_frameworkLibrary_0)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

id WFWeatherStoreServiceCacheURL(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    long long v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    if ([v2 count])
    {
      uint64_t v3 = [MEMORY[0x263F086E0] mainBundle];
      uint64_t v4 = [v3 infoDictionary];
      uint64_t v5 = [v4 objectForKey:@"CFBundleIdentifier"];

      v6 = [v2 objectAtIndex:0];
      v7 = [v6 stringByAppendingPathComponent:v5];

      v8 = [v7 stringByAppendingPathComponent:v1];
    }
    else
    {
      v8 = 0;
    }
    uint64_t v9 = [NSURL fileURLWithPath:v8 isDirectory:1];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

id AqiScaleForCountryCode(void *a1)
{
  id v1 = a1;
  long long v2 = v1;
  if (AqiScaleForCountryCode_onceToken != -1)
  {
    dispatch_once(&AqiScaleForCountryCode_onceToken, &__block_literal_global_0);
    if (v2) {
      goto LABEL_3;
    }
LABEL_7:
    id v6 = (id)AqiScaleForCountryCode_defaultScale;
    goto LABEL_8;
  }
  if (!v1) {
    goto LABEL_7;
  }
LABEL_3:
  uint64_t v3 = [(id)AqiScaleForCountryCode_AQIScalesForCountries objectForKeyedSubscript:v2];
  uint64_t v4 = (void *)v3;
  uint64_t v5 = (void *)AqiScaleForCountryCode_defaultScale;
  if (v3) {
    uint64_t v5 = (void *)v3;
  }
  id v6 = v5;

LABEL_8:
  return v6;
}

void __AqiScaleForCountryCode_block_invoke()
{
  v12[7] = *MEMORY[0x263EF8340];
  uint64_t v0 = objc_opt_new();
  id v1 = (void *)AqiScaleForCountryCode_defaultScale;
  AqiScaleForCountryCode_defaultScale = v0;

  v11[0] = @"CN";
  long long v2 = objc_opt_new();
  v12[0] = v2;
  v11[1] = @"DE";
  uint64_t v3 = objc_opt_new();
  v12[1] = v3;
  v11[2] = @"IN";
  uint64_t v4 = objc_opt_new();
  v12[2] = v4;
  v11[3] = @"MX";
  uint64_t v5 = objc_opt_new();
  v12[3] = v5;
  v11[4] = @"GB";
  id v6 = objc_opt_new();
  v12[4] = v6;
  v11[5] = @"ES";
  v7 = objc_opt_new();
  v12[5] = v7;
  v11[6] = @"FR";
  v8 = objc_opt_new();
  v12[6] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:7];
  uint64_t v10 = (void *)AqiScaleForCountryCode_AQIScalesForCountries;
  AqiScaleForCountryCode_AQIScalesForCountries = v9;
}

id AqiScaleFromIdentifier(void *a1)
{
  id v1 = a1;
  long long v2 = v1;
  if (AqiScaleFromIdentifier_onceToken == -1)
  {
    if (v1)
    {
LABEL_3:
      uint64_t v3 = [(id)AqiScaleFromIdentifier_AQIScalesFromIdentifiers objectForKeyedSubscript:v2];
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&AqiScaleFromIdentifier_onceToken, &__block_literal_global_29);
    if (v2) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
LABEL_6:

  return v3;
}

void __AqiScaleFromIdentifier_block_invoke()
{
  v11[8] = *MEMORY[0x263EF8340];
  v10[0] = @"HJ6332012";
  uint64_t v0 = objc_opt_new();
  v11[0] = v0;
  v10[1] = @"UBA";
  id v1 = objc_opt_new();
  v11[1] = v1;
  v10[2] = @"NAQI";
  long long v2 = objc_opt_new();
  v11[2] = v2;
  v10[3] = @"IMECA";
  uint64_t v3 = objc_opt_new();
  v11[3] = v3;
  v10[4] = @"DAQI";
  uint64_t v4 = objc_opt_new();
  v11[4] = v4;
  v10[5] = @"CAQI";
  uint64_t v5 = objc_opt_new();
  v11[5] = v5;
  v10[6] = @"ATMO";
  id v6 = objc_opt_new();
  v11[6] = v6;
  v10[7] = @"AQI";
  v7 = objc_opt_new();
  void v11[7] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:8];
  uint64_t v9 = (void *)AqiScaleFromIdentifier_AQIScalesFromIdentifiers;
  AqiScaleFromIdentifier_AQIScalesFromIdentifiers = v8;
}

id CurrentAqiScale()
{
  uint64_t v0 = [MEMORY[0x263EFF960] currentLocale];
  id v1 = [v0 countryCode];

  long long v2 = AqiScaleForCountryCode(v1);

  return v2;
}

BOOL WFWeatherStoreCacheCheckIfDateIsFreshForStaleness(void *a1, unint64_t a2)
{
  [a1 timeIntervalSinceNow];
  BOOL result = 0;
  if (a1 && a2)
  {
    double v6 = v4 / 60.0;
    return v6 >= 0.0 || -v6 < (double)a2;
  }
  return result;
}

void sub_21C98E68C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_21C98E944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_21C98F014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  objc_destroyWeak(&location);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21C98FD50(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_21C99011C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
}

void sub_21C990498(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    uint64_t v3 = WFLogForCategory(5uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[WFWeatherStoreCache _concurrentQueue_barrier_loadDomain:].cold.4();
    }

    objc_end_catch();
    JUMPOUT(0x21C9902C8);
  }
  _Unwind_Resume(exception_object);
}

void sub_21C990820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C990A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21C990C08(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t __WFTemperatureUnitObserverTrampoline(uint64_t a1, void *a2)
{
  return [a2 _updateTemperatureUnit];
}

void sub_21C9944EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_21C99AA10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_21C99ABAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke(uint64_t a1)
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
    long long v6 = xmmword_2644316C8;
    uint64_t v7 = 0;
    MobileKeyBagLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
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
  uint64_t v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
LABEL_5:
  BOOL result = dlsym(v2, "MKBDeviceUnlockedSinceBoot");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBDeviceUnlockedSinceBootSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MobileKeyBagLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileKeyBagLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_21C9A1CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C9A1E18(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_21C9A2064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  objc_destroyWeak(v22);
  _Block_object_dispose(&a22, 8);
  objc_destroyWeak((id *)(v23 - 72));
  _Unwind_Resume(a1);
}

void sub_21C9A258C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21C9A2734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

id WeatherFoundationInternalUserDefaults()
{
  if (WeatherFoundationInternalUserDefaults_onceToken != -1) {
    dispatch_once(&WeatherFoundationInternalUserDefaults_onceToken, &__block_literal_global_11);
  }
  uint64_t v0 = (void *)WeatherFoundationInternalUserDefaults_result;
  return v0;
}

void __WeatherFoundationInternalUserDefaults_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.weather.internal"];
  uint64_t v1 = (void *)WeatherFoundationInternalUserDefaults_result;
  WeatherFoundationInternalUserDefaults_uint64_t result = v0;

  if (!WeatherFoundationInternalUserDefaults_result)
  {
    WeatherFoundationInternalUserDefaults_uint64_t result = [MEMORY[0x263EFFA40] standardUserDefaults];
    MEMORY[0x270F9A758]();
  }
}

uint64_t WFTimeOfDayForString(uint64_t a1)
{
  return [@"N" isEqualToString:a1];
}

BOOL WFForecastTypeIsRequestedInTypes(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

uint64_t WFForecastTypeIsSingleType(uint64_t a1)
{
  uint64_t v2 = WFForecastTypes();
  uint64_t v3 = [v2 containsIndex:a1];

  return v3;
}

id WFForecastTypes()
{
  if (WFForecastTypes_onceToken != -1) {
    dispatch_once(&WFForecastTypes_onceToken, &__block_literal_global_13);
  }
  uint64_t v0 = (void *)WFForecastTypes_Types;
  return v0;
}

void __WFForecastTypes_block_invoke()
{
  id v3 = [MEMORY[0x263F089C8] indexSet];
  for (uint64_t i = 0; i != 12; ++i)
    [v3 addIndex:(1 << i)];
  uint64_t v1 = [v3 copy];
  uint64_t v2 = (void *)WFForecastTypes_Types;
  WFForecastTypes_Types = v1;
}

uint64_t WFForecastTypesUnknownTypes(uint64_t a1)
{
  uint64_t v5 = 0;
  long long v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = a1;
  uint64_t v1 = WFForecastTypes();
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __WFForecastTypesUnknownTypes_block_invoke;
  v4[3] = &unk_264431998;
  v4[4] = &v5;
  [v1 enumerateIndexesUsingBlock:v4];

  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_21C9A5578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __WFForecastTypesUnknownTypes_block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) &= ~a2;
  return result;
}

uint64_t WFConditionCodeFromLegacyWeatherConditionCode(unint64_t a1)
{
  if (a1 > 0x2F) {
    return 0;
  }
  else {
    return qword_21C9D8C48[a1];
  }
}

uint64_t LegacyWeatherConditionCodeFromWFConditionCode()
{
  return 0;
}

__CFString *NSStringFromWFTemperatureUnit(int a1)
{
  if ((a1 - 1) > 2) {
    return 0;
  }
  else {
    return off_2644319B8[a1 - 1];
  }
}

BOOL WFTemperatureUnitIsValid(int a1)
{
  return (a1 - 1) < 3;
}

uint64_t WFTemperatureUnitForLocale(void *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [a1 objectForKey:*MEMORY[0x263EFF560]];
  if ([v1 BOOLValue]) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }

  return v2;
}

uint64_t NSStringToWFTemperatureUnit(void *a1)
{
  id v1 = a1;
  if (NSStringToWFTemperatureUnit_onceToken != -1) {
    dispatch_once(&NSStringToWFTemperatureUnit_onceToken, &__block_literal_global_22);
  }
  uint64_t v2 = [v1 hash];
  if (v2 == NSStringToWFTemperatureUnit_fahrenheitHash)
  {
    uint64_t v3 = 1;
  }
  else if (v2 == NSStringToWFTemperatureUnit_kelvinHash)
  {
    uint64_t v3 = 3;
  }
  else
  {
    uint64_t v3 = 2 * (v2 == NSStringToWFTemperatureUnit_celsiusHash);
  }

  return v3;
}

uint64_t __NSStringToWFTemperatureUnit_block_invoke()
{
  NSStringToWFTemperatureUnit_fahrenheitHash = [@"WFTemperatureUnitFahrenheit" hash];
  NSStringToWFTemperatureUnit_kelvinHash = [@"WFTemperatureUnitKelvin" hash];
  uint64_t result = [@"WFTemperatureUnitCelsius" hash];
  NSStringToWFTemperatureUnit_celsiusHash = result;
  return result;
}

uint64_t WFChangeForecastDirectionFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"inc"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"dec"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *NSStringFromWFChangeForecastDirection(uint64_t a1)
{
  id v1 = @"none";
  if (a1 == 2) {
    id v1 = @"dec";
  }
  if (a1 == 1) {
    return @"inc";
  }
  else {
    return v1;
  }
}

void sub_21C9A8830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WFLogForCategory(unint64_t a1)
{
  if (a1 >= 0xB) {
    WFLogForCategory_cold_1();
  }
  if (WFLogForCategory_onceToken != -1) {
    dispatch_once(&WFLogForCategory_onceToken, &__block_literal_global_15);
  }
  uint64_t v2 = (void *)WFLogForCategory_logObjects[a1];
  return v2;
}

uint64_t __WFLogForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.weatherservice", "WeatherFoundation");
  id v1 = (void *)WFLogForCategory_logObjects[0];
  WFLogForCategory_logObjects[0] = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.weatherservice", "WF_Favorites");
  uint64_t v3 = (void *)qword_26AB48218;
  qword_26AB48218 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.weatherservice", "WF_Forecasts");
  uint64_t v5 = (void *)qword_26AB48220;
  qword_26AB48220 = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.weatherservice", "WF_Location");
  uint64_t v7 = (void *)qword_26AB48228;
  qword_26AB48228 = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.weatherservice", "WF_Service");
  uint64_t v9 = (void *)qword_26AB48230;
  qword_26AB48230 = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.weatherservice", "WF_ResponseCache");
  uint64_t v11 = (void *)qword_26AB48238;
  qword_26AB48238 = (uint64_t)v10;

  os_log_t v12 = os_log_create("com.apple.weatherservice", "WF_GeocodeCache");
  uint64_t v13 = (void *)qword_26AB48240;
  qword_26AB48240 = (uint64_t)v12;

  os_log_t v14 = os_log_create("com.apple.weatherservice", "WF_Parser");
  v15 = (void *)qword_26AB48248;
  qword_26AB48248 = (uint64_t)v14;

  os_log_t v16 = os_log_create("com.apple.weatherservice", "WF_Reachability");
  v17 = (void *)qword_26AB48250;
  qword_26AB48250 = (uint64_t)v16;

  os_log_t v18 = os_log_create("com.apple.weatherservice", "WF_RemoteConfig");
  v19 = (void *)qword_26AB48258;
  qword_26AB48258 = (uint64_t)v18;

  qword_26AB48260 = (uint64_t)os_log_create("com.apple.weatherservice", "WF_AppSettings");
  return MEMORY[0x270F9A758]();
}

id WFCacheKeyForForecastType(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[WFWeatherConditions calendar];
  os_log_t v8 = objc_msgSend(v7, "components:fromDate:", +[WFWeatherConditions dateComponentCalendarUnits](WFWeatherConditions, "dateComponentCalendarUnits"), v6);

  uint64_t v9 = 0;
  if (a1 > 63)
  {
    if (a1 <= 511)
    {
      if (a1 == 64)
      {
        v42 = NSString;
        uint64_t v11 = [v5 geoLocation];
        [v11 coordinate];
        os_log_t v14 = NSStringFromCLLocationCoordinate2D(v43, v44);
        [v42 stringWithFormat:@"historical_%@_%02ld%02ld%04ld", v14, objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "year"), v46];
      }
      else
      {
        if (a1 != 128) {
          goto LABEL_23;
        }
        v21 = NSString;
        uint64_t v11 = [v5 geoLocation];
        [v11 coordinate];
        os_log_t v14 = NSStringFromCLLocationCoordinate2D(v22, v23);
        [v21 stringWithFormat:@"almanac_%@_%02ld%02ld%04ld", v14, objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "year"), v46];
      }
    }
    else
    {
      switch(a1)
      {
        case 512:
          v33 = NSString;
          uint64_t v11 = [v5 geoLocation];
          [v11 coordinate];
          os_log_t v14 = NSStringFromCLLocationCoordinate2D(v34, v35);
          [v33 stringWithFormat:@"change_%@_%02ld%02ld%04ld", v14, objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "year"), v46];
          break;
        case 1024:
          v36 = NSString;
          uint64_t v11 = [v5 geoLocation];
          [v11 coordinate];
          os_log_t v14 = NSStringFromCLLocationCoordinate2D(v37, v38);
          [v36 stringWithFormat:@"severe_%@_%02ld%02ld%04ld", v14, objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "year"), v46];
          break;
        case 2048:
          v15 = NSString;
          uint64_t v11 = [v5 geoLocation];
          [v11 coordinate];
          os_log_t v14 = NSStringFromCLLocationCoordinate2D(v16, v17);
          [v15 stringWithFormat:@"next_hour_precip_%@_%02ld%02ld%04ld", v14, objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "year"), v46];
          break;
        default:
          goto LABEL_23;
      }
    }
  }
  else
  {
    switch(a1)
    {
      case 1:
        os_log_t v10 = NSString;
        uint64_t v11 = [v5 geoLocation];
        [v11 coordinate];
        os_log_t v14 = NSStringFromCLLocationCoordinate2D(v12, v13);
        [v10 stringWithFormat:@"air_quality_%@_%02ld%02ld%04ld%02ld", v14, objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "year"), objc_msgSend(v8, "hour")];
        break;
      case 2:
        v24 = NSString;
        uint64_t v11 = [v5 geoLocation];
        [v11 coordinate];
        os_log_t v14 = NSStringFromCLLocationCoordinate2D(v25, v26);
        [v24 stringWithFormat:@"current_%@_%02ld%02ld%04ld%02ld", v14, objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "year"), objc_msgSend(v8, "hour")];
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_23;
      case 4:
        uint64_t v27 = NSString;
        uint64_t v11 = [v5 geoLocation];
        [v11 coordinate];
        os_log_t v14 = NSStringFromCLLocationCoordinate2D(v28, v29);
        [v27 stringWithFormat:@"hourly_1d_%@_%02ld%02ld%04ld%02ld", v14, objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "year"), objc_msgSend(v8, "hour")];
        break;
      case 8:
        v30 = NSString;
        uint64_t v11 = [v5 geoLocation];
        [v11 coordinate];
        os_log_t v14 = NSStringFromCLLocationCoordinate2D(v31, v32);
        [v30 stringWithFormat:@"daily_10d_%@_%02ld%02ld%04ld", v14, objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "year"), v46];
        break;
      default:
        if (a1 == 16)
        {
          v39 = NSString;
          uint64_t v11 = [v5 geoLocation];
          [v11 coordinate];
          os_log_t v14 = NSStringFromCLLocationCoordinate2D(v40, v41);
          [v39 stringWithFormat:@"daily_pollen_10d_%@_%02ld%02ld%04ld", v14, objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "year"), v46];
        }
        else
        {
          if (a1 != 32) {
            goto LABEL_23;
          }
          os_log_t v18 = NSString;
          uint64_t v11 = [v5 geoLocation];
          [v11 coordinate];
          os_log_t v14 = NSStringFromCLLocationCoordinate2D(v19, v20);
          [v18 stringWithFormat:@"historical_last24h_%@_%02ld%02ld%04ld", v14, objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "year"), v46];
        }
        break;
    }
  uint64_t v9 = };

LABEL_23:
  return v9;
}

uint64_t WFForecastTypeForDate(void *a1)
{
  id v1 = (void *)MEMORY[0x263EFF8F0];
  id v2 = a1;
  uint64_t v3 = [v1 currentCalendar];
  os_log_t v4 = [v3 components:60 fromDate:v2];
  id v5 = objc_msgSend(MEMORY[0x263EFF918], "wf_nowDateComponents");
  id v6 = [v3 dateFromComponents:v5];
  uint64_t v7 = [v3 components:16 fromDate:v6 toDate:v2 options:0];

  unint64_t v8 = [v7 day];
  if ((v8 & 0x8000000000000000) != 0)
  {
    uint64_t v9 = 64;
  }
  else if (v8)
  {
    if (v8 >= 0xA) {
      uint64_t v9 = 128;
    }
    else {
      uint64_t v9 = 8;
    }
  }
  else
  {
    uint64_t v10 = [v4 hour];
    if (v10 == [v5 hour])
    {
      uint64_t v9 = 258;
    }
    else
    {
      uint64_t v11 = [v4 hour];
      uint64_t v9 = 4 * (v11 > [v5 hour]);
    }
  }

  return v9;
}

uint64_t WFCacheDetailsForForecastType(uint64_t result, uint64_t *a2, uint64_t *a3)
{
  if (result <= 15)
  {
    switch(result)
    {
      case 1:
        if (a2) {
          *a2 = 60;
        }
        if (!a3) {
          return result;
        }
        os_log_t v4 = WFWeatherStoreAirQualityCacheDomain;
        break;
      case 2:
        if (!a2) {
          goto LABEL_25;
        }
        id v6 = &WFDefaultAllowedCurrentForecastStaleness;
        goto LABEL_24;
      case 4:
        if (!a2) {
          goto LABEL_25;
        }
        id v6 = &WFDefaultAllowedHourlyForecastStaleness;
        goto LABEL_24;
      case 8:
        goto LABEL_18;
      default:
        return result;
    }
    goto LABEL_32;
  }
  if (result > 63)
  {
    if (result == 64)
    {
      if (!a2)
      {
LABEL_30:
        if (!a3) {
          return result;
        }
        os_log_t v4 = WFWeatherStoreHistoricalCacheDomain;
        goto LABEL_32;
      }
      id v5 = &WFDefaultAllowedHistoricalStaleness;
LABEL_29:
      *a2 = *v5;
      goto LABEL_30;
    }
    if (result == 128)
    {
      if (a2) {
        *a2 = 2628000;
      }
      if (a3)
      {
        os_log_t v4 = WFWeatherStoreAlmanacCacheDomain;
LABEL_32:
        uint64_t result = *v4;
        *a3 = result;
      }
    }
  }
  else
  {
    if (result != 16)
    {
      if (result != 32) {
        return result;
      }
      if (!a2) {
        goto LABEL_30;
      }
      id v5 = &WFDefaultAllowedHourlyForecastStaleness;
      goto LABEL_29;
    }
LABEL_18:
    if (a2)
    {
      id v6 = &WFDefaultAllowedDailyForecastStaleness;
LABEL_24:
      *a2 = *v6;
    }
LABEL_25:
    if (a3)
    {
      os_log_t v4 = WFWeatherStoreForecastCacheDomain;
      goto LABEL_32;
    }
  }
  return result;
}

void sub_21C9AE104(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_21C9AFAD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose((const void *)(v57 - 256), 8);
  _Block_object_dispose((const void *)(v57 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_21C9B092C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_21C9B17F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C9B21B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C9B5318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 168), 8);
  _Block_object_dispose((const void *)(v30 - 136), 8);
  _Unwind_Resume(a1);
}

id NSStringFromCLLocationCoordinate2D(double a1, double a2)
{
  if (CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&a1))
  {
    os_log_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%.02f,%.02f", *(void *)&a1, *(void *)&a2);
  }
  else
  {
    os_log_t v4 = 0;
  }
  return v4;
}

double CLLocationCoordinate2DFromString(void *a1)
{
  double v1 = *MEMORY[0x263F00B58];
  if (a1)
  {
    id v2 = [a1 componentsSeparatedByString:@","];
    if ([v2 count] == 2)
    {
      uint64_t v3 = [v2 objectAtIndexedSubscript:0];
      [v3 doubleValue];
      float v5 = v4;

      id v6 = [v2 objectAtIndexedSubscript:1];
      [v6 doubleValue];

      double v1 = v5;
    }
  }
  return v1;
}

void sub_21C9BFC94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21C9C089C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C9C0B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIImageClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __UIKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_264432330;
    uint64_t v6 = 0;
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!UIKitLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("UIImage");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getUIImageClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getUIImageClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __UIKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UIKitLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t WFNetworkEventTypeFromAPIVersion(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"wds_v1"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"twc_v2"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"twc_v3"])
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = 2;
  }

  return v2;
}

id CLPlacemarkClosestToReferenceLocation(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  if ([v4 count] == 1)
  {
    long long v5 = [v4 firstObject];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      long long v5 = 0;
      uint64_t v9 = *(void *)v19;
      float v10 = -1.0;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          double v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          double v13 = objc_msgSend(v12, "location", (void)v18);
          [v3 distanceFromLocation:v13];
          float v15 = v14;

          if (v10 < 0.0 || v10 > v15)
          {
            id v16 = v12;

            long long v5 = v16;
            float v10 = v15;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }
    else
    {
      long long v5 = 0;
    }
  }
  return v5;
}

id WFLocationNameForPlacemark(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 locality];
  uint64_t v3 = [v2 length];

  if (v3)
  {
    uint64_t v4 = [v1 locality];
LABEL_5:
    uint64_t v7 = (void *)v4;
    goto LABEL_6;
  }
  long long v5 = [v1 name];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    uint64_t v4 = [v1 name];
    goto LABEL_5;
  }
  uint64_t v7 = 0;
LABEL_6:
  uint64_t v8 = (void *)[v7 copy];

  return v8;
}

void sub_21C9C42FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_21C9C45F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
}

id WFAggregateCommonRequestSupportedForecastTypes()
{
  if (WFAggregateCommonRequestSupportedForecastTypes_onceToken != -1) {
    dispatch_once(&WFAggregateCommonRequestSupportedForecastTypes_onceToken, &__block_literal_global_27);
  }
  os_log_t v0 = (void *)WFAggregateCommonRequestSupportedForecastTypes_AggregateCommonRequestSupportedTypes;
  return v0;
}

void __WFAggregateCommonRequestSupportedForecastTypes_block_invoke()
{
  os_log_t v0 = WFForecastTypes();
  id v3 = (id)[v0 mutableCopy];

  [v3 removeIndex:64];
  [v3 removeIndex:128];
  uint64_t v1 = [v3 copy];
  uint64_t v2 = (void *)WFAggregateCommonRequestSupportedForecastTypes_AggregateCommonRequestSupportedTypes;
  WFAggregateCommonRequestSupportedForecastTypes_AggregateCommonRequestSupportedTypes = v1;
}

void sub_21C9C8488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21C9C98E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_21C9CA594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getUIApplicationClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getUIApplicationClass_softClass;
  uint64_t v7 = getUIApplicationClass_softClass;
  if (!getUIApplicationClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getUIApplicationClass_block_invoke;
    v3[3] = &unk_2644316A8;
    v3[4] = &v4;
    __getUIApplicationClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21C9CAA24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIImageClass_block_invoke_0(uint64_t a1)
{
  UIKitLibrary();
  Class result = objc_getClass("UIImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUIImageClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getUIImageClass_block_invoke_cold_1();
    return (Class)__UIKitLibraryCore_block_invoke_0();
  }
  return result;
}

uint64_t __UIKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  UIKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

id NSLocaleTemperatureUnitFromWFTemperatureUnit(int a1)
{
  if (a1 == 1)
  {
    uint64_t v2 = (id *)MEMORY[0x263EFF558];
LABEL_5:
    id v3 = *v2;
    return v3;
  }
  if (a1 == 2)
  {
    uint64_t v2 = (id *)MEMORY[0x263EFF550];
    goto LABEL_5;
  }
  id v3 = 0;
  return v3;
}

uint64_t NSLocaleTemperatureUnitToWFTemperatureUnit(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x263EFF558]])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:*MEMORY[0x263EFF550]])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_21C9CB6C8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_21C9CB82C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v16 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21C9CB96C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_21C9CBAB8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

uint64_t UAMeasureUnitFromWFTemperatureUnit(int a1)
{
  if (a1 == 1) {
    unsigned int v1 = 2561;
  }
  else {
    unsigned int v1 = 2560;
  }
  if (a1 == 3) {
    return 2562;
  }
  else {
    return v1;
  }
}

double WFConvertTemperature(int a1, int a2, double result)
{
  if (a1 != a2)
  {
    if (a1 == 1)
    {
      uint64_t result = (result + -32.0) * 0.555555582;
    }
    else if (a1 != 2)
    {
      if (a1 != 3) {
        return NAN;
      }
      uint64_t result = result + -273.149994;
    }
    if (a2 == 3) {
      return result + 273.149994;
    }
    if (a2 != 2)
    {
      if (a2 == 1) {
        return result * 1.79999995 + 32.0;
      }
      return NAN;
    }
  }
  return result;
}

void sub_21C9CCB84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_21C9CDBD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 224), 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Unwind_Resume(a1);
}

void WFLogForCategory_cold_1()
{
}

uint64_t __getUIImageClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[NSDictionary(SafeCastParseDictionary) floatValueFromDictionary:forKey:defaultValue:](v0);
}

uint64_t __getUIApplicationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[WFServiceConnection cancelRequestWithIdentifier:](v0);
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
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

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x270EE7460]((__n128)coord, *(__n128 *)&coord.longitude);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x270EE55F0]();
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

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x270EDAAD0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

char *__cdecl u_strToUTF8(char *dest, int32_t destCapacity, int32_t *pDestLength, const UChar *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return (char *)MEMORY[0x270F995A0](dest, *(void *)&destCapacity, pDestLength, src, *(void *)&srcLength, pErrorCode);
}

uint64_t uameasfmt_close()
{
  return MEMORY[0x270F995F0]();
}

uint64_t uameasfmt_format()
{
  return MEMORY[0x270F995F8]();
}

uint64_t uameasfmt_open()
{
  return MEMORY[0x270F99600]();
}

uint64_t unum_open()
{
  return MEMORY[0x270F997F0]();
}

uint64_t unum_setAttribute()
{
  return MEMORY[0x270F99810]();
}