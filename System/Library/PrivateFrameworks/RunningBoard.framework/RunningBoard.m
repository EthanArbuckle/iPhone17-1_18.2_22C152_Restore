void sub_226AB698C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_226AB6BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226AB7494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_226AB88A0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x22A6611D0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_226ABA8DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ABCA38(_Unwind_Exception *a1)
{
}

void sub_226ABD380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void RBPowerlogEvent(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = RBPowerlogEvent_onceToken;
  id v8 = a2;
  if (v7 != -1) {
    dispatch_once(&RBPowerlogEvent_onceToken, &__block_literal_global_23);
  }
  v9 = (void *)RBPowerlogEvent_eventQueue;
  v10 = [[RBPLEvent alloc] initWithevent:a1 identity:v8 assertionCount:a3 pid:a4];

  [v9 enqueueEvent:v10];
}

void sub_226AC4924(_Unwind_Exception *a1)
{
}

void sub_226ACA210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _RBAssertionManagerStoreComparePids(_DWORD *a1, _DWORD *a2)
{
  return (*a1 - *a2);
}

uint64_t RBSAttributePathIncrement(char a1, char a2)
{
  int v2 = a1 & 0xF;
  if ((a1 & 0xFu) >= 0xEuLL) {
    int v2 = 14;
  }
  return ((a2 & 0xF) << (4 * (v2 + 1))) | (v2 + 1);
}

void sub_226ACFA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ACFB0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226AD97D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_226ADA434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226AE1628(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
}

void sub_226AE2258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _addRBProperties(void *a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = xpc_dictionary_get_value(v5, "_AdditionalProperties");
  v9 = (void *)v8;
  uint64_t v10 = MEMORY[0x263EF8708];
  if (!v8 || MEMORY[0x22A661A50](v8) != v10)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();

    xpc_dictionary_set_value(v5, "_AdditionalProperties", empty);
    v9 = empty;
  }
  uint64_t v12 = xpc_dictionary_get_value(v9, "RunningBoard");
  v13 = (void *)v12;
  if (!v12 || MEMORY[0x22A661A50](v12) != v10)
  {
    xpc_object_t v14 = xpc_dictionary_create_empty();

    xpc_dictionary_set_value(v9, "RunningBoard", v14);
    v13 = v14;
  }
  if (v6)
  {
    v15 = [v6 encodeForJob];
    if (v15)
    {
      xpc_dictionary_set_value(v13, "RunningBoardLaunchedIdentity", v15);
    }
    else
    {
      v16 = rbs_job_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        _addRBProperties_cold_1();
      }
    }
  }
  xpc_dictionary_set_BOOL(v13, "RunningBoardLaunched", 1);
  v17 = xpc_dictionary_get_value(v13, "Managed");
  if (!v17 && [v6 defaultManageFlags] == 255) {
    xpc_dictionary_set_BOOL(v13, "Managed", 1);
  }
  v18 = [v7 beforeTranslocationBundlePath];

  if (v18)
  {
    id v19 = [v7 beforeTranslocationBundlePath];
    xpc_dictionary_set_string(v13, "BeforeTranslocationBundlePath", (const char *)[v19 UTF8String]);
  }
  v20 = [v7 homeDirectory];

  if (v20)
  {
    id v21 = [v7 homeDirectory];
    xpc_dictionary_set_string(v13, "HOME", (const char *)[v21 UTF8String]);
  }
  v22 = [v7 tmpDirectory];

  if (v22)
  {
    id v23 = [v7 tmpDirectory];
    xpc_dictionary_set_string(v13, "TMPDIR", (const char *)[v23 UTF8String]);
  }
  v24 = [v7 spawnConstraint];

  if (v24)
  {
    [v7 spawnConstraint];
    uint64_t v25 = _CFXPCCreateXPCObjectFromCFObject();
    v26 = (void *)v25;
    if (!v25 || MEMORY[0x22A661A50](v25) != v10)
    {
      v27 = rbs_job_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = [v7 spawnConstraint];
        int v29 = 138543618;
        id v30 = v6;
        __int16 v31 = 2114;
        v32 = v28;
        _os_log_impl(&dword_226AB3000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to set spawn constraint for job: %{public}@", (uint8_t *)&v29, 0x16u);
      }
    }
    xpc_dictionary_set_value(v5, "SpawnConstraint", v26);
  }
}

void sub_226AE933C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _describeXPCObject()
{
  v0 = (void *)MEMORY[0x22A661920]();
  uint64_t v1 = [NSString stringWithUTF8String:v0];
  free(v0);
  return v1;
}

void sub_226AEC9CC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void _handleDeath(void *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = rbs_ttl_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      int v10 = 138544130;
      id v11 = v5;
      __int16 v12 = 1024;
      int v13 = objc_msgSend(v6, "os_reason_namespace");
      __int16 v14 = 2048;
      uint64_t v15 = objc_msgSend(v6, "os_reason_code");
      __int16 v16 = 1024;
      int v17 = [v6 wait4Status];
      _os_log_impl(&dword_226AB3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ termination reported by launchd (%u, %llu, %u)", (uint8_t *)&v10, 0x22u);
    }

    uint64_t v8 = objc_msgSend(MEMORY[0x263F64558], "exitContextForNamespace:code:wait4Status:", objc_msgSend(v6, "os_reason_namespace"), objc_msgSend(v6, "os_reason_code"), objc_msgSend(v6, "wait4Status"));
    [v5 setLastExitContext:v8];
  }
  else if (v9)
  {
    int v10 = 138543362;
    id v11 = v5;
    _os_log_impl(&dword_226AB3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ termination reported by launchd without exit status", (uint8_t *)&v10, 0xCu);
  }

  v7[2](v7);
}

void ___backgroundContentFetchingProcessAssertionDuration_block_invoke()
{
  _backgroundContentFetchingProcessAssertionDuration___backgroundContentFetchingProcessAssertionDuration = _positiveDoubleForDefault(@"BKBackgroundContentFetchingProcessAssertionDuration", 30.0);
}

double _positiveDoubleForDefault(const __CFString *a1, double a2)
{
  CFNumberRef v3 = (const __CFNumber *)CFPreferencesCopyValue(a1, @"com.apple.assertiond", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  if (v3)
  {
    CFNumberRef v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFNumberGetTypeID())
    {
      double valuePtr = 0.0;
      int Value = CFNumberGetValue(v4, kCFNumberDoubleType, &valuePtr);
      if (valuePtr > 0.0 && Value != 0) {
        a2 = valuePtr;
      }
    }
    CFRelease(v4);
  }
  return a2;
}

void ___backgroundTaskCompletionDurationAllowedAfterContentFetchingAssertion_block_invoke()
{
  _backgroundTaskCompletionDurationAllowedAfterContentFetchingAssertion___backgroundTaskCompletionDurationAllowedAfterContentFetchingAssertion = _positiveDoubleForDefault(@"BKBackgroundContentFetchingTaskCompletionDuration", 10.0);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_226AF3914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id _errorWithRequestCodeAndInfoBuilder(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a3;
  id v11 = a4;
  __int16 v12 = a5;
  uint64_t v13 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
  __int16 v14 = v13;
  if (v10) {
    [v13 setObject:v10 forKey:*MEMORY[0x263F08338]];
  }
  if (v11) {
    [v14 setObject:v11 forKey:*MEMORY[0x263F08608]];
  }
  if (v12) {
    v12[2](v12, v14);
  }
  uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:v9 code:a2 userInfo:v14];

  return v15;
}

void _parseEntitlementConfigAndAddToRestrictedEntitlements(void *a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v23 = [v3 countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v31;
    *(void *)&long long v5 = 138412290;
    long long v20 = v5;
    id v21 = v3;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v3, "objectForKeyedSubscript:", v7, v20);
        id v9 = [v8 objectForKeyedSubscript:@"Type"];
        if ([v9 isEqualToString:@"Daemon"])
        {
          v24 = v9;
          uint64_t v10 = [MEMORY[0x263F64598] identityForDaemonJobLabel:v7];
LABEL_10:
          id v11 = v10;
          uint64_t v25 = v8;
          __int16 v12 = [v8 objectForKeyedSubscript:@"Entitlements"];
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v27 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void *)(*((void *)&v26 + 1) + 8 * j);
                uint64_t v18 = [v4 objectForKey:v17];
                if (v18)
                {
                  id v19 = v18;
                  [v18 addObject:v11];
                }
                else
                {
                  id v19 = [MEMORY[0x263EFF9C0] setWithObject:v11];
                  [v4 setObject:v19 forKey:v17];
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v14);
          }

          id v3 = v21;
          id v9 = v24;
          uint64_t v8 = v25;
          goto LABEL_23;
        }
        if ([v9 isEqualToString:@"App"])
        {
          v24 = v9;
          uint64_t v10 = [MEMORY[0x263F64598] identityForEmbeddedApplicationIdentifier:v7 jobLabel:v7 auid:0 platform:6];
          goto LABEL_10;
        }
        id v11 = rbs_general_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v20;
          uint64_t v36 = v7;
          _os_log_fault_impl(&dword_226AB3000, v11, OS_LOG_TYPE_FAULT, "_parseEntitlementConfigAndAddToRestrictedEntitlements failed fetching type of identity %@", buf, 0xCu);
        }
LABEL_23:
      }
      uint64_t v23 = [v3 countByEnumeratingWithState:&v30 objects:v37 count:16];
    }
    while (v23);
  }
}

NSObject *_getPlistInRunningBoardLibrary(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v1 = a1;
  int v2 = RBSPathForSystemDirectory();
  id v3 = [v2 stringByAppendingPathComponent:@"RunningBoard"];
  id v4 = [v3 stringByAppendingPathComponent:v1];

  id v13 = 0;
  long long v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v4 options:8 error:&v13];
  id v6 = v13;
  if (!v6)
  {
    id v12 = 0;
    uint64_t v8 = [MEMORY[0x263F08AC0] propertyListWithData:v5 options:0 format:0 error:&v12];
    id v7 = v12;
    if (v7)
    {
      id v9 = rbs_general_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        _getPlistInRunningBoardLibrary_cold_2(v7, v9);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = v8;
        uint64_t v10 = v8;
        goto LABEL_13;
      }
      id v9 = rbs_general_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        _getPlistInRunningBoardLibrary_cold_1();
      }
    }
    goto LABEL_11;
  }
  id v7 = v6;
  uint64_t v8 = rbs_general_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 localizedDescription];
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v9;
    _os_log_impl(&dword_226AB3000, v8, OS_LOG_TYPE_DEFAULT, "_getPlistInRunningBoardLibrary skipped because NSData dataWithContentsOfFile resulted in %{public}@", buf, 0xCu);
LABEL_11:
  }
  uint64_t v10 = 0;
LABEL_13:

  return v10;
}

id restrictedEntitlementsFromPlist()
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263EFF9A0] dictionary];
  id v1 = _getPlistInRunningBoardLibrary(@"runningboardEntitlementsConfiguration.plist");
  uint64_t v17 = v1;
  if (v1)
  {
    _parseEntitlementConfigAndAddToRestrictedEntitlements(v1, v0);
  }
  else
  {
    int v2 = rbs_general_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      restrictedEntitlementsFromPlist_cold_1(v2);
    }
  }
  id v3 = _getPlistInRunningBoardLibrary(@"runningboardAdditionalEntitlementsConfiguration.plist");
  uint64_t v16 = v3;
  if (v3)
  {
    _parseEntitlementConfigAndAddToRestrictedEntitlements(v3, v0);
  }
  else
  {
    id v4 = rbs_general_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226AB3000, v4, OS_LOG_TYPE_INFO, "RunningBoard did not find a secondary entitlements configuration at runningboardAdditionalEntitlementsConfiguration.plist", buf, 2u);
    }
  }
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.runningboard"];
  uint64_t v14 = [v15 objectForKey:@"AdditionalEntitlementsConfigurations"];
  _parseEntitlementConfigAndAddToRestrictedEntitlements(v14, v0);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v0;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v11 = rbs_general_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = objc_msgSend(v5, "objectForKeyedSubscript:", v10, v14);
          *(_DWORD *)buf = 138543618;
          uint64_t v23 = v10;
          __int16 v24 = 2114;
          uint64_t v25 = v12;
          _os_log_impl(&dword_226AB3000, v11, OS_LOG_TYPE_INFO, "generated restrictions for entitlement %{public}@: %{public}@", buf, 0x16u);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v7);
  }

  return v5;
}

id _posixErrorWithCodeAndDescription(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F08438];
  uint64_t v10 = *MEMORY[0x263F08320];
  v11[0] = a2;
  id v5 = NSDictionary;
  id v6 = a2;
  uint64_t v7 = [v5 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = [v3 errorWithDomain:v4 code:a1 userInfo:v7];

  return v8;
}

void sub_226AFC88C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void ___synchronizeJobsQueue_block_invoke()
{
  int v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.runningboardservices.synchronizeJobs", v2);
  id v1 = (void *)_synchronizeJobsQueue_queue;
  _synchronizeJobsQueue_queue = (uint64_t)v0;
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, a5, 2u);
}

unsigned char *OUTLINED_FUNCTION_6(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_7_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_11(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x200], 8) = a1;
}

void OUTLINED_FUNCTION_12(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x200], 8) = a1;
}

int *OUTLINED_FUNCTION_13()
{
  return __error();
}

int *OUTLINED_FUNCTION_16()
{
  return __error();
}

void OUTLINED_FUNCTION_17(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_18(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x22u);
}

uint64_t __Block_byref_object_copy__36(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__37(uint64_t a1)
{
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_3_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x200], 8) = a1;
}

void OUTLINED_FUNCTION_1_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void sub_226B09AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_226B09F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void OUTLINED_FUNCTION_1_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_226B0C0F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226B0C258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226B0C9EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226B0CB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

uint64_t OUTLINED_FUNCTION_2_2(uint64_t a1)
{
  return MEMORY[0x270EF2BB8](v2, v1, a1);
}

void sub_226B0D6AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_226B0F5D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

id safeGetProperty(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = [a1 objectForKeyedSubscript:v7];
  if (v9)
  {
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      goto LABEL_9;
    }
    id v11 = rbs_assertion_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v21 = v7;
      __int16 v22 = 2114;
      id v23 = (id)objc_opt_class();
      __int16 v24 = 2114;
      uint64_t v25 = a3;
      id v17 = v23;
      _os_log_error_impl(&dword_226AB3000, v11, OS_LOG_TYPE_ERROR, "Detected misconfigured attribute. Property %{public}@ had class %{public}@ when class %{public}@ was expected", buf, 0x20u);
    }
    if (v8)
    {
      uint64_t v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = *MEMORY[0x263F08338];
      id v13 = [NSString stringWithFormat:@"Detected misconfigured attribute. Property %@ had class %@ when class %@ was expected", v7, objc_opt_class(), a3];
      long long v19 = v13;
      uint64_t v14 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      uint64_t v15 = [v12 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v14];

      [v8 addObject:v15];
    }
  }
  id v10 = 0;
LABEL_9:

  return v10;
}

void OUTLINED_FUNCTION_2_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_8_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_9_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x200], 8) = a1;
}

id _RBLogAddStateCaptureBlockWithTitle(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (v5)
  {
    if (v6) {
      goto LABEL_3;
    }
LABEL_14:
    id v21 = [MEMORY[0x263F08690] currentHandler];
    __int16 v22 = objc_msgSend(NSString, "stringWithUTF8String:", "id<RBSInvalidatable> _RBLogAddStateCaptureBlockWithTitle(__strong dispatch_queue_t, NSString *__strong, __strong RBLogStateCaptureBlock, BOOL)");
    [v21 handleFailureInFunction:v22, @"RBStateCaptureManager.m", 105, @"Invalid parameter not satisfying: %@", @"stateCaptureTitle" file lineNumber description];

    if (v7) {
      goto LABEL_4;
    }
    goto LABEL_15;
  }
  long long v19 = [MEMORY[0x263F08690] currentHandler];
  long long v20 = objc_msgSend(NSString, "stringWithUTF8String:", "id<RBSInvalidatable> _RBLogAddStateCaptureBlockWithTitle(__strong dispatch_queue_t, NSString *__strong, __strong RBLogStateCaptureBlock, BOOL)");
  [v19 handleFailureInFunction:v20, @"RBStateCaptureManager.m", 104, @"Invalid parameter not satisfying: %@", @"queue" file lineNumber description];

  if (!v6) {
    goto LABEL_14;
  }
LABEL_3:
  if (v7) {
    goto LABEL_4;
  }
LABEL_15:
  id v23 = [MEMORY[0x263F08690] currentHandler];
  __int16 v24 = objc_msgSend(NSString, "stringWithUTF8String:", "id<RBSInvalidatable> _RBLogAddStateCaptureBlockWithTitle(__strong dispatch_queue_t, NSString *__strong, __strong RBLogStateCaptureBlock, BOOL)");
  [v23 handleFailureInFunction:v24, @"RBStateCaptureManager.m", 106, @"Invalid parameter not satisfying: %@", @"stateCaptureBlock" file lineNumber description];

LABEL_4:
  id v8 = v7;
  id v9 = v6;
  uint64_t v10 = (void *)os_state_add_handler();
  if (v10)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_lock);
    if (!_registeredStateCaptureBlocks)
    {
      id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t v12 = (void *)_registeredStateCaptureBlocks;
      _registeredStateCaptureBlocks = (uint64_t)v11;
    }
    id v13 = objc_alloc_init(RBLogStateCaptureEntry);
    uint64_t v15 = v13;
    if (v13) {
      objc_setProperty_nonatomic_copy(v13, v14, v8, 16);
    }
    -[RBLogStateCaptureEntry setTitle:]((uint64_t)v15, v9);
    -[RBLogStateCaptureEntry setQueue:]((uint64_t)v15, v5);
    uint64_t v16 = (void *)_registeredStateCaptureBlocks;
    id v17 = [NSNumber numberWithUnsignedLongLong:v10];
    [v16 setObject:v15 forKey:v17];

    os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
    uint64_t v10 = -[RBStateCaptureInvalidator initWithHandle:]([RBStateCaptureInvalidator alloc], (uint64_t)v10);
  }
  return v10;
}

void sub_226B15C28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_0_10(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void sub_226B19E1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void OUTLINED_FUNCTION_1_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void sub_226B1A9E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __RBPowerlogEvent_block_invoke()
{
  RBPowerlogEvent_eventQueue = objc_alloc_init(RBPLEventQueue);
  return MEMORY[0x270F9A758]();
}

void OUTLINED_FUNCTION_5_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x200], 8) = a1;
}

void OUTLINED_FUNCTION_6_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void _getPlistInRunningBoardLibrary_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_226AB3000, v0, OS_LOG_TYPE_FAULT, "_getPlistInRunningBoardLibrary failed because result is not dictionary (%{public}@)", v1, 0xCu);
}

void _getPlistInRunningBoardLibrary_cold_2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_226AB3000, a2, OS_LOG_TYPE_FAULT, "_getPlistInRunningBoardLibrary failed in NSPropertyList propertyListWithData with error %{public}@", v4, 0xCu);
}

void restrictedEntitlementsFromPlist_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_226AB3000, log, OS_LOG_TYPE_FAULT, "RunningBoard did not find an entitlements configuration at runningboardEntitlementsConfiguration.plist", v1, 2u);
}

void _addRBProperties_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "%{public}@ failed to encode identity", v2, v3, v4, v5, v6);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x270EE4F70](theSet);
}

uint64_t IOGPUDeviceCreate()
{
  return MEMORY[0x270F3D330]();
}

uint64_t IOGPUDeviceSetAppGPURole()
{
  return MEMORY[0x270F3D358]();
}

uint64_t IOPMAssertionDeclareSystemActivityWithProperties()
{
  return MEMORY[0x270EF4858]();
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x270EF4868](*(void *)&AssertionID);
}

IOReturn IOPMAssertionSetProperty(IOPMAssertionID theAssertion, CFStringRef theProperty, CFTypeRef theValue)
{
  return MEMORY[0x270EF4878](*(void *)&theAssertion, theProperty, theValue);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AA8](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t NSStringFromRBSCPUMaximumUsageViolationPolicy()
{
  return MEMORY[0x270F5BD80]();
}

uint64_t NSStringFromRBSDurationEndPolicy()
{
  return MEMORY[0x270F5BD88]();
}

uint64_t NSStringFromRBSDurationStartPolicy()
{
  return MEMORY[0x270F5BD90]();
}

uint64_t NSStringFromRBSGPURole()
{
  return MEMORY[0x270F5BD98]();
}

uint64_t NSStringFromRBSLegacyReason()
{
  return MEMORY[0x270F5BDA0]();
}

uint64_t NSStringFromRBSMemoryLimitStrength()
{
  return MEMORY[0x270F5BDA8]();
}

uint64_t NSStringFromRBSRole()
{
  return MEMORY[0x270F5BDB0]();
}

uint64_t NSStringFromRBSTaskState()
{
  return MEMORY[0x270F5BDB8]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x270F55150]();
}

uint64_t RBSAcquisitionCompletionPolicyIsValid()
{
  return MEMORY[0x270F5BDC0]();
}

uint64_t RBSArrayForKey()
{
  return MEMORY[0x270F5BDC8]();
}

uint64_t RBSAuditTokenRepresentsPlatformBinary()
{
  return MEMORY[0x270F5BDD0]();
}

uint64_t RBSBoolForKey()
{
  return MEMORY[0x270F5BDD8]();
}

uint64_t RBSBundleIDForPID()
{
  return MEMORY[0x270F5BDE0]();
}

uint64_t RBSContainedExtensionBundleIDs()
{
  return MEMORY[0x270F5BDE8]();
}

uint64_t RBSDarwinRoleFromRBSRole()
{
  return MEMORY[0x270F5BDF0]();
}

uint64_t RBSDictionaryForKey()
{
  return MEMORY[0x270F5BDF8]();
}

uint64_t RBSDispatchAsyncWithQoS()
{
  return MEMORY[0x270F5BE00]();
}

uint64_t RBSEndowmentEncode()
{
  return MEMORY[0x270F5BE08]();
}

uint64_t RBSExecutablePathForPID()
{
  return MEMORY[0x270F5BE10]();
}

uint64_t RBSExtensionPointFromBundleDict()
{
  return MEMORY[0x270F5BE18]();
}

uint64_t RBSInvalidRealAuditToken()
{
  return MEMORY[0x270F5BE20]();
}

uint64_t RBSMachAbsoluteTime()
{
  return MEMORY[0x270F5BE28]();
}

uint64_t RBSNumberForKey()
{
  return MEMORY[0x270F5BE30]();
}

uint64_t RBSPIDExists()
{
  return MEMORY[0x270F5BE38]();
}

uint64_t RBSPathForSystemDirectory()
{
  return MEMORY[0x270F5BE48]();
}

uint64_t RBSRealAuditTokenValid()
{
  return MEMORY[0x270F5BE50]();
}

uint64_t RBSStringForKey()
{
  return MEMORY[0x270F5BE58]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

uint32_t SecTaskGetCodeSignStatus(SecTaskRef task)
{
  return MEMORY[0x270EFDCE8](task);
}

uint64_t WriteCrashReportWithStackshot()
{
  return MEMORY[0x270F51240]();
}

uint64_t WriteCrashReportWithStackshotWithPayload()
{
  return MEMORY[0x270F51248]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x270EE5798]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x270EE57A8]();
}

uint64_t _EXConfigureLaunchContext()
{
  return MEMORY[0x270EEB938]();
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

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

uint64_t _launch_get_last_exit_reason_4SB()
{
  return MEMORY[0x270F0CCC0]();
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x270ED8068]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x270ED80B0]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sqlite3_lockstate()
{
  return MEMORY[0x270F9B450]();
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x270ED8480](a1, *(void *)&a2);
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

uid_t audit_token_to_auid(audit_token_t *atoken)
{
  return MEMORY[0x270F98160](atoken);
}

uid_t audit_token_to_euid(audit_token_t *atoken)
{
  return MEMORY[0x270F98170](atoken);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x270ED8798](__key, __base, __nel, __width, __compar);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x270ED8F88]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x270ED8FD0]();
}

uint64_t container_get_path()
{
  return MEMORY[0x270ED9008]();
}

uint64_t container_query_create()
{
  return MEMORY[0x270ED9060]();
}

uint64_t container_query_free()
{
  return MEMORY[0x270ED9068]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x270ED9070]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x270ED9078]();
}

uint64_t container_query_iterate_results_with_subquery_sync()
{
  return MEMORY[0x270ED9088]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x270ED9090]();
}

uint64_t container_query_operation_set_platform()
{
  return MEMORY[0x270ED9098]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x270ED90A0]();
}

uint64_t container_query_set_identifiers()
{
  return MEMORY[0x270ED90B0]();
}

uint64_t container_query_set_include_other_owners()
{
  return MEMORY[0x270ED90B8]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x270ED90C0]();
}

uint64_t container_query_set_uid()
{
  return MEMORY[0x270ED90C8]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9280](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9440](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x270ED94F0]();
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x270ED9518](source);
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
  return MEMORY[0x270ED95A8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x270ED95D0](label);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x270ED9698]();
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x270ED9B30](*(void *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x270ED9D38](*(void *)&a1);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9DC0](path, name, value, size, *(void *)&position, *(void *)&options);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x270ED9F70](*(void *)&a1, *(void *)&a2);
}

uint64_t kpersona_find()
{
  return MEMORY[0x270ED9F80]();
}

uint64_t kpersona_info()
{
  return MEMORY[0x270ED9F88]();
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

uint64_t memorystatus_control()
{
  return MEMORY[0x270EDA490]();
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

uint64_t notify_resume_pid()
{
  return MEMORY[0x270EDA790]();
}

uint64_t notify_suspend_pid()
{
  return MEMORY[0x270EDA7A8]();
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

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x270EDAA78]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x270EDAA80]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x270EDAAD0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x270EDAAF0]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x270EDAB08]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x270EDAB50]();
}

uint64_t pid_resume()
{
  return MEMORY[0x270EDAC20]();
}

uint64_t pid_shutdown_sockets()
{
  return MEMORY[0x270EDAC28]();
}

uint64_t pid_suspend()
{
  return MEMORY[0x270EDAC30]();
}

uint64_t proc_disable_cpumon()
{
  return MEMORY[0x270EDAD30]();
}

int proc_pidfdinfo(int pid, int fd, int flavor, void *buffer, int buffersize)
{
  return MEMORY[0x270EDAD70](*(void *)&pid, *(void *)&fd, *(void *)&flavor, buffer, *(void *)&buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x270EDAD78](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

uint64_t proc_resume_cpumon()
{
  return MEMORY[0x270EDADA8]();
}

uint64_t proc_set_cpumon_defaults()
{
  return MEMORY[0x270EDADB0]();
}

uint64_t proc_set_cpumon_params()
{
  return MEMORY[0x270EDADB8]();
}

uint64_t proc_set_cpumon_params_fatal()
{
  return MEMORY[0x270EDADC0]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

uint64_t rbs_assertion_log()
{
  return MEMORY[0x270F5BE68]();
}

uint64_t rbs_best_effort_networking_log()
{
  return MEMORY[0x270F5BE70]();
}

uint64_t rbs_connection_log()
{
  return MEMORY[0x270F5BE78]();
}

uint64_t rbs_general_log()
{
  return MEMORY[0x270F5BE80]();
}

uint64_t rbs_jetsam_log()
{
  return MEMORY[0x270F5BE88]();
}

uint64_t rbs_job_log()
{
  return MEMORY[0x270F5BE90]();
}

uint64_t rbs_job_oversize_log()
{
  return MEMORY[0x270F5BE98]();
}

uint64_t rbs_message_log()
{
  return MEMORY[0x270F5BEA0]();
}

uint64_t rbs_monitor_log()
{
  return MEMORY[0x270F5BEA8]();
}

uint64_t rbs_power_log()
{
  return MEMORY[0x270F5BEB0]();
}

uint64_t rbs_process_log()
{
  return MEMORY[0x270F5BEB8]();
}

uint64_t rbs_sp_assertion_log()
{
  return MEMORY[0x270F5BEC0]();
}

uint64_t rbs_sp_state_log()
{
  return MEMORY[0x270F5BEC8]();
}

uint64_t rbs_sp_telemetry_log()
{
  return MEMORY[0x270F5BED0]();
}

uint64_t rbs_sp_therm_log()
{
  return MEMORY[0x270F5BED8]();
}

uint64_t rbs_state_log()
{
  return MEMORY[0x270F5BEE0]();
}

uint64_t rbs_ttl_log()
{
  return MEMORY[0x270F5BEE8]();
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x270EDB170](a1, a2);
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x270EDB298]();
}

uint64_t sandbox_container_path_for_audit_token()
{
  return MEMORY[0x270EDB2A0]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return MEMORY[0x270EDB3F0](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int setpriority(int a1, id_t a2, int a3)
{
  return MEMORY[0x270EDB410](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDB470](a1, *(void *)&a2);
}

int shm_unlink(const char *a1)
{
  return MEMORY[0x270EDB478](a1);
}

uint64_t spd_client_start_monitoring_all_sockets_for_pid()
{
  return MEMORY[0x270F9B428]();
}

uint64_t spd_client_stop_monitoring_all_sockets_for_pid()
{
  return MEMORY[0x270F9B430]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

uint64_t tailspin_config_create_with_default_config()
{
  return MEMORY[0x270F9B980]();
}

uint64_t tailspin_config_free()
{
  return MEMORY[0x270F9B988]();
}

uint64_t tailspin_dump_output_sync()
{
  return MEMORY[0x270F9B9A0]();
}

uint64_t tailspin_enabled_set()
{
  return MEMORY[0x270F9B9C8]();
}

uint64_t terminate_with_reason()
{
  return MEMORY[0x270EDB8D8]();
}

uint64_t voucher_adopt()
{
  return MEMORY[0x270EDBAD0]();
}

uint64_t wd_endpoint_activate()
{
  return MEMORY[0x270F84A80]();
}

uint64_t wd_endpoint_add_queue()
{
  return MEMORY[0x270F84A88]();
}

uint64_t wd_endpoint_register()
{
  return MEMORY[0x270F84A90]();
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD58](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD88](xarray, index);
}

void xpc_array_set_int64(xpc_object_t xarray, size_t index, int64_t value)
{
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

uint64_t xpc_bundle_create()
{
  return MEMORY[0x270EDBDF0]();
}

uint64_t xpc_bundle_get_executable_path()
{
  return MEMORY[0x270EDBDF8]();
}

uint64_t xpc_bundle_get_info_dictionary()
{
  return MEMORY[0x270EDBE00]();
}

uint64_t xpc_bundle_get_property()
{
  return MEMORY[0x270EDBE08]();
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x270EDBE70]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x270EDBEA0](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

void xpc_connection_suspend(xpc_connection_t connection)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x270EDC058](xdict);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC078](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x270EDC098](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x270EDC128]();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

uint64_t xpc_endpoint_get_bs_job_handle()
{
  return MEMORY[0x270EDC188]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x270EDC3C8]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x270EDC448]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x270EDC450]();
}