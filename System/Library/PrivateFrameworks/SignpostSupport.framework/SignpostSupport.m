uint64_t SSCAIsCAMetadataSubsystemCategory(void *a1, void *a2)
{
  id v3;
  id v4;
  __CFString *v5;
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  if ([v3 isEqualToString:@"com.apple.coreanimation"])
  {
    if (([v4 isEqualToString:@"Transaction.Stalls"] & 1) == 0
      && ([v4 isEqualToString:@"Transaction"] & 1) == 0
      && ([v4 isEqualToString:@"IOMFBServer.Stalls"] & 1) == 0
      && ([v4 isEqualToString:@"IOMFBServer"] & 1) == 0
      && ([v4 isEqualToString:@"WindowServer"] & 1) == 0
      && ([v4 isEqualToString:@"WindowServer.Stalls"] & 1) == 0
      && ([v4 isEqualToString:@"CAMetalLayer"] & 1) == 0
      && ([v4 isEqualToString:@"CAMetalLayer.Stalls"] & 1) == 0
      && ([v4 isEqualToString:@"CAImageQueue"] & 1) == 0)
    {
      v5 = @"CAImageQueue.Stalls";
LABEL_17:
      v6 = [v4 isEqualToString:v5];
      goto LABEL_18;
    }
  }
  else
  {
    if (![v3 isEqualToString:@"com.apple.SkyLight"])
    {
      v6 = 0;
      goto LABEL_18;
    }
    if (([v4 isEqualToString:@"tracing"] & 1) == 0)
    {
      v5 = @"tracing.stalls";
      goto LABEL_17;
    }
  }
  v6 = 1;
LABEL_18:

  return v6;
}

void sub_1A457B0B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A457B1B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SSCAEventTypeForSignpost(void *a1)
{
  id v1 = a1;
  v2 = [v1 name];
  v3 = (void *)[v2 isEqualToString:@"ContextInfo"];

  if (!v3)
  {
LABEL_13:
    v12 = [v1 name];
    v13 = (void *)[v12 isEqualToString:@"ImageQueueSample"];

    if (v13)
    {
      v14 = [v1 category];
      char v15 = [v14 isEqualToString:@"CAImageQueue"];
      if ((v15 & 1) != 0
        || ([v1 category],
            v13 = objc_claimAutoreleasedReturnValue(),
            ([v13 isEqualToString:@"CAImageQueue.Stalls"] & 1) != 0))
      {
        v16 = [v1 subsystem];
        char v17 = [v16 isEqualToString:@"com.apple.coreanimation"];

        if ((v15 & 1) == 0) {
        if (v17)
        }
        {
          uint64_t v11 = 1;
          goto LABEL_22;
        }
      }
      else
      {
      }
    }
    uint64_t v11 = 2;
    goto LABEL_22;
  }
  v4 = [v1 category];
  char v5 = [v4 isEqualToString:@"IOMFBServer"];
  if ((v5 & 1) != 0
    || ([v1 category],
        v3 = objc_claimAutoreleasedReturnValue(),
        ([v3 isEqualToString:@"IOMFBServer.Stalls"] & 1) != 0))
  {
    v6 = [v1 subsystem];
    char v7 = [v6 isEqualToString:@"com.apple.coreanimation"];

    if ((v5 & 1) == 0) {
    if (v7)
    }
      goto LABEL_11;
  }
  else
  {
  }
  v8 = [v1 category];
  if (([v8 isEqualToString:@"tracing.stalls"] & 1) == 0)
  {

    goto LABEL_13;
  }
  v9 = [v1 subsystem];
  char v10 = [v9 isEqualToString:@"com.apple.SkyLight"];

  if ((v10 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v11 = 0;
LABEL_22:

  return v11;
}

uint64_t SSCAIntervalTypeForSignpostInterval(void *a1)
{
  id v1 = a1;
  v2 = [v1 subsystem];
  if (_subsystemIsHitchSubsystem(v2))
  {
    v3 = [v1 category];
    v4 = [v1 name];
    if ([v3 isEqualToString:@"Transaction"])
    {
      if ([v4 isEqualToString:@"Commit"])
      {
        uint64_t v5 = 0;
LABEL_44:

        goto LABEL_45;
      }
      if ([v4 isEqualToString:@"TransactionLifetime"])
      {
        uint64_t v5 = 2;
        goto LABEL_44;
      }
      goto LABEL_43;
    }
    if ([v3 isEqualToString:@"Transaction.Stalls"])
    {
      if ([v4 isEqualToString:@"Commit"])
      {
        uint64_t v5 = 1;
        goto LABEL_44;
      }
      if ([v4 isEqualToString:@"TransactionLifetime"])
      {
        uint64_t v5 = 3;
        goto LABEL_44;
      }
LABEL_43:
      uint64_t v5 = 14;
      goto LABEL_44;
    }
    if ([v3 isEqualToString:@"IOMFBServer"])
    {
      if ([v4 isEqualToString:@"HIDLatency"])
      {
        uint64_t v5 = 4;
        goto LABEL_44;
      }
      if ([v4 isEqualToString:@"FrameLatency"])
      {
        uint64_t v5 = 6;
        goto LABEL_44;
      }
      goto LABEL_31;
    }
    if ([v3 isEqualToString:@"IOMFBServer.Stalls"])
    {
      if ([v4 isEqualToString:@"HIDLatency"])
      {
        uint64_t v5 = 5;
        goto LABEL_44;
      }
      if ([v4 isEqualToString:@"FrameLatency"])
      {
        uint64_t v5 = 7;
        goto LABEL_44;
      }
LABEL_35:
      if ([v4 isEqualToString:@"FrameLifetime"])
      {
        uint64_t v5 = 11;
        goto LABEL_44;
      }
      goto LABEL_43;
    }
    if ([v3 isEqualToString:@"WindowServer"])
    {
      if (([v4 isEqualToString:@"RenderInterval"] & 1) == 0) {
        goto LABEL_43;
      }
      goto LABEL_23;
    }
    if ([v3 isEqualToString:@"WindowServer.Stalls"])
    {
      if (([v4 isEqualToString:@"RenderInterval"] & 1) == 0) {
        goto LABEL_43;
      }
    }
    else
    {
      if ([v3 isEqualToString:@"tracing"])
      {
        if (([v4 isEqualToString:@"RenderInterval"] & 1) == 0)
        {
LABEL_31:
          if ([v4 isEqualToString:@"FrameLifetime"])
          {
            uint64_t v5 = 10;
            goto LABEL_44;
          }
          goto LABEL_43;
        }
LABEL_23:
        uint64_t v5 = 8;
        goto LABEL_44;
      }
      if (![v3 isEqualToString:@"tracing.stalls"])
      {
        if ([v3 isEqualToString:@"CAMetalLayer"])
        {
          if ([v4 isEqualToString:@"ClientDrawable"])
          {
            uint64_t v5 = 12;
            goto LABEL_44;
          }
        }
        else if ([v3 isEqualToString:@"CAMetalLayer.Stalls"] {
               && ([v4 isEqualToString:@"ClientDrawable"] & 1) != 0)
        }
        {
          uint64_t v5 = 13;
          goto LABEL_44;
        }
        goto LABEL_43;
      }
      if (([v4 isEqualToString:@"RenderInterval"] & 1) == 0) {
        goto LABEL_35;
      }
    }
    uint64_t v5 = 9;
    goto LABEL_44;
  }
  uint64_t v5 = 14;
LABEL_45:

  return v5;
}

uint64_t _subsystemIsHitchSubsystem(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"com.apple.coreanimation"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"com.apple.SkyLight"];
  }

  return v2;
}

id _signpost_debug_log()
{
  if (_signpost_debug_log_onceToken != -1) {
    dispatch_once(&_signpost_debug_log_onceToken, &__block_literal_global_11);
  }
  v0 = (void *)_signpost_debug_log_signpost_log;

  return v0;
}

void sub_1A4581F70(_Unwind_Exception *a1)
{
  objc_destroyWeak(v7);
  objc_destroyWeak(v6);
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v8 - 104));
  _Unwind_Resume(a1);
}

void sub_1A4581FDC()
{
}

void sub_1A4581FE4()
{
}

uint64_t ___signpost_debug_log_block_invoke()
{
  _signpost_debug_log_signpost_log = (uint64_t)os_log_create("com.apple.SignpostSupport", "debugging");

  return MEMORY[0x1F41817F8]();
}

id SignpostReporterCrossPlatformIntelligencePlatformAllowlist()
{
  if (SignpostReporterCrossPlatformIntelligencePlatformAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporterCrossPlatformIntelligencePlatformAllowlist_onceToken, &__block_literal_global);
  }
  v0 = (void *)SignpostReporterCrossPlatformIntelligencePlatformAllowlist_intelligencePlatformStringArray;

  return v0;
}

void __SignpostReporterCrossPlatformIntelligencePlatformAllowlist_block_invoke()
{
  v0 = (void *)SignpostReporterCrossPlatformIntelligencePlatformAllowlist_intelligencePlatformStringArray;
  SignpostReporterCrossPlatformIntelligencePlatformAllowlist_intelligencePlatformStringArray = (uint64_t)&unk_1EF81E450;
}

uint64_t SignpostReporterShouldUseAllowlist()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  char v6 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __SignpostReporterShouldUseAllowlist_block_invoke;
  block[3] = &unk_1E5B3FEE0;
  block[4] = &v3;
  if (SignpostReporterShouldUseAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporterShouldUseAllowlist_onceToken, block);
  }
  uint64_t v0 = *((unsigned __int8 *)v4 + 24);
  _Block_object_dispose(&v3, 8);
  return v0;
}

void __SignpostReporterShouldUseAllowlist_block_invoke(uint64_t a1)
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  uint64_t v3 = SRStringFilter_debugLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (has_internal_diagnostics)
  {
    if (v4) {
      __SignpostReporterShouldUseAllowlist_block_invoke_cold_1(v3);
    }
    char v5 = 0;
  }
  else
  {
    if (v4) {
      __SignpostReporterShouldUseAllowlist_block_invoke_cold_2(v3);
    }
    char v5 = 1;
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
}

id SRStringFilter_debugLog()
{
  if (SRStringFilter_debugLog_onceToken != -1) {
    dispatch_once(&SRStringFilter_debugLog_onceToken, &__block_literal_global_35);
  }
  uint64_t v0 = (void *)SRStringFilter_debugLog_debugLog;

  return v0;
}

BOOL IsPerfLoggingInterval(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = [a1 isEqualToString:@"com.apple.PerformanceAnalysis"]
    && [v5 isEqualToString:@"PerfLogging"]
    && ([v6 isEqualToString:@"PerfLoggingOperation"] & 1) != 0;

  return v7;
}

uint64_t PassesPerfLoggingAllowlist(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  uint64_t v6 = 0;
  if (v3 && v4)
  {
    if (_StringPassesPerfLoggingOperationCategoryAllowlist_onceToken != -1) {
      dispatch_once(&_StringPassesPerfLoggingOperationCategoryAllowlist_onceToken, &__block_literal_global_39);
    }
    if ([(id)_StringPassesPerfLoggingOperationCategoryAllowlist_allowlistedOperationCategoryStringsSet containsObject:v3])
    {
      uint64_t v7 = _StringPassesPerfLoggingOperationNameAllowlist_onceToken;
      id v8 = v5;
      if (v7 != -1) {
        dispatch_once(&_StringPassesPerfLoggingOperationNameAllowlist_onceToken, &__block_literal_global_42);
      }
      uint64_t v6 = [(id)_StringPassesPerfLoggingOperationNameAllowlist_allowlistedOperationNameStringsSet containsObject:v8];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }

  return v6;
}

id SignpostReporterAllowlistedStringSet(id a1)
{
  switch((unint64_t)a1)
  {
    case 0uLL:
      if (SignpostReporterAllowlistedStringSet_onceToken_30 != -1) {
        dispatch_once(&SignpostReporterAllowlistedStringSet_onceToken_30, &__block_literal_global_33);
      }
      uint64_t v2 = &SignpostReporterAllowlistedStringSet_allowlistSet_29;
      goto LABEL_25;
    case 1uLL:
      if (SignpostReporterAllowlistedStringSet_onceToken != -1) {
        dispatch_once(&SignpostReporterAllowlistedStringSet_onceToken, &__block_literal_global_0);
      }
      uint64_t v2 = &SignpostReporterAllowlistedStringSet_allowlistSet;
      goto LABEL_25;
    case 2uLL:
      if (SignpostReporterAllowlistedStringSet_onceToken_10 != -1) {
        dispatch_once(&SignpostReporterAllowlistedStringSet_onceToken_10, &__block_literal_global_13);
      }
      uint64_t v2 = &SignpostReporterAllowlistedStringSet_allowlistSet_9;
      goto LABEL_25;
    case 3uLL:
      if (SignpostReporterAllowlistedStringSet_onceToken_20 != -1) {
        dispatch_once(&SignpostReporterAllowlistedStringSet_onceToken_20, &__block_literal_global_23);
      }
      uint64_t v2 = &SignpostReporterAllowlistedStringSet_allowlistSet_19;
      goto LABEL_25;
    case 4uLL:
      if (SignpostReporterAllowlistedStringSet_onceToken_15 != -1) {
        dispatch_once(&SignpostReporterAllowlistedStringSet_onceToken_15, &__block_literal_global_18);
      }
      uint64_t v2 = &SignpostReporterAllowlistedStringSet_allowlistSet_14;
      goto LABEL_25;
    case 5uLL:
      if (SignpostReporterAllowlistedStringSet_onceToken_25 != -1) {
        dispatch_once(&SignpostReporterAllowlistedStringSet_onceToken_25, &__block_literal_global_28);
      }
      id v4 = SRStringFilter_debugLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        SignpostReporterAllowlistedStringSet_cold_1();
      }

      uint64_t v2 = &SignpostReporterAllowlistedStringSet_allowlistSet_24;
LABEL_25:
      a1 = (id)*v2;
      break;
    default:
      break;
  }
  return a1;
}

void __SignpostReporterAllowlistedStringSet_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v1 = SignpostReporterMacOsPerfLoggingOperationCategoryAllowlist();
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  SignpostReporterAllowlistedStringSet_allowlistSet = v2;

  id v4 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  id v5 = SignpostReporterMacOsPerfLoggingOperationNameAllowlist();
  [v4 addObjectsFromArray:v5];

  uint64_t v6 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  if (SignpostReporterMacOsBundleIdAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporterMacOsBundleIdAllowlist_onceToken, &__block_literal_global_468);
  }
  [v6 addObjectsFromArray:SignpostReporterMacOsBundleIdAllowlist_allowlistedBundleIdArray];
  uint64_t v7 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  if (SignpostReporterMacOsSpotlightAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporterMacOsSpotlightAllowlist_onceToken, &__block_literal_global_2792);
  }
  [v7 addObjectsFromArray:SignpostReporterMacOsSpotlightAllowlist_spotlightStringArray];
  id v8 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  v9 = SignpostReporterCrossPlatformLowDiskConditionAllowlist();
  [v8 addObjectsFromArray:v9];

  char v10 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  uint64_t v11 = SignpostReporterCrossPlatformAppleAccountAllowlist();
  [v10 addObjectsFromArray:v11];

  v12 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  v13 = SignpostReporterCrossPlatformAppleIDAuthenticationAllowlist();
  [v12 addObjectsFromArray:v13];

  v14 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  char v15 = SignpostReporterCrossPlatformAuthKitAllowlist();
  [v14 addObjectsFromArray:v15];

  v16 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  char v17 = SignpostReporterCrossPlatformSiriAudioStringPasslist();
  [v16 addObjectsFromArray:v17];

  v18 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  v19 = SignpostReporterCrossPlatformSiriPlaybackControlsStringPasslist();
  [v18 addObjectsFromArray:v19];

  v20 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  v21 = SignpostReporterCrossPlatformSiriHomeAutomationStringPasslist();
  [v20 addObjectsFromArray:v21];

  v22 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  v23 = SignpostReporterCrossPlatformSharedAllowlist();
  [v22 addObjectsFromArray:v23];

  v24 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  v25 = SignpostReporterCrossPlatformSiriVocabularyStringPasslist();
  [v24 addObjectsFromArray:v25];

  v26 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  v27 = SignpostReporterCrossPlatformIntelligencePlatformAllowlist();
  [v26 addObjectsFromArray:v27];

  v28 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  v29 = SignpostReporterCrossPlatformSpeechProfileAllowlist();
  [v28 addObjectsFromArray:v29];

  v30 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  v31 = SignpostReporterCrossPlatformWidgetAllowlist();
  [v30 addObjectsFromArray:v31];

  v32 = SRStringFilter_debugLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
    __SignpostReporterAllowlistedStringSet_block_invoke_cold_1();
  }
}

id SignpostReporterMacOsPerfLoggingOperationCategoryAllowlist()
{
  if (SignpostReporterMacOsPerfLoggingOperationCategoryAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporterMacOsPerfLoggingOperationCategoryAllowlist_onceToken, &__block_literal_global_44);
  }
  uint64_t v0 = (void *)SignpostReporterMacOsPerfLoggingOperationCategoryAllowlist_allowlistedOperationCategoryArray;

  return v0;
}

id SignpostReporterMacOsPerfLoggingOperationNameAllowlist()
{
  if (SignpostReporterMacOsPerfLoggingOperationNameAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporterMacOsPerfLoggingOperationNameAllowlist_onceToken, &__block_literal_global_256);
  }
  uint64_t v0 = (void *)SignpostReporterMacOsPerfLoggingOperationNameAllowlist_allowlistArray;

  return v0;
}

id SignpostReporterCrossPlatformLowDiskConditionAllowlist()
{
  if (SignpostReporterCrossPlatformLowDiskConditionAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporterCrossPlatformLowDiskConditionAllowlist_onceToken, &__block_literal_global_2878);
  }
  uint64_t v0 = (void *)SignpostReporterCrossPlatformLowDiskConditionAllowlist_lowDiskConditionStringArray;

  return v0;
}

void __SignpostReporterAllowlistedStringSet_block_invoke_11()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1CA80];
  if (SignpostReporteriPhoneOSSpringBoardAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporteriPhoneOSSpringBoardAllowlist_onceToken, &__block_literal_global_2889);
  }
  id v1 = (id)SignpostReporteriPhoneOSSpringBoardAllowlist_sbStringArray;
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  SignpostReporterAllowlistedStringSet_allowlistSet_9 = v2;

  id v4 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  if (SignpostReporteriPhoneOSCameraAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporteriPhoneOSCameraAllowlist_onceToken, &__block_literal_global_2990);
  }
  [v4 addObjectsFromArray:SignpostReporteriPhoneOSCameraAllowlist_cameraStringArray];
  id v5 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  if (SignpostReporteriPhoneOSUIKitAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporteriPhoneOSUIKitAllowlist_onceToken, &__block_literal_global_3079);
  }
  [v5 addObjectsFromArray:SignpostReporteriPhoneOSUIKitAllowlist_uiKitStringArray];
  uint64_t v6 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  if (SignpostReporteriPhoneOSBundleIdAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporteriPhoneOSBundleIdAllowlist_onceToken, &__block_literal_global_3165);
  }
  [v6 addObjectsFromArray:SignpostReporteriPhoneOSBundleIdAllowlist_bundleIdArray];
  uint64_t v7 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  if (SignpostReporteriPhoneOSCalendarAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporteriPhoneOSCalendarAllowlist_onceToken, &__block_literal_global_3812);
  }
  [v7 addObjectsFromArray:SignpostReporteriPhoneOSCalendarAllowlist_calendarStringArray];
  id v8 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  if (SignpostReporteriPhoneOSRemindersAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporteriPhoneOSRemindersAllowlist_onceToken, &__block_literal_global_3835);
  }
  [v8 addObjectsFromArray:SignpostReporteriPhoneOSRemindersAllowlist_remindersStringArray];
  v9 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  if (SignpostReporteriPhoneOSMobileMailAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporteriPhoneOSMobileMailAllowlist_onceToken, &__block_literal_global_3852);
  }
  [v9 addObjectsFromArray:SignpostReporteriPhoneOSMobileMailAllowlist_mobileMailStringArray];
  char v10 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  if (SignpostReporteriPhoneOSSplashBoardAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporteriPhoneOSSplashBoardAllowlist_onceToken, &__block_literal_global_3887);
  }
  [v10 addObjectsFromArray:SignpostReporteriPhoneOSSplashBoardAllowlist_splashBoardStringArray];
  uint64_t v11 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  if (SignpostReporteriPhoneOSWakeReasonsAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporteriPhoneOSWakeReasonsAllowlist_onceToken, &__block_literal_global_3904);
  }
  [v11 addObjectsFromArray:SignpostReporteriPhoneOSWakeReasonsAllowlist_wakeReasonStringArray];
  v12 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  v13 = SignpostReporterCrossPlatformSiriPersonalUpdateStringPasslist();
  [v12 addObjectsFromArray:v13];

  v14 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  char v15 = SignpostReporteriOSSystemEnvironmentsAllowlist();
  [v14 addObjectsFromArray:v15];

  v16 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  char v17 = SignpostReporteriOSPoirotAllowlist();
  [v16 addObjectsFromArray:v17];

  v18 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  v19 = SignpostReporterEmbeddedOSHangTracerAllowlist();
  [v18 addObjectsFromArray:v19];

  v20 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  v21 = SignpostReporterEmbeddedOSMusicWaitTimeAllowlist();
  [v20 addObjectsFromArray:v21];

  v22 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  v23 = SignpostReporterCrossPlatformLowDiskConditionAllowlist();
  [v22 addObjectsFromArray:v23];

  v24 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  v25 = SignpostReporterCrossPlatformAppleAccountAllowlist();
  [v24 addObjectsFromArray:v25];

  v26 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  v27 = SignpostReporterCrossPlatformAppleIDAuthenticationAllowlist();
  [v26 addObjectsFromArray:v27];

  v28 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  v29 = SignpostReporterCrossPlatformAuthKitAllowlist();
  [v28 addObjectsFromArray:v29];

  v30 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  v31 = SignpostReporterCrossPlatformSiriAudioStringPasslist();
  [v30 addObjectsFromArray:v31];

  v32 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  v33 = SignpostReporterCrossPlatformSiriPlaybackControlsStringPasslist();
  [v32 addObjectsFromArray:v33];

  v34 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  v35 = SignpostReporterCrossPlatformSiriVideoUTSOperationRequestStringPasslist();
  [v34 addObjectsFromArray:v35];

  v36 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  v37 = SignpostReporterCrossPlatformSiriHomeAutomationStringPasslist();
  [v36 addObjectsFromArray:v37];

  v38 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  v39 = SignpostReporterCrossPlatformSharedAllowlist();
  [v38 addObjectsFromArray:v39];

  v40 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  v41 = SignpostReporterCrossPlatformSiriVocabularyStringPasslist();
  [v40 addObjectsFromArray:v41];

  v42 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  v43 = SignpostReporterCrossPlatformIntelligencePlatformAllowlist();
  [v42 addObjectsFromArray:v43];

  v44 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  v45 = SignpostReporterCrossPlatformSpeechProfileAllowlist();
  [v44 addObjectsFromArray:v45];

  v46 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  v47 = SignpostReporterCrossPlatformWidgetAllowlist();
  [v46 addObjectsFromArray:v47];

  v48 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_9;
  v49 = SignpostReporterCrossPlatformZelkovaAllowlist();
  [v48 addObjectsFromArray:v49];

  v50 = SRStringFilter_debugLog();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
    __SignpostReporterAllowlistedStringSet_block_invoke_11_cold_1();
  }
}

id SignpostReporterEmbeddedOSHangTracerAllowlist()
{
  if (SignpostReporterEmbeddedOSHangTracerAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporterEmbeddedOSHangTracerAllowlist_onceToken, &__block_literal_global_3924);
  }
  uint64_t v0 = (void *)SignpostReporterEmbeddedOSHangTracerAllowlist_hangTracerStringArray;

  return v0;
}

id SignpostReporterEmbeddedOSMusicWaitTimeAllowlist()
{
  if (SignpostReporterEmbeddedOSMusicWaitTimeAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporterEmbeddedOSMusicWaitTimeAllowlist_onceToken, &__block_literal_global_3968);
  }
  uint64_t v0 = (void *)SignpostReporterEmbeddedOSMusicWaitTimeAllowlist_musicWaitTimeStringArray;

  return v0;
}

void __SignpostReporterAllowlistedStringSet_block_invoke_16()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1CA80];
  id v1 = SignpostReporterCrossPlatformLowDiskConditionAllowlist();
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_14;
  SignpostReporterAllowlistedStringSet_allowlistSet_14 = v2;

  id v4 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_14;
  id v5 = SignpostReporterCrossPlatformAppleAccountAllowlist();
  [v4 addObjectsFromArray:v5];

  uint64_t v6 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_14;
  uint64_t v7 = SignpostReporterCrossPlatformAppleIDAuthenticationAllowlist();
  [v6 addObjectsFromArray:v7];

  id v8 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_14;
  v9 = SignpostReporterCrossPlatformAuthKitAllowlist();
  [v8 addObjectsFromArray:v9];

  char v10 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_14;
  uint64_t v11 = SignpostReporterCrossPlatformSiriAudioStringPasslist();
  [v10 addObjectsFromArray:v11];

  v12 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_14;
  v13 = SignpostReporterCrossPlatformSiriPlaybackControlsStringPasslist();
  [v12 addObjectsFromArray:v13];

  v14 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_14;
  char v15 = SignpostReporterCrossPlatformSiriVideoUTSOperationRequestStringPasslist();
  [v14 addObjectsFromArray:v15];

  v16 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_14;
  char v17 = SignpostReporterCrossPlatformSiriHomeAutomationStringPasslist();
  [v16 addObjectsFromArray:v17];

  v18 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_14;
  v19 = SignpostReporterCrossPlatformSharedAllowlist();
  [v18 addObjectsFromArray:v19];

  v20 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_14;
  v21 = SignpostReporterCrossPlatformSiriVocabularyStringPasslist();
  [v20 addObjectsFromArray:v21];

  v22 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_14;
  v23 = SignpostReporterCrossPlatformWidgetAllowlist();
  [v22 addObjectsFromArray:v23];

  v24 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_14;
  v25 = SignpostReporterEmbeddedOSHangTracerAllowlist();
  [v24 addObjectsFromArray:v25];

  v26 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_14;
  v27 = SignpostReporterEmbeddedOSMusicWaitTimeAllowlist();
  [v26 addObjectsFromArray:v27];

  v28 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_14;
  v29 = SignpostReporterCrossPlatformSpeechProfileAllowlist();
  [v28 addObjectsFromArray:v29];

  v30 = SRStringFilter_debugLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
    __SignpostReporterAllowlistedStringSet_block_invoke_16_cold_1();
  }
}

void __SignpostReporterAllowlistedStringSet_block_invoke_21()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1CA80];
  id v1 = SignpostReporterCrossPlatformLowDiskConditionAllowlist();
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_19;
  SignpostReporterAllowlistedStringSet_allowlistSet_19 = v2;

  id v4 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_19;
  id v5 = SignpostReporterCrossPlatformAppleAccountAllowlist();
  [v4 addObjectsFromArray:v5];

  uint64_t v6 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_19;
  uint64_t v7 = SignpostReporterCrossPlatformAppleIDAuthenticationAllowlist();
  [v6 addObjectsFromArray:v7];

  id v8 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_19;
  v9 = SignpostReporterCrossPlatformAuthKitAllowlist();
  [v8 addObjectsFromArray:v9];

  char v10 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_19;
  uint64_t v11 = SignpostReporterCrossPlatformSiriAudioStringPasslist();
  [v10 addObjectsFromArray:v11];

  v12 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_19;
  v13 = SignpostReporterCrossPlatformSiriPlaybackControlsStringPasslist();
  [v12 addObjectsFromArray:v13];

  v14 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_19;
  char v15 = SignpostReporterCrossPlatformSiriHomeAutomationStringPasslist();
  [v14 addObjectsFromArray:v15];

  v16 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_19;
  char v17 = SignpostReporterCrossPlatformSharedAllowlist();
  [v16 addObjectsFromArray:v17];

  v18 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_19;
  v19 = SignpostReporterCrossPlatformSiriVocabularyStringPasslist();
  [v18 addObjectsFromArray:v19];

  v20 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_19;
  v21 = SignpostReporterCrossPlatformSpeechProfileAllowlist();
  [v20 addObjectsFromArray:v21];

  v22 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_19;
  v23 = SignpostReporterCrossPlatformWidgetAllowlist();
  [v22 addObjectsFromArray:v23];

  v24 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_19;
  v25 = SignpostReporterCrossPlatformZelkovaAllowlist();
  [v24 addObjectsFromArray:v25];

  v26 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_19;
  v27 = SignpostReporterEmbeddedOSHangTracerAllowlist();
  [v26 addObjectsFromArray:v27];

  v28 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_19;
  v29 = SignpostReporterEmbeddedOSMusicWaitTimeAllowlist();
  [v28 addObjectsFromArray:v29];

  v30 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_19;
  v31 = SignpostReporterCrossPlatformSiriPersonalUpdateStringPasslist();
  [v30 addObjectsFromArray:v31];

  v32 = SRStringFilter_debugLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
    __SignpostReporterAllowlistedStringSet_block_invoke_21_cold_1();
  }
}

void __SignpostReporterAllowlistedStringSet_block_invoke_26()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  id v1 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_24;
  SignpostReporterAllowlistedStringSet_allowlistSet_24 = v0;

  uint64_t v2 = SRStringFilter_debugLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __SignpostReporterAllowlistedStringSet_block_invoke_26_cold_1();
  }
}

void __SignpostReporterAllowlistedStringSet_block_invoke_31()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  id v1 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_29;
  SignpostReporterAllowlistedStringSet_allowlistSet_29 = v0;

  uint64_t v2 = SRStringFilter_debugLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __SignpostReporterAllowlistedStringSet_block_invoke_31_cold_1();
  }
}

uint64_t StringPassesSignpostReporterStringAllowlist(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = SignpostReporterAllowlistedStringSet(a2);
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

void __SignpostReporterMacOsPerfLoggingOperationCategoryAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporterMacOsPerfLoggingOperationCategoryAllowlist_allowlistedOperationCategoryArray;
  SignpostReporterMacOsPerfLoggingOperationCategoryAllowlist_allowlistedOperationCategoryArray = (uint64_t)&unk_1EF81E468;
}

void __SignpostReporterMacOsPerfLoggingOperationNameAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporterMacOsPerfLoggingOperationNameAllowlist_allowlistArray;
  SignpostReporterMacOsPerfLoggingOperationNameAllowlist_allowlistArray = (uint64_t)&unk_1EF81E480;
}

void __SignpostReporterMacOsBundleIdAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporterMacOsBundleIdAllowlist_allowlistedBundleIdArray;
  SignpostReporterMacOsBundleIdAllowlist_allowlistedBundleIdArray = (uint64_t)&unk_1EF81E498;
}

void __SignpostReporterMacOsSpotlightAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporterMacOsSpotlightAllowlist_spotlightStringArray;
  SignpostReporterMacOsSpotlightAllowlist_spotlightStringArray = (uint64_t)&unk_1EF81E4B0;
}

void __SignpostReporterCrossPlatformLowDiskConditionAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporterCrossPlatformLowDiskConditionAllowlist_lowDiskConditionStringArray;
  SignpostReporterCrossPlatformLowDiskConditionAllowlist_lowDiskConditionStringArray = (uint64_t)&unk_1EF81E4C8;
}

void __SignpostReporteriPhoneOSSpringBoardAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporteriPhoneOSSpringBoardAllowlist_sbStringArray;
  SignpostReporteriPhoneOSSpringBoardAllowlist_sbStringArray = (uint64_t)&unk_1EF81E4E0;
}

void __SignpostReporteriPhoneOSCameraAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporteriPhoneOSCameraAllowlist_cameraStringArray;
  SignpostReporteriPhoneOSCameraAllowlist_cameraStringArray = (uint64_t)&unk_1EF81E4F8;
}

void __SignpostReporteriPhoneOSUIKitAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporteriPhoneOSUIKitAllowlist_uiKitStringArray;
  SignpostReporteriPhoneOSUIKitAllowlist_uiKitStringArray = (uint64_t)&unk_1EF81E510;
}

void __SignpostReporteriPhoneOSBundleIdAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporteriPhoneOSBundleIdAllowlist_bundleIdArray;
  SignpostReporteriPhoneOSBundleIdAllowlist_bundleIdArray = (uint64_t)&unk_1EF81E528;
}

void __SignpostReporteriPhoneOSCalendarAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporteriPhoneOSCalendarAllowlist_calendarStringArray;
  SignpostReporteriPhoneOSCalendarAllowlist_calendarStringArray = (uint64_t)&unk_1EF81E540;
}

void __SignpostReporteriPhoneOSRemindersAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporteriPhoneOSRemindersAllowlist_remindersStringArray;
  SignpostReporteriPhoneOSRemindersAllowlist_remindersStringArray = (uint64_t)&unk_1EF81E558;
}

void __SignpostReporteriPhoneOSMobileMailAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporteriPhoneOSMobileMailAllowlist_mobileMailStringArray;
  SignpostReporteriPhoneOSMobileMailAllowlist_mobileMailStringArray = (uint64_t)&unk_1EF81E570;
}

void __SignpostReporteriPhoneOSSplashBoardAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporteriPhoneOSSplashBoardAllowlist_splashBoardStringArray;
  SignpostReporteriPhoneOSSplashBoardAllowlist_splashBoardStringArray = (uint64_t)&unk_1EF81E588;
}

void __SignpostReporteriPhoneOSWakeReasonsAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporteriPhoneOSWakeReasonsAllowlist_wakeReasonStringArray;
  SignpostReporteriPhoneOSWakeReasonsAllowlist_wakeReasonStringArray = (uint64_t)&unk_1EF81E5A0;
}

void __SignpostReporterEmbeddedOSHangTracerAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporterEmbeddedOSHangTracerAllowlist_hangTracerStringArray;
  SignpostReporterEmbeddedOSHangTracerAllowlist_hangTracerStringArray = (uint64_t)&unk_1EF81E5B8;
}

void __SignpostReporterEmbeddedOSMusicWaitTimeAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporterEmbeddedOSMusicWaitTimeAllowlist_musicWaitTimeStringArray;
  SignpostReporterEmbeddedOSMusicWaitTimeAllowlist_musicWaitTimeStringArray = (uint64_t)&unk_1EF81E5D0;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id SignpostJSONRepresentationOfObject(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if (([MEMORY[0x1E4F28D90] isValidJSONObject:v4] & 1) == 0)
  {

    id v4 = &unk_1EF81E738;
  }
  uint64_t v8 = 0;
  uint64_t v5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:a2 error:&v8];
  uint64_t v6 = (void *)[[NSString alloc] initWithData:v5 encoding:4];

  return v6;
}

id SignpostJSONRepresentation(void *a1, uint64_t a2)
{
  id v3 = [a1 dictionaryRepresentation];
  id v4 = SignpostJSONRepresentationOfObject(v3, a2);

  return v4;
}

void sub_1A4585564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
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

double SignpostSystemTimebaseRatio()
{
  if (SignpostSystemTimebaseRatio_onceToken != -1) {
    dispatch_once(&SignpostSystemTimebaseRatio_onceToken, &__block_literal_global_1);
  }
  return *(double *)&SignpostSystemTimebaseRatio_timebaseRatio;
}

uint64_t __SignpostSystemTimebaseRatio_block_invoke()
{
  mach_timebase_info info = 0;
  uint64_t result = mach_timebase_info(&info);
  double v1 = 1.0;
  if (info.numer != info.denom) {
    double v1 = (double)info.numer / (double)info.denom;
  }
  SignpostSystemTimebaseRatio_timebaseRatio = *(void *)&v1;
  return result;
}

uint64_t SignpostPlatformForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"macOS"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"iPhoneOS"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"watchOS"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"tvOS"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"bridgeOS"])
  {
    uint64_t v2 = 5;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *StringForSignpostPlatform(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return @"Unknown";
  }
  else {
    return off_1E5B3FF28[a1 - 1];
  }
}

uint64_t SignpostPlatformForDevice()
{
  return 2;
}

id _glitchesFromFrameLifetimesBase(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v11 = a5;
  id v12 = 0;
  if (v9 && (a4 & 0x1B) != 0)
  {
    if ([v9 count])
    {
      v22 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v13 = [v10 firstFrameGraceTimeMCT];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v21 = v9;
      id v14 = v9;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v24 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "overrunIntervalOfType:overrunClass:maybeFirstFrame:contributingPID:", a3, a4, objc_msgSend(v10, "isFramePossibleFirstFrameForAnimation:withGraceTime:", *(void *)(*((void *)&v23 + 1) + 8 * i), v13, v21), v11);
            if (v19) {
              [v22 addObject:v19];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v16);
      }

      if ([v22 count]) {
        id v12 = v22;
      }
      else {
        id v12 = 0;
      }
      id v9 = v21;
    }
    else
    {
      id v12 = 0;
    }
  }

  return v12;
}

id _uniqueInterval(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (v3)
  {
    if (v4)
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F1CAA0];
      uint64_t v7 = [v3 arrayByAddingObjectsFromArray:v4];
      uint64_t v8 = [v6 orderedSetWithArray:v7];
      id v9 = [v8 array];
      id v10 = (void *)[v9 copy];

      goto LABEL_7;
    }
    id v11 = v3;
  }
  else
  {
    id v11 = v4;
  }
  id v10 = v11;
LABEL_7:

  return v10;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xEu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return [v0 frameSeed];
}

id SignpostReporterCrossPlatformWidgetAllowlist()
{
  if (SignpostReporterCrossPlatformWidgetAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporterCrossPlatformWidgetAllowlist_onceToken, &__block_literal_global_3);
  }
  uint64_t v0 = (void *)SignpostReporterCrossPlatformWidgetAllowlist_allowlist;

  return v0;
}

void __SignpostReporterCrossPlatformWidgetAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporterCrossPlatformWidgetAllowlist_allowlist;
  SignpostReporterCrossPlatformWidgetAllowlist_allowlist = (uint64_t)&unk_1EF81E5E8;
}

id SignpostReporterCrossPlatformSiriVocabularyStringPasslist()
{
  if (SignpostReporterCrossPlatformSiriVocabularyStringPasslist_onceToken != -1) {
    dispatch_once(&SignpostReporterCrossPlatformSiriVocabularyStringPasslist_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)SignpostReporterCrossPlatformSiriVocabularyStringPasslist_siriVocabularyStringArray;

  return v0;
}

void __SignpostReporterCrossPlatformSiriVocabularyStringPasslist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporterCrossPlatformSiriVocabularyStringPasslist_siriVocabularyStringArray;
  SignpostReporterCrossPlatformSiriVocabularyStringPasslist_siriVocabularyStringArray = (uint64_t)&unk_1EF81E600;
}

id SignpostReporterCrossPlatformZelkovaAllowlist()
{
  if (SignpostReporterCrossPlatformZelkovaAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporterCrossPlatformZelkovaAllowlist_onceToken, &__block_literal_global_5);
  }
  uint64_t v0 = (void *)SignpostReporterCrossPlatformZelkovaAllowlist_allowlist;

  return v0;
}

void __SignpostReporterCrossPlatformZelkovaAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporterCrossPlatformZelkovaAllowlist_allowlist;
  SignpostReporterCrossPlatformZelkovaAllowlist_allowlist = (uint64_t)&unk_1EF81E618;
}

id SignpostReporteriOSSystemEnvironmentsAllowlist()
{
  if (SignpostReporteriOSSystemEnvironmentsAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporteriOSSystemEnvironmentsAllowlist_onceToken, &__block_literal_global_6);
  }
  uint64_t v0 = (void *)SignpostReporteriOSSystemEnvironmentsAllowlist_systemEnvironmentsStringArray;

  return v0;
}

void __SignpostReporteriOSSystemEnvironmentsAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporteriOSSystemEnvironmentsAllowlist_systemEnvironmentsStringArray;
  SignpostReporteriOSSystemEnvironmentsAllowlist_systemEnvironmentsStringArray = MEMORY[0x1E4F1CBF0];
}

id SignpostReporteriOSPoirotAllowlist()
{
  if (SignpostReporteriOSPoirotAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporteriOSPoirotAllowlist_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)SignpostReporteriOSPoirotAllowlist_poirotStringArray;

  return v0;
}

void __SignpostReporteriOSPoirotAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporteriOSPoirotAllowlist_poirotStringArray;
  SignpostReporteriOSPoirotAllowlist_poirotStringArray = (uint64_t)&unk_1EF81E630;
}

id SignpostReporterCrossPlatformSharedAllowlist()
{
  if (SignpostReporterCrossPlatformSharedAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporterCrossPlatformSharedAllowlist_onceToken, &__block_literal_global_8);
  }
  uint64_t v0 = (void *)SignpostReporterCrossPlatformSharedAllowlist_sharedAllowlistArray;

  return v0;
}

void __SignpostReporterCrossPlatformSharedAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporterCrossPlatformSharedAllowlist_sharedAllowlistArray;
  SignpostReporterCrossPlatformSharedAllowlist_sharedAllowlistArray = (uint64_t)&unk_1EF81E648;
}

id SignpostReporterCrossPlatformSiriHomeAutomationStringPasslist()
{
  if (SignpostReporterCrossPlatformSiriHomeAutomationStringPasslist_onceToken != -1) {
    dispatch_once(&SignpostReporterCrossPlatformSiriHomeAutomationStringPasslist_onceToken, &__block_literal_global_9);
  }
  uint64_t v0 = (void *)SignpostReporterCrossPlatformSiriHomeAutomationStringPasslist_siriHomeAutomationStringArray;

  return v0;
}

void __SignpostReporterCrossPlatformSiriHomeAutomationStringPasslist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporterCrossPlatformSiriHomeAutomationStringPasslist_siriHomeAutomationStringArray;
  SignpostReporterCrossPlatformSiriHomeAutomationStringPasslist_siriHomeAutomationStringArray = (uint64_t)&unk_1EF81E660;
}

id SignpostReporterCrossPlatformSiriPersonalUpdateStringPasslist()
{
  if (SignpostReporterCrossPlatformSiriPersonalUpdateStringPasslist_onceToken != -1) {
    dispatch_once(&SignpostReporterCrossPlatformSiriPersonalUpdateStringPasslist_onceToken, &__block_literal_global_10);
  }
  uint64_t v0 = (void *)SignpostReporterCrossPlatformSiriPersonalUpdateStringPasslist_siriPersonalUpdateStringArray;

  return v0;
}

void __SignpostReporterCrossPlatformSiriPersonalUpdateStringPasslist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporterCrossPlatformSiriPersonalUpdateStringPasslist_siriPersonalUpdateStringArray;
  SignpostReporterCrossPlatformSiriPersonalUpdateStringPasslist_siriPersonalUpdateStringArray = (uint64_t)&unk_1EF81E678;
}

uint64_t SignpostSupportTotalDurationMachContinuousTimeForIntervals(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && [v1 count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = 0;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v3);
          }
          v6 += objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "durationMachContinuousTime", (void)v10);
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t SignpostSupportTotalDurationMachContinuousTimeForIntervalsWithAdjustments(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = a2;
  if (v3 && [v3 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v5);
          }
          v8 += v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * i));
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

unint64_t SignpostSupportTotalDurationNsForIntervals(void *a1)
{
  id v1 = a1;
  double v2 = (double)(unint64_t)SignpostSupportTotalDurationMachContinuousTimeForIntervals(v1);
  id v3 = [v1 firstObject];

  [v3 timebaseRatio];
  unint64_t v5 = (unint64_t)(v4 * v2);

  return v5;
}

unint64_t SignpostSupportAverageDurationMachContinuousTimeForIntervals(void *a1)
{
  id v1 = a1;
  if ([v1 count])
  {
    unint64_t v2 = SignpostSupportTotalDurationMachContinuousTimeForIntervals(v1);
    unint64_t v3 = v2 / [v1 count];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

unint64_t SignpostSupportAverageDurationNsForIntervals(void *a1)
{
  id v1 = a1;
  if ([v1 count])
  {
    double v2 = (double)SignpostSupportAverageDurationMachContinuousTimeForIntervals(v1);
    unint64_t v3 = [v1 firstObject];
    [v3 timebaseRatio];
    unint64_t v5 = (unint64_t)(v4 * v2);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

unint64_t SignpostSupportStdDevMachContinuousTimeForIntervals(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  double v2 = v1;
  if (v1 && [v1 count] && objc_msgSend(v2, "count") != 1)
  {
    unint64_t v5 = SignpostSupportAverageDurationMachContinuousTimeForIntervals(v2);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v2;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      unint64_t v9 = 0;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v6);
          }
          long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "durationMachContinuousTime", (void)v16);
          unint64_t v14 = [v12 durationMachContinuousTime];
          unint64_t v15 = v13 - v5;
          if (v14 < v5) {
            unint64_t v15 = v5 - v13;
          }
          v9 += v15 * v15;
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
    else
    {
      unint64_t v9 = 0;
    }

    unint64_t v3 = (unint64_t)sqrt((double)(v9 / [v6 count]));
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

unint64_t SignpostSupportStdDevNsForIntervals(void *a1)
{
  id v1 = a1;
  double v2 = (double)SignpostSupportStdDevMachContinuousTimeForIntervals(v1);
  unint64_t v3 = [v1 firstObject];

  [v3 timebaseRatio];
  unint64_t v5 = (unint64_t)(v4 * v2);

  return v5;
}

id SignpostSupportSlidingWindowAveragesForIntervalsInMachContinuousTime(void *a1, uint64_t a2)
{
  return _filteredArrayForIntervalsWithBlock(a1, a2, &__block_literal_global_12);
}

id _filteredArrayForIntervalsWithBlock(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v7 = v5;
  uint64_t v8 = v7;
  if (!v7 || (unint64_t v9 = (2 * a2) | 1, [v7 count] < v9))
  {

LABEL_4:
    uint64_t v10 = 0;
    goto LABEL_5;
  }
  uint64_t v12 = 2 * a2;
  uint64_t v30 = [v8 count];
  size_t v31 = v30 - 2 * a2;
  uint64_t v13 = (uint64_t *)malloc_type_calloc(v31, 8uLL, 0x100004000313F17uLL);
  id v14 = v8;
  size_t v15 = [v14 count];
  long long v16 = malloc_type_calloc(v15, 8uLL, 0x100004000313F17uLL);
  if (v15)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      long long v18 = objc_msgSend(v14, "objectAtIndexedSubscript:", i, v30);
      v16[i] = [v18 durationMachContinuousTime];
    }
  }

  if (v30 != v12)
  {
    unint64_t v19 = 0;
    if (v31 <= 1) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = v31;
    }
    do
    {
      unint64_t v21 = 0;
      if (!__CFADD__(v19, v12))
      {
        unint64_t v22 = v19;
        do
          v21 += v16[v22++];
        while (v22 <= v19 + v12);
      }
      v13[v19++] = v21 / v9;
    }
    while (v19 != v20);
  }
  free(v16);

  if (!v13) {
    goto LABEL_4;
  }
  long long v23 = [v14 firstObject];
  [v23 timebaseRatio];
  double v25 = v24;

  uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v31];
  if (v30 != v12)
  {
    if (v31 <= 1) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = v31;
    }
    v27 = v13;
    do
    {
      uint64_t v28 = *v27++;
      v29 = v6[2](v6, v28, v25);
      [v10 addObject:v29];

      --v26;
    }
    while (v26);
  }
  free(v13);
LABEL_5:

  return v10;
}

uint64_t __SignpostSupportSlidingWindowAveragesForIntervalsInMachContinuousTime_block_invoke(uint64_t a1, uint64_t a2)
{
  return [NSNumber numberWithUnsignedLongLong:a2];
}

id SignpostSupportSlidingWindowAveragesForIntervalsInNs(void *a1, uint64_t a2)
{
  return _filteredArrayForIntervalsWithBlock(a1, a2, &__block_literal_global_2);
}

uint64_t __SignpostSupportSlidingWindowAveragesForIntervalsInNs_block_invoke(double a1, uint64_t a2, unint64_t a3)
{
  return [NSNumber numberWithUnsignedLongLong:(unint64_t)((double)a3 * a1)];
}

id SignpostSupportSortedSubArrayFromIntervals(void *a1, char a2, double a3)
{
  id v5 = a1;
  id v6 = v5;
  if (v5)
  {
    if ((unint64_t)[v5 count] > 1)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __SignpostSupportSortedSubArrayFromIntervals_block_invoke;
      v10[3] = &__block_descriptor_33_e73_q24__0___SignpostSupportTimeInterval__8___SignpostSupportTimeInterval__16l;
      char v11 = a2;
      uint64_t v8 = [v6 sortedArrayUsingComparator:v10];
      objc_msgSend(v8, "subarrayWithRange:", 0, vcvtpd_u64_f64((double)(unint64_t)objc_msgSend(v6, "count") * a3));
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = v6;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __SignpostSupportSortedSubArrayFromIntervals_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  unint64_t v6 = [a2 durationMachContinuousTime];
  unint64_t v7 = [v5 durationMachContinuousTime];

  if (v6 == v7) {
    return 0;
  }
  uint64_t v9 = 1;
  if (v6 <= v7) {
    uint64_t v9 = -1;
  }
  uint64_t v10 = 1;
  if (v6 >= v7) {
    uint64_t v10 = -1;
  }
  if (*(unsigned char *)(a1 + 32)) {
    return v10;
  }
  else {
    return v9;
  }
}

id SignpostSupportAverageDurationOfLongestIntervalsInMachContinuousTime(void *a1, double a2)
{
  return _percentileAverageDuration(a1, 1, 1, a2);
}

id _percentileAverageDuration(void *a1, char a2, int a3, double a4)
{
  id v7 = a1;
  uint64_t v8 = v7;
  if (v7)
  {
    if ([v7 count])
    {
      uint64_t v9 = SignpostSupportSortedSubArrayFromIntervals(v8, a2, a4);
      uint64_t v10 = v9;
      char v11 = NSNumber;
      if (a3) {
        unint64_t v12 = SignpostSupportAverageDurationMachContinuousTimeForIntervals(v9);
      }
      else {
        unint64_t v12 = SignpostSupportAverageDurationNsForIntervals(v9);
      }
      uint64_t v13 = [v11 numberWithUnsignedLongLong:v12];
    }
    else
    {
      uint64_t v13 = &unk_1EF81E760;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

id SignpostSupportAverageDurationOfLongestIntervalsInNs(void *a1, double a2)
{
  return _percentileAverageDuration(a1, 1, 0, a2);
}

id SignpostSupportAverageDurationOfShortestIntervalsInMachContinuousTime(void *a1, double a2)
{
  return _percentileAverageDuration(a1, 0, 1, a2);
}

id SignpostSupportAverageDurationOfShortestIntervalsInNs(void *a1, double a2)
{
  return _percentileAverageDuration(a1, 0, 0, a2);
}

id _valueForPercentile(void *a1, double a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 count];
  id v5 = 0;
  if (a2 <= 100.0 && a2 >= 0.0 && v4 != 0)
  {
    if (a2 == 0.0)
    {
      uint64_t v7 = [v3 firstObject];
    }
    else
    {
      if (a2 == 100.0) {
        [v3 lastObject];
      }
      else {
      uint64_t v7 = [v3 objectAtIndexedSubscript:vcvtad_u64_f64(a2 / 100.0 * (double)(unint64_t)(v4 - 1))];
      }
    }
    id v5 = (void *)v7;
  }

  return v5;
}

id SignpostReporterCrossPlatformAuthKitAllowlist()
{
  if (SignpostReporterCrossPlatformAuthKitAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporterCrossPlatformAuthKitAllowlist_onceToken, &__block_literal_global_13);
  }
  uint64_t v0 = (void *)SignpostReporterCrossPlatformAuthKitAllowlist_authKitStringArray;

  return v0;
}

void __SignpostReporterCrossPlatformAuthKitAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporterCrossPlatformAuthKitAllowlist_authKitStringArray;
  SignpostReporterCrossPlatformAuthKitAllowlist_authKitStringArray = (uint64_t)&unk_1EF81E690;
}

void sub_1A4591604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1A4591A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

id SignpostReporterCrossPlatformSiriVideoUTSOperationRequestStringPasslist()
{
  if (SignpostReporterCrossPlatformSiriVideoUTSOperationRequestStringPasslist_onceToken != -1) {
    dispatch_once(&SignpostReporterCrossPlatformSiriVideoUTSOperationRequestStringPasslist_onceToken, &__block_literal_global_15);
  }
  uint64_t v0 = (void *)SignpostReporterCrossPlatformSiriVideoUTSOperationRequestStringPasslist_siriVideoUTSOperationRequestStringArray;

  return v0;
}

void __SignpostReporterCrossPlatformSiriVideoUTSOperationRequestStringPasslist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporterCrossPlatformSiriVideoUTSOperationRequestStringPasslist_siriVideoUTSOperationRequestStringArray;
  SignpostReporterCrossPlatformSiriVideoUTSOperationRequestStringPasslist_siriVideoUTSOperationRequestStringArray = (uint64_t)&unk_1EF81E6A8;
}

id _SignpostSerializeableObjectFromSerializedObjectDictionary(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"SerType"];
    if (v5)
    {
      unint64_t v6 = +[SignpostEvent serializationTypeNumber];
      int v7 = [v5 isEqualToNumber:v6];

      if (v7)
      {
        uint64_t v8 = SignpostEvent;
LABEL_15:
        uint64_t v9 = (void *)[[v8 alloc] initWithDictionary:v4];
        goto LABEL_19;
      }
      uint64_t v10 = +[SignpostSupportLogMessage serializationTypeNumber];
      int v11 = [v5 isEqualToNumber:v10];

      if (v11)
      {
        uint64_t v8 = SignpostSupportLogMessage;
        goto LABEL_15;
      }
      if (([v5 isEqualToNumber:&unk_1EF81E790] & 1) != 0
        || (+[SignpostStreamEvent serializationTypeNumber],
            unint64_t v12 = objc_claimAutoreleasedReturnValue(),
            int v13 = [v5 isEqualToNumber:v12],
            v12,
            v13))
      {
        uint64_t v8 = SignpostStreamEvent;
        goto LABEL_15;
      }
      if (a2)
      {
        id v14 = (void *)MEMORY[0x1E4F28C58];
        size_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown object type: %llu", objc_msgSend(v5, "unsignedLongLongValue"));
        *a2 = [v14 errorWithCode:3 description:v15];
      }
    }
    else if (a2)
    {
      [MEMORY[0x1E4F28C58] errorWithCode:3 description:@"No serialized object type"];
      uint64_t v9 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

      goto LABEL_20;
    }
    uint64_t v9 = 0;
    goto LABEL_19;
  }
  if (a2)
  {
    [MEMORY[0x1E4F28C58] errorWithCode:3 description:@"nil serialization object dictionary"];
    uint64_t v9 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = 0;
  }
LABEL_20:

  return v9;
}

id _SignpostSupportSerializationDataFromObjectArray(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  unint64_t v6 = [[SignpostSupportSerializabledObjectCollection alloc] initWithSerializeableObjectArray:v5];

  if (v6)
  {
    id v7 = [(SignpostSupportSerializabledObjectCollection *)v6 newSerializedCollection:a2];
    uint64_t v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else if (a3)
    {
      *a3 = [MEMORY[0x1E4F28C58] errorWithCode:2 description:@"Could not create NSData for objects"];
    }
  }
  else if (a3)
  {
    [MEMORY[0x1E4F28C58] errorWithCode:2 description:@"Could not create SignpostSerializableObjectCollection"];
    uint64_t v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

BOOL SignpostSupportDeserializationEnumerateObjectArrayFromData(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = 0;
  BOOL v4 = +[SignpostSupportSerializabledObjectCollection enumerateSignpostSupportObjectsInSerializedCollection:a1 processingBlock:a3 errorOut:&v9];
  id v5 = v9;
  unint64_t v6 = v5;
  if (a2 && !v4)
  {
    if (v5)
    {
      id v7 = (void *)[v5 copy];
    }
    else
    {
      id v7 = [MEMORY[0x1E4F28C58] errorWithCode:3 description:@"Unknown data enumeration error"];
    }
    *a2 = v7;
  }

  return v4;
}

void _addArchiveEventFieldsInDictionaryWithArchiveEvent(void *a1, void *a2, int a3)
{
  id v36 = a1;
  id v5 = a2;
  unint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "_machContinuousTimestamp"));
  if (a3) {
    id v7 = @"machContinuousTime";
  }
  else {
    id v7 = @"time";
  }
  if (a3) {
    uint64_t v8 = @"ProcessID";
  }
  else {
    uint64_t v8 = @"PID";
  }
  if (a3) {
    id v9 = @"ProcessUniqueID";
  }
  else {
    id v9 = @"PUID";
  }
  if (a3) {
    uint64_t v10 = @"ThreadID";
  }
  else {
    uint64_t v10 = @"TID";
  }
  [v36 setObject:v6 forKeyedSubscript:v7];

  int v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "processID"));
  [v36 setObject:v11 forKeyedSubscript:v8];

  unint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "processUniqueID"));
  [v36 setObject:v12 forKeyedSubscript:v9];

  int v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "threadID"));
  [v36 setObject:v13 forKeyedSubscript:v10];

  if (a3)
  {
    id v14 = [v5 beginWallTimeStringWithTimeZoneName:0];
    if (!v14)
    {
LABEL_20:

      goto LABEL_21;
    }
    size_t v15 = @"WallTime";
LABEL_19:
    [v36 setObject:v14 forKeyedSubscript:v15];
    goto LABEL_20;
  }
  if (objc_msgSend(v5, "tv_sec") || objc_msgSend(v5, "tv_usec"))
  {
    long long v16 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v5, "tv_sec"));
    [v36 setObject:v16 forKeyedSubscript:@"tv_s"];

    long long v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "tv_usec"));
    [v36 setObject:v17 forKeyedSubscript:@"tv_us"];

    long long v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "tz_minuteswest"));
    [v36 setObject:v18 forKeyedSubscript:@"tz_m"];

    id v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "tz_dsttime"));
    size_t v15 = @"tz_d";
    goto LABEL_19;
  }
LABEL_21:
  unint64_t v19 = [v5 processImageUUID];

  if (v19)
  {
    uint64_t v20 = [v5 processImageUUID];
    unint64_t v21 = [v20 UUIDString];
    if (a3) {
      unint64_t v22 = @"ProcessImageUUID";
    }
    else {
      unint64_t v22 = @"imgUUID";
    }
    [v36 setObject:v21 forKeyedSubscript:v22];
  }
  long long v23 = [v5 processImagePath];

  if (v23)
  {
    double v24 = [v5 processImagePath];
    if (a3) {
      double v25 = @"ProcessImagePath";
    }
    else {
      double v25 = @"imgPath";
    }
    [v36 setObject:v24 forKeyedSubscript:v25];
  }
  uint64_t v26 = [v5 processName];

  if (v26)
  {
    v27 = [v5 processName];
    if (a3) {
      uint64_t v28 = @"ProcessName";
    }
    else {
      uint64_t v28 = @"PName";
    }
    [v36 setObject:v27 forKeyedSubscript:v28];
  }
  v29 = [v5 senderImageUUID];

  if (v29)
  {
    uint64_t v30 = [v5 senderImageUUID];
    size_t v31 = [v30 UUIDString];
    if (a3) {
      v32 = @"SenderImageUUID";
    }
    else {
      v32 = @"sImgUUID";
    }
    [v36 setObject:v31 forKeyedSubscript:v32];
  }
  v33 = [v5 senderImagePath];

  if (v33)
  {
    v34 = [v5 senderImagePath];
    if (a3) {
      v35 = @"SenderImagePath";
    }
    else {
      v35 = @"sImgPath";
    }
    [v36 setObject:v34 forKeyedSubscript:v35];
  }
}

BOOL _initArchiveEventFieldsWithSerializedObjectDictionary(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v4 objectForKeyedSubscript:@"time"];
  unint64_t v6 = v5;
  if (v5)
  {
    objc_msgSend(v3, "set_machContinuousTimestamp:", objc_msgSend(v5, "unsignedLongLongValue"));
    id v7 = [v4 objectForKeyedSubscript:@"PID"];
    uint64_t v8 = v7;
    if (v7)
    {
      objc_msgSend(v3, "setProcessID:", objc_msgSend(v7, "intValue"));
      id v9 = [v4 objectForKeyedSubscript:@"PUID"];
      uint64_t v10 = v9;
      if (v9)
      {
        objc_msgSend(v3, "setProcessUniqueID:", objc_msgSend(v9, "unsignedLongLongValue"));
        int v11 = [v4 objectForKeyedSubscript:@"TID"];
        BOOL v12 = v11 != 0;
        if (v11)
        {
          id v29 = v11;
          objc_msgSend(v3, "setThreadID:", objc_msgSend(v11, "unsignedLongLongValue"));
          int v13 = [v4 objectForKeyedSubscript:@"imgUUID"];
          if (v13)
          {
            id v14 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v13];
            [v3 setProcessImageUUID:v14];
          }
          size_t v15 = [v4 objectForKeyedSubscript:@"imgPath"];
          [v3 setProcessImagePath:v15];

          long long v16 = [v4 objectForKeyedSubscript:@"PName"];
          [v3 setProcessName:v16];

          long long v17 = [v4 objectForKeyedSubscript:@"sImgUUID"];
          if (v17)
          {
            long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v17];
            [v3 setSenderImageUUID:v18];
          }
          unint64_t v19 = [v4 objectForKeyedSubscript:@"sImgPath"];
          [v3 setSenderImagePath:v19];

          uint64_t v20 = [v4 objectForKeyedSubscript:@"tv_s"];
          unint64_t v21 = v20;
          if (v20) {
            objc_msgSend(v3, "setTv_sec:", objc_msgSend(v20, "unsignedLongLongValue"));
          }
          unint64_t v22 = [v4 objectForKeyedSubscript:@"tv_us"];
          long long v23 = v22;
          if (v22) {
            objc_msgSend(v3, "setTv_usec:", objc_msgSend(v22, "intValue"));
          }
          double v24 = [v4 objectForKeyedSubscript:@"tz_m"];
          double v25 = v24;
          if (v24) {
            objc_msgSend(v3, "setTz_minuteswest:", objc_msgSend(v24, "intValue"));
          }
          uint64_t v26 = [v4 objectForKeyedSubscript:@"tz_d"];
          v27 = v26;
          if (v26) {
            objc_msgSend(v3, "setTz_dsttime:", objc_msgSend(v26, "intValue"));
          }

          int v11 = v29;
        }
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

uint64_t ___stringPassesAllowlist_block_invoke()
{
  uint64_t result = SignpostPlatformForDevice();
  _stringPassesAllowlist_platform = result;
  return result;
}

id SignpostReporterCrossPlatformAppleAccountAllowlist()
{
  if (SignpostReporterCrossPlatformAppleAccountAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporterCrossPlatformAppleAccountAllowlist_onceToken, &__block_literal_global_17);
  }
  uint64_t v0 = (void *)SignpostReporterCrossPlatformAppleAccountAllowlist_appleAccountStringArray;

  return v0;
}

void __SignpostReporterCrossPlatformAppleAccountAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporterCrossPlatformAppleAccountAllowlist_appleAccountStringArray;
  SignpostReporterCrossPlatformAppleAccountAllowlist_appleAccountStringArray = (uint64_t)&unk_1EF81E6C0;
}

id SignpostReporterCrossPlatformSiriAudioStringPasslist()
{
  if (SignpostReporterCrossPlatformSiriAudioStringPasslist_onceToken != -1) {
    dispatch_once(&SignpostReporterCrossPlatformSiriAudioStringPasslist_onceToken, &__block_literal_global_18);
  }
  uint64_t v0 = (void *)SignpostReporterCrossPlatformSiriAudioStringPasslist_siriAudioStringArray;

  return v0;
}

void __SignpostReporterCrossPlatformSiriAudioStringPasslist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporterCrossPlatformSiriAudioStringPasslist_siriAudioStringArray;
  SignpostReporterCrossPlatformSiriAudioStringPasslist_siriAudioStringArray = (uint64_t)&unk_1EF81E6D8;
}

id _timeTranslatorDebugLog()
{
  if (_timeTranslatorDebugLog_onceToken != -1) {
    dispatch_once(&_timeTranslatorDebugLog_onceToken, &__block_literal_global_127);
  }
  uint64_t v0 = (void *)_timeTranslatorDebugLog_translator_log;

  return v0;
}

void sub_1A45969EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1A45970D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4597358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___timeTranslatorDebugLog_block_invoke()
{
  _timeTranslatorDebugLog_translator_log = (uint64_t)os_log_create("com.apple.SignpostSupport", "TimeTranslationDebug");

  return MEMORY[0x1F41817F8]();
}

id SignpostSupportAllowlistedStringSetForCurrentDevice()
{
  uint64_t v0 = (void *)SignpostPlatformForDevice();

  return SignpostReporterAllowlistedStringSet(v0);
}

id _combinedStdDev(unint64_t a1, unint64_t a2, double a3, double a4, double a5, double a6)
{
  if (a2 | a1)
  {
    if (a1)
    {
      if (a2)
      {
        double v7 = a3 / (double)a1;
        double v8 = a5 / (double)a2;
        double v9 = a3 + a5;
        double v10 = (double)(a2 + a1);
        double v11 = v9 / v10;
        double v12 = (a4 * a4 + (v7 - v11) * (v7 - v11)) * (double)a1;
        int v13 = NSNumber;
        double v14 = sqrt((v12 + (a6 * a6 + (v8 - v11) * (v8 - v11)) * (double)a2) / v10);
      }
      else
      {
        int v13 = NSNumber;
        double v14 = a4;
      }
    }
    else
    {
      int v13 = NSNumber;
      double v14 = a6;
    }
    size_t v15 = [v13 numberWithDouble:v14];
  }
  else
  {
    size_t v15 = 0;
  }
  return v15;
}

id _stringAfterPrefix(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 rangeOfString:a2 options:8];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [v3 substringFromIndex:v4 + v5];
  }

  return v6;
}

id _checkTokenString(void *a1)
{
  id v1 = a1;
  if (_checkTokenString_onceToken != -1) {
    dispatch_once(&_checkTokenString_onceToken, &__block_literal_global_779);
  }
  if ([v1 rangeOfCharacterFromSet:_checkTokenString_disallowedCharSet] == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v2 = 0;
  }
  else
  {
    double v2 = [NSString stringWithFormat:@"os_signpost aggregation token '%@' contains illegal characters. Please use only alphanumeric characters and '_'.", v1];
  }

  return v2;
}

void _addToPayloadDictionary(void *a1, void *a2)
{
  id v15 = a1;
  id v3 = a2;
  if ([v3 shouldAdd])
  {
    uint64_t v4 = [v3 total];
    uint64_t v5 = [v3 _coreAnalyticsTotalFieldName];
    [v15 setObject:v4 forKeyedSubscript:v5];

    uint64_t v6 = [v3 min];

    if (v6)
    {
      double v7 = [v3 min];
      double v8 = [v3 _coreAnalyticsMinFieldName];
      [v15 setObject:v7 forKeyedSubscript:v8];
    }
    double v9 = [v3 min];

    if (v9)
    {
      double v10 = [v3 max];
      double v11 = [v3 _coreAnalyticsMaxFieldName];
      [v15 setObject:v10 forKeyedSubscript:v11];
    }
    double v12 = [v3 stddev];

    if (v12)
    {
      int v13 = [v3 stddev];
      double v14 = [v3 _coreAnalyticsStdDevFieldName];
      [v15 setObject:v13 forKeyedSubscript:v14];
    }
  }
}

uint64_t _placeholderTypeForSegment(void *a1)
{
  id v1 = a1;
  double v2 = [v1 typeNamespace];
  int v3 = [v2 isEqualToString:@"signpost.aggregation"];

  if (v3)
  {
    uint64_t v4 = [v1 type];
    char v5 = [v4 isEqualToString:@"description"];

    if (v5)
    {
      unsigned __int8 v6 = 0;
    }
    else
    {
      double v8 = [v1 type];
      char v9 = [v8 isEqualToString:@"count"];

      if (v9)
      {
        unsigned __int8 v6 = 1;
      }
      else
      {
        double v10 = [v1 type];
        char v11 = [v10 isEqualToString:@"total_duration_ns"];

        if (v11)
        {
          unsigned __int8 v6 = 2;
        }
        else
        {
          double v12 = [v1 type];
          char v13 = [v12 isEqualToString:@"average_duration_ns"];

          if (v13)
          {
            unsigned __int8 v6 = 3;
          }
          else
          {
            double v14 = [v1 type];
            char v15 = [v14 isEqualToString:@"min_duration_ns"];

            if (v15)
            {
              unsigned __int8 v6 = 4;
            }
            else
            {
              long long v16 = [v1 type];
              char v17 = [v16 isEqualToString:@"max_duration_ns"];

              if (v17)
              {
                unsigned __int8 v6 = 5;
              }
              else
              {
                long long v18 = [v1 type];
                char v19 = [v18 isEqualToString:@"duration_stddev_ns"];

                if (v19)
                {
                  unsigned __int8 v6 = 6;
                }
                else
                {
                  uint64_t v20 = [v1 type];
                  char v21 = [v20 isEqualToString:@"measure_total"];

                  if (v21)
                  {
                    unsigned __int8 v6 = 7;
                  }
                  else
                  {
                    unint64_t v22 = [v1 type];
                    char v23 = [v22 isEqualToString:@"measure_average"];

                    if (v23)
                    {
                      unsigned __int8 v6 = 8;
                    }
                    else
                    {
                      double v24 = [v1 type];
                      char v25 = [v24 isEqualToString:@"measure_min"];

                      if (v25)
                      {
                        unsigned __int8 v6 = 9;
                      }
                      else
                      {
                        uint64_t v26 = [v1 type];
                        char v27 = [v26 isEqualToString:@"measure_max"];

                        if (v27)
                        {
                          unsigned __int8 v6 = 10;
                        }
                        else
                        {
                          uint64_t v28 = [v1 type];
                          int v29 = [v28 isEqualToString:@"measure_stddev"];

                          if (v29) {
                            unsigned __int8 v6 = 11;
                          }
                          else {
                            unsigned __int8 v6 = 12;
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
      }
    }
  }
  else
  {
    unsigned __int8 v6 = 13;
  }

  return v6;
}

void ___checkTokenString_block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890._"];
  uint64_t v0 = [v2 invertedSet];
  id v1 = (void *)_checkTokenString_disallowedCharSet;
  _checkTokenString_disallowedCharSet = v0;
}

uint64_t ___unknownAggregationError_block_invoke()
{
  _unknownAggregationError_unknownAggregationError = [MEMORY[0x1E4F28C58] errorWithCode:9 description:@"Unknown aggregation error"];

  return MEMORY[0x1F41817F8]();
}

id SignpostReporterCrossPlatformSiriPlaybackControlsStringPasslist()
{
  if (SignpostReporterCrossPlatformSiriPlaybackControlsStringPasslist_onceToken != -1) {
    dispatch_once(&SignpostReporterCrossPlatformSiriPlaybackControlsStringPasslist_onceToken, &__block_literal_global_21);
  }
  uint64_t v0 = (void *)SignpostReporterCrossPlatformSiriPlaybackControlsStringPasslist_siriPlaybackControlsStringArray;

  return v0;
}

void __SignpostReporterCrossPlatformSiriPlaybackControlsStringPasslist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporterCrossPlatformSiriPlaybackControlsStringPasslist_siriPlaybackControlsStringArray;
  SignpostReporterCrossPlatformSiriPlaybackControlsStringPasslist_siriPlaybackControlsStringArray = (uint64_t)&unk_1EF81E6F0;
}

id SignpostReporterCrossPlatformAppleIDAuthenticationAllowlist()
{
  if (SignpostReporterCrossPlatformAppleIDAuthenticationAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporterCrossPlatformAppleIDAuthenticationAllowlist_onceToken, &__block_literal_global_22);
  }
  uint64_t v0 = (void *)SignpostReporterCrossPlatformAppleIDAuthenticationAllowlist_appleIDAuthenticationStringArray;

  return v0;
}

void __SignpostReporterCrossPlatformAppleIDAuthenticationAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporterCrossPlatformAppleIDAuthenticationAllowlist_appleIDAuthenticationStringArray;
  SignpostReporterCrossPlatformAppleIDAuthenticationAllowlist_appleIDAuthenticationStringArray = (uint64_t)&unk_1EF81E708;
}

id SignpostReporterCrossPlatformSpeechProfileAllowlist()
{
  if (SignpostReporterCrossPlatformSpeechProfileAllowlist_onceToken != -1) {
    dispatch_once(&SignpostReporterCrossPlatformSpeechProfileAllowlist_onceToken, &__block_literal_global_23);
  }
  uint64_t v0 = (void *)SignpostReporterCrossPlatformSpeechProfileAllowlist_allowlist;

  return v0;
}

void __SignpostReporterCrossPlatformSpeechProfileAllowlist_block_invoke()
{
  uint64_t v0 = (void *)SignpostReporterCrossPlatformSpeechProfileAllowlist_allowlist;
  SignpostReporterCrossPlatformSpeechProfileAllowlist_allowlist = (uint64_t)&unk_1EF81E720;
}

void sub_1A45A2938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A45A3548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A45A3E68(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 56));
  _Unwind_Resume(a1);
}

void sub_1A45A4254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

uint64_t _dateRangeIntersection(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if ([v7 compare:v8] == -1 && objc_msgSend(v9, "compare:", v10) == -1)
  {
    if ([v7 compare:v9] || objc_msgSend(v8, "compare:", v10))
    {
      if ([v7 compare:v10] == -1)
      {
        if ([v9 compare:v8] == -1)
        {
          if ([v7 compare:v9] == 1 || objc_msgSend(v10, "compare:", v8) == 1)
          {
            if ([v9 compare:v7] == 1 || objc_msgSend(v8, "compare:", v10) == 1) {
              uint64_t v11 = 5;
            }
            else {
              uint64_t v11 = 4;
            }
          }
          else
          {
            uint64_t v11 = 3;
          }
        }
        else
        {
          uint64_t v11 = 1;
        }
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v11 = 2;
    }
  }
  else
  {
    uint64_t v11 = 6;
  }

  return v11;
}

uint64_t _mctIntervalIntersection(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unsigned __int8 v4 = 6;
  if (a1 < a2 && a3 < a4)
  {
    if (a1 == a3 && a2 == a4)
    {
      return 2;
    }
    else if (a1 >= a4)
    {
      return 0;
    }
    else if (a3 >= a2)
    {
      return 1;
    }
    else if (a1 > a3 || a2 < a4)
    {
      if (a4 < a2 || a3 > a1) {
        return 5;
      }
      else {
        return 4;
      }
    }
    else
    {
      return 3;
    }
  }
  return v4;
}

id _numberValueForKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  char v5 = _objectValueForKey((uint64_t)v4, v3, 3);

  return v5;
}

id _getEarliestDate(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  char v5 = (void *)v4;
  if (v3 | v4)
  {
    if (!v3 || (id v7 = (void *)v3, v4))
    {
      if (v3 || (id v7 = (void *)v4) == 0)
      {
        if ([(id)v3 compare:v4] == -1) {
          id v7 = (void *)v3;
        }
        else {
          id v7 = v5;
        }
      }
    }
    id v6 = v7;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

id _getLatestDate(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  char v5 = (void *)v4;
  if (v3 | v4)
  {
    if (!v3 || (id v7 = (void *)v3, v4))
    {
      if (v3 || (id v7 = (void *)v4) == 0)
      {
        if ([(id)v3 compare:v4] == -1) {
          id v7 = v5;
        }
        else {
          id v7 = (void *)v3;
        }
      }
    }
    id v6 = v7;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

id _timeIntervalDict(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  unint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v2, "startMachContinuousTime"));
  [v3 setObject:v4 forKeyedSubscript:kSSCAMLTimeIntervalKey_StartMCT];

  char v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v2, "endMachContinuousTime"));
  [v3 setObject:v5 forKeyedSubscript:kSSCAMLTimeIntervalKey_EndMCT];

  id v6 = NSNumber;
  [v2 startSeconds];
  id v7 = objc_msgSend(v6, "numberWithDouble:");
  [v3 setObject:v7 forKeyedSubscript:kSSCAMLTimeIntervalKey_StartMCTSeconds];

  id v8 = NSNumber;
  [v2 endSeconds];
  id v9 = objc_msgSend(v8, "numberWithDouble:");
  [v3 setObject:v9 forKeyedSubscript:kSSCAMLTimeIntervalKey_EndMCTSeconds];

  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v2, "durationMachContinuousTime"));
  [v3 setObject:v10 forKeyedSubscript:kSSCAMLTimeIntervalKey_DurationMCT];

  uint64_t v11 = NSNumber;
  [v2 durationSeconds];
  double v12 = objc_msgSend(v11, "numberWithFloat:");
  [v3 setObject:v12 forKeyedSubscript:kSSCAMLTimeIntervalKey_DurationMCTSeconds];

  char v13 = [v2 startDate];
  double v14 = _stringForDate(v13);
  [v3 setObject:v14 forKeyedSubscript:kSSCAMLTimeIntervalKey_StartDate];

  char v15 = [v2 endDate];

  long long v16 = _stringForDate(v15);
  [v3 setObject:v16 forKeyedSubscript:kSSCAMLTimeIntervalKey_EndDate];

  return v3;
}

SSCAMLDurationStats *_durationStat(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [a1 groupNameToGroupDict];
    id v8 = [v7 objectForKeyedSubscript:v5];

    id v9 = [SSCAMLDurationStats alloc];
    id v10 = v9;
    if (v8)
    {
      uint64_t v11 = [v8 measuredValueTypeToMeasuredValueDict];
      double v12 = [v11 objectForKeyedSubscript:v6];
      char v13 = [(SSCAMLDurationStats *)v10 initWithMeasuredValue:v12];
    }
    else
    {
      char v13 = [(SSCAMLDurationStats *)v9 initWithMeasuredValue:0];
    }
  }
  else
  {
    char v13 = [[SSCAMLDurationStats alloc] initWithMeasuredValue:0];
  }

  return v13;
}

uint64_t _dateRangeIntersectionWithValidation(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if ([v7 includeTimelines])
  {
    id v10 = [v7 startDate];
    uint64_t v11 = [v7 endDate];
    double v12 = (void *)v11;
    if (!v10 || !v11)
    {
      if (a4)
      {
        *a4 = [MEMORY[0x1E4F28C58] errorWithCode:11 description:@"Insufficient information to determine client session date ranges"];
      }
      goto LABEL_14;
    }
    if (v8)
    {
      if (v9) {
        goto LABEL_6;
      }
    }
    else
    {
      id v8 = v10;
      if (v9) {
        goto LABEL_6;
      }
    }
    id v9 = v12;
LABEL_6:
    uint64_t v13 = _dateRangeIntersection(v8, v9, v10, v12);
    uint64_t v14 = v13;
    if (!a4 || v13 != 6) {
      goto LABEL_15;
    }
    char v15 = (void *)[[NSString alloc] initWithFormat:@"Malformed date interval: %@ -> %@", v8, v9];
    *a4 = [MEMORY[0x1E4F28C58] errorWithCode:11 description:v15];

LABEL_14:
    uint64_t v14 = 6;
LABEL_15:

    goto LABEL_16;
  }
  if (a4)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithCode:11 description:@"Cannot filter client session that does not have timeline information"];
  }
  uint64_t v14 = 6;
LABEL_16:

  return v14;
}

id _intervalsIntersectingDateRange(void *a1, void *a2, void *a3, char a4, void *a5)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  if ([v11 count])
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v22 = v11;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          int v19 = _dateRangeIntersectionWithValidation(v18, v9, v10, a5);
          if (v19)
          {
            if (v19 == 1) {
              goto LABEL_15;
            }
            if (v19 == 6)
            {

              id v20 = 0;
              goto LABEL_18;
            }
            if (v19 == 3 || (a4 & 1) == 0) {
              [v12 addObject:v18];
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    id v20 = v12;
LABEL_18:

    id v11 = v22;
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

uint64_t _mctIntersectionWithValidation(void *a1, unint64_t a2, unint64_t a3, void *a4)
{
  id v7 = a1;
  if ([v7 includeTimelines])
  {
    unint64_t v8 = [v7 startMachContinuousTime];
    unint64_t v9 = [v7 endMachContinuousTime];
    if (!a2) {
      a2 = v8;
    }
    if (a3 == -1) {
      a3 = v9;
    }
    uint64_t v10 = _mctIntervalIntersection(a2, a3, v8, v9);
    uint64_t v11 = v10;
    if (a4 && v10 == 6)
    {
      id v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Malformed MCT interval: %llu -> %llu", a2, a3);
      *a4 = [MEMORY[0x1E4F28C58] errorWithCode:11 description:v12];
    }
  }
  else
  {
    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] errorWithCode:11 description:@"Cannot filter client session that does not have timeline information"];
    }
    uint64_t v11 = 6;
  }

  return v11;
}

id _intervalsIntersectingMCTInterval(unint64_t a1, unint64_t a2, void *a3, char a4, void *a5)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if ([v9 count])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v20 = v9;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          int v17 = _mctIntersectionWithValidation(v16, a1, a2, a5);
          if (v17)
          {
            if (v17 == 1) {
              goto LABEL_15;
            }
            if (v17 == 6)
            {

              id v18 = 0;
              goto LABEL_18;
            }
            if (v17 == 3 || (a4 & 1) == 0) {
              [v10 addObject:v16];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    id v18 = v10;
LABEL_18:

    id v9 = v20;
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

void sub_1A45AC924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
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

void sub_1A45ACD18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *_stringForDate(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (_stringForDate_onceToken == -1)
  {
    if (v1)
    {
LABEL_3:
      id v3 = [(id)_stringForDate_formatter stringFromDate:v2];
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&_stringForDate_onceToken, &__block_literal_global_1014);
    if (v2) {
      goto LABEL_3;
    }
  }
  id v3 = @"Unknown";
LABEL_6:

  return v3;
}

id _valuesForOnGlassIntervals(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  unint64_t v4 = a2;
  if ([v3 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
          objc_msgSend(v5, "addObject:", v11, (void)v13);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

id _objectValueForKey(uint64_t a1, void *a2, int a3)
{
  if (a2)
  {
    unint64_t v4 = [a2 objectForKeyedSubscript:a1];
    if ([v4 count] == 1)
    {
      id v5 = [v4 firstObject];
      id v6 = [v5 argument];
      int v7 = [v6 type];

      if (v7 == a3)
      {
        uint64_t v8 = [v5 argument];
        uint64_t v9 = [v8 argumentObject];

        if (objc_opt_isKindOfClass()) {
          id v10 = v9;
        }
        else {
          id v10 = 0;
        }
      }
      else
      {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

uint64_t ___stringForDate_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  id v1 = (void *)_stringForDate_formatter;
  _stringForDate_formatter = (uint64_t)v0;

  id v2 = (void *)_stringForDate_formatter;

  return [v2 setFormatOptions:3955];
}

uint64_t *_adjustTimeVal(uint64_t *result, uint64_t a2)
{
  if (a2)
  {
    if (a2 >= 0) {
      unint64_t v2 = a2;
    }
    else {
      unint64_t v2 = -a2;
    }
    unint64_t v3 = v2 / 0x3B9ACA00;
    int v4 = v2 % 0x3B9ACA00 / 0x3E8;
    uint64_t v5 = *result;
    int v6 = *((_DWORD *)result + 2);
    if (a2 < 1)
    {
      uint64_t v7 = v5 - v3;
      int v8 = v6 - v4;
      if (v8 < 0)
      {
        --v7;
        v8 += 1000000;
      }
    }
    else
    {
      uint64_t v7 = v5 + v3;
      int v8 = v6 + v4;
      if (v8 > 999999)
      {
        ++v7;
        v8 -= 1000000;
      }
    }
    *uint64_t result = v7;
    *((_DWORD *)result + 2) = v8;
  }
  return result;
}

uint64_t _archiveEventsAreEqual(void *a1, void *a2)
{
  id v4 = a1;
  id v5 = a2;
  int v6 = [v4 processID];
  if (v6 != [v5 processID]) {
    goto LABEL_47;
  }
  uint64_t v7 = [v4 processUniqueID];
  if (v7 != [v5 processUniqueID]) {
    goto LABEL_47;
  }
  uint64_t v8 = [v4 threadID];
  if (v8 != [v5 threadID]) {
    goto LABEL_47;
  }
  uint64_t v9 = [v4 processImageUUID];
  if (v9)
  {
    unint64_t v2 = [v5 processImageUUID];
    if (!v2) {
      goto LABEL_46;
    }
  }
  id v10 = [v4 processImageUUID];
  if (v10)
  {

    if (v9)
    {
    }
  }
  else
  {
    id v11 = [v5 processImageUUID];

    if (v9)
    {
    }
    if (v11) {
      goto LABEL_47;
    }
  }
  uint64_t v12 = [v4 processImageUUID];

  if (!v12
    || ([v4 processImageUUID],
        long long v13 = objc_claimAutoreleasedReturnValue(),
        [v5 processImageUUID],
        unint64_t v2 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 isEqual:v2],
        v2,
        v13,
        v14))
  {
    uint64_t v9 = [v4 processImagePath];
    if (v9)
    {
      unint64_t v2 = [v5 processImagePath];
      if (!v2) {
        goto LABEL_46;
      }
    }
    long long v15 = [v4 processImagePath];
    if (v15)
    {

      if (v9)
      {
      }
    }
    else
    {
      long long v16 = [v5 processImagePath];

      if (v9)
      {
      }
      if (v16) {
        goto LABEL_47;
      }
    }
    int v17 = [v4 processImagePath];

    if (!v17
      || ([v4 processImagePath],
          uint64_t v18 = objc_claimAutoreleasedReturnValue(),
          [v5 processImagePath],
          unint64_t v2 = objc_claimAutoreleasedReturnValue(),
          int v19 = [v18 isEqual:v2],
          v2,
          v18,
          v19))
    {
      uint64_t v9 = [v4 processName];
      if (v9)
      {
        unint64_t v2 = [v5 processName];
        if (!v2) {
          goto LABEL_46;
        }
      }
      id v20 = [v4 processName];
      if (v20)
      {

        if (v9)
        {
        }
      }
      else
      {
        long long v21 = [v5 processName];

        if (v9)
        {
        }
        if (v21) {
          goto LABEL_47;
        }
      }
      long long v22 = [v4 processName];

      if (!v22
        || ([v4 processName],
            long long v23 = objc_claimAutoreleasedReturnValue(),
            [v5 processName],
            unint64_t v2 = objc_claimAutoreleasedReturnValue(),
            int v24 = [v23 isEqual:v2],
            v2,
            v23,
            v24))
      {
        uint64_t v9 = [v4 senderImageUUID];
        if (v9)
        {
          unint64_t v2 = [v5 senderImageUUID];
          if (!v2) {
            goto LABEL_46;
          }
        }
        long long v25 = [v4 senderImageUUID];
        if (v25)
        {

          if (v9)
          {
          }
        }
        else
        {
          uint64_t v26 = [v5 senderImageUUID];

          if (v9)
          {
          }
          if (v26) {
            goto LABEL_47;
          }
        }
        char v27 = [v4 senderImageUUID];

        if (!v27
          || ([v4 senderImageUUID],
              uint64_t v28 = objc_claimAutoreleasedReturnValue(),
              [v5 senderImageUUID],
              unint64_t v2 = objc_claimAutoreleasedReturnValue(),
              int v29 = [v28 isEqual:v2],
              v2,
              v28,
              v29))
        {
          uint64_t v9 = [v4 senderImagePath];
          if (v9)
          {
            unint64_t v2 = [v5 senderImagePath];
            if (!v2)
            {
LABEL_46:

              goto LABEL_47;
            }
          }
          v32 = [v4 senderImagePath];
          if (v32)
          {

            if (v9)
            {
            }
          }
          else
          {
            v33 = [v5 senderImagePath];

            if (v9)
            {
            }
            if (v33) {
              goto LABEL_47;
            }
          }
          v34 = [v4 senderImagePath];

          if (!v34
            || ([v4 senderImagePath],
                v35 = objc_claimAutoreleasedReturnValue(),
                [v5 senderImagePath],
                id v36 = objc_claimAutoreleasedReturnValue(),
                int v37 = [v35 isEqual:v36],
                v36,
                v35,
                v37))
          {
            uint64_t v30 = 1;
            goto LABEL_48;
          }
        }
      }
    }
  }
LABEL_47:
  uint64_t v30 = 0;
LABEL_48:

  return v30;
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

unsigned char *OUTLINED_FUNCTION_3_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = 0;
  *a2 = 0;
  return result;
}

void __SignpostReporterShouldUseAllowlist_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_1A4576000, log, OS_LOG_TYPE_DEBUG, "Not using string allowlist due to os_variant", v1, 2u);
}

void __SignpostReporterShouldUseAllowlist_block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_1A4576000, log, OS_LOG_TYPE_DEBUG, "Defaulting to using string allowlist", v1, 2u);
}

void SignpostReporterAllowlistedStringSet_cold_1()
{
  [(id)SignpostReporterAllowlistedStringSet_allowlistSet_24 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4576000, v0, v1, "Using string allowlist with %lu elements", v2, v3, v4, v5, v6);
}

void __SignpostReporterAllowlistedStringSet_block_invoke_cold_1()
{
  [(id)SignpostReporterAllowlistedStringSet_allowlistSet count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4576000, v0, v1, "Using string allowlist with %lu elements for macOS platform", v2, v3, v4, v5, v6);
}

void __SignpostReporterAllowlistedStringSet_block_invoke_11_cold_1()
{
  [(id)SignpostReporterAllowlistedStringSet_allowlistSet_9 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4576000, v0, v1, "Using string allowlist with %lu elements for iPhoneOS platform", v2, v3, v4, v5, v6);
}

void __SignpostReporterAllowlistedStringSet_block_invoke_16_cold_1()
{
  [(id)SignpostReporterAllowlistedStringSet_allowlistSet_14 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4576000, v0, v1, "Using string allowlist with %lu elements for tvOS platform", v2, v3, v4, v5, v6);
}

void __SignpostReporterAllowlistedStringSet_block_invoke_21_cold_1()
{
  [(id)SignpostReporterAllowlistedStringSet_allowlistSet_19 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4576000, v0, v1, "Using string allowlist with %lu elements for watchOS platform", v2, v3, v4, v5, v6);
}

void __SignpostReporterAllowlistedStringSet_block_invoke_26_cold_1()
{
  [(id)SignpostReporterAllowlistedStringSet_allowlistSet_24 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4576000, v0, v1, "Using string allowlist with %lu elements for bridgeOS platform", v2, v3, v4, v5, v6);
}

void __SignpostReporterAllowlistedStringSet_block_invoke_31_cold_1()
{
  [(id)SignpostReporterAllowlistedStringSet_allowlistSet_29 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4576000, v0, v1, "Using string allowlist with %lu elements for Unknown platform", v2, v3, v4, v5, v6);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
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

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC5B0](a1, a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC870](a1, a2);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
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

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x1F40CDF60](__name, __value, *(void *)&__overwrite);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

void tzset(void)
{
}

int unsetenv(const char *a1)
{
  return MEMORY[0x1F40CE5F8](a1);
}