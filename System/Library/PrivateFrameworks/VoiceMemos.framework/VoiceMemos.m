void __RCRecordingsDirectoryURL_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t vars8;

  v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  v1 = [v0 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.VoiceMemos.shared"];

  v2 = [v1 URLByAppendingPathComponent:@"Recordings"];

  v3 = (void *)RCRecordingsDirectoryURL_recordingsDirectory;
  RCRecordingsDirectoryURL_recordingsDirectory = v2;
}

void __RCCloudRecordingsStoreURL_block_invoke()
{
  RCRecordingsDirectoryURL();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 URLByAppendingPathComponent:@"CloudRecordings.db"];
  v1 = (void *)RCCloudRecordingsStoreURL_storeURL;
  RCCloudRecordingsStoreURL_storeURL = v0;
}

id RCRecordingsDirectoryURL()
{
  if (RCRecordingsDirectoryURL_onceToken != -1) {
    dispatch_once(&RCRecordingsDirectoryURL_onceToken, &__block_literal_global_6);
  }
  uint64_t v0 = (void *)RCRecordingsDirectoryURL_recordingsDirectory;
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

uint64_t __Block_byref_object_copy__6(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1C8778060](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
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

uint64_t RCSaveAsNewFeatureFlagIsEnabled()
{
  if (RCSaveAsNewFeatureFlagIsEnabled_onceToken != -1) {
    dispatch_once(&RCSaveAsNewFeatureFlagIsEnabled_onceToken, &__block_literal_global_196);
  }
  return RCSaveAsNewFeatureFlagIsEnabled_saveAsNewEnabled;
}

void _accessActiveCaptureCompositionAVURLs(void *a1)
{
  id v1 = a1;
  if (_accessActiveCaptureCompositionAVURLs_onceToken != -1) {
    dispatch_once(&_accessActiveCaptureCompositionAVURLs_onceToken, &__block_literal_global_296);
  }
  id v2 = _accessActiveCaptureCompositionAVURLs_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___accessActiveCaptureCompositionAVURLs_block_invoke_2;
  block[3] = &unk_1E6496698;
  id v5 = v1;
  id v3 = v1;
  dispatch_sync(v2, block);
}

uint64_t RCOverdubRecordingFeatureFlagIsEnabled()
{
  if (RCOverdubRecordingFeatureFlagIsEnabled_onceToken != -1) {
    dispatch_once(&RCOverdubRecordingFeatureFlagIsEnabled_onceToken, &__block_literal_global_199);
  }
  return RCOverdubRecordingFeatureFlagIsEnabled_enabled;
}

uint64_t RCSupportsDebugAODOverlay()
{
  uint64_t result = RCIsInternalInstall();
  if (result)
  {
    id v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v2 = [v1 BOOLForKey:@"RCDebugAODOverlay"];

    return v2;
  }
  return result;
}

uint64_t RCIsInternalInstall()
{
  if (RCIsInternalInstall_onceToken != -1) {
    dispatch_once(&RCIsInternalInstall_onceToken, &__block_literal_global_0);
  }
  return RCIsInternalInstall_isInternalInstall;
}

id OSLogForCategory(void *a1)
{
  id v1 = a1;
  id v2 = MEMORY[0x1E4F14500];
  if (OSLogForCategory_onceToken == -1)
  {
    if (v1) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&OSLogForCategory_onceToken, &__block_literal_global_10);
    if (v1)
    {
LABEL_3:
      id v3 = [(id)OSLogForCategory_gOSLogDictionary objectForKey:v1];

      if (v3) {
        goto LABEL_15;
      }
      if ((unint64_t)[(id)OSLogForCategory_gOSLogDictionary count] > 0xA)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
LABEL_12:
          id v3 = (void *)MEMORY[0x1E4F14500];
          id v9 = MEMORY[0x1E4F14500];
          goto LABEL_15;
        }
        __int16 v11 = 0;
        v6 = MEMORY[0x1E4F14500];
        v7 = "ERROR | Too many categories defined, use default";
        v8 = (uint8_t *)&v11;
      }
      else
      {
        id v4 = v1;
        os_log_t v5 = os_log_create("com.apple.VoiceMemos", (const char *)[v4 UTF8String]);
        if (v5)
        {
          id v3 = v5;
          [(id)OSLogForCategory_gOSLogDictionary setObject:v5 forKey:v4];
          goto LABEL_15;
        }
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        *(_WORD *)buf = 0;
        v6 = MEMORY[0x1E4F14500];
        v7 = "ERROR | Failed os_log_create, use default";
        v8 = buf;
      }
      _os_log_impl(&dword_1C3964000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      goto LABEL_12;
    }
  }
  id v3 = (void *)MEMORY[0x1E4F14500];
LABEL_15:

  return v3;
}

void sub_1C39676D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C3967A38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 112));
  _Unwind_Resume(a1);
}

void sub_1C3967C0C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1C3967E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3967FD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C396814C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id RCObserveChangesToKeyPath(void *a1, void *a2, void *a3)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5;
  v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  v24[0] = a2;
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a2;
  id v8 = a1;
  id v9 = [v6 arrayWithObjects:v24 count:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __RCObserveChangesToKeyPath_block_invoke;
  v15[3] = &unk_1E6496E78;
  id v16 = v5;
  v17 = &v18;
  id v10 = v5;
  uint64_t v11 = RCObserveChangesToKeyPaths(v8, v9, 3, v15);

  v12 = (void *)v19[5];
  v19[5] = v11;

  id v13 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v13;
}

id RCObserveChangesToKeyPaths(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a4;
  id v10 = objc_opt_new();
  [v10 setObject:v7];
  uint64_t v11 = (void *)[v8 copy];
  [v10 setKeyPaths:v11];

  [v10 setObserver:v9];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v10, *(void *)(*((void *)&v18 + 1) + 8 * i), a3, &__keyPathObserverContext, (void)v18);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }

  return v10;
}

void sub_1C39694E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location,char a26)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

id RCLocalizedDurationWithHiddenComponents(int a1, uint64_t a2, double a3)
{
  uint64_t v5 = 3;
  if ((unint64_t)(a3 / 3600.0)) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 3;
  }
  if (a3 < 60.0) {
    uint64_t v5 = 1;
  }
  if (a1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = +[RCDurationFormatter sharedFormatter];
  id v9 = [v8 stringFromDuration:v7 hideComponentOptions:v6 style:a2 shouldPadMinute:a3];

  return v9;
}

double RCTestSlowMessageServiceSleepAmount()
{
  if (_RCUserDefaultLoadAllTestValues_onceToken != -1) {
    dispatch_once(&_RCUserDefaultLoadAllTestValues_onceToken, &__block_literal_global_222);
  }
  return *(double *)&_RCTestSlowMessageServiceSleepAmount;
}

void sub_1C3969D58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  __destructor_8_s0_s8_s16_s24((uint64_t)va);
  _Unwind_Resume(a1);
}

id __copy_constructor_8_8_s0_s8_s16_s24(void *a1, id *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  id result = a2[3];
  a1[3] = result;
  return result;
}

void sub_1C3969EAC(_Unwind_Exception *a1)
{
  __destructor_8_s0_s8_s16_s24(v1);
  _Unwind_Resume(a1);
}

void __destructor_8_s0_s8_s16_s24(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
}

BOOL RCIsBeingUnitTested()
{
  return NSClassFromString(&cfstr_Xctestcase.isa) != 0;
}

void sub_1C396AEA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C396B0C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_1C396B168(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C396C110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___accessActiveCaptureCompositionAVURLs_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL RCDeviceUnlockedSinceBoot()
{
  return MKBDeviceUnlockedSinceBoot() != 0;
}

uint64_t __OSLogForCategory_block_invoke()
{
  OSLogForCategory_gOSLogDictionary = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:10];
  return MEMORY[0x1F41817F8]();
}

uint64_t __RCIsInternalInstall_block_invoke()
{
  uint64_t result = os_variant_has_internal_ui();
  RCIsInternalInstall_isInternalInstall = result;
  return result;
}

id RCLocalizedPlaybackTime(int a1, uint64_t a2, double a3, double a4)
{
  uint64_t v5 = 3;
  if (a3 < 60.0) {
    uint64_t v5 = 1;
  }
  if (a1) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  return RCLocalizedPlaybackTimeWithMinimumAndHiddenComponents(3uLL, v6, a2, a3, a4);
}

uint64_t ___accessActiveCaptureCompositionAVURLs_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v1 = (void *)_accessActiveCaptureCompositionAVURLs_compositionAVURLs;
  _accessActiveCaptureCompositionAVURLs_compositionAVURLs = v0;

  _accessActiveCaptureCompositionAVURLs_queue = (uint64_t)dispatch_queue_create(0, 0);
  return MEMORY[0x1F41817F8]();
}

uint64_t __RCTranscriptionFeatureFlagIsEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  RCTranscriptionFeatureFlagIsEnabled_transcriptionEnabled = result;
  return result;
}

uint64_t __RCSaveAsNewFeatureFlagIsEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  RCSaveAsNewFeatureFlagIsEnabled_saveAsNewEnabled = result;
  return result;
}

uint64_t __RCOverdubRecordingFeatureFlagIsEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  RCOverdubRecordingFeatureFlagIsEnabled_enabled = result;
  return result;
}

uint64_t RCTranscriptionFeatureFlagIsEnabled()
{
  if (RCTranscriptionFeatureFlagIsEnabled_onceToken != -1) {
    dispatch_once(&RCTranscriptionFeatureFlagIsEnabled_onceToken, &__block_literal_global_192);
  }
  return RCTranscriptionFeatureFlagIsEnabled_transcriptionEnabled;
}

id getChange(void *a1, uint64_t a2)
{
  uint64_t v2 = [a1 objectForKeyedSubscript:a2];
  uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  if (v3 == v2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = v2;
  }
  id v5 = v4;

  return v5;
}

id RCCloudRecordingsStoreURL()
{
  if (RCCloudRecordingsStoreURL_onceToken != -1) {
    dispatch_once(&RCCloudRecordingsStoreURL_onceToken, &__block_literal_global_66);
  }
  uint64_t v0 = (void *)RCCloudRecordingsStoreURL_storeURL;
  return v0;
}

void sub_1C396CE88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id RCLocalizedPlaybackTimeWithMinimumAndHiddenComponents(unint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  unint64_t v7 = (unint64_t)(floor(a5) / 60.0);
  double v8 = fmax(a4, 0.0);
  unint64_t v9 = 2;
  if (v7) {
    unint64_t v9 = 3;
  }
  BOOL v10 = v7 >= 0x3C;
  uint64_t v11 = 4;
  if (v10) {
    unint64_t v9 = 4;
  }
  if (v9 <= a1) {
    unint64_t v9 = a1;
  }
  if (v9 < 4) {
    uint64_t v11 = v9;
  }
  switch(v11)
  {
    case 4:
      id v12 = +[RCDurationFormatter sharedFormatter];
      uint64_t v13 = v12;
      double v14 = v8;
      uint64_t v15 = a2;
      uint64_t v16 = 0;
      goto LABEL_16;
    case 3:
      id v12 = +[RCDurationFormatter sharedFormatter];
      uint64_t v13 = v12;
      double v14 = v8;
      uint64_t v15 = a2;
      uint64_t v16 = 2;
      goto LABEL_16;
    case 2:
      id v12 = +[RCDurationFormatter sharedFormatter];
      uint64_t v13 = v12;
      double v14 = v8;
      uint64_t v15 = a2;
      uint64_t v16 = 4;
LABEL_16:
      v17 = [v12 stringFromDuration:v15 hideComponentOptions:v16 style:a3 shouldPadMinute:v14];

      goto LABEL_18;
  }
  v17 = 0;
LABEL_18:
  return v17;
}

void __RCObserveChangesToKeyPath_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*a5)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    double v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
  }
}

void sub_1C396DCC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C396DE2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C396DEB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C396E074(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _checkCanAppend(RCWaveformGenerator *a1, objc_selector *a2)
{
  uint64_t v3 = a1;
  if (!v3)
  {
    uint64_t v4 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _checkCanAppend(RCWaveformGenerator *__strong, SEL)");
    id v5 = (void *)v4;
    uint64_t v6 = @"<Unknown Function>";
    if (v4) {
      uint64_t v6 = (__CFString *)v4;
    }
    uint64_t v7 = v6;

    uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/VoiceMemos_Framework/Framework/Waveform/RCWaveformGenerator.mm"];
    unint64_t v9 = (void *)v8;
    BOOL v10 = @"<Unknown File>";
    if (v8) {
      BOOL v10 = (__CFString *)v8;
    }
    uint64_t v11 = v10;

    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v7, v11, 1019, @"invalid parameter", 0, 0, 0, 0, 0);
  }
  unint64_t v13 = [(RCWaveformGenerator *)v3 state];
  unint64_t v14 = v13;
  if (v13 == 3 || !v13) {
    _assertInvalidStateMessage(&cfstr_LoadingSamples.isa, v13, a2);
  }
  if (v14) {
    BOOL v15 = v14 == 3;
  }
  else {
    BOOL v15 = 1;
  }
  uint64_t v16 = !v15;

  return v16;
}

void sub_1C396E288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C396E31C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C396E418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C396E4A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C396E5A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _assertInvalidStateMessage(NSString *a1, unint64_t a2, objc_selector *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  uint64_t v6 = OSLogForCategory(@"Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = NSStringFromSelector((SEL)a3);
    uint64_t v8 = (void *)v7;
    if (a2 > 3) {
      unint64_t v9 = @"unknown RCWaveformGeneratorState";
    }
    else {
      unint64_t v9 = off_1E64962B8[a2];
    }
    int v10 = 136315906;
    uint64_t v11 = "_assertInvalidStateMessage";
    __int16 v12 = 2112;
    unint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    v17 = v9;
    _os_log_error_impl(&dword_1C3964000, v6, OS_LOG_TYPE_ERROR, "%s -- WARNING: %@ (%@) is disallowed when generator state is '%@'  ignoring, instead of asserting.", (uint8_t *)&v10, 0x2Au);
  }
}

void sub_1C396EACC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C396EB50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C396F1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  _Unwind_Resume(a1);
}

void sub_1C396F464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C396F634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C396F78C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C396F9B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C396FB70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C39702A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,id a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,id a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,uint64_t a63)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a47, 8);

  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a62, 8);
  _Block_object_dispose(&a66, 8);
  _Block_object_dispose(&a70, 8);

  _Unwind_Resume(a1);
}

void sub_1C397070C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C3970B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1C3970E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_1C3970F7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C3971084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C39711A8(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    *(unsigned char *)(*(void *)(*(void *)(v2 + 48) + 8) + 24) = 0;
    objc_end_catch();
    JUMPOUT(0x1C3971174);
  }
  _Unwind_Resume(a1);
}

void sub_1C3971340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1C39715A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C3971884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C3971E10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C3971E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  int v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)RCWaveformSegmentAccumulator;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_1C3971FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void std::vector<float>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E6495F28, MEMORY[0x1E4FBA1C8]);
}

void sub_1C3972098(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1C3972D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C3972E44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C3972F04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C3972FC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C3973124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C3973214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C39732B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C3973334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C39734E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C3973788(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C3973B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1C3973DF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C3974074(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C39742EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C3974454(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C3974804(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C3974AD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C3974DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1C3974FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1C3975A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3976004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3976178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3976530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C397672C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3976910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3976D54(_Unwind_Exception *a1)
{
}

void sub_1C3976D60(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x1C3976D6CLL);
}

void sub_1C3976EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39770E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39773A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3977674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3977854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3977AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3977FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39788F0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1C3979A20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t block, uint64_t a17, void (*a18)(uint64_t a1), void *a19, id a20)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    block = MEMORY[0x1E4F143A8];
    a17 = 3221225472;
    a18 = __130__RCSavedRecordingsModel__importImportableRecordingWithAudioAsset_name_date_uniqueID_presetName_outputFileType_completionHandler___block_invoke_102;
    a19 = &unk_1E6496698;
    a20 = v20;
    dispatch_async(MEMORY[0x1E4F14428], &block);

    objc_end_catch();
    JUMPOUT(0x1C39799A4);
  }
  _Unwind_Resume(a1);
}

void sub_1C397A480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C397A8A0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1C397AA74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C397AD18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C397AE9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C397C708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C397DAE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1C397E024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C397E3AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C397E648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C397E930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C397EC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C397EF14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C397F144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C397F2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C397F64C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1C397F8D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __isUniqueMusicMemo_block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) recordingsWithUniqueID:*(void *)(a1 + 40)];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        if ((objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "musicMemo", (void)v7) & 1) == 0)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_7(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

BOOL RCShouldSendAnalyticsEventForKey(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:v1];

  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  if (!v3)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v5 setObject:v4 forKey:v1];
    goto LABEL_5;
  }
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v3 sinceDate:86400.0];
  uint64_t v6 = [v4 compare:v5];
  BOOL v7 = v6 == 1;
  if (v6 == 1)
  {
    long long v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v8 setObject:v4 forKey:v1];

LABEL_5:
    BOOL v7 = 1;
  }

  return v7;
}

void sub_1C39815D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C3981870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void migrateBackupExclusionFlag(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v15 = 0;
  uint64_t v2 = *MEMORY[0x1E4F1C630];
  id v14 = 0;
  int v3 = [v1 getResourceValue:&v15 forKey:v2 error:&v14];
  id v4 = v15;
  id v5 = v14;
  if (v3 && [v4 BOOLValue])
  {
    uint64_t v6 = *MEMORY[0x1E4F1CE10];
    id v13 = v5;
    char v7 = [v1 setResourceValue:MEMORY[0x1E4F1CC28] forKey:v2 error:&v13];
    id v8 = v13;

    if ((v7 & 1) == 0)
    {
      uint64_t v9 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "migrateBackupExclusionFlag";
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_impl(&dword_1C3964000, v9, OS_LOG_TYPE_DEFAULT, "%s -- ERROR clearing old exclusion flag: %@", buf, 0x16u);
      }
    }
    id v12 = v8;
    char v10 = [v1 setResourceValue:MEMORY[0x1E4F1CC38] forKey:v6 error:&v12];
    id v5 = v12;

    if ((v10 & 1) == 0)
    {
      uint64_t v11 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "migrateBackupExclusionFlag";
        __int16 v18 = 2112;
        id v19 = v5;
        _os_log_impl(&dword_1C3964000, v11, OS_LOG_TYPE_DEFAULT, "%s -- ERROR setting new exclusion flag: %@", buf, 0x16u);
      }
    }
  }
}

void sub_1C3984644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __RCMusicMemosKeys_block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"musicMemoStarRating", @"musicMemoTags", @"musicMemoTextNote", 0);
  uint64_t v1 = RCMusicMemosKeys_musicMemosKeys;
  RCMusicMemosKeys_musicMemosKeys = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id RCGetAudioConfiguration@<X0>(int a1@<W0>, int a2@<W1>, void *a3@<X8>)
{
  uint64_t v4 = 12;
  if (a2) {
    uint64_t v4 = 131084;
  }
  if (a1) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0x10000;
  }
  uint64_t v6 = a1 ^ 1u;
  char v7 = (id *)MEMORY[0x1E4F14F90];
  if (!a1) {
    char v7 = (id *)MEMORY[0x1E4F14F98];
  }
  id v8 = *v7;
  id result = (id)*MEMORY[0x1E4F15050];
  *a3 = v8;
  a3[1] = result;
  a3[2] = v5;
  a3[3] = v6;
  return result;
}

void sub_1C3985B24(_Unwind_Exception *a1)
{
  __destructor_8_s0_s8(v1);
  _Unwind_Resume(a1);
}

void __destructor_8_s0_s8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
}

void sub_1C398706C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C3987394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3988400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL RCTimeRangeContainsRange(double a1, double a2, double a3, double a4)
{
  return a2 >= a4 && a1 <= a3;
}

BOOL RCTimeRangeContainsTime(double a1, double a2, double a3)
{
  return a2 >= a3 && a1 <= a3;
}

BOOL RCTimeRangeIntersectsRange(double a1, double a2, double a3, double a4)
{
  return a3 <= a2 && a1 <= a4;
}

BOOL RCTimeRangeEqualToTimeRange(double a1, double a2, double a3, double a4)
{
  BOOL v4 = vabdd_f64(a1, a3) <= 0.00000011920929;
  return vabdd_f64(a2, a4) <= 0.00000011920929 && v4;
}

double RCTimeRangeByConvertingToValidRange(double a1, double a2, double a3)
{
  double v3 = fabs(a2 + 1.79769313e308);
  if (fabs(a1 + -1.79769313e308) > 0.00000011920929 || v3 > 0.00000011920929)
  {
    double v5 = fabs(a2 + -1.79769313e308);
    if (fabs(a1 + 1.79769313e308) > 0.00000011920929 || v5 > 0.00000011920929) {
      return a1;
    }
  }
  return a3;
}

double RCTimeRangeDelta(double a1, double a2)
{
  double v2 = a2 - a1;
  double v3 = __exp10(4.0);
  float v4 = v2 * v3;
  return roundf(v4) / v3;
}

double RCTimeRangeDeltaWithFractionalPrecision(uint64_t a1, double a2, double a3)
{
  double v3 = a3 - a2;
  if (a1 >= 1)
  {
    double v4 = __exp10((double)a1);
    float v5 = v3 * v4;
    return roundf(v5) / v4;
  }
  return v3;
}

double RCTimeRangeGetMidTime(double a1, double a2)
{
  double v3 = a2 - a1;
  double v4 = __exp10(4.0);
  float v5 = v3 * v4;
  return a1 + roundf(v5) / v4 * 0.5;
}

double RCTimeRangeDeltaWithUIPrecision(double a1, double a2)
{
  double v2 = a2 - a1;
  double v3 = __exp10(4.0);
  float v4 = v2 * v3;
  return roundf(v4) / v3;
}

double RCTimeRangeDeltaWithExactPrecision(double a1, double a2)
{
  return a2 - a1;
}

double RCTimeRangeConstrainTime(double result, double a2, double a3)
{
  if (a2 >= a3) {
    a2 = a3;
  }
  if (result < a2) {
    return a2;
  }
  return result;
}

double RCTimeRangeShift(double a1, double a2, double a3)
{
  return a1 + a3;
}

double RCTimeRangeInset(double a1, double a2, double a3)
{
  return a1 + a3;
}

double RCTimeRangeIntersectTimeRange(double result, double a2, double a3, double a4)
{
  if (result < a3) {
    id result = a3;
  }
  if (a2 >= a4) {
    a2 = a4;
  }
  if (a2 < result) {
    return 1.79769313e308;
  }
  return result;
}

id NSStringFromRCTimeRange(double a1, double a2)
{
  uint64_t v7 = 0;
  if (a2 == 1.79769313e308)
  {
    double v3 = @"MAX";
  }
  else if (a2 == -1.79769313e308)
  {
    double v3 = @"-MAX";
  }
  else
  {
    _RCTimeRangeTimeDescription(&v7, a2);
    double v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (a1 == 1.79769313e308)
  {
    float v4 = @"MAX";
  }
  else if (a1 == -1.79769313e308)
  {
    float v4 = @"-MAX";
  }
  else
  {
    _RCTimeRangeTimeDescription(&v7, a1);
    float v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  float v5 = [NSString stringWithFormat:@"[%@ - %@]", v4, v3];

  return v5;
}

id _RCTimeRangeTimeDescription(void *a1, double a2)
{
  int v2 = (int)a2;
  double v3 = a2 - (double)(60 * ((int)a2 / 60));
  uint64_t v4 = (v2 / 3600);
  uint64_t v5 = (v2 / 60 - 60 * v4);
  if (v2 > 3599)
  {
    if (!a1) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (!a1)
  {
    if ((int)v5 <= 0) {
      goto LABEL_17;
    }
LABEL_16:
    objc_msgSend(NSString, "stringWithFormat:", @"%02d:%05.2f", v5, *(void *)&v3, v10);
    goto LABEL_18;
  }
  if (*a1 == 3)
  {
LABEL_6:
    *a1 = 3;
LABEL_7:
    objc_msgSend(NSString, "stringWithFormat:", @"%02d:%02d:%05.2f", v4, v5, *(void *)&v3);
    goto LABEL_18;
  }
  if ((int)v5 > 0 || *a1 == 2)
  {
    *a1 = 2;
    goto LABEL_16;
  }
  *a1 = 1;
LABEL_17:
  objc_msgSend(NSString, "stringWithFormat:", @"%g", *(void *)&v3, v9, v10);
  uint64_t v7 = LABEL_18:;
  return v7;
}

void RCTimeRangeEncodeWithKey(void *a1, void *a2, double a3, double a4)
{
  id v7 = a2;
  id v8 = a1;
  uint64_t v9 = [v7 stringByAppendingString:@".beginTime"];
  [v8 encodeDouble:v9 forKey:a3];

  id v10 = [v7 stringByAppendingString:@".endTime"];

  [v8 encodeDouble:v10 forKey:a4];
}

double RCTimeRangeDecodeWithKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = [v3 stringByAppendingString:@".beginTime"];
  [v4 decodeDoubleForKey:v5];
  double v7 = v6;

  id v8 = [v3 stringByAppendingString:@".endTime"];

  [v4 decodeDoubleForKey:v8];
  return v7;
}

CMTimeRange *CMTimeRangeFromRCTimeRange@<X0>(CMTimeRange *a1@<X8>, Float64 a2@<D0>, double a3@<D1>)
{
  CMTimeMakeWithSeconds(&start, a2, kCMDefaultTimeScale);
  double v6 = __exp10(4.0);
  float v7 = (a3 - a2) * v6;
  CMTimeMakeWithSeconds(&v9, roundf(v7) / v6, kCMDefaultTimeScale);
  return CMTimeRangeMake(a1, &start, &v9);
}

double RCTimeRangeFromCMTimeRange(uint64_t a1)
{
  CMTime v4 = *(CMTime *)a1;
  double Seconds = CMTimeGetSeconds(&v4);
  CMTime v4 = *(CMTime *)(a1 + 24);
  CMTimeGetSeconds(&v4);
  return Seconds;
}

id _hiddenComponentStringWithString(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F28E78];
  id v2 = a1;
  id v3 = [v1 string];
  uint64_t v4 = [v2 length];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___hiddenComponentStringWithString_block_invoke;
  v8[3] = &unk_1E6496D60;
  id v9 = v3;
  id v5 = v3;
  objc_msgSend(v2, "enumerateSubstringsInRange:options:usingBlock:", 0, v4, 2, v8);

  double v6 = (void *)[v5 copy];
  return v6;
}

__CFString *NSStringFromRCDurationFormattingStyle(unint64_t a1)
{
  if (a1 > 4) {
    return @"RCDurationFormattingStyle_???";
  }
  else {
    return off_1E6496D98[a1];
  }
}

uint64_t ___hiddenComponentStringWithString_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendString:@"−"];
}

void sub_1C3989664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 248), 8);
  _Block_object_dispose((const void *)(v30 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1C3989C90(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  if (a2 == 1)
  {
    id v16 = objc_begin_catch(a1);
    uint64_t v17 = *(void *)(v12 + 48);
    __int16 v18 = RCGenericError();
    (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v18);

    objc_end_catch();
    JUMPOUT(0x1C3989C6CLL);
  }
  _Unwind_Resume(a1);
}

id RCGenericError()
{
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.VoiceMemos.ErrorDomain" code:-1 userInfo:0];
  return v0;
}

id RCErrorWithTypeAndDescription(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F28C58];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = v4;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  float v7 = (void *)[v5 initWithDomain:@"com.apple.VoiceMemos.ErrorDomain" code:a1 userInfo:v6];
  return v7;
}

id RCGenericErrorWithUnderlyingError(void *a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    uint64_t v6 = *MEMORY[0x1E4F28A50];
    v7[0] = v1;
    id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  else
  {
    id v3 = 0;
  }
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.VoiceMemos.ErrorDomain" code:-1 userInfo:v3];

  return v4;
}

double RCNormalizedDecibelValue(float a1)
{
  return __exp10f(a1 / 12.0);
}

long double RCScalarDecibelValue(float a1)
{
  return log10(a1) * 12.0;
}

BOOL RCFloatsAlmostEqual(float a1, float a2)
{
  return vabds_f32(a1, a2) < 0.01;
}

BOOL RCEqualFloatsWithTolerance(float a1, float a2, float a3)
{
  return vabds_f32(a1, a2) < a3;
}

id RCLocalizedDuration(double a1)
{
  return RCLocalizedDurationWithHiddenComponents(0, 0, a1);
}

id RCLocalizedRecordingDateWithOptions(void *a1, unint64_t a2)
{
  id v3 = a1;
  if (a2 <= 1) {
    char v4 = 1;
  }
  else {
    char v4 = a2;
  }
  if ((~v4 & 3) != 0)
  {
    if (v4)
    {
      id v5 = (void *)RCLocalizedRecordingDateWithOptions___timeFormatter;
      if (!RCLocalizedRecordingDateWithOptions___timeFormatter)
      {
        id v11 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        uint64_t v12 = (void *)RCLocalizedRecordingDateWithOptions___timeFormatter;
        RCLocalizedRecordingDateWithOptions___timeFormatter = (uint64_t)v11;

        [(id)RCLocalizedRecordingDateWithOptions___timeFormatter setDateStyle:0];
        [(id)RCLocalizedRecordingDateWithOptions___timeFormatter setTimeStyle:1];
        id v5 = (void *)RCLocalizedRecordingDateWithOptions___timeFormatter;
      }
    }
    else
    {
      if ((v4 & 2) == 0)
      {
        id v8 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString * _Nonnull RCLocalizedRecordingDateWithOptions(NSDate *__strong _Nonnull, RCDateFormatOptions)");
        [v8 handleFailureInFunction:v9 file:@"RCUtilities.m" lineNumber:167 description:@"must supply either time or day"];

        id v10 = 0;
        goto LABEL_15;
      }
      id v5 = (void *)RCLocalizedRecordingDateWithOptions___dateFormatter;
      if (!RCLocalizedRecordingDateWithOptions___dateFormatter)
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        id v14 = (void *)RCLocalizedRecordingDateWithOptions___dateFormatter;
        RCLocalizedRecordingDateWithOptions___dateFormatter = (uint64_t)v13;

        [(id)RCLocalizedRecordingDateWithOptions___dateFormatter setDateStyle:1];
        [(id)RCLocalizedRecordingDateWithOptions___dateFormatter setTimeStyle:0];
        id v5 = (void *)RCLocalizedRecordingDateWithOptions___dateFormatter;
      }
    }
  }
  else
  {
    id v5 = (void *)RCLocalizedRecordingDateWithOptions___dateAndTimeFormatter;
    if (!RCLocalizedRecordingDateWithOptions___dateAndTimeFormatter)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      float v7 = (void *)RCLocalizedRecordingDateWithOptions___dateAndTimeFormatter;
      RCLocalizedRecordingDateWithOptions___dateAndTimeFormatter = (uint64_t)v6;

      [(id)RCLocalizedRecordingDateWithOptions___dateAndTimeFormatter setDateStyle:1];
      [(id)RCLocalizedRecordingDateWithOptions___dateAndTimeFormatter setTimeStyle:1];
      id v5 = (void *)RCLocalizedRecordingDateWithOptions___dateAndTimeFormatter;
    }
  }
  id v8 = [v5 stringFromDate:v3];
  id v10 = RCDisplayStringForString(v8);
LABEL_15:

  return v10;
}

id RCLocalizedPlaybackTimeWithMinimumComponents(unint64_t a1, uint64_t a2, double a3, double a4)
{
  return RCLocalizedPlaybackTimeWithMinimumAndHiddenComponents(a1, 0, a2, a3, a4);
}

id RCLocalizedInteger(uint64_t a1, int a2)
{
  if (a2 == 2)
  {
    if (__locStringInt2W_onceToken != -1) {
      dispatch_once(&__locStringInt2W_onceToken, &__block_literal_global_216);
    }
    char v4 = (void *)__locStringInt2W_paddedNumberFormatter;
    goto LABEL_9;
  }
  if (a2 == 1)
  {
    if (__locStringInt1W_onceToken != -1) {
      dispatch_once(&__locStringInt1W_onceToken, &__block_literal_global_214);
    }
    char v4 = (void *)__locStringInt1W_paddedNumberFormatter;
LABEL_9:
    id v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:a1];
    id v6 = [v4 stringFromNumber:v5];
    goto LABEL_13;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  id v5 = v7;
  if (a2 >= 1) {
    [v7 setMinimumIntegerDigits:a2];
  }
  id v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:a1];
  id v6 = [v5 stringFromNumber:v8];

LABEL_13:
  return v6;
}

id RCLocalizedFrameworkString(void *a1)
{
  id v1 = (void *)MEMORY[0x1E4F28B50];
  id v2 = a1;
  id v3 = [v1 bundleWithIdentifier:@"com.apple.VoiceMemos.framework"];
  char v4 = [v3 localizedStringForKey:v2 value:0 table:0];

  return v4;
}

id RCDebugStringForTimeInterval(double a1)
{
  return RCLocalizedPlaybackTimeWithMinimumAndHiddenComponents(3uLL, 0, 1, a1, a1);
}

uint64_t RCNumberOfDigitsInInteger(uint64_t a1)
{
  if (!a1) {
    return 1;
  }
  if (a1 >= 0) {
    uint64_t v1 = a1;
  }
  else {
    uint64_t v1 = -a1;
  }
  id v2 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v1);
  uint64_t v3 = [v2 length];

  return v3;
}

uint64_t RCAvailableDiskSpaceForRecording()
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int64_t valuePtr = 0;
  CFDictionaryRef v0 = (const __CFDictionary *)MGCopyAnswer();
  if (!v0)
  {
    uint64_t v3 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      RCAvailableDiskSpaceForRecording_cold_2(v3, v4, v5, v6, v7, v8, v9, v10);
    }

    goto LABEL_11;
  }
  CFDictionaryRef v1 = v0;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v0, (const void *)*MEMORY[0x1E4FBA0D8]);
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
  }
  else
  {
    id v11 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      RCAvailableDiskSpaceForRecording_cold_3(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  CFRelease(v1);
  int64_t v19 = valuePtr;
  if (!valuePtr)
  {
LABEL_11:
    memset(&v32, 0, 512);
    id v20 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Media"];
    int v21 = statfs((const char *)[v20 fileSystemRepresentation], &v32);

    if (v21)
    {
      v22 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        RCAvailableDiskSpaceForRecording_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);
      }

      int64_t v19 = valuePtr;
    }
    else
    {
      int64_t v19 = v32.f_bavail * v32.f_bsize;
    }
  }
  return (uint64_t)fmax((double)(v19 / 2) + -5242880.0, 0.0);
}

BOOL RCHasEnoughDiskSpaceToRecord()
{
  uint64_t v0 = RCAvailableDiskSpaceForRecording();
  if (v0 < 5242880)
  {
    CFDictionaryRef v1 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      RCHasEnoughDiskSpaceToRecord_cold_1(v0, v1);
    }
  }
  return v0 >= 5242880;
}

id RCDiskCacheDirectory()
{
  uint64_t v0 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  CFDictionaryRef v1 = [v0 lastObject];
  id v2 = [v1 stringByAppendingPathComponent:@"com.apple.voicememos"];

  return v2;
}

id RCApplicationSupportDirectory()
{
  uint64_t v0 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  CFDictionaryRef v1 = [v0 lastObject];
  id v2 = [v1 stringByAppendingPathComponent:@"com.apple.voicememos"];

  return v2;
}

uint64_t RCIsVoiceMemosApplication()
{
  uint64_t v0 = [MEMORY[0x1E4F963E8] currentProcess];
  uint64_t v1 = [v0 isApplication];

  return v1;
}

uint64_t RCIsVoiceMemosApplicationInstalled()
{
  uint64_t v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v1 = [v0 applicationIsInstalled:@"com.apple.VoiceMemos"];

  return v1;
}

id RCLegacyRecordingsDirectoryURL()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v1 = NSString;
  v6[0] = CPSharedResourcesDirectory();
  v6[1] = @"Library";
  v6[2] = @"Recordings";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  uint64_t v3 = [v1 pathWithComponents:v2];
  uint64_t v4 = [v0 fileURLWithPath:v3];

  return v4;
}

id RCLibraryRecordingsDirectoryURL()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v1 = NSString;
  v6[0] = CPSharedResourcesDirectory();
  v6[1] = @"Media";
  v6[2] = @"Recordings";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  uint64_t v3 = [v1 pathWithComponents:v2];
  uint64_t v4 = [v0 fileURLWithPath:v3];

  return v4;
}

id RCStockRecordingsURL()
{
  uint64_t v0 = RCLibraryRecordingsDirectoryURL();
  uint64_t v1 = [v0 URLByDeletingLastPathComponent];
  id v2 = [v1 URLByAppendingPathComponent:@"StockRecordings"];

  return v2;
}

id RCLogsDirectoryURL()
{
  void v6[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v1 = NSString;
  v6[0] = CPSharedResourcesDirectory();
  v6[1] = @"Library";
  v6[2] = @"Logs";
  v6[3] = @"com.apple.voicememos";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  uint64_t v3 = [v1 pathWithComponents:v2];
  uint64_t v4 = [v0 fileURLWithPath:v3];

  return v4;
}

void RCDispatchNoSoonerThan(void *a1, void *a2, void *a3)
{
  queue = a2;
  id v5 = a3;
  [a1 timeIntervalSinceReferenceDate];
  double v7 = v6;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v9 = v7 - v8;
  if (v9 <= 0.0)
  {
    dispatch_async(queue, v5);
  }
  else
  {
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
    dispatch_after(v10, queue, v5);
  }
}

id RCComputeFileDigest(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  double v6 = a3;
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:32];
  if (v6 && v6[2](v6, v5, v7))
  {
    id v8 = v7;
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x8810000000;
    uint64_t v18 = &unk_1C39BBAE7;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v25 = 0;
    double v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v5 options:1 error:a2];
    if (v9)
    {
      CC_SHA256_Init((CC_SHA256_CTX *)(v16 + 4));
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __RCComputeFileDigest_block_invoke;
      v14[3] = &unk_1E6496EA0;
      v14[4] = &v15;
      [v9 enumerateByteRangesUsingBlock:v14];
      id v10 = v7;
      id v11 = (unsigned __int8 *)[v10 mutableBytes];
      CC_SHA256_Final(v11, (CC_SHA256_CTX *)(v16 + 4));
      id v8 = v10;
    }
    else
    {
      uint64_t v12 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        RCComputeFileDigest_cold_1((uint64_t)v5, v12);
      }

      id v8 = 0;
    }

    _Block_object_dispose(&v15, 8);
  }

  return v8;
}

void sub_1C398B250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __RCComputeFileDigest_block_invoke(uint64_t a1, const void *a2, int a3, CC_LONG len)
{
  return CC_SHA256_Update((CC_SHA256_CTX *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), a2, len);
}

id RCComputeAudioFileDigest(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1F4188790](a1);
  uint64_t v3 = v2;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  int v4 = open((const char *)[v1 fileSystemRepresentation], 0);
  if (v4 == -1)
  {
    int v6 = *__error();
    if (v6) {
      goto LABEL_46;
    }
    goto LABEL_5;
  }
  int v5 = v4;
  unint64_t v26 = 0;
  memset(&v25, 0, sizeof(v25));
  if (fstat(v4, &v25))
  {
LABEL_3:
    int v6 = *__error();
    goto LABEL_45;
  }
  off_t st_size = v25.st_size;
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  if (st_size < 1) {
    goto LABEL_44;
  }
  off_t v10 = 0;
  *(void *)&long long v9 = 136315394;
  long long v22 = v9;
  while (1)
  {
    ssize_t v11 = read(v5, &v26, 8uLL);
    if (v11 != 8) {
      break;
    }
    int v12 = HIDWORD(v26);
    unint64_t v13 = bswap32(v26);
    int v14 = bswap32(HIDWORD(v26));
    unint64_t v26 = __PAIR64__(v14, v13);
    if (!v10 && v12 != 1887007846)
    {
      int v6 = 5;
      goto LABEL_45;
    }
    unint64_t v23 = 0;
    if (v13 == 1)
    {
      if (read(v5, &v23, 8uLL) != 8) {
        goto LABEL_3;
      }
      unint64_t v13 = bswap64(v23);
      unint64_t v23 = v13;
      int v6 = 5;
      if (v13 < 9 || (uint64_t)v13 >= st_size) {
        goto LABEL_45;
      }
      uint64_t v15 = v13 - 16;
      int v14 = HIDWORD(v26);
    }
    else
    {
      if (!v13) {
        unint64_t v13 = st_size - v10;
      }
      unint64_t v23 = v13;
      uint64_t v15 = v13 - 8;
    }
    v10 += v13;
    if (v14 > 1836019573)
    {
      if (v14 > 1936419183)
      {
        if (v14 != 1936419184)
        {
          int v16 = 2003395685;
          goto LABEL_36;
        }
      }
      else if (v14 != 1836019574)
      {
        int v16 = 1886285684;
LABEL_36:
        if (v14 != v16)
        {
LABEL_37:
          long long v19 = OSLogForCategory(@"VoiceMemosSyncClient");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v22;
            uint64_t v28 = "_mdatAudioDigest";
            __int16 v29 = 1024;
            int v30 = HIDWORD(v26);
            _os_log_error_impl(&dword_1C3964000, v19, OS_LOG_TYPE_ERROR, "%s -- Unknown atom type = 0x%08X", buf, 0x12u);
          }
        }
      }
LABEL_40:
      if (lseek(v5, v10, 0) != v10) {
        goto LABEL_3;
      }
      goto LABEL_41;
    }
    if (v14 == 1718773093 || v14 == 1718909296) {
      goto LABEL_40;
    }
    if (v14 != 1835295092) {
      goto LABEL_37;
    }
    if (v15 >= 1)
    {
      do
      {
        uint64_t v17 = v15 >= 0x2000 ? 0x2000 : v15;
        if (read(v5, data, v17) != v17) {
          goto LABEL_3;
        }
        CC_SHA256_Update(&c, data, v17);
        BOOL v18 = v15 <= v17;
        v15 -= v17;
      }
      while (!v18);
    }
LABEL_41:
    if (v10 >= st_size) {
      goto LABEL_44;
    }
  }
  if (v11) {
    goto LABEL_3;
  }
LABEL_44:
  CC_SHA256_Final(buf, &c);
  int v6 = 0;
LABEL_45:
  close(v5);
  if (!v6)
  {
LABEL_5:
    double v7 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", buf, 32, v22);
    goto LABEL_49;
  }
LABEL_46:
  if (v3)
  {
    id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:v6 userInfo:0];
    double v7 = 0;
    *uint64_t v3 = v20;
  }
  else
  {
    double v7 = 0;
  }
LABEL_49:
  return v7;
}

uint64_t RCIsBeingDebugged()
{
  return 0;
}

uint64_t RCDebugAssertsDisabled()
{
  uint64_t v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"RCDebugAssertsDisabled"];

  return v1;
}

uint64_t RCShouldAssertWarnings()
{
  uint64_t result = RCIsInternalInstall();
  if (result) {
    return RCDebugAssertsDisabled() ^ 1;
  }
  return result;
}

double RCTestSlowMessageExportSeconds()
{
  if (_RCUserDefaultLoadAllTestValues_onceToken != -1) {
    dispatch_once(&_RCUserDefaultLoadAllTestValues_onceToken, &__block_literal_global_222);
  }
  return *(double *)&_RCTestSlowMessageExportSeconds;
}

uint64_t RCTestAlwaysShowLockScreenPlugin()
{
  if (_RCUserDefaultLoadAllTestValues_onceToken != -1) {
    dispatch_once(&_RCUserDefaultLoadAllTestValues_onceToken, &__block_literal_global_222);
  }
  return _RCTestAlwaysShowLockScreenPlugin;
}

uint64_t RCTestResetSyncs()
{
  if (_RCUserDefaultLoadAllTestValues_onceToken != -1) {
    dispatch_once(&_RCUserDefaultLoadAllTestValues_onceToken, &__block_literal_global_222);
  }
  return _RCTestResetSyncs;
}

uint64_t RCTestResetSyncsAlwaysResetSync()
{
  if (_RCUserDefaultLoadAllTestValues_onceToken != -1) {
    dispatch_once(&_RCUserDefaultLoadAllTestValues_onceToken, &__block_literal_global_222);
  }
  return _RCTestResetSyncsAlwaysResetSync;
}

double RCTestBeginPreviewDelay()
{
  if (_RCUserDefaultLoadAllTestValues_onceToken != -1) {
    dispatch_once(&_RCUserDefaultLoadAllTestValues_onceToken, &__block_literal_global_222);
  }
  return *(double *)&_RCTestBeginPreviewDelay;
}

uint64_t RCTestAutoSelectedRecordingIndex()
{
  if (_RCUserDefaultLoadAllTestValues_onceToken != -1) {
    dispatch_once(&_RCUserDefaultLoadAllTestValues_onceToken, &__block_literal_global_222);
  }
  return _RCTestAutoSelectedRecordingIndex;
}

double RCTestResetNavigationStateThresholdSeconds()
{
  if (_RCUserDefaultLoadAllTestValues_onceToken != -1) {
    dispatch_once(&_RCUserDefaultLoadAllTestValues_onceToken, &__block_literal_global_222);
  }
  return *(double *)&_RCTestResetNavigationStateThresholdSeconds;
}

uint64_t RCTestDebugAutolayout_Show()
{
  if (_RCUserDefaultLoadAllTestValues_onceToken != -1) {
    dispatch_once(&_RCUserDefaultLoadAllTestValues_onceToken, &__block_literal_global_222);
  }
  return _RCTestDebugAutolayout_Show;
}

uint64_t RCTestDebugAutolayout_Logging()
{
  if (_RCUserDefaultLoadAllTestValues_onceToken != -1) {
    dispatch_once(&_RCUserDefaultLoadAllTestValues_onceToken, &__block_literal_global_222);
  }
  return _RCTestDebugAutolayout_Logging;
}

uint64_t RCSupportsDebugAODLogs()
{
  uint64_t result = RCIsInternalInstall();
  if (result)
  {
    uint64_t v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v2 = [v1 BOOLForKey:@"RCDebugAODLogs"];

    return v2;
  }
  return result;
}

uint64_t RCRunningInSavedRecordingDaemon()
{
  if (RCRunningInSavedRecordingDaemon_onceToken != -1) {
    dispatch_once(&RCRunningInSavedRecordingDaemon_onceToken, &__block_literal_global_163);
  }
  return RCRunningInSavedRecordingDaemon_runningInDaemon;
}

Class __RCRunningInSavedRecordingDaemon_block_invoke()
{
  Class result = NSClassFromString(&cfstr_Savedrecording_0.isa);
  RCRunningInSavedRecordingDaemon_runningInDaemon = result != 0;
  return result;
}

id RCLocalizationNotNeeded(void *a1)
{
  id v1 = a1;
  return v1;
}

void RCRegisterForFirstUnlockSinceBootCallback(void *a1)
{
  id v1 = a1;
  int out_token = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __RCRegisterForFirstUnlockSinceBootCallback_block_invoke;
  v3[3] = &unk_1E6496EC8;
  id v4 = v1;
  id v2 = v1;
  notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, MEMORY[0x1E4F14428], v3);
}

uint64_t __RCRegisterForFirstUnlockSinceBootCallback_block_invoke(uint64_t a1, int a2)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return notify_cancel(a2);
}

void RCDebugNotification(const char *a1, void *a2)
{
  id v3 = a2;
  int out_token = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __RCDebugNotification_block_invoke;
  v5[3] = &unk_1E6496EC8;
  id v6 = v3;
  id v4 = v3;
  notify_register_dispatch(a1, &out_token, MEMORY[0x1E4F14428], v5);
}

uint64_t __RCDebugNotification_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t isNotNullAndNotNSNull(void *a1)
{
  if (!a1) {
    return 0;
  }
  id v1 = (void *)MEMORY[0x1E4F1CA98];
  id v2 = a1;
  id v3 = [v1 null];
  LODWORD(v1) = [v3 isEqual:v2];

  uint64_t v4 = v1 ^ 1;
  return v4;
}

uint64_t RCUseDevelopmentContainer()
{
  if (RCUseDevelopmentContainer_onceToken != -1) {
    dispatch_once(&RCUseDevelopmentContainer_onceToken, &__block_literal_global_173);
  }
  return RCUseDevelopmentContainer_developmentContainerEnabled;
}

void __RCUseDevelopmentContainer_block_invoke()
{
  if (RCIsInternalInstall())
  {
    id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    RCUseDevelopmentContainer_developmentContainerEnabled = [v0 BOOLForKey:@"RCUseDevelopmentContainer"];
  }
  else
  {
    RCUseDevelopmentContainer_developmentContainerEnabled = 0;
  }
}

id RCNonUserGeneratedDeviceName()
{
  id v0 = (void *)MGCopyAnswer();
  return v0;
}

id RCOperatingSystemVersionString()
{
  id v0 = [MEMORY[0x1E4F28F80] processInfo];
  id v1 = [v0 operatingSystemVersionString];

  return v1;
}

id RCSupportDirectoryForDatabase(void *a1)
{
  id v1 = a1;
  id v2 = [v1 lastPathComponent];
  id v3 = [v2 stringByDeletingPathExtension];
  uint64_t v4 = [v1 URLByDeletingLastPathComponent];

  int v5 = [NSString stringWithFormat:@".%@_SUPPORT", v3];
  id v6 = [v4 URLByAppendingPathComponent:v5];

  return v6;
}

uint64_t RCIsFileNotFoundError(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (!v3)
  {
    uint64_t found = 0;
    goto LABEL_13;
  }
  int v5 = [v3 domain];
  if ([v5 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v6 = [v4 code];

    if (v6 == 4)
    {
      uint64_t found = 1;
      goto LABEL_13;
    }
  }
  else
  {
  }
  id v8 = [v4 domain];
  if ([v8 isEqualToString:*MEMORY[0x1E4F28798]]) {
    BOOL v9 = [v4 code] == 2;
  }
  else {
    BOOL v9 = 0;
  }

  uint64_t found = a2 | v9;
  if (a2 && !v9)
  {
    off_t v10 = [v4 userInfo];
    ssize_t v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
    uint64_t found = RCIsFileNotFoundError(v11, 1);
  }
LABEL_13:

  return found;
}

double VMAudioWriteDelay()
{
  if (VMAudioWriteDelay_onceToken != -1) {
    dispatch_once(&VMAudioWriteDelay_onceToken, &__block_literal_global_182);
  }
  return *(double *)&VMAudioWriteDelay_writeDelay;
}

uint64_t __VMAudioWriteDelay_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  double v1 = 0.0;
  if (result) {
    double v1 = 0.75;
  }
  VMAudioWriteDelay_writeDelay = *(void *)&v1;
  return result;
}

uint64_t RCStereoRecordingIsAvailable()
{
  if (RCStereoRecordingIsAvailable_onceToken != -1) {
    dispatch_once(&RCStereoRecordingIsAvailable_onceToken, &__block_literal_global_187);
  }
  return RCStereoRecordingIsAvailable_stereoRecordingAvailable;
}

uint64_t __RCStereoRecordingIsAvailable_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  RCStereoRecordingIsAvailable_stereoRecordingAvailable = result;
  return result;
}

uint64_t RCOverdubRecordingIsEnabled()
{
  if (RCOverdubRecordingIsEnabled_onceToken != -1) {
    dispatch_once(&RCOverdubRecordingIsEnabled_onceToken, &__block_literal_global_202);
  }
  return RCOverdubRecordingIsEnabled_enabled;
}

void __RCOverdubRecordingIsEnabled_block_invoke()
{
  if (RCOverdubRecordingFeatureFlagIsEnabled_onceToken != -1) {
    dispatch_once(&RCOverdubRecordingFeatureFlagIsEnabled_onceToken, &__block_literal_global_199);
  }
  if (RCOverdubRecordingFeatureFlagIsEnabled_enabled)
  {
    id v2 = (id)MGGetStringAnswer();
    id v0 = +[RCAppGroupStorage sharedInstance];
    if ([v0 enableOverdubForAllDevices]) {
      char v1 = 1;
    }
    else {
      char v1 = [v2 hasPrefix:@"D9"];
    }
    RCOverdubRecordingIsEnabled_enabled = v1;
  }
}

uint64_t RCTranscribeAllAudioTracks()
{
  if (RCTranscribeAllAudioTracks_onceToken != -1) {
    dispatch_once(&RCTranscribeAllAudioTracks_onceToken, &__block_literal_global_211);
  }
  return RCTranscribeAllAudioTracks_enabled;
}

uint64_t __RCTranscribeAllAudioTracks_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  RCTranscribeAllAudioTracks_enabled = result;
  return result;
}

uint64_t RCCatchTranscriptionDecodingError()
{
  uint64_t result = RCIsInternalInstall();
  if (result)
  {
    char v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v2 = [v1 BOOLForKey:@"RCCatchTranscriptionDecodingError"];

    return v2;
  }
  return result;
}

uint64_t ____locStringInt1W_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  char v1 = (void *)__locStringInt1W_paddedNumberFormatter;
  __locStringInt1W_paddedNumberFormatter = (uint64_t)v0;

  uint64_t v2 = (void *)__locStringInt1W_paddedNumberFormatter;
  return [v2 setMinimumIntegerDigits:1];
}

uint64_t ____locStringInt2W_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  char v1 = (void *)__locStringInt2W_paddedNumberFormatter;
  __locStringInt2W_paddedNumberFormatter = (uint64_t)v0;

  uint64_t v2 = (void *)__locStringInt2W_paddedNumberFormatter;
  return [v2 setMinimumIntegerDigits:2];
}

id RCDisplayStringForString(void *a1)
{
  id v1 = a1;
  if (RCDisplayStringForString_onceToken != -1) {
    dispatch_once(&RCDisplayStringForString_onceToken, &__block_literal_global_7);
  }
  if (RCDisplayStringForString_doubleStrings)
  {
    uint64_t v2 = [v1 stringByAppendingString:v1];
    id v3 = (id)[v2 mutableCopy];

    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"@", &stru_1F1F06468, 0, 0, objc_msgSend(v3, "length"));
  }
  else
  {
    id v3 = v1;
  }

  return v3;
}

void __RCDisplayStringForString_block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  RCDisplayStringForString_doubleStrings = [v0 BOOLForKey:@"NSDoubleLocalizedStrings"];
}

id computeAudioDigest(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = (const char *)[v1 fileSystemRepresentation];
  if (audioDigestAttribute_onceToken != -1) {
    dispatch_once(&audioDigestAttribute_onceToken, &__block_literal_global_9);
  }
  if (getxattr(v2, (const char *)audioDigestAttribute__audioDigestAttribute, value, 0x20uLL, 0, 0) == 32)
  {
    id v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:value length:32];
  }
  else
  {
    id v3 = RCComputeAudioFileDigest((uint64_t)v1);
    if (v3)
    {
      uint64_t v4 = (const char *)[v1 fileSystemRepresentation];
      if (audioDigestAttribute_onceToken != -1) {
        dispatch_once(&audioDigestAttribute_onceToken, &__block_literal_global_9);
      }
      int v5 = (const char *)audioDigestAttribute__audioDigestAttribute;
      id v6 = v3;
      setxattr(v4, v5, (const void *)[v6 bytes], 0x20uLL, 0, 0);
      id v7 = v6;
    }
  }
  return v3;
}

BOOL identicalClones(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  int v4 = fsctl((const char *)[a1 fileSystemRepresentation], 0x40104A0EuLL, &v9, 0);
  BOOL v5 = 0;
  if (!v4)
  {
    BOOL v5 = 0;
    if (!fsctl((const char *)[v3 fileSystemRepresentation], 0x40104A0EuLL, &v7, 0))BOOL v5 = (v9 == 2 || v7 == 2) && v10 == v8; {
  }
    }

  return v5;
}

uint64_t isAudioFilePurgeable(void *a1)
{
  uint64_t value = 0;
  id v1 = (const char *)[a1 fileSystemRepresentation];
  if (audioFileFlagsAttribute_onceToken != -1) {
    dispatch_once(&audioFileFlagsAttribute_onceToken, &__block_literal_global_193);
  }
  BOOL v2 = getxattr(v1, (const char *)audioFileFlagsAttribute__audioFileFlagsAttribute, &value, 8uLL, 0, 0) == 8;
  return v2 & value;
}

char *__audioDigestAttribute_block_invoke()
{
  uint64_t result = xattr_name_with_flags("com.apple.voicememos.audioDigest", 2uLL);
  audioDigestAttribute__audioDigestAttribute = (uint64_t)result;
  return result;
}

char *__audioFileFlagsAttribute_block_invoke()
{
  uint64_t result = xattr_name_with_flags("com.apple.voicememos.audioFlags", 4uLL);
  audioFileFlagsAttribute__audioFileFlagsAttribute = (uint64_t)result;
  return result;
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void sub_1C3990140(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C39901D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C3990390(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C39905A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1C399069C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C399071C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C39908BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C39909AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C3990B10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C3990C54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C3990C88()
{
}

void sub_1C3990D2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C3990DF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C3990F5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C3990FEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C39910B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C39911D0(_Unwind_Exception *a1)
{
  BOOL v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1C3991294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C399132C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C39914C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C3991580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C39916AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C3991824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  unint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1C3991930(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C3991A5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1C3991B18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int v12 = v11;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_1C3991BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int v12 = v11;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_1C3991C68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int v12 = v11;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_1C3991CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  ssize_t v11 = v10;

  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1C3991FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39922AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __convertSampleBuffer_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  int v4 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  CFRelease(v4);
}

double PowerMeter::Reset(PowerMeter *this)
{
  *(double *)((char *)&this->mMaxPeak + 6) = 0.0;
  this->mMaxPeak = 0.0;
  *(void *)&double result = 0xFFFFFFFFLL;
  *(void *)&this->mPrevBlockSize = 0xFFFFFFFFLL;
  return result;
}

void PowerMeter::PowerMeter(PowerMeter *this)
{
  this->mSampleRate = 0.0;
  this->mPeakDecay = 0.006;
  this->mDecay = 0.016;
  this->mMaxPeak = 0.0;
  *(double *)((char *)&this->mMaxPeak + 6) = 0.0;
  *(void *)&this->mPrevBlockSize = 0xFFFFFFFFLL;
}

void PowerMeter::SetSampleRate(PowerMeter *this, double a2)
{
  this->mSampleRate = a2;
  double v4 = a2 * 2.5;
  double v5 = 0.0;
  BOOL v6 = a2 * 2.5 < 0.00001;
  long double v7 = 0.0;
  if (!v6) {
    long double v7 = exp(-6.90775528 / v4);
  }
  this->mPeakDecay1 = v7;
  if (a2 * 1.24 >= 0.00001) {
    double v5 = exp(-6.90775528 / (a2 * 1.24));
  }
  this->mDecay1 = v5;
}

void PowerMeter::Process(PowerMeter *this, float *a2, int a3, int a4)
{
  BOOL v6 = a2;
  uint64_t v17 = a2;
  float v15 = 0.0;
  int v16 = a4;
  float v8 = 0.0;
  int v9 = a4;
  if ((a2 & 0xF) == 0)
  {
    PowerMeter::ProcessVector(this, (const float **)&v17, &v16, &v15);
    int v9 = v16;
    float v8 = v15;
  }
  if (v9 >= 1)
  {
    int v10 = v9 + 1;
    do
    {
      float v11 = *v6;
      if (*v6 < 0.0) {
        float v11 = -*v6;
      }
      if (v11 > v8) {
        float v8 = v11;
      }
      --v10;
      v6 += a3;
    }
    while (v10 > 1);
  }
  if (v8 > this->mClipping.peakValueSinceLastCall) {
    this->mClipping.peakValueSinceLastCall = v8;
  }
  this->mPeakHoldCount += a4;
  double mMaxPeak = v8;
  if (this->mMaxPeak > mMaxPeak) {
    double mMaxPeak = this->mMaxPeak;
  }
  double v13 = fabs(mMaxPeak);
  if (v13 >= 1.0e15 || v13 <= 1.0e-15) {
    double mMaxPeak = 0.0;
  }
  this->double mMaxPeak = mMaxPeak;
}

void PowerMeter::ProcessVector(PowerMeter *this, const float **a2, int *a3, float *__C)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  memset(__A, 0, sizeof(__A));
  v13[0] = xmmword_1C39B1908;
  v13[1] = unk_1C39B1918;
  v13[2] = xmmword_1C39B1928;
  v13[3] = unk_1C39B1938;
  int v6 = *a3;
  if ((*a3 + 15) >= 0x1F)
  {
    long double v7 = *a2;
    if (v6 < 0) {
      int v6 = *a3 + 15;
    }
    int v8 = v6 >> 4;
    do
    {
      --v8;
      vDSP_vsq(v7, 1, __Ca, 1, 4uLL);
      vDSP_vabs(v7, 1, __B, 1, 4uLL);
      vDSP_vmax((const float *)__A, 1, __B, 1, (float *)__A, 1, 4uLL);
      vDSP_vma(__Ca, 1, (const float *)v13, 1, __D, 1, __D, 1, 4uLL);
      v7 += 16;
    }
    while (v8);
  }
  vDSP_maxv((const float *)__A, 1, __C, 0x10uLL);
  int v9 = *a3 & 0xF;
  if (*a3 <= 0) {
    int v9 = -(-*a3 & 0xF);
  }
  *a3 = v9;
}

void sub_1C3994280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39958F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C3995ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1C3996490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39968D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C3996E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C39973C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C39978B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3997B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3998090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3998D88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C399912C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,char a27)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1C3999250(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C39998D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C399A53C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_6_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 40) = a2;
  return *(void *)(a1 + 32);
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_13(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_15(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

BOOL checkAudioFormat(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a1 && a3)
  {
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F15AC0] code:-11828 userInfo:a2];
  }
  return a1 != 0;
}

uint64_t _predicateOperatorTypeForSearchOption(unsigned int a1)
{
  if (a1 < 3) {
    return qword_1C39B1960[a1];
  }
  uint64_t v2 = OSLogForCategory(@"Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    _predicateOperatorTypeForSearchOption_cold_1();
  }

  return 4;
}

uint64_t _predicateOptionsForSearchOption(unsigned int a1)
{
  if (a1 < 3) {
    return qword_1C39B1978[a1];
  }
  uint64_t v2 = OSLogForCategory(@"Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    _predicateOptionsForSearchOption_cold_1();
  }

  return 0;
}

id SharedFlagsBitwiseAndCompoundPredicate(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a1];
  uint64_t v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != nil && bitwiseAnd:with:(%K, %@) == %@", @"sharedFlags", @"sharedFlags", v1, v1];

  return v2;
}

void sub_1C399D2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *RCSavedRecordingsCloudKitContainerIdentifier()
{
  if (RCUseDevelopmentContainer()) {
    id v0 = @"com.apple.VoiceMemosDevelopmentContainer";
  }
  else {
    id v0 = @"com.apple.VoiceMemosContainer";
  }
  return v0;
}

uint64_t RCDecodeFail(uint64_t a1, void *a2)
{
  if (a2)
  {
    *a2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.VoiceMemos.SerializationErrorDomain" code:a1 userInfo:0];
  }
  return 0;
}

void sub_1C399E308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C399EB3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

id RCSearchableItemForRecording(void *a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [v1 URIRepresentation];
  id v3 = +[RCCloudRecording searchableItemIdentifierForSavedRecordingURI:v2];

  id v4 = objc_alloc(MEMORY[0x1E4F23850]);
  uint64_t v5 = (void *)[v4 initWithContentType:*MEMORY[0x1E4F44330]];
  int v6 = [v1 title];
  [v5 setDisplayName:v6];

  long double v7 = [v1 creationDate];
  [v5 setContentCreationDate:v7];

  int v8 = (void *)MEMORY[0x1E4F28ED0];
  [v1 length];
  uint64_t v9 = objc_msgSend(v8, "numberWithDouble:");
  [v5 setDuration:v9];

  id v10 = v1;
  if (RCTranscriptionFeatureFlagIsEnabled()
    && (+[RCAppGroupStorage sharedInstance],
        float v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 transcriptionIsSupported],
        v11,
        v12))
  {
    uint64_t v13 = [v10 url];
    int v14 = 0;
    if ([v13 checkResourceIsReachableAndReturnError:0])
    {
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F166C8], "rc_transcriptionDataForURL:", v13);
      if (v15)
      {
        *(void *)buf = 0;
        int v14 = +[TranscriptionDecoder decodeTransciptionData:v15 error:buf];
        id v16 = *(id *)buf;
        if (!v14)
        {
          uint64_t v17 = OSLogForCategory(@"Service");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            RCSearchableItemForRecording_cold_1((uint64_t)v16, v17);
          }
        }
      }
      else
      {
        int v14 = 0;
      }
    }
  }
  else
  {
    int v14 = 0;
  }

  [v5 setTextContent:v14];
  BOOL v18 = (void *)MEMORY[0x1E4F1C978];
  long long v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v20 = [v19 localizedStringForKey:@"RECORDING_SEARCH_KEYWORD_RECORDING" value:&stru_1F1F06468 table:@"Localizable"];
  long long v21 = [v18 arrayWithObject:v20];
  [v5 setKeywords:v21];

  [v10 length];
  unint64_t v23 = RCLocalizedDuration(round(v22));
  long long v24 = NSString;
  stat v25 = RCLocalizedFrameworkString(@"RECORDING_ENTITY_DISPLAY_REPRESENTATION_DURATION %@");
  unint64_t v26 = objc_msgSend(v24, "localizedStringWithFormat:", v25, v23);

  uint64_t v27 = NSString;
  uint64_t v28 = RCLocalizedFrameworkString(@"SPOTLIGHT_RECORDING_ENTITY_NAME %lu");
  __int16 v29 = objc_msgSend(v27, "localizedStringWithFormat:", v28, 1);

  int v30 = [v10 uuid];
  uint64_t v31 = [v10 title];
  uint64_t v32 = (void *)v31;
  if (v30 && v29 && v31)
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2050000000;
    uint64_t v33 = (void *)getLNSpotlightAppEntityMapperClass_softClass;
    uint64_t v42 = getLNSpotlightAppEntityMapperClass_softClass;
    if (!getLNSpotlightAppEntityMapperClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getLNSpotlightAppEntityMapperClass_block_invoke;
      v44 = &unk_1E6497A08;
      v45 = &v39;
      __getLNSpotlightAppEntityMapperClass_block_invoke((uint64_t)buf);
      uint64_t v33 = (void *)v40[3];
    }
    id v34 = v33;
    _Block_object_dispose(&v39, 8);
    objc_msgSend(v34, "tagCSSearchableItem:entityInstanceIdentifier:typeIdentifier:displayTitle:displaySubtitle:displaySynonyms:typeDisplayName:typeDisplaySynonyms:propertyDictionary:priority:", v5, v30, @"RCRecordingEntity", v32, v26, 0, v29, 0, 0, &unk_1F1F0D938, v39);
  }
  v35 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    v36 = [v5 debugDescription];
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "RCSearchableItemForRecording";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v36;
    _os_log_impl(&dword_1C3964000, v35, OS_LOG_TYPE_INFO, "%s -- created searchable item attributes = %@", buf, 0x16u);
  }
  v37 = (void *)[objc_alloc(MEMORY[0x1E4F23840]) initWithUniqueIdentifier:v3 domainIdentifier:0 attributeSet:v5];

  return v37;
}

void sub_1C399FF0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLNSpotlightAppEntityMapperClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!LinkServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __LinkServicesLibraryCore_block_invoke;
    void v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E6497A28;
    uint64_t v5 = 0;
    LinkServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!LinkServicesLibraryCore_frameworkLibrary) {
    __getLNSpotlightAppEntityMapperClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("LNSpotlightAppEntityMapper");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getLNSpotlightAppEntityMapperClass_block_invoke_cold_2();
  }
  getLNSpotlightAppEntityMapperClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __LinkServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LinkServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1C39A1190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

id appendMDItem(void *a1, void *a2, void *a3, void *a4)
{
  long double v7 = (objc_class *)MEMORY[0x1E4F165A0];
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id v11 = a1;
  id v12 = objc_alloc_init(v7);
  [v12 setKeySpace:v10];
  [v12 setKey:v9];
  uint64_t v13 = [MEMORY[0x1E4F16558] identifierForKey:v9 keySpace:v10];

  [v12 setIdentifier:v13];
  [v12 setValue:v8];

  [v11 addObject:v12];
  return v12;
}

BOOL _RCCleanUpURL(void *a1, void *a2)
{
  id v3 = a1;
  char v13 = 0;
  long long v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = [v3 path];
  int v6 = [v4 fileExistsAtPath:v5 isDirectory:&v13];

  if (!v6)
  {
    BOOL v10 = 1;
    goto LABEL_9;
  }
  if (!v13)
  {
    id v11 = v3;
LABEL_8:
    BOOL v10 = _RCMarkAsPurgeable(v11, a2);
    goto LABEL_9;
  }
  id v7 = v3;
  int v14 = 0;
  id v8 = v7;
  if (!fsctl((const char *)[v8 fileSystemRepresentation], 0x80084A02uLL, &v14, 0))
  {

    id v11 = v8;
    goto LABEL_8;
  }
  id v9 = [NSString stringWithFormat:@"Failed to set APFSIOC_MAINTAIN_DIR_STATS - %@", v8];
  _RCPosixErnnoError(v9, a2);

  BOOL v10 = 0;
LABEL_9:

  return v10;
}

BOOL _RCMarkAsPurgeable(void *a1, void *a2)
{
  int v7 = 66053;
  id v3 = a1;
  int v4 = fsctl((const char *)[v3 fileSystemRepresentation], 0xC0084A44uLL, &v7, 0);
  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Failed to set APFSIOC_MARK_PURGEABLE - %@", v3];
    _RCPosixErnnoError(v5, a2);
  }
  return v4 == 0;
}

void _RCPosixErnnoError(void *a1, void *a2)
{
  void v10[2] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = (void *)MEMORY[0x1E4F28C58];
    v9[0] = *MEMORY[0x1E4F28A50];
    uint64_t v4 = *MEMORY[0x1E4F28798];
    id v5 = a1;
    int v6 = [v3 errorWithDomain:v4 code:*__error() userInfo:0];
    v9[1] = *MEMORY[0x1E4F28568];
    v10[0] = v6;
    v10[1] = v5;
    int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
    id v8 = [v3 errorWithDomain:@"com.apple.VoiceMemos.ErrorDomain" code:-1 userInfo:v7];

    *a2 = v8;
  }
}

id firstStringValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = [MEMORY[0x1E4F16558] metadataItemsFromArray:a1 withKey:a2 keySpace:a3];
  uint64_t v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_111);
  id v5 = [v4 firstObject];

  return v5;
}

id transcriptionIdentifier(int a1)
{
  if (a1) {
    id v1 = @"com.apple.VoiceMemos.tsrp";
  }
  else {
    id v1 = @"tsrp";
  }
  uint64_t v2 = (void *)MEMORY[0x1E4F15DF8];
  if (!a1) {
    uint64_t v2 = (void *)MEMORY[0x1E4F15DF0];
  }
  id v3 = [MEMORY[0x1E4F16558] identifierForKey:v1 keySpace:*v2];
  return v3;
}

id firstDataValue(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [MEMORY[0x1E4F16558] metadataItemsFromArray:a1 filteredByIdentifier:a2];
  id v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_122);
  uint64_t v4 = [v3 firstObject];

  return v4;
}

uint64_t __firstStringValue_block_invoke(uint64_t a1, void *a2)
{
  return [a2 stringValue];
}

uint64_t __firstDateValue_block_invoke(uint64_t a1, void *a2)
{
  return [a2 dateValue];
}

uint64_t __firstNumberValue_block_invoke(uint64_t a1, void *a2)
{
  return [a2 numberValue];
}

uint64_t __firstDataValue_block_invoke(uint64_t a1, void *a2)
{
  return [a2 dataValue];
}

void sub_1C39A5864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void RCAvailableDiskSpaceForRecording_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void RCAvailableDiskSpaceForRecording_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void RCAvailableDiskSpaceForRecording_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void RCHasEnoughDiskSpaceToRecord_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "RCHasEnoughDiskSpaceToRecord";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1C3964000, a2, OS_LOG_TYPE_ERROR, "%s -- ERROR: Not enough space to record a memo. Available space is %lli.", (uint8_t *)&v2, 0x16u);
}

void RCComputeFileDigest_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "RCComputeFileDigest";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1C3964000, a2, OS_LOG_TYPE_ERROR, "%s -- ERROR: unable load data for %@", (uint8_t *)&v2, 0x16u);
}

void _predicateOperatorTypeForSearchOption_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1C3964000, v0, OS_LOG_TYPE_ERROR, "%s -- %d is out of the valid range for RCPredicateSearchOption", (uint8_t *)v1, 0x12u);
}

void _predicateOptionsForSearchOption_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1C3964000, v0, OS_LOG_TYPE_ERROR, "%s -- %d is out of the valid range for RCPredicateSearchOption", (uint8_t *)v1, 0x12u);
}

void RCSearchableItemForRecording_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "RCTranscriptionForRecording";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1C3964000, a2, OS_LOG_TYPE_ERROR, "%s -- Failed to decode transcription, error = %@", (uint8_t *)&v2, 0x16u);
}

void __getLNSpotlightAppEntityMapperClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *LinkServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"RCSavedRecording+SpotlightAdditions.m", 26, @"%s", *a1);

  __break(1u);
}

void __getLNSpotlightAppEntityMapperClass_block_invoke_cold_2()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getLNSpotlightAppEntityMapperClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"RCSavedRecording+SpotlightAdditions.m", 27, @"Unable to find class %s", "LNSpotlightAppEntityMapper");

  __break(1u);
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
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

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFStringRef CFDateFormatterCreateDateFormatFromTemplate(CFAllocatorRef allocator, CFStringRef tmplate, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringRef)MEMORY[0x1F40D78B8](allocator, tmplate, options, locale);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

OSStatus CMAudioFormatDescriptionCreate(CFAllocatorRef allocator, const AudioStreamBasicDescription *asbd, size_t layoutSize, const AudioChannelLayout *layout, size_t magicCookieSize, const void *magicCookie, CFDictionaryRef extensions, CMAudioFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DB880](allocator, asbd, layoutSize, layout, magicCookieSize, magicCookie, extensions, formatDescriptionOut);
}

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return (const AudioStreamBasicDescription *)MEMORY[0x1F40DB8D8](desc);
}

OSStatus CMAudioSampleBufferCreateWithPacketDescriptions(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMTime *presentationTimeStamp, const AudioStreamPacketDescription *packetDescriptions, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1F40DB8E8](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, presentationTimeStamp);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1F40DBBC8](desc);
}

OSStatus CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(CMSampleBufferRef sbuf, size_t *bufferListSizeNeededOut, AudioBufferList *bufferListOut, size_t bufferListSize, CFAllocatorRef blockBufferStructureAllocator, CFAllocatorRef blockBufferBlockAllocator, uint32_t flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DBD88](sbuf, bufferListSizeNeededOut, bufferListOut, bufferListSize, blockBufferStructureAllocator, blockBufferBlockAllocator, *(void *)&flags, blockBufferOut);
}

CMTime *__cdecl CMSampleBufferGetDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDB8](retstr, sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x1F40DBDC0](sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBDD0](sbuf);
}

OSStatus CMSampleBufferSetDataBufferFromAudioBufferList(CMSampleBufferRef sbuf, CFAllocatorRef blockBufferStructureAllocator, CFAllocatorRef blockBufferBlockAllocator, uint32_t flags, const AudioBufferList *bufferList)
{
  return MEMORY[0x1F40DBE68](sbuf, blockBufferStructureAllocator, blockBufferBlockAllocator, *(void *)&flags, bufferList);
}

OSStatus CMSampleBufferSetDataReady(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBE78](sbuf);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1D8](retstr, start, duration);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096C8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t TCCAccessCopyInformationForBundleId()
{
  return MEMORY[0x1F415CB90]();
}

uint64_t TCCAccessResetForBundleId()
{
  return MEMORY[0x1F415CC00]();
}

uint64_t TCCAccessSetForBundleId()
{
  return MEMORY[0x1F415CC30]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

float __exp10f(float a1)
{
  MEMORY[0x1F40C9B98](a1);
  return result;
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CB3A0](a1, a2);
}

int clonefile(const char *a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x1F40CB3E0](a1, a2, *(void *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x1F417A378]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x1F417A388]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_resume(dispatch_object_t object)
{
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

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC288](a1, a2, a3, *(void *)&a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x1F417A398]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC590](path, name, value, size, *(void *)&position, *(void *)&options);
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
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

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
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

void objc_exception_rethrow(void)
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1F4181778](location);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
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

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CDC98](a1, a2);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1F40CDD48](path, name, *(void *)&options);
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CDFD8](path, name, value, size, *(void *)&position, *(void *)&options);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

void vDSP_maxv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_vabs(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vma(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vmax(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

char *__cdecl xattr_name_with_flags(const char *a1, xattr_flags_t a2)
{
  return (char *)MEMORY[0x1F40CE950](a1, a2);
}