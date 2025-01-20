@interface IILanguageDetection
+ (BOOL)_userIsMultilingual;
+ (id)_dominantLanguageTagFromTextWithMaxLength:(void *)a3 maxLength:(uint64_t)a4 minimumProbability:;
+ (id)_dominantLanguageTagFromTextWithMaxLength:(void *)a3 maxLength:(uint64_t)a4 minimumProbability:(uint64_t)a5 hints:(uint64_t)a6 hintsCount:;
+ (id)defaultLanguage;
+ (id)detectLanguageFromLanguageTags:(id)a3;
+ (id)detectLanguageFromText:(id)a3;
+ (id)detectLanguageFromTextHeuristically:(id)a3;
+ (id)detectLanguageFromTextHeuristicallyWithLanguages:(id)a3 languages:(id)a4 defaultLanguage:(id)a5;
+ (id)detectLanguageFromTextIfMultilingual:(id)a3;
+ (id)detectLanguageFromTextWithMaxLength:(id)a3 maxLength:(unint64_t)a4 minimumProbability:(double)a5;
+ (id)dominantLanguageTagFromLanguageTags:(id)a3;
+ (id)dominantLanguageTagFromText:(id)a3;
+ (id)languageForLocaleIdentifier:(id)a3;
+ (id)userLanguages;
+ (int)languageIdForLanguageString:(id)a3;
@end

@implementation IILanguageDetection

+ (id)dominantLanguageTagFromLanguageTags:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  self;
  [v3 count];
  if ([v3 count])
  {
    if ([v3 count] == 1)
    {
      id v4 = [v3 firstObject];
    }
    else
    {
      v5 = (void *)[objc_alloc(MEMORY[0x1E4F28BD0]) initWithArray:v3];
      if ([v5 count] == 1)
      {
        id v4 = [v3 firstObject];
      }
      else if ((unint64_t)[v5 count] <= 2)
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v6 = v5;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          v9 = 0;
          unint64_t v10 = 0;
          uint64_t v11 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v19 != v11) {
                objc_enumerationMutation(v6);
              }
              v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
              unint64_t v14 = objc_msgSend(v6, "countForObject:", v13, (void)v18);
              if (v14 >= v10)
              {
                unint64_t v15 = v14;
                id v16 = v13;

                v9 = v16;
                unint64_t v10 = v15;
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
          }
          while (v8);
        }
        else
        {
          v9 = 0;
          unint64_t v10 = 0;
        }

        if ((double)v10 / (double)(unint64_t)[v3 count] >= 0.6) {
          id v4 = v9;
        }
        else {
          id v4 = 0;
        }
      }
      else
      {
        id v4 = 0;
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)dominantLanguageTagFromText:(id)a3
{
  return +[IILanguageDetection _dominantLanguageTagFromTextWithMaxLength:maxLength:minimumProbability:](0.575, (uint64_t)IILanguageDetection, a3, 30);
}

+ (id)_dominantLanguageTagFromTextWithMaxLength:(void *)a3 maxLength:(uint64_t)a4 minimumProbability:
{
  id v6 = a3;
  self;
  uint64_t v7 = +[IILanguageDetection _dominantLanguageTagFromTextWithMaxLength:maxLength:minimumProbability:hints:hintsCount:](a1, (uint64_t)IILanguageDetection, v6, a4, 0, 0);

  return v7;
}

+ (id)_dominantLanguageTagFromTextWithMaxLength:(void *)a3 maxLength:(uint64_t)a4 minimumProbability:(uint64_t)a5 hints:(uint64_t)a6 hintsCount:
{
  id v10 = a3;
  self;
  if ([v10 length])
  {
    if (_dominantLanguageTagFromTextWithMaxLength_maxLength_minimumProbability_hints_hintsCount___pasOnceToken3 != -1) {
      dispatch_once(&_dominantLanguageTagFromTextWithMaxLength_maxLength_minimumProbability_hints_hintsCount___pasOnceToken3, &__block_literal_global_255);
    }
    uint64_t v11 = [(id)_dominantLanguageTagFromTextWithMaxLength_maxLength_minimumProbability_hints_hintsCount___pasExprOnceResult result];
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy_;
    v25 = __Block_byref_object_dispose_;
    id v26 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __111__IILanguageDetection__dominantLanguageTagFromTextWithMaxLength_maxLength_minimumProbability_hints_hintsCount___block_invoke_262;
    v14[3] = &unk_1E65E9780;
    uint64_t v17 = a5;
    uint64_t v18 = a6;
    uint64_t v19 = a4;
    double v20 = a1;
    id v15 = v10;
    id v16 = &v21;
    [v11 runWithLockAcquired:v14];
    id v12 = (id)v22[5];

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __111__IILanguageDetection__dominantLanguageTagFromTextWithMaxLength_maxLength_minimumProbability_hints_hintsCount___block_invoke_262(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1CB79E3D0]();
  if (*(void *)(a1 + 48) && *(void *)(a1 + 56)) {
    NLLanguageIdentifierSetLanguageHints();
  }
  CFStringGetLength(*(CFStringRef *)(a1 + 32));
  NLLanguageIdentifierConsumeString();
  NLLanguageIdentifierGetTopHypotheses();
  NLLanguageIdentifierReset();
  if (*(double *)(a1 + 72) > 0.0 || 0.0 + 0.1 >= 0.0)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
  else
  {
    self;
    id v6 = 0;
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

void __111__IILanguageDetection__dominantLanguageTagFromTextWithMaxLength_maxLength_minimumProbability_hints_hintsCount___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79E3D0]();
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F93B60]) initWithBlock:&__block_literal_global_259];
  v2 = (void *)_dominantLanguageTagFromTextWithMaxLength_maxLength_minimumProbability_hints_hintsCount___pasExprOnceResult;
  _dominantLanguageTagFromTextWithMaxLength_maxLength_minimumProbability_hints_hintsCount___pasExprOnceResult = v1;
}

id __111__IILanguageDetection__dominantLanguageTagFromTextWithMaxLength_maxLength_minimumProbability_hints_hintsCount___block_invoke_2()
{
  v0 = objc_opt_new();
  v0[1] = NLLanguageIdentifierCreate();
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v0];

  return v1;
}

+ (id)detectLanguageFromLanguageTags:(id)a3
{
  id v3 = [a1 dominantLanguageTagFromLanguageTags:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[IILanguageDetection defaultLanguage];
  }
  id v6 = v5;

  return v6;
}

+ (id)detectLanguageFromTextIfMultilingual:(id)a3
{
  id v3 = a3;
  if (+[IILanguageDetection _userIsMultilingual]()) {
    +[IILanguageDetection detectLanguageFromText:v3];
  }
  else {
  id v4 = +[IILanguageDetection defaultLanguage];
  }

  return v4;
}

+ (BOOL)_userIsMultilingual
{
  self;
  v0 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  BOOL v1 = (unint64_t)[v0 count] > 1;

  return v1;
}

+ (id)detectLanguageFromTextWithMaxLength:(id)a3 maxLength:(unint64_t)a4 minimumProbability:(double)a5
{
  id v5 = +[IILanguageDetection _dominantLanguageTagFromTextWithMaxLength:maxLength:minimumProbability:](a5, (uint64_t)IILanguageDetection, a3, a4);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[IILanguageDetection defaultLanguage];
  }
  uint64_t v8 = v7;

  return v8;
}

+ (id)detectLanguageFromTextHeuristicallyWithLanguages:(id)a3 languages:(id)a4 defaultLanguage:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 allObjects];
  uint64_t v11 = objc_msgSend(v10, "_pas_mappedArrayWithTransform:", &__block_literal_global_32);

  id v12 = v11;
  self;
  v13 = (float *)malloc_type_malloc(8 * [v12 count], 0x100004000313F17uLL);
  unint64_t v14 = [v12 count];
  if ([v12 count])
  {
    unint64_t v15 = 0;
    float v16 = 0.2 / (float)v14;
    uint64_t v17 = v13 + 1;
    do
    {
      uint64_t v18 = [v12 objectAtIndexedSubscript:v15];
      *((_DWORD *)v17 - 1) = [v18 intValue];

      *uint64_t v17 = v16;
      v17 += 2;
      ++v15;
    }
    while (v15 < [v12 count]);
  }

  uint64_t v19 = +[IILanguageDetection _dominantLanguageTagFromTextWithMaxLength:maxLength:minimumProbability:hints:hintsCount:](0.575, (uint64_t)IILanguageDetection, v7, 30, (uint64_t)v13, [v12 count]);
  double v20 = (void *)v19;
  if (v19) {
    uint64_t v21 = (void *)v19;
  }
  else {
    uint64_t v21 = v9;
  }
  id v22 = v21;

  if (![v22 length])
  {
    uint64_t v23 = +[IILanguageDetection _dominantLanguageTagFromTextWithMaxLength:maxLength:minimumProbability:hints:hintsCount:](0.75, (uint64_t)IILanguageDetection, v7, 500, (uint64_t)v13, [v12 count]);
    v24 = (void *)v23;
    if (v23) {
      v25 = (void *)v23;
    }
    else {
      v25 = v9;
    }
    id v26 = v25;

    id v22 = v26;
    if (!v26) {
      goto LABEL_15;
    }
LABEL_14:
    if ([v8 containsObject:v22]) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (v22) {
    goto LABEL_14;
  }
LABEL_15:
  id v27 = v9;

  id v22 = v27;
LABEL_16:
  free(v13);

  return v22;
}

uint64_t __98__IILanguageDetection_detectLanguageFromTextHeuristicallyWithLanguages_languages_defaultLanguage___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = NSNumber;
  uint64_t v3 = +[IILanguageDetection languageIdForLanguageString:a2];
  return [v2 numberWithInt:v3];
}

+ (id)detectLanguageFromTextHeuristically:(id)a3
{
  id v3 = a3;
  if (+[IILanguageDetection _userIsMultilingual]())
  {
    id v4 = +[IILanguageDetection userLanguages];
    id v5 = +[IILanguageDetection detectLanguageFromTextHeuristicallyWithLanguages:v3 languages:v4 defaultLanguage:0];
  }
  else
  {
    id v5 = +[IILanguageDetection defaultLanguage];
  }

  return v5;
}

+ (id)detectLanguageFromText:(id)a3
{
  id v3 = +[IILanguageDetection dominantLanguageTagFromText:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[IILanguageDetection defaultLanguage];
  }
  id v6 = v5;

  return v6;
}

+ (id)userLanguages
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 stringArrayForKey:@"AppleKeyboards"];
  self;
  id v4 = objc_opt_new();
  if (v3 && [v3 count])
  {
    uint64_t v19 = v2;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if (([v10 containsString:@"Emoji"] & 1) == 0
            && ([v10 containsString:@"emoji"] & 1) == 0)
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v10];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v7);
    }

    v2 = v19;
  }
  if (![v4 count])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v12 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:*(void *)(*((void *)&v20 + 1) + 8 * j)];
          [v4 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v14);
    }
  }
  return v4;
}

+ (id)defaultLanguage
{
  v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v3 = [v2 localeIdentifier];
  id v4 = +[IILanguageDetection languageForLocaleIdentifier:v3];

  return v4;
}

+ (int)languageIdForLanguageString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = 0;
  while (v4 == -4)
  {
LABEL_5:
    unint64_t v6 = v4 + 57;
    --v4;
    if (v6 <= 1)
    {
      int v7 = 1;
      goto LABEL_8;
    }
  }
  self;
  id v5 = off_1E65E97A0[v4 + 56];
  if (([v3 hasPrefix:v5] & 1) == 0)
  {

    goto LABEL_5;
  }
  int v7 = v4 + 58;

LABEL_8:
  return v7;
}

+ (id)languageForLocaleIdentifier:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = (void *)MEMORY[0x1CB79E3D0]();
  if (!v5)
  {
    uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, a1, @"IILanguageDetection.m", 59, @"Invalid parameter not satisfying: %@", @"localeIdentifier != nil" object file lineNumber description];
  }
  if ((unint64_t)[v5 length] > 1)
  {
    uint64_t v8 = [v5 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
    id v9 = [v8 componentsSeparatedByString:@"-"];
    id v10 = [v9 firstObject];
    uint64_t v11 = [v10 lowercaseString];

    id v12 = [v9 lastObject];
    uint64_t v13 = [v9 count];
    int v14 = [v11 isEqualToString:@"zh"];
    if (v13 == 1)
    {
      if (v14)
      {
        int v7 = @"zh-Hans";
LABEL_36:

        goto LABEL_37;
      }
    }
    else
    {
      if (v14)
      {
        uint64_t v15 = [v9 objectAtIndexedSubscript:1];
        char v16 = [v15 isEqualToString:@"Hans"];

        int v7 = @"zh-Hans";
        if ((v16 & 1) == 0)
        {
          uint64_t v17 = [v9 objectAtIndexedSubscript:1];
          char v18 = [v17 isEqualToString:@"Hant"];

          if (v18 & 1) != 0 || ([v12 isEqualToString:@"HK"])
          {
            int v7 = @"zh-Hant";
          }
          else
          {
            int v7 = @"zh-Hant";
            if (([v12 isEqualToString:@"MO"] & 1) == 0
              && ![v12 isEqualToString:@"TW"])
            {
              int v7 = @"zh-Hans";
            }
          }
        }
        goto LABEL_36;
      }
      if ([v11 isEqualToString:@"uz"])
      {
        uint64_t v19 = [v9 objectAtIndexedSubscript:1];
        char v20 = [v19 isEqualToString:@"Cyrl"];

        if (v20)
        {
          int v7 = @"uz";
          goto LABEL_36;
        }
        long long v21 = [v9 objectAtIndexedSubscript:1];
        char v22 = [v21 isEqualToString:@"Arab"];

        if (v22) {
          goto LABEL_19;
        }
        long long v23 = [v9 objectAtIndexedSubscript:1];
        char v24 = [v23 isEqualToString:@"Latn"];

        if ((v24 & 1) != 0
          || ([v12 isEqualToString:@"UZ"] & 1) != 0
          || ([v12 isEqualToString:@"AZ"] & 1) != 0)
        {
          int v7 = @"uz-Latn";
          goto LABEL_36;
        }
        if ([v12 isEqualToString:@"AF"])
        {
LABEL_19:
          int v7 = @"uz-Arab";
          goto LABEL_36;
        }
      }
      if ([v11 isEqualToString:@"sr"])
      {
        long long v25 = [v9 objectAtIndexedSubscript:1];
        char v26 = [v25 isEqualToString:@"Latn"];

        if (v26)
        {
          int v7 = @"sr-Latn";
          goto LABEL_36;
        }
      }
      if ([v11 isEqualToString:@"hi"])
      {
        long long v27 = [v9 objectAtIndexedSubscript:1];
        char v28 = [v27 isEqualToString:@"Latn"];

        if (v28)
        {
          int v7 = @"hi-Latn";
          goto LABEL_36;
        }
      }
    }
    int v7 = v11;
    goto LABEL_36;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v5;
    _os_log_fault_impl(&dword_1CABE8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Provided locale identifier (%@) is not a valid identifier", buf, 0xCu);
  }
  int v7 = (__CFString *)v5;
LABEL_37:

  return v7;
}

@end