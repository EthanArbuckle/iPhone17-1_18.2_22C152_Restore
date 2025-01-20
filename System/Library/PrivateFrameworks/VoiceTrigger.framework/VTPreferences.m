@interface VTPreferences
+ (id)deviceCategoryStringRepresentationForCategoryType:(unint64_t)a3;
+ (id)sharedPreferences;
- (BOOL)_gibraltarHasBuiltInMic;
- (BOOL)_isLocalVoiceTriggerAvailable;
- (BOOL)_isNonEndpointDeviceType:(unint64_t)a3;
- (BOOL)_isSATMarkedForMarker:(id)a3 languageCode:(id)a4;
- (BOOL)_storeModeEnabled;
- (BOOL)_voiceTriggerEnabledWithDeviceType:(unint64_t)a3;
- (BOOL)_voiceTriggerEnabledWithDeviceType:(unint64_t)a3 endpointId:(id)a4;
- (BOOL)canUseVoiceTriggerDuringPhoneCall;
- (BOOL)corespeechDaemonEnabled;
- (BOOL)everNotifyUserCompactTrigger;
- (BOOL)fileLoggingIsEnabled;
- (BOOL)gestureSubscriptionEnabled;
- (BOOL)hasExplicitlySetVoiceTriggerEnabled;
- (BOOL)hasVoiceProfileIniCloudForLanguageCode:(id)a3;
- (BOOL)isCompactVoiceTriggerAvailableForLanguageCode:(id)a3;
- (BOOL)isCompactVoiceTriggerAvailableForLanguageCode:(id)a3 forPhraseDeviceType:(unint64_t)a4;
- (BOOL)isMphVTEnabled;
- (BOOL)isRemoteVoiceTriggerAvailable;
- (BOOL)isSATAvailable;
- (BOOL)isSATEnrolledForLanguageCode:(id)a3;
- (BOOL)isSATEnrollmentMigratedForLanguageCode:(id)a3;
- (BOOL)isVoiceTriggerAvailable;
- (BOOL)onetimeRemoteAssetQueryRanSuccessfully;
- (BOOL)overwritingVoiceTriggerMLock;
- (BOOL)phraseSpotterEnabled;
- (BOOL)remoteDarwinWasEverConnected;
- (BOOL)secondPassAudioLoggingEnabled;
- (BOOL)shouldOverwriteVoiceTriggerMLock;
- (BOOL)useSiriActivationSPIForiOS;
- (BOOL)useSiriActivationSPIForwatchOS;
- (BOOL)voiceTriggerEnabled;
- (BOOL)voiceTriggerEnabledForEndpointId:(id)a3;
- (BOOL)voiceTriggerEnabledWhenChargerConnected;
- (BOOL)voiceTriggerEnabledWhenChargerDisconnected;
- (BOOL)voiceTriggerInCoreSpeech;
- (BOOL)voiceTriggerWasEverUsed;
- (VTPreferences)init;
- (id)_VTSATBasePath;
- (id)_VTSATCachePath;
- (id)_getSATEnrollmentAudioPathForLanguageCodeForLegacyVoiceProfile:(id)a3;
- (id)_getVTEnableLoggingMetadata;
- (id)_getVoiceTriggerEnabledDidChangeNotificationStringWithDeviceType:(unint64_t)a3;
- (id)_getVoiceTriggerEnabledKeyWithDeviceType:(unint64_t)a3;
- (id)_languageCode;
- (id)_localeIdentifier;
- (id)_preferencesPhraseDeviceStringWithPhraseDeviceType:(unint64_t)a3;
- (id)audioInjectionFilePath;
- (id)devicesWithVoiceProfileIniCloudForLanguage:(id)a3;
- (id)fileLoggingLevel;
- (id)getMD5HashForSATEnrollmentAudioForLanguageCode:(id)a3;
- (id)getPreferencesForEndpoint:(id)a3 fromPreferenceDomain:(id)a4 error:(id *)a5;
- (id)getSATEnrollmentPath;
- (id)localizedCompactTriggerPhraseForLanguageCode:(id)a3;
- (id)localizedTriggerPhrase;
- (id)localizedTriggerPhraseForLanguageCode:(id)a3;
- (id)setPreferences:(id)a3 forEndpoint:(id)a4 inPreferenceDomain:(id)a5;
- (id)setUserPreferredVoiceTriggerPhraseType:(unint64_t)a3 sender:(id)a4 deviceType:(unint64_t)a5 endpointId:(id)a6;
- (unint64_t)_getCSDeviceTypeWithPhraseDeviceType:(unint64_t)a3;
- (unint64_t)canUseVoiceTriggerDuringPhoneCallWithState;
- (unint64_t)getUserPreferredVoiceTriggerPhraseTypeForDeviceType:(unint64_t)a3 endpointId:(id)a4 error:(id *)a5;
- (void)_logMetadataForVTEnabled:(BOOL)a3;
- (void)_setCanUseVoiceTriggerDuringPhoneCall:(BOOL)a3 sender:(id)a4;
- (void)_setVoiceTriggerEnabled:(BOOL)a3 sender:(id)a4 deviceType:(unint64_t)a5;
- (void)_setVoiceTriggerEnabled:(BOOL)a3 sender:(id)a4 deviceType:(unint64_t)a5 endpointId:(id)a6;
- (void)discardAllSATEnrollment;
- (void)discardSATEnrollmentForLanguageCode:(id)a3;
- (void)enableVoiceTriggerUponVoiceProfileSyncForLanguage:(id)a3;
- (void)markSATEnrollmentSuccessForLanguageCode:(id)a3;
- (void)setCanUseVoiceTriggerDuringPhoneCall:(BOOL)a3;
- (void)setEverNotifyUserCompactTrigger;
- (void)setFileLoggingIsEnabled:(BOOL)a3;
- (void)setFileLoggingLevel:(id)a3;
- (void)setOnetimeRemoteAssetQueryRanSuccessfully:(BOOL)a3;
- (void)setPhraseSpotterEnabled:(BOOL)a3;
- (void)setPhraseSpotterEnabled:(BOOL)a3 sender:(id)a4;
- (void)setSecondPassAudioLoggingEnabled:(BOOL)a3;
- (void)setVoiceTriggerEnabled:(BOOL)a3;
- (void)setVoiceTriggerEnabled:(BOOL)a3 sender:(id)a4;
- (void)setVoiceTriggerEnabled:(BOOL)a3 sender:(id)a4 deviceType:(unint64_t)a5 endpointId:(id)a6;
- (void)setVoiceTriggerEnabled:(BOOL)a3 sender:(id)a4 endpointId:(id)a5;
- (void)setVoiceTriggerEnabledWhenChargerConnected:(BOOL)a3;
- (void)setVoiceTriggerEnabledWhenChargerDisconnected:(BOOL)a3;
- (void)synchronize;
@end

@implementation VTPreferences

- (BOOL)voiceTriggerEnabled
{
  return [(VTPreferences *)self voiceTriggerEnabledForEndpointId:0];
}

- (BOOL)voiceTriggerEnabledForEndpointId:(id)a3
{
  id v3 = a3;
  if (a3) {
    a3 = (id)2;
  }
  return [(VTPreferences *)self voiceTriggerEnabledWithDeviceType:a3 endpointId:v3];
}

uint64_t __34__VTPreferences_sharedPreferences__block_invoke()
{
  sharedPreferences_sSharedPreferences = objc_alloc_init(VTPreferences);

  return MEMORY[0x270F9A758]();
}

- (VTPreferences)init
{
  v4.receiver = self;
  v4.super_class = (Class)VTPreferences;
  v2 = [(VTPreferences *)&v4 init];
  if (v2 && VTLogInitIfNeeded_once != -1) {
    dispatch_once(&VTLogInitIfNeeded_once, &__block_literal_global_30);
  }
  return v2;
}

+ (id)sharedPreferences
{
  if (sharedPreferences_onceToken != -1) {
    dispatch_once(&sharedPreferences_onceToken, &__block_literal_global_3308);
  }
  v2 = (void *)sharedPreferences_sSharedPreferences;

  return v2;
}

- (BOOL)_voiceTriggerEnabledWithDeviceType:(unint64_t)a3 endpointId:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  BOOL v7 = [(VTPreferences *)self _isNonEndpointDeviceType:a3];
  if (!v6 && v7)
  {
    char v8 = [(VTPreferences *)self _voiceTriggerEnabledWithDeviceType:a3];
    goto LABEL_13;
  }
  if (a3 != 2 || !v6)
  {
    v13 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543618;
      id v16 = v6;
      __int16 v17 = 2050;
      unint64_t v18 = a3;
      _os_log_error_impl(&dword_21844F000, v13, OS_LOG_TYPE_ERROR, "Wrong input argument : endpointId(%{public}@), deviceType(%{public}lu)", (uint8_t *)&v15, 0x16u);
    }
    goto LABEL_12;
  }
  if ([(VTPreferences *)self _storeModeEnabled])
  {
LABEL_12:
    char v8 = 0;
    goto LABEL_13;
  }
  v9 = [(VTPreferences *)self getPreferencesForEndpoint:v6 fromPreferenceDomain:@"com.apple.voicetrigger" error:0];
  v10 = v9;
  if (v9)
  {
    v11 = [v9 objectForKeyedSubscript:@"VoiceTrigger Enabled"];
    v12 = v11;
    if (v11) {
      char v8 = [v11 BOOLValue];
    }
    else {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }
LABEL_13:

  return v8;
}

- (BOOL)_voiceTriggerEnabledWithDeviceType:(unint64_t)a3
{
  objc_super v4 = [(VTPreferences *)self _getVoiceTriggerEnabledKeyWithDeviceType:a3];
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
  v5 = (void *)CFPreferencesCopyAppValue(v4, @"com.apple.voicetrigger");
  id v6 = v5;
  if (v5)
  {
    char v7 = [v5 BOOLValue];
  }
  else
  {
    [(VTPreferences *)self _storeModeEnabled];
    char v7 = 0;
  }

  return v7;
}

- (BOOL)_storeModeEnabled
{
  CFPreferencesAppSynchronize(@"com.apple.demo-settings");
  v2 = CFPreferencesCopyAppValue(@"StoreDemoMode", @"com.apple.demo-settings");
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_isNonEndpointDeviceType:(unint64_t)a3
{
  return a3 == 3 || a3 < 2;
}

- (id)_getVoiceTriggerEnabledKeyWithDeviceType:(unint64_t)a3
{
  if (a3 == 3) {
    return @"Remote Darwin VoiceTrigger Enabled";
  }
  else {
    return @"VoiceTrigger Enabled";
  }
}

- (BOOL)overwritingVoiceTriggerMLock
{
  if (overwritingVoiceTriggerMLock_onceToken != -1) {
    dispatch_once(&overwritingVoiceTriggerMLock_onceToken, &__block_literal_global_392);
  }
  return overwritingVoiceTriggerMLock_voiceTriggerMLockEnabled;
}

uint64_t __45__VTPreferences_overwritingVoiceTriggerMLock__block_invoke()
{
  uint64_t result = +[VTUtilities isInternalInstall];
  if (result)
  {
    CFPropertyListRef v1 = CFPreferencesCopyAppValue(@"Enable VoiceTrigger Mlock", @"com.apple.voicetrigger.notbackedup");
    if (v1)
    {
      v2 = (void *)v1;
      if (objc_opt_respondsToSelector()) {
        overwritingVoiceTriggerMLock_voiceTriggerMLockEnabled = [v2 BOOLValue];
      }
    }
    return MEMORY[0x270F9A790]();
  }
  return result;
}

- (BOOL)shouldOverwriteVoiceTriggerMLock
{
  if (shouldOverwriteVoiceTriggerMLock_onceToken != -1) {
    dispatch_once(&shouldOverwriteVoiceTriggerMLock_onceToken, &__block_literal_global_390);
  }
  return shouldOverwriteVoiceTriggerMLock_shouldOverwrite;
}

void __49__VTPreferences_shouldOverwriteVoiceTriggerMLock__block_invoke()
{
  if (+[VTUtilities isInternalInstall])
  {
    v0 = (void *)CFPreferencesCopyAppValue(@"Enable VoiceTrigger Mlock", @"com.apple.voicetrigger.notbackedup");
    if (v0) {
      shouldOverwriteVoiceTriggerMLock_shouldOverwrite = 1;
    }
  }
}

- (void)setEverNotifyUserCompactTrigger
{
  CFPreferencesSetAppValue(@"EverNotifyCompactTrigger", MEMORY[0x263EFFA88], @"com.apple.voicetrigger");

  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
}

- (BOOL)everNotifyUserCompactTrigger
{
  v2 = (void *)CFPreferencesCopyAppValue(@"EverNotifyCompactTrigger", @"com.apple.voicetrigger");
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)isMphVTEnabled
{
  if (isMphVTEnabled_onceToken != -1) {
    dispatch_once(&isMphVTEnabled_onceToken, &__block_literal_global_388);
  }
  return isMphVTEnabled_mphVTEnabled;
}

void __31__VTPreferences_isMphVTEnabled__block_invoke()
{
  if (+[VTUtilities isInternalInstall])
  {
    v0 = (void *)CFPreferencesCopyAppValue(@"MultiPhraseVTEnabled", @"com.apple.voicetrigger");
    if (v0)
    {
      id v1 = v0;
      isMphVTEnabled_mphVTEnabled = [v0 BOOLValue];
      v0 = v1;
    }
  }
}

- (BOOL)corespeechDaemonEnabled
{
  if (corespeechDaemonEnabled_onceToken != -1) {
    dispatch_once(&corespeechDaemonEnabled_onceToken, &__block_literal_global_386);
  }
  return corespeechDaemonEnabled_defaultValue;
}

void __40__VTPreferences_corespeechDaemonEnabled__block_invoke()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  corespeechDaemonEnabled_defaultValue = !+[VTUtilities VTIsHorseman];
  v0 = (void *)CFPreferencesCopyAppValue(@"CoreSpeech Daemon Enabled", @"com.apple.voicetrigger");
  id v1 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v2 = v1;
    v4[0] = 67240192;
    v4[1] = [v0 BOOLValue];
    _os_log_impl(&dword_21844F000, v2, OS_LOG_TYPE_DEFAULT, "value = %{public}d", (uint8_t *)v4, 8u);
  }
  if (v0) {
    char v3 = [v0 BOOLValue];
  }
  else {
    char v3 = corespeechDaemonEnabled_defaultValue != 0;
  }
  corespeechDaemonEnabled_defaultValue = v3;
}

- (BOOL)useSiriActivationSPIForwatchOS
{
  if (useSiriActivationSPIForwatchOS_onceToken != -1) {
    dispatch_once(&useSiriActivationSPIForwatchOS_onceToken, &__block_literal_global_384);
  }
  return useSiriActivationSPIForwatchOS_ret;
}

void __47__VTPreferences_useSiriActivationSPIForwatchOS__block_invoke()
{
  v0 = (void *)CFPreferencesCopyAppValue(@"Enable SiriActivation watchOS", @"com.apple.voicetrigger");
  if (v0)
  {
    id v1 = v0;
    useSiriActivationSPIForwatchOS_ret = [v0 BOOLValue];
    v0 = v1;
  }
}

- (BOOL)useSiriActivationSPIForiOS
{
  if (useSiriActivationSPIForiOS_onceToken != -1) {
    dispatch_once(&useSiriActivationSPIForiOS_onceToken, &__block_literal_global_382);
  }
  return useSiriActivationSPIForiOS_ret;
}

void __43__VTPreferences_useSiriActivationSPIForiOS__block_invoke()
{
  v0 = (void *)CFPreferencesCopyAppValue(@"Enable SiriActivation iOS", @"com.apple.voicetrigger");
  if (v0)
  {
    id v1 = v0;
    useSiriActivationSPIForiOS_ret = [v0 BOOLValue];
    v0 = v1;
  }
}

- (id)audioInjectionFilePath
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!+[VTUtilities isInternalInstall]) {
    goto LABEL_16;
  }
  id v2 = (id)CFPreferencesCopyAppValue(@"VoiceTrigger Audio Injection", @"com.apple.voicetrigger");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_21844F000, v7, OS_LOG_TYPE_ERROR, "kVTAudioInjectionKey is not array type", buf, 2u);
    }
    goto LABEL_15;
  }
  id v2 = v2;
  char v3 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = v3;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = [v2 count];
    _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "kVTAudioInjectionKey array size = %d", buf, 8u);
  }
  *(void *)buf = 0;
  v11 = buf;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__VTPreferences_audioInjectionFilePath__block_invoke;
  v9[3] = &unk_264325728;
  v9[4] = buf;
  [v2 enumerateObjectsUsingBlock:v9];
  if (v11[24]) {
    BOOL v5 = v2 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  char v6 = v5;
  _Block_object_dispose(buf, 8);

  if (v6)
  {
LABEL_15:

LABEL_16:
    id v2 = 0;
  }

  return v2;
}

void __39__VTPreferences_audioInjectionFilePath__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    char v8 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_21844F000, v8, OS_LOG_TYPE_ERROR, "kVTAudioInjectionKey doesn't have NSString as an array entry", v9, 2u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (BOOL)_gibraltarHasBuiltInMic
{
  return 0;
}

- (void)enableVoiceTriggerUponVoiceProfileSyncForLanguage:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  char v3 = (char *)a3;
  char v4 = VTLogContextFacilityVoiceTrigger;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "Will Enable VoiceTrigger after VoiceProfile sync for language: %{public}@", (uint8_t *)&v5, 0xCu);
    }
    CFPreferencesSetAppValue(@"Enable VoiceTrigger Upon VoiceProfile Sync For Language", v3, @"com.apple.voicetrigger.notbackedup");
    CFPreferencesAppSynchronize(@"com.apple.voicetrigger.notbackedup");
  }
  else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136446210;
    id v6 = "-[VTPreferences enableVoiceTriggerUponVoiceProfileSyncForLanguage:]";
    _os_log_error_impl(&dword_21844F000, v4, OS_LOG_TYPE_ERROR, "ERR: %{public}s: Bailing out as language is nil!", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)hasVoiceProfileIniCloudForLanguageCode:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  char v4 = (char *)a3;
  int v5 = +[VTUtilities deviceProductType];
  if (!v5)
  {
    uint64_t v28 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v44 = v4;
      v29 = "ERR: Unknown device. Returning false, language: %{public}@";
      v30 = v28;
LABEL_30:
      uint32_t v32 = 12;
      goto LABEL_31;
    }
LABEL_32:
    BOOL v25 = 0;
    goto LABEL_33;
  }
  unint64_t v38 = +[VTUtilities deviceCategoryForDeviceProductType:v5];
  if (!v38)
  {
    uint64_t v31 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v44 = v5;
      __int16 v45 = 2114;
      v46 = v4;
      v29 = "ERR: Unknown device-category for device: %{public}@, languageCode: %{public}@";
      v30 = v31;
      uint32_t v32 = 22;
LABEL_31:
      _os_log_error_impl(&dword_21844F000, v30, OS_LOG_TYPE_ERROR, v29, buf, v32);
      goto LABEL_32;
    }
    goto LABEL_32;
  }
  p_superclass = VTFirstUnlockMonitor.superclass;
  uint64_t v7 = VTLogContextFacilityVoiceTrigger;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v44 = "-[VTPreferences hasVoiceProfileIniCloudForLanguageCode:]";
      v29 = "ERR: %{public}s: Bailing out as language is nil!";
      v30 = v7;
      goto LABEL_30;
    }
    goto LABEL_32;
  }
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    char v8 = v7;
    v9 = +[VTPreferences deviceCategoryStringRepresentationForCategoryType:v38];
    *(_DWORD *)buf = 138543618;
    v44 = v5;
    __int16 v45 = 2114;
    v46 = v9;
    _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "Searching for synced-VoiceProfile for CurrDevice: %{public}@{%{public}@}", buf, 0x16u);
  }
  v36 = v5;
  v34 = v4;
  [(VTPreferences *)self devicesWithVoiceProfileIniCloudForLanguage:v4];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [obj countByEnumeratingWithState:&v39 objects:v51 count:16];
  unint64_t v11 = v38;
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v40;
    while (2)
    {
      uint64_t v14 = 0;
      uint64_t v35 = v12;
      do
      {
        if (*(void *)v40 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v39 + 1) + 8 * v14);
        unint64_t v16 = +[VTUtilities deviceCategoryForDeviceProductType:v15];
        __int16 v17 = p_superclass[244];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = v13;
          uint64_t v19 = p_superclass;
          v20 = v17;
          v21 = +[VTPreferences deviceCategoryStringRepresentationForCategoryType:v11];
          v22 = +[VTPreferences deviceCategoryStringRepresentationForCategoryType:v16];
          *(_DWORD *)buf = 138544130;
          v44 = v36;
          __int16 v45 = 2114;
          v46 = v21;
          __int16 v47 = 2114;
          uint64_t v48 = v15;
          __int16 v49 = 2114;
          v50 = v22;
          _os_log_impl(&dword_21844F000, v20, OS_LOG_TYPE_DEFAULT, "currDevice=[%{public}@ : {%{public}@}] ; syncedDevice=[%{public}@ : {%{public}@}]",
            buf,
            0x2Au);

          unint64_t v11 = v38;
          p_superclass = v19;
          uint64_t v13 = v18;
          uint64_t v12 = v35;

          __int16 v17 = p_superclass[244];
        }
        BOOL v23 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        if (v16 == v11)
        {
          if (v23)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21844F000, v17, OS_LOG_TYPE_DEFAULT, "VoiceProfile MATCH", buf, 2u);
          }

          BOOL v25 = 1;
          char v4 = v34;
          int v5 = (char *)v36;
          goto LABEL_27;
        }
        if (v23)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21844F000, v17, OS_LOG_TYPE_DEFAULT, "VoiceProfile MIS-MATCH", buf, 2u);
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v39 objects:v51 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  v24 = p_superclass[244];
  BOOL v25 = 0;
  char v4 = v34;
  int v5 = (char *)v36;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v26 = v24;
    v27 = +[VTPreferences deviceCategoryStringRepresentationForCategoryType:v38];
    *(_DWORD *)buf = 138543618;
    v44 = v36;
    __int16 v45 = 2114;
    v46 = v27;
    _os_log_impl(&dword_21844F000, v26, OS_LOG_TYPE_DEFAULT, "CurrDevice: [%{public}@ : {%{public}@}] DOES NOT have VoiceProfile synced in iCloud", buf, 0x16u);

    BOOL v25 = 0;
  }
LABEL_27:

LABEL_33:
  return v25;
}

- (id)devicesWithVoiceProfileIniCloudForLanguage:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  char v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "\nlanguageCode: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  int v5 = [MEMORY[0x263EFF910] date];
  id v6 = objc_alloc_init(MEMORY[0x263F285E8]);
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  dispatch_time_t v8 = dispatch_time(0, 5000000000);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__3216;
  v29 = __Block_byref_object_dispose__3217;
  id v30 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __60__VTPreferences_devicesWithVoiceProfileIniCloudForLanguage___block_invoke;
  v18[3] = &unk_264325700;
  id v9 = v3;
  id v19 = v9;
  p_long long buf = &buf;
  uint64_t v10 = v7;
  v20 = v10;
  [v6 getDevicesWithAvailablePHSAssetsForLanguage:v9 completion:v18];
  intptr_t v11 = dispatch_semaphore_wait(v10, v8);
  uint64_t v12 = [MEMORY[0x263EFF910] date];
  uint64_t v13 = VTLogContextFacilityVoiceTrigger;
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v22 = 134349312;
      double v23 = *(double *)&v11;
      __int16 v24 = 1026;
      int v25 = 5000;
      _os_log_impl(&dword_21844F000, v13, OS_LOG_TYPE_DEFAULT, "Timedout waiting for AFSettingsConnection:getDevicesWithAvailablePHSAssetsForLanguage: %{public}ld, waitedFor: %{public}d, Returning nil", v22, 0x12u);
    }
  }
  else
  {
    uint64_t v14 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      [v12 timeIntervalSinceDate:v5];
      *(_DWORD *)v22 = 134349056;
      double v23 = v15 * 1000.0;
      _os_log_impl(&dword_21844F000, v14, OS_LOG_TYPE_DEFAULT, "timeToRet(AFSettingsConnection:getDevicesWithAvailablePHSAssetsForLanguage:): %{public}fms", v22, 0xCu);
    }
  }
  id v16 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v16;
}

void __60__VTPreferences_devicesWithVoiceProfileIniCloudForLanguage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "Devices with VoiceProfile in iCloud for language: %{public}@:%{public}@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
  id v8 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)isSATAvailable
{
  return !+[VTUtilities VTIsHorseman];
}

- (BOOL)isRemoteVoiceTriggerAvailable
{
  return 0;
}

- (id)_preferencesPhraseDeviceStringWithPhraseDeviceType:(unint64_t)a3
{
  if (a3 - 1 > 8) {
    return @"Default Device";
  }
  else {
    return off_264325760[a3 - 1];
  }
}

- (unint64_t)_getCSDeviceTypeWithPhraseDeviceType:(unint64_t)a3
{
  if (a3 - 1 >= 9) {
    return 0;
  }
  else {
    return a3;
  }
}

- (BOOL)isCompactVoiceTriggerAvailableForLanguageCode:(id)a3 forPhraseDeviceType:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = objc_msgSend(getCSUtilsClass(), "supportsMphForLanguageCode:forDeviceType:", v6, -[VTPreferences _getCSDeviceTypeWithPhraseDeviceType:](self, "_getCSDeviceTypeWithPhraseDeviceType:", a4));
  id v8 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = v8;
    uint64_t v10 = [(VTPreferences *)self _preferencesPhraseDeviceStringWithPhraseDeviceType:a4];
    int v12 = 138412802;
    id v13 = v6;
    __int16 v14 = 2112;
    double v15 = v10;
    __int16 v16 = 1024;
    int v17 = v7;
    _os_log_impl(&dword_21844F000, v9, OS_LOG_TYPE_DEFAULT, "Language code %@, device Type: %@, supportsMph:%d", (uint8_t *)&v12, 0x1Cu);
  }
  return v7;
}

- (BOOL)isCompactVoiceTriggerAvailableForLanguageCode:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = [getCSUtilsClass() supportsMphForLanguageCode:v3];
  uint64_t v5 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = v3;
    __int16 v9 = 1024;
    int v10 = v4;
    _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, "Language code %@ supportsMph:%d", (uint8_t *)&v7, 0x12u);
  }

  return v4;
}

- (BOOL)_isLocalVoiceTriggerAvailable
{
  if (+[VTUtilities VTIsHorseman]
    || +[VTUtilities isAlwaysOn]
    || +[VTUtilities isIOS])
  {
    return 1;
  }

  return +[VTUtilities isNano];
}

- (BOOL)isVoiceTriggerAvailable
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__VTPreferences_isVoiceTriggerAvailable__block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  if (isVoiceTriggerAvailable_onceToken != -1) {
    dispatch_once(&isVoiceTriggerAvailable_onceToken, block);
  }
  return isVoiceTriggerAvailable_retValue;
}

void __40__VTPreferences_isVoiceTriggerAvailable__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) _isLocalVoiceTriggerAvailable])
  {
    char v2 = 1;
  }
  else
  {
    char v3 = [*(id *)(a1 + 32) isRemoteVoiceTriggerAvailable];
    int v4 = [*(id *)(a1 + 32) _gibraltarHasBuiltInMic];
    uint64_t v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = @"isn't";
      if (v4) {
        id v6 = @"is";
      }
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, "VoiceTrigger %{public}@ available", (uint8_t *)&v7, 0xCu);
    }
    char v2 = v3 & v4;
  }
  isVoiceTriggerAvailable_retValue = v2;
}

- (BOOL)gestureSubscriptionEnabled
{
  char v2 = (void *)CFPreferencesCopyAppValue(@"Gesture Subscription Enabled", @"com.apple.voicetrigger");
  char v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)voiceTriggerInCoreSpeech
{
  char v2 = +[VTUtilities VTIsHorseman];
  char v3 = (void *)CFPreferencesCopyAppValue(@"VoiceTrigger CoreSpeech Enabled", @"com.apple.voicetrigger");
  char v4 = v3;
  if (v3) {
    char v2 = [v3 BOOLValue];
  }

  return v2;
}

- (id)getSATEnrollmentPath
{
  char v3 = [MEMORY[0x263F08850] defaultManager];
  char v4 = [(VTPreferences *)self _VTSATBasePath];
  int v5 = [v3 fileExistsAtPath:v4 isDirectory:0];

  id v6 = 0;
  if (v5)
  {
    int v7 = (void *)MEMORY[0x263EFF8C0];
    id v8 = [(VTPreferences *)self _VTSATBasePath];
    id v6 = objc_msgSend(v7, "arrayWithObjects:", v8, 0);
  }

  return v6;
}

- (id)getMD5HashForSATEnrollmentAudioForLanguageCode:(id)a3
{
  id v3 = a3;
  NSLog(&stru_26C99F1D8.isa, v3);
  if (v3)
  {
    char v4 = +[VTSpeakerIdUtilities getSATAudioDirectoryForType:1 forLanguageCode:v3];
    NSLog(&stru_26C99F1D8.isa, v4);
    int v5 = [MEMORY[0x263F08850] defaultManager];
    id v6 = 0;
    if ([v5 fileExistsAtPath:v4 isDirectory:0])
    {
      int v7 = [v5 contentsOfDirectoryAtPath:v4 error:0];
      id v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"self ENDSWITH '.wav' OR self ENDSWITH '.json'"];
      uint64_t v9 = [v7 filteredArrayUsingPredicate:v8];

      int v10 = [v9 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];
      uint64_t v11 = [v10 componentsJoinedByString:&stru_26C99F218];
      int v12 = [v11 dataUsingEncoding:4];
      id v6 = [v12 MD5HashString];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)markSATEnrollmentSuccessForLanguageCode:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v8 = v3;
    char v4 = +[VTSpeakerIdUtilities getSATDirectoryForLanguageCode:v3];
    int v5 = [MEMORY[0x263F08850] defaultManager];
    if ([v5 fileExistsAtPath:v4 isDirectory:0])
    {
      id v6 = [v4 stringByAppendingPathComponent:@"enrollment_completed"];
      if (([v5 createFileAtPath:v6 contents:0 attributes:0] & 1) == 0) {
        NSLog(&cfstr_CoudnTMarkSatS.isa, v6);
      }
      int v7 = [NSURL fileURLWithPath:v4];
      +[VTUtteranceMetadataManager saveMetaVersionFileAtSATAudioDirectory:v7];
      +[VTVoiceProfileMigration updateVoiceProfileVersionFileForLanguageCode:v8];
      notify_post("com.apple.voicetrigger.PHSProfileModified");
    }
    else
    {
      NSLog(&cfstr_WeCanTMarkSatS.isa);
    }
  }

  MEMORY[0x270F9A758]();
}

- (id)_getSATEnrollmentAudioPathForLanguageCodeForLegacyVoiceProfile:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    int v5 = [(VTPreferences *)self _VTSATBasePath];
    id v6 = [v5 stringByAppendingPathComponent:v4];

    int v7 = [v6 stringByAppendingPathComponent:@"audio"];
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (void)discardAllSATEnrollment
{
  id v3 = [(VTPreferences *)self _VTSATBasePath];
  id v4 = [MEMORY[0x263F08850] defaultManager];
  if ([v4 fileExistsAtPath:v3 isDirectory:0])
  {
    id v13 = 0;
    [v4 removeItemAtPath:v3 error:&v13];
    id v5 = v13;
    id v6 = v5;
    if (v5)
    {
      int v7 = [v5 localizedDescription];
      NSLog(&cfstr_CouldnTDeleteS_0.isa, v3, v7);
    }
  }
  id v8 = [(VTPreferences *)self _VTSATCachePath];
  if ([v4 fileExistsAtPath:v8 isDirectory:0])
  {
    id v12 = 0;
    [v4 removeItemAtPath:v8 error:&v12];
    id v9 = v12;
    int v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 localizedDescription];
      NSLog(&cfstr_CouldnTDeleteS_1.isa, v8, v11);
    }
  }
}

- (void)discardSATEnrollmentForLanguageCode:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(VTPreferences *)self _VTSATBasePath];
    id v6 = [v5 stringByAppendingPathComponent:v4];

    int v7 = [MEMORY[0x263F08850] defaultManager];
    if ([v7 fileExistsAtPath:v6 isDirectory:0])
    {
      id v11 = 0;
      [v7 removeItemAtPath:v6 error:&v11];
      id v8 = v11;
      id v9 = v8;
      if (v8)
      {
        int v10 = [v8 localizedDescription];
        NSLog(&cfstr_CouldnTDeleteS.isa, v6, v10);
      }
    }
  }
}

- (BOOL)_isSATMarkedForMarker:(id)a3 languageCode:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v19 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      _os_log_error_impl(&dword_21844F000, v19, OS_LOG_TYPE_ERROR, "Language Code is nil!", (uint8_t *)&v23, 2u);
    }
    goto LABEL_20;
  }
  id v8 = +[VTSpeakerIdUtilities getSATDirectoryForLanguageCode:v7];
  id v9 = [MEMORY[0x263F08850] defaultManager];
  if (![v9 fileExistsAtPath:v8 isDirectory:0])
  {
    v20 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      int v23 = 138412290;
      __int16 v24 = v8;
      _os_log_error_impl(&dword_21844F000, v20, OS_LOG_TYPE_ERROR, "SAT path doesnt exist - %@", (uint8_t *)&v23, 0xCu);
    }
    goto LABEL_19;
  }
  int v10 = [v8 stringByAppendingPathComponent:v6];
  id v11 = +[VTSpeakerIdUtilities getSATAudioDirectoryForType:1 forLanguageCode:v7];
  if (!+[VTVoiceProfileMigration getCurrentVoiceProfileVersionForLanguageCode:v7])
  {
    id v12 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_21844F000, v12, OS_LOG_TYPE_DEFAULT, "Found voice profile with compatibility version 0", (uint8_t *)&v23, 2u);
    }
    id v13 = [(VTPreferences *)self _getSATEnrollmentAudioPathForLanguageCodeForLegacyVoiceProfile:v7];

    uint64_t v14 = [v13 stringByAppendingPathComponent:v6];

    id v11 = v13;
    int v10 = (void *)v14;
  }
  if (![v9 fileExistsAtPath:v10 isDirectory:0])
  {
LABEL_18:

LABEL_19:
LABEL_20:
    BOOL v18 = 0;
    goto LABEL_21;
  }
  double v15 = [v9 contentsOfDirectoryAtPath:v11 error:0];
  __int16 v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"self ENDSWITH '.wav'"];
  int v17 = [v15 filteredArrayUsingPredicate:v16];

  if (!v17 || ![v17 count])
  {
    v21 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      _os_log_error_impl(&dword_21844F000, v21, OS_LOG_TYPE_ERROR, "No Audio file exists when enrollment marker is set, remove marker", (uint8_t *)&v23, 2u);
    }
    [v9 removeItemAtPath:v10 error:0];

    goto LABEL_18;
  }

  BOOL v18 = 1;
LABEL_21:

  return v18;
}

- (BOOL)isSATEnrollmentMigratedForLanguageCode:(id)a3
{
  return [(VTPreferences *)self _isSATMarkedForMarker:@"enrollment_migrated" languageCode:a3];
}

- (BOOL)isSATEnrolledForLanguageCode:(id)a3
{
  return [(VTPreferences *)self _isSATMarkedForMarker:@"enrollment_completed" languageCode:a3];
}

- (void)synchronize
{
}

- (void)setOnetimeRemoteAssetQueryRanSuccessfully:(BOOL)a3
{
  id v3 = [NSNumber numberWithBool:a3];
  CFPreferencesSetAppValue(@"One Time Remote Assets Query Succeed", v3, @"com.apple.voicetrigger.notbackedup");
}

- (BOOL)onetimeRemoteAssetQueryRanSuccessfully
{
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger.notbackedup");
  char v2 = (void *)CFPreferencesCopyAppValue(@"One Time Remote Assets Query Succeed", @"com.apple.voicetrigger.notbackedup");
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setSecondPassAudioLoggingEnabled:(BOOL)a3
{
  id v3 = [NSNumber numberWithBool:a3];
  CFPreferencesSetAppValue(@"Second Pass Audio Logging Enabled", v3, @"com.apple.voicetrigger");

  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
  dispatch_time_t v4 = dispatch_time(0, 50000000);
  id v5 = MEMORY[0x263EF83A0];

  dispatch_after(v4, v5, &__block_literal_global_99);
}

- (BOOL)secondPassAudioLoggingEnabled
{
  if (!+[VTUtilities isInternalInstall]) {
    return 0;
  }
  char v2 = (void *)CFPreferencesCopyAppValue(@"Second Pass Audio Logging Enabled", @"com.apple.voicetrigger");
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setFileLoggingLevel:(id)a3
{
  CFPreferencesSetAppValue(@"File Logging Level", a3, @"com.apple.voicetrigger");

  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
}

- (id)fileLoggingLevel
{
  if (+[VTUtilities isInternalInstall]) {
    char v2 = (void *)CFPreferencesCopyAppValue(@"File Logging Level", @"com.apple.voicetrigger");
  }
  else {
    char v2 = 0;
  }

  return v2;
}

- (BOOL)fileLoggingIsEnabled
{
  if (!+[VTUtilities isInternalInstall]) {
    return 0;
  }
  id v3 = [(VTPreferences *)self fileLoggingLevel];
  BOOL v4 = (int)[v3 intValue] > 0;

  return v4;
}

- (void)setFileLoggingIsEnabled:(BOOL)a3
{
  if (a3) {
    id v3 = &unk_26C9A8A20;
  }
  else {
    id v3 = 0;
  }
  [(VTPreferences *)self setFileLoggingLevel:v3];
}

- (id)localizedTriggerPhraseForLanguageCode:(id)a3
{
  BOOL v4 = [a3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  uint64_t v5 = [&unk_26C9A8AA8 objectForKey:v4];
  if (v5)
  {
    id v6 = (__CFString *)v5;
  }
  else
  {
    id v7 = [v4 componentsSeparatedByString:@"-"];
    id v8 = [v7 objectAtIndexedSubscript:0];

    uint64_t v9 = [&unk_26C9A8AA8 objectForKey:v8];
    if (v9)
    {
      id v6 = (__CFString *)v9;
      BOOL v4 = v8;
    }
    else
    {
      int v10 = [(VTPreferences *)self _localeIdentifier];
      id v11 = [v10 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

      id v12 = [v11 componentsSeparatedByString:@"-"];
      BOOL v4 = [v12 objectAtIndexedSubscript:0];

      uint64_t v13 = [&unk_26C9A8AA8 objectForKey:v4];
      if (v13) {
        id v6 = (__CFString *)v13;
      }
      else {
        id v6 = @"Hey Siri";
      }
    }
  }

  return v6;
}

- (id)localizedCompactTriggerPhraseForLanguageCode:(id)a3
{
  if (a3)
  {
    BOOL v4 = [a3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
    uint64_t v5 = [&unk_26C9A8A80 objectForKey:v4];
    if (v5)
    {
      id v6 = (__CFString *)v5;
    }
    else
    {
      id v7 = [v4 componentsSeparatedByString:@"-"];
      id v8 = [v7 objectAtIndexedSubscript:0];

      uint64_t v9 = [&unk_26C9A8A80 objectForKey:v8];
      if (v9)
      {
        id v6 = (__CFString *)v9;
        BOOL v4 = v8;
      }
      else
      {
        int v10 = [(VTPreferences *)self _localeIdentifier];
        id v11 = [v10 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

        id v12 = [v11 componentsSeparatedByString:@"-"];
        BOOL v4 = [v12 objectAtIndexedSubscript:0];

        uint64_t v13 = [&unk_26C9A8A80 objectForKey:v4];
        if (v13) {
          id v6 = (__CFString *)v13;
        }
        else {
          id v6 = @"Siri";
        }
      }
    }
  }
  else
  {
    id v6 = @"Siri";
  }

  return v6;
}

- (id)localizedTriggerPhrase
{
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
  id v3 = [(VTPreferences *)self _languageCode];
  if (!v3)
  {
    BOOL v4 = [MEMORY[0x263EFF960] currentLocale];
    uint64_t v5 = NSString;
    id v6 = [v4 objectForKey:*MEMORY[0x263EFF508]];
    id v7 = [v4 objectForKey:*MEMORY[0x263EFF4D0]];
    id v3 = [v5 stringWithFormat:@"%@-%@", v6, v7];
  }
  id v8 = [(VTPreferences *)self localizedTriggerPhraseForLanguageCode:v3];

  return v8;
}

- (id)_localeIdentifier
{
  char v2 = [MEMORY[0x263EFF960] currentLocale];
  id v3 = [v2 localeIdentifier];

  return v3;
}

- (id)_languageCode
{
  char v2 = [MEMORY[0x263F28598] sharedPreferences];
  id v3 = [v2 languageCode];

  return v3;
}

- (void)setVoiceTriggerEnabledWhenChargerConnected:(BOOL)a3
{
  id v3 = [NSNumber numberWithBool:a3];
  CFPreferencesSetAppValue(@"Enabled On Charger", v3, @"com.apple.voicetrigger");

  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
  dispatch_time_t v4 = dispatch_time(0, 50000000);
  uint64_t v5 = MEMORY[0x263EF83A0];

  dispatch_after(v4, v5, &__block_literal_global_99);
}

- (BOOL)voiceTriggerEnabledWhenChargerConnected
{
  char v2 = (void *)CFPreferencesCopyAppValue(@"Enabled On Charger", @"com.apple.voicetrigger");
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setVoiceTriggerEnabledWhenChargerDisconnected:(BOOL)a3
{
  id v3 = [NSNumber numberWithBool:a3];
  CFPreferencesSetAppValue(@"Battery Power Allowed", v3, @"com.apple.voicetrigger");

  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
  dispatch_time_t v4 = dispatch_time(0, 50000000);
  uint64_t v5 = MEMORY[0x263EF83A0];

  dispatch_after(v4, v5, &__block_literal_global_99);
}

- (BOOL)voiceTriggerEnabledWhenChargerDisconnected
{
  char v2 = (void *)CFPreferencesCopyAppValue(@"Battery Power Allowed", @"com.apple.voicetrigger");
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setPhraseSpotterEnabled:(BOOL)a3 sender:(id)a4
{
  BOOL v4 = a3;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  CFPreferencesSetAppValue(@"Phrase Detector Enabled", v8, @"com.apple.voicetrigger");

  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
  dispatch_time_t v9 = dispatch_time(0, 50000000);
  dispatch_after(v9, MEMORY[0x263EF83A0], &__block_literal_global_99);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kVTPreferencesPhraseSpotterEnabledDidChangeDarwinNotification", v7, 0, 1u);

  [(VTPreferences *)self _logMetadataForVTEnabled:v4];
}

- (void)setPhraseSpotterEnabled:(BOOL)a3
{
}

- (BOOL)phraseSpotterEnabled
{
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
  char v3 = (void *)CFPreferencesCopyAppValue(@"Phrase Detector Enabled", @"com.apple.voicetrigger");
  BOOL v4 = v3;
  if (v3) {
    LOBYTE(v5) = [v3 BOOLValue];
  }
  else {
    int v5 = ![(VTPreferences *)self _storeModeEnabled];
  }

  return v5;
}

- (BOOL)hasExplicitlySetVoiceTriggerEnabled
{
  char v2 = (void *)CFPreferencesCopyAppValue(@"VoiceTrigger Enabled", @"com.apple.voicetrigger");
  BOOL v3 = v2 != 0;

  return v3;
}

- (unint64_t)getUserPreferredVoiceTriggerPhraseTypeForDeviceType:(unint64_t)a3 endpointId:(id)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a4;
  dispatch_time_t v9 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134283779;
    unint64_t v18 = a3;
    __int16 v19 = 2113;
    unint64_t v20 = (unint64_t)v8;
    _os_log_impl(&dword_21844F000, v9, OS_LOG_TYPE_DEFAULT, "deviceType: %{private}lu, endpointId :%{private}@", (uint8_t *)&v17, 0x16u);
  }
  BOOL v10 = [(VTPreferences *)self _isNonEndpointDeviceType:a3];
  if (v8 || !v10)
  {
    if (a3 != 2 || !v8)
    {
      if (a5)
      {
        *a5 = [MEMORY[0x263F087E8] errorWithDomain:VTErrorDomain code:51 userInfo:0];
      }
      uint64_t v14 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        int v17 = 138543618;
        unint64_t v18 = (unint64_t)v8;
        __int16 v19 = 2050;
        unint64_t v20 = a3;
        _os_log_error_impl(&dword_21844F000, v14, OS_LOG_TYPE_ERROR, "Wrong input argument : endpointId(%{public}@), deviceType(%{public}lu)", (uint8_t *)&v17, 0x16u);
      }
      id v11 = 0;
      goto LABEL_20;
    }
    id v12 = [(VTPreferences *)self getPreferencesForEndpoint:v8 fromPreferenceDomain:@"com.apple.voicetrigger" error:a5];
    uint64_t v13 = v12;
    if (!v12)
    {
      id v11 = 0;

LABEL_20:
      unint64_t v15 = 0;
      goto LABEL_21;
    }
    id v11 = [v12 objectForKey:@"UserPreferredVoiceTriggerPhraseType"];

    if (!v11) {
      goto LABEL_20;
    }
  }
  else
  {
    id v11 = (void *)CFPreferencesCopyAppValue(@"UserPreferredVoiceTriggerPhraseType", @"com.apple.voicetrigger");
    if (!v11) {
      goto LABEL_20;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_20;
  }
  unint64_t v15 = [v11 unsignedIntegerValue];
LABEL_21:

  return v15;
}

- (id)setUserPreferredVoiceTriggerPhraseType:(unint64_t)a3 sender:(id)a4 deviceType:(unint64_t)a5 endpointId:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  id v12 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218499;
    unint64_t v26 = a3;
    __int16 v27 = 2049;
    unint64_t v28 = a5;
    __int16 v29 = 2113;
    id v30 = v11;
    _os_log_impl(&dword_21844F000, v12, OS_LOG_TYPE_DEFAULT, "phraseType: %lu, deviceType: %{private}lu, endpointId :%{private}@", buf, 0x20u);
  }
  BOOL v13 = [(VTPreferences *)self _isNonEndpointDeviceType:a5];
  if (!v11 && v13)
  {
    uint64_t v14 = [NSNumber numberWithUnsignedInteger:a3];
    CFPreferencesSetAppValue(@"UserPreferredVoiceTriggerPhraseType", v14, @"com.apple.voicetrigger");
LABEL_6:

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"VT Phrase Type changed", v10, 0, 1u);
    __int16 v16 = 0;
    goto LABEL_14;
  }
  if (a5 == 2 && v11)
  {
    id v24 = 0;
    uint64_t v14 = [(VTPreferences *)self getPreferencesForEndpoint:v11 fromPreferenceDomain:@"com.apple.voicetrigger" error:&v24];
    id v17 = v24;
    if (!v17)
    {
      if (v14)
      {
        uint64_t v20 = [v14 mutableCopy];
      }
      else
      {
        uint64_t v20 = [MEMORY[0x263EFF9A0] dictionary];
      }
      uint64_t v21 = (void *)v20;
      v22 = [NSNumber numberWithUnsignedInteger:a3];
      [v21 setObject:v22 forKey:@"UserPreferredVoiceTriggerPhraseType"];

      id v23 = [(VTPreferences *)self setPreferences:v21 forEndpoint:v11 inPreferenceDomain:@"com.apple.voicetrigger"];
      goto LABEL_6;
    }
    __int16 v16 = v17;
  }
  else
  {
    unint64_t v18 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      unint64_t v26 = (unint64_t)v11;
      __int16 v27 = 2050;
      unint64_t v28 = a5;
      _os_log_error_impl(&dword_21844F000, v18, OS_LOG_TYPE_ERROR, "Wrong input argument : endpointId(%{public}@), deviceType(%{public}lu)", buf, 0x16u);
    }
    __int16 v16 = [MEMORY[0x263F087E8] errorWithDomain:VTErrorDomain code:51 userInfo:0];
  }
LABEL_14:

  return v16;
}

- (void)_setVoiceTriggerEnabled:(BOOL)a3 sender:(id)a4 deviceType:(unint64_t)a5 endpointId:(id)a6
{
  BOOL v8 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  BOOL v12 = [(VTPreferences *)self _isNonEndpointDeviceType:a5];
  if (v11 || !v12)
  {
    if (a5 == 2 && v11)
    {
      BOOL v13 = [(VTPreferences *)self getPreferencesForEndpoint:v11 fromPreferenceDomain:@"com.apple.voicetrigger" error:0];
      uint64_t v14 = v13;
      if (v13)
      {
        uint64_t v15 = [v13 mutableCopy];
      }
      else
      {
        uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
      }
      id v17 = (void *)v15;
      unint64_t v18 = [NSNumber numberWithBool:v8];
      [v17 setObject:v18 forKey:@"VoiceTrigger Enabled"];

      id v19 = [(VTPreferences *)self setPreferences:v17 forEndpoint:v11 inPreferenceDomain:@"com.apple.voicetrigger"];
      CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
      dispatch_time_t v20 = dispatch_time(0, 50000000);
      dispatch_after(v20, MEMORY[0x263EF83A0], &__block_literal_global_99);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kVTPreferencesRemoraVoiceTriggerEnabledDidChangeDarwinNotification", v10, 0, 1u);
    }
    else
    {
      __int16 v16 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        int v22 = 138543618;
        id v23 = v11;
        __int16 v24 = 2050;
        unint64_t v25 = a5;
        _os_log_error_impl(&dword_21844F000, v16, OS_LOG_TYPE_ERROR, "Wrong input argument : endpointId(%{public}@), deviceType(%{public}lu)", (uint8_t *)&v22, 0x16u);
      }
    }
  }
  else
  {
    [(VTPreferences *)self _setVoiceTriggerEnabled:v8 sender:v10 deviceType:a5];
  }
}

- (id)_getVoiceTriggerEnabledDidChangeNotificationStringWithDeviceType:(unint64_t)a3
{
  if (a3 == 3) {
    return @"kVTPreferencesRemoteDarwinVoiceTriggerEnabledDidChangeDarwinNotification";
  }
  else {
    return @"kVTPreferencesVoiceTriggerEnabledDidChangeDarwinNotification";
  }
}

- (id)_getVTEnableLoggingMetadata
{
  v14[3] = *MEMORY[0x263EF8340];
  char v2 = [MEMORY[0x263F08AB0] processInfo];
  BOOL v3 = [v2 processName];

  id v4 = objc_alloc_init(MEMORY[0x263F08790]);
  int v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v4 setLocale:v5];

  [v4 setDateFormat:@"yyyyMMdd-HH:mm:ss"];
  id v6 = [MEMORY[0x263EFF910] date];
  id v7 = [v4 stringFromDate:v6];

  if (v3 && v7)
  {
    v13[0] = @"processName";
    v13[1] = @"timestamp";
    v14[0] = v3;
    v14[1] = v7;
    v13[2] = @"buildVersion";
    BOOL v8 = +[VTUtilities deviceSoftwareVersion];
    v14[2] = v8;
    dispatch_time_t v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  }
  else
  {
    id v10 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v12 = 0;
      _os_log_error_impl(&dword_21844F000, v10, OS_LOG_TYPE_ERROR, "Unable to fetch processName or timestamp", v12, 2u);
    }
    dispatch_time_t v9 = 0;
  }

  return v9;
}

- (void)_logMetadataForVTEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (+[VTUtilities isInternalInstall])
  {
    int v5 = [(VTPreferences *)self _getVTEnableLoggingMetadata];
    id v6 = @"Disabled";
    if (v3) {
      id v6 = @"Enabled";
    }
    id v7 = v6;
    BOOL v8 = [MEMORY[0x263EFF9A0] dictionary];
    dispatch_time_t v9 = (void *)CFPreferencesCopyAppValue(@"VT Enabled Metadata", @"com.apple.voicetrigger.notbackedup");
    id v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 mutableCopy];

      BOOL v8 = (void *)v11;
    }
    [v8 setObject:v5 forKeyedSubscript:v7];
    BOOL v12 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      uint64_t v14 = v8;
      _os_log_impl(&dword_21844F000, v12, OS_LOG_TYPE_DEFAULT, "Writing metadata into plist: %@", (uint8_t *)&v13, 0xCu);
    }
    CFPreferencesSetAppValue(@"VT Enabled Metadata", v8, @"com.apple.voicetrigger.notbackedup");
    CFPreferencesAppSynchronize(@"com.apple.voicetrigger.notbackedup");
  }
}

- (void)_setVoiceTriggerEnabled:(BOOL)a3 sender:(id)a4 deviceType:(unint64_t)a5
{
  BOOL v6 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a4;
  dispatch_time_t v9 = [(VTPreferences *)self _getVoiceTriggerEnabledKeyWithDeviceType:a5];
  id v10 = [(VTPreferences *)self _getVoiceTriggerEnabledDidChangeNotificationStringWithDeviceType:a5];
  uint64_t v11 = [NSNumber numberWithBool:v6];
  CFPreferencesSetAppValue(v9, v11, @"com.apple.voicetrigger");

  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
  BOOL v12 = (void *)CFPreferencesCopyAppValue(v9, @"com.apple.voicetrigger");
  int v13 = v12;
  if (v12 && [v12 BOOLValue] == v6) {
    goto LABEL_13;
  }

  uint64_t v14 = [NSNumber numberWithBool:v6];
  CFPreferencesSetAppValue(v9, v14, @"com.apple.voicetrigger");

  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
  uint64_t v15 = (void *)CFPreferencesCopyAppValue(v9, @"com.apple.voicetrigger");
  int v13 = v15;
  if (v15)
  {
    if ([v15 BOOLValue] == v6) {
      goto LABEL_13;
    }
  }

  __int16 v16 = [NSNumber numberWithBool:v6];
  CFPreferencesSetAppValue(v9, v16, @"com.apple.voicetrigger");

  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
  id v17 = (void *)CFPreferencesCopyAppValue(v9, @"com.apple.voicetrigger");
  int v13 = v17;
  if (v17)
  {
    if ([v17 BOOLValue] == v6) {
      goto LABEL_13;
    }
  }

  unint64_t v18 = [NSNumber numberWithBool:v6];
  CFPreferencesSetAppValue(v9, v18, @"com.apple.voicetrigger");

  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
  id v19 = (void *)CFPreferencesCopyAppValue(v9, @"com.apple.voicetrigger");
  int v13 = v19;
  if (v19)
  {
    if ([v19 BOOLValue] == v6) {
      goto LABEL_13;
    }
  }

  dispatch_time_t v20 = [NSNumber numberWithBool:v6];
  CFPreferencesSetAppValue(v9, v20, @"com.apple.voicetrigger");

  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
  uint64_t v21 = (void *)CFPreferencesCopyAppValue(v9, @"com.apple.voicetrigger");
  int v13 = v21;
  if (!v21) {
    goto LABEL_11;
  }
  if ([v21 BOOLValue] == v6)
  {
LABEL_13:
  }
  else
  {
LABEL_11:

    int v22 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      v25[0] = 67240192;
      v25[1] = v6;
      _os_log_error_impl(&dword_21844F000, v22, OS_LOG_TYPE_ERROR, "Voice trigger state incorrect, expected %{public}d", (uint8_t *)v25, 8u);
    }
  }
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
  dispatch_time_t v23 = dispatch_time(0, 50000000);
  dispatch_after(v23, MEMORY[0x263EF83A0], &__block_literal_global_99);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v10, v8, 0, 1u);

  [(VTPreferences *)self _logMetadataForVTEnabled:v6];
}

- (void)setVoiceTriggerEnabled:(BOOL)a3 sender:(id)a4 deviceType:(unint64_t)a5 endpointId:(id)a6
{
  BOOL v8 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  BOOL v12 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = v12;
    uint64_t v14 = [v11 UUIDString];
    v15[0] = 67240706;
    v15[1] = v8;
    __int16 v16 = 2114;
    id v17 = v14;
    __int16 v18 = 2050;
    unint64_t v19 = a5;
    _os_log_impl(&dword_21844F000, v13, OS_LOG_TYPE_DEFAULT, "setVoiceTriggerEnabled : %{public}d, endpoint : %{public}@, deviceType : %{public}lu", (uint8_t *)v15, 0x1Cu);
  }
  [(VTPreferences *)self _setVoiceTriggerEnabled:v8 sender:v10 deviceType:a5 endpointId:v11];
}

- (void)setVoiceTriggerEnabled:(BOOL)a3 sender:(id)a4 endpointId:(id)a5
{
  id v5 = a5;
  if (a5) {
    a5 = (id)2;
  }
  [(VTPreferences *)self setVoiceTriggerEnabled:a3 sender:a4 deviceType:a5 endpointId:v5];
}

- (void)setVoiceTriggerEnabled:(BOOL)a3 sender:(id)a4
{
}

- (void)setVoiceTriggerEnabled:(BOOL)a3
{
}

- (void)_setCanUseVoiceTriggerDuringPhoneCall:(BOOL)a3 sender:(id)a4
{
  BOOL v4 = a3;
  id v5 = NSNumber;
  id object = a4;
  BOOL v6 = [v5 numberWithBool:v4];
  CFPreferencesSetAppValue(@"Can Use VoiceTrigger During Phone Call", v6, @"com.apple.voicetrigger");

  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kVTPreferencesCanUseVoiceTriggerDuringPhoneCallDidChangeDarwinNotification", object, 0, 1u);
}

- (void)setCanUseVoiceTriggerDuringPhoneCall:(BOOL)a3
{
}

- (unint64_t)canUseVoiceTriggerDuringPhoneCallWithState
{
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
  char v2 = (void *)CFPreferencesCopyAppValue(@"Can Use VoiceTrigger During Phone Call", @"com.apple.voicetrigger");
  BOOL v3 = v2;
  if (v2)
  {
    if ([v2 BOOLValue]) {
      unint64_t v4 = 2;
    }
    else {
      unint64_t v4 = 1;
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)canUseVoiceTriggerDuringPhoneCall
{
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
  BOOL v3 = (void *)CFPreferencesCopyAppValue(@"Can Use VoiceTrigger During Phone Call", @"com.apple.voicetrigger");
  unint64_t v4 = v3;
  if (v3) {
    char v2 = [v3 BOOLValue];
  }
  else {
    char v2 = 0;
  }

  return v2;
}

- (BOOL)remoteDarwinWasEverConnected
{
  char v2 = (void *)CFPreferencesCopyAppValue(@"Remote Darwin Ever Connected", @"com.apple.voicetrigger.notbackedup");
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)voiceTriggerWasEverUsed
{
  char v2 = (void *)CFPreferencesCopyAppValue(@"VoiceTriggerEverUsed", @"com.apple.voicetrigger");
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)_VTSATCachePath
{
  char v2 = CPSharedResourcesDirectory();
  BOOL v3 = [v2 stringByAppendingPathComponent:@"Library/Caches/VoiceTrigger"];

  return v3;
}

- (id)_VTSATBasePath
{
  char v2 = CPSharedResourcesDirectory();
  BOOL v3 = [v2 stringByAppendingPathComponent:@"Library/VoiceTrigger/SAT"];

  return v3;
}

+ (id)deviceCategoryStringRepresentationForCategoryType:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"kVTDeviceCategory_Unknown";
  }
  else {
    return off_2643257A8[a3 - 1];
  }
}

- (id)setPreferences:(id)a3 forEndpoint:(id)a4 inPreferenceDomain:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v7 && v8 && v9)
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:v9];
    BOOL v12 = v11;
    if (v11)
    {
      int v13 = [v11 dictionaryForKey:@"RemoraDevices"];
      uint64_t v14 = (void *)[v13 mutableCopy];

      if (!v14)
      {
        uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
      }
      uint64_t v15 = [v8 UUIDString];
      [v14 setObject:v7 forKey:v15];

      [v12 setObject:v14 forKey:@"RemoraDevices"];
    }

    __int16 v16 = 0;
  }
  else
  {
    id v17 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138478339;
      id v20 = v7;
      __int16 v21 = 2113;
      id v22 = v8;
      __int16 v23 = 2113;
      __int16 v24 = v10;
      _os_log_error_impl(&dword_21844F000, v17, OS_LOG_TYPE_ERROR, "Unexpected Input (pref: %{private}@ endpointId: %{private}@ preferenceDomain: %{private}@).", (uint8_t *)&v19, 0x20u);
    }
    __int16 v16 = [MEMORY[0x263F087E8] errorWithDomain:VTErrorDomain code:1 userInfo:0];
  }

  return v16;
}

- (id)getPreferencesForEndpoint:(id)a3 fromPreferenceDomain:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7 && v8)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:v8];
    id v11 = v10;
    if (v10)
    {
      BOOL v12 = [v10 dictionaryForKey:@"RemoraDevices"];
      int v13 = (void *)[v12 mutableCopy];

      if (v13)
      {
        uint64_t v14 = [v7 UUIDString];
        uint64_t v15 = [v13 objectForKey:v14];

        if (!v15)
        {
          __int16 v18 = (void *)VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
          {
            int v19 = v18;
            id v20 = [v7 UUIDString];
            int v25 = 138477827;
            id v26 = v20;
            _os_log_impl(&dword_21844F000, v19, OS_LOG_TYPE_INFO, "Saved voice trigger preferences for endpoint %{private}@ is nil", (uint8_t *)&v25, 0xCu);
          }
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v16 = v15;
LABEL_13:

LABEL_19:
          goto LABEL_22;
        }
        __int16 v21 = (void *)VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
        {
          __int16 v23 = v21;
          __int16 v24 = [v7 UUIDString];
          int v25 = 138477827;
          id v26 = v24;
          _os_log_error_impl(&dword_21844F000, v23, OS_LOG_TYPE_ERROR, "Saved voice trigger preferences for endpoint %{private}@ is not a dictionary.", (uint8_t *)&v25, 0xCu);
        }
        if (a5)
        {
          objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", VTErrorDomain, objc_msgSend(&unk_26C9A8A38, "unsignedIntegerValue"), 0);
          uint64_t v15 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
      }
    }
    uint64_t v15 = 0;
    goto LABEL_19;
  }
  id v17 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    int v25 = 138478083;
    id v26 = v7;
    __int16 v27 = 2113;
    unint64_t v28 = v9;
    _os_log_error_impl(&dword_21844F000, v17, OS_LOG_TYPE_ERROR, "Unexpected Input (endpointId: %{private}@ preferenceDomain: %{private}@).", (uint8_t *)&v25, 0x16u);
    if (a5) {
      goto LABEL_10;
    }
  }
  else if (a5)
  {
LABEL_10:
    [MEMORY[0x263F087E8] errorWithDomain:VTErrorDomain code:1 userInfo:0];
    uint64_t v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  uint64_t v15 = 0;
LABEL_22:

  return v15;
}

@end