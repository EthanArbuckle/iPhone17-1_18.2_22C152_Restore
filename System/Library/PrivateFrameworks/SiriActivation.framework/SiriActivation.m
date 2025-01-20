__CFString *SASRequestStateGetName(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"SASRequestStateOff";
  }
  else {
    return off_1E6B68668[a1 - 1];
  }
}

void sub_1D958C4E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D958F188(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D958F358(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void SiriInvokeOnMainQueue(void *a1)
{
  v1 = a1;
  if (v1)
  {
    block = v1;
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      block[2]();
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    v1 = block;
  }
}

double SiriSystemUpTimeFromCFAbsoluteCurrentTime(double a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  v3 = [MEMORY[0x1E4F28F80] processInfo];
  [v3 systemUptime];
  double v5 = a1 - (Current - v4);

  return v5;
}

void sub_1D9591D78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D9591F48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t SASDismissalReasonToSISchemaDismissalReason(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x41) {
    return 0;
  }
  else {
    return dword_1D95D8150[a1 - 1];
  }
}

uint64_t SASDismissalIsError(uint64_t a1)
{
  return ((unint64_t)(a1 - 12) < 0x38) & (0x8095800061620FuLL >> (a1 - 12));
}

uint64_t SASDismissalReasonGetCancellationReason(unint64_t a1)
{
  uint64_t v1 = 14;
  if (((1 << a1) & 0x2400401800040020) == 0) {
    uint64_t v1 = 0;
  }
  if (a1 <= 0x3D) {
    return v1;
  }
  else {
    return 0;
  }
}

void sub_1D959303C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D95932CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

BOOL SiriPresentationRotationStyleGetIsValid(unint64_t a1)
{
  return a1 < 3;
}

BOOL SiriPresentationRotationStyleGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

__CFString *SiriPresentationRotationStyleGetName(unint64_t a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return off_1E6B67640[a1];
  }
}

uint64_t SiriPresentationRotationStyleGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SiriPresentationRotationStyleGetFromName_onceToken != -1) {
      dispatch_once(&SiriPresentationRotationStyleGetFromName_onceToken, &__block_literal_global_0);
    }
    uint64_t v2 = [(id)SiriPresentationRotationStyleGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SiriPresentationRotationStyleGetFromName_block_invoke()
{
  v0 = (void *)SiriPresentationRotationStyleGetFromName_map;
  SiriPresentationRotationStyleGetFromName_map = (uint64_t)&unk_1F337CDB8;
}

void sub_1D9593CA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D9593E70(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D9594270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D9594634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D95955B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  _Block_object_dispose(&a23, 8);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D9595910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D9597A44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __getAWAttentionAwarenessConfigurationClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AWAttentionAwarenessConfiguration");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAWAttentionAwarenessConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAWAttentionAwarenessConfigurationClass_block_invoke_cold_1();
    AttentionAwarenessLibrary();
  }
}

void AttentionAwarenessLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!AttentionAwarenessLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __AttentionAwarenessLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6B677D8;
    uint64_t v3 = 0;
    AttentionAwarenessLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!AttentionAwarenessLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __AttentionAwarenessLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AttentionAwarenessLibraryCore_frameworkLibrary = result;
  return result;
}

void __getAWAttentionAwarenessClientClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AWAttentionAwarenessClient");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAWAttentionAwarenessClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAWAttentionAwarenessClientClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_2();
  }
}

void sub_1D9599BF8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1D9599D28(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D9599EF4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D959A134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D959BE58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D959DF80(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D959EA4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D95A28F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id soft_SBUIGetUserAgent()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void (*)(void))getSBUIGetUserAgentSymbolLoc_ptr;
  v8 = getSBUIGetUserAgentSymbolLoc_ptr;
  if (!getSBUIGetUserAgentSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getSBUIGetUserAgentSymbolLoc_block_invoke;
    v4[3] = &unk_1E6B677B8;
    v4[4] = &v5;
    __getSBUIGetUserAgentSymbolLoc_block_invoke((uint64_t)v4);
    v0 = (void (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)soft_SBUIGetUserAgent_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v3);
  }
  id v1 = v0();
  return v1;
}

void sub_1D95A3078(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void *__getSBUIGetUserAgentSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!SpringBoardUILibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __SpringBoardUILibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E6B67AE0;
    uint64_t v7 = 0;
    SpringBoardUILibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)SpringBoardUILibraryCore_frameworkLibrary;
    if (SpringBoardUILibraryCore_frameworkLibrary)
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
  uint64_t v2 = (void *)SpringBoardUILibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "SBUIGetUserAgent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBUIGetUserAgentSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpringBoardUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpringBoardUILibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

unsigned int SASMyriadUtilCurrentBoostForDecay(int a1, double *a2, double a3, double a4, double a5)
{
  if (a3 <= 0.0) {
    return 0;
  }
  double v5 = a5 - a4;
  if (v5 >= a3) {
    double v6 = a3;
  }
  else {
    double v6 = v5;
  }
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  *a2 = v5;
  return llround((1.0 - v6 / a3) * (double)a1);
}

void sub_1D95A53DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D95A55AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D95A5F04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

BOOL SASHeadphonesAuthenticationInvalidationReasonGetIsValid(unint64_t a1)
{
  return a1 < 5;
}

BOOL SASHeadphonesAuthenticationInvalidationReasonGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 4;
}

__CFString *SASHeadphonesAuthenticationInvalidationReasonGetName(unint64_t a1)
{
  if (a1 > 4) {
    return @"(unknown)";
  }
  else {
    return off_1E6B67BF0[a1];
  }
}

uint64_t SASHeadphonesAuthenticationInvalidationReasonGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SASHeadphonesAuthenticationInvalidationReasonGetFromName_onceToken != -1) {
      dispatch_once(&SASHeadphonesAuthenticationInvalidationReasonGetFromName_onceToken, &__block_literal_global_9);
    }
    uint64_t v2 = [(id)SASHeadphonesAuthenticationInvalidationReasonGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SASHeadphonesAuthenticationInvalidationReasonGetFromName_block_invoke()
{
  v0 = (void *)SASHeadphonesAuthenticationInvalidationReasonGetFromName_map;
  SASHeadphonesAuthenticationInvalidationReasonGetFromName_map = (uint64_t)&unk_1F337CDE0;
}

void sub_1D95AD778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D95ADCD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *SASPresentationManagerErrorGetName(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return @"SASPresentationManagerErrorInvalidStateTransition";
  }
  else {
    return off_1E6B67D48[a1 - 1];
  }
}

uint64_t SASCarPlayTransportTypeToSISchemaCarPlayConnection(unint64_t a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return dword_1D95D82E0[a1];
  }
}

uint64_t SASCarPlayEnhancedVoiceTriggerModeToSISchemaEnhancedVoiceTriggerMode(unint64_t a1)
{
  if (a1 > 3) {
    return 4;
  }
  else {
    return dword_1D95D82F0[a1];
  }
}

void sub_1D95AF030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D95AF200(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D95AF6DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D95AF8AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D95B053C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D95B0728(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D95B0E50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D95B1644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D95B5650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D95B5864(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D95B7180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D95B73EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v4 - 128), 8);
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

void sub_1D95B7E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D95B8068(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

BOOL SASTestingInputTypeGetIsValid(unint64_t a1)
{
  return a1 < 3;
}

BOOL SASTestingInputTypeGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

__CFString *SASTestingInputTypeGetName(unint64_t a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return off_1E6B67FF0[a1];
  }
}

uint64_t SASTestingInputTypeGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SASTestingInputTypeGetFromName_onceToken != -1) {
      dispatch_once(&SASTestingInputTypeGetFromName_onceToken, &__block_literal_global_16);
    }
    uint64_t v2 = [(id)SASTestingInputTypeGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SASTestingInputTypeGetFromName_block_invoke()
{
  v0 = (void *)SASTestingInputTypeGetFromName_map;
  SASTestingInputTypeGetFromName_map = (uint64_t)&unk_1F337CE08;
}

id SASCarPlayEnhancedSiriCharacteristicsToString(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    uint64_t v3 = v2;
    if (v1)
    {
      [v2 addObject:@"zll"];
      if ((v1 & 2) == 0)
      {
LABEL_4:
        if ((v1 & 4) == 0)
        {
LABEL_6:
          uint64_t v1 = [v3 componentsJoinedByString:@", "];

          goto LABEL_7;
        }
LABEL_5:
        [v3 addObject:@"mixable"];
        goto LABEL_6;
      }
    }
    else if ((v1 & 2) == 0)
    {
      goto LABEL_4;
    }
    [v3 addObject:@"zllButton"];
    if ((v1 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_7:
  return (id)v1;
}

BOOL SASCarPlayEnhancedSiriCharacteristicsContainsCharacteristic(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

void sub_1D95B9A24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 104));
  _Unwind_Resume(a1);
}

void sub_1D95B9F84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t SASRemoteTypeFromSiriTVRemoteType(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 6) {
    return 0;
  }
  return result;
}

uint64_t SASRequestSourceGetName(unint64_t a1)
{
  if (a1 > 0x37) {
    return 0;
  }
  else {
    return (uint64_t)*(&off_1E6B681A8 + a1);
  }
}

uint64_t CARAutomaticFeatureStateGetName(unint64_t a1)
{
  if (a1 < 3) {
    return (uint64_t)*(&off_1E6B68368 + a1);
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
    CARAutomaticFeatureStateGetName_cold_1();
  }
  return 0;
}

__CFString *SASLockStateGetName(uint64_t a1)
{
  if (a1)
  {
    char v1 = a1;
    uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v3 = v2;
    if (v1) {
      [v2 addObject:@"SASLockStateScreenLocked"];
    }
    if ((v1 & 2) != 0) {
      [v3 addObject:@"SASLockStatePasscodeLocked"];
    }
    uint64_t v4 = [v3 componentsJoinedByString:@" & "];
  }
  else
  {
    uint64_t v4 = @"SASLockStateUnlocked";
  }
  return v4;
}

__CFString *SASRequestInputTypeGetDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"SASRequestInputTypeNone";
  }
  else {
    return *(&off_1E6B68380 + a1 - 1);
  }
}

uint64_t SASRequestSourceIsHTT(unint64_t a1)
{
  return (a1 < 0x2C) & (0x810F0430C06uLL >> a1);
}

uint64_t AFDirectActionSourceFromSASRequestSource(unint64_t a1)
{
  if (a1 < 0x38) {
    return qword_1D95D83D0[a1];
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
    AFDirectActionSourceFromSASRequestSource_cold_1();
  }
  return 0;
}

void sub_1D95BE580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D95BE750(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D95C0318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D95C04E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D95C0A2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1D95C0C4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

uint64_t _PasscodeLockStateDidChange(uint64_t a1, void *a2)
{
  return [a2 _lockStateDidChange:0];
}

void _AFPreferencesDidChangeCallback(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28ED0];
  id v5 = [MEMORY[0x1E4F4E538] sharedPreferences];
  uint64_t v4 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "assistantIsEnabled"));
  [a2 setAssistantIsEnabled:v4];
}

void sub_1D95C15C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id soft_SBUIGetUserAgent_0()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void (*)(void))getSBUIGetUserAgentSymbolLoc_ptr_0;
  uint64_t v8 = getSBUIGetUserAgentSymbolLoc_ptr_0;
  if (!getSBUIGetUserAgentSymbolLoc_ptr_0)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getSBUIGetUserAgentSymbolLoc_block_invoke_0;
    v4[3] = &unk_1E6B677B8;
    v4[4] = &v5;
    __getSBUIGetUserAgentSymbolLoc_block_invoke_0((uint64_t)v4);
    v0 = (void (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)soft_SBUIGetUserAgent_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v3);
  }
  char v1 = v0();
  return v1;
}

void sub_1D95C1914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D95C1A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSBUIGetUserAgentSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!SpringBoardUILibraryCore_frameworkLibrary_0)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __SpringBoardUILibraryCore_block_invoke_0;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E6B683D8;
    uint64_t v7 = 0;
    SpringBoardUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)SpringBoardUILibraryCore_frameworkLibrary_0;
    if (SpringBoardUILibraryCore_frameworkLibrary_0)
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
  uint64_t v2 = (void *)SpringBoardUILibraryCore_frameworkLibrary_0;
LABEL_5:
  uint64_t result = dlsym(v2, "SBUIGetUserAgent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBUIGetUserAgentSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpringBoardUILibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SpringBoardUILibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!MobileKeyBagLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __MobileKeyBagLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E6B683F0;
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
  uint64_t result = dlsym(v2, "MKBDeviceUnlockedSinceBoot");
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

void sub_1D95C265C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _HomeButtonTripleClickEnabled(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___HomeButtonTripleClickEnabled_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void sub_1D95C320C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D95C3B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D95C4A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1D95C56D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D95C58A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

__CFString *SiriTVStringForRemoteType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return @"SiriTVRemoteTypeUnknown";
  }
  else {
    return off_1E6B68588[a1 - 1];
  }
}

__CFString *SASButtonEventTypeGetName(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"SASButtonEventTypeUnknown";
  }
  else {
    return off_1E6B685B8[a1 - 1];
  }
}

BOOL SASDismissalReasonGetIsValid(unint64_t a1)
{
  return a1 < 0x45;
}

BOOL SASDismissalReasonGetIsValidAndSpecified(unint64_t a1)
{
  return a1 < 0x45;
}

__CFString *SASDismissalReasonGetName(unint64_t a1)
{
  if (a1 > 0x44) {
    return @"(unknown)";
  }
  else {
    return off_1E6B686D0[a1];
  }
}

uint64_t SASDismissalReasonGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SASDismissalReasonGetFromName_onceToken != -1) {
      dispatch_once(&SASDismissalReasonGetFromName_onceToken, &__block_literal_global_24);
    }
    uint64_t v2 = [(id)SASDismissalReasonGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SASDismissalReasonGetFromName_block_invoke()
{
  v0 = (void *)SASDismissalReasonGetFromName_map;
  SASDismissalReasonGetFromName_map = (uint64_t)&unk_1F337CE58;
}

void *sub_1D95CDE90()
{
  id v1 = (void **)(v0 + OBJC_IVAR___SASEngagementMonitor_currentEngagementContext);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

id sub_1D95CDF40@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  id v3 = (void **)(*a1 + OBJC_IVAR___SASEngagementMonitor_currentEngagementContext);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

void sub_1D95CDFA4(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = (void **)(*a2 + OBJC_IVAR___SASEngagementMonitor_currentEngagementContext);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = v2;
  id v5 = v2;
}

id EngagementMonitor.__deallocating_deinit()
{
  if (*(void *)&v0[OBJC_IVAR___SASEngagementMonitor_task])
  {
    *(void *)&v0[OBJC_IVAR___SASEngagementMonitor_task] = 0;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA8C3908);
    sub_1D95D2748();
    id v1 = (void **)&v0[OBJC_IVAR___SASEngagementMonitor_currentEngagementContext];
    swift_beginAccess();
    uint64_t v2 = *v1;
    id *v1 = 0;
    swift_release();
  }
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for EngagementMonitor();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

void sub_1D95CE13C()
{
  if (*(void *)(v0 + OBJC_IVAR___SASEngagementMonitor_task))
  {
    *(void *)(v0 + OBJC_IVAR___SASEngagementMonitor_task) = 0;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA8C3908);
    sub_1D95D2748();
    id v1 = (void **)(v0 + OBJC_IVAR___SASEngagementMonitor_currentEngagementContext);
    swift_beginAccess();
    uint64_t v2 = *v1;
    id *v1 = 0;
    swift_release();
  }
}

uint64_t type metadata accessor for EngagementMonitor()
{
  return self;
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

id EngagementMonitor.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id EngagementMonitor.init()()
{
  *(void *)&v0[OBJC_IVAR___SASEngagementMonitor_currentEngagementContext] = 0;
  *(void *)&v0[OBJC_IVAR___SASEngagementMonitor_task] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EngagementMonitor();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t method lookup function for EngagementMonitor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for EngagementMonitor);
}

uint64_t dispatch thunk of EngagementMonitor.currentEngagementContext.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of EngagementMonitor.start()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of EngagementMonitor.stop()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

unint64_t UserEngagementStatus.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

BOOL sub_1D95CE42C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1D95CE444()
{
  return sub_1D95D2768();
}

uint64_t *sub_1D95CE474@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

void sub_1D95CE490(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t PerceptionEntityQueryType.init(rawValue:)()
{
  return 0;
}

uint64_t sub_1D95CE4B0()
{
  return sub_1D95D2778();
}

uint64_t sub_1D95CE4F8()
{
  return sub_1D95D2778();
}

void *sub_1D95CE53C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != 0;
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

uint64_t sub_1D95CE554()
{
  return sub_1D95CE58C(*(uint64_t (**)(uint64_t))(v0 + 8), v0, 0);
}

uint64_t sub_1D95CE58C(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_1D95CE718(int a1, void *aBlock)
{
  BOOL v3 = (void (**)(void *, void))_Block_copy(aBlock);
  v3[2](v3, 0);
  _Block_release(v3);
  objc_super v4 = *(uint64_t (**)(void))(v2 + 8);
  return sub_1D95CFA14(v4);
}

uint64_t PerceptionModelImpl.deinit()
{
  return v0;
}

uint64_t PerceptionModelImpl.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

id PerceptionEntityWrapper.__allocating_init(model:)(uint64_t a1)
{
  swift_getObjectType();
  return sub_1D95CEFD4(a1);
}

id PerceptionEntityWrapper.init(model:)(uint64_t a1)
{
  swift_getObjectType();
  return sub_1D95CF028(a1, v1);
}

id PerceptionEntityWrapper.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id PerceptionEntityWrapper.init()()
{
  type metadata accessor for PerceptionModelImpl();
  uint64_t v0 = swift_allocObject();
  id v1 = (objc_class *)type metadata accessor for PerceptionEntityWrapper();
  uint64_t v2 = (char *)objc_allocWithZone(v1);
  *(void *)&v2[OBJC_IVAR___SASPerceptionEntityWrapper_model] = v0;
  v5.receiver = v2;
  v5.super_class = v1;
  id v3 = objc_msgSendSuper2(&v5, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v3;
}

uint64_t sub_1D95CE9A4(uint64_t (*a1)(void))
{
  return a1(0);
}

uint64_t sub_1D95CEA48()
{
  return sub_1D95CE58C(*(uint64_t (**)(uint64_t))(v0 + 8), v0, 2);
}

id PerceptionEntityWrapper.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PerceptionEntityWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D95CEAC4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  objc_super v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *objc_super v4 = v3;
  v4[1] = sub_1D95CFA28;
  return v6();
}

uint64_t sub_1D95CEB90(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  objc_super v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *objc_super v5 = v4;
  v5[1] = sub_1D95CFA28;
  return v7();
}

uint64_t sub_1D95CEC5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1D95D2738();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1D95D2728();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1D95CF8C4(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1D95D2718();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1D95CEE00(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1D95CEEDC;
  return v6(a1);
}

uint64_t sub_1D95CEEDC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

id sub_1D95CEFD4(uint64_t a1)
{
  uint64_t v2 = (objc_class *)type metadata accessor for PerceptionEntityWrapper();
  uint64_t v3 = (char *)objc_allocWithZone(v2);
  *(void *)&v3[OBJC_IVAR___SASPerceptionEntityWrapper_model] = a1;
  v5.receiver = v3;
  v5.super_class = v2;
  return objc_msgSendSuper2(&v5, sel_init);
}

id sub_1D95CF028(uint64_t a1, char *a2)
{
  *(void *)&a2[OBJC_IVAR___SASPerceptionEntityWrapper_model] = a1;
  v3.receiver = a2;
  v3.super_class = (Class)type metadata accessor for PerceptionEntityWrapper();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for PerceptionModelImpl()
{
  return self;
}

uint64_t type metadata accessor for PerceptionEntityWrapper()
{
  return self;
}

unint64_t sub_1D95CF0C0()
{
  unint64_t result = qword_1EA8C3928;
  if (!qword_1EA8C3928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8C3928);
  }
  return result;
}

unint64_t sub_1D95CF118()
{
  unint64_t result = qword_1EA8C3930;
  if (!qword_1EA8C3930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8C3930);
  }
  return result;
}

ValueMetadata *type metadata accessor for UserEngagementStatus()
{
  return &type metadata for UserEngagementStatus;
}

ValueMetadata *type metadata accessor for PerceptionEntityQueryType()
{
  return &type metadata for PerceptionEntityQueryType;
}

uint64_t method lookup function for PerceptionModelImpl(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PerceptionModelImpl);
}

uint64_t dispatch thunk of PerceptionModelImpl.performQuery(_:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 80) + **(int **)(*(void *)v1 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1D95CF2A8;
  return v6(a1);
}

uint64_t sub_1D95CF2A8(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  objc_super v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t method lookup function for PerceptionEntityWrapper(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PerceptionEntityWrapper);
}

uint64_t dispatch thunk of PerceptionEntityWrapper.__allocating_init(model:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of PerceptionEntityWrapper.userEngagementStatus(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of PerceptionEntityWrapper.userEngagementStatus()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  objc_super v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_1D95CF2A8;
  return v5();
}

uint64_t sub_1D95CF508()
{
  _Block_release(*(const void **)(v0 + 24));
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1D95CF548()
{
  uint64_t v2 = *(void *)(v0 + 16);
  objc_super v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1D95CF5FC;
  uint64_t v5 = (uint64_t (*)(int, void *))((char *)&dword_1EA8C3950 + dword_1EA8C3950);
  return v5(v2, v3);
}

uint64_t sub_1D95CF5FC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1D95CF6F4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1D95CFA28;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1EA8C3960 + dword_1EA8C3960);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_14Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1D95CF7F8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1D95CFA28;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EA8C3970 + dword_1EA8C3970);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1D95CF8C4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8C3948);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D95CF924()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1D95CF95C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1D95CF5FC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EA8C3980 + dword_1EA8C3980);
  return v6(a1, v4);
}

uint64_t sub_1D95CFA14(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t __getAWAttentionAwarenessConfigurationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAWAttentionAwarenessClientClass_block_invoke_cold_1(v0);
}

uint64_t __getAWAttentionAwarenessClientClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SASPresentationServer init](v0);
}

uint64_t soft_SBUIGetUserAgent_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __87__SiriActivationService__handlePocketStateFetchForScreenWakeForPresentationIdentifier___block_invoke_cold_1(v0);
}

void CARAutomaticFeatureStateGetName_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1D9588000, v0, OS_LOG_TYPE_ERROR, "%s Unsupported CARAutomaticFeatureState value: %lu", (uint8_t *)v1, 0x16u);
}

void AFDirectActionSourceFromSASRequestSource_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1D9588000, v0, OS_LOG_TYPE_ERROR, "%s Unsupported SASRequestSource value: %lu, returning back AFDirectActionSourceUnknown.", (uint8_t *)v1, 0x16u);
}

uint64_t sub_1D95D2718()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1D95D2728()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1D95D2738()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1D95D2748()
{
  return MEMORY[0x1F4187D98]();
}

uint64_t sub_1D95D2758()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1D95D2768()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1D95D2778()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t AFAccessibilitySupportsAttentionAwareFeatures()
{
  return MEMORY[0x1F410ABE8]();
}

uint64_t AFActivationEventGetDescription()
{
  return MEMORY[0x1F410ABF0]();
}

uint64_t AFAnalyticsEventCreateCurrent()
{
  return MEMORY[0x1F410AC00]();
}

uint64_t AFAssistantCapable()
{
  return MEMORY[0x1F410AC08]();
}

uint64_t AFCDAFaceDetection()
{
  return MEMORY[0x1F410AC40]();
}

uint64_t AFDeviceSupportsAOP()
{
  return MEMORY[0x1F410AC60]();
}

uint64_t AFDeviceSupportsEchoCancellation()
{
  return MEMORY[0x1F410AC78]();
}

uint64_t AFDeviceSupportsZLL()
{
  return MEMORY[0x1F410ACF8]();
}

uint64_t AFDirectActionCreateRequestInfo()
{
  return MEMORY[0x1F410AD08]();
}

uint64_t AFDirectActionEventGetName()
{
  return MEMORY[0x1F410AD10]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x1F410AD50]();
}

uint64_t AFMachAbsoluteTimeGetTimeInterval()
{
  return MEMORY[0x1F410ADA8]();
}

uint64_t AFMyriadEmitSelfMetrics()
{
  return MEMORY[0x1F410ADB8]();
}

uint64_t AFPreferencesAlwaysEyesFreeEnabled()
{
  return MEMORY[0x1F410ADF0]();
}

uint64_t AFPreferencesLanguageIsSupported()
{
  return MEMORY[0x1F410AE00]();
}

uint64_t AFPreferencesStreamingDictationEnabled()
{
  return MEMORY[0x1F410AE20]();
}

uint64_t AFPreferencesTypeToSiriEnabled()
{
  return MEMORY[0x1F410AE38]();
}

uint64_t AFRequestCancellationReasonGetName()
{
  return MEMORY[0x1F410AE48]();
}

uint64_t AFSiriDeactivationOptionsGetNames()
{
  return MEMORY[0x1F410AEA0]();
}

uint64_t AFSiriDeactivationReasonGetName()
{
  return MEMORY[0x1F410AEB0]();
}

uint64_t AFSpeechEventGetDescription()
{
  return MEMORY[0x1F410AEE8]();
}

uint64_t AFSupportsCallHangUp()
{
  return MEMORY[0x1F410AF28]();
}

uint64_t AFSupportsSiriInCall()
{
  return MEMORY[0x1F410AF38]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t BKSHIDServicesIsSmartCoverClosed()
{
  return MEMORY[0x1F410BFB0]();
}

uint64_t BTDeviceAddressFromString()
{
  return MEMORY[0x1F412F678]();
}

uint64_t BTDeviceGetAddressString()
{
  return MEMORY[0x1F412F6D0]();
}

uint64_t BTDeviceGetDeviceType()
{
  return MEMORY[0x1F412F700]();
}

uint64_t BTDeviceIsTemporaryPaired()
{
  return MEMORY[0x1F412F728]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

uint64_t CRIsPairedWithCertificateSerialNumber()
{
  return MEMORY[0x1F410FB78]();
}

uint64_t IAPBluetoothDeviceMode()
{
  return MEMORY[0x1F4122AE8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1F40E7180](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1F4145D90]();
}

uint64_t SCDAGoodnessComputeExponentialBoost()
{
  return MEMORY[0x1F4150648]();
}

uint64_t _AXSHomeButtonAssistant()
{
  return MEMORY[0x1F4178B60]();
}

uint64_t _AXSTripleClickCopyOptions()
{
  return MEMORY[0x1F4179080]();
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

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
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

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
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

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

int sysctlnametomib(const char *a1, int *a2, size_t *a3)
{
  return MEMORY[0x1F40CE3E0](a1, a2, a3);
}