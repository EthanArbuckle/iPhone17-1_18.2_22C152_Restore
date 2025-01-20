uint64_t SASExpressSettingsPrivacyBundleReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        v23 = PBReaderReadString();
        v24 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v23;
      }
      else if ((v10 >> 3) == 2)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        while (1)
        {
          v20 = *v3;
          v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_31;
          }
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          v19 = 0;
        }
LABEL_33:
        *(void *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1DCC74AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DCC76838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DCC76A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose((const void *)(v8 - 64), 8);
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

void sub_1DCC76CCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose((const void *)(v8 - 64), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DCC76E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DCC770B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFPreferencesClass_block_invoke(uint64_t a1)
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
    long long v5 = xmmword_1E6CAB610;
    uint64_t v6 = 0;
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
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
    Class result = objc_getClass("AFPreferences");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getAFPreferencesClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAFPreferencesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AssistantServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getSUManagerClientClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SoftwareUpdateServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SoftwareUpdateServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6CAB648;
    uint64_t v6 = 0;
    SoftwareUpdateServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!SoftwareUpdateServicesLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("SUManagerClient");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getSUManagerClientClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSUManagerClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SoftwareUpdateServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SoftwareUpdateServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getPKPassLibraryClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!PassKitCoreLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __PassKitCoreLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6CAB660;
    uint64_t v6 = 0;
    PassKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!PassKitCoreLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("PKPassLibrary");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getPKPassLibraryClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPKPassLibraryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PassKitCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PassKitCoreLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getNRMigratorClass_block_invoke(uint64_t a1)
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
    long long v5 = xmmword_1E6CAB678;
    uint64_t v6 = 0;
    NanoRegistryLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
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
    Class result = objc_getClass("NRMigrator");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getNRMigratorClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getNRMigratorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __NanoRegistryLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoRegistryLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getOBBundleClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!OnBoardingKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __OnBoardingKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6CAB690;
    uint64_t v6 = 0;
    OnBoardingKitLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!OnBoardingKitLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("OBBundle");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getOBBundleClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getOBBundleClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __OnBoardingKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  OnBoardingKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getFMDFMIPManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!FindMyDeviceLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __FindMyDeviceLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6CAB6A8;
    uint64_t v6 = 0;
    FindMyDeviceLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!FindMyDeviceLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("FMDFMIPManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getFMDFMIPManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getFMDFMIPManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __FindMyDeviceLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FindMyDeviceLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getSTManagementStateClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __ScreenTimeCoreLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6CAB6C0;
    uint64_t v6 = 0;
    ScreenTimeCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("STManagementState");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getSTManagementStateClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSTManagementStateClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ScreenTimeCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ScreenTimeCoreLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getUISUserInterfaceStyleModeClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!UIKitServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __UIKitServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6CAB6D8;
    uint64_t v6 = 0;
    UIKitServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!UIKitServicesLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("UISUserInterfaceStyleMode");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getUISUserInterfaceStyleModeClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getUISUserInterfaceStyleModeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __UIKitServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UIKitServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCADisplayClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!QuartzCoreLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __QuartzCoreLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6CAB6F0;
    uint64_t v6 = 0;
    QuartzCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!QuartzCoreLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("CADisplay");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getCADisplayClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCADisplayClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __QuartzCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  QuartzCoreLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1DCC787D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DCC78E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t SASExpressSettingsReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
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
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
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
            goto LABEL_155;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_157;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_155:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_157:
        uint64_t v123 = 88;
        goto LABEL_202;
      case 2u:
        uint64_t v24 = PBReaderReadData();
        uint64_t v25 = 104;
        goto LABEL_139;
      case 3u:
        uint64_t v24 = PBReaderReadData();
        uint64_t v25 = 96;
        goto LABEL_139;
      case 4u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v28 = 0;
        *(_WORD *)(a1 + 128) |= 8u;
        while (2)
        {
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v30 + 1;
            v28 |= (unint64_t)(v31 & 0x7F) << v26;
            if (v31 < 0)
            {
              v26 += 7;
              BOOL v14 = v27++ >= 9;
              if (v14)
              {
                uint64_t v28 = 0;
                goto LABEL_161;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v28 = 0;
        }
LABEL_161:
        BOOL v124 = v28 != 0;
        uint64_t v125 = 113;
        goto LABEL_223;
      case 5u:
        char v32 = 0;
        unsigned int v33 = 0;
        uint64_t v34 = 0;
        *(_WORD *)(a1 + 128) |= 4u;
        while (2)
        {
          uint64_t v35 = *v3;
          unint64_t v36 = *(void *)(a2 + v35);
          if (v36 == -1 || v36 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
            *(void *)(a2 + v35) = v36 + 1;
            v34 |= (unint64_t)(v37 & 0x7F) << v32;
            if (v37 < 0)
            {
              v32 += 7;
              BOOL v14 = v33++ >= 9;
              if (v14)
              {
                uint64_t v34 = 0;
                goto LABEL_165;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v34 = 0;
        }
LABEL_165:
        BOOL v124 = v34 != 0;
        uint64_t v125 = 112;
        goto LABEL_223;
      case 6u:
        char v38 = 0;
        unsigned int v39 = 0;
        uint64_t v40 = 0;
        *(_WORD *)(a1 + 128) |= 0x40u;
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
            char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
            *(void *)(a2 + v41) = v42 + 1;
            v40 |= (unint64_t)(v43 & 0x7F) << v38;
            if (v43 < 0)
            {
              v38 += 7;
              BOOL v14 = v39++ >= 9;
              if (v14)
              {
                uint64_t v40 = 0;
                goto LABEL_169;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v40 = 0;
        }
LABEL_169:
        BOOL v124 = v40 != 0;
        uint64_t v125 = 116;
        goto LABEL_223;
      case 7u:
        char v44 = 0;
        unsigned int v45 = 0;
        uint64_t v46 = 0;
        *(_WORD *)(a1 + 128) |= 0x20u;
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
            v46 |= (unint64_t)(v49 & 0x7F) << v44;
            if (v49 < 0)
            {
              v44 += 7;
              BOOL v14 = v45++ >= 9;
              if (v14)
              {
                uint64_t v46 = 0;
                goto LABEL_173;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v46 = 0;
        }
LABEL_173:
        BOOL v124 = v46 != 0;
        uint64_t v125 = 115;
        goto LABEL_223;
      case 8u:
        char v50 = 0;
        unsigned int v51 = 0;
        uint64_t v52 = 0;
        *(_WORD *)(a1 + 128) |= 0x200u;
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
            v52 |= (unint64_t)(v55 & 0x7F) << v50;
            if (v55 < 0)
            {
              v50 += 7;
              BOOL v14 = v51++ >= 9;
              if (v14)
              {
                uint64_t v52 = 0;
                goto LABEL_177;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v52 = 0;
        }
LABEL_177:
        BOOL v124 = v52 != 0;
        uint64_t v125 = 119;
        goto LABEL_223;
      case 9u:
        char v56 = 0;
        unsigned int v57 = 0;
        uint64_t v58 = 0;
        *(_WORD *)(a1 + 128) |= 0x80u;
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
            v58 |= (unint64_t)(v61 & 0x7F) << v56;
            if (v61 < 0)
            {
              v56 += 7;
              BOOL v14 = v57++ >= 9;
              if (v14)
              {
                uint64_t v58 = 0;
                goto LABEL_181;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v58 = 0;
        }
LABEL_181:
        BOOL v124 = v58 != 0;
        uint64_t v125 = 117;
        goto LABEL_223;
      case 0xAu:
        char v62 = 0;
        unsigned int v63 = 0;
        uint64_t v64 = 0;
        *(_WORD *)(a1 + 128) |= 0x1000u;
        while (2)
        {
          uint64_t v65 = *v3;
          unint64_t v66 = *(void *)(a2 + v65);
          if (v66 == -1 || v66 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v67 = *(unsigned char *)(*(void *)(a2 + *v7) + v66);
            *(void *)(a2 + v65) = v66 + 1;
            v64 |= (unint64_t)(v67 & 0x7F) << v62;
            if (v67 < 0)
            {
              v62 += 7;
              BOOL v14 = v63++ >= 9;
              if (v14)
              {
                uint64_t v64 = 0;
                goto LABEL_185;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v64 = 0;
        }
LABEL_185:
        BOOL v124 = v64 != 0;
        uint64_t v125 = 122;
        goto LABEL_223;
      case 0xBu:
        char v68 = 0;
        unsigned int v69 = 0;
        uint64_t v70 = 0;
        *(_WORD *)(a1 + 128) |= 0x800u;
        while (2)
        {
          uint64_t v71 = *v3;
          unint64_t v72 = *(void *)(a2 + v71);
          if (v72 == -1 || v72 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v73 = *(unsigned char *)(*(void *)(a2 + *v7) + v72);
            *(void *)(a2 + v71) = v72 + 1;
            v70 |= (unint64_t)(v73 & 0x7F) << v68;
            if (v73 < 0)
            {
              v68 += 7;
              BOOL v14 = v69++ >= 9;
              if (v14)
              {
                uint64_t v70 = 0;
                goto LABEL_189;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v70 = 0;
        }
LABEL_189:
        BOOL v124 = v70 != 0;
        uint64_t v125 = 121;
        goto LABEL_223;
      case 0xCu:
        char v74 = 0;
        unsigned int v75 = 0;
        uint64_t v76 = 0;
        *(_WORD *)(a1 + 128) |= 0x100u;
        while (2)
        {
          uint64_t v77 = *v3;
          unint64_t v78 = *(void *)(a2 + v77);
          if (v78 == -1 || v78 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v79 = *(unsigned char *)(*(void *)(a2 + *v7) + v78);
            *(void *)(a2 + v77) = v78 + 1;
            v76 |= (unint64_t)(v79 & 0x7F) << v74;
            if (v79 < 0)
            {
              v74 += 7;
              BOOL v14 = v75++ >= 9;
              if (v14)
              {
                uint64_t v76 = 0;
                goto LABEL_193;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v76 = 0;
        }
LABEL_193:
        BOOL v124 = v76 != 0;
        uint64_t v125 = 118;
        goto LABEL_223;
      case 0xDu:
        char v80 = 0;
        unsigned int v81 = 0;
        uint64_t v19 = 0;
        *(_WORD *)(a1 + 128) |= 1u;
        while (2)
        {
          uint64_t v82 = *v3;
          unint64_t v83 = *(void *)(a2 + v82);
          if (v83 == -1 || v83 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v84 = *(unsigned char *)(*(void *)(a2 + *v7) + v83);
            *(void *)(a2 + v82) = v83 + 1;
            v19 |= (unint64_t)(v84 & 0x7F) << v80;
            if (v84 < 0)
            {
              v80 += 7;
              BOOL v14 = v81++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_197;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_197:
        uint64_t v123 = 16;
        goto LABEL_202;
      case 0xEu:
        v85 = objc_alloc_init(SASExpressSettingsPrivacyBundle);
        uint64_t v86 = 24;
        goto LABEL_105;
      case 0xFu:
        v85 = objc_alloc_init(SASExpressSettingsPrivacyBundle);
        uint64_t v86 = 8;
        goto LABEL_105;
      case 0x10u:
        v85 = objc_alloc_init(SASExpressSettingsPrivacyBundle);
        uint64_t v86 = 56;
        goto LABEL_105;
      case 0x11u:
        v85 = objc_alloc_init(SASExpressSettingsPrivacyBundle);
        uint64_t v86 = 48;
        goto LABEL_105;
      case 0x12u:
        v85 = objc_alloc_init(SASExpressSettingsPrivacyBundle);
        uint64_t v86 = 80;
LABEL_105:
        objc_storeStrong((id *)(a1 + v86), v85);
        if PBReaderPlaceMark() && (SASExpressSettingsPrivacyBundleReadFrom((uint64_t)v85, a2))
        {
          PBReaderRecallMark();

LABEL_224:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 0x13u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 64;
        goto LABEL_139;
      case 0x14u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 32;
        goto LABEL_139;
      case 0x15u:
        char v87 = 0;
        unsigned int v88 = 0;
        uint64_t v19 = 0;
        *(_WORD *)(a1 + 128) |= 2u;
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
            v19 |= (unint64_t)(v91 & 0x7F) << v87;
            if (v91 < 0)
            {
              v87 += 7;
              BOOL v14 = v88++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_201;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_201:
        uint64_t v123 = 40;
LABEL_202:
        *(_DWORD *)(a1 + v123) = v19;
        goto LABEL_224;
      case 0x16u:
        char v92 = 0;
        unsigned int v93 = 0;
        uint64_t v94 = 0;
        *(_WORD *)(a1 + 128) |= 0x8000u;
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
            char v97 = *(unsigned char *)(*(void *)(a2 + *v7) + v96);
            *(void *)(a2 + v95) = v96 + 1;
            v94 |= (unint64_t)(v97 & 0x7F) << v92;
            if (v97 < 0)
            {
              v92 += 7;
              BOOL v14 = v93++ >= 9;
              if (v14)
              {
                uint64_t v94 = 0;
                goto LABEL_206;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v94 = 0;
        }
LABEL_206:
        BOOL v124 = v94 != 0;
        uint64_t v125 = 125;
        goto LABEL_223;
      case 0x17u:
        char v98 = 0;
        unsigned int v99 = 0;
        uint64_t v100 = 0;
        *(_WORD *)(a1 + 128) |= 0x10u;
        while (2)
        {
          uint64_t v101 = *v3;
          unint64_t v102 = *(void *)(a2 + v101);
          if (v102 == -1 || v102 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v103 = *(unsigned char *)(*(void *)(a2 + *v7) + v102);
            *(void *)(a2 + v101) = v102 + 1;
            v100 |= (unint64_t)(v103 & 0x7F) << v98;
            if (v103 < 0)
            {
              v98 += 7;
              BOOL v14 = v99++ >= 9;
              if (v14)
              {
                uint64_t v100 = 0;
                goto LABEL_210;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v100 = 0;
        }
LABEL_210:
        BOOL v124 = v100 != 0;
        uint64_t v125 = 114;
        goto LABEL_223;
      case 0x18u:
        char v104 = 0;
        unsigned int v105 = 0;
        uint64_t v106 = 0;
        *(_WORD *)(a1 + 128) |= 0x400u;
        while (2)
        {
          uint64_t v107 = *v3;
          unint64_t v108 = *(void *)(a2 + v107);
          if (v108 == -1 || v108 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v109 = *(unsigned char *)(*(void *)(a2 + *v7) + v108);
            *(void *)(a2 + v107) = v108 + 1;
            v106 |= (unint64_t)(v109 & 0x7F) << v104;
            if (v109 < 0)
            {
              v104 += 7;
              BOOL v14 = v105++ >= 9;
              if (v14)
              {
                uint64_t v106 = 0;
                goto LABEL_214;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v106 = 0;
        }
LABEL_214:
        BOOL v124 = v106 != 0;
        uint64_t v125 = 120;
        goto LABEL_223;
      case 0x19u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 72;
LABEL_139:
        v110 = *(void **)(a1 + v25);
        *(void *)(a1 + v25) = v24;

        goto LABEL_224;
      case 0x1Au:
        char v111 = 0;
        unsigned int v112 = 0;
        uint64_t v113 = 0;
        *(_WORD *)(a1 + 128) |= 0x2000u;
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
                goto LABEL_218;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v113 = 0;
        }
LABEL_218:
        BOOL v124 = v113 != 0;
        uint64_t v125 = 123;
        goto LABEL_223;
      case 0x1Bu:
        char v117 = 0;
        unsigned int v118 = 0;
        uint64_t v119 = 0;
        *(_WORD *)(a1 + 128) |= 0x4000u;
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
                goto LABEL_222;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v119 = 0;
        }
LABEL_222:
        BOOL v124 = v119 != 0;
        uint64_t v125 = 124;
LABEL_223:
        *(unsigned char *)(a1 + v125) = v124;
        goto LABEL_224;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_224;
    }
  }
}

void sub_1DCC8059C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose((const void *)(v7 - 64), 8);
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

void sub_1DCC819D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t scanComplete(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 wirelessScanComplete:a2 error:a3];
}

id getCLLocationManagerClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getCLLocationManagerClass_softClass;
  uint64_t v7 = getCLLocationManagerClass_softClass;
  if (!getCLLocationManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCLLocationManagerClass_block_invoke;
    v3[3] = &unk_1E6CAB5F0;
    v3[4] = &v4;
    __getCLLocationManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DCC81AE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DCC81F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DCC82244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFMDFMIPManagerClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!FindMyDeviceLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __FindMyDeviceLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6CABB10;
    uint64_t v6 = 0;
    FindMyDeviceLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!FindMyDeviceLibraryCore_frameworkLibrary_0)
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
    Class result = objc_getClass("FMDFMIPManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getFMDFMIPManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getFMDFMIPManagerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __FindMyDeviceLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  FindMyDeviceLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getMBManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!MobileBackupLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __MobileBackupLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6CABB28;
    uint64_t v5 = 0;
    MobileBackupLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!MobileBackupLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getMBManagerClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("MBManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getMBManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MobileBackupLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileBackupLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getBYDaemonCreateMetadataArchiveSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)SetupAssistantLibrary();
  uint64_t result = dlsym(v2, "BYDaemonCreateMetadataArchive");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBYDaemonCreateMetadataArchiveSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SetupAssistantLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __SetupAssistantLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6CABB40;
    uint64_t v5 = 0;
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = SetupAssistantLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!SetupAssistantLibraryCore_frameworkLibrary)
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

uint64_t __SetupAssistantLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCLLocationManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoreLocationLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __CoreLocationLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6CABB58;
    uint64_t v5 = 0;
    CoreLocationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreLocationLibraryCore_frameworkLibrary)
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
  getCLLocationManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreLocationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreLocationLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getMCFeatureDiagnosticsSubmissionAllowedSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)ManagedConfigurationLibrary();
  uint64_t result = dlsym(v2, "MCFeatureDiagnosticsSubmissionAllowed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMCFeatureDiagnosticsSubmissionAllowedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ManagedConfigurationLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __ManagedConfigurationLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6CABB70;
    uint64_t v5 = 0;
    ManagedConfigurationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = ManagedConfigurationLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
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

uint64_t __ManagedConfigurationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ManagedConfigurationLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getMCFeatureAppAnalyticsAllowedSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)ManagedConfigurationLibrary();
  uint64_t result = dlsym(v2, "MCFeatureAppAnalyticsAllowed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMCFeatureAppAnalyticsAllowedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAFPreferencesClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __AssistantServicesLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6CABB88;
    uint64_t v6 = 0;
    AssistantServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!AssistantServicesLibraryCore_frameworkLibrary_0)
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
    Class result = objc_getClass("AFPreferences");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getAFPreferencesClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAFPreferencesClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AssistantServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getSSRVoiceProfileManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!SpeakerRecognitionLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __SpeakerRecognitionLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6CABBA0;
    uint64_t v5 = 0;
    SpeakerRecognitionLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SpeakerRecognitionLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getSSRVoiceProfileManagerClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("SSRVoiceProfileManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getSSRVoiceProfileManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpeakerRecognitionLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpeakerRecognitionLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getBYLicenseAgreementClass_block_invoke(uint64_t a1)
{
  SetupAssistantLibrary();
  Class result = objc_getClass("BYLicenseAgreement");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBYLicenseAgreementClass_block_invoke_cold_1();
  }
  getBYLicenseAgreementClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCoreTelephonyClientClass_block_invoke(uint64_t a1)
{
  CoreTelephonyLibrary();
  Class result = objc_getClass("CoreTelephonyClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCoreTelephonyClientClass_block_invoke_cold_1();
  }
  getCoreTelephonyClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void CoreTelephonyLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!CoreTelephonyLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __CoreTelephonyLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6CABBB8;
    uint64_t v3 = 0;
    CoreTelephonyLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!CoreTelephonyLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __CoreTelephonyLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreTelephonyLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCTServiceDescriptorClass_block_invoke(uint64_t a1)
{
  CoreTelephonyLibrary();
  Class result = objc_getClass("CTServiceDescriptor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCTServiceDescriptorClass_block_invoke_cold_1();
  }
  getCTServiceDescriptorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  ManagedConfigurationLibrary();
  Class result = objc_getClass("MCProfileConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getMCProfileConnectionClass_block_invoke_cold_1();
  }
  getMCProfileConnectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __getAFPreferencesClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSUManagerClientClass_block_invoke_cold_1(v0);
}

uint64_t __getSUManagerClientClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPKPassLibraryClass_block_invoke_cold_1(v0);
}

uint64_t __getPKPassLibraryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getNRMigratorClass_block_invoke_cold_1(v0);
}

uint64_t __getNRMigratorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getOBBundleClass_block_invoke_cold_1(v0);
}

uint64_t __getOBBundleClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getFMDFMIPManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getFMDFMIPManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSTManagementStateClass_block_invoke_cold_1(v0);
}

uint64_t __getSTManagementStateClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getUISUserInterfaceStyleModeClass_block_invoke_cold_1(v0);
}

uint64_t __getUISUserInterfaceStyleModeClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCADisplayClass_block_invoke_cold_1(v0);
}

uint64_t __getCADisplayClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __58__SASCloudKitClient_fetchRecords_inZone_group_completion___block_invoke_cold_1(v0);
}

void __getMBManagerClass_block_invoke_cold_1()
{
}

void __getCLLocationManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getSSRVoiceProfileManagerClass_block_invoke_cold_1(v0);
}

void __getSSRVoiceProfileManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getBYLicenseAgreementClass_block_invoke_cold_1(v0);
}

void __getBYLicenseAgreementClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getCoreTelephonyClientClass_block_invoke_cold_1(v0);
}

void __getCoreTelephonyClientClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getCTServiceDescriptorClass_block_invoke_cold_1(v0);
}

void __getCTServiceDescriptorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMCProfileConnectionClass_block_invoke_cold_1(v0);
}

void __getMCProfileConnectionClass_block_invoke_cold_1()
{
  CFArrayRef v0 = (const __CFArray *)abort_report_np();
  CFArrayGetCount(v0);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1F4147240]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1F4147248]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

uint64_t TMIsAutomaticTimeZoneEnabled()
{
  return MEMORY[0x1F4115C80]();
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x1F412FD90]();
}

uint64_t WiFiDeviceClientScanAsync()
{
  return MEMORY[0x1F412FE38]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x1F412FE78]();
}

uint64_t WiFiManagerClientCopyNetworks()
{
  return MEMORY[0x1F412FE90]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x1F412FEA0]();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return MEMORY[0x1F412FF20]();
}

uint64_t WiFiNetworkCopyPassword()
{
  return MEMORY[0x1F412FF68]();
}

uint64_t WiFiNetworkCopyRecord()
{
  return MEMORY[0x1F412FF70]();
}

uint64_t WiFiNetworkGetType()
{
  return MEMORY[0x1F412FFE0]();
}

uint64_t WiFiNetworkIsCaptive()
{
  return MEMORY[0x1F412FFF8]();
}

uint64_t WiFiNetworkIsEAP()
{
  return MEMORY[0x1F4130008]();
}

uint64_t WiFiNetworkIsExpirable()
{
  return MEMORY[0x1F4130010]();
}

uint64_t WiFiNetworkIsProfileBased()
{
  return MEMORY[0x1F4130038]();
}

uint64_t _AXSCopySettingsDataBlobForBuddy()
{
  return MEMORY[0x1F4178A40]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1F40D8D10]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
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

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
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

void objc_end_catch(void)
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
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

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1F40CD658]();
}