void sub_1E45C0E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E45C2380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E45C28E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak(v14);
  objc_destroyWeak((id *)(v16 - 56));
  _Unwind_Resume(a1);
}

id SearchUIGeneralLog()
{
  v0 = &unk_1EB99C000;
  v1 = (void *)searchUILogHandles;
  if (!searchUILogHandles)
  {
    if (SearchUIInitLogging_once != -1)
    {
      dispatch_once(&SearchUIInitLogging_once, &__block_literal_global_3);
      v0 = (void *)&unk_1EB99C000;
    }
    v1 = (void *)v0[299];
  }
  return v1;
}

void sub_1E45C4CB8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

id SearchUIDataSourceLog()
{
  v0 = &unk_1EB99C000;
  uint64_t v1 = (void *)qword_1EB99C978;
  if (!qword_1EB99C978)
  {
    if (SearchUIInitLogging_once != -1)
    {
      dispatch_once(&SearchUIInitLogging_once, &__block_literal_global_3);
      v0 = (void *)&unk_1EB99C000;
    }
    uint64_t v1 = (void *)v0[303];
  }
  return v1;
}

void sub_1E45C9BE0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E45C9E4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_1E45CC8C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void __SearchUIInitLogging_block_invoke()
{
  for (uint64_t i = 0; i != 8; ++i)
  {
    os_log_t v1 = os_log_create("com.apple.searchui", SearchUILogSubsystem_block_invoke_categories[i]);
    v2 = (void *)searchUILogHandles[i];
    searchUILogHandles[i] = (uint64_t)v1;
  }
}

void sub_1E45CDCC8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1E45CDFB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E45CF5CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void SearchUIInitLogging()
{
  if (SearchUIInitLogging_once != -1) {
    dispatch_once(&SearchUIInitLogging_once, &__block_literal_global_3);
  }
}

id SearchUITapLog()
{
  v0 = &unk_1EB99C000;
  os_log_t v1 = (void *)qword_1EB99C960;
  if (!qword_1EB99C960)
  {
    if (SearchUIInitLogging_once != -1)
    {
      dispatch_once(&SearchUIInitLogging_once, &__block_literal_global_3);
      v0 = (void *)&unk_1EB99C000;
    }
    os_log_t v1 = (void *)v0[300];
  }
  return v1;
}

id SearchUIPeekLog()
{
  v0 = &unk_1EB99C000;
  os_log_t v1 = (void *)qword_1EB99C968;
  if (!qword_1EB99C968)
  {
    if (SearchUIInitLogging_once != -1)
    {
      dispatch_once(&SearchUIInitLogging_once, &__block_literal_global_3);
      v0 = (void *)&unk_1EB99C000;
    }
    os_log_t v1 = (void *)v0[301];
  }
  return v1;
}

id SearchUITelemetryLog()
{
  v0 = &unk_1EB99C000;
  os_log_t v1 = (void *)qword_1EB99C970;
  if (!qword_1EB99C970)
  {
    if (SearchUIInitLogging_once != -1)
    {
      dispatch_once(&SearchUIInitLogging_once, &__block_literal_global_3);
      v0 = (void *)&unk_1EB99C000;
    }
    os_log_t v1 = (void *)v0[302];
  }
  return v1;
}

id SearchUIAppTopHitSectionLoaderLog()
{
  v0 = &unk_1EB99C000;
  os_log_t v1 = (void *)qword_1EB99C980;
  if (!qword_1EB99C980)
  {
    if (SearchUIInitLogging_once != -1)
    {
      dispatch_once(&SearchUIInitLogging_once, &__block_literal_global_3);
      v0 = (void *)&unk_1EB99C000;
    }
    os_log_t v1 = (void *)v0[304];
  }
  return v1;
}

id SearchUIButtonItemLog()
{
  v0 = &unk_1EB99C000;
  os_log_t v1 = (void *)qword_1EB99C988;
  if (!qword_1EB99C988)
  {
    if (SearchUIInitLogging_once != -1)
    {
      dispatch_once(&SearchUIInitLogging_once, &__block_literal_global_3);
      v0 = (void *)&unk_1EB99C000;
    }
    os_log_t v1 = (void *)v0[305];
  }
  return v1;
}

id SearchUIBiomeLog()
{
  v0 = &unk_1EB99C000;
  os_log_t v1 = (void *)qword_1EB99C990;
  if (!qword_1EB99C990)
  {
    if (SearchUIInitLogging_once != -1)
    {
      dispatch_once(&SearchUIInitLogging_once, &__block_literal_global_3);
      v0 = (void *)&unk_1EB99C000;
    }
    os_log_t v1 = (void *)v0[306];
  }
  return v1;
}

void sub_1E45D1584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, id a20)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a20);
  _Block_object_dispose((const void *)(v22 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1E45D16A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E45D6690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
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

void sub_1E45D98DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E45DFE14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1E45E6A1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1E45E6B30(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E45E6C50(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E45E70E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E45E71EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E45E8058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E45E88B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

Class __getMTAlarmManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MobileTimerLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __MobileTimerLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E72CB0;
    uint64_t v6 = 0;
    MobileTimerLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!MobileTimerLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("MTAlarmManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getMTAlarmManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getMTAlarmManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MobileTimerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileTimerLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1E45F63C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E45F798C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location,id a24)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a24);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1E460103C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
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

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1E4604EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
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

void __getSAAudioAppPredictorClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SAAudioAppPredictor");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSAAudioAppPredictorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSAAudioAppPredictorClass_block_invoke_cold_1();
    SiriAudioSupportLibrary();
  }
}

void SiriAudioSupportLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!SiriAudioSupportLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __SiriAudioSupportLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6E73630;
    uint64_t v3 = 0;
    SiriAudioSupportLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!SiriAudioSupportLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __SiriAudioSupportLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SiriAudioSupportLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getSAAudioAppPredictorOptionsClass_block_invoke(uint64_t a1)
{
  SiriAudioSupportLibrary();
  Class result = objc_getClass("SAAudioAppPredictorOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSAAudioAppPredictorOptionsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)__getSAAudioAppPredictorOptionsClass_block_invoke_cold_1();
    return (Class)+[SearchUIShortcutsUtilities commandForSettingTogglesFromRowModel:v5];
  }
  return result;
}

void sub_1E460AB74(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_1E460AEA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E460AFD0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t forwardEvent(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v5), "key", (void)v9);
        if ([v6 keyCode] == 81 && objc_msgSend(v6, "modifierFlags") == 0x100000)
        {

          uint64_t v7 = 0;
          goto LABEL_12;
        }

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v7 = 1;
LABEL_12:

  return v7;
}

void sub_1E460FD34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4610014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_1E4610DCC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1E4611570(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1E461176C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

double sanitizeSFImage(void *a1)
{
  id v1 = a1;
  [v1 size];
  double v3 = v2;

  return v3;
}

void sub_1E461525C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
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

void sub_1E46153CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E4615BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4615D44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E461638C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_1E461D718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4624BE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E46255CC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1E4625720(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E46264B4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_1E4626AB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id SSFormattedCalculationExpression(void *a1)
{
  uint64_t v1 = (void *)[a1 mutableCopy];
  if (SSFormattedCalculationExpression_onceToken != -1) {
    dispatch_once(&SSFormattedCalculationExpression_onceToken, &__block_literal_global_31);
  }
  objc_msgSend((id)SSFormattedCalculationExpression_regex, "replaceMatchesInString:options:range:withTemplate:", v1, 0, 0, objc_msgSend(v1, "length"), &stru_1F40279D8);
  return v1;
}

uint64_t __SSFormattedCalculationExpression_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"[=＝]\\s*$" options:0 error:0];
  uint64_t v1 = SSFormattedCalculationExpression_regex;
  SSFormattedCalculationExpression_regex = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_1E462EB0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E462ED80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E462EEC4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __getFMUILocationDetailViewControllerViewOptionsClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("FMUILocationDetailViewControllerViewOptions");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getFMUILocationDetailViewControllerViewOptionsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 24);
  }
  else
  {
    __getFMUILocationDetailViewControllerViewOptionsClass_block_invoke_cold_1();
    FindMyUICoreLibrary();
  }
}

void FindMyUICoreLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!FindMyUICoreLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __FindMyUICoreLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6E73FF8;
    uint64_t v3 = 0;
    FindMyUICoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!FindMyUICoreLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __FindMyUICoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FindMyUICoreLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getFMUILocationDetailViewControllerClass_block_invoke(uint64_t a1)
{
  FindMyUICoreLibrary();
  Class result = objc_getClass("FMUILocationDetailViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getFMUILocationDetailViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)__getFMUILocationDetailViewControllerClass_block_invoke_cold_1();
    return (Class)+[SearchUIWebCompletion supportsResult:v5 cardSection:v6];
  }
  return result;
}

void appDatabaseChanged()
{
  +[SearchUIDefaultBrowserAppIconImage invalidateDefaultBrowserBundleIdentifier];
  id v0 = +[SearchUIImageCache sharedCache];
  [v0 appIconImageDidChange:0];
}

void sub_1E46348A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4635C00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1E4636AB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1E463BB4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E463C36C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E465425C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1E4654344(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E4654C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getOBPrivacySplashControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!OnBoardingKitLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __OnBoardingKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E6E747A0;
    uint64_t v5 = 0;
    OnBoardingKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!OnBoardingKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getOBPrivacySplashControllerClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("OBPrivacySplashController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getOBPrivacySplashControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __OnBoardingKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  OnBoardingKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1E4659F4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1E465F514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
}

id sub_1E466208C()
{
  id result = objc_msgSend(v0, sel_dataSource);
  if (result)
  {
    uint64_t v2 = result;
    id v3 = objc_msgSend(result, sel_snapshot);

    id v4 = objc_msgSend(v3, sel_itemIdentifiers);
    uint64_t v5 = sub_1E46A6110();

    uint64_t v6 = MEMORY[0x1E4FBC860];
    uint64_t v13 = MEMORY[0x1E4FBC860];
    uint64_t v7 = *(void *)(v5 + 16);
    if (v7)
    {
      uint64_t v8 = v5 + 32;
      swift_bridgeObjectRetain();
      do
      {
        sub_1E4663474(v8, (uint64_t)v12);
        sub_1E4663474((uint64_t)v12, (uint64_t)&v10);
        sub_1E46634D0();
        if ((swift_dynamicCast() & 1) == 0) {
          uint64_t v11 = 0;
        }
        uint64_t v9 = __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
        if (v11)
        {
          MEMORY[0x1E4E83710](v9);
          if (*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_1E46A6130();
          }
          sub_1E46A6140();
          sub_1E46A6120();
        }
        v8 += 32;
        --v7;
      }
      while (v7);
      swift_bridgeObjectRelease();
      uint64_t v6 = v13;
    }
    swift_bridgeObjectRelease();

    return (id)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1E466222C()
{
  id v1 = objc_msgSend(v0, sel_searchUICommandEnvironment);
  return v1;
}

void *sub_1E4662264(uint64_t a1, uint64_t a2)
{
  id v4 = sub_1E466208C();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1E466326C((unint64_t)v4, a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t static SearchUIAppIntentRunner.dependencyKey()()
{
  return sub_1E46A6060();
}

uint64_t sub_1E466230C()
{
  return sub_1E46A4D40();
}

uint64_t sub_1E4662428(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1E4662434(*a1, *a2);
}

uint64_t sub_1E4662434(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xD000000000000012;
  unint64_t v3 = 0x80000001E46BBCE0;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0x616C696176616E75;
    }
    else {
      unint64_t v5 = 0xD000000000000016;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xEB00000000656C62;
    }
    else {
      unint64_t v6 = 0x80000001E46BBD00;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  unint64_t v5 = 0xD000000000000012;
  unint64_t v6 = 0x80000001E46BBCE0;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      unint64_t v2 = 0x616C696176616E75;
    }
    else {
      unint64_t v2 = 0xD000000000000016;
    }
    if (v7 == 1) {
      unint64_t v3 = 0xEB00000000656C62;
    }
    else {
      unint64_t v3 = 0x80000001E46BBD00;
    }
  }
LABEL_15:
  if (v5 == v2 && v6 == v3) {
    char v8 = 1;
  }
  else {
    char v8 = sub_1E46A64D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1E466254C()
{
  return sub_1E4662554();
}

uint64_t sub_1E4662554()
{
  return sub_1E46A6580();
}

uint64_t sub_1E4662608()
{
  sub_1E46A6070();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E46626A4()
{
  return sub_1E46626AC();
}

uint64_t sub_1E46626AC()
{
  return sub_1E46A6580();
}

uint64_t sub_1E466275C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1E4663400();
  *a1 = result;
  return result;
}

void sub_1E466278C(unint64_t *a1@<X8>)
{
  unint64_t v2 = 0xD000000000000012;
  unint64_t v3 = 0xEB00000000656C62;
  unint64_t v4 = 0x616C696176616E75;
  if (*v1 != 1)
  {
    unint64_t v4 = 0xD000000000000016;
    unint64_t v3 = 0x80000001E46BBD00;
  }
  if (*v1)
  {
    unint64_t v2 = v4;
    unint64_t v5 = v3;
  }
  else
  {
    unint64_t v5 = 0x80000001E46BBCE0;
  }
  *a1 = v2;
  a1[1] = v5;
}

uint64_t sub_1E4662808()
{
  return sub_1E466230C();
}

uint64_t sub_1E4662810(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  sub_1E46A6190();
  void v4[6] = sub_1E46A6180();
  uint64_t v6 = sub_1E46A6160();
  return MEMORY[0x1F4188298](sub_1E46628AC, v6, v5);
}

id sub_1E46628AC()
{
  swift_release();
  if (objc_msgSend(self, sel_isAppIntentsSupportEnabled))
  {
    uint64_t v1 = v0[5] + OBJC_IVAR____TtC8SearchUI23SearchUIAppIntentRunner_delegate;
    if (MEMORY[0x1E4E84B80](v1))
    {
      uint64_t v2 = *(void *)(v1 + 8);
      uint64_t ObjectType = swift_getObjectType();
      unint64_t v4 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(ObjectType, v2);
      swift_unknownObjectRelease();
      if (v4)
      {
        if (v0[4]
          && MEMORY[0x1E4E84B80](v1)
          && (uint64_t v6 = v0[3],
              uint64_t v5 = v0[4],
              uint64_t v7 = *(void *)(v1 + 8),
              uint64_t v8 = swift_getObjectType(),
              uint64_t v9 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v5, v8, v7),
              swift_unknownObjectRelease(),
              v9))
        {
          id result = objc_msgSend(self, sel_handlerForCommand_rowModel_button_sectionModel_environment_, v0[2], v9, 0, 0, v4);
          if (result)
          {
            uint64_t v11 = result;
            objc_msgSend(result, sel_executeWithTriggerEvent_, 13);

LABEL_17:
            uint64_t v13 = (uint64_t (*)(void))v0[1];
            goto LABEL_12;
          }
        }
        else
        {
          id result = objc_msgSend(self, sel_handlerForCommand_environment_, v0[2], v4);
          if (result)
          {
            uint64_t v11 = result;
            objc_msgSend(result, sel_executeWithTriggerEvent_, 13);
            goto LABEL_17;
          }
          __break(1u);
        }
        __break(1u);
        return result;
      }
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  sub_1E4662AD8();
  swift_allocError();
  *long long v12 = (_BYTE)v4;
  swift_willThrow();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
LABEL_12:
  return (id)v13();
}

unint64_t sub_1E4662AD8()
{
  unint64_t result = qword_1EAE556A0;
  if (!qword_1EAE556A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE556A0);
  }
  return result;
}

id SearchUIAppIntentRunner.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SearchUIAppIntentRunner.init()()
{
}

id SearchUIAppIntentRunner.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUIAppIntentRunner();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SearchUIAppIntentRunner()
{
  return self;
}

uint64_t method lookup function for SearchUIAppIntentRunner(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SearchUIAppIntentRunner);
}

uint64_t dispatch thunk of SearchUIAppIntentRunner.perform(command:for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(int **)((*MEMORY[0x1E4FBC8C8] & *v3) + 0x90);
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v8 + *v8);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_1E4662D6C;
  return v11(a1, a2, a3);
}

uint64_t sub_1E4662D6C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void type metadata accessor for TLKProminence(uint64_t a1)
{
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SearchUIAppIntentRunner.RunnerError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SearchUIAppIntentRunner.RunnerError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x1E4662FE0);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_1E4663008(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1E4663014(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SearchUIAppIntentRunner.RunnerError()
{
  return &type metadata for SearchUIAppIntentRunner.RunnerError;
}

unint64_t sub_1E4663030()
{
  unint64_t result = qword_1EAE55788;
  if (!qword_1EAE55788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE55788);
  }
  return result;
}

void sub_1E4663084(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1E4663090()
{
  return off_1F40E6478(*v0);
}

uint64_t sub_1E4663098(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  char v7 = 1;
  uint64_t result = MEMORY[0x1E4E83800](a1, &v6);
  uint64_t v4 = v6;
  char v5 = v7;
  if (v7) {
    uint64_t v4 = 0;
  }
  *(void *)a2 = v4;
  *(unsigned char *)(a2 + _Block_object_dispose(&a9, 8) = v5;
  return result;
}

uint64_t sub_1E46630EC(uint64_t a1, uint64_t a2)
{
  char v3 = sub_1E46A61F0();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + _Block_object_dispose(&a9, 8) = 1;
  return v3 & 1;
}

uint64_t sub_1E4663144@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1E46A6200();
  *a1 = result;
  return result;
}

void *sub_1E466316C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + _Block_object_dispose(&a9, 8) = 0;
  return result;
}

uint64_t sub_1E466317C()
{
  return sub_1E46A6480();
}

uint64_t sub_1E466321C()
{
  return MEMORY[0x1F4184270](*v0);
}

uint64_t sub_1E4663224()
{
  return sub_1E46A6570();
}

uint64_t sub_1E4663250(uint64_t a1)
{
  return MEMORY[0x1F4185EA8](a1, *v1);
}

BOOL sub_1E4663258(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_1E466326C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_20;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_1E46A6440())
  {
    uint64_t v6 = 4;
    while (1)
    {
      id v7 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1E4E83990](v6 - 4, a1) : *(id *)(a1 + 8 * v6);
      int v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      id v10 = objc_msgSend(v7, sel_itemIdentifier);
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = sub_1E46A6050();
        uint64_t v14 = v13;

        if (v12 == a2 && v14 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v8;
        }
        char v16 = sub_1E46A64D0();
        swift_bridgeObjectRelease();
        if (v16) {
          goto LABEL_18;
        }
      }

      ++v6;
      if (v9 == v5) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_21:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1E4663400()
{
  unint64_t v0 = sub_1E46A6490();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_1E466344C(uint64_t a1)
{
  return a1;
}

uint64_t sub_1E4663474(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1E46634D0()
{
  unint64_t result = qword_1EAE55790;
  if (!qword_1EAE55790)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAE55790);
  }
  return result;
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

void type metadata accessor for UIBackgroundTaskIdentifier(uint64_t a1)
{
}

uint64_t sub_1E4663574()
{
  return sub_1E46635DC(&qword_1EAE55800);
}

uint64_t sub_1E46635A8()
{
  return sub_1E46635DC(&qword_1EAE55808);
}

uint64_t sub_1E46635DC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for UIBackgroundTaskIdentifier(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1E4663620()
{
  return sub_1E46635DC(&qword_1EAE55810);
}

uint64_t initializeBufferWithCopyOfBuffer for CustomizedHighlightSettings(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  sub_1E46A4AB0();
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

uint64_t sub_1E4663694(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1E46636B4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + _Block_object_dispose(&a9, 8) = 0;
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

void type metadata accessor for NSDirectionalEdgeInsets(uint64_t a1)
{
}

void sub_1E46636F4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1E4663740(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1E4663A84(a1, a2, a3, a4, (uint64_t)&unk_1F4026220, (uint64_t)sub_1E46637AC, MEMORY[0x1E4FA59D0]);
}

uint64_t sub_1E4663774()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1E46637AC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1E4663990()
{
  sub_1E46A5EC0();
  uint64_t v0 = (void *)sub_1E46A5EB0();
  char v1 = sub_1E46A5E90();

  return v1 & 1;
}

uint64_t sub_1E4663A50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1E4663A84(a1, a2, a3, a4, (uint64_t)&unk_1F4026248, (uint64_t)sub_1E4664440, MEMORY[0x1E4FA59D8]);
}

uint64_t sub_1E4663A84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, char *, uint64_t, uint64_t))
{
  v20 = a7;
  uint64_t v12 = sub_1E46A5E50();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790]();
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E46A5EC0();
  char v16 = (void *)sub_1E46A5EB0();
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x1E4FA5950], v12);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(void *)(v17 + 24) = a4;
  sub_1E46A4AB0();
  v20(a1, a2, v15, a6, v17);

  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

void sub_1E4663DB8(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_1E46A4D10();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_1E4663E1C(uint64_t a1, uint64_t a2)
{
  sub_1E46A5EC0();
  id v4 = (void *)sub_1E46A5EB0();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  sub_1E46A4AB0();
  sub_1E46A5EA0();

  return swift_release();
}

uint64_t sub_1E4663F90()
{
  return sub_1E46A6040();
}

id SearchUISportsKitUtilities.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id SearchUISportsKitUtilities.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUISportsKitUtilities();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SearchUISportsKitUtilities.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUISportsKitUtilities();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1E46640CC()
{
  id v0 = objc_msgSend(self, sel_defaultCenter);
  id v1 = (id)sub_1E46A6040();
  objc_msgSend(v0, sel_postNotificationName_object_, v1, 0);
}

uint64_t type metadata accessor for SearchUISportsKitUtilities()
{
  return self;
}

uint64_t method lookup function for SearchUISportsKitUtilities(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SearchUISportsKitUtilities);
}

uint64_t dispatch thunk of static SearchUISportsKitUtilities.createSession(canonicalId:completionBlock:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static SearchUISportsKitUtilities.checkForSession(canonicalId:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static SearchUISportsKitUtilities.destroySession(canonicalId:completionBlock:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of static SearchUISportsKitUtilities.liveActivitiesEnabled(completionBlock:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of static SearchUISportsKitUtilities.registerForLiveActivityChanges()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of static SearchUISportsKitUtilities.sportsFollowStatusDidChangeNotificaitonName()()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t sub_1E46642C8()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E4664300(char a1)
{
  return sub_1E469F6E4(a1, *(void *)(v1 + 16));
}

uint64_t sub_1E4664308(unsigned __int8 a1, char a2)
{
  return (*(uint64_t (**)(void))(v2 + 16))(((a2 & 1) == 0) & a1);
}

void sub_1E466433C(uint64_t a1)
{
  sub_1E4663DB8(a1, *(void *)(v1 + 16));
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

unint64_t sub_1E466439C()
{
  unint64_t result = qword_1EAE558F8;
  if (!qword_1EAE558F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE558F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE558F8);
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

uint64_t sub_1E4664464()
{
  return 1;
}

uint64_t sub_1E466446C()
{
  return sub_1E46A6580();
}

uint64_t sub_1E46644B0()
{
  return sub_1E46A6570();
}

uint64_t sub_1E46644D8()
{
  return sub_1E46A6580();
}

id sub_1E4664518(void *a1, void *a2, int a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v118 = a5;
  int v119 = a3;
  uint64_t v113 = sub_1E46A6390();
  uint64_t v112 = *(void *)(v113 - 8);
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  v108 = (char *)&v98 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  v109 = (char *)&v98 - v14;
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  v110 = (char *)&v98 - v16;
  MEMORY[0x1F4188790](v15);
  v111 = (char *)&v98 - v17;
  uint64_t v115 = sub_1E46A63A0();
  uint64_t v114 = *(void *)(v115 - 8);
  MEMORY[0x1F4188790](v115);
  uint64_t v19 = (char *)&v98 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1E46A50E0();
  uint64_t v116 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  uint64_t v22 = (char *)&v98 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE535E0);
  MEMORY[0x1F4188790](v23 - 8);
  v25 = (char *)&v98 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v120 = v6;
  uint64_t v26 = (uint64_t)v6 + OBJC_IVAR___SearchUIArchivedRowModel_swiftUIView;
  *(_OWORD *)uint64_t v26 = 0u;
  *(_OWORD *)(v26 + 16) = 0u;
  *(void *)(v26 + 32) = 0;
  if (!a2)
  {
LABEL_46:
    id v31 = 0;
    if (!a6) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
  uint64_t v117 = a4;
  self;
  uint64_t v27 = swift_dynamicCastObjCClass();
  if (!v27)
  {
    id v31 = 0;
    a4 = v117;
    if (!a6) {
      goto LABEL_48;
    }
LABEL_47:
    a6 = (void *)sub_1E46A6040();
    swift_bridgeObjectRelease();
    goto LABEL_48;
  }
  v28 = (void *)v27;
  v105 = a1;
  id v104 = v120;
  v107 = a2;
  id v29 = objc_msgSend(v28, sel_searchString);
  if (v29)
  {
    v30 = v29;
    uint64_t v101 = sub_1E46A6050();
  }
  else
  {
    uint64_t v101 = 0;
  }
  id v32 = objc_msgSend(v28, sel_archive);
  v106 = a6;
  if (v32)
  {
    v33 = v32;
    uint64_t v103 = sub_1E46A4DB0();
    unint64_t v99 = v34;

    id v102 = objc_msgSend(v28, sel_attributeSet);
    if (v102)
    {
      v100 = a2;
      unsigned int v35 = objc_msgSend(v28, sel_isTopHit);
      uint64_t v36 = sub_1E46A50D0();
      uint64_t v37 = *(void *)(v36 - 8);
      v38 = (unsigned int *)MEMORY[0x1E4F46F08];
      if (!v35) {
        v38 = (unsigned int *)MEMORY[0x1E4F46F10];
      }
      (*(void (**)(char *, void, uint64_t))(*(void *)(v36 - 8) + 104))(v25, *v38, v36);
      sub_1E46A50D0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v25, 0, 1, v36);
      unint64_t v39 = v99;
      sub_1E46A4C00();
      sub_1E4666020((uint64_t)v25, &qword_1EAE535E0);
      swift_bridgeObjectRelease();
      swift_beginAccess();
      sub_1E466607C((uint64_t)v122, v26);
      swift_endAccess();

      id v31 = objc_msgSend(v28, sel_isTopHit);
      sub_1E4665FC8(v103, v39);

      a2 = v100;
      a1 = v105;
      a4 = v117;
      goto LABEL_57;
    }
    swift_bridgeObjectRelease();

    sub_1E4665FC8(v103, v99);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_1E4665868();
  v40 = (void *)swift_allocError();
  swift_willThrow();
  uint64_t v41 = v116;
  a4 = v117;
  v42 = v107;
  v122[0] = v40;
  id v43 = v40;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55910);
  if (swift_dynamicCast())
  {
    if ((*(unsigned int (**)(char *, uint64_t))(v41 + 88))(v22, v20) == *MEMORY[0x1E4F46F18])
    {
      v44 = v42;

      if (qword_1EAE55658 != -1) {
        swift_once();
      }
      uint64_t v45 = sub_1E46A5180();
      __swift_project_value_buffer(v45, (uint64_t)qword_1EAE57FF8);
      v46 = sub_1E46A5160();
      os_log_type_t v47 = sub_1E46A6260();
      BOOL v48 = os_log_type_enabled(v46, v47);
      a1 = v105;
      if (v48)
      {
        v49 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v49 = 0;
        v50 = "Failed to find type of view, is the framework imported in Spotlight, and is the type public?";
LABEL_42:
        _os_log_impl(&dword_1E45B5000, v46, v47, v50, v49, 2u);
        MEMORY[0x1E4E84AA0](v49, -1, -1);
        v82 = v44;
LABEL_44:
        a6 = v106;

        goto LABEL_45;
      }
      goto LABEL_43;
    }
    (*(void (**)(char *, uint64_t))(v41 + 8))(v22, v20);
  }

  v122[0] = v40;
  id v51 = v40;
  uint64_t v52 = v115;
  if (swift_dynamicCast())
  {
    uint64_t v53 = v114;
    int v54 = (*(uint64_t (**)(char *, uint64_t))(v114 + 88))(v19, v52);
    if (v54 == *MEMORY[0x1E4FBBA70])
    {
      v100 = a2;

      (*(void (**)(char *, uint64_t))(v53 + 96))(v19, v52);
      v55 = &v19[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55918) + 48)];
      uint64_t v56 = v112;
      v57 = v111;
      uint64_t v58 = v113;
      (*(void (**)(char *, char *, uint64_t))(v112 + 32))(v111, v55, v113);
      if (qword_1EAE55658 != -1) {
        swift_once();
      }
      uint64_t v59 = sub_1E46A5180();
      __swift_project_value_buffer(v59, (uint64_t)qword_1EAE57FF8);
      v60 = v110;
      (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v110, v57, v58);
      v61 = sub_1E46A5160();
      os_log_type_t v62 = sub_1E46A6260();
      if (os_log_type_enabled(v61, v62))
      {
        v63 = (uint8_t *)swift_slowAlloc();
        uint64_t v64 = swift_slowAlloc();
        v121[0] = v64;
        *(_DWORD *)v63 = 136315138;
        uint64_t v65 = sub_1E46A6380();
        uint64_t v123 = sub_1E46658F4(v65, v66, v121);
        sub_1E46A62C0();
        swift_bridgeObjectRelease();
        v67 = *(void (**)(char *, uint64_t))(v56 + 8);
        v67(v60, v58);
        _os_log_impl(&dword_1E45B5000, v61, v62, "Type mismatch with error %s", v63, 0xCu);
        swift_arrayDestroy();
        uint64_t v68 = v64;
        a4 = v117;
        MEMORY[0x1E4E84AA0](v68, -1, -1);
        MEMORY[0x1E4E84AA0](v63, -1, -1);

        v69 = &v126;
LABEL_33:
        v67((char *)*(v69 - 32), v58);
LABEL_35:
        a2 = v100;
        a1 = v105;
        a6 = v106;
LABEL_45:

        goto LABEL_46;
      }
      goto LABEL_34;
    }
    if (v54 == *MEMORY[0x1E4FBBA80])
    {
      v100 = a2;

      (*(void (**)(char *, uint64_t))(v53 + 96))(v19, v52);
      v70 = &v19[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55918) + 48)];
      uint64_t v56 = v112;
      v57 = v109;
      uint64_t v58 = v113;
      (*(void (**)(char *, char *, uint64_t))(v112 + 32))(v109, v70, v113);
      if (qword_1EAE55658 != -1) {
        swift_once();
      }
      uint64_t v71 = sub_1E46A5180();
      __swift_project_value_buffer(v71, (uint64_t)qword_1EAE57FF8);
      v60 = v108;
      (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v108, v57, v58);
      v61 = sub_1E46A5160();
      os_log_type_t v72 = sub_1E46A6260();
      if (os_log_type_enabled(v61, v72))
      {
        v73 = (uint8_t *)swift_slowAlloc();
        uint64_t v74 = swift_slowAlloc();
        v121[0] = v74;
        *(_DWORD *)v73 = 136315138;
        uint64_t v75 = sub_1E46A6380();
        uint64_t v123 = sub_1E46658F4(v75, v76, v121);
        sub_1E46A62C0();
        swift_bridgeObjectRelease();
        v67 = *(void (**)(char *, uint64_t))(v56 + 8);
        v67(v60, v58);
        _os_log_impl(&dword_1E45B5000, v61, v72, "required value not found with error %s", v73, 0xCu);
        swift_arrayDestroy();
        uint64_t v77 = v74;
        a4 = v117;
        MEMORY[0x1E4E84AA0](v77, -1, -1);
        MEMORY[0x1E4E84AA0](v73, -1, -1);

        v69 = &v125;
        goto LABEL_33;
      }
LABEL_34:

      v78 = *(void (**)(char *, uint64_t))(v56 + 8);
      v78(v60, v58);

      v78(v57, v58);
      goto LABEL_35;
    }
    (*(void (**)(char *, uint64_t))(v53 + 8))(v19, v52);
  }

  v122[0] = v40;
  id v79 = v40;
  if (swift_dynamicCast())
  {
    v44 = v42;

    if (qword_1EAE55658 != -1) {
      swift_once();
    }
    uint64_t v80 = sub_1E46A5180();
    __swift_project_value_buffer(v80, (uint64_t)qword_1EAE57FF8);
    v46 = sub_1E46A5160();
    os_log_type_t v47 = sub_1E46A6270();
    BOOL v81 = os_log_type_enabled(v46, v47);
    a1 = v105;
    if (v81)
    {
      v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v49 = 0;
      v50 = "Backend failed to fill values";
      goto LABEL_42;
    }
LABEL_43:
    v82 = v46;
    v46 = v44;
    goto LABEL_44;
  }
  v87 = a2;

  if (qword_1EAE55658 != -1) {
    swift_once();
  }
  uint64_t v88 = sub_1E46A5180();
  __swift_project_value_buffer(v88, (uint64_t)qword_1EAE57FF8);
  id v89 = v40;
  id v90 = v40;
  v91 = sub_1E46A5160();
  os_log_type_t v92 = sub_1E46A6260();
  if (os_log_type_enabled(v91, v92))
  {
    v93 = (uint8_t *)swift_slowAlloc();
    v94 = (void *)swift_slowAlloc();
    v122[0] = v94;
    *(_DWORD *)v93 = 136315138;
    swift_getErrorValue();
    uint64_t v95 = sub_1E46A64F0();
    v121[0] = sub_1E46658F4(v95, v96, (uint64_t *)v122);
    sub_1E46A62C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1E45B5000, v91, v92, "unknown error %s", v93, 0xCu);
    swift_arrayDestroy();
    v97 = v94;
    a4 = v117;
    MEMORY[0x1E4E84AA0](v97, -1, -1);
    MEMORY[0x1E4E84AA0](v93, -1, -1);
  }
  else
  {
  }
  id v31 = 0;
  a2 = v87;
  a1 = v105;
LABEL_57:
  a6 = v106;
  if (v106) {
    goto LABEL_47;
  }
LABEL_48:
  v83 = (objc_class *)type metadata accessor for SearchUIArchivedRowModel();
  v124.receiver = v120;
  v124.super_class = v83;
  id v84 = objc_msgSendSuper2(&v124, sel_initWithResult_cardSection_isInline_queryId_itemIdentifier_, a1, a2, v119 & 1, a4, a6);

  if (v84)
  {

    id v85 = v84;
    objc_msgSend(v85, sel_setIsTopHit_, v31);
  }
  return v84;
}

id sub_1E466577C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUIArchivedRowModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SearchUIArchivedRowModel()
{
  return self;
}

uint64_t sub_1E4665800(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE536B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1E4665868()
{
  unint64_t result = qword_1EAE55908;
  if (!qword_1EAE55908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE55908);
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

uint64_t sub_1E46658F4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1E46659C8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1E4663474((uint64_t)v12, *a3);
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
      sub_1E4663474((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1E46659C8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1E46A62D0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1E4665B84(a5, a6);
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
  uint64_t v8 = sub_1E46A63B0();
  if (!v8)
  {
    sub_1E46A6420();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1E46A6470();
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

uint64_t sub_1E4665B84(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1E4665C1C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1E4665E78(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1E4665E78(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1E4665C1C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1E4665D94(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1E46A6360();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1E46A6420();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1E46A60B0();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1E46A6470();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1E46A6420();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1E4665D94(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55920);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1E4665DFC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_1E46A60D0();
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
    uint64_t v5 = MEMORY[0x1E4E836E0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_1E4665E78(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55920);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_1E46A6470();
  __break(1u);
  return result;
}

uint64_t sub_1E4665FC8(uint64_t a1, unint64_t a2)
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

uint64_t sub_1E4666020(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1E466607C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE536B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t getEnumTagSinglePayload for BackendError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for BackendError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1E46661D8);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1E4666200()
{
  return 0;
}

ValueMetadata *type metadata accessor for BackendError()
{
  return &type metadata for BackendError;
}

unint64_t sub_1E466621C()
{
  unint64_t result = qword_1EAE55928;
  if (!qword_1EAE55928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE55928);
  }
  return result;
}

unint64_t sub_1E4666274()
{
  unint64_t result = qword_1EAE55930;
  if (!qword_1EAE55930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE55930);
  }
  return result;
}

unint64_t sub_1E46662CC()
{
  unint64_t result = qword_1EAE55938;
  if (!qword_1EAE55938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE55938);
  }
  return result;
}

uint64_t sub_1E4666320()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1E466633C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1E4666358()
{
  uint64_t v0 = sub_1E46A4D30();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  int v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1E46A4E40();
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v5 = sub_1E46A6030();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v6 = sub_1E46A4D50();
  __swift_allocate_value_buffer(v6, qword_1EAE57FB8);
  __swift_project_value_buffer(v6, (uint64_t)qword_1EAE57FB8);
  sub_1E46A5FD0();
  sub_1E46A4E30();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4F275D0], v0);
  return sub_1E46A4D60();
}

uint64_t sub_1E4666548@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55970);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = &v15[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_1E46A4D30();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = &v15[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_1E46A4E40();
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v10 = sub_1E46A6030();
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v11 = sub_1E46A4D50();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  sub_1E46A5FD0();
  sub_1E46A4E30();
  (*(void (**)(unsigned char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E4F275D0], v5);
  sub_1E46A4D60();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v4, 1, 1, v11);
  sub_1E46A4BF0();
  uint64_t v13 = sub_1E46A4BE0();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(a1, 0, 1, v13);
}

uint64_t sub_1E4666850()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55998);
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE559A0);
  MEMORY[0x1F4188790](v1);
  sub_1E46677C0();
  sub_1E46A4CA0();
  sub_1E46A4C90();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE559A8);
  sub_1E46A4C80();
  swift_release();
  sub_1E46A4C90();
  sub_1E46A4CB0();
  return sub_1E46A4C70();
}

uint64_t sub_1E46669F0()
{
  return sub_1E46A4A70();
}

double sub_1E4666A14@<D0>(uint64_t a1@<X8>)
{
  sub_1E46A4A50();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 24) = v5;
  *(void *)(a1 + 40) = v6;
  return result;
}

uint64_t sub_1E4666A68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[10] = a2;
  v3[11] = a3;
  v3[9] = a1;
  return MEMORY[0x1F4188298](sub_1E4666A8C, 0, 0);
}

uint64_t sub_1E4666A8C()
{
  sub_1E46A4940();
  *(void *)(v0 + 96) = *(void *)(v0 + 64);
  sub_1E46A4A50();
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 104) = v1;
  *(_OWORD *)(v0 + 112) = *(_OWORD *)(v0 + 40);
  *(void *)(v0 + 12_Block_object_dispose(&a9, 8) = *(void *)(v0 + 56);
  long long v5 = (char *)&dword_1EAE55D80 + dword_1EAE55D80;
  long long v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v3;
  *long long v3 = v0;
  v3[1] = sub_1E4666B84;
  return ((uint64_t (*)(uint64_t, uint64_t, void))v5)(v2, v1, 0);
}

uint64_t sub_1E4666B84()
{
  uint64_t v2 = *(void **)(*v1 + 96);
  uint64_t v3 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if (v0)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x1F4188298](sub_1E4666D54, 0, 0);
  }
}

uint64_t sub_1E4666D54()
{
  sub_1E46A4A10();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E4666DB8@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EAE55640 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1E46A4D50();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EAE57FB8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_1E4666E74(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + _Block_object_dispose(&a9, 8) = sub_1E4662D6C;
  *(_OWORD *)(v4 + 80) = *v1;
  *(void *)(v4 + 72) = a1;
  return MEMORY[0x1F4188298](sub_1E4666A8C, 0, 0);
}

uint64_t sub_1E4666F28@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1E4667200();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1E4666F50(uint64_t a1)
{
  unint64_t v2 = sub_1E46677C0();
  return sel_trailingAttribution(a1, v2);
}

uint64_t destroy for SearchUIContinuationIntent()
{
  swift_release();
  return swift_release();
}

void *_s8SearchUI26SearchUIContinuationIntentVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  sub_1E46A4AB0();
  sub_1E46A4AB0();
  return a1;
}

void *assignWithCopy for SearchUIContinuationIntent(void *a1, void *a2)
{
  *a1 = *a2;
  sub_1E46A4AB0();
  swift_release();
  a1[1] = a2[1];
  sub_1E46A4AB0();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for SearchUIContinuationIntent(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchUIContinuationIntent(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SearchUIContinuationIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + _Block_object_dispose(&a9, 8) = 0;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SearchUIContinuationIntent()
{
  return &type metadata for SearchUIContinuationIntent;
}

uint64_t sub_1E4667144()
{
  return sub_1E46671BC(&qword_1EAE55948, &qword_1EAE55950);
}

uint64_t sub_1E4667180()
{
  return sub_1E46671BC(&qword_1EAE55958, &qword_1EAE55960);
}

uint64_t sub_1E46671BC(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_1E4667200()
{
  uint64_t v0 = sub_1E46A4CC0(0);
  uint64_t v29 = *(void *)(v0 - 8);
  uint64_t v30 = v0;
  MEMORY[0x1F4188790](v0);
  v28 = (char *)v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55968);
  uint64_t v3 = MEMORY[0x1F4188790](v2 - 8);
  uint64_t v27 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v26 = (char *)v24 - v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55970);
  MEMORY[0x1F4188790](v6 - 8);
  v25 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1E46A4D30();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1E46A4E40();
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v13 = sub_1E46A6030();
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v14 = sub_1E46A4D50();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  v24[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55978);
  sub_1E46A5FD0();
  sub_1E46A4E30();
  uint64_t v16 = *MEMORY[0x1E4F275D0];
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 104);
  v17(v11, v16, v8);
  sub_1E46A4D60();
  sub_1E46A5FD0();
  sub_1E46A4E30();
  v17(v11, v16, v8);
  uint64_t v18 = v25;
  sub_1E46A4D60();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v18, 0, 1, v14);
  uint64_t v19 = sub_1E46A4A00();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56);
  v20(v26, 1, 1, v19);
  v20(v27, 1, 1, v19);
  (*(void (**)(char *, void, uint64_t))(v29 + 104))(v28, *MEMORY[0x1E4F186F0], v30);
  sub_1E466776C();
  uint64_t v21 = sub_1E46A4A80();
  sub_1E46A4980();
  sub_1E46A4970();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55980);
  *(void *)&long long v33 = type metadata accessor for SearchUIAppIntentRunner();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99B9C8);
  uint64_t v31 = sub_1E46A6060();
  uint64_t v32 = v22;
  sub_1E46A62F0();
  sub_1E46A4950();
  return v21;
}

unint64_t sub_1E466776C()
{
  unint64_t result = qword_1EB99BA58;
  if (!qword_1EB99BA58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB99BA58);
  }
  return result;
}

unint64_t sub_1E46677C0()
{
  unint64_t result = qword_1EAE55988;
  if (!qword_1EAE55988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1EAE55988);
  }
  return result;
}

uint64_t sub_1E4667814@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1E46A4A70();
  *a1 = result;
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

id sub_1E46679F4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUISupplementaryIdentifiers();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

SearchUISupplementaryProvider __swiftcall SearchUISupplementaryProvider.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (SearchUISupplementaryProvider)objc_msgSend(v0, sel_init);
}

id SearchUISupplementaryProvider.init()()
{
  v1.super_class = (Class)SearchUISupplementaryProvider;
  return objc_msgSendSuper2(&v1, sel_init);
}

uint64_t type metadata accessor for SearchUISupplementaryIdentifiers()
{
  return self;
}

unint64_t type metadata accessor for SearchUISupplementaryProvider()
{
  unint64_t result = qword_1EAE559B0;
  if (!qword_1EAE559B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAE559B0);
  }
  return result;
}

uint64_t sub_1E4667DD8()
{
  unint64_t v0 = sub_1E46A6490();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

void sub_1E4667E24(void *a1)
{
  uint64_t v2 = 0;
  do
  {
    int v7 = byte_1F4026068[v2 + 32];
    if (byte_1F4026068[v2 + 32])
    {
      sub_1E466846C();
    }
    else
    {
      type metadata accessor for Header();
      sub_1E46684C0();
    }
    sub_1E46847BC();
    uint64_t v8 = (void *)sub_1E46A6040();
    swift_bridgeObjectRelease();
    if (v7)
    {
      sub_1E466846C();
      uint64_t v3 = &type metadata for Separator;
      uint64_t v4 = &off_1F4027208;
    }
    else
    {
      uint64_t v3 = (ValueMetadata *)type metadata accessor for Header();
      sub_1E46684C0();
      uint64_t v4 = &off_1F4026AD0;
    }
    ++v2;
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    ((void (*)(uint64_t, uint64_t))v4[1])((uint64_t)v3, (uint64_t)v4);
    uint64_t v6 = (void *)sub_1E46A6040();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_registerClass_forSupplementaryViewOfKind_withReuseIdentifier_, ObjCClassFromMetadata, v8, v6);
  }
  while (v2 != 4);
}

id sub_1E466800C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  swift_bridgeObjectRetain();
  unsigned int v8 = sub_1E4667DD8();
  if (v8 - 1 >= 3)
  {
    if ((_BYTE)v8) {
      return 0;
    }
    uint64_t v19 = a4;
    uint64_t v10 = (ValueMetadata *)type metadata accessor for Header();
    uint64_t v9 = &off_1F4026AD0;
    unint64_t v11 = sub_1E46684C0();
  }
  else
  {
    uint64_t v19 = a4;
    uint64_t v9 = &off_1F4027208;
    uint64_t v10 = &type metadata for Separator;
    unint64_t v11 = sub_1E466846C();
  }
  id result = objc_msgSend(a5, sel_collectionView, v11);
  if (result)
  {
    uint64_t v13 = result;
    uint64_t v14 = (void *)sub_1E46A6040();
    ((void (*)(uint64_t, uint64_t))v9[1])((uint64_t)v10, (uint64_t)v9);
    uint64_t v15 = (void *)sub_1E46A6040();
    swift_bridgeObjectRelease();
    uint64_t v16 = (void *)sub_1E46A4E70();
    id v17 = objc_msgSend(v13, sel_dequeueReusableSupplementaryViewOfKind_withReuseIdentifier_forIndexPath_, v14, v15, v16);

    id result = objc_msgSend(a5, sel_searchUIAttributes);
    if (result)
    {
      uint64_t v18 = result;
      sub_1E46847D0(v17, a3, v8, v19, result, (uint64_t)v10, (uint64_t)v9);

      return v17;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1E46681D0()
{
  uint64_t v0 = type metadata accessor for Header();
  MEMORY[0x1F4188790](v0);
  uint64_t v2 = (char *)&v10[-1] - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53508);
  uint64_t v3 = swift_dynamicCastClass();
  if (!v3) {
    return 3;
  }
  id v4 = *(id *)(v3 + qword_1EB99B9D8);
  sub_1E46A52E0();

  sub_1E4668304((uint64_t)&v2[*(int *)(v0 + 40)], (uint64_t)v10);
  uint64_t v5 = v11;
  if (v11)
  {
    uint64_t v6 = v12;
    __swift_project_boxed_opaque_existential_1(v10, v11);
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 32))(v5, v6);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
  }
  else
  {
    sub_1E466836C((uint64_t)v10);
    uint64_t v7 = 3;
  }
  sub_1E46683CC((uint64_t)v2);
  return v7;
}

uint64_t sub_1E4668304(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE533F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E466836C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE533F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E46683CC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Header();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1E466846C()
{
  unint64_t result = qword_1EB99B9E8;
  if (!qword_1EB99B9E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB99B9E8);
  }
  return result;
}

unint64_t sub_1E46684C0()
{
  unint64_t result = qword_1EB99B8D0;
  if (!qword_1EB99B8D0)
  {
    type metadata accessor for Header();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB99B8D0);
  }
  return result;
}

ValueMetadata *type metadata accessor for TrailingIconLabelStyle()
{
  return &type metadata for TrailingIconLabelStyle;
}

uint64_t sub_1E4668528()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1E4668544@<X0>(char *a1@<X8>)
{
  v28 = a1;
  uint64_t v1 = sub_1E46A5630();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v25 = v1;
  uint64_t v26 = v2;
  uint64_t v3 = MEMORY[0x1F4188790](v1);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v25 - v6;
  uint64_t v8 = sub_1E46A5650();
  uint64_t v27 = *(void *)(v8 - 8);
  uint64_t v9 = v27;
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v25 - v13;
  sub_1E46A5660();
  sub_1E46A5640();
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v15(v12, v14, v8);
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  v16(v5, v7, v1);
  id v17 = v28;
  v15(v28, v12, v8);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53460);
  uint64_t v19 = v25;
  v16(&v17[*(int *)(v18 + 48)], v5, v25);
  uint64_t v20 = *(void (**)(char *, uint64_t))(v26 + 8);
  uint64_t v21 = v7;
  uint64_t v22 = v19;
  v20(v21, v19);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v27 + 8);
  v23(v14, v8);
  v20(v5, v22);
  return ((uint64_t (*)(char *, uint64_t))v23)(v12, v8);
}

uint64_t sub_1E46687C8@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_1E46A54B0();
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = 0x4010000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53428);
  return sub_1E4668544((char *)(a1 + *(int *)(v2 + 44)));
}

unint64_t sub_1E466881C()
{
  unint64_t result = qword_1EAE534C0;
  if (!qword_1EAE534C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE533F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE534C0);
  }
  return result;
}

id sub_1E4668878()
{
  uint64_t v0 = MEMORY[0x1E4FBC870];
  uint64_t v7 = MEMORY[0x1E4FBC870];
  id result = objc_msgSend(self, sel_bundleIdentifierForApp_, 4);
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = sub_1E46A6050();
    uint64_t v5 = v4;

    sub_1E4669288(&v6, v3, v5);
    id result = (id)swift_bridgeObjectRelease();
    uint64_t v0 = v7;
  }
  qword_1EAE57FD0 = v0;
  return result;
}

uint64_t static SearchUIToolKitUtilities.performOpenIntent(for:bundleId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1EAE559C0 + dword_1EAE559C0);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1E46689D4;
  return v9(a1, a2, a3);
}

uint64_t sub_1E46689D4(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1E4668AD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_1E46A6560();
    sub_1E46A6070();
    uint64_t v6 = sub_1E46A6580();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_1E46A64D0() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_1E46A64D0() & 1) != 0) {
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

uint64_t sub_1E4668C08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  MEMORY[0x1F4188790]();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

unint64_t sub_1E4668CD8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55A38);
  uint64_t v2 = sub_1E46A6450();
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
  sub_1E46A4AB0();
  while (1)
  {
    sub_1E466CEB4(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1E4669D18(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = sub_1E466CF1C(&v17, v3[7] + 40 * result);
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 56;
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

uint64_t sub_1E4668F88(void *a1, int a2, void *aBlock)
{
  v3[2] = a1;
  v3[3] = _Block_copy(aBlock);
  uint64_t v5 = sub_1E46A6050();
  uint64_t v7 = v6;
  v3[4] = v6;
  uint64_t v11 = (uint64_t (*)(id, uint64_t, uint64_t))((char *)&dword_1EAE559C0 + dword_1EAE559C0);
  id v8 = a1;
  uint64_t v9 = (void *)swift_task_alloc();
  v3[5] = v9;
  *uint64_t v9 = v3;
  v9[1] = sub_1E4669078;
  return v11(v8, v5, v7);
}

uint64_t sub_1E4669078(char a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 24);
  uint64_t v4 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  v3[2](v3, a1 & 1);
  _Block_release(v3);
  uint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

SearchUIToolKitUtilities __swiftcall SearchUIToolKitUtilities.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (SearchUIToolKitUtilities)objc_msgSend(v0, sel_init);
}

id SearchUIToolKitUtilities.init()()
{
  v1.super_class = (Class)SearchUIToolKitUtilities;
  return objc_msgSendSuper2(&v1, sel_init);
}

uint64_t sub_1E4669288(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_1E46A6560();
  swift_bridgeObjectRetain();
  sub_1E46A6070();
  uint64_t v8 = sub_1E46A6580();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1E46A64D0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1E46A64D0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1E4669718(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1E4669438()
{
  objc_super v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE535A0);
  uint64_t v3 = sub_1E46A6310();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = sub_1E46A4AB0();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                objc_super v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_1E46A6560();
      sub_1E46A6070();
      uint64_t result = sub_1E46A6580();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_1E4669718(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_1E4669438();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_1E46698B4();
      goto LABEL_22;
    }
    sub_1E4669A68();
  }
  uint64_t v11 = *v4;
  sub_1E46A6560();
  sub_1E46A6070();
  uint64_t result = sub_1E46A6580();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_1E46A64D0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_1E46A64E0();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_1E46A64D0();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  uint64_t *v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_1E46698B4()
{
  objc_super v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE535A0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1E46A6300();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1E4669A68()
{
  objc_super v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE535A0);
  uint64_t v3 = sub_1E46A6310();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = sub_1E46A4AB0();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_1E46A6560();
    swift_bridgeObjectRetain();
    sub_1E46A6070();
    uint64_t result = sub_1E46A6580();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    objc_super v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_1E4669D18(uint64_t a1, uint64_t a2)
{
  sub_1E46A6560();
  sub_1E46A6070();
  uint64_t v4 = sub_1E46A6580();
  return sub_1E4669D90(a1, a2, v4);
}

unint64_t sub_1E4669D90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1E46A64D0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1E46A64D0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1E4669E74(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE535A0);
    uint64_t v3 = sub_1E46A6320();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      unint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_1E46A6560();
      swift_bridgeObjectRetain();
      sub_1E46A6070();
      uint64_t result = sub_1E46A6580();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        int64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (uint64_t result = sub_1E46A64D0(), (result & 1) != 0))
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
          BOOL v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            uint64_t result = sub_1E46A64D0();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
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
  return MEMORY[0x1E4FBC870];
}

uint64_t sub_1E466A018(uint64_t a1)
{
  uint64_t v2 = sub_1E46A5BA0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  unint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55A60);
    uint64_t v9 = sub_1E46A6320();
    uint64_t v10 = 0;
    unint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    long long v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_1E466CF34(&qword_1EAE55A68, MEMORY[0x1E4FAFC50]);
      uint64_t v16 = sub_1E46A5FA0();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_1E466CF34((unint64_t *)&unk_1EAE55A70, MEMORY[0x1E4FAFC50]);
          char v23 = sub_1E46A5FC0();
          uint64_t v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        uint64_t v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return v9;
      }
    }
  }
  return MEMORY[0x1E4FBC870];
}

uint64_t sub_1E466A330(uint64_t a1)
{
  uint64_t v2 = sub_1E46A5A60();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  unint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55A48);
    uint64_t v9 = sub_1E46A6320();
    uint64_t v10 = 0;
    unint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    long long v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_1E466CF34(&qword_1EAE55A50, MEMORY[0x1E4FAF678]);
      uint64_t v16 = sub_1E46A5FA0();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_1E466CF34(&qword_1EAE55A58, MEMORY[0x1E4FAF678]);
          char v23 = sub_1E46A5FC0();
          uint64_t v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        uint64_t v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return v9;
      }
    }
  }
  return MEMORY[0x1E4FBC870];
}

uint64_t sub_1E466A648(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[23] = a2;
  v3[24] = a3;
  v3[22] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE559F0);
  v3[25] = swift_task_alloc();
  uint64_t v4 = sub_1E46A5A90();
  v3[26] = v4;
  v3[27] = *(void *)(v4 - 8);
  v3[28] = swift_task_alloc();
  uint64_t v5 = sub_1E46A5B90();
  v3[29] = v5;
  v3[30] = *(void *)(v5 - 8);
  v3[31] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE559F8);
  v3[32] = swift_task_alloc();
  uint64_t v6 = sub_1E46A5B80();
  v3[33] = v6;
  v3[34] = *(void *)(v6 - 8);
  v3[35] = swift_task_alloc();
  uint64_t v7 = sub_1E46A5A70();
  v3[36] = v7;
  v3[37] = *(void *)(v7 - 8);
  v3[38] = swift_task_alloc();
  v3[39] = swift_task_alloc();
  v3[40] = swift_task_alloc();
  uint64_t v8 = sub_1E46A5B60();
  v3[41] = v8;
  v3[42] = *(void *)(v8 - 8);
  v3[43] = swift_task_alloc();
  uint64_t v9 = sub_1E46A4E40();
  v3[44] = v9;
  v3[45] = *(void *)(v9 - 8);
  v3[46] = swift_task_alloc();
  uint64_t v10 = sub_1E46A5A50();
  v3[47] = v10;
  v3[48] = *(void *)(v10 - 8);
  v3[49] = swift_task_alloc();
  uint64_t v11 = sub_1E46A5AF0();
  v3[50] = v11;
  v3[51] = *(void *)(v11 - 8);
  v3[52] = swift_task_alloc();
  uint64_t v12 = sub_1E46A5AD0();
  v3[53] = v12;
  v3[54] = *(void *)(v12 - 8);
  v3[55] = swift_task_alloc();
  v3[56] = swift_task_alloc();
  v3[57] = swift_task_alloc();
  uint64_t v13 = sub_1E46A5BA0();
  v3[58] = v13;
  v3[59] = *(void *)(v13 - 8);
  v3[60] = swift_task_alloc();
  v3[61] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E466AAF0, 0, 0);
}

uint64_t sub_1E466AAF0()
{
  uint64_t v100 = v0;
  if (qword_1EAE55648 != -1) {
    swift_once();
  }
  if (sub_1E4668AD0(*(void *)(v0 + 184), *(void *)(v0 + 192), qword_1EAE57FD0))
  {
    if (qword_1EAE55660 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_1E46A5180();
    __swift_project_value_buffer(v1, (uint64_t)qword_1EAE58010);
    swift_bridgeObjectRetain_n();
    uint64_t v2 = sub_1E46A5160();
    os_log_type_t v3 = sub_1E46A6260();
    BOOL v4 = os_log_type_enabled(v2, v3);
    unint64_t v5 = *(void *)(v0 + 192);
    if (!v4)
    {
      swift_bridgeObjectRelease_n();
LABEL_18:

LABEL_19:
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
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      BOOL v28 = *(uint64_t (**)(void))(v0 + 8);
      return v28(0);
    }
    uint64_t v6 = *(void *)(v0 + 184);
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    v99[0] = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 16_Block_object_dispose(&a9, 8) = sub_1E46658F4(v6, v5, v99);
    sub_1E46A62C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1E45B5000, v2, v3, "Unable to perform OpenIntent: %s opted out", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1E4E84AA0](v8, -1, -1);
LABEL_17:
    MEMORY[0x1E4E84AA0](v7, -1, -1);
    goto LABEL_18;
  }
  id v9 = objc_msgSend(*(id *)(v0 + 176), sel_entityIdentifer);
  if (!v9)
  {
LABEL_13:
    if (qword_1EAE55660 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_1E46A5180();
    __swift_project_value_buffer(v26, (uint64_t)qword_1EAE58010);
    uint64_t v2 = sub_1E46A5160();
    os_log_type_t v27 = sub_1E46A6260();
    if (!os_log_type_enabled(v2, v27)) {
      goto LABEL_18;
    }
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1E45B5000, v2, v27, "Unable to perform OpenIntent: incomplete annotation", v7, 2u);
    goto LABEL_17;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void **)(v0 + 176);
  sub_1E46A6050();

  id v12 = objc_msgSend(v11, sel_typeIdentifer);
  if (!v12)
  {
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void **)(v0 + 488);
  uint64_t v15 = *(void *)(v0 + 464);
  uint64_t v16 = *(void *)(v0 + 472);
  uint64_t v18 = *(void *)(v0 + 184);
  uint64_t v17 = *(void *)(v0 + 192);
  uint64_t v19 = sub_1E46A6050();
  unint64_t v21 = v20;

  *(void *)(v0 + 496) = v19;
  *(void *)(v0 + 504) = v21;
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = v18;
  v22[3] = v17;
  v22[4] = v19;
  v22[5] = v21;
  void *v14 = v22;
  (*(void (**)(void *, void, uint64_t))(v16 + 104))(v14, *MEMORY[0x1E4FAFC38], v15);
  sub_1E46A5B30();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  *(void *)(v0 + 512) = sub_1E46A5B20();
  uint64_t v23 = *(void *)(v0 + 488);
  uint64_t v24 = *(void *)(v0 + 464);
  uint64_t v25 = *(void *)(v0 + 472);
  uint64_t v73 = v19;
  unint64_t v75 = v21;
  uint64_t v30 = *(void *)(v0 + 440);
  uint64_t v93 = *(void *)(v0 + 448);
  uint64_t v96 = *(void *)(v0 + 432);
  uint64_t v31 = *(void *)(v0 + 416);
  uint64_t v95 = *(void *)(v0 + 424);
  uint64_t v32 = *(void *)(v0 + 408);
  uint64_t v77 = *(void *)(v0 + 400);
  id v79 = *(uint64_t **)(v0 + 392);
  uint64_t v81 = *(void *)(v0 + 384);
  uint64_t v83 = *(void *)(v0 + 376);
  uint64_t v87 = *(void *)(v0 + 336);
  uint64_t v89 = *(void *)(v0 + 344);
  uint64_t v91 = *(void *)(v0 + 328);
  sub_1E46A5AC0();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55A00);
  unint64_t v33 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_1E46B7170;
  uint64_t v74 = *(void (**)(unint64_t, uint64_t, uint64_t))(v25 + 16);
  v74(v34 + v33, v23, v24);
  uint64_t v35 = sub_1E466A018(v34);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  MEMORY[0x1E4E83100](v35);
  swift_bridgeObjectRelease();
  sub_1E466CF34(&qword_1EAE55A08, MEMORY[0x1E4FAF7D0]);
  sub_1E466CF34(&qword_1EAE55A10, MEMORY[0x1E4FAF7F8]);
  sub_1E46A5B50();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v77);
  uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v96 + 8);
  v36(v30, v95);
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55A18);
  uint64_t v37 = sub_1E46A5A60();
  uint64_t v38 = *(void *)(v37 - 8);
  unint64_t v39 = (*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
  uint64_t v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = xmmword_1E46B7170;
  (*(void (**)(unint64_t, void, uint64_t))(v38 + 104))(v40 + v39, *MEMORY[0x1E4FAF670], v37);
  uint64_t v41 = sub_1E466A330(v40);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  *id v79 = v41;
  (*(void (**)(uint64_t *, void, uint64_t))(v81 + 104))(v79, *MEMORY[0x1E4FAF648], v83);
  sub_1E466CF34(&qword_1EAE55A20, MEMORY[0x1E4FAF658]);
  sub_1E46A5B50();
  swift_release();
  (*(void (**)(uint64_t *, uint64_t))(v81 + 8))(v79, v83);
  v36(v93, v95);
  sub_1E46A4E20();
  (*(void (**)(uint64_t, void, uint64_t))(v87 + 104))(v89, *MEMORY[0x1E4FAF940], v91);
  uint64_t v42 = sub_1E46A5B10();
  uint64_t v43 = *(void *)(v0 + 456);
  uint64_t v44 = *(void *)(v0 + 424);
  uint64_t v45 = *(void *)(v0 + 360);
  uint64_t v46 = *(void *)(v0 + 368);
  uint64_t v47 = *(void *)(v0 + 352);
  (*(void (**)(void, void))(*(void *)(v0 + 336) + 8))(*(void *)(v0 + 344), *(void *)(v0 + 328));
  (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v46, v47);
  v36(v43, v44);
  if (*(void *)(v42 + 16) != 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v59 = *(void *)(v42 + 16);
    swift_bridgeObjectRelease();
    if (v59)
    {
      if (qword_1EAE55660 != -1) {
        swift_once();
      }
      uint64_t v60 = sub_1E46A5180();
      __swift_project_value_buffer(v60, (uint64_t)qword_1EAE58010);
      swift_bridgeObjectRetain();
      v61 = sub_1E46A5160();
      os_log_type_t v62 = sub_1E46A6250();
      BOOL v63 = os_log_type_enabled(v61, v62);
      uint64_t v64 = *(void *)(v0 + 488);
      uint64_t v66 = *(void *)(v0 + 464);
      uint64_t v65 = *(void *)(v0 + 472);
      if (v63)
      {
        uint64_t v98 = *(void *)(v0 + 464);
        v67 = (uint8_t *)swift_slowAlloc();
        uint64_t v97 = v64;
        uint64_t v68 = swift_slowAlloc();
        v99[0] = v68;
        *(_DWORD *)v67 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 144) = sub_1E46658F4(v73, v75, v99);
        sub_1E46A62C0();
        swift_bridgeObjectRelease_n();
        v69 = "Too many OpenIntents found for type: %s. Unable to pick one!";
LABEL_36:
        _os_log_impl(&dword_1E45B5000, v61, v62, v69, v67, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1E4E84AA0](v68, -1, -1);
        MEMORY[0x1E4E84AA0](v67, -1, -1);
        swift_release();

        (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v97, v98);
        goto LABEL_19;
      }
    }
    else
    {
      if (qword_1EAE55660 != -1) {
        swift_once();
      }
      uint64_t v71 = sub_1E46A5180();
      __swift_project_value_buffer(v71, (uint64_t)qword_1EAE58010);
      swift_bridgeObjectRetain();
      v61 = sub_1E46A5160();
      os_log_type_t v62 = sub_1E46A6250();
      BOOL v72 = os_log_type_enabled(v61, v62);
      uint64_t v64 = *(void *)(v0 + 488);
      uint64_t v66 = *(void *)(v0 + 464);
      uint64_t v65 = *(void *)(v0 + 472);
      if (v72)
      {
        uint64_t v98 = *(void *)(v0 + 464);
        v67 = (uint8_t *)swift_slowAlloc();
        uint64_t v97 = v64;
        uint64_t v68 = swift_slowAlloc();
        v99[0] = v68;
        *(_DWORD *)v67 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 152) = sub_1E46658F4(v73, v75, v99);
        sub_1E46A62C0();
        swift_bridgeObjectRelease_n();
        v69 = "No usable OpenIntent found for type: %s";
        goto LABEL_36;
      }
    }
    swift_release();

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v64, v66);
    goto LABEL_19;
  }
  unint64_t v48 = *(void *)(v0 + 480);
  uint64_t v76 = *(void *)(v0 + 464);
  uint64_t v78 = *(void *)(v0 + 488);
  uint64_t v49 = *(void *)(v0 + 312);
  unint64_t v50 = *(void *)(v0 + 320);
  uint64_t v51 = *(void *)(v0 + 296);
  uint64_t v94 = *(void *)(v0 + 304);
  uint64_t v52 = *(void *)(v0 + 288);
  uint64_t v85 = *(void *)(v0 + 272);
  uint64_t v82 = *(void *)(v0 + 280);
  uint64_t v84 = *(void *)(v0 + 264);
  uint64_t v80 = *(void *)(v0 + 256);
  uint64_t v88 = *(uint64_t **)(v0 + 248);
  uint64_t v90 = *(void *)(v0 + 240);
  uint64_t v92 = *(void *)(v0 + 232);
  v86 = *(void (**)(uint64_t, unint64_t, uint64_t))(v51 + 16);
  v86(v49, v42 + ((*(unsigned __int8 *)(v51 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80)), v52);
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v51 + 32))(v50, v49, v52);
  v74(v48, v78, v76);
  uint64_t v53 = sub_1E46A5BB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v80, 1, 1, v53);
  sub_1E46A5B70();
  uint64_t v54 = swift_allocBox();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v85 + 16))(v55, v82, v84);
  *uint64_t v88 = v54;
  (*(void (**)(uint64_t *, void, uint64_t))(v90 + 104))(v88, *MEMORY[0x1E4FAFA68], v92);
  v86(v94, v50, v52);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55A28);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1E46B7170;
  *(void *)(inited + 32) = 0x746567726174;
  *(void *)(inited + 40) = 0xE600000000000000;
  uint64_t v57 = MEMORY[0x1E4FAFAA8];
  *(void *)(inited + 72) = v92;
  *(void *)(inited + 80) = v57;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 48));
  (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v90 + 16))(boxed_opaque_existential_1, v88, v92);
  sub_1E4668CD8(inited);
  sub_1E46A5A80();
  v70 = (void *)swift_task_alloc();
  *(void *)(v0 + 520) = v70;
  void *v70 = v0;
  v70[1] = sub_1E466BCDC;
  return MEMORY[0x1F4164880]();
}

uint64_t sub_1E466BCDC(uint64_t a1)
{
  os_log_type_t v3 = (void *)*v2;
  BOOL v4 = (void *)*v2;
  v3[66] = a1;
  v3[67] = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x1F4188298](sub_1E466C1C4, 0, 0);
  }
  else
  {
    unint64_t v5 = (void *)swift_task_alloc();
    v3[68] = v5;
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55A30);
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    *unint64_t v5 = v4;
    v5[1] = sub_1E466BEA0;
    uint64_t v8 = v3[28];
    uint64_t v9 = v3[25];
    return MEMORY[0x1F41646C0](v9, v8, v6, OpaqueTypeConformance2);
  }
}

uint64_t sub_1E466BEA0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 552) = v0;
  swift_task_dealloc();
  if (v0)
  {
    os_log_type_t v3 = sub_1E466C5C0;
  }
  else
  {
    sub_1E466CE54(*(void *)(v2 + 200));
    swift_bridgeObjectRelease();
    os_log_type_t v3 = sub_1E466BFC8;
  }
  return MEMORY[0x1F4188298](v3, 0, 0);
}

uint64_t sub_1E466BFC8()
{
  uint64_t v1 = v0[59];
  uint64_t v16 = v0[58];
  uint64_t v17 = v0[61];
  uint64_t v2 = v0[37];
  uint64_t v14 = v0[36];
  uint64_t v15 = v0[40];
  uint64_t v3 = v0[34];
  uint64_t v12 = v0[33];
  uint64_t v13 = v0[35];
  uint64_t v4 = v0[30];
  uint64_t v11 = v0[31];
  uint64_t v5 = v0[28];
  uint64_t v6 = v0[29];
  uint64_t v7 = v0[26];
  uint64_t v8 = v0[27];
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v11, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v13, v12);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v15, v14);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v17, v16);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(uint64_t))v0[1];
  return v9(1);
}

uint64_t sub_1E466C1C4()
{
  uint64_t v32 = v0;
  uint64_t v1 = v0[59];
  uint64_t v29 = v0[58];
  uint64_t v30 = v0[61];
  uint64_t v2 = v0[37];
  uint64_t v27 = v0[36];
  uint64_t v28 = v0[40];
  uint64_t v3 = v0[34];
  uint64_t v25 = v0[33];
  uint64_t v26 = v0[35];
  uint64_t v4 = v0[30];
  uint64_t v5 = v0[31];
  uint64_t v7 = v0[28];
  uint64_t v6 = v0[29];
  uint64_t v8 = v0[26];
  uint64_t v9 = v0[27];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v26, v25);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v28, v27);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v30, v29);
  uint64_t v10 = (void *)v0[67];
  if (qword_1EAE55660 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1E46A5180();
  __swift_project_value_buffer(v11, (uint64_t)qword_1EAE58010);
  id v12 = v10;
  swift_bridgeObjectRetain();
  id v13 = v10;
  uint64_t v14 = sub_1E46A5160();
  os_log_type_t v15 = sub_1E46A6260();
  BOOL v16 = os_log_type_enabled(v14, v15);
  unint64_t v17 = v0[63];
  if (v16)
  {
    uint64_t v18 = v0[62];
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v31 = v20;
    *(_DWORD *)uint64_t v19 = 136315394;
    swift_bridgeObjectRetain();
    v0[20] = sub_1E46658F4(v18, v17, &v31);
    sub_1E46A62C0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v19 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v21 = sub_1E46A64F0();
    v0[17] = sub_1E46658F4(v21, v22, &v31);
    sub_1E46A62C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1E45B5000, v14, v15, "Failed to perform OpenIntent for type: %s. Error: %s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1E4E84AA0](v20, -1, -1);
    MEMORY[0x1E4E84AA0](v19, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v23 = (uint64_t (*)(void))v0[1];
  return v23(0);
}

uint64_t sub_1E466C5C0()
{
  uint64_t v32 = v0;
  uint64_t v1 = v0[59];
  uint64_t v29 = v0[58];
  uint64_t v30 = v0[61];
  uint64_t v2 = v0[37];
  uint64_t v27 = v0[36];
  uint64_t v28 = v0[40];
  uint64_t v3 = v0[34];
  uint64_t v25 = v0[33];
  uint64_t v26 = v0[35];
  uint64_t v4 = v0[30];
  uint64_t v24 = v0[31];
  uint64_t v5 = v0[28];
  uint64_t v6 = v0[29];
  uint64_t v7 = v0[26];
  uint64_t v8 = v0[27];
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v24, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v26, v25);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v28, v27);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v30, v29);
  uint64_t v9 = (void *)v0[69];
  if (qword_1EAE55660 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1E46A5180();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EAE58010);
  id v11 = v9;
  swift_bridgeObjectRetain();
  id v12 = v9;
  id v13 = sub_1E46A5160();
  os_log_type_t v14 = sub_1E46A6260();
  BOOL v15 = os_log_type_enabled(v13, v14);
  unint64_t v16 = v0[63];
  if (v15)
  {
    uint64_t v17 = v0[62];
    uint64_t v18 = swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v31 = v19;
    *(_DWORD *)uint64_t v18 = 136315394;
    swift_bridgeObjectRetain();
    v0[20] = sub_1E46658F4(v17, v16, &v31);
    sub_1E46A62C0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v20 = sub_1E46A64F0();
    v0[17] = sub_1E46658F4(v20, v21, &v31);
    sub_1E46A62C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1E45B5000, v13, v14, "Failed to perform OpenIntent for type: %s. Error: %s", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1E4E84AA0](v19, -1, -1);
    MEMORY[0x1E4E84AA0](v18, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v22 = (uint64_t (*)(void))v0[1];
  return v22(0);
}

unint64_t type metadata accessor for SearchUIToolKitUtilities()
{
  unint64_t result = qword_1EAE559C8;
  if (!qword_1EAE559C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAE559C8);
  }
  return result;
}

uint64_t sub_1E466CA0C()
{
  _Block_release(*(const void **)(v0 + 32));
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1E466CA54()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1E466CF7C;
  uint64_t v6 = (uint64_t (*)(void *, int, void *))((char *)&dword_1EAE559D0 + dword_1EAE559D0);
  return v6(v2, v3, v4);
}

uint64_t sub_1E466CB18()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1E466CF7C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1EAE562D8 + dword_1EAE562D8);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_5Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1E466CC1C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1E4662D6C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EAE562E0 + dword_1EAE562E0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1E466CCE8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1E466CD28()
{
  return sub_1E46A5AB0();
}

uint64_t sub_1E466CD4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1E4668C08(a1, a2, a3, a4, MEMORY[0x1E4FAF7F8], MEMORY[0x1E4FAF7B8]);
}

uint64_t sub_1E466CD8C()
{
  return sub_1E46A5AA0();
}

uint64_t sub_1E466CDB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1E4668C08(a1, a2, a3, a4, MEMORY[0x1E4FAF658], MEMORY[0x1E4FAF790]);
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

uint64_t sub_1E466CE54(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE559F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E466CEB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55A40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E466CF1C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1E466CF34(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1E466CFC8(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_1EAE55A80 + dword_1EAE55A80);
  long long v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *long long v3 = v1;
  v3[1] = sub_1E4662D6C;
  return v5(a1);
}

uint64_t sub_1E466D1E8(void *a1, void *aBlock)
{
  v2[2] = a1;
  v2[3] = _Block_copy(aBlock);
  uint64_t v7 = (uint64_t (*)(id))((char *)&dword_1EAE55A80 + dword_1EAE55A80);
  id v4 = a1;
  uint64_t v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1E466D2B0;
  return v7(v4);
}

uint64_t sub_1E466D2B0()
{
  long long v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  uint64_t v7 = *(void *)(v3 + 24);
  if (v2)
  {
    uint64_t v8 = (void *)sub_1E46A4D10();

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

uint64_t sub_1E466D434()
{
  return MEMORY[0x1F4188298](sub_1E466D450, 0, 0);
}

uint64_t sub_1E466D450()
{
  if (qword_1EAE57FD8)
  {
    sub_1E46A4AB0();
    sub_1E46A5060();
    qword_1EAE57FD8 = 0;
    swift_release();
    swift_release();
  }
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E466D670(const void *a1)
{
  *(void *)(v1 + 16) = _Block_copy(a1);
  return MEMORY[0x1F4188298](sub_1E466D6D8, 0, 0);
}

uint64_t sub_1E466D6D8()
{
  if (qword_1EAE57FD8)
  {
    sub_1E46A4AB0();
    sub_1E46A5060();
    qword_1EAE57FD8 = 0;
    swift_release();
    swift_release();
  }
  (*(void (**)(void))(*(void *)(v0 + 16) + 16))();
  _Block_release(*(const void **)(v0 + 16));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

id SearchUITTSUtilities.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id SearchUITTSUtilities.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUITTSUtilities();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SearchUITTSUtilities.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUITTSUtilities();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1E466D8B4(unint64_t a1, unint64_t a2)
{
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    sub_1E466D994(0xFuLL, a1, a2);
    if ((a2 & 0x1000000000000000) != 0)
    {
      unsigned int v5 = sub_1E46A6340();
    }
    else
    {
      if ((a2 & 0x2000000000000000) == 0 && (a1 & 0x1000000000000000) == 0) {
        sub_1E46A63B0();
      }
      unsigned int v5 = sub_1E46A63C0();
    }
  }
  else
  {
    unsigned int v5 = 0;
  }
  return v5 | ((unint64_t)(v2 == 0) << 32);
}

unint64_t sub_1E466D994(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5) {
    goto LABEL_9;
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 <= result >> 16)
  {
    __break(1u);
LABEL_9:
    uint64_t result = sub_1E466DA34(result, a2, a3);
    if ((result & 1) == 0) {
      return result & 0xC | sub_1E466DAA4(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
    }
  }
  return result;
}

unint64_t sub_1E466DA34(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 0xC) == 4 << v5) {
    uint64_t result = sub_1E4665DFC(result, a2, a3);
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 <= result >> 16) {
    __break(1u);
  }
  return result;
}

unint64_t sub_1E466DAA4(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0xC000) != 0 || result < 0x10000)
  {
    result &= 0xFFFFFFFFFFFF0000;
  }
  else
  {
    unint64_t v5 = result >> 16;
    if ((a3 & 0x1000000000000000) == 0)
    {
      v13[2] = v3;
      v13[3] = v4;
      if ((a3 & 0x2000000000000000) != 0)
      {
        v13[0] = a2;
        v13[1] = a3 & 0xFFFFFFFFFFFFFFLL;
        if (v5 != (HIBYTE(a3) & 0xF) && (*((unsigned char *)v13 + v5) & 0xC0) == 0x80)
        {
          do
          {
            unint64_t v7 = v5 - 1;
            int v11 = *((unsigned char *)&v12 + v5-- + 7) & 0xC0;
          }
          while (v11 == 128);
          return v7 << 16;
        }
        goto LABEL_14;
      }
      if ((a2 & 0x1000000000000000) != 0)
      {
        uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if (v5 == (a2 & 0xFFFFFFFFFFFFLL)) {
          goto LABEL_14;
        }
      }
      else
      {
        unint64_t v12 = result >> 16;
        uint64_t v6 = sub_1E46A63B0();
        unint64_t v5 = v12;
        if (v12 == v10) {
          goto LABEL_14;
        }
      }
      if ((*(unsigned char *)(v6 + v5) & 0xC0) == 0x80)
      {
        do
        {
          unint64_t v7 = v5 - 1;
          int v8 = *(unsigned char *)(v6 - 1 + v5--) & 0xC0;
        }
        while (v8 == 128);
        return v7 << 16;
      }
LABEL_14:
      unint64_t v7 = v5;
      return v7 << 16;
    }
    uint64_t v9 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v9 = a2 & 0xFFFFFFFFFFFFLL;
    }
    if (v5 != v9)
    {
      return MEMORY[0x1F4184CD0]();
    }
  }
  return result;
}

void *sub_1E466DBC8(void *result, uint64_t *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  unint64_t v5 = result;
  uint64_t v6 = HIBYTE(a5) & 0xF;
  uint64_t v12 = a4;
  unint64_t v13 = a5;
  if ((a5 & 0x2000000000000000) == 0) {
    uint64_t v6 = a4 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v14 = v6;
  if (!a2)
  {
    uint64_t v7 = 0;
LABEL_14:
    *unint64_t v5 = a4;
    v5[1] = a5;
    v5[2] = 0;
    v5[3] = v6;
    return (void *)v7;
  }
  uint64_t v7 = a3;
  if (!a3) {
    goto LABEL_14;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    int v8 = a2;
    uint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = sub_1E46A60A0();
      if (!v11) {
        break;
      }
      ++v9;
      *int v8 = v10;
      v8[1] = v11;
      v8 += 2;
      if (v7 == v9)
      {
        a4 = v12;
        a5 = v13;
        goto LABEL_13;
      }
    }
    a4 = v12;
    a5 = v13;
    uint64_t v7 = v9;
LABEL_13:
    uint64_t v6 = v14;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

void *sub_1E466DC84(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55AD0);
  uint64_t v4 = (void *)swift_allocObject();
  int64_t v5 = _swift_stdlib_malloc_size(v4);
  uint64_t v6 = v5 - 32;
  if (v5 < 32) {
    uint64_t v6 = v5 - 17;
  }
  v4[2] = a1;
  v4[3] = 2 * (v6 >> 4);
  return v4;
}

uint64_t sub_1E466DCFC(void *a1)
{
  uint64_t result = (uint64_t)objc_msgSend(a1, sel_audioBuffer);
  if (!result) {
    return result;
  }
  uint64_t v3 = (void *)result;
  sub_1E46A4DB0();

  objc_msgSend(a1, sel_sampleRate);
  uint64_t v5 = v4;
  id v6 = objc_msgSend(a1, sel_formatID);
  if (!v6) {
    goto LABEL_32;
  }
  uint64_t v7 = v6;
  uint64_t v8 = sub_1E46A6050();
  unint64_t v10 = v9;

  uint64_t v11 = sub_1E46A6080();
  if (!v11)
  {
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v13 = (void *)MEMORY[0x1E4FBC860];
    uint64_t v15 = *(void *)(MEMORY[0x1E4FBC860] + 16);
    if (v15) {
      goto LABEL_6;
    }
LABEL_35:
    int v17 = 0;
LABEL_36:
    swift_release();
    goto LABEL_37;
  }
  uint64_t v12 = v11;
  unint64_t v13 = sub_1E466DC84(v11, 0);
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_1E466DBC8(&v49, v13 + 4, v12, v8, v10);
  uint64_t result = swift_bridgeObjectRelease();
  if (v14 != (void *)v12) {
    goto LABEL_63;
  }
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v15 = v13[2];
  if (!v15) {
    goto LABEL_35;
  }
LABEL_6:
  if ((unint64_t)(v15 - 1) >> 61)
  {
    __break(1u);
LABEL_32:
    int v17 = 0;
LABEL_37:
    id v28 = objc_msgSend(a1, sel_formatFlags);
    if (v28)
    {
      uint64_t v29 = v28;
      unsigned int v30 = objc_msgSend(v28, sel_unsignedIntValue);
    }
    else
    {
      unsigned int v30 = 0;
    }
    id v31 = objc_msgSend(a1, sel_bytesPerPacket);
    if (v31)
    {
      uint64_t v32 = v31;
      unsigned int v33 = objc_msgSend(v31, sel_unsignedIntValue);
    }
    else
    {
      unsigned int v33 = 0;
    }
    id v34 = objc_msgSend(a1, sel_framesPerPacket);
    if (v34)
    {
      uint64_t v35 = v34;
      unsigned int v36 = objc_msgSend(v34, sel_unsignedIntValue);
    }
    else
    {
      unsigned int v36 = 0;
    }
    id v37 = objc_msgSend(a1, sel_bytesPerFrame);
    if (v37)
    {
      uint64_t v38 = v37;
      unsigned int v39 = objc_msgSend(v37, sel_unsignedIntValue);
    }
    else
    {
      unsigned int v39 = 0;
    }
    id v40 = objc_msgSend(a1, sel_channelsPerFrame);
    if (v40)
    {
      uint64_t v41 = v40;
      unsigned int v42 = objc_msgSend(v40, sel_unsignedIntValue);
    }
    else
    {
      unsigned int v42 = 0;
    }
    id v43 = objc_msgSend(a1, sel_bitsPerChannel);
    if (v43)
    {
      uint64_t v44 = v43;
      unsigned int v45 = objc_msgSend(v43, sel_unsignedIntValue);
    }
    else
    {
      unsigned int v45 = 0;
    }
    id v46 = objc_msgSend(a1, sel_reserved);
    if (v46)
    {
      uint64_t v47 = v46;
      unsigned int v48 = objc_msgSend(v46, sel_unsignedIntValue);
    }
    else
    {
      unsigned int v48 = 0;
    }
    sub_1E46A50C0();
    uint64_t v49 = v5;
    int v50 = v17;
    unsigned int v51 = v30;
    unsigned int v52 = v33;
    unsigned int v53 = v36;
    unsigned int v54 = v39;
    unsigned int v55 = v42;
    unsigned int v56 = v45;
    unsigned int v57 = v48;
    return sub_1E46A50A0();
  }
  unint64_t v16 = 0;
  int v17 = 0;
  unint64_t v18 = 8 * v15 - 8;
  uint64_t v19 = v13 + 5;
  while (v16 < v13[2])
  {
    unint64_t v21 = *(v19 - 1);
    unint64_t v20 = *v19;
    BOOL v22 = v21 == 2573 && v20 == 0xE200000000000000;
    if (v22 || (uint64_t result = sub_1E46A64D0(), (result & 1) != 0))
    {
      if (v18 > 0x20) {
        goto LABEL_22;
      }
      int v24 = 10;
    }
    else
    {
      swift_bridgeObjectRetain();
      if ((sub_1E46A5FB0() & 1) == 0) {
        goto LABEL_24;
      }
      uint64_t result = sub_1E466D8B4(v21, v20);
      if ((result & 0x100000000) != 0) {
        goto LABEL_64;
      }
      if ((result & 0xFFFFFF80) != 0)
      {
LABEL_24:
        uint64_t result = swift_bridgeObjectRelease();
        int v24 = 0;
        int v25 = 0;
        if (v18 > 0x20) {
          goto LABEL_28;
        }
      }
      else
      {
        uint64_t result = sub_1E466D8B4(v21, v20);
        if ((result & 0x100000000) != 0) {
          goto LABEL_65;
        }
        int v23 = result;
        uint64_t result = swift_bridgeObjectRelease();
        if ((v23 & 0xFFFFFF00) != 0) {
          goto LABEL_62;
        }
        if (v18 > 0x20)
        {
LABEL_22:
          int v25 = 0;
          goto LABEL_28;
        }
        int v24 = v23;
      }
    }
    int v26 = v24 << (v18 & 0x18);
    if (v18 >= 0x20) {
      int v25 = 0;
    }
    else {
      int v25 = v26;
    }
LABEL_28:
    BOOL v27 = __CFADD__(v17, v25);
    v17 += v25;
    if (v27) {
      goto LABEL_61;
    }
    if (v15 == ++v16) {
      goto LABEL_36;
    }
    v18 -= 8;
    v19 += 2;
  }
  __break(1u);
LABEL_61:
  __break(1u);
LABEL_62:
  __break(1u);
LABEL_63:
  __break(1u);
LABEL_64:
  __break(1u);
LABEL_65:
  __break(1u);
  return result;
}

uint64_t sub_1E466E16C(uint64_t a1)
{
  *(void *)(v1 + 64) = a1;
  return MEMORY[0x1F4188298](sub_1E466E1FC, 0, 0);
}

uint64_t sub_1E466E1FC()
{
  id v1 = objc_msgSend(self, sel_sharedInstance);
  *(void *)(v0 + 56) = 0;
  uint64_t v2 = (void **)(v0 + 56);
  unsigned int v3 = objc_msgSend(v1, sel_setCategory_mode_options_error_, *MEMORY[0x1E4F14F98], *MEMORY[0x1E4F15050], 19, v0 + 56);
  uint64_t v4 = *(void **)(v0 + 56);
  if (!v3)
  {
    id v9 = v4;
    sub_1E46A4D20();

LABEL_6:
    swift_willThrow();
LABEL_7:

    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_8;
  }
  void *v2 = 0;
  id v5 = v4;
  unsigned int v6 = objc_msgSend(v1, sel_setActive_error_, 1, v0 + 56);
  uint64_t v7 = *v2;
  if (!v6)
  {
    id v10 = v7;
    sub_1E46A4D20();

    goto LABEL_6;
  }
  id v8 = v7;
  objc_msgSend(v1, sel_opaqueSessionID);
  sub_1E46A50B0();
  sub_1E46A5090();
  swift_allocObject();
  qword_1EAE57FD8 = sub_1E46A5050();
  sub_1E46A4AB0();
  swift_release();
  sub_1E46A5070();
  sub_1E46A5080();
  sub_1E46A5060();
  void *v2 = 0;
  unsigned int v13 = objc_msgSend(v1, sel_setActive_error_, 0, v0 + 56);
  uint64_t v14 = *v2;
  if (!v13)
  {
    id v16 = v14;
    sub_1E46A4D20();

    swift_willThrow();
    swift_release();
    goto LABEL_7;
  }
  qword_1EAE57FD8 = 0;
  id v15 = v14;
  swift_release();
  swift_release();

  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
LABEL_8:
  return v11();
}

uint64_t type metadata accessor for SearchUITTSUtilities()
{
  return self;
}

uint64_t method lookup function for SearchUITTSUtilities(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SearchUITTSUtilities);
}

uint64_t dispatch thunk of static SearchUITTSUtilities.ttsAudioData(sfAudioData:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static SearchUITTSUtilities.play(audioData:)(uint64_t a1)
{
  unsigned int v6 = (uint64_t (*)(uint64_t))(*(void *)(v1 + 88) + **(int **)(v1 + 88));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1E4662D6C;
  return v6(a1);
}

uint64_t dispatch thunk of static SearchUITTSUtilities.stop()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(v0 + 96) + **(int **)(v0 + 96));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_1E466CF7C;
  return v4();
}

uint64_t sub_1E466E6CC()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1E466E704()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  unsigned int v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *unsigned int v3 = v1;
  v3[1] = sub_1E466CF7C;
  uint64_t v4 = (uint64_t (*)(const void *))((char *)&dword_1EAE55AA0 + dword_1EAE55AA0);
  return v4(v2);
}

uint64_t sub_1E466E7B8()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1E466E7F8()
{
  uint64_t v2 = *(void **)(v0 + 16);
  unsigned int v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1E4662D6C;
  uint64_t v5 = (uint64_t (*)(void *, void *))((char *)&dword_1EAE55AB0 + dword_1EAE55AB0);
  return v5(v2, v3);
}

uint64_t sub_1E466E8B4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1E466CF7C;
  id v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EAE562E0 + dword_1EAE562E0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1E466E980(uint64_t a1)
{
  return sub_1E466E9E0(a1, qword_1EAE57FE0);
}

uint64_t sub_1E466E9A0(uint64_t a1)
{
  return sub_1E466E9E0(a1, qword_1EAE57FF8);
}

uint64_t sub_1E466E9C0(uint64_t a1)
{
  return sub_1E466E9E0(a1, qword_1EAE58010);
}

uint64_t sub_1E466E9E0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1E46A5180();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_1E46A5170();
}

void sub_1E466EA58(void *a1@<X8>)
{
  uint64_t v2 = (int *)type metadata accessor for SearchUIUserReportModel();
  *a1 = 0;
  a1[1] = 0;
  uint64_t v3 = (char *)a1 + v2[6];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE55BA0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = self;
  uint64_t v6 = (void *)sub_1E46A6040();
  id v7 = objc_msgSend(v5, sel_localizedStringForKey_, v6);

  if (v7)
  {
    uint64_t v8 = sub_1E46A6050();
    unint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    unint64_t v10 = 0xE000000000000000;
  }
  uint64_t v11 = (void *)((char *)a1 + v2[7]);
  *uint64_t v11 = v8;
  v11[1] = v10;
  uint64_t v12 = (void *)sub_1E46A6040();
  id v13 = objc_msgSend(v5, sel_localizedStringForKey_, v12);

  if (v13)
  {
    uint64_t v14 = sub_1E46A6050();
    unint64_t v16 = v15;
  }
  else
  {
    uint64_t v14 = 0;
    unint64_t v16 = 0xE000000000000000;
  }
  uint64_t v17 = (void *)((char *)a1 + v2[8]);
  uint64_t *v17 = v14;
  v17[1] = v16;
}

uint64_t type metadata accessor for SearchUIUserReportModel()
{
  uint64_t result = qword_1EAE55AE0;
  if (!qword_1EAE55AE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

char *sub_1E466EC18(char *a1, char **a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    sub_1E46A4AB0();
  }
  else
  {
    uint64_t v8 = a2[1];
    *((void *)a1 + 1) = v8;
    uint64_t v9 = a3[6];
    unint64_t v10 = &a1[v9];
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = v5;
    id v13 = v8;
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE55BA0);
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v11, 1, v14))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55AD8);
      memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      uint64_t v17 = sub_1E46A4E10();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v10, v11, v17);
      uint64_t v18 = *(int *)(v14 + 28);
      uint64_t v19 = &v10[v18];
      unint64_t v20 = &v11[v18];
      uint64_t v21 = *((void *)v20 + 1);
      *(void *)uint64_t v19 = *(void *)v20;
      *((void *)v19 + 1) = v21;
      BOOL v22 = *(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56);
      swift_bridgeObjectRetain();
      v22(v10, 0, 1, v14);
    }
    uint64_t v23 = a3[7];
    uint64_t v24 = a3[8];
    int v25 = &a1[v23];
    int v26 = (char **)((char *)a2 + v23);
    uint64_t v27 = v26[1];
    *(void *)int v25 = *v26;
    *((void *)v25 + 1) = v27;
    id v28 = &a1[v24];
    uint64_t v29 = (char **)((char *)a2 + v24);
    uint64_t v30 = v29[1];
    *(void *)id v28 = *v29;
    *((void *)v28 + 1) = v30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1E466EDFC(id *a1, uint64_t a2)
{
  int v4 = (char *)a1 + *(int *)(a2 + 24);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE55BA0);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5))
  {
    uint64_t v6 = sub_1E46A4E10();
    (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v4, v6);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_1E466EEFC(void *a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  id v7 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v7;
  uint64_t v8 = a3[6];
  uint64_t v9 = (char *)a1 + v8;
  unint64_t v10 = (char *)(a2 + v8);
  id v11 = v6;
  id v12 = v7;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE55BA0);
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v10, 1, v13))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55AD8);
    memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    uint64_t v16 = sub_1E46A4E10();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v9, v10, v16);
    uint64_t v17 = *(int *)(v13 + 28);
    uint64_t v18 = &v9[v17];
    uint64_t v19 = &v10[v17];
    uint64_t v20 = *((void *)v19 + 1);
    *(void *)uint64_t v18 = *(void *)v19;
    *((void *)v18 + 1) = v20;
    uint64_t v21 = *(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56);
    swift_bridgeObjectRetain();
    v21(v9, 0, 1, v13);
  }
  uint64_t v22 = a3[7];
  uint64_t v23 = a3[8];
  uint64_t v24 = (void *)((char *)a1 + v22);
  int v25 = (void *)(a2 + v22);
  uint64_t v26 = v25[1];
  void *v24 = *v25;
  v24[1] = v26;
  uint64_t v27 = (void *)((char *)a1 + v23);
  id v28 = (void *)(a2 + v23);
  uint64_t v29 = v28[1];
  *uint64_t v27 = *v28;
  v27[1] = v29;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1E466F090(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  id v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  uint64_t v9 = *(void **)(a1 + 8);
  unint64_t v10 = *(void **)(a2 + 8);
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = v10;
  id v11 = v10;

  uint64_t v12 = a3[6];
  uint64_t v13 = (char *)(a1 + v12);
  uint64_t v14 = (char *)(a2 + v12);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE55BA0);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      uint64_t v33 = sub_1E46A4E10();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 24))(v13, v14, v33);
      uint64_t v34 = *(int *)(v15 + 28);
      uint64_t v35 = &v13[v34];
      unsigned int v36 = &v14[v34];
      *(void *)uint64_t v35 = *(void *)v36;
      *((void *)v35 + 1) = *((void *)v36 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    sub_1E466F30C((uint64_t)v13);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55AD8);
    memcpy(v13, v14, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v20 = sub_1E46A4E10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v13, v14, v20);
  uint64_t v21 = *(int *)(v15 + 28);
  uint64_t v22 = &v13[v21];
  uint64_t v23 = &v14[v21];
  *(void *)uint64_t v22 = *(void *)v23;
  *((void *)v22 + 1) = *((void *)v23 + 1);
  uint64_t v24 = *(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56);
  swift_bridgeObjectRetain();
  v24(v13, 0, 1, v15);
LABEL_7:
  uint64_t v26 = a3[7];
  uint64_t v27 = (void *)(a1 + v26);
  id v28 = (void *)(a2 + v26);
  *uint64_t v27 = *v28;
  v27[1] = v28[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v29 = a3[8];
  uint64_t v30 = (void *)(a1 + v29);
  id v31 = (void *)(a2 + v29);
  void *v30 = *v31;
  v30[1] = v31[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1E466F30C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE55BA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_1E466F36C(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[6];
  id v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE55BA0);
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55AD8);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    uint64_t v12 = sub_1E46A4E10();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v7, v8, v12);
    *(_OWORD *)&v7[*(int *)(v9 + 28)] = *(_OWORD *)&v8[*(int *)(v9 + 28)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = a3[8];
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v13) = *(_OWORD *)((char *)a2 + v13);
  return a1;
}

uint64_t sub_1E466F4D0(uint64_t a1, void *a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  id v7 = *(void **)(a1 + 8);
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = a2[1];

  uint64_t v8 = a3[6];
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE55BA0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      uint64_t v29 = sub_1E46A4E10();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 40))(v9, v10, v29);
      uint64_t v30 = *(int *)(v11 + 28);
      id v31 = &v9[v30];
      uint64_t v32 = &v10[v30];
      uint64_t v34 = *(void *)v32;
      uint64_t v33 = *((void *)v32 + 1);
      *(void *)id v31 = v34;
      *((void *)v31 + 1) = v33;
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    sub_1E466F30C((uint64_t)v9);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55AD8);
    memcpy(v9, v10, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v16 = sub_1E46A4E10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v9, v10, v16);
  *(_OWORD *)&v9[*(int *)(v11 + 28)] = *(_OWORD *)&v10[*(int *)(v11 + 28)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  uint64_t v18 = a3[7];
  int v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)((char *)a2 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  *int v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[8];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (void *)((char *)a2 + v23);
  uint64_t v27 = *v25;
  uint64_t v26 = v25[1];
  void *v24 = v27;
  v24[1] = v26;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1E466F700(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E466F714);
}

uint64_t sub_1E466F714(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55AD8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 28) + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_1E466F7E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E466F7F4);
}

uint64_t sub_1E466F7F4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55AD8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 24);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28) + _Block_object_dispose(&a9, 8) = (a2 - 1);
  }
  return result;
}

void sub_1E466F8BC()
{
  sub_1E466F960();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1E466F960()
{
  if (!qword_1EAE55AF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EAE55BA0);
    unint64_t v0 = sub_1E46A62B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAE55AF0);
    }
  }
}

BOOL sub_1E466F9BC(void *a1)
{
  uint64_t v2 = v1;
  sub_1E46A4AB0();
  uint64_t v4 = sub_1E46A5DD0();
  swift_release();
  unint64_t v5 = *(void *)(v4 + 16);
  swift_bridgeObjectRelease();
  BOOL v6 = v5 >= 2 && !objc_msgSend(a1, sel_sectionType) || objc_msgSend(a1, sel_sectionType) == (id)3;
  id v7 = objc_msgSend(v2, sel_image);

  if (!v7) {
    return 0;
  }
  id v8 = objc_msgSend(v2, sel_text_1);

  if (v8) {
    return 0;
  }
  id v9 = objc_msgSend(v2, sel_text_2);

  if (v9) {
    return 0;
  }
  return v6;
}

id sub_1E466FACC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id result = (id)sub_1E466F9BC(a1);
  if (result)
  {
    id v5 = objc_msgSend(a1, sel_sectionType);
    id result = objc_msgSend(self, sel_isSiri);
    if (result)
    {
      uint64_t v6 = 0x4028000000000000;
      double v7 = 28.0 - 12.0;
      if (v5 != (id)3)
      {
        uint64_t v8 = 0;
        uint64_t v9 = 0;
LABEL_10:
        uint64_t v11 = 0x4028000000000000;
        goto LABEL_11;
      }
    }
    else
    {
      if (v5 != (id)3)
      {
        uint64_t v8 = 0;
        uint64_t v9 = 0;
        double v7 = 24.0;
        uint64_t v6 = 0x4028000000000000;
        goto LABEL_10;
      }
      double v7 = 14.0;
    }
    uint64_t v8 = *MEMORY[0x1E4FB12A8];
    uint64_t v6 = *(void *)(MEMORY[0x1E4FB12A8] + 8);
    uint64_t v9 = *(void *)(MEMORY[0x1E4FB12A8] + 16);
    uint64_t v11 = *(void *)(MEMORY[0x1E4FB12A8] + 24);
LABEL_11:
    uint64_t v10 = 1;
    goto LABEL_12;
  }
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v6 = 0;
  uint64_t v10 = 2;
  uint64_t v11 = 0;
  double v7 = 0.0;
LABEL_12:
  *(void *)a2 = v10;
  *(void *)(a2 + _Block_object_dispose(&a9, 8) = v8;
  *(void *)(a2 + 16) = v6;
  *(void *)(a2 + 24) = v9;
  *(void *)(a2 + 32) = v11;
  *(double *)(a2 + 40) = v7;
  return result;
}

BOOL sub_1E466FBE4(void *a1)
{
  return sub_1E466F9BC(a1);
}

uint64_t sub_1E466FC0C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1E466FACC(a1, (uint64_t)v4);
  return sub_1E46709D4((uint64_t)v4, a2);
}

id sub_1E466FCC4()
{
  id result = objc_msgSend(v0, sel_cardSection);
  if (result)
  {
    uint64_t v2 = result;
    uint64_t ObjectType = swift_getObjectType();

    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99BC18);
    sub_1E46A6060();
    v7.receiver = v0;
    v7.super_class = (Class)type metadata accessor for SearchUIRFCardSectionRowModel();
    id v4 = objc_msgSendSuper2(&v7, sel_reuseIdentifier, ObjectType);
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = sub_1E46A6050();
    }
    else
    {
      uint64_t v6 = 0x3E6C696E3CLL;
    }
    sub_1E46A6090();
    sub_1E46A6090();
    swift_bridgeObjectRelease();
    return (id)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1E466FED8()
{
  id result = objc_msgSend(v0, sel_cardSection);
  if (result)
  {
    uint64_t v2 = result;
    unsigned int v3 = objc_msgSend(result, sel_separatorStyle);

    if (v3)
    {
      v6.receiver = v0;
      v6.super_class = (Class)type metadata accessor for SearchUIRFCardSectionRowModel();
      return objc_msgSendSuper2(&v6, sel_separatorStyle);
    }
    else
    {
      sub_1E46A5DC0();
      id v4 = objc_msgSend(v0, sel_cardSection);
      uint64_t v5 = sub_1E46A5D90();

      return (id)v5;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1E466FFCC()
{
  if (!objc_msgSend(v0, sel_cardSection)
    || (sub_1E4670934(), __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99BC40),
                         (swift_dynamicCast() & 1) == 0))
  {
    uint64_t v7 = 0;
    long long v5 = 0u;
    long long v6 = 0u;
    goto LABEL_6;
  }
  uint64_t v1 = *((void *)&v6 + 1);
  if (!*((void *)&v6 + 1))
  {
LABEL_6:
    sub_1E4670974((uint64_t)&v5);
    unsigned __int8 v3 = objc_msgSend(self, sel_fillsBackgroundWithContentForRowModel_, v0);
    return v3 & 1;
  }
  uint64_t v2 = v7;
  __swift_project_boxed_opaque_existential_1(&v5, *((uint64_t *)&v6 + 1));
  unsigned __int8 v3 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v2 + 8))(v0, v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
  return v3 & 1;
}

uint64_t sub_1E4670104(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  sub_1E46A5DC0();
  id v5 = a1;
  id v6 = objc_msgSend(v5, sel_cardSection);
  LOBYTE(a3) = a3();

  return a3 & 1;
}

uint64_t sub_1E46701B0(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(void *))
{
  sub_1E46A5DC0();
  id v6 = a3;
  LOBYTE(a4) = a4(a3);

  return a4 & 1;
}

uint64_t sub_1E467020C@<X0>(long long *a1@<X8>)
{
  id v3 = objc_msgSend(v1, sel_cardSection);
  if (!v3
    || (*(void *)&v16[0] = v3,
        sub_1E4670934(),
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99BC40),
        (swift_dynamicCast() & 1) == 0))
  {
    uint64_t v15 = 0;
    long long v13 = 0u;
    long long v14 = 0u;
    goto LABEL_6;
  }
  uint64_t v4 = *((void *)&v14 + 1);
  if (!*((void *)&v14 + 1))
  {
LABEL_6:
    uint64_t result = sub_1E4670974((uint64_t)&v13);
    long long v9 = xmmword_1E46B7280;
    long long v7 = 0uLL;
    long long v8 = 0uLL;
    goto LABEL_7;
  }
  uint64_t v5 = v15;
  __swift_project_boxed_opaque_existential_1(&v13, *((uint64_t *)&v14 + 1));
  (*(void (**)(_OWORD *__return_ptr, void *, uint64_t, uint64_t))(v5 + 16))(v16, v1, v4, v5);
  long long v11 = v16[1];
  long long v12 = v16[0];
  long long v10 = v16[2];
  uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)&v13);
  long long v8 = v10;
  long long v7 = v11;
  long long v9 = v12;
LABEL_7:
  *a1 = v9;
  a1[1] = v7;
  a1[2] = v8;
  return result;
}

id sub_1E4670578()
{
  return sub_1E46707A0(type metadata accessor for SearchUIRFCardSectionRowModel);
}

uint64_t type metadata accessor for SearchUIRFCardSectionRowModel()
{
  return self;
}

id sub_1E4670788()
{
  return sub_1E46707A0(type metadata accessor for SearchUIRFCardSectionRowModelProvider);
}

id sub_1E46707A0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for SearchUIRFCardSectionRowModelProvider()
{
  return self;
}

void sub_1E467080C(uint64_t a1, void *a2, void *a3, char a4, uint64_t a5)
{
  sub_1E4663474(a1, (uint64_t)v18);
  sub_1E46A5DF0();
  long long v11 = v5;
  swift_dynamicCast();
  *(void *)&v11[OBJC_IVAR___SearchUIRFCardSectionRowModel__builderContext] = v17;

  id v12 = a2;
  id v13 = a3;
  long long v14 = (void *)sub_1E46A6040();
  swift_bridgeObjectRelease();
  v16.receiver = v11;
  v16.super_class = (Class)type metadata accessor for SearchUIRFCardSectionRowModel();
  id v15 = objc_msgSendSuper2(&v16, sel_initWithResult_cardSection_isInline_queryId_itemIdentifier_, v12, v13, a4 & 1, a5, v14);

  if (v15) {
    __swift_destroy_boxed_opaque_existential_0(a1);
  }
  else {
    __break(1u);
  }
}

unint64_t sub_1E4670934()
{
  unint64_t result = qword_1EB99BB90;
  if (!qword_1EB99BB90)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB99BB90);
  }
  return result;
}

uint64_t sub_1E4670974(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB99BC70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E46709D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99BC48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
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

uint64_t getEnumTagSinglePayload for CustomizedHighlightSettings(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[48]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for CustomizedHighlightSettings(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + _Block_object_dispose(&a9, 8) = 0u;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 4_Block_object_dispose(&a9, 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 4_Block_object_dispose(&a9, 8) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CustomizedHighlightSettings()
{
  return &type metadata for CustomizedHighlightSettings;
}

uint64_t destroy for SearchUIUserReportRequestSelectorSection(uint64_t a1)
{
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for SearchUIUserReportRequestSelectorSection(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = v3;
  int v5 = *(void **)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v4;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 4_Block_object_dispose(&a9, 8) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v8 = *(void *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 8_Block_object_dispose(&a9, 8) = v8;
  sub_1E46A4AB0();
  sub_1E46A4AB0();
  id v9 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1E46A4AB0();
  return a1;
}

void *assignWithCopy for SearchUIUserReportRequestSelectorSection(void *a1, void *a2)
{
  *a1 = *a2;
  sub_1E46A4AB0();
  swift_release();
  a1[1] = a2[1];
  sub_1E46A4AB0();
  swift_release();
  uint64_t v4 = (void *)a1[2];
  int v5 = (void *)a2[2];
  a1[2] = v5;
  id v6 = v5;

  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[11];
  a1[10] = a2[10];
  a1[11] = v7;
  sub_1E46A4AB0();
  swift_release();
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 4_Block_object_dispose(&a9, 8) = v4;
  return result;
}

uint64_t assignWithTake for SearchUIUserReportRequestSelectorSection(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  long long v4 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 4_Block_object_dispose(&a9, 8) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchUIUserReportRequestSelectorSection(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SearchUIUserReportRequestSelectorSection(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8_Block_object_dispose(&a9, 8) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + _Block_object_dispose(&a9, 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
      *(void *)(result + _Block_object_dispose(&a9, 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SearchUIUserReportRequestSelectorSection()
{
  return &type metadata for SearchUIUserReportRequestSelectorSection;
}

uint64_t sub_1E4670E9C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1E4670EB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v54 = a1;
  uint64_t v55 = sub_1E46A52A0();
  uint64_t v53 = *(void *)(v55 - 8);
  MEMORY[0x1F4188790](v55);
  unsigned int v52 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_1E46A51C0();
  uint64_t v4 = *(void *)(v49 - 8);
  MEMORY[0x1F4188790](v49);
  uint64_t v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55B08);
  MEMORY[0x1F4188790](v46);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55B10);
  uint64_t v48 = *(void *)(v47 - 8);
  MEMORY[0x1F4188790](v47);
  uint64_t v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55B18);
  uint64_t v50 = *(void *)(v9 - 8);
  uint64_t v51 = v9;
  MEMORY[0x1F4188790](v9);
  unsigned int v45 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = v2;
  uint64_t v11 = *(void *)(v2 + 32);
  uint64_t v59 = *(void *)(v2 + 24);
  uint64_t v60 = v11;
  sub_1E46719E4();
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_1E46A57A0();
  uint64_t v14 = v13;
  char v16 = v15;
  uint64_t v18 = v17;
  char v19 = sub_1E46A5720();
  sub_1E46A51A0();
  uint64_t v59 = v12;
  uint64_t v60 = v14;
  char v61 = v16 & 1;
  uint64_t v62 = v18;
  char v63 = v19;
  uint64_t v64 = v20;
  uint64_t v65 = v21;
  uint64_t v66 = v22;
  uint64_t v67 = v23;
  char v68 = 0;
  sub_1E46716FC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55B20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55B28);
  sub_1E4671A38();
  sub_1E46671BC(&qword_1EAE55B38, &qword_1EAE55B28);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE55B40);
  unint64_t v25 = sub_1E4671AAC();
  uint64_t v57 = v24;
  unint64_t v58 = v25;
  swift_getOpaqueTypeConformance2();
  sub_1E46A5A10();
  uint64_t v26 = v49;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E4F3C538], v49);
  sub_1E4671B4C();
  uint64_t v27 = v45;
  uint64_t v28 = v47;
  sub_1E46A5820();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v26);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v8, v28);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v30 = (_OWORD *)swift_allocObject();
  long long v31 = *(_OWORD *)(v2 + 48);
  v30[3] = *(_OWORD *)(v2 + 32);
  v30[4] = v31;
  long long v32 = *(_OWORD *)(v2 + 80);
  v30[5] = *(_OWORD *)(v2 + 64);
  v30[6] = v32;
  long long v33 = *(_OWORD *)(v2 + 16);
  v30[1] = *(_OWORD *)v2;
  v30[2] = v33;
  sub_1E4671D0C(v2);
  uint64_t v34 = v52;
  sub_1E46A5290();
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55B68);
  uint64_t v36 = v54;
  id v37 = (uint64_t *)(v54 + *(int *)(v35 + 36));
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55B70);
  uint64_t v39 = v53;
  uint64_t v40 = v55;
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))((char *)v37 + *(int *)(v38 + 28), v34, v55);
  *id v37 = KeyPath;
  uint64_t v42 = v50;
  uint64_t v41 = v51;
  (*(void (**)(uint64_t, char *, uint64_t))(v50 + 16))(v36, v27, v51);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v34, v40);
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v27, v41);
}

void sub_1E467144C(long long *a1@<X0>, void *a2@<X8>)
{
  long long v14 = *a1;
  uint64_t v15 = *((void *)a1 + 2);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55B78);
  sub_1E46A59C0();
  uint64_t v5 = v16;
  uint64_t v6 = v17;
  id v7 = v18;
  swift_getKeyPath();
  unint64_t v8 = *((void *)a1 + 9);
  swift_getKeyPath();
  id v13 = v18;
  swift_bridgeObjectRetain();
  sub_1E46A4AB0();
  sub_1E46A4AB0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55B80);
  uint64_t v9 = sub_1E46A6460();
  swift_release();
  sub_1E46A4AB0();
  unint64_t v10 = sub_1E4672014(v8);
  swift_bridgeObjectRelease();
  swift_release();
  sub_1E46A4AB0();
  swift_bridgeObjectRetain();
  MEMORY[0x1E4E82FB0](&v14, v4);
  uint64_t v11 = (void *)v14;
  if ((void)v14)
  {
    char v12 = sub_1E4671D9C(v14, v10);

    swift_bridgeObjectRelease();
    if (v12) {
      goto LABEL_6;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  *(void *)&long long v14 = 0;
  sub_1E46A59A0();
LABEL_6:
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  *a2 = v5;
  a2[1] = v6;
  a2[2] = v7;
  a2[3] = v9;
  a2[4] = v10;
  a2[5] = 0x72616D6B63656863;
  a2[6] = 0xE90000000000006BLL;
}

void sub_1E4671624(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_name);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_1E46A6050();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_1E467168C(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v3 = sub_1E46A6040();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setName_);
}

uint64_t sub_1E46716FC()
{
  uint64_t v0 = sub_1E46A54F0();
  MEMORY[0x1F4188790](v0 - 8);
  sub_1E46A54E0();
  sub_1E46A54D0();
  sub_1E46A54C0();
  sub_1E46A54D0();
  sub_1E46A54C0();
  sub_1E46A54D0();
  sub_1E46A5500();
  uint64_t v1 = sub_1E46A5790();
  uint64_t v3 = v2;
  char v5 = v4 & 1;
  sub_1E46A58A0();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55B40);
  sub_1E4671AAC();
  sub_1E46A5800();
  sub_1E4671FC4(v1, v3, v5);
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E46718AC(uint64_t a1)
{
  uint64_t v2 = sub_1E46A52A0();
  MEMORY[0x1F4188790](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1E46A5420();
}

uint64_t sub_1E467197C()
{
  return sub_1E46A5810();
}

uint64_t sub_1E4671998@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4670EB8(a1);
}

void sub_1E46719DC(void *a1@<X8>)
{
  sub_1E467144C(*(long long **)(v1 + 16), a1);
}

unint64_t sub_1E46719E4()
{
  unint64_t result = qword_1EAE53540;
  if (!qword_1EAE53540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE53540);
  }
  return result;
}

unint64_t sub_1E4671A38()
{
  unint64_t result = qword_1EAE55B30;
  if (!qword_1EAE55B30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE55B20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE55B30);
  }
  return result;
}

unint64_t sub_1E4671AAC()
{
  unint64_t result = qword_1EAE55B48;
  if (!qword_1EAE55B48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE55B40);
    sub_1E46671BC(&qword_1EAE55B50, &qword_1EAE55B58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE55B48);
  }
  return result;
}

unint64_t sub_1E4671B4C()
{
  unint64_t result = qword_1EAE55B60;
  if (!qword_1EAE55B60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE55B10);
    sub_1E4671A38();
    sub_1E46671BC(&qword_1EAE55B38, &qword_1EAE55B28);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE55B40);
    sub_1E4671AAC();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE55B60);
  }
  return result;
}

uint64_t sub_1E4671C34()
{
  return sub_1E46A5410();
}

uint64_t sub_1E4671C5C()
{
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 112, 7);
}

uint64_t sub_1E4671CCC()
{
  uint64_t v1 = (*(uint64_t (**)(void))(v0 + 96))();
  return off_1F40F8598(v1);
}

uint64_t sub_1E4671D0C(uint64_t a1)
{
  id v2 = *(id *)(a1 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1E46A4AB0();
  sub_1E46A4AB0();
  sub_1E46A4AB0();
  return a1;
}

uint64_t sub_1E4671D9C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_1E46A6440())
  {
    unint64_t v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      id v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      id v5 = (id)MEMORY[0x1E4E83990](0, a2);
LABEL_5:
      uint64_t v6 = v5;
      sub_1E4672170();
      char v7 = sub_1E46A62A0();

      if (v7)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1) {
        goto LABEL_18;
      }
      if (v4) {
        break;
      }
      unint64_t v4 = 5;
      while (1)
      {
        unint64_t v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1)) {
          break;
        }
        id v13 = *(id *)(a2 + 8 * v4);
        char v14 = sub_1E46A62A0();

        if (v14) {
          goto LABEL_6;
        }
        ++v4;
        if (v12 == v3) {
          goto LABEL_18;
        }
      }
      __break(1u);
    }
    uint64_t v9 = 1;
    while (1)
    {
      MEMORY[0x1E4E83990](v9, a2);
      uint64_t v10 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        break;
      }
      char v11 = sub_1E46A62A0();
      swift_unknownObjectRelease();
      if (v11) {
        goto LABEL_6;
      }
      ++v9;
      if (v10 == v3) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1E4671F14@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1E46A5450();
  *a1 = result;
  return result;
}

uint64_t sub_1E4671F40@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1E46A5450();
  *a1 = result;
  return result;
}

uint64_t sub_1E4671F6C()
{
  return sub_1E46A5460();
}

uint64_t sub_1E4671F98()
{
  return sub_1E46A5460();
}

uint64_t sub_1E4671FC4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

char *keypath_get_selector_name()
{
  return sel_name;
}

uint64_t sub_1E4671FE8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = a1[1];
  if (v3)
  {
    *a2 = *a1;
    a2[1] = v3;
  }
  else
  {
    *a2 = 0;
    a2[1] = 0xE000000000000000;
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_1E4672014(unint64_t a1)
{
  uint64_t v9 = MEMORY[0x1E4FBC860];
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v4 = (id)MEMORY[0x1E4E83990](v3, a1);
LABEL_9:
        id v5 = v4;
        unint64_t v6 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_15;
        }
        swift_getAtKeyPath();
        if (v8)
        {
          swift_bridgeObjectRelease();
          sub_1E46A63D0();
          sub_1E46A6400();
          sub_1E46A6410();
          sub_1E46A63E0();
        }
        else
        {
        }
        ++v3;
        if (v6 == v2) {
          return v9;
        }
      }
      if (v3 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v2 = sub_1E46A6440();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    id v4 = *(id *)(a1 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x1E4FBC860];
}

unint64_t sub_1E4672170()
{
  unint64_t result = qword_1EAE53400;
  if (!qword_1EAE53400)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAE53400);
  }
  return result;
}

unint64_t sub_1E46721B4()
{
  unint64_t result = qword_1EAE55B88;
  if (!qword_1EAE55B88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE55B68);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE55B10);
    sub_1E4671B4C();
    swift_getOpaqueTypeConformance2();
    sub_1E46671BC((unint64_t *)&unk_1EAE55B90, &qword_1EAE55B70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE55B88);
  }
  return result;
}

char *sub_1E4672288(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  id v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    unint64_t v6 = &v4[(v3 + 16) & ~(unint64_t)v3];
    sub_1E46A4AB0();
  }
  else
  {
    unint64_t v6 = a1;
    char v7 = a2[1];
    uint64_t v8 = a2[2];
    *((void *)a1 + 1) = v7;
    *((void *)a1 + 2) = v8;
    uint64_t v9 = a2[3];
    *((void *)a1 + 3) = v9;
    uint64_t v10 = *(int *)(a3 + 32);
    char v11 = &a1[v10];
    uint64_t v12 = (uint64_t)a2 + v10;
    id v13 = *(char **)((char *)a2 + v10);
    char v14 = *(char **)((char *)a2 + v10 + 8);
    *(void *)char v11 = v13;
    *((void *)v11 + 1) = v14;
    uint64_t v15 = type metadata accessor for SearchUIUserReportModel();
    uint64_t v16 = *(int *)(v15 + 24);
    uint64_t v46 = v11;
    __dst = &v11[v16];
    uint64_t v48 = v15;
    uint64_t v17 = (char *)(v12 + v16);
    id v18 = v4;
    char v19 = v7;
    swift_unknownObjectRetain();
    uint64_t v20 = v9;
    id v21 = v13;
    id v22 = v14;
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE55BA0);
    uint64_t v24 = *(void *)(v23 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v17, 1, v23))
    {
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55AD8);
      memcpy(__dst, v17, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      uint64_t v26 = sub_1E46A4E10();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(__dst, v17, v26);
      uint64_t v27 = *(int *)(v23 + 28);
      uint64_t v28 = &__dst[v27];
      uint64_t v29 = &v17[v27];
      uint64_t v30 = *((void *)v29 + 1);
      *(void *)uint64_t v28 = *(void *)v29;
      *((void *)v28 + 1) = v30;
      long long v31 = *(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56);
      swift_bridgeObjectRetain();
      v31(__dst, 0, 1, v23);
    }
    uint64_t v32 = *(int *)(v48 + 28);
    long long v33 = (void *)((char *)v46 + v32);
    uint64_t v34 = (void *)(v12 + v32);
    uint64_t v35 = v34[1];
    void *v33 = *v34;
    v33[1] = v35;
    uint64_t v36 = *(int *)(v48 + 32);
    id v37 = (void *)((char *)v46 + v36);
    uint64_t v38 = (void *)(v12 + v36);
    uint64_t v39 = v38[1];
    *id v37 = *v38;
    v37[1] = v39;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB0);
    *(void *)((char *)v46 + *(int *)(v40 + 28)) = *(void *)(v12 + *(int *)(v40 + 28));
    uint64_t v41 = *(int *)(a3 + 36);
    uint64_t v42 = &v6[v41];
    id v43 = (char **)((char *)a2 + v41);
    sub_1E46A4AB0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v44 = sub_1E46A5270();
      (*(void (**)(char *, void *, uint64_t))(*(void *)(v44 - 8) + 16))(v42, v43, v44);
    }
    else
    {
      *(void *)uint64_t v42 = *v43;
      sub_1E46A4AB0();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v6;
}

uint64_t sub_1E4672588(id *a1, uint64_t a2)
{
  swift_unknownObjectRelease();
  id v4 = (id *)((char *)a1 + *(int *)(a2 + 32));

  id v5 = (char *)v4 + *(int *)(type metadata accessor for SearchUIUserReportModel() + 24);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE55BA0);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6))
  {
    uint64_t v7 = sub_1E46A4E10();
    (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v5, v7);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB0);
  swift_release();
  uint64_t v8 = (char *)a1 + *(int *)(a2 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_1E46A5270();
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8);
    return v10(v8, v9);
  }
  else
  {
    return swift_release();
  }
}

void *sub_1E4672764(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(void **)a2;
  id v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v6 = *(void **)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v6;
  uint64_t v7 = *(int *)(a3 + 32);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = a2 + v7;
  char v11 = *(void **)(a2 + v7);
  uint64_t v10 = *(void **)(a2 + v7 + 8);
  *uint64_t v8 = v11;
  v8[1] = v10;
  uint64_t v12 = type metadata accessor for SearchUIUserReportModel();
  uint64_t v13 = *(int *)(v12 + 24);
  __dst = (char *)v8 + v13;
  uint64_t v44 = v12;
  char v14 = (char *)(v9 + v13);
  id v15 = v5;
  id v16 = v4;
  swift_unknownObjectRetain();
  id v17 = v6;
  id v18 = v11;
  id v19 = v10;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE55BA0);
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v14, 1, v20))
  {
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55AD8);
    memcpy(__dst, v14, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    uint64_t v23 = sub_1E46A4E10();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(__dst, v14, v23);
    uint64_t v24 = *(int *)(v20 + 28);
    uint64_t v25 = &__dst[v24];
    uint64_t v26 = &v14[v24];
    uint64_t v27 = *((void *)v26 + 1);
    *(void *)uint64_t v25 = *(void *)v26;
    *((void *)v25 + 1) = v27;
    uint64_t v28 = *(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56);
    swift_bridgeObjectRetain();
    v28(__dst, 0, 1, v20);
  }
  uint64_t v29 = *(int *)(v44 + 28);
  uint64_t v30 = (void *)((char *)v8 + v29);
  long long v31 = (void *)(v9 + v29);
  uint64_t v32 = v31[1];
  void *v30 = *v31;
  v30[1] = v32;
  uint64_t v33 = *(int *)(v44 + 32);
  uint64_t v34 = (void *)((char *)v8 + v33);
  uint64_t v35 = (void *)(v9 + v33);
  uint64_t v36 = v35[1];
  *uint64_t v34 = *v35;
  v34[1] = v36;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB0);
  *(void *)((char *)v8 + *(int *)(v37 + 28)) = *(void *)(v9 + *(int *)(v37 + 28));
  uint64_t v38 = *(int *)(a3 + 36);
  uint64_t v39 = (void *)((char *)a1 + v38);
  uint64_t v40 = (void *)(a2 + v38);
  sub_1E46A4AB0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v41 = sub_1E46A5270();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v41 - 8) + 16))(v39, v40, v41);
  }
  else
  {
    *uint64_t v39 = *v40;
    sub_1E46A4AB0();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_1E46729FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  uint64_t v9 = *(void **)(a2 + 8);
  uint64_t v10 = *(void **)(a1 + 8);
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = v9;
  id v11 = v9;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v12 = *(void **)(a2 + 24);
  uint64_t v13 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v12;
  id v14 = v12;

  uint64_t v54 = a3;
  uint64_t v15 = *(int *)(a3 + 32);
  id v16 = (void *)(a1 + v15);
  uint64_t v56 = a2;
  uint64_t v17 = a2 + v15;
  id v18 = *(void **)(a1 + v15);
  id v19 = *(void **)(a2 + v15);
  *id v16 = v19;
  id v20 = v19;

  uint64_t v21 = (void *)v16[1];
  uint64_t v22 = *(void **)(v17 + 8);
  v16[1] = v22;
  id v23 = v22;

  uint64_t v55 = (int *)type metadata accessor for SearchUIUserReportModel();
  uint64_t v24 = v55[6];
  uint64_t v25 = (char *)v16 + v24;
  uint64_t v26 = (char *)(v17 + v24);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE55BA0);
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
  int v30 = v29(v25, 1, v27);
  int v31 = v29(v26, 1, v27);
  if (v30)
  {
    if (!v31)
    {
      uint64_t v32 = sub_1E46A4E10();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16))(v25, v26, v32);
      uint64_t v33 = *(int *)(v27 + 28);
      uint64_t v34 = &v25[v33];
      uint64_t v35 = &v26[v33];
      *(void *)uint64_t v34 = *(void *)v35;
      *((void *)v34 + 1) = *((void *)v35 + 1);
      uint64_t v36 = *(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56);
      swift_bridgeObjectRetain();
      v36(v25, 0, 1, v27);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v31)
  {
    sub_1E4666020((uint64_t)v25, (uint64_t *)&unk_1EAE55BA0);
LABEL_6:
    uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55AD8);
    memcpy(v25, v26, *(void *)(*(void *)(v37 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v50 = sub_1E46A4E10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 24))(v25, v26, v50);
  uint64_t v51 = *(int *)(v27 + 28);
  unsigned int v52 = &v25[v51];
  uint64_t v53 = &v26[v51];
  *(void *)unsigned int v52 = *(void *)v53;
  *((void *)v52 + 1) = *((void *)v53 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_7:
  uint64_t v38 = v55[7];
  uint64_t v39 = (void *)((char *)v16 + v38);
  uint64_t v40 = (void *)(v17 + v38);
  *uint64_t v39 = *v40;
  v39[1] = v40[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v41 = v55[8];
  uint64_t v42 = (void *)((char *)v16 + v41);
  id v43 = (void *)(v17 + v41);
  void *v42 = *v43;
  v42[1] = v43[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB0);
  *(void *)((char *)v16 + *(int *)(v44 + 28)) = *(void *)(v17 + *(int *)(v44 + 28));
  sub_1E46A4AB0();
  swift_release();
  if (a1 != v56)
  {
    uint64_t v45 = *(int *)(v54 + 36);
    uint64_t v46 = (void *)(a1 + v45);
    uint64_t v47 = (void *)(v56 + v45);
    sub_1E4666020(a1 + v45, &qword_1EAE55BB8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v48 = sub_1E46A5270();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v48 - 8) + 16))(v46, v47, v48);
    }
    else
    {
      void *v46 = *v47;
      sub_1E46A4AB0();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_1E4672DD8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 32);
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  *(_OWORD *)((char *)a1 + v7) = *(_OWORD *)((char *)a2 + v7);
  uint64_t v10 = (int *)type metadata accessor for SearchUIUserReportModel();
  uint64_t v11 = v10[6];
  uint64_t v12 = &v8[v11];
  uint64_t v13 = &v9[v11];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE55BA0);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55AD8);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    uint64_t v17 = sub_1E46A4E10();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v12, v13, v17);
    *(_OWORD *)&v12[*(int *)(v14 + 28)] = *(_OWORD *)&v13[*(int *)(v14 + 28)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  *(_OWORD *)&v8[v10[7]] = *(_OWORD *)&v9[v10[7]];
  *(_OWORD *)&v8[v10[8]] = *(_OWORD *)&v9[v10[8]];
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB0);
  *(void *)&v8[*(int *)(v18 + 28)] = *(void *)&v9[*(int *)(v18 + 28)];
  uint64_t v19 = *(int *)(a3 + 36);
  id v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v23 = sub_1E46A5270();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v20, v21, v23);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
  }
  return a1;
}

void **sub_1E4673020(void **a1, void **a2, uint64_t a3)
{
  long long v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = a1[1];
  a1[1] = a2[1];

  a1[2] = a2[2];
  swift_unknownObjectRelease();
  id v8 = a1[3];
  a1[3] = a2[3];

  uint64_t v9 = *(int *)(a3 + 32);
  uint64_t v10 = (void **)((char *)a1 + v9);
  uint64_t v11 = (void **)((char *)a2 + v9);
  uint64_t v12 = *(void **)((char *)a1 + v9);
  *uint64_t v10 = *v11;

  uint64_t v13 = (void *)v10[1];
  v10[1] = v11[1];

  uint64_t v48 = (int *)type metadata accessor for SearchUIUserReportModel();
  uint64_t v14 = v48[6];
  uint64_t v15 = (char *)v10 + v14;
  uint64_t v16 = (char *)v11 + v14;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE55BA0);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  uint64_t v47 = (uint64_t)v15;
  LODWORD(v15) = v19(v15, 1, v17);
  int v20 = v19(v16, 1, v17);
  if (v15)
  {
    if (v20)
    {
      size_t v21 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55AD8) - 8) + 64);
      uint64_t v22 = (void *)v47;
LABEL_6:
      memcpy(v22, v16, v21);
      goto LABEL_9;
    }
    uint64_t v23 = sub_1E46A4E10();
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v47, v16, v23);
    *(_OWORD *)(v47 + *(int *)(v17 + 28)) = *(_OWORD *)&v16[*(int *)(v17 + 28)];
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56))(v47, 0, 1, v17);
  }
  else
  {
    if (v20)
    {
      sub_1E4666020(v47, (uint64_t *)&unk_1EAE55BA0);
      size_t v21 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55AD8) - 8) + 64);
      uint64_t v22 = (void *)v47;
      goto LABEL_6;
    }
    uint64_t v24 = sub_1E46A4E10();
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v24 - 8) + 40))(v47, v16, v24);
    uint64_t v25 = *(int *)(v17 + 28);
    uint64_t v26 = (void *)(v47 + v25);
    uint64_t v27 = &v16[v25];
    uint64_t v29 = *(void *)v27;
    uint64_t v28 = *((void *)v27 + 1);
    *uint64_t v26 = v29;
    v26[1] = v28;
    swift_bridgeObjectRelease();
  }
LABEL_9:
  uint64_t v30 = v48[7];
  int v31 = (void *)((char *)v10 + v30);
  uint64_t v32 = (void *)((char *)v11 + v30);
  uint64_t v34 = *v32;
  uint64_t v33 = v32[1];
  *int v31 = v34;
  v31[1] = v33;
  swift_bridgeObjectRelease();
  uint64_t v35 = v48[8];
  uint64_t v36 = (void *)((char *)v10 + v35);
  uint64_t v37 = (void *)((char *)v11 + v35);
  uint64_t v39 = *v37;
  uint64_t v38 = v37[1];
  *uint64_t v36 = v39;
  v36[1] = v38;
  swift_bridgeObjectRelease();
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB0);
  *(void *)((char *)v10 + *(int *)(v40 + 28)) = *(void *)((char *)v11 + *(int *)(v40 + 28));
  swift_release();
  if (a1 != a2)
  {
    uint64_t v41 = *(int *)(a3 + 36);
    uint64_t v42 = (char *)a1 + v41;
    id v43 = (char *)a2 + v41;
    sub_1E4666020((uint64_t)a1 + v41, &qword_1EAE55BB8);
    uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v45 = sub_1E46A5270();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 32))(v42, v43, v45);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v42, v43, *(void *)(*(void *)(v44 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1E46733D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E46733EC);
}

uint64_t sub_1E46733EC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)a1 + *(int *)(a3 + 32);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE55BC0);
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)a1 + *(int *)(a3 + 36);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_1E4673520(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E4673534);
}

void *sub_1E4673534(void *result, uint64_t a2, int a3, uint64_t a4)
{
  id v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 32);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE55BC0);
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)v5 + *(int *)(a4 + 36);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t type metadata accessor for SearchUIUserReportRequestView()
{
  uint64_t result = qword_1EAE55BD0;
  if (!qword_1EAE55BD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1E46736B4()
{
  sub_1E46737F8(319, &qword_1EAE55BE0, (uint64_t (*)(uint64_t))type metadata accessor for SearchUIUserReportModel, MEMORY[0x1E4F3ECC8]);
  if (v0 <= 0x3F)
  {
    sub_1E46737F8(319, (unint64_t *)&unk_1EAE55BE8, MEMORY[0x1E4F3C820], MEMORY[0x1E4F3C648]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_1E46737F8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1E467385C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1E4673878@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v89 = a2;
  uint64_t v3 = sub_1E46A61C0();
  uint64_t v87 = *(void *)(v3 - 8);
  uint64_t v88 = v3;
  MEMORY[0x1F4188790](v3);
  v86 = (char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = type metadata accessor for SearchUIUserReportRequestView();
  uint64_t v83 = *(void *)(v81 - 8);
  MEMORY[0x1F4188790](v81);
  uint64_t v84 = v5;
  uint64_t v85 = (uint64_t)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55C60);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v82 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55C68);
  MEMORY[0x1F4188790](v80);
  id v79 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_1E46A5490();
  uint64_t v68 = *(void *)(v69 - 8);
  MEMORY[0x1F4188790](v69);
  uint64_t v67 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1E46A55E0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55C28);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)&v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55C20);
  uint64_t v62 = *(void *)(v65 - 8);
  MEMORY[0x1F4188790](v65);
  uint64_t v19 = (char *)&v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55C10);
  uint64_t v66 = *(void *)(v70 - 8);
  MEMORY[0x1F4188790](v70);
  char v63 = (char *)&v62 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55C08);
  uint64_t v73 = *(void *)(v74 - 8);
  MEMORY[0x1F4188790](v74);
  uint64_t v71 = (char *)&v62 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55C70);
  uint64_t v77 = *(void *)(v78 - 8);
  MEMORY[0x1F4188790](v78);
  uint64_t v76 = (char *)&v62 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BF8);
  MEMORY[0x1F4188790](v72);
  unint64_t v75 = (char *)&v62 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55C78);
  sub_1E46671BC(&qword_1EAE55C80, &qword_1EAE55C78);
  sub_1E46A5780();
  sub_1E46A55D0();
  uint64_t v24 = sub_1E46671BC((unint64_t *)&unk_1EAE55C30, &qword_1EAE55C28);
  sub_1E46A5880();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  uint64_t v64 = a1;
  id v25 = objc_msgSend(*(id *)(a1 + 8), sel_title);
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = sub_1E46A6050();
    unint64_t v29 = v28;
  }
  else
  {
    uint64_t v27 = 0;
    unint64_t v29 = 0xE000000000000000;
  }
  uint64_t v95 = v27;
  unint64_t v96 = v29;
  uint64_t v30 = v68;
  int v31 = v67;
  uint64_t v32 = v69;
  (*(void (**)(char *, void, uint64_t))(v68 + 104))(v67, *MEMORY[0x1E4F3D320], v69);
  uint64_t v91 = v14;
  uint64_t v92 = v10;
  uint64_t v93 = v24;
  unint64_t v94 = MEMORY[0x1E4F3D8F0];
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v34 = sub_1E46719E4();
  uint64_t v35 = MEMORY[0x1E4FBB1A0];
  uint64_t v36 = v63;
  uint64_t v37 = v65;
  sub_1E46A5830();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v32);
  swift_bridgeObjectRelease();
  uint64_t v38 = (*(uint64_t (**)(char *, uint64_t))(v62 + 8))(v19, v37);
  MEMORY[0x1F4188790](v38);
  uint64_t v39 = v64;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55C18);
  uint64_t v91 = v37;
  uint64_t v92 = v35;
  uint64_t v93 = OpaqueTypeConformance2;
  unint64_t v94 = v34;
  uint64_t v41 = swift_getOpaqueTypeConformance2();
  uint64_t v42 = sub_1E46671BC(&qword_1EAE55C40, &qword_1EAE55C18);
  id v43 = v71;
  uint64_t v44 = v70;
  sub_1E46A5860();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v36, v44);
  uint64_t v45 = v39;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB0);
  uint64_t v46 = (uint64_t)v79;
  sub_1E46A5950();
  swift_getKeyPath();
  uint64_t v47 = (uint64_t)v82;
  sub_1E46A59B0();
  swift_release();
  sub_1E4666020(v46, &qword_1EAE55C68);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE55BA0);
  uint64_t v91 = v44;
  uint64_t v92 = v40;
  uint64_t v93 = v41;
  unint64_t v94 = v42;
  swift_getOpaqueTypeConformance2();
  sub_1E46671BC(&qword_1EAE55C48, (uint64_t *)&unk_1EAE55BA0);
  sub_1E4676320();
  uint64_t v48 = v76;
  uint64_t v49 = v74;
  sub_1E46A5850();
  sub_1E4666020(v47, &qword_1EAE55C60);
  (*(void (**)(char *, uint64_t))(v73 + 8))(v43, v49);
  uint64_t v50 = v85;
  sub_1E4676668(v45, v85, (uint64_t (*)(void))type metadata accessor for SearchUIUserReportRequestView);
  unint64_t v51 = (*(unsigned __int8 *)(v83 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v83 + 80);
  uint64_t v52 = swift_allocObject();
  sub_1E46763E0(v50, v52 + v51);
  uint64_t v53 = v86;
  sub_1E46A61A0();
  uint64_t v54 = (uint64_t)v75;
  uint64_t v55 = &v75[*(int *)(v72 + 36)];
  uint64_t v56 = sub_1E46A52B0();
  uint64_t v58 = v87;
  uint64_t v57 = v88;
  (*(void (**)(char *, char *, uint64_t))(v87 + 16))(&v55[*(int *)(v56 + 20)], v53, v88);
  *(void *)uint64_t v55 = &unk_1EAE55C90;
  *((void *)v55 + 1) = v52;
  uint64_t v59 = v77;
  uint64_t v60 = v78;
  (*(void (**)(uint64_t, char *, uint64_t))(v77 + 16))(v54, v48, v78);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v53, v57);
  (*(void (**)(char *, uint64_t))(v59 + 8))(v48, v60);
  return sub_1E4676510(v54, v89);
}

void sub_1E4674410(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for SearchUIUserReportModel();
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for SearchUIUserReportRequestView();
  uint64_t v8 = v7 - 8;
  uint64_t v61 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v61 + 64);
  uint64_t v10 = MEMORY[0x1F4188790](v7);
  uint64_t v67 = (uint64_t)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (id *)((char *)&v57 - v11);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55C68);
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1 + *(int *)(v8 + 40);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB0);
  uint64_t v66 = v16;
  sub_1E46A5950();
  swift_getKeyPath();
  sub_1E46A59B0();
  swift_release();
  sub_1E4666020((uint64_t)v15, &qword_1EAE55C68);
  uint64_t v62 = v69;
  uint64_t v63 = v68;
  uint64_t v64 = v70;
  uint64_t v17 = *(void **)(a1 + 8);
  id v18 = objc_msgSend(v17, sel_reportOptionsSectionTitle);
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v59 = sub_1E46A6050();
    unint64_t v60 = v20;
  }
  else
  {
    uint64_t v59 = 0;
    unint64_t v60 = 0xE000000000000000;
  }
  id v21 = objc_msgSend(v17, sel_disclaimerText);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v58 = sub_1E46A6050();
    unint64_t v24 = v23;
  }
  else
  {
    uint64_t v58 = 0;
    unint64_t v24 = 0xE000000000000000;
  }
  id v25 = self;
  uint64_t v26 = (void *)sub_1E46A6040();
  id v27 = objc_msgSend(v25, sel_linkWithBundleIdentifier_, v26);

  if (v27
    && (id v28 = objc_msgSend(v27, sel_flow),
        v27,
        id v29 = objc_msgSend(v28, sel_localizedButtonTitle),
        v28,
        v29))
  {
    uint64_t v30 = sub_1E46A6050();
    unint64_t v32 = v31;

    sub_1E4676668(a1, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for SearchUIUserReportRequestView);
    if (v32) {
      goto LABEL_16;
    }
  }
  else
  {
    sub_1E4676668(a1, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for SearchUIUserReportRequestView);
  }
  id v33 = objc_msgSend(v12[1], sel_disclaimerLearnMorePunchout);
  if (v33 && (unint64_t v34 = v33, v35 = objc_msgSend(v33, sel_name), v34, v35))
  {
    uint64_t v30 = sub_1E46A6050();
    unint64_t v32 = v36;
  }
  else
  {
    uint64_t v30 = 0;
    unint64_t v32 = 0xE000000000000000;
  }
LABEL_16:
  sub_1E46767B4((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for SearchUIUserReportRequestView);
  id v37 = objc_msgSend(*(id *)(a1 + 8), sel_userReportOptions);
  if (v37)
  {
    uint64_t v38 = v37;
    sub_1E4672170();
    uint64_t v39 = sub_1E46A6110();
  }
  else
  {
    uint64_t v39 = MEMORY[0x1E4FBC860];
  }
  uint64_t v40 = v61;
  uint64_t v41 = v67;
  sub_1E4676668(a1, v67, (uint64_t (*)(void))type metadata accessor for SearchUIUserReportRequestView);
  unint64_t v42 = (*(unsigned __int8 *)(v40 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
  uint64_t v43 = swift_allocObject();
  sub_1E46763E0(v41, v43 + v42);
  sub_1E46A5930();
  uint64_t v44 = (void *)*((void *)v6 + 1);
  id v45 = v44;
  sub_1E46767B4((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for SearchUIUserReportModel);
  id v46 = objc_msgSend(*(id *)(a1 + 8), sel_attachmentSectionTitle);
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = sub_1E46A6050();
    unint64_t v50 = v49;
  }
  else
  {
    uint64_t v48 = 0;
    unint64_t v50 = 0xE000000000000000;
  }
  uint64_t v51 = v59;
  unint64_t v52 = v60;
  uint64_t v53 = v64;
  uint64_t v54 = v62;
  uint64_t v55 = v58;
  *a2 = v63;
  a2[1] = v54;
  a2[2] = v53;
  a2[3] = v51;
  a2[4] = v52;
  a2[5] = v55;
  a2[6] = v24;
  a2[7] = v30;
  a2[8] = v32;
  a2[9] = v39;
  a2[10] = sub_1E4676A50;
  a2[11] = v43;
  a2[12] = v44;
  a2[13] = v48;
  a2[14] = v50;
  id v56 = v53;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

void sub_1E4674974()
{
  uint64_t v1 = type metadata accessor for SearchUIUserReportModel();
  MEMORY[0x1F4188790](v1);
  uint64_t v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB0);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55AD8);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (void *)v0[1];
  id v11 = objc_msgSend(v10, sel_disclaimerLearnMorePunchout);
  if (v11
    && (uint64_t v12 = v11,
        id v13 = objc_msgSend(v11, sel_bundleIdentifier),
        v12,
        v13))
  {
    uint64_t v14 = sub_1E46A6050();
    uint64_t v16 = v15;

    sub_1E46A4E00();
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE55BA0);
    id v18 = (uint64_t *)&v9[*(int *)(v17 + 28)];
    uint64_t *v18 = v14;
    v18[1] = v16;
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v9, 0, 1, v17);
    uint64_t v19 = type metadata accessor for SearchUIUserReportRequestView();
    sub_1E4676ACC((uint64_t)v0 + *(int *)(v19 + 32), (uint64_t)v6);
    sub_1E46A5930();
    sub_1E4676B34((uint64_t)v9, (uint64_t)&v3[*(int *)(v1 + 24)]);
    sub_1E46A5940();
    sub_1E4666020((uint64_t)v6, &qword_1EAE55BB0);
  }
  else
  {
    id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F9A290]), sel_init);
    id v20 = objc_msgSend(v10, sel_disclaimerLearnMorePunchout);
    objc_msgSend(v26, sel_setPunchout_, v20);

    id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F99FB0]), sel_init);
    objc_msgSend(v21, sel_setCommand_, v26);
    id v22 = objc_msgSend(self, sel_handlerForButton_rowModel_environment_, v21, *v0, v0[3]);
    if (v22)
    {
      id v23 = v22;
      objc_msgSend(v23, sel_executeWithTriggerEvent_, 2);
    }
    id v24 = v26;
  }
}

uint64_t sub_1E4674CA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55CA0);
  MEMORY[0x1F4188790](v21);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55CA8);
  uint64_t v5 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1E46A55A0();
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55CB0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E46A5580();
  uint64_t v24 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55CB8);
  sub_1E46671BC(&qword_1EAE55CC0, &qword_1EAE55CB8);
  sub_1E46A5200();
  sub_1E46A5590();
  uint64_t v23 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55CC8);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE55CD0);
  unint64_t v14 = sub_1E4676588();
  uint64_t v25 = v13;
  unint64_t v26 = v14;
  swift_getOpaqueTypeConformance2();
  sub_1E46A5200();
  uint64_t v15 = &v4[*(int *)(v21 + 48)];
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v4, v12, v9);
  uint64_t v16 = v15;
  uint64_t v17 = v20;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v16, v7, v20);
  sub_1E46A5550();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_1E4674FFC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SearchUIUserReportRequestView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = type metadata accessor for SearchUIUserReportModel();
  uint64_t v6 = v5 - 8;
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB0);
  sub_1E46A5930();
  uint64_t v9 = &v8[*(int *)(v6 + 36)];
  uint64_t v11 = *(void *)v9;
  uint64_t v10 = *((void *)v9 + 1);
  swift_bridgeObjectRetain();
  sub_1E46767B4((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for SearchUIUserReportModel);
  v15[0] = v11;
  v15[1] = v10;
  sub_1E4676668(a1, (uint64_t)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for SearchUIUserReportRequestView);
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v13 = swift_allocObject();
  sub_1E46763E0((uint64_t)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12);
  sub_1E46719E4();
  return sub_1E46A5970();
}

uint64_t sub_1E46751D0()
{
  uint64_t v0 = sub_1E46A5270();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SearchUIUserReportRequestView();
  sub_1E46775E0((uint64_t)v3);
  sub_1E46A5260();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1E46752B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v49 = a2;
  uint64_t v3 = type metadata accessor for SearchUIUserReportRequestView();
  uint64_t v46 = *(void *)(v3 - 8);
  uint64_t v4 = *(void *)(v46 + 64);
  MEMORY[0x1F4188790](v3);
  uint64_t v45 = (uint64_t)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for SearchUIUserReportModel();
  uint64_t v6 = v5 - 8;
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v44 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (uint64_t *)((char *)&v40 - v10);
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v40 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55CB8);
  uint64_t v42 = *(void *)(v14 - 8);
  uint64_t v43 = v14;
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55CD0);
  MEMORY[0x1F4188790](v41);
  id v18 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55CC8);
  uint64_t v48 = *(void *)(v40 - 8);
  MEMORY[0x1F4188790](v40);
  uint64_t v47 = (char *)&v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB0);
  sub_1E46A5930();
  uint64_t v20 = &v13[*(int *)(v6 + 40)];
  uint64_t v22 = *(void *)v20;
  uint64_t v21 = *((void *)v20 + 1);
  swift_bridgeObjectRetain();
  sub_1E46767B4((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for SearchUIUserReportModel);
  uint64_t v50 = v22;
  uint64_t v51 = v21;
  uint64_t v23 = v45;
  sub_1E4676668(a1, v45, (uint64_t (*)(void))type metadata accessor for SearchUIUserReportRequestView);
  unint64_t v24 = (*(unsigned __int8 *)(v46 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80);
  uint64_t v25 = (uint64_t)v44;
  uint64_t v26 = swift_allocObject();
  sub_1E46763E0(v23, v26 + v24);
  sub_1E46719E4();
  sub_1E46A5970();
  sub_1E46A5930();
  uint64_t v27 = *v11;
  sub_1E4676668((uint64_t)v11, v25, (uint64_t (*)(void))type metadata accessor for SearchUIUserReportModel);
  if (!v27)
  {
    sub_1E46767B4(v25, (uint64_t (*)(void))type metadata accessor for SearchUIUserReportModel);
    goto LABEL_5;
  }
  id v28 = *(void **)(v25 + 8);
  id v29 = v28;
  sub_1E46767B4(v25, (uint64_t (*)(void))type metadata accessor for SearchUIUserReportModel);
  if (!v28)
  {
LABEL_5:
    char v30 = 1;
    goto LABEL_6;
  }

  char v30 = 0;
LABEL_6:
  uint64_t v32 = v42;
  uint64_t v31 = v43;
  uint64_t v33 = v40;
  uint64_t v34 = v41;
  sub_1E46767B4((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for SearchUIUserReportModel);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v36 = swift_allocObject();
  *(unsigned char *)(v36 + 16) = v30;
  (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v18, v16, v31);
  id v37 = (uint64_t *)&v18[*(int *)(v34 + 36)];
  *id v37 = KeyPath;
  v37[1] = (uint64_t)sub_1E4676738;
  v37[2] = v36;
  (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v31);
  sub_1E4676588();
  uint64_t v38 = v47;
  sub_1E46A5840();
  sub_1E4666020((uint64_t)v18, &qword_1EAE55CD0);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v48 + 32))(v49, v38, v33);
}

void sub_1E46757B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1E46A5270();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for SearchUIUserReportModel();
  uint64_t v7 = MEMORY[0x1F4188790](v6 - 8);
  uint64_t v9 = (id *)((char *)v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = MEMORY[0x1F4188790](v7);
  uint64_t v12 = (char *)v32 - v11;
  MEMORY[0x1F4188790](v10);
  uint64_t v14 = (void *)((char *)v32 - v13);
  uint64_t v15 = *v0;
  id v16 = objc_msgSend(v15, sel_identifyingResult);
  if (!v16) {
    return;
  }
  id v34 = v16;
  id v17 = objc_msgSend(v15, sel_cardSection);
  if (v17)
  {
    id v18 = v17;
    uint64_t v33 = v3;
    v32[1] = type metadata accessor for SearchUIUserReportRequestView();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB0);
    sub_1E46A5930();
    uint64_t v19 = *v14;
    sub_1E4676668((uint64_t)v14, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for SearchUIUserReportModel);
    if (v19)
    {
      v32[0] = v2;
      uint64_t v20 = (void *)*((void *)v12 + 1);
      id v21 = v20;
      sub_1E46767B4((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for SearchUIUserReportModel);
      if (v20)
      {

        sub_1E46767B4((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for SearchUIUserReportModel);
        sub_1E46A5930();
        id v22 = *v9;
        id v23 = *v9;
        sub_1E46767B4((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for SearchUIUserReportModel);
        if (v22)
        {
          id v24 = objc_allocWithZone(MEMORY[0x1E4F9A528]);
          id v25 = objc_msgSend(v24, sel_initWithSelection_result_cardSection_, v23, v34, v18);
          if (v25)
          {
            uint64_t v26 = v25;
            id v27 = objc_msgSend(v1[3], sel_feedbackDelegate);
            if (v27)
            {
              id v28 = v27;
              unsigned __int8 v29 = objc_msgSend(v27, sel_respondsToSelector_, sel_didReportUserResponseFeedback_);
              uint64_t v30 = v32[0];
              if (v29) {
                objc_msgSend(v28, sel_didReportUserResponseFeedback_, v26);
              }
              swift_unknownObjectRelease();
              sub_1E46775E0((uint64_t)v5);
              sub_1E46A5260();

              (*(void (**)(char *, uint64_t))(v33 + 8))(v5, v30);
            }
            else
            {
              __break(1u);
            }
          }
          else
          {
          }
          return;
        }
LABEL_16:

        return;
      }
    }
    else
    {
      sub_1E46767B4((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for SearchUIUserReportModel);
    }
    sub_1E46767B4((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for SearchUIUserReportModel);
    goto LABEL_16;
  }
  id v31 = v34;
}

uint64_t sub_1E4675B74@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE55BA0) + 28));
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1E4675BC4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1E466CF7C;
  return sub_1E4675C54();
}

uint64_t sub_1E4675C54()
{
  v1[16] = v0;
  type metadata accessor for SearchUIUserReportModel();
  v1[17] = swift_task_alloc();
  sub_1E46A6190();
  v1[18] = sub_1E46A6180();
  uint64_t v3 = sub_1E46A6160();
  v1[19] = v3;
  v1[20] = v2;
  return MEMORY[0x1F4188298](sub_1E4675D18, v3, v2);
}

uint64_t sub_1E4675D18()
{
  id v1 = objc_msgSend(**(id **)(v0 + 128), sel_identifyingResult);
  *(void *)(v0 + 16_Block_object_dispose(&a9, 8) = v1;
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void **)(*(void *)(v0 + 128) + 16);
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 120;
    *(void *)(v0 + 24) = sub_1E4675E8C;
    uint64_t v4 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x1E4F143A8];
    *(void *)(v0 + 8_Block_object_dispose(&a9, 8) = 0x40000000;
    *(void *)(v0 + 96) = sub_1E468FAF0;
    *(void *)(v0 + 104) = &block_descriptor;
    *(void *)(v0 + 112) = v4;
    objc_msgSend(v3, sel_fetchPreviewImageForResult_completion_, v2, v0 + 80);
    return MEMORY[0x1F41881E8](v0 + 16);
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
}

uint64_t sub_1E4675E8C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 160);
  uint64_t v2 = *(void *)(*(void *)v0 + 152);
  return MEMORY[0x1F4188298](sub_1E4675F94, v2, v1);
}

uint64_t sub_1E4675F94()
{
  uint64_t v1 = (void *)v0[21];
  uint64_t v2 = v0[17];
  swift_release();
  uint64_t v3 = v0[15];
  type metadata accessor for SearchUIUserReportRequestView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB0);
  sub_1E46A5930();

  *(void *)(v2 + _Block_object_dispose(&a9, 8) = v3;
  sub_1E46A5940();

  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1E4676060()
{
  return sub_1E46A5320();
}

uint64_t sub_1E46760C8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4673878(*(void *)(v1 + 16), a1);
}

unint64_t sub_1E46760D0()
{
  unint64_t result = qword_1EAE55C00;
  if (!qword_1EAE55C00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE55BF8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE55C08);
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EAE55BA0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE55C10);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE55C18);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE55C20);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE55C28);
    sub_1E46A55E0();
    sub_1E46671BC((unint64_t *)&unk_1EAE55C30, &qword_1EAE55C28);
    swift_getOpaqueTypeConformance2();
    sub_1E46719E4();
    swift_getOpaqueTypeConformance2();
    sub_1E46671BC(&qword_1EAE55C40, &qword_1EAE55C18);
    swift_getOpaqueTypeConformance2();
    sub_1E46671BC(&qword_1EAE55C48, (uint64_t *)&unk_1EAE55BA0);
    sub_1E4676320();
    swift_getOpaqueTypeConformance2();
    sub_1E4676374();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE55C00);
  }
  return result;
}

unint64_t sub_1E4676320()
{
  unint64_t result = qword_1EAE55C50;
  if (!qword_1EAE55C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE55C50);
  }
  return result;
}

unint64_t sub_1E4676374()
{
  unint64_t result = qword_1EAE55C58;
  if (!qword_1EAE55C58)
  {
    sub_1E46A52B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE55C58);
  }
  return result;
}

void sub_1E46763CC(void *a1@<X8>)
{
  sub_1E4674410(*(void *)(v1 + 16), a1);
}

uint64_t sub_1E46763D4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4674CA4(*(void *)(v1 + 16), a1);
}

uint64_t sub_1E46763E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SearchUIUserReportRequestView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E4676444()
{
  type metadata accessor for SearchUIUserReportRequestView();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1E4662D6C;
  return sub_1E4675BC4();
}

uint64_t sub_1E4676510(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E4676578()
{
  return sub_1E4674FFC(*(void *)(v0 + 16));
}

uint64_t sub_1E4676580@<X0>(uint64_t a1@<X8>)
{
  return sub_1E46752B4(*(void *)(v1 + 16), a1);
}

unint64_t sub_1E4676588()
{
  unint64_t result = qword_1EAE55CD8;
  if (!qword_1EAE55CD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE55CD0);
    sub_1E46671BC(&qword_1EAE55CC0, &qword_1EAE55CB8);
    sub_1E46671BC(&qword_1EAE55CE0, (uint64_t *)&unk_1EAE55CE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE55CD8);
  }
  return result;
}

uint64_t sub_1E4676650()
{
  return sub_1E4676A68((uint64_t (*)(void))sub_1E46757B8);
}

uint64_t sub_1E4676668(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1E46766D0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1E46A5430();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1E4676700()
{
  return sub_1E46A5440();
}

uint64_t sub_1E4676728()
{
  return MEMORY[0x1F4186498](v0, 17, 7);
}

unsigned char *sub_1E4676738(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_1E4676754()
{
  type metadata accessor for SearchUIUserReportRequestView();
  return sub_1E46751D0();
}

uint64_t sub_1E46767B4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = type metadata accessor for SearchUIUserReportRequestView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);

  swift_unknownObjectRelease();
  uint64_t v5 = (id *)(v0 + v3 + *(int *)(v1 + 32));

  uint64_t v6 = (char *)v5 + *(int *)(type metadata accessor for SearchUIUserReportModel() + 24);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE55BA0);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7))
  {
    uint64_t v8 = sub_1E46A4E10();
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v6, v8);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB0);
  swift_release();
  uint64_t v9 = v0 + v3 + *(int *)(v1 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_1E46A5270();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, v3 + v4, v2 | 7);
}

uint64_t sub_1E4676A50()
{
  return sub_1E4676A68((uint64_t (*)(void))sub_1E4674974);
}

uint64_t sub_1E4676A68(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1E4676ACC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E4676B34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55AD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E4676B9C()
{
  return sub_1E46671BC(&qword_1EAE55CF8, (uint64_t *)&unk_1EAE55D00);
}

void SearchUIAppearance.Style.color(for:)(id a1)
{
  uint64_t v3 = *v1;
  if (*((unsigned char *)v1 + 8))
  {
    if (*((unsigned char *)v1 + 8) != 1) {
      goto LABEL_7;
    }
    if (objc_msgSend(a1, sel_buttonColorForProminence_, v3)) {
      goto LABEL_8;
    }
    __break(1u);
  }
  if (objc_msgSend(a1, sel_colorForProminence_, v3)) {
    goto LABEL_8;
  }
  __break(1u);
LABEL_7:
  if (!objc_msgSend(self, sel_separatorColorForAppearance_, a1))
  {
    __break(1u);
    goto LABEL_12;
  }
LABEL_8:
LABEL_12:
  JUMPOUT(0x1E4E82EB0);
}

uint64_t SearchUIAppearance.style.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = type metadata accessor for SearchUIAppearance();
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(result + 24));
  uint64_t v5 = *v4;
  LOBYTE(v4) = *((unsigned char *)v4 + 8);
  *(void *)a1 = v5;
  *(unsigned char *)(a1 + _Block_object_dispose(&a9, 8) = (_BYTE)v4;
  return result;
}

uint64_t type metadata accessor for SearchUIAppearance()
{
  uint64_t result = qword_1EAE536F8;
  if (!qword_1EAE536F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_1E4676D14()
{
  uint64_t v0 = sub_1E46A51E0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x1F4188790](v0);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v15 - v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE534C8);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SearchUIAppearance();
  sub_1E46778D8((uint64_t)v9);
  uint64_t v10 = sub_1E46A5A20();
  BOOL v11 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v9, 1, v10) != 1;
  sub_1E4666020((uint64_t)v9, &qword_1EAE534C8);
  sub_1E4677620(&qword_1EAE53408, MEMORY[0x1E4F3C5D0], 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)v6);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, *MEMORY[0x1E4F3C5B8], v0);
  char v12 = sub_1E46A51D0();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v1 + 8);
  v13(v4, v0);
  v13(v6, v0);
  id result = objc_msgSend(self, sel_appearanceWithVibrancyEnabled_isDark_, v11, v12 & 1);
  if (!result) {
    __break(1u);
  }
  return result;
}

id SearchUIAppearance.body(content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v38 = sub_1E46A51E0();
  uint64_t v4 = *(void *)(v38 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v38);
  uint64_t v36 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v33 - v7;
  uint64_t v39 = sub_1E46A5A40();
  uint64_t v9 = *(void *)(v39 - 8);
  MEMORY[0x1F4188790](v39);
  id v37 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53608);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53648);
  MEMORY[0x1F4188790](v34);
  uint64_t v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53670);
  MEMORY[0x1F4188790](v35);
  id v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE536A0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v13, a1, v18);
  uint64_t v19 = (uint64_t *)(v2 + *(int *)(type metadata accessor for SearchUIAppearance() + 24));
  uint64_t v20 = *v19;
  int v21 = *((unsigned __int8 *)v19 + 8);
  id v22 = sub_1E4676D14();
  id v23 = v22;
  if (!v21)
  {
LABEL_5:
    if (objc_msgSend(v23, sel_colorForProminence_, v20)) {
      goto LABEL_8;
    }
    __break(1u);
    goto LABEL_7;
  }
  if (v21 == 1)
  {
    if (objc_msgSend(v22, sel_buttonColorForProminence_, v20)) {
      goto LABEL_8;
    }
    __break(1u);
    goto LABEL_5;
  }
LABEL_7:
  id result = objc_msgSend(self, sel_separatorColorForAppearance_, v23);
  if (!result)
  {
    __break(1u);
    return result;
  }
LABEL_8:
  uint64_t v25 = MEMORY[0x1E4E82EB0]();

  sub_1E46794DC((uint64_t)v13, (uint64_t)v15, &qword_1EAE53608);
  *(void *)&v15[*(int *)(v34 + 36)] = v25;
  sub_1E4666020((uint64_t)v13, &qword_1EAE53608);
  sub_1E4677620(&qword_1EAE53408, MEMORY[0x1E4F3C5D0], 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)v8);
  uint64_t v26 = v36;
  uint64_t v27 = v38;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v36, *MEMORY[0x1E4F3C5B8], v38);
  char v28 = sub_1E46A51D0();
  unsigned __int8 v29 = *(void (**)(char *, uint64_t))(v4 + 8);
  v29(v26, v27);
  v29(v8, v27);
  uint64_t v30 = (unsigned int *)MEMORY[0x1E4F3EFC0];
  if ((v28 & 1) == 0) {
    uint64_t v30 = (unsigned int *)MEMORY[0x1E4F3EFA8];
  }
  id v31 = v37;
  uint64_t v32 = v39;
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v37, *v30, v39);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(&v17[*(int *)(v35 + 36)], v31, v32);
  sub_1E46794DC((uint64_t)v15, (uint64_t)v17, &qword_1EAE53648);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v31, v32);
  sub_1E4666020((uint64_t)v15, &qword_1EAE53648);
  return (id)sub_1E467946C((uint64_t)v17, v40, &qword_1EAE53670);
}

uint64_t sub_1E4677450()
{
  return sub_1E46A5240();
}

uint64_t View.searchUIAppearance(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1E46775B4(a1, a2, a3, 0);
}

uint64_t View.searchUIAppearance(_:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SearchUIAppearance();
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (uint64_t *)((char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = *a1;
  char v10 = *((unsigned char *)a1 + 8);
  *uint64_t v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53408);
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = (uint64_t *)((char *)v8 + *(int *)(v6 + 20));
  *uint64_t v11 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53418);
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = (char *)v8 + *(int *)(v6 + 24);
  *(void *)uint64_t v12 = v9;
  v12[8] = v10;
  MEMORY[0x1E4E82E90](v8, a2, v6, a3);
  return sub_1E4677FA0((uint64_t)v8);
}

uint64_t View.searchUIButtonAppearance(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1E46775B4(a1, a2, a3, 1);
}

uint64_t sub_1E46775B4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = a1;
  char v6 = a4;
  return View.searchUIAppearance(_:)(&v5, a2, a3);
}

uint64_t sub_1E46775E0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4677620(&qword_1EAE55BB8, MEMORY[0x1E4F3C820], 0x417373696D736944, 0xED00006E6F697463, a1);
}

uint64_t sub_1E4677620@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v28 = a3;
  uint64_t v9 = v5;
  uint64_t v11 = sub_1E46A5480();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x1F4188790](v15);
  id v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E46794DC(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    os_log_type_t v20 = sub_1E46A6270();
    int v21 = sub_1E46A5700();
    if (os_log_type_enabled(v21, v20))
    {
      unint64_t v26 = a4;
      uint64_t v22 = swift_slowAlloc();
      uint64_t v27 = a5;
      id v23 = (uint8_t *)v22;
      uint64_t v24 = swift_slowAlloc();
      uint64_t v30 = v24;
      *(_DWORD *)id v23 = 136315138;
      uint64_t v29 = sub_1E46658F4(v28, v26, &v30);
      sub_1E46A62C0();
      _os_log_impl(&dword_1E45B5000, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1E4E84AA0](v24, -1, -1);
      MEMORY[0x1E4E84AA0](v23, -1, -1);
    }

    sub_1E46A5470();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_1E46778D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1E46A5480();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53418);
  MEMORY[0x1F4188790](v8);
  char v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E46794DC(v2, (uint64_t)v10, &qword_1EAE53418);
  if (swift_getEnumCaseMultiPayload() == 1) {
    return sub_1E467946C((uint64_t)v10, a1, &qword_1EAE534C8);
  }
  os_log_type_t v12 = sub_1E46A6270();
  uint64_t v13 = sub_1E46A5700();
  os_log_type_t v14 = v12;
  if (os_log_type_enabled(v13, v12))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    v18[1] = a1;
    uint64_t v17 = v16;
    uint64_t v19 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    v18[2] = sub_1E46658F4(0xD000000000000012, 0x80000001E46BC9B0, &v19);
    sub_1E46A62C0();
    _os_log_impl(&dword_1E45B5000, v13, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1E4E84AA0](v17, -1, -1);
    MEMORY[0x1E4E84AA0](v15, -1, -1);
  }

  sub_1E46A5470();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1E4677B68@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4677620(&qword_1EAE535C0, MEMORY[0x1E4F3D5D8], 0xD000000000000013, 0x80000001E46BC9D0, a1);
}

double sub_1E4677BA0(uint64_t a1, char a2)
{
  uint64_t v4 = sub_1E46A5480();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return *(double *)&a1;
  }
  sub_1E46A4AB0();
  os_log_type_t v8 = sub_1E46A6270();
  uint64_t v9 = sub_1E46A5700();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    double v15 = *(double *)&v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v14 = sub_1E46658F4(0x74616F6C464743, 0xE700000000000000, (uint64_t *)&v15);
    sub_1E46A62C0();
    _os_log_impl(&dword_1E45B5000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1E4E84AA0](v12, -1, -1);
    MEMORY[0x1E4E84AA0](v11, -1, -1);
  }

  sub_1E46A5470();
  swift_getAtKeyPath();
  sub_1E46794D0(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t sub_1E4677DAC()
{
  return sub_1E46A5350();
}

uint64_t sub_1E4677DD0()
{
  return sub_1E46A5350();
}

uint64_t sub_1E4677DF4(uint64_t a1)
{
  uint64_t v2 = sub_1E46A51E0();
  MEMORY[0x1F4188790](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1E46A5360();
}

uint64_t sub_1E4677EC0()
{
  return sub_1E46A53C0();
}

uint64_t sub_1E4677EE4()
{
  return sub_1E46A53C0();
}

uint64_t sub_1E4677F08(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE534C8);
  MEMORY[0x1F4188790](v2 - 8);
  sub_1E46794DC(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1EAE534C8);
  return sub_1E46A53D0();
}

uint64_t sub_1E4677FA0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SearchUIAppearance();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E4677FFC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for SearchUIAppearance(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    sub_1E46A4AB0();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53408);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1E46A51E0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      sub_1E46A4AB0();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    os_log_type_t v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53418);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_1E46A5A20();
      uint64_t v13 = *(void *)(v12 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
      {
        uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE534C8);
        memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v13 + 16))(v10, v11, v12);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      }
    }
    else
    {
      *os_log_type_t v10 = *v11;
      sub_1E46A4AB0();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v15 = *(int *)(a3 + 24);
    uint64_t v16 = (char *)a1 + v15;
    uint64_t v17 = (char *)a2 + v15;
    *(void *)uint64_t v16 = *(void *)v17;
    v16[8] = v17[8];
  }
  return a1;
}

uint64_t destroy for SearchUIAppearance(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53408);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1E46A51E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53418);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1E46A5A20();
    uint64_t v9 = *(void *)(v6 - 8);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v5, 1, v6);
    if (!result)
    {
      uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
      return v8(v5, v6);
    }
  }
  else
  {
    return swift_release();
  }
  return result;
}

void *initializeWithCopy for SearchUIAppearance(void *a1, void *a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53408);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1E46A51E0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    sub_1E46A4AB0();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53418);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_1E46A5A20();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE534C8);
      memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
  }
  else
  {
    *uint64_t v8 = *v9;
    sub_1E46A4AB0();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  *(void *)uint64_t v14 = *(void *)v15;
  v14[8] = v15[8];
  return a1;
}

void *assignWithCopy for SearchUIAppearance(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1E4666020((uint64_t)a1, &qword_1EAE53408);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53408);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1E46A51E0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      sub_1E46A4AB0();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_1E4666020((uint64_t)a1 + v7, &qword_1EAE53418);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53418);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_1E46A5A20();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      {
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE534C8);
        memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      }
    }
    else
    {
      *uint64_t v8 = *v9;
      sub_1E46A4AB0();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = *(void *)v15;
  v14[8] = v15[8];
  *(void *)uint64_t v14 = v16;
  return a1;
}

char *initializeWithTake for SearchUIAppearance(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53408);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1E46A51E0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53418);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_1E46A5A20();
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE534C8);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v9, v10, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v12);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  *(void *)uint64_t v16 = *(void *)v17;
  v16[8] = v17[8];
  return a1;
}

char *assignWithTake for SearchUIAppearance(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1E4666020((uint64_t)a1, &qword_1EAE53408);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53408);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1E46A51E0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_1E4666020((uint64_t)&a1[v8], &qword_1EAE53418);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53418);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_1E46A5A20();
      uint64_t v13 = *(void *)(v12 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12))
      {
        uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE534C8);
        memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v9, v10, v12);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v12);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  *(void *)uint64_t v16 = *(void *)v17;
  v16[8] = v17[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchUIAppearance(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E4678D38);
}

uint64_t sub_1E4678D38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55D10);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55D18);
    uint64_t v12 = *(void *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) != a2)
    {
      unsigned int v14 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24) + 8);
      if (v14 > 2) {
        return (v14 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for SearchUIAppearance(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E4678E68);
}

uint64_t sub_1E4678E68(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55D10);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55D18);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(unsigned char *)(a1 + *(int *)(a4 + 24) + _Block_object_dispose(&a9, 8) = -(char)a2;
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_1E4678F84()
{
  sub_1E4679054();
  if (v0 <= 0x3F)
  {
    sub_1E46790AC();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_1E4679054()
{
  if (!qword_1EAE53410)
  {
    sub_1E46A51E0();
    unint64_t v0 = sub_1E46A51F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAE53410);
    }
  }
}

void sub_1E46790AC()
{
  if (!qword_1EAE53420)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE534C8);
    unint64_t v0 = sub_1E46A51F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAE53420);
    }
  }
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + _Block_object_dispose(&a9, 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for SearchUIAppearance.Style(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SearchUIAppearance.Style(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + _Block_object_dispose(&a9, 8) = 0;
    *(void *)uint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + _Block_object_dispose(&a9, 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1E46791A8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_1E46791C0(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)uint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + _Block_object_dispose(&a9, 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SearchUIAppearance.Style()
{
  return &type metadata for SearchUIAppearance.Style;
}

unint64_t sub_1E46791EC()
{
  unint64_t result = qword_1EAE53668;
  if (!qword_1EAE53668)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE53670);
    sub_1E4679268();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE53668);
  }
  return result;
}

unint64_t sub_1E4679268()
{
  unint64_t result = qword_1EAE53640;
  if (!qword_1EAE53640)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE53648);
    sub_1E4679308();
    sub_1E46671BC(&qword_1EAE53468, &qword_1EAE53470);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE53640);
  }
  return result;
}

unint64_t sub_1E4679308()
{
  unint64_t result = qword_1EAE53600;
  if (!qword_1EAE53600)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE53608);
    sub_1E46671BC(&qword_1EAE53698, &qword_1EAE536A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE53600);
  }
  return result;
}

uint64_t sub_1E46793A8()
{
  return swift_getWitnessTable();
}

unint64_t sub_1E4679414()
{
  unint64_t result = qword_1EAE536F0;
  if (!qword_1EAE536F0)
  {
    type metadata accessor for SearchUIAppearance();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE536F0);
  }
  return result;
}

uint64_t sub_1E467946C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1E46794D0(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1E46794DC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_1E4679544()
{
  unint64_t result = qword_1EAE55D20;
  if (!qword_1EAE55D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE55D20);
  }
  return result;
}

unint64_t sub_1E467959C()
{
  unint64_t result = qword_1EAE55D28;
  if (!qword_1EAE55D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE55D28);
  }
  return result;
}

uint64_t sub_1E46795F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1E467960C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1E4679628()
{
  uint64_t v0 = sub_1E46A4D30();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  unsigned int v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1E46A4E40();
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v5 = sub_1E46A6030();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v6 = sub_1E46A4D50();
  __swift_allocate_value_buffer(v6, qword_1EAE58028);
  __swift_project_value_buffer(v6, (uint64_t)qword_1EAE58028);
  sub_1E46A5FD0();
  sub_1E46A4E30();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4F275D0], v0);
  return sub_1E46A4D60();
}

uint64_t sub_1E4679818@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55970);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = &v15[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_1E46A4D30();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = &v15[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_1E46A4E40();
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v10 = sub_1E46A6030();
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v11 = sub_1E46A4D50();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  sub_1E46A5FD0();
  sub_1E46A4E30();
  (*(void (**)(unsigned char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E4F275D0], v5);
  sub_1E46A4D60();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v4, 1, 1, v11);
  sub_1E46A4BF0();
  uint64_t v13 = sub_1E46A4BE0();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(a1, 0, 1, v13);
}

__n128 sub_1E4679B20@<Q0>(__n128 *a1@<X8>)
{
  sub_1E46A4A50();
  __n128 result = v5;
  a1->n128_u64[0] = v3;
  a1->n128_u64[1] = v4;
  a1[1] = v5;
  a1[2].n128_u64[0] = v6;
  return result;
}

uint64_t sub_1E4679B6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[9] = a2;
  v3[10] = a3;
  v3[8] = a1;
  return MEMORY[0x1F4188298](sub_1E4679B90, 0, 0);
}

uint64_t sub_1E4679B90()
{
  sub_1E46A4940();
  v0[11] = v0[7];
  sub_1E46A4A50();
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  v0[12] = v1;
  v0[13] = v3;
  v0[14] = v4;
  uint64_t v7 = (char *)&dword_1EAE55D60 + dword_1EAE55D60;
  __n128 v5 = (void *)swift_task_alloc();
  v0[15] = v5;
  *__n128 v5 = v0;
  v5[1] = sub_1E4679C80;
  return ((uint64_t (*)(uint64_t, uint64_t, void))v7)(v2, v1, 0);
}

uint64_t sub_1E4679C80()
{
  uint64_t v2 = *(void **)(*v1 + 88);
  uint64_t v3 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  if (v0)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x1F4188298](sub_1E4679E34, 0, 0);
  }
}

uint64_t sub_1E4679E34()
{
  sub_1E46A4A10();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E4679E98@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EAE55668 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1E46A4D50();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EAE58028);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_1E4679F40()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55D68);
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55D70);
  MEMORY[0x1F4188790](v1);
  sub_1E46A4CA0();
  sub_1E46A4C90();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55D78);
  sub_1E46A4C80();
  swift_release();
  sub_1E46A4C90();
  sub_1E46A4CB0();
  return sub_1E46A4C70();
}

uint64_t sub_1E467A0D4(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + _Block_object_dispose(&a9, 8) = sub_1E4662D6C;
  *(_OWORD *)(v4 + 72) = *v1;
  *(void *)(v4 + 64) = a1;
  return MEMORY[0x1F4188298](sub_1E4679B90, 0, 0);
}

uint64_t sub_1E467A188@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1E467A5D4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1E467A1B0(uint64_t a1)
{
  unint64_t v2 = sub_1E467ABA4();
  return sel_trailingAttribution(a1, v2);
}

ValueMetadata *type metadata accessor for SearchUIOpenKnowledgeIntent()
{
  return &type metadata for SearchUIOpenKnowledgeIntent;
}

uint64_t sub_1E467A1FC()
{
  return sub_1E46671BC(&qword_1EAE55D38, &qword_1EAE55D40);
}

uint64_t sub_1E467A238(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  sub_1E46A6190();
  void v4[6] = sub_1E46A6180();
  uint64_t v6 = sub_1E46A6160();
  return MEMORY[0x1F4188298](sub_1E467AC24, v6, v5);
}

uint64_t sub_1E467A2D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  sub_1E46A6190();
  void v4[6] = sub_1E46A6180();
  uint64_t v6 = sub_1E46A6160();
  return MEMORY[0x1F4188298](sub_1E467A370, v6, v5);
}

id sub_1E467A370()
{
  uint64_t v1 = v0[5];
  swift_release();
  uint64_t v2 = v1 + OBJC_IVAR____TtC8SearchUI23SearchUIAppIntentRunner_delegate;
  if (MEMORY[0x1E4E84B80](v1 + OBJC_IVAR____TtC8SearchUI23SearchUIAppIntentRunner_delegate)
    && (uint64_t v3 = *(void *)(v2 + 8),
        uint64_t v4 = swift_getObjectType(),
        uint64_t v5 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v4, v3),
        swift_unknownObjectRelease(),
        v5))
  {
    if (MEMORY[0x1E4E84B80](v2))
    {
      uint64_t v6 = v0[2];
      uint64_t v7 = v0[3];
      uint64_t v8 = *(void *)(v2 + 8);
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16);
      swift_bridgeObjectRetain();
      uint64_t v11 = (void *)v10(v6, v7, ObjectType, v8);
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      if (v11)
      {
        uint64_t v12 = (void *)v0[4];
        if (v12)
        {
          uint64_t v13 = self;
          id v14 = v12;
          id result = objc_msgSend(v13, sel_handlerForButton_rowModel_environment_, v14, v11, v5);
          if (result)
          {
            uint64_t v16 = result;
            objc_msgSend(result, sel_executeWithTriggerEvent_, 13);

LABEL_16:
            uint64_t v19 = (uint64_t (*)(void))v0[1];
            goto LABEL_11;
          }
          __break(1u);
        }
        else
        {
          id result = objc_msgSend(self, sel_handlerForRowModel_environment_, v11, v5);
          if (result)
          {
            uint64_t v16 = result;
            objc_msgSend(result, sel_executeWithTriggerEvent_, 13);
            goto LABEL_16;
          }
        }
        __break(1u);
        return result;
      }
    }
    sub_1E4662AD8();
    swift_allocError();
    unsigned char *v18 = 2;
    swift_willThrow();
  }
  else
  {
    sub_1E4662AD8();
    swift_allocError();
    unsigned char *v17 = 0;
    swift_willThrow();
  }
  uint64_t v19 = (uint64_t (*)(void))v0[1];
LABEL_11:
  return (id)v19();
}

uint64_t sub_1E467A5D4()
{
  uint64_t v0 = sub_1E46A4CC0(0);
  uint64_t v29 = *(void *)(v0 - 8);
  uint64_t v30 = v0;
  MEMORY[0x1F4188790](v0);
  uint64_t v28 = (char *)v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55968);
  uint64_t v3 = MEMORY[0x1F4188790](v2 - 8);
  uint64_t v27 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  unint64_t v26 = (char *)v24 - v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55970);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v25 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1E46A4D30();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1E46A4E40();
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v13 = sub_1E46A6030();
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v14 = sub_1E46A4D50();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  v24[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55D48);
  sub_1E46A5FD0();
  sub_1E46A4E30();
  uint64_t v16 = *MEMORY[0x1E4F275D0];
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 104);
  v17(v11, v16, v8);
  sub_1E46A4D60();
  sub_1E46A5FD0();
  sub_1E46A4E30();
  v17(v11, v16, v8);
  uint64_t v18 = v25;
  sub_1E46A4D60();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v18, 0, 1, v14);
  uint64_t v19 = sub_1E46A4A00();
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v35 = 0;
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56);
  v20(v26, 1, 1, v19);
  v20(v27, 1, 1, v19);
  (*(void (**)(char *, void, uint64_t))(v29 + 104))(v28, *MEMORY[0x1E4F186F0], v30);
  sub_1E467AB50();
  uint64_t v21 = sub_1E46A4A80();
  sub_1E46A4980();
  sub_1E46A4970();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55980);
  *(void *)&long long v33 = type metadata accessor for SearchUIAppIntentRunner();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99B9C8);
  uint64_t v31 = sub_1E46A6060();
  uint64_t v32 = v22;
  sub_1E46A62F0();
  sub_1E46A4950();
  return v21;
}

unint64_t sub_1E467AB50()
{
  unint64_t result = qword_1EB99BA08;
  if (!qword_1EB99BA08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB99BA08);
  }
  return result;
}

unint64_t sub_1E467ABA4()
{
  unint64_t result = qword_1EAE55D50;
  if (!qword_1EAE55D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1EAE55D50);
  }
  return result;
}

uint64_t sub_1E467ABF8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1E46A4A70();
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for SearchUIAppIntentsPackage()
{
  return &type metadata for SearchUIAppIntentsPackage;
}

uint64_t sub_1E467AC3C(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1EAE55D90 + dword_1EAE55D90);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1E4662D6C;
  return v7(a1, a2);
}

uint64_t sub_1E467AE68(int a1, void *aBlock)
{
  v2[2] = _Block_copy(aBlock);
  uint64_t v3 = sub_1E46A6050();
  uint64_t v5 = v4;
  v2[3] = v4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1EAE55D90 + dword_1EAE55D90);
  uint64_t v6 = (void *)swift_task_alloc();
  v2[4] = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1E467AF38;
  return v8(v3, v5);
}

uint64_t sub_1E467AF38()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v3 + 16);
  if (v2)
  {
    uint64_t v7 = (void *)sub_1E46A4D10();

    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
  _Block_release(*(const void **)(v4 + 16));
  uint64_t v8 = *(uint64_t (**)(void))(v5 + 8);
  return v8();
}

id sub_1E467B0C0()
{
  id result = (id)qword_1EAE58040;
  if (qword_1EAE58040) {
    return objc_msgSend((id)qword_1EAE58040, sel_play);
  }
  return result;
}

id sub_1E467B0F8()
{
  id result = (id)qword_1EAE58040;
  if (qword_1EAE58040) {
    return objc_msgSend((id)qword_1EAE58040, sel_pause);
  }
  return result;
}

id SearchUIVoicemailUtilities.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id SearchUIVoicemailUtilities.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUIVoicemailUtilities();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SearchUIVoicemailUtilities.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUIVoicemailUtilities();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1E467B210(uint64_t a1, uint64_t a2)
{
  v2[3] = a1;
  v2[4] = a2;
  uint64_t v3 = sub_1E46A4D90();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55DB0);
  v2[8] = swift_task_alloc();
  uint64_t v4 = sub_1E46A4E10();
  v2[9] = v4;
  v2[10] = *(void *)(v4 - 8);
  v2[11] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E467B388, 0, 0);
}

uint64_t sub_1E467B388()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[8];
  sub_1E46A4DF0();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_1E467BD9C(v0[8]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    uint64_t v7 = v0[10];
    uint64_t v6 = v0[11];
    uint64_t v8 = v0[9];
    (*(void (**)(uint64_t, void, uint64_t))(v7 + 32))(v6, v0[8], v8);
    sub_1E46A5120();
    v0[12] = sub_1E46A5110();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55DB8);
    unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v10 = swift_allocObject();
    v0[13] = v10;
    *(_OWORD *)(v10 + 16) = xmmword_1E46B7170;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v7 + 16))(v10 + v9, v6, v8);
    uint64_t v11 = (void *)swift_task_alloc();
    v0[14] = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_1E467B5A8;
    return MEMORY[0x1F41190D0](v10);
  }
}

uint64_t sub_1E467B5A8(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 120) = a1;
  *(void *)(v3 + 12_Block_object_dispose(&a9, 8) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  if (v1) {
    uint64_t v4 = sub_1E467BA84;
  }
  else {
    uint64_t v4 = sub_1E467B72C;
  }
  return MEMORY[0x1F4188298](v4, 0, 0);
}

uint64_t sub_1E467B72C()
{
  unint64_t v1 = v0[15];
  if (!(v1 >> 62))
  {
    if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_12:
    uint64_t v23 = v0[10];
    uint64_t v22 = v0[11];
    uint64_t v24 = v0[9];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_1E46A6440();
  swift_bridgeObjectRelease();
  if (!v21) {
    goto LABEL_12;
  }
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    id v2 = (id)MEMORY[0x1E4E83990](0, v0[15]);
  }
  else
  {
    if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      __break(1u);
    }
    id v2 = *(id *)(v0[15] + 32);
  }
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_1E46A50F0();
  uint64_t v4 = (void *)sub_1E46A5130();

  if (v4)
  {
    uint64_t v26 = v0[10];
    uint64_t v6 = v0[6];
    uint64_t v5 = v0[7];
    uint64_t v7 = v0[5];
    sub_1E46A4D80();
    id v8 = objc_allocWithZone(MEMORY[0x1E4F16608]);
    unint64_t v9 = (void *)sub_1E46A4D70();
    id v10 = objc_msgSend(v8, sel_initWithURL_, v9);

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    id v11 = objc_msgSend(self, sel_sharedInstance);
    uint64_t v12 = *MEMORY[0x1E4F14F98];
    v0[2] = 0;
    LOBYTE(v_Block_object_dispose(&a9, 8) = objc_msgSend(v11, sel_setCategory_error_, v12, v0 + 2);

    uint64_t v13 = (void *)v0[2];
    uint64_t v14 = (void (**)(uint64_t, uint64_t))(v26 + 8);
    uint64_t v15 = v0[11];
    uint64_t v16 = v0[9];
    if ((v8 & 1) == 0)
    {
      id v19 = v13;
      sub_1E46A4D20();

      swift_willThrow();
      (*v14)(v15, v16);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v20 = (uint64_t (*)(void))v0[1];
      goto LABEL_14;
    }
    id v17 = v13;
    objc_msgSend(v10, sel_play);
    uint64_t v18 = (void *)qword_1EAE58040;
    qword_1EAE58040 = (uint64_t)v10;

    (*v14)(v15, v16);
  }
  else
  {
    (*(void (**)(void, void))(v0[10] + 8))(v0[11], v0[9]);
  }
LABEL_13:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(void))v0[1];
LABEL_14:
  return v20();
}

uint64_t sub_1E467BA84()
{
  (*(void (**)(void, void))(v0[10] + 8))(v0[11], v0[9]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t type metadata accessor for SearchUIVoicemailUtilities()
{
  return self;
}

uint64_t method lookup function for SearchUIVoicemailUtilities(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SearchUIVoicemailUtilities);
}

uint64_t dispatch thunk of static SearchUIVoicemailUtilities.playVoicemail(identifier:)(uint64_t a1, uint64_t a2)
{
  id v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v2 + 80) + **(int **)(v2 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_1E4662D6C;
  return v8(a1, a2);
}

uint64_t dispatch thunk of static SearchUIVoicemailUtilities.resumeVoicemail()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static SearchUIVoicemailUtilities.pauseVoicemail()()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_1E467BCA0()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1E467BCE0()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1E4662D6C;
  uint64_t v5 = (uint64_t (*)(int, void *))((char *)&dword_1EAE55DA0 + dword_1EAE55DA0);
  return v5(v2, v3);
}

uint64_t sub_1E467BD9C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55DB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1E467BE00()
{
  unint64_t result = qword_1EAE55DC0;
  if (!qword_1EAE55DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE55DC0);
  }
  return result;
}

unint64_t sub_1E467BE58()
{
  unint64_t result = qword_1EAE55DC8[0];
  if (!qword_1EAE55DC8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EAE55DC8);
  }
  return result;
}

uint64_t sub_1E467BEB0()
{
  sub_1E46A4980();
  sub_1E46A4970();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55980);
  type metadata accessor for SearchUIAppIntentRunner();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99B9C8);
  sub_1E46A6060();
  sub_1E46A62F0();
  uint64_t result = sub_1E46A4950();
  qword_1EAE58048 = result;
  return result;
}

uint64_t sub_1E467BF50()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55970);
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_1E46A4D30();
  uint64_t v3 = *(void *)(v12[0] - 8);
  MEMORY[0x1F4188790](v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1E46A4E40();
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v7 = sub_1E46A6030();
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v8 = sub_1E46A4D50();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = sub_1E46A4CF0();
  __swift_allocate_value_buffer(v10, qword_1EAE58050);
  __swift_project_value_buffer(v10, (uint64_t)qword_1EAE58050);
  sub_1E46A5FD0();
  sub_1E46A4E30();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, *MEMORY[0x1E4F275D0], v12[0]);
  sub_1E46A4D60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_1E46A4CE0();
}

uint64_t sub_1E467C238()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55E20);
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55970);
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1E46A4D50();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = sub_1E46A6010();
  MEMORY[0x1F4188790](v6 - 8);
  sub_1E46A6000();
  sub_1E46A5FF0();
  sub_1E46A4A20();
  sub_1E46A5FE0();
  swift_bridgeObjectRelease();
  sub_1E46A5FF0();
  sub_1E46A4D40();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  swift_bridgeObjectRetain();
  sub_1E46A4C10();
  return sub_1E46A4C40();
}

uint64_t sub_1E467C4A8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return MEMORY[0x1F4188298](sub_1E467C4C8, 0, 0);
}

uint64_t sub_1E467C4C8()
{
  sub_1E46A4940();
  v0[5] = v0[2];
  sub_1E46A6190();
  v0[6] = sub_1E46A6180();
  uint64_t v2 = sub_1E46A6160();
  return MEMORY[0x1F4188298](sub_1E467C570, v2, v1);
}

uint64_t sub_1E467C570()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_release();
  uint64_t v2 = v1 + OBJC_IVAR____TtC8SearchUI23SearchUIAppIntentRunner_delegate;
  if (MEMORY[0x1E4E84B80](v2))
  {
    uint64_t v3 = *(void *)(v2 + 8);
    uint64_t ObjectType = swift_getObjectType();
    unint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(ObjectType, v3);
    swift_unknownObjectRelease();
  }
  else
  {
    unint64_t v5 = MEMORY[0x1E4FBC860];
  }
  uint64_t v6 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1E467DBE4(v6, v5);
  swift_bridgeObjectRelease_n();
  if (v7[2])
  {

    uint64_t v8 = *(uint64_t (**)(void *))(v0 + 8);
    return v8(v7);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_1E4662AD8();
    *(void *)(v0 + 56) = swift_allocError();
    *uint64_t v10 = 2;
    swift_willThrow();
    return MEMORY[0x1F4188298](sub_1E467C6EC, 0, 0);
  }
}

uint64_t sub_1E467C6EC()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E467C750@<X0>(uint64_t *a1@<X8>)
{
  sub_1E46A4980();
  sub_1E46A4970();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55980);
  type metadata accessor for SearchUIAppIntentRunner();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99B9C8);
  sub_1E46A6060();
  sub_1E46A62F0();
  uint64_t result = sub_1E46A4950();
  *a1 = result;
  return result;
}

uint64_t sub_1E467C7FC(uint64_t a1)
{
  uint64_t v4 = *v1;
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_1E467C8AC;
  v5[3] = a1;
  v5[4] = v4;
  return MEMORY[0x1F4188298](sub_1E467C4C8, 0, 0);
}

uint64_t sub_1E467C8AC(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  unint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_1E467C9AC(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v3;
  return MEMORY[0x1F4188298](sub_1E467C9D0, 0, 0);
}

uint64_t sub_1E467C9D0()
{
  sub_1E46A4940();
  v0[5] = v0[2];
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_1EAE564D0 + dword_1EAE564D0);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[6] = v1;
  void *v1 = v0;
  v1[1] = sub_1E467CA84;
  return v3();
}

uint64_t sub_1E467CA84(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 56) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x1F4188298](sub_1E467C6EC, 0, 0);
  }
  else
  {
    unint64_t v5 = *(void **)(v4 + 24);

    *unint64_t v5 = a1;
    uint64_t v6 = *(uint64_t (**)(void))(v4 + 8);
    return v6();
  }
}

unint64_t sub_1E467CBE0()
{
  unint64_t result = qword_1EAE55DE0;
  if (!qword_1EAE55DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE55DE0);
  }
  return result;
}

unint64_t sub_1E467CC38()
{
  unint64_t result = qword_1EB99BA10;
  if (!qword_1EB99BA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB99BA10);
  }
  return result;
}

unint64_t sub_1E467CC90()
{
  unint64_t result = qword_1EAE55DE8;
  if (!qword_1EAE55DE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EAE55DF0);
    sub_1E467CC38();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE55DE8);
  }
  return result;
}

#error "1E46A49FC: call analysis failed (funcsize=47)"

uint64_t sub_1E467CDB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1E4662D6C;
  return aSetsubtitlebut_0(a1, a2, a3);
}

uint64_t destroy for SearchUIKnowledgeEntity()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

void *initializeWithCopy for SearchUIKnowledgeEntity(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1E46A4AB0();
  return a1;
}

void *assignWithCopy for SearchUIKnowledgeEntity(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  sub_1E46A4AB0();
  swift_release();
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

uint64_t assignWithTake for SearchUIKnowledgeEntity(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchUIKnowledgeEntity(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SearchUIKnowledgeEntity(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + _Block_object_dispose(&a9, 8) = 0u;
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
      *(void *)(result + _Block_object_dispose(&a9, 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SearchUIKnowledgeEntity()
{
  return &type metadata for SearchUIKnowledgeEntity;
}

ValueMetadata *type metadata accessor for SearchUIKnowledgeEntity.SearchUIKnowledgeEntityQuery()
{
  return &type metadata for SearchUIKnowledgeEntity.SearchUIKnowledgeEntityQuery;
}

uint64_t sub_1E467D0B8@<X0>(void *a1@<X8>)
{
  if (qword_1EAE55670 != -1) {
    swift_once();
  }
  *a1 = qword_1EAE58048;
  return sub_1E46A4AB0();
}

uint64_t sub_1E467D124@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1E467D130@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EAE55678 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1E46A4CF0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EAE58050);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_1E467D1D8(uint64_t a1)
{
  unint64_t v2 = sub_1E467AB50();
  return aSettrailingatt(a1, v2);
}

uint64_t sub_1E467D228(uint64_t a1)
{
  unint64_t v2 = sub_1E467D2DC();
  return off_1F40D4970(a1, v2);
}

unint64_t sub_1E467D278()
{
  unint64_t result = qword_1EB99BA38;
  if (!qword_1EB99BA38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB99BA38);
  }
  return result;
}

uint64_t sub_1E467D2CC()
{
  return MEMORY[0x1E4FBB1B0];
}

unint64_t sub_1E467D2DC()
{
  unint64_t result = qword_1EB99BA30;
  if (!qword_1EB99BA30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB99BA30);
  }
  return result;
}

unint64_t sub_1E467D334()
{
  unint64_t result = qword_1EB99BA28;
  if (!qword_1EB99BA28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB99BA28);
  }
  return result;
}

unint64_t sub_1E467D38C()
{
  unint64_t result = qword_1EB99BA20;
  if (!qword_1EB99BA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB99BA20);
  }
  return result;
}

unint64_t sub_1E467D3E0(uint64_t a1)
{
  unint64_t result = sub_1E467AB50();
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = result;
  return result;
}

unint64_t sub_1E467D40C()
{
  unint64_t result = qword_1EAE55E08;
  if (!qword_1EAE55E08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE55E10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE55E08);
  }
  return result;
}

unint64_t sub_1E467D46C()
{
  unint64_t result = qword_1EB99BA00;
  if (!qword_1EB99BA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB99BA00);
  }
  return result;
}

unint64_t sub_1E467D4C4()
{
  unint64_t result = qword_1EB99BA18;
  if (!qword_1EB99BA18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB99BA18);
  }
  return result;
}

unint64_t sub_1E467D51C()
{
  unint64_t result = qword_1EB99BA40;
  if (!qword_1EB99BA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB99BA40);
  }
  return result;
}

unint64_t sub_1E467D574()
{
  unint64_t result = qword_1EAE55E18;
  if (!qword_1EAE55E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE55E18);
  }
  return result;
}

uint64_t sub_1E467D5C8()
{
  return MEMORY[0x1E4F188B0];
}

void sub_1E467D5D4(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_1E46A4D30();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1E46A4E40();
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v9 = sub_1E46A6030();
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v10 = sub_1E46A4D50();
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55E28);
  sub_1E46A5FD0();
  sub_1E46A4E30();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4F275D0], v4);
  sub_1E46A4D60();
  uint64_t v13 = MEMORY[0x1E4E82060](v12);
  sub_1E46A4AB0();
  id v14 = objc_msgSend(a1, sel_itemIdentifier);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = sub_1E46A6050();
    uint64_t v18 = v17;

    swift_bridgeObjectRetain();
    id v19 = objc_msgSend(a1, sel_cardSection);
    if (v19)
    {
      uint64_t v20 = v19;
      id v21 = objc_msgSend(v19, sel_command);

      if (v21)
      {
        self;
        uint64_t v22 = (void *)swift_dynamicCastObjCClass();
        if (v22)
        {
          uint64_t v23 = v22;
          id v24 = objc_msgSend(v22, sel_tokenString);
          if (v24)
          {
            uint64_t v25 = sub_1E46A6050();
            uint64_t v27 = v26;

            id v28 = objc_msgSend(v23, sel_symbolImage);
            id v29 = v28;
            if (v28)
            {
              uint64_t v44 = v25;
              id v30 = objc_msgSend(v28, sel_symbolName);

              if (v30)
              {
                id v29 = (id)sub_1E46A6050();
                id v24 = v31;
              }
              else
              {
                id v29 = 0;
                id v24 = 0;
              }
              uint64_t v25 = v44;
            }
            else
            {
              id v24 = 0;
            }
            uint64_t v45 = v25;
            uint64_t v46 = v27;
            goto LABEL_38;
          }

          swift_release_n();
          swift_bridgeObjectRelease_n();
          goto LABEL_27;
        }
      }
    }
    id v32 = objc_msgSend(a1, sel_cardSection);
    id v29 = v32;
    if (v32)
    {
      id v21 = objc_msgSend(v32, sel_command);

      if (!v21)
      {

        swift_release_n();
        swift_bridgeObjectRelease_n();
LABEL_21:
        uint64_t v16 = 0;
        uint64_t v18 = 0;
        id v29 = 0;
LABEL_24:
        id v24 = 0;
        uint64_t v13 = 0;
LABEL_39:
        *a2 = v16;
        a2[1] = v18;
        a2[2] = (uint64_t)v29;
        a2[3] = (uint64_t)v24;
        a2[4] = v13;
        return;
      }
      self;
      long long v33 = (void *)swift_dynamicCastObjCClass();
      id v29 = v33;
      if (v33)
      {
        id v34 = objc_msgSend(v33, sel_card);
        id v24 = v34;
        if (!v34)
        {

          swift_release_n();
          swift_bridgeObjectRelease_n();

LABEL_27:
          uint64_t v16 = 0;
          uint64_t v18 = 0;
          id v29 = 0;
          uint64_t v13 = 0;
          goto LABEL_39;
        }
        id v35 = objc_msgSend(v34, sel_title);

        if (v35)
        {
          uint64_t v36 = sub_1E46A6050();
          uint64_t v43 = v37;
          uint64_t v44 = v36;

          id v38 = objc_msgSend(v29, sel_card);
          id v24 = v38;
          if (v38)
          {
            id v29 = objc_msgSend(v38, sel_titleImage);

            if (v29)
            {
              self;
              uint64_t v39 = (void *)swift_dynamicCastObjCClass();
              if (v39)
              {
                id v40 = objc_msgSend(v39, sel_symbolName);

                if (v40)
                {
                  id v29 = (id)sub_1E46A6050();
                  id v24 = v41;

LABEL_37:
                  uint64_t v45 = v44;
                  uint64_t v46 = v43;
LABEL_38:
                  swift_bridgeObjectRetain();
                  sub_1E46A4AB0();
                  swift_bridgeObjectRetain();
                  sub_1E46A4A30(&v45);

                  swift_release_n();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease_n();

                  goto LABEL_39;
                }
              }
              else
              {
              }
              id v29 = 0;
            }
            id v24 = 0;
            goto LABEL_37;
          }
          id v29 = 0;
          goto LABEL_37;
        }

        swift_release_n();
        swift_bridgeObjectRelease_n();

        goto LABEL_21;
      }
    }
    swift_release_n();
    swift_bridgeObjectRelease_n();
    uint64_t v16 = 0;
    uint64_t v18 = 0;
    goto LABEL_24;
  }
  __break(1u);
}

void *sub_1E467DBE4(uint64_t a1, unint64_t a2)
{
  uint64_t v32 = *(void *)(a1 + 16);
  if (!v32) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  unint64_t v2 = a2;
  uint64_t v31 = a1 + 32;
  uint64_t v28 = a2 & 0xFFFFFFFFFFFFFF8;
  unint64_t v34 = a2 & 0xC000000000000001;
  swift_bridgeObjectRetain();
  uint64_t v3 = 0;
  id v29 = (void *)MEMORY[0x1E4FBC860];
  unint64_t v30 = v2 >> 62;
  unint64_t v38 = v2;
  while (1)
  {
    uint64_t v4 = (uint64_t *)(v31 + 16 * v3);
    uint64_t v6 = *v4;
    uint64_t v5 = v4[1];
    if (v30) {
      break;
    }
    uint64_t v7 = *(void *)(v28 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v7) {
      goto LABEL_9;
    }
LABEL_3:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_4:
    if (++v3 == v32)
    {
      swift_bridgeObjectRelease();
      return v29;
    }
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1E46A6440();
  if (!v7) {
    goto LABEL_3;
  }
LABEL_9:
  uint64_t v33 = v3;
  uint64_t v8 = 4;
  while (1)
  {
    unint64_t result = v34 ? (void *)MEMORY[0x1E4E83990](v8 - 4, v2) : *(id *)(v2 + 8 * v8);
    uint64_t v10 = result;
    uint64_t v11 = v8 - 3;
    if (__OFADD__(v8 - 4, 1)) {
      break;
    }
    id v12 = objc_msgSend(result, sel_itemIdentifier);
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = sub_1E46A6050();
      uint64_t v16 = v15;

      BOOL v17 = v14 == v6 && v16 == v5;
      if (v17)
      {
        unint64_t v2 = v38;
        swift_bridgeObjectRelease();
        goto LABEL_24;
      }
      char v18 = sub_1E46A64D0();
      swift_bridgeObjectRelease();
      if (v18)
      {
        unint64_t v2 = v38;
LABEL_24:
        swift_bridgeObjectRelease();
        sub_1E467D5D4(v10, v35);
        uint64_t v19 = v35[0];
        uint64_t v20 = v35[1];
        uint64_t v21 = v35[2];
        uint64_t v22 = v35[3];
        uint64_t v23 = v35[4];
        swift_bridgeObjectRelease();
        sub_1E467E068((uint64_t)v35, (uint64_t)v36);
        if (v37)
        {
          id v24 = v29;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            id v24 = sub_1E469E114(0, v29[2] + 1, 1, v29);
          }
          unint64_t v26 = v24[2];
          unint64_t v25 = v24[3];
          id v29 = v24;
          if (v26 >= v25 >> 1) {
            id v29 = sub_1E469E114((void *)(v25 > 1), v26 + 1, 1, v24);
          }
          v29[2] = v26 + 1;
          uint64_t v27 = &v29[5 * v26];
          v27[4] = v19;
          v27[5] = v20;
          v27[6] = v21;
          v27[7] = v22;
          v27[8] = v23;
          unint64_t v2 = v38;
        }
LABEL_30:
        uint64_t v3 = v33;
        goto LABEL_4;
      }
    }

    ++v8;
    BOOL v17 = v11 == v7;
    unint64_t v2 = v38;
    if (v17)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_30;
    }
  }
  __break(1u);
  return result;
}

id sub_1E467DEBC(void *a1)
{
  id v2 = objc_msgSend(a1, sel_cardSection);
  if (!v2 || (uint64_t v3 = v2, v4 = objc_msgSend(v2, sel_command), v3, !v4))
  {
LABEL_7:
    id result = objc_msgSend(a1, sel_cardSection);
    if (!result) {
      return result;
    }
    uint64_t v14 = result;
    id v15 = objc_msgSend(result, sel_command);

    if (v15)
    {
      self;
      uint64_t v16 = (void *)swift_dynamicCastObjCClass();
      if (v16)
      {
        id v17 = objc_msgSend(v16, sel_card);
        if (v17)
        {
          char v18 = v17;
          id v19 = objc_msgSend(v17, sel_title);

          if (v19)
          {
            uint64_t v20 = sub_1E46A6050();
            unint64_t v10 = v21;

            swift_bridgeObjectRelease();
            uint64_t v11 = HIBYTE(v10) & 0xF;
            uint64_t v12 = v20 & 0xFFFFFFFFFFFFLL;
            goto LABEL_13;
          }
        }
      }
    }
    return 0;
  }
  self;
  uint64_t v5 = (void *)swift_dynamicCastObjCClass();
  if (!v5)
  {

    goto LABEL_7;
  }
  id v6 = objc_msgSend(v5, sel_tokenString);
  if (!v6)
  {

    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = sub_1E46A6050();
  unint64_t v10 = v9;

  swift_bridgeObjectRelease();
  uint64_t v11 = HIBYTE(v10) & 0xF;
  uint64_t v12 = v8 & 0xFFFFFFFFFFFFLL;
LABEL_13:
  if ((v10 & 0x2000000000000000) == 0) {
    uint64_t v11 = v12;
  }
  return (id)(v11 != 0);
}

uint64_t sub_1E467E068(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55E38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E467E0D0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *(void *)a1 = *a2;
    a1 = v17 + ((v5 + 16) & ~(unint64_t)v5);
    sub_1E46A4AB0();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + _Block_object_dispose(&a9, 8) = v7;
    uint64_t v8 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v8;
    long long v9 = *((_OWORD *)a2 + 3);
    *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
    *(_OWORD *)(a1 + 4_Block_object_dispose(&a9, 8) = v9;
    uint64_t v11 = (void *)a2[8];
    uint64_t v10 = a2[9];
    *(void *)(a1 + 64) = v11;
    *(void *)(a1 + 72) = v10;
    uint64_t v12 = *(int *)(a3 + 36);
    uint64_t v13 = (void *)(a1 + v12);
    uint64_t v14 = (uint64_t *)((char *)a2 + v12);
    *(void *)(a1 + 80) = a2[10];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v15 = v11;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE535C0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_1E46A5530();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v13, v14, v16);
    }
    else
    {
      *uint64_t v13 = *v14;
      sub_1E46A4AB0();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v18 = *(int *)(a3 + 40);
    uint64_t v19 = a1 + v18;
    uint64_t v20 = (uint64_t)a2 + v18;
    uint64_t v21 = *(uint64_t *)((char *)a2 + v18 + 24);
    if (v21)
    {
      uint64_t v22 = *(void *)(v20 + 32);
      *(void *)(v19 + 24) = v21;
      *(void *)(v19 + 32) = v22;
      (**(void (***)(void))(v21 - 8))();
    }
    else
    {
      long long v23 = *(_OWORD *)(v20 + 16);
      *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
      *(_OWORD *)(v19 + 16) = v23;
      *(void *)(v19 + 32) = *(void *)(v20 + 32);
    }
  }
  return a1;
}

uint64_t sub_1E467E28C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE535C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_1E46A5530();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t result = a1 + *(int *)(a2 + 40);
  if (*(void *)(result + 24))
  {
    return __swift_destroy_boxed_opaque_existential_0(result);
  }
  return result;
}

uint64_t sub_1E467E374(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = v6;
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  long long v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 4_Block_object_dispose(&a9, 8) = v8;
  uint64_t v10 = *(void **)(a2 + 64);
  uint64_t v9 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = v10;
  *(void *)(a1 + 72) = v9;
  uint64_t v11 = *(int *)(a3 + 36);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v14 = v10;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE535C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_1E46A5530();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v12, v13, v15);
  }
  else
  {
    *uint64_t v12 = *v13;
    sub_1E46A4AB0();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v16 = *(int *)(a3 + 40);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = *(void *)(a2 + v16 + 24);
  if (v19)
  {
    uint64_t v20 = *(void *)(v18 + 32);
    *(void *)(v17 + 24) = v19;
    *(void *)(v17 + 32) = v20;
    (**(void (***)(void))(v19 - 8))();
  }
  else
  {
    long long v21 = *(_OWORD *)(v18 + 16);
    *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
    *(_OWORD *)(v17 + 16) = v21;
    *(void *)(v17 + 32) = *(void *)(v18 + 32);
  }
  return a1;
}

void *sub_1E467E4E0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  uint64_t v6 = (void *)a1[8];
  uint64_t v7 = (void *)a2[8];
  a1[8] = v7;
  id v8 = v7;

  a1[9] = a2[9];
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v9 = *(int *)(a3 + 36);
    uint64_t v10 = (void *)((char *)a1 + v9);
    uint64_t v11 = (void *)((char *)a2 + v9);
    sub_1E4666020((uint64_t)a1 + v9, &qword_1EAE535C0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE535C0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_1E46A5530();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      sub_1E46A4AB0();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v13 = *(int *)(a3 + 40);
  uint64_t v14 = (uint64_t)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = *((void *)v15 + 3);
  if (!*(void *)((char *)a1 + v13 + 24))
  {
    if (v16)
    {
      *(void *)(v14 + 24) = v16;
      *(void *)(v14 + 32) = *((void *)v15 + 4);
      (**(void (***)(uint64_t, char *))(v16 - 8))(v14, v15);
      return a1;
    }
LABEL_12:
    long long v17 = *(_OWORD *)v15;
    long long v18 = *((_OWORD *)v15 + 1);
    *(void *)(v14 + 32) = *((void *)v15 + 4);
    *(_OWORD *)uint64_t v14 = v17;
    *(_OWORD *)(v14 + 16) = v18;
    return a1;
  }
  if (!v16)
  {
    __swift_destroy_boxed_opaque_existential_0(v14);
    goto LABEL_12;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v14, (uint64_t *)v15);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        sub_1E46A4AB0();
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          sub_1E46A4AB0();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          sub_1E46A4AB0();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t sub_1E467E910(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 4_Block_object_dispose(&a9, 8) = v7;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v8 = *(int *)(a3 + 36);
  int v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE535C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_1E46A5530();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = *(int *)(a3 + 40);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  long long v16 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *(_OWORD *)(v14 + 16) = v16;
  *(void *)(v14 + 32) = *(void *)(v15 + 32);
  return a1;
}

uint64_t sub_1E467EA28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  long long v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 4_Block_object_dispose(&a9, 8) = v8;
  int v9 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);

  uint64_t v10 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v10;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v11 = *(int *)(a3 + 36);
    uint64_t v12 = (void *)(a1 + v11);
    uint64_t v13 = (const void *)(a2 + v11);
    sub_1E4666020(a1 + v11, &qword_1EAE535C0);
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE535C0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_1E46A5530();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
    }
  }
  uint64_t v16 = *(int *)(a3 + 40);
  uint64_t v17 = a1 + v16;
  if (*(void *)(a1 + v16 + 24)) {
    __swift_destroy_boxed_opaque_existential_0(a1 + v16);
  }
  long long v18 = *(_OWORD *)(a2 + v16 + 16);
  *(_OWORD *)uint64_t v17 = *(_OWORD *)(a2 + v16);
  *(_OWORD *)(v17 + 16) = v18;
  *(void *)(v17 + 32) = *(void *)(a2 + v16 + 32);
  return a1;
}

uint64_t sub_1E467EB90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E467EBA4);
}

uint64_t sub_1E467EBA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55E40);
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1E467EC58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E467EC6C);
}

uint64_t sub_1E467EC6C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + _Block_object_dispose(&a9, 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55E40);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 36);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for Header()
{
  uint64_t result = qword_1EB99BAB8;
  if (!qword_1EB99BAB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1E467ED64()
{
  sub_1E467EE24();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1E467EE24()
{
  if (!qword_1EB99BAB0)
  {
    sub_1E46A5530();
    unint64_t v0 = sub_1E46A51F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB99BAB0);
    }
  }
}

uint64_t sub_1E467EE7C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1E467EE98@<X0>(uint64_t a1@<X8>)
{
  v34[1] = a1;
  uint64_t v1 = type metadata accessor for SearchUIAppearance();
  uint64_t v2 = v1 - 8;
  MEMORY[0x1F4188790](v1);
  unint64_t v4 = (void *)((char *)v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53688);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE535F8);
  uint64_t v9 = v8 - 8;
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53638);
  uint64_t v13 = v12 - 8;
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53660);
  MEMORY[0x1F4188790](v34[0]);
  uint64_t v17 = (char *)v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E467F1EC((uint64_t)v7);
  sub_1E46A51B0();
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  char v26 = sub_1E46A5710();
  sub_1E46794DC((uint64_t)v7, (uint64_t)v11, &qword_1EAE53688);
  uint64_t v27 = &v11[*(int *)(v9 + 44)];
  *uint64_t v27 = v26;
  *((void *)v27 + 1) = v19;
  *((void *)v27 + 2) = v21;
  *((void *)v27 + 3) = v23;
  *((void *)v27 + 4) = v25;
  v27[40] = 0;
  sub_1E4666020((uint64_t)v7, &qword_1EAE53688);
  *unint64_t v4 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53408);
  swift_storeEnumTagMultiPayload();
  uint64_t v28 = (uint64_t *)((char *)v4 + *(int *)(v2 + 28));
  uint64_t *v28 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53418);
  swift_storeEnumTagMultiPayload();
  id v29 = (char *)v4 + *(int *)(v2 + 32);
  *(void *)id v29 = 1;
  v29[8] = 0;
  sub_1E46794DC((uint64_t)v11, (uint64_t)v15, &qword_1EAE535F8);
  sub_1E46811A4((uint64_t)v4, (uint64_t)&v15[*(int *)(v13 + 44)]);
  sub_1E4666020((uint64_t)v11, &qword_1EAE535F8);
  uint64_t v30 = sub_1E46A5760();
  uint64_t KeyPath = swift_getKeyPath();
  sub_1E46794DC((uint64_t)v15, (uint64_t)v17, &qword_1EAE53638);
  uint64_t v32 = (uint64_t *)&v17[*(int *)(v34[0] + 36)];
  *uint64_t v32 = KeyPath;
  v32[1] = v30;
  sub_1E4666020((uint64_t)v15, &qword_1EAE53638);
  sub_1E4681260();
  sub_1E46A5840();
  return sub_1E4666020((uint64_t)v17, &qword_1EAE53660);
}

uint64_t sub_1E467F1EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v29 = a1;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE536C8);
  MEMORY[0x1F4188790](v30);
  unint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53678);
  MEMORY[0x1F4188790](v27);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE536E8);
  uint64_t v8 = MEMORY[0x1F4188790](v7 - 8);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v27 - v11;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE536D8);
  MEMORY[0x1F4188790](v28);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1E46A5530();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  uint64_t v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Header();
  sub_1E4677B68((uint64_t)v18);
  char v19 = sub_1E46A5520();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  if (v19)
  {
    *(void *)uint64_t v14 = sub_1E46A54B0();
    *((void *)v14 + 1) = 0;
    v14[16] = 1;
    uint64_t v20 = (uint64_t)&v14[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55E48) + 44)];
    *(void *)uint64_t v12 = sub_1E46A5540();
    *((void *)v12 + 1) = 0;
    v12[16] = 1;
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55E50);
    sub_1E467F638(v2, (uint64_t)&v12[*(int *)(v21 + 44)]);
    sub_1E46794DC((uint64_t)v12, (uint64_t)v10, &qword_1EAE536E8);
    sub_1E46794DC((uint64_t)v10, v20, &qword_1EAE536E8);
    uint64_t v22 = v20 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55E58) + 48);
    *(void *)uint64_t v22 = 0;
    *(unsigned char *)(v22 + _Block_object_dispose(&a9, 8) = 1;
    sub_1E4666020((uint64_t)v12, &qword_1EAE536E8);
    sub_1E4666020((uint64_t)v10, &qword_1EAE536E8);
    uint64_t v23 = &qword_1EAE536D8;
    sub_1E46794DC((uint64_t)v14, (uint64_t)v6, &qword_1EAE536D8);
    swift_storeEnumTagMultiPayload();
    sub_1E46671BC(&qword_1EAE536D0, &qword_1EAE536D8);
    sub_1E46671BC(&qword_1EAE536C0, &qword_1EAE536C8);
    sub_1E46A5570();
    uint64_t v24 = (uint64_t)v14;
  }
  else
  {
    *(void *)unint64_t v4 = sub_1E46A54A0();
    *((void *)v4 + 1) = 0;
    v4[16] = 1;
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE535E8);
    sub_1E467FD50(v2, (uint64_t)&v4[*(int *)(v25 + 44)]);
    uint64_t v23 = &qword_1EAE536C8;
    sub_1E46794DC((uint64_t)v4, (uint64_t)v6, &qword_1EAE536C8);
    swift_storeEnumTagMultiPayload();
    sub_1E46671BC(&qword_1EAE536D0, &qword_1EAE536D8);
    sub_1E46671BC(&qword_1EAE536C0, &qword_1EAE536C8);
    sub_1E46A5570();
    uint64_t v24 = (uint64_t)v4;
  }
  return sub_1E4666020(v24, v23);
}

uint64_t sub_1E467F638@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE536B0);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v25 - v8;
  uint64_t v32 = (uint64_t)&v25 - v8;
  uint64_t v29 = sub_1E46A5540();
  sub_1E467FF38(a1, (uint64_t)v33);
  uint64_t v10 = v33[0];
  uint64_t v26 = v33[0];
  uint64_t v28 = v33[1];
  int v27 = v34;
  uint64_t v11 = v35;
  uint64_t v12 = v36;
  uint64_t v13 = v37;
  uint64_t v14 = v38;
  uint64_t v30 = v37;
  uint64_t v31 = v38;
  uint64_t v15 = v39;
  sub_1E467F824((uint64_t)v9);
  uint64_t v16 = (uint64_t)v9;
  uint64_t v17 = (uint64_t)v7;
  sub_1E46794DC(v16, (uint64_t)v7, &qword_1EAE536B0);
  uint64_t v18 = v28;
  *(void *)a2 = v29;
  *(void *)(a2 + _Block_object_dispose(&a9, 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  *(void *)(a2 + 24) = v10;
  *(void *)(a2 + 32) = v18;
  LOBYTE(a1) = v27;
  *(unsigned char *)(a2 + 40) = v27;
  *(void *)(a2 + 4_Block_object_dispose(&a9, 8) = v11;
  *(void *)(a2 + 56) = v12;
  *(void *)(a2 + 64) = v13;
  *(void *)(a2 + 72) = v14;
  *(void *)(a2 + 80) = v15;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55E60);
  sub_1E46794DC(v17, a2 + *(int *)(v19 + 48), &qword_1EAE536B0);
  uint64_t v20 = v26;
  sub_1E46814E8(v26, v18, a1);
  swift_bridgeObjectRetain();
  uint64_t v21 = v12;
  uint64_t v22 = v12;
  uint64_t v23 = v30;
  LOBYTE(a2) = v31;
  sub_1E46814F8(v22, v30, v31, v15);
  sub_1E4666020(v32, &qword_1EAE536B0);
  sub_1E4666020(v17, &qword_1EAE536B0);
  sub_1E4671FC4(v20, v18, a1);
  swift_bridgeObjectRelease();
  return sub_1E468153C(v21, v23, a2, v15);
}

uint64_t sub_1E467F824@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1E46A55C0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = type metadata accessor for SearchUIAppearance();
  MEMORY[0x1F4188790](v35);
  uint64_t v9 = (uint64_t *)((char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE534B8);
  uint64_t v36 = *(void *)(v10 - 8);
  uint64_t v37 = v10;
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53618);
  MEMORY[0x1F4188790](v38);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE536A8);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  unsigned __int8 v34 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for Header();
  sub_1E46794DC(v2 + *(int *)(v18 + 40), (uint64_t)&v39, &qword_1EAE533F8);
  if (v40)
  {
    uint64_t v33 = v4;
    sub_1E466CF1C(&v39, (uint64_t)v41);
    sub_1E4681580((uint64_t)v41, (uint64_t)&v39);
    uint64_t v19 = swift_allocObject();
    uint64_t v20 = sub_1E466CF1C(&v39, v19 + 16);
    uint64_t v32 = v15;
    MEMORY[0x1F4188790](v20);
    uint64_t v31 = a1;
    *(&v31 - 2) = (uint64_t)v41;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53438);
    sub_1E4681678();
    sub_1E46A5960();
    *uint64_t v9 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53408);
    swift_storeEnumTagMultiPayload();
    uint64_t v21 = v35;
    uint64_t v22 = (uint64_t *)((char *)v9 + *(int *)(v35 + 20));
    *uint64_t v22 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53418);
    swift_storeEnumTagMultiPayload();
    uint64_t v23 = (char *)v9 + *(int *)(v21 + 24);
    *(void *)uint64_t v23 = 2;
    v23[8] = 1;
    uint64_t v25 = v36;
    uint64_t v24 = v37;
    (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v14, v12, v37);
    sub_1E46811A4((uint64_t)v9, (uint64_t)&v14[*(int *)(v38 + 36)]);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v24);
    sub_1E46A55B0();
    sub_1E46817BC();
    sub_1E468188C(&qword_1EAE53690, MEMORY[0x1E4F3D8B0]);
    uint64_t v26 = v34;
    uint64_t v27 = v33;
    sub_1E46A57F0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v27);
    sub_1E4666020((uint64_t)v14, &qword_1EAE53618);
    uint64_t v29 = v31;
    uint64_t v28 = v32;
    (*(void (**)(uint64_t, char *, uint64_t))(v16 + 32))(v31, v26, v32);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v16 + 56))(v29, 0, 1, v28);
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v41);
  }
  else
  {
    sub_1E4666020((uint64_t)&v39, &qword_1EAE533F8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56))(a1, 1, 1, v15);
  }
}

uint64_t sub_1E467FD50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE536B0);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v27 = (uint64_t)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v23 - v7;
  uint64_t v28 = (uint64_t)&v23 - v7;
  uint64_t v24 = sub_1E46A5540();
  sub_1E467FF38(a1, (uint64_t)v29);
  uint64_t v10 = v29[0];
  uint64_t v9 = v29[1];
  char v11 = v30;
  uint64_t v12 = v31;
  uint64_t v13 = v32;
  uint64_t v15 = v33;
  uint64_t v14 = v34;
  uint64_t v26 = v33;
  uint64_t v23 = v35;
  sub_1E467F824((uint64_t)v8);
  uint64_t v16 = v27;
  sub_1E46794DC((uint64_t)v8, v27, &qword_1EAE536B0);
  *(void *)a2 = v24;
  *(void *)(a2 + _Block_object_dispose(&a9, 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  *(void *)(a2 + 24) = v10;
  *(void *)(a2 + 32) = v9;
  *(unsigned char *)(a2 + 40) = v11;
  uint64_t v25 = v12;
  *(void *)(a2 + 4_Block_object_dispose(&a9, 8) = v12;
  *(void *)(a2 + 56) = v13;
  *(void *)(a2 + 64) = v15;
  *(void *)(a2 + 72) = v14;
  uint64_t v17 = v23;
  *(void *)(a2 + 80) = v23;
  *(void *)(a2 + 8_Block_object_dispose(&a9, 8) = 0;
  *(unsigned char *)(a2 + 96) = 1;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE536E0);
  sub_1E46794DC(v16, a2 + *(int *)(v18 + 64), &qword_1EAE536B0);
  sub_1E46814E8(v10, v9, v11);
  swift_bridgeObjectRetain();
  uint64_t v19 = v13;
  uint64_t v20 = v13;
  uint64_t v21 = v26;
  sub_1E46814F8(v20, v26, v14, v17);
  sub_1E4666020(v28, &qword_1EAE536B0);
  sub_1E4666020(v16, &qword_1EAE536B0);
  sub_1E4671FC4(v10, v9, v11);
  swift_bridgeObjectRelease();
  return sub_1E468153C(v19, v21, v14, v17);
}

uint64_t sub_1E467FF38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1E46719E4();
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_1E46A57A0();
  uint64_t v6 = v5;
  char v8 = v7;
  uint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 24);
  if (!v11) {
    goto LABEL_6;
  }
  uint64_t v12 = HIBYTE(v11) & 0xF;
  if ((v11 & 0x2000000000000000) == 0) {
    uint64_t v12 = *(void *)(a1 + 16) & 0xFFFFFFFFFFFFLL;
  }
  if (v12)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_1E46A57A0();
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    uint64_t v19 = v18 & 1;
  }
  else
  {
LABEL_6:
    uint64_t v13 = 0;
    uint64_t v15 = 0;
    uint64_t v19 = 0;
    uint64_t v17 = 0;
  }
  char v20 = v8 & 1;
  *(void *)a2 = v4;
  *(void *)(a2 + _Block_object_dispose(&a9, 8) = v6;
  *(unsigned char *)(a2 + 16) = v20;
  *(void *)(a2 + 24) = v10;
  *(void *)(a2 + 32) = v13;
  *(void *)(a2 + 40) = v15;
  *(void *)(a2 + 4_Block_object_dispose(&a9, 8) = v19;
  *(void *)(a2 + 56) = v17;
  sub_1E46814E8(v4, v6, v20);
  swift_bridgeObjectRetain();
  sub_1E46814F8(v13, v15, v19, v17);
  sub_1E468153C(v13, v15, v19, v17);
  sub_1E4671FC4(v4, v6, v20);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E4680090@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE534A8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  char v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53498);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  unint64_t v11 = &v14[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53450);
  sub_1E46818E4();
  sub_1E46A5910();
  sub_1E46671BC(&qword_1EAE534A0, &qword_1EAE534A8);
  sub_1E4681768();
  sub_1E46A57E0();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v9 + 16))(a2, v11, v8);
  uint64_t v12 = (uint64_t (**)())(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53438) + 36));
  *uint64_t v12 = sub_1E4680694;
  v12[1] = 0;
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_1E4680304@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v3);
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v3, v4);
  sub_1E46719E4();
  uint64_t result = sub_1E46A57A0();
  *(void *)a2 = result;
  *(void *)(a2 + _Block_object_dispose(&a9, 8) = v6;
  *(unsigned char *)(a2 + 16) = v7 & 1;
  *(void *)(a2 + 24) = v8;
  return result;
}

uint64_t sub_1E468038C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53490);
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (uint64_t *)((char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_1E46A58F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53448);
  uint64_t v22 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (uint64_t *)((char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = a1[3];
  uint64_t v14 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v13);
  (*(void (**)(uint64_t, uint64_t))(v14 + 24))(v13, v14);
  if (v15)
  {
    uint64_t v16 = sub_1E46A58D0();
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E4F3EC60], v6);
    uint64_t KeyPath = swift_getKeyPath();
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)v5 + *(int *)(v3 + 28), v9, v6);
    *uint64_t v5 = KeyPath;
    sub_1E46794DC((uint64_t)v5, (uint64_t)v12 + *(int *)(v10 + 36), &qword_1EAE53490);
    *uint64_t v12 = v16;
    sub_1E46A4AB0();
    sub_1E4666020((uint64_t)v5, &qword_1EAE53490);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_release();
    uint64_t v18 = v23;
    sub_1E467946C((uint64_t)v12, v23, &qword_1EAE53448);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v22 + 56))(v18, 0, 1, v10);
  }
  else
  {
    uint64_t v20 = v23;
    uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 56);
    return v21(v20, 1, 1, v10);
  }
}

uint64_t sub_1E4680694()
{
  return sub_1E46A5210();
}

uint64_t sub_1E46806BC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X3>, uint64_t *a4@<X8>)
{
  id v7 = a3;
  objc_msgSend(a1, sel_headerInsetsWithAttributes_sectionIndex_, v7, sub_1E46A4E90());
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  id v12 = objc_msgSend(a1, sel_section);
  id v13 = objc_msgSend(v12, sel_collectionSection);

  if (v13)
  {
    uint64_t v14 = 0;
    if (!v12)
    {
      unint64_t v21 = 0xE000000000000000;
      uint64_t v41 = 0;
      id v22 = objc_msgSend(a1, sel_section, 0);
      goto LABEL_21;
    }
    uint64_t v41 = 0;
    id v15 = objc_msgSend(v12, sel_collectionSection, 0);
  }
  else
  {
    if (!v12)
    {
LABEL_19:
      uint64_t v14 = 0;
      unint64_t v38 = 0;
      uint64_t v41 = 0;
      unint64_t v21 = 0xE000000000000000;
      goto LABEL_20;
    }
    id v16 = objc_msgSend(v12, sel_resultSection);
    if (v16
      && (uint64_t v17 = v16, v18 = objc_msgSend(v16, sel_subtitle), v17, v18))
    {
      uint64_t v19 = sub_1E46A6050();
      uint64_t v39 = v20;
      uint64_t v41 = v19;

      id v15 = objc_msgSend(v12, sel_collectionSection, v39);
    }
    else
    {
      uint64_t v41 = 0;
      id v15 = objc_msgSend(v12, sel_collectionSection, 0);
    }
  }
  id v23 = v15;
  if (!v23
    || (uint64_t v24 = v23, v25 = objc_msgSend(v23, sel_title), v24, !v25)
    || (id v26 = objc_msgSend(v25, sel_text), v25, !v26))
  {
    id v27 = objc_msgSend(v12, sel_resultSection);
    if (!v27
      || (v28 = v27, id v26 = objc_msgSend(v27, sel_title), v28, !v26))
    {
      unint64_t v21 = v38;
      if (v38)
      {
        uint64_t v14 = 0;
        id v22 = objc_msgSend(a1, sel_section, 0);
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  uint64_t v29 = sub_1E46A6050();
  unint64_t v21 = v30;

  uint64_t v14 = v41;
  uint64_t v41 = v29;
LABEL_20:
  id v22 = objc_msgSend(a1, sel_section, v38);
LABEL_21:
  id v31 = v22;
  if (v31)
  {
    uint64_t v32 = v31;
    id v33 = objc_msgSend(v31, sel_resultSection);

    sub_1E4680A9C(v7, (uint64_t)v42);
    sub_1E46A6350();
    swift_bridgeObjectRelease();
    sub_1E46A4E90();
    sub_1E46A64A0();
    sub_1E46A6090();
    swift_bridgeObjectRelease();
    sub_1E46A6090();
    swift_bridgeObjectRetain();
    sub_1E46A6090();

    swift_bridgeObjectRelease();
    uint64_t v34 = sub_1E46A4EA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v34 - 8) + 8))(a2, v34);
    uint64_t v35 = type metadata accessor for Header();
    uint64_t v36 = (uint64_t *)((char *)a4 + *(int *)(v35 + 36));
    *uint64_t v36 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE535C0);
    swift_storeEnumTagMultiPayload();
    *a4 = v41;
    a4[1] = v21;
    a4[2] = v14;
    a4[3] = v40;
    a4[4] = v9;
    a4[5] = 0;
    a4[6] = v11;
    a4[7] = 0;
    a4[8] = (uint64_t)v33;
    uint64_t result = sub_1E467946C((uint64_t)v42, (uint64_t)a4 + *(int *)(v35 + 40), &qword_1EAE533F8);
    a4[9] = 0xD000000000000021;
    a4[10] = 0x80000001E46BCCC0;
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    __break(1u);
  }
  return result;
}

void *sub_1E4680A9C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v31 = a1;
  id v4 = objc_msgSend(v2, sel_section);
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = objc_msgSend(v4, sel_resultSection);

    if (v6)
    {
      id v7 = objc_msgSend(v6, sel_bundleIdentifier);

      if (v7)
      {
        uint64_t v8 = sub_1E46A6050();
        uint64_t v10 = v9;

        if (qword_1EAE53588 != -1) {
          swift_once();
        }
        char v11 = sub_1E4668AD0(v8, v10, qword_1EAE53578);
        uint64_t result = (void *)swift_bridgeObjectRelease();
        if (v11) {
          goto LABEL_14;
        }
      }
    }
  }
  if (qword_1EAE53570 != -1) {
    swift_once();
  }
  uint64_t result = off_1EAE53560;
  uint64_t v30 = *((void *)off_1EAE53560 + 2);
  if (!v30)
  {
LABEL_14:
    *(void *)(a2 + 32) = 0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  else
  {
    uint64_t v28 = a2;
    uint64_t v13 = swift_bridgeObjectRetain();
    uint64_t v14 = 0;
    while (1)
    {
      uint64_t v15 = v13;
      long long v16 = *(_OWORD *)(v13 + 16 * v14 + 32);
      uint64_t v17 = *(void *)(v13 + 16 * v14 + 40);
      id v33 = *(void (**)(id, id, uint64_t, uint64_t))(v17 + 48);
      long long v29 = v16;
      uint64_t v18 = v16;
      uint64_t v19 = sub_1E46A62B0();
      uint64_t v20 = *(void *)(v19 - 8);
      MEMORY[0x1F4188790](v19);
      id v22 = (char *)&v27 - v21;
      id v23 = v32;
      id v24 = v31;
      v33(v23, v24, v18, v17);
      uint64_t v25 = *(void *)(v18 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v22, 1, v18) != 1) {
        break;
      }
      ++v14;
      (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
      memset(v34, 0, 40);
      sub_1E4666020((uint64_t)v34, &qword_1EAE533F8);
      uint64_t v13 = v15;
      if (v30 == v14)
      {
        uint64_t result = (void *)swift_bridgeObjectRelease();
        a2 = v28;
        goto LABEL_14;
      }
    }
    *(long long *)((char *)&v34[1] + _Block_object_dispose(&a9, 8) = v29;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)v34);
    (*(void (**)(uint64_t *, char *, uint64_t))(v25 + 32))(boxed_opaque_existential_1, v22, v18);
    swift_bridgeObjectRelease();
    return (void *)sub_1E466CF1C(v34, v28);
  }
  return result;
}

uint64_t sub_1E4680DD8()
{
  uint64_t v1 = *(void *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1E4680E08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v4 = *MEMORY[0x1E4FB12A8];
  uint64_t v5 = *(void *)(MEMORY[0x1E4FB12A8] + 16);
  uint64_t v6 = *(void *)(MEMORY[0x1E4FB12A8] + 24);
  uint64_t v11 = 0;
  long long v9 = v4;
  memset(v10, 0, sizeof(v10));
  id v7 = (uint64_t *)(a2 + *(int *)(a1 + 36));
  *id v7 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE535C0);
  swift_storeEnumTagMultiPayload();
  *(void *)a2 = 0;
  *(void *)(a2 + _Block_object_dispose(&a9, 8) = 0xE000000000000000;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_OWORD *)(a2 + 32) = v9;
  *(void *)(a2 + 4_Block_object_dispose(&a9, 8) = v5;
  *(void *)(a2 + 56) = v6;
  *(void *)(a2 + 64) = 0;
  uint64_t result = sub_1E467946C((uint64_t)v10, a2 + *(int *)(a1 + 40), &qword_1EAE533F8);
  *(void *)(a2 + 72) = 0;
  *(void *)(a2 + 80) = 0;
  return result;
}

uint64_t sub_1E4680ED4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE535A8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1E46B7BD0;
  uint64_t v1 = type metadata accessor for ButtonItemHeaderAction();
  uint64_t v2 = sub_1E468188C(&qword_1EAE534E8, (void (*)(uint64_t))type metadata accessor for ButtonItemHeaderAction);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v2;
  uint64_t v3 = type metadata accessor for ExpandSectionHeaderAction();
  uint64_t result = sub_1E468188C(&qword_1EAE53528, (void (*)(uint64_t))type metadata accessor for ExpandSectionHeaderAction);
  *(void *)(v0 + 4_Block_object_dispose(&a9, 8) = v3;
  *(void *)(v0 + 56) = result;
  off_1EAE53560 = (_UNKNOWN *)v0;
  return result;
}

uint64_t sub_1E4680FA8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE535B0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1E46B7BD0;
  *(void *)(inited + 32) = sub_1E46A6050();
  *(void *)(inited + 40) = v1;
  *(void *)(inited + 4_Block_object_dispose(&a9, 8) = 0xD00000000000001DLL;
  *(void *)(inited + 56) = 0x80000001E46BCCF0;
  uint64_t v2 = sub_1E4669E74(inited);
  swift_setDeallocating();
  uint64_t result = swift_arrayDestroy();
  qword_1EAE53578 = v2;
  return result;
}

uint64_t sub_1E4681060()
{
  return sub_1E46A5390();
}

uint64_t sub_1E4681084(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1E46810C4(a1, a2, a3, a4, MEMORY[0x1E4F3D5D8], MEMORY[0x1E4F3CF98]);
}

uint64_t sub_1E46810C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  MEMORY[0x1F4188790]();
  long long v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_1E46811A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SearchUIAppearance();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E4681208@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1E46A53E0();
  *a1 = result;
  return result;
}

uint64_t sub_1E4681234()
{
  return sub_1E46A53F0();
}

unint64_t sub_1E4681260()
{
  unint64_t result = qword_1EAE53658;
  if (!qword_1EAE53658)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE53660);
    sub_1E4681300();
    sub_1E46671BC(&qword_1EAE53478, &qword_1EAE53480);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE53658);
  }
  return result;
}

unint64_t sub_1E4681300()
{
  unint64_t result = qword_1EAE53630;
  if (!qword_1EAE53630)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE53638);
    sub_1E46813AC();
    sub_1E468188C((unint64_t *)&qword_1EAE536F0, (void (*)(uint64_t))type metadata accessor for SearchUIAppearance);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE53630);
  }
  return result;
}

unint64_t sub_1E46813AC()
{
  unint64_t result = qword_1EAE535F0;
  if (!qword_1EAE535F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE535F8);
    sub_1E4681428();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE535F0);
  }
  return result;
}

unint64_t sub_1E4681428()
{
  unint64_t result = qword_1EAE53680;
  if (!qword_1EAE53680)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE53688);
    sub_1E46671BC(&qword_1EAE536D0, &qword_1EAE536D8);
    sub_1E46671BC(&qword_1EAE536C0, &qword_1EAE536C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE53680);
  }
  return result;
}

uint64_t sub_1E46814E8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return sub_1E46A4AB0();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_1E46814F8(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1E46814E8(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1E468153C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1E4671FC4(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1E4681580(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1E46815E4()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1E468161C()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 40))(v1, v2);
}

uint64_t sub_1E4681670@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4680090(*(void *)(v1 + 16), a1);
}

unint64_t sub_1E4681678()
{
  unint64_t result = qword_1EAE53430;
  if (!qword_1EAE53430)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE53438);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE534A8);
    sub_1E46671BC(&qword_1EAE534A0, &qword_1EAE534A8);
    sub_1E4681768();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE53430);
  }
  return result;
}

unint64_t sub_1E4681768()
{
  unint64_t result = qword_1EAE53500;
  if (!qword_1EAE53500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE53500);
  }
  return result;
}

unint64_t sub_1E46817BC()
{
  unint64_t result = qword_1EAE53610;
  if (!qword_1EAE53610)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE53618);
    sub_1E46671BC(&qword_1EAE534B0, &qword_1EAE534B8);
    sub_1E468188C((unint64_t *)&qword_1EAE536F0, (void (*)(uint64_t))type metadata accessor for SearchUIAppearance);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE53610);
  }
  return result;
}

uint64_t sub_1E468188C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1E46818D4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4680304(*(void **)(v1 + 16), a1);
}

uint64_t sub_1E46818DC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E468038C(*(void **)(v1 + 16), a1);
}

unint64_t sub_1E46818E4()
{
  unint64_t result = qword_1EAE53458;
  if (!qword_1EAE53458)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE53450);
    sub_1E4681958();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE53458);
  }
  return result;
}

unint64_t sub_1E4681958()
{
  unint64_t result = qword_1EAE53440;
  if (!qword_1EAE53440)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE53448);
    sub_1E46671BC(&qword_1EAE53488, &qword_1EAE53490);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE53440);
  }
  return result;
}

uint64_t sub_1E46819F8()
{
  return sub_1E46A5340();
}

uint64_t sub_1E4681A1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1E46810C4(a1, a2, a3, a4, MEMORY[0x1E4F3EC78], MEMORY[0x1E4F3CEE8]);
}

uint64_t sub_1E4681A5C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for SearchUIUserReportRequestImageSection(id *a1)
{
  return swift_bridgeObjectRelease();
}

void *_s8SearchUI37SearchUIUserReportRequestImageSectionVwCP_0(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  a1[2] = *(void *)(a2 + 16);
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SearchUIUserReportRequestImageSection(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + _Block_object_dispose(&a9, 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SearchUIUserReportRequestImageSection(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v5 = a2[2];
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = a2[1];
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchUIUserReportRequestImageSection(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SearchUIUserReportRequestImageSection(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + _Block_object_dispose(&a9, 8) = 0;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SearchUIUserReportRequestImageSection()
{
  return &type metadata for SearchUIUserReportRequestImageSection;
}

uint64_t sub_1E4681C90()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1E4681CAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v31 = a4;
  uint64_t v7 = sub_1E46A51C0();
  uint64_t v29 = *(void *)(v7 - 8);
  uint64_t v30 = v7;
  MEMORY[0x1F4188790](v7);
  long long v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55E68);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55E70);
  MEMORY[0x1F4188790](v14);
  long long v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = a1;
  uint64_t v33 = a2;
  uint64_t v34 = a3;
  uint64_t v35 = a2;
  uint64_t v36 = a3;
  sub_1E46719E4();
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_1E46A57A0();
  uint64_t v19 = v18;
  LOBYTE(a1) = v20;
  uint64_t v22 = v21;
  char v23 = sub_1E46A5710();
  uint64_t v35 = v17;
  uint64_t v36 = v19;
  char v37 = a1 & 1;
  uint64_t v38 = v22;
  char v39 = v23;
  long long v40 = xmmword_1E46B7DB0;
  long long v41 = xmmword_1E46B7DB0;
  char v42 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55B20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55E78);
  sub_1E468241C((unint64_t *)&qword_1EAE55B30, &qword_1EAE55B20);
  sub_1E46822BC();
  sub_1E46A5A00();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v16, v13, v10);
  id v24 = &v16[*(int *)(v14 + 36)];
  v24[32] = 0;
  *(_OWORD *)id v24 = 0u;
  *((_OWORD *)v24 + 1) = 0u;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v26 = v29;
  uint64_t v25 = v30;
  (*(void (**)(char *, void, uint64_t))(v29 + 104))(v9, *MEMORY[0x1E4F3C538], v30);
  sub_1E468248C();
  sub_1E46A5820();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v25);
  return sub_1E46825D4((uint64_t)v16);
}

double sub_1E4681FE0@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1E46A58E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v8 = a1;
    sub_1E46A58C0();
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4F3EBF8], v4);
    uint64_t v9 = sub_1E46A5900();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v21 = v9;
    long long v22 = xmmword_1E46B7DC0;
    uint64_t v23 = 0;
    memset(v24, 0, 11);
    sub_1E46A4AB0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55E90);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55EC0);
    sub_1E468235C();
    sub_1E46671BC(&qword_1EAE55EB8, &qword_1EAE55EC0);
    sub_1E46A5570();
    swift_release();
  }
  else
  {
    uint64_t v10 = sub_1E46A5A30();
    uint64_t v12 = v11;
    id v13 = objc_msgSend(self, sel_secondarySystemGroupedBackgroundColor);
    uint64_t v14 = MEMORY[0x1E4E82EB0](v13);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v21 = v10;
    *(void *)&long long v22 = v12;
    *((void *)&v22 + 1) = KeyPath;
    uint64_t v23 = v14;
    v24[0] = 0x3FF0000000000000;
    LOWORD(v24[1]) = 256;
    BYTE2(v24[1]) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55E90);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55EC0);
    sub_1E468235C();
    sub_1E46671BC(&qword_1EAE55EB8, &qword_1EAE55EC0);
    sub_1E46A5570();
  }
  double result = *(double *)&v25;
  long long v17 = v26;
  uint64_t v18 = v27;
  __int16 v19 = v28;
  char v20 = v29;
  *(_OWORD *)a2 = v25;
  *(_OWORD *)(a2 + 16) = v17;
  *(void *)(a2 + 32) = v18;
  *(_WORD *)(a2 + 40) = v19;
  *(unsigned char *)(a2 + 42) = v20;
  return result;
}

uint64_t sub_1E46822A4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4681CAC(*v1, v1[1], v1[2], a1);
}

double sub_1E46822B0@<D0>(uint64_t a1@<X8>)
{
  return sub_1E4681FE0(*(void **)(v1 + 16), a1);
}

unint64_t sub_1E46822BC()
{
  unint64_t result = qword_1EAE55E80;
  if (!qword_1EAE55E80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE55E78);
    sub_1E468235C();
    sub_1E46671BC(&qword_1EAE55EB8, &qword_1EAE55EC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE55E80);
  }
  return result;
}

unint64_t sub_1E468235C()
{
  unint64_t result = qword_1EAE55E88;
  if (!qword_1EAE55E88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE55E90);
    sub_1E468241C(&qword_1EAE55E98, &qword_1EAE55EA0);
    sub_1E46671BC(&qword_1EAE55EA8, &qword_1EAE55EB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE55E88);
  }
  return result;
}

uint64_t sub_1E468241C(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_1E468248C()
{
  unint64_t result = qword_1EAE55EC8;
  if (!qword_1EAE55EC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE55E70);
    sub_1E468252C();
    sub_1E46671BC(&qword_1EAE55ED8, qword_1EAE55EE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE55EC8);
  }
  return result;
}

unint64_t sub_1E468252C()
{
  unint64_t result = qword_1EAE55ED0;
  if (!qword_1EAE55ED0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE55E68);
    sub_1E468241C((unint64_t *)&qword_1EAE55B30, &qword_1EAE55B20);
    sub_1E46822BC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE55ED0);
  }
  return result;
}

uint64_t sub_1E46825D4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55E70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E4682634@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1E46A53A0();
  *a1 = result;
  return result;
}

uint64_t sub_1E4682660()
{
  return sub_1E46A53B0();
}

uint64_t sub_1E468268C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1E46826E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_1E466CF7C;
  return off_1F40ECF20(a1, a2, a3, a4, 0);
}

uint64_t sub_1E4682930(int a1, uint64_t a2, uint64_t a3, void *aBlock)
{
  v4[2] = _Block_copy(aBlock);
  uint64_t v7 = sub_1E46A6050();
  uint64_t v9 = v8;
  v4[3] = v8;
  uint64_t v10 = (void *)swift_task_alloc();
  v4[4] = v10;
  *uint64_t v10 = v4;
  v10[1] = sub_1E467AF38;
  return off_1F40ECF20(v7, v9, a2, a3, 0);
}

uint64_t sub_1E4682A08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_1E4662D6C;
  return off_1F40ECF18(a1, a2, a3, a4);
}

uint64_t sub_1E4682C40(int a1, int a2, void *aBlock)
{
  v3[2] = _Block_copy(aBlock);
  uint64_t v4 = sub_1E46A6050();
  uint64_t v6 = v5;
  v3[3] = v5;
  uint64_t v7 = sub_1E46A6050();
  uint64_t v9 = v8;
  v3[4] = v8;
  uint64_t v10 = (void *)swift_task_alloc();
  v3[5] = v10;
  *uint64_t v10 = v3;
  v10[1] = sub_1E4682D24;
  return off_1F40ECF18(v4, v6, v7, v9);
}

uint64_t sub_1E4682D24()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v3 + 16);
  if (v2)
  {
    uint64_t v7 = (void *)sub_1E46A4D10();

    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
  _Block_release(*(const void **)(v4 + 16));
  uint64_t v8 = *(uint64_t (**)(void))(v5 + 8);
  return v8();
}

id SearchUIMarketplaceKitUtilities.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id SearchUIMarketplaceKitUtilities.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUIMarketplaceKitUtilities();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SearchUIMarketplaceKitUtilities()
{
  return self;
}

id SearchUIMarketplaceKitUtilities.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUIMarketplaceKitUtilities();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for SearchUIMarketplaceKitUtilities(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SearchUIMarketplaceKitUtilities);
}

uint64_t dispatch thunk of static SearchUIMarketplaceKitUtilities.requestProductPage(distributorID:itemID:versionID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 + 80) + **(int **)(v4 + 80));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_1E466CF7C;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of static SearchUIMarketplaceKitUtilities.requestSearchPage(distributorID:searchString:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 + 88) + **(int **)(v4 + 88));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_1E4662D6C;
  return v12(a1, a2, a3, a4);
}

uint64_t sub_1E46831F8()
{
  _Block_release(*(const void **)(v0 + 32));
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1E4683240()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1E4662D6C;
  uint64_t v6 = (uint64_t (*)(int, int, void *))((char *)&dword_1EAE55F08 + dword_1EAE55F08);
  return v6(v2, v3, v4);
}

uint64_t sub_1E4683308()
{
  _Block_release(*(const void **)(v0 + 40));
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1E4683348()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_1E466CF7C;
  uint64_t v7 = (uint64_t (*)(int, uint64_t, uint64_t, void *))((char *)&dword_1EAE55F18 + dword_1EAE55F18);
  return v7(v2, v3, v4, v5);
}

uint64_t sub_1E4683418()
{
  return 0;
}

uint64_t sub_1E46835A0(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  uint64_t v10 = (uint64_t (*)(uint64_t))((char *)&dword_1EAE55F48 + dword_1EAE55F48);
  id v6 = a1;
  id v7 = a3;
  uint64_t v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_1E4683674;
  return v10((uint64_t)v6);
}

uint64_t sub_1E4683674()
{
  uint64_t v1 = *(void (***)(void, void))(*v0 + 32);
  uint64_t v2 = *(void **)(*v0 + 24);
  uint64_t v3 = *(void **)(*v0 + 16);
  uint64_t v7 = *v0;
  swift_task_dealloc();

  uint64_t v4 = (void *)sub_1E46A6100();
  swift_bridgeObjectRelease();
  ((void (**)(void, void *))v1)[2](v1, v4);

  _Block_release(v1);
  uint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

id sub_1E4683834()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUIWeatherColor();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SearchUIWeatherColor()
{
  return self;
}

uint64_t sub_1E468388C()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1E46838D4()
{
  objc_super v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1E4662D6C;
  id v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_1EAE55F38 + dword_1EAE55F38);
  return v6(v2, v3, v4);
}

uint64_t sub_1E4683990(uint64_t a1)
{
  v1[3] = a1;
  uint64_t v2 = sub_1E46A5F70();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  void v1[6] = swift_task_alloc();
  uint64_t v3 = sub_1E46A5EE0();
  v1[7] = v3;
  v1[8] = *(void *)(v3 - 8);
  v1[9] = swift_task_alloc();
  uint64_t v4 = sub_1E46A5EF0();
  v1[10] = v4;
  v1[11] = *(void *)(v4 - 8);
  v1[12] = swift_task_alloc();
  uint64_t v5 = sub_1E46A5F50();
  v1[13] = v5;
  v1[14] = *(void *)(v5 - 8);
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE535B8);
  v1[17] = swift_task_alloc();
  uint64_t v6 = sub_1E46A4DE0();
  v1[18] = v6;
  v1[19] = *(void *)(v6 - 8);
  v1[20] = swift_task_alloc();
  v1[21] = swift_task_alloc();
  uint64_t v7 = sub_1E46A5F90();
  v1[22] = v7;
  v1[23] = *(void *)(v7 - 8);
  v1[24] = swift_task_alloc();
  v1[25] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE535D0);
  v1[26] = swift_task_alloc();
  uint64_t v8 = sub_1E46A4E60();
  v1[27] = v8;
  v1[28] = *(void *)(v8 - 8);
  v1[29] = swift_task_alloc();
  v1[30] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE535D8);
  v1[31] = swift_task_alloc();
  uint64_t v9 = sub_1E46A4EC0();
  v1[32] = v9;
  v1[33] = *(void *)(v9 - 8);
  v1[34] = swift_task_alloc();
  v1[35] = swift_task_alloc();
  v1[36] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E4683DC0, 0, 0);
}

uint64_t sub_1E4683DC0()
{
  id v1 = objc_msgSend(*(id *)(v0 + 24), sel_location);
  if (!v1)
  {
    if (qword_1EAE55650 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_1E46A5180();
    __swift_project_value_buffer(v15, (uint64_t)qword_1EAE57FE0);
    long long v16 = sub_1E46A5160();
    os_log_type_t v17 = sub_1E46A6260();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_1E45B5000, v16, v17, "Invalid SFWeatherColor provided: no coordinates set!", v18, 2u);
      MEMORY[0x1E4E84AA0](v18, -1, -1);
    }

    goto LABEL_24;
  }
  uint64_t v2 = v1;
  uint64_t v3 = *(void **)(v0 + 24);
  (*(void (**)(void, void, void))(*(void *)(v0 + 264) + 104))(*(void *)(v0 + 288), *MEMORY[0x1E4F45FF0], *(void *)(v0 + 256));
  id v4 = objc_msgSend(v3, sel_condition);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v7 = *(void *)(v0 + 256);
    uint64_t v6 = *(void *)(v0 + 264);
    uint64_t v8 = *(void *)(v0 + 248);
    sub_1E46A6050();

    sub_1E46A4EB0();
    int v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v8, 1, v7);
    uint64_t v10 = *(void *)(v0 + 280);
    uint64_t v11 = *(void *)(v0 + 256);
    uint64_t v12 = *(void *)(v0 + 264);
    uint64_t v13 = *(void *)(v0 + 248);
    if (v9 == 1)
    {
      uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32);
      v14(*(void *)(v0 + 280), *(void *)(v0 + 288), *(void *)(v0 + 256));
      sub_1E4666020(v13, &qword_1EAE535D8);
    }
    else
    {
      (*(void (**)(void, void))(v12 + 8))(*(void *)(v0 + 288), *(void *)(v0 + 256));
      uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32);
      v14(v10, v13, v11);
    }
    v14(*(void *)(v0 + 288), *(void *)(v0 + 280), *(void *)(v0 + 256));
  }
  objc_msgSend(v2, sel_lat);
  double v20 = v19;
  objc_msgSend(v2, sel_lng);
  id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1E5F0]), sel_initWithLatitude_longitude_, v20, v21);
  id v23 = objc_msgSend(self, sel__timeZoneAtLocation_, v22);
  if (!v23)
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 224) + 56))(*(void *)(v0 + 208), 1, 1, *(void *)(v0 + 216));
    goto LABEL_18;
  }
  id v24 = v23;
  uint64_t v25 = *(void *)(v0 + 224);
  uint64_t v26 = *(void *)(v0 + 232);
  uint64_t v28 = *(void *)(v0 + 208);
  uint64_t v27 = *(void *)(v0 + 216);
  sub_1E46A4E50();

  char v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 32);
  v29(v28, v26, v27);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v25 + 56))(v28, 0, 1, v27);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v28, 1, v27) == 1)
  {
LABEL_18:
    sub_1E4666020(*(void *)(v0 + 208), &qword_1EAE535D0);
    if (qword_1EAE55650 != -1) {
      swift_once();
    }
    uint64_t v38 = sub_1E46A5180();
    __swift_project_value_buffer(v38, (uint64_t)qword_1EAE57FE0);
    id v39 = v22;
    long long v40 = sub_1E46A5160();
    os_log_type_t v41 = sub_1E46A6260();
    if (os_log_type_enabled(v40, v41))
    {
      char v42 = (uint8_t *)swift_slowAlloc();
      id v80 = v22;
      uint64_t v43 = (void *)swift_slowAlloc();
      *(_DWORD *)char v42 = 138412290;
      *(void *)(v0 + 16) = v39;
      id v44 = v39;
      sub_1E46A62C0();
      *uint64_t v43 = v80;

      _os_log_impl(&dword_1E45B5000, v40, v41, "Failed to determine timeZone from location: %@", v42, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE55F50);
      swift_arrayDestroy();
      MEMORY[0x1E4E84AA0](v43, -1, -1);
      MEMORY[0x1E4E84AA0](v42, -1, -1);
    }
    else
    {
    }
    uint64_t v45 = *(void *)(v0 + 288);
    uint64_t v46 = *(void *)(v0 + 256);
    uint64_t v47 = *(void *)(v0 + 264);

    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v45, v46);
LABEL_24:
    uint64_t v73 = MEMORY[0x1E4FBC860];
    goto LABEL_25;
  }
  uint64_t v30 = *(void **)(v0 + 24);
  v29(*(void *)(v0 + 240), *(void *)(v0 + 208), *(void *)(v0 + 216));
  objc_msgSend(v22, sel_coordinate);
  id v31 = objc_msgSend(v30, sel_date);
  id v79 = v22;
  uint64_t v81 = v2;
  if (!v31)
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 152) + 56))(*(void *)(v0 + 136), 1, 1, *(void *)(v0 + 144));
    goto LABEL_29;
  }
  uint64_t v32 = v31;
  uint64_t v33 = *(void *)(v0 + 152);
  uint64_t v34 = *(void *)(v0 + 160);
  uint64_t v36 = *(void *)(v0 + 136);
  uint64_t v35 = *(void *)(v0 + 144);
  sub_1E46A4DC0();

  char v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 32);
  v37(v36, v34, v35);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v33 + 56))(v36, 0, 1, v35);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v36, 1, v35) == 1)
  {
LABEL_29:
    uint64_t v50 = *(void *)(v0 + 136);
    sub_1E46A4DD0();
    sub_1E4666020(v50, &qword_1EAE535B8);
    goto LABEL_30;
  }
  v37(*(void *)(v0 + 168), *(void *)(v0 + 136), *(void *)(v0 + 144));
LABEL_30:
  uint64_t v82 = *(void *)(v0 + 288);
  uint64_t v51 = *(void *)(v0 + 264);
  uint64_t v60 = *(void *)(v0 + 272);
  uint64_t v78 = *(void *)(v0 + 256);
  uint64_t v72 = *(void *)(v0 + 240);
  uint64_t v75 = *(void *)(v0 + 224);
  uint64_t v76 = *(void *)(v0 + 216);
  uint64_t v52 = *(void *)(v0 + 200);
  uint64_t v61 = *(void *)(v0 + 192);
  uint64_t v53 = *(void *)(v0 + 184);
  uint64_t v77 = *(void *)(v0 + 176);
  uint64_t v54 = *(void *)(v0 + 168);
  uint64_t v55 = *(void *)(v0 + 144);
  uint64_t v56 = *(void *)(v0 + 152);
  uint64_t v57 = *(void *)(v0 + 128);
  uint64_t v74 = *(void *)(v0 + 120);
  uint64_t v64 = *(void *)(v0 + 112);
  uint64_t v65 = *(void *)(v0 + 104);
  uint64_t v66 = *(void *)(v0 + 96);
  uint64_t v70 = *(void *)(v0 + 88);
  uint64_t v71 = *(void *)(v0 + 80);
  uint64_t v58 = *(void *)(v0 + 64);
  uint64_t v62 = *(void *)(v0 + 72);
  uint64_t v63 = *(void *)(v0 + 56);
  uint64_t v67 = *(void *)(v0 + 48);
  uint64_t v59 = *(void **)(v0 + 24);
  uint64_t v68 = *(void *)(v0 + 40);
  uint64_t v69 = *(void *)(v0 + 32);
  sub_1E46A5F30();
  (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v54, v55);
  objc_msgSend(v59, sel_cloudCoverLowAltPct);
  objc_msgSend(v59, sel_cloudCoverMidAltPct);
  objc_msgSend(v59, sel_cloudCoverHighAltPct);
  sub_1E46A5F40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 16))(v60, v82, v78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 16))(v61, v52, v77);
  sub_1E46A5F80();
  (*(void (**)(uint64_t, void, uint64_t))(v58 + 104))(v62, *MEMORY[0x1E4FB6030], v63);
  objc_msgSend(v59, sel_cloudCover);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 16))(v74, v57, v65);
  sub_1E46A5ED0();
  sub_1E46A5F20();
  swift_allocObject();
  sub_1E46A5F10();
  sub_1E46A5F00();
  swift_release();
  uint64_t v73 = sub_1E46A5F60();

  (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v67, v69);
  (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v66, v71);
  (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v57, v65);
  (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v52, v77);
  (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v72, v76);
  (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v82, v78);
LABEL_25:
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v48 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v48(v73);
}

uint64_t sub_1E46847BC()
{
  return type metadata accessor for SupplementaryHostingView();
}

void sub_1E46847D0(void *a1, uint64_t a2, unsigned int a3, void *a4, void *a5, uint64_t a6, uint64_t a7)
{
  id v23 = a5;
  unsigned int v24 = a3;
  uint64_t v12 = sub_1E46A4EA0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  long long v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  type metadata accessor for SupplementaryHostingView();
  if (swift_dynamicCastClass())
  {
    os_log_type_t v17 = (void *)sub_1E468F92C();
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, a2, v12);
    uint64_t v18 = *(void (**)(id, char *, void, id, uint64_t, uint64_t))(a7 + 32);
    id v19 = v17;
    id v20 = a1;
    id v21 = a4;
    id v22 = v23;
    v18(v21, v16, v24, v22, a6, a7);
    sub_1E46A52F0();
  }
}

uint64_t sub_1E46849A0(uint64_t a1, uint64_t a2)
{
  return sub_1E46849B8(a1, a2, &qword_1EB99B9E0);
}

uint64_t sub_1E46849AC(uint64_t a1, uint64_t a2)
{
  return sub_1E46849B8(a1, a2, &qword_1EB99B9F0);
}

uint64_t sub_1E46849B8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_1E46A6060();
}

uint64_t sub_1E46849EC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t KeyPath = swift_getKeyPath();

  uint64_t v9 = sub_1E46A4EA0();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a2, v9);
  *(void *)a4 = KeyPath;
  *(unsigned char *)(a4 + _Block_object_dispose(&a9, 8) = 0;
  return result;
}

uint64_t sub_1E4684A80@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_1E46A5370();
  *a1 = v3;
  return result;
}

uint64_t sub_1E4684AAC()
{
  return sub_1E46A5380();
}

uint64_t sub_1E4684AD4@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_1E46A5370();
  *a1 = v3;
  return result;
}

uint64_t sub_1E4684B00()
{
  return sub_1E46A5380();
}

uint64_t AppDependency<>.init(manager:)()
{
  return sub_1E46A4950();
}

id sub_1E4684C58()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RequestUserReportUtility();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for RequestUserReportUtility()
{
  return self;
}

uint64_t sub_1E4684CB0(void *a1, void *a2, void *a3)
{
  uint64_t v35 = a2;
  uint64_t v5 = type metadata accessor for SearchUIUserReportModel();
  uint64_t v6 = MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (void *)((char *)v31 - v9);
  uint64_t v11 = type metadata accessor for SearchUIUserReportRequestView();
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (void *)((char *)v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (objc_msgSend(a3, sel_feedbackDelegate))
  {
    uint64_t v36 = &unk_1F41095F0;
    uint64_t v14 = swift_dynamicCastObjCProtocolConditional();
    if (!v14) {
      swift_unknownObjectRelease();
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v15 = objc_msgSend(a3, sel_feedbackDelegate);
  if (v14)
  {
    uint64_t v32 = v10;
    uint64_t v33 = a1;
    uint64_t v16 = v11;
    uint64_t v34 = v8;
    uint64_t v17 = v14;
LABEL_7:
    uint64_t v18 = v35;
    id v19 = v33;
    *uint64_t v13 = v35;
    v13[1] = v19;
    v13[2] = v17;
    v13[3] = a3;
    swift_unknownObjectRetain();
    id v20 = v18;
    id v21 = v19;
    swift_unknownObjectRetain();
    id v22 = a3;
    id v23 = v32;
    sub_1E466EA58(v32);
    sub_1E4684FB8((uint64_t)v23, (uint64_t)v34);
    sub_1E46A5920();
    sub_1E468501C((uint64_t)v23);
    unsigned int v24 = (void *)((char *)v13 + *(int *)(v16 + 36));
    uint64_t *v24 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55BB8);
    swift_storeEnumTagMultiPayload();
    id v25 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(qword_1EAE55F60));
    uint64_t v26 = sub_1E46A5560();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease_n();
  }
  else if (v15)
  {
    uint64_t v33 = a1;
    uint64_t v34 = v8;
    v31[1] = v5;
    while (1)
    {
      char v37 = &unk_1F41095F0;
      uint64_t v27 = swift_dynamicCastObjCProtocolConditional();
      if (v27)
      {
        uint64_t v17 = v27;
        uint64_t v32 = v10;
        uint64_t v16 = v11;
        swift_unknownObjectRetain_n();
        goto LABEL_7;
      }
      self;
      uint64_t v28 = (void *)swift_dynamicCastObjCClass();
      if (!v28) {
        break;
      }
      id v29 = objc_msgSend(v28, sel_feedbackListener);
      swift_unknownObjectRelease();
      if (!v29) {
        return 0;
      }
    }
    swift_unknownObjectRelease();
    return 0;
  }
  else
  {
    return 0;
  }
  return v26;
}

uint64_t sub_1E4684FB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SearchUIUserReportModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E468501C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SearchUIUserReportModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E4685078()
{
  return sub_1E46A5400();
}

void sub_1E468509C()
{
  id v1 = *(void **)(v0 + 16);
  id v2 = objc_msgSend(v1, sel_command);
  if (!v2) {
    goto LABEL_23;
  }
  uint64_t v3 = v2;
  self;
  uint64_t v4 = (void *)swift_dynamicCastObjCClass();
  if (v4)
  {
    id v5 = objc_msgSend(v4, sel_punchout);
    id v6 = objc_msgSend(*(id *)(v0 + 24), sel_section);
    if (v6)
    {
      uint64_t v7 = v6;
      id v8 = objc_msgSend(v6, sel_resultSection);

      if (!v8) {
        goto LABEL_13;
      }
      id v9 = objc_msgSend(v8, sel_results);

      if (!v9)
      {
        id v8 = 0;
        if (v5) {
          goto LABEL_14;
        }
LABEL_18:

        if (!v8) {
          return;
        }
        uint64_t v3 = v8;
        goto LABEL_22;
      }
      sub_1E4685D64(0, &qword_1EAE53558);
      unint64_t v10 = sub_1E46A6110();

      if (v10 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v11 = (void *)sub_1E46A6440();
        swift_bridgeObjectRelease();
        if (!v11) {
          goto LABEL_12;
        }
      }
      else
      {
        uint64_t v11 = *(void **)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (!v11)
        {
LABEL_12:
          swift_bridgeObjectRelease();
          id v8 = objc_msgSend(v11, sel_moreResultsPunchout);

LABEL_13:
          if (v5)
          {
LABEL_14:
            if (v8)
            {
              sub_1E4685D64(0, (unint64_t *)&qword_1EAE53400);
              id v13 = v5;
              char v14 = sub_1E46A62A0();

              if (v14) {
                return;
              }
              goto LABEL_23;
            }

            goto LABEL_22;
          }
          goto LABEL_18;
        }
      }
      if ((v10 & 0xC000000000000001) != 0)
      {
        id v12 = (id)MEMORY[0x1E4E83990](0, v10);
        goto LABEL_11;
      }
      if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        id v12 = *(id *)(v10 + 32);
LABEL_11:
        uint64_t v11 = v12;
        goto LABEL_12;
      }
      __break(1u);
    }

    __break(1u);
    return;
  }
LABEL_22:

LABEL_23:
  id v15 = objc_msgSend(v1, sel_command);
  if (v15)
  {
    uint64_t v16 = v15;
    self;
    swift_dynamicCastObjCClass();
  }
}

void *sub_1E468531C(void *a1, void *a2)
{
  id v5 = (char *)v2 + OBJC_IVAR____TtC8SearchUI22ButtonItemHeaderAction___observationRegistrar;
  sub_1E46A4EF0();
  id v6 = objc_msgSend(a2, sel_commandEnvironment);
  if (!v6) {
    goto LABEL_15;
  }
  uint64_t v7 = v6;
  id v8 = objc_msgSend(a1, sel_section);
  id v9 = objc_msgSend(v8, sel_collectionSection);

  id v10 = objc_msgSend(v9, sel_buttonItem);
  if (!v10)
  {
    id v24 = objc_msgSend(a1, sel_section);
    if (!v24
      || (id v25 = v24,
          id v26 = objc_msgSend(v24, sel_resultSection),
          v25,
          !v26)
      || (id v10 = objc_msgSend(v26, sel_button), v26, !v10))
    {
      id v12 = a1;
      a1 = a2;
      a2 = v7;
      goto LABEL_14;
    }
  }
  uint64_t v11 = self;
  id v12 = v10;
  id v13 = objc_msgSend(v12, sel_command);
  LODWORD(v11) = objc_msgSend(v11, sel_hasValidHandlerForCommand_rowModel_environment_, v13, 0, v7);

  if (v11)
  {
    id v14 = objc_msgSend(v12, sel_title);
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = sub_1E46A6050();
      uint64_t v18 = v17;

      id v19 = objc_msgSend(v12, sel_image);
      if (v19)
      {
        self;
        id v20 = (void *)swift_dynamicCastObjCClass();
        if (v20)
        {
          id v21 = objc_msgSend(v20, sel_symbolName);

          if (v21)
          {
            id v19 = (id)sub_1E46A6050();
            uint64_t v23 = v22;

LABEL_21:
            v2[2] = v12;
            v2[3] = a1;
            v2[4] = v7;
            v2[5] = v16;
            v2[6] = v18;
            v2[7] = v19;
            v2[8] = v23;
            return v2;
          }
        }
        else
        {
        }
        id v19 = 0;
      }
      else
      {
      }
      uint64_t v23 = 0;
      goto LABEL_21;
    }
  }

LABEL_14:
LABEL_15:

  uint64_t v27 = sub_1E46A4F00();
  (*(void (**)(char *, uint64_t))(*(void *)(v27 - 8) + 8))(v5, v27);
  type metadata accessor for ButtonItemHeaderAction();
  swift_deallocPartialClassInstance();
  return 0;
}

void sub_1E468562C()
{
  id v1 = *(void **)(v0 + 24);
  id v2 = objc_msgSend(v1, sel_section);
  id v3 = objc_msgSend(v2, sel_resultSection);

  id v4 = objc_msgSend(v1, sel_section);
  if (!v4
    || (id v5 = v4, v6 = objc_msgSend(v4, sel_collectionSection), v5, !v6))
  {
    id v29 = 0;
    goto LABEL_16;
  }
  if (v3)
  {
    id v7 = objc_msgSend(v3, sel_results);
    if (v7)
    {
      id v8 = v7;
      sub_1E4685D64(0, &qword_1EAE53558);
      unint64_t v9 = sub_1E46A6110();

      if (v9 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v13 = sub_1E46A6440();
        swift_bridgeObjectRelease();
        if (v13) {
          goto LABEL_7;
        }
      }
      else if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_7:
        if ((v9 & 0xC000000000000001) != 0)
        {
          id v10 = (id)MEMORY[0x1E4E83990](0, v9);
        }
        else
        {
          if (!*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_33;
          }
          id v10 = *(id *)(v9 + 32);
        }
        uint64_t v11 = v10;
        swift_bridgeObjectRelease();
        id v12 = objc_msgSend(v11, sel_queryId);

        goto LABEL_15;
      }
      swift_bridgeObjectRelease();
    }
  }
  id v12 = objc_msgSend(*(id *)(v0 + 32), sel_queryId);
LABEL_15:
  id v14 = objc_allocWithZone((Class)SearchUIRowModel);
  id v15 = v6;
  uint64_t v16 = (void *)sub_1E46A6040();
  id v29 = objc_msgSend(v14, sel_initWithCardSection_queryId_itemIdentifier_, v15, v12, v16);

LABEL_16:
  uint64_t v17 = *(void **)(v0 + 32);
  objc_msgSend(v17, sel_setSection_, v3);
  id v18 = objc_msgSend(self, sel_handlerForButton_rowModel_sectionModel_environment_, *(void *)(v0 + 16), v29, v1, v17);
  if (!v18)
  {
LABEL_33:

    __break(1u);
LABEL_34:

    __break(1u);
    goto LABEL_35;
  }
  id v19 = v18;
  objc_msgSend(v18, sel_executeWithTriggerEvent_, 2);

  sub_1E468509C();
  if (!v3)
  {
LABEL_25:

    return;
  }
  char v21 = v20;
  id v22 = v3;
  id v23 = objc_msgSend(v17, sel_feedbackDelegate);
  if (!v23) {
    goto LABEL_34;
  }
  unsigned __int8 v24 = objc_msgSend(v23, sel_respondsToSelector_, sel_didEngageSection_);
  swift_unknownObjectRelease();
  if ((v24 & 1) == 0) {
    goto LABEL_24;
  }
  id v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F9A3E8]), sel_initWithSection_triggerEvent_, v22, v21 & 1);
  if (!v25) {
    goto LABEL_24;
  }
  id v26 = v25;
  id v27 = objc_msgSend(v17, sel_feedbackDelegate);
  if (!v27)
  {
LABEL_35:

    __break(1u);
    return;
  }
  uint64_t v28 = v27;
  if (objc_msgSend(v27, sel_respondsToSelector_, sel_didEngageSection_))
  {
    objc_msgSend(v28, sel_didEngageSection_, v26);

    swift_unknownObjectRelease();
LABEL_24:

    goto LABEL_25;
  }

  swift_unknownObjectRelease();
}

uint64_t sub_1E46859F8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v1 = (char *)v0 + OBJC_IVAR____TtC8SearchUI22ButtonItemHeaderAction___observationRegistrar;
  uint64_t v2 = sub_1E46A4F00();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_1E4685AC0()
{
  return type metadata accessor for ButtonItemHeaderAction();
}

uint64_t type metadata accessor for ButtonItemHeaderAction()
{
  uint64_t result = qword_1EAE534F0;
  if (!qword_1EAE534F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1E4685B14()
{
  uint64_t result = sub_1E46A4F00();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1E4685BCC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1E4685C00()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1E4685C34()
{
  sub_1E468509C();
  if (v0) {
    return 1;
  }
  else {
    return 3;
  }
}

void sub_1E4685C64()
{
}

void *sub_1E4685C88@<X0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  type metadata accessor for ButtonItemHeaderAction();
  swift_allocObject();
  uint64_t result = sub_1E468531C(a1, a2);
  *a3 = result;
  return result;
}

unint64_t sub_1E4685CE4(uint64_t a1)
{
  unint64_t result = sub_1E4685D0C();
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = result;
  return result;
}

unint64_t sub_1E4685D0C()
{
  unint64_t result = qword_1EAE534E0;
  if (!qword_1EAE534E0)
  {
    type metadata accessor for ButtonItemHeaderAction();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE534E0);
  }
  return result;
}

uint64_t sub_1E4685D64(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1E4685DA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 16);
}

uint64_t sub_1E4685DA8()
{
  uint64_t result = sub_1E46A4E10();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_1E4685E74(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = sub_1E46A4E10();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = *(void *)(a3 + 16);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(_DWORD *)(v10 + 80);
  uint64_t v12 = v8 + v11;
  unint64_t v13 = ((v8 + v11) & ~v11) + *(void *)(v10 + 64);
  uint64_t v14 = (*(unsigned char *)(v7 + 80) | *(unsigned char *)(v10 + 80));
  if (v14 > 7 || ((*(_DWORD *)(v7 + 80) | *(_DWORD *)(v10 + 80)) & 0x100000) != 0 || v13 > 0x18)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v14 + 16) & ~v14));
    sub_1E46A4AB0();
  }
  else
  {
    uint64_t v18 = ~v11;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 16))(((unint64_t)a1 + v12) & v18, ((unint64_t)a2 + v12) & v18, v9);
  }
  return a1;
}

uint64_t sub_1E4685FD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E46A4E10();
  uint64_t v5 = *(void *)(v4 - 8) + 8;
  (*(void (**)(uint64_t, uint64_t))v5)(a1, v4);
  uint64_t v6 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v7 = *(uint64_t (**)(unint64_t))(v6 + 8);
  unint64_t v8 = (*(void *)(v5 + 56) + a1 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  return v7(v8);
}

uint64_t sub_1E4686088(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E46A4E10();
  uint64_t v7 = *(void *)(v6 - 8) + 16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, v6);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 16))((*(void *)(v7 + 48) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(void *)(v7 + 48) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

uint64_t sub_1E4686140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E46A4E10();
  uint64_t v7 = *(void *)(v6 - 8) + 24;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, v6);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 24))((*(void *)(v7 + 40) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(void *)(v7 + 40) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

uint64_t sub_1E46861F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E46A4E10();
  uint64_t v7 = *(void *)(v6 - 8) + 32;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, v6);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 32))((*(void *)(v7 + 32) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(void *)(v7 + 32) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

uint64_t sub_1E46862B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E46A4E10();
  uint64_t v7 = *(void *)(v6 - 8) + 40;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, v6);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 40))((*(void *)(v7 + 24) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(void *)(v7 + 24) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

uint64_t sub_1E4686368(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = sub_1E46A4E10();
  uint64_t v7 = *(void *)(v6 - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  uint64_t v9 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v10 = *(unsigned int *)(v9 + 84);
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  if (v10 <= v8) {
    unsigned int v12 = *(_DWORD *)(v7 + 84);
  }
  else {
    unsigned int v12 = *(_DWORD *)(v9 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v13 = *(void *)(*(void *)(v6 - 8) + 64) + v11;
  if (a2 <= v12) {
    goto LABEL_24;
  }
  uint64_t v14 = (v13 & ~v11) + *(void *)(v9 + 64);
  char v15 = 8 * v14;
  if (v14 <= 3)
  {
    unsigned int v17 = ((a2 - v12 + ~(-1 << v15)) >> v15) + 1;
    if (HIWORD(v17))
    {
      int v16 = *(_DWORD *)((char *)a1 + v14);
      if (!v16) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v17 > 0xFF)
    {
      int v16 = *(unsigned __int16 *)((char *)a1 + v14);
      if (!*(unsigned __int16 *)((char *)a1 + v14)) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v17 < 2)
    {
LABEL_24:
      if (v12)
      {
        if (v8 >= v10)
        {
          id v23 = *(uint64_t (**)(unsigned __int16 *))(v7 + 48);
          return v23(a1);
        }
        else
        {
          char v21 = *(uint64_t (**)(unint64_t, uint64_t))(v9 + 48);
          return v21(((unint64_t)a1 + v13) & ~v11, v10);
        }
      }
      return 0;
    }
  }
  int v16 = *((unsigned __int8 *)a1 + v14);
  if (!*((unsigned char *)a1 + v14)) {
    goto LABEL_24;
  }
LABEL_14:
  int v18 = (v16 - 1) << v15;
  if (v14 > 3) {
    int v18 = 0;
  }
  if (v14)
  {
    if (v14 <= 3) {
      int v19 = (v13 & ~v11) + *(_DWORD *)(v9 + 64);
    }
    else {
      int v19 = 4;
    }
    switch(v19)
    {
      case 2:
        int v20 = *a1;
        break;
      case 3:
        int v20 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v20 = *(_DWORD *)a1;
        break;
      default:
        int v20 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v20 = 0;
  }
  return v12 + (v20 | v18) + 1;
}

void sub_1E46865C8(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8 = sub_1E46A4E10();
  uint64_t v9 = *(void *)(v8 - 8);
  unsigned int v10 = *(_DWORD *)(v9 + 84);
  uint64_t v11 = *(void *)(*(void *)(a4 + 16) - 8);
  uint64_t v12 = *(unsigned int *)(v11 + 84);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  if (v12 <= v10) {
    unsigned int v14 = *(_DWORD *)(v9 + 84);
  }
  else {
    unsigned int v14 = *(_DWORD *)(v11 + 84);
  }
  uint64_t v15 = *(void *)(*(void *)(v8 - 8) + 64) + v13;
  size_t v16 = (v15 & ~v13) + *(void *)(v11 + 64);
  if (a3 <= v14)
  {
    int v17 = 0;
  }
  else if (v16 <= 3)
  {
    unsigned int v20 = ((a3 - v14 + ~(-1 << (8 * v16))) >> (8 * v16)) + 1;
    if (HIWORD(v20))
    {
      int v17 = 4;
    }
    else if (v20 >= 0x100)
    {
      int v17 = 2;
    }
    else
    {
      int v17 = v20 > 1;
    }
  }
  else
  {
    int v17 = 1;
  }
  if (v14 < a2)
  {
    unsigned int v18 = ~v14 + a2;
    if (v16 < 4)
    {
      int v19 = (v18 >> (8 * v16)) + 1;
      if (v16)
      {
        int v21 = v18 & ~(-1 << (8 * v16));
        bzero(a1, v16);
        if (v16 == 3)
        {
          *(_WORD *)a1 = v21;
          a1[2] = BYTE2(v21);
        }
        else if (v16 == 2)
        {
          *(_WORD *)a1 = v21;
        }
        else
        {
          *a1 = v21;
        }
      }
    }
    else
    {
      bzero(a1, v16);
      *(_DWORD *)a1 = v18;
      int v19 = 1;
    }
    switch(v17)
    {
      case 1:
        a1[v16] = v19;
        return;
      case 2:
        *(_WORD *)&a1[v16] = v19;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v16] = v19;
        return;
      default:
        return;
    }
  }
  switch(v17)
  {
    case 1:
      a1[v16] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v16] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x1E46868A8);
    case 4:
      *(_DWORD *)&a1[v16] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if (v10 >= v12)
        {
          id v23 = *(void (**)(unsigned char *, uint64_t))(v9 + 56);
          v23(a1, a2);
        }
        else
        {
          id v22 = *(void (**)(unint64_t, uint64_t, uint64_t))(v11 + 56);
          v22((unint64_t)&a1[v15] & ~v13, a2, v12);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for IdentifiableContainer()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_1E46868EC()
{
  unint64_t result = qword_1EAE55FE8[0];
  if (!qword_1EAE55FE8[0])
  {
    sub_1E46A4E10();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EAE55FE8);
  }
  return result;
}

uint64_t sub_1E4686944@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1E46A4E10();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1E46869DC()
{
  swift_getKeyPath();
  sub_1E4687ABC();
  sub_1E46A4EE0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_1E4686A4C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1E4687ABC();
  sub_1E46A4EE0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 16);
  return result;
}

uint64_t sub_1E4686AC4()
{
  return swift_release();
}

void sub_1E4686B64()
{
  swift_getKeyPath();
  sub_1E4687ABC();
  sub_1E46A4EE0();
  swift_release();
  uint64_t v0 = self;
  uint64_t v1 = (void *)sub_1E46A6040();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_localizedStringForKey_, v1);

  if (v2)
  {
    sub_1E46A6050();
  }
  else
  {
    __break(1u);
  }
}

id sub_1E4686C70(void *a1, void *a2)
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  uint64_t v5 = v2 + OBJC_IVAR____TtC8SearchUI25ExpandSectionHeaderAction___observationRegistrar;
  sub_1E46A4EF0();
  id v6 = objc_msgSend(a2, sel_headerDelegate);
  if (!v6) {
    goto LABEL_6;
  }
  uint64_t v7 = v6;
  sub_1E4687B14(a1);
  if ((v8 & 1) == 0)
  {
    swift_unknownObjectRelease();
LABEL_6:

    sub_1E466344C(v2 + 32);
    sub_1E466344C(v2 + 40);
    uint64_t v13 = sub_1E46A4F00();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v5, v13);
    type metadata accessor for ExpandSectionHeaderAction();
    swift_deallocPartialClassInstance();
    return 0;
  }
  *(unsigned char *)(v2 + 16) = objc_msgSend(v7, sel_isExpandedForSectionModel_, a1);
  *(void *)(v2 + 24) = a1;
  swift_unknownObjectWeakAssign();
  id v9 = a1;
  id result = objc_msgSend(a2, sel_commandEnvironment);
  if (result)
  {
    uint64_t v11 = result;
    id v12 = objc_msgSend(result, sel_feedbackDelegate);
    swift_unknownObjectRelease();

    swift_unknownObjectWeakAssign();
    swift_unknownObjectRelease();
    return (id)v2;
  }
  __break(1u);
  return result;
}

void sub_1E4686E44()
{
  uint64_t v1 = v0;
  uint64_t v2 = MEMORY[0x1E4E84B80](v0 + 32);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    swift_getKeyPath();
    sub_1E4687ABC();
    sub_1E46A4EE0();
    swift_release();
    if (*(unsigned char *)(v0 + 16)) {
      uint64_t v4 = 3;
    }
    else {
      uint64_t v4 = 2;
    }
    uint64_t v5 = *(void **)(v0 + 24);
    objc_msgSend(v3, sel_toggleExpansionForSectionModel_, v5);
    objc_msgSend(v3, sel_isExpandedForSectionModel_, v5);
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x1F4188790](KeyPath);
    sub_1E46A4ED0();
    swift_release();
    id v7 = objc_msgSend(v5, sel_section);
    if (v7)
    {
      char v8 = v7;
      id v9 = objc_msgSend(v7, sel_resultSection);

      if (v9)
      {
        id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F9A3E8]), sel_initWithSection_triggerEvent_, v9, v4);
        if (v10)
        {
          uint64_t v11 = v10;
          id v12 = (void *)MEMORY[0x1E4E84B80](v1 + 40);
          if (!v12)
          {
            swift_unknownObjectRelease();

            goto LABEL_21;
          }
          uint64_t v13 = v12;
          if (objc_msgSend(v12, sel_respondsToSelector_, sel_didEngageSection_))
          {
            objc_msgSend(v13, sel_didEngageSection_, v11);
            swift_unknownObjectRelease();

            swift_unknownObjectRelease();
LABEL_21:

            return;
          }
          swift_unknownObjectRelease();
        }
        else
        {
        }
      }
      swift_unknownObjectRelease();
      return;
    }
    __break(1u);
  }
  else
  {
    if (qword_1EAE55650 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1E46A5180();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EAE57FE0);
    os_log_type_t v15 = sub_1E46A6260();
    int v17 = sub_1E46A5160();
    if (os_log_type_enabled(v17, v15))
    {
      size_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)size_t v16 = 0;
      _os_log_impl(&dword_1E45B5000, v17, v15, "ExpandSectionHeaderAction: delegate is unexpectedly nil", v16, 2u);
      MEMORY[0x1E4E84AA0](v16, -1, -1);
    }
  }
}

uint64_t sub_1E4687174()
{
  uint64_t result = (uint64_t)objc_msgSend(v0, sel_resultSection);
  if (result)
  {
    uint64_t v2 = (void *)result;
    id v3 = objc_msgSend((id)result, sel_results);

    if (v3)
    {
      sub_1E4685D64(0, &qword_1EAE53558);
      unint64_t v4 = sub_1E46A6110();

      if (v4 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v5 = (void *)sub_1E46A6440();
        swift_bridgeObjectRelease();
        if (v5) {
          goto LABEL_5;
        }
      }
      else
      {
        uint64_t v5 = *(void **)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v5)
        {
LABEL_5:
          if ((v4 & 0xC000000000000001) != 0)
          {
            id v6 = (id)MEMORY[0x1E4E83990](0, v4);
          }
          else
          {
            if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
              goto LABEL_23;
            }
            id v6 = *(id *)(v4 + 32);
          }
          uint64_t v5 = v6;
          swift_bridgeObjectRelease();
          id v7 = objc_msgSend(self, sel_cardSectionsForRenderingResult_, v5);
          if (v7)
          {
            char v8 = v7;
            sub_1E4685D64(0, (unint64_t *)&qword_1EB99BB90);
            unint64_t v9 = sub_1E46A6110();

            if (objc_msgSend(v5, sel_renderHorizontallyWithOtherResultsInCategory))
            {
              if (v9)
              {
                if (!(v9 >> 62))
                {
                  uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
                  swift_bridgeObjectRelease();

                  return v10 == 0;
                }
LABEL_23:
                swift_bridgeObjectRetain();
                uint64_t v10 = sub_1E46A6440();

                swift_bridgeObjectRelease_n();
                return v10 == 0;
              }
              goto LABEL_15;
            }
          }
          else if (objc_msgSend(v5, sel_renderHorizontallyWithOtherResultsInCategory))
          {
LABEL_15:

            return 1;
          }
          swift_bridgeObjectRelease();

          return 0;
        }
      }
      swift_bridgeObjectRelease();
    }
    return 0;
  }
  return result;
}

unint64_t sub_1E4687388()
{
  id v1 = objc_msgSend(v0, sel_resultSection);
  if (!v1) {
    goto LABEL_12;
  }
  uint64_t v2 = v1;
  id v3 = objc_msgSend(v1, sel_results);

  if (!v3) {
    goto LABEL_12;
  }
  sub_1E4685D64(0, &qword_1EAE53558);
  unint64_t v4 = sub_1E46A6110();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1E46A6440();
    unint64_t result = swift_bridgeObjectRelease();
    if (v9) {
      goto LABEL_5;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_11;
  }
LABEL_5:
  if ((v4 & 0xC000000000000001) != 0)
  {
    id v6 = (id)MEMORY[0x1E4E83990](0, v4);
  }
  else
  {
    if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_29;
    }
    id v6 = *(id *)(v4 + 32);
  }
  id v7 = v6;
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v7, sel_moreResults);

  if (v8)
  {
LABEL_22:

    return 1;
  }
LABEL_12:
  unint64_t result = (unint64_t)objc_msgSend(v0, sel_resultSection);
  if (!result) {
    return result;
  }
  uint64_t v10 = (void *)result;
  id v11 = objc_msgSend((id)result, sel_results);

  if (v11)
  {
    sub_1E4685D64(0, &qword_1EAE53558);
    unint64_t v4 = sub_1E46A6110();

    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_1E46A6440();
      swift_bridgeObjectRelease();
      if (v12)
      {
LABEL_16:
        unint64_t result = v12 - 1;
        if (!__OFSUB__(v12, 1))
        {
          if ((v4 & 0xC000000000000001) == 0)
          {
            if ((result & 0x8000000000000000) != 0)
            {
              __break(1u);
            }
            else if (result < *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              id v13 = *(id *)(v4 + 8 * result + 32);
              goto LABEL_21;
            }
            __break(1u);
            return result;
          }
LABEL_30:
          id v13 = (id)MEMORY[0x1E4E83990](result, v4);
LABEL_21:
          uint64_t v14 = v13;
          swift_bridgeObjectRelease();
          id v8 = objc_msgSend(v14, sel_moreResults);

          if (v8) {
            goto LABEL_22;
          }
          return 0;
        }
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }
    }
    else
    {
      uint64_t v12 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v12) {
        goto LABEL_16;
      }
    }
    swift_bridgeObjectRelease();
  }
  return 0;
}

BOOL sub_1E4687600()
{
  id v1 = objc_msgSend(v0, sel_collectionSection);
  if (v1
    && (v2 = v1, id v3 = objc_msgSend(v1, sel_collectionStyle), v2, v3))
  {
    unint64_t v4 = &selRef_initiallyVisibleCardSectionCount;
  }
  else
  {
    id v5 = objc_msgSend(v0, sel_resultSection);
    if (!v5)
    {
LABEL_8:
      uint64_t v6 = 0;
      goto LABEL_9;
    }
    id v3 = v5;
    unint64_t v4 = &selRef_maxInitiallyVisibleResults;
  }
  uint64_t v6 = (uint64_t)[v3 *v4];

  if (v6 < 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_9:
  id v7 = objc_msgSend(v0, sel_collectionSection);
  if (v7
    && (v8 = v7, id v9 = objc_msgSend(v7, sel_collectionStyle), v8, v9))
  {
    objc_msgSend(v9, sel_initiallyVisibleCardSectionCount);

    id v10 = objc_msgSend(v0, sel_collectionSection);
    if (v10)
    {
      id v11 = v10;
      id v12 = objc_msgSend(v10, sel_cardSections);

      if (v12)
      {
        id v13 = (unint64_t *)&qword_1EB99BB90;
        goto LABEL_17;
      }
    }
  }
  else
  {
    id v14 = objc_msgSend(v0, sel_resultSection);
    if (v14)
    {
      os_log_type_t v15 = v14;
      id v12 = objc_msgSend(v14, sel_results);

      if (v12)
      {
        id v13 = &qword_1EAE53558;
LABEL_17:
        sub_1E4685D64(0, v13);
        unint64_t v16 = sub_1E46A6110();

        if (v16 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v17 = sub_1E46A6440();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        swift_bridgeObjectRelease();
        if (!v6) {
          return 0;
        }
        return v6 < v17;
      }
    }
  }
  if (v6)
  {
    uint64_t v17 = 0;
    return v6 < v17;
  }
  return 0;
}

uint64_t sub_1E4687828()
{
  sub_1E466344C(v0 + 32);
  sub_1E466344C(v0 + 40);
  uint64_t v1 = v0 + OBJC_IVAR____TtC8SearchUI25ExpandSectionHeaderAction___observationRegistrar;
  uint64_t v2 = sub_1E46A4F00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_1E46878E0()
{
  return type metadata accessor for ExpandSectionHeaderAction();
}

uint64_t type metadata accessor for ExpandSectionHeaderAction()
{
  uint64_t result = qword_1EAE53530;
  if (!qword_1EAE53530) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1E4687934()
{
  uint64_t result = sub_1E46A4F00();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_1E46879E8()
{
}

uint64_t sub_1E4687A0C()
{
  return 2;
}

void sub_1E4687A14()
{
}

id sub_1E4687A38@<X0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  type metadata accessor for ExpandSectionHeaderAction();
  swift_allocObject();
  id result = sub_1E4686C70(a1, a2);
  *a3 = result;
  return result;
}

unint64_t sub_1E4687A94(uint64_t a1)
{
  unint64_t result = sub_1E4687ABC();
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = result;
  return result;
}

unint64_t sub_1E4687ABC()
{
  unint64_t result = qword_1EAE53520;
  if (!qword_1EAE53520)
  {
    type metadata accessor for ExpandSectionHeaderAction();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE53520);
  }
  return result;
}

void sub_1E4687B14(void *a1)
{
  id v1 = objc_msgSend(a1, sel_section);
  if (!v1) {
    return;
  }
  uint64_t v2 = v1;
  id v3 = objc_msgSend(v1, sel_resultSection);
  if (!v3) {
    goto LABEL_13;
  }
  unint64_t v4 = v3;
  id v5 = objc_msgSend(v3, sel_results);
  if (!v5)
  {

    if (sub_1E4687174()) {
      goto LABEL_23;
    }
    goto LABEL_14;
  }
  uint64_t v6 = v5;
  sub_1E4685D64(0, &qword_1EAE53558);
  unint64_t v7 = sub_1E46A6110();

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_1E46A6440();
    swift_bridgeObjectRelease();
    if (v16) {
      goto LABEL_6;
    }
LABEL_22:

    swift_bridgeObjectRelease();
    if (sub_1E4687174()) {
      goto LABEL_23;
    }
    goto LABEL_14;
  }
  if (!*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_22;
  }
LABEL_6:
  if ((v7 & 0xC000000000000001) != 0)
  {
    id v8 = (id)MEMORY[0x1E4E83990](0, v7);
LABEL_9:
    id v9 = v8;
    swift_bridgeObjectRelease();
    if ((objc_msgSend(v9, sel_isLocalApplicationResult) & 1) == 0)
    {
      id v10 = objc_msgSend(v9, sel_applicationBundleIdentifier);
      if (v10)
      {
        id v11 = v10;
        id v12 = self;
        id v13 = objc_msgSend(v4, sel_bundleIdentifier);
        unsigned __int8 v14 = objc_msgSend(v12, sel_bundleIdentifierIsBlockedForScreenTimeExpiration_, v13);

        unsigned __int8 v15 = objc_msgSend(v12, sel_bundleIdentifierIsBlockedForScreenTimeExpiration_, v11);
        if (v14 & 1) != 0 || (v15) {
          goto LABEL_23;
        }
LABEL_13:
        if ((sub_1E4687174() & 1) == 0) {
          goto LABEL_14;
        }
LABEL_23:

        return;
      }
    }

    if (sub_1E4687174()) {
      goto LABEL_23;
    }
LABEL_14:
    if ((sub_1E4687388() & 1) == 0) {
      sub_1E4687600();
    }
    goto LABEL_23;
  }
  if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v8 = *(id *)(v7 + 32);
    goto LABEL_9;
  }
  __break(1u);
}

void sub_1E4687D5C()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 16) = *(unsigned char *)(v0 + 24);
}

void sub_1E4687D6C()
{
}

uint64_t sub_1E4687D84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 40);
}

uint64_t sub_1E4687D8C()
{
  sub_1E46A62B0();
  uint64_t result = sub_1E46A59D0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1E4687E4C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v5;
  int v7 = *(_DWORD *)(v5 + 80);
  uint64_t v8 = v7;
  int v9 = v7 + 16;
  uint64_t v10 = (v8 + 16) & ~v8;
  if (*(_DWORD *)(v5 + 84)) {
    size_t v11 = *(void *)(v5 + 64);
  }
  else {
    size_t v11 = *(void *)(v5 + 64) + 1;
  }
  size_t v12 = v10 + v11;
  int v13 = v7 & 0x100000;
  uint64_t v14 = *a2;
  *a1 = *a2;
  if (v8 > 7
    || v13 != 0
    || ((((((v10 + v11 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    a1 = (uint64_t *)(v14 + ((v8 & 0xF8 ^ 0x1F8) & v9));
    sub_1E46A4AB0();
  }
  else
  {
    unsigned int v18 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
    int v19 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
    void *v18 = *v19;
    __dst = (void *)(((unint64_t)v18 + v8 + 8) & ~v8);
    unsigned int v20 = (const void *)(((unint64_t)v19 + v8 + 8) & ~v8);
    int v21 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48);
    sub_1E46A4AB0();
    sub_1E46A4AB0();
    if (v21(v20, 1, v4))
    {
      memcpy(__dst, v20, v11);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(__dst, v20, v4);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(__dst, 0, 1, v4);
    }
    id v22 = (void *)(((unint64_t)a1 + v12 + 7) & 0xFFFFFFFFFFFFFFF8);
    id v23 = (void *)(((unint64_t)a2 + v12 + 7) & 0xFFFFFFFFFFFFFFF8);
    *id v22 = *v23;
    unsigned __int8 v24 = (void *)(((unint64_t)v22 + 15) & 0xFFFFFFFFFFFFFFF8);
    id v25 = (void *)(((unint64_t)v23 + 15) & 0xFFFFFFFFFFFFFFF8);
    void *v24 = *v25;
    id v26 = (void *)(((unint64_t)v24 + 15) & 0xFFFFFFFFFFFFFFF8);
    id v27 = (void *)(((unint64_t)v25 + 15) & 0xFFFFFFFFFFFFFFF8);
    *id v26 = *v27;
    v26[1] = v27[1];
    sub_1E46A4AB0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1E468806C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 15;
  swift_release();
  unint64_t v4 = v3 & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v7 = (v4 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v6 + 48))(v7, 1, v5)) {
    (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v7, v5);
  }
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_1E4688190(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v5 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v6 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v5 = *v6;
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = (void *)(((unint64_t)v5 + v9 + 8) & ~v9);
  size_t v11 = (const void *)(((unint64_t)v6 + v9 + 8) & ~v9);
  size_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48);
  sub_1E46A4AB0();
  sub_1E46A4AB0();
  if (v12(v11, 1, v7))
  {
    int v13 = *(_DWORD *)(v8 + 84);
    uint64_t v14 = *(void *)(v8 + 64);
    if (v13) {
      size_t v15 = *(void *)(v8 + 64);
    }
    else {
      size_t v15 = v14 + 1;
    }
    memcpy(v10, v11, v15);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(v10, v11, v7);
    uint64_t v17 = *(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56);
    uint64_t v16 = v8 + 56;
    v17(v10, 0, 1, v7);
    int v13 = *(_DWORD *)(v16 + 28);
    uint64_t v14 = *(void *)(v16 + 8);
  }
  uint64_t v18 = v14 + ((v9 + 16) & ~v9);
  if (!v13) {
    ++v18;
  }
  int v19 = (void *)(((unint64_t)a1 + v18 + 7) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v20 = (void *)(((unint64_t)a2 + v18 + 7) & 0xFFFFFFFFFFFFFFF8);
  *int v19 = *v20;
  int v21 = (void *)(((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8);
  id v22 = (void *)(((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF8);
  void *v21 = *v22;
  id v23 = (void *)(((unint64_t)v21 + 15) & 0xFFFFFFFFFFFFFFF8);
  unsigned __int8 v24 = (void *)(((unint64_t)v22 + 15) & 0xFFFFFFFFFFFFFFF8);
  *id v23 = *v24;
  v23[1] = v24[1];
  sub_1E46A4AB0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_1E4688370(void *a1, void *a2, uint64_t a3)
{
  unint64_t v6 = (unint64_t)a2 + 15;
  *a1 = *a2;
  sub_1E46A4AB0();
  swift_release();
  uint64_t v7 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = v6 & 0xFFFFFFFFFFFFFFF8;
  *uint64_t v7 = *(void *)(v6 & 0xFFFFFFFFFFFFFFF8);
  sub_1E46A4AB0();
  swift_release();
  uint64_t v9 = *(void *)(a3 + 16);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  size_t v12 = (void *)(((unint64_t)v7 + v11 + 8) & ~v11);
  int v13 = (void *)((v11 + 8 + v8) & ~v11);
  uint64_t v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  LODWORD(v_Block_object_dispose(&a9, 8) = v14(v12, 1, v9);
  int v15 = v14(v13, 1, v9);
  if (v8)
  {
    if (v15)
    {
      int v16 = *(_DWORD *)(v10 + 84);
      size_t v17 = *(void *)(v10 + 64);
LABEL_6:
      if (v16) {
        size_t v18 = v17;
      }
      else {
        size_t v18 = v17 + 1;
      }
      memcpy(v12, v13, v18);
      goto LABEL_12;
    }
    (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v12, v13, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v12, 0, 1, v9);
  }
  else
  {
    if (v15)
    {
      (*(void (**)(void *, uint64_t))(v10 + 8))(v12, v9);
      int v16 = *(_DWORD *)(v10 + 84);
      size_t v17 = *(void *)(v10 + 64);
      goto LABEL_6;
    }
    (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v12, v13, v9);
  }
LABEL_12:
  uint64_t v19 = *(void *)(v10 + 64) + ((v11 + 16) & ~v11);
  if (!*(_DWORD *)(v10 + 84)) {
    ++v19;
  }
  uint64_t v20 = (uint64_t)a1 + v19 + 7;
  uint64_t v21 = (uint64_t)a2 + v19 + 7;
  unint64_t v22 = (v21 & 0xFFFFFFFFFFFFFFF8) + 15;
  *(void *)(v20 & 0xFFFFFFFFFFFFFFF_Block_object_dispose(&a9, 8) = *(void *)(v21 & 0xFFFFFFFFFFFFFFF8);
  unint64_t v23 = (v20 & 0xFFFFFFFFFFFFFFF8) + 15;
  sub_1E46A4AB0();
  swift_release();
  v23 &= 0xFFFFFFFFFFFFFFF8;
  v22 &= 0xFFFFFFFFFFFFFFF8;
  uint64_t v24 = *(void *)v22;
  v22 += 15;
  *(void *)unint64_t v23 = v24;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v25 = (void *)((v23 + 15) & 0xFFFFFFFFFFFFFFF8);
  void *v25 = *(void *)(v22 & 0xFFFFFFFFFFFFFFF8);
  v25[1] = *(void *)((v22 & 0xFFFFFFFFFFFFFFF8) + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *sub_1E46885E4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v5 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v6 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v5 = *v6;
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = (void *)(((unint64_t)v5 + v9 + 8) & ~v9);
  uint64_t v11 = (const void *)(((unint64_t)v6 + v9 + 8) & ~v9);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(v11, 1, v7))
  {
    int v12 = *(_DWORD *)(v8 + 84);
    size_t v13 = *(void *)(v8 + 64);
    if (v12) {
      size_t v14 = v13;
    }
    else {
      size_t v14 = v13 + 1;
    }
    memcpy(v10, v11, v14);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(v10, v11, v7);
    int v16 = *(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56);
    uint64_t v15 = v8 + 56;
    v16(v10, 0, 1, v7);
    int v12 = *(_DWORD *)(v15 + 28);
    size_t v13 = *(void *)(v15 + 8);
  }
  size_t v17 = v13 + ((v9 + 16) & ~v9);
  if (!v12) {
    ++v17;
  }
  size_t v18 = (void *)(((unint64_t)a1 + v17 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v19 = (void *)(((unint64_t)a2 + v17 + 7) & 0xFFFFFFFFFFFFFFF8);
  void *v18 = *v19;
  uint64_t v20 = (void *)(((unint64_t)v18 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v21 = (void *)(((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8);
  void *v20 = *v21;
  *(_OWORD *)(((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF_Block_object_dispose(&a9, 8) = *(_OWORD *)(((unint64_t)v21 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_1E4688784(void *a1, void *a2, uint64_t a3)
{
  unint64_t v6 = (unint64_t)a2 + 15;
  *a1 = *a2;
  swift_release();
  uint64_t v7 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = v6 & 0xFFFFFFFFFFFFFFF8;
  *uint64_t v7 = *(void *)(v6 & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  uint64_t v9 = *(void *)(a3 + 16);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  int v12 = (void *)(((unint64_t)v7 + v11 + 8) & ~v11);
  size_t v13 = (void *)((v11 + 8 + v8) & ~v11);
  size_t v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v15 = v14(v12, 1, v9);
  int v16 = v14(v13, 1, v9);
  if (v15)
  {
    if (v16)
    {
      int v17 = *(_DWORD *)(v10 + 84);
      size_t v18 = *(void *)(v10 + 64);
LABEL_6:
      if (v17) {
        size_t v19 = v18;
      }
      else {
        size_t v19 = v18 + 1;
      }
      memcpy(v12, v13, v19);
      goto LABEL_12;
    }
    (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v12, v13, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v12, 0, 1, v9);
  }
  else
  {
    if (v16)
    {
      (*(void (**)(void *, uint64_t))(v10 + 8))(v12, v9);
      int v17 = *(_DWORD *)(v10 + 84);
      size_t v18 = *(void *)(v10 + 64);
      goto LABEL_6;
    }
    (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v12, v13, v9);
  }
LABEL_12:
  uint64_t v20 = *(void *)(v10 + 64) + ((v11 + 16) & ~v11);
  if (!*(_DWORD *)(v10 + 84)) {
    ++v20;
  }
  uint64_t v21 = (uint64_t)a1 + v20 + 7;
  unint64_t v22 = (void *)(((unint64_t)a2 + v20 + 7) & 0xFFFFFFFFFFFFFFF8);
  *(void *)(v21 & 0xFFFFFFFFFFFFFFF_Block_object_dispose(&a9, 8) = *v22;
  unint64_t v23 = (v21 & 0xFFFFFFFFFFFFFFF8) + 15;
  swift_release();
  v23 &= 0xFFFFFFFFFFFFFFF8;
  unint64_t v24 = ((unint64_t)v22 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v25 = *(void *)v24;
  v24 += 15;
  *(void *)unint64_t v23 = v25;
  swift_bridgeObjectRelease();
  id v26 = (void *)((v23 + 15) & 0xFFFFFFFFFFFFFFF8);
  *id v26 = *(void *)(v24 & 0xFFFFFFFFFFFFFFF8);
  v26[1] = *(void *)((v24 & 0xFFFFFFFFFFFFFFF8) + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1E46889D0(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4;
  int v6 = *(_DWORD *)(v4 + 84);
  if (v6) {
    unsigned int v7 = v6 - 1;
  }
  else {
    unsigned int v7 = 0;
  }
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = v7;
  }
  uint64_t v9 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v10 = 7;
  if (!v6) {
    uint64_t v10 = 8;
  }
  if (!a2) {
    return 0;
  }
  if (v8 < a2)
  {
    unint64_t v11 = ((((((v10 + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + ((v9 + 16) & ~v9)) & 0xFFFFFFFFFFFFFFF8)
            + 15) & 0xFFFFFFFFFFFFFFF8)
          + 15) & 0xFFFFFFFFFFFFFFF8)
        + 16;
    unsigned int v12 = a2 - v8;
    uint64_t v13 = v11 & 0xFFFFFFF8;
    if ((v11 & 0xFFFFFFF8) != 0) {
      unsigned int v14 = 2;
    }
    else {
      unsigned int v14 = v12 + 1;
    }
    if (v14 >= 0x10000) {
      unsigned int v15 = 4;
    }
    else {
      unsigned int v15 = 2;
    }
    if (v14 < 0x100) {
      unsigned int v15 = 1;
    }
    if (v14 >= 2) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0;
    }
    switch(v16)
    {
      case 1:
        int v17 = *((unsigned __int8 *)a1 + v11);
        if (!v17) {
          break;
        }
        goto LABEL_27;
      case 2:
        int v17 = *(unsigned __int16 *)((char *)a1 + v11);
        if (v17) {
          goto LABEL_27;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1E4688B80);
      case 4:
        int v17 = *(_DWORD *)((char *)a1 + v11);
        if (!v17) {
          break;
        }
LABEL_27:
        int v19 = v17 - 1;
        if (v13)
        {
          int v19 = 0;
          LODWORD(v13) = *a1;
        }
        return v8 + (v13 | v19) + 1;
      default:
        break;
    }
  }
  uint64_t v20 = (unint64_t *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  if ((v7 & 0x80000000) != 0)
  {
    unsigned int v22 = (*(uint64_t (**)(unint64_t))(v5 + 48))(((unint64_t)v20 + v9 + 8) & ~v9);
    if (v22 >= 2) {
      return v22 - 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    unint64_t v21 = *v20;
    if (v21 >= 0xFFFFFFFF) {
      LODWORD(v21) = -1;
    }
    return (v21 + 1);
  }
}

void sub_1E4688B94(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (!v8) {
    unsigned int v9 = 0;
  }
  if (v9 <= 0x7FFFFFFF) {
    unsigned int v10 = 0x7FFFFFFF;
  }
  else {
    unsigned int v10 = v9;
  }
  uint64_t v11 = *(unsigned __int8 *)(v7 + 80);
  size_t v12 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (!v8) {
    ++v12;
  }
  size_t v13 = ((((((v12 + ((v11 + 16) & ~v11) + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  if (v10 < a3)
  {
    unsigned int v14 = a3 - v10;
    if (((((((v12 + ((v11 + 16) & ~v11) + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v15 = v14 + 1;
    }
    else {
      unsigned int v15 = 2;
    }
    if (v15 >= 0x10000) {
      int v16 = 4;
    }
    else {
      int v16 = 2;
    }
    if (v15 < 0x100) {
      int v16 = 1;
    }
    if (v15 >= 2) {
      int v6 = v16;
    }
    else {
      int v6 = 0;
    }
  }
  if (a2 > v10)
  {
    if (((((((v12 + ((v11 + 16) & ~v11) + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      int v17 = a2 - v10;
    }
    else {
      int v17 = 1;
    }
    if (((((((v12 + ((v11 + 16) & ~v11) + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      int v18 = ~v10 + a2;
      bzero(a1, v13);
      *(_DWORD *)a1 = v18;
    }
    switch(v6)
    {
      case 1:
        a1[v13] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v13] = v17;
        return;
      case 3:
        goto LABEL_59;
      case 4:
        *(_DWORD *)&a1[v13] = v17;
        return;
      default:
        return;
    }
  }
  switch(v6)
  {
    case 1:
      a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 2:
      *(_WORD *)&a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 3:
LABEL_59:
      __break(1u);
      JUMPOUT(0x1E4688E3CLL);
    case 4:
      *(_DWORD *)&a1[v13] = 0;
      goto LABEL_34;
    default:
LABEL_34:
      if (a2)
      {
LABEL_35:
        int v19 = (void *)((unint64_t)(a1 + 15) & 0xFFFFFFFFFFFFFFF8);
        if ((v9 & 0x80000000) != 0)
        {
          unint64_t v21 = (unsigned char *)(((unint64_t)v19 + v11 + 8) & ~v11);
          if (v9 >= a2)
          {
            uint64_t v25 = a2 + 1;
            id v26 = *(void (**)(unint64_t, uint64_t))(v7 + 56);
            v26(((unint64_t)v19 + v11 + 8) & ~v11, v25);
          }
          else
          {
            if (v12 <= 3) {
              int v22 = ~(-1 << (8 * v12));
            }
            else {
              int v22 = -1;
            }
            if (v12)
            {
              int v23 = v22 & (~v9 + a2);
              if (v12 <= 3) {
                int v24 = v12;
              }
              else {
                int v24 = 4;
              }
              bzero(v21, v12);
              switch(v24)
              {
                case 2:
                  *(_WORD *)unint64_t v21 = v23;
                  break;
                case 3:
                  *(_WORD *)unint64_t v21 = v23;
                  v21[2] = BYTE2(v23);
                  break;
                case 4:
                  *(_DWORD *)unint64_t v21 = v23;
                  break;
                default:
                  unsigned char *v21 = v23;
                  break;
              }
            }
          }
        }
        else
        {
          if ((a2 & 0x80000000) != 0) {
            uint64_t v20 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v20 = a2 - 1;
          }
          *int v19 = v20;
        }
      }
      return;
  }
}

uint64_t type metadata accessor for SearchUIUserReportRequestSelectorSectionContent()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1E4688E8C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_1E4688ED8()
{
  sub_1E46A62B0();
  sub_1E46A59D0();
  JUMPOUT(0x1E4E82FB0);
}

uint64_t sub_1E4688F24@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3 = v2;
  id v31 = a2;
  uint64_t v5 = *(void *)(a1 - 8);
  uint64_t v32 = (char *)&KeyPath - ((*(void *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(MEMORY[0x1F4188790](a1) + 16);
  uint64_t v7 = sub_1E46A6150();
  uint64_t v30 = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE56070);
  uint64_t v29 = v8;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v37 = v7;
  uint64_t v38 = v6;
  uint64_t v39 = v8;
  uint64_t v40 = WitnessTable;
  uint64_t v41 = v9;
  uint64_t v10 = v9;
  uint64_t v11 = sub_1E46A59F0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  unsigned int v15 = (char *)&KeyPath - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  id v27 = (char *)&KeyPath - v16;
  uint64_t v26 = *(void *)(v3 + *(int *)(a1 + 48));
  uint64_t v37 = v26;
  uint64_t v17 = *(void *)(a1 + 24);
  uint64_t v33 = v6;
  uint64_t v34 = v17;
  uint64_t v35 = v10;
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v32, v3, a1);
  unint64_t v18 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  int v19 = (char *)swift_allocObject();
  *((void *)v19 + 2) = v6;
  *((void *)v19 + 3) = v17;
  *((void *)v19 + 4) = v10;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v19[v18], v32, a1);
  uint64_t v20 = sub_1E46671BC(&qword_1EAE56078, &qword_1EAE56070);
  swift_bridgeObjectRetain();
  sub_1E46A59E0();
  uint64_t v36 = v20;
  swift_getWitnessTable();
  unint64_t v21 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  int v22 = v27;
  v21(v27, v15, v11);
  int v23 = *(void (**)(char *, uint64_t))(v12 + 8);
  v23(v15, v11);
  v21(v31, v22, v11);
  return ((uint64_t (*)(char *, uint64_t))v23)(v22, v11);
}

uint64_t sub_1E4689278@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v25 = a4;
  uint64_t v26 = a5;
  uint64_t v23 = a1;
  uint64_t v24 = a2;
  uint64_t v27 = a6;
  uint64_t v9 = *(void *)(a3 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790](a1);
  int v22 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for SearchUIUserReportRequestSelectorSectionContent();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x1F4188790](v11);
  unsigned int v15 = (char *)&v22 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v22 - v14, a2, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a3);
  unint64_t v16 = (*(unsigned __int8 *)(v12 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v17 = (v13 + *(unsigned __int8 *)(v9 + 80) + v16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v18 = (char *)swift_allocObject();
  uint64_t v19 = v25;
  uint64_t v20 = v26;
  *((void *)v18 + 2) = a3;
  *((void *)v18 + 3) = v19;
  *((void *)v18 + 4) = v20;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v18[v16], v15, v11);
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v18[v17], v22, a3);
  uint64_t v28 = a3;
  uint64_t v29 = v19;
  uint64_t v30 = v20;
  uint64_t v31 = v23;
  uint64_t v32 = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56080);
  sub_1E46671BC(&qword_1EAE56088, &qword_1EAE56080);
  return sub_1E46A5960();
}

uint64_t sub_1E4689510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1E46A62B0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v11 - v7;
  uint64_t v9 = *(void *)(a3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v11 - v7, a2, a3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v8, 0, 1, a3);
  type metadata accessor for SearchUIUserReportRequestSelectorSectionContent();
  sub_1E468A5AC((uint64_t)v8);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1E4689680@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  *(void *)a4 = sub_1E46A54B0();
  *(void *)(a4 + _Block_object_dispose(&a9, 8) = 0;
  *(unsigned char *)(a4 + 16) = 1;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56090);
  return sub_1E4689700(a1, a2, a3, (uint64_t *)(a4 + *(int *)(v8 + 44)));
}

uint64_t sub_1E4689700@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v82 = a4;
  uint64_t v97 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v73 = (char *)&v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1E46A62B0();
  uint64_t v79 = v8;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v75 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](TupleTypeMetadata2);
  uint64_t v12 = (char *)&v72 - v11;
  uint64_t v98 = *(void *)(v8 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v10);
  uint64_t v81 = (char *)&v72 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  uint64_t v78 = (char *)&v72 - v16;
  MEMORY[0x1F4188790](v15);
  unint64_t v96 = (char *)&v72 - v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56098);
  uint64_t v91 = *(void *)(v18 - 8);
  uint64_t v92 = v18;
  MEMORY[0x1F4188790](v18);
  uint64_t v20 = (char *)&v72 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE560A0);
  uint64_t v21 = MEMORY[0x1F4188790](v86);
  uint64_t v94 = (uint64_t)&v72 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x1F4188790](v21);
  uint64_t v83 = (char *)&v72 - v24;
  MEMORY[0x1F4188790](v23);
  uint64_t v93 = (uint64_t)&v72 - v25;
  uint64_t v74 = a3;
  type metadata accessor for SearchUIUserReportRequestSelectorSectionContent();
  uint64_t v26 = a1;
  swift_getAtKeyPath();
  uint64_t v99 = v101;
  uint64_t v100 = v102;
  sub_1E46719E4();
  uint64_t v27 = sub_1E46A57A0();
  uint64_t v87 = v28;
  uint64_t v88 = v27;
  int v80 = v29;
  uint64_t v90 = v30;
  uint64_t v85 = sub_1E46A58B0();
  uint64_t KeyPath = swift_getKeyPath();
  swift_bridgeObjectRetain();
  uint64_t v101 = sub_1E46A58D0();
  sub_1E46A5770();
  uint64_t v89 = v20;
  sub_1E46A57D0();
  swift_release();
  uint64_t v31 = v96;
  sub_1E4688ED8();
  uint64_t v32 = v97;
  uint64_t v33 = v78;
  uint64_t v34 = a2;
  (*(void (**)(char *, uint64_t, uint64_t))(v97 + 16))(v78, v26, a2);
  uint64_t v35 = v32;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v33, 0, 1, a2);
  uint64_t v76 = TupleTypeMetadata2;
  uint64_t v36 = &v12[*(int *)(TupleTypeMetadata2 + 48)];
  uint64_t v37 = v98;
  uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v98 + 16);
  uint64_t v39 = v31;
  uint64_t v40 = v31;
  uint64_t v41 = v79;
  v38(v12, v40, v79);
  uint64_t v77 = v36;
  char v42 = v36;
  uint64_t v43 = v33;
  id v44 = v33;
  uint64_t v45 = v41;
  v38(v42, v44, v41);
  uint64_t v46 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48);
  uint64_t v95 = v12;
  if (v46(v12, 1, v34) != 1)
  {
    v38(v81, v95, v45);
    uint64_t v50 = v77;
    if (v46(v77, 1, v34) != 1)
    {
      uint64_t v52 = v97;
      uint64_t v53 = v73;
      (*(void (**)(char *, char *, uint64_t))(v97 + 32))(v73, v50, v34);
      uint64_t v54 = v81;
      char v55 = sub_1E46A5FC0();
      uint64_t v56 = *(void (**)(char *, uint64_t))(v52 + 8);
      v56(v53, v34);
      uint64_t v57 = *(void (**)(char *, uint64_t))(v98 + 8);
      v57(v43, v45);
      v57(v96, v45);
      v56(v54, v34);
      v57(v95, v45);
      double v49 = 1.0;
      if (v55) {
        goto LABEL_9;
      }
LABEL_8:
      double v49 = 0.0;
      goto LABEL_9;
    }
    uint64_t v47 = v95;
    uint64_t v51 = *(void (**)(char *, uint64_t))(v98 + 8);
    v51(v43, v45);
    v51(v96, v45);
    (*(void (**)(char *, uint64_t))(v97 + 8))(v81, v34);
LABEL_6:
    (*(void (**)(char *, uint64_t))(v75 + 8))(v47, v76);
    goto LABEL_8;
  }
  uint64_t v47 = v95;
  uint64_t v48 = *(void (**)(char *, uint64_t))(v37 + 8);
  v48(v43, v45);
  v48(v39, v45);
  if (v46(v77, 1, v34) != 1) {
    goto LABEL_6;
  }
  v48(v47, v45);
  double v49 = 1.0;
LABEL_9:
  char v58 = v80 & 1;
  uint64_t v60 = v91;
  uint64_t v59 = v92;
  uint64_t v61 = (uint64_t)v83;
  uint64_t v62 = v89;
  (*(void (**)(char *, char *, uint64_t))(v91 + 16))(v83, v89, v92);
  *(double *)(v61 + *(int *)(v86 + 36)) = v49;
  (*(void (**)(char *, uint64_t))(v60 + 8))(v62, v59);
  uint64_t v63 = v93;
  sub_1E468A47C(v61, v93);
  uint64_t v64 = v94;
  sub_1E468A4E4(v63, v94);
  uint64_t v66 = v87;
  uint64_t v65 = v88;
  uint64_t v67 = v82;
  uint64_t *v82 = v88;
  v67[1] = v66;
  *((unsigned char *)v67 + 16) = v58;
  uint64_t v69 = KeyPath;
  uint64_t v68 = v85;
  v67[3] = v90;
  v67[4] = v69;
  v67[5] = v68;
  v67[6] = 0;
  *((unsigned char *)v67 + 56) = 1;
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE560A8);
  sub_1E468A4E4(v64, (uint64_t)v67 + *(int *)(v70 + 64));
  sub_1E46814E8(v65, v66, v58);
  swift_bridgeObjectRetain();
  sub_1E46A4AB0();
  sub_1E46A4AB0();
  sub_1E468A54C(v63);
  sub_1E468A54C(v64);
  sub_1E4671FC4(v65, v66, v58);
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E4689F64()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(type metadata accessor for SearchUIUserReportRequestSelectorSectionContent() - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  swift_release();
  swift_release();
  sub_1E46A62B0();
  uint64_t v6 = v0 + v4 + *(int *)(sub_1E46A59D0() + 32);
  uint64_t v7 = *(void *)(v1 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v6, 1, v1)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v1);
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, v4 + v5, v3 | 7);
}

uint64_t sub_1E468A0F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = v2[2];
  uint64_t v6 = v2[3];
  uint64_t v7 = v2[4];
  uint64_t v8 = *(void *)(type metadata accessor for SearchUIUserReportRequestSelectorSectionContent() - 8);
  uint64_t v9 = (uint64_t)v2 + ((*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return sub_1E4689278(a1, v9, v5, v6, v7, a2);
}

uint64_t sub_1E468A198()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(type metadata accessor for SearchUIUserReportRequestSelectorSectionContent() - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v11 = *(void *)(v2 + 64);
  uint64_t v5 = *(void *)(v1 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  swift_release();
  swift_release();
  sub_1E46A62B0();
  uint64_t v8 = v0 + v4 + *(int *)(sub_1E46A59D0() + 32);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v8, 1, v1)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v8, v1);
  }
  uint64_t v9 = (v4 + v11 + v6) & ~v6;
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v9, v1);
  return MEMORY[0x1F4186498](v0, v9 + v7, v3 | v6 | 7);
}

uint64_t sub_1E468A37C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(type metadata accessor for SearchUIUserReportRequestSelectorSectionContent() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = v0
     + ((v3 + *(void *)(v2 + 64) + *(unsigned __int8 *)(*(void *)(v1 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80));
  return sub_1E4689510(v0 + v3, v4, v1);
}

uint64_t sub_1E468A464@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4689680(v1[5], v1[2], v1[4], a1);
}

uint64_t sub_1E468A47C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE560A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E468A4E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE560A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E468A54C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE560A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E468A5AC(uint64_t a1)
{
  uint64_t v2 = sub_1E46A62B0();
  MEMORY[0x1F4188790](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v6 - v3, a1, v2);
  sub_1E46A59D0();
  return sub_1E46A59A0();
}

uint64_t sub_1E468A684()
{
  return swift_getWitnessTable();
}

uint64_t sub_1E468A764@<X0>(uint64_t *a1@<X0>, unint64_t *a2@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t a4@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(a1);
  sub_1E468F140(a2, a1);
  sub_1E46A6220();
  sub_1E46A6230();
  if (v15[4] == v15[0])
  {
    uint64_t v8 = a3(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(a4, 1, 1, v8);
  }
  else
  {
    uint64_t v10 = (void (*)(void *, void))sub_1E46A6240();
    uint64_t v12 = v11;
    uint64_t v13 = a3(0);
    uint64_t v14 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(a4, v12, v13);
    v10(v15, 0);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(a4, 0, 1, v13);
  }
}

uint64_t sub_1E468A8E8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x1F4188298](sub_1E468A908, 0, 0);
}

uint64_t sub_1E468A908()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_mediaIdentifier);
  if (v1)
  {
    uint64_t v2 = *(void **)(v0 + 16);
    uint64_t v3 = sub_1E46A6050();
    uint64_t v5 = v4;

    *(void *)(v0 + 24) = v5;
    int v6 = objc_msgSend(v2, sel_mediaType);
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 32) = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_1E468AA2C;
    return sub_1E468C678(v3, v5, v6);
  }
  else
  {
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
}

uint64_t sub_1E468AA2C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1E468ACB4(void *a1, void *aBlock)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = _Block_copy(aBlock);
  id v4 = a1;
  return MEMORY[0x1F4188298](sub_1E468AD30, 0, 0);
}

uint64_t sub_1E468AD30()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_mediaIdentifier);
  uint64_t v2 = *(void **)(v0 + 16);
  if (v1)
  {
    uint64_t v3 = v1;
    uint64_t v4 = sub_1E46A6050();
    uint64_t v6 = v5;

    *(void *)(v0 + 32) = v6;
    int v7 = objc_msgSend(v2, sel_mediaType);
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 40) = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_1E468AE70;
    return sub_1E468C678(v4, v6, v7);
  }
  else
  {

    (*(void (**)(void))(*(void *)(v0 + 24) + 16))();
    _Block_release(*(const void **)(v0 + 24));
    uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
    return v10();
  }
}

uint64_t sub_1E468AE70()
{
  *(void *)(*(void *)v1 + 4_Block_object_dispose(&a9, 8) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v2 = sub_1E468B01C;
  }
  else {
    uint64_t v2 = sub_1E468AFA0;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E468AFA0()
{
  (*(void (**)(void))(*(void *)(v0 + 24) + 16))();
  _Block_release(*(const void **)(v0 + 24));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E468B01C()
{
  uint64_t v1 = *(void **)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 24);

  uint64_t v3 = (void *)sub_1E46A4D10();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  _Block_release(*(const void **)(v0 + 24));
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_1E468B0BC()
{
  uint64_t v1 = sub_1E46A5C30();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  uint64_t v2 = sub_1E46A5C60();
  v0[5] = v2;
  v0[6] = *(void *)(v2 - 8);
  v0[7] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E468B1D4, 0, 0);
}

uint64_t sub_1E468B1D4()
{
  (*(void (**)(void, void, void))(v0[3] + 104))(v0[4], *MEMORY[0x1E4F78FD0], v0[2]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[8] = v1;
  void *v1 = v0;
  v1[1] = sub_1E468B294;
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[4];
  return MEMORY[0x1F41304D8](v2, v3);
}

uint64_t sub_1E468B294()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 32);
  uint64_t v3 = *(void *)(*(void *)v1 + 24);
  uint64_t v4 = *(void *)(*(void *)v1 + 16);
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = sub_1E468B4AC;
  }
  else {
    uint64_t v5 = sub_1E468B404;
  }
  return MEMORY[0x1F4188298](v5, 0, 0);
}

uint64_t sub_1E468B404()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  char v4 = sub_1E46A5C50();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5(v4 & 1);
}

uint64_t sub_1E468B4AC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_1E468B680(const void *a1)
{
  uint64_t v3 = sub_1E46A5C30();
  v1[2] = v3;
  v1[3] = *(void *)(v3 - 8);
  v1[4] = swift_task_alloc();
  uint64_t v4 = sub_1E46A5C60();
  v1[5] = v4;
  void v1[6] = *(void *)(v4 - 8);
  v1[7] = swift_task_alloc();
  v1[8] = _Block_copy(a1);
  return MEMORY[0x1F4188298](sub_1E468B7A8, 0, 0);
}

uint64_t sub_1E468B7A8()
{
  (*(void (**)(void, void, void))(v0[3] + 104))(v0[4], *MEMORY[0x1E4F78FD0], v0[2]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[9] = v1;
  void *v1 = v0;
  v1[1] = sub_1E468B868;
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[4];
  return MEMORY[0x1F41304D8](v2, v3);
}

uint64_t sub_1E468B868()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 32);
  uint64_t v3 = *(void *)(*(void *)v1 + 24);
  uint64_t v4 = *(void *)(*(void *)v1 + 16);
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = sub_1E468BA9C;
  }
  else {
    uint64_t v5 = sub_1E468B9D8;
  }
  return MEMORY[0x1F4188298](v5, 0, 0);
}

uint64_t sub_1E468B9D8()
{
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 48);
  char v5 = sub_1E46A5C50();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  (*(void (**)(uint64_t, void, void))(v1 + 16))(v1, v5 & 1, 0);
  _Block_release(*(const void **)(v0 + 64));
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_1E468BA9C()
{
  uint64_t v1 = *(void **)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = (void *)sub_1E46A4D10();

  (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v3);
  _Block_release(*(const void **)(v0 + 64));
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

id SearchUIMusicUtilities.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id SearchUIMusicUtilities.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUIMusicUtilities();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SearchUIMusicUtilities.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUIMusicUtilities();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1E468BC2C(uint64_t a1, int a2)
{
  *(_DWORD *)(v2 + 28_Block_object_dispose(&a9, 8) = a2;
  *(void *)(v2 + 136) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE561C8);
  *(void *)(v2 + 144) = swift_task_alloc();
  uint64_t v3 = sub_1E46A5D30();
  *(void *)(v2 + 152) = v3;
  *(void *)(v2 + 160) = *(void *)(v3 - 8);
  *(void *)(v2 + 16_Block_object_dispose(&a9, 8) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56130);
  *(void *)(v2 + 176) = swift_task_alloc();
  uint64_t v4 = sub_1E46A5CF0();
  *(void *)(v2 + 184) = v4;
  *(void *)(v2 + 192) = *(void *)(v4 - 8);
  *(void *)(v2 + 200) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56150);
  *(void *)(v2 + 20_Block_object_dispose(&a9, 8) = swift_task_alloc();
  uint64_t v5 = sub_1E46A5CE0();
  *(void *)(v2 + 216) = v5;
  *(void *)(v2 + 224) = *(void *)(v5 - 8);
  *(void *)(v2 + 232) = swift_task_alloc();
  sub_1E46A6190();
  *(void *)(v2 + 240) = sub_1E46A6180();
  uint64_t v7 = sub_1E46A6160();
  *(void *)(v2 + 24_Block_object_dispose(&a9, 8) = v7;
  *(void *)(v2 + 256) = v6;
  return MEMORY[0x1F4188298](sub_1E468BE6C, v7, v6);
}

uint64_t sub_1E468BE6C()
{
  int v1 = *(_DWORD *)(v0 + 288);
  sub_1E46A5BE0();
  *(void *)(v0 + 264) = sub_1E46A5BD0();
  switch(v1)
  {
    case 3:
      uint64_t v14 = *(void *)(v0 + 160);
      sub_1E468F190(*(void *)(v0 + 136), v0 + 16);
      uint64_t v15 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
      if (*(void *)(v0 + 40))
      {
        uint64_t v16 = *(void *)(v0 + 152);
        uint64_t v17 = *(void *)(v0 + 160);
        uint64_t v18 = *(void *)(v0 + 144);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE561D0);
        int v19 = swift_dynamicCast();
        (*v15)(v18, v19 ^ 1u, 1, v16);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v18, 1, v16) != 1)
        {
          uint64_t v9 = *(void *)(v0 + 160);
          uint64_t v8 = *(void *)(v0 + 168);
          uint64_t v10 = *(void *)(v0 + 152);
          (*(void (**)(uint64_t, void, uint64_t))(v9 + 32))(v8, *(void *)(v0 + 144), v10);
          __swift_instantiateConcreteTypeFromMangledName(qword_1EAE561D8);
          uint64_t v11 = swift_allocObject();
          *(_OWORD *)(v11 + 16) = xmmword_1E46B7170;
          uint64_t v12 = (uint64_t *)(v11 + 32);
          uint64_t v13 = MEMORY[0x1E4F38118];
          goto LABEL_13;
        }
      }
      else
      {
        uint64_t v33 = *(void *)(v0 + 144);
        uint64_t v32 = *(void *)(v0 + 152);
        sub_1E4666020(v0 + 16, &qword_1EAE56188);
        (*v15)(v33, 1, 1, v32);
      }
      uint64_t v30 = *(void *)(v0 + 144);
      uint64_t v31 = (uint64_t *)&unk_1EAE561C8;
      break;
    case 2:
      uint64_t v20 = *(void *)(v0 + 192);
      sub_1E468F190(*(void *)(v0 + 136), v0 + 56);
      uint64_t v21 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
      if (*(void *)(v0 + 80))
      {
        uint64_t v22 = *(void *)(v0 + 184);
        uint64_t v23 = *(void *)(v0 + 192);
        uint64_t v24 = *(void *)(v0 + 176);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE561D0);
        int v25 = swift_dynamicCast();
        (*v21)(v24, v25 ^ 1u, 1, v22);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48))(v24, 1, v22) != 1)
        {
          uint64_t v9 = *(void *)(v0 + 192);
          uint64_t v8 = *(void *)(v0 + 200);
          uint64_t v10 = *(void *)(v0 + 184);
          (*(void (**)(uint64_t, void, uint64_t))(v9 + 32))(v8, *(void *)(v0 + 176), v10);
          __swift_instantiateConcreteTypeFromMangledName(qword_1EAE561D8);
          uint64_t v11 = swift_allocObject();
          *(_OWORD *)(v11 + 16) = xmmword_1E46B7170;
          uint64_t v12 = (uint64_t *)(v11 + 32);
          uint64_t v13 = MEMORY[0x1E4F37C80];
          goto LABEL_13;
        }
      }
      else
      {
        uint64_t v35 = *(void *)(v0 + 176);
        uint64_t v34 = *(void *)(v0 + 184);
        sub_1E4666020(v0 + 56, &qword_1EAE56188);
        (*v21)(v35, 1, 1, v34);
      }
      uint64_t v30 = *(void *)(v0 + 176);
      uint64_t v31 = (uint64_t *)&unk_1EAE56130;
      break;
    case 1:
      uint64_t v2 = *(void *)(v0 + 224);
      sub_1E468F190(*(void *)(v0 + 136), v0 + 96);
      uint64_t v3 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 56);
      if (*(void *)(v0 + 120))
      {
        uint64_t v4 = *(void *)(v0 + 216);
        uint64_t v5 = *(void *)(v0 + 224);
        uint64_t v6 = *(void *)(v0 + 208);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE561D0);
        int v7 = swift_dynamicCast();
        (*v3)(v6, v7 ^ 1u, 1, v4);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4) != 1)
        {
          uint64_t v9 = *(void *)(v0 + 224);
          uint64_t v8 = *(void *)(v0 + 232);
          uint64_t v10 = *(void *)(v0 + 216);
          (*(void (**)(uint64_t, void, uint64_t))(v9 + 32))(v8, *(void *)(v0 + 208), v10);
          __swift_instantiateConcreteTypeFromMangledName(qword_1EAE561D8);
          uint64_t v11 = swift_allocObject();
          *(_OWORD *)(v11 + 16) = xmmword_1E46B7170;
          uint64_t v12 = (uint64_t *)(v11 + 32);
          uint64_t v13 = MEMORY[0x1E4F37B50];
LABEL_13:
          *(void *)(v11 + 56) = v10;
          *(void *)(v11 + 64) = v13;
          boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
          (*(void (**)(uint64_t *, uint64_t, uint64_t))(v9 + 16))(boxed_opaque_existential_1, v8, v10);
          sub_1E46A5CD0();
          sub_1E46A5CC0();
          sub_1E46A5BC0();
          (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
          goto LABEL_22;
        }
      }
      else
      {
        uint64_t v29 = *(void *)(v0 + 208);
        uint64_t v28 = *(void *)(v0 + 216);
        sub_1E4666020(v0 + 96, &qword_1EAE56188);
        (*v3)(v29, 1, 1, v28);
      }
      uint64_t v30 = *(void *)(v0 + 208);
      uint64_t v31 = (uint64_t *)&unk_1EAE56150;
      break;
    default:
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56178);
      uint64_t v27 = swift_allocObject();
      *(_OWORD *)(v27 + 16) = xmmword_1E46B7170;
      *(void *)(v27 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v27 + 32) = 0xD000000000000014;
      *(void *)(v27 + 40) = 0x80000001E46BCFD0;
      sub_1E46A6540();
      swift_bridgeObjectRelease();
      goto LABEL_22;
  }
  sub_1E4666020(v30, v31);
LABEL_22:
  uint64_t v38 = (uint64_t (*)(void))((int)*MEMORY[0x1E4F36648] + MEMORY[0x1E4F36648]);
  uint64_t v36 = (void *)swift_task_alloc();
  *(void *)(v0 + 272) = v36;
  *uint64_t v36 = v0;
  v36[1] = sub_1E468C3B4;
  return v38();
}

uint64_t sub_1E468C3B4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 280) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 256);
  uint64_t v4 = *(void *)(v2 + 248);
  if (v0) {
    uint64_t v5 = sub_1E468C5B4;
  }
  else {
    uint64_t v5 = sub_1E468C4F0;
  }
  return MEMORY[0x1F4188298](v5, v4, v3);
}

uint64_t sub_1E468C4F0()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  int v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E468C5B4()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  int v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E468C678(uint64_t a1, uint64_t a2, int a3)
{
  *(_DWORD *)(v3 + 696) = a3;
  *(void *)(v3 + 224) = a1;
  *(void *)(v3 + 232) = a2;
  uint64_t v4 = sub_1E46A5D30();
  *(void *)(v3 + 240) = v4;
  *(void *)(v3 + 24_Block_object_dispose(&a9, 8) = *(void *)(v4 - 8);
  *(void *)(v3 + 256) = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56108);
  *(void *)(v3 + 264) = v5;
  *(void *)(v3 + 272) = *(void *)(v5 - 8);
  *(void *)(v3 + 280) = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56110);
  *(void *)(v3 + 28_Block_object_dispose(&a9, 8) = v6;
  *(void *)(v3 + 296) = *(void *)(v6 - 8);
  *(void *)(v3 + 304) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56118);
  *(void *)(v3 + 312) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56120);
  *(void *)(v3 + 320) = swift_task_alloc();
  uint64_t v7 = sub_1E46A5D00();
  *(void *)(v3 + 32_Block_object_dispose(&a9, 8) = v7;
  *(void *)(v3 + 336) = *(void *)(v7 - 8);
  *(void *)(v3 + 344) = swift_task_alloc();
  *(void *)(v3 + 352) = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56128);
  *(void *)(v3 + 360) = v8;
  *(void *)(v3 + 36_Block_object_dispose(&a9, 8) = *(void *)(v8 - 8);
  *(void *)(v3 + 376) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56130);
  *(void *)(v3 + 384) = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56138);
  *(void *)(v3 + 392) = v9;
  *(void *)(v3 + 400) = *(void *)(v9 - 8);
  *(void *)(v3 + 40_Block_object_dispose(&a9, 8) = swift_task_alloc();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56140);
  *(void *)(v3 + 416) = v10;
  *(void *)(v3 + 424) = *(void *)(v10 - 8);
  *(void *)(v3 + 432) = swift_task_alloc();
  uint64_t v11 = sub_1E46A5CF0();
  *(void *)(v3 + 440) = v11;
  *(void *)(v3 + 44_Block_object_dispose(&a9, 8) = *(void *)(v11 - 8);
  *(void *)(v3 + 456) = swift_task_alloc();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56148);
  *(void *)(v3 + 464) = v12;
  *(void *)(v3 + 472) = *(void *)(v12 - 8);
  *(void *)(v3 + 480) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56150);
  *(void *)(v3 + 48_Block_object_dispose(&a9, 8) = swift_task_alloc();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56158);
  *(void *)(v3 + 496) = v13;
  *(void *)(v3 + 504) = *(void *)(v13 - 8);
  *(void *)(v3 + 512) = swift_task_alloc();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56160);
  *(void *)(v3 + 520) = v14;
  *(void *)(v3 + 52_Block_object_dispose(&a9, 8) = *(void *)(v14 - 8);
  *(void *)(v3 + 536) = swift_task_alloc();
  uint64_t v15 = sub_1E46A5CE0();
  *(void *)(v3 + 544) = v15;
  *(void *)(v3 + 552) = *(void *)(v15 - 8);
  *(void *)(v3 + 560) = swift_task_alloc();
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56168);
  *(void *)(v3 + 56_Block_object_dispose(&a9, 8) = v16;
  *(void *)(v3 + 576) = *(void *)(v16 - 8);
  *(void *)(v3 + 584) = swift_task_alloc();
  uint64_t v17 = sub_1E46A5C00();
  *(void *)(v3 + 592) = v17;
  *(void *)(v3 + 600) = *(void *)(v17 - 8);
  *(void *)(v3 + 60_Block_object_dispose(&a9, 8) = swift_task_alloc();
  *(void *)(v3 + 616) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E468CCEC, 0, 0);
}

uint64_t sub_1E468CCEC()
{
  uint64_t v23 = (_OWORD *)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 616);
  uint64_t v2 = *(void *)(v0 + 608);
  uint64_t v3 = *(void *)(v0 + 600);
  uint64_t v4 = *(void *)(v0 + 592);
  sub_1E46A5C10();
  uint64_t v5 = *MEMORY[0x1E4F78FB8];
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 104);
  v6(v2, v5, v4);
  sub_1E468F0F8(&qword_1EAE56170, MEMORY[0x1E4F78FC0]);
  char v7 = sub_1E46A5FC0();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v8(v2, v4);
  v8(v1, v4);
  if ((v7 & 1) == 0)
  {
    v6(*(void *)(v0 + 616), v5, *(void *)(v0 + 592));
    sub_1E46A5C20();
  }
  int v9 = *(_DWORD *)(v0 + 696);
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_1E46A5CB0();
  uint64_t v12 = v11;
  *uint64_t v23 = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 4_Block_object_dispose(&a9, 8) = 0;
  switch(v9)
  {
    case 3:
      swift_getKeyPath();
      *(void *)(v0 + 176) = v10;
      *(void *)(v0 + 184) = v12;
      *(void *)(v0 + 656) = sub_1E46A5D20();
      sub_1E468F0F8(&qword_1EAE56190, MEMORY[0x1E4F37F10]);
      sub_1E46A5C80();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99BC30);
      uint64_t v16 = swift_allocObject();
      *(_OWORD *)(v16 + 16) = xmmword_1E46B7270;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56198);
      *(void *)(v16 + 32) = sub_1E46A5BF0();
      sub_1E46A6120();
      sub_1E46A5C70();
      uint64_t v17 = (void *)swift_task_alloc();
      *(void *)(v0 + 664) = v17;
      void *v17 = v0;
      v17[1] = sub_1E468DB68;
      uint64_t v14 = *(void *)(v0 + 360);
      uint64_t v15 = *(void *)(v0 + 304);
      goto LABEL_9;
    case 2:
      swift_getKeyPath();
      *(void *)(v0 + 20_Block_object_dispose(&a9, 8) = v10;
      *(void *)(v0 + 216) = v12;
      sub_1E468F0F8(&qword_1EAE561A0, MEMORY[0x1E4F37CF0]);
      sub_1E46A5C80();
      uint64_t v18 = (void *)swift_task_alloc();
      *(void *)(v0 + 640) = v18;
      void *v18 = v0;
      v18[1] = sub_1E468D6EC;
      uint64_t v14 = *(void *)(v0 + 464);
      uint64_t v15 = *(void *)(v0 + 432);
      goto LABEL_9;
    case 1:
      swift_getKeyPath();
      *(void *)(v0 + 192) = v10;
      *(void *)(v0 + 200) = v12;
      sub_1E468F0F8(&qword_1EAE561A8, MEMORY[0x1E4F37BB0]);
      sub_1E46A5C80();
      uint64_t v13 = (void *)swift_task_alloc();
      *(void *)(v0 + 624) = v13;
      *uint64_t v13 = v0;
      v13[1] = sub_1E468D258;
      uint64_t v14 = *(void *)(v0 + 568);
      uint64_t v15 = *(void *)(v0 + 536);
LABEL_9:
      return ((uint64_t (*)(uint64_t, uint64_t))*(&aCopyableitem_0 + 1))(v15, v14);
  }
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56178);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1E46B7170;
  *(void *)(v19 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v19 + 32) = 0xD000000000000014;
  *(void *)(v19 + 40) = 0x80000001E46BCFD0;
  sub_1E46A6540();
  swift_bridgeObjectRelease();
  uint64_t v20 = (void *)swift_task_alloc();
  *(void *)(v0 + 680) = v20;
  void *v20 = v0;
  v20[1] = sub_1E468E1B4;
  int v21 = *(_DWORD *)(v0 + 696);
  return sub_1E468BC2C((uint64_t)v23, v21);
}

uint64_t sub_1E468D258()
{
  *(void *)(*(void *)v1 + 632) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1E468E5E8;
  }
  else {
    uint64_t v2 = sub_1E468D36C;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E468D36C()
{
  uint64_t v1 = *(void *)(v0 + 552);
  uint64_t v23 = v0 + 16;
  uint64_t v2 = *(void *)(v0 + 544);
  uint64_t v3 = *(void *)(v0 + 536);
  uint64_t v4 = *(void *)(v0 + 528);
  uint64_t v5 = *(void *)(v0 + 520);
  uint64_t v6 = *(void *)(v0 + 504);
  uint64_t v7 = *(void *)(v0 + 512);
  uint64_t v9 = *(void *)(v0 + 488);
  uint64_t v8 = *(void *)(v0 + 496);
  sub_1E46A5CA0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  sub_1E468A764(&qword_1EAE56158, &qword_1EAE561B0, MEMORY[0x1E4F37BB0], v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v9, 1, v2) == 1)
  {
    uint64_t v10 = *(void *)(v0 + 488);
    (*(void (**)(void, void))(*(void *)(v0 + 576) + 8))(*(void *)(v0 + 584), *(void *)(v0 + 568));
    sub_1E4666020(v23, &qword_1EAE56188);
    sub_1E4666020(v10, &qword_1EAE56150);
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
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
  else
  {
    uint64_t v13 = *(void *)(v0 + 584);
    uint64_t v14 = *(void *)(v0 + 576);
    uint64_t v15 = *(void *)(v0 + 568);
    uint64_t v16 = *(uint64_t **)(v0 + 560);
    uint64_t v17 = *(void *)(v0 + 544);
    uint64_t v18 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v0 + 552) + 32);
    v18(v16, *(uint64_t **)(v0 + 488), v17);
    uint64_t v19 = MEMORY[0x1E4F37B78];
    *(void *)(v0 + 160) = v17;
    *(void *)(v0 + 16_Block_object_dispose(&a9, 8) = v19;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 136));
    v18(boxed_opaque_existential_1, v16, v17);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    sub_1E4666020(v23, &qword_1EAE56188);
    sub_1E468F008(v0 + 136, v23);
    int v21 = (void *)swift_task_alloc();
    *(void *)(v0 + 680) = v21;
    void *v21 = v0;
    v21[1] = sub_1E468E1B4;
    int v22 = *(_DWORD *)(v0 + 696);
    return sub_1E468BC2C(v23, v22);
  }
}

uint64_t sub_1E468D6EC()
{
  *(void *)(*(void *)v1 + 64_Block_object_dispose(&a9, 8) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1E468E7A0;
  }
  else {
    uint64_t v2 = sub_1E468D800;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E468D800()
{
  uint64_t v1 = *(void *)(v0 + 440);
  uint64_t v2 = *(void *)(v0 + 448);
  uint64_t v23 = v0 + 16;
  uint64_t v4 = *(void *)(v0 + 424);
  uint64_t v3 = *(void *)(v0 + 432);
  uint64_t v6 = *(void *)(v0 + 408);
  uint64_t v5 = *(void *)(v0 + 416);
  uint64_t v8 = *(void *)(v0 + 392);
  uint64_t v7 = *(void *)(v0 + 400);
  uint64_t v9 = *(void *)(v0 + 384);
  sub_1E46A5CA0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  sub_1E468A764(&qword_1EAE56138, &qword_1EAE561B8, MEMORY[0x1E4F37CF0], v9);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v9, 1, v1) == 1)
  {
    uint64_t v10 = *(void *)(v0 + 384);
    (*(void (**)(void, void))(*(void *)(v0 + 472) + 8))(*(void *)(v0 + 480), *(void *)(v0 + 464));
    sub_1E4666020(v23, &qword_1EAE56188);
    sub_1E4666020(v10, &qword_1EAE56130);
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
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
  else
  {
    uint64_t v13 = *(void *)(v0 + 472);
    uint64_t v14 = *(void *)(v0 + 480);
    uint64_t v16 = *(uint64_t **)(v0 + 456);
    uint64_t v15 = *(void *)(v0 + 464);
    uint64_t v17 = *(void *)(v0 + 440);
    uint64_t v18 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v0 + 448) + 32);
    v18(v16, *(uint64_t **)(v0 + 384), v17);
    uint64_t v19 = MEMORY[0x1E4F37CB8];
    *(void *)(v0 + 80) = v17;
    *(void *)(v0 + 8_Block_object_dispose(&a9, 8) = v19;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
    v18(boxed_opaque_existential_1, v16, v17);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
    sub_1E4666020(v23, &qword_1EAE56188);
    sub_1E468F008(v0 + 56, v23);
    int v21 = (void *)swift_task_alloc();
    *(void *)(v0 + 680) = v21;
    void *v21 = v0;
    v21[1] = sub_1E468E1B4;
    int v22 = *(_DWORD *)(v0 + 696);
    return sub_1E468BC2C(v23, v22);
  }
}

uint64_t sub_1E468DB68()
{
  *(void *)(*(void *)v1 + 672) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1E468E954;
  }
  else {
    uint64_t v2 = sub_1E468DC7C;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E468DC7C()
{
  uint64_t v1 = *(void *)(v0 + 656);
  uint64_t v2 = *(void *)(v0 + 304);
  uint64_t v3 = *(void *)(v0 + 312);
  uint64_t v4 = *(void *)(v0 + 288);
  uint64_t v5 = *(void *)(v0 + 296);
  uint64_t v7 = *(void *)(v0 + 272);
  uint64_t v6 = *(void *)(v0 + 280);
  uint64_t v8 = *(void *)(v0 + 264);
  sub_1E46A5CA0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  sub_1E468A764(&qword_1EAE56108, &qword_1EAE561C0, MEMORY[0x1E4F37F10], v3);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  uint64_t v9 = *(void *)(v1 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v3, 1, v1) == 1)
  {
    uint64_t v10 = *(void *)(v0 + 328);
    uint64_t v11 = *(void *)(v0 + 336);
    uint64_t v12 = *(void *)(v0 + 320);
    sub_1E4666020(*(void *)(v0 + 312), &qword_1EAE56118);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(v12, 1, 1, v10);
LABEL_4:
    uint64_t v18 = *(void *)(v0 + 320);
    (*(void (**)(void, void))(*(void *)(v0 + 368) + 8))(*(void *)(v0 + 376), *(void *)(v0 + 360));
    sub_1E4666020(v0 + 16, &qword_1EAE56188);
    sub_1E4666020(v18, &qword_1EAE56120);
LABEL_5:
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
    uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
    return v19();
  }
  uint64_t v13 = *(void *)(v0 + 656);
  uint64_t v14 = *(void *)(v0 + 328);
  uint64_t v15 = *(void *)(v0 + 336);
  uint64_t v16 = *(void *)(v0 + 312);
  uint64_t v17 = *(void *)(v0 + 320);
  sub_1E46A5D10();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v16, v13);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v17, 1, v14) == 1) {
    goto LABEL_4;
  }
  uint64_t v22 = *(void *)(v0 + 344);
  uint64_t v21 = *(void *)(v0 + 352);
  uint64_t v23 = *(void *)(v0 + 328);
  uint64_t v24 = *(void *)(v0 + 336);
  (*(void (**)(uint64_t, void, uint64_t))(v24 + 32))(v21, *(void *)(v0 + 320), v23);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v22, v21, v23);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v24 + 88))(v22, v23) != *MEMORY[0x1E4F78FE8])
  {
    uint64_t v38 = *(void *)(v0 + 368);
    uint64_t v37 = *(void *)(v0 + 376);
    uint64_t v39 = *(void *)(v0 + 360);
    uint64_t v40 = *(void *)(v0 + 344);
    uint64_t v41 = *(void *)(v0 + 328);
    char v42 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 336) + 8);
    v42(*(void *)(v0 + 352), v41);
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v39);
    sub_1E4666020(v0 + 16, &qword_1EAE56188);
    v42(v40, v41);
    goto LABEL_5;
  }
  uint64_t v25 = *(void *)(v0 + 368);
  uint64_t v44 = *(void *)(v0 + 360);
  uint64_t v45 = *(void *)(v0 + 376);
  uint64_t v26 = *(void *)(v0 + 344);
  uint64_t v43 = *(void *)(v0 + 352);
  uint64_t v28 = *(void *)(v0 + 328);
  uint64_t v27 = *(void *)(v0 + 336);
  uint64_t v29 = *(void *)(v0 + 248);
  uint64_t v30 = *(uint64_t **)(v0 + 256);
  uint64_t v31 = *(void *)(v0 + 240);
  (*(void (**)(uint64_t, uint64_t))(v27 + 96))(v26, v28);
  uint64_t v32 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v29 + 32);
  v32(v30, v26, v31);
  uint64_t v33 = MEMORY[0x1E4F38120];
  *(void *)(v0 + 120) = v31;
  *(void *)(v0 + 12_Block_object_dispose(&a9, 8) = v33;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 96));
  v32(boxed_opaque_existential_1, (uint64_t)v30, v31);
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v43, v28);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v45, v44);
  sub_1E4666020(v0 + 16, &qword_1EAE56188);
  sub_1E468F008(v0 + 96, v0 + 16);
  uint64_t v35 = (void *)swift_task_alloc();
  *(void *)(v0 + 680) = v35;
  *uint64_t v35 = v0;
  v35[1] = sub_1E468E1B4;
  int v36 = *(_DWORD *)(v0 + 696);
  return sub_1E468BC2C(v0 + 16, v36);
}

uint64_t sub_1E468E1B4()
{
  *(void *)(*(void *)v1 + 68_Block_object_dispose(&a9, 8) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1E468E450;
  }
  else {
    uint64_t v2 = sub_1E468E2C8;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E468E2C8()
{
  sub_1E4666020(v0 + 16, &qword_1EAE56188);
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
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E468E450()
{
  sub_1E4666020(v0 + 16, &qword_1EAE56188);
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
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E468E5E8()
{
  (*(void (**)(void, void))(v0[72] + 8))(v0[73], v0[71]);
  sub_1E4666020((uint64_t)(v0 + 2), &qword_1EAE56188);
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
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1E468E7A0()
{
  (*(void (**)(void, void))(v0[59] + 8))(v0[60], v0[58]);
  sub_1E4666020((uint64_t)(v0 + 2), &qword_1EAE56188);
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
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1E468E954()
{
  (*(void (**)(void, void))(v0[46] + 8))(v0[47], v0[45]);
  sub_1E4666020((uint64_t)(v0 + 2), &qword_1EAE56188);
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
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t type metadata accessor for SearchUIMusicUtilities()
{
  return self;
}

uint64_t method lookup function for SearchUIMusicUtilities(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SearchUIMusicUtilities);
}

uint64_t dispatch thunk of static SearchUIMusicUtilities.playMusicItem(withMediaMetadata:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(v1 + 80) + **(int **)(v1 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1E4662D6C;
  return v6(a1);
}

uint64_t dispatch thunk of static SearchUIMusicUtilities.canPlayAppleMusic()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(v0 + 112) + **(int **)(v0 + 112));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_1E468ED0C;
  return v4();
}

uint64_t sub_1E468ED0C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1E468EE08()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1E468EE40()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1E466CF7C;
  uint64_t v4 = (uint64_t (*)(const void *))((char *)&dword_1EAE560D8 + dword_1EAE560D8);
  return v4(v2);
}

uint64_t sub_1E468EEF4()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1E468EF34()
{
  uint64_t v2 = *(void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1E4662D6C;
  uint64_t v5 = (uint64_t (*)(void *, void *))((char *)&dword_1EAE560E8 + dword_1EAE560E8);
  return v5(v2, v3);
}

uint64_t sub_1E468EFF0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return keypath_getTm(a1, MEMORY[0x1E4F369B8], a2);
}

uint64_t sub_1E468F008(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56188);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E468F070@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return keypath_getTm(a1, MEMORY[0x1E4F36858], a2);
}

uint64_t sub_1E468F088@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return keypath_getTm(a1, MEMORY[0x1E4F36850], a2);
}

uint64_t keypath_getTm@<X0>(void *a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  uint64_t result = a2(v5, v6);
  *a3 = result;
  a3[1] = v8;
  return result;
}

uint64_t sub_1E468F0F8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1E468F140(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_1E468F190(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56188);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E468F1FC()
{
  return swift_initClassMetadata2();
}

id sub_1E468F24C()
{
  uint64_t v1 = qword_1EB99B9D0;
  uint64_t v2 = *(void **)(v0 + qword_1EB99B9D0);
  if (v2)
  {
    id v3 = *(id *)(v0 + qword_1EB99B9D0);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB2068]), sel_initWithHostedView_, *(void *)(v0 + qword_1EB99B9D8));
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_1E468F2D0(void *a1)
{
  id v1 = a1;
  sub_1E468F348((uint64_t)v1);
  uint64_t v3 = v2;

  if (v3)
  {
    id v4 = (void *)sub_1E46A6040();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

uint64_t sub_1E468F348(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x1E4FBC8C8] & *v1;
  uint64_t v3 = *(void *)(v2 + 0x50);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](a1);
  id v6 = (char *)&v10 - v5;
  id v7 = *(id *)((char *)v1 + qword_1EB99B9D8);
  sub_1E46A52E0();

  uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)(v2 + 88) + 16))(v3);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8;
}

char *sub_1E468F488(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v6 = v5;
  uint64_t v11 = *MEMORY[0x1E4FBC8C8] & *(void *)v5;
  uint64_t v12 = *(void *)(v11 + 80);
  MEMORY[0x1F4188790](a1);
  uint64_t v13 = qword_1EB99B9D8;
  sub_1E46A5300();
  (*(void (**)(uint64_t, void))(*(void *)(v11 + 88) + 24))(v12, *(void *)(v11 + 88));
  uint64_t v14 = v6;
  *(void *)&v6[v13] = sub_1E46A52D0();
  *(void *)&v14[qword_1EB99B9D0] = 0;

  uint64_t v15 = (objc_class *)type metadata accessor for SupplementaryHostingView();
  v24.receiver = v14;
  v24.super_class = v15;
  uint64_t v16 = (char *)objc_msgSendSuper2(&v24, sel_initWithFrame_, a2, a3, a4, a5);
  uint64_t v17 = *(void **)&v16[qword_1EB99B9D8];
  uint64_t v18 = v16;
  id v19 = v17;
  sub_1E46A52C0();

  id v20 = sub_1E468F24C();
  objc_msgSend(v20, sel_setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview_, 1);

  uint64_t v21 = v18;
  id v22 = sub_1E468F24C();
  objc_msgSend(v21, sel_addSubview_, v22);

  return v21;
}

char *sub_1E468F694(uint64_t a1, double a2, double a3, double a4, double a5)
{
  return sub_1E468F488(a1, a2, a3, a4, a5);
}

void sub_1E468F6B8(uint64_t a1, uint64_t a2, void *a3)
{
}

uint64_t sub_1E468F6E0()
{
  return 1;
}

double sub_1E468F6E8(void *a1, double a2, double a3)
{
  id v5 = a1;
  double v6 = sub_1E468FA90(a2, a3);

  return v6;
}

void sub_1E468F73C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SupplementaryHostingView();
  objc_msgSendSuper2(&v2, sel_layoutSubviews);
  id v1 = sub_1E468F24C();
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setFrame_);
}

void sub_1E468F7F8(void *a1)
{
  id v1 = a1;
  sub_1E468F73C();
}

id sub_1E468F840()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SupplementaryHostingView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1E468F8C8(uint64_t a1)
{
  objc_super v2 = *(void **)(a1 + qword_1EB99B9D0);
}

uint64_t type metadata accessor for SupplementaryHostingView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1E468F92C()
{
  return *(void *)(v0 + qword_1EB99B9D8);
}

void sub_1E468F93C(uint64_t a1)
{
  objc_super v2 = v1;
  uint64_t v3 = *MEMORY[0x1E4FBC8C8] & *(void *)v1;
  uint64_t v4 = *(void *)(v3 + 80);
  MEMORY[0x1F4188790](a1);
  uint64_t v5 = qword_1EB99B9D8;
  sub_1E46A5300();
  (*(void (**)(uint64_t))(*(void *)(v3 + 88) + 24))(v4);
  *(void *)&v2[v5] = sub_1E46A52D0();
  *(void *)&v2[qword_1EB99B9D0] = 0;

  sub_1E46A6430();
  __break(1u);
}

double sub_1E468FA90(double a1, double a2)
{
  id v4 = sub_1E468F24C();
  objc_msgSend(v4, sel__layoutSizeThatFits_fixedAxes_, 1, a1, a2);
  double v6 = v5;

  return v6;
}

uint64_t sub_1E468FAF0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(v2 + 64) + 40);
  id v4 = a2;
  sub_1E467946C((uint64_t)&v6, v3, (uint64_t *)&unk_1EAE56278);
  return swift_continuation_resume();
}

uint64_t sub_1E468FB54()
{
  return MEMORY[0x1F4188298](sub_1E468FB70, 0, 0);
}

uint64_t sub_1E468FB70()
{
  sub_1E46A5D80();
  id v1 = (void *)sub_1E46A5D70();
  v0[16] = v1;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_1E468FC80;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x1E4F143A8];
  v0[11] = 0x40000000;
  v0[12] = sub_1E468FAF0;
  v0[13] = &block_descriptor_0;
  v0[14] = v2;
  objc_msgSend(v1, sel_providerLogoWithCompletionHandler_, v0 + 10);
  return MEMORY[0x1F41881E8](v0 + 2);
}

uint64_t sub_1E468FC80()
{
  return MEMORY[0x1F4188298](sub_1E468FD60, 0, 0);
}

uint64_t sub_1E468FD60()
{
  uint64_t v1 = *(void *)(v0 + 120);

  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_1E468FF24(const void *a1)
{
  *(void *)(v1 + 12_Block_object_dispose(&a9, 8) = _Block_copy(a1);
  return MEMORY[0x1F4188298](sub_1E468FF8C, 0, 0);
}

uint64_t sub_1E468FF8C()
{
  sub_1E46A5D80();
  uint64_t v1 = (void *)sub_1E46A5D70();
  v0[17] = v1;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_1E469009C;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x1E4F143A8];
  v0[11] = 0x40000000;
  v0[12] = sub_1E468FAF0;
  v0[13] = &block_descriptor_47;
  v0[14] = v2;
  objc_msgSend(v1, sel_providerLogoWithCompletionHandler_, v0 + 10);
  return MEMORY[0x1F41881E8](v0 + 2);
}

uint64_t sub_1E469009C()
{
  return MEMORY[0x1F4188298](sub_1E469017C, 0, 0);
}

uint64_t sub_1E469017C()
{
  uint64_t v1 = *(void (***)(void, void))(v0 + 128);
  uint64_t v2 = *(void **)(v0 + 120);

  ((void (**)(void, void *))v1)[2](v1, v2);
  _Block_release(v1);

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_1E4690200()
{
  return MEMORY[0x1F4188298](sub_1E469021C, 0, 0);
}

uint64_t sub_1E469021C()
{
  sub_1E46A5D80();
  uint64_t v1 = (void *)sub_1E46A5D70();
  v0[17] = v1;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_1E469032C;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x1E4F143A8];
  v0[11] = 0x40000000;
  v0[12] = sub_1E4690478;
  v0[13] = &block_descriptor_1;
  v0[14] = v2;
  objc_msgSend(v1, sel_providerNameWithCompletionHandler_, v0 + 10);
  return MEMORY[0x1F41881E8](v0 + 2);
}

uint64_t sub_1E469032C()
{
  return MEMORY[0x1F4188298](sub_1E469040C, 0, 0);
}

uint64_t sub_1E469040C()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 120);

  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v3(v2, v1);
}

uint64_t sub_1E4690478(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = sub_1E46A6050();
  }
  else {
    uint64_t v3 = 0;
  }
  v5[0] = v3;
  v5[1] = a2;
  sub_1E467946C((uint64_t)v5, *(void *)(*(void *)(v2 + 64) + 40), &qword_1EAE56270);
  return swift_continuation_resume();
}

uint64_t sub_1E4690648(const void *a1)
{
  *(void *)(v1 + 136) = _Block_copy(a1);
  return MEMORY[0x1F4188298](sub_1E46906B0, 0, 0);
}

uint64_t sub_1E46906B0()
{
  sub_1E46A5D80();
  uint64_t v1 = (void *)sub_1E46A5D70();
  v0[18] = v1;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_1E46907C0;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x1E4F143A8];
  v0[11] = 0x40000000;
  v0[12] = sub_1E4690478;
  v0[13] = &block_descriptor_32;
  v0[14] = v2;
  objc_msgSend(v1, sel_providerNameWithCompletionHandler_, v0 + 10);
  return MEMORY[0x1F41881E8](v0 + 2);
}

uint64_t sub_1E46907C0()
{
  return MEMORY[0x1F4188298](sub_1E46908A0, 0, 0);
}

uint64_t sub_1E46908A0()
{
  uint64_t v1 = *(void *)(v0 + 128);

  if (v1)
  {
    uint64_t v2 = (void *)sub_1E46A6040();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = 0;
  }
  uint64_t v3 = *(void (***)(void, void))(v0 + 136);
  ((void (**)(void, void *))v3)[2](v3, v2);

  _Block_release(v3);
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_1E469094C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE561F8);
  *(void *)(v1 + 24) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E46909E0, 0, 0);
}

uint64_t sub_1E46909E0()
{
  sub_1E46A5D80();
  v0[4] = sub_1E46A5D70();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[5] = v1;
  void *v1 = v0;
  v1[1] = sub_1E4690A90;
  uint64_t v2 = v0[3];
  return MEMORY[0x1F410DEF8](v2);
}

uint64_t sub_1E4690A90()
{
  uint64_t v1 = *(void **)(*(void *)v0 + 32);
  swift_task_dealloc();

  return MEMORY[0x1F4188298](sub_1E4690BA4, 0, 0);
}

uint64_t sub_1E4690BA4()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = sub_1E46A5D50();
  uint64_t v3 = *(void *)(v2 - 8);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  uint64_t v5 = v0[2];
  if (v4 == 1)
  {
    sub_1E4690CF4(v1);
    uint64_t v6 = sub_1E46A4D90();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  }
  else
  {
    sub_1E46A5D40();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  }
  swift_task_dealloc();
  id v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_1E4690CF4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE561F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E4690EB4(const void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE561F8);
  v1[2] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56228);
  v1[3] = swift_task_alloc();
  v1[4] = swift_task_alloc();
  v1[5] = _Block_copy(a1);
  return MEMORY[0x1F4188298](sub_1E4690F94, 0, 0);
}

uint64_t sub_1E4690F94()
{
  sub_1E46A5D80();
  v0[6] = sub_1E46A5D70();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[7] = v1;
  void *v1 = v0;
  v1[1] = sub_1E4691044;
  uint64_t v2 = v0[2];
  return MEMORY[0x1F410DEF8](v2);
}

uint64_t sub_1E4691044()
{
  uint64_t v1 = *(void **)(*(void *)v0 + 48);
  swift_task_dealloc();

  return MEMORY[0x1F4188298](sub_1E4691158, 0, 0);
}

uint64_t sub_1E4691158()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = sub_1E46A5D50();
  uint64_t v3 = *(void *)(v2 - 8);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  uint64_t v5 = v0[4];
  if (v4 == 1)
  {
    sub_1E4690CF4(v1);
    uint64_t v6 = sub_1E46A4D90();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  }
  else
  {
    sub_1E46A5D40();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  }
  uint64_t v7 = v0[3];
  sub_1E467946C(v0[4], v7, &qword_1EAE56228);
  uint64_t v8 = sub_1E46A4D90();
  uint64_t v9 = *(void *)(v8 - 8);
  int v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  uint64_t v11 = 0;
  if (v10 != 1)
  {
    uint64_t v12 = v0[3];
    uint64_t v11 = (void *)sub_1E46A4D70();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v12, v8);
  }
  uint64_t v13 = (void (**)(void, void))v0[5];
  ((void (**)(void, void *))v13)[2](v13, v11);
  _Block_release(v13);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

id SearchUICalculateUIUtilities.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id SearchUICalculateUIUtilities.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUICalculateUIUtilities();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SearchUICalculateUIUtilities()
{
  return self;
}

id SearchUICalculateUIUtilities.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUICalculateUIUtilities();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for SearchUICalculateUIUtilities(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SearchUICalculateUIUtilities);
}

uint64_t dispatch thunk of static SearchUICalculateUIUtilities.currencyConversionProviderImage()()
{
  int v4 = (uint64_t (*)(void))(*(void *)(v0 + 80) + **(int **)(v0 + 80));
  objc_super v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_1E46689D4;
  return v4();
}

uint64_t dispatch thunk of static SearchUICalculateUIUtilities.currencyConversionProviderName()()
{
  int v4 = (uint64_t (*)(void))(*(void *)(v0 + 88) + **(int **)(v0 + 88));
  objc_super v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_1E4691658;
  return v4();
}

uint64_t sub_1E4691658(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

uint64_t dispatch thunk of static SearchUICalculateUIUtilities.currencyConversionProviderURL()(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(v1 + 96) + **(int **)(v1 + 96));
  int v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *int v4 = v2;
  v4[1] = sub_1E4662D6C;
  return v6(a1);
}

uint64_t sub_1E469184C()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1E4691884()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1E466CF7C;
  int v4 = (uint64_t (*)(const void *))((char *)&dword_1EAE56218 + dword_1EAE56218);
  return v4(v2);
}

uint64_t sub_1E4691938()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1E466CF7C;
  int v4 = (uint64_t (*)(const void *))((char *)&dword_1EAE56230 + dword_1EAE56230);
  return v4(v2);
}

uint64_t sub_1E46919EC()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1E466CF7C;
  int v4 = (uint64_t (*)(const void *))((char *)&dword_1EAE56250 + dword_1EAE56250);
  return v4(v2);
}

uint64_t initializeBufferWithCopyOfBuffer for Separator(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_1E4691AF0(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + _Block_object_dispose(&a9, 8) = v4;
  return a1;
}

uint64_t sub_1E4691AF0(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return sub_1E46A4AB0();
  }
  return result;
}

uint64_t destroy for Separator(uint64_t a1)
{
  return sub_1E46794D0(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t assignWithCopy for Separator(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_1E4691AF0(*(void *)a2, v4);
  uint64_t v5 = *(void *)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + _Block_object_dispose(&a9, 8) = v4;
  sub_1E46794D0(v5, v6);
  return a1;
}

uint64_t assignWithTake for Separator(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v4 = *((unsigned char *)a2 + 8);
  uint64_t v5 = *(void *)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + _Block_object_dispose(&a9, 8) = v4;
  sub_1E46794D0(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for Separator(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Separator(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + _Block_object_dispose(&a9, 8) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + _Block_object_dispose(&a9, 8) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Separator()
{
  return &type metadata for Separator;
}

uint64_t sub_1E4691C3C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1E4691C58@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for SearchUIAppearance();
  uint64_t v7 = v6 - 8;
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (uint64_t *)((char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53628);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *uint64_t v9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53408);
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = (uint64_t *)((char *)v9 + *(int *)(v7 + 28));
  *uint64_t v13 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53418);
  swift_storeEnumTagMultiPayload();
  uint64_t v14 = (char *)v9 + *(int *)(v7 + 32);
  *(void *)uint64_t v14 = 0;
  v14[8] = 2;
  sub_1E4691EAC((uint64_t)v9, (uint64_t)v12);
  sub_1E4677FA0((uint64_t)v9);
  a2 &= 1u;
  sub_1E4691AF0(a1, a2);
  sub_1E4677BA0(a1, a2);
  sub_1E46794D0(a1, a2);
  sub_1E46A5A30();
  sub_1E46A5250();
  sub_1E4691F10((uint64_t)v12, a3);
  uint64_t v15 = (_OWORD *)(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EAE535C8) + 36));
  long long v16 = v18[1];
  _OWORD *v15 = v18[0];
  v15[1] = v16;
  void v15[2] = v18[2];
  return sub_1E4691F78((uint64_t)v12);
}

uint64_t sub_1E4691E54@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4691C58(*(void *)v1, *(unsigned char *)(v1 + 8), a1);
}

uint64_t sub_1E4691E60@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = swift_getKeyPath();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + _Block_object_dispose(&a9, 8) = 0;
  return result;
}

uint64_t sub_1E4691EAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SearchUIAppearance();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E4691F10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53628);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E4691F78(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE53628);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1E4691FDC()
{
  unint64_t result = qword_1EAE53650;
  if (!qword_1EAE53650)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE535C8);
    sub_1E4692058();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE53650);
  }
  return result;
}

unint64_t sub_1E4692058()
{
  unint64_t result = qword_1EAE53620;
  if (!qword_1EAE53620)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE53628);
    sub_1E46920D4();
    sub_1E4679414();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE53620);
  }
  return result;
}

unint64_t sub_1E46920D4()
{
  unint64_t result = qword_1EAE534D0;
  if (!qword_1EAE534D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE534D0);
  }
  return result;
}

uint64_t sub_1E469212C()
{
  unsigned int v3 = (uint64_t (__cdecl *)())((char *)&dword_1EAE56288 + dword_1EAE56288);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1E4695810;
  return v3();
}

uint64_t sub_1E469232C(const void *a1)
{
  *(void *)(v1 + 16) = _Block_copy(a1);
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1EAE56288 + dword_1EAE56288);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_1E46923D4;
  return v4();
}

uint64_t sub_1E46923D4(char a1)
{
  unsigned int v3 = v1;
  uint64_t v6 = *v2;
  uint64_t v5 = *v2;
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v8 = *(void *)(v5 + 16);
  if (v3)
  {
    uint64_t v9 = (void *)sub_1E46A4D10();

    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, a1 & 1, 0);
  }
  _Block_release(*(const void **)(v6 + 16));
  uint64_t v10 = *(uint64_t (**)(void))(v7 + 8);
  return v10();
}

uint64_t sub_1E469254C(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_1EAE56298 + dword_1EAE56298);
  unsigned int v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *unsigned int v3 = v1;
  v3[1] = sub_1E46925F4;
  return v5(a1);
}

uint64_t sub_1E46925F4(char a1)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (v1) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = a1 & 1;
  }
  return v4(v5);
}

uint64_t sub_1E4692874(void *a1, void *aBlock)
{
  v2[2] = a1;
  v2[3] = _Block_copy(aBlock);
  uint64_t v7 = (uint64_t (*)(id))((char *)&dword_1EAE56298 + dword_1EAE56298);
  id v4 = a1;
  uint64_t v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1E469293C;
  return v7(v4);
}

uint64_t sub_1E469293C(char a1)
{
  unsigned int v3 = v1;
  uint64_t v6 = *v2;
  uint64_t v5 = *v2;
  uint64_t v7 = *(void **)(*v2 + 16);
  uint64_t v8 = *v2;
  swift_task_dealloc();

  uint64_t v9 = *(void *)(v5 + 24);
  if (v3)
  {
    uint64_t v10 = (void *)sub_1E46A4D10();

    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
  else
  {
    (*(void (**)(uint64_t, void, void))(v9 + 16))(v9, a1 & 1, 0);
  }
  _Block_release(*(const void **)(v6 + 24));
  uint64_t v11 = *(uint64_t (**)(void))(v8 + 8);
  return v11();
}

uint64_t sub_1E4692ACC(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1EAE562A8 + dword_1EAE562A8);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1E4662D6C;
  return v7(a1, a2);
}

uint64_t sub_1E4692D00(void *a1, char a2, void *aBlock)
{
  v3[2] = a1;
  v3[3] = _Block_copy(aBlock);
  uint64_t v9 = (uint64_t (*)(uint64_t, char))((char *)&dword_1EAE562A8 + dword_1EAE562A8);
  id v6 = a1;
  uint64_t v7 = (void *)swift_task_alloc();
  v3[4] = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1E466D2B0;
  return v9((uint64_t)v6, a2);
}

id SearchUITVUtilities.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id SearchUITVUtilities.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUITVUtilities();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SearchUITVUtilities.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUITVUtilities();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1E4692EDC(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *id v4 = v3;
  v4[1] = sub_1E466CF7C;
  return v6();
}

uint64_t sub_1E4692FA8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_1E466CF7C;
  return v7();
}

uint64_t sub_1E4693074(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E46A61C0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1E46A61B0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1E4695430(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1E46A6160();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1E4693218(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1E46932F4;
  return v6(a1);
}

uint64_t sub_1E46932F4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1E46933EC()
{
  uint64_t v1 = sub_1E46A4F30();
  v0[6] = v1;
  v0[7] = *(void *)(v1 - 8);
  v0[8] = swift_task_alloc();
  v0[9] = swift_task_alloc();
  uint64_t v2 = sub_1E46A5020();
  v0[10] = v2;
  v0[11] = *(void *)(v2 - 8);
  v0[12] = swift_task_alloc();
  uint64_t v3 = sub_1E46A4F20();
  v0[13] = v3;
  v0[14] = *(void *)(v3 - 8);
  v0[15] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E4693570, 0, 0);
}

uint64_t sub_1E4693570()
{
  sub_1E46A4FA0();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 12_Block_object_dispose(&a9, 8) = v1;
  void *v1 = v0;
  v1[1] = sub_1E4693614;
  uint64_t v2 = *(void *)(v0 + 120);
  return MEMORY[0x1F415D048](v2);
}

uint64_t sub_1E4693614()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 96);
  uint64_t v3 = *(void *)(*(void *)v1 + 88);
  uint64_t v4 = *(void *)(*(void *)v1 + 80);
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = sub_1E469396C;
  }
  else {
    uint64_t v5 = sub_1E4693784;
  }
  return MEMORY[0x1F4188298](v5, 0, 0);
}

uint64_t sub_1E4693784()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[7];
  sub_1E46A4F10();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, *MEMORY[0x1E4FA9BC8], v2);
  sub_1E46957C4(&qword_1EAE56360, MEMORY[0x1E4FA9BD8]);
  sub_1E46A60E0();
  sub_1E46A60E0();
  if (v0[2] == v0[4] && v0[3] == v0[5]) {
    char v14 = 1;
  }
  else {
    char v14 = sub_1E46A64D0();
  }
  uint64_t v4 = v0[14];
  uint64_t v5 = v0[15];
  uint64_t v6 = v0[13];
  uint64_t v8 = v0[8];
  uint64_t v7 = v0[9];
  uint64_t v10 = v0[6];
  uint64_t v9 = v0[7];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v11(v8, v10);
  v11(v7, v10);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12(v14 & 1);
}

uint64_t sub_1E469396C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_1E46939FC(uint64_t a1)
{
  v1[7] = a1;
  uint64_t v2 = sub_1E46A4FC0();
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  uint64_t v3 = sub_1E46A4FE0();
  v1[12] = v3;
  v1[13] = *(void *)(v3 - 8);
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  uint64_t v4 = sub_1E46A4F80();
  v1[17] = v4;
  v1[18] = *(void *)(v4 - 8);
  v1[19] = swift_task_alloc();
  uint64_t v5 = sub_1E46A5020();
  v1[20] = v5;
  v1[21] = *(void *)(v5 - 8);
  v1[22] = swift_task_alloc();
  uint64_t v6 = sub_1E46A5010();
  v1[23] = v6;
  v1[24] = *(void *)(v6 - 8);
  v1[25] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E4693C58, 0, 0);
}

uint64_t sub_1E4693C58()
{
  sub_1E46A4FA0();
  v0[6] = MEMORY[0x1E4FBC860];
  sub_1E46957C4(&qword_1EAE56340, MEMORY[0x1E4FA9C10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56348);
  sub_1E4695768();
  sub_1E46A62E0();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[26] = v1;
  void *v1 = v0;
  v1[1] = sub_1E4693D94;
  uint64_t v2 = v0[25];
  uint64_t v3 = v0[19];
  return MEMORY[0x1F415D078](v2, v3);
}

uint64_t sub_1E4693D94()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 176);
  uint64_t v3 = *(void *)(*(void *)v1 + 168);
  uint64_t v4 = *(void *)(*(void *)v1 + 160);
  uint64_t v5 = *(void *)(*(void *)v1 + 152);
  uint64_t v6 = *(void *)(*(void *)v1 + 144);
  uint64_t v7 = *(void *)(*(void *)v1 + 136);
  *(void *)(*(void *)v1 + 216) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v8 = sub_1E4694500;
  }
  else {
    uint64_t v8 = sub_1E4693F68;
  }
  return MEMORY[0x1F4188298](v8, 0, 0);
}

uint64_t sub_1E4693F68()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[9];
  uint64_t result = sub_1E46A5000();
  uint64_t v4 = result;
  int64_t v5 = 0;
  uint64_t v57 = result + 56;
  uint64_t v6 = -1;
  uint64_t v7 = -1 << *(unsigned char *)(result + 32);
  if (-v7 < 64) {
    uint64_t v6 = ~(-1 << -(char)v7);
  }
  unint64_t v8 = v6 & *(void *)(result + 56);
  int64_t v58 = (unint64_t)(63 - v7) >> 6;
  unsigned int v55 = *MEMORY[0x1E4FA9C28];
  uint64_t v53 = (void (**)(uint64_t, uint64_t))(v2 + 8);
  uint64_t v54 = (void (**)(uint64_t, void, uint64_t))(v2 + 104);
  uint64_t v61 = v1;
  uint64_t v60 = (void (**)(uint64_t, uint64_t))(v1 + 8);
  uint64_t v56 = result;
  if (v8) {
    goto LABEL_8;
  }
LABEL_9:
  while (2)
  {
    int64_t v19 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_43;
    }
    if (v19 >= v58)
    {
LABEL_37:
      unsigned int v63 = 0;
      goto LABEL_39;
    }
    unint64_t v20 = *(void *)(v57 + 8 * v19);
    int64_t v21 = v5 + 1;
    if (!v20)
    {
      int64_t v21 = v5 + 2;
      if (v5 + 2 >= v58) {
        goto LABEL_37;
      }
      unint64_t v20 = *(void *)(v57 + 8 * v21);
      if (!v20)
      {
        int64_t v21 = v5 + 3;
        if (v5 + 3 >= v58) {
          goto LABEL_37;
        }
        unint64_t v20 = *(void *)(v57 + 8 * v21);
        if (!v20)
        {
          uint64_t v22 = v5 + 4;
          if (v5 + 4 < v58)
          {
            unint64_t v20 = *(void *)(v57 + 8 * v22);
            if (v20)
            {
              int64_t v21 = v5 + 4;
              goto LABEL_22;
            }
            while (1)
            {
              int64_t v21 = v22 + 1;
              if (__OFADD__(v22, 1)) {
                break;
              }
              if (v21 >= v58) {
                goto LABEL_37;
              }
              unint64_t v20 = *(void *)(v57 + 8 * v21);
              ++v22;
              if (v20) {
                goto LABEL_22;
              }
            }
LABEL_43:
            __break(1u);
            return result;
          }
          goto LABEL_37;
        }
      }
    }
LABEL_22:
    uint64_t v62 = (v20 - 1) & v20;
    int64_t v64 = v21;
    for (unint64_t i = __clz(__rbit64(v20)) + (v21 << 6); ; unint64_t i = __clz(__rbit64(v8)) | (v5 << 6))
    {
      uint64_t v24 = v0[15];
      uint64_t v23 = v0[16];
      uint64_t v25 = v0[12];
      uint64_t v26 = (void *)v0[7];
      uint64_t v27 = *(void (**)(uint64_t, unint64_t, uint64_t))(v61 + 16);
      v27(v23, *(void *)(v4 + 48) + *(void *)(v61 + 72) * i, v25);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v61 + 32))(v24, v23, v25);
      uint64_t v28 = sub_1E46A4FB0();
      uint64_t v30 = v29;
      id v31 = objc_msgSend(v26, sel_identifier);
      if (!v31)
      {
        uint64_t v42 = v0[14];
        unint64_t v41 = v0[15];
        uint64_t v43 = v0[12];
        swift_bridgeObjectRelease();
        v27(v42, v41, v43);
        goto LABEL_31;
      }
      uint64_t v32 = v31;
      uint64_t v33 = sub_1E46A6050();
      uint64_t v35 = v34;

      uint64_t v36 = v0[14];
      unint64_t v37 = v0[15];
      uint64_t v38 = v0[12];
      if (v28 == v33 && v30 == v35) {
        break;
      }
      char v40 = sub_1E46A64D0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v27(v36, v37, v38);
      if (v40) {
        goto LABEL_34;
      }
LABEL_31:
      uint64_t v44 = v0[15];
      uint64_t v45 = v0[12];
      uint64_t v46 = *v60;
      (*v60)(v0[14], v45);
      uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v46)(v44, v45);
      unint64_t v8 = v62;
      int64_t v5 = v64;
      if (!v62) {
        goto LABEL_9;
      }
LABEL_8:
      uint64_t v62 = (v8 - 1) & v8;
      int64_t v64 = v5;
    }
    swift_bridgeObjectRelease_n();
    v27(v36, v37, v38);
LABEL_34:
    uint64_t v47 = v0[10];
    uint64_t v48 = v0[8];
    sub_1E46A4FD0();
    (*v54)(v47, v55, v48);
    sub_1E46957C4(&qword_1EAE56358, MEMORY[0x1E4FA9C38]);
    sub_1E46A60E0();
    sub_1E46A60E0();
    if (v0[2] == v0[4] && v0[3] == v0[5]) {
      int v59 = 1;
    }
    else {
      int v59 = sub_1E46A64D0();
    }
    uint64_t v10 = v0[14];
    uint64_t v9 = v0[15];
    uint64_t v12 = v0[11];
    uint64_t v11 = v0[12];
    uint64_t v13 = v0[10];
    uint64_t v15 = (void *)v0[7];
    uint64_t v14 = v0[8];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    long long v16 = *v53;
    (*v53)(v13, v14);
    v16(v12, v14);
    LODWORD(v15) = objc_msgSend(v15, sel_type) != 1;
    uint64_t v17 = *v60;
    (*v60)(v10, v11);
    uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v17)(v9, v11);
    uint64_t v4 = v56;
    unint64_t v8 = v62;
    int64_t v5 = v64;
    if (((v59 ^ v15) & 1) == 0)
    {
      if (!v62) {
        continue;
      }
      goto LABEL_8;
    }
    break;
  }
  unsigned int v63 = 1;
LABEL_39:
  uint64_t v50 = v0[24];
  uint64_t v49 = v0[25];
  uint64_t v51 = v0[23];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v49, v51);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v52 = (uint64_t (*)(void))v0[1];
  return v52(v63);
}

uint64_t sub_1E4694500()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_1E46945CC(uint64_t a1, char a2)
{
  *(unsigned char *)(v2 + 160) = a2;
  *(void *)(v2 + 16) = a1;
  uint64_t v3 = sub_1E46A5020();
  *(void *)(v2 + 24) = v3;
  *(void *)(v2 + 32) = *(void *)(v3 - 8);
  *(void *)(v2 + 40) = swift_task_alloc();
  *(void *)(v2 + 4_Block_object_dispose(&a9, 8) = swift_task_alloc();
  uint64_t v4 = sub_1E46A5010();
  *(void *)(v2 + 56) = v4;
  *(void *)(v2 + 64) = *(void *)(v4 - 8);
  *(void *)(v2 + 72) = swift_task_alloc();
  *(void *)(v2 + 80) = swift_task_alloc();
  uint64_t v5 = sub_1E46A4FF0();
  *(void *)(v2 + 8_Block_object_dispose(&a9, 8) = v5;
  *(void *)(v2 + 96) = *(void *)(v5 - 8);
  *(void *)(v2 + 104) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E4694768, 0, 0);
}

uint64_t sub_1E4694768()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_identifier);
  uint64_t v2 = *(uint64_t **)(v0 + 104);
  if (v1)
  {
    uint64_t v3 = v1;
    uint64_t v4 = *(void *)(v0 + 88);
    uint64_t v5 = *(void *)(v0 + 96);
    int v6 = *(unsigned __int8 *)(v0 + 160);
    uint64_t v7 = *(void **)(v0 + 16);
    uint64_t v8 = sub_1E46A6050();
    uint64_t v10 = v9;

    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE535B0);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_1E46B7170;
    *(void *)(v11 + 32) = v8;
    *(void *)(v11 + 40) = v10;
    unsigned int v12 = objc_msgSend(v7, sel_type);
    uint64_t *v2 = v11;
    uint64_t v13 = (unsigned int *)MEMORY[0x1E4FA9C50];
    if (v12 != 1) {
      uint64_t v13 = (unsigned int *)MEMORY[0x1E4FA9C58];
    }
    (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v2, *v13, v4);
    uint64_t v14 = *(void *)(v0 + 104);
    uint64_t v15 = *(void *)(v0 + 88);
    if (v6 == 1)
    {
      sub_1E46A4FA0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56338);
      unint64_t v16 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
      uint64_t v17 = swift_allocObject();
      *(void *)(v0 + 112) = v17;
      *(_OWORD *)(v17 + 16) = xmmword_1E46B7170;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 16))(v17 + v16, v14, v15);
      uint64_t v18 = (void *)swift_task_alloc();
      *(void *)(v0 + 120) = v18;
      void *v18 = v0;
      v18[1] = sub_1E4694AAC;
      uint64_t v19 = *(void *)(v0 + 80);
      return MEMORY[0x1F415D070](v19, v17);
    }
    else
    {
      sub_1E46A4FA0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56338);
      unint64_t v21 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
      uint64_t v22 = swift_allocObject();
      *(void *)(v0 + 136) = v22;
      *(_OWORD *)(v22 + 16) = xmmword_1E46B7170;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 16))(v22 + v21, v14, v15);
      uint64_t v23 = (void *)swift_task_alloc();
      *(void *)(v0 + 144) = v23;
      *uint64_t v23 = v0;
      v23[1] = sub_1E4694D00;
      uint64_t v24 = *(void *)(v0 + 72);
      return MEMORY[0x1F415D088](v24, v22);
    }
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
    return v20();
  }
}

uint64_t sub_1E4694AAC()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 12_Block_object_dispose(&a9, 8) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2[4] + 8))(v2[6], v2[3]);
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_1E4694EA8;
  }
  else
  {
    uint64_t v4 = v2[10];
    uint64_t v5 = v2[7];
    uint64_t v6 = v2[8];
    uint64_t v7 = v2[6];
    uint64_t v10 = v2 + 3;
    uint64_t v8 = v2[3];
    uint64_t v9 = v10[1];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
    uint64_t v3 = sub_1E4694C54;
  }
  return MEMORY[0x1F4188298](v3, 0, 0);
}

uint64_t sub_1E4694C54()
{
  (*(void (**)(void, void))(v0[12] + 8))(v0[13], v0[11]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1E4694D00()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2[4] + 8))(v2[5], v2[3]);
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_1E4694F60;
  }
  else
  {
    uint64_t v5 = v2[8];
    uint64_t v4 = v2[9];
    uint64_t v6 = v2[7];
    uint64_t v8 = v2[4];
    uint64_t v7 = v2[5];
    uint64_t v9 = v2[3];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v3 = sub_1E469580C;
  }
  return MEMORY[0x1F4188298](v3, 0, 0);
}

uint64_t sub_1E4694EA8()
{
  (*(void (**)(void, void))(v0[12] + 8))(v0[13], v0[11]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1E4694F60()
{
  (*(void (**)(void, void))(v0[12] + 8))(v0[13], v0[11]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t type metadata accessor for SearchUITVUtilities()
{
  return self;
}

uint64_t method lookup function for SearchUITVUtilities(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SearchUITVUtilities);
}

uint64_t dispatch thunk of static SearchUITVUtilities.fetchSportsFavoritesEnabledStatus()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(v0 + 80) + **(int **)(v0 + 80));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_1E4695814;
  return v4();
}

uint64_t dispatch thunk of static SearchUITVUtilities.fetchSportsItemIsFavorited(sportsItem:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(v1 + 88) + **(int **)(v1 + 88));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1E468ED0C;
  return v6(a1);
}

uint64_t dispatch thunk of static SearchUITVUtilities.updateSportsItemFavoriteStatus(sportsItem:shouldBeFavorite:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v2 + 96) + **(int **)(v2 + 96));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_1E4662D6C;
  return v8(a1, a2);
}

uint64_t dispatch thunk of static SearchUITVUtilities.favoritesDidChangeNotificationName()()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_1E4695324()
{
  _Block_release(*(const void **)(v0 + 32));
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1E4695364()
{
  uint64_t v2 = *(void **)(v0 + 16);
  char v3 = *(unsigned char *)(v0 + 24);
  uint64_t v4 = *(void **)(v0 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1E466CF7C;
  uint64_t v6 = (uint64_t (*)(void *, char, void *))((char *)&dword_1EAE562C8 + dword_1EAE562C8);
  return v6(v2, v3, v4);
}

uint64_t sub_1E4695430(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB99B980);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E4695490()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1E46954C8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1E466CF7C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EAE562E8 + dword_1EAE562E8);
  return v6(a1, v4);
}

uint64_t sub_1E4695580()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1E46955C0()
{
  uint64_t v2 = *(void **)(v0 + 16);
  char v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1E4662D6C;
  uint64_t v5 = (uint64_t (*)(void *, void *))((char *)&dword_1EAE562F8 + dword_1EAE562F8);
  return v5(v2, v3);
}

uint64_t sub_1E469567C()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1E46956B4()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  char v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *char v3 = v1;
  v3[1] = sub_1E466CF7C;
  uint64_t v4 = (uint64_t (*)(const void *))((char *)&dword_1EAE56318 + dword_1EAE56318);
  return v4(v2);
}

unint64_t sub_1E4695768()
{
  unint64_t result = qword_1EAE56350;
  if (!qword_1EAE56350)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE56348);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE56350);
  }
  return result;
}

uint64_t sub_1E46957C4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1E4695818@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, a1);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a2, v6, v8);
  }
  v11[0] = 0;
  v11[1] = 0xE000000000000000;
  sub_1E46A64C0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, a1);
}

uint64_t sub_1E46959A4(uint64_t a1)
{
  uint64_t v27 = a1;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56398);
  uint64_t v1 = *(void *)(v26 - 8);
  MEMORY[0x1F4188790](v26);
  char v3 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE563A0);
  MEMORY[0x1F4188790](v4);
  unint64_t v5 = sub_1E46677C0();
  sub_1E46A4B80(19, 1, &type metadata for SearchUIContinuationIntent, v5);
  sub_1E46A4B70(0xD000000000000013, 0x80000001E46BD2D0, v4);
  swift_getKeyPath();
  v19[1] = sub_1E4696EC4();
  sub_1E46A4AB0();
  swift_release();
  sub_1E46A4B60();
  swift_release();
  sub_1E46A4B70(0, 0xE000000000000000, v4);
  sub_1E46A4B90();
  uint64_t v6 = sub_1E46A4AE0();
  uint64_t v8 = v1 + 8;
  uint64_t v7 = *(void (**)(char *, uint64_t))(v1 + 8);
  uint64_t v23 = v6;
  uint64_t v24 = v7;
  uint64_t v9 = v26;
  v7(v3, v26);
  uint64_t v25 = v8;
  sub_1E46A4B80(25, 1, &type metadata for SearchUIContinuationIntent, v5);
  sub_1E46A4B70(0xD000000000000019, 0x80000001E46BD2F0, v4);
  swift_getKeyPath();
  sub_1E46A4AB0();
  swift_release();
  sub_1E46A4B60();
  swift_release();
  sub_1E46A4B70(0, 0xE000000000000000, v4);
  sub_1E46A4B90();
  uint64_t v22 = sub_1E46A4AE0();
  uint64_t v10 = v24;
  v24(v3, v9);
  sub_1E46A4B80(15, 1, &type metadata for SearchUIContinuationIntent, v5);
  sub_1E46A4B70(0x6165732065766F4DLL, 0xEF206F7420686372, v4);
  swift_getKeyPath();
  sub_1E46A4AB0();
  swift_release();
  sub_1E46A4B60();
  swift_release();
  sub_1E46A4B70(0, 0xE000000000000000, v4);
  sub_1E46A4B90();
  uint64_t v21 = sub_1E46A4AE0();
  v10(v3, v26);
  sub_1E46A4B80(22, 1, &type metadata for SearchUIContinuationIntent, v5);
  sub_1E46A4B70(0x20686372616553, 0xE700000000000000, v4);
  swift_getKeyPath();
  sub_1E46A4AB0();
  swift_release();
  sub_1E46A4B60();
  swift_release();
  sub_1E46A4B70(0x7053206D6F726620, 0xEF746867696C746FLL, v4);
  sub_1E46A4B90();
  uint64_t v20 = sub_1E46A4AE0();
  uint64_t v11 = v26;
  uint64_t v12 = v24;
  v24(v3, v26);
  sub_1E46A4B80(37, 1, &type metadata for SearchUIContinuationIntent, v5);
  sub_1E46A4B70(0xD000000000000025, 0x80000001E46BD310, v4);
  swift_getKeyPath();
  sub_1E46A4AB0();
  swift_release();
  sub_1E46A4B60();
  swift_release();
  sub_1E46A4B70(0, 0xE000000000000000, v4);
  sub_1E46A4B90();
  uint64_t v13 = sub_1E46A4AE0();
  v12(v3, v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE563A8);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1E46B84D0;
  uint64_t v15 = v22;
  *(void *)(v14 + 32) = v23;
  *(void *)(v14 + 40) = v15;
  uint64_t v16 = v20;
  *(void *)(v14 + 4_Block_object_dispose(&a9, 8) = v21;
  *(void *)(v14 + 56) = v16;
  *(void *)(v14 + 64) = v13;
  uint64_t v17 = sub_1E46A4AD0();
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_1E4695F8C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E4696034(uint64_t a1)
{
  return sub_1E4696944(a1, (uint64_t)&unk_1E46B8578, (void (*)(void))sub_1E4696EC4, (void (*)(uint64_t))sub_1E46677C0);
}

uint64_t sub_1E469607C()
{
  uint64_t v0 = sub_1E46A4B00();
  uint64_t v1 = sub_1E46A4B00();
  uint64_t v2 = sub_1E46A4B00();
  uint64_t v3 = sub_1E46A4B00();
  uint64_t v4 = sub_1E46A4B00();
  uint64_t v5 = sub_1E46A4B00();
  uint64_t v6 = sub_1E46A4B00();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56378);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1E46B84E0;
  *(void *)(v7 + 32) = v0;
  *(void *)(v7 + 40) = v1;
  *(void *)(v7 + 4_Block_object_dispose(&a9, 8) = v2;
  *(void *)(v7 + 56) = v3;
  *(void *)(v7 + 64) = v4;
  *(void *)(v7 + 72) = v5;
  *(void *)(v7 + 80) = v6;
  uint64_t v8 = sub_1E46A4AF0();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_1E46961AC(uint64_t a1)
{
  uint64_t v26 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56380);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v29 = v1;
  uint64_t v30 = v2;
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1E46A4AC0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56388);
  MEMORY[0x1F4188790](v9);
  unint64_t v10 = sub_1E467ABA4();
  sub_1E46A4B80(10, 2, &type metadata for SearchUIOpenKnowledgeIntent, v10);
  sub_1E46A4B70(0x206F74206F47, 0xE600000000000000, v9);
  swift_getKeyPath();
  unint64_t v28 = sub_1E467CC38();
  sub_1E46A4AB0();
  swift_release();
  sub_1E46A4B60();
  swift_release();
  sub_1E46A4B70(544106784, 0xE400000000000000, v9);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E4F184E0], v5);
  sub_1E46A4B50(v8, v9);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_1E46A4B70(0, 0xE000000000000000, v9);
  sub_1E46A4B90();
  uint64_t v25 = sub_1E46A4AE0();
  uint64_t v11 = v29;
  uint64_t v12 = *(void (**)(char *, uint64_t))(v30 + 8);
  v30 += 8;
  uint64_t v27 = v12;
  v12(v4, v29);
  sub_1E46A4B80(19, 1, &type metadata for SearchUIOpenKnowledgeIntent, v10);
  sub_1E46A4B70(0x206E65704FLL, 0xE500000000000000, v9);
  swift_getKeyPath();
  sub_1E46A4AB0();
  swift_release();
  sub_1E46A4B60();
  swift_release();
  sub_1E46A4B70(0x2068637261657320, 0xEE00746C75736572, v9);
  sub_1E46A4B90();
  uint64_t v24 = sub_1E46A4AE0();
  v27(v4, v11);
  sub_1E46A4B80(19, 1, &type metadata for SearchUIOpenKnowledgeIntent, v10);
  sub_1E46A4B70(0xD000000000000013, 0x80000001E46BD290, v9);
  swift_getKeyPath();
  sub_1E46A4AB0();
  swift_release();
  sub_1E46A4B60();
  swift_release();
  sub_1E46A4B70(0, 0xE000000000000000, v9);
  sub_1E46A4B90();
  uint64_t v23 = sub_1E46A4AE0();
  uint64_t v13 = v27;
  v27(v4, v29);
  sub_1E46A4B80(19, 1, &type metadata for SearchUIOpenKnowledgeIntent, v10);
  sub_1E46A4B70(0x657461676976614ELL, 0xEC000000206F7420, v9);
  swift_getKeyPath();
  sub_1E46A4AB0();
  swift_release();
  sub_1E46A4B60();
  swift_release();
  sub_1E46A4B70(0x746C7573657220, 0xE700000000000000, v9);
  sub_1E46A4B90();
  uint64_t v22 = sub_1E46A4AE0();
  uint64_t v14 = v29;
  v13(v4, v29);
  sub_1E46A4B80(31, 1, &type metadata for SearchUIOpenKnowledgeIntent, v10);
  sub_1E46A4B70(0xD000000000000018, 0x80000001E46BD2B0, v9);
  swift_getKeyPath();
  sub_1E46A4AB0();
  swift_release();
  sub_1E46A4B60();
  swift_release();
  sub_1E46A4B70(0x746C7573657220, 0xE700000000000000, v9);
  sub_1E46A4B90();
  uint64_t v15 = sub_1E46A4AE0();
  v13(v4, v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56390);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_1E46B84D0;
  uint64_t v17 = v24;
  *(void *)(v16 + 32) = v25;
  *(void *)(v16 + 40) = v17;
  uint64_t v18 = v22;
  *(void *)(v16 + 4_Block_object_dispose(&a9, 8) = v23;
  *(void *)(v16 + 56) = v18;
  *(void *)(v16 + 64) = v15;
  uint64_t v19 = sub_1E46A4AD0();
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t sub_1E4696870()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E46968FC(uint64_t a1)
{
  return sub_1E4696944(a1, (uint64_t)&unk_1E46B8550, (void (*)(void))sub_1E467CC38, (void (*)(uint64_t))sub_1E467ABA4);
}

uint64_t sub_1E4696944(uint64_t a1, uint64_t a2, void (*a3)(void), void (*a4)(uint64_t))
{
  uint64_t v6 = sub_1E46A4B40();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  a3();
  sub_1E46A4AB0();
  uint64_t v10 = swift_release();
  a4(v10);
  sub_1E46A4B30();
  uint64_t v11 = sub_1E46A4B20();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56370);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1E46B7170;
  *(void *)(v12 + 32) = v11;
  uint64_t v13 = sub_1E46A4B10();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_1E4696ABC()
{
  uint64_t v0 = sub_1E46A4B00();
  uint64_t v1 = sub_1E46A4B00();
  uint64_t v2 = sub_1E46A4B00();
  uint64_t v3 = sub_1E46A4B00();
  uint64_t v4 = sub_1E46A4B00();
  uint64_t v5 = sub_1E46A4B00();
  uint64_t v6 = sub_1E46A4B00();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56378);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1E46B84E0;
  *(void *)(v7 + 32) = v0;
  *(void *)(v7 + 40) = v1;
  *(void *)(v7 + 4_Block_object_dispose(&a9, 8) = v2;
  *(void *)(v7 + 56) = v3;
  *(void *)(v7 + 64) = v4;
  *(void *)(v7 + 72) = v5;
  *(void *)(v7 + 80) = v6;
  uint64_t v8 = sub_1E46A4AF0();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_1E4696C28()
{
  return MEMORY[0x1E4FBC860];
}

ValueMetadata *type metadata accessor for SearchUIAssistantIntents()
{
  return &type metadata for SearchUIAssistantIntents;
}

uint64_t sub_1E4696C44()
{
  uint64_t v0 = sub_1E46A4BC0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1E4667200();
  uint64_t v13 = v4;
  sub_1E46677C0();
  sub_1E46A4BD0();
  uint64_t v5 = sub_1E46A4BB0();
  uint64_t v6 = *(void (**)(char *, uint64_t))(v1 + 8);
  v6(v3, v0);
  uint64_t v12 = sub_1E467A5D4();
  uint64_t v13 = v7;
  sub_1E467ABA4();
  sub_1E46A4BD0();
  uint64_t v8 = sub_1E46A4BB0();
  v6(v3, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56368);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1E46B7BD0;
  *(void *)(v9 + 32) = v5;
  *(void *)(v9 + 40) = v8;
  uint64_t v10 = sub_1E46A4BA0();
  swift_bridgeObjectRelease();
  return v10;
}

__n128 sub_1E4696E1C@<Q0>(__n128 *a1@<X8>)
{
  sub_1E46A4A50();
  __n128 result = v5;
  a1->n128_u64[0] = v3;
  a1->n128_u64[1] = v4;
  a1[1] = v5;
  a1[2].n128_u64[0] = v6;
  return result;
}

double sub_1E4696E6C@<D0>(uint64_t a1@<X8>)
{
  sub_1E46A4A50();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 24) = v5;
  *(void *)(a1 + 40) = v6;
  return result;
}

unint64_t sub_1E4696EC4()
{
  unint64_t result = qword_1EB99BA60;
  if (!qword_1EB99BA60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB99BA60);
  }
  return result;
}

uint64_t sub_1E4696F18(void *a1)
{
  sub_1E46A5DC0();
  id v2 = a1;
  LOBYTE(a1) = sub_1E46A5DA0();

  return a1 & 1;
}

uint64_t sub_1E4697018@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_1E46A5330();
  uint64_t v7 = v6 - 8;
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (double *)((char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99BC68);
  uint64_t v11 = v10 - 8;
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(a2 + 8)) {
    double v14 = 0.0;
  }
  else {
    double v14 = *(double *)a2;
  }
  uint64_t v15 = (char *)v9 + *(int *)(v7 + 28);
  uint64_t v16 = *MEMORY[0x1E4F3D4A0];
  uint64_t v17 = sub_1E46A5510();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 104))(v15, v16, v17);
  *uint64_t v9 = v14;
  v9[1] = v14;
  uint64_t v18 = (uint64_t)&v13[*(int *)(v11 + 44)];
  sub_1E469880C((uint64_t)v9, v18);
  *(_WORD *)(v18 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB99BC58) + 36)) = 256;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99BC28);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v13, a1, v19);
  sub_1E4698870((uint64_t)v9);
  return sub_1E467946C((uint64_t)v13, a3, &qword_1EB99BC68);
}

uint64_t sub_1E46972A4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  long long v5 = __swift_project_boxed_opaque_existential_1(a1, v3);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  uint64_t result = sub_1E46A5980(v7, v3, v4);
  *a2 = result;
  return result;
}

id sub_1E4697428()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUIContentConfigurator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1E469745C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1E4697488(a1, a2, a3, a4, a5, MEMORY[0x1E4FB11C0]);
}

uint64_t sub_1E4697488(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t *))
{
  v11[0] = a2;
  v11[1] = a3;
  void v11[2] = a4;
  uint64_t v8 = sub_1E46A5620();
  v11[3] = v8;
  v11[4] = swift_getWitnessTable();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(boxed_opaque_existential_1, a1, v8);
  return a6(v11);
}

uint64_t sub_1E469753C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1E4697488(a1, a2, a3, a4, a5, MEMORY[0x1E4FB1198]);
}

uint64_t type metadata accessor for SearchUIContentConfigurator()
{
  return self;
}

id sub_1E469758C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v68 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99BC38);
  uint64_t v67 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x1F4188790](v6);
  uint64_t v11 = (char *)&v53 - v10;
  uint64_t v12 = MEMORY[0x1F4188790](v9);
  double v14 = (char *)&v53 - v13;
  uint64_t v15 = MEMORY[0x1F4188790](v12);
  uint64_t v17 = (char *)&v53 - v16;
  MEMORY[0x1F4188790](v15);
  uint64_t v66 = (char *)&v53 - v18;
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99BC28);
  uint64_t v19 = *(void *)(v65 - 8);
  MEMORY[0x1F4188790](v65);
  uint64_t v69 = (char *)&v53 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjectType();
  id result = (id)swift_conformsToProtocol2();
  if (result) {
    uint64_t v22 = (void (**)(char *, uint64_t, void, unint64_t, void, uint64_t))result;
  }
  else {
    uint64_t v22 = 0;
  }
  if (result) {
    uint64_t v23 = a1;
  }
  else {
    uint64_t v23 = 0;
  }
  if (v23)
  {
    uint64_t v60 = v22;
    uint64_t v61 = v8;
    uint64_t v62 = v11;
    uint64_t v63 = v19;
    uint64_t v24 = v23;
    uint64_t v25 = self;
    uint64_t ObjectType = swift_getObjectType();
    id v58 = a1;
    int v59 = v24;
    id result = objc_msgSend(v25, sel_bestAppearanceForView_, v24);
    if (result)
    {
      uint64_t v26 = result;
      objc_msgSend(result, sel_isVibrant);

      id v27 = objc_allocWithZone((Class)sub_1E46A5E40());
      uint64_t v28 = sub_1E46A5E20();
      unint64_t v70 = 0;
      char v71 = 1;
      sub_1E46A5E30();
      swift_unknownObjectRetain();
      sub_1E46A5E10();
      type metadata accessor for SearchUIRFCardSectionRowModel();
      uint64_t v29 = swift_dynamicCastClass();
      unsigned int v55 = v17;
      uint64_t v56 = v14;
      id v64 = (id)v28;
      if (v29)
      {
        uint64_t v30 = (void *)v29;
        id v31 = a2;
LABEL_11:
        sub_1E46A4AB0();
        sub_1E46A5E00();
        sub_1E467020C(v72);
        sub_1E467946C((uint64_t)v72, (uint64_t)v78, &qword_1EB99BC48);
        uint64_t v32 = v68;
        if (v78[0] == 2)
        {
        }
        else
        {
          sub_1E467020C(v73);
          sub_1E467946C((uint64_t)v73, (uint64_t)v77, &qword_1EB99BC48);
          sub_1E467020C(v74);

          sub_1E467946C((uint64_t)v74, (uint64_t)v75, &qword_1EB99BC48);
          unint64_t v43 = 0xBFF0000000000000;
          if (v75[0] != 2) {
            unint64_t v43 = v76;
          }
          unint64_t v70 = v43;
          char v71 = 0;
        }
        goto LABEL_33;
      }
      self;
      uint64_t v33 = swift_dynamicCastObjCClass();
      if (!v33)
      {
LABEL_32:
        uint64_t v32 = v68;
LABEL_33:
        sub_1E46A5DC0();
        uint64_t v44 = v69;
        uint64_t v45 = MEMORY[0x1E4E833D0](v32, v28);
        MEMORY[0x1F4188790](v45);
        *(&v53 - 2) = (uint64_t)v44;
        *(&v53 - 1) = (uint64_t)&v70;
        uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99BC68);
        unint64_t v46 = sub_1E46986B4();
        uint64_t v47 = v56;
        sub_1E46A5610();
        uint64_t v48 = v55;
        sub_1E46A55F0();
        uint64_t v49 = *(void (**)(char *, uint64_t))(v67 + 8);
        v49(v47, v5);
        sub_1E46A5720();
        uint64_t v50 = v61;
        sub_1E46A5600();
        sub_1E46A5740();
        uint64_t v51 = v62;
        sub_1E46A5600();
        v49(v50, v5);
        sub_1E46A5730();
        sub_1E46A5600();
        v49(v51, v5);
        sub_1E46A5750();
        uint64_t v52 = v66;
        sub_1E46A5600();
        v49(v47, v5);
        v49(v48, v5);
        v60[1](v52, v68, MEMORY[0x1E4F3F058], v46, MEMORY[0x1E4F3F050], ObjectType);

        v49(v52, v5);
        return (id)(*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v69, v65);
      }
      uint64_t v34 = (void *)v33;
      id v35 = a2;
      id result = objc_msgSend(v34, sel_cardSectionRowModels);
      if (result)
      {
        uint64_t v36 = result;
        sub_1E4685D64(0, &qword_1EAE563B0);
        unint64_t v37 = sub_1E46A6110();

        if (v37 >> 62) {
          goto LABEL_30;
        }
        uint64_t v38 = *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10);
        while (v38)
        {
          id v54 = v35;
          id v35 = (id)(v37 & 0xC000000000000001);
          uint64_t v28 = 4;
          while (1)
          {
            id v39 = v35 ? (id)MEMORY[0x1E4E83990](v28 - 4, v37) : *(id *)(v37 + 8 * v28);
            char v40 = v39;
            uint64_t v41 = v28 - 3;
            if (__OFADD__(v28 - 4, 1)) {
              break;
            }
            uint64_t v42 = swift_dynamicCastClass();
            if (v42)
            {
              uint64_t v30 = (void *)v42;

              swift_bridgeObjectRelease();
              uint64_t v28 = (uint64_t)v64;
              goto LABEL_11;
            }

            ++v28;
            if (v41 == v38)
            {

              swift_bridgeObjectRelease();
              uint64_t v32 = v68;
              uint64_t v28 = (uint64_t)v64;
              goto LABEL_33;
            }
          }
          __break(1u);
LABEL_30:
          swift_bridgeObjectRetain();
          uint64_t v38 = sub_1E46A6440();
          swift_bridgeObjectRelease();
        }

        swift_bridgeObjectRelease();
        goto LABEL_32;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  return result;
}

void sub_1E4697CB0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v86 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99BC38);
  uint64_t v85 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v5);
  uint64_t v78 = (char *)&v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  uint64_t v79 = (char *)&v72 - v9;
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t v81 = (char *)&v72 - v11;
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  int v80 = (char *)&v72 - v13;
  MEMORY[0x1F4188790](v12);
  uint64_t v84 = (char *)&v72 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99BC28);
  uint64_t v82 = *(void *)(v15 - 8);
  uint64_t v83 = v15;
  MEMORY[0x1F4188790](v15);
  uint64_t v89 = (char *)&v72 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99BC20);
  uint64_t v87 = *(void **)(v17 - 8);
  uint64_t v18 = MEMORY[0x1F4188790](v17);
  uint64_t v20 = (char *)&v72 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18);
  uint64_t v22 = (char *)&v72 - v21;
  swift_getObjectType();
  uint64_t v23 = swift_conformsToProtocol2();
  if (v23) {
    uint64_t v24 = v23;
  }
  else {
    uint64_t v24 = 0;
  }
  if (v23) {
    uint64_t v25 = a1;
  }
  else {
    uint64_t v25 = 0;
  }
  if (v25)
  {
    type metadata accessor for SearchUIArchivedRowModel();
    id v88 = a2;
    uint64_t v26 = swift_dynamicCastClass();
    uint64_t v77 = v5;
    if (v26)
    {
      uint64_t v27 = v26 + OBJC_IVAR___SearchUIArchivedRowModel_swiftUIView;
      swift_beginAccess();
      sub_1E4665800(v27, (uint64_t)&v97);
      if (v98)
      {
        sub_1E466CF1C(&v97, (uint64_t)v99);
        uint64_t ObjectType = swift_getObjectType();
        MEMORY[0x1F4188790](ObjectType);
        *(&v72 - 2) = v99;
        uint64_t v89 = a1;
        id v29 = v88;
        sub_1E46A5610();
        sub_1E46A5710();
        sub_1E46A5600();
        uint64_t v30 = (void (*)(char *, uint64_t))v87[1];
        v30(v20, v17);
        (*(void (**)(char *, void, void, void, void, uint64_t, uint64_t))(v24 + 8))(v22, MEMORY[0x1E4F3EE00], MEMORY[0x1E4F3F058], MEMORY[0x1E4F3EDF8], MEMORY[0x1E4F3F050], ObjectType, v24);

        v30(v22, v17);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v99);
        return;
      }
      id v32 = a1;
      sub_1E46987A4((uint64_t)&v97);
    }
    else
    {
      id v31 = a1;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99BC30);
    uint64_t v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_1E46B7270;
    id v34 = a1;
    id v35 = v88;
    id v36 = objc_msgSend(v88, sel_cardSection);
    if (v36)
    {
      *(void *)(v33 + 32) = v36;
      *(void *)uint64_t v99 = v33;
      sub_1E46A6120();
      unint64_t v37 = *(void **)v99;
      swift_getObjectType();
      uint64_t v38 = swift_conformsToProtocol2();
      if (v38) {
        uint64_t v39 = v38;
      }
      else {
        uint64_t v39 = 0;
      }
      if (v38) {
        char v40 = v25;
      }
      else {
        char v40 = 0;
      }
      if (!v40)
      {
        swift_bridgeObjectRelease();

        return;
      }
      uint64_t v75 = v39;
      uint64_t v41 = self;
      uint64_t v73 = swift_getObjectType();
      id v42 = v25;
      uint64_t v74 = v40;
      id v43 = objc_msgSend(v41, sel_bestAppearanceForView_, v40);
      if (v43)
      {
        uint64_t v44 = v43;
        objc_msgSend(v43, sel_isVibrant);

        id v45 = objc_allocWithZone((Class)sub_1E46A5E40());
        uint64_t v46 = sub_1E46A5E20();
        unint64_t v90 = 0;
        char v91 = 1;
        sub_1E46A5E30();
        swift_unknownObjectRetain();
        sub_1E46A5E10();
        type metadata accessor for SearchUIRFCardSectionRowModel();
        uint64_t v47 = swift_dynamicCastClass();
        id v72 = v34;
        uint64_t v87 = v37;
        id v76 = (id)v46;
        if (v47)
        {
          uint64_t v48 = (void *)v47;
          id v49 = v35;
LABEL_24:
          sub_1E46A4AB0();
          sub_1E46A5E00();
          sub_1E467020C(v92);
          sub_1E467946C((uint64_t)v92, (uint64_t)v99, &qword_1EB99BC48);
          if (v99[0] == 2)
          {
          }
          else
          {
            sub_1E467020C(v93);
            sub_1E467946C((uint64_t)v93, (uint64_t)&v97, &qword_1EB99BC48);
            sub_1E467020C(v94);

            sub_1E467946C((uint64_t)v94, (uint64_t)v95, &qword_1EB99BC48);
            unint64_t v60 = 0xBFF0000000000000;
            if (v95[0] != 2) {
              unint64_t v60 = v96;
            }
            unint64_t v90 = v60;
            char v91 = 0;
          }
          goto LABEL_46;
        }
        self;
        uint64_t v50 = swift_dynamicCastObjCClass();
        if (!v50)
        {
LABEL_46:
          sub_1E46A5DC0();
          uint64_t v61 = v89;
          uint64_t v62 = MEMORY[0x1E4E833D0](v37, v46);
          MEMORY[0x1F4188790](v62);
          *(&v72 - 2) = v61;
          *(&v72 - 1) = &v90;
          id v88 = (id)__swift_instantiateConcreteTypeFromMangledName(&qword_1EB99BC68);
          unint64_t v63 = sub_1E46986B4();
          id v64 = v81;
          sub_1E46A5610();
          uint64_t v65 = v80;
          uint64_t v66 = v77;
          sub_1E46A55F0();
          uint64_t v67 = *(void (**)(char *, uint64_t))(v85 + 8);
          v67(v64, v66);
          sub_1E46A5720();
          uint64_t v68 = v78;
          sub_1E46A5600();
          sub_1E46A5740();
          uint64_t v69 = v79;
          sub_1E46A5600();
          v67(v68, v66);
          sub_1E46A5730();
          sub_1E46A5600();
          v67(v69, v66);
          sub_1E46A5750();
          unint64_t v70 = v84;
          sub_1E46A5600();
          v67(v64, v66);
          v67(v65, v66);
          (*(void (**)(char *, id, void, unint64_t, void, uint64_t))(v75 + 8))(v70, v88, MEMORY[0x1E4F3F058], v63, MEMORY[0x1E4F3F050], v73);
          id v71 = v72;

          v67(v70, v66);
          (*(void (**)(char *, uint64_t))(v82 + 8))(v89, v83);
          swift_bridgeObjectRelease();

          return;
        }
        uint64_t v51 = (void *)v50;
        id v52 = v35;
        id v53 = objc_msgSend(v51, sel_cardSectionRowModels);
        if (v53)
        {
          id v54 = v53;
          sub_1E4685D64(0, &qword_1EAE563B0);
          unint64_t v55 = sub_1E46A6110();

          if (v55 >> 62) {
            goto LABEL_44;
          }
          uint64_t v56 = *(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10);
          while (v56)
          {
            uint64_t v46 = 4;
            while (1)
            {
              uint64_t v57 = (v55 & 0xC000000000000001) != 0
                  ? (void *)MEMORY[0x1E4E83990](v46 - 4, v55)
                  : *(id *)(v55 + 8 * v46);
              unint64_t v37 = v57;
              uint64_t v58 = v46 - 3;
              if (__OFADD__(v46 - 4, 1)) {
                break;
              }
              uint64_t v59 = swift_dynamicCastClass();
              if (v59)
              {
                uint64_t v48 = (void *)v59;

                swift_bridgeObjectRelease();
                unint64_t v37 = v87;
                uint64_t v46 = (uint64_t)v76;
                goto LABEL_24;
              }

              ++v46;
              if (v58 == v56)
              {

                swift_bridgeObjectRelease();
                unint64_t v37 = v87;
                uint64_t v46 = (uint64_t)v76;
                goto LABEL_46;
              }
            }
            __break(1u);
LABEL_44:
            swift_bridgeObjectRetain();
            uint64_t v56 = sub_1E46A6440();
            swift_bridgeObjectRelease();
          }

          swift_bridgeObjectRelease();
          goto LABEL_46;
        }
LABEL_50:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_50;
  }
}

uint64_t sub_1E46986AC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4697018(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_1E46986B4()
{
  unint64_t result = qword_1EB99BC60;
  if (!qword_1EB99BC60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB99BC68);
    swift_getOpaqueTypeConformance2();
    sub_1E4698748();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB99BC60);
  }
  return result;
}

unint64_t sub_1E4698748()
{
  unint64_t result = qword_1EB99BC50;
  if (!qword_1EB99BC50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB99BC58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB99BC50);
  }
  return result;
}

uint64_t sub_1E46987A4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE536B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E4698804@<X0>(uint64_t *a1@<X8>)
{
  return sub_1E46972A4(*(void **)(v1 + 16), a1);
}

uint64_t sub_1E469880C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E46A5330();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E4698870(uint64_t a1)
{
  uint64_t v2 = sub_1E46A5330();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

SearchUIItemProviderUtilities __swiftcall SearchUIItemProviderUtilities.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (SearchUIItemProviderUtilities)objc_msgSend(v0, sel_init);
}

id SearchUIItemProviderUtilities.init()()
{
  v1.super_class = (Class)SearchUIItemProviderUtilities;
  return objc_msgSendSuper2(&v1, sel_init);
}

void sub_1E4698A10(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend(self, sel_generalPasteboard);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99BC30);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1E46B7270;
  *(void *)(v5 + 32) = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 8))(a1, a2);
  sub_1E46A6120();
  sub_1E4685D64(0, &qword_1EAE56420);
  id v6 = (id)sub_1E46A6100();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setItemProviders_, v6);
}

id sub_1E4698B24()
{
  id result = objc_msgSend(*v0, sel_copyableString);
  if (result)
  {
    uint64_t v2 = result;
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28D78]), sel_initWithObject_, result);

    return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1E4698B90()
{
  id v1 = objc_msgSend(v0, sel_fileProviderTypeIdentifiers);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = (void *)sub_1E46A6110();
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4FBC860];
  }
  id v4 = objc_msgSend(v0, sel_dataProviderTypeIdentifiers);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_1E46A6110();
  }
  else
  {
    uint64_t v6 = MEMORY[0x1E4FBC860];
  }
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28D78]), sel_init);
  uint64_t v8 = v3[2];
  if (v8)
  {
    swift_bridgeObjectRetain();
    uint64_t v26 = v3;
    uint64_t v9 = v3 + 5;
    do
    {
      uint64_t v10 = *(v9 - 1);
      uint64_t v11 = *v9;
      swift_bridgeObjectRetain();
      uint64_t v12 = (void *)sub_1E46A6040();
      uint64_t v13 = (void *)swift_allocObject();
      v13[2] = v0;
      v13[3] = v10;
      void v13[4] = v11;
      id v31 = sub_1E469BE9C;
      id v32 = v13;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v28 = 1107296256;
      id v29 = sub_1E4699800;
      uint64_t v30 = &block_descriptor_26;
      uint64_t v14 = _Block_copy(&aBlock);
      id v15 = v0;
      swift_release();
      objc_msgSend(v7, sel_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler_, v12, 1, 0, v14);
      _Block_release(v14);

      v9 += 2;
      --v8;
    }
    while (v8);
    id v3 = v26;
    swift_bridgeObjectRelease();
  }
  uint64_t v16 = sub_1E469B630(v6, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(v16 + 16);
  if (v17)
  {
    uint64_t v18 = (uint64_t *)(v16 + 40);
    do
    {
      uint64_t v19 = *(v18 - 1);
      uint64_t v20 = *v18;
      swift_bridgeObjectRetain();
      uint64_t v21 = (void *)sub_1E46A6040();
      uint64_t v22 = (void *)swift_allocObject();
      v22[2] = v0;
      v22[3] = v19;
      v22[4] = v20;
      id v31 = sub_1E469BF1C;
      id v32 = v22;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v28 = 1107296256;
      id v29 = sub_1E469A000;
      uint64_t v30 = &block_descriptor_32_0;
      uint64_t v23 = _Block_copy(&aBlock);
      id v24 = v0;
      swift_release();
      objc_msgSend(v7, sel_registerDataRepresentationForTypeIdentifier_visibility_loadHandler_, v21, 0, v23);
      _Block_release(v23);

      v18 += 2;
      --v17;
    }
    while (v17);
  }
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_1E4698EB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[18] = a7;
  v8[19] = a8;
  v8[16] = a5;
  v8[17] = a6;
  v8[15] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56228);
  v8[20] = swift_task_alloc();
  uint64_t v9 = sub_1E46A4D90();
  v8[21] = v9;
  v8[22] = *(void *)(v9 - 8);
  v8[23] = swift_task_alloc();
  v8[24] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E4698FBC, 0, 0);
}

uint64_t sub_1E4698FBC()
{
  id v1 = *(void **)(v0 + 120);
  id v2 = objc_msgSend(self, sel_defaultSearchableIndex);
  *(void *)(v0 + 200) = v2;
  id v3 = objc_msgSend(v1, sel_applicationBundleIdentifier);
  *(void *)(v0 + 20_Block_object_dispose(&a9, 8) = v3;
  if (!v3)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v4 = v3;
  id v3 = objc_msgSend(*(id *)(v0 + 120), sel_coreSpotlightIdentifier);
  *(void *)(v0 + 216) = v3;
  if (!v3)
  {
LABEL_7:
    __break(1u);
    return MEMORY[0x1F41881E8](v3);
  }
  id v5 = v3;
  uint64_t v6 = *(void *)(v0 + 184);
  uint64_t v7 = sub_1E46A6040();
  *(void *)(v0 + 224) = v7;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v6;
  *(void *)(v0 + 24) = sub_1E4699160;
  uint64_t v8 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x1E4F143A8];
  *(void *)(v0 + 8_Block_object_dispose(&a9, 8) = 0x40000000;
  *(void *)(v0 + 96) = sub_1E46994F8;
  *(void *)(v0 + 104) = &block_descriptor_48;
  *(void *)(v0 + 112) = v8;
  objc_msgSend(v2, sel_provideFileURLForBundle_itemIdentifier_typeIdentifier_options_completionHandler_, v4, v5, v7, 0, v0 + 80);
  id v3 = (id)(v0 + 16);
  return MEMORY[0x1F41881E8](v3);
}

uint64_t sub_1E4699160()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 232) = v1;
  if (v1) {
    id v2 = sub_1E46993D0;
  }
  else {
    id v2 = sub_1E4699270;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E4699270()
{
  id v2 = (void *)v0[27];
  uint64_t v1 = (void *)v0[28];
  uint64_t v4 = (void *)v0[25];
  id v3 = (void *)v0[26];
  uint64_t v5 = v0[24];
  uint64_t v6 = v0[21];
  uint64_t v7 = v0[22];
  uint64_t v8 = v0[20];
  uint64_t v11 = (void (*)(uint64_t, uint64_t, void))v0[18];
  (*(void (**)(uint64_t, void, uint64_t))(v7 + 32))(v5, v0[23], v6);

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v8, v5, v6);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v8, 0, 1, v6);
  v11(v8, 1, 0);
  sub_1E4666020(v8, &qword_1EAE56228);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_1E46993D0()
{
  id v2 = (void *)v0[28];
  uint64_t v1 = (void *)v0[29];
  uint64_t v4 = (void *)v0[26];
  id v3 = (void *)v0[27];
  uint64_t v5 = (void *)v0[25];
  uint64_t v6 = v0[21];
  uint64_t v7 = v0[22];
  uint64_t v8 = v0[20];
  uint64_t v12 = (void (*)(uint64_t, void, void *))v0[18];
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(v8, 1, 1, v6);
  id v9 = v1;
  v12(v8, 0, v1);

  sub_1E4666020(v8, &qword_1EAE56228);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_1E46994F8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = sub_1E46A4D90();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55910);
    uint64_t v10 = swift_allocError();
    *uint64_t v11 = a3;
    id v12 = a3;
    return MEMORY[0x1F4188208](v9, v10);
  }
  else
  {
    sub_1E46A4D80();
    (*(void (**)(void, char *, uint64_t))(v6 + 32))(*(void *)(*(void *)(v9 + 64) + 40), v8, v5);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_1E4699654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E46A61C0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1E46A61B0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1E4666020(a1, (uint64_t *)&unk_1EB99B980);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1E46A6160();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

id sub_1E4699800(uint64_t a1, void *a2)
{
  return sub_1E469A024(a1, a2, (uint64_t)&unk_1F4027650, (uint64_t)sub_1E469C0B8);
}

void sub_1E4699824(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56228);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E46794DC(a1, (uint64_t)v10, &qword_1EAE56228);
  uint64_t v11 = sub_1E46A4D90();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) != 1)
  {
    uint64_t v13 = (void *)sub_1E46A4D70();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
  }
  if (a3) {
    uint64_t v14 = (void *)sub_1E46A4D10();
  }
  else {
    uint64_t v14 = 0;
  }
  (*(void (**)(uint64_t, void *, void, void *))(a4 + 16))(a4, v13, a2 & 1, v14);
}

uint64_t sub_1E4699988(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB99B980);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E46A61A0();
  uint64_t v16 = sub_1E46A61C0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 0, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = a3;
  v17[5] = a4;
  v17[6] = a5;
  v17[7] = a1;
  v17[8] = a2;
  id v18 = a3;
  swift_bridgeObjectRetain();
  sub_1E46A4AB0();
  sub_1E4699654((uint64_t)v15, a7, (uint64_t)v17);
  swift_release();
  return 0;
}

uint64_t sub_1E4699ABC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[20] = a7;
  v8[21] = a8;
  v8[18] = a5;
  v8[19] = a6;
  v8[17] = a4;
  return MEMORY[0x1F4188298](sub_1E4699AE4, 0, 0);
}

uint64_t sub_1E4699AE4()
{
  uint64_t v1 = *(void **)(v0 + 136);
  id v2 = objc_msgSend(self, sel_defaultSearchableIndex);
  *(void *)(v0 + 176) = v2;
  id v3 = objc_msgSend(v1, sel_applicationBundleIdentifier);
  *(void *)(v0 + 184) = v3;
  if (!v3)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v4 = v3;
  id v3 = objc_msgSend(*(id *)(v0 + 136), sel_coreSpotlightIdentifier);
  *(void *)(v0 + 192) = v3;
  if (!v3)
  {
LABEL_7:
    __break(1u);
    return MEMORY[0x1F41881E8](v3);
  }
  id v5 = v3;
  uint64_t v6 = sub_1E46A6040();
  *(void *)(v0 + 200) = v6;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 120;
  *(void *)(v0 + 24) = sub_1E4699C88;
  uint64_t v7 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x1E4F143A8];
  *(void *)(v0 + 8_Block_object_dispose(&a9, 8) = 0x40000000;
  *(void *)(v0 + 96) = sub_1E4699F2C;
  *(void *)(v0 + 104) = &block_descriptor_40;
  *(void *)(v0 + 112) = v7;
  objc_msgSend(v2, sel_provideDataForBundle_itemIdentifier_typeIdentifier_options_completionHandler_, v4, v5, v6, 0, v0 + 80);
  id v3 = (id)(v0 + 16);
  return MEMORY[0x1F41881E8](v3);
}

uint64_t sub_1E4699C88()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 20_Block_object_dispose(&a9, 8) = v1;
  if (v1) {
    id v2 = sub_1E4699E60;
  }
  else {
    id v2 = sub_1E4699D98;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E4699D98()
{
  id v2 = *(void **)(v0 + 192);
  uint64_t v1 = *(void **)(v0 + 200);
  id v3 = *(void **)(v0 + 184);
  uint64_t v4 = *(void (**)(uint64_t, unint64_t, void))(v0 + 160);
  uint64_t v5 = *(void *)(v0 + 120);
  unint64_t v6 = *(void *)(v0 + 128);

  sub_1E469C060(v5, v6);
  v4(v5, v6, 0);
  sub_1E4665FC8(v5, v6);
  sub_1E4665FC8(v5, v6);
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_1E4699E60()
{
  id v2 = (void *)v0[25];
  uint64_t v1 = (void *)v0[26];
  uint64_t v4 = (void *)v0[23];
  id v3 = (void *)v0[24];
  uint64_t v5 = (void *)v0[22];
  unint64_t v6 = (void (*)(void, unint64_t, void *))v0[20];
  swift_willThrow();

  id v7 = v1;
  v6(0, 0xF000000000000000, v1);

  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_1E4699F2C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55910);
    uint64_t v5 = swift_allocError();
    *unint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x1F4188208](v3, v5);
  }
  else
  {
    id v8 = a2;
    uint64_t v9 = sub_1E46A4DB0();
    uint64_t v11 = v10;

    uint64_t v12 = *(uint64_t **)(*(void *)(v3 + 64) + 40);
    *uint64_t v12 = v9;
    v12[1] = v11;
    return swift_continuation_throwingResume();
  }
}

id sub_1E469A000(uint64_t a1, void *a2)
{
  return sub_1E469A024(a1, a2, (uint64_t)&unk_1F4027600, (uint64_t)sub_1E469BF90);
}

id sub_1E469A024(uint64_t a1, void *aBlock, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  unint64_t v6 = _Block_copy(aBlock);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  sub_1E46A4AB0();
  id v8 = (void *)v5(a4, v7);
  swift_release();
  swift_release();
  return v8;
}

void sub_1E469A0C4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 >> 60 == 15)
  {
    unint64_t v6 = 0;
    if (a3)
    {
LABEL_3:
      uint64_t v7 = sub_1E46A4D10();
      goto LABEL_6;
    }
  }
  else
  {
    unint64_t v6 = (void *)sub_1E46A4DA0();
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  id v8 = (id)v7;
  (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v6);
}

id sub_1E469A15C()
{
  return sub_1E4698B90();
}

void sub_1E469A180()
{
  uint64_t v1 = self;
  id v2 = objc_msgSend(v1, sel_sharedCache);
  if (!v2)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v3 = v2;
  id v4 = objc_msgSend(v0, sel_person);
  if (!v4)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v4, sel_contactIdentifier);

  id v7 = objc_msgSend(v3, sel_contactForIdentifier_, v6);
  if (!v7)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  id v8 = objc_msgSend(v1, sel_sharedCache);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = self;
    id v11 = objc_msgSend(v9, sel_contactStore);

    objc_msgSend(v10, sel_itemProviderForContact_withContactStore_, v7, v11);
    return;
  }
LABEL_9:
  __break(1u);
}

void sub_1E469A2CC()
{
}

uint64_t sub_1E469A2F0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB99B980);
  MEMORY[0x1F4188790](v6 - 8);
  id v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E46A61A0();
  uint64_t v9 = sub_1E46A61C0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  uint64_t v10 = (void *)swift_allocObject();
  _OWORD v10[2] = 0;
  void v10[3] = 0;
  v10[4] = a3;
  v10[5] = a1;
  v10[6] = a2;
  id v11 = a3;
  sub_1E46A4AB0();
  sub_1E4699654((uint64_t)v8, (uint64_t)&unk_1EAE56418, (uint64_t)v10);
  swift_release();
  return 0;
}

uint64_t sub_1E469A414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[2] = a5;
  v6[3] = a6;
  id v8 = (void *)swift_task_alloc();
  v6[4] = v8;
  *id v8 = v6;
  v8[1] = sub_1E469A4C4;
  v8[3] = a4;
  return MEMORY[0x1F4188298](sub_1E469A6A8, 0, 0);
}

uint64_t sub_1E469A4C4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 40) = a1;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1E469A5C4, 0, 0);
}

uint64_t sub_1E469A5C4()
{
  uint64_t v1 = UIImageJPEGRepresentation(*(UIImage **)(v0 + 40), 1.0);
  if (v1)
  {
    id v2 = v1;
    uint64_t v3 = sub_1E46A4DB0();
    unint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    unint64_t v5 = 0xF000000000000000;
  }
  uint64_t v6 = *(void **)(v0 + 40);
  (*(void (**)(uint64_t, unint64_t, void))(v0 + 16))(v3, v5, 0);
  sub_1E469BE84(v3, v5);

  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_1E469A688()
{
  *(void *)(v1 + 24) = v0;
  return MEMORY[0x1F4188298](sub_1E469A6A8, 0, 0);
}

uint64_t sub_1E469A6A8()
{
  uint64_t v1 = (uint64_t (*)())objc_msgSend(*(id *)(v0 + 24), sel_image);
  if (v1)
  {
    unint64_t v4 = v1;
    *(void *)(v0 + 32) = objc_msgSend(objc_allocWithZone((Class)SearchUIImage), sel_initWithSFImage_, v1);

    *(void *)(v0 + 40) = self;
    *(void *)(v0 + 4_Block_object_dispose(&a9, 8) = sub_1E46A6190();
    *(void *)(v0 + 56) = sub_1E46A6180();
    uint64_t v5 = sub_1E46A6160();
    uint64_t v7 = v6;
    uint64_t v1 = sub_1E469A798;
    uint64_t v2 = v5;
    uint64_t v3 = v7;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x1F4188298](v1, v2, v3);
}

uint64_t sub_1E469A798()
{
  uint64_t v1 = *(void **)(v0 + 40);
  swift_release();
  *(void *)(v0 + 64) = objc_msgSend(v1, sel_mainScreen);
  return MEMORY[0x1F4188298](sub_1E469A820, 0, 0);
}

uint64_t sub_1E469A820()
{
  *(void *)(v0 + 72) = sub_1E46A6180();
  uint64_t v2 = sub_1E46A6160();
  return MEMORY[0x1F4188298](sub_1E469A8AC, v2, v1);
}

uint64_t sub_1E469A8AC()
{
  uint64_t v1 = *(void **)(v0 + 64);
  swift_release();
  objc_msgSend(v1, sel_scale);
  *(void *)(v0 + 80) = v2;

  return MEMORY[0x1F4188298](sub_1E469A92C, 0, 0);
}

uint64_t sub_1E469A92C()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[4];
  uint64_t v3 = swift_task_alloc();
  v0[11] = v3;
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[12] = v4;
  uint64_t v5 = sub_1E4685D64(0, &qword_1EAE56400);
  *uint64_t v4 = v0;
  v4[1] = sub_1E469AA48;
  return MEMORY[0x1F41880D8](v0 + 2, 0, 0, 0x616D496863746566, 0xEC00000029286567, sub_1E469BBF8, v3, v5);
}

uint64_t sub_1E469AA48()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1E469AB60, 0, 0);
}

uint64_t sub_1E469AB60()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

void sub_1E469ABC4(uint64_t a1, void *a2, double a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56408);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x1F4188790](v6);
  if (a2)
  {
    id v9 = objc_msgSend(self, sel_bestAppearanceForSystem);
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = objc_msgSend(v9, sel_isDark);

      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
      unint64_t v12 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      uint64_t v13 = swift_allocObject();
      (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v13 + v12, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
      aBlock[4] = sub_1E469BC98;
      aBlock[5] = v13;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1E469AE18;
      aBlock[3] = &block_descriptor_1;
      uint64_t v14 = _Block_copy(aBlock);
      swift_release();
      objc_msgSend(a2, sel_loadImageWithScale_isDarkStyle_completionHandler_, v11, v14, a3);
      _Block_release(v14);
    }
    else
    {
      __break(1u);
    }
  }
}

void *sub_1E469ADC4(void *result, char a2)
{
  if (a2)
  {
    if (result)
    {
      id v2 = result;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56408);
      return (void *)sub_1E46A6170();
    }
  }
  return result;
}

void sub_1E469AE18(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(void *, uint64_t))(a1 + 32);
  sub_1E46A4AB0();
  id v6 = a2;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_1E469AE90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a5;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_1E469AF40;
  v7[3] = a4;
  return MEMORY[0x1F4188298](sub_1E469A6A8, 0, 0);
}

uint64_t sub_1E469AF40(uint64_t a1)
{
  *(void *)(*(void *)v1 + 32) = a1;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1E469B040, 0, 0);
}

uint64_t sub_1E469B040()
{
  uint64_t v1 = v0[4];
  id v2 = objc_msgSend(self, sel_generalPasteboard);
  objc_msgSend(v2, sel_setImage_, v1);

  v0[5] = self;
  sub_1E46A6190();
  v0[6] = sub_1E46A6180();
  uint64_t v4 = sub_1E46A6160();
  return MEMORY[0x1F4188298](sub_1E469B120, v4, v3);
}

uint64_t sub_1E469B120()
{
  uint64_t v1 = *(void **)(v0 + 40);
  swift_release();
  *(void *)(v0 + 56) = objc_msgSend(v1, sel_sharedApplication);
  return MEMORY[0x1F4188298](sub_1E469B1A4, 0, 0);
}

uint64_t sub_1E469B1A4()
{
  uint64_t v1 = (void *)v0[7];
  id v2 = (void *)v0[4];
  objc_msgSend(v1, sel_endBackgroundTask_, v0[2]);

  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

id sub_1E469B220()
{
  uint64_t v1 = sub_1E46A5150();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28D78]), sel_init);
  sub_1E46A5140();
  *(void *)(swift_allocObject() + 16) = v5;
  id v7 = v5;
  sub_1E46A6280();
  swift_release();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v6;
}

uint64_t sub_1E469B358()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB99B980);
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  id v5 = objc_msgSend(self, sel_sharedApplication);
  id v6 = objc_msgSend(v5, sel_beginBackgroundTaskWithExpirationHandler_, 0);

  uint64_t v7 = sub_1E46A61C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v3, 1, 1, v7);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v4;
  v8[5] = v6;
  id v9 = v4;
  sub_1E4699654((uint64_t)v3, (uint64_t)&unk_1EAE563E0, (uint64_t)v8);
  return swift_release();
}

uint64_t type metadata accessor for SearchUIItemProviderUtilities(uint64_t a1)
{
  return sub_1E4685D64(a1, &qword_1EAE563B8);
}

uint64_t sub_1E469B4A4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1E469B4C4(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1E469B4C4(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE535B0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1E46A6470();
  __break(1u);
  return result;
}

uint64_t sub_1E469B630(uint64_t result, void *a2)
{
  unint64_t v2 = *(void *)(result + 16);
  if (!v2) {
    return MEMORY[0x1E4FBC860];
  }
  unint64_t v4 = 0;
  uint64_t v22 = result + 32;
  uint64_t v20 = a2 + 7;
  uint64_t v21 = MEMORY[0x1E4FBC860];
  do
  {
    if (v4 <= v2) {
      unint64_t v5 = v2;
    }
    else {
      unint64_t v5 = v4;
    }
    unint64_t v23 = v5;
    while (1)
    {
      if (v4 == v23) {
        goto LABEL_33;
      }
      unint64_t v6 = (uint64_t *)(v22 + 16 * v4);
      uint64_t v7 = *v6;
      uint64_t v8 = v6[1];
      ++v4;
      uint64_t v9 = a2[2];
      if (!v9) {
        goto LABEL_24;
      }
      uint64_t result = a2[4];
      if (result != v7 || a2[5] != v8)
      {
        uint64_t result = sub_1E46A64D0();
        if ((result & 1) == 0) {
          break;
        }
      }
LABEL_7:
      if (v4 == v2) {
        return v21;
      }
    }
    if (v9 != 1)
    {
      int64_t v11 = v20;
      uint64_t v12 = 1;
      while (1)
      {
        uint64_t v13 = v12 + 1;
        if (__OFADD__(v12, 1)) {
          break;
        }
        uint64_t result = *(v11 - 1);
        if (result == v7 && *v11 == v8) {
          goto LABEL_7;
        }
        uint64_t result = sub_1E46A64D0();
        if (result) {
          goto LABEL_7;
        }
        v11 += 2;
        ++v12;
        if (v13 == v9) {
          goto LABEL_24;
        }
      }
      __break(1u);
LABEL_33:
      __break(1u);
      return result;
    }
LABEL_24:
    swift_bridgeObjectRetain();
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v15 = v21;
    if ((result & 1) == 0)
    {
      uint64_t result = sub_1E469B4A4(0, *(void *)(v21 + 16) + 1, 1);
      uint64_t v15 = v21;
    }
    uint64_t v16 = v15;
    unint64_t v18 = *(void *)(v15 + 16);
    unint64_t v17 = *(void *)(v15 + 24);
    if (v18 >= v17 >> 1)
    {
      uint64_t result = sub_1E469B4A4(v17 > 1, v18 + 1, 1);
      uint64_t v16 = v21;
    }
    *(void *)(v16 + 16) = v18 + 1;
    uint64_t v21 = v16;
    uint64_t v19 = v16 + 16 * v18;
    *(void *)(v19 + 32) = v7;
    *(void *)(v19 + 40) = v8;
  }
  while (v4 != v2);
  return v21;
}

uint64_t sub_1E469B7F8(void *a1)
{
  if (!a1
    || (v6[0] = a1,
        sub_1E4685D64(0, &qword_1EAE563C8),
        id v2 = a1,
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE563D0),
        (swift_dynamicCast() & 1) == 0))
  {
    uint64_t v10 = 0;
    memset(v9, 0, sizeof(v9));
  }
  sub_1E46794DC((uint64_t)v9, (uint64_t)v6, &qword_1EAE563C0);
  uint64_t v3 = v7;
  if (v7)
  {
    uint64_t v4 = v8;
    __swift_project_boxed_opaque_existential_1(v6, v7);
    uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  }
  else
  {
    sub_1E4666020((uint64_t)v6, &qword_1EAE563C0);
  }
  sub_1E4666020((uint64_t)v9, &qword_1EAE563C0);
  return v3;
}

uint64_t sub_1E469B904(void *a1)
{
  if (!a1
    || (v6[0] = a1,
        sub_1E4685D64(0, &qword_1EAE563C8),
        id v2 = a1,
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE563D0),
        (swift_dynamicCast() & 1) == 0))
  {
    uint64_t v10 = 0;
    memset(v9, 0, sizeof(v9));
  }
  sub_1E46794DC((uint64_t)v9, (uint64_t)v6, &qword_1EAE563C0);
  uint64_t v3 = v7;
  if (v7)
  {
    uint64_t v4 = v8;
    __swift_project_boxed_opaque_existential_1(v6, v7);
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v3, v4);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  }
  else
  {
    sub_1E4666020((uint64_t)v6, &qword_1EAE563C0);
  }
  return sub_1E4666020((uint64_t)v9, &qword_1EAE563C0);
}

uint64_t sub_1E469BA08()
{
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1E469BA48(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_1E4662D6C;
  return sub_1E469AE90(a1, v4, v5, v7, v6);
}

uint64_t sub_1E469BB08()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1E469BB40(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1E4662D6C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EAE563E8 + dword_1EAE563E8);
  return v6(a1, v4);
}

void sub_1E469BBF8(uint64_t a1)
{
  sub_1E469ABC4(a1, *(void **)(v1 + 16), *(double *)(v1 + 24));
}

uint64_t sub_1E469BC04()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56408);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

void *sub_1E469BC98(void *a1, char a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE56408);
  return sub_1E469ADC4(a1, a2);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return sub_1E46A4AB0();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_1E469BD34()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E469BD6C(uint64_t a1, uint64_t a2)
{
  return sub_1E469A2F0(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_1E469BD74()
{
  swift_unknownObjectRelease();

  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1E469BDBC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_1E466CF7C;
  return sub_1E469A414(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_1E469BE84(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1E4665FC8(a1, a2);
  }
  return a1;
}

uint64_t sub_1E469BE9C(uint64_t a1, uint64_t a2)
{
  return sub_1E4699988(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), (uint64_t)&unk_1F4027678, (uint64_t)&unk_1EAE56440);
}

uint64_t objectdestroy_22Tm()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1E469BF1C(uint64_t a1, uint64_t a2)
{
  return sub_1E4699988(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), (uint64_t)&unk_1F4027628, (uint64_t)&unk_1EAE56430);
}

uint64_t sub_1E469BF58()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1E469BF90(uint64_t a1, unint64_t a2, uint64_t a3)
{
  sub_1E469A0C4(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_1E469BF9C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 64);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v0 + 48);
  *(void *)(v1 + 16) = v5;
  *(void *)uint64_t v5 = v1;
  *(void *)(v5 + _Block_object_dispose(&a9, 8) = sub_1E466CF7C;
  *(void *)(v5 + 16_Block_object_dispose(&a9, 8) = v4;
  *(_OWORD *)(v5 + 152) = v6;
  *(void *)(v5 + 136) = v2;
  *(void *)(v5 + 144) = v3;
  return MEMORY[0x1F4188298](sub_1E4699AE4, 0, 0);
}

uint64_t sub_1E469C060(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    sub_1E46A4AB0();
  }
  return sub_1E46A4AB0();
}

void sub_1E469C0B8(uint64_t a1, char a2, uint64_t a3)
{
  sub_1E4699824(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t objectdestroy_37Tm()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_1E469C114(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_1E466CF7C;
  return sub_1E4698EB4(a1, v4, v5, v6, v7, v8, v9, v10);
}

void *initializeBufferWithCopyOfBuffer for SearchUIPrivacyView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SearchUIPrivacyView()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for SearchUIPrivacyView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for SearchUIPrivacyView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchUIPrivacyView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SearchUIPrivacyView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + _Block_object_dispose(&a9, 8) = 0;
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
      *(void *)(result + _Block_object_dispose(&a9, 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SearchUIPrivacyView()
{
  return &type metadata for SearchUIPrivacyView;
}

void sub_1E469C34C()
{
  id v0 = objc_allocWithZone((Class)SearchUIPrivacyDetailsViewController);
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)sub_1E46A6040();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithBundleIdentifier_, v1);

  if (!v2) {
    __break(1u);
  }
}

uint64_t sub_1E469C3D8()
{
  return sub_1E46A5690();
}

uint64_t sub_1E469C414()
{
  return MEMORY[0x1E4F3F158];
}

uint64_t sub_1E469C420(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1E469C510();
  return off_1F40FAB70(a1, a2, a3, v6);
}

uint64_t sub_1E469C484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1E469C510();
  return off_1F40FAB28(a1, a2, a3, v6);
}

void sub_1E469C4E8()
{
}

unint64_t sub_1E469C510()
{
  unint64_t result = qword_1EAE56448;
  if (!qword_1EAE56448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE56448);
  }
  return result;
}

unint64_t sub_1E469C56C()
{
  unint64_t result = qword_1EAE56450;
  if (!qword_1EAE56450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE56450);
  }
  return result;
}

unint64_t sub_1E469C5C4()
{
  unint64_t result = qword_1EAE56458[0];
  if (!qword_1EAE56458[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EAE56458);
  }
  return result;
}

uint64_t sub_1E469C61C()
{
  *(void *)(v1 + 96) = v0;
  sub_1E46A6190();
  *(void *)(v1 + 104) = sub_1E46A6180();
  uint64_t v3 = sub_1E46A6160();
  return MEMORY[0x1F4188298](sub_1E469C6B4, v3, v2);
}

uint64_t sub_1E469C6B4()
{
  uint64_t v1 = v0[12];
  swift_release();
  uint64_t v2 = v1 + OBJC_IVAR____TtC8SearchUI23SearchUIAppIntentRunner_delegate;
  if (MEMORY[0x1E4E84B80](v2))
  {
    uint64_t v3 = *(void *)(v2 + 8);
    uint64_t ObjectType = swift_getObjectType();
    unint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(ObjectType, v3);
    swift_unknownObjectRelease();
    if (!(v5 >> 62)) {
      goto LABEL_3;
    }
LABEL_18:
    swift_bridgeObjectRetain();
    uint64_t result = sub_1E46A6440();
    uint64_t v6 = result;
    if (result) {
      goto LABEL_4;
    }
LABEL_19:
    uint64_t v25 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_20;
  }
  unint64_t v5 = MEMORY[0x1E4FBC860];
  if (MEMORY[0x1E4FBC860] >> 62) {
    goto LABEL_18;
  }
LABEL_3:
  uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v6) {
    goto LABEL_19;
  }
LABEL_4:
  if (v6 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v8 = 0;
  id v24 = v0 + 7;
  unint64_t v23 = v5 & 0xC000000000000001;
  uint64_t v25 = (void *)MEMORY[0x1E4FBC860];
  uint64_t v21 = v6;
  unint64_t v22 = v5;
  do
  {
    unint64_t v9 = v5;
    if (v23) {
      id v10 = (id)MEMORY[0x1E4E83990](v8, v5);
    }
    else {
      id v10 = *(id *)(v5 + 8 * v8 + 32);
    }
    sub_1E467D5D4(v10, v24);
    uint64_t v12 = v0[7];
    uint64_t v11 = v0[8];
    uint64_t v13 = v0[9];
    uint64_t v14 = v0[10];
    uint64_t v15 = v0[11];
    sub_1E467946C((uint64_t)v24, (uint64_t)(v0 + 2), &qword_1EAE55E38);
    if (v0[3])
    {
      uint64_t v16 = v25;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v16 = sub_1E469E114(0, v25[2] + 1, 1, v25);
      }
      unint64_t v18 = v16[2];
      unint64_t v17 = v16[3];
      if (v18 >= v17 >> 1) {
        uint64_t v16 = sub_1E469E114((void *)(v17 > 1), v18 + 1, 1, v16);
      }
      v16[2] = v18 + 1;
      uint64_t v25 = v16;
      uint64_t v19 = &v16[5 * v18];
      v19[4] = v12;
      v19[5] = v11;
      v19[6] = v13;
      v19[7] = v14;
      v19[8] = v15;
      uint64_t v6 = v21;
      unint64_t v5 = v22;
    }
    else
    {
      unint64_t v5 = v9;
    }
    ++v8;
  }
  while (v6 != v8);
LABEL_20:
  swift_bridgeObjectRelease_n();
  uint64_t v20 = (uint64_t (*)(void *))v0[1];
  return v20(v25);
}

uint64_t sub_1E469C920()
{
  *(void *)(v1 + 112) = v0;
  sub_1E46A6190();
  *(void *)(v1 + 120) = sub_1E46A6180();
  uint64_t v3 = sub_1E46A6160();
  return MEMORY[0x1F4188298](sub_1E469C9B8, v3, v2);
}

uint64_t sub_1E469C9B8()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_release();
  uint64_t v2 = v1 + OBJC_IVAR____TtC8SearchUI23SearchUIAppIntentRunner_delegate;
  if (MEMORY[0x1E4E84B80](v2))
  {
    uint64_t v3 = *(void *)(v2 + 8);
    uint64_t ObjectType = swift_getObjectType();
    unint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(ObjectType, v3);
    swift_unknownObjectRelease();
    if (!(v5 >> 62)) {
      goto LABEL_3;
    }
LABEL_17:
    swift_bridgeObjectRetain();
    uint64_t result = sub_1E46A6440();
    uint64_t v6 = result;
    if (result) {
      goto LABEL_4;
    }
LABEL_18:
    unint64_t v9 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  unint64_t v5 = MEMORY[0x1E4FBC860];
  if (MEMORY[0x1E4FBC860] >> 62) {
    goto LABEL_17;
  }
LABEL_3:
  uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v6) {
    goto LABEL_18;
  }
LABEL_4:
  if (v6 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v8 = 0;
  unint64_t v21 = v5 & 0xC000000000000001;
  unint64_t v9 = (void *)MEMORY[0x1E4FBC860];
  uint64_t v19 = v6;
  unint64_t v20 = v5;
  do
  {
    if (v21) {
      id v11 = (id)MEMORY[0x1E4E83990](v8, v5);
    }
    else {
      id v11 = *(id *)(v5 + 8 * v8 + 32);
    }
    sub_1E469E458(v11, (uint64_t *)(v0 + 64));
    uint64_t v13 = *(void *)(v0 + 64);
    uint64_t v12 = *(void *)(v0 + 72);
    uint64_t v14 = *(void *)(v0 + 80);
    long long v22 = *(_OWORD *)(v0 + 88);
    uint64_t v15 = *(void *)(v0 + 104);
    sub_1E467946C(v0 + 64, v0 + 16, &qword_1EAE564B8);
    if (*(void *)(v0 + 24))
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v9 = sub_1E469E238(0, v9[2] + 1, 1, v9);
      }
      unint64_t v17 = v9[2];
      unint64_t v16 = v9[3];
      if (v17 >= v16 >> 1) {
        unint64_t v9 = sub_1E469E238((void *)(v16 > 1), v17 + 1, 1, v9);
      }
      _OWORD v9[2] = v17 + 1;
      id v10 = &v9[6 * v17];
      v10[4] = v13;
      v10[5] = v12;
      v10[6] = v14;
      *(_OWORD *)(v10 + 7) = v22;
      v10[9] = v15;
      uint64_t v6 = v19;
      unint64_t v5 = v20;
    }
    ++v8;
  }
  while (v6 != v8);
LABEL_19:
  swift_bridgeObjectRelease_n();
  unint64_t v18 = *(uint64_t (**)(void *))(v0 + 8);
  return v18(v9);
}

uint64_t sub_1E469CC0C()
{
  sub_1E46A4980();
  sub_1E46A4970();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55980);
  type metadata accessor for SearchUIAppIntentRunner();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99B9C8);
  sub_1E46A6060();
  sub_1E46A62F0();
  uint64_t result = sub_1E46A4950();
  qword_1EAE58068 = result;
  return result;
}

uint64_t sub_1E469CCAC()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55970);
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_1E46A4D30();
  uint64_t v3 = *(void *)(v12[0] - 8);
  MEMORY[0x1F4188790](v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1E46A4E40();
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v7 = sub_1E46A6030();
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v8 = sub_1E46A4D50();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = sub_1E46A4CF0();
  __swift_allocate_value_buffer(v10, qword_1EAE58070);
  __swift_project_value_buffer(v10, (uint64_t)qword_1EAE58070);
  sub_1E46A5FD0();
  sub_1E46A4E30();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, *MEMORY[0x1E4F275D0], v12[0]);
  sub_1E46A4D60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_1E46A4CE0();
}

uint64_t sub_1E469CF94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v19 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55E20);
  MEMORY[0x1F4188790](v1 - 8);
  unint64_t v18 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55970);
  MEMORY[0x1F4188790](v3 - 8);
  unint64_t v17 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1E46A4D30();
  uint64_t v5 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1E46A4E40();
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v9 = sub_1E46A6030();
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v10 = sub_1E46A6010();
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v15 = sub_1E46A4D50();
  uint64_t v11 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  sub_1E46A6000();
  sub_1E46A5FF0();
  sub_1E46A4A20();
  sub_1E46A5FE0();
  swift_bridgeObjectRelease();
  sub_1E46A5FF0();
  sub_1E46A4A20();
  sub_1E46A5FE0();
  swift_bridgeObjectRelease();
  sub_1E46A5FF0();
  sub_1E46A6020();
  sub_1E46A4E30();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4F275D0], v16);
  sub_1E46A4D60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v17, 1, 1, v15);
  swift_bridgeObjectRetain();
  uint64_t v12 = v18;
  sub_1E46A4C20();
  uint64_t v13 = sub_1E46A4C30();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 0, 1, v13);
  return sub_1E46A4C40();
}

uint64_t sub_1E469D3D4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return MEMORY[0x1F4188298](sub_1E469D3F4, 0, 0);
}

uint64_t sub_1E469D3F4()
{
  sub_1E46A4940();
  v0[5] = v0[2];
  sub_1E46A6190();
  v0[6] = sub_1E46A6180();
  uint64_t v2 = sub_1E46A6160();
  return MEMORY[0x1F4188298](sub_1E469D49C, v2, v1);
}

uint64_t sub_1E469D49C()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_release();
  uint64_t v2 = v1 + OBJC_IVAR____TtC8SearchUI23SearchUIAppIntentRunner_delegate;
  if (MEMORY[0x1E4E84B80](v2))
  {
    uint64_t v3 = *(void *)(v2 + 8);
    uint64_t ObjectType = swift_getObjectType();
    unint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(ObjectType, v3);
    swift_unknownObjectRelease();
  }
  else
  {
    unint64_t v5 = MEMORY[0x1E4FBC860];
  }
  uint64_t v6 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1E469EA74(v6, v5);
  swift_bridgeObjectRelease_n();
  if (v7[2])
  {

    uint64_t v8 = *(uint64_t (**)(void *))(v0 + 8);
    return v8(v7);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_1E4662AD8();
    *(void *)(v0 + 56) = swift_allocError();
    *uint64_t v10 = 2;
    swift_willThrow();
    return MEMORY[0x1F4188298](sub_1E467C6EC, 0, 0);
  }
}

uint64_t sub_1E469D618(uint64_t a1)
{
  uint64_t v4 = *v1;
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_1E467C8AC;
  v5[3] = a1;
  v5[4] = v4;
  return MEMORY[0x1F4188298](sub_1E469D3F4, 0, 0);
}

uint64_t sub_1E469D6C8(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v3;
  return MEMORY[0x1F4188298](sub_1E469D6EC, 0, 0);
}

uint64_t sub_1E469D6EC()
{
  sub_1E46A4940();
  v0[5] = v0[2];
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_1EAE564B0 + dword_1EAE564B0);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[6] = v1;
  void *v1 = v0;
  v1[1] = sub_1E467CA84;
  return v3();
}

unint64_t sub_1E469D7A4()
{
  unint64_t result = qword_1EAE56470;
  if (!qword_1EAE56470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE56470);
  }
  return result;
}

unint64_t sub_1E469D800()
{
  unint64_t result = qword_1EAE56478;
  if (!qword_1EAE56478)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EAE56480);
    sub_1E4696EC4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE56478);
  }
  return result;
}

uint64_t destroy for SearchUIContinuationEntity()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

void *initializeWithCopy for SearchUIContinuationEntity(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1E46A4AB0();
  sub_1E46A4AB0();
  return a1;
}

void *assignWithCopy for SearchUIContinuationEntity(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  sub_1E46A4AB0();
  swift_release();
  a1[5] = a2[5];
  sub_1E46A4AB0();
  swift_release();
  return a1;
}

uint64_t assignWithTake for SearchUIContinuationEntity(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchUIContinuationEntity(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SearchUIContinuationEntity(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + _Block_object_dispose(&a9, 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 4_Block_object_dispose(&a9, 8) = 1;
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
      *(void *)(result + _Block_object_dispose(&a9, 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 4_Block_object_dispose(&a9, 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SearchUIContinuationEntity()
{
  return &type metadata for SearchUIContinuationEntity;
}

ValueMetadata *type metadata accessor for SearchUIContinuationEntity.SearchUIContinuationEntityQuery()
{
  return &type metadata for SearchUIContinuationEntity.SearchUIContinuationEntityQuery;
}

BOOL sub_1E469DB90(void *a1)
{
  id v1 = objc_msgSend(a1, sel_cardSection);
  if (v1)
  {
    unint64_t v2 = v1;
    id v3 = objc_msgSend(v1, sel_command);

    if (!v3)
    {
LABEL_5:
      id v1 = 0;
      goto LABEL_6;
    }
    self;
    id v1 = (id)swift_dynamicCastObjCClass();
    if (!v1)
    {

      goto LABEL_5;
    }
  }
LABEL_6:
  BOOL v4 = v1 != 0;

  return v4;
}

uint64_t sub_1E469DC1C@<X0>(void *a1@<X8>)
{
  if (qword_1EAE55680 != -1) {
    swift_once();
  }
  *a1 = qword_1EAE58068;
  return sub_1E46A4AB0();
}

uint64_t sub_1E469DC88@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EAE55688 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1E46A4CF0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EAE58070);
  BOOL v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_1E469DD30(uint64_t a1)
{
  unint64_t v2 = sub_1E466776C();
  return aSettrailingatt(a1, v2);
}

uint64_t sub_1E469DD80(uint64_t a1)
{
  unint64_t v2 = sub_1E469DE28();
  return off_1F40D4970(a1, v2);
}

unint64_t sub_1E469DDD0()
{
  unint64_t result = qword_1EB99BA88;
  if (!qword_1EB99BA88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB99BA88);
  }
  return result;
}

unint64_t sub_1E469DE28()
{
  unint64_t result = qword_1EB99BA80;
  if (!qword_1EB99BA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB99BA80);
  }
  return result;
}

unint64_t sub_1E469DE80()
{
  unint64_t result = qword_1EB99BA78;
  if (!qword_1EB99BA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB99BA78);
  }
  return result;
}

unint64_t sub_1E469DED8()
{
  unint64_t result = qword_1EB99BA70;
  if (!qword_1EB99BA70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB99BA70);
  }
  return result;
}

unint64_t sub_1E469DF2C(uint64_t a1)
{
  unint64_t result = sub_1E466776C();
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = result;
  return result;
}

unint64_t sub_1E469DF58()
{
  unint64_t result = qword_1EAE56498;
  if (!qword_1EAE56498)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE564A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE56498);
  }
  return result;
}

unint64_t sub_1E469DFB8()
{
  unint64_t result = qword_1EB99BA50;
  if (!qword_1EB99BA50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB99BA50);
  }
  return result;
}

unint64_t sub_1E469E010()
{
  unint64_t result = qword_1EB99BA68;
  if (!qword_1EB99BA68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB99BA68);
  }
  return result;
}

unint64_t sub_1E469E068()
{
  unint64_t result = qword_1EB99BA90;
  if (!qword_1EB99BA90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB99BA90);
  }
  return result;
}

unint64_t sub_1E469E0C0()
{
  unint64_t result = qword_1EAE564A8;
  if (!qword_1EAE564A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE564A8);
  }
  return result;
}

void *sub_1E469E114(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE564D8);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      _OWORD v10[2] = v8;
      void v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
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
    sub_1E469E360(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_1E469E238(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE564C0);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      _OWORD v10[2] = v8;
      void v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4]) {
          memmove(v12, a4 + 4, 48 * v8);
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
    sub_1E469E97C(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1E469E360(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1E46A6470();
  __break(1u);
  return result;
}

void sub_1E469E458(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v44 = a2;
  id v45 = a1;
  uint64_t v2 = sub_1E46A4D30();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  unint64_t v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1E46A4E40();
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v7 = sub_1E46A6030();
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v8 = sub_1E46A4D50();
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE55E28);
  sub_1E46A5FD0();
  sub_1E46A4E30();
  uint64_t v11 = *MEMORY[0x1E4F275D0];
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v12(v5, v11, v2);
  sub_1E46A4D60();
  uint64_t v13 = MEMORY[0x1E4E82060](v10);
  sub_1E46A4AB0();
  sub_1E46A5FD0();
  sub_1E46A4E30();
  v12(v5, v11, v2);
  uint64_t v14 = v45;
  sub_1E46A4D60();
  uint64_t v15 = MEMORY[0x1E4E82060](v10);
  sub_1E46A4AB0();
  id v16 = objc_msgSend(v14, sel_itemIdentifier);
  if (!v16)
  {
    __break(1u);
    goto LABEL_14;
  }
  unint64_t v17 = v16;
  uint64_t v18 = sub_1E46A6050();
  uint64_t v20 = v19;

  swift_bridgeObjectRetain();
  id v21 = objc_msgSend(v14, sel_cardSection);
  if (!v21)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  long long v22 = v21;
  id v23 = objc_msgSend(v21, sel_command);

  if (!v23)
  {
LABEL_10:

    swift_release_n();
    swift_release_n();
    swift_bridgeObjectRelease_n();
    uint64_t v39 = 0;
    uint64_t v20 = 0;
    uint64_t v28 = 0;
    uint64_t v30 = 0;
    uint64_t v13 = 0;
    uint64_t v15 = 0;
    goto LABEL_11;
  }
  self;
  id v24 = (void *)swift_dynamicCastObjCClass();
  if (!v24
    || (v25 = v24, (id v26 = objc_msgSend(v24, sel_applicationBundleIdentifier)) == 0))
  {

    goto LABEL_10;
  }
  uint64_t v27 = v26;
  uint64_t v28 = sub_1E46A6050();
  uint64_t v30 = v29;
  id v31 = objc_msgSend(v25, sel_searchString);
  if (!v31)
  {
    swift_bridgeObjectRelease();

    goto LABEL_10;
  }
  id v32 = v31;
  uint64_t v43 = v18;
  uint64_t v33 = sub_1E46A6050();
  uint64_t v41 = v34;
  uint64_t v42 = v33;

  swift_bridgeObjectRetain_n();
  sub_1E46A4AB0();
  sub_1E46A4AB0();
  swift_bridgeObjectRetain();
  id v35 = (id)SSAppNameForBundleId();

  if (v35)
  {
    uint64_t v36 = sub_1E46A6050();
    uint64_t v38 = v37;

    uint64_t v46 = v36;
    uint64_t v47 = v38;
    sub_1E46A4A30(&v46);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v46 = v42;
    uint64_t v47 = v41;
    sub_1E46A4AB0();
    sub_1E46A4AB0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1E46A4A30(&v46);

    swift_release();
    swift_release_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    swift_release();
    uint64_t v39 = v43;
LABEL_11:
    char v40 = v44;
    uint64_t *v44 = v39;
    v40[1] = v20;
    v40[2] = v28;
    v40[3] = v30;
    v40[4] = v13;
    v40[5] = v15;
    return;
  }
LABEL_15:
  __break(1u);
}

uint64_t sub_1E469E97C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1E46A6470();
  __break(1u);
  return result;
}

void *sub_1E469EA74(uint64_t a1, unint64_t a2)
{
  uint64_t v33 = *(void *)(a1 + 16);
  if (!v33) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  unint64_t v2 = a2;
  uint64_t v32 = a1 + 32;
  uint64_t v29 = a2 & 0xFFFFFFFFFFFFFF8;
  unint64_t v35 = a2 & 0xC000000000000001;
  swift_bridgeObjectRetain();
  uint64_t v3 = 0;
  uint64_t v30 = (void *)MEMORY[0x1E4FBC860];
  unint64_t v31 = v2 >> 62;
  unint64_t v39 = v2;
  while (1)
  {
    uint64_t v4 = (uint64_t *)(v32 + 16 * v3);
    uint64_t v6 = *v4;
    uint64_t v5 = v4[1];
    if (v31) {
      break;
    }
    uint64_t v7 = *(void *)(v29 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v7) {
      goto LABEL_9;
    }
LABEL_3:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_4:
    if (++v3 == v33)
    {
      swift_bridgeObjectRelease();
      return v30;
    }
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1E46A6440();
  if (!v7) {
    goto LABEL_3;
  }
LABEL_9:
  uint64_t v34 = v3;
  uint64_t v8 = 4;
  while (1)
  {
    uint64_t result = v35 ? (void *)MEMORY[0x1E4E83990](v8 - 4, v2) : *(id *)(v2 + 8 * v8);
    uint64_t v10 = result;
    uint64_t v11 = v8 - 3;
    if (__OFADD__(v8 - 4, 1)) {
      break;
    }
    id v12 = objc_msgSend(result, sel_itemIdentifier);
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = sub_1E46A6050();
      uint64_t v16 = v15;

      BOOL v17 = v14 == v6 && v16 == v5;
      if (v17)
      {
        unint64_t v2 = v39;
        swift_bridgeObjectRelease();
        goto LABEL_24;
      }
      char v18 = sub_1E46A64D0();
      swift_bridgeObjectRelease();
      if (v18)
      {
        unint64_t v2 = v39;
LABEL_24:
        swift_bridgeObjectRelease();
        sub_1E469E458(v10, v36);
        uint64_t v19 = v36[0];
        uint64_t v20 = v36[1];
        uint64_t v21 = v36[2];
        uint64_t v22 = v36[3];
        uint64_t v23 = v36[4];
        uint64_t v24 = v36[5];
        swift_bridgeObjectRelease();
        sub_1E467946C((uint64_t)v36, (uint64_t)v37, &qword_1EAE564B8);
        if (v38)
        {
          uint64_t v25 = v30;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v25 = sub_1E469E238(0, v30[2] + 1, 1, v30);
          }
          unint64_t v27 = v25[2];
          unint64_t v26 = v25[3];
          uint64_t v30 = v25;
          if (v27 >= v26 >> 1) {
            uint64_t v30 = sub_1E469E238((void *)(v26 > 1), v27 + 1, 1, v25);
          }
          v30[2] = v27 + 1;
          uint64_t v28 = &v30[6 * v27];
          v28[4] = v19;
          v28[5] = v20;
          v28[6] = v21;
          v28[7] = v22;
          v28[8] = v23;
          v28[9] = v24;
          unint64_t v2 = v39;
        }
LABEL_30:
        uint64_t v3 = v34;
        goto LABEL_4;
      }
    }

    ++v8;
    BOOL v17 = v11 == v7;
    unint64_t v2 = v39;
    if (v17)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_30;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1E469ED54(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1F4188790](AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - v3, a1);
  return sub_1E46A4A90();
}

unint64_t sub_1E469EE50()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99BAA8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1E46B7BD0;
  unint64_t v1 = sub_1E469F63C();
  *(void *)(v0 + 32) = &type metadata for SearchUIContinuationEntity;
  *(void *)(v0 + 40) = v1;
  unint64_t result = sub_1E469F690();
  *(void *)(v0 + 4_Block_object_dispose(&a9, 8) = &type metadata for SearchUIKnowledgeEntity;
  *(void *)(v0 + 56) = result;
  off_1EB99BAA0 = (_UNKNOWN *)v0;
  return result;
}

void sub_1E469EFD4(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = (void *)MEMORY[0x1E4E84B80](v3);
  uint64_t v5 = (objc_class *)type metadata accessor for SearchUIAppIntentRunner();
  uint64_t v6 = (char *)objc_allocWithZone(v5);
  *(void *)&v6[OBJC_IVAR____TtC8SearchUI23SearchUIAppIntentRunner_delegate + 8] = 0;
  uint64_t v7 = swift_unknownObjectWeakInit();
  uint64_t v8 = &off_1F4026090;
  if (!v4) {
    uint64_t v8 = 0;
  }
  *(void *)(v7 + _Block_object_dispose(&a9, 8) = v8;
  swift_unknownObjectWeakAssign();
  v10.receiver = v6;
  v10.super_class = v5;
  id v9 = objc_msgSendSuper2(&v10, sel_init);

  *a2 = v9;
}

SearchUIAppEntityAnnotator __swiftcall SearchUIAppEntityAnnotator.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (SearchUIAppEntityAnnotator)objc_msgSend(v0, sel_init);
}

id SearchUIAppEntityAnnotator.init()()
{
  v1.super_class = (Class)SearchUIAppEntityAnnotator;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t type metadata accessor for SearchUIAppEntityAnnotator()
{
  unint64_t result = qword_1EAE564E0;
  if (!qword_1EAE564E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAE564E0);
  }
  return result;
}

uint64_t sub_1E469F1C4(uint64_t a1, void *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE564E8);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = (uint64_t)objc_msgSend(self, sel_isAppIntentsSupportEnabled);
  if (result)
  {
    uint64_t result = (uint64_t)objc_msgSend(a2, sel_allowsAppEntityAnnotation);
    if (result)
    {
      if (qword_1EB99B990 != -1) {
        swift_once();
      }
      uint64_t v7 = (char *)off_1EB99BAA0;
      uint64_t v8 = *((void *)off_1EB99BAA0 + 2);
      if (!v8) {
        goto LABEL_13;
      }
      swift_bridgeObjectRetain();
      id v9 = v7 + 40;
      while (1)
      {
        uint64_t v10 = *(v9 - 1);
        if ((*(uint64_t (**)(void *, uint64_t, void))(*v9 + 24))(a2, v10, *v9)) {
          break;
        }
        v9 += 2;
        if (!--v8)
        {
          swift_bridgeObjectRelease();
          goto LABEL_13;
        }
      }
      swift_bridgeObjectRelease();
      if (v10)
      {
        uint64_t result = (uint64_t)objc_msgSend(a2, sel_itemIdentifier);
        if (!result)
        {
          __break(1u);
          return result;
        }
        uint64_t v11 = (void *)result;
        uint64_t v12 = sub_1E46A6050();
        uint64_t v14 = v13;

        v17[0] = v12;
        v17[1] = v14;
        sub_1E469ED54((uint64_t)v17);
        swift_bridgeObjectRelease();
        uint64_t v15 = sub_1E46A4AA0();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v5, 0, 1, v15);
      }
      else
      {
LABEL_13:
        uint64_t v16 = sub_1E46A4AA0();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v5, 1, 1, v16);
      }
      sub_1E46A6290();
      return 1;
    }
  }
  return result;
}

id sub_1E469F3F0(void *a1)
{
  id result = objc_msgSend(self, sel_isAppIntentsSupportEnabled);
  if (result)
  {
    sub_1E46A4980();
    sub_1E46A4970();
    v4[0] = type metadata accessor for SearchUIAppIntentRunner();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99B9C8);
    sub_1E46A6060();
    sub_1E46A62F0();
    *(void *)(swift_allocObject() + 16) = a1;
    id v3 = a1;
    sub_1E46A4960();
    swift_release();
    swift_release();
    return (id)sub_1E469F588((uint64_t)v4);
  }
  return result;
}

uint64_t sub_1E469F4F4()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void (*sub_1E469F52C())(void *a1@<X8>)
{
  return sub_1E469F620;
}

uint64_t sub_1E469F588(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99B9F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E469F5E8()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1E469F620(void *a1@<X8>)
{
  sub_1E469EFD4(v1, a1);
}

unint64_t sub_1E469F63C()
{
  unint64_t result = qword_1EB99BA98;
  if (!qword_1EB99BA98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB99BA98);
  }
  return result;
}

unint64_t sub_1E469F690()
{
  unint64_t result = qword_1EB99BA48;
  if (!qword_1EB99BA48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB99BA48);
  }
  return result;
}

uint64_t sub_1E469F6E4(char a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, a1 & 1);
}

double sub_1E469F744()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_duration;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_1E469F7E0(double a1)
{
  id v3 = (double *)(v1 + OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_duration);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_1E469F834())()
{
  return j_j__swift_endAccess;
}

double sub_1E469F8D8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_delay;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_1E469F974(double a1)
{
  id v3 = (double *)(v1 + OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_delay);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_1E469F9C8())()
{
  return j__swift_endAccess;
}

id sub_1E469FAD0()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F39B48]), sel_init);
  uint64_t v2 = (double *)(v0 + OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_duration);
  swift_beginAccess();
  objc_msgSend(v1, sel_setDuration_, *v2);
  return v1;
}

id sub_1E469FC14()
{
  id v1 = (double *)(v0 + OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_duration);
  swift_beginAccess();
  double v2 = *v1;
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1698]), sel_initWithAnimationCurve_, 0);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1ED8]), sel_initWithDuration_timingParameters_, v3, v2);

  return v4;
}

void SearchUIBasicAnimationSettings.init()()
{
}

id SearchUIBasicAnimationSettings.__deallocating_deinit()
{
  return sub_1E46A12CC(type metadata accessor for SearchUIBasicAnimationSettings);
}

uint64_t type metadata accessor for SearchUIBasicAnimationSettings()
{
  return self;
}

id static SearchUISpringAnimationSettings.buttonSelection.getter()
{
  uint64_t v0 = (objc_class *)type metadata accessor for SearchUISpringAnimationSettings();
  id v1 = (char *)objc_allocWithZone(v0);
  *(void *)&v1[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_delay] = 0;
  *(void *)&v1[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce] = 0x3FD78D4FDF3B645ALL;
  *(void *)&v1[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration] = 0x3FD96F0068DB8BACLL;
  v3.receiver = v1;
  v3.super_class = v0;
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for SearchUISpringAnimationSettings()
{
  return self;
}

id static SearchUISpringAnimationSettings.buttonSelectionCancel.getter()
{
  uint64_t v0 = (objc_class *)type metadata accessor for SearchUISpringAnimationSettings();
  id v1 = (char *)objc_allocWithZone(v0);
  *(void *)&v1[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_delay] = 0;
  *(void *)&v1[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce] = 0x3FD78D4FDF3B645ALL;
  *(void *)&v1[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration] = 0x3FE06A7EF9DB22D1;
  v3.receiver = v1;
  v3.super_class = v0;
  return objc_msgSendSuper2(&v3, sel_init);
}

id static SearchUISpringAnimationSettings.buttonIconAppear.getter()
{
  uint64_t v0 = (objc_class *)type metadata accessor for SearchUISpringAnimationSettings();
  id v1 = (char *)objc_allocWithZone(v0);
  *(void *)&v1[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_delay] = 0;
  *(void *)&v1[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce] = 0x3FDC6F694467381DLL;
  *(void *)&v1[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration] = 0x3FDE147AE147AE14;
  v3.receiver = v1;
  v3.super_class = v0;
  return objc_msgSendSuper2(&v3, sel_init);
}

double sub_1E46A0118()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_1E46A01B4(double a1)
{
  objc_super v3 = (double *)(v1 + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = a1;
  return result;
}

uint64_t (*sub_1E46A0208())()
{
  return j_j__swift_endAccess;
}

double sub_1E46A02AC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_1E46A0348(double a1)
{
  objc_super v3 = (double *)(v1 + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = a1;
  return result;
}

uint64_t (*sub_1E46A039C())()
{
  return j_j__swift_endAccess;
}

double sub_1E46A0440()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_delay;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_1E46A04DC(double a1)
{
  objc_super v3 = (double *)(v1 + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_delay);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = a1;
  return result;
}

uint64_t (*sub_1E46A0530())()
{
  return j_j__swift_endAccess;
}

id sub_1E46A0634()
{
  uint64_t v1 = (double *)(v0 + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration);
  swift_beginAccess();
  double v2 = *v1;
  objc_super v3 = (double *)(v0 + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce);
  swift_beginAccess();
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F39C90]), sel_initWithPerceptualDuration_bounce_, v2, *v3);
}

id sub_1E46A07BC()
{
  uint64_t v1 = (double *)(v0 + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration);
  swift_beginAccess();
  double v2 = *v1;
  objc_super v3 = (double *)(v0 + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce);
  swift_beginAccess();
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1C58]), sel_initWithDuration_bounce_, v2, *v3);
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1ED8]), sel_initWithDuration_timingParameters_, v4, 0.0);

  return v5;
}

void SearchUISpringAnimationSettings.init()()
{
}

id SearchUISpringAnimationSettings.__deallocating_deinit()
{
  return sub_1E46A12CC(type metadata accessor for SearchUISpringAnimationSettings);
}

id sub_1E46A09D4(void *a1)
{
  id v2 = objc_msgSend(a1, sel_coreAnimation);
  swift_bridgeObjectRetain();
  objc_super v3 = (void *)sub_1E46A6040();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setKeyPath_, v3);

  objc_msgSend(v2, sel_setFromValue_, *(void *)(v1 + OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_fromValue));
  objc_msgSend(v2, sel_setToValue_, *(void *)(v1 + OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_toValue));
  return v2;
}

void SearchUIBasicLayerAnimation.init()()
{
}

id SearchUIBasicLayerAnimation.__deallocating_deinit()
{
  return sub_1E46A12CC(type metadata accessor for SearchUIBasicLayerAnimation);
}

uint64_t sub_1E46A0B8C(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F39B38]), sel_init);
  swift_unknownObjectRetain();
  unint64_t v3 = swift_bridgeObjectRetain();
  unint64_t v4 = sub_1E46A1844(v3, a1);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_1E46A19AC();
  id v5 = (void *)sub_1E46A6100();
  objc_msgSend(v2, sel_setAnimations_, v5);

  if (!(v4 >> 62))
  {
    uint64_t v6 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v7 = v2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v6) {
      goto LABEL_3;
    }
LABEL_12:
    double v10 = 0.0;
LABEL_13:
    swift_bridgeObjectRelease_n();
    objc_msgSend(v2, sel_setDuration_, v10);

    return (uint64_t)v2;
  }
  id v15 = v2;
  swift_bridgeObjectRetain();
  uint64_t result = sub_1E46A6440();
  uint64_t v6 = result;
  if (!result) {
    goto LABEL_12;
  }
LABEL_3:
  if (v6 >= 1)
  {
    uint64_t v9 = 0;
    double v10 = 0.0;
    do
    {
      if ((v4 & 0xC000000000000001) != 0) {
        id v11 = (id)MEMORY[0x1E4E83990](v9, v4);
      }
      else {
        id v11 = *(id *)(v4 + 8 * v9 + 32);
      }
      uint64_t v12 = v11;
      objc_msgSend(v11, sel_duration);
      double v14 = v13;

      if (v10 <= v14) {
        double v10 = v14;
      }
      ++v9;
    }
    while (v6 != v9);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

id sub_1E46A0D54(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  swift_unknownObjectRetain();
  id v7 = a1;
  uint64_t v8 = (void *)a4(a3);
  swift_unknownObjectRelease();

  return v8;
}

void SearchUIGroupedLayerAnimation.init()()
{
}

id SearchUIGroupedLayerAnimation.__deallocating_deinit()
{
  return sub_1E46A12CC(type metadata accessor for SearchUIGroupedLayerAnimation);
}

void static SearchUIAnimator.animate(layer:with:key:animations:delegate:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  double v10 = (objc_class *)type metadata accessor for SearchUIGroupedLayerAnimation();
  id v11 = (char *)objc_allocWithZone(v10);
  *(void *)&v11[OBJC_IVAR____TtC8SearchUI29SearchUIGroupedLayerAnimation_animations] = a5;
  v15.receiver = v11;
  v15.super_class = v10;
  swift_bridgeObjectRetain();
  id v12 = objc_msgSendSuper2(&v15, sel_init);
  double v13 = (void *)sub_1E46A0B8C(a2);
  objc_msgSend(v13, sel_setDelegate_, a6, v15.receiver, v15.super_class);
  double v14 = (void *)sub_1E46A6040();
  objc_msgSend(a1, sel_addAnimation_forKey_, v13, v14);
}

uint64_t sub_1E46A1070(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = sub_1E46A4AB0();
  v1(v2);
  return swift_release();
}

uint64_t sub_1E46A10B4(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  sub_1E46A4AB0();
  v3(a2);
  return swift_release();
}

id SearchUIAnimator.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id SearchUIAnimator.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUIAnimator();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SearchUIAnimator.__deallocating_deinit()
{
  return sub_1E46A12CC(type metadata accessor for SearchUIAnimator);
}

id sub_1E46A12CC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id _s8SearchUI0A21UIBasicLayerAnimationC7opacity4from2toAA0a7UILayerE0_p12CoreGraphics7CGFloatV_AJtFZ_0(double a1, double a2)
{
  id v3 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, a1);
  id v4 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, a2);
  id v5 = (objc_class *)type metadata accessor for SearchUIBasicLayerAnimation();
  uint64_t v6 = (char *)objc_allocWithZone(v5);
  id v7 = &v6[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_keyPath];
  *(void *)id v7 = 0x7974696361706FLL;
  *((void *)v7 + 1) = 0xE700000000000000;
  *(void *)&v6[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_fromValue] = v3;
  *(void *)&v6[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_toValue] = v4;
  v9.receiver = v6;
  v9.super_class = v5;
  return objc_msgSendSuper2(&v9, sel_init);
}

id _s8SearchUI0A21UIBasicLayerAnimationC4blur4from2toAA0a7UILayerE0_p12CoreGraphics7CGFloatV_AJtFZ_0(double a1, double a2)
{
  id v3 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, a1);
  id v4 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, a2);
  id v5 = (objc_class *)type metadata accessor for SearchUIBasicLayerAnimation();
  uint64_t v6 = (char *)objc_allocWithZone(v5);
  id v7 = &v6[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_keyPath];
  *(void *)id v7 = 0xD000000000000020;
  *((void *)v7 + 1) = 0x80000001E46BD9A0;
  *(void *)&v6[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_fromValue] = v3;
  *(void *)&v6[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_toValue] = v4;
  v9.receiver = v6;
  v9.super_class = v5;
  return objc_msgSendSuper2(&v9, sel_init);
}

id _s8SearchUI0A21UIBasicLayerAnimationC13verticalScale4from2toAA0a7UILayerE0_p12CoreGraphics7CGFloatV_AJtFZ_0(double a1, double a2)
{
  id v3 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, a1);
  id v4 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, a2);
  id v5 = (objc_class *)type metadata accessor for SearchUIBasicLayerAnimation();
  uint64_t v6 = (char *)objc_allocWithZone(v5);
  id v7 = &v6[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_keyPath];
  *(void *)id v7 = 0xD000000000000011;
  *((void *)v7 + 1) = 0x80000001E46BD960;
  *(void *)&v6[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_fromValue] = v3;
  *(void *)&v6[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_toValue] = v4;
  v9.receiver = v6;
  v9.super_class = v5;
  return objc_msgSendSuper2(&v9, sel_init);
}

id _s8SearchUI0A21UIBasicLayerAnimationC15horizontalScale4from2toAA0a7UILayerE0_p12CoreGraphics7CGFloatV_AJtFZ_0(double a1, double a2)
{
  id v3 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, a1);
  id v4 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, a2);
  id v5 = (objc_class *)type metadata accessor for SearchUIBasicLayerAnimation();
  uint64_t v6 = (char *)objc_allocWithZone(v5);
  id v7 = &v6[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_keyPath];
  *(void *)id v7 = 0xD000000000000011;
  *((void *)v7 + 1) = 0x80000001E46BD980;
  *(void *)&v6[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_fromValue] = v3;
  *(void *)&v6[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_toValue] = v4;
  v9.receiver = v6;
  v9.super_class = v5;
  return objc_msgSendSuper2(&v9, sel_init);
}

id _s8SearchUI0A21UIBasicLayerAnimationC5scale4from2toAA0a7UILayerE0_p12CoreGraphics7CGFloatV_AJtFZ_0(double a1, double a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99BC30);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1E46B8B40;
  id v5 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, a1);
  id v6 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, a2);
  id v7 = (objc_class *)type metadata accessor for SearchUIBasicLayerAnimation();
  uint64_t v8 = (char *)objc_allocWithZone(v7);
  objc_super v9 = &v8[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_keyPath];
  *(void *)objc_super v9 = 0xD000000000000011;
  *((void *)v9 + 1) = 0x80000001E46BD960;
  *(void *)&v8[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_fromValue] = v5;
  *(void *)&v8[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_toValue] = v6;
  v21.receiver = v8;
  v21.super_class = v7;
  *(void *)(v4 + 32) = objc_msgSendSuper2(&v21, sel_init);
  id v10 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, a1);
  id v11 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, a2);
  id v12 = (char *)objc_allocWithZone(v7);
  double v13 = &v12[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_keyPath];
  *(void *)double v13 = 0xD000000000000011;
  *((void *)v13 + 1) = 0x80000001E46BD980;
  *(void *)&v12[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_fromValue] = v10;
  *(void *)&v12[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_toValue] = v11;
  v20.receiver = v12;
  v20.super_class = v7;
  *(void *)(v4 + 40) = objc_msgSendSuper2(&v20, sel_init);
  uint64_t v19 = v4;
  sub_1E46A6120();
  uint64_t v14 = v4;
  objc_super v15 = (objc_class *)type metadata accessor for SearchUIGroupedLayerAnimation();
  uint64_t v16 = (char *)objc_allocWithZone(v15);
  *(void *)&v16[OBJC_IVAR____TtC8SearchUI29SearchUIGroupedLayerAnimation_animations] = v14;
  v18.receiver = v16;
  v18.super_class = v15;
  return objc_msgSendSuper2(&v18, sel_init);
}

uint64_t type metadata accessor for SearchUIBasicLayerAnimation()
{
  return self;
}

uint64_t sub_1E46A1844(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = MEMORY[0x1E4FBC860];
    if (!v4) {
      break;
    }
    uint64_t v9 = MEMORY[0x1E4FBC860];
    uint64_t result = sub_1E46A63F0();
    if (v4 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v6 = 0;
    while (v4 != v6)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        id v7 = (void *)MEMORY[0x1E4E83990](v6, a1);
      }
      else
      {
        id v7 = *(void **)(a1 + 8 * v6 + 32);
        swift_unknownObjectRetain();
      }
      ++v6;
      id v8 = objc_msgSend(v7, sel_animationWith_, a2);
      swift_unknownObjectRelease();
      sub_1E46A63D0();
      sub_1E46A6400();
      sub_1E46A6410();
      sub_1E46A63E0();
      if (v4 == v6) {
        return v9;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1E46A6440();
    swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_1E46A19AC()
{
  unint64_t result = qword_1EAE56538;
  if (!qword_1EAE56538)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAE56538);
  }
  return result;
}

uint64_t type metadata accessor for SearchUIGroupedLayerAnimation()
{
  return self;
}

id _s8SearchUI0A10UIAnimatorC7animate4with10animations10completionSo22UIViewPropertyAnimatorCAA0A19UIAnimationSettings_p_yycySbcSgtFZ_0(void *a1, uint64_t (*a2)(uint64_t result), uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v10 = objc_msgSend(a1, sel_propertyAnimator);
  uint64_t v19 = a2;
  uint64_t v20 = a3;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 1107296256;
  BOOL v17 = sub_1E46A1070;
  objc_super v18 = &block_descriptor_2;
  id v11 = _Block_copy(&v15);
  sub_1E46A4AB0();
  swift_release();
  objc_msgSend(v10, sel_addAnimations_, v11);
  _Block_release(v11);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a4;
  *(void *)(v12 + 24) = a5;
  uint64_t v19 = sub_1E46A22C4;
  uint64_t v20 = v12;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 1107296256;
  BOOL v17 = sub_1E46A10B4;
  objc_super v18 = &block_descriptor_59;
  double v13 = _Block_copy(&v15);
  sub_1E46A22FC(a4);
  swift_release();
  objc_msgSend(v10, sel_addCompletion_, v13);
  _Block_release(v13);
  objc_msgSend(a1, sel_delay);
  objc_msgSend(v10, sel_startAnimationAfterDelay_);
  return v10;
}

uint64_t type metadata accessor for SearchUIAnimator()
{
  return self;
}

double sub_1E46A1BF4@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_duration, a2);
}

uint64_t sub_1E46A1C00(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_duration);
}

double sub_1E46A1C0C@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_delay, a2);
}

uint64_t sub_1E46A1C18(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_delay);
}

double sub_1E46A1C24@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  id v3 = (double *)(*a1 + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce);
  swift_beginAccess();
  double result = *v3;
  *a2 = *(void *)v3;
  return result;
}

uint64_t sub_1E46A1C78(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce);
}

double sub_1E46A1C84@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration, a2);
}

uint64_t sub_1E46A1C90(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration);
}

double sub_1E46A1C9C@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_delay, a2);
}

double keypath_getTm_0@<D0>(void *a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  uint64_t v4 = (double *)(*a1 + *a2);
  swift_beginAccess();
  double result = *v4;
  *a3 = *(void *)v4;
  return result;
}

uint64_t sub_1E46A1CF8(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_delay);
}

uint64_t keypath_setTm(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *a1;
  uint64_t v6 = (void *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  *uint64_t v6 = v5;
  return result;
}

uint64_t method lookup function for SearchUIBasicAnimationSettings(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SearchUIBasicAnimationSettings);
}

uint64_t dispatch thunk of SearchUIBasicAnimationSettings.duration.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of SearchUIBasicAnimationSettings.duration.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of SearchUIBasicAnimationSettings.duration.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of SearchUIBasicAnimationSettings.delay.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of SearchUIBasicAnimationSettings.delay.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SearchUIBasicAnimationSettings.delay.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SearchUIBasicAnimationSettings.coreAnimation.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of SearchUIBasicAnimationSettings.propertyAnimator.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t method lookup function for SearchUISpringAnimationSettings(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SearchUISpringAnimationSettings);
}

uint64_t dispatch thunk of SearchUISpringAnimationSettings.bounce.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of SearchUISpringAnimationSettings.bounce.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of SearchUISpringAnimationSettings.bounce.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of SearchUISpringAnimationSettings.perceptualDuration.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SearchUISpringAnimationSettings.perceptualDuration.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SearchUISpringAnimationSettings.perceptualDuration.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of SearchUISpringAnimationSettings.delay.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of SearchUISpringAnimationSettings.delay.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of SearchUISpringAnimationSettings.delay.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of SearchUISpringAnimationSettings.coreAnimation.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of SearchUISpringAnimationSettings.propertyAnimator.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t method lookup function for SearchUIBasicLayerAnimation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SearchUIBasicLayerAnimation);
}

uint64_t dispatch thunk of SearchUIBasicLayerAnimation.animation(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

uint64_t method lookup function for SearchUIGroupedLayerAnimation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SearchUIGroupedLayerAnimation);
}

uint64_t dispatch thunk of SearchUIGroupedLayerAnimation.animation(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t sub_1E46A21FC()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E46A2234()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1E46A2244(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1E46A2254(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return sub_1E46A4AB0();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_1E46A2284()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1E46A22C4(uint64_t result)
{
  uint64_t v2 = *(uint64_t (**)(BOOL))(v1 + 16);
  if (v2) {
    return v2(result == 0);
  }
  return result;
}

uint64_t sub_1E46A22FC(uint64_t result)
{
  if (result) {
    return sub_1E46A4AB0();
  }
  return result;
}

uint64_t sub_1E46A232C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t __getMTAlarmManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SearchUILeadingTrailingSectionModel copyWithRowModels:](v0);
}

uint64_t __getSAAudioAppPredictorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSAAudioAppPredictorOptionsClass_block_invoke_cold_1(v0);
}

uint64_t __getSAAudioAppPredictorOptionsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __80__SearchUIImageDerivedColorGenerator_fetchColorsForImage_withCompletionHandler___block_invoke_2_cold_1(v0);
}

uint64_t __getFMUILocationDetailViewControllerViewOptionsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getFMUILocationDetailViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getFMUILocationDetailViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SearchUIPersonHeaderViewController handleErrorResultFromDowntimeToggleFor:withError:](v0);
}

void __getOBPrivacySplashControllerClass_block_invoke_cold_1()
{
}

uint64_t sub_1E46A4930()
{
  return off_1F40D3A18();
}

uint64_t sub_1E46A4940()
{
  return off_1F40D3A80();
}

uint64_t sub_1E46A4950()
{
  return off_1F40D3A98();
}

uint64_t sub_1E46A4960()
{
  return off_1F40D3AE8();
}

uint64_t sub_1E46A4970()
{
  return off_1F40D3B10();
}

uint64_t sub_1E46A4980()
{
  return off_1F40D3B20();
}

uint64_t sub_1E46A49A0()
{
  return (*(uint64_t (**)(void))&sel_leadingAttributionPunchout[24])();
}

uint64_t sub_1E46A49B0()
{
  return (*(uint64_t (**)(void))&aSetleadingattr_0[16])();
}

uint64_t sub_1E46A49C0()
{
  return (*(uint64_t (**)(void))&aSettrailingatt_1[24])();
}

uint64_t sub_1E46A49E0()
{
  return off_1F40D3CF8();
}

uint64_t sub_1E46A4A00()
{
  return off_1F40D3DA0();
}

uint64_t sub_1E46A4A10()
{
  return (*(uint64_t (**)(void))&aTrailingattrib_2[8])();
}

uint64_t sub_1E46A4A20()
{
  return off_1F40D3F08();
}

#error "1E46A4A3C: call analysis failed (funcsize=3)"

uint64_t sub_1E46A4A40()
{
  return off_1F40D3FC0();
}

uint64_t sub_1E46A4A50()
{
  return aLeadingattribu_1();
}

uint64_t sub_1E46A4A60()
{
  return (*(&aLeadingattribu_1 + 2))();
}

uint64_t sub_1E46A4A70()
{
  return aAttributionpun();
}

uint64_t sub_1E46A4A80()
{
  return aHout();
}

uint64_t sub_1E46A4A90()
{
  return aTSfrichtextNVL();
}

uint64_t sub_1E46A4AA0()
{
  return (*(&aTSfrichtextNVL + 2))();
}

uint64_t sub_1E46A4AB0()
{
  return (*(uint64_t (**)(void))&aTSfpunchoutNVL[40])();
}

uint64_t sub_1E46A4AC0()
{
  return aTSfrichtextNVT();
}

uint64_t sub_1E46A4AD0()
{
  return (*(&aTSfrichtextNVT + 3))();
}

uint64_t sub_1E46A4AE0()
{
  return (*(&aTSfrichtextNVT + 4))();
}

uint64_t sub_1E46A4AF0()
{
  return aTSfpunchoutNVT();
}

uint64_t sub_1E46A4B00()
{
  return (*(&aTSfpunchoutNVT + 2))();
}

uint64_t sub_1E46A4B10()
{
  return aTSfcommandNVTr();
}

uint64_t sub_1E46A4B20()
{
  return (*(&aTSfcommandNVTr + 1))();
}

uint64_t sub_1E46A4B30()
{
  return (*(&aTSfcommandNVTr + 4))();
}

uint64_t sub_1E46A4B40()
{
  return (*(&aTSfcommandNVTr + 5))();
}

#error "1E46A4B5C: call analysis failed (funcsize=3)"

uint64_t sub_1E46A4B60()
{
  return off_1F40D4330();
}

#error "1E46A4B7C: call analysis failed (funcsize=3)"

#error "1E46A4B8C: call analysis failed (funcsize=3)"

uint64_t sub_1E46A4B90()
{
  return off_1F40D4360();
}

uint64_t sub_1E46A4BA0()
{
  return off_1F40D4370();
}

uint64_t sub_1E46A4BB0()
{
  return off_1F40D4388();
}

uint64_t sub_1E46A4BC0()
{
  return off_1F40D4398();
}

uint64_t sub_1E46A4BD0()
{
  return off_1F40D43A8();
}

uint64_t sub_1E46A4BE0()
{
  return off_1F40D43C8();
}

uint64_t sub_1E46A4BF0()
{
  return off_1F40D43D8();
}

uint64_t sub_1E46A4C00()
{
  return (*(uint64_t (**)(void))&sel_orderedSetWithArray_[8])();
}

uint64_t sub_1E46A4C10()
{
  return sel_overrideComponentsInContact_();
}

uint64_t sub_1E46A4C20()
{
  return off_1F40D45D0();
}

uint64_t sub_1E46A4C30()
{
  return off_1F40D45E0();
}

uint64_t sub_1E46A4C40()
{
  return off_1F40D4608();
}

uint64_t sub_1E46A4C60()
{
  return (*(uint64_t (**)(void))&aSetsubtitlebut_0[16])();
}

uint64_t sub_1E46A4C70()
{
  return off_1F40D46E0();
}

uint64_t sub_1E46A4C80()
{
  return off_1F40D4708();
}

uint64_t sub_1E46A4C90()
{
  return off_1F40D4720();
}

uint64_t sub_1E46A4CA0()
{
  return off_1F40D4730();
}

uint64_t sub_1E46A4CB0()
{
  return off_1F40D4750();
}

#error "1E46A4CCC: call analysis failed (funcsize=3)"

uint64_t sub_1E46A4CD0()
{
  return aN();
}

uint64_t sub_1E46A4CE0()
{
  return off_1F40D48B8();
}

uint64_t sub_1E46A4CF0()
{
  return off_1F40D48D0();
}

uint64_t sub_1E46A4D10()
{
  return off_1F40E4540();
}

uint64_t sub_1E46A4D20()
{
  return off_1F40E4550();
}

uint64_t sub_1E46A4D30()
{
  return off_1F40E4588();
}

uint64_t sub_1E46A4D40()
{
  return off_1F40E4590();
}

uint64_t sub_1E46A4D50()
{
  return (*(uint64_t (**)(void))&sel_maxVisibleButtonItems[16])();
}

uint64_t sub_1E46A4D60()
{
  return (*(uint64_t (**)(void))&aSetmaxvisibleb[8])();
}

uint64_t sub_1E46A4D70()
{
  return off_1F40E49A0();
}

uint64_t sub_1E46A4D80()
{
  return off_1F40E4A70();
}

uint64_t sub_1E46A4D90()
{
  return off_1F40E4B80();
}

uint64_t sub_1E46A4DA0()
{
  return off_1F40E4D48();
}

uint64_t sub_1E46A4DB0()
{
  return (*(uint64_t (**)(void))&aSetissecondary[16])();
}

uint64_t sub_1E46A4DC0()
{
  return off_1F40E52E0();
}

uint64_t sub_1E46A4DD0()
{
  return off_1F40E52F0();
}

uint64_t sub_1E46A4DE0()
{
  return (*(uint64_t (**)(void))&aTrailingtoptex_1[8])();
}

uint64_t sub_1E46A4DF0()
{
  return aTSfbuttonN();
}

uint64_t sub_1E46A4E00()
{
  return aRichtrailingbo_0();
}

uint64_t sub_1E46A4E10()
{
  return (*(&aRichtrailingbo_0 + 2))();
}

uint64_t sub_1E46A4E20()
{
  return off_1F40E5658();
}

uint64_t sub_1E46A4E30()
{
  return aChedB1Shouldus();
}

uint64_t sub_1E46A4E40()
{
  return off_1F40E5890();
}

uint64_t sub_1E46A4E50()
{
  return (*(uint64_t (**)(void))&aTSfactionitemN_0[8])();
}

uint64_t sub_1E46A4E60()
{
  return (*(uint64_t (**)(void))&aTSfbuttonNVBut[8])();
}

uint64_t sub_1E46A4E70()
{
  return off_1F40E5E68();
}

uint64_t sub_1E46A4E80()
{
  return off_1F40E5EA0();
}

uint64_t sub_1E46A4E90()
{
  return MEMORY[0x1F4165760]();
}

uint64_t sub_1E46A4EA0()
{
  return off_1F40E5EF0();
}

uint64_t sub_1E46A4EB0()
{
  return (*(uint64_t (**)(void))&sel_initWithURL_[8])();
}

uint64_t sub_1E46A4EC0()
{
  return (*(uint64_t (**)(void))&sel_initWithValidation_[8])();
}

uint64_t sub_1E46A4ED0()
{
  return MEMORY[0x1F4187538]();
}

uint64_t sub_1E46A4EE0()
{
  return MEMORY[0x1F4187540]();
}

uint64_t sub_1E46A4EF0()
{
  return MEMORY[0x1F4187578]();
}

uint64_t sub_1E46A4F00()
{
  return MEMORY[0x1F4187588]();
}

uint64_t sub_1E46A4F10()
{
  return MEMORY[0x1F415D028]();
}

uint64_t sub_1E46A4F20()
{
  return MEMORY[0x1F415D030]();
}

uint64_t sub_1E46A4F30()
{
  return MEMORY[0x1F415D040]();
}

uint64_t sub_1E46A4F50()
{
  return MEMORY[0x1F415D060]();
}

uint64_t sub_1E46A4F80()
{
  return MEMORY[0x1F415D080]();
}

uint64_t sub_1E46A4FA0()
{
  return MEMORY[0x1F415D090]();
}

uint64_t sub_1E46A4FB0()
{
  return MEMORY[0x1F415D098]();
}

uint64_t sub_1E46A4FC0()
{
  return MEMORY[0x1F415D0A0]();
}

uint64_t sub_1E46A4FD0()
{
  return MEMORY[0x1F415D0A8]();
}

uint64_t sub_1E46A4FE0()
{
  return MEMORY[0x1F415D0B0]();
}

uint64_t sub_1E46A4FF0()
{
  return MEMORY[0x1F415D0B8]();
}

uint64_t sub_1E46A5000()
{
  return MEMORY[0x1F415D0C8]();
}

uint64_t sub_1E46A5010()
{
  return MEMORY[0x1F415D0D0]();
}

uint64_t sub_1E46A5020()
{
  return MEMORY[0x1F415D0D8]();
}

uint64_t sub_1E46A5050()
{
  return MEMORY[0x1F415A9D0]();
}

uint64_t sub_1E46A5060()
{
  return MEMORY[0x1F415A9D8]();
}

uint64_t sub_1E46A5070()
{
  return MEMORY[0x1F415A9E0]();
}

uint64_t sub_1E46A5080()
{
  return MEMORY[0x1F415A9E8]();
}

uint64_t sub_1E46A5090()
{
  return MEMORY[0x1F415A9F0]();
}

uint64_t sub_1E46A50A0()
{
  return MEMORY[0x1F415A9F8]();
}

uint64_t sub_1E46A50B0()
{
  return MEMORY[0x1F415AA00]();
}

uint64_t sub_1E46A50C0()
{
  return MEMORY[0x1F415AA08]();
}

uint64_t sub_1E46A50D0()
{
  return (*(uint64_t (**)(void))&sel_orderedSetWithArray_[16])();
}

uint64_t sub_1E46A50E0()
{
  return sel_outputImage();
}

uint64_t sub_1E46A50F0()
{
  return MEMORY[0x1F4119050]();
}

uint64_t sub_1E46A5110()
{
  return MEMORY[0x1F41190F8]();
}

uint64_t sub_1E46A5120()
{
  return MEMORY[0x1F4119100]();
}

uint64_t sub_1E46A5130()
{
  return MEMORY[0x1F4119130]();
}

uint64_t sub_1E46A5140()
{
  return MEMORY[0x1F4187970]();
}

uint64_t sub_1E46A5150()
{
  return MEMORY[0x1F4187A18]();
}

uint64_t sub_1E46A5160()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1E46A5170()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1E46A5180()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1E46A5190()
{
  return off_1F40D6E18();
}

uint64_t sub_1E46A51A0()
{
  return sel_photosLibraryImage();
}

uint64_t sub_1E46A51B0()
{
  return (*(&sel_photosLibraryImage + 2))();
}

uint64_t sub_1E46A51C0()
{
  return off_1F40F7F30();
}

uint64_t sub_1E46A51D0()
{
  return off_1F40F8030();
}

uint64_t sub_1E46A51E0()
{
  return aTSfphotoslibra_0();
}

uint64_t sub_1E46A51F0()
{
  return aPhotofilepunch();
}

uint64_t sub_1E46A5200()
{
  return off_1F40F8148();
}

uint64_t sub_1E46A5210()
{
  return off_1F40F81A0();
}

uint64_t sub_1E46A5220()
{
  return off_1F40F8350();
}

uint64_t sub_1E46A5230()
{
  return off_1F40F8360();
}

uint64_t sub_1E46A5240()
{
  return off_1F40F8378();
}

uint64_t sub_1E46A5250()
{
  return (*(uint64_t (**)(void))&aTSfpersonNVMat[16])();
}

uint64_t sub_1E46A5260()
{
  return off_1F40F8470();
}

uint64_t sub_1E46A5270()
{
  return off_1F40F8488();
}

uint64_t sub_1E46A5290()
{
  return off_1F40F85A8();
}

uint64_t sub_1E46A52A0()
{
  return off_1F40F85B8();
}

uint64_t sub_1E46A52B0()
{
  return off_1F40F8618();
}

uint64_t sub_1E46A52C0()
{
  return off_1F40F8948();
}

uint64_t sub_1E46A52D0()
{
  return aTSfsymbolimage();
}

uint64_t sub_1E46A52E0()
{
  return aEntitytype();
}

uint64_t sub_1E46A52F0()
{
  return (*(&aEntitytype + 1))();
}

uint64_t sub_1E46A5300()
{
  return aEntitybackgrou();
}

uint64_t sub_1E46A5310()
{
  return off_1F40F8C00();
}

uint64_t sub_1E46A5320()
{
  return aSymbolimage_1();
}

uint64_t sub_1E46A5330()
{
  return aTNsstringCNVEn();
}

uint64_t sub_1E46A5340()
{
  return off_1F40F9100();
}

uint64_t sub_1E46A5350()
{
  return (*(uint64_t (**)(void))&aMutablecopywit[8])();
}

uint64_t sub_1E46A5360()
{
  return (*(uint64_t (**)(void))&a2408Nszone16_4[8])();
}

uint64_t sub_1E46A5370()
{
  return aNsfastenumerat();
}

uint64_t sub_1E46A5380()
{
  return sel_countByEnumeratingWithState_objects_count_();
}

uint64_t sub_1E46A5390()
{
  return (*(&sel_countByEnumeratingWithState_objects_count_ + 2))();
}

uint64_t sub_1E46A53A0()
{
  return off_1F40F9280();
}

uint64_t sub_1E46A53B0()
{
  return off_1F40F9298();
}

uint64_t sub_1E46A53C0()
{
  return off_1F40F9388();
}

uint64_t sub_1E46A53D0()
{
  return off_1F40F9390();
}

uint64_t sub_1E46A53E0()
{
  return off_1F40F9550();
}

uint64_t sub_1E46A53F0()
{
  return off_1F40F9568();
}

uint64_t sub_1E46A5400()
{
  return off_1F40F95B8();
}

uint64_t sub_1E46A5410()
{
  return off_1F40F95C0();
}

uint64_t sub_1E46A5420()
{
  return off_1F40F95C8();
}

uint64_t sub_1E46A5430()
{
  return off_1F40F9648();
}

uint64_t sub_1E46A5440()
{
  return off_1F40F9658();
}

uint64_t sub_1E46A5450()
{
  return off_1F40F9688();
}

uint64_t sub_1E46A5460()
{
  return off_1F40F9690();
}

uint64_t sub_1E46A5470()
{
  return off_1F40F96C8();
}

uint64_t sub_1E46A5480()
{
  return off_1F40F96D8();
}

uint64_t sub_1E46A5490()
{
  return off_1F40F97D8();
}

uint64_t sub_1E46A54A0()
{
  return off_1F40F9878();
}

uint64_t sub_1E46A54B0()
{
  return off_1F40F98C0();
}

uint64_t sub_1E46A54C0()
{
  return off_1F40F9A90();
}

uint64_t sub_1E46A54D0()
{
  return off_1F40F9A98();
}

uint64_t sub_1E46A54E0()
{
  return off_1F40F9AB0();
}

uint64_t sub_1E46A54F0()
{
  return off_1F40F9AB8();
}

uint64_t sub_1E46A5500()
{
  return off_1F40F9AD8();
}

uint64_t sub_1E46A5510()
{
  return off_1F40F9B68();
}

uint64_t sub_1E46A5520()
{
  return off_1F40F9C80();
}

uint64_t sub_1E46A5530()
{
  return off_1F40F9C98();
}

uint64_t sub_1E46A5540()
{
  return off_1F40F9CE8();
}

uint64_t sub_1E46A5550()
{
  return off_1F40F9DD0();
}

uint64_t sub_1E46A5560()
{
  return off_1F40F9E10();
}

uint64_t sub_1E46A5570()
{
  return off_1F40F9FA8();
}

uint64_t sub_1E46A5580()
{
  return off_1F40FA140();
}

uint64_t sub_1E46A5590()
{
  return off_1F40FA150();
}

uint64_t sub_1E46A55A0()
{
  return off_1F40FA1A8();
}

uint64_t sub_1E46A55B0()
{
  return off_1F40FA220();
}

uint64_t sub_1E46A55C0()
{
  return off_1F40FA230();
}

uint64_t sub_1E46A55D0()
{
  return off_1F40FA288();
}

uint64_t sub_1E46A55E0()
{
  return off_1F40FA298();
}

uint64_t sub_1E46A55F0()
{
  return off_1F40FA440();
}

uint64_t sub_1E46A5600()
{
  return off_1F40FA448();
}

uint64_t sub_1E46A5610()
{
  return aSfstorebuttoni();
}

uint64_t sub_1E46A5620()
{
  return (*(&aSfstorebuttoni + 1))();
}

uint64_t sub_1E46A5630()
{
  return off_1F40FA5A0();
}

uint64_t sub_1E46A5640()
{
  return off_1F40FA5A8();
}

uint64_t sub_1E46A5650()
{
  return off_1F40FA5B8();
}

uint64_t sub_1E46A5660()
{
  return aShouldopenappa_0();
}

uint64_t sub_1E46A5670()
{
  return (*(uint64_t (**)(void))&aInitiallyvisib_2[16])();
}

uint64_t sub_1E46A5680()
{
  return (*(uint64_t (**)(void))&aInitiallyvisib_2[24])();
}

uint64_t sub_1E46A5690()
{
  return off_1F40FAB18();
}

uint64_t sub_1E46A56B0()
{
  return off_1F40FAB38();
}

uint64_t sub_1E46A56C0()
{
  return off_1F40FAB48();
}

uint64_t sub_1E46A56D0()
{
  return off_1F40FAB58();
}

uint64_t sub_1E46A56F0()
{
  return off_1F40FAB80();
}

uint64_t sub_1E46A5700()
{
  return aNitiallyvisibl();
}

uint64_t sub_1E46A5710()
{
  return off_1F40FADC0();
}

uint64_t sub_1E46A5720()
{
  return off_1F40FADD8();
}

uint64_t sub_1E46A5730()
{
  return off_1F40FADE0();
}

uint64_t sub_1E46A5740()
{
  return off_1F40FADF8();
}

uint64_t sub_1E46A5750()
{
  return off_1F40FAE18();
}

uint64_t sub_1E46A5760()
{
  return off_1F40FAE68();
}

uint64_t sub_1E46A5770()
{
  return off_1F40FB000();
}

uint64_t sub_1E46A5780()
{
  return off_1F40FB1E0();
}

uint64_t sub_1E46A5790()
{
  return off_1F40FB558();
}

uint64_t sub_1E46A57A0()
{
  return off_1F40FB580();
}

uint64_t sub_1E46A57B0()
{
  return off_1F40FB5D0();
}

uint64_t sub_1E46A57C0()
{
  return off_1F40FB5D8();
}

uint64_t sub_1E46A57D0()
{
  return aRidstyleB1();
}

uint64_t sub_1E46A57E0()
{
  return aGridstyle_1();
}

uint64_t sub_1E46A57F0()
{
  return off_1F40FB6C8();
}

uint64_t sub_1E46A5800()
{
  return aOlling();
}

uint64_t sub_1E46A5810()
{
  return off_1F40FB920();
}

uint64_t sub_1E46A5820()
{
  return off_1F40FBA88();
}

uint64_t sub_1E46A5830()
{
  return off_1F40FBC40();
}

uint64_t sub_1E46A5840()
{
  return (*(uint64_t (**)(void))&sel_setFileProviderIdentifier_[8])();
}

uint64_t sub_1E46A5850()
{
  return off_1F40FC028();
}

uint64_t sub_1E46A5860()
{
  return off_1F40FC108();
}

uint64_t sub_1E46A5870()
{
  return off_1F40FC140();
}

uint64_t sub_1E46A5880()
{
  return aShouldrevealfi_0();
}

uint64_t sub_1E46A5890()
{
  return off_1F40FC2E0();
}

uint64_t sub_1E46A58A0()
{
  return off_1F40FC368();
}

uint64_t sub_1E46A58B0()
{
  return off_1F40FC450();
}

uint64_t sub_1E46A58C0()
{
  return off_1F40FC530();
}

uint64_t sub_1E46A58D0()
{
  return off_1F40FC550();
}

uint64_t sub_1E46A58E0()
{
  return aClipidentifier_0();
}

uint64_t sub_1E46A58F0()
{
  return off_1F40FC5D0();
}

uint64_t sub_1E46A5900()
{
  return off_1F40FC5E8();
}

uint64_t sub_1E46A5910()
{
  return off_1F40FC620();
}

uint64_t sub_1E46A5920()
{
  return off_1F40FC6F0();
}

uint64_t sub_1E46A5930()
{
  return (*(uint64_t (**)(void))&aTNsstringCNVCl_1[8])();
}

uint64_t sub_1E46A5940()
{
  return (*(uint64_t (**)(void))&aTNsstringCNVCl_1[16])();
}

uint64_t sub_1E46A5950()
{
  return (*(uint64_t (**)(void))&aTNsstringCNVCl_1[32])();
}

uint64_t sub_1E46A5960()
{
  return off_1F40FC760();
}

uint64_t sub_1E46A5970()
{
  return off_1F40FC790();
}

#error "1E46A598C: call analysis failed (funcsize=3)"

uint64_t sub_1E46A5990()
{
  return off_1F40FC910();
}

uint64_t sub_1E46A59A0()
{
  return off_1F40FC920();
}

uint64_t sub_1E46A59B0()
{
  return off_1F40FC930();
}

uint64_t sub_1E46A59C0()
{
  return off_1F40FC940();
}

uint64_t sub_1E46A59D0()
{
  return off_1F40FC970();
}

uint64_t sub_1E46A59E0()
{
  return off_1F40FC9B8();
}

uint64_t sub_1E46A59F0()
{
  return off_1F40FC9E0();
}

uint64_t sub_1E46A5A00()
{
  return off_1F40FCA20();
}

uint64_t sub_1E46A5A10()
{
  return off_1F40FCA30();
}

uint64_t sub_1E46A5A20()
{
  return aSetsearchinapp();
}

uint64_t sub_1E46A5A30()
{
  return off_1F40FCC30();
}

uint64_t sub_1E46A5A40()
{
  return off_1F40FCD30();
}

uint64_t sub_1E46A5A50()
{
  return MEMORY[0x1F4164438]();
}

uint64_t sub_1E46A5A60()
{
  return MEMORY[0x1F4164440]();
}

uint64_t sub_1E46A5A70()
{
  return MEMORY[0x1F4164520]();
}

uint64_t sub_1E46A5A80()
{
  return MEMORY[0x1F4164530]();
}

uint64_t sub_1E46A5A90()
{
  return MEMORY[0x1F4164558]();
}

uint64_t sub_1E46A5AA0()
{
  return MEMORY[0x1F41645C0]();
}

uint64_t sub_1E46A5AB0()
{
  return MEMORY[0x1F41645E8]();
}

uint64_t sub_1E46A5AC0()
{
  return MEMORY[0x1F41645F8]();
}

uint64_t sub_1E46A5AD0()
{
  return MEMORY[0x1F4164610]();
}

uint64_t sub_1E46A5AE0()
{
  return MEMORY[0x1F4164688]();
}

uint64_t sub_1E46A5AF0()
{
  return MEMORY[0x1F4164690]();
}

uint64_t sub_1E46A5B10()
{
  return MEMORY[0x1F41647D0]();
}

uint64_t sub_1E46A5B20()
{
  return MEMORY[0x1F4164870]();
}

uint64_t sub_1E46A5B30()
{
  return MEMORY[0x1F4164878]();
}

uint64_t sub_1E46A5B50()
{
  return MEMORY[0x1F4164888]();
}

uint64_t sub_1E46A5B60()
{
  return MEMORY[0x1F4164898]();
}

uint64_t sub_1E46A5B70()
{
  return MEMORY[0x1F4164938]();
}

uint64_t sub_1E46A5B80()
{
  return MEMORY[0x1F4164948]();
}

uint64_t sub_1E46A5B90()
{
  return MEMORY[0x1F4164AC8]();
}

uint64_t sub_1E46A5BA0()
{
  return MEMORY[0x1F4164B98]();
}

uint64_t sub_1E46A5BB0()
{
  return MEMORY[0x1F4164E40]();
}

uint64_t sub_1E46A5BC0()
{
  return off_1F40EE560();
}

uint64_t sub_1E46A5BD0()
{
  return off_1F40EE568();
}

uint64_t sub_1E46A5BE0()
{
  return off_1F40EE570();
}

uint64_t sub_1E46A5BF0()
{
  return MEMORY[0x1F41304B0]();
}

uint64_t sub_1E46A5C00()
{
  return MEMORY[0x1F41304B8]();
}

uint64_t sub_1E46A5C10()
{
  return MEMORY[0x1F41304C0]();
}

uint64_t sub_1E46A5C20()
{
  return MEMORY[0x1F41304C8]();
}

uint64_t sub_1E46A5C30()
{
  return MEMORY[0x1F41304D0]();
}

uint64_t sub_1E46A5C50()
{
  return off_1F40EE730();
}

uint64_t sub_1E46A5C60()
{
  return off_1F40EE750();
}

uint64_t sub_1E46A5C70()
{
  return off_1F40EEDB0();
}

uint64_t sub_1E46A5C80()
{
  return aCopyableitem_0();
}

uint64_t sub_1E46A5CA0()
{
  return off_1F40EEE90();
}

uint64_t sub_1E46A5CB0()
{
  return aHeightanchor();
}

uint64_t sub_1E46A5CC0()
{
  return aCenteryanchor();
}

uint64_t sub_1E46A5CD0()
{
  return off_1F40EF3D0();
}

uint64_t sub_1E46A5CE0()
{
  return off_1F40F14C0();
}

uint64_t sub_1E46A5CF0()
{
  return off_1F40F1610();
}

uint64_t sub_1E46A5D00()
{
  return MEMORY[0x1F41304F0]();
}

uint64_t sub_1E46A5D10()
{
  return MEMORY[0x1F41304F8]();
}

uint64_t sub_1E46A5D20()
{
  return off_1F40F17C8();
}

uint64_t sub_1E46A5D30()
{
  return off_1F40F1A28();
}

uint64_t sub_1E46A5D40()
{
  return MEMORY[0x1F410DEE8]();
}

uint64_t sub_1E46A5D50()
{
  return MEMORY[0x1F410DEF0]();
}

uint64_t sub_1E46A5D70()
{
  return MEMORY[0x1F410DE70]();
}

uint64_t sub_1E46A5D80()
{
  return MEMORY[0x1F410DE78]();
}

uint64_t sub_1E46A5D90()
{
  return MEMORY[0x1F415B048]();
}

uint64_t sub_1E46A5DA0()
{
  return MEMORY[0x1F415B050]();
}

uint64_t sub_1E46A5DB0()
{
  return MEMORY[0x1F415B058]();
}

uint64_t sub_1E46A5DC0()
{
  return MEMORY[0x1F415B060]();
}

uint64_t sub_1E46A5DD0()
{
  return MEMORY[0x1F415B068]();
}

uint64_t sub_1E46A5DE0()
{
  return MEMORY[0x1F415B070]();
}

uint64_t sub_1E46A5DF0()
{
  return MEMORY[0x1F415B078]();
}

uint64_t sub_1E46A5E00()
{
  return MEMORY[0x1F415B080]();
}

uint64_t sub_1E46A5E10()
{
  return MEMORY[0x1F415B088]();
}

uint64_t sub_1E46A5E20()
{
  return MEMORY[0x1F415B090]();
}

uint64_t sub_1E46A5E30()
{
  return MEMORY[0x1F415B098]();
}

uint64_t sub_1E46A5E40()
{
  return MEMORY[0x1F415B0A0]();
}

uint64_t sub_1E46A5E50()
{
  return MEMORY[0x1F415B370]();
}

uint64_t sub_1E46A5E60()
{
  return MEMORY[0x1F415B450]();
}

uint64_t sub_1E46A5E70()
{
  return MEMORY[0x1F415B458]();
}

uint64_t sub_1E46A5E80()
{
  return MEMORY[0x1F415B488]();
}

uint64_t sub_1E46A5E90()
{
  return MEMORY[0x1F415B490]();
}

uint64_t sub_1E46A5EA0()
{
  return MEMORY[0x1F415B4A0]();
}

uint64_t sub_1E46A5EB0()
{
  return MEMORY[0x1F415B4C8]();
}

uint64_t sub_1E46A5EC0()
{
  return MEMORY[0x1F415B4D0]();
}

uint64_t sub_1E46A5ED0()
{
  return MEMORY[0x1F416AA20]();
}

uint64_t sub_1E46A5EE0()
{
  return MEMORY[0x1F416AA30]();
}

uint64_t sub_1E46A5EF0()
{
  return MEMORY[0x1F416AA38]();
}

uint64_t sub_1E46A5F00()
{
  return MEMORY[0x1F416AA40]();
}

uint64_t sub_1E46A5F10()
{
  return MEMORY[0x1F416AA48]();
}

uint64_t sub_1E46A5F20()
{
  return MEMORY[0x1F416AA50]();
}

uint64_t sub_1E46A5F30()
{
  return MEMORY[0x1F416AA78]();
}

uint64_t sub_1E46A5F40()
{
  return MEMORY[0x1F416AA80]();
}

uint64_t sub_1E46A5F50()
{
  return MEMORY[0x1F416AA88]();
}

uint64_t sub_1E46A5F60()
{
  return MEMORY[0x1F416AA90]();
}

uint64_t sub_1E46A5F70()
{
  return MEMORY[0x1F416AAA0]();
}

uint64_t sub_1E46A5F80()
{
  return MEMORY[0x1F416AAC0]();
}

uint64_t sub_1E46A5F90()
{
  return MEMORY[0x1F416AAC8]();
}

uint64_t sub_1E46A5FA0()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1E46A5FB0()
{
  return MEMORY[0x1F4183658]();
}

uint64_t sub_1E46A5FC0()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1E46A5FD0()
{
  return off_1F40E60A8();
}

uint64_t sub_1E46A5FE0()
{
  return off_1F40E60F0();
}

uint64_t sub_1E46A5FF0()
{
  return off_1F40E6110();
}

uint64_t sub_1E46A6000()
{
  return off_1F40E6128();
}

uint64_t sub_1E46A6010()
{
  return off_1F40E6130();
}

uint64_t sub_1E46A6020()
{
  return off_1F40E6148();
}

uint64_t sub_1E46A6030()
{
  return off_1F40E6158();
}

uint64_t sub_1E46A6040()
{
  return off_1F40E6190();
}

uint64_t sub_1E46A6050()
{
  return off_1F40E61D8();
}

uint64_t sub_1E46A6060()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1E46A6070()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1E46A6080()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1E46A6090()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1E46A60A0()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1E46A60B0()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1E46A60C0()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1E46A60D0()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1E46A60E0()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1E46A60F0()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1E46A6100()
{
  return off_1F40E6338();
}

uint64_t sub_1E46A6110()
{
  return off_1F40E6370();
}

uint64_t sub_1E46A6120()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1E46A6130()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1E46A6140()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1E46A6150()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1E46A6160()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1E46A6170()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1E46A6180()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1E46A6190()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1E46A61A0()
{
  return MEMORY[0x1F4187CB0]();
}

uint64_t sub_1E46A61B0()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1E46A61C0()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1E46A61E0()
{
  return off_1F40E6490();
}

uint64_t sub_1E46A61F0()
{
  return off_1F40E64A0();
}

uint64_t sub_1E46A6200()
{
  return off_1F40E64A8();
}

uint64_t sub_1E46A6220()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1E46A6230()
{
  return MEMORY[0x1F4184330]();
}

uint64_t sub_1E46A6240()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1E46A6250()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1E46A6260()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1E46A6270()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1E46A6280()
{
  return MEMORY[0x1F4187A30]();
}

uint64_t sub_1E46A6290()
{
  return (*(uint64_t (**)(void))&sel_pathExtension[8])();
}

uint64_t sub_1E46A62A0()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1E46A62B0()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1E46A62C0()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1E46A62D0()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1E46A62E0()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1E46A62F0()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1E46A6300()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1E46A6310()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1E46A6320()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1E46A6340()
{
  return MEMORY[0x1F4184CE0]();
}

uint64_t sub_1E46A6350()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1E46A6360()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1E46A6370()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1E46A6380()
{
  return MEMORY[0x1F4184DE0]();
}

uint64_t sub_1E46A6390()
{
  return MEMORY[0x1F4184DE8]();
}

uint64_t sub_1E46A63A0()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1E46A63B0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1E46A63C0()
{
  return MEMORY[0x1F4184E70]();
}

uint64_t sub_1E46A63D0()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1E46A63E0()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1E46A63F0()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1E46A6400()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1E46A6410()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1E46A6420()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1E46A6430()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1E46A6440()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1E46A6450()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1E46A6460()
{
  return MEMORY[0x1F4185390]();
}

uint64_t sub_1E46A6470()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1E46A6480()
{
  return MEMORY[0x1F4185450]();
}

uint64_t sub_1E46A6490()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1E46A64A0()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1E46A64C0()
{
  return MEMORY[0x1F4185A10]();
}

uint64_t sub_1E46A64D0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1E46A64E0()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1E46A64F0()
{
  return off_1F40E6E30();
}

uint64_t sub_1E46A6500()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1E46A6510()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1E46A6520()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1E46A6530()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1E46A6540()
{
  return MEMORY[0x1F4185E90]();
}

uint64_t sub_1E46A6560()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1E46A6570()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1E46A6580()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1F410C8D0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  aButtontitle();
  return result;
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  off_1F40D7928(theDate);
  return result;
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)off_1F40D7D08();
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return off_1F40D97B0(t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)off_1F40D97D0(retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)off_1F40D9808(data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)sel_isMediaContainer(color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)(*(&aWatchlistbutto + 1))(color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)off_1F40D9AF8();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextRelease(CGContextRef c)
{
}

size_t CGImageGetHeight(CGImageRef image)
{
  return (*(uint64_t (**)(CGImageRef))&sel_contentAdvisory[8])(image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return aSetauxiliarybo(image);
}

void CGImageRelease(CGImageRef image)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return off_1F40DB248((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  aAuxiliarybotto((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  aAuxiliarybotto_0((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  (*(&aAuxiliarybotto_0 + 1))((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  (*(&aAuxiliarybotto_0 + 3))((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  aAuxiliaryalign((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  (*(&aAuxiliaryalign + 2))((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  aHideverticaldi((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  (*(&aHideverticaldi + 1))((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  aTitlealign((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  aThumbnailcropc((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  aSubtitleisemph((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  off_1F40DB5A0(latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CUIKAdjustedColorForColor()
{
  return MEMORY[0x1F410F6B8]();
}

uint64_t DOCContentTypesReadableByApplicationWithBundleIdentifier()
{
  return MEMORY[0x1F4117748]();
}

uint64_t GEOFetchOfflineMapsDownloadURLForSFFlightLeg()
{
  return MEMORY[0x1F411C168]();
}

uint64_t INIntentCreate()
{
  return off_1F40E9AD0();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters)
{
  (*(void (**)(__n128, __n128, double, double))&aUseractivityre_0[16])((__n128)centerCoordinate, *(__n128 *)&centerCoordinate.longitude, latitudinalMeters, longitudinalMeters);
  result.span.longitudeDelta = v6;
  result.span.latitudeDelta = v5;
  result.center.longitude = v4;
  result.center.latitude = v3;
  return result;
}

#error "1E46A67EC: call analysis failed (funcsize=3)"

MKMapRect MKMapRectInset(MKMapRect rect, double dx, double dy)
{
  off_1F40ECE70((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)off_1F40E7010(aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = off_1F40E7140(range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)off_1F40E7280(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)(*(uint64_t (**)(NSUInteger, NSUInteger))&aSfpersonheader[16])(range.location, range.length);
}

uint64_t PUItemProviderForAsset()
{
  return MEMORY[0x1F4144610]();
}

uint64_t SBIconImageInfoMake()
{
  return MEMORY[0x1F415BF28]();
}

uint64_t SBSRequestPasscodeUnlockUI()
{
  return MEMORY[0x1F415C408]();
}

uint64_t SSAppNameForBundleId()
{
  return MEMORY[0x1F415BAC0]();
}

uint64_t SSGetDisabledBundleSet()
{
  return MEMORY[0x1F415BAC8]();
}

uint64_t TLKBiggerSuggestionsLayoutEnabled()
{
  return MEMORY[0x1F4163B80]();
}

uint64_t TLKSnippetModernizationEnabled()
{
  return MEMORY[0x1F4163B88]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x1F4166AF0]();
}

uint64_t UICeilToScale()
{
  return MEMORY[0x1F4166B88]();
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

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1F4166CB8](image, compressionQuality);
}

void UIRectFill(CGRect rect)
{
}

uint64_t WFDataFromSpotlightResultRunnable()
{
  return MEMORY[0x1F4168030]();
}

uint64_t WFSpotlightResultRunnableFromData()
{
  return MEMORY[0x1F4168080]();
}

uint64_t WFTopHitContextualActionTypeForBundleIdentifier()
{
  return MEMORY[0x1F41680B8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)aTqR(aBlock);
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
  return (*(uint64_t (**)(void))&aPlaceholdervis_1[8])();
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
  return unk_1F40CA1E8();
}

uint32_t arc4random(void)
{
  return off_1F40CA3A8();
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

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)OBJC_METACLASS___SKStoreProductViewController_0(flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)off_1F40CBA60(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)off_1F40CBA88();
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
  return (dispatch_queue_attr_t)(*(uint64_t (**)(dispatch_queue_attr_t, dispatch_autorelease_frequency_t))&aSetclientident[8])(attr, frequency);
}

#error "1E46A6B3C: call analysis failed (funcsize=3)"

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)a32081624(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)(*(uint64_t (**)(intptr_t))&sel_willMoveToParentViewController_[8])(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return (*(uint64_t (**)(dispatch_semaphore_t))&sel_willMoveToParentViewController_[24])(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return off_1F40CBC50(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return aSetparentviewc(when, delta);
}

void free(void *a1)
{
}

uint64_t geo_isDayLightForLocation()
{
  return MEMORY[0x1F411C6C8]();
}

size_t malloc_size(const void *ptr)
{
  return aPromptstring(ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)aScrolldetector(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)(*(uint64_t (**)(void *, const void *, size_t))&stru_1F40CCCD8.align)(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)(*(uint64_t (**)(void *, const void *, size_t))&stru_1F40CCCF8.align)(__dst, __src, __len);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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
  return (os_log_t)aDelegate(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return aTqR_0(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return ((uint64_t (*)(os_log_t))stru_1F40CD548.attr)(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return stru_1F40CD558(log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

#error "1E46A70AC: call analysis failed (funcsize=3)"

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  double v4 = (const char *)MEMORY[0x1F4181B08](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

uint64_t rankingPrefetchedAttributesArray()
{
  return MEMORY[0x1F415BAD0]();
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1F41881F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1F4188200]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1F41864F0]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
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