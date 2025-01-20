id SLDClientGlobalWorkloop()
{
  void *v0;
  uint64_t vars8;

  if (SLDClientGlobalWorkloop_onceToken != -1) {
    dispatch_once(&SLDClientGlobalWorkloop_onceToken, &__block_literal_global_32);
  }
  v0 = (void *)SLDClientGlobalWorkloop_workloop;
  return v0;
}

void sub_19BE1ABE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19BE1AE3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_19BE1B168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BE1B240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BE1B364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BE1B7F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

id SLDGlobalWorkloop()
{
  if (SLDGlobalWorkloop_onceToken != -1) {
    dispatch_once(&SLDGlobalWorkloop_onceToken, &__block_literal_global_29);
  }
  v0 = (void *)SLDGlobalWorkloop_workloop;
  return v0;
}

void sub_19BE1BE40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BE1C27C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_19BE1C6CC(_Unwind_Exception *a1)
{
  v5 = v3;
  objc_destroyWeak(v5);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_19BE1C720()
{
}

void sub_19BE1CCCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SLIsRunningInSLTester()
{
  if (SLIsRunningInSLTester_onceToken != -1) {
    dispatch_once(&SLIsRunningInSLTester_onceToken, &__block_literal_global_55);
  }
  return SLIsRunningInSLTester_sIsRunningInSLTester;
}

uint64_t SLIsRunningInGelatoTester()
{
  if (SLIsRunningInGelatoTester_onceToken != -1) {
    dispatch_once(&SLIsRunningInGelatoTester_onceToken, &__block_literal_global_50_0);
  }
  return SLIsRunningInGelatoTester_sIsRunningInSLTester;
}

uint64_t SLIsRunningInDaemon()
{
  if (SLIsRunningInDaemon_onceToken != -1) {
    dispatch_once(&SLIsRunningInDaemon_onceToken, &__block_literal_global_45);
  }
  return SLIsRunningInDaemon_sIsRunningInDaemon;
}

void sub_19BE1D138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BE1D304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SLFrameworkLogHandle()
{
  if (SLFrameworkLogHandle_onceToken != -1) {
    dispatch_once(&SLFrameworkLogHandle_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)SLFrameworkLogHandle_osLog;
  return v0;
}

void sub_19BE1D718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_3_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

unsigned char *OUTLINED_FUNCTION_2_3(unsigned char *result, unsigned char *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_2_4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_19BE1DD40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SLDaemonLogHandle()
{
  if (SLDaemonLogHandle_onceToken != -1) {
    dispatch_once(&SLDaemonLogHandle_onceToken, &__block_literal_global_7_0);
  }
  v0 = (void *)SLDaemonLogHandle_osLog;
  return v0;
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

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void __Block_byref_object_dispose__14(uint64_t a1)
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

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
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

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

CFStringRef __SLIsRunningInSLTester_block_invoke()
{
  MainBundle = CFBundleGetMainBundle();
  CFStringRef result = CFBundleGetIdentifier(MainBundle);
  if (result)
  {
    CFStringRef result = (CFStringRef)CFEqual(result, @"com.apple.SLTester");
    BOOL v2 = result != 0;
  }
  else
  {
    BOOL v2 = 0;
  }
  SLIsRunningInSLTester_sIsRunningInSLTester = v2;
  return result;
}

CFStringRef __SLIsRunningInGelatoTester_block_invoke()
{
  MainBundle = CFBundleGetMainBundle();
  CFStringRef result = CFBundleGetIdentifier(MainBundle);
  if (result)
  {
    CFStringRef result = (CFStringRef)CFEqual(result, @"com.apple.sociallayer.GelatoTester");
    BOOL v2 = result != 0;
  }
  else
  {
    BOOL v2 = 0;
  }
  SLIsRunningInGelatoTester_sIsRunningInSLTester = v2;
  return result;
}

CFStringRef __SLIsRunningInDaemon_block_invoke()
{
  MainBundle = CFBundleGetMainBundle();
  CFStringRef result = CFBundleGetIdentifier(MainBundle);
  if (result)
  {
    CFStringRef result = (CFStringRef)CFEqual(result, @"com.apple.sociallayerd");
    BOOL v2 = result != 0;
  }
  else
  {
    BOOL v2 = 0;
  }
  SLIsRunningInDaemon_sIsRunningInDaemon = v2;
  return result;
}

uint64_t __SLFrameworkLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.SocialLayerFramework", "General");
  uint64_t v1 = SLFrameworkLogHandle_osLog;
  SLFrameworkLogHandle_osLog = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __SLDaemonLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.SocialLayerDaemon", "General");
  uint64_t v1 = SLDaemonLogHandle_osLog;
  SLDaemonLogHandle_osLog = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t SLDConnectionIsEntitled(void *a1)
{
  id v1 = a1;
  if (SLDConnectionHasPublicEntitlement(v1)) {
    uint64_t HasLegacyHighlightsEntitlement = 1;
  }
  else {
    uint64_t HasLegacyHighlightsEntitlement = SLDConnectionHasLegacyHighlightsEntitlement(v1);
  }

  return HasLegacyHighlightsEntitlement;
}

uint64_t SLDConnectionHasLegacyHighlightsEntitlement(void *a1)
{
  id v1 = [a1 valueForEntitlement:@"com.apple.private.sociallayer.highlights"];
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t SLDConnectionHasPublicEntitlement(void *a1)
{
  id v1 = [a1 valueForEntitlement:@"com.apple.developer.shared-with-you"];
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_19BE1F22C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SLDAllowedServiceClasses()
{
  if (SLDAllowedServiceClasses_onceToken != -1) {
    dispatch_once(&SLDAllowedServiceClasses_onceToken, &__block_literal_global_3);
  }
  os_log_t v0 = (void *)SLDAllowedServiceClasses_sClasses;
  return v0;
}

void sub_19BE1F6E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BE1FB58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  objc_destroyWeak((id *)(v9 - 56));
  _Unwind_Resume(a1);
}

id SLGeneralTelemetryLogHandle()
{
  if (SLGeneralTelemetryLogHandle_onceToken != -1) {
    dispatch_once(&SLGeneralTelemetryLogHandle_onceToken, &__block_literal_global_14);
  }
  os_log_t v0 = (void *)SLGeneralTelemetryLogHandle_osLog;
  return v0;
}

uint64_t __SLDClientGlobalWorkloop_block_invoke()
{
  dispatch_workloop_t v0 = dispatch_workloop_create("SocialLayerClientGlobalWorkloop");
  uint64_t v1 = SLDClientGlobalWorkloop_workloop;
  SLDClientGlobalWorkloop_workloop = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __SLGeneralTelemetryLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.SocialLayer.telemetry", "General");
  uint64_t v1 = SLGeneralTelemetryLogHandle_osLog;
  SLGeneralTelemetryLogHandle_osLog = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_19BE20064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __SLDAllowedServiceClasses_block_invoke()
{
  v2[11] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  v2[10] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:11];
  uint64_t v1 = (void *)SLDAllowedServiceClasses_sClasses;
  SLDAllowedServiceClasses_sClasses = v0;
}

void sub_19BE20BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location,id a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id a33)
{
  objc_destroyWeak(v33);
  objc_destroyWeak(v34);
  _Block_object_dispose(&a19, 8);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a26);
  objc_destroyWeak(a10);
  objc_destroyWeak(&a33);
  _Unwind_Resume(a1);
}

void sub_19BE212A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19BE219B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BE21C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_19BE22C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_19BE22CF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

id getCloudSharingClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCloudSharingClass_softClass;
  uint64_t v7 = getCloudSharingClass_softClass;
  if (!getCloudSharingClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCloudSharingClass_block_invoke;
    v3[3] = &unk_1E58A88B0;
    v3[4] = &v4;
    __getCloudSharingClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19BE294A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCloudSharingClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CloudSharingLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CloudSharingLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E58A88D0;
    uint64_t v6 = 0;
    CloudSharingLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!CloudSharingLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("CloudSharing");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getCloudSharingClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCloudSharingClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CloudSharingLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CloudSharingLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_19BE2A6C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19BE2B0F8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_19BE2BAF0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_19BE31730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_19BE31F0C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Unwind_Resume(a1);
}

void sub_19BE3263C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_19BE32DF0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_19BE33504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_19BE33CB8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_19BE343D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_19BE34A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void OUTLINED_FUNCTION_0_4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t SLDConnectionIsEntitledForCollaborationHandshake(void *a1)
{
  uint64_t v1 = [a1 valueForEntitlement:@"com.apple.private.sociallayer.collaboration-handshake"];
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t SLDConnectionIsEntitledForAccessibility(void *a1)
{
  uint64_t v1 = [a1 valueForEntitlement:@"com.apple.private.sociallayer.accessibility"];
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t SLDConnectionIsEntitledForShareableContent(void *a1)
{
  uint64_t v1 = [a1 valueForEntitlement:@"com.apple.private.sociallayer.shareable-content"];
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t __SLDGlobalWorkloop_block_invoke()
{
  dispatch_workloop_t v0 = dispatch_workloop_create("SocialLayerDaemonGlobalWorkloop");
  uint64_t v1 = SLDGlobalWorkloop_workloop;
  SLDGlobalWorkloop_workloop = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t CTContentSizeCategoryForSlotStyle(void *a1)
{
  unint64_t v1 = [a1 preferredContentSizeCategory];
  if (v1 > 0xB) {
    uint64_t v2 = MEMORY[0x1E4F24448];
  }
  else {
    uint64_t v2 = qword_1E58A8D90[v1];
  }
  return *(void *)v2;
}

id CoreGlyphsCatalog()
{
  if (CoreGlyphsCatalog_onceToken != -1) {
    dispatch_once(&CoreGlyphsCatalog_onceToken, &__block_literal_global_35);
  }
  dispatch_workloop_t v0 = (void *)CoreGlyphsCatalog_catalog;
  return v0;
}

void __CoreGlyphsCatalog_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F5E048]);
  if (SLDCoreGlyphsBundle_onceToken != -1) {
    dispatch_once(&SLDCoreGlyphsBundle_onceToken, &__block_literal_global_68);
  }
  id v5 = 0;
  id v1 = (id)SLDCoreGlyphsBundle_bundle;
  uint64_t v2 = [v0 initWithName:@"Assets" fromBundle:v1 error:&v5];
  id v3 = v5;
  uint64_t v4 = (void *)CoreGlyphsCatalog_catalog;
  CoreGlyphsCatalog_catalog = v2;
}

id SLDAssetCatalog()
{
  if (SLDAssetCatalog_onceToken != -1) {
    dispatch_once(&SLDAssetCatalog_onceToken, &__block_literal_global_41_0);
  }
  id v0 = (void *)SLDAssetCatalog_catalog;
  return v0;
}

void __SLDAssetCatalog_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F5E048]);
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  id v6 = 0;
  uint64_t v2 = [v0 initWithName:@"Assets" fromBundle:v1 error:&v6];
  id v3 = v6;
  uint64_t v4 = (void *)SLDAssetCatalog_catalog;
  SLDAssetCatalog_catalog = v2;

  if (!SLDAssetCatalog_catalog)
  {
    id v5 = SLDaemonLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __SLDAssetCatalog_block_invoke_cold_1((uint64_t)v3, v5);
    }
  }
}

CGImage *SLDCreateImageNamed(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = SLDAssetCatalog();
  if (v5)
  {
    id v6 = objc_msgSend(v5, "imageWithName:scaleFactor:", v4, (double)objc_msgSend(v3, "displayScale"));
  }
  else
  {
    id v6 = 0;
  }

  if (v6 && [v6 image])
  {
    uint64_t v7 = (CGImage *)[v6 image];
    CGImageRetain(v7);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id SLDContactMonogramAttributedString(void *a1, void *a2, double a3)
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1EEC19158];
  if ([v6 length])
  {
    v29[0] = *MEMORY[0x1E4F245F0];
    v8 = (void *)MEMORY[0x1E4F28ED0];
    id v9 = v5;
    uint64_t v10 = [v8 numberWithDouble:a3 * 105.0 / 225.0];
    v30[0] = v10;
    v29[1] = *MEMORY[0x1E4F24620];
    uint64_t v11 = *MEMORY[0x1E4F24660];
    v28[0] = *MEMORY[0x1E4F24630];
    uint64_t v12 = *MEMORY[0x1E4F246D8];
    v27[0] = v11;
    v27[1] = v12;
    v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:*MEMORY[0x1E4F246B8]];
    v28[1] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
    v30[1] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];

    CTContentSizeCategoryForSlotStyle(v9);
    v16 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
    CTFontRef v17 = CTFontCreateWithFontDescriptor(v16, 0.0, 0);
    CFRelease(v16);

    id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v19 = *MEMORY[0x1E4F243F0];
    v26[0] = v17;
    uint64_t v20 = *MEMORY[0x1E4F24740];
    v25[0] = v19;
    v25[1] = v20;
    CGColorRef ConstantColor = CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E4F1DCB8]);
    v25[2] = *MEMORY[0x1E4F24790];
    v26[1] = ConstantColor;
    v26[2] = &unk_1EEC28088;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
    uint64_t v23 = [v18 initWithString:v6 attributes:v22];

    uint64_t v7 = (void *)v23;
  }

  return v7;
}

CGColor *SLDCreateColorNamed(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v3;
  id v6 = v4;
  uint64_t v7 = SLDAssetCatalog();
  if (v7)
  {
    uint64_t v8 = [v5 userInterfaceStyle];
    uint64_t v9 = [v5 assetDeviceIdiom];
    if (v8 == 1) {
      uint64_t v10 = @"UIAppearanceDark";
    }
    else {
      uint64_t v10 = @"UIAppearanceLight";
    }
    uint64_t v11 = [v7 colorWithName:v6 displayGamut:0 deviceIdiom:v9 appearanceName:v10];
    if (!v11)
    {
      uint64_t v12 = [v5 assetDeviceIdiom];
      if (SLDAssetCatalogGenericAppearanceName_onceToken != -1) {
        dispatch_once(&SLDAssetCatalogGenericAppearanceName_onceToken, &__block_literal_global_76);
      }
      uint64_t v11 = [v7 colorWithName:v6 displayGamut:0 deviceIdiom:v12 appearanceName:SLDAssetCatalogGenericAppearanceName_genericName];
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  if (v11 && [v11 cgColor])
  {
    v13 = (CGColor *)[v11 cgColor];
    CGColorRetain(v13);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t SLDCUINamedImageDeviceClass()
{
  if (SLDCUINamedImageDeviceClass_onceToken != -1) {
    dispatch_once(&SLDCUINamedImageDeviceClass_onceToken, &__block_literal_global_50);
  }
  return 0;
}

__CFString *SLDAssetCatalogPreferredAppearanceName(int a1)
{
  if (a1) {
    return @"UIAppearanceDark";
  }
  else {
    return @"UIAppearanceLight";
  }
}

id SLDSystemVectorGlyph(void *a1, int a2, uint64_t a3, uint64_t a4, int a5, double a6, double a7)
{
  id v13 = a1;
  if (SLDCUINamedImageDeviceClass_onceToken != -1) {
    dispatch_once(&SLDCUINamedImageDeviceClass_onceToken, &__block_literal_global_50);
  }
  if (a2) {
    uint64_t v14 = 4;
  }
  else {
    uint64_t v14 = 5;
  }
  v15 = @"UIAppearanceLight";
  if (a5) {
    v15 = @"UIAppearanceDark";
  }
  v16 = v15;
  CTFontRef v17 = CoreGlyphsCatalog();
  id v18 = [v17 namedVectorGlyphWithName:v13 scaleFactor:0 deviceIdiom:v14 layoutDirection:a3 glyphSize:a4 glyphWeight:v16 glyphPointSize:a6 appearanceName:a7];

  if (!v18)
  {
    uint64_t v19 = CoreGlyphsCatalog();
    if (SLDAssetCatalogGenericAppearanceName_onceToken != -1) {
      dispatch_once(&SLDAssetCatalogGenericAppearanceName_onceToken, &__block_literal_global_76);
    }
    id v18 = [v19 namedVectorGlyphWithName:v13 scaleFactor:0 deviceIdiom:v14 layoutDirection:a3 glyphSize:a4 glyphWeight:SLDAssetCatalogGenericAppearanceName_genericName glyphPointSize:a6 appearanceName:a7];
  }
  return v18;
}

double SLDVectorGlyphMinimumViableSize(void *a1, double a2)
{
  id v3 = a1;
  [v3 contentBoundsUnrounded];
  double v5 = v4 * 0.5;
  [v3 alignmentRectUnrounded];
  double v7 = v5 - fmin(v6, 0.0);
  [v3 alignmentRectUnrounded];
  double v9 = v8;
  [v3 alignmentRectUnrounded];
  double v11 = v9 + v10;
  [v3 contentBoundsUnrounded];
  if (v11 >= v12) {
    double v13 = v11;
  }
  else {
    double v13 = v12;
  }
  double v14 = v13 - v5;
  if (v7 >= v14) {
    double v14 = v7;
  }
  double v15 = SLRoundToScale(v14 + v14, a2);
  [v3 contentBounds];

  return v15;
}

id SLDSystemVectorGlyphWithSlotStyle(void *a1, void *a2, uint64_t a3, uint64_t a4, double a5)
{
  id v9 = a2;
  id v10 = a1;
  double v11 = (double)[v10 displayScale];
  BOOL v12 = [v10 layoutDirection] == 1;
  uint64_t v13 = [v10 userInterfaceStyle];

  double v14 = SLDSystemVectorGlyph(v9, v12, a3, a4, v13 == 1, v11, a5);

  return v14;
}

uint64_t SLDCreateRasterizedVectorGlyph(void *a1, const char *a2, double a3, double a4, double a5)
{
  return objc_msgSend(a1, "rasterizeImageUsingScaleFactor:forTargetSize:", a5, a3, a4);
}

uint64_t SLDCreateRasterizedSystemVectorGlyph(void *a1, int a2, uint64_t a3, uint64_t a4, int a5, double a6, double a7, double a8, double a9)
{
  BOOL v12 = SLDSystemVectorGlyph(a1, a2, a3, a4, a5, a8, a9);
  uint64_t v13 = v12;
  if (v12) {
    uint64_t v14 = objc_msgSend(v12, "rasterizeImageUsingScaleFactor:forTargetSize:", a8, a6, a7);
  }
  else {
    uint64_t v14 = 0;
  }

  return v14;
}

uint64_t SLDCreateRasterizedSystemVectorGlyphWithSlotStyle(void *a1, void *a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7)
{
  id v13 = a2;
  id v14 = a1;
  double v15 = (double)[v14 displayScale];
  BOOL v16 = [v14 layoutDirection] == 1;
  uint64_t v17 = [v14 userInterfaceStyle];

  uint64_t v18 = SLDCreateRasterizedSystemVectorGlyph(v13, v16, a3, a4, v17 == 1, a5, a6, v15, a7);
  return v18;
}

void SLDRenderTintedImageInContext(CGContext *a1, CGImage *a2, CGColor *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  CGContextSaveGState(a1);
  CGContextSetAlpha(a1, 1.0);
  v15.origin.x = a4;
  v15.origin.y = a5;
  v15.size.width = a6;
  v15.size.height = a7;
  CGContextBeginTransparencyLayerWithRect(a1, v15, 0);
  v16.origin.x = a4;
  v16.origin.y = a5;
  v16.size.width = a6;
  v16.size.height = a7;
  CGContextDrawImage(a1, v16, a2);
  CGContextSetFillColorWithColor(a1, a3);
  CGContextSetBlendMode(a1, kCGBlendModeSourceIn);
  v17.origin.x = a4;
  v17.origin.y = a5;
  v17.size.width = a6;
  v17.size.height = a7;
  CGContextFillRect(a1, v17);
  CGContextEndTransparencyLayer(a1);
  CGContextRestoreGState(a1);
}

void SLDRenderContactMonogramInContextAtRect(void *a1, void *a2, CGContext *a3, int a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  id v17 = a1;
  id v18 = a2;
  unsigned int v19 = [v17 displayScale];
  CGContextSaveGState(a3);
  if (a4)
  {
    CGContextTranslateCTM(a3, 0.0, a5);
    CGContextScaleCTM(a3, 1.0, -1.0);
  }
  CGContextBeginPath(a3);
  v47.origin.x = a6;
  v47.origin.y = a7;
  v47.size.width = a8;
  v47.size.height = a9;
  CGContextAddEllipseInRect(a3, v47);
  CGContextClip(a3);
  CGContextClosePath(a3);
  CGContextSetAlpha(a3, 0.9);
  v48.origin.x = a6;
  v48.origin.y = a7;
  v48.size.width = a8;
  v48.size.height = a9;
  CGContextFillRect(a3, v48);
  uint64_t v20 = SLDCreateColorNamed(v17, @"MonogramGradientStartColor");
  v21 = SLDCreateColorNamed(v17, @"MonogramGradientEndColor");
  Mutable = CFArrayCreateMutable(0, 2, MEMORY[0x1E4F1D510]);
  CFArrayAppendValue(Mutable, v20);
  CFArrayAppendValue(Mutable, v21);
  CGContextSetAlpha(a3, 1.0);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v24 = CGGradientCreateWithColors(DeviceRGB, Mutable, 0);
  v49.origin.x = a6;
  v49.origin.y = a7;
  v49.size.width = a8;
  v49.size.height = a9;
  CGFloat MaxX = CGRectGetMaxX(v49);
  v50.origin.x = a6;
  v50.origin.y = a7;
  v50.size.width = a8;
  v50.size.height = a9;
  v46.y = CGRectGetMaxY(v50);
  v45.x = a6;
  v45.y = a7;
  v46.x = MaxX;
  CGContextDrawLinearGradient(a3, v24, v45, v46, 0);
  if (v18
    && ([MEMORY[0x1E4F1B910] stringFromContact:v18 style:1002],
        (v26 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v27 = v26;
    double v28 = (double)v19;
    SLDContactMonogramAttributedString(v17, v26, a8);
    CFAttributedStringRef v42 = (const __CFAttributedString *)objc_claimAutoreleasedReturnValue();
    v29 = CTLineCreateWithAttributedString(v42);
    CGFloat descent = 0.0;
    CGFloat ascent = 0.0;
    double TypographicBounds = CTLineGetTypographicBounds(v29, &ascent, &descent, 0);
    CGFloat ascent = SLRoundToScale(ascent, v28);
    CGFloat descent = SLRoundToScale(descent, v28);
    v51.origin.x = a6;
    v51.origin.y = a7;
    v51.size.width = a8;
    v51.size.height = a9;
    double MidX = CGRectGetMidX(v51);
    double v32 = SLRoundToScale(MidX, v28);
    v52.origin.x = a6;
    v52.origin.y = a7;
    v52.size.width = a8;
    v52.size.height = a9;
    double MidY = CGRectGetMidY(v52);
    double v34 = SLRoundToScale(MidY, v28);
    v53.origin.x = a6;
    v53.origin.y = a7;
    v53.size.width = a8;
    v53.size.height = a9;
    CGFloat Width = CGRectGetWidth(v53);
    double v36 = SLRoundToScale(Width * 0.800000012, v28) / TypographicBounds;
    if (v36 > 1.0) {
      double v36 = 1.0;
    }
    double v37 = SLRoundToScale(v36, v28);
    double v38 = SLRoundToScale(TypographicBounds * 0.5, v28);
    double v39 = SLRoundToScale((ascent - descent) * 0.5, v28);
    CGContextTranslateCTM(a3, v32, v34);
    CGContextScaleCTM(a3, v37, v37);
    CGContextSetTextPosition(a3, -v38, -v39);
    CTLineDraw(v29, a3);
    CFRelease(v29);
  }
  else
  {
    v40 = SLDCreateImageNamed(v17, @"silhouette-large");
    CGColorRef ConstantColor = CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E4F1DCB8]);
    SLDRenderTintedImageInContext(a3, v40, ConstantColor, a6, a7, a8, a9);
    CGImageRelease(v40);
  }
  CGColorSpaceRelease(DeviceRGB);
  CGColorRelease(v20);
  CGColorRelease(v21);
  CFRelease(Mutable);
  CGGradientRelease(v24);
  CGContextRestoreGState(a3);
}

void SLDRenderContactSilhouetteInContextAtRect(void *a1, CGContext *a2, int a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  id v15 = a1;
  CGContextSaveGState(a2);
  if (a3)
  {
    CGContextTranslateCTM(a2, 0.0, a4);
    CGContextScaleCTM(a2, 1.0, -1.0);
  }
  CGContextBeginPath(a2);
  v27.origin.x = a5;
  v27.origin.y = a6;
  v27.size.width = a7;
  v27.size.height = a8;
  CGContextAddEllipseInRect(a2, v27);
  CGContextClip(a2);
  CGContextClosePath(a2);
  CGContextSetAlpha(a2, 0.9);
  v28.origin.x = a5;
  v28.origin.y = a6;
  v28.size.width = a7;
  v28.size.height = a8;
  CGContextFillRect(a2, v28);
  CGRect v16 = SLDCreateColorNamed(v15, @"MonogramGradientStartColor");
  id v17 = SLDCreateColorNamed(v15, @"MonogramGradientEndColor");
  Mutable = CFArrayCreateMutable(0, 2, MEMORY[0x1E4F1D510]);
  CFArrayAppendValue(Mutable, v16);
  CFArrayAppendValue(Mutable, v17);
  CGContextSetAlpha(a2, 1.0);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  uint64_t v20 = CGGradientCreateWithColors(DeviceRGB, Mutable, 0);
  v29.origin.x = a5;
  v29.origin.y = a6;
  v29.size.width = a7;
  v29.size.height = a8;
  CGFloat MaxX = CGRectGetMaxX(v29);
  v30.origin.x = a5;
  v30.origin.y = a6;
  v30.size.width = a7;
  v30.size.height = a8;
  v26.y = CGRectGetMaxY(v30);
  v25.x = a5;
  v25.y = a6;
  v26.x = MaxX;
  CGContextDrawLinearGradient(a2, v20, v25, v26, 0);
  v22 = SLDCreateImageNamed(v15, @"silhouette-large");

  CGColorRef ConstantColor = CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E4F1DCB8]);
  SLDRenderTintedImageInContext(a2, v22, ConstantColor, a5, a6, a7, a8);
  CGImageRelease(v22);
  CGColorSpaceRelease(DeviceRGB);
  CGColorRelease(v16);
  CGColorRelease(v17);
  CFRelease(Mutable);
  CGGradientRelease(v20);
  CGContextRestoreGState(a2);
}

CGImageRef SLDCreateGroupPhotoImageWithGroupID(void *a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    v16[0] = v1;
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x2020000000;
    double v4 = (void (*)(id))getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_ptr;
    id v15 = getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_ptr;
    if (!getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_ptr)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_block_invoke;
      v11[3] = &unk_1E58A88B0;
      v11[4] = &v12;
      __getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_block_invoke((uint64_t)v11);
      double v4 = (void (*)(id))v13[3];
    }
    _Block_object_dispose(&v12, 8);
    if (!v4)
    {
      SLDCreateGroupPhotoImageWithGroupID_cold_1();
      __break(1u);
    }
    double v5 = v4(v3);

    double v6 = [v5 objectForKey:v2];
    double v7 = v6;
    if (v6)
    {
      CGImageRef v8 = SLDCreateGroupPhotoImageWithData(v6);
    }
    else
    {
      id v9 = SLDaemonLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        SLDCreateGroupPhotoImageWithGroupID_cold_2(v9);
      }

      CGImageRef v8 = 0;
    }
  }
  else
  {
    CGImageRef v8 = 0;
  }

  return v8;
}

void sub_19BE372F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CGImageRef SLDCreateGroupPhotoImageWithData(void *a1)
{
  CFDataRef v1 = a1;
  CFDataRef v2 = v1;
  if (!v1)
  {
LABEL_8:
    CGImageRef ImageAtIndex = 0;
    goto LABEL_9;
  }
  id v3 = CGDataProviderCreateWithCFData(v1);
  if (!v3
    || (double v4 = v3, v5 = CGImageSourceCreateWithDataProvider(v3, 0), CFRelease(v4), !v5)
    || (CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v5, 0, 0), CFRelease(v5), !ImageAtIndex))
  {
    double v7 = SLDaemonLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      SLDCreateGroupPhotoImageWithData_cold_1(v2, v7);
    }

    goto LABEL_8;
  }
LABEL_9:

  return ImageAtIndex;
}

CFIndex SLDGetHyphenationPosition(const __CFString *a1, CFIndex a2, CFRange a3, CFLocaleRef locale)
{
  return CFStringGetHyphenationLocationBeforeIndex(a1, a2, a3, 0, locale, 0);
}

BOOL SLDAuditTokensAreEqual(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 20) == *(_DWORD *)(a2 + 20) && *(_DWORD *)(a1 + 28) == *(_DWORD *)(a2 + 28);
}

void __SLDCoreGlyphsBundle_block_invoke()
{
  id v0 = (void *)MEMORY[0x1E4F28B50];
  if (SLDCoreGlyphsBundlePath_onceToken != -1) {
    dispatch_once(&SLDCoreGlyphsBundlePath_onceToken, &__block_literal_global_70);
  }
  id v3 = (id)SLDCoreGlyphsBundlePath_bundlePath;
  uint64_t v1 = [v0 bundleWithPath:v3];
  CFDataRef v2 = (void *)SLDCoreGlyphsBundle_bundle;
  SLDCoreGlyphsBundle_bundle = v1;
}

void __SLDCoreGlyphsBundlePath_block_invoke()
{
  id v0 = (void *)SLDCoreGlyphsBundlePath_bundlePath;
  SLDCoreGlyphsBundlePath_bundlePath = @"/System/Library/CoreServices/CoreGlyphs.bundle";
}

void __SLDAssetCatalogGenericAppearanceName_block_invoke()
{
  id v0 = (void *)SLDAssetCatalogGenericAppearanceName_genericName;
  SLDAssetCatalogGenericAppearanceName_genericName = @"UIAppearanceAny";
}

void *__getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!IMCoreLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __IMCoreLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E58A8D78;
    uint64_t v7 = 0;
    IMCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    id v3 = (void *)v5[0];
    CFDataRef v2 = (void *)IMCoreLibraryCore_frameworkLibrary;
    if (IMCoreLibraryCore_frameworkLibrary)
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
  CFDataRef v2 = (void *)IMCoreLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "IMSPIGetGroupPhotosForChatsWithGroupIDs");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __IMCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IMCoreLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_19BE3A728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BE3D06C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BE3D598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BE3D7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BE3E7D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
}

void sub_19BE3ED90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BE3F480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_19BE3FAF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_19BE4063C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
}

void sub_19BE44160(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_19BE44434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BE44634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_19BE446DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_19BE44788(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_19BE44A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void *__Block_byref_object_copy__40(uint64_t a1, uint64_t a2)
{
  uint64_t result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__41(uint64_t a1)
{
}

void sub_19BE453CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_1(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

BOOL SLHandleIsEmail(void *a1)
{
  uint64_t v1 = a1;
  if ([(__CFString *)v1 length]) {
    BOOL v2 = CFStringFind(v1, @"@", 0).location != -1;
  }
  else {
    BOOL v2 = 0;
  }

  return v2;
}

uint64_t SLHandleIsPhoneNumber(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = [(__CFString *)v1 length];
  char v3 = 0;
  if (v1 && v2)
  {
    CFIndex Length = CFStringGetLength(v1);
    if (Length < 2)
    {
LABEL_4:
      char v3 = 0;
      goto LABEL_5;
    }
    CFIndex v6 = Length;
    char v3 = 0;
    for (CFIndex i = 0; v6 != i; ++i)
    {
      UChar32 CharacterAtIndex = CFStringGetCharacterAtIndex(v1, i);
      if (CharacterAtIndex <= 111)
      {
        switch(CharacterAtIndex)
        {
          case ' ':
          case '""':
          case '#':
          case '\'':
          case '(':
          case ')':
          case '*':
          case '+':
          case ',':
          case '-':
          case '.':
          case '/':
          case ':':
          case ';':
          case '?':
            goto LABEL_9;
          default:
            goto LABEL_24;
        }
      }
      if (CharacterAtIndex > 8209)
      {
        if (CharacterAtIndex > 8235)
        {
          if (CharacterAtIndex == 8236) {
            goto LABEL_9;
          }
          int v9 = 8237;
        }
        else
        {
          if (CharacterAtIndex == 8210) {
            goto LABEL_9;
          }
          int v9 = 8234;
        }
        if (CharacterAtIndex != v9) {
          goto LABEL_24;
        }
      }
      else if (CharacterAtIndex <= 8207)
      {
        if (CharacterAtIndex == 112) {
          continue;
        }
        if (CharacterAtIndex != 160)
        {
LABEL_24:
          if (u_charDigitValue(CharacterAtIndex) == -1) {
            goto LABEL_4;
          }
        }
      }
LABEL_9:
      char v3 = 1;
    }
  }
LABEL_5:

  return v3 & 1;
}

void sub_19BE483D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_19BE491FC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_19BE4A134(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19BE4AB44(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_19BE4C560(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_19BE4D4B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v51 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_19BE4E330(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_19BE4EDA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose((const void *)(v43 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_19BE4F950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

void sub_19BE50D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_19BE519AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_19BE51AD0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getMFMessageComposeViewControllerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getMFMessageComposeViewControllerClass_softClass;
  uint64_t v7 = getMFMessageComposeViewControllerClass_softClass;
  if (!getMFMessageComposeViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getMFMessageComposeViewControllerClass_block_invoke;
    v3[3] = &unk_1E58A88B0;
    v3[4] = &v4;
    __getMFMessageComposeViewControllerClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19BE51E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMFMessageComposeViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MessageUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __MessageUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E58A9740;
    uint64_t v6 = 0;
    MessageUILibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!MessageUILibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("MFMessageComposeViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getMFMessageComposeViewControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getMFMessageComposeViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MessageUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MessageUILibraryCore_frameworkLibrary = result;
  return result;
}

void __SLShareableContentIsArchivedObjectClassNameAllowed_block_invoke()
{
  id v0 = (void *)SLShareableContentIsArchivedObjectClassNameAllowed_allowedArchivedObjectClassNames;
  SLShareableContentIsArchivedObjectClassNameAllowed_allowedArchivedObjectClassNames = (uint64_t)&unk_1EEC28100;
}

void sub_19BE53DFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19BE53F30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_19BE54CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BE559E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_19BE55CB0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_19BE5636C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_19BE56580(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

Class __getCSCloudSharingClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CloudSharingLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CloudSharingLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E58A9A28;
    uint64_t v6 = 0;
    CloudSharingLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!CloudSharingLibraryCore_frameworkLibrary_0)
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
    Class result = objc_getClass("CSCloudSharing");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getCSCloudSharingClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCSCloudSharingClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CloudSharingLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  CloudSharingLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_19BE58158(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t IMCoreLibraryCore()
{
  if (!IMCoreLibraryCore_frameworkLibrary_0) {
    IMCoreLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  return IMCoreLibraryCore_frameworkLibrary_0;
}

uint64_t getIMSPILastAddressedHandleForChatWithGUIDSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getIMSPILastAddressedHandleForChatWithGUIDSymbolLoc_ptr;
  uint64_t v6 = getIMSPILastAddressedHandleForChatWithGUIDSymbolLoc_ptr;
  if (!getIMSPILastAddressedHandleForChatWithGUIDSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)IMCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "IMSPILastAddressedHandleForChatWithGUID");
    getIMSPILastAddressedHandleForChatWithGUIDSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19BE58B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __IMCoreLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  IMCoreLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getIMSPILastAddressedHandleForChatWithGUIDSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)IMCoreLibrary();
  uint64_t result = dlsym(v2, "IMSPILastAddressedHandleForChatWithGUID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIMSPILastAddressedHandleForChatWithGUIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t IMCoreLibrary()
{
  uint64_t v0 = IMCoreLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t getIMSPIResetChatRegistrySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getIMSPIResetChatRegistrySymbolLoc_ptr;
  uint64_t v6 = getIMSPIResetChatRegistrySymbolLoc_ptr;
  if (!getIMSPIResetChatRegistrySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)IMCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "IMSPIResetChatRegistry");
    getIMSPIResetChatRegistrySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19BE58D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getIMSPIResetChatRegistrySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)IMCoreLibrary();
  uint64_t result = dlsym(v2, "IMSPIResetChatRegistry");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIMSPIResetChatRegistrySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_19BE5DCB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_0_8(id a1)
{
  return a1;
}

void sub_19BE5FA50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BE606DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19BE608A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19BE616DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19BE61754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

id SLShareableContentLogHandle()
{
  if (SLShareableContentLogHandle_onceToken != -1) {
    dispatch_once(&SLShareableContentLogHandle_onceToken, &__block_literal_global_10);
  }
  uint64_t v0 = (void *)SLShareableContentLogHandle_osLog;
  return v0;
}

uint64_t __SLShareableContentLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.SocialLayer", "ShareableContent");
  uint64_t v1 = SLShareableContentLogHandle_osLog;
  SLShareableContentLogHandle_osLog = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_19BE633BC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_19BE64468(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19BE64894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

uint64_t SLDValidateSupplementaryData(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v2 = v1;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      id v13 = v1;
      uint64_t v5 = *(void *)v15;
      char v6 = 1;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v15 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v9 = SLDaemonLogHandle();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
              SLDValidateSupplementaryData_cold_2();
            }

            char v6 = 0;
          }
          uint64_t v10 = [v2 objectForKeyedSubscript:v8];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            double v11 = SLDaemonLogHandle();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
              SLDValidateSupplementaryData_cold_1();
            }

            char v6 = 0;
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v4);
      id v1 = v13;
    }
    else
    {
      char v6 = 1;
    }
  }
  else
  {
    uint64_t v2 = SLDaemonLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      SLDValidateSupplementaryData_cold_3((uint64_t)v1, v2);
    }
    char v6 = 0;
  }

  return v6 & 1;
}

void sub_19BE6870C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_19BE6959C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BE6A5A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BE6B1B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_19BE6C2B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_19BE6E4C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BE6EC3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BE6F784(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_19BE6FE00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BE701A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BE7035C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __SLDStorageDirectory_block_invoke()
{
  os_log_t v0 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  id v1 = [v0 objectAtIndexedSubscript:0];

  uint64_t v2 = [v1 stringByAppendingPathComponent:@"SocialLayer"];
  uint64_t v3 = (void *)SLDStorageDirectory_dir;
  SLDStorageDirectory_dir = v2;

  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v14 = 0;
  [v4 createDirectoryAtPath:SLDStorageDirectory_dir withIntermediateDirectories:1 attributes:0 error:&v14];
  id v5 = v14;
  char v6 = v5;
  if (v5)
  {
    if ([v5 code] == 640)
    {
      uint64_t v7 = [v6 domain];
      int v8 = [v7 isEqualToString:*MEMORY[0x1E4F281F8]];

      if (v8)
      {
        uint64_t v9 = SLDaemonLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          __SLDStorageDirectory_block_invoke_cold_1();
        }
LABEL_9:

        uint64_t v10 = (void *)SLDStorageDirectory_dir;
        SLDStorageDirectory_dir = 0;

        goto LABEL_12;
      }
    }
    if ([v6 code] == 513)
    {
      uint64_t v9 = SLDaemonLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __SLDStorageDirectory_block_invoke_cold_2();
      }
      goto LABEL_9;
    }
  }
  if (SLDStorageDirectory_dir)
  {
    double v11 = (void *)MEMORY[0x19F3918C0]();
    uint64_t v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:SLDStorageDirectory_dir];
    id v13 = (void *)SLDStorageDirectory_dirURL;
    SLDStorageDirectory_dirURL = v12;
  }
LABEL_12:
}

uint64_t OUTLINED_FUNCTION_10(uint64_t a1)
{
  return *(void *)a1;
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_fault_impl(a1, v4, OS_LOG_TYPE_FAULT, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_15(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_20()
{
  return objc_opt_class();
}

void sub_19BE73E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getIMCollaborationClearTransmissionClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getIMCollaborationClearTransmissionClass_softClass;
  uint64_t v7 = getIMCollaborationClearTransmissionClass_softClass;
  if (!getIMCollaborationClearTransmissionClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getIMCollaborationClearTransmissionClass_block_invoke;
    v3[3] = &unk_1E58A88B0;
    v3[4] = &v4;
    __getIMCollaborationClearTransmissionClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19BE74970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getIMCollaborationNoticeTransmissionClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getIMCollaborationNoticeTransmissionClass_softClass;
  uint64_t v7 = getIMCollaborationNoticeTransmissionClass_softClass;
  if (!getIMCollaborationNoticeTransmissionClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getIMCollaborationNoticeTransmissionClass_block_invoke;
    v3[3] = &unk_1E58A88B0;
    v3[4] = &v4;
    __getIMCollaborationNoticeTransmissionClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19BE74B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getIMCollaborationNoticeDispatcherClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getIMCollaborationNoticeDispatcherClass_softClass;
  uint64_t v7 = getIMCollaborationNoticeDispatcherClass_softClass;
  if (!getIMCollaborationNoticeDispatcherClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getIMCollaborationNoticeDispatcherClass_block_invoke;
    v3[3] = &unk_1E58A88B0;
    v3[4] = &v4;
    __getIMCollaborationNoticeDispatcherClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19BE74E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getIMCollaborationClearTransmissionClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("IMCollaborationClearTransmission");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getIMCollaborationClearTransmissionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getIMCollaborationClearTransmissionClass_block_invoke_cold_1();
    IMSharedUtilitiesLibrary();
  }
}

void IMSharedUtilitiesLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!IMSharedUtilitiesLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __IMSharedUtilitiesLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E58A9FA8;
    uint64_t v3 = 0;
    IMSharedUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!IMSharedUtilitiesLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __IMSharedUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IMSharedUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getIMCollaborationNoticeTransmissionClass_block_invoke(uint64_t a1)
{
  IMSharedUtilitiesLibrary();
  Class result = objc_getClass("IMCollaborationNoticeTransmission");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getIMCollaborationNoticeTransmissionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getIMCollaborationNoticeTransmissionClass_block_invoke_cold_1();
    return (Class)__getIMCollaborationNoticeDispatcherClass_block_invoke(v3);
  }
  return result;
}

Class __getIMCollaborationNoticeDispatcherClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!IMCoreLibraryCore_frameworkLibrary_1)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __IMCoreLibraryCore_block_invoke_1;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E58A9FC0;
    uint64_t v6 = 0;
    IMCoreLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!IMCoreLibraryCore_frameworkLibrary_1)
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
    Class result = objc_getClass("IMCollaborationNoticeDispatcher");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getIMCollaborationNoticeDispatcherClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getIMCollaborationNoticeDispatcherClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __IMCoreLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  IMCoreLibraryCore_frameworkLibrary_1 = result;
  return result;
}

id SLFrameworkBundle()
{
  if (SLFrameworkBundle_onceToken != -1) {
    dispatch_once(&SLFrameworkBundle_onceToken, &__block_literal_global_17);
  }
  uint64_t v0 = (void *)SLFrameworkBundle_sBundle;
  return v0;
}

uint64_t __SLFrameworkBundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.SocialLayer"];
  uint64_t v1 = SLFrameworkBundle_sBundle;
  SLFrameworkBundle_sBundle = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

BOOL SL_CGFloatApproximatelyEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 0.00000999999975;
}

double SLRoundToScale(double a1, double a2)
{
  if (fabs(a2) < 0.00000999999975) {
    a2 = 1.0;
  }
  if (a2 == 1.0) {
    return round(a1);
  }
  else {
    return round(a2 * a1) / a2;
  }
}

double SLRectCenteredInRectToScale(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v16 = a9;
  double v17 = a5 + (a7 - a3) * 0.5;
  if (fabs(a9) < 0.00000999999975) {
    double v16 = 1.0;
  }
  BOOL v18 = v16 == 1.0;
  double v19 = round(v16 * v17) / v16;
  double result = round(v17);
  if (!v18) {
    return v19;
  }
  return result;
}

id SLDisplayNameWithPhoneNumberOrEmailForContact(void *a1)
{
  id v1 = a1;
  long long v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 phoneNumbers];
    if ([v3 count])
    {
      uint64_t v4 = [v3 firstObject];
      long long v5 = [v4 value];
      uint64_t v6 = [v5 stringValue];

      uint64_t v7 = IMFormattedDisplayStringForNumber();
    }
    else
    {
      uint64_t v6 = [v2 emailAddresses];
      if ([v6 count])
      {
        int v8 = [v6 firstObject];
        uint64_t v9 = [v8 value];

        uint64_t v7 = IMFormattedDisplayStringForNumber();
      }
      else
      {
        uint64_t v7 = 0;
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id SLFormattedDisplayNameForPerson(void *a1)
{
  id v1 = a1;
  long long v2 = [v1 contact];

  if (v2)
  {
    uint64_t v3 = [v1 contact];
    uint64_t v4 = SLDisplayNameWithPhoneNumberOrEmailForContact(v3);
LABEL_7:
    int v8 = (void *)v4;

    goto LABEL_8;
  }
  long long v5 = [v1 handle];
  int v6 = MEMORY[0x19F3913A0]();

  uint64_t v3 = [v1 handle];
  if (v6)
  {
LABEL_6:
    uint64_t v4 = IMFormattedDisplayStringForNumber();
    goto LABEL_7;
  }
  int IsEmail = IMStringIsEmail();

  if (IsEmail)
  {
    uint64_t v3 = [v1 handle];
    goto LABEL_6;
  }
  int v8 = 0;
LABEL_8:

  return v8;
}

void SLSendPortraitFeedbackTypeAppButtonForAttribution(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = SLApplicationIdentifierForPortraitFeedback();
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = objc_opt_new();
      long long v5 = [v1 uniqueIdentifier];
      uint64_t v6 = *MEMORY[0x1E4F8A190];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __SLSendPortraitFeedbackTypeAppButtonForAttribution_block_invoke;
      v7[3] = &unk_1E58A9FE0;
      id v8 = v1;
      [v4 feedbackForAttributionIdentifier:v5 type:0 client:v3 variant:v6 completion:v7];
    }
    else
    {
      uint64_t v3 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        SLSendPortraitFeedbackTypeAppButtonForAttribution_cold_2();
      }
    }
  }
  else
  {
    uint64_t v3 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      SLSendPortraitFeedbackTypeAppButtonForAttribution_cold_1();
    }
  }
}

id SLApplicationIdentifierForPortraitFeedback()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
  id v1 = v0;
  if (v0)
  {
    uint64_t v2 = [v0 applicationIdentifier];
    uint64_t v3 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412290;
      uint64_t v6 = v2;
      _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_INFO, "SLApplicationIdentifierForPortraitFeedback: identifier is '%@'", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    uint64_t v3 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      SLApplicationIdentifierForPortraitFeedback_cold_1();
    }
    uint64_t v2 = 0;
  }

  return v2;
}

void __SLSendPortraitFeedbackTypeAppButtonForAttribution_block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = SLFrameworkLogHandle();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v8 = [*(id *)(a1 + 32) uniqueIdentifier];
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_19BE17000, v7, OS_LOG_TYPE_INFO, "SLSendPortraitFeedbackTypeAppButtonForAttribution: sent feedback successfully for attribution: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __SLSendPortraitFeedbackTypeAppButtonForAttribution_block_invoke_cold_1(a1);
  }
}

void SLSendPortraitFeedbackTypeDisplayedHighlight(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && ([v1 identifier], uint64_t v3 = objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    uint64_t v4 = SLApplicationIdentifierForPortraitFeedback();
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = objc_opt_new();
      uint64_t v7 = [v2 identifier];
      uint64_t v8 = *MEMORY[0x1E4F8A190];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __SLSendPortraitFeedbackTypeDisplayedHighlight_block_invoke;
      v9[3] = &unk_1E58A9FE0;
      id v10 = v2;
      [v6 feedbackForHighlightIdentifier:v7 type:0 client:v5 variant:v8 completion:v9];
    }
    else
    {
      id v5 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        SLSendPortraitFeedbackTypeDisplayedHighlight_cold_2();
      }
    }
  }
  else
  {
    id v5 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      SLSendPortraitFeedbackTypeDisplayedHighlight_cold_1();
    }
  }
}

void __SLSendPortraitFeedbackTypeDisplayedHighlight_block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = SLFrameworkLogHandle();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [*(id *)(a1 + 32) identifier];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_19BE17000, v7, OS_LOG_TYPE_INFO, "SLSendPortraitFeedbackTypeDisplayedForHighlight: sent feedback successfully for highlight: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __SLSendPortraitFeedbackTypeDisplayedHighlight_block_invoke_cold_1(a1);
  }
}

void SLSendPortraitFeedbackTypeUserInteractedWithHighlight(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && ([v1 identifier], uint64_t v3 = objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    uint64_t v4 = SLApplicationIdentifierForPortraitFeedback();
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = objc_opt_new();
      uint64_t v7 = [v2 identifier];
      uint64_t v8 = *MEMORY[0x1E4F8A190];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __SLSendPortraitFeedbackTypeUserInteractedWithHighlight_block_invoke;
      v9[3] = &unk_1E58A9FE0;
      id v10 = v2;
      [v6 feedbackForHighlightIdentifier:v7 type:1 client:v5 variant:v8 completion:v9];
    }
    else
    {
      id v5 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        SLSendPortraitFeedbackTypeUserInteractedWithHighlight_cold_2();
      }
    }
  }
  else
  {
    id v5 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      SLSendPortraitFeedbackTypeUserInteractedWithHighlight_cold_1();
    }
  }
}

void __SLSendPortraitFeedbackTypeUserInteractedWithHighlight_block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = SLFrameworkLogHandle();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [*(id *)(a1 + 32) identifier];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_19BE17000, v7, OS_LOG_TYPE_INFO, "SLSendPortraitFeedbackTypeUserInteractedWithHighlight: sent feedback successfully for highlight: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __SLSendPortraitFeedbackTypeUserInteractedWithHighlight_block_invoke_cold_1(a1);
  }
}

uint64_t SLPersonIsEqualToPerson(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v3 contact];
  uint64_t v6 = [v4 contact];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v7 = [v3 handle];
    uint64_t v8 = [v4 handle];
    uint64_t v9 = [v7 isEqualToString:v8];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass())) {
      uint64_t v9 = [v5 isEqual:v6];
    }
    else {
      uint64_t v9 = 0;
    }
  }

  return v9;
}

uint64_t SLAppHasPublicEntitlement()
{
  uint64_t v0 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v1 = [v0 entitlements];
    uint64_t v2 = [v1 objectForKey:@"com.apple.developer.shared-with-you" ofClass:objc_opt_class()];

    uint64_t v3 = [v2 BOOLValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t SLPersonArrayisEqualToArray(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (uint64_t v5 = [v4 count], v5 != objc_msgSend(v3, "count")))
  {
LABEL_12:
    uint64_t IsEqualToPerson = 0;
    goto LABEL_13;
  }
  if ([v3 count])
  {
    uint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = [v3 objectAtIndex:v6];
      uint64_t v8 = [v4 objectAtIndex:v6];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      uint64_t IsEqualToPerson = SLPersonIsEqualToPerson(v7, v8);

      if ((IsEqualToPerson & 1) != 0 && ++v6 < (unint64_t)[v3 count]) {
        continue;
      }
      goto LABEL_13;
    }

    goto LABEL_12;
  }
  uint64_t IsEqualToPerson = 1;
LABEL_13:

  return IsEqualToPerson;
}

uint64_t SLPersonArrayContainsPerson(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (SLPersonIsEqualToPerson(*(void **)(*((void *)&v10 + 1) + 8 * i), v4))
        {
          uint64_t v6 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

id SLURLMinusFragmentForCKURLs(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = [v1 absoluteString];
    int v4 = [v3 containsString:@"https://www.icloud.com/"];

    id v5 = v2;
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"https://www.icloud.com/notes", @"https://www.icloud.com/reminders", @"https://www.icloud.com/freeform", @"https://www.icloud.com/keynote", @"https://www.icloud.com/pages", @"https://www.icloud.com/numbers", @"https://www.icloud.com/share", @"https://www.icloud.com/iclouddrive", @"https://www.icloud.com/safari-tab-groups", 0);
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v18 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
            long long v12 = [v2 absoluteString];
            LOBYTE(v11) = [v12 containsString:v11];

            if (v11)
            {

              long long v13 = [v2 absoluteString];
              id v6 = [v13 componentsSeparatedByString:@"#"];
              id v14 = (void *)MEMORY[0x1E4F1CB10];
              uint64_t v15 = [v6 firstObject];
              id v5 = [v14 URLWithString:v15];

              goto LABEL_14;
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
      long long v13 = v6;
      id v5 = v2;
LABEL_14:
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

id getCKPostSharingContextClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCKPostSharingContextClass_softClass;
  uint64_t v7 = getCKPostSharingContextClass_softClass;
  if (!getCKPostSharingContextClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCKPostSharingContextClass_block_invoke;
    v3[3] = &unk_1E58A88B0;
    v3[4] = &v4;
    __getCKPostSharingContextClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19BE7BD28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCKContainerSetupInfoClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCKContainerSetupInfoClass_softClass;
  uint64_t v7 = getCKContainerSetupInfoClass_softClass;
  if (!getCKContainerSetupInfoClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCKContainerSetupInfoClass_block_invoke;
    v3[3] = &unk_1E58A88B0;
    v3[4] = &v4;
    __getCKContainerSetupInfoClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19BE7BFA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCKPostSharingContextClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CKPostSharingContext");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCKPostSharingContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCKPostSharingContextClass_block_invoke_cold_1();
    CloudKitLibrary();
  }
}

void CloudKitLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!CloudKitLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __CloudKitLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E58AA138;
    uint64_t v3 = 0;
    CloudKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!CloudKitLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __CloudKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CloudKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCKContainerSetupInfoClass_block_invoke(uint64_t a1)
{
  CloudKitLibrary();
  Class result = objc_getClass("CKContainerSetupInfo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCKContainerSetupInfoClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getCKContainerSetupInfoClass_block_invoke_cold_1();
    return (Class)+[NSArray(TransformUtilities) arrayWithObject:repeated:](v3);
  }
  return result;
}

void sub_19BE7E990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCKContainerSetupInfoClass_0()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCKContainerSetupInfoClass_softClass_0;
  uint64_t v7 = getCKContainerSetupInfoClass_softClass_0;
  if (!getCKContainerSetupInfoClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCKContainerSetupInfoClass_block_invoke_0;
    v3[3] = &unk_1E58A88B0;
    v3[4] = &v4;
    __getCKContainerSetupInfoClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19BE80D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKContainerSetupInfoClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CloudKitLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CloudKitLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E58AA180;
    uint64_t v6 = 0;
    CloudKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!CloudKitLibraryCore_frameworkLibrary_0)
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
    Class result = objc_getClass("CKContainerSetupInfo");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getCKContainerSetupInfoClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCKContainerSetupInfoClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CloudKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  CloudKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_19BE818C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t IMCoreLibraryCore_0()
{
  if (!IMCoreLibraryCore_frameworkLibrary_2) {
    IMCoreLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  return IMCoreLibraryCore_frameworkLibrary_2;
}

uint64_t getIMSPIRemoveMessageGUIDFromSyndicationSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getIMSPIRemoveMessageGUIDFromSyndicationSymbolLoc_ptr;
  uint64_t v6 = getIMSPIRemoveMessageGUIDFromSyndicationSymbolLoc_ptr;
  if (!getIMSPIRemoveMessageGUIDFromSyndicationSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __getIMSPIRemoveMessageGUIDFromSyndicationSymbolLoc_block_invoke;
    v2[3] = &unk_1E58A88B0;
    v2[4] = &v3;
    __getIMSPIRemoveMessageGUIDFromSyndicationSymbolLoc_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19BE8201C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __IMCoreLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  IMCoreLibraryCore_frameworkLibrary_2 = result;
  return result;
}

void *__getIMSPIRemoveMessageGUIDFromSyndicationSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)IMCoreLibraryCore_0();
  if (!v2)
  {
    uint64_t v4 = (void *)abort_report_np();
    free(v4);
  }
  uint64_t result = dlsym(v2, "IMSPIRemoveMessageGUIDFromSyndication");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIMSPIRemoveMessageGUIDFromSyndicationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19BE822E8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_19BE82928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19BE83030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19BE83290(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_19BE833E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_19BE839F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_19BE83C7C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_19BE84AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKContainerSetupInfoClass_block_invoke_1(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CloudKitLibraryCore_frameworkLibrary_1)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CloudKitLibraryCore_block_invoke_1;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E58AA2F0;
    uint64_t v6 = 0;
    CloudKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!CloudKitLibraryCore_frameworkLibrary_1)
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
    Class result = objc_getClass("CKContainerSetupInfo");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getCKContainerSetupInfoClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCKContainerSetupInfoClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CloudKitLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  CloudKitLibraryCore_frameworkLibrary_1 = result;
  return result;
}

uint64_t static SecKeyRef.SecKeyConversionErrors.== infix(_:_:)()
{
  return 1;
}

void SecKeyRef.SecKeyConversionErrors.hash(into:)()
{
}

Swift::Int SecKeyRef.SecKeyConversionErrors.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance SecKeyRef.SecKeyConversionErrors()
{
  return 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SecKeyRef.SecKeyConversionErrors()
{
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance SecKeyRef.SecKeyConversionErrors()
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SecKeyRef.SecKeyConversionErrors()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Error._domain.getter in conformance SecKeyRef.SecKeyConversionErrors()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t protocol witness for Error._code.getter in conformance SecKeyRef.SecKeyConversionErrors()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t protocol witness for Error._userInfo.getter in conformance SecKeyRef.SecKeyConversionErrors()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance SecKeyRef.SecKeyConversionErrors()
{
  return MEMORY[0x1F4185E00]();
}

void SecKeyRef.p256PublicKey.getter()
{
  CFDataRef v1 = SecKeyCopyExternalRepresentation(v0, 0);
  if (v1)
  {
    CFDataRef v2 = v1;
    v13[0] = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v13[1] = v3;
    P256.Signing.PublicKey.init<A>(x963Representation:)();
  }
  else
  {
    if (one-time initialization token for default != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    __swift_project_value_buffer(v4, (uint64_t)static Log.default);
    long long v5 = v0;
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      v13[0] = v9;
      *(_DWORD *)uint64_t v8 = 136315138;
      uint64_t v14 = (uint64_t)v5;
      type metadata accessor for SecKeyRef(0);
      long long v10 = v5;
      uint64_t v11 = String.init<A>(reflecting:)();
      uint64_t v14 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v12, v13);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_19BE17000, v6, v7, "Failed to create external representation of current SecKey %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x19F392080](v9, -1, -1);
      MEMORY[0x19F392080](v8, -1, -1);
    }
    else
    {
    }
    lazy protocol witness table accessor for type SecKeyRef.SecKeyConversionErrors and conformance SecKeyRef.SecKeyConversionErrors();
    swift_allocError();
    swift_willThrow();
  }
}

SecKeyRef P256.Signing.PublicKey.secKey.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19BED15B0;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v1;
  CFDataRef v2 = (void *)*MEMORY[0x1E4F3B740];
  type metadata accessor for CFStringRef(0);
  uint64_t v4 = v3;
  *(void *)(inited + 72) = v3;
  *(void *)(inited + 48) = v2;
  *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 88) = v5;
  uint64_t v6 = (void *)*MEMORY[0x1E4F3B6F0];
  *(void *)(inited + 120) = v4;
  *(void *)(inited + 96) = v6;
  id v7 = v2;
  id v8 = v6;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  uint64_t v9 = MEMORY[0x19F390570]();
  unint64_t v11 = v10;
  CFDataRef isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v9, v11);
  CFDictionaryRef v13 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  SecKeyRef v14 = SecKeyCreateWithData(isa, v13, 0);

  return v14;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Any>);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    outlined init with copy of (NSAttributedStringKey, Any)(v6, (uint64_t)&v15, &demangling cache variable for type metadata for (String, Any));
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *unint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)outlined init with take of Any(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  long long v14;

  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef?, Any>);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    outlined init with copy of (NSAttributedStringKey, Any)(v6, (uint64_t)&v13, &demangling cache variable for type metadata for (CFStringRef?, Any));
    uint64_t v7 = v13;
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)outlined init with take of Any(&v14, (_OWORD *)(v3[7] + 32 * result));
    char v10 = v3[2];
    unint64_t v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

{
  return specialized Dictionary.init(dictionaryLiteral:)(a1, &demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, [CFStringRef? : Any]>);
}

{
  void *v2;
  uint64_t v3;
  void **v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef?, CFStringRef>);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *(v4 - 1);
    uint64_t v6 = *v4;
    uint64_t v7 = v5;
    uint64_t v8 = v6;
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v5);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v11 = 8 * result;
    *(void *)(v2[6] + v11) = v5;
    *(void *)(v2[7] + v11) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

{
  return specialized Dictionary.init(dictionaryLiteral:)(a1, &demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, [CFStringRef? : CFStringRef]>);
}

{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  long long v14;

  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<NSAttributedStringKey, Any>);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    outlined init with copy of (NSAttributedStringKey, Any)(v6, (uint64_t)&v13, &demangling cache variable for type metadata for (NSAttributedStringKey, Any));
    uint64_t v7 = v13;
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)outlined init with take of Any(&v14, (_OWORD *)(v3[7] + 32 * result));
    char v10 = v3[2];
    unint64_t v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

{
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, Int>);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    uint64_t v6 = (id)*(v4 - 1);
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    char v10 = v2[2];
    unint64_t v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v4 += 2;
    v2[2] = v12;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

{
  return specialized Dictionary.init(dictionaryLiteral:)(a1, &demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, [CFStringRef : Int]>);
}

{
  void *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, SWPersonIdentity>);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    uint64_t v8 = v7;
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *unint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  long long v14;

  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, Any>);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    outlined init with copy of (NSAttributedStringKey, Any)(v6, (uint64_t)&v13, &demangling cache variable for type metadata for (CFStringRef, Any));
    uint64_t v7 = v13;
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)outlined init with take of Any(&v14, (_OWORD *)(v3[7] + 32 * result));
    char v10 = v3[2];
    unint64_t v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

{
  return specialized Dictionary.init(dictionaryLiteral:)(a1, &demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, [CFStringRef : Any]>);
}

{
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, CGFloat>);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    uint64_t v6 = (id)*(v4 - 1);
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    char v10 = v2[2];
    unint64_t v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

{
  return specialized Dictionary.init(dictionaryLiteral:)(a1, &demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, [CFStringRef : CGFloat]>);
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v6 = *v5;
    id v7 = (id)*(v5 - 1);
    swift_bridgeObjectRetain();
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v7);
    if (v9) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v3[6] + v10) = v7;
    *(void *)(v3[7] + v10) = v6;
    uint64_t v11 = v3[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v3[2] = v13;
    v5 += 2;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t P256.Signing.PublicKey.secKeyData.getter()
{
  error[1] = *(CFErrorRef *)MEMORY[0x1E4F143B8];
  uint64_t v0 = P256.Signing.PublicKey.secKey.getter();
  if (v0)
  {
    uint64_t v1 = v0;
    error[0] = 0;
    CFDataRef v2 = SecKeyCopyExternalRepresentation(v0, error);
    if (v2)
    {
      CFDataRef v3 = v2;
      static Data._conditionallyBridgeFromObjectiveC(_:result:)();
    }
    if (error[0]) {
  }
    }
  return 0;
}

id default argument 2 of KeyQueryController.init(service:targetQueue:queryController:)@<X0>(void *a1@<X8>)
{
  id result = objc_msgSend(self, sel_sharedInstance);
  if (result)
  {
    id v3 = result;
    id result = (id)type metadata accessor for IDSIDQueryController();
    a1[3] = result;
    a1[4] = &protocol witness table for IDSIDQueryController;
    *a1 = v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t lazy protocol witness table accessor for type SecKeyRef.SecKeyConversionErrors and conformance SecKeyRef.SecKeyConversionErrors()
{
  unint64_t result = lazy protocol witness table cache variable for type SecKeyRef.SecKeyConversionErrors and conformance SecKeyRef.SecKeyConversionErrors;
  if (!lazy protocol witness table cache variable for type SecKeyRef.SecKeyConversionErrors and conformance SecKeyRef.SecKeyConversionErrors)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SecKeyRef.SecKeyConversionErrors and conformance SecKeyRef.SecKeyConversionErrors);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SecKeyRef.SecKeyConversionErrors and conformance SecKeyRef.SecKeyConversionErrors;
  if (!lazy protocol witness table cache variable for type SecKeyRef.SecKeyConversionErrors and conformance SecKeyRef.SecKeyConversionErrors)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SecKeyRef.SecKeyConversionErrors and conformance SecKeyRef.SecKeyConversionErrors);
  }
  return result;
}

uint64_t default argument 2 of PersonIdentityGenerator.paddedPublicKeys(for:using:alignment:)()
{
  return 32;
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NSAttributedStringKey(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NSAttributedStringKey(a1, a2, MEMORY[0x1E4F27EB8]);
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance NSAttributedStringKey(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance NSAttributedStringKey(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance NSAttributedStringKey@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v3 = MEMORY[0x19F3906A0](v2);
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance NSAttributedStringKey(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NSAttributedStringKey(a1, a2, MEMORY[0x1E4FBB198]);
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NSAttributedStringKey(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NSAttributedStringKey()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance NSAttributedStringKey()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance CFStringRef()
{
  return _CFObject.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance CFStringRef()
{
  return _CFObject.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CFStringRef()
{
  return Hasher._finalize()();
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance SLCollaborationAttributionViewMetricVariant@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance UIContentSizeCategory()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance CFStringRef()
{
  swift_getWitnessTable();
  return static _CFObject.== infix(_:_:)();
}

void protocol witness for RawRepresentable.rawValue.getter in conformance IDSIDStatus(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance NSAttributedStringKey@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = MEMORY[0x19F3906A0](*a1, a1[1]);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance NSAttributedStringKey@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance NSAttributedStringKey(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, type metadata accessor for NSAttributedStringKey);
  uint64_t v3 = lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, type metadata accessor for NSAttributedStringKey);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];
  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void type metadata accessor for SecKeyRef(uint64_t a1)
{
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void type metadata accessor for CFStringRef(uint64_t a1)
{
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

unint64_t type metadata accessor for IDSIDQueryController()
{
  unint64_t result = lazy cache variable for type metadata for IDSIDQueryController;
  if (!lazy cache variable for type metadata for IDSIDQueryController)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for IDSIDQueryController);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SecKeyRef.SecKeyConversionErrors(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for SecKeyRef.SecKeyConversionErrors(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x19BE874E8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t getEnumTag for SecKeyRef.SecKeyConversionErrors()
{
  return 0;
}

ValueMetadata *type metadata accessor for SecKeyRef.SecKeyConversionErrors()
{
  return &type metadata for SecKeyRef.SecKeyConversionErrors;
}

void type metadata accessor for SLHighlightPillMetricVariant(uint64_t a1)
{
}

void type metadata accessor for CFNumberRef(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for _NSRange(uint64_t a1)
{
}

void type metadata accessor for SLCollaborationAttributionViewMetricVariant(uint64_t a1)
{
}

void type metadata accessor for SLHighlightDisambiguationPillMetricVariant(uint64_t a1)
{
}

uint64_t base witness table accessor for Hashable in CFStringRef()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, type metadata accessor for CFStringRef);
}

uint64_t base witness table accessor for Equatable in CFStringRef()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, type metadata accessor for CFStringRef);
}

uint64_t lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t outlined init with copy of (NSAttributedStringKey, Any)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void type metadata accessor for CGColorRef(uint64_t a1)
{
}

void type metadata accessor for CTFontRef(uint64_t a1)
{
}

void type metadata accessor for NSAttributedStringKey(uint64_t a1)
{
}

void type metadata accessor for CTLineRef(uint64_t a1)
{
}

uint64_t getEnumTagSinglePayload for CGSize(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CGSize(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for NSEdgeInsets(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for NSEdgeInsets(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for NSEdgeInsets(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for NSEdgeInsets(uint64_t a1)
{
}

void type metadata accessor for SecKeyRef(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t base witness table accessor for RawRepresentable in NSAttributedStringKey()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, type metadata accessor for NSAttributedStringKey);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in NSAttributedStringKey()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, type metadata accessor for NSAttributedStringKey);
}

uint64_t base witness table accessor for Equatable in NSAttributedStringKey()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, type metadata accessor for NSAttributedStringKey);
}

void ConversationAttributionView.attribution.getter()
{
  uint64_t v1 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
  if (!v1) {
    goto LABEL_12;
  }
  uint64_t v2 = v1;
  id v3 = objc_msgSend(v1, sel_attributions);

  type metadata accessor for SLAttribution();
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v4 >> 62))
  {
    if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_4;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v6) {
    goto LABEL_9;
  }
LABEL_4:
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_10:
    MEMORY[0x19F390AB0](0, v4);
    goto LABEL_7;
  }
  if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v5 = *(id *)(v4 + 32);
LABEL_7:
    swift_bridgeObjectRelease();
    return;
  }
  __break(1u);
LABEL_12:
  __break(1u);
}

unint64_t type metadata accessor for SLAttribution()
{
  unint64_t result = lazy cache variable for type metadata for SLAttribution;
  if (!lazy cache variable for type metadata for SLAttribution)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for SLAttribution);
  }
  return result;
}

void ConversationAttributionView.__allocating_init(variant:)()
{
}

id ConversationAttributionView.__allocating_init(highlight:variant:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = specialized CollaborationAttributionView.init(highlight:variant:)(a1, 2);

  return v4;
}

id ConversationAttributionView.__allocating_init(attribution:maxWidth:)(void *a1, double a2)
{
  id v5 = objc_allocWithZone(v2);
  id v6 = objc_msgSend(objc_allocWithZone((Class)SLCollaborationHighlight), sel_initWithAttribution_, a1);
  id v7 = specialized CollaborationAttributionView.init(highlight:variant:)(v6, 2);
  objc_msgSend(v7, sel_setMaxWidth_, a2);

  return v7;
}

id ConversationAttributionView.init(attribution:maxWidth:)(void *a1, double a2)
{
  id v4 = objc_msgSend(objc_allocWithZone((Class)SLCollaborationHighlight), sel_initWithAttribution_, a1);
  id v5 = specialized CollaborationAttributionView.init(highlight:variant:)(v4, 2);
  objc_msgSend(v5, sel_setMaxWidth_, a2);

  return v5;
}

id ConversationAttributionView.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

uint64_t ConversationAttributionView.init(coder:)(void *a1)
{
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

id ConversationAttributionView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConversationAttributionView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ConversationAttributionView()
{
  return self;
}

uint64_t method lookup function for ConversationAttributionView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ConversationAttributionView);
}

uint64_t dispatch thunk of ConversationAttributionView.attribution.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of ConversationAttributionView.__allocating_init(attribution:maxWidth:)()
{
  return (*(uint64_t (**)(void))(v0 + 352))();
}

unint64_t specialized GenericPasswordConvertible.description.getter()
{
  type metadata accessor for SymmetricKey();
  lazy protocol witness table accessor for type SymmetricKey and conformance SymmetricKey(&lazy protocol witness table cache variable for type SymmetricKey and conformance SymmetricKey);
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
  switch(v10 >> 62)
  {
    case 1uLL:
      if (v9 >> 32 < (int)v9)
      {
        __break(1u);
LABEL_13:
        __break(1u);
LABEL_14:
        __break(1u);
LABEL_15:
        __break(1u);
        JUMPOUT(0x19BE882B8);
      }
      outlined copy of Data._Representation(v9, v10);
      if (__DataStorage._bytes.getter() && __OFSUB__((int)v9, __DataStorage._offset.getter())) {
        goto LABEL_14;
      }
      __DataStorage._length.getter();
      _StringGuts.grow(_:)(37);
      swift_bridgeObjectRelease();
      v0._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v0);
      swift_bridgeObjectRelease();
      v1._countAndFlagsBits = 0x2E736574796220;
      v1._object = (void *)0xE700000000000000;
      String.append(_:)(v1);
      outlined consume of Data._Representation(v9, v10);
LABEL_11:
      outlined consume of Data._Representation(v9, v10);
      return 0xD00000000000001CLL;
    case 2uLL:
      uint64_t v2 = *(void *)(v9 + 16);
      uint64_t v3 = *(void *)(v9 + 24);
      swift_retain();
      swift_retain();
      if (__DataStorage._bytes.getter() && __OFSUB__(v2, __DataStorage._offset.getter())) {
        goto LABEL_15;
      }
      if (__OFSUB__(v3, v2)) {
        goto LABEL_13;
      }
      __DataStorage._length.getter();
      _StringGuts.grow(_:)(37);
      swift_bridgeObjectRelease();
      v4._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v4);
      swift_bridgeObjectRelease();
      v5._countAndFlagsBits = 0x2E736574796220;
      v5._object = (void *)0xE700000000000000;
      String.append(_:)(v5);
      swift_release();
      swift_release();
      goto LABEL_11;
    default:
      _StringGuts.grow(_:)(37);
      swift_bridgeObjectRelease();
      v6._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v6);
      swift_bridgeObjectRelease();
      v7._countAndFlagsBits = 0x2E736574796220;
      v7._object = (void *)0xE700000000000000;
      String.append(_:)(v7);
      goto LABEL_11;
  }
}

unint64_t GenericPasswordConvertible.description.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (*(uint64_t (**)(void))(a2 + 24))();
  uint64_t v4 = v2;
  unint64_t v5 = v3;
  switch(v3 >> 62)
  {
    case 1uLL:
      if (v2 >> 32 < (int)v2)
      {
        __break(1u);
LABEL_13:
        __break(1u);
LABEL_14:
        __break(1u);
LABEL_15:
        __break(1u);
        JUMPOUT(0x19BE88604);
      }
      outlined copy of Data._Representation(v2, v3);
      if (__DataStorage._bytes.getter() && __OFSUB__((int)v4, __DataStorage._offset.getter())) {
        goto LABEL_14;
      }
      __DataStorage._length.getter();
      _StringGuts.grow(_:)(37);
      swift_bridgeObjectRelease();
      v6._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v6);
      swift_bridgeObjectRelease();
      v7._countAndFlagsBits = 0x2E736574796220;
      v7._object = (void *)0xE700000000000000;
      String.append(_:)(v7);
      outlined consume of Data._Representation(v4, v5);
LABEL_11:
      outlined consume of Data._Representation(v4, v5);
      return 0xD00000000000001CLL;
    case 2uLL:
      uint64_t v8 = *(void *)(v2 + 16);
      uint64_t v9 = *(void *)(v2 + 24);
      swift_retain();
      swift_retain();
      if (__DataStorage._bytes.getter() && __OFSUB__(v8, __DataStorage._offset.getter())) {
        goto LABEL_15;
      }
      if (__OFSUB__(v9, v8)) {
        goto LABEL_13;
      }
      __DataStorage._length.getter();
      _StringGuts.grow(_:)(37);
      swift_bridgeObjectRelease();
      v10._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v10);
      swift_bridgeObjectRelease();
      v11._countAndFlagsBits = 0x2E736574796220;
      v11._object = (void *)0xE700000000000000;
      String.append(_:)(v11);
      swift_release();
      swift_release();
      goto LABEL_11;
    default:
      _StringGuts.grow(_:)(37);
      swift_bridgeObjectRelease();
      v12._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v12);
      swift_bridgeObjectRelease();
      v13._countAndFlagsBits = 0x2E736574796220;
      v13._object = (void *)0xE700000000000000;
      String.append(_:)(v13);
      goto LABEL_11;
  }
}

uint64_t outlined copy of Data._Representation(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t SymmetricKey.init<A>(rawRepresentation:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  SymmetricKey.init<A>(data:)();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
}

uint64_t SymmetricKey.rawRepresentation.getter()
{
  type metadata accessor for SymmetricKey();
  lazy protocol witness table accessor for type SymmetricKey and conformance SymmetricKey(&lazy protocol witness table cache variable for type SymmetricKey and conformance SymmetricKey);
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
  return v1;
}

uint64_t ContiguousBytes.dataRepresentation.getter()
{
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
  return v1;
}

uint64_t protocol witness for GenericPasswordConvertible.init<A>(rawRepresentation:) in conformance SymmetricKey(uint64_t a1, uint64_t a2)
{
  return SymmetricKey.init<A>(rawRepresentation:)(a1, a2);
}

uint64_t protocol witness for GenericPasswordConvertible.rawRepresentation.getter in conformance SymmetricKey()
{
  lazy protocol witness table accessor for type SymmetricKey and conformance SymmetricKey(&lazy protocol witness table cache variable for type SymmetricKey and conformance SymmetricKey);
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
  return v1;
}

void closure #1 in ContiguousBytes.dataRepresentation.getter(UInt8 *bytes@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  if (bytes) {
    CFIndex v4 = a2 - (void)bytes;
  }
  else {
    CFIndex v4 = 0;
  }
  CFDataRef v5 = CFDataCreateWithBytesNoCopy(0, bytes, v4, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  if (v5)
  {
    CFDataRef v6 = v5;
    uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v9 = 0xC000000000000000;
  }
  *a3 = v7;
  a3[1] = v9;
}

uint64_t instantiation function for generic protocol witness table for SymmetricKey(uint64_t a1)
{
  uint64_t result = lazy protocol witness table accessor for type SymmetricKey and conformance SymmetricKey(&lazy protocol witness table cache variable for type SymmetricKey and conformance SymmetricKey);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t lazy protocol witness table accessor for type SymmetricKey and conformance SymmetricKey(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for SymmetricKey();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t dispatch thunk of GenericPasswordConvertible.init<A>(rawRepresentation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of GenericPasswordConvertible.rawRepresentation.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

void specialized HighlightDisambiguationPillMetricVariant.heightOfTallestItem.getter(void *a1, id a2)
{
  if (objc_msgSend(a2, sel_isGroupConversation))
  {
    if (objc_msgSend(a1, sel_layoutDirection) == (id)1) {
      unint64_t v3 = 0xEC0000007466656CLL;
    }
    else {
      unint64_t v3 = 0xED00007468676972;
    }
    id v4 = a1;
    CFDataRef v5 = (void *)MEMORY[0x19F3906A0](0x2E6E6F7276656863, v3);
    swift_bridgeObjectRelease();
    id v6 = SLDSystemVectorGlyphWithSlotStyle(v4, v5, 1, 4, 10.0);

    objc_msgSend(v6, sel_contentBounds);
    uint64_t v7 = (const __CTFont *)MEMORY[0x1E4F246A0];
    unint64_t v8 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(MEMORY[0x1E4F246A0], 17.0);
    CTFontGetAscent(v8);

    unint64_t v9 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(v7, 17.0);
    CTFontGetDescent(v9);

    Swift::String v10 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(v7, 17.0);
    CTFontGetLeading(v10);

    Swift::String v11 = (const __CTFont *)MEMORY[0x1E4F246C0];
    Swift::String v12 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(MEMORY[0x1E4F246C0], 15.0);
    CTFontGetAscent(v12);

    Swift::String v13 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(v11, 15.0);
    CTFontGetDescent(v13);

    uint64_t v14 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(v11, 15.0);
    CTFontGetLeading(v14);
  }
  else
  {
    uint64_t v15 = (const __CTFont *)MEMORY[0x1E4F246A0];
    uint64_t v16 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(MEMORY[0x1E4F246A0], 17.0);
    CTFontGetAscent(v16);

    long long v17 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(v15, 17.0);
    CTFontGetDescent(v17);

    long long v18 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(v15, 17.0);
    CTFontGetLeading(v18);
  }
}

{
  unint64_t v3;
  id v4;
  void *v5;
  id v6;
  const __CTFont *v7;
  const __CTFont *v8;
  const __CTFont *v9;
  const __CTFont *v10;
  const __CTFont *v11;
  const __CTFont *v12;
  const __CTFont *v13;
  const __CTFont *v14;
  const __CTFont *v15;

  if (objc_msgSend(a2, sel_isGroupConversation))
  {
    if (objc_msgSend(a1, sel_layoutDirection) == (id)1) {
      unint64_t v3 = 0xEC0000007466656CLL;
    }
    else {
      unint64_t v3 = 0xED00007468676972;
    }
    id v4 = a1;
    CFDataRef v5 = (void *)MEMORY[0x19F3906A0](0x2E6E6F7276656863, v3);
    swift_bridgeObjectRelease();
    id v6 = SLDSystemVectorGlyphWithSlotStyle(v4, v5, 1, 4, 10.0);

    objc_msgSend(v6, sel_contentBounds);
    uint64_t v7 = specialized VisionDisambiguationPillMetric.firstLineFont.getter((CTFontRef)v4);
    CTFontGetAscent(v7);

    unint64_t v8 = specialized VisionDisambiguationPillMetric.firstLineFont.getter((CTFontRef)v4);
    CTFontGetDescent(v8);

    unint64_t v9 = specialized VisionDisambiguationPillMetric.firstLineFont.getter((CTFontRef)v4);
    CTFontGetLeading(v9);

    Swift::String v10 = specialized VisionDisambiguationPillMetric.secondLineFont.getter((CTFontRef)v4);
    CTFontGetAscent(v10);

    Swift::String v11 = specialized VisionDisambiguationPillMetric.secondLineFont.getter((CTFontRef)v4);
    CTFontGetDescent(v11);

    Swift::String v12 = specialized VisionDisambiguationPillMetric.secondLineFont.getter((CTFontRef)v4);
    CTFontGetLeading(v12);
  }
  else
  {
    Swift::String v13 = specialized VisionDisambiguationPillMetric.firstLineFont.getter((CTFontRef)a1);
    CTFontGetAscent(v13);

    uint64_t v14 = specialized VisionDisambiguationPillMetric.firstLineFont.getter((CTFontRef)a1);
    CTFontGetDescent(v14);

    uint64_t v15 = specialized VisionDisambiguationPillMetric.firstLineFont.getter((CTFontRef)a1);
    CTFontGetLeading(v15);
  }
}

uint64_t (*iOSDisambiguationPillMetric.style.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t (*iOSDisambiguationPillMetric.tag.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

double iOSDisambiguationPillMetric.margins.getter()
{
  return 12.0;
}

double iOSDisambiguationPillMetric.avatarDiameter.getter()
{
  return 40.0;
}

uint64_t iOSDisambiguationPillMetric.useSingleLineLayout.getter(int a1, id a2)
{
  return objc_msgSend(a2, sel_isGroupConversation) ^ 1;
}

double iOSDisambiguationPillMetric.labelHorizontalMargins.getter()
{
  return 0.0;
}

CGColorRef iOSDisambiguationPillMetric.firstLineColor.getter(void *a1)
{
  return iOSDisambiguationPillMetric.firstLineColor.getter(a1, 1.0);
}

CTFontRef iOSDisambiguationPillMetric.firstLineFont.getter()
{
  return specialized iOSDisambiguationPillMetric.firstLineFont.getter(MEMORY[0x1E4F246A0], 17.0);
}

CGColorRef iOSDisambiguationPillMetric.secondLineColor.getter(void *a1)
{
  return iOSDisambiguationPillMetric.firstLineColor.getter(a1, 0.5);
}

CTFontRef iOSDisambiguationPillMetric.secondLineFont.getter()
{
  return specialized iOSDisambiguationPillMetric.firstLineFont.getter(MEMORY[0x1E4F246C0], 15.0);
}

uint64_t protocol witness for HighlightDisambiguationPillMetricVariant.useSingleLineLayout.getter in conformance iOSDisambiguationPillMetric()
{
  return objc_msgSend(*(id *)(v0 + 8), sel_isGroupConversation) ^ 1;
}

double protocol witness for HighlightDisambiguationPillMetricVariant.margins.getter in conformance iOSDisambiguationPillMetric()
{
  return 12.0;
}

double protocol witness for HighlightDisambiguationPillMetricVariant.avatarDiameter.getter in conformance iOSDisambiguationPillMetric()
{
  return 40.0;
}

double protocol witness for HighlightDisambiguationPillMetricVariant.labelHorizontalMargins.getter in conformance iOSDisambiguationPillMetric()
{
  return 0.0;
}

CGColorRef protocol witness for HighlightDisambiguationPillMetricVariant.firstLineColor.getter in conformance iOSDisambiguationPillMetric()
{
  return protocol witness for HighlightDisambiguationPillMetricVariant.firstLineColor.getter in conformance iOSDisambiguationPillMetric(1.0);
}

CTFontRef protocol witness for HighlightDisambiguationPillMetricVariant.firstLineFont.getter in conformance iOSDisambiguationPillMetric()
{
  return specialized iOSDisambiguationPillMetric.firstLineFont.getter(MEMORY[0x1E4F246A0], 17.0);
}

CGColorRef protocol witness for HighlightDisambiguationPillMetricVariant.secondLineColor.getter in conformance iOSDisambiguationPillMetric()
{
  return protocol witness for HighlightDisambiguationPillMetricVariant.firstLineColor.getter in conformance iOSDisambiguationPillMetric(0.5);
}

CTFontRef protocol witness for HighlightDisambiguationPillMetricVariant.secondLineFont.getter in conformance iOSDisambiguationPillMetric()
{
  return specialized iOSDisambiguationPillMetric.firstLineFont.getter(MEMORY[0x1E4F246C0], 15.0);
}

double protocol witness for HighlightDisambiguationPillMetricVariant.chevronLeadingMargin.getter in conformance iOSDisambiguationPillMetric()
{
  return 5.0;
}

double protocol witness for HighlightDisambiguationPillMetricVariant.pillHeight.getter in conformance iOSDisambiguationPillMetric()
{
  specialized HighlightDisambiguationPillMetricVariant.heightOfTallestItem.getter(*v0, v0[1]);
  return v1 + 12.0 + 12.0;
}

void protocol witness for HighlightDisambiguationPillMetricVariant.heightOfTallestItem.getter in conformance iOSDisambiguationPillMetric()
{
  specialized HighlightDisambiguationPillMetricVariant.heightOfTallestItem.getter(*v0, v0[1]);
}

double protocol witness for HighlightDisambiguationPillMetricVariant.firstLineFontHeight.getter in conformance iOSDisambiguationPillMetric(uint64_t a1, uint64_t a2)
{
  return protocol witness for HighlightDisambiguationPillMetricVariant.firstLineFontHeight.getter in conformance iOSDisambiguationPillMetric(17.0, a1, a2, MEMORY[0x1E4F246A0]);
}

double protocol witness for HighlightDisambiguationPillMetricVariant.secondLineFontHeight.getter in conformance iOSDisambiguationPillMetric(uint64_t a1, uint64_t a2)
{
  return protocol witness for HighlightDisambiguationPillMetricVariant.firstLineFontHeight.getter in conformance iOSDisambiguationPillMetric(15.0, a1, a2, MEMORY[0x1E4F246C0]);
}

double protocol witness for HighlightDisambiguationPillMetricVariant.firstLineFontHeight.getter in conformance iOSDisambiguationPillMetric(CGFloat a1, uint64_t a2, uint64_t a3, const __CTFont *a4)
{
  id v6 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(a4, a1);
  double Ascent = CTFontGetAscent(v6);

  unint64_t v8 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(a4, a1);
  double Descent = CTFontGetDescent(v8);

  Swift::String v10 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(a4, a1);
  double Leading = CTFontGetLeading(v10);

  return Ascent + Descent + Leading;
}

id protocol witness for HighlightDisambiguationPillMetricVariant.firstLineAttributedString(from:) in conformance iOSDisambiguationPillMetric(uint64_t a1, uint64_t a2)
{
  return specialized HighlightDisambiguationPillMetricVariant.firstLineAttributedString(from:)(a1, a2, *v2, MEMORY[0x1E4F246A0], 17.0, 1.0);
}

id protocol witness for HighlightDisambiguationPillMetricVariant.secondLineAttributedString(from:) in conformance iOSDisambiguationPillMetric(uint64_t a1, uint64_t a2)
{
  return specialized HighlightDisambiguationPillMetricVariant.firstLineAttributedString(from:)(a1, a2, *v2, MEMORY[0x1E4F246C0], 15.0, 0.5);
}

uint64_t (*VisionDisambiguationPillMetric.style.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t (*VisionDisambiguationPillMetric.tag.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

double VisionDisambiguationPillMetric.margins.getter()
{
  return 20.0;
}

double VisionDisambiguationPillMetric.avatarDiameter.getter()
{
  return 52.0;
}

double VisionDisambiguationPillMetric.labelHorizontalMargins.getter()
{
  return 0.0;
}

CGColorRef VisionDisambiguationPillMetric.firstLineColor.getter()
{
  return CGColorCreateGenericRGB(1.0, 1.0, 1.0, 1.0);
}

CGColorRef VisionDisambiguationPillMetric.secondLineColor.getter()
{
  return CGColorCreateGenericRGB(1.0, 1.0, 1.0, 0.4);
}

id iOSDisambiguationPillMetric.secondLineString.getter(int a1, id a2)
{
  if (objc_msgSend(a2, sel_isGroupConversation)) {
    return specialized static DisambiguationPillMetrics.secondLineString(for:)(a2);
  }
  else {
    return 0;
  }
}

double protocol witness for HighlightDisambiguationPillMetricVariant.margins.getter in conformance VisionDisambiguationPillMetric()
{
  return 20.0;
}

double protocol witness for HighlightDisambiguationPillMetricVariant.avatarDiameter.getter in conformance VisionDisambiguationPillMetric()
{
  return 52.0;
}

double protocol witness for HighlightDisambiguationPillMetricVariant.labelHorizontalMargins.getter in conformance VisionDisambiguationPillMetric()
{
  return 0.0;
}

CGColorRef protocol witness for HighlightDisambiguationPillMetricVariant.firstLineColor.getter in conformance VisionDisambiguationPillMetric()
{
  return CGColorCreateGenericRGB(1.0, 1.0, 1.0, 1.0);
}

CTFontRef protocol witness for HighlightDisambiguationPillMetricVariant.firstLineFont.getter in conformance VisionDisambiguationPillMetric()
{
  return specialized VisionDisambiguationPillMetric.firstLineFont.getter(*v0);
}

CGColorRef protocol witness for HighlightDisambiguationPillMetricVariant.secondLineColor.getter in conformance VisionDisambiguationPillMetric()
{
  return CGColorCreateGenericRGB(1.0, 1.0, 1.0, 0.4);
}

CTFontRef protocol witness for HighlightDisambiguationPillMetricVariant.secondLineFont.getter in conformance VisionDisambiguationPillMetric()
{
  return specialized VisionDisambiguationPillMetric.secondLineFont.getter(*v0);
}

id protocol witness for HighlightDisambiguationPillMetricVariant.secondLineString.getter in conformance iOSDisambiguationPillMetric()
{
  double v1 = *(void **)(v0 + 8);
  if (objc_msgSend(v1, sel_isGroupConversation)) {
    return specialized static DisambiguationPillMetrics.secondLineString(for:)(v1);
  }
  else {
    return 0;
  }
}

double protocol witness for HighlightDisambiguationPillMetricVariant.pillHeight.getter in conformance VisionDisambiguationPillMetric()
{
  specialized HighlightDisambiguationPillMetricVariant.heightOfTallestItem.getter(*v0, v0[1]);
  return v1 + 20.0 + 20.0;
}

void protocol witness for HighlightDisambiguationPillMetricVariant.heightOfTallestItem.getter in conformance VisionDisambiguationPillMetric()
{
  specialized HighlightDisambiguationPillMetricVariant.heightOfTallestItem.getter(*v0, v0[1]);
}

double protocol witness for HighlightDisambiguationPillMetricVariant.firstLineFontHeight.getter in conformance VisionDisambiguationPillMetric(uint64_t a1, uint64_t a2)
{
  return protocol witness for HighlightDisambiguationPillMetricVariant.firstLineFontHeight.getter in conformance VisionDisambiguationPillMetric(a1, a2, (uint64_t (*)(uint64_t))specialized VisionDisambiguationPillMetric.firstLineFont.getter);
}

double protocol witness for HighlightDisambiguationPillMetricVariant.secondLineFontHeight.getter in conformance VisionDisambiguationPillMetric(uint64_t a1, uint64_t a2)
{
  return protocol witness for HighlightDisambiguationPillMetricVariant.firstLineFontHeight.getter in conformance VisionDisambiguationPillMetric(a1, a2, (uint64_t (*)(uint64_t))specialized VisionDisambiguationPillMetric.secondLineFont.getter);
}

double protocol witness for HighlightDisambiguationPillMetricVariant.firstLineFontHeight.getter in conformance VisionDisambiguationPillMetric(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = *v3;
  id v6 = (const __CTFont *)a3(v5);
  double Ascent = CTFontGetAscent(v6);

  unint64_t v8 = (const __CTFont *)a3(v5);
  double Descent = CTFontGetDescent(v8);

  Swift::String v10 = (const __CTFont *)a3(v5);
  double Leading = CTFontGetLeading(v10);

  return Ascent + Descent + Leading;
}

id protocol witness for HighlightDisambiguationPillMetricVariant.firstLineAttributedString(from:) in conformance VisionDisambiguationPillMetric(uint64_t a1, uint64_t a2)
{
  return specialized HighlightDisambiguationPillMetricVariant.firstLineAttributedString(from:)(a1, a2, *v2, (uint64_t (*)(void *))specialized VisionDisambiguationPillMetric.firstLineFont.getter, 1.0);
}

id protocol witness for HighlightDisambiguationPillMetricVariant.secondLineAttributedString(from:) in conformance VisionDisambiguationPillMetric(uint64_t a1, uint64_t a2)
{
  return specialized HighlightDisambiguationPillMetricVariant.firstLineAttributedString(from:)(a1, a2, *v2, (uint64_t (*)(void *))specialized VisionDisambiguationPillMetric.secondLineFont.getter, 0.4);
}

void MacDisambiguationPillMetric.style.setter(void *a1)
{
  id *v1 = a1;
}

uint64_t (*MacDisambiguationPillMetric.style.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

void MacDisambiguationPillMetric.tag.setter(uint64_t a1)
{
  *(void *)(v1 + 8) = a1;
}

uint64_t (*MacDisambiguationPillMetric.tag.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

double MacDisambiguationPillMetric.margins.getter()
{
  return 0.0;
}

double MacDisambiguationPillMetric.avatarDiameter.getter()
{
  return 16.0;
}

uint64_t MacDisambiguationPillMetric.useChevron.getter()
{
  return 1;
}

double MacDisambiguationPillMetric.labelHorizontalMargins.getter()
{
  return 0.0;
}

CGColorRef MacDisambiguationPillMetric.firstLineColor.getter(void *a1)
{
  return iOSDisambiguationPillMetric.firstLineColor.getter(a1, 1.0);
}

CGColorRef iOSDisambiguationPillMetric.firstLineColor.getter(void *a1, CGFloat a2)
{
  if (objc_msgSend(a1, sel_userInterfaceStyle) == (id)1)
  {
    CGFloat v3 = 1.0;
    CGFloat v4 = 1.0;
    CGFloat v5 = 1.0;
  }
  else
  {
    CGFloat v3 = 0.0;
    CGFloat v4 = 0.0;
    CGFloat v5 = 0.0;
  }
  return CGColorCreateGenericRGB(v3, v4, v5, a2);
}

uint64_t MacDisambiguationPillMetric.firstLineFont.getter()
{
  UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontMenuItem, 0.0, 0);
  if (UIFontForLanguage)
  {
    uint64_t v1 = UIFontForLanguage;
    CTFontRef CopyWithSymbolicTraits = CTFontCreateCopyWithSymbolicTraits(UIFontForLanguage, 0.0, 0, 2u, 2u);

    if (CopyWithSymbolicTraits) {
      return (uint64_t)CopyWithSymbolicTraits;
    }
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void MacDisambiguationPillMetric.secondLineColor.getter()
{
}

void MacDisambiguationPillMetric.secondLineFont.getter()
{
}

void MacDisambiguationPillMetric.secondLineString.getter()
{
}

id protocol witness for HighlightDisambiguationPillMetricVariant.tag.getter in conformance MacDisambiguationPillMetric()
{
  return *(id *)(v0 + 8);
}

double protocol witness for HighlightDisambiguationPillMetricVariant.margins.getter in conformance MacDisambiguationPillMetric()
{
  return 0.0;
}

double protocol witness for HighlightDisambiguationPillMetricVariant.avatarDiameter.getter in conformance MacDisambiguationPillMetric()
{
  return 16.0;
}

double protocol witness for HighlightDisambiguationPillMetricVariant.labelHorizontalMargins.getter in conformance MacDisambiguationPillMetric()
{
  return 0.0;
}

CGColorRef protocol witness for HighlightDisambiguationPillMetricVariant.firstLineColor.getter in conformance iOSDisambiguationPillMetric(CGFloat a1)
{
  if (objc_msgSend(*v1, sel_userInterfaceStyle) == (id)1)
  {
    CGFloat v3 = 1.0;
    CGFloat v4 = 1.0;
    CGFloat v5 = 1.0;
  }
  else
  {
    CGFloat v3 = 0.0;
    CGFloat v4 = 0.0;
    CGFloat v5 = 0.0;
  }
  return CGColorCreateGenericRGB(v3, v4, v5, a1);
}

uint64_t protocol witness for HighlightDisambiguationPillMetricVariant.firstLineFont.getter in conformance MacDisambiguationPillMetric()
{
  UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontMenuItem, 0.0, 0);
  if (UIFontForLanguage)
  {
    uint64_t v1 = UIFontForLanguage;
    CTFontRef CopyWithSymbolicTraits = CTFontCreateCopyWithSymbolicTraits(UIFontForLanguage, 0.0, 0, 2u, 2u);

    if (CopyWithSymbolicTraits) {
      return (uint64_t)CopyWithSymbolicTraits;
    }
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t protocol witness for HighlightDisambiguationPillMetricVariant.firstLineString.getter in conformance MacDisambiguationPillMetric()
{
  id v1 = *(id *)(v0 + 8);
  uint64_t v2 = specialized static DisambiguationPillMetrics.firstLineString(for:)(v1);

  return v2;
}

void protocol witness for HighlightDisambiguationPillMetricVariant.secondLineColor.getter in conformance MacDisambiguationPillMetric()
{
}

void protocol witness for HighlightDisambiguationPillMetricVariant.secondLineFont.getter in conformance MacDisambiguationPillMetric()
{
}

void protocol witness for HighlightDisambiguationPillMetricVariant.secondLineString.getter in conformance MacDisambiguationPillMetric()
{
}

double protocol witness for HighlightDisambiguationPillMetricVariant.chevronSize.getter in conformance MacDisambiguationPillMetric()
{
  return specialized HighlightDisambiguationPillMetricVariant.chevronSize.getter(*v0);
}

uint64_t protocol witness for HighlightDisambiguationPillMetricVariant.chevronImage.getter in conformance MacDisambiguationPillMetric()
{
  return specialized HighlightDisambiguationPillMetricVariant.chevronImage.getter(*v0);
}

double protocol witness for HighlightDisambiguationPillMetricVariant.pillHeight.getter in conformance MacDisambiguationPillMetric()
{
  specialized HighlightDisambiguationPillMetricVariant.firstLineFontHeight.getter();
  if (v0 < 16.0) {
    return 16.0;
  }
  else {
    return v0 + 0.0;
  }
}

double protocol witness for HighlightDisambiguationPillMetricVariant.heightOfTallestItem.getter in conformance MacDisambiguationPillMetric()
{
  specialized HighlightDisambiguationPillMetricVariant.firstLineFontHeight.getter();
  return fmax(v0, 16.0);
}

uint64_t protocol witness for HighlightDisambiguationPillMetricVariant.firstLineAttributedString(from:) in conformance MacDisambiguationPillMetric(uint64_t a1, uint64_t a2)
{
  return specialized HighlightDisambiguationPillMetricVariant.firstLineAttributedString(from:)(a1, a2, *v2);
}

id DisambiguationPillMetrics.__allocating_init(slotStyle:tag:)(void *a1, void *a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithSlotStyle_tag_variant_, a1, a2, objc_msgSend(a2, sel_variant));

  return v5;
}

id DisambiguationPillMetrics.init(slotStyle:tag:)(void *a1, id a2)
{
  id v5 = objc_msgSend(v2, sel_initWithSlotStyle_tag_variant_, a1, a2, objc_msgSend(a2, sel_variant));

  return v5;
}

id DisambiguationPillMetrics.__allocating_init(slotStyle:tag:variant:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  return DisambiguationPillMetrics.init(slotStyle:tag:variant:)(a1, a2, a3);
}

id DisambiguationPillMetrics.init(slotStyle:tag:variant:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (uint64_t)&v3[OBJC_IVAR___SLHighlightDisambiguationPillMetrics____lazy_storage___pillMetrics];
  _s11SocialLayer36SLHighlightDisambiguationPillMetrics33_C5DA7C7764DCEDFB9B9BF94750149602LLVSgWOi0_((uint64_t)v14);
  outlined init with take of SLHighlightDisambiguationPillMetrics?((uint64_t)v14, v7);
  switch(a3)
  {
    case 2:
      unint64_t v8 = &v3[OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics];
      unint64_t v9 = &type metadata for VisionDisambiguationPillMetric;
      Swift::String v10 = &protocol witness table for VisionDisambiguationPillMetric;
      goto LABEL_7;
    case 1:
      unint64_t v8 = &v3[OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics];
      unint64_t v9 = &type metadata for MacDisambiguationPillMetric;
      Swift::String v10 = &protocol witness table for MacDisambiguationPillMetric;
LABEL_7:
      *((void *)v8 + 3) = v9;
      *((void *)v8 + 4) = v10;
      *(void *)unint64_t v8 = a1;
      *((void *)v8 + 1) = a2;
      v13.receiver = v3;
      v13.super_class = (Class)type metadata accessor for DisambiguationPillMetrics();
      return objc_msgSendSuper2(&v13, sel_init);
    case 0:
      unint64_t v8 = &v3[OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics];
      unint64_t v9 = &type metadata for iOSDisambiguationPillMetric;
      Swift::String v10 = &protocol witness table for iOSDisambiguationPillMetric;
      goto LABEL_7;
  }
  type metadata accessor for SLHighlightDisambiguationPillMetricVariant(0);
  Swift::String v12 = v3;
  id result = (id)_diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
  __break(1u);
  return result;
}

double DisambiguationPillMetrics.pillMetrics.getter@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics____lazy_storage___pillMetrics;
  outlined init with take of SLHighlightDisambiguationPillMetrics?(v1 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics____lazy_storage___pillMetrics, (uint64_t)v28);
  outlined init with take of SLHighlightDisambiguationPillMetrics?((uint64_t)v28, (uint64_t)v29);
  if (_s11SocialLayer36SLHighlightDisambiguationPillMetrics33_C5DA7C7764DCEDFB9B9BF94750149602LLVSgWOg((uint64_t)v29) == 1)
  {
    closure #1 in DisambiguationPillMetrics.pillMetrics.getter(v1, (uint64_t)&v11);
    v19[4] = v15;
    v19[5] = v16;
    v19[6] = v17;
    v19[7] = v18;
    v19[0] = v11;
    v19[1] = v12;
    v19[2] = v13;
    v19[3] = v14;
    destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors(v19);
    outlined init with take of SLHighlightDisambiguationPillMetrics?((uint64_t)v19, v3);
    long long v24 = v15;
    long long v25 = v16;
    long long v26 = v17;
    long long v27 = v18;
    long long v20 = v11;
    long long v21 = v12;
    long long v4 = v13;
    long long v5 = v14;
  }
  else
  {
    long long v24 = v29[4];
    long long v25 = v29[5];
    long long v26 = v29[6];
    long long v27 = v29[7];
    long long v20 = v29[0];
    long long v21 = v29[1];
    long long v4 = v29[2];
    long long v5 = v29[3];
  }
  long long v22 = v4;
  long long v23 = v5;
  long long v6 = v25;
  a1[4] = v24;
  a1[5] = v6;
  long long v7 = v27;
  a1[6] = v26;
  a1[7] = v7;
  long long v8 = v21;
  *a1 = v20;
  a1[1] = v8;
  double result = *(double *)&v22;
  long long v10 = v23;
  a1[2] = v22;
  a1[3] = v10;
  return result;
}

double closure #1 in DisambiguationPillMetrics.pillMetrics.getter@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = a1 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics;
  outlined init with copy of HighlightDisambiguationPillMetricVariant(a1 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v147);
  uint64_t v4 = v148;
  uint64_t v5 = v149;
  __swift_project_boxed_opaque_existential_1(v147, v148);
  double v6 = (*(double (**)(uint64_t, uint64_t))(v5 + 40))(v4, v5);
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v131 = v11;
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v144);
  uint64_t v12 = v145;
  uint64_t v13 = v146;
  __swift_project_boxed_opaque_existential_1(v144, v145);
  double v130 = (*(double (**)(uint64_t, uint64_t))(v13 + 160))(v12, v13);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v144);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v144);
  uint64_t v14 = v145;
  uint64_t v15 = v146;
  __swift_project_boxed_opaque_existential_1(v144, v145);
  double v129 = (*(double (**)(uint64_t, uint64_t))(v15 + 48))(v14, v15);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v141);
  uint64_t v16 = v142;
  uint64_t v17 = v143;
  __swift_project_boxed_opaque_existential_1(v141, v142);
  char v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 24))(v16, v17);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v138);
  uint64_t v19 = v139;
  uint64_t v20 = v140;
  __swift_project_boxed_opaque_existential_1(v138, v139);
  double v21 = (*(double (**)(uint64_t, uint64_t))(v20 + 56))(v19, v20);
  uint64_t v127 = v22;
  double v128 = v21;
  uint64_t v125 = v24;
  uint64_t v126 = v23;
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
  uint64_t v25 = v136;
  uint64_t v26 = v137;
  __swift_project_boxed_opaque_existential_1(v135, v136);
  double v124 = (*(double (**)(uint64_t, uint64_t))(v26 + 176))(v25, v26);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
  uint64_t v27 = v136;
  uint64_t v28 = v137;
  __swift_project_boxed_opaque_existential_1(v135, v136);
  char v29 = (*(uint64_t (**)(uint64_t, uint64_t))(v28 + 24))(v27, v28);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
  double v30 = 0.0;
  double v31 = 0.0;
  if ((v29 & 1) == 0)
  {
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    uint64_t v32 = v136;
    uint64_t v33 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    double v31 = (*(double (**)(uint64_t, uint64_t))(v33 + 184))(v32, v33);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v138);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v141);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v144);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v147);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
  uint64_t v34 = v136;
  uint64_t v35 = v137;
  __swift_project_boxed_opaque_existential_1(v135, v136);
  uint64_t v36 = (*(uint64_t (**)(uint64_t, uint64_t))(v35 + 16))(v34, v35);
  objc_msgSend((id)v36, sel_maxWidth);
  double v38 = v37;

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
  uint64_t v39 = v136;
  uint64_t v40 = v137;
  __swift_project_boxed_opaque_existential_1(v135, v136);
  LOBYTE(v36) = (*(uint64_t (**)(uint64_t, uint64_t))(v40 + 32))(v39, v40);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
  if (v36)
  {
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    uint64_t v41 = v136;
    uint64_t v42 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    double v30 = (*(double (**)(uint64_t, uint64_t))(v42 + 136))(v41, v42);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
  }
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
  uint64_t v43 = v136;
  uint64_t v44 = v137;
  __swift_project_boxed_opaque_existential_1(v135, v136);
  char v45 = (*(uint64_t (**)(uint64_t, uint64_t))(v44 + 32))(v43, v44);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
  double v46 = 0.0;
  if (v45)
  {
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    uint64_t v47 = v136;
    uint64_t v48 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    double v46 = (*(double (**)(uint64_t, uint64_t))(v48 + 112))(v47, v48);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
  }
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
  uint64_t v49 = v136;
  uint64_t v50 = v137;
  __swift_project_boxed_opaque_existential_1(v135, v136);
  char v51 = (*(uint64_t (**)(uint64_t, uint64_t))(v50 + 24))(v49, v50);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
  if (v51)
  {
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    uint64_t v52 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v132);
    uint64_t v53 = v133;
    uint64_t v54 = v134;
    __swift_project_boxed_opaque_existential_1(v132, v133);
    uint64_t v55 = (*(uint64_t (**)(uint64_t, uint64_t))(v54 + 80))(v53, v54);
    CFAttributedStringRef v56 = (const __CFAttributedString *)(*(uint64_t (**)(uint64_t))(v52 + 192))(v55);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v132);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    uint64_t v57 = v136;
    uint64_t v58 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    (*(void (**)(uint64_t, uint64_t))(v58 + 40))(v57, v58);
    double v60 = v59;
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v132);
    uint64_t v61 = v133;
    uint64_t v62 = v134;
    __swift_project_boxed_opaque_existential_1(v132, v133);
    double v63 = v60 + (*(double (**)(uint64_t, uint64_t))(v62 + 48))(v61, v62);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v132);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    uint64_t v64 = v136;
    uint64_t v65 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    (*(void (**)(uint64_t, uint64_t))(v65 + 56))(v64, v65);
    double v67 = v63 + v66;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    uint64_t v68 = v136;
    uint64_t v69 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    (*(void (**)(uint64_t, uint64_t))(v69 + 56))(v68, v69);
    double v71 = v30 + v46 + v67 + v70;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    uint64_t v72 = v136;
    uint64_t v73 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    (*(void (**)(uint64_t, uint64_t))(v73 + 40))(v72, v73);
    double v75 = v71 + v74;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    v76 = CTLineCreateWithAttributedString(v56);
    CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v76, 0);
    double width = BoundsWithOptions.size.width;

    if (width >= v38 - v75) {
      double v78 = v38 - v75;
    }
    else {
      double v78 = width;
    }
    double v79 = v75 + v78;
    double v80 = 0.0;
    double v81 = 0.0;
  }
  else
  {
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    uint64_t v82 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v132);
    uint64_t v83 = v133;
    uint64_t v84 = v134;
    __swift_project_boxed_opaque_existential_1(v132, v133);
    uint64_t v85 = (*(uint64_t (**)(uint64_t, uint64_t))(v84 + 80))(v83, v84);
    CFAttributedStringRef v86 = (const __CFAttributedString *)(*(uint64_t (**)(uint64_t))(v82 + 192))(v85);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v132);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    uint64_t v87 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v132);
    uint64_t v88 = v133;
    uint64_t v89 = v134;
    __swift_project_boxed_opaque_existential_1(v132, v133);
    uint64_t v90 = (*(uint64_t (**)(uint64_t, uint64_t))(v89 + 104))(v88, v89);
    CFAttributedStringRef v91 = (const __CFAttributedString *)(*(uint64_t (**)(uint64_t))(v87 + 200))(v90);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v132);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    uint64_t v92 = v136;
    uint64_t v93 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    (*(void (**)(uint64_t, uint64_t))(v93 + 40))(v92, v93);
    double v123 = v31;
    double v95 = v94;
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v132);
    uint64_t v96 = v133;
    uint64_t v97 = v134;
    __swift_project_boxed_opaque_existential_1(v132, v133);
    double v98 = v95 + (*(double (**)(uint64_t, uint64_t))(v97 + 48))(v96, v97);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v132);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    uint64_t v99 = v136;
    uint64_t v100 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    (*(void (**)(uint64_t, uint64_t))(v100 + 56))(v99, v100);
    double v102 = v98 + v101;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    uint64_t v103 = v136;
    uint64_t v104 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    (*(void (**)(uint64_t, uint64_t))(v104 + 56))(v103, v104);
    double v106 = v102 + v105;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v3, (uint64_t)v135);
    uint64_t v107 = v136;
    uint64_t v108 = v137;
    __swift_project_boxed_opaque_existential_1(v135, v136);
    (*(void (**)(uint64_t, uint64_t))(v108 + 40))(v107, v108);
    uint64_t v109 = v10;
    uint64_t v110 = v8;
    double v111 = v6;
    double v113 = v106 + v112;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    double v114 = v30 + v46 + v113;
    double v115 = v38 - v113;
    double v116 = v38 - v114;
    v117 = CTLineCreateWithAttributedString(v86);
    v118 = CTLineCreateWithAttributedString(v91);
    CGRect v151 = CTLineGetBoundsWithOptions(v117, 0);
    double v119 = v151.size.width;
    CGRect v152 = CTLineGetBoundsWithOptions(v118, 0);
    double v120 = v152.size.width;

    if (v119 >= v115) {
      double v78 = v115;
    }
    else {
      double v78 = v119;
    }
    if (v120 >= v116) {
      double v80 = v116;
    }
    else {
      double v80 = v120;
    }
    double v81 = v123;
    if (v78 > v80) {
      double v121 = v78;
    }
    else {
      double v121 = v80;
    }
    double v79 = v113 + v121;
    double v6 = v111;
    uint64_t v8 = v110;
    uint64_t v10 = v109;
  }
  *(double *)a2 = v6;
  *(void *)(a2 + 8) = v8;
  *(void *)(a2 + 16) = v10;
  *(void *)(a2 + 24) = v131;
  *(double *)(a2 + 32) = v79;
  *(double *)(a2 + 40) = v130;
  *(double *)(a2 + 48) = v129;
  *(unsigned char *)(a2 + 56) = v18 & 1;
  *(double *)(a2 + 64) = v128;
  *(void *)(a2 + 72) = v127;
  *(void *)(a2 + 80) = v126;
  *(void *)(a2 + 88) = v125;
  *(double *)(a2 + 96) = v78;
  double result = v124;
  *(double *)(a2 + 104) = v124;
  *(double *)(a2 + 112) = v80;
  *(double *)(a2 + 120) = v81;
  return result;
}

uint64_t static DisambiguationPillMetrics.accessibilityLabel(for:)(void *a1)
{
  uint64_t v2 = specialized static DisambiguationPillMetrics.firstLineString(for:)(a1);
  id v3 = specialized static DisambiguationPillMetrics.secondLineString(for:)(a1);
  uint64_t v5 = v4;
  swift_bridgeObjectRetain();
  v6._countAndFlagsBits = (uint64_t)v3;
  v6._object = v5;
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2;
}

id DisambiguationPillMetrics.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void DisambiguationPillMetrics.init()()
{
}

id DisambiguationPillMetrics.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DisambiguationPillMetrics();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

double DisambiguationPillMetrics.margins.getter()
{
  DisambiguationPillMetrics.pillMetrics.getter(&v1);
  return *(double *)&v1;
}

double DisambiguationPillMetrics.pillHeight.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics;
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v11);
  uint64_t v2 = v12;
  uint64_t v3 = v13;
  __swift_project_boxed_opaque_existential_1(v11, v12);
  double v4 = (*(double (**)(uint64_t, uint64_t))(v3 + 40))(v2, v3);
  double v6 = v5;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v1, (uint64_t)v11);
  uint64_t v7 = v12;
  uint64_t v8 = v13;
  __swift_project_boxed_opaque_existential_1(v11, v12);
  double v9 = v4 + (*(double (**)(uint64_t, uint64_t))(v8 + 168))(v7, v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  return v6 + v9;
}

double DisambiguationPillMetrics.pillSize.getter()
{
  DisambiguationPillMetrics.pillMetrics.getter(&v1);
  return v2;
}

double DisambiguationPillMetrics.avatarDiameter.getter()
{
  DisambiguationPillMetrics.pillMetrics.getter(v1);
  return v2;
}

uint64_t DisambiguationPillMetrics.useSingleLineLayout.getter()
{
  DisambiguationPillMetrics.pillMetrics.getter(v1);
  return v2;
}

uint64_t DisambiguationPillMetrics.useChevron.getter()
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v4);
  uint64_t v1 = v5;
  uint64_t v2 = v6;
  __swift_project_boxed_opaque_existential_1(v4, v5);
  LOBYTE(v1) = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 32))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return v1 & 1;
}

uint64_t DisambiguationPillMetrics.chevronImage.getter()
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v5);
  uint64_t v1 = v6;
  uint64_t v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 152))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

double DisambiguationPillMetrics.chevronSize.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics;
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v9);
  uint64_t v2 = v10;
  uint64_t v3 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  char v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  double v5 = 0.0;
  if (v4)
  {
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v1, (uint64_t)v9);
    uint64_t v6 = v10;
    uint64_t v7 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    double v5 = (*(double (**)(uint64_t, uint64_t))(v7 + 136))(v6, v7);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  }
  return v5;
}

double DisambiguationPillMetrics.chevronLeadingMargin.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics;
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v9);
  uint64_t v2 = v10;
  uint64_t v3 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  char v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  double v5 = 0.0;
  if (v4)
  {
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v1, (uint64_t)v9);
    uint64_t v6 = v10;
    uint64_t v7 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    double v5 = (*(double (**)(uint64_t, uint64_t))(v7 + 112))(v6, v7);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  }
  return v5;
}

double DisambiguationPillMetrics.labelHorizontalMargins.getter()
{
  DisambiguationPillMetrics.pillMetrics.getter(v1);
  return v2;
}

uint64_t DisambiguationPillMetrics.line(from:maxWidth:)(const __CFAttributedString *a1)
{
  CTLineRef v1 = CTLineCreateWithAttributedString(a1);
  uint64_t TruncatedLineWithTokenHandler = CTLineCreateTruncatedLineWithTokenHandler();
  if (TruncatedLineWithTokenHandler)
  {
    uint64_t v3 = TruncatedLineWithTokenHandler;

    return v3;
  }
  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

double DisambiguationPillMetrics.firstLineSize.getter()
{
  DisambiguationPillMetrics.pillMetrics.getter(v1);
  return v2;
}

uint64_t DisambiguationPillMetrics.firstLineColor.getter()
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v5);
  uint64_t v1 = v6;
  uint64_t v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 64))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

uint64_t DisambiguationPillMetrics.firstLineFont.getter()
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v5);
  uint64_t v1 = v6;
  uint64_t v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 72))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

uint64_t DisambiguationPillMetrics.firstLineAttributedString.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics;
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v11);
  uint64_t v2 = v11[4];
  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v1, (uint64_t)v8);
  uint64_t v3 = v9;
  uint64_t v4 = v10;
  __swift_project_boxed_opaque_existential_1(v8, v9);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 80))(v3, v4);
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(v2 + 192))(v5);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  return v6;
}

uint64_t DisambiguationPillMetrics.secondLineColor.getter()
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v5);
  uint64_t v1 = v6;
  uint64_t v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

uint64_t DisambiguationPillMetrics.secondLineFont.getter()
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v5);
  uint64_t v1 = v6;
  uint64_t v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 96))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

double DisambiguationPillMetrics.secondLineSize.getter()
{
  DisambiguationPillMetrics.pillMetrics.getter(v1);
  return v2;
}

uint64_t DisambiguationPillMetrics.secondLineAttributedString.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics;
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v11);
  uint64_t v2 = v11[4];
  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v1, (uint64_t)v8);
  uint64_t v3 = v9;
  uint64_t v4 = v10;
  __swift_project_boxed_opaque_existential_1(v8, v9);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 104))(v3, v4);
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(v2 + 200))(v5);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  return v6;
}

id @objc static DisambiguationPillMetrics.firstLineString(for:)(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(void))
{
  id v5 = a3;
  uint64_t v6 = a4();
  uint64_t v8 = v7;

  uint64_t v9 = (void *)MEMORY[0x19F3906A0](v6, v8);
  swift_bridgeObjectRelease();
  return v9;
}

CTFontRef specialized iOSDisambiguationPillMetric.firstLineFont.getter(CTFontRef result, CGFloat a2)
{
  uint64_t v2 = (void *)*MEMORY[0x1E4F24640];
  if (*MEMORY[0x1E4F24640])
  {
    uint64_t v4 = result;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef? : Any])>);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_19BED1BC0;
    uint64_t v6 = (void *)*MEMORY[0x1E4F24620];
    *(void *)(inited + 32) = *MEMORY[0x1E4F24620];
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef?, Any)>);
    uint64_t v7 = swift_initStackObject();
    uint64_t v8 = (void **)MEMORY[0x1E4F246D8];
    *(_OWORD *)(v7 + 16) = xmmword_19BED15B0;
    uint64_t v9 = *v8;
    *(void *)(v7 + 32) = *v8;
    uint64_t v10 = MEMORY[0x1E4FBC958];
    *(void *)(v7 + 40) = *v4;
    uint64_t v11 = (void *)*MEMORY[0x1E4F24660];
    *(void *)(v7 + 64) = v10;
    *(void *)(v7 + 72) = v11;
    type metadata accessor for CFStringRef(0);
    *(void *)(v7 + 104) = v12;
    *(void *)(v7 + 80) = v2;
    id v13 = v11;
    id v14 = v2;
    id v15 = v6;
    id v16 = v9;
    *(void *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v7);
    specialized Dictionary.init(dictionaryLiteral:)(inited);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef? : Any]);
    lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, type metadata accessor for CFStringRef);
    CFDictionaryRef isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    char v18 = CTFontDescriptorCreateWithAttributes(isa);
    CTFontRef v19 = CTFontCreateWithFontDescriptor(v18, a2, 0);

    return v19;
  }
  else
  {
    __break(1u);
  }
  return result;
}

CTFontRef specialized VisionDisambiguationPillMetric.firstLineFont.getter(CTFontRef result)
{
  uint64_t v1 = (void *)*MEMORY[0x1E4F24640];
  if (*MEMORY[0x1E4F24640])
  {
    CTFontRef v2 = result;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef? : CFStringRef])>);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_19BED1BC0;
    uint64_t v4 = (void *)*MEMORY[0x1E4F24620];
    *(void *)(inited + 32) = *MEMORY[0x1E4F24620];
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef?, CFStringRef)>);
    uint64_t v5 = swift_initStackObject();
    *(_OWORD *)(v5 + 16) = xmmword_19BED1BC0;
    uint64_t v6 = (void *)*MEMORY[0x1E4F24660];
    *(void *)(v5 + 32) = *MEMORY[0x1E4F24660];
    *(void *)(v5 + 40) = v1;
    id v7 = v6;
    id v8 = v1;
    id v9 = v4;
    *(void *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v5);
    specialized Dictionary.init(dictionaryLiteral:)(inited);
    type metadata accessor for CFStringRef(0);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef? : CFStringRef]);
    lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, type metadata accessor for CFStringRef);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v11 = [(__CTFont *)v2 fontContentSizeCategory];
    uint64_t v12 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
    CTFontRef v13 = CTFontCreateWithFontDescriptor(v12, 0.0, 0);

    return v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

CTFontRef specialized VisionDisambiguationPillMetric.secondLineFont.getter(CTFontRef result)
{
  uint64_t v1 = (void *)*MEMORY[0x1E4F24640];
  if (*MEMORY[0x1E4F24640])
  {
    CTFontRef v2 = result;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef? : Any])>);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_19BED1BC0;
    uint64_t v4 = (void *)*MEMORY[0x1E4F24620];
    *(void *)(inited + 32) = *MEMORY[0x1E4F24620];
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef?, Any)>);
    uint64_t v5 = swift_initStackObject();
    *(_OWORD *)(v5 + 16) = xmmword_19BED15B0;
    uint64_t v6 = (void *)*MEMORY[0x1E4F246D8];
    *(void *)(v5 + 32) = *MEMORY[0x1E4F246D8];
    uint64_t v7 = MEMORY[0x1E4FBC958];
    *(void *)(v5 + 40) = *MEMORY[0x1E4F246C0];
    id v8 = (void *)*MEMORY[0x1E4F24660];
    *(void *)(v5 + 64) = v7;
    *(void *)(v5 + 72) = v8;
    type metadata accessor for CFStringRef(0);
    *(void *)(v5 + 104) = v9;
    *(void *)(v5 + 80) = v1;
    id v10 = v8;
    id v11 = v1;
    id v12 = v4;
    id v13 = v6;
    *(void *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v5);
    specialized Dictionary.init(dictionaryLiteral:)(inited);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef? : Any]);
    lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, type metadata accessor for CFStringRef);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v15 = [(__CTFont *)v2 fontContentSizeCategory];
    id v16 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
    CTFontRef v17 = CTFontCreateWithFontDescriptor(v16, 0.0, 0);

    return v17;
  }
  else
  {
    __break(1u);
  }
  return result;
}

double specialized HighlightDisambiguationPillMetricVariant.chevronSize.getter(void *a1)
{
  if (objc_msgSend(a1, sel_layoutDirection) == (id)1) {
    unint64_t v2 = 0xEC0000007466656CLL;
  }
  else {
    unint64_t v2 = 0xED00007468676972;
  }
  id v3 = a1;
  uint64_t v4 = (void *)MEMORY[0x19F3906A0](0x2E6E6F7276656863, v2);
  swift_bridgeObjectRelease();
  id v5 = SLDSystemVectorGlyphWithSlotStyle(v3, v4, 1, 4, 10.0);

  objc_msgSend(v5, sel_contentBounds);
  double v7 = v6;

  return v7;
}

uint64_t specialized HighlightDisambiguationPillMetricVariant.chevronImage.getter(void *a1)
{
  if (objc_msgSend(a1, sel_layoutDirection) == (id)1) {
    unint64_t v2 = 0xEC0000007466656CLL;
  }
  else {
    unint64_t v2 = 0xED00007468676972;
  }
  id v3 = a1;
  uint64_t v4 = (void *)MEMORY[0x19F3906A0](0x2E6E6F7276656863, v2);
  swift_bridgeObjectRelease();
  id v5 = SLDSystemVectorGlyphWithSlotStyle(v3, v4, 1, 4, 10.0);

  if (objc_msgSend(v3, sel_layoutDirection) == (id)1) {
    unint64_t v6 = 0xEC0000007466656CLL;
  }
  else {
    unint64_t v6 = 0xED00007468676972;
  }
  id v7 = v3;
  id v8 = (void *)MEMORY[0x19F3906A0](0x2E6E6F7276656863, v6);
  swift_bridgeObjectRelease();
  id v9 = SLDSystemVectorGlyphWithSlotStyle(v7, v8, 1, 4, 10.0);

  objc_msgSend(v9, sel_contentBounds);
  double v11 = v10;
  double v13 = v12;

  unsigned int v14 = objc_msgSend(v7, sel_displayScale);
  uint64_t v16 = SLDCreateRasterizedVectorGlyph(v5, v15, v11, v13, (double)v14);

  return v16;
}

void specialized HighlightDisambiguationPillMetricVariant.firstLineFontHeight.getter()
{
  UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontMenuItem, 0.0, 0);
  if (!UIFontForLanguage) {
    goto LABEL_8;
  }
  uint64_t v1 = UIFontForLanguage;
  CTFontRef CopyWithSymbolicTraits = CTFontCreateCopyWithSymbolicTraits(UIFontForLanguage, 0.0, 0, 2u, 2u);

  if (!CopyWithSymbolicTraits) {
    goto LABEL_8;
  }
  CTFontGetAscent(CopyWithSymbolicTraits);

  id v3 = CTFontCreateUIFontForLanguage(kCTFontUIFontMenuItem, 0.0, 0);
  if (!v3) {
    goto LABEL_8;
  }
  uint64_t v4 = v3;
  id v5 = CTFontCreateCopyWithSymbolicTraits(v3, 0.0, 0, 2u, 2u);

  if (!v5) {
    goto LABEL_8;
  }
  CTFontGetDescent(v5);

  unint64_t v6 = CTFontCreateUIFontForLanguage(kCTFontUIFontMenuItem, 0.0, 0);
  if (v6 && (id v7 = v6, v8 = CTFontCreateCopyWithSymbolicTraits(v6, 0.0, 0, 2u, 2u), v7, v8))
  {
    CTFontGetLeading(v8);
  }
  else
  {
LABEL_8:
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

uint64_t specialized HighlightDisambiguationPillMetricVariant.firstLineAttributedString(from:)(uint64_t a1, uint64_t a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19BED1BD0;
  id v7 = (void *)*MEMORY[0x1E4FB06F8];
  *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
  swift_bridgeObjectRetain();
  id v8 = v7;
  UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontMenuItem, 0.0, 0);
  if (UIFontForLanguage
    && (double v10 = UIFontForLanguage,
        CTFontRef CopyWithSymbolicTraits = CTFontCreateCopyWithSymbolicTraits(UIFontForLanguage, 0.0, 0, 2u, 2u),
        v10,
        CopyWithSymbolicTraits))
  {
    type metadata accessor for CTFontRef(0);
    *(void *)(inited + 40) = CopyWithSymbolicTraits;
    double v12 = (void *)*MEMORY[0x1E4FB0700];
    *(void *)(inited + 64) = v13;
    *(void *)(inited + 72) = v12;
    id v14 = v12;
    if (objc_msgSend(a3, sel_userInterfaceStyle) == (id)1)
    {
      CGFloat v15 = 1.0;
      CGFloat v16 = 1.0;
      CGFloat v17 = 1.0;
    }
    else
    {
      CGFloat v15 = 0.0;
      CGFloat v16 = 0.0;
      CGFloat v17 = 0.0;
    }
    CGColorRef GenericRGB = CGColorCreateGenericRGB(v15, v16, v17, 1.0);
    type metadata accessor for CGColorRef(0);
    *(void *)(inited + 80) = GenericRGB;
    CTFontRef v19 = (void *)*MEMORY[0x1E4F284F8];
    *(void *)(inited + 104) = v20;
    *(void *)(inited + 112) = v19;
    id v21 = v19;
    id v22 = objc_msgSend(a3, sel_localization);
    uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v25 = v24;

    *(void *)(inited + 144) = MEMORY[0x1E4FBB1A0];
    *(void *)(inited + 120) = v23;
    *(void *)(inited + 128) = v25;
    specialized Dictionary.init(dictionaryLiteral:)(inited);
    id v26 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
    uint64_t v27 = (void *)MEMORY[0x19F3906A0](a1, a2);
    swift_bridgeObjectRelease();
    type metadata accessor for NSAttributedStringKey(0);
    lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, type metadata accessor for NSAttributedStringKey);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v29 = objc_msgSend(v26, sel_initWithString_attributes_, v27, isa);

    return (uint64_t)v29;
  }
  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

id specialized HighlightDisambiguationPillMetricVariant.firstLineAttributedString(from:)(uint64_t a1, uint64_t a2, void *a3, const __CTFont *a4, CGFloat a5, CGFloat a6)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19BED1BD0;
  uint64_t v13 = (void *)*MEMORY[0x1E4FB06F8];
  *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
  swift_bridgeObjectRetain();
  id v14 = v13;
  CTFontRef v15 = specialized iOSDisambiguationPillMetric.firstLineFont.getter(a4, a5);
  type metadata accessor for CTFontRef(0);
  *(void *)(inited + 40) = v15;
  CGFloat v16 = (void *)*MEMORY[0x1E4FB0700];
  *(void *)(inited + 64) = v17;
  *(void *)(inited + 72) = v16;
  id v18 = v16;
  if (objc_msgSend(a3, sel_userInterfaceStyle) == (id)1)
  {
    CGFloat v19 = 1.0;
    CGFloat v20 = 1.0;
    CGFloat v21 = 1.0;
  }
  else
  {
    CGFloat v19 = 0.0;
    CGFloat v20 = 0.0;
    CGFloat v21 = 0.0;
  }
  CGColorRef GenericRGB = CGColorCreateGenericRGB(v19, v20, v21, a6);
  type metadata accessor for CGColorRef(0);
  *(void *)(inited + 80) = GenericRGB;
  uint64_t v23 = (void *)*MEMORY[0x1E4F284F8];
  *(void *)(inited + 104) = v24;
  *(void *)(inited + 112) = v23;
  id v25 = v23;
  id v26 = objc_msgSend(a3, sel_localization);
  uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v29 = v28;

  *(void *)(inited + 144) = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 120) = v27;
  *(void *)(inited + 128) = v29;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  id v30 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
  double v31 = (void *)MEMORY[0x19F3906A0](a1, a2);
  swift_bridgeObjectRelease();
  type metadata accessor for NSAttributedStringKey(0);
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, type metadata accessor for NSAttributedStringKey);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v33 = objc_msgSend(v30, sel_initWithString_attributes_, v31, isa);

  return v33;
}

id specialized HighlightDisambiguationPillMetricVariant.firstLineAttributedString(from:)(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(void *), CGFloat a5)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19BED1BD0;
  double v11 = (void *)*MEMORY[0x1E4FB06F8];
  *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
  swift_bridgeObjectRetain();
  id v12 = v11;
  uint64_t v13 = a4(a3);
  type metadata accessor for CTFontRef(0);
  *(void *)(inited + 40) = v13;
  id v14 = (void *)*MEMORY[0x1E4FB0700];
  *(void *)(inited + 64) = v15;
  *(void *)(inited + 72) = v14;
  id v16 = v14;
  CGColorRef GenericRGB = CGColorCreateGenericRGB(1.0, 1.0, 1.0, a5);
  type metadata accessor for CGColorRef(0);
  *(void *)(inited + 80) = GenericRGB;
  id v18 = (void *)*MEMORY[0x1E4F284F8];
  *(void *)(inited + 104) = v19;
  *(void *)(inited + 112) = v18;
  id v20 = v18;
  id v21 = objc_msgSend(a3, sel_localization);
  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v24 = v23;

  *(void *)(inited + 144) = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 120) = v22;
  *(void *)(inited + 128) = v24;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  id v25 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
  id v26 = (void *)MEMORY[0x19F3906A0](a1, a2);
  swift_bridgeObjectRelease();
  type metadata accessor for NSAttributedStringKey(0);
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, type metadata accessor for NSAttributedStringKey);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v28 = objc_msgSend(v25, sel_initWithString_attributes_, v26, isa);

  return v28;
}

uint64_t specialized static DisambiguationPillMetrics.firstLineString(for:)(void *a1)
{
  uint64_t v2 = type metadata accessor for Locale();
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v3 = type metadata accessor for String.LocalizationValue();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  id v7 = &v31[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = MEMORY[0x1F4188790](v5);
  double v10 = &v31[-v9];
  uint64_t v11 = MEMORY[0x1F4188790](v8);
  uint64_t v13 = &v31[-v12];
  MEMORY[0x1F4188790](v11);
  uint64_t v15 = &v31[-v14];
  if (objc_msgSend(a1, sel_isFromMe))
  {
    String.LocalizationValue.init(stringLiteral:)();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v4 + 16))(v13, v15, v3);
    id v16 = SLFrameworkBundle();
    static Locale.current.getter();
    uint64_t v17 = String.init(localized:table:bundle:localization:locale:comment:)();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v15, v3);
  }
  else
  {
    id v18 = objc_msgSend(a1, sel_sender);
    id v19 = objc_msgSend(v18, sel_shortDisplayName);

    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v22 = v21;

    swift_bridgeObjectRelease();
    uint64_t v23 = HIBYTE(v22) & 0xF;
    if ((v22 & 0x2000000000000000) == 0) {
      uint64_t v23 = v20 & 0xFFFFFFFFFFFFLL;
    }
    if (v23)
    {
      id v24 = objc_msgSend(a1, sel_sender);
      id v25 = objc_msgSend(v24, sel_shortDisplayName);

      uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      return v26;
    }
    String.LocalizationValue.init(stringLiteral:)();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v4 + 16))(v7, v10, v3);
    id v28 = SLFrameworkBundle();
    static Locale.current.getter();
    String.init(localized:table:bundle:localization:locale:comment:)();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v10, v3);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_19BED1BC0;
    uint64_t v30 = MEMORY[0x1E4FBB5C8];
    *(void *)(v29 + 56) = MEMORY[0x1E4FBB550];
    *(void *)(v29 + 64) = v30;
    *(void *)(v29 + 32) = 1;
    uint64_t v17 = static String.localizedStringWithFormat(_:_:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v17;
}

id specialized static DisambiguationPillMetrics.secondLineString(for:)(void *a1)
{
  uint64_t v2 = type metadata accessor for Locale();
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v3 = type metadata accessor for String.LocalizationValue();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  id v7 = (char *)v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x1F4188790](v5);
  double v10 = (char *)v43 - v9;
  uint64_t v11 = MEMORY[0x1F4188790](v8);
  uint64_t v13 = (char *)v43 - v12;
  uint64_t v14 = MEMORY[0x1F4188790](v11);
  id v16 = (char *)v43 - v15;
  uint64_t v17 = MEMORY[0x1F4188790](v14);
  id v19 = (char *)v43 - v18;
  MEMORY[0x1F4188790](v17);
  unint64_t v21 = (char *)v43 - v20;
  if (!objc_msgSend(a1, sel_isGroupConversation))
  {
    String.LocalizationValue.init(stringLiteral:)();
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v10, v3);
    id v31 = SLFrameworkBundle();
    static Locale.current.getter();
    uint64_t v32 = String.init(localized:table:bundle:localization:locale:comment:)();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v10, v3);
    return (id)v32;
  }
  v43[0] = v3;
  id v22 = objc_msgSend(a1, sel_groupDisplayName);
  if (!v22) {
    goto LABEL_9;
  }
  uint64_t v23 = v22;
  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v26 = v25;

  swift_bridgeObjectRelease();
  uint64_t v27 = HIBYTE(v26) & 0xF;
  if ((v26 & 0x2000000000000000) == 0) {
    uint64_t v27 = v24 & 0xFFFFFFFFFFFFLL;
  }
  if (!v27)
  {
LABEL_9:
    id v33 = objc_msgSend(a1, sel_otherRecipientCount);
    id v34 = objc_msgSend(v33, sel_unsignedIntegerValue);

    String.LocalizationValue.init(stringLiteral:)();
    if (v34)
    {
      uint64_t v35 = v43[0];
      (*(void (**)(char *, char *, void))(v4 + 16))(v19, v21, v43[0]);
      id v36 = SLFrameworkBundle();
      static Locale.current.getter();
      String.init(localized:table:bundle:localization:locale:comment:)();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v21, v35);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v37 = swift_allocObject();
      *(_OWORD *)(v37 + 16) = xmmword_19BED1BC0;
      id v38 = objc_msgSend(a1, sel_otherRecipientCount);
      id v39 = objc_msgSend(v38, sel_unsignedIntegerValue);

      uint64_t v40 = MEMORY[0x1E4FBB868];
      *(void *)(v37 + 56) = MEMORY[0x1E4FBB808];
      *(void *)(v37 + 64) = v40;
      *(void *)(v37 + 32) = v39;
      uint64_t v32 = static String.localizedStringWithFormat(_:_:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v41 = v43[0];
      (*(void (**)(char *, char *, void))(v4 + 16))(v13, v16, v43[0]);
      id v42 = SLFrameworkBundle();
      static Locale.current.getter();
      uint64_t v32 = String.init(localized:table:bundle:localization:locale:comment:)();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v16, v41);
    }
    return (id)v32;
  }
  id result = objc_msgSend(a1, sel_groupDisplayName);
  if (result)
  {
    uint64_t v29 = result;
    uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();

    return (id)v30;
  }
  else
  {
    __break(1u);
  }
  return result;
}

double _s11SocialLayer36SLHighlightDisambiguationPillMetrics33_C5DA7C7764DCEDFB9B9BF94750149602LLVSgWOi0_(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 2;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  return result;
}

uint64_t outlined init with take of SLHighlightDisambiguationPillMetrics?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SLHighlightDisambiguationPillMetrics?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for DisambiguationPillMetrics()
{
  return self;
}

uint64_t outlined init with copy of HighlightDisambiguationPillMetricVariant(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

ValueMetadata *type metadata accessor for iOSDisambiguationPillMetric()
{
  return &type metadata for iOSDisambiguationPillMetric;
}

ValueMetadata *type metadata accessor for VisionDisambiguationPillMetric()
{
  return &type metadata for VisionDisambiguationPillMetric;
}

void *initializeBufferWithCopyOfBuffer for MacDisambiguationPillMetric(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for MacDisambiguationPillMetric(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
}

uint64_t assignWithCopy for MacDisambiguationPillMetric(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  uint64_t v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  return a1;
}

uint64_t assignWithTake for MacDisambiguationPillMetric(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for iOSDisambiguationPillMetric(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for iOSDisambiguationPillMetric(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)double result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)double result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MacDisambiguationPillMetric()
{
  return &type metadata for MacDisambiguationPillMetric;
}

uint64_t method lookup function for DisambiguationPillMetrics(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DisambiguationPillMetrics);
}

uint64_t dispatch thunk of DisambiguationPillMetrics.__allocating_init(slotStyle:tag:variant:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

__n128 __swift_memcpy128_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t getEnumTagSinglePayload for SLHighlightDisambiguationPillMetrics(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 128)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 56);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SLHighlightDisambiguationPillMetrics(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 128) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 128) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 56) = a2 + 1;
    }
  }
  return result;
}

void *type metadata accessor for SLHighlightDisambiguationPillMetrics()
{
  return &unk_1EEC17788;
}

uint64_t _s11SocialLayer36SLHighlightDisambiguationPillMetrics33_C5DA7C7764DCEDFB9B9BF94750149602LLVSgWOg(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 56);
  BOOL v2 = v1 >= 2;
  int v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2) {
    return (v3 + 1);
  }
  else {
    return 0;
  }
}

uint64_t lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

CGColorRef static CGColorRef.labelColor(for:)(uint64_t a1)
{
  if (a1)
  {
    CGFloat v1 = 1.0;
    CGFloat v2 = 1.0;
    CGFloat v3 = 1.0;
  }
  else
  {
    CGFloat v1 = 0.0;
    CGFloat v2 = 0.0;
    CGFloat v3 = 0.0;
  }
  return CGColorCreateGenericRGB(v1, v2, v3, 1.0);
}

CGColorRef static CGColorRef.secondaryLabelColor(for:)(uint64_t a1)
{
  if (a1)
  {
    CGFloat v1 = 0.921568627;
    CGFloat v2 = 0.960784314;
  }
  else
  {
    CGFloat v1 = 0.235294118;
    CGFloat v2 = 0.262745098;
  }
  return CGColorCreateGenericRGB(v1, v1, v2, 0.6);
}

BOOL static Platform.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void Platform.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int Platform.hashValue.getter(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance Platform(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Platform()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance Platform()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Platform()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t CollaborationAttributionViewMetricsProviding.platform.getter()
{
  id v0 = objc_msgSend(self, sel_currentDevice);
  id v1 = objc_msgSend(v0, sel_userInterfaceIdiom);

  if ((unint64_t)v1 >= 6) {
    return 2;
  }
  else {
    return (0x202030102uLL >> (8 * v1));
  }
}

double CollaborationAttributionViewMetricsProviding.placeholderGlyphMinSize.getter(uint64_t a1, uint64_t a2)
{
  BOOL v4 = (void *)(*(uint64_t (**)(void))(a2 + 16))();
  int v5 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 8) + 8))(a1);
  objc_msgSend(v4, sel_minViableSizeWithStyle_, v5);
  double v7 = v6;

  return v7;
}

CTFontRef CollaborationAttributionViewMetricsProviding.baseFont.getter(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef : Int])>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19BED1BC0;
  int v5 = (void *)*MEMORY[0x1E4F24620];
  *(void *)(inited + 32) = *MEMORY[0x1E4F24620];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Int)>);
  uint64_t v6 = swift_initStackObject();
  *(_OWORD *)(v6 + 16) = xmmword_19BED1BC0;
  double v7 = (void *)*MEMORY[0x1E4F24610];
  *(void *)(v6 + 32) = *MEMORY[0x1E4F24610];
  *(void *)(v6 + 40) = 0x8000;
  id v8 = v5;
  id v9 = v7;
  *(void *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v6);
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef : Int]);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, type metadata accessor for CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 8) + 8))(a1);
  uint64_t v12 = (void *)CTContentSizeCategoryForSlotStyle(v11);

  uint64_t v13 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  CTFontRef v14 = CTFontCreateWithFontDescriptor(v13, 0.0, 0);

  return v14;
}

double CollaborationAttributionViewMetricsProviding.avatarLabelSpace.getter()
{
  return 0.0;
}

double CollaborationAttributionViewMetricsProviding.titleSubtitleSpace.getter()
{
  return 3.0;
}

id CollaborationAttributionViewMetricsProviding.titleAttributedString(for:style:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *(void *)(a4 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](a1);
  uint64_t v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x1F4188790](v10);
  uint64_t v15 = (char *)&v48 - v14;
  MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v48 - v16;
  uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 40))(v19, v18);
  if (v20)
  {
    unint64_t v21 = (void *)v20;
    if (String.count.getter() >= 1)
    {
      uint64_t v48 = a3;
      uint64_t v49 = a1;
      id v22 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
      v22(v17, v4, a4);
      uint64_t v23 = v21;
      if (swift_dynamicCast())
      {
        uint64_t v24 = v50;

        v22(v15, v4, a4);
        (*(void (**)(char *, uint64_t))(v9 + 8))(v15, a4);
        uint64_t v25 = v48;
        uint64_t v26 = v49;
      }
      else
      {
        v22(v15, v4, a4);
        (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v12, v15, a4);
        int v28 = swift_dynamicCast();
        uint64_t v25 = v48;
        uint64_t v26 = v49;
        if (!v28)
        {
          CTFontRef v30 = v23;
          if (v48) {
            goto LABEL_10;
          }
          goto LABEL_12;
        }
        uint64_t v29 = v50;
      }
      CTFontRef v30 = specialized static CollaborationAttributionViewMetricsProvider.boldFontWithFont(font:)(v23);

      if (v25)
      {
LABEL_10:
        CGFloat v31 = 1.0;
        CGFloat v32 = 1.0;
        CGFloat v33 = 1.0;
LABEL_13:
        CGColorRef GenericRGB = CGColorCreateGenericRGB(v31, v32, v33, 1.0);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, Any)>);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_19BED15B0;
        id v36 = (void *)*MEMORY[0x1E4FB06F8];
        *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
        type metadata accessor for CTFontRef(0);
        *(void *)(inited + 40) = v30;
        uint64_t v37 = (void *)*MEMORY[0x1E4FB0700];
        *(void *)(inited + 64) = v38;
        *(void *)(inited + 72) = v37;
        type metadata accessor for CGColorRef(0);
        *(void *)(inited + 104) = v39;
        *(void *)(inited + 80) = GenericRGB;
        id v40 = v36;
        uint64_t v41 = v30;
        id v42 = v37;
        uint64_t v43 = GenericRGB;
        specialized Dictionary.init(dictionaryLiteral:)(inited);
        id v44 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
        swift_bridgeObjectRetain();
        char v45 = (void *)MEMORY[0x19F3906A0](v26, a2);
        swift_bridgeObjectRelease();
        type metadata accessor for NSAttributedStringKey(0);
        _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, type metadata accessor for NSAttributedStringKey);
        Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        id v27 = objc_msgSend(v44, sel_initWithString_attributes_, v45, isa);

        return v27;
      }
LABEL_12:
      CGFloat v31 = 0.0;
      CGFloat v32 = 0.0;
      CGFloat v33 = 0.0;
      goto LABEL_13;
    }
  }
  return 0;
}

id CollaborationAttributionViewMetricsProviding.subtitleAttributedString(for:style:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 40))(a4, a5);
  if (!v8) {
    return 0;
  }
  uint64_t v9 = (void *)v8;
  if (String.count.getter() < 1)
  {

    return 0;
  }
  if (a3)
  {
    CGFloat v10 = 0.921568627;
    CGFloat v11 = 0.960784314;
  }
  else
  {
    CGFloat v10 = 0.235294118;
    CGFloat v11 = 0.262745098;
  }
  CGColorRef GenericRGB = CGColorCreateGenericRGB(v10, v10, v11, 0.6);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19BED15B0;
  uint64_t v15 = (void *)*MEMORY[0x1E4FB06F8];
  *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
  type metadata accessor for CTFontRef(0);
  *(void *)(inited + 40) = v9;
  uint64_t v16 = (void *)*MEMORY[0x1E4FB0700];
  *(void *)(inited + 64) = v17;
  *(void *)(inited + 72) = v16;
  type metadata accessor for CGColorRef(0);
  *(void *)(inited + 104) = v18;
  *(void *)(inited + 80) = GenericRGB;
  id v19 = v15;
  id v20 = v9;
  id v21 = v16;
  id v22 = GenericRGB;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  id v23 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
  swift_bridgeObjectRetain();
  uint64_t v24 = (void *)MEMORY[0x19F3906A0](a1, a2);
  swift_bridgeObjectRelease();
  type metadata accessor for NSAttributedStringKey(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, type metadata accessor for NSAttributedStringKey);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v23, sel_initWithString_attributes_, v24, isa);

  return v12;
}

id CollaborationAttributionViewStandardMetrics.intrinsicHeight.getter(void *a1, void *a2)
{
  v13[1] = *(CGFloat *)MEMORY[0x1E4F143B8];
  CFAttributedStringRef v4 = (const __CFAttributedString *)specialized CollaborationAttributionViewMetricsProviding.titleAttributedString(for:style:)(0x6C6F686563616C50, 0xEB00000000726564, (uint64_t)objc_msgSend(a1, sel_userInterfaceStyle), a1);
  if (v4)
  {
    CFAttributedStringRef v5 = v4;
    CTLineRef v6 = CTLineCreateWithAttributedString(v4);
    uint64_t TruncatedLineWithTokenHandler = (const __CTLine *)CTLineCreateTruncatedLineWithTokenHandler();

    if (TruncatedLineWithTokenHandler)
    {
      CTLineGetBoundsWithOptions(TruncatedLineWithTokenHandler, 8uLL);
      v13[0] = 0.0;
      CTLineGetTypographicBounds(TruncatedLineWithTokenHandler, 0, v13, 0);
    }
  }
  CFAttributedStringRef v8 = (const __CFAttributedString *)specialized CollaborationAttributionViewMetricsProviding.subtitleAttributedString(for:style:)(0x6C6F686563616C50, 0xEB00000000726564, (uint64_t)objc_msgSend(a1, sel_userInterfaceStyle), a1);
  if (v8)
  {
    CFAttributedStringRef v9 = v8;
    CTLineRef v10 = CTLineCreateWithAttributedString(v8);
    CGFloat v11 = (const __CTLine *)CTLineCreateTruncatedLineWithTokenHandler();

    if (v11)
    {
      CTLineGetBoundsWithOptions(v11, 8uLL);
      v13[0] = 0.0;
      CTLineGetTypographicBounds(v11, 0, v13, 0);
    }
  }
  return objc_msgSend(a2, sel_minViableSizeWithStyle_, a1);
}

uint64_t specialized static CollaborationAttributionViewMetricsProvider.singleLineTitle<A>(for:metrics:)(uint64_t a1, uint64_t a2, id a3, void *a4)
{
  CFAttributedStringRef v6 = (const __CFAttributedString *)specialized CollaborationAttributionViewMetricsProviding.titleAttributedString(for:style:)(a1, a2, (uint64_t)objc_msgSend(a3, sel_userInterfaceStyle), a3);
  if (!v6) {
    return 0;
  }
  CFAttributedStringRef v7 = v6;
  CTLineRef v8 = CTLineCreateWithAttributedString(v6);
  CFAttributedStringRef v9 = self;
  id v10 = a3;
  id v11 = a4;
  id v12 = objc_msgSend(v9, sel_currentDevice);
  objc_msgSend(v12, sel_userInterfaceIdiom);

  id v13 = v10;
  id v14 = v11;
  id v15 = objc_msgSend(v9, sel_currentDevice);
  objc_msgSend(v15, sel_userInterfaceIdiom);

  uint64_t TruncatedLineWithTokenHandler = CTLineCreateTruncatedLineWithTokenHandler();
  return TruncatedLineWithTokenHandler;
}

uint64_t static CollaborationAttributionViewMetricsProvider.singleLineTitle<A>(for:metrics:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return static CollaborationAttributionViewMetricsProvider.singleLineTitle<A>(for:metrics:)(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, id, uint64_t, uint64_t))CollaborationAttributionViewMetricsProviding.titleAttributedString(for:style:));
}

uint64_t static CollaborationAttributionViewMetricsProvider.singleLineSubtitle<A>(for:metrics:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return static CollaborationAttributionViewMetricsProvider.singleLineTitle<A>(for:metrics:)(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, id, uint64_t, uint64_t))CollaborationAttributionViewMetricsProviding.subtitleAttributedString(for:style:));
}

uint64_t static CollaborationAttributionViewMetricsProvider.singleLineTitle<A>(for:metrics:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, id, uint64_t, uint64_t))
{
  uint64_t v11 = *(void *)(a5 + 8);
  id v12 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(a4, v11);
  id v13 = objc_msgSend(v12, sel_userInterfaceStyle);

  CFAttributedStringRef v14 = (const __CFAttributedString *)a6(a1, a2, v13, a4, a5);
  if (!v14) {
    return 0;
  }
  CFAttributedStringRef v15 = v14;
  CTLineRef v16 = CTLineCreateWithAttributedString(v14);
  (*(void (**)(uint64_t, uint64_t))(v11 + 16))(a4, v11);
  (*(void (**)(uint64_t, uint64_t))(a5 + 32))(a4, a5);
  (*(void (**)(uint64_t, uint64_t))(a5 + 48))(a4, a5);
  uint64_t TruncatedLineWithTokenHandler = CTLineCreateTruncatedLineWithTokenHandler();

  return TruncatedLineWithTokenHandler;
}

CTFontRef protocol witness for CollaborationAttributionViewMetricsProviding.baseFont.getter in conformance CollaborationAttributionViewStandardMetrics()
{
  return specialized CollaborationAttributionViewMetricsProviding.baseFont.getter(*v0);
}

double protocol witness for CollaborationAttributionViewMetricsProviding.avatarLabelSpace.getter in conformance CollaborationAttributionViewStandardMetrics()
{
  return 10.0;
}

double protocol witness for CollaborationAttributionViewMetricsProviding.titleSubtitleSpace.getter in conformance CollaborationAttributionViewStandardMetrics()
{
  return 3.0;
}

double protocol witness for RemoteViewMetricsProviding.drawingSize() in conformance CollaborationAttributionViewStandardMetrics(uint64_t a1, uint64_t a2)
{
  return protocol witness for RemoteViewMetricsProviding.drawingSize() in conformance CollaborationAttributionViewStandardMetrics(a1, a2, (void (*)(void, void, double))CollaborationAttributionViewStandardMetrics.intrinsicHeight.getter);
}

id CollaborationAttributionViewStandardVisionMetrics.intrinsicHeight.getter(void *a1, void *a2)
{
  v13[1] = *(CGFloat *)MEMORY[0x1E4F143B8];
  CFAttributedStringRef v4 = (const __CFAttributedString *)specialized CollaborationAttributionViewMetricsProviding.titleAttributedString(for:style:)(0x6C6F686563616C50, 0xEB00000000726564, (uint64_t)objc_msgSend(a1, sel_userInterfaceStyle), a1);
  if (v4)
  {
    CFAttributedStringRef v5 = v4;
    CTLineRef v6 = CTLineCreateWithAttributedString(v4);
    uint64_t TruncatedLineWithTokenHandler = (const __CTLine *)CTLineCreateTruncatedLineWithTokenHandler();

    if (TruncatedLineWithTokenHandler)
    {
      CTLineGetBoundsWithOptions(TruncatedLineWithTokenHandler, 8uLL);
      v13[0] = 0.0;
      CTLineGetTypographicBounds(TruncatedLineWithTokenHandler, 0, v13, 0);
    }
  }
  CFAttributedStringRef v8 = (const __CFAttributedString *)specialized CollaborationAttributionViewMetricsProviding.subtitleAttributedString(for:style:)(0x6C6F686563616C50, 0xEB00000000726564, (uint64_t)objc_msgSend(a1, sel_userInterfaceStyle), a1);
  if (v8)
  {
    CFAttributedStringRef v9 = v8;
    CTLineRef v10 = CTLineCreateWithAttributedString(v8);
    uint64_t v11 = (const __CTLine *)CTLineCreateTruncatedLineWithTokenHandler();

    if (v11)
    {
      CTLineGetBoundsWithOptions(v11, 8uLL);
      v13[0] = 0.0;
      CTLineGetTypographicBounds(v11, 0, v13, 0);
    }
  }
  return objc_msgSend(a2, sel_minViableSizeWithStyle_, a1);
}

double protocol witness for RemoteViewMetricsProviding.drawingSize() in conformance CollaborationAttributionViewStandardVisionMetrics(uint64_t a1, uint64_t a2)
{
  return protocol witness for RemoteViewMetricsProviding.drawingSize() in conformance CollaborationAttributionViewStandardMetrics(a1, a2, (void (*)(void, void, double))CollaborationAttributionViewStandardVisionMetrics.intrinsicHeight.getter);
}

id protocol witness for CollaborationAttributionViewMetricsProviding.placeholderGlyphConfig.getter in conformance CollaborationAttributionViewCompactMetrics()
{
  return *(id *)(v0 + 16);
}

id protocol witness for CollaborationAttributionViewMetricsProviding.placeholderGlyphMinSize.getter in conformance CollaborationAttributionViewCompactMetrics()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_minViableSizeWithStyle_, *(void *)v0);
}

uint64_t protocol witness for CollaborationAttributionViewMetricsProviding.baseFont.getter in conformance CollaborationAttributionViewCompactMetrics()
{
  return 0;
}

double protocol witness for CollaborationAttributionViewMetricsProviding.avatarLabelSpace.getter in conformance CollaborationAttributionViewCompactMetrics()
{
  return 0.0;
}

id protocol witness for RemoteViewMetricsProviding.style.getter in conformance CollaborationAttributionViewCompactMetrics()
{
  return *v0;
}

double protocol witness for RemoteViewMetricsProviding.maxWidth.getter in conformance CollaborationAttributionViewCompactMetrics()
{
  return *(double *)(v0 + 8);
}

double protocol witness for RemoteViewMetricsProviding.drawingSize() in conformance CollaborationAttributionViewCompactMetrics()
{
  uint64_t v1 = *v0;
  double v2 = *((double *)v0 + 1);
  CGFloat v3 = (void *)v0[2];
  objc_msgSend(v3, sel_minViableSizeWithStyle_, v1);
  if (v2 > v4) {
    double v5 = v2;
  }
  else {
    double v5 = v4;
  }
  objc_msgSend(v3, sel_minViableSizeWithStyle_, v1);
  return v5;
}

double protocol witness for CollaborationAttributionViewMetricsProviding.avatarDiameter.getter in conformance CollaborationAttributionViewCompactVisionMetrics()
{
  return *(double *)(v0 + 8) + -8.0;
}

double protocol witness for RemoteViewMetricsProviding.drawingSize() in conformance CollaborationAttributionViewCompactVisionMetrics()
{
  uint64_t v1 = *v0;
  double v2 = *((double *)v0 + 1);
  CGFloat v3 = (void *)v0[2];
  double v4 = v2 + -8.0;
  objc_msgSend(v3, sel_minViableSizeWithStyle_, v1);
  if (v4 > v5) {
    double v6 = v4;
  }
  else {
    double v6 = v5;
  }
  objc_msgSend(v3, sel_minViableSizeWithStyle_, v1);
  return v6;
}

id CollaborationAttributionViewConversationMetrics.intrinsicHeight.getter(id a1, void *a2)
{
  v11[1] = *(CGFloat *)MEMORY[0x1E4F143B8];
  double v4 = (const __CTLine *)specialized static CollaborationAttributionViewMetricsProvider.singleLineTitle<A>(for:metrics:)(0x6C6F686563616C50, 0xEB00000000726564, a1, a2);
  if (v4)
  {
    double v5 = v4;
    CTLineGetBoundsWithOptions(v4, 8uLL);
    v11[0] = 0.0;
    CTLineGetTypographicBounds(v5, 0, v11, 0);
  }
  double v6 = self;
  id v7 = a1;
  id v8 = a2;
  id v9 = objc_msgSend(v6, sel_currentDevice);
  objc_msgSend(v9, sel_userInterfaceIdiom);

  return objc_msgSend(v8, sel_minViableSizeWithStyle_, v7);
}

double protocol witness for CollaborationAttributionViewMetricsProviding.avatarDiameter.getter in conformance CollaborationAttributionViewConversationMetrics()
{
  uint64_t v1 = *(void **)v0;
  double v2 = *(void **)(v0 + 16);
  CGFloat v3 = self;
  id v4 = v1;
  id v5 = v2;
  id v6 = objc_msgSend(v3, sel_currentDevice);
  id v7 = objc_msgSend(v6, sel_userInterfaceIdiom);

  double result = 30.0;
  if (v7 == (id)5) {
    return 20.0;
  }
  return result;
}

CTFontRef protocol witness for CollaborationAttributionViewMetricsProviding.baseFont.getter in conformance CollaborationAttributionViewConversationMetrics()
{
  return specialized CollaborationAttributionViewMetricsProviding.baseFont.getter(*v0);
}

double protocol witness for CollaborationAttributionViewMetricsProviding.avatarLabelSpace.getter in conformance CollaborationAttributionViewConversationMetrics()
{
  uint64_t v1 = *(void **)v0;
  double v2 = *(void **)(v0 + 16);
  CGFloat v3 = self;
  id v4 = v1;
  id v5 = v2;
  id v6 = objc_msgSend(v3, sel_currentDevice);
  id v7 = objc_msgSend(v6, sel_userInterfaceIdiom);

  double result = 10.0;
  if (v7 == (id)5) {
    return 8.0;
  }
  return result;
}

double protocol witness for RemoteViewMetricsProviding.drawingSize() in conformance CollaborationAttributionViewConversationMetrics(uint64_t a1, uint64_t a2)
{
  return protocol witness for RemoteViewMetricsProviding.drawingSize() in conformance CollaborationAttributionViewStandardMetrics(a1, a2, (void (*)(void, void, double))CollaborationAttributionViewConversationMetrics.intrinsicHeight.getter);
}

id CollaborationAttributionViewConversationVisionMetrics.intrinsicHeight.getter(void *a1, void *a2)
{
  v9[1] = *(CGFloat *)MEMORY[0x1E4F143B8];
  CFAttributedStringRef v4 = (const __CFAttributedString *)specialized CollaborationAttributionViewMetricsProviding.titleAttributedString(for:style:)(0x6C6F686563616C50, 0xEB00000000726564, (uint64_t)objc_msgSend(a1, sel_userInterfaceStyle), a1);
  if (v4)
  {
    CFAttributedStringRef v5 = v4;
    CTLineRef v6 = CTLineCreateWithAttributedString(v4);
    uint64_t TruncatedLineWithTokenHandler = (const __CTLine *)CTLineCreateTruncatedLineWithTokenHandler();

    if (TruncatedLineWithTokenHandler)
    {
      CTLineGetBoundsWithOptions(TruncatedLineWithTokenHandler, 8uLL);
      v9[0] = 0.0;
      CTLineGetTypographicBounds(TruncatedLineWithTokenHandler, 0, v9, 0);
    }
  }
  return objc_msgSend(a2, sel_minViableSizeWithStyle_, a1);
}

double protocol witness for CollaborationAttributionViewMetricsProviding.avatarLabelSpace.getter in conformance CollaborationAttributionViewConversationVisionMetrics()
{
  return 13.0;
}

double protocol witness for RemoteViewMetricsProviding.drawingSize() in conformance CollaborationAttributionViewConversationVisionMetrics(uint64_t a1, uint64_t a2)
{
  return protocol witness for RemoteViewMetricsProviding.drawingSize() in conformance CollaborationAttributionViewStandardMetrics(a1, a2, (void (*)(void, void, double))CollaborationAttributionViewConversationVisionMetrics.intrinsicHeight.getter);
}

double protocol witness for RemoteViewMetricsProviding.drawingSize() in conformance CollaborationAttributionViewStandardMetrics(uint64_t a1, uint64_t a2, void (*a3)(void, void, double))
{
  double v4 = v3[1];
  a3(*(void *)v3, *((void *)v3 + 2), v4);
  return v4;
}

id CollaborationAttributionViewMetricsProvider.__allocating_init(slotStyle:tag:)(void *a1, void *a2)
{
  CGFloat v3 = v2;
  id v6 = objc_allocWithZone(v3);
  id v7 = objc_msgSend(a2, sel_variant);
  objc_msgSend(a2, sel_maxWidth);
  double v9 = v8;
  id v10 = objc_msgSend(a2, sel_placeholderGlyphConfiguration);
  id v11 = objc_msgSend(v6, sel_initWithVariant_slotStyle_maxWidth_placeholderGlyphConfig_, v7, a1, v10, v9);

  return v11;
}

id CollaborationAttributionViewMetricsProvider.init(slotStyle:tag:)(void *a1, id a2)
{
  id v5 = objc_msgSend(a2, sel_variant);
  objc_msgSend(a2, sel_maxWidth);
  double v7 = v6;
  id v8 = objc_msgSend(a2, sel_placeholderGlyphConfiguration);
  id v9 = objc_msgSend(v2, sel_initWithVariant_slotStyle_maxWidth_placeholderGlyphConfig_, v5, a1, v8, v7);

  return v9;
}

id CollaborationAttributionViewMetricsProvider.__allocating_init(variant:slotStyle:maxWidth:placeholderGlyphConfig:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  id v9 = (char *)objc_allocWithZone(v4);
  switch(a1)
  {
    case 0:
      uint64_t v10 = OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics;
      id v11 = &unk_1EEC17A08;
      id v12 = &protocol witness table for CollaborationAttributionViewStandardMetrics;
      break;
    case 1:
      uint64_t v10 = OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics;
      id v11 = &unk_1EEC17920;
      id v12 = &protocol witness table for CollaborationAttributionViewCompactMetrics;
      break;
    case 2:
      uint64_t v10 = OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics;
      id v11 = &unk_1EEC17AF0;
      id v12 = &protocol witness table for CollaborationAttributionViewConversationMetrics;
      break;
    case 3:
      uint64_t v10 = OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics;
      id v11 = &unk_1EEC17CC0;
      id v12 = &protocol witness table for CollaborationAttributionViewStandardVisionMetrics;
      break;
    case 4:
      uint64_t v10 = OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics;
      id v11 = &unk_1EEC17BD8;
      id v12 = &protocol witness table for CollaborationAttributionViewCompactVisionMetrics;
      break;
    case 5:
      uint64_t v10 = OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics;
      id v11 = &unk_1EEC17DA8;
      id v12 = &protocol witness table for CollaborationAttributionViewConversationVisionMetrics;
      break;
    default:
      CFAttributedStringRef v15 = v9;
      type metadata accessor for SLCollaborationAttributionViewMetricVariant(0);
      uint64_t v18 = a1;
      id v16 = v15;
      _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
      __break(1u);
      JUMPOUT(0x19BE8F7ECLL);
  }
  id v13 = &v9[v10];
  *((void *)v13 + 3) = v11;
  *((void *)v13 + 4) = v12;
  *(void *)id v13 = a2;
  *((double *)v13 + 1) = a4;
  *((void *)v13 + 2) = a3;
  v17.receiver = v9;
  v17.super_class = v4;
  return objc_msgSendSuper2(&v17, sel_init);
}

id CollaborationAttributionViewMetricsProvider.init(variant:slotStyle:maxWidth:placeholderGlyphConfig:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  switch(a1)
  {
    case 0:
      uint64_t v5 = OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics;
      double v6 = &unk_1EEC17A08;
      double v7 = &protocol witness table for CollaborationAttributionViewStandardMetrics;
      break;
    case 1:
      uint64_t v5 = OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics;
      double v6 = &unk_1EEC17920;
      double v7 = &protocol witness table for CollaborationAttributionViewCompactMetrics;
      break;
    case 2:
      uint64_t v5 = OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics;
      double v6 = &unk_1EEC17AF0;
      double v7 = &protocol witness table for CollaborationAttributionViewConversationMetrics;
      break;
    case 3:
      uint64_t v5 = OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics;
      double v6 = &unk_1EEC17CC0;
      double v7 = &protocol witness table for CollaborationAttributionViewStandardVisionMetrics;
      break;
    case 4:
      uint64_t v5 = OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics;
      double v6 = &unk_1EEC17BD8;
      double v7 = &protocol witness table for CollaborationAttributionViewCompactVisionMetrics;
      break;
    case 5:
      uint64_t v5 = OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics;
      double v6 = &unk_1EEC17DA8;
      double v7 = &protocol witness table for CollaborationAttributionViewConversationVisionMetrics;
      break;
    default:
      type metadata accessor for SLCollaborationAttributionViewMetricVariant(0);
      uint64_t v13 = a1;
      id v11 = v4;
      _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
      __break(1u);
      JUMPOUT(0x19BE8F960);
  }
  id v8 = &v4[v5];
  *((void *)v8 + 3) = v6;
  *((void *)v8 + 4) = v7;
  *(void *)id v8 = a2;
  *((double *)v8 + 1) = a4;
  *((void *)v8 + 2) = a3;
  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for CollaborationAttributionViewMetricsProvider();
  return objc_msgSendSuper2(&v12, sel_init);
}

uint64_t type metadata accessor for CollaborationAttributionViewMetricsProvider()
{
  return self;
}

id CollaborationAttributionViewMetricsProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void CollaborationAttributionViewMetricsProvider.init()()
{
}

id CollaborationAttributionViewMetricsProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CollaborationAttributionViewMetricsProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t CollaborationAttributionViewMetricsProvider.drawingSize.getter()
{
  id v1 = (void *)(v0 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics + 24);
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics + 32);
  __swift_project_boxed_opaque_existential_1(v1, v2);
  return (*(uint64_t (**)(uint64_t))(*(void *)(v3 + 8) + 24))(v2);
}

uint64_t CollaborationAttributionViewMetricsProvider.avatarDiameter.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics + 24);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics), v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 32))(v1, v2);
}

uint64_t CollaborationAttributionViewMetricsProvider.avatarLabelSpace.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics + 24);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics), v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 48))(v1, v2);
}

uint64_t CollaborationAttributionViewMetricsProvider.titleSubtitleSpace.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics + 24);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics), v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 56))(v1, v2);
}

CTLineRef_optional __swiftcall CollaborationAttributionViewMetricsProvider.singleLineTitle(for:)(Swift::String a1)
{
  return (CTLineRef_optional)CollaborationAttributionViewMetricsProvider.singleLineTitle(for:)(a1._countAndFlagsBits, (uint64_t)a1._object, (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t, uint64_t))static CollaborationAttributionViewMetricsProvider.singleLineTitle<A>(for:metrics:));
}

CTLineRef_optional __swiftcall CollaborationAttributionViewMetricsProvider.singleLineSubtitle(for:)(Swift::String a1)
{
  return (CTLineRef_optional)CollaborationAttributionViewMetricsProvider.singleLineTitle(for:)(a1._countAndFlagsBits, (uint64_t)a1._object, (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t, uint64_t))static CollaborationAttributionViewMetricsProvider.singleLineSubtitle<A>(for:metrics:));
}

uint64_t CollaborationAttributionViewMetricsProvider.singleLineTitle(for:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, void *, uint64_t, uint64_t))
{
  double v7 = (void *)(v3 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics);
  uint64_t v8 = *(void *)(v3 + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics + 24);
  uint64_t v9 = v7[4];
  uint64_t v10 = __swift_project_boxed_opaque_existential_1(v7, v8);
  type metadata accessor for CollaborationAttributionViewMetricsProvider();
  return a3(a1, a2, v10, v8, v9);
}

unint64_t lazy protocol witness table accessor for type Platform and conformance Platform()
{
  unint64_t result = lazy protocol witness table cache variable for type Platform and conformance Platform;
  if (!lazy protocol witness table cache variable for type Platform and conformance Platform)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Platform and conformance Platform);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Platform(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for Platform(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x19BE900D4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for Platform(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for Platform(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Platform()
{
  return &type metadata for Platform;
}

uint64_t dispatch thunk of RemoteViewMetricsProviding.style.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of RemoteViewMetricsProviding.maxWidth.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of RemoteViewMetricsProviding.drawingSize()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of CollaborationAttributionViewMetricsProviding.placeholderGlyphConfig.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of CollaborationAttributionViewMetricsProviding.placeholderGlyphMinSize.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of CollaborationAttributionViewMetricsProviding.avatarDiameter.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of CollaborationAttributionViewMetricsProviding.baseFont.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of CollaborationAttributionViewMetricsProviding.avatarLabelSpace.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of CollaborationAttributionViewMetricsProviding.titleSubtitleSpace.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t method lookup function for CollaborationAttributionViewMetricsProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CollaborationAttributionViewMetricsProvider);
}

uint64_t dispatch thunk of CollaborationAttributionViewMetricsProvider.__allocating_init(variant:slotStyle:maxWidth:placeholderGlyphConfig:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

id @objc CollaborationAttributionViewMetricsProvider.singleLineTitle(for:)(char *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, void *, uint64_t, uint64_t))
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)&a1[OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics + 24];
  uint64_t v10 = *(void *)&a1[OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics + 32];
  id v11 = __swift_project_boxed_opaque_existential_1(&a1[OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics], v9);
  type metadata accessor for CollaborationAttributionViewMetricsProvider();
  objc_super v12 = a1;
  uint64_t v13 = (void *)a4(v6, v8, v11, v9, v10);

  swift_bridgeObjectRelease();
  return v13;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *type metadata accessor for CollaborationAttributionViewStandardMetrics()
{
  return &unk_1EEC17A08;
}

void *initializeBufferWithCopyOfBuffer for CollaborationAttributionViewCompactMetrics(void *a1, uint64_t a2)
{
  int v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void **)(a2 + 16);
  a1[2] = v5;
  id v6 = v3;
  id v7 = v5;
  return a1;
}

void destroy for CollaborationAttributionViewCompactMetrics(uint64_t a1)
{
  int v2 = *(void **)(a1 + 16);
}

void *type metadata accessor for CollaborationAttributionViewCompactMetrics()
{
  return &unk_1EEC17920;
}

void *type metadata accessor for CollaborationAttributionViewConversationMetrics()
{
  return &unk_1EEC17AF0;
}

void *type metadata accessor for CollaborationAttributionViewStandardVisionMetrics()
{
  return &unk_1EEC17CC0;
}

void *type metadata accessor for CollaborationAttributionViewCompactVisionMetrics()
{
  return &unk_1EEC17BD8;
}

uint64_t assignWithCopy for CollaborationAttributionViewStandardMetrics(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  id v7 = *(void **)(a2 + 16);
  uint64_t v8 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v7;
  id v9 = v7;

  return a1;
}

uint64_t assignWithTake for CollaborationAttributionViewStandardMetrics(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = a2[2];

  return a1;
}

uint64_t getEnumTagSinglePayload for CollaborationAttributionViewStandardMetrics(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CollaborationAttributionViewStandardMetrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void *type metadata accessor for CollaborationAttributionViewConversationVisionMetrics()
{
  return &unk_1EEC17DA8;
}

CTFontRef specialized static CollaborationAttributionViewMetricsProvider.boldFontWithFont(font:)(const __CTFont *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef : Int])>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19BED1BC0;
  int v3 = (void *)*MEMORY[0x1E4F24620];
  *(void *)(inited + 32) = *MEMORY[0x1E4F24620];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Int)>);
  uint64_t v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_19BED1BC0;
  uint64_t v5 = (void *)*MEMORY[0x1E4F24610];
  *(void *)(v4 + 32) = *MEMORY[0x1E4F24610];
  *(void *)(v4 + 40) = 32770;
  id v6 = v3;
  id v7 = v5;
  *(void *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v4);
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef : Int]);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, type metadata accessor for CFStringRef);
  CFDictionaryRef isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v9 = CTFontCopyFontDescriptor(a1);
  CopyWithAttributes = CTFontDescriptorCreateCopyWithAttributes(v9, isa);
  CTFontRef v11 = CTFontCreateWithFontDescriptor(CopyWithAttributes, 0.0, 0);

  return v11;
}

id specialized CollaborationAttributionViewMetricsProviding.titleAttributedString(for:style:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  CTFontRef v7 = specialized CollaborationAttributionViewMetricsProviding.baseFont.getter(a4);
  if (!v7) {
    return 0;
  }
  CTFontRef v8 = v7;
  if (String.count.getter() <= 0)
  {

    return 0;
  }
  else
  {
    id v9 = v8;
    CTFontRef v10 = specialized static CollaborationAttributionViewMetricsProvider.boldFontWithFont(font:)(v9);

    if (a3)
    {
      CGFloat v11 = 1.0;
      CGFloat v12 = 1.0;
      CGFloat v13 = 1.0;
    }
    else
    {
      CGFloat v11 = 0.0;
      CGFloat v12 = 0.0;
      CGFloat v13 = 0.0;
    }
    CGColorRef GenericRGB = CGColorCreateGenericRGB(v11, v12, v13, 1.0);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, Any)>);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_19BED15B0;
    objc_super v17 = (void *)*MEMORY[0x1E4FB06F8];
    *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
    type metadata accessor for CTFontRef(0);
    *(void *)(inited + 40) = v10;
    uint64_t v18 = (void *)*MEMORY[0x1E4FB0700];
    *(void *)(inited + 64) = v19;
    *(void *)(inited + 72) = v18;
    type metadata accessor for CGColorRef(0);
    *(void *)(inited + 104) = v20;
    *(void *)(inited + 80) = GenericRGB;
    id v21 = v17;
    id v22 = v10;
    id v23 = v18;
    uint64_t v24 = GenericRGB;
    specialized Dictionary.init(dictionaryLiteral:)(inited);
    id v25 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
    swift_bridgeObjectRetain();
    uint64_t v26 = (void *)MEMORY[0x19F3906A0](a1, a2);
    swift_bridgeObjectRelease();
    type metadata accessor for NSAttributedStringKey(0);
    _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, type metadata accessor for NSAttributedStringKey);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v14 = objc_msgSend(v25, sel_initWithString_attributes_, v26, isa);
  }
  return v14;
}

{
  CTFontRef v7;
  CTFontRef v8;
  const __CTFont *v9;
  CTFontRef v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  id v14;
  CGColorRef GenericRGB;
  uint64_t inited;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  const __CTFont *v22;
  id v23;
  CGColor *v24;
  id v25;
  void *v26;
  Class isa;

  CTFontRef v7 = specialized CollaborationAttributionViewMetricsProviding.baseFont.getter(a4);
  if (!v7) {
    return 0;
  }
  CTFontRef v8 = v7;
  if (String.count.getter() <= 0)
  {

    return 0;
  }
  else
  {
    id v9 = v8;
    CTFontRef v10 = specialized static CollaborationAttributionViewMetricsProvider.boldFontWithFont(font:)(v9);

    if (a3)
    {
      CGFloat v11 = 1.0;
      CGFloat v12 = 1.0;
      CGFloat v13 = 1.0;
    }
    else
    {
      CGFloat v11 = 0.0;
      CGFloat v12 = 0.0;
      CGFloat v13 = 0.0;
    }
    CGColorRef GenericRGB = CGColorCreateGenericRGB(v11, v12, v13, 1.0);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, Any)>);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_19BED15B0;
    objc_super v17 = (void *)*MEMORY[0x1E4FB06F8];
    *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
    type metadata accessor for CTFontRef(0);
    *(void *)(inited + 40) = v10;
    uint64_t v18 = (void *)*MEMORY[0x1E4FB0700];
    *(void *)(inited + 64) = v19;
    *(void *)(inited + 72) = v18;
    type metadata accessor for CGColorRef(0);
    *(void *)(inited + 104) = v20;
    *(void *)(inited + 80) = GenericRGB;
    id v21 = v17;
    id v22 = v10;
    id v23 = v18;
    uint64_t v24 = GenericRGB;
    specialized Dictionary.init(dictionaryLiteral:)(inited);
    id v25 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
    swift_bridgeObjectRetain();
    uint64_t v26 = (void *)MEMORY[0x19F3906A0](a1, a2);
    swift_bridgeObjectRelease();
    type metadata accessor for NSAttributedStringKey(0);
    _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, type metadata accessor for NSAttributedStringKey);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v14 = objc_msgSend(v25, sel_initWithString_attributes_, v26, isa);
  }
  return v14;
}

{
  CTFontRef v7;
  CTFontRef v8;
  const __CTFont *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  id v13;
  CGColorRef GenericRGB;
  uint64_t inited;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const __CTFont *v20;
  id v21;
  id v22;
  CGColor *v23;
  id v24;
  void *v25;
  Class isa;

  CTFontRef v7 = specialized CollaborationAttributionViewMetricsProviding.baseFont.getter(a4);
  if (!v7) {
    return 0;
  }
  CTFontRef v8 = v7;
  if (String.count.getter() <= 0)
  {

    return 0;
  }
  else
  {
    id v9 = v8;
    if (a3)
    {
      CTFontRef v10 = 1.0;
      CGFloat v11 = 1.0;
      CGFloat v12 = 1.0;
    }
    else
    {
      CTFontRef v10 = 0.0;
      CGFloat v11 = 0.0;
      CGFloat v12 = 0.0;
    }
    CGColorRef GenericRGB = CGColorCreateGenericRGB(v10, v11, v12, 1.0);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, Any)>);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_19BED15B0;
    id v16 = (void *)*MEMORY[0x1E4FB06F8];
    *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
    type metadata accessor for CTFontRef(0);
    *(void *)(inited + 40) = v9;
    objc_super v17 = (void *)*MEMORY[0x1E4FB0700];
    *(void *)(inited + 64) = v18;
    *(void *)(inited + 72) = v17;
    type metadata accessor for CGColorRef(0);
    *(void *)(inited + 104) = v19;
    *(void *)(inited + 80) = GenericRGB;
    uint64_t v20 = v9;
    id v21 = v16;
    id v22 = v17;
    id v23 = GenericRGB;
    specialized Dictionary.init(dictionaryLiteral:)(inited);
    uint64_t v24 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
    swift_bridgeObjectRetain();
    id v25 = (void *)MEMORY[0x19F3906A0](a1, a2);
    swift_bridgeObjectRelease();
    type metadata accessor for NSAttributedStringKey(0);
    _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, type metadata accessor for NSAttributedStringKey);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    CGFloat v13 = objc_msgSend(v24, sel_initWithString_attributes_, v25, isa);
  }
  return v13;
}

CTFontRef specialized CollaborationAttributionViewMetricsProviding.baseFont.getter(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef : Int])>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19BED1BC0;
  int v3 = (void *)*MEMORY[0x1E4F24620];
  *(void *)(inited + 32) = *MEMORY[0x1E4F24620];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Int)>);
  uint64_t v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_19BED1BC0;
  uint64_t v5 = (void *)*MEMORY[0x1E4F24610];
  *(void *)(v4 + 32) = *MEMORY[0x1E4F24610];
  *(void *)(v4 + 40) = 0x8000;
  id v6 = v3;
  id v7 = v5;
  *(void *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v4);
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef : Int]);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, type metadata accessor for CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v9 = (void *)CTContentSizeCategoryForSlotStyle(a1);
  CTFontRef v10 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  CTFontRef v11 = CTFontCreateWithFontDescriptor(v10, 0.0, 0);

  return v11;
}

uint64_t _sSo11CFStringRefaABSHSCWlTm_0(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id specialized CollaborationAttributionViewMetricsProviding.subtitleAttributedString(for:style:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  CTFontRef v7 = specialized CollaborationAttributionViewMetricsProviding.baseFont.getter(a4);
  if (!v7) {
    return 0;
  }
  CTFontRef v8 = v7;
  if (String.count.getter() < 1)
  {

    return 0;
  }
  else
  {
    if (a3)
    {
      CGFloat v9 = 0.921568627;
      CGFloat v10 = 0.960784314;
    }
    else
    {
      CGFloat v9 = 0.235294118;
      CGFloat v10 = 0.262745098;
    }
    CGColorRef GenericRGB = CGColorCreateGenericRGB(v9, v9, v10, 0.6);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, Any)>);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_19BED15B0;
    id v14 = (void *)*MEMORY[0x1E4FB06F8];
    *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
    type metadata accessor for CTFontRef(0);
    *(void *)(inited + 40) = v8;
    CFAttributedStringRef v15 = (void *)*MEMORY[0x1E4FB0700];
    *(void *)(inited + 64) = v16;
    *(void *)(inited + 72) = v15;
    type metadata accessor for CGColorRef(0);
    *(void *)(inited + 104) = v17;
    *(void *)(inited + 80) = GenericRGB;
    id v18 = v14;
    uint64_t v19 = v8;
    id v20 = v15;
    id v21 = GenericRGB;
    specialized Dictionary.init(dictionaryLiteral:)(inited);
    id v22 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
    swift_bridgeObjectRetain();
    id v23 = (void *)MEMORY[0x19F3906A0](a1, a2);
    swift_bridgeObjectRelease();
    type metadata accessor for NSAttributedStringKey(0);
    _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, type metadata accessor for NSAttributedStringKey);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v11 = objc_msgSend(v22, sel_initWithString_attributes_, v23, isa);
  }
  return v11;
}

id CollaborationAttributionView.init(highlight:variant:)(void *a1, uint64_t a2)
{
  id v3 = specialized CollaborationAttributionView.init(highlight:variant:)(a1, a2);

  return v3;
}

uint64_t CollaborationAttributionView.delegate.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___SLCollaborationAttributionView_delegate;
  swift_beginAccess();
  return MEMORY[0x19F392140](v1);
}

uint64_t CollaborationAttributionView.delegate.setter()
{
  return swift_unknownObjectRelease();
}

void (*CollaborationAttributionView.delegate.modify(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___SLCollaborationAttributionView_delegate;
  v3[4] = v1;
  void v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x19F392140](v5);
  return CollaborationAttributionView.delegate.modify;
}

void CollaborationAttributionView.delegate.modify(void **a1, char a2)
{
  id v3 = *a1;
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t CollaborationAttributionView.remoteContentDidLoad.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___SLCollaborationAttributionView_remoteContentDidLoad);
  swift_beginAccess();
  uint64_t v2 = *v1;
  outlined copy of (@escaping @callee_guaranteed () -> ())?(*v1);
  return v2;
}

uint64_t CollaborationAttributionView.remoteContentDidLoad.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR___SLCollaborationAttributionView_remoteContentDidLoad);
  swift_beginAccess();
  uint64_t v6 = *v5;
  uint64_t *v5 = a1;
  v5[1] = a2;
  return outlined consume of (@escaping @callee_guaranteed () -> ())?(v6);
}

uint64_t (*CollaborationAttributionView.remoteContentDidLoad.modify())()
{
  return CollaborationAttributionView.remoteContentDidLoad.modify;
}

void *CollaborationAttributionView.highlight.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___SLCollaborationAttributionView_highlight);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void CollaborationAttributionView.highlight.setter(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (void **)&v2[OBJC_IVAR___SLCollaborationAttributionView_highlight];
  swift_beginAccess();
  uint64_t v5 = *v4;
  *uint64_t v4 = a1;
  id v6 = a1;
  if (!a1)
  {
    if (!v5)
    {
LABEL_15:
      id v7 = v5;
      goto LABEL_16;
    }
LABEL_6:
    double v10 = CollaborationAttributionView.minViableGlyphSize()();
    if (*(void *)&v2[OBJC_IVAR___SLCollaborationAttributionView_variant] == 4) {
      double v11 = 44.0;
    }
    else {
      double v11 = 0.0;
    }
    objc_msgSend(v2, sel_bounds);
    if (v12 > v10) {
      double v13 = v12;
    }
    else {
      double v13 = v10;
    }
    if (v13 <= v11) {
      double v13 = v11;
    }
    objc_msgSend(v2, sel_setMaxWidth_, v13);
    id v14 = objc_msgSend(v2, sel_slotView);
    objc_msgSend(v14, sel__updateContent);

    objc_msgSend(v2, sel_invalidateIntrinsicContentSize);
    goto LABEL_15;
  }
  if (!v5) {
    goto LABEL_6;
  }
  type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for SLHighlight);
  id v7 = v5;
  id v8 = v6;
  char v9 = static NSObject.== infix(_:_:)();

  if ((v9 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_16:
}

void (*CollaborationAttributionView.highlight.modify(void *a1))(uint64_t a1, char a2)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___SLCollaborationAttributionView_highlight;
  v3[4] = v1;
  void v3[5] = v4;
  uint64_t v5 = (void **)(v1 + v4);
  swift_beginAccess();
  id v6 = *v5;
  v3[3] = *v5;
  id v7 = v6;
  return CollaborationAttributionView.highlight.modify;
}

void CollaborationAttributionView.highlight.modify(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v4 = (void **)(*(void *)a1 + 24);
  id v3 = *v4;
  uint64_t v6 = *(void *)(*(void *)a1 + 32);
  uint64_t v5 = *(void *)(*(void *)a1 + 40);
  id v7 = *(void **)(v6 + v5);
  *(void *)(v6 + v5) = *v4;
  if (a2)
  {
    id v8 = v3;
    if (v3)
    {
      if (v7)
      {
        type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for SLHighlight);
        id v9 = v7;
        id v10 = v8;
        char v11 = static NSObject.== infix(_:_:)();

        if (v11) {
          goto LABEL_21;
        }
      }
    }
    else if (!v7)
    {
LABEL_20:
      id v9 = v7;
LABEL_21:

      id v12 = *v4;
      goto LABEL_33;
    }
    uint64_t v16 = (char *)v2[4];
    double v17 = CollaborationAttributionView.minViableGlyphSize()();
    if (*(void *)&v16[OBJC_IVAR___SLCollaborationAttributionView_variant] == 4) {
      double v18 = 44.0;
    }
    else {
      double v18 = 0.0;
    }
    objc_msgSend(v16, sel_bounds);
    if (v19 > v17) {
      double v20 = v19;
    }
    else {
      double v20 = v17;
    }
    if (v20 <= v18) {
      double v20 = v18;
    }
    objc_msgSend(v16, sel_setMaxWidth_, v20);
    id v21 = objc_msgSend(v16, sel_slotView);
    objc_msgSend(v21, sel__updateContent);

    objc_msgSend(v16, sel_invalidateIntrinsicContentSize);
    goto LABEL_20;
  }
  id v12 = v3;
  if (v3)
  {
    if (v7)
    {
      type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for SLHighlight);
      id v13 = v7;
      id v14 = v12;
      char v15 = static NSObject.== infix(_:_:)();

      if (v15)
      {

        id v12 = v14;
        goto LABEL_33;
      }
    }
    goto LABEL_23;
  }
  if (v7)
  {
LABEL_23:
    id v22 = (char *)v2[4];
    double v23 = CollaborationAttributionView.minViableGlyphSize()();
    if (*(void *)&v22[OBJC_IVAR___SLCollaborationAttributionView_variant] == 4) {
      double v24 = 44.0;
    }
    else {
      double v24 = 0.0;
    }
    objc_msgSend(v22, sel_bounds);
    if (v25 > v23) {
      double v26 = v25;
    }
    else {
      double v26 = v23;
    }
    if (v26 <= v24) {
      double v26 = v24;
    }
    objc_msgSend(v22, sel_setMaxWidth_, v26);
    id v27 = objc_msgSend(v22, sel_slotView);
    objc_msgSend(v27, sel__updateContent);

    objc_msgSend(v22, sel_invalidateIntrinsicContentSize);
  }

LABEL_33:
  free(v2);
}

uint64_t CollaborationAttributionView.title.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___SLCollaborationAttributionView_title);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t CollaborationAttributionView.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR___SLCollaborationAttributionView_title);
  swift_beginAccess();
  void *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*CollaborationAttributionView.title.modify())()
{
  return CollaborationAttributionView.title.modify;
}

uint64_t CollaborationAttributionView.automaticallyAdjustsMaxWidthToFitBounds.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SLCollaborationAttributionView_automaticallyAdjustsMaxWidthToFitBounds);
  swift_beginAccess();
  return *v1;
}

id CollaborationAttributionView.automaticallyAdjustsMaxWidthToFitBounds.setter(char a1)
{
  id v3 = &v1[OBJC_IVAR___SLCollaborationAttributionView_automaticallyAdjustsMaxWidthToFitBounds];
  id result = (id)swift_beginAccess();
  char v5 = *v3;
  char *v3 = a1;
  if (v5 & 1) == 0 && (a1) {
    return objc_msgSend(v1, sel_setNeedsLayout);
  }
  return result;
}

void (*CollaborationAttributionView.automaticallyAdjustsMaxWidthToFitBounds.modify(void *a1))(id **a1)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___SLCollaborationAttributionView_automaticallyAdjustsMaxWidthToFitBounds;
  v3[3] = v1;
  v3[4] = v4;
  char v5 = (unsigned char *)(v1 + v4);
  swift_beginAccess();
  *((unsigned char *)v3 + 40) = *v5;
  return CollaborationAttributionView.automaticallyAdjustsMaxWidthToFitBounds.modify;
}

void CollaborationAttributionView.automaticallyAdjustsMaxWidthToFitBounds.modify(id **a1)
{
  uint64_t v1 = *a1;
  id v3 = (*a1)[3];
  uint64_t v2 = (*a1)[4];
  int v4 = *((unsigned __int8 *)*a1 + 40);
  char v5 = v2[(void)v3];
  v2[(void)v3] = v4;
  if ((v5 & 1) == 0 && v4) {
    objc_msgSend(v1[3], sel_setNeedsLayout);
  }
  free(v1);
}

double CollaborationAttributionView.minViableGlyphSize()()
{
  id v1 = objc_msgSend(v0, sel_lastRenderedSlotStyle);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = *(id *)&v0[OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration];
    objc_msgSend(v3, sel_minViableSizeWithStyle_, v2);
    double v5 = v4;
  }
  else
  {
    id v6 = objc_msgSend(v0, sel_traitCollection);
    objc_msgSend(v6, sel_displayScale);
    double v8 = v7;

    id v9 = objc_msgSend(v0, sel_traitCollection);
    id v10 = objc_msgSend(v9, sel_layoutDirection);

    BOOL v11 = v10 == (id)1;
    id v12 = objc_msgSend(v0, sel_traitCollection);
    id v13 = objc_msgSend(v12, sel_userInterfaceStyle);

    objc_msgSend(*(id *)&v0[OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration], sel_minViableSizeWithDisplayScale_RTL_darkMode_, v11, v13 == (id)2, v8);
    return v14;
  }
  return v5;
}

id CollaborationAttributionView.updatePlaceholderSymbol(scale:weight:pointSize:)(uint64_t a1, uint64_t a2, double a3)
{
  if ((unint64_t)(a1 - 1) >= 3) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = a1;
  }
  id v7 = objc_allocWithZone((Class)SLDImageSymbolConfiguration);
  double v8 = (void *)MEMORY[0x19F3906A0](0xD000000000000022, 0x800000019BED9FC0);
  id v9 = objc_msgSend(v7, sel_initWithName_coreUISize_weight_pointSize_, v8, v6, a2, a3);

  id v10 = *(void **)&v3[OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration];
  *(void *)&v3[OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration] = v9;
  id v11 = v9;
  CollaborationAttributionView.placeholderGlyphConfiguration.didset();

  double v12 = CollaborationAttributionView.minViableGlyphSize()();
  double v13 = 44.0;
  if (*(void *)&v3[OBJC_IVAR___SLCollaborationAttributionView_variant] != 4) {
    double v13 = 0.0;
  }
  if (v12 > v13) {
    double v14 = v12;
  }
  else {
    double v14 = v13;
  }
  objc_msgSend(v3, sel_maxWidth);
  if (v14 > v15) {
    double v15 = v14;
  }
  return objc_msgSend(v3, sel_setMaxWidth_, v15);
}

void CollaborationAttributionView._renderRemoteContent(forLayerContextID:style:forTitle:maxWidth:attributionIdentifiers:usingService:yield:)(uint64_t a1, void *a2, uint64_t a3, unint64_t a4, double a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = v9;
  uint64_t ObjectType = swift_getObjectType();
  if (one-time initialization token for collaborationRenderer != -1) {
    swift_once();
  }
  uint64_t v17 = type metadata accessor for Logger();
  __swift_project_value_buffer(v17, (uint64_t)static Log.collaborationRenderer);
  id v18 = a2;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v19 = v18;
  double v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.default.getter();
  uint64_t v42 = a1;
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v41 = a3;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v38 = (void *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    aBlock[0] = v39;
    *(_DWORD *)uint64_t v22 = 134219010;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v22 + 12) = 2112;
    uint64_t v40 = a8;
    id v23 = v19;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v38 = v19;

    *(_WORD *)(v22 + 22) = 2080;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v41, a4, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v22 + 32) = 2080;
    uint64_t v24 = swift_bridgeObjectRetain();
    uint64_t v25 = MEMORY[0x19F390850](v24, MEMORY[0x1E4FBB1A0]);
    unint64_t v27 = v26;
    swift_bridgeObjectRelease();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v25, v27, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    a8 = v40;
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 42) = 2048;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_19BE17000, v20, v21, "Received request to render remote content. layerID: %ld style: %@ title: %s attributionIdentifiers: %s maxWidth: %f", (uint8_t *)v22, 0x34u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x19F392080](v38, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x19F392080](v39, -1, -1);
    uint64_t v28 = v22;
    a3 = v41;
    MEMORY[0x19F392080](v28, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  id v29 = *(id *)(v10 + OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration);
  CTFontRef v30 = (void *)MEMORY[0x19F3906A0](a3, a4);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  uint64_t v32 = *(void *)(v10 + OBJC_IVAR___SLCollaborationAttributionView_variant);
  uint64_t v33 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = v42;
  *(void *)(v34 + 24) = v33;
  *(void *)(v34 + 32) = v19;
  *(double *)(v34 + 40) = a5;
  *(void *)(v34 + 48) = a8;
  *(void *)(v34 + 56) = a9;
  *(void *)(v34 + 64) = ObjectType;
  aBlock[4] = (uint64_t)partial apply for closure #1 in CollaborationAttributionView._renderRemoteContent(forLayerContextID:style:forTitle:maxWidth:attributionIdentifiers:usingService:yield:);
  aBlock[5] = v34;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)thunk for @escaping @callee_guaranteed (@guaranteed UISSlotRemoteContent?) -> ();
  aBlock[3] = (uint64_t)&block_descriptor_26;
  uint64_t v35 = _Block_copy(aBlock);
  id v36 = v19;
  id v37 = v29;
  swift_retain();
  swift_release();
  objc_msgSend(a7, sel_collaborationAttributionViewForTitle_attributionIdentifiers_style_placeholderGlyphConfiguration_maxWidth_variant_layerContextID_reply_, v30, isa, v36, v37, v32, v42, a5, v35);
  _Block_release(v35);
}

double CollaborationAttributionView.expectedHeight(for:)(double a1)
{
  objc_msgSend(v1, sel_frame);
  double Width = CGRectGetWidth(v11);
  if (SL_CGFloatApproximatelyEqualToFloat(a1, Width)
    || (id v4 = objc_msgSend(v1, sel_lastRenderedSlotStyle)) == 0)
  {
    id v5 = objc_msgSend(v1, sel_slotView);
    objc_msgSend(v5, sel_intrinsicContentSize);
    double v8 = v9;
  }
  else
  {
    id v5 = v4;
    id v6 = objc_msgSend(objc_allocWithZone((Class)SLDCollaborationAttributionViewEmptySlotContent), sel_initWithStyle_variant_maxWidth_placeholderGlyphConfig_forRemote_, v4, *(void *)&v1[OBJC_IVAR___SLCollaborationAttributionView_variant], *(void *)&v1[OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration], 0, a1);
    objc_msgSend(v6, sel_contentSize);
    double v8 = v7;
  }
  return v8;
}

uint64_t key path getter for CollaborationAttributionView.remoteContentDidLoad : CollaborationAttributionView@<X0>(void **a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0xA0))();
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = v4;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v5;
    *(void *)(result + 24) = v6;
    double v7 = partial apply for thunk for @escaping @callee_guaranteed () -> ();
  }
  else
  {
    double v7 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())result;
  return result;
}

uint64_t key path setter for CollaborationAttributionView.remoteContentDidLoad : CollaborationAttributionView(uint64_t *a1, void **a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = partial apply for thunk for @escaping @callee_guaranteed () -> (@out ());
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  double v7 = *(uint64_t (**)(uint64_t (*)(), uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0xA8);
  outlined copy of (@escaping @callee_guaranteed () -> ())?(v3);
  return v7(v6, v5);
}

void CollaborationAttributionView.placeholderGlyphConfiguration.didset()
{
  id v1 = v0;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration];
  type metadata accessor for SLHighlight(0, (unint64_t *)&lazy cache variable for type metadata for SLDImageSymbolConfiguration);
  id v3 = v2;
  char v4 = static NSObject.== infix(_:_:)();

  if ((v4 & 1) == 0)
  {
    double v5 = CollaborationAttributionView.minViableGlyphSize()();
    if (*(void *)&v1[OBJC_IVAR___SLCollaborationAttributionView_variant] == 4) {
      double v6 = 44.0;
    }
    else {
      double v6 = 0.0;
    }
    objc_msgSend(v1, sel_bounds);
    if (v7 > v5) {
      double v8 = v7;
    }
    else {
      double v8 = v5;
    }
    if (v8 <= v6) {
      double v8 = v6;
    }
    objc_msgSend(v1, sel_setMaxWidth_, v8);
    id v9 = objc_msgSend(v1, sel_slotView);
    objc_msgSend(v9, sel__updateContent);

    objc_msgSend(v1, sel_invalidateIntrinsicContentSize);
  }
}

id CollaborationAttributionView.__allocating_init(highlight:variant:)(void *a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  id v6 = specialized CollaborationAttributionView.init(highlight:variant:)(a1, a2);

  return v6;
}

id CollaborationAttributionView.__allocating_init(variant:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return CollaborationAttributionView.init(variant:)(a1);
}

id CollaborationAttributionView.init(variant:)(uint64_t a1)
{
  swift_unknownObjectWeakInit();
  id v3 = &v1[OBJC_IVAR___SLCollaborationAttributionView_remoteContentDidLoad];
  void *v3 = 0;
  v3[1] = 0;
  *(void *)&v1[OBJC_IVAR___SLCollaborationAttributionView_highlight] = 0;
  char v4 = &v1[OBJC_IVAR___SLCollaborationAttributionView_title];
  *char v4 = 0;
  v4[1] = 0;
  v1[OBJC_IVAR___SLCollaborationAttributionView_automaticallyAdjustsMaxWidthToFitBounds] = 0;
  *(void *)&v1[OBJC_IVAR___SLCollaborationAttributionView_variant] = a1;
  id v5 = objc_allocWithZone((Class)SLDImageSymbolConfiguration);
  id v6 = v1;
  double v7 = (void *)MEMORY[0x19F3906A0](0xD000000000000022, 0x800000019BED9FC0);
  id v8 = objc_msgSend(v5, sel_initWithName_coreUISize_weight_pointSize_, v7, 2, 3, 22.0);

  uint64_t v9 = OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration;
  *(void *)&v6[OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration] = v8;
  id v10 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v10, sel_scale);
  double v12 = v11;

  id v13 = *(id *)&v6[v9];
  objc_msgSend(v13, sel_minViableSizeWithDisplayScale_RTL_darkMode_, 0, 0, v12);
  double v15 = v14;

  double v16 = 44.0;
  if (a1 != 4) {
    double v16 = 0.0;
  }
  if (v15 <= v16) {
    double v15 = v16;
  }
  type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for SLDCollaborationAttributionViewService);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v19.receiver = v6;
  v19.super_class = (Class)type metadata accessor for CollaborationAttributionView();
  return objc_msgSendSuper2(&v19, sel_initWithServiceProxyClass_maxWidth_, ObjCClassFromMetadata, v15);
}

id CollaborationAttributionView.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

uint64_t CollaborationAttributionView.init(coder:)(void *a1)
{
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

Swift::Void __swiftcall CollaborationAttributionView.layoutSubviews()()
{
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for CollaborationAttributionView();
  id v1 = objc_msgSendSuper2(&v6, sel_layoutSubviews);
  if ((*(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x100))(v1))
  {
    double v2 = CollaborationAttributionView.minViableGlyphSize()();
    if (*(void *)((char *)v0 + OBJC_IVAR___SLCollaborationAttributionView_variant) == 4) {
      double v3 = 44.0;
    }
    else {
      double v3 = 0.0;
    }
    objc_msgSend(v0, sel_bounds);
    if (v4 > v2) {
      double v5 = v4;
    }
    else {
      double v5 = v2;
    }
    if (v5 <= v3) {
      double v5 = v3;
    }
    objc_msgSend(v0, sel_setMaxWidth_, v5);
  }
}

Swift::Void __swiftcall CollaborationAttributionView.traitCollectionDidChange(_:)(UITraitCollection_optional a1)
{
  Class isa = a1.value.super.isa;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for CollaborationAttributionView();
  objc_msgSendSuper2(&v11, sel_traitCollectionDidChange_, isa);
  if (isa) {
    Class isa = (Class)[(objc_class *)isa preferredContentSizeCategory];
  }
  id v3 = objc_msgSend(v1, sel_traitCollection);
  id v4 = objc_msgSend(v3, sel_preferredContentSizeCategory);

  if (!isa)
  {

    goto LABEL_11;
  }
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  if (v5 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v7 == v8)
  {

    swift_bridgeObjectRelease_n();
    return;
  }
  char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v10 & 1) == 0) {
LABEL_11:
  }
    objc_msgSend(v1, sel_invalidateIntrinsicContentSize);
}

id CollaborationAttributionView.makePlaceholderSlotContent(for:)(void *a1)
{
  double v2 = v1;
  uint64_t v4 = *(void *)&v1[OBJC_IVAR___SLCollaborationAttributionView_variant];
  BOOL v5 = v4 == 4 || v4 == 1;
  if (!v5 || (objc_msgSend(v2, sel_maxWidth), v6 <= 0.0))
  {
    id v14 = a1;
    objc_msgSend(v2, sel_bounds);
    id v13 = objc_msgSend(objc_allocWithZone((Class)SLDCollaborationAttributionViewEmptySlotContent), sel_initWithStyle_variant_maxWidth_placeholderGlyphConfig_forRemote_, v14, v4, *(void *)&v2[OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration], 0, CGRectGetWidth(v15));

    return v13;
  }
  uint64_t v7 = *(void **)&v2[OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration];
  uint64_t v8 = self;
  id v9 = v7;
  objc_msgSend(v2, sel_maxWidth);
  id v10 = objc_msgSend(v8, sel_placeholderTagForMaxWidth_placeholderGlyphConfiguration_, v9);
  id v11 = objc_msgSend(objc_allocWithZone((Class)SLDCollaborationAttributionViewSlotDrawer), sel_init);
  id result = objc_msgSend(v11, sel_drawingWithStyle_tag_forRemote_, a1, v10, 0);
  if (result)
  {
    id v13 = objc_msgSend(self, sel_contentWithDrawing_style_, result, a1);

    swift_unknownObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

void CollaborationAttributionView.renderRemoteContent(forLayerContextID:style:yield:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v39 = a3;
  uint64_t v40 = a4;
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = type metadata accessor for DispatchQoS();
  uint64_t v10 = *(void *)(v42 - 8);
  MEMORY[0x1F4188790](v42);
  uint64_t v41 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for collaborationRenderer != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  __swift_project_value_buffer(v12, (uint64_t)static Log.collaborationRenderer);
  id v13 = a2;
  id v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  uint64_t v43 = v14;
  BOOL v16 = os_log_type_enabled(v14, v15);
  id v37 = v13;
  uint64_t v38 = a1;
  if (v16)
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v35 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 134218242;
    aBlock[0] = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v17 + 12) = 2112;
    aBlock[0] = v13;
    id v18 = v13;
    uint64_t v36 = v10;
    uint64_t v19 = v7;
    uint64_t v20 = v6;
    id v21 = v18;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v22 = v35;
    *uint64_t v35 = v13;

    uint64_t v6 = v20;
    uint64_t v7 = v19;
    uint64_t v10 = v36;
    id v23 = v43;
    _os_log_impl(&dword_19BE17000, v43, v15, "Received request to render remote content for layerID: %ld style: %@", (uint8_t *)v17, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x19F392080](v22, -1, -1);
    MEMORY[0x19F392080](v17, -1, -1);
  }
  else
  {
  }
  id v24 = objc_msgSend(v44, sel_serviceProxy);
  id v25 = objc_msgSend(v24, sel_collaborationAttributionViewService);

  if (v25)
  {
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for OS_dispatch_queue);
    unint64_t v26 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v27 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v28 = (void *)swift_allocObject();
    CTFontRef v30 = v37;
    uint64_t v29 = v38;
    void v28[2] = v27;
    v28[3] = v29;
    v28[4] = v30;
    v28[5] = v25;
    uint64_t v31 = v40;
    v28[6] = v39;
    v28[7] = v31;
    aBlock[4] = partial apply for closure #1 in CollaborationAttributionView.renderRemoteContent(forLayerContextID:style:yield:);
    aBlock[5] = v28;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    aBlock[3] = &block_descriptor_0;
    uint64_t v32 = _Block_copy(aBlock);
    id v33 = v30;
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    uint64_t v34 = v41;
    static DispatchQoS.unspecified.getter();
    aBlock[0] = MEMORY[0x1E4FBC860];
    lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    MEMORY[0x19F390980](0, v34, v9, v32);
    _Block_release(v32);
    swift_unknownObjectRelease();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v34, v42);
  }
}

void closure #1 in CollaborationAttributionView.renderRemoteContent(forLayerContextID:style:yield:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v86 = a5;
  uint64_t v87 = a3;
  uint64_t v85 = a2;
  uint64_t v9 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v73 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for DispatchQoS();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  BOOL v16 = (char *)&v73 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v17 = (void *)MEMORY[0x19F392140](a1 + 16);
  if (v17)
  {
    id v18 = v17;
    uint64_t v80 = a4;
    uint64_t v81 = a6;
    uint64_t v82 = v16;
    uint64_t v83 = v14;
    uint64_t v19 = (void *)MEMORY[0x1E4FBC8C8];
    uint64_t v20 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v17) + 0xB8);
    uint64_t v21 = v20();
    if (v21)
    {
      uint64_t v22 = (void *)v21;
      self;
      id v23 = (void *)swift_dynamicCastObjCClass();
      if (!v23) {
    }
      }
    else
    {
      id v23 = 0;
    }
    uint64_t v24 = (*(uint64_t (**)(void))((*v19 & *v18) + 0xE8))();
    if (v25)
    {
      unint64_t v26 = v25;
      uint64_t v79 = v24;
      uint64_t v27 = (void *)v20();
      if (!v27)
      {
LABEL_33:
        swift_bridgeObjectRelease();
        if (one-time initialization token for collaborationRenderer == -1) {
          goto LABEL_34;
        }
        goto LABEL_40;
      }
    }
    else if (v23)
    {
      id v28 = objc_msgSend(v23, sel_fileName);
      uint64_t v79 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v26 = v29;

      uint64_t v27 = (void *)v20();
      if (!v27) {
        goto LABEL_33;
      }
    }
    else
    {
      unint64_t v26 = 0x800000019BEDA2A0;
      uint64_t v79 = 0xD000000000000017;
      uint64_t v27 = (void *)((uint64_t (*)(uint64_t))v20)(v24);
      if (!v27) {
        goto LABEL_33;
      }
    }
    CTFontRef v30 = v27;
    unint64_t v77 = v26;
    id v31 = objc_msgSend(v27, sel_attributions);

    type metadata accessor for SLHighlight(0, (unint64_t *)&lazy cache variable for type metadata for SLAttribution);
    unint64_t v32 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    id v78 = v18;
    if (v32 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v33 = _CocoaArrayWrapper.endIndex.getter();
    }
    else
    {
      uint64_t v33 = *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    id v18 = (void *)MEMORY[0x1E4FBC860];
    id v84 = v23;
    uint64_t v76 = v9;
    uint64_t v75 = v10;
    uint64_t v74 = v13;
    uint64_t v73 = v12;
    if (v33)
    {
      if (v33 < 1)
      {
        __break(1u);
LABEL_40:
        swift_once();
LABEL_34:
        uint64_t v64 = type metadata accessor for Logger();
        __swift_project_value_buffer(v64, (uint64_t)static Log.collaborationRenderer);
        uint64_t v65 = v18;
        double v66 = Logger.logObject.getter();
        os_log_type_t v67 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v66, v67))
        {
          uint64_t v68 = (uint8_t *)swift_slowAlloc();
          uint64_t v69 = swift_slowAlloc();
          id v84 = v23;
          uint64_t v70 = v69;
          aBlock[0] = v69;
          *(_DWORD *)uint64_t v68 = 136315138;
          uint64_t v88 = v20();
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SLHighlight?);
          uint64_t v71 = String.init<A>(describing:)();
          uint64_t v88 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v71, v72, aBlock);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_19BE17000, v66, v67, "AttributionIdentifiers for highlight: %s are nil, dropping remote render request.", v68, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x19F392080](v70, -1, -1);
          MEMORY[0x19F392080](v68, -1, -1);
        }
        else
        {
        }
        return;
      }
      uint64_t v34 = 0;
      do
      {
        if ((v32 & 0xC000000000000001) != 0) {
          id v35 = (id)MEMORY[0x19F390AB0](v34, v32);
        }
        else {
          id v35 = *(id *)(v32 + 8 * v34 + 32);
        }
        uint64_t v36 = v35;
        id v37 = objc_msgSend(v35, sel_uniqueIdentifier, v73);
        uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v40 = v39;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          id v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v18[2] + 1, 1, v18);
        }
        unint64_t v42 = v18[2];
        unint64_t v41 = v18[3];
        if (v42 >= v41 >> 1) {
          id v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v41 > 1), v42 + 1, 1, v18);
        }
        ++v34;
        v18[2] = v42 + 1;
        uint64_t v43 = &v18[2 * v42];
        v43[4] = v38;
        v43[5] = v40;
      }
      while (v33 != v34);
    }
    swift_bridgeObjectRelease_n();
    id v44 = v78;
    objc_msgSend(v78, sel_maxWidth);
    if (v45 <= 0.0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v59 = v84;
      if (one-time initialization token for collaborationRenderer != -1) {
        swift_once();
      }
      uint64_t v60 = type metadata accessor for Logger();
      __swift_project_value_buffer(v60, (uint64_t)static Log.collaborationRenderer);
      uint64_t v61 = Logger.logObject.getter();
      os_log_type_t v62 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v61, v62))
      {
        double v63 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)double v63 = 0;
        _os_log_impl(&dword_19BE17000, v61, v62, "maxWidth is 0.0, dropping remote render request.", v63, 2u);
        MEMORY[0x19F392080](v63, -1, -1);
      }
      else
      {
      }
    }
    else
    {
      id v46 = objc_msgSend(v44, sel_remoteRenderingQueue);
      uint64_t v47 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v48 = (void *)swift_allocObject();
      uint64_t v49 = v85;
      v48[2] = v47;
      v48[3] = v49;
      uint64_t v50 = v87;
      uint64_t v51 = v79;
      uint64_t v52 = v80;
      v48[4] = v87;
      v48[5] = v51;
      v48[6] = v77;
      v48[7] = v18;
      uint64_t v53 = v86;
      v48[8] = v52;
      v48[9] = v53;
      v48[10] = v81;
      aBlock[4] = (uint64_t)partial apply for closure #2 in closure #1 in CollaborationAttributionView.renderRemoteContent(forLayerContextID:style:yield:);
      aBlock[5] = (uint64_t)v48;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)thunk for @escaping @callee_guaranteed @Sendable () -> ();
      aBlock[3] = (uint64_t)&block_descriptor_46;
      uint64_t v54 = _Block_copy(aBlock);
      swift_retain();
      id v55 = v50;
      swift_unknownObjectRetain();
      swift_retain();
      CFAttributedStringRef v56 = v82;
      static DispatchQoS.unspecified.getter();
      uint64_t v88 = MEMORY[0x1E4FBC860];
      lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, MEMORY[0x1E4FBCB00]);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
      lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
      uint64_t v57 = v73;
      uint64_t v58 = v76;
      dispatch thunk of SetAlgebra.init<A>(_:)();
      MEMORY[0x19F390980](0, v56, v57, v54);
      _Block_release(v54);

      (*(void (**)(char *, uint64_t))(v75 + 8))(v57, v58);
      (*(void (**)(char *, uint64_t))(v83 + 8))(v56, v74);
      swift_release();
      swift_release();
    }
  }
}

void closure #2 in closure #1 in CollaborationAttributionView.renderRemoteContent(forLayerContextID:style:yield:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16 = a1 + 16;
  swift_beginAccess();
  uint64_t v17 = (void *)MEMORY[0x19F392140](v16);
  if (v17)
  {
    id v18 = v17;
    objc_msgSend(v17, sel_maxWidth);
    CollaborationAttributionView._renderRemoteContent(forLayerContextID:style:forTitle:maxWidth:attributionIdentifiers:usingService:yield:)(a2, a3, a4, a5, v19, a6, a7, a8, a9);
  }
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable () -> ()(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t closure #1 in CollaborationAttributionView._renderRemoteContent(forLayerContextID:style:forTitle:maxWidth:attributionIdentifiers:usingService:yield:)(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8)
{
  uint64_t v40 = a6;
  unint64_t v41 = a4;
  uint64_t v37 = a5;
  uint64_t v39 = a1;
  uint64_t v12 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v38 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = type metadata accessor for DispatchQoS();
  uint64_t v15 = *(void *)(v42 - 8);
  MEMORY[0x1F4188790](v42);
  uint64_t v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for collaborationRenderer != -1) {
    swift_once();
  }
  uint64_t v18 = type metadata accessor for Logger();
  __swift_project_value_buffer(v18, (uint64_t)static Log.collaborationRenderer);
  double v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = a2;
    id v23 = v21;
    *(_DWORD *)uint64_t v21 = 134217984;
    aBlock[0] = v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_19BE17000, v19, v20, "Finished render request layerID: %ld", v23, 0xCu);
    MEMORY[0x19F392080](v23, -1, -1);
  }

  uint64_t v24 = a3 + 16;
  type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for OS_dispatch_queue);
  unint64_t v25 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v26 = swift_allocObject();
  swift_beginAccess();
  uint64_t v27 = (void *)MEMORY[0x19F392140](v24);
  swift_unknownObjectWeakInit();

  uint64_t v28 = swift_allocObject();
  uint64_t v30 = v40;
  unint64_t v29 = v41;
  *(void *)(v28 + 16) = v26;
  *(void *)(v28 + 24) = v29;
  id v31 = v39;
  *(void *)(v28 + 32) = v39;
  *(double *)(v28 + 40) = a8;
  *(void *)(v28 + 48) = v37;
  *(void *)(v28 + 56) = v30;
  *(void *)(v28 + 64) = a7;
  aBlock[4] = partial apply for closure #1 in closure #1 in CollaborationAttributionView._renderRemoteContent(forLayerContextID:style:forTitle:maxWidth:attributionIdentifiers:usingService:yield:);
  aBlock[5] = v28;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor_33;
  unint64_t v32 = _Block_copy(aBlock);
  id v33 = v31;
  swift_retain();
  id v34 = v29;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = MEMORY[0x1E4FBC860];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x19F390980](0, v17, v14, v32);
  _Block_release(v32);

  (*(void (**)(char *, uint64_t))(v38 + 8))(v14, v12);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v42);
}

void closure #1 in closure #1 in CollaborationAttributionView._renderRemoteContent(forLayerContextID:style:forTitle:maxWidth:attributionIdentifiers:usingService:yield:)(uint64_t a1, uint64_t a2, void *a3, void (*a4)(void), double a5)
{
  uint64_t v9 = a1 + 16;
  swift_beginAccess();
  uint64_t v10 = (void *)MEMORY[0x19F392140](v9);
  if (v10)
  {
    uint64_t v11 = v10;
    objc_msgSend(v10, sel_setLastRenderedSlotStyle_, a2);
    objc_msgSend(v11, sel_setRemoteContentIsLoaded_, a3 != 0);
    if (a3)
    {
      id v12 = a3;
      a4();
      objc_msgSend(v11, sel_setNeedsLayout);
      id v13 = objc_msgSend(v11, sel_layoutIfNeeded);
      uint64_t v14 = (void *)(*(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & *v11) + 0x88))(v13);
      if (v14)
      {
        objc_msgSend(v14, sel_collaborationAttributionViewDidLoadNewRemoteContent_, v11);

        swift_unknownObjectRelease();
      }
      else
      {
      }
    }
    else
    {
      static os_log_type_t.error.getter();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v15 = swift_allocObject();
      *(_OWORD *)(v15 + 16) = xmmword_19BED1BD0;
      swift_getMetatypeMetadata();
      uint64_t v16 = String.init<A>(describing:)();
      uint64_t v18 = v17;
      *(void *)(v15 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v15 + 64) = lazy protocol witness table accessor for type String and conformance String();
      *(void *)(v15 + 32) = v16;
      *(void *)(v15 + 40) = v18;
      *(void *)(v15 + 96) = type metadata accessor for CollaborationAttributionView();
      *(void *)(v15 + 104) = lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type CollaborationAttributionView and conformance NSObject, v19, (void (*)(uint64_t))type metadata accessor for CollaborationAttributionView);
      *(void *)(v15 + 72) = v11;
      *(void *)(v15 + 136) = MEMORY[0x1E4FBC958];
      *(void *)(v15 + 144) = lazy protocol witness table accessor for type CGFloat and conformance CGFloat();
      *(double *)(v15 + 112) = a5;
      type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for OS_os_log);
      os_log_type_t v20 = v11;
      id v12 = (id)static OS_os_log.default.getter();
      os_log(_:dso:log:_:_:)();

      swift_bridgeObjectRelease();
    }
  }
}

void thunk for @escaping @callee_guaranteed (@guaranteed UISSlotRemoteContent?) -> ()(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

id CollaborationAttributionView.__allocating_init(serviceProxyClass:maxWidth:)(double a1)
{
  id v3 = objc_allocWithZone(v1);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  return objc_msgSend(v3, sel_initWithServiceProxyClass_maxWidth_, ObjCClassFromMetadata, a1);
}

void CollaborationAttributionView.init(serviceProxyClass:maxWidth:)()
{
}

id CollaborationAttributionView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void CollaborationAttributionView.init(frame:)()
{
}

id CollaborationAttributionView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CollaborationAttributionView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id specialized CollaborationAttributionView.init(highlight:variant:)(void *a1, uint64_t a2)
{
  swift_unknownObjectWeakInit();
  BOOL v5 = &v2[OBJC_IVAR___SLCollaborationAttributionView_remoteContentDidLoad];
  void *v5 = 0;
  v5[1] = 0;
  uint64_t v6 = (void **)&v2[OBJC_IVAR___SLCollaborationAttributionView_highlight];
  *(void *)&v2[OBJC_IVAR___SLCollaborationAttributionView_highlight] = 0;
  uint64_t v7 = &v2[OBJC_IVAR___SLCollaborationAttributionView_title];
  *uint64_t v7 = 0;
  v7[1] = 0;
  v2[OBJC_IVAR___SLCollaborationAttributionView_automaticallyAdjustsMaxWidthToFitBounds] = 0;
  swift_beginAccess();
  uint64_t v8 = *v6;
  *uint64_t v6 = a1;
  id v9 = v2;
  id v10 = a1;

  id v11 = objc_allocWithZone((Class)SLDImageSymbolConfiguration);
  id v12 = (void *)MEMORY[0x19F3906A0](0xD000000000000022, 0x800000019BED9FC0);
  id v13 = objc_msgSend(v11, sel_initWithName_coreUISize_weight_pointSize_, v12, 2, 3, 22.0);

  uint64_t v14 = OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration;
  *(void *)&v9[OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration] = v13;
  *(void *)&v9[OBJC_IVAR___SLCollaborationAttributionView_variant] = a2;
  id v15 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v15, sel_scale);
  double v17 = v16;

  id v18 = *(id *)&v9[v14];
  objc_msgSend(v18, sel_minViableSizeWithDisplayScale_RTL_darkMode_, 0, 0, v17);
  double v20 = v19;

  double v21 = 44.0;
  if (a2 != 4) {
    double v21 = 0.0;
  }
  if (v20 <= v21) {
    double v20 = v21;
  }
  type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for SLDCollaborationAttributionViewService);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v24.receiver = v9;
  v24.super_class = (Class)type metadata accessor for CollaborationAttributionView();
  return objc_msgSendSuper2(&v24, sel_initWithServiceProxyClass_maxWidth_, ObjCClassFromMetadata, v20);
}

uint64_t outlined copy of (@escaping @callee_guaranteed () -> ())?(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t outlined consume of (@escaping @callee_guaranteed () -> ())?(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t type metadata accessor for CollaborationAttributionView()
{
  return self;
}

uint64_t sub_19BE94DA0()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_19BE94DD8()
{
  swift_release();

  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

void partial apply for closure #1 in CollaborationAttributionView.renderRemoteContent(forLayerContextID:style:yield:)()
{
  closure #1 in CollaborationAttributionView.renderRemoteContent(forLayerContextID:style:yield:)(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A];
  if (!lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A]);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_19BE94EF4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x88))();
  *a2 = result;
  return result;
}

uint64_t sub_19BE94F50(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x90);
  uint64_t v3 = swift_unknownObjectRetain();
  return v2(v3);
}

uint64_t sub_19BE94FBC@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0xB8))();
  *a2 = result;
  return result;
}

uint64_t sub_19BE95018(id *a1, void **a2)
{
  id v2 = *a1;
  uint64_t v3 = *(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **a2) + 0xC0);
  id v4 = *a1;
  return v3(v2);
}

uint64_t sub_19BE95080@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0xE8))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_19BE950DC(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0xF0);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_19BE95154@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x100))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_19BE951BC(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x108))(*a1);
}

uint64_t method lookup function for CollaborationAttributionView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CollaborationAttributionView);
}

uint64_t dispatch thunk of CollaborationAttributionView.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of CollaborationAttributionView.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of CollaborationAttributionView.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of CollaborationAttributionView.remoteContentDidLoad.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of CollaborationAttributionView.remoteContentDidLoad.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of CollaborationAttributionView.remoteContentDidLoad.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of CollaborationAttributionView.highlight.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of CollaborationAttributionView.highlight.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of CollaborationAttributionView.highlight.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of CollaborationAttributionView.title.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of CollaborationAttributionView.title.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of CollaborationAttributionView.title.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of CollaborationAttributionView.automaticallyAdjustsMaxWidthToFitBounds.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of CollaborationAttributionView.automaticallyAdjustsMaxWidthToFitBounds.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of CollaborationAttributionView.automaticallyAdjustsMaxWidthToFitBounds.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of CollaborationAttributionView.__allocating_init(highlight:variant:)()
{
  return (*(uint64_t (**)(void))(v0 + 280))();
}

uint64_t dispatch thunk of CollaborationAttributionView.__allocating_init(variant:)()
{
  return (*(uint64_t (**)(void))(v0 + 288))();
}

uint64_t dispatch thunk of CollaborationAttributionView.updatePlaceholderSymbol(scale:weight:pointSize:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of CollaborationAttributionView.expectedHeight(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x150))();
}

uint64_t sub_19BE955F8()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned UISSlotAnyContent) -> (@unowned ObjCBool)()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t outlined destroy of weak CollaborationAttributionViewDelegate?(uint64_t a1)
{
  return a1;
}

uint64_t sub_19BE95680()
{
  swift_release();

  swift_release();
  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t partial apply for closure #1 in CollaborationAttributionView._renderRemoteContent(forLayerContextID:style:forTitle:maxWidth:attributionIdentifiers:usingService:yield:)(void *a1)
{
  return closure #1 in CollaborationAttributionView._renderRemoteContent(forLayerContextID:style:forTitle:maxWidth:attributionIdentifiers:usingService:yield:)(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(double *)(v1 + 40));
}

uint64_t sub_19BE956E0()
{
  swift_release();

  swift_release();
  return MEMORY[0x1F4186498](v0, 72, 7);
}

void partial apply for closure #1 in closure #1 in CollaborationAttributionView._renderRemoteContent(forLayerContextID:style:forTitle:maxWidth:attributionIdentifiers:usingService:yield:)()
{
  closure #1 in closure #1 in CollaborationAttributionView._renderRemoteContent(forLayerContextID:style:forTitle:maxWidth:attributionIdentifiers:usingService:yield:)(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32), *(void (**)(void))(v0 + 48), *(double *)(v0 + 40));
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CGFloat and conformance CGFloat()
{
  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

uint64_t sub_19BE95838()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@out ())()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> ()()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_19BE958C0()
{
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 88, 7);
}

void partial apply for closure #2 in closure #1 in CollaborationAttributionView.renderRemoteContent(forLayerContextID:style:yield:)()
{
  closure #2 in closure #1 in CollaborationAttributionView.renderRemoteContent(forLayerContextID:style:yield:)(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void **)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80));
}

uint64_t type metadata accessor for SLHighlight(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

BOOL static NodeIdentity.< infix(_:_:)()
{
  uint64_t v0 = type metadata accessor for SHA256Digest();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x1F4188790](v0);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v11 - v5;
  NodeIdentity.hash.getter((uint64_t)&v11 - v5);
  uint64_t v7 = SHA256Digest.hashValue.getter();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v6, v0);
  NodeIdentity.hash.getter((uint64_t)v4);
  uint64_t v9 = SHA256Digest.hashValue.getter();
  v8(v4, v0);
  return v7 < v9;
}

uint64_t NodeIdentity.hash.getter@<X0>(uint64_t a1@<X8>)
{
  v22[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = type metadata accessor for SHA256();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for P256.Signing.PublicKey();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  id v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for NodeIdentity(0);
  MEMORY[0x1F4188790](v11);
  id v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of NodeIdentity(v1, (uint64_t)v13);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v22[1] = a1;
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v13, v7);
    uint64_t v14 = SHA256.init()();
    uint64_t v15 = MEMORY[0x19F390570](v14);
    uint64_t v17 = v15;
    unint64_t v18 = v16;
    switch(v16 >> 62)
    {
      case 1uLL:
        if (v15 >> 32 < (int)v15) {
          __break(1u);
        }
        v22[0] = v16 & 0x3FFFFFFFFFFFFFFFLL;
        outlined copy of Data._Representation(v15, v16);
        specialized __DataStorage.withUnsafeBytes<A>(in:apply:)((int)v17, v17 >> 32);
        break;
      case 2uLL:
        uint64_t v21 = *(void *)(v15 + 16);
        v22[0] = *(void *)(v15 + 24);
        outlined copy of Data._Representation(v15, v16);
        swift_retain();
        swift_retain();
        specialized __DataStorage.withUnsafeBytes<A>(in:apply:)(v21, v22[0]);
        swift_release();
        swift_release();
        break;
      case 3uLL:
        lazy protocol witness table accessor for type SHA256 and conformance SHA256(&lazy protocol witness table cache variable for type SHA256 and conformance SHA256, MEMORY[0x1E4F25170]);
        memset(&v22[2], 0, 14);
        goto LABEL_9;
      default:
        v22[2] = v15;
        LOWORD(v22[3]) = v16;
        BYTE2(v22[3]) = BYTE2(v16);
        BYTE3(v22[3]) = BYTE3(v16);
        BYTE4(v22[3]) = BYTE4(v16);
        BYTE5(v22[3]) = BYTE5(v16);
        lazy protocol witness table accessor for type SHA256 and conformance SHA256(&lazy protocol witness table cache variable for type SHA256 and conformance SHA256, MEMORY[0x1E4F25170]);
LABEL_9:
        dispatch thunk of HashFunction.update(bufferPointer:)();
        break;
    }
    outlined consume of Data._Representation(v17, v18);
    outlined consume of Data._Representation(v17, v18);
    SHA256.finalize()();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    uint64_t v19 = type metadata accessor for SHA256Digest();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(a1, v13, v19);
  }
}

uint64_t type metadata accessor for NodeIdentity(uint64_t a1)
{
  return type metadata accessor for NodeIdentity(a1, (uint64_t *)&type metadata singleton initialization cache for NodeIdentity);
}

uint64_t outlined init with copy of NodeIdentity(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NodeIdentity(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static NodeIdentity.== infix(_:_:)()
{
  uint64_t v0 = type metadata accessor for SHA256Digest();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x1F4188790](v0);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v10 - v5;
  NodeIdentity.hash.getter((uint64_t)&v10 - v5);
  NodeIdentity.hash.getter((uint64_t)v4);
  lazy protocol witness table accessor for type SHA256 and conformance SHA256((unint64_t *)&lazy protocol witness table cache variable for type SHA256Digest and conformance SHA256Digest, MEMORY[0x1E4F24F80]);
  char v7 = static Digest.== infix(_:_:)();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  return v7 & 1;
}

BOOL protocol witness for static Comparable.< infix(_:_:) in conformance NodeIdentity()
{
  uint64_t v0 = type metadata accessor for SHA256Digest();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x1F4188790](v0);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v11 - v5;
  NodeIdentity.hash.getter((uint64_t)&v11 - v5);
  uint64_t v7 = SHA256Digest.hashValue.getter();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v6, v0);
  NodeIdentity.hash.getter((uint64_t)v4);
  uint64_t v9 = SHA256Digest.hashValue.getter();
  v8(v4, v0);
  return v7 < v9;
}

BOOL protocol witness for static Comparable.<= infix(_:_:) in conformance NodeIdentity()
{
  uint64_t v0 = type metadata accessor for SHA256Digest();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x1F4188790](v0);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v11 - v5;
  NodeIdentity.hash.getter((uint64_t)&v11 - v5);
  uint64_t v7 = SHA256Digest.hashValue.getter();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v6, v0);
  NodeIdentity.hash.getter((uint64_t)v4);
  uint64_t v9 = SHA256Digest.hashValue.getter();
  v8(v4, v0);
  return v7 >= v9;
}

BOOL protocol witness for static Comparable.>= infix(_:_:) in conformance NodeIdentity()
{
  uint64_t v0 = type metadata accessor for SHA256Digest();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x1F4188790](v0);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v11 - v5;
  NodeIdentity.hash.getter((uint64_t)&v11 - v5);
  uint64_t v7 = SHA256Digest.hashValue.getter();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v6, v0);
  NodeIdentity.hash.getter((uint64_t)v4);
  uint64_t v9 = SHA256Digest.hashValue.getter();
  v8(v4, v0);
  return v7 >= v9;
}

BOOL protocol witness for static Comparable.> infix(_:_:) in conformance NodeIdentity()
{
  uint64_t v0 = type metadata accessor for SHA256Digest();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x1F4188790](v0);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v11 - v5;
  NodeIdentity.hash.getter((uint64_t)&v11 - v5);
  uint64_t v7 = SHA256Digest.hashValue.getter();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v6, v0);
  NodeIdentity.hash.getter((uint64_t)v4);
  uint64_t v9 = SHA256Digest.hashValue.getter();
  v8(v4, v0);
  return v7 < v9;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NodeIdentity()
{
  uint64_t v0 = type metadata accessor for SHA256Digest();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x1F4188790](v0);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v10 - v5;
  NodeIdentity.hash.getter((uint64_t)&v10 - v5);
  NodeIdentity.hash.getter((uint64_t)v4);
  lazy protocol witness table accessor for type SHA256 and conformance SHA256((unint64_t *)&lazy protocol witness table cache variable for type SHA256Digest and conformance SHA256Digest, MEMORY[0x1E4F24F80]);
  char v7 = static Digest.== infix(_:_:)();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  return v7 & 1;
}

uint64_t MerkleNode.node.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of NodeIdentity(v1 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_node, a1);
}

uint64_t MerkleNode.parent.getter()
{
  return MerkleNode.parent.getter();
}

{
  swift_beginAccess();
  return swift_retain();
}

uint64_t MerkleNode.parent.setter(uint64_t a1)
{
  return MerkleNode.parent.setter(a1, &OBJC_IVAR____TtC11SocialLayer10MerkleNode_parent);
}

uint64_t (*MerkleNode.parent.modify())()
{
  return CollaborationAttributionView.title.modify;
}

uint64_t MerkleNode.left.getter()
{
  return MerkleNode.parent.getter();
}

uint64_t MerkleNode.left.setter(uint64_t a1)
{
  return MerkleNode.parent.setter(a1, &OBJC_IVAR____TtC11SocialLayer10MerkleNode_left);
}

uint64_t (*MerkleNode.left.modify())()
{
  return CollaborationAttributionView.remoteContentDidLoad.modify;
}

uint64_t MerkleNode.right.getter()
{
  return MerkleNode.parent.getter();
}

uint64_t MerkleNode.right.setter(uint64_t a1)
{
  return MerkleNode.parent.setter(a1, &OBJC_IVAR____TtC11SocialLayer10MerkleNode_right);
}

uint64_t MerkleNode.parent.setter(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  *uint64_t v4 = a1;
  return swift_release();
}

uint64_t (*MerkleNode.right.modify())()
{
  return CollaborationAttributionView.title.modify;
}

uint64_t MerkleNode.hash.getter@<X0>(uint64_t a1@<X8>)
{
  return NodeIdentity.hash.getter(a1);
}

uint64_t MerkleNode.__allocating_init(node:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_parent) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_left) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_right) = 0;
  outlined init with take of NodeIdentity(a1, v2 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_node);
  return v2;
}

uint64_t MerkleNode.init(node:)(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_parent) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_left) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_right) = 0;
  outlined init with take of NodeIdentity(a1, v1 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_node);
  return v1;
}

uint64_t MerkleNode.deinit()
{
  outlined destroy of NodeIdentity(v0 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_node);
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t MerkleNode.__deallocating_deinit()
{
  outlined destroy of NodeIdentity(v0 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_node);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t MerkleTree.nodes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t MerkleTree.root.getter()
{
  return swift_retain();
}

uint64_t MerkleTree.root.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 24) = a1;
  return swift_release();
}

uint64_t (*MerkleTree.root.modify())()
{
  return CollaborationAttributionView.title.modify;
}

uint64_t MerkleTree.rootHash.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)v1 + 96))();
  if (v3)
  {
    (*(void (**)(uint64_t))(*(void *)v3 + 184))(v3);
    swift_release();
    uint64_t v4 = type metadata accessor for SHA256Digest();
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
    uint64_t v6 = v4;
    uint64_t v7 = a1;
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = type metadata accessor for SHA256Digest();
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
    uint64_t v6 = v9;
    uint64_t v7 = a1;
    uint64_t v8 = 1;
  }
  return v5(v7, v8, 1, v6);
}

uint64_t MerkleTree.__allocating_init(nodeIdentities:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  MerkleTree.init(nodeIdentities:)(a1);
  return v2;
}

uint64_t MerkleTree.init(nodeIdentities:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for NodeIdentity(0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3 - 8);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)v19 - v8;
  *(void *)(v1 + 24) = 0;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10)
  {
    v19[1] = v1 + 24;
    uint64_t v20 = v1;
    uint64_t v21 = MEMORY[0x1E4FBC860];
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v11 = *(unsigned __int8 *)(v4 + 80);
    v19[0] = a1;
    uint64_t v12 = a1 + ((v11 + 32) & ~v11);
    uint64_t v13 = *(void *)(v4 + 72);
    do
    {
      outlined init with copy of NodeIdentity(v12, (uint64_t)v9);
      outlined init with copy of NodeIdentity((uint64_t)v9, (uint64_t)v7);
      type metadata accessor for MerkleNode(0);
      uint64_t v14 = swift_allocObject();
      *(void *)(v14 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_parent) = 0;
      *(void *)(v14 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_left) = 0;
      *(void *)(v14 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_right) = 0;
      outlined init with take of NodeIdentity((uint64_t)v7, v14 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_node);
      outlined destroy of NodeIdentity((uint64_t)v9);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      v12 += v13;
      --v10;
    }
    while (v10);
    uint64_t v15 = v21;
    swift_bridgeObjectRelease();
    uint64_t v1 = v20;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v15 = MEMORY[0x1E4FBC860];
  }
  *(void *)(v1 + 16) = v15;
  unint64_t v16 = swift_bridgeObjectRetain();
  uint64_t v17 = MerkleTree.buildTree(nodes:)(v16);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)(v1 + 24) = v17;
  swift_release();
  return v1;
}

unint64_t MerkleTree.verify(node:)(uint64_t a1)
{
  uint64_t v50 = a1;
  v52[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = type metadata accessor for SHA256();
  uint64_t v3 = *(char **)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v40 = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = type metadata accessor for P256.Signing.PublicKey();
  unint64_t v5 = *(void *)(v48 - 8);
  MEMORY[0x1F4188790](v48);
  uint64_t v47 = (char *)v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = type metadata accessor for NodeIdentity(0);
  MEMORY[0x1F4188790](v49);
  uint64_t v8 = (char *)v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for SHA256Digest();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  unint64_t v41 = (char *)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v51 = (char *)v33 - v13;
  unint64_t v14 = *(void *)(v1 + 16);
  if (v14 >> 62) {
    goto LABEL_34;
  }
  uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v15; uint64_t v15 = _CocoaArrayWrapper.endIndex.getter())
  {
    v33[1] = v1;
    uint64_t v16 = 0;
    unint64_t v45 = v14;
    unint64_t v46 = v14 & 0xC000000000000001;
    uint64_t v38 = (void (**)(char *, char *, uint64_t))(v5 + 32);
    uint64_t v39 = (uint64_t (**)(char *, char *, uint64_t))(v10 + 32);
    uint64_t v36 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
    uint64_t v37 = (void (**)(char *, uint64_t))(v3 + 8);
    uint64_t v43 = v8;
    id v44 = (void (**)(uint64_t, uint64_t))(v10 + 8);
    uint64_t v35 = v2;
    unint64_t v5 = (unint64_t)v40;
    uint64_t v10 = (uint64_t)v41;
    uint64_t v42 = v15;
    while (1)
    {
      if (v46)
      {
        uint64_t v17 = MEMORY[0x19F390AB0](v16, v14);
      }
      else
      {
        uint64_t v17 = *(void *)(v14 + 8 * v16 + 32);
        swift_retain();
      }
      uint64_t v3 = v51;
      unint64_t v14 = v16 + 1;
      if (__OFADD__(v16, 1)) {
        break;
      }
      outlined init with copy of NodeIdentity(v50, (uint64_t)v8);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v1 = (uint64_t)v47;
        (*v38)(v47, v8, v48);
        uint64_t v18 = SHA256.init()();
        uint64_t v19 = MEMORY[0x19F390570](v18);
        uint64_t v10 = v19;
        unint64_t v5 = v20;
        switch(v20 >> 62)
        {
          case 1uLL:
            uint64_t v3 = (char *)(int)v19;
            uint64_t v2 = (v19 >> 32) - (int)v19;
            if (v19 >> 32 < (int)v19) {
              goto LABEL_32;
            }
            if (__DataStorage._bytes.getter() && __OFSUB__((int)v10, __DataStorage._offset.getter())) {
              goto LABEL_37;
            }
            __DataStorage._length.getter();
            lazy protocol witness table accessor for type SHA256 and conformance SHA256(&lazy protocol witness table cache variable for type SHA256 and conformance SHA256, MEMORY[0x1E4F25170]);
            uint64_t v22 = v40;
            uint64_t v2 = v35;
            dispatch thunk of HashFunction.update(bufferPointer:)();
            goto LABEL_21;
          case 2uLL:
            uint64_t v8 = (char *)(v20 & 0x3FFFFFFFFFFFFFFFLL);
            uint64_t v23 = *(void *)(v19 + 16);
            uint64_t v34 = *(void *)(v19 + 24);
            swift_retain();
            swift_retain();
            uint64_t v1 = v5 & 0x3FFFFFFFFFFFFFFFLL;
            uint64_t v2 = __DataStorage._bytes.getter();
            if (!v2) {
              goto LABEL_19;
            }
            uint64_t v1 = v5 & 0x3FFFFFFFFFFFFFFFLL;
            uint64_t v24 = __DataStorage._offset.getter();
            if (__OFSUB__(v23, v24))
            {
              __break(1u);
LABEL_37:
              __break(1u);
            }
            v2 += v23 - v24;
LABEL_19:
            BOOL v25 = __OFSUB__(v34, v23);
            uint64_t v3 = (char *)(v34 - v23);
            if (v25) {
              goto LABEL_33;
            }
            __DataStorage._length.getter();
            lazy protocol witness table accessor for type SHA256 and conformance SHA256(&lazy protocol witness table cache variable for type SHA256 and conformance SHA256, MEMORY[0x1E4F25170]);
            uint64_t v22 = v40;
            uint64_t v2 = v35;
            dispatch thunk of HashFunction.update(bufferPointer:)();
            swift_release();
            swift_release();
LABEL_21:
            outlined consume of Data._Representation(v10, v5);
            uint64_t v3 = v51;
LABEL_24:
            SHA256.finalize()();
            (*v37)(v22, v2);
            uint64_t v21 = (*v36)(v47, v48);
            unint64_t v5 = (unint64_t)v22;
            uint64_t v10 = (uint64_t)v41;
            break;
          case 3uLL:
            lazy protocol witness table accessor for type SHA256 and conformance SHA256(&lazy protocol witness table cache variable for type SHA256 and conformance SHA256, MEMORY[0x1E4F25170]);
            memset(v52, 0, 14);
            goto LABEL_23;
          default:
            v52[0] = v19;
            LOWORD(v52[1]) = v20;
            BYTE2(v52[1]) = BYTE2(v20);
            BYTE3(v52[1]) = BYTE3(v20);
            BYTE4(v52[1]) = BYTE4(v20);
            BYTE5(v52[1]) = BYTE5(v20);
            lazy protocol witness table accessor for type SHA256 and conformance SHA256(&lazy protocol witness table cache variable for type SHA256 and conformance SHA256, MEMORY[0x1E4F25170]);
LABEL_23:
            uint64_t v22 = v40;
            dispatch thunk of HashFunction.update(bufferPointer:)();
            outlined consume of Data._Representation(v10, v5);
            outlined consume of Data._Representation(v10, v5);
            goto LABEL_24;
        }
      }
      else
      {
        uint64_t v21 = (*v39)(v3, v8, v9);
      }
      (*(void (**)(uint64_t))(*(void *)v17 + 184))(v21);
      lazy protocol witness table accessor for type SHA256 and conformance SHA256((unint64_t *)&lazy protocol witness table cache variable for type SHA256Digest and conformance SHA256Digest, MEMORY[0x1E4F24F80]);
      uint64_t v26 = v3;
      if (static Digest.== infix(_:_:)())
      {
        swift_bridgeObjectRelease();
        uint64_t v30 = swift_retain();
        unint64_t v29 = MerkleTree.generateProofOfInclusion(node:)(v30);
        swift_release_n();
        id v31 = *v44;
        (*v44)(v10, v9);
        v31((uint64_t)v26, v9);
        return v29;
      }
      swift_release();
      uint64_t v1 = (uint64_t)v44;
      uint64_t v27 = *v44;
      (*v44)(v10, v9);
      v27((uint64_t)v26, v9);
      ++v16;
      uint64_t v8 = v43;
      BOOL v28 = v14 == v42;
      unint64_t v14 = v45;
      if (v28) {
        goto LABEL_28;
      }
    }
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
  }
LABEL_28:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t MerkleTree.buildTree(nodes:)(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62) {
    goto LABEL_32;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v3) {
    return v3;
  }
LABEL_3:
  if (v3 != 1)
  {
    uint64_t v6 = MEMORY[0x1E4FBC860];
    uint64_t v13 = MEMORY[0x1E4FBC860];
    if (v3 < 1)
    {
LABEL_25:
      uint64_t v12 = MerkleTree.buildTree(nodes:)(v6);
      swift_bridgeObjectRelease();
      return v12;
    }
    unint64_t v7 = 0;
    unint64_t v2 = a1 & 0xFFFFFFFFFFFFFF8;
    while ((a1 & 0xC000000000000001) == 0)
    {
      if (v7 >= *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_30;
      }
      uint64_t v8 = *(void *)(a1 + 8 * v7 + 32);
      swift_retain();
      if ((uint64_t)(v7 + 1) >= v3) {
        goto LABEL_19;
      }
      if (v7 + 1 >= *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_31;
      }
      uint64_t v9 = *(void *)(a1 + 8 * v7 + 40);
      swift_retain();
LABEL_20:
      specialized MerkleTree.createParent(leftNode:rightNode:)(v8, v9);
      uint64_t v10 = swift_retain();
      MEMORY[0x19F390820](v10);
      if (*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v11 = v7 + 2;
      if (__OFADD__(v7, 2))
      {
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        swift_bridgeObjectRetain();
        uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (!v3) {
          return v3;
        }
        goto LABEL_3;
      }
      v7 += 2;
      if (v11 >= v3)
      {
        uint64_t v6 = v13;
        goto LABEL_25;
      }
    }
    uint64_t v8 = MEMORY[0x19F390AB0](v7, a1);
    if ((uint64_t)(v7 + 1) < v3)
    {
      uint64_t v9 = MEMORY[0x19F390AB0]();
      goto LABEL_20;
    }
LABEL_19:
    swift_retain();
    uint64_t v9 = v8;
    goto LABEL_20;
  }
  if (!v2)
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_6;
    }
LABEL_27:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  if (!result) {
    goto LABEL_27;
  }
LABEL_6:
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = MEMORY[0x19F390AB0](0, a1);
    goto LABEL_9;
  }
  if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    swift_retain();
LABEL_9:
    swift_bridgeObjectRelease();
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t closure #1 in MerkleTree.createParent(leftNode:rightNode:)()
{
  return dispatch thunk of HashFunction.update(bufferPointer:)();
}

unint64_t MerkleTree.generateProofOfInclusion(node:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for SHA256Digest();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t result = MEMORY[0x1E4FBC860];
  unint64_t v29 = MEMORY[0x1E4FBC860];
  if (!a1) {
    return result;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t))(*(void *)v1 + 96);
  uint64_t v9 = swift_retain();
  uint64_t v10 = v8(v9);
  if (v10)
  {
    uint64_t v11 = v10;
    swift_release();
    if (a1 == v11) {
      goto LABEL_15;
    }
  }
  uint64_t v12 = *(uint64_t (**)(void))(*(void *)a1 + 112);
  uint64_t v13 = v12();
  if (!v13
    || (uint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)v13 + 136))(v13), swift_release(), !v14)
    || (uint64_t v15 = swift_release(), v14 != a1))
  {
    uint64_t v16 = v12();
    if (v16)
    {
      uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)v16 + 136))(v16);
      goto LABEL_9;
    }
LABEL_15:
    swift_release();
    return MEMORY[0x1E4FBC860];
  }
  uint64_t v26 = ((uint64_t (*)(uint64_t))v12)(v15);
  if (!v26) {
    goto LABEL_15;
  }
  uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)v26 + 160))(v26);
LABEL_9:
  uint64_t v18 = v17;
  uint64_t v19 = swift_release();
  if (!v18) {
    goto LABEL_15;
  }
  (*(void (**)(uint64_t))(*(void *)v18 + 184))(v19);
  unint64_t v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, 1, 1, MEMORY[0x1E4FBC860]);
  unint64_t v22 = *(void *)(v20 + 16);
  unint64_t v21 = *(void *)(v20 + 24);
  unint64_t v23 = v22 + 1;
  if (v22 >= v21 >> 1)
  {
    unint64_t v28 = v22 + 1;
    uint64_t v27 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v21 > 1, v22 + 1, 1, v20);
    unint64_t v23 = v28;
    unint64_t v20 = v27;
  }
  *(void *)(v20 + 16) = v23;
  uint64_t v24 = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v4 + 32))(v20+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v22, v6, v3);
  unint64_t v29 = v20;
  (*(void (**)(uint64_t))(*(void *)v18 + 112))(v24);
  uint64_t v25 = MerkleTree.generateProofOfInclusion(node:)();
  swift_release();
  specialized Array.append<A>(contentsOf:)(v25);
  swift_release();
  swift_release();
  return v29;
}

uint64_t MerkleTree.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t MerkleTree.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t specialized __DataStorage.withUnsafeBytes<A>(in:apply:)(uint64_t a1, uint64_t a2)
{
  uint64_t result = __DataStorage._bytes.getter();
  if (!result || (uint64_t result = __DataStorage._offset.getter(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      __DataStorage._length.getter();
      type metadata accessor for SHA256();
      lazy protocol witness table accessor for type SHA256 and conformance SHA256(&lazy protocol witness table cache variable for type SHA256 and conformance SHA256, MEMORY[0x1E4F25170]);
      return dispatch thunk of HashFunction.update(bufferPointer:)();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t lazy protocol witness table accessor for type SHA256 and conformance SHA256(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t outlined init with take of NodeIdentity(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NodeIdentity(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of NodeIdentity(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NodeIdentity(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for MerkleNode(uint64_t a1)
{
  return type metadata accessor for NodeIdentity(a1, (uint64_t *)&type metadata singleton initialization cache for MerkleNode);
}

uint64_t type metadata accessor for NodeIdentity(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t base witness table accessor for Equatable in NodeIdentity()
{
  return lazy protocol witness table accessor for type SHA256 and conformance SHA256(&lazy protocol witness table cache variable for type NodeIdentity and conformance NodeIdentity, (void (*)(uint64_t))type metadata accessor for NodeIdentity);
}

uint64_t sub_19BE980F8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 112))();
  *a2 = result;
  return result;
}

uint64_t sub_19BE98144(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 120);
  uint64_t v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_19BE98198@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 136))();
  *a2 = result;
  return result;
}

uint64_t sub_19BE981E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 144);
  uint64_t v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_19BE98238@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 160))();
  *a2 = result;
  return result;
}

uint64_t sub_19BE98284(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 168);
  uint64_t v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_19BE982D8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 96))();
  *a2 = result;
  return result;
}

uint64_t sub_19BE98324(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 104);
  uint64_t v3 = swift_retain();
  return v2(v3);
}

uint64_t *initializeBufferWithCopyOfBuffer for NodeIdentity(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v6 = type metadata accessor for P256.Signing.PublicKey();
    }
    else {
      uint64_t v6 = type metadata accessor for SHA256Digest();
    }
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for NodeIdentity(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v2 = type metadata accessor for P256.Signing.PublicKey();
  }
  else {
    uint64_t v2 = type metadata accessor for SHA256Digest();
  }
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for NodeIdentity(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v4 = type metadata accessor for P256.Signing.PublicKey();
  }
  else {
    uint64_t v4 = type metadata accessor for SHA256Digest();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for NodeIdentity(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    outlined destroy of NodeIdentity(a1);
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v4 = type metadata accessor for P256.Signing.PublicKey();
    }
    else {
      uint64_t v4 = type metadata accessor for SHA256Digest();
    }
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for NodeIdentity(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v4 = type metadata accessor for P256.Signing.PublicKey();
  }
  else {
    uint64_t v4 = type metadata accessor for SHA256Digest();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for NodeIdentity(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    outlined destroy of NodeIdentity(a1);
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v4 = type metadata accessor for P256.Signing.PublicKey();
    }
    else {
      uint64_t v4 = type metadata accessor for SHA256Digest();
    }
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for NodeIdentity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for NodeIdentity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t destructiveInjectEnumTag for NodeIdentity()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t type metadata completion function for NodeIdentity()
{
  uint64_t result = type metadata accessor for SHA256Digest();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for P256.Signing.PublicKey();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t ObjC metadata update function for MerkleNode()
{
  return type metadata accessor for MerkleNode(0);
}

uint64_t type metadata completion function for MerkleNode()
{
  uint64_t result = type metadata accessor for NodeIdentity(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for MerkleNode(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MerkleNode);
}

uint64_t dispatch thunk of MerkleNode.parent.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of MerkleNode.parent.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of MerkleNode.parent.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of MerkleNode.left.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of MerkleNode.left.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of MerkleNode.left.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of MerkleNode.right.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of MerkleNode.right.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of MerkleNode.right.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of MerkleNode.hash.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of MerkleNode.__allocating_init(node:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t type metadata accessor for MerkleTree()
{
  return self;
}

uint64_t method lookup function for MerkleTree(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MerkleTree);
}

uint64_t dispatch thunk of MerkleTree.root.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of MerkleTree.root.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of MerkleTree.root.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of MerkleTree.rootHash.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of MerkleTree.__allocating_init(nodeIdentities:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of MerkleTree.verify(node:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t specialized MerkleTree.createParent(leftNode:rightNode:)(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = type metadata accessor for NodeIdentity(0);
  MEMORY[0x1F4188790](v26);
  uint64_t v25 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for SHA256Digest();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for SHA256();
  uint64_t v27 = *(void *)(v9 - 8);
  uint64_t v28 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = SHA256.init()();
  (*(void (**)(uint64_t))(*(void *)a1 + 184))(v12);
  uint64_t v30 = v11;
  SHA256Digest.withUnsafeBytes<A>(_:)();
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
  uint64_t v14 = v13(v8, v5);
  (*(void (**)(uint64_t))(*(void *)a2 + 184))(v14);
  unint64_t v29 = v11;
  SHA256Digest.withUnsafeBytes<A>(_:)();
  v13(v8, v5);
  uint64_t v15 = v25;
  SHA256.finalize()();
  uint64_t v16 = (uint64_t)v15;
  swift_storeEnumTagMultiPayload();
  type metadata accessor for MerkleNode(0);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_parent) = 0;
  *(void *)(v17 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_left) = 0;
  *(void *)(v17 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_right) = 0;
  outlined init with take of NodeIdentity(v16, v17 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_node);
  uint64_t v18 = *(void (**)(uint64_t))(*(void *)a1 + 120);
  uint64_t v19 = swift_retain();
  v18(v19);
  unint64_t v20 = *(void (**)(uint64_t))(*(void *)a2 + 120);
  uint64_t v21 = swift_retain();
  v20(v21);
  unint64_t v22 = (void *)(v17 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_left);
  swift_beginAccess();
  void *v22 = a1;
  swift_retain();
  swift_release();
  unint64_t v23 = (void *)(v17 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_right);
  swift_beginAccess();
  *unint64_t v23 = a2;
  swift_retain();
  swift_release();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v28);
  return v17;
}

uint64_t partial apply for closure #2 in MerkleTree.createParent(leftNode:rightNode:)()
{
  return closure #1 in MerkleTree.createParent(leftNode:rightNode:)();
}

uint64_t partial apply for closure #1 in MerkleTree.createParent(leftNode:rightNode:)()
{
  return partial apply for closure #2 in MerkleTree.createParent(leftNode:rightNode:)();
}

uint64_t ProcessVerifierError.message.getter(uint64_t a1)
{
  return a1;
}

uint64_t ProcessVerifierError.message.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ProcessVerifierError.message.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t ProcessVerifierError.description.getter(uint64_t a1)
{
  return a1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ProcessVerifierError()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ProcessVerifier.useStaticKeyForTesting.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SLDProcessVerifier_useStaticKeyForTesting);
  swift_beginAccess();
  return *v1;
}

uint64_t ProcessVerifier.useStaticKeyForTesting.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___SLDProcessVerifier_useStaticKeyForTesting);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*ProcessVerifier.useStaticKeyForTesting.modify())()
{
  return CollaborationAttributionView.remoteContentDidLoad.modify;
}

uint64_t ProcessVerifier.staticTestingKey.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SymmetricKeySize();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey??);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v17 - v8;
  uint64_t v10 = v1 + OBJC_IVAR___SLDProcessVerifier____lazy_storage___staticTestingKey;
  swift_beginAccess();
  outlined init with copy of (NSAttributedStringKey, Any)(v10, (uint64_t)v9, &demangling cache variable for type metadata for SymmetricKey??);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11) != 1) {
    return outlined init with take of SymmetricKey?((uint64_t)v9, a1);
  }
  outlined destroy of SymmetricKey??((uint64_t)v9, &demangling cache variable for type metadata for SymmetricKey??);
  uint64_t v13 = (unsigned char *)(v1 + OBJC_IVAR___SLDProcessVerifier_useStaticKeyForTesting);
  swift_beginAccess();
  if (*v13 == 1)
  {
    static SymmetricKeySize.bits128.getter();
    SymmetricKey.init(size:)();
    uint64_t v14 = type metadata accessor for SymmetricKey();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(a1, 0, 1, v14);
  }
  else
  {
    uint64_t v16 = type metadata accessor for SymmetricKey();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(a1, 1, 1, v16);
  }
  outlined init with copy of (NSAttributedStringKey, Any)(a1, (uint64_t)v7, &demangling cache variable for type metadata for SymmetricKey?);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v7, 0, 1, v11);
  swift_beginAccess();
  outlined assign with take of SymmetricKey??((uint64_t)v7, v10);
  return swift_endAccess();
}

uint64_t static ProcessVerifier.tagData(from:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for String.Encoding();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    static String.Encoding.utf8.getter();
    a2 = String.data(using:allowLossyConversion:)();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return a2;
}

_DWORD *ProcessVerifier.sign(process:tag:)(NSObject *a1, uint64_t a2, unint64_t a3)
{
  v44[1] = *MEMORY[0x1E4F143B8];
  uint64_t ObjectType = (void *)swift_getObjectType();
  uint64_t v8 = type metadata accessor for SymmetricKey();
  uint64_t v41 = *(void *)(v8 - 8);
  uint64_t v42 = v8;
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = self;
  id v43 = 0;
  id v12 = objc_msgSend(v11, sel_archivedDataWithRootObject_requiringSecureCoding_error_, a1, 1, &v43);
  uint64_t v13 = v43;
  if (!v12)
  {
    uint64_t v17 = v13;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    goto LABEL_6;
  }
  uint64_t v40 = a1;
  uint64_t v14 = ObjectType;
  uint64_t v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = v16;

  ProcessVerifier.acquireKey()((uint64_t)v10);
  if (v3)
  {
    outlined consume of Data._Representation(v15, (unint64_t)v17);
    uint64_t ObjectType = v14;
LABEL_6:
    if (one-time initialization token for ProcessVerifier != -1) {
      swift_once();
    }
    uint64_t v20 = type metadata accessor for Logger();
    __swift_project_value_buffer(v20, (uint64_t)static Log.ProcessVerifier);
    uint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v17 = (_DWORD *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      id v43 = ObjectType;
      v44[0] = v23;
      _DWORD *v17 = 136315138;
      swift_getMetatypeMetadata();
      uint64_t v24 = String.init<A>(describing:)();
      id v43 = (id)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_19BE17000, v21, v22, "sign() caught error: %s", (uint8_t *)v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x19F392080](v23, -1, -1);
      MEMORY[0x19F392080](v17, -1, -1);
    }

    swift_willThrow();
    return v17;
  }
  unint64_t v18 = (unint64_t)v17;
  uint64_t v19 = v15;
  uint64_t v17 = specialized ProcessVerifier.createSealedBox(from:using:tag:)(v15, (uint64_t)v17, (uint64_t)v10, a2, a3);
  uint64_t v38 = v10;
  unint64_t v39 = v18;
  if (one-time initialization token for ProcessVerifier != -1) {
    swift_once();
  }
  uint64_t v27 = type metadata accessor for Logger();
  __swift_project_value_buffer(v27, (uint64_t)static Log.ProcessVerifier);
  uint64_t v28 = v40;
  unint64_t v29 = Logger.logObject.getter();
  os_log_type_t v30 = static os_log_type_t.debug.getter();
  uint64_t v40 = v29;
  if (os_log_type_enabled(v29, v30))
  {
    id v31 = (uint8_t *)swift_slowAlloc();
    unint64_t v32 = (void *)swift_slowAlloc();
    uint64_t v36 = v31;
    uint64_t v37 = v19;
    *(_DWORD *)id v31 = 138412290;
    v35[1] = v31 + 4;
    id v43 = v28;
    id v33 = v28;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *unint64_t v32 = v28;

    uint64_t v34 = v36;
    _os_log_impl(&dword_19BE17000, v40, v30, "sign() successfully signed process: %@", v36, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x19F392080](v32, -1, -1);
    MEMORY[0x19F392080](v34, -1, -1);
    outlined consume of Data._Representation(v37, v39);
  }
  else
  {
    outlined consume of Data._Representation(v19, v39);
  }
  (*(void (**)(char *, uint64_t))(v41 + 8))(v38, v42);
  return v17;
}

uint64_t ProcessVerifier.acquireKey()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v3 = type metadata accessor for SymmetricKeySize();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v4 = type metadata accessor for SymmetricKey();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  uint64_t v9 = MEMORY[0x1F4188790](v8 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v20 - v12;
  uint64_t v14 = (unsigned char *)(v1 + OBJC_IVAR___SLDProcessVerifier_useStaticKeyForTesting);
  swift_beginAccess();
  if (*v14 == 1)
  {
    ProcessVerifier.staticTestingKey.getter((uint64_t)v13);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v13, 1, v4) != 1) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v21, v13, v4);
    }
    outlined destroy of SymmetricKey??((uint64_t)v13, &demangling cache variable for type metadata for SymmetricKey?);
  }
  uint64_t result = specialized GenericPasswordStore.readKey<A>(account:)(0xD000000000000028, 0x800000019BEDA460, (uint64_t)v11);
  if (v2) {
    return result;
  }
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v11, 1, v4) == 1)
  {
    outlined destroy of SymmetricKey??((uint64_t)v11, &demangling cache variable for type metadata for SymmetricKey?);
    if (one-time initialization token for ProcessVerifier != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    __swift_project_value_buffer(v16, (uint64_t)static Log.ProcessVerifier);
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_19BE17000, v17, v18, "acquireKey() did not find an existing key in the keychain. Creating one.", v19, 2u);
      MEMORY[0x19F392080](v19, -1, -1);
    }

    static SymmetricKeySize.bits128.getter();
    SymmetricKey.init(size:)();
    specialized GenericPasswordStore.storeKey<A>(_:account:)((uint64_t)v7, 0xD000000000000028, 0x800000019BEDA460);
    uint64_t v13 = v7;
  }
  else
  {
    uint64_t v13 = v11;
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v21, v13, v4);
}

char *ProcessVerifier.verify(data:tag:)(uint64_t a1, unint64_t a2, uint8_t *a3, uint64_t a4)
{
  uint64_t v49 = a3;
  uint64_t v50 = (char *)a4;
  unint64_t v51 = a2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = type metadata accessor for AES.GCM.SealedBox();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for SymmetricKey();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  ProcessVerifier.acquireKey()((uint64_t)v13);
  if (!v4)
  {
    uint64_t v47 = v11;
    uint64_t v48 = v10;
    unint64_t v14 = (unint64_t)v50;
    unint64_t v15 = v51;
    outlined copy of Data._Representation(a1, v51);
    specialized AES.GCM.SealedBox.init<A>(combined:)(a1, v15);
    uint64_t v16 = v13;
    if (v14 >> 60 == 15)
    {
      uint64_t v17 = v9;
      uint64_t v18 = static AES.GCM.open(_:using:)();
      unint64_t v51 = v19;
      uint64_t v9 = (char *)v18;
      (*(void (**)(char *, uint64_t))(v7 + 8))(v17, v6);
    }
    else
    {
      uint64_t v20 = v49;
      uint64_t v53 = v49;
      unint64_t v54 = v14;
      outlined copy of Data._Representation((uint64_t)v49, v14);
      lazy protocol witness table accessor for type Data and conformance Data();
      uint64_t v21 = static AES.GCM.open<A>(_:using:authenticating:)();
      unint64_t v51 = v22;
      uint64_t v23 = v6;
      id v31 = (char *)v21;
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v23);
      outlined consume of Data?((uint64_t)v20, v14);
      uint64_t v9 = v31;
    }
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSKeyedUnarchiver);
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for RBSProcessIdentity);
    unint64_t v32 = (void *)static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
    if (v32)
    {
      uint64_t v50 = v9;
      if (one-time initialization token for ProcessVerifier != -1) {
        swift_once();
      }
      uint64_t v33 = type metadata accessor for Logger();
      __swift_project_value_buffer(v33, (uint64_t)static Log.ProcessVerifier);
      uint64_t v9 = v32;
      uint64_t v34 = Logger.logObject.getter();
      os_log_type_t v35 = static os_log_type_t.debug.getter();
      uint64_t ObjectType = v34;
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = (uint8_t *)swift_slowAlloc();
        unint64_t v46 = (void *)swift_slowAlloc();
        uint64_t v49 = v36;
        *(_DWORD *)uint64_t v36 = 138412290;
        uint64_t v53 = (uint8_t *)v9;
        uint64_t v37 = v9;
        uint64_t v16 = v13;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        uint64_t v38 = v46;
        *unint64_t v46 = v32;

        unint64_t v39 = v49;
        _os_log_impl(&dword_19BE17000, ObjectType, v35, "verify() successfully verified process: %@", v49, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        MEMORY[0x19F392080](v38, -1, -1);
        MEMORY[0x19F392080](v39, -1, -1);
        outlined consume of Data._Representation((uint64_t)v50, v51);
      }
      else
      {
        outlined consume of Data._Representation((uint64_t)v50, v51);
      }
      (*(void (**)(char *, uint64_t))(v47 + 8))(v16, v48);
      return v9;
    }
    if (one-time initialization token for ProcessVerifier != -1) {
      swift_once();
    }
    uint64_t v40 = type metadata accessor for Logger();
    __swift_project_value_buffer(v40, (uint64_t)static Log.ProcessVerifier);
    uint64_t v41 = Logger.logObject.getter();
    os_log_type_t v42 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v41, v42))
    {
      id v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v43 = 0;
      _os_log_impl(&dword_19BE17000, v41, v42, "verify() could not unarchive a process identity from signed data.", v43, 2u);
      MEMORY[0x19F392080](v43, -1, -1);
    }

    lazy protocol witness table accessor for type ProcessVerifierError and conformance ProcessVerifierError();
    swift_allocError();
    *id v44 = 0xD000000000000041;
    v44[1] = 0x800000019BEDA330;
    swift_willThrow();
    outlined consume of Data._Representation((uint64_t)v9, v51);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v13, v48);
  }
  if (one-time initialization token for ProcessVerifier != -1) {
    swift_once();
  }
  uint64_t v24 = type metadata accessor for Logger();
  __swift_project_value_buffer(v24, (uint64_t)static Log.ProcessVerifier);
  unint64_t v25 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (char *)swift_slowAlloc();
    id v55 = v9;
    *(_DWORD *)uint64_t v27 = 136315138;
    uint64_t v53 = (uint8_t *)ObjectType;
    swift_getMetatypeMetadata();
    uint64_t v28 = String.init<A>(describing:)();
    uint64_t v53 = (uint8_t *)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v28, v29, (uint64_t *)&v55);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_19BE17000, v25, v26, "verify() caught error: %s", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F392080](v9, -1, -1);
    MEMORY[0x19F392080](v27, -1, -1);
  }

  swift_willThrow();
  return v9;
}

uint64_t specialized GenericPasswordStore.readKey<A>(account:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  result[35] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19BED21D0;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v7;
  if (one-time initialization token for KeychainAccessGroup != -1) {
    swift_once();
  }
  uint64_t countAndFlagsBits = KeychainAccessGroup._countAndFlagsBits;
  object = KeychainAccessGroup._object;
  uint64_t v10 = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 72) = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 48) = countAndFlagsBits;
  *(void *)(inited + 56) = object;
  *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 88) = v11;
  uint64_t v12 = (void *)*MEMORY[0x1E4F3B988];
  type metadata accessor for CFStringRef(0);
  *(void *)(inited + 120) = v13;
  *(void *)(inited + 96) = v12;
  *(void *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 136) = v14;
  *(void *)(inited + 168) = v10;
  *(void *)(inited + 144) = a1;
  *(void *)(inited + 152) = a2;
  *(void *)(inited + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 184) = v15;
  uint64_t v16 = MEMORY[0x1E4FBB390];
  *(void *)(inited + 216) = MEMORY[0x1E4FBB390];
  *(unsigned char *)(inited + 192) = 1;
  *(void *)(inited + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 232) = v17;
  *(void *)(inited + 264) = v16;
  *(unsigned char *)(inited + 240) = 1;
  swift_bridgeObjectRetain();
  id v18 = v12;
  swift_bridgeObjectRetain();
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  result[0] = 0;
  CFDictionaryRef isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  OSStatus v20 = SecItemCopyMatching(isa, result);

  if (v20 == -25300)
  {
    uint64_t v22 = type metadata accessor for SymmetricKey();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(a3, 1, 1, v22);
  }
  else if (v20)
  {
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    *(void *)&long long v33 = 0xD000000000000016;
    *((void *)&v33 + 1) = 0x800000019BEDA4B0;
    CFStringRef v23 = SecCopyErrorMessageString(v20, 0);
    if (v23)
    {
      uint64_t v24 = (__CFString *)v23;
      uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v27 = v26;
    }
    else
    {
      uint64_t v25 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v27 = v29;
    }
    v30._uint64_t countAndFlagsBits = v25;
    v30._object = v27;
    String.append(_:)(v30);
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type GenericPasswordStoreError and conformance GenericPasswordStoreError();
    swift_allocError();
    *id v31 = v33;
    swift_willThrow();
  }
  else if (result[0] && (swift_unknownObjectRetain(), swift_dynamicCast()))
  {
    SymmetricKey.init<A>(data:)();
    uint64_t v21 = type metadata accessor for SymmetricKey();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(a3, 0, 1, v21);
  }
  else
  {
    uint64_t v28 = type metadata accessor for SymmetricKey();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(a3, 1, 1, v28);
  }
  return swift_unknownObjectRelease();
}

uint64_t specialized AES.GCM.SealedBox.init<A>(combined:)(uint64_t a1, unint64_t a2)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_10:
        __break(1u);
        JUMPOUT(0x19BE9AEB0);
      }
      uint64_t v4 = (int)v4;
LABEL_6:
      if (v4 > 27)
      {
        outlined copy of Data._Representation(a1, a2);
        specialized Data.init<A>(_:)(a1, a2);
        AES.GCM.SealedBox.init(combined:)();
        return outlined consume of Data._Representation(a1, a2);
      }
      else
      {
LABEL_7:
        uint64_t v8 = type metadata accessor for CryptoKitError();
        lazy protocol witness table accessor for type CryptoKitError and conformance CryptoKitError(&lazy protocol witness table cache variable for type CryptoKitError and conformance CryptoKitError, MEMORY[0x1E4F24F10]);
        swift_allocError();
        (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v8 - 8) + 104))(v9, *MEMORY[0x1E4F24F08], v8);
        swift_willThrow();
        return outlined consume of Data._Representation(a1, a2);
      }
    case 2uLL:
      uint64_t v6 = *(void *)(a1 + 16);
      uint64_t v5 = *(void *)(a1 + 24);
      BOOL v7 = __OFSUB__(v5, v6);
      uint64_t v4 = v5 - v6;
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_10;
    case 3uLL:
      goto LABEL_7;
    default:
      uint64_t v4 = BYTE6(a2);
      goto LABEL_6;
  }
}

id ProcessVerifier.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id ProcessVerifier.init()()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  v0[OBJC_IVAR___SLDProcessVerifier_useStaticKeyForTesting] = 0;
  uint64_t v2 = &v0[OBJC_IVAR___SLDProcessVerifier____lazy_storage___staticTestingKey];
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  v5.receiver = v0;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

id ProcessVerifier.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void specialized GenericPasswordStore.storeKey<A>(_:account:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19BED21E0;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v6;
  if (one-time initialization token for KeychainAccessGroup != -1) {
    swift_once();
  }
  uint64_t countAndFlagsBits = KeychainAccessGroup._countAndFlagsBits;
  object = KeychainAccessGroup._object;
  uint64_t v9 = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 72) = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 48) = countAndFlagsBits;
  *(void *)(inited + 56) = object;
  *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 88) = v10;
  uint64_t v11 = (void *)*MEMORY[0x1E4F3B988];
  type metadata accessor for CFStringRef(0);
  uint64_t v13 = v12;
  *(void *)(inited + 120) = v12;
  *(void *)(inited + 96) = v11;
  *(void *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 136) = v14;
  *(void *)(inited + 168) = v9;
  *(void *)(inited + 144) = a2;
  *(void *)(inited + 152) = a3;
  *(void *)(inited + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 184) = v15;
  uint64_t v16 = (void *)*MEMORY[0x1E4F3B570];
  *(void *)(inited + 216) = v13;
  *(void *)(inited + 192) = v16;
  *(void *)(inited + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 232) = v17;
  *(void *)(inited + 264) = MEMORY[0x1E4FBB390];
  *(unsigned char *)(inited + 240) = 1;
  *(void *)(inited + 272) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 280) = v18;
  type metadata accessor for SymmetricKey();
  lazy protocol witness table accessor for type CryptoKitError and conformance CryptoKitError(&lazy protocol witness table cache variable for type SymmetricKey and conformance SymmetricKey, MEMORY[0x1E4F25000]);
  swift_bridgeObjectRetain();
  id v19 = v11;
  swift_bridgeObjectRetain();
  id v20 = v16;
  uint64_t v21 = MEMORY[0x1E4F277C0];
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
  *(void *)(inited + 312) = v21;
  *(_OWORD *)(inited + 288) = v32;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  CFDictionaryRef isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  OSStatus v23 = SecItemAdd(isa, 0);

  if (v23)
  {
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    *(void *)&long long v33 = 0xD000000000000016;
    *((void *)&v33 + 1) = 0x800000019BEDA490;
    CFStringRef v24 = SecCopyErrorMessageString(v23, 0);
    if (v24)
    {
      uint64_t v25 = (__CFString *)v24;
      uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v28 = v27;
    }
    else
    {
      uint64_t v26 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v28 = v29;
    }
    v30._uint64_t countAndFlagsBits = v26;
    v30._object = v28;
    String.append(_:)(v30);
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type GenericPasswordStoreError and conformance GenericPasswordStoreError();
    swift_allocError();
    *id v31 = v33;
    swift_willThrow();
  }
}

char *specialized ProcessVerifier.createSealedBox(from:using:tag:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v37 = a4;
  uint64_t v40 = a2;
  uint64_t v41 = a3;
  uint64_t v39 = a1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AES.GCM.Nonce?);
  uint64_t v7 = MEMORY[0x1F4188790](v6 - 8);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v34 - v10;
  uint64_t v12 = type metadata accessor for AES.GCM.SealedBox();
  uint64_t v35 = *(void *)(v12 - 8);
  uint64_t v36 = v12;
  uint64_t v13 = MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v38 = (char *)&v34 - v16;
  uint64_t v17 = type metadata accessor for AES.GCM.Nonce();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  id v20 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  AES.GCM.Nonce.init()();
  uint64_t v21 = (void (**)(char *, char *, uint64_t))(v18 + 16);
  uint64_t v22 = (void (**)(char *, void, uint64_t, uint64_t))(v18 + 56);
  if (a5 >> 60 == 15)
  {
    uint64_t v44 = v39;
    uint64_t v45 = v40;
    (*v21)(v9, v20, v17);
    (*v22)(v9, 0, 1, v17);
    lazy protocol witness table accessor for type Data and conformance Data();
    uint64_t v23 = v46;
    static AES.GCM.seal<A>(_:using:nonce:)();
    if (v23)
    {
      outlined destroy of SymmetricKey??((uint64_t)v9, &demangling cache variable for type metadata for AES.GCM.Nonce?);
LABEL_10:
      (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
      return v9;
    }
    outlined destroy of SymmetricKey??((uint64_t)v9, &demangling cache variable for type metadata for AES.GCM.Nonce?);
    uint64_t v9 = (char *)AES.GCM.SealedBox.combined.getter();
    unint64_t v29 = v28;
    Swift::String v30 = v15;
LABEL_8:
    (*(void (**)(char *, uint64_t))(v35 + 8))(v30, v36);
    if (v29 >> 60 == 15)
    {
      lazy protocol witness table accessor for type ProcessVerifierError and conformance ProcessVerifierError();
      swift_allocError();
      *long long v32 = 0xD000000000000045;
      v32[1] = 0x800000019BEDA410;
      swift_willThrow();
    }
    goto LABEL_10;
  }
  unint64_t v24 = a5;
  uint64_t v44 = v39;
  uint64_t v45 = v40;
  (*v21)(v11, v20, v17);
  (*v22)(v11, 0, 1, v17);
  uint64_t v25 = v37;
  uint64_t v42 = v37;
  unint64_t v43 = v24;
  unint64_t v26 = v24;
  outlined copy of Data._Representation(v37, v24);
  lazy protocol witness table accessor for type Data and conformance Data();
  uint64_t v27 = v46;
  static AES.GCM.seal<A, B>(_:using:nonce:authenticating:)();
  if (!v27)
  {
    outlined destroy of SymmetricKey??((uint64_t)v11, &demangling cache variable for type metadata for AES.GCM.Nonce?);
    Swift::String v30 = v38;
    uint64_t v9 = (char *)AES.GCM.SealedBox.combined.getter();
    unint64_t v29 = v31;
    outlined consume of Data?(v25, v26);
    goto LABEL_8;
  }
  outlined destroy of SymmetricKey??((uint64_t)v11, &demangling cache variable for type metadata for AES.GCM.Nonce?);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  outlined consume of Data?(v25, v24);
  return v9;
}

unint64_t lazy protocol witness table accessor for type ProcessVerifierError and conformance ProcessVerifierError()
{
  unint64_t result = lazy protocol witness table cache variable for type ProcessVerifierError and conformance ProcessVerifierError;
  if (!lazy protocol witness table cache variable for type ProcessVerifierError and conformance ProcessVerifierError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ProcessVerifierError and conformance ProcessVerifierError);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Data and conformance Data()
{
  unint64_t result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined consume of Data._Representation(a1, a2);
  }
  return a1;
}

void *initializeBufferWithCopyOfBuffer for ProcessVerifierError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ProcessVerifierError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ProcessVerifierError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for ProcessVerifierError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ProcessVerifierError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ProcessVerifierError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ProcessVerifierError()
{
  return &type metadata for ProcessVerifierError;
}

uint64_t ObjC metadata update function for ProcessVerifier()
{
  return type metadata accessor for ProcessVerifier();
}

uint64_t type metadata accessor for ProcessVerifier()
{
  uint64_t result = type metadata singleton initialization cache for ProcessVerifier;
  if (!type metadata singleton initialization cache for ProcessVerifier) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void type metadata completion function for ProcessVerifier()
{
  type metadata accessor for SymmetricKey??();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void type metadata accessor for SymmetricKey??()
{
  if (!lazy cache variable for type metadata for SymmetricKey??)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for SymmetricKey?);
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for SymmetricKey??);
    }
  }
}

uint64_t outlined destroy of SymmetricKey??(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined assign with take of SymmetricKey??(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey??);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of SymmetricKey?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t lazy protocol witness table accessor for type CryptoKitError and conformance CryptoKitError(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GenericPasswordStoreError and conformance GenericPasswordStoreError()
{
  unint64_t result = lazy protocol witness table cache variable for type GenericPasswordStoreError and conformance GenericPasswordStoreError;
  if (!lazy protocol witness table cache variable for type GenericPasswordStoreError and conformance GenericPasswordStoreError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GenericPasswordStoreError and conformance GenericPasswordStoreError);
  }
  return result;
}

void specialized Sequence.compactMap<A>(_:)(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for IDSAccount);
    lazy protocol witness table accessor for type IDSAccount and conformance NSObject();
    Set.Iterator.init(_cocoa:)();
    uint64_t v1 = v27;
    uint64_t v26 = v28;
    uint64_t v3 = v29;
    uint64_t v2 = v30;
    unint64_t v4 = v31;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v26 = a1 + 56;
    uint64_t v3 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v4 = v7 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v2 = 0;
  }
  uint64_t v23 = v3;
  int64_t v25 = (unint64_t)(v3 + 64) >> 6;
  unint64_t v24 = (void *)MEMORY[0x1E4FBC860];
  while (1)
  {
    uint64_t v8 = v2;
    if ((v1 & 0x8000000000000000) == 0) {
      break;
    }
    if (!__CocoaSet.Iterator.next()()) {
      goto LABEL_38;
    }
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for IDSAccount);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v11 = v32;
    swift_unknownObjectRelease();
    if (!v32) {
      goto LABEL_38;
    }
LABEL_31:
    id v15 = objc_msgSend(v11, sel_loginID, v23);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v19 = v18;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v24 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v24[2] + 1, 1, v24);
      }
      unint64_t v21 = v24[2];
      unint64_t v20 = v24[3];
      if (v21 >= v20 >> 1) {
        unint64_t v24 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v20 > 1), v21 + 1, 1, v24);
      }
      v24[2] = v21 + 1;
      uint64_t v22 = &v24[2 * v21];
      v22[4] = v17;
      v22[5] = v19;
    }
    else
    {
    }
  }
  if (v4)
  {
    unint64_t v9 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
    unint64_t v10 = v9 | (v2 << 6);
LABEL_30:
    id v11 = *(id *)(*(void *)(v1 + 48) + 8 * v10);
    if (!v11) {
      goto LABEL_38;
    }
    goto LABEL_31;
  }
  int64_t v12 = v2 + 1;
  if (!__OFADD__(v2, 1))
  {
    if (v12 >= v25) {
      goto LABEL_38;
    }
    unint64_t v13 = *(void *)(v26 + 8 * v12);
    ++v2;
    if (!v13)
    {
      uint64_t v2 = v8 + 2;
      if (v8 + 2 >= v25) {
        goto LABEL_38;
      }
      unint64_t v13 = *(void *)(v26 + 8 * v2);
      if (!v13)
      {
        uint64_t v2 = v8 + 3;
        if (v8 + 3 >= v25) {
          goto LABEL_38;
        }
        unint64_t v13 = *(void *)(v26 + 8 * v2);
        if (!v13)
        {
          uint64_t v2 = v8 + 4;
          if (v8 + 4 >= v25) {
            goto LABEL_38;
          }
          unint64_t v13 = *(void *)(v26 + 8 * v2);
          if (!v13)
          {
            uint64_t v2 = v8 + 5;
            if (v8 + 5 >= v25) {
              goto LABEL_38;
            }
            unint64_t v13 = *(void *)(v26 + 8 * v2);
            if (!v13)
            {
              uint64_t v14 = v8 + 6;
              while (v25 != v14)
              {
                unint64_t v13 = *(void *)(v26 + 8 * v14++);
                if (v13)
                {
                  uint64_t v2 = v14 - 1;
                  goto LABEL_29;
                }
              }
LABEL_38:
              outlined consume of Set<IDSAccount>.Iterator._Variant();
              return;
            }
          }
        }
      }
    }
LABEL_29:
    unint64_t v4 = (v13 - 1) & v13;
    unint64_t v10 = __clz(__rbit64(v13)) + (v2 << 6);
    goto LABEL_30;
  }
  __break(1u);
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t a1)
{
  return specialized Array.append<A>(contentsOf:)(a1, (uint64_t (*)(void))specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:), MEMORY[0x1E4F24F80]);
}

{
  return specialized Array.append<A>(contentsOf:)(a1, (uint64_t (*)(void))specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:), MEMORY[0x1E4F250F8]);
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(void))
{
  unint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *v3;
  uint64_t v6 = *(void *)(*v3 + 16);
  if (__OFADD__(v6, v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  if (swift_isUniquelyReferenced_nonNull_native()
    && (int64_t)(v6 + v4) <= *(void *)(v5 + 24) >> 1)
  {
    unint64_t v10 = *(void *)(a1 + 16);
    if (v10) {
      goto LABEL_5;
    }
LABEL_15:
    if (!v4) {
      goto LABEL_16;
    }
    goto LABEL_18;
  }
  uint64_t v5 = a2();
  unint64_t v10 = *(void *)(a1 + 16);
  if (!v10) {
    goto LABEL_15;
  }
LABEL_5:
  uint64_t v11 = *(void *)(v5 + 16);
  uint64_t v12 = (*(void *)(v5 + 24) >> 1) - v11;
  uint64_t v13 = *(void *)(a3(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  if (v12 < (uint64_t)v10)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v16 = v5 + v15 + v14 * v11;
  unint64_t v17 = a1 + v15;
  uint64_t v18 = v14 * v10;
  unint64_t v19 = v16 + v18;
  unint64_t v20 = v17 + v18;
  if (v17 < v19 && v16 < v20) {
    goto LABEL_21;
  }
  swift_arrayInitWithCopy();
  if (v10 < v4)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v22 = *(void *)(v5 + 16);
  BOOL v23 = __OFADD__(v22, v10);
  uint64_t v24 = v22 + v10;
  if (!v23)
  {
    *(void *)(v5 + 16) = v24;
LABEL_16:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t *v3 = v5;
    return result;
  }
LABEL_20:
  __break(1u);
LABEL_21:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

Swift::Int *SL_GLT_KEY_BIT_COUNT.unsafeMutableAddressor()
{
  return &SL_GLT_KEY_BIT_COUNT;
}

uint64_t one-time initialization function for SL_GLT_SEED_EXTRACTION_LABEL()
{
  uint64_t result = specialized Data.init<A>(_:)(0xD000000000000017, 0x800000019BEDA660);
  SL_GLT_SEED_EXTRACTION_LABEL = result;
  *(void *)algn_1E93EAF88 = v1;
  return result;
}

uint64_t *SL_GLT_SEED_EXTRACTION_LABEL.unsafeMutableAddressor()
{
  if (one-time initialization token for SL_GLT_SEED_EXTRACTION_LABEL != -1) {
    swift_once();
  }
  return &SL_GLT_SEED_EXTRACTION_LABEL;
}

uint64_t KeyQueryController.service.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___SLKeyQueryController_service);
  swift_bridgeObjectRetain();
  return v1;
}

id KeyQueryController.queue.getter()
{
  return *(id *)(v0 + OBJC_IVAR___SLKeyQueryController_queue);
}

uint64_t KeyQueryController.queryController.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of HighlightDisambiguationPillMetricVariant(v1 + OBJC_IVAR___SLKeyQueryController_queryController, a1);
}

id KeyQueryController.idsService.getter()
{
  return *(id *)(v0 + OBJC_IVAR___SLKeyQueryController_idsService);
}

void KeyQueryController.pushTokenForSelf.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___SLKeyQueryController____lazy_storage___pushTokenForSelf);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___SLKeyQueryController____lazy_storage___pushTokenForSelf);
  unint64_t v3 = *(void *)(v0 + OBJC_IVAR___SLKeyQueryController____lazy_storage___pushTokenForSelf + 8);
  if (v3 >> 60 != 15) {
    goto LABEL_5;
  }
  id v4 = objc_msgSend(self, sel_sharedInstance);
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = objc_msgSend(v4, sel_pushToken);

    if (v6)
    {
      uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v9 = v8;

      uint64_t v10 = *v1;
      unint64_t v11 = v1[1];
      uint64_t *v1 = v7;
      v1[1] = v9;
      outlined copy of Data._Representation(v7, v9);
      outlined consume of Data?(v10, v11);
LABEL_5:
      outlined copy of Data?(v2, v3);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t outlined copy of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined copy of Data._Representation(a1, a2);
  }
  return a1;
}

uint64_t KeyQueryController.pushTokenForSelf.setter(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (void *)(v2 + OBJC_IVAR___SLKeyQueryController____lazy_storage___pushTokenForSelf);
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR___SLKeyQueryController____lazy_storage___pushTokenForSelf);
  unint64_t v5 = *(void *)(v2 + OBJC_IVAR___SLKeyQueryController____lazy_storage___pushTokenForSelf + 8);
  void *v3 = a1;
  v3[1] = a2;
  return outlined consume of Data?(v4, v5);
}

uint64_t (*KeyQueryController.pushTokenForSelf.modify(void *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  KeyQueryController.pushTokenForSelf.getter();
  *a1 = v3;
  a1[1] = v4;
  return KeyQueryController.pushTokenForSelf.modify;
}

uint64_t KeyQueryController.pushTokenForSelf.modify(uint64_t *a1, char a2)
{
  unint64_t v2 = a1[1];
  uint64_t v3 = *a1;
  uint64_t v4 = (uint64_t *)(a1[2] + OBJC_IVAR___SLKeyQueryController____lazy_storage___pushTokenForSelf);
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  *uint64_t v4 = *a1;
  v4[1] = v2;
  if (a2)
  {
    outlined copy of Data._Representation(v3, v2);
    outlined consume of Data?(v5, v6);
    return outlined consume of Data._Representation(v3, v2);
  }
  else
  {
    return outlined consume of Data?(v5, v6);
  }
}

id KeyQueryController.localAccountHandles.getter()
{
  uint64_t v1 = OBJC_IVAR___SLKeyQueryController____lazy_storage___localAccountHandles;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___SLKeyQueryController____lazy_storage___localAccountHandles);
  uint64_t v3 = v2;
  if (v2 != 1) {
    goto LABEL_4;
  }
  id result = objc_msgSend(*(id *)(v0 + OBJC_IVAR___SLKeyQueryController_idsService), sel_accounts);
  if (result)
  {
    uint64_t v5 = result;
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for IDSAccount);
    lazy protocol witness table accessor for type IDSAccount and conformance NSObject();
    uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    specialized Sequence.compactMap<A>(_:)(v6);
    uint64_t v3 = v7;
    swift_bridgeObjectRelease();
    uint64_t v8 = *(void *)(v0 + v1);
    *(void *)(v0 + v1) = v3;
    swift_bridgeObjectRetain();
    outlined consume of [String]??(v8);
LABEL_4:
    outlined copy of [String]??(v2);
    return (id)v3;
  }
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type IDSAccount and conformance NSObject()
{
  unint64_t result = lazy protocol witness table cache variable for type IDSAccount and conformance NSObject;
  if (!lazy protocol witness table cache variable for type IDSAccount and conformance NSObject)
  {
    type metadata accessor for SLHighlight(255, &lazy cache variable for type metadata for IDSAccount);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type IDSAccount and conformance NSObject);
  }
  return result;
}

uint64_t outlined consume of [String]??(uint64_t result)
{
  if (result != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t outlined copy of [String]??(uint64_t result)
{
  if (result != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t KeyQueryController.localAccountHandles.setter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR___SLKeyQueryController____lazy_storage___localAccountHandles);
  *(void *)(v1 + OBJC_IVAR___SLKeyQueryController____lazy_storage___localAccountHandles) = a1;
  return outlined consume of [String]??(v2);
}

uint64_t (*KeyQueryController.localAccountHandles.modify(id *a1))(void *a1, char a2)
{
  a1[1] = v1;
  *a1 = KeyQueryController.localAccountHandles.getter();
  return KeyQueryController.localAccountHandles.modify;
}

uint64_t KeyQueryController.localAccountHandles.modify(void *a1, char a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = *(void *)(v2 + OBJC_IVAR___SLKeyQueryController____lazy_storage___localAccountHandles);
  *(void *)(v2 + OBJC_IVAR___SLKeyQueryController____lazy_storage___localAccountHandles) = *a1;
  if (a2)
  {
    swift_bridgeObjectRetain();
    outlined consume of [String]??(v3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    return outlined consume of [String]??(v3);
  }
}

id KeyQueryController.__allocating_init(service:targetQueue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  id v8 = objc_allocWithZone(v4);
  uint64_t ObjectType = swift_getObjectType();
  id result = objc_msgSend(self, sel_sharedInstance);
  if (result)
  {
    id v11 = result;
    v13[3] = type metadata accessor for SLHighlight(0, (unint64_t *)&lazy cache variable for type metadata for IDSIDQueryController);
    v13[4] = &protocol witness table for IDSIDQueryController;
    v13[0] = v11;
    uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *))(ObjectType + 176))(a1, a2, a3, v13);
    swift_deallocPartialClassInstance();
    return (id)v12;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id KeyQueryController.init(service:targetQueue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType = swift_getObjectType();
  id result = objc_msgSend(self, sel_sharedInstance);
  if (result)
  {
    id v8 = result;
    v10[3] = type metadata accessor for SLHighlight(0, (unint64_t *)&lazy cache variable for type metadata for IDSIDQueryController);
    v10[4] = &protocol witness table for IDSIDQueryController;
    v10[0] = v8;
    uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *))(ObjectType + 176))(a1, a2, a3, v10);
    swift_deallocPartialClassInstance();
    return (id)v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t KeyQueryController.__allocating_init(service:targetQueue:queryController:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  specialized KeyQueryController.init(service:targetQueue:queryController:)(a1, a2, a3, a4);
  uint64_t v11 = v10;

  return v11;
}

uint64_t KeyQueryController.init(service:targetQueue:queryController:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  specialized KeyQueryController.init(service:targetQueue:queryController:)(a1, a2, a3, a4);
  uint64_t v6 = v5;

  return v6;
}

uint64_t KeyQueryController.publicKeysAndTPS(for:documentIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[13] = a4;
  v5[14] = v4;
  v5[11] = a2;
  v5[12] = a3;
  v5[10] = a1;
  uint64_t v6 = type metadata accessor for P256.Signing.PublicKey();
  v5[15] = v6;
  v5[16] = *(void *)(v6 - 8);
  v5[17] = swift_task_alloc();
  v5[18] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: P256.Signing.PublicKey, tps: Data));
  v5[19] = swift_task_alloc();
  v5[20] = swift_task_alloc();
  return MEMORY[0x1F4188298](KeyQueryController.publicKeysAndTPS(for:documentIdentifier:), 0, 0);
}

uint64_t KeyQueryController.publicKeysAndTPS(for:documentIdentifier:)()
{
  uint64_t v28 = v0;
  if (one-time initialization token for keyController != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[14];
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Log.keyController);
  swift_bridgeObjectRetain_n();
  id v3 = v1;
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (char *)v0[14];
  unint64_t v8 = v0[11];
  id v9 = &OBJC_PROTOCOL___SLDFooterViewService;
  if (v6)
  {
    uint64_t v10 = v0[10];
    uint64_t v11 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v27 = v26;
    *(_DWORD *)uint64_t v11 = 136315394;
    swift_bridgeObjectRetain();
    v0[8] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v8, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v11 + 12) = 2080;
    uint64_t v12 = *(void *)&v7[OBJC_IVAR___SLKeyQueryController_service];
    unint64_t v13 = *(void *)&v7[OBJC_IVAR___SLKeyQueryController_service + 8];
    swift_bridgeObjectRetain();
    v0[9] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v13, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_19BE17000, v4, v5, "Querying for IDSEndpoints for handles %s on service: %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    id v9 = &OBJC_PROTOCOL___SLDFooterViewService;
    MEMORY[0x19F392080](v26, -1, -1);
    MEMORY[0x19F392080](v11, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  uint64_t v14 = v0[14];
  uint64_t v15 = *(void *)(v14 + OBJC_IVAR___SLKeyQueryController_queryController + 24);
  uint64_t v16 = *(void *)(v14 + OBJC_IVAR___SLKeyQueryController_queryController + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v14 + OBJC_IVAR___SLKeyQueryController_queryController), v15);
  unint64_t v17 = (uint64_t *)((char *)v9[54].inst_meths + v14);
  uint64_t v18 = *v17;
  uint64_t v19 = v17[1];
  uint64_t v20 = *(void *)(v14 + OBJC_IVAR___SLKeyQueryController_queue);
  int64_t v25 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 + 8)
                                                                                              + **(int **)(v16 + 8));
  unint64_t v21 = (void *)swift_task_alloc();
  v0[21] = v21;
  void *v21 = v0;
  v21[1] = KeyQueryController.publicKeysAndTPS(for:documentIdentifier:);
  uint64_t v22 = v0[11];
  uint64_t v23 = v0[10];
  return v25(v23, v22, v18, v19, v20, v15, v16);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, unint64_t);
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t, uint64_t, uint64_t);
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  uint64_t v1 = *(void *)(v0 + 176);
  *(void *)(v0 + 56) = v1;
  if (*(void *)(v1 + 16))
  {
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v1 + 32, v0 + 16);
    specialized Array.replaceSubrange<A>(_:with:)(0, 1);
    uint64_t v2 = *(void *)(v0 + 40);
    id v3 = *(void *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v2);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
    BOOL v6 = (*(uint64_t (**)(void, void, void, unint64_t, void, void))((*MEMORY[0x1E4FBC8C8] & **(void **)(v0 + 112))
                                                                                             + 0xD0))(*(void *)(v0 + 160), *(void *)(v0 + 136), 0, 0xF000000000000000, *(void *)(v0 + 96), *(void *)(v0 + 104));
    unint64_t v8 = v7;
    id v9 = *(void *)(v0 + 160);
    uint64_t v10 = *(void *)(v0 + 144);
    uint64_t v11 = *(void *)(v0 + 128);
    int64_t v25 = *(void **)(v0 + 112);
    uint64_t v26 = *(void *)(v0 + 104);
    uint64_t v27 = *(void *)(v0 + 96);
    uint64_t v28 = *(void *)(v0 + 120);
    uint64_t v12 = (uint64_t *)(v9 + *(int *)(v10 + 48));
    uint64_t v22 = *(void *)(v0 + 152);
    uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    ((void (*)(void))v23)(*(void *)(v0 + 136));
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
    *uint64_t v12 = v6;
    v12[1] = v8;
    unint64_t v13 = (uint64_t *)(v22 + *(int *)(v10 + 48));
    uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
    v24(v22, v9, v28);
    char *v13 = v6;
    v13[1] = v8;
    outlined copy of Data._Representation(v6, v8);
    v23(v22, v28);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<P256.Signing.PublicKey>);
    uint64_t v14 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_19BED1BC0;
    v24(v22, v9, v28);
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v11 + 32))(v15 + v14, v22, v28);
    uint64_t v16 = *(void *)(v0 + 56);
    unint64_t v17 = v25;
    outlined copy of Data._Representation(v6, v8);
    swift_bridgeObjectRetain();
    uint64_t v18 = specialized Sequence.compactMap<A>(_:)(v16, v17, v6, v8, v27, v26);
    uint64_t v19 = *(void *)(v0 + 160);
    uint64_t v20 = *(void **)(v0 + 112);
    swift_bridgeObjectRelease();
    outlined consume of Data._Representation(v6, v8);

    swift_bridgeObjectRelease();
    specialized Array.append<A>(contentsOf:)(v18, (uint64_t (*)(void))specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:), MEMORY[0x1E4F250F8]);
    outlined destroy of SymmetricKey??(v19, &demangling cache variable for type metadata for (key: P256.Signing.PublicKey, tps: Data));
    unint64_t v21 = v15;
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v21 = 0;
    BOOL v6 = 0;
    unint64_t v8 = 0;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, unint64_t))(v0 + 8);
  return v4(v21, v6, v8);
}

uint64_t KeyQueryController.publicKeysAndTPS(for:documentIdentifier:)(uint64_t a1)
{
  *(void *)(*(void *)v1 + 176) = a1;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](KeyQueryController.publicKeysAndTPS(for:documentIdentifier:), 0, 0);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> KeyQueryController.validateKeyType(_:isPublicKey:)(SecKeyRef _, Swift::Bool isPublicKey)
{
  CFDictionaryRef v2 = SecKeyCopyAttributes(_);
  if (v2)
  {
    CFDictionaryRef v3 = v2;
    uint64_t v4 = 0;
    type metadata accessor for CFStringRef(0);
    lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, type metadata accessor for CFStringRef);
    static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
  }
  lazy protocol witness table accessor for type KeyQueryController.DiversificationErrors and conformance KeyQueryController.DiversificationErrors();
  swift_allocError();
  swift_willThrow();
}

id KeyQueryController.diversify(publicKey:tps:docId:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  v19[1] = *(id *)MEMORY[0x1E4F143B8];
  if (a4 >> 60 == 15) {
    Class isa = 0;
  }
  else {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
  }
  uint64_t v11 = self;
  uint64_t v12 = (void *)MEMORY[0x19F3906A0](a5, a6);
  v19[0] = 0;
  id v13 = objc_msgSend(v11, sel_diversifyPublicKey_trackingPreventionSalt_withDocumentIdentifier_error_, a2, isa, v12, v19);

  if (v13)
  {
    id v14 = v19[0];
    id v15 = objc_msgSend(v13, sel_diversifiedKey);
    id v16 = v15;
    SecKeyRef.p256PublicKey.getter();
    if (v6)
    {
    }
    else
    {

      id v17 = objc_msgSend(v13, sel_trackingPreventionSalt);
      id v16 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    }
  }
  else
  {
    id v16 = v19[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v16;
}

uint8_t *KeyQueryController.diversifyKey(_:trackingPreventionSalt:documentIdentifier:)(uint64_t a1, uint64_t a2, uint8_t *a3, char *a4, char *a5, void (*a6)(char *, uint64_t, uint64_t))
{
  id v55 = a5;
  CFAttributedStringRef v56 = a6;
  uint64_t v53 = a3;
  unint64_t v54 = a4;
  uint64_t v52 = a1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for P256.Signing.PublicKey?);
  uint64_t v8 = MEMORY[0x1F4188790](v7 - 8);
  uint64_t v49 = (uint64_t)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v51 = (uint64_t)&v48 - v10;
  uint64_t v11 = type metadata accessor for P256.Signing.PublicKey();
  uint64_t v50 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  id v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v12);
  id v17 = (char *)&v48 - v16;
  MEMORY[0x1F4188790](v15);
  uint64_t v19 = (char *)&v48 - v18;
  uint64_t v20 = type metadata accessor for Logger();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  uint64_t v23 = (uint8_t *)&v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  SecKeyRef v24 = P256.Signing.PublicKey.secKey.getter();
  if (v24)
  {
    SecKeyRef v25 = v24;
    uint64_t v26 = (uint8_t *)(*(uint64_t (**)(uint64_t, SecKeyRef, uint8_t *, char *, char *, void (*)(char *, uint64_t, uint64_t)))((*MEMORY[0x1E4FBC8C8] & *v57) + 0xC8))(v52, v24, v53, v54, v55, v56);
  }
  else
  {
    uint64_t v27 = a2;
    unint64_t v54 = v14;
    id v55 = v17;
    uint64_t v58 = v19;
    uint64_t v28 = v11;
    uint64_t v29 = v50;
    uint64_t v26 = v23;
    uint64_t v30 = v21;
    uint64_t v31 = v20;
    if (one-time initialization token for keyController != -1) {
      swift_once();
    }
    uint64_t v32 = __swift_project_value_buffer(v20, (uint64_t)static Log.keyController);
    (*(void (**)(uint8_t *, uint64_t, uint64_t))(v21 + 16))(v23, v32, v20);
    long long v33 = v58;
    CFAttributedStringRef v56 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 16);
    v56(v58, v27, v28);
    uint64_t v34 = Logger.logObject.getter();
    LODWORD(v57) = static os_log_type_t.error.getter();
    BOOL v35 = os_log_type_enabled(v34, (os_log_type_t)v57);
    uint64_t v36 = v51;
    if (v35)
    {
      uint64_t v52 = v30;
      uint64_t v53 = v26;
      os_log_t v48 = v34;
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      uint64_t v60 = v37;
      *(_DWORD *)uint64_t v26 = 136315138;
      uint64_t v38 = v33;
      uint64_t v39 = (void (*)(char *, char *, uint64_t))v56;
      v56((char *)v36, (uint64_t)v38, v28);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v29 + 56))(v36, 0, 1, v28);
      uint64_t v40 = v49;
      outlined init with copy of P256.Signing.PublicKey?(v36, v49);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v40, 1, v28) == 1)
      {
        unint64_t v41 = 0xE300000000000000;
        uint64_t v42 = 7104878;
      }
      else
      {
        unint64_t v43 = v55;
        (*(void (**)(char *, uint64_t, uint64_t))(v29 + 32))(v55, v40, v28);
        v39(v54, v43, v28);
        uint64_t v42 = String.init<A>(reflecting:)();
        unint64_t v41 = v44;
        (*(void (**)(char *, uint64_t))(v29 + 8))(v43, v28);
      }
      uint64_t v45 = v53;
      outlined destroy of SymmetricKey??(v51, &demangling cache variable for type metadata for P256.Signing.PublicKey?);
      uint64_t v59 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v42, v41, &v60);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v58, v28);
      os_log_t v46 = v48;
      _os_log_impl(&dword_19BE17000, v48, (os_log_type_t)v57, "Failed to create SecKey from P256 publicKey %s", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x19F392080](v37, -1, -1);
      MEMORY[0x19F392080](v26, -1, -1);

      (*(void (**)(uint8_t *, uint64_t))(v52 + 8))(v45, v31);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v29 + 8))(v33, v28);

      (*(void (**)(uint8_t *, uint64_t))(v30 + 8))(v26, v20);
    }
    lazy protocol witness table accessor for type KeyQueryController.DiversificationErrors and conformance KeyQueryController.DiversificationErrors();
    swift_allocError();
    swift_willThrow();
  }
  return v26;
}

uint64_t KeyQueryController.signData(data:documentIdentifier:trackingPreventionSalt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[22] = a5;
  v6[23] = v5;
  v6[20] = a3;
  v6[21] = a4;
  v6[18] = a1;
  v6[19] = a2;
  v6[24] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: P256.Signing.PublicKey, tps: Data));
  v6[25] = swift_task_alloc();
  v6[26] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for P256.Signing.PublicKey?);
  v6[27] = swift_task_alloc();
  uint64_t v7 = swift_task_alloc();
  v6[28] = v7;
  uint64_t v8 = *(int **)((*MEMORY[0x1E4FBC8C8] & *v5) + 0xE0);
  uint64_t v11 = (uint64_t (*)(uint64_t))((char *)v8 + *v8);
  uint64_t v9 = (void *)swift_task_alloc();
  v6[29] = v9;
  *uint64_t v9 = v6;
  v9[1] = KeyQueryController.signData(data:documentIdentifier:trackingPreventionSalt:);
  return v11(v7);
}

uint64_t KeyQueryController.signData(data:documentIdentifier:trackingPreventionSalt:)()
{
  *(void *)(*(void *)v1 + 240) = v0;
  swift_task_dealloc();
  if (v0) {
    CFDictionaryRef v2 = KeyQueryController.signData(data:documentIdentifier:trackingPreventionSalt:);
  }
  else {
    CFDictionaryRef v2 = KeyQueryController.signData(data:documentIdentifier:trackingPreventionSalt:);
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  SecKeyRef v6;
  void (*v7)(uint64_t, uint64_t);
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  BOOL v14;
  unint64_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  id v27;
  void *v28;
  Class isa;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t (*v34)(void, unint64_t);
  void (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  uint64_t v40 = v0;
  uint64_t v1 = *(void *)(v0 + 216);
  outlined init with copy of P256.Signing.PublicKey?(*(void *)(v0 + 224), v1);
  CFDictionaryRef v2 = type metadata accessor for P256.Signing.PublicKey();
  CFDictionaryRef v3 = *(void *)(v2 - 8);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  os_log_type_t v5 = *(void *)(v0 + 216);
  if (v4 == 1)
  {
    outlined destroy of SymmetricKey??(*(void *)(v0 + 216), &demangling cache variable for type metadata for P256.Signing.PublicKey?);
LABEL_9:
    outlined destroy of SymmetricKey??(*(void *)(v0 + 224), &demangling cache variable for type metadata for P256.Signing.PublicKey?);
LABEL_15:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v34 = *(uint64_t (**)(void, unint64_t))(v0 + 8);
    return v34(0, 0xF000000000000000);
  }
  uint64_t v6 = P256.Signing.PublicKey.secKey.getter();
  *(void *)(v0 + 248) = v6;
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v7(v5, v2);
  if (!v6) {
    goto LABEL_9;
  }
  uint64_t v8 = *(void **)(v0 + 240);
  uint64_t v9 = (*(uint64_t (**)(void, SecKeyRef, void, void, void, void))((*MEMORY[0x1E4FBC8C8] & **(void **)(v0 + 184))
                                                                                    + 0xC8))(*(void *)(v0 + 208), v6, *(void *)(v0 + 168), *(void *)(v0 + 176), *(void *)(v0 + 152), *(void *)(v0 + 160));
  if (v8)
  {
    outlined destroy of SymmetricKey??(*(void *)(v0 + 224), &demangling cache variable for type metadata for P256.Signing.PublicKey?);

    if (one-time initialization token for default != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    __swift_project_value_buffer(v11, (uint64_t)static Log.default);
    swift_bridgeObjectRetain_n();
    uint64_t v12 = Logger.logObject.getter();
    uint64_t v13 = static os_log_type_t.error.getter();
    id v14 = os_log_type_enabled(v12, v13);
    uint64_t v15 = *(void *)(v0 + 160);
    if (v14)
    {
      uint64_t v16 = *(void *)(v0 + 152);
      id v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v39 = v18;
      *(_DWORD *)id v17 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 136) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v15, &v39);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19BE17000, v12, v13, "Error while signing data for document with identifier: %s", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x19F392080](v18, -1, -1);
      MEMORY[0x19F392080](v17, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    goto LABEL_15;
  }
  uint64_t v19 = v9;
  uint64_t v20 = v10;
  uint64_t v21 = *(void *)(v0 + 200);
  uint64_t v22 = *(void *)(v0 + 192);
  uint64_t v36 = v7;
  uint64_t v37 = *(void *)(v0 + 184);
  uint64_t v23 = *(void *)(v0 + 152);
  SecKeyRef v24 = *(void *)(v0 + 160);
  uint64_t v38 = *(void *)(v0 + 144);
  SecKeyRef v25 = (uint64_t *)(*(void *)(v0 + 208) + *(int *)(v22 + 48));
  *SecKeyRef v25 = v9;
  v25[1] = v10;
  uint64_t v26 = (uint64_t *)(v21 + *(int *)(v22 + 48));
  (*(void (**)(uint64_t))(v3 + 16))(v21);
  uint8_t *v26 = v19;
  v26[1] = v20;
  uint64_t v27 = objc_allocWithZone(MEMORY[0x1E4F6B5B0]);
  swift_bridgeObjectRetain();
  outlined copy of Data._Representation(v19, v20);
  uint64_t v28 = (void *)MEMORY[0x19F3906A0](v23, v24);
  swift_bridgeObjectRelease();
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  uint64_t v30 = objc_msgSend(v27, sel_initWithDiversifier_trackingPreventionSecret_, v28, isa);
  *(void *)(v0 + 256) = v30;
  outlined consume of Data._Representation(v19, v20);

  v36(v21, v2);
  uint64_t v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F6B5B8]), sel_initWithKeyType_diversifier_, 1, v30);
  *(void *)(v0 + 264) = v31;
  uint64_t v32 = *(void **)(v37 + OBJC_IVAR___SLKeyQueryController_idsService);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 120;
  *(void *)(v0 + 24) = KeyQueryController.signData(data:documentIdentifier:trackingPreventionSalt:);
  long long v33 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x1E4F143A8];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSData?, @unowned NSError?) -> () with result type Data;
  *(void *)(v0 + 104) = &block_descriptor;
  *(void *)(v0 + 112) = v33;
  objc_msgSend(v32, sel_signData_withAlgorithm_options_completion_, v38, 1, v31, v0 + 80);
  return MEMORY[0x1F41881E8](v0 + 16);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 272) = v1;
  if (v1) {
    CFDictionaryRef v2 = KeyQueryController.signData(data:documentIdentifier:trackingPreventionSalt:);
  }
  else {
    CFDictionaryRef v2 = KeyQueryController.signData(data:documentIdentifier:trackingPreventionSalt:);
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t v10;

  CFDictionaryRef v2 = (void *)v0[32];
  uint64_t v1 = (void *)v0[33];
  CFDictionaryRef v3 = (void *)v0[31];
  uint64_t v4 = v0[28];
  os_log_type_t v5 = v0[26];

  outlined destroy of SymmetricKey??(v5, &demangling cache variable for type metadata for (key: P256.Signing.PublicKey, tps: Data));
  outlined destroy of SymmetricKey??(v4, &demangling cache variable for type metadata for P256.Signing.PublicKey?);
  uint64_t v7 = v0[15];
  uint64_t v6 = v0[16];

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v8(v7, v6);
}

{
  void *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  BOOL v5;
  unint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t (*v10)(void, unint64_t);
  uint64_t v12;
  void *v13;
  uint64_t v14;

  uint64_t v13 = v0;
  uint64_t v1 = (void *)v0[30];
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  CFDictionaryRef v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Log.default);
  swift_bridgeObjectRetain_n();
  CFDictionaryRef v3 = Logger.logObject.getter();
  uint64_t v4 = static os_log_type_t.error.getter();
  os_log_type_t v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = v0[20];
  if (v5)
  {
    uint64_t v7 = v0[19];
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v12 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_bridgeObjectRetain();
    v0[17] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v7, v6, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19BE17000, v3, v4, "Error while signing data for document with identifier: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F392080](v9, -1, -1);
    MEMORY[0x19F392080](v8, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void, unint64_t))v0[1];
  return v10(0, 0xF000000000000000);
}

{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  BOOL v10;
  unint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t (*v15)(void, unint64_t);
  uint64_t v17;
  void *v18;
  uint64_t v19;

  uint64_t v18 = v0;
  uint64_t v1 = (void *)v0[33];
  CFDictionaryRef v3 = (void *)v0[31];
  CFDictionaryRef v2 = (void *)v0[32];
  uint64_t v4 = v0[28];
  os_log_type_t v5 = v0[26];
  swift_willThrow();

  outlined destroy of SymmetricKey??(v5, &demangling cache variable for type metadata for (key: P256.Signing.PublicKey, tps: Data));
  outlined destroy of SymmetricKey??(v4, &demangling cache variable for type metadata for P256.Signing.PublicKey?);

  uint64_t v6 = (void *)v0[34];
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  __swift_project_value_buffer(v7, (uint64_t)static Log.default);
  swift_bridgeObjectRetain_n();
  uint64_t v8 = Logger.logObject.getter();
  uint64_t v9 = static os_log_type_t.error.getter();
  uint64_t v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = v0[20];
  if (v10)
  {
    uint64_t v12 = v0[19];
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    id v14 = swift_slowAlloc();
    id v17 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    swift_bridgeObjectRetain();
    v0[17] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v11, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19BE17000, v8, v9, "Error while signing data for document with identifier: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F392080](v14, -1, -1);
    MEMORY[0x19F392080](v13, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void, unint64_t))v0[1];
  return v15(0, 0xF000000000000000);
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSData?, @unowned NSError?) -> () with result type Data(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x1F4188208](v3, v5);
  }
  else
  {
    id v8 = a2;
    uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = v10;

    uint64_t v12 = *(uint64_t **)(*(void *)(v3 + 64) + 40);
    *uint64_t v12 = v9;
    v12[1] = v11;
    return MEMORY[0x1F4188200](v3);
  }
}

uint64_t KeyQueryController.localPublicKey()(uint64_t a1)
{
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = v1;
  return MEMORY[0x1F4188298](KeyQueryController.localPublicKey(), 0, 0);
}

{
  uint64_t v1;
  uint64_t v3;

  *(void *)(*(void *)v1 + 72) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4188298](KeyQueryController.localPublicKey(), 0, 0);
}

uint64_t KeyQueryController.localPublicKey()()
{
  uint64_t v34 = v0;
  v33[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **(void **)(v0 + 40)) + 0x98))();
  if (v1)
  {
    if (v1[2])
    {
      unint64_t v2 = v1[5];
      uint64_t v32 = v1[4];
      *(void *)(v0 + 48) = v2;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (one-time initialization token for keyController != -1) {
        swift_once();
      }
      uint64_t v3 = *(void **)(v0 + 40);
      uint64_t v4 = type metadata accessor for Logger();
      *(void *)(v0 + 56) = v4;
      __swift_project_value_buffer(v4, (uint64_t)static Log.keyController);
      swift_bridgeObjectRetain_n();
      id v5 = v3;
      uint64_t v6 = Logger.logObject.getter();
      os_log_type_t v7 = static os_log_type_t.default.getter();
      BOOL v8 = os_log_type_enabled(v6, v7);
      uint64_t v9 = *(char **)(v0 + 40);
      uint64_t v10 = &OBJC_PROTOCOL___SLDFooterViewService;
      if (v8)
      {
        uint64_t v11 = swift_slowAlloc();
        uint64_t v31 = swift_slowAlloc();
        v33[0] = v31;
        *(_DWORD *)uint64_t v11 = 136315394;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 16) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v2, v33);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v11 + 12) = 2080;
        uint64_t v13 = *(void *)&v9[OBJC_IVAR___SLKeyQueryController_service];
        unint64_t v12 = *(void *)&v9[OBJC_IVAR___SLKeyQueryController_service + 8];
        swift_bridgeObjectRetain();
        *(void *)(v0 + 24) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v12, v33);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_19BE17000, v6, v7, "Querying for IDSEndpoints for handles %s on service: %s", (uint8_t *)v11, 0x16u);
        swift_arrayDestroy();
        uint64_t v10 = &OBJC_PROTOCOL___SLDFooterViewService;
        MEMORY[0x19F392080](v31, -1, -1);
        MEMORY[0x19F392080](v11, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v22 = *(void *)(v0 + 40);
      uint64_t v23 = *(void *)(v22 + OBJC_IVAR___SLKeyQueryController_queryController + 24);
      uint64_t v24 = *(void *)(v22 + OBJC_IVAR___SLKeyQueryController_queryController + 32);
      __swift_project_boxed_opaque_existential_1((void *)(v22 + OBJC_IVAR___SLKeyQueryController_queryController), v23);
      SecKeyRef v25 = (uint64_t *)((char *)v10[54].inst_meths + v22);
      uint64_t v26 = *v25;
      uint64_t v27 = v25[1];
      uint64_t v28 = *(void *)(v22 + OBJC_IVAR___SLKeyQueryController_queue);
      uint64_t v30 = (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 + 8) + **(int **)(v24 + 8));
      uint64_t v29 = (void *)swift_task_alloc();
      *(void *)(v0 + 64) = v29;
      void *v29 = v0;
      v29[1] = KeyQueryController.localPublicKey();
      return v30(v32, v2, v26, v27, v28, v23, v24);
    }
    swift_bridgeObjectRelease();
  }
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  uint64_t v14 = type metadata accessor for Logger();
  __swift_project_value_buffer(v14, (uint64_t)static Log.default);
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v15, v16))
  {
    id v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v17 = 0;
    _os_log_impl(&dword_19BE17000, v15, v16, "KeyQueryController.localPublicKey() Could not get localHandle", v17, 2u);
    MEMORY[0x19F392080](v17, -1, -1);
  }
  uint64_t v18 = *(void *)(v0 + 32);

  uint64_t v19 = type metadata accessor for P256.Signing.PublicKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
  uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
  return v20();
}

{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  size_t v40;
  int v41;
  int v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  size_t v46;
  int v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  size_t v55;
  int v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  int64_t v60;
  uint64_t v61;
  size_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  size_t v68;
  int v69;
  uint64_t v70;
  size_t v71;
  NSObject *v72;
  os_log_type_t v73;
  uint8_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t (*v81)(void);
  uint64_t v83;
  void *v84;
  char *v85;
  void *v86;
  char *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t (*v92)(void);
  unint64_t v93;
  void *v94;
  void __s1[2];
  uint64_t v96;
  __int16 v97;
  char v98;
  char v99;
  char v100;
  char v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;

  uint64_t v103 = v0;
  uint64_t v1 = v0;
  double v102 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = specialized _arrayConditionalCast<A, B>(_:)(*(void *)(v0 + 72));
  swift_bridgeObjectRelease();
  if (!v2)
  {
    if (one-time initialization token for default != -1) {
      goto LABEL_140;
    }
    goto LABEL_124;
  }
  if (v2 >> 62) {
    goto LABEL_134;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v3)
  {
LABEL_135:
    uint64_t v79 = *(void *)(v1 + 32);
    swift_bridgeObjectRelease();
    uint64_t v80 = type metadata accessor for P256.Signing.PublicKey();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v80 - 8) + 56))(v79, 1, 1, v80);
    goto LABEL_136;
  }
  while (1)
  {
    uint64_t v4 = 0;
    uint64_t v92 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **(void **)(v1 + 40)) + 0x80);
    uint64_t v93 = v2 & 0xC000000000000001;
    uint64_t v89 = v1;
    uint64_t v90 = v3;
    CFAttributedStringRef v91 = v2;
LABEL_8:
    if (v93)
    {
      id v5 = (id)MEMORY[0x19F390AB0](v4, v2);
      uint64_t v6 = v4 + 1;
      if (__OFADD__(v4, 1)) {
        goto LABEL_129;
      }
      break;
    }
    id v5 = *(id *)(v2 + 8 * v4 + 32);
    uint64_t v6 = v4 + 1;
    if (!__OFADD__(v4, 1)) {
      break;
    }
LABEL_129:
    __break(1u);
LABEL_130:
    __break(1u);
LABEL_131:
    __break(1u);
LABEL_132:
    __break(1u);
LABEL_133:
    __break(1u);
LABEL_134:
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v3) {
      goto LABEL_135;
    }
  }
  double v94 = v5;
  os_log_type_t v7 = objc_msgSend(v5, sel_pushToken);
  BOOL v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;

  uint64_t v11 = v92();
  uint64_t v13 = v11;
  uint64_t v14 = v12;
  uint64_t v15 = 0;
  switch(v10 >> 62)
  {
    case 1uLL:
      LODWORD(v15) = HIDWORD(v8) - v8;
      if (__OFSUB__(HIDWORD(v8), v8)) {
        goto LABEL_130;
      }
      uint64_t v15 = (int)v15;
      break;
    case 2uLL:
      id v17 = *(void *)(v8 + 16);
      os_log_type_t v16 = *(void *)(v8 + 24);
      uint64_t v18 = __OFSUB__(v16, v17);
      uint64_t v15 = v16 - v17;
      if (!v18) {
        break;
      }
      goto LABEL_131;
    case 3uLL:
      break;
    default:
      uint64_t v15 = BYTE6(v10);
      break;
  }
  unint64_t v2 = v12 >> 62;
  switch(v12 >> 62)
  {
    case 1uLL:
      LODWORD(v19) = HIDWORD(v11) - v11;
      if (__OFSUB__(HIDWORD(v11), v11)) {
        goto LABEL_132;
      }
      uint64_t v19 = (int)v19;
LABEL_23:
      if (v15 != v19)
      {
LABEL_6:
        outlined consume of Data._Representation(v11, v12);
        outlined consume of Data._Representation(v8, v10);
        unint64_t v2 = v91;
        goto LABEL_7;
      }
      if (v15 < 1)
      {
LABEL_127:
        outlined consume of Data._Representation(v11, v12);
        outlined consume of Data._Representation(v8, v10);
LABEL_128:
        swift_bridgeObjectRelease();
        IDSEndpoint.applicationPublicDeviceKey.getter();
        unint64_t v77 = *(void *)(v1 + 32);
        id v78 = type metadata accessor for P256.Signing.PublicKey();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v78 - 8) + 56))(v77, 0, 1, v78);

        goto LABEL_136;
      }
      break;
    case 2uLL:
      uint64_t v21 = *(void *)(v11 + 16);
      uint64_t v20 = *(void *)(v11 + 24);
      uint64_t v18 = __OFSUB__(v20, v21);
      uint64_t v19 = v20 - v21;
      if (!v18) {
        goto LABEL_23;
      }
      goto LABEL_133;
    case 3uLL:
      if (v15) {
        goto LABEL_6;
      }
      goto LABEL_127;
    default:
      uint64_t v19 = BYTE6(v12);
      goto LABEL_23;
  }
  switch(v10 >> 62)
  {
    case 1uLL:
      uint64_t v1 = (int)v8;
      if ((int)v8 <= v8 >> 32)
      {
        outlined copy of Data._Representation(v8, v10);
        uint64_t v27 = __DataStorage._bytes.getter();
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = __DataStorage._offset.getter();
          if (__OFSUB__((int)v8, v29)) {
            goto LABEL_142;
          }
          uint64_t v86 = (void *)(v28 + (int)v8 - v29);
        }
        else
        {
          uint64_t v86 = 0;
        }
        __DataStorage._length.getter();
        uint64_t v1 = v89;
        if (v2)
        {
          if (v2 == 1)
          {
            if (v13 >> 32 < (int)v13) {
              goto LABEL_151;
            }
            swift_retain();
            unint64_t v43 = (char *)__DataStorage._bytes.getter();
            if (v43)
            {
              unint64_t v44 = __DataStorage._offset.getter();
              if (__OFSUB__((int)v13, v44)) {
                goto LABEL_158;
              }
              v43 += (int)v13 - v44;
            }
            uint64_t v1 = v89;
            uint64_t v45 = __DataStorage._length.getter();
            if (v45 >= (v13 >> 32) - (int)v13) {
              os_log_t v46 = (v13 >> 32) - (int)v13;
            }
            else {
              os_log_t v46 = v45;
            }
            if (!v86) {
              goto LABEL_161;
            }
            unint64_t v2 = v91;
            if (!v43) {
              goto LABEL_162;
            }
            uint64_t v47 = memcmp(v86, v43, v46);
            outlined consume of Data._Representation(v13, v14);
            outlined consume of Data._Representation(v8, v10);
            outlined consume of Data._Representation(v13, v14);
            outlined consume of Data._Representation(v8, v10);
            if (!v47) {
              goto LABEL_128;
            }
          }
          else
          {
            double v63 = *(void *)(v13 + 16);
            uint64_t v85 = *(char **)(v13 + 24);
            swift_retain();
            swift_retain();
            uint64_t v64 = (char *)__DataStorage._bytes.getter();
            if (v64)
            {
              uint64_t v65 = __DataStorage._offset.getter();
              if (__OFSUB__(v63, v65)) {
                goto LABEL_157;
              }
              v64 += v63 - v65;
            }
            uint64_t v18 = __OFSUB__(v85, v63);
            double v66 = &v85[-v63];
            if (v18) {
              goto LABEL_152;
            }
            os_log_type_t v67 = __DataStorage._length.getter();
            if (v67 >= (uint64_t)v66) {
              uint64_t v68 = (size_t)v66;
            }
            else {
              uint64_t v68 = v67;
            }
            if (!v86) {
              goto LABEL_169;
            }
            unint64_t v2 = v91;
            if (!v64) {
              goto LABEL_170;
            }
            uint64_t v69 = memcmp(v86, v64, v68);
            swift_release();
            swift_release();
            outlined consume of Data._Representation(v8, v10);
            outlined consume of Data._Representation(v13, v14);
            outlined consume of Data._Representation(v8, v10);
            if (!v69) {
              goto LABEL_128;
            }
          }
        }
        else
        {
          uint64_t v96 = v13;
          uint64_t v97 = v14;
          double v98 = BYTE2(v14);
          uint64_t v99 = BYTE3(v14);
          uint64_t v100 = BYTE4(v14);
          double v101 = BYTE5(v14);
          if (!v86) {
            goto LABEL_168;
          }
          uint64_t v42 = memcmp(v86, &v96, BYTE6(v14));
          outlined consume of Data._Representation(v8, v10);
LABEL_121:
          outlined consume of Data._Representation(v13, v14);
          outlined consume of Data._Representation(v8, v10);
          unint64_t v2 = v91;
          if (!v42) {
            goto LABEL_128;
          }
        }
LABEL_7:

        ++v4;
        if (v6 == v90) {
          goto LABEL_135;
        }
        goto LABEL_8;
      }
      __break(1u);
LABEL_140:
      swift_once();
LABEL_124:
      __swift_project_value_buffer(*(void *)(v1 + 56), (uint64_t)static Log.default);
      unint64_t v72 = Logger.logObject.getter();
      uint64_t v73 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v72, v73))
      {
        uint64_t v74 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v74 = 0;
        _os_log_impl(&dword_19BE17000, v72, v73, "KeyQueryController.localPublicKey() Could not get currentRemoteDevice", v74, 2u);
        MEMORY[0x19F392080](v74, -1, -1);
      }
      uint64_t v75 = *(void *)(v1 + 32);

      uint64_t v76 = type metadata accessor for P256.Signing.PublicKey();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v76 - 8) + 56))(v75, 1, 1, v76);
LABEL_136:
      uint64_t v81 = *(uint64_t (**)(void))(v1 + 8);
      return v81();
    case 2uLL:
      uint64_t v30 = *(void *)(v8 + 16);
      swift_retain();
      swift_retain();
      uint64_t v31 = (char *)__DataStorage._bytes.getter();
      if (!v31) {
        goto LABEL_40;
      }
      uint64_t v32 = __DataStorage._offset.getter();
      if (__OFSUB__(v30, v32))
      {
        __break(1u);
LABEL_142:
        __break(1u);
LABEL_143:
        __break(1u);
LABEL_144:
        __break(1u);
LABEL_145:
        __break(1u);
LABEL_146:
        __break(1u);
LABEL_147:
        __break(1u);
LABEL_148:
        __break(1u);
LABEL_149:
        __break(1u);
LABEL_150:
        __break(1u);
LABEL_151:
        __break(1u);
LABEL_152:
        __break(1u);
LABEL_153:
        __break(1u);
LABEL_154:
        __break(1u);
LABEL_155:
        __break(1u);
LABEL_156:
        __break(1u);
LABEL_157:
        __break(1u);
LABEL_158:
        __break(1u);
      }
      v31 += v30 - v32;
LABEL_40:
      __DataStorage._length.getter();
      uint64_t v1 = v89;
      if (!v2)
      {
        uint64_t v96 = v13;
        uint64_t v97 = v14;
        double v98 = BYTE2(v14);
        uint64_t v99 = BYTE3(v14);
        uint64_t v100 = BYTE4(v14);
        double v101 = BYTE5(v14);
        if (!v31) {
          goto LABEL_165;
        }
        CFAttributedStringRef v56 = memcmp(v31, &v96, BYTE6(v14));
        swift_release();
LABEL_99:
        swift_release();
        outlined consume of Data._Representation(v13, v14);
        outlined consume of Data._Representation(v8, v10);
        unint64_t v2 = v91;
        if (!v56) {
          goto LABEL_128;
        }
        goto LABEL_7;
      }
      id v84 = v31;
      if (v2 != 1)
      {
        uint64_t v57 = *(void *)(v13 + 16);
        uint64_t v83 = *(void *)(v13 + 24);
        swift_retain();
        swift_retain();
        uint64_t v58 = (char *)__DataStorage._bytes.getter();
        if (v58)
        {
          uint64_t v59 = __DataStorage._offset.getter();
          if (__OFSUB__(v57, v59)) {
            goto LABEL_155;
          }
          v58 += v57 - v59;
        }
        uint64_t v18 = __OFSUB__(v83, v57);
        uint64_t v60 = v83 - v57;
        if (v18) {
          goto LABEL_150;
        }
        uint64_t v61 = __DataStorage._length.getter();
        if (v61 >= v60) {
          os_log_type_t v62 = v60;
        }
        else {
          os_log_type_t v62 = v61;
        }
        if (!v84) {
          goto LABEL_166;
        }
        if (!v58) {
          goto LABEL_167;
        }
        CFAttributedStringRef v56 = memcmp(v84, v58, v62);
        swift_release();
        swift_release();
LABEL_98:
        swift_release();
        goto LABEL_99;
      }
      if (v13 >> 32 < (int)v13) {
        goto LABEL_145;
      }
      swift_retain();
      long long v33 = __DataStorage._bytes.getter();
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = __DataStorage._offset.getter();
        if (__OFSUB__((int)v13, v35)) {
          goto LABEL_156;
        }
        uint64_t v36 = (const void *)(v34 + (int)v13 - v35);
        uint64_t v1 = v89;
      }
      else
      {
        uint64_t v36 = 0;
      }
      uint64_t v70 = __DataStorage._length.getter();
      if (v70 >= (v13 >> 32) - (int)v13) {
        uint64_t v71 = (v13 >> 32) - (int)v13;
      }
      else {
        uint64_t v71 = v70;
      }
      if (!v31) {
        goto LABEL_171;
      }
      if (!v36) {
        goto LABEL_172;
      }
      uint64_t v42 = memcmp(v31, v36, v71);
      outlined consume of Data._Representation(v13, v14);
      swift_release();
      swift_release();
      goto LABEL_121;
    case 3uLL:
      memset(__s1, 0, 14);
      if (!v2) {
        goto LABEL_56;
      }
      if (v2 == 1)
      {
        uint64_t v22 = (v11 >> 32) - (int)v11;
        if (v11 >> 32 < (int)v11) {
          goto LABEL_144;
        }
        uint64_t v37 = __DataStorage._bytes.getter();
        if (!v37) {
          goto LABEL_160;
        }
        uint64_t v24 = v37;
        uint64_t v38 = __DataStorage._offset.getter();
        uint64_t v26 = (int)v13 - v38;
        if (__OFSUB__((int)v13, v38)) {
          goto LABEL_149;
        }
LABEL_51:
        uint64_t v39 = __DataStorage._length.getter();
        if (v39 >= v22) {
          uint64_t v40 = v22;
        }
        else {
          uint64_t v40 = v39;
        }
        unint64_t v41 = memcmp(__s1, (const void *)(v24 + v26), v40);
        outlined consume of Data._Representation(v13, v14);
        outlined consume of Data._Representation(v8, v10);
        uint64_t v1 = v89;
        unint64_t v2 = v91;
        if (!v41) {
          goto LABEL_128;
        }
        goto LABEL_7;
      }
      uint64_t v53 = *(void *)(v11 + 16);
      uint64_t v88 = *(char **)(v11 + 24);
      swift_retain();
      swift_retain();
      uint64_t v49 = (char *)__DataStorage._bytes.getter();
      if (v49)
      {
        unint64_t v54 = __DataStorage._offset.getter();
        if (__OFSUB__(v53, v54)) {
          goto LABEL_154;
        }
        v49 += v53 - v54;
      }
      uint64_t v18 = __OFSUB__(v88, v53);
      uint64_t v51 = &v88[-v53];
      if (v18) {
        goto LABEL_147;
      }
      uint64_t v52 = __DataStorage._length.getter();
      if (!v49) {
        goto LABEL_164;
      }
LABEL_82:
      if (v52 >= (uint64_t)v51) {
        id v55 = (size_t)v51;
      }
      else {
        id v55 = v52;
      }
      CFAttributedStringRef v56 = memcmp(__s1, v49, v55);
      goto LABEL_98;
    default:
      __s1[0] = v8;
      LOWORD(__s1[1]) = v10;
      BYTE2(__s1[1]) = BYTE2(v10);
      BYTE3(__s1[1]) = BYTE3(v10);
      BYTE4(__s1[1]) = BYTE4(v10);
      BYTE5(__s1[1]) = BYTE5(v10);
      if (!v2)
      {
LABEL_56:
        uint64_t v96 = v11;
        uint64_t v97 = v12;
        double v98 = BYTE2(v12);
        uint64_t v99 = BYTE3(v12);
        uint64_t v100 = BYTE4(v12);
        double v101 = BYTE5(v12);
        uint64_t v42 = memcmp(__s1, &v96, BYTE6(v12));
        goto LABEL_121;
      }
      if (v2 == 1)
      {
        uint64_t v22 = (v11 >> 32) - (int)v11;
        if (v11 >> 32 < (int)v11) {
          goto LABEL_143;
        }
        uint64_t v23 = __DataStorage._bytes.getter();
        if (!v23)
        {
          __DataStorage._length.getter();
          __break(1u);
LABEL_160:
          __DataStorage._length.getter();
          __break(1u);
LABEL_161:
          __break(1u);
LABEL_162:
          __break(1u);
LABEL_163:
          __break(1u);
LABEL_164:
          __break(1u);
LABEL_165:
          __break(1u);
LABEL_166:
          __break(1u);
LABEL_167:
          __break(1u);
LABEL_168:
          __break(1u);
LABEL_169:
          __break(1u);
LABEL_170:
          __break(1u);
LABEL_171:
          __break(1u);
LABEL_172:
          __break(1u);
          JUMPOUT(0x19BEA02D0);
        }
        uint64_t v24 = v23;
        SecKeyRef v25 = __DataStorage._offset.getter();
        uint64_t v26 = (int)v13 - v25;
        if (__OFSUB__((int)v13, v25)) {
          goto LABEL_148;
        }
        goto LABEL_51;
      }
      os_log_t v48 = *(void *)(v11 + 16);
      uint64_t v87 = *(char **)(v11 + 24);
      swift_retain();
      swift_retain();
      uint64_t v49 = (char *)__DataStorage._bytes.getter();
      if (v49)
      {
        uint64_t v50 = __DataStorage._offset.getter();
        if (__OFSUB__(v48, v50)) {
          goto LABEL_153;
        }
        v49 += v48 - v50;
      }
      uint64_t v18 = __OFSUB__(v87, v48);
      uint64_t v51 = &v87[-v48];
      if (v18) {
        goto LABEL_146;
      }
      uint64_t v52 = __DataStorage._length.getter();
      if (!v49) {
        goto LABEL_163;
      }
      goto LABEL_82;
  }
}

uint64_t specialized _arrayConditionalCast<A, B>(_:)(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x1E4FBC860];
  uint64_t v2 = *(void *)(a1 + 16);
  specialized ContiguousArray.reserveCapacity(_:)();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 40)
  {
    outlined init with copy of HighlightDisambiguationPillMetricVariant(i, (uint64_t)v5);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Endpoint);
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for IDSEndpoint);
    if (!swift_dynamicCast()) {
      break;
    }
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized ContiguousArray._endMutation()();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

void IDSEndpoint.applicationPublicDeviceKey.getter()
{
  id v1 = objc_msgSend(v0, sel_applicationPublicDeviceIdentity);
  if (v1)
  {
    uint64_t v2 = v1;
    SecKeyRef.p256PublicKey.getter();
  }
  else
  {
    if (one-time initialization token for keyController != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    __swift_project_value_buffer(v3, (uint64_t)static Log.keyController);
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_19BE17000, v4, v5, "Failed to convert IDSEndpoint's publicIdentity to SecKey, this is a failing forward declare!", v6, 2u);
      MEMORY[0x19F392080](v6, -1, -1);
    }

    lazy protocol witness table accessor for type KeyQueryController.DiversificationErrors and conformance KeyQueryController.DiversificationErrors();
    swift_allocError();
    swift_willThrow();
  }
}

uint64_t KeyQueryController.localPublicKey(using:trackingPreventionSalt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for P256.Signing.PublicKey?);
  uint64_t v7 = swift_task_alloc();
  v6[8] = v7;
  uint64_t v8 = type metadata accessor for P256.Signing.PublicKey();
  v6[9] = v8;
  v6[10] = *(void *)(v8 - 8);
  v6[11] = swift_task_alloc();
  uint64_t v9 = *(int **)((*MEMORY[0x1E4FBC8C8] & *v5) + 0xE0);
  unint64_t v12 = (uint64_t (*)(uint64_t))((char *)v9 + *v9);
  uint64_t v10 = (void *)swift_task_alloc();
  v6[12] = v10;
  *uint64_t v10 = v6;
  v10[1] = KeyQueryController.localPublicKey(using:trackingPreventionSalt:);
  return v12(v7);
}

uint64_t KeyQueryController.localPublicKey(using:trackingPreventionSalt:)()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = KeyQueryController.localPublicKey(using:trackingPreventionSalt:);
  }
  else {
    uint64_t v2 = KeyQueryController.localPublicKey(using:trackingPreventionSalt:);
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void);
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  uint64_t v1 = v0[9];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[8];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    outlined destroy of SymmetricKey??(v3, &demangling cache variable for type metadata for P256.Signing.PublicKey?);
    lazy protocol witness table accessor for type KeyQueryController.DiversificationErrors and conformance KeyQueryController.DiversificationErrors();
    swift_allocError();
    swift_willThrow();
LABEL_5:
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = (uint64_t (*)(void))v0[1];
    return v15();
  }
  uint64_t v4 = v0[11];
  os_log_type_t v5 = (void *)v0[7];
  uint64_t v19 = v0[6];
  uint64_t v20 = v0[13];
  uint64_t v7 = v0[4];
  uint64_t v6 = v0[5];
  uint64_t v8 = v0[2];
  uint64_t v9 = v0[3];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v4, v3, v1);
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((*MEMORY[0x1E4FBC8C8] & *v5)
                                                                                        + 0xD0))(v8, v4, v6, v19, v9, v7);
  unint64_t v12 = v11;
  uint64_t v13 = v0[10];
  uint64_t v14 = v0[9];
  if (v20)
  {
    (*(void (**)(void, uint64_t))(v13 + 8))(v0[11], v14);
    goto LABEL_5;
  }
  id v17 = v10;
  (*(void (**)(void, uint64_t))(v13 + 8))(v0[11], v14);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v18(v17, v12);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

id KeyQueryController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void KeyQueryController.init()()
{
}

id KeyQueryController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for KeyQueryController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static KeyQueryController.DiversificationErrors.== infix(_:_:)()
{
  return 1;
}

void KeyQueryController.DiversificationErrors.hash(into:)()
{
}

Swift::Int KeyQueryController.DiversificationErrors.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t IDSIDQueryController.currentRemoteDevice(for:service:queue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[7] = a5;
  v6[8] = v5;
  v6[5] = a3;
  v6[6] = a4;
  v6[3] = a1;
  v6[4] = a2;
  return MEMORY[0x1F4188298](IDSIDQueryController.currentRemoteDevice(for:service:queue:), 0, 0);
}

uint64_t IDSIDQueryController.currentRemoteDevice(for:service:queue:)()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = self;
  uint64_t v4 = (void *)MEMORY[0x19F3906A0](v1, v2);
  id v5 = objc_msgSend(v3, sel_normalizedHandleWithDestinationID_, v4);

  if (!v5) {
    goto LABEL_8;
  }
  id v6 = objc_msgSend(v5, sel_value);

  if (!v6)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = (id)MEMORY[0x19F3906A0](v7);
    swift_bridgeObjectRelease();
  }
  id v8 = objc_msgSend(v6, sel_IDSFormattedDestinationID);

  if (v8)
  {
    uint64_t v9 = *(void *)(v0 + 64);
    uint64_t v10 = *(void *)(v0 + 40);
    long long v24 = *(_OWORD *)(v0 + 48);
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = v12;

    *(void *)(v0 + 72) = v13;
    uint64_t v14 = swift_task_alloc();
    *(void *)(v0 + 80) = v14;
    *(void *)(v14 + 16) = v9;
    *(void *)(v14 + 24) = v11;
    *(void *)(v14 + 32) = v13;
    *(void *)(v14 + 40) = v10;
    *(_OWORD *)(v14 + 48) = v24;
    uint64_t v15 = (void *)swift_task_alloc();
    *(void *)(v0 + 88) = v15;
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Endpoint]);
    void *v15 = v0;
    v15[1] = IDSIDQueryController.currentRemoteDevice(for:service:queue:);
    return MEMORY[0x1F41880D8](v0 + 16, 0, 0, 0xD000000000000027, 0x800000019BEDA520, partial apply for closure #1 in IDSIDQueryController.currentRemoteDevice(for:service:queue:), v14, v16);
  }
  else
  {
LABEL_8:
    if (one-time initialization token for keyController != -1) {
      swift_once();
    }
    uint64_t v17 = type metadata accessor for Logger();
    __swift_project_value_buffer(v17, (uint64_t)static Log.keyController);
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_19BE17000, v18, v19, "Failed to format destination handle to IDS destinationID", v20, 2u);
      MEMORY[0x19F392080](v20, -1, -1);
    }

    uint64_t v21 = *(uint64_t (**)(uint64_t))(v0 + 8);
    uint64_t v22 = MEMORY[0x1E4FBC860];
    return v21(v22);
  }
}

{
  uint64_t v1;

  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return MEMORY[0x1F4188298](IDSIDQueryController.currentRemoteDevice(for:service:queue:), 0, 0);
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

void closure #1 in IDSIDQueryController.currentRemoteDevice(for:service:queue:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v38 = a2;
  uint64_t v39 = a7;
  uint64_t v34 = a6;
  uint64_t v35 = a5;
  uint64_t v36 = a3;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[Endpoint], Never>);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = MEMORY[0x19F3906A0](a3, a4);
  uint64_t v40 = MEMORY[0x19F3906A0](a5, a6);
  id v16 = objc_msgSend(self, sel_mainBundle);
  id v37 = objc_msgSend(v16, sel_bundleIdentifier);

  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a1, v12);
  unint64_t v17 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v18 = (v14 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v19 = (v18 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v20 = (v19 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v21 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v21 + v17, v15, v12);
  uint64_t v23 = v38;
  uint64_t v22 = v39;
  *(void *)(v21 + v18) = v38;
  long long v24 = (void *)(v21 + v19);
  void *v24 = v36;
  v24[1] = a4;
  uint64_t v25 = (void *)(v21 + v20);
  uint64_t v26 = v34;
  *uint64_t v25 = v35;
  v25[1] = v26;
  *(void *)(v21 + ((v20 + 23) & 0xFFFFFFFFFFFFFFF8)) = v22;
  aBlock[4] = partial apply for closure #1 in closure #1 in IDSIDQueryController.currentRemoteDevice(for:service:queue:);
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@unowned IDSIDStatus) -> ();
  aBlock[3] = &block_descriptor_23;
  uint64_t v27 = _Block_copy(aBlock);
  id v28 = v23;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v29 = v22;
  swift_release();
  uint64_t v30 = v28;
  uint64_t v32 = (void *)v40;
  uint64_t v31 = (void *)v41;
  long long v33 = v37;
  objc_msgSend(v30, sel_refreshIDStatusForDestination_service_listenerID_queue_completionBlock_, v41, v40, v37, v29, v27);
  _Block_release(v27);
}

void closure #1 in closure #1 in IDSIDQueryController.currentRemoteDevice(for:service:queue:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v34 = a3;
  uint64_t v35 = a8;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[Endpoint], Never>);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  MEMORY[0x1F4188790](v14);
  unint64_t v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 == 2)
  {
    if (one-time initialization token for keyController != -1) {
      swift_once();
    }
    uint64_t v18 = type metadata accessor for Logger();
    __swift_project_value_buffer(v18, (uint64_t)static Log.keyController);
    unint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_19BE17000, v19, v20, "Failed to refresh IDSStatus, can't proceed", v21, 2u);
      MEMORY[0x19F392080](v21, -1, -1);
    }

    aBlock[0] = MEMORY[0x1E4FBC860];
    CheckedContinuation.resume(returning:)();
  }
  else
  {
    uint64_t v33 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_19BED1BC0;
    *(void *)(v22 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v22 + 32) = a4;
    *(void *)(v22 + 40) = a5;
    swift_bridgeObjectRetain();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v31 = MEMORY[0x19F3906A0](a6, a7);
    id v23 = objc_msgSend(self, sel_mainBundle);
    id v24 = objc_msgSend(v23, sel_bundleIdentifier);

    if (v24)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))((char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v33, v14);
      unint64_t v25 = (*(unsigned __int8 *)(v15 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
      uint64_t v26 = (char *)swift_allocObject();
      *((void *)v26 + 2) = a6;
      *((void *)v26 + 3) = a7;
      *((void *)v26 + 4) = a4;
      *((void *)v26 + 5) = a5;
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&v26[v25], v17, v14);
      aBlock[4] = partial apply for closure #1 in closure #1 in closure #1 in IDSIDQueryController.currentRemoteDevice(for:service:queue:);
      aBlock[5] = v26;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed [AnyHashable : Any]?) -> ();
      aBlock[3] = &block_descriptor_29;
      uint64_t v27 = _Block_copy(aBlock);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_release();
      id v29 = (void *)v31;
      Class v28 = isa;
      objc_msgSend(v34, sel_currentRemoteDevicesForDestinations_service_listenerID_queue_completionBlock_, isa, v31, v24, v35, v27);
      _Block_release(v27);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t closure #1 in closure #1 in closure #1 in IDSIDQueryController.currentRemoteDevice(for:service:queue:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  if (one-time initialization token for keyController != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Logger();
  __swift_project_value_buffer(v10, (uint64_t)static Log.keyController);
  swift_bridgeObjectRetain_n();
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v11, v12))
  {
    swift_bridgeObjectRelease_n();

    if (a1) {
      goto LABEL_5;
    }
LABEL_9:
    long long v26 = 0u;
    long long v27 = 0u;
LABEL_14:
    outlined destroy of SymmetricKey??((uint64_t)&v26, &demangling cache variable for type metadata for Any?);
    goto LABEL_15;
  }
  uint64_t v24 = a1;
  uint64_t v13 = (uint8_t *)swift_slowAlloc();
  uint64_t v14 = swift_slowAlloc();
  v25[0] = v14;
  *(_DWORD *)uint64_t v13 = 136315138;
  swift_bridgeObjectRetain();
  *(void *)&long long v26 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a2, a3, v25);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease_n();
  _os_log_impl(&dword_19BE17000, v11, v12, "Received IDSEndpoints on service: %s", v13, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x19F392080](v14, -1, -1);
  uint64_t v15 = v13;
  a1 = v24;
  MEMORY[0x19F392080](v15, -1, -1);

  if (!v24) {
    goto LABEL_9;
  }
LABEL_5:
  swift_bridgeObjectRetain();
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v16 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v25), (v17 & 1) != 0))
  {
    outlined init with copy of Any(*(void *)(a1 + 56) + 32 * v16, (uint64_t)&v26);
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
  }
  outlined destroy of AnyHashable((uint64_t)v25);
  if (!*((void *)&v27 + 1)) {
    goto LABEL_14;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [IDSEndpoint]);
  if (swift_dynamicCast())
  {
    uint64_t v18 = specialized _arrayForceCast<A, B>(_:)(v25[0]);
    swift_bridgeObjectRelease();
    v25[0] = v18;
    goto LABEL_19;
  }
LABEL_15:
  swift_bridgeObjectRetain_n();
  unint64_t v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    v25[0] = v22;
    *(_DWORD *)uint64_t v21 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)&long long v26 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a4, a5, v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19BE17000, v19, v20, "Failed to find remoteDevices for destination %s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F392080](v22, -1, -1);
    MEMORY[0x19F392080](v21, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v25[0] = MEMORY[0x1E4FBC860];
LABEL_19:
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[Endpoint], Never>);
  return CheckedContinuation.resume(returning:)();
}

uint64_t specialized _arrayForceCast<A, B>(_:)(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x1E4FBC860];
  if (!v2) {
    return v3;
  }
  uint64_t v17 = MEMORY[0x1E4FBC860];
  uint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v3 = v17;
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v5 = 0;
      do
      {
        uint64_t v6 = MEMORY[0x19F390AB0](v5, a1);
        uint64_t v17 = v3;
        unint64_t v8 = *(void *)(v3 + 16);
        unint64_t v7 = *(void *)(v3 + 24);
        if (v8 >= v7 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v7 > 1, v8 + 1, 1);
          uint64_t v3 = v17;
        }
        ++v5;
        uint64_t v15 = type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for IDSEndpoint);
        unint64_t v16 = &protocol witness table for IDSEndpoint;
        *(void *)&long long v14 = v6;
        *(void *)(v3 + 16) = v8 + 1;
        outlined init with take of Endpoint(&v14, v3 + 40 * v8 + 32);
      }
      while (v2 != v5);
    }
    else
    {
      uint64_t v9 = (void **)(a1 + 32);
      do
      {
        uint64_t v10 = *v9;
        uint64_t v17 = v3;
        unint64_t v12 = *(void *)(v3 + 16);
        unint64_t v11 = *(void *)(v3 + 24);
        id v13 = v10;
        if (v12 >= v11 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v11 > 1, v12 + 1, 1);
          uint64_t v3 = v17;
        }
        uint64_t v15 = type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for IDSEndpoint);
        unint64_t v16 = &protocol witness table for IDSEndpoint;
        *(void *)&long long v14 = v13;
        *(void *)(v3 + 16) = v12 + 1;
        outlined init with take of Endpoint(&v14, v3 + 40 * v12 + 32);
        ++v9;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned IDSIDStatus) -> ()(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t protocol witness for EndpointQueryController.currentRemoteDevice(for:service:queue:) in conformance IDSIDQueryController(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v12 = *v5;
  id v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  void *v13 = v6;
  v13[1] = protocol witness for EndpointQueryController.currentRemoteDevice(for:service:queue:) in conformance IDSIDQueryController;
  v13[7] = a5;
  v13[8] = v12;
  void v13[5] = a3;
  v13[6] = a4;
  v13[3] = a1;
  v13[4] = a2;
  return MEMORY[0x1F4188298](IDSIDQueryController.currentRemoteDevice(for:service:queue:), 0, 0);
}

void protocol witness for Endpoint.applicationPublicDeviceKey.getter in conformance IDSEndpoint()
{
}

uint64_t closure #1 in static Data.== infix(_:_:)@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      outlined copy of Data._Representation(a2, a3);
      uint64_t v10 = (char *)__DataStorage._bytes.getter();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = __DataStorage._offset.getter();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = __DataStorage._length.getter();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x19BEA217CLL);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = outlined consume of Data._Representation(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)__DataStorage._bytes.getter();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = __DataStorage._offset.getter();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = __DataStorage._length.getter();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  Hasher.init(_seed:)();
  type metadata accessor for CFStringRef(0);
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, type metadata accessor for CFStringRef);
  _CFObject.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

{
  Swift::Int v2;
  uint64_t vars8;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;
  uint64_t vars8;

  Swift::Int v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(void *a1)
{
  Hasher.init(_seed:)();
  if (a1)
  {
    Hasher._combine(_:)(1u);
    type metadata accessor for CFStringRef(0);
    lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, type metadata accessor for CFStringRef);
    id v2 = a1;
    _CFObject.hash(into:)();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  Swift::Int v3 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)((uint64_t)a1, v3);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        size_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for CFStringRef(0);
    unint64_t v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, type metadata accessor for CFStringRef);
    id v7 = v6;
    char v8 = static _CFObject.== infix(_:_:)();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v11 = static _CFObject.== infix(_:_:)();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;
  void *v9;
  id v10;
  char v11;

  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  uint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    unint64_t v6 = v2;
    char v8 = ~v4;
    do
    {
      uint64_t v9 = *(void **)(*(void *)(v6 + 48) + 8 * v5);
      if (v9)
      {
        if (a1)
        {
          type metadata accessor for CFStringRef(0);
          lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, type metadata accessor for CFStringRef);
          id v10 = v9;
          char v11 = static _CFObject.== infix(_:_:)();

          if (v11) {
            return v5;
          }
        }
      }
      else if (!a1)
      {
        return v5;
      }
      uint64_t v5 = (v5 + 1) & v8;
    }
    while (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  uint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    unint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    char v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      uint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          size_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v15 = v14;
          if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16) {
            break;
          }
          uint64_t v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            uint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  unsigned char v9[40];

  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  uint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    unint64_t v6 = ~v3;
    do
    {
      outlined init with copy of AnyHashable(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      id v7 = MEMORY[0x19F390A70](v9, a1);
      outlined destroy of AnyHashable((uint64_t)v9);
      if (v7) {
        break;
      }
      uint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t specialized Sequence.compactMap<A>(_:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v49 = a5;
  uint64_t v50 = a6;
  uint64_t v47 = a3;
  uint64_t v48 = a4;
  os_log_t v46 = a2;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for P256.Signing.PublicKey?);
  MEMORY[0x1F4188790](v9 - 8);
  char v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for P256.Signing.PublicKey();
  uint64_t v13 = MEMORY[0x1F4188790](v12);
  unint64_t v44 = (char *)v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  uint64_t v16 = MEMORY[0x1F4188790](v15);
  uint64_t v18 = (char *)v37 - v17;
  MEMORY[0x1F4188790](v16);
  uint64_t v39 = (char *)v37 - v21;
  uint64_t v22 = *(void *)(a1 + 16);
  if (!v22) {
    return MEMORY[0x1E4FBC860];
  }
  uint64_t v45 = v20;
  int v23 = (void *)(a1 + 32);
  char v24 = (void (**)(char *, char *, uint64_t))(v19 + 32);
  uint64_t v41 = (void (**)(char *, void, uint64_t, uint64_t))(v19 + 56);
  uint64_t v42 = (void (**)(uint64_t, uint64_t))(v19 + 8);
  v37[1] = a1;
  uint64_t v38 = v19;
  uint64_t v40 = (unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
  swift_bridgeObjectRetain();
  unint64_t v51 = MEMORY[0x1E4FBC860];
  unint64_t v43 = v18;
  uint64_t v25 = v45;
  do
  {
    uint64_t v52 = v22;
    uint64_t v26 = v23[3];
    uint64_t v27 = v23[4];
    __swift_project_boxed_opaque_existential_1(v23, v26);
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v27);
    if (v7)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v51;
    }
    char v28 = v43;
    uint64_t v29 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((*MEMORY[0x1E4FBC8C8] & *v46)
                                                                                         + 0xD0))(v43, v25, v47, v48, v49, v50);
    uint64_t v7 = 0;
    outlined consume of Data._Representation(v29, v30);
    (*v42)(v25, v12);
    uint64_t v31 = *v24;
    (*v24)(v11, v28, v12);
    (*v41)(v11, 0, 1, v12);
    if ((*v40)(v11, 1, v12) == 1)
    {
      outlined destroy of SymmetricKey??((uint64_t)v11, &demangling cache variable for type metadata for P256.Signing.PublicKey?);
    }
    else
    {
      uint64_t v32 = v39;
      v31(v39, v11, v12);
      v31(v44, v32, v12);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v51 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v51 + 16) + 1, 1, v51);
      }
      unint64_t v34 = *(void *)(v51 + 16);
      unint64_t v33 = *(void *)(v51 + 24);
      if (v34 >= v33 >> 1) {
        unint64_t v51 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v33 > 1, v34 + 1, 1, v51);
      }
      unint64_t v35 = v51;
      *(void *)(v51 + 16) = v34 + 1;
      v31((char *)(v35+ ((*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80))+ *(void *)(v38 + 72) * v34), v44, v12);
    }
    v23 += 5;
    uint64_t v22 = v52 - 1;
  }
  while (v52 != 1);
  swift_bridgeObjectRelease();
  return v51;
}

void specialized KeyQueryController.init(service:targetQueue:queryController:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v21 = a3;
  uint64_t v22 = a4;
  uint64_t v20 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v7 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for OS_dispatch_queue.Attributes();
  MEMORY[0x1F4188790](v10);
  uint64_t v11 = type metadata accessor for DispatchQoS();
  MEMORY[0x1F4188790](v11 - 8);
  *(_OWORD *)&v4[OBJC_IVAR___SLKeyQueryController____lazy_storage___pushTokenForSelf] = xmmword_19BED15C0;
  *(void *)&v4[OBJC_IVAR___SLKeyQueryController____lazy_storage___localAccountHandles] = 1;
  uint64_t v12 = &v4[OBJC_IVAR___SLKeyQueryController_service];
  *(void *)uint64_t v12 = a1;
  *((void *)v12 + 1) = a2;
  id v13 = objc_allocWithZone(MEMORY[0x1E4F6AB90]);
  uint64_t v14 = v4;
  swift_bridgeObjectRetain();
  uint64_t v15 = (void *)MEMORY[0x19F3906A0](a1, a2);
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v13, sel_initWithService_, v15);

  if (v16)
  {
    *(void *)&v14[OBJC_IVAR___SLKeyQueryController_idsService] = v16;
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for OS_dispatch_queue);
    id v17 = v21;
    static DispatchQoS.unspecified.getter();
    uint64_t v24 = MEMORY[0x1E4FBC860];
    lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, MEMORY[0x1E4FBCC10]);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
    lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E4FBCC58], v20);
    *(void *)&v14[OBJC_IVAR___SLKeyQueryController_queue] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
    uint64_t v18 = v22;
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v22, (uint64_t)&v14[OBJC_IVAR___SLKeyQueryController_queryController]);

    Controller = (objc_class *)type metadata accessor for KeyQueryController();
    v23.receiver = v14;
    v23.super_class = Controller;
    objc_msgSendSuper2(&v23, sel_init);
    __swift_destroy_boxed_opaque_existential_0(v18);
  }
  else
  {
    __break(1u);
  }
}

uint64_t specialized Array.replaceSubrange<A>(_:with:)(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v4 = *(void **)v2;
  int64_t v5 = *(void *)(*(void *)v2 + 16);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Endpoint);
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_20;
  }
  uint64_t v13 = v4[2];
  BOOL v14 = __OFSUB__(v13, a2);
  uint64_t v15 = v13 - a2;
  if (v14) {
    goto LABEL_26;
  }
  if ((v15 & 0x8000000000000000) == 0)
  {
    id v16 = (char *)&v4[5 * a2 + 4];
    if (a1 != a2 || &v4[5 * a1 + 4] >= (void *)&v16[40 * v15]) {
      uint64_t result = (uint64_t)memmove(&v4[5 * a1 + 4], v16, 40 * v15);
    }
    uint64_t v17 = v4[2];
    BOOL v14 = __OFADD__(v17, v8);
    uint64_t v18 = v17 - v7;
    if (!v14)
    {
      v4[2] = v18;
LABEL_20:
      *(void *)uint64_t v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type KeyQueryController.DiversificationErrors and conformance KeyQueryController.DiversificationErrors()
{
  unint64_t result = lazy protocol witness table cache variable for type KeyQueryController.DiversificationErrors and conformance KeyQueryController.DiversificationErrors;
  if (!lazy protocol witness table cache variable for type KeyQueryController.DiversificationErrors and conformance KeyQueryController.DiversificationErrors)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type KeyQueryController.DiversificationErrors and conformance KeyQueryController.DiversificationErrors);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type KeyQueryController.DiversificationErrors and conformance KeyQueryController.DiversificationErrors;
  if (!lazy protocol witness table cache variable for type KeyQueryController.DiversificationErrors and conformance KeyQueryController.DiversificationErrors)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type KeyQueryController.DiversificationErrors and conformance KeyQueryController.DiversificationErrors);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t outlined init with copy of P256.Signing.PublicKey?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for P256.Signing.PublicKey?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for KeyQueryController()
{
  return self;
}

void partial apply for closure #1 in IDSIDQueryController.currentRemoteDevice(for:service:queue:)(uint64_t a1)
{
  closure #1 in IDSIDQueryController.currentRemoteDevice(for:service:queue:)(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void **)(v1 + 56));
}

uint64_t sub_19BEA3494@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x80))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_19BEA34F0(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, unint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x88);
  outlined copy of Data._Representation(*a1, v3);
  return v4(v2, v3);
}

uint64_t sub_19BEA356C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x98))();
  *a2 = result;
  return result;
}

uint64_t sub_19BEA35C8(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0xA0);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t dispatch thunk of Endpoint.applicationPublicDeviceKey.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of EndpointQueryController.currentRemoteDevice(for:service:queue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a7 + 8)
                                                                                              + **(int **)(a7 + 8));
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  void *v15 = v7;
  v15[1] = dispatch thunk of EndpointQueryController.currentRemoteDevice(for:service:queue:);
  return v17(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t dispatch thunk of EndpointQueryController.currentRemoteDevice(for:service:queue:)(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t method lookup function for KeyQueryController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for KeyQueryController);
}

uint64_t dispatch thunk of KeyQueryController.pushTokenForSelf.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of KeyQueryController.pushTokenForSelf.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of KeyQueryController.pushTokenForSelf.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of KeyQueryController.localAccountHandles.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of KeyQueryController.localAccountHandles.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of KeyQueryController.localAccountHandles.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of KeyQueryController.__allocating_init(service:targetQueue:queryController:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of KeyQueryController.publicKeysAndTPS(for:documentIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = *(int **)((*MEMORY[0x1E4FBC8C8] & *v4) + 0xB8);
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)v10 + *v10);
  int64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *int64_t v11 = v5;
  v11[1] = dispatch thunk of KeyQueryController.publicKeysAndTPS(for:documentIdentifier:);
  return v13(a1, a2, a3, a4);
}

uint64_t dispatch thunk of KeyQueryController.publicKeysAndTPS(for:documentIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *v3;
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 8);
  return v7(a1, a2, a3);
}

uint64_t dispatch thunk of KeyQueryController.validateKeyType(_:isPublicKey:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of KeyQueryController.diversify(publicKey:tps:docId:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of KeyQueryController.diversifyKey(_:trackingPreventionSalt:documentIdentifier:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of KeyQueryController.signData(data:documentIdentifier:trackingPreventionSalt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v12 = *(int **)((*MEMORY[0x1E4FBC8C8] & *v5) + 0xD8);
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v12 + *v12);
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  void *v13 = v6;
  v13[1] = dispatch thunk of KeyQueryController.signData(data:documentIdentifier:trackingPreventionSalt:);
  return v15(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of KeyQueryController.localPublicKey()(uint64_t a1)
{
  uint64_t v4 = *(int **)((*MEMORY[0x1E4FBC8C8] & *v1) + 0xE0);
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = dispatch thunk of KeyQueryController.localPublicKey();
  return v7(a1);
}

uint64_t dispatch thunk of KeyQueryController.localPublicKey()()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t dispatch thunk of KeyQueryController.localPublicKey(using:trackingPreventionSalt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v12 = *(int **)((*MEMORY[0x1E4FBC8C8] & *v5) + 0xE8);
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v12 + *v12);
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  void *v13 = v6;
  v13[1] = dispatch thunk of KeyQueryController.localPublicKey(using:trackingPreventionSalt:);
  return v15(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of KeyQueryController.localPublicKey(using:trackingPreventionSalt:)(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

unsigned char *storeEnumTagSinglePayload for KeyQueryController.DiversificationErrors(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x19BEA4348);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for KeyQueryController.DiversificationErrors()
{
  return &type metadata for KeyQueryController.DiversificationErrors;
}

uint64_t sub_19BEA4380()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[Endpoint], Never>);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (((((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, v7 + 8, v5);
}

void partial apply for closure #1 in closure #1 in IDSIDQueryController.currentRemoteDevice(for:service:queue:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[Endpoint], Never>)
                 - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void **)(v1 + v5);
  uint64_t v9 = *(void *)(v1 + v6);
  uint64_t v10 = *(void *)(v1 + v6 + 8);
  uint64_t v11 = *(void *)(v1 + v7);
  uint64_t v12 = *(void *)(v1 + v7 + 8);
  uint64_t v13 = *(void *)(v1 + ((v7 + 23) & 0xFFFFFFFFFFFFFFF8));
  closure #1 in closure #1 in IDSIDQueryController.currentRemoteDevice(for:service:queue:)(a1, v1 + v4, v8, v9, v10, v11, v12, v13);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_19BEA4554()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[Endpoint], Never>);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t partial apply for closure #1 in closure #1 in closure #1 in IDSIDQueryController.currentRemoteDevice(for:service:queue:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[Endpoint], Never>);
  uint64_t v3 = v1[2];
  unint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  unint64_t v6 = v1[5];
  return closure #1 in closure #1 in closure #1 in IDSIDQueryController.currentRemoteDevice(for:service:queue:)(a1, v3, v4, v5, v6);
}

uint64_t outlined destroy of AnyHashable(uint64_t a1)
{
  return a1;
}

uint64_t outlined init with take of Endpoint(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t outlined init with copy of AnyHashable(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A];
  if (!lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A]);
  }
  return result;
}

uint64_t outlined consume of Set<IDSAccount>.Iterator._Variant()
{
  return swift_release();
}

uint64_t HeaderFallback.init(title:subtitle:image:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

uint64_t HeaderFallback.title.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HeaderFallback.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *long long v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*HeaderFallback.title.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t HeaderFallback.subtitle.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HeaderFallback.subtitle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*HeaderFallback.subtitle.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

void *HeaderFallback.image.getter()
{
  uint64_t v1 = *(void **)(v0 + 32);
  id v2 = v1;
  return v1;
}

void HeaderFallback.image.setter(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
}

uint64_t (*HeaderFallback.image.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t HeaderFallback.imageView.getter()
{
  uint64_t v1 = *(void **)(v0 + 32);
  id v2 = (id)HeaderFallback.isComplete.getter();
  if ((v2 & 1) == 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (!v1)
  {
LABEL_7:
    __break(1u);
    return MEMORY[0x1F40FC530](v2);
  }
  id v2 = v1;
  return MEMORY[0x1F40FC530](v2);
}

BOOL HeaderFallback.isComplete.getter()
{
  if (!v0[4]) {
    return 0;
  }
  unint64_t v1 = v0[1];
  if (!((v1 & 0x2000000000000000) != 0 ? HIBYTE(v1) & 0xF : *v0 & 0xFFFFFFFFFFFFLL)) {
    return 0;
  }
  unint64_t v3 = v0[3];
  uint64_t v4 = v0[2] & 0xFFFFFFFFFFFFLL;
  if ((v3 & 0x2000000000000000) != 0) {
    uint64_t v4 = HIBYTE(v3) & 0xF;
  }
  return v4 != 0;
}

id CollaborationAttributionViewRepresentable.highlight.getter()
{
  return *v0;
}

uint64_t CollaborationAttributionViewRepresentable.fallback.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[2];
  uint64_t v3 = v1[3];
  uint64_t v4 = v1[4];
  uint64_t v5 = (void *)v1[5];
  *a1 = v1[1];
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  a1[4] = v5;
  id v6 = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

__n128 CollaborationAttributionViewRepresentable.init(highlight:fallback:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __n128 result = *(__n128 *)a2;
  long long v4 = *(_OWORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)a3 = a1;
  *(__n128 *)(a3 + 8) = result;
  *(_OWORD *)(a3 + 24) = v4;
  *(void *)(a3 + 40) = v5;
  return result;
}

void *CollaborationAttributionViewRepresentable.makeUIView(context:)()
{
  unint64_t v1 = *(void **)v0;
  uint64_t v2 = *(void **)(v0 + 40);
  id v3 = objc_allocWithZone((Class)type metadata accessor for CollaborationAttributionView());
  id v4 = v1;
  uint64_t v5 = specialized CollaborationAttributionView.init(highlight:variant:)(v4, 0);

  LODWORD(v6) = 1132068864;
  objc_msgSend(v5, sel_setContentCompressionResistancePriority_forAxis_, 0, v6);
  objc_msgSend(v5, sel_setRemoteRenderingEnabled_, 1);
  (*(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v5) + 0x108))(1);
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  __swift_project_value_buffer(v7, (uint64_t)static Log.default);
  id v8 = v2;
  id v9 = v4;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v10 = v8;
  id v11 = v9;
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v23 = v22;
    *(_DWORD *)uint64_t v14 = 136315138;
    id v15 = objc_msgSend(v11, sel_attributions);
    unint64_t v16 = type metadata accessor for SLAttribution();
    uint64_t v17 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v18 = MEMORY[0x19F390850](v17, v16);
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v18, v20, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_19BE17000, v12, v13, "LTP: makeUIView called with highlight: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F392080](v22, -1, -1);
    MEMORY[0x19F392080](v14, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  return v5;
}

uint64_t CollaborationAttributionViewRepresentable.updateUIView(_:context:)(void *a1)
{
  uint64_t v2 = *v1;
  id v3 = *(uint64_t (**)(void *))((*MEMORY[0x1E4FBC8C8] & *a1) + 0xC0);
  id v4 = v2;
  return v3(v2);
}

uint64_t protocol witness for UIViewRepresentable.updateUIView(_:context:) in conformance CollaborationAttributionViewRepresentable(void *a1)
{
  uint64_t v2 = *v1;
  id v3 = *(uint64_t (**)(void *))((*MEMORY[0x1E4FBC8C8] & *a1) + 0xC0);
  id v4 = v2;
  return v3(v2);
}

uint64_t protocol witness for UIViewRepresentable._resetUIView(_:coordinator:destroy:) in conformance CollaborationAttributionViewRepresentable()
{
  return MEMORY[0x1F40F9E50]();
}

uint64_t protocol witness for static UIViewRepresentable.dismantleUIView(_:coordinator:) in conformance CollaborationAttributionViewRepresentable()
{
  return MEMORY[0x1F40F9E60]();
}

uint64_t protocol witness for UIViewRepresentable.makeCoordinator() in conformance CollaborationAttributionViewRepresentable()
{
  return MEMORY[0x1F40F9F00]();
}

uint64_t protocol witness for UIViewRepresentable._identifiedViewTree(in:) in conformance CollaborationAttributionViewRepresentable()
{
  return MEMORY[0x1F40F9E98]();
}

uint64_t protocol witness for UIViewRepresentable.sizeThatFits(_:uiView:context:) in conformance CollaborationAttributionViewRepresentable()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t protocol witness for UIViewRepresentable._overrideSizeThatFits(_:in:uiView:) in conformance CollaborationAttributionViewRepresentable()
{
  return MEMORY[0x1F40F9EC0]();
}

uint64_t protocol witness for UIViewRepresentable._overrideLayoutTraits(_:for:) in conformance CollaborationAttributionViewRepresentable()
{
  return MEMORY[0x1F40F9EB0]();
}

uint64_t protocol witness for static UIViewRepresentable._modifyBridgedViewInputs(_:) in conformance CollaborationAttributionViewRepresentable()
{
  return MEMORY[0x1F40F9ED0]();
}

uint64_t protocol witness for static UIViewRepresentable._layoutOptions(_:) in conformance CollaborationAttributionViewRepresentable()
{
  return MEMORY[0x1F40F9E90]();
}

uint64_t protocol witness for static View._makeView(view:inputs:) in conformance CollaborationAttributionViewRepresentable(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = lazy protocol witness table accessor for type CollaborationAttributionViewRepresentable and conformance CollaborationAttributionViewRepresentable();
  return MEMORY[0x1F40F9EF0](a1, a2, a3, v6);
}

uint64_t protocol witness for static View._makeViewList(view:inputs:) in conformance CollaborationAttributionViewRepresentable(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = lazy protocol witness table accessor for type CollaborationAttributionViewRepresentable and conformance CollaborationAttributionViewRepresentable();
  return MEMORY[0x1F40F9E78](a1, a2, a3, v6);
}

uint64_t protocol witness for static View._viewListCount(inputs:) in conformance CollaborationAttributionViewRepresentable()
{
  return static View._viewListCount(inputs:)();
}

void protocol witness for View.body.getter in conformance CollaborationAttributionViewRepresentable()
{
}

unint64_t lazy protocol witness table accessor for type CollaborationAttributionViewRepresentable and conformance CollaborationAttributionViewRepresentable()
{
  unint64_t result = lazy protocol witness table cache variable for type CollaborationAttributionViewRepresentable and conformance CollaborationAttributionViewRepresentable;
  if (!lazy protocol witness table cache variable for type CollaborationAttributionViewRepresentable and conformance CollaborationAttributionViewRepresentable)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CollaborationAttributionViewRepresentable and conformance CollaborationAttributionViewRepresentable);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CollaborationAttributionViewRepresentable and conformance CollaborationAttributionViewRepresentable;
  if (!lazy protocol witness table cache variable for type CollaborationAttributionViewRepresentable and conformance CollaborationAttributionViewRepresentable)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CollaborationAttributionViewRepresentable and conformance CollaborationAttributionViewRepresentable);
  }
  return result;
}

uint64_t associated type witness table accessor for View.Body : View in CollaborationAttributionViewRepresentable()
{
  return MEMORY[0x1E4F3F158];
}

void destroy for HeaderFallback(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 32);
}

void *initializeWithCopy for HeaderFallback(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = (void *)a2[4];
  a1[4] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v6 = v5;
  return a1;
}

void *assignWithCopy for HeaderFallback(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = (void *)a2[4];
  a1[4] = v5;
  id v6 = v5;

  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for HeaderFallback(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for HeaderFallback(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HeaderFallback(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HeaderFallback()
{
  return &type metadata for HeaderFallback;
}

void destroy for CollaborationAttributionViewRepresentable(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v2 = *(void **)(a1 + 40);
}

void *initializeWithCopy for CollaborationAttributionViewRepresentable(void *a1, uint64_t a2)
{
  long long v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v5;
  id v6 = *(void **)(a2 + 40);
  a1[4] = *(void *)(a2 + 32);
  a1[5] = v6;
  id v7 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v8 = v6;
  return a1;
}

uint64_t assignWithCopy for CollaborationAttributionViewRepresentable(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v7 = *(void **)(a1 + 40);
  id v8 = *(void **)(a2 + 40);
  *(void *)(a1 + 40) = v8;
  id v9 = v8;

  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CollaborationAttributionViewRepresentable(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  id v6 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);

  return a1;
}

uint64_t getEnumTagSinglePayload for CollaborationAttributionViewRepresentable(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CollaborationAttributionViewRepresentable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CollaborationAttributionViewRepresentable()
{
  return &type metadata for CollaborationAttributionViewRepresentable;
}

uint64_t Log.default.unsafeMutableAddressor()
{
  return Log.default.unsafeMutableAddressor(&one-time initialization token for default, (uint64_t)static Log.default);
}

uint64_t >> prefix<A>(_:)(uint64_t a1, uint64_t a2)
{
  v4[2] = a2;
  type metadata accessor for Optional();
  _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in >> prefix<A>(_:), (uint64_t)v4, MEMORY[0x1E4FBC248], MEMORY[0x1E4FBB1A0], v2, (uint64_t)v5);
  if (v5[1]) {
    return v5[0];
  }
  else {
    return 7104878;
  }
}

uint64_t Log.collaborationRenderer.unsafeMutableAddressor()
{
  return Log.default.unsafeMutableAddressor(&one-time initialization token for collaborationRenderer, (uint64_t)static Log.collaborationRenderer);
}

uint64_t Log.ProcessVerifier.unsafeMutableAddressor()
{
  return Log.default.unsafeMutableAddressor(&one-time initialization token for ProcessVerifier, (uint64_t)static Log.ProcessVerifier);
}

uint64_t Log.keyController.unsafeMutableAddressor()
{
  return Log.default.unsafeMutableAddressor(&one-time initialization token for keyController, (uint64_t)static Log.keyController);
}

BOOL Subsystem.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of Subsystem.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  return v3 != 0;
}

unint64_t Subsystem.rawValue.getter()
{
  return 0xD00000000000001ELL;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Subsystem()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance Subsystem()
{
  return String.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Subsystem()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance Subsystem@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of protocol witness for RawRepresentable.init(rawValue:) in conformance Subsystem, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance Subsystem(void *a1@<X8>)
{
  *a1 = 0xD00000000000001ELL;
  a1[1] = 0x800000019BED9710;
}

uint64_t one-time initialization function for keyController()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.keyController);
  __swift_project_value_buffer(v0, (uint64_t)static Log.keyController);
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.init<A>(subsystem:category:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 8))(a1, a4);
}

uint64_t static Log.keyController.getter@<X0>(uint64_t a1@<X8>)
{
  return static Log.keyController.getter(&one-time initialization token for keyController, (uint64_t)static Log.keyController, a1);
}

uint64_t one-time initialization function for personIdentityGenerator()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.personIdentityGenerator);
  __swift_project_value_buffer(v0, (uint64_t)static Log.personIdentityGenerator);
  return Logger.init(subsystem:category:)();
}

uint64_t Log.personIdentityGenerator.unsafeMutableAddressor()
{
  return Log.default.unsafeMutableAddressor(&one-time initialization token for personIdentityGenerator, (uint64_t)static Log.personIdentityGenerator);
}

uint64_t Log.default.unsafeMutableAddressor(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Log.personIdentityGenerator.getter@<X0>(uint64_t a1@<X8>)
{
  return static Log.keyController.getter(&one-time initialization token for personIdentityGenerator, (uint64_t)static Log.personIdentityGenerator, a1);
}

uint64_t one-time initialization function for ProcessVerifier()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.ProcessVerifier);
  __swift_project_value_buffer(v0, (uint64_t)static Log.ProcessVerifier);
  return Logger.init(subsystem:category:)();
}

uint64_t static Log.ProcessVerifier.getter@<X0>(uint64_t a1@<X8>)
{
  return static Log.keyController.getter(&one-time initialization token for ProcessVerifier, (uint64_t)static Log.ProcessVerifier, a1);
}

uint64_t one-time initialization function for default()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.default);
  __swift_project_value_buffer(v0, (uint64_t)static Log.default);
  return Logger.init(subsystem:category:)();
}

uint64_t static Log.default.getter@<X0>(uint64_t a1@<X8>)
{
  return static Log.keyController.getter(&one-time initialization token for default, (uint64_t)static Log.default, a1);
}

uint64_t one-time initialization function for collaborationRenderer()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.collaborationRenderer);
  __swift_project_value_buffer(v0, (uint64_t)static Log.collaborationRenderer);
  return Logger.init(subsystem:category:)();
}

uint64_t static Log.collaborationRenderer.getter@<X0>(uint64_t a1@<X8>)
{
  return static Log.keyController.getter(&one-time initialization token for collaborationRenderer, (uint64_t)static Log.collaborationRenderer, a1);
}

uint64_t static Log.keyController.getter@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  id v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t partial apply for closure #1 in >> prefix<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return closure #1 in >> prefix<A>(_:)(a1, a2);
}

uint64_t _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v25 = a5;
  uint64_t v26 = a2;
  uint64_t v28 = a4;
  uint64_t v27 = a1;
  uint64_t v24 = *(void *)(a3 - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v13 + 16);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v10);
  uint64_t v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  unint64_t v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v6);
  uint64_t v22 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v20, 1, v14) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
    v27(v18, v12);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    if (v7) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v24 + 32))(v25, v12, a3);
    }
    uint64_t v22 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(a6, v22, 1);
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)(uint64_t a1, uint64_t a2)
{
  v7[2] = a2;
  type metadata accessor for Optional();
  _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in DefaultStringInterpolation.appendInterpolation<A>(_:), (uint64_t)v7, MEMORY[0x1E4FBC248], MEMORY[0x1E4FBB1A0], v2, (uint64_t)&v8);
  if (v9) {
    uint64_t v3 = v8;
  }
  else {
    uint64_t v3 = 7104878;
  }
  if (v9) {
    unint64_t v4 = v9;
  }
  else {
    unint64_t v4 = 0xE300000000000000;
  }
  unint64_t v5 = v4;
  String.append(_:)(*(Swift::String *)&v3);
  return swift_bridgeObjectRelease();
}

uint64_t closure #1 in >> prefix<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  MEMORY[0x1F4188790](a1);
  (*(void (**)(char *))(v4 + 16))((char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t result = String.init<A>(reflecting:)();
  *a2 = result;
  a2[1] = v6;
  return result;
}

unint64_t lazy protocol witness table accessor for type Subsystem and conformance Subsystem()
{
  unint64_t result = lazy protocol witness table cache variable for type Subsystem and conformance Subsystem;
  if (!lazy protocol witness table cache variable for type Subsystem and conformance Subsystem)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Subsystem and conformance Subsystem);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for Subsystem(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x19BEA6244);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Subsystem()
{
  return &type metadata for Subsystem;
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t partial apply for closure #1 in DefaultStringInterpolation.appendInterpolation<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return partial apply for closure #1 in >> prefix<A>(_:)(a1, a2);
}

uint64_t specialized Data.init<A>(_:)(uint64_t a1, unint64_t a2)
{
  v28[5] = *MEMORY[0x1E4F143B8];
  v28[3] = MEMORY[0x1E4F277C0];
  v28[4] = MEMORY[0x1E4F277B0];
  v28[0] = a1;
  v28[1] = a2;
  unsigned int v4 = __swift_project_boxed_opaque_existential_1(v28, MEMORY[0x1E4F277C0]);
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  switch(v6 >> 62)
  {
    case 1uLL:
      if (v5 >> 32 < (int)v5)
      {
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
      outlined copy of Data._Representation(a1, a2);
      outlined copy of Data._Representation(v5, v6);
      uint64_t v8 = (unsigned char *)__DataStorage._bytes.getter();
      if (v8)
      {
        uint64_t v9 = __DataStorage._offset.getter();
        if (!__OFSUB__((int)v5, v9))
        {
          v8 += (int)v5 - v9;
          goto LABEL_7;
        }
LABEL_31:
        __break(1u);
      }
LABEL_7:
      uint64_t v10 = __DataStorage._length.getter();
      if (v10 >= (v5 >> 32) - (int)v5) {
        uint64_t v11 = (v5 >> 32) - (int)v5;
      }
      else {
        uint64_t v11 = v10;
      }
      uint64_t v12 = &v8[v11];
      if (v8) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = 0;
      }
      closure #1 in Data.init<A>(_:)(v8, v13, &v27);
      outlined consume of Data._Representation(v5, v6);
LABEL_27:
      outlined consume of Data._Representation(a1, a2);
      uint64_t v24 = v27;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v28);
      return v24;
    case 2uLL:
      uint64_t v14 = *(void *)(v5 + 16);
      uint64_t v15 = *(void *)(v5 + 24);
      outlined copy of Data._Representation(a1, a2);
      swift_retain();
      swift_retain();
      uint64_t v16 = (unsigned char *)__DataStorage._bytes.getter();
      if (!v16) {
        goto LABEL_17;
      }
      uint64_t v17 = __DataStorage._offset.getter();
      if (__OFSUB__(v14, v17)) {
        goto LABEL_30;
      }
      v16 += v14 - v17;
LABEL_17:
      BOOL v18 = __OFSUB__(v15, v14);
      uint64_t v19 = v15 - v14;
      if (v18) {
        goto LABEL_29;
      }
      uint64_t v20 = __DataStorage._length.getter();
      if (v20 >= v19) {
        uint64_t v21 = v19;
      }
      else {
        uint64_t v21 = v20;
      }
      uint64_t v22 = &v16[v21];
      if (v16) {
        uint64_t v23 = v22;
      }
      else {
        uint64_t v23 = 0;
      }
      closure #1 in Data.init<A>(_:)(v16, v23, &v27);
      swift_release();
      swift_release();
      goto LABEL_27;
    case 3uLL:
      memset(v26, 0, 14);
      outlined copy of Data._Representation(a1, a2);
      uint64_t v7 = v26;
      goto LABEL_26;
    default:
      v26[0] = *v4;
      LOWORD(v26[1]) = v6;
      BYTE2(v26[1]) = BYTE2(v6);
      BYTE3(v26[1]) = BYTE3(v6);
      BYTE4(v26[1]) = BYTE4(v6);
      BYTE5(v26[1]) = BYTE5(v6);
      outlined copy of Data._Representation(a1, a2);
      uint64_t v7 = (char *)v26 + BYTE6(v6);
LABEL_26:
      closure #1 in Data.init<A>(_:)(v26, v7, &v27);
      goto LABEL_27;
  }
}

uint64_t specialized Data.init<A>(_:)(unint64_t a1, unint64_t a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousBytes);
  if (swift_dynamicCast())
  {
    outlined init with take of Endpoint(v38, (uint64_t)&v41);
    __swift_project_boxed_opaque_existential_1(&v41, v43);
    dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  outlined destroy of SymmetricKey??((uint64_t)v38, &demangling cache variable for type metadata for ContiguousBytes?);
  unint64_t v2 = a1;
  unint64_t v3 = a2;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = a1;
      uint64_t v42 = a2 & 0xFFFFFFFFFFFFFFLL;
      unint64_t v6 = (char *)&v41 + (HIBYTE(a2) & 0xF);
      uint64_t v7 = &v41;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v4 = _StringObject.sharedUTF8.getter();
      }
      if (v4) {
        unint64_t v6 = (unsigned char *)(v4 + v5);
      }
      else {
        unint64_t v6 = 0;
      }
      uint64_t v7 = (uint64_t *)v4;
    }
    uint64_t v8 = specialized Data._Representation.init(_:)(v7, v6);
    unint64_t v10 = v9;
    if (v9 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(void *)&v38[0] = v8;
      *((void *)&v38[0] + 1) = v10;
      return *(void *)&v38[0];
    }
    unint64_t v2 = a1;
    unint64_t v3 = a2;
    if ((a2 & 0x1000000000000000) == 0) {
      goto LABEL_14;
    }
LABEL_70:
    Swift::Int v11 = String.UTF8View._foreignCount()();
    goto LABEL_17;
  }
LABEL_69:
  uint64_t v8 = 0;
  unint64_t v10 = 0xF000000000000000;
  if ((v3 & 0x1000000000000000) != 0) {
    goto LABEL_70;
  }
LABEL_14:
  if ((v3 & 0x2000000000000000) != 0) {
    Swift::Int v11 = HIBYTE(v3) & 0xF;
  }
  else {
    Swift::Int v11 = v2 & 0xFFFFFFFFFFFFLL;
  }
LABEL_17:
  *(void *)&v38[0] = specialized Data._Representation.init(count:)(v11);
  *((void *)&v38[0] + 1) = v12;
  MEMORY[0x1F4188790](*(void *)&v38[0]);
  unint64_t v13 = (unint64_t)specialized Data._Representation.withUnsafeMutableBytes<A>(_:)((void *(*)(uint64_t *__return_ptr, char *, char *))partial apply for specialized closure #3 in Data.init<A>(_:));
  uint64_t v16 = *((void *)&v38[0] + 1) >> 62;
  uint64_t v17 = v13;
  uint64_t v18 = v3;
  unint64_t v19 = v14;
  switch(*((void *)&v38[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v20) = DWORD1(v38[0]) - LODWORD(v38[0]);
      if (__OFSUB__(DWORD1(v38[0]), v38[0])) {
        goto LABEL_73;
      }
      uint64_t v20 = (int)v20;
LABEL_23:
      if (v15 != v20)
      {
        if (v16)
        {
          if (v16 == 1) {
            uint64_t v24 = *(uint64_t *)&v38[0] >> 32;
          }
          else {
            uint64_t v24 = *(void *)(*(void *)&v38[0] + 24);
          }
        }
        else
        {
          uint64_t v24 = BYTE14(v38[0]);
        }
LABEL_61:
        if (v24 < v15)
        {
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
        }
        Data._Representation.replaceSubrange(_:with:count:)();
LABEL_63:
        swift_bridgeObjectRelease();
        goto LABEL_64;
      }
LABEL_29:
      if ((v3 & 0x2000000000000000) != 0) {
        unint64_t v25 = HIBYTE(v3) & 0xF;
      }
      else {
        unint64_t v25 = v13 & 0xFFFFFFFFFFFFLL;
      }
      *(void *)((char *)&v40 + 7) = 0;
      *(void *)&long long v40 = 0;
      if (4 * v25 == v14 >> 14) {
        goto LABEL_58;
      }
      LOBYTE(v26) = 0;
      uint64_t v27 = (v13 >> 59) & 1;
      if ((v3 & 0x1000000000000000) == 0) {
        LOBYTE(v27) = 1;
      }
      uint64_t v28 = 4 << v27;
      uint64_t v35 = v3 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v33 = (uint64_t)v8;
      uint64_t v34 = (v3 & 0xFFFFFFFFFFFFFFFLL) + 32;
      break;
    case 2:
      uint64_t v22 = *(void *)(*(void *)&v38[0] + 16);
      uint64_t v21 = *(void *)(*(void *)&v38[0] + 24);
      BOOL v23 = __OFSUB__(v21, v22);
      uint64_t v20 = v21 - v22;
      if (!v23) {
        goto LABEL_23;
      }
      goto LABEL_74;
    case 3:
      if (!v15) {
        goto LABEL_29;
      }
      uint64_t v24 = 0;
      goto LABEL_61;
    default:
      uint64_t v20 = BYTE14(v38[0]);
      goto LABEL_23;
  }
  do
  {
    unint64_t v29 = v19 & 0xC;
    unint64_t v2 = v19;
    if (v29 == v28) {
      unint64_t v2 = _StringGuts._slowEnsureMatchingEncoding(_:)(v19, v17, v18);
    }
    unint64_t v30 = v2 >> 16;
    if (v2 >> 16 >= v25)
    {
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if ((v18 & 0x1000000000000000) != 0)
    {
      unint64_t v2 = String.UTF8View._foreignSubscript(position:)();
      char v31 = v2;
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else if ((v18 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = v17;
      uint64_t v42 = v35;
      char v31 = *((unsigned char *)&v41 + v30);
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else
    {
      unint64_t v2 = v34;
      if ((v17 & 0x1000000000000000) == 0) {
        unint64_t v2 = _StringObject.sharedUTF8.getter();
      }
      char v31 = *(unsigned char *)(v2 + v30);
      if (v29 != v28)
      {
LABEL_47:
        if ((v18 & 0x1000000000000000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_51;
      }
    }
    unint64_t v2 = _StringGuts._slowEnsureMatchingEncoding(_:)(v19, v17, v18);
    unint64_t v19 = v2;
    if ((v18 & 0x1000000000000000) == 0)
    {
LABEL_48:
      unint64_t v19 = (v19 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_53;
    }
LABEL_51:
    if (v25 <= v19 >> 16) {
      goto LABEL_68;
    }
    unint64_t v2 = String.UTF8View._foreignIndex(after:)();
    unint64_t v19 = v2;
LABEL_53:
    *((unsigned char *)&v40 + v26) = v31;
    unsigned int v26 = v26 + 1;
    if ((v26 >> 8)) {
      goto LABEL_67;
    }
    BYTE14(v40) = v26;
    if (v26 == 14)
    {
      uint64_t v41 = v40;
      LODWORD(v42) = DWORD2(v40);
      WORD2(v42) = WORD6(v40);
      Data._Representation.append(contentsOf:)();
      LOBYTE(v26) = 0;
      BYTE14(v40) = 0;
    }
  }
  while (4 * v25 != v19 >> 14);
  uint64_t v8 = (unsigned char *)v33;
  if ((_BYTE)v26)
  {
    uint64_t v41 = v40;
    LODWORD(v42) = DWORD2(v40);
    WORD2(v42) = WORD6(v40);
    Data._Representation.append(contentsOf:)();
    outlined consume of Data?(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  outlined consume of Data?((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

BOOL static PersonIdentityGenerator.GenerationErrors.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void PersonIdentityGenerator.GenerationErrors.hash(into:)(uint64_t a1, char a2)
{
}

Swift::Int PersonIdentityGenerator.GenerationErrors.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance PersonIdentityGenerator.GenerationErrors(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

id PersonIdentityGenerator.queue.getter()
{
  return *(id *)(v0 + OBJC_IVAR___SLPersonIdentityGenerator_queue);
}

id PersonIdentityGenerator.keyQueryController.getter()
{
  return *(id *)(v0 + OBJC_IVAR___SLPersonIdentityGenerator_keyQueryController);
}

void *PersonIdentityGenerator.SLIDSServiceNameGelato.unsafeMutableAddressor()
{
  return &static PersonIdentityGenerator.SLIDSServiceNameGelato;
}

unint64_t static PersonIdentityGenerator.SLIDSServiceNameGelato.getter()
{
  return 0xD00000000000001ELL;
}

id PersonIdentityGenerator.__allocating_init(queue:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return PersonIdentityGenerator.init(queue:)(a1);
}

id PersonIdentityGenerator.init(queue:)(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v3 = objc_allocWithZone((Class)type metadata accessor for KeyQueryController());
  uint64_t v4 = swift_getObjectType();
  uint64_t v5 = self;
  id v6 = a1;
  id result = objc_msgSend(v5, sel_sharedInstance);
  if (result)
  {
    id v8 = result;
    v13[3] = type metadata accessor for SLHighlight(0, (unint64_t *)&lazy cache variable for type metadata for IDSIDQueryController);
    v13[4] = &protocol witness table for IDSIDQueryController;
    v13[0] = v8;
    uint64_t v9 = (*(uint64_t (**)(unint64_t, unint64_t, id, void *))(v4 + 176))(0xD00000000000001ELL, 0x800000019BEDA6C0, v6, v13);
    swift_deallocPartialClassInstance();
    unint64_t v10 = (char *)objc_allocWithZone(ObjectType);
    *(void *)&v10[OBJC_IVAR___SLPersonIdentityGenerator_queue] = v6;
    *(void *)&v10[OBJC_IVAR___SLPersonIdentityGenerator_keyQueryController] = v9;
    v12.receiver = v10;
    v12.super_class = ObjectType;
    id v11 = objc_msgSendSuper2(&v12, sel_init);
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id PersonIdentityGenerator.__allocating_init(queue:keyQueryController:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (char *)objc_allocWithZone(v2);
  *(void *)&v5[OBJC_IVAR___SLPersonIdentityGenerator_queue] = a1;
  *(void *)&v5[OBJC_IVAR___SLPersonIdentityGenerator_keyQueryController] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id PersonIdentityGenerator.init(queue:keyQueryController:)(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v2[OBJC_IVAR___SLPersonIdentityGenerator_queue] = a1;
  *(void *)&v2[OBJC_IVAR___SLPersonIdentityGenerator_keyQueryController] = a2;
  v7.receiver = v2;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[23] = a3;
  v4[24] = v3;
  v4[21] = a1;
  v4[22] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for P256.Signing.PublicKey?);
  v4[25] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for P256.Signing.PublicKey();
  v4[26] = v5;
  v4[27] = *(void *)(v5 - 8);
  v4[28] = swift_task_alloc();
  v4[29] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for NodeIdentity(0);
  v4[30] = v6;
  v4[31] = *(void *)(v6 - 8);
  v4[32] = swift_task_alloc();
  v4[33] = swift_task_alloc();
  v4[34] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SHA256Digest?);
  v4[35] = swift_task_alloc();
  return MEMORY[0x1F4188298](PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:), 0, 0);
}

{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t (*v6)();
  uint64_t v8;

  uint64_t v5 = (void *)*v4;
  v5[42] = a1;
  v5[43] = a2;
  v5[44] = a3;
  v5[45] = v3;
  swift_task_dealloc();
  if (v3)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v6 = PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:);
  }
  else
  {
    uint64_t v6 = PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:);
  }
  return MEMORY[0x1F4188298](v6, 0, 0);
}

uint64_t PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:)()
{
  unint64_t v1 = (void *)v0[21];
  uint64_t v2 = v1[2];
  v0[36] = v2;
  if (v2)
  {
    v0[37] = MEMORY[0x1E4FBC868];
    v0[38] = 0;
    uint64_t v3 = v1[4];
    v0[39] = v3;
    uint64_t v4 = v1[5];
    v0[40] = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v5 = (void *)swift_task_alloc();
    v0[41] = v5;
    void *v5 = v0;
    v5[1] = PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:);
    uint64_t v6 = v0[23];
    uint64_t v7 = v0[22];
    return PersonIdentityGenerator.paddedPublicKeys(for:using:alignment:)(v3, v4, v7, v6, 32);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(uint64_t))v0[1];
    uint64_t v10 = MEMORY[0x1E4FBC868];
    return v9(v10);
  }
}

{
  void *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t inited;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  size_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  id v74;
  Class isa;
  Class v76;
  Class v77;
  id v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  char v90;
  uint64_t *v91;
  uint64_t v92;
  char v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t);
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  size_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  void (*v114)(uint64_t, uint64_t, uint64_t);
  uint64_t v115;
  uint64_t v116;
  void (*v117)(uint64_t, uint64_t, uint64_t);
  void *v118;
  uint64_t v119;

  unint64_t v1 = v0[42];
  if (!v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v28 = v0[37];
    goto LABEL_46;
  }
  uint64_t v3 = v0[43];
  uint64_t v2 = v0[44];
  swift_bridgeObjectRetain();
  outlined copy of Data._Representation(v3, v2);
  outlined consume of Data._Representation(v3, v2);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = MEMORY[0x1E4FBC860];
  v118 = v0;
  double v113 = v1;
  if (v4)
  {
    uint64_t v6 = v0 + 17;
    uint64_t v7 = v0[27];
    v0[17] = MEMORY[0x1E4FBC860];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4, 0);
    uint64_t v8 = v1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    double v114 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    double v116 = *(void *)(v7 + 72);
    do
    {
      uint64_t v9 = v0[32];
      uint64_t v10 = v0[29];
      uint64_t v11 = v0[27];
      objc_super v12 = v118[26];
      v114(v10, v8, v12);
      v114(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
      uint64_t v0 = v118;
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
      uint64_t v5 = v118[17];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v5 + 16) + 1, 1);
        uint64_t v5 = *v6;
      }
      unint64_t v14 = *(void *)(v5 + 16);
      unint64_t v13 = *(void *)(v5 + 24);
      if (v14 >= v13 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v13 > 1, v14 + 1, 1);
        uint64_t v5 = *v6;
      }
      uint64_t v16 = v118[31];
      uint64_t v15 = v118[32];
      *(void *)(v5 + 16) = v14 + 1;
      outlined init with take of NodeIdentity(v15, v5+ ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80))+ *(void *)(v16 + 72) * v14);
      v8 += v116;
      --v4;
    }
    while (v4);
  }
  type metadata accessor for MerkleTree();
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 24) = 0;
  uint64_t v18 = *(void *)(v5 + 16);
  double v111 = inited;
  if (v18)
  {
    unint64_t v19 = v0 + 16;
    uint64_t v20 = v0[31];
    v0[16] = MEMORY[0x1E4FBC860];
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v21 = v5 + ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
    uint64_t v22 = *(void *)(v20 + 72);
    uint64_t v0 = v118;
    do
    {
      BOOL v23 = v118[34];
      uint64_t v24 = v118[33];
      outlined init with copy of NodeIdentity(v21, v23);
      outlined init with copy of NodeIdentity(v23, v24);
      type metadata accessor for MerkleNode(0);
      unint64_t v25 = swift_allocObject();
      *(void *)(v25 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_parent) = 0;
      *(void *)(v25 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_left) = 0;
      *(void *)(v25 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_right) = 0;
      outlined init with take of NodeIdentity(v24, v25 + OBJC_IVAR____TtC11SocialLayer10MerkleNode_node);
      outlined destroy of NodeIdentity(v23);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      v21 += v22;
      --v18;
    }
    while (v18);
    unsigned int v26 = *v19;
    swift_bridgeObjectRelease();
    uint64_t v27 = v111;
  }
  else
  {
    uint64_t v27 = inited;
    swift_bridgeObjectRelease();
    unsigned int v26 = MEMORY[0x1E4FBC860];
  }
  *(void *)(v27 + 16) = v26;
  unint64_t v29 = swift_bridgeObjectRetain();
  unint64_t v30 = MerkleTree.buildTree(nodes:)(v29);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)(v27 + 24) = v30;
  swift_release();
  char v31 = v0[35];
  if (!v30)
  {
    os_log_t v46 = type metadata accessor for SHA256Digest();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v31, 1, 1, v46);
    goto LABEL_22;
  }
  uint64_t v32 = *(void (**)(uint64_t))(*(void *)v30 + 184);
  uint64_t v33 = swift_retain();
  v32(v33);
  swift_release();
  uint64_t v34 = type metadata accessor for SHA256Digest();
  uint64_t v35 = *(void *)(v34 - 8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v35 + 56))(v31, 0, 1, v34);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v31, 1, v34) == 1)
  {
LABEL_22:
    uint64_t v0 = v118;
    uint64_t v47 = v118[43];
    uint64_t v48 = v118[44];
    uint64_t v49 = v118[42];
    uint64_t v50 = v118[35];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    outlined consume of (keys: [P256.Signing.PublicKey], tps: Data)?(v49, v47, v48);
    outlined destroy of SymmetricKey??(v50, &demangling cache variable for type metadata for SHA256Digest?);
    uint64_t v28 = v118[37];
    goto LABEL_46;
  }
  lazy protocol witness table accessor for type SHA256Digest and conformance SHA256Digest();
  uint64_t v36 = Digest.makeIterator()();
  uint64_t v38 = specialized _copySequenceToContiguousArray<A>(_:)(v36, v37);
  swift_bridgeObjectRelease();
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt8]);
  v118[5] = v39;
  v118[6] = lazy protocol witness table accessor for type [UInt8] and conformance <A> [A]();
  v118[2] = v38;
  long long v40 = __swift_project_boxed_opaque_existential_1(v118 + 2, v39);
  uint64_t v41 = *v40;
  uint64_t v42 = *(void *)(*v40 + 16);
  if (v42)
  {
    if (v42 <= 0xE)
    {
      *(void *)((char *)v118 + 118) = 0;
      v118[14] = 0;
      *((unsigned char *)v118 + 126) = v42;
      memcpy(v118 + 14, (const void *)(v41 + 32), v42);
      uint64_t v110 = v118[14];
      uint64_t v45 = *((unsigned int *)v118 + 30) | ((unint64_t)*((unsigned __int8 *)v118 + 124) << 32) | ((unint64_t)*((unsigned __int8 *)v118 + 125) << 40) | ((unint64_t)*((unsigned __int8 *)v118 + 126) << 48);
      swift_retain();
    }
    else
    {
      type metadata accessor for __DataStorage();
      swift_allocObject();
      swift_retain();
      uint64_t v43 = __DataStorage.init(bytes:length:)();
      uint64_t v44 = v43;
      if (v42 >= 0x7FFFFFFF)
      {
        type metadata accessor for Data.RangeReference();
        unint64_t v51 = swift_allocObject();
        *(void *)(v51 + 16) = 0;
        *(void *)(v51 + 24) = v42;
        uint64_t v110 = v51;
        uint64_t v45 = v44 | 0x8000000000000000;
      }
      else
      {
        uint64_t v110 = v42 << 32;
        uint64_t v45 = v43 | 0x4000000000000000;
      }
    }
  }
  else
  {
    swift_retain();
    uint64_t v110 = 0;
    uint64_t v45 = 0xC000000000000000;
  }
  uint64_t v0 = v118;
  uint64_t v52 = v118[35];
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v118 + 2));
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v52, v34);
  uint64_t v53 = *(void *)(v113 + 16);
  unint64_t v54 = v118[27];
  double v112 = v45;
  if (v53)
  {
    id v55 = v113 + ((*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80));
    double v115 = *(void *)(v54 + 72);
    v117 = *(void (**)(uint64_t, uint64_t, uint64_t))(v54 + 16);
    swift_bridgeObjectRetain();
    CFAttributedStringRef v56 = (void *)MEMORY[0x1E4FBC860];
    while (1)
    {
      uint64_t v57 = v0[26];
      uint64_t v58 = v0[27];
      uint64_t v59 = v0[25];
      v117(v59, v55, v57);
      uint64_t v60 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v58 + 56);
      v60(v59, 0, 1, v57);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v58 + 48))(v59, 1, v57) == 1) {
        break;
      }
      os_log_type_t v62 = v0[27];
      uint64_t v61 = v0[28];
      double v63 = v0[26];
      uint64_t v64 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v62 + 32))(v61, v0[25], v63);
      uint64_t v65 = MEMORY[0x19F390570](v64);
      os_log_type_t v67 = v66;
      (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v61, v63);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        CFAttributedStringRef v56 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v56[2] + 1, 1, v56);
      }
      uint64_t v69 = v56[2];
      uint64_t v68 = v56[3];
      if (v69 >= v68 >> 1) {
        CFAttributedStringRef v56 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v68 > 1), v69 + 1, 1, v56);
      }
      v56[2] = v69 + 1;
      uint64_t v70 = &v56[2 * v69];
      v70[4] = v65;
      v70[5] = v67;
      v55 += v115;
      --v53;
      uint64_t v0 = v118;
      if (!v53) {
        goto LABEL_37;
      }
    }
    uint64_t v71 = v110;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v60 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v54 + 56);
LABEL_37:
    uint64_t v71 = v110;
    v60(v0[25], 1, 1, v0[26]);
  }
  unint64_t v72 = v0[43];
  uint64_t v73 = v0[44];
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRetain();
  outlined copy of Data._Representation(v72, v73);
  swift_bridgeObjectRelease();
  uint64_t v74 = objc_allocWithZone(MEMORY[0x1E4F3BDC0]);
  outlined copy of Data._Representation(v71, v112);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  uint64_t v76 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  unint64_t v77 = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v72, v73);
  id v78 = objc_msgSend(v74, sel_initWithRootHash_publicKeys_trackingPreventionSalt_, isa, v76, v77);
  outlined consume of Data._Representation(v71, v112);

  if (v78)
  {
    uint64_t v80 = v0[43];
    uint64_t v79 = v0[44];
    uint64_t v81 = v0[42];
    uint64_t v82 = v0[40];
    uint64_t v83 = v118[39];
    uint64_t v28 = v118[37];
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v0 = v118;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)((uint64_t)v78, v83, v82, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined consume of (keys: [P256.Signing.PublicKey], tps: Data)?(v81, v80, v79);
    uint64_t v85 = v71;
    uint64_t v86 = v112;
  }
  else
  {
    uint64_t v87 = v0[39];
    uint64_t v88 = v0[40];
    swift_bridgeObjectRetain();
    uint64_t v89 = specialized __RawDictionaryStorage.find<A>(_:)(v87, v88);
    LOBYTE(v88) = v90;
    swift_bridgeObjectRelease();
    if ((v88 & 1) == 0)
    {
      uint64_t v107 = v0[43];
      uint64_t v108 = v0[44];
      uint64_t v109 = v0[42];
      swift_bridgeObjectRelease();
      outlined consume of (keys: [P256.Signing.PublicKey], tps: Data)?(v109, v107, v108);
      outlined consume of Data._Representation(v71, v112);
      uint64_t v28 = v0[37];
      goto LABEL_45;
    }
    CFAttributedStringRef v91 = v0 + 37;
    uint64_t v92 = v0[37];
    uint64_t v93 = swift_isUniquelyReferenced_nonNull_native();
    v0[20] = v92;
    if ((v93 & 1) == 0)
    {
      specialized _NativeDictionary.copy()();
      CFAttributedStringRef v91 = v0 + 20;
    }
    uint64_t v28 = *v91;
    double v95 = v0[43];
    double v94 = v0[44];
    uint64_t v96 = v0[42];
    swift_bridgeObjectRelease();
    uint64_t v97 = *(void **)(*(void *)(v28 + 56) + 8 * v89);
    specialized _NativeDictionary._delete(at:)(v89, v28);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    outlined consume of (keys: [P256.Signing.PublicKey], tps: Data)?(v96, v95, v94);
    uint64_t v85 = v71;
    uint64_t v86 = v112;
  }
  outlined consume of Data._Representation(v85, v86);
LABEL_45:
  swift_setDeallocating();
  swift_bridgeObjectRelease();
  swift_release();
LABEL_46:
  double v98 = v0[38] + 1;
  if (v98 == v0[36])
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v99 = (uint64_t (*)(uint64_t))v0[1];
    return v99(v28);
  }
  else
  {
    v0[37] = v28;
    v0[38] = v98;
    double v101 = v0[21] + 16 * v98;
    double v102 = *(void *)(v101 + 32);
    v0[39] = v102;
    uint64_t v103 = *(void *)(v101 + 40);
    v0[40] = v103;
    swift_bridgeObjectRetain();
    uint64_t v104 = (void *)swift_task_alloc();
    v0[41] = v104;
    *uint64_t v104 = v0;
    v104[1] = PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:);
    double v105 = v0[23];
    double v106 = v0[22];
    return PersonIdentityGenerator.paddedPublicKeys(for:using:alignment:)(v102, v103, v106, v105, 32);
  }
}

{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  BOOL v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t (*v12)(void);
  uint64_t v14;
  uint64_t v15[2];
  void *v16;
  uint64_t v17;

  uint64_t v16 = v0;
  v15[1] = *MEMORY[0x1E4F143B8];
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  unint64_t v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Log.default);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v2 = Logger.logObject.getter();
  uint64_t v3 = static os_log_type_t.error.getter();
  uint64_t v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = v0[23];
  if (v4)
  {
    unint64_t v14 = v0[22];
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    v15[0] = v7;
    *(_DWORD *)uint64_t v6 = 136315394;
    uint64_t v8 = swift_bridgeObjectRetain();
    uint64_t v9 = MEMORY[0x19F390850](v8, MEMORY[0x1E4FBB1A0]);
    uint64_t v11 = v10;
    swift_bridgeObjectRelease();
    v0[19] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v11, v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v6 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[18] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v5, v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19BE17000, v2, v3, "Error while requesting public keys for handle: %s documentIdentifier: %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x19F392080](v7, -1, -1);
    MEMORY[0x19F392080](v6, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  objc_super v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t PersonIdentityGenerator.paddedPublicKeys(for:using:alignment:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[7] = a5;
  v6[8] = v5;
  v6[5] = a3;
  v6[6] = a4;
  v6[3] = a1;
  v6[4] = a2;
  uint64_t v7 = type metadata accessor for P256.Signing.PrivateKey();
  v6[9] = v7;
  v6[10] = *(void *)(v7 - 8);
  v6[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for P256.Signing.PublicKey?);
  v6[12] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for P256.Signing.PublicKey();
  v6[13] = v8;
  v6[14] = *(void *)(v8 - 8);
  v6[15] = swift_task_alloc();
  v6[16] = swift_task_alloc();
  return MEMORY[0x1F4188298](PersonIdentityGenerator.paddedPublicKeys(for:using:alignment:), 0, 0);
}

uint64_t PersonIdentityGenerator.paddedPublicKeys(for:using:alignment:)()
{
  unint64_t v1 = *(int **)((*MEMORY[0x1E4FBC8C8] & **(void **)(v0[8] + OBJC_IVAR___SLPersonIdentityGenerator_keyQueryController))
               + 0xB8);
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)v1 + *v1);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[17] = v2;
  *uint64_t v2 = v0;
  v2[1] = PersonIdentityGenerator.paddedPublicKeys(for:using:alignment:);
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v6 = v0[3];
  uint64_t v5 = v0[4];
  return v8(v6, v5, v3, v4);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(unint64_t, unint64_t, uint64_t);
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void (*v19)(unint64_t, unint64_t, uint64_t);
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  void (**v34)(uint64_t, uint64_t);
  uint64_t v35;

  uint64_t v2 = v0[18];
  if (v2)
  {
    uint64_t v4 = v0[19];
    uint64_t v3 = v0[20];
    uint64_t v5 = v0[7];
    swift_bridgeObjectRetain();
    outlined copy of Data._Representation(v4, v3);
    id result = outlined consume of Data._Representation(v4, v3);
    if (!v5)
    {
      __break(1u);
      goto LABEL_27;
    }
    uint64_t v7 = v0[7];
    uint64_t v8 = *(void *)(v2 + 16) % v7;
    uint64_t v32 = v2;
    if (!v8) {
      goto LABEL_16;
    }
    uint64_t v9 = v7 - v8;
    if (__OFSUB__(v7, v8))
    {
      __break(1u);
    }
    else if ((v9 & 0x8000000000000000) == 0)
    {
      if (v9)
      {
        uint64_t v33 = v0[14];
        uint64_t v34 = (void (**)(uint64_t, uint64_t))(v0[10] + 8);
        uint64_t v10 = (void (**)(unint64_t, unint64_t, uint64_t))(v33 + 32);
        unint64_t v1 = MEMORY[0x1E4FBC860];
        do
        {
          while (1)
          {
            uint64_t v11 = v1;
            unint64_t v13 = v0[12];
            objc_super v12 = v0[13];
            unint64_t v14 = v0[11];
            uint64_t v15 = v0[9];
            P256.Signing.PrivateKey.init(compactRepresentable:)();
            P256.Signing.PrivateKey.publicKey.getter();
            (*v34)(v14, v15);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v33 + 56))(v13, 0, 1, v12);
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v13, 1, v12) != 1) {
              break;
            }
            outlined destroy of SymmetricKey??(v0[12], &demangling cache variable for type metadata for P256.Signing.PublicKey?);
            unint64_t v1 = v11;
            if (!--v9) {
              goto LABEL_17;
            }
          }
          uint64_t v17 = v0[15];
          uint64_t v16 = v0[16];
          uint64_t v18 = v0[13];
          unint64_t v19 = *v10;
          (*v10)(v16, v0[12], v18);
          v19(v17, v16, v18);
          unint64_t v1 = v11;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v1 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v11 + 16) + 1, 1, v11, &demangling cache variable for type metadata for _ContiguousArrayStorage<P256.Signing.PublicKey>, MEMORY[0x1E4F250F8], MEMORY[0x1E4F250F8]);
          }
          uint64_t v21 = *(void *)(v1 + 16);
          uint64_t v20 = *(void *)(v1 + 24);
          if (v21 >= v20 >> 1) {
            unint64_t v1 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v20 > 1, v21 + 1, 1, v1, &demangling cache variable for type metadata for _ContiguousArrayStorage<P256.Signing.PublicKey>, MEMORY[0x1E4F250F8], MEMORY[0x1E4F250F8]);
          }
          uint64_t v22 = v0[15];
          BOOL v23 = v0[13];
          *(void *)(v1 + 16) = v21 + 1;
          v19(v1+ ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80))+ *(void *)(v33 + 72) * v21, v22, v23);
          --v9;
        }
        while (v9);
LABEL_17:
        if (one-time initialization token for personIdentityGenerator == -1)
        {
LABEL_18:
          uint64_t v24 = type metadata accessor for Logger();
          __swift_project_value_buffer(v24, (uint64_t)static Log.personIdentityGenerator);
          swift_bridgeObjectRetain();
          unint64_t v25 = Logger.logObject.getter();
          unsigned int v26 = static os_log_type_t.info.getter();
          if (os_log_type_enabled(v25, v26))
          {
            uint64_t v27 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)uint64_t v27 = 134217984;
            v0[2] = *(void *)(v1 + 16);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_19BE17000, v25, v26, "Added %ld anonymous keys", v27, 0xCu);
            MEMORY[0x19F392080](v27, -1, -1);
          }
          else
          {
            swift_bridgeObjectRelease();
          }

          specialized Array.append<A>(contentsOf:)(v1);
          swift_bridgeObjectRelease();
          uint64_t v28 = v32;
          unint64_t v29 = v0[19];
          unint64_t v30 = v0[20];
          goto LABEL_23;
        }
LABEL_27:
        swift_once();
        goto LABEL_18;
      }
LABEL_16:
      unint64_t v1 = MEMORY[0x1E4FBC860];
      goto LABEL_17;
    }
    __break(1u);
    return result;
  }
  uint64_t v28 = 0;
  unint64_t v29 = 0;
  unint64_t v30 = 0;
LABEL_23:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v31 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v0[1];
  return v31(v28, v29, v30);
}

uint64_t PersonIdentityGenerator.paddedPublicKeys(for:using:alignment:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)*v4;
  v5[18] = a1;
  v5[19] = a2;
  v5[20] = a3;
  swift_task_dealloc();
  if (v3)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void))v5[1];
    return v6();
  }
  else
  {
    return MEMORY[0x1F4188298](PersonIdentityGenerator.paddedPublicKeys(for:using:alignment:), 0, 0);
  }
}

uint64_t Digest.data.getter()
{
  uint64_t v0 = Digest.bytes.getter();
  uint64_t v1 = specialized Data.init<A>(_:)(v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t @objc closure #1 in PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:)(int a1, int a2, void *aBlock, void *a4)
{
  v4[2] = a4;
  void v4[3] = _Block_copy(aBlock);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  void v4[4] = v6;
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  v4[5] = v8;
  a4;
  uint64_t v10 = (void *)swift_task_alloc();
  void v4[6] = v10;
  *uint64_t v10 = v4;
  v10[1] = @objc closure #1 in PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:);
  return PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:)(v6, v7, v9);
}

uint64_t @objc closure #1 in PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:)()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *(void **)(*v1 + 16);
  uint64_t v5 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2)
  {
    uint64_t v6 = _convertErrorToNSError(_:)();

    Class isa = 0;
    uint64_t v8 = (void *)v6;
  }
  else
  {
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for SWPersonIdentity);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v6 = 0;
    uint64_t v8 = isa;
  }
  uint64_t v9 = *(void (***)(void, void, void))(v3 + 24);
  ((void (**)(void, Class, uint64_t))v9)[2](v9, isa, v6);

  _Block_release(v9);
  uint64_t v10 = *(uint64_t (**)(void))(v5 + 8);
  return v10();
}

uint64_t PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x1F4188298](PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:), 0, 0);
}

uint64_t PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:)()
{
  uint64_t v1 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **(void **)(v0[4]
                                                                  + OBJC_IVAR___SLPersonIdentityGenerator_keyQueryController))
                            + 0x98))();
  v0[5] = v1;
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = (void *)swift_task_alloc();
    v0[6] = v3;
    void *v3 = v0;
    v3[1] = PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:);
    uint64_t v4 = v0[3];
    uint64_t v5 = v0[2];
    return PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:)(v2, v5, v4);
  }
  else
  {
    unint64_t v7 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E4FBC860]);
    uint64_t v8 = (uint64_t (*)(unint64_t))v0[1];
    return v8(v7);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v4;

  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:)(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 56) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:);
  }
  else
  {
    *(void *)(v4 + 64) = a1;
    uint64_t v5 = PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:);
  }
  return MEMORY[0x1F4188298](v5, 0, 0);
}

uint64_t @objc closure #1 in PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:)(int a1, void *aBlock, void *a3)
{
  v3[4] = a3;
  void v3[5] = _Block_copy(aBlock);
  v3[2] = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3[3] = v5;
  v3[6] = v5;
  id v6 = a3;
  return MEMORY[0x1F4188298](@objc closure #1 in PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:), 0, 0);
}

uint64_t @objc closure #1 in PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:)()
{
  uint64_t v1 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **(void **)(v0[4]
                                                                  + OBJC_IVAR___SLPersonIdentityGenerator_keyQueryController))
                            + 0x98))();
  v0[7] = v1;
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = v0[2];
    uint64_t v4 = (void *)swift_task_alloc();
    v0[8] = v4;
    *uint64_t v4 = v0;
    v4[1] = @objc closure #1 in PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:);
    uint64_t v5 = v0[6];
    return PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:)(v2, v3, v5);
  }
  else
  {
    uint64_t v7 = (void *)v0[4];
    specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E4FBC860]);

    swift_bridgeObjectRelease();
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for SWPersonIdentity);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v9 = (void (**)(void, void, void))v0[5];
    ((void (**)(void, Class, void))v9)[2](v9, isa, 0);

    _Block_release(v9);
    uint64_t v10 = (uint64_t (*)(void))v0[1];
    return v10();
  }
}

{
  uint64_t v0;
  Class isa;
  void (**v2)(void, void, void);
  uint64_t (*v3)(void);
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for SWPersonIdentity);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void (***)(void, void, void))(v0 + 40);
  ((void (**)(void, Class, void))v2)[2](v2, isa, 0);

  _Block_release(v2);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  void (**v3)(void, void, void);
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v1 = *(void **)(v0 + 72);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = (void *)_convertErrorToNSError(_:)();

  uint64_t v3 = *(void (***)(void, void, void))(v0 + 40);
  ((void (**)(void, void, void *))v3)[2](v3, 0, v2);

  _Block_release(v3);
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t @objc closure #1 in PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:)(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 72) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = @objc closure #1 in PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:);
  }
  else
  {
    *(void *)(v4 + 80) = a1;
    uint64_t v5 = @objc closure #1 in PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:);
  }
  return MEMORY[0x1F4188298](v5, 0, 0);
}

uint64_t PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[30] = a3;
  v4[31] = v3;
  v4[28] = a1;
  v4[29] = a2;
  uint64_t v5 = type metadata accessor for SHA256Digest();
  v4[32] = v5;
  v4[33] = *(void *)(v5 - 8);
  v4[34] = swift_task_alloc();
  v4[35] = type metadata accessor for NodeIdentity(0);
  v4[36] = swift_task_alloc();
  v4[37] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: P256.Signing.PublicKey, tps: Data));
  v4[38] = swift_task_alloc();
  v4[39] = swift_task_alloc();
  v4[40] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for P256.Signing.PublicKey?);
  v4[41] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for P256.Signing.PublicKey();
  v4[42] = v6;
  v4[43] = *(void *)(v6 - 8);
  v4[44] = swift_task_alloc();
  v4[45] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SHA256Digest?);
  v4[46] = swift_task_alloc();
  v4[47] = swift_task_alloc();
  return MEMORY[0x1F4188298](PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:), 0, 0);
}

uint64_t PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:)()
{
  uint64_t v90 = v0;
  v89[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)v0[28];
  uint64_t v81 = (id *)(v0 + 28);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19BED15B0;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v3;
  uint64_t v4 = (void *)*MEMORY[0x1E4F3B740];
  type metadata accessor for CFStringRef(0);
  uint64_t v6 = v5;
  *(void *)(inited + 72) = v5;
  *(void *)(inited + 48) = v4;
  *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 88) = v7;
  uint64_t v8 = (void *)*MEMORY[0x1E4F3B6F0];
  *(void *)(inited + 120) = v6;
  *(void *)(inited + 96) = v8;
  id v9 = v4;
  id v10 = v8;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  id v11 = objc_msgSend(v1, sel_publicKeys);
  uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRetain();
  unint64_t v13 = specialized Sequence.compactMap<A>(_:)(v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  if (v13 >> 62) {
    goto LABEL_17;
  }
  uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (unint64_t i = v0; v14; unint64_t i = v0)
  {
    uint64_t v15 = 0;
    uint64_t v16 = v0[43];
    uint64_t v85 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v16 + 56);
    unint64_t v86 = v13 & 0xC000000000000001;
    id v84 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48);
    uint64_t v82 = v16;
    uint64_t v17 = (void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32);
    uint64_t v18 = MEMORY[0x1E4FBC860];
    unint64_t v83 = v13;
    while (1)
    {
      id v19 = v86 ? (id)MEMORY[0x19F390AB0](v15, v13) : *(id *)(v13 + 8 * v15 + 32);
      uint64_t v20 = v19;
      uint64_t v21 = v15 + 1;
      if (__OFADD__(v15, 1)) {
        break;
      }
      SecKeyRef.p256PublicKey.getter();
      uint64_t v23 = v0[41];
      uint64_t v22 = v0[42];
      (*v85)(v23, 0, 1, v22);

      if ((*v84)(v23, 1, v22) == 1)
      {
        outlined destroy of SymmetricKey??(v0[41], &demangling cache variable for type metadata for P256.Signing.PublicKey?);
      }
      else
      {
        uint64_t v25 = v0[44];
        uint64_t v24 = v0[45];
        uint64_t v26 = v0[42];
        uint64_t v27 = *v17;
        (*v17)(v24, v0[41], v26);
        v27(v25, v24, v26);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v18 + 16) + 1, 1, v18, &demangling cache variable for type metadata for _ContiguousArrayStorage<P256.Signing.PublicKey>, MEMORY[0x1E4F250F8], MEMORY[0x1E4F250F8]);
        }
        unint64_t v29 = *(void *)(v18 + 16);
        unint64_t v28 = *(void *)(v18 + 24);
        if (v29 >= v28 >> 1) {
          uint64_t v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v28 > 1, v29 + 1, 1, v18, &demangling cache variable for type metadata for _ContiguousArrayStorage<P256.Signing.PublicKey>, MEMORY[0x1E4F250F8], MEMORY[0x1E4F250F8]);
        }
        uint64_t v0 = i;
        uint64_t v30 = i[44];
        uint64_t v31 = i[42];
        *(void *)(v18 + 16) = v29 + 1;
        v27(v18+ ((*(unsigned __int8 *)(v82 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v82 + 80))+ *(void *)(v82 + 72) * v29, v30, v31);
        unint64_t v13 = v83;
      }
      ++v15;
      if (v21 == v14) {
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
    uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
  }
  uint64_t v18 = MEMORY[0x1E4FBC860];
LABEL_19:
  uint64_t v32 = v0[47];
  uint64_t v34 = v0[32];
  uint64_t v33 = v0[33];
  swift_bridgeObjectRelease_n();
  uint64_t v35 = specialized PersonIdentityGenerator.merkleTreeForPublicKeys(_:)(v18);
  v0[48] = v35;
  uint64_t v36 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(void *)v35 + 120))(v36);
  id v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 48);
  v0[49] = v37;
  v0[50] = (v33 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  int v38 = v37(v32, 1, v34);
  uint64_t v39 = v0[47];
  if (v38 == 1)
  {
    outlined destroy of SymmetricKey??(v0[47], &demangling cache variable for type metadata for SHA256Digest?);
    uint64_t v40 = 0;
    unint64_t v41 = 0xF000000000000000;
  }
  else
  {
    uint64_t v43 = v0[32];
    uint64_t v42 = v0[33];
    lazy protocol witness table accessor for type SHA256Digest and conformance SHA256Digest();
    uint64_t v44 = Digest.makeIterator()();
    uint64_t v46 = specialized _copySequenceToContiguousArray<A>(_:)(v44, v45);
    swift_bridgeObjectRelease();
    uint64_t v40 = specialized Data.init<A>(_:)(v46);
    unint64_t v41 = v47;
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v39, v43);
  }
  id v48 = objc_msgSend(*v81, sel_rootHash);
  uint64_t v49 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v51 = v50;

  if (v41 >> 60 == 15)
  {
    outlined consume of Data?(v40, v41);
    outlined consume of Data?(v49, v51);
LABEL_27:
    if (one-time initialization token for default != -1) {
      swift_once();
    }
    uint64_t v59 = type metadata accessor for Logger();
    __swift_project_value_buffer(v59, (uint64_t)static Log.default);
    uint64_t v60 = Logger.logObject.getter();
    os_log_type_t v61 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v60, v61))
    {
      os_log_type_t v62 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v62 = 0;
      _os_log_impl(&dword_19BE17000, v60, v61, "PersonIdentityGenerator: Root hash of given identity did not match the root hash of the tree generated by the identity.", v62, 2u);
      MEMORY[0x19F392080](v62, -1, -1);
    }

    lazy protocol witness table accessor for type PersonIdentityGenerator.GenerationErrors and conformance PersonIdentityGenerator.GenerationErrors();
    double v63 = (void *)swift_allocError();
    *uint64_t v64 = 1;
    swift_willThrow();
    swift_release();
    if (one-time initialization token for default != -1) {
      swift_once();
    }
    uint64_t v65 = type metadata accessor for Logger();
    __swift_project_value_buffer(v65, (uint64_t)static Log.default);
    id v66 = v63;
    id v67 = v63;
    uint64_t v68 = Logger.logObject.getter();
    os_log_type_t v69 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v68, v69))
    {
      uint64_t v70 = (uint8_t *)swift_slowAlloc();
      uint64_t v71 = swift_slowAlloc();
      v89[0] = v71;
      *(_DWORD *)uint64_t v70 = 136315138;
      swift_getErrorValue();
      uint64_t v72 = Error.localizedDescription.getter();
      i[27] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v72, v73, v89);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_19BE17000, v68, v69, "PersonIdentityGenerator: Error while generating identity proof: %s", v70, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x19F392080](v71, -1, -1);
      MEMORY[0x19F392080](v70, -1, -1);
    }
    else
    {
    }
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v74 = (uint64_t (*)(void))i[1];
    return v74();
  }
  outlined copy of Data?(v40, v41);
  char v52 = specialized static Data.== infix(_:_:)(v40, v41, v49, v51);
  outlined consume of Data._Representation(v49, v51);
  outlined consume of Data?(v40, v41);
  outlined consume of Data?(v40, v41);
  if ((v52 & 1) == 0) {
    goto LABEL_27;
  }
  uint64_t v53 = *(void **)(v0[31] + OBJC_IVAR___SLPersonIdentityGenerator_keyQueryController);
  id v54 = objc_msgSend((id)v0[28], sel_trackingPreventionSalt);
  if (v54)
  {
    id v55 = v54;
    uint64_t v56 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v58 = v57;
  }
  else
  {
    uint64_t v56 = 0;
    unint64_t v58 = 0xF000000000000000;
  }
  v0[51] = v56;
  v0[52] = v58;
  uint64_t v76 = *(int **)((*MEMORY[0x1E4FBC8C8] & *v53) + 0xE8);
  uint64_t v87 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))((char *)v76 + *v76);
  unint64_t v77 = (void *)swift_task_alloc();
  v0[53] = v77;
  *unint64_t v77 = v0;
  v77[1] = PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:);
  uint64_t v78 = v0[40];
  uint64_t v79 = v0[29];
  uint64_t v80 = v0[30];
  return v87(v78, v79, v80, v56, v58);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void (*v9)(uint64_t);
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  void *v18;
  unsigned char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, unint64_t, uint64_t);
  unint64_t v33;
  void *v34;
  unsigned int (*v35)(uint64_t, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  void (*v38)(void, uint64_t, uint64_t, void);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  size_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint64_t v58;
  uint8_t *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  unsigned char *v63;
  uint64_t v64;
  id v65;
  id v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t (*v73)(void);
  void (*v75)(void, uint64_t, uint64_t, void);
  uint64_t v76;
  uint64_t v77;
  id v78;
  Class isa;
  id v80;
  Class v81;
  uint64_t (*v82)(id);
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  void (**v86)(uint64_t, uint64_t);
  void (**v87)(void, void, void);
  uint64_t v88;
  void (**v89)(uint64_t, void, uint64_t, uint64_t);
  void (*v90)(uint64_t, unint64_t, uint64_t);
  void *v91;
  unsigned char v92[14];
  unsigned __int8 v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;

  double v95 = v0;
  double v94 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(v0 + 440);
  uint64_t v1 = *(void *)(v0 + 448);
  uint64_t v3 = *(void *)(v0 + 336);
  uint64_t v4 = *(void *)(v0 + 344);
  uint64_t v5 = *(void *)(v0 + 312);
  uint64_t v6 = *(void *)(v0 + 296);
  uint64_t v7 = (void *)(*(void *)(v0 + 320) + *(int *)(v0 + 456));
  *uint64_t v7 = v1;
  v7[1] = v2;
  uint64_t v8 = (void *)(v5 + *(int *)(v6 + 48));
  id v9 = *(void (**)(uint64_t))(v4 + 16);
  v9(v5);
  void *v8 = v1;
  v8[1] = v2;
  id v10 = P256.Signing.PublicKey.secKeyData.getter();
  uint64_t v12 = v11;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v3);
  if (v12 >> 60 == 15)
  {
    if (one-time initialization token for default != -1) {
      swift_once();
    }
    unint64_t v13 = type metadata accessor for Logger();
    __swift_project_value_buffer(v13, (uint64_t)static Log.default);
    uint64_t v14 = Logger.logObject.getter();
    uint64_t v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_19BE17000, v14, v15, "PersonIdentityGenerator: Could not generate local key data", v16, 2u);
      MEMORY[0x19F392080](v16, -1, -1);
    }
    uint64_t v17 = *(void *)(v0 + 320);

    lazy protocol witness table accessor for type PersonIdentityGenerator.GenerationErrors and conformance PersonIdentityGenerator.GenerationErrors();
    uint64_t v18 = (void *)swift_allocError();
    *id v19 = 0;
    swift_willThrow();
    swift_release();
    goto LABEL_35;
  }
  id v84 = v10;
  uint64_t v85 = v12;
  uint64_t v20 = *(void *)(v0 + 384);
  uint64_t v21 = *(void *)(v0 + 336);
  uint64_t v22 = *(void *)(v0 + 344);
  uint64_t v23 = *(void *)(v0 + 304);
  uint64_t v24 = *(void *)(v0 + 288);
  ((void (*)(uint64_t, void, uint64_t))v9)(v23, *(void *)(v0 + 320), v21);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v24, v23, v21);
  swift_storeEnumTagMultiPayload();
  uint64_t v25 = (*(uint64_t (**)(uint64_t))(*(void *)v20 + 136))(v24);
  if (!v25)
  {
    if (one-time initialization token for default != -1) {
      swift_once();
    }
    id v55 = type metadata accessor for Logger();
    __swift_project_value_buffer(v55, (uint64_t)static Log.default);
    uint64_t v56 = Logger.logObject.getter();
    unint64_t v57 = static os_log_type_t.error.getter();
    unint64_t v58 = v84;
    if (!os_log_type_enabled(v56, v57)) {
      goto LABEL_34;
    }
    uint64_t v59 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v59 = 0;
    uint64_t v60 = "PersonIdentityGenerator: Could not get inclusionNodes to generate the identity proof";
    goto LABEL_33;
  }
  if (v27)
  {
    swift_bridgeObjectRelease();
    if (one-time initialization token for default != -1) {
      swift_once();
    }
    os_log_type_t v61 = type metadata accessor for Logger();
    __swift_project_value_buffer(v61, (uint64_t)static Log.default);
    uint64_t v56 = Logger.logObject.getter();
    unint64_t v57 = static os_log_type_t.error.getter();
    unint64_t v58 = v84;
    if (!os_log_type_enabled(v56, v57)) {
      goto LABEL_34;
    }
    uint64_t v59 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v59 = 0;
    uint64_t v60 = "PersonIdentityGenerator: Could not get localKeyIndex to generate the identity proof";
LABEL_33:
    _os_log_impl(&dword_19BE17000, v56, v57, v60, v59, 2u);
    MEMORY[0x19F392080](v59, -1, -1);
LABEL_34:
    uint64_t v17 = *(void *)(v0 + 320);
    os_log_type_t v62 = *(void *)(v0 + 288);

    lazy protocol witness table accessor for type PersonIdentityGenerator.GenerationErrors and conformance PersonIdentityGenerator.GenerationErrors();
    uint64_t v18 = (void *)swift_allocError();
    *double v63 = 1;
    swift_willThrow();
    outlined consume of Data?(v58, v85);
    swift_release();
    outlined destroy of NodeIdentity(v62);
LABEL_35:
    outlined destroy of SymmetricKey??(v17, &demangling cache variable for type metadata for (key: P256.Signing.PublicKey, tps: Data));
    if (one-time initialization token for default != -1) {
      swift_once();
    }
    uint64_t v64 = type metadata accessor for Logger();
    __swift_project_value_buffer(v64, (uint64_t)static Log.default);
    uint64_t v65 = v18;
    id v66 = v18;
    id v67 = Logger.logObject.getter();
    uint64_t v68 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v67, v68))
    {
      os_log_type_t v69 = (uint8_t *)swift_slowAlloc();
      uint64_t v70 = swift_slowAlloc();
      *(void *)uint64_t v92 = v70;
      *(_DWORD *)os_log_type_t v69 = 136315138;
      swift_getErrorValue();
      uint64_t v71 = Error.localizedDescription.getter();
      *(void *)(v0 + 216) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v71, v72, (uint64_t *)v92);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_19BE17000, v67, v68, "PersonIdentityGenerator: Error while generating identity proof: %s", v69, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x19F392080](v70, -1, -1);
      MEMORY[0x19F392080](v69, -1, -1);
    }
    else
    {
    }
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v73 = *(uint64_t (**)(void))(v0 + 8);
    return v73();
  }
  unint64_t v28 = v26;
  unint64_t v29 = *(void *)(v25 + 16);
  uint64_t v30 = *(void *)(v0 + 264);
  if (v29)
  {
    unint64_t v83 = v26;
    uint64_t v32 = *(void (**)(uint64_t, unint64_t, uint64_t))(v30 + 16);
    uint64_t v31 = v30 + 16;
    uint64_t v90 = v32;
    uint64_t v91 = (void *)(v0 + 144);
    uint64_t v33 = v25 + ((*(unsigned __int8 *)(v31 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 64));
    uint64_t v87 = (void (**)(void, void, void))(v31 + 16);
    uint64_t v88 = *(void *)(v31 + 56);
    unint64_t v86 = (void (**)(uint64_t, uint64_t))(v31 - 8);
    swift_bridgeObjectRetain();
    uint64_t v34 = (void *)MEMORY[0x1E4FBC860];
    uint64_t v89 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v31 + 40);
    while (1)
    {
      uint64_t v35 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 392);
      uint64_t v36 = *(void *)(v0 + 368);
      id v37 = *(void *)(v0 + 256);
      v90(v36, v33, v37);
      int v38 = *v89;
      (*v89)(v36, 0, 1, v37);
      if (v35(v36, 1, v37) == 1) {
        break;
      }
      (*v87)(*(void *)(v0 + 272), *(void *)(v0 + 368), *(void *)(v0 + 256));
      lazy protocol witness table accessor for type SHA256Digest and conformance SHA256Digest();
      uint64_t v39 = Digest.makeIterator()();
      unint64_t v41 = specialized _copySequenceToContiguousArray<A>(_:)(v39, v40);
      swift_bridgeObjectRelease();
      uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt8]);
      *(void *)(v0 + 168) = v42;
      *(void *)(v0 + 176) = lazy protocol witness table accessor for type [UInt8] and conformance <A> [A]();
      *(void *)(v0 + 144) = v41;
      uint64_t v43 = __swift_project_boxed_opaque_existential_1(v91, v42);
      uint64_t v44 = *v43;
      uint64_t v45 = *(void *)(*v43 + 16);
      if (v45)
      {
        if (v45 <= 0xE)
        {
          memset(v92, 0, sizeof(v92));
          uint64_t v93 = v45;
          memcpy(v92, (const void *)(v44 + 32), v45);
          id v48 = *(void *)v92;
          uint64_t v49 = *(unsigned int *)&v92[8] | ((unint64_t)v92[12] << 32) | ((unint64_t)v92[13] << 40) | ((unint64_t)v93 << 48);
          swift_retain();
        }
        else
        {
          type metadata accessor for __DataStorage();
          swift_allocObject();
          swift_retain();
          uint64_t v46 = __DataStorage.init(bytes:length:)();
          unint64_t v47 = v46;
          if (v45 >= 0x7FFFFFFF)
          {
            type metadata accessor for Data.RangeReference();
            id v48 = swift_allocObject();
            *(void *)(v48 + 16) = 0;
            *(void *)(v48 + 24) = v45;
            uint64_t v49 = v47 | 0x8000000000000000;
          }
          else
          {
            id v48 = v45 << 32;
            uint64_t v49 = v46 | 0x4000000000000000;
          }
        }
      }
      else
      {
        swift_retain();
        id v48 = 0;
        uint64_t v49 = 0xC000000000000000;
      }
      unint64_t v50 = *(void *)(v0 + 272);
      unint64_t v51 = *(void *)(v0 + 256);
      swift_release();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v91);
      (*v86)(v50, v51);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v34 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v34[2] + 1, 1, v34);
      }
      uint64_t v53 = v34[2];
      char v52 = v34[3];
      if (v53 >= v52 >> 1) {
        uint64_t v34 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v52 > 1), v53 + 1, 1, v34);
      }
      v34[2] = v53 + 1;
      id v54 = &v34[2 * v53];
      v54[4] = v48;
      v54[5] = v49;
      v33 += v88;
      if (!--v29)
      {
        unint64_t v28 = v83;
        v38(*(void *)(v0 + 368), 1, 1, *(void *)(v0 + 256));
        goto LABEL_45;
      }
    }
    unint64_t v28 = v83;
  }
  else
  {
    uint64_t v75 = *(void (**)(void, uint64_t, uint64_t, void))(v30 + 56);
    swift_bridgeObjectRetain();
    v75(*(void *)(v0 + 368), 1, 1, *(void *)(v0 + 256));
  }
LABEL_45:
  uint64_t v76 = *(void *)(v0 + 320);
  unint64_t v77 = *(void *)(v0 + 288);
  swift_bridgeObjectRelease_n();
  uint64_t v78 = objc_allocWithZone(MEMORY[0x1E4F3BDC8]);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v80 = objc_msgSend(v78, sel_initWithInclusionHashes_, isa);

  objc_msgSend(v80, sel_setLocalKeyIndex_, v28);
  uint64_t v81 = Data._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v80, sel_setPublicKey_, v81);
  outlined consume of Data?(v84, v85);
  swift_release();

  outlined destroy of NodeIdentity(v77);
  outlined destroy of SymmetricKey??(v76, &demangling cache variable for type metadata for (key: P256.Signing.PublicKey, tps: Data));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v82 = *(uint64_t (**)(id))(v0 + 8);
  return v82(v80);
}

{
  void *v0;
  uint64_t v1;
  unint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t (*v13)(void);
  uint64_t v15[2];
  void *v16;
  uint64_t v17;

  uint64_t v16 = v0;
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = v0[51];
  uint64_t v2 = v0[52];
  swift_release();
  outlined consume of Data?(v1, v2);
  uint64_t v3 = (void *)v0[54];
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)static Log.default);
  uint64_t v5 = v3;
  uint64_t v6 = v3;
  uint64_t v7 = Logger.logObject.getter();
  uint64_t v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    id v10 = swift_slowAlloc();
    v15[0] = v10;
    *(_DWORD *)id v9 = 136315138;
    swift_getErrorValue();
    id v11 = Error.localizedDescription.getter();
    v0[27] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v12, v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_19BE17000, v7, v8, "PersonIdentityGenerator: Error while generating identity proof: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F392080](v10, -1, -1);
    MEMORY[0x19F392080](v9, -1, -1);
  }
  else
  {
  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 432) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v7 = PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:);
  }
  else
  {
    uint64_t v8 = *(void *)(v6 + 408);
    unint64_t v9 = *(void *)(v6 + 416);
    uint64_t v10 = *(void *)(v6 + 296);
    *(void *)(v6 + 440) = a2;
    *(void *)(v6 + 448) = a1;
    outlined consume of Data?(v8, v9);
    *(_DWORD *)(v6 + 456) = *(_DWORD *)(v10 + 48);
    uint64_t v7 = PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:);
  }
  return MEMORY[0x1F4188298](v7, 0, 0);
}

uint64_t @objc closure #1 in PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:)(void *a1, int a2, void *aBlock, void *a4)
{
  v4[2] = a1;
  void v4[3] = a4;
  void v4[4] = _Block_copy(aBlock);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  v4[5] = v8;
  id v10 = a1;
  a4;
  id v11 = (void *)swift_task_alloc();
  void v4[6] = v11;
  *id v11 = v4;
  v11[1] = @objc closure #1 in PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:);
  return PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:)((uint64_t)v10, v7, v9);
}

uint64_t @objc closure #1 in PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void **)(*v2 + 24);
  uint64_t v7 = *(void **)(*v2 + 16);
  uint64_t v8 = *v2;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  uint64_t v9 = *(void (***)(void, void, void))(v5 + 32);
  if (v3)
  {
    id v10 = (void *)_convertErrorToNSError(_:)();

    ((void (**)(void, void, void *))v9)[2](v9, 0, v10);
    _Block_release(v9);
  }
  else
  {
    ((void (**)(void, void *, void))v9)[2](v9, a1, 0);
    _Block_release(v9);
  }
  id v11 = *(uint64_t (**)(void))(v8 + 8);
  return v11();
}

uint64_t PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  return MEMORY[0x1F4188298](PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:), 0, 0);
}

uint64_t PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:)()
{
  uint64_t v1 = *(int **)((*MEMORY[0x1E4FBC8C8] & **(void **)(v0[7] + OBJC_IVAR___SLPersonIdentityGenerator_keyQueryController))
               + 0xD8);
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v1 + *v1);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[8] = v2;
  *uint64_t v2 = v0;
  v2[1] = PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:);
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v7 = v0[2];
  return v9(v7, v5, v6, v3, v4);
}

uint64_t PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:)(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *v3;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  if (!v2)
  {
    uint64_t v6 = a1;
    uint64_t v7 = a2;
  }
  return v8(v6, v7);
}

uint64_t @objc closure #1 in PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:)(void *a1, int a2, void *a3, void *aBlock, void *a5)
{
  void v5[2] = a1;
  void v5[3] = a5;
  v5[4] = _Block_copy(aBlock);
  v5[5] = static String._unconditionallyBridgeFromObjectiveC(_:)();
  void v5[6] = v9;
  if (a3)
  {
    id v10 = a3;
    id v11 = a1;
    id v12 = a5;
    uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v15 = v14;
  }
  else
  {
    id v16 = a1;
    id v17 = a5;
    uint64_t v13 = 0;
    unint64_t v15 = 0xF000000000000000;
  }
  v5[7] = v13;
  v5[8] = v15;
  return MEMORY[0x1F4188298](@objc closure #1 in PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:), 0, 0);
}

uint64_t @objc closure #1 in PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:)()
{
  uint64_t v1 = *(int **)((*MEMORY[0x1E4FBC8C8] & **(void **)(v0[3] + OBJC_IVAR___SLPersonIdentityGenerator_keyQueryController))
               + 0xD8);
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v1 + *v1);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[9] = v2;
  *uint64_t v2 = v0;
  v2[1] = @objc closure #1 in PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:);
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[8];
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[6];
  uint64_t v7 = v0[2];
  return v9(v7, v5, v6, v3, v4);
}

{
  uint64_t v0;
  void *v1;
  unint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void (**v6)(void, void, void);
  uint64_t (*v7)(void);
  uint64_t v9;

  uint64_t v1 = *(void **)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v4 = *(void **)(v0 + 24);

  outlined consume of Data?(v3, v2);
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)_convertErrorToNSError(_:)();

  uint64_t v6 = *(void (***)(void, void, void))(v0 + 32);
  ((void (**)(void, void, void *))v6)[2](v6, 0, v5);

  _Block_release(v6);
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t @objc closure #1 in PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:)(uint64_t a1, unint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(v6 + 80) = v2;
  swift_task_dealloc();
  if (v2)
  {
    return MEMORY[0x1F4188298](@objc closure #1 in PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:), 0, 0);
  }
  else
  {
    uint64_t v8 = *(void *)(v6 + 56);
    unint64_t v7 = *(void *)(v6 + 64);
    uint64_t v9 = *(void **)(v6 + 24);

    outlined consume of Data?(v8, v7);
    swift_bridgeObjectRelease();
    if (a2 >> 60 == 15)
    {
      Class isa = 0;
    }
    else
    {
      Class isa = Data._bridgeToObjectiveC()().super.isa;
      outlined consume of Data?(a1, a2);
    }
    id v11 = *(void (***)(void, void, void))(v6 + 32);
    ((void (**)(void, Class, void))v11)[2](v11, isa, 0);

    _Block_release(v11);
    id v12 = *(uint64_t (**)(void))(v6 + 8);
    return v12();
  }
}

id PersonIdentityGenerator.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void PersonIdentityGenerator.init()()
{
}

id PersonIdentityGenerator.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t Digest.bytes.getter()
{
  uint64_t v0 = Digest.makeIterator()();
  uint64_t v2 = specialized _copySequenceToContiguousArray<A>(_:)(v0, v1);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t _sIeghH_IeAgH_TR(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = _sIeghH_IeAgH_TRTQ0_;
  return v6();
}

uint64_t _sIeAgH_ytIeAgHr_TR(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = _sIeghH_IeAgH_TRTQ0_;
  return v7();
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  outlined destroy of SymmetricKey??(a1, &demangling cache variable for type metadata for TaskPriority?);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TQ0_;
  return v6(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TQ0_()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  size_t v11;
  void *v12;

  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Endpoint>);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v12 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  void *v13;

  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Data>);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  void *v13;

  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<_NSRange>);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, unint64_t a4)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<SHA256Digest>, MEMORY[0x1E4F24F80], MEMORY[0x1E4F24F80]);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<P256.Signing.PublicKey>, MEMORY[0x1E4F250F8], MEMORY[0x1E4F250F8]);
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = _swift_stdlib_malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t _StringGuts._slowEnsureMatchingEncoding(_:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = String.UTF16View.index(_:offsetBy:)();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x19F3907B0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

{
  uint64_t *v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Endpoint>);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Endpoint);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    unint64_t v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<NodeIdentity>);
  uint64_t v10 = *(void *)(type metadata accessor for NodeIdentity(0) - 8);
  size_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  uint64_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  CGFloat v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for NodeIdentity(0) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  size_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  BOOL v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *specialized Data._Representation.withUnsafeMutableBytes<A>(_:)(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v1 = xmmword_19BED2640;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (__DataStorage._bytes.getter() && __OFSUB__((int)v4, __DataStorage._offset.getter())) {
        goto LABEL_24;
      }
      type metadata accessor for __DataStorage();
      swift_allocObject();
      uint64_t v13 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      uint64_t result = specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        uint64_t *v5 = v4;
        goto LABEL_19;
      }
      uint64_t *v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      Data.LargeSlice.ensureUniqueReference()();
      uint64_t result = specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        uint64_t *v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        uint64_t *v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        uint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      uint64_t *v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

unsigned char *closure #1 in Data.init<A>(_:)@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)specialized Data.InlineData.init(_:)(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)specialized Data.LargeSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)specialized Data.InlineSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t outlined consume of (keys: [P256.Signing.PublicKey], tps: Data)?(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    return outlined consume of Data._Representation(a2, a3);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SHA256Digest and conformance SHA256Digest()
{
  unint64_t result = lazy protocol witness table cache variable for type SHA256Digest and conformance SHA256Digest;
  if (!lazy protocol witness table cache variable for type SHA256Digest and conformance SHA256Digest)
  {
    type metadata accessor for SHA256Digest();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SHA256Digest and conformance SHA256Digest);
  }
  return result;
}

void *_sSw17withMemoryRebound2to_q0_xm_q0_SryxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_s5NeverOs16IndexingIteratorVySS8UTF8ViewVG_SitTgm5(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    unint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  unint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  unint64_t result = (char *)__DataStorage._bytes.getter();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  unint64_t result = (char *)__DataStorage._offset.getter();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = __DataStorage._length.getter();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  unint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, SWPersonIdentity>);
  char v38 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t specialized _NativeDictionary._delete(at:)(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v9 = Hasher._finalize()();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            void *v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  uint64_t *v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    specialized _NativeDictionary.copy()();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v15, a4 & 1);
  unint64_t v20 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;
  swift_bridgeObjectRetain();
}

id specialized _NativeDictionary.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, SWPersonIdentity>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t specialized closure #1 in closure #3 in Data.init<A>(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    id result = _StringGuts.copyUTF8(into:)();
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = result;
      id result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t specialized _copySequenceToContiguousArray<A>(_:)(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  char v3 = (void *)MEMORY[0x1E4FBC860];
  if (v2 != a2)
  {
    if (v2 > a2)
    {
      uint64_t v5 = a2;
      if (a2 < 0)
      {
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
      if (!v2)
      {
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      uint64_t v6 = result;
      id result = swift_bridgeObjectRetain();
      size_t v4 = 0;
      unint64_t v7 = v3 + 4;
      while (1)
      {
        char v8 = *(unsigned char *)(v6 + v5 + 32);
        if (!v4)
        {
          unint64_t v9 = v3[3];
          if ((uint64_t)((v9 >> 1) + 0x4000000000000000) < 0) {
            goto LABEL_29;
          }
          int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
          if (v10 <= 1) {
            uint64_t v11 = 1;
          }
          else {
            uint64_t v11 = v10;
          }
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
          unint64_t v12 = (void *)swift_allocObject();
          size_t v13 = 2 * _swift_stdlib_malloc_size(v12) - 64;
          v12[2] = v11;
          uint64_t v12[3] = v13;
          unint64_t v14 = (unint64_t)(v12 + 4);
          size_t v15 = v3[3] >> 1;
          if (v3[2])
          {
            if (v12 != v3 || v14 >= (unint64_t)v3 + v15 + 32) {
              memmove(v12 + 4, v3 + 4, v15);
            }
            v3[2] = 0;
          }
          unint64_t v7 = (unsigned char *)(v14 + v15);
          size_t v4 = (v13 >> 1) - v15;
          id result = swift_release();
          char v3 = v12;
        }
        BOOL v17 = __OFSUB__(v4--, 1);
        if (v17) {
          break;
        }
        ++v5;
        *v7++ = v8;
        if (v2 == v5)
        {
          id result = swift_bridgeObjectRelease();
          goto LABEL_24;
        }
      }
      __break(1u);
LABEL_29:
      __break(1u);
    }
    __break(1u);
    goto LABEL_31;
  }
  size_t v4 = 0;
LABEL_24:
  unint64_t v18 = v3[3];
  if (v18 < 2) {
    return (uint64_t)v3;
  }
  unint64_t v19 = v18 >> 1;
  BOOL v17 = __OFSUB__(v19, v4);
  unint64_t v20 = v19 - v4;
  if (!v17)
  {
    v3[2] = v20;
    return (uint64_t)v3;
  }
LABEL_33:
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type [UInt8] and conformance <A> [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [UInt8] and conformance <A> [A];
  if (!lazy protocol witness table cache variable for type [UInt8] and conformance <A> [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [UInt8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [UInt8] and conformance <A> [A]);
  }
  return result;
}

uint64_t specialized Data.InlineData.withUnsafeBytes<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  closure #1 in static Data.== infix(_:_:)((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t specialized __DataStorage.withUnsafeBytes<A>(in:apply:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = __DataStorage._bytes.getter();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  __DataStorage._length.getter();
  closure #1 in static Data.== infix(_:_:)(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t specialized static Data.== infix(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x19BEAE7B0);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  outlined copy of Data._Representation(a3, a4);
                  outlined copy of Data._Representation(a1, a2);
                  char v17 = specialized __DataStorage.withUnsafeBytes<A>(in:apply:)((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  outlined consume of Data._Representation(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  outlined copy of Data._Representation(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = specialized __DataStorage.withUnsafeBytes<A>(in:apply:)(v21, v22, v20, a3, a4);
                  outlined consume of Data._Representation(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  outlined copy of Data._Representation(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  outlined copy of Data._Representation(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = specialized Data.InlineData.withUnsafeBytes<A>(_:)(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              outlined consume of Data._Representation(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Endpoint);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized Sequence.compactMap<A>(_:)(uint64_t a1)
{
  uint64_t result = MEMORY[0x1E4FBC860];
  uint64_t v11 = MEMORY[0x1E4FBC860];
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = (unint64_t *)(a1 + 40);
    do
    {
      uint64_t v6 = *(v4 - 1);
      unint64_t v5 = *v4;
      outlined copy of Data._Representation(v6, *v4);
      CFDataRef isa = Data._bridgeToObjectiveC()().super.isa;
      CFDictionaryRef v8 = Dictionary._bridgeToObjectiveC()().super.isa;
      SecKeyRef v9 = SecKeyCreateWithData(isa, v8, 0);

      uint64_t v10 = outlined consume of Data._Representation(v6, v5);
      if (v9)
      {
        MEMORY[0x19F390820](v10);
        if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v11;
  }
  return result;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized Data.InlineData.init(_:)(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t specialized Data.LargeSlice.init(_:)(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t result = __DataStorage.init(bytes:length:)();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for Data.RangeReference();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t specialized Data.InlineSlice.init(_:)(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t result = __DataStorage.init(bytes:length:)();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

unsigned char *specialized Data._Representation.init(_:)(unsigned char *result, unsigned char *a2)
{
  if (result)
  {
    uint64_t v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (unsigned char *)specialized Data.InlineData.init(_:)(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)specialized Data.LargeSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)specialized Data.InlineSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t specialized Data._Representation.init(count:)(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      type metadata accessor for __DataStorage();
      swift_allocObject();
      __DataStorage.init(length:)();
      if (v1 >= 0x7FFFFFFF)
      {
        type metadata accessor for Data.RangeReference();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t specialized Data.init<A>(_:)(uint64_t a1)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt8]);
  unint64_t v10 = lazy protocol witness table accessor for type [UInt8] and conformance <A> [A]();
  v8[0] = a1;
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  uint64_t v3 = (unsigned char *)(*v2 + 32);
  uint64_t v4 = &v3[*(void *)(*v2 + 16)];
  swift_bridgeObjectRetain();
  closure #1 in Data.init<A>(_:)(v3, v4, &v7);
  uint64_t v5 = v7;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  return v5;
}

uint64_t specialized PersonIdentityGenerator.merkleTreeForPublicKeys(_:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for P256.Signing.PublicKey();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for NodeIdentity(0);
  uint64_t v22 = *(void *)(v6 - 8);
  uint64_t v23 = v6;
  MEMORY[0x1F4188790](v6);
  CFDictionaryRef v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = MEMORY[0x1E4FBC860];
  if (v9)
  {
    uint64_t v24 = MEMORY[0x1E4FBC860];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v9, 0);
    unint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v12 = v3 + 16;
    uint64_t v11 = v13;
    uint64_t v14 = a1 + ((*(unsigned __int8 *)(v12 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 64));
    uint64_t v20 = *(void *)(v12 + 56);
    uint64_t v21 = v12;
    uint64_t v15 = (void (**)(char *, uint64_t))(v12 - 8);
    do
    {
      v11(v5, v14, v2);
      v11(v8, (uint64_t)v5, v2);
      swift_storeEnumTagMultiPayload();
      (*v15)(v5, v2);
      uint64_t v10 = v24;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v10 + 16) + 1, 1);
        uint64_t v10 = v24;
      }
      unint64_t v17 = *(void *)(v10 + 16);
      unint64_t v16 = *(void *)(v10 + 24);
      if (v17 >= v16 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v16 > 1, v17 + 1, 1);
        uint64_t v10 = v24;
      }
      *(void *)(v10 + 16) = v17 + 1;
      outlined init with take of NodeIdentity((uint64_t)v8, v10+ ((*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80))+ *(void *)(v22 + 72) * v17);
      v14 += v20;
      --v9;
    }
    while (v9);
  }
  type metadata accessor for MerkleTree();
  swift_allocObject();
  return MerkleTree.init(nodeIdentities:)(v10);
}

unint64_t lazy protocol witness table accessor for type PersonIdentityGenerator.GenerationErrors and conformance PersonIdentityGenerator.GenerationErrors()
{
  unint64_t result = lazy protocol witness table cache variable for type PersonIdentityGenerator.GenerationErrors and conformance PersonIdentityGenerator.GenerationErrors;
  if (!lazy protocol witness table cache variable for type PersonIdentityGenerator.GenerationErrors and conformance PersonIdentityGenerator.GenerationErrors)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PersonIdentityGenerator.GenerationErrors and conformance PersonIdentityGenerator.GenerationErrors);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PersonIdentityGenerator.GenerationErrors and conformance PersonIdentityGenerator.GenerationErrors;
  if (!lazy protocol witness table cache variable for type PersonIdentityGenerator.GenerationErrors and conformance PersonIdentityGenerator.GenerationErrors)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PersonIdentityGenerator.GenerationErrors and conformance PersonIdentityGenerator.GenerationErrors);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PersonIdentityGenerator.GenerationErrors(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PersonIdentityGenerator.GenerationErrors(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x19BEAF58CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *destructiveInjectEnumTag for PersonIdentityGenerator.GenerationErrors(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PersonIdentityGenerator.GenerationErrors()
{
  return &type metadata for PersonIdentityGenerator.GenerationErrors;
}

uint64_t type metadata accessor for PersonIdentityGenerator()
{
  return self;
}

uint64_t method lookup function for PersonIdentityGenerator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PersonIdentityGenerator);
}

uint64_t dispatch thunk of PersonIdentityGenerator.__allocating_init(queue:keyQueryController:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_19BEAF620()
{
  _Block_release(*(const void **)(v0 + 40));
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t partial apply for @objc closure #1 in PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:)()
{
  int v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  unsigned int v4 = (void *)v0[4];
  uint64_t v5 = (void *)v0[5];
  unsigned int v6 = (void *)v0[6];
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *BOOL v7 = v1;
  v7[1] = _sIeghH_IeAgH_TRTQ0_;
  int v8 = (uint64_t (*)(void *, int, void *, void *, void *))((char *)&async function pointer to @objc closure #1 in PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:)
                                                                   + async function pointer to @objc closure #1 in PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:));
  return v8(v2, v3, v4, v5, v6);
}

uint64_t _sIeghH_IeAgH_TRTA()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  unsigned int v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = _sIeghH_IeAgH_TRTQ0_;
  unsigned int v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&_sIeghH_IeAgH_TRTu + _sIeghH_IeAgH_TRTu);
  return v6(v2, v3, v4);
}

uint64_t _sIeAgH_ytIeAgHr_TRTA(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unsigned int v6 = (int *)v1[4];
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *BOOL v7 = v2;
  v7[1] = _sIeghH_IeAgH_TRTQ0_;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&_sIeAgH_ytIeAgHr_TRTu + _sIeAgH_ytIeAgHr_TRTu);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_19BEAF8D4()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TA(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = dispatch thunk of KeyQueryController.localPublicKey();
  unsigned int v6 = (uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5Tu
                                              + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5Tu);
  return v6(a1, v4);
}

uint64_t partial apply for @objc closure #1 in PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:)()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *unsigned int v6 = v1;
  v6[1] = _sIeghH_IeAgH_TRTQ0_;
  BOOL v7 = (uint64_t (*)(void *, int, void *, void *))((char *)&async function pointer to @objc closure #1 in PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:)
                                                           + async function pointer to @objc closure #1 in PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:));
  return v7(v2, v3, v5, v4);
}

uint64_t sub_19BEAFA90()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t partial apply for @objc closure #1 in PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:)()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = dispatch thunk of KeyQueryController.localPublicKey();
  unsigned int v6 = (uint64_t (*)(int, void *, void *))((char *)&async function pointer to @objc closure #1 in PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:)
                                                   + async function pointer to @objc closure #1 in PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:));
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_35Tm()
{
  _Block_release(*(const void **)(v0 + 32));
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t partial apply for @objc closure #1 in PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:)()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *unsigned int v6 = v1;
  v6[1] = _sIeghH_IeAgH_TRTQ0_;
  BOOL v7 = (uint64_t (*)(int, int, void *, void *))((char *)&async function pointer to @objc closure #1 in PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:)
                                                        + async function pointer to @objc closure #1 in PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:));
  return v7(v2, v3, v5, v4);
}

uint64_t objectdestroy_19Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

char *specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    BOOL v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  unint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *partial apply for specialized closure #3 in Data.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  unint64_t result = _sSw17withMemoryRebound2to_q0_xm_q0_SryxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_s5NeverOs16IndexingIteratorVySS8UTF8ViewVG_SitTgm5((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))partial apply for specialized closure #1 in closure #3 in Data.init<A>(_:), (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t partial apply for specialized closure #1 in closure #3 in Data.init<A>(_:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return specialized closure #1 in closure #3 in Data.init<A>(_:)(a1, a2);
}

void GenericPasswordStore.storeKey<A>(_:account:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19BED21E0;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v9;
  if (one-time initialization token for KeychainAccessGroup != -1) {
    swift_once();
  }
  uint64_t countAndFlagsBits = KeychainAccessGroup._countAndFlagsBits;
  object = KeychainAccessGroup._object;
  uint64_t v12 = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 72) = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 48) = countAndFlagsBits;
  *(void *)(inited + 56) = object;
  *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 88) = v13;
  uint64_t v14 = (void *)*MEMORY[0x1E4F3B988];
  type metadata accessor for CFStringRef(0);
  uint64_t v16 = v15;
  *(void *)(inited + 120) = v15;
  *(void *)(inited + 96) = v14;
  *(void *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 136) = v17;
  *(void *)(inited + 168) = v12;
  *(void *)(inited + 144) = a2;
  *(void *)(inited + 152) = a3;
  *(void *)(inited + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 184) = v18;
  uint64_t v19 = (void *)*MEMORY[0x1E4F3B570];
  *(void *)(inited + 216) = v16;
  *(void *)(inited + 192) = v19;
  *(void *)(inited + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 232) = v20;
  *(void *)(inited + 264) = MEMORY[0x1E4FBB390];
  *(unsigned char *)(inited + 240) = 1;
  *(void *)(inited + 272) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 280) = v21;
  uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t))(a5 + 24);
  swift_bridgeObjectRetain();
  id v23 = v14;
  swift_bridgeObjectRetain();
  id v24 = v19;
  uint64_t v25 = v22(a4, a5);
  *(void *)(inited + 312) = MEMORY[0x1E4F277C0];
  *(void *)(inited + 288) = v25;
  *(void *)(inited + 296) = v26;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  CFDictionaryRef isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  OSStatus v28 = SecItemAdd(isa, 0);

  if (v28)
  {
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    CFStringRef v29 = SecCopyErrorMessageString(v28, 0);
    if (v29)
    {
      uint64_t v30 = (__CFString *)v29;
      uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      id v33 = v32;
    }
    else
    {
      uint64_t v31 = dispatch thunk of CustomStringConvertible.description.getter();
      id v33 = v34;
    }
    v35._uint64_t countAndFlagsBits = v31;
    v35._object = v33;
    String.append(_:)(v35);
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type GenericPasswordStoreError and conformance GenericPasswordStoreError();
    swift_allocError();
    *int64_t v36 = 0xD000000000000016;
    v36[1] = 0x800000019BEDA490;
    swift_willThrow();
  }
}

uint64_t GenericPasswordStore.readKey<A>(account:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  result[35] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19BED21D0;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v10;
  if (one-time initialization token for KeychainAccessGroup != -1) {
    swift_once();
  }
  uint64_t countAndFlagsBits = KeychainAccessGroup._countAndFlagsBits;
  object = KeychainAccessGroup._object;
  uint64_t v13 = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 72) = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 48) = countAndFlagsBits;
  *(void *)(inited + 56) = object;
  *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 88) = v14;
  uint64_t v15 = (void *)*MEMORY[0x1E4F3B988];
  type metadata accessor for CFStringRef(0);
  *(void *)(inited + 120) = v16;
  *(void *)(inited + 96) = v15;
  *(void *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 136) = v17;
  *(void *)(inited + 168) = v13;
  *(void *)(inited + 144) = a1;
  *(void *)(inited + 152) = a2;
  *(void *)(inited + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 184) = v18;
  uint64_t v19 = MEMORY[0x1E4FBB390];
  *(void *)(inited + 216) = MEMORY[0x1E4FBB390];
  *(unsigned char *)(inited + 192) = 1;
  *(void *)(inited + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 232) = v20;
  *(void *)(inited + 264) = v19;
  *(unsigned char *)(inited + 240) = 1;
  swift_bridgeObjectRetain();
  id v21 = v15;
  swift_bridgeObjectRetain();
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  result[0] = 0;
  CFDictionaryRef isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  OSStatus v23 = SecItemCopyMatching(isa, result);

  if (v23 == -25300) {
    goto LABEL_9;
  }
  if (!v23)
  {
    if (result[0])
    {
      swift_unknownObjectRetain();
      if (swift_dynamicCast())
      {
        (*(void (**)(long long *, void, void, uint64_t))(a4 + 16))(&v35, MEMORY[0x1E4F277C0], MEMORY[0x1E4F277B0], a3);
        if (!v5) {
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(a5, 0, 1, a3);
        }
        return swift_unknownObjectRelease();
      }
    }
LABEL_9:
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(a5, 1, 1, a3);
    return swift_unknownObjectRelease();
  }
  _StringGuts.grow(_:)(24);
  swift_bridgeObjectRelease();
  *(void *)&long long v35 = 0xD000000000000016;
  *((void *)&v35 + 1) = 0x800000019BEDA4B0;
  CFStringRef v24 = SecCopyErrorMessageString(v23, 0);
  if (v24)
  {
    uint64_t v25 = (__CFString *)v24;
    uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    OSStatus v28 = v27;
  }
  else
  {
    uint64_t v26 = dispatch thunk of CustomStringConvertible.description.getter();
    OSStatus v28 = v29;
  }
  v30._uint64_t countAndFlagsBits = v26;
  v30._object = v28;
  String.append(_:)(v30);
  swift_bridgeObjectRelease();
  lazy protocol witness table accessor for type GenericPasswordStoreError and conformance GenericPasswordStoreError();
  swift_allocError();
  *uint64_t v31 = v35;
  swift_willThrow();
  return swift_unknownObjectRelease();
}

void one-time initialization function for KeychainAccessGroup()
{
  BYTE5(KeychainAccessGroup._object) = 0;
  HIWORD(KeychainAccessGroup._object) = -5120;
}

Swift::String *KeychainAccessGroup.unsafeMutableAddressor()
{
  if (one-time initialization token for KeychainAccessGroup != -1) {
    swift_once();
  }
  return &KeychainAccessGroup;
}

uint64_t GenericPasswordStoreError.message.getter(uint64_t a1)
{
  return a1;
}

uint64_t GenericPasswordStoreError.message.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*GenericPasswordStoreError.message.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t GenericPasswordStoreError.description.getter(uint64_t a1)
{
  return a1;
}

uint64_t Int32.message.getter(OSStatus a1)
{
  CFStringRef v1 = SecCopyErrorMessageString(a1, 0);
  if (!v1) {
    return dispatch thunk of CustomStringConvertible.description.getter();
  }
  uint64_t v2 = (__CFString *)v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> GenericPasswordStore.deleteKey(account:)(Swift::String account)
{
  object = account._object;
  uint64_t countAndFlagsBits = account._countAndFlagsBits;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19BED1BD0;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v4;
  uint64_t v5 = (void *)*MEMORY[0x1E4F3B988];
  type metadata accessor for CFStringRef(0);
  *(void *)(inited + 72) = v6;
  *(void *)(inited + 48) = v5;
  *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 88) = v7;
  *(void *)(inited + 120) = MEMORY[0x1E4FBB390];
  *(unsigned char *)(inited + 96) = 1;
  *(void *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 136) = v8;
  *(void *)(inited + 168) = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 144) = countAndFlagsBits;
  *(void *)(inited + 152) = object;
  id v9 = v5;
  swift_bridgeObjectRetain();
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  CFDictionaryRef isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  OSStatus v11 = SecItemDelete(isa);

  if (v11 != -25300 && v11)
  {
    _StringGuts.grow(_:)(29);
    swift_bridgeObjectRelease();
    CFStringRef v12 = SecCopyErrorMessageString(v11, 0);
    if (v12)
    {
      uint64_t v13 = (__CFString *)v12;
      uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v16 = v15;
    }
    else
    {
      uint64_t v14 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v16 = v17;
    }
    v18._uint64_t countAndFlagsBits = v14;
    v18._object = v16;
    String.append(_:)(v18);
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type GenericPasswordStoreError and conformance GenericPasswordStoreError();
    swift_allocError();
    *uint64_t v19 = 0xD00000000000001BLL;
    v19[1] = 0x800000019BEDA930;
    swift_willThrow();
  }
}

ValueMetadata *type metadata accessor for GenericPasswordStoreError()
{
  return &type metadata for GenericPasswordStoreError;
}

ValueMetadata *type metadata accessor for GenericPasswordStore()
{
  return &type metadata for GenericPasswordStore;
}

uint64_t SLLocString(key:localization:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Locale();
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v3 = type metadata accessor for String.LocalizationValue();
  MEMORY[0x1F4188790](v3);
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  id v6 = SLFrameworkBundle();
  swift_bridgeObjectRetain();
  static Locale.current.getter();
  return String.init(localized:table:bundle:localization:locale:comment:)();
}

BOOL static AttributionTextPrefix.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void AttributionTextPrefix.hash(into:)(uint64_t a1, char a2)
{
}

Swift::Int AttributionTextPrefix.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

void *HighlightPillSenderNameAttribute.name.unsafeMutableAddressor()
{
  return &static HighlightPillSenderNameAttribute.name;
}

unint64_t static HighlightPillSenderNameAttribute.name.getter()
{
  return 0xD000000000000017;
}

uint64_t protocol witness for static DecodableAttributedStringKey.decode(from:) in conformance HighlightPillSenderNameAttribute()
{
  return static DecodableAttributedStringKey<>.decode(from:)();
}

uint64_t protocol witness for static EncodableAttributedStringKey.encode(_:to:) in conformance HighlightPillSenderNameAttribute()
{
  return static EncodableAttributedStringKey<>.encode(_:to:)();
}

uint64_t protocol witness for static MarkdownDecodableAttributedStringKey.decodeMarkdown(from:) in conformance HighlightPillSenderNameAttribute()
{
  return static MarkdownDecodableAttributedStringKey<>.decodeMarkdown(from:)();
}

uint64_t protocol witness for static MarkdownDecodableAttributedStringKey.markdownName.getter in conformance HighlightPillSenderNameAttribute()
{
  return MEMORY[0x1F40E4860]();
}

unint64_t protocol witness for static AttributedStringKey.name.getter in conformance HighlightPillSenderNameAttribute()
{
  return 0xD000000000000017;
}

uint64_t protocol witness for static AttributedStringKey.runBoundaries.getter in conformance HighlightPillSenderNameAttribute()
{
  return MEMORY[0x1F40E4140]();
}

uint64_t protocol witness for static AttributedStringKey.inheritedByAddedText.getter in conformance HighlightPillSenderNameAttribute()
{
  return MEMORY[0x1F40E4150]();
}

uint64_t protocol witness for static AttributedStringKey.invalidationConditions.getter in conformance HighlightPillSenderNameAttribute()
{
  return MEMORY[0x1F40E4160]();
}

void *HighlightPillNumContactsAttribute.name.unsafeMutableAddressor()
{
  return &static HighlightPillNumContactsAttribute.name;
}

unint64_t static HighlightPillNumContactsAttribute.name.getter()
{
  return 0xD000000000000018;
}

uint64_t protocol witness for static MarkdownDecodableAttributedStringKey.decodeMarkdown(from:) in conformance HighlightPillNumContactsAttribute()
{
  return static MarkdownDecodableAttributedStringKey<>.decodeMarkdown(from:)();
}

unint64_t protocol witness for static AttributedStringKey.name.getter in conformance HighlightPillNumContactsAttribute()
{
  return 0xD000000000000018;
}

void *HighlightPillListOfNamesAttribute.name.unsafeMutableAddressor()
{
  return &static HighlightPillListOfNamesAttribute.name;
}

unint64_t static HighlightPillListOfNamesAttribute.name.getter()
{
  return 0xD000000000000022;
}

uint64_t protocol witness for static MarkdownDecodableAttributedStringKey.decodeMarkdown(from:) in conformance HighlightPillListOfNamesAttribute()
{
  return static MarkdownDecodableAttributedStringKey<>.decodeMarkdown(from:)();
}

unint64_t protocol witness for static AttributedStringKey.name.getter in conformance HighlightPillListOfNamesAttribute()
{
  return 0xD000000000000022;
}

uint64_t one-time initialization function for senderName()
{
  uint64_t result = MEMORY[0x19F3906A0](0xD000000000000017, 0x800000019BEDA950);
  static NSAttributedStringKey.senderName = result;
  return result;
}

uint64_t *NSAttributedStringKey.senderName.unsafeMutableAddressor()
{
  if (one-time initialization token for senderName != -1) {
    swift_once();
  }
  return &static NSAttributedStringKey.senderName;
}

id static NSAttributedStringKey.senderName.getter()
{
  return static NSAttributedStringKey.senderName.getter(&one-time initialization token for senderName, (void **)&static NSAttributedStringKey.senderName);
}

uint64_t one-time initialization function for numContacts()
{
  uint64_t result = MEMORY[0x19F3906A0](0xD000000000000018, 0x800000019BEDA970);
  static NSAttributedStringKey.numContacts = result;
  return result;
}

uint64_t *NSAttributedStringKey.numContacts.unsafeMutableAddressor()
{
  if (one-time initialization token for numContacts != -1) {
    swift_once();
  }
  return &static NSAttributedStringKey.numContacts;
}

id static NSAttributedStringKey.numContacts.getter()
{
  return static NSAttributedStringKey.senderName.getter(&one-time initialization token for numContacts, (void **)&static NSAttributedStringKey.numContacts);
}

uint64_t one-time initialization function for listOfNames()
{
  uint64_t result = MEMORY[0x19F3906A0](0xD000000000000022, 0x800000019BEDA990);
  static NSAttributedStringKey.listOfNames = result;
  return result;
}

uint64_t *NSAttributedStringKey.listOfNames.unsafeMutableAddressor()
{
  if (one-time initialization token for listOfNames != -1) {
    swift_once();
  }
  return &static NSAttributedStringKey.listOfNames;
}

id static NSAttributedStringKey.listOfNames.getter()
{
  return static NSAttributedStringKey.senderName.getter(&one-time initialization token for listOfNames, (void **)&static NSAttributedStringKey.listOfNames);
}

id static NSAttributedStringKey.senderName.getter(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  return v3;
}

uint64_t AttributeScopes.HighlightPillAttributes.foundation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AttributeScopes.FoundationAttributes();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

void protocol witness for static DecodingConfigurationProviding.decodingConfiguration.getter in conformance AttributeScopes.HighlightPillAttributes()
{
  lazy protocol witness table accessor for type AttributedString.FormattingOptions and conformance AttributedString.FormattingOptions(&lazy protocol witness table cache variable for type AttributeScopes.HighlightPillAttributes and conformance AttributeScopes.HighlightPillAttributes, (void (*)(uint64_t))type metadata accessor for AttributeScopes.HighlightPillAttributes);
  JUMPOUT(0x19F3900C0);
}

void protocol witness for static EncodingConfigurationProviding.encodingConfiguration.getter in conformance AttributeScopes.HighlightPillAttributes()
{
  lazy protocol witness table accessor for type AttributedString.FormattingOptions and conformance AttributedString.FormattingOptions(&lazy protocol witness table cache variable for type AttributeScopes.HighlightPillAttributes and conformance AttributeScopes.HighlightPillAttributes, (void (*)(uint64_t))type metadata accessor for AttributeScopes.HighlightPillAttributes);
  JUMPOUT(0x19F3900D0);
}

uint64_t SLLocAttributedString(key:localization:)(uint64_t a1, uint64_t a2)
{
  v13[1] = a2;
  uint64_t v3 = type metadata accessor for AttributedString.FormattingOptions();
  MEMORY[0x1F4188790](v3);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  MEMORY[0x1F4188790](v4 - 8);
  id v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for String.LocalizationValue();
  MEMORY[0x1F4188790](v7);
  (*(void (**)(char *, uint64_t))(v9 + 16))((char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  id v10 = SLFrameworkBundle();
  uint64_t v11 = type metadata accessor for Locale();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 1, 1, v11);
  swift_getKeyPath();
  v13[3] = MEMORY[0x1E4FBC860];
  lazy protocol witness table accessor for type AttributedString.FormattingOptions and conformance AttributedString.FormattingOptions(&lazy protocol witness table cache variable for type AttributedString.FormattingOptions and conformance AttributedString.FormattingOptions, MEMORY[0x1E4F27298]);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AttributedString.FormattingOptions]);
  lazy protocol witness table accessor for type [AttributedString.FormattingOptions] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  type metadata accessor for AttributeScopes.HighlightPillAttributes();
  lazy protocol witness table accessor for type AttributedString.FormattingOptions and conformance AttributedString.FormattingOptions(&lazy protocol witness table cache variable for type AttributeScopes.HighlightPillAttributes and conformance AttributeScopes.HighlightPillAttributes, (void (*)(uint64_t))type metadata accessor for AttributeScopes.HighlightPillAttributes);
  return AttributedString.init<A>(localized:options:table:bundle:localization:locale:comment:including:)();
}

uint64_t sub_19BEB1444@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = type metadata accessor for AttributeScopes.HighlightPillAttributes();
  *a1 = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type [AttributedString.FormattingOptions] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [AttributedString.FormattingOptions] and conformance [A];
  if (!lazy protocol witness table cache variable for type [AttributedString.FormattingOptions] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [AttributedString.FormattingOptions]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [AttributedString.FormattingOptions] and conformance [A]);
  }
  return result;
}

uint64_t type metadata accessor for AttributeScopes.HighlightPillAttributes()
{
  uint64_t result = type metadata singleton initialization cache for AttributeScopes.HighlightPillAttributes;
  if (!type metadata singleton initialization cache for AttributeScopes.HighlightPillAttributes) {
    return swift_getSingletonMetadata();
  }
  return result;
}

Swift::tuple_localizedString_NSMutableAttributedString_baseFontTargetRanges_OpaquePointer_senderFontTargetRanges_OpaquePointer __swiftcall MeAttributionLocAttributedString(prefix:multiline:localization:)(SocialLayer::AttributionTextPrefix prefix, Swift::Bool multiline, Swift::String_optional localization)
{
  object = (void (**)(char *, void))localization.value._object;
  uint64_t countAndFlagsBits = localization.value._countAndFlagsBits;
  uint64_t v4 = type metadata accessor for String.LocalizationValue();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AttributedString();
  uint64_t v9 = *(void (***)(char *, char *, void))(v8 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  CFStringRef v12 = (char *)&aBlock[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x1F4188790](v10);
  uint64_t v15 = (char *)&aBlock[-1] - v14;
  uint64_t v16 = MEMORY[0x1F4188790](v13);
  Swift::String v18 = (char *)&aBlock[-1] - v17;
  uint64_t v19 = v16;
  String.LocalizationValue.init(stringLiteral:)();
  SLLocAttributedString(key:localization:)((uint64_t)v7, countAndFlagsBits);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  id v20 = (id)type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSMutableAttributedString);
  object = (void (**)(char *, void))v9;
  v9[2](v15, v18, v19);
  swift_getKeyPath();
  type metadata accessor for AttributeScopes.HighlightPillAttributes();
  lazy protocol witness table accessor for type AttributedString.FormattingOptions and conformance AttributedString.FormattingOptions(&lazy protocol witness table cache variable for type AttributeScopes.HighlightPillAttributes and conformance AttributeScopes.HighlightPillAttributes, (void (*)(uint64_t))type metadata accessor for AttributeScopes.HighlightPillAttributes);
  id v21 = NSAttributedString.init<A>(_:including:)();
  unint64_t v22 = (unint64_t)objc_msgSend(v21, sel_length);
  if ((v22 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    CFStringRef v12 = (char *)v22;
    int64_t v36 = (void *)MEMORY[0x1E4FBC860];
    uint64_t v37 = (void *)MEMORY[0x1E4FBC860];
    uint64_t v23 = one-time initialization token for senderName;
    id v20 = v21;
    if (v23 == -1) {
      goto LABEL_3;
    }
  }
  swift_once();
LABEL_3:
  uint64_t v24 = static NSAttributedStringKey.senderName;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = &v36;
  *(void *)(v25 + 24) = &v37;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = partial apply for closure #1 in MeAttributionLocAttributedString(prefix:multiline:localization:);
  *(void *)(v26 + 24) = v25;
  aBlock[4] = partial apply for thunk for @callee_guaranteed (@in_guaranteed Any?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  aBlock[5] = v26;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@in_guaranteed Any?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  aBlock[3] = &block_descriptor_1;
  BOOL v27 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v20, sel_enumerateAttribute_inRange_options_usingBlock_, v24, 0, v12, 0, v27);
  _Block_release(v27);

  object[1](v18, v19);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  CFStringRef v29 = (objc_class *)swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    id v33 = v36;
    uint64_t v32 = v37;
    swift_release();
    CFStringRef v29 = (objc_class *)v20;
    Swift::String v30 = v32;
    uint64_t v31 = v33;
  }
  result.senderFontTargetRanges._rawValue = v31;
  result.baseFontTargetRanges._rawValue = v30;
  result.localizedString.super.super.CFDictionaryRef isa = v29;
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed Any?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void (**)(long long *, uint64_t, uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    *((void *)&v12 + 1) = swift_getObjectType();
    *(void *)&long long v11 = a2;
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }
  swift_unknownObjectRetain();
  v9(&v11, a3, a4, a5);
  return outlined destroy of Any?((uint64_t)&v11);
}

Swift::tuple_localizedString_NSMutableAttributedString_baseFontTargetRanges_OpaquePointer_senderFontTargetRanges_OpaquePointer __swiftcall NameAttributionLocAttributedString(prefix:name:multiline:localization:)(SocialLayer::AttributionTextPrefix prefix, Swift::String name, Swift::Bool multiline, Swift::String_optional localization)
{
  Swift::String_optional v45 = localization;
  Swift::String v43 = name;
  uint64_t v44 = type metadata accessor for String.LocalizationValue();
  uint64_t v6 = *(void *)(v44 - 8);
  MEMORY[0x1F4188790](v44);
  uint64_t v8 = (char *)v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for String.LocalizationValue.StringInterpolation();
  uint64_t v10 = MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  MEMORY[0x1F4188790](v12);
  uint64_t v13 = type metadata accessor for AttributedString();
  uint64_t v46 = *(void *)(v13 - 8);
  uint64_t v47 = v13;
  uint64_t v14 = MEMORY[0x1F4188790](v13);
  v42[1] = (char *)v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  Swift::String v18 = (char *)v42 - v17;
  MEMORY[0x1F4188790](v16);
  id v20 = (char *)v42 - v19;
  id v21 = (void (**)(char *, uint64_t))(v6 + 8);
  if (prefix)
  {
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
    if (multiline)
    {
      uint64_t v22 = 0x3E72623C68746957;
      unint64_t v23 = 0xEA00000000005B5ELL;
    }
    else
    {
      uint64_t v22 = 0x5B5E2068746957;
      unint64_t v23 = 0xE700000000000000;
    }
  }
  else
  {
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
    if (multiline)
    {
      uint64_t v22 = 0x3E72623C6D6F7246;
      unint64_t v23 = 0xEA00000000005B5ELL;
    }
    else
    {
      uint64_t v22 = 0x5B5E206D6F7246;
      unint64_t v23 = 0xE700000000000000;
    }
  }
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v22);
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v43);
  v24._object = (void *)0x800000019BEDAAA0;
  v24._uint64_t countAndFlagsBits = 0xD000000000000020;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v24);
  String.LocalizationValue.init(stringInterpolation:)();
  SLLocAttributedString(key:localization:)((uint64_t)v8, v45.value._countAndFlagsBits);
  (*v21)(v8, v44);
  id v25 = (id)type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSMutableAttributedString);
  uint64_t v27 = v46;
  uint64_t v26 = v47;
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v18, v20, v47);
  swift_getKeyPath();
  uint64_t v28 = type metadata accessor for AttributeScopes.HighlightPillAttributes();
  lazy protocol witness table accessor for type AttributedString.FormattingOptions and conformance AttributedString.FormattingOptions(&lazy protocol witness table cache variable for type AttributeScopes.HighlightPillAttributes and conformance AttributeScopes.HighlightPillAttributes, (void (*)(uint64_t))type metadata accessor for AttributeScopes.HighlightPillAttributes);
  CFStringRef v29 = NSAttributedString.init<A>(_:including:)();
  uint64_t v30 = (uint64_t)objc_msgSend(v29, sel_length);
  if (v30 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v28 = v30;
    uint64_t v49 = (void *)MEMORY[0x1E4FBC860];
    unint64_t v50 = (void *)MEMORY[0x1E4FBC860];
    uint64_t v31 = one-time initialization token for senderName;
    id v25 = v29;
    if (v31 == -1) {
      goto LABEL_10;
    }
  }
  swift_once();
LABEL_10:
  uint64_t v32 = static NSAttributedStringKey.senderName;
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = &v49;
  *(void *)(v33 + 24) = &v50;
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = partial apply for closure #1 in NameAttributionLocAttributedString(prefix:name:multiline:localization:);
  *(void *)(v34 + 24) = v33;
  aBlock[4] = thunk for @callee_guaranteed (@in_guaranteed Any?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ()partial apply;
  aBlock[5] = v34;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@in_guaranteed Any?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  aBlock[3] = &block_descriptor_13;
  long long v35 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v25, sel_enumerateAttribute_inRange_options_usingBlock_, v32, 0, v28, 0, v35);
  _Block_release(v35);

  (*(void (**)(char *, uint64_t))(v27 + 8))(v20, v26);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t v37 = (objc_class *)swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    unint64_t v41 = v49;
    uint64_t v40 = v50;
    swift_release();
    uint64_t v37 = (objc_class *)v25;
    char v38 = v40;
    uint64_t v39 = v41;
  }
  result.senderFontTargetRanges._rawValue = v39;
  result.baseFontTargetRanges._rawValue = v38;
  result.localizedString.super.super.CFDictionaryRef isa = v37;
  return result;
}

Swift::tuple_localizedString_NSMutableAttributedString_baseFontTargetRanges_OpaquePointer_senderFontTargetRanges_OpaquePointer __swiftcall NumContactsAttributionLocAttributedString(prefix:numContacts:multiline:localization:)(SocialLayer::AttributionTextPrefix prefix, Swift::Int numContacts, Swift::Bool multiline, Swift::String_optional localization)
{
  object = localization.value._object;
  uint64_t countAndFlagsBits = localization.value._countAndFlagsBits;
  int v64 = prefix;
  BOOL v65 = multiline;
  Swift::Int v63 = numContacts;
  uint64_t v6 = type metadata accessor for String.LocalizationValue.StringInterpolation();
  uint64_t v7 = MEMORY[0x1F4188790](v6 - 8);
  v62[3] = (char *)v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  v62[2] = (char *)v62 - v10;
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  v62[1] = (char *)v62 - v12;
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = type metadata accessor for AttributedString();
  uint64_t v69 = *(void *)(v13 - 8);
  uint64_t v70 = v13;
  uint64_t v14 = MEMORY[0x1F4188790](v13);
  v62[4] = (char *)v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  id v66 = (char *)v62 - v17;
  MEMORY[0x1F4188790](v16);
  uint64_t v71 = (char *)v62 - v18;
  uint64_t v19 = type metadata accessor for Locale();
  MEMORY[0x1F4188790](v19 - 8);
  uint64_t v20 = type metadata accessor for String.LocalizationValue();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = MEMORY[0x1F4188790](v20);
  Swift::String v24 = (char *)v62 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x1F4188790](v22);
  uint64_t v27 = (char *)v62 - v26;
  MEMORY[0x1F4188790](v25);
  CFStringRef v29 = (char *)v62 - v28;
  String.LocalizationValue.init(stringLiteral:)();
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v27, v29, v20);
  id v30 = SLFrameworkBundle();
  swift_bridgeObjectRetain();
  static Locale.current.getter();
  uint64_t v67 = countAndFlagsBits;
  uint64_t v68 = object;
  String.init(localized:table:bundle:localization:locale:comment:)();
  uint64_t v31 = *(void (**)(char *, uint64_t))(v21 + 8);
  v31(v29, v20);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  uint64_t v32 = swift_allocObject();
  uint64_t v33 = MEMORY[0x1E4FBB550];
  *(_OWORD *)(v32 + 16) = xmmword_19BED1BC0;
  uint64_t v34 = MEMORY[0x1E4FBB5C8];
  *(void *)(v32 + 56) = v33;
  *(void *)(v32 + 64) = v34;
  *(void *)(v32 + 32) = v63;
  uint64_t v35 = static String.localizedStringWithFormat(_:_:)();
  uint64_t v37 = v36;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v64)
  {
    if (v65)
    {
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      unsigned int v38 = 1752459607;
      goto LABEL_6;
    }
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
    unsigned int v41 = 1752459607;
  }
  else
  {
    if (v65)
    {
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      unsigned int v38 = 1836020294;
LABEL_6:
      uint64_t v39 = v38 | 0x3E72623C00000000;
      unint64_t v40 = 0xEA00000000005B5ELL;
      goto LABEL_10;
    }
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
    unsigned int v41 = 1836020294;
  }
  uint64_t v39 = v41 | 0x5B5E2000000000;
  unint64_t v40 = 0xE700000000000000;
LABEL_10:
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v39);
  uint64_t v42 = v69;
  Swift::String v43 = v71;
  v44._uint64_t countAndFlagsBits = v35;
  v44._object = v37;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v44);
  swift_bridgeObjectRelease();
  v45._uint64_t countAndFlagsBits = 0xD000000000000021;
  v45._object = (void *)0x800000019BEDAAD0;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v45);
  String.LocalizationValue.init(stringInterpolation:)();
  SLLocAttributedString(key:localization:)((uint64_t)v24, v67);
  v31(v24, v20);
  id v46 = (id)type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSMutableAttributedString);
  uint64_t v47 = v70;
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v66, v43, v70);
  swift_getKeyPath();
  type metadata accessor for AttributeScopes.HighlightPillAttributes();
  lazy protocol witness table accessor for type AttributedString.FormattingOptions and conformance AttributedString.FormattingOptions(&lazy protocol witness table cache variable for type AttributeScopes.HighlightPillAttributes and conformance AttributeScopes.HighlightPillAttributes, (void (*)(uint64_t))type metadata accessor for AttributeScopes.HighlightPillAttributes);
  unint64_t v48 = 0;
  uint64_t v49 = NSAttributedString.init<A>(_:including:)();
  unint64_t v50 = (unint64_t)objc_msgSend(v49, sel_length);
  if ((v50 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v48 = v50;
    unint64_t v73 = (void *)MEMORY[0x1E4FBC860];
    uint64_t v74 = (void *)MEMORY[0x1E4FBC860];
    uint64_t v51 = one-time initialization token for numContacts;
    id v46 = v49;
    if (v51 == -1) {
      goto LABEL_12;
    }
  }
  swift_once();
LABEL_12:
  uint64_t v52 = static NSAttributedStringKey.numContacts;
  uint64_t v53 = swift_allocObject();
  *(void *)(v53 + 16) = &v73;
  *(void *)(v53 + 24) = &v74;
  uint64_t v54 = swift_allocObject();
  *(void *)(v54 + 16) = partial apply for closure #1 in NameAttributionLocAttributedString(prefix:name:multiline:localization:);
  *(void *)(v54 + 24) = v53;
  aBlock[4] = thunk for @callee_guaranteed (@in_guaranteed Any?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ()partial apply;
  aBlock[5] = v54;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@in_guaranteed Any?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  aBlock[3] = &block_descriptor_23_0;
  id v55 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v46, sel_enumerateAttribute_inRange_options_usingBlock_, v52, 0, v48, 0, v55);
  _Block_release(v55);

  (*(void (**)(char *, uint64_t))(v42 + 8))(v71, v47);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  unint64_t v57 = (objc_class *)swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    os_log_type_t v61 = v73;
    uint64_t v60 = v74;
    swift_release();
    unint64_t v57 = (objc_class *)v46;
    unint64_t v58 = v60;
    uint64_t v59 = v61;
  }
  result.senderFontTargetRanges._rawValue = v59;
  result.baseFontTargetRanges._rawValue = v58;
  result.localizedString.super.super.CFDictionaryRef isa = v57;
  return result;
}

Swift::String __swiftcall formattedDisplayNameListAndNOthers(prefix:names:nOthers:localization:)(SocialLayer::AttributionTextPrefix prefix, Swift::OpaquePointer names, Swift::Int nOthers, Swift::String_optional localization)
{
  Swift::String_optional v102 = localization;
  int v99 = prefix;
  uint64_t v6 = type metadata accessor for Locale();
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v100 = (char *)&v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = type metadata accessor for String.LocalizationValue();
  uint64_t v8 = MEMORY[0x1F4188790](v101);
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v10 = MEMORY[0x1F4188790](v9);
  uint64_t v81 = (char *)&v72 - v11;
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v80 = (char *)&v72 - v13;
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v79 = (char *)&v72 - v15;
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  uint64_t v78 = (char *)&v72 - v17;
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  uint64_t v85 = (char *)&v72 - v19;
  uint64_t v20 = MEMORY[0x1F4188790](v18);
  id v84 = (char *)&v72 - v21;
  uint64_t v22 = MEMORY[0x1F4188790](v20);
  unint64_t v83 = (char *)&v72 - v23;
  uint64_t v24 = MEMORY[0x1F4188790](v22);
  uint64_t v82 = (char *)&v72 - v25;
  uint64_t v26 = MEMORY[0x1F4188790](v24);
  uint64_t v91 = (char *)&v72 - v27;
  uint64_t v28 = MEMORY[0x1F4188790](v26);
  uint64_t v90 = (char *)&v72 - v29;
  uint64_t v30 = MEMORY[0x1F4188790](v28);
  uint64_t v89 = (char *)&v72 - v31;
  MEMORY[0x1F4188790](v30);
  uint64_t v88 = (char *)&v72 - v35;
  uint64_t v103 = 0;
  unint64_t v104 = 0xE000000000000000;
  uint64_t v36 = *((void *)names._rawValue + 2);
  if (!v36) {
    goto LABEL_20;
  }
  uint64_t v72 = v34;
  unint64_t v73 = v33;
  uint64_t v37 = 0;
  Swift::Int v92 = nOthers;
  uint64_t v93 = v36 - 1;
  uint64_t v96 = (void (**)(char *, char *, uint64_t))(v32 + 16);
  uint64_t v97 = (void (**)(char *, uint64_t))(v32 + 8);
  unsigned int v38 = (uint64_t *)((char *)names._rawValue + 40);
  unint64_t v87 = 0x800000019BEDABC0;
  long long v98 = xmmword_19BED1BC0;
  unint64_t v86 = 0x800000019BEDABE0;
  unint64_t v77 = 0x800000019BEDAB60;
  unint64_t v76 = 0x800000019BEDAB90;
  unint64_t v75 = 0x800000019BEDAB00;
  unint64_t v74 = 0x800000019BEDAB40;
  uint64_t v95 = v36;
  do
  {
    uint64_t v49 = *(v38 - 1);
    uint64_t v48 = *v38;
    if (!v37)
    {
      swift_bridgeObjectRetain();
      if (v99)
      {
        uint64_t v39 = v88;
        String.LocalizationValue.init(stringLiteral:)();
        uint64_t v40 = v101;
        double v94 = *v96;
        v94(v89, v39, v101);
      }
      else
      {
        uint64_t v39 = v90;
        String.LocalizationValue.init(stringLiteral:)();
        uint64_t v40 = v101;
        double v94 = *v96;
        v94(v91, v39, v101);
      }
      goto LABEL_10;
    }
    swift_bridgeObjectRetain();
    if (v37 >= v93 && v92 < 1)
    {
      if (v99)
      {
        uint64_t v39 = v78;
        String.LocalizationValue.init(stringLiteral:)();
        uint64_t v40 = v101;
        double v94 = *v96;
        v94(v79, v39, v101);
      }
      else
      {
        uint64_t v39 = v80;
        String.LocalizationValue.init(stringLiteral:)();
        uint64_t v40 = v101;
        double v94 = *v96;
        v94(v81, v39, v101);
      }
LABEL_10:
      id v50 = SLFrameworkBundle();
      id v41 = v50;
      swift_bridgeObjectRetain();
      static Locale.current.getter();
      uint64_t v42 = v95;
      String.init(localized:table:bundle:localization:locale:comment:)();
      Swift::String v43 = *v97;
      (*v97)(v39, v40);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      uint64_t v44 = swift_allocObject();
      *(_OWORD *)(v44 + 16) = v98;
      *(void *)(v44 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v44 + 64) = lazy protocol witness table accessor for type String and conformance String();
      *(void *)(v44 + 32) = v49;
      *(void *)(v44 + 40) = v48;
      uint64_t v45 = static String.localizedStringWithFormat(_:_:)();
      uint64_t v47 = v46;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      MEMORY[0x19F390770](v45, v47);
      goto LABEL_4;
    }
    if (v99)
    {
      uint64_t v51 = v82;
      String.LocalizationValue.init(stringLiteral:)();
      uint64_t v52 = v101;
      double v94 = *v96;
      v94(v83, v51, v101);
    }
    else
    {
      uint64_t v51 = v84;
      String.LocalizationValue.init(stringLiteral:)();
      uint64_t v52 = v101;
      double v94 = *v96;
      v94(v85, v51, v101);
    }
    id v53 = SLFrameworkBundle();
    swift_bridgeObjectRetain();
    static Locale.current.getter();
    String.init(localized:table:bundle:localization:locale:comment:)();
    Swift::String v43 = *v97;
    (*v97)(v51, v52);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v54 = swift_allocObject();
    *(_OWORD *)(v54 + 16) = v98;
    *(void *)(v54 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v54 + 64) = lazy protocol witness table accessor for type String and conformance String();
    *(void *)(v54 + 32) = v49;
    *(void *)(v54 + 40) = v48;
    uint64_t v55 = static String.localizedStringWithFormat(_:_:)();
    uint64_t v57 = v56;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    MEMORY[0x19F390770](v55, v57);
    uint64_t v42 = v95;
LABEL_4:
    ++v37;
    v38 += 2;
    swift_bridgeObjectRelease();
  }
  while (v42 != v37);
  Swift::Int v58 = v92;
  uint64_t v59 = v73;
  uint64_t v60 = v72;
  if (v92 >= 1)
  {
    String.LocalizationValue.init(stringLiteral:)();
    uint64_t v61 = v101;
    v94(v60, v59, v101);
    id v62 = SLFrameworkBundle();
    swift_bridgeObjectRetain();
    static Locale.current.getter();
    String.init(localized:table:bundle:localization:locale:comment:)();
    v43(v59, v61);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v63 = swift_allocObject();
    uint64_t v64 = MEMORY[0x1E4FBB550];
    *(_OWORD *)(v63 + 16) = v98;
    uint64_t v65 = MEMORY[0x1E4FBB5C8];
    *(void *)(v63 + 56) = v64;
    *(void *)(v63 + 64) = v65;
    *(void *)(v63 + 32) = v58;
    uint64_t v66 = static String.localizedStringWithFormat(_:_:)();
    uint64_t v68 = v67;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    MEMORY[0x19F390770](v66, v68);
    swift_bridgeObjectRelease();
  }
LABEL_20:
  uint64_t v69 = v103;
  uint64_t v70 = (void *)v104;
  result._object = v70;
  result._uint64_t countAndFlagsBits = v69;
  return result;
}

Swift::tuple_localizedString_NSMutableAttributedString_baseFontTargetRanges_OpaquePointer_senderFontTargetRanges_OpaquePointer __swiftcall ListOfNamesAttributionLocAttributedString(prefix:listOfNamesString:multiline:localization:)(SocialLayer::AttributionTextPrefix prefix, Swift::String listOfNamesString, Swift::Bool multiline, Swift::String_optional localization)
{
  Swift::String_optional v45 = localization;
  Swift::String v43 = listOfNamesString;
  uint64_t v44 = type metadata accessor for String.LocalizationValue();
  uint64_t v6 = *(void *)(v44 - 8);
  MEMORY[0x1F4188790](v44);
  uint64_t v8 = (char *)v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for String.LocalizationValue.StringInterpolation();
  uint64_t v10 = MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  MEMORY[0x1F4188790](v12);
  uint64_t v13 = type metadata accessor for AttributedString();
  uint64_t v46 = *(void *)(v13 - 8);
  uint64_t v47 = v13;
  uint64_t v14 = MEMORY[0x1F4188790](v13);
  v42[1] = (char *)v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)v42 - v17;
  MEMORY[0x1F4188790](v16);
  uint64_t v20 = (char *)v42 - v19;
  uint64_t v21 = (void (**)(char *, uint64_t))(v6 + 8);
  if (prefix)
  {
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
    if (multiline)
    {
      uint64_t v22 = 0x3E72623C68746957;
      unint64_t v23 = 0xEA00000000005B5ELL;
    }
    else
    {
      uint64_t v22 = 0x5B5E2068746957;
      unint64_t v23 = 0xE700000000000000;
    }
  }
  else
  {
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
    if (multiline)
    {
      uint64_t v22 = 0x3E72623C6D6F7246;
      unint64_t v23 = 0xEA00000000005B5ELL;
    }
    else
    {
      uint64_t v22 = 0x5B5E206D6F7246;
      unint64_t v23 = 0xE700000000000000;
    }
  }
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v22);
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v43);
  v24._object = (void *)0x800000019BEDAC00;
  v24._uint64_t countAndFlagsBits = 0xD00000000000002BLL;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v24);
  String.LocalizationValue.init(stringInterpolation:)();
  SLLocAttributedString(key:localization:)((uint64_t)v8, v45.value._countAndFlagsBits);
  (*v21)(v8, v44);
  id v25 = (id)type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSMutableAttributedString);
  uint64_t v27 = v46;
  uint64_t v26 = v47;
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v18, v20, v47);
  swift_getKeyPath();
  uint64_t v28 = type metadata accessor for AttributeScopes.HighlightPillAttributes();
  lazy protocol witness table accessor for type AttributedString.FormattingOptions and conformance AttributedString.FormattingOptions(&lazy protocol witness table cache variable for type AttributeScopes.HighlightPillAttributes and conformance AttributeScopes.HighlightPillAttributes, (void (*)(uint64_t))type metadata accessor for AttributeScopes.HighlightPillAttributes);
  uint64_t v29 = NSAttributedString.init<A>(_:including:)();
  uint64_t v30 = (uint64_t)objc_msgSend(v29, sel_length);
  if (v30 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v28 = v30;
    uint64_t v49 = (void *)MEMORY[0x1E4FBC860];
    id v50 = (void *)MEMORY[0x1E4FBC860];
    uint64_t v31 = one-time initialization token for listOfNames;
    id v25 = v29;
    if (v31 == -1) {
      goto LABEL_10;
    }
  }
  swift_once();
LABEL_10:
  uint64_t v32 = static NSAttributedStringKey.listOfNames;
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = &v49;
  *(void *)(v33 + 24) = &v50;
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = partial apply for closure #1 in NameAttributionLocAttributedString(prefix:name:multiline:localization:);
  *(void *)(v34 + 24) = v33;
  aBlock[4] = thunk for @callee_guaranteed (@in_guaranteed Any?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ()partial apply;
  aBlock[5] = v34;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@in_guaranteed Any?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  aBlock[3] = &block_descriptor_33_0;
  uint64_t v35 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v25, sel_enumerateAttribute_inRange_options_usingBlock_, v32, 0, v28, 0, v35);
  _Block_release(v35);

  (*(void (**)(char *, uint64_t))(v27 + 8))(v20, v26);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t v37 = (objc_class *)swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    id v41 = v49;
    uint64_t v40 = v50;
    swift_release();
    uint64_t v37 = (objc_class *)v25;
    unsigned int v38 = v40;
    uint64_t v39 = v41;
  }
  result.senderFontTargetRanges._rawValue = v39;
  result.baseFontTargetRanges._rawValue = v38;
  result.localizedString.super.super.CFDictionaryRef isa = v37;
  return result;
}

uint64_t closure #1 in MeAttributionLocAttributedString(prefix:multiline:localization:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t *a6)
{
  outlined init with copy of Any?(a1, (uint64_t)v23);
  if (v24)
  {
    if ((swift_dynamicCast() & 1) != 0 && v22 == 1)
    {
      uint64_t v10 = (void *)*a5;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      *a5 = (uint64_t)v10;
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v10[2] + 1, 1, v10);
        uint64_t v10 = (void *)result;
        *a5 = result;
      }
      unint64_t v12 = v10[2];
      unint64_t v13 = v10[3];
      unint64_t v14 = v12 + 1;
      if (v12 >= v13 >> 1)
      {
        uint64_t v20 = v10;
        unint64_t v21 = v10[2];
        uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v13 > 1), v12 + 1, 1, v20);
        unint64_t v12 = v21;
        uint64_t v10 = (void *)result;
      }
      v10[2] = v14;
      uint64_t v15 = &v10[2 * v12];
      v15[4] = a2;
      v15[5] = a3;
      *a5 = (uint64_t)v10;
      return result;
    }
  }
  else
  {
    outlined destroy of Any?((uint64_t)v23);
  }
  uint64_t v16 = (void *)*a6;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *a6 = (uint64_t)v16;
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v16[2] + 1, 1, v16);
    uint64_t v16 = (void *)result;
    *a6 = result;
  }
  unint64_t v18 = v16[2];
  unint64_t v17 = v16[3];
  if (v18 >= v17 >> 1)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v17 > 1), v18 + 1, 1, v16);
    uint64_t v16 = (void *)result;
  }
  void v16[2] = v18 + 1;
  uint64_t v19 = &v16[2 * v18];
  v19[4] = a2;
  v19[5] = a3;
  *a6 = (uint64_t)v16;
  return result;
}

void attributedStringSplitByLineBreak(inString:)(void *a1)
{
  id v2 = objc_msgSend(a1, sel_string);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  lazy protocol witness table accessor for type String and conformance String();
  uint64_t v3 = StringProtocol.components<A>(separatedBy:)();
  swift_bridgeObjectRelease();
  uint64_t v13 = MEMORY[0x1E4FBC860];
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = (void *)(v3 + 40);
    while (1)
    {
      Swift::Int v7 = (*v6 & 0x1000000000000000) != 0
         ? String.UTF16View._foreignCount()()
         : String.UTF16View._nativeGetOffset(for:)();
      Swift::Int v8 = v7;
      id v9 = objc_msgSend(a1, sel_attributedSubstringFromRange_, v5, v7);
      MEMORY[0x19F390820]();
      if (*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      uint64_t v10 = String.count.getter();

      Swift::Int v11 = v8 + v10;
      if (__OFADD__(v8, v10)) {
        break;
      }
      BOOL v12 = __OFADD__(v5, v11);
      v5 += v11;
      if (v12) {
        goto LABEL_14;
      }
      v6 += 2;
      if (!--v4) {
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_14:
    __break(1u);
  }
  else
  {
LABEL_10:
    swift_bridgeObjectRelease();
  }
}

double specialized HighlightPillMetricVariant.overlappedAvatarVisibleWidth.getter(void *a1)
{
  unint64_t v2 = (unint64_t)objc_msgSend(a1, sel_preferredContentSizeCategory);
  double v3 = 12.0;
  if (v2 <= 0xB) {
    double v3 = dbl_19BED2EE0[v2];
  }
  double v4 = (double)objc_msgSend(a1, sel_displayScale);
  return SLRoundToScale(v3, v4);
}

void specialized HighlightPillMetricVariant.avatarContainerWidth.getter(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (char *)objc_msgSend(a1, sel_preferredContentSizeCategory);
  uint64_t v6 = 3;
  if ((unint64_t)(v5 - 9) < 3) {
    uint64_t v6 = 1;
  }
  if (v6 >= a3) {
    uint64_t v6 = a3;
  }
  if (__OFSUB__(v6, 1))
  {
    __break(1u);
  }
  else
  {
    objc_msgSend(a1, sel_preferredContentSizeCategory);
    unint64_t v7 = (unint64_t)objc_msgSend(a1, sel_preferredContentSizeCategory);
    if (v7 > 0xB) {
      double v8 = 19.92;
    }
    else {
      double v8 = dbl_19BED3050[v7];
    }
    SLRoundToScale(v8, (double)objc_msgSend(a1, sel_displayScale));
  }
}

{
  char *v5;
  uint64_t v6;

  uint64_t v5 = (char *)objc_msgSend(a1, sel_preferredContentSizeCategory);
  uint64_t v6 = 3;
  if ((unint64_t)(v5 - 9) < 3) {
    uint64_t v6 = 1;
  }
  if (v6 >= a3) {
    uint64_t v6 = a3;
  }
  if (__OFSUB__(v6, 1))
  {
    __break(1u);
  }
  else
  {
    objc_msgSend(a1, sel_preferredContentSizeCategory);
    specialized HighlightPillMetricVariant.overlappedAvatarVisibleWidth.getter(a1);
  }
}

uint64_t specialized HighlightPillMetricVariant.chevronFontDescriptor.getter(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef : Any])>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19BED1BC0;
  double v3 = (void *)*MEMORY[0x1E4F24620];
  *(void *)(inited + 32) = *MEMORY[0x1E4F24620];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Any)>);
  uint64_t v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_19BED15B0;
  uint64_t v5 = (void *)*MEMORY[0x1E4F24610];
  uint64_t v6 = MEMORY[0x1E4FBB550];
  *(void *)(v4 + 32) = *MEMORY[0x1E4F24610];
  *(void *)(v4 + 40) = 0x8000;
  unint64_t v7 = (void *)*MEMORY[0x1E4F246D8];
  double v8 = (uint64_t *)MEMORY[0x1E4F246B8];
  *(void *)(v4 + 64) = v6;
  *(void *)(v4 + 72) = v7;
  uint64_t v9 = *v8;
  *(void *)(v4 + 104) = MEMORY[0x1E4FBC958];
  *(void *)(v4 + 80) = v9;
  id v10 = v3;
  id v11 = v5;
  id v12 = v7;
  *(void *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v4);
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef : Any]);
  lazy protocol witness table accessor for type AttributedString.FormattingOptions and conformance AttributedString.FormattingOptions(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, type metadata accessor for CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(a1, sel_fontContentSizeCategory);
  uint64_t v15 = CTFontDescriptorCreateWithTextStyleAndAttributes();

  return v15;
}

void specialized HighlightPillMetricVariant.chevronSize.getter(void *a1)
{
  id v2 = objc_msgSend(a1, sel_layoutDirection);
  double v3 = (void *)VisionPillMetric.chevronFontDescriptor.getter(a1, 0);
  if (CTFontDescriptorCopyAttribute((CTFontDescriptorRef)v3, (CFStringRef)*MEMORY[0x1E4F245F0]))
  {
    if (v2 == (id)1) {
      unint64_t v4 = 0xEC0000007466656CLL;
    }
    else {
      unint64_t v4 = 0xED00007468676972;
    }
    type metadata accessor for CFNumberRef(0);
    id v5 = (id)swift_dynamicCastUnknownClassUnconditional();
    CGFloat.init(truncating:)();
    double v7 = v6;

    id v8 = a1;
    uint64_t v9 = (void *)MEMORY[0x19F3906A0](0x2E6E6F7276656863, v4);
    swift_bridgeObjectRelease();
    id v10 = SLDSystemVectorGlyphWithSlotStyle(v8, v9, 1, 5, v7);

    objc_msgSend(v10, sel_contentBounds);
  }
  else
  {
    __break(1u);
  }
}

{
  id v2;
  void *v3;
  unint64_t v4;
  id v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  id v10;

  id v2 = objc_msgSend(a1, sel_layoutDirection);
  double v3 = (void *)specialized HighlightPillMetricVariant.chevronFontDescriptor.getter(a1);
  if (CTFontDescriptorCopyAttribute((CTFontDescriptorRef)v3, (CFStringRef)*MEMORY[0x1E4F245F0]))
  {
    if (v2 == (id)1) {
      unint64_t v4 = 0xEC0000007466656CLL;
    }
    else {
      unint64_t v4 = 0xED00007468676972;
    }
    type metadata accessor for CFNumberRef(0);
    id v5 = (id)swift_dynamicCastUnknownClassUnconditional();
    CGFloat.init(truncating:)();
    double v7 = v6;

    id v8 = a1;
    uint64_t v9 = (void *)MEMORY[0x19F3906A0](0x2E6E6F7276656863, v4);
    swift_bridgeObjectRelease();
    id v10 = SLDSystemVectorGlyphWithSlotStyle(v8, v9, 1, 5, v7);

    objc_msgSend(v10, sel_contentBounds);
  }
  else
  {
    __break(1u);
  }
}

CTFontRef specialized HighlightPillMetricVariant.baseFont.getter(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef : Int])>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19BED1BC0;
  double v3 = (void *)*MEMORY[0x1E4F24620];
  *(void *)(inited + 32) = *MEMORY[0x1E4F24620];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Int)>);
  uint64_t v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_19BED1BC0;
  id v5 = (void *)*MEMORY[0x1E4F24610];
  *(void *)(v4 + 32) = *MEMORY[0x1E4F24610];
  *(void *)(v4 + 40) = 0x8000;
  id v6 = v3;
  id v7 = v5;
  *(void *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v4);
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef : Int]);
  lazy protocol witness table accessor for type AttributedString.FormattingOptions and conformance AttributedString.FormattingOptions(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, type metadata accessor for CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)CTContentSizeCategoryForSlotStyle(a1);
  id v10 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  CTFontRef v11 = CTFontCreateWithFontDescriptor(v10, 0.0, 0);

  return v11;
}

CTFontRef specialized HighlightPillMetricVariant.senderFont.getter(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef : Any])>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19BED1BC0;
  double v3 = (void *)*MEMORY[0x1E4F24620];
  *(void *)(inited + 32) = *MEMORY[0x1E4F24620];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Any)>);
  uint64_t v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_19BED15B0;
  id v5 = (void *)*MEMORY[0x1E4F24610];
  uint64_t v6 = MEMORY[0x1E4FBB550];
  *(void *)(v4 + 32) = *MEMORY[0x1E4F24610];
  *(void *)(v4 + 40) = 32770;
  id v7 = (void *)*MEMORY[0x1E4F246D8];
  id v8 = (uint64_t *)MEMORY[0x1E4F246C8];
  *(void *)(v4 + 64) = v6;
  *(void *)(v4 + 72) = v7;
  uint64_t v9 = *v8;
  *(void *)(v4 + 104) = MEMORY[0x1E4FBC958];
  *(void *)(v4 + 80) = v9;
  id v10 = v3;
  id v11 = v5;
  id v12 = v7;
  *(void *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v4);
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef : Any]);
  lazy protocol witness table accessor for type AttributedString.FormattingOptions and conformance AttributedString.FormattingOptions(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, type metadata accessor for CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(a1, sel_fontContentSizeCategory);
  uint64_t v15 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  CTFontRef v16 = CTFontCreateWithFontDescriptor(v15, 0.0, 0);

  return v16;
}

uint64_t (*VisionPillMetric.style.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t VisionPillMetric.isCollaboration.getter(uint64_t a1, char a2)
{
  return a2 & 1;
}

uint64_t (*VisionPillMetric.isCollaboration.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t (*VisionPillMetric.clientMaxWidth.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t VisionPillMetric.availableImageCount.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t (*VisionPillMetric.availableImageCount.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

double VisionPillMetric.maximumWidth.getter(void *a1)
{
  uint64_t v1 = (char *)objc_msgSend(a1, sel_preferredContentSizeCategory);
  if ((unint64_t)(v1 - 5) > 6) {
    return 340.0;
  }
  else {
    return dbl_19BED2FB8[(void)(v1 - 5)];
  }
}

double VisionPillMetric.pillMargins.getter()
{
  return 4.0;
}

double VisionPillMetric.labelHorizontalMargins.getter(void *a1, double a2)
{
  uint64_t v4 = (char *)objc_msgSend(a1, sel_preferredContentSizeCategory);
  if ((unint64_t)(v4 - 7) < 2)
  {
    if (a2 <= 380.0) {
      return 0.0;
    }
    goto LABEL_12;
  }
  if ((unint64_t)(v4 - 10) < 2)
  {
    if (a2 < 466.0) {
      return 0.0;
    }
    goto LABEL_12;
  }
  if (v4 != (char *)9 || a2 > 353.0) {
LABEL_12:
  }
    objc_msgSend(a1, sel_preferredContentSizeCategory);
  return 0.0;
}

BOOL VisionPillMetric.useDoubleLineLabel.getter(void *a1, double a2)
{
  double v3 = (char *)objc_msgSend(a1, sel_preferredContentSizeCategory);
  BOOL v4 = a2 <= 353.0;
  if (v3 != (char *)9) {
    BOOL v4 = 0;
  }
  if ((unint64_t)(v3 - 10) >= 2) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = a2 < 466.0;
  }
  if ((unint64_t)(v3 - 7) >= 2) {
    return v5;
  }
  else {
    return a2 <= 380.0;
  }
}

double VisionPillMetric.avatarDiameter.getter(void *a1)
{
  uint64_t v1 = (char *)objc_msgSend(a1, sel_preferredContentSizeCategory);
  double result = 24.0;
  if ((unint64_t)(v1 - 9) <= 2) {
    return dbl_19BED2FA0[(void)(v1 - 9)];
  }
  return result;
}

double VisionPillMetric.overlappedAvatarVisibleWidth.getter(void *a1)
{
  unint64_t v2 = (unint64_t)objc_msgSend(a1, sel_preferredContentSizeCategory);
  if (v2 > 0xB) {
    double v3 = 19.92;
  }
  else {
    double v3 = dbl_19BED3050[v2];
  }
  double v4 = (double)objc_msgSend(a1, sel_displayScale);
  return SLRoundToScale(v3, v4);
}

BOOL VisionPillMetric.allowLineWrapForMultilineSingleSenderName.getter(void *a1, double a2)
{
  double v4 = (char *)objc_msgSend(a1, sel_preferredContentSizeCategory);
  if ((unint64_t)(v4 - 7) < 2)
  {
    double v5 = 380.0;
LABEL_8:
    if (a2 > v5) {
      return 0;
    }
    goto LABEL_9;
  }
  if ((unint64_t)(v4 - 10) >= 2)
  {
    if (v4 != (char *)9) {
      return 0;
    }
    double v5 = 353.0;
    goto LABEL_8;
  }
  if (a2 >= 466.0) {
    return 0;
  }
LABEL_9:
  if ((char *)objc_msgSend(a1, sel_preferredContentSizeCategory) - 9 <= (char *)2)
  {
    id v6 = objc_msgSend(a1, sel_localization);
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;

    id v10 = objc_allocWithZone(MEMORY[0x1E4F1CA20]);
    id v11 = (void *)MEMORY[0x19F3906A0](v7, v9);
    swift_bridgeObjectRelease();
    CFLocaleRef v12 = (const __CFLocale *)objc_msgSend(v10, sel_initWithLocaleIdentifier_, v11);

    LODWORD(v11) = CFStringIsHyphenationAvailableForLocale(v12);
    return v11 != 0;
  }
  return 0;
}

void VisionPillMetric.chevronSize.getter(void *a1)
{
  id v2 = objc_msgSend(a1, sel_layoutDirection);
  double v3 = (void *)VisionPillMetric.chevronFontDescriptor.getter(a1, 0);
  if (CTFontDescriptorCopyAttribute((CTFontDescriptorRef)v3, (CFStringRef)*MEMORY[0x1E4F245F0]))
  {
    if (v2 == (id)1) {
      unint64_t v4 = 0xEC0000007466656CLL;
    }
    else {
      unint64_t v4 = 0xED00007468676972;
    }
    type metadata accessor for CFNumberRef(0);
    id v5 = (id)swift_dynamicCastUnknownClassUnconditional();
    CGFloat.init(truncating:)();
    double v7 = v6;

    uint64_t v8 = (void *)MEMORY[0x19F3906A0](0x2E6E6F7276656863, v4);
    swift_bridgeObjectRelease();
    id v9 = SLDSystemVectorGlyphWithSlotStyle(a1, v8, 1, 5, v7);

    objc_msgSend(v9, sel_contentBounds);
  }
  else
  {
    __break(1u);
  }
}

double protocol witness for HighlightPillMetricVariant.maximumWidth.getter in conformance VisionPillMetric()
{
  uint64_t v1 = (char *)objc_msgSend(*v0, sel_preferredContentSizeCategory);
  if ((unint64_t)(v1 - 5) > 6) {
    return 340.0;
  }
  else {
    return dbl_19BED2FB8[(void)(v1 - 5)];
  }
}

double protocol witness for HighlightPillMetricVariant.labelHorizontalMargins.getter in conformance VisionPillMetric()
{
  VisionPillMetric.labelHorizontalMargins.getter(*(void **)v0, *(double *)(v0 + 16));
  return 0.0;
}

double protocol witness for HighlightPillMetricVariant.avatarDiameter.getter in conformance VisionPillMetric()
{
  unint64_t v1 = (unint64_t)objc_msgSend(*v0, sel_preferredContentSizeCategory);
  double result = 24.0;
  if (v1 <= 0xB) {
    return dbl_19BED2FF0[v1];
  }
  return result;
}

double protocol witness for HighlightPillMetricVariant.overlappedAvatarVisibleWidth.getter in conformance VisionPillMetric()
{
  id v1 = *v0;
  unint64_t v2 = (unint64_t)objc_msgSend(*v0, sel_preferredContentSizeCategory);
  if (v2 > 0xB) {
    double v3 = 19.92;
  }
  else {
    double v3 = dbl_19BED3050[v2];
  }
  double v4 = (double)objc_msgSend(v1, sel_displayScale);
  return SLRoundToScale(v3, v4);
}

void protocol witness for HighlightPillMetricVariant.avatarContainerWidth.getter in conformance VisionPillMetric()
{
  specialized HighlightPillMetricVariant.avatarContainerWidth.getter(*(void **)v0, *(unsigned __int8 *)(v0 + 8), *(void *)(v0 + 24));
}

BOOL protocol witness for HighlightPillMetricVariant.useDoubleLineLabel.getter in conformance VisionPillMetric()
{
  double v1 = *(double *)(v0 + 16);
  unint64_t v2 = (char *)objc_msgSend(*(id *)v0, sel_preferredContentSizeCategory);
  BOOL v3 = v1 <= 353.0;
  if (v2 != (char *)9) {
    BOOL v3 = 0;
  }
  if ((unint64_t)(v2 - 10) >= 2) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = v1 < 466.0;
  }
  if ((unint64_t)(v2 - 7) >= 2) {
    return v4;
  }
  else {
    return v1 <= 380.0;
  }
}

BOOL protocol witness for HighlightPillMetricVariant.allowLineWrapForMultilineSingleSenderName.getter in conformance VisionPillMetric()
{
  return VisionPillMetric.allowLineWrapForMultilineSingleSenderName.getter(*(void **)v0, *(double *)(v0 + 16));
}

uint64_t protocol witness for HighlightPillMetricVariant.baseFont.getter in conformance VisionPillMetric()
{
  return VisionPillMetric.baseFont.getter(*v0, 0);
}

uint64_t protocol witness for HighlightPillMetricVariant.senderFont.getter in conformance VisionPillMetric()
{
  return VisionPillMetric.senderFont.getter(*v0, 0);
}

double protocol witness for HighlightPillMetricVariant.pillMargins.getter in conformance VisionPillMetric()
{
  return 4.0;
}

uint64_t protocol witness for HighlightPillMetricVariant.chevronFontDescriptor.getter in conformance VisionPillMetric()
{
  return VisionPillMetric.chevronFontDescriptor.getter(*v0, 0);
}

void protocol witness for HighlightPillMetricVariant.chevronSize.getter in conformance VisionPillMetric()
{
  VisionPillMetric.chevronSize.getter(*v0);
}

uint64_t (*VisionSafariBannerPillMetric.style.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t VisionSafariBannerPillMetric.isCollaboration.getter(uint64_t a1, char a2)
{
  return a2 & 1;
}

uint64_t (*VisionSafariBannerPillMetric.isCollaboration.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t (*VisionSafariBannerPillMetric.clientMaxWidth.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t VisionSafariBannerPillMetric.availableImageCount.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t (*VisionSafariBannerPillMetric.availableImageCount.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

double VisionSafariBannerPillMetric.labelHorizontalMargins.getter()
{
  return 0.0;
}

double VisionSafariBannerPillMetric.avatarDiameter.getter()
{
  return 24.0;
}

double VisionSafariBannerPillMetric.overlappedAvatarVisibleWidth.getter(void *a1)
{
  double v1 = (double)objc_msgSend(a1, sel_displayScale);
  return SLRoundToScale(19.92, v1);
}

uint64_t VisionPillMetric.chevronFontDescriptor.getter(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef : CGFloat])>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19BED1BC0;
  BOOL v3 = (void *)*MEMORY[0x1E4F24620];
  *(void *)(inited + 32) = *MEMORY[0x1E4F24620];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, CGFloat)>);
  uint64_t v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_19BED1BC0;
  id v5 = (void *)*MEMORY[0x1E4F246D8];
  *(void *)(v4 + 32) = *MEMORY[0x1E4F246D8];
  *(void *)(v4 + 40) = *MEMORY[0x1E4F246C8];
  id v6 = v3;
  id v7 = v5;
  *(void *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v4);
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef : CGFloat]);
  lazy protocol witness table accessor for type AttributedString.FormattingOptions and conformance AttributedString.FormattingOptions(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, type metadata accessor for CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(a1, sel_fontContentSizeCategory);
  uint64_t v10 = CTFontDescriptorCreateWithTextStyleAndAttributes();

  return v10;
}

CTFontRef VisionPillMetric.baseFont.getter(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef : CGFloat])>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19BED1BC0;
  BOOL v3 = (void *)*MEMORY[0x1E4F24620];
  *(void *)(inited + 32) = *MEMORY[0x1E4F24620];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, CGFloat)>);
  uint64_t v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_19BED1BC0;
  id v5 = (void *)*MEMORY[0x1E4F246D8];
  *(void *)(v4 + 32) = *MEMORY[0x1E4F246D8];
  *(void *)(v4 + 40) = *MEMORY[0x1E4F246C8];
  id v6 = v3;
  id v7 = v5;
  *(void *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v4);
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef : CGFloat]);
  lazy protocol witness table accessor for type AttributedString.FormattingOptions and conformance AttributedString.FormattingOptions(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, type metadata accessor for CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v9 = (void *)CTContentSizeCategoryForSlotStyle(a1);
  uint64_t v10 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  CTFontRef v11 = CTFontCreateWithFontDescriptor(v10, 0.0, 0);

  return v11;
}

CTFontRef VisionPillMetric.senderFont.getter(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef : CGFloat])>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19BED1BC0;
  BOOL v3 = (void *)*MEMORY[0x1E4F24620];
  *(void *)(inited + 32) = *MEMORY[0x1E4F24620];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, CGFloat)>);
  uint64_t v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_19BED1BC0;
  id v5 = (void *)*MEMORY[0x1E4F246D8];
  *(void *)(v4 + 32) = *MEMORY[0x1E4F246D8];
  *(void *)(v4 + 40) = *MEMORY[0x1E4F246C8];
  id v6 = v3;
  id v7 = v5;
  *(void *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v4);
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef : CGFloat]);
  lazy protocol witness table accessor for type AttributedString.FormattingOptions and conformance AttributedString.FormattingOptions(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, type metadata accessor for CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(a1, sel_fontContentSizeCategory);
  uint64_t v10 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  CTFontRef v11 = CTFontCreateWithFontDescriptor(v10, 0.0, 0);

  return v11;
}

uint64_t protocol witness for HighlightPillMetricVariant.maxImageCount.getter in conformance VisionSafariBannerPillMetric()
{
  return 3;
}

double protocol witness for HighlightPillMetricVariant.maximumWidth.getter in conformance VisionSafariBannerPillMetric()
{
  return 320.0;
}

double protocol witness for HighlightPillMetricVariant.labelHorizontalMargins.getter in conformance VisionSafariBannerPillMetric()
{
  return 0.0;
}

double protocol witness for HighlightPillMetricVariant.avatarDiameter.getter in conformance VisionSafariBannerPillMetric()
{
  return 24.0;
}

double protocol witness for HighlightPillMetricVariant.overlappedAvatarVisibleWidth.getter in conformance VisionSafariBannerPillMetric()
{
  double v1 = (double)objc_msgSend(*v0, sel_displayScale);
  return SLRoundToScale(19.92, v1);
}

void protocol witness for HighlightPillMetricVariant.avatarContainerWidth.getter in conformance VisionSafariBannerPillMetric()
{
  uint64_t v1 = *(void *)(v0 + 24);
  if (v1 >= 3) {
    uint64_t v1 = 3;
  }
  if (__OFSUB__(v1, 1)) {
    __break(1u);
  }
  else {
    SLRoundToScale(19.92, (double)objc_msgSend(*(id *)v0, sel_displayScale));
  }
}

void protocol witness for HighlightPillMetricVariant.chevronSize.getter in conformance VisionSafariBannerPillMetric()
{
  specialized HighlightPillMetricVariant.chevronSize.getter(*v0);
}

uint64_t (*iOSPillMetric.style.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t iOSPillMetric.isCollaboration.getter(uint64_t a1, char a2)
{
  return a2 & 1;
}

uint64_t (*iOSPillMetric.isCollaboration.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t (*iOSPillMetric.clientMaxWidth.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t iOSPillMetric.availableImageCount.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t (*iOSPillMetric.availableImageCount.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t iOSPillMetric.maxImageCount.getter(void *a1)
{
  if ((char *)objc_msgSend(a1, sel_preferredContentSizeCategory) - 9 < (char *)3) {
    return 1;
  }
  else {
    return 3;
  }
}

uint64_t iOSPillMetric.maxNameCount.getter(uint64_t a1, char a2)
{
  if (a2) {
    return 2;
  }
  else {
    return 1;
  }
}

double iOSPillMetric.maximumWidth.getter(void *a1)
{
  uint64_t v1 = (char *)objc_msgSend(a1, sel_preferredContentSizeCategory);
  if ((unint64_t)(v1 - 5) > 6) {
    return 250.0;
  }
  else {
    return dbl_19BED3198[(void)(v1 - 5)];
  }
}

double iOSPillMetric.labelHorizontalMargins.getter(void *a1, double a2)
{
  uint64_t v4 = (char *)objc_msgSend(a1, sel_preferredContentSizeCategory);
  if ((unint64_t)(v4 - 7) < 2)
  {
    if (a2 <= 280.0) {
      return 0.0;
    }
    goto LABEL_12;
  }
  if ((unint64_t)(v4 - 10) < 2)
  {
    if (a2 < 343.0) {
      return 0.0;
    }
    goto LABEL_12;
  }
  if (v4 != (char *)9 || a2 > 260.0) {
LABEL_12:
  }
    objc_msgSend(a1, sel_preferredContentSizeCategory);
  return 0.0;
}

BOOL iOSPillMetric.useDoubleLineLabel.getter(void *a1, double a2)
{
  BOOL v3 = (char *)objc_msgSend(a1, sel_preferredContentSizeCategory);
  BOOL v4 = a2 <= 260.0;
  if (v3 != (char *)9) {
    BOOL v4 = 0;
  }
  if ((unint64_t)(v3 - 10) >= 2) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = a2 < 343.0;
  }
  if ((unint64_t)(v3 - 7) >= 2) {
    return v5;
  }
  else {
    return a2 <= 280.0;
  }
}

double iOSPillMetric.avatarDiameter.getter(void *a1)
{
  uint64_t v1 = (char *)objc_msgSend(a1, sel_preferredContentSizeCategory);
  double result = 16.0;
  if ((unint64_t)(v1 - 7) <= 4) {
    return dbl_19BED3170[(void)(v1 - 7)];
  }
  return result;
}

double VisionPillMetric.avatarOverlapKnockoutWidth.getter(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = a1;
  BOOL v5 = (char *)objc_msgSend(v4, sel_preferredContentSizeCategory);

  uint64_t v6 = 3;
  if ((unint64_t)(v5 - 9) < 3) {
    uint64_t v6 = 1;
  }
  if (v6 >= a3) {
    uint64_t v6 = a3;
  }
  double result = 0.0;
  if (v6 > 1) {
    return 1.0;
  }
  return result;
}

BOOL iOSPillMetric.allowLineWrapForMultilineSingleSenderName.getter(void *a1, double a2)
{
  id v4 = (char *)objc_msgSend(a1, sel_preferredContentSizeCategory);
  if ((unint64_t)(v4 - 7) < 2)
  {
    double v5 = 280.0;
LABEL_8:
    if (a2 > v5) {
      return 0;
    }
    goto LABEL_9;
  }
  if ((unint64_t)(v4 - 10) >= 2)
  {
    if (v4 != (char *)9) {
      return 0;
    }
    double v5 = 260.0;
    goto LABEL_8;
  }
  if (a2 >= 343.0) {
    return 0;
  }
LABEL_9:
  if ((char *)objc_msgSend(a1, sel_preferredContentSizeCategory) - 9 <= (char *)2)
  {
    id v6 = objc_msgSend(a1, sel_localization);
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;

    id v10 = objc_allocWithZone(MEMORY[0x1E4F1CA20]);
    CTFontRef v11 = (void *)MEMORY[0x19F3906A0](v7, v9);
    swift_bridgeObjectRelease();
    CFLocaleRef v12 = (const __CFLocale *)objc_msgSend(v10, sel_initWithLocaleIdentifier_, v11);

    LODWORD(v11) = CFStringIsHyphenationAvailableForLocale(v12);
    return v11 != 0;
  }
  return 0;
}

BOOL iOSPillMetric.onlyDisplayNameOrSenderCount.getter(void *a1)
{
  return (char *)objc_msgSend(a1, sel_preferredContentSizeCategory) - 9 < (char *)3;
}

uint64_t protocol witness for HighlightPillMetricVariant.maxNameCount.getter in conformance iOSPillMetric()
{
  if (*(unsigned char *)(v0 + 8)) {
    return 2;
  }
  else {
    return 1;
  }
}

uint64_t protocol witness for HighlightPillMetricVariant.maxImageCount.getter in conformance iOSPillMetric()
{
  if ((char *)objc_msgSend(*v0, sel_preferredContentSizeCategory) - 9 < (char *)3) {
    return 1;
  }
  else {
    return 3;
  }
}

uint64_t protocol witness for HighlightPillMetricVariant.finalImageCount.getter in conformance iOSPillMetric()
{
  uint64_t v1 = *(void *)(v0 + 24);
  unint64_t v2 = (char *)objc_msgSend(*(id *)v0, sel_preferredContentSizeCategory);
  uint64_t v3 = 3;
  if ((unint64_t)(v2 - 9) < 3) {
    uint64_t v3 = 1;
  }
  if (v1 >= v3) {
    return v3;
  }
  else {
    return v1;
  }
}

double protocol witness for HighlightPillMetricVariant.maximumWidth.getter in conformance iOSPillMetric()
{
  uint64_t v1 = (char *)objc_msgSend(*v0, sel_preferredContentSizeCategory);
  if ((unint64_t)(v1 - 5) > 6) {
    return 250.0;
  }
  else {
    return dbl_19BED3198[(void)(v1 - 5)];
  }
}

double protocol witness for HighlightPillMetricVariant.labelHorizontalMargins.getter in conformance iOSPillMetric()
{
  iOSPillMetric.labelHorizontalMargins.getter(*(void **)v0, *(double *)(v0 + 16));
  return 0.0;
}

double protocol witness for HighlightPillMetricVariant.avatarDiameter.getter in conformance iOSPillMetric()
{
  unint64_t v1 = (unint64_t)objc_msgSend(*v0, sel_preferredContentSizeCategory);
  double result = 16.0;
  if (v1 <= 0xB) {
    return dbl_19BED31D0[v1];
  }
  return result;
}

double protocol witness for HighlightPillMetricVariant.overlappedAvatarVisibleWidth.getter in conformance iOSPillMetric()
{
  return specialized HighlightPillMetricVariant.overlappedAvatarVisibleWidth.getter(*v0);
}

void protocol witness for HighlightPillMetricVariant.avatarContainerWidth.getter in conformance iOSPillMetric()
{
  specialized HighlightPillMetricVariant.avatarContainerWidth.getter(*(void **)v0, *(unsigned __int8 *)(v0 + 8), *(void *)(v0 + 24));
}

double protocol witness for HighlightPillMetricVariant.avatarOverlapKnockoutWidth.getter in conformance VisionPillMetric()
{
  uint64_t v1 = *(void *)(v0 + 24);
  id v2 = *(id *)v0;
  uint64_t v3 = (char *)objc_msgSend(v2, sel_preferredContentSizeCategory);

  uint64_t v4 = 3;
  if ((unint64_t)(v3 - 9) < 3) {
    uint64_t v4 = 1;
  }
  if (v1 < v4) {
    uint64_t v4 = v1;
  }
  double result = 0.0;
  if (v4 > 1) {
    return 1.0;
  }
  return result;
}

BOOL protocol witness for HighlightPillMetricVariant.useDoubleLineLabel.getter in conformance iOSPillMetric()
{
  double v1 = *(double *)(v0 + 16);
  id v2 = (char *)objc_msgSend(*(id *)v0, sel_preferredContentSizeCategory);
  BOOL v3 = v1 <= 260.0;
  if (v2 != (char *)9) {
    BOOL v3 = 0;
  }
  if ((unint64_t)(v2 - 10) >= 2) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = v1 < 343.0;
  }
  if ((unint64_t)(v2 - 7) >= 2) {
    return v4;
  }
  else {
    return v1 <= 280.0;
  }
}

BOOL protocol witness for HighlightPillMetricVariant.allowLineWrapForMultilineSingleSenderName.getter in conformance iOSPillMetric()
{
  return iOSPillMetric.allowLineWrapForMultilineSingleSenderName.getter(*(void **)v0, *(double *)(v0 + 16));
}

BOOL protocol witness for HighlightPillMetricVariant.onlyDisplayNameOrSenderCount.getter in conformance iOSPillMetric()
{
  return (char *)objc_msgSend(*v0, sel_preferredContentSizeCategory) - 9 < (char *)3;
}

double protocol witness for HighlightPillMetricVariant.pillMargins.getter in conformance iOSPillMetric()
{
  if ((char *)objc_msgSend(*v0, sel_preferredContentSizeCategory) - 7 > (char *)4) {
    return 4.0;
  }
  else {
    return 6.0;
  }
}

void protocol witness for HighlightPillMetricVariant.chevronSize.getter in conformance iOSPillMetric()
{
  specialized HighlightPillMetricVariant.chevronSize.getter(*v0);
}

void TVPillMetrics.style.setter(void *a1)
{
  id *v1 = a1;
}

uint64_t (*TVPillMetrics.style.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

void TVPillMetrics.clientMaxWidth.setter(double a1)
{
  *(double *)(v1 + 8) = a1;
}

uint64_t (*TVPillMetrics.clientMaxWidth.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t TVPillMetrics.availableImageCount.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t TVPillMetrics.availableImageCount.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t (*TVPillMetrics.availableImageCount.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t TVPillMetrics.maxImageCount.getter()
{
  return 3;
}

uint64_t TVPillMetrics.maxNameCount.getter()
{
  return 8;
}

uint64_t TVPillMetrics.shouldDisplayPin.getter()
{
  return 1;
}

double TVPillMetrics.maximumWidth.getter()
{
  return 10000.0;
}

double TVPillMetrics.pillMargins.getter()
{
  return 9.0;
}

double TVPillMetrics.labelHorizontalMargins.getter()
{
  return 0.0;
}

double TVPillMetrics.avatarDiameter.getter()
{
  return 32.0;
}

double TVPillMetrics.avatarOverlapKnockoutWidth.getter(uint64_t a1, uint64_t a2)
{
  double result = 0.0;
  if (a2 > 1) {
    return 2.0;
  }
  return result;
}

uint64_t TVPillMetrics.useDoubleLineLabel.getter()
{
  return 0;
}

uint64_t protocol witness for HighlightPillMetricVariant.maxNameCount.getter in conformance TVPillMetrics()
{
  return 8;
}

uint64_t protocol witness for HighlightPillMetricVariant.finalImageCount.getter in conformance TVPillMetrics()
{
  if (*(uint64_t *)(v0 + 16) >= 3) {
    return 3;
  }
  else {
    return *(void *)(v0 + 16);
  }
}

double protocol witness for HighlightPillMetricVariant.maximumWidth.getter in conformance TVPillMetrics()
{
  return 10000.0;
}

double protocol witness for HighlightPillMetricVariant.labelHorizontalMargins.getter in conformance TVPillMetrics()
{
  return 0.0;
}

double protocol witness for HighlightPillMetricVariant.avatarDiameter.getter in conformance TVPillMetrics()
{
  return 32.0;
}

double protocol witness for HighlightPillMetricVariant.overlappedAvatarVisibleWidth.getter in conformance TVPillMetrics()
{
  double v1 = (double)objc_msgSend(*v0, sel_displayScale);
  return SLRoundToScale(24.0, v1);
}

void protocol witness for HighlightPillMetricVariant.avatarContainerWidth.getter in conformance TVPillMetrics()
{
  uint64_t v1 = *(void *)(v0 + 16);
  if (v1 >= 3) {
    uint64_t v1 = 3;
  }
  if (__OFSUB__(v1, 1)) {
    __break(1u);
  }
  else {
    SLRoundToScale(24.0, (double)objc_msgSend(*(id *)v0, sel_displayScale));
  }
}

double protocol witness for HighlightPillMetricVariant.avatarOverlapKnockoutWidth.getter in conformance TVPillMetrics()
{
  double result = 0.0;
  if (*(uint64_t *)(v0 + 16) > 1) {
    return 2.0;
  }
  return result;
}

CTFontRef protocol witness for HighlightPillMetricVariant.baseFont.getter in conformance TVPillMetrics()
{
  return specialized HighlightPillMetricVariant.baseFont.getter(*v0);
}

CTFontRef protocol witness for HighlightPillMetricVariant.senderFont.getter in conformance TVPillMetrics()
{
  return specialized HighlightPillMetricVariant.senderFont.getter(*v0);
}

double protocol witness for HighlightPillMetricVariant.pillMargins.getter in conformance TVPillMetrics()
{
  return 9.0;
}

uint64_t protocol witness for HighlightPillMetricVariant.chevronFontDescriptor.getter in conformance TVPillMetrics()
{
  return specialized HighlightPillMetricVariant.chevronFontDescriptor.getter(*v0);
}

double protocol witness for HighlightPillMetricVariant.chevronSize.getter in conformance TVPillMetrics()
{
  return 0.0;
}

void MacPillMetric.style.setter(void *a1)
{
  id *v1 = a1;
}

uint64_t (*MacPillMetric.style.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t MacPillMetric.isCollaboration.getter(uint64_t a1, char a2)
{
  return a2 & 1;
}

uint64_t MacPillMetric.isCollaboration.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 8) = result;
  return result;
}

uint64_t (*MacPillMetric.isCollaboration.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

void MacPillMetric.clientMaxWidth.setter(double a1)
{
  *(double *)(v1 + 16) = a1;
}

uint64_t (*MacPillMetric.clientMaxWidth.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t MacPillMetric.availableImageCount.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t MacPillMetric.availableImageCount.setter(uint64_t result)
{
  *(void *)(v1 + 24) = result;
  return result;
}

uint64_t (*MacPillMetric.availableImageCount.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t MacPillMetric.maxImageCount.getter()
{
  return 3;
}

uint64_t MacPillMetric.maxNameCount.getter(uint64_t a1, char a2)
{
  if (a2) {
    return 3;
  }
  else {
    return 1;
  }
}

uint64_t MacPillMetric.shouldDisplayPin.getter()
{
  return 1;
}

double MacPillMetric.maximumWidth.getter()
{
  return 320.0;
}

double MacPillMetric.labelHorizontalMargins.getter()
{
  return 0.0;
}

double MacPillMetric.avatarDiameter.getter()
{
  return 12.0;
}

double MacPillMetric.avatarOverlapKnockoutWidth.getter(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3 < 2) {
    return 0.0;
  }
  double v5 = (double)objc_msgSend(a1, sel_displayScale, v3);
  return SLRoundToScale(0.75, v5);
}

uint64_t MacPillMetric.useDoubleLineLabel.getter()
{
  return 0;
}

double MacPillMetric.chevronSize.getter()
{
  return 7.0;
}

uint64_t protocol witness for HighlightPillMetricVariant.textPrefix.getter in conformance MacPillMetric()
{
  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t protocol witness for HighlightPillMetricVariant.maxNameCount.getter in conformance MacPillMetric()
{
  if (*(unsigned char *)(v0 + 8)) {
    return 3;
  }
  else {
    return 1;
  }
}

uint64_t protocol witness for HighlightPillMetricVariant.finalImageCount.getter in conformance MacPillMetric()
{
  if (*(uint64_t *)(v0 + 24) >= 3) {
    return 3;
  }
  else {
    return *(void *)(v0 + 24);
  }
}

double protocol witness for HighlightPillMetricVariant.labelHorizontalMargins.getter in conformance MacPillMetric()
{
  return 0.0;
}

double protocol witness for HighlightPillMetricVariant.avatarDiameter.getter in conformance MacPillMetric()
{
  return 12.0;
}

double protocol witness for HighlightPillMetricVariant.overlappedAvatarVisibleWidth.getter in conformance MacPillMetric()
{
  double v1 = (double)objc_msgSend(*v0, sel_displayScale);
  return SLRoundToScale(9.0, v1);
}

void protocol witness for HighlightPillMetricVariant.avatarContainerWidth.getter in conformance MacPillMetric()
{
  uint64_t v1 = *(void *)(v0 + 24);
  if (v1 >= 3) {
    uint64_t v1 = 3;
  }
  if (__OFSUB__(v1, 1)) {
    __break(1u);
  }
  else {
    SLRoundToScale(9.0, (double)objc_msgSend(*(id *)v0, sel_displayScale));
  }
}

double protocol witness for HighlightPillMetricVariant.avatarOverlapKnockoutWidth.getter in conformance MacPillMetric()
{
  if (*(uint64_t *)(v0 + 24) < 2) {
    return 0.0;
  }
  double v1 = (double)objc_msgSend(*(id *)v0, sel_displayScale);
  return SLRoundToScale(0.75, v1);
}

CTFontRef protocol witness for HighlightPillMetricVariant.baseFont.getter in conformance MacPillMetric()
{
  return specialized HighlightPillMetricVariant.baseFont.getter(*v0);
}

CTFontRef protocol witness for HighlightPillMetricVariant.senderFont.getter in conformance MacPillMetric()
{
  return specialized HighlightPillMetricVariant.senderFont.getter(*v0);
}

uint64_t protocol witness for HighlightPillMetricVariant.chevronFontDescriptor.getter in conformance MacPillMetric()
{
  return specialized HighlightPillMetricVariant.chevronFontDescriptor.getter(*v0);
}

double protocol witness for HighlightPillMetricVariant.chevronSize.getter in conformance MacPillMetric()
{
  return 7.0;
}

uint64_t (*MacSafariBannerPillMetrics.style.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t MacSafariBannerPillMetrics.isCollaboration.getter(uint64_t a1, char a2)
{
  return a2 & 1;
}

uint64_t (*MacSafariBannerPillMetrics.isCollaboration.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t (*MacSafariBannerPillMetrics.clientMaxWidth.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t MacSafariBannerPillMetrics.availableImageCount.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t (*MacSafariBannerPillMetrics.availableImageCount.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

double MacSafariBannerPillMetrics.maximumWidth.getter()
{
  return 500.0;
}

double MacSafariBannerPillMetrics.pillMargins.getter()
{
  return 4.0;
}

double MacSafariBannerPillMetrics.labelHorizontalMargins.getter()
{
  return 0.0;
}

double MacSafariBannerPillMetrics.avatarDiameter.getter()
{
  return 16.0;
}

double MacSafariBannerPillMetrics.avatarOverlapKnockoutWidth.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result = 0.0;
  if (a3 > 1) {
    return 1.0;
  }
  return result;
}

CTFontRef MacSafariBannerPillMetrics.baseFont.getter(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef : Int])>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19BED1BC0;
  uint64_t v3 = (void *)*MEMORY[0x1E4F24620];
  *(void *)(inited + 32) = *MEMORY[0x1E4F24620];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Int)>);
  uint64_t v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_19BED1BC0;
  double v5 = (void *)*MEMORY[0x1E4F24610];
  *(void *)(v4 + 32) = *MEMORY[0x1E4F24610];
  *(void *)(v4 + 40) = 0x8000;
  id v6 = v3;
  id v7 = v5;
  *(void *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v4);
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef : Int]);
  lazy protocol witness table accessor for type AttributedString.FormattingOptions and conformance AttributedString.FormattingOptions(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, type metadata accessor for CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)CTContentSizeCategoryForSlotStyle(a1);
  id v10 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  CTFontRef v11 = CTFontCreateWithFontDescriptor(v10, 0.0, 0);

  return v11;
}

CTFontRef MacSafariBannerPillMetrics.senderFont.getter(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, [CFStringRef : Any])>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19BED1BC0;
  uint64_t v3 = (void *)*MEMORY[0x1E4F24620];
  *(void *)(inited + 32) = *MEMORY[0x1E4F24620];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Any)>);
  uint64_t v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_19BED15B0;
  double v5 = (void *)*MEMORY[0x1E4F24610];
  uint64_t v6 = MEMORY[0x1E4FBB550];
  *(void *)(v4 + 32) = *MEMORY[0x1E4F24610];
  *(void *)(v4 + 40) = 32770;
  id v7 = (void *)*MEMORY[0x1E4F246D8];
  uint64_t v8 = (uint64_t *)MEMORY[0x1E4F246C8];
  *(void *)(v4 + 64) = v6;
  *(void *)(v4 + 72) = v7;
  uint64_t v9 = *v8;
  *(void *)(v4 + 104) = MEMORY[0x1E4FBC958];
  *(void *)(v4 + 80) = v9;
  id v10 = v3;
  id v11 = v5;
  id v12 = v7;
  *(void *)(inited + 40) = specialized Dictionary.init(dictionaryLiteral:)(v4);
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef : Any]);
  lazy protocol witness table accessor for type AttributedString.FormattingOptions and conformance AttributedString.FormattingOptions(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, type metadata accessor for CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(a1, sel_fontContentSizeCategory);
  uint64_t v15 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  CTFontRef v16 = CTFontCreateWithFontDescriptor(v15, 0.0, 0);

  return v16;
}

double protocol witness for HighlightPillMetricVariant.maximumWidth.getter in conformance MacSafariBannerPillMetrics()
{
  return 500.0;
}

double protocol witness for HighlightPillMetricVariant.labelHorizontalMargins.getter in conformance MacSafariBannerPillMetrics()
{
  return 0.0;
}

double protocol witness for HighlightPillMetricVariant.overlappedAvatarVisibleWidth.getter in conformance MacSafariBannerPillMetrics()
{
  double v1 = (double)objc_msgSend(*v0, sel_displayScale);
  return SLRoundToScale(12.0, v1);
}

void protocol witness for HighlightPillMetricVariant.avatarContainerWidth.getter in conformance MacSafariBannerPillMetrics()
{
  uint64_t v1 = *(void *)(v0 + 24);
  if (v1 >= 3) {
    uint64_t v1 = 3;
  }
  if (__OFSUB__(v1, 1)) {
    __break(1u);
  }
  else {
    SLRoundToScale(12.0, (double)objc_msgSend(*(id *)v0, sel_displayScale));
  }
}

double protocol witness for HighlightPillMetricVariant.avatarOverlapKnockoutWidth.getter in conformance MacSafariBannerPillMetrics()
{
  double result = 0.0;
  if (*(uint64_t *)(v0 + 24) > 1) {
    return 1.0;
  }
  return result;
}

CTFontRef protocol witness for HighlightPillMetricVariant.baseFont.getter in conformance MacSafariBannerPillMetrics()
{
  return MacSafariBannerPillMetrics.baseFont.getter(*v0);
}

CTFontRef protocol witness for HighlightPillMetricVariant.senderFont.getter in conformance MacSafariBannerPillMetrics()
{
  return MacSafariBannerPillMetrics.senderFont.getter(*v0);
}

double protocol witness for HighlightPillMetricVariant.pillMargins.getter in conformance MacSafariBannerPillMetrics()
{
  return 4.0;
}

uint64_t (*iOSSafariBannerPillMetrics.style.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t iOSSafariBannerPillMetrics.isCollaboration.getter(uint64_t a1, char a2)
{
  return a2 & 1;
}

uint64_t (*iOSSafariBannerPillMetrics.isCollaboration.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t (*iOSSafariBannerPillMetrics.clientMaxWidth.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

uint64_t iOSSafariBannerPillMetrics.availableImageCount.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t (*iOSSafariBannerPillMetrics.availableImageCount.modify())()
{
  return destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors;
}

double iOSSafariBannerPillMetrics.labelHorizontalMargins.getter()
{
  return 0.0;
}

double iOSSafariBannerPillMetrics.avatarDiameter.getter()
{
  return 35.0;
}

double protocol witness for HighlightPillMetricVariant.labelHorizontalMargins.getter in conformance iOSSafariBannerPillMetrics()
{
  return 0.0;
}

double protocol witness for HighlightPillMetricVariant.avatarDiameter.getter in conformance iOSSafariBannerPillMetrics()
{
  return 35.0;
}

double protocol witness for HighlightPillMetricVariant.overlappedAvatarVisibleWidth.getter in conformance iOSSafariBannerPillMetrics()
{
  double v1 = (double)objc_msgSend(*v0, sel_displayScale);
  return SLRoundToScale(26.25, v1);
}

void protocol witness for HighlightPillMetricVariant.avatarContainerWidth.getter in conformance iOSSafariBannerPillMetrics()
{
  uint64_t v1 = *(void *)(v0 + 24);
  if (v1 >= 3) {
    uint64_t v1 = 3;
  }
  if (__OFSUB__(v1, 1)) {
    __break(1u);
  }
  else {
    SLRoundToScale(26.25, (double)objc_msgSend(*(id *)v0, sel_displayScale));
  }
}

BOOL SLHighlightPillMetricVariant.isMacOS.getter(uint64_t a1)
{
  return ((a1 - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

id PillMetrics.__allocating_init(slotStyle:tag:)(void *a1, void *a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithSlotStyle_tag_variant_, a1, a2, objc_msgSend(a2, sel_variant));

  return v5;
}

id PillMetrics.init(slotStyle:tag:)(void *a1, id a2)
{
  id v5 = objc_msgSend(v2, sel_initWithSlotStyle_tag_variant_, a1, a2, objc_msgSend(a2, sel_variant));

  return v5;
}

id PillMetrics.__allocating_init(slotStyle:tag:variant:)(void *a1, void *a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  id v8 = specialized PillMetrics.init(slotStyle:tag:variant:)(a1, a2, a3);

  return v8;
}

id PillMetrics.init(slotStyle:tag:variant:)(void *a1, void *a2, uint64_t a3)
{
  id v5 = specialized PillMetrics.init(slotStyle:tag:variant:)(a1, a2, a3);

  return v5;
}

void static PillMetrics.localizedFromSenderAttributedString(for:prefix:multiline:maxSenderNames:localization:)(void *a1, char a2, int a3, uint64_t a4, uint64_t a5, void *a6)
{
}

uint64_t static PillMetrics.truncatedLine(from:maxWidth:)(const __CFAttributedString *a1)
{
  CTLineRef v1 = CTLineCreateWithAttributedString(a1);
  uint64_t TruncatedLineWithTokenHandler = CTLineCreateTruncatedLineWithTokenHandler();

  return TruncatedLineWithTokenHandler;
}

__n128 PillMetrics.pillMetrics.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = (uint64_t)&v1[OBJC_IVAR___SLHighlightPillMetrics____lazy_storage___pillMetrics];
  outlined init with take of SLDHighlightPillMetrics?((uint64_t)&v1[OBJC_IVAR___SLHighlightPillMetrics____lazy_storage___pillMetrics], (uint64_t)v17);
  outlined init with take of SLDHighlightPillMetrics?((uint64_t)v17, (uint64_t)v18);
  if (_s11SocialLayer23SLDHighlightPillMetrics33_00C2B47D0280335DFFDBB3BC8927527ALLVSgWOg((uint64_t)v18) == 1)
  {
    closure #1 in PillMetrics.pillMetrics.getter(v1, (uint64_t)v16);
    v14[4] = *(_OWORD *)&v16[64];
    v14[5] = *(_OWORD *)&v16[80];
    v14[6] = *(_OWORD *)&v16[96];
    v14[7] = *(_OWORD *)&v16[112];
    v14[0] = *(_OWORD *)v16;
    v14[1] = *(_OWORD *)&v16[16];
    v14[2] = *(_OWORD *)&v16[32];
    v14[3] = *(_OWORD *)&v16[48];
    destructiveProjectEnumData for SecKeyRef.SecKeyConversionErrors(v14);
    outlined init with take of SLDHighlightPillMetrics?(v3, (uint64_t)v15);
    outlined init with take of SLDHighlightPillMetrics?((uint64_t)v14, v3);
    outlined retain of SLDHighlightPillMetrics((uint64_t)v16);
    outlined release of SLDHighlightPillMetrics?(v15, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined consume of SLDHighlightPillMetrics?);
    uint64_t v4 = *(void *)&v16[120];
    __n128 v12 = *(__n128 *)&v16[104];
    long long v13 = *(_OWORD *)&v16[88];
    long long v10 = *(_OWORD *)&v16[56];
    long long v11 = *(_OWORD *)&v16[72];
    long long v8 = *(_OWORD *)&v16[8];
    long long v9 = *(_OWORD *)&v16[40];
    long long v7 = *(_OWORD *)&v16[24];
    char v5 = v16[0];
  }
  else
  {
    uint64_t v4 = v26;
    __n128 v12 = v25;
    long long v13 = v24;
    long long v10 = v22;
    long long v11 = v23;
    long long v8 = v19;
    long long v9 = v21;
    long long v7 = v20;
    char v5 = v18[0];
  }
  outlined release of SLDHighlightPillMetrics?(v17, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined copy of SLDHighlightPillMetrics?);
  *(unsigned char *)a1 = v5;
  *(_OWORD *)(a1 + 8) = v8;
  *(_OWORD *)(a1 + 24) = v7;
  *(_OWORD *)(a1 + 40) = v9;
  *(_OWORD *)(a1 + 56) = v10;
  *(_OWORD *)(a1 + 72) = v11;
  *(_OWORD *)(a1 + 88) = v13;
  __n128 result = v12;
  *(__n128 *)(a1 + 104) = v12;
  *(void *)(a1 + 120) = v4;
  return result;
}

void closure #1 in PillMetrics.pillMetrics.getter(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for AttributedString();
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v5 = (uint64_t)&a1[OBJC_IVAR___SLHighlightPillMetrics_metrics];
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)&a1[OBJC_IVAR___SLHighlightPillMetrics_metrics], (uint64_t)v205);
  uint64_t v6 = v206;
  double v7 = v207;
  __swift_project_boxed_opaque_existential_1(v205, v206);
  double v8 = (*(double (**)(uint64_t, double))(*(void *)&v7 + 168))(v6, COERCE_DOUBLE(*(void *)&v7));
  uint64_t v184 = v9;
  double v185 = v8;
  double v11 = v10;
  double v187 = v12;
  uint64_t v13 = OBJC_IVAR___SLHighlightPillMetrics_tag;
  objc_msgSend(*(id *)&a1[OBJC_IVAR___SLHighlightPillMetrics_tag], sel_maxWidth);
  double v15 = v14;
  objc_msgSend(a1, sel_avatarKnockoutWidth);
  uint64_t v183 = v16;
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v191);
  uint64_t v17 = v192;
  double v18 = v193;
  __swift_project_boxed_opaque_existential_1(v191, v192);
  double v188 = (*(double (**)(uint64_t, double))(*(void *)&v18 + 88))(v17, COERCE_DOUBLE(*(void *)&v18));
  double v20 = v19;
  uint64_t v22 = v21;
  double v24 = v23;
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v219);
  uint64_t v25 = v220;
  uint64_t v26 = v221;
  __swift_project_boxed_opaque_existential_1(v219, v220);
  double v186 = (*(double (**)(uint64_t, uint64_t))(v26 + 192))(v25, v26);
  uint64_t v182 = v27;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v219);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v191);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
  objc_msgSend(a1, sel_specMaxWidth);
  double v29 = v28;
  objc_msgSend(*(id *)&a1[v13], sel_maxWidth);
  double v31 = v30;
  objc_msgSend(a1, sel_avatarContainerWidth);
  double v33 = v32;
  objc_msgSend(*(id *)&a1[v13], sel_maxWidth);
  if (v34 <= 0.0)
  {
    uint64_t TruncatedLineWithTokenHandler = 0;
    uint64_t v68 = 0;
    double v69 = 0.0;
    uint64_t v70 = v182;
    uint64_t v71 = v183;
    double v72 = v188;
    double v73 = v20;
    uint64_t v74 = v22;
    uint64_t v76 = v184;
    double v75 = v185;
LABEL_58:
    *(unsigned char *)a2 = v34 > 0.0;
    *(double *)(a2 + 8) = v75;
    *(double *)(a2 + 16) = v11;
    *(void *)(a2 + 24) = v76;
    *(double *)(a2 + 32) = v187;
    *(double *)(a2 + 40) = v15;
    *(double *)(a2 + 48) = v69;
    *(void *)(a2 + 56) = TruncatedLineWithTokenHandler;
    *(void *)(a2 + 64) = v68;
    *(void *)(a2 + 72) = v71;
    *(double *)(a2 + 80) = v72;
    *(double *)(a2 + 88) = v73;
    *(void *)(a2 + 96) = v74;
    *(double *)(a2 + 104) = v24;
    *(double *)(a2 + 112) = v186;
    *(void *)(a2 + 120) = v70;
    return;
  }
  double v174 = v34;
  double v178 = v11;
  if (v31 >= v29) {
    double v35 = v29;
  }
  else {
    double v35 = v31;
  }
  char v222 = 1;
  double v172 = v187 + v186 + v24 + v20 + v11 + v33;
  double v36 = v35 - v172;
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
  uint64_t v37 = v206;
  double v38 = v207;
  __swift_project_boxed_opaque_existential_1(v205, v206);
  (*(void (**)(uint64_t, double))(*(void *)&v38 + 128))(v37, COERCE_DOUBLE(*(void *)&v38));
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
  uint64_t v39 = v206;
  double v40 = v207;
  __swift_project_boxed_opaque_existential_1(v205, v206);
  char v41 = (*(uint64_t (**)(uint64_t, double))(*(void *)&v40 + 128))(v39, COERCE_DOUBLE(*(void *)&v40));
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
  if ((v41 & 1) == 0)
  {
    double v177 = v20;
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
    uint64_t v77 = v206;
    double v78 = v207;
    __swift_project_boxed_opaque_existential_1(v205, v206);
    char v79 = (*(uint64_t (**)(uint64_t, double))(*(void *)&v78 + 144))(v77, COERCE_DOUBLE(*(void *)&v78));
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
    uint64_t v80 = *(void **)&a1[v13];
    uint64_t v176 = v22;
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
    if (v79)
    {
      id v81 = v80;
      specialized static PillMetrics.localizedSenderOrNumContactsString(for:metrics:)(v81, v205);
      uint64_t v83 = v82;
      uint64_t v85 = v84;

      __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
      outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
      CFAttributedStringRef v86 = (const __CFAttributedString *)specialized static PillMetrics.senderNameAttributedString(for:metrics:)(v83, v85, v205);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v112 = v206;
      double v113 = v207;
      __swift_project_boxed_opaque_existential_1(v205, v206);
      double v114 = *(uint64_t (**)(uint64_t, void))(*(void *)&v113 + 16);
      double v115 = v80;
      LOBYTE(v112) = v114(v112, *(void *)&v113) & 1;
      outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v191);
      uint64_t v116 = v192;
      double v117 = v193;
      __swift_project_boxed_opaque_existential_1(v191, v192);
      uint64_t v118 = (*(uint64_t (**)(uint64_t, double))(*(void *)&v117 + 40))(v116, COERCE_DOUBLE(*(void *)&v117));
      outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v219);
      uint64_t v119 = v220;
      uint64_t v120 = v221;
      __swift_project_boxed_opaque_existential_1(v219, v220);
      double v121 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v120 + 24))(v119, v120);
      id v122 = objc_msgSend(v121, sel_localization);

      uint64_t v123 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v125 = v124;

      specialized static PillMetrics.localizedFromSenderAttributedString(for:prefix:multiline:maxSenderNames:localization:)(v115, v112, 0, v118, v123, v125);
      uint64_t v127 = v126;
      uint64_t v129 = v128;
      uint64_t v131 = v130;
      swift_bridgeObjectRelease();

      __swift_destroy_boxed_opaque_existential_0((uint64_t)v219);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v191);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
      outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
      id v132 = v127;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      specialized static PillMetrics.fromSenderAttributedString(for:metrics:multiline:)(v132, v129, v131, v205);
      CFAttributedStringRef v86 = v133;

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
    double v44 = v188;
    double v175 = v24;
    CTLineRef v134 = CTLineCreateWithAttributedString(v86);
    uint64_t TruncatedLineWithTokenHandler = (const __CTLine *)CTLineCreateTruncatedLineWithTokenHandler();

    if (TruncatedLineWithTokenHandler)
    {
      CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(TruncatedLineWithTokenHandler, 0);
      double width = BoundsWithOptions.size.width;
      double height = BoundsWithOptions.size.height;
    }
    else
    {
      double width = 0.0;
      double height = 0.0;
    }
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
    uint64_t v137 = v206;
    double v138 = v207;
    __swift_project_boxed_opaque_existential_1(v205, v206);
    double v139 = height
         + (*(double (**)(uint64_t, double))(*(void *)&v138 + 168))(v137, COERCE_DOUBLE(*(void *)&v138));
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
    uint64_t v140 = v206;
    double v141 = v207;
    __swift_project_boxed_opaque_existential_1(v205, v206);
    (*(void (**)(uint64_t, double))(*(void *)&v141 + 168))(v140, COERCE_DOUBLE(*(void *)&v141));
    double v143 = v142;

    double v144 = v139 + v143;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
    uint64_t v68 = 0;
    goto LABEL_57;
  }
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
  uint64_t v42 = v206;
  double v43 = v207;
  __swift_project_boxed_opaque_existential_1(v205, v206);
  double v44 = (*(double (**)(uint64_t, double))(*(void *)&v43 + 88))(v42, COERCE_DOUBLE(*(void *)&v43));
  double v177 = v45;
  uint64_t v47 = v46;
  double v49 = v48;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
  uint64_t v50 = v206;
  double v51 = v207;
  __swift_project_boxed_opaque_existential_1(v205, v206);
  char v52 = (*(uint64_t (**)(uint64_t, double))(*(void *)&v51 + 144))(v50, COERCE_DOUBLE(*(void *)&v51));
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
  id v53 = *(void **)&a1[v13];
  double v175 = v49;
  uint64_t v176 = v47;
  if ((v52 & 1) == 0)
  {
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
    uint64_t v87 = v206;
    double v88 = v207;
    __swift_project_boxed_opaque_existential_1(v205, v206);
    uint64_t v89 = *(uint64_t (**)(uint64_t, void))(*(void *)&v88 + 16);
    v179 = v53;
    LOBYTE(v87) = v89(v87, *(void *)&v88) & 1;
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v191);
    uint64_t v90 = v192;
    double v91 = v193;
    __swift_project_boxed_opaque_existential_1(v191, v192);
    uint64_t v92 = (*(uint64_t (**)(uint64_t, double))(*(void *)&v91 + 40))(v90, COERCE_DOUBLE(*(void *)&v91));
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v219);
    uint64_t v93 = v220;
    uint64_t v94 = v221;
    __swift_project_boxed_opaque_existential_1(v219, v220);
    uint64_t v95 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v94 + 24))(v93, v94);
    id v96 = objc_msgSend(v95, sel_localization);

    uint64_t v97 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    int v99 = v98;

    specialized static PillMetrics.localizedFromSenderAttributedString(for:prefix:multiline:maxSenderNames:localization:)(v179, v87, 1, v92, v97, v99);
    uint64_t v101 = v100;
    CFAttributedStringRef v59 = v102;
    uint64_t v104 = v103;
    swift_bridgeObjectRelease();

    __swift_destroy_boxed_opaque_existential_0((uint64_t)v219);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v191);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
    id v105 = v101;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    specialized static PillMetrics.fromSenderAttributedString(for:metrics:multiline:)(v105, (uint64_t)v59, v104, v205);
    uint64_t v107 = v106;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
    v170 = v107;
    attributedStringSplitByLineBreak(inString:)(v107);
    unint64_t v109 = v108;
    if (v108 >> 62)
    {
      swift_bridgeObjectRetain();
      unint64_t v63 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v63 = *(void *)((v108 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    double v189 = v44;
    v171 = v105;
    if ((uint64_t)v63 < 1)
    {
      type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSAttributedString);
      AttributedString.init(stringLiteral:)();
      CFAttributedStringRef v180 = (const __CFAttributedString *)NSAttributedString.init(_:)();
    }
    else if ((v109 & 0xC000000000000001) != 0)
    {
      CFAttributedStringRef v180 = (const __CFAttributedString *)MEMORY[0x19F390AB0](0, v109);
      if (v63 > 1)
      {
        CFAttributedStringRef v110 = (const __CFAttributedString *)MEMORY[0x19F390AB0](1, v109);
LABEL_27:
        CFAttributedStringRef v111 = v110;
        swift_bridgeObjectRelease();
LABEL_36:
        CTLineRef v146 = CTLineCreateWithAttributedString(v180);
        uint64_t TruncatedLineWithTokenHandler = (const __CTLine *)CTLineCreateTruncatedLineWithTokenHandler();

        v147 = TruncatedLineWithTokenHandler;
        CTLineRef v148 = CTLineCreateWithAttributedString(v111);
        uint64_t v68 = (void *)CTLineCreateTruncatedLineWithTokenHandler();

        uint64_t v149 = v68;
        CGFloat v150 = 0.0;
        CGFloat x = 0.0;
        CGFloat y = 0.0;
        double width = 0.0;
        CGFloat v153 = 0.0;
        if (v147)
        {
          CGRect v224 = CTLineGetBoundsWithOptions(v147, 0);
          CGFloat x = v224.origin.x;
          CGFloat y = v224.origin.y;
          double width = v224.size.width;
          CGFloat v153 = v224.size.height;
        }
        CGFloat v154 = 0.0;
        double v155 = 0.0;
        CGFloat v156 = 0.0;
        if (v149)
        {
          CGRect v225 = CTLineGetBoundsWithOptions(v149, 0);
          CGFloat v150 = v225.origin.x;
          CGFloat v154 = v225.origin.y;
          double v155 = v225.size.width;
          CGFloat v156 = v225.size.height;
        }
        v226.origin.CGFloat x = x;
        v226.origin.CGFloat y = y;
        v226.size.double width = width;
        v226.size.double height = v153;
        double v157 = CGRectGetHeight(v226);
        v227.origin.CGFloat x = v150;
        v227.origin.CGFloat y = v154;
        v227.size.double width = v155;
        v227.size.double height = v156;
        double v158 = CGRectGetHeight(v227);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        double v159 = v157 + v158;
        double v44 = v189;
        goto LABEL_54;
      }
    }
    else
    {
      if (!*(void *)((v109 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_45;
      }
      CFAttributedStringRef v180 = (const __CFAttributedString *)*(id *)(v109 + 32);
      if (v63 > 1)
      {
        if (*(void *)((v109 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
        {
LABEL_62:
          __break(1u);
          goto LABEL_63;
        }
        CFAttributedStringRef v110 = (const __CFAttributedString *)*(id *)(v109 + 40);
        goto LABEL_27;
      }
    }
    swift_bridgeObjectRelease();
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSAttributedString);
    AttributedString.init(stringLiteral:)();
    CFAttributedStringRef v111 = (const __CFAttributedString *)NSAttributedString.init(_:)();
    goto LABEL_36;
  }
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
  id v54 = v53;
  specialized static PillMetrics.localizedSenderOrNumContactsString(for:metrics:)(v54, v205);
  uint64_t v56 = v55;
  uint64_t v58 = v57;

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
  CFAttributedStringRef v59 = (const __CFAttributedString *)specialized static PillMetrics.senderNameAttributedString(for:metrics:)(v56, v58, v205);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
  uint64_t v60 = v206;
  double v61 = v207;
  __swift_project_boxed_opaque_existential_1(v205, v206);
  LOBYTE(v54) = (*(uint64_t (**)(uint64_t, double))(*(void *)&v61 + 136))(v60, COERCE_DOUBLE(*(void *)&v61));
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
  if ((v54 & 1) == 0)
  {
    CTLineRef v145 = CTLineCreateWithAttributedString(v59);
    uint64_t TruncatedLineWithTokenHandler = (const __CTLine *)CTLineCreateTruncatedLineWithTokenHandler();

LABEL_48:
    uint64_t v68 = 0;
    goto LABEL_49;
  }
  id v62 = *(id *)&a1[OBJC_IVAR___SLHighlightPillMetrics_style];
  unint64_t v63 = (unint64_t)specialized static PillMetrics.senderLabelMultilineWithLineWrap(fullString:maxLineWidth:style:)(v59, v62, v36);

  if (!(v63 >> 62))
  {
    uint64_t v64 = *(void *)((v63 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v64 >= 1) {
      goto LABEL_10;
    }
LABEL_46:
    uint64_t TruncatedLineWithTokenHandler = 0;
    goto LABEL_47;
  }
LABEL_45:
  swift_bridgeObjectRetain();
  uint64_t v64 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v64 < 1) {
    goto LABEL_46;
  }
LABEL_10:
  if ((v63 & 0xC000000000000001) != 0)
  {
    uint64_t TruncatedLineWithTokenHandler = (const __CTLine *)MEMORY[0x19F390AB0](0, v63);
    if ((unint64_t)v64 > 1)
    {
      id v67 = (id)MEMORY[0x19F390AB0](1, v63);
      goto LABEL_15;
    }
    goto LABEL_47;
  }
  if (!*(void *)((v63 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_62;
  }
  uint64_t TruncatedLineWithTokenHandler = *(const __CTLine **)(v63 + 32);
  uint64_t v66 = TruncatedLineWithTokenHandler;
  if ((unint64_t)v64 <= 1)
  {
LABEL_47:
    swift_bridgeObjectRelease();
    goto LABEL_48;
  }
  if (*(void *)((v63 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
  {
    id v67 = *(id *)(v63 + 40);
LABEL_15:
    uint64_t v68 = v67;
    swift_bridgeObjectRelease();
LABEL_49:
    double v155 = 0.0;
    double width = 0.0;
    if (TruncatedLineWithTokenHandler)
    {
      CGRect v228 = CTLineGetBoundsWithOptions(TruncatedLineWithTokenHandler, 0);
      double width = v228.size.width;
    }
    if (v68)
    {
      CGRect v229 = CTLineGetBoundsWithOptions((CTLineRef)v68, 0);
      double v155 = v229.size.width;
    }
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
    specialized static PillMetrics.doubleLineFontHeight(for:)(v205);
    double v159 = v160;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);

LABEL_54:
    if (width <= v155) {
      double width = v155;
    }
    id v161 = v68;
    v162 = TruncatedLineWithTokenHandler;
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
    uint64_t v163 = v206;
    double v164 = v207;
    __swift_project_boxed_opaque_existential_1(v205, v206);
    double v165 = v159
         + (*(double (**)(uint64_t, double))(*(void *)&v164 + 168))(v163, COERCE_DOUBLE(*(void *)&v164));
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
    outlined init with copy of HighlightDisambiguationPillMetricVariant(v5, (uint64_t)v205);
    uint64_t v166 = v206;
    double v167 = v207;
    __swift_project_boxed_opaque_existential_1(v205, v206);
    (*(void (**)(uint64_t, double))(*(void *)&v167 + 168))(v166, COERCE_DOUBLE(*(void *)&v167));
    double v169 = v168;

    double v144 = v165 + v169;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v205);
LABEL_57:
    double v181 = v144;
    double v190 = v44;
    LOBYTE(v191[0]) = 1;
    uint64_t v76 = v184;
    double v75 = v185;
    *(double *)&v191[1] = v185;
    *(double *)&v191[2] = v178;
    uint64_t v192 = v184;
    double v193 = v187;
    double v195 = v144;
    double v173 = v172 + width;
    double v194 = v173;
    v196 = TruncatedLineWithTokenHandler;
    v197 = v68;
    uint64_t v70 = v182;
    uint64_t v71 = v183;
    uint64_t v198 = v183;
    double v199 = v44;
    double v73 = v177;
    double v200 = v177;
    uint64_t v201 = v176;
    double v24 = v175;
    double v202 = v175;
    double v203 = v186;
    uint64_t v204 = v182;
    LOBYTE(v205[0]) = v222;
    *(double *)&v205[1] = v185;
    *(double *)&v205[2] = v178;
    uint64_t v206 = v184;
    double v207 = v187;
    double v208 = v173;
    double v209 = v181;
    v210 = TruncatedLineWithTokenHandler;
    v211 = v68;
    uint64_t v212 = v183;
    double v213 = v190;
    double v214 = v177;
    uint64_t v215 = v176;
    double v216 = v175;
    double v217 = v186;
    uint64_t v218 = v182;
    outlined retain of SLDHighlightPillMetrics((uint64_t)v191);
    outlined release of SLDHighlightPillMetrics((uint64_t)v205);
    double v72 = v190;
    double v69 = v181;
    uint64_t v74 = v176;
    double v11 = v178;
    double v15 = v173;
    double v34 = v174;
    goto LABEL_58;
  }
LABEL_63:
  __break(1u);
}

id PillMetrics.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void PillMetrics.init()()
{
}

id PillMetrics.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PillMetrics();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

double PillMetrics.margins.getter()
{
  PillMetrics.pillMetrics.getter((uint64_t)v1);
  outlined release of SLDHighlightPillMetrics((uint64_t)v1);
  return *(double *)&v1[1];
}

double PillMetrics.pillSize.getter()
{
  PillMetrics.pillMetrics.getter((uint64_t)v1);
  outlined release of SLDHighlightPillMetrics((uint64_t)v1);
  return *(double *)&v1[5];
}

uint64_t PillMetrics.hasValidMetricsForDrawing.getter()
{
  PillMetrics.pillMetrics.getter((uint64_t)v1);
  outlined release of SLDHighlightPillMetrics((uint64_t)v1);
  return v1[0];
}

id PillMetrics.firstLine.getter()
{
  PillMetrics.pillMetrics.getter((uint64_t)v3);
  id v0 = v4;
  id v1 = v4;
  outlined release of SLDHighlightPillMetrics((uint64_t)v3);
  return v0;
}

id PillMetrics.secondLine.getter()
{
  PillMetrics.pillMetrics.getter((uint64_t)v3);
  id v0 = v4;
  id v1 = v4;
  outlined release of SLDHighlightPillMetrics((uint64_t)v3);
  return v0;
}

double PillMetrics.overlappedAvatarKnockoutBorderWidth.getter()
{
  PillMetrics.pillMetrics.getter((uint64_t)v1);
  outlined release of SLDHighlightPillMetrics((uint64_t)v1);
  return *(double *)&v1[9];
}

double PillMetrics.labelHorizontalMargins.getter()
{
  PillMetrics.pillMetrics.getter((uint64_t)v1);
  outlined release of SLDHighlightPillMetrics((uint64_t)v1);
  return *(double *)&v1[10];
}

double PillMetrics.specMaxWidth.getter()
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v5);
  uint64_t v1 = v6;
  uint64_t v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  double v3 = (*(double (**)(uint64_t, uint64_t))(v2 + 80))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

double PillMetrics.minimumLabelHorizontalMargines.getter()
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v5);
  uint64_t v1 = v6;
  uint64_t v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  double v3 = (*(double (**)(uint64_t, uint64_t))(v2 + 88))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

double PillMetrics.avatarDiameter.getter()
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v5);
  uint64_t v1 = v6;
  uint64_t v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  double v3 = (*(double (**)(uint64_t, uint64_t))(v2 + 96))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

double PillMetrics.avatarContainerWidth.getter()
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v5);
  uint64_t v1 = v6;
  uint64_t v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  double v3 = (*(double (**)(uint64_t, uint64_t))(v2 + 112))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

double PillMetrics.avatarKnockoutWidth.getter()
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v5);
  uint64_t v1 = v6;
  uint64_t v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  double v3 = (*(double (**)(uint64_t, uint64_t))(v2 + 120))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

double PillMetrics.overlappedAvatarVisibleWidth.getter()
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v5);
  uint64_t v1 = v6;
  uint64_t v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  double v3 = (*(double (**)(uint64_t, uint64_t))(v2 + 104))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

uint64_t PillMetrics.useDoubleLinedLabel.getter()
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v4);
  uint64_t v1 = v5;
  uint64_t v2 = v6;
  __swift_project_boxed_opaque_existential_1(v4, v5);
  LOBYTE(v1) = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 128))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return v1 & 1;
}

double PillMetrics.chevronSize.getter()
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v5);
  uint64_t v1 = v6;
  uint64_t v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  double v3 = (*(double (**)(uint64_t, uint64_t))(v2 + 192))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

id static PillMetrics.metricsPlaceholder(for:variant:maxWidth:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v5 = a1;
  switch(a2)
  {
    case 0:
      *(void *)(a3 + 24) = &type metadata for iOSPillMetric;
      *(void *)(a3 + 32) = &protocol witness table for iOSPillMetric;
      goto LABEL_13;
    case 1:
      *(void *)(a3 + 24) = &type metadata for iOSPillMetric;
      *(void *)(a3 + 32) = &protocol witness table for iOSPillMetric;
      goto LABEL_16;
    case 2:
      *(void *)(a3 + 24) = &type metadata for MacPillMetric;
      *(void *)(a3 + 32) = &protocol witness table for MacPillMetric;
      goto LABEL_13;
    case 3:
      *(void *)(a3 + 24) = &type metadata for MacPillMetric;
      *(void *)(a3 + 32) = &protocol witness table for MacPillMetric;
      goto LABEL_16;
    case 4:
      *(void *)(a3 + 24) = &type metadata for MacSafariBannerPillMetrics;
      *(void *)(a3 + 32) = &protocol witness table for MacSafariBannerPillMetrics;
      goto LABEL_13;
    case 5:
      *(void *)(a3 + 24) = &type metadata for MacSafariBannerPillMetrics;
      *(void *)(a3 + 32) = &protocol witness table for MacSafariBannerPillMetrics;
      goto LABEL_16;
    case 6:
      *(void *)(a3 + 24) = &type metadata for iOSSafariBannerPillMetrics;
      *(void *)(a3 + 32) = &protocol witness table for iOSSafariBannerPillMetrics;
      goto LABEL_13;
    case 7:
      *(void *)(a3 + 24) = &type metadata for iOSSafariBannerPillMetrics;
      *(void *)(a3 + 32) = &protocol witness table for iOSSafariBannerPillMetrics;
      goto LABEL_16;
    case 8:
      *(void *)(a3 + 24) = &type metadata for TVPillMetrics;
      *(void *)(a3 + 32) = &protocol witness table for TVPillMetrics;
      *(void *)a3 = a1;
      *(double *)(a3 + 8) = a4;
      double v8 = (void *)(a3 + 16);
      goto LABEL_18;
    case 9:
      *(void *)(a3 + 24) = &type metadata for VisionPillMetric;
      *(void *)(a3 + 32) = &protocol witness table for VisionPillMetric;
      goto LABEL_13;
    case 10:
      *(void *)(a3 + 24) = &type metadata for VisionPillMetric;
      *(void *)(a3 + 32) = &protocol witness table for VisionPillMetric;
      goto LABEL_16;
    case 11:
      *(void *)(a3 + 24) = &type metadata for VisionSafariBannerPillMetric;
      *(void *)(a3 + 32) = &protocol witness table for VisionSafariBannerPillMetric;
LABEL_13:
      uint64_t v7 = swift_allocObject();
      uint64_t v5 = a1;
      *(void *)a3 = v7;
      *(void *)(v7 + 16) = a1;
      *(unsigned char *)(v7 + 24) = 0;
      break;
    case 12:
      *(void *)(a3 + 24) = &type metadata for VisionSafariBannerPillMetric;
      *(void *)(a3 + 32) = &protocol witness table for VisionSafariBannerPillMetric;
LABEL_16:
      uint64_t v7 = swift_allocObject();
      uint64_t v5 = a1;
      *(void *)a3 = v7;
      *(void *)(v7 + 16) = a1;
      *(unsigned char *)(v7 + 24) = 1;
      break;
    default:
      type metadata accessor for SLHighlightPillMetricVariant(0);
      _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
      __break(1u);
      JUMPOUT(0x19BEB8CA4);
  }
  *(double *)(v7 + 32) = a4;
  double v8 = (void *)(v7 + 40);
LABEL_18:
  void *v8 = 1;
  return v5;
}

double static PillMetrics.pillHeight(style:variant:maxWidth:)(void *a1, uint64_t a2, double a3)
{
  static PillMetrics.metricsPlaceholder(for:variant:maxWidth:)(a1, a2, (uint64_t)v34, a3);
  uint64_t v3 = v35;
  uint64_t v4 = v36;
  __swift_project_boxed_opaque_existential_1(v34, v35);
  double v5 = (*(double (**)(uint64_t, uint64_t))(v4 + 168))(v3, v4);
  double v7 = v6;
  uint64_t v8 = v35;
  uint64_t v9 = v36;
  __swift_project_boxed_opaque_existential_1(v34, v35);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v9 + 128))(v8, v9))
  {
    specialized static PillMetrics.doubleLineFontHeight(for:)(v34);
    double height = v10;
  }
  else
  {
    uint64_t v12 = v35;
    uint64_t v13 = v36;
    __swift_project_boxed_opaque_existential_1(v34, v35);
    double v14 = (*(double (**)(uint64_t, uint64_t))(v13 + 96))(v12, v13);
    uint64_t v15 = v35;
    uint64_t v16 = v36;
    __swift_project_boxed_opaque_existential_1(v34, v35);
    LOBYTE(v15) = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 16))(v15, v16) & 1;
    uint64_t v17 = v35;
    uint64_t v18 = v36;
    __swift_project_boxed_opaque_existential_1(v34, v35);
    double v19 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v18 + 24))(v17, v18);
    id v20 = objc_msgSend(v19, sel_localization);

    uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    double v23 = v22;

    v24._uint64_t countAndFlagsBits = 0x6C6F686563616C50;
    v24._object = (void *)0xEB00000000726564;
    v25.value._uint64_t countAndFlagsBits = v21;
    v25.value._object = v23;
    Swift::tuple_localizedString_NSMutableAttributedString_baseFontTargetRanges_OpaquePointer_senderFontTargetRanges_OpaquePointer v37 = NameAttributionLocAttributedString(prefix:name:multiline:localization:)((SocialLayer::AttributionTextPrefix)v15, v24, 0, v25);
    Class isa = v37.localizedString.super.super.isa;
    rawValue = v37.baseFontTargetRanges._rawValue;
    double v28 = v37.senderFontTargetRanges._rawValue;
    swift_bridgeObjectRelease();
    double v29 = isa;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    specialized static PillMetrics.fromSenderAttributedString(for:metrics:multiline:)(v29, (uint64_t)rawValue, (uint64_t)v28, v34);
    CFAttributedStringRef v31 = v30;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    double v32 = CTLineCreateWithAttributedString(v31);

    CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v32, 0);
    double height = BoundsWithOptions.size.height;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if (v14 > height) {
      double height = v14;
    }
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
  return v7 + v5 + height;
}

double static PillMetrics.pillMargins(style:variant:maxWidth:)(void *a1, uint64_t a2, double a3)
{
  static PillMetrics.metricsPlaceholder(for:variant:maxWidth:)(a1, a2, (uint64_t)v7, a3);
  uint64_t v3 = v8;
  uint64_t v4 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  double v5 = (*(double (**)(uint64_t, uint64_t))(v4 + 168))(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5;
}

uint64_t static PillMetrics.maxSendersToDisplay(style:variant:)(void *a1, uint64_t a2)
{
  static PillMetrics.metricsPlaceholder(for:variant:maxWidth:)(a1, a2, (uint64_t)v9, 100.0);
  uint64_t v2 = v10;
  uint64_t v3 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 40))(v2, v3);
  uint64_t v5 = v10;
  uint64_t v6 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 48))(v5, v6);
  if (v7 > v4) {
    uint64_t v4 = v7;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  return v4;
}

uint64_t static PillMetrics.chevronFontDescriptor(style:variant:)(void *a1, uint64_t a2)
{
  static PillMetrics.metricsPlaceholder(for:variant:maxWidth:)(a1, a2, (uint64_t)v6, 100.0);
  uint64_t v2 = v7;
  uint64_t v3 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 184))(v2, v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

double static PillMetrics.chevronSize(style:variant:)(void *a1, uint64_t a2)
{
  static PillMetrics.metricsPlaceholder(for:variant:maxWidth:)(a1, a2, (uint64_t)v6, 100.0);
  uint64_t v2 = v7;
  uint64_t v3 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  double v4 = (*(double (**)(uint64_t, uint64_t))(v3 + 192))(v2, v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

uint64_t PillMetrics.imageCount.getter()
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v5);
  uint64_t v1 = v6;
  uint64_t v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 64))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

uint64_t PillMetrics.shouldDisplayPin.getter()
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v4);
  uint64_t v1 = v5;
  uint64_t v2 = v6;
  __swift_project_boxed_opaque_existential_1(v4, v5);
  LOBYTE(v1) = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 72))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return v1 & 1;
}

uint64_t PillMetrics.chevronFontDescriptor.getter()
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v5);
  uint64_t v1 = v6;
  uint64_t v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 184))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

uint64_t PillMetrics.baseFont.getter()
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant(v0 + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v5);
  uint64_t v1 = v6;
  uint64_t v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 152))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

uint64_t sub_19BEB9A00()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t partial apply for closure #1 in MeAttributionLocAttributedString(prefix:multiline:localization:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return closure #1 in MeAttributionLocAttributedString(prefix:multiline:localization:)(a1, a2, a3, a4, *(uint64_t **)(v4 + 16), *(uint64_t **)(v4 + 24));
}

uint64_t sub_19BEB9A2C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t partial apply for thunk for @callee_guaranteed (@in_guaranteed Any?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ()()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_19BEB9A7C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_19BEB9A8C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_19BEB9A9C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_19BEB9AAC()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_19BEB9ABC()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_19BEB9ACC()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

id specialized PillMetrics.init(slotStyle:tag:variant:)(void *a1, void *a2, uint64_t a3)
{
  uint64_t v7 = (uint64_t)&v3[OBJC_IVAR___SLHighlightPillMetrics____lazy_storage___pillMetrics];
  _s11SocialLayer23SLDHighlightPillMetrics33_00C2B47D0280335DFFDBB3BC8927527ALLVSgWOi0_((uint64_t)v51);
  outlined init with take of SLDHighlightPillMetrics?((uint64_t)v51, v7);
  switch(a3)
  {
    case 0:
      uint64_t v8 = v3;
      id v9 = a1;
      objc_msgSend(a2, sel_maxWidth);
      uint64_t v11 = v10;
      id v12 = objc_msgSend(a2, sel_maxPossibleImageCount);
      uint64_t v13 = (uint64_t *)&v8[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      v13[3] = (uint64_t)&type metadata for iOSPillMetric;
      void v13[4] = (uint64_t)&protocol witness table for iOSPillMetric;
      goto LABEL_13;
    case 1:
      uint64_t v26 = v3;
      id v21 = a1;
      objc_msgSend(a2, sel_maxWidth);
      uint64_t v11 = v27;
      id v12 = objc_msgSend(a2, sel_maxPossibleImageCount);
      double v23 = (uint64_t *)&v26[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      v23[3] = (uint64_t)&type metadata for iOSPillMetric;
      v23[4] = (uint64_t)&protocol witness table for iOSPillMetric;
      goto LABEL_16;
    case 2:
      Swift::String v24 = v3;
      id v9 = a1;
      objc_msgSend(a2, sel_maxWidth);
      uint64_t v11 = v25;
      id v12 = objc_msgSend(a2, sel_maxPossibleImageCount);
      uint64_t v13 = (uint64_t *)&v24[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      v13[3] = (uint64_t)&type metadata for MacPillMetric;
      void v13[4] = (uint64_t)&protocol witness table for MacPillMetric;
      goto LABEL_13;
    case 3:
      double v28 = v3;
      id v21 = a1;
      objc_msgSend(a2, sel_maxWidth);
      uint64_t v11 = v29;
      id v12 = objc_msgSend(a2, sel_maxPossibleImageCount);
      double v23 = (uint64_t *)&v28[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      v23[3] = (uint64_t)&type metadata for MacPillMetric;
      v23[4] = (uint64_t)&protocol witness table for MacPillMetric;
      goto LABEL_16;
    case 4:
      uint64_t v16 = v3;
      id v9 = a1;
      objc_msgSend(a2, sel_maxWidth);
      uint64_t v11 = v17;
      id v12 = objc_msgSend(a2, sel_maxPossibleImageCount);
      uint64_t v13 = (uint64_t *)&v16[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      v13[3] = (uint64_t)&type metadata for MacSafariBannerPillMetrics;
      void v13[4] = (uint64_t)&protocol witness table for MacSafariBannerPillMetrics;
      goto LABEL_13;
    case 5:
      double v32 = v3;
      id v21 = a1;
      objc_msgSend(a2, sel_maxWidth);
      uint64_t v11 = v33;
      id v12 = objc_msgSend(a2, sel_maxPossibleImageCount);
      double v23 = (uint64_t *)&v32[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      v23[3] = (uint64_t)&type metadata for MacSafariBannerPillMetrics;
      v23[4] = (uint64_t)&protocol witness table for MacSafariBannerPillMetrics;
      goto LABEL_16;
    case 6:
      double v34 = v3;
      id v9 = a1;
      objc_msgSend(a2, sel_maxWidth);
      uint64_t v11 = v35;
      id v12 = objc_msgSend(a2, sel_maxPossibleImageCount);
      uint64_t v13 = (uint64_t *)&v34[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      v13[3] = (uint64_t)&type metadata for iOSSafariBannerPillMetrics;
      void v13[4] = (uint64_t)&protocol witness table for iOSSafariBannerPillMetrics;
      goto LABEL_13;
    case 7:
      CFAttributedStringRef v30 = v3;
      id v21 = a1;
      objc_msgSend(a2, sel_maxWidth);
      uint64_t v11 = v31;
      id v12 = objc_msgSend(a2, sel_maxPossibleImageCount);
      double v23 = (uint64_t *)&v30[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      v23[3] = (uint64_t)&type metadata for iOSSafariBannerPillMetrics;
      v23[4] = (uint64_t)&protocol witness table for iOSSafariBannerPillMetrics;
      goto LABEL_16;
    case 8:
      Swift::tuple_localizedString_NSMutableAttributedString_baseFontTargetRanges_OpaquePointer_senderFontTargetRanges_OpaquePointer v37 = v3;
      id v38 = a1;
      objc_msgSend(a2, sel_maxWidth);
      uint64_t v40 = v39;
      id v41 = objc_msgSend(a2, sel_maxPossibleImageCount);
      uint64_t v42 = &v37[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      *(void *)uint64_t v42 = v38;
      *((void *)v42 + 1) = v40;
      *((void *)v42 + 3) = &type metadata for TVPillMetrics;
      *((void *)v42 + 4) = &protocol witness table for TVPillMetrics;
      *((void *)v42 + 2) = v41;
      goto LABEL_18;
    case 9:
      uint64_t v18 = v3;
      id v9 = a1;
      objc_msgSend(a2, sel_maxWidth);
      uint64_t v11 = v19;
      id v12 = objc_msgSend(a2, sel_maxPossibleImageCount);
      uint64_t v13 = (uint64_t *)&v18[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      v13[3] = (uint64_t)&type metadata for VisionPillMetric;
      void v13[4] = (uint64_t)&protocol witness table for VisionPillMetric;
      goto LABEL_13;
    case 10:
      double v43 = v3;
      id v21 = a1;
      objc_msgSend(a2, sel_maxWidth);
      uint64_t v11 = v44;
      id v12 = objc_msgSend(a2, sel_maxPossibleImageCount);
      double v23 = (uint64_t *)&v43[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      v23[3] = (uint64_t)&type metadata for VisionPillMetric;
      v23[4] = (uint64_t)&protocol witness table for VisionPillMetric;
      goto LABEL_16;
    case 11:
      double v14 = v3;
      id v9 = a1;
      objc_msgSend(a2, sel_maxWidth);
      uint64_t v11 = v15;
      id v12 = objc_msgSend(a2, sel_maxPossibleImageCount);
      uint64_t v13 = (uint64_t *)&v14[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      v13[3] = (uint64_t)&type metadata for VisionSafariBannerPillMetric;
      void v13[4] = (uint64_t)&protocol witness table for VisionSafariBannerPillMetric;
LABEL_13:
      uint64_t v36 = swift_allocObject();
      uint64_t *v13 = v36;
      *(void *)(v36 + 16) = v9;
      *(unsigned char *)(v36 + 24) = 0;
      break;
    case 12:
      id v20 = v3;
      id v21 = a1;
      objc_msgSend(a2, sel_maxWidth);
      uint64_t v11 = v22;
      id v12 = objc_msgSend(a2, sel_maxPossibleImageCount);
      double v23 = (uint64_t *)&v20[OBJC_IVAR___SLHighlightPillMetrics_metrics];
      v23[3] = (uint64_t)&type metadata for VisionSafariBannerPillMetric;
      v23[4] = (uint64_t)&protocol witness table for VisionSafariBannerPillMetric;
LABEL_16:
      uint64_t v36 = swift_allocObject();
      *double v23 = v36;
      *(void *)(v36 + 16) = v21;
      *(unsigned char *)(v36 + 24) = 1;
      break;
    default:
      type metadata accessor for SLHighlightPillMetricVariant(0);
      uint64_t v50 = a3;
      double v48 = v3;
      _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
      __break(1u);
      JUMPOUT(0x19BEBA190);
  }
  *(void *)(v36 + 32) = v11;
  *(void *)(v36 + 40) = v12;
LABEL_18:
  *(void *)&v3[OBJC_IVAR___SLHighlightPillMetrics_style] = a1;
  *(void *)&v3[OBJC_IVAR___SLHighlightPillMetrics_tag] = a2;
  *(void *)&v3[OBJC_IVAR___SLHighlightPillMetrics_variant] = a3;
  id v45 = a1;
  id v46 = a2;

  v49.receiver = v3;
  v49.super_class = (Class)type metadata accessor for PillMetrics();
  return objc_msgSendSuper2(&v49, sel_init);
}

void specialized static PillMetrics.fromSenderAttributedString(for:metrics:multiline:)(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!objc_msgSend(v7, sel_length)) {
    goto LABEL_5;
  }
  unint64_t v8 = (unint64_t)objc_msgSend(v7, sel_length);
  if ((v8 & 0x8000000000000000) != 0) {
    goto LABEL_49;
  }
  int64_t v9 = v8;
  uint64_t v84 = a3;
  uint64_t v85 = a2;
  id v86 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19BED1BD0;
  uint64_t v11 = (void *)*MEMORY[0x1E4FB06F8];
  *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
  uint64_t v12 = a4[3];
  uint64_t v13 = a4[4];
  __swift_project_boxed_opaque_existential_1(a4, v12);
  double v14 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 152);
  id v83 = v11;
  uint64_t v15 = v14(v12, v13);
  type metadata accessor for CTFontRef(0);
  uint64_t v16 = (void **)MEMORY[0x1E4FB0700];
  *(void *)(inited + 40) = v15;
  uint64_t v17 = *v16;
  uint64_t v82 = v18;
  *(void *)(inited + 64) = v18;
  *(void *)(inited + 72) = v17;
  uint64_t v19 = a4[3];
  uint64_t v20 = a4[4];
  __swift_project_boxed_opaque_existential_1(a4, v19);
  id v21 = *(uint64_t (**)(uint64_t, uint64_t))(v20 + 24);
  id v81 = v17;
  uint64_t v22 = (void *)v21(v19, v20);
  id v23 = objc_msgSend(v22, sel_userInterfaceStyle);

  if (v23)
  {
    CGFloat v24 = 1.0;
    CGFloat v25 = 1.0;
    CGFloat v26 = 1.0;
  }
  else
  {
    CGFloat v24 = 0.0;
    CGFloat v25 = 0.0;
    CGFloat v26 = 0.0;
  }
  CGColorRef GenericRGB = CGColorCreateGenericRGB(v24, v25, v26, 1.0);
  type metadata accessor for CGColorRef(0);
  double v28 = (void **)MEMORY[0x1E4F284F8];
  *(void *)(inited + 80) = GenericRGB;
  uint64_t v29 = *v28;
  uint64_t v80 = v30;
  *(void *)(inited + 104) = v30;
  *(void *)(inited + 112) = v29;
  uint64_t v31 = a4[3];
  uint64_t v32 = a4[4];
  __swift_project_boxed_opaque_existential_1(a4, v31);
  uint64_t v33 = *(uint64_t (**)(uint64_t, uint64_t))(v32 + 24);
  id v34 = v29;
  uint64_t v35 = (void *)v33(v31, v32);
  id v36 = objc_msgSend(v35, sel_localization);

  uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v39 = v38;

  *(void *)(inited + 144) = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 120) = v37;
  *(void *)(inited + 128) = v39;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  uint64_t v40 = swift_initStackObject();
  *(_OWORD *)(v40 + 16) = xmmword_19BED1BD0;
  *(void *)(v40 + 32) = v83;
  uint64_t v42 = a4[3];
  uint64_t v41 = a4[4];
  __swift_project_boxed_opaque_existential_1(a4, v42);
  double v43 = *(uint64_t (**)(uint64_t, uint64_t))(v41 + 160);
  id v44 = v83;
  *(void *)(v40 + 40) = v43(v42, v41);
  *(void *)(v40 + 64) = v82;
  *(void *)(v40 + 72) = v81;
  uint64_t v45 = a4[3];
  uint64_t v46 = a4[4];
  __swift_project_boxed_opaque_existential_1(a4, v45);
  uint64_t v47 = *(uint64_t (**)(uint64_t, uint64_t))(v46 + 24);
  id v48 = v81;
  objc_super v49 = (void *)v47(v45, v46);
  id v50 = objc_msgSend(v49, sel_userInterfaceStyle);

  if (v50)
  {
    CGFloat v51 = 1.0;
    CGFloat v52 = 1.0;
    CGFloat v53 = 1.0;
  }
  else
  {
    CGFloat v51 = 0.0;
    CGFloat v52 = 0.0;
    CGFloat v53 = 0.0;
  }
  *(void *)(v40 + 80) = CGColorCreateGenericRGB(v51, v52, v53, 1.0);
  *(void *)(v40 + 104) = v80;
  *(void *)(v40 + 112) = v34;
  uint64_t v54 = a4[3];
  uint64_t v55 = a4[4];
  __swift_project_boxed_opaque_existential_1(a4, v54);
  uint64_t v56 = *(uint64_t (**)(uint64_t, uint64_t))(v55 + 24);
  id v57 = v34;
  uint64_t v58 = (void *)v56(v54, v55);
  id v59 = objc_msgSend(v58, sel_localization);

  uint64_t v60 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v62 = v61;

  *(void *)(v40 + 144) = MEMORY[0x1E4FBB1A0];
  *(void *)(v40 + 120) = v60;
  *(void *)(v40 + 128) = v62;
  specialized Dictionary.init(dictionaryLiteral:)(v40);
  uint64_t v63 = *(void *)(v85 + 16);
  if (!v63)
  {
LABEL_27:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v72 = *(void *)(v84 + 16);
    if (v72)
    {
      double v73 = (uint64_t *)(v84 + 40);
      do
      {
        uint64_t v74 = *(v73 - 1);
        uint64_t v75 = *v73;
        uint64_t v76 = v74 + *v73;
        if (__OFADD__(v74, *v73)) {
          goto LABEL_46;
        }
        if (v9 >= v76) {
          uint64_t v77 = v74 + *v73;
        }
        else {
          uint64_t v77 = v9;
        }
        if (v74 > 0 || v76 <= 0)
        {
          if (v74 < 0 || v74 >= v9) {
            goto LABEL_29;
          }
          BOOL v70 = __OFSUB__(v77, v74);
          v77 -= v74;
          if (v70) {
            goto LABEL_48;
          }
        }
        if (v77 >= 1)
        {
          type metadata accessor for NSAttributedStringKey(0);
          lazy protocol witness table accessor for type AttributedString.FormattingOptions and conformance AttributedString.FormattingOptions(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, type metadata accessor for NSAttributedStringKey);
          Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
          objc_msgSend(v86, sel_setAttributes_range_, isa, v74, v75);
        }
LABEL_29:
        v73 += 2;
        --v72;
      }
      while (v72);
    }
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v64 = (uint64_t *)(v85 + 40);
  while (1)
  {
    uint64_t v65 = *(v64 - 1);
    uint64_t v66 = *v64;
    uint64_t v67 = v65 + *v64;
    if (__OFADD__(v65, *v64)) {
      break;
    }
    if (v9 >= v67) {
      uint64_t v68 = v65 + *v64;
    }
    else {
      uint64_t v68 = v9;
    }
    if (v65 <= 0 && v67 > 0) {
      goto LABEL_25;
    }
    if ((v65 & 0x8000000000000000) == 0 && v65 < v9)
    {
      BOOL v70 = __OFSUB__(v68, v65);
      v68 -= v65;
      if (v70) {
        goto LABEL_47;
      }
LABEL_25:
      if (v68 >= 1)
      {
        type metadata accessor for NSAttributedStringKey(0);
        lazy protocol witness table accessor for type AttributedString.FormattingOptions and conformance AttributedString.FormattingOptions(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, type metadata accessor for NSAttributedStringKey);
        Class v71 = Dictionary._bridgeToObjectiveC()().super.isa;
        objc_msgSend(v86, sel_setAttributes_range_, v71, v65, v66);
      }
    }
    v64 += 2;
    if (!--v63) {
      goto LABEL_27;
    }
  }
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
}

void specialized static PillMetrics.doubleLineFontHeight(for:)(void *a1)
{
  uint64_t v3 = type metadata accessor for AttributedString();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v4 = a1[3];
  uint64_t v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  LOBYTE(v4) = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5) & 1;
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v6);
  unint64_t v8 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v7 + 24))(v6, v7);
  id v9 = objc_msgSend(v8, sel_localization);

  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;

  v13._uint64_t countAndFlagsBits = 0x6C6F686563616C50;
  v13._object = (void *)0xEB00000000726564;
  v14.value._uint64_t countAndFlagsBits = v10;
  v14.value._object = v12;
  Swift::tuple_localizedString_NSMutableAttributedString_baseFontTargetRanges_OpaquePointer_senderFontTargetRanges_OpaquePointer v29 = NameAttributionLocAttributedString(prefix:name:multiline:localization:)((SocialLayer::AttributionTextPrefix)v4, v13, 1, v14);
  Class isa = v29.localizedString.super.super.isa;
  rawValue = v29.baseFontTargetRanges._rawValue;
  uint64_t v17 = v29.senderFontTargetRanges._rawValue;
  swift_bridgeObjectRelease();
  uint64_t v18 = isa;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized static PillMetrics.fromSenderAttributedString(for:metrics:multiline:)(v18, (uint64_t)rawValue, (uint64_t)v17, a1);
  uint64_t v20 = v19;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  attributedStringSplitByLineBreak(inString:)(v20);
  unint64_t v22 = v21;
  if (!(v21 >> 62))
  {
    uint64_t v23 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v23 >= 1) {
      goto LABEL_3;
    }
LABEL_12:
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSAttributedString);
    AttributedString.init(stringLiteral:)();
    CFAttributedStringRef v1 = (const __CFAttributedString *)NSAttributedString.init(_:)();
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v23 < 1) {
    goto LABEL_12;
  }
LABEL_3:
  if ((v22 & 0xC000000000000001) != 0)
  {
    CFAttributedStringRef v24 = (const __CFAttributedString *)MEMORY[0x19F390AB0](0, v22);
  }
  else
  {
    if (!*(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_17;
    }
    CFAttributedStringRef v24 = (const __CFAttributedString *)*(id *)(v22 + 32);
  }
  CFAttributedStringRef v1 = v24;
  if ((unint64_t)v23 < 2)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSAttributedString);
    AttributedString.init(stringLiteral:)();
    CFAttributedStringRef v26 = (const __CFAttributedString *)NSAttributedString.init(_:)();
    goto LABEL_14;
  }
  if ((v22 & 0xC000000000000001) != 0)
  {
LABEL_17:
    CFAttributedStringRef v25 = (const __CFAttributedString *)MEMORY[0x19F390AB0](1, v22);
    goto LABEL_10;
  }
  if (*(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
  {
    CFAttributedStringRef v25 = (const __CFAttributedString *)*(id *)(v22 + 40);
LABEL_10:
    CFAttributedStringRef v26 = v25;
    swift_bridgeObjectRelease();
LABEL_14:
    uint64_t v27 = CTLineCreateWithAttributedString(v1);
    CTLineGetBoundsWithOptions(v27, 0);
    double v28 = CTLineCreateWithAttributedString(v26);
    CTLineGetBoundsWithOptions(v28, 0);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return;
  }
  __break(1u);
}

void specialized static PillMetrics.localizedSenderOrNumContactsString(for:metrics:)(void *a1, void *a2)
{
  double v88 = a2;
  uint64_t v3 = type metadata accessor for Locale();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v89 = (char *)&v87 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for String.LocalizationValue();
  uint64_t v90 = *(void *)(v5 - 8);
  uint64_t v91 = v5;
  uint64_t v6 = MEMORY[0x1F4188790](v5);
  unint64_t v8 = (char *)&v87 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x1F4188790](v6);
  uint64_t v11 = (char *)&v87 - v10;
  uint64_t v12 = MEMORY[0x1F4188790](v9);
  Swift::String_optional v14 = (char *)&v87 - v13;
  uint64_t v15 = MEMORY[0x1F4188790](v12);
  uint64_t v87 = (char *)&v87 - v16;
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v19 = (char *)&v87 - v18;
  MEMORY[0x1F4188790](v17);
  unint64_t v21 = (char *)&v87 - v20;
  id v22 = objc_msgSend(a1, sel_groupName);
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v26 = v25;
  }
  else
  {
    uint64_t v24 = 0;
    unint64_t v26 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  uint64_t v27 = HIBYTE(v26) & 0xF;
  if ((v26 & 0x2000000000000000) == 0) {
    uint64_t v27 = v24 & 0xFFFFFFFFFFFFLL;
  }
  if (v27)
  {
    id v28 = objc_msgSend(a1, sel_groupName);
    if (v28)
    {
      id v29 = v28;
LABEL_9:
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      return;
    }
    goto LABEL_64;
  }
  id v30 = objc_msgSend(a1, sel_sendersToDisplay);
  type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for SLPerson);
  unint64_t v31 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v31 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v32 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v32 = *(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v32 != 1 || objc_msgSend(a1, sel_allSendersCount) != (id)1)
  {
    String.LocalizationValue.init(stringLiteral:)();
    uint64_t v47 = v88[3];
    uint64_t v48 = v88[4];
    __swift_project_boxed_opaque_existential_1(v88, v47);
    objc_super v49 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v48 + 24))(v47, v48);
    id v50 = objc_msgSend(v49, sel_localization);

    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v52 = v90;
    uint64_t v51 = v91;
    (*(void (**)(char *, char *, uint64_t))(v90 + 16))(v8, v11, v91);
    id v53 = SLFrameworkBundle();
    swift_bridgeObjectRetain();
    static Locale.current.getter();
    String.init(localized:table:bundle:localization:locale:comment:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v11, v51);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v54 = swift_allocObject();
    *(_OWORD *)(v54 + 16) = xmmword_19BED1BC0;
    id v55 = objc_msgSend(a1, sel_allSendersCount);
    uint64_t v56 = MEMORY[0x1E4FBB5C8];
    *(void *)(v54 + 56) = MEMORY[0x1E4FBB550];
    *(void *)(v54 + 64) = v56;
    *(void *)(v54 + 32) = v55;
    static String.localizedStringWithFormat(_:_:)();
    swift_bridgeObjectRelease();
LABEL_22:
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v33 = &selRef_initWithSlotStyle_tag_variant_;
  id v34 = objc_msgSend(a1, sel_sendersToDisplay);
  unint64_t v35 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v35 >> 62))
  {
    if (*(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_16;
    }
LABEL_48:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_49;
  }
  swift_bridgeObjectRetain();
  uint64_t v73 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v73) {
    goto LABEL_48;
  }
LABEL_16:
  if ((v35 & 0xC000000000000001) != 0)
  {
LABEL_49:
    id v36 = (id)MEMORY[0x19F390AB0](0, v35);
    goto LABEL_19;
  }
  if (!*(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_51;
  }
  id v36 = *(id *)(v35 + 32);
LABEL_19:
  uint64_t v37 = v36;
  swift_bridgeObjectRelease();
  type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSObject);
  id v38 = objc_msgSend(a1, sel_meSender);
  char v39 = static NSObject.== infix(_:_:)();

  if (v39)
  {
    String.LocalizationValue.init(stringLiteral:)();
    uint64_t v40 = v88[3];
    uint64_t v41 = v88[4];
    __swift_project_boxed_opaque_existential_1(v88, v40);
    uint64_t v42 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v41 + 24))(v40, v41);
    id v43 = objc_msgSend(v42, sel_localization);

    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v45 = v90;
    uint64_t v44 = v91;
    (*(void (**)(char *, char *, uint64_t))(v90 + 16))(v19, v21, v91);
    id v46 = SLFrameworkBundle();
    swift_bridgeObjectRetain();
    static Locale.current.getter();
    String.init(localized:table:bundle:localization:locale:comment:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v21, v44);
    return;
  }
  id v57 = objc_msgSend(a1, sel_sendersToDisplay);
  unint64_t v35 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v35 >> 62))
  {
    if (*(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_25;
    }
LABEL_52:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_53;
  }
LABEL_51:
  swift_bridgeObjectRetain();
  uint64_t v74 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v74) {
    goto LABEL_52;
  }
LABEL_25:
  if ((v35 & 0xC000000000000001) != 0)
  {
LABEL_53:
    id v58 = (id)MEMORY[0x19F390AB0](0, v35);
    goto LABEL_28;
  }
  if (!*(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_55;
  }
  id v58 = *(id *)(v35 + 32);
LABEL_28:
  id v59 = v58;
  swift_bridgeObjectRelease();
  uint64_t v33 = &selRef_setModalTransitionStyle_;
  id v60 = objc_msgSend(v59, sel_shortDisplayName);

  uint64_t v61 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v63 = v62;

  swift_bridgeObjectRelease();
  if ((v63 & 0x2000000000000000) != 0) {
    uint64_t v64 = HIBYTE(v63) & 0xF;
  }
  else {
    uint64_t v64 = v61 & 0xFFFFFFFFFFFFLL;
  }
  id v65 = objc_msgSend(a1, sel_sendersToDisplay);
  unint64_t v35 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  unint64_t v66 = v35 >> 62;
  if (v64)
  {
    if (!v66)
    {
      if (*(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_34;
      }
      goto LABEL_56;
    }
LABEL_55:
    swift_bridgeObjectRetain();
    uint64_t v75 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v75)
    {
LABEL_34:
      if ((v35 & 0xC000000000000001) == 0)
      {
        if (*(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          id v67 = *(id *)(v35 + 32);
LABEL_37:
          uint64_t v68 = v67;
          swift_bridgeObjectRelease();
          id v29 = [v68 v33[105]];

          goto LABEL_9;
        }
        __break(1u);
LABEL_59:
        swift_bridgeObjectRetain();
        uint64_t v76 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (!v76) {
          goto LABEL_60;
        }
        goto LABEL_40;
      }
LABEL_57:
      id v67 = (id)MEMORY[0x19F390AB0](0, v35);
      goto LABEL_37;
    }
LABEL_56:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_57;
  }
  if (v66) {
    goto LABEL_59;
  }
  if (!*(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_60:
    swift_bridgeObjectRelease();
LABEL_61:
    uint64_t v77 = v87;
    String.LocalizationValue.init(stringLiteral:)();
    uint64_t v78 = v88[3];
    uint64_t v79 = v88[4];
    __swift_project_boxed_opaque_existential_1(v88, v78);
    uint64_t v80 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v79 + 24))(v78, v79);
    id v81 = objc_msgSend(v80, sel_localization);

    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v83 = v90;
    uint64_t v82 = v91;
    (*(void (**)(char *, char *, uint64_t))(v90 + 16))(v14, v77, v91);
    id v84 = SLFrameworkBundle();
    swift_bridgeObjectRetain();
    static Locale.current.getter();
    String.init(localized:table:bundle:localization:locale:comment:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v83 + 8))(v77, v82);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v85 = swift_allocObject();
    *(_OWORD *)(v85 + 16) = xmmword_19BED1BC0;
    uint64_t v86 = MEMORY[0x1E4FBB5C8];
    *(void *)(v85 + 56) = MEMORY[0x1E4FBB550];
    *(void *)(v85 + 64) = v86;
    *(void *)(v85 + 32) = 1;
    static String.localizedStringWithFormat(_:_:)();
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
LABEL_40:
  if ((v35 & 0xC000000000000001) != 0)
  {
    id v69 = (id)MEMORY[0x19F390AB0](0, v35);
    goto LABEL_43;
  }
  if (*(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v69 = *(id *)(v35 + 32);
LABEL_43:
    BOOL v70 = v69;
    swift_bridgeObjectRelease();
    id v71 = SLFormattedDisplayNameForPerson(v70);
    if (v71)
    {
      uint64_t v72 = v71;
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      return;
    }

    goto LABEL_61;
  }
  __break(1u);
LABEL_64:
  __break(1u);
}

void specialized static PillMetrics.localizedFromSenderAttributedString(for:prefix:multiline:maxSenderNames:localization:)(void *a1, char a2, int a3, uint64_t a4, uint64_t a5, id a6)
{
  uint64_t v114 = a4;
  int v113 = a3;
  int v9 = a2 & 1;
  uint64_t v10 = type metadata accessor for Locale();
  MEMORY[0x1F4188790](v10 - 8);
  CFAttributedStringRef v111 = (char *)&v98 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = type metadata accessor for String.LocalizationValue();
  uint64_t v12 = *(char ***)(v110 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v110);
  unint64_t v109 = (char *)&v98 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char **)((char *)&v98 - v15);
  id v17 = objc_msgSend(a1, sel_groupName);
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v21 = v20;
  }
  else
  {
    uint64_t v19 = 0;
    unint64_t v21 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  uint64_t v22 = HIBYTE(v21) & 0xF;
  if ((v21 & 0x2000000000000000) == 0) {
    uint64_t v22 = v19 & 0xFFFFFFFFFFFFLL;
  }
  if (v22)
  {
    id v23 = objc_msgSend(a1, sel_groupName);
    if (v23)
    {
      id v24 = v23;
LABEL_9:
      uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v27 = v26;

      v28._uint64_t countAndFlagsBits = v25;
      v28._object = v27;
      v29.value._uint64_t countAndFlagsBits = a5;
      v29.value._object = a6;
      NameAttributionLocAttributedString(prefix:name:multiline:localization:)((SocialLayer::AttributionTextPrefix)v9, v28, v113 & 1, v29);
LABEL_10:
      swift_bridgeObjectRelease();
      return;
    }
    goto LABEL_122;
  }
  unint64_t v30 = (unint64_t)&selRef_initWithSlotStyle_tag_variant_;
  id v31 = objc_msgSend(a1, sel_sendersToDisplay);
  unint64_t v32 = type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for SLPerson);
  unint64_t v33 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v33 >> 62) {
    goto LABEL_85;
  }
  uint64_t v34 = *(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_13:
  swift_bridgeObjectRelease();
  if (v34 != 1 || objc_msgSend(a1, sel_allSendersCount) != (id)1)
  {
    if (v114 < 2)
    {
      id v62 = objc_msgSend(a1, sel_allSendersCount);
LABEL_101:
      Swift::Int v91 = (Swift::Int)v62;
      Swift::Bool v92 = v113 & 1;
      SocialLayer::AttributionTextPrefix v93 = (char)v9;
LABEL_102:
      v94.value._uint64_t countAndFlagsBits = a5;
      v94.value._object = a6;
      NumContactsAttributionLocAttributedString(prefix:numContacts:multiline:localization:)(v93, v91, v92, v94);
      return;
    }
    unint64_t v42 = (unint64_t)[a1 *(SEL *)(v30 + 3104)];
    uint64_t v34 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if ((unint64_t)v34 >> 62)
    {
      if (v34 < 0) {
        unint64_t v32 = v34;
      }
      else {
        unint64_t v32 = v34 & 0xFFFFFFFFFFFFFF8;
      }
      swift_bridgeObjectRetain();
      unint64_t v30 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      id v112 = a1;
      if (v30)
      {
LABEL_25:
        unint64_t v105 = v34 & 0xC000000000000001;
        uint64_t v102 = a5;
        id v103 = a6;
        uint64_t v108 = v34;
        if ((v34 & 0xC000000000000001) == 0)
        {
          uint64_t v99 = v34 & 0xFFFFFFFFFFFFFF8;
          if (!*(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_109;
          }
          unint64_t v32 = (unint64_t)*(id *)(v34 + 32);
          goto LABEL_28;
        }
LABEL_107:
        unint64_t v32 = MEMORY[0x19F390AB0](0, v34);
        uint64_t v99 = v34 & 0xFFFFFFFFFFFFFF8;
LABEL_28:
        uint64_t v43 = type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSObject);
        a5 = 0;
        uint64_t v100 = (void (**)(char **, uint64_t))(v12 + 1);
        uint64_t v101 = (void (**)(char *, char **, uint64_t))(v12 + 2);
        unint64_t v106 = v30 - 1;
        uint64_t v107 = v43;
        a1 = (void *)MEMORY[0x1E4FBC860];
        uint64_t v12 = &selRef_setModalTransitionStyle_;
        int v104 = v9;
        while (1)
        {
          id v44 = objc_msgSend(v112, sel_meSender);
          char v45 = static NSObject.== infix(_:_:)();

          if (v45)
          {
            String.LocalizationValue.init(stringLiteral:)();
            uint64_t v46 = v110;
            (*v101)(v109, v16, v110);
            id v47 = SLFrameworkBundle();
            swift_bridgeObjectRetain();
            a6 = v111;
            static Locale.current.getter();
            uint64_t v48 = String.init(localized:table:bundle:localization:locale:comment:)();
            unint64_t v30 = v49;
            (*v100)(v16, v46);
            uint64_t v50 = HIBYTE(v30) & 0xF;
            if ((v30 & 0x2000000000000000) == 0) {
              uint64_t v50 = v48 & 0xFFFFFFFFFFFFLL;
            }
            if (v50)
            {
LABEL_42:
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                a1 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2] + 1, 1, a1);
              }
              unint64_t v58 = a1[2];
              unint64_t v57 = a1[3];
              a6 = (id)(v58 + 1);
              if (v58 >= v57 >> 1) {
                a1 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v57 > 1), v58 + 1, 1, a1);
              }
              a1[2] = a6;
              id v59 = &a1[2 * v58];
              v59[4] = v48;
              v59[5] = v30;
            }
            else
            {

              swift_bridgeObjectRelease();
            }
            int v9 = v104;
            goto LABEL_50;
          }
          id v51 = objc_msgSend((id)v32, sel_shortDisplayName);
          unint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v53 = v52;

          swift_bridgeObjectRelease();
          uint64_t v54 = HIBYTE(v53) & 0xF;
          if ((v53 & 0x2000000000000000) == 0) {
            uint64_t v54 = v30 & 0xFFFFFFFFFFFFLL;
          }
          if (v54)
          {
            a6 = objc_msgSend((id)v32, sel_shortDisplayName);
          }
          else
          {
            a6 = SLFormattedDisplayNameForPerson((void *)v32);
            if (!a6) {
              goto LABEL_49;
            }
          }
          uint64_t v48 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v30 = v55;

          uint64_t v56 = HIBYTE(v30) & 0xF;
          if ((v30 & 0x2000000000000000) == 0) {
            uint64_t v56 = v48 & 0xFFFFFFFFFFFFLL;
          }
          if (v56) {
            goto LABEL_42;
          }
          swift_bridgeObjectRelease();
LABEL_49:

LABEL_50:
          if (v106 == a5) {
            goto LABEL_74;
          }
          unint64_t v60 = a5 + 1;
          if (v105)
          {
            id v61 = (id)MEMORY[0x19F390AB0](a5 + 1, v108);
          }
          else
          {
            if (v60 >= *(void *)(v99 + 16)) {
              goto LABEL_84;
            }
            id v61 = *(id *)(v108 + 8 * a5 + 40);
          }
          unint64_t v32 = (unint64_t)v61;
          if (__OFADD__(v60, 1))
          {
            __break(1u);
LABEL_84:
            __break(1u);
LABEL_85:
            swift_bridgeObjectRetain();
            uint64_t v34 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
            goto LABEL_13;
          }
          ++a5;
          if (a1[2] >= v114)
          {

LABEL_74:
            swift_bridgeObjectRelease();
            a5 = v102;
            a6 = v103;
            goto LABEL_91;
          }
        }
      }
    }
    else
    {
      unint64_t v30 = *(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id v112 = a1;
      if (v30) {
        goto LABEL_25;
      }
    }
    swift_bridgeObjectRelease();
    a1 = (void *)MEMORY[0x1E4FBC860];
LABEL_91:
    id v84 = v112;
    if (a1[2] < (uint64_t)objc_msgSend(v112, sel_allSendersCount))
    {
      id v85 = objc_msgSend(v84, sel_allSendersCount);
      uint64_t v86 = a1[2];
      Swift::Int v87 = (Swift::Int)v85 - v86;
      if (!__OFSUB__(v85, v86)) {
        goto LABEL_96;
      }
      __break(1u);
    }
    Swift::Int v87 = 0;
LABEL_96:
    Swift::String v88 = formattedDisplayNameListAndNOthers(prefix:names:nOthers:localization:)((SocialLayer::AttributionTextPrefix)v9, (Swift::OpaquePointer)a1, v87, (Swift::String_optional)0);
    swift_bridgeObjectRelease();
    unint64_t v89 = ((unint64_t)v88._object >> 56) & 0xF;
    if (((uint64_t)v88._object & 0x2000000000000000) == 0) {
      unint64_t v89 = v88._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
    }
    if (v89)
    {
      v90.value._uint64_t countAndFlagsBits = a5;
      v90.value._object = a6;
      ListOfNamesAttributionLocAttributedString(prefix:listOfNamesString:multiline:localization:)((SocialLayer::AttributionTextPrefix)v9, v88, v113 & 1, v90);
      goto LABEL_10;
    }
    swift_bridgeObjectRelease();
    id v62 = objc_msgSend(v112, sel_allSendersCount);
    goto LABEL_101;
  }
  id v35 = [a1 *(SEL *)(v30 + 3104)];
  unint64_t v36 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v36 >> 62))
  {
    uint64_t v12 = *(char ***)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v12) {
      goto LABEL_17;
    }
LABEL_104:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_105;
  }
  swift_bridgeObjectRetain();
  uint64_t v12 = (char **)_CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v12) {
    goto LABEL_104;
  }
LABEL_17:
  if ((v36 & 0xC000000000000001) == 0)
  {
    if (*(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v37 = *(id *)(v36 + 32);
      goto LABEL_20;
    }
    __break(1u);
    goto LABEL_107;
  }
LABEL_105:
  id v37 = (id)MEMORY[0x19F390AB0](0, v36);
LABEL_20:
  id v38 = v37;
  swift_bridgeObjectRelease();
  type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSObject);
  id v39 = objc_msgSend(a1, sel_meSender);
  char v40 = static NSObject.== infix(_:_:)();

  if (v40)
  {
    v41.value._uint64_t countAndFlagsBits = a5;
    v41.value._object = a6;
    MeAttributionLocAttributedString(prefix:multiline:localization:)((SocialLayer::AttributionTextPrefix)v9, v113 & 1, v41);
    return;
  }
  id v63 = [a1 *(SEL *)(v30 + 3104)];
  unint64_t v42 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v42 >> 62))
  {
    if (*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_61;
    }
LABEL_110:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_111;
  }
LABEL_109:
  swift_bridgeObjectRetain();
  uint64_t v95 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v95) {
    goto LABEL_110;
  }
LABEL_61:
  if ((v42 & 0xC000000000000001) != 0)
  {
LABEL_111:
    id v64 = (id)MEMORY[0x19F390AB0](0, v42);
    goto LABEL_64;
  }
  if (!*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_113;
  }
  id v64 = *(id *)(v42 + 32);
LABEL_64:
  id v65 = v64;
  swift_bridgeObjectRelease();
  uint64_t v16 = &selRef_setModalTransitionStyle_;
  id v66 = objc_msgSend(v65, sel_shortDisplayName);

  uint64_t v67 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v69 = v68;

  swift_bridgeObjectRelease();
  if ((v69 & 0x2000000000000000) != 0) {
    uint64_t v70 = HIBYTE(v69) & 0xF;
  }
  else {
    uint64_t v70 = v67 & 0xFFFFFFFFFFFFLL;
  }
  id v71 = [a1 *(SEL *)(v30 + 3104)];
  unint64_t v32 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  unint64_t v72 = v32 >> 62;
  if (v70)
  {
    if (!v72)
    {
      if (*(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_70;
      }
      goto LABEL_114;
    }
LABEL_113:
    swift_bridgeObjectRetain();
    uint64_t v96 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v96)
    {
LABEL_70:
      if ((v32 & 0xC000000000000001) == 0)
      {
        if (*(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          id v73 = *(id *)(v32 + 32);
LABEL_73:
          uint64_t v74 = v73;
          swift_bridgeObjectRelease();
          id v24 = [v74 v16[105]];

          goto LABEL_9;
        }
        __break(1u);
LABEL_117:
        swift_bridgeObjectRetain();
        uint64_t v97 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (!v97) {
          goto LABEL_118;
        }
        goto LABEL_77;
      }
LABEL_115:
      id v73 = (id)MEMORY[0x19F390AB0](0, v32);
      goto LABEL_73;
    }
LABEL_114:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_115;
  }
  if (v72) {
    goto LABEL_117;
  }
  if (!*(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_118:
    swift_bridgeObjectRelease();
LABEL_119:
    Swift::Bool v92 = v113 & 1;
    SocialLayer::AttributionTextPrefix v93 = (char)v9;
    Swift::Int v91 = 1;
    goto LABEL_102;
  }
LABEL_77:
  if ((v32 & 0xC000000000000001) != 0)
  {
    id v75 = (id)MEMORY[0x19F390AB0](0, v32);
    goto LABEL_80;
  }
  if (*(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v75 = *(id *)(v32 + 32);
LABEL_80:
    uint64_t v76 = v75;
    swift_bridgeObjectRelease();
    id v77 = SLFormattedDisplayNameForPerson(v76);
    if (v77)
    {
      uint64_t v78 = v77;
      uint64_t v79 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      id v81 = v80;

      v82._uint64_t countAndFlagsBits = v79;
      v82._object = v81;
      v83.value._uint64_t countAndFlagsBits = a5;
      v83.value._object = a6;
      NameAttributionLocAttributedString(prefix:name:multiline:localization:)((SocialLayer::AttributionTextPrefix)v9, v82, v113 & 1, v83);
      swift_bridgeObjectRelease();

      return;
    }

    goto LABEL_119;
  }
  __break(1u);
LABEL_122:
  __break(1u);
}

uint64_t type metadata accessor for PillMetrics()
{
  return self;
}

uint64_t outlined release of SLDHighlightPillMetrics(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 64);

  return a1;
}

id specialized static PillMetrics.senderNameAttributedString(for:metrics:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = type metadata accessor for AttributedString();
  MEMORY[0x1F4188790](v6 - 8);
  if (String.count.getter() < 1)
  {
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSMutableAttributedString);
    AttributedString.init(stringLiteral:)();
    id v9 = (id)NSAttributedString.init(_:)();
  }
  else
  {
    id v7 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
    swift_bridgeObjectRetain();
    unint64_t v8 = (void *)MEMORY[0x19F3906A0](a1, a2);
    swift_bridgeObjectRelease();
    id v9 = objc_msgSend(v7, sel_initWithString_, v8);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19BED1BD0;
  uint64_t v11 = (void *)*MEMORY[0x1E4FB06F8];
  *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
  uint64_t v12 = a3[3];
  uint64_t v13 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v12);
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 160);
  id v15 = v11;
  uint64_t v16 = v14(v12, v13);
  type metadata accessor for CTFontRef(0);
  id v17 = (void **)MEMORY[0x1E4FB0700];
  *(void *)(inited + 40) = v16;
  uint64_t v18 = *v17;
  *(void *)(inited + 64) = v19;
  *(void *)(inited + 72) = v18;
  uint64_t v20 = a3[3];
  uint64_t v21 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v20);
  uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t))(v21 + 24);
  id v23 = v18;
  id v24 = (void *)v22(v20, v21);
  id v25 = objc_msgSend(v24, sel_userInterfaceStyle);

  if (v25)
  {
    CGFloat v26 = 1.0;
    CGFloat v27 = 1.0;
    CGFloat v28 = 1.0;
  }
  else
  {
    CGFloat v26 = 0.0;
    CGFloat v27 = 0.0;
    CGFloat v28 = 0.0;
  }
  CGColorRef GenericRGB = CGColorCreateGenericRGB(v26, v27, v28, 1.0);
  type metadata accessor for CGColorRef(0);
  unint64_t v30 = (void **)MEMORY[0x1E4F284F8];
  *(void *)(inited + 80) = GenericRGB;
  id v31 = *v30;
  *(void *)(inited + 104) = v32;
  *(void *)(inited + 112) = v31;
  uint64_t v33 = a3[3];
  uint64_t v34 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v33);
  id v35 = *(uint64_t (**)(uint64_t, uint64_t))(v34 + 24);
  id v36 = v31;
  id v37 = (void *)v35(v33, v34);
  id v38 = objc_msgSend(v37, sel_localization);

  uint64_t v39 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v41 = v40;

  *(void *)(inited + 144) = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 120) = v39;
  *(void *)(inited + 128) = v41;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for NSAttributedStringKey(0);
  lazy protocol witness table accessor for type AttributedString.FormattingOptions and conformance AttributedString.FormattingOptions(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, type metadata accessor for NSAttributedStringKey);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setAttributes_range_, isa, 0, objc_msgSend(v9, sel_length));

  return v9;
}

const __CTLine *specialized static PillMetrics.senderLabelMultilineWithLineWrap(fullString:maxLineWidth:style:)(const __CFAttributedString *a1, void *a2, CGFloat a3)
{
  uint64_t v6 = type metadata accessor for AttributedString();
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v39 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 result = CTLineCreateWithAttributedString(a1);
  if (!result)
  {
    __break(1u);
    return result;
  }
  id v9 = result;
  CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(result, 0);
  if (CGRectGetWidth(BoundsWithOptions) <= a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    uint64_t v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_19BED2800;
    *(void *)(v33 + 32) = v9;
    uint64_t v40 = v33;
    specialized Array._endMutation()();
    return (const __CTLine *)v40;
  }
  CTLineRef v10 = CTLineCreateWithAttributedString(a1);
  uint64_t TruncatedLineWithTokenHandler = (const __CTLine *)CTLineCreateTruncatedLineWithTokenHandler();

  id v12 = objc_msgSend(a2, sel_localization);
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  HyphenatedLineWithOffset = v14;

  id v16 = objc_allocWithZone(MEMORY[0x1E4F1CA20]);
  id v17 = (void *)MEMORY[0x19F3906A0](v13, HyphenatedLineWithOffset);
  swift_bridgeObjectRelease();
  CFLocaleRef v18 = (const __CFLocale *)objc_msgSend(v16, sel_initWithLocaleIdentifier_, v17);

  id v19 = [(__CFAttributedString *)a1 length];
  id v20 = [(__CFAttributedString *)a1 length];
  CFIndex v21 = (CFIndex)v20 - 1;
  if (__OFSUB__(v20, 1))
  {
LABEL_34:
    __break(1u);
LABEL_35:
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    goto LABEL_25;
  }
  id v38 = TruncatedLineWithTokenHandler;
  while (1)
  {
    id v24 = (__CFString *)[(__CFAttributedString *)a1 string];
    if (!v24)
    {
      uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      id v24 = (__CFString *)MEMORY[0x19F3906A0](v25);
      swift_bridgeObjectRelease();
    }
    v42.location = 0;
    v42.length = (CFIndex)v19;
    int64_t v26 = SLDGetHyphenationPosition(v24, v21, v42, v18);

    if (v26 == -1 || v26 >= v21)
    {
      HyphenatedLineWithOffset = 0;
      uint64_t v34 = v38;
      goto LABEL_23;
    }
    CGFloat v28 = v9;
    Swift::String_optional v29 = (void *)MEMORY[0x19F3906A0](45, 0xE100000000000000);
    HyphenatedLineWithOffset = (const __CTLine *)CTLineCreateHyphenatedLineWithOffset();

    CGRect v45 = CTLineGetBoundsWithOptions(HyphenatedLineWithOffset, 0);
    if (CGRectGetWidth(v45) <= a3) {
      break;
    }
LABEL_8:

    CFIndex v21 = v26;
  }
  id v30 = [(__CFAttributedString *)a1 length];
  NSUInteger v31 = (NSUInteger)v30 - v26;
  if (__OFSUB__(v30, v26))
  {
    __break(1u);
    goto LABEL_34;
  }
  v41.location = 0;
  v41.length = (NSUInteger)v19;
  v43.location = v26;
  v43.length = v31;
  NSRange v32 = NSUnionRange(v41, v43);
  if (v32.location || (id)v32.length != v19)
  {
    type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for NSAttributedString);
    AttributedString.init(stringLiteral:)();
    id v22 = (id)NSAttributedString.init(_:)();
  }
  else
  {
    id v22 = -[__CFAttributedString attributedSubstringFromRange:](a1, sel_attributedSubstringFromRange_, v26, v31);
  }
  id v23 = v22;
  if ((uint64_t)objc_msgSend(v22, sel_length) < 1)
  {

    goto LABEL_8;
  }

  uint64_t v34 = HyphenatedLineWithOffset;
  CTLineRef v35 = CTLineCreateWithAttributedString((CFAttributedStringRef)v23);
  HyphenatedLineWithOffset = (const __CTLine *)CTLineCreateTruncatedLineWithTokenHandler();

LABEL_23:
  uint64_t v40 = MEMORY[0x1E4FBC860];
  if (!v34)
  {

    id v9 = HyphenatedLineWithOffset;
    goto LABEL_31;
  }
  a1 = v34;
  MEMORY[0x19F390820]();
  if (*(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    goto LABEL_35;
  }
LABEL_25:
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  if (HyphenatedLineWithOffset)
  {
    id v36 = HyphenatedLineWithOffset;
    MEMORY[0x19F390820]();
    if (*(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
  }
LABEL_31:

  return (const __CTLine *)v40;
}

uint64_t specialized static PillMetrics.accessibilityLabel(for:)(void *a1)
{
  id v2 = objc_msgSend(a1, sel_sendersToDisplay);
  type metadata accessor for SLHighlight(0, &lazy cache variable for type metadata for SLPerson);
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v4) {
    goto LABEL_10;
  }
  id v5 = objc_msgSend(a1, sel_groupName);
  if (v5)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v8 = v7;

    id v5 = (id)(v6 & 0xFFFFFFFFFFFFLL);
  }
  else
  {
    unint64_t v8 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0) {
    uint64_t v9 = (uint64_t)v5;
  }
  if (!v9) {
    return 0;
  }
LABEL_10:
  specialized static PillMetrics.localizedFromSenderAttributedString(for:prefix:multiline:maxSenderNames:localization:)(a1, 0, 0, 3, 0, 0);
  uint64_t v11 = v10;
  id v12 = objc_msgSend(v10, sel_string);
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v13;
}

unint64_t lazy protocol witness table accessor for type AttributionTextPrefix and conformance AttributionTextPrefix()
{
  unint64_t result = lazy protocol witness table cache variable for type AttributionTextPrefix and conformance AttributionTextPrefix;
  if (!lazy protocol witness table cache variable for type AttributionTextPrefix and conformance AttributionTextPrefix)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AttributionTextPrefix and conformance AttributionTextPrefix);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type HighlightPillSenderNameAttribute and conformance HighlightPillSenderNameAttribute()
{
  unint64_t result = lazy protocol witness table cache variable for type HighlightPillSenderNameAttribute and conformance HighlightPillSenderNameAttribute;
  if (!lazy protocol witness table cache variable for type HighlightPillSenderNameAttribute and conformance HighlightPillSenderNameAttribute)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HighlightPillSenderNameAttribute and conformance HighlightPillSenderNameAttribute);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type HighlightPillSenderNameAttribute and conformance HighlightPillSenderNameAttribute;
  if (!lazy protocol witness table cache variable for type HighlightPillSenderNameAttribute and conformance HighlightPillSenderNameAttribute)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HighlightPillSenderNameAttribute and conformance HighlightPillSenderNameAttribute);
  }
  return result;
}

uint64_t associated type witness table accessor for AttributedStringKey.Value : Hashable in HighlightPillSenderNameAttribute()
{
  return MEMORY[0x1E4FBB3A0];
}

unint64_t lazy protocol witness table accessor for type HighlightPillNumContactsAttribute and conformance HighlightPillNumContactsAttribute()
{
  unint64_t result = lazy protocol witness table cache variable for type HighlightPillNumContactsAttribute and conformance HighlightPillNumContactsAttribute;
  if (!lazy protocol witness table cache variable for type HighlightPillNumContactsAttribute and conformance HighlightPillNumContactsAttribute)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HighlightPillNumContactsAttribute and conformance HighlightPillNumContactsAttribute);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type HighlightPillNumContactsAttribute and conformance HighlightPillNumContactsAttribute;
  if (!lazy protocol witness table cache variable for type HighlightPillNumContactsAttribute and conformance HighlightPillNumContactsAttribute)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HighlightPillNumContactsAttribute and conformance HighlightPillNumContactsAttribute);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type HighlightPillListOfNamesAttribute and conformance HighlightPillListOfNamesAttribute()
{
  unint64_t result = lazy protocol witness table cache variable for type HighlightPillListOfNamesAttribute and conformance HighlightPillListOfNamesAttribute;
  if (!lazy protocol witness table cache variable for type HighlightPillListOfNamesAttribute and conformance HighlightPillListOfNamesAttribute)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HighlightPillListOfNamesAttribute and conformance HighlightPillListOfNamesAttribute);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type HighlightPillListOfNamesAttribute and conformance HighlightPillListOfNamesAttribute;
  if (!lazy protocol witness table cache variable for type HighlightPillListOfNamesAttribute and conformance HighlightPillListOfNamesAttribute)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HighlightPillListOfNamesAttribute and conformance HighlightPillListOfNamesAttribute);
  }
  return result;
}

uint64_t base witness table accessor for DecodingConfigurationProviding in AttributeScopes.HighlightPillAttributes()
{
  return lazy protocol witness table accessor for type AttributedString.FormattingOptions and conformance AttributedString.FormattingOptions(&lazy protocol witness table cache variable for type AttributeScopes.HighlightPillAttributes and conformance AttributeScopes.HighlightPillAttributes, (void (*)(uint64_t))type metadata accessor for AttributeScopes.HighlightPillAttributes);
}

uint64_t base witness table accessor for EncodingConfigurationProviding in AttributeScopes.HighlightPillAttributes()
{
  return lazy protocol witness table accessor for type AttributedString.FormattingOptions and conformance AttributedString.FormattingOptions(&lazy protocol witness table cache variable for type AttributeScopes.HighlightPillAttributes and conformance AttributeScopes.HighlightPillAttributes, (void (*)(uint64_t))type metadata accessor for AttributeScopes.HighlightPillAttributes);
}

unsigned char *storeEnumTagSinglePayload for AttributionTextPrefix(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x19BEBCE3CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AttributionTextPrefix()
{
  return &type metadata for AttributionTextPrefix;
}

ValueMetadata *type metadata accessor for HighlightPillSenderNameAttribute()
{
  return &type metadata for HighlightPillSenderNameAttribute;
}

ValueMetadata *type metadata accessor for HighlightPillNumContactsAttribute()
{
  return &type metadata for HighlightPillNumContactsAttribute;
}

ValueMetadata *type metadata accessor for HighlightPillListOfNamesAttribute()
{
  return &type metadata for HighlightPillListOfNamesAttribute;
}

uint64_t initializeBufferWithCopyOfBuffer for AttributeScopes.HighlightPillAttributes(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AttributeScopes.FoundationAttributes();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for AttributeScopes.HighlightPillAttributes(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AttributeScopes.FoundationAttributes();
  int v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for AttributeScopes.HighlightPillAttributes(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AttributeScopes.FoundationAttributes();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for AttributeScopes.HighlightPillAttributes(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AttributeScopes.FoundationAttributes();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for AttributeScopes.HighlightPillAttributes(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AttributeScopes.FoundationAttributes();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for AttributeScopes.HighlightPillAttributes(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AttributeScopes.FoundationAttributes();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for AttributeScopes.HighlightPillAttributes(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_19BEBD118);
}

uint64_t sub_19BEBD118(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AttributeScopes.FoundationAttributes();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AttributeScopes.HighlightPillAttributes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_19BEBD198);
}

uint64_t sub_19BEBD198(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AttributeScopes.FoundationAttributes();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata completion function for AttributeScopes.HighlightPillAttributes()
{
  uint64_t result = type metadata accessor for AttributeScopes.FoundationAttributes();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for VisionPillMetric()
{
  return &type metadata for VisionPillMetric;
}

ValueMetadata *type metadata accessor for VisionSafariBannerPillMetric()
{
  return &type metadata for VisionSafariBannerPillMetric;
}

ValueMetadata *type metadata accessor for iOSPillMetric()
{
  return &type metadata for iOSPillMetric;
}

uint64_t initializeBufferWithCopyOfBuffer for TVPillMetrics(uint64_t a1, uint64_t a2)
{
  int v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for TVPillMetrics(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for TVPillMetrics(uint64_t a1, void *a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = a2[2];
  return a1;
}

ValueMetadata *type metadata accessor for TVPillMetrics()
{
  return &type metadata for TVPillMetrics;
}

void destroy for MacPillMetric(id *a1)
{
}

uint64_t initializeWithCopy for MacPillMetric(uint64_t a1, uint64_t a2)
{
  int v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  id v4 = v3;
  return a1;
}

ValueMetadata *type metadata accessor for MacPillMetric()
{
  return &type metadata for MacPillMetric;
}

ValueMetadata *type metadata accessor for MacSafariBannerPillMetrics()
{
  return &type metadata for MacSafariBannerPillMetrics;
}

uint64_t assignWithCopy for VisionPillMetric(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t assignWithTake for VisionPillMetric(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for VisionPillMetric(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VisionPillMetric(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for iOSSafariBannerPillMetrics()
{
  return &type metadata for iOSSafariBannerPillMetrics;
}

uint64_t method lookup function for PillMetrics(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PillMetrics);
}

uint64_t dispatch thunk of PillMetrics.__allocating_init(slotStyle:tag:variant:)()
{
  return (*(uint64_t (**)(void))(v0 + 216))();
}

void destroy for SLDHighlightPillMetrics(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 64);
}

uint64_t initializeWithCopy for SLDHighlightPillMetrics(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  int v3 = *(void **)(a2 + 56);
  id v4 = *(void **)(a2 + 64);
  *(void *)(a1 + 56) = v3;
  *(void *)(a1 + 64) = v4;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  id v6 = v3;
  id v7 = v4;
  return a1;
}

uint64_t assignWithCopy for SLDHighlightPillMetrics(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  id v4 = *(void **)(a1 + 56);
  long long v5 = *(void **)(a2 + 56);
  *(void *)(a1 + 56) = v5;
  id v6 = v5;

  id v7 = *(void **)(a1 + 64);
  unint64_t v8 = *(void **)(a2 + 64);
  *(void *)(a1 + 64) = v8;
  id v9 = v8;

  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  return a1;
}

uint64_t assignWithTake for SLDHighlightPillMetrics(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);

  id v4 = *(void **)(a1 + 64);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);

  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  return a1;
}

uint64_t getEnumTagSinglePayload for SLDHighlightPillMetrics(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 128)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 56);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SLDHighlightPillMetrics(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 128) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 128) = 0;
    }
    if (a2) {
      *(void *)(result + 56) = a2;
    }
  }
  return result;
}

void *type metadata accessor for SLDHighlightPillMetrics()
{
  return &unk_1EEC16E30;
}

uint64_t outlined init with take of SLDHighlightPillMetrics?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SLDHighlightPillMetrics?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void outlined consume of SLDHighlightPillMetrics?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, void *a9)
{
  if (a8 != (void *)1)
  {
  }
}

uint64_t lazy protocol witness table accessor for type AttributedString.FormattingOptions and conformance AttributedString.FormattingOptions(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_19BEBDA68()
{
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t _s11SocialLayer23SLDHighlightPillMetrics33_00C2B47D0280335DFFDBB3BC8927527ALLVSgWOg(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  int v2 = v1 - 1;
  if (v2 < 0) {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t outlined retain of SLDHighlightPillMetrics(uint64_t a1)
{
  int v2 = *(void **)(a1 + 56);
  id v3 = *(id *)(a1 + 64);
  id v4 = v2;
  return a1;
}

void *outlined release of SLDHighlightPillMetrics?(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))
{
  return a1;
}

void outlined copy of SLDHighlightPillMetrics?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, void *a9)
{
  if (a8 != (void *)1)
  {
    id v10 = a9;
    id v11 = a8;
  }
}

double _s11SocialLayer23SLDHighlightPillMetrics33_00C2B47D0280335DFFDBB3BC8927527ALLVSgWOi0_(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 1;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  return result;
}

uint64_t outlined init with copy of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ResourceBundleClass.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

objc_class *one-time initialization function for resourceBundle()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  double result = (objc_class *)objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  resourceBundle.super.Class isa = result;
  return result;
}

uint64_t one-time initialization function for preview(uint64_t a1)
{
  return one-time initialization function for preview(a1, static ImageResource.preview, 0x77656976657250, 0xE700000000000000);
}

uint64_t ImageResource.preview.unsafeMutableAddressor()
{
  return ImageResource.preview.unsafeMutableAddressor(&one-time initialization token for preview, (uint64_t)static ImageResource.preview);
}

uint64_t static ImageResource.preview.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.preview.getter(&one-time initialization token for preview, (uint64_t)static ImageResource.preview, a1);
}

uint64_t one-time initialization function for slAttributionViewMarqueeMask(uint64_t a1)
{
  return one-time initialization function for preview(a1, static ImageResource.slAttributionViewMarqueeMask, 0xD00000000000001CLL, 0x800000019BEDAFA0);
}

uint64_t one-time initialization function for preview(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for ImageResource();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (one-time initialization token for resourceBundle != -1) {
    swift_once();
  }
  return MEMORY[0x19F3902A0](a3, a4, resourceBundle.super.isa);
}

uint64_t ImageResource.slAttributionViewMarqueeMask.unsafeMutableAddressor()
{
  return ImageResource.preview.unsafeMutableAddressor(&one-time initialization token for slAttributionViewMarqueeMask, (uint64_t)static ImageResource.slAttributionViewMarqueeMask);
}

uint64_t ImageResource.preview.unsafeMutableAddressor(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for ImageResource();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static ImageResource.slAttributionViewMarqueeMask.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.preview.getter(&one-time initialization token for slAttributionViewMarqueeMask, (uint64_t)static ImageResource.slAttributionViewMarqueeMask, a1);
}

uint64_t static ImageResource.preview.getter@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for ImageResource();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t __getCloudSharingClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SLSecurityScopedURL URL](v0);
}

void __SLDAssetCatalog_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "Couldn't get sociallayerd's asset catalog. Error: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t SLDCreateGroupPhotoImageWithGroupID_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return SLDCreateGroupPhotoImageWithGroupID_cold_2(v0);
}

void SLDCreateGroupPhotoImageWithGroupID_cold_2(os_log_t log)
{
  *(_WORD *)unint64_t v1 = 0;
  _os_log_error_impl(&dword_19BE17000, log, OS_LOG_TYPE_ERROR, "SLDCreateGroupPhotoImageWithGroupID failed to retrieve group photo data from IMSPI.", v1, 2u);
}

void SLDCreateGroupPhotoImageWithData_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 length];
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "SLDCreateGroupPhotoImageWithData had group photo data, but the group photo image ref was still nil. groupPhotoData.length: %li", (uint8_t *)&v3, 0xCu);
}

uint64_t __getMFMessageComposeViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SLDShareableContentService allowsConnection:](v0);
}

uint64_t __getCSCloudSharingClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SLDFaceTimeService initiateTUConversationForAttributionIdentifier:videoEnabled:completion:](v0);
}

void SLDValidateSupplementaryData_cold_1()
{
  int v2 = (void *)OUTLINED_FUNCTION_20();
  _DWORD *v1 = 138412290;
  void *v0 = v2;
  id v3 = v2;
  OUTLINED_FUNCTION_11(&dword_19BE17000, v4, v5, "#SLDCK supplementaryData values must be NSURLs, not %@");
}

void SLDValidateSupplementaryData_cold_2()
{
  int v2 = (void *)OUTLINED_FUNCTION_20();
  _DWORD *v1 = 138412290;
  void *v0 = v2;
  id v3 = v2;
  OUTLINED_FUNCTION_11(&dword_19BE17000, v4, v5, "#SLDCK supplementaryData keys must be strings, not %@");
}

void SLDValidateSupplementaryData_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  OUTLINED_FUNCTION_3();
  id v4 = v3;
  _os_log_fault_impl(&dword_19BE17000, a2, OS_LOG_TYPE_FAULT, "#SLDCK supplementaryData is supposed to be a dictionary, not a %@", v5, 0xCu);
}

void __SLDStorageDirectory_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "#SLDCK social layer unable to create directory due to lack of disk space while creating ~/Library/SocialLayer", v2, v3, v4, v5, v6);
}

void __SLDStorageDirectory_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "#SLDCK social layer unable to create directory due to lack of write permissions to directory %@", v2, v3, v4, v5, v6);
}

uint64_t __getIMCollaborationClearTransmissionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getIMCollaborationNoticeTransmissionClass_block_invoke_cold_1(v0);
}

uint64_t __getIMCollaborationNoticeTransmissionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getIMCollaborationNoticeDispatcherClass_block_invoke_cold_1(v0);
}

void __getIMCollaborationNoticeDispatcherClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  -[SLInteractionHandler initWithAppIdentifier:](v0, v1);
}

void SLSendPortraitFeedbackTypeAppButtonForAttribution_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "SLSendPortraitFeedbackTypeAppButtonForAttribution: attempted to send feedback for a nil attribution.", v2, v3, v4, v5, v6);
}

void SLSendPortraitFeedbackTypeAppButtonForAttribution_cold_2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "SLSendPortraitFeedbackTypeAppButtonForAttribution: unable to send feedback without an application identifier.", v2, v3, v4, v5, v6);
}

void SLApplicationIdentifierForPortraitFeedback_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "SLApplicationIdentifierForPortraitFeedback: Unable to create bundleRecord to find applicationIdentifier for Portrait feedback.", v2, v3, v4, v5, v6);
}

void __SLSendPortraitFeedbackTypeAppButtonForAttribution_block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) uniqueIdentifier];
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_0(&dword_19BE17000, v2, v3, "SLSendPortraitFeedbackTypeAppButtonForAttribution: error sending feedback for attribution: [%@] error: [%@]", v4, v5, v6, v7, v8);
}

void SLSendPortraitFeedbackTypeDisplayedHighlight_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "SLSendPortraitFeedbackTypeForHighlight: attempted to send feedback for an invalid highlight.", v2, v3, v4, v5, v6);
}

void SLSendPortraitFeedbackTypeDisplayedHighlight_cold_2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "SLSendPortraitFeedbackTypeDisplayedForHighlight: unable to send feedback without an application identifier.", v2, v3, v4, v5, v6);
}

void __SLSendPortraitFeedbackTypeDisplayedHighlight_block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) identifier];
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_0(&dword_19BE17000, v2, v3, "SLSendPortraitFeedbackTypeDisplayedForHighlight: error sending feedback for highlight: [%@] error: [%@]", v4, v5, v6, v7, v8);
}

void SLSendPortraitFeedbackTypeUserInteractedWithHighlight_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "SLSendPortraitFeedbackTypeUserInteractedWithHighlight: attempted to send feedback for an invalid highlight.", v2, v3, v4, v5, v6);
}

void SLSendPortraitFeedbackTypeUserInteractedWithHighlight_cold_2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "SLSendPortraitFeedbackTypeUserInteractedWithHighlight: unable to send feedback without an application identifier.", v2, v3, v4, v5, v6);
}

void __SLSendPortraitFeedbackTypeUserInteractedWithHighlight_block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) identifier];
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_0(&dword_19BE17000, v2, v3, "SLSendPortraitFeedbackTypeUserInteractedWithHighlight: error sending feedback for highlight: [%@] error: [%@]", v4, v5, v6, v7, v8);
}

uint64_t __getCKPostSharingContextClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCKContainerSetupInfoClass_block_invoke_cold_1(v0);
}

uint64_t __getCKContainerSetupInfoClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SLDActiveCallService activeCallViewForStyle:maxWidth:layerContextID:reply:](v0);
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return MEMORY[0x1F40E37C0]();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return MEMORY[0x1F40E37D0]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t __DataStorage.init(length:)()
{
  return MEMORY[0x1F40E37F0]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t static AttributeScope.decodingConfiguration.getter()
{
  return MEMORY[0x1F40E3838]();
}

uint64_t static AttributeScope.encodingConfiguration.getter()
{
  return MEMORY[0x1F40E3848]();
}

uint64_t type metadata accessor for AttributeScopes.FoundationAttributes()
{
  return MEMORY[0x1F40E3B60]();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x1F40E3B70]();
}

uint64_t AttributedString.init(stringLiteral:)()
{
  return MEMORY[0x1F40E3C38]();
}

uint64_t type metadata accessor for AttributedString.FormattingOptions()
{
  return MEMORY[0x1F40E3C68]();
}

uint64_t AttributedString.init<A>(localized:options:table:bundle:localization:locale:comment:including:)()
{
  return MEMORY[0x1F40E3E68]();
}

uint64_t type metadata accessor for AttributedString()
{
  return MEMORY[0x1F40E3EA0]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t static DecodableAttributedStringKey<>.decode(from:)()
{
  return MEMORY[0x1F40E4768]();
}

uint64_t static EncodableAttributedStringKey<>.encode(_:to:)()
{
  return MEMORY[0x1F40E4780]();
}

uint64_t static MarkdownDecodableAttributedStringKey<>.decodeMarkdown(from:)()
{
  return MEMORY[0x1F40E4848]();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return MEMORY[0x1F40E4CA8]();
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return MEMORY[0x1F40E4CD8]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x1F40E4D48]();
}

uint64_t static Data._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1F40E4D90]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t static Locale.current.getter()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t type metadata accessor for Locale()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t CGFloat.init(truncating:)()
{
  return MEMORY[0x1F40E5F40]();
}

uint64_t static _CFObject.== infix(_:_:)()
{
  return MEMORY[0x1F4186958]();
}

uint64_t _CFObject.hash(into:)()
{
  return MEMORY[0x1F4186968]();
}

uint64_t _CFObject.hashValue.getter()
{
  return MEMORY[0x1F4186978]();
}

uint64_t ImageResource.init(name:bundle:)()
{
  return MEMORY[0x1F40E05E0]();
}

uint64_t type metadata accessor for ImageResource()
{
  return MEMORY[0x1F40E05E8]();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return MEMORY[0x1F4188500]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x1F4188670]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x1F4188680]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t UIViewRepresentable.sizeThatFits(_:uiView:context:)()
{
  return MEMORY[0x1F40F9E70]();
}

uint64_t UIViewRepresentable.body.getter()
{
  return MEMORY[0x1F40F9EE0]();
}

uint64_t static View._viewListCount(inputs:)()
{
  return MEMORY[0x1F40FB920]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t type metadata accessor for CryptoKitError()
{
  return MEMORY[0x1F40DFEA0]();
}

uint64_t dispatch thunk of HashFunction.update(bufferPointer:)()
{
  return MEMORY[0x1F40DFF38]();
}

uint64_t SHA256Digest.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x1F40DFF60]();
}

uint64_t SHA256Digest.hashValue.getter()
{
  return MEMORY[0x1F40DFF68]();
}

uint64_t type metadata accessor for SHA256Digest()
{
  return MEMORY[0x1F40DFF70]();
}

uint64_t SymmetricKey.init<A>(data:)()
{
  return MEMORY[0x1F40DFFC0]();
}

uint64_t SymmetricKey.init(size:)()
{
  return MEMORY[0x1F40DFFC8]();
}

uint64_t type metadata accessor for SymmetricKey()
{
  return MEMORY[0x1F40DFFD8]();
}

uint64_t static SymmetricKeySize.bits128.getter()
{
  return MEMORY[0x1F40E0000]();
}

uint64_t type metadata accessor for SymmetricKeySize()
{
  return MEMORY[0x1F40E0010]();
}

uint64_t static AES.GCM.open(_:using:)()
{
  return MEMORY[0x1F40E0038]();
}

uint64_t static AES.GCM.open<A>(_:using:authenticating:)()
{
  return MEMORY[0x1F40E0040]();
}

uint64_t static AES.GCM.seal<A, B>(_:using:nonce:authenticating:)()
{
  return MEMORY[0x1F40E0048]();
}

uint64_t static AES.GCM.seal<A>(_:using:nonce:)()
{
  return MEMORY[0x1F40E0050]();
}

uint64_t AES.GCM.Nonce.init()()
{
  return MEMORY[0x1F40E0068]();
}

uint64_t type metadata accessor for AES.GCM.Nonce()
{
  return MEMORY[0x1F40E0070]();
}

uint64_t AES.GCM.SealedBox.combined.getter()
{
  return MEMORY[0x1F40E0098]();
}

uint64_t AES.GCM.SealedBox.init(combined:)()
{
  return MEMORY[0x1F40E00A0]();
}

uint64_t type metadata accessor for AES.GCM.SealedBox()
{
  return MEMORY[0x1F40E00A8]();
}

uint64_t P256.Signing.PrivateKey.publicKey.getter()
{
  return MEMORY[0x1F40E0200]();
}

uint64_t P256.Signing.PrivateKey.init(compactRepresentable:)()
{
  return MEMORY[0x1F40E0230]();
}

uint64_t type metadata accessor for P256.Signing.PrivateKey()
{
  return MEMORY[0x1F40E0240]();
}

uint64_t P256.Signing.PublicKey.x963Representation.getter()
{
  return MEMORY[0x1F40E0290]();
}

uint64_t P256.Signing.PublicKey.init<A>(x963Representation:)()
{
  return MEMORY[0x1F40E0298]();
}

uint64_t type metadata accessor for P256.Signing.PublicKey()
{
  return MEMORY[0x1F40E02A0]();
}

uint64_t Digest.makeIterator()()
{
  return MEMORY[0x1F40E0478]();
}

uint64_t static Digest.== infix(_:_:)()
{
  return MEMORY[0x1F40E0480]();
}

uint64_t SHA256.finalize()()
{
  return MEMORY[0x1F40E0490]();
}

uint64_t SHA256.init()()
{
  return MEMORY[0x1F40E04A0]();
}

uint64_t type metadata accessor for SHA256()
{
  return MEMORY[0x1F40E04A8]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x1F40E6000]();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1F40E6018]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t String.LocalizationValue.init(stringLiteral:)()
{
  return MEMORY[0x1F40E60A8]();
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return MEMORY[0x1F40E6128]();
}

uint64_t type metadata accessor for String.LocalizationValue.StringInterpolation()
{
  return MEMORY[0x1F40E6130]();
}

uint64_t String.LocalizationValue.init(stringInterpolation:)()
{
  return MEMORY[0x1F40E6148]();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return MEMORY[0x1F40E6158]();
}

uint64_t String.LocalizationValue.init(_:)()
{
  return MEMORY[0x1F40E6160]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x1F40E6190]();
}

uint64_t static String.localizedStringWithFormat(_:_:)()
{
  return MEMORY[0x1F40E61A0]();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return MEMORY[0x1F40E61E8]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t String.init(localized:table:bundle:localization:locale:comment:)()
{
  return MEMORY[0x1F40E62B8]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x1F4183880]();
}

uint64_t String.init<A>(reflecting:)()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x1F41839F0]();
}

Swift::Void __swiftcall String.append(contentsOf:)(Swift::String contentsOf)
{
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x1F4183AB0]();
}

Swift::Int __swiftcall String.UTF16View._foreignCount()()
{
  return MEMORY[0x1F4183AD8]();
}

uint64_t String.UTF16View._nativeGetOffset(for:)()
{
  return MEMORY[0x1F4183AF0]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t UnsafeRawBufferPointer.regions.getter()
{
  return MEMORY[0x1F40E6330]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1F4183E80]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x1F40E6338]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x1F4188700]();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)()
{
  return MEMORY[0x1F40E66C8]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x1F4187100]();
}

uint64_t NSAttributedString.init<A>(_:including:)()
{
  return MEMORY[0x1F40E6720]();
}

uint64_t NSAttributedString.init(_:)()
{
  return MEMORY[0x1F40E6740]();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t static OS_os_log.default.getter()
{
  return MEMORY[0x1F4188728]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x1F4184640]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x1F4184820]();
}

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t __CocoaSet.makeIterator()()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return MEMORY[0x1F4184BC0]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x1F4184C18](seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return MEMORY[0x1F4184C38]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1F4185298]();
}

{
  return MEMORY[0x1F41852A0]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x1F4185350]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x1F4185368]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x1F4185370]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x1F4185380]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x1F4185398]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x1F41854C8](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x1F4185758]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1F4185EB0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1F4185EF8]();
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D30](retstr, tx, ty, tz);
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1F40D84C8](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1F40D8528](theString, idx);
}

CFIndex CFStringGetHyphenationLocationBeforeIndex(CFStringRef string, CFIndex location, CFRange limitRange, CFOptionFlags options, CFLocaleRef locale, UTF32Char *character)
{
  return MEMORY[0x1F40D8560](string, location, limitRange.location, limitRange.length, options, locale, character);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

Boolean CFStringIsHyphenationAvailableForLocale(CFLocaleRef locale)
{
  return MEMORY[0x1F40D8640](locale);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x1F40D9890]();
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D99A8](red, green, blue, alpha);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D99B0](red, green, blue, alpha);
}

CGColorRef CGColorGetConstantColor(CFStringRef colorName)
{
  return (CGColorRef)MEMORY[0x1F40D9A08](colorName);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1F40D9A60](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

uint64_t CGColorSpaceGetRGB()
{
  return MEMORY[0x1F4116090]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextBeginTransparencyLayerWithRect(CGContextRef c, CGRect rect, CFDictionaryRef auxInfo)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

uint64_t CGContextSetFontRenderingStyle()
{
  return MEMORY[0x1F40DA148]();
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA300](data);
}

uint64_t CGFontCacheGetLocalCache()
{
  return MEMORY[0x1F40DA3A8]();
}

uint64_t CGFontCacheReset()
{
  return MEMORY[0x1F40DA3B0]();
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1F40DA778](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithDataProvider(CGDataProviderRef provider, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99A8](provider, options);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0B0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CTFontDescriptorRef CTFontCopyFontDescriptor(CTFontRef font)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF2B8](font);
}

CTFontRef CTFontCreateCopyWithSymbolicTraits(CTFontRef font, CGFloat size, const CGAffineTransform *matrix, CTFontSymbolicTraits symTraitValue, CTFontSymbolicTraits symTraitMask)
{
  return (CTFontRef)MEMORY[0x1F40DF340](font, matrix, *(void *)&symTraitValue, *(void *)&symTraitMask, size);
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x1F40DF370](*(void *)&uiType, language, size);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1F40DF378](descriptor, matrix, size);
}

CFTypeRef CTFontDescriptorCopyAttribute(CTFontDescriptorRef descriptor, CFStringRef attribute)
{
  return (CFTypeRef)MEMORY[0x1F40DF3A8](descriptor, attribute);
}

CTFontDescriptorRef CTFontDescriptorCreateCopyWithAttributes(CTFontDescriptorRef original, CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF3C0](original, attributes);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF408](attributes);
}

uint64_t CTFontDescriptorCreateWithTextStyleAndAttributes()
{
  return MEMORY[0x1F40DF428]();
}

CGFloat CTFontGetAscent(CTFontRef font)
{
  MEMORY[0x1F40DF4A8](font);
  return result;
}

CGFloat CTFontGetDescent(CTFontRef font)
{
  MEMORY[0x1F40DF4E0](font);
  return result;
}

CGFloat CTFontGetLeading(CTFontRef font)
{
  MEMORY[0x1F40DF528](font);
  return result;
}

uint64_t CTFontRemoveFromCaches()
{
  return MEMORY[0x1F40DF660]();
}

void CTFrameDraw(CTFrameRef frame, CGContextRef context)
{
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x1F40DF6E0](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x1F40DF6E8](attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  MEMORY[0x1F40DF700](framesetter, stringRange.location, stringRange.length, frameAttributes, fitRange, (__n128)constraints, *(__n128 *)&constraints.height);
  result.double height = v6;
  result.double width = v5;
  return result;
}

uint64_t CTLineCreateHyphenatedLineWithOffset()
{
  return MEMORY[0x1F40DF760]();
}

uint64_t CTLineCreateTruncatedLineWithTokenHandler()
{
  return MEMORY[0x1F40DF788]();
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1F40DF790](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  MEMORY[0x1F40DF7C8](line, options);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

double CTLineGetPenOffsetForFlush(CTLineRef line, CGFloat flushFactor, double flushWidth)
{
  MEMORY[0x1F40DF7F8](line, flushFactor, flushWidth);
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  MEMORY[0x1F40DF820](line, ascent, descent, leading);
  return result;
}

uint64_t IMFormattedDisplayStringForNumber()
{
  return MEMORY[0x1F4123748]();
}

uint64_t IMStringIsEmail()
{
  return MEMORY[0x1F4123A48]();
}

uint64_t IMStringIsPhoneNumber()
{
  return MEMORY[0x1F4123A70]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4166AA8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t SWFrameworkLogHandle()
{
  return MEMORY[0x1F40F75E0]();
}

uint64_t SWPerformActionForDocumentURL()
{
  return MEMORY[0x1F40F75E8]();
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x1F40F6D68](*(void *)&status, reserved);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

CFDictionaryRef SecKeyCopyAttributes(SecKeyRef key)
{
  return (CFDictionaryRef)MEMORY[0x1F40F6E38](key);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6E40](key, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1F40F6F08](keyData, attributes, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1F4166EB8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
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
  return MEMORY[0x1F40C9FB0]();
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
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
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

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
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
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1F40CBC70]();
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD50](label);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
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

uint64_t self
{
  return MEMORY[0x1F41817D0]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
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

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1F40CDDD8]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1F40CDE08]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x1F4186510]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

int32_t u_charDigitValue(UChar32 c)
{
  return MEMORY[0x1F417F6F8](*(void *)&c);
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x1F40CF2F0]();
}