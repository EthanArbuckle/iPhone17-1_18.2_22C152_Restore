@interface MNVoiceLanguageUtil
+ (id)_uiVoiceLanguage;
+ (id)systemDefaultVoiceLanguage;
@end

@implementation MNVoiceLanguageUtil

+ (id)systemDefaultVoiceLanguage
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [a1 _uiVoiceLanguage];
  v3 = [MEMORY[0x1E4F4E538] sharedPreferences];
  int v4 = [v3 assistantIsEnabled];

  if (!v4)
  {
    v6 = GetAudioLogForMNVoiceLanguageUtilCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v17 = 138543362;
      v18 = v2;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_INFO, "ⓥ Using UI language %{public}@ (Siri disabled)", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_15;
  }
  v5 = [MEMORY[0x1E4F4E420] outputVoice];
  v6 = [v5 languageCode];

  v7 = GetAudioLogForMNVoiceLanguageUtilCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138543362;
    v18 = v6;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEBUG, "ⓥ siriVoiceLanguage = %{public}@", (uint8_t *)&v17, 0xCu);
  }

  if (!v6)
  {
LABEL_15:
    v13 = v2;
    goto LABEL_20;
  }
  int v8 = [MEMORY[0x1E4F4E420] assistantIsSupportedForLanguageCode:v2 error:0];
  v9 = GetAudioLogForMNVoiceLanguageUtilCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = @"No";
    if (v8) {
      v10 = @"Yes";
    }
    int v17 = 138543362;
    v18 = v10;
    _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_DEBUG, "ⓥ uiLanguageAvailableInSiri = %{public}@", (uint8_t *)&v17, 0xCu);
  }

  v11 = GetAudioLogForMNVoiceLanguageUtilCategory();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v12)
    {
      int v17 = 138543618;
      v18 = v6;
      __int16 v19 = 2114;
      v20 = v2;
      _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_INFO, "ⓥ Using Siri language %{public}@ (UI-based language is %{public}@)", (uint8_t *)&v17, 0x16u);
    }

    v13 = v6;
    v11 = v2;
  }
  else
  {
    if (v12)
    {
      int v17 = 138543618;
      v18 = v2;
      __int16 v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_INFO, "ⓥ Using UI language %{public}@ (Siri language is %{public}@)", (uint8_t *)&v17, 0x16u);
    }
    v13 = v2;
  }

LABEL_20:
  v14 = [MEMORY[0x1E4F64648] supportedPhoneticTypesForPhoneticLocaleID:v13];
  GEOConfigSetArray();
  v15 = v13;

  return v15;
}

+ (id)_uiVoiceLanguage
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 preferredLocalizations];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = v3;
  uint64_t v24 = [v4 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (!v24)
  {

LABEL_20:
    v6 = @"en-US";
    goto LABEL_21;
  }
  v6 = 0;
  uint64_t v23 = *(void *)v26;
  uint64_t v7 = *MEMORY[0x1E4F1C438];
  *(void *)&long long v5 = 138543874;
  long long v22 = v5;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v26 != v23) {
      objc_enumerationMutation(v4);
    }
    uint64_t v9 = *(void *)(*((void *)&v25 + 1) + 8 * v8);
    v10 = objc_msgSend(MEMORY[0x1E4F1CA20], "canonicalLanguageIdentifierFromString:", v9, v22);
    v11 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v10];
    BOOL v12 = [v11 objectForKey:v7];

    v13 = [MEMORY[0x1E4FA4F38] fallbackLanguageFor:v10];
    v14 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v13];
    v15 = [v14 objectForKey:v7];

    v16 = GetAudioLogForMNVoiceLanguageUtilCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v22;
      uint64_t v30 = v9;
      __int16 v31 = 2114;
      v32 = v10;
      __int16 v33 = 2114;
      v34 = v13;
      _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_DEBUG, "ⓥ UI language %{public}@ (%{public}@) falls back to %{public}@", buf, 0x20u);
    }

    int v17 = [v12 isEqualToString:@"yue"];
    int v18 = [v13 isEqualToString:@"zh-HK"];
    if (!v6) {
      v6 = v13;
    }
    if ((v17 & v18 & 1) != 0 || [v15 isEqual:v12])
    {
      __int16 v19 = v13;

      char v20 = 1;
      v6 = v19;
    }
    else
    {
      char v20 = 0;
    }

    if (v20) {
      break;
    }
    if (v24 == ++v8)
    {
      uint64_t v24 = [v4 countByEnumeratingWithState:&v25 objects:v35 count:16];
      if (v24) {
        goto LABEL_3;
      }
      break;
    }
  }

  if (!v6) {
    goto LABEL_20;
  }
LABEL_21:

  return v6;
}

@end