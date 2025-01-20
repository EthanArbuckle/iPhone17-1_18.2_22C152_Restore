@interface _LTTextLanguageDetectionResult(Daemon)
+ (void)sendAnalytics:()Daemon isSupported:;
- (id)initWithDetectedLocales:()Daemon unknownLanguages:;
- (id)initWithScorer:()Daemon;
- (void)initWithDetectionCounts:()Daemon availableLocales:lowConfidenceLocales:strategy:;
@end

@implementation _LTTextLanguageDetectionResult(Daemon)

- (id)initWithDetectedLocales:()Daemon unknownLanguages:
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v34.receiver = a1;
  v34.super_class = (Class)&off_270C59BD0;
  id v8 = objc_msgSendSuper2(&v34, sel_init);
  if (v8)
  {
    v9 = (void *)[v6 copy];
    [v8 setLocaleDetectionCount:v9];

    id v28 = v7;
    v10 = (void *)[v7 copy];
    [v8 setUnsupportedLanguageCounts:v10];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v29 = v6;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v37 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      v14 = 0;
      unint64_t v15 = 0;
      uint64_t v16 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v11);
          }
          v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v19 = [v11 objectForKeyedSubscript:v18];
          unint64_t v20 = [v19 unsignedIntegerValue];

          if (v20 > v15)
          {
            id v21 = v18;

            v14 = v21;
            unint64_t v15 = v20;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v37 count:16];
      }
      while (v13);
    }
    else
    {
      v14 = 0;
    }

    [v8 setDominantLocale:v14];
    v22 = _LTOSLogLID();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = v22;
      v24 = [v8 dominantLocale];
      v25 = [v24 localeIdentifier];
      *(_DWORD *)buf = 138543362;
      v36 = v25;
      _os_log_impl(&dword_2600DC000, v23, OS_LOG_TYPE_INFO, "Detection result via detected locales: %{public}@", buf, 0xCu);
    }
    id v26 = v8;

    id v7 = v28;
    id v6 = v29;
  }

  return v8;
}

- (void)initWithDetectionCounts:()Daemon availableLocales:lowConfidenceLocales:strategy:
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v55 = a4;
  id v11 = a5;
  v63.receiver = a1;
  v63.super_class = (Class)&off_270C59BD0;
  id v12 = objc_msgSendSuper2(&v63, sel_init);
  uint64_t v13 = v12;
  if (v12)
  {
    uint64_t v50 = a6;
    v51 = v11;
    v52 = v12;
    v14 = [MEMORY[0x263F08760] set];
    unint64_t v15 = [MEMORY[0x263F08760] set];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id obj = [v10 allObjects];
    uint64_t v16 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      unint64_t v18 = 0;
      v56 = 0;
      uint64_t v54 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v60 != v54) {
            objc_enumerationMutation(obj);
          }
          unint64_t v20 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          id v21 = _LTLanguageCodeToSupportedLocale();
          id v22 = v10;
          unint64_t v23 = [v10 countForObject:v20];
          unint64_t v24 = v23;
          if (v23 > v18 || (v21 ? (BOOL v25 = v23 >= v18) : (BOOL v25 = 0), v25))
          {
            id v26 = v20;

            unint64_t v18 = v24;
            v56 = v26;
          }
          id v10 = v22;
          if (v21)
          {
            for (; v24; --v24)
              [v14 addObject:v21];
          }
          else
          {
            for (; v24; --v24)
              [v15 addObject:v20];
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
      }
      while (v17);
    }
    else
    {
      v56 = 0;
    }

    uint64_t v13 = v52;
    [v52 setLocaleDetectionCount:v14];
    [v52 setUnsupportedLanguageCounts:v15];
    v27 = v56;
    id v28 = _LTLanguageCodeToSupportedLocale();
    if (v50 == 2)
    {
      if ([v56 isEqualToString:@"en"])
      {
        id v29 = [v10 allObjects];
        v57[0] = MEMORY[0x263EF8330];
        v57[1] = 3221225472;
        v57[2] = __113___LTTextLanguageDetectionResult_Daemon__initWithDetectionCounts_availableLocales_lowConfidenceLocales_strategy___block_invoke;
        v57[3] = &unk_265548180;
        id v58 = v10;
        long long v30 = [v29 sortedArrayWithOptions:16 usingComparator:v57];

        if ((unint64_t)[v30 count] >= 2)
        {
          id v31 = v10;
          long long v32 = [v30 objectAtIndexedSubscript:1];
          int v33 = [v32 isEqualToString:@"hi"];

          if (v33)
          {
            objc_super v34 = _LTOSLogLID();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543618;
              v65 = @"en";
              __int16 v66 = 2114;
              v67 = @"hi";
              _os_log_impl(&dword_2600DC000, v34, OS_LOG_TYPE_INFO, "Overriding dominant language from %{public}@ to %{public}@", buf, 0x16u);
            }
            uint64_t v35 = _LTLanguageCodeToSupportedLocale();

            id v28 = (void *)v35;
          }
          id v10 = v31;
          v27 = v56;
        }
      }
      uint64_t v13 = v52;
    }
    id v11 = v51;
    [v13 setDominantLocale:v28];
    v36 = (void *)[v51 copy];
    [v13 setLowConfidenceLocales:v36];

    [(id)objc_opt_class() sendAnalytics:v27 isSupported:v28 != 0];
    if ([v51 count])
    {
      v37 = [v51 _ltCompactMap:&__block_literal_global_26];
      uint64_t v38 = _LTOSLogLID();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v39 = v38;
        v40 = [v13 dominantLocale];
        [v40 localeIdentifier];
        id v41 = v10;
        v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v65 = v42;
        __int16 v66 = 2114;
        v67 = v37;
        _os_log_impl(&dword_2600DC000, v39, OS_LOG_TYPE_INFO, "Detection result via detection counts: %{public}@; however there are low-confidence locales: %{public}@",
          buf,
          0x16u);

        id v10 = v41;
        v27 = v56;
      }
    }
    else
    {
      v43 = _LTOSLogLID();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v44 = v43;
        v45 = [v13 dominantLocale];
        [v45 localeIdentifier];
        id v46 = v10;
        v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v65 = v47;
        _os_log_impl(&dword_2600DC000, v44, OS_LOG_TYPE_INFO, "Detection result via detection counts: %{public}@", buf, 0xCu);

        id v10 = v46;
        v27 = v56;
      }
    }
    id v48 = v13;
  }
  return v13;
}

- (id)initWithScorer:()Daemon
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&off_270C59BD0;
  id v5 = objc_msgSendSuper2(&v16, sel_init);
  if (v5)
  {
    id v6 = [MEMORY[0x263F08760] set];
    [v5 setLocaleDetectionCount:v6];

    id v7 = [MEMORY[0x263F08760] set];
    [v5 setUnsupportedLanguageCounts:v7];

    id v8 = [v4 weightedLocale];
    [v5 setDominantLocale:v8];
    v9 = objc_opt_class();
    id v10 = [v8 languageCode];
    [v9 sendAnalytics:v10 isSupported:v8 != 0];

    id v11 = _LTOSLogLID();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = v11;
      uint64_t v13 = [v8 localeIdentifier];
      *(_DWORD *)buf = 138543362;
      unint64_t v18 = v13;
      _os_log_impl(&dword_2600DC000, v12, OS_LOG_TYPE_INFO, "Detection result via weighted locale: %{public}@", buf, 0xCu);
    }
    id v14 = v5;
  }
  return v5;
}

+ (void)sendAnalytics:()Daemon isSupported:
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

@end