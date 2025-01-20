void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_21FFA283C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCAMediaTimingFunctionClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getCAMediaTimingFunctionClass_softClass;
  uint64_t v7 = getCAMediaTimingFunctionClass_softClass;
  if (!getCAMediaTimingFunctionClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCAMediaTimingFunctionClass_block_invoke;
    v3[3] = &unk_26454AB18;
    v3[4] = &v4;
    __getCAMediaTimingFunctionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21FFA2924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getkCAFillModeBackwards()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getkCAFillModeBackwardsSymbolLoc_ptr;
  uint64_t v8 = getkCAFillModeBackwardsSymbolLoc_ptr;
  if (!getkCAFillModeBackwardsSymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kCAFillModeBackwards");
    getkCAFillModeBackwardsSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)getkCAFillModeBackwards_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

Class __getCASpringAnimationClass_block_invoke(uint64_t a1)
{
  QuartzCoreLibrary();
  Class result = objc_getClass("CASpringAnimation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCASpringAnimationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCASpringAnimationClass_block_invoke_cold_1();
    return (Class)QuartzCoreLibrary();
  }
  return result;
}

uint64_t QuartzCoreLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!QuartzCoreLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __QuartzCoreLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26454AB38;
    uint64_t v5 = 0;
    QuartzCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = QuartzCoreLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!QuartzCoreLibraryCore_frameworkLibrary)
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

uint64_t __QuartzCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  QuartzCoreLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCAMediaTimingFunctionClass_block_invoke(uint64_t a1)
{
  QuartzCoreLibrary();
  Class result = objc_getClass("CAMediaTimingFunction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCAMediaTimingFunctionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getCAMediaTimingFunctionClass_block_invoke_cold_1();
    return (Class)__getkCAFillModeBackwardsSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getkCAFillModeBackwardsSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)QuartzCoreLibrary();
  Class result = dlsym(v2, "kCAFillModeBackwards");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCAFillModeBackwardsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCABasicAnimationClass_block_invoke(uint64_t a1)
{
  QuartzCoreLibrary();
  Class result = objc_getClass("CABasicAnimation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCABasicAnimationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (BFFFinishSetupFlowItemDispositionProvider *)__getCABasicAnimationClass_block_invoke_cold_1();
    return (Class)[(BFFFinishSetupFlowItemDispositionProvider *)v3 dispositions];
  }
  return result;
}

id getPKSetupAssistantContextClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPKSetupAssistantContextClass_softClass;
  uint64_t v7 = getPKSetupAssistantContextClass_softClass;
  if (!getPKSetupAssistantContextClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getPKSetupAssistantContextClass_block_invoke;
    v3[3] = &unk_26454AB18;
    v3[4] = &v4;
    __getPKSetupAssistantContextClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21FFA409C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPKPaymentSetupAssistantControllerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPKPaymentSetupAssistantControllerClass_softClass;
  uint64_t v7 = getPKPaymentSetupAssistantControllerClass_softClass;
  if (!getPKPaymentSetupAssistantControllerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getPKPaymentSetupAssistantControllerClass_block_invoke;
    v3[3] = &unk_26454AB18;
    v3[4] = &v4;
    __getPKPaymentSetupAssistantControllerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21FFA4180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getPKSetupAssistantContextClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PKSetupAssistantContext");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPKSetupAssistantContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPKSetupAssistantContextClass_block_invoke_cold_1();
    PassKitUILibrary();
  }
}

void PassKitUILibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!PassKitUILibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __PassKitUILibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_26454AB98;
    uint64_t v3 = 0;
    PassKitUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!PassKitUILibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __PassKitUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PassKitUILibraryCore_frameworkLibrary = result;
  return result;
}

BFFPaneHeaderView *__getPKPaymentSetupAssistantControllerClass_block_invoke(uint64_t a1)
{
  PassKitUILibrary();
  uint64_t result = (BFFPaneHeaderView *)objc_getClass("PKPaymentSetupAssistantController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPKPaymentSetupAssistantControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (BFFPaneHeaderView *)__getPKPaymentSetupAssistantControllerClass_block_invoke_cold_1();
    return [(BFFPaneHeaderView *)v3 initWithFrame:v5];
  }
  return result;
}

double BFFRoundToPixel(double a1)
{
  double v2 = *(double *)&BFFRoundToPixel_scale;
  if (*(double *)&BFFRoundToPixel_scale == -1.0)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263F82B60], "mainScreen", *(double *)&BFFRoundToPixel_scale);
    [v3 scale];
    BFFRoundToPixel_scale = v4;

    double v2 = *(double *)&BFFRoundToPixel_scale;
  }
  return round(v2 * a1) / v2;
}

double BFFRoundToPixel_0(double a1)
{
  double v2 = *(double *)&BFFRoundToPixel_scale_0;
  if (*(double *)&BFFRoundToPixel_scale_0 == -1.0)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263F82B60], "mainScreen", *(double *)&BFFRoundToPixel_scale_0);
    [v3 scale];
    BFFRoundToPixel_scale_0 = v4;

    double v2 = *(double *)&BFFRoundToPixel_scale_0;
  }
  return round(v2 * a1) / v2;
}

double BFFRoundRectToPixel(double a1, double a2)
{
  double v3 = BFFRoundToPixel_0(a1);
  BFFRoundToPixel_0(a2);
  return v3;
}

id getBKUIPearlEnrollControllerClass()
{
  uint64_t v4 = 0;
  CGRect v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getBKUIPearlEnrollControllerClass_softClass;
  uint64_t v7 = getBKUIPearlEnrollControllerClass_softClass;
  if (!getBKUIPearlEnrollControllerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getBKUIPearlEnrollControllerClass_block_invoke;
    v3[3] = &unk_26454AB18;
    v3[4] = &v4;
    __getBKUIPearlEnrollControllerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21FFAA574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FFAAC8C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

id getBKUIPearlEnrollErrorDomain()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getBKUIPearlEnrollErrorDomainSymbolLoc_ptr;
  uint64_t v8 = getBKUIPearlEnrollErrorDomainSymbolLoc_ptr;
  if (!getBKUIPearlEnrollErrorDomainSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)BiometricKitUILibrary();
    v6[3] = (uint64_t)dlsym(v1, "BKUIPearlEnrollErrorDomain");
    getBKUIPearlEnrollErrorDomainSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)getkCAFillModeBackwards_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  double v2 = *v0;
  return v2;
}

Class __getBKUIPearlEnrollControllerClass_block_invoke(uint64_t a1)
{
  BiometricKitUILibrary();
  Class result = objc_getClass("BKUIPearlEnrollController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBKUIPearlEnrollControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBKUIPearlEnrollControllerClass_block_invoke_cold_1();
    return (Class)BiometricKitUILibrary();
  }
  return result;
}

uint64_t BiometricKitUILibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!BiometricKitUILibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __BiometricKitUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26454AC48;
    uint64_t v5 = 0;
    BiometricKitUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = BiometricKitUILibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!BiometricKitUILibraryCore_frameworkLibrary)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __BiometricKitUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BiometricKitUILibraryCore_frameworkLibrary = result;
  return result;
}

void __getBKDeviceClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("BKDevice");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBKDeviceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBKDeviceClass_block_invoke_cold_1();
    BiometricKitLibrary();
  }
}

void BiometricKitLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!BiometricKitLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __BiometricKitLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_26454AC60;
    uint64_t v3 = 0;
    BiometricKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!BiometricKitLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __BiometricKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BiometricKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getBKDeviceDescriptorClass_block_invoke(uint64_t a1)
{
  BiometricKitLibrary();
  Class result = objc_getClass("BKDeviceDescriptor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBKDeviceDescriptorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getBKDeviceDescriptorClass_block_invoke_cold_1();
    return (Class)__getBKUIPeriocularEnableSplashViewControllerClass_block_invoke(v3);
  }
  return result;
}

Class __getBKUIPeriocularEnableSplashViewControllerClass_block_invoke(uint64_t a1)
{
  BiometricKitUILibrary();
  Class result = objc_getClass("BKUIPeriocularEnableSplashViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBKUIPeriocularEnableSplashViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  }
  else
  {
    uint64_t v3 = __getBKUIPeriocularEnableSplashViewControllerClass_block_invoke_cold_1();
    return (Class)__getBKUIFaceIDSplashViewControllerClass_block_invoke(v3);
  }
  return result;
}

Class __getBKUIFaceIDSplashViewControllerClass_block_invoke(uint64_t a1)
{
  BiometricKitUILibrary();
  Class result = objc_getClass("BKUIFaceIDSplashViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBKUIFaceIDSplashViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getBKUIFaceIDSplashViewControllerClass_block_invoke_cold_1();
    return (Class)__getBKUIPearlEnrollErrorDomainSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getBKUIPearlEnrollErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)BiometricKitUILibrary();
  Class result = dlsym(v2, "BKUIPearlEnrollErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBKUIPearlEnrollErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_21FFAC968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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
    v3[3] = &unk_26454AB18;
    v3[4] = &v4;
    __getAFPreferencesClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21FFACE08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FFACF0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVTUIEnrollTrainingViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!VoiceTriggerUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __VoiceTriggerUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26454ACA0;
    uint64_t v6 = 0;
    VoiceTriggerUILibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!VoiceTriggerUILibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("VTUIEnrollTrainingViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getVTUIEnrollTrainingViewControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVTUIEnrollTrainingViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VoiceTriggerUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VoiceTriggerUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAFPreferencesClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AssistantServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26454ACB8;
    uint64_t v6 = 0;
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
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
    long long v2 = (void *)__getAFPreferencesClass_block_invoke_cold_1();
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

Class __getOBPrivacyPresenterClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!OnBoardingKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __OnBoardingKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26454ACD0;
    uint64_t v6 = 0;
    OnBoardingKitLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
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
    Class result = objc_getClass("OBPrivacyPresenter");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getOBPrivacyPresenterClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getOBPrivacyPresenterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __OnBoardingKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  OnBoardingKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_21FFB0A34(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t _BFFHeightByDeviceSize(void *a1)
{
  id v1 = a1;
  double v2 = enclosingSizeForView(v1);
  double v4 = v3;
  BOOL v5 = _useCompactMetrics(v1);

  if (v5)
  {
    if (v4 <= 568.0)
    {
      return 0;
    }
    else if (v4 <= 667.0)
    {
      return 1;
    }
    else
    {
      return 2;
    }
  }
  else if (v2 >= v4)
  {
    if (v4 <= 768.0)
    {
      return 3;
    }
    else if (v4 <= 834.0)
    {
      return 6;
    }
    else
    {
      return 8;
    }
  }
  else if (v4 <= 1024.0)
  {
    return 4;
  }
  else if (v4 <= 1112.0)
  {
    return 5;
  }
  else
  {
    return 7;
  }
}

double enclosingSizeForView(void *a1)
{
  id v1 = a1;
  double v2 = [v1 window];

  if (v2) {
    [v1 window];
  }
  else {
  double v3 = [MEMORY[0x263F82B60] mainScreen];
  }
  [v3 bounds];
  double v5 = v4;

  return v5;
}

BOOL _useCompactMetrics(void *a1)
{
  id v1 = a1;
  if (!BFFIsiPad()) {
    goto LABEL_5;
  }
  if (!v1)
  {
LABEL_7:
    BOOL v5 = 0;
    goto LABEL_8;
  }
  if (!BFFIsiPad()
    || ([MEMORY[0x263F086E0] mainBundle],
        double v2 = objc_claimAutoreleasedReturnValue(),
        [v2 bundleIdentifier],
        double v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 isEqualToString:*MEMORY[0x263F67FC0]],
        v3,
        v2,
        (v4 & 1) == 0))
  {
    uint64_t v6 = [v1 traitCollection];
    uint64_t v7 = [v6 horizontalSizeClass];

    BOOL v5 = v7 == 1;
    if (v7) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_5:
  BOOL v5 = 1;
LABEL_8:

  return v5;
}

uint64_t _BFFWidthByDeviceSize(void *a1)
{
  id v1 = a1;
  double v2 = enclosingSizeForView(v1);
  double v4 = v3;
  BOOL v5 = _useCompactMetrics(v1);

  if (v5)
  {
    if (v2 <= 320.0)
    {
      return 0;
    }
    else if (v2 <= 375.0)
    {
      return 1;
    }
    else
    {
      return 2;
    }
  }
  else if (v2 >= v4)
  {
    if (v2 <= 1024.0)
    {
      return 4;
    }
    else if (v2 <= 1112.0)
    {
      return 6;
    }
    else
    {
      return 8;
    }
  }
  else if (v2 <= 768.0)
  {
    return 3;
  }
  else if (v2 <= 834.0)
  {
    return 5;
  }
  else
  {
    return 7;
  }
}

double _BFFCGFloatByDeviceHeight(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  id v17 = a1;
  if (MGGetSInt32Answer() != 4)
  {
    a9 = a2;
    switch(_BFFHeightByDeviceSize(v17))
    {
      case 1:
        a9 = a3;
        break;
      case 2:
        a9 = a4;
        break;
      case 3:
      case 6:
        a9 = a5;
        break;
      case 4:
      case 5:
        a9 = a6;
        break;
      case 7:
        a9 = a7;
        break;
      case 8:
        a9 = a8;
        break;
      default:
        break;
    }
  }

  return a9;
}

id _BFFHeaderTextStyle()
{
  uint64_t v0 = [MEMORY[0x263F82B60] mainScreen];
  [v0 bounds];
  double v2 = v1;

  double v3 = (void **)MEMORY[0x263F83608];
  if (v2 <= 568.0) {
    double v3 = (void **)MEMORY[0x263F83618];
  }
  double v4 = *v3;
  return v4;
}

double _BFFIconTitleBaselineOffset(void *a1)
{
  double v1 = (void *)MEMORY[0x263F82770];
  id v2 = a1;
  double v3 = _BFFHeaderTextStyle();
  double v4 = [v1 metricsForTextStyle:v3];

  double v5 = _CGFloatByIdiom(v2, 44.0, 56.0, 0.0);
  [v4 scaledValueForValue:v5];
  double v7 = v6;

  return v7;
}

void _BFFTableInset(void *a1)
{
  id v1 = a1;
  if (_useCompactMetrics(v1)) {
    _BFFCGFloatByDeviceHeight(v1, 16.0, 24.0, 24.0, 0.0, 0.0, 0.0, 0.0, 0.0);
  }
  else {
    enclosingSizeForView(v1);
  }
}

double _CGFloatByIdiom(void *a1, double a2, double a3, double a4)
{
  id v7 = a1;
  if (MGGetSInt32Answer() != 4)
  {
    if (_useCompactMetrics(v7)) {
      a4 = a2;
    }
    else {
      a4 = a3;
    }
  }

  return a4;
}

void sub_21FFB36D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_21FFB401C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FFB5228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

void sub_21FFB5F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_21FFB6148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBiometricKitUIClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!BiometricKitUILibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __BiometricKitUILibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26454AF10;
    uint64_t v6 = 0;
    BiometricKitUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!BiometricKitUILibraryCore_frameworkLibrary_0)
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
    Class result = objc_getClass("BiometricKitUI");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getBiometricKitUIClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getBiometricKitUIClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __BiometricKitUILibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  BiometricKitUILibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getBiometricKitClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!BiometricKitLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __BiometricKitLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26454AF28;
    uint64_t v6 = 0;
    BiometricKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!BiometricKitLibraryCore_frameworkLibrary_0)
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
    Class result = objc_getClass("BiometricKit");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getBiometricKitClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getBiometricKitClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __BiometricKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  BiometricKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_21FFB86A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_21FFBB490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t isDeviceXL()
{
  if (isDeviceXL_onceToken != -1) {
    dispatch_once(&isDeviceXL_onceToken, &__block_literal_global_2);
  }
  return isDeviceXL__isDeviceXL;
}

void __isDeviceXL_block_invoke()
{
  if (BFFIsiPad())
  {
    id v1 = [MEMORY[0x263F82B60] mainScreen];
    [v1 _referenceBounds];
    isDeviceXL__isDeviceXL = v0 > 834.0;
  }
  else
  {
    isDeviceXL__isDeviceXL = 0;
  }
}

BOOL BFFIsiPad()
{
  double v0 = [MEMORY[0x263F82670] currentDevice];
  BOOL v1 = [v0 userInterfaceIdiom] == 1;

  return v1;
}

id BFFPointImageOfColor(void *a1)
{
  id v1 = a1;
  v5.width = 1.0;
  v5.height = 1.0;
  UIGraphicsBeginImageContext(v5);
  [v1 set];

  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  v6.size.width = 1.0;
  v6.size.height = 1.0;
  UIRectFill(v6);
  uint64_t v2 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v2;
}

BOOL BFFIsiPhone()
{
  double v0 = [MEMORY[0x263F82670] currentDevice];
  BOOL v1 = [v0 userInterfaceIdiom] == 0;

  return v1;
}

void *Logger.purpleBuddySubsystem.unsafeMutableAddressor()
{
  return &static Logger.purpleBuddySubsystem;
}

unint64_t static Logger.purpleBuddySubsystem.getter()
{
  return 0xD000000000000015;
}

uint64_t sub_21FFBC8E4(uint64_t a1)
{
  return sub_21FFBC9A8(a1, static Logger.purpleBuddyGeneral);
}

uint64_t Logger.purpleBuddyGeneral.unsafeMutableAddressor()
{
  return sub_21FFBCA44(&qword_267F05770, (uint64_t)static Logger.purpleBuddyGeneral);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static Logger.purpleBuddyGeneral.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21FFBCABC(&qword_267F05770, (uint64_t)static Logger.purpleBuddyGeneral, a1);
}

uint64_t sub_21FFBC984(uint64_t a1)
{
  return sub_21FFBC9A8(a1, static Logger.purpleBuddyAppearance);
}

uint64_t sub_21FFBC9A8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_21FFC0640();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_21FFC0630();
}

uint64_t Logger.purpleBuddyAppearance.unsafeMutableAddressor()
{
  return sub_21FFBCA44(&qword_267F05778, (uint64_t)static Logger.purpleBuddyAppearance);
}

uint64_t sub_21FFBCA44(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_21FFC0640();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Logger.purpleBuddyAppearance.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21FFBCABC(&qword_267F05778, (uint64_t)static Logger.purpleBuddyAppearance, a1);
}

uint64_t sub_21FFBCABC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_21FFC0640();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

id variable initialization expression of ViewControllerSpinnerManager.weakObjectHashTable()
{
  id v0 = objc_msgSend(self, sel_strongToWeakObjectsMapTable);
  return v0;
}

uint64_t variable initialization expression of ViewControllerSpinnerManager.navigationController()
{
  return 0;
}

uint64_t variable initialization expression of ViewControllerSpinnerManager.exceptionClassList()
{
  uint64_t v0 = sub_21FFBCBE4((uint64_t)&unk_26D1D0A98);
  swift_arrayDestroy();
  return v0;
}

uint64_t sub_21FFBCBE4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F05788);
    uint64_t v3 = sub_21FFC0750();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_21FFC07D0();
      swift_bridgeObjectRetain();
      sub_21FFC0690();
      uint64_t result = sub_21FFC07E0();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (uint64_t result = sub_21FFC07C0(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            uint64_t result = sub_21FFC07C0();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      void *v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
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

uint64_t sub_21FFBCE30()
{
  swift_beginAccess();
  id v1 = objc_getAssociatedObject(v0, &unk_267F05790);
  swift_endAccess();
  if (v1)
  {
    sub_21FFC0740();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_21FFBFFA4((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    if (swift_dynamicCast()) {
      return v3;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_21FFC000C((uint64_t)v5);
    return 0;
  }
}

id sub_21FFBCF10()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ViewControllerSpinnerManager()), sel_init);
  qword_267F05798 = (uint64_t)result;
  return result;
}

id ViewControllerSpinnerManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void sub_21FFBCFB8(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v73 = a2;
  uint64_t v7 = (void *)sub_21FFC0650();
  uint64_t v8 = *(v7 - 1);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (uint64_t *)((char *)&v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_21FFBFF68(0, &qword_267F05820);
  *uint64_t v10 = sub_21FFC0700();
  (*(void (**)(uint64_t *, void, void *))(v8 + 104))(v10, *MEMORY[0x263F8F0E0], v7);
  uint64_t v11 = sub_21FFC0660();
  uint64_t v13 = *(void (**)(uint64_t *, void *))(v8 + 8);
  unint64_t v12 = (SEL *)(v8 + 8);
  v13(v10, v7);
  if ((v11 & 1) == 0)
  {
    __break(1u);
    goto LABEL_43;
  }
  uint64_t v14 = OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_navigationController;
  if (!*(void *)(v4 + OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_navigationController))
  {
    id v25 = objc_msgSend(self, sel_sharedSpinnerManager);
    if (v25)
    {
      v26 = v25;
      v27 = (void *)sub_21FFC0670();
      objc_msgSend(v26, sel_startAnimatingInNavigationItemOfViewController_forIdentifier_, a1, v27);

      if (qword_267F05770 != -1) {
        swift_once();
      }
      uint64_t v28 = sub_21FFC0640();
      __swift_project_value_buffer(v28, (uint64_t)static Logger.purpleBuddyGeneral);
      id v29 = a1;
      swift_bridgeObjectRetain_n();
      id v30 = v29;
      v31 = sub_21FFC0620();
      os_log_type_t v32 = sub_21FFC06E0();
      if (os_log_type_enabled(v31, v32))
      {
        uint64_t v33 = swift_slowAlloc();
        v34 = (void *)swift_slowAlloc();
        uint64_t v72 = swift_slowAlloc();
        uint64_t v75 = (uint64_t)v30;
        uint64_t v76 = v72;
        *(_DWORD *)uint64_t v33 = 138412546;
        id v35 = v30;
        sub_21FFC0720();
        void *v34 = a1;

        *(_WORD *)(v33 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v75 = sub_21FFBEE7C(v73, a3, &v76);
        sub_21FFC0720();
        swift_bridgeObjectRelease_n();
        v36 = "Showing legacy spinner for view controller %@ with identifier %s without navigationController.";
LABEL_40:
        _os_log_impl(&dword_21FF9E000, v31, v32, v36, (uint8_t *)v33, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_267F05828);
        swift_arrayDestroy();
        MEMORY[0x223C63E60](v34, -1, -1);
        uint64_t v70 = v72;
        swift_arrayDestroy();
        MEMORY[0x223C63E60](v70, -1, -1);
        MEMORY[0x223C63E60](v33, -1, -1);

        return;
      }
      goto LABEL_41;
    }
    goto LABEL_46;
  }
  id v15 = *(id *)(v4 + OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_weakObjectHashTable);
  v16 = (void *)sub_21FFC0670();
  objc_msgSend(v15, sel_setObject_forKey_, a1, v16);

  BOOL v17 = *(void **)(v4 + v14);
  if (!v17)
  {
    __break(1u);
    goto LABEL_45;
  }
  id v18 = objc_msgSend(v17, sel_navigationBar);
  id v19 = objc_msgSend(self, sel_tertiaryLabelColor);
  objc_msgSend(v18, sel_setTintColor_, v19);

  v20 = *(void **)(v4 + v14);
  if (!v20)
  {
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
    return;
  }
  id v21 = objc_msgSend(v20, sel_navigationBar);
  objc_msgSend(v21, sel_setUserInteractionEnabled_, 0);

  self;
  uint64_t v7 = (void *)swift_dynamicCastObjCClass();
  if (v7) {
    id v22 = a1;
  }
  v74 = &unk_26D1EC510;
  uint64_t v23 = swift_dynamicCastObjCProtocolConditional();
  if (v23)
  {
    uint64_t v11 = v23;
    id v24 = a1;
    if (!v7)
    {
LABEL_25:
      objc_msgSend((id)v11, sel_startIndeterminateProgressIndicator);
      swift_unknownObjectRelease();
      if (qword_267F05770 != -1) {
        swift_once();
      }
      uint64_t v52 = sub_21FFC0640();
      __swift_project_value_buffer(v52, (uint64_t)static Logger.purpleBuddyGeneral);
      id v53 = a1;
      swift_bridgeObjectRetain_n();
      id v30 = v53;
      v31 = sub_21FFC0620();
      os_log_type_t v32 = sub_21FFC06F0();
      if (os_log_type_enabled(v31, v32))
      {
        uint64_t v33 = swift_slowAlloc();
        v34 = (void *)swift_slowAlloc();
        uint64_t v72 = swift_slowAlloc();
        uint64_t v75 = (uint64_t)v30;
        uint64_t v76 = v72;
        *(_DWORD *)uint64_t v33 = 138412546;
        id v54 = v30;
        sub_21FFC0720();
        void *v34 = a1;

        *(_WORD *)(v33 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v75 = sub_21FFBEE7C(v73, a3, &v76);
        sub_21FFC0720();
        swift_bridgeObjectRelease_n();
        v36 = "Showing second party spinner for view controller %@ with identifier %s.";
        goto LABEL_40;
      }
      goto LABEL_41;
    }
  }
  else
  {
    if (!v7)
    {
LABEL_29:
      id v55 = objc_msgSend(self, sel_sharedSpinnerManager);
      if (v55)
      {
        v56 = v55;
        v57 = (void *)sub_21FFC0670();
        objc_msgSend(v56, sel_startAnimatingInNavigationItemOfViewController_forIdentifier_, a1, v57);

        uint64_t v58 = *(void *)(v4 + OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_exceptionClassList);
        swift_getObjectType();
        ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
        v60 = NSStringFromClass(ObjCClassFromMetadata);
        uint64_t v61 = sub_21FFC0680();
        uint64_t v63 = v62;

        LOBYTE(v58) = sub_21FFBEA48(v61, v63, v58);
        swift_bridgeObjectRelease();
        if (v58)
        {
          if (qword_267F05770 != -1) {
            swift_once();
          }
          uint64_t v64 = sub_21FFC0640();
          __swift_project_value_buffer(v64, (uint64_t)static Logger.purpleBuddyGeneral);
          id v65 = a1;
          swift_bridgeObjectRetain_n();
          id v30 = v65;
          v31 = sub_21FFC0620();
          os_log_type_t v32 = sub_21FFC06F0();
          if (os_log_type_enabled(v31, v32))
          {
            uint64_t v33 = swift_slowAlloc();
            v34 = (void *)swift_slowAlloc();
            uint64_t v72 = swift_slowAlloc();
            uint64_t v75 = (uint64_t)v30;
            uint64_t v76 = v72;
            *(_DWORD *)uint64_t v33 = 138412546;
            id v66 = v30;
            sub_21FFC0720();
            void *v34 = a1;

            *(_WORD *)(v33 + 12) = 2080;
            swift_bridgeObjectRetain();
            uint64_t v75 = sub_21FFBEE7C(v73, a3, &v76);
            sub_21FFC0720();
            swift_bridgeObjectRelease_n();
            v36 = "Showing legacy spinner for view controller %@ with identifier %s.";
            goto LABEL_40;
          }
        }
        else
        {
          if (qword_267F05770 != -1) {
            swift_once();
          }
          uint64_t v67 = sub_21FFC0640();
          __swift_project_value_buffer(v67, (uint64_t)static Logger.purpleBuddyGeneral);
          id v68 = a1;
          swift_bridgeObjectRetain_n();
          id v30 = v68;
          v31 = sub_21FFC0620();
          os_log_type_t v32 = sub_21FFC06E0();
          if (os_log_type_enabled(v31, v32))
          {
            uint64_t v33 = swift_slowAlloc();
            v34 = (void *)swift_slowAlloc();
            uint64_t v72 = swift_slowAlloc();
            uint64_t v75 = (uint64_t)v30;
            uint64_t v76 = v72;
            *(_DWORD *)uint64_t v33 = 138412546;
            id v69 = v30;
            sub_21FFC0720();
            void *v34 = a1;

            *(_WORD *)(v33 + 12) = 2080;
            swift_bridgeObjectRetain();
            uint64_t v75 = sub_21FFBEE7C(v73, a3, &v76);
            sub_21FFC0720();
            swift_bridgeObjectRelease_n();
            v36 = "Showing legacy spinner for view controller %@ with identifier %s. Please move to use SecondPartyProgre"
                  "ssIndicatorDisplayable";
            goto LABEL_40;
          }
        }
LABEL_41:

        swift_bridgeObjectRelease_n();
        return;
      }
      goto LABEL_47;
    }
    uint64_t v11 = 0;
  }
  unint64_t v12 = (SEL *)&__block_descriptor_40_e8_32s_e38_B32__0__BFFNavigationObserver_8Q16_B24ls32l8;
  id v37 = objc_msgSend(v7, sel_buttonTray);
  id v38 = objc_msgSend(v37, sel_allButtons);

  sub_21FFBFF68(0, &qword_267F05890);
  unint64_t v39 = sub_21FFC06B0();

  if (!(v39 >> 62))
  {
    uint64_t v40 = *(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_19;
  }
LABEL_43:
  swift_bridgeObjectRetain();
  uint64_t v40 = sub_21FFC07A0();
  swift_bridgeObjectRelease();
LABEL_19:
  swift_bridgeObjectRelease();
  if (v40 < 1)
  {

    if (v11) {
      goto LABEL_25;
    }
    goto LABEL_29;
  }
  swift_unknownObjectRelease();
  id v41 = [v7 v12[255]];
  objc_msgSend(v41, sel_showButtonsBusy);

  if (qword_267F05770 != -1) {
    swift_once();
  }
  uint64_t v42 = sub_21FFC0640();
  __swift_project_value_buffer(v42, (uint64_t)static Logger.purpleBuddyGeneral);
  id v43 = a1;
  swift_bridgeObjectRetain_n();
  unint64_t v44 = a3;
  id v45 = v43;
  v46 = sub_21FFC0620();
  os_log_type_t v47 = sub_21FFC06F0();
  if (os_log_type_enabled(v46, v47))
  {
    uint64_t v48 = swift_slowAlloc();
    v71 = (void *)swift_slowAlloc();
    uint64_t v72 = swift_slowAlloc();
    uint64_t v75 = (uint64_t)v45;
    uint64_t v76 = v72;
    *(_DWORD *)uint64_t v48 = 138412546;
    id v49 = v45;
    sub_21FFC0720();
    v50 = v71;
    void *v71 = a1;

    *(_WORD *)(v48 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v75 = sub_21FFBEE7C(v73, v44, &v76);
    sub_21FFC0720();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21FF9E000, v46, v47, "Showing OnBoardingKit button spinner for view controller %@ with identifier %s.", (uint8_t *)v48, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F05828);
    swift_arrayDestroy();
    MEMORY[0x223C63E60](v50, -1, -1);
    uint64_t v51 = v72;
    swift_arrayDestroy();
    MEMORY[0x223C63E60](v51, -1, -1);
    MEMORY[0x223C63E60](v48, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

void static ViewControllerSpinnerManager.stopAnimatingSpinner(for:)(void *a1, unint64_t a2)
{
  if (qword_267F05780 != -1) {
    swift_once();
  }
  sub_21FFBDD20(a1, a2);
}

void sub_21FFBDD20(id a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_21FFC0650();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (uint64_t *)((char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_21FFBFF68(0, &qword_267F05820);
  *uint64_t v9 = sub_21FFC0700();
  (*(void (**)(uint64_t *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F8F0E0], v6);
  char v10 = sub_21FFC0660();
  (*(void (**)(uint64_t *, uint64_t))(v7 + 8))(v9, v6);
  if ((v10 & 1) == 0)
  {
    __break(1u);
    goto LABEL_50;
  }
  uint64_t v11 = OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_navigationController;
  if (!*(void *)(v3 + OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_navigationController))
  {
    id v23 = objc_msgSend(self, sel_sharedSpinnerManager);
    if (!v23)
    {
LABEL_53:
      __break(1u);
      goto LABEL_54;
    }
    id v24 = v23;
    id v25 = (void *)sub_21FFC0670();
    objc_msgSend(v24, sel_stopAnimatingForIdentifier_, v25);

    if (qword_267F05770 == -1)
    {
LABEL_11:
      uint64_t v26 = sub_21FFC0640();
      __swift_project_value_buffer(v26, (uint64_t)static Logger.purpleBuddyGeneral);
      swift_bridgeObjectRetain_n();
      v27 = sub_21FFC0620();
      os_log_type_t v28 = sub_21FFC06E0();
      if (os_log_type_enabled(v27, v28))
      {
        id v29 = (uint8_t *)swift_slowAlloc();
        uint64_t v30 = swift_slowAlloc();
        uint64_t v73 = v30;
        *(_DWORD *)id v29 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v72 = sub_21FFBEE7C((uint64_t)a1, a2, &v73);
        sub_21FFC0720();
        swift_bridgeObjectRelease_n();
        v31 = "Stopped legacy spinner with identifier %s without navigationController.";
LABEL_17:
        _os_log_impl(&dword_21FF9E000, v27, v28, v31, v29, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x223C63E60](v30, -1, -1);
        MEMORY[0x223C63E60](v29, -1, -1);

        return;
      }
LABEL_18:

      swift_bridgeObjectRelease_n();
      return;
    }
LABEL_50:
    swift_once();
    goto LABEL_11;
  }
  uint64_t v12 = OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_weakObjectHashTable;
  id v13 = *(id *)(v3 + OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_weakObjectHashTable);
  uint64_t v14 = (void *)sub_21FFC0670();
  id v15 = objc_msgSend(v13, sel_objectForKey_, v14);

  if (!v15)
  {
    if (qword_267F05770 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_21FFC0640();
    __swift_project_value_buffer(v32, (uint64_t)static Logger.purpleBuddyGeneral);
    swift_bridgeObjectRetain_n();
    v27 = sub_21FFC0620();
    os_log_type_t v28 = sub_21FFC06C0();
    if (os_log_type_enabled(v27, v28))
    {
      id v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      uint64_t v73 = v30;
      *(_DWORD *)id v29 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v72 = sub_21FFBEE7C((uint64_t)a1, a2, &v73);
      sub_21FFC0720();
      swift_bridgeObjectRelease_n();
      v31 = "Unnecessary call to stopAnimating as no controller was found identifier %s";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  id v16 = *(id *)(v3 + v12);
  BOOL v17 = (void *)sub_21FFC0670();
  objc_msgSend(v16, sel_removeObjectForKey_, v17);

  self;
  id v18 = (void *)swift_dynamicCastObjCClass();
  if (v18) {
    id v19 = v15;
  }
  v71 = &unk_26D1EC510;
  uint64_t v20 = swift_dynamicCastObjCProtocolConditional();
  if (v20)
  {
    id v21 = (void *)v20;
    id v22 = v15;
    if (!v18)
    {
LABEL_29:
      uint64_t v68 = (uint64_t)a1;
      objc_msgSend(v21, sel_stopIndeterminateProgressIndicator);
      swift_unknownObjectRelease();
      if (qword_267F05770 != -1) {
        swift_once();
      }
      uint64_t v46 = sub_21FFC0640();
      __swift_project_value_buffer(v46, (uint64_t)static Logger.purpleBuddyGeneral);
      id v47 = v15;
      swift_bridgeObjectRetain_n();
      a1 = v47;
      id v41 = sub_21FFC0620();
      os_log_type_t v48 = sub_21FFC06F0();
      if (!os_log_type_enabled(v41, v48)) {
        goto LABEL_40;
      }
      uint64_t v49 = swift_slowAlloc();
      os_log_t v66 = (os_log_t)swift_slowAlloc();
      uint64_t v67 = swift_slowAlloc();
      uint64_t v72 = (uint64_t)a1;
      uint64_t v73 = v67;
      *(_DWORD *)uint64_t v49 = 138412546;
      uint64_t v69 = v11;
      a1 = a1;
      sub_21FFC0720();
      os_log_t v50 = v66;
      v66->isa = (Class)v15;

      *(_WORD *)(v49 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v72 = sub_21FFBEE7C(v68, a2, &v73);
      uint64_t v11 = v69;
      sub_21FFC0720();
      swift_bridgeObjectRelease_n();
      uint64_t v51 = "Stopped second party spinner for view controller %@ with identifier %s.";
      goto LABEL_38;
    }
  }
  else
  {
    if (!v18) {
      goto LABEL_33;
    }
    id v21 = 0;
  }
  id v33 = objc_msgSend(v18, sel_buttonTray);
  id v34 = objc_msgSend(v33, sel_allButtons);

  sub_21FFBFF68(0, &qword_267F05890);
  unint64_t v35 = sub_21FFC06B0();

  if (v35 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_21FFC07A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v36 = *(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v36 >= 1)
  {
    uint64_t v69 = v11;
    swift_unknownObjectRelease();
    id v37 = objc_msgSend(v18, sel_buttonTray);
    objc_msgSend(v37, sel_showButtonsAvailable);

    if (qword_267F05770 != -1) {
      swift_once();
    }
    uint64_t v38 = sub_21FFC0640();
    __swift_project_value_buffer(v38, (uint64_t)static Logger.purpleBuddyGeneral);
    id v39 = v15;
    swift_bridgeObjectRetain_n();
    id v40 = v39;
    id v41 = sub_21FFC0620();
    os_log_type_t v42 = sub_21FFC06F0();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      id v65 = (void *)swift_slowAlloc();
      uint64_t v67 = swift_slowAlloc();
      uint64_t v72 = (uint64_t)v40;
      uint64_t v73 = v67;
      *(_DWORD *)uint64_t v43 = 138412546;
      uint64_t v68 = (uint64_t)a1;
      os_log_t v66 = v41;
      id v44 = v40;
      sub_21FFC0720();
      a1 = v65;
      *id v65 = v15;

      *(_WORD *)(v43 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v72 = sub_21FFBEE7C(v68, a2, &v73);
      sub_21FFC0720();
      swift_bridgeObjectRelease_n();
      id v41 = v66;
      _os_log_impl(&dword_21FF9E000, v66, v42, "Stopped OnBoardingKit button spinner for view controller %@ with identifier %s", (uint8_t *)v43, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F05828);
      swift_arrayDestroy();
      MEMORY[0x223C63E60](a1, -1, -1);
      uint64_t v45 = v67;
      swift_arrayDestroy();
      MEMORY[0x223C63E60](v45, -1, -1);
      MEMORY[0x223C63E60](v43, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v11 = v69;
    uint64_t v58 = *(void **)(v3 + v69);
    if (v58) {
      goto LABEL_44;
    }
    goto LABEL_39;
  }

  if (v21) {
    goto LABEL_29;
  }
LABEL_33:
  id v52 = objc_msgSend(self, sel_sharedSpinnerManager);
  if (!v52)
  {
LABEL_54:
    __break(1u);
    return;
  }
  id v53 = v52;
  uint64_t v68 = (uint64_t)a1;
  id v54 = (void *)sub_21FFC0670();
  objc_msgSend(v53, sel_stopAnimatingForIdentifier_, v54);

  if (qword_267F05770 != -1) {
    swift_once();
  }
  uint64_t v55 = sub_21FFC0640();
  __swift_project_value_buffer(v55, (uint64_t)static Logger.purpleBuddyGeneral);
  id v56 = v15;
  swift_bridgeObjectRetain_n();
  a1 = v56;
  id v41 = sub_21FFC0620();
  os_log_type_t v48 = sub_21FFC06F0();
  if (!os_log_type_enabled(v41, v48)) {
    goto LABEL_40;
  }
  uint64_t v49 = swift_slowAlloc();
  os_log_t v66 = (os_log_t)swift_slowAlloc();
  uint64_t v67 = swift_slowAlloc();
  uint64_t v72 = (uint64_t)a1;
  uint64_t v73 = v67;
  *(_DWORD *)uint64_t v49 = 138412546;
  uint64_t v69 = v11;
  a1 = a1;
  sub_21FFC0720();
  os_log_t v50 = v66;
  v66->isa = (Class)v15;

  *(_WORD *)(v49 + 12) = 2080;
  swift_bridgeObjectRetain();
  uint64_t v72 = sub_21FFBEE7C(v68, a2, &v73);
  uint64_t v11 = v69;
  sub_21FFC0720();
  swift_bridgeObjectRelease_n();
  uint64_t v51 = "Stopped legacy spinner for view controller %@ with identifier %s.";
LABEL_38:
  _os_log_impl(&dword_21FF9E000, v41, v48, v51, (uint8_t *)v49, 0x16u);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F05828);
  swift_arrayDestroy();
  MEMORY[0x223C63E60](v50, -1, -1);
  uint64_t v57 = v67;
  swift_arrayDestroy();
  MEMORY[0x223C63E60](v57, -1, -1);
  MEMORY[0x223C63E60](v49, -1, -1);

  uint64_t v58 = *(void **)(v3 + v11);
  if (v58) {
    goto LABEL_44;
  }
  do
  {
LABEL_39:
    __break(1u);
LABEL_40:

    swift_bridgeObjectRelease_n();
    uint64_t v58 = *(void **)(v3 + v11);
  }
  while (!v58);
LABEL_44:
  id v59 = objc_msgSend(v58, sel_navigationBar);
  objc_msgSend(v59, sel_setTintColor_, 0);

  v60 = *(void **)(v3 + v11);
  if (!v60)
  {
    __break(1u);
    goto LABEL_53;
  }
  id v61 = objc_msgSend(v60, sel_navigationBar);
  objc_msgSend(v61, sel_setUserInteractionEnabled_, 1);

  uint64_t v70 = &unk_26D205D78;
  uint64_t v62 = (void *)swift_dynamicCastObjCProtocolConditional();
  if (v62)
  {
    uint64_t v63 = v62;
    if (objc_msgSend(v62, sel_respondsToSelector_, sel_viewControllerSpinnerManagerDidStopAnimatingSpinner_))objc_msgSend(v63, sel_viewControllerSpinnerManagerDidStopAnimatingSpinner_, v3); {
  }
    }
}

uint64_t sub_21FFBEA48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_21FFC07D0();
    sub_21FFC0690();
    uint64_t v6 = sub_21FFC07E0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_21FFC07C0() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          id v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_21FFC07C0() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

Swift::Void __swiftcall ViewControllerSpinnerManager.navigationController(_:didShow:operation:animated:)(BFFNavigationController *_, UIViewController *didShow, UINavigationControllerOperation operation, Swift::Bool animated)
{
}

id ViewControllerSpinnerManager.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_weakObjectHashTable;
  uint64_t v3 = self;
  uint64_t v4 = v0;
  *(void *)&v0[v2] = objc_msgSend(v3, sel_strongToWeakObjectsMapTable);
  *(void *)&v4[OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_navigationController] = 0;
  uint64_t v5 = OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_exceptionClassList;
  uint64_t v6 = sub_21FFBCBE4((uint64_t)&unk_26D1D0B18);
  swift_arrayDestroy();
  *(void *)&v4[v5] = v6;

  v8.receiver = v4;
  v8.super_class = ObjectType;
  return objc_msgSendSuper2(&v8, sel_init);
}

id ViewControllerSpinnerManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21FFBEE7C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_21FFBEF50(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_21FFBFF08((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_21FFBFF08((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0(v12);
  return v7;
}

uint64_t sub_21FFBEF50(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21FFC0730();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_21FFBF10C(a5, a6);
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
  uint64_t v8 = sub_21FFC0780();
  if (!v8)
  {
    sub_21FFC0790();
    __break(1u);
LABEL_17:
    uint64_t result = sub_21FFC07B0();
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

uint64_t sub_21FFBF10C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_21FFBF1A4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_21FFBF384(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_21FFBF384(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21FFBF1A4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_21FFBF31C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_21FFC0760();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_21FFC0790();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_21FFC06A0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_21FFC07B0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_21FFC0790();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_21FFBF31C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F05898);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21FFBF384(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F05898);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
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
  uint64_t result = sub_21FFC07B0();
  __break(1u);
  return result;
}

void _s16SetupAssistantUI28ViewControllerSpinnerManagerC023configureWithNavigationE0yySo013BFFNavigationE0CFZ_0(void *a1)
{
  if (qword_267F05780 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void **)(qword_267F05798 + OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_navigationController);
  *(void *)(qword_267F05798 + OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_navigationController) = a1;

  uint64_t v3 = qword_267F05798;
  unint64_t v4 = *(void **)(qword_267F05798 + OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_navigationController);
  if (v4)
  {
    id v5 = a1;
    objc_msgSend(v4, sel_addDelegateObserver_, v3);
  }
  else
  {
    __break(1u);
  }
}

void _s16SetupAssistantUI28ViewControllerSpinnerManagerC014startAnimatingF03for10identifierySo06UIViewE0C_SStFZ_0(void *a1, uint64_t a2, unint64_t a3)
{
  if (qword_267F05780 != -1) {
    swift_once();
  }
  id v6 = *(id *)(qword_267F05798 + OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_weakObjectHashTable);
  int64_t v7 = (void *)sub_21FFC0670();
  id v29 = objc_msgSend(v6, sel_objectForKey_, v7);

  if (!v29) {
    goto LABEL_17;
  }
  sub_21FFBFF68(0, &qword_267F058A0);
  if ((sub_21FFC0710() & 1) == 0)
  {
    if (qword_267F05770 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_21FFC0640();
    __swift_project_value_buffer(v17, (uint64_t)static Logger.purpleBuddyGeneral);
    swift_bridgeObjectRetain_n();
    id v18 = v29;
    id v19 = sub_21FFC0620();
    os_log_type_t v20 = sub_21FFC06E0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      id v30 = (id)swift_slowAlloc();
      v31[0] = (uint64_t)v30;
      *(_DWORD *)uint64_t v21 = 136315394;
      swift_bridgeObjectRetain();
      sub_21FFBEE7C(a2, a3, v31);
      sub_21FFC0720();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v21 + 12) = 2080;
      id v22 = objc_msgSend(v18, sel_debugDescription);
      uint64_t v23 = sub_21FFC0680();
      os_log_type_t typea = v20;
      unint64_t v25 = v24;

      sub_21FFBEE7C(v23, v25, v31);
      sub_21FFC0720();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21FF9E000, v19, typea, "Attempting to start spinner animation with a identifier %s that is already used for a controller %s", (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x223C63E60](v30, -1, -1);
      MEMORY[0x223C63E60](v21, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
LABEL_17:
    swift_bridgeObjectRetain();
    uint64_t v26 = (void *)sub_21FFC0670();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    objc_setAssociatedObject(a1, &unk_267F05790, v26, (void *)1);
    swift_endAccess();

    sub_21FFBCFB8(a1, a2, a3);
    return;
  }
  if (qword_267F05770 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_21FFC0640();
  __swift_project_value_buffer(v8, (uint64_t)static Logger.purpleBuddyGeneral);
  swift_bridgeObjectRetain_n();
  id v9 = a1;
  uint64_t v10 = sub_21FFC0620();
  os_log_type_t v11 = sub_21FFC06D0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t type = swift_slowAlloc();
    v31[0] = type;
    *(_DWORD *)uint64_t v12 = 136315394;
    id v13 = objc_msgSend(v9, sel_debugDescription);
    uint64_t v14 = sub_21FFC0680();
    unint64_t v16 = v15;

    sub_21FFBEE7C(v14, v16, v31);
    sub_21FFC0720();

    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_21FFBEE7C(a2, a3, v31);
    sub_21FFC0720();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21FF9E000, v10, v11, "%s already animating spinner for identifier %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x223C63E60](type, -1, -1);
    MEMORY[0x223C63E60](v12, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

void sub_21FFBFB10(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_navigationController;
  id v6 = *(void **)(v3 + OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_navigationController);
  if (!v6)
  {
    __break(1u);
    goto LABEL_24;
  }
  id v8 = objc_msgSend(v6, sel_navigationBar);
  objc_msgSend(v8, sel_setTintColor_, 0);

  id v9 = *(void **)(v3 + v5);
  if (!v9)
  {
LABEL_24:
    __break(1u);
    return;
  }
  id v10 = objc_msgSend(v9, sel_navigationBar);
  objc_msgSend(v10, sel_setUserInteractionEnabled_, 1);

  id v11 = objc_msgSend(a1, sel_viewControllers);
  uint64_t v12 = sub_21FFBFF68(0, &qword_267F058A0);
  unint64_t v13 = sub_21FFC06B0();

  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_21FFC07A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  unint64_t v15 = v14 - 2;
  if (v14 >= 2 && a2 == 1)
  {
    id v16 = objc_msgSend(a1, sel_viewControllers);
    uint64_t v17 = sub_21FFC06B0();

    if ((v17 & 0xC000000000000001) != 0)
    {
      id v18 = (id)MEMORY[0x223C63560](v14 - 2, v17);
    }
    else
    {
      if (v15 >= *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
LABEL_22:
        swift_once();
LABEL_12:
        uint64_t v21 = sub_21FFC0640();
        __swift_project_value_buffer(v21, (uint64_t)static Logger.purpleBuddyGeneral);
        swift_bridgeObjectRetain();
        id v22 = sub_21FFC0620();
        os_log_type_t v23 = sub_21FFC06C0();
        if (os_log_type_enabled(v22, v23))
        {
          unint64_t v24 = (uint8_t *)swift_slowAlloc();
          uint64_t v25 = swift_slowAlloc();
          uint64_t v27 = v25;
          *(_DWORD *)unint64_t v24 = 136315138;
          swift_bridgeObjectRetain();
          sub_21FFBEE7C(v12, (unint64_t)v16, &v27);
          sub_21FFC0720();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_21FF9E000, v22, v23, "NavigationController.didShow called stop spinner for identifier %s.", v24, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x223C63E60](v25, -1, -1);
          MEMORY[0x223C63E60](v24, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        return;
      }
      id v18 = *(id *)(v17 + 8 * v15 + 32);
    }
    id v26 = v18;
    swift_bridgeObjectRelease();
    id v19 = (void *)sub_21FFBCE30();
    if (v20)
    {
      uint64_t v12 = (uint64_t)v19;
      id v16 = (id)v20;
      sub_21FFBDD20(v19, v20);
      if (qword_267F05770 == -1) {
        goto LABEL_12;
      }
      goto LABEL_22;
    }
  }
}

uint64_t type metadata accessor for ViewControllerSpinnerManager()
{
  return self;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return MEMORY[0x270FA0520](*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_21FFBFF08(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21FFBFF68(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21FFBFFA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F058A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21FFC000C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F058A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21FFC006C()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t getkCAFillModeBackwards_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __getCASpringAnimationClass_block_invoke_cold_1(v0);
}

uint64_t __getCASpringAnimationClass_block_invoke_cold_1()
{
  return __getCAMediaTimingFunctionClass_block_invoke_cold_1();
}

uint64_t __getCAMediaTimingFunctionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCABasicAnimationClass_block_invoke_cold_1(v0);
}

uint64_t __getCABasicAnimationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPKSetupAssistantContextClass_block_invoke_cold_1(v0);
}

uint64_t __getPKSetupAssistantContextClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPKPaymentSetupAssistantControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getPKPaymentSetupAssistantControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getBKUIPearlEnrollControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getBKUIPearlEnrollControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getBKDeviceClass_block_invoke_cold_1(v0);
}

uint64_t __getBKDeviceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getBKDeviceDescriptorClass_block_invoke_cold_1(v0);
}

uint64_t __getBKDeviceDescriptorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getBKUIPeriocularEnableSplashViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getBKUIPeriocularEnableSplashViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getBKUIFaceIDSplashViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getBKUIFaceIDSplashViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVTUIEnrollTrainingViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getVTUIEnrollTrainingViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAFPreferencesClass_block_invoke_cold_1(v0);
}

uint64_t __getAFPreferencesClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getOBPrivacyPresenterClass_block_invoke_cold_1(v0);
}

uint64_t __getOBPrivacyPresenterClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[BFFFinishSetupViewController _ensureNavigationControllerWithViewController:pushCompletion:](v0);
}

uint64_t __getBiometricKitUIClass_block_invoke_cold_1()
{
  return __getBiometricKitClass_block_invoke_cold_1();
}

uint64_t __getBiometricKitClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[BFFNavBarSpinnerManager startAnimatingInNavigationItemOfViewController:forIdentifier:](v0);
}

uint64_t sub_21FFC0620()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21FFC0630()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_21FFC0640()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21FFC0650()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_21FFC0660()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_21FFC0670()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21FFC0680()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21FFC0690()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21FFC06A0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21FFC06B0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21FFC06C0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_21FFC06D0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21FFC06E0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_21FFC06F0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_21FFC0700()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_21FFC0710()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_21FFC0720()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21FFC0730()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_21FFC0740()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_21FFC0750()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_21FFC0760()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21FFC0770()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21FFC0780()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21FFC0790()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21FFC07A0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21FFC07B0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21FFC07C0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21FFC07D0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21FFC07E0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t BYAssistantScreenShouldRunForPHSUpgrade()
{
  return MEMORY[0x270F5D208]();
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t PSHasStockholmPass()
{
  return MEMORY[0x270F55210]();
}

uint64_t PSSupportsMesa()
{
  return MEMORY[0x270F55310]();
}

uint64_t SecPasswordIsPasswordWeak2()
{
  return MEMORY[0x270EFDAF8]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x270F82CC0]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F82CD0](category);
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x270F82CF8]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x270F82E68]();
}

void UIRectFill(CGRect rect)
{
}

uint64_t UIRectInset()
{
  return MEMORY[0x270F82EC0]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x270F82F00]();
}

uint64_t _BYIsInternalInstall()
{
  return MEMORY[0x270F5D228]();
}

uint64_t _BYLoggingFacility()
{
  return MEMORY[0x270F5D230]();
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
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x270EDAB48]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}