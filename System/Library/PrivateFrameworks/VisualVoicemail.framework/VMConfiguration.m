@interface VMConfiguration
+ (BOOL)isSystemLocaleSupportedForTranscription;
+ (NSArray)VMASRSupportedLocales;
+ (NSArray)VMExpansionAvailableLocales;
+ (NSLocale)localeForTranscriptionLanguage;
+ (NSLocale)matchLocaleForTranscriptionLanguage;
+ (float)confidenceLowQualityThreshold;
+ (float)confidenceSegmentThreshold;
+ (float)confidenceThreshold;
+ (id)confidenceLowQualityThresholdFromAsset;
+ (id)confidenceSegmentThresholdFromAsset;
+ (id)confidenceThresholdFromAsset;
+ (id)confidenceThresholdFromAssetForKey:(id)a3;
+ (id)confidenceThresholdFromDefaultsForKey:(id)a3;
+ (id)metadataDictionaryForSpeechAssetWithLanguage:(id)a3;
@end

@implementation VMConfiguration

+ (NSLocale)matchLocaleForTranscriptionLanguage
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ([(id)objc_opt_class() isSystemLocaleSupportedForTranscription])
  {
    v2 = [(id)objc_opt_class() VMASRSupportedLocales];
    v3 = [MEMORY[0x263EFF960] preferredLanguages];
    v4 = [MEMORY[0x263EFF960] matchedLanguagesFromAvailableLanguages:v2 forPreferredLanguages:v3];
    uint64_t v5 = [v4 count];
    v6 = vm_framework_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        v8 = [v4 firstObject];
        int v14 = 138413058;
        v15 = v3;
        __int16 v16 = 2112;
        v17 = v2;
        __int16 v18 = 2112;
        v19 = v4;
        __int16 v20 = 2112;
        v21 = v8;
        _os_log_impl(&dword_21C797000, v6, OS_LOG_TYPE_DEFAULT, "matchLocaleForTranscriptionLanguage: Mapping preferred languages %@ to languages supported by Siri: %@. Mapped languages: %@ Returning identifier %@", (uint8_t *)&v14, 0x2Au);
      }
      v9 = (void *)MEMORY[0x263EFF960];
      v6 = [v4 firstObject];
      v10 = [v9 localeWithLocaleIdentifier:v6];
    }
    else
    {
      if (v7)
      {
        int v14 = 138412546;
        v15 = v3;
        __int16 v16 = 2112;
        v17 = v2;
        _os_log_impl(&dword_21C797000, v6, OS_LOG_TYPE_DEFAULT, "matchLocaleForTranscriptionLanguage: No preferred languages %@ supported by Siri: %@.", (uint8_t *)&v14, 0x16u);
      }
      v10 = 0;
    }

    v11 = v10;
    v12 = v11;
  }
  else
  {
    v11 = vm_framework_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_21C797000, v11, OS_LOG_TYPE_DEFAULT, "matchLocaleForTranscriptionLanguage: Transcription not supported for system locale", (uint8_t *)&v14, 2u);
    }
    v12 = 0;
  }

  return (NSLocale *)v12;
}

+ (BOOL)isSystemLocaleSupportedForTranscription
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF960] currentLocale];
  v3 = [v2 regionCode];
  if (v3)
  {
    v4 = [v2 languageCode];
    uint64_t v5 = (void *)[[NSString alloc] initWithFormat:@"%@-%@", v4, v3];
  }
  else
  {
    uint64_t v5 = [v2 languageIdentifier];
  }
  v6 = [(id)objc_opt_class() VMExpansionAvailableLocales];
  int v7 = [v6 containsObject:v5];
  v8 = vm_framework_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = v5;
    __int16 v12 = 1024;
    int v13 = v7;
    _os_log_impl(&dword_21C797000, v8, OS_LOG_TYPE_DEFAULT, "isSystemLocaleSupportedForTranscription: System locale's language identifier = %@, is it enabled? %d", buf, 0x12u);
  }

  return v7;
}

+ (NSArray)VMExpansionAvailableLocales
{
  return (NSArray *)&unk_26CD18708;
}

+ (NSArray)VMASRSupportedLocales
{
  return (NSArray *)&unk_26CD18720;
}

+ (NSLocale)localeForTranscriptionLanguage
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF960] currentLocale];
  if (v2)
  {
    if (_os_feature_enabled_impl())
    {
      v3 = vm_framework_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_21C797000, v3, OS_LOG_TYPE_DEFAULT, "localeForTranscriptionLanguage: Flag lvmExpansionLiveOnEnabled enabled", (uint8_t *)&v20, 2u);
      }

      v4 = [(id)objc_opt_class() matchLocaleForTranscriptionLanguage];
      uint64_t v5 = vm_framework_log();
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      if (v4)
      {
        if (v6)
        {
          int v7 = [v4 languageIdentifier];
          int v20 = 138412290;
          v21 = v7;
          _os_log_impl(&dword_21C797000, v5, OS_LOG_TYPE_DEFAULT, "localeForTranscriptionLanguage: Returning %@", (uint8_t *)&v20, 0xCu);
        }
        id v8 = v4;
LABEL_22:
        v10 = v8;
        goto LABEL_23;
      }
      if (v6)
      {
        v11 = [v2 languageIdentifier];
        int v20 = 138412290;
        v21 = v11;
        _os_log_impl(&dword_21C797000, v5, OS_LOG_TYPE_DEFAULT, "localeForTranscriptionLanguage: No preferred languages supported by Siri. Defaulting to fallback current %@", (uint8_t *)&v20, 0xCu);
      }
    }
    id v12 = v2;
    int v13 = [v12 languageIdentifier];
    int v14 = [v13 isEqualToString:@"en-CA"];

    if (v14)
    {
      v15 = vm_framework_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_21C797000, v15, OS_LOG_TYPE_DEFAULT, "localeForTranscriptionLanguage: Mapping Canadian Siri to US Siri language for transcription", (uint8_t *)&v20, 2u);
      }

      uint64_t v16 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en-US"];

      id v12 = (id)v16;
    }
    v17 = vm_framework_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = [v12 languageIdentifier];
      int v20 = 138412290;
      v21 = v18;
      _os_log_impl(&dword_21C797000, v17, OS_LOG_TYPE_DEFAULT, "localeForTranscriptionLanguage: Returning %@", (uint8_t *)&v20, 0xCu);
    }
    id v8 = v12;
    goto LABEL_22;
  }
  v9 = vm_framework_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_21C797000, v9, OS_LOG_TYPE_DEFAULT, "localeForTranscriptionLanguage: Error: nil system locale returned.", (uint8_t *)&v20, 2u);
  }

  v10 = 0;
LABEL_23:

  return (NSLocale *)v10;
}

+ (float)confidenceThreshold
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [a1 confidenceThresholdFromAsset];
  v4 = v3;
  if (v3)
  {
    [v3 floatValue];
    float v6 = v5;
  }
  else
  {
    int v7 = [a1 confidenceThresholdFromDefaultsForKey:@"VoicemailTranscriptionConfidenceThreshold"];

    if (v7)
    {
      id v8 = [a1 confidenceThresholdFromDefaultsForKey:@"VoicemailTranscriptionConfidenceThreshold"];
      [v8 floatValue];
      float v6 = v9;
    }
    else
    {
      float v6 = 0.45096;
    }
  }
  v10 = vm_framework_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    double v13 = v6;
    _os_log_impl(&dword_21C797000, v10, OS_LOG_TYPE_DEFAULT, "Returning confidenceThreshold of %f", (uint8_t *)&v12, 0xCu);
  }

  return v6;
}

+ (float)confidenceLowQualityThreshold
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [a1 confidenceLowQualityThresholdFromAsset];
  v4 = v3;
  if (v3)
  {
    [v3 floatValue];
    float v6 = v5;
  }
  else
  {
    int v7 = [a1 confidenceThresholdFromDefaultsForKey:@"VoicemailTranscriptionLowQualityConfidenceThreshold"];

    if (v7)
    {
      id v8 = [a1 confidenceThresholdFromDefaultsForKey:@"VoicemailTranscriptionLowQualityConfidenceThreshold"];
      [v8 floatValue];
      float v6 = v9;
    }
    else
    {
      float v6 = 0.6878;
    }
  }
  v10 = vm_framework_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    double v13 = v6;
    _os_log_impl(&dword_21C797000, v10, OS_LOG_TYPE_DEFAULT, "Returning confidenceLowQualityThreshold of %f", (uint8_t *)&v12, 0xCu);
  }

  return v6;
}

+ (float)confidenceSegmentThreshold
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [a1 confidenceSegmentThresholdFromAsset];
  v4 = v3;
  if (v3)
  {
    [v3 floatValue];
    float v6 = v5;
  }
  else
  {
    int v7 = [a1 confidenceThresholdFromDefaultsForKey:@"VoicemailTranscriptionSegmentConfidenceThreshold"];

    if (v7)
    {
      id v8 = [a1 confidenceThresholdFromDefaultsForKey:@"VoicemailTranscriptionSegmentConfidenceThreshold"];
      [v8 floatValue];
      float v6 = v9;
    }
    else
    {
      float v6 = 0.3;
    }
  }
  v10 = vm_framework_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    double v13 = v6;
    _os_log_impl(&dword_21C797000, v10, OS_LOG_TYPE_DEFAULT, "Returning confidenceSegmentThreshold of %f", (uint8_t *)&v12, 0xCu);
  }

  return v6;
}

+ (id)confidenceThresholdFromDefaultsForKey:(id)a3
{
  CFPropertyListRef v3 = CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.visualvoicemail");
  v4 = (void *)v3;
  if (v3)
  {
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 != CFNumberGetTypeID())
    {
      CFRelease(v4);
      v4 = 0;
    }
  }
  return v4;
}

+ (id)confidenceThresholdFromAsset
{
  return (id)[a1 confidenceThresholdFromAssetForKey:@"confidence-threshold"];
}

+ (id)confidenceLowQualityThresholdFromAsset
{
  return (id)[a1 confidenceThresholdFromAssetForKey:@"low-quality-confidence-threshold"];
}

+ (id)confidenceSegmentThresholdFromAsset
{
  return (id)[a1 confidenceThresholdFromAssetForKey:@"segment-confidence-threshold"];
}

+ (id)confidenceThresholdFromAssetForKey:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CFTypeID v5 = [a1 localeForTranscriptionLanguage];
  float v6 = [v5 localeIdentifier];

  int v7 = [MEMORY[0x263EFF960] canonicalLanguageIdentifierFromString:v6];
  id v8 = [a1 metadataDictionaryForSpeechAssetWithLanguage:v7];
  float v9 = v8;
  if (!v8) {
    goto LABEL_15;
  }
  v10 = [v8 objectForKeyedSubscript:@"voicemail-confidence-parameters"];
  v11 = vm_framework_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (v12)
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_21C797000, v11, OS_LOG_TYPE_DEFAULT, "Could not find a confidence threshold dictionary in this asset metadata", (uint8_t *)&v20, 2u);
    }
    goto LABEL_14;
  }
  if (v12)
  {
    int v20 = 138412290;
    v21 = v10;
    _os_log_impl(&dword_21C797000, v11, OS_LOG_TYPE_DEFAULT, "Found confidence dictionary in asset: %@", (uint8_t *)&v20, 0xCu);
  }

  double v13 = [v10 objectForKeyedSubscript:v4];
  uint64_t v14 = NSNumber;
  [v13 floatValue];
  v11 = objc_msgSend(v14, "numberWithFloat:");

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ([v11 floatValue], v15 < 0.0)
      || ([v11 floatValue], v16 > 1.0))
    {
      v17 = vm_framework_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[VMConfiguration confidenceThresholdFromAssetForKey:]((uint64_t)v11, v17);
      }

LABEL_14:
LABEL_15:
      v11 = 0;
    }
  }
  __int16 v18 = vm_framework_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412546;
    v21 = v11;
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_impl(&dword_21C797000, v18, OS_LOG_TYPE_DEFAULT, "Returning threshold from asset of %@, for key %@", (uint8_t *)&v20, 0x16u);
  }

  return v11;
}

+ (id)metadataDictionaryForSpeechAssetWithLanguage:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = vm_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v43 = v3;
    _os_log_impl(&dword_21C797000, v4, OS_LOG_TYPE_DEFAULT, "Fetching JSON transcription object for %@", buf, 0xCu);
  }

  CFTypeID v5 = (void *)[objc_alloc(MEMORY[0x263F55950]) initWithType:@"com.apple.MobileAsset.EmbeddedSpeech"];
  [v5 addKeyValuePair:@"Language" with:v3];
  [v5 returnTypes:1];
  v34 = v3;
  if ([v5 queryMetaDataSync])
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v7 = [v5 results];
    if (!v7
      || (id v8 = (void *)v7,
          [v5 results],
          float v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v9 count],
          v9,
          v8,
          !v10))
    {
      v11 = vm_framework_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C797000, v11, OS_LOG_TYPE_DEFAULT, "No embedded speech assets were found", buf, 2u);
      }
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v33 = v5;
    id obj = [v5 results];
    uint64_t v12 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v12)
    {
      uint64_t v14 = v12;
      id v6 = 0;
      uint64_t v15 = *(void *)v39;
      *(void *)&long long v13 = 138412290;
      long long v32 = v13;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          __int16 v18 = objc_msgSend(v17, "getLocalUrl", v32);
          v19 = vm_framework_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v43 = v3;
            __int16 v44 = 2112;
            v45 = v18;
            _os_log_impl(&dword_21C797000, v19, OS_LOG_TYPE_DEFAULT, "Local url for language %@ is %@", buf, 0x16u);
          }

          if (v18)
          {
            int v20 = [v17 attributes];
            v21 = [v20 objectForKey:@"QuasarDir"];

            if (v21)
            {
              __int16 v22 = [v18 URLByAppendingPathComponent:v21];
              id v23 = [v22 URLByAppendingPathComponent:@"mini.json"];

              id v37 = v6;
              uint64_t v24 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v23 options:0 error:&v37];
              id v25 = v37;

              if (v24)
              {
                id v36 = v25;
                v26 = [MEMORY[0x263F08900] JSONObjectWithData:v24 options:0 error:&v36];
                id v6 = v36;

                if (v26)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v28 = vm_framework_log();
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_21C797000, v28, OS_LOG_TYPE_DEFAULT, "Found appropriate JSON object in asset", buf, 2u);
                    }

                    v29 = vm_framework_log();
                    CFTypeID v5 = v33;
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = v32;
                      id v43 = v26;
                      _os_log_impl(&dword_21C797000, v29, OS_LOG_TYPE_DEFAULT, "Found metadata for speech asset: %@", buf, 0xCu);
                    }
                    goto LABEL_42;
                  }
                }
                v27 = vm_framework_log();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  id v43 = v6;
                  __int16 v44 = 2112;
                  v45 = v26;
                  _os_log_error_impl(&dword_21C797000, v27, OS_LOG_TYPE_ERROR, "Did not find a JSON object in asset, error %@. Did find %@", buf, 0x16u);
                }

                id v3 = v34;
              }
              else
              {
                uint64_t v24 = vm_framework_log();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v32;
                  id v43 = v25;
                  _os_log_error_impl(&dword_21C797000, v24, OS_LOG_TYPE_ERROR, "Skipping asset, no JSON data found file error %@", buf, 0xCu);
                }
                id v6 = v25;
              }
            }
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v6 = 0;
    }

    CFTypeID v5 = v33;
  }
  v29 = vm_framework_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    +[VMConfiguration metadataDictionaryForSpeechAssetWithLanguage:](v29);
  }
  v26 = 0;
LABEL_42:

  id v30 = v26;
  return v30;
}

+ (void)confidenceThresholdFromAssetForKey:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C797000, a2, OS_LOG_TYPE_ERROR, "Confidence threshold failed a sanity check: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)metadataDictionaryForSpeechAssetWithLanguage:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21C797000, log, OS_LOG_TYPE_ERROR, "Could not find an appropriate asset metadata object", v1, 2u);
}

@end