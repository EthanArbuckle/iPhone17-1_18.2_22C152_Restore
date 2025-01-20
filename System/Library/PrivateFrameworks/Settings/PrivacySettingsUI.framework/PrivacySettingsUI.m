void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1E4AD9A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4AD9DE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  objc_destroyWeak(v12);
  objc_destroyWeak((id *)(v13 - 112));
  _Unwind_Resume(a1);
}

void sub_1E4AD9F20(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E4ADB25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose((const void *)(v29 - 152), 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

Class __getSFSafariViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SafariServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SafariServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E9C818;
    uint64_t v6 = 0;
    SafariServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!SafariServicesLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("SFSafariViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getSFSafariViewControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSFSafariViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SafariServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SafariServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAKAccountManagerClass_block_invoke(uint64_t a1)
{
  AuthKitLibrary();
  Class result = objc_getClass("AKAccountManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAKAccountManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAKAccountManagerClass_block_invoke_cold_1();
    return (Class)AuthKitLibrary();
  }
  return result;
}

uint64_t AuthKitLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AuthKitLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __AuthKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E6E9C850;
    uint64_t v5 = 0;
    AuthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = AuthKitLibraryCore_frameworkLibrary;
  v1 = (void *)v3[0];
  if (!AuthKitLibraryCore_frameworkLibrary)
  {
    v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __AuthKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AuthKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAKDeviceListRequestContextClass_block_invoke(uint64_t a1)
{
  AuthKitLibrary();
  Class result = objc_getClass("AKDeviceListRequestContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAKDeviceListRequestContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getAKDeviceListRequestContextClass_block_invoke_cold_1();
    return (Class)__getAKServiceNameiCloudSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getAKServiceNameiCloudSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AuthKitLibrary();
  Class result = dlsym(v2, "AKServiceNameiCloud");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAKServiceNameiCloudSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

PUILockdownModeOnboardingCell *__getAKAppleIDAuthenticationControllerClass_block_invoke(uint64_t a1)
{
  AuthKitLibrary();
  Class result = (PUILockdownModeOnboardingCell *)objc_getClass("AKAppleIDAuthenticationController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAKAppleIDAuthenticationControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (PUILockdownModeOnboardingCell *)__getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1();
    return [(PUILockdownModeOnboardingCell *)v3 initWithStyle:v5 reuseIdentifier:v6];
  }
  return result;
}

void sub_1E4ADC208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getLockdownModeManagerClass()
{
  uint64_t v4 = 0;
  int64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getLockdownModeManagerClass_softClass;
  uint64_t v7 = getLockdownModeManagerClass_softClass;
  if (!getLockdownModeManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getLockdownModeManagerClass_block_invoke;
    v3[3] = &unk_1E6E9C7F8;
    v3[4] = &v4;
    __getLockdownModeManagerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E4ADC34C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_WKSystemPreferencesClass()
{
  uint64_t v4 = 0;
  int64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)get_WKSystemPreferencesClass_softClass;
  uint64_t v7 = get_WKSystemPreferencesClass_softClass;
  if (!get_WKSystemPreferencesClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __get_WKSystemPreferencesClass_block_invoke;
    v3[3] = &unk_1E6E9C7F8;
    v3[4] = &v4;
    __get_WKSystemPreferencesClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E4ADC5FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUMUserManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!UserManagementLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __UserManagementLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E9C890;
    uint64_t v6 = 0;
    UserManagementLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!UserManagementLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("UMUserManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getUMUserManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getUMUserManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __UserManagementLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UserManagementLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getLockdownModeManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!LockdownModeLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __LockdownModeLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E9C8A8;
    uint64_t v6 = 0;
    LockdownModeLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!LockdownModeLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("LockdownModeManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getLockdownModeManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getLockdownModeManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __LockdownModeLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LockdownModeLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __WebKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  WebKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1E4ADD8FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
}

void *__getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __SpringBoardServicesLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E6E9C920;
    uint64_t v7 = 0;
    SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    v2 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
    if (SpringBoardServicesLibraryCore_frameworkLibrary)
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
  v2 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "SBSCopyDisplayIdentifiers");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBSCopyDisplayIdentifiersSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpringBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpringBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1E4ADE2F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4ADE4A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1E4ADE778(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1E4ADEAA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E4ADED58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getFKBankConnectOfflineLabConsentCoordinatorClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!FinanceKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __FinanceKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E9CA28;
    uint64_t v6 = 0;
    FinanceKitLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!FinanceKitLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("FKBankConnectOfflineLabConsentCoordinator");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getFKBankConnectOfflineLabConsentCoordinatorClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getFKBankConnectOfflineLabConsentCoordinatorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

uint64_t __FinanceKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FinanceKitLibraryCore_frameworkLibrary = result;
  return result;
}

id getAMSAcknowledgePrivacyTaskClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAMSAcknowledgePrivacyTaskClass_softClass;
  uint64_t v7 = getAMSAcknowledgePrivacyTaskClass_softClass;
  if (!getAMSAcknowledgePrivacyTaskClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAMSAcknowledgePrivacyTaskClass_block_invoke;
    v3[3] = &unk_1E6E9C7F8;
    v3[4] = &v4;
    __getAMSAcknowledgePrivacyTaskClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E4ADF280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getOBPrivacyImproveFitnessPlusIdentifier()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = (void **)getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr;
  uint64_t v9 = getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr;
  if (!getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_block_invoke;
    v5[3] = &unk_1E6E9C7F8;
    v5[4] = &v6;
    __getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_block_invoke((uint64_t)v5);
    uint64_t v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v0)
  {
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
    uint64_t v4 = v3;
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v4);
  }
  id v1 = *v0;
  return v1;
}

void sub_1E4ADF704(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

Class __getAMSAcknowledgePrivacyTaskClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AppleMediaServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __AppleMediaServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6E9CA90;
    uint64_t v5 = 0;
    AppleMediaServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AppleMediaServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getAMSAcknowledgePrivacyTaskClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("AMSAcknowledgePrivacyTask");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getAMSAcknowledgePrivacyTaskClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppleMediaServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleMediaServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!OnBoardingKitLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __OnBoardingKitLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    void v5[5] = v5;
    long long v6 = xmmword_1E6E9CAA8;
    uint64_t v7 = 0;
    OnBoardingKitLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)OnBoardingKitLibraryCore_frameworkLibrary;
    if (OnBoardingKitLibraryCore_frameworkLibrary)
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
  uint64_t v2 = (void *)OnBoardingKitLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "OBPrivacyImproveFitnessPlusIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __OnBoardingKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  OnBoardingKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getASDSubscriptionEntitlementsClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AppStoreDaemonLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __AppStoreDaemonLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6E9CAC0;
    uint64_t v5 = 0;
    AppStoreDaemonLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AppStoreDaemonLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getASDSubscriptionEntitlementsClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("ASDSubscriptionEntitlements");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getASDSubscriptionEntitlementsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppStoreDaemonLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppStoreDaemonLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1E4AE0624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
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

void sub_1E4AE1984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

uint64_t getDRGetAllLogFileURLsSymbolLoc()
{
  uint64_t v3 = 0;
  long long v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getDRGetAllLogFileURLsSymbolLoc_ptr;
  uint64_t v6 = getDRGetAllLogFileURLsSymbolLoc_ptr;
  if (!getDRGetAllLogFileURLsSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __getDRGetAllLogFileURLsSymbolLoc_block_invoke;
    v2[3] = &unk_1E6E9C7F8;
    v2[4] = &v3;
    __getDRGetAllLogFileURLsSymbolLoc_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1E4AE1A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4AE1CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getOBPrivacyPresenterClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getOBPrivacyPresenterClass_softClass;
  uint64_t v7 = getOBPrivacyPresenterClass_softClass;
  if (!getOBPrivacyPresenterClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getOBPrivacyPresenterClass_block_invoke;
    v3[3] = &unk_1E6E9C7F8;
    v3[4] = &v4;
    __getOBPrivacyPresenterClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E4AE2D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAKAppleIDAuthenticationControllerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAKAppleIDAuthenticationControllerClass_softClass_0;
  uint64_t v7 = getAKAppleIDAuthenticationControllerClass_softClass_0;
  if (!getAKAppleIDAuthenticationControllerClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAKAppleIDAuthenticationControllerClass_block_invoke_0;
    v3[3] = &unk_1E6E9C7F8;
    v3[4] = &v4;
    __getAKAppleIDAuthenticationControllerClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E4AE3778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4AE3A8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getNRPairedDeviceRegistryClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getNRPairedDeviceRegistryClass_softClass;
  uint64_t v7 = getNRPairedDeviceRegistryClass_softClass;
  if (!getNRPairedDeviceRegistryClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getNRPairedDeviceRegistryClass_block_invoke;
    v3[3] = &unk_1E6E9C7F8;
    v3[4] = &v4;
    __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E4AE41F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4AE5354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4AE54E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak((id *)(v17 - 56));
  _Unwind_Resume(a1);
}

void sub_1E4AE56B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4AE5D64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4AE5F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4AE70C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4AE764C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4AE8170(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4AE8374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4AE85DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E4AE880C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getHealthAppAnalyticsStoreClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getHealthAppAnalyticsStoreClass_softClass;
  uint64_t v7 = getHealthAppAnalyticsStoreClass_softClass;
  if (!getHealthAppAnalyticsStoreClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getHealthAppAnalyticsStoreClass_block_invoke;
    v3[3] = &unk_1E6E9C7F8;
    v3[4] = &v4;
    __getHealthAppAnalyticsStoreClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E4AE8D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4AE920C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4AE93D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  _Block_object_dispose((const void *)(v17 - 80), 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4AE96F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E4AE9B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  _Block_object_dispose((const void *)(v17 - 96), 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PSGEOVisualLocalizationCrowdsourcingIsAllowed()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(void))getGEOVisualLocalizationCrowdsourcingIsAllowedSymbolLoc_ptr;
  uint64_t v8 = getGEOVisualLocalizationCrowdsourcingIsAllowedSymbolLoc_ptr;
  if (!getGEOVisualLocalizationCrowdsourcingIsAllowedSymbolLoc_ptr)
  {
    id v1 = (void *)GeoServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "GEOVisualLocalizationCrowdsourcingIsAllowed");
    getGEOVisualLocalizationCrowdsourcingIsAllowedSymbolLoc_ptr = (_UNKNOWN *)v6[3];
    uint64_t v0 = (uint64_t (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
    uint64_t v4 = v3;
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  return v0();
}

void *__getOSAGetSubmittableLogsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!CrashReporterSupportLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __CrashReporterSupportLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    void v5[5] = v5;
    long long v6 = xmmword_1E6E9D018;
    uint64_t v7 = 0;
    CrashReporterSupportLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)CrashReporterSupportLibraryCore_frameworkLibrary;
    if (CrashReporterSupportLibraryCore_frameworkLibrary)
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
  uint64_t v2 = (void *)CrashReporterSupportLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "OSAGetSubmittableLogs");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getOSAGetSubmittableLogsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CrashReporterSupportLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CrashReporterSupportLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getRTCReportingClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!RTCReportingLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __RTCReportingLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E9D030;
    uint64_t v6 = 0;
    RTCReportingLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!RTCReportingLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("RTCReporting");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getRTCReportingClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getRTCReportingClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __RTCReportingLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  RTCReportingLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCloudTelemetryReporterClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CloudTelemetryLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CloudTelemetryLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E9D048;
    uint64_t v6 = 0;
    CloudTelemetryLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!CloudTelemetryLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("CloudTelemetryReporter");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getCloudTelemetryReporterClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCloudTelemetryReporterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CloudTelemetryLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CloudTelemetryLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAATransparencyLoggingClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AppAnalyticsLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __AppAnalyticsLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E9D060;
    uint64_t v6 = 0;
    AppAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!AppAnalyticsLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("AATransparencyLogging");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getAATransparencyLoggingClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAATransparencyLoggingClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppAnalyticsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppAnalyticsLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __DifferentialPrivacyLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DifferentialPrivacyLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getDESSubmissionLogFileURLsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!DistributedEvaluationLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __DistributedEvaluationLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    void v5[5] = v5;
    long long v6 = xmmword_1E6E9D090;
    uint64_t v7 = 0;
    DistributedEvaluationLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)DistributedEvaluationLibraryCore_frameworkLibrary;
    if (DistributedEvaluationLibraryCore_frameworkLibrary)
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
  uint64_t v2 = (void *)DistributedEvaluationLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "DESSubmissionLogFileURLs");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getDESSubmissionLogFileURLsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __DistributedEvaluationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DistributedEvaluationLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getSPMLLoggingClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SearchLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SearchLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E9D0A8;
    uint64_t v6 = 0;
    SearchLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!SearchLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("SPMLLogging");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getSPMLLoggingClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSPMLLoggingClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SearchLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SearchLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getPLDiagnosticsClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!PhotoLibraryServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __PhotoLibraryServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E9D0C0;
    uint64_t v6 = 0;
    PhotoLibraryServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!PhotoLibraryServicesLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("PLDiagnostics");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getPLDiagnosticsClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPLDiagnosticsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PhotoLibraryServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotoLibraryServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getSDRGetAllLogFileURLsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!SymptomDiagnosticReporterLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __SymptomDiagnosticReporterLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    void v5[5] = v5;
    long long v6 = xmmword_1E6E9D0D8;
    uint64_t v7 = 0;
    SymptomDiagnosticReporterLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)SymptomDiagnosticReporterLibraryCore_frameworkLibrary;
    if (SymptomDiagnosticReporterLibraryCore_frameworkLibrary)
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
  uint64_t v2 = (void *)SymptomDiagnosticReporterLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "SDRGetAllLogFileURLs");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSDRGetAllLogFileURLsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SymptomDiagnosticReporterLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SymptomDiagnosticReporterLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getDRGetAllLogFileURLsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!DiagnosticRequestLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __DiagnosticRequestLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    void v5[5] = v5;
    long long v6 = xmmword_1E6E9D0F0;
    uint64_t v7 = 0;
    DiagnosticRequestLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)DiagnosticRequestLibraryCore_frameworkLibrary;
    if (DiagnosticRequestLibraryCore_frameworkLibrary)
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
  uint64_t v2 = (void *)DiagnosticRequestLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "DRGetAllLogFileURLs");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getDRGetAllLogFileURLsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __DiagnosticRequestLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DiagnosticRequestLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getPLDatabaseReaderClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!PowerlogDatabaseReaderLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __PowerlogDatabaseReaderLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E9D108;
    uint64_t v6 = 0;
    PowerlogDatabaseReaderLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!PowerlogDatabaseReaderLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("PLDatabaseReader");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getPLDatabaseReaderClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPLDatabaseReaderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PowerlogDatabaseReaderLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PowerlogDatabaseReaderLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __iOSDiagnosticsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  iOSDiagnosticsLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getOBPrivacyPresenterClass_block_invoke(uint64_t a1)
{
  OnBoardingKitLibrary();
  Class result = objc_getClass("OBPrivacyPresenter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getOBPrivacyPresenterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getOBPrivacyPresenterClass_block_invoke_cold_1();
    return (Class)OnBoardingKitLibrary();
  }
  return result;
}

uint64_t OnBoardingKitLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!OnBoardingKitLibraryCore_frameworkLibrary_0)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __OnBoardingKitLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6E9D138;
    uint64_t v5 = 0;
    OnBoardingKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = OnBoardingKitLibraryCore_frameworkLibrary_0;
  id v1 = (void *)v3[0];
  if (!OnBoardingKitLibraryCore_frameworkLibrary_0)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __OnBoardingKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  OnBoardingKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getOBPrivacyImproveSiriIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)OnBoardingKitLibrary();
  uint64_t result = dlsym(v2, "OBPrivacyImproveSiriIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getOBPrivacyImproveSiriIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v2 = (void *)OnBoardingKitLibrary();
  uint64_t result = dlsym(v2, "OBPrivacyImproveFitnessPlusIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSFSafariViewControllerClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SafariServicesLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SafariServicesLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E9D150;
    uint64_t v6 = 0;
    SafariServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!SafariServicesLibraryCore_frameworkLibrary_0)
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
    Class result = objc_getClass("SFSafariViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getSFSafariViewControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSFSafariViewControllerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SafariServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SafariServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getGEOVisualLocalizationCrowdsourcingLearnMoreURLSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)GeoServicesLibrary();
  uint64_t result = dlsym(v2, "GEOVisualLocalizationCrowdsourcingLearnMoreURL");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getGEOVisualLocalizationCrowdsourcingLearnMoreURLSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                + 24);
  return result;
}

uint64_t GeoServicesLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!GeoServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __GeoServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6E9D168;
    uint64_t v5 = 0;
    GeoServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = GeoServicesLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!GeoServicesLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __GeoServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  GeoServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAKAppleIDAuthenticationControllerClass_block_invoke_0(uint64_t a1)
{
  AuthKitLibrary_0();
  Class result = objc_getClass("AKAppleIDAuthenticationController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAKAppleIDAuthenticationControllerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1();
    return (Class)AuthKitLibrary_0();
  }
  return result;
}

uint64_t AuthKitLibrary_0()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AuthKitLibraryCore_frameworkLibrary_0)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __AuthKitLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6E9D180;
    uint64_t v5 = 0;
    AuthKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = AuthKitLibraryCore_frameworkLibrary_0;
  id v1 = (void *)v3[0];
  if (!AuthKitLibraryCore_frameworkLibrary_0)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __AuthKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  AuthKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getNRPairedDeviceRegistryClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!NanoRegistryLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __NanoRegistryLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E9D198;
    uint64_t v6 = 0;
    NanoRegistryLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!NanoRegistryLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("NRPairedDeviceRegistry");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getNRPairedDeviceRegistryClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getNRPairedDeviceRegistryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __NanoRegistryLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoRegistryLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __DiskSpaceDiagnosticsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DiskSpaceDiagnosticsLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAFSettingsConnectionClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __AssistantServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E9D1C8;
    uint64_t v6 = 0;
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!AssistantServicesLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("AFSettingsConnection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getAFSettingsConnectionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAFSettingsConnectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AssistantServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getGEOVisualLocalizationCrowdsourcingIsSupportedSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)GeoServicesLibrary();
  uint64_t result = dlsym(v2, "GEOVisualLocalizationCrowdsourcingIsSupported");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getGEOVisualLocalizationCrowdsourcingIsSupportedSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                               + 24);
  return result;
}

void *__getAKAuthenticationSecurityLevelKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AuthKitLibrary_0();
  uint64_t result = dlsym(v2, "AKAuthenticationSecurityLevelKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAKAuthenticationSecurityLevelKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAKAuthenticationIsUnderageKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AuthKitLibrary_0();
  uint64_t result = dlsym(v2, "AKAuthenticationIsUnderageKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAKAuthenticationIsUnderageKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAKAuthenticationIsLegacyStudentKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AuthKitLibrary_0();
  uint64_t result = dlsym(v2, "AKAuthenticationIsLegacyStudentKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAKAuthenticationIsLegacyStudentKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCIDVUIIdentityProofingDataSharingFlowManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CoreIDVUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CoreIDVUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E9D1E0;
    uint64_t v6 = 0;
    CoreIDVUILibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!CoreIDVUILibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("CIDVUIIdentityProofingDataSharingFlowManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getCIDVUIIdentityProofingDataSharingFlowManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCIDVUIIdentityProofingDataSharingFlowManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                             + 24);
  return result;
}

uint64_t __CoreIDVUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreIDVUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getHealthAppAnalyticsStoreClass_block_invoke(uint64_t a1)
{
  HealthAppServicesLibrary();
  Class result = objc_getClass("HealthAppAnalyticsStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHealthAppAnalyticsStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHealthAppAnalyticsStoreClass_block_invoke_cold_1();
    return (Class)HealthAppServicesLibrary();
  }
  return result;
}

uint64_t HealthAppServicesLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!HealthAppServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __HealthAppServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6E9D1F8;
    uint64_t v5 = 0;
    HealthAppServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = HealthAppServicesLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!HealthAppServicesLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __HealthAppServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HealthAppServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getHealthAppAnalyticsAgreementImproveHealthAndAnalyticsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HealthAppServicesLibrary();
  uint64_t result = dlsym(v2, "HealthAppAnalyticsAgreementImproveHealthAndAnalytics");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHealthAppAnalyticsAgreementImproveHealthAndAnalyticsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                               + 8)
                                                                                   + 24);
  return result;
}

void __getHKHealthStoreClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("HKHealthStore");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKHealthStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHKHealthStoreClass_block_invoke_cold_1();
    HealthKitLibrary();
  }
}

void HealthKitLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!HealthKitLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __HealthKitLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6E9D210;
    uint64_t v3 = 0;
    HealthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!HealthKitLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __HealthKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getHKHealthRecordsStoreClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary();
  Class result = objc_getClass("HKHealthRecordsStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKHealthRecordsStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKHealthRecordsStoreClass_block_invoke_cold_1();
    return (Class)__getHealthAppAnalyticsAgreementImproveHealthRecordsSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getHealthAppAnalyticsAgreementImproveHealthRecordsSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)HealthAppServicesLibrary();
  Class result = dlsym(v2, "HealthAppAnalyticsAgreementImproveHealthRecords");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHealthAppAnalyticsAgreementImproveHealthRecordsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 24);
  return result;
}

void *__getGEOVisualLocalizationCrowdsourcingIsAllowedSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)GeoServicesLibrary();
  Class result = dlsym(v2, "GEOVisualLocalizationCrowdsourcingIsAllowed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getGEOVisualLocalizationCrowdsourcingIsAllowedSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                             + 24);
  return result;
}

void *__getGEOVisualLocalizationCrowdsourcingSetEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)GeoServicesLibrary();
  Class result = dlsym(v2, "GEOVisualLocalizationCrowdsourcingSetEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getGEOVisualLocalizationCrowdsourcingSetEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 24);
  return result;
}

void *__getGEOVisualLocalizationCrowdsourcingIsEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)GeoServicesLibrary();
  Class result = dlsym(v2, "GEOVisualLocalizationCrowdsourcingIsEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getGEOVisualLocalizationCrowdsourcingIsEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                             + 24);
  return result;
}

id getPSUIDeviceTakeOverControllerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPSUIDeviceTakeOverControllerClass_softClass;
  uint64_t v7 = getPSUIDeviceTakeOverControllerClass_softClass;
  if (!getPSUIDeviceTakeOverControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPSUIDeviceTakeOverControllerClass_block_invoke;
    v3[3] = &unk_1E6E9C7F8;
    v3[4] = &v4;
    __getPSUIDeviceTakeOverControllerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E4AEDDE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPSUIDeviceTakeOverControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!PreferencesUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __PreferencesUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E9D228;
    uint64_t v6 = 0;
    PreferencesUILibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!PreferencesUILibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("PSUIDeviceTakeOverController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getPSUIDeviceTakeOverControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPSUIDeviceTakeOverControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PreferencesUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PreferencesUILibraryCore_frameworkLibrary = result;
  return result;
}

id PUI_LocalizedStringForRestrictions(void *a1)
{
  id v1 = a1;
  long long v2 = PUI_BundleForPrivacySettingsFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"Restrictions"];

  return v3;
}

id PUI_BundleForPrivacySettingsFramework()
{
  if (PUI_BundleForPrivacySettingsFramework_onceToken != -1) {
    dispatch_once(&PUI_BundleForPrivacySettingsFramework_onceToken, &__block_literal_global_1);
  }
  uint64_t v0 = (void *)PUI_BundleForPrivacySettingsFramework__privacySettingsFrameworkBundle;
  return v0;
}

id PUI_LocalizedStringForLocationServices(void *a1)
{
  id v1 = a1;
  long long v2 = PUI_BundleForPrivacySettingsFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"Location Services"];

  return v3;
}

id PUI_LocalizedStringForLocationServicesPrivacy(void *a1)
{
  id v1 = a1;
  long long v2 = PUI_BundleForPrivacySettingsFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"LocationServicesPrivacy"];

  return v3;
}

id PUI_LocalizedStringForPrivacy(void *a1)
{
  id v1 = a1;
  long long v2 = PUI_BundleForPrivacySettingsFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"Privacy"];

  return v3;
}

id PUI_LocalizedStringForAlmanac(void *a1)
{
  id v1 = a1;
  long long v2 = PUI_BundleForPrivacySettingsFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"Almanac-ALMANAC"];

  return v3;
}

id PUI_LocalizedStringForDimSum(void *a1)
{
  id v1 = a1;
  long long v2 = PUI_BundleForPrivacySettingsFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"Dim-Sum"];

  return v3;
}

id PUI_LocalizedStringForAdSupport(void *a1)
{
  id v1 = a1;
  long long v2 = PUI_BundleForPrivacySettingsFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"AppleAdvertising"];

  return v3;
}

id PUI_LocalizedStringForTrackers(void *a1)
{
  id v1 = a1;
  long long v2 = PUI_BundleForPrivacySettingsFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"Trackers"];

  return v3;
}

id PUI_LocalizedStringForAppReport(void *a1)
{
  id v1 = a1;
  long long v2 = PUI_BundleForPrivacySettingsFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"AppReport"];

  return v3;
}

id PUI_LocalizedStringForLockdownMode(void *a1)
{
  id v1 = a1;
  long long v2 = PUI_BundleForPrivacySettingsFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"LockdownMode"];

  return v3;
}

id PUI_LocalizedStringForSafety(void *a1)
{
  id v1 = a1;
  long long v2 = PUI_BundleForPrivacySettingsFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"Safety"];

  return v3;
}

id PUI_LocalizedStringForProblemReporting(void *a1)
{
  id v1 = a1;
  long long v2 = PUI_BundleForPrivacySettingsFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"ProblemReporting"];

  return v3;
}

id PUI_LocalizedStringForProblemReportingCinnamon(void *a1)
{
  id v1 = a1;
  long long v2 = PUI_BundleForPrivacySettingsFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"ProblemReporting-Cinnamon"];

  return v3;
}

id PUI_LocalizedStringForProblemReportingBankConnect(void *a1)
{
  id v1 = a1;
  long long v2 = PUI_BundleForPrivacySettingsFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"ProblemReporting-BankConnect"];

  return v3;
}

id PUI_RebrandedKeyForAppleID(void *a1)
{
  id v1 = a1;
  if (([v1 containsString:@"REBRAND"] & 1) != 0 || (_os_feature_enabled_impl() & 1) == 0)
  {
    id v2 = v1;
  }
  else
  {
    id v2 = [v1 stringByAppendingString:@"_REBRAND"];
  }
  uint64_t v3 = v2;

  return v3;
}

id getLocalizedDeviceName()
{
  if (getLocalizedDeviceName_onceToken != -1) {
    dispatch_once(&getLocalizedDeviceName_onceToken, &__block_literal_global_51);
  }
  uint64_t v0 = (void *)getLocalizedDeviceName_localizedDeviceName;
  return v0;
}

uint64_t __getLocalizedDeviceName_block_invoke()
{
  getLocalizedDeviceName_localizedDeviceName = MGCopyAnswer();
  return MEMORY[0x1F41817F8]();
}

id PUIDisplayNameForApp(__CFBundle *a1)
{
  id v2 = CFBundleGetIdentifier(a1);
  uint64_t v3 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v2];
  uint64_t v4 = [v3 localizedName];

  if (![v4 length])
  {
    long long v5 = CFBundleGetInfoDictionary(a1);
    uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1CC48]];

    if (![v6 length])
    {
      uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1D008]];

      if ([v7 length])
      {
        uint64_t v6 = v7;
      }
      else
      {
        CFURLRef v8 = CFBundleCopyBundleURL(a1);
        uint64_t v9 = [(__CFURL *)v8 lastPathComponent];
        uint64_t v6 = [v9 stringByDeletingPathExtension];
      }
    }

    uint64_t v4 = v6;
  }

  return v4;
}

id PUIWatchBundleIDForBundleID(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = _PUILoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v1;
    _os_log_impl(&dword_1E4AD5000, v2, OS_LOG_TYPE_DEFAULT, "Fetching watch app bundle id for companion bundle id %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v4 = [MEMORY[0x1E4F4AC68] sharedDeviceConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __PUIWatchBundleIDForBundleID_block_invoke;
  v9[3] = &unk_1E6E9D248;
  p_long long buf = &buf;
  id v5 = v1;
  id v10 = v5;
  uint64_t v6 = v3;
  v11 = v6;
  [v4 fetchWatchAppBundleIDForCompanionAppBundleID:v5 completion:v9];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v7;
}

void sub_1E4AEEAD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void __PUIWatchBundleIDForBundleID_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = _PUILoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v14 = 138412546;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      id v17 = v5;
      CFURLRef v8 = "Error fetching watch app bundle id for %@, error %@";
LABEL_6:
      _os_log_impl(&dword_1E4AD5000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    uint64_t v9 = [a2 copy];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    uint64_t v6 = _PUILoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v13 = *(void **)(a1 + 32);
      int v14 = 138412546;
      uint64_t v15 = v12;
      __int16 v16 = 2112;
      id v17 = v13;
      CFURLRef v8 = "Found watch bundle id %@ for companion bundle id %@";
      goto LABEL_6;
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id PUIDisplayNameForWatchApp(void *a1)
{
  v51[3] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  v50[0] = @"com.apple.findmy.finddevices";
  id v2 = PUI_LocalizedStringForLocationServices(@"APP_NAME_FIND_DEVICES");
  v51[0] = v2;
  v50[1] = @"com.apple.findmy.finditems";
  dispatch_semaphore_t v3 = PUI_LocalizedStringForLocationServices(@"APP_NAME_FIND_ITEMS");
  v51[1] = v3;
  v50[2] = @"com.apple.findmy.findpeople";
  uint64_t v4 = PUI_LocalizedStringForLocationServices(@"APP_NAME_FIND_PEOPLE");
  v51[2] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:3];

  uint64_t v6 = [v5 objectForKeyedSubscript:v1];

  if (v6)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:v1];
  }
  else
  {
    id v8 = (id)*MEMORY[0x1E4F1D008];
    id v9 = (id)*MEMORY[0x1E4F1CC48];
    v34 = v8;
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v8, v9, 0);
    v11 = [MEMORY[0x1E4F4AC68] sharedDeviceConnection];
    uint64_t v12 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    id v43 = 0;
    uint64_t v13 = (void *)[v11 copyLocalizedValuesFromAllDevicesForInfoPlistKeys:v10 forAppWithBundleID:v1 fetchingFirstMatchingLocalizationInList:v12 error:&v43];
    id v14 = v43;

    if (v14)
    {
      uint64_t v15 = _PUILoggingFacility();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        id v47 = v1;
        __int16 v48 = 2112;
        id v49 = v14;
        _os_log_impl(&dword_1E4AD5000, v15, OS_LOG_TYPE_DEFAULT, "Error fetching watch app name for %@, error %@", buf, 0x16u);
      }
      uint64_t v7 = 0;
    }
    else
    {
      v33 = v10;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v32 = v13;
      uint64_t v15 = v13;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v40;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v40 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v39 + 1) + 8 * i);
            v21 = [v15 objectForKeyedSubscript:v20];
            v22 = [v21 objectForKeyedSubscript:v9];

            if (v22)
            {
              v28 = [v15 objectForKeyedSubscript:v20];
              uint64_t v29 = v28;
              id v30 = v9;
LABEL_26:
              uint64_t v7 = [v28 objectForKeyedSubscript:v30];

              goto LABEL_27;
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v45 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v15 = v15;
      uint64_t v7 = (void *)[v15 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v7)
      {
        uint64_t v23 = *(void *)v36;
        while (2)
        {
          for (j = 0; j != v7; j = (char *)j + 1)
          {
            if (*(void *)v36 != v23) {
              objc_enumerationMutation(v15);
            }
            uint64_t v25 = *(void *)(*((void *)&v35 + 1) + 8 * (void)j);
            v26 = [v15 objectForKeyedSubscript:v25];
            v27 = [v26 objectForKeyedSubscript:v34];

            if (v27)
            {
              v28 = [v15 objectForKeyedSubscript:v25];
              uint64_t v29 = v28;
              id v30 = v34;
              goto LABEL_26;
            }
          }
          uint64_t v7 = (void *)[v15 countByEnumeratingWithState:&v35 objects:v44 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_27:
      id v14 = 0;
      uint64_t v10 = v33;
      uint64_t v13 = v32;
    }
  }
  return v7;
}

id PUIGetActivePairedDevice()
{
  char v0 = objc_opt_respondsToSelector();
  id v1 = [MEMORY[0x1E4F79EF0] sharedInstance];
  id v2 = [MEMORY[0x1E4F79EF0] activePairedDeviceSelectorBlock];
  if (v0) {
    [v1 getAllDevicesWithArchivedAltAccountDevicesMatching:v2];
  }
  else {
  dispatch_semaphore_t v3 = [v1 getAllDevicesWithArchivedDevicesMatching:v2];
  }
  uint64_t v4 = [v3 firstObject];

  id v5 = [v4 valueForProperty:*MEMORY[0x1E4F79DA8]];
  if ([v5 BOOLValue]) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v4;
  }
  id v7 = v6;

  return v7;
}

BOOL PUIIsAppClip(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x1E4F223C8];
  id v2 = a1;
  uint64_t v7 = 0;
  dispatch_semaphore_t v3 = (void *)[[v1 alloc] initWithBundleIdentifier:v2 allowPlaceholder:0 error:&v7];

  uint64_t v4 = [v3 appClipMetadata];
  BOOL v5 = v4 != 0;

  return v5;
}

void PUIResetIDFAIfNeeded()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  char v0 = (void *)TCCAccessCopyBundleIdentifiersForService();
  if (![v0 count])
  {
    id v1 = _PUILoggingFacility();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315138;
      uint64_t v4 = "PUIResetIDFAIfNeeded";
      _os_log_impl(&dword_1E4AD5000, v1, OS_LOG_TYPE_DEFAULT, "%s: all apps were disabled for kTCCServiceUserTracking. Resetting ad identifier.", (uint8_t *)&v3, 0xCu);
    }

    id v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v2 clearAdvertisingIdentifier];
  }
}

uint64_t PUICompareSpecifiersByName(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 name];
  uint64_t v5 = [v3 name];

  uint64_t v6 = [v4 localizedCaseInsensitiveCompare:v5];
  return v6;
}

void PUIAnalyticsLogView(void *a1, void *a2, void *a3)
{
  id v8 = a1;
  id v9 = a2;
  id v10 = a3;
  id v5 = v10;
  id v6 = v9;
  id v7 = v8;
  AnalyticsSendEventLazy();
}

id __PUIAnalyticsLogView_block_invoke(void *a1)
{
  v7[3] = *MEMORY[0x1E4F143B8];
  id v1 = &stru_1F4072988;
  v6[0] = @"view";
  v6[1] = @"bundleID";
  id v2 = (__CFString *)a1[4];
  id v3 = (__CFString *)a1[5];
  if (!v2) {
    id v2 = &stru_1F4072988;
  }
  if (!v3) {
    id v3 = &stru_1F4072988;
  }
  v7[0] = v2;
  v7[1] = v3;
  v6[2] = @"category";
  if (a1[6]) {
    id v1 = (__CFString *)a1[6];
  }
  v7[2] = v1;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
  return v4;
}

id PUITribecaSupportedText()
{
  if (PUITribecaSupportedText_token != -1) {
    dispatch_once(&PUITribecaSupportedText_token, &__block_literal_global_2);
  }
  char v0 = (void *)PUITribecaSupportedText_text;
  return v0;
}

void __PUITribecaSupportedText_block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (aks_bak_get_beacon())
  {
    char v0 = _PUILoggingFacility();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      id v7 = "PUITribecaSupportedText_block_invoke";
      _os_log_impl(&dword_1E4AD5000, v0, OS_LOG_TYPE_DEFAULT, "%s: didn't successfully find beacon.", buf, 0xCu);
    }
  }
  else
  {
    id v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28B50]), "_initUniqueWithPath:", @"/System/Library/PrivateFrameworks/FindMyBeaconingSupport.framework", 0);
    char v0 = v1;
    if (v1)
    {
      id v2 = [v1 localizedStringForKey:@"E786CC8A-FAD0-49DB-9460-F27F248521CD" value:&stru_1F4072988 table:0];
      id v3 = v2;
      if (v2 && [v2 length])
      {
        id v4 = v3;
        id v5 = PUITribecaSupportedText_text;
        PUITribecaSupportedText_text = (uint64_t)v4;
      }
      else
      {
        id v5 = _PUILoggingFacility();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          __PUITribecaSupportedText_block_invoke_cold_1(v5);
        }
      }
    }
  }
}

uint64_t PUIIsUserParcElisabethEligible()
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  int domain_answer = os_eligibility_get_domain_answer();
  id v1 = _PUILoggingFacility();
  BOOL v2 = os_log_type_enabled(v1, OS_LOG_TYPE_ERROR);
  if (domain_answer)
  {
    if (v2) {
      PUIIsUserParcElisabethEligible_cold_2(domain_answer, v1);
    }
  }
  else if (v2)
  {
    PUIIsUserParcElisabethEligible_cold_1(v1);
  }

  return 0;
}

void sub_1E4AEFCA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4AF08F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4AF400C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E4AF55BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 256));
  _Unwind_Resume(a1);
}

void __PUICalendarAuthorizationStatesForService_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    id v6 = tcc_authorization_record_get_subject_identity();
    uint64_t authorization_right = tcc_authorization_record_get_authorization_right();
    uint64_t v8 = (void *)[[NSString alloc] initWithCString:tcc_identity_get_identifier() encoding:4];
    if (v8)
    {
      switch(authorization_right)
      {
        case 0:
          id v9 = (id *)(a1 + 48);
          goto LABEL_14;
        case 4:
          id v9 = (id *)(a1 + 40);
          goto LABEL_14;
        case 2:
          id v9 = (id *)(a1 + 32);
LABEL_14:
          [*v9 addObject:v8];
          break;
      }
    }

    goto LABEL_16;
  }
  id v10 = _PUILoggingFacility();
  id v6 = v10;
  if (a3)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __PUICalendarAuthorizationStatesForService_block_invoke_cold_1(a1, a3, v6);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 56);
    int v12 = 138412290;
    uint64_t v13 = v11;
    _os_log_impl(&dword_1E4AD5000, v6, OS_LOG_TYPE_DEFAULT, "Finished getting authorization for service: %@", (uint8_t *)&v12, 0xCu);
  }
LABEL_16:
}

void sub_1E4AF6E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4AF75B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id bundleIdentifiersWithPickerAccess()
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  char v0 = (void *)getCNPrivateAccessAggregatorClass_softClass;
  uint64_t v9 = getCNPrivateAccessAggregatorClass_softClass;
  if (!getCNPrivateAccessAggregatorClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getCNPrivateAccessAggregatorClass_block_invoke;
    v5[3] = &unk_1E6E9C7F8;
    v5[4] = &v6;
    __getCNPrivateAccessAggregatorClass_block_invoke((uint64_t)v5);
    char v0 = (void *)v7[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v6, 8);
  uint64_t v2 = [v1 allLoggedBundledIdentifiers];
  id v3 = [MEMORY[0x1E4F1CAD0] setWithArray:v2];

  return v3;
}

void sub_1E4AF789C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCNLimitedAccessContactPickerViewControllerClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  char v0 = (void *)getCNLimitedAccessContactPickerViewControllerClass_softClass;
  uint64_t v7 = getCNLimitedAccessContactPickerViewControllerClass_softClass;
  if (!getCNLimitedAccessContactPickerViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCNLimitedAccessContactPickerViewControllerClass_block_invoke;
    v3[3] = &unk_1E6E9C7F8;
    v3[4] = &v4;
    __getCNLimitedAccessContactPickerViewControllerClass_block_invoke((uint64_t)v3);
    char v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E4AF8498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4AF919C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1E4AFB008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id *location,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,id a59)
{
}

void sub_1E4AFBCA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v29 - 256));
  _Unwind_Resume(a1);
}

void __getCNPrivateAccessAggregatorClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CNPrivateAccessAggregator");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCNPrivateAccessAggregatorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCNPrivateAccessAggregatorClass_block_invoke_cold_1();
    ContactsUILibrary();
  }
}

void ContactsUILibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!ContactsUILibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __ContactsUILibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6E9D470;
    uint64_t v3 = 0;
    ContactsUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  char v0 = (void *)v1[0];
  if (!ContactsUILibraryCore_frameworkLibrary)
  {
    char v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __ContactsUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ContactsUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCNLimitedAccessContactPickerViewControllerClass_block_invoke(uint64_t a1)
{
  ContactsUILibrary();
  Class result = objc_getClass("CNLimitedAccessContactPickerViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCNLimitedAccessContactPickerViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                             + 24);
  }
  else
  {
    uint64_t v3 = __getCNLimitedAccessContactPickerViewControllerClass_block_invoke_cold_1();
    return (Class)__getCNContactGroupVisualizerClass_block_invoke(v3);
  }
  return result;
}

Class __getCNContactGroupVisualizerClass_block_invoke(uint64_t a1)
{
  ContactsUILibrary();
  Class result = objc_getClass("CNContactGroupVisualizer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCNContactGroupVisualizerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getCNContactGroupVisualizerClass_block_invoke_cold_1();
    return (Class)__PUIContactsAuthorizationStatesForService_block_invoke(v3);
  }
  return result;
}

void __PUIContactsAuthorizationStatesForService_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    uint64_t v6 = tcc_authorization_record_get_subject_identity();
    uint64_t authorization_right = tcc_authorization_record_get_authorization_right();
    uint64_t v8 = (void *)[[NSString alloc] initWithCString:tcc_identity_get_identifier() encoding:4];
    if (v8)
    {
      switch(authorization_right)
      {
        case 0:
          uint64_t v9 = (id *)(a1 + 48);
          goto LABEL_14;
        case 3:
          uint64_t v9 = (id *)(a1 + 40);
          goto LABEL_14;
        case 2:
          uint64_t v9 = (id *)(a1 + 32);
LABEL_14:
          [*v9 addObject:v8];
          break;
      }
    }

    goto LABEL_16;
  }
  id v10 = _PUILoggingFacility();
  uint64_t v6 = v10;
  if (a3)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __PUIContactsAuthorizationStatesForService_block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 56);
    int v12 = 138412290;
    uint64_t v13 = v11;
    _os_log_impl(&dword_1E4AD5000, v6, OS_LOG_TYPE_DEFAULT, "Finished getting authorization for service: %@", (uint8_t *)&v12, 0xCu);
  }
LABEL_16:
}

void sub_1E4AFC6F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PUIAllApplicationsSupportingDisclosureReview()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v0 = (void (*)(void))getPDUAllApplicationsSupportingDisclosureReviewSymbolLoc_ptr;
  uint64_t v9 = getPDUAllApplicationsSupportingDisclosureReviewSymbolLoc_ptr;
  if (!getPDUAllApplicationsSupportingDisclosureReviewSymbolLoc_ptr)
  {
    id v1 = (void *)PrivacyDisclosureUILibrary();
    v7[3] = (uint64_t)dlsym(v1, "PDUAllApplicationsSupportingDisclosureReview");
    getPDUAllApplicationsSupportingDisclosureReviewSymbolLoc_ptr = (_UNKNOWN *)v7[3];
    char v0 = (void (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v0)
  {
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
    id v5 = v4;
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  long long v2 = v0();
  return v2;
}

void *__getPDUAllApplicationsSupportingDisclosureReviewSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)PrivacyDisclosureUILibrary();
  Class result = dlsym(v2, "PDUAllApplicationsSupportingDisclosureReview");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPDUAllApplicationsSupportingDisclosureReviewSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 24);
  return result;
}

uint64_t PrivacyDisclosureUILibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!PrivacyDisclosureUILibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __PrivacyDisclosureUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6E9D4D8;
    uint64_t v5 = 0;
    PrivacyDisclosureUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = PrivacyDisclosureUILibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!PrivacyDisclosureUILibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __PrivacyDisclosureUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PrivacyDisclosureUILibraryCore_frameworkLibrary = result;
  return result;
}

void *__getPDUDisclosureReviewViewControllerForApplicationSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)PrivacyDisclosureUILibrary();
  uint64_t result = dlsym(v2, "PDUDisclosureReviewViewControllerForApplication");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPDUDisclosureReviewViewControllerForApplicationSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                 + 24);
  return result;
}

void sub_1E4AFD9D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1E4AFDE00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

Class __getFPAccessControlManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!FileProviderLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __FileProviderLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E9D520;
    uint64_t v6 = 0;
    FileProviderLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!FileProviderLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("FPAccessControlManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getFPAccessControlManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getFPAccessControlManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __FileProviderLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FileProviderLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1E4AFF064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCLCopyAppsUsingLocationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!CoreLocationLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __CoreLocationLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    void v5[5] = v5;
    long long v6 = xmmword_1E6E9D560;
    uint64_t v7 = 0;
    CoreLocationLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    long long v2 = (void *)CoreLocationLibraryCore_frameworkLibrary;
    if (CoreLocationLibraryCore_frameworkLibrary)
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
  long long v2 = (void *)CoreLocationLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "CLCopyAppsUsingLocation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCLCopyAppsUsingLocationSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreLocationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreLocationLibraryCore_frameworkLibrary = result;
  return result;
}

BOOL PUILocationIsActivePairedDevice()
{
  uint64_t v0 = PUIGetActivePairedDevice();

  return v0 != 0;
}

BOOL PUILocationIsDisplayNameForWatchApp(void *a1)
{
  uint64_t v1 = PUIDisplayNameForWatchApp(a1);

  return v1 != 0;
}

BOOL PUILocationIsWatchBundleIDForBundleID(void *a1)
{
  uint64_t v1 = PUIWatchBundleIDForBundleID(a1);

  return v1 != 0;
}

uint64_t PSUICLCopyAppsUsingLocation()
{
  uint64_t v5 = 0;
  long long v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(void))getCLCopyAppsUsingLocationSymbolLoc_ptr_0;
  uint64_t v8 = getCLCopyAppsUsingLocationSymbolLoc_ptr_0;
  if (!getCLCopyAppsUsingLocationSymbolLoc_ptr_0)
  {
    uint64_t v1 = (void *)CoreLocationLibrary();
    void v6[3] = (uint64_t)dlsym(v1, "CLCopyAppsUsingLocation");
    getCLCopyAppsUsingLocationSymbolLoc_ptr_0 = (_UNKNOWN *)v6[3];
    uint64_t v0 = (uint64_t (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
    long long v4 = v3;
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  return v0();
}

id getCLLocationManagerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCLLocationManagerClass_softClass;
  uint64_t v7 = getCLLocationManagerClass_softClass;
  if (!getCLLocationManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCLLocationManagerClass_block_invoke;
    v3[3] = &unk_1E6E9C7F8;
    v3[4] = &v4;
    __getCLLocationManagerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E4B02480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t entityStateCallback(uint64_t a1, void *a2)
{
  return [a2 updateLocationUsage];
}

id getCLAppStatusChangedNotification()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = (void **)getCLAppStatusChangedNotificationSymbolLoc_ptr;
  uint64_t v9 = getCLAppStatusChangedNotificationSymbolLoc_ptr;
  if (!getCLAppStatusChangedNotificationSymbolLoc_ptr)
  {
    id v1 = (void *)CoreLocationLibrary();
    v7[3] = (uint64_t)dlsym(v1, "CLAppStatusChangedNotification");
    getCLAppStatusChangedNotificationSymbolLoc_ptr = v7[3];
    uint64_t v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v0)
  {
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
    uint64_t v5 = v4;
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  long long v2 = *v0;
  return v2;
}

uint64_t appInstallCallback(uint64_t a1, void *a2)
{
  uint64_t v3 = _PUILoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1E4AD5000, v3, OS_LOG_TYPE_DEFAULT, "app installed", v5, 2u);
  }

  return [a2 reloadSpecifiers];
}

uint64_t appUninstallCallback(uint64_t a1, void *a2)
{
  uint64_t v3 = _PUILoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1E4AD5000, v3, OS_LOG_TYPE_DEFAULT, "app uninstalled", v5, 2u);
  }

  return [a2 reloadSpecifiers];
}

uint64_t isModificationAllowedForID(void *a1)
{
  if (![a1 isEqualToString:@"com.apple.findmy"]) {
    return 1;
  }
  id v1 = [MEMORY[0x1E4F74230] sharedConnection];
  BOOL v2 = [v1 effectiveBoolValueForSetting:*MEMORY[0x1E4F74010]] != 2;

  return v2;
}

id getPSGFindMyiPhoneControllerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPSGFindMyiPhoneControllerClass_softClass;
  uint64_t v7 = getPSGFindMyiPhoneControllerClass_softClass;
  if (!getPSGFindMyiPhoneControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPSGFindMyiPhoneControllerClass_block_invoke;
    v3[3] = &unk_1E6E9C7F8;
    v3[4] = &v4;
    __getPSGFindMyiPhoneControllerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E4B03C64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4B03F0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
}

void sub_1E4B044D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1E4B05180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4B05D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id *location,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,id a55)
{
}

void sub_1E4B06ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_1E4B06F7C(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;
  objc_destroyWeak(v4);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1E4B07304(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1E4B08BF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __loadLocationFillSystemImage_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"location.fill"];
  id v1 = (void *)locationFillSystemImage;
  locationFillSystemImage = v0;

  BOOL v2 = (void *)locationFillSystemImage;
  uint64_t v3 = [MEMORY[0x1E4FB1618] systemPurpleColor];
  uint64_t v4 = [v2 _flatImageWithColor:v3];
  uint64_t v5 = [v4 imageWithRenderingMode:1];
  uint64_t v6 = (void *)locationFillSystemImageWithSystemPurpleColor;
  locationFillSystemImageWithSystemPurpleColor = v5;

  uint64_t v7 = (void *)locationFillSystemImage;
  uint64_t v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  uint64_t v9 = [v7 _flatImageWithColor:v8];
  uint64_t v10 = [v9 imageWithRenderingMode:1];
  uint64_t v11 = (void *)locationFillSystemImageWithSecondaryLabelColor;
  locationFillSystemImageWithSecondaryLabelColor = v10;

  id v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"location"];
  int v12 = [MEMORY[0x1E4FB1618] systemPurpleColor];
  uint64_t v13 = [v16 _flatImageWithColor:v12];
  uint64_t v14 = [v13 imageWithRenderingMode:1];
  uint64_t v15 = (void *)locationSystemImageWithSystemPurpleColor;
  locationSystemImageWithSystemPurpleColor = v14;
}

void *__getCLCopyAppsUsingLocationSymbolLoc_block_invoke_0(uint64_t a1)
{
  BOOL v2 = (void *)CoreLocationLibrary();
  uint64_t result = dlsym(v2, "CLCopyAppsUsingLocation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCLCopyAppsUsingLocationSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreLocationLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoreLocationLibraryCore_frameworkLibrary_0)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __CoreLocationLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6E9D770;
    uint64_t v5 = 0;
    CoreLocationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = CoreLocationLibraryCore_frameworkLibrary_0;
  id v1 = (void *)v3[0];
  if (!CoreLocationLibraryCore_frameworkLibrary_0)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __CoreLocationLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  CoreLocationLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getCLLocationManagerClass_block_invoke(uint64_t a1)
{
  CoreLocationLibrary();
  Class result = objc_getClass("CLLocationManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCLLocationManagerClass_block_invoke_cold_1();
  }
  getCLLocationManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCLAppStatusChangedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)CoreLocationLibrary();
  Class result = dlsym(v2, "CLAppStatusChangedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCLAppStatusChangedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPSGFindMyiPhoneControllerClass_block_invoke(uint64_t a1)
{
  GeneralSettingsUILibrary();
  Class result = objc_getClass("PSGFindMyiPhoneController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPSGFindMyiPhoneControllerClass_block_invoke_cold_1();
  }
  getPSGFindMyiPhoneControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t GeneralSettingsUILibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!GeneralSettingsUILibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __GeneralSettingsUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6E9D788;
    uint64_t v5 = 0;
    GeneralSettingsUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = GeneralSettingsUILibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!GeneralSettingsUILibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __GeneralSettingsUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  GeneralSettingsUILibraryCore_frameworkLibrary = result;
  return result;
}

void *__getFindMyiPhoneControllerErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)GeneralSettingsUILibrary();
  uint64_t result = dlsym(v2, "FindMyiPhoneControllerErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFindMyiPhoneControllerErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCLCommonLocationAlwaysAndWhenInUseUsageDescriptionKeySymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)CoreLocationLibrary();
  uint64_t result = dlsym(v2, "kCLCommonLocationAlwaysAndWhenInUseUsageDescriptionKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCLCommonLocationAlwaysAndWhenInUseUsageDescriptionKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                                 + 8)
                                                                                     + 24);
  return result;
}

void *__getkCLCommonLocationWhenInUseUsageDescriptionKeySymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)CoreLocationLibrary();
  uint64_t result = dlsym(v2, "kCLCommonLocationWhenInUseUsageDescriptionKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCLCommonLocationWhenInUseUsageDescriptionKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

void *__getkCLCommonLocationAlwaysUsageDescriptionKeySymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)CoreLocationLibrary();
  uint64_t result = dlsym(v2, "kCLCommonLocationAlwaysUsageDescriptionKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCLCommonLocationAlwaysUsageDescriptionKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCLCommonLocationUsageDescriptionKeySymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)CoreLocationLibrary();
  uint64_t result = dlsym(v2, "kCLCommonLocationUsageDescriptionKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCLCommonLocationUsageDescriptionKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getCLLocationManagerClass_0()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCLLocationManagerClass_softClass_0;
  uint64_t v7 = getCLLocationManagerClass_softClass_0;
  if (!getCLLocationManagerClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCLLocationManagerClass_block_invoke_0;
    v3[3] = &unk_1E6E9C7F8;
    v3[4] = &v4;
    __getCLLocationManagerClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E4B0AD70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4B0B084(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1E4B0C368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4B0DE30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

id getTUCallCapabilitiesClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getTUCallCapabilitiesClass_softClass;
  uint64_t v7 = getTUCallCapabilitiesClass_softClass;
  if (!getTUCallCapabilitiesClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getTUCallCapabilitiesClass_block_invoke;
    v3[3] = &unk_1E6E9C7F8;
    v3[4] = &v4;
    __getTUCallCapabilitiesClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E4B0DF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCLLocationManagerClass_block_invoke_0(uint64_t a1)
{
  CoreLocationLibrary_0();
  Class result = objc_getClass("CLLocationManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCLLocationManagerClass_block_invoke_cold_1();
  }
  getCLLocationManagerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreLocationLibrary_0()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoreLocationLibraryCore_frameworkLibrary_1)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __CoreLocationLibraryCore_block_invoke_1;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6E9D8F8;
    uint64_t v5 = 0;
    CoreLocationLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = CoreLocationLibraryCore_frameworkLibrary_1;
  id v1 = (void *)v3[0];
  if (!CoreLocationLibraryCore_frameworkLibrary_1)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __CoreLocationLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  CoreLocationLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void *__getCLCopyAppsUsingLocationSymbolLoc_block_invoke_1(uint64_t a1)
{
  BOOL v2 = (void *)CoreLocationLibrary_0();
  uint64_t result = dlsym(v2, "CLCopyAppsUsingLocation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCLCopyAppsUsingLocationSymbolLoc_ptr_1 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getTUCallCapabilitiesClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __TelephonyUtilitiesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6E9D910;
    uint64_t v5 = 0;
    TelephonyUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getTUCallCapabilitiesClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("TUCallCapabilities");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getTUCallCapabilitiesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __TelephonyUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TelephonyUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

id _PUILoggingFacility()
{
  if (_PUILoggingFacility_onceToken != -1) {
    dispatch_once(&_PUILoggingFacility_onceToken, &__block_literal_global_12);
  }
  uint64_t v0 = (void *)_PUILoggingFacility_oslog;
  return v0;
}

id PUILogForCategory(unint64_t a1)
{
  if (a1 >= 2) {
    PUILogForCategory_cold_1();
  }
  if (PUILogForCategory_loggingToken != -1) {
    dispatch_once(&PUILogForCategory_loggingToken, &__block_literal_global_6);
  }
  BOOL v2 = (void *)PUILogForCategory_logObjects[a1];
  return v2;
}

uint64_t __PUILogForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.SettingsAndCoreApps.PrivacySettings", "PrivacySettings");
  id v1 = (void *)PUILogForCategory_logObjects;
  PUILogForCategory_logObjects = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.SettingsAndCoreApps.PrivacySettings", "Signposts");
  uint64_t v3 = qword_1EAE8A750;
  qword_1EAE8A750 = (uint64_t)v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

void sub_1E4B0F578(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1E4B0F66C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E4B0F9C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t compareConfigurationNames(void *a1, void *a2)
{
  id v3 = a2;
  long long v4 = [a1 name];
  uint64_t v5 = [v3 name];

  uint64_t v6 = [v4 localizedCaseInsensitiveCompare:v5];
  return v6;
}

uint64_t compareAppNames(void *a1, void *a2)
{
  id v3 = a2;
  long long v4 = [a1 localizedName];
  uint64_t v5 = [v3 localizedName];

  uint64_t v6 = [v4 localizedCaseInsensitiveCompare:v5];
  return v6;
}

void PSPXTCCSettingsLimitedAccessSubtitle(void *a1)
{
  id v1 = a1;
  PXTCCSettingsLimitedAccessSubtitleSymbolLoc = (void (*)(id))getPXTCCSettingsLimitedAccessSubtitleSymbolLoc();
  if (PXTCCSettingsLimitedAccessSubtitleSymbolLoc)
  {
    id v3 = PXTCCSettingsLimitedAccessSubtitleSymbolLoc(v1);

    id v4 = v3;
  }
  else
  {
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
    [(PUIPhotoServicesAuthorizationLevelController *)v5 setSpecifier:v7];
  }
}

void sub_1E4B12388(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id PUIPhotosPolicyBundleIdentifiersWithRecentPickerUsage()
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  os_log_t v0 = [MEMORY[0x1E4F1CA80] set];
  id v1 = [MEMORY[0x1E4F8B998] sharedInstance];
  os_log_t v2 = [v1 photosPickerPresentedLibraryLogsByClient];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    uint64_t v7 = *MEMORY[0x1E4F8C508];
    uint64_t v8 = *MEMORY[0x1E4F8C510];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "objectForKeyedSubscript:", v7, (void)v16);
        int v12 = [v10 objectForKeyedSubscript:v8];
        [v12 timeIntervalSinceNow];
        if (v13 <= 0.0 && v13 > -2592000.0) {
          [v0 addObject:v11];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  uint64_t v14 = (void *)[v0 copy];
  return v14;
}

void sub_1E4B13240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4B14CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id *location,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,id a61)
{
}

void PUIPhotosAuthorizationStatesForService(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = (void *)tcc_server_create();
  uint64_t v8 = tcc_service_singleton_for_CF_name();
  uint64_t v9 = tcc_service_singleton_for_CF_name();
  tcc_object_equal();

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v14 = _PUILoggingFacility();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v23 = a1;
    _os_log_impl(&dword_1E4AD5000, v14, OS_LOG_TYPE_DEFAULT, "Requesting TCC auth records for service: %@", buf, 0xCu);
  }

  id v15 = v10;
  id v16 = v11;
  id v17 = v12;
  id v18 = v13;
  tcc_server_message_get_authorization_records_by_service();
  if (a2) {
    *a2 = (id)[v15 copy];
  }
  if (a3) {
    *a3 = (id)[v16 copy];
  }
  if (a4) {
    *a4 = (id)[v17 copy];
  }
  if (a5) {
    *a5 = (id)[v18 copy];
  }
}

uint64_t PhotosUICoreLibraryCore()
{
  if (!PhotosUICoreLibraryCore_frameworkLibrary) {
    PhotosUICoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return PhotosUICoreLibraryCore_frameworkLibrary;
}

uint64_t getPXTCCSettingsFullAccessSubtitleSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getPXTCCSettingsFullAccessSubtitleSymbolLoc_ptr;
  uint64_t v6 = getPXTCCSettingsFullAccessSubtitleSymbolLoc_ptr;
  if (!getPXTCCSettingsFullAccessSubtitleSymbolLoc_ptr)
  {
    id v1 = (void *)PhotosUICoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "PXTCCSettingsFullAccessSubtitle");
    getPXTCCSettingsFullAccessSubtitleSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1E4B1610C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PhotosUICoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotosUICoreLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getPXTCCSettingsFullAccessSubtitleSymbolLoc_block_invoke(uint64_t a1)
{
  os_log_t v2 = (void *)PhotosUICoreLibrary();
  uint64_t result = dlsym(v2, "PXTCCSettingsFullAccessSubtitle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPXTCCSettingsFullAccessSubtitleSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PhotosUICoreLibrary()
{
  uint64_t v0 = PhotosUICoreLibraryCore();
  if (!v0)
  {
    os_log_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t getPXTCCSettingsLimitedAccessSubtitleSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getPXTCCSettingsLimitedAccessSubtitleSymbolLoc_ptr;
  uint64_t v6 = getPXTCCSettingsLimitedAccessSubtitleSymbolLoc_ptr;
  if (!getPXTCCSettingsLimitedAccessSubtitleSymbolLoc_ptr)
  {
    id v1 = (void *)PhotosUICoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "PXTCCSettingsLimitedAccessSubtitle");
    getPXTCCSettingsLimitedAccessSubtitleSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1E4B1631C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPXTCCSettingsLimitedAccessSubtitleSymbolLoc_block_invoke(uint64_t a1)
{
  os_log_t v2 = (void *)PhotosUICoreLibrary();
  uint64_t result = dlsym(v2, "PXTCCSettingsLimitedAccessSubtitle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPXTCCSettingsLimitedAccessSubtitleSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t TCCLibraryCore()
{
  if (!TCCLibraryCore_frameworkLibrary) {
    TCCLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return TCCLibraryCore_frameworkLibrary;
}

uint64_t gettcc_server_message_prompt_authorization_valueSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = gettcc_server_message_prompt_authorization_valueSymbolLoc_ptr;
  uint64_t v6 = gettcc_server_message_prompt_authorization_valueSymbolLoc_ptr;
  if (!gettcc_server_message_prompt_authorization_valueSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __gettcc_server_message_prompt_authorization_valueSymbolLoc_block_invoke;
    v2[3] = &unk_1E6E9C7F8;
    v2[4] = &v3;
    __gettcc_server_message_prompt_authorization_valueSymbolLoc_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1E4B16508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __TCCLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TCCLibraryCore_frameworkLibrary = result;
  return result;
}

void *__gettcc_server_message_prompt_authorization_valueSymbolLoc_block_invoke(uint64_t a1)
{
  os_log_t v2 = (void *)TCCLibraryCore();
  if (!v2)
  {
    uint64_t v4 = (void *)abort_report_np();
    free(v4);
  }
  uint64_t result = dlsym(v2, "tcc_server_message_prompt_authorization_value");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  gettcc_server_message_prompt_authorization_valueSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

void __PUIPhotosAuthorizationStatesForService_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    uint64_t v6 = tcc_authorization_record_get_subject_identity();
    uint64_t authorization_right = tcc_authorization_record_get_authorization_right();
    uint64_t v8 = (void *)[[NSString alloc] initWithCString:tcc_identity_get_identifier() encoding:4];
    if (!v8)
    {
LABEL_18:

      goto LABEL_19;
    }
    if (authorization_right)
    {
      if (authorization_right == 3)
      {
        uint64_t v9 = (id *)(a1 + 40);
      }
      else
      {
        if (authorization_right != 2)
        {
LABEL_15:
          if (*(unsigned char *)(a1 + 72) && tcc_authorization_record_get_has_prompted_for_allow()) {
            [*(id *)(a1 + 56) addObject:v8];
          }
          goto LABEL_18;
        }
        uint64_t v9 = (id *)(a1 + 32);
      }
    }
    else
    {
      uint64_t v9 = (id *)(a1 + 48);
    }
    [*v9 addObject:v8];
    goto LABEL_15;
  }
  id v10 = _PUILoggingFacility();
  uint64_t v6 = v10;
  if (a3)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __PUIPhotosAuthorizationStatesForService_block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 64);
    int v12 = 138412290;
    uint64_t v13 = v11;
    _os_log_impl(&dword_1E4AD5000, v6, OS_LOG_TYPE_DEFAULT, "Finished getting authorization for service: %@", (uint8_t *)&v12, 0xCu);
  }
LABEL_19:
}

id getNudityDetectionPreferencesHelperClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getNudityDetectionPreferencesHelperClass_softClass;
  uint64_t v7 = getNudityDetectionPreferencesHelperClass_softClass;
  if (!getNudityDetectionPreferencesHelperClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getNudityDetectionPreferencesHelperClass_block_invoke;
    v3[3] = &unk_1E6E9C7F8;
    v3[4] = &v4;
    __getNudityDetectionPreferencesHelperClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E4B16A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4B173E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1E4B176EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4B18C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCLLocationManagerClass_1()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCLLocationManagerClass_softClass_1;
  uint64_t v7 = getCLLocationManagerClass_softClass_1;
  if (!getCLLocationManagerClass_softClass_1)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCLLocationManagerClass_block_invoke_1;
    v3[3] = &unk_1E6E9C7F8;
    v3[4] = &v4;
    __getCLLocationManagerClass_block_invoke_1((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E4B191B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNudityDetectionPreferencesHelperClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CommunicationSafetySettingsUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CommunicationSafetySettingsUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E9DA88;
    uint64_t v6 = 0;
    CommunicationSafetySettingsUILibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!CommunicationSafetySettingsUILibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("NudityDetectionPreferencesHelper");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getNudityDetectionPreferencesHelperClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getNudityDetectionPreferencesHelperClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CommunicationSafetySettingsUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CommunicationSafetySettingsUILibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAMFIShouldShowDeveloperModeSettingsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AppleMobileFileIntegrityLibrary();
  uint64_t result = dlsym(v2, "AMFIShouldShowDeveloperModeSettings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAMFIShouldShowDeveloperModeSettingsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AppleMobileFileIntegrityLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AppleMobileFileIntegrityLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __AppleMobileFileIntegrityLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6E9DAA0;
    uint64_t v5 = 0;
    AppleMobileFileIntegrityLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = AppleMobileFileIntegrityLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!AppleMobileFileIntegrityLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __AppleMobileFileIntegrityLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleMobileFileIntegrityLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getHKHealthStoreClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!HealthKitLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __HealthKitLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E9DAB8;
    uint64_t v6 = 0;
    HealthKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!HealthKitLibraryCore_frameworkLibrary_0)
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
    Class result = objc_getClass("HKHealthStore");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getHKHealthStoreClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getHKHealthStoreClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HealthKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

uint64_t __MomentsOnboardingAndSettingsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MomentsOnboardingAndSettingsLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCLLocationManagerClass_block_invoke_1(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoreLocationLibraryCore_frameworkLibrary_2)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __CoreLocationLibraryCore_block_invoke_2;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6E9DAE8;
    uint64_t v5 = 0;
    CoreLocationLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    if (!CoreLocationLibraryCore_frameworkLibrary_2)
    {
      abort_report_np();
LABEL_8:
      __getCLLocationManagerClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("CLLocationManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getCLLocationManagerClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreLocationLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  CoreLocationLibraryCore_frameworkLibrary_2 = result;
  return result;
}

void *__getAMFIIsDeveloperModeEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AppleMobileFileIntegrityLibrary();
  uint64_t result = dlsym(v2, "AMFIIsDeveloperModeEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAMFIIsDeveloperModeEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1E4B20450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPAAccessReaderClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPAAccessReaderClass_softClass;
  uint64_t v7 = getPAAccessReaderClass_softClass;
  if (!getPAAccessReaderClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPAAccessReaderClass_block_invoke;
    v3[3] = &unk_1E6E9C7F8;
    v3[4] = &v4;
    __getPAAccessReaderClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E4B20538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPAAccessReaderClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!PrivacyAccountingLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __PrivacyAccountingLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E9DC90;
    uint64_t v6 = 0;
    PrivacyAccountingLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!PrivacyAccountingLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("PAAccessReader");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getPAAccessReaderClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPAAccessReaderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PrivacyAccountingLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PrivacyAccountingLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __isGreenTeaSKU_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isGreenTeaSKU_deviceIsChinaSKU = result;
  return result;
}

void sub_1E4B28120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

Class __getPAAccessReaderClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!PrivacyAccountingLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __PrivacyAccountingLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E9DDD0;
    uint64_t v6 = 0;
    PrivacyAccountingLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!PrivacyAccountingLibraryCore_frameworkLibrary_0)
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
    Class result = objc_getClass("PAAccessReader");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getPAAccessReaderClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPAAccessReaderClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PrivacyAccountingLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  PrivacyAccountingLibraryCore_frameworkLibrary_0 = result;
  return result;
}

id PUIWebsiteIconView()
{
  if (PUIWebsiteIconView_onceToken != -1) {
    dispatch_once(&PUIWebsiteIconView_onceToken, &__block_literal_global_19);
  }
  uint64_t v0 = objc_opt_new();
  objc_msgSend(v0, "setFrame:", 0.0, 0.0, *(double *)&PUIWebsiteIconView_iconSize_0, *(double *)&PUIWebsiteIconView_iconSize_1);
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v1 = [v0 widthAnchor];
  uint64_t v2 = [v1 constraintEqualToConstant:*(double *)&PUIWebsiteIconView_iconSize_0];
  [v2 setActive:1];

  uint64_t v3 = [v0 heightAnchor];
  uint64_t v4 = [v3 constraintEqualToConstant:*(double *)&PUIWebsiteIconView_iconSize_1];
  [v4 setActive:1];

  long long v5 = [MEMORY[0x1E4FB1618] whiteColor];
  [v0 setTextColor:v5];

  [v0 setTextAlignment:1];
  uint64_t v6 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [v0 setBackgroundColor:v6];

  [v0 _setContinuousCornerRadius:*(double *)&PUIWebsiteIconView_cornerRadius];
  uint64_t v7 = [v0 layer];
  [v7 setMasksToBounds:1];

  return v0;
}

void __PUIWebsiteIconView_block_invoke()
{
  uint64_t v0 = PSBlankIconImage();
  [v0 size];
  PUIWebsiteIconView_iconSize_0 = v1;
  PUIWebsiteIconView_iconSize_1 = v2;

  id v4 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F2B8]];
  [v4 continuousCornerRadius];
  PUIWebsiteIconView_cornerRadius = v3;
}

id PUIImageFromLabel(void *a1)
{
  id v1 = a1;
  [v1 bounds];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  uint64_t v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v6 scale];
  CGFloat v8 = v7;
  v13.width = v3;
  v13.height = v5;
  UIGraphicsBeginImageContextWithOptions(v13, 0, v8);

  uint64_t v9 = [v1 layer];

  [v9 renderInContext:UIGraphicsGetCurrentContext()];
  uint64_t v10 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v10;
}

void sub_1E4B2CEF8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 256));
  _Unwind_Resume(a1);
}

void sub_1E4B313E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1E4B31990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4B31FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4B33D78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL PUIWriteBytesToStream(void *a1, uint64_t a2, unint64_t a3, void *a4)
{
  id v7 = a1;
  if (a3)
  {
    unint64_t v8 = 0;
    uint64_t v9 = 512;
    uint64_t v10 = a3;
    while (1)
    {
      uint64_t v11 = [v7 write:a2 + v8 maxLength:v10];
      if (v11 < 0) {
        break;
      }
      if (!v11)
      {
        uint64_t v9 = 640;
        break;
      }
      v10 -= v11;
      if (v10)
      {
        v8 += v11;
        if (v8 < a3) {
          continue;
        }
      }
      goto LABEL_7;
    }
    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:v9 userInfo:0];
    BOOL v12 = v13 != 0;
    if (a4 && v13)
    {
      id v13 = v13;
      *a4 = v13;
      BOOL v12 = 1;
    }
  }
  else
  {
LABEL_7:
    BOOL v12 = 0;
    id v13 = 0;
  }
  BOOL v14 = !v12;

  return v14;
}

uint64_t sub_1E4B34B78()
{
  uint64_t v0 = sub_1E4B3E778();
  __swift_allocate_value_buffer(v0, qword_1EAE8AB48);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EAE8AB48);
  return sub_1E4B3E768();
}

uint64_t sub_1E4B34CD8()
{
  return sub_1E4B35108(&OBJC_IVAR____TtC17PrivacySettingsUI19FindMyLocateSession_meDeviceUpdateCallback, (void (*)(void, void))sub_1E4B34CF8);
}

uint64_t sub_1E4B34CF8(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

void sub_1E4B34D08(uint64_t a1, void *a2)
{
  CGFloat v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_1E4B34E18(uint64_t a1, uint64_t a2)
{
  return sub_1E4B35288(a1, a2, &OBJC_IVAR____TtC17PrivacySettingsUI19FindMyLocateSession_meDeviceUpdateCallback, (uint64_t (*)(uint64_t, uint64_t))sub_1E4B34E38);
}

uint64_t sub_1E4B34E38(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1E4B34E48@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  CGFloat v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC17PrivacySettingsUI19FindMyLocateSession_meDeviceUpdateCallback);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    id v7 = sub_1E4B3B214;
  }
  else
  {
    id v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_1E4B34CF8(v4);
}

uint64_t sub_1E4B34EE8(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_1E4B3B1DC;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  id v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC17PrivacySettingsUI19FindMyLocateSession_meDeviceUpdateCallback);
  swift_beginAccess();
  uint64_t v8 = *v7;
  *id v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_1E4B34CF8(v3);
  return sub_1E4B34E38(v8);
}

uint64_t (*sub_1E4B34FB0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1E4B350E8()
{
  return sub_1E4B35108(&OBJC_IVAR____TtC17PrivacySettingsUI19FindMyLocateSession_shareMyLocationUpdateCallback, (void (*)(void, void))sub_1E4B3B6B4);
}

uint64_t sub_1E4B35108(void *a1, void (*a2)(void, void))
{
  uint64_t v4 = (void *)(v2 + *a1);
  swift_beginAccess();
  uint64_t v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t sub_1E4B35170(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_1E4B35268(uint64_t a1, uint64_t a2)
{
  return sub_1E4B35288(a1, a2, &OBJC_IVAR____TtC17PrivacySettingsUI19FindMyLocateSession_shareMyLocationUpdateCallback, (uint64_t (*)(uint64_t, uint64_t))sub_1E4B3B6B8);
}

uint64_t sub_1E4B35288(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  *uint64_t v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t sub_1E4B352EC@<X0>(void *a1@<X0>, uint64_t (**a2)(unsigned __int8 *a1)@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC17PrivacySettingsUI19FindMyLocateSession_shareMyLocationUpdateCallback);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    id v7 = sub_1E4B3B1B0;
  }
  else
  {
    id v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)(unsigned __int8 *))v6;
  return sub_1E4B34CF8(v4);
}

uint64_t sub_1E4B3538C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_1E4B3B178;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  id v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC17PrivacySettingsUI19FindMyLocateSession_shareMyLocationUpdateCallback);
  swift_beginAccess();
  uint64_t v8 = *v7;
  *id v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_1E4B34CF8(v3);
  return sub_1E4B34E38(v8);
}

uint64_t (*sub_1E4B35454())()
{
  return j__swift_endAccess;
}

uint64_t sub_1E4B354B4()
{
  uint64_t v0 = sub_1E4B3E778();
  __swift_allocate_value_buffer(v0, qword_1EAE8AB60);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAE8AB60);
  if (qword_1EAE8A160 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1EAE8AB48);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_1E4B3557C()
{
  v1[2] = v0;
  v1[3] = swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8A188);
  v1[4] = swift_task_alloc();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8A190);
  v1[5] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  void v1[6] = v3;
  v1[7] = *(void *)(v3 + 64);
  v1[8] = swift_task_alloc();
  v1[9] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E4B35694, 0, 0);
}

uint64_t sub_1E4B35694()
{
  v0[10] = *(void *)(v0[2] + OBJC_IVAR____TtC17PrivacySettingsUI19FindMyLocateSession_session);
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[11] = v1;
  void *v1 = v0;
  v1[1] = sub_1E4B3574C;
  uint64_t v2 = v0[9];
  return MEMORY[0x1F41194D0](v2);
}

uint64_t sub_1E4B3574C()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1E4B35A84;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_1E4B35868;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E4B35868()
{
  uint64_t v1 = (char *)v0[2];
  uint64_t v18 = OBJC_IVAR____TtC17PrivacySettingsUI19FindMyLocateSession_preferenceChangesTask;
  uint64_t v2 = v1;
  if (*(void *)&v1[OBJC_IVAR____TtC17PrivacySettingsUI19FindMyLocateSession_preferenceChangesTask])
  {
    swift_retain();
    sub_1E4B3E8C8();
    swift_release();
    uint64_t v2 = (void *)v0[2];
  }
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[9];
  uint64_t v6 = v0[6];
  uint64_t v5 = v0[7];
  uint64_t v7 = v0[4];
  uint64_t v8 = v0[5];
  uint64_t v16 = v4;
  uint64_t v17 = v0[3];
  uint64_t v9 = sub_1E4B3E898();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v3, v4, v8);
  unint64_t v10 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v11 = (v5 + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = 0;
  *(void *)(v12 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v6 + 32))(v12 + v10, v3, v8);
  *(void *)(v12 + v11) = v2;
  *(void *)(v12 + ((v11 + 15) & 0xFFFFFFFFFFFFFFF8)) = v17;
  id v13 = v2;
  *(void *)&v1[v18] = sub_1E4B36BF4(v7, (uint64_t)&unk_1EAE8A1B0, v12);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v16, v8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  BOOL v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_1E4B35A84()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
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

uint64_t sub_1E4B35B54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[10] = a4;
  v5[11] = a5;
  uint64_t v6 = sub_1E4B3E778();
  v5[12] = v6;
  v5[13] = *(void *)(v6 - 8);
  v5[14] = swift_task_alloc();
  uint64_t v7 = sub_1E4B3E6F8();
  v5[15] = v7;
  uint8_t v5[16] = *(void *)(v7 - 8);
  v5[17] = swift_task_alloc();
  v5[18] = swift_task_alloc();
  v5[19] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8A2D0);
  v5[20] = swift_task_alloc();
  v5[21] = swift_task_alloc();
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  uint64_t v8 = sub_1E4B3E6B8();
  v5[24] = v8;
  v5[25] = *(void *)(v8 - 8);
  v5[26] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8A2D8);
  v5[27] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8A2E0);
  v5[28] = v9;
  v5[29] = *(void *)(v9 - 8);
  v5[30] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E4B35DC8, 0, 0);
}

uint64_t sub_1E4B35DC8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8A190);
  sub_1E4B3E8A8();
  uint64_t v1 = OBJC_IVAR____TtC17PrivacySettingsUI19FindMyLocateSession_meDeviceUpdateCallback;
  *(void *)(v0 + 24_Block_object_dispose(&a9, 8) = OBJC_IVAR____TtC17PrivacySettingsUI19FindMyLocateSession_shareMyLocationUpdateCallback;
  *(void *)(v0 + 256) = v1;
  swift_beginAccess();
  swift_beginAccess();
  *(_DWORD *)(v0 + 272) = *MEMORY[0x1E4F61B18];
  *(_DWORD *)(v0 + 276) = *MEMORY[0x1E4F61B00];
  uint64_t v2 = (_DWORD *)MEMORY[0x1E4F61B08];
  *(_DWORD *)(v0 + 280) = *MEMORY[0x1E4F61B10];
  *(_DWORD *)(v0 + 284) = *v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 264) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1E4B35F20;
  uint64_t v4 = *(void *)(v0 + 216);
  uint64_t v5 = *(void *)(v0 + 224);
  return MEMORY[0x1F4187D58](v4, 0, 0, v5);
}

uint64_t sub_1E4B35F20()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1E4B3601C, 0, 0);
}

uint64_t sub_1E4B3601C()
{
  uint64_t v81 = v0;
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v2 = *(void *)(v0 + 192);
  uint64_t v3 = *(void *)(v0 + 200);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 232) + 8))(*(void *)(v0 + 240), *(void *)(v0 + 224));
    if (qword_1EAE8A168 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(*(void *)(v0 + 96), (uint64_t)qword_1EAE8AB60);
    uint64_t v4 = sub_1E4B3E758();
    os_log_type_t v5 = sub_1E4B3E8E8();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1E4AD5000, v4, v5, "Successfully startMonitoringPreferencesChange", v6, 2u);
      MEMORY[0x1E4E88AA0](v6, -1, -1);
    }

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
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
  else
  {
    int v9 = *(_DWORD *)(v0 + 272);
    uint64_t v10 = *(void *)(v0 + 208);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v10, v1, v2);
    int v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v10, v2);
    if (v11 == v9)
    {
      uint64_t v12 = *(void *)(v0 + 208);
      uint64_t v13 = *(void *)(v0 + 184);
      (*(void (**)(uint64_t, void))(*(void *)(v0 + 200) + 96))(v12, *(void *)(v0 + 192));
      sub_1E4B3B40C(v12, v13);
      if (qword_1EAE8A168 != -1) {
        swift_once();
      }
      uint64_t v14 = *(void *)(v0 + 176);
      uint64_t v15 = *(void *)(v0 + 184);
      __swift_project_value_buffer(*(void *)(v0 + 96), (uint64_t)qword_1EAE8AB60);
      sub_1E4B3B474(v15, v14);
      uint64_t v16 = sub_1E4B3E758();
      os_log_type_t v17 = sub_1E4B3E8E8();
      BOOL v18 = os_log_type_enabled(v16, v17);
      uint64_t v19 = *(void *)(v0 + 176);
      if (v18)
      {
        uint64_t v20 = *(void *)(v0 + 168);
        uint64_t v21 = swift_slowAlloc();
        uint64_t v22 = swift_slowAlloc();
        uint64_t v80 = v22;
        *(_DWORD *)uint64_t v21 = 136315138;
        sub_1E4B3B474(v19, v20);
        uint64_t v23 = sub_1E4B3E848();
        *(void *)(v21 + 4) = sub_1E4B39D34(v23, v24, &v80);
        swift_bridgeObjectRelease();
        sub_1E4B3B4DC(v19, &qword_1EAE8A2D0);
        _os_log_impl(&dword_1E4AD5000, v16, v17, "Preferences stream receive meDevice updated: %s", (uint8_t *)v21, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1E4E88AA0](v22, -1, -1);
        MEMORY[0x1E4E88AA0](v21, -1, -1);
      }
      else
      {
        sub_1E4B3B4DC(*(void *)(v0 + 176), &qword_1EAE8A2D0);
      }

      uint64_t v42 = *(void *)(v0 + 160);
      uint64_t v43 = *(void *)(v0 + 120);
      uint64_t v44 = *(void *)(v0 + 128);
      sub_1E4B3B474(*(void *)(v0 + 184), v42);
      int v45 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v44 + 48))(v42, 1, v43);
      uint64_t v46 = *(void *)(v0 + 256);
      if (v45 == 1)
      {
        uint64_t v47 = *(void *)(v0 + 88);
        sub_1E4B3B4DC(*(void *)(v0 + 160), &qword_1EAE8A2D0);
        __int16 v48 = *(void (**)(void))(v47 + v46);
        if (v48)
        {
          swift_retain();
          v48(0);
          sub_1E4B34E38((uint64_t)v48);
        }
        uint64_t v49 = *(void *)(v0 + 184);
      }
      else
      {
        uint64_t v54 = *(void *)(v0 + 88);
        (*(void (**)(void, void, void))(*(void *)(v0 + 128) + 32))(*(void *)(v0 + 144), *(void *)(v0 + 160), *(void *)(v0 + 120));
        v55 = *(void (**)(id))(v54 + v46);
        if (v55)
        {
          uint64_t v56 = *(void *)(v0 + 136);
          uint64_t v57 = *(void *)(v0 + 120);
          uint64_t v58 = *(void *)(v0 + 128);
          (*(void (**)(uint64_t, void, uint64_t))(v58 + 16))(v56, *(void *)(v0 + 144), v57);
          v59 = (objc_class *)type metadata accessor for PUIFMLDevice();
          id v60 = objc_allocWithZone(v59);
          sub_1E4B34CF8((uint64_t)v55);
          v61 = v60;
          uint64_t v62 = sub_1E4B3E6E8();
          v63 = (uint64_t *)&v61[OBJC_IVAR____TtC17PrivacySettingsUI12PUIFMLDevice_identifier];
          uint64_t *v63 = v62;
          v63[1] = v64;
          uint64_t v65 = sub_1E4B3E6D8();
          v66 = (uint64_t *)&v61[OBJC_IVAR____TtC17PrivacySettingsUI12PUIFMLDevice_deviceName];
          uint64_t *v66 = v65;
          v66[1] = v67;
          v61[OBJC_IVAR____TtC17PrivacySettingsUI12PUIFMLDevice_isThisDevice] = sub_1E4B3E6C8() & 1;

          *(void *)(v0 + 64) = v61;
          *(void *)(v0 + 72) = v59;
          id v68 = objc_msgSendSuper2((objc_super *)(v0 + 64), sel_init);
          v69 = *(void (**)(uint64_t, uint64_t))(v58 + 8);
          v69(v56, v57);
          v55(v68);

          sub_1E4B34E38((uint64_t)v55);
        }
        else
        {
          v69 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 128) + 8);
        }
        uint64_t v76 = *(void *)(v0 + 184);
        v69(*(void *)(v0 + 144), *(void *)(v0 + 120));
        uint64_t v49 = v76;
      }
      sub_1E4B3B4DC(v49, &qword_1EAE8A2D0);
    }
    else if (v11 == *(_DWORD *)(v0 + 276))
    {
      uint64_t v25 = *(unsigned __int8 **)(v0 + 208);
      (*(void (**)(unsigned __int8 *, void))(*(void *)(v0 + 200) + 96))(v25, *(void *)(v0 + 192));
      uint64_t v26 = *v25;
      if (qword_1EAE8A168 != -1) {
        swift_once();
      }
      uint64_t v28 = *(void *)(v0 + 104);
      uint64_t v27 = *(void *)(v0 + 112);
      uint64_t v29 = *(void *)(v0 + 96);
      uint64_t v30 = __swift_project_value_buffer(v29, (uint64_t)qword_1EAE8AB60);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v27, v30, v29);
      v31 = sub_1E4B3E758();
      os_log_type_t v32 = sub_1E4B3E8E8();
      BOOL v33 = os_log_type_enabled(v31, v32);
      uint64_t v35 = *(void *)(v0 + 104);
      uint64_t v34 = *(void *)(v0 + 112);
      uint64_t v36 = *(void *)(v0 + 96);
      if (v33)
      {
        uint64_t v37 = swift_slowAlloc();
        uint64_t v38 = swift_slowAlloc();
        uint64_t v80 = v38;
        *(_DWORD *)uint64_t v37 = 136315138;
        if (v26) {
          uint64_t v39 = 1702195828;
        }
        else {
          uint64_t v39 = 0x65736C6166;
        }
        if (v26) {
          unint64_t v40 = 0xE400000000000000;
        }
        else {
          unint64_t v40 = 0xE500000000000000;
        }
        *(void *)(v37 + 4) = sub_1E4B39D34(v39, v40, &v80);
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1E4AD5000, v31, v32, "Preferences stream receive Share My Location switch update. Enabled?: %s", (uint8_t *)v37, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1E4E88AA0](v38, -1, -1);
        MEMORY[0x1E4E88AA0](v37, -1, -1);
      }

      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v36);
      long long v41 = *(void (**)(uint64_t))(*(void *)(v0 + 88) + *(void *)(v0 + 248));
      if (v41)
      {
        swift_retain();
        v41(v26);
        sub_1E4B34E38((uint64_t)v41);
      }
    }
    else if (v11 == *(_DWORD *)(v0 + 280) || v11 == *(_DWORD *)(v0 + 284))
    {
      if (qword_1EAE8A168 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(*(void *)(v0 + 96), (uint64_t)qword_1EAE8AB60);
      v51 = sub_1E4B3E758();
      os_log_type_t v52 = sub_1E4B3E8E8();
      if (os_log_type_enabled(v51, v52))
      {
        v53 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v53 = 0;
        _os_log_impl(&dword_1E4AD5000, v51, v52, "Preferences stream, update received but meDevice did not change", v53, 2u);
        MEMORY[0x1E4E88AA0](v53, -1, -1);
      }
    }
    else
    {
      if (qword_1EAE8A168 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(*(void *)(v0 + 96), (uint64_t)qword_1EAE8AB60);
      v70 = sub_1E4B3E758();
      os_log_type_t v71 = sub_1E4B3E8D8();
      if (os_log_type_enabled(v70, v71))
      {
        v72 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v72 = 0;
        _os_log_impl(&dword_1E4AD5000, v70, v71, "Unknown update type, meDevice did not change", v72, 2u);
        MEMORY[0x1E4E88AA0](v72, -1, -1);
      }
      uint64_t v74 = *(void *)(v0 + 200);
      uint64_t v73 = *(void *)(v0 + 208);
      uint64_t v75 = *(void *)(v0 + 192);

      (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v73, v75);
    }
    v77 = (void *)swift_task_alloc();
    *(void *)(v0 + 264) = v77;
    void *v77 = v0;
    v77[1] = sub_1E4B35F20;
    uint64_t v78 = *(void *)(v0 + 216);
    uint64_t v79 = *(void *)(v0 + 224);
    return MEMORY[0x1F4187D58](v78, 0, 0, v79);
  }
}

uint64_t sub_1E4B369C8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8A190);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, ((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v5);
}

uint64_t sub_1E4B36ABC(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8A190) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_1E4B3B6BC;
  return sub_1E4B35B54(a1, v6, v7, v8, v9);
}

uint64_t sub_1E4B36BF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E4B3E898();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1E4B3E888();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1E4B3B4DC(a1, &qword_1EAE8A188);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1E4B3E878();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1E4B36F08(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1E4B36FB0;
  return sub_1E4B3557C();
}

uint64_t sub_1E4B36FB0()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  unint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  uint64_t v7 = *(void *)(v3 + 24);
  if (v2)
  {
    uint64_t v8 = (void *)sub_1E4B3E638();

    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  _Block_release(*(const void **)(v4 + 24));
  uint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

uint64_t sub_1E4B37134()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x1F4188298](sub_1E4B37154, 0, 0);
}

uint64_t sub_1E4B37154()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = OBJC_IVAR____TtC17PrivacySettingsUI19FindMyLocateSession_preferenceChangesTask;
  if (*(void *)(v1 + OBJC_IVAR____TtC17PrivacySettingsUI19FindMyLocateSession_preferenceChangesTask))
  {
    swift_retain();
    sub_1E4B3E8C8();
    swift_release();
  }
  *(void *)(v1 + v2) = 0;
  swift_release();
  if (qword_1EAE8A168 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1E4B3E778();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EAE8AB60);
  uint64_t v4 = sub_1E4B3E758();
  os_log_type_t v5 = sub_1E4B3E8E8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1E4AD5000, v4, v5, "FindMyLocateSession: Successfully stopMonitoringPreferencesChange", v6, 2u);
    MEMORY[0x1E4E88AA0](v6, -1, -1);
  }

  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1E4B37464(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  id v4 = a2;
  os_log_type_t v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  *os_log_type_t v5 = v2;
  v5[1] = sub_1E4B3B6B0;
  v5[2] = v4;
  return MEMORY[0x1F4188298](sub_1E4B37154, 0, 0);
}

uint64_t sub_1E4B37524()
{
  v1[10] = v0;
  uint64_t v2 = sub_1E4B3E6A8();
  v1[11] = v2;
  v1[12] = *(void *)(v2 - 8);
  v1[13] = swift_task_alloc();
  uint64_t v3 = sub_1E4B3E6F8();
  v1[14] = v3;
  v1[15] = *(void *)(v3 - 8);
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  v1[19] = swift_task_alloc();
  v1[20] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E4B37674, 0, 0);
}

uint64_t sub_1E4B37674()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = OBJC_IVAR____TtC17PrivacySettingsUI19FindMyLocateSession_session;
  v0[21] = OBJC_IVAR____TtC17PrivacySettingsUI19FindMyLocateSession_session;
  v0[22] = *(void *)(v1 + v2);
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[23] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1E4B37734;
  uint64_t v4 = v0[20];
  return MEMORY[0x1F41194B0](v4, 1);
}

uint64_t sub_1E4B37734()
{
  *(void *)(*(void *)v1 + 192) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1E4B37BC0;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_1E4B37850;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E4B37850()
{
  BOOL v33 = v0;
  if (qword_1EAE8A168 != -1) {
    swift_once();
  }
  Class super_class = v0[9].super_class;
  id receiver = v0[10].receiver;
  id v3 = v0[7].receiver;
  Class v4 = v0[7].super_class;
  uint64_t v5 = sub_1E4B3E778();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EAE8AB60);
  v31 = (void (*)(Class, id, id))*((void *)v4 + 2);
  v31(super_class, receiver, v3);
  uint64_t v6 = sub_1E4B3E758();
  os_log_type_t v7 = sub_1E4B3E8E8();
  BOOL v8 = os_log_type_enabled(v6, v7);
  Class v9 = v0[9].super_class;
  id v10 = v0[7].receiver;
  Class v11 = v0[7].super_class;
  if (v8)
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v32 = v30;
    *(_DWORD *)uint64_t v12 = 136315138;
    sub_1E4B3B668(&qword_1EAE8A1D8, MEMORY[0x1E4F61B40]);
    uint64_t v13 = sub_1E4B3E988();
    v0[4].Class super_class = (Class)sub_1E4B39D34(v13, v14, &v32);
    sub_1E4B3E908();
    swift_bridgeObjectRelease();
    uint64_t v15 = (void (*)(Class, id))*((void *)v11 + 1);
    v15(v9, v10);
    _os_log_impl(&dword_1E4AD5000, v6, v7, "Successfully got active location sharing device: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1E4E88AA0](v30, -1, -1);
    MEMORY[0x1E4E88AA0](v12, -1, -1);
  }
  else
  {
    uint64_t v15 = (void (*)(Class, id))*((void *)v11 + 1);
    v15(v0[9].super_class, v0[7].receiver);
  }

  id v16 = v0[10].receiver;
  os_log_type_t v17 = (objc_class *)v0[9].receiver;
  id v18 = v0[7].receiver;
  v31(v17, v16, v18);
  uint64_t v19 = (objc_class *)type metadata accessor for PUIFMLDevice();
  uint64_t v20 = objc_allocWithZone(v19);
  uint64_t v21 = sub_1E4B3E6E8();
  uint64_t v22 = (uint64_t *)&v20[OBJC_IVAR____TtC17PrivacySettingsUI12PUIFMLDevice_identifier];
  uint64_t *v22 = v21;
  v22[1] = v23;
  uint64_t v24 = sub_1E4B3E6D8();
  uint64_t v25 = (uint64_t *)&v20[OBJC_IVAR____TtC17PrivacySettingsUI12PUIFMLDevice_deviceName];
  *uint64_t v25 = v24;
  v25[1] = v26;
  v20[OBJC_IVAR____TtC17PrivacySettingsUI12PUIFMLDevice_isThisDevice] = sub_1E4B3E6C8() & 1;

  v0[2].id receiver = v20;
  v0[2].Class super_class = v19;
  id v27 = objc_msgSendSuper2(v0 + 2, sel_init);
  v15(v17, v18);
  v15((Class)v16, v18);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v28 = (uint64_t (*)(id))v0->super_class;
  return v28(v27);
}

uint64_t sub_1E4B37BC0()
{
  uint64_t v1 = *(void **)(v0 + 192);
  swift_release();
  *(void *)(v0 + 4_Block_object_dispose(&a9, 8) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8A1C8);
  if (swift_dynamicCast())
  {
    if ((*(unsigned int (**)(void, void))(*(void *)(v0 + 96) + 88))(*(void *)(v0 + 104), *(void *)(v0 + 88)) == *MEMORY[0x1E4F61AA8])
    {

      if (qword_1EAE8A168 != -1) {
        swift_once();
      }
      uint64_t v3 = sub_1E4B3E778();
      *(void *)(v0 + 200) = __swift_project_value_buffer(v3, (uint64_t)qword_1EAE8AB60);
      Class v4 = sub_1E4B3E758();
      os_log_type_t v5 = sub_1E4B3E8E8();
      if (os_log_type_enabled(v4, v5))
      {
        uint64_t v6 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_1E4AD5000, v4, v5, "Error getting cached location sharing device, trying not cached.", v6, 2u);
        MEMORY[0x1E4E88AA0](v6, -1, -1);
      }
      uint64_t v7 = *(void *)(v0 + 168);
      uint64_t v8 = *(void *)(v0 + 80);

      *(void *)(v0 + 20_Block_object_dispose(&a9, 8) = *(void *)(v8 + v7);
      swift_retain();
      Class v9 = (void *)swift_task_alloc();
      *(void *)(v0 + 216) = v9;
      *Class v9 = v0;
      v9[1] = sub_1E4B37FD0;
      uint64_t v10 = *(void *)(v0 + 136);
      return MEMORY[0x1F41194B0](v10, 0);
    }
    (*(void (**)(void, void))(*(void *)(v0 + 96) + 8))(*(void *)(v0 + 104), *(void *)(v0 + 88));
  }

  if (qword_1EAE8A168 != -1) {
    swift_once();
  }
  Class v11 = *(void **)(v0 + 192);
  uint64_t v12 = sub_1E4B3E778();
  __swift_project_value_buffer(v12, (uint64_t)qword_1EAE8AB60);
  id v13 = v11;
  unint64_t v14 = sub_1E4B3E758();
  os_log_type_t v15 = sub_1E4B3E8D8();
  BOOL v16 = os_log_type_enabled(v14, v15);
  os_log_type_t v17 = *(void **)(v0 + 192);
  if (v16)
  {
    id v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = (void *)swift_slowAlloc();
    *(_DWORD *)id v18 = 138543362;
    uint64_t v20 = sub_1E4B3E638();
    *(void *)(v0 + 56) = v20;
    sub_1E4B3E908();
    *uint64_t v19 = v20;

    _os_log_impl(&dword_1E4AD5000, v14, v15, "Error getting active location sharing device: %{public}@", v18, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8A1D0);
    swift_arrayDestroy();
    MEMORY[0x1E4E88AA0](v19, -1, -1);
    MEMORY[0x1E4E88AA0](v18, -1, -1);
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
  uint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
  return v21();
}

uint64_t sub_1E4B37FD0()
{
  *(void *)(*(void *)v1 + 224) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = sub_1E4B3840C;
  }
  else
  {
    swift_release();
    id v2 = sub_1E4B380EC;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E4B380EC()
{
  uint64_t v28 = v0;
  uint64_t v1 = (void (*)(id, Class, id))*((void *)v0[7].super_class + 2);
  v1(v0[8].receiver, v0[8].super_class, v0[7].receiver);
  id v2 = sub_1E4B3E758();
  os_log_type_t v3 = sub_1E4B3E8E8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v26 = v1;
    Class super_class = v0[7].super_class;
    id receiver = v0[8].receiver;
    id v24 = v0[7].receiver;
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v27 = v25;
    *(_DWORD *)uint64_t v6 = 136315138;
    sub_1E4B3B668(&qword_1EAE8A1D8, MEMORY[0x1E4F61B40]);
    uint64_t v7 = sub_1E4B3E988();
    v0[4].id receiver = (id)sub_1E4B39D34(v7, v8, &v27);
    sub_1E4B3E908();
    swift_bridgeObjectRelease();
    Class v9 = (void (*)(id, id))*((void *)super_class + 1);
    v9(receiver, v24);
    uint64_t v1 = v26;
    _os_log_impl(&dword_1E4AD5000, v2, v3, "Successfully got non-cached active location sharing device: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1E4E88AA0](v25, -1, -1);
    MEMORY[0x1E4E88AA0](v6, -1, -1);
  }
  else
  {
    Class v9 = (void (*)(id, id))*((void *)v0[7].super_class + 1);
    v9(v0[8].receiver, v0[7].receiver);
  }

  Class v10 = v0[8].super_class;
  id v11 = v0[9].receiver;
  id v12 = v0[7].receiver;
  v1(v11, v10, v12);
  id v13 = (objc_class *)type metadata accessor for PUIFMLDevice();
  unint64_t v14 = objc_allocWithZone(v13);
  uint64_t v15 = sub_1E4B3E6E8();
  BOOL v16 = (uint64_t *)&v14[OBJC_IVAR____TtC17PrivacySettingsUI12PUIFMLDevice_identifier];
  uint64_t *v16 = v15;
  v16[1] = v17;
  uint64_t v18 = sub_1E4B3E6D8();
  uint64_t v19 = (uint64_t *)&v14[OBJC_IVAR____TtC17PrivacySettingsUI12PUIFMLDevice_deviceName];
  *uint64_t v19 = v18;
  v19[1] = v20;
  v14[OBJC_IVAR____TtC17PrivacySettingsUI12PUIFMLDevice_isThisDevice] = sub_1E4B3E6C8() & 1;

  v0[1].id receiver = v14;
  v0[1].Class super_class = v13;
  id v21 = objc_msgSendSuper2(v0 + 1, sel_init);
  v9(v11, v12);
  v9(v10, v12);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = (uint64_t (*)(id))v0->super_class;
  return v22(v21);
}

uint64_t sub_1E4B3840C()
{
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E4B3862C(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1E4B386D4;
  return sub_1E4B37524();
}

uint64_t sub_1E4B386D4(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void **)(*v2 + 16);
  uint64_t v7 = *v2;
  swift_task_dealloc();

  unint64_t v8 = *(void (***)(void, void, void))(v5 + 24);
  if (v3)
  {
    Class v9 = (void *)sub_1E4B3E638();

    ((void (**)(void, void, void *))v8)[2](v8, 0, v9);
    _Block_release(v8);
  }
  else
  {
    ((void (**)(void, void *, void))v8)[2](v8, a1, 0);
    _Block_release(v8);
  }
  Class v10 = *(uint64_t (**)(void))(v7 + 8);
  return v10();
}

uint64_t sub_1E4B38874()
{
  *(void *)(v1 + 24) = v0;
  return MEMORY[0x1F4188298](sub_1E4B38894, 0, 0);
}

uint64_t sub_1E4B38894()
{
  v0[4] = *(void *)(v0[3] + OBJC_IVAR____TtC17PrivacySettingsUI19FindMyLocateSession_session);
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[5] = v1;
  void *v1 = v0;
  v1[1] = sub_1E4B38948;
  return MEMORY[0x1F4119470](1);
}

uint64_t sub_1E4B38948(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 4_Block_object_dispose(&a9, 8) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x1F4188298](sub_1E4B38A98, 0, 0);
  }
  else
  {
    swift_release();
    uint64_t v5 = *(uint64_t (**)(void))(v4 + 8);
    return v5(a1 & 1);
  }
}

uint64_t sub_1E4B38A98()
{
  swift_release();
  if (qword_1EAE8A168 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[6];
  uint64_t v2 = sub_1E4B3E778();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAE8AB60);
  id v3 = v1;
  uint64_t v4 = sub_1E4B3E758();
  os_log_type_t v5 = sub_1E4B3E8D8();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (void *)v0[6];
  if (v6)
  {
    unint64_t v8 = (uint8_t *)swift_slowAlloc();
    Class v9 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v8 = 138543362;
    uint64_t v10 = sub_1E4B3E638();
    v0[2] = v10;
    sub_1E4B3E908();
    *Class v9 = v10;

    _os_log_impl(&dword_1E4AD5000, v4, v5, "Error getting active my location enabled setting: %{public}@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8A1D0);
    swift_arrayDestroy();
    MEMORY[0x1E4E88AA0](v9, -1, -1);
    MEMORY[0x1E4E88AA0](v8, -1, -1);
  }
  else
  {
  }
  swift_willThrow();
  id v11 = (uint64_t (*)(void))v0[1];
  return v11(0);
}

uint64_t sub_1E4B38DE8(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  id v4 = a2;
  os_log_type_t v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  *os_log_type_t v5 = v2;
  v5[1] = sub_1E4B38EAC;
  v5[3] = v4;
  return MEMORY[0x1F4188298](sub_1E4B38894, 0, 0);
}

uint64_t sub_1E4B38EAC(char a1)
{
  id v3 = v1;
  uint64_t v6 = *v2;
  uint64_t v5 = *v2;
  uint64_t v7 = *(void **)(*v2 + 16);
  uint64_t v8 = *v2;
  swift_task_dealloc();

  uint64_t v9 = *(void *)(v5 + 24);
  if (v3)
  {
    uint64_t v10 = (void *)sub_1E4B3E638();

    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
  else
  {
    (*(void (**)(uint64_t, void, void))(v9 + 16))(v9, a1 & 1, 0);
  }
  _Block_release(*(const void **)(v6 + 24));
  id v11 = *(uint64_t (**)(void))(v8 + 8);
  return v11();
}

id FindMyLocateSession.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id FindMyLocateSession.init()()
{
  id v1 = v0;
  uint64_t v2 = sub_1E4B3E678();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E4B3E688();
  MEMORY[0x1F4188790]();
  uint64_t v6 = &v1[OBJC_IVAR____TtC17PrivacySettingsUI19FindMyLocateSession_meDeviceUpdateCallback];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = &v1[OBJC_IVAR____TtC17PrivacySettingsUI19FindMyLocateSession_shareMyLocationUpdateCallback];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  uint64_t v8 = OBJC_IVAR____TtC17PrivacySettingsUI19FindMyLocateSession_session;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4F61AA0], v2);
  uint64_t v9 = v1;
  sub_1E4B3E698();
  sub_1E4B3E738();
  swift_allocObject();
  *(void *)&v1[v8] = sub_1E4B3E748();
  v9[OBJC_IVAR____TtC17PrivacySettingsUI19FindMyLocateSession_isInitialized] = 0;
  *(void *)&v9[OBJC_IVAR____TtC17PrivacySettingsUI19FindMyLocateSession_initContinuations] = MEMORY[0x1E4FBC860];
  *(void *)&v9[OBJC_IVAR____TtC17PrivacySettingsUI19FindMyLocateSession_preferenceChangesTask] = 0;

  Session = (objc_class *)type metadata accessor for FindMyLocateSession();
  v12.id receiver = v9;
  v12.Class super_class = Session;
  return objc_msgSendSuper2(&v12, sel_init);
}

id FindMyLocateSession.__deallocating_deinit()
{
  v2.id receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for FindMyLocateSession();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1E4B3930C(uint64_t a1, uint64_t a2)
{
  return sub_1E4B39478(a1, a2, MEMORY[0x1E4F27EB8]);
}

uint64_t sub_1E4B39324(uint64_t a1, id *a2)
{
  uint64_t result = sub_1E4B3E808();
  *a2 = 0;
  return result;
}

uint64_t sub_1E4B3939C(uint64_t a1, id *a2)
{
  char v3 = sub_1E4B3E818();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1E4B3941C@<X0>(uint64_t *a1@<X8>)
{
  sub_1E4B3E828();
  uint64_t v2 = sub_1E4B3E7F8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1E4B39460(uint64_t a1, uint64_t a2)
{
  return sub_1E4B39478(a1, a2, MEMORY[0x1E4FBB198]);
}

uint64_t sub_1E4B39478(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_1E4B3E828();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1E4B394BC()
{
  sub_1E4B3E828();
  sub_1E4B3E858();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E4B39510()
{
  sub_1E4B3E828();
  sub_1E4B3E9A8();
  sub_1E4B3E858();
  uint64_t v0 = sub_1E4B3E9B8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1E4B39584()
{
  uint64_t v0 = sub_1E4B3E828();
  uint64_t v2 = v1;
  if (v0 == sub_1E4B3E828() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1E4B3E998();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1E4B39610@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1E4B3E7F8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1E4B39658@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1E4B3E828();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1E4B39684(uint64_t a1)
{
  uint64_t v2 = sub_1E4B3B668((unint64_t *)&qword_1EAE8A308, (void (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v3 = sub_1E4B3B668(&qword_1EAE8A310, (void (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];
  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

uint64_t sub_1E4B39740(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1E4B3981C;
  return v6(a1);
}

uint64_t sub_1E4B3981C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1E4B39914(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_1E4B3B6BC;
  return v6();
}

uint64_t sub_1E4B399E0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  char v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *char v5 = v4;
  v5[1] = sub_1E4B3B6BC;
  return v7();
}

uint64_t sub_1E4B39AAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E4B3E898();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1E4B3E888();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1E4B3B4DC(a1, &qword_1EAE8A188);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1E4B3E878();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1E4B39C58(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1E4B3B6E4;
  return v6(a1);
}

uint64_t sub_1E4B39D34(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1E4B39E08(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1E4B3B290((uint64_t)v12, *a3);
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
      sub_1E4B3B290((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1E4B39E08(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1E4B3E918();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1E4B39FC4(a5, a6);
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
  uint64_t v8 = sub_1E4B3E938();
  if (!v8)
  {
    sub_1E4B3E948();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1E4B3E968();
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

uint64_t sub_1E4B39FC4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1E4B3A05C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1E4B3A23C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1E4B3A23C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1E4B3A05C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1E4B3A1D4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1E4B3E928();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1E4B3E948();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1E4B3E868();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1E4B3E968();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1E4B3E948();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1E4B3A1D4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8A2B8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1E4B3A23C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8A2B8);
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
  uint64_t result = sub_1E4B3E968();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for FindMyLocateSession()
{
  return self;
}

uint64_t method lookup function for FindMyLocateSession(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FindMyLocateSession);
}

uint64_t dispatch thunk of FindMyLocateSession.meDeviceUpdateCallback.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of FindMyLocateSession.meDeviceUpdateCallback.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of FindMyLocateSession.meDeviceUpdateCallback.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of FindMyLocateSession.shareMyLocationUpdateCallback.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of FindMyLocateSession.shareMyLocationUpdateCallback.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of FindMyLocateSession.shareMyLocationUpdateCallback.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of FindMyLocateSession.startMonitoringPrefrenceChanges()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x1E4FBC8C8] & *v0) + 0x110);
  size_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *unint64_t v3 = v1;
  v3[1] = sub_1E4B3A60C;
  return v5();
}

uint64_t sub_1E4B3A60C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t dispatch thunk of FindMyLocateSession.stopMonitoringPreferenceChanges()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x1E4FBC8C8] & *v0) + 0x118);
  size_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1E4B3B6BC;
  return v5();
}

uint64_t dispatch thunk of FindMyLocateSession.getActiveLocationSharingDevice()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x1E4FBC8C8] & *v0) + 0x120);
  size_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1E4B3A918;
  return v5();
}

uint64_t sub_1E4B3A918(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of FindMyLocateSession.isMyLocationEnabled()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x1E4FBC8C8] & *v0) + 0x128);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1E4B3A918;
  return v5();
}

uint64_t sub_1E4B3AB24()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1E4B3A60C;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_1EAE8A218 + dword_1EAE8A218);
  return v5(v2, v3);
}

uint64_t sub_1E4B3ABD4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1E4B3B6BC;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1EAE8A228 + dword_1EAE8A228);
  return v6(v2, v3, v4);
}

uint64_t sub_1E4B3AC98(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1E4B3B6BC;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EAE8A238 + dword_1EAE8A238);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1E4B3AD64(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1E4B3B6BC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EAE8A248 + dword_1EAE8A248);
  return v6(a1, v4);
}

uint64_t sub_1E4B3AE20()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1E4B3B6BC;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_1EAE8A258 + dword_1EAE8A258);
  return v5(v2, v3);
}

uint64_t sub_1E4B3AED8()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1E4B3B6BC;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_1EAE8A278 + dword_1EAE8A278);
  return v5(v2, v3);
}

uint64_t objectdestroy_27Tm()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1E4B3AFD0()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1E4B3B6BC;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_1EAE8A298 + dword_1EAE8A298);
  return v5(v2, v3);
}

uint64_t objectdestroy_31Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1E4B3B0C4()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E4B3B0FC(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
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

uint64_t sub_1E4B3B12C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1E4B3B140()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1E4B3B178(char a1)
{
  uint64_t v2 = *(uint64_t (**)(char *))(v1 + 16);
  char v4 = a1;
  return v2(&v4);
}

uint64_t sub_1E4B3B1B0(unsigned __int8 *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_1E4B3B1DC(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_1E4B3B214(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
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

uint64_t sub_1E4B3B290(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_1E4B3B354(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1E4B3B6BC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EAE8A2C0 + dword_1EAE8A2C0);
  return v6(a1, v4);
}

uint64_t sub_1E4B3B40C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8A2D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E4B3B474(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8A2D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E4B3B4DC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void type metadata accessor for OpenExternalURLOptionsKey()
{
  if (!qword_1EAE8A2E8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EAE8A2E8);
    }
  }
}

uint64_t sub_1E4B3B590()
{
  return sub_1E4B3B668(&qword_1EAE8A2F0, (void (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_1E4B3B5D8()
{
  return sub_1E4B3B668(&qword_1EAE8A2F8, (void (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_1E4B3B620()
{
  return sub_1E4B3B668(&qword_1EAE8A300, (void (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_1E4B3B668(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t PUIFMLDevice.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC17PrivacySettingsUI12PUIFMLDevice_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PUIFMLDevice.deviceName.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC17PrivacySettingsUI12PUIFMLDevice_deviceName);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PUIFMLDevice.isThisDevice.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC17PrivacySettingsUI12PUIFMLDevice_isThisDevice);
}

id PUIFMLDevice.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void PUIFMLDevice.init()()
{
}

id PUIFMLDevice.__deallocating_deinit()
{
  v2.id receiver = v0;
  v2.Class super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PUIFMLDevice()
{
  return self;
}

uint64_t method lookup function for PUIFMLDevice(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PUIFMLDevice);
}

uint64_t sub_1E4B3B93C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return MEMORY[0x1F414B008](a1, a2, a3, a4, 0xD00000000000001ELL, 0x80000001E4B4D180, sub_1E4B3B9E0, 0);
}

void sub_1E4B3B9E0()
{
  id v0 = objc_msgSend(self, sel_sharedApplication);
  id v1 = (void *)sub_1E4B3E648();
  sub_1E4B3BABC(MEMORY[0x1E4FBC860]);
  type metadata accessor for OpenExternalURLOptionsKey();
  sub_1E4B3C530();
  id v2 = (id)sub_1E4B3E7C8();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_openURL_options_completionHandler_, v1, v2, 0);
}

unint64_t sub_1E4B3BABC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8A350);
  uint64_t v2 = sub_1E4B3E958();
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
    sub_1E4B3C588(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_1E4B3BE94(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_1E4B3C5F0(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
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

id sub_1E4B3BC38(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    uint64_t v10 = (void *)sub_1E4B3E7F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  v14.id receiver = v5;
  v14.Class super_class = ObjectType;
  id v11 = objc_msgSendSuper2(&v14, sel_initWithStyle_reuseIdentifier_specifier_, a1, v10, a4);

  id v12 = v11;
  if (v12) {

  }
  return v12;
}

id sub_1E4B3BE38()
{
  v2.id receiver = v0;
  v2.Class super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PrivacySettingsPlacardCell()
{
  return self;
}

unint64_t sub_1E4B3BE94(uint64_t a1)
{
  sub_1E4B3E828();
  sub_1E4B3E9A8();
  sub_1E4B3E858();
  uint64_t v2 = sub_1E4B3E9B8();
  swift_bridgeObjectRelease();
  return sub_1E4B3BF28(a1, v2);
}

unint64_t sub_1E4B3BF28(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_1E4B3E828();
    uint64_t v8 = v7;
    if (v6 == sub_1E4B3E828() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_1E4B3E998();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_1E4B3E828();
          uint64_t v15 = v14;
          if (v13 == sub_1E4B3E828() && v15 == v16) {
            break;
          }
          char v18 = sub_1E4B3E998();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
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

uint64_t sub_1E4B3C0A0()
{
  id v1 = v0;
  swift_getObjectType();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8A330);
  uint64_t v3 = *(void *)(v2 - 8);
  ((void (*)(void))MEMORY[0x1F4188790])();
  unint64_t v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E4B3E7E8();
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  MEMORY[0x1F4188790](v6);
  uint64_t v7 = sub_1E4B3E668();
  MEMORY[0x1F4188790](v7 - 8);
  objc_msgSend(v1, sel_setSelectionStyle_, 0);
  sub_1E4B3E7D8();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v9 = self;
  id v10 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1E4B3E658();
  uint64_t v11 = sub_1E4B3E838();
  uint64_t v13 = v12;
  sub_1E4B3E7D8();
  id v14 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1E4B3E658();
  uint64_t v15 = sub_1E4B3E838();
  v18[4] = v11;
  v18[5] = v13;
  v18[6] = v15;
  v18[7] = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8A338);
  sub_1E4B3C488(&qword_1EAE8A340, &qword_1EAE8A338);
  sub_1E4B3E798();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E4B3E7A8();
  v19[3] = v2;
  v19[4] = sub_1E4B3C488(&qword_1EAE8A348, &qword_1EAE8A330);
  __swift_allocate_boxed_opaque_existential_1(v19);
  sub_1E4B3E788();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return MEMORY[0x1E4E87C20](v19);
}

uint64_t sub_1E4B3C434()
{
  return sub_1E4B3B93C(v0[2], v0[3], v0[4], v0[5]);
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

uint64_t sub_1E4B3C488(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  id v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_1E4B3C530()
{
  unint64_t result = qword_1EAE8A308;
  if (!qword_1EAE8A308)
  {
    type metadata accessor for OpenExternalURLOptionsKey();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE8A308);
  }
  return result;
}

uint64_t sub_1E4B3C588(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8A358);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1E4B3C5F0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1E4B3C600()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
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

void __get_aks_client_connection_block_invoke()
{
  if (!get_aks_client_connection_connection) {
    get_aks_client_connection_connection = _copy_aks_client_connection("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
  }
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
  mach_port_t v3 = *MEMORY[0x1E4F2EF00];
  io_service_t v4 = IORegistryEntryFromPath(*MEMORY[0x1E4F2EF00], path);
  unint64_t v5 = (task_port_t *)MEMORY[0x1E4F14960];
  if (!v4 || (io_object_t v6 = v4, v7 = IOServiceOpen(v4, *MEMORY[0x1E4F14960], 0, &connect), IOObjectRelease(v6), v7))
  {
    uint64_t v8 = IOServiceMatching(a2);
    MatchingService = IOServiceGetMatchingService(v3, v8);
    if (MatchingService)
    {
      id v10 = MatchingService;
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

uint64_t aks_bak_get_beacon_internal()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  long long v2 = v1;
  io_service_t v4 = v3;
  size_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = v0;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  memset(v19, 0, sizeof(v19));
  bzero(__s, 0x4000uLL);
  size_t v15 = 0x4000;
  input[0] = 1;
  input[1] = v9;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v11 = IOConnectCallMethod(aks_client_connection, 0x87u, input, 2u, v8, v6, 0, 0, __s, &v15);
    if (v11)
    {
      uint64_t v13 = v11;
    }
    else
    {
      __memcpy_chk();
      void *v2 = 44;
      uint64_t v12 = calloc(0x2CuLL, 1uLL);
      *io_service_t v4 = v12;
      if (v12)
      {
        __memcpy_chk();
        uint64_t v13 = 0;
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
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_bak_get_beacon_internal", ":", 3491, "", 0, "", "");
  }
  memset_s(__s, 0x4000uLL, 0, 0x4000uLL);
  return v13;
}

uint64_t aks_bak_get_beacon()
{
  uint64_t beacon_internal = aks_bak_get_beacon_internal();
  if (beacon_internal) {
    return beacon_internal;
  }
  else {
    return 3758604312;
  }
}

uint64_t __getSFSafariViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAKAccountManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getAKAccountManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAKDeviceListRequestContextClass_block_invoke_cold_1(v0);
}

uint64_t __getAKDeviceListRequestContextClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getUMUserManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getUMUserManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getLockdownModeManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getLockdownModeManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __get_WKSystemPreferencesClass_block_invoke_cold_1(v0);
}

uint64_t __getFKBankConnectOfflineLabConsentCoordinatorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __83__PUIFitnessPlusAnalyticsConsentCoordinator_fetchSubscriptionStatusWithCompletion___block_invoke_cold_1(v0);
}

void __getAMSAcknowledgePrivacyTaskClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getASDSubscriptionEntitlementsClass_block_invoke_cold_1(v0);
}

void __getASDSubscriptionEntitlementsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  -[PSPowerlogListController tableView:didSelectRowAtIndexPath:](v0);
}

uint64_t __getRTCReportingClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCloudTelemetryReporterClass_block_invoke_cold_1(v0);
}

uint64_t __getCloudTelemetryReporterClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAATransparencyLoggingClass_block_invoke_cold_1(v0);
}

uint64_t __getAATransparencyLoggingClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __get_DPReportFileManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getSPMLLoggingClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPLDiagnosticsClass_block_invoke_cold_1(v0);
}

uint64_t __getPLDiagnosticsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPLDatabaseReaderClass_block_invoke_cold_1(v0);
}

uint64_t __getPLDatabaseReaderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getOBPrivacyPresenterClass_block_invoke_cold_1(v0);
}

uint64_t __getOBPrivacyPresenterClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getNRPairedDeviceRegistryClass_block_invoke_cold_1(v0);
}

uint64_t __getNRPairedDeviceRegistryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAFSettingsConnectionClass_block_invoke_cold_1(v0);
}

uint64_t __getAFSettingsConnectionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCIDVUIIdentityProofingDataSharingFlowManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getCIDVUIIdentityProofingDataSharingFlowManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHealthAppAnalyticsStoreClass_block_invoke_cold_1(v0);
}

uint64_t __getHealthAppAnalyticsStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKHealthStoreClass_block_invoke_cold_1(v0);
}

uint64_t __getHKHealthStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKHealthRecordsStoreClass_block_invoke_cold_1(v0);
}

uint64_t __getHKHealthRecordsStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPSUIDeviceTakeOverControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getPSUIDeviceTakeOverControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __PUITribecaSupportedText_block_invoke_cold_1(v0);
}

void __PUITribecaSupportedText_block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  long long v2 = "PUITribecaSupportedText_block_invoke";
  _os_log_error_impl(&dword_1E4AD5000, log, OS_LOG_TYPE_ERROR, "%s: didn't find tribeca text.", (uint8_t *)&v1, 0xCu);
}

void PUIIsUserParcElisabethEligible_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1E4AD5000, log, OS_LOG_TYPE_ERROR, "PE:Unable to determine eligibility ", v1, 2u);
}

void PUIIsUserParcElisabethEligible_cold_2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1E4AD5000, a2, OS_LOG_TYPE_ERROR, "PE: Cannot determine eligibility due to error: %d", (uint8_t *)v2, 8u);
}

void __PUICalendarAuthorizationStatesForService_block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1E4AD5000, log, OS_LOG_TYPE_ERROR, "Error when requesting TCC for service: %@ error: %@", (uint8_t *)&v4, 0x16u);
}

uint64_t __getCNPrivateAccessAggregatorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCNLimitedAccessContactPickerViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getCNLimitedAccessContactPickerViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCNContactGroupVisualizerClass_block_invoke_cold_1(v0);
}

uint64_t __getCNContactGroupVisualizerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __PUIContactsAuthorizationStatesForService_block_invoke_cold_1(v0);
}

void __PUIContactsAuthorizationStatesForService_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1E4AD5000, v0, v1, "Error when requesting TCC for service: %@ error: %@");
}

uint64_t __getFPAccessControlManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __56__PUILocationServicesListController_updateLocationUsage__block_invoke_cold_1(v0);
}

void __getCLLocationManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getPSGFindMyiPhoneControllerClass_block_invoke_cold_1(v0);
}

void __getPSGFindMyiPhoneControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getTUCallCapabilitiesClass_block_invoke_cold_1(v0);
}

void __getTUCallCapabilitiesClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  PUILogForCategory_cold_1(v0);
}

void PUILogForCategory_cold_1()
{
}

void __PUIPhotosAuthorizationStatesForService_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1E4AD5000, v0, v1, "Error when requesting TCC for service: %@ error: %@");
}

uint64_t __getNudityDetectionPreferencesHelperClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __33__PUIReportController_didTapSave__block_invoke_294_cold_1(v0);
}

uint64_t __getPAAccessReaderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[PUIReportSensorEventsController headerForCategory:](v0);
}

uint64_t sub_1E4B3E638()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1E4B3E648()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1E4B3E658()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1E4B3E668()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1E4B3E678()
{
  return MEMORY[0x1F4119360]();
}

uint64_t sub_1E4B3E688()
{
  return MEMORY[0x1F4119368]();
}

uint64_t sub_1E4B3E698()
{
  return MEMORY[0x1F4119370]();
}

uint64_t sub_1E4B3E6A8()
{
  return MEMORY[0x1F4119390]();
}

uint64_t sub_1E4B3E6B8()
{
  return MEMORY[0x1F41193C0]();
}

uint64_t sub_1E4B3E6C8()
{
  return MEMORY[0x1F41193E8]();
}

uint64_t sub_1E4B3E6D8()
{
  return MEMORY[0x1F41193F0]();
}

uint64_t sub_1E4B3E6E8()
{
  return MEMORY[0x1F41193F8]();
}

uint64_t sub_1E4B3E6F8()
{
  return MEMORY[0x1F4119400]();
}

uint64_t sub_1E4B3E738()
{
  return MEMORY[0x1F41194E8]();
}

uint64_t sub_1E4B3E748()
{
  return MEMORY[0x1F41194F0]();
}

uint64_t sub_1E4B3E758()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1E4B3E768()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1E4B3E778()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1E4B3E788()
{
  return MEMORY[0x1F40FA448]();
}

uint64_t sub_1E4B3E798()
{
  return MEMORY[0x1F40FA450]();
}

uint64_t sub_1E4B3E7A8()
{
  return MEMORY[0x1F40FAE28]();
}

uint64_t sub_1E4B3E7C8()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1E4B3E7D8()
{
  return MEMORY[0x1F40E60A8]();
}

uint64_t sub_1E4B3E7E8()
{
  return MEMORY[0x1F40E6158]();
}

uint64_t sub_1E4B3E7F8()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1E4B3E808()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1E4B3E818()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1E4B3E828()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1E4B3E838()
{
  return MEMORY[0x1F40E62C8]();
}

uint64_t sub_1E4B3E848()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1E4B3E858()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1E4B3E868()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1E4B3E878()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1E4B3E888()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1E4B3E898()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1E4B3E8A8()
{
  return MEMORY[0x1F4187D50]();
}

uint64_t sub_1E4B3E8C8()
{
  return MEMORY[0x1F4187D98]();
}

uint64_t sub_1E4B3E8D8()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1E4B3E8E8()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1E4B3E8F8()
{
  return MEMORY[0x1F41664E8]();
}

uint64_t sub_1E4B3E908()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1E4B3E918()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1E4B3E928()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1E4B3E938()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1E4B3E948()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1E4B3E958()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1E4B3E968()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1E4B3E988()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1E4B3E998()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1E4B3E9A8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1E4B3E9B8()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t ADClientSetValueForScalarKey()
{
  return MEMORY[0x1F4107218]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7450](bundle);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1F40D7528](allocator, bundleURL);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1F40D7538](bundleID);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7578](bundle);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D18]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFArrayRef CFPreferencesCopyApplicationList(CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x1F40D7EB0](userName, hostName);
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

void CGImageRelease(CGImageRef image)
{
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

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t GEOGetDefaultBOOL()
{
  return MEMORY[0x1F411C180]();
}

uint64_t GEOGetDefaultInteger()
{
  return MEMORY[0x1F411C188]();
}

uint64_t GEOSetDefault()
{
  return MEMORY[0x1F411C3B8]();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1F40E86C8](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1F40E9188](*(void *)&mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1F40E9240](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1F40E9280](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t LICreateIconForBundle()
{
  return MEMORY[0x1F412F8B8]();
}

uint64_t LICreateIconForImage()
{
  return MEMORY[0x1F412F8C0]();
}

uint64_t LocalizableGTStringKeyForKey()
{
  return MEMORY[0x1F4145E58]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
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

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t PSBlankIconImage()
{
  return MEMORY[0x1F4145E60]();
}

uint64_t PSBundlePathForPreferenceBundle()
{
  return MEMORY[0x1F4145E68]();
}

uint64_t PSIsInEDUMode()
{
  return MEMORY[0x1F4145E80]();
}

uint64_t PSIsRunningInAssistant()
{
  return MEMORY[0x1F4145E90]();
}

uint64_t PSIsiPad()
{
  return MEMORY[0x1F4145E98]();
}

uint64_t PSRoundToPixel()
{
  return MEMORY[0x1F4145EA8]();
}

uint64_t PSSiriImage()
{
  return MEMORY[0x1F4145EB8]();
}

uint64_t PSUsedByManagedAccount()
{
  return MEMORY[0x1F4145ED8]();
}

uint64_t PreferencesTableViewFooterColor()
{
  return MEMORY[0x1F4145EF0]();
}

uint64_t PreferencesTableViewFooterFont()
{
  return MEMORY[0x1F4145EF8]();
}

uint64_t SFIsAppWithBundleIDInstalled()
{
  return MEMORY[0x1F414B018]();
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return MEMORY[0x1F414B028]();
}

uint64_t SFRuntimeAbsoluteFilePathForPath()
{
  return MEMORY[0x1F414B060]();
}

uint64_t ScreenScale()
{
  return MEMORY[0x1F4145F00]();
}

uint64_t SpecifiersFromPlist()
{
  return MEMORY[0x1F4145F08]();
}

uint64_t TCCAccessCopyBundleIdentifiersDisabledForService()
{
  return MEMORY[0x1F415CB68]();
}

uint64_t TCCAccessCopyBundleIdentifiersForService()
{
  return MEMORY[0x1F415CB70]();
}

uint64_t TCCAccessCopyInformation()
{
  return MEMORY[0x1F415CB78]();
}

uint64_t TCCAccessGetOverride()
{
  return MEMORY[0x1F415CBA8]();
}

uint64_t TCCAccessSetForBundleId()
{
  return MEMORY[0x1F415CC30]();
}

uint64_t TCCAccessSetOverride()
{
  return MEMORY[0x1F415CC40]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4166BA0](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4166C48]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4166C50]();
}

uint64_t _AXSAudioDonationSiriImprovementEnabled()
{
  return MEMORY[0x1F4178950]();
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

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1F40CA660](__count, __size);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1F40CCD40](__s, __smax, *(void *)&__c, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
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

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x1F40CD2B0]();
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

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
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

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

void syslog(int a1, const char *a2, ...)
{
}

uint64_t tcc_authorization_record_get_authorization_right()
{
  return MEMORY[0x1F415CC68]();
}

uint64_t tcc_authorization_record_get_has_prompted_for_allow()
{
  return MEMORY[0x1F415CC78]();
}

uint64_t tcc_authorization_record_get_service()
{
  return MEMORY[0x1F415CC80]();
}

uint64_t tcc_authorization_record_get_subject_identity()
{
  return MEMORY[0x1F415CC90]();
}

uint64_t tcc_identity_create()
{
  return MEMORY[0x1F415CCF0]();
}

uint64_t tcc_identity_get_identifier()
{
  return MEMORY[0x1F415CD00]();
}

uint64_t tcc_object_equal()
{
  return MEMORY[0x1F415CD78]();
}

uint64_t tcc_server_create()
{
  return MEMORY[0x1F415CD80]();
}

uint64_t tcc_server_message_get_authorization_records_by_identity()
{
  return MEMORY[0x1F415CD90]();
}

uint64_t tcc_server_message_get_authorization_records_by_service()
{
  return MEMORY[0x1F415CD98]();
}

uint64_t tcc_server_message_prompt_authorization_value()
{
  return MEMORY[0x1F415CDA8]();
}

uint64_t tcc_server_message_set_authorization_value()
{
  return MEMORY[0x1F415CDC8]();
}

uint64_t tcc_service_get_name()
{
  return MEMORY[0x1F415CDE8]();
}

uint64_t tcc_service_singleton_for_CF_name()
{
  return MEMORY[0x1F415CDF8]();
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1F40CEB18](xBOOL);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}