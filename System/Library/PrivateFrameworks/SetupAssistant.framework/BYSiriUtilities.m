@interface BYSiriUtilities
+ (BOOL)currentVoiceIsDefaultVoice;
+ (BOOL)deviceSupportsSystemAssistantExperience;
+ (BOOL)isIntelligenceVoiceSelectionCompleted;
+ (BOOL)isVoiceTriggerEnabled;
+ (uint64_t)deviceSupportsSystemAssistantExperience;
+ (void)intelligenceVoiceSelectionDidComplete;
+ (void)requiresAcknowledgementForDataSharing:(id)a3;
@end

@implementation BYSiriUtilities

+ (void)requiresAcknowledgementForDataSharing:(id)a3
{
  id v3 = a3;
  v4 = [getVTPreferencesClass() sharedPreferences];
  int v5 = [v4 voiceTriggerEnabled];

  uint64_t v22 = 0;
  uint64_t v23 = (uint64_t)&v22;
  uint64_t v24 = 0x2050000000;
  v6 = (void *)getAFPreferencesClass_softClass;
  v25 = (void *)getAFPreferencesClass_softClass;
  if (!getAFPreferencesClass_softClass)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = (uint64_t)__getAFPreferencesClass_block_invoke;
    v19 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5D2B9E8;
    v20 = (void (*)(uint64_t))&v22;
    __getAFPreferencesClass_block_invoke((uint64_t)&v16);
    v6 = *(void **)(v23 + 24);
  }
  id v7 = v6;
  _Block_object_dispose(&v22, 8);
  v8 = [v7 sharedPreferences];
  int v9 = [v8 assistantIsEnabled];

  if ((v5 | v9))
  {
    uint64_t v16 = 0;
    uint64_t v17 = (uint64_t)&v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy_;
    v20 = __Block_byref_object_dispose_;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2050000000;
    v10 = (void *)getAFSettingsConnectionClass_softClass;
    uint64_t v30 = getAFSettingsConnectionClass_softClass;
    if (!getAFSettingsConnectionClass_softClass)
    {
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      uint64_t v24 = (uint64_t)__getAFSettingsConnectionClass_block_invoke;
      v25 = &unk_1E5D2B9E8;
      v26 = &v27;
      __getAFSettingsConnectionClass_block_invoke((uint64_t)&v22);
      v10 = (void *)v28[3];
    }
    v11 = v10;
    _Block_object_dispose(&v27, 8);
    id v21 = objc_alloc_init(v11);
    v12 = *(void **)(v17 + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__BYSiriUtilities_requiresAcknowledgementForDataSharing___block_invoke;
    v13[3] = &unk_1E5D2B9C0;
    v15 = &v16;
    id v14 = v3;
    [v12 getSiriDataSharingOptInStatusWithCompletion:v13];

    _Block_object_dispose(&v16, 8);
  }
  else if (v3)
  {
    (*((void (**)(id, void))v3 + 2))(v3, 0);
  }
}

void __57__BYSiriUtilities_requiresAcknowledgementForDataSharing___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  if (v5)
  {
    v8 = _BYLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __57__BYSiriUtilities_requiresAcknowledgementForDataSharing___block_invoke_cold_1((uint64_t)v5, v8);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, BOOL))(v9 + 16))(v9, a3 == 0);
  }
}

+ (BOOL)isVoiceTriggerEnabled
{
  v2 = [getVTPreferencesClass() sharedPreferences];
  char v3 = [v2 voiceTriggerEnabled];

  return v3;
}

+ (BOOL)deviceSupportsSystemAssistantExperience
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v2 = (uint64_t (*)(void))getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr;
  uint64_t v9 = getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr;
  if (!getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr)
  {
    char v3 = (void *)AssistantServicesLibrary();
    v7[3] = (uint64_t)dlsym(v3, "AFDeviceSupportsSystemAssistantExperience");
    getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr = (_UNKNOWN *)v7[3];
    v2 = (uint64_t (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    id v5 = (_Unwind_Exception *)+[BYSiriUtilities deviceSupportsSystemAssistantExperience]();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return v2();
}

+ (BOOL)currentVoiceIsDefaultVoice
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  v2 = (void (*)(void))get_AFPreferencesOutputVoiceSymbolLoc_ptr;
  uint64_t v22 = get_AFPreferencesOutputVoiceSymbolLoc_ptr;
  if (!get_AFPreferencesOutputVoiceSymbolLoc_ptr)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __get_AFPreferencesOutputVoiceSymbolLoc_block_invoke;
    uint64_t v17 = &unk_1E5D2B9E8;
    uint64_t v18 = &v19;
    char v3 = (void *)AssistantServicesLibrary();
    v20[3] = (uint64_t)dlsym(v3, "_AFPreferencesOutputVoice");
    get_AFPreferencesOutputVoiceSymbolLoc_ptr = *(_UNKNOWN **)(v18[1] + 24);
    v2 = (void (*)(void))v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v2)
  {
    v13 = (_Unwind_Exception *)+[BYSiriUtilities deviceSupportsSystemAssistantExperience]();
    _Block_object_dispose(&v19, 8);
    _Unwind_Resume(v13);
  }
  v4 = v2();
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  id v5 = (void *)getAFVoiceInfoClass_softClass;
  uint64_t v22 = (void *)getAFVoiceInfoClass_softClass;
  if (!getAFVoiceInfoClass_softClass)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __getAFVoiceInfoClass_block_invoke;
    uint64_t v17 = &unk_1E5D2B9E8;
    uint64_t v18 = &v19;
    __getAFVoiceInfoClass_block_invoke((uint64_t)&v14);
    id v5 = (void *)v20[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v19, 8);
  id v7 = [v4 languageCode];
  uint64_t v8 = [v6 voiceInfoForSessionLanguageCode:v7];

  uint64_t v9 = [v4 name];
  v10 = [v8 name];
  char v11 = [v9 isEqualToString:v10];

  return v11;
}

+ (BOOL)isIntelligenceVoiceSelectionCompleted
{
  return CFPreferencesGetAppBooleanValue(@"SiriIntelligenceVoiceSelectionCompleted", @"com.apple.purplebuddy.notbackedup", 0) != 0;
}

+ (void)intelligenceVoiceSelectionDidComplete
{
}

void __57__BYSiriUtilities_requiresAcknowledgementForDataSharing___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7DED000, a2, OS_LOG_TYPE_ERROR, "Failed to get Siri data sharing opt-in status: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (uint64_t)deviceSupportsSystemAssistantExperience
{
  return __getVTPreferencesClass_block_invoke_cold_1();
}

@end