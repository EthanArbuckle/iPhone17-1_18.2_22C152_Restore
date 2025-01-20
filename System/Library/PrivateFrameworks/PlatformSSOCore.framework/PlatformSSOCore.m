id PO_LOG_POPrebootDeviceConfiguration()
{
  void *v0;
  uint64_t vars8;

  if (PO_LOG_POPrebootDeviceConfiguration_once != -1) {
    dispatch_once(&PO_LOG_POPrebootDeviceConfiguration_once, &__block_literal_global_61);
  }
  v0 = (void *)PO_LOG_POPrebootDeviceConfiguration_log;
  return v0;
}

id PO_LOG_POJWT()
{
  if (PO_LOG_POJWT_once != -1) {
    dispatch_once(&PO_LOG_POJWT_once, &__block_literal_global_125);
  }
  v0 = (void *)PO_LOG_POJWT_log;
  return v0;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id PO_LOG_POKeyWrap()
{
  if (PO_LOG_POKeyWrap_once != -1) {
    dispatch_once(&PO_LOG_POKeyWrap_once, &__block_literal_global_56);
  }
  v0 = (void *)PO_LOG_POKeyWrap_log;
  return v0;
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id PO_LOG_POUserConfiguration()
{
  if (PO_LOG_POUserConfiguration_once != -1) {
    dispatch_once(&PO_LOG_POUserConfiguration_once, &__block_literal_global_1);
  }
  v0 = (void *)PO_LOG_POUserConfiguration_log;
  return v0;
}

id PO_LOG_PODeviceConfiguration()
{
  if (PO_LOG_PODeviceConfiguration_once != -1) {
    dispatch_once(&PO_LOG_PODeviceConfiguration_once, &__block_literal_global_310);
  }
  v0 = (void *)PO_LOG_PODeviceConfiguration_log;
  return v0;
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_2_0@<X0>(void *a1@<X0>, uint64_t x8_0@<X8>)
{
  *(void *)(v3 - 40) = x8_0;
  return [a1 sharedDeviceKeys];
}

uint64_t OUTLINED_FUNCTION_3()
{
  return v0;
}

id PO_LOG_POKeychainHelper()
{
  if (PO_LOG_POKeychainHelper_once != -1) {
    dispatch_once(&PO_LOG_POKeychainHelper_once, &__block_literal_global_39);
  }
  uint64_t v0 = (void *)PO_LOG_POKeychainHelper_log;
  return v0;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_259E0E82C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id PO_LOG_PODaemonCoreProcess()
{
  if (PO_LOG_PODaemonCoreProcess_once != -1) {
    dispatch_once(&PO_LOG_PODaemonCoreProcess_once, &__block_literal_global_246);
  }
  uint64_t v0 = (void *)PO_LOG_PODaemonCoreProcess_log;
  return v0;
}

void sub_259E118EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_259E11C80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_259E121B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_259E12544(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class __getPODirectoryServicesClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!PlatformSSOLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __PlatformSSOLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_265463A48;
    uint64_t v6 = 0;
    PlatformSSOLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!PlatformSSOLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("PODirectoryServices");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getPODirectoryServicesClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPODirectoryServicesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PlatformSSOLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PlatformSSOLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id PO_LOG_POKeyBag()
{
  if (PO_LOG_POKeyBag_once != -1) {
    dispatch_once(&PO_LOG_POKeyBag_once, &__block_literal_global_3);
  }
  uint64_t v0 = (void *)PO_LOG_POKeyBag_log;
  return v0;
}

void sub_259E12F84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_259E1302C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_259E13134(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_259E132F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id PO_LOG_POSecKeyHelper()
{
  if (PO_LOG_POSecKeyHelper_once != -1) {
    dispatch_once(&PO_LOG_POSecKeyHelper_once, &__block_literal_global_155);
  }
  uint64_t v0 = (void *)PO_LOG_POSecKeyHelper_log;
  return v0;
}

void OUTLINED_FUNCTION_3_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id PO_LOG_PODiagnostics()
{
  if (PO_LOG_PODiagnostics_once != -1) {
    dispatch_once(&PO_LOG_PODiagnostics_once, &__block_literal_global_1383);
  }
  uint64_t v0 = (void *)PO_LOG_PODiagnostics_log;
  return v0;
}

id PO_LOG_POAuthenticationProcess()
{
  if (PO_LOG_POAuthenticationProcess_once != -1) {
    dispatch_once(&PO_LOG_POAuthenticationProcess_once, &__block_literal_global_1387);
  }
  uint64_t v0 = (void *)PO_LOG_POAuthenticationProcess_log;
  return v0;
}

void sub_259E25390()
{
}

void OUTLINED_FUNCTION_3_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_9(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_12()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13(void *a1, const char *a2)
{
  return [a1 initWithData:v2 encoding:4];
}

void OUTLINED_FUNCTION_14(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_259E2F030(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id PO_LOG_POUserLoginConfiguration()
{
  if (PO_LOG_POUserLoginConfiguration_once != -1) {
    dispatch_once(&PO_LOG_POUserLoginConfiguration_once, &__block_literal_global_95);
  }
  uint64_t v0 = (void *)PO_LOG_POUserLoginConfiguration_log;
  return v0;
}

id PO_LOG_POXMLHelper()
{
  if (PO_LOG_POXMLHelper_once != -1) {
    dispatch_once(&PO_LOG_POXMLHelper_once, &__block_literal_global_5);
  }
  uint64_t v0 = (void *)PO_LOG_POXMLHelper_log;
  return v0;
}

id PO_LOG_POJWTSigning()
{
  if (PO_LOG_POJWTSigning_once != -1) {
    dispatch_once(&PO_LOG_POJWTSigning_once, &__block_literal_global_227);
  }
  uint64_t v0 = (void *)PO_LOG_POJWTSigning_log;
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_4(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 32);
}

void sub_259E35C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
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

id PO_LOG_POCredentialUtil()
{
  if (PO_LOG_POCredentialUtil_once != -1) {
    dispatch_once(&PO_LOG_POCredentialUtil_once, &__block_literal_global_50);
  }
  uint64_t v0 = (void *)PO_LOG_POCredentialUtil_log;
  return v0;
}

id PO_LOG_POJWTHeader()
{
  if (PO_LOG_POJWTHeader_once != -1) {
    dispatch_once(&PO_LOG_POJWTHeader_once, &__block_literal_global_153);
  }
  uint64_t v0 = (void *)PO_LOG_POJWTHeader_log;
  return v0;
}

void sub_259E3B444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

id PO_LOG_POACMHelper()
{
  if (PO_LOG_POACMHelper_once != -1) {
    dispatch_once(&PO_LOG_POACMHelper_once, &__block_literal_global_22);
  }
  uint64_t v0 = (void *)PO_LOG_POACMHelper_log;
  return v0;
}

id getSOUtilsClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSOUtilsClass_softClass;
  uint64_t v7 = getSOUtilsClass_softClass;
  if (!getSOUtilsClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSOUtilsClass_block_invoke;
    v3[3] = &unk_265463A28;
    v3[4] = &v4;
    __getSOUtilsClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_259E3BBA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PO_LOG_POPreferences()
{
  if (PO_LOG_POPreferences_once != -1) {
    dispatch_once(&PO_LOG_POPreferences_once, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)PO_LOG_POPreferences_log;
  return v0;
}

uint64_t AppSSOCoreLibraryCore()
{
  if (!AppSSOCoreLibraryCore_frameworkLibrary) {
    AppSSOCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return AppSSOCoreLibraryCore_frameworkLibrary;
}

uint64_t __AppSSOCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppSSOCoreLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getSOUtilsClass_block_invoke(uint64_t a1)
{
  if (!AppSSOCoreLibraryCore())
  {
    uint64_t v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("SOUtils");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSOUtilsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v4 = __getSOUtilsClass_block_invoke_cold_1();
    return (Class)__PO_LOG_POPreferences_block_invoke(v4);
  }
  return result;
}

id PO_LOG_POAgentCoreProcess()
{
  if (PO_LOG_POAgentCoreProcess_once != -1) {
    dispatch_once(&PO_LOG_POAgentCoreProcess_once, &__block_literal_global_236);
  }
  uint64_t v0 = (void *)PO_LOG_POAgentCoreProcess_log;
  return v0;
}

id PO_LOG_PODaemonCoreConnection()
{
  if (PO_LOG_PODaemonCoreConnection_once != -1) {
    dispatch_once(&PO_LOG_PODaemonCoreConnection_once, &__block_literal_global_118);
  }
  uint64_t v0 = (void *)PO_LOG_PODaemonCoreConnection_log;
  return v0;
}

void sub_259E42AA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 72));
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_259E430E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_259E435A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id PO_LOG_POConfigurationManager()
{
  if (PO_LOG_POConfigurationManager_once != -1) {
    dispatch_once(&PO_LOG_POConfigurationManager_once, &__block_literal_global_219);
  }
  uint64_t v0 = (void *)PO_LOG_POConfigurationManager_log;
  return v0;
}

void sub_259E438B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_259E43B70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_259E43EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
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

void sub_259E44200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_259E44494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_259E447E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_259E44C5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_259E45150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259E45464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259E4579C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259E45A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_259E45D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259E46010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_259E462F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259E465BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_259E467C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PO_LOG_POAuthPluginCoreProcess()
{
  if (PO_LOG_POAuthPluginCoreProcess_once != -1) {
    dispatch_once(&PO_LOG_POAuthPluginCoreProcess_once, &__block_literal_global_11);
  }
  uint64_t v0 = (void *)PO_LOG_POAuthPluginCoreProcess_log;
  return v0;
}

void sub_259E47128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

id PO_LOG_POJWTEncryption()
{
  if (PO_LOG_POJWTEncryption_once != -1) {
    dispatch_once(&PO_LOG_POJWTEncryption_once, &__block_literal_global_219_0);
  }
  uint64_t v0 = (void *)PO_LOG_POJWTEncryption_log;
  return v0;
}

id PO_LOG_POLoginConfiguration()
{
  if (PO_LOG_POLoginConfiguration_once != -1) {
    dispatch_once(&PO_LOG_POLoginConfiguration_once, &__block_literal_global_594);
  }
  uint64_t v0 = (void *)PO_LOG_POLoginConfiguration_log;
  return v0;
}

void sub_259E4BE60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_259E50DAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

id PO_LOG_POWSTrustProcess()
{
  if (PO_LOG_POWSTrustProcess_once != -1) {
    dispatch_once(&PO_LOG_POWSTrustProcess_once, &__block_literal_global_405);
  }
  uint64_t v0 = (void *)PO_LOG_POWSTrustProcess_log;
  return v0;
}

id PO_LOG_POUserLoginState()
{
  if (PO_LOG_POUserLoginState_once != -1) {
    dispatch_once(&PO_LOG_POUserLoginState_once, &__block_literal_global_14);
  }
  uint64_t v0 = (void *)PO_LOG_POUserLoginState_log;
  return v0;
}

id PO_LOG_POServiceCoreConnection()
{
  if (PO_LOG_POServiceCoreConnection_once != -1) {
    dispatch_once(&PO_LOG_POServiceCoreConnection_once, &__block_literal_global_100);
  }
  uint64_t v0 = (void *)PO_LOG_POServiceCoreConnection_log;
  return v0;
}

void sub_259E55ED8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id PO_LOG_POTokenHelper()
{
  if (PO_LOG_POTokenHelper_once != -1) {
    dispatch_once(&PO_LOG_POTokenHelper_once, &__block_literal_global_18);
  }
  uint64_t v0 = (void *)PO_LOG_POTokenHelper_log;
  return v0;
}

id PO_LOG_POConfigurationVersion()
{
  if (PO_LOG_POConfigurationVersion_once != -1) {
    dispatch_once(&PO_LOG_POConfigurationVersion_once, &__block_literal_global_19);
  }
  uint64_t v0 = (void *)PO_LOG_POConfigurationVersion_log;
  return v0;
}

void sub_259E5902C(_Unwind_Exception *exception_object)
{
}

void sub_259E59194(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_259E59300(_Unwind_Exception *exception_object)
{
}

void sub_259E59388(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

id PO_LOG_POCoreConfigurationUtil()
{
  if (PO_LOG_POCoreConfigurationUtil_once != -1) {
    dispatch_once(&PO_LOG_POCoreConfigurationUtil_once, &__block_literal_global_48);
  }
  uint64_t v0 = (void *)PO_LOG_POCoreConfigurationUtil_log;
  return v0;
}

id PO_LOG_POUserUnlockKey()
{
  if (PO_LOG_POUserUnlockKey_once != -1) {
    dispatch_once(&PO_LOG_POUserUnlockKey_once, &__block_literal_global_53);
  }
  uint64_t v0 = (void *)PO_LOG_POUserUnlockKey_log;
  return v0;
}

uint64_t sub_259E5CB18()
{
  uint64_t v0 = sub_259E99C48();
  __swift_allocate_value_buffer(v0, qword_26A3F7CB8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A3F7CB8);
  return sub_259E99C38();
}

void *variable initialization expression of POCryptoKitHPKE_P384_SHA384_AES_GCM_256.encryptionAlgorithm()
{
  return &unk_2707DBB80;
}

id POCryptoKitHPKE_P384_SHA384_AES_GCM_256.encryptionAlgorithm.getter()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P384_SHA384_AES_GCM_256_encryptionAlgorithm));
}

id POCryptoKitHPKE_P384_SHA384_AES_GCM_256.__allocating_init()()
{
  uint64_t v1 = sub_259E99E88();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = (char *)objc_allocWithZone(v0);
  *(void *)&v4[OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P384_SHA384_AES_GCM_256_encryptionAlgorithm] = 0x2707DBB80;
  id v5 = &unk_2707DBB80;
  sub_259E99E58();
  return POCryptoKitHPKE.init(cipherSuite:)((uint64_t)v3);
}

id POCryptoKitHPKE_P384_SHA384_AES_GCM_256.init()()
{
  uint64_t v1 = sub_259E99E88();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v0 + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P384_SHA384_AES_GCM_256_encryptionAlgorithm) = 0x2707DBB80;
  id v4 = &unk_2707DBB80;
  sub_259E99E58();
  return POCryptoKitHPKE.init(cipherSuite:)((uint64_t)v3);
}

Swift::Void __swiftcall POCryptoKitHPKE_P384_SHA384_AES_GCM_256.addValues(to:)(POMutableJWTHeader to)
{
  Class isa = to.super.super.isa;
  uint64_t v2 = (void *)sub_259E9A058();
  [(objc_class *)isa setEnc:v2];

  sub_259E9A068();
  id v3 = (id)sub_259E9A058();
  swift_bridgeObjectRelease();
  [(objc_class *)isa setAlg:v3];
}

Swift::String __swiftcall POCryptoKitHPKE_P384_SHA384_AES_GCM_256.algValue()()
{
  uint64_t v0 = sub_259E9A068();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t POCryptoKitHPKE_P384_SHA384_AES_GCM_256.decodeAndDecryptJWT(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, void *a9)
{
  uint64_t v83 = a4;
  v81 = a1;
  uint64_t v82 = a7;
  uint64_t v79 = a3;
  v85 = a2;
  uint64_t v80 = sub_259E9A038();
  uint64_t v72 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  v84 = (char *)&v71 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_259E9A0B8();
  uint64_t v77 = *(void *)(v13 - 8);
  uint64_t v78 = v13;
  MEMORY[0x270FA5388](v13);
  v76 = (char *)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_259E99DA8();
  uint64_t v74 = *(void *)(v15 - 8);
  uint64_t v75 = v15;
  MEMORY[0x270FA5388](v15);
  v86 = (char *)&v71 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F6F10);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  v20 = (char *)&v71 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v87 = (uint64_t)&v71 - v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F6F18);
  uint64_t v23 = MEMORY[0x270FA5388](v22 - 8);
  v25 = (char *)&v71 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  v27 = (char *)&v71 - v26;
  uint64_t v28 = sub_259E99D08();
  v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56);
  v91 = v27;
  v29(v27, 1, 1, v28);
  if (a6 >> 60 == 15) {
    goto LABEL_6;
  }
  uint64_t v89 = a5;
  unint64_t v90 = a6;
  sub_259E5D7F8(a5, a6);
  sub_259E99CE8();
  uint64_t v30 = (uint64_t)v91;
  sub_259E5E234((uint64_t)v91, &qword_26A3F6F18);
  v29(v25, 0, 1, v28);
  sub_259E5E290((uint64_t)v25, v30, &qword_26A3F6F18);
  if (a8 >> 60 != 15)
  {
LABEL_6:
    unint64_t v73 = a8;
    uint64_t v33 = sub_259E9A018();
    v34 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56);
    uint64_t v35 = v87;
    v34(v87, 1, 1, v33);
    if (a9)
    {
      v36 = a9;
      CFDataRef v37 = SecKeyCopyExternalRepresentation(v36, 0);
      if (v37)
      {
        CFDataRef v38 = v37;
        uint64_t v39 = sub_259E99BE8();
        unint64_t v41 = v40;

        uint64_t v89 = v39;
        unint64_t v90 = v41;
        sub_259E5D7F8(v39, v41);
        uint64_t v42 = v88;
        sub_259E9A008();
        uint64_t v88 = v42;
        if (v42)
        {

          sub_259E5D850(v39, v41);
          sub_259E5E234(v87, &qword_26A3F6F10);
          return sub_259E5E234((uint64_t)v91, &qword_26A3F6F18);
        }
        uint64_t v44 = v87;
        sub_259E5E234(v87, &qword_26A3F6F10);

        unint64_t v45 = v41;
        uint64_t v35 = v44;
        sub_259E5D850(v39, v45);
        v34((uint64_t)v20, 0, 1, v33);
        sub_259E5E290((uint64_t)v20, v44, &qword_26A3F6F10);
      }
      else
      {
      }
    }
    v46 = self;
    v47 = v85;
    unsigned int v48 = objc_msgSend(v46, sel_isSEPKey_, v85);
    uint64_t v49 = v88;
    uint64_t v50 = (uint64_t)v91;
    uint64_t v51 = (uint64_t)v86;
    if (v48)
    {
      id v52 = v47;
      sub_259E99D98();
      unint64_t v53 = v73;
      if (!v49)
      {
        if (v83)
        {
          v54 = v76;
          sub_259E9A098();
          uint64_t v55 = sub_259E9A078();
          unint64_t v57 = v56;
          (*(void (**)(char *, uint64_t))(v77 + 8))(v54, v78);
        }
        else
        {
          uint64_t v55 = 0;
          unint64_t v57 = 0xF000000000000000;
        }
        uint64_t v70 = v75;
        POCryptoKitHPKE.decodeAndDecryptJWT<A>(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(v81, v51, v55, v57, v50, v82, v53, v35, v75, MEMORY[0x263F046A0]);
        sub_259E5D8A8(v55, v57);
        (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v51, v70);
      }
    }
    else
    {
      CFDataRef v58 = SecKeyCopyExternalRepresentation((SecKeyRef)v47, 0);
      if (v58)
      {
        CFDataRef v59 = v58;
        uint64_t v60 = sub_259E99BE8();
        unint64_t v62 = v61;

        uint64_t v89 = v60;
        unint64_t v90 = v62;
        sub_259E5D7F8(v60, v62);
        uint64_t v63 = (uint64_t)v84;
        sub_259E9A028();
        if (v49)
        {
          sub_259E5D850(v60, v62);
        }
        else
        {
          if (v83)
          {
            v65 = v76;
            sub_259E9A098();
            uint64_t v66 = sub_259E9A078();
            v67 = v65;
            unint64_t v69 = v68;
            (*(void (**)(char *, uint64_t))(v77 + 8))(v67, v78);
          }
          else
          {
            uint64_t v66 = 0;
            unint64_t v69 = 0xF000000000000000;
          }
          POCryptoKitHPKE.decodeAndDecryptJWT<A>(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(v81, v63, v66, v69, v50, v82, v73, v35, v80, MEMORY[0x263F047E8]);
          sub_259E5D8A8(v66, v69);
          sub_259E5D850(v60, v62);
          (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v63, v80);
        }
      }
      else
      {
        if (qword_26A3F7CB0 != -1) {
          swift_once();
        }
        uint64_t v64 = sub_259E99C48();
        __swift_project_value_buffer(v64, (uint64_t)qword_26A3F7CB8);
        Logger.PSSO_ERROR(code:description:)(-1005);
        swift_willThrow();
      }
    }
    sub_259E5E234(v35, &qword_26A3F6F10);
    uint64_t v32 = v50;
  }
  else
  {
    if (qword_26A3F7CB0 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_259E99C48();
    __swift_project_value_buffer(v31, (uint64_t)qword_26A3F7CB8);
    Logger.PSSO_ERROR(code:description:)(-1005);
    swift_willThrow();
    uint64_t v32 = (uint64_t)v91;
  }
  return sub_259E5E234(v32, &qword_26A3F6F18);
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_259E5D7F8(uint64_t a1, unint64_t a2)
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

uint64_t sub_259E5D850(uint64_t a1, unint64_t a2)
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

uint64_t sub_259E5D8A8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_259E5D850(a1, a2);
  }
  return a1;
}

void *POCryptoKitHPKE_P384_SHA384_AES_GCM_256.encodeAndEncryptJWT(_:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:)(void *a1, __SecKey *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, void *a9, uint64_t a10, uint64_t a11)
{
  uint64_t v83 = a1;
  uint64_t v79 = a7;
  uint64_t v78 = a4;
  uint64_t v73 = a3;
  SecKeyRef v81 = a2;
  uint64_t v14 = sub_259E9A0B8();
  uint64_t v74 = *(void *)(v14 - 8);
  uint64_t v75 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v72 = (char *)&v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_259E9A018();
  uint64_t v76 = *(void *)(v16 - 8);
  uint64_t v77 = v16;
  MEMORY[0x270FA5388](v16);
  uint64_t v82 = (char *)&v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A3F6F20);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v21 = (char *)&v70 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v85 = (uint64_t)&v70 - v22;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F6F18);
  uint64_t v24 = MEMORY[0x270FA5388](v23 - 8);
  uint64_t v26 = (char *)&v70 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v70 - v27;
  uint64_t v29 = sub_259E99D08();
  uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56);
  unint64_t v88 = (unint64_t)v28;
  v30(v28, 1, 1, v29);
  if (a6 >> 60 != 15)
  {
    uint64_t v86 = a5;
    unint64_t v87 = a6;
    sub_259E5D7F8(a5, a6);
    sub_259E99CE8();
    uint64_t v31 = v88;
    sub_259E5E234(v88, &qword_26A3F6F18);
    v30(v26, 0, 1, v29);
    sub_259E5E290((uint64_t)v26, v31, &qword_26A3F6F18);
    if (a8 >> 60 == 15)
    {
      if (qword_26A3F7CB0 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_259E99C48();
      uint64_t v33 = (void *)__swift_project_value_buffer(v32, (uint64_t)qword_26A3F7CB8);
      Logger.PSSO_ERROR(code:description:)(-1005);
      swift_willThrow();
      goto LABEL_10;
    }
  }
  unint64_t v80 = a8;
  v34 = (uint64_t *)sub_259E9A038();
  uint64_t v35 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(*(v34 - 1) + 56);
  uint64_t v36 = v85;
  v35(v85, 1, 1, v34);
  if (a9)
  {
    uint64_t v37 = v84;
    CFDataRef v38 = a9;
    CFDataRef v39 = SecKeyCopyExternalRepresentation(v38, 0);
    if (v39)
    {
      CFDataRef v40 = v39;
      uint64_t v33 = (void *)sub_259E99BE8();
      unint64_t v42 = v41;

      uint64_t v86 = (uint64_t)v33;
      unint64_t v87 = v42;
      sub_259E5D7F8((uint64_t)v33, v42);
      sub_259E9A028();
      if (v37)
      {

        sub_259E5D850((uint64_t)v33, v42);
        sub_259E5E234(v85, (uint64_t *)&unk_26A3F6F20);
LABEL_10:
        uint64_t v43 = v88;
LABEL_21:
        sub_259E5E234(v43, &qword_26A3F6F18);
        return v33;
      }
      unint64_t v45 = v34;
      uint64_t v46 = v85;
      sub_259E5E234(v85, (uint64_t *)&unk_26A3F6F20);

      unint64_t v47 = v42;
      uint64_t v36 = v46;
      sub_259E5D850((uint64_t)v33, v47);
      uint64_t v71 = v45;
      v35((uint64_t)v21, 0, 1, v45);
      uint64_t v44 = 0;
      sub_259E5E290((uint64_t)v21, v46, (uint64_t *)&unk_26A3F6F20);
    }
    else
    {
      uint64_t v71 = v34;

      uint64_t v44 = v37;
    }
  }
  else
  {
    uint64_t v71 = v34;
    uint64_t v44 = v84;
  }
  id v48 = objc_msgSend(v83, sel_header);
  uint64_t v49 = (void *)sub_259E9A058();
  objc_msgSend(v48, sel_setEnc_, v49);

  sub_259E9A068();
  uint64_t v50 = (void *)sub_259E9A058();
  swift_bridgeObjectRelease();
  objc_msgSend(v48, sel_setAlg_, v50);

  CFDataRef v51 = SecKeyCopyExternalRepresentation(v81, 0);
  unint64_t v52 = v88;
  unint64_t v53 = v80;
  uint64_t v54 = (uint64_t)v82;
  if (!v51)
  {
    if (qword_26A3F7CB0 != -1) {
      swift_once();
    }
    uint64_t v58 = sub_259E99C48();
    uint64_t v33 = (void *)__swift_project_value_buffer(v58, (uint64_t)qword_26A3F7CB8);
    Logger.PSSO_ERROR(code:description:)(-1005);
    swift_willThrow();
    goto LABEL_20;
  }
  uint64_t v33 = v51;
  uint64_t v55 = sub_259E99BE8();
  unint64_t v57 = v56;

  uint64_t v86 = v55;
  unint64_t v87 = v57;
  sub_259E5D7F8(v55, v57);
  sub_259E9A008();
  if (v44)
  {
    sub_259E5D850(v55, v57);
LABEL_20:
    sub_259E5E234(v36, (uint64_t *)&unk_26A3F6F20);
    uint64_t v43 = v52;
    goto LABEL_21;
  }
  uint64_t v61 = a10;
  unint64_t v60 = a11;
  if (v78)
  {
    unint64_t v62 = v72;
    uint64_t v84 = a10;
    uint64_t v85 = a11;
    sub_259E9A098();
    uint64_t v63 = sub_259E9A078();
    unint64_t v65 = v64;
    (*(void (**)(char *, uint64_t))(v74 + 8))(v62, v75);
    uint64_t v61 = v84;
    unint64_t v60 = v85;
  }
  else
  {
    uint64_t v63 = 0;
    unint64_t v65 = 0xF000000000000000;
  }
  uint64_t v85 = v63;
  uint64_t v66 = v63;
  unint64_t v67 = v65;
  unint64_t v68 = v65;
  uint64_t v69 = v88;
  uint64_t v33 = POCryptoKitHPKE.encodeAndEncryptJWT<A>(_:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:)(v83, v54, v66, v68, v88, v79, v53, v36, v61, v60, v71, MEMORY[0x263F047E8]);
  sub_259E5D8A8(v85, v67);
  sub_259E5D850(v55, v57);
  (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v54, v77);
  sub_259E5E234(v36, (uint64_t *)&unk_26A3F6F20);
  sub_259E5E234(v69, &qword_26A3F6F18);
  return v33;
}

uint64_t sub_259E5E234(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_259E5E290(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void POCryptoKitHPKE_P384_SHA384_AES_GCM_256.__allocating_init(cipherSuite:)()
{
}

void POCryptoKitHPKE_P384_SHA384_AES_GCM_256.init(cipherSuite:)()
{
}

void sub_259E5E5B4()
{
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P384_SHA384_AES_GCM_256_encryptionAlgorithm));
}

id POCryptoKitHPKE_P384_SHA384_AES_GCM_256.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_259E5E60C()
{
  return type metadata accessor for POCryptoKitHPKE_P384_SHA384_AES_GCM_256();
}

uint64_t type metadata accessor for POCryptoKitHPKE_P384_SHA384_AES_GCM_256()
{
  uint64_t result = qword_26A3F7CD0;
  if (!qword_26A3F7CD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_259E5E660()
{
  return swift_updateClassMetadata2();
}

void type metadata accessor for POEncryptionAlgorithm()
{
  if (!qword_26A3F6F90)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26A3F6F90);
    }
  }
}

id sub_259E5E6FC()
{
  return *v0;
}

id sub_259E5E704(void *a1, id *a2)
{
  *a2 = a1;
  return a1;
}

uint64_t sub_259E5E750(void *a1, id *a2)
{
  *a2 = a1;
  id v4 = a1;
  return 1;
}

id sub_259E5E788@<X0>(id result@<X0>, id *a2@<X8>)
{
  if (result)
  {
    *a2 = result;
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_259E5E798@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

id sub_259E5E7A4@<X0>(void **a1@<X8>)
{
  objc_super v2 = *v1;
  *a1 = *v1;
  return v2;
}

uint64_t sub_259E5E7B0(uint64_t a1)
{
  uint64_t v2 = sub_259E5E880(&qword_26A3F6FA8);
  return MEMORY[0x270F9F190](a1, v2);
}

uint64_t sub_259E5E818()
{
  return sub_259E5E880(&qword_26A3F6F98);
}

uint64_t sub_259E5E84C()
{
  return sub_259E5E880(&qword_26A3F6FA0);
}

uint64_t sub_259E5E880(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for POEncryptionAlgorithm();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
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

uint64_t sub_259E5E928()
{
  uint64_t v0 = sub_259E99C48();
  __swift_allocate_value_buffer(v0, qword_26A3F7EE8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A3F7EE8);
  return sub_259E99C38();
}

void *sub_259E5E9A4()
{
  qword_26A3F8670 = 0x2707DBB68;
  return &unk_2707DBB68;
}

uint64_t *sub_259E5E9BC()
{
  if (qword_26A3F7F00 != -1) {
    swift_once();
  }
  return &qword_26A3F8670;
}

id sub_259E5EA08()
{
  if (qword_26A3F7F00 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26A3F8670;
  return v0;
}

uint64_t sub_259E5EAC0()
{
  uint64_t v0 = sub_259E99E88();
  __swift_allocate_value_buffer(v0, qword_26A3F8678);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A3F8678);
  return sub_259E99E48();
}

uint64_t sub_259E5EB0C()
{
  if (qword_26A3F7F08 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_259E99E88();
  return __swift_project_value_buffer(v0, (uint64_t)qword_26A3F8678);
}

uint64_t sub_259E5EB70@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A3F7F08 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_259E99E88();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A3F8678);
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t variable initialization expression of POPrebootDataKey.encryptedKeyData()
{
  return 0;
}

uint64_t POPrebootDataKey.encryptedKeyData.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_encryptedKeyData);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_259E5ED84(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_encryptedKeyData);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_259E5EDE4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x60))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_259E5EE40(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_encryptedKeyData);
  swift_beginAccess();
  *uint64_t v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t variable initialization expression of POPrebootDataKey.keyData()
{
  return 0;
}

uint64_t POPrebootDataKey.keyData.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_keyData;
  swift_beginAccess();
  uint64_t v2 = *(void *)v1;
  sub_259E5EFB4(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t sub_259E5EFB4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_259E5D7F8(a1, a2);
  }
  return a1;
}

uint64_t sub_259E5F05C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_keyData);
  swift_beginAccess();
  uint64_t v6 = *v5;
  unint64_t v7 = v5[1];
  *uint64_t v5 = a1;
  v5[1] = a2;
  return sub_259E5D8A8(v6, v7);
}

uint64_t sub_259E5F0BC@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x78))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_259E5F118(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = (uint64_t *)(*a2 + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_keyData);
  swift_beginAccess();
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  *uint64_t v4 = v2;
  v4[1] = v3;
  sub_259E5EFB4(v2, v3);
  return sub_259E5D8A8(v5, v6);
}

uint64_t static POPrebootDataKey.verifiedKey(prebootData:)()
{
  uint64_t v1 = sub_259E99E38();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_259E99D08();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_259E5FE68();
  if (v0) {
    return v6;
  }
  uint64_t result = sub_259E99B88();
  if (v10 >> 60 != 15)
  {
    uint64_t v11 = result;
    unint64_t v12 = v10;
    sub_259E5D7F8(result, v10);
    sub_259E5F47C(v11, v12);
    uint64_t v14 = v2;
    uint64_t v15 = v6;
    uint64_t v6 = sub_259E99DE8();
    sub_259E5D8A8(v11, v12);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v4, v1);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v8, v5);
    return v6;
  }
  __break(1u);
  return result;
}

uint64_t sub_259E5F47C(uint64_t a1, unint64_t a2)
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
        JUMPOUT(0x259E5F5BCLL);
      }
      uint64_t v4 = (int)v4;
LABEL_6:
      if (v4 > 27)
      {
        sub_259E5D7F8(a1, a2);
        sub_259E60314(a1, a2);
        sub_259E99E28();
        return sub_259E5D850(a1, a2);
      }
      else
      {
LABEL_7:
        uint64_t v8 = sub_259E99C58();
        sub_259E61C48();
        swift_allocError();
        (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v8 - 8) + 104))(v9, *MEMORY[0x263F04538], v8);
        swift_willThrow();
        return sub_259E5D850(a1, a2);
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

char *static POPrebootDataKey.createKey()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F7020);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_259E99E38();
  unint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_259E99D08();
  uint64_t v43 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = self;
  if (qword_26A3F7F00 != -1) {
    swift_once();
  }
  id v12 = objc_msgSend(v11, sel_createEncryptionKeyForAlgorithm_, qword_26A3F8670);
  id v13 = v11;
  if (v12)
  {
    id v14 = objc_msgSend(v13, sel_dataForEphemeralKey_, v12);
    if (!v14)
    {
      if (qword_26A3F7EE0 != -1) {
        swift_once();
      }
      uint64_t v20 = sub_259E99C48();
      uint64_t v3 = (char *)__swift_project_value_buffer(v20, (uint64_t)qword_26A3F7EE8);
      Logger.PSSO_ERROR(code:description:)(-1001);
      swift_willThrow();
      goto LABEL_13;
    }
    uint64_t v15 = v14;
    unint64_t v39 = v5;
    uint64_t v40 = v8;
    uint64_t v16 = sub_259E99BE8();
    unint64_t v18 = v17;

    sub_259E5FE68();
    if (v0)
    {
      sub_259E5D850(v16, v18);
LABEL_13:

      return v3;
    }
    uint64_t v41 = v16;
    unint64_t v42 = v18;
    uint64_t v22 = sub_259E99E08();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v3, 1, 1, v22);
    sub_259E60120();
    sub_259E99DF8();
    uint64_t v38 = v16;
    sub_259E60174((uint64_t)v3);
    uint64_t v23 = sub_259E99E18();
    unint64_t v25 = v24;
    (*(void (**)(char *, uint64_t))(v39 + 8))(v7, v4);
    if (v25 >> 60 == 15)
    {
      if (qword_26A3F7EE0 != -1) {
        swift_once();
      }
      uint64_t v26 = sub_259E99C48();
      uint64_t v3 = (char *)__swift_project_value_buffer(v26, (uint64_t)qword_26A3F7EE8);
      Logger.PSSO_ERROR(code:description:)(-1001);
      swift_willThrow();

      sub_259E5D850(v38, v18);
      (*(void (**)(char *, uint64_t))(v43 + 8))(v10, v40);
    }
    else
    {
      uint64_t v27 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for POPrebootDataKey()), sel_init);
      unint64_t v39 = v25;
      uint64_t v3 = v27;
      uint64_t v28 = (uint64_t *)&v27[OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_keyData];
      swift_beginAccess();
      uint64_t v29 = *v28;
      unint64_t v30 = v28[1];
      uint64_t v31 = v38;
      *uint64_t v28 = v38;
      v28[1] = v18;
      unint64_t v37 = v18;
      sub_259E5D7F8(v31, v18);
      sub_259E5D8A8(v29, v30);
      unint64_t v32 = v39;
      uint64_t v33 = sub_259E99BD8();
      uint64_t v35 = v34;
      uint64_t v36 = (uint64_t *)&v3[OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_encryptedKeyData];
      swift_beginAccess();
      uint64_t *v36 = v33;
      v36[1] = v35;
      swift_bridgeObjectRelease();
      sub_259E5D8A8(v23, v32);

      sub_259E5D850(v38, v37);
      (*(void (**)(char *, uint64_t))(v43 + 8))(v10, v40);
    }
  }
  else
  {
    if (qword_26A3F7EE0 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_259E99C48();
    uint64_t v3 = (char *)__swift_project_value_buffer(v19, (uint64_t)qword_26A3F7EE8);
    Logger.PSSO_ERROR(code:description:)(-1001);
    swift_willThrow();
  }
  return v3;
}

uint64_t static POPrebootDataKey.encrypt(data:key:)(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_259E60E38(a1, a2, a3);
}

void *static POPrebootDataKey.decrypt(data:key:)(void *a1, uint64_t a2, unint64_t a3)
{
  return sub_259E613FC(a1, a2, a3);
}

id sub_259E5FD54(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t (*a6)(uint64_t, unint64_t, id))
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = sub_259E99BE8();
  unint64_t v12 = v11;

  uint64_t v13 = a6(v10, v12, v9);
  unint64_t v15 = v14;

  sub_259E5D850(v10, v12);
  uint64_t v16 = (void *)sub_259E99BC8();
  sub_259E5D850(v13, v15);
  return v16;
}

uint64_t sub_259E5FE68()
{
  uint64_t v0 = sub_259E99DC8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_259E99D08();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v5 = self;
  id v6 = objc_msgSend(v5, sel_platformSSOSystemKey);
  if (v6)
  {
    BOOL v7 = v6;
    uint64_t v8 = sub_259E99BE8();
    unint64_t v10 = v9;

LABEL_5:
    v16[0] = v8;
    v16[1] = v10;
    sub_259E5D7F8(v8, v10);
    sub_259E5D7F8(v8, v10);
    sub_259E99CE8();
    sub_259E5D8A8(v8, v10);
    return sub_259E5D850(v8, v10);
  }
  sub_259E99DB8();
  sub_259E99CF8();
  sub_259E99CD8();
  id v11 = objc_msgSend(v5, sel_platformSSOSystemKey);
  if (v11)
  {
    unint64_t v12 = v11;
    uint64_t v8 = sub_259E99BE8();
    unint64_t v10 = v13;

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    goto LABEL_5;
  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  if (qword_26A3F7EE0 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_259E99C48();
  __swift_project_value_buffer(v15, (uint64_t)qword_26A3F7EE8);
  Logger.PSSO_ERROR(code:description:)(-1001);
  return swift_willThrow();
}

unint64_t sub_259E60120()
{
  unint64_t result = qword_26A3F7028;
  if (!qword_26A3F7028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F7028);
  }
  return result;
}

uint64_t sub_259E60174(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F7020);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for POPrebootDataKey()
{
  return self;
}

void sub_259E601F8(unsigned char *a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v4 = self;
    uint64_t v5 = sub_259E61D34(a1, a2 - (void)a1);
    unint64_t v7 = v6;
    uint64_t v8 = (void *)sub_259E99BC8();
    sub_259E5D850(v5, v7);
    objc_msgSend(v4, sel_createPlatformSSOSystemKey_, v8);
  }
  else
  {
    __break(1u);
  }
}

id POPrebootDataKey.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for POPrebootDataKey();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_259E60314(uint64_t a1, unint64_t a2)
{
  v28[5] = *MEMORY[0x263EF8340];
  v28[3] = MEMORY[0x263F06F78];
  v28[4] = MEMORY[0x263F06F68];
  v28[0] = a1;
  v28[1] = a2;
  uint64_t v4 = __swift_project_boxed_opaque_existential_1(v28, MEMORY[0x263F06F78]);
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
      sub_259E5D7F8(a1, a2);
      sub_259E5D7F8(v5, v6);
      uint64_t v8 = (unsigned char *)sub_259E99B08();
      if (v8)
      {
        uint64_t v9 = sub_259E99B38();
        if (!__OFSUB__((int)v5, v9))
        {
          v8 += (int)v5 - v9;
          goto LABEL_7;
        }
LABEL_31:
        __break(1u);
      }
LABEL_7:
      uint64_t v10 = sub_259E99B28();
      if (v10 >= (v5 >> 32) - (int)v5) {
        uint64_t v11 = (v5 >> 32) - (int)v5;
      }
      else {
        uint64_t v11 = v10;
      }
      unint64_t v12 = &v8[v11];
      if (v8) {
        unint64_t v13 = v12;
      }
      else {
        unint64_t v13 = 0;
      }
      sub_259E605C8(v8, v13, &v27);
      sub_259E5D850(v5, v6);
LABEL_27:
      sub_259E5D850(a1, a2);
      uint64_t v24 = v27;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      return v24;
    case 2uLL:
      uint64_t v14 = *(void *)(v5 + 16);
      uint64_t v15 = *(void *)(v5 + 24);
      sub_259E5D7F8(a1, a2);
      swift_retain();
      swift_retain();
      uint64_t v16 = (unsigned char *)sub_259E99B08();
      if (!v16) {
        goto LABEL_17;
      }
      uint64_t v17 = sub_259E99B38();
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
      uint64_t v20 = sub_259E99B28();
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
      sub_259E605C8(v16, v23, &v27);
      swift_release();
      swift_release();
      goto LABEL_27;
    case 3uLL:
      memset(v26, 0, 14);
      sub_259E5D7F8(a1, a2);
      unint64_t v7 = v26;
      goto LABEL_26;
    default:
      v26[0] = *v4;
      LOWORD(v26[1]) = v6;
      BYTE2(v26[1]) = BYTE2(v6);
      BYTE3(v26[1]) = BYTE3(v6);
      BYTE4(v26[1]) = BYTE4(v6);
      BYTE5(v26[1]) = BYTE5(v6);
      sub_259E5D7F8(a1, a2);
      unint64_t v7 = (char *)v26 + BYTE6(v6);
LABEL_26:
      sub_259E605C8(v26, v7, &v27);
      goto LABEL_27;
  }
}

unsigned char *sub_259E605C8@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    unint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    unint64_t result = (unsigned char *)sub_259E60C74(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    unint64_t result = (unsigned char *)sub_259E60D38((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    unint64_t result = (unsigned char *)sub_259E60DB4((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

char *sub_259E60640(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v46[3] = a4;
  if (a1 < 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v11 = a5;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = MEMORY[0x263F8EE78];
  uint64_t v43 = swift_allocObject();
  *(void *)(v43 + 16) = 15;
  uint64_t v15 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v16 = HIBYTE(a6) & 0xF) : (uint64_t v16 = v11 & 0xFFFFFFFFFFFFLL), !v16))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v15 = v11 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v30 = 7;
    if (((a6 >> 60) & ((v11 & 0x800000000000000) == 0)) != 0) {
      uint64_t v30 = 11;
    }
    sub_259E60A60(v30 | (v15 << 16), v43, a2 & 1, v14);
    swift_bridgeObjectRelease();
    uint64_t v10 = *(char **)(v14 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_38;
  }
  uint64_t v38 = a1;
  uint64_t v39 = v14;
  unint64_t v44 = 4 * v16;
  uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  unint64_t v9 = 15;
  unint64_t v8 = 15;
  unint64_t v17 = 15;
  while (1)
  {
    v46[0] = sub_259E9A178();
    v46[1] = v18;
    uint64_t v19 = a3(v46);
    if (v7)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v10;
    }
    uint64_t v6 = v19;
    swift_bridgeObjectRelease();
    if (v6) {
      break;
    }
    unint64_t v9 = sub_259E9A0F8();
LABEL_9:
    if (v44 == v9 >> 14) {
      goto LABEL_29;
    }
  }
  if (v8 >> 14 == v9 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v9 = sub_259E9A0F8();
    *(void *)(v43 + 16) = v9;
    unint64_t v8 = v9;
    unint64_t v17 = v9;
    goto LABEL_9;
  }
  if (v9 >> 14 < v8 >> 14)
  {
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v20 = sub_259E9A198();
  uint64_t v40 = v21;
  uint64_t v41 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v10 = sub_259E60B70(0, *((void *)v10 + 2) + 1, 1, v10);
  }
  unint64_t v27 = *((void *)v10 + 2);
  unint64_t v26 = *((void *)v10 + 3);
  uint64_t v6 = v27 + 1;
  if (v27 >= v26 >> 1) {
    uint64_t v10 = sub_259E60B70((char *)(v26 > 1), v27 + 1, 1, v10);
  }
  *((void *)v10 + 2) = v6;
  uint64_t v28 = &v10[32 * v27];
  *((void *)v28 + 4) = v41;
  *((void *)v28 + 5) = v23;
  *((void *)v28 + 6) = v25;
  *((void *)v28 + 7) = v40;
  *(void *)(v39 + 16) = v10;
  uint64_t v29 = sub_259E9A0F8();
  unint64_t v9 = v29;
  *(void *)(v43 + 16) = v29;
  if (*((void *)v10 + 2) != v38)
  {
    unint64_t v8 = v29;
    unint64_t v17 = v29;
    goto LABEL_9;
  }
  unint64_t v17 = v29;
  unint64_t v8 = v29;
LABEL_29:
  if (v44 == v8 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  if (v44 >= v17 >> 14)
  {
    uint64_t v6 = sub_259E9A198();
    unint64_t v8 = v31;
    unint64_t v9 = v32;
    uint64_t v11 = v33;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      goto LABEL_43;
    }
    goto LABEL_34;
  }
LABEL_42:
  __break(1u);
LABEL_43:
  uint64_t v10 = sub_259E60B70(0, *((void *)v10 + 2) + 1, 1, v10);
LABEL_34:
  unint64_t v35 = *((void *)v10 + 2);
  unint64_t v34 = *((void *)v10 + 3);
  if (v35 >= v34 >> 1) {
    uint64_t v10 = sub_259E60B70((char *)(v34 > 1), v35 + 1, 1, v10);
  }
  *((void *)v10 + 2) = v35 + 1;
  uint64_t v36 = &v10[32 * v35];
  *((void *)v36 + 4) = v6;
  *((void *)v36 + 5) = v8;
  *((void *)v36 + 6) = v9;
  *((void *)v36 + 7) = v11;
  *(void *)(v39 + 16) = v10;
LABEL_37:
  swift_bridgeObjectRetain();
  swift_release();
LABEL_38:
  swift_release();
  return v10;
}

uint64_t sub_259E60A60(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v10 = *(void *)(a2 + 16) >> 14;
  int v11 = (v10 == a1 >> 14) & a3;
  if (v11 == 1) {
    return v11 ^ 1u;
  }
  if (a1 >> 14 < v10)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v4 = a4;
  uint64_t v5 = sub_259E9A198();
  uint64_t v6 = v12;
  uint64_t v7 = v13;
  uint64_t v8 = v14;
  unint64_t v9 = *(char **)(v4 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v4 + 16) = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_9:
    unint64_t v9 = sub_259E60B70(0, *((void *)v9 + 2) + 1, 1, v9);
    *(void *)(v4 + 16) = v9;
  }
  unint64_t v17 = *((void *)v9 + 2);
  unint64_t v16 = *((void *)v9 + 3);
  if (v17 >= v16 >> 1)
  {
    unint64_t v9 = sub_259E60B70((char *)(v16 > 1), v17 + 1, 1, v9);
    *(void *)(v4 + 16) = v9;
  }
  *((void *)v9 + 2) = v17 + 1;
  uint64_t v18 = &v9[32 * v17];
  *((void *)v18 + 4) = v5;
  *((void *)v18 + 5) = v6;
  *((void *)v18 + 6) = v7;
  *((void *)v18 + 7) = v8;
  return v11 ^ 1u;
}

char *sub_259E60B70(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F7030);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_259E60C74(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
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

uint64_t sub_259E60D38(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_259E99B48();
  swift_allocObject();
  uint64_t result = sub_259E99AF8();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_259E99B98();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_259E60DB4(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_259E99B48();
  swift_allocObject();
  uint64_t result = sub_259E99AF8();
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

uint64_t sub_259E60E38(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  v39._countAndFlagsBits = a1;
  v39._object = a2;
  uint64_t v6 = sub_259E9A0B8();
  uint64_t v38 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v37 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_259E99E88();
  unint64_t v42 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_259E99FC8();
  MEMORY[0x270FA5388](v11);
  uint64_t v12 = sub_259E99F38();
  uint64_t v40 = *(void *)(v12 - 8);
  uint64_t v41 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v46 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_259E99FF8();
  uint64_t v43 = *(void *)(v14 - 8);
  uint64_t v44 = v14;
  MEMORY[0x270FA5388](v14);
  unint64_t v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = objc_msgSend(self, sel_dataForEphemeralKey_, a3);
  if (!v17)
  {
    if (qword_26A3F7EE0 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_259E99C48();
    uint64_t v4 = __swift_project_value_buffer(v23, (uint64_t)qword_26A3F7EE8);
    Logger.PSSO_ERROR(code:description:)(-1001);
    swift_willThrow();
    return v4;
  }
  uint64_t v18 = v17;
  uint64_t v36 = v6;
  uint64_t v19 = sub_259E99BE8();
  uint64_t v21 = v20;

  v45._countAndFlagsBits = v19;
  v45._object = v21;
  sub_259E5D7F8(v19, (unint64_t)v21);
  sub_259E99FE8();
  if (v3)
  {
    sub_259E5D850(v19, (unint64_t)v21);
    return v4;
  }
  sub_259E99FD8();
  if (qword_26A3F7F08 != -1) {
    swift_once();
  }
  uint64_t v22 = __swift_project_value_buffer(v8, (uint64_t)qword_26A3F8678);
  (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v10, v22, v8);
  sub_259E99EF8();
  Swift::String v45 = v39;
  sub_259E60120();
  uint64_t v25 = sub_259E99F28();
  unint64_t v42 = v26;
  unint64_t v27 = (void *)v25;
  uint64_t v28 = sub_259E99F08();
  unint64_t v30 = v29;
  Swift::String v31 = Data.base64URLEncodedString()();
  sub_259E5D850(v28, v30);
  Swift::String v45 = v31;
  sub_259E9A118();
  v39._object = v27;
  unint64_t v32 = v42;
  Data.base64URLEncodedString()();
  sub_259E9A118();
  swift_bridgeObjectRelease();
  uint64_t v33 = v37;
  sub_259E9A098();
  uint64_t v4 = sub_259E9A078();
  unint64_t v35 = v34;
  swift_bridgeObjectRelease();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v33, v36);
  if (v35 >> 60 != 15)
  {
    sub_259E5D850((uint64_t)v39._object, v32);
    sub_259E5D850(v19, (unint64_t)v21);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v46, v41);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v16, v44);
    return v4;
  }
  __break(1u);
  return result;
}

void *sub_259E613FC(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v66 = a3;
  uint64_t v6 = sub_259E99E88();
  uint64_t v60 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_259E99FA8();
  uint64_t v59 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v61 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_259E99FF8();
  uint64_t v62 = *(void *)(v11 - 8);
  uint64_t v63 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  unint64_t v16 = (char *)&v52 - v15;
  uint64_t v17 = sub_259E9A0B8();
  MEMORY[0x270FA5388](v17 - 8);
  sub_259E9A098();
  uint64_t v18 = sub_259E9A088();
  if (!v19)
  {
    if (qword_26A3F7EE0 == -1)
    {
LABEL_8:
      uint64_t v29 = sub_259E99C48();
      __swift_project_value_buffer(v29, (uint64_t)qword_26A3F7EE8);
      Logger.PSSO_ERROR(code:description:)(-1001);
      swift_willThrow();
      return a1;
    }
LABEL_22:
    swift_once();
    goto LABEL_8;
  }
  uint64_t v20 = v18;
  unint64_t v21 = v19;
  uint64_t v58 = v9;
  uint64_t v64 = 46;
  unint64_t v65 = 0xE100000000000000;
  MEMORY[0x270FA5388](v18);
  *(&v52 - 2) = (uint64_t)&v64;
  swift_bridgeObjectRetain();
  a1 = sub_259E60640(2, 1, sub_259E61BA4, (uint64_t)(&v52 - 4), v20, v21);
  swift_bridgeObjectRelease();
  if (a1[2] != 2) {
    goto LABEL_4;
  }
  uint64_t v57 = v4;
  uint64_t v22 = a1[4];
  uint64_t v23 = a1[5];
  uint64_t v24 = a1[6];
  uint64_t v25 = a1[7];
  swift_bridgeObjectRetain();
  unint64_t v26 = MEMORY[0x25A2ECC30](v22, v23, v24, v25);
  swift_bridgeObjectRelease();
  uint64_t v27 = Data.init(base64URLEncoded:)();
  if (v28 >> 60 == 15)
  {
LABEL_4:
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  uint64_t v55 = v27;
  unint64_t v56 = v28;
  if (a1[2] < 2uLL)
  {
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v31 = a1[8];
  uint64_t v32 = a1[9];
  uint64_t v34 = a1[10];
  uint64_t v33 = a1[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1 = (void *)MEMORY[0x25A2ECC30](v31, v32, v34, v33);
  swift_bridgeObjectRelease();
  uint64_t v35 = Data.init(base64URLEncoded:)();
  if (v36 >> 60 == 15)
  {
    sub_259E5D8A8(v55, v56);
LABEL_5:
    if (qword_26A3F7EE0 == -1) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
  uint64_t v25 = v35;
  unint64_t v26 = v36;
  id v37 = objc_msgSend(self, sel_dataForEphemeralKey_, v66);
  if (!v37)
  {
    if (qword_26A3F7EE0 == -1)
    {
LABEL_17:
      uint64_t v45 = sub_259E99C48();
      __swift_project_value_buffer(v45, (uint64_t)qword_26A3F7EE8);
      Logger.PSSO_ERROR(code:description:)(-1001);
      swift_willThrow();
      sub_259E5D8A8(v25, v26);
      uint64_t v43 = v55;
      unint64_t v44 = v56;
      goto LABEL_21;
    }
LABEL_24:
    swift_once();
    goto LABEL_17;
  }
  uint64_t v38 = v37;
  uint64_t v39 = sub_259E99BE8();
  unint64_t v41 = v40;

  a1 = (void *)v39;
  uint64_t v64 = v39;
  unint64_t v65 = v41;
  sub_259E5D7F8(v39, v41);
  uint64_t v42 = v57;
  sub_259E99FE8();
  if (v42)
  {
    sub_259E5D8A8(v55, v56);
    sub_259E5D850(v39, v41);
    uint64_t v43 = v25;
    unint64_t v44 = v26;
LABEL_21:
    sub_259E5D8A8(v43, v44);
    return a1;
  }
  uint64_t v53 = v39;
  unint64_t v54 = v41;
  uint64_t v57 = v25;
  unint64_t v66 = v26;
  uint64_t v47 = v62;
  uint64_t v46 = v63;
  (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v14, v16, v63);
  if (qword_26A3F7F08 != -1) {
    swift_once();
  }
  uint64_t v48 = __swift_project_value_buffer(v6, (uint64_t)qword_26A3F8678);
  (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v8, v48, v6);
  sub_259E5D7F8(v55, v56);
  uint64_t v49 = v61;
  sub_259E99F78();
  uint64_t v50 = v57;
  unint64_t v51 = v66;
  uint64_t v64 = v57;
  unint64_t v65 = v66;
  sub_259E60120();
  a1 = (void *)sub_259E99F98();
  sub_259E5D8A8(v55, v56);
  sub_259E5D850(v53, v54);
  (*(void (**)(char *, uint64_t))(v59 + 8))(v49, v58);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v16, v46);
  sub_259E5D8A8(v50, v51);
  return a1;
}

uint64_t sub_259E61BA4(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return sub_259E9A248() & 1;
  }
}

uint64_t sub_259E61BFC()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_259E61C34()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

unint64_t sub_259E61C48()
{
  unint64_t result = qword_26A3F7038;
  if (!qword_26A3F7038)
  {
    sub_259E99C58();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F7038);
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_259E61D34(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return sub_259E60C74(__src, &__src[a2]);
  }
  sub_259E99B48();
  swift_allocObject();
  sub_259E99AF8();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  sub_259E99B98();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

void sub_259E61DE8()
{
}

uint64_t sub_259E61DFC()
{
  uint64_t v0 = sub_259E99C48();
  __swift_allocate_value_buffer(v0, qword_26A3F7F18);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A3F7F18);
  return sub_259E99C38();
}

uint64_t sub_259E61E80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC15PlatformSSOCore15POCryptoKitHPKE_cipherSuite;
  uint64_t v4 = sub_259E99E88();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

id POCryptoKitHPKE.__allocating_init(cipherSuite:)(uint64_t a1)
{
  uint64_t v3 = (char *)objc_allocWithZone(v1);
  uint64_t v4 = &v3[OBJC_IVAR____TtC15PlatformSSOCore15POCryptoKitHPKE_cipherSuite];
  uint64_t v5 = sub_259E99E88();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v4, a1, v5);
  v9.receiver = v3;
  v9.super_class = v1;
  id v7 = objc_msgSendSuper2(&v9, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  return v7;
}

id POCryptoKitHPKE.init(cipherSuite:)(uint64_t a1)
{
  uint64_t v3 = &v1[OBJC_IVAR____TtC15PlatformSSOCore15POCryptoKitHPKE_cipherSuite];
  uint64_t v4 = sub_259E99E88();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v3, a1, v4);
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for POCryptoKitHPKE();
  id v6 = objc_msgSendSuper2(&v8, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v6;
}

uint64_t type metadata accessor for POCryptoKitHPKE()
{
  uint64_t result = qword_26A3F7F30;
  if (!qword_26A3F7F30) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *POCryptoKitHPKE.encodeAndEncryptJWT<A>(_:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:)(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, uint64_t *a11, unint64_t a12)
{
  uint64_t v217 = a8;
  unint64_t v200 = a7;
  uint64_t v191 = a6;
  unint64_t v216 = a5;
  unint64_t v212 = a4;
  v211 = (uint64_t *)a3;
  uint64_t v208 = a2;
  uint64_t v13 = (uint64_t *)a12;
  uint64_t v14 = sub_259E9A0B8();
  uint64_t v186 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  v185 = (char *)&v163 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_259E99F38();
  uint64_t v222 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v163 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v207 = sub_259E99E88();
  uint64_t v206 = *(void *)(v207 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v207);
  v203 = (char *)&v163 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v190 = (char *)&v163 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v183 = (char *)&v163 - v24;
  MEMORY[0x270FA5388](v23);
  v179 = (char *)&v163 - v25;
  unint64_t v213 = a12;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v205 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v26 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  v202 = (char *)&v163 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  v189 = (char *)&v163 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  v182 = (char *)&v163 - v31;
  MEMORY[0x270FA5388](v30);
  v178 = (char *)&v163 - v32;
  uint64_t v199 = sub_259E9A1B8();
  uint64_t v198 = *(void *)(v199 - 8);
  uint64_t v33 = MEMORY[0x270FA5388](v199);
  v193 = (char *)&v163 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  v176 = (char *)&v163 - v36;
  v204 = a11;
  uint64_t v37 = *(a11 - 1);
  uint64_t v38 = MEMORY[0x270FA5388](v35);
  v188 = (char *)&v163 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = MEMORY[0x270FA5388](v38);
  uint64_t v215 = (uint64_t)&v163 - v41;
  uint64_t v42 = MEMORY[0x270FA5388](v40);
  v175 = (char *)&v163 - v43;
  MEMORY[0x270FA5388](v42);
  v177 = (char *)&v163 - v44;
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F6F18);
  MEMORY[0x270FA5388](v45 - 8);
  uint64_t v197 = (uint64_t)&v163 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_259E99D08();
  uint64_t v48 = *(void *)(v47 - 8);
  uint64_t v49 = MEMORY[0x270FA5388](v47);
  v181 = (char *)&v163 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = MEMORY[0x270FA5388](v49);
  v174 = (char *)&v163 - v52;
  MEMORY[0x270FA5388](v51);
  v196 = (char *)&v163 - v53;
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F7040);
  uint64_t v55 = MEMORY[0x270FA5388](v54 - 8);
  v192 = (char *)&v163 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = MEMORY[0x270FA5388](v55);
  v201 = (char *)&v163 - v58;
  uint64_t v59 = MEMORY[0x270FA5388](v57);
  v187 = (char *)&v163 - v60;
  uint64_t v61 = MEMORY[0x270FA5388](v59);
  v180 = (char *)&v163 - v62;
  uint64_t v63 = MEMORY[0x270FA5388](v61);
  v173 = (char *)&v163 - v64;
  MEMORY[0x270FA5388](v63);
  unint64_t v66 = (char *)&v163 - v65;
  id v67 = objc_msgSend(a1, sel_body);
  if (!v67)
  {
    if (qword_26A3F7F10 != -1) {
      swift_once();
    }
    uint64_t v82 = sub_259E99C48();
    __swift_project_value_buffer(v82, (uint64_t)qword_26A3F7F18);
    Logger.PSSO_ERROR(code:description:)(-1005);
    swift_willThrow();
    return v13;
  }
  uint64_t v164 = v14;
  id v171 = a1;
  v169 = v18;
  id v68 = objc_msgSend(v67, sel_dataRepresentation);
  swift_unknownObjectRelease();
  uint64_t v194 = sub_259E99BE8();
  unint64_t v195 = v69;

  uint64_t v166 = v48;
  uint64_t v70 = *(uint64_t (**)(void, void, void))(v48 + 48);
  uint64_t v184 = v47;
  int v71 = v70(v216, 1, v47);
  uint64_t v165 = v37;
  uint64_t v72 = v204;
  v170 = *(uint64_t (**)(void, void, void))(v37 + 48);
  int v73 = v170(v217, 1, v204);
  uint64_t v74 = *(void (**)(void, void, void, void))(v222 + 56);
  uint64_t v172 = v16;
  uint64_t v168 = v222 + 56;
  v167 = v74;
  v74(v66, 1, 1, v16);
  uint64_t v75 = (uint64_t)v66;
  uint64_t v76 = v215;
  if (v71 == 1)
  {
LABEL_5:
    if (v73 == 1)
    {
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v205 + 16))(v202, v208, AssociatedTypeWitness);
      (*(void (**)(char *, uint64_t, uint64_t))(v206 + 16))(v203, v210 + OBJC_IVAR____TtC15PlatformSSOCore15POCryptoKitHPKE_cipherSuite, v207);
      if (v212 >> 60 == 15) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = v211;
      }
      sub_259E5EFB4((uint64_t)v211, v212);
      swift_getAssociatedConformanceWitness();
      uint64_t v86 = (uint64_t)v201;
      uint64_t v87 = v214;
      sub_259E99EF8();
      sub_259E5E234(v75, &qword_26A3F7040);
      if (v87)
      {
        sub_259E5D850(v194, v195);
        return v13;
      }
      uint64_t v88 = v172;
      uint64_t v89 = v222;
      goto LABEL_40;
    }
    goto LABEL_6;
  }
  uint64_t v77 = v197;
  sub_259E65818(v216, v197, &qword_26A3F6F18);
  uint64_t v78 = v184;
  if (v70(v77, 1, v184) == 1)
  {
    sub_259E5E234(v77, &qword_26A3F6F18);
    goto LABEL_5;
  }
  uint64_t v83 = v78;
  uint64_t v84 = v166;
  uint64_t v85 = v196;
  (*(void (**)(char *, uint64_t, uint64_t))(v166 + 32))(v196, v77, v83);
  if (v200 >> 60 != 15)
  {
    BOOL v96 = v73 == 1;
    uint64_t v97 = v199;
    uint64_t v98 = v198;
    if (v96)
    {
      sub_259E5D7F8(v191, v200);
    }
    else
    {
      v99 = v176;
      (*(void (**)(char *, uint64_t, uint64_t))(v198 + 16))(v176, v217, v199);
      int v100 = v170(v99, 1, v72);
      if (v100 != 1)
      {
        uint64_t v217 = v75;
        uint64_t v147 = v165;
        v148 = v177;
        (*(void (**)(char *, char *, uint64_t *))(v165 + 32))(v177, v99, v72);
        (*(void (**)(char *, uint64_t, uint64_t))(v205 + 16))(v178, v208, AssociatedTypeWitness);
        (*(void (**)(char *, uint64_t, uint64_t))(v206 + 16))(v179, v210 + OBJC_IVAR____TtC15PlatformSSOCore15POCryptoKitHPKE_cipherSuite, v207);
        unint64_t v149 = v212;
        uint64_t v150 = (uint64_t)v211;
        if (v212 >> 60 == 15) {
          unint64_t v151 = 0;
        }
        else {
          unint64_t v151 = (unint64_t)v211;
        }
        unint64_t v216 = v151;
        unint64_t v152 = 0xC000000000000000;
        if (v212 >> 60 != 15) {
          unint64_t v152 = v212;
        }
        uint64_t v215 = v152;
        uint64_t v13 = (uint64_t *)v175;
        (*(void (**)(char *, char *, uint64_t *))(v147 + 16))(v175, v148, v72);
        (*(void (**)(char *, char *, uint64_t))(v84 + 16))(v174, v196, v83);
        sub_259E5EFB4(v191, v200);
        sub_259E5EFB4(v150, v149);
        v94 = v173;
        uint64_t v153 = v214;
        sub_259E99ED8();
        if (v153)
        {
          sub_259E5D850(v194, v195);
          (*(void (**)(char *, uint64_t *))(v147 + 8))(v177, v72);
          (*(void (**)(char *, uint64_t))(v166 + 8))(v196, v184);
          goto LABEL_53;
        }
        (*(void (**)(char *, uint64_t *))(v147 + 8))(v177, v72);
        (*(void (**)(char *, uint64_t))(v166 + 8))(v196, v184);
        uint64_t v89 = v222;
        goto LABEL_28;
      }
      sub_259E5D7F8(v191, v200);
      (*(void (**)(char *, uint64_t))(v98 + 8))(v99, v97);
    }
    uint64_t v13 = (uint64_t *)v182;
    (*(void (**)(char *, uint64_t, uint64_t))(v205 + 16))(v182, v208, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t, uint64_t))(v206 + 16))(v183, v210 + OBJC_IVAR____TtC15PlatformSSOCore15POCryptoKitHPKE_cipherSuite, v207);
    unint64_t v101 = v212;
    uint64_t v102 = (uint64_t)v211;
    if (v212 >> 60 == 15) {
      uint64_t v103 = 0;
    }
    else {
      uint64_t v103 = (uint64_t)v211;
    }
    uint64_t v217 = v103;
    unint64_t v104 = 0xC000000000000000;
    if (v212 >> 60 != 15) {
      unint64_t v104 = v212;
    }
    unint64_t v216 = v104;
    uint64_t v105 = v166;
    (*(void (**)(char *, char *, uint64_t))(v166 + 16))(v181, v196, v184);
    sub_259E5EFB4(v102, v101);
    swift_getAssociatedConformanceWitness();
    v94 = v180;
    uint64_t v106 = v214;
    sub_259E99EC8();
    uint64_t v89 = v222;
    if (v106)
    {
      sub_259E5D850(v194, v195);
      (*(void (**)(char *, uint64_t))(v105 + 8))(v196, v184);
LABEL_44:
      uint64_t v109 = v75;
LABEL_54:
      sub_259E5E234(v109, &qword_26A3F7040);
      return v13;
    }
    (*(void (**)(char *, uint64_t))(v105 + 8))(v196, v184);
    goto LABEL_39;
  }
  (*(void (**)(char *, uint64_t))(v84 + 8))(v85, v83);
  if (v73 == 1) {
    goto LABEL_13;
  }
LABEL_6:
  uint64_t v79 = v198;
  unint64_t v80 = v193;
  uint64_t v81 = v199;
  (*(void (**)(char *, uint64_t, uint64_t))(v198 + 16))(v193, v217, v199);
  if (v170(v80, 1, v72) == 1)
  {
    (*(void (**)(char *, uint64_t))(v79 + 8))(v80, v81);
    goto LABEL_13;
  }
  uint64_t v217 = v75;
  uint64_t v90 = v165;
  (*(void (**)(uint64_t, char *, uint64_t *))(v165 + 32))(v76, v80, v72);
  (*(void (**)(char *, uint64_t, uint64_t))(v205 + 16))(v189, v208, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v206 + 16))(v190, v210 + OBJC_IVAR____TtC15PlatformSSOCore15POCryptoKitHPKE_cipherSuite, v207);
  unint64_t v91 = v212;
  uint64_t v92 = (uint64_t)v211;
  if (v212 >> 60 == 15) {
    unint64_t v93 = 0;
  }
  else {
    unint64_t v93 = (unint64_t)v211;
  }
  unint64_t v216 = v93;
  uint64_t v13 = v72;
  (*(void (**)(char *, uint64_t, uint64_t *))(v90 + 16))(v188, v76, v72);
  sub_259E5EFB4(v92, v91);
  v94 = v187;
  uint64_t v95 = v214;
  sub_259E99EE8();
  uint64_t v89 = v222;
  if (v95)
  {
    sub_259E5D850(v194, v195);
    (*(void (**)(uint64_t, uint64_t *))(v90 + 8))(v215, v72);
LABEL_53:
    uint64_t v109 = v217;
    goto LABEL_54;
  }
  (*(void (**)(uint64_t, uint64_t *))(v90 + 8))(v215, v72);
LABEL_28:
  uint64_t v75 = v217;
LABEL_39:
  sub_259E5E234(v75, &qword_26A3F7040);
  uint64_t v86 = (uint64_t)v94;
  uint64_t v88 = v172;
LABEL_40:
  uint64_t v107 = (uint64_t)v192;
  v167(v86, 0, 1, v88);
  uint64_t v13 = &qword_26A3F7040;
  sub_259E5E290(v86, v75, &qword_26A3F7040);
  sub_259E65818(v75, v107, &qword_26A3F7040);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v89 + 48))(v107, 1, v88) == 1)
  {
    sub_259E5E234(v107, &qword_26A3F7040);
    if (qword_26A3F7F10 != -1) {
      swift_once();
    }
    uint64_t v108 = sub_259E99C48();
    __swift_project_value_buffer(v108, (uint64_t)qword_26A3F7F18);
    Logger.PSSO_ERROR(code:description:)(-1001);
    swift_willThrow();
    sub_259E5D850(v194, v195);
    goto LABEL_44;
  }
  uint64_t v217 = v75;
  (*(void (**)(char *, uint64_t, uint64_t))(v89 + 32))(v169, v107, v88);
  uint64_t v215 = sub_259E99F08();
  unint64_t v216 = v110;
  unint64_t v111 = v200;
  uint64_t v112 = MEMORY[0x263F8D310];
  if (v200 >> 60 != 15)
  {
    uint64_t v113 = v191;
    sub_259E5D7F8(v191, v200);
    id v114 = objc_msgSend(v171, sel_header);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F7048);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_259EA10C0;
    *(void *)(inited + 32) = 0x64695F6B7370;
    *(void *)(inited + 40) = 0xE600000000000000;
    uint64_t v116 = sub_259E99BD8();
    *(void *)(inited + 72) = v112;
    *(void *)(inited + 48) = v116;
    *(void *)(inited + 56) = v117;
    sub_259E63CBC(inited);
    v118 = (void *)sub_259E9A048();
    swift_bridgeObjectRelease();
    objc_msgSend(v114, sel_addCustomClaims_, v118);

    sub_259E5D8A8(v113, v111);
  }
  if (a10 >> 60 != 15)
  {
    sub_259E5D7F8(a9, a10);
    id v119 = objc_msgSend(v171, sel_header);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F7048);
    uint64_t v120 = swift_initStackObject();
    *(_OWORD *)(v120 + 16) = xmmword_259EA10C0;
    *(void *)(v120 + 32) = 0x64696B5F68747561;
    *(void *)(v120 + 40) = 0xE800000000000000;
    uint64_t v121 = sub_259E99BD8();
    *(void *)(v120 + 72) = v112;
    *(void *)(v120 + 48) = v121;
    *(void *)(v120 + 56) = v122;
    sub_259E63CBC(v120);
    v123 = (void *)sub_259E9A048();
    swift_bridgeObjectRelease();
    objc_msgSend(v119, sel_addCustomClaims_, v123);

    sub_259E5D8A8(a9, a10);
  }
  id v124 = v171;
  id v125 = objc_msgSend(v171, sel_header);
  id v126 = objc_msgSend(v125, sel_dataRepresentation);

  uint64_t v127 = sub_259E99BE8();
  uint64_t v13 = v128;

  Data.base64URLEncodedString()();
  v129 = v185;
  sub_259E9A0A8();
  uint64_t v130 = sub_259E9A078();
  unint64_t v132 = v131;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v186 + 8))(v129, v164);
  if (v132 >> 60 == 15)
  {
    if (qword_26A3F7F10 != -1) {
      swift_once();
    }
    uint64_t v133 = sub_259E99C48();
    __swift_project_value_buffer(v133, (uint64_t)qword_26A3F7F18);
    Logger.PSSO_ERROR(code:description:)(-1005);
    swift_willThrow();
    sub_259E5D850(v127, (unint64_t)v13);
    sub_259E5D850(v215, v216);
    sub_259E5D850(v194, v195);
    (*(void (**)(char *, uint64_t))(v222 + 8))(v169, v172);
    goto LABEL_53;
  }
  uint64_t v220 = v194;
  unint64_t v221 = v195;
  uint64_t v218 = v130;
  unint64_t v219 = v132;
  sub_259E60120();
  uint64_t v135 = sub_259E99F18();
  unint64_t v212 = v130;
  uint64_t v136 = v135;
  unint64_t v138 = v137;
  Data.base64URLEncodedString()();
  v139 = (void *)sub_259E9A058();
  swift_bridgeObjectRelease();
  objc_msgSend(v124, sel_setRawHeader_, v139);

  Data.base64URLEncodedString()();
  v140 = (void *)sub_259E9A058();
  swift_bridgeObjectRelease();
  objc_msgSend(v124, sel_setRawEncryptedKey_, v140);

  v141 = (void *)sub_259E9A058();
  objc_msgSend(v124, sel_setRawIV_, v141);

  uint64_t v214 = v136;
  unint64_t v213 = v138;
  Data.base64URLEncodedString()();
  v142 = v124;
  v143 = (void *)sub_259E9A058();
  swift_bridgeObjectRelease();
  objc_msgSend(v142, sel_setRawCipherText_, v143);

  v144 = (void *)sub_259E9A058();
  objc_msgSend(v142, sel_setRawAuthenticationTag_, v144);

  uint64_t v220 = 0;
  unint64_t v221 = 0xE000000000000000;
  id v145 = objc_msgSend(v142, sel_rawHeader);
  if (v145)
  {
    v146 = v145;
    sub_259E9A068();
  }
  sub_259E9A118();
  swift_bridgeObjectRelease();
  sub_259E9A118();
  id v154 = objc_msgSend(v171, sel_rawEncryptedKey);
  uint64_t v155 = v212;
  if (v154)
  {
    v156 = v154;
    sub_259E9A068();
  }
  sub_259E9A118();
  swift_bridgeObjectRelease();
  sub_259E9A118();
  id v157 = objc_msgSend(v171, sel_rawIV);
  if (v157)
  {
    v158 = v157;
    sub_259E9A068();
  }
  sub_259E9A118();
  swift_bridgeObjectRelease();
  sub_259E9A118();
  id v159 = objc_msgSend(v171, sel_rawCipherText);
  if (v159)
  {
    v160 = v159;
    sub_259E9A068();
  }
  sub_259E9A118();
  swift_bridgeObjectRelease();
  sub_259E9A118();
  id v161 = objc_msgSend(v171, sel_rawAuthenticationTag);
  if (v161)
  {
    v162 = v161;
    sub_259E9A068();
  }
  sub_259E9A118();
  swift_bridgeObjectRelease();
  sub_259E5D850(v214, v213);
  sub_259E5D8A8(v155, v132);
  sub_259E5D850(v127, (unint64_t)v13);
  sub_259E5D850(v215, v216);
  sub_259E5D850(v194, v195);
  uint64_t v13 = (uint64_t *)v220;
  (*(void (**)(char *, uint64_t))(v222 + 8))(v169, v172);
  sub_259E5E234(v217, &qword_26A3F7040);
  return v13;
}

unint64_t sub_259E63CBC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F7058);
  uint64_t v2 = sub_259E9A228();
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
    sub_259E65818(v6, (uint64_t)&v15, (uint64_t *)&unk_26A3F7060);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_259E657A0(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_259E6587C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t POCryptoKitHPKE.decodeAndDecryptJWT<A>(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10)
{
  unint64_t v211 = a8;
  unint64_t v187 = a7;
  uint64_t v180 = a6;
  uint64_t v194 = a5;
  uint64_t v200 = a3;
  unint64_t v201 = a4;
  uint64_t v196 = a2;
  uint64_t v11 = sub_259E99FA8();
  uint64_t v208 = *(void *)(v11 - 8);
  uint64_t v209 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v186 = (char *)&v159 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_259E99E88();
  uint64_t v197 = *(void *)(v13 - 8);
  uint64_t v198 = v13;
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  v193 = (char *)&v159 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v184 = (char *)&v159 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v179 = (char *)&v159 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v172 = (char *)&v159 - v21;
  uint64_t v195 = *(void *)(a9 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v192 = (char *)&v159 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v183 = (char *)&v159 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  v178 = (char *)&v159 - v27;
  MEMORY[0x270FA5388](v26);
  v175 = (char *)&v159 - v28;
  uint64_t v202 = a10;
  uint64_t v204 = a9;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v190 = sub_259E9A1B8();
  uint64_t v189 = *(void *)(v190 - 8);
  uint64_t v30 = MEMORY[0x270FA5388](v190);
  v188 = (char *)&v159 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  v174 = (char *)&v159 - v33;
  uint64_t v212 = AssociatedTypeWitness;
  uint64_t v206 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  v182 = (char *)&v159 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  uint64_t v207 = (char *)&v159 - v37;
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  id v171 = (char *)&v159 - v39;
  MEMORY[0x270FA5388](v38);
  v176 = (char *)&v159 - v40;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F6F18);
  MEMORY[0x270FA5388](v41 - 8);
  uint64_t v43 = (char *)&v159 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v205 = sub_259E99D08();
  uint64_t v210 = *(void *)(v205 - 8);
  uint64_t v44 = MEMORY[0x270FA5388](v205);
  v177 = (char *)&v159 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = MEMORY[0x270FA5388](v44);
  v170 = (char *)&v159 - v47;
  MEMORY[0x270FA5388](v46);
  uint64_t v191 = (char *)&v159 - v48;
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F7050);
  uint64_t v50 = MEMORY[0x270FA5388](v49 - 8);
  uint64_t v185 = (uint64_t)&v159 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = MEMORY[0x270FA5388](v50);
  uint64_t v54 = (char *)&v159 - v53;
  uint64_t v55 = MEMORY[0x270FA5388](v52);
  v181 = (char *)&v159 - v56;
  uint64_t v57 = MEMORY[0x270FA5388](v55);
  uint64_t v59 = (char *)&v159 - v58;
  uint64_t v60 = MEMORY[0x270FA5388](v57);
  v173 = (char *)&v159 - v61;
  MEMORY[0x270FA5388](v60);
  unint64_t v213 = (char *)&v159 - v62;
  uint64_t v63 = sub_259E9A0B8();
  uint64_t v64 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  unint64_t v66 = (char *)&v159 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v218 = a1;
  id v67 = objc_msgSend(a1, sel_rawHeader);
  if (v67)
  {
    id v68 = v67;
    sub_259E9A068();

    sub_259E9A0A8();
    uint64_t v69 = sub_259E9A078();
    unint64_t v71 = v70;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v64 + 8))(v66, v63);
    if (v71 >> 60 != 15)
    {
      id v74 = v218;
      id v75 = objc_msgSend(v218, sel_rawCipherText);
      if (!v75
        || (uint64_t v76 = v75,
            sub_259E9A068(),
            uint64_t v77 = v69,
            v76,
            uint64_t v78 = Data.init(base64URLEncoded:)(),
            v79 >> 60 == 15))
      {
        if (qword_26A3F7F10 != -1) {
          swift_once();
        }
        uint64_t v80 = sub_259E99C48();
        __swift_project_value_buffer(v80, (uint64_t)qword_26A3F7F18);
        Logger.PSSO_ERROR(code:description:)(-1005);
        swift_willThrow();
        goto LABEL_21;
      }
      unint64_t v81 = v79;
      uint64_t v169 = v78;
      id v82 = objc_msgSend(v74, sel_rawEncryptedKey);
      if (!v82
        || (uint64_t v83 = v82,
            sub_259E9A068(),
            unint64_t v168 = v81,
            v83,
            unint64_t v81 = v168,
            uint64_t v84 = Data.init(base64URLEncoded:)(),
            v85 >> 60 == 15))
      {
        if (qword_26A3F7F10 != -1) {
          swift_once();
        }
        uint64_t v86 = sub_259E99C48();
        __swift_project_value_buffer(v86, (uint64_t)qword_26A3F7F18);
        Logger.PSSO_ERROR(code:description:)(-1005);
        swift_willThrow();
        goto LABEL_20;
      }
      uint64_t v166 = v84;
      unint64_t v167 = v85;
      id v87 = objc_msgSend(v74, sel_rawIV);
      if (!v87
        || (uint64_t v88 = v87,
            sub_259E9A068(),
            v88,
            unint64_t v81 = v168,
            uint64_t v89 = sub_259E9A0E8(),
            swift_bridgeObjectRelease(),
            v89))
      {
        if (qword_26A3F7F10 == -1)
        {
LABEL_19:
          uint64_t v90 = sub_259E99C48();
          __swift_project_value_buffer(v90, (uint64_t)qword_26A3F7F18);
          Logger.PSSO_ERROR(code:description:)(-1005);
          swift_willThrow();
          sub_259E5D8A8(v166, v167);
LABEL_20:
          sub_259E5D8A8(v169, v81);
LABEL_21:
          uint64_t v91 = v69;
          unint64_t v92 = v71;
          return sub_259E5D8A8(v91, v92);
        }
LABEL_74:
        swift_once();
        goto LABEL_19;
      }
      id v93 = objc_msgSend(v74, sel_rawAuthenticationTag);
      if (!v93
        || (v94 = v93,
            sub_259E9A068(),
            v94,
            unint64_t v81 = v168,
            uint64_t v95 = sub_259E9A0E8(),
            swift_bridgeObjectRelease(),
            v95))
      {
        if (qword_26A3F7F10 == -1) {
          goto LABEL_19;
        }
        goto LABEL_74;
      }
      unint64_t v165 = v71;
      uint64_t v96 = v194;
      uint64_t v97 = v205;
      v162 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v210 + 48);
      int v98 = v162(v194, 1, v205);
      v99 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v206 + 48);
      uint64_t v164 = v206 + 48;
      uint64_t v163 = v99;
      unsigned int v100 = v99((char *)v211, 1, v212);
      unint64_t v101 = *(void (**)(char *, void, uint64_t, uint64_t))(v208 + 56);
      uint64_t v161 = v208 + 56;
      v160 = v101;
      v101(v213, 1, 1, v209);
      BOOL v102 = v98 == 1;
      uint64_t v103 = v207;
      if (!v102)
      {
        sub_259E65818(v96, (uint64_t)v43, &qword_26A3F6F18);
        if (v162((uint64_t)v43, 1, v97) == 1)
        {
          sub_259E5E234((uint64_t)v43, &qword_26A3F6F18);
        }
        else
        {
          uint64_t v104 = v210;
          uint64_t v105 = v191;
          (*(void (**)(char *, char *, uint64_t))(v210 + 32))(v191, v43, v97);
          if (v187 >> 60 != 15)
          {
            if (v100 == 1)
            {
              sub_259E5D7F8(v180, v187);
            }
            else
            {
              uint64_t v123 = v189;
              id v124 = v174;
              uint64_t v125 = v190;
              (*(void (**)(char *, unint64_t, uint64_t))(v189 + 16))(v174, v211, v190);
              uint64_t v126 = v212;
              if (v163(v124, 1, v212) != 1)
              {
                uint64_t v152 = v206;
                uint64_t v153 = v176;
                (*(void (**)(char *, char *, uint64_t))(v206 + 32))(v176, v124, v126);
                (*(void (**)(char *, uint64_t, uint64_t))(v195 + 16))(v175, v196, v204);
                (*(void (**)(char *, uint64_t, uint64_t))(v197 + 16))(v172, v199 + OBJC_IVAR____TtC15PlatformSSOCore15POCryptoKitHPKE_cipherSuite, v198);
                uint64_t v155 = v200;
                unint64_t v154 = v201;
                if (v201 >> 60 == 15) {
                  uint64_t v156 = 0;
                }
                else {
                  uint64_t v156 = v200;
                }
                unint64_t v211 = v156;
                unint64_t v157 = 0xC000000000000000;
                if (v201 >> 60 != 15) {
                  unint64_t v157 = v201;
                }
                uint64_t v207 = (char *)v157;
                (*(void (**)(char *, char *, uint64_t))(v152 + 16))(v171, v153, v126);
                (*(void (**)(char *, char *, uint64_t))(v210 + 16))(v170, v191, v205);
                sub_259E5EFB4(v180, v187);
                sub_259E5EFB4(v155, v154);
                sub_259E5EFB4(v166, v167);
                uint64_t v158 = v203;
                sub_259E99F58();
                uint64_t v113 = v158;
                if (v158)
                {
                  sub_259E5D8A8(v169, v168);
                  sub_259E5D8A8(v77, v165);
                  sub_259E5D8A8(v166, v167);
                  (*(void (**)(char *, uint64_t))(v206 + 8))(v176, v212);
                  (*(void (**)(char *, uint64_t))(v210 + 8))(v191, v205);
                  return sub_259E5E234((uint64_t)v213, &qword_26A3F7050);
                }
                (*(void (**)(char *, uint64_t))(v206 + 8))(v176, v212);
                (*(void (**)(char *, uint64_t))(v210 + 8))(v191, v205);
                unint64_t v135 = v165;
                uint64_t v54 = v173;
                goto LABEL_58;
              }
              sub_259E5D7F8(v180, v187);
              (*(void (**)(char *, uint64_t))(v123 + 8))(v124, v125);
            }
            (*(void (**)(char *, uint64_t, uint64_t))(v195 + 16))(v178, v196, v204);
            (*(void (**)(char *, uint64_t, uint64_t))(v197 + 16))(v179, v199 + OBJC_IVAR____TtC15PlatformSSOCore15POCryptoKitHPKE_cipherSuite, v198);
            uint64_t v128 = v200;
            unint64_t v127 = v201;
            if (v201 >> 60 == 15) {
              uint64_t v129 = 0;
            }
            else {
              uint64_t v129 = v200;
            }
            unint64_t v130 = 0xC000000000000000;
            if (v201 >> 60 != 15) {
              unint64_t v130 = v201;
            }
            unint64_t v211 = v130;
            uint64_t v212 = v129;
            uint64_t v131 = v210;
            (*(void (**)(char *, char *, uint64_t))(v210 + 16))(v177, v191, v205);
            sub_259E5EFB4(v128, v127);
            uint64_t v132 = v166;
            unint64_t v133 = v167;
            sub_259E5EFB4(v166, v167);
            uint64_t v134 = v203;
            sub_259E99F48();
            uint64_t v113 = v134;
            if (v134)
            {
              sub_259E5D8A8(v169, v168);
              sub_259E5D8A8(v77, v165);
              sub_259E5D8A8(v132, v133);
              (*(void (**)(char *, uint64_t))(v131 + 8))(v191, v205);
              return sub_259E5E234((uint64_t)v213, &qword_26A3F7050);
            }
            (*(void (**)(char *, uint64_t))(v131 + 8))(v191, v205);
            uint64_t v54 = v59;
            goto LABEL_57;
          }
          (*(void (**)(char *, uint64_t))(v104 + 8))(v105, v97);
          uint64_t v103 = v207;
        }
      }
      uint64_t v210 = v77;
      if (v100 != 1)
      {
        uint64_t v106 = v189;
        uint64_t v107 = v188;
        uint64_t v108 = v190;
        (*(void (**)(char *, unint64_t, uint64_t))(v189 + 16))(v188, v211, v190);
        uint64_t v109 = v212;
        if (v163(v107, 1, v212) != 1)
        {
          uint64_t v114 = v206;
          (*(void (**)(char *, char *, uint64_t))(v206 + 32))(v103, v107, v109);
          (*(void (**)(char *, uint64_t, uint64_t))(v195 + 16))(v183, v196, v204);
          (*(void (**)(char *, uint64_t, uint64_t))(v197 + 16))(v184, v199 + OBJC_IVAR____TtC15PlatformSSOCore15POCryptoKitHPKE_cipherSuite, v198);
          uint64_t v116 = v200;
          unint64_t v115 = v201;
          if (v201 >> 60 == 15) {
            uint64_t v117 = 0;
          }
          else {
            uint64_t v117 = v200;
          }
          unint64_t v211 = v117;
          unint64_t v118 = 0xC000000000000000;
          if (v201 >> 60 != 15) {
            unint64_t v118 = v201;
          }
          uint64_t v205 = v118;
          (*(void (**)(char *, char *, uint64_t))(v114 + 16))(v182, v103, v109);
          sub_259E5EFB4(v116, v115);
          uint64_t v119 = v166;
          unint64_t v120 = v167;
          sub_259E5EFB4(v166, v167);
          uint64_t v121 = v181;
          uint64_t v122 = v203;
          sub_259E99F68();
          uint64_t v113 = v122;
          if (v122)
          {
            sub_259E5D8A8(v169, v168);
            sub_259E5D8A8(v210, v165);
            sub_259E5D8A8(v119, v120);
            (*(void (**)(char *, uint64_t))(v114 + 8))(v207, v212);
            return sub_259E5E234((uint64_t)v213, &qword_26A3F7050);
          }
          (*(void (**)(char *, uint64_t))(v114 + 8))(v207, v212);
          uint64_t v54 = v121;
          goto LABEL_57;
        }
        (*(void (**)(char *, uint64_t))(v106 + 8))(v107, v108);
      }
      (*(void (**)(char *, uint64_t, uint64_t))(v195 + 16))(v192, v196, v204);
      (*(void (**)(char *, uint64_t, uint64_t))(v197 + 16))(v193, v199 + OBJC_IVAR____TtC15PlatformSSOCore15POCryptoKitHPKE_cipherSuite, v198);
      sub_259E5EFB4(v200, v201);
      uint64_t v110 = v166;
      unint64_t v111 = v167;
      sub_259E5EFB4(v166, v167);
      uint64_t v112 = v203;
      sub_259E99F78();
      uint64_t v113 = v112;
      if (v112)
      {
        sub_259E5E234((uint64_t)v213, &qword_26A3F7050);
        sub_259E5D8A8(v110, v111);
        sub_259E5D8A8(v169, v168);
        uint64_t v91 = v210;
        unint64_t v92 = v165;
        return sub_259E5D8A8(v91, v92);
      }
LABEL_57:
      unint64_t v135 = v165;
LABEL_58:
      uint64_t v136 = (uint64_t)v213;
      sub_259E5E234((uint64_t)v213, &qword_26A3F7050);
      uint64_t v137 = v209;
      v160(v54, 0, 1, v209);
      sub_259E5E290((uint64_t)v54, v136, &qword_26A3F7050);
      uint64_t v138 = v136;
      uint64_t v139 = v185;
      sub_259E65818(v138, v185, &qword_26A3F7050);
      uint64_t v140 = v208;
      int v141 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v208 + 48))(v139, 1, v137);
      v142 = v186;
      if (v141 == 1)
      {
        sub_259E5E234(v139, &qword_26A3F7050);
        unint64_t v143 = v168;
        if (qword_26A3F7F10 != -1) {
          swift_once();
        }
        uint64_t v144 = sub_259E99C48();
        __swift_project_value_buffer(v144, (uint64_t)qword_26A3F7F18);
        Logger.PSSO_ERROR(code:description:)(-1001);
        swift_willThrow();
        sub_259E5D8A8(v169, v143);
        sub_259E5D8A8(v77, v135);
        sub_259E5D8A8(v166, v167);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v140 + 32))(v186, v139, v137);
        unint64_t v145 = v168;
        uint64_t v216 = v169;
        unint64_t v217 = v168;
        uint64_t v214 = v77;
        unint64_t v215 = v135;
        sub_259E60120();
        uint64_t v146 = sub_259E99F88();
        if (v113)
        {
          sub_259E5D8A8(v166, v167);
          (*(void (**)(char *, uint64_t))(v140 + 8))(v142, v137);
          sub_259E5E234((uint64_t)v213, &qword_26A3F7050);
          sub_259E5D8A8(v77, v135);
          uint64_t v91 = v169;
          unint64_t v92 = v145;
          return sub_259E5D8A8(v91, v92);
        }
        uint64_t v148 = v146;
        unint64_t v149 = v147;
        Data.base64URLEncodedString()();
        uint64_t v150 = (void *)sub_259E9A058();
        swift_bridgeObjectRelease();
        id v151 = v218;
        objc_msgSend(v218, sel_setRawBody_, v150);

        objc_msgSend(v151, sel_updateDecodedBody);
        sub_259E5D850(v148, v149);
        sub_259E5D8A8(v169, v168);
        sub_259E5D8A8(v77, v165);
        sub_259E5D8A8(v166, v167);
        (*(void (**)(char *, uint64_t))(v140 + 8))(v142, v137);
      }
      return sub_259E5E234((uint64_t)v213, &qword_26A3F7050);
    }
  }
  if (qword_26A3F7F10 != -1) {
    swift_once();
  }
  uint64_t v72 = sub_259E99C48();
  __swift_project_value_buffer(v72, (uint64_t)qword_26A3F7F18);
  Logger.PSSO_ERROR(code:description:)(-1005);
  return swift_willThrow();
}

id POCryptoKitHPKE.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void POCryptoKitHPKE.init()()
{
}

id POCryptoKitHPKE.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for POCryptoKitHPKE();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_259E65708()
{
  return type metadata accessor for POCryptoKitHPKE();
}

uint64_t sub_259E65710()
{
  uint64_t result = sub_259E99E88();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_259E657A0(uint64_t a1, uint64_t a2)
{
  sub_259E9A258();
  sub_259E9A0D8();
  uint64_t v4 = sub_259E9A268();
  return sub_259E6588C(a1, a2, v4);
}

uint64_t sub_259E65818(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_259E6587C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_259E6588C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_259E9A248() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_259E9A248() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_259E65970()
{
  uint64_t v0 = sub_259E99C48();
  __swift_allocate_value_buffer(v0, qword_26A3F7F48);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A3F7F48);
  return sub_259E99C38();
}

void *variable initialization expression of POCryptoKitHPKE_P256_SHA256_AES_GCM_128.encryptionAlgorithm()
{
  return &unk_2707DBBB0;
}

id POCryptoKitHPKE_P256_SHA256_AES_GCM_128.encryptionAlgorithm.getter()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128_encryptionAlgorithm));
}

id POCryptoKitHPKE_P256_SHA256_AES_GCM_128.__allocating_init()()
{
  unint64_t v1 = v0;
  uint64_t v19 = sub_259E99EB8();
  uint64_t v2 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_259E99E98();
  uint64_t v5 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_259E99EA8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  BOOL v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_259E99E88();
  MEMORY[0x270FA5388](v12 - 8);
  BOOL v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (char *)objc_allocWithZone(v1);
  *(void *)&v15[OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128_encryptionAlgorithm] = 0x2707DBBB0;
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F04720], v8);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F04710], v18);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F04728], v19);
  id v16 = &unk_2707DBBB0;
  sub_259E99E78();
  return POCryptoKitHPKE.init(cipherSuite:)((uint64_t)v14);
}

id POCryptoKitHPKE_P256_SHA256_AES_GCM_128.init()()
{
  uint64_t v17 = sub_259E99EB8();
  uint64_t v1 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_259E99E98();
  uint64_t v4 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_259E99EA8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_259E99E88();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v0 + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128_encryptionAlgorithm) = 0x2707DBBB0;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F04720], v7);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F04710], v16);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F04728], v17);
  id v14 = &unk_2707DBBB0;
  sub_259E99E78();
  return POCryptoKitHPKE.init(cipherSuite:)((uint64_t)v13);
}

Swift::Void __swiftcall POCryptoKitHPKE_P256_SHA256_AES_GCM_128.addValues(to:)(POMutableJWTHeader to)
{
  Class isa = to.super.super.isa;
  uint64_t v2 = (void *)sub_259E9A058();
  [(objc_class *)isa setEnc:v2];

  id v3 = (id)sub_259E9A058();
  [(objc_class *)isa setAlg:v3];
}

Swift::String __swiftcall POCryptoKitHPKE_P256_SHA256_AES_GCM_128.algValue()()
{
  uint64_t v0 = (void *)0x8000000259EA9D80;
  uint64_t v1 = 0xD000000000000018;
  result._object = v0;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t POCryptoKitHPKE_P256_SHA256_AES_GCM_128.decodeAndDecryptJWT(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, void *a9)
{
  uint64_t v83 = a4;
  unint64_t v81 = a1;
  uint64_t v82 = a7;
  uint64_t v79 = a3;
  unint64_t v85 = a2;
  uint64_t v80 = sub_259E99FF8();
  uint64_t v72 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  uint64_t v84 = (char *)&v71 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_259E9A0B8();
  uint64_t v77 = *(void *)(v13 - 8);
  uint64_t v78 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v76 = (char *)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_259E99D88();
  uint64_t v74 = *(void *)(v15 - 8);
  uint64_t v75 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v86 = (char *)&v71 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A3F7070);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v20 = (char *)&v71 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v87 = (uint64_t)&v71 - v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F6F18);
  uint64_t v23 = MEMORY[0x270FA5388](v22 - 8);
  uint64_t v25 = (char *)&v71 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v71 - v26;
  uint64_t v28 = sub_259E99D08();
  uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56);
  uint64_t v91 = v27;
  v29(v27, 1, 1, v28);
  if (a6 >> 60 == 15) {
    goto LABEL_6;
  }
  uint64_t v89 = a5;
  unint64_t v90 = a6;
  sub_259E5D7F8(a5, a6);
  sub_259E99CE8();
  uint64_t v30 = (uint64_t)v91;
  sub_259E5E234((uint64_t)v91, &qword_26A3F6F18);
  v29(v25, 0, 1, v28);
  sub_259E5E290((uint64_t)v25, v30, &qword_26A3F6F18);
  if (a8 >> 60 != 15)
  {
LABEL_6:
    unint64_t v73 = a8;
    uint64_t v33 = sub_259E99FC8();
    uint64_t v34 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56);
    uint64_t v35 = v87;
    v34(v87, 1, 1, v33);
    if (a9)
    {
      uint64_t v36 = a9;
      CFDataRef v37 = SecKeyCopyExternalRepresentation(v36, 0);
      if (v37)
      {
        CFDataRef v38 = v37;
        uint64_t v39 = sub_259E99BE8();
        unint64_t v41 = v40;

        uint64_t v89 = v39;
        unint64_t v90 = v41;
        sub_259E5D7F8(v39, v41);
        uint64_t v42 = v88;
        sub_259E99FB8();
        uint64_t v88 = v42;
        if (v42)
        {

          sub_259E5D850(v39, v41);
          sub_259E5E234(v87, (uint64_t *)&unk_26A3F7070);
          return sub_259E5E234((uint64_t)v91, &qword_26A3F6F18);
        }
        uint64_t v44 = v87;
        sub_259E5E234(v87, (uint64_t *)&unk_26A3F7070);

        unint64_t v45 = v41;
        uint64_t v35 = v44;
        sub_259E5D850(v39, v45);
        v34((uint64_t)v20, 0, 1, v33);
        sub_259E5E290((uint64_t)v20, v44, (uint64_t *)&unk_26A3F7070);
      }
      else
      {
      }
    }
    uint64_t v46 = self;
    uint64_t v47 = v85;
    unsigned int v48 = objc_msgSend(v46, sel_isSEPKey_, v85);
    uint64_t v49 = v88;
    uint64_t v50 = (uint64_t)v91;
    uint64_t v51 = (uint64_t)v86;
    if (v48)
    {
      id v52 = v47;
      sub_259E99D78();
      unint64_t v53 = v73;
      if (!v49)
      {
        if (v83)
        {
          uint64_t v54 = v76;
          sub_259E9A098();
          uint64_t v55 = sub_259E9A078();
          unint64_t v57 = v56;
          (*(void (**)(char *, uint64_t))(v77 + 8))(v54, v78);
        }
        else
        {
          uint64_t v55 = 0;
          unint64_t v57 = 0xF000000000000000;
        }
        uint64_t v70 = v75;
        POCryptoKitHPKE.decodeAndDecryptJWT<A>(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(v81, v51, v55, v57, v50, v82, v53, v35, v75, MEMORY[0x263F04678]);
        sub_259E5D8A8(v55, v57);
        (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v51, v70);
      }
    }
    else
    {
      CFDataRef v58 = SecKeyCopyExternalRepresentation((SecKeyRef)v47, 0);
      if (v58)
      {
        CFDataRef v59 = v58;
        uint64_t v60 = sub_259E99BE8();
        unint64_t v62 = v61;

        uint64_t v89 = v60;
        unint64_t v90 = v62;
        sub_259E5D7F8(v60, v62);
        uint64_t v63 = (uint64_t)v84;
        sub_259E99FE8();
        if (v49)
        {
          sub_259E5D850(v60, v62);
        }
        else
        {
          if (v83)
          {
            uint64_t v65 = v76;
            sub_259E9A098();
            uint64_t v66 = sub_259E9A078();
            id v67 = v65;
            unint64_t v69 = v68;
            (*(void (**)(char *, uint64_t))(v77 + 8))(v67, v78);
          }
          else
          {
            uint64_t v66 = 0;
            unint64_t v69 = 0xF000000000000000;
          }
          POCryptoKitHPKE.decodeAndDecryptJWT<A>(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(v81, v63, v66, v69, v50, v82, v73, v35, v80, MEMORY[0x263F04790]);
          sub_259E5D8A8(v66, v69);
          sub_259E5D850(v60, v62);
          (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v63, v80);
        }
      }
      else
      {
        if (qword_26A3F7F40 != -1) {
          swift_once();
        }
        uint64_t v64 = sub_259E99C48();
        __swift_project_value_buffer(v64, (uint64_t)qword_26A3F7F48);
        Logger.PSSO_ERROR(code:description:)(-1005);
        swift_willThrow();
      }
    }
    sub_259E5E234(v35, (uint64_t *)&unk_26A3F7070);
    uint64_t v32 = v50;
  }
  else
  {
    if (qword_26A3F7F40 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_259E99C48();
    __swift_project_value_buffer(v31, (uint64_t)qword_26A3F7F48);
    Logger.PSSO_ERROR(code:description:)(-1005);
    swift_willThrow();
    uint64_t v32 = (uint64_t)v91;
  }
  return sub_259E5E234(v32, &qword_26A3F6F18);
}

void *POCryptoKitHPKE_P256_SHA256_AES_GCM_128.encodeAndEncryptJWT(_:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:)(void *a1, __SecKey *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, void *a9, uint64_t a10, uint64_t a11)
{
  uint64_t v83 = a1;
  uint64_t v79 = a7;
  uint64_t v78 = a4;
  uint64_t v73 = a3;
  SecKeyRef v81 = a2;
  uint64_t v14 = sub_259E9A0B8();
  uint64_t v74 = *(void *)(v14 - 8);
  uint64_t v75 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v72 = (char *)&v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_259E99FC8();
  uint64_t v76 = *(void *)(v16 - 8);
  uint64_t v77 = v16;
  MEMORY[0x270FA5388](v16);
  uint64_t v82 = (char *)&v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F7080);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v21 = (char *)&v70 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v85 = (uint64_t)&v70 - v22;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F6F18);
  uint64_t v24 = MEMORY[0x270FA5388](v23 - 8);
  uint64_t v26 = (char *)&v70 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v70 - v27;
  uint64_t v29 = sub_259E99D08();
  uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56);
  unint64_t v88 = (unint64_t)v28;
  v30(v28, 1, 1, v29);
  if (a6 >> 60 != 15)
  {
    uint64_t v86 = a5;
    unint64_t v87 = a6;
    sub_259E5D7F8(a5, a6);
    sub_259E99CE8();
    uint64_t v31 = v88;
    sub_259E5E234(v88, &qword_26A3F6F18);
    v30(v26, 0, 1, v29);
    sub_259E5E290((uint64_t)v26, v31, &qword_26A3F6F18);
    if (a8 >> 60 == 15)
    {
      if (qword_26A3F7F40 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_259E99C48();
      uint64_t v33 = (void *)__swift_project_value_buffer(v32, (uint64_t)qword_26A3F7F48);
      Logger.PSSO_ERROR(code:description:)(-1005);
      swift_willThrow();
      goto LABEL_10;
    }
  }
  unint64_t v80 = a8;
  uint64_t v34 = (uint64_t *)sub_259E99FF8();
  uint64_t v35 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(*(v34 - 1) + 56);
  uint64_t v36 = v85;
  v35(v85, 1, 1, v34);
  if (a9)
  {
    uint64_t v37 = v84;
    CFDataRef v38 = a9;
    CFDataRef v39 = SecKeyCopyExternalRepresentation(v38, 0);
    if (v39)
    {
      CFDataRef v40 = v39;
      uint64_t v33 = (void *)sub_259E99BE8();
      unint64_t v42 = v41;

      uint64_t v86 = (uint64_t)v33;
      unint64_t v87 = v42;
      sub_259E5D7F8((uint64_t)v33, v42);
      sub_259E99FE8();
      if (v37)
      {

        sub_259E5D850((uint64_t)v33, v42);
        sub_259E5E234(v85, &qword_26A3F7080);
LABEL_10:
        uint64_t v43 = v88;
LABEL_21:
        sub_259E5E234(v43, &qword_26A3F6F18);
        return v33;
      }
      unint64_t v45 = v34;
      uint64_t v46 = v85;
      sub_259E5E234(v85, &qword_26A3F7080);

      unint64_t v47 = v42;
      uint64_t v36 = v46;
      sub_259E5D850((uint64_t)v33, v47);
      uint64_t v71 = v45;
      v35((uint64_t)v21, 0, 1, v45);
      uint64_t v44 = 0;
      sub_259E5E290((uint64_t)v21, v46, &qword_26A3F7080);
    }
    else
    {
      uint64_t v71 = v34;

      uint64_t v44 = v37;
    }
  }
  else
  {
    uint64_t v71 = v34;
    uint64_t v44 = v84;
  }
  id v48 = objc_msgSend(v83, sel_header);
  uint64_t v49 = (void *)sub_259E9A058();
  objc_msgSend(v48, sel_setEnc_, v49);

  uint64_t v50 = (void *)sub_259E9A058();
  objc_msgSend(v48, sel_setAlg_, v50);

  CFDataRef v51 = SecKeyCopyExternalRepresentation(v81, 0);
  unint64_t v52 = v88;
  unint64_t v53 = v80;
  uint64_t v54 = (uint64_t)v82;
  if (!v51)
  {
    if (qword_26A3F7F40 != -1) {
      swift_once();
    }
    uint64_t v58 = sub_259E99C48();
    uint64_t v33 = (void *)__swift_project_value_buffer(v58, (uint64_t)qword_26A3F7F48);
    Logger.PSSO_ERROR(code:description:)(-1005);
    swift_willThrow();
    goto LABEL_20;
  }
  uint64_t v33 = v51;
  uint64_t v55 = sub_259E99BE8();
  unint64_t v57 = v56;

  uint64_t v86 = v55;
  unint64_t v87 = v57;
  sub_259E5D7F8(v55, v57);
  sub_259E99FB8();
  if (v44)
  {
    sub_259E5D850(v55, v57);
LABEL_20:
    sub_259E5E234(v36, &qword_26A3F7080);
    uint64_t v43 = v52;
    goto LABEL_21;
  }
  uint64_t v61 = a10;
  unint64_t v60 = a11;
  if (v78)
  {
    unint64_t v62 = v72;
    uint64_t v84 = a10;
    uint64_t v85 = a11;
    sub_259E9A098();
    uint64_t v63 = sub_259E9A078();
    unint64_t v65 = v64;
    (*(void (**)(char *, uint64_t))(v74 + 8))(v62, v75);
    uint64_t v61 = v84;
    unint64_t v60 = v85;
  }
  else
  {
    uint64_t v63 = 0;
    unint64_t v65 = 0xF000000000000000;
  }
  uint64_t v85 = v63;
  uint64_t v66 = v63;
  unint64_t v67 = v65;
  unint64_t v68 = v65;
  uint64_t v69 = v88;
  uint64_t v33 = POCryptoKitHPKE.encodeAndEncryptJWT<A>(_:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:)(v83, v54, v66, v68, v88, v79, v53, v36, v61, v60, v71, MEMORY[0x263F04790]);
  sub_259E5D8A8(v85, v67);
  sub_259E5D850(v55, v57);
  (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v54, v77);
  sub_259E5E234(v36, &qword_26A3F7080);
  sub_259E5E234(v69, &qword_26A3F6F18);
  return v33;
}

void POCryptoKitHPKE_P256_SHA256_AES_GCM_128.__allocating_init(cipherSuite:)()
{
}

void POCryptoKitHPKE_P256_SHA256_AES_GCM_128.init(cipherSuite:)()
{
}

void sub_259E6781C()
{
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128_encryptionAlgorithm));
}

id POCryptoKitHPKE_P256_SHA256_AES_GCM_128.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_259E67874()
{
  return type metadata accessor for POCryptoKitHPKE_P256_SHA256_AES_GCM_128();
}

uint64_t type metadata accessor for POCryptoKitHPKE_P256_SHA256_AES_GCM_128()
{
  uint64_t result = qword_26A3F7F60;
  if (!qword_26A3F7F60) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_259E678C8()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_259E6790C()
{
  uint64_t v0 = sub_259E99C48();
  __swift_allocate_value_buffer(v0, qword_26A3F8178);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A3F8178);
  return sub_259E99C38();
}

void *sub_259E67988()
{
  qword_26A3F86A0 = 0x2707DBB68;
  return &unk_2707DBB68;
}

uint64_t *sub_259E679A0()
{
  if (qword_26A3F8190 != -1) {
    swift_once();
  }
  return &qword_26A3F86A0;
}

id sub_259E679EC()
{
  if (qword_26A3F8190 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26A3F86A0;
  return v0;
}

uint64_t sub_259E67AA4()
{
  uint64_t v0 = sub_259E99E88();
  __swift_allocate_value_buffer(v0, qword_26A3F86A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A3F86A8);
  return sub_259E99E48();
}

uint64_t sub_259E67AF0()
{
  if (qword_26A3F8198 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_259E99E88();
  return __swift_project_value_buffer(v0, (uint64_t)qword_26A3F86A8);
}

uint64_t sub_259E67B54@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A3F8198 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_259E99E88();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A3F86A8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t variable initialization expression of POUserUnlockKeySwift.encryptedKeyData()
{
  return 0;
}

uint64_t POUserUnlockKeySwift.encryptedKeyData.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC15PlatformSSOCore20POUserUnlockKeySwift_encryptedKeyData);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_259E67D68(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC15PlatformSSOCore20POUserUnlockKeySwift_encryptedKeyData);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_259E67DC8@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x60))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_259E67E24(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR____TtC15PlatformSSOCore20POUserUnlockKeySwift_encryptedKeyData);
  swift_beginAccess();
  *uint64_t v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t variable initialization expression of POUserUnlockKeySwift.keyData()
{
  return 0;
}

uint64_t POUserUnlockKeySwift.keyData.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15PlatformSSOCore20POUserUnlockKeySwift_keyData;
  swift_beginAccess();
  uint64_t v2 = *(void *)v1;
  sub_259E5EFB4(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t sub_259E6802C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC15PlatformSSOCore20POUserUnlockKeySwift_keyData);
  swift_beginAccess();
  uint64_t v6 = *v5;
  unint64_t v7 = v5[1];
  *uint64_t v5 = a1;
  v5[1] = a2;
  return sub_259E5D8A8(v6, v7);
}

uint64_t sub_259E6808C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x78))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_259E680E8(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = (uint64_t *)(*a2 + OBJC_IVAR____TtC15PlatformSSOCore20POUserUnlockKeySwift_keyData);
  swift_beginAccess();
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  *uint64_t v4 = v2;
  v4[1] = v3;
  sub_259E5EFB4(v2, v3);
  return sub_259E5D8A8(v5, v6);
}

char *static POUserUnlockKeySwift.unlockKey(encryptedKey:privateKey:)(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_259E68404(a1, a2, a3);
}

__SecKey *static POUserUnlockKeySwift.createUnlockKey(publicKey:)(__SecKey *a1)
{
  return sub_259E689F0(a1);
}

id POUserUnlockKeySwift.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for POUserUnlockKeySwift();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

char *sub_259E68404(uint64_t a1, uint64_t a2, void *a3)
{
  id v48 = a3;
  uint64_t v3 = sub_259E99E88();
  uint64_t v46 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_259E99FA8();
  uint64_t v45 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v47 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_259E99D88();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v37 - v13;
  swift_bridgeObjectRetain();
  uint64_t v15 = Data.init(base64URLEncoded:)();
  if (v16 >> 60 == 15) {
    goto LABEL_8;
  }
  uint64_t v17 = v15;
  unint64_t v18 = v16;
  uint64_t v42 = v8;
  uint64_t v43 = v9;
  id v19 = objc_allocWithZone((Class)POWrappedTokenJWTBody);
  uint64_t v20 = (void *)sub_259E99BC8();
  id v21 = objc_msgSend(v19, sel_initWithJWTData_, v20);

  if (!v21)
  {
LABEL_7:
    sub_259E5D8A8(v17, v18);
LABEL_8:
    if (qword_26A3F8170 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_259E99C48();
    __swift_project_value_buffer(v30, (uint64_t)qword_26A3F8178);
    Logger.PSSO_ERROR(code:description:)(-1005);
    swift_willThrow();
    return v12;
  }
  uint64_t v44 = v17;
  uint64_t v41 = v6;
  id v22 = objc_msgSend(v21, sel_encapsulatedKey);
  sub_259E9A068();

  uint64_t v23 = sub_259E99B88();
  unint64_t v25 = v24;
  swift_bridgeObjectRelease();
  if (v25 >> 60 == 15)
  {
LABEL_6:

    uint64_t v17 = v44;
    goto LABEL_7;
  }
  uint64_t v39 = v23;
  unint64_t v40 = v25;
  id v26 = objc_msgSend(v21, sel_cipherText);
  sub_259E9A068();

  uint64_t v27 = sub_259E99B88();
  unint64_t v29 = v28;
  swift_bridgeObjectRelease();
  if (v29 >> 60 == 15)
  {
    sub_259E5D8A8(v39, v40);
    goto LABEL_6;
  }
  uint64_t v38 = v27;
  id v32 = v48;
  unint64_t v33 = v51;
  sub_259E99D68();
  if (v33)
  {
    sub_259E5D8A8(v38, v29);
    sub_259E5D8A8(v39, v40);

    sub_259E5D8A8(v44, v18);
  }
  else
  {
    unint64_t v51 = v29;
    (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v12, v14, v42);
    if (qword_26A3F8198 != -1) {
      swift_once();
    }
    uint64_t v34 = __swift_project_value_buffer(v3, (uint64_t)qword_26A3F86A8);
    (*(void (**)(char *, uint64_t, uint64_t))(v46 + 16))(v5, v34, v3);
    sub_259E5D7F8(v39, v40);
    sub_259E99F78();
    uint64_t v35 = v38;
    unint64_t v36 = v51;
    uint64_t v49 = v38;
    unint64_t v50 = v51;
    sub_259E60120();
    uint64_t v12 = (char *)sub_259E99F98();

    sub_259E5D8A8(v39, v40);
    sub_259E5D8A8(v44, v18);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v47, v41);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v14, v42);
    sub_259E5D8A8(v35, v36);
  }
  return v12;
}

__SecKey *sub_259E689F0(__SecKey *a1)
{
  uint64_t v2 = sub_259E99E88();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_259E99F38();
  uint64_t v59 = *(void *)(v6 - 8);
  uint64_t v60 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v61 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_259E99FC8();
  uint64_t v62 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v51 - v12;
  uint64_t v14 = self;
  if (qword_26A3F8190 != -1) {
    swift_once();
  }
  id v15 = objc_msgSend(v14, sel_createSEPEncryptionKeyForAlgorithm_shared_preboot_, qword_26A3F86A0, 1, 0);
  id v16 = v14;
  if (v15)
  {
    id v17 = objc_msgSend(v16, sel_dataForKey_, v15);
    if (!v17)
    {
      if (qword_26A3F8170 != -1) {
        swift_once();
      }
      uint64_t v28 = sub_259E99C48();
      __swift_project_value_buffer(v28, (uint64_t)qword_26A3F8178);
      Logger.PSSO_ERROR(code:description:)(-1001);
      swift_willThrow();
      goto LABEL_18;
    }
    unint64_t v18 = v17;
    uint64_t v19 = sub_259E99BE8();
    unint64_t v57 = v20;
    uint64_t v58 = v19;

    CFDataRef v21 = SecKeyCopyExternalRepresentation(a1, 0);
    if (!v21)
    {
      if (qword_26A3F8170 != -1) {
        swift_once();
      }
      uint64_t v29 = sub_259E99C48();
      __swift_project_value_buffer(v29, (uint64_t)qword_26A3F8178);
      Logger.PSSO_ERROR(code:description:)(-1005);
      swift_willThrow();
      goto LABEL_17;
    }
    CFDataRef v22 = v21;
    uint64_t v56 = v3;
    uint64_t v23 = v13;
    uint64_t v24 = sub_259E99BE8();
    a1 = v25;

    uint64_t v63 = v24;
    unint64_t v64 = (unint64_t)a1;
    sub_259E5D7F8(v24, (unint64_t)a1);
    unint64_t v26 = (unint64_t)v65;
    sub_259E99FB8();
    if (v26)
    {
      sub_259E5D850(v24, (unint64_t)a1);
LABEL_17:
      sub_259E5D850(v58, v57);
LABEL_18:

      return a1;
    }
    uint64_t v55 = v24;
    unint64_t v65 = a1;
    uint64_t v31 = v8;
    (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v11, v23, v8);
    if (qword_26A3F8198 != -1) {
      swift_once();
    }
    uint64_t v32 = __swift_project_value_buffer(v2, (uint64_t)qword_26A3F86A8);
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v5, v32, v2);
    sub_259E99EF8();
    unint64_t v33 = v57;
    uint64_t v63 = v58;
    unint64_t v64 = v57;
    sub_259E60120();
    uint64_t v56 = sub_259E99F28();
    unint64_t v54 = v34;
    id v35 = objc_msgSend(objc_allocWithZone((Class)POMutableWrappedTokenJWTBody), sel_init);
    uint64_t v36 = sub_259E99F08();
    uint64_t v53 = v31;
    unint64_t v38 = v37;
    sub_259E99BD8();
    sub_259E5D850(v36, v38);
    uint64_t v39 = (void *)sub_259E9A058();
    swift_bridgeObjectRelease();
    objc_msgSend(v35, sel_setEncapsulatedKey_, v39);

    sub_259E99BD8();
    unint64_t v40 = (void *)sub_259E9A058();
    swift_bridgeObjectRelease();
    id v52 = v35;
    objc_msgSend(v35, sel_setCipherText_, v40);

    a1 = (__SecKey *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for POUserUnlockKeySwift()), sel_init);
    uint64_t v41 = (uint64_t *)((char *)a1 + OBJC_IVAR____TtC15PlatformSSOCore20POUserUnlockKeySwift_keyData);
    swift_beginAccess();
    uint64_t v42 = *v41;
    unint64_t v43 = v41[1];
    uint64_t v44 = v58;
    *uint64_t v41 = v58;
    v41[1] = v33;
    sub_259E5D7F8(v44, v33);
    sub_259E5D8A8(v42, v43);
    id v45 = objc_msgSend(v35, sel_dataRepresentation);
    uint64_t v46 = sub_259E99BE8();
    unint64_t v48 = v47;

    Swift::String v49 = Data.base64URLEncodedString()();
    sub_259E5D850(v46, v48);
    unint64_t v50 = (Swift::String *)((char *)a1 + OBJC_IVAR____TtC15PlatformSSOCore20POUserUnlockKeySwift_encryptedKeyData);
    swift_beginAccess();
    *unint64_t v50 = v49;

    swift_bridgeObjectRelease();
    sub_259E5D850(v56, v54);

    sub_259E5D850(v58, v33);
    sub_259E5D850(v55, (unint64_t)v65);
    (*(void (**)(char *, uint64_t))(v59 + 8))(v61, v60);
    (*(void (**)(char *, uint64_t))(v62 + 8))(v23, v53);
  }
  else
  {
    if (qword_26A3F8170 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_259E99C48();
    __swift_project_value_buffer(v27, (uint64_t)qword_26A3F8178);
    Logger.PSSO_ERROR(code:description:)(-1001);
    swift_willThrow();
  }
  return a1;
}

uint64_t type metadata accessor for POUserUnlockKeySwift()
{
  return self;
}

id Logger.PSSO_ERROR(code:description:)(uint64_t a1)
{
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_259E9A058();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(self, sel_errorWithCode_description_, a1, v2);

  LOBYTE(v2) = sub_259E9A1A8();
  id v4 = v3;
  uint64_t v5 = sub_259E99C28();
  os_log_type_t v6 = v2;
  if (os_log_type_enabled(v5, (os_log_type_t)v2))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138543362;
    id v9 = v4;
    sub_259E9A1C8();
    void *v8 = v4;

    _os_log_impl(&dword_259DFE000, v5, v6, "%{public}@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F7098);
    swift_arrayDestroy();
    MEMORY[0x25A2EE060](v8, -1, -1);
    MEMORY[0x25A2EE060](v7, -1, -1);
  }
  else
  {
  }
  return v4;
}

id Logger.PSSO_ERROR_VALUE(code:description:value:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  swift_bridgeObjectRetain();
  os_log_type_t v6 = (void *)sub_259E9A058();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(self, sel_errorWithCode_description_, a1, v6);

  os_log_type_t v8 = sub_259E9A1A8();
  id v9 = v7;
  id v10 = a4;
  id v11 = v9;
  id v12 = v10;
  uint64_t v13 = sub_259E99C28();
  if (os_log_type_enabled(v13, v8))
  {
    uint64_t v14 = swift_slowAlloc();
    id v15 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 138543618;
    id v16 = v11;
    sub_259E9A1C8();
    *id v15 = v11;

    *(_WORD *)(v14 + 12) = 2114;
    id v17 = v12;
    sub_259E9A1C8();
    v15[1] = v12;

    _os_log_impl(&dword_259DFE000, v13, v8, "%{public}@, %{public}@", (uint8_t *)v14, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F7098);
    swift_arrayDestroy();
    MEMORY[0x25A2EE060](v15, -1, -1);
    MEMORY[0x25A2EE060](v14, -1, -1);
  }
  else
  {
  }
  return v11;
}

id Logger.PSSO_SUBERROR(code:subError:description:)(uint64_t a1, void *a2)
{
  swift_bridgeObjectRetain();
  id v4 = a2;
  uint64_t v5 = (void *)sub_259E99B68();

  os_log_type_t v6 = (void *)sub_259E9A058();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(self, sel_errorWithCode_underlyingError_description_, a1, v5, v6);

  LOBYTE(v6) = sub_259E9A1A8();
  id v8 = v7;
  id v9 = sub_259E99C28();
  os_log_type_t v10 = v6;
  if (os_log_type_enabled(v9, (os_log_type_t)v6))
  {
    id v11 = (uint8_t *)swift_slowAlloc();
    id v12 = (void *)swift_slowAlloc();
    *(_DWORD *)id v11 = 138543362;
    id v13 = v8;
    sub_259E9A1C8();
    *id v12 = v8;

    _os_log_impl(&dword_259DFE000, v9, v10, "%{public}@", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F7098);
    swift_arrayDestroy();
    MEMORY[0x25A2EE060](v12, -1, -1);
    MEMORY[0x25A2EE060](v11, -1, -1);
  }
  else
  {
  }
  return v8;
}

id Logger.PSSO_SUBERROR_VALUE(code:subError:description:value:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  swift_bridgeObjectRetain();
  id v8 = a2;
  id v9 = (void *)sub_259E99B68();

  os_log_type_t v10 = (void *)sub_259E9A058();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(self, sel_errorWithCode_underlyingError_description_, a1, v9, v10);

  os_log_type_t v12 = sub_259E9A1A8();
  id v13 = v11;
  id v14 = a5;
  id v15 = v13;
  id v16 = v14;
  id v17 = sub_259E99C28();
  if (os_log_type_enabled(v17, v12))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v19 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 138543618;
    id v20 = v15;
    sub_259E9A1C8();
    *uint64_t v19 = v15;

    *(_WORD *)(v18 + 12) = 2114;
    id v21 = v16;
    sub_259E9A1C8();
    v19[1] = v16;

    _os_log_impl(&dword_259DFE000, v17, v12, "%{public}@, %{public}@", (uint8_t *)v18, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F7098);
    swift_arrayDestroy();
    MEMORY[0x25A2EE060](v19, -1, -1);
    MEMORY[0x25A2EE060](v18, -1, -1);
  }
  else
  {
  }
  return v15;
}

Swift::String __swiftcall Data.base64URLEncodedString()()
{
  uint64_t v0 = sub_259E99AD8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  id v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_259E99BD8();
  uint64_t v22 = v4;
  uint64_t v19 = 43;
  unint64_t v20 = 0xE100000000000000;
  uint64_t v17 = 45;
  unint64_t v18 = 0xE100000000000000;
  sub_259E69BEC();
  uint64_t v5 = sub_259E9A1E8();
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  uint64_t v21 = v5;
  uint64_t v22 = v7;
  uint64_t v19 = 47;
  unint64_t v20 = 0xE100000000000000;
  uint64_t v17 = 95;
  unint64_t v18 = 0xE100000000000000;
  uint64_t v8 = sub_259E9A1E8();
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  uint64_t v21 = v8;
  uint64_t v22 = v10;
  uint64_t v19 = (uint64_t)&unk_2707C02F0;
  sub_259E69C40();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F70B0);
  sub_259E69C98();
  sub_259E9A1F8();
  uint64_t v11 = sub_259E9A1D8();
  id v13 = v12;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_bridgeObjectRelease();
  uint64_t v14 = v11;
  id v15 = v13;
  result._object = v15;
  result._countAndFlagsBits = v14;
  return result;
}

unint64_t sub_259E69BEC()
{
  unint64_t result = qword_26A3F70A0;
  if (!qword_26A3F70A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F70A0);
  }
  return result;
}

unint64_t sub_259E69C40()
{
  unint64_t result = qword_26A3F70A8;
  if (!qword_26A3F70A8)
  {
    sub_259E99AD8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F70A8);
  }
  return result;
}

unint64_t sub_259E69C98()
{
  unint64_t result = qword_26A3F70B8;
  if (!qword_26A3F70B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A3F70B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F70B8);
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

uint64_t Data.init(base64URLEncoded:)()
{
  sub_259E9A0E8();
  sub_259E69BEC();
  sub_259E9A1E8();
  swift_bridgeObjectRelease();
  sub_259E9A1E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_259E9A188();
  sub_259E9A108();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v0 = sub_259E99B88();
  unint64_t v2 = v1;
  sub_259E5EFB4(v0, v1);
  swift_bridgeObjectRelease();
  if (v2 >> 60 != 15) {
    sub_259E5D8A8(v0, v2);
  }
  return v0;
}

id POCryptoKitAlgorithmCurve25519.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id POCryptoKitAlgorithmCurve25519.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  unint64_t v2 = (void *)sub_259E9A058();
  id v3 = (void *)sub_259E9A058();
  v6.receiver = v0;
  v6.super_class = ObjectType;
  id v4 = objc_msgSendSuper2(&v6, sel_initWithSecKeyAlgorithm_algorithmName_alg_, 0, v2, v3);

  return v4;
}

uint64_t POCryptoKitAlgorithmCurve25519.sign(_:using:error:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = sub_259E99D58();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = a3;
  sub_259E99D38();
  if (!v3)
  {
    v13[0] = a1;
    v13[1] = a2;
    sub_259E60120();
    a2 = sub_259E99D48();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return a2;
}

id POCryptoKitAlgorithmCurve25519.__allocating_init(secKeyAlgorithm:algorithmName:alg:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = (void *)sub_259E9A058();
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)sub_259E9A058();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v3, sel_initWithSecKeyAlgorithm_algorithmName_alg_, a1, v4, v5);

  return v6;
}

void POCryptoKitAlgorithmCurve25519.init(secKeyAlgorithm:algorithmName:alg:)()
{
}

id POCryptoKitAlgorithmCurve25519.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s15PlatformSSOCore30POCryptoKitAlgorithmCurve25519C15verifySignature_2on5usingSb10Foundation4DataV_AISo9SecKeyRefatF_0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, __SecKey *a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A3F70C0);
  MEMORY[0x270FA5388](v10 - 8);
  os_log_type_t v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_259E99CC8();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  id v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  CFDataRef v17 = SecKeyCopyExternalRepresentation(a5, 0);
  if (v17)
  {
    CFDataRef v18 = v17;
    v24[0] = a4;
    uint64_t v19 = sub_259E99BE8();
    unint64_t v21 = v20;

    uint64_t v25 = v19;
    unint64_t v26 = v21;
    sub_259E5D7F8(v19, v21);
    sub_259E99CB8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
    {
      sub_259E5D850(v19, v21);
      sub_259E6ADD8((uint64_t)v12);
      char v22 = 0;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
      uint64_t v25 = a1;
      unint64_t v26 = a2;
      v24[1] = a3;
      v24[2] = v24[0];
      sub_259E60120();
      char v22 = sub_259E99CA8();
      sub_259E5D850(v19, v21);
      (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    }
  }
  else
  {
    char v22 = 0;
  }
  return v22 & 1;
}

uint64_t _s15PlatformSSOCore30POCryptoKitAlgorithmCurve25519C15verifySignature_2on22usingCertificateStringSb10Foundation4DataV_AISStF_0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = objc_allocWithZone(MEMORY[0x263EFF8F8]);
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)sub_259E9A058();
  swift_bridgeObjectRelease();
  CFDataRef v10 = (const __CFData *)objc_msgSend(v8, sel_initWithBase64EncodedString_options_, v9, 0);

  if (v10)
  {
    uint64_t v11 = SecCertificateCreateWithData(0, v10);
    if (v11)
    {
      os_log_type_t v12 = v11;
      uint64_t v13 = SecCertificateCopyKey(v11);
      if (v13)
      {
        uint64_t v14 = v13;
        char v15 = _s15PlatformSSOCore30POCryptoKitAlgorithmCurve25519C15verifySignature_2on5usingSb10Foundation4DataV_AISo9SecKeyRefatF_0(a1, a2, a3, a4, v13);

        CFDataRef v10 = v12;
        os_log_type_t v12 = v14;
      }
      else
      {
        char v15 = 0;
      }

      CFDataRef v10 = v12;
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

uint64_t _s15PlatformSSOCore30POCryptoKitAlgorithmCurve25519C9verifyKeyySbSo03SecH3RefaF_0(void *a1)
{
  uint64_t v2 = sub_259E99D58();
  uint64_t v21 = *(void *)(v2 - 8);
  uint64_t v22 = v2;
  MEMORY[0x270FA5388](v2);
  id v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_259E9A0B8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_259E99C18();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  os_log_type_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_259E99C08();
  sub_259E99BF8();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_259E9A098();
  uint64_t v13 = sub_259E9A078();
  unint64_t v15 = v14;
  swift_bridgeObjectRelease();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v15 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    if (objc_msgSend(self, sel_isSEPKey_, a1))
    {
      id v17 = a1;
      sub_259E99D38();
      uint64_t v23 = v13;
      unint64_t v24 = v15;
      sub_259E60120();
      uint64_t v18 = sub_259E99D48();
      sub_259E5D850(v18, v19);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v22);
    }
    sub_259E5D8A8(v13, v15);
    return 1;
  }
  return result;
}

uint64_t type metadata accessor for POCryptoKitAlgorithmCurve25519()
{
  return self;
}

uint64_t sub_259E6ADD8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A3F70C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_259E6AE38()
{
  uint64_t v0 = sub_259E99C48();
  __swift_allocate_value_buffer(v0, qword_26A3F81A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A3F81A8);
  return sub_259E99C38();
}

void *variable initialization expression of POCryptoKitHPKE_P256_SHA256_AES_GCM_256.encryptionAlgorithm()
{
  return &unk_2707DBB68;
}

id POCryptoKitHPKE_P256_SHA256_AES_GCM_256.encryptionAlgorithm.getter()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_256_encryptionAlgorithm));
}

id POCryptoKitHPKE_P256_SHA256_AES_GCM_256.__allocating_init()()
{
  uint64_t v1 = sub_259E99E88();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = (char *)objc_allocWithZone(v0);
  *(void *)&v4[OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_256_encryptionAlgorithm] = 0x2707DBB68;
  id v5 = &unk_2707DBB68;
  sub_259E99E48();
  return POCryptoKitHPKE.init(cipherSuite:)((uint64_t)v3);
}

id POCryptoKitHPKE_P256_SHA256_AES_GCM_256.init()()
{
  uint64_t v1 = sub_259E99E88();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v0 + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_256_encryptionAlgorithm) = 0x2707DBB68;
  id v4 = &unk_2707DBB68;
  sub_259E99E48();
  return POCryptoKitHPKE.init(cipherSuite:)((uint64_t)v3);
}

Swift::Void __swiftcall POCryptoKitHPKE_P256_SHA256_AES_GCM_256.addValues(to:)(POMutableJWTHeader to)
{
  Class isa = to.super.super.isa;
  uint64_t v2 = (void *)sub_259E9A058();
  [(objc_class *)isa setEnc:v2];

  sub_259E9A068();
  id v3 = (id)sub_259E9A058();
  swift_bridgeObjectRelease();
  [(objc_class *)isa setAlg:v3];
}

Swift::String __swiftcall POCryptoKitHPKE_P256_SHA256_AES_GCM_256.algValue()()
{
  uint64_t v0 = sub_259E9A068();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t POCryptoKitHPKE_P256_SHA256_AES_GCM_256.decodeAndDecryptJWT(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, void *a9)
{
  uint64_t v83 = a4;
  SecKeyRef v81 = a1;
  uint64_t v82 = a7;
  uint64_t v79 = a3;
  uint64_t v85 = a2;
  uint64_t v80 = sub_259E99FF8();
  uint64_t v72 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  uint64_t v84 = (char *)&v71 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_259E9A0B8();
  uint64_t v77 = *(void *)(v13 - 8);
  uint64_t v78 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v76 = (char *)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_259E99D88();
  uint64_t v74 = *(void *)(v15 - 8);
  uint64_t v75 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v86 = (char *)&v71 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A3F7070);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v20 = (char *)&v71 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v87 = (uint64_t)&v71 - v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F6F18);
  uint64_t v23 = MEMORY[0x270FA5388](v22 - 8);
  uint64_t v25 = (char *)&v71 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v71 - v26;
  uint64_t v28 = sub_259E99D08();
  uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56);
  uint64_t v91 = v27;
  v29(v27, 1, 1, v28);
  if (a6 >> 60 == 15) {
    goto LABEL_6;
  }
  uint64_t v89 = a5;
  unint64_t v90 = a6;
  sub_259E5D7F8(a5, a6);
  sub_259E99CE8();
  uint64_t v30 = (uint64_t)v91;
  sub_259E5E234((uint64_t)v91, &qword_26A3F6F18);
  v29(v25, 0, 1, v28);
  sub_259E5E290((uint64_t)v25, v30, &qword_26A3F6F18);
  if (a8 >> 60 != 15)
  {
LABEL_6:
    unint64_t v73 = a8;
    uint64_t v33 = sub_259E99FC8();
    unint64_t v34 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56);
    uint64_t v35 = v87;
    v34(v87, 1, 1, v33);
    if (a9)
    {
      uint64_t v36 = a9;
      CFDataRef v37 = SecKeyCopyExternalRepresentation(v36, 0);
      if (v37)
      {
        CFDataRef v38 = v37;
        uint64_t v39 = sub_259E99BE8();
        unint64_t v41 = v40;

        uint64_t v89 = v39;
        unint64_t v90 = v41;
        sub_259E5D7F8(v39, v41);
        uint64_t v42 = v88;
        sub_259E99FB8();
        uint64_t v88 = v42;
        if (v42)
        {

          sub_259E5D850(v39, v41);
          sub_259E5E234(v87, (uint64_t *)&unk_26A3F7070);
          return sub_259E5E234((uint64_t)v91, &qword_26A3F6F18);
        }
        uint64_t v44 = v87;
        sub_259E5E234(v87, (uint64_t *)&unk_26A3F7070);

        unint64_t v45 = v41;
        uint64_t v35 = v44;
        sub_259E5D850(v39, v45);
        v34((uint64_t)v20, 0, 1, v33);
        sub_259E5E290((uint64_t)v20, v44, (uint64_t *)&unk_26A3F7070);
      }
      else
      {
      }
    }
    uint64_t v46 = self;
    unint64_t v47 = v85;
    unsigned int v48 = objc_msgSend(v46, sel_isSEPKey_, v85);
    uint64_t v49 = v88;
    uint64_t v50 = (uint64_t)v91;
    uint64_t v51 = (uint64_t)v86;
    if (v48)
    {
      id v52 = v47;
      sub_259E99D78();
      unint64_t v53 = v73;
      if (!v49)
      {
        if (v83)
        {
          unint64_t v54 = v76;
          sub_259E9A098();
          uint64_t v55 = sub_259E9A078();
          unint64_t v57 = v56;
          (*(void (**)(char *, uint64_t))(v77 + 8))(v54, v78);
        }
        else
        {
          uint64_t v55 = 0;
          unint64_t v57 = 0xF000000000000000;
        }
        uint64_t v70 = v75;
        POCryptoKitHPKE.decodeAndDecryptJWT<A>(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(v81, v51, v55, v57, v50, v82, v53, v35, v75, MEMORY[0x263F04678]);
        sub_259E5D8A8(v55, v57);
        (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v51, v70);
      }
    }
    else
    {
      CFDataRef v58 = SecKeyCopyExternalRepresentation((SecKeyRef)v47, 0);
      if (v58)
      {
        CFDataRef v59 = v58;
        uint64_t v60 = sub_259E99BE8();
        unint64_t v62 = v61;

        uint64_t v89 = v60;
        unint64_t v90 = v62;
        sub_259E5D7F8(v60, v62);
        uint64_t v63 = (uint64_t)v84;
        sub_259E99FE8();
        if (v49)
        {
          sub_259E5D850(v60, v62);
        }
        else
        {
          if (v83)
          {
            unint64_t v65 = v76;
            sub_259E9A098();
            uint64_t v66 = sub_259E9A078();
            unint64_t v67 = v65;
            unint64_t v69 = v68;
            (*(void (**)(char *, uint64_t))(v77 + 8))(v67, v78);
          }
          else
          {
            uint64_t v66 = 0;
            unint64_t v69 = 0xF000000000000000;
          }
          POCryptoKitHPKE.decodeAndDecryptJWT<A>(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(v81, v63, v66, v69, v50, v82, v73, v35, v80, MEMORY[0x263F04790]);
          sub_259E5D8A8(v66, v69);
          sub_259E5D850(v60, v62);
          (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v63, v80);
        }
      }
      else
      {
        if (qword_26A3F81A0 != -1) {
          swift_once();
        }
        uint64_t v64 = sub_259E99C48();
        __swift_project_value_buffer(v64, (uint64_t)qword_26A3F81A8);
        Logger.PSSO_ERROR(code:description:)(-1005);
        swift_willThrow();
      }
    }
    sub_259E5E234(v35, (uint64_t *)&unk_26A3F7070);
    uint64_t v32 = v50;
  }
  else
  {
    if (qword_26A3F81A0 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_259E99C48();
    __swift_project_value_buffer(v31, (uint64_t)qword_26A3F81A8);
    Logger.PSSO_ERROR(code:description:)(-1005);
    swift_willThrow();
    uint64_t v32 = (uint64_t)v91;
  }
  return sub_259E5E234(v32, &qword_26A3F6F18);
}

void *POCryptoKitHPKE_P256_SHA256_AES_GCM_256.encodeAndEncryptJWT(_:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:)(void *a1, __SecKey *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, void *a9, uint64_t a10, uint64_t a11)
{
  uint64_t v83 = a1;
  uint64_t v79 = a7;
  uint64_t v78 = a4;
  uint64_t v73 = a3;
  SecKeyRef v81 = a2;
  uint64_t v14 = sub_259E9A0B8();
  uint64_t v74 = *(void *)(v14 - 8);
  uint64_t v75 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v72 = (char *)&v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_259E99FC8();
  uint64_t v76 = *(void *)(v16 - 8);
  uint64_t v77 = v16;
  MEMORY[0x270FA5388](v16);
  uint64_t v82 = (char *)&v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F7080);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v21 = (char *)&v70 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v85 = (uint64_t)&v70 - v22;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F6F18);
  uint64_t v24 = MEMORY[0x270FA5388](v23 - 8);
  uint64_t v26 = (char *)&v70 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v70 - v27;
  uint64_t v29 = sub_259E99D08();
  uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56);
  unint64_t v88 = (unint64_t)v28;
  v30(v28, 1, 1, v29);
  if (a6 >> 60 != 15)
  {
    uint64_t v86 = a5;
    unint64_t v87 = a6;
    sub_259E5D7F8(a5, a6);
    sub_259E99CE8();
    uint64_t v31 = v88;
    sub_259E5E234(v88, &qword_26A3F6F18);
    v30(v26, 0, 1, v29);
    sub_259E5E290((uint64_t)v26, v31, &qword_26A3F6F18);
    if (a8 >> 60 == 15)
    {
      if (qword_26A3F81A0 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_259E99C48();
      uint64_t v33 = (void *)__swift_project_value_buffer(v32, (uint64_t)qword_26A3F81A8);
      Logger.PSSO_ERROR(code:description:)(-1005);
      swift_willThrow();
      goto LABEL_10;
    }
  }
  unint64_t v80 = a8;
  unint64_t v34 = (uint64_t *)sub_259E99FF8();
  uint64_t v35 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(*(v34 - 1) + 56);
  uint64_t v36 = v85;
  v35(v85, 1, 1, v34);
  if (a9)
  {
    uint64_t v37 = v84;
    CFDataRef v38 = a9;
    CFDataRef v39 = SecKeyCopyExternalRepresentation(v38, 0);
    if (v39)
    {
      CFDataRef v40 = v39;
      uint64_t v33 = (void *)sub_259E99BE8();
      unint64_t v42 = v41;

      uint64_t v86 = (uint64_t)v33;
      unint64_t v87 = v42;
      sub_259E5D7F8((uint64_t)v33, v42);
      sub_259E99FE8();
      if (v37)
      {

        sub_259E5D850((uint64_t)v33, v42);
        sub_259E5E234(v85, &qword_26A3F7080);
LABEL_10:
        uint64_t v43 = v88;
LABEL_21:
        sub_259E5E234(v43, &qword_26A3F6F18);
        return v33;
      }
      unint64_t v45 = v34;
      uint64_t v46 = v85;
      sub_259E5E234(v85, &qword_26A3F7080);

      unint64_t v47 = v42;
      uint64_t v36 = v46;
      sub_259E5D850((uint64_t)v33, v47);
      uint64_t v71 = v45;
      v35((uint64_t)v21, 0, 1, v45);
      uint64_t v44 = 0;
      sub_259E5E290((uint64_t)v21, v46, &qword_26A3F7080);
    }
    else
    {
      uint64_t v71 = v34;

      uint64_t v44 = v37;
    }
  }
  else
  {
    uint64_t v71 = v34;
    uint64_t v44 = v84;
  }
  id v48 = objc_msgSend(v83, sel_header);
  uint64_t v49 = (void *)sub_259E9A058();
  objc_msgSend(v48, sel_setEnc_, v49);

  sub_259E9A068();
  uint64_t v50 = (void *)sub_259E9A058();
  swift_bridgeObjectRelease();
  objc_msgSend(v48, sel_setAlg_, v50);

  CFDataRef v51 = SecKeyCopyExternalRepresentation(v81, 0);
  unint64_t v52 = v88;
  unint64_t v53 = v80;
  uint64_t v54 = (uint64_t)v82;
  if (!v51)
  {
    if (qword_26A3F81A0 != -1) {
      swift_once();
    }
    uint64_t v58 = sub_259E99C48();
    uint64_t v33 = (void *)__swift_project_value_buffer(v58, (uint64_t)qword_26A3F81A8);
    Logger.PSSO_ERROR(code:description:)(-1005);
    swift_willThrow();
    goto LABEL_20;
  }
  uint64_t v33 = v51;
  uint64_t v55 = sub_259E99BE8();
  unint64_t v57 = v56;

  uint64_t v86 = v55;
  unint64_t v87 = v57;
  sub_259E5D7F8(v55, v57);
  sub_259E99FB8();
  if (v44)
  {
    sub_259E5D850(v55, v57);
LABEL_20:
    sub_259E5E234(v36, &qword_26A3F7080);
    uint64_t v43 = v52;
    goto LABEL_21;
  }
  uint64_t v61 = a10;
  unint64_t v60 = a11;
  if (v78)
  {
    unint64_t v62 = v72;
    uint64_t v84 = a10;
    uint64_t v85 = a11;
    sub_259E9A098();
    uint64_t v63 = sub_259E9A078();
    unint64_t v65 = v64;
    (*(void (**)(char *, uint64_t))(v74 + 8))(v62, v75);
    uint64_t v61 = v84;
    unint64_t v60 = v85;
  }
  else
  {
    uint64_t v63 = 0;
    unint64_t v65 = 0xF000000000000000;
  }
  uint64_t v85 = v63;
  uint64_t v66 = v63;
  unint64_t v67 = v65;
  unint64_t v68 = v65;
  uint64_t v69 = v88;
  uint64_t v33 = POCryptoKitHPKE.encodeAndEncryptJWT<A>(_:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:)(v83, v54, v66, v68, v88, v79, v53, v36, v61, v60, v71, MEMORY[0x263F04790]);
  sub_259E5D8A8(v85, v67);
  sub_259E5D850(v55, v57);
  (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v54, v77);
  sub_259E5E234(v36, &qword_26A3F7080);
  sub_259E5E234(v69, &qword_26A3F6F18);
  return v33;
}

void POCryptoKitHPKE_P256_SHA256_AES_GCM_256.__allocating_init(cipherSuite:)()
{
}

void POCryptoKitHPKE_P256_SHA256_AES_GCM_256.init(cipherSuite:)()
{
}

void sub_259E6C6D4()
{
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_256_encryptionAlgorithm));
}

id POCryptoKitHPKE_P256_SHA256_AES_GCM_256.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_259E6C72C()
{
  return type metadata accessor for POCryptoKitHPKE_P256_SHA256_AES_GCM_256();
}

uint64_t type metadata accessor for POCryptoKitHPKE_P256_SHA256_AES_GCM_256()
{
  uint64_t result = qword_26A3F81C0;
  if (!qword_26A3F81C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_259E6C780()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_259E6C7C4()
{
  uint64_t v0 = sub_259E99C48();
  __swift_allocate_value_buffer(v0, qword_26A3F83D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A3F83D8);
  return sub_259E99C38();
}

void *variable initialization expression of POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly.encryptionAlgorithm()
{
  return &unk_2707DBB98;
}

id POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly.encryptionAlgorithm.getter()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC15PlatformSSOCore44POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly_encryptionAlgorithm));
}

id POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly.__allocating_init()()
{
  uint64_t v1 = sub_259E99E88();
  MEMORY[0x270FA5388](v1 - 8);
  id v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = (char *)objc_allocWithZone(v0);
  *(void *)&v4[OBJC_IVAR____TtC15PlatformSSOCore44POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly_encryptionAlgorithm] = 0x2707DBB98;
  id v5 = &unk_2707DBB98;
  sub_259E99E68();
  return POCryptoKitHPKE.init(cipherSuite:)((uint64_t)v3);
}

id POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly.init()()
{
  uint64_t v1 = sub_259E99E88();
  MEMORY[0x270FA5388](v1 - 8);
  id v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v0 + OBJC_IVAR____TtC15PlatformSSOCore44POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly_encryptionAlgorithm) = 0x2707DBB98;
  id v4 = &unk_2707DBB98;
  sub_259E99E68();
  return POCryptoKitHPKE.init(cipherSuite:)((uint64_t)v3);
}

Swift::Void __swiftcall POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly.addValues(to:)(POMutableJWTHeader to)
{
  Class isa = to.super.super.isa;
  uint64_t v2 = (void *)sub_259E9A058();
  [(objc_class *)isa setEnc:v2];

  sub_259E9A068();
  id v3 = (id)sub_259E9A058();
  swift_bridgeObjectRelease();
  [(objc_class *)isa setAlg:v3];
}

Swift::String __swiftcall POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly.algValue()()
{
  uint64_t v0 = sub_259E9A068();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly.decodeAndDecryptJWT(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, void *a9)
{
  uint64_t v83 = a4;
  SecKeyRef v81 = a1;
  uint64_t v82 = a7;
  uint64_t v79 = a3;
  uint64_t v85 = a2;
  uint64_t v80 = sub_259E99C98();
  uint64_t v72 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  uint64_t v84 = (char *)&v71 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_259E9A0B8();
  uint64_t v77 = *(void *)(v13 - 8);
  uint64_t v78 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v76 = (char *)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_259E99D28();
  uint64_t v74 = *(void *)(v15 - 8);
  uint64_t v75 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v86 = (char *)&v71 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A3F70D0);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v20 = (char *)&v71 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v87 = (uint64_t)&v71 - v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F6F18);
  uint64_t v23 = MEMORY[0x270FA5388](v22 - 8);
  uint64_t v25 = (char *)&v71 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v71 - v26;
  uint64_t v28 = sub_259E99D08();
  uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56);
  uint64_t v91 = v27;
  v29(v27, 1, 1, v28);
  if (a6 >> 60 == 15) {
    goto LABEL_6;
  }
  uint64_t v89 = a5;
  unint64_t v90 = a6;
  sub_259E5D7F8(a5, a6);
  sub_259E99CE8();
  uint64_t v30 = (uint64_t)v91;
  sub_259E5E234((uint64_t)v91, &qword_26A3F6F18);
  v29(v25, 0, 1, v28);
  sub_259E5E290((uint64_t)v25, v30, &qword_26A3F6F18);
  if (a8 >> 60 != 15)
  {
LABEL_6:
    unint64_t v73 = a8;
    uint64_t v33 = sub_259E99C78();
    unint64_t v34 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56);
    uint64_t v35 = v87;
    v34(v87, 1, 1, v33);
    if (a9)
    {
      uint64_t v36 = a9;
      CFDataRef v37 = SecKeyCopyExternalRepresentation(v36, 0);
      if (v37)
      {
        CFDataRef v38 = v37;
        uint64_t v39 = sub_259E99BE8();
        unint64_t v41 = v40;

        uint64_t v89 = v39;
        unint64_t v90 = v41;
        sub_259E5D7F8(v39, v41);
        uint64_t v42 = v88;
        sub_259E99C68();
        uint64_t v88 = v42;
        if (v42)
        {

          sub_259E5D850(v39, v41);
          sub_259E5E234(v87, (uint64_t *)&unk_26A3F70D0);
          return sub_259E5E234((uint64_t)v91, &qword_26A3F6F18);
        }
        uint64_t v44 = v87;
        sub_259E5E234(v87, (uint64_t *)&unk_26A3F70D0);

        unint64_t v45 = v41;
        uint64_t v35 = v44;
        sub_259E5D850(v39, v45);
        v34((uint64_t)v20, 0, 1, v33);
        sub_259E5E290((uint64_t)v20, v44, (uint64_t *)&unk_26A3F70D0);
      }
      else
      {
      }
    }
    uint64_t v46 = self;
    unint64_t v47 = v85;
    unsigned int v48 = objc_msgSend(v46, sel_isSEPKey_, v85);
    uint64_t v49 = v88;
    uint64_t v50 = (uint64_t)v91;
    uint64_t v51 = (uint64_t)v86;
    if (v48)
    {
      id v52 = v47;
      sub_259E99D18();
      unint64_t v53 = v73;
      if (!v49)
      {
        if (v83)
        {
          uint64_t v54 = v76;
          sub_259E9A098();
          uint64_t v55 = sub_259E9A078();
          unint64_t v57 = v56;
          (*(void (**)(char *, uint64_t))(v77 + 8))(v54, v78);
        }
        else
        {
          uint64_t v55 = 0;
          unint64_t v57 = 0xF000000000000000;
        }
        uint64_t v70 = v75;
        POCryptoKitHPKE.decodeAndDecryptJWT<A>(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(v81, v51, v55, v57, v50, v82, v53, v35, v75, MEMORY[0x263F04650]);
        sub_259E5D8A8(v55, v57);
        (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v51, v70);
      }
    }
    else
    {
      CFDataRef v58 = SecKeyCopyExternalRepresentation((SecKeyRef)v47, 0);
      if (v58)
      {
        CFDataRef v59 = v58;
        uint64_t v60 = sub_259E99BE8();
        unint64_t v62 = v61;

        uint64_t v89 = v60;
        unint64_t v90 = v62;
        sub_259E5D7F8(v60, v62);
        uint64_t v63 = (uint64_t)v84;
        sub_259E99C88();
        if (v49)
        {
          sub_259E5D850(v60, v62);
        }
        else
        {
          if (v83)
          {
            unint64_t v65 = v76;
            sub_259E9A098();
            uint64_t v66 = sub_259E9A078();
            unint64_t v67 = v65;
            unint64_t v69 = v68;
            (*(void (**)(char *, uint64_t))(v77 + 8))(v67, v78);
          }
          else
          {
            uint64_t v66 = 0;
            unint64_t v69 = 0xF000000000000000;
          }
          POCryptoKitHPKE.decodeAndDecryptJWT<A>(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(v81, v63, v66, v69, v50, v82, v73, v35, v80, MEMORY[0x263F04578]);
          sub_259E5D8A8(v66, v69);
          sub_259E5D850(v60, v62);
          (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v63, v80);
        }
      }
      else
      {
        if (qword_26A3F83D0 != -1) {
          swift_once();
        }
        uint64_t v64 = sub_259E99C48();
        __swift_project_value_buffer(v64, (uint64_t)qword_26A3F83D8);
        Logger.PSSO_ERROR(code:description:)(-1005);
        swift_willThrow();
      }
    }
    sub_259E5E234(v35, (uint64_t *)&unk_26A3F70D0);
    uint64_t v32 = v50;
  }
  else
  {
    if (qword_26A3F83D0 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_259E99C48();
    __swift_project_value_buffer(v31, (uint64_t)qword_26A3F83D8);
    Logger.PSSO_ERROR(code:description:)(-1005);
    swift_willThrow();
    uint64_t v32 = (uint64_t)v91;
  }
  return sub_259E5E234(v32, &qword_26A3F6F18);
}

void *POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly.encodeAndEncryptJWT(_:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:)(void *a1, __SecKey *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, void *a9, uint64_t a10, uint64_t a11)
{
  uint64_t v83 = a1;
  uint64_t v79 = a7;
  uint64_t v78 = a4;
  uint64_t v73 = a3;
  SecKeyRef v81 = a2;
  uint64_t v14 = sub_259E9A0B8();
  uint64_t v74 = *(void *)(v14 - 8);
  uint64_t v75 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v72 = (char *)&v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_259E99C78();
  uint64_t v76 = *(void *)(v16 - 8);
  uint64_t v77 = v16;
  MEMORY[0x270FA5388](v16);
  uint64_t v82 = (char *)&v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A3F70E0);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v21 = (char *)&v70 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v85 = (uint64_t)&v70 - v22;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F6F18);
  uint64_t v24 = MEMORY[0x270FA5388](v23 - 8);
  uint64_t v26 = (char *)&v70 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v70 - v27;
  uint64_t v29 = sub_259E99D08();
  uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56);
  unint64_t v88 = (unint64_t)v28;
  v30(v28, 1, 1, v29);
  if (a6 >> 60 != 15)
  {
    uint64_t v86 = a5;
    unint64_t v87 = a6;
    sub_259E5D7F8(a5, a6);
    sub_259E99CE8();
    uint64_t v31 = v88;
    sub_259E5E234(v88, &qword_26A3F6F18);
    v30(v26, 0, 1, v29);
    sub_259E5E290((uint64_t)v26, v31, &qword_26A3F6F18);
    if (a8 >> 60 == 15)
    {
      if (qword_26A3F83D0 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_259E99C48();
      uint64_t v33 = (void *)__swift_project_value_buffer(v32, (uint64_t)qword_26A3F83D8);
      Logger.PSSO_ERROR(code:description:)(-1005);
      swift_willThrow();
      goto LABEL_10;
    }
  }
  unint64_t v80 = a8;
  unint64_t v34 = (uint64_t *)sub_259E99C98();
  uint64_t v35 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(*(v34 - 1) + 56);
  uint64_t v36 = v85;
  v35(v85, 1, 1, v34);
  if (a9)
  {
    uint64_t v37 = v84;
    CFDataRef v38 = a9;
    CFDataRef v39 = SecKeyCopyExternalRepresentation(v38, 0);
    if (v39)
    {
      CFDataRef v40 = v39;
      uint64_t v33 = (void *)sub_259E99BE8();
      unint64_t v42 = v41;

      uint64_t v86 = (uint64_t)v33;
      unint64_t v87 = v42;
      sub_259E5D7F8((uint64_t)v33, v42);
      sub_259E99C88();
      if (v37)
      {

        sub_259E5D850((uint64_t)v33, v42);
        sub_259E5E234(v85, (uint64_t *)&unk_26A3F70E0);
LABEL_10:
        uint64_t v43 = v88;
LABEL_21:
        sub_259E5E234(v43, &qword_26A3F6F18);
        return v33;
      }
      unint64_t v45 = v34;
      uint64_t v46 = v85;
      sub_259E5E234(v85, (uint64_t *)&unk_26A3F70E0);

      unint64_t v47 = v42;
      uint64_t v36 = v46;
      sub_259E5D850((uint64_t)v33, v47);
      uint64_t v71 = v45;
      v35((uint64_t)v21, 0, 1, v45);
      uint64_t v44 = 0;
      sub_259E5E290((uint64_t)v21, v46, (uint64_t *)&unk_26A3F70E0);
    }
    else
    {
      uint64_t v71 = v34;

      uint64_t v44 = v37;
    }
  }
  else
  {
    uint64_t v71 = v34;
    uint64_t v44 = v84;
  }
  id v48 = objc_msgSend(v83, sel_header);
  uint64_t v49 = (void *)sub_259E9A058();
  objc_msgSend(v48, sel_setEnc_, v49);

  sub_259E9A068();
  uint64_t v50 = (void *)sub_259E9A058();
  swift_bridgeObjectRelease();
  objc_msgSend(v48, sel_setAlg_, v50);

  CFDataRef v51 = SecKeyCopyExternalRepresentation(v81, 0);
  unint64_t v52 = v88;
  unint64_t v53 = v80;
  uint64_t v54 = (uint64_t)v82;
  if (!v51)
  {
    if (qword_26A3F83D0 != -1) {
      swift_once();
    }
    uint64_t v58 = sub_259E99C48();
    uint64_t v33 = (void *)__swift_project_value_buffer(v58, (uint64_t)qword_26A3F83D8);
    Logger.PSSO_ERROR(code:description:)(-1005);
    swift_willThrow();
    goto LABEL_20;
  }
  uint64_t v33 = v51;
  uint64_t v55 = sub_259E99BE8();
  unint64_t v57 = v56;

  uint64_t v86 = v55;
  unint64_t v87 = v57;
  sub_259E5D7F8(v55, v57);
  sub_259E99C68();
  if (v44)
  {
    sub_259E5D850(v55, v57);
LABEL_20:
    sub_259E5E234(v36, (uint64_t *)&unk_26A3F70E0);
    uint64_t v43 = v52;
    goto LABEL_21;
  }
  uint64_t v61 = a10;
  unint64_t v60 = a11;
  if (v78)
  {
    unint64_t v62 = v72;
    uint64_t v84 = a10;
    uint64_t v85 = a11;
    sub_259E9A098();
    uint64_t v63 = sub_259E9A078();
    unint64_t v65 = v64;
    (*(void (**)(char *, uint64_t))(v74 + 8))(v62, v75);
    uint64_t v61 = v84;
    unint64_t v60 = v85;
  }
  else
  {
    uint64_t v63 = 0;
    unint64_t v65 = 0xF000000000000000;
  }
  uint64_t v85 = v63;
  uint64_t v66 = v63;
  unint64_t v67 = v65;
  unint64_t v68 = v65;
  uint64_t v69 = v88;
  uint64_t v33 = POCryptoKitHPKE.encodeAndEncryptJWT<A>(_:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:)(v83, v54, v66, v68, v88, v79, v53, v36, v61, v60, v71, MEMORY[0x263F04578]);
  sub_259E5D8A8(v85, v67);
  sub_259E5D850(v55, v57);
  (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v54, v77);
  sub_259E5E234(v36, (uint64_t *)&unk_26A3F70E0);
  sub_259E5E234(v69, &qword_26A3F6F18);
  return v33;
}

void POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly.__allocating_init(cipherSuite:)()
{
}

void POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly.init(cipherSuite:)()
{
}

void sub_259E6E060()
{
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC15PlatformSSOCore44POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly_encryptionAlgorithm));
}

uint64_t sub_259E6E088(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v67 = a3;
  uint64_t v54 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v55 = (char *)v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_259E99FA8();
  uint64_t v51 = *(void *)(v6 - 8);
  uint64_t v52 = v6;
  MEMORY[0x270FA5388](v6);
  unint64_t v57 = (char *)v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_259E99F38();
  uint64_t v58 = *(void *)(v8 - 8);
  uint64_t v59 = v8;
  MEMORY[0x270FA5388](v8);
  unint64_t v65 = (char *)v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_259E99E88();
  uint64_t v70 = *(void *)(v10 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  unint64_t v53 = (char *)v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v61 = (char *)v44 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v44 - v15;
  uint64_t v66 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v18 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v19 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v21 = (char *)v44 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)v44 - v22;
  uint64_t v56 = a1;
  sub_259E99DD8();
  sub_259E99E68();
  uint64_t v64 = sub_259E6E818(0x74616420656D6F53uLL, 0xE900000000000061);
  unint64_t v60 = v24;
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v21, v23, AssociatedTypeWitness);
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v70 + 16);
  uint64_t v63 = v10;
  v25(v61, v16, v10);
  swift_getAssociatedConformanceWitness();
  uint64_t v26 = v62;
  sub_259E99EF8();
  if (v26)
  {
    sub_259E5D850(v64, v60);
    (*(void (**)(char *, uint64_t))(v70 + 8))(v16, v63);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v23, AssociatedTypeWitness);
  }
  else
  {
    unint64_t v47 = (void (*)(char *, char *))v25;
    uint64_t v49 = v18;
    uint64_t v50 = v23;
    uint64_t v61 = (char *)AssociatedTypeWitness;
    unint64_t v62 = v16;
    uint64_t v27 = sub_259E99F08();
    unint64_t v48 = v28;
    unint64_t v29 = v60;
    uint64_t v68 = v64;
    unint64_t v69 = v60;
    unint64_t v30 = sub_259E60120();
    uint64_t v31 = sub_259E99F28();
    v44[1] = v30;
    uint64_t v45 = v31;
    unint64_t v46 = v33;
    unint64_t v34 = v48;
    (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v55, v56, v66);
    v47(v53, v62);
    sub_259E5D7F8(v27, v34);
    sub_259E99F78();
    uint64_t v67 = v27;
    unint64_t v35 = v29;
    uint64_t v68 = v45;
    unint64_t v69 = v46;
    uint64_t v36 = sub_259E99F98();
    uint64_t v37 = v70;
    uint64_t v38 = v49;
    uint64_t v39 = v58;
    uint64_t v40 = v59;
    uint64_t v41 = v36;
    unint64_t v43 = v42;
    sub_259E5D850(v64, v35);
    sub_259E5D850(v67, v34);
    sub_259E5D850(v41, v43);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v57, v52);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v65, v40);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v62, v63);
    (*(void (**)(char *, char *))(v38 + 8))(v50, v61);
    sub_259E5D850(v45, v46);
  }
  return 1;
}

uint64_t sub_259E6E818(unint64_t a1, unint64_t a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F70F0);
  if (swift_dynamicCast())
  {
    sub_259E6FF88(v38, (uint64_t)&v41);
    __swift_project_boxed_opaque_existential_1(&v41, v43);
    sub_259E99B58();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  sub_259E5E234((uint64_t)v38, &qword_26A3F70F8);
  unint64_t v2 = a1;
  unint64_t v3 = a2;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = a1;
      uint64_t v42 = a2 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v6 = (char *)&v41 + (HIBYTE(a2) & 0xF);
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
        uint64_t v4 = sub_259E9A218();
      }
      if (v4) {
        uint64_t v6 = (unsigned char *)(v4 + v5);
      }
      else {
        uint64_t v6 = 0;
      }
      uint64_t v7 = (uint64_t *)v4;
    }
    uint64_t v8 = sub_259E6F360(v7, v6);
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
    uint64_t v11 = sub_259E9A128();
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
    uint64_t v11 = HIBYTE(v3) & 0xF;
  }
  else {
    uint64_t v11 = v2 & 0xFFFFFFFFFFFFLL;
  }
LABEL_17:
  *(void *)&v38[0] = sub_259E6F3C4(v11);
  *((void *)&v38[0] + 1) = v12;
  MEMORY[0x270FA5388](*(void *)&v38[0]);
  unint64_t v13 = (unint64_t)sub_259E6EE30((void *(*)(uint64_t *__return_ptr, char *, char *))sub_259E6FF1C);
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
        sub_259E99BA8();
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
      unint64_t v2 = sub_259E6F258(v19, v17, v18);
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
      unint64_t v2 = sub_259E9A158();
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
        unint64_t v2 = sub_259E9A218();
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
    unint64_t v2 = sub_259E6F258(v19, v17, v18);
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
    unint64_t v2 = sub_259E9A138();
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
      sub_259E99BB8();
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
    sub_259E99BB8();
    sub_259E5D8A8(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  sub_259E5D8A8((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

id POCurve25519Verify.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id POCurve25519Verify.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id _s15PlatformSSOCore44POCryptoKitHPKE_Curve25519_SHA256_ChachaPolyCfD_0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

char *sub_259E6EE30(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  void v16[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)id v1 = xmmword_259EA1280;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (sub_259E99B08() && __OFSUB__((int)v4, sub_259E99B38())) {
        goto LABEL_24;
      }
      sub_259E99B48();
      swift_allocObject();
      uint64_t v13 = sub_259E99AE8();
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
      Swift::String result = sub_259E6F1A4((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        *uint64_t v5 = v4;
        goto LABEL_19;
      }
      *uint64_t v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      sub_259E99B78();
      Swift::String result = sub_259E6F1A4(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        *id v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        *id v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      Swift::String result = (char *)a1(&v14, (char *)v16, (char *)v16);
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
      Swift::String result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        Swift::String result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      *id v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

void *sub_259E6F134(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    Swift::String result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  Swift::String result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *sub_259E6F1A4(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  Swift::String result = (char *)sub_259E99B08();
  if (!result) {
    goto LABEL_12;
  }
  unint64_t v8 = result;
  Swift::String result = (char *)sub_259E99B38();
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
  uint64_t v12 = sub_259E99B28();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  Swift::String result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

uint64_t sub_259E6F258(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_259E9A168();
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
    uint64_t v5 = MEMORY[0x25A2ECCB0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_259E6F2D4@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    Swift::String result = sub_259E9A208();
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = result;
      Swift::String result = swift_bridgeObjectRelease();
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

unsigned char *sub_259E6F360(unsigned char *result, unsigned char *a2)
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
      return (unsigned char *)sub_259E60C74(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)sub_259E60D38((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)sub_259E60DB4((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_259E6F3C4(uint64_t result)
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
      sub_259E99B48();
      swift_allocObject();
      sub_259E99B18();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_259E99B98();
        Swift::String result = swift_allocObject();
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

uint64_t sub_259E6F464(uint64_t a1, uint64_t (*a2)(void), unint64_t a3, char *a4)
{
  uint64_t v61 = a4;
  unint64_t v66 = a3;
  uint64_t v5 = a2(0);
  uint64_t v56 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v57 = (char *)v46 - v6;
  uint64_t v7 = sub_259E99FA8();
  uint64_t v53 = *(void *)(v7 - 8);
  uint64_t v54 = v7;
  MEMORY[0x270FA5388](v7);
  unint64_t v60 = (char *)v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_259E99F38();
  uint64_t v62 = *(void *)(v9 - 8);
  uint64_t v63 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v67 = (char *)v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_259E99E88();
  uint64_t v70 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v55 = (char *)v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v46 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v46 - v17;
  uint64_t v19 = sub_259E99C78();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  BOOL v23 = (char *)v46 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  unint64_t v25 = (char *)v46 - v24;
  uint64_t v58 = a1;
  uint64_t v59 = v5;
  sub_259E99DD8();
  sub_259E99E68();
  uint64_t v65 = sub_259E6E818(0x74616420656D6F53uLL, 0xE900000000000061);
  unint64_t v66 = v26;
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v23, v25, v19);
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v70 + 16);
  v27(v16, v18, v11);
  uint64_t v28 = v64;
  sub_259E99EF8();
  if (v28)
  {
    sub_259E5D850(v65, v66);
    (*(void (**)(char *, uint64_t))(v70 + 8))(v18, v11);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v25, v19);
  }
  else
  {
    uint64_t v49 = v27;
    uint64_t v50 = v20;
    uint64_t v51 = v25;
    uint64_t v52 = v19;
    uint64_t v64 = v11;
    uint64_t v29 = sub_259E99F08();
    unint64_t v31 = v30;
    uint64_t v68 = v65;
    unint64_t v69 = v66;
    unint64_t v32 = sub_259E60120();
    uint64_t v33 = sub_259E99F28();
    v46[1] = v32;
    uint64_t v47 = v33;
    unint64_t v48 = v35;
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v57, v58, v59);
    uint64_t v36 = v18;
    v49(v55, v18, v64);
    sub_259E5D7F8(v29, v31);
    uint64_t v37 = v60;
    sub_259E99F78();
    unint64_t v38 = v31;
    uint64_t v61 = v36;
    uint64_t v68 = v47;
    unint64_t v69 = v48;
    uint64_t v39 = sub_259E99F98();
    unint64_t v41 = v40;
    uint64_t v42 = v70;
    uint64_t v43 = v50;
    uint64_t v44 = v62;
    uint64_t v45 = v39;
    sub_259E5D850(v65, v66);
    sub_259E5D850(v29, v38);
    sub_259E5D850(v45, v41);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v37, v54);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v67, v63);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v61, v64);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v51, v52);
    sub_259E5D850(v47, v48);
  }
  return 1;
}

uint64_t _s15PlatformSSOCore18POCurve25519VerifyC9verifyKeyySbSo03SecF3RefaF_0(void *a1)
{
  uint64_t v2 = sub_259E99C98();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_259E99D28();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(self, sel_isSEPKey_, a1))
  {
    id v10 = a1;
    sub_259E99D18();
    char v19 = sub_259E6F464((uint64_t)v9, MEMORY[0x263F04658], MEMORY[0x263F04648], MEMORY[0x263F04650]);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    CFDataRef v11 = SecKeyCopyExternalRepresentation((SecKeyRef)a1, 0);
    if (v11)
    {
      CFDataRef v12 = v11;
      uint64_t v13 = sub_259E99BE8();
      unint64_t v15 = v14;

      v20[1] = v13;
      v20[2] = v15;
      sub_259E5D7F8(v13, v15);
      sub_259E99C88();
      char v19 = sub_259E6F464((uint64_t)v5, MEMORY[0x263F04580], MEMORY[0x263F04570], MEMORY[0x263F04578]);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      sub_259E5D850(v13, v15);
    }
    else
    {
      if (qword_26A3F83D0 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_259E99C48();
      __swift_project_value_buffer(v16, (uint64_t)qword_26A3F83D8);
      id v17 = Logger.PSSO_ERROR(code:description:)(-1005);
      swift_willThrow();

      char v19 = 0;
    }
  }
  return v19 & 1;
}

uint64_t sub_259E6FE60()
{
  return type metadata accessor for POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly();
}

uint64_t type metadata accessor for POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly()
{
  uint64_t result = qword_26A3F83F0;
  if (!qword_26A3F83F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_259E6FEB4()
{
  return swift_updateClassMetadata2();
}

uint64_t type metadata accessor for POCurve25519Verify()
{
  return self;
}

void *sub_259E6FF1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  uint64_t result = sub_259E6F134((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_259E6FFA0, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_259E6FF88(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_259E6FFA0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_259E6F2D4(a1, a2);
}

uint64_t lib_platform_rng()
{
  uint64_t v0 = ccrng();
  REQUIRE_func(v0 != 0, 22, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform_lib.c");
  REQUIRE_func(0, 23, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform_lib.c");
  return v0;
}

uint64_t lib_platform_read_random(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = *(unsigned int (**)(uint64_t, void, uint64_t))platform_rng();
  uint64_t v5 = platform_rng();
  BOOL v6 = v4(v5, a2, a1) == 0;
  return REQUIRE_func(v6, 31, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform_lib.c");
}

uint64_t rfc3394_wrap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t), uint64_t *a5, unint64_t a6, void *a7, unint64_t *a8)
{
  uint64_t v42 = a1;
  uint64_t v43 = a3;
  uint64_t v46 = *MEMORY[0x263EF8340];
  memset(__s, 0, sizeof(__s));
  uint64_t v14 = ccaes_cbc_encrypt_mode();
  MEMORY[0x270FA5388](v14);
  uint64_t v44 = (uint64_t)&v37 - v15;
  bzero((char *)&v37 - v15, v15);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v37 - v17;
  bzero((char *)&v37 - v17, v17);
  uint64_t v19 = 0xFFFFFFFFLL;
  if (HIDWORD(a6) || (a6 - 40) < 0xFFFFFFE0) {
    goto LABEL_30;
  }
  unint64_t v40 = &v37;
  unint64_t v41 = a8;
  uint64_t v39 = a7;
  if (!a4)
  {
    BOOL v21 = (a2 & 0xFFFFFFFFFFFFFFF7) == 0x10 || a2 == 32;
    if (!v21 || !a8 || *a8 < a6 + 8)
    {
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      goto LABEL_31;
    }
    unint64_t v38 = a6 + 8;
    cccbc_init();
    goto LABEL_15;
  }
  if (a8)
  {
    unint64_t v20 = *v41;
    unint64_t v38 = a6 + 8;
    if (v20 >= a6 + 8)
    {
LABEL_15:
      uint64_t v22 = 0;
      unsigned int v23 = a6 >> 3;
      if (a6 >> 3 <= 1) {
        uint64_t v24 = 1;
      }
      else {
        uint64_t v24 = v23;
      }
      do
      {
        uint64_t v25 = *a5++;
        *((void *)&__s[v22++] + 1) = v25;
      }
      while (v24 != v22);
      uint64_t v26 = 0;
      *(void *)&__s[0] = v43;
      uint64_t v27 = 1;
      uint64_t v42 = v23;
      do
      {
        uint64_t v43 = v26;
        uint64_t v28 = 0;
        uint64_t v29 = (uint64_t *)__s;
        do
        {
          if (a4)
          {
            if ((a4(1, &firebloom_null_iv, v29, v29, 16) & 1) == 0) {
              goto LABEL_6;
            }
          }
          else
          {
            cccbc_clear_iv();
            firebloom_cbc_update_f(v14, v44, (uint64_t)v18, 0x10uLL);
          }
          uint64_t v30 = *v29;
          v29 += 2;
          unint64_t v31 = v30 ^ bswap64(v27 + v28++);
          *(void *)&__s[v28 % v23] = v31;
        }
        while (v24 != v28);
        uint64_t v26 = v43 + 1;
        v27 += v42;
      }
      while (v43 != 5);
      unint64_t v32 = v39;
      *uint64_t v39 = *(void *)&__s[0];
      uint64_t v33 = v32 + 1;
      uint64_t v34 = (uint64_t *)__s + 1;
      do
      {
        uint64_t v35 = *v34;
        v34 += 2;
        *v33++ = v35;
        --v24;
      }
      while (v24);
      uint64_t v19 = 0;
      *unint64_t v41 = v38 & 0xFFFFFFF8;
LABEL_30:
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      if (a4) {
        return v19;
      }
LABEL_31:
      cc_clear();
      return v19;
    }
  }
LABEL_6:
  memset_s(__s, 0x40uLL, 0, 0x40uLL);
  return 0xFFFFFFFFLL;
}

uint64_t rfc3394_wrap_legacy(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t), uint64_t *a5, unsigned int a6, void *a7, _DWORD *a8)
{
  unint64_t v11 = *a8;
  uint64_t v9 = rfc3394_wrap(a1, a2, a3, a4, a5, a6, a7, &v11);
  REQUIRE_func(HIDWORD(v11) == 0, 171, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/aeskeywrap.c");
  *a8 = v11;
  return v9;
}

uint64_t rfc3394_unwrap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void, void *, unint64_t *, unint64_t *, uint64_t), void *a5, unint64_t a6, void *a7, void *a8)
{
  uint64_t v46 = a5;
  uint64_t v44 = a1;
  uint64_t v49 = *MEMORY[0x263EF8340];
  memset(__s, 0, sizeof(__s));
  uint64_t v14 = ccaes_cbc_decrypt_mode();
  MEMORY[0x270FA5388](v14);
  uint64_t v47 = (uint64_t)&v38 - v15;
  bzero((char *)&v38 - v15, v15);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v38 - v17;
  bzero((char *)&v38 - v17, v17);
  uint64_t v19 = 0xFFFFFFFFLL;
  if (HIDWORD(a6)) {
    goto LABEL_33;
  }
  uint64_t v40 = a3;
  unsigned int v20 = a6 >> 3;
  if ((a6 >> 3) - 6 < 0xFFFFFFFC) {
    goto LABEL_33;
  }
  unint64_t v41 = &v38;
  uint64_t v42 = a8;
  uint64_t v39 = a7;
  unint64_t v45 = a6;
  if (!a4)
  {
    BOOL v21 = (a2 & 0xFFFFFFFFFFFFFFF7) == 0x10 || a2 == 32;
    if (!v21 || !a8 || *a8 < a6 - 8)
    {
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      goto LABEL_34;
    }
    cccbc_init();
    goto LABEL_15;
  }
  if (a8 && *v42 >= v45 - 8)
  {
LABEL_15:
    *(void *)&__s[0] = *v46;
    uint64_t v22 = v20 - 1;
    if (v20 != 1)
    {
      unsigned int v23 = (void *)__s + 1;
      uint64_t v24 = v46 + 1;
      uint64_t v25 = v20 - 1;
      do
      {
        uint64_t v26 = *v24++;
        *unsigned int v23 = v26;
        v23 += 2;
        --v25;
      }
      while (v25);
    }
    int v27 = 6 * v20 - 6;
    LODWORD(v44) = 1 - v20;
    int v28 = 5;
    uint64_t v43 = (unint64_t *)&__s[v20 - 2];
    do
    {
      LODWORD(v46) = v28;
      if (v45 >= 0x10)
      {
        uint64_t v29 = v43;
        int v30 = v22;
        unsigned int v31 = v27;
        do
        {
          *uint64_t v29 = *(void *)&__s[v30 % v22] ^ bswap64(v31);
          if (a4)
          {
            if ((a4(0, &firebloom_null_iv, v29, v29, 16) & 1) == 0) {
              goto LABEL_6;
            }
          }
          else
          {
            cccbc_clear_iv();
            firebloom_cbc_update_f(v14, v47, (uint64_t)v18, 0x10uLL);
          }
          --v31;
          v29 -= 2;
          BOOL v32 = __OFSUB__(v30--, 1);
        }
        while (!((v30 < 0) ^ v32 | (v30 == 0)));
      }
      int v28 = v46 - 1;
      v27 += v44;
    }
    while (v46);
    if (*(void *)&__s[0] == v40)
    {
      uint64_t v33 = v39;
      if (v22)
      {
        uint64_t v34 = (uint64_t *)__s + 1;
        uint64_t v35 = v22;
        do
        {
          uint64_t v36 = *v34;
          v34 += 2;
          *v33++ = v36;
          --v35;
        }
        while (v35);
      }
      uint64_t v19 = 0;
      *uint64_t v42 = (8 * v22);
    }
    else
    {
      uint64_t v19 = 0xFFFFFFFFLL;
    }
LABEL_33:
    memset_s(__s, 0x40uLL, 0, 0x40uLL);
    if (a4) {
      return v19;
    }
LABEL_34:
    cc_clear();
    return v19;
  }
LABEL_6:
  memset_s(__s, 0x40uLL, 0, 0x40uLL);
  return 0xFFFFFFFFLL;
}

uint64_t rfc3394_unwrap_legacy(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(void, void *, unint64_t *, unint64_t *, uint64_t), void *a5, unsigned int a6, void *a7, _DWORD *a8)
{
  uint64_t v11 = *a8;
  uint64_t v9 = rfc3394_unwrap(a1, a2, a3, a4, a5, a6, a7, &v11);
  REQUIRE_func(HIDWORD(v11) == 0, 261, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/aeskeywrap.c");
  *a8 = v11;
  return v9;
}

uint64_t rfc3394_wrapped_size_legacy(unsigned int a1, _DWORD *a2)
{
  uint64_t v2 = a1 + 15;
  uint64_t v3 = v2 << 31 >> 31;
  BOOL v4 = v3 != v2 || v3 < 0;
  int v5 = v4;
  if (!v4) {
    *a2 = v3 & 0xFFFFFFF8;
  }
  return v5 ^ 1u;
}

uint64_t rfc3394_wrapped_size(unint64_t a1, unint64_t *a2)
{
  uint64_t v2 = a1 >= 0xFFFFFFFFFFFFFFF1;
  BOOL v3 = v2 << 63 >> 63 != v2 || v2 << 63 >> 63 == -1;
  int v4 = v3;
  if (!v3) {
    *a2 = (a1 + 15) & 0xFFFFFFFFFFFFFFF8;
  }
  return v4 ^ 1u;
}

BOOL rfc3394_unwrapped_size_legacy(unsigned int a1, unsigned int *a2)
{
  unsigned int v2 = a1 - 8;
  BOOL result = a1 > 7;
  *a2 = v2;
  return result;
}

BOOL rfc3394_unwrapped_size(unint64_t a1, unint64_t *a2)
{
  unint64_t v2 = a1 - 8;
  BOOL result = a1 > 7;
  *a2 = v2;
  return result;
}

uint64_t aks_fv_new_vek(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  int v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v12 = v1;
  v23[0] = *MEMORY[0x263EF8340];
  bzero(__s, 0x1000uLL);
  *(void *)&long long v19 = __s;
  *((void *)&v19 + 1) = v23;
  size_t v20 = 4096;
  uint64_t v13 = 3758097090;
  if (v7 && v5)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (!aks_client_connection)
    {
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_new_vek", ":", 179, "", 0, "", "");
      uint64_t v13 = 3758097084;
      goto LABEL_16;
    }
    mach_port_t v15 = aks_client_connection;
    if (!ccder_blob_encode_body_tl()
      || !der_utils_encode_fv_data(&v19, v9)
      || !der_utils_encode_fv_data(&v19, v11)
      || !der_utils_encode_fv_params(&v19, v12)
      || !ccder_blob_encode_tl())
    {
      goto LABEL_14;
    }
    input[0] = *((void *)&v19 + 1);
    input[1] = (uint64_t)v23 - *((void *)&v19 + 1);
    uint64_t v16 = IOConnectCallMethod(v15, 0x4Au, input, 2u, 0, 0, 0, 0, __s, &v20);
    if (v16)
    {
      uint64_t v13 = v16;
      goto LABEL_16;
    }
    *(void *)&long long v18 = __s;
    *((void *)&v18 + 1) = &__s[v20];
    if (!ccder_blob_decode_range() || !der_utils_decode_fv_data(&v18, 0, v5)) {
      goto LABEL_14;
    }
    if (!v3)
    {
      uint64_t v13 = 0;
      goto LABEL_16;
    }
    uint64_t v13 = 0;
    if ((der_utils_decode_fv_key(&v18, 0, v3) & 1) == 0) {
LABEL_14:
    }
      uint64_t v13 = 3758097098;
  }
LABEL_16:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v13;
}

uint64_t get_aks_client_connection()
{
  if (get_aks_client_dispatch_queue_onceToken != -1) {
    dispatch_once(&get_aks_client_dispatch_queue_onceToken, &__block_literal_global_173);
  }
  dispatch_sync((dispatch_queue_t)get_aks_client_dispatch_queue_connection_queue, &__block_literal_global_152);
  uint64_t result = get_aks_client_connection_connection;
  if (!get_aks_client_connection_connection)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return get_aks_client_connection_connection;
  }
  return result;
}

unint64_t _aks_save_file(char *a1, const void *a2, size_t a3)
{
  unint64_t v3 = (unint64_t)a1;
  if (a1)
  {
    int v6 = open_dprotected_np(a1, 1793, 4, 0, 384);
    if (v6 == -1)
    {
      uint64_t v10 = __error();
      uint64_t v11 = strerror(*v10);
      syslog(3, "could not create file: %s (%s)\n", (const char *)v3, v11);
      return 0;
    }
    else
    {
      int v7 = v6;
      ssize_t v8 = write(v6, a2, a3);
      unint64_t v3 = v8 != -1;
      if (v8 == -1)
      {
        uint64_t v12 = __error();
        uint64_t v13 = strerror(*v12);
        syslog(3, "failed to write restore bag to disk %s\n", v13);
      }
      close(v7);
    }
  }
  return v3;
}

const char *_aks_load_file(char *a1, void *a2, size_t *a3)
{
  unint64_t v3 = a1;
  memset(&v14, 0, sizeof(v14));
  if (a1)
  {
    if (!stat(a1, &v14))
    {
      size_t st_size = v14.st_size;
      int v7 = open(v3, 0);
      if (v7 == -1)
      {
        uint64_t v12 = __error();
        uint64_t v13 = strerror(*v12);
        syslog(3, "could not open file: %s (%s)\n", v3, v13);
      }
      else
      {
        int v8 = v7;
        uint64_t v9 = calloc(st_size, 1uLL);
        unint64_t v3 = (const char *)(v9 != 0);
        if (!v9)
        {
LABEL_7:
          close(v8);
          return v3;
        }
        uint64_t v10 = v9;
        if (read(v8, v9, st_size) == st_size)
        {
          *a2 = v10;
          *a3 = st_size;
          goto LABEL_7;
        }
        close(v8);
        free(v10);
      }
    }
    return 0;
  }
  return v3;
}

uint64_t aks_delete_xart_leak(unsigned int a1, const void *a2)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x6Cu, input, 1u, a2, 0x10uLL, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_delete_xart_leak", ":", 268, "", 0, "", "");
  return 3758097084;
}

char *_iterate_path(char *result, uint64_t a2, uint64_t a3)
{
  v9[2] = *(char **)MEMORY[0x263EF8340];
  if (result)
  {
    v9[0] = result;
    v9[1] = 0;
    uint64_t result = (char *)fts_open(v9, 84, 0);
    if (result)
    {
      int v5 = (FTS *)result;
      int v6 = fts_read((FTS *)result);
      if (v6)
      {
        int v7 = v6;
        do
        {
          int fts_info = v7->fts_info;
          if (fts_info != 6)
          {
            if (fts_info == 1)
            {
              if (a2)
              {
                if (((*(uint64_t (**)(uint64_t, FTSENT *))(a2 + 16))(a2, v7) & 1) == 0) {
                  fts_set(v5, v7, 4);
                }
              }
            }
            else if (a3 && fts_info == 8)
            {
              (*(void (**)(uint64_t, FTSENT *))(a3 + 16))(a3, v7);
            }
          }
          int v7 = fts_read(v5);
        }
        while (v7);
      }
      return (char *)fts_close(v5);
    }
  }
  return result;
}

char *aks_dump_path(char *result, int a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (result)
  {
    unint64_t v3 = result;
    bzero(v8, 0x400uLL);
    uint64_t result = realpath_DARWIN_EXTSN(v3, v8);
    if (result)
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 0x40000000;
      v6[2] = __aks_dump_path_block_invoke;
      v6[3] = &__block_descriptor_tmp;
      int v7 = a2;
      v4[0] = MEMORY[0x263EF8330];
      v4[1] = 0x40000000;
      v4[2] = __aks_dump_path_block_invoke_2;
      v4[3] = &__block_descriptor_tmp_127;
      int v5 = a2;
      return _iterate_path(v8, (uint64_t)v6, (uint64_t)v4);
    }
  }
  return result;
}

uint64_t __aks_dump_path_block_invoke(uint64_t a1, uint64_t a2)
{
  int path_class = _get_path_class(*(const char **)(a2 + 48));
  int v5 = *(_DWORD *)(a1 + 32);
  if (v5 == -1 || path_class == v5) {
    printf(" dir: %s %i\n", *(const char **)(a2 + 48), path_class);
  }
  return 1;
}

uint64_t _get_path_class(const char *a1)
{
  int v1 = open_dprotected_np(a1, 0, 0, 1);
  if (v1 == -1) {
    return 0xFFFFFFFFLL;
  }
  int v2 = v1;
  uint64_t v3 = fcntl(v1, 63);
  if ((v2 & 0x80000000) == 0) {
    close(v2);
  }
  return v3;
}

uint64_t __aks_dump_path_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = _get_path_class(*(const char **)(a2 + 48));
  int v5 = *(_DWORD *)(a1 + 32);
  if (v5 == -1 || result == v5) {
    return printf("file: %s %i\n", *(const char **)(a2 + 48), result);
  }
  return result;
}

uint64_t aks_fs_supports_enhanced_apfs()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  io_registry_entry_t v0 = IORegistryEntryFromPath(*MEMORY[0x263F0EC90], "IODeviceTree:/filesystems");
  if (v0)
  {
    io_object_t v1 = v0;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v0, @"e-apfs", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    BOOL v3 = CFProperty != 0;
    if (CFProperty) {
      CFRelease(CFProperty);
    }
    IOObjectRelease(v1);
  }
  else
  {
    BOOL v3 = 0;
  }
  size_t __len = 1023;
  bzero(__big, 0x400uLL);
  if ((_aks_check_apfs_shared_datavolume_bootarg_init & 1) == 0)
  {
    if (!sysctlbyname("kern.bootargs", __big, &__len, 0, 0) && strnstr(__big, "-apfs_shared_datavolume", __len)) {
      _aks_check_apfs_shared_datavolume_bootarg_value = 1;
    }
    _aks_check_apfs_shared_datavolume_bootarg_init = 1;
  }
  unsigned int v4 = _aks_check_apfs_shared_datavolume_bootarg_value;
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s ioreg: %d, boot_arg: %d%s\n", "aks", "", "", "", "aks_fs_supports_enhanced_apfs", ":", 437, "", 0, "", v3, _aks_check_apfs_shared_datavolume_bootarg_value, "");
  return v3 | v4;
}

uint64_t aks_fs_status(const char *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  bzero(v4, 0x400uLL);
  bzero(__str, 0x400uLL);
  if (realpath_DARWIN_EXTSN(a1, v4))
  {
    snprintf(__str, 0x400uLL, "%s/mobile", v4);
    aks_fs_status_with_map(v4, (uint64_t)&sharedPathMap, 35);
    if ((aks_fs_supports_enhanced_apfs() & 1) == 0) {
      aks_fs_status_with_map(__str, (uint64_t)&userPathMap, 72);
    }
  }
  return 0;
}

void aks_fs_status_with_map(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  bzero(__str, 0x400uLL);
  memset(&v7, 0, sizeof(v7));
  if (a3)
  {
    uint64_t v6 = a2 + 16;
    do
    {
      snprintf(__str, 0x400uLL, "%s%s", a1, *(const char **)(v6 - 16));
      if (stat(__str, &v7))
      {
        printf("stat failed: %s\n");
      }
      else
      {
        _get_path_class(__str);
        printf("%s: mode=%o, u/g=%i:%i class=%i%s\n");
      }
      v6 += 48;
      --a3;
    }
    while (a3);
  }
}

uint64_t aks_user_fs_status(const char *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  bzero(v3, 0x400uLL);
  if (realpath_DARWIN_EXTSN(a1, v3)) {
    aks_fs_status_with_map(v3, (uint64_t)&userPathMap, 72);
  }
  return 0;
}

const char *aks_show_allowlist()
{
  puts("shared allow list:");
  aks_show_allowlist_with_map("<var>", (uint64_t)&sharedPathMap, 35);
  puts("user allow list:");
  return aks_show_allowlist_with_map("<user>", (uint64_t)&userPathMap, 72);
}

const char *aks_show_allowlist_with_map(const char *result, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    uint64_t v4 = result;
    uint64_t v5 = (const char **)(a2 + 16);
    uint64_t v6 = (const char **)(a2 + 16);
    do
    {
      char v7 = *(unsigned char *)v6;
      v6 += 6;
      if (v7) {
        uint64_t result = (const char *)printf("%s%s\n", v4, *(v5 - 2));
      }
      uint64_t v5 = v6;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t aks_fv_new_kek(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unsigned int v9 = v8;
  uint64_t v10 = v1;
  uint64_t v21 = *MEMORY[0x263EF8340];
  bzero(__s, 0x1000uLL);
  *(void *)&long long v17 = __s;
  *((void *)&v17 + 1) = &v21;
  size_t v18 = 4096;
  uint64_t v11 = 3758097090;
  if (v5 && v3)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      mach_port_t v13 = aks_client_connection;
      if (!ccder_blob_encode_body_tl()
        || !der_utils_encode_fv_data(&v17, v7)
        || !der_utils_encode_fv_params(&v17, v10)
        || !ccder_blob_encode_tl())
      {
        goto LABEL_10;
      }
      input[0] = v9;
      input[1] = *((void *)&v17 + 1);
      uint64_t input[2] = (uint64_t)&v21 - *((void *)&v17 + 1);
      uint64_t v14 = IOConnectCallMethod(v13, 0x4Cu, input, 3u, 0, 0, 0, 0, __s, &v18);
      if (v14)
      {
        uint64_t v11 = v14;
        goto LABEL_12;
      }
      *(void *)&long long v16 = __s;
      *((void *)&v16 + 1) = &__s[v18];
      if (!ccder_blob_decode_range() || (uint64_t v11 = 0, (der_utils_decode_fv_data(&v16, 0, v3) & 1) == 0)) {
LABEL_10:
      }
        uint64_t v11 = 3758097098;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_new_kek", ":", 508, "", 0, "", "");
      uint64_t v11 = 3758097084;
    }
  }
LABEL_12:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v11;
}

uint64_t aks_fv_new_sibling_vek(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = v1;
  uint64_t v21 = *MEMORY[0x263EF8340];
  bzero(__s, 0x1000uLL);
  *(void *)&long long v17 = __s;
  *((void *)&v17 + 1) = &v21;
  size_t v18 = 4096;
  uint64_t v11 = 3758097090;
  if (v7 && v5)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (!aks_client_connection)
    {
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_new_sibling_vek", ":", 543, "", 0, "", "");
      uint64_t v11 = 3758097084;
      goto LABEL_15;
    }
    mach_port_t v13 = aks_client_connection;
    if (!ccder_blob_encode_body_tl()
      || !der_utils_encode_fv_data(&v17, v9)
      || !der_utils_encode_fv_params(&v17, v10)
      || !ccder_blob_encode_tl())
    {
      goto LABEL_13;
    }
    input[0] = *((void *)&v17 + 1);
    input[1] = (uint64_t)&v21 - *((void *)&v17 + 1);
    uint64_t v14 = IOConnectCallMethod(v13, 0x63u, input, 2u, 0, 0, 0, 0, __s, &v18);
    if (v14)
    {
      uint64_t v11 = v14;
      goto LABEL_15;
    }
    *(void *)&long long v16 = __s;
    *((void *)&v16 + 1) = &__s[v18];
    if (!ccder_blob_decode_range() || !der_utils_decode_fv_data(&v16, 0, v5)) {
      goto LABEL_13;
    }
    if (!v3)
    {
      uint64_t v11 = 0;
      goto LABEL_15;
    }
    uint64_t v11 = 0;
    if ((der_utils_decode_fv_key(&v16, 0, v3) & 1) == 0) {
LABEL_13:
    }
      uint64_t v11 = 3758097098;
  }
LABEL_15:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v11;
}

uint64_t aks_fv_rewrap_kek(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v12 = v1;
  v23[0] = *MEMORY[0x263EF8340];
  bzero(__s, 0x1000uLL);
  *(void *)&long long v19 = __s;
  *((void *)&v19 + 1) = v23;
  size_t v20 = 4096;
  uint64_t v13 = 3758097090;
  if (v9 && v7 && v5 && v3)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      mach_port_t v15 = aks_client_connection;
      if (!der_utils_encode_fv_data(&v19, v5)
        || !ccder_blob_encode_body_tl()
        || !der_utils_encode_fv_data(&v19, v9)
        || !der_utils_encode_fv_data(&v19, v11)
        || !der_utils_encode_fv_params(&v19, v12)
        || !ccder_blob_encode_tl())
      {
        goto LABEL_14;
      }
      input[0] = *((void *)&v19 + 1);
      input[1] = (uint64_t)v23 - *((void *)&v19 + 1);
      uint64_t v16 = IOConnectCallMethod(v15, 0x4Du, input, 2u, 0, 0, 0, 0, __s, &v20);
      if (v16)
      {
        uint64_t v13 = v16;
        goto LABEL_16;
      }
      *(void *)&long long v18 = __s;
      *((void *)&v18 + 1) = &__s[v20];
      if (!ccder_blob_decode_range() || (uint64_t v13 = 0, (der_utils_decode_fv_data(&v18, 0, v3) & 1) == 0)) {
LABEL_14:
      }
        uint64_t v13 = 3758097098;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_rewrap_kek", ":", 582, "", 0, "", "");
      uint64_t v13 = 3758097084;
    }
  }
LABEL_16:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v13;
}

uint64_t aks_fv_set_protection(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  long long v19 = v2;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  unsigned int v12 = v11;
  uint64_t v13 = v1;
  v25[0] = *MEMORY[0x263EF8340];
  uint64_t v14 = 3758097098;
  bzero(__s, 0x1000uLL);
  *(void *)&long long v21 = __s;
  *((void *)&v21 + 1) = v25;
  size_t v22 = 4096;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_set_protection", ":", 616, "", 0, "", "");
    uint64_t v14 = 3758097084;
    goto LABEL_14;
  }
  mach_port_t v16 = aks_client_connection;
  if (der_utils_encode_fv_data(&v21, v4)
    && der_utils_encode_fv_data(&v21, v6)
    && der_utils_encode_fv_data(&v21, v8)
    && der_utils_encode_fv_params(&v21, v13)
    && ccder_blob_encode_tl())
  {
    input[0] = v12;
    input[1] = v10;
    uint64_t input[2] = *((void *)&v21 + 1);
    uint64_t input[3] = (uint64_t)v25 - *((void *)&v21 + 1);
    uint64_t v17 = IOConnectCallMethod(v16, 0x54u, input, 4u, 0, 0, 0, 0, __s, &v22);
    if (v17)
    {
      uint64_t v14 = v17;
      goto LABEL_14;
    }
    *(void *)&long long v20 = __s;
    *((void *)&v20 + 1) = &__s[v22];
    if (!v22) {
      goto LABEL_13;
    }
    if (!ccder_blob_decode_range()) {
      goto LABEL_14;
    }
    if (!v19)
    {
LABEL_13:
      uint64_t v14 = 0;
      goto LABEL_14;
    }
    uint64_t v14 = 0;
    if ((der_utils_decode_fv_data(&v20, 0, v19) & 1) == 0) {
      uint64_t v14 = 3758097098;
    }
  }
LABEL_14:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v14;
}

uint64_t aks_fv_unwrap_vek_with_acm(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  unsigned int v13 = v12;
  uint64_t v14 = v1;
  v25[0] = *MEMORY[0x263EF8340];
  bzero(__s, 0x1000uLL);
  *(void *)&long long v21 = __s;
  *((void *)&v21 + 1) = v25;
  size_t v22 = 4096;
  if (!v7)
  {
    uint64_t v18 = 3758097090;
    goto LABEL_15;
  }
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_unwrap_vek_with_acm", ":", 653, "", 0, "", "");
    uint64_t v18 = 3758097084;
    goto LABEL_15;
  }
  mach_port_t v16 = aks_client_connection;
  if (!der_utils_encode_fv_data(&v21, v5)
    || !der_utils_encode_fv_data(&v21, v7)
    || !der_utils_encode_fv_data(&v21, v9)
    || !der_utils_encode_fv_data(&v21, v11)
    || !der_utils_encode_fv_params(&v21, v14)
    || !ccder_blob_encode_tl())
  {
    goto LABEL_13;
  }
  input[0] = *((void *)&v21 + 1);
  input[1] = (uint64_t)v25 - *((void *)&v21 + 1);
  uint64_t input[2] = v13;
  uint64_t v17 = IOConnectCallMethod(v16, 0x4Bu, input, 3u, 0, 0, 0, 0, __s, &v22);
  if (v17)
  {
    uint64_t v18 = v17;
    goto LABEL_15;
  }
  *(void *)&long long v20 = __s;
  *((void *)&v20 + 1) = &__s[v22];
  if (!ccder_blob_decode_range()) {
    goto LABEL_13;
  }
  if (!v3)
  {
    uint64_t v18 = 0;
    goto LABEL_15;
  }
  uint64_t v18 = 0;
  if ((der_utils_decode_fv_key(&v20, 0, v3) & 1) == 0) {
LABEL_13:
  }
    uint64_t v18 = 3758097098;
LABEL_15:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v18;
}

uint64_t aks_fv_unwrap_vek_with_opts(uint64_t a1)
{
  return aks_fv_unwrap_vek_with_acm(a1);
}

void aks_gather_stats(const char *a1, char a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a1)
  {
    bzero(&v13, 0x878uLL);
    bzero(v12, 0x400uLL);
    if (realpath_DARWIN_EXTSN(a1, v12))
    {
      uint64_t v4 = (char *)malloc(0x818uLL);
      memset_s(v4, 0x818uLL, 0, 0x818uLL);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 0x40000000;
      v11[2] = __aks_gather_stats_block_invoke_2;
      v11[3] = &__block_descriptor_tmp_140;
      v11[4] = v4;
      _iterate_path(v12, (uint64_t)&__block_literal_global_21, (uint64_t)v11);
      if (!statfs(v12, &v13))
      {
        if (a2) {
          printf("Free Blocks:%lld blocks of size:%d\n");
        }
        else {
          printf("%lld,%d\n");
        }
      }
      uint64_t v5 = v4 + 340;
      for (uint64_t i = 1; i != 5; ++i)
      {
        if (a2)
        {
          uint64_t v9 = &v4[296 * i];
          printf("%s:\n\tNum files:\t%u,\n\tNum hardlinks:\t%u,\n\tNum compressed:\t%u,\n\tTotal Size:\t%lld,\n\tMin File Size:\t%lld,\n\tMax File Size:\t%lld,\n", class_names[i], *(_DWORD *)v9, *((_DWORD *)v9 + 2), *((_DWORD *)v9 + 1), *((void *)v9 + 2), *((void *)v9 + 3), *((void *)v9 + 4));
          printf("\tSize Distribution:");
          printf("%i", *((_DWORD *)v9 + 10));
          for (uint64_t j = 0; j != 252; j += 4)
          {
            putchar(44);
            printf("%i", *(_DWORD *)&v5[j]);
          }
        }
        else
        {
          uint64_t v7 = &v4[296 * i];
          printf("%i,%u,%u,%u,%lld,%lld,%lld,", i, *(_DWORD *)v7, *((_DWORD *)v7 + 2), *((_DWORD *)v7 + 1), *((void *)v7 + 2), *((void *)v7 + 3), *((void *)v7 + 4));
          printf("%i", *((_DWORD *)v7 + 10));
          for (uint64_t k = 0; k != 252; k += 4)
          {
            putchar(44);
            printf("%i", *(_DWORD *)&v5[k]);
          }
        }
        putchar(10);
        v5 += 296;
      }
      free(v4);
    }
  }
}

uint64_t __aks_gather_stats_block_invoke()
{
  return 1;
}

uint64_t __aks_gather_stats_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = _get_path_class(*(const char **)(a2 + 48));
  if ((result - 7) >= 0xFFFFFFFA)
  {
    uint64_t v5 = *(void *)(a2 + 96);
    int64_t v6 = *(void *)(v5 + 96);
    uint64_t v7 = *(void *)(a1 + 32);
    ++*(_DWORD *)(v7 + 296 * result);
    if (*(unsigned __int16 *)(v5 + 6) >= 2u) {
      ++*(_DWORD *)(v7 + 296 * result + 8);
    }
    if ((*(unsigned char *)(v5 + 116) & 0x20) != 0) {
      ++*(_DWORD *)(v7 + 296 * result + 4);
    }
    uint64_t v8 = v7 + 296 * result;
    int64_t v10 = *(void *)(v8 + 32);
    uint64_t v9 = (int64_t *)(v8 + 32);
    *(v9 - 2) += v6;
    if (v6 > v10) {
      *uint64_t v9 = v6;
    }
    uint64_t v11 = v7 + 296 * result;
    int64_t v14 = *(void *)(v11 + 24);
    unsigned int v12 = (int64_t *)(v11 + 24);
    int64_t v13 = v14;
    if (v14) {
      BOOL v15 = v6 < v13;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15) {
      *unsigned int v12 = v6;
    }
    if (v6) {
      unint64_t v16 = v7 + 296 * result + 4 * (63 - __clz(v6));
    }
    else {
      unint64_t v16 = v7 + 296 * result;
    }
    ++*(_DWORD *)(v16 + 40);
  }
  return result;
}

uint64_t aks_kext_set_options(unsigned int a1, uint64_t a2)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  input[0] = 1;
  input[1] = a1;
  uint64_t input[2] = a2;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x56u, input, 3u, 0, 0, &output, &outputCnt, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_kext_set_options", ":", 820, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_kext_get_options(unsigned int a1, uint64_t *a2)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = 3758097084;
  if (!a2) {
    return 3758097090;
  }
  input[0] = 0;
  input[1] = a1;
  uint64_t input[2] = 0;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v2 = IOConnectCallMethod(aks_client_connection, 0x56u, input, 3u, 0, 0, &output, &outputCnt, 0, 0);
    if (!v2) {
      *a2 = output;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_kext_get_options", ":", 841, "", 0, "", "");
  }
  return v2;
}

uint64_t aks_internal_state()
{
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x10u, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_internal_state", ":", 857, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_run_internal_test(unsigned int a1)
{
  input[1] = *MEMORY[0x263EF8340];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x86u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_run_internal_test", ":", 871, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_stash_escrow(uint64_t a1)
{
  int v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  int v7 = v6;
  uint64_t v9 = v8;
  int v11 = v10;
  uint64_t v13 = v12;
  unsigned int v15 = v14;
  int v16 = v1;
  uint64_t v24 = *MEMORY[0x263EF8340];
  bzero(__src, 0x8000uLL);
  size_t __count = 0x8000;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = v16;
    input[1] = v15;
    uint64_t input[2] = v13;
    uint64_t input[3] = v11;
    if (!v15 || (uint64_t v18 = 3758097090, v5) && v3)
    {
      uint64_t v18 = IOConnectCallMethod(aks_client_connection, 0x36u, input, 4u, v9, v7, 0, 0, __src, &__count);
      if (!v18 && v15)
      {
        long long v19 = calloc(__count, 1uLL);
        *uint64_t v5 = v19;
        if (v19)
        {
          memcpy(v19, __src, __count);
          uint64_t v18 = 0;
          *uint64_t v3 = __count;
        }
        else
        {
          uint64_t v18 = 3758097085;
        }
      }
    }
  }
  else
  {
    uint64_t v18 = 3758097084;
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_stash_escrow", ":", 890, "", 0, "", "");
  }
  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  return v18;
}

void __get_aks_client_connection_block_invoke()
{
  if (!get_aks_client_connection_connection) {
    get_aks_client_connection_connection = _copy_aks_client_connection("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
  }
}

uint64_t get_akstest_client_connection()
{
  if (get_aks_client_dispatch_queue_onceToken != -1) {
    dispatch_once(&get_aks_client_dispatch_queue_onceToken, &__block_literal_global_173);
  }
  dispatch_sync((dispatch_queue_t)get_aks_client_dispatch_queue_connection_queue, &__block_literal_global_157);
  uint64_t result = get_akstest_client_connection_connection;
  if (!get_akstest_client_connection_connection)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStoreTest");
    return get_akstest_client_connection_connection;
  }
  return result;
}

void __get_akstest_client_connection_block_invoke()
{
  if (!get_akstest_client_connection_connection) {
    get_akstest_client_connection_connection = _copy_aks_client_connection("IOService:/IOResources/AppleKeyStoreTest", "AppleKeyStoreTest");
  }
}

uint64_t akstest_new_key(mach_port_t a1, const void *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, _DWORD *a7)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  input[0] = a4;
  input[1] = a3;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  bzero(outputStruct, 0x400uLL);
  size_t v19 = 1024;
  uint64_t v11 = IOConnectCallMethod(a1, 0xFu, input, 2u, a2, 0x10uLL, &output, &outputCnt, outputStruct, &v19);
  if (v11) {
    return v11;
  }
  uint64_t v17 = 3758097084;
  if (outputCnt == 1)
  {
    *a7 = output;
    if (aks_unpack_data(outputStruct, v19, 3u, v12, v13, v14, v15, v16, a5)) {
      return 3758097084;
    }
    else {
      return 0;
    }
  }
  return v17;
}

uint64_t akstest_new_ekwk(mach_port_t a1, const void *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, _DWORD *a7, uint64_t a8, uint64_t a9, _DWORD *a10, uint64_t a11, uint64_t a12, _DWORD *a13)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  input[0] = a4;
  input[1] = a3;
  uint64_t output = 0;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint32_t outputCnt = 3;
  bzero(outputStruct, 0x400uLL);
  size_t v26 = 1024;
  uint64_t v17 = IOConnectCallMethod(a1, 0x13u, input, 2u, a2, 0x10uLL, &output, &outputCnt, outputStruct, &v26);
  if (v17) {
    return v17;
  }
  uint64_t v23 = 3758097084;
  if (outputCnt == 3)
  {
    int v24 = v30;
    *a7 = output;
    *a10 = v24;
    *a13 = v31;
    if (aks_unpack_data(outputStruct, v26, 5u, v18, v19, v20, v21, v22, a5)) {
      return 3758097084;
    }
    else {
      return 0;
    }
  }
  return v23;
}

uint64_t akstest_new_ek(mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, size_t *a8)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a3;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 2, a4, a5, a6, (uint64_t)a7, (uint64_t)a8, a2);
  uint64_t v11 = IOConnectCallMethod(a1, 0x14u, input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, a7, a8);
  free(*(void **)&inputStructCnt[1]);
  return v11;
}

uint64_t akstest_rewrap_ek(mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9, uint64_t a10, uint64_t a11, unsigned int a12, void *outputStruct, size_t *a14, _DWORD *a15)
{
  uint64_t input[4] = *MEMORY[0x263EF8340];
  input[0] = a3;
  input[1] = a6;
  uint64_t input[2] = a9;
  uint64_t input[3] = a12;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 4, a4, a5, a6, a7, a8, a2);
  uint64_t v16 = IOConnectCallMethod(a1, 0x15u, input, 4u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], &output, &outputCnt, outputStruct, a14);
  if (v16)
  {
    uint64_t v17 = v16;
  }
  else if (outputCnt == 1)
  {
    uint64_t v17 = 0;
    *a15 = output;
  }
  else
  {
    uint64_t v17 = 3758097084;
  }
  free(*(void **)&inputStructCnt[1]);
  return v17;
}

uint64_t akstest_unwrap_key(mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  input[0] = a3;
  input[1] = a6;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(outputStruct, 0x400uLL);
  size_t outputStructCnt = 1024;
  aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 2, v10, v11, v12, v13, v14, a2);
  uint64_t v15 = IOConnectCallMethod(a1, 0x10u, input, 2u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, outputStruct, &outputStructCnt);
  if (v15)
  {
    uint64_t v21 = v15;
  }
  else if (aks_unpack_data(outputStruct, outputStructCnt, 2u, v16, v17, v18, v19, v20, a7))
  {
    uint64_t v21 = 3758097084;
  }
  else
  {
    uint64_t v21 = 0;
  }
  free(*(void **)&inputStructCnt[1]);
  return v21;
}

uint64_t akstest_unwrap_ek(mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, unsigned int a9, uint64_t a10)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  input[0] = a3;
  input[1] = a6;
  uint64_t input[2] = a9;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(outputStruct, 0x400uLL);
  size_t v25 = 1024;
  aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 3, v12, v13, v14, v15, v16, a2);
  uint64_t v17 = IOConnectCallMethod(a1, 0x17u, input, 3u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, outputStruct, &v25);
  if (v17)
  {
    uint64_t v23 = v17;
  }
  else if (aks_unpack_data(outputStruct, v25, 2u, v18, v19, v20, v21, v22, a10))
  {
    uint64_t v23 = 3758097084;
  }
  else
  {
    uint64_t v23 = 0;
  }
  free(*(void **)&inputStructCnt[1]);
  return v23;
}

uint64_t akstest_check_class(mach_port_t a1, void *inputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a3;
  return IOConnectCallMethod(a1, 0x11u, input, 1u, inputStruct, 0x10uLL, 0, 0, 0, 0);
}

uint64_t akstest_last_user(mach_port_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a2;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 1, a4, a5, a6, a7, a8, a3);
  uint64_t v9 = IOConnectCallMethod(a1, 0x12u, input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, 0, 0);
  free(*(void **)&inputStructCnt[1]);
  return v9;
}

uint64_t aks_get_internal_info_for_key(uint64_t a1)
{
  int v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  int v7 = v6;
  input[1] = *MEMORY[0x263EF8340];
  input[0] = v1;
  bzero(__src, 0x8000uLL);
  size_t __count = 0x8000;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (v7) {
      size_t v9 = 18;
    }
    else {
      size_t v9 = 0;
    }
    uint64_t v10 = IOConnectCallMethod(aks_client_connection, 0x5Du, input, 1u, v7, v9, 0, 0, __src, &__count);
    size_t v11 = __count;
    if (v10)
    {
      uint64_t v13 = v10;
    }
    else if (__count - 32769 < 0xFFFFFFFFFFFF8000)
    {
      uint64_t v13 = 3758097090;
    }
    else
    {
      uint64_t v12 = calloc(__count, 1uLL);
      *uint64_t v5 = v12;
      size_t v11 = __count;
      if (v12)
      {
        *uint64_t v3 = __count;
        memcpy(v12, __src, v11);
        uint64_t v13 = 0;
        size_t v11 = __count;
      }
      else
      {
        uint64_t v13 = 3758097085;
      }
    }
  }
  else
  {
    uint64_t v13 = 3758097084;
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_internal_info_for_key", ":", 1246, "", 0, "", "");
    size_t v11 = 0x8000;
  }
  memset_s(__src, v11, 0, v11);
  return v13;
}

dispatch_queue_t __get_aks_client_dispatch_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("aks-client-queue", 0);
  get_aks_client_dispatch_queue_connection_queue = (uint64_t)result;
  return result;
}

uint64_t _copy_aks_client_connection(char *path, const char *a2)
{
  kern_return_t v7;
  CFDictionaryRef v8;
  io_service_t MatchingService;
  io_object_t v10;
  uint64_t result;
  kern_return_t v12;
  io_connect_t connect;

  connect = 0;
  mach_port_t v3 = *MEMORY[0x263F0EC90];
  io_service_t v4 = IORegistryEntryFromPath(*MEMORY[0x263F0EC90], path);
  uint64_t v5 = (task_port_t *)MEMORY[0x263EF8960];
  if (!v4 || (io_object_t v6 = v4, v7 = IOServiceOpen(v4, *MEMORY[0x263EF8960], 0, &connect), IOObjectRelease(v6), v7))
  {
    uint64_t v8 = IOServiceMatching(a2);
    MatchingService = IOServiceGetMatchingService(v3, v8);
    if (MatchingService)
    {
      uint64_t v10 = MatchingService;
      IOServiceOpen(MatchingService, *v5, 0, &connect);
      IOObjectRelease(v10);
    }
  }
  dispatch_queue_t result = connect;
  if (connect)
  {
    uint64_t v12 = IOConnectCallMethod(connect, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    dispatch_queue_t result = connect;
    if (v12)
    {
      IOServiceClose(connect);
      return 0;
    }
  }
  return result;
}

uint64_t sizeof_backup_bag()
{
  ccder_sizeof_implicit_uint64();
  ccder_sizeof_raw_octet_string();
  ccder_sizeof_raw_octet_string();
  ccder_sizeof_implicit_uint64();
  return ccder_sizeof();
}

uint64_t encode_backup_bag(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a2 + a3;
  if (!ccder_blob_encode_implicit_uint64()
    || !ccder_blob_encode_body_tl()
    || !ccder_blob_encode_body_tl()
    || !ccder_blob_encode_body_tl()
    || !ccder_blob_encode_implicit_uint64())
  {
    return 4294967273;
  }
  int v3 = ccder_blob_encode_tl();
  uint64_t result = 4294967273;
  if (v3)
  {
    if (a2 == v6) {
      return 0;
    }
    else {
      return 4294967273;
    }
  }
  return result;
}

uint64_t decode_backup_bag(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&long long v6 = a1;
  *((void *)&v6 + 1) = a1 + a2;
  if (!ccder_blob_decode_range()
    || !der_utils_decode_implicit_uint64(&v6, 0x8000000000000000, a3)
    || !der_utils_decode_implicit_raw_octet_string_copy(&v6, 0x8000000000000001, (uint64_t)(a3 + 1), 16)
    || !der_utils_decode_implicit_raw_octet_string_copy(&v6, 0x8000000000000002, (uint64_t)(a3 + 3), 40)
    || !der_utils_decode_implicit_raw_octet_string_copy(&v6, 0x8000000000000003, (uint64_t)(a3 + 8), 16))
  {
    return 4294967277;
  }
  int v4 = der_utils_decode_implicit_uint64(&v6, 0x8000000000000004, a3 + 10);
  uint64_t result = 4294967277;
  if (v4)
  {
    if ((void)v6 == *((void *)&v6 + 1)) {
      return 0;
    }
    else {
      return 4294967277;
    }
  }
  return result;
}

uint64_t wrap_backup_bag(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  memset(__s, 0, sizeof(__s));
  int v12 = 40;
  *(void *)a4 = 0;
  uuid_copy((unsigned __int8 *)(a4 + 8), (const unsigned __int8 *)(a1 + 32));
  *(void *)(a4 + 80) = 1;
  platform_read_random(a4 + 64, 0x10u);
  uint64_t v8 = ccsha256_di();
  if (firebloom_ccpbkdf2_hmac(v8, a3, a2, 16, a4 + 64, *(void *)(a4 + 80), 32, __s))
  {
    uint64_t v10 = 4294967286;
  }
  else
  {
    uint64_t v9 = rfc3394_wrap_legacy((uint64_t)__s, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, (uint64_t *)a1, 0x20u, (void *)(a4 + 24), &v12);
    if (v9)
    {
      uint64_t v10 = v9;
    }
    else if (v12 == 40)
    {
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v10 = 4294967286;
    }
  }
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  return v10;
}

uint64_t unwrap_backup_bag(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  memset(__s, 0, sizeof(__s));
  int v12 = 32;
  if (*(void *)a1)
  {
    uint64_t v10 = 4294967284;
  }
  else
  {
    uint64_t v8 = ccsha256_di();
    if (firebloom_ccpbkdf2_hmac(v8, a3, a2, 16, a1 + 64, *(void *)(a1 + 80), 32, __s)) {
      goto LABEL_9;
    }
    uint64_t v9 = rfc3394_unwrap_legacy((uint64_t)__s, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, (void *)(a1 + 24), 0x28u, (void *)a4, &v12);
    if (v9)
    {
      uint64_t v10 = v9;
      goto LABEL_8;
    }
    if (v12 != 32)
    {
LABEL_9:
      uint64_t v10 = 4294967286;
    }
    else
    {
      cccurve25519_make_pub();
      if (uuid_compare((const unsigned __int8 *)(a1 + 8), (const unsigned __int8 *)(a4 + 32))) {
        uint64_t v10 = 4294967272;
      }
      else {
        uint64_t v10 = 0;
      }
    }
  }
LABEL_8:
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  return v10;
}

uint64_t aks_stash_create_for_bag_and_kek(uint64_t a1)
{
  int v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  int v5 = v4;
  uint64_t v7 = v6;
  unsigned int v9 = v8;
  unsigned int v11 = v10;
  int v12 = v1;
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v13 = 3758097098;
  bzero(v19, 0x1000uLL);
  *(void *)&long long v17 = v19;
  *((void *)&v17 + 1) = &v20;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v15 = aks_client_connection;
    if (der_utils_encode_fv_data(&v17, v3) && ccder_blob_encode_tl())
    {
      input[0] = v12;
      input[1] = v11;
      uint64_t input[2] = v7;
      uint64_t input[3] = v5;
      uint64_t input[4] = v9;
      uint64_t input[5] = *((void *)&v17 + 1);
      input[6] = (uint64_t)&v20 - *((void *)&v17 + 1);
      return IOConnectCallMethod(v15, 0x21u, input, 7u, 0, 0, 0, 0, 0, 0);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_stash_create_for_bag_and_kek", ":", 50, "", 0, "", "");
    return 3758097084;
  }
  return v13;
}

uint64_t aks_stash_create(uint64_t a1)
{
  return aks_stash_create_for_bag_and_kek(a1);
}

uint64_t aks_stash_load(int a1)
{
  return _aks_stash_load(a1, 0, 0);
}

uint64_t _aks_stash_load(int a1, unsigned int a2, BOOL *a3)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    input[1] = a2;
    uint64_t output = 0;
    uint32_t outputCnt = 1;
    uint64_t result = IOConnectCallMethod(aks_client_connection, 0x22u, input, 2u, 0, 0, &output, &outputCnt, 0, 0);
    if (!result)
    {
      uint64_t result = 0;
      if (a3) {
        *a3 = output != 0;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_aks_stash_load", ":", 77, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t aks_stash_verify(int a1, unsigned char *a2)
{
  BOOL v4 = 0;
  if (!a2) {
    return _aks_stash_load(a1, 1u, &v4);
  }
  *a2 = 0;
  uint64_t result = _aks_stash_load(a1, 1u, &v4);
  if (!result) {
    *a2 = v4;
  }
  return result;
}

uint64_t aks_stash_destroy()
{
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x25u, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_stash_destroy", ":", 125, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_stash_commit(int a1)
{
  input[1] = *MEMORY[0x263EF8340];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x24u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_stash_commit", ":", 138, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_stash_enable(int a1)
{
  input[1] = *MEMORY[0x263EF8340];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x33u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_stash_enable", ":", 154, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_stash_persist(int a1)
{
  input[1] = *MEMORY[0x263EF8340];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x35u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_stash_persist", ":", 170, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_prederived_free(void **a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)a1 != 1634431856) {
    return 0xFFFFFFFFLL;
  }
  free(a1[1]);
  free(a1);
  return 0;
}

uint64_t aks_prederived_create(int a1, uint64_t a2, unint64_t a3, int a4, void ***a5)
{
  uint64_t v14 = 0;
  if (!a2 && a3) {
    return 0xFFFFFFFFLL;
  }
  if (_aks_prederived_create_ctx(a4, &v14) || (unsigned int v9 = calloc(0x20uLL, 1uLL)) == 0)
  {
    uint64_t v12 = 0xFFFFFFFFLL;
  }
  else
  {
    unsigned int v10 = v9;
    int v11 = _aks_prederive_passcode(v14, a2, a3, (uint64_t)v9);
    uint64_t v12 = 0xFFFFFFFFLL;
    if (a3 <= 0x7FFFFFFE
      && !v11
      && !_set_prederived_configuration(a1, a2, a3, (uint64_t)v10, (uint64_t)v14))
    {
      uint64_t v12 = 0;
      if (a5)
      {
        *a5 = v14;
        uint64_t v14 = 0;
      }
    }
    memset_s(v10, 0x20uLL, 0, 0x20uLL);
    free(v10);
  }
  if (v14) {
    aks_prederived_free(v14);
  }
  return v12;
}

uint64_t _aks_prederived_create_ctx(int a1, void *a2)
{
  if ((a1 - 1) > 2 || a2 == 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = calloc(0x20uLL, 1uLL);
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = v6;
  *((void *)v6 + 2) = 20;
  unsigned int v8 = calloc(0x14uLL, 1uLL);
  *((void *)v7 + 1) = v8;
  if (!v8)
  {
LABEL_19:
    free(v7);
    return 0xFFFFFFFFLL;
  }
  *uint64_t v7 = 1634431856;
  v7[6] = a1;
  uint64_t result = CCRandomCopyBytes();
  if (result)
  {
    unsigned int v10 = (void *)*((void *)v7 + 1);
    if (v10) {
      free(v10);
    }
    goto LABEL_19;
  }
  if (a1 == 3) {
    int v9 = 2000;
  }
  else {
    int v9 = 10000000;
  }
  if (a1 == 2) {
    int v9 = 1000;
  }
  v7[1] = v9;
  *a2 = v7;
  return result;
}

uint64_t _aks_prederive_passcode(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*a1 != 1634431856 || !a2 && a3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0xFFFFFFFFLL;
  if (a4 && (a1[6] - 4) >= 0xFFFFFFFD)
  {
    ccsha256_di();
    if (ccpbkdf2_hmac()) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t _set_prederived_configuration(int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  rsize_t __n = 0;
  __s = 0;
  uint64_t v10 = 3758097090;
  uint64_t v14 = 0;
  if ((a2 || !a3) && a4 && a5)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      mach_port_t v12 = aks_client_connection;
      if (!encode_list_add_data(&v14, (uint64_t)der_key_config_prederived_salt, *(void *)(a5 + 8))
        && !encode_list_add_data(&v14, (uint64_t)der_key_config_prederived_passcode, a4)
        && !encode_list_add_number(&v14, (uint64_t)der_key_config_prederived_iterations, *(unsigned int *)(a5 + 4))&& !encode_list_add_number(&v14, (uint64_t)der_key_config_prederived_type, *(unsigned int *)(a5 + 24))&& (a3 < 1 || !encode_list_add_data(&v14, (uint64_t)der_key_passcode, a2))&& !encode_list_is_empty(&v14)&& !encode_list_dict(&v14, &__s, &__n))
      {
        input[0] = a1;
        input[1] = (uint64_t)__s;
        uint64_t input[2] = __n;
        uint64_t v10 = IOConnectCallMethod(v12, 0x1Eu, input, 3u, 0, 0, 0, 0, 0, 0);
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_set_prederived_configuration", ":", 218, "", 0, "", "");
      uint64_t v10 = 3758097084;
    }
  }
  encode_list_free(&v14);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  return v10;
}

uint64_t aks_prederived_is_enabled(uint64_t a1)
{
  int v1 = MEMORY[0x270FA5388](a1);
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  int v4 = v1;
  uint64_t result = (uint64_t)calloc(0x20uLL, 1uLL);
  if (!result) {
    return result;
  }
  uint64_t v6 = result;
  *(_DWORD *)uint64_t result = 1634431856;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_get_prederived_configuration", ":", 384, "", 0, "", "");
LABEL_16:
    aks_prederived_free((void **)v6);
    return 0;
  }
  mach_port_t v8 = aks_client_connection;
  bzero(outputStruct, 0x8000uLL);
  v14[0] = 0x8000;
  uint64_t input = v4;
  if (IOConnectCallMethod(v8, 0x1Fu, &input, 1u, 0, 0, 0, 0, outputStruct, v14) || v14[0] > 0x8000) {
    goto LABEL_16;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  long long v16 = 0u;
  long long v18 = 0u;
  uint64_t v19 = 0;
  long long v15 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v14[1] = (size_t)der_key_config_prederived_salt;
  long long v17 = (unint64_t)der_key_config_prederived_iterations;
  uint64_t v20 = der_key_config_prederived_type;
  der_dict_iterate();
  uint64_t v10 = ccder_decode_tl();
  if (v10)
  {
    int v11 = (const void *)v10;
    mach_port_t v12 = calloc(*(void *)(v6 + 16), 1uLL);
    *(void *)(v6 + 8) = v12;
    if (!v12)
    {
      int v13 = 0;
      if (!Mutable) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    memcpy(v12, v11, *(void *)(v6 + 16));
    *(_DWORD *)(v6 + 4) = der_get_number();
    *(_DWORD *)(v6 + 24) = der_get_number();
  }
  int v13 = 1;
  if (Mutable) {
LABEL_10:
  }
    CFRelease(Mutable);
LABEL_11:
  if (!v13 || !*(void *)(v6 + 16)) {
    goto LABEL_16;
  }
  *uint64_t v3 = v6;
  return 1;
}

uint64_t aks_prederived_unlock_keybag(int a1, uint64_t a2, int a3, _DWORD *a4)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  memset(v9, 0, sizeof(v9));
  if (a3) {
    BOOL v4 = a2 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  BOOL v5 = v4 || a4 == 0;
  if (v5 || *a4 != 1634431856 || _aks_prederive_passcode(a4, a2, a3, (uint64_t)v9)) {
    uint64_t v7 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v7 = aks_unlock_bag(a1, (uint64_t)v9, 32);
  }
  memset_s(v9, 0x20uLL, 0, 0x20uLL);
  return v7;
}

uint64_t aks_unlock_bag(int a1, uint64_t a2, int a3)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    input[1] = a2;
    uint64_t input[2] = a3;
    return IOConnectCallMethod(aks_client_connection, 0xCu, input, 3u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unlock_bag", ":", 807, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_prederived_change_secret(int a1, uint64_t a2, int a3, uint64_t a4, int a5, void ***a6)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  memset(__s, 0, sizeof(__s));
  memset(v17, 0, sizeof(v17));
  long long v16 = 0;
  if (!a6) {
    goto LABEL_17;
  }
  uint64_t v7 = *a6;
  if (!*a6 || *(_DWORD *)v7 != 1634431856 || !a2 && a3) {
    goto LABEL_17;
  }
  if (!a4 && a5 || _aks_prederive_passcode(*a6, a2, a3, (uint64_t)__s)) {
    goto LABEL_17;
  }
  int v11 = _aks_prederived_create_ctx(*((_DWORD *)v7 + 6), &v16);
  mach_port_t v12 = v16;
  if (v11 || (int v13 = _aks_prederive_passcode(v16, a4, a5, (uint64_t)v17), v12 = v16, v13))
  {
LABEL_15:
    if (v12) {
      aks_prederived_free(v12);
    }
LABEL_17:
    uint64_t v14 = 0xFFFFFFFFLL;
    goto LABEL_13;
  }
  if (_set_prederived_configuration(a1, (uint64_t)__s, 32, (uint64_t)v17, (uint64_t)v16))
  {
    mach_port_t v12 = v16;
    goto LABEL_15;
  }
  aks_prederived_free(v7);
  uint64_t v14 = 0;
  *a6 = v16;
LABEL_13:
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  memset_s(v17, 0x20uLL, 0, 0x20uLL);
  return v14;
}

uint64_t aks_create_bag(uint64_t a1, int a2, unsigned int a3, _DWORD *a4)
{
  return _create_bag(a1, a2, 0, 0, a3, -1, a4);
}

uint64_t _create_bag(uint64_t a1, int a2, uint64_t a3, int a4, unsigned int a5, int a6, _DWORD *a7)
{
  input[6] = *MEMORY[0x263EF8340];
  uint64_t v14 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a7)
    {
      input[0] = a5;
      input[1] = a6;
      uint64_t input[2] = a1;
      uint64_t input[3] = a2;
      uint64_t input[4] = a3;
      uint64_t input[5] = a4;
      uint64_t output = 0;
      uint32_t outputCnt = 1;
      uint64_t v14 = IOConnectCallMethod(aks_client_connection, 2u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
      if (!v14) {
        *a7 = output;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_create_bag", ":", 187, "", 0, "", "");
  }
  return v14;
}

uint64_t aks_create_escrow_bag(uint64_t a1, int a2, int a3, _DWORD *a4)
{
  return _create_bag(a1, a2, 0, 0, 2u, a3, a4);
}

uint64_t aks_create_escrow_bag_with_auth(uint64_t a1, int a2, uint64_t a3, int a4, int a5, _DWORD *a6)
{
  return _create_bag(a3, a4, a1, a2, 2u, a5, a6);
}

uint64_t aks_create_sync_bag(uint64_t a1, int a2, int a3, _DWORD *a4)
{
  return _create_bag(a1, a2, 0, 0, 0x8000002u, a3, a4);
}

uint64_t aks_create_sync_bag_with_auth(uint64_t a1, int a2, uint64_t a3, int a4, int a5, _DWORD *a6)
{
  return _create_bag(a3, a4, a1, a2, 0x8000002u, a5, a6);
}

uint64_t aks_invalidate_sync_bags()
{
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x42u, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_invalidate_sync_bags", ":", 544, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_unlock_with_sync_bag(const void *a1, int a2, uint64_t a3, int a4, int a5)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  uint64_t v10 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a1)
    {
      input[0] = a5;
      input[1] = a3;
      uint64_t input[2] = a4;
      return IOConnectCallMethod(aks_client_connection, 0x43u, input, 3u, a1, a2, 0, 0, 0, 0);
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unlock_with_sync_bag", ":", 557, "", 0, "", "");
  }
  return v10;
}

uint64_t aks_load_bag(const void *a1, int a2, _DWORD *a3)
{
  output[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v6 = 3758097090;
    if (a1)
    {
      if (a3)
      {
        output[0] = 0;
        uint32_t outputCnt = 1;
        uint64_t v6 = IOConnectCallMethod(aks_client_connection, 6u, 0, 0, a1, a2, output, &outputCnt, 0, 0);
        if (!v6) {
          *a3 = output[0];
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_load_bag", ":", 574, "", 0, "", "");
  }
  return v6;
}

uint64_t aks_invalidate_bag(const void *a1, int a2)
{
  uint64_t v4 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a1) {
      return IOConnectCallMethod(aks_client_connection, 0x57u, 0, 0, a1, a2, 0, 0, 0, 0);
    }
    return 3758097090;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_invalidate_bag", ":", 596, "", 0, "", "");
  }
  return v4;
}

uint64_t aks_unload_bag(int a1)
{
  input[1] = *MEMORY[0x263EF8340];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 4u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unload_bag", ":", 612, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_unload_session_bags(int a1)
{
  input[1] = *MEMORY[0x263EF8340];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x37u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unload_session_bags", ":", 629, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_save_bag(uint64_t a1)
{
  int v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  BOOL v5 = v4;
  int v6 = v1;
  uint64_t v14 = *MEMORY[0x263EF8340];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v8 = aks_client_connection;
    uint64_t result = 3758097090;
    if (v5)
    {
      if (v3)
      {
        bzero(__src, 0x8000uLL);
        size_t __count = 0x8000;
        uint64_t input = v6;
        uint64_t result = IOConnectCallMethod(v8, 3u, &input, 1u, 0, 0, 0, 0, __src, &__count);
        if (!result)
        {
          uint64_t v10 = calloc(__count, 1uLL);
          *BOOL v5 = v10;
          if (v10)
          {
            memcpy(v10, __src, __count);
            uint64_t result = 0;
            *uint64_t v3 = __count;
          }
          else
          {
            return 3758097085;
          }
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_save_bag", ":", 646, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t aks_change_secret_opts(int a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, unsigned __int8 a10, unsigned int a11, unsigned int a12, _DWORD *a13)
{
  input[12] = *MEMORY[0x263EF8340];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    input[1] = a11;
    uint64_t input[2] = a10;
    uint64_t input[3] = a2;
    uint64_t input[4] = a3;
    uint64_t input[5] = a4;
    input[6] = a5;
    uint64_t input[7] = a6;
    input[8] = a7;
    input[9] = a8;
    input[10] = a9;
    input[11] = a12;
    uint64_t output = 0;
    uint32_t outputCnt = 1;
    uint64_t result = IOConnectCallMethod(aks_client_connection, 0xFu, input, 0xCu, 0, 0, &output, &outputCnt, 0, 0);
    if (a13)
    {
      if (!result) {
        *a13 = output;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_change_secret_opts", ":", 678, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t aks_change_secret_se(int a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, unsigned __int8 a10, unsigned int a11, _DWORD *a12)
{
  return aks_change_secret_opts(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, 0, a12);
}

uint64_t aks_change_secret(int a1, uint64_t a2, int a3, uint64_t a4, int a5, unsigned int a6, _DWORD *a7)
{
  return aks_change_secret_opts(a1, a2, a3, a4, a5, 0, 0, 0, 0, 0xFFu, a6, 0, a7);
}

uint64_t aks_get_bag_uuid(int a1, _OWORD *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = 3758097084;
  size_t v7 = 16;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
    {
      long long outputStruct = 0uLL;
      uint64_t input = a1;
      uint64_t v4 = IOConnectCallMethod(aks_client_connection, 0x17u, &input, 1u, 0, 0, 0, 0, &outputStruct, &v7);
      if (!v4) {
        *a2 = outputStruct;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_bag_uuid", ":", 729, "", 0, "", "");
  }
  return v4;
}

uint64_t aks_copy_volume_cookie(int a1, void *a2, size_t *a3)
{
  return aks_copy_volume_cookie_persona(a1, (uint64_t)&UUID_NULL, a2, a3);
}

uint64_t aks_copy_volume_cookie_persona(int a1, uint64_t a2, void *a3, size_t *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  __int16 v23 = 0;
  memset(__src, 0, sizeof(__src));
  size_t __count = 34;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v14 = 3758097090;
    if (a3 && a4)
    {
      mach_port_t v15 = aks_client_connection;
      uint64_t input = a1;
      aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 1, v9, v10, v11, v12, v13, a2);
      if (*(void *)&inputStructCnt[1])
      {
        uint64_t v16 = IOConnectCallMethod(v15, 0x44u, &input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
        if (v16)
        {
          uint64_t v14 = v16;
        }
        else
        {
          long long v17 = calloc(__count, 1uLL);
          *a3 = v17;
          uint64_t v14 = 3758097085;
          if (v17)
          {
            memcpy(v17, __src, __count);
            uint64_t v14 = 0;
            *a4 = __count;
          }
        }
      }
      else
      {
        uint64_t v14 = 3758097085;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_copy_volume_cookie_persona", ":", 760, "", 0, "", "");
    uint64_t v14 = 3758097084;
  }
  free(*(void **)&inputStructCnt[1]);
  return v14;
}

uint64_t aks_lock_bag(int a1)
{
  input[1] = *MEMORY[0x263EF8340];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0xDu, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_lock_bag", ":", 790, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_get_lock_state(int a1, _DWORD *a2)
{
  input[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
    {
      uint64_t output = 0;
      input[0] = a1;
      uint32_t outputCnt = 1;
      uint64_t v4 = IOConnectCallMethod(aks_client_connection, 7u, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
      if (!v4) {
        *a2 = output;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_lock_state", ":", 824, "", 0, "", "");
  }
  return v4;
}

uint64_t aks_wrap_key(const void *a1, int a2, int a3, int a4, void *a5, int *a6, _DWORD *a7)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  uint64_t v14 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v14 = 3758097090;
    if (a1 && a5 && a6)
    {
      input[0] = a4;
      input[1] = a3;
      uint64_t output = 0;
      uint32_t outputCnt = 1;
      size_t v18 = *a6;
      uint64_t v16 = IOConnectCallMethod(aks_client_connection, 0xAu, input, 2u, a1, a2, &output, &outputCnt, a5, &v18);
      if (v16)
      {
        return v16;
      }
      else
      {
        *a6 = v18;
        uint64_t v14 = 0;
        if (a7) {
          *a7 = output;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_wrap_key", ":", 848, "", 0, "", "");
  }
  return v14;
}

uint64_t aks_unwrap_key(const void *a1, int a2, int a3, int a4, void *a5, int *a6)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  uint64_t v12 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v12 = 3758097090;
    if (a1)
    {
      if (a5)
      {
        if (a6)
        {
          input[0] = a4;
          input[1] = a3;
          size_t v15 = *a6;
          uint64_t v12 = IOConnectCallMethod(aks_client_connection, 0xBu, input, 2u, a1, a2, 0, 0, a5, &v15);
          if (!v12) {
            *a6 = v15;
          }
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unwrap_key", ":", 877, "", 0, "", "");
  }
  return v12;
}

uint64_t aks_rewrap_key_for_backup(const void *a1, int a2, int a3, int a4, uint64_t a5, unsigned int a6, void *a7)
{
  uint64_t input[4] = *MEMORY[0x263EF8340];
  uint64_t v14 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v14 = 3758097090;
    if (a1 && a7)
    {
      input[0] = a3;
      input[1] = a4;
      uint64_t input[2] = a5;
      uint64_t input[3] = a6;
      size_t v17 = 108;
      return IOConnectCallMethod(aks_client_connection, 0x18u, input, 4u, a1, a2, 0, 0, a7, &v17);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_rewrap_key_for_backup", ":", 901, "", 0, "", "");
  }
  return v14;
}

uint64_t aks_get_system(int a1, _DWORD *a2)
{
  input[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
    {
      uint64_t output = 0;
      input[0] = a1;
      uint32_t outputCnt = 1;
      uint64_t v4 = IOConnectCallMethod(aks_client_connection, 0xEu, input, a1 != 0, 0, 0, &output, &outputCnt, 0, 0);
      if (!v4) {
        *a2 = output;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_system", ":", 922, "", 0, "", "");
  }
  return v4;
}

uint64_t aks_set_system_with_passcode(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t input[4] = *MEMORY[0x263EF8340];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    input[1] = a2;
    uint64_t input[2] = a3;
    uint64_t input[3] = a4;
    return IOConnectCallMethod(aks_client_connection, 5u, input, 4u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_system_with_passcode", ":", 950, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_set_system(int a1, int a2)
{
  return aks_set_system_with_passcode(a1, a2, 0, 0);
}

uint64_t aks_set_keybag_for_volume(int a1, uint64_t a2, unsigned int a3)
{
  return aks_set_keybag_for_volume_with_cookie_persona(a1, a2, a3);
}

uint64_t aks_set_keybag_for_volume_with_cookie(int a1, uint64_t a2, unsigned int a3)
{
  return aks_set_keybag_for_volume_with_cookie_persona(a1, a2, a3);
}

uint64_t aks_set_keybag_for_volume_with_cookie_persona(int a1, uint64_t a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = 3758097084;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v13 = aks_client_connection;
    input[0] = a1;
    input[1] = a3;
    aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 3, v8, v9, v10, v11, v12, a2);
    if (*(void *)&inputStructCnt[1])
    {
      uint64_t v6 = IOConnectCallMethod(v13, 0x41u, input, 2u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, 0, 0);
      uint64_t v14 = *(void **)&inputStructCnt[1];
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v6 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_keybag_for_volume_with_cookie_persona", ":", 987, "", 0, "", "");
    uint64_t v14 = 0;
  }
  free(v14);
  return v6;
}

uint64_t aks_backup_enable_volume(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  BOOL v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = v1;
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v11 = 3758097085;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(__src, 0x8000uLL);
  size_t __count = 0x8000;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v18 = aks_client_connection;
    input[0] = v9;
    input[1] = v7;
    aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 1, v13, v14, v15, v16, v17, v10);
    if (*(void *)&inputStructCnt[1])
    {
      uint64_t v19 = IOConnectCallMethod(v18, 0x6Eu, input, 2u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
      if (v19)
      {
        uint64_t v11 = v19;
      }
      else
      {
        uint64_t v20 = calloc(__count, 1uLL);
        *BOOL v5 = v20;
        if (v20)
        {
          memcpy(v20, __src, __count);
          uint64_t v11 = 0;
          *uint64_t v3 = __count;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_backup_enable_volume", ":", 1014, "", 0, "", "");
    uint64_t v11 = 3758097084;
  }
  free(*(void **)&inputStructCnt[1]);
  return v11;
}

uint64_t aks_backup_disable_volume(uint64_t a1)
{
  uint64_t v2 = 3758097084;
  uint64_t v13 = 0;
  int v12 = 0;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v9 = aks_client_connection;
    aks_pack_data(&v13, (unsigned int *)&v12, 1, v4, v5, v6, v7, v8, a1);
    if (v13)
    {
      uint64_t v2 = IOConnectCallMethod(v9, 0x6Fu, 0, 0, v13, v12, 0, 0, 0, 0);
      uint64_t v10 = v13;
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v2 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_backup_disable_volume", ":", 1044, "", 0, "", "");
    uint64_t v10 = 0;
  }
  free(v10);
  return v2;
}

uint64_t aks_backup_copy_current_bag_uuid(uint64_t a1, void *a2)
{
  uint64_t v4 = 3758097084;
  uint64_t v16 = 0;
  int v15 = 0;
  size_t v14 = 16;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v11 = aks_client_connection;
    aks_pack_data(&v16, (unsigned int *)&v15, 1, v6, v7, v8, v9, v10, a1);
    if (v16)
    {
      uint64_t v4 = IOConnectCallMethod(v11, 0x70u, 0, 0, v16, v15, 0, 0, a2, &v14);
      int v12 = v16;
    }
    else
    {
      int v12 = 0;
      uint64_t v4 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_backup_copy_current_bag_uuid", ":", 1066, "", 0, "", "");
    int v12 = 0;
  }
  free(v12);
  return v4;
}

uint64_t aks_backup_rewrap_key(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, unsigned int a6, void *a7)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  uint64_t v13 = 3758097084;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v20 = aks_client_connection;
    long long v21 = 0;
    uint64_t v13 = 3758097090;
    if (a2 && a7)
    {
      input[0] = a4;
      input[1] = a5;
      uint64_t input[2] = a6;
      aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 2, v15, v16, v17, v18, v19, a1);
      size_t v23 = 108;
      uint64_t v13 = IOConnectCallMethod(v20, 0x71u, input, 3u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, a7, &v23);
      long long v21 = *(void **)&inputStructCnt[1];
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_backup_rewrap_key", ":", 1087, "", 0, "", "");
    long long v21 = 0;
  }
  free(v21);
  return v13;
}

uint64_t aks_backup_rewrap_ek(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, unsigned int a8, void *outputStruct)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  uint64_t v15 = 3758097084;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v22 = aks_client_connection;
    size_t v23 = 0;
    uint64_t v15 = 3758097090;
    if (a2 && a4 && outputStruct)
    {
      input[0] = a6;
      input[1] = a7;
      uint64_t input[2] = a8;
      aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 3, v17, v18, v19, v20, v21, a1);
      size_t v25 = 108;
      uint64_t v15 = IOConnectCallMethod(v22, 0x71u, input, 3u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, outputStruct, &v25);
      size_t v23 = *(void **)&inputStructCnt[1];
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_backup_rewrap_ek", ":", 1113, "", 0, "", "");
    size_t v23 = 0;
  }
  free(v23);
  return v15;
}

uint64_t aks_backup_unwrap_bag(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long __s = 0u;
  long long v16 = 0u;
  uint64_t v14 = 0;
  memset(v13, 0, sizeof(v13));
  uint64_t v8 = decode_backup_bag(a1, a2, v13);
  if (v8)
  {
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = unwrap_backup_bag((uint64_t)v13, a3, a4, (uint64_t)&__s);
    if (!v9)
    {
      long long v10 = v16;
      *a5 = __s;
      a5[1] = v10;
      long long v11 = v18;
      a5[2] = v17;
      a5[3] = v11;
    }
  }
  memset_s(v13, 0x58uLL, 0, 0x58uLL);
  memset_s(&__s, 0x40uLL, 0, 0x40uLL);
  return err_sks_to_aks(v9);
}

uint64_t aks_backup_copy_bag_uuid(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v7 = 0;
  memset(v6, 0, sizeof(v6));
  uint64_t v4 = decode_backup_bag(a1, a2, v6);
  if (!v4) {
    uuid_copy(a3, (const unsigned __int8 *)v6 + 8);
  }
  memset_s(v6, 0x58uLL, 0, 0x58uLL);
  return err_sks_to_aks(v4);
}

uint64_t aks_backup_unwrap_key(long long *a1, void *a2, unsigned int a3, void *a4, void *a5)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v6 = a1[1];
  long long v12 = *a1;
  long long v13 = v6;
  long long v7 = a1[3];
  long long v14 = a1[2];
  long long v15 = v7;
  unsigned int v10 = *a5;
  int __s = 1;
  uint64_t v8 = unwrap_data((uint64_t)&__s, 0, 0, a2, a3, a4, &v10);
  *a5 = v10;
  memset_s(&__s, 0x44uLL, 0, 0x44uLL);
  return err_sks_to_aks(v8);
}

uint64_t aks_kc_backup_unwrap_key(uint64_t a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  uint64_t v10 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v10 = 3758097090;
    if (a2 && a4)
    {
      input[0] = a1;
      input[1] = 64;
      return IOConnectCallMethod(aks_client_connection, 0x82u, input, 2u, a2, a3, 0, 0, a4, a5);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_kc_backup_unwrap_key", ":", 1193, "", 0, "", "");
  }
  return v10;
}

uint64_t aks_kc_backup_wrap_key(int a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  input[1] = *MEMORY[0x263EF8340];
  uint64_t v10 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v10 = 3758097090;
    if (a2 && a4)
    {
      input[0] = a1;
      return IOConnectCallMethod(aks_client_connection, 0x81u, input, 1u, a2, a3, 0, 0, a4, a5);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_kc_backup_wrap_key", ":", 1212, "", 0, "", "");
  }
  return v10;
}

uint64_t aks_kc_backup_get_handle(int a1, _DWORD *a2)
{
  input[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
    {
      uint64_t output = 0;
      input[0] = a1;
      uint32_t outputCnt = 1;
      uint64_t v4 = IOConnectCallMethod(aks_client_connection, 0x83u, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
      if (!v4) {
        *a2 = output;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_kc_backup_get_handle", ":", 1231, "", 0, "", "");
  }
  return v4;
}

uint64_t aks_kc_backup_get_uuid(int a1, unsigned __int8 *a2)
{
  input[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
    {
      uint64_t v10 = 0;
      input[0] = a1;
      size_t v8 = 16;
      *(void *)src = 0;
      uint64_t v6 = IOConnectCallMethod(aks_client_connection, 0x84u, input, 1u, 0, 0, 0, 0, src, &v8);
      if (v6)
      {
        return v6;
      }
      else if (v8 == 16)
      {
        uuid_copy(a2, src);
        return 0;
      }
      else
      {
        return 3758604298;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_kc_backup_get_uuid", ":", 1253, "", 0, "", "");
  }
  return v4;
}

uint64_t aks_kc_backup_open_keybag(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, _OWORD *a6)
{
  if (a5)
  {
    int v7 = a4;
    int v9 = a2;
    *a5 = -1;
    int v11 = aks_backup_unwrap_bag((uint64_t)a1, a2, a3, a4, a6);
    long long v12 = (FILE **)MEMORY[0x263EF8358];
    long long v13 = (FILE *)*MEMORY[0x263EF8358];
    if (!v11)
    {
      fprintf(v13, "%s%s:%s%s%s%s%u:%s%u:%s Unwrapped DER backup bag%s\n", "aks", "", "", "", "aks_kc_backup_open_keybag", ":", 1302, "", 0, "", "");
      uint64_t v17 = 0;
      goto LABEL_9;
    }
    fprintf(v13, "%s%s:%s%s%s%s%u:%s%u:%s Failed to unwrap backup bag as DER: 0x%08x%s\n", "aks", "", "", "", "aks_kc_backup_open_keybag", ":", 1290, "", 0, "", v11, "");
    uint64_t bag = aks_load_bag(a1, v9, a5);
    if (bag)
    {
      uint64_t v17 = bag;
      fprintf(*v12, "%s%s:%s%s%s%s%u:%s%u:%s Failed to load in-kernel backup bag: 0x%08x%s\n", "aks", "", "", "", "aks_kc_backup_open_keybag", ":", 1292, "", 0, "", bag, "");
    }
    else
    {
      int is_enabled = aks_prederived_is_enabled(*a5);
      int v16 = *a5;
      if (is_enabled)
      {
        uint64_t v17 = aks_prederived_unlock_keybag(v16, a3, v7, 0);
        if (!v17) {
          goto LABEL_9;
        }
        fprintf(*v12, "%s%s:%s%s%s%s%u:%s%u:%s Failed to unlock in-kernel backup bag with prederived secret: 0x%08x%s\n", "aks", "", "", "", "aks_kc_backup_open_keybag", ":");
      }
      else
      {
        uint64_t v17 = aks_unlock_bag(v16, a3, v7);
        if (!v17) {
          goto LABEL_9;
        }
        fprintf(*v12, "%s%s:%s%s%s%s%u:%s%u:%s Failed to unlock in-kernel backup bag: 0x%08x%s\n", "aks", "", "", "", "aks_kc_backup_open_keybag", ":");
      }
    }
  }
  else
  {
    uint64_t v17 = 3758097090;
  }
  if (*a5 != -1)
  {
    aks_unload_bag(*a5);
    *a5 = -1;
  }
LABEL_9:
  aks_prederived_free(0);
  return v17;
}

uint64_t aks_keybag_persona_create(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  uint64_t v8 = 3758097084;
  uint64_t v19 = 0;
  int v18 = 0;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v15 = aks_client_connection;
    input[0] = a1;
    input[1] = a2;
    uint64_t input[2] = a3;
    aks_pack_data(&v19, (unsigned int *)&v18, 1, v10, v11, v12, v13, v14, a4);
    if (v19)
    {
      uint64_t v8 = IOConnectCallMethod(v15, 0x60u, input, 3u, v19, v18, 0, 0, 0, 0);
      int v16 = v19;
    }
    else
    {
      int v16 = 0;
      uint64_t v8 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_keybag_persona_create", ":", 1324, "", 0, "", "");
    int v16 = 0;
  }
  free(v16);
  return v8;
}

uint64_t aks_keybag_persona_create_with_flags(int a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t input[4] = *MEMORY[0x263EF8340];
  uint64_t v10 = 3758097084;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v17 = aks_client_connection;
    input[0] = a1;
    input[1] = a2;
    uint64_t input[2] = a3;
    uint64_t input[3] = a5;
    aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 1, v12, v13, v14, v15, v16, a4);
    if (*(void *)&inputStructCnt[1])
    {
      uint64_t v10 = IOConnectCallMethod(v17, 0x75u, input, 4u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, 0, 0);
      int v18 = *(void **)&inputStructCnt[1];
    }
    else
    {
      int v18 = 0;
      uint64_t v10 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_keybag_persona_create_with_flags", ":", 1346, "", 0, "", "");
    int v18 = 0;
  }
  free(v18);
  return v10;
}

uint64_t aks_keybag_persona_list(uint64_t a1)
{
  int v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  int v6 = v1;
  uint64_t v16 = *MEMORY[0x263EF8340];
  bzero(__src, 0x2000uLL);
  size_t __count = 0x2000;
  uint64_t input = v6;
  uint64_t v7 = 3758097090;
  if (v5 && v3)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      uint64_t v9 = IOConnectCallMethod(aks_client_connection, 0x61u, &input, 1u, 0, 0, 0, 0, __src, &__count);
      if (v9)
      {
        uint64_t v7 = v9;
      }
      else
      {
        if (__count)
        {
          uint64_t v10 = calloc(__count, 1uLL);
          *uint64_t v5 = v10;
          if (!v10)
          {
            uint64_t v7 = 3758097085;
            goto LABEL_10;
          }
          memcpy(v10, __src, __count);
          size_t v11 = __count;
        }
        else
        {
          size_t v11 = 0;
          *uint64_t v5 = 0;
        }
        uint64_t v7 = 0;
        *uint64_t v3 = v11;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_keybag_persona_list", ":", 1372, "", 0, "", "");
      uint64_t v7 = 3758097084;
    }
  }
LABEL_10:
  memset_s(__src, 0x2000uLL, 0, 0x2000uLL);
  return v7;
}

uint64_t aks_keybag_persona_delete(int a1, uint64_t a2)
{
  input[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = 3758097084;
  uint64_t v15 = 0;
  int v14 = 0;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v11 = aks_client_connection;
    input[0] = a1;
    aks_pack_data(&v15, (unsigned int *)&v14, 1, v6, v7, v8, v9, v10, a2);
    if (v15)
    {
      uint64_t v4 = IOConnectCallMethod(v11, 0x62u, input, 1u, v15, v14, 0, 0, 0, 0);
      uint64_t v12 = v15;
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v4 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_keybag_persona_delete", ":", 1394, "", 0, "", "");
    uint64_t v12 = 0;
  }
  free(v12);
  return v4;
}

uint64_t aks_auth_token_create(int a1, uint64_t a2, int a3, unsigned int a4, void *a5, size_t *a6)
{
  uint64_t input[4] = *MEMORY[0x263EF8340];
  uint64_t v12 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v12 = 3758097090;
    if (a5 && a6)
    {
      input[0] = a1;
      input[1] = a4;
      uint64_t input[2] = a2;
      uint64_t input[3] = a3;
      return IOConnectCallMethod(aks_client_connection, 0x26u, input, 4u, 0, 0, 0, 0, a5, a6);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_auth_token_create", ":", 1415, "", 0, "", "");
  }
  return v12;
}

uint64_t aks_set_configuration(int a1, uint64_t a2, uint64_t a3, const __CFDictionary *a4)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  rsize_t __n = 0;
  int __s = 0;
  uint64_t v7 = 3758097090;
  uint64_t v20 = 0;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v9 = aks_client_connection;
    CFTypeID TypeID = CFNumberGetTypeID();
    if (!_copy_cf_key(a4, @"GracePeriod", TypeID, (uint64_t)der_key_config_graceperiod, &v20))
    {
      CFTypeID v11 = CFNumberGetTypeID();
      if (!_copy_cf_key(a4, @"BackOffDelay", v11, (uint64_t)der_key_config_backoff_delay, &v20))
      {
        CFTypeID v12 = CFNumberGetTypeID();
        if (!_copy_cf_key(a4, @"MaxUnlockAttempts", v12, (uint64_t)der_key_config_max_unlock_attempts, &v20))
        {
          CFTypeID v13 = CFNumberGetTypeID();
          if (!_copy_cf_key(a4, @"EscrowPasscodePeriod", v13, (uint64_t)der_key_config_escrow_passcode_period, &v20))
          {
            CFTypeID v14 = CFNumberGetTypeID();
            if (!_copy_cf_key(a4, @"EscrowTokenPeriod", v14, (uint64_t)der_key_config_escrow_token_period, &v20))
            {
              CFTypeID v15 = CFDataGetTypeID();
              if (!_copy_cf_key(a4, @"UserUUID", v15, (uint64_t)der_key_config_user_uuid, &v20))
              {
                CFTypeID v16 = CFDataGetTypeID();
                if (!_copy_cf_key(a4, @"BindKEKToKB", v16, (uint64_t)der_key_config_bind_kek, &v20))
                {
                  CFTypeID v17 = CFBooleanGetTypeID();
                  if (!_copy_cf_key(a4, @"InactivityRebootEnabled", v17, (uint64_t)der_key_inactivity_reboot_enabled, &v20))
                  {
                    CFTypeID v18 = CFBooleanGetTypeID();
                    if (!_copy_cf_key(a4, @"OnenessAutomaticMode", v18, (uint64_t)der_key_oneness_automatic_mode, &v20)&& !encode_list_is_empty(&v20)&& (!a2 || !encode_list_add_data(&v20, (uint64_t)der_key_passcode, a2))&& !encode_list_dict(&v20, &__s, &__n))
                    {
                      input[0] = a1;
                      input[1] = (uint64_t)__s;
                      uint64_t input[2] = __n;
                      uint64_t v7 = IOConnectCallMethod(v9, 0x1Eu, input, 3u, 0, 0, 0, 0, 0, 0);
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
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_configuration", ":", 1488, "", 0, "", "");
    uint64_t v7 = 3758097084;
  }
  encode_list_free(&v20);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  return v7;
}

uint64_t _copy_cf_key(const __CFDictionary *a1, const void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  value = 0;
  uint64_t result = CFDictionaryGetValueIfPresent(a1, a2, (const void **)&value);
  if (result)
  {
    if (CFGetTypeID(value) == a3)
    {
      if (CFNumberGetTypeID() == a3)
      {
        uint64_t v10 = 0;
        if (!CFNumberGetValue((CFNumberRef)value, kCFNumberSInt64Type, &v10)
          || encode_list_add_number(a5, a4, v10))
        {
          return 0xFFFFFFFFLL;
        }
        return 0;
      }
      if (CFBooleanGetTypeID() == a3)
      {
        CFBooleanGetValue((CFBooleanRef)value);
        if (encode_list_add_BOOL(a5, a4)) {
          return 0xFFFFFFFFLL;
        }
      }
      else
      {
        if (CFDataGetTypeID() != a3) {
          return 0xFFFFFFFFLL;
        }
        BytePtr = CFDataGetBytePtr((CFDataRef)value);
        CFDataGetLength((CFDataRef)value);
        if (encode_list_add_data(a5, a4, (uint64_t)BytePtr)) {
          return 0xFFFFFFFFLL;
        }
      }
      return 0;
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t aks_get_configuration(uint64_t a1)
{
  int v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  int v4 = v1;
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v5 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (v3)
    {
      mach_port_t v7 = aks_client_connection;
      bzero(outputStruct, 0x8000uLL);
      v47[0] = 0x8000;
      uint64_t input = v4;
      uint64_t v8 = IOConnectCallMethod(v7, 0x1Fu, &input, 1u, 0, 0, 0, 0, outputStruct, v47);
      if (v8)
      {
        return v8;
      }
      else if (v47[0] > 0x8000)
      {
        return 3758604298;
      }
      else
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        bzero(v48, 0x250uLL);
        v47[1] = (size_t)der_key_config_graceperiod;
        v48[4] = der_key_config_backoff_delay;
        v48[9] = der_key_config_max_unlock_attempts;
        v48[14] = der_key_config_escrow_passcode_period;
        v48[19] = der_key_config_escrow_token_period;
        v48[24] = der_key_config_flags;
        v48[29] = der_key_config_user_uuid;
        v48[34] = der_key_config_group_uuid;
        v48[39] = der_key_config_recovery_iterations;
        v48[44] = der_key_config_recovery_flags;
        v48[49] = der_key_config_recovery_target_iterations;
        v48[54] = der_key_memento_supported;
        v48[59] = der_key_memento_blob_exists;
        v48[64] = der_key_config_memento_passcode_generation;
        v48[69] = der_key_config_passcode_generation;
        der_dict_iterate();
        uint64_t v10 = v48[0];
        uint64_t v11 = v48[5];
        uint64_t v12 = v48[10];
        uint64_t v13 = v48[15];
        uint64_t v14 = v48[20];
        uint64_t v15 = v48[25];
        uint64_t v16 = v48[30];
        uint64_t v46 = v3;
        uint64_t v17 = v48[35];
        uint64_t v39 = v48[40];
        uint64_t v40 = v48[45];
        uint64_t v41 = v48[50];
        uint64_t v42 = v48[55];
        uint64_t v43 = v48[60];
        uint64_t v44 = v48[65];
        uint64_t v45 = v48[70];
        CFTypeID TypeID = CFNumberGetTypeID();
        _set_cf_key(Mutable, @"GracePeriod", TypeID, v10);
        CFTypeID v19 = CFNumberGetTypeID();
        _set_cf_key(Mutable, @"BackOffDelay", v19, v11);
        CFTypeID v20 = CFNumberGetTypeID();
        _set_cf_key(Mutable, @"MaxUnlockAttempts", v20, v12);
        CFTypeID v21 = CFNumberGetTypeID();
        _set_cf_key(Mutable, @"EscrowPasscodePeriod", v21, v13);
        CFTypeID v22 = CFNumberGetTypeID();
        _set_cf_key(Mutable, @"EscrowTokenPeriod", v22, v14);
        CFTypeID v23 = CFNumberGetTypeID();
        _set_cf_key(Mutable, @"ConfigFlags", v23, v15);
        CFTypeID v24 = CFDataGetTypeID();
        _set_cf_key(Mutable, @"UserUUID", v24, v16);
        CFTypeID v25 = CFDataGetTypeID();
        _set_cf_key(Mutable, @"GroupUUID", v25, v17);
        CFTypeID v26 = CFNumberGetTypeID();
        _set_cf_key(Mutable, @"RecoveryIterations", v26, v39);
        CFTypeID v27 = CFNumberGetTypeID();
        _set_cf_key(Mutable, @"RecoveryFlags", v27, v40);
        CFTypeID v28 = CFNumberGetTypeID();
        _set_cf_key(Mutable, @"RecoveryTargetIterations", v28, v41);
        CFTypeID v29 = CFBooleanGetTypeID();
        _set_cf_key(Mutable, @"MementoSupported", v29, v42);
        CFTypeID v30 = CFBooleanGetTypeID();
        _set_cf_key(Mutable, @"MementoBlobExists", v30, v43);
        CFTypeID v31 = CFNumberGetTypeID();
        _set_cf_key(Mutable, @"MementoPasscodeGeneration", v31, v44);
        CFTypeID v32 = CFNumberGetTypeID();
        _set_cf_key(Mutable, @"PasscodeGeneration", v32, v45);
        char number = der_get_number();
        uint64_t v34 = (const void *)*MEMORY[0x263EFFB38];
        uint64_t v35 = (const void *)*MEMORY[0x263EFFB40];
        if ((number & 2) != 0) {
          uint64_t v36 = (const void *)*MEMORY[0x263EFFB40];
        }
        else {
          uint64_t v36 = (const void *)*MEMORY[0x263EFFB38];
        }
        CFDictionarySetValue(Mutable, @"InactivityRebootEnabled", v36);
        if ((number & 8) != 0) {
          uint64_t v37 = v35;
        }
        else {
          uint64_t v37 = v34;
        }
        CFDictionarySetValue(Mutable, @"OnenessAutomaticMode", v37);
        uint64_t v5 = 0;
        void *v46 = Mutable;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_configuration", ":", 1556, "", 0, "", "");
  }
  return v5;
}

void _set_cf_key(__CFDictionary *a1, const void *a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    if (CFNumberGetTypeID() == a3)
    {
      CFIndex valuePtr = der_get_number();
      CFNumberRef v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
      if (!v7) {
        return;
      }
LABEL_14:
      CFNumberRef v12 = v7;
      CFDictionaryAddValue(a1, a2, v7);
      CFRelease(v12);
      return;
    }
    if (CFBooleanGetTypeID() == a3)
    {
      int v8 = der_get_BOOL();
      mach_port_t v9 = (const void **)MEMORY[0x263EFFB40];
      if (!v8) {
        mach_port_t v9 = (const void **)MEMORY[0x263EFFB38];
      }
      uint64_t v10 = *v9;
      CFDictionaryAddValue(a1, a2, v10);
    }
    else if (CFDataGetTypeID() == a3)
    {
      CFIndex valuePtr = 0;
      uint64_t v11 = (const UInt8 *)ccder_decode_tl();
      if (v11)
      {
        CFNumberRef v7 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v11, valuePtr);
        goto LABEL_14;
      }
    }
  }
}

uint64_t aks_assert_hold(int a1, unsigned int a2, uint64_t a3)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  uint64_t input[2] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x1Au, input, 3u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_assert_hold", ":", 1654, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_assert_drop(int a1, unsigned int a2)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x1Bu, input, 2u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_assert_drop", ":", 1672, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_assert_promote(int a1, unsigned int a2)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a2;
    input[1] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x64u, input, 2u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_assert_promote", ":", 1687, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_oneness_heartbeat(int a1)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x91u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_oneness_heartbeat", ":", 1707, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_assert_consume(int a1)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x65u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_assert_consume", ":", 1722, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_recover_with_escrow_bag(int a1, uint64_t a2)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  uint64_t v15 = 0;
  int v14 = 0;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v10 = aks_client_connection;
    aks_pack_data((char **)&v15, (unsigned int *)&v14, 3, v5, v6, v7, v8, v9, a2);
    input[0] = a1;
    input[1] = (uint64_t)v15;
    uint64_t input[2] = v14;
    uint64_t v11 = IOConnectCallMethod(v10, 0x12u, input, 3u, 0, 0, 0, 0, 0, 0);
    CFNumberRef v12 = v15;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_recover_with_escrow_bag", ":", 1739, "", 0, "", "");
    CFNumberRef v12 = 0;
    uint64_t v11 = 3758097084;
  }
  free(v12);
  return v11;
}

uint64_t aks_fdr_hmac_data(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  int v7 = v6;
  uint64_t v8 = (const void *)v1;
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v9 = 3758097090;
  bzero(__src, 0x8000uLL);
  size_t __count = 0x8000;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (v8 && v5 && v3)
    {
      uint64_t v11 = IOConnectCallMethod(aks_client_connection, 0x29u, 0, 0, v8, v7, 0, 0, __src, &__count);
      if (v11)
      {
        uint64_t v9 = v11;
      }
      else
      {
        CFNumberRef v12 = calloc(__count, 1uLL);
        *uint64_t v5 = v12;
        if (v12)
        {
          memcpy(v12, __src, __count);
          uint64_t v9 = 0;
          *uint64_t v3 = __count;
        }
        else
        {
          uint64_t v9 = 3758097085;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fdr_hmac_data", ":", 1758, "", 0, "", "");
    uint64_t v9 = 3758097084;
  }
  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  return v9;
}

uint64_t aks_generation(int a1, unsigned int a2, _DWORD *a3)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    input[1] = a2;
    uint64_t output = 0;
    uint32_t outputCnt = 1;
    uint64_t result = IOConnectCallMethod(aks_client_connection, 0x28u, input, 2u, 0, 0, &output, &outputCnt, 0, 0);
    if (a3)
    {
      if (!result) {
        *a3 = output;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_generation", ":", 1781, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t _aks_verify_password(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  uint64_t input[4] = *MEMORY[0x263EF8340];
  uint64_t v9 = 3758097084;
  CFTypeID v21 = 0;
  int v20 = 0;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v16 = aks_client_connection;
    if (a2) {
      uint64_t v17 = a2;
    }
    else {
      uint64_t v17 = "";
    }
    aks_pack_data((char **)&v21, (unsigned int *)&v20, 2, v11, v12, v13, v14, v15, (uint64_t)v17);
    if (v21)
    {
      input[0] = a1;
      input[1] = a6;
      uint64_t input[2] = (uint64_t)v21;
      uint64_t input[3] = v20;
      uint64_t v9 = IOConnectCallMethod(v16, 0x2Au, input, 4u, 0, 0, 0, 0, 0, 0);
      CFTypeID v18 = v21;
    }
    else
    {
      CFTypeID v18 = 0;
      uint64_t v9 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_aks_verify_password", ":", 1807, "", 0, "", "");
    CFTypeID v18 = 0;
  }
  free(v18);
  return v9;
}

uint64_t aks_verify_password(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _aks_verify_password(a1, a2, a3, a4, a5, 0);
}

uint64_t aks_verify_password_memento(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _aks_verify_password(a1, a2, a3, a4, a5, 1u);
}

uint64_t aks_register_for_notifications()
{
  if (get_aks_client_connection())
  {
    JUMPOUT(0x25A2ED000);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_register_for_notifications", ":", 1840, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_create_signing_key(int a1, int a2, void *a3, size_t *a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  size_t __count = 256;
  input[0] = a1;
  input[1] = a2;
  uint64_t result = 3758097090;
  if (a3 && a4)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      memset(__src, 0, sizeof(__src));
      uint64_t result = IOConnectCallMethod(aks_client_connection, 0x31u, input, 2u, 0, 0, 0, 0, __src, &__count);
      if (!result)
      {
        if (__count > 0x100)
        {
          return 3758604298;
        }
        else
        {
          uint64_t v8 = calloc(__count, 1uLL);
          *a3 = v8;
          if (v8)
          {
            memcpy(v8, __src, __count);
            uint64_t result = 0;
            *a4 = __count;
          }
          else
          {
            return 3758097085;
          }
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_create_signing_key", ":", 1859, "", 0, "", "");
      return 3758097084;
    }
  }
  return result;
}

uint64_t aks_create_signing_key_with_params(uint64_t a1)
{
  int v1 = MEMORY[0x270FA5388](a1);
  uint64_t v18 = *MEMORY[0x263EF8340];
  size_t __count = 0x8000;
  input[0] = v1;
  input[1] = v6;
  uint64_t result = 3758097090;
  if (v4)
  {
    uint64_t v8 = v5;
    if (v5)
    {
      uint64_t v9 = v4;
      size_t v10 = v3;
      uint64_t v11 = v2;
      mach_port_t aks_client_connection = get_aks_client_connection();
      if (aks_client_connection)
      {
        mach_port_t v13 = aks_client_connection;
        bzero(__src, 0x8000uLL);
        uint64_t result = IOConnectCallMethod(v13, 0x31u, input, 2u, v11, v10, 0, 0, __src, &__count);
        if (!result)
        {
          if (__count > 0x8000)
          {
            return 3758604298;
          }
          else
          {
            uint64_t v14 = calloc(__count, 1uLL);
            *uint64_t v9 = v14;
            if (v14)
            {
              memcpy(v14, __src, __count);
              uint64_t result = 0;
              size_t *v8 = __count;
            }
            else
            {
              return 3758097085;
            }
          }
        }
      }
      else
      {
        fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_create_signing_key_with_params", ":", 1881, "", 0, "", "");
        return 3758097084;
      }
    }
  }
  return result;
}

uint64_t aks_obliterate_signing_keys(uint64_t a1)
{
  return remote_session_operate(a1);
}

uint64_t remote_session_operate(uint64_t a1)
{
  int v1 = MEMORY[0x270FA5388](a1);
  size_t v3 = v2;
  uint64_t v5 = v4;
  uint32_t v7 = v6;
  uint64_t v20 = *MEMORY[0x263EF8340];
  size_t __count = 15360;
  input[0] = v1;
  input[1] = v8;
  uint64_t input[2] = v9;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v11 = aks_client_connection;
    bzero(__src, 0x3C00uLL);
    uint64_t v12 = IOConnectCallMethod(v11, v7, input, 3u, 0, 0, 0, 0, __src, &__count);
    if (v12)
    {
      return v12;
    }
    else if (__count > 0x3C00)
    {
      return 3758604298;
    }
    else
    {
      uint64_t v13 = 0;
      if (v5 && v3)
      {
        if (__count)
        {
          uint64_t v14 = calloc(__count, 1uLL);
          *uint64_t v5 = v14;
          if (!v14) {
            return 3758097085;
          }
          memcpy(v14, __src, __count);
          size_t v15 = __count;
        }
        else
        {
          size_t v15 = 0;
        }
        uint64_t v13 = 0;
        *size_t v3 = v15;
      }
    }
  }
  else
  {
    uint64_t v13 = 3758097084;
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "remote_session_operate", ":", 2017, "", 0, "", "");
  }
  return v13;
}

uint64_t aks_sign_signing_key(int a1, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, void *a8, size_t *a9)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  memset(__src, 0, sizeof(__src));
  size_t __count = 256;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  input[0] = a1;
  input[1] = a2;
  uint64_t v9 = 3758097090;
  uint64_t input[2] = a5;
  if (a8 && a9)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      mach_port_t v18 = aks_client_connection;
      aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 2, v13, v14, v15, v16, v17, a3);
      if (*(void *)&inputStructCnt[1])
      {
        uint64_t v19 = IOConnectCallMethod(v18, 0x32u, input, 3u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
        if (v19)
        {
          uint64_t v9 = v19;
        }
        else if (__count > 0x100)
        {
          uint64_t v9 = 3758604298;
        }
        else
        {
          uint64_t v20 = calloc(__count, 1uLL);
          *a8 = v20;
          uint64_t v9 = 3758097085;
          if (v20)
          {
            memcpy(v20, __src, __count);
            uint64_t v9 = 0;
            *a9 = __count;
          }
        }
      }
      else
      {
        uint64_t v9 = 3758097085;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_sign_signing_key", ":", 1911, "", 0, "", "");
      uint64_t v9 = 3758097084;
    }
  }
  free(*(void **)&inputStructCnt[1]);
  return v9;
}

uint64_t aks_remote_session(int a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  uint64_t v10 = 3758097084;
  input[0] = a2;
  input[1] = a1;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v17 = aks_client_connection;
    aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 3, v12, v13, v14, v15, v16, a3);
    if (*(void *)&inputStructCnt[1])
    {
      uint64_t v18 = IOConnectCallMethod(v17, 0x2Cu, input, 2u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], &output, &outputCnt, 0, 0);
      uint64_t v10 = v18;
      if (a9 && !v18) {
        *a9 = output;
      }
    }
    else
    {
      uint64_t v10 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_remote_session", ":", 1938, "", 0, "", "");
  }
  free(*(void **)&inputStructCnt[1]);
  return v10;
}

uint64_t aks_validate_local_key(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  mach_port_t v17 = 0;
  int __s = 0;
  uint64_t v4 = 3758097084;
  rsize_t __n = 0;
  uint64_t v16 = 0;
  uint64_t v5 = 3758097090;
  rsize_t __smax = 0;
  if (!a3 || !a4) {
    goto LABEL_12;
  }
  int v8 = -536870212;
  *(void *)&long long v19 = a3;
  *((void *)&v19 + 1) = a3 + a4;
  if (!(a3 + a4)) {
    goto LABEL_19;
  }
  uint64_t v16 = 0;
  if ((ccder_blob_decode_range() & 1) == 0)
  {
    int v8 = -536870198;
LABEL_19:
    syslog(3, "error parsing signing key: %d", v8);
    uint64_t v5 = 3758097084;
LABEL_12:
    uint64_t v12 = __s;
    uint64_t v4 = v5;
    goto LABEL_13;
  }
  der_utils_decode_implicit_uint64(&v19, 0x8000000000000001, &v16);
  if (v16)
  {
    uint64_t v5 = remote_session_operate(a1);
    if (v5) {
      syslog(3, "error: validating v1 local signing key failed: %d");
    }
    goto LABEL_12;
  }
  uint64_t v11 = aks_create_signing_key(a1, 11, &__s, &__n);
  if (v11)
  {
    uint64_t v5 = v11;
    syslog(3, "error: validating (create) v0 local signing key failed: %d", v11);
    goto LABEL_12;
  }
  uint64_t v12 = __s;
  if (__s && __n)
  {
    uint64_t v5 = aks_sign_signing_key(a1, a2, a3, a4, 11, (uint64_t)__s, __n, &v17, &__smax);
    if (v5) {
      syslog(3, "error: validating (sign) v0 local signing key failed: %d");
    }
    goto LABEL_12;
  }
LABEL_13:
  if (v12)
  {
    memset_s(v12, __n, 0, __n);
    free(__s);
  }
  if (v17)
  {
    memset_s(v17, __smax, 0, __smax);
    free(v17);
  }
  return v4;
}

uint64_t aks_remote_session_step(uint64_t a1)
{
  return remote_session_operate(a1);
}

uint64_t aks_remote_peer_setup(uint64_t a1)
{
  return remote_session_operate(a1);
}

uint64_t aks_remote_peer_setup_with_acm(uint64_t a1)
{
  return remote_session_operate(a1);
}

uint64_t aks_remote_peer_confirm(uint64_t a1)
{
  return remote_session_operate(a1);
}

uint64_t aks_remote_session_token(uint64_t a1)
{
  return remote_session_operate(a1);
}

uint64_t aks_drain_backup_keys(uint64_t a1)
{
  int v1 = MEMORY[0x270FA5388](a1);
  size_t v3 = v2;
  uint64_t v5 = v4;
  int v6 = v1;
  uint64_t v14 = *MEMORY[0x263EF8340];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v8 = aks_client_connection;
    uint64_t result = 3758097090;
    if (v5)
    {
      if (v3)
      {
        bzero(__src, 0x8000uLL);
        size_t __count = 0x8000;
        input[0] = v6;
        input[1] = 0;
        uint64_t result = IOConnectCallMethod(v8, 0x14u, input, 2u, 0, 0, 0, 0, __src, &__count);
        if (!result)
        {
          if (__count)
          {
            uint64_t v10 = calloc(__count, 1uLL);
            *uint64_t v5 = v10;
            if (v10)
            {
              memcpy(v10, __src, __count);
              uint64_t result = 0;
              *size_t v3 = __count;
            }
            else
            {
              return 3758097085;
            }
          }
          else
          {
            return 3758097136;
          }
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_drain_backup_keys", ":", 2072, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t aks_drain_backup_keys_info(uint64_t a1)
{
  int v1 = MEMORY[0x270FA5388](a1);
  size_t v3 = v2;
  uint64_t v5 = v4;
  int v6 = v1;
  uint64_t v14 = *MEMORY[0x263EF8340];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v8 = aks_client_connection;
    uint64_t result = 3758097090;
    if (v5)
    {
      if (v3)
      {
        bzero(__src, 0x8000uLL);
        size_t __count = 0x8000;
        input[0] = v6;
        input[1] = 1;
        uint64_t result = IOConnectCallMethod(v8, 0x14u, input, 2u, 0, 0, 0, 0, __src, &__count);
        if (!result)
        {
          if (__count)
          {
            if (__ROR8__(0xEF7BDEF7BDEF7BDFLL * __count, 2) > 0x210842108421084uLL)
            {
              return 3758604298;
            }
            else
            {
              uint64_t v10 = calloc(__count, 1uLL);
              *uint64_t v5 = v10;
              if (v10)
              {
                memcpy(v10, __src, __count);
                uint64_t result = 0;
                *size_t v3 = __count / 0x7C;
              }
              else
              {
                return 3758097085;
              }
            }
          }
          else
          {
            return 3758097136;
          }
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_drain_backup_keys_info", ":", 2100, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t aks_clear_backup_bag(int a1)
{
  input[1] = *MEMORY[0x263EF8340];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x16u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_clear_backup_bag", ":", 2129, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_set_backup_bag(uint64_t a1)
{
  int v1 = MEMORY[0x270FA5388](a1);
  size_t v3 = v2;
  uint64_t v5 = v4;
  int v7 = v6;
  uint64_t v9 = v8;
  int v11 = v10;
  int v12 = v1;
  uint64_t v23 = *MEMORY[0x263EF8340];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_backup_bag", ":", 2146, "", 0, "", "");
    return 3758097084;
  }
  mach_port_t v14 = aks_client_connection;
  if (v5)
  {
    if (!v3) {
      return 3758097090;
    }
    long long outputStruct = __src;
    p_count = &__count;
    uint64_t v17 = 1;
  }
  else
  {
    p_count = 0;
    long long outputStruct = 0;
    uint64_t v17 = 0;
  }
  bzero(__src, 0x8000uLL);
  size_t __count = 0x8000;
  input[0] = v12;
  input[1] = v11;
  uint64_t input[2] = v17;
  uint64_t input[3] = v9;
  uint64_t input[4] = v7;
  uint64_t result = IOConnectCallMethod(v14, 0x15u, input, 5u, 0, 0, 0, 0, outputStruct, p_count);
  if (v5 && !result)
  {
    long long v19 = calloc(__count, 1uLL);
    *uint64_t v5 = v19;
    if (v19)
    {
      memcpy(v19, __src, __count);
      uint64_t result = 0;
      *size_t v3 = __count;
    }
    else
    {
      return 3758097085;
    }
  }
  return result;
}

uint64_t aks_make_public_backup_bag(int a1, _DWORD *a2)
{
  input[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
    {
      uint64_t output = 0;
      input[0] = a1;
      uint32_t outputCnt = 1;
      uint64_t v4 = IOConnectCallMethod(aks_client_connection, 0x52u, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
      if (!v4) {
        *a2 = output;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_make_public_backup_bag", ":", 2178, "", 0, "", "");
  }
  return v4;
}

uint64_t aks_remote_session_reset(uint64_t a1)
{
  return remote_session_operate(a1);
}

uint64_t aks_remote_session_reset_all()
{
  return remote_session_operate(0);
}

uint64_t aks_get_device_state(uint64_t a1)
{
  return _get_device_state(a1);
}

uint64_t _get_device_state(uint64_t a1)
{
  int v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint32_t v5 = v4;
  input[1] = *MEMORY[0x263EF8340];
  input[0] = v1;
  *(void *)uint64_t v13 = 4096;
  uint64_t v6 = 3758097084;
  int v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long __s = 0u;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (v3)
    {
      mach_port_t v8 = aks_client_connection;
      bzero(outputStruct, 0x1000uLL);
      uint64_t v9 = IOConnectCallMethod(v8, v5, input, 1u, 0, 0, 0, 0, outputStruct, (size_t *)v13);
      if (v9)
      {
        return v9;
      }
      else
      {
        uint64_t v6 = 0;
        if (!decode_extended_state((uint64_t)outputStruct, v13[0], (char *)&__s))
        {
          long long v10 = v17;
          *(_OWORD *)(v3 + 32) = v16;
          *(_OWORD *)(v3 + 48) = v10;
          *(_WORD *)(v3 + 64) = v18;
          long long v11 = v15;
          *(_OWORD *)uint64_t v3 = __s;
          *(_OWORD *)(v3 + 16) = v11;
        }
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_get_device_state", ":", 2224, "", 0, "", "");
  }
  return v6;
}

uint64_t aks_get_extended_device_state(uint64_t a1)
{
  return _get_device_state(a1);
}

uint64_t aks_remote_peer_get_state(uint64_t a1)
{
  int v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  size_t v5 = v4;
  int v7 = v6;
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v8 = 3758097084;
  v13[0] = 4096;
  uint64_t input = v1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (v3)
    {
      mach_port_t v10 = aks_client_connection;
      bzero(outputStruct, 0x1000uLL);
      memset_s(v3, 0x10uLL, 0, 0x10uLL);
      uint64_t v11 = IOConnectCallMethod(v10, 0x39u, &input, 1u, v7, v5, 0, 0, outputStruct, v13);
      if (v11)
      {
        return v11;
      }
      else
      {
        uint64_t v18 = 0;
        long long v22 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v17 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v23 = 0u;
        uint64_t v24 = 0;
        v13[1] = (size_t)der_key_peer_unlock_token_status;
        long long v16 = (unint64_t)der_key_peer_unwrapped_escrow_record_status;
        int v19 = der_key_peer_wrapped_escrow_record_status;
        *(void *)&long long v22 = der_key_peer_flags;
        der_dict_iterate();
        *uint64_t v3 = der_get_number();
        v3[1] = der_get_number();
        v3[2] = der_get_number();
        uint64_t v8 = 0;
        v3[3] = der_get_number();
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_remote_peer_get_state", ":", 2255, "", 0, "", "");
  }
  return v8;
}

uint64_t aks_remote_peer_drop(int a1, const void *a2, size_t a3)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x3Au, input, 1u, a2, a3, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_remote_peer_drop", ":", 2292, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_lock_device(int a1, int a2)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2) {
      uint32_t v4 = 32;
    }
    else {
      uint32_t v4 = 8;
    }
    return IOConnectCallMethod(aks_client_connection, v4, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_lock_device", ":", 2307, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_lock_cx(int a1)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x8Du, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_lock_cx", ":", 2327, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_unlock_device(int a1, uint64_t a2, int a3)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  input[0] = a1;
  input[1] = a2;
  uint64_t input[2] = a3;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 9u, input, 3u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unlock_device", ":", 2342, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_obliterate_class_d()
{
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x13u, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_obliterate_class_d", ":", 2355, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_migrate_s_key(int a1, unsigned int a2, uint64_t a3, unsigned int a4, const void *a5, int a6)
{
  uint64_t input[4] = *MEMORY[0x263EF8340];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    input[1] = a2;
    uint64_t input[2] = a3;
    uint64_t input[3] = a4;
    return IOConnectCallMethod(aks_client_connection, 0x3Fu, input, 4u, a5, a6, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_migrate_s_key", ":", 2367, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_smartcard_register(int a1, uint64_t a2, uint64_t a3, unsigned int a4, const void *a5, size_t a6, void *a7, size_t *a8)
{
  uint64_t input[4] = *MEMORY[0x263EF8340];
  input[0] = a1;
  input[1] = a4;
  uint64_t input[2] = a2;
  uint64_t input[3] = a3;
  size_t __count = 2048;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v13 = aks_client_connection;
    bzero(__src, 0x800uLL);
    uint64_t v14 = IOConnectCallMethod(v13, 0x3Bu, input, 4u, a5, a6, 0, 0, __src, &__count);
    if (v14)
    {
      return v14;
    }
    else if (__count > 0x800)
    {
      return 3758604298;
    }
    else
    {
      uint64_t v15 = 0;
      if (a7 && a8)
      {
        if (__count)
        {
          long long v16 = calloc(__count, 1uLL);
          *a7 = v16;
          if (!v16) {
            return 3758097085;
          }
          memcpy(v16, __src, __count);
          size_t v17 = __count;
        }
        else
        {
          size_t v17 = 0;
        }
        uint64_t v15 = 0;
        *a8 = v17;
      }
    }
  }
  else
  {
    uint64_t v15 = 3758097084;
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_smartcard_register", ":", 2388, "", 0, "", "");
  }
  return v15;
}

uint64_t aks_smartcard_unregister(int a1)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x3Cu, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_smartcard_unregister", ":", 2412, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_smartcard_request_unlock(int a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a1;
  size_t __count = 2048;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v10 = aks_client_connection;
    bzero(__src, 0x800uLL);
    uint64_t v11 = IOConnectCallMethod(v10, 0x3Du, input, 1u, a2, a3, 0, 0, __src, &__count);
    if (v11)
    {
      return v11;
    }
    else if (__count > 0x800)
    {
      return 3758604298;
    }
    else
    {
      uint64_t v12 = 0;
      if (a4 && a5)
      {
        if (__count)
        {
          mach_port_t v13 = calloc(__count, 1uLL);
          *a4 = v13;
          if (!v13) {
            return 3758097085;
          }
          memcpy(v13, __src, __count);
          size_t v14 = __count;
        }
        else
        {
          size_t v14 = 0;
        }
        uint64_t v12 = 0;
        *a5 = v14;
      }
    }
  }
  else
  {
    uint64_t v12 = 3758097084;
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_smartcard_request_unlock", ":", 2429, "", 0, "", "");
  }
  return v12;
}

uint64_t aks_smartcard_unlock(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, size_t *a7)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a1;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(__src, 0x800uLL);
  size_t __count = 2048;
  aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 2, v10, v11, v12, v13, v14, a2);
  if (!*(void *)&inputStructCnt[1])
  {
    uint64_t v17 = 3758097085;
    goto LABEL_12;
  }
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_smartcard_unlock", ":", 2460, "", 0, "", "");
    uint64_t v17 = 3758097084;
    goto LABEL_12;
  }
  uint64_t v16 = IOConnectCallMethod(aks_client_connection, 0x3Eu, input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
  if (v16)
  {
    uint64_t v17 = v16;
    goto LABEL_12;
  }
  if (__count > 0x800)
  {
    uint64_t v17 = 3758604298;
    goto LABEL_12;
  }
  uint64_t v17 = 0;
  if (a6 && a7)
  {
    if (!__count)
    {
      size_t v19 = 0;
      goto LABEL_11;
    }
    uint64_t v18 = calloc(__count, 1uLL);
    *a6 = v18;
    uint64_t v17 = 3758097085;
    if (v18)
    {
      memcpy(v18, __src, __count);
      size_t v19 = __count;
LABEL_11:
      uint64_t v17 = 0;
      *a7 = v19;
    }
  }
LABEL_12:
  free(*(void **)&inputStructCnt[1]);
  return v17;
}

uint64_t aks_smartcard_get_sc_usk(unint64_t a1, uint64_t a2, uint64_t *a3, void *a4)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a3 && a4)
  {
    if (aks_smartcard_get_foo((uint64_t)der_key_sc_enc_sc_usk, 0, a1, a2, a3, a4)) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t aks_smartcard_get_foo(uint64_t a1, int a2, unint64_t a3, uint64_t a4, uint64_t *a5, void *a6)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a6 && a3 && a4 && a5 && a3 + a4 > a3)
  {
    der_dict_iterate();
    if (a2)
    {
      if (*a6 == 8)
      {
        uint64_t number = der_get_number();
        uint64_t result = 0;
        *a5 = number;
        return result;
      }
      return 0xFFFFFFFFLL;
    }
    uint64_t v11 = ccder_decode_tl();
    if (!v11) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v12 = v11;
    uint64_t result = 0;
    *a5 = v12;
    *a6 = 0;
  }
  return result;
}

uint64_t aks_smartcard_get_ec_pub(unint64_t a1, uint64_t a2, uint64_t *a3, void *a4)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a3 && a4)
  {
    if (aks_smartcard_get_foo((uint64_t)der_key_sc_auth_eph_pub, 0, a1, a2, a3, a4)) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t aks_smartcard_get_mode(unint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v5 = 8;
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = 0;
  uint64_t result = aks_smartcard_get_foo((uint64_t)der_key_sc_auth_mode, 1, a1, a2, &v6, &v5);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  *a3 = v6;
  return result;
}

uint64_t aks_smartcard_get_version(unint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v5 = 8;
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = 0;
  uint64_t result = aks_smartcard_get_foo((uint64_t)der_key_sc_auth_version, 1, a1, a2, &v6, &v5);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  *a3 = v6;
  return result;
}

uint64_t aks_se_fail(int a1)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x47u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_fail", ":", 2589, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_se_set_healthy(int a1)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x49u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_set_healthy", ":", 2605, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_se_set_secret(int a1, uint64_t a2, uint64_t a3)
{
  return __aks_se_set_secret(a1, a2, a3, 0x45u);
}

uint64_t __aks_se_set_secret(int a1, uint64_t a2, uint64_t a3, uint32_t a4)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  input[0] = a1;
  input[1] = a2;
  uint64_t input[2] = a3;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, a4, input, 3u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "__aks_se_set_secret", ":", 2621, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_se_set_secret_memento(int a1, uint64_t a2, uint64_t a3)
{
  return __aks_se_set_secret(a1, a2, a3, 0x8Cu);
}

uint64_t aks_se_recover(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  input[0] = a1;
  input[1] = a2;
  uint64_t input[2] = a3;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x46u, input, 3u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_recover", ":", 2649, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_change_secret_epilogue(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  input[0] = a1;
  input[1] = a2;
  uint64_t input[2] = a3;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x69u, input, 3u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_change_secret_epilogue", ":", 2665, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_se_get_reset_token_for_memento_secret(uint64_t a1)
{
  int v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t input[3] = *MEMORY[0x263EF8340];
  input[0] = v1;
  input[1] = v4;
  uint64_t input[2] = v5;
  bzero(__s, 0x1000uLL);
  __n[0] = 4096;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    uint64_t v9 = 3758097084;
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_get_reset_token_for_memento_secret", ":", 2683, "", 0, "", "");
    goto LABEL_10;
  }
  uint64_t v7 = IOConnectCallMethod(aks_client_connection, 0x48u, input, 3u, 0, 0, 0, 0, __s, __n);
  if (v7)
  {
    uint64_t v9 = v7;
    goto LABEL_10;
  }
  if (__n[0] - 4097 < 0xFFFFFFFFFFFFF000)
  {
    uint64_t v9 = 3758604298;
    goto LABEL_10;
  }
  uint64_t v16 = 0;
  long long v15 = 0u;
  long long v13 = 0u;
  long long v12 = 0u;
  __n[1] = (rsize_t)der_key_config_se_reset_token;
  long long v14 = (unint64_t)der_key_config_se_slot;
  der_dict_iterate();
  if ((void)v12)
  {
    ccder_decode_tl();
LABEL_9:
    uint64_t v9 = 0;
    goto LABEL_10;
  }
  if (!*((void *)&v14 + 1)) {
    goto LABEL_9;
  }
  unint64_t number = der_get_number();
  if (number > 0xFF) {
    goto LABEL_9;
  }
  uint64_t v9 = 0;
  *uint64_t v3 = number;
LABEL_10:
  memset_s(__s, __n[0], 0, __n[0]);
  return v9;
}

uint64_t aks_se_get_reset_token(uint64_t a1)
{
  return aks_se_get_reset_token_for_memento_secret(a1);
}

uint64_t aks_se_set_nonce(int a1, const void *a2, size_t a3)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2) {
      size_t v6 = a3;
    }
    else {
      size_t v6 = 0;
    }
    return IOConnectCallMethod(aks_client_connection, 0x58u, input, 1u, a2, v6, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_set_nonce", ":", 2737, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_se_get_reset_sig(uint64_t a1)
{
  int v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  input[1] = *MEMORY[0x263EF8340];
  input[0] = v1;
  bzero(&__s, 0x1000uLL);
  size_t __n = 4096;
  uint64_t v10 = 3758097090;
  if (v9)
  {
    if (v7)
    {
      uint64_t v10 = 3758097090;
      if (v5)
      {
        if (v3)
        {
          mach_port_t aks_client_connection = get_aks_client_connection();
          if (aks_client_connection)
          {
            uint64_t v12 = IOConnectCallMethod(aks_client_connection, 0x5Au, input, 1u, 0, 0, 0, 0, &__s, &__n);
            if (v12)
            {
              uint64_t v10 = v12;
            }
            else if (__n - 4097 < 0xFFFFFFFFFFFFF005)
            {
              uint64_t v10 = 3758604298;
            }
            else
            {
              long long v13 = calloc(5uLL, 1uLL);
              *uint64_t v5 = v13;
              if (v13)
              {
                *uint64_t v3 = 5;
                int v14 = __s;
                v13[4] = v20;
                *(_DWORD *)long long v13 = v14;
                long long v15 = calloc(__n - 5, 1uLL);
                *uint64_t v9 = v15;
                uint64_t v10 = 3758097085;
                if (v15)
                {
                  size_t v16 = __n;
                  *uint64_t v7 = __n - 5;
                  memcpy(v15, v21, v16);
                  uint64_t v10 = 0;
                }
              }
              else
              {
                uint64_t v10 = 3758097085;
              }
            }
          }
          else
          {
            fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_get_reset_sig", ":", 2759, "", 0, "", "");
            uint64_t v10 = 3758097084;
          }
        }
      }
    }
  }
  memset_s(&__s, __n, 0, __n);
  return v10;
}

uint64_t aks_se_get_reset_pubkey(uint64_t a1)
{
  int v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  input[1] = *MEMORY[0x263EF8340];
  input[0] = v1;
  size_t v6 = 4096;
  bzero(__src, 0x1000uLL);
  size_t __count = 4096;
  uint64_t v7 = 3758097090;
  if (v5 && v3)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      uint64_t v9 = IOConnectCallMethod(aks_client_connection, 0x59u, input, 1u, 0, 0, 0, 0, __src, &__count);
      size_t v6 = __count;
      if (v9)
      {
        uint64_t v7 = v9;
      }
      else if (__count - 4097 < 0xFFFFFFFFFFFFF000)
      {
        uint64_t v7 = 3758604298;
      }
      else
      {
        uint64_t v10 = calloc(__count, 1uLL);
        *uint64_t v5 = v10;
        size_t v6 = __count;
        if (v10)
        {
          *uint64_t v3 = __count;
          memcpy(v10, __src, v6);
          uint64_t v7 = 0;
          size_t v6 = __count;
        }
        else
        {
          uint64_t v7 = 3758097085;
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_get_reset_pubkey", ":", 2791, "", 0, "", "");
      size_t v6 = 4096;
      uint64_t v7 = 3758097084;
    }
  }
  memset_s(__src, v6, 0, v6);
  return v7;
}

uint64_t aks_se_delete_reset_token(int a1)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x5Bu, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_delete_reset_token", ":", 2815, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_se_support_in_rm(unsigned int a1)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x5Eu, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_support_in_rm", ":", 2832, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_se_support_in_rm_is_set(BOOL *a1)
{
  output[1] = *MEMORY[0x263EF8340];
  output[0] = 0;
  uint32_t outputCnt = 1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t result = IOConnectCallMethod(aks_client_connection, 0x6Bu, 0, 0, 0, 0, output, &outputCnt, 0, 0);
    if (a1)
    {
      if (!result) {
        *a1 = output[0] != 0;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_support_in_rm_is_set", ":", 2848, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t aks_se_stage_stash()
{
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x5Fu, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_stage_stash", ":", 2865, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_fv_lock_volume_bag()
{
  return aks_fv_set_protection(0);
}

uint64_t aks_fv_unwrap_vek(uint64_t a1)
{
  return aks_fv_unwrap_vek_with_acm(a1);
}

uint64_t aks_fv_get_blob_state(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = v1;
  uint64_t v15 = *MEMORY[0x263EF8340];
  bzero(__s, 0x1000uLL);
  *(void *)&long long v12 = __s;
  *((void *)&v12 + 1) = &v15;
  *(void *)long long v13 = 4096;
  uint64_t v7 = 3758097090;
  if (v5 && v3)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      mach_port_t v9 = aks_client_connection;
      if (der_utils_encode_fv_data(&v12, v5) && der_utils_encode_fv_params(&v12, v6))
      {
        uint64_t v7 = 3758097098;
        if (ccder_blob_encode_tl())
        {
          uint64_t v10 = IOConnectCallMethod(v9, 0x55u, 0, 0, *((const void **)&v12 + 1), (size_t)&v15 - *((void *)&v12 + 1), 0, 0, __s, (size_t *)v13);
          if (!v10) {
            uint64_t v10 = decode_fv_blob_state((uint64_t)__s, *(uint64_t *)v13, v3);
          }
          uint64_t v7 = v10;
        }
      }
      else
      {
        uint64_t v7 = 3758097098;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_get_blob_state", ":", 2900, "", 0, "", "");
      uint64_t v7 = 3758097084;
    }
  }
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v7;
}

uint64_t aks_fv_get_last_known_gp_state(long long *a1)
{
  char v7 = 0;
  uint64_t v5 = &v7;
  uint64_t v6 = 1;
  long long v3 = 0uLL;
  uint64_t v4 = 0;
  if (a1)
  {
    long long v3 = *a1;
    uint64_t v4 = *((void *)a1 + 2);
    uint64_t v1 = *((void *)&v3 + 1) | 0x10;
  }
  else
  {
    uint64_t v1 = 16;
  }
  *((void *)&v3 + 1) = v1;
  return aks_fv_get_blob_state((uint64_t)&v3);
}

uint64_t aks_fv_get_size(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  long long v3 = v2;
  uint64_t v4 = v1;
  input[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = 3758097098;
  uint64_t output = 0;
  input[0] = v6;
  uint32_t outputCnt = 1;
  bzero(__s, 0x1000uLL);
  *(void *)&long long v10 = __s;
  *((void *)&v10 + 1) = &output;
  if (v3)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      mach_port_t v8 = aks_client_connection;
      if (der_utils_encode_fv_params(&v10, v4))
      {
        if (ccder_blob_encode_tl())
        {
          uint64_t v5 = IOConnectCallMethod(v8, 0x4Eu, input, 1u, *((const void **)&v10 + 1), (size_t)&input[-1] - *((void *)&v10 + 1), &output, &outputCnt, 0, 0);
          if (!v5) {
            *long long v3 = output;
          }
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_get_size", ":", 2943, "", 0, "", "");
      uint64_t v5 = 3758097084;
    }
  }
  else
  {
    uint64_t v5 = 3758097090;
  }
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v5;
}

uint64_t aks_fv_import(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  long long v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = v1;
  input[1] = *MEMORY[0x263EF8340];
  input[0] = v9;
  bzero(__s, 0x1000uLL);
  *(void *)&long long v16 = __s;
  *((void *)&v16 + 1) = input;
  size_t v17 = 4096;
  uint64_t v10 = 3758097090;
  if (v7 && v5)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (!aks_client_connection)
    {
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_import", ":", 2971, "", 0, "", "");
      uint64_t v10 = 3758097084;
      goto LABEL_14;
    }
    mach_port_t v12 = aks_client_connection;
    if (!ccder_blob_encode_body_tl()
      || !der_utils_encode_fv_data(&v16, v7)
      || !der_utils_encode_fv_params(&v16, v8)
      || !ccder_blob_encode_tl())
    {
      goto LABEL_12;
    }
    uint64_t v13 = IOConnectCallMethod(v12, 0x4Fu, input, 1u, *((const void **)&v16 + 1), (size_t)input - *((void *)&v16 + 1), 0, 0, __s, &v17);
    if (v13)
    {
      uint64_t v10 = v13;
      goto LABEL_14;
    }
    *(void *)&long long v15 = __s;
    *((void *)&v15 + 1) = &__s[v17];
    if (!ccder_blob_decode_range()) {
      goto LABEL_12;
    }
    if (!v3)
    {
      uint64_t v10 = 0;
      goto LABEL_14;
    }
    uint64_t v10 = 0;
    if ((der_utils_decode_fv_data(&v15, 0, v3) & 1) == 0) {
LABEL_12:
    }
      uint64_t v10 = 3758097098;
  }
LABEL_14:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v10;
}

uint64_t aks_fv_get_verifier_size()
{
  return aks_fv_get_size(0);
}

uint64_t aks_fv_get_access_token_size()
{
  return aks_fv_get_size(0);
}

uint64_t aks_fv_new_verifier()
{
  return aks_fv_new_kek(0);
}

uint64_t aks_fv_rewrap_verifier()
{
  return aks_fv_rewrap_kek(0);
}

uint64_t aks_fv_new_access_token()
{
  v1[0] = 0;
  v1[1] = 2;
  v1[2] = 0;
  return aks_fv_new_vek((uint64_t)v1);
}

uint64_t aks_fv_new_unbound_access_token(char a1)
{
  uint64_t v1 = 130;
  if ((a1 & 6) == 0) {
    uint64_t v1 = 2;
  }
  v3[0] = 0;
  v3[1] = v1;
  v3[2] = 0;
  return aks_fv_new_vek((uint64_t)v3);
}

uint64_t aks_fv_bind_access_token()
{
  return aks_fv_set_protection(0);
}

uint64_t aks_fv_is_access_token_unbound(uint64_t a1, BOOL *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  memset(v4, 0, sizeof(v4));
  uint64_t v10 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v5 = 0u;
  if (!a2) {
    return 3758097090;
  }
  uint64_t result = aks_fv_get_blob_state((uint64_t)v4);
  if (!result)
  {
    if (v5 == 1)
    {
      uint64_t result = 0;
      *a2 = (DWORD1(v7) & 0x8000000) != 0;
    }
    else
    {
      return 3758604312;
    }
  }
  return result;
}

uint64_t aks_fv_load_access_token_as_system_keychain()
{
  return aks_fv_set_protection(0);
}

uint64_t aks_fv_verify_user_opts()
{
  return aks_fv_unwrap_vek_with_acm(0);
}

uint64_t aks_fv_grant_ownership(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = v1;
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v11 = 3758097098;
  bzero(v16, 0x1000uLL);
  bzero(v15, 0x1000uLL);
  *(void *)&long long v14 = v16;
  *((void *)&v14 + 1) = &v17;
  *(void *)&long long v13 = v15;
  *((void *)&v13 + 1) = v16;
  if (der_utils_encode_fv_data(&v14, v9)
    && der_utils_encode_fv_data(&v14, v7)
    && ccder_blob_encode_tl()
    && der_utils_encode_fv_data(&v13, v5)
    && der_utils_encode_fv_data(&v13, v3)
    && ccder_blob_encode_tl())
  {
    return aks_fv_set_protection(v10);
  }
  return v11;
}

uint64_t aks_fv_owners_exist(uint64_t a1)
{
  return aks_fv_set_protection(a1);
}

uint64_t aks_fv_remove_external_kek_group(uint64_t a1)
{
  v2[3] = a1;
  memset(v2, 0, 24);
  return aks_fv_set_protection((uint64_t)v2);
}

uint64_t aks_fv_sidp_status(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = v1;
  uint64_t v9 = *MEMORY[0x263EF8340];
  bzero(v8, 0x4000uLL);
  uint64_t result = aks_fv_set_protection(v6);
  if (!result)
  {
    if (ccder_decode_sequence_tl() && ccder_decode_tl())
    {
      __memcpy_chk();
      if (v5) {
        *uint64_t v5 = 0;
      }
      if (v3) {
        *uint64_t v3 = 0;
      }
      return 0;
    }
    else
    {
      return 3758097084;
    }
  }
  return result;
}

uint64_t aks_fv_stash_kek()
{
  return aks_fv_set_protection(0);
}

uint64_t aks_fv_stash_kek_with_secret(int a1)
{
  uint64_t v1 = 8;
  if (a1) {
    uint64_t v1 = 12;
  }
  uint64_t v4 = 0;
  uint64_t v5 = v1;
  uint64_t v6 = 0;
  uint64_t v2 = aks_fv_set_protection((uint64_t)&v4);
  syslog(6, "aks_fv_prot_cmd_stash_kek(%llu) = %d", v5, v2);
  return v2;
}

uint64_t aks_fv_commit_stashed_kek()
{
  uint64_t v0 = aks_fv_set_protection(0);
  syslog(6, "aks_fv_prot_cmd_stash_commit = %d", v0);
  return v0;
}

uint64_t aks_fv_destroy_stashed_kek()
{
  uint64_t v0 = aks_fv_set_protection(0);
  syslog(6, "aks_fv_prot_cmd_stash_destroy = %d", v0);
  return v0;
}

uint64_t aks_fv_verify_user()
{
  return aks_fv_unwrap_vek_with_acm(0);
}

uint64_t aks_fv_delete_verifier()
{
  return aks_fv_set_protection(0);
}

uint64_t aks_absinthe_collection(uint64_t a1)
{
  unsigned int v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  input[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = 3758097084;
  input[0] = v1;
  bzero(__src, 0x8000uLL);
  size_t __count = 0x8000;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  if (v5)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      mach_port_t v15 = aks_client_connection;
      if (v7) {
        long long v16 = v7;
      }
      else {
        long long v16 = "";
      }
      aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 2, v10, v11, v12, v13, v14, (uint64_t)v16);
      uint64_t v17 = IOConnectCallMethod(v15, 0x50u, input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
      if (v17)
      {
        uint64_t v8 = v17;
      }
      else
      {
        uint64_t v18 = calloc(__count, 1uLL);
        *uint64_t v5 = v18;
        if (v18)
        {
          memcpy(v18, __src, __count);
          uint64_t v8 = 0;
          *uint64_t v3 = (int)__count;
        }
        else
        {
          uint64_t v8 = 3758097085;
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_absinthe_collection", ":", 3220, "", 0, "", "");
    }
  }
  else
  {
    uint64_t v8 = 3758097090;
  }
  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  free(*(void **)&inputStructCnt[1]);
  return v8;
}

uint64_t aks_absinthe_generate(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, size_t *a7)
{
  input[1] = *MEMORY[0x263EF8340];
  long long v21 = 0;
  input[0] = a1;
  int v20 = 0;
  uint64_t v7 = 3758097090;
  if (a2 && a6 && a7)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      mach_port_t v17 = aks_client_connection;
      aks_pack_data(&v21, (unsigned int *)&v20, 2, v12, v13, v14, v15, v16, a2);
      size_t v19 = *a7;
      uint64_t v7 = IOConnectCallMethod(v17, 0x51u, input, 1u, v21, v20, 0, 0, a6, &v19);
      if (!v7) {
        *a7 = (int)v19;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_absinthe_generate", ":", 3253, "", 0, "", "");
      uint64_t v7 = 3758097084;
    }
  }
  free(v21);
  return v7;
}

uint64_t aks_drop_auxiliary_auth_by_uid(unsigned int a1)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  input[0] = 0;
  input[1] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x53u, input, 2u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_drop_auxiliary_auth_by_uid", ":", 3280, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_drop_auxiliary_auth_by_handle(int a1)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  input[0] = 1;
  input[1] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x53u, input, 2u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_drop_auxiliary_auth_by_handle", ":", 3296, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_lower_iteration_count()
{
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x5Cu, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_lower_iteration_count", ":", 3310, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_se_secret_drop(int a1)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x6Au, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_secret_drop", ":", 3326, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_get_current_sep_measurement(uint64_t a1, uint64_t a2)
{
  if (a1 && a2 && !aks_get_internal_info_for_key(0xFFFFFFFFLL)) {
    der_dict_get_data((uint64_t)der_key_sep_measurement);
  }
  free(0);
  return 3758097084;
}

uint64_t aks_get_internal_info(uint64_t a1)
{
  return aks_get_internal_info_for_key(a1);
}

uint64_t aks_get_seconds_since_passcode_change(uint64_t a1, void *a2)
{
  uint64_t v3 = 3758097084;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v7 = 0;
  if (!aks_get_internal_info_for_key(a1)
    && der_dict_get_number((uint64_t)der_key_passcode_change_time, (uint64_t)v9, (uint64_t)v9 + v8, (uint64_t)&v7))
  {
    if (a2)
    {
      time_t v4 = time(0);
      uint64_t v3 = 0;
      time_t v5 = v4 - v7;
      if (v4 <= v7) {
        time_t v5 = 0;
      }
      *a2 = v5;
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  free(v9);
  return v3;
}

uint64_t aks_get_internal_state(uint64_t a1)
{
  int v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  input[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = 3758097090;
  input[0] = v1;
  bzero(__s, 0x1000uLL);
  rsize_t __n = 4096;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_internal_state", ":", 3405, "", 0, "", "");
    uint64_t v4 = 3758097084;
    goto LABEL_11;
  }
  if (!v3)
  {
LABEL_11:
    rsize_t v7 = 4096;
    goto LABEL_9;
  }
  uint64_t v6 = IOConnectCallMethod(aks_client_connection, 0x8Eu, input, 1u, 0, 0, 0, 0, __s, &__n);
  rsize_t v7 = __n;
  if (v6)
  {
    uint64_t v4 = v6;
  }
  else if (__n - 4097 >= 0xFFFFFFFFFFFFF000)
  {
    if (decode_extended_state((uint64_t)__s, __n, v3)) {
      uint64_t v4 = 3758097090;
    }
    else {
      uint64_t v4 = 0;
    }
    rsize_t v7 = __n;
  }
LABEL_9:
  memset_s(__s, v7, 0, v7);
  return v4;
}

uint64_t aks_fairplay_wrap(const void *a1, size_t a2, void *a3, size_t *a4)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = 266;
  uint64_t result = 3758097090;
  if (a3 && a4)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      size_t v10 = *a4;
      uint64_t result = IOConnectCallMethod(aks_client_connection, 0x68u, input, 1u, a1, a2, 0, 0, a3, &v10);
      if (!result) {
        *a4 = (int)v10;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fairplay_wrap", ":", 3431, "", 0, "", "");
      return 3758097084;
    }
  }
  return result;
}

uint64_t _fairplay_generate_csk_internal(unsigned int a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = ((unint64_t)a1 << 8) | 1;
  uint64_t result = 3758097090;
  if (a4 && a5)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      size_t v11 = *a5;
      uint64_t result = IOConnectCallMethod(aks_client_connection, 0x68u, input, 1u, a2, a3, 0, 0, a4, &v11);
      if (!result) {
        *a5 = (int)v11;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_fairplay_generate_csk_internal", ":", 3455, "", 0, "", "");
      return 3758097084;
    }
  }
  return result;
}

uint64_t aks_fairplay_generate_csk(const void *a1, size_t a2, void *a3, size_t *a4)
{
  return _fairplay_generate_csk_internal(0, a1, a2, a3, a4);
}

uint64_t aks_fairplay_generate_csk_v1(const void *a1, size_t a2, void *a3, size_t *a4)
{
  return _fairplay_generate_csk_internal(1u, a1, a2, a3, a4);
}

uint64_t aks_bak_get_beacon_internal(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  time_t v5 = v4;
  size_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = v1;
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  memset(v20, 0, sizeof(v20));
  bzero(__s, 0x4000uLL);
  size_t v16 = 0x4000;
  input[0] = 1;
  input[1] = v10;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v12 = IOConnectCallMethod(aks_client_connection, 0x87u, input, 2u, v9, v7, 0, 0, __s, &v16);
    if (v12)
    {
      uint64_t v14 = v12;
    }
    else
    {
      __memcpy_chk();
      *uint64_t v3 = 44;
      uint64_t v13 = calloc(0x2CuLL, 1uLL);
      *time_t v5 = v13;
      if (v13)
      {
        __memcpy_chk();
        uint64_t v14 = 0;
      }
      else
      {
        uint64_t v14 = 3758097085;
      }
    }
  }
  else
  {
    uint64_t v14 = 3758097084;
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_bak_get_beacon_internal", ":", 3491, "", 0, "", "");
  }
  memset_s(__s, 0x4000uLL, 0, 0x4000uLL);
  return v14;
}

uint64_t aks_bak_get_beacon(int a1, unsigned int a2)
{
  uint64_t beacon_internal = aks_bak_get_beacon_internal(a1 ^ 1u | ((unint64_t)a2 << 16));
  if (beacon_internal) {
    return beacon_internal;
  }
  else {
    return 3758604312;
  }
}

uint64_t aks_bak_get_swizzler_internal(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  time_t v5 = v4;
  size_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t input[2] = *MEMORY[0x263EF8340];
  input[0] = 2;
  input[1] = v1;
  int v37 = 0;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  memset(v27, 0, sizeof(v27));
  bzero(__s, 0x4000uLL);
  size_t v25 = 0x4000;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v11 = IOConnectCallMethod(aks_client_connection, 0x87u, input, 2u, 0, 0, 0, 0, __s, &v25);
    if (v11)
    {
      uint64_t v12 = v11;
    }
    else
    {
      uint64_t v12 = 3758097085;
      __memcpy_chk();
      uint64_t v13 = calloc(0x28uLL, 1uLL);
      *uint64_t v9 = v13;
      if (v13)
      {
        *size_t v7 = 40;
        long long v14 = *(_OWORD *)&v27[1];
        long long v15 = *(_OWORD *)&v27[3];
        v13[4] = v27[5];
        *(_OWORD *)uint64_t v13 = v14;
        *((_OWORD *)v13 + 1) = v15;
        size_t v16 = calloc(0x91uLL, 1uLL);
        *time_t v5 = v16;
        if (v16)
        {
          uint64_t v12 = 0;
          *uint64_t v3 = 145;
          long long v17 = v29;
          *size_t v16 = v28;
          v16[1] = v17;
          long long v18 = v30;
          long long v19 = v31;
          long long v20 = v33;
          v16[4] = v32;
          v16[5] = v20;
          void v16[2] = v18;
          void v16[3] = v19;
          long long v21 = v34;
          long long v22 = v35;
          long long v23 = v36;
          *((unsigned char *)v16 + 144) = v37;
          v16[7] = v22;
          v16[8] = v23;
          v16[6] = v21;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_bak_get_swizzler_internal", ":", 3551, "", 0, "", "");
    uint64_t v12 = 3758097084;
  }
  memset_s(__s, 0x4000uLL, 0, 0x4000uLL);
  memset_s(v27, 0xC4uLL, 0, 0xC4uLL);
  return v12;
}

uint64_t aks_bak_get_swizzler()
{
  return aks_bak_get_swizzler_internal(0);
}

uint64_t aks_test_stashed_kek(uint64_t a1)
{
  mach_port_t akstest_client_connection = get_akstest_client_connection();
  if (akstest_client_connection) {
    return IOConnectCallMethod(akstest_client_connection, 0xCu, 0, 0, *(const void **)a1, *(void *)(a1 + 8), 0, 0, 0, 0);
  }
  else {
    return 3758097084;
  }
}

uint64_t aks_get_dsme_key(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v4 = (void *)v1;
  uint64_t v13 = *MEMORY[0x263EF8340];
  bzero(__src, 0x4000uLL);
  size_t __count = 0x4000;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v6 = 3758097090;
    if (v4 && v3)
    {
      uint64_t v7 = IOConnectCallMethod(aks_client_connection, 0x96u, 0, 0, 0, 0, 0, 0, __src, &__count);
      if (v7)
      {
        uint64_t v6 = v7;
      }
      else
      {
        uint64_t v8 = calloc(__count, 1uLL);
        *uint64_t v4 = v8;
        if (v8)
        {
          size_t v9 = __count;
          *uint64_t v3 = __count;
          memcpy(v8, __src, v9);
          uint64_t v6 = 0;
        }
        else
        {
          uint64_t v6 = 3758097085;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_dsme_key", ":", 3600, "", 0, "", "");
    uint64_t v6 = 3758097084;
  }
  memset_s(__src, 0x4000uLL, 0, 0x4000uLL);
  return v6;
}

BOOL aks_bag_in_xart(uint64_t a1, uint64_t a2)
{
  return a2 == 4 || a2 == 32;
}

uint64_t aks_prewarm_sps()
{
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x73u, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_prewarm_sps", ":", 3627, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_sealed_hashes_set(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = 4294967285;
  if (a3 && a4 <= 0x30)
  {
    uint64_t v4 = 3758097084;
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      mach_port_t v6 = aks_client_connection;
      ccder_sizeof_raw_octet_string();
      ccder_sizeof_uint64();
      ccder_sizeof_raw_octet_string();
      uint64_t v7 = ccder_sizeof();
      size_t v8 = v7;
      MEMORY[0x270FA5388](v7);
      uint64_t v10 = (char *)v12 - v9;
      bzero((char *)v12 - v9, v8);
      ccder_encode_raw_octet_string();
      ccder_encode_uint64();
      ccder_encode_raw_octet_string();
      if ((char *)ccder_encode_constructed_tl() == v10) {
        return IOConnectCallMethod(v6, 0x72u, 0, 0, v10, v8, 0, 0, 0, 0);
      }
      else {
        return 3758097090;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_sealed_hashes_set", ":", 3644, "", 0, "", "");
    }
  }
  return v4;
}

uint64_t aks_measure_and_seal_cryptex_manifest(const void *a1, size_t a2)
{
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x90u, 0, 0, a1, a2, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_measure_and_seal_cryptex_manifest", ":", 3674, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_seal_cryptex_manifest_lock()
{
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x95u, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_seal_cryptex_manifest_lock", ":", 3688, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_lkgp_recover(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  input[0] = a1;
  input[1] = a2;
  uint64_t input[2] = a3;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x85u, input, 3u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_lkgp_recover", ":", 3704, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_memento_efface_blob(int a1)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x8Au, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_memento_efface_blob", ":", 3720, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_memento_get_state(uint64_t a1)
{
  int v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  input[1] = *MEMORY[0x263EF8340];
  input[0] = v1;
  bzero(__s, 0x1000uLL);
  rsize_t __n = 4096;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v5 = IOConnectCallMethod(aks_client_connection, 0x8Bu, input, 1u, 0, 0, 0, 0, __s, &__n);
    rsize_t v6 = __n;
    if (v5)
    {
      uint64_t v7 = v5;
    }
    else
    {
      uint64_t v7 = 3758097090;
      if (__n - 4097 >= 0xFFFFFFFFFFFFF000)
      {
        if (decode_memento_state((uint64_t)__s, __n, v3)) {
          uint64_t v7 = 3758097090;
        }
        else {
          uint64_t v7 = 0;
        }
        rsize_t v6 = __n;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_memento_get_state", ":", 3738, "", 0, "", "");
    uint64_t v7 = 3758097084;
    rsize_t v6 = 4096;
  }
  memset_s(__s, v6, 0, v6);
  return v7;
}

uint64_t aks_set_jcop_supports_updated_kud_policy()
{
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x89u, &input, 0, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_jcop_supports_updated_kud_policy", ":", 3758, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_set_cx_window(uint64_t a1)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x97u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_cx_window", ":", 3774, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_get_cx_window(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  outputStruct[512] = *MEMORY[0x263EF8340];
  size_t v6 = 4096;
  if (!v1) {
    return 4294967285;
  }
  uint64_t v2 = (void *)v1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v4 = aks_client_connection;
    bzero(outputStruct, 0x1000uLL);
    uint64_t result = IOConnectCallMethod(v4, 0x98u, 0, 0, 0, 0, 0, 0, outputStruct, &v6);
    if (!result)
    {
      if (v6 == 8)
      {
        uint64_t result = 0;
        void *v2 = outputStruct[0];
      }
      else
      {
        return 3758604298;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_cx_window", ":", 3791, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t get_aks_log_pid()
{
  return 0;
}

uint64_t compress_uuid()
{
  return 0;
}

unint64_t time_seconds_to_abs_interval(unsigned int a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  return 1000000000 * info.denom * (unint64_t)a1 / info.numer;
}

unint64_t time_absolute_to_nanoseconds(uint64_t a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  return (unint64_t)info.numer * a1 / info.denom;
}

uint64_t get_usec_time()
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  return mach_continuous_time() * info.numer / info.denom / 0x3E8;
}

__darwin_time_t get_clock_time()
{
  v1.tv_sec = 0;
  *(void *)&v1.tv_usec = 0;
  gettimeofday(&v1, 0);
  return v1.tv_sec;
}

uint64_t ipc_seconds_to_microsecond_interval(uint64_t a1)
{
  return 1000000 * a1;
}

unint64_t ipc_microseconds_to_seconds(uint64_t a1)
{
  return (a1 + 999999) / 0xF4240uLL;
}

void *circular_queue_init(unsigned int a1, unsigned int a2)
{
  uint64_t v2 = a1 + 1;
  uint64_t v3 = v2 << 31 >> 31;
  if (v3 != v2 || v3 < 0)
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s overflow%s\n", "aks", "", "", "", "circular_queue_init", ":", 341, "", 0, "", "");
    return 0;
  }
  else
  {
    uint64_t v5 = calloc(0x20uLL, 1uLL);
    size_t v6 = v5;
    if (v5)
    {
      v5[1] = 0;
      size_t v7 = (v3 & 0x1FFFFFFFFLL) * a2;
      *(_DWORD *)uint64_t v5 = a2;
      *((_DWORD *)v5 + 1) = v2;
      size_t v8 = calloc(v7, 1uLL);
      v6[2] = v7;
      v6[3] = v8;
    }
  }
  return v6;
}

uint64_t circular_queue_size(_DWORD *a1)
{
  unsigned int v3 = a1[2];
  unsigned int v2 = a1[3];
  uint64_t result = v2 - v3;
  if (v2 < v3) {
    return (result + a1[1]);
  }
  return result;
}

uint64_t circular_queue_enqueue(unsigned int *a1, const void *a2)
{
  unsigned int v3 = a1[3];
  unsigned int v4 = (v3 + 1) % a1[1];
  memcpy((void *)(*((void *)a1 + 3) + *a1 * v3), a2, *a1);
  a1[3] = v4;
  if (v4 == a1[2]) {
    a1[2] = (v4 + 1) % a1[1];
  }
  return 0;
}

uint64_t circular_queue_dequeue(unsigned int *a1, void *__dst)
{
  unsigned int v2 = a1[2];
  if (v2 == a1[3]) {
    return 0xFFFFFFFFLL;
  }
  if (__dst)
  {
    memcpy(__dst, (const void *)(*((void *)a1 + 3) + *a1 * v2), *a1);
    unsigned int v2 = a1[2];
  }
  memset_s((void *)(*((void *)a1 + 3) + *a1 * v2), *a1, 0, *a1);
  uint64_t result = 0;
  a1[2] = (a1[2] + 1) % a1[1];
  return result;
}

uint64_t circular_queue_peek(unsigned int *a1, void *__dst)
{
  unsigned int v2 = a1[2];
  if (v2 == a1[3]) {
    return 0xFFFFFFFFLL;
  }
  memcpy(__dst, (const void *)(*((void *)a1 + 3) + *a1 * v2), *a1);
  return 0;
}

uint64_t circular_queue_dequeue_all(int *a1, void *a2, unsigned int *a3)
{
  unsigned int v7 = a1[2];
  unsigned int v6 = a1[3];
  unsigned int v8 = v6 - v7;
  if (v6 < v7) {
    v8 += a1[1];
  }
  if (!v8) {
    return 0;
  }
  unsigned int v9 = *a1 * v8;
  uint64_t v10 = (char *)calloc(v9, 1uLL);
  if (!v10) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v11 = v10;
  unsigned int v12 = a1[2];
  unsigned int v13 = a1[3];
  if (v13 <= v12)
  {
    if (v12 <= v13) {
      goto LABEL_13;
    }
    unsigned int v17 = a1[1] - v12;
    memcpy(v10, (const void *)(*((void *)a1 + 3) + *a1 * v12), *a1 * v17);
    if (v8 <= v17) {
      goto LABEL_13;
    }
    uint64_t v10 = &v11[*a1 * v17];
    long long v14 = (const void *)*((void *)a1 + 3);
    size_t v15 = *a1 * (v8 - v17);
  }
  else
  {
    long long v14 = (const void *)(*((void *)a1 + 3) + *a1 * v12);
    size_t v15 = *a1 * v8;
  }
  memcpy(v10, v14, v15);
LABEL_13:
  unsigned int v18 = a1[1];
  int v19 = *a1;
  a1[2] = (a1[2] + v8) % v18;
  memset_s(*((void **)a1 + 3), v19 * v18, 0, v19 * v18);
  uint64_t result = 0;
  *a2 = v11;
  *a3 = v9;
  return result;
}

uint64_t circular_queue_clear(uint64_t a1)
{
  *(void *)(a1 + 8) = 0;
  rsize_t v1 = (*(_DWORD *)a1 * *(_DWORD *)(a1 + 4));
  return memset_s(*(void **)(a1 + 24), v1, 0, v1);
}

void circular_queue_free(void *a1)
{
  *((void *)a1 + 1) = 0;
  rsize_t v2 = (*(_DWORD *)a1 * *((_DWORD *)a1 + 1));
  memset_s(*((void **)a1 + 3), v2, 0, v2);
  memset_s(*((void **)a1 + 3), *((void *)a1 + 2), 0, *((void *)a1 + 2));
  free(*((void **)a1 + 3));
  memset_s(a1, 0x20uLL, 0, 0x20uLL);
  free(a1);
}

uint64_t class_gen_get(unsigned int a1)
{
  return (a1 >> 5) & 1;
}

BOOL persona_uuid_is_valid(uint8x16_t *a1)
{
  int8x16_t v1 = (int8x16_t)vmovl_high_u8(*a1);
  int8x16_t v2 = (int8x16_t)vmovl_u8(*(uint8x8_t *)a1->i8);
  int8x16_t v3 = (int8x16_t)vmovl_u16((uint16x4_t)vorr_s8(vorr_s8(*(int8x8_t *)v2.i8, *(int8x8_t *)v1.i8), vorr_s8((int8x8_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL), (int8x8_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL))));
  return vorr_s8(*(int8x8_t *)v3.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL)) != 0;
}

BOOL is_non_zero(unsigned __int8 *a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  int v2 = 0;
  do
  {
    int v3 = *a1++;
    v2 |= v3;
    --a2;
  }
  while (a2);
  return v2 != 0;
}

_DWORD *pfk_params_is_valid(_DWORD *result)
{
  if (result) {
    return (_DWORD *)(*result != 0);
  }
  return result;
}

uint64_t class_gen_set(char a1, int a2)
{
  return a1 & 0x1F | (32 * a2);
}

uint64_t class_persona_get(unsigned int a1)
{
  return (a1 >> 6) & 1;
}

uint64_t class_persona_unset(int a1)
{
  return a1 & 0xFFFFFFBF;
}

uint64_t class_persona_set(int a1)
{
  return a1 | 0x40u;
}

uint64_t keychain_key(char a1)
{
  char v1 = a1 & 0x1F;
  if ((a1 & 0x1Fu) >= 0x14) {
    char v1 = -1;
  }
  return ((a1 & 0x1Fu) < 0x14) & (0xC3FC0u >> v1);
}

uint64_t class_id_get(char a1)
{
  if ((a1 & 0x1Fu) > 0x13) {
    return 0xFFFFFFFFLL;
  }
  else {
    return a1 & 0x1F;
  }
}

uint64_t fs_class_key(char a1)
{
  unsigned int v1 = a1 & 0x1F;
  if (v1 > 0x13) {
    unsigned int v1 = -1;
  }
  return (v1 < 0x12) & (0x2E03Eu >> v1);
}

uint64_t keystore_type(char a1)
{
  return a1 & 0xF;
}

BOOL store_type_equal(int a1, int a2)
{
  return ((a2 ^ a1) & 0xF) == 0;
}

uint64_t memcmp_c(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270ED87D8](a3, a1, a2);
}

uint64_t dump_bytes_internal(const char *a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3 = a3;
  unsigned int v4 = a1;
  uint64_t v25 = *MEMORY[0x263EF8340];
  char v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  *(_OWORD *)__str = 0u;
  long long v17 = 0u;
  uint64_t v5 = (FILE **)MEMORY[0x263EF8358];
  if (a3 >= 0x41)
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s %sdump %s (len = %zd)%s%s\n", "aks", "", "", "", "dump_bytes_internal", ":", 786, "", 0, "", "", a1, a3, "", "");
    unsigned int v4 = "";
  }
  else if (!a3)
  {
    return memset_s(__str, 0x81uLL, 0, 0x81uLL);
  }
  unint64_t v6 = 0;
  unint64_t v15 = v3;
  do
  {
    unsigned int v7 = v5;
    if (v3 - v6 >= 0x40) {
      uint64_t v8 = 64;
    }
    else {
      uint64_t v8 = v3 - v6;
    }
    if (v8)
    {
      unsigned int v9 = (unsigned __int8 *)(a2 + v6);
      uint64_t v10 = __str;
      uint64_t v11 = v8;
      do
      {
        int v12 = *v9++;
        snprintf(v10, 3uLL, "%02x", v12);
        v10 += 2;
        --v11;
      }
      while (v11);
    }
    uint64_t v5 = v7;
    fprintf(*v7, "%s%s:%s%s%s%s%u:%s%u:%s %s%s%s[%04zu,%04zu): %s%s%s%s\n", "aks", "", "", "", "dump_bytes_internal", ":", 796, "", 0, "", "", v4, "", v6, v8 + v6, "", __str,
      "",
      "");
    v6 += v8;
    unint64_t v3 = v15;
  }
  while (v6 < v15);
  return memset_s(__str, 0x81uLL, 0, 0x81uLL);
}

unsigned char *bytes_to_str_hint(unsigned __int8 *a1, unint64_t a2)
{
  if (a2 >= 0x10) {
    uint64_t v2 = 16;
  }
  else {
    uint64_t v2 = a2;
  }
  if (v2)
  {
    unsigned int v4 = bytes_to_str_hint_buf;
    uint64_t v5 = v2;
    do
    {
      int v6 = *a1++;
      snprintf(v4, 3uLL, "%02x", v6);
      v4 += 2;
      --v5;
    }
    while (v5);
  }
  bytes_to_str_hint_buf[2 * v2] = 0;
  return bytes_to_str_hint_buf;
}

uint64_t get_kcv(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  memset(__s, 0, sizeof(__s));
  if (a4 == 3)
  {
    ccsha256_di();
    cchmac();
    uint64_t v5 = 0;
    *(_WORD *)a3 = __s[0];
    *(unsigned char *)(a3 + 2) = BYTE2(__s[0]);
  }
  else
  {
    uint64_t v5 = 0xFFFFFFFFLL;
  }
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  return v5;
}

uint64_t print_kcv(const char *a1, uint64_t a2, uint64_t a3)
{
  char v6 = 0;
  __int16 v5 = 0;
  get_kcv(a2, a3, (uint64_t)&v5, 3);
  return dump_bytes_internal(a1, (uint64_t)&v5, 3uLL);
}

char *byte_swap_val(char *result, unint64_t a2)
{
  if (a2 >= 2)
  {
    unint64_t v2 = a2 >> 1;
    unint64_t v3 = &result[a2 - 1];
    do
    {
      char v4 = *result;
      *result++ = *v3;
      *v3-- = v4;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t ascii_hex_to_bytes(unsigned __int8 *a1, unint64_t a2, void *a3, unint64_t *a4)
{
  uint64_t v5 = 0xFFFFFFFFLL;
  if ((a2 & 1) == 0)
  {
    char v6 = a1;
    if (a1)
    {
      if (a3 && a4)
      {
        unint64_t v9 = a2 >> 1;
        uint64_t v10 = calloc(a2 >> 1, 1uLL);
        if (v10)
        {
          if (a2 >= 2)
          {
            if (v9 <= 1) {
              uint64_t v11 = 1;
            }
            else {
              uint64_t v11 = a2 >> 1;
            }
            int v12 = v10;
            do
            {
              int v13 = *v6;
              unsigned int v14 = v13 - 48;
              unsigned int v15 = v13 - 97;
              if ((v13 - 65) >= 6) {
                char v16 = -1;
              }
              else {
                char v16 = v13 - 55;
              }
              char v17 = v13 - 87;
              if (v15 > 5) {
                char v17 = v16;
              }
              if (v14 < 0xA) {
                char v17 = v14;
              }
              char v18 = 16 * v17;
              int v19 = v6[1];
              unsigned int v20 = v19 - 48;
              unsigned int v21 = v19 - 97;
              if ((v19 - 65) >= 6) {
                char v22 = -1;
              }
              else {
                char v22 = v19 - 55;
              }
              char v23 = v19 - 87;
              if (v21 > 5) {
                char v23 = v22;
              }
              if (v20 < 0xA) {
                char v23 = v20;
              }
              *v12++ = v23 | v18;
              v6 += 2;
              --v11;
            }
            while (v11);
          }
          uint64_t v5 = 0;
          *a3 = v10;
          *a4 = v9;
        }
        else
        {
          return 4294967279;
        }
      }
    }
  }
  return v5;
}

uint64_t err_sks_to_aks(uint64_t result)
{
  if (result == 0 || result >= 0xFFFFFFDA) {
    return dword_259EA21B0[(int)result + 38];
  }
  return result;
}

uint64_t fv_init_cred_from_secret(void *a1, uint64_t a2, char a3)
{
  memset_s(a1, 0x10uLL, 0, 0x10uLL);
  if (a3) {
    return 4294967285;
  }
  if (a2 && *(void *)a2 && (size_t v7 = *(void *)(a2 + 8)) != 0)
  {
    uint64_t v8 = calloc(v7, 1uLL);
    if (v8)
    {
      *a1 = v8;
      unint64_t v9 = *(const void **)a2;
      a1[1] = *(void *)(a2 + 8);
      memcpy(v8, v9, *(void *)(a2 + 8));
      return 0;
    }
    else
    {
      return 4294967279;
    }
  }
  else
  {
    uint64_t result = 0;
    *a1 = 0;
    a1[1] = 0;
  }
  return result;
}

uint64_t REQUIRE_func(uint64_t result, int a2, const char *a3)
{
  if ((result & 1) == 0)
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s failed REQUIRE condition (%s:%d)\n%s\n", "aks", "", "", "", "REQUIRE_func", ":", 1047, "", 0, "", a3, a2, "");
    abort();
  }
  return result;
}

uint64_t generate_wrapping_key_curve25519(long long *a1, long long *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  memset(v14, 0, sizeof(v14));
  platform_read_random((uint64_t)v14, 0x20u);
  cccurve25519_make_pub();
  long long v8 = 0u;
  long long v9 = 0u;
  int __s = 0x1000000;
  long long v4 = a2[1];
  long long v10 = *a2;
  long long v11 = v4;
  long long v5 = a1[1];
  long long v12 = *a1;
  long long v13 = v5;
  cccurve25519();
  ccsha256_di();
  ccdigest();
  memset_s(&__s, 0x64uLL, 0, 0x64uLL);
  memset_s(v14, 0x20uLL, 0, 0x20uLL);
  return 0;
}

uint64_t wrap_data(int *a1, uint64_t (*a2)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t), char a3, uint64_t *a4, unsigned int a5, uint64_t a6, unsigned int *a7)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  unsigned int v32 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  memset(__s, 0, sizeof(__s));
  uint64_t v8 = 0xFFFFFFFFLL;
  if (!a6 || !a7) {
    goto LABEL_40;
  }
  if (!a1)
  {
LABEL_14:
    if (a2)
    {
      if (rfc3394_wrapped_size_legacy(a5, &v32))
      {
        if (*a7 < v32) {
          goto LABEL_40;
        }
        char v18 = 0;
        unsigned int v19 = 0;
        unsigned int v20 = a2;
        unsigned int v21 = a4;
        goto LABEL_38;
      }
    }
    else
    {
      if ((a3 & 4) != 0)
      {
        if ((a5 & 0xF) != 0 || *a7 < a5) {
          goto LABEL_40;
        }
        unsigned int v32 = a5;
        uint64_t v29 = ccaes_cbc_encrypt_mode();
        firebloom_cbc_one_shot_f(v29, 32, (uint64_t)(a1 + 2), (uint64_t)&firebloom_null_iv, a5 & 0xFFFFFFF0);
LABEL_39:
        uint64_t v8 = 0;
        *a7 = v32;
        goto LABEL_40;
      }
      if (rfc3394_wrapped_size_legacy(a5, &v32))
      {
        if (*a7 < v32) {
          goto LABEL_40;
        }
        if ((a3 & 8) != 0)
        {
          ccsha256_di();
          cchkdf();
          char v18 = __s;
        }
        else
        {
          char v18 = a1 + 2;
        }
        unsigned int v19 = 32;
        unsigned int v20 = 0;
        unsigned int v21 = a4;
LABEL_38:
        if (rfc3394_wrap_legacy((uint64_t)v18, v19, 0xA6A6A6A6A6A6A6A6, v20, v21, a5, (void *)a6, &v32))goto LABEL_40; {
        goto LABEL_39;
        }
      }
    }
    uint64_t v8 = 4294967285;
    if ((a3 & 8) == 0) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  int v14 = *a1;
  if ((*a1 - 1) >= 2)
  {
    if (v14) {
      goto LABEL_40;
    }
    goto LABEL_14;
  }
  if ((a3 & 4) != 0) {
    unsigned int v15 = 64;
  }
  else {
    unsigned int v15 = 72;
  }
  unsigned int v32 = v15;
  if (!a2 && a5 == 32 && *a7 >= v15)
  {
    if (v14 == 1)
    {
      generate_wrapping_key_curve25519((long long *)(a1 + 9), &v34);
    }
    else
    {
      long long v23 = *(_OWORD *)(a1 + 5);
      long long v34 = *(_OWORD *)(a1 + 1);
      long long v35 = v23;
      long long v24 = *(_OWORD *)(a1 + 13);
      long long v36 = *(_OWORD *)(a1 + 9);
      long long v37 = v24;
    }
    if ((a3 & 0x80) == 0)
    {
      long long v25 = v35;
      *(_OWORD *)a6 = v34;
      *(_OWORD *)(a6 + 16) = v25;
      if ((a3 & 4) != 0)
      {
        uint64_t v28 = ccaes_cbc_encrypt_mode();
        firebloom_cbc_one_shot_f(v28, 32, (uint64_t)&v36, (uint64_t)&firebloom_null_iv, 0x20uLL);
        goto LABEL_34;
      }
      int v31 = 40;
      if ((a3 & 8) != 0)
      {
        ccsha256_di();
        cchkdf();
        uint64_t v27 = (void *)(a6 + 32);
        uint64_t v26 = __s;
      }
      else
      {
        uint64_t v26 = &v36;
        uint64_t v27 = (void *)(a6 + 32);
      }
      if (!rfc3394_wrap_legacy((uint64_t)v26, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, a4, 0x20u, v27, &v31))
      {
LABEL_34:
        uint64_t v8 = 0;
        *a7 = v15;
        if ((a3 & 8) == 0) {
          goto LABEL_42;
        }
        goto LABEL_41;
      }
    }
  }
LABEL_40:
  if ((a3 & 8) != 0) {
LABEL_41:
  }
    memset_s(__s, 0x20uLL, 0, 0x20uLL);
LABEL_42:
  memset_s(&v34, 0x40uLL, 0, 0x40uLL);
  return v8;
}

uint64_t generate_unwrap_shared_key_curve25519(long long *a1, uint64_t a2, long long *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v7 = 0u;
  long long v3 = a1[1];
  long long v9 = *a1;
  long long v10 = v3;
  long long v4 = a3[1];
  long long v11 = *a3;
  int __s = 0x1000000;
  long long v12 = v4;
  cccurve25519();
  ccsha256_di();
  ccdigest();
  memset_s(&__s, 0x64uLL, 0, 0x64uLL);
  return 0;
}

uint64_t unwrap_data(uint64_t a1, uint64_t (*a2)(void, void *, unint64_t *, unint64_t *, uint64_t), char a3, void *a4, unsigned int a5, void *a6, unsigned int *a7)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  unsigned int v24 = 0;
  memset(v26, 0, sizeof(v26));
  uint64_t v8 = 0xFFFFFFFFLL;
  if (a4 && a5)
  {
    if (!a1) {
      goto LABEL_6;
    }
    if (*(_DWORD *)a1 != 1)
    {
      if (!*(_DWORD *)a1)
      {
LABEL_6:
        if (a5 <= 0x28)
        {
          if (a2)
          {
            if (rfc3394_unwrapped_size_legacy(a5, &v24) && *a7 >= v24)
            {
              unsigned int v15 = 0;
              unsigned int v16 = 0;
              char v17 = a2;
              goto LABEL_30;
            }
          }
          else if ((a3 & 4) != 0)
          {
            if ((a5 & 0xF) == 0 && *a7 >= a5)
            {
              unsigned int v24 = a5;
              uint64_t v20 = ccaes_cbc_decrypt_mode();
              firebloom_cbc_one_shot_f(v20, 32, a1 + 8, (uint64_t)&firebloom_null_iv, a5 & 0xFFFFFFF0);
LABEL_31:
              uint64_t v8 = 0;
              *a7 = v24;
              goto LABEL_35;
            }
          }
          else if (rfc3394_unwrapped_size_legacy(a5, &v24) && *a7 >= v24)
          {
            if ((a3 & 8) != 0)
            {
              ccsha256_di();
              cchkdf();
              unsigned int v15 = v26;
            }
            else
            {
              unsigned int v15 = (_OWORD *)(a1 + 8);
            }
            unsigned int v16 = 32;
            char v17 = 0;
LABEL_30:
            if (!rfc3394_unwrap_legacy((uint64_t)v15, v16, 0xA6A6A6A6A6A6A6A6, v17, a4, a5, a6, &v24)) {
              goto LABEL_31;
            }
            goto LABEL_40;
          }
        }
LABEL_38:
        uint64_t v8 = 4294967285;
        goto LABEL_35;
      }
LABEL_22:
      uint64_t v8 = 0xFFFFFFFFLL;
      goto LABEL_35;
    }
    unsigned int v24 = 32;
    if (*a7 < 0x20) {
      goto LABEL_38;
    }
    memset(__s, 0, sizeof(__s));
    if ((a3 & 4) != 0)
    {
      if (a5 != 64) {
        goto LABEL_38;
      }
      generate_unwrap_shared_key_curve25519((long long *)a4, a1 + 4, (long long *)(a1 + 36));
      uint64_t v21 = ccaes_cbc_decrypt_mode();
      firebloom_cbc_one_shot_f(v21, 32, (uint64_t)__s, (uint64_t)&firebloom_null_iv, 0x20uLL);
    }
    else
    {
      if (a5 != 72) {
        goto LABEL_38;
      }
      generate_unwrap_shared_key_curve25519((long long *)a4, a1 + 4, (long long *)(a1 + 36));
      if (a3 < 0) {
        goto LABEL_22;
      }
      int v23 = 32;
      if ((a3 & 8) != 0)
      {
        ccsha256_di();
        cchkdf();
        char v18 = a4 + 4;
        unsigned int v19 = v26;
      }
      else
      {
        char v18 = a4 + 4;
        unsigned int v19 = __s;
      }
      if (rfc3394_unwrap_legacy((uint64_t)v19, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, v18, 0x28u, a6, &v23))
      {
        memset_s(__s, 0x20uLL, 0, 0x20uLL);
LABEL_40:
        uint64_t v8 = 4294967277;
        goto LABEL_35;
      }
    }
    memset_s(__s, 0x20uLL, 0, 0x20uLL);
    uint64_t v8 = 0;
    *a7 = 32;
  }
LABEL_35:
  if ((a3 & 8) != 0) {
    memset_s(v26, 0x20uLL, 0, 0x20uLL);
  }
  return v8;
}

uint64_t firebloom_export_pub_key(uint64_t a1, void *a2, size_t *a3)
{
  size_t v5 = ((unint64_t)(cczp_bitlen() + 7) >> 2) | 1;
  char v6 = calloc(v5, 1uLL);
  if (!v6) {
    return 4294967279;
  }
  long long v7 = v6;
  ccec_export_pub();
  uint64_t result = 0;
  *a2 = v7;
  *a3 = v5;
  return result;
}

unint64_t firebloom_cp_prime_size()
{
  return (unint64_t)(cczp_bitlen() + 7) >> 3;
}

unint64_t firebloom_sign_max_size()
{
  return (((unint64_t)(cczp_bitlen() + 7) >> 2) & 0x3FFFFFFFFFFFFFFELL) + 9;
}

unint64_t firebloom_ec_export_pub_size()
{
  return ((unint64_t)(cczp_bitlen() + 7) >> 2) | 1;
}

unint64_t firebloom_ec_compact_export_pub_size()
{
  return (unint64_t)(cczp_bitlen() + 7) >> 3;
}

uint64_t firebloom_cbc_one_shot_f(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return MEMORY[0x270ED8830](a1, a2, a3, a4, a5 >> 4);
}

uint64_t firebloom_ecb_one_shot_f(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return MEMORY[0x270ED8B30](a1, a2, a3, a4 >> 4);
}

uint64_t firebloom_cbc_update_f(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return MEMORY[0x270ED8840](a1, a2, a3, a4 >> 4);
}

BOOL firebloom_ec_import()
{
  return !MEMORY[0x25A2ED690]() && ccn_read_uint() == 0;
}

uint64_t firebloom_ec_export()
{
  return 1;
}

uint64_t dict_find_params_cb(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(void *)(a5 + 8) >= *(void *)a5)
  {
    char v13 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      BOOL v11 = der_equal(*(const void **)(*(void *)(a5 + 24) + v9), *(void *)(*(void *)(a5 + 24) + v9)+ *(unsigned __int8 *)(*(void *)(*(void *)(a5 + 24) + v9) + 1)+ 2, a1);
      if (v11) {
        break;
      }
      ++v10;
      v9 += 40;
      if (v10 >= *(void *)a5) {
        goto LABEL_10;
      }
    }
    int v14 = (void *)(*(void *)(a5 + 24) + v9);
    if (v14[1])
    {
      char v12 = 0;
      *(unsigned char *)(a5 + 16) = 1;
    }
    else
    {
      ++*(void *)(a5 + 8);
      v14[1] = a3;
      _OWORD v14[2] = a3 + a4;
      v14[3] = a3;
      v14[4] = a3 + a4;
      char v12 = 1;
    }
LABEL_10:
    char v13 = v12 | !v11;
  }
  return v13 & 1;
}

BOOL der_key_equal(unsigned __int8 *a1, const void *a2)
{
  return der_equal(a1, (uint64_t)&a1[a1[1] + 2], a2);
}

BOOL der_equal(const void *a1, uint64_t a2, const void *a3)
{
  size_t v5 = der_get_sizeof((uint64_t)a1);
  return v5 == der_get_sizeof((uint64_t)a3) && memcmp(a1, a3, v5) == 0;
}

uint64_t der_get_sizeof(uint64_t a1)
{
  if (ccder_blob_decode_tag() && ccder_blob_decode_len()) {
    return a1 - a1;
  }
  else {
    return 0;
  }
}

uint64_t der_dict_iterate()
{
  uint64_t result = ccder_blob_decode_range();
  if (result)
  {
    if (ccder_blob_decode_sequence_tl())
    {
      uint64_t result = ccder_blob_decode_tl();
      if (result) {
        return 0;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t der_dict_find_value(uint64_t a1, void *a2, void *a3)
{
  if (a1)
  {
    der_dict_iterate();
    if (a2)
    {
      if (a3)
      {
        *a2 = 0;
        *a3 = 0;
      }
    }
  }
  return 0;
}

BOOL _dict_find_value_cb(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v8 = der_equal(*(const void **)a5, *(void *)a5 + *(unsigned __int8 *)(*(void *)a5 + 1) + 2, a1);
  if (v8)
  {
    *(unsigned char *)(a5 + 24) = 1;
    *(void *)(a5 + 8) = a3;
    *(void *)(a5 + 16) = a3 + a4;
  }
  return !v8;
}

uint64_t der_dict_get_number(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4) {
    return 0;
  }
  if (result)
  {
    der_dict_iterate();
    return 0;
  }
  return result;
}

uint64_t der_get_number()
{
  return 0;
}

uint64_t der_dict_get_data(uint64_t result)
{
  if (result)
  {
    der_dict_iterate();
    return 0;
  }
  return result;
}

double der_utils_decode_implicit_raw_octet_string(long long *a1, uint64_t a2, _DWORD *a3, void *a4)
{
  long long v8 = *a1;
  if (ccder_blob_decode_range())
  {
    *a4 = 0;
    *a3 = 0;
    double result = *(double *)&v8;
    *a1 = v8;
  }
  return result;
}

uint64_t der_array_iterate(uint64_t a1, uint64_t a2, unsigned int (*a3)(uint64_t, void, uint64_t), uint64_t a4)
{
  *(void *)&long long v12 = a1;
  *((void *)&v12 + 1) = a2;
  uint64_t v6 = ccder_blob_decode_range();
  if (v6)
  {
    uint64_t v11 = 0;
    uint64_t v7 = v12;
    if (der_utils_decode_tl(&v12, &v10, &v11))
    {
      do
      {
        uint64_t v8 = v12 + v11;
        if (!a3(v7, v12 + v11 - v7, a4)) {
          break;
        }
        *(void *)&long long v12 = v8;
        uint64_t v7 = v8;
      }
      while ((der_utils_decode_tl(&v12, &v10, &v11) & 1) != 0);
    }
  }
  return v6;
}

uint64_t der_utils_decode_tl(long long *a1, void *a2, void *a3)
{
  long long v7 = *a1;
  uint64_t result = ccder_blob_decode_tag();
  if (result)
  {
    uint64_t result = ccder_blob_decode_len();
    if (result)
    {
      *a1 = v7;
      *a2 = 0;
      *a3 = 0;
      return 1;
    }
  }
  return result;
}

uint64_t der_get_BOOL()
{
  return 0;
}

uint64_t encode_list_free(void **a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  while (1)
  {
    unint64_t v2 = *a1;
    if (!*a1) {
      break;
    }
    long long v3 = (void *)*((void *)v2 + 1);
    *a1 = *(void **)v2;
    if (v3)
    {
      memset_s(v3, *((void *)v2 + 2), 0, *((void *)v2 + 2));
      free(*((void **)v2 + 1));
    }
    memset_s(v2, 0x18uLL, 0, 0x18uLL);
    free(v2);
  }
  return 0;
}

uint64_t encode_list_remove_key(void *a1, unsigned __int8 *a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v2 = (void **)a1;
  uint64_t result = (uint64_t)_encode_list_find_key(a1, a2);
  if (result)
  {
    uint64_t v4 = result;
    for (uint64_t i = *v2; i != (void *)result; uint64_t i = (void *)*i)
      unint64_t v2 = (void **)i;
    void *v2 = *(void **)result;
    uint64_t v6 = *(void **)(result + 8);
    if (v6)
    {
      memset_s(v6, *(void *)(v4 + 16), 0, *(void *)(v4 + 16));
      free(*(void **)(v4 + 8));
    }
    memset_s((void *)v4, 0x18uLL, 0, 0x18uLL);
    free((void *)v4);
    return 0;
  }
  return result;
}

void *_encode_list_find_key(void *a1, unsigned __int8 *a2)
{
  if (!a1) {
    return 0;
  }
  unint64_t v2 = (void *)*a1;
  if (*a1)
  {
    do
    {
      size_t v5 = (const void *)v2[1];
      if (ccder_blob_decode_sequence_tl() && der_equal(a2, (uint64_t)&a2[a2[1] + 2], v5)) {
        break;
      }
      unint64_t v2 = (void *)*v2;
    }
    while (v2);
  }
  return v2;
}

uint64_t encode_list_get_data(void *a1, unsigned __int8 *a2, int a3, void *a4, void *a5)
{
  key = _encode_list_find_key(a1, a2);
  if (!key) {
    return 0;
  }
  uint64_t v9 = 1;
  if (a4)
  {
    if (a5)
    {
      uint64_t v10 = key[1] + key[2];
      *(void *)&long long v15 = key[1];
      *((void *)&v15 + 1) = v10;
      uint64_t v9 = ccder_blob_decode_sequence_tl();
      if (v9)
      {
        if (der_utils_decode_implicit_raw_octet_string_copy(&v15, 12, 0, 0))
        {
          uint64_t v11 = v15;
          if (ccder_blob_decode_tag())
          {
            if (ccder_blob_decode_len())
            {
              uint64_t v13 = 0;
              uint64_t v12 = v15;
              if (a3)
              {
                uint64_t v13 = (v15 - v11);
                uint64_t v12 = v11;
              }
              *a4 = v12;
              *a5 = v13;
            }
          }
        }
      }
    }
  }
  return v9;
}

uint64_t der_utils_decode_implicit_raw_octet_string_copy(long long *a1, uint64_t a2, uint64_t a3, int a4)
{
  long long v8 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0 || a3 && a4) {
    return 0;
  }
  *a1 = v8;
  return 1;
}

uint64_t encode_list_cstr_get_data(void *a1, char *__s, void *a3, size_t a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  memset(v18, 0, sizeof(v18));
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  long long v12 = 0u;
  v11[0] = 12;
  v11[1] = strlen(__s);
  long long v7 = (unsigned __int8 *)der_key_validate((uint64_t)v11);
  uint64_t result = 0xFFFFFFFFLL;
  if (a3 && v7)
  {
    __memcpy_chk();
    __src = 0;
    uint64_t v10 = 0;
    if (encode_list_get_data(a1, v7, 0, &__src, &v10))
    {
      if (v10 == a4)
      {
        memcpy(a3, __src, a4);
        return 0;
      }
      else
      {
        return 4294967277;
      }
    }
    else
    {
      return 4294967293;
    }
  }
  return result;
}

uint64_t der_key_validate(uint64_t a1)
{
  if ((ccder_blob_decode_tl() & 1) == 0)
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s bad 1%s\n", "aks", "", "", "", "der_key_validate");
    return 0;
  }
  return a1;
}

uint64_t encode_list_get_number(void *a1, unsigned __int8 *a2, uint64_t *a3)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t data = encode_list_get_data(a1, a2, 1, &v7, &v8);
  uint64_t v5 = data;
  if (a3 && data) {
    *a3 = der_get_number();
  }
  return v5;
}

uint64_t encode_list_get_BOOL(void *a1, unsigned __int8 *a2, unsigned char *a3)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t data = encode_list_get_data(a1, a2, 1, &v7, &v8);
  uint64_t v5 = data;
  if (a3 && data) {
    *a3 = der_get_BOOL();
  }
  return v5;
}

uint64_t encode_list_merge_dict(uint64_t a1)
{
  if (a1) {
    return der_dict_iterate() - 1;
  }
  else {
    return 4294967285;
  }
}

uint64_t _merge_dict_cb(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = (unsigned __int8 *)der_key_validate(a1);
  if (v8)
  {
    uint64_t v9 = (uint64_t)v8;
    if (!encode_list_remove_key(a5, v8) && !encode_list_add_der(a5, v9, a3, a3 + a4)) {
      return 1;
    }
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s fail%s\n", "aks", "", "", "", "_merge_dict_cb", ":", 647, "", 0, "", "");
  return 0;
}

uint64_t encode_list_dict(void *a1, void *a2, size_t *a3)
{
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v7 = (void *)*a1;
        if (*a1)
        {
          unint64_t v8 = 0;
          uint64_t v9 = 0;
          uint64_t v10 = 0;
          do
          {
            v10 += v7[2];
            uint64_t v7 = (void *)*v7;
            v9 -= 16;
            --v8;
          }
          while (v7);
          if (v8 >= 0xF000000000000001 && (rsize_t v11 = -v9, (v12 = calloc(-v9, 1uLL)) != 0))
          {
            long long v13 = v12;
            long long v14 = (void *)*a1;
            if (*a1)
            {
              long long v15 = v12;
              do
              {
                *v15++ = *(_OWORD *)(v14 + 1);
                long long v14 = (void *)*v14;
              }
              while (v14);
            }
            qsort(v12, -(uint64_t)v8, 0x10uLL, (int (__cdecl *)(const void *, const void *))_qsort_compare);
            size_t v16 = ccder_sizeof();
            long long v17 = (char *)calloc(v16, 1uLL);
            char v18 = v17;
            if (v17)
            {
              long long v25 = v17;
              uint64_t v26 = &v17[v16];
              unint64_t v19 = v8 - 1;
              uint64_t v20 = (uint64_t)v13 - v9 - 8;
              while (!__CFADD__(v19++, 1))
              {
                uint64_t v22 = v20 - 16;
                char v23 = ccder_blob_encode_body();
                uint64_t v20 = v22;
                if ((v23 & 1) == 0) {
                  goto LABEL_16;
                }
              }
              if (!ccder_blob_encode_tl() || v25 != v26)
              {
LABEL_16:
                uint64_t v3 = 0xFFFFFFFFLL;
                goto LABEL_20;
              }
              uint64_t v3 = 0;
              *a2 = v18;
              *a3 = v16;
              char v18 = 0;
            }
            else
            {
              uint64_t v3 = 4294967279;
            }
LABEL_20:
            memset_s(v13, v11, 0, v11);
            free(v13);
            if (v18)
            {
              memset_s(v18, v16, 0, v16);
              free(v18);
            }
          }
          else
          {
            return 0xFFFFFFFFLL;
          }
        }
      }
    }
  }
  return v3;
}

uint64_t encode_list_add_der(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a4)
  {
    if (der_get_sizeof(a3) <= (unint64_t)(a4 - a3))
    {
      size_t v6 = ccder_sizeof();
      uint64_t v7 = (char *)calloc(v6, 1uLL);
      if (!v7) {
        return 4294967279;
      }
      unint64_t v8 = v7;
      size_t v16 = &v7[v6];
      if (ccder_blob_encode_body())
      {
        int v9 = ccder_blob_encode_body();
        uint64_t v10 = v16;
        if (!v9) {
          uint64_t v10 = 0;
        }
        long long v17 = v10;
        int v11 = ccder_blob_encode_tl();
        long long v12 = v17;
        if (!v11) {
          long long v12 = 0;
        }
        if (v12 && v12 == v8)
        {
          long long v14 = calloc(0x18uLL, 1uLL);
          if (v14)
          {
            long long v15 = v14;
            uint64_t result = 0;
            v15[1] = v8;
            v15[2] = v6;
            *long long v15 = *a1;
            *a1 = v15;
            return result;
          }
        }
      }
      memset_s(v8, v6, 0, v6);
      free(v8);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t encode_list_add_key(void *a1, uint64_t a2, uint64_t a3)
{
  return encode_list_add_der(a1, a2, a3, a3 + *(unsigned __int8 *)(a3 + 1) + 2);
}

uint64_t encode_list_add_data(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3)
  {
    ccder_sizeof();
    size_t v5 = ccder_sizeof();
    size_t v6 = (char *)calloc(v5, 1uLL);
    if (v6)
    {
      uint64_t v7 = v6;
      long long v15 = &v6[v5];
      if (!ccder_blob_encode_body() || !ccder_blob_encode_tl()) {
        goto LABEL_19;
      }
      int v8 = ccder_blob_encode_body();
      int v9 = v15;
      if (!v8) {
        int v9 = 0;
      }
      size_t v16 = v9;
      int v10 = ccder_blob_encode_tl();
      int v11 = v16;
      if (!v10) {
        int v11 = 0;
      }
      BOOL v12 = v11 && v11 == v7;
      if (v12 && (long long v13 = calloc(0x18uLL, 1uLL)) != 0)
      {
        long long v14 = v13;
        uint64_t result = 0;
        v14[1] = v7;
        _OWORD v14[2] = v5;
        void *v14 = *a1;
        *a1 = v14;
      }
      else
      {
LABEL_19:
        memset_s(v7, v5, 0, v5);
        free(v7);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t encode_list_cstr_add_data(void *a1, char *__s, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  memset(v14, 0, sizeof(v14));
  long long v13 = 0u;
  long long v12 = 0u;
  long long v11 = 0u;
  long long v10 = 0u;
  long long v9 = 0u;
  long long v8 = 0u;
  v7[0] = 12;
  v7[1] = strlen(__s);
  uint64_t v5 = der_key_validate((uint64_t)v7);
  uint64_t result = 4294967285;
  if (a3)
  {
    if (v5)
    {
      __memcpy_chk();
      return encode_list_add_data(a1, v5, a3);
    }
  }
  return result;
}

uint64_t encode_list_add_BOOL(void *a1, uint64_t a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    ccder_sizeof();
    size_t v4 = ccder_sizeof();
    uint64_t v5 = (char *)calloc(v4, 1uLL);
    if (v5)
    {
      size_t v6 = v5;
      long long v14 = &v5[v4];
      if (!ccder_blob_encode_body() || !ccder_blob_encode_tl()) {
        goto LABEL_18;
      }
      int v7 = ccder_blob_encode_body();
      long long v8 = v14;
      if (!v7) {
        long long v8 = 0;
      }
      uint64_t v15 = v8;
      int v9 = ccder_blob_encode_tl();
      long long v10 = v15;
      if (!v9) {
        long long v10 = 0;
      }
      BOOL v11 = v10 && v10 == v6;
      if (v11 && (long long v12 = calloc(0x18uLL, 1uLL)) != 0)
      {
        long long v13 = v12;
        uint64_t result = 0;
        v13[1] = v6;
        int v13[2] = v4;
        *long long v13 = *a1;
        *a1 = v13;
      }
      else
      {
LABEL_18:
        memset_s(v6, v4, 0, v4);
        free(v6);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t encode_list_add_number(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  v25[1] = *MEMORY[0x263EF8340];
  unint64_t v5 = HIBYTE(a3);
  if ((HIBYTE(a3) + 1) > 1u)
  {
    uint64_t v10 = 8;
  }
  else
  {
    uint64_t v6 = 9;
    uint64_t v7 = 48;
    uint64_t v8 = 1;
    while ((unint64_t)(v6 - 2) >= 2)
    {
      uint64_t v9 = a3 >> v7;
      --v6;
      v7 -= 8;
      if (v5 != v9)
      {
        uint64_t v8 = v6 - 1;
        goto LABEL_8;
      }
    }
    uint64_t v6 = 2;
LABEL_8:
    if ((((a3 >> (8 * v8 - 8)) ^ v5) & 0x80) != 0) {
      uint64_t v10 = v6;
    }
    else {
      uint64_t v10 = v8;
    }
  }
  v25[0] = 0;
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    ccder_sizeof();
    size_t v12 = ccder_sizeof();
    long long v13 = (char *)calloc(v12, 1uLL);
    if (v13)
    {
      long long v14 = v13;
      uint64_t v15 = v10;
      do
      {
        *((unsigned char *)v25 + v15 - 1) = v3;
        v3 >>= 8;
        --v15;
      }
      while (v15);
      char v23 = &v13[v12];
      if ((ccder_blob_encode_body() & 1) == 0 || !ccder_blob_encode_tl()) {
        goto LABEL_30;
      }
      int v16 = ccder_blob_encode_body();
      long long v17 = v23;
      if (!v16) {
        long long v17 = 0;
      }
      unsigned int v24 = v17;
      int v18 = ccder_blob_encode_tl();
      unint64_t v19 = v24;
      if (!v18) {
        unint64_t v19 = 0;
      }
      BOOL v20 = v19 && v19 == v14;
      if (v20 && (uint64_t v21 = calloc(0x18uLL, 1uLL)) != 0)
      {
        uint64_t v22 = v21;
        uint64_t result = 0;
        v22[1] = v14;
        v22[2] = v12;
        *uint64_t v22 = *a1;
        *a1 = v22;
      }
      else
      {
LABEL_30:
        memset_s(v14, v12, 0, v12);
        free(v14);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t encode_list_add_string(void *a1, uint64_t a2, char *__s)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && __s)
  {
    strlen(__s);
    ccder_sizeof();
    size_t v5 = ccder_sizeof();
    uint64_t v6 = (char *)calloc(v5, 1uLL);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v15 = &v6[v5];
      if (!ccder_blob_encode_body() || !ccder_blob_encode_tl()) {
        goto LABEL_19;
      }
      int v8 = ccder_blob_encode_body();
      uint64_t v9 = v15;
      if (!v8) {
        uint64_t v9 = 0;
      }
      int v16 = v9;
      int v10 = ccder_blob_encode_tl();
      BOOL v11 = v16;
      if (!v10) {
        BOOL v11 = 0;
      }
      BOOL v12 = v11 && v11 == v7;
      if (v12 && (long long v13 = calloc(0x18uLL, 1uLL)) != 0)
      {
        long long v14 = v13;
        uint64_t result = 0;
        v14[1] = v7;
        _OWORD v14[2] = v5;
        void *v14 = *a1;
        *a1 = v14;
      }
      else
      {
LABEL_19:
        memset_s(v7, v5, 0, v5);
        free(v7);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t encode_list_add_list(void *a1, uint64_t a2, void *a3)
{
  uint64_t v3 = 0;
  int __s = 0;
  rsize_t __n = 0;
  uint64_t v4 = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    size_t v5 = 0;
    if (a3)
    {
      if (encode_list_dict(a3, &__s, &__n))
      {
        uint64_t v3 = 0;
        size_t v5 = 0;
      }
      else
      {
        size_t v5 = ccder_sizeof();
        uint64_t v7 = (char *)calloc(v5, 1uLL);
        uint64_t v3 = v7;
        if (v7)
        {
          uint64_t v15 = &v7[v5];
          if (!ccder_blob_encode_body()) {
            goto LABEL_23;
          }
          int v18 = v3;
          unint64_t v19 = v15;
          int v8 = ccder_blob_encode_body();
          uint64_t v9 = v19;
          if (!v8) {
            uint64_t v9 = 0;
          }
          int v18 = v3;
          unint64_t v19 = v9;
          int v10 = ccder_blob_encode_tl();
          BOOL v11 = v19;
          if (!v10) {
            BOOL v11 = 0;
          }
          BOOL v12 = v11 && v11 == v3;
          if (v12 && (long long v13 = calloc(0x18uLL, 1uLL)) != 0)
          {
            uint64_t v4 = 0;
            v13[1] = v3;
            int v13[2] = v5;
            *long long v13 = *a1;
            *a1 = v13;
            uint64_t v3 = 0;
          }
          else
          {
LABEL_23:
            uint64_t v4 = 0xFFFFFFFFLL;
          }
        }
        else
        {
          uint64_t v4 = 4294967279;
        }
      }
    }
  }
  else
  {
    size_t v5 = 0;
  }
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  if (v3)
  {
    memset_s(v3, v5, 0, v5);
    free(v3);
  }
  return v4;
}

BOOL encode_list_is_empty(void *a1)
{
  return *a1 == 0;
}

uint64_t ccder_sizeof_fv_data()
{
  return ccder_sizeof();
}

uint64_t ccder_sizeof_fv_key()
{
  uint64_t v0 = ccder_sizeof();
  return ccder_sizeof() + v0;
}

uint64_t der_utils_encode_fv_key(long long *a1, uint64_t a2)
{
  long long v4 = *a1;
  if (a2)
  {
    uint64_t result = ccder_blob_encode_body_tl();
    if (!result) {
      return result;
    }
    if ((ccder_blob_encode_body_tl() & 1) == 0) {
      return 0;
    }
  }
  else if (!ccder_blob_encode_body_tl() || (ccder_blob_encode_tl() & 1) == 0)
  {
    return 0;
  }
  *a1 = v4;
  return 1;
}

uint64_t der_utils_decode_fv_key(long long *a1, int a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a3;
  uint64_t v5 = *(void *)(a3 + 8);
  int v7 = *(_DWORD *)(a3 + 20);
  long long v11 = *a1;
  if (a2)
  {
    long long v14 = *a1;
    BOOL v12 = 0;
    uint64_t v13 = 0;
    if ((ccder_blob_decode_range() & 1) == 0) {
      return 0;
    }
    uint64_t v6 = (uint64_t)v12;
    unsigned int v8 = v13 - v12;
    long long v11 = v14;
  }
  else
  {
    LODWORD(v14) = v5;
    uint64_t result = der_utils_decode_implicit_raw_octet_string_copy_len(&v11, 4, v6, &v14);
    if (!result) {
      return result;
    }
    unsigned int v8 = v14;
  }
  long long v14 = v11;
  BOOL v12 = 0;
  uint64_t v13 = 0;
  if ((ccder_blob_decode_range() & 1) == 0) {
    return 0;
  }
  long long v11 = v14;
  if ((v13 - v12) > 4) {
    return 0;
  }
  int v10 = *v12;
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v8;
  *(_DWORD *)(a3 + 16) = v10;
  *(_DWORD *)(a3 + 20) = v7;
  *a1 = v11;
  return 1;
}

uint64_t der_utils_decode_implicit_raw_octet_string_copy_len(long long *a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  long long v8 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0) {
    return 0;
  }
  if (a3)
  {
    if (a4) {
      *a4 = 0;
    }
  }
  *a1 = v8;
  return 1;
}

uint64_t der_utils_encode_fv_data(long long *a1, uint64_t a2)
{
  long long v4 = *a1;
  if (a2)
  {
    if ((ccder_blob_encode_body_tl() & 1) == 0) {
      return 0;
    }
  }
  else
  {
    uint64_t result = ccder_blob_encode_tl();
    if (!result) {
      return result;
    }
  }
  *a1 = v4;
  return 1;
}

uint64_t der_utils_decode_fv_data(long long *a1, int a2, uint64_t *a3)
{
  uint64_t v6 = *a3;
  uint64_t v5 = a3[1];
  long long v9 = *a1;
  if (a2)
  {
    long long v12 = *a1;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t result = ccder_blob_decode_range();
    if (!result) {
      return result;
    }
    uint64_t v6 = v10;
    unsigned int v8 = v11 - v10;
    long long v9 = v12;
  }
  else
  {
    LODWORD(v12) = v5;
    uint64_t result = der_utils_decode_implicit_raw_octet_string_copy_len(&v9, 4, v6, &v12);
    if (!result) {
      return result;
    }
    unsigned int v8 = v12;
  }
  *a3 = v6;
  a3[1] = v8;
  *a1 = v9;
  return 1;
}

uint64_t der_utils_encode_fv_params(long long *a1, uint64_t a2)
{
  long long v4 = *a1;
  if (a2)
  {
    if ((ccder_blob_encode_body_tl() & 1) == 0) {
      return 0;
    }
  }
  else
  {
    uint64_t result = ccder_blob_encode_tl();
    if (!result) {
      return result;
    }
  }
  *a1 = v4;
  return 1;
}

uint64_t der_utils_decode_fv_params(long long *a1)
{
  long long v3 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0) {
    return 0;
  }
  *a1 = v3;
  return 1;
}

uint64_t encode_extended_state(unsigned int *a1, int a2, void *a3, _DWORD *a4)
{
  long long v12 = 0;
  if (encode_list_add_number(&v12, (uint64_t)der_key_state_state, *a1)
    || encode_list_add_number(&v12, (uint64_t)der_key_state_lock_state, a1[1])
    || encode_list_add_number(&v12, (uint64_t)der_key_state_backoff, *((void *)a1 + 1))
    || encode_list_add_number(&v12, (uint64_t)der_key_state_failed_attempts, a1[4])
    || encode_list_add_number(&v12, (uint64_t)der_key_state_generation_state, a1[5])
    || encode_list_add_number(&v12, (uint64_t)der_key_state_recovery_countdown, *(void *)((char *)a1 + 26))|| encode_list_add_number(&v12, (uint64_t)der_key_state_more_state, *(void *)((char *)a1 + 34))|| encode_list_add_number(&v12, (uint64_t)der_key_keybag_handle, *(int *)((char *)a1 + 42))|| encode_list_add_number(&v12, (uint64_t)der_key_config_max_unlock_attempts, *(unsigned int *)((char *)a1 + 46))|| encode_list_add_data(&v12, (uint64_t)der_key_config_user_uuid, (uint64_t)a1 + 50)|| a2&& (encode_list_add_number(&v12, (uint64_t)der_key_state_assertion_set, *((char *)a1 + 66))|| encode_list_add_number(&v12, (uint64_t)der_key_state_grace_period_enabled, *((char *)a1 + 67))|| encode_list_add_number(&v12, (uint64_t)der_key_lock_time, *(void *)(a1 + 17))|| encode_list_add_number(&v12, (uint64_t)der_key_cx_window, *(void *)(a1 + 19)))|| (uint64_t v10 = 0, v11 = 0, encode_list_dict(&v12, &v10, &v11)))
  {
    uint64_t v8 = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v8 = 0;
    *a3 = v10;
    *a4 = v11;
  }
  encode_list_free(&v12);
  return v8;
}

uint64_t decode_extended_state(uint64_t a1, int a2, char *__s)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && a1)
  {
    if (__s)
    {
      memset_s(__s, 0x54uLL, 0, 0x54uLL);
      bzero(v7, 0x228uLL);
      v7[4] = der_key_state_lock_state;
      v7[9] = der_key_state_backoff;
      v7[14] = der_key_state_failed_attempts;
      v7[19] = der_key_state_generation_state;
      v7[24] = der_key_state_assertion_set;
      v7[29] = der_key_state_grace_period_enabled;
      v7[34] = der_key_state_recovery_countdown;
      v7[39] = der_key_state_more_state;
      v7[44] = der_key_keybag_handle;
      v7[49] = der_key_config_max_unlock_attempts;
      v7[54] = der_key_config_user_uuid;
      long long v9 = der_key_lock_time;
      uint64_t v10 = der_key_cx_window;
      der_dict_iterate();
      *(_DWORD *)int __s = der_get_number();
      *((_DWORD *)__s + 1) = der_get_number();
      *((void *)__s + 1) = der_get_number();
      *((_DWORD *)__s + 4) = der_get_number();
      *((_DWORD *)__s + 5) = der_get_number();
      *(void *)(__s + 26) = der_get_number();
      *(void *)(__s + 34) = der_get_number();
      *(_DWORD *)(__s + 42) = der_get_number();
      *(_DWORD *)(__s + 46) = der_get_number();
      der_utils_decode_implicit_raw_octet_string_copy(&v8, 4, (uint64_t)(__s + 50), 16);
      __s[66] = der_get_number();
      __s[67] = der_get_number();
      *(void *)(__s + 68) = der_get_number();
      uint64_t number = der_get_number();
      uint64_t result = 0;
      *(void *)(__s + 76) = number;
    }
  }
  return result;
}

uint64_t decode_memento_state(uint64_t a1, int a2, unsigned char *__s)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    if (der_dict_iterate())
    {
      void *__s = der_get_number();
      *((_DWORD *)__s + 1) = der_get_number();
      *((_DWORD *)__s + 2) = der_get_number();
      int number = der_get_number();
      uint64_t result = 0;
      *((_DWORD *)__s + 3) = number;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t decode_primary_identity_state(uint64_t a1, int a2, void *__s, void *a4, uint64_t a5)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s && a4)
  {
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    memset_s(a4, 0x10uLL, 0, 0x10uLL);
    uint64_t v12 = 0;
    v10[0] = 0u;
    long long v11 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v10[1] = (unint64_t)der_key_group_uuid;
    uint64_t v13 = der_key_uuid;
    der_dict_iterate();
    if (der_utils_decode_implicit_raw_octet_string_copy(v10, 4, (uint64_t)__s, 16)
      && der_utils_decode_implicit_raw_octet_string_copy((long long *)((char *)&v11 + 8), 4, (uint64_t)a4, 16))
    {
      return der_utils_decode_implicit_raw_octet_string_copy(&v15, 4, a5, 16) - 1;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t decode_fv_blob_state(uint64_t a1, uint64_t a2, _DWORD *__s)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x58uLL, 0, 0x58uLL);
    long long v24 = 0u;
    uint64_t v26 = 0;
    long long v27 = 0u;
    uint64_t v28 = 0;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v33 = 0;
    long long v34 = 0u;
    uint64_t v35 = 0;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v40 = 0;
    long long v41 = 0u;
    uint64_t v42 = 0;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v8 = 0u;
    uint64_t v9 = 0;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v15 = 0;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v21 = 0;
    long long v23 = 0u;
    uint64_t v10 = der_key_id;
    *(void *)&long long v13 = der_key_flags;
    uint64_t v16 = der_key_version;
    *(void *)&long long v19 = der_key_state_reserved;
    uint64_t v22 = der_key_state_failed_attempts;
    long long v25 = der_key_state_failed_attempts_other;
    uint64_t v29 = der_key_config_max_unlock_attempts;
    unsigned int v32 = der_key_state_backoff;
    long long v36 = der_key_state_backoff_other;
    uint64_t v39 = der_key_config_capabilities;
    uint64_t v43 = der_key_state_refcount;
    der_dict_iterate();
    void *__s = der_get_number();
    if (der_utils_decode_implicit_raw_octet_string_copy((long long *)((char *)&v8 + 8), 4, (uint64_t)(__s + 1), 16)&& der_utils_decode_implicit_raw_octet_string_copy(&v12, 4, (uint64_t)(__s + 5), 16)&& (__s[9] = der_get_number(), __s[10] = der_get_number(), __s[11] = der_get_number(), __s[12] = der_get_number(), __s[15] = der_get_number(), __s[13] = der_get_number(), __s[14] = der_get_number(), der_utils_decode_implicit_raw_octet_string_copy_partial((long long *)((char *)&v20 + 8))))
    {
      int v6 = __s[9];
      if ((v6 & 0x400) != 0)
      {
        *((void *)__s + 9) = der_get_number();
        int v6 = __s[9];
      }
      if ((v6 & 0x800) != 0)
      {
        int number = der_get_number();
        uint64_t result = 0;
        __s[20] = number;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t der_utils_decode_implicit_raw_octet_string_copy_partial(long long *a1)
{
  long long v4 = *a1;
  uint64_t v2 = ccder_blob_decode_range();
  if (v2) {
    *a1 = v4;
  }
  return v2;
}

uint64_t encode_pfk_params_public(int *a1, void *a2, _DWORD *a3)
{
  long long v11 = 0;
  uint64_t v3 = 4294967273;
  if (a2 && a3)
  {
    if (a1 && (int v7 = *a1) != 0)
    {
      if (v7)
      {
        encode_list_cstr_add_data(&v11, "persona_uuid", (uint64_t)(a1 + 1));
        int v7 = *a1;
      }
      if ((v7 & 2) != 0) {
        encode_list_cstr_add_data(&v11, "volume_uuid", (uint64_t)(a1 + 5));
      }
      uint64_t v9 = 0;
      size_t v10 = 0;
      if (!encode_list_dict(&v11, &v9, &v10))
      {
        uint64_t v3 = 0;
        *a2 = v9;
        *a3 = v10;
      }
    }
    else
    {
      uint64_t v3 = 0;
      *a2 = 0;
      *a3 = 0;
    }
  }
  encode_list_free(&v11);
  return v3;
}

uint64_t decode_pfk_params_internal(uint64_t a1, uint64_t a2, char *__s)
{
  int v6 = 0;
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x24uLL, 0, 0x24uLL);
    if (der_dict_iterate())
    {
      if (!encode_list_cstr_get_data(&v6, "volume_uuid", __s + 20, 0x10uLL)) {
        *(_DWORD *)__s |= 2u;
      }
      uint64_t v3 = 0;
      if (!encode_list_cstr_get_data(&v6, "persona_uuid", __s + 4, 0x10uLL)) {
        *(_DWORD *)__s |= 1u;
      }
    }
    else
    {
      uint64_t v3 = 0xFFFFFFFFLL;
    }
  }
  encode_list_free(&v6);
  return v3;
}

uint64_t encode_fv_params_internal(uint64_t a1, void *a2, _DWORD *a3)
{
  size_t v10 = 0;
  uint64_t v3 = 4294967273;
  if (a2 && a3)
  {
    if (a1)
    {
      if (!encode_list_cstr_add_data(&v10, "options", a1)
        && !encode_list_cstr_add_data(&v10, "kc", a1 + 8))
      {
        uint64_t v8 = 0;
        size_t v9 = 0;
        if (!encode_list_dict(&v10, &v8, &v9))
        {
          uint64_t v3 = 0;
          *a2 = v8;
          *a3 = v9;
        }
      }
    }
    else
    {
      uint64_t v3 = 0;
      *a2 = 0;
      *a3 = 0;
    }
  }
  encode_list_free(&v10);
  return v3;
}

uint64_t decode_fv_params_internal(uint64_t a1, uint64_t a2, char *__s)
{
  int v6 = 0;
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    if (der_dict_iterate())
    {
      encode_list_cstr_get_data(&v6, "options", __s, 8uLL);
      encode_list_cstr_get_data(&v6, "kc", __s + 8, 4uLL);
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v3 = 0xFFFFFFFFLL;
    }
  }
  encode_list_free(&v6);
  return v3;
}

void *ref_key_op_der_to_enum(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (a2)
    {
      uint64_t v2 = der_key_op;
      if (der_key_op)
      {
        der_dict_iterate();
        return 0;
      }
    }
  }
  return v2;
}

uint64_t der_utils_decode_implicit_raw_octet_string_alloc(long long *a1, uint64_t a2, uint64_t *a3, _DWORD *a4)
{
  long long v8 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0) {
    return 0;
  }
  if (a3 && a4)
  {
    uint64_t result = (uint64_t)calloc(0, 1uLL);
    if (!result) {
      return result;
    }
    *a3 = result;
    *a4 = 0;
  }
  *a1 = v8;
  return 1;
}

uint64_t der_utils_decode_implicit_uint64(long long *a1, uint64_t a2, void *a3)
{
  if (a3) {
    *a3 = 0;
  }
  long long v6 = *a1;
  uint64_t result = ccder_blob_decode_range();
  if (result)
  {
    if (ccn_read_uint())
    {
      return 0;
    }
    else
    {
      *a1 = v6;
      if (a3) {
        *a3 = 0;
      }
      return 1;
    }
  }
  return result;
}

uint64_t _qsort_compare(const void **a1, void **a2)
{
  uint64_t v5 = *a1;
  __s2 = *a2;
  if (!ccder_blob_decode_sequence_tl()
    || !ccder_blob_decode_sequence_tl()
    || !ccder_blob_decode_tag()
    || !ccder_blob_decode_len()
    || !v5
    || !ccder_blob_decode_tag()
    || !ccder_blob_decode_len()
    || !__s2)
  {
    return 4294967293;
  }
  int v2 = memcmp(v5, __s2, 0);
  if (v2 > 0) {
    return 1;
  }
  else {
    return ((v2 < 0) << 31 >> 31);
  }
}

uint64_t platform_get_measurement(uint64_t a1, int a2, void *a3, size_t *a4)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 36, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  if (!lib_platform_callbacks) {
    return 4294967284;
  }
  if (a1 >= 7) {
    abort();
  }
  unsigned int v8 = a1;
  size_t v9 = (char *)&pm_id_table + 72 * a1;
  int v11 = v9[4];
  size_t v10 = v9 + 4;
  if (!v11)
  {
    uint64_t result = ((uint64_t (*)(uint64_t, char *, char *))lib_platform_callbacks)(a1, (char *)&pm_id_table + 72 * a1 + 5, (char *)&pm_id_table + 72 * a1 + 64);
    if (result) {
      return result;
    }
    *size_t v10 = 1;
  }
  long long v13 = (char *)&pm_id_table + 72 * a1;
  size_t v15 = *((void *)v13 + 8);
  long long v14 = (unint64_t *)(v13 + 64);
  if (*a4 < v15) {
    return 4294967285;
  }
  memcpy(a3, (char *)&pm_id_table + 72 * v8 + 5, *a4);
  unint64_t v16 = *v14;
  *a4 = *v14;
  if (a2) {
    byte_swap_val((char *)a3, v16);
  }
  return 0;
}

uint64_t platform_rng()
{
  REQUIRE_func(&lib_platform_callbacks != 0, 62, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(off_2707C0320[0] != 0, 63, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  uint64_t v0 = off_2707C0320[0];
  return v0();
}

uint64_t platform_read_random(uint64_t a1, unsigned int a2)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 70, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(off_2707C0328 != 0, 71, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  uint64_t v4 = (uint64_t (*)(uint64_t, unsigned int))off_2707C0328;
  return v4(a1, a2);
}

uint64_t platform_pka_get_pub_key(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 78, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_2707C0330 != 0, 79, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  unint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))unk_2707C0330;
  return v16(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t platform_pka_ecdh(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 86, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_2707C0338 != 0, 87, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  long long v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))unk_2707C0338;
  return v18(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t platform_pka_sign(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 94, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_2707C0340 != 0, 95, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  long long v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))unk_2707C0340;
  return v18(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t platform_pka_sika_attest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 106, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_2707C0348 != 0, 107, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  long long v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))unk_2707C0348;
  return v17(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
}

uint64_t platform_pka_shared_encrypt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 115, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_2707C0350 != 0, 116, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  long long v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))unk_2707C0350;
  return v18(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

uint64_t platform_ref_key_hw_crypt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 123, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_2707C0358 != 0, 124, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  size_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))unk_2707C0358;
  return v10(a1, a2, a3, a4, a5);
}

uint64_t platform_ref_key_hw_crypt_clear_cache()
{
  REQUIRE_func(&lib_platform_callbacks != 0, 131, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_2707C0360 != 0, 132, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  uint64_t v0 = (uint64_t (*)(void))unk_2707C0360;
  return v0();
}

uint64_t platform_get_device_id(uint64_t a1, uint64_t a2)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 139, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_2707C0368 != 0, 140, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t))unk_2707C0368;
  return v4(a1, a2);
}

uint64_t platform_get_aon_security(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 147, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_2707C0370 != 0, 148, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  int v2 = (uint64_t (*)(uint64_t))unk_2707C0370;
  return v2(a1);
}

uint64_t platform_get_att_sep_chip_rev(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 155, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_2707C0378 != 0, 156, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  int v2 = (uint64_t (*)(uint64_t))unk_2707C0378;
  return v2(a1);
}

uint64_t platform_get_chip_id(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 163, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_2707C0380 != 0, 164, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  int v2 = (uint64_t (*)(uint64_t))unk_2707C0380;
  return v2(a1);
}

uint64_t platform_get_ecid(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 171, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_2707C0388 != 0, 172, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  int v2 = (uint64_t (*)(uint64_t))unk_2707C0388;
  return v2(a1);
}

uint64_t platform_get_board_id(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 179, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_2707C0390 != 0, 180, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  int v2 = (uint64_t (*)(uint64_t))unk_2707C0390;
  return v2(a1);
}

uint64_t platform_get_fuse_bits(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 187, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_2707C0398 != 0, 188, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  int v2 = (uint64_t (*)(uint64_t))unk_2707C0398;
  return v2(a1);
}

uint64_t platform_get_att_board_and_chip_id(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 195, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_2707C03A0 != 0, 196, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  int v2 = (uint64_t (*)(uint64_t))unk_2707C03A0;
  return v2(a1);
}

uint64_t aks_get_pad_size(int a1)
{
  return -a1 & 3;
}

char *aks_copy_packed_data(_DWORD *a1, const void *a2, int a3)
{
  uint64_t v3 = (char *)(a1 + 1);
  if (a2)
  {
    *a1 = a3;
    memcpy(a1 + 1, a2, a3);
    v3 += a3;
    int v5 = -a3;
    size_t v6 = -a3 & 3;
    if ((v5 & 3) != 0)
    {
      int __s = 0;
      memset_s(&__s, 4uLL, 0, 4uLL);
      memcpy(v3, &__s, v6);
      v3 += v6;
    }
  }
  else
  {
    *a1 = 0;
  }
  return v3;
}

char *aks_pack_data(char **a1, unsigned int *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v21 = &a9;
  unsigned int v12 = 4;
  if (a3)
  {
    int v13 = a3;
    do
    {
      long long v14 = v21;
      v21 += 2;
      v12 += *((_DWORD *)v14 + 2) + (-*((_DWORD *)v14 + 2) & 3) + 4;
      --v13;
    }
    while (v13);
  }
  uint64_t result = (char *)calloc(1uLL, v12);
  unint64_t v16 = result;
  uint64_t v22 = (const void **)&a9;
  int v17 = 0;
  if (a3)
  {
    uint64_t v18 = 4;
    do
    {
      long long v19 = v22;
      long long v20 = *v22;
      v22 += 2;
      uint64_t result = aks_copy_packed_data(&v16[v18], v20, *((_DWORD *)v19 + 2));
      uint64_t v18 = result - v16;
      ++v17;
    }
    while (a3 != v17);
  }
  *(_DWORD *)unint64_t v16 = v17;
  *a1 = v16;
  *a2 = v12;
  return result;
}

uint64_t aks_unpack_data(unsigned int *a1, unint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2 < 4) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v9 = a3;
  if (*a1 >= a3)
  {
    long long v19 = (void **)&a9;
    if (!a3) {
      return 0;
    }
    int v11 = (char *)(a1 + 1);
    while (1)
    {
      unsigned int v12 = v19;
      int v13 = *v19;
      v19 += 2;
      unsigned int v16 = *(_DWORD *)v11;
      long long v14 = v11 + 4;
      size_t v15 = v16;
      if (v16 > a2) {
        break;
      }
      if (v13)
      {
        int v17 = (size_t *)v12[1];
        if (*v17 < v15) {
          return 0xFFFFFFFFLL;
        }
        memcpy(v13, v14, v15);
        *int v17 = v15;
      }
      int v11 = &v14[v15];
      if (!--v9) {
        return 0;
      }
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t acm_explicit_bzero(void *a1, rsize_t __n)
{
  return memset_s(a1, __n, 0, __n);
}

uint64_t acm_get_mem()
{
  return _allocatedMem_0;
}

void *acm_mem_alloc_data(size_t size)
{
  uint64_t result = malloc_type_calloc(1uLL, size, 0xCB62F0E9uLL);
  if (result) {
    _allocatedMem_2 += size;
  }
  return result;
}

void acm_mem_free_data(void *a1, rsize_t __n)
{
  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    uint64_t v4 = _allocatedMem_2 - __n;
    if (_allocatedMem_2 < __n) {
      uint64_t v4 = 0;
    }
    _allocatedMem_2 = v4;
  }
}

void *acm_mem_alloc(size_t size)
{
  uint64_t result = malloc_type_calloc(1uLL, size, 0xDB9956F0uLL);
  if (result) {
    _allocatedMem_3 += size;
  }
  return result;
}

void acm_mem_free(void *a1, rsize_t __n)
{
  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    uint64_t v4 = _allocatedMem_3 - __n;
    if (_allocatedMem_3 < __n) {
      uint64_t v4 = 0;
    }
    _allocatedMem_3 = v4;
  }
}

const char *acm_mem_alloc_info(const char *result, const void *a2, uint64_t a3, const char *a4, int a5, const char *a6)
{
  if (a2) {
    _allocatedMem_0 += a3;
  }
  if (gACMLoggingLevel <= 0x1Eu)
  {
    size_t v6 = "NULL";
    if (result) {
      int v7 = result;
    }
    else {
      int v7 = "NULL";
    }
    if (a4) {
      unsigned int v8 = a4;
    }
    else {
      unsigned int v8 = "NULL";
    }
    if (a6) {
      size_t v6 = a6;
    }
    return (const char *)printf("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_alloc_info", v7, a2, a3, _allocatedMem_0, 0, _allocatedMem_2, _allocatedMem_3, v8, a5, v6);
  }
  return result;
}

const char *acm_mem_free_info(const char *result, const void *a2, unint64_t a3, const char *a4, int a5, const char *a6)
{
  if (a2)
  {
    uint64_t v6 = _allocatedMem_0 - a3;
    if (_allocatedMem_0 < a3) {
      uint64_t v6 = 0;
    }
    _allocatedMem_0 = v6;
  }
  if (gACMLoggingLevel <= 0x1Eu)
  {
    int v7 = "NULL";
    if (result) {
      unsigned int v8 = result;
    }
    else {
      unsigned int v8 = "NULL";
    }
    if (a4) {
      unsigned int v9 = a4;
    }
    else {
      unsigned int v9 = "NULL";
    }
    if (a6) {
      int v7 = a6;
    }
    return (const char *)printf("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_free_info", v8, a2, a3, _allocatedMem_0, 0, _allocatedMem_2, _allocatedMem_3, v9, a5, v7);
  }
  return result;
}

uint64_t GetSerializedVerifyPolicySize(uint64_t a1, char *__s1, uint64_t a3, uint64_t a4, _DWORD *a5, unsigned int a6, void *a7)
{
  unsigned int v14 = 0;
  uint64_t result = 4294967293;
  if (a1 && __s1 && a7)
  {
    size_t v12 = strnlen(__s1, 0x81uLL);
    if (v12 > 0x80)
    {
      return 4294967293;
    }
    else
    {
      size_t v13 = v12;
      uint64_t result = getLengthOfParameters(a5, a6, &v14);
      if (!result) {
        *a7 = v13 + v14 + 26;
      }
    }
  }
  return result;
}

uint64_t getLengthOfParameters(_DWORD *a1, unsigned int a2, _DWORD *a3)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "getLengthOfParameters");
  }
  if (a3)
  {
    *a3 = 0;
    int v6 = 0;
    if (a2)
    {
      uint64_t v7 = a2;
      while (1)
      {
        uint64_t v8 = checkParameter(a1);
        if (v8) {
          break;
        }
        int v9 = v6 + 8;
        int v10 = a1[4];
        v6 += v10 + 8;
        if (__CFADD__(v10, v9)) {
          goto LABEL_10;
        }
        a1 += 6;
        if (!--v7) {
          goto LABEL_9;
        }
      }
      uint64_t v11 = v8;
      unsigned int v12 = 70;
    }
    else
    {
LABEL_9:
      uint64_t v11 = 0;
      *a3 = v6;
      unsigned int v12 = 10;
    }
  }
  else
  {
LABEL_10:
    unsigned int v12 = 70;
    uint64_t v11 = 4294967293;
  }
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "getLengthOfParameters", (int)v11);
  }
  return v11;
}

uint64_t SerializeVerifyPolicy(_OWORD *a1, char *__s1, char a3, uint64_t a4, _DWORD *a5, unsigned int a6, _OWORD *a7, size_t *a8)
{
  unint64_t v21 = 0;
  uint64_t result = 4294967293;
  if (a1)
  {
    if (__s1)
    {
      if (a8)
      {
        if (a7)
        {
          if (a6 <= 0xA && (a5 != 0) == (a6 != 0))
          {
            int v15 = a4;
            uint64_t result = GetSerializedVerifyPolicySize((uint64_t)a1, __s1, 0, a4, a5, a6, &v21);
            if (!result)
            {
              if (*a8 < v21) {
                return 4294967293;
              }
              *a7 = *a1;
              size_t v17 = strnlen(__s1, 0x81uLL);
              if (v17 > 0x80)
              {
                return 4294967293;
              }
              else
              {
                size_t v18 = v17;
                memcpy(a7 + 1, __s1, v17 + 1);
                long long v19 = (char *)a7 + v18;
                v19[17] = a3;
                *(_DWORD *)(v19 + 18) = v15;
                size_t v20 = v18 + 22;
                uint64_t result = serializeParameters((uint64_t)a5, a6, (uint64_t)a7, (uint64_t *)&v20);
                if (!result) {
                  *a8 = v20;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t serializeParameters(uint64_t a1, int a2, uint64_t a3, uint64_t *a4)
{
  LODWORD(v6) = a2;
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "serializeParameters");
  }
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293;
  if (a3 && a4)
  {
    uint64_t v10 = *a4;
    *(_DWORD *)(a3 + v10) = v6;
    uint64_t v11 = v10 + 4;
    if (v6)
    {
      uint64_t v6 = v6;
      while (1)
      {
        *(_OWORD *)__src = *(_OWORD *)a1;
        size_t __n = *(void *)(a1 + 16);
        uint64_t v12 = checkParameter(__src);
        if (v12) {
          break;
        }
        size_t v13 = (_DWORD *)(a3 + v11);
        size_t v14 = __n;
        *size_t v13 = __src[0];
        v13[1] = v14;
        v11 += 8;
        if (v14)
        {
          memcpy((void *)(a3 + v11), __src[1], v14);
          v11 += v14;
        }
        a1 += 24;
        if (!--v6) {
          goto LABEL_11;
        }
      }
      uint64_t v9 = v12;
      unsigned int v8 = 70;
    }
    else
    {
LABEL_11:
      uint64_t v9 = 0;
      *a4 = v11;
      unsigned int v8 = 10;
    }
  }
  if (v8 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "serializeParameters", (int)v9);
  }
  return v9;
}

uint64_t DeserializeVerifyPolicy(uint64_t a1, unint64_t a2, _OWORD *a3, void *a4, BOOL *a5, _DWORD *a6, void *a7, _DWORD *a8)
{
  uint64_t v28 = 0;
  unsigned int v27 = 0;
  uint64_t v8 = 4294967293;
  unint64_t v9 = a2 - 16;
  if (a2 >= 0x10 && a1 && a3 && a4 && a5 && a6 && a7 && a8)
  {
    *a3 = *(_OWORD *)a1;
    unint64_t v17 = strnlen((const char *)(a1 + 16), a2 - 16);
    if (v17 > 0x80 || v9 <= v17) {
      return 4294967293;
    }
    uint64_t v26 = a4;
    unint64_t v18 = v17 + 1;
    long long v19 = acm_mem_alloc_data(v17 + 1);
    acm_mem_alloc_info("<data>", v19, v17 + 1, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 349, "DeserializeVerifyPolicy");
    if (!v19) {
      return 4294967292;
    }
    memcpy(v19, (const void *)(a1 + 16), v17 + 1);
    unint64_t v29 = v17 + 17;
    if (v17 + 17 == a2 || (v20 = a5, BOOL v21 = *(unsigned char *)(a1 + v17 + 17) != 0, v29 = v17 + 18, a2 - (v17 + 18) < 4))
    {
      uint64_t v8 = 4294967293;
    }
    else
    {
      unint64_t v25 = v17 + 1;
      uint64_t v22 = a8;
      int v23 = *(_DWORD *)(a1 + v17 + 18);
      unint64_t v29 = v17 + 22;
      uint64_t v8 = deserializeParameters(a1, a2, &v29, &v28, &v27);
      if (!v8)
      {
        *uint64_t v26 = v19;
        BOOL *v20 = v21;
        *a6 = v23;
        *a7 = v28;
        *uint64_t v22 = v27;
        return v8;
      }
      unint64_t v18 = v25;
    }
    acm_mem_free_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 378, "DeserializeVerifyPolicy");
    acm_mem_free_data(v19, v18);
    if (v28) {
      Util_SafeDeallocParameters(v28, v27);
    }
  }
  return v8;
}

uint64_t deserializeParameters(uint64_t a1, unint64_t a2, unint64_t *a3, void *a4, _DWORD *a5)
{
  uint64_t v10 = (unsigned __int8 *)&unk_26A3F7000;
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "deserializeParameters");
  }
  unsigned int v11 = 70;
  uint64_t v12 = 4294967293;
  if (!a1 || !a3 || !a4 || !a5) {
    goto LABEL_25;
  }
  unint64_t v13 = *a3;
  if (a2 <= *a3)
  {
    LODWORD(v14) = 0;
LABEL_23:
    unsigned int v16 = 0;
LABEL_24:
    uint64_t v12 = 0;
    *a4 = v16;
    *a5 = v14;
    unsigned int v11 = 10;
    *a3 = v13;
    goto LABEL_25;
  }
  if (a2 - *a3 < 4 || (uint64_t v14 = *(unsigned int *)(a1 + v13), v14 > 0xA))
  {
    unsigned int v11 = 70;
    uint64_t v12 = 4294967293;
    goto LABEL_25;
  }
  v13 += 4;
  if (!v14) {
    goto LABEL_23;
  }
  int v27 = v14;
  uint64_t v15 = 24 * v14;
  unsigned int v16 = (char *)acm_mem_alloc(24 * v14);
  acm_mem_alloc_info("array of ACMParameter", v16, v15, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 194, "deserializeParameters");
  if (!v16)
  {
    unsigned int v11 = 70;
    uint64_t v12 = 4294967292;
    goto LABEL_25;
  }
  long long v24 = a4;
  unint64_t v25 = a5;
  uint64_t v26 = a3;
  uint64_t v17 = 0;
  while (1)
  {
    unint64_t v18 = &v16[v17];
    *(void *)&v16[v17 + 8] = 0;
    if (a2 - v13 < 8
      || (*(_DWORD *)unint64_t v18 = *(_DWORD *)(a1 + v13), a2 - (v13 + 4) < 4)
      || (long long v19 = &v16[v17],
          size_t v20 = *(unsigned int *)(a1 + v13 + 4),
          *(_DWORD *)&v16[v17 + 16] = v20,
          v13 += 8,
          a2 - v13 < v20))
    {
      unsigned int v11 = 70;
      uint64_t v12 = 4294967293;
      goto LABEL_31;
    }
    uint64_t v21 = checkParameter(&v16[v17]);
    if (v21)
    {
      uint64_t v12 = v21;
      unsigned int v11 = 70;
      goto LABEL_31;
    }
    if (v20) {
      break;
    }
LABEL_20:
    v17 += 24;
    if (v15 == v17)
    {
      uint64_t v10 = (unsigned char *)&unk_26A3F7000;
      a5 = v25;
      a3 = v26;
      a4 = v24;
      LODWORD(v14) = v27;
      goto LABEL_24;
    }
  }
  uint64_t v22 = acm_mem_alloc_data(v20);
  acm_mem_alloc_info("<data>", v22, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 212, "deserializeParameters");
  *((void *)v18 + 1) = v22;
  if (v22)
  {
    memcpy(v22, (const void *)(a1 + v13), *((unsigned int *)v19 + 4));
    v13 += *((unsigned int *)v19 + 4);
    goto LABEL_20;
  }
  unsigned int v11 = 70;
  uint64_t v12 = 4294967292;
LABEL_31:
  uint64_t v10 = (unsigned char *)&unk_26A3F7000;
LABEL_25:
  if (v11 >= v10[2376]) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "deserializeParameters", (int)v12);
  }
  return v12;
}

uint64_t GetSerializedVerifyAclConstraintSize(int a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, _DWORD *a9, unsigned int a10, void *a11)
{
  unsigned int v18 = 0;
  uint64_t result = 4294967293;
  if (a3)
  {
    if (a11)
    {
      if (a10 <= 0xA && (a9 != 0) == (a10 != 0))
      {
        uint64_t result = getLengthOfParameters(a9, a10, &v18);
        if (!result)
        {
          uint64_t v15 = 29;
          if (a1 == 32) {
            uint64_t v15 = 33;
          }
          uint64_t v16 = v15 + a4;
          if (a1 == 32) {
            uint64_t v17 = a6;
          }
          else {
            uint64_t v17 = 0;
          }
          *a11 = v16 + v17 + v18;
        }
      }
    }
  }
  return result;
}

uint64_t SerializeVerifyAclConstraint(int a1, _OWORD *a2, const void *a3, unsigned int a4, const void *a5, unsigned int a6, char a7, int a8, _DWORD *a9, unsigned int a10, uint64_t a11, void *a12)
{
  if (!a3) {
    return 4294967293;
  }
  uint64_t result = 4294967293;
  if (a12) {
    BOOL v14 = a11 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14 && a10 <= 0xA && (a9 != 0) == (a10 != 0))
  {
    unsigned int v31 = 0;
    uint64_t result = getLengthOfParameters(a9, a10, &v31);
    if (!result)
    {
      uint64_t v21 = 29;
      if (a1 == 32) {
        uint64_t v21 = 33;
      }
      uint64_t v22 = v21 + a4;
      if (a1 == 32) {
        uint64_t v23 = a6;
      }
      else {
        uint64_t v23 = 0;
      }
      if (*a12 < v22 + v23 + (unint64_t)v31)
      {
        return 4294967293;
      }
      else
      {
        int v28 = a8;
        if (a2)
        {
          *(_OWORD *)a11 = *a2;
        }
        else
        {
          *(void *)a11 = 0;
          *(void *)(a11 + 8) = 0;
        }
        *(_DWORD *)(a11 + 16) = a4;
        memcpy((void *)(a11 + 20), a3, a4);
        uint64_t v24 = a4 + 20;
        if (a1 == 32)
        {
          *(_DWORD *)(a11 + v24) = a6;
          uint64_t v25 = a4 + 24;
          memcpy((void *)(a11 + v25), a5, a6);
          uint64_t v24 = v25 + a6;
        }
        uint64_t v26 = a11 + v24;
        *(unsigned char *)uint64_t v26 = a7;
        *(_DWORD *)(v26 + 1) = v28;
        uint64_t v30 = v24 + 5;
        uint64_t result = serializeParameters((uint64_t)a9, a10, a11, &v30);
        if (!result) {
          *a12 = v30;
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeVerifyAclConstraint(int a1, uint64_t a2, unsigned int a3, _OWORD *a4, void *a5, _DWORD *a6, size_t *a7, _DWORD *a8, BOOL *a9, _DWORD *a10, void *a11, _DWORD *a12)
{
  uint64_t v33 = 0;
  unint64_t v34 = 0;
  unsigned int v32 = 0;
  uint64_t v12 = 4294967293;
  if (a2 && a4 && a5 && a6 && a9 && a10 && a11 && a12 && a3 >= 0x10)
  {
    unint64_t v16 = a3;
    *a4 = *(_OWORD *)a2;
    unint64_t v34 = 16;
    if ((a3 & 0xFFFFFFFC) == 0x10)
    {
      uint64_t v12 = 4294967293;
    }
    else
    {
      unint64_t v20 = *(unsigned int *)(a2 + 16);
      unint64_t v34 = 20;
      uint64_t v21 = acm_mem_alloc_data(v20);
      acm_mem_alloc_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 532, "DeserializeVerifyAclConstraint");
      if (v21)
      {
        if (v16 - 20 < v20) {
          goto LABEL_24;
        }
        memcpy(v21, (const void *)(a2 + 20), v20);
        unint64_t v22 = v20 + 20;
        unint64_t v34 = v20 + 20;
        unsigned int v31 = a5;
        if (a1 != 32)
        {
          uint64_t v25 = 0;
          LODWORD(v23) = 0;
          goto LABEL_19;
        }
        if (v16 - v22 < 4)
        {
LABEL_24:
          uint64_t v25 = 0;
          LODWORD(v23) = 0;
        }
        else
        {
          size_t v23 = *(unsigned int *)(a2 + v22);
          unint64_t v24 = v20 + 24;
          unint64_t v34 = v20 + 24;
          uint64_t v25 = acm_mem_alloc_data(v23);
          acm_mem_alloc_info("<data>", v25, v23, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 544, "DeserializeVerifyAclConstraint");
          if (!v25)
          {
            uint64_t v12 = 4294967292;
LABEL_26:
            acm_mem_free_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 580, "DeserializeVerifyAclConstraint");
            acm_mem_free_data(v21, v20);
            if (v25)
            {
              acm_mem_free_info("<data>", v25, v23, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 583, "DeserializeVerifyAclConstraint");
              acm_mem_free_data(v25, v23);
            }
            goto LABEL_30;
          }
          if (v16 - v24 >= v23)
          {
            memcpy(v25, (const void *)(a2 + v24), v23);
            unint64_t v22 = v24 + v23;
            unint64_t v34 = v24 + v23;
LABEL_19:
            if (v22 != v16)
            {
              BOOL v26 = *(unsigned char *)(a2 + v22) != 0;
              unint64_t v34 = v22 + 1;
              if (v16 - (v22 + 1) >= 4)
              {
                unint64_t v30 = v20;
                int v27 = v23;
                size_t v23 = (size_t)v25;
                int v28 = *(_DWORD *)(a2 + v22 + 1);
                unint64_t v34 = v22 + 5;
                uint64_t v12 = deserializeParameters(a2, v16, &v34, &v33, &v32);
                if (!v12)
                {
                  *unsigned int v31 = v21;
                  *a7 = v23;
                  *a8 = v27;
                  *a6 = v30;
                  *a9 = v26;
                  *a10 = v28;
                  *a11 = v33;
                  *a12 = v32;
                  return v12;
                }
                uint64_t v25 = (void *)v23;
                LODWORD(v23) = v27;
                unint64_t v20 = v30;
                goto LABEL_26;
              }
            }
          }
        }
        uint64_t v12 = 4294967293;
        goto LABEL_26;
      }
      uint64_t v12 = 4294967292;
    }
  }
LABEL_30:
  if (v33) {
    Util_SafeDeallocParameters(v33, v32);
  }
  return v12;
}

uint64_t GetSerializedProcessAclSize(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5, uint64_t a6, _DWORD *a7, unsigned int a8, void *a9)
{
  unsigned int v12 = 0;
  uint64_t result = 4294967293;
  if (a2 && a3 && a9 && a8 <= 0xA && (a7 != 0) == (a8 != 0))
  {
    uint64_t result = getLengthOfParameters(a7, a8, &v12);
    if (!result) {
      *a9 = a3 + (unint64_t)a5 + v12 + 36;
    }
  }
  return result;
}

uint64_t SerializeProcessAcl(_OWORD *a1, const void *a2, unsigned int a3, const void *a4, unsigned int a5, uint64_t a6, _DWORD *a7, unsigned int a8, uint64_t a9, unint64_t *a10)
{
  unint64_t v23 = 0;
  uint64_t result = 4294967293;
  if (a2 && a3)
  {
    BOOL v15 = !a10 || a9 == 0;
    if (!v15 && a8 <= 0xA && (a7 != 0) == (a8 != 0))
    {
      int v17 = a6;
      uint64_t result = GetSerializedProcessAclSize(4294967293, (uint64_t)a2, a3, (uint64_t)a4, a5, a6, a7, a8, &v23);
      if (!result)
      {
        if (*a10 < v23)
        {
          return 4294967293;
        }
        else
        {
          if (a1)
          {
            *(_OWORD *)a9 = *a1;
          }
          else
          {
            *(void *)a9 = 0;
            *(void *)(a9 + 8) = 0;
          }
          *(_DWORD *)(a9 + 16) = a3;
          memcpy((void *)(a9 + 20), a2, a3);
          *(_DWORD *)(a9 + a3 + 20) = a5;
          uint64_t v21 = a3 + 24;
          if (a5)
          {
            memcpy((void *)(a9 + v21), a4, a5);
            v21 += a5;
          }
          *(_DWORD *)(a9 + v21) = v17;
          unint64_t v22 = v21 + 4;
          uint64_t result = serializeParameters((uint64_t)a7, a8, a9, (uint64_t *)&v22);
          if (!result) {
            *a10 = v22;
          }
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeProcessAcl(uint64_t a1, unsigned int a2, _OWORD *a3, void *a4, _DWORD *a5, void *a6, unsigned int *a7, _DWORD *a8, void *a9, _DWORD *a10)
{
  uint64_t v39 = 0;
  unint64_t v40 = 0;
  unsigned int v38 = 0;
  uint64_t v10 = 4294967293;
  if (a1)
  {
    if (a3)
    {
      unsigned int v11 = a4;
      if (a4)
      {
        unsigned int v12 = a5;
        if (a5)
        {
          unint64_t v13 = a6;
          if (a6)
          {
            BOOL v14 = a7;
            if (a7)
            {
              BOOL v15 = a8;
              if (a8)
              {
                if (a9 && a10 && a2 >= 0x10)
                {
                  unint64_t v17 = a2;
                  *a3 = *(_OWORD *)a1;
                  unint64_t v40 = 16;
                  if ((a2 & 0xFFFFFFFC) == 0x10)
                  {
                    uint64_t v10 = 4294967293;
                  }
                  else
                  {
                    unint64_t v18 = *(unsigned int *)(a1 + 16);
                    unint64_t v40 = 20;
                    long long v19 = acm_mem_alloc_data(v18);
                    acm_mem_alloc_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 722, "DeserializeProcessAcl");
                    if (v19)
                    {
                      if (v17 - 20 < v18
                        || (memcpy(v19, (const void *)(a1 + 20), v18), unint64_t v40 = v18 + 20, v17 - (v18 + 20) < 4))
                      {
                        unsigned int v32 = 0;
                        unsigned int v37 = 0;
                        uint64_t v10 = 4294967293;
                      }
                      else
                      {
                        size_t v20 = *(unsigned int *)(a1 + v18 + 20);
                        unint64_t v21 = v18 + 24;
                        unint64_t v40 = v18 + 24;
                        unsigned int v37 = v20;
                        if (!v20)
                        {
                          long long v36 = 0;
                          goto LABEL_20;
                        }
                        uint64_t v33 = v12;
                        unint64_t v34 = v11;
                        unint64_t v22 = v13;
                        unint64_t v23 = v14;
                        unint64_t v24 = v15;
                        size_t v25 = v20;
                        BOOL v26 = acm_mem_alloc_data(v20);
                        acm_mem_alloc_info("<data>", v26, v25, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 734, "DeserializeProcessAcl");
                        if (v26)
                        {
                          int v27 = v26;
                          unsigned int v11 = v34;
                          if (v17 - v21 >= v25)
                          {
                            long long v36 = v27;
                            memcpy(v27, (const void *)(a1 + v21), v25);
                            v21 += v25;
                            unint64_t v40 = v21;
                            BOOL v15 = v24;
                            BOOL v14 = v23;
                            unint64_t v13 = v22;
                            unsigned int v12 = v33;
LABEL_20:
                            if (v17 - v21 < 4)
                            {
                              uint64_t v10 = 4294967293;
                            }
                            else
                            {
                              unint64_t v35 = v18;
                              int v28 = v19;
                              unint64_t v29 = v15;
                              int v30 = *(_DWORD *)(a1 + v21);
                              unint64_t v40 = v21 + 4;
                              uint64_t v10 = deserializeParameters(a1, v17, &v40, &v39, &v38);
                              if (!v10)
                              {
                                *unsigned int v11 = v28;
                                *unsigned int v12 = v35;
                                *unint64_t v13 = v36;
                                unsigned int *v14 = v37;
                                *unint64_t v29 = v30;
                                *a9 = v39;
                                *a10 = v38;
                                return v10;
                              }
                              long long v19 = v28;
                              unint64_t v18 = v35;
                            }
                            unsigned int v32 = v36;
                            goto LABEL_32;
                          }
                          uint64_t v10 = 4294967293;
                          unsigned int v32 = v27;
                        }
                        else
                        {
                          unsigned int v32 = 0;
                          uint64_t v10 = 4294967292;
                        }
                      }
LABEL_32:
                      acm_mem_free_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 763, "DeserializeProcessAcl");
                      acm_mem_free_data(v19, v18);
                      if (v32)
                      {
                        acm_mem_free_info("<data>", v32, v37, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 766, "DeserializeProcessAcl");
                        acm_mem_free_data(v32, v37);
                      }
                      goto LABEL_34;
                    }
                    uint64_t v10 = 4294967292;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_34:
  if (v39) {
    Util_SafeDeallocParameters(v39, v38);
  }
  return v10;
}

uint64_t GetSerializedRequirementSize(_DWORD *a1, uint64_t *a2)
{
  uint64_t v12 = 0;
  uint64_t result = 4294967293;
  if (!a1) {
    return result;
  }
  if (!a2) {
    return result;
  }
  int v5 = *a1;
  if (*a1 > 0x1Cu) {
    return result;
  }
  if (((1 << v5) & 0x1FFCFF4E) != 0)
  {
    uint64_t result = 0;
    *a2 = a1[3] + 16;
    return result;
  }
  if (((1 << v5) & 0x30) == 0)
  {
    if (v5 != 7) {
      return result;
    }
    *a2 = 24;
    uint64_t v9 = a1[5];
    if (v9)
    {
      uint64_t v10 = a1 + 6;
      uint64_t v11 = 24;
      do
      {
        uint64_t result = GetSerializedRequirementSize(*v10, &v12);
        if (result) {
          break;
        }
        v11 += v12;
        *a2 = v11;
        ++v10;
        --v9;
      }
      while (v9);
      return result;
    }
    return 0;
  }
  *a2 = 20;
  uint64_t v6 = a1[4];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = a1 + 5;
  uint64_t v8 = 20;
  while (1)
  {
    uint64_t result = GetSerializedRequirementSize(*v7, &v12);
    if (result) {
      break;
    }
    v8 += v12;
    *a2 = v8;
    ++v7;
    if (!--v6) {
      return 0;
    }
  }
  return result;
}

uint64_t SerializeRequirement(_DWORD *a1, _OWORD *a2, uint64_t *a3)
{
  unint64_t v12 = 0;
  uint64_t result = 4294967293;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t result = GetSerializedRequirementSize(a1, (uint64_t *)&v12);
        if (!result)
        {
          if (v12 > *a3) {
            return 4294967293;
          }
          *a2 = *(_OWORD *)a1;
          int v7 = *a1;
          uint64_t result = 4294967293;
          if (*a1 <= 0x1Cu)
          {
            if (((1 << v7) & 0x1FFCFF4E) != 0)
            {
              memcpy(a2 + 1, a1 + 4, a1[3]);
              uint64_t v8 = a1[3] + 16;
LABEL_9:
              uint64_t result = 0;
              *a3 = v8;
              return result;
            }
            if (((1 << v7) & 0x30) != 0)
            {
              *((_DWORD *)a2 + 4) = a1[4];
              if (!a1[4])
              {
                uint64_t v8 = 20;
                goto LABEL_9;
              }
              uint64_t v9 = 0;
              uint64_t v8 = 20;
              while (1)
              {
                uint64_t v11 = *a3 - v8;
                uint64_t result = SerializeRequirement(*(void *)&a1[2 * v9 + 5], (char *)a2 + v8, &v11);
                if (result) {
                  break;
                }
                v8 += v11;
                if (++v9 >= (unint64_t)a1[4]) {
                  goto LABEL_9;
                }
              }
            }
            else if (v7 == 7)
            {
              *((void *)a2 + 2) = *((void *)a1 + 2);
              if (!a1[5])
              {
                uint64_t v8 = 24;
                goto LABEL_9;
              }
              uint64_t v10 = 0;
              uint64_t v8 = 24;
              while (1)
              {
                uint64_t v11 = *a3 - v8;
                uint64_t result = SerializeRequirement(*(void *)&a1[2 * v10 + 6], (char *)a2 + v8, &v11);
                if (result) {
                  break;
                }
                v8 += v11;
                if (++v10 >= (unint64_t)a1[5]) {
                  goto LABEL_9;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeRequirement(unsigned int *a1, unint64_t a2, void **a3, size_t *a4)
{
  __dst = 0;
  uint64_t v4 = 4294967293;
  if (a1)
  {
    if (a2 >= 0x10)
    {
      if (a3)
      {
        if (a4)
        {
          unsigned int v9 = *a1;
          if (v9 <= 0x1C)
          {
            if (((1 << v9) & 0x1FFCFF4E) != 0)
            {
              size_t v10 = a1[3] + 16;
              if (v10 > a2) {
                goto LABEL_36;
              }
              uint64_t v11 = Util_AllocRequirement(v9, 0, &__dst);
              if (!v11)
              {
                if (__dst)
                {
                  memcpy(__dst, a1, v10);
LABEL_11:
                  uint64_t v4 = 0;
                  *a4 = v10;
                  *a3 = __dst;
                  return v4;
                }
                return 4294967292;
              }
              goto LABEL_35;
            }
            if (((1 << v9) & 0x30) != 0)
            {
              uint64_t v13 = a1[4];
              if (8 * v13 + 20 > a2) {
                goto LABEL_36;
              }
              uint64_t v11 = Util_AllocRequirement(v9, v13, &__dst);
              if (v11) {
                goto LABEL_35;
              }
              BOOL v14 = __dst;
              if (!__dst) {
                return 4294967292;
              }
              if (*((_DWORD *)__dst + 3) == 84)
              {
                long long v15 = *(_OWORD *)a1;
                *((_DWORD *)__dst + 4) = a1[4];
                _OWORD *v14 = v15;
                *((_DWORD *)__dst + 3) = 84;
                if (!a1[4])
                {
                  size_t v10 = 20;
                  goto LABEL_11;
                }
                uint64_t v16 = 0;
                size_t v10 = 20;
                while (1)
                {
                  uint64_t v21 = 0;
                  uint64_t v22 = 0;
                  uint64_t v11 = DeserializeRequirement((char *)a1 + v10, a2 - v10, &v22, &v21);
                  if (v11) {
                    goto LABEL_35;
                  }
                  *(void *)((char *)__dst + 8 * v16 + 20) = v22;
                  v10 += v21;
                  if (++v16 >= (unint64_t)a1[4]) {
                    goto LABEL_11;
                  }
                }
              }
              goto LABEL_39;
            }
            if (v9 == 7)
            {
              uint64_t v17 = a1[5];
              if (8 * v17 + 24 <= a2)
              {
                uint64_t v11 = Util_AllocRequirement(7, v17, &__dst);
                if (!v11)
                {
                  unint64_t v18 = __dst;
                  if (!__dst) {
                    return 4294967292;
                  }
                  if (*((_DWORD *)__dst + 3) != 88)
                  {
LABEL_39:
                    uint64_t v4 = 4294967291;
                    goto LABEL_36;
                  }
                  long long v19 = *(_OWORD *)a1;
                  *((void *)__dst + 2) = *((void *)a1 + 2);
                  *unint64_t v18 = v19;
                  *((_DWORD *)__dst + 3) = 88;
                  if (!a1[5])
                  {
                    size_t v10 = 24;
                    goto LABEL_11;
                  }
                  uint64_t v20 = 0;
                  size_t v10 = 24;
                  while (1)
                  {
                    uint64_t v21 = 0;
                    uint64_t v22 = 0;
                    uint64_t v11 = DeserializeRequirement((char *)a1 + v10, a2 - v10, &v22, &v21);
                    if (v11) {
                      break;
                    }
                    *((void *)__dst + v20 + 3) = v22;
                    v10 += v21;
                    if (++v20 >= (unint64_t)a1[5]) {
                      goto LABEL_11;
                    }
                  }
                }
LABEL_35:
                uint64_t v4 = v11;
              }
            }
          }
        }
      }
    }
  }
LABEL_36:
  if (__dst) {
    Util_DeallocRequirement((int *)__dst);
  }
  return v4;
}

uint64_t GetSerializedCredentialSize(_DWORD *a1, void *a2)
{
  uint64_t result = 4294967293;
  if (a1 && a2 && *a1 <= 0x17u && ((1 << *a1) & 0xFFF7FE) != 0)
  {
    uint64_t result = 0;
    *a2 = a1[7] + 32;
  }
  return result;
}

uint64_t SerializeCredential(unsigned int *__src, void *__dst, size_t *a3)
{
  uint64_t result = 4294967293;
  if (__src && __dst && a3)
  {
    unsigned int v6 = *__src;
    if (*__src <= 0x17 && ((1 << *__src) & 0xFFF7FE) != 0)
    {
      size_t v8 = __src[7] + 32;
      if (v8 <= *a3 && v6 <= 0x17 && ((1 << v6) & 0xFFF7FE) != 0)
      {
        memcpy(__dst, __src, v8);
        uint64_t result = 0;
        *a3 = __src[7] + 32;
      }
    }
  }
  return result;
}

uint64_t DeserializeCredential(unsigned int *a1, unint64_t a2, void **a3, void *a4)
{
  __dst = 0;
  uint64_t v4 = 4294967293;
  if (a2 >= 0x20 && a1 && a3 && a4)
  {
    unsigned int v8 = *a1;
    uint64_t v10 = a1[7];
    switch(*a1)
    {
      case 1u:
        if (v10 == 28) {
          goto LABEL_7;
        }
        return v4;
      case 2u:
        if (v10 == 136) {
          goto LABEL_7;
        }
        return v4;
      case 3u:
        if (v10 == 305) {
          goto LABEL_7;
        }
        return v4;
      case 4u:
      case 5u:
      case 6u:
      case 8u:
      case 0xEu:
      case 0x10u:
      case 0x13u:
      case 0x16u:
      case 0x17u:
        if (!v10) {
          goto LABEL_7;
        }
        return v4;
      case 7u:
        if (v10 == 56) {
          goto LABEL_7;
        }
        return v4;
      case 9u:
        if (v10 == 24) {
          goto LABEL_7;
        }
        return v4;
      case 0xAu:
        if (v10 == 52) {
          goto LABEL_7;
        }
        return v4;
      case 0xCu:
      case 0xFu:
        if (v10 == 8) {
          goto LABEL_7;
        }
        return v4;
      case 0xDu:
      case 0x15u:
        if (v10 == 132) {
          goto LABEL_7;
        }
        return v4;
      case 0x11u:
        if (v10 == 81) {
          goto LABEL_7;
        }
        return v4;
      case 0x12u:
        if (v10 == 20) {
          goto LABEL_7;
        }
        return v4;
      case 0x14u:
        if (v10 != 32) {
          return v4;
        }
LABEL_7:
        uint64_t v4 = Util_AllocCredential(*a1, &__dst);
        if (v4)
        {
          if (__dst)
          {
LABEL_16:
            Util_DeallocCredential(__dst);
            return v4;
          }
        }
        else
        {
          if (__dst)
          {
            if (*((_DWORD *)__dst + 1) > 3u || *((_DWORD *)__dst + 2) > 0x50u)
            {
              uint64_t v4 = 4294967293;
            }
            else
            {
              uint64_t v4 = 4294967293;
              if (v8 <= 0x17 && ((1 << v8) & 0xFFF7FE) != 0 && v10 + 32 <= a2)
              {
                memcpy(__dst, a1, v10 + 32);
                uint64_t v4 = 0;
                *a3 = __dst;
                *a4 = v10 + 32;
                return v4;
              }
            }
            goto LABEL_16;
          }
          uint64_t v4 = 4294967292;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

uint64_t CopyCredential(uint64_t a1, void **a2)
{
  __dst = 0;
  uint64_t v2 = 4294967293;
  if (a1 && a2)
  {
    uint64_t v2 = Util_AllocCredential(*(_DWORD *)a1, &__dst);
    if (v2)
    {
      if (__dst) {
        Util_DeallocCredential(__dst);
      }
    }
    else if (__dst)
    {
      memcpy(__dst, (const void *)a1, *(unsigned int *)(a1 + 28) + 32);
      uint64_t v2 = 0;
      *a2 = __dst;
    }
    else
    {
      return 4294967292;
    }
  }
  return v2;
}

uint64_t CompareCredentials(void *__s1, void *__s2, unsigned char *a3)
{
  uint64_t v3 = 4294967293;
  if (__s1)
  {
    uint64_t v4 = __s2;
    if (__s2)
    {
      if (a3)
      {
        unsigned int v6 = __s1;
        if (*(_DWORD *)__s1 == *(_DWORD *)__s2)
        {
          uint64_t v7 = *((unsigned int *)__s1 + 7);
          if (v7 == *((_DWORD *)__s2 + 7))
          {
            uint64_t v3 = 4294967293;
            switch(*(_DWORD *)__s1)
            {
              case 1:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                uint64_t v13 = (char *)__s1 + 44;
                BOOL v14 = (char *)__s2 + 44;
                goto LABEL_74;
              case 2:
                if (*((_DWORD *)__s1 + 8) != *((_DWORD *)__s2 + 8)) {
                  break;
                }
                size_t v8 = *((unsigned int *)__s1 + 9);
                if (v8 != *((_DWORD *)__s2 + 9)) {
                  break;
                }
                __s2 += 5;
                __s1 += 5;
                goto LABEL_8;
              case 3:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                uint64_t v13 = (char *)(__s1 + 13);
                BOOL v14 = (char *)(__s2 + 13);
                goto LABEL_74;
              case 4:
              case 5:
              case 6:
              case 8:
              case 0xC:
              case 0xE:
              case 0xF:
              case 0x10:
              case 0x11:
              case 0x12:
              case 0x13:
              case 0x16:
              case 0x17:
                size_t v8 = v7 + 32;
                goto LABEL_8;
              case 7:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                BOOL isNullOrEqualMem2 = _isNullOrEqualMem2((unint64_t)(__s1 + 4), 0x20uLL, (unint64_t)(__s2 + 4), 32);
                if (!isNullOrEqualMem2) {
                  goto LABEL_100;
                }
                uint64_t v13 = (char *)(v6 + 8);
                BOOL v14 = (char *)(v4 + 8);
                size_t v21 = 24;
                uint64_t v22 = 24;
                goto LABEL_103;
              case 9:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                uint64_t v13 = (char *)(__s1 + 5);
                BOOL v14 = (char *)(__s2 + 5);
                goto LABEL_74;
              case 0xA:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                BOOL isNullOrEqualMem2 = _isNullOrEqualMem2((unint64_t)__s1 + 36, 0x10uLL, (unint64_t)__s2 + 36, 16);
                if (!isNullOrEqualMem2) {
                  goto LABEL_100;
                }
                uint64_t v13 = (char *)v6 + 52;
                BOOL v14 = (char *)v4 + 52;
LABEL_74:
                size_t v21 = 16;
                uint64_t v22 = 16;
                goto LABEL_103;
              case 0xD:
                size_t v8 = *((unsigned int *)__s1 + 8);
                if (v8 != *((_DWORD *)__s2 + 8)) {
                  break;
                }
                __s2 = (void *)((char *)__s2 + 36);
                __s1 = (void *)((char *)__s1 + 36);
LABEL_8:
                LOBYTE(isNullOrEqualMem2) = memcmp(__s1, __s2, v8) == 0;
                goto LABEL_100;
              case 0x14:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                BOOL v14 = (char *)(__s2 + 4);
                uint64_t v13 = (char *)(__s1 + 4);
                size_t v21 = 32;
                uint64_t v22 = 32;
                goto LABEL_103;
              case 0x15:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                uint64_t v13 = (char *)__s1 + 36;
                BOOL v14 = (char *)__s2 + 36;
                size_t v21 = 128;
                uint64_t v22 = 128;
LABEL_103:
                LOBYTE(isNullOrEqualMem2) = _isNullOrEqualMem2((unint64_t)v13, v21, (unint64_t)v14, v22);
                goto LABEL_100;
              default:
                return v3;
            }
          }
        }
        LOBYTE(isNullOrEqualMem2) = 0;
LABEL_100:
        uint64_t v3 = 0;
        *a3 = isNullOrEqualMem2;
      }
    }
  }
  return v3;
}

BOOL _isNullOrEqualMem2(unint64_t __s1, size_t __n, unint64_t __s2, uint64_t a4)
{
  if (__n != a4) {
    return 0;
  }
  if (!(__s1 | __s2)) {
    return 1;
  }
  BOOL result = 0;
  BOOL v6 = __s1 == 0;
  if (__s2)
  {
    BOOL v7 = 1;
  }
  else
  {
    BOOL v6 = 0;
    BOOL v7 = __s1 == 0;
  }
  if (v7 && !v6) {
    return memcmp((const void *)__s1, (const void *)__s2, __n) == 0;
  }
  return result;
}

uint64_t GetSerializedAddCredentialSize(uint64_t a1, _DWORD *a2, int a3, void *a4)
{
  if (a1) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = a3 == 2;
  }
  char v5 = !v4;
  uint64_t result = 4294967293;
  if (a4 && a2 && (v5 & 1) == 0 && *a2 <= 0x17u && ((1 << *a2) & 0xFFF7FE) != 0)
  {
    uint64_t result = 0;
    *a4 = a2[7] + 52;
  }
  return result;
}

uint64_t SerializeAddCredential(_OWORD *a1, unsigned int *__src, int a3, uint64_t a4, void *a5)
{
  if (a1) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a3 == 2;
  }
  char v7 = !v6;
  uint64_t result = 4294967293;
  if (a5)
  {
    if (a4)
    {
      if (__src)
      {
        if ((v7 & 1) == 0)
        {
          uint64_t result = 4294967293;
          if (*__src <= 0x17 && ((1 << *__src) & 0xFFF7FE) != 0 && *a5 >= (unint64_t)__src[7] + 52)
          {
            if (a1)
            {
              *(_OWORD *)a4 = *a1;
            }
            else
            {
              *(void *)a4 = 0;
              *(void *)(a4 + 8) = 0;
            }
            uint64_t v13 = *a5 - 16;
            uint64_t result = SerializeCredential(__src, (void *)(a4 + 16), (size_t *)&v13);
            if (!result)
            {
              size_t v12 = v13;
              *(_DWORD *)(v13 + a4 + 16) = a3;
              *a5 = v12 + 20;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeAddCredential(uint64_t a1, unint64_t a2, _OWORD *a3, void *a4, _DWORD *a5)
{
  size_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v5 = 4294967293;
  if (a1 && a2 >= 0x34 && a3 && a4 && a5)
  {
    *a3 = *(_OWORD *)a1;
    uint64_t v10 = DeserializeCredential((unsigned int *)(a1 + 16), a2 - 16, (void **)&v12, &v13);
    if (v10)
    {
      uint64_t v5 = v10;
    }
    else if (a2 - (v13 + 16) >= 4)
    {
      uint64_t v5 = 0;
      *a5 = *(_DWORD *)(a1 + v13 + 16);
      *a4 = v12;
      return v5;
    }
  }
  if (v12) {
    Util_DeallocCredential(v12);
  }
  return v5;
}

uint64_t DeserializeAddCredentialType(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  uint64_t result = 4294967293;
  if (a2 >= 0x34 && a1)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a3 = *(_DWORD *)(a1 + 16);
    }
  }
  return result;
}

uint64_t SerializeCredentialList(unsigned int **a1, unsigned int a2, unsigned int *a3, void *a4)
{
  if (a2) {
    BOOL v6 = a1 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6 || a3 == 0 || a4 == 0) {
    return 4294967293;
  }
  v16[7] = v4;
  v16[8] = v5;
  *a3 = a2;
  if (a2)
  {
    uint64_t v11 = a1;
    uint64_t v12 = a2;
    uint64_t v13 = 4;
    while (1)
    {
      BOOL v14 = *v11;
      if (!*v11) {
        return 4294967293;
      }
      v16[0] = *a4 - v13;
      uint64_t result = SerializeCredential(v14, (char *)a3 + v13, v16);
      if (result) {
        return result;
      }
      v13 += v16[0];
      ++v11;
      if (!--v12) {
        goto LABEL_18;
      }
    }
  }
  else
  {
    uint64_t v13 = 4;
LABEL_18:
    uint64_t result = 0;
    *a4 = v13;
  }
  return result;
}

uint64_t DeserializeCredentialList(unsigned int *a1, uint64_t a2, void *a3, _DWORD *a4)
{
  uint64_t v15 = 0;
  uint64_t v4 = 4294967293;
  if (a1)
  {
    if (a3)
    {
      if (a4)
      {
        uint64_t v8 = *a1;
        if (v8 <= 0x3E8)
        {
          if (v8)
          {
            uint64_t v10 = (char *)acm_mem_alloc(8 * v8);
            acm_mem_alloc_info("array of ACMCredentialRef", v10, 8 * v8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 1778, "DeserializeCredentialList");
            if (v10)
            {
              uint64_t v11 = 0;
              uint64_t v12 = 4;
              while (1)
              {
                uint64_t v13 = DeserializeCredential((unsigned int *)((char *)a1 + v12), a2 - v12, (void **)&v10[v11], &v15);
                if (v13) {
                  break;
                }
                v12 += v15;
                v11 += 8;
                if (8 * v8 == v11) {
                  goto LABEL_12;
                }
              }
              uint64_t v4 = v13;
              DeallocCredentialList((_DWORD **)v10, v8);
            }
            else
            {
              return 4294967292;
            }
          }
          else
          {
            uint64_t v10 = 0;
LABEL_12:
            uint64_t v4 = 0;
            *a4 = v8;
            *a3 = v10;
          }
        }
      }
    }
  }
  return v4;
}

void DeallocCredentialList(_DWORD **a1, unsigned int a2)
{
  if (a1)
  {
    uint64_t v3 = a2;
    if (a2)
    {
      uint64_t v4 = a1;
      uint64_t v5 = a2;
      do
      {
        if (*v4)
        {
          Util_DeallocCredential(*v4);
          *uint64_t v4 = 0;
        }
        ++v4;
        --v5;
      }
      while (v5);
    }
    unint64_t v6 = 8 * v3;
    acm_mem_free_info("array of ACMCredentialRef", a1, v6, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 1816, "DeallocCredentialList");
    acm_mem_free(a1, v6);
  }
}

uint64_t GetSerializedGetContextPropertySize(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a3) {
    return 4294967293;
  }
  uint64_t result = 0;
  *a3 = 20;
  return result;
}

__n128 SerializeGetContextProperty(__n128 *a1, unsigned __int32 a2, __n128 *a3, void *a4)
{
  if (a1 && a3 && a4 && *a4 >= 0x14uLL)
  {
    __n128 result = *a1;
    *a3 = *a1;
    a3[1].n128_u32[0] = a2;
    *a4 = 20;
  }
  return result;
}

uint64_t DeserializeGetContextProperty(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4)
{
  uint64_t result = 4294967293;
  if (a2 >= 0x10 && a1 && a3 && a4)
  {
    *a3 = *(_OWORD *)a1;
    if ((a2 & 0xFFFFFFFFFFFFFFFCLL) != 0x10)
    {
      uint64_t result = 0;
      *a4 = *(_DWORD *)(a1 + 16);
    }
  }
  return result;
}

uint64_t LibSer_GetAclAuthMethod_GetSize(uint64_t a1, void *a2)
{
  if (!a2) {
    return 4294967293;
  }
  uint64_t result = 0;
  *a2 = 16;
  return result;
}

__n128 LibSer_GetAclAuthMethod_Serialize(__n128 *a1, __n128 *a2, void *a3)
{
  if (a1 && a2 && a3 && *a3 >= 0x10uLL)
  {
    __n128 result = *a1;
    *a2 = *a1;
    *a3 = 16;
  }
  return result;
}

__n128 LibSer_GetAclAuthMethod_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3)
{
  if (a2 >= 0x10 && a1)
  {
    if (a3)
    {
      __n128 result = *a1;
      *a3 = *a1;
    }
  }
  return result;
}

uint64_t LibSer_ContextCredentialGetProperty_GetSize(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a4) {
    return 4294967293;
  }
  uint64_t result = 0;
  *a4 = 24;
  return result;
}

__n128 LibSer_ContextCredentialGetProperty_Serialize(__n128 *a1, unsigned __int32 a2, unsigned __int32 a3, __n128 *a4, void *a5)
{
  if (a1 && a4 && a5 && *a5 >= 0x18uLL)
  {
    __n128 result = *a1;
    *a4 = *a1;
    a4[1].n128_u32[0] = a2;
    a4[1].n128_u32[1] = a3;
    *a5 = 24;
  }
  return result;
}

__n128 LibSer_ContextCredentialGetProperty_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3, _DWORD *a4, _DWORD *a5)
{
  if (a2 >= 0x18 && a1 && a3 && a4)
  {
    if (a5)
    {
      __n128 result = *a1;
      *a3 = *a1;
      *a4 = a1[1].n128_u32[0];
      *a5 = a1[1].n128_u32[1];
    }
  }
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_GetSize(void *a1)
{
  if (!a1) {
    return 4294967293;
  }
  uint64_t result = 0;
  *a1 = 8;
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_Serialize(int a1, int a2, _DWORD *a3, void *a4)
{
  uint64_t result = 4294967293;
  if (a3 && a4 && *a4 >= 8uLL)
  {
    uint64_t result = 0;
    *a3 = a1;
    a3[1] = a2;
    *a4 = 8;
  }
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_Deserialize(_DWORD *a1, unint64_t a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t result = 4294967293;
  if (a2 >= 8 && a1 && a3)
  {
    if (a4)
    {
      uint64_t result = 0;
      *a3 = *a1;
      *a4 = a1[1];
    }
  }
  return result;
}

uint64_t LibSer_StorageAnyCmd_DeserializeCommonFields(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4)
{
  uint64_t result = 4294967293;
  if (a1 && a2 >= 0x14)
  {
    if (a3) {
      *a3 = *(_OWORD *)a1;
    }
    uint64_t result = 0;
    if (a4) {
      *a4 = *(_DWORD *)(a1 + 16);
    }
  }
  return result;
}

uint64_t LibSer_StorageSetData_GetSize(uint64_t a1, _DWORD *a2, unsigned int a3, void *a4)
{
  unsigned int v7 = 0;
  if (!a4) {
    return 4294967291;
  }
  uint64_t result = getLengthOfParameters(a2, a3, &v7);
  if (!result) {
    *a4 = a1 + v7 + 28;
  }
  return result;
}

uint64_t LibSer_StorageSetData_Serialize(_OWORD *a1, int a2, const void *a3, size_t a4, _DWORD *a5, unsigned int a6, uint64_t a7, size_t *a8)
{
  uint64_t result = 4294967293;
  if (a1)
  {
    if (a2)
    {
      if (a7)
      {
        if (a8)
        {
          unsigned int v18 = 0;
          uint64_t result = getLengthOfParameters(a5, a6, &v18);
          if (!result)
          {
            if (*a8 < a4 + v18 + 28)
            {
              return 4294967293;
            }
            else
            {
              *(_OWORD *)a7 = *a1;
              *(_DWORD *)(a7 + 16) = a2;
              *(_DWORD *)(a7 + 20) = a4;
              memcpy((void *)(a7 + 24), a3, a4);
              size_t v17 = a4 + 24;
              uint64_t result = serializeParameters((uint64_t)a5, a6, a7, (uint64_t *)&v17);
              if (!result) {
                *a8 = v17;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_StorageSetData_Deserialize(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4, void *a5, void *a6, void *a7, _DWORD *a8)
{
  uint64_t v10 = 4294967293;
  if (a1 && a2 >= 0x18 && a6 && a3 && a4 && a5 && a7 && a8)
  {
    v14[1] = v8;
    _OWORD v14[2] = v9;
    *a3 = *(_OWORD *)a1;
    *a4 = *(_DWORD *)(a1 + 16);
    uint64_t v11 = *(unsigned int *)(a1 + 20);
    v14[0] = 24;
    *a6 = v11;
    if (v11)
    {
      unint64_t v12 = v11 + 24;
      if (v12 > a2) {
        return 4294967293;
      }
      *a5 = a1 + 24;
      v14[0] = v12;
    }
    else
    {
      *a5 = 0;
    }
    return deserializeParameters(a1, a2, v14, a7, a8);
  }
  return v10;
}

uint64_t LibSer_StorageGetData_GetSize(_DWORD *a1, unsigned int a2, void *a3)
{
  unsigned int v5 = 0;
  if (!a3) {
    return 4294967291;
  }
  uint64_t result = getLengthOfParameters(a1, a2, &v5);
  if (!result) {
    *a3 = v5 + 25;
  }
  return result;
}

uint64_t LibSer_StorageGetData_Serialize(_OWORD *a1, int a2, char a3, _DWORD *a4, unsigned int a5, uint64_t a6, void *a7)
{
  uint64_t result = 4294967293;
  if (a1)
  {
    if (a2)
    {
      if (a6)
      {
        if (a7)
        {
          unsigned int v16 = 0;
          uint64_t result = getLengthOfParameters(a4, a5, &v16);
          if (!result)
          {
            if (*a7 < (unint64_t)v16 + 25)
            {
              return 4294967293;
            }
            else
            {
              *(_OWORD *)a6 = *a1;
              *(_DWORD *)(a6 + 16) = a2;
              *(unsigned char *)(a6 + 20) = a3;
              uint64_t v15 = 21;
              uint64_t result = serializeParameters((uint64_t)a4, a5, a6, &v15);
              if (!result) {
                *a7 = v15;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_StorageGetData_Deserialize(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4, BOOL *a5, void *a6, _DWORD *a7)
{
  uint64_t v9 = 4294967293;
  if (a1 && a2 >= 0x15 && a3 && a4 && a5)
  {
    v11[1] = v7;
    unsigned char v11[2] = v8;
    *a3 = *(_OWORD *)a1;
    *a4 = *(_DWORD *)(a1 + 16);
    *a5 = *(unsigned char *)(a1 + 20) != 0;
    v11[0] = 21;
    return deserializeParameters(a1, a2, v11, a6, a7);
  }
  return v9;
}

uint64_t LibSer_GetUnlockSecret_GetSize(_DWORD *a1, unsigned int a2, void *a3)
{
  unsigned int v5 = 0;
  if (!a3) {
    return 4294967291;
  }
  uint64_t result = getLengthOfParameters(a1, a2, &v5);
  if (!result) {
    *a3 = v5 + 20;
  }
  return result;
}

uint64_t LibSer_GetUnlockSecret_Serialize(_OWORD *a1, _DWORD *a2, unsigned int a3, _OWORD *a4, void *a5)
{
  uint64_t result = 4294967293;
  if (a1)
  {
    if (a4)
    {
      if (a5)
      {
        unsigned int v12 = 0;
        uint64_t result = getLengthOfParameters(a2, a3, &v12);
        if (!result)
        {
          if (*a5 < (unint64_t)v12 + 20)
          {
            return 4294967293;
          }
          else
          {
            *a4 = *a1;
            uint64_t v11 = 16;
            uint64_t result = serializeParameters((uint64_t)a2, a3, (uint64_t)a4, &v11);
            if (!result) {
              *a5 = v11;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_GetUnlockSecret_Deserialize(_OWORD *a1, unint64_t a2, _OWORD *a3, void *a4, _DWORD *a5)
{
  if (!a1) {
    return 4294967293;
  }
  uint64_t result = 4294967293;
  if (a2 >= 0x10 && a3 && a4)
  {
    if (a5)
    {
      v9[1] = v5;
      _OWORD v9[2] = v6;
      *a3 = *a1;
      v9[0] = 16;
      return deserializeParameters((uint64_t)a1, a2, v9, a4, a5);
    }
  }
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_GetSize(uint64_t a1, void *a2)
{
  if (!a2) {
    return 4294967291;
  }
  uint64_t result = 0;
  *a2 = a1 + 1;
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_Serialize(void *__src, size_t __n, char a3, unsigned char *a4, void *a5)
{
  uint64_t result = 4294967293;
  if (__src && __n && a4 && a5)
  {
    size_t v9 = __n + 1;
    if (*a5 < __n + 1)
    {
      return 4294967293;
    }
    else
    {
      *a4 = a3;
      memcpy(a4 + 1, __src, __n);
      uint64_t result = 0;
      *a5 = v9;
    }
  }
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_Deserialize(unsigned char *a1, uint64_t a2, void *a3, void *a4, unsigned char *a5)
{
  uint64_t result = 4294967293;
  if (a2 && a5 && a1 && a3)
  {
    if (a4)
    {
      uint64_t result = 0;
      *a5 = *a1;
      *a3 = a1 + 1;
      *a4 = a2 - 1;
    }
  }
  return result;
}

uint64_t LibSer_SEPControl_GetSize(uint64_t a1, _DWORD *a2, unsigned int a3, void *a4)
{
  unsigned int v7 = 0;
  if (!a4) {
    return 4294967291;
  }
  uint64_t result = getLengthOfParameters(a2, a3, &v7);
  if (!result) {
    *a4 = a1 + v7 + 24;
  }
  return result;
}

uint64_t LibSer_SEPControl_Serialize(_OWORD *a1, _DWORD *a2, unsigned int a3, const void *a4, size_t a5, uint64_t a6, void *a7)
{
  uint64_t result = 4294967293;
  if (a6)
  {
    if (a7)
    {
      unsigned int v18 = 0;
      uint64_t result = getLengthOfParameters(a2, a3, &v18);
      if (!result)
      {
        if (*a7 < a5 + v18 + 24)
        {
          return 4294967293;
        }
        else
        {
          if (a1)
          {
            *(_OWORD *)a6 = *a1;
          }
          else
          {
            *(void *)a6 = 0;
            *(void *)(a6 + 8) = 0;
          }
          uint64_t v17 = 16;
          uint64_t result = serializeParameters((uint64_t)a2, a3, a6, &v17);
          if (!result)
          {
            uint64_t v15 = v17;
            *(_DWORD *)(a6 + v17) = a5;
            uint64_t v16 = v15 + 4;
            memcpy((void *)(a6 + v15 + 4), a4, a5);
            uint64_t result = 0;
            *a7 = v16 + a5;
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_SEPControl_Deserialize(_OWORD *a1, unint64_t a2, _OWORD *a3, void *a4, _DWORD *a5, unint64_t *a6, void *a7)
{
  if (!a1) {
    return 4294967293;
  }
  uint64_t result = 4294967293;
  if (a2 >= 0x18 && a7 && a3 && a4 && a5 && a6)
  {
    *a3 = *a1;
    unint64_t v12 = 16;
    uint64_t result = deserializeParameters((uint64_t)a1, a2, &v12, a4, a5);
    if (!result)
    {
      unint64_t v11 = (unint64_t)a1 + v12 + 4;
      *a7 = *(unsigned int *)((char *)a1 + v12);
      *a6 = v11;
    }
  }
  return result;
}

uint64_t LibSer_SEPControlResponse_GetSize(uint64_t a1, void *a2)
{
  if (!a2) {
    return 4294967291;
  }
  uint64_t result = 0;
  *a2 = a1 + 4;
  return result;
}

uint64_t LibSer_SEPControlResponse_Serialize(void *__src, size_t __n, _DWORD *a3, uint64_t *a4)
{
  uint64_t result = 4294967293;
  if (a3 && a4)
  {
    uint64_t v8 = __n + 4;
    if (*a4 < __n + 4)
    {
      return 4294967293;
    }
    else
    {
      *a3 = __n;
      if (__src) {
        memcpy(a3 + 1, __src, __n);
      }
      else {
        uint64_t v8 = 4;
      }
      uint64_t result = 0;
      *a4 = v8;
    }
  }
  return result;
}

uint64_t LibSer_SEPControlResponse_Deserialize(unsigned int *a1, unint64_t a2, void *a3, void *a4)
{
  if (!a1) {
    return 4294967293;
  }
  uint64_t result = 4294967293;
  if (a2 >= 4 && a3 && a4)
  {
    uint64_t result = 0;
    unsigned int v7 = *a1;
    unint64_t v6 = a1 + 1;
    *a4 = v7;
    if (!v7) {
      unint64_t v6 = 0;
    }
    *a3 = v6;
  }
  return result;
}

uint64_t checkParameter(_DWORD *a1)
{
  if (!a1) {
    return 4294967293;
  }
  switch(*a1)
  {
    case 0:
    case 0xC:
      if (a1[4]) {
        return 4294967293;
      }
      break;
    case 1:
    case 4:
    case 5:
    case 0xA:
      if (a1[4] != 4) {
        return 4294967293;
      }
      break;
    case 2:
    case 6:
    case 7:
      if (a1[4] != 16) {
        return 4294967293;
      }
      break;
    case 3:
      if ((a1[4] - 1001) < 0xFFFFFC18) {
        return 4294967293;
      }
      break;
    case 8:
    case 9:
      if (a1[4] != 1) {
        return 4294967293;
      }
      break;
    case 0xB:
      if (a1[4] > 0x400u) {
        return 4294967293;
      }
      break;
    default:
      return 4294967293;
  }
  return 0;
}

uint64_t LibCall_ACMKernelControl_Block(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  size_t v5 = v4;
  unsigned int v7 = v6;
  int v9 = v8;
  uint64_t v11 = v10;
  unint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, uint64_t, uint64_t))v1;
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernelControl_Block");
  }
  uint64_t v17 = 0x2000;
  uint64_t v13 = LibCall_ACMKernelControl(v12, v11, v9, v7, v5, (uint64_t)v18, (uint64_t)&v17);
  if (v3)
  {
    if (v17) {
      BOOL v14 = v18;
    }
    else {
      BOOL v14 = 0;
    }
    (*(void (**)(uint64_t, unsigned char *))(v3 + 16))(v3, v14);
  }
  if (v13) {
    unsigned int v15 = 70;
  }
  else {
    unsigned int v15 = 10;
  }
  if (v15 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernelControl_Block", (int)v13);
  }
  return v13;
}

uint64_t LibCall_ACMSEPControl_Block(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, unsigned int *, unint64_t *), uint64_t a2, const void *a3, size_t a4, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSEPControl_Block");
  }
  size_t v20 = 1024;
  uint64_t v16 = LibCall_ACMSEPControl(a1, a2, a3, a4, a5, a6, a7, v21, &v20);
  if (a8)
  {
    if (v20) {
      uint64_t v17 = v21;
    }
    else {
      uint64_t v17 = 0;
    }
    (*(void (**)(uint64_t, unsigned char *))(a8 + 16))(a8, v17);
  }
  if (v16) {
    unsigned int v18 = 70;
  }
  else {
    unsigned int v18 = 10;
  }
  if (v18 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSEPControl_Block", (int)v16);
  }
  return v16;
}

uint64_t LibCall_ACMGlobalContextCredentialGetProperty_Block(uint64_t result, uint64_t a2, int a3, int a4, uint64_t a5)
{
  int v9 = (uint64_t (*)(uint64_t, uint64_t, void, int *, uint64_t, unsigned char *, uint64_t *))result;
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (gACMLoggingLevel <= 0xAu) {
    uint64_t result = printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty_Block");
  }
  uint64_t v14 = 256;
  if (v9)
  {
    uint64_t v13 = 8;
    uint64_t result = LibSer_GlobalContextCredentialGetProperty_Serialize(a3, a4, &v15, &v13);
    if (result)
    {
LABEL_7:
      uint64_t v10 = result;
      goto LABEL_8;
    }
    if (v13 == 8)
    {
      uint64_t result = v9(a2, 27, 0, &v15, 8, v16, &v14);
      goto LABEL_7;
    }
    uint64_t v10 = 4294967291;
  }
  else
  {
    uint64_t v10 = 4294967293;
  }
LABEL_8:
  if (a5)
  {
    if (v14) {
      uint64_t v11 = v16;
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned char *))(a5 + 16))(a5, v10, v11);
  }
  if (v10) {
    unsigned int v12 = 70;
  }
  else {
    unsigned int v12 = 10;
  }
  if (v12 >= gACMLoggingLevel) {
    return printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty_Block", (int)v10);
  }
  return result;
}

uint64_t LibCall_ACMContextVerifyPolicy_Block(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *a4, uint64_t a5)
{
  return LibCall_ACMContextVerifyPolicyWithPreflight_Block(a1, a2, a3, a4, 0, a5);
}

uint64_t LibCall_ACMContextVerifyPolicyWithPreflight_Block(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, uint64_t a6)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyWithPreflight_Block");
  }
  uint64_t v17 = 0;
  BOOL v16 = 0;
  unsigned int v12 = 70;
  uint64_t v13 = 4294967293;
  if (a3 && __s1 && a6)
  {
    uint64_t v13 = LibCall_ACMContextVerifyPolicyEx(a1, a2, a3, __s1, a5, 0, 0, 0, &v16, &v17);
    uint64_t v14 = v17;
    if (!v13)
    {
      (*(void (**)(uint64_t, BOOL, int *))(a6 + 16))(a6, v16, v17);
      uint64_t v14 = v17;
    }
    if (v14) {
      Util_DeallocRequirement(v14);
    }
    if (v13) {
      unsigned int v12 = 70;
    }
    else {
      unsigned int v12 = 10;
    }
  }
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyWithPreflight_Block", (int)v13);
  }
  return v13;
}

int *LibCall_ACMContextVerifyPolicyEx_Block(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx_Block");
  }
  BOOL v17 = 0;
  unsigned int v18 = 0;
  uint64_t v22 = 0;
  BOOL v21 = 0;
  uint64_t v19 = 4294967293;
  if (a3 && __s1 && a9)
  {
    uint64_t v19 = LibCall_ACMContextVerifyPolicyEx(a1, a2, a3, __s1, a5, a6, a7, a8, &v21, &v22);
    unsigned int v18 = v22;
    BOOL v17 = v21;
  }
  (*(void (**)(uint64_t, uint64_t, BOOL, int *))(a9 + 16))(a9, v19, v17, v18);
  uint64_t result = v22;
  if (v22) {
    uint64_t result = (int *)Util_DeallocRequirement(v22);
  }
  if (gACMLoggingLevel <= 0xAu) {
    return (int *)printf("%s: %s: returning.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx_Block");
  }
  return result;
}

uint64_t LibCall_ACMGlobalContextVerifyPolicy_Block(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, char *a3, uint64_t a4, _DWORD *a5, unsigned int a6, uint64_t a7)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicy_Block");
  }
  *(void *)int v15 = 0;
  uint64_t result = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, void, void, void, unsigned char *, uint64_t *))a1, a2, v15, 0, 1);
  if (result)
  {
    if (a7) {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, void))(a7 + 16))(a7, result, 0, 0);
    }
  }
  else
  {
    uint64_t result = (uint64_t)LibCall_ACMContextVerifyPolicyEx_Block(a1, a2, *(_OWORD **)v15, a3, a4, a5, a6, 0xFFFFFFFFLL, a7);
  }
  if (*(void *)v15) {
    uint64_t result = LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, void, void *, uint64_t, void, void))a1, a2, *(void **)v15, 1);
  }
  if (gACMLoggingLevel <= 0xAu) {
    return printf("%s: %s: returning.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicy_Block");
  }
  return result;
}

uint64_t LibCall_ACMGetEnvironmentVariable_Block(uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGetEnvironmentVariable_Block");
  }
  uint64_t v14 = 128;
  if (!a4)
  {
    unsigned int v12 = 70;
    uint64_t v9 = 4294967293;
    goto LABEL_17;
  }
  if (a3 == 36)
  {
    int v8 = acm_mem_alloc_data(0x800uLL);
    acm_mem_alloc_info("<data>", v8, 2048, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c", 162, "LibCall_ACMGetEnvironmentVariable_Block");
    if (!v8)
    {
      unsigned int v12 = 70;
      uint64_t v9 = 4294967292;
      goto LABEL_17;
    }
    uint64_t v14 = 2048;
    uint64_t v9 = LibCall_ACMGetEnvironmentVariable(a1, a2, 36, (uint64_t)v8, (uint64_t)&v14);
    if (!v9)
    {
      if (v14) {
        uint64_t v10 = v8;
      }
      else {
        uint64_t v10 = 0;
      }
      (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v10);
      acm_mem_free_info("<data>", v8, 0x800uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c", 176, "LibCall_ACMGetEnvironmentVariable_Block");
      acm_mem_free_data(v8, 0x800uLL);
LABEL_16:
      unsigned int v12 = 10;
      goto LABEL_17;
    }
    acm_mem_free_info("<data>", v8, 0x800uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c", 176, "LibCall_ACMGetEnvironmentVariable_Block");
    acm_mem_free_data(v8, 0x800uLL);
  }
  else
  {
    uint64_t v9 = LibCall_ACMGetEnvironmentVariable(a1, a2, a3, (uint64_t)v15, (uint64_t)&v14);
    if (!v9)
    {
      if (v14) {
        uint64_t v11 = v15;
      }
      else {
        uint64_t v11 = 0;
      }
      (*(void (**)(uint64_t, unsigned char *))(a4 + 16))(a4, v11);
      goto LABEL_16;
    }
  }
  unsigned int v12 = 70;
LABEL_17:
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGetEnvironmentVariable_Block", (int)v9);
  }
  return v9;
}

uint64_t LibCall_ACMTRMLoadState_Block(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, void, void, void, uint64_t, uint64_t))v1;
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMTRMLoadState_Block");
  }
  uint64_t v11 = 0x2000;
  if (v3)
  {
    uint64_t v7 = LibCall_ACMTRMLoadState(v6, v5, (uint64_t)v12, (uint64_t)&v11);
    if (v7)
    {
      unsigned int v9 = 70;
    }
    else
    {
      if (v11) {
        int v8 = v12;
      }
      else {
        int v8 = 0;
      }
      (*(void (**)(uint64_t, unsigned char *))(v3 + 16))(v3, v8);
      unsigned int v9 = 10;
    }
  }
  else
  {
    unsigned int v9 = 70;
    uint64_t v7 = 4294967293;
  }
  if (v9 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMLoadState_Block", (int)v7);
  }
  return v7;
}

uint64_t LibCall_ACMContextUnloadToImage_Block(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextUnloadToImage_Block");
  }
  if (v3)
  {
    uint64_t v5 = LibCall_ACMContextUnloadToImage(v4);
    if (v5)
    {
      unsigned int v6 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, unsigned char *))(v3 + 16))(v3, v8);
      unsigned int v6 = 10;
    }
  }
  else
  {
    unsigned int v6 = 70;
    uint64_t v5 = 4294967293;
  }
  if (v6 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextUnloadToImage_Block", (int)v5);
  }
  return v5;
}

uint64_t LibCall_ACMGetAclAuthMethod_Block(uint64_t result, uint64_t a2, __n128 *a3, uint64_t a4)
{
  uint64_t v7 = (void (*)(uint64_t, uint64_t, void, __n128 *, uint64_t, unsigned char *, uint64_t *, __n128))result;
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (gACMLoggingLevel <= 0xAu) {
    uint64_t result = printf("%s: %s: called.\n", "ACM", "LibCall_ACMGetAclAuthMethod_Block");
  }
  uint64_t v11 = 256;
  if (v7 && a3 && a4)
  {
    uint64_t v10 = 16;
    __n128 AclAuthMethod_Serialize = LibSer_GetAclAuthMethod_Serialize(a3, &v12, &v10);
    if (!v9 && v10 == 16) {
      v7(a2, 31, 0, &v12, 16, v13, &v11, AclAuthMethod_Serialize);
    }
    goto LABEL_9;
  }
  if (a4) {
LABEL_9:
  }
    uint64_t result = (*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
  if (gACMLoggingLevel <= 0xAu) {
    return printf("%s: %s: returning.\n", "ACM", "LibCall_ACMGetAclAuthMethod_Block");
  }
  return result;
}

uint64_t LibCall_ACMContextVerifyAclConstraint(uint64_t a1, uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, unsigned __int8 a6, _DWORD *a7, unsigned int a8, unsigned int a9, uint64_t a10)
{
  return verifyAclConstraintForOperationCommandInternal(a1, a2, 0xBu, a3, a4, a5, 0, 0, a6, a7, a8, a9, a10);
}

uint64_t verifyAclConstraintForOperationCommandInternal(uint64_t result, uint64_t a2, unsigned __int8 a3, _OWORD *a4, const void *a5, uint64_t a6, const void *a7, unsigned int a8, unsigned __int8 a9, _DWORD *a10, unsigned int a11, unsigned int a12, uint64_t a13)
{
  size_t v20 = (uint64_t (*)(uint64_t, uint64_t, void, void *, size_t, unsigned int *, unint64_t *))result;
  if (gACMLoggingLevel <= 0xAu) {
    uint64_t result = printf("%s: %s: called.\n", "ACM", "verifyAclConstraintForOperationCommandInternal");
  }
  size_t v25 = 0;
  BOOL v24 = 0;
  if (a4 && a5 && a6 && a13)
  {
    uint64_t v21 = verifyAclConstraintInternal(v20, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, &v24, &v25);
    uint64_t v22 = v25;
    BOOL v23 = v24;
  }
  else
  {
    if (!a13) {
      goto LABEL_10;
    }
    uint64_t v22 = 0;
    BOOL v23 = 0;
    uint64_t v21 = 4294967293;
  }
  (*(void (**)(uint64_t, uint64_t, BOOL, int *))(a13 + 16))(a13, v21, v23, v22);
  uint64_t result = (uint64_t)v25;
  if (v25) {
    uint64_t result = Util_DeallocRequirement(v25);
  }
LABEL_10:
  if (gACMLoggingLevel <= 0xAu) {
    return printf("%s: %s: returning.\n", "ACM", "verifyAclConstraintForOperationCommandInternal");
  }
  return result;
}

uint64_t LibCall_ACMContextVerifyAclConstraintForOperation(uint64_t a1, uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, const void *a6, unsigned int a7, unsigned __int8 a8, _DWORD *a9, unsigned int a10, unsigned int a11, uint64_t a12)
{
  return verifyAclConstraintForOperationCommandInternal(a1, a2, 0x20u, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t Util_GetBitCount(uint64_t a1)
{
  uint8x8_t v1 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
  v1.i16[0] = vaddlv_u8(v1);
  return v1.u32[0];
}

BOOL Util_isNullOrZeroMemory(unsigned char *a1, uint64_t a2)
{
  if (!a1) {
    return 1;
  }
  if (*a1) {
    return 0;
  }
  return memcmp(a1, a1 + 1, a2 - 1) == 0;
}

BOOL Util_isNonNullEqualMemory(void *__s1, size_t __n, void *__s2, uint64_t a4)
{
  if (__n != a4) {
    return 0;
  }
  BOOL result = 0;
  if (__s1)
  {
    if (__s2) {
      return memcmp(__s1, __s2, __n) == 0;
    }
  }
  return result;
}

char *Util_hexDumpToStrHelper(char *result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (!result && a2) {
    Util_hexDumpToStrHelper_cold_1();
  }
  if (!a3 && a4) {
    Util_hexDumpToStrHelper_cold_2();
  }
  if (a2 >= a4) {
    unint64_t v4 = a4;
  }
  else {
    unint64_t v4 = a2;
  }
  if (v4)
  {
    uint64_t v5 = (unsigned char *)(a3 + 1);
    do
    {
      *(v5 - 1) = a0123456789abcd[(unint64_t)*result >> 4];
      char v6 = *result++;
      *uint64_t v5 = a0123456789abcd[v6 & 0xF];
      v5 += 2;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t Util_WriteToBuffer(uint64_t a1, size_t a2, void *a3, void *__src, size_t __n)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "Util_WriteToBuffer");
  }
  if (a3)
  {
    uint64_t v10 = *a3;
    size_t v11 = *a3 + __n;
    if (!__CFADD__(*a3, __n))
    {
      if (a1 && v11 > a2)
      {
        uint64_t v12 = 4294967276;
        goto LABEL_19;
      }
      if (!a1 || !__src || !__n) {
        goto LABEL_12;
      }
      if (!__CFADD__(a1, v10))
      {
        memcpy((void *)(a1 + v10), __src, __n);
LABEL_12:
        uint64_t v12 = 0;
        *a3 = v11;
        unsigned int v13 = 10;
        goto LABEL_13;
      }
    }
    uint64_t v12 = 4294967291;
  }
  else
  {
    uint64_t v12 = 4294967293;
  }
LABEL_19:
  unsigned int v13 = 70;
LABEL_13:
  if (v13 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_WriteToBuffer", (int)v12);
  }
  return v12;
}

uint64_t Util_ReadFromBuffer(uint64_t a1, size_t a2, void *a3, void *__dst, size_t __n)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "Util_ReadFromBuffer");
  }
  uint64_t v10 = 4294967293;
  unsigned int v11 = 70;
  if (a1 && a3)
  {
    uint64_t v12 = *a3;
    size_t v13 = *a3 + __n;
    if (!__CFADD__(*a3, __n))
    {
      if (v13 > a2)
      {
        uint64_t v10 = 4294967276;
        goto LABEL_17;
      }
      if (!__dst || !__n) {
        goto LABEL_11;
      }
      if (!__CFADD__(a1, v12))
      {
        memcpy(__dst, (const void *)(a1 + v12), __n);
LABEL_11:
        uint64_t v10 = 0;
        *a3 = v13;
        unsigned int v11 = 10;
        goto LABEL_12;
      }
    }
    uint64_t v10 = 4294967291;
LABEL_17:
    unsigned int v11 = 70;
  }
LABEL_12:
  if (v11 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_ReadFromBuffer", (int)v10);
  }
  return v10;
}

unint64_t Util_KeybagLockStateToEnvVar(unsigned int a1)
{
  unint64_t v1 = 0x2010103020201uLL >> (8 * a1);
  if (a1 >= 7) {
    LOBYTE(v1) = 1;
  }
  return v1 & 3;
}

void Util_SafeDeallocParameters(unsigned int *a1, unsigned int a2)
{
  if (a1)
  {
    uint64_t v3 = a2;
    if (a2)
    {
      unint64_t v4 = a1 + 4;
      uint64_t v5 = a2;
      do
      {
        char v6 = (void *)*((void *)v4 - 1);
        if (v6)
        {
          unint64_t v7 = *v4;
          acm_mem_free_info("<data>", *((const void **)v4 - 1), v7, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 118, "Util_SafeDeallocParameters");
          acm_mem_free_data(v6, v7);
        }
        v4 += 6;
        --v5;
      }
      while (v5);
    }
    acm_mem_free_info("array of ACMParameter", a1, 24 * v3, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 121, "Util_SafeDeallocParameters");
    acm_mem_free(a1, 24 * v3);
  }
}

uint64_t Util_DeallocCredential(_DWORD *a1)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "Util_DeallocCredential");
  }
  if (a1)
  {
    uint64_t v2 = 4294967293;
    unsigned int v3 = 70;
    switch(*a1)
    {
      case 1:
        unint64_t v4 = "ACMCredential - ACMCredentialDataPasscodeValidated";
        rsize_t v5 = 60;
        char v6 = a1;
        unint64_t v7 = 60;
        int v8 = 144;
        goto LABEL_6;
      case 2:
        unint64_t v4 = "ACMCredential - ACMCredentialDataPassphraseEntered";
        rsize_t v5 = 168;
        char v6 = a1;
        unint64_t v7 = 168;
        int v8 = 136;
        goto LABEL_6;
      case 3:
        unint64_t v4 = "ACMCredential - ACMCredentialDataBiometryMatched";
        rsize_t v5 = 337;
        char v6 = a1;
        unint64_t v7 = 337;
        int v8 = 140;
        goto LABEL_6;
      case 4:
      case 5:
      case 6:
      case 8:
      case 0xE:
      case 0x10:
      case 0x13:
      case 0x16:
      case 0x17:
        unint64_t v4 = "ACMCredential";
        rsize_t v5 = 32;
        char v6 = a1;
        unint64_t v7 = 32;
        int v8 = 189;
        goto LABEL_6;
      case 7:
        unint64_t v4 = "ACMCredential - ACMCredentialDataUserOutputDisplayed";
        rsize_t v5 = 88;
        char v6 = a1;
        unint64_t v7 = 88;
        int v8 = 152;
        goto LABEL_6;
      case 9:
        unint64_t v4 = "ACMCredential - ACMCredentialDataContinuityUnlock";
        rsize_t v5 = 56;
        char v6 = a1;
        unint64_t v7 = 56;
        int v8 = 156;
        goto LABEL_6;
      case 0xA:
        unint64_t v4 = "ACMCredential - ACMCredentialDataPasscodeValidated2";
        rsize_t v5 = 84;
        char v6 = a1;
        unint64_t v7 = 84;
        int v8 = 148;
        goto LABEL_6;
      case 0xC:
      case 0xF:
        unint64_t v4 = "ACMCredential - ACMCredentialDataKextDenyList";
        rsize_t v5 = 40;
        char v6 = a1;
        unint64_t v7 = 40;
        int v8 = 161;
        goto LABEL_6;
      case 0xD:
        unint64_t v4 = "ACMCredential - ACMCredentialDataPassphraseExtractable";
        rsize_t v5 = 164;
        char v6 = a1;
        unint64_t v7 = 164;
        int v8 = 132;
        goto LABEL_6;
      case 0x11:
        unint64_t v4 = "ACMCredential - ACMCredentialDataSecureIntent";
        rsize_t v5 = 113;
        char v6 = a1;
        unint64_t v7 = 113;
        int v8 = 165;
        goto LABEL_6;
      case 0x12:
        unint64_t v4 = "ACMCredential - ACMCredentialDataBiometryMatchAttempted";
        rsize_t v5 = 52;
        char v6 = a1;
        unint64_t v7 = 52;
        int v8 = 169;
        goto LABEL_6;
      case 0x14:
        unint64_t v4 = "ACMCredential - ACMCredentialDataAP";
        rsize_t v5 = 64;
        char v6 = a1;
        unint64_t v7 = 64;
        int v8 = 173;
        goto LABEL_6;
      case 0x15:
        unint64_t v4 = "ACMCredential - ACMCredentialDataSignature";
        rsize_t v5 = 164;
        char v6 = a1;
        unint64_t v7 = 164;
        int v8 = 177;
LABEL_6:
        acm_mem_free_info(v4, v6, v7, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v8, "Util_DeallocCredential");
        acm_mem_free(a1, v5);
        uint64_t v2 = 0;
        unsigned int v3 = 10;
        break;
      default:
        break;
    }
  }
  else
  {
    uint64_t v2 = 4294967293;
    unsigned int v3 = 70;
  }
  if (v3 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_DeallocCredential", (int)v2);
  }
  return v2;
}

uint64_t Util_AllocCredential(int a1, void *a2)
{
  if (!a2) {
    return 4294967293;
  }
  uint64_t result = 4294967293;
  switch(a1)
  {
    case 1:
      rsize_t v5 = acm_mem_alloc(0x3CuLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataPasscodeValidated", v5, 60, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 226, "Util_AllocCredential");
      int v6 = 28;
      goto LABEL_4;
    case 2:
      rsize_t v5 = acm_mem_alloc(0xA8uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataPassphraseEntered", v5, 168, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 216, "Util_AllocCredential");
      int v6 = 136;
      goto LABEL_4;
    case 3:
      rsize_t v5 = acm_mem_alloc(0x151uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataBiometryMatched", v5, 337, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 221, "Util_AllocCredential");
      int v6 = 305;
      goto LABEL_4;
    case 4:
    case 5:
    case 6:
    case 8:
    case 14:
    case 16:
    case 19:
    case 22:
    case 23:
      rsize_t v5 = acm_mem_alloc(0x20uLL);
      acm_mem_alloc_info("ACMCredential", v5, 32, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 280, "Util_AllocCredential");
      int v6 = 0;
      goto LABEL_4;
    case 7:
      rsize_t v5 = acm_mem_alloc(0x58uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataUserOutputDisplayed", v5, 88, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 236, "Util_AllocCredential");
      int v6 = 56;
      goto LABEL_4;
    case 9:
      rsize_t v5 = acm_mem_alloc(0x38uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataContinuityUnlock", v5, 56, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 241, "Util_AllocCredential");
      int v6 = 24;
      goto LABEL_4;
    case 10:
      rsize_t v5 = acm_mem_alloc(0x54uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataPasscodeValidated2", v5, 84, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 231, "Util_AllocCredential");
      int v6 = 52;
      goto LABEL_4;
    case 12:
    case 15:
      rsize_t v5 = acm_mem_alloc(0x28uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataKextDenyList", v5, 40, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 247, "Util_AllocCredential");
      int v6 = 8;
      goto LABEL_4;
    case 13:
      rsize_t v5 = acm_mem_alloc(0xA4uLL);
      unint64_t v7 = "ACMCredential - ACMCredentialDataPassphraseExtractable";
      int v8 = v5;
      int v9 = 211;
      goto LABEL_18;
    case 17:
      rsize_t v5 = acm_mem_alloc(0x71uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataSecureIntent", v5, 113, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 252, "Util_AllocCredential");
      int v6 = 81;
      goto LABEL_4;
    case 18:
      rsize_t v5 = acm_mem_alloc(0x34uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataBiometryMatchAttempted", v5, 52, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 257, "Util_AllocCredential");
      int v6 = 20;
      goto LABEL_4;
    case 20:
      rsize_t v5 = acm_mem_alloc(0x40uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataAP", v5, 64, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 262, "Util_AllocCredential");
      int v6 = 32;
      goto LABEL_4;
    case 21:
      rsize_t v5 = acm_mem_alloc(0xA4uLL);
      unint64_t v7 = "ACMCredential - ACMCredentialDataSignature";
      int v8 = v5;
      int v9 = 267;
LABEL_18:
      acm_mem_alloc_info(v7, v8, 164, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v9, "Util_AllocCredential");
      int v6 = 132;
LABEL_4:
      if (v5)
      {
        uint64_t result = 0;
        *rsize_t v5 = a1;
        v5[1] = 1;
        v5[7] = v6;
        v5[3] = -1;
        *a2 = v5;
      }
      else
      {
        uint64_t result = 4294967292;
      }
      break;
    default:
      return result;
  }
  return result;
}

uint64_t Util_AllocRequirement(int a1, uint64_t a2, void *a3)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "Util_AllocRequirement");
  }
  if (a3)
  {
    uint64_t v6 = 4294967293;
    unsigned int v7 = 70;
    switch(a1)
    {
      case 1:
        int v8 = acm_mem_alloc(0x14uLL);
        unsigned int v11 = "ACMRequirement - ACMRequirementDataPasscodeValidated";
        uint64_t v12 = v8;
        int v13 = 338;
        goto LABEL_49;
      case 2:
        int v8 = acm_mem_alloc(0x14uLL);
        unsigned int v11 = "ACMRequirement - ACMRequirementDataPassphraseEntered";
        uint64_t v12 = v8;
        int v13 = 343;
        goto LABEL_49;
      case 3:
        int v8 = acm_mem_alloc(0xACuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataBiometryMatched", v8, 172, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 348, "Util_AllocRequirement");
        int v9 = 156;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 4:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6) {
          goto LABEL_53;
        }
        int v8 = acm_mem_alloc(0x64uLL);
        uint64_t v14 = "ACMRequirement - ACMRequirementDataOr";
        int v15 = v8;
        int v16 = 406;
        goto LABEL_28;
      case 5:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6) {
          goto LABEL_53;
        }
        int v8 = acm_mem_alloc(0x64uLL);
        uint64_t v14 = "ACMRequirement - ACMRequirementDataAnd";
        int v15 = v8;
        int v16 = 398;
LABEL_28:
        acm_mem_alloc_info(v14, v15, 100, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v16, "Util_AllocRequirement");
        int v9 = 84;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 6:
      case 9:
      case 10:
      case 11:
      case 12:
      case 14:
      case 15:
      case 18:
      case 19:
      case 22:
      case 23:
      case 27:
      case 28:
        int v8 = acm_mem_alloc(0x10uLL);
        acm_mem_alloc_info("ACMRequirement", v8, 16, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 333, "Util_AllocRequirement");
        int v9 = 0;
        if (v8) {
          goto LABEL_6;
        }
        goto LABEL_50;
      case 7:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6) {
          goto LABEL_53;
        }
        int v8 = acm_mem_alloc(0x68uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKofN", v8, 104, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 391, "Util_AllocRequirement");
        int v9 = 88;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 8:
        int v8 = acm_mem_alloc(0x410uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataAccessGroups", v8, 1040, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 378, "Util_AllocRequirement");
        int v9 = 1024;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 13:
        int v8 = acm_mem_alloc(0x30uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataUserOutputDisplayed", v8, 48, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 363, "Util_AllocRequirement");
        int v9 = 32;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 16:
      case 17:
        break;
      case 20:
        int v8 = acm_mem_alloc(0x14uLL);
        unsigned int v11 = "ACMRequirement - ACMRequirementDataSecureIntent";
        uint64_t v12 = v8;
        int v13 = 353;
        goto LABEL_49;
      case 21:
        int v8 = acm_mem_alloc(0x14uLL);
        unsigned int v11 = "ACMRequirement - ACMRequirementDataBiometryMatchAttempted";
        uint64_t v12 = v8;
        int v13 = 358;
LABEL_49:
        acm_mem_alloc_info(v11, v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v13, "Util_AllocRequirement");
        int v9 = 4;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 24:
        int v8 = acm_mem_alloc(0x434uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataAP", v8, 1076, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 368, "Util_AllocRequirement");
        int v9 = 1060;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 25:
        int v8 = acm_mem_alloc(0x3BuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKeyRef", v8, 59, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 373, "Util_AllocRequirement");
        int v9 = 43;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 26:
        int v8 = acm_mem_alloc(0x2CuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataRatchet", v8, 44, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 384, "Util_AllocRequirement");
        int v9 = 28;
        if (!v8)
        {
LABEL_50:
          uint64_t v6 = 4294967292;
          goto LABEL_54;
        }
LABEL_6:
        _DWORD *v8 = a1;
        *(void *)(v8 + 1) = 0x100000001;
        v8[3] = v9;
        if ((a1 & 0xFFFFFFFE) == 4)
        {
          v8[4] = a2;
        }
        else if (a1 == 1000)
        {
          v8[13] = a2;
        }
        else if (a1 == 7)
        {
          v8[5] = a2;
        }
        uint64_t v6 = 0;
        *a3 = v8;
        unsigned int v7 = 10;
        break;
      default:
        switch(a1)
        {
          case 1000:
            if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6) {
              goto LABEL_53;
            }
            int v8 = acm_mem_alloc(0x88uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKofNWithAttributes", v8, 136, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 414, "Util_AllocRequirement");
            int v9 = 120;
            if (!v8) {
              goto LABEL_50;
            }
            goto LABEL_6;
          case 1001:
            int v8 = acm_mem_alloc(0xB8uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataBiometryMatchedWithAttributes", v8, 184, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 419, "Util_AllocRequirement");
            int v9 = 168;
            if (!v8) {
              goto LABEL_50;
            }
            goto LABEL_6;
          case 1002:
            int v8 = acm_mem_alloc(0x14uLL);
            unsigned int v11 = "ACMRequirement - ACMRequirementDataPushButtonWithAttributes";
            uint64_t v12 = v8;
            int v13 = 424;
            goto LABEL_49;
          case 1003:
            int v8 = acm_mem_alloc(0x14uLL);
            unsigned int v11 = "ACMRequirement - ACMRequirementDataSecureStateWithAttributes";
            uint64_t v12 = v8;
            int v13 = 429;
            goto LABEL_49;
          case 1004:
            int v8 = acm_mem_alloc(0x20uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataPasscodeValidatedWithAttributes", v8, 32, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 434, "Util_AllocRequirement");
            int v9 = 16;
            if (!v8) {
              goto LABEL_50;
            }
            goto LABEL_6;
          default:
            goto LABEL_17;
        }
    }
  }
  else
  {
LABEL_53:
    uint64_t v6 = 4294967293;
LABEL_54:
    unsigned int v7 = 70;
  }
LABEL_17:
  if (v7 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_AllocRequirement", (int)v6);
  }
  return v6;
}

uint64_t Util_CreateRequirement(int a1, uint64_t a2)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "Util_CreateRequirement");
  }
  uint64_t v5 = 0;
  Util_AllocRequirement(a1, a2, &v5);
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: returning.\n", "ACM", "Util_CreateRequirement");
  }
  return v5;
}

uint64_t Util_DeallocRequirement(int *a1)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "Util_DeallocRequirement");
  }
  if (!a1)
  {
    uint64_t v7 = 4294967293;
    unsigned int v8 = 70;
    goto LABEL_28;
  }
  int v2 = *a1;
  if (*a1 > 6)
  {
    if (v2 == 7)
    {
      if (a1[5])
      {
        unint64_t v6 = 0;
        do
          Util_DeallocRequirement(*(void *)&a1[2 * v6++ + 6]);
        while (v6 < a1[5]);
      }
    }
    else
    {
      if (v2 != 1000) {
        goto LABEL_25;
      }
      if (a1[13])
      {
        unint64_t v4 = 0;
        do
          Util_DeallocRequirement(*(void *)&a1[2 * v4++ + 14]);
        while (v4 < a1[13]);
      }
    }
  }
  else if (v2 == 4)
  {
    if (a1[4])
    {
      unint64_t v5 = 0;
      do
        Util_DeallocRequirement(*(void *)&a1[2 * v5++ + 5]);
      while (v5 < a1[4]);
    }
  }
  else
  {
    if (v2 != 5) {
      goto LABEL_25;
    }
    if (a1[4])
    {
      unint64_t v3 = 0;
      do
        Util_DeallocRequirement(*(void *)&a1[2 * v3++ + 5]);
      while (v3 < a1[4]);
    }
  }
  int v2 = *a1;
LABEL_25:
  uint64_t v7 = 4294967293;
  unsigned int v8 = 70;
  switch(v2)
  {
    case 1:
      int v9 = "ACMRequirement - ACMRequirementDataPasscodeValidated";
      rsize_t v10 = 20;
      unsigned int v11 = a1;
      unint64_t v12 = 20;
      int v13 = 542;
      goto LABEL_27;
    case 2:
      int v9 = "ACMRequirement - ACMRequirementDataPassphraseEntered";
      rsize_t v10 = 20;
      unsigned int v11 = a1;
      unint64_t v12 = 20;
      int v13 = 546;
      goto LABEL_27;
    case 3:
      int v9 = "ACMRequirement - ACMRequirementDataBiometryMatched";
      rsize_t v10 = 172;
      unsigned int v11 = a1;
      unint64_t v12 = 172;
      int v13 = 550;
      goto LABEL_27;
    case 4:
      int v9 = "ACMRequirement - ACMRequirementDataOr";
      rsize_t v10 = 100;
      unsigned int v11 = a1;
      unint64_t v12 = 100;
      int v13 = 595;
      goto LABEL_27;
    case 5:
      int v9 = "ACMRequirement - ACMRequirementDataAnd";
      rsize_t v10 = 100;
      unsigned int v11 = a1;
      unint64_t v12 = 100;
      int v13 = 589;
      goto LABEL_27;
    case 6:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 15:
    case 18:
    case 19:
    case 22:
    case 23:
    case 27:
    case 28:
      int v9 = "ACMRequirement";
      rsize_t v10 = 16;
      unsigned int v11 = a1;
      unint64_t v12 = 16;
      int v13 = 538;
      goto LABEL_27;
    case 7:
      int v9 = "ACMRequirement - ACMRequirementDataKofN";
      rsize_t v10 = 104;
      unsigned int v11 = a1;
      unint64_t v12 = 104;
      int v13 = 584;
      goto LABEL_27;
    case 8:
      int v9 = "ACMRequirement - ACMRequirementDataAccessGroups";
      rsize_t v10 = 1040;
      unsigned int v11 = a1;
      unint64_t v12 = 1040;
      int v13 = 574;
      goto LABEL_27;
    case 13:
      int v9 = "ACMRequirement - ACMRequirementDataUserOutputDisplayed";
      rsize_t v10 = 48;
      unsigned int v11 = a1;
      unint64_t v12 = 48;
      int v13 = 562;
      goto LABEL_27;
    case 16:
    case 17:
      break;
    case 20:
      int v9 = "ACMRequirement - ACMRequirementDataSecureIntent";
      rsize_t v10 = 20;
      unsigned int v11 = a1;
      unint64_t v12 = 20;
      int v13 = 554;
      goto LABEL_27;
    case 21:
      int v9 = "ACMRequirement - ACMRequirementDataBiometryMatchAttempted";
      rsize_t v10 = 20;
      unsigned int v11 = a1;
      unint64_t v12 = 20;
      int v13 = 558;
      goto LABEL_27;
    case 24:
      int v9 = "ACMRequirement - ACMRequirementDataAP";
      rsize_t v10 = 1076;
      unsigned int v11 = a1;
      unint64_t v12 = 1076;
      int v13 = 566;
      goto LABEL_27;
    case 25:
      int v9 = "ACMRequirement - ACMRequirementDataKeyRef";
      rsize_t v10 = 59;
      unsigned int v11 = a1;
      unint64_t v12 = 59;
      int v13 = 570;
      goto LABEL_27;
    case 26:
      int v9 = "ACMRequirement - ACMRequirementDataRatchet";
      rsize_t v10 = 44;
      unsigned int v11 = a1;
      unint64_t v12 = 44;
      int v13 = 579;
LABEL_27:
      acm_mem_free_info(v9, v11, v12, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v13, "Util_DeallocRequirement");
      acm_mem_free(a1, v10);
      uint64_t v7 = 0;
      unsigned int v8 = 10;
      break;
    default:
      switch(v2)
      {
        case 1000:
          int v9 = "ACMRequirement - ACMRequirementDataKofNWithAttributes";
          rsize_t v10 = 136;
          unsigned int v11 = a1;
          unint64_t v12 = 136;
          int v13 = 601;
          goto LABEL_27;
        case 1001:
          int v9 = "ACMRequirement - ACMRequirementDataBiometryMatchedWithAttributes";
          rsize_t v10 = 184;
          unsigned int v11 = a1;
          unint64_t v12 = 184;
          int v13 = 605;
          goto LABEL_27;
        case 1002:
          int v9 = "ACMRequirement - ACMRequirementDataPushButtonWithAttributes";
          rsize_t v10 = 20;
          unsigned int v11 = a1;
          unint64_t v12 = 20;
          int v13 = 609;
          goto LABEL_27;
        case 1003:
          int v9 = "ACMRequirement - ACMRequirementDataSecureStateWithAttributes";
          rsize_t v10 = 20;
          unsigned int v11 = a1;
          unint64_t v12 = 20;
          int v13 = 613;
          goto LABEL_27;
        case 1004:
          int v9 = "ACMRequirement - ACMRequirementDataPasscodeValidatedWithAttributes";
          rsize_t v10 = 32;
          unsigned int v11 = a1;
          unint64_t v12 = 32;
          int v13 = 617;
          goto LABEL_27;
        default:
          goto LABEL_28;
      }
  }
LABEL_28:
  if (v8 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_DeallocRequirement", (int)v7);
  }
  return v7;
}

void Util_hexDumpToStrHelper_cold_1()
{
}

void Util_hexDumpToStrHelper_cold_2()
{
}

uint64_t ACMContextCreate(uint64_t *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    rsize_t v10 = "ACMContextCreate";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v6 = 0;
  uint64_t v2 = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, void, void, void, unsigned char *, uint64_t *))ioKitTransport, (uint64_t)&v6, a1, &_logLevel, 1);
  if (v2)
  {
    updateLogLevelFromKext();
    unsigned int v3 = 70;
  }
  else
  {
    unsigned int v3 = 10;
    if (a1 && _logLevel <= 0x28u)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        uint64_t v4 = *a1;
        if (*a1) {
          LODWORD(v4) = *(_DWORD *)(v4 + 16);
        }
        *(_DWORD *)buf = 136315650;
        unsigned int v8 = "ACMLib";
        __int16 v9 = 2080;
        rsize_t v10 = "ACMContextCreate";
        __int16 v11 = 1024;
        LODWORD(v12) = v4;
        _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: CS[%u] created.\n", buf, 0x1Cu);
      }
      unsigned int v3 = 10;
    }
  }
  if (v3 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    rsize_t v10 = "ACMContextCreate";
    __int16 v11 = 2048;
    uint64_t v12 = (int)v2;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v2;
}

uint64_t ioKitTransport(uint64_t *a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    uint64_t v19 = "ACMLib";
    __int16 v20 = 2080;
    uint64_t v21 = "ioKitTransport";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v18, 0x16u);
  }
  if (a1)
  {
    uint64_t v14 = init();
    unsigned int v15 = 70;
    if (v14)
    {
      uint64_t v16 = v14;
    }
    else
    {
      uint64_t v16 = performCommand(*a1, a2, a3, a4, a5, a6, a7);
      if (v16) {
        unsigned int v15 = 70;
      }
      else {
        unsigned int v15 = 10;
      }
    }
  }
  else
  {
    unsigned int v15 = 70;
    uint64_t v16 = 4294967293;
  }
  if (v15 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315650;
    uint64_t v19 = "ACMLib";
    __int16 v20 = 2080;
    uint64_t v21 = "ioKitTransport";
    __int16 v22 = 2048;
    uint64_t v23 = (int)v16;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v18, 0x20u);
  }
  return v16;
}

_DWORD *ACMContextCreateWithExternalForm(_OWORD *a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    rsize_t v10 = "ACMLib";
    __int16 v11 = 2080;
    uint64_t v12 = "ACMContextCreateWithExternalForm";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v8 = 0;
  uint64_t v4 = LibCall_ACMContextCreateWithExternalForm((uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, uint64_t, void *, uint64_t *))ioKitTransport, (uint64_t)&v8, a1, a2, &_logLevel, 1);
  if (v4)
  {
    if (_logLevel <= 0x28u && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      int v5 = v4[4];
      *(_DWORD *)buf = 136315650;
      rsize_t v10 = "ACMLib";
      __int16 v11 = 2080;
      uint64_t v12 = "ACMContextCreateWithExternalForm";
      __int16 v13 = 1024;
      LODWORD(v14) = v5;
      _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: CS[%u] acquired.\n", buf, 0x1Cu);
    }
    unsigned int v6 = 30;
  }
  else
  {
    updateLogLevelFromKext();
    unsigned int v6 = 70;
  }
  if (v6 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    rsize_t v10 = "ACMLib";
    __int16 v11 = 2080;
    uint64_t v12 = "ACMContextCreateWithExternalForm";
    __int16 v13 = 2048;
    uint64_t v14 = v4;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, -> ctx = %p.\n", buf, 0x20u);
  }
  return v4;
}

uint64_t ACMContextDelete(_DWORD *a1, int a2)
{
  void v16[2] = *MEMORY[0x263EF8340];
  unsigned int v4 = _logLevel;
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    uint64_t v14 = "ACMContextDelete";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
    unsigned int v4 = _logLevel;
  }
  if (a1 && v4 <= 0x28 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v5 = a1[4];
    unsigned int v6 = "deleted";
    *(_DWORD *)buf = 136315906;
    uint64_t v12 = "ACMLib";
    uint64_t v14 = "ACMContextDelete";
    __int16 v13 = 2080;
    if (a2) {
      unsigned int v6 = "destroyed";
    }
    __int16 v15 = 1024;
    LODWORD(v16[0]) = v5;
    WORD2(v16[0]) = 2080;
    *(void *)((char *)v16 + 6) = v6;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: CS[%u] %s.\n", buf, 0x26u);
  }
  rsize_t v10 = a1;
  uint64_t v7 = LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, void, void *, uint64_t, void, void))ioKitTransport, (uint64_t)&v10, a1, a2);
  if (v7) {
    unsigned int v8 = 70;
  }
  else {
    unsigned int v8 = 10;
  }
  if (v8 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    uint64_t v14 = "ACMContextDelete";
    __int16 v15 = 2048;
    v16[0] = (int)v7;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

void ACMContextGetExternalForm(const void *a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    int v5 = "ACMLib";
    __int16 v6 = 2080;
    uint64_t v7 = "ACMContextGetExternalForm";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v4, 0x16u);
  }
  if (!a1 || !a2 || init() || performCommand((uint64_t)a1, 19, 0, a1, 0x10uLL, 0, 0)) {
    (*(void (**)(uint64_t, void, void))(a2 + 16))(a2, 0, 0);
  }
  else {
    (*(void (**)(uint64_t, const void *, uint64_t))(a2 + 16))(a2, a1, 16);
  }
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    int v5 = "ACMLib";
    __int16 v6 = 2080;
    uint64_t v7 = "ACMContextGetExternalForm";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", (uint8_t *)&v4, 0x16u);
  }
}

uint64_t init()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    uint64_t v8 = "ACMLib";
    __int16 v9 = 2080;
    rsize_t v10 = "init";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v7, 0x16u);
  }
  if (_initialized)
  {
    uint64_t v0 = 0;
  }
  else
  {
    mach_port_t v1 = *MEMORY[0x263F0EC90];
    CFDictionaryRef v2 = IOServiceMatching("AppleCredentialManager");
    io_service_t MatchingService = IOServiceGetMatchingService(v1, v2);
    if (!MatchingService)
    {
      unsigned int v5 = 70;
      uint64_t v0 = 4294967291;
      goto LABEL_10;
    }
    io_object_t v4 = MatchingService;
    uint64_t v0 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, (io_connect_t *)&_connect);
    if (v0)
    {
      unsigned int v5 = 70;
      goto LABEL_10;
    }
    IOObjectRelease(v4);
    _initialized = 1;
  }
  unsigned int v5 = 10;
LABEL_10:
  if (v5 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315650;
    uint64_t v8 = "ACMLib";
    __int16 v9 = 2080;
    rsize_t v10 = "init";
    __int16 v11 = 2048;
    uint64_t v12 = (int)v0;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v7, 0x20u);
  }
  return v0;
}

uint64_t performCommand(uint64_t a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    size_t v25 = "ACMLib";
    __int16 v26 = 2080;
    int v27 = "performCommand";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size_t inputStructCnt = 0;
  uint64_t v14 = LibCall_BuildCommand(a2, 0, a3, a4, a5, &inputStructCnt);
  if (v14)
  {
    __int16 v15 = v14;
    if (!a6 && a7)
    {
      uint64_t v18 = 4294967293;
    }
    else
    {
      if (a7) {
        size_t v16 = *a7;
      }
      else {
        size_t v16 = 0;
      }
      size_t v22 = v16;
      uint64_t v17 = IOConnectCallStructMethod(_connect, 0, v14, inputStructCnt, a6, &v22);
      uint64_t v18 = v17;
      if (a1) {
        LODWORD(a1) = *(_DWORD *)(a1 + 16);
      }
      if (v17)
      {
        if (_logLevel <= 0x46u && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316418;
          size_t v25 = "ACMLib";
          __int16 v26 = 2080;
          int v27 = "performCommand";
          __int16 v28 = 1024;
          *(_DWORD *)unint64_t v29 = a2;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          __int16 v30 = 1024;
          int v31 = v18;
          __int16 v32 = 1024;
          int v33 = v18;
          _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: cmd(%u) on CS[%u] -> err 0x%x (%d).\n", buf, 0x2Eu);
        }
      }
      else
      {
        if (_logLevel <= 0x28u && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          size_t v25 = "ACMLib";
          __int16 v26 = 2080;
          int v27 = "performCommand";
          __int16 v28 = 1024;
          *(_DWORD *)unint64_t v29 = a2;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: cmd(%u) on CS[%u] -> ok.\n", buf, 0x22u);
        }
        uint64_t v18 = 0;
        if (a7) {
          *a7 = v22;
        }
      }
    }
    rsize_t v19 = inputStructCnt;
    acm_mem_free_info("<data>", v15, inputStructCnt, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 134, "performCommand");
    acm_mem_free_data(v15, v19);
    if (v18) {
      unsigned int v20 = 70;
    }
    else {
      unsigned int v20 = 10;
    }
  }
  else
  {
    unsigned int v20 = 70;
    uint64_t v18 = 4294967291;
  }
  if (v20 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    size_t v25 = "ACMLib";
    __int16 v26 = 2080;
    int v27 = "performCommand";
    __int16 v28 = 2048;
    *(void *)unint64_t v29 = (int)v18;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v18;
}

uint64_t ACMContextAddCredential(_OWORD *a1, unsigned int *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    __int16 v6 = "ACMLib";
    __int16 v7 = 2080;
    uint64_t v8 = "ACMContextAddCredential";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextAddCredentialWithScope(a1, a2, 1);
}

uint64_t ACMContextAddCredentialWithScope(_OWORD *a1, unsigned int *a2, int a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    unsigned int v20 = "ACMContextAddCredentialWithScope";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size_t size = 0;
  if (a1) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a3 == 2;
  }
  char v7 = !v6;
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293;
  if (a2 && (v7 & 1) == 0)
  {
    uint64_t SerializedAddCredentialSize = init();
    if (SerializedAddCredentialSize
      || (uint64_t SerializedAddCredentialSize = GetSerializedAddCredentialSize((uint64_t)a1, a2, a3, &size),
          SerializedAddCredentialSize))
    {
      uint64_t v9 = SerializedAddCredentialSize;
      unsigned int v8 = 70;
    }
    else
    {
      size_t v11 = size;
      uint64_t v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 325, "ACMContextAddCredentialWithScope");
      if (v12)
      {
        uint64_t v13 = SerializeAddCredential(a1, a2, a3, (uint64_t)v12, &size);
        if (!v13) {
          uint64_t v13 = performCommand((uint64_t)a1, 5, 0, v12, size, 0, 0);
        }
        uint64_t v9 = v13;
        rsize_t v14 = size;
        acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 338, "ACMContextAddCredentialWithScope");
        acm_mem_free_data(v12, v14);
        if (v9) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }
      else
      {
        unsigned int v8 = 70;
        uint64_t v9 = 4294967292;
      }
    }
  }
  if (v8 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    unsigned int v20 = "ACMContextAddCredentialWithScope";
    __int16 v21 = 2048;
    uint64_t v22 = (int)v9;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v9;
}

uint64_t ACMContextRemoveCredentialsByType(_OWORD *a1, int a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    BOOL v6 = "ACMLib";
    __int16 v7 = 2080;
    unsigned int v8 = "ACMContextRemoveCredentialsByType";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextRemoveCredentialsByTypeAndScope(a1, a2, 1);
}

uint64_t ACMContextRemoveCredentialsByTypeAndScope(_OWORD *a1, int a2, int a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    rsize_t v14 = "ACMContextRemoveCredentialsByTypeAndScope";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  if (a1 || a3 == 2)
  {
    uint64_t v6 = init();
    if (v6)
    {
      uint64_t v8 = v6;
      unsigned int v9 = 70;
    }
    else
    {
      __int16 v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 386, "ACMContextRemoveCredentialsByTypeAndScope");
      if (v7)
      {
        if (a1)
        {
          *__int16 v7 = *a1;
        }
        else
        {
          *(void *)__int16 v7 = 0;
          *((void *)v7 + 1) = 0;
        }
        *((_DWORD *)v7 + 4) = a2;
        *((_DWORD *)v7 + 5) = a3;
        uint64_t v8 = performCommand((uint64_t)a1, 9, 0, v7, 0x18uLL, 0, 0);
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 407, "ACMContextRemoveCredentialsByTypeAndScope");
        acm_mem_free_data(v7, 0x18uLL);
        if (v8) {
          unsigned int v9 = 70;
        }
        else {
          unsigned int v9 = 10;
        }
      }
      else
      {
        unsigned int v9 = 70;
        uint64_t v8 = 4294967292;
      }
    }
  }
  else
  {
    unsigned int v9 = 70;
    uint64_t v8 = 4294967293;
  }
  if (v9 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    rsize_t v14 = "ACMContextRemoveCredentialsByTypeAndScope";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v8;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextRemoveCredentialsByValue(uint64_t a1, _DWORD *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    uint64_t v6 = "ACMLib";
    __int16 v7 = 2080;
    uint64_t v8 = "ACMContextRemoveCredentialsByValue";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextRemoveCredentialsByValueAndScope(a1, a2, 1);
}

uint64_t ACMContextRemoveCredentialsByValueAndScope(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    unsigned int v20 = "ACMContextRemoveCredentialsByValueAndScope";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size_t size = 0;
  if (a1) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a3 == 2;
  }
  char v7 = !v6;
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293;
  if (a2 && (v7 & 1) == 0)
  {
    uint64_t SerializedAddCredentialSize = init();
    if (SerializedAddCredentialSize
      || (uint64_t SerializedAddCredentialSize = GetSerializedAddCredentialSize(a1, a2, a3, &size),
          SerializedAddCredentialSize))
    {
      uint64_t v9 = SerializedAddCredentialSize;
      unsigned int v8 = 70;
    }
    else
    {
      size_t v11 = size;
      uint64_t v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 457, "ACMContextRemoveCredentialsByValueAndScope");
      if (v12)
      {
        uint64_t v13 = SerializeRemoveCredential(a1, a2, a3, v12, &size);
        if (!v13) {
          uint64_t v13 = performCommand(a1, 6, 0, v12, size, 0, 0);
        }
        uint64_t v9 = v13;
        rsize_t v14 = size;
        acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 470, "ACMContextRemoveCredentialsByValueAndScope");
        acm_mem_free_data(v12, v14);
        if (v9) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }
      else
      {
        unsigned int v8 = 70;
        uint64_t v9 = 4294967292;
      }
    }
  }
  if (v8 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    unsigned int v20 = "ACMContextRemoveCredentialsByValueAndScope";
    __int16 v21 = 2048;
    uint64_t v22 = (int)v9;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v9;
}

uint64_t ACMContextContainsCredentialType(_OWORD *a1, int a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    BOOL v6 = "ACMLib";
    __int16 v7 = 2080;
    unsigned int v8 = "ACMContextContainsCredentialType";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextContainsCredentialTypeEx(a1, a2, 0);
}

uint64_t ACMContextContainsCredentialTypeEx(_OWORD *a1, int a2, int a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextContainsCredentialTypeEx";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  int v14 = 0;
  size_t v13 = 4;
  if (a1)
  {
    uint64_t v6 = init();
    if (v6)
    {
      uint64_t v11 = v6;
      unsigned int v8 = 70;
    }
    else
    {
      __int16 v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 576, "ACMContextContainsCredentialTypeEx");
      unsigned int v8 = 70;
      if (v7)
      {
        *(_OWORD *)__int16 v7 = *a1;
        v7[4] = a2;
        v7[5] = a3;
        unsigned int v9 = performCommand((uint64_t)a1, 4, 0, v7, 0x18uLL, &v14, &v13);
        if (v14) {
          unsigned int v10 = 0;
        }
        else {
          unsigned int v10 = -7;
        }
        if (v9) {
          uint64_t v11 = v9;
        }
        else {
          uint64_t v11 = v10;
        }
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 590, "ACMContextContainsCredentialTypeEx");
        acm_mem_free_data(v7, 0x18uLL);
        if (v11) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }
      else
      {
        uint64_t v11 = 4294967292;
      }
    }
  }
  else
  {
    unsigned int v8 = 70;
    uint64_t v11 = 4294967293;
  }
  if (v8 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextContainsCredentialTypeEx";
    __int16 v19 = 2048;
    uint64_t v20 = (int)v11;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v11;
}

uint64_t ACMGlobalContextAddCredential(unsigned int *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    unsigned int v10 = "ACMGlobalContextAddCredential";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v6 = 0;
  if (a1)
  {
    uint64_t v2 = ACMContextCreate((uint64_t *)&v6);
    if (!v2) {
      uint64_t v2 = ACMContextAddCredentialWithScope(v6, a1, 2);
    }
    uint64_t v3 = v2;
    if (v6) {
      ACMContextDelete(v6, 1);
    }
    if (v3) {
      unsigned int v4 = 70;
    }
    else {
      unsigned int v4 = 10;
    }
  }
  else
  {
    unsigned int v4 = 70;
    uint64_t v3 = 4294967293;
  }
  if (v4 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    unsigned int v10 = "ACMGlobalContextAddCredential";
    __int16 v11 = 2048;
    uint64_t v12 = (int)v3;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v3;
}

uint64_t ACMGlobalContextRemoveCredentialsByType(int a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    unsigned int v10 = "ACMGlobalContextRemoveCredentialsByType";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v6 = 0;
  uint64_t v2 = ACMContextCreate((uint64_t *)&v6);
  if (!v2) {
    uint64_t v2 = ACMContextRemoveCredentialsByTypeAndScope(v6, a1, 2);
  }
  uint64_t v3 = v2;
  if (v6) {
    ACMContextDelete(v6, 1);
  }
  if (v3) {
    unsigned int v4 = 70;
  }
  else {
    unsigned int v4 = 10;
  }
  if (v4 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    unsigned int v10 = "ACMGlobalContextRemoveCredentialsByType";
    __int16 v11 = 2048;
    uint64_t v12 = (int)v3;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v3;
}

uint64_t ACMContextRemovePassphraseCredentialsByPurposeAndScope(_OWORD *a1, int a2, int a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    int v14 = "ACMContextRemovePassphraseCredentialsByPurposeAndScope";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  if (a1 || a3 == 2)
  {
    uint64_t v6 = init();
    if (v6)
    {
      uint64_t v8 = v6;
      unsigned int v9 = 70;
    }
    else
    {
      __int16 v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 492, "ACMContextRemovePassphraseCredentialsByPurposeAndScope");
      if (v7)
      {
        if (a1)
        {
          *__int16 v7 = *a1;
        }
        else
        {
          *(void *)__int16 v7 = 0;
          *((void *)v7 + 1) = 0;
        }
        *((_DWORD *)v7 + 4) = a2;
        *((_DWORD *)v7 + 5) = a3;
        uint64_t v8 = performCommand((uint64_t)a1, 16, 0, v7, 0x18uLL, 0, 0);
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 513, "ACMContextRemovePassphraseCredentialsByPurposeAndScope");
        acm_mem_free_data(v7, 0x18uLL);
        if (v8) {
          unsigned int v9 = 70;
        }
        else {
          unsigned int v9 = 10;
        }
      }
      else
      {
        unsigned int v9 = 70;
        uint64_t v8 = 4294967292;
      }
    }
  }
  else
  {
    unsigned int v9 = 70;
    uint64_t v8 = 4294967293;
  }
  if (v9 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    int v14 = "ACMContextRemovePassphraseCredentialsByPurposeAndScope";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v8;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextReplacePassphraseCredentialsWithScope(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    uint64_t v20 = "ACMContextReplacePassphraseCredentialsWithScope";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size_t size = 0;
  if (a1) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a3 == 2;
  }
  char v7 = !v6;
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293;
  if (a2 && (v7 & 1) == 0)
  {
    uint64_t SerializedAddCredentialSize = init();
    if (SerializedAddCredentialSize
      || (uint64_t SerializedAddCredentialSize = GetSerializedAddCredentialSize(a1, a2, a3, &size),
          SerializedAddCredentialSize))
    {
      uint64_t v9 = SerializedAddCredentialSize;
      unsigned int v8 = 70;
    }
    else
    {
      size_t v11 = size;
      uint64_t v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 538, "ACMContextReplacePassphraseCredentialsWithScope");
      if (v12)
      {
        uint64_t v13 = SerializeRemoveCredential(a1, a2, a3, v12, &size);
        if (!v13) {
          uint64_t v13 = performCommand(a1, 15, 0, v12, size, 0, 0);
        }
        uint64_t v9 = v13;
        bzero(v12, size);
        rsize_t v14 = size;
        acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 552, "ACMContextReplacePassphraseCredentialsWithScope");
        acm_mem_free_data(v12, v14);
        if (v9) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }
      else
      {
        unsigned int v8 = 70;
        uint64_t v9 = 4294967292;
      }
    }
  }
  if (v8 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    uint64_t v20 = "ACMContextReplacePassphraseCredentialsWithScope";
    __int16 v21 = 2048;
    uint64_t v22 = (int)v9;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v9;
}

uint64_t ACMContextContainsPassphraseCredentialWithPurpose(_OWORD *a1, int a2, int a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextContainsPassphraseCredentialWithPurpose";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  int v14 = 0;
  size_t v13 = 4;
  if (a1)
  {
    uint64_t v6 = init();
    if (v6)
    {
      uint64_t v11 = v6;
      unsigned int v8 = 70;
    }
    else
    {
      char v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 614, "ACMContextContainsPassphraseCredentialWithPurpose");
      unsigned int v8 = 70;
      if (v7)
      {
        *(_OWORD *)char v7 = *a1;
        v7[4] = a2;
        v7[5] = a3;
        unsigned int v9 = performCommand((uint64_t)a1, 13, 0, v7, 0x18uLL, &v14, &v13);
        if (v14) {
          unsigned int v10 = 0;
        }
        else {
          unsigned int v10 = -7;
        }
        if (v9) {
          uint64_t v11 = v9;
        }
        else {
          uint64_t v11 = v10;
        }
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 628, "ACMContextContainsPassphraseCredentialWithPurpose");
        acm_mem_free_data(v7, 0x18uLL);
        if (v11) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }
      else
      {
        uint64_t v11 = 4294967292;
      }
    }
  }
  else
  {
    unsigned int v8 = 70;
    uint64_t v11 = 4294967293;
  }
  if (v8 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextContainsPassphraseCredentialWithPurpose";
    __int16 v19 = 2048;
    uint64_t v20 = (int)v11;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v11;
}

uint64_t ACMContextVerifyPolicy(_OWORD *a1, char *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "ACMLib";
    __int16 v12 = 2080;
    size_t v13 = "ACMContextVerifyPolicy";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  unsigned int v9 = a1;
  uint64_t v6 = LibCall_ACMContextVerifyPolicy_Block((uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v9, a1, a2, a3);
  if (v6) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  if (v7 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = "ACMLib";
    __int16 v12 = 2080;
    size_t v13 = "ACMContextVerifyPolicy";
    __int16 v14 = 2048;
    uint64_t v15 = (int)v6;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v6;
}

uint64_t ACMContextVerifyPolicyWithPreflight(_OWORD *a1, char *__s1, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    size_t v13 = "ACMLib";
    __int16 v14 = 2080;
    uint64_t v15 = "ACMContextVerifyPolicyWithPreflight";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v11 = a1;
  uint64_t v8 = LibCall_ACMContextVerifyPolicyWithPreflight_Block((uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v11, a1, __s1, a3, a4);
  if (v8) {
    unsigned int v9 = 70;
  }
  else {
    unsigned int v9 = 10;
  }
  if (v9 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    size_t v13 = "ACMLib";
    __int16 v14 = 2080;
    uint64_t v15 = "ACMContextVerifyPolicyWithPreflight";
    __int16 v16 = 2048;
    uint64_t v17 = (int)v8;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v8;
}

void ACMContextVerifyPolicyEx(_OWORD *a1, char *__s1, uint64_t a3, _DWORD *a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextVerifyPolicyEx";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  __int16 v14 = a1;
  LibCall_ACMContextVerifyPolicyEx_Block((uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v14, a1, __s1, a3, a4, a5, a6, a7);
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextVerifyPolicyEx";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

void ACMGlobalContextVerifyPolicy(char *a1, uint64_t a2, _DWORD *a3, unsigned int a4, uint64_t a5)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    size_t v13 = "ACMLib";
    __int16 v14 = 2080;
    uint64_t v15 = "ACMGlobalContextVerifyPolicy";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  *(void *)uint64_t v11 = 0;
  uint64_t v10 = ACMContextCreate((uint64_t *)v11);
  if (v10)
  {
    if (a5) {
      (*(void (**)(uint64_t, uint64_t, void, void))(a5 + 16))(a5, v10, 0, 0);
    }
  }
  else
  {
    ACMContextVerifyPolicyEx(*(_OWORD **)v11, a1, a2, a3, a4, 0xFFFFFFFFLL, a5);
  }
  if (*(void *)v11) {
    ACMContextDelete(*(_DWORD **)v11, 1);
  }
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    size_t v13 = "ACMLib";
    __int16 v14 = 2080;
    uint64_t v15 = "ACMGlobalContextVerifyPolicy";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

uint64_t ACMContextVerifyAclConstraint(_OWORD *a1, const void *a2, uint64_t a3, unsigned __int8 a4, _DWORD *a5, unsigned int a6, unsigned int a7, uint64_t a8)
{
  unsigned int v9 = a1;
  return LibCall_ACMContextVerifyAclConstraint((uint64_t)ioKitTransport, (uint64_t)&v9, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t ACMContextVerifyAclConstraintForOperation(_OWORD *a1, const void *a2, uint64_t a3, const void *a4, unsigned int a5, unsigned __int8 a6, _DWORD *a7, unsigned int a8, unsigned int a9, uint64_t a10)
{
  uint64_t v11 = a1;
  return LibCall_ACMContextVerifyAclConstraintForOperation((uint64_t)ioKitTransport, (uint64_t)&v11, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t ACMContextGetTrackingNumber(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 16);
  }
  return result;
}

uint64_t ACMParseAclAndCopyConstraintCharacteristics(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  size_t __n = 4096;
  size_t size = 0;
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v22 = "ACMLib";
    __int16 v23 = 2080;
    uint64_t v24 = "ACMParseAclAndCopyConstraintCharacteristics";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v6 = 4294967293;
  if (!a1 || !a2 || !a3) {
    goto LABEL_28;
  }
  uint64_t SerializedProcessAclSize = init();
  if (SerializedProcessAclSize
    || (uint64_t SerializedProcessAclSize = GetSerializedProcessAclSize(0, (uint64_t)a1, a2, 0, 0, 0, 0, 0, &size),
        SerializedProcessAclSize))
  {
    uint64_t v6 = SerializedProcessAclSize;
LABEL_28:
    (*(void (**)(uint64_t, uint64_t, void, uint64_t))(a3 + 16))(a3, v6, 0, 4096);
    goto LABEL_19;
  }
  size_t v8 = size;
  unsigned int v9 = acm_mem_alloc_data(size);
  acm_mem_alloc_info("<data>", v9, v8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 744, "ACMParseAclAndCopyConstraintCharacteristics");
  if (!v9)
  {
    uint64_t v6 = 4294967292;
    goto LABEL_28;
  }
  uint64_t v10 = SerializeProcessAcl(0, a1, a2, 0, 0, 0, 0, 0, (uint64_t)v9, &size);
  if (v10)
  {
    uint64_t v6 = v10;
    __int16 v12 = 0;
    __int16 v14 = 0;
    size_t v11 = 4096;
    goto LABEL_15;
  }
  size_t v11 = 4096;
  __int16 v12 = acm_mem_alloc_data(0x1000uLL);
  acm_mem_alloc_info("<data>", v12, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 750, "ACMParseAclAndCopyConstraintCharacteristics");
  if (!v12)
  {
    __int16 v14 = 0;
LABEL_31:
    uint64_t v6 = 4294967292;
    goto LABEL_15;
  }
  uint64_t v13 = performCommand(0, 20, 0, v9, size, v12, &__n);
  size_t v11 = __n;
  if (v13)
  {
    uint64_t v6 = v13;
    __int16 v14 = 0;
    goto LABEL_15;
  }
  __int16 v14 = acm_mem_alloc_data(__n);
  acm_mem_alloc_info("<data>", v14, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 756, "ACMParseAclAndCopyConstraintCharacteristics");
  size_t v11 = __n;
  if (!v14) {
    goto LABEL_31;
  }
  memcpy(v14, v12, __n);
  uint64_t v6 = 0;
  size_t v11 = __n;
LABEL_15:
  (*(void (**)(uint64_t, uint64_t, void *, size_t))(a3 + 16))(a3, v6, v14, v11);
  rsize_t v15 = size;
  acm_mem_free_info("<data>", v9, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 767, "ACMParseAclAndCopyConstraintCharacteristics");
  acm_mem_free_data(v9, v15);
  if (v12)
  {
    acm_mem_free_info("<data>", v12, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 770, "ACMParseAclAndCopyConstraintCharacteristics");
    acm_mem_free_data(v12, 0x1000uLL);
  }
  if (v14)
  {
    rsize_t v16 = __n;
    acm_mem_free_info("<data>", v14, __n, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 773, "ACMParseAclAndCopyConstraintCharacteristics");
    acm_mem_free_data(v14, v16);
  }
LABEL_19:
  if (v6) {
    unsigned int v17 = 70;
  }
  else {
    unsigned int v17 = 10;
  }
  if (v17 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v22 = "ACMLib";
    __int16 v23 = 2080;
    uint64_t v24 = "ACMParseAclAndCopyConstraintCharacteristics";
    __int16 v25 = 2048;
    uint64_t v26 = (int)v6;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v6;
}

uint64_t ACMCredentialGetProperty(int *a1, int a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMCredentialGetProperty";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  unsigned int v6 = 70;
  uint64_t v7 = 4294967293;
  if (a1 && a3)
  {
    uint64_t v7 = LibCall_ACMCredentialGetPropertyData(a1, a2, &v10, &v9);
    if (v7)
    {
      unsigned int v6 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, int *, uint64_t))(a3 + 16))(a3, v10, v9);
      unsigned int v6 = 10;
    }
  }
  if (v6 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMCredentialGetProperty";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v7;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

void ACMRequirementGetSubrequirements(int *a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMRequirementGetSubrequirements";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v8, 0x16u);
  }
  if (a1 && a2)
  {
    int v4 = *a1;
    if (*a1 == 4)
    {
      if (a1[4])
      {
        unint64_t v6 = 0;
        do
          (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)&a1[2 * v6++ + 5]);
        while (v6 < a1[4]);
      }
    }
    else if (v4 == 5)
    {
      if (a1[4])
      {
        unint64_t v7 = 0;
        do
          (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)&a1[2 * v7++ + 5]);
        while (v7 < a1[4]);
      }
    }
    else if (v4 == 7 && a1[5])
    {
      unint64_t v5 = 0;
      do
        (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)&a1[2 * v5++ + 6]);
      while (v5 < a1[5]);
    }
  }
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMRequirementGetSubrequirements";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", (uint8_t *)&v8, 0x16u);
  }
}

uint64_t ACMRequirementGetProperty(int *a1, int a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMRequirementGetProperty";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  unint64_t v9 = 0;
  __int16 v10 = 0;
  unsigned int v6 = 70;
  uint64_t v7 = 4294967293;
  if (a1 && a3)
  {
    uint64_t v7 = LibCall_ACMRequirementGetPropertyData(a1, a2, &v10, &v9);
    if (v7)
    {
      unsigned int v6 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, int *, unint64_t))(a3 + 16))(a3, v10, v9);
      unsigned int v6 = 10;
    }
  }
  if (v6 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMRequirementGetProperty";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v7;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

uint64_t ACMRequirementGetProperties(int *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    unint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMRequirementGetProperties";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v4 = 4294967293;
  unsigned int v5 = 70;
  if (a1 && a2)
  {
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 1, a1, 4);
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 2, a1 + 1, 4);
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 3, a1 + 2, 4);
    uint64_t v4 = 0;
    int v6 = *a1;
    unsigned int v5 = 10;
    switch(*a1)
    {
      case 1:
        goto LABEL_10;
      case 2:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 200, a1 + 4, 4);
        goto LABEL_13;
      case 3:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 100, a1 + 4, 4);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 300, a1 + 5, 8);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 302, a1 + 9, 8);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 301, a1 + 13, 8);
        goto LABEL_13;
      case 4:
      case 5:
      case 6:
        break;
      case 7:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 700, a1 + 4, 4);
        goto LABEL_13;
      default:
        if (v6 != 20 && v6 != 21) {
          break;
        }
LABEL_10:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 100, a1 + 4, 4);
LABEL_13:
        uint64_t v4 = 0;
        unsigned int v5 = 10;
        break;
    }
  }
  if (v5 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    unint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMRequirementGetProperties";
    __int16 v12 = 2048;
    uint64_t v13 = (int)v4;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v8, 0x20u);
  }
  return v4;
}

void ACMGetAclAuthMethod(__n128 *a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v6 = "ACMLib";
    __int16 v7 = 2080;
    int v8 = "ACMGetAclAuthMethod";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v4 = a1;
  LibCall_ACMGetAclAuthMethod_Block((uint64_t)ioKitTransport, (uint64_t)&v4, a1, a2);
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v6 = "ACMLib";
    __int16 v7 = 2080;
    int v8 = "ACMGetAclAuthMethod";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

uint64_t ACMSetEnvironmentVariable(int a1, const void *a2, size_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    size_t v11 = "ACMLib";
    __int16 v12 = 2080;
    uint64_t v13 = "ACMSetEnvironmentVariable";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v9 = 0;
  uint64_t v6 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))ioKitTransport, (uint64_t)&v9, a1, 0, 0, 0, a2, a3);
  if (v6) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  if (v7 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    size_t v11 = "ACMLib";
    __int16 v12 = 2080;
    uint64_t v13 = "ACMSetEnvironmentVariable";
    __int16 v14 = 2048;
    uint64_t v15 = (int)v6;
    __int16 v16 = 1024;
    int v17 = a1;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, var=%u.\n", buf, 0x26u);
  }
  return v6;
}

uint64_t ACMSetEnvironmentVariableWithAccessPolicy(int a1, _OWORD *a2, _OWORD *a3, uint64_t a4, const void *a5, size_t a6)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v17 = "ACMLib";
    __int16 v18 = 2080;
    uint64_t v19 = "ACMSetEnvironmentVariableWithAccessPolicy";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v15 = 0;
  uint64_t v12 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))ioKitTransport, (uint64_t)&v15, a1, a2, a3, a4, a5, a6);
  if (v12) {
    unsigned int v13 = 70;
  }
  else {
    unsigned int v13 = 10;
  }
  if (v13 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    int v17 = "ACMLib";
    __int16 v18 = 2080;
    uint64_t v19 = "ACMSetEnvironmentVariableWithAccessPolicy";
    __int16 v20 = 2048;
    uint64_t v21 = (int)v12;
    __int16 v22 = 1024;
    int v23 = a1;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, var=%u.\n", buf, 0x26u);
  }
  return v12;
}

uint64_t ACMGetEnvironmentVariable(int a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMGetEnvironmentVariable";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v7 = 0;
  uint64_t v4 = LibCall_ACMGetEnvironmentVariable_Block((uint64_t (*)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t))ioKitTransport, (uint64_t)&v7, a1, a2);
  if (v4) {
    unsigned int v5 = 70;
  }
  else {
    unsigned int v5 = 10;
  }
  if (v5 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMGetEnvironmentVariable";
    __int16 v12 = 2048;
    uint64_t v13 = (int)v4;
    __int16 v14 = 1024;
    int v15 = a1;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, var=%u.\n", buf, 0x26u);
  }
  return v4;
}

uint64_t ACMKernelControl(int a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v6 = "ACMLib";
    __int16 v7 = 2080;
    int v8 = "ACMKernelControl";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v2 = LibCall_ACMKernelControl_Block((uint64_t)ioKitTransport);
  if (v2) {
    unsigned int v3 = 70;
  }
  else {
    unsigned int v3 = 10;
  }
  if (v3 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v6 = "ACMLib";
    __int16 v7 = 2080;
    int v8 = "ACMKernelControl";
    __int16 v9 = 2048;
    uint64_t v10 = (int)v2;
    __int16 v11 = 1024;
    int v12 = a1;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, code=%u.\n", buf, 0x26u);
  }
  return v2;
}

uint64_t ACMSEPControl(const void *a1, size_t a2, uint64_t a3)
{
  uint64_t v4 = 0;
  return LibCall_ACMSEPControl_Block((uint64_t (*)(uint64_t, uint64_t, void, char *, uint64_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v4, a1, a2, 0, 0, 0, a3);
}

uint64_t ACMSEPControlEx(uint64_t a1, _DWORD *a2, unsigned int a3, const void *a4, size_t a5, uint64_t a6)
{
  uint64_t v7 = 0;
  return LibCall_ACMSEPControl_Block((uint64_t (*)(uint64_t, uint64_t, void, char *, uint64_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v7, a4, a5, a1, a2, a3, a6);
}

void ACMGlobalContextCredentialGetProperty(int a1, int a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v8 = "ACMLib";
    __int16 v9 = 2080;
    uint64_t v10 = "ACMGlobalContextCredentialGetProperty";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v6 = 0;
  LibCall_ACMGlobalContextCredentialGetProperty_Block((uint64_t)ioKitTransport, (uint64_t)&v6, a1, a2, a3);
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v8 = "ACMLib";
    __int16 v9 = 2080;
    uint64_t v10 = "ACMGlobalContextCredentialGetProperty";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

void ACMContextCredentialGetProperty(__n128 *a1, unsigned __int32 a2, unsigned __int32 a3, uint64_t a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "ACMLib";
    __int16 v17 = 2080;
    __int16 v18 = "ACMContextCredentialGetProperty";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v10 = 256;
  if (a4)
  {
    __int16 v9 = a1;
    uint64_t v8 = LibCall_ACMContextCredentialGetProperty((uint64_t (*)(uint64_t, uint64_t, void, __n128 *, uint64_t, uint64_t, uint64_t, __n128))ioKitTransport, (uint64_t)&v9, a1, a2, a3, (uint64_t)buf, (uint64_t)&v10);
    (*(void (**)(uint64_t, uint64_t, uint8_t *, uint64_t))(a4 + 16))(a4, v8, buf, v10);
  }
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v11 = 136315394;
    int v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMContextCredentialGetProperty";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", v11, 0x16u);
  }
}

uint64_t ACMContextSetData(_OWORD *a1, int a2, const void *a3, size_t a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    int v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMContextSetData";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v8 = ACMContextSetDataEx(a1, a2, 0, 0, a3, a4);
  if (v8) {
    unsigned int v9 = 70;
  }
  else {
    unsigned int v9 = 10;
  }
  if (v9 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    int v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMContextSetData";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v8;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextSetDataEx(_OWORD *a1, int a2, _DWORD *a3, unsigned int a4, const void *a5, size_t a6)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "ACMLib";
    __int16 v18 = 2080;
    uint64_t v19 = "ACMContextSetDataEx";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  __int16 v15 = a1;
  uint64_t v12 = LibCall_ACMContextSetData((uint64_t (*)(uint64_t, uint64_t, void, void *, size_t, void, void))ioKitTransport, (uint64_t)&v15, a1, a2, a3, a4, a5, a6);
  if (v12) {
    unsigned int v13 = 70;
  }
  else {
    unsigned int v13 = 10;
  }
  if (v13 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v17 = "ACMLib";
    __int16 v18 = 2080;
    uint64_t v19 = "ACMContextSetDataEx";
    __int16 v20 = 2048;
    uint64_t v21 = (int)v12;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v12;
}

uint64_t ACMContextGetData(_OWORD *a1, int a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    uint64_t v10 = "ACMLib";
    __int16 v11 = 2080;
    uint64_t v12 = "ACMContextGetData";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v9, 0x16u);
  }
  uint64_t Data = ACMContextGetDataEx(a1, a2, 0, 0, a3);
  if (Data) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  if (v7 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    uint64_t v10 = "ACMLib";
    __int16 v11 = 2080;
    uint64_t v12 = "ACMContextGetData";
    __int16 v13 = 2048;
    uint64_t v14 = (int)Data;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v9, 0x20u);
  }
  return Data;
}

uint64_t ACMContextGetDataEx(_OWORD *a1, int a2, _DWORD *a3, unsigned int a4, uint64_t a5)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int size_4 = 136315394;
    uint64_t v24 = "ACMLib";
    __int16 v25 = 2080;
    uint64_t v26 = "ACMContextGetDataEx";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&size_4, 0x16u);
  }
  unsigned int size = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 4;
  uint64_t v19 = a1;
  uint64_t v10 = LibCall_ACMContextGetData((uint64_t (*)(uint64_t, uint64_t, void, void *, size_t, uint64_t, uint64_t))ioKitTransport, (uint64_t)&v19, a1, a2, 1, a3, a4, (uint64_t)&size, (uint64_t)&v21);
  if (!v10)
  {
    uint64_t v11 = size;
    if (size)
    {
      uint64_t v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 1199, "ACMContextGetDataEx");
      if (!v12)
      {
        unsigned int v16 = 70;
        uint64_t v14 = 4294967292;
        goto LABEL_15;
      }
      uint64_t v20 = size;
      __int16 v18 = a1;
      uint64_t v13 = LibCall_ACMContextGetData((uint64_t (*)(uint64_t, uint64_t, void, void *, size_t, uint64_t, uint64_t))ioKitTransport, (uint64_t)&v18, a1, a2, 0, a3, a4, (uint64_t)v12, (uint64_t)&v20);
      uint64_t v14 = v13;
      if (a5 && !v13) {
        (*(void (**)(uint64_t, void *, uint64_t))(a5 + 16))(a5, v12, v20);
      }
      rsize_t v15 = size;
      acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 1213, "ACMContextGetDataEx");
      acm_mem_free_data(v12, v15);
      if (v14) {
        goto LABEL_11;
      }
    }
    else if (a5)
    {
      (*(void (**)(uint64_t, void, void))(a5 + 16))(a5, 0, 0);
    }
    uint64_t v14 = 0;
    unsigned int v16 = 10;
    goto LABEL_15;
  }
  uint64_t v14 = v10;
LABEL_11:
  unsigned int v16 = 70;
LABEL_15:
  if (v16 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int size_4 = 136315650;
    uint64_t v24 = "ACMLib";
    __int16 v25 = 2080;
    uint64_t v26 = "ACMContextGetDataEx";
    __int16 v27 = 2048;
    uint64_t v28 = (int)v14;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&size_4, 0x20u);
  }
  return v14;
}

uint64_t ACMContextGetDataProperty(_OWORD *a1, unsigned __int16 a2, unsigned __int16 a3, uint64_t a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    uint64_t v14 = "ACMContextGetDataProperty";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  uint64_t Data = ACMContextGetData(a1, a2 | (a3 << 16), a4);
  if (Data) {
    unsigned int v9 = 70;
  }
  else {
    unsigned int v9 = 10;
  }
  if (v9 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    uint64_t v14 = "ACMContextGetDataProperty";
    __int16 v15 = 2048;
    uint64_t v16 = (int)Data;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return Data;
}

uint64_t ACMContextGetInfo(long long *a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v11 = "ACMLib";
    __int16 v12 = 2080;
    __int16 v13 = "ACMContextGetInfo";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  unsigned int v9 = a1;
  uint64_t v6 = LibCall_ACMContextGetInfo((uint64_t (*)(uint64_t, uint64_t, void, int *, uint64_t, _OWORD *, unint64_t *))ioKitTransport, (uint64_t)&v9, a1, a2, a3);
  if (v6) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  if (v7 >= _logLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    int v11 = "ACMLib";
    __int16 v12 = 2080;
    __int16 v13 = "ACMContextGetInfo";
    __int16 v14 = 2048;
    uint64_t v15 = (int)v6;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v6;
}

uint64_t ACMPing()
{
  uint64_t v1 = 0;
  return LibCall_ACMPing((uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void))ioKitTransport, (uint64_t)&v1, 29);
}

void updateLogLevelFromKext()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (_logLevel <= 0xAu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v5 = "ACMLib";
    __int16 v6 = 2080;
    unsigned int v7 = "updateLogLevelFromKext";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  if (IOConnectCallScalarMethod(_connect, 2u, 0, 0, &output, &outputCnt)) {
    goto LABEL_8;
  }
  unsigned __int8 v0 = output;
  unsigned int v1 = output;
  _logLevel = output;
  if (output <= 0x1EuLL && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    unsigned int v5 = "ACMLib";
    __int16 v6 = 2080;
    unsigned int v7 = "updateLogLevelFromKext";
    __int16 v8 = 1024;
    int v9 = v0;
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: log level set to %d.\n", buf, 0x1Cu);
LABEL_8:
    unsigned int v1 = _logLevel;
  }
  if (v1 <= 0xA && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v5 = "ACMLib";
    __int16 v6 = 2080;
    unsigned int v7 = "updateLogLevelFromKext";
    _os_log_impl(&dword_259DFE000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

unsigned char *LibCall_BuildCommand(char a1, char a2, char a3, const void *a4, size_t a5, void *a6)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_BuildCommand");
  }
  __int16 v12 = 0;
  if (a5) {
    BOOL v13 = a4 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (!v13 && a6)
  {
    if (a5 >= 0xFFFFFFFFFFFFFFF8)
    {
      __int16 v12 = 0;
    }
    else
    {
      __int16 v12 = acm_mem_alloc_data(a5 + 8);
      acm_mem_alloc_info("<data>", v12, a5 + 8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 22, "LibCall_BuildCommand");
      if (v12)
      {
        *a6 = a5 + 8;
        *(_DWORD *)__int16 v12 = 1396920900;
        void v12[4] = a1;
        v12[5] = a2;
        v12[6] = a3;
        if (a5) {
          memcpy(v12 + 8, a4, a5);
        }
      }
    }
  }
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: returning.\n", "ACM", "LibCall_BuildCommand");
  }
  return v12;
}

uint64_t LibCall_ACMContextCreate(uint64_t (*a1)(uint64_t, uint64_t, void, void, void, unsigned char *, uint64_t *), uint64_t a2, void *a3, unsigned char *a4, int a5)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCreate");
  }
  unsigned int v10 = 70;
  uint64_t v11 = 4294967293;
  if (!a1 || !a3) {
    goto LABEL_25;
  }
  __int16 v12 = acm_mem_alloc(0x14uLL);
  acm_mem_alloc_info("ACMHandleWithPayload", v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 50, "LibCall_ACMContextCreate");
  if (!v12)
  {
    unsigned int v10 = 70;
    uint64_t v11 = 4294967292;
    goto LABEL_25;
  }
  memset(v19, 0, sizeof(v19));
  if (a5)
  {
    uint64_t v18 = 21;
    uint64_t v13 = a1(a2, 36, 0, 0, 0, v19, &v18);
    if (!v13)
    {
      if (v18 != 21)
      {
        uint64_t v11 = 4294967291;
        goto LABEL_23;
      }
      uint64_t v11 = 0;
      goto LABEL_20;
    }
    uint64_t v11 = v13;
    if (v13 != -3)
    {
LABEL_23:
      acm_mem_free_info("ACMHandleWithPayload", v12, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 89, "LibCall_ACMContextCreate");
      acm_mem_free(v12, 0x14uLL);
      unsigned int v10 = 70;
      goto LABEL_25;
    }
  }
  uint64_t v18 = 17;
  unsigned int v14 = a1(a2, 1, 0, 0, 0, v19, &v18);
  if (v18 == 17) {
    unsigned int v15 = 0;
  }
  else {
    unsigned int v15 = -5;
  }
  if (v14) {
    uint64_t v11 = v14;
  }
  else {
    uint64_t v11 = v15;
  }
  if (!v14 && v18 == 17)
  {
LABEL_20:
    int v16 = *(_DWORD *)&v19[17];
    *(_OWORD *)__int16 v12 = *(_OWORD *)v19;
    void v12[4] = v16;
    *a3 = v12;
    if (a4) {
      *a4 = v19[16];
    }
  }
  if (v11) {
    goto LABEL_23;
  }
  unsigned int v10 = 10;
LABEL_25:
  if (v10 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCreate", (int)v11);
  }
  return v11;
}

_DWORD *LibCall_ACMContextCreateWithExternalForm(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, uint64_t, void *, uint64_t *), uint64_t a2, _OWORD *a3, uint64_t a4, unsigned char *a5, int a6)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCreateWithExternalForm");
  }
  __int16 v12 = 0;
  unsigned int v13 = 70;
  int v14 = -3;
  if (a1 && a3 && a4 == 16)
  {
    memset(v21, 0, 9);
    if (a6)
    {
      uint64_t v20 = 9;
      int v15 = a1(a2, 37, 0, a3, 16, v21, &v20);
      if (!v15)
      {
        if (v20 == 9)
        {
          int v14 = 0;
          goto LABEL_19;
        }
        int v14 = -5;
        goto LABEL_28;
      }
      int v14 = v15;
      if (v15 != -3) {
        goto LABEL_28;
      }
    }
    uint64_t v20 = 5;
    int v16 = a1(a2, 18, 0, a3, 16, v21, &v20);
    if (v20 == 5) {
      int v17 = 0;
    }
    else {
      int v17 = -5;
    }
    if (v16) {
      int v14 = v16;
    }
    else {
      int v14 = v17;
    }
    if (!v16 && v20 == 5)
    {
LABEL_19:
      if (LODWORD(v21[0]))
      {
        __int16 v12 = acm_mem_alloc(0x14uLL);
        acm_mem_alloc_info("ACMHandleWithPayload", v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 128, "LibCall_ACMContextCreateWithExternalForm");
        if (!v12)
        {
          unsigned int v13 = 70;
          int v14 = -4;
          goto LABEL_31;
        }
        int v18 = *(_DWORD *)((char *)v21 + 5);
        *(_OWORD *)__int16 v12 = *a3;
        void v12[4] = v18;
        if (a5) {
          *a5 = BYTE4(v21[0]);
        }
        if (v14)
        {
          acm_mem_free_info("ACMHandleWithPayload", v12, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 147, "LibCall_ACMContextCreateWithExternalForm");
          acm_mem_free(v12, 0x14uLL);
LABEL_29:
          unsigned int v13 = 70;
          goto LABEL_31;
        }
      }
      else
      {
        __int16 v12 = 0;
      }
      goto LABEL_30;
    }
LABEL_28:
    __int16 v12 = 0;
    if (v14) {
      goto LABEL_29;
    }
LABEL_30:
    int v14 = 0;
    unsigned int v13 = 10;
  }
LABEL_31:
  if (v13 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCreateWithExternalForm", v14);
  }
  return v12;
}

uint64_t LibCall_ACMContextDelete(void (*a1)(uint64_t, uint64_t, void, void *, uint64_t, void, void), uint64_t a2, void *a3, int a4)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextDelete");
  }
  if (a1 && a3)
  {
    if (a4) {
      a1(a2, 2, 0, a3, 16, 0, 0);
    }
    goto LABEL_7;
  }
  if (a3)
  {
LABEL_7:
    acm_mem_free_info("ACMHandleWithPayload", a3, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 172, "LibCall_ACMContextDelete");
    acm_mem_free(a3, 0x14uLL);
    uint64_t v8 = 0;
    unsigned int v9 = 10;
    goto LABEL_8;
  }
  unsigned int v9 = 70;
  uint64_t v8 = 4294967293;
LABEL_8:
  if (v9 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextDelete", (int)v8);
  }
  return v8;
}

uint64_t LibCall_ACMContexAddCredentialWithScope(uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, void, void), uint64_t a2, _OWORD *a3, unsigned int *a4, int a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContexAddCredentialWithScope");
  }
  size_t size = 0;
  if (a3) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = a5 == 2;
  }
  char v11 = !v10;
  unsigned int v12 = 70;
  uint64_t v13 = 4294967293;
  if (a4 && (v11 & 1) == 0)
  {
    uint64_t SerializedAddCredentialSize = GetSerializedAddCredentialSize((uint64_t)a3, a4, a5, &size);
    if (SerializedAddCredentialSize)
    {
      uint64_t v13 = SerializedAddCredentialSize;
      unsigned int v12 = 70;
    }
    else
    {
      size_t v15 = size;
      int v16 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v16, v15, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 192, "LibCall_ACMContexAddCredentialWithScope");
      if (v16)
      {
        uint64_t v17 = SerializeAddCredential(a3, a4, a5, (uint64_t)v16, &size);
        if (!v17) {
          uint64_t v17 = a1(a2, 5, 0, v16, size, 0, 0);
        }
        uint64_t v13 = v17;
        rsize_t v18 = size;
        acm_mem_free_info("<data>", v16, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 203, "LibCall_ACMContexAddCredentialWithScope");
        acm_mem_free_data(v16, v18);
        if (v13) {
          unsigned int v12 = 70;
        }
        else {
          unsigned int v12 = 10;
        }
      }
      else
      {
        unsigned int v12 = 70;
        uint64_t v13 = 4294967292;
      }
    }
  }
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContexAddCredentialWithScope", (int)v13);
  }
  return v13;
}

uint64_t LibCall_ACMContexRemoveCredentialsByTypeAndScope(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, uint64_t, void, void), uint64_t a2, _OWORD *a3, int a4, int a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
  }
  if (a3 || a5 == 2)
  {
    BOOL v10 = acm_mem_alloc_data(0x18uLL);
    acm_mem_alloc_info("<data>", v10, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 217, "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
    if (v10)
    {
      if (a3)
      {
        *BOOL v10 = *a3;
      }
      else
      {
        *(void *)BOOL v10 = 0;
        *((void *)v10 + 1) = 0;
      }
      *((_DWORD *)v10 + 4) = a4;
      *((_DWORD *)v10 + 5) = a5;
      uint64_t v11 = a1(a2, 9, 0, v10, 24, 0, 0);
      acm_mem_free_info("<data>", v10, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 233, "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
      acm_mem_free_data(v10, 0x18uLL);
      if (v11) {
        unsigned int v12 = 70;
      }
      else {
        unsigned int v12 = 10;
      }
    }
    else
    {
      unsigned int v12 = 70;
      uint64_t v11 = 4294967292;
    }
  }
  else
  {
    unsigned int v12 = 70;
    uint64_t v11 = 4294967293;
  }
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContexRemoveCredentialsByTypeAndScope", (int)v11);
  }
  return v11;
}

uint64_t LibCall_ACMContextRemoveCredentialsByValueAndScope(uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, void, void), uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextRemoveCredentialsByValueAndScope");
  }
  size_t size = 0;
  if (a3) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = a5 == 2;
  }
  char v11 = !v10;
  unsigned int v12 = 70;
  uint64_t v13 = 4294967293;
  if (a4 && (v11 & 1) == 0)
  {
    uint64_t SerializedAddCredentialSize = GetSerializedAddCredentialSize(a3, a4, a5, &size);
    if (SerializedAddCredentialSize)
    {
      uint64_t v13 = SerializedAddCredentialSize;
      unsigned int v12 = 70;
    }
    else
    {
      size_t v15 = size;
      int v16 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v16, v15, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 251, "LibCall_ACMContextRemoveCredentialsByValueAndScope");
      if (v16)
      {
        uint64_t v17 = SerializeRemoveCredential(a3, a4, a5, v16, &size);
        if (!v17) {
          uint64_t v17 = a1(a2, 6, 0, v16, size, 0, 0);
        }
        uint64_t v13 = v17;
        rsize_t v18 = size;
        acm_mem_free_info("<data>", v16, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 264, "LibCall_ACMContextRemoveCredentialsByValueAndScope");
        acm_mem_free_data(v16, v18);
        if (v13) {
          unsigned int v12 = 70;
        }
        else {
          unsigned int v12 = 10;
        }
      }
      else
      {
        unsigned int v12 = 70;
        uint64_t v13 = 4294967292;
      }
    }
  }
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextRemoveCredentialsByValueAndScope", (int)v13);
  }
  return v13;
}

uint64_t LibCall_ACMContextVerifyPolicyAndCopyRequirementEx(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, BOOL *a9, void *a10)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
  }
  size_t v32 = 0;
  size_t size = 0;
  __int16 v30 = 0;
  unint64_t v31 = 4096;
  unsigned int v18 = 70;
  uint64_t v19 = 4294967293;
  size_t v29 = 0;
  if (a1 && a3 && __s1 && a9)
  {
    if ((a6 != 0) != (a7 != 0))
    {
      unsigned int v18 = 70;
      uint64_t v19 = 4294967293;
    }
    else
    {
      uint64_t SerializedVerifyPolicySize = GetSerializedVerifyPolicySize((uint64_t)a3, __s1, a5, a8, a6, a7, &size);
      if (SerializedVerifyPolicySize)
      {
        uint64_t v19 = SerializedVerifyPolicySize;
        unsigned int v18 = 70;
      }
      else
      {
        size_t v21 = size;
        uint64_t v22 = acm_mem_alloc_data(size);
        acm_mem_alloc_info("<data>", v22, v21, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 293, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
        if (v22)
        {
          size_t v32 = size;
          uint64_t v23 = SerializeVerifyPolicy(a3, __s1, a5, a8, a6, a7, v22, &v32);
          if (v23)
          {
            uint64_t v19 = v23;
            uint64_t v24 = 0;
          }
          else
          {
            uint64_t v24 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
            acm_mem_alloc_info("<data>", v24, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 300, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
            if (v24)
            {
              uint64_t v25 = a1(a2, 3, 0, v22, v32, v24, &v31);
              if (v25)
              {
                uint64_t v19 = v25;
              }
              else
              {
                unint64_t v26 = v31 - 4;
                if (v31 < 4)
                {
                  uint64_t v19 = 4294967291;
                }
                else
                {
                  *a9 = *v24 != 0;
                  if (a10)
                  {
                    uint64_t v19 = DeserializeRequirement(v24 + 1, v26, &v30, &v29);
                    if (!v19) {
                      *a10 = v30;
                    }
                  }
                  else
                  {
                    uint64_t v19 = 0;
                  }
                }
              }
            }
            else
            {
              uint64_t v19 = 4294967292;
            }
          }
          rsize_t v27 = size;
          acm_mem_free_info("<data>", v22, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 324, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
          acm_mem_free_data(v22, v27);
          if (v24)
          {
            acm_mem_free_info("<data>", v24, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 327, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
            acm_mem_free_data(v24, 0x1000uLL);
          }
          if (v19) {
            unsigned int v18 = 70;
          }
          else {
            unsigned int v18 = 10;
          }
        }
        else
        {
          unsigned int v18 = 70;
          uint64_t v19 = 4294967292;
        }
      }
    }
  }
  if (v18 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx", (int)v19);
  }
  return v19;
}

uint64_t LibCall_ACMRequirementDelete(uint64_t a1, int *a2)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMRequirementDelete");
  }
  unsigned int v4 = 70;
  uint64_t v5 = 4294967293;
  if (a1 && a2)
  {
    uint64_t v5 = Util_DeallocRequirement(a2);
    if (v5) {
      unsigned int v4 = 70;
    }
    else {
      unsigned int v4 = 10;
    }
  }
  if (v4 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMRequirementDelete", (int)v5);
  }
  return v5;
}

uint64_t LibCall_ACMKernelControl(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, uint64_t, uint64_t), uint64_t a2, int a3, const void *a4, size_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13 = a1;
  v20[1] = *MEMORY[0x263EF8340];
  if (gACMLoggingLevel <= 0xAu) {
    a1 = (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, uint64_t, uint64_t))printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernelControl");
  }
  if (!v13) {
    goto LABEL_16;
  }
  BOOL v14 = a5 != 0;
  if (a4) {
    BOOL v14 = a5 - 4097 < 0xFFFFFFFFFFFFF000;
  }
  if (v14)
  {
LABEL_16:
    unsigned int v18 = 70;
    uint64_t v17 = 4294967293;
  }
  else
  {
    v20[0] = v20;
    MEMORY[0x270FA5388](a1);
    size_t v15 = (_DWORD *)((char *)v20 - ((a5 + 19) & 0xFFFFFFFFFFFFFFF0));
    *size_t v15 = a3;
    int v16 = v15 + 1;
    if (a5)
    {
      memcpy(v15 + 1, a4, a5);
      int v16 = (_DWORD *)((char *)v16 + a5);
    }
    if (v16 != (_DWORD *)((char *)v15 + a5 + 4)) {
      LibCall_ACMKernelControl_cold_1();
    }
    uint64_t v17 = v13(a2, 26, 0, (char *)v20 - ((a5 + 19) & 0xFFFFFFFFFFFFFFF0), a5 + 4, a6, a7);
    if (v17) {
      unsigned int v18 = 70;
    }
    else {
      unsigned int v18 = 10;
    }
  }
  if (v18 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernelControl", (int)v17);
  }
  return v17;
}

_DWORD *LibCall_ACMCredentialDelete(_DWORD *a1)
{
  if (a1) {
    return (_DWORD *)Util_DeallocCredential(a1);
  }
  return a1;
}

unsigned int *LibCall_ACMCredentialGetType(unsigned int *result)
{
  if (result) {
    return (unsigned int *)*result;
  }
  return result;
}

uint64_t LibCall_ACMCredentialSetProperty(int *a1, int a2, _OWORD *__src, size_t __n)
{
  if (!a1) {
    return 4294967293;
  }
  int v4 = __n;
  if ((__src != 0) != (__n != 0)) {
    return 4294967293;
  }
  uint64_t result = 4294967293;
  if (a2 > 399)
  {
    if (a2 > 601)
    {
      if (a2 <= 801)
      {
        if (a2 != 602)
        {
          if (a2 == 701)
          {
            if (__n <= 0x80 && *a1 == 13)
            {
              a1[8] = __n;
              BOOL v14 = a1 + 9;
LABEL_118:
              memcpy(v14, __src, __n);
              return 0;
            }
          }
          else if (a2 == 801 && __n == 16 && *a1 == 17)
          {
            uint64_t result = 0;
            *((_OWORD *)a1 + 2) = *__src;
          }
          return result;
        }
        BOOL v13 = *a1 == 12 || *a1 == 15;
        if (__n != 4 || !v13) {
          return result;
        }
LABEL_79:
        uint64_t result = 0;
        a1[9] = *(_DWORD *)__src;
        return result;
      }
      if (a2 == 802)
      {
        if (__n != 65 || *a1 != 17) {
          return result;
        }
        uint64_t result = 0;
        *((_OWORD *)a1 + 3) = *__src;
        long long v11 = __src[1];
        long long v16 = __src[2];
        long long v17 = __src[3];
        *((unsigned char *)a1 + 112) = *((unsigned char *)__src + 64);
        *((_OWORD *)a1 + 5) = v16;
        *((_OWORD *)a1 + 6) = v17;
        goto LABEL_92;
      }
      if (a2 != 901)
      {
        if (a2 == 1001 && __n <= 0x80 && *a1 == 21)
        {
          memcpy(a1 + 9, __src, __n);
          uint64_t result = 0;
          a1[8] = v4;
        }
        return result;
      }
      if (__n != 32 || *a1 != 20) {
        return result;
      }
    }
    else
    {
      if (a2 > 501)
      {
        switch(a2)
        {
          case 502:
            if (__n == 16 && *a1 == 10)
            {
LABEL_102:
              uint64_t result = 0;
              *(_OWORD *)(a1 + 13) = *__src;
            }
            break;
          case 503:
            if (__n == 16 && *a1 == 10)
            {
              uint64_t result = 0;
              long long v15 = *__src;
LABEL_99:
              *(_OWORD *)(a1 + 17) = v15;
            }
            break;
          case 601:
            BOOL v9 = *a1 == 12 || *a1 == 15;
            BOOL v10 = v9;
            if (__n == 4 && v10)
            {
LABEL_64:
              uint64_t result = 0;
              a1[8] = *(_DWORD *)__src;
            }
            break;
        }
        return result;
      }
      if (a2 != 400)
      {
        if (a2 != 401)
        {
          if (a2 == 501 && __n == 16 && *a1 == 10)
          {
LABEL_16:
            uint64_t result = 0;
            *(_OWORD *)(a1 + 9) = *__src;
          }
          return result;
        }
        if (__n != 24 || *a1 != 7) {
          return result;
        }
        uint64_t result = 0;
        long long v11 = *__src;
        *((void *)a1 + 10) = *((void *)__src + 2);
LABEL_92:
        *((_OWORD *)a1 + 4) = v11;
        return result;
      }
      if (__n != 32 || *a1 != 7) {
        return result;
      }
    }
    uint64_t result = 0;
    long long v18 = __src[1];
    *((_OWORD *)a1 + 2) = *__src;
    *((_OWORD *)a1 + 3) = v18;
    return result;
  }
  if (a2 > 199)
  {
    switch(a2)
    {
      case 300:
        if (__n == 16 && *a1 == 3) {
          goto LABEL_16;
        }
        break;
      case 301:
        if (__n == 32 && *a1 == 3)
        {
          uint64_t result = 0;
          long long v15 = *__src;
          *(_OWORD *)(a1 + 21) = __src[1];
          goto LABEL_99;
        }
        break;
      case 302:
        if (__n == 16 && *a1 == 3) {
          goto LABEL_102;
        }
        break;
      case 303:
        if (__n == 65 && *a1 == 3)
        {
          uint64_t result = 0;
          *(_OWORD *)(a1 + 30) = *__src;
          long long v19 = __src[1];
          long long v20 = __src[2];
          long long v21 = __src[3];
          *((unsigned char *)a1 + 184) = *((unsigned char *)__src + 64);
          *(_OWORD *)(a1 + 42) = v21;
          *(_OWORD *)(a1 + 38) = v20;
          *(_OWORD *)(a1 + 34) = v19;
        }
        break;
      case 304:
        if (__n == 16 && *a1 == 3)
        {
          uint64_t result = 0;
          *(_OWORD *)((char *)a1 + 185) = *__src;
        }
        break;
      case 305:
        if (__n == 4 && *a1 == 3)
        {
          uint64_t result = 0;
          *(int *)((char *)a1 + 201) = *(_DWORD *)__src;
        }
        break;
      case 306:
        if (__n <= 0x80 && *a1 == 3)
        {
          memcpy((char *)a1 + 209, __src, __n);
          uint64_t result = 0;
          *(int *)((char *)a1 + 205) = v4;
        }
        break;
      default:
        if (a2 == 200)
        {
          if (__n <= 0x80 && *a1 == 2)
          {
            a1[9] = __n;
            BOOL v14 = a1 + 10;
            goto LABEL_118;
          }
        }
        else if (a2 == 201 && __n == 4 && *a1 == 2)
        {
          goto LABEL_64;
        }
        break;
    }
    return result;
  }
  if (a2 > 100)
  {
    if (a2 == 101)
    {
      if (__n == 4)
      {
        switch(*a1)
        {
          case 1:
          case 3:
          case 9:
          case 10:
            goto LABEL_64;
          case 2:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
            return result;
          default:
            if (*a1 == 18) {
              goto LABEL_64;
            }
            break;
        }
      }
      return result;
    }
    if (a2 != 102 || __n != 4 || *a1 != 1) {
      return result;
    }
    goto LABEL_79;
  }
  if (a2 == 5)
  {
    if (__n == 4)
    {
      uint64_t result = 0;
      a1[3] = *(_DWORD *)__src;
    }
  }
  else if (a2 == 100 && __n == 16)
  {
    int v7 = *a1;
    if (*a1 > 8)
    {
      if (v7 == 9)
      {
        uint64_t v8 = a1 + 10;
        a1[9] = 16;
      }
      else
      {
        if (v7 != 18) {
          return result;
        }
        uint64_t v8 = a1 + 9;
      }
    }
    else if (v7 == 1)
    {
      uint64_t v8 = a1 + 11;
      a1[10] = 16;
    }
    else
    {
      if (v7 != 3) {
        return result;
      }
      uint64_t v8 = a1 + 26;
      a1[25] = 16;
    }
    uint64_t result = 0;
    _OWORD *v8 = *__src;
  }
  return result;
}

uint64_t LibCall_ACMCredentialGetPropertyData(int *a1, int a2, int **a3, uint64_t *a4)
{
  uint64_t result = 4294967293;
  if (!a1 || !a3 || !a4) {
    return result;
  }
  if (a2 > 399)
  {
    if (a2 > 601)
    {
      if (a2 > 801)
      {
        if (a2 == 802)
        {
          if (*a1 != 17) {
            return result;
          }
          long long v11 = a1 + 12;
LABEL_87:
          uint64_t v12 = 65;
          BOOL v13 = v11;
          uint64_t v14 = 65;
        }
        else
        {
          if (a2 != 901)
          {
            if (a2 != 1001 || *a1 != 21) {
              return result;
            }
            long long v15 = a1 + 9;
            if (Util_isNullOrZeroMemory((unsigned char *)a1 + 36, 128))
            {
              long long v15 = 0;
              uint64_t v10 = 0;
            }
            else
            {
              uint64_t v10 = a1[8];
            }
            uint64_t result = 0;
            *a3 = v15;
LABEL_99:
            *a4 = v10;
            return result;
          }
          if (*a1 != 20) {
            return result;
          }
          long long v11 = a1 + 8;
          uint64_t v12 = 32;
          BOOL v13 = v11;
          uint64_t v14 = 32;
        }
      }
      else
      {
        if (a2 == 602)
        {
          if (*a1 != 15 && *a1 != 12) {
            return result;
          }
          goto LABEL_61;
        }
        if (a2 == 701)
        {
          if (*a1 != 13) {
            return result;
          }
          uint64_t result = 0;
          *a3 = a1 + 9;
          uint64_t v10 = a1[8];
          goto LABEL_99;
        }
        if (a2 != 801 || *a1 != 17) {
          return result;
        }
        long long v11 = a1 + 8;
        uint64_t v12 = 16;
        BOOL v13 = v11;
        uint64_t v14 = 16;
      }
      BOOL isNullOrZeroMemory = Util_isNullOrZeroMemory(v13, v14);
      uint64_t result = 0;
      BOOL v20 = !isNullOrZeroMemory;
      if (isNullOrZeroMemory) {
        long long v21 = 0;
      }
      else {
        long long v21 = (int *)v11;
      }
      if (v20) {
        uint64_t v22 = v12;
      }
      else {
        uint64_t v22 = 0;
      }
      *a3 = v21;
      *a4 = v22;
      return result;
    }
    if (a2 > 501)
    {
      if (a2 == 502)
      {
        if (*a1 != 10) {
          return result;
        }
        BOOL v9 = a1 + 13;
      }
      else
      {
        if (a2 != 503)
        {
          if (a2 != 601 || *a1 != 15 && *a1 != 12) {
            return result;
          }
          goto LABEL_77;
        }
        if (*a1 != 10) {
          return result;
        }
        BOOL v9 = a1 + 17;
      }
LABEL_68:
      *a3 = v9;
      uint64_t result = Util_isNullOrZeroMemory(v9, 16);
      if (result)
      {
        uint64_t result = 0;
        *a4 = 0;
        *a3 = 0;
        return result;
      }
LABEL_70:
      uint64_t v10 = 16;
      goto LABEL_99;
    }
    if (a2 == 400)
    {
      if (*a1 != 7) {
        return result;
      }
      uint64_t result = 0;
      long long v16 = a1 + 8;
LABEL_84:
      *a3 = v16;
      uint64_t v10 = 32;
      goto LABEL_99;
    }
    if (a2 == 401)
    {
      if (*a1 != 7) {
        return result;
      }
      uint64_t result = 0;
      *a3 = a1 + 16;
      uint64_t v10 = 24;
      goto LABEL_99;
    }
    if (a2 != 501 || *a1 != 10) {
      return result;
    }
LABEL_15:
    BOOL v9 = a1 + 9;
    goto LABEL_68;
  }
  if (a2 > 199)
  {
    switch(a2)
    {
      case 300:
        if (*a1 == 3)
        {
          uint64_t result = 0;
          uint64_t v8 = a1 + 9;
          goto LABEL_50;
        }
        break;
      case 301:
        if (*a1 == 3)
        {
          uint64_t result = 0;
          long long v16 = a1 + 17;
          goto LABEL_84;
        }
        break;
      case 302:
        if (*a1 == 3)
        {
          uint64_t result = 0;
          uint64_t v8 = a1 + 13;
          goto LABEL_50;
        }
        break;
      case 303:
        if (*a1 == 3)
        {
          long long v11 = a1 + 30;
          goto LABEL_87;
        }
        break;
      case 304:
        if (*a1 == 3)
        {
          uint64_t result = 0;
          uint64_t v8 = (int *)((char *)a1 + 185);
LABEL_50:
          *a3 = v8;
          goto LABEL_70;
        }
        break;
      case 305:
        if (*a1 == 3)
        {
          uint64_t result = 0;
          long long v17 = (int *)((char *)a1 + 201);
          goto LABEL_97;
        }
        break;
      case 306:
        if (*a1 == 3)
        {
          uint64_t result = 0;
          uint64_t v10 = *(unsigned int *)((char *)a1 + 205);
          uint64_t v23 = (int *)((char *)a1 + 209);
          if (!*(int *)((char *)a1 + 205)) {
            uint64_t v23 = 0;
          }
          *a3 = v23;
          goto LABEL_99;
        }
        break;
      default:
        if (a2 == 200)
        {
          if (*a1 == 2)
          {
            uint64_t result = 0;
            *a3 = a1 + 10;
            uint64_t v10 = a1[9];
            goto LABEL_99;
          }
        }
        else if (a2 == 201 && *a1 == 2)
        {
          goto LABEL_77;
        }
        break;
    }
    return result;
  }
  if (a2 > 99)
  {
    if (a2 != 100)
    {
      if (a2 != 101)
      {
        if (a2 != 102 || *a1 != 1) {
          return result;
        }
LABEL_61:
        uint64_t result = 0;
        long long v17 = a1 + 9;
        goto LABEL_97;
      }
      if (*a1 > 0x12 || ((1 << *a1) & 0x4060A) == 0) {
        return result;
      }
LABEL_77:
      uint64_t result = 0;
      long long v17 = a1 + 8;
LABEL_97:
      *a3 = v17;
LABEL_98:
      uint64_t v10 = 4;
      goto LABEL_99;
    }
    int v18 = *a1;
    if (*a1 <= 8)
    {
      if (v18 == 1)
      {
        BOOL v9 = a1 + 11;
      }
      else
      {
        if (v18 != 3) {
          return result;
        }
        BOOL v9 = a1 + 26;
      }
      goto LABEL_68;
    }
    if (v18 == 9)
    {
      BOOL v9 = a1 + 10;
      goto LABEL_68;
    }
    if (v18 != 18) {
      return result;
    }
    goto LABEL_15;
  }
  switch(a2)
  {
    case 1:
      uint64_t result = 0;
      *a3 = a1 + 4;
      uint64_t v10 = 8;
      goto LABEL_99;
    case 2:
      uint64_t result = 0;
      long long v17 = a1 + 6;
      goto LABEL_97;
    case 3:
      uint64_t result = 0;
      *a3 = a1;
      goto LABEL_98;
    case 4:
      uint64_t result = 0;
      long long v17 = a1 + 1;
      goto LABEL_97;
    case 5:
      uint64_t result = 0;
      long long v17 = a1 + 3;
      goto LABEL_97;
    default:
      return result;
  }
  return result;
}

uint64_t LibCall_ACMRequirementGetState(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 4);
  }
  return result;
}

uint64_t LibCall_ACMRequirementGetPriority(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

uint64_t LibCall_ACMRequirementGetPropertyData(int *a1, int a2, int **a3, unint64_t *a4)
{
  uint64_t v4 = 4294967293;
  if (!a1 || !a3 || !a4) {
    return v4;
  }
  uint64_t v4 = 4294967293;
  if (a2 > 399)
  {
    if (a2 > 600)
    {
      if (a2 == 601)
      {
        if (*a1 == 26)
        {
          if (a1[3] >= 0x1C)
          {
            int v7 = a1 + 7;
LABEL_45:
            *a3 = v7;
            unint64_t v10 = 16;
            goto LABEL_72;
          }
          return 4294967282;
        }
        return 4294967293;
      }
      if (a2 != 602)
      {
        if (a2 != 700) {
          return v4;
        }
        if (*a1 == 7)
        {
LABEL_28:
          uint64_t v8 = a1 + 4;
          goto LABEL_58;
        }
        return 4294967293;
      }
      if (*a1 != 26) {
        return 4294967293;
      }
      if (a1[3] < 0x1C) {
        return 4294967282;
      }
      *a3 = a1 + 4;
      unint64_t v10 = 8;
    }
    else
    {
      if (a2 == 400)
      {
        if (*a1 == 13)
        {
          BOOL v9 = a1 + 4;
LABEL_64:
          *a3 = v9;
          unint64_t v10 = 32;
          goto LABEL_72;
        }
        return 4294967293;
      }
      if (a2 != 500)
      {
        if (a2 != 600) {
          return v4;
        }
        if (*a1 == 26)
        {
          if (a1[3] >= 0x1C)
          {
            uint64_t v8 = a1 + 6;
LABEL_58:
            *a3 = v8;
            goto LABEL_59;
          }
          return 4294967282;
        }
        return 4294967293;
      }
      if (*a1 != 25) {
        return 4294967293;
      }
      *a3 = a1 + 4;
      unint64_t v10 = 43;
    }
LABEL_72:
    uint64_t v4 = 0;
    *a4 = v10;
    return v4;
  }
  if (a2 > 99)
  {
    switch(a2)
    {
      case 300:
        if (*a1 != 3) {
          return 4294967293;
        }
        int v7 = a1 + 5;
        goto LABEL_45;
      case 301:
        if (*a1 != 3) {
          return 4294967293;
        }
        BOOL v9 = a1 + 13;
        goto LABEL_64;
      case 302:
        if (*a1 != 3) {
          return 4294967293;
        }
        int v7 = a1 + 9;
        goto LABEL_45;
      case 303:
        if (*a1 != 3) {
          return 4294967293;
        }
        unint64_t v10 = 0;
        long long v11 = a1 + 21;
        break;
      case 304:
        if (*a1 != 3) {
          return 4294967293;
        }
        if (a1[3] < 0x9C) {
          return 4294967282;
        }
        uint64_t v8 = a1 + 41;
        goto LABEL_58;
      case 305:
        if (*a1 != 3) {
          return 4294967293;
        }
        if (a1[3] < 0x9C) {
          return 4294967282;
        }
        uint64_t v8 = a1 + 42;
        goto LABEL_58;
      case 306:
        if (*a1 != 24) {
          return 4294967293;
        }
        *a3 = a1 + 5;
        unint64_t v10 = a1[4];
        goto LABEL_72;
      case 307:
        if (*a1 != 24) {
          return 4294967293;
        }
        BOOL v9 = a1 + 261;
        goto LABEL_64;
      default:
        if (a2 == 100)
        {
          int v13 = *a1;
          if (*a1 > 19)
          {
            if (v13 == 20 || v13 == 21) {
              goto LABEL_28;
            }
          }
          else if (v13 == 1 || v13 == 3)
          {
            goto LABEL_28;
          }
          return v4;
        }
        if (a2 != 200) {
          return v4;
        }
        if (*a1 != 2) {
          return 4294967293;
        }
        goto LABEL_28;
    }
    while (!Util_isNullOrZeroMemory((unsigned char *)v11 + v10, 16))
    {
      BOOL v12 = v10 >= 0x40;
      v10 += 16;
      if (v12)
      {
        unint64_t v10 = 80;
        goto LABEL_71;
      }
    }
    if (!v10) {
      long long v11 = 0;
    }
LABEL_71:
    *a3 = v11;
    goto LABEL_72;
  }
  switch(a2)
  {
    case 1:
      *a3 = a1;
LABEL_59:
      unint64_t v10 = 4;
      goto LABEL_72;
    case 2:
      uint64_t v8 = a1 + 1;
      goto LABEL_58;
    case 3:
      uint64_t v8 = a1 + 2;
      goto LABEL_58;
  }
  return v4;
}

uint64_t LibCall_ACMPing(uint64_t (*a1)(uint64_t, uint64_t, void, void, void, void, void), uint64_t a2, uint64_t a3)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMPing");
  }
  unsigned int v6 = 70;
  if (a1 && (a3 == 47 || a3 == 29))
  {
    uint64_t v7 = a1(a2, a3, 0, 0, 0, 0, 0);
    if (v7) {
      unsigned int v6 = 70;
    }
    else {
      unsigned int v6 = 10;
    }
  }
  else
  {
    uint64_t v7 = 4294967293;
  }
  if (v6 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMPing", (int)v7);
  }
  return v7;
}

uint64_t LibCall_ACMKernDoubleClickNotify(uint64_t (*a1)(uint64_t, uint64_t, void, void, void, void, void), uint64_t a2)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernDoubleClickNotify");
  }
  unsigned int v4 = 70;
  if (a1)
  {
    uint64_t v5 = a1(a2, 28, 0, 0, 0, 0, 0);
    if (v5) {
      unsigned int v4 = 70;
    }
    else {
      unsigned int v4 = 10;
    }
  }
  else
  {
    uint64_t v5 = 4294967293;
  }
  if (v4 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernDoubleClickNotify", (int)v5);
  }
  return v5;
}

uint64_t LibCall_ACMContextCredentialGetProperty(uint64_t (*a1)(uint64_t, uint64_t, void, __n128 *, uint64_t, uint64_t, uint64_t, __n128), uint64_t a2, __n128 *a3, unsigned __int32 a4, unsigned __int32 a5, uint64_t a6, uint64_t a7)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCredentialGetProperty");
  }
  unsigned int v14 = 70;
  uint64_t v15 = 4294967293;
  if (a1)
  {
    if (a3)
    {
      uint64_t v15 = 4294967293;
      if (a6)
      {
        if (a7)
        {
          uint64_t v19 = 24;
          __n128 Property_Serialize = LibSer_ContextCredentialGetProperty_Serialize(a3, a4, a5, &v20, &v19);
          if (v16)
          {
            uint64_t v15 = v16;
          }
          else if (v19 == 24)
          {
            uint64_t v15 = a1(a2, 33, 0, &v20, 24, a6, a7, Property_Serialize);
            if (!v15)
            {
              unsigned int v14 = 10;
              goto LABEL_11;
            }
          }
          else
          {
            uint64_t v15 = 4294967291;
          }
          unsigned int v14 = 70;
        }
      }
    }
  }
LABEL_11:
  if (v14 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCredentialGetProperty", (int)v15);
  }
  return v15;
}

uint64_t LibCall_ACMGlobalContextCredentialGetProperty(uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty");
  }
  unsigned int v12 = 70;
  uint64_t v13 = 4294967293;
  if (a1 && a5 && a6)
  {
    uint64_t v16 = 8;
    uint64_t Property_Serialize = LibSer_GlobalContextCredentialGetProperty_Serialize(a3, a4, &v17, &v16);
    if (Property_Serialize)
    {
      uint64_t v13 = Property_Serialize;
    }
    else if (v16 == 8)
    {
      uint64_t v13 = a1(a2, 27, 0, &v17, 8, a5, a6);
      if (!v13)
      {
        unsigned int v12 = 10;
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v13 = 4294967291;
    }
    unsigned int v12 = 70;
  }
LABEL_10:
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty", (int)v13);
  }
  return v13;
}

uint64_t LibCall_ACMContextVerifyPolicyEx(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, BOOL *a9, int **a10)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx");
  }
  unint64_t v31 = 4096;
  size_t size = 0;
  size_t v29 = 0;
  __int16 v30 = 0;
  uint64_t v18 = 4294967293;
  if (!a3 || !__s1 || !a9)
  {
LABEL_18:
    if (!v18) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  uint64_t SerializedVerifyPolicySize = GetSerializedVerifyPolicySize((uint64_t)a3, __s1, a5, a8, a6, a7, &size);
  if (!SerializedVerifyPolicySize)
  {
    size_t v20 = size;
    uint64_t v21 = acm_mem_alloc_data(size);
    acm_mem_alloc_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1257, "LibCall_ACMContextVerifyPolicyEx");
    if (v21)
    {
      uint64_t v22 = SerializeVerifyPolicy(a3, __s1, a5, a8, a6, a7, v21, &size);
      if (v22)
      {
        uint64_t v18 = v22;
        uint64_t v23 = 0;
      }
      else
      {
        uint64_t v23 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
        acm_mem_alloc_info("<data>", v23, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1263, "LibCall_ACMContextVerifyPolicyEx");
        if (v23)
        {
          uint64_t v24 = a1(a2, 3, 0, v21, size, v23, &v31);
          if (v24)
          {
            uint64_t v18 = v24;
          }
          else
          {
            unint64_t v25 = v31 - 4;
            if (v31 < 4)
            {
              uint64_t v18 = 4294967291;
            }
            else
            {
              *a9 = *v23 != 0;
              if (a10)
              {
                uint64_t v18 = DeserializeRequirement(v23 + 1, v25, (void **)&v30, &v29);
                if (!v18) {
                  *a10 = v30;
                }
              }
              else
              {
                uint64_t v18 = 0;
              }
            }
          }
        }
        else
        {
          uint64_t v18 = 4294967292;
        }
      }
      rsize_t v26 = size;
      acm_mem_free_info("<data>", v21, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1288, "LibCall_ACMContextVerifyPolicyEx");
      acm_mem_free_data(v21, v26);
      if (v23)
      {
        acm_mem_free_info("<data>", v23, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1291, "LibCall_ACMContextVerifyPolicyEx");
        acm_mem_free_data(v23, 0x1000uLL);
      }
    }
    else
    {
      uint64_t v18 = 4294967292;
    }
    goto LABEL_18;
  }
  uint64_t v18 = SerializedVerifyPolicySize;
LABEL_19:
  if (v30) {
    Util_DeallocRequirement(v30);
  }
LABEL_21:
  if (v18) {
    unsigned int v27 = 70;
  }
  else {
    unsigned int v27 = 10;
  }
  if (v27 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx", (int)v18);
  }
  return v18;
}

uint64_t LibCall_ACMGlobalContextVerifyPolicyEx(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, char *a3, uint64_t a4, _DWORD *a5, unsigned int a6, BOOL *a7, int **a8)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicyEx");
  }
  *(void *)size_t v20 = 0;
  uint64_t v16 = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, void, void, void, unsigned char *, uint64_t *))a1, a2, v20, 0, 1);
  if (!v16) {
    uint64_t v16 = LibCall_ACMContextVerifyPolicyEx(a1, a2, *(_OWORD **)v20, a3, a4, a5, a6, 0xFFFFFFFFLL, a7, a8);
  }
  uint64_t v17 = v16;
  if (*(void *)v20) {
    LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, void, void *, uint64_t, void, void))a1, a2, *(void **)v20, 1);
  }
  if (v17) {
    unsigned int v18 = 70;
  }
  else {
    unsigned int v18 = 10;
  }
  if (v18 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicyEx", (int)v17);
  }
  return v17;
}

uint64_t LibCall_ACMGetEnvironmentVariable(uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  int v12 = a3;
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGetEnvironmentVariable");
  }
  unsigned int v9 = 70;
  uint64_t v10 = 4294967293;
  if (a1 && a4 && a5)
  {
    uint64_t v10 = a1(a2, 25, 0, &v12, 4, a4, a5);
    if (v10) {
      unsigned int v9 = 70;
    }
    else {
      unsigned int v9 = 10;
    }
  }
  if (v9 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGetEnvironmentVariable", (int)v10);
  }
  return v10;
}

uint64_t LibCall_ACMSetEnvironmentVariable(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, void, void), uint64_t a2, int a3, _OWORD *a4, _OWORD *a5, uint64_t a6, const void *a7, size_t a8)
{
  uint64_t v15 = a1;
  v21[1] = *MEMORY[0x263EF8340];
  if (gACMLoggingLevel <= 0xAu) {
    a1 = (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))printf("%s: %s: called.\n", "ACM", "LibCall_ACMSetEnvironmentVariable");
  }
  if (v15 && a6 == 16 * (a5 != 0) && (a7 ? (BOOL v16 = a8 - 129 < 0xFFFFFFFFFFFFFF80) : (BOOL v16 = a8 != 0), !v16))
  {
    MEMORY[0x270FA5388](a1);
    uint64_t v17 = (char *)v21 - ((a8 + 59) & 0xFFFFFFFFFFFFFFF0);
    *(_DWORD *)uint64_t v17 = a3;
    *((_DWORD *)v17 + 1) = 2;
    *((_DWORD *)v17 + 2) = a8;
    *(_OWORD *)(v17 + 12) = 0u;
    *(_OWORD *)(v17 + 28) = 0u;
    if (a4) {
      *(_OWORD *)(v17 + 12) = *a4;
    }
    if (a5) {
      *(_OWORD *)(v17 + 28) = *a5;
    }
    if (a8) {
      memcpy(v17 + 44, a7, a8);
    }
    uint64_t v18 = v15(a2, 44, 0, (char *)v21 - ((a8 + 59) & 0xFFFFFFFFFFFFFFF0), a8 + 44, 0, 0);
    if (v18) {
      unsigned int v19 = 70;
    }
    else {
      unsigned int v19 = 10;
    }
  }
  else
  {
    unsigned int v19 = 70;
    uint64_t v18 = 4294967293;
  }
  if (v19 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSetEnvironmentVariable", (int)v18);
  }
  return v18;
}

uint64_t LibCall_ACMTRMLoadState(uint64_t (*a1)(uint64_t, uint64_t, void, void, void, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMTRMLoadState");
  }
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293;
  if (a1 && a3 && a4)
  {
    uint64_t v9 = a1(a2, 38, 0, 0, 0, a3, a4);
    if (v9) {
      unsigned int v8 = 70;
    }
    else {
      unsigned int v8 = 10;
    }
  }
  if (v8 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMLoadState", (int)v9);
  }
  return v9;
}

uint64_t LibCall_ACMTRMSaveState(uint64_t (*a1)(uint64_t, uint64_t, void, uint64_t, uint64_t, void, void), uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMTRMSaveState");
  }
  if (a1)
  {
    BOOL v10 = (unint64_t)(a4 - 8193) < 0xFFFFFFFFFFFFE000;
    if (!a3) {
      BOOL v10 = a4 != 0;
    }
    unsigned int v11 = 70;
    if (!v10)
    {
      if (a5) {
        uint64_t v12 = 43;
      }
      else {
        uint64_t v12 = 39;
      }
      uint64_t v13 = a1(a2, v12, 0, a3, a4, 0, 0);
      if (v13) {
        unsigned int v11 = 70;
      }
      else {
        unsigned int v11 = 10;
      }
      goto LABEL_13;
    }
  }
  else
  {
    unsigned int v11 = 70;
  }
  uint64_t v13 = 4294967293;
LABEL_13:
  if (v11 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMSaveState", (int)v13);
  }
  return v13;
}

uint64_t LibCall_ACMContextLoadFromImage(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  unsigned int v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, char *, uint64_t, _OWORD *, unint64_t *))v1;
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextLoadFromImage");
  }
  unsigned int v11 = 70;
  uint64_t v12 = 4294967293;
  if (v10 && v7 && (unint64_t)(v5 - 4097) >= 0xFFFFFFFFFFFFF000)
  {
    uint64_t v13 = acm_mem_alloc(0x14uLL);
    acm_mem_alloc_info("ACMHandleWithPayload", v13, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1447, "LibCall_ACMContextLoadFromImage");
    if (v13)
    {
      bzero(v21, 0x1005uLL);
      char v20 = 1;
      *(_WORD *)&v21[1] = 6;
      __int16 v22 = v5;
      __memcpy_chk();
      memset(v18, 0, sizeof(v18));
      uint64_t v19 = 0;
      unint64_t v17 = 280;
      uint64_t v14 = v10(v9, 48, 0, &v20, 4102, v18, &v17);
      if (v14)
      {
        uint64_t v12 = v14;
      }
      else if (v17 < 0x18)
      {
        uint64_t v12 = 4294967291;
      }
      else
      {
        if (LOBYTE(v18[0]))
        {
          uint64_t v12 = 0;
          int v15 = DWORD1(v18[1]);
          *(_OWORD *)uint64_t v13 = *(_OWORD *)((char *)v18 + 4);
          v13[4] = v15;
          *unsigned int v3 = v13;
          unsigned int v11 = 10;
          goto LABEL_11;
        }
        uint64_t v12 = 4294967280;
      }
      acm_mem_free_info("ACMHandleWithPayload", v13, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1508, "LibCall_ACMContextLoadFromImage");
      acm_mem_free(v13, 0x14uLL);
      unsigned int v11 = 70;
    }
    else
    {
      unsigned int v11 = 70;
      uint64_t v12 = 4294967292;
    }
  }
LABEL_11:
  if (v11 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextLoadFromImage", (int)v12);
  }
  return v12;
}

uint64_t LibCall_ACMContextUnloadToImage(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  unsigned int v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, int *, uint64_t, unsigned char *, int *))v1;
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextUnloadToImage");
  }
  unsigned int v11 = 70;
  uint64_t v12 = 4294967293;
  if (v10 && v5 && v3)
  {
    long long v21 = 0uLL;
    int v20 = 1310721;
    if (v7) {
      long long v21 = *v7;
    }
    else {
      long long v21 = 0uLL;
    }
    bzero(v17, 0x1106uLL);
    *(void *)BOOL v16 = 4358;
    uint64_t v13 = v10(v9, 49, 0, &v20, 20, v17, v16);
    if (v13)
    {
      uint64_t v12 = v13;
LABEL_18:
      unsigned int v11 = 70;
      goto LABEL_14;
    }
    if (*(void *)v16 < 6uLL)
    {
      unsigned int v11 = 70;
      uint64_t v12 = 4294967291;
    }
    else
    {
      if (v17[0])
      {
        uint64_t v15 = v18;
        uint64_t v12 = Util_ReadFromBuffer((uint64_t)v17, *(size_t *)v16, &v15, v5, (unsigned __int16)__n);
        if (!v12)
        {
          *unsigned int v3 = v15 - v18;
          unsigned int v11 = 10;
          goto LABEL_14;
        }
        goto LABEL_18;
      }
      unsigned int v11 = 70;
      uint64_t v12 = 4294967280;
    }
  }
LABEL_14:
  if (v11 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextUnloadToImage", (int)v12);
  }
  return v12;
}

uint64_t LibCall_ACMContextSetData(uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, void, void), uint64_t a2, _OWORD *a3, int a4, _DWORD *a5, unsigned int a6, const void *a7, size_t a8)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextSetData");
  }
  size_t size = 0;
  unsigned int v16 = 70;
  uint64_t v17 = 4294967293;
  if (a1 && a3)
  {
    if ((a7 != 0) != (a8 != 0))
    {
      unsigned int v16 = 70;
      uint64_t v17 = 4294967293;
    }
    else if (a8 > 0xE00)
    {
      unsigned int v16 = 70;
      uint64_t v17 = 4294967276;
    }
    else
    {
      uint64_t v18 = LibSer_StorageSetData_GetSize(a8, a5, a6, &size);
      if (v18)
      {
        uint64_t v17 = v18;
        unsigned int v16 = 70;
      }
      else
      {
        size_t v19 = size;
        int v20 = acm_mem_alloc_data(size);
        acm_mem_alloc_info("<data>", v20, v19, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1593, "LibCall_ACMContextSetData");
        if (v20)
        {
          uint64_t v21 = LibSer_StorageSetData_Serialize(a3, a4, a7, a8, a5, a6, (uint64_t)v20, &size);
          if (!v21) {
            uint64_t v21 = a1(a2, 40, 0, v20, size, 0, 0);
          }
          uint64_t v17 = v21;
          rsize_t v22 = size;
          acm_mem_free_info("<data>", v20, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1605, "LibCall_ACMContextSetData");
          acm_mem_free_data(v20, v22);
          if (v17) {
            unsigned int v16 = 70;
          }
          else {
            unsigned int v16 = 10;
          }
        }
        else
        {
          unsigned int v16 = 70;
          uint64_t v17 = 4294967292;
        }
      }
    }
  }
  if (v16 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextSetData", (int)v17);
  }
  return v17;
}

uint64_t LibCall_ACMContextGetData(uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, uint64_t, uint64_t), uint64_t a2, _OWORD *a3, int a4, char a5, _DWORD *a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  if (gACMLoggingLevel <= 0xAu)
  {
    uint64_t v16 = a8;
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextGetData");
    a8 = v16;
  }
  size_t size = 0;
  unsigned int v17 = 70;
  uint64_t v18 = 4294967293;
  if (a1)
  {
    uint64_t v26 = a2;
    if (a3)
    {
      uint64_t v18 = 4294967293;
      if (a8)
      {
        if (a9)
        {
          uint64_t v19 = a8;
          uint64_t v20 = LibSer_StorageGetData_GetSize(a6, a7, &size);
          if (v20)
          {
            uint64_t v18 = v20;
            unsigned int v17 = 70;
          }
          else
          {
            size_t v21 = size;
            rsize_t v22 = acm_mem_alloc_data(size);
            acm_mem_alloc_info("<data>", v22, v21, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1628, "LibCall_ACMContextGetData");
            if (v22)
            {
              uint64_t Data_Serialize = LibSer_StorageGetData_Serialize(a3, a4, a5, a6, a7, (uint64_t)v22, &size);
              if (!Data_Serialize) {
                uint64_t Data_Serialize = a1(v26, 41, 0, v22, size, v19, a9);
              }
              uint64_t v18 = Data_Serialize;
              rsize_t v24 = size;
              acm_mem_free_info("<data>", v22, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1640, "LibCall_ACMContextGetData");
              acm_mem_free_data(v22, v24);
              if (v18) {
                unsigned int v17 = 70;
              }
              else {
                unsigned int v17 = 10;
              }
            }
            else
            {
              unsigned int v17 = 70;
              uint64_t v18 = 4294967292;
            }
          }
        }
      }
    }
  }
  if (v17 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextGetData", (int)v18);
  }
  return v18;
}

uint64_t LibCall_ACMPublishTrustedAccessories(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, void, void), uint64_t a2, const void *a3, size_t a4)
{
  uint64_t v7 = a1;
  v14[1] = *MEMORY[0x263EF8340];
  if (gACMLoggingLevel <= 0xAu) {
    a1 = (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))printf("%s: %s: called.\n", "ACM", "LibCall_ACMPublishTrustedAccessories");
  }
  if (v7)
  {
    if (a3) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = a4 == 0;
    }
    char v9 = !v8;
    unsigned int v10 = 70;
    uint64_t v11 = 4294967293;
    if ((a4 & 0xF) == 0 && a4 <= 0x100 && (v9 & 1) == 0)
    {
      MEMORY[0x270FA5388](a1);
      uint64_t v12 = (_DWORD *)((char *)v14 - ((a4 + 23) & 0xFFFFFFFFFFFFFFF0));
      *uint64_t v12 = 1;
      v12[1] = a4;
      if (a4) {
        memcpy(v12 + 2, a3, a4);
      }
      uint64_t v11 = v7(a2, 45, 0, (char *)v14 - ((a4 + 23) & 0xFFFFFFFFFFFFFFF0), a4 + 8, 0, 0);
      if (v11) {
        unsigned int v10 = 70;
      }
      else {
        unsigned int v10 = 10;
      }
    }
  }
  else
  {
    unsigned int v10 = 70;
    uint64_t v11 = 4294967293;
  }
  if (v10 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMPublishTrustedAccessories", (int)v11);
  }
  return v11;
}

uint64_t LibCall_ACMContextGetInfo(uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, _OWORD *, unint64_t *), uint64_t a2, long long *a3, int a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextGetInfo");
  }
  unsigned int v10 = 70;
  uint64_t v11 = 4294967293;
  if (a3 && a1 && a5)
  {
    int v16 = 1;
    int v18 = a4;
    long long v17 = *a3;
    memset(v15, 0, 140);
    unint64_t v14 = 140;
    uint64_t v12 = a1(a2, 46, 0, &v16, 24, v15, &v14);
    if (v12)
    {
      uint64_t v11 = v12;
    }
    else if (v14 < 0xC)
    {
      uint64_t v11 = 4294967291;
    }
    else
    {
      if (LODWORD(v15[0]))
      {
        uint64_t v11 = 0;
        *a5 = *(void *)((char *)v15 + 4);
        unsigned int v10 = 10;
        goto LABEL_10;
      }
      uint64_t v11 = 4294967281;
    }
    unsigned int v10 = 70;
  }
LABEL_10:
  if (v10 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextGetInfo", (int)v11);
  }
  return v11;
}

uint64_t verifyAclConstraintInternal(uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, unsigned int *, unint64_t *), uint64_t a2, uint64_t a3, _OWORD *a4, const void *a5, uint64_t a6, const void *a7, unsigned int a8, unsigned __int8 a9, _DWORD *a10, unsigned int a11, unsigned int a12, BOOL *a13, int **a14)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "verifyAclConstraintInternal");
  }
  size_t v36 = 0;
  uint64_t v34 = 0;
  unint64_t v35 = 4096;
  size_t v33 = 0;
  uint64_t v20 = 4294967293;
  if (!a4 || !a5 || !a6 || !a13)
  {
LABEL_19:
    if (!v20) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  uint64_t SerializedVerifyAclConstraintSize = GetSerializedVerifyAclConstraintSize(a3, (uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a9, a12, a10, a11, &v36);
  if (!SerializedVerifyAclConstraintSize)
  {
    uint64_t v22 = v36;
    uint64_t v23 = acm_mem_alloc_data(v36);
    acm_mem_alloc_info("<data>", v23, v22, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1929, "verifyAclConstraintInternal");
    if (v23)
    {
      uint64_t v24 = SerializeVerifyAclConstraint(a3, a4, a5, a6, a7, a8, a9, a12, a10, a11, (uint64_t)v23, &v36);
      if (v24)
      {
        uint64_t v20 = v24;
        unint64_t v25 = 0;
      }
      else
      {
        unint64_t v25 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
        acm_mem_alloc_info("<data>", v25, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1935, "verifyAclConstraintInternal");
        if (v25)
        {
          uint64_t v26 = a1(a2, a3, 0, v23, v36, v25, &v35);
          if (v26)
          {
            uint64_t v20 = v26;
          }
          else
          {
            unint64_t v27 = v35 - 4;
            if (v35 < 4)
            {
              uint64_t v20 = 4294967291;
            }
            else
            {
              *a13 = *v25 != 0;
              if (a14)
              {
                uint64_t v20 = DeserializeRequirement(v25 + 1, v27, (void **)&v34, &v33);
                if (!v20) {
                  *a14 = v34;
                }
              }
              else
              {
                uint64_t v20 = 0;
              }
            }
          }
        }
        else
        {
          uint64_t v20 = 4294967292;
        }
      }
      rsize_t v28 = v36;
      acm_mem_free_info("<data>", v23, v36, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1958, "verifyAclConstraintInternal");
      acm_mem_free_data(v23, v28);
      if (v25)
      {
        acm_mem_free_info("<data>", v25, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1961, "verifyAclConstraintInternal");
        acm_mem_free_data(v25, 0x1000uLL);
      }
    }
    else
    {
      uint64_t v20 = 4294967292;
    }
    goto LABEL_19;
  }
  uint64_t v20 = SerializedVerifyAclConstraintSize;
LABEL_20:
  if (v34) {
    Util_DeallocRequirement(v34);
  }
LABEL_22:
  if (v20) {
    unsigned int v29 = 70;
  }
  else {
    unsigned int v29 = 10;
  }
  if (v29 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "verifyAclConstraintInternal", (int)v20);
  }
  return v20;
}

uint64_t LibCall_ACMSecContextProcessAcl(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, int *, uint64_t *), uint64_t a2, _OWORD *a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, _DWORD *a8, unsigned int a9, unsigned int a10, _DWORD *a11, BOOL *a12)
{
  return processAclCommandInternal(a1, a2, 12, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, 0, 0);
}

uint64_t processAclCommandInternal(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, int *, uint64_t *), uint64_t a2, int a3, _OWORD *a4, unsigned __int8 *a5, uint64_t a6, unsigned __int8 *a7, uint64_t a8, _DWORD *a9, unsigned int a10, unsigned int a11, _DWORD *a12, BOOL *a13, void *a14, unint64_t *a15)
{
  unsigned int v19 = gACMLoggingLevel;
  if (gACMLoggingLevel <= 0xAu)
  {
    printf("%s: %s: called.\n", "ACM", "processAclCommandInternal");
    unsigned int v19 = gACMLoggingLevel;
  }
  if (v19 <= 0x14)
  {
    printf("%s: %s: command = %u.\n", "ACM", "processAclCommandInternal", a3);
    unsigned int v19 = gACMLoggingLevel;
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: context = %p.\n", "ACM", "processAclCommandInternal", a4);
      unsigned int v19 = gACMLoggingLevel;
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s: acl = %p, aclLength = %zu.\n", "ACM", "processAclCommandInternal", a5, a6);
        unsigned int v19 = gACMLoggingLevel;
        if (gACMLoggingLevel <= 0x14u)
        {
          printf("%s: %s (len=%u): acl:", "ACM", "processAclCommandInternal", a6);
          unsigned int v19 = gACMLoggingLevel;
        }
      }
    }
  }
  if (a6)
  {
    uint64_t v20 = a6;
    size_t v21 = a5;
    do
    {
      if (v19 <= 0x14)
      {
        printf("%02x ", *v21);
        unsigned int v19 = gACMLoggingLevel;
      }
      ++v21;
      --v20;
    }
    while (v20);
  }
  if (v19 < 0x15)
  {
    putchar(10);
    unsigned int v19 = gACMLoggingLevel;
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: operation = %p, operationLength = %zu.\n", "ACM", "processAclCommandInternal", a7, a8);
      unsigned int v19 = gACMLoggingLevel;
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s (len=%u): operation:", "ACM", "processAclCommandInternal", a8);
        unsigned int v19 = gACMLoggingLevel;
      }
    }
  }
  int v39 = a3;
  if (a8)
  {
    uint64_t v22 = a8;
    uint64_t v23 = a7;
    do
    {
      if (v19 <= 0x14)
      {
        printf("%02x ", *v23);
        unsigned int v19 = gACMLoggingLevel;
      }
      ++v23;
      --v22;
    }
    while (v22);
  }
  if (v19 < 0x15)
  {
    putchar(10);
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: parameters = %p, parameterCount = %u.\n", "ACM", "processAclCommandInternal", a9, a10);
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s: maxGlobalCredentialAge = %u.\n", "ACM", "processAclCommandInternal", a11);
        if (gACMLoggingLevel <= 0x14u)
        {
          printf("%s: %s: constraintState = %p.\n", "ACM", "processAclCommandInternal", a12);
          if (gACMLoggingLevel <= 0x14u) {
            printf("%s: %s: requirePasscode = %p.\n", "ACM", "processAclCommandInternal", a13);
          }
        }
      }
    }
  }
  if (a7 || a9 || a12)
  {
    if (a5) {
      BOOL v26 = a6 == 0;
    }
    else {
      BOOL v26 = 1;
    }
    int v27 = v26;
    unsigned int v24 = 70;
    uint64_t v25 = 4294967293;
    if (!a7) {
      goto LABEL_79;
    }
    if (!a8) {
      goto LABEL_79;
    }
    if (v27) {
      goto LABEL_79;
    }
    unsigned int v24 = 70;
    uint64_t v25 = 4294967293;
    if ((a9 != 0) != (a10 != 0) || !a12) {
      goto LABEL_79;
    }
    size_t v45 = 0;
    unint64_t v44 = 4096;
    if (gACMLoggingLevel <= 0xAu) {
      printf("%s: %s: called.\n", "ACM", "processAclInternal");
    }
    uint64_t SerializedProcessAclSize = GetSerializedProcessAclSize((uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a11, a9, a10, &v45);
    if (SerializedProcessAclSize)
    {
      uint64_t v25 = SerializedProcessAclSize;
      unsigned int v37 = 70;
      goto LABEL_74;
    }
    uint64_t v29 = v45;
    __int16 v30 = acm_mem_alloc_data(v45);
    acm_mem_alloc_info("<data>", v30, v29, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1776, "processAclInternal");
    if (!v30)
    {
      unsigned int v37 = 70;
      uint64_t v25 = 4294967292;
      goto LABEL_74;
    }
    unint64_t v44 = 4096;
    unint64_t v31 = acm_mem_alloc_data(0x1000uLL);
    acm_mem_alloc_info("<data>", v31, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1780, "processAclInternal");
    if (!v31)
    {
      unint64_t v35 = 0;
      unint64_t v34 = 0;
      uint64_t v25 = 4294967292;
      goto LABEL_68;
    }
    uint64_t v32 = SerializeProcessAcl(a4, a5, a6, a7, a8, a11, a9, a10, (uint64_t)v30, &v45);
    if (v32 || (uint64_t v32 = a1(a2, v39, 0, (char *)v30, v45, v31, (uint64_t *)&v44), v32))
    {
      uint64_t v25 = v32;
      unint64_t v34 = 0;
      unint64_t v35 = 0;
      goto LABEL_67;
    }
    unint64_t v33 = v44;
    if (v44 >= 8)
    {
      *a12 = *v31;
      if (a13) {
        *a13 = v31[1] != 0;
      }
      uint64_t v25 = 0;
      unint64_t v34 = 0;
      if (v39 != 30 || !a14)
      {
        unint64_t v35 = 0;
        goto LABEL_67;
      }
      unint64_t v35 = 0;
      if (!a15)
      {
LABEL_67:
        acm_mem_free_info("<data>", v31, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1817, "processAclInternal");
        acm_mem_free_data(v31, 0x1000uLL);
LABEL_68:
        rsize_t v36 = v45;
        acm_mem_free_info("<data>", v30, v45, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1821, "processAclInternal");
        acm_mem_free_data(v30, v36);
        if (v25 && v35)
        {
          acm_mem_free_info("<data>", v35, v34, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1825, "processAclInternal");
          acm_mem_free_data(v35, v34);
          unsigned int v37 = 70;
        }
        else if (v25)
        {
          unsigned int v37 = 70;
        }
        else
        {
          unsigned int v37 = 10;
        }
LABEL_74:
        if (v37 >= gACMLoggingLevel) {
          printf("%s: %s: returning, err = %ld.\n", "ACM", "processAclInternal", (int)v25);
        }
        goto LABEL_76;
      }
      if (v33 >= 0xC)
      {
        unint64_t v34 = v31[2];
        if (v34)
        {
          if (v33 >= v34 + 12)
          {
            unint64_t v35 = acm_mem_alloc_data(v31[2]);
            acm_mem_alloc_info("<data>", v35, v34, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1805, "processAclInternal");
            if (v35)
            {
              memcpy(v35, v31 + 3, v34);
              uint64_t v25 = 0;
              *a14 = v35;
              *a15 = v34;
            }
            else
            {
              uint64_t v25 = 4294967292;
            }
            goto LABEL_67;
          }
          goto LABEL_84;
        }
        unint64_t v34 = 0;
        unint64_t v35 = 0;
        uint64_t v25 = 0;
        goto LABEL_67;
      }
    }
    unint64_t v34 = 0;
LABEL_84:
    unint64_t v35 = 0;
    uint64_t v25 = 4294967291;
    goto LABEL_67;
  }
  if (a4)
  {
    unsigned int v24 = 70;
    uint64_t v25 = 4294967293;
    goto LABEL_79;
  }
  unsigned int v24 = 70;
  uint64_t v25 = 4294967293;
  if (a5 && a13 && a6)
  {
    uint64_t v25 = aclRequiresPasscodeInternal(a1, a2, a5, a6, a13);
LABEL_76:
    if (v25) {
      unsigned int v24 = 70;
    }
    else {
      unsigned int v24 = 10;
    }
  }
LABEL_79:
  if (v24 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "processAclCommandInternal", (int)v25);
  }
  return v25;
}

uint64_t LibCall_ACMSecContextProcessAclAndCopyAuthMethod(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, int *, uint64_t *), uint64_t a2, _OWORD *a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, _DWORD *a8, unsigned int a9, unsigned int a10, _DWORD *a11, BOOL *a12, void *a13, unint64_t *a14)
{
  return processAclCommandInternal(a1, a2, 30, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

uint64_t LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement(uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, const void *a6, unsigned int a7, unsigned __int8 a8, _DWORD *a9, unsigned int a10, unsigned int a11, BOOL *a12, int **a13)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement");
  }
  unsigned int v21 = 70;
  uint64_t v22 = 4294967293;
  if (a3)
  {
    if (a4)
    {
      if (a5)
      {
        unsigned int v21 = 70;
        uint64_t v22 = 4294967293;
        if ((a9 != 0) == (a10 != 0))
        {
          if (a12)
          {
            uint64_t v22 = verifyAclConstraintInternal(a1, a2, 11, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
            if (v22) {
              unsigned int v21 = 70;
            }
            else {
              unsigned int v21 = 10;
            }
          }
        }
      }
    }
  }
  if (v21 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement", (int)v22);
  }
  return v22;
}

uint64_t LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, void, void), uint64_t a2, const void *a3, unsigned int a4, _OWORD *a5, uint64_t a6, int a7, _OWORD *a8, uint64_t a9)
{
  int v16 = a1;
  v24[1] = *MEMORY[0x263EF8340];
  if (gACMLoggingLevel <= 0xAu) {
    a1 = (uint64_t (*)(uint64_t, uint64_t, void, char *, uint64_t, void, void))printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser");
  }
  BOOL v17 = a4 - 113 < 0xFFFFFF90;
  if (!a3) {
    BOOL v17 = a4 != 0;
  }
  if (v17)
  {
    unsigned int v18 = 70;
    uint64_t v19 = 4294967293;
  }
  else
  {
    unsigned int v18 = 70;
    uint64_t v19 = 4294967293;
    if (a8)
    {
      if (a9 == 16)
      {
        uint64_t v19 = 4294967293;
        if (a5)
        {
          if (a6 == 16)
          {
            uint64_t v20 = a4 + 36;
            MEMORY[0x270FA5388](a1);
            uint64_t v22 = (char *)v24 - ((v21 + 51) & 0x1FFFFFFF0);
            *(_DWORD *)uint64_t v22 = a7;
            *(_OWORD *)(v22 + 4) = *a8;
            *(_OWORD *)(v22 + 20) = *a5;
            if (a3) {
              memcpy(v22 + 36, a3, v21);
            }
            uint64_t v19 = v16(a2, 14, 0, v22, v20, 0, 0);
            if (v19) {
              unsigned int v18 = 70;
            }
            else {
              unsigned int v18 = 10;
            }
          }
        }
      }
    }
  }
  if (v18 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser", (int)v19);
  }
  return v19;
}

uint64_t LibCall_ACMSecSetBuiltinBiometry(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, void, void), uint64_t a2, char a3)
{
  char v9 = a3;
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecSetBuiltinBiometry");
  }
  uint64_t v5 = LibCall_ACMSetEnvironmentVariable(a1, a2, 30, 0, 0, 0, &v9, 1uLL);
  uint64_t v6 = v5;
  if (v5) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  if (v7 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecSetBuiltinBiometry", (int)v5);
  }
  return v6;
}

uint64_t LibCall_ACMSecSetBiometryAvailability(uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, char a3, int a4)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecSetBiometryAvailability");
  }
  char v15 = 0;
  unint64_t v14 = 1;
  char v13 = 0;
  uint64_t v8 = LibCall_ACMGetEnvironmentVariable(a1, a2, 6, (uint64_t)&v15, (uint64_t)&v14);
  if (v8)
  {
    uint64_t v11 = v8;
    unsigned int v9 = 70;
  }
  else
  {
    unsigned int v9 = 70;
    if (v14 > 1)
    {
      uint64_t v11 = 4294967291;
    }
    else
    {
      char v10 = v15 & ~a3;
      if (a4) {
        char v10 = v15 | a3;
      }
      char v13 = v10;
      uint64_t v11 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))a1, a2, 6, 0, 0, 0, &v13, 1uLL);
      if (v11) {
        unsigned int v9 = 70;
      }
      else {
        unsigned int v9 = 10;
      }
    }
  }
  if (v9 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecSetBiometryAvailability", (int)v11);
  }
  return v11;
}

uint64_t LibCall_ACMSecContextGetUnlockSecret(uint64_t (*a1)(void, void, void, void, void, void, void), uint64_t a2, _OWORD *a3, _DWORD *a4, unsigned int a5, void *a6, size_t *a7, unsigned char *a8)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecContextGetUnlockSecret");
  }
  memset(v27, 0, sizeof(v27));
  uint64_t v25 = 64;
  uint64_t v24 = 129;
  if (!a3) {
    goto LABEL_18;
  }
  unsigned int v16 = 70;
  uint64_t v17 = 4294967293;
  if (!a6 || !a7 || !a8) {
    goto LABEL_14;
  }
  if ((a4 != 0) != (a5 != 0))
  {
LABEL_18:
    unsigned int v16 = 70;
    uint64_t v17 = 4294967293;
    goto LABEL_14;
  }
  uint64_t UnlockSecret_Serialize = LibSer_GetUnlockSecret_Serialize(a3, a4, a5, v27, &v25);
  if (UnlockSecret_Serialize
    || (uint64_t UnlockSecret_Serialize = a1(a2, 50, 0, v27, v25, v26, &v24), UnlockSecret_Serialize)
    || (size_t __n = 0,
        __src = 0,
        char v21 = 0,
        uint64_t UnlockSecret_Serialize = LibSer_GetUnlockSecretResponse_Deserialize(v26, v24, &__src, &__n, &v21),
        UnlockSecret_Serialize))
  {
    uint64_t v17 = UnlockSecret_Serialize;
  }
  else
  {
    size_t v19 = __n;
    if (*a7 < __n)
    {
      uint64_t v17 = 4294967276;
    }
    else
    {
      if (__src)
      {
        memcpy(a6, __src, __n);
        uint64_t v17 = 0;
        *a7 = v19;
        *a8 = v21;
        unsigned int v16 = 10;
        goto LABEL_14;
      }
      uint64_t v17 = 4294967291;
    }
  }
  unsigned int v16 = 70;
LABEL_14:
  if (v16 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecContextGetUnlockSecret", (int)v17);
  }
  return v17;
}

uint64_t LibCall_ACMSEPControl(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, unsigned int *, unint64_t *), uint64_t a2, const void *a3, size_t a4, uint64_t a5, _DWORD *a6, unsigned int a7, void *a8, size_t *a9)
{
  __int16 v30 = a8;
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSEPControl");
  }
  unint64_t v33 = 1024;
  uint64_t v34 = 0;
  if (!a1) {
    goto LABEL_17;
  }
  BOOL v16 = a4 - 4097 < 0xFFFFFFFFFFFFF000;
  if (!a3) {
    BOOL v16 = a4 != 0;
  }
  if (v16)
  {
LABEL_17:
    unsigned int v25 = 70;
    uint64_t v24 = 4294967293;
    goto LABEL_21;
  }
  uint64_t Size = LibSer_SEPControl_GetSize(a4, a6, a7, &v34);
  if (Size)
  {
LABEL_18:
    uint64_t v24 = Size;
LABEL_25:
    unsigned int v25 = 70;
    goto LABEL_21;
  }
  uint64_t v18 = a5;
  uint64_t v19 = a2;
  uint64_t v20 = (_OWORD *)MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v29 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = LibSer_SEPControl_Serialize(v20, a6, a7, a3, a4, (uint64_t)v22, &v34);
  if (v23)
  {
    uint64_t v24 = v23;
    goto LABEL_20;
  }
  uint64_t v24 = a1(v19, 51, 0, v22, v34, v35, &v33);
  if (v24)
  {
LABEL_20:
    unsigned int v25 = 70;
    goto LABEL_21;
  }
  unsigned int v25 = 10;
  BOOL v26 = v30;
  if (!v30 || !a9) {
    goto LABEL_21;
  }
  size_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t Size = LibSer_SEPControlResponse_Deserialize(v35, v33, &v32, &v31);
  if (Size) {
    goto LABEL_18;
  }
  size_t v27 = v31;
  if (*a9 < v31)
  {
    uint64_t v24 = 4294967276;
    goto LABEL_25;
  }
  if (v32) {
    memcpy(v26, v32, v31);
  }
  uint64_t v24 = 0;
  *a9 = v27;
  unsigned int v25 = 10;
LABEL_21:
  if (v25 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSEPControl", (int)v24);
  }
  return v24;
}

uint64_t aclRequiresPasscodeInternal(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, int *, uint64_t *), uint64_t a2, const void *a3, unsigned int a4, unsigned char *a5)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v19 = 0;
  uint64_t v18 = 4;
  size_t v10 = a4;
  uint64_t v11 = a4 + 4;
  MEMORY[0x270FA5388](a1);
  uint64_t v12 = (unsigned int *)((char *)&v17 - ((v10 + 19) & 0x1FFFFFFF0));
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "aclRequiresPasscodeInternal");
  }
  unsigned int v13 = 70;
  uint64_t v14 = 4294967293;
  if (a3 && a5)
  {
    *uint64_t v12 = a4;
    memcpy(v12 + 1, a3, v10);
    uint64_t v15 = a1(a2, 17, 0, (char *)&v17 - ((v10 + 19) & 0x1FFFFFFF0), v11, &v19, &v18);
    if (v15)
    {
      uint64_t v14 = v15;
      unsigned int v13 = 70;
    }
    else if (v18 == 4)
    {
      uint64_t v14 = 0;
      *a5 = 1;
      unsigned int v13 = 10;
    }
    else
    {
      unsigned int v13 = 70;
      uint64_t v14 = 4294967291;
    }
  }
  if (v13 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "aclRequiresPasscodeInternal", (int)v14);
  }
  return v14;
}

void LibCall_ACMKernelControl_cold_1()
{
  __assert_rtn("LibCall_ACMKernelControl", "LibCall.c", 373, "commandCursor == commandBuffer + sizeof(commandBuffer)");
}

uint64_t __getPODirectoryServicesClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[POKeyBag isUserKeybagUnlocked](v0);
}

uint64_t __getSOUtilsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[POAgentCoreProcess initWithXPCConnection:identifierProvider:jwksStroageProvider:](v0);
}

uint64_t sub_259E99AD8()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_259E99AE8()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_259E99AF8()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_259E99B08()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_259E99B18()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_259E99B28()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_259E99B38()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_259E99B48()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_259E99B58()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_259E99B68()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_259E99B78()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_259E99B88()
{
  return MEMORY[0x270EF0060]();
}

uint64_t sub_259E99B98()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_259E99BA8()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_259E99BB8()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_259E99BC8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_259E99BD8()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_259E99BE8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_259E99BF8()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_259E99C08()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_259E99C18()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_259E99C28()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_259E99C38()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_259E99C48()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_259E99C58()
{
  return MEMORY[0x270EEA9E8]();
}

uint64_t sub_259E99C68()
{
  return MEMORY[0x270EEAA00]();
}

uint64_t sub_259E99C78()
{
  return MEMORY[0x270EEAA08]();
}

uint64_t sub_259E99C88()
{
  return MEMORY[0x270EEAA18]();
}

uint64_t sub_259E99C98()
{
  return MEMORY[0x270EEAA28]();
}

uint64_t sub_259E99CA8()
{
  return MEMORY[0x270EEAA58]();
}

uint64_t sub_259E99CB8()
{
  return MEMORY[0x270EEAA68]();
}

uint64_t sub_259E99CC8()
{
  return MEMORY[0x270EEAA70]();
}

uint64_t sub_259E99CD8()
{
  return MEMORY[0x270EEAAF0]();
}

uint64_t sub_259E99CE8()
{
  return MEMORY[0x270EEAB00]();
}

uint64_t sub_259E99CF8()
{
  return MEMORY[0x270EEAB10]();
}

uint64_t sub_259E99D08()
{
  return MEMORY[0x270EEAB30]();
}

uint64_t sub_259E99D18()
{
  return MEMORY[0x270EEAB38]();
}

uint64_t sub_259E99D28()
{
  return MEMORY[0x270EEAB40]();
}

uint64_t sub_259E99D38()
{
  return MEMORY[0x270EEAB48]();
}

uint64_t sub_259E99D48()
{
  return MEMORY[0x270EEAB50]();
}

uint64_t sub_259E99D58()
{
  return MEMORY[0x270EEAB58]();
}

uint64_t sub_259E99D68()
{
  return MEMORY[0x270F24E80]();
}

uint64_t sub_259E99D78()
{
  return MEMORY[0x270EEAB90]();
}

uint64_t sub_259E99D88()
{
  return MEMORY[0x270EEAB98]();
}

uint64_t sub_259E99D98()
{
  return MEMORY[0x270EEABD0]();
}

uint64_t sub_259E99DA8()
{
  return MEMORY[0x270EEABD8]();
}

uint64_t sub_259E99DB8()
{
  return MEMORY[0x270EEABF8]();
}

uint64_t sub_259E99DC8()
{
  return MEMORY[0x270EEAC08]();
}

uint64_t sub_259E99DD8()
{
  return MEMORY[0x270EEAC30]();
}

uint64_t sub_259E99DE8()
{
  return MEMORY[0x270EEAC48]();
}

uint64_t sub_259E99DF8()
{
  return MEMORY[0x270EEAC60]();
}

uint64_t sub_259E99E08()
{
  return MEMORY[0x270EEAC88]();
}

uint64_t sub_259E99E18()
{
  return MEMORY[0x270EEACB8]();
}

uint64_t sub_259E99E28()
{
  return MEMORY[0x270EEACC8]();
}

uint64_t sub_259E99E38()
{
  return MEMORY[0x270EEACD8]();
}

uint64_t sub_259E99E48()
{
  return MEMORY[0x270EEAD78]();
}

uint64_t sub_259E99E58()
{
  return MEMORY[0x270EEAD88]();
}

uint64_t sub_259E99E68()
{
  return MEMORY[0x270EEAD90]();
}

uint64_t sub_259E99E78()
{
  return MEMORY[0x270EEAD98]();
}

uint64_t sub_259E99E88()
{
  return MEMORY[0x270EEADA0]();
}

uint64_t sub_259E99E98()
{
  return MEMORY[0x270EEADB0]();
}

uint64_t sub_259E99EA8()
{
  return MEMORY[0x270EEADB8]();
}

uint64_t sub_259E99EB8()
{
  return MEMORY[0x270EEADC0]();
}

uint64_t sub_259E99EC8()
{
  return MEMORY[0x270EEADC8]();
}

uint64_t sub_259E99ED8()
{
  return MEMORY[0x270EEADD0]();
}

uint64_t sub_259E99EE8()
{
  return MEMORY[0x270EEADD8]();
}

uint64_t sub_259E99EF8()
{
  return MEMORY[0x270EEADE0]();
}

uint64_t sub_259E99F08()
{
  return MEMORY[0x270EEADF8]();
}

uint64_t sub_259E99F18()
{
  return MEMORY[0x270EEAE00]();
}

uint64_t sub_259E99F28()
{
  return MEMORY[0x270EEAE08]();
}

uint64_t sub_259E99F38()
{
  return MEMORY[0x270EEAE20]();
}

uint64_t sub_259E99F48()
{
  return MEMORY[0x270EEAE28]();
}

uint64_t sub_259E99F58()
{
  return MEMORY[0x270EEAE30]();
}

uint64_t sub_259E99F68()
{
  return MEMORY[0x270EEAE38]();
}

uint64_t sub_259E99F78()
{
  return MEMORY[0x270EEAE48]();
}

uint64_t sub_259E99F88()
{
  return MEMORY[0x270EEAE50]();
}

uint64_t sub_259E99F98()
{
  return MEMORY[0x270EEAE60]();
}

uint64_t sub_259E99FA8()
{
  return MEMORY[0x270EEAE68]();
}

uint64_t sub_259E99FB8()
{
  return MEMORY[0x270EEAEB0]();
}

uint64_t sub_259E99FC8()
{
  return MEMORY[0x270EEAED8]();
}

uint64_t sub_259E99FD8()
{
  return MEMORY[0x270EEAEF8]();
}

uint64_t sub_259E99FE8()
{
  return MEMORY[0x270EEAF30]();
}

uint64_t sub_259E99FF8()
{
  return MEMORY[0x270EEAF50]();
}

uint64_t sub_259E9A008()
{
  return MEMORY[0x270EEB038]();
}

uint64_t sub_259E9A018()
{
  return MEMORY[0x270EEB040]();
}

uint64_t sub_259E9A028()
{
  return MEMORY[0x270EEB048]();
}

uint64_t sub_259E9A038()
{
  return MEMORY[0x270EEB050]();
}

uint64_t sub_259E9A048()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_259E9A058()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_259E9A068()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_259E9A078()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_259E9A088()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_259E9A098()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_259E9A0A8()
{
  return MEMORY[0x270EF1AB8]();
}

uint64_t sub_259E9A0B8()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_259E9A0C8()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_259E9A0D8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_259E9A0E8()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_259E9A0F8()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_259E9A108()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_259E9A118()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_259E9A128()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_259E9A138()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_259E9A148()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_259E9A158()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_259E9A168()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_259E9A178()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_259E9A188()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_259E9A198()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_259E9A1A8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_259E9A1B8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_259E9A1C8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_259E9A1D8()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_259E9A1E8()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_259E9A1F8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_259E9A208()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_259E9A218()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_259E9A228()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_259E9A248()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_259E9A258()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_259E9A268()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x270ED7910]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x270ED7918]();
}

uint64_t CCRandomCopyBytes()
{
  return MEMORY[0x270ED7A78]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x270EE42A8]();
}

void CFAllocatorSetDefault(CFAllocatorRef allocator)
{
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

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E8](allocator, capacity, theData);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
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

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
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

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x270EE50A0](alloc, theString, *(void *)&encoding, lossByte);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x270EF3F78](*(void *)&connect, *(void *)&type, *(void *)&port, reference);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x270EF49E8](*(void *)&mainPort, path);
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

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t SecAccessConstraintCreateBiometryAny()
{
  return MEMORY[0x270EFD608]();
}

uint64_t SecAccessConstraintCreateBiometryCurrentSet()
{
  return MEMORY[0x270EFD610]();
}

uint64_t SecAccessConstraintCreateCompanion()
{
  return MEMORY[0x270EFD618]();
}

uint64_t SecAccessConstraintCreateKofN()
{
  return MEMORY[0x270EFD620]();
}

uint64_t SecAccessControlAddConstraintForOperation()
{
  return MEMORY[0x270EFD628]();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x270EFD650](allocator, protection, flags, error);
}

uint64_t SecAccessControlGetConstraint()
{
  return MEMORY[0x270EFD658]();
}

uint64_t SecAccessControlSetConstraints()
{
  return MEMORY[0x270EFD670]();
}

uint64_t SecAccessControlSetProtection()
{
  return MEMORY[0x270EFD678]();
}

uint64_t SecCFAllocatorZeroize()
{
  return MEMORY[0x270EFD6B8]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x270EFD710](certificate);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x270EFD758](certificate);
}

uint64_t SecCertificateCopyPublicKeySHA1Digest()
{
  return MEMORY[0x270EFD788]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x270EFD7E0](allocator, data);
}

uint64_t SecGenerateSelfSignedCertificate()
{
  return MEMORY[0x270EFD940]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x270EFD948](identityRef, certificateRef);
}

OSStatus SecIdentityCopyPrivateKey(SecIdentityRef identityRef, SecKeyRef *privateKeyRef)
{
  return MEMORY[0x270EFD950](identityRef, privateKeyRef);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x270EFD970](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x270EFD980](query);
}

CFDictionaryRef SecKeyCopyAttributes(SecKeyRef key)
{
  return (CFDictionaryRef)MEMORY[0x270EFD998](key);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFD9B0](key, error);
}

CFDataRef SecKeyCopyKeyExchangeResult(SecKeyRef privateKey, SecKeyAlgorithm algorithm, SecKeyRef publicKey, CFDictionaryRef parameters, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFD9B8](privateKey, algorithm, publicKey, parameters, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x270EFD9D8](key);
}

CFDataRef SecKeyCreateDecryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef ciphertext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFD9F8](key, algorithm, ciphertext, error);
}

uint64_t SecKeyCreateDecryptedDataWithParameters()
{
  return MEMORY[0x270EFDA00]();
}

CFDataRef SecKeyCreateEncryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef plaintext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFDA10](key, algorithm, plaintext, error);
}

uint64_t SecKeyCreateEncryptedDataWithParameters()
{
  return MEMORY[0x270EFDA18]();
}

uint64_t SecKeyCreateRSAPublicKey()
{
  return MEMORY[0x270EFDA38]();
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA40](parameters, error);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFDA50](key, algorithm, dataToSign, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA60](keyData, attributes, error);
}

Boolean SecKeyIsAlgorithmSupported(SecKeyRef key, SecKeyOperationType operation, SecKeyAlgorithm algorithm)
{
  return MEMORY[0x270EFDAA8](key, operation, algorithm);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x270EFDAC8](key, algorithm, signedData, signature, error);
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x270EFDB48]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x270EFDC20](rnd, count, bytes);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x270EFDCF8](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x270EFDD40](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x270EFDD60](trust, error);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x270EFDDA8](trust, anchorCertificates);
}

OSStatus SecTrustSetAnchorCertificatesOnly(SecTrustRef trust, Boolean anchorCertificatesOnly)
{
  return MEMORY[0x270EFDDB8](trust, anchorCertificatesOnly);
}

uint64_t SecTrustStoreContains()
{
  return MEMORY[0x270EFDE00]();
}

uint64_t SecTrustStoreForDomain()
{
  return MEMORY[0x270EFDE18]();
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

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x270ED87B0](__count, __size);
}

uint64_t cc_clear()
{
  return MEMORY[0x270ED87D0]();
}

uint64_t ccaes_cbc_decrypt_mode()
{
  return MEMORY[0x270ED87E0]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x270ED87E8]();
}

uint64_t cccbc_clear_iv()
{
  return MEMORY[0x270ED8820]();
}

uint64_t cccbc_init()
{
  return MEMORY[0x270ED8828]();
}

uint64_t cccurve25519()
{
  return MEMORY[0x270ED8868]();
}

uint64_t cccurve25519_make_pub()
{
  return MEMORY[0x270ED8878]();
}

uint64_t ccder_blob_decode_len()
{
  return MEMORY[0x270ED8890]();
}

uint64_t ccder_blob_decode_range()
{
  return MEMORY[0x270ED88A0]();
}

uint64_t ccder_blob_decode_sequence_tl()
{
  return MEMORY[0x270ED88A8]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x270ED88B0]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x270ED88B8]();
}

uint64_t ccder_blob_encode_body()
{
  return MEMORY[0x270ED88C8]();
}

uint64_t ccder_blob_encode_body_tl()
{
  return MEMORY[0x270ED88D0]();
}

uint64_t ccder_blob_encode_implicit_raw_octet_string()
{
  return MEMORY[0x270ED88D8]();
}

uint64_t ccder_blob_encode_implicit_uint64()
{
  return MEMORY[0x270ED88E0]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x270ED88E8]();
}

uint64_t ccder_decode_sequence_tl()
{
  return MEMORY[0x270ED8920]();
}

uint64_t ccder_decode_tl()
{
  return MEMORY[0x270ED8930]();
}

uint64_t ccder_encode_constructed_tl()
{
  return MEMORY[0x270ED8950]();
}

uint64_t ccder_encode_raw_octet_string()
{
  return MEMORY[0x270ED8968]();
}

uint64_t ccder_encode_uint64()
{
  return MEMORY[0x270ED8978]();
}

uint64_t ccder_sizeof()
{
  return MEMORY[0x270ED8980]();
}

uint64_t ccder_sizeof_implicit_uint64()
{
  return MEMORY[0x270ED8990]();
}

uint64_t ccder_sizeof_raw_octet_string()
{
  return MEMORY[0x270ED89B0]();
}

uint64_t ccder_sizeof_uint64()
{
  return MEMORY[0x270ED89C0]();
}

uint64_t ccdigest()
{
  return MEMORY[0x270ED8A40]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x270ED8AB8]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x270ED8AD8]();
}

uint64_t cchkdf()
{
  return MEMORY[0x270ED8BA8]();
}

uint64_t cchmac()
{
  return MEMORY[0x270ED8BC0]();
}

uint64_t ccn_read_uint()
{
  return MEMORY[0x270ED8C40]();
}

uint64_t ccn_write_uint_padded()
{
  return MEMORY[0x270ED8C60]();
}

uint64_t ccpbkdf2_hmac()
{
  return MEMORY[0x270ED8C88]();
}

uint64_t ccrng()
{
  return MEMORY[0x270ED8C90]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x270ED8D70]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x270ED8E70]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
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

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

int fts_close(FTS *a1)
{
  return MEMORY[0x270ED9B48](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x270ED9B50](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x270ED9B60](a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x270ED9B68](a1, a2, *(void *)&a3);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
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

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x270EDA4B8](__s, __smax, *(void *)&__c, __n);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x270EDA830](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
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

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int putchar(int a1)
{
  return MEMORY[0x270EDB090](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x270EDB170](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x270EDB570](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x270EDB660](__big, __little, __len);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x270EDBA08](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}

xmlBufferPtr xmlBufferCreate(void)
{
  return (xmlBufferPtr)MEMORY[0x270F9BB48]();
}

void xmlBufferFree(xmlBufferPtr buf)
{
}

xmlNodePtr xmlDocGetRootElement(const xmlDoc *doc)
{
  return (xmlNodePtr)MEMORY[0x270F9BC50](doc);
}

void xmlFreeDoc(xmlDocPtr cur)
{
}

void xmlFreeNs(xmlNsPtr cur)
{
}

xmlChar *__cdecl xmlGetProp(const xmlNode *node, const xmlChar *name)
{
  return (xmlChar *)MEMORY[0x270F9BD30](node, name);
}

int xmlNodeDump(xmlBufferPtr buf, xmlDocPtr doc, xmlNodePtr cur, int level, int format)
{
  return MEMORY[0x270F9BF18](buf, doc, cur, *(void *)&level, *(void *)&format);
}

xmlChar *__cdecl xmlNodeGetContent(const xmlNode *cur)
{
  return (xmlChar *)MEMORY[0x270F9BF30](cur);
}

xmlDocPtr xmlParseMemory(const char *buffer, int size)
{
  return (xmlDocPtr)MEMORY[0x270F9BFA8](buffer, *(void *)&size);
}

xmlNsPtr xmlSearchNsByHref(xmlDocPtr doc, xmlNodePtr node, const xmlChar *href)
{
  return (xmlNsPtr)MEMORY[0x270F9C0C8](doc, node, href);
}

const xmlChar *__cdecl xmlStrchr(const xmlChar *str, xmlChar val)
{
  return (const xmlChar *)MEMORY[0x270F9C130](str, val);
}

xmlChar *__cdecl xmlStrdup(const xmlChar *cur)
{
  return (xmlChar *)MEMORY[0x270F9C140](cur);
}

xmlXPathObjectPtr xmlXPathEvalExpression(const xmlChar *str, xmlXPathContextPtr ctxt)
{
  return (xmlXPathObjectPtr)MEMORY[0x270F9C3D8](str, ctxt);
}

void xmlXPathFreeContext(xmlXPathContextPtr ctxt)
{
}

void xmlXPathFreeObject(xmlXPathObjectPtr obj)
{
}

xmlXPathContextPtr xmlXPathNewContext(xmlDocPtr doc)
{
  return (xmlXPathContextPtr)MEMORY[0x270F9C458](doc);
}

xmlXPathObjectPtr xmlXPathNodeEval(xmlNodePtr node, const xmlChar *str, xmlXPathContextPtr ctx)
{
  return (xmlXPathObjectPtr)MEMORY[0x270F9C498](node, str, ctx);
}

int xmlXPathRegisterNs(xmlXPathContextPtr ctxt, const xmlChar *prefix, const xmlChar *ns_uri)
{
  return MEMORY[0x270F9C538](ctxt, prefix, ns_uri);
}