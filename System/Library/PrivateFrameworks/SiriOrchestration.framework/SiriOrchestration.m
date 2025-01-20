void sub_25D833C9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL _AFConnectionIsErrorDeallocation(void *a1)
{
  id v1 = a1;
  v2 = [v1 domain];
  if ([v2 isEqualToString:*MEMORY[0x263F28730]]) {
    BOOL v3 = [v1 code] == 24;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

void sub_25D837040(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_25D8376D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25D838DE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _EmitHomePodLaunchContextTime(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (WL_AFIsHorseman())
  {
    if (v9)
    {
      if (v10)
      {
        uint64_t v11 = [v10 activationEventMachAbsoluteTime];
        uint64_t v12 = mach_absolute_time();
        v13 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
        {
          int v18 = 136316162;
          v19 = "_EmitHomePodLaunchContextTime";
          __int16 v20 = 2112;
          id v21 = v8;
          __int16 v22 = 2112;
          id v23 = v9;
          __int16 v24 = 2048;
          uint64_t v25 = v11;
          __int16 v26 = 2048;
          uint64_t v27 = v12;
          _os_log_impl(&dword_25D830000, v13, OS_LOG_TYPE_INFO, "%s Logging instrumentation for requestUUID = %@ turnId = %@ HomePod launch: (startTime = %llu endTime = %llu)", (uint8_t *)&v18, 0x34u);
        }
        id v14 = objc_alloc_init(MEMORY[0x263F6EE48]);
        id v15 = objc_alloc_init(MEMORY[0x263F6EE58]);
        [v15 setExists:1];
        [v14 setStartedOrChanged:v15];
        [v14 setHasStartedOrChanged:1];
        [v7 logInstrumentation:v14 machAbsoluteTime:v11 turnIdentifier:v9];
        id v16 = objc_alloc_init(MEMORY[0x263F6EE48]);
        id v17 = objc_alloc_init(MEMORY[0x263F6EE50]);
        [v17 setExists:1];
        [v16 setEnded:v17];
        [v16 setHasEnded:1];
        [v7 logInstrumentation:v16 machAbsoluteTime:v12 turnIdentifier:v9];
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
      {
        _EmitHomePodLaunchContextTime_cold_2();
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      _EmitHomePodLaunchContextTime_cold_1();
    }
  }
}

void _LogUEIRequestCategorization(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    v5 = (objc_class *)MEMORY[0x263F6EE60];
    id v6 = a1;
    id v8 = objc_alloc_init(v5);
    [v8 setRequestStatus:a2];
    [v8 setRequestType:a3];
    id v7 = [MEMORY[0x263F283F8] sharedAnalytics];
    [v7 logInstrumentation:v8 machAbsoluteTime:mach_absolute_time() turnIdentifier:v6];
  }
}

__CFString *_AFConnectionGetBucketStringFromTimeIntervals(double a1, double a2)
{
  if (a1 <= 0.0)
  {
    if (a2 <= 0.0) {
      return @"no_start_and_stop";
    }
    else {
      return @"no_start";
    }
  }
  else if (a2 <= 0.0)
  {
    return @"no_stop";
  }
  else
  {
    double v2 = a2 - a1;
    if (v2 >= 0.0)
    {
      if (v2 >= 0.1)
      {
        if (v2 >= 0.2)
        {
          if (v2 >= 0.3)
          {
            if (v2 >= 0.4)
            {
              if (v2 >= 0.5)
              {
                if (v2 >= 1.0)
                {
                  if (v2 >= 2.0)
                  {
                    if (v2 >= 4.0)
                    {
                      v4 = @"8-15s";
                      v5 = @"15-30s";
                      id v6 = @"60s+";
                      if (v2 < 60.0) {
                        id v6 = @"30-60s";
                      }
                      if (v2 >= 30.0) {
                        v5 = v6;
                      }
                      if (v2 >= 15.0) {
                        v4 = v5;
                      }
                      if (v2 >= 8.0) {
                        return v4;
                      }
                      else {
                        return @"4-8s";
                      }
                    }
                    else
                    {
                      return @"2-4s";
                    }
                  }
                  else
                  {
                    return @"1-2s";
                  }
                }
                else
                {
                  return @"500ms-1s";
                }
              }
              else
              {
                return @"400-500ms";
              }
            }
            else
            {
              return @"300-400ms";
            }
          }
          else
          {
            return @"200-300ms";
          }
        }
        else
        {
          return @"100-200ms";
        }
      }
      else
      {
        return @"0-100ms";
      }
    }
    else
    {
      return @"stop_before_start";
    }
  }
}

id _ConvertIdToSchemaUUID(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263F08C38];
  id v2 = a1;
  uint64_t v3 = (void *)[[v1 alloc] initWithUUIDString:v2];

  if (v3) {
    v4 = (void *)[objc_alloc(MEMORY[0x263F6EEE0]) initWithNSUUID:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

id _ExtractAceViewId(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v1 = a1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = [v1 allKeys];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v8 = [v1 objectForKey:v7];
        if ([v7 isEqualToString:@"aceId"])
        {
          uint64_t v9 = [NSString stringWithFormat:@"%@", v8];
LABEL_13:
          id v10 = (void *)v9;

          goto LABEL_14;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v9 = _ExtractAceViewId(v8);
          if (v9) {
            goto LABEL_13;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_14:

  return v10;
}

id _PNRFatalErrorInfo(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263F6ED98];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v2, "code"));
  uint64_t v5 = [v4 stringValue];
  [v3 setErrorCode:v5];

  id v6 = [v2 domain];

  [v3 setErrorDomain:v6];
  return v3;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_9(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t AssistantServicesLibraryCore()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  id v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = AssistantServicesLibraryCore_frameworkLibrary;
  uint64_t v5 = AssistantServicesLibraryCore_frameworkLibrary;
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_26550ECD0;
    long long v7 = *(_OWORD *)&off_26550ECE0;
    v3[3] = _sl_dlopen();
    AssistantServicesLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_25D846794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __AssistantServicesLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  AssistantServicesLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AssistantServicesLibrary()
{
  uint64_t v0 = AssistantServicesLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getAFAnalyticsClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAFAnalyticsClass_softClass;
  uint64_t v7 = getAFAnalyticsClass_softClass;
  if (!getAFAnalyticsClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAFAnalyticsClass_block_invoke;
    v3[3] = &unk_26550ED20;
    v3[4] = &v4;
    __getAFAnalyticsClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_25D846964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFAnalyticsClass_block_invoke(uint64_t a1)
{
  AssistantServicesLibrary();
  Class result = objc_getClass("AFAnalytics");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAFAnalyticsClass_block_invoke_cold_1();
  }
  getAFAnalyticsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getAFAudioPowerUpdaterClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAFAudioPowerUpdaterClass_softClass;
  uint64_t v7 = getAFAudioPowerUpdaterClass_softClass;
  if (!getAFAudioPowerUpdaterClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAFAudioPowerUpdaterClass_block_invoke;
    v3[3] = &unk_26550ED20;
    v3[4] = &v4;
    __getAFAudioPowerUpdaterClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_25D846AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFAudioPowerUpdaterClass_block_invoke(uint64_t a1)
{
  AssistantServicesLibrary();
  Class result = objc_getClass("AFAudioPowerUpdater");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAFAudioPowerUpdaterClass_block_invoke_cold_1();
  }
  getAFAudioPowerUpdaterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getAFAudioPowerXPCProviderClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAFAudioPowerXPCProviderClass_softClass;
  uint64_t v7 = getAFAudioPowerXPCProviderClass_softClass;
  if (!getAFAudioPowerXPCProviderClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAFAudioPowerXPCProviderClass_block_invoke;
    v3[3] = &unk_26550ED20;
    v3[4] = &v4;
    __getAFAudioPowerXPCProviderClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_25D846BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFAudioPowerXPCProviderClass_block_invoke(uint64_t a1)
{
  AssistantServicesLibrary();
  Class result = objc_getClass("AFAudioPowerXPCProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAFAudioPowerXPCProviderClass_block_invoke_cold_1();
  }
  getAFAudioPowerXPCProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getAFClientConfigurationClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAFClientConfigurationClass_softClass;
  uint64_t v7 = getAFClientConfigurationClass_softClass;
  if (!getAFClientConfigurationClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAFClientConfigurationClass_block_invoke;
    v3[3] = &unk_26550ED20;
    v3[4] = &v4;
    __getAFClientConfigurationClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_25D846D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFClientConfigurationClass_block_invoke(uint64_t a1)
{
  AssistantServicesLibrary();
  Class result = objc_getClass("AFClientConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAFClientConfigurationClass_block_invoke_cold_1();
  }
  getAFClientConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getAFFeatureFlagsClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAFFeatureFlagsClass_softClass;
  uint64_t v7 = getAFFeatureFlagsClass_softClass;
  if (!getAFFeatureFlagsClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAFFeatureFlagsClass_block_invoke;
    v3[3] = &unk_26550ED20;
    v3[4] = &v4;
    __getAFFeatureFlagsClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_25D846E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFFeatureFlagsClass_block_invoke(uint64_t a1)
{
  AssistantServicesLibrary();
  Class result = objc_getClass("AFFeatureFlags");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAFFeatureFlagsClass_block_invoke_cold_1();
  }
  getAFFeatureFlagsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getAFInstanceContextClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAFInstanceContextClass_softClass;
  uint64_t v7 = getAFInstanceContextClass_softClass;
  if (!getAFInstanceContextClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAFInstanceContextClass_block_invoke;
    v3[3] = &unk_26550ED20;
    v3[4] = &v4;
    __getAFInstanceContextClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_25D846F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFInstanceContextClass_block_invoke(uint64_t a1)
{
  AssistantServicesLibrary();
  Class result = objc_getClass("AFInstanceContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAFInstanceContextClass_block_invoke_cold_1();
  }
  getAFInstanceContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getAFInterstitialProviderClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAFInterstitialProviderClass_softClass;
  uint64_t v7 = getAFInterstitialProviderClass_softClass;
  if (!getAFInterstitialProviderClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAFInterstitialProviderClass_block_invoke;
    v3[3] = &unk_26550ED20;
    v3[4] = &v4;
    __getAFInterstitialProviderClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_25D8470CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFInterstitialProviderClass_block_invoke(uint64_t a1)
{
  AssistantServicesLibrary();
  Class result = objc_getClass("AFInterstitialProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAFInterstitialProviderClass_block_invoke_cold_1();
  }
  getAFInterstitialProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getAFOneArgumentSafetyBlockClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAFOneArgumentSafetyBlockClass_softClass;
  uint64_t v7 = getAFOneArgumentSafetyBlockClass_softClass;
  if (!getAFOneArgumentSafetyBlockClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAFOneArgumentSafetyBlockClass_block_invoke;
    v3[3] = &unk_26550ED20;
    v3[4] = &v4;
    __getAFOneArgumentSafetyBlockClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_25D847208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFOneArgumentSafetyBlockClass_block_invoke(uint64_t a1)
{
  AssistantServicesLibrary();
  Class result = objc_getClass("AFOneArgumentSafetyBlock");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAFOneArgumentSafetyBlockClass_block_invoke_cold_1();
  }
  getAFOneArgumentSafetyBlockClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getAFPreferencesClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAFPreferencesClass_softClass;
  uint64_t v7 = getAFPreferencesClass_softClass;
  if (!getAFPreferencesClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAFPreferencesClass_block_invoke;
    v3[3] = &unk_26550ED20;
    v3[4] = &v4;
    __getAFPreferencesClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_25D847344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFPreferencesClass_block_invoke(uint64_t a1)
{
  AssistantServicesLibrary();
  Class result = objc_getClass("AFPreferences");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAFPreferencesClass_block_invoke_cold_1();
  }
  getAFPreferencesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getAFQueueClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAFQueueClass_softClass;
  uint64_t v7 = getAFQueueClass_softClass;
  if (!getAFQueueClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAFQueueClass_block_invoke;
    v3[3] = &unk_26550ED20;
    v3[4] = &v4;
    __getAFQueueClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_25D847480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFQueueClass_block_invoke(uint64_t a1)
{
  AssistantServicesLibrary();
  Class result = objc_getClass("AFQueue");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAFQueueClass_block_invoke_cold_1();
  }
  getAFQueueClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getAFSafetyBlockClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAFSafetyBlockClass_softClass;
  uint64_t v7 = getAFSafetyBlockClass_softClass;
  if (!getAFSafetyBlockClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAFSafetyBlockClass_block_invoke;
    v3[3] = &unk_26550ED20;
    v3[4] = &v4;
    __getAFSafetyBlockClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_25D8475BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFSafetyBlockClass_block_invoke(uint64_t a1)
{
  AssistantServicesLibrary();
  Class result = objc_getClass("AFSafetyBlock");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAFSafetyBlockClass_block_invoke_cold_1();
  }
  getAFSafetyBlockClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getAFRequestInfoClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAFRequestInfoClass_softClass;
  uint64_t v7 = getAFRequestInfoClass_softClass;
  if (!getAFRequestInfoClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAFRequestInfoClass_block_invoke;
    v3[3] = &unk_26550ED20;
    v3[4] = &v4;
    __getAFRequestInfoClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_25D8476F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFRequestInfoClass_block_invoke(uint64_t a1)
{
  AssistantServicesLibrary();
  Class result = objc_getClass("AFRequestInfo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAFRequestInfoClass_block_invoke_cold_1();
  }
  getAFRequestInfoClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getAFAssistantCapableSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getAFAssistantCapableSymbolLoc_ptr;
  uint64_t v6 = getAFAssistantCapableSymbolLoc_ptr;
  if (!getAFAssistantCapableSymbolLoc_ptr)
  {
    id v1 = (void *)AssistantServicesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "AFAssistantCapable");
    getAFAssistantCapableSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_25D847840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAFAssistantCapableSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AssistantServicesLibrary();
  Class result = dlsym(v2, "AFAssistantCapable");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFAssistantCapableSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t WL_AFAssistantCapable()
{
  AFAssistantCapableSymbolLoc = (uint64_t (*)(void))getAFAssistantCapableSymbolLoc();
  if (!AFAssistantCapableSymbolLoc) {
    WL_AFAssistantCapable_cold_1();
  }
  return AFAssistantCapableSymbolLoc();
}

uint64_t getAFDeviceSupportsSAESymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getAFDeviceSupportsSAESymbolLoc_ptr;
  uint64_t v6 = getAFDeviceSupportsSAESymbolLoc_ptr;
  if (!getAFDeviceSupportsSAESymbolLoc_ptr)
  {
    id v1 = (void *)AssistantServicesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "AFDeviceSupportsSAE");
    getAFDeviceSupportsSAESymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_25D8479B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAFDeviceSupportsSAESymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AssistantServicesLibrary();
  Class result = dlsym(v2, "AFDeviceSupportsSAE");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFDeviceSupportsSAESymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t WL_AFDeviceSupportsSAE()
{
  AFDeviceSupportsSAESymbolLoc = (uint64_t (*)(void))getAFDeviceSupportsSAESymbolLoc();
  if (!AFDeviceSupportsSAESymbolLoc) {
    WL_AFAssistantCapable_cold_1();
  }
  return AFDeviceSupportsSAESymbolLoc();
}

uint64_t getAFDeviceSupportsSiriUODSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getAFDeviceSupportsSiriUODSymbolLoc_ptr;
  uint64_t v6 = getAFDeviceSupportsSiriUODSymbolLoc_ptr;
  if (!getAFDeviceSupportsSiriUODSymbolLoc_ptr)
  {
    id v1 = (void *)AssistantServicesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "AFDeviceSupportsSiriUOD");
    getAFDeviceSupportsSiriUODSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_25D847B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAFDeviceSupportsSiriUODSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AssistantServicesLibrary();
  Class result = dlsym(v2, "AFDeviceSupportsSiriUOD");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFDeviceSupportsSiriUODSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t WL_AFDeviceSupportsSiriUOD()
{
  AFDeviceSupportsSiriUODSymbolLoc = (uint64_t (*)(void))getAFDeviceSupportsSiriUODSymbolLoc();
  if (!AFDeviceSupportsSiriUODSymbolLoc) {
    WL_AFAssistantCapable_cold_1();
  }
  return AFDeviceSupportsSiriUODSymbolLoc();
}

uint64_t getAFIsATVSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getAFIsATVSymbolLoc_ptr;
  uint64_t v6 = getAFIsATVSymbolLoc_ptr;
  if (!getAFIsATVSymbolLoc_ptr)
  {
    id v1 = (void *)AssistantServicesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "AFIsATV");
    getAFIsATVSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_25D847C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAFIsATVSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AssistantServicesLibrary();
  Class result = dlsym(v2, "AFIsATV");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFIsATVSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t WL_AFIsATV()
{
  AFIsATVSymbolLoc = (uint64_t (*)(void))getAFIsATVSymbolLoc();
  if (!AFIsATVSymbolLoc) {
    WL_AFAssistantCapable_cold_1();
  }
  return AFIsATVSymbolLoc();
}

uint64_t getAFIsHorsemanSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getAFIsHorsemanSymbolLoc_ptr;
  uint64_t v6 = getAFIsHorsemanSymbolLoc_ptr;
  if (!getAFIsHorsemanSymbolLoc_ptr)
  {
    id v1 = (void *)AssistantServicesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "AFIsHorseman");
    getAFIsHorsemanSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_25D847E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAFIsHorsemanSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AssistantServicesLibrary();
  Class result = dlsym(v2, "AFIsHorseman");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFIsHorsemanSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t WL_AFIsHorseman()
{
  AFIsHorsemanSymbolLoc = (uint64_t (*)(void))getAFIsHorsemanSymbolLoc();
  if (!AFIsHorsemanSymbolLoc) {
    WL_AFAssistantCapable_cold_1();
  }
  return AFIsHorsemanSymbolLoc();
}

uint64_t getAFIsInternalInstallSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getAFIsInternalInstallSymbolLoc_ptr;
  uint64_t v6 = getAFIsInternalInstallSymbolLoc_ptr;
  if (!getAFIsInternalInstallSymbolLoc_ptr)
  {
    id v1 = (void *)AssistantServicesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "AFIsInternalInstall");
    getAFIsInternalInstallSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_25D847F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAFIsInternalInstallSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AssistantServicesLibrary();
  Class result = dlsym(v2, "AFIsInternalInstall");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFIsInternalInstallSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t WL_AFIsInternalInstall()
{
  AFIsInternalInstallSymbolLoc = (uint64_t (*)(void))getAFIsInternalInstallSymbolLoc();
  if (!AFIsInternalInstallSymbolLoc) {
    WL_AFAssistantCapable_cold_1();
  }
  return AFIsInternalInstallSymbolLoc();
}

uint64_t getAFIsMacSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getAFIsMacSymbolLoc_ptr;
  uint64_t v6 = getAFIsMacSymbolLoc_ptr;
  if (!getAFIsMacSymbolLoc_ptr)
  {
    id v1 = (void *)AssistantServicesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "AFIsMac");
    getAFIsMacSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_25D8480E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAFIsMacSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AssistantServicesLibrary();
  Class result = dlsym(v2, "AFIsMac");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFIsMacSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t WL_AFIsMac()
{
  AFIsMacSymbolLoc = (uint64_t (*)(void))getAFIsMacSymbolLoc();
  if (!AFIsMacSymbolLoc) {
    WL_AFAssistantCapable_cold_1();
  }
  return AFIsMacSymbolLoc();
}

uint64_t getAFIsNanoSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getAFIsNanoSymbolLoc_ptr;
  uint64_t v6 = getAFIsNanoSymbolLoc_ptr;
  if (!getAFIsNanoSymbolLoc_ptr)
  {
    id v1 = (void *)AssistantServicesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "AFIsNano");
    getAFIsNanoSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_25D848250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAFIsNanoSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AssistantServicesLibrary();
  Class result = dlsym(v2, "AFIsNano");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFIsNanoSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t WL_AFIsNano()
{
  AFIsNanoSymbolLoc = (uint64_t (*)(void))getAFIsNanoSymbolLoc();
  if (!AFIsNanoSymbolLoc) {
    WL_AFAssistantCapable_cold_1();
  }
  return AFIsNanoSymbolLoc();
}

uint64_t getAFIsPadSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getAFIsPadSymbolLoc_ptr;
  uint64_t v6 = getAFIsPadSymbolLoc_ptr;
  if (!getAFIsPadSymbolLoc_ptr)
  {
    id v1 = (void *)AssistantServicesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "AFIsPad");
    getAFIsPadSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_25D8483C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAFIsPadSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AssistantServicesLibrary();
  Class result = dlsym(v2, "AFIsPad");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFIsPadSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t WL_AFIsPad()
{
  AFIsPadSymbolLoc = (uint64_t (*)(void))getAFIsPadSymbolLoc();
  if (!AFIsPadSymbolLoc) {
    WL_AFAssistantCapable_cold_1();
  }
  return AFIsPadSymbolLoc();
}

uint64_t getAFIsSyncNeededSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getAFIsSyncNeededSymbolLoc_ptr;
  uint64_t v6 = getAFIsSyncNeededSymbolLoc_ptr;
  if (!getAFIsSyncNeededSymbolLoc_ptr)
  {
    id v1 = (void *)AssistantServicesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "AFIsSyncNeeded");
    getAFIsSyncNeededSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_25D848530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAFIsSyncNeededSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AssistantServicesLibrary();
  Class result = dlsym(v2, "AFIsSyncNeeded");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFIsSyncNeededSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t WL_AFIsSyncNeeded()
{
  AFIsSyncNeededSymbolLoc = (uint64_t (*)(void))getAFIsSyncNeededSymbolLoc();
  if (!AFIsSyncNeededSymbolLoc) {
    WL_AFAssistantCapable_cold_1();
  }
  return AFIsSyncNeededSymbolLoc();
}

uint64_t getAFIsVisionSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getAFIsVisionSymbolLoc_ptr;
  uint64_t v6 = getAFIsVisionSymbolLoc_ptr;
  if (!getAFIsVisionSymbolLoc_ptr)
  {
    id v1 = (void *)AssistantServicesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "AFIsVision");
    getAFIsVisionSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_25D8486A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAFIsVisionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AssistantServicesLibrary();
  Class result = dlsym(v2, "AFIsVision");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFIsVisionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t WL_AFIsVision()
{
  AFIsVisionSymbolLoc = (uint64_t (*)(void))getAFIsVisionSymbolLoc();
  if (!AFIsVisionSymbolLoc) {
    WL_AFAssistantCapable_cold_1();
  }
  return AFIsVisionSymbolLoc();
}

uint64_t getAFLogInitIfNeededSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getAFLogInitIfNeededSymbolLoc_ptr;
  uint64_t v6 = getAFLogInitIfNeededSymbolLoc_ptr;
  if (!getAFLogInitIfNeededSymbolLoc_ptr)
  {
    id v1 = (void *)AssistantServicesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "AFLogInitIfNeeded");
    getAFLogInitIfNeededSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_25D848810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAFLogInitIfNeededSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AssistantServicesLibrary();
  Class result = dlsym(v2, "AFLogInitIfNeeded");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFLogInitIfNeededSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t WL_AFLogInitIfNeeded()
{
  AFLogInitIfNeededSymbolLoc = (uint64_t (*)(void))getAFLogInitIfNeededSymbolLoc();
  if (!AFLogInitIfNeededSymbolLoc) {
    WL_AFAssistantCapable_cold_1();
  }
  return AFLogInitIfNeededSymbolLoc();
}

uint64_t getAFPreferencesTypeToSiriEnabledSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getAFPreferencesTypeToSiriEnabledSymbolLoc_ptr;
  uint64_t v6 = getAFPreferencesTypeToSiriEnabledSymbolLoc_ptr;
  if (!getAFPreferencesTypeToSiriEnabledSymbolLoc_ptr)
  {
    id v1 = (void *)AssistantServicesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "AFPreferencesTypeToSiriEnabled");
    getAFPreferencesTypeToSiriEnabledSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_25D848980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAFPreferencesTypeToSiriEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AssistantServicesLibrary();
  Class result = dlsym(v2, "AFPreferencesTypeToSiriEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFPreferencesTypeToSiriEnabledSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t WL_AFPreferencesTypeToSiriEnabled()
{
  AFPreferencesTypeToSiriEnabledSymbolLoc = (uint64_t (*)(void))getAFPreferencesTypeToSiriEnabledSymbolLoc();
  if (!AFPreferencesTypeToSiriEnabledSymbolLoc) {
    WL_AFAssistantCapable_cold_1();
  }
  return AFPreferencesTypeToSiriEnabledSymbolLoc();
}

uint64_t getAFProductAndBuildVersionSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getAFProductAndBuildVersionSymbolLoc_ptr;
  uint64_t v6 = getAFProductAndBuildVersionSymbolLoc_ptr;
  if (!getAFProductAndBuildVersionSymbolLoc_ptr)
  {
    id v1 = (void *)AssistantServicesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "AFProductAndBuildVersion");
    getAFProductAndBuildVersionSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_25D848AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAFProductAndBuildVersionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AssistantServicesLibrary();
  Class result = dlsym(v2, "AFProductAndBuildVersion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFProductAndBuildVersionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t WL_AFProductAndBuildVersion()
{
  AFProductAndBuildVersionSymbolLoc = (uint64_t (*)(void))getAFProductAndBuildVersionSymbolLoc();
  if (!AFProductAndBuildVersionSymbolLoc) {
    WL_AFAssistantCapable_cold_1();
  }
  return AFProductAndBuildVersionSymbolLoc();
}

void _EmitHomePodLaunchContextTime_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_25D830000, v0, v1, "%s turnId is nil. Instrumentation logging is skipped. requestUUID = %@", v2, v3, v4, v5, 2u);
}

void _EmitHomePodLaunchContextTime_cold_2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_25D830000, v0, v1, "%s speechRequestOptions is nil. Instrumentation logging is skipped. requestUUID = %@ turnId = %@", v2);
}

void __getAFAnalyticsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getAFAudioPowerUpdaterClass_block_invoke_cold_1(v0);
}

void __getAFAudioPowerUpdaterClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getAFAudioPowerXPCProviderClass_block_invoke_cold_1(v0);
}

void __getAFAudioPowerXPCProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getAFClientConfigurationClass_block_invoke_cold_1(v0);
}

void __getAFClientConfigurationClass_block_invoke_cold_1()
{
}

void __getAFFeatureFlagsClass_block_invoke_cold_1()
{
}

void __getAFInstanceContextClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getAFInterstitialProviderClass_block_invoke_cold_1(v0);
}

void __getAFInterstitialProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getAFOneArgumentSafetyBlockClass_block_invoke_cold_1(v0);
}

void __getAFOneArgumentSafetyBlockClass_block_invoke_cold_1()
{
}

void __getAFPreferencesClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getAFQueueClass_block_invoke_cold_1(v0);
}

void __getAFQueueClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getAFSafetyBlockClass_block_invoke_cold_1(v0);
}

void __getAFSafetyBlockClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getAFRequestInfoClass_block_invoke_cold_1(v0);
}

void __getAFRequestInfoClass_block_invoke_cold_1()
{
}

void WL_AFAssistantCapable_cold_1()
{
}

uint64_t ADCreateRequestLinkInfo()
{
  return MEMORY[0x270F0EBD0]();
}

uint64_t ADEmitRequestLinkEventMessage()
{
  return MEMORY[0x270F0EBD8]();
}

uint64_t AFActivationEventGetDescription()
{
  return MEMORY[0x270F0EBE0]();
}

uint64_t AFAnalyticsContextCreateWithCommand()
{
  return MEMORY[0x270F0EBF0]();
}

uint64_t AFAnalyticsContextCreateWithError()
{
  return MEMORY[0x270F0EBF8]();
}

uint64_t AFAnalyticsContextCreateWithRequestInfo()
{
  return MEMORY[0x270F0EC00]();
}

uint64_t AFAnalyticsContextCreateWithSpeechRequestOptions()
{
  return MEMORY[0x270F0EC08]();
}

uint64_t AFAnalyticsContextsMerge()
{
  return MEMORY[0x270F0EC10]();
}

uint64_t AFAnalyticsEventCreateCurrent()
{
  return MEMORY[0x270F0EC18]();
}

uint64_t AFAnalyticsTurnContextCreateWithRequestInfo()
{
  return MEMORY[0x270F0EC28]();
}

uint64_t AFAnalyticsTurnContextCreateWithSpeechRequestOptions()
{
  return MEMORY[0x270F0EC30]();
}

uint64_t AFClientServiceDelegateXPCInterface()
{
  return MEMORY[0x270F0EC58]();
}

uint64_t AFClientServiceXPCInterface()
{
  return MEMORY[0x270F0EC60]();
}

uint64_t AFErrorSetUnderlyingError()
{
  return MEMORY[0x270F0ED38]();
}

uint64_t AFInterstitialCreateCommand()
{
  return MEMORY[0x270F0ED80]();
}

uint64_t AFInterstitialIsCommandInterstitial()
{
  return MEMORY[0x270F0ED88]();
}

uint64_t AFInterstitialPhaseGetName()
{
  return MEMORY[0x270F0ED90]();
}

uint64_t AFInterstitialSupportsRequestWithEvent()
{
  return MEMORY[0x270F0ED98]();
}

uint64_t AFIsNano()
{
  return MEMORY[0x270F0EDE0]();
}

uint64_t AFMachAbsoluteTimeGetTimeInterval()
{
  return MEMORY[0x270F0EE20]();
}

uint64_t AFPlaybackRouteIsHandsFree()
{
  return MEMORY[0x270F0EE80]();
}

uint64_t AFPreferencesSupportedLanguagesForRemote()
{
  return MEMORY[0x270F0EEC0]();
}

uint64_t AFRecordRouteIsHearst()
{
  return MEMORY[0x270F0EF08]();
}

uint64_t AFSpeechEventGetDescription()
{
  return MEMORY[0x270F0EF90]();
}

uint64_t AFSpeechEventIsVoiceTrigger()
{
  return MEMORY[0x270F0EF98]();
}

uint64_t AFTurnIdentifierGetString()
{
  return MEMORY[0x270F0EFD8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t _AFPreferencesGetClientCommandDeliveryDelay()
{
  return MEMORY[0x270F0F028]();
}

uint64_t _AFPreferencesGetForcedInterstitialStyle()
{
  return MEMORY[0x270F0F030]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x270ED9610](a1, a2);
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

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

uint64_t nwi_ifstate_get_flags()
{
  return MEMORY[0x270EDA7B0]();
}

uint64_t nwi_state_copy()
{
  return MEMORY[0x270EDA7E8]();
}

uint64_t nwi_state_get_first_ifstate()
{
  return MEMORY[0x270EDA7F0]();
}

uint64_t nwi_state_get_notify_key()
{
  return MEMORY[0x270EDA810]();
}

uint64_t nwi_state_get_reachability_flags()
{
  return MEMORY[0x270EDA818]();
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
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

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}