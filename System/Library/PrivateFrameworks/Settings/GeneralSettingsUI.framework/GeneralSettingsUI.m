id _PSGLoggingFacility()
{
  void *v0;
  uint64_t vars8;

  if (_PSGLoggingFacility_onceToken != -1) {
    dispatch_once(&_PSGLoggingFacility_onceToken, &__block_literal_global_8);
  }
  v0 = (void *)_PSGLoggingFacility_oslog;
  return v0;
}

void sub_23D292500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
}

id PSG_BundleForGeneralSettingsUIFramework()
{
  if (PSG_BundleForGeneralSettingsUIFramework_onceToken != -1) {
    dispatch_once(&PSG_BundleForGeneralSettingsUIFramework_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)PSG_BundleForGeneralSettingsUIFramework__generalSettingsUIFrameworkBundle;
  return v0;
}

void sub_23D292CB8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

id PSG_LocalizedStringForGeneral(void *a1)
{
  id v1 = a1;
  uint64_t v2 = PSG_BundleForGeneralSettingsUIFramework();
  v3 = [v2 localizedStringForKey:v1 value:0 table:@"General"];

  return v3;
}

void sub_23D293BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _isDeviceNameEditable()
{
  if ([MEMORY[0x263F82438] isRunningInStoreDemoMode]) {
    return 0;
  }
  id v1 = [MEMORY[0x263F53C50] sharedConnection];
  uint64_t v2 = [v1 isDeviceNameModificationAllowed];

  return v2;
}

void sub_23D298684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t _shouldShowAccessoryInfo(void *a1)
{
  id v1 = a1;
  if ([v1 shouldBeHiddenFromUI]) {
    goto LABEL_9;
  }
  uint64_t v2 = [v1 bonjourName];
  if (v2)
  {
    v3 = (void *)v2;
    int v4 = [v1 isAvailableOverBonjour];

    if (!v4) {
      goto LABEL_9;
    }
  }
  v5 = [v1 bonjourName];
  if (!v5)
  {
    if ([v1 isConnected]) {
      goto LABEL_7;
    }
LABEL_9:
    uint64_t v7 = 0;
    goto LABEL_27;
  }

LABEL_7:
  v6 = [v1 manufacturer];
  if ([v6 length])
  {
    uint64_t v7 = 1;
  }
  else
  {
    v8 = [v1 serialNumber];
    if ([v8 length])
    {
      uint64_t v7 = 1;
    }
    else
    {
      v9 = [v1 modelNumber];
      if ([v9 length])
      {
        uint64_t v7 = 1;
      }
      else
      {
        v10 = [v1 firmwareRevision];
        if ([v10 length])
        {
          uint64_t v7 = 1;
        }
        else
        {
          v11 = [v1 hardwareRevision];
          if ([v11 length])
          {
            uint64_t v7 = 1;
          }
          else
          {
            v12 = [v1 bonjourName];
            if ([v12 length]) {
              uint64_t v7 = 1;
            }
            else {
              uint64_t v7 = [v1 supportsPublicIap];
            }
          }
        }
      }
    }
  }
LABEL_27:

  return v7;
}

uint64_t HostRenamedDevice(uint64_t a1, void *a2)
{
  return [a2 performUpdatesAnimated:0 usingBlock:&__block_literal_global_1170];
}

uint64_t __HostRenamedDevice_block_invoke(uint64_t a1, void *a2)
{
  return [a2 reloadSpecifierWithID:@"NAME_CELL_ID"];
}

void sub_23D2A0CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23D2A274C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23D2A27E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t TimeZoneConfirmed(uint64_t a1, void *a2)
{
  return [a2 reloadTimezone];
}

void sub_23D2A41A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23D2A78CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_23D2A7EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23D2A8078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFMDFMIPManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!FindMyDeviceLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __FindMyDeviceLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264E8CD90;
    uint64_t v6 = 0;
    FindMyDeviceLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
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
    uint64_t v2 = (void *)__getFMDFMIPManagerClass_block_invoke_cold_1();
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

uint64_t SensorKitLibraryCore()
{
  if (!SensorKitLibraryCore_frameworkLibrary) {
    SensorKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return SensorKitLibraryCore_frameworkLibrary;
}

uint64_t __SensorKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SensorKitLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getSRResetAllAuthorizationsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SensorKitLibrary();
  uint64_t result = dlsym(v2, "SRResetAllAuthorizations");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSRResetAllAuthorizationsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SensorKitLibrary()
{
  uint64_t v0 = SensorKitLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getSRAuthorizationClientClass_block_invoke(uint64_t a1)
{
  SensorKitLibrary();
  Class result = objc_getClass("SRAuthorizationClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSRAuthorizationClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSRAuthorizationClientClass_block_invoke_cold_1();
    return (Class)__getCHResetInventorySymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getCHResetInventorySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!CoreHandwritingLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __CoreHandwritingLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_264E8CDE0;
    uint64_t v7 = 0;
    CoreHandwritingLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)CoreHandwritingLibraryCore_frameworkLibrary;
    if (CoreHandwritingLibraryCore_frameworkLibrary)
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
  uint64_t v2 = (void *)CoreHandwritingLibraryCore_frameworkLibrary;
LABEL_5:
  Class result = dlsym(v2, "CHResetInventory");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCHResetInventorySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreHandwritingLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreHandwritingLibraryCore_frameworkLibrary = result;
  return result;
}

void __getDDRResetOptionsClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("DDRResetOptions");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getDDRResetOptionsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getDDRResetOptionsClass_block_invoke_cold_1();
    EmbeddedDataResetLibrary();
  }
}

void EmbeddedDataResetLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!EmbeddedDataResetLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __EmbeddedDataResetLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_264E8CDF8;
    uint64_t v3 = 0;
    EmbeddedDataResetLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!EmbeddedDataResetLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __EmbeddedDataResetLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  EmbeddedDataResetLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getMBManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!MobileBackupLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __MobileBackupLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264E8CE10;
    uint64_t v6 = 0;
    MobileBackupLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!MobileBackupLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("MBManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getMBManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
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

Class __getDDRResetRequestClass_block_invoke(uint64_t a1)
{
  EmbeddedDataResetLibrary();
  Class result = objc_getClass("DDRResetRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getDDRResetRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getDDRResetRequestClass_block_invoke_cold_1();
    return (Class)__getDDRResetServiceClass_block_invoke(v3);
  }
  return result;
}

void __getDDRResetServiceClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("DDRResetService");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getDDRResetServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getDDRResetServiceClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_0_0();
  }
}

void sub_23D2ABE68(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 80));
  _Unwind_Resume(a1);
}

void sub_23D2AD114(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a11) {
    (*(void (**)(void))(a11 + 16))();
  }
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_23D2B5D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23D2B61D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_23D2B6E38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23D2B7354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBFFStyleClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getBFFStyleClass_softClass;
  uint64_t v7 = getBFFStyleClass_softClass;
  if (!getBFFStyleClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getBFFStyleClass_block_invoke;
    v3[3] = &unk_264E8CD70;
    v3[4] = &v4;
    __getBFFStyleClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_23D2B7438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getBFFStyleClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("BFFStyle");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBFFStyleClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBFFStyleClass_block_invoke_cold_1();
    SetupAssistantUILibrary();
  }
}

void SetupAssistantUILibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!SetupAssistantUILibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __SetupAssistantUILibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_264E8D0E0;
    uint64_t v3 = 0;
    SetupAssistantUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!SetupAssistantUILibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __SetupAssistantUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantUILibraryCore_frameworkLibrary = result;
  return result;
}

PSGMousePointerController *__getBFFPaneHeaderViewClass_block_invoke(uint64_t a1)
{
  SetupAssistantUILibrary();
  uint64_t result = (PSGMousePointerController *)objc_getClass("BFFPaneHeaderView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBFFPaneHeaderViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBFFPaneHeaderViewClass_block_invoke_cold_1();
    return [(PSGMousePointerController *)v3 init];
  }
  return result;
}

void sub_23D2B86B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23D2B8840(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23D2B8944(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23D2B89D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23D2B8C20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23D2B8D7C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23D2B8EB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23D2B9008(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23D2B9158(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id PSG_LocalizedString(void *a1)
{
  id v1 = a1;
  long long v2 = PSG_BundleForGeneralSettingsUIFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:0];

  return v3;
}

id PSG_LocalizedStringForAbout(void *a1)
{
  id v1 = a1;
  long long v2 = PSG_BundleForGeneralSettingsUIFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"About"];

  return v3;
}

id PSG_LocalizedStringForAutomaticContentDownload(void *a1)
{
  id v1 = a1;
  long long v2 = PSG_BundleForGeneralSettingsUIFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"AutomaticContentDownload"];

  return v3;
}

id PSG_LocalizedStringForBackupAlert(void *a1)
{
  id v1 = a1;
  long long v2 = PSG_BundleForGeneralSettingsUIFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"BackupAlert"];

  return v3;
}

id PSG_LocalizedStringForBackupInfo(void *a1)
{
  id v1 = a1;
  long long v2 = PSG_BundleForGeneralSettingsUIFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"BackupInfo"];

  return v3;
}

id PSG_LocalizedStringForContinuity(void *a1)
{
  id v1 = a1;
  long long v2 = PSG_BundleForGeneralSettingsUIFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"Continuity"];

  return v3;
}

id PSG_LocalizedStringForDateAndTime(void *a1)
{
  id v1 = a1;
  long long v2 = PSG_BundleForGeneralSettingsUIFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"Date & Time"];

  return v3;
}

id PSG_LocalizedStringForHomeButton(void *a1)
{
  id v1 = a1;
  long long v2 = PSG_BundleForGeneralSettingsUIFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"HomeButton-sshb"];

  return v3;
}

id PSG_LocalizedStringForModelNames(void *a1)
{
  id v1 = a1;
  long long v2 = PSG_BundleForGeneralSettingsUIFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"ModelNames"];

  return v3;
}

id PSG_LocalizedStringForNFC(void *a1)
{
  id v1 = a1;
  long long v2 = PSG_BundleForGeneralSettingsUIFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"Nfc"];

  return v3;
}

id PSG_LocalizedStringForPointers(void *a1)
{
  id v1 = a1;
  long long v2 = PSG_BundleForGeneralSettingsUIFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"Pointers"];

  return v3;
}

id PSG_LocalizedStringForPointersHiding(void *a1)
{
  id v1 = a1;
  long long v2 = PSG_BundleForGeneralSettingsUIFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"Pointers-R418-R428"];

  return v3;
}

id PSG_LocalizedStringForReset(void *a1)
{
  id v1 = a1;
  long long v2 = PSG_BundleForGeneralSettingsUIFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"Reset"];

  return v3;
}

id PSG_LocalizedStringForMatter(void *a1)
{
  id v1 = a1;
  long long v2 = PSG_BundleForGeneralSettingsUIFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"Matter"];

  return v3;
}

id PSG_LocalizedStringForWombat(void *a1)
{
  id v1 = a1;
  long long v2 = PSG_BundleForGeneralSettingsUIFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"Wombat"];

  return v3;
}

id PSG_LocalizedStringForLOTX(void *a1)
{
  id v1 = a1;
  long long v2 = PSG_BundleForGeneralSettingsUIFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"LOTX"];

  return v3;
}

id _PSGSignpostLoggingFacility()
{
  if (_PSGSignpostLoggingFacility_onceToken != -1) {
    dispatch_once(&_PSGSignpostLoggingFacility_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)_PSGSignpostLoggingFacility_oslog;
  return v0;
}

uint64_t __PSGGreenTeaLoggerForAppListing_block_invoke()
{
  uint64_t result = ct_green_tea_logger_create();
  PSGGreenTeaLoggerForAppListing_appListLogger = result;
  return result;
}

uint64_t __PSGGreenTeaLoggerForIMEI_block_invoke()
{
  uint64_t result = ct_green_tea_logger_create();
  PSGGreenTeaLoggerForIMEI_psgIMEILogger = result;
  return result;
}

uint64_t __PSGGreenTeaLoggerForWLANHardwareAddress_block_invoke()
{
  uint64_t result = ct_green_tea_logger_create();
  PSGGreenTeaLoggerForWLANHardwareAddress_psgWLANLogger = result;
  return result;
}

uint64_t __PSGGreenTeaLoggerForBluetoothHardwareAddress_block_invoke()
{
  uint64_t result = ct_green_tea_logger_create();
  PSGGreenTeaLoggerForBluetoothHardwareAddress_psgBluetoothLogger = result;
  return result;
}

void PSGGreenTeaAppListLog(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v9 = a1;
  if (PSGGreenTeaLoggerForAppListing_onceToken != -1) {
    dispatch_once(&PSGGreenTeaLoggerForAppListing_onceToken, &__block_literal_global_7);
  }
  if (PSGGreenTeaLoggerForAppListing_appListLogger)
  {
    v10 = getCTGreenTeaOsLogHandle();
    v11 = v10;
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = [MEMORY[0x263F086E0] mainBundle];
      v13 = [v12 bundleIdentifier];
      v14 = (void *)[[NSString alloc] initWithFormat:v9 arguments:&a9];
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      __int16 v17 = 2114;
      v18 = v14;
      _os_log_impl(&dword_23D28D000, v11, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@", buf, 0x16u);
    }
  }
}

void PSGGreenTeaIMEILog(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v9 = a1;
  if (PSGGreenTeaLoggerForIMEI_onceToken != -1) {
    dispatch_once(&PSGGreenTeaLoggerForIMEI_onceToken, &__block_literal_global_10);
  }
  if (PSGGreenTeaLoggerForIMEI_psgIMEILogger)
  {
    v10 = getCTGreenTeaOsLogHandle();
    v11 = v10;
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = [MEMORY[0x263F086E0] mainBundle];
      v13 = [v12 bundleIdentifier];
      v14 = (void *)[[NSString alloc] initWithFormat:v9 arguments:&a9];
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      __int16 v17 = 2114;
      v18 = v14;
      _os_log_impl(&dword_23D28D000, v11, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@", buf, 0x16u);
    }
  }
}

void PSGGreenTeaWLANHardwareAddressLog(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v9 = a1;
  if (PSGGreenTeaLoggerForWLANHardwareAddress_onceToken != -1) {
    dispatch_once(&PSGGreenTeaLoggerForWLANHardwareAddress_onceToken, &__block_literal_global_13);
  }
  if (PSGGreenTeaLoggerForWLANHardwareAddress_psgWLANLogger)
  {
    v10 = getCTGreenTeaOsLogHandle();
    v11 = v10;
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = [MEMORY[0x263F086E0] mainBundle];
      v13 = [v12 bundleIdentifier];
      v14 = (void *)[[NSString alloc] initWithFormat:v9 arguments:&a9];
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      __int16 v17 = 2114;
      v18 = v14;
      _os_log_impl(&dword_23D28D000, v11, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@", buf, 0x16u);
    }
  }
}

void PSGGreenTeaBluetoothHardwareAddressLog(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v9 = a1;
  if (PSGGreenTeaLoggerForBluetoothHardwareAddress_onceToken != -1) {
    dispatch_once(&PSGGreenTeaLoggerForBluetoothHardwareAddress_onceToken, &__block_literal_global_16);
  }
  if (PSGGreenTeaLoggerForBluetoothHardwareAddress_psgBluetoothLogger)
  {
    v10 = getCTGreenTeaOsLogHandle();
    v11 = v10;
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = [MEMORY[0x263F086E0] mainBundle];
      v13 = [v12 bundleIdentifier];
      v14 = (void *)[[NSString alloc] initWithFormat:v9 arguments:&a9];
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      __int16 v17 = 2114;
      v18 = v14;
      _os_log_impl(&dword_23D28D000, v11, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@", buf, 0x16u);
    }
  }
}

void sub_23D2BD08C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_23D2BD164(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23D2BD7D4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_23D2BD89C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23D2BDD14(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_23D2BE6B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23D2BE92C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCRCarPlayPreferencesClass_block_invoke(uint64_t a1)
{
  CarKitLibrary();
  Class result = objc_getClass("CRCarPlayPreferences");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCRCarPlayPreferencesClass_block_invoke_cold_1();
  }
  getCRCarPlayPreferencesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void CarKitLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!CarKitLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __CarKitLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_264E8D380;
    uint64_t v3 = 0;
    CarKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!CarKitLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __CarKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CarKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getBFFStyleClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!SetupAssistantUILibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __SetupAssistantUILibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264E8D398;
    uint64_t v6 = 0;
    SetupAssistantUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!SetupAssistantUILibraryCore_frameworkLibrary_0)
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
    Class result = objc_getClass("BFFStyle");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getBFFStyleClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getBFFStyleClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SetupAssistantUILibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantUILibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getCRPairedVehicleManagerClass_block_invoke(uint64_t a1)
{
  CarKitLibrary();
  Class result = objc_getClass("CRPairedVehicleManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCRPairedVehicleManagerClass_block_invoke_cold_1();
  }
  getCRPairedVehicleManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

size_t sub_23D2BFE58(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v18 = sub_23D2C2FB0();
  uint64_t v4 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    if (!v7) {
      return v8;
    }
    uint64_t v21 = MEMORY[0x263F8EE78];
    size_t result = sub_23D2C06C0(0, v7 & ~(v7 >> 63), 0);
    if (v7 < 0) {
      break;
    }
    uint64_t v10 = 0;
    uint64_t v8 = v21;
    v16[1] = v2;
    unint64_t v17 = a1 & 0xC000000000000001;
    uint64_t v2 = a1;
    while (v7 != v10)
    {
      if (v17) {
        id v11 = (id)MEMORY[0x23ECFB8F0](v10, a1);
      }
      else {
        id v11 = *(id *)(a1 + 8 * v10 + 32);
      }
      v12 = v11;
      v20[3] = sub_23D2C0B1C();
      v20[0] = v12;
      sub_23D2C0B5C((uint64_t)v20, (uint64_t)v19);
      id v13 = v12;
      sub_23D2C2FA0();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v20);

      uint64_t v21 = v8;
      unint64_t v15 = *(void *)(v8 + 16);
      unint64_t v14 = *(void *)(v8 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_23D2C06C0(v14 > 1, v15 + 1, 1);
        uint64_t v8 = v21;
      }
      ++v10;
      *(void *)(v8 + 16) = v15 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v8+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v15, v6, v18);
      a1 = v2;
      if (v7 == v10) {
        return v8;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_23D2C3150();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

id EmitNavigationEventWrapper.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id EmitNavigationEventWrapper.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EmitNavigationEventWrapper();
  return objc_msgSendSuper2(&v2, sel_init);
}

id EmitNavigationEventWrapper.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EmitNavigationEventWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23D2C02B0(uint64_t a1, uint64_t a2)
{
  return sub_23D2C041C(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_23D2C02C8(uint64_t a1, id *a2)
{
  uint64_t result = sub_23D2C30B0();
  *a2 = 0;
  return result;
}

uint64_t sub_23D2C0340(uint64_t a1, id *a2)
{
  char v3 = sub_23D2C30C0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_23D2C03C0@<X0>(uint64_t *a1@<X8>)
{
  sub_23D2C30D0();
  uint64_t v2 = sub_23D2C30A0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23D2C0404(uint64_t a1, uint64_t a2)
{
  return sub_23D2C041C(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_23D2C041C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_23D2C30D0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23D2C0460()
{
  sub_23D2C30D0();
  sub_23D2C30E0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23D2C04B4()
{
  sub_23D2C30D0();
  sub_23D2C3190();
  sub_23D2C30E0();
  uint64_t v0 = sub_23D2C31A0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23D2C0528()
{
  uint64_t v0 = sub_23D2C30D0();
  uint64_t v2 = v1;
  if (v0 == sub_23D2C30D0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_23D2C3180();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_23D2C05B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_23D2C30A0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23D2C05FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23D2C30D0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23D2C0628(uint64_t a1)
{
  uint64_t v2 = sub_23D2C0D44(&qword_26AB313E8);
  uint64_t v3 = sub_23D2C0D44(&qword_268C06858);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

size_t sub_23D2C06C0(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_23D2C06E0(a1, a2, a3, (void *)*v3);
  size_t *v3 = result;
  return result;
}

size_t sub_23D2C06E0(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    id v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C06840);
  uint64_t v10 = *(void *)(sub_23D2C2FB0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  id v13 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_23D2C2FB0() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_23D2C08B4(uint64_t a1, uint64_t a2, void *a3, unint64_t a4, uint64_t a5)
{
  uint64_t v18 = a5;
  uint64_t v19 = sub_23D2C2FB0();
  uint64_t v9 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_23D2C3040();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (uint64_t *)((char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_23D2C3070();
  sub_23D2C3060();
  *uint64_t v15 = a1;
  v15[1] = a2;
  (*(void (**)(void *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F67E48], v12);
  unint64_t v21 = sub_23D2C0B1C();
  v20 = a3;
  swift_bridgeObjectRetain();
  id v16 = a3;
  sub_23D2C2FA0();
  sub_23D2BFE58(a4);
  sub_23D2C3050();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v19);
  return (*(uint64_t (**)(void *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t type metadata accessor for EmitNavigationEventWrapper()
{
  return self;
}

uint64_t method lookup function for EmitNavigationEventWrapper(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for EmitNavigationEventWrapper);
}

uint64_t dispatch thunk of static EmitNavigationEventWrapper.generalEmitNavigationEventForSystemSetting(withGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

unint64_t sub_23D2C0B1C()
{
  unint64_t result = qword_268C06838;
  if (!qword_268C06838)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268C06838);
  }
  return result;
}

uint64_t sub_23D2C0B5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
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

void type metadata accessor for Key()
{
  if (!qword_26AB313B8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26AB313B8);
    }
  }
}

uint64_t sub_23D2C0CA8()
{
  return sub_23D2C0D44(&qword_268C06848);
}

uint64_t sub_23D2C0CDC()
{
  return sub_23D2C0D44(&qword_268C06850);
}

uint64_t sub_23D2C0D10()
{
  return sub_23D2C0D44(&qword_26AB313F0);
}

uint64_t sub_23D2C0D44(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Key();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_23D2C0D88(void *a1, uint64_t a2, double a3)
{
  uint64_t v6 = sub_23D2C3010();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_23D2C3030();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = objc_msgSend(a1, sel_specifier);
  if (result)
  {
    uint64_t v15 = result;
    id v16 = objc_msgSend(result, sel_target);

    uint64_t v42 = v10;
    uint64_t v43 = v7;
    uint64_t v40 = a2;
    uint64_t v41 = v11;
    if (v16)
    {
      self;
      unint64_t v17 = (void *)swift_dynamicCastObjCClass();
      if (v17)
      {
        id v39 = v17;
        id v16 = objc_msgSend(v17, sel_navigationItem);
LABEL_7:
        id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
        uint64_t v19 = self;
        v20 = (void *)sub_23D2C30A0();
        id v21 = objc_msgSend(v19, sel_preferredFontForTextStyle_, v20);

        objc_msgSend(v18, sel_setFont_, v21);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AB31410);
        uint64_t inited = swift_initStackObject();
        v23 = (void **)MEMORY[0x263F81500];
        *(_OWORD *)(inited + 16) = xmmword_23D2C6210;
        v24 = *v23;
        *(void *)(inited + 32) = *v23;
        v25 = self;
        id v26 = v18;
        swift_bridgeObjectRetain();
        id v27 = v24;
        id v28 = objc_msgSend(v25, sel_labelColor);
        id v29 = objc_msgSend(v28, sel_colorWithAlphaComponent_, a3);

        *(void *)(inited + 64) = sub_23D2C1E78(0, &qword_26AB31400);
        *(void *)(inited + 40) = v29;
        sub_23D2C134C(inited);
        id v30 = objc_allocWithZone(MEMORY[0x263F086A0]);
        v31 = (void *)sub_23D2C30A0();
        swift_bridgeObjectRelease();
        type metadata accessor for Key();
        sub_23D2C1F28(&qword_26AB313E8, (void (*)(uint64_t))type metadata accessor for Key);
        v32 = (void *)sub_23D2C3090();
        swift_bridgeObjectRelease();
        id v33 = objc_msgSend(v30, sel_initWithString_attributes_, v31, v32);

        objc_msgSend(v26, sel_setAttributedText_, v33);
        sub_23D2C1E78(0, &qword_26AB313E0);
        v34 = (void *)sub_23D2C3110();
        uint64_t v35 = swift_allocObject();
        *(void *)(v35 + 16) = v16;
        *(void *)(v35 + 24) = v26;
        aBlock[4] = sub_23D2C1EF4;
        aBlock[5] = v35;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_23D2C1468;
        aBlock[3] = &block_descriptor;
        v36 = _Block_copy(aBlock);
        id v37 = v16;
        swift_release();
        sub_23D2C3020();
        aBlock[0] = MEMORY[0x263F8EE78];
        sub_23D2C1F28(&qword_26AB313C8, MEMORY[0x263F8F030]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AB313D0);
        sub_23D2C1F70(&qword_26AB313D8, &qword_26AB313D0);
        sub_23D2C3130();
        MEMORY[0x23ECFB8D0](0, v13, v9, v36);

        _Block_release(v36);
        (*(void (**)(char *, uint64_t))(v43 + 8))(v9, v6);
        return (id)(*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v13, v42);
      }
      swift_unknownObjectRelease();
      id v16 = 0;
    }
    id v39 = 0;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

unint64_t sub_23D2C134C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB31408);
  uint64_t v2 = sub_23D2C3160();
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
    sub_23D2C1FB4(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_23D2C18BC(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_23D2C201C(&v14, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_23D2C1468(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_23D2C14AC()
{
  type metadata accessor for PSGGeneralPlacardCell();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v1 = self;
  swift_bridgeObjectRetain();
  id v2 = objc_msgSend(v1, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23D2C2F90();

  swift_retain();
  return sub_23D2C3080();
}

id sub_23D2C1660(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    uint64_t v10 = (void *)sub_23D2C30A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  v14.receiver = v5;
  v14.super_class = ObjectType;
  id v11 = objc_msgSendSuper2(&v14, sel_initWithStyle_reuseIdentifier_specifier_, a1, v10, a4);

  id v12 = v11;
  if (v12) {

  }
  return v12;
}

id sub_23D2C1860()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PSGGeneralPlacardCell()
{
  return self;
}

unint64_t sub_23D2C18BC(uint64_t a1)
{
  sub_23D2C30D0();
  sub_23D2C3190();
  sub_23D2C30E0();
  uint64_t v2 = sub_23D2C31A0();
  swift_bridgeObjectRelease();
  return sub_23D2C1950(a1, v2);
}

unint64_t sub_23D2C1950(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_23D2C30D0();
    uint64_t v8 = v7;
    if (v6 == sub_23D2C30D0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_23D2C3180();
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
          uint64_t v13 = sub_23D2C30D0();
          uint64_t v15 = v14;
          if (v13 == sub_23D2C30D0() && v15 == v16) {
            break;
          }
          char v18 = sub_23D2C3180();
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

uint64_t sub_23D2C1AC8()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB313C0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = &v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  objc_msgSend(v1, sel_setSelectionStyle_, 0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v7 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v8 = sub_23D2C2F90();
  uint64_t v10 = v9;

  char v11 = (void *)swift_allocObject();
  v11[2] = v1;
  v11[3] = v8;
  v11[4] = v10;
  uint64_t v14 = v8;
  uint64_t v15 = v10;
  uint64_t v16 = sub_23D2C1DB4;
  unint64_t v17 = v11;
  v1;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB31428);
  sub_23D2C1F70(&qword_26AB31420, &qword_26AB31428);
  sub_23D2C2FF0();
  swift_bridgeObjectRelease();
  sub_23D2C3000();
  v18[3] = v2;
  v18[4] = sub_23D2C1F70(&qword_26AB31418, &qword_26AB313C0);
  __swift_allocate_boxed_opaque_existential_1(v18);
  sub_23D2C2FE0();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  MEMORY[0x23ECFB8B0](v18);
  return swift_release();
}

uint64_t sub_23D2C1D74()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

id sub_23D2C1DB4(double a1)
{
  return sub_23D2C0D88(*(void **)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_23D2C1DC0()
{
  return sub_23D2C14AC();
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

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_23D2C1E78(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23D2C1EB4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_23D2C1EF4()
{
  id result = *(id *)(v0 + 16);
  if (result) {
    return objc_msgSend(result, sel_setTitleView_, *(void *)(v0 + 24));
  }
  return result;
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

uint64_t sub_23D2C1F28(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23D2C1F70(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_23D2C1FB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB313F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_23D2C201C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23D2C202C()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t __getFMDFMIPManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSRAuthorizationClientClass_block_invoke_cold_1(v0);
}

uint64_t __getSRAuthorizationClientClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getDDRResetOptionsClass_block_invoke_cold_1(v0);
}

uint64_t __getDDRResetOptionsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getMBManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getMBManagerClass_block_invoke_cold_1()
{
  return __getDDRResetRequestClass_block_invoke_cold_1();
}

uint64_t __getDDRResetRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getDDRResetServiceClass_block_invoke_cold_1(v0);
}

uint64_t __getDDRResetServiceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __64__PSGMatterController_shouldShowMatterControllerWithCompletion___block_invoke_cold_1(v0);
}

uint64_t __getBFFStyleClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getBFFPaneHeaderViewClass_block_invoke_cold_1(v0);
}

void __getBFFPaneHeaderViewClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  -[PSGGeneralController delayedAsyncLoadSpecifiers](v0);
}

void __getCRCarPlayPreferencesClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getCRPairedVehicleManagerClass_block_invoke_cold_1(v0);
}

void __getCRPairedVehicleManagerClass_block_invoke_cold_1()
{
}

uint64_t sub_23D2C2F90()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_23D2C2FA0()
{
  return MEMORY[0x270EEF848]();
}

uint64_t sub_23D2C2FB0()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_23D2C2FC0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_23D2C2FD0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_23D2C2FE0()
{
  return MEMORY[0x270F01E18]();
}

uint64_t sub_23D2C2FF0()
{
  return MEMORY[0x270F01E28]();
}

uint64_t sub_23D2C3000()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_23D2C3010()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_23D2C3020()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_23D2C3030()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_23D2C3040()
{
  return MEMORY[0x270F5D090]();
}

uint64_t sub_23D2C3050()
{
  return MEMORY[0x270F5D0A8]();
}

uint64_t sub_23D2C3060()
{
  return MEMORY[0x270F5D0B8]();
}

uint64_t sub_23D2C3070()
{
  return MEMORY[0x270F5D0C0]();
}

uint64_t sub_23D2C3080()
{
  return MEMORY[0x270F5D0D8]();
}

uint64_t sub_23D2C3090()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_23D2C30A0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23D2C30B0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_23D2C30C0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_23D2C30D0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23D2C30E0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23D2C30F0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_23D2C3100()
{
  return MEMORY[0x270F824A0]();
}

uint64_t sub_23D2C3110()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_23D2C3120()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_23D2C3130()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_23D2C3140()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_23D2C3150()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_23D2C3160()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_23D2C3180()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23D2C3190()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23D2C31A0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t ALGetPhotosAndVideosCount()
{
  return MEMORY[0x270F537A0]();
}

uint64_t ALRegisterForPhotosAndVideosCount()
{
  return MEMORY[0x270F537A8]();
}

uint64_t ALUnregisterForPhotosAndVideosCount()
{
  return MEMORY[0x270F537B0]();
}

uint64_t APFSVolumeGetSpaceInfo()
{
  return MEMORY[0x270F08AF8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x270EE4870](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x270EE4890](allocator, formatter, at);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x270EE4A60]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x270EE4A80](allocator, localeIdentifier);
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

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x270F1B710]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x270F1B718]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTimeZoneRef CFTimeZoneCopySystem(void)
{
  return (CFTimeZoneRef)MEMORY[0x270EE52E8]();
}

void CFTimeZoneResetSystem(void)
{
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t CPPhoneNumberCopyActiveCountryCode()
{
  return MEMORY[0x270F0CD98]();
}

uint64_t CTSettingCopyEffectiveSimInfo()
{
  return MEMORY[0x270EE86F8]();
}

uint64_t DeviceName()
{
  return MEMORY[0x270F551A0]();
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x270EF47B0](*(void *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

uint64_t IOPSCopyPowerSourcesByTypePrecise()
{
  return MEMORY[0x270EF4908]();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return (CFArrayRef)MEMORY[0x270EF4918](blob);
}

CFDictionaryRef IOPSGetPowerSourceDescription(CFTypeRef blob, CFTypeRef ps)
{
  return (CFDictionaryRef)MEMORY[0x270EF4950](blob, ps);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x270EF49D0](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF4A50](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD8](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

uint64_t PSBundlePathForPreferenceBundle()
{
  return MEMORY[0x270F551E8]();
}

uint64_t PSCityForSpecifier()
{
  return MEMORY[0x270F551F0]();
}

uint64_t PSCityForTimeZone()
{
  return MEMORY[0x270F551F8]();
}

uint64_t PSGetCapabilityBoolAnswer()
{
  return MEMORY[0x270F55208]();
}

uint64_t PSHasStockholmPass()
{
  return MEMORY[0x270F55210]();
}

uint64_t PSIsInEDUMode()
{
  return MEMORY[0x270F55220]();
}

uint64_t PSIsLocationRestricted()
{
  return MEMORY[0x270F55230]();
}

uint64_t PSLegacyCityFromCity()
{
  return MEMORY[0x270F55280]();
}

uint64_t PSLocaleUses24HourClock()
{
  return MEMORY[0x270F55288]();
}

uint64_t PSStockholmLocallyStoredValuePassNames()
{
  return MEMORY[0x270F55300]();
}

uint64_t PSUsedByManagedAccount()
{
  return MEMORY[0x270F55348]();
}

uint64_t PreferencesTableViewCellLeftPad()
{
  return MEMORY[0x270F55350]();
}

uint64_t PreferencesTableViewCellRightPad()
{
  return MEMORY[0x270F55358]();
}

uint64_t PreferencesTableViewFooterColor()
{
  return MEMORY[0x270F55360]();
}

uint64_t PreferencesTableViewFooterFont()
{
  return MEMORY[0x270F55368]();
}

uint64_t SBSIsReachabilityEnabled()
{
  return MEMORY[0x270F77170]();
}

CFArrayRef SCNetworkInterfaceCopyAll(void)
{
  return (CFArrayRef)MEMORY[0x270F05598]();
}

CFStringRef SCNetworkInterfaceGetHardwareAddressString(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x270F055B0](interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x270F055C0](interface);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x270F055F0](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x270F05620](target, flags);
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return MEMORY[0x270F5D188]();
}

uint64_t SFRuntimeAbsoluteFilePathForPath()
{
  return MEMORY[0x270F5D1B8]();
}

uint64_t SUSUISettingsIsBadgedForSoftwareUpdate()
{
  return MEMORY[0x270F76380]();
}

uint64_t SUStringFromOSUpdateType()
{
  return MEMORY[0x270F76370]();
}

uint64_t SecCertificateCopyCommonNames()
{
  return MEMORY[0x270EFD6F0]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x270EFD7E0](allocator, data);
}

SecPolicyRef SecPolicyCreateSSL(Boolean server, CFStringRef hostname)
{
  return (SecPolicyRef)MEMORY[0x270EFDBB0](server, hostname);
}

uint64_t SecTrustStoreCopyAll()
{
  return MEMORY[0x270EFDE08]();
}

uint64_t SecTrustStoreCopyUsageConstraints()
{
  return MEMORY[0x270EFDE10]();
}

uint64_t SecTrustStoreForDomain()
{
  return MEMORY[0x270EFDE18]();
}

uint64_t SecTrustStoreGetSettingsAssetVersionNumber()
{
  return MEMORY[0x270EFDE20]();
}

uint64_t SecTrustStoreGetSettingsVersionNumber()
{
  return MEMORY[0x270EFDE28]();
}

uint64_t SecTrustStoreSetTrustSettings()
{
  return MEMORY[0x270EFDE38]();
}

uint64_t SetDeviceName()
{
  return MEMORY[0x270F55388]();
}

uint64_t SpecifiersFromPlist()
{
  return MEMORY[0x270F55398]();
}

uint64_t TCCAccessReset()
{
  return MEMORY[0x270F79628]();
}

uint64_t TCCAccessSetOverride()
{
  return MEMORY[0x270F79670]();
}

uint64_t TMIsAutomaticTimeZoneEnabled()
{
  return MEMORY[0x270F239A8]();
}

uint64_t TMIsTimeZoneConfirmed()
{
  return MEMORY[0x270F239B0]();
}

uint64_t TMSetAutomaticTimeEnabled()
{
  return MEMORY[0x270F239B8]();
}

uint64_t TMSetAutomaticTimeZoneEnabled()
{
  return MEMORY[0x270F239C0]();
}

uint64_t TMSetManualTime()
{
  return MEMORY[0x270F239C8]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F82CD0](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x270EE55E8]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x270EE55F0]();
}

uint64_t _CTServerConnectionCopyFirmwareVersion()
{
  return MEMORY[0x270EE8778]();
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x270EE87B0]();
}

uint64_t _CTServerConnectionEraseBasebandSettings()
{
  return MEMORY[0x270EE87E8]();
}

uint64_t _CTServerConnectionGetResetCellularAccountSettingsIsAllowed()
{
  return MEMORY[0x270EE8838]();
}

uint64_t _CTServerConnectionGetUpdatedCarrierBundle()
{
  return MEMORY[0x270EE8840]();
}

uint64_t _CTServerConnectionResetModem()
{
  return MEMORY[0x270EE8868]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

void bzero(void *a1, size_t a2)
{
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x270F91820]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x270F91848]();
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t lockdown_delete_pair_records()
{
  return MEMORY[0x270F99B48]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

uint64_t nw_path_create_default_evaluator()
{
  return MEMORY[0x270EF87D8]();
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x270EF8808]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x270EF8810]();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return MEMORY[0x270EF8840]();
}

BOOL nw_path_is_constrained(nw_path_t path)
{
  return MEMORY[0x270EF8988](path);
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
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

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x270EDB570](a1, a2);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
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

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}