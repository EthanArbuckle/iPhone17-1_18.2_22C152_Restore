@interface UIDictationConnectionPreferences
+ (id)sharedInstance;
- (AFPreferences)afPreferences;
- (BOOL)dictationIsEnabled;
- (BOOL)enableEuclidAlternatives;
- (BOOL)ignoreServerManualEndpointingThreshold;
- (BOOL)isOnDeviceDictationSupportAvailableForLanguage:(id)a3;
- (BOOL)isOnDeviceDictationSupportMissingAssetForLanguage:(id)a3;
- (BOOL)isOnDeviceEmojiRecognitionSupportAvailableForLanguage:(id)a3;
- (BOOL)isSmartLanguageSelectionEnabled;
- (BOOL)suppressDataSharingOptIn;
- (BOOL)suppressDictationOptIn;
- (id)dictationSLSEnabledLanguages;
- (id)getOfflineDictationStatusForLanguage:(id)a3;
- (id)initSingleton;
- (id)languageCode;
- (id)manualEndpointingThreshold;
- (int64_t)dataSharingOptInStatus;
- (void)afPreferencesChanged:(id)a3;
- (void)setAfPreferences:(id)a3;
@end

@implementation UIDictationConnectionPreferences

void __50__UIDictationConnectionPreferences_sharedInstance__block_invoke()
{
  id v0 = [[UIDictationConnectionPreferences alloc] initSingleton];
  v1 = (void *)qword_1EB2619E8;
  qword_1EB2619E8 = (uint64_t)v0;
}

- (id)initSingleton
{
  v15.receiver = self;
  v15.super_class = (Class)UIDictationConnectionPreferences;
  v2 = [(UIDictationConnectionPreferences *)&v15 init];
  if (!v2) {
    goto LABEL_8;
  }
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v3 = (void *)qword_1EB261A00;
  uint64_t v24 = qword_1EB261A00;
  if (!qword_1EB261A00)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __getAFPreferencesClass_block_invoke_0;
    v19 = &unk_1E52D9900;
    v20 = &v21;
    __getAFPreferencesClass_block_invoke_0((uint64_t)&v16);
    v3 = (void *)v22[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v21, 8);
  uint64_t v5 = [v4 sharedPreferences];
  afPreferences = v2->_afPreferences;
  v2->_afPreferences = (AFPreferences *)v5;

  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  v8 = (void *)qword_1EB261A08;
  uint64_t v24 = qword_1EB261A08;
  if (!qword_1EB261A08)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __getAFPreferencesDidChangeNotificationSymbolLoc_block_invoke;
    v19 = &unk_1E52D9900;
    v20 = &v21;
    v9 = AssistantServicesLibrary_0();
    v10 = dlsym(v9, "AFPreferencesDidChangeNotification");
    *(void *)(v20[1] + 24) = v10;
    qword_1EB261A08 = *(void *)(v20[1] + 24);
    v8 = (void *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (v8)
  {
    [v7 addObserver:v2 selector:sel_afPreferencesChanged_ name:*v8 object:0];

    v11 = v2;
LABEL_8:

    return v2;
  }
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  v14 = [NSString stringWithUTF8String:"NSNotificationName getAFPreferencesDidChangeNotification(void)"];
  objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"UIDictationConnection.m", 62, @"%s", dlerror());

  __break(1u);
  return result;
}

+ (id)sharedInstance
{
  if (qword_1EB2619F0 != -1) {
    dispatch_once(&qword_1EB2619F0, &__block_literal_global_582_0);
  }
  v2 = (void *)qword_1EB2619E8;
  return v2;
}

- (BOOL)suppressDictationOptIn
{
  return [(AFPreferences *)self->_afPreferences suppressDictationOptIn];
}

- (BOOL)enableEuclidAlternatives
{
  return [(AFPreferences *)self->_afPreferences enableEuclidAlternatives];
}

- (BOOL)dictationIsEnabled
{
  return [(AFPreferences *)self->_afPreferences dictationIsEnabled];
}

- (int64_t)dataSharingOptInStatus
{
  return [(AFPreferences *)self->_afPreferences siriDataSharingOptInStatus];
}

- (BOOL)suppressDataSharingOptIn
{
  return [(AFPreferences *)self->_afPreferences shouldSuppressSiriDataSharingOptInAlert];
}

- (BOOL)ignoreServerManualEndpointingThreshold
{
  return [(AFPreferences *)self->_afPreferences ignoreServerManualEndpointingThreshold];
}

- (id)manualEndpointingThreshold
{
  return (id)[(AFPreferences *)self->_afPreferences manualEndpointingThreshold];
}

- (id)languageCode
{
  return (id)[(AFPreferences *)self->_afPreferences languageCode];
}

- (void)afPreferencesChanged:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__UIDictationConnectionPreferences_afPreferencesChanged___block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __57__UIDictationConnectionPreferences_afPreferencesChanged___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"UIDictationPreferencesDidChange" object:*(void *)(a1 + 32)];
}

- (id)dictationSLSEnabledLanguages
{
  return (id)[(AFPreferences *)self->_afPreferences dictationSLSLanguagesEnabled];
}

- (id)getOfflineDictationStatusForLanguage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIDictationConnectionPreferences *)self afPreferences];
  v6 = [v5 offlineDictationStatus];

  v7 = [v4 componentsSeparatedByString:@"_"];

  v8 = [v7 componentsJoinedByString:@"-"];

  id v9 = v8;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  v10 = (void (*)(id))get_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCodeSymbolLoc_ptr;
  v22 = get_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCodeSymbolLoc_ptr;
  if (!get_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCodeSymbolLoc_ptr)
  {
    v11 = AssistantServicesLibrary_0();
    v20[3] = (uint64_t)dlsym(v11, "_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode");
    get_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCodeSymbolLoc_ptr = (_UNKNOWN *)v20[3];
    v10 = (void (*)(id))v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (v10)
  {
    v12 = v10(v9);

    if (v12) {
      v13 = v12;
    }
    else {
      v13 = v9;
    }
    id v14 = v13;

    objc_super v15 = [v6 objectForKeyedSubscript:v14];

    return v15;
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = [NSString stringWithUTF8String:"NSString *__AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode(NSString *__strong)"];
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, @"UIDictationConnection.m", 64, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (BOOL)isSmartLanguageSelectionEnabled
{
  int v3 = _os_feature_enabled_impl();
  if (v3)
  {
    afPreferences = self->_afPreferences;
    LOBYTE(v3) = [(AFPreferences *)afPreferences isSmartLanguageSelectionEnabled];
  }
  return v3;
}

- (BOOL)isOnDeviceDictationSupportAvailableForLanguage:(id)a3
{
  int v3 = [(UIDictationConnectionPreferences *)self getOfflineDictationStatusForLanguage:a3];
  if (v3)
  {
    id v4 = getAFOfflineDictationStatusHighQualityKey();
    uint64_t v5 = [v3 objectForKeyedSubscript:v4];

    v6 = getAFOfflineDictationStatusInstalledKey();
    v7 = [v3 objectForKeyedSubscript:v6];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v8 = [v5 BOOLValue];
    }
    else {
      char v8 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v10 = [v7 BOOLValue];
    }
    else {
      char v10 = 0;
    }
    char v9 = v8 & v10;
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isOnDeviceDictationSupportMissingAssetForLanguage:(id)a3
{
  int v3 = [(UIDictationConnectionPreferences *)self getOfflineDictationStatusForLanguage:a3];
  if (v3)
  {
    id v4 = getAFOfflineDictationStatusHighQualityKey();
    uint64_t v5 = [v3 objectForKeyedSubscript:v4];

    v6 = getAFOfflineDictationStatusInstalledKey();
    v7 = [v3 objectForKeyedSubscript:v6];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v8 = [v5 BOOLValue];
    }
    else {
      char v8 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v10 = [v7 BOOLValue] ^ 1;
    }
    else {
      LOBYTE(v10) = 1;
    }
    char v9 = v8 & v10;
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isOnDeviceEmojiRecognitionSupportAvailableForLanguage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIDictationConnectionPreferences *)self getOfflineDictationStatusForLanguage:v4];
  if (!v5)
  {
    char v12 = 0;
LABEL_13:

    return v12;
  }
  v6 = getAFOfflineDictationStatusInstalledKey();
  v7 = [v5 objectForKeyedSubscript:v6];

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v8 = (void *)getAFOfflineDictationStatusEmojiRecognitionKeySymbolLoc_ptr;
  uint64_t v20 = getAFOfflineDictationStatusEmojiRecognitionKeySymbolLoc_ptr;
  if (!getAFOfflineDictationStatusEmojiRecognitionKeySymbolLoc_ptr)
  {
    char v9 = AssistantServicesLibrary_0();
    v18[3] = (uint64_t)dlsym(v9, "AFOfflineDictationStatusEmojiRecognitionKey");
    getAFOfflineDictationStatusEmojiRecognitionKeySymbolLoc_ptr = v18[3];
    char v8 = (void *)v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (v8)
  {
    int v10 = [v5 objectForKeyedSubscript:*v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v11 = [v10 BOOLValue];
    }
    else {
      char v11 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v13 = [v7 BOOLValue];
    }
    else {
      char v13 = 0;
    }
    char v12 = v11 & v13;

    goto LABEL_13;
  }
  objc_super v15 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v16 = [NSString stringWithUTF8String:"NSString *getAFOfflineDictationStatusEmojiRecognitionKey(void)"];
  objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"UIDictationConnection.m", 67, @"%s", dlerror());

  __break(1u);
  return result;
}

- (AFPreferences)afPreferences
{
  return self->_afPreferences;
}

- (void)setAfPreferences:(id)a3
{
}

- (void).cxx_destruct
{
}

@end