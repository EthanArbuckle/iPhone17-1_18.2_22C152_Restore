@interface _LTDTTSAssetService
+ (NSArray)subscribedVoices;
+ (SiriTTSDaemonSession)siriTTSSession;
+ (id)_availableTTSAssets;
+ (id)_availableTTSAssetsByLanguage;
+ (id)_preferredNameForLanguage:(id)a3;
+ (id)_queue;
+ (id)_siriVoiceForTTSAsset:(id)a3;
+ (id)_ttsAssetForLanguage:(id)a3 name:(id)a4 gender:(int64_t)a5;
+ (id)installedAssetIdentifiers;
+ (id)ttsAssetForLocaleIdentifier:(id)a3;
+ (id)voiceForLocaleIdentifier:(id)a3;
+ (int64_t)_genderForLocaleIdentifier:(id)a3;
+ (int64_t)_preferredGender;
+ (int64_t)preferredVoiceType;
+ (void)_availableTTSAssetsByLanguage;
+ (void)downloadAsset:(id)a3 options:(unint64_t)a4 progress:(id)a5 completion:(id)a6;
+ (void)downloadVoiceAssetsForLanguagePair:(id)a3;
+ (void)installedAssetIdentifiers;
+ (void)setAutoDownloadedAssets:(id)a3;
+ (void)setSiriTTSSession:(id)a3;
+ (void)setSubscribedVoices:(id)a3;
+ (void)subscribedVoices;
@end

@implementation _LTDTTSAssetService

+ (id)_queue
{
  if (_queue_onceToken_1 != -1) {
    dispatch_once(&_queue_onceToken_1, &__block_literal_global_15);
  }
  v2 = (void *)_queue__queue_1;
  return v2;
}

+ (int64_t)_preferredGender
{
  v2 = _AFPreferencesOutputVoice();
  int64_t v3 = [v2 gender];

  return v3;
}

+ (id)_preferredNameForLanguage:(id)a3
{
  int64_t v3 = [a3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  v4 = _AFPreferencesOutputVoice();
  v5 = [v4 languageCode];
  if ([v5 isEqualToString:v3])
  {
    v6 = [v4 name];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (int64_t)preferredVoiceType
{
  uint64_t v2 = [a1 _preferredGender];
  if (v2 == 1) {
    return 1;
  }
  else {
    return 2 * (v2 == 2);
  }
}

+ (int64_t)_genderForLocaleIdentifier:(id)a3
{
  int64_t v3 = objc_msgSend(MEMORY[0x263EFF960], "lt_localeWithLTIdentifier:", a3);
  uint64_t v4 = _LTPreferredVoiceTypeForLocale(v3);
  uint64_t v5 = 2;
  if (v4 != 2) {
    uint64_t v5 = 3;
  }
  if (v4 == 1) {
    int64_t v6 = 1;
  }
  else {
    int64_t v6 = v5;
  }

  return v6;
}

+ (id)_ttsAssetForLanguage:(id)a3 name:(id)a4 gender:(int64_t)a5
{
  v19[3] = *MEMORY[0x263EF8340];
  v7 = (void *)MEMORY[0x263EFF9A0];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 dictionary];
  [v10 setObject:v9 forKeyedSubscript:&unk_270C33850];

  [v10 setObject:v8 forKeyedSubscript:&unk_270C33868];
  if (a5)
  {
    v11 = [NSNumber numberWithInteger:a5];
    [v10 setObject:v11 forKeyedSubscript:&unk_270C33880];
  }
  v12 = (void *)MEMORY[0x263F74EA8];
  v13 = [MEMORY[0x263F74EC0] gryphonVoice];
  v14 = objc_msgSend(MEMORY[0x263F74EC0], "vocalizerVoice", v13);
  v19[1] = v14;
  v15 = [MEMORY[0x263F74EC0] customVoice];
  v19[2] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:3];
  v17 = [v12 bestAssetOfTypes:v16 matching:v10];

  return v17;
}

+ (id)ttsAssetForLocaleIdentifier:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  int64_t v6 = [a1 _preferredNameForLanguage:v5];
  uint64_t v7 = [a1 _genderForLocaleIdentifier:v4];
  id v8 = [a1 _availableTTSAssetsByLanguage];
  id v9 = [v8 objectForKeyedSubscript:v5];
  v10 = _LTOSLogAssets();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    +[_LTDTTSAssetService ttsAssetForLocaleIdentifier:]();
  }
  if (![v9 count])
  {
    v43 = v9;
    v40 = v5;
    v38 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v4];
    v11 = [v38 languageCode];
    v12 = [v11 stringByAppendingString:@"-"];

    v13 = [v8 allKeys];
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __51___LTDTTSAssetService_ttsAssetForLocaleIdentifier___block_invoke;
    v49[3] = &unk_265546D80;
    id v14 = v12;
    id v50 = v14;
    uint64_t v15 = [v13 indexOfObjectPassingTest:v49];
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = _LTOSLogAssets();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[_LTDTTSAssetService ttsAssetForLocaleIdentifier:]();
      }
    }
    else
    {
      v17 = [v13 objectAtIndexedSubscript:v15];
      uint64_t v18 = [v8 objectForKeyedSubscript:v17];

      v43 = (void *)v18;
    }
    uint64_t v5 = v40;

    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v19 = 0;
      id v9 = v43;
      goto LABEL_45;
    }
    id v9 = v43;
  }
  if ((unint64_t)(v7 - 1) >= 3) {
    uint64_t v20 = 0;
  }
  else {
    uint64_t v20 = v7;
  }
  v21 = [a1 _ttsAssetForLanguage:v5 name:v6 gender:v20];
  if (v21)
  {
    v22 = _LTOSLogAssets();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      +[_LTDTTSAssetService ttsAssetForLocaleIdentifier:]();
    }
    id v19 = v21;
  }
  else
  {
    id v39 = v4;
    v41 = v5;
    v42 = v8;
    id v19 = [v9 firstObject];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v44 = v9;
    id v23 = v9;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v46;
      while (2)
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v46 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          v29 = [v28 name];
          uint64_t v30 = [v29 caseInsensitiveCompare:v6];

          uint64_t v31 = [v28 gender];
          if (v30) {
            BOOL v32 = 0;
          }
          else {
            BOOL v32 = v31 == v20;
          }
          if (v32)
          {
            id v36 = v28;

            id v19 = v36;
            goto LABEL_43;
          }
          uint64_t v33 = v31;
          if (v30) {
            BOOL v34 = 0;
          }
          else {
            BOOL v34 = v19 == 0;
          }
          if (v34) {
            id v19 = v28;
          }
          if (v33 == v20 && v19 == 0) {
            id v19 = v28;
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v45 objects:v51 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }
LABEL_43:

    id v4 = v39;
    uint64_t v5 = v41;
    id v8 = v42;
    id v9 = v44;
    v21 = 0;
  }

LABEL_45:
  return v19;
}

+ (id)voiceForLocaleIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [a1 ttsAssetForLocaleIdentifier:v4];
  if (v5)
  {
    id v6 = [a1 _siriVoiceForTTSAsset:v5];
    if (v6) {
      goto LABEL_6;
    }
  }
  uint64_t v7 = _LTOSLogAssets();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    id v9 = [v5 identifier];
    int v13 = 138543618;
    id v14 = v9;
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_2600DC000, v8, OS_LOG_TYPE_INFO, "SiriTTS cannot load voice for TTS asset %{public}@, attempt default voice for language %{public}@", (uint8_t *)&v13, 0x16u);
  }
  id v6 = (id)[objc_alloc(MEMORY[0x263F74E98]) initWithLanguage:v4 name:0];
  if ([v6 footprint])
  {
LABEL_6:
    id v6 = v6;
    v10 = v6;
  }
  else
  {
    v11 = _LTOSLogAssets();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[_LTDTTSAssetService voiceForLocaleIdentifier:]();
    }
    v10 = 0;
  }

  return v10;
}

+ (id)_siriVoiceForTTSAsset:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 supportedLanguages];
    id v6 = [v5 firstObject];

    uint64_t v7 = [v4 name];
    unint64_t v8 = [v4 gender];
    if (v8 > 3) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = qword_26027B678[v8];
    }
    v11 = (void *)[objc_alloc(MEMORY[0x263F74E98]) initWithLanguage:v6 name:v7];
    if (v11 || (v11 = (void *)[objc_alloc(MEMORY[0x263F74E98]) initWithLanguage:v6 name:0]) != 0)
    {
      [v11 setGender:v9];
    }
    else
    {
      int v13 = _LTOSLogAssets();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        +[_LTDTTSAssetService _siriVoiceForTTSAsset:]();
      }
      v11 = 0;
    }
  }
  else
  {
    v10 = _LTOSLogAssets();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[_LTDTTSAssetService _siriVoiceForTTSAsset:](v10);
    }
    v11 = 0;
  }

  return v11;
}

+ (id)_availableTTSAssets
{
  v9[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  id v3 = (void *)MEMORY[0x263F74EA8];
  id v4 = [MEMORY[0x263F74EC0] gryphonVoice];
  v9[0] = v4;
  uint64_t v5 = [MEMORY[0x263F74EC0] vocalizerVoice];
  v9[1] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  uint64_t v7 = [v3 listAssetsOfTypes:v6 matching:v2];

  return v7;
}

+ (id)_availableTTSAssetsByLanguage
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 _availableTTSAssets];
  id v3 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    unint64_t v8 = (void *)MEMORY[0x263EFFA68];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "supportedLanguages", (void)v20);
        v12 = [v11 firstObject];

        if (v12)
        {
          uint64_t v13 = [v3 objectForKeyedSubscript:v12];
          id v14 = (void *)v13;
          if (v13) {
            __int16 v15 = (void *)v13;
          }
          else {
            __int16 v15 = v8;
          }
          id v16 = v15;

          uint64_t v17 = [v16 arrayByAddingObject:v10];

          [v3 setObject:v17 forKeyedSubscript:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  uint64_t v18 = _LTOSLogAssets();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    +[_LTDTTSAssetService _availableTTSAssetsByLanguage]();
  }

  return v3;
}

+ (id)installedAssetIdentifiers
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 _availableTTSAssets];
  id v3 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v2, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    uint64_t v20 = *(void *)v29;
    id v21 = v4;
    do
    {
      uint64_t v8 = 0;
      uint64_t v22 = v6;
      do
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v28 + 1) + 8 * v8);
        if ([v9 locallyAvailable])
        {
          uint64_t v23 = v8;
          v10 = [v9 supportedLanguages];
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v25;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v25 != v13) {
                  objc_enumerationMutation(v10);
                }
                __int16 v15 = NSString;
                id v16 = [*(id *)(*((void *)&v24 + 1) + 8 * i) stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
                uint64_t v17 = [v15 stringWithFormat:@"TTS-%@", v16];

                [v3 addObject:v17];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v12);
          }

          uint64_t v7 = v20;
          id v4 = v21;
          uint64_t v6 = v22;
          uint64_t v8 = v23;
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v6);
  }

  uint64_t v18 = _LTOSLogAssets();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    +[_LTDTTSAssetService installedAssetIdentifiers]();
  }

  return v3;
}

+ (void)setAutoDownloadedAssets:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "isTTSModel", (void)v15))
        {
          uint64_t v12 = +[_LTDTTSAssetModel modelFromAsset:v11];
          uint64_t v13 = [v12 ttsAsset];
          id v14 = [a1 _siriVoiceForTTSAsset:v13];

          if (v14) {
            [v5 addObject:v14];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  [a1 setSubscribedVoices:v5];
}

+ (void)setSiriTTSSession:(id)a3
{
}

+ (SiriTTSDaemonSession)siriTTSSession
{
  id v3 = (void *)_siriTTSSession;
  if (_siriTTSSession)
  {
    [a1 setSiriTTSSession:_siriTTSSession];
    id v4 = v3;
  }
  else
  {
    id v4 = (id)objc_opt_new();
    [a1 setSiriTTSSession:v4];
  }
  return (SiriTTSDaemonSession *)v4;
}

+ (void)setSubscribedVoices:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _LTOSLogAssets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[_LTDTTSAssetService setSubscribedVoices:]();
  }
  id v6 = [a1 siriTTSSession];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43___LTDTTSAssetService_setSubscribedVoices___block_invoke;
  v7[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v7[4] = a1;
  [v6 subscribeWithVoices:v4 reply:v7];
}

+ (NSArray)subscribedVoices
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  id v4 = _LTPreferencesInstalledLocales();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [a1 voiceForLocaleIdentifier:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  v10 = _LTOSLogAssets();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    +[_LTDTTSAssetService subscribedVoices]();
  }

  return (NSArray *)v3;
}

+ (void)downloadVoiceAssetsForLanguagePair:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _LTOSLogAssets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v16 = 138543362;
    id v17 = v4;
    _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "SiriTTS downloaded voice assets for pair %{public}@", (uint8_t *)&v16, 0xCu);
  }
  uint64_t v6 = [_LTDTTSAssetModel alloc];
  uint64_t v7 = [v4 sourceLocale];
  uint64_t v8 = [v7 localeIdentifier];
  uint64_t v9 = [(_LTDTTSAssetModel *)v6 initWithAssetIdentifier:v8];

  v10 = [[_LTDAssetModel alloc] initWithProvider:v9];
  uint64_t v11 = [_LTDTTSAssetModel alloc];
  long long v12 = [v4 targetLocale];
  long long v13 = [v12 localeIdentifier];
  long long v14 = [(_LTDTTSAssetModel *)v11 initWithAssetIdentifier:v13];

  long long v15 = [[_LTDAssetModel alloc] initWithProvider:v14];
  [a1 downloadAsset:v10 options:0 progress:0 completion:0];
  [a1 downloadAsset:v15 options:0 progress:0 completion:0];
}

+ (void)downloadAsset:(id)a3 options:(unint64_t)a4 progress:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  long long v13 = [a1 _queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke;
  block[3] = &unk_265546C78;
  id v18 = v10;
  id v19 = v12;
  id v20 = v11;
  unint64_t v21 = a4;
  id v22 = a1;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  dispatch_async(v13, block);
}

+ (void)ttsAssetForLocaleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_2600DC000, v0, v1, "SiriTTS found candidate %{public}@ for locale: %{public}@");
}

+ (void)ttsAssetForLocaleIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "SiriTTS failed to locate TTS assets for language prefix %{public}@", v2, v3, v4, v5, v6);
}

+ (void)ttsAssetForLocaleIdentifier:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_2600DC000, v0, v1, "SiriTTS candidates for locale %{public}@ are: %{public}@");
}

+ (void)voiceForLocaleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "SiriTTS cannot find default voice for language %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_siriVoiceForTTSAsset:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2600DC000, log, OS_LOG_TYPE_ERROR, "SiriTTS cannot derive voice for nil TTS asset", v1, 2u);
}

+ (void)_siriVoiceForTTSAsset:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "SiriTTS failed to derive voice for language %{public}@ with name %{public}@");
}

+ (void)_availableTTSAssetsByLanguage
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_2600DC000, v0, v1, "SiriTTS available assets: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)installedAssetIdentifiers
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_2600DC000, v0, v1, "SiriTTS installed assets: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)setSubscribedVoices:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_2600DC000, v0, v1, "SiriTTS set subscribed voices: %@", v2, v3, v4, v5, v6);
}

+ (void)subscribedVoices
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_2600DC000, v0, v1, "SiriTTS get subscribed voices: %@", v2, v3, v4, v5, v6);
}

@end