@interface SEMAssistantSettingsBridge
+ (BOOL)isASRSupported;
+ (BOOL)isAssistantEnabled;
+ (BOOL)isCustomerInstall;
+ (BOOL)isDictationEnabled;
+ (BOOL)isLinkVocabularyEnabled;
+ (BOOL)isOfflineDictationSupported;
+ (BOOL)isSiriUODSupported;
+ (BOOL)isSiriUODwithASROnServerSupported;
+ (BOOL)isSpeechProfileEnabled;
+ (id)buildVersion;
+ (id)currentDictationLanguageCodes;
+ (id)currentSiriLanguageCode;
+ (id)getConformingSharedUserIds;
- (SEMAssistantSettingsBridge)init;
@end

@implementation SEMAssistantSettingsBridge

- (SEMAssistantSettingsBridge)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"init unsupported", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)buildVersion
{
  return (id)MEMORY[0x270F0EC50](a1, a2);
}

+ (BOOL)isSiriUODSupported
{
  uint64_t v2 = AFDeviceSupportsSiriUOD();
  if (v2) {
    return 1;
  }
  return MEMORY[0x270F0EF30](v2, v3);
}

+ (BOOL)isASRSupported
{
  uint64_t v2 = AFDeviceSupportsSiriUOD();
  if (v2) {
    return 1;
  }
  return MEMORY[0x270F0EE40](v2, v3);
}

+ (BOOL)isOfflineDictationSupported
{
  return MEMORY[0x270F0EE40](a1, a2);
}

+ (BOOL)isSiriUODwithASROnServerSupported
{
  return MEMORY[0x270F0EF30](a1, a2);
}

+ (id)currentSiriLanguageCode
{
  v4 = objc_msgSend_sharedPreferences(MEMORY[0x263F285A0], a2, v2, v3);
  v8 = objc_msgSend_languageCode(v4, v5, v6, v7);

  if (!objc_msgSend_length(v8, v9, v10, v11))
  {
    v15 = objc_msgSend_sharedPreferences(MEMORY[0x263F285A0], v12, v13, v14);
    uint64_t v18 = objc_msgSend_bestSupportedLanguageCodeForLanguageCode_(v15, v16, 0, v17);

    v8 = (void *)v18;
  }
  return v8;
}

+ (id)currentDictationLanguageCodes
{
  id v2 = objc_alloc_init(MEMORY[0x263F17B68]);
  v5 = objc_msgSend_installationStatusForLanguagesWithAssetType_(v2, v3, 3, v4);

  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_25C7E36EC;
  v15 = sub_25C7E36FC;
  id v16 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_25C7E3704;
  v10[3] = &unk_2654DE070;
  v10[4] = &v11;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v5, v6, (uint64_t)v10, v7);
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

+ (BOOL)isCustomerInstall
{
  return MEMORY[0x270F0EDA8](a1, a2);
}

+ (BOOL)isSpeechProfileEnabled
{
  return MEMORY[0x270ED8070]("Siri", "siri_vocabulary_speech_profile");
}

+ (BOOL)isLinkVocabularyEnabled
{
  return MEMORY[0x270ED8070]("Link", "vocabDonation");
}

+ (id)getConformingSharedUserIds
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
  {
    int v8 = 136315138;
    v9 = "+[SEMAssistantSettingsBridge getConformingSharedUserIds]";
    _os_log_error_impl(&dword_25C7CA000, v2, OS_LOG_TYPE_ERROR, "%s Unexpected call to getConformingSharedUserIds from non-tvOS platform, returning empty results", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = objc_msgSend_set(MEMORY[0x263EFFA08], v3, v4, v5);
  return v6;
}

+ (BOOL)isAssistantEnabled
{
  uint64_t v4 = objc_msgSend_sharedPreferences(MEMORY[0x263F285A0], a2, v2, v3);
  char IsEnabled = objc_msgSend_assistantIsEnabled(v4, v5, v6, v7);

  return IsEnabled;
}

+ (BOOL)isDictationEnabled
{
  uint64_t v4 = objc_msgSend_sharedPreferences(MEMORY[0x263F285A0], a2, v2, v3);
  char IsEnabled = objc_msgSend_dictationIsEnabled(v4, v5, v6, v7);

  return IsEnabled;
}

@end