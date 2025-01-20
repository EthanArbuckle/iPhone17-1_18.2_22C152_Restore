@interface CRFormContentTypeKeywordBasedPredictor
+ (BOOL)_shouldPredictContentTypeForLabel:(id)a3 locale:(id)a4;
+ (id)_keywordMapForPriorityKeywords:(BOOL)a3;
+ (id)lookupLanguagesForLanguage:(id)a3;
+ (id)supportedLanguages;
+ (id)useKeywordTypes;
+ (unint64_t)_nonStructuralContentTypeFromType:(unint64_t)a3;
+ (unint64_t)predictContentTypeWithKeywordMatching:(id)a3 locale:(id)a4 keyword:(id *)a5 withPriorityKeywords:(BOOL)a6;
@end

@implementation CRFormContentTypeKeywordBasedPredictor

+ (id)supportedLanguages
{
  if (_MergedGlobals_10 != -1) {
    dispatch_once(&_MergedGlobals_10, &__block_literal_global_5);
  }
  [(id)qword_1EB58C8F8 addObject:@"unknown"];
  v2 = (void *)qword_1EB58C8F8;
  return v2;
}

void __60__CRFormContentTypeKeywordBasedPredictor_supportedLanguages__block_invoke()
{
  v15[13] = *MEMORY[0x1E4F143B8];
  v15[0] = @"de-DE";
  v15[1] = @"en-US";
  v15[2] = @"es-ES";
  v15[3] = @"fr-FR";
  v15[4] = @"it-IT";
  v15[5] = @"ja-JP";
  v15[6] = @"ko-KR";
  v15[7] = @"pt-BR";
  v15[8] = @"ru-RU";
  v15[9] = @"th-TH";
  v15[10] = @"uk-UA";
  v15[11] = @"vi-VT";
  v15[12] = @"zh-Hans";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:13];
  uint64_t v1 = objc_opt_new();
  v2 = (void *)qword_1EB58C8F8;
  qword_1EB58C8F8 = v1;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = v0;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:", *(void *)(*((void *)&v10 + 1) + 8 * v6), (void)v10);
        v8 = (void *)qword_1EB58C8F8;
        v9 = [v7 languageCode];
        [v8 addObject:v9];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  [(id)qword_1EB58C8F8 addObject:@"unknown"];
}

+ (id)lookupLanguagesForLanguage:(id)a3
{
  v13[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (!v3)
  {
    v7 = &unk_1F39333A0;
    goto LABEL_14;
  }
  if ([v3 isEqualToString:@"ja"])
  {
    v13[0] = v4;
    v13[1] = @"unknown";
    v13[2] = @"zh";
    v13[3] = @"en";
    uint64_t v5 = v13;
    uint64_t v6 = 4;
  }
  else
  {
    if (![v4 isEqualToString:@"uk"])
    {
      if ([v4 isEqualToString:@"ru"])
      {
        v11[0] = v4;
        v11[1] = @"en";
        v11[2] = @"unknown";
        uint64_t v5 = v11;
      }
      else
      {
        if ([v4 isEqualToString:@"fr"])
        {
          v10[0] = v4;
          v10[1] = @"es";
          v10[2] = @"it";
          v10[3] = @"unknown";
          v10[4] = @"en";
          uint64_t v5 = v10;
          uint64_t v6 = 5;
          goto LABEL_13;
        }
        v9[0] = v4;
        v9[1] = @"en";
        v9[2] = @"unknown";
        uint64_t v5 = v9;
      }
      uint64_t v6 = 3;
      goto LABEL_13;
    }
    v12[0] = v4;
    v12[1] = @"ru";
    v12[2] = @"unknown";
    v12[3] = @"en";
    v12[4] = @"de";
    v12[5] = @"es";
    uint64_t v5 = v12;
    v12[6] = @"fr";
    v12[7] = @"it";
    v12[8] = @"pt";
    uint64_t v6 = 9;
  }
LABEL_13:
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:v6];
LABEL_14:

  return v7;
}

+ (id)_keywordMapForPriorityKeywords:(BOOL)a3
{
  BOOL v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__CRFormContentTypeKeywordBasedPredictor__keywordMapForPriorityKeywords___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB58C900 != -1) {
    dispatch_once(&qword_1EB58C900, block);
  }
  uint64_t v4 = 3;
  if (v3) {
    uint64_t v4 = 4;
  }
  uint64_t v5 = (void *)_MergedGlobals_10[v4];
  return v5;
}

void __73__CRFormContentTypeKeywordBasedPredictor__keywordMapForPriorityKeywords___block_invoke(uint64_t a1)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = objc_opt_new();
  v2 = (void *)qword_1EB58C908;
  qword_1EB58C908 = v1;

  uint64_t v3 = objc_opt_new();
  uint64_t v4 = (void *)qword_1EB58C910;
  qword_1EB58C910 = v3;

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v65[0] = qword_1EB58C908;
  v65[1] = qword_1EB58C910;
  obuint64_t j = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];
  uint64_t v33 = [obj countByEnumeratingWithState:&v58 objects:v66 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v59 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        uint64_t v6 = [*(id *)(a1 + 32) supportedLanguages];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v54 objects:v64 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v55;
          do
          {
            for (uint64_t j = 0; j != v7; ++j)
            {
              if (*(void *)v55 != v8) {
                objc_enumerationMutation(v6);
              }
              uint64_t v10 = *(void *)(*((void *)&v54 + 1) + 8 * j);
              long long v11 = objc_opt_new();
              [v5 setObject:v11 forKeyedSubscript:v10];
            }
            uint64_t v7 = [v6 countByEnumeratingWithState:&v54 objects:v64 count:16];
          }
          while (v7);
        }

        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        getFormContentTypeMappings();
        id v37 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v42 = [v37 countByEnumeratingWithState:&v50 objects:v63 count:16];
        if (v42)
        {
          uint64_t v40 = *(void *)v51;
          do
          {
            for (uint64_t k = 0; k != v42; ++k)
            {
              if (*(void *)v51 != v40) {
                objc_enumerationMutation(v37);
              }
              long long v12 = *(void **)(*((void *)&v50 + 1) + 8 * k);
              long long v13 = [v12 objectForKeyedSubscript:@"locale"];
              v45 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v13];
              v14 = [*(id *)(a1 + 32) supportedLanguages];
              char v15 = [v14 containsObject:v13];

              if (v15)
              {
                v16 = [v12 objectForKeyedSubscript:@"type"];
                unint64_t v17 = +[CRFormContentTypeUtilities contentTypeFromString:v16];

                v18 = @"keywords";
                if (v5 == (void *)qword_1EB58C910) {
                  v18 = @"priorityKeywords";
                }
                v39 = v18;
                v19 = objc_msgSend(v12, "objectForKeyedSubscript:");
                if (v19)
                {
                  long long v48 = 0u;
                  long long v49 = 0u;
                  long long v46 = 0u;
                  long long v47 = 0u;
                  id v38 = v19;
                  id v44 = v19;
                  uint64_t v20 = [v44 countByEnumeratingWithState:&v46 objects:v62 count:16];
                  if (v20)
                  {
                    uint64_t v21 = *(void *)v47;
                    do
                    {
                      for (uint64_t m = 0; m != v20; ++m)
                      {
                        if (*(void *)v47 != v21) {
                          objc_enumerationMutation(v44);
                        }
                        v23 = *(void **)(*((void *)&v46 + 1) + 8 * m);
                        if (v45) {
                          objc_msgSend(v23, "lowercaseStringWithLocale:");
                        }
                        else {
                        v24 = [v23 lowercaseString];
                        }
                        v25 = [v5 objectForKeyedSubscript:v13];
                        v26 = [v25 allKeys];
                        char v27 = [v26 containsObject:v24];

                        if ((v27 & 1) == 0)
                        {
                          v28 = [MEMORY[0x1E4F1CA48] array];
                          v29 = [v5 objectForKeyedSubscript:v13];
                          [v29 setObject:v28 forKeyedSubscript:v24];
                        }
                        v30 = [v5 objectForKeyedSubscript:v13];
                        v31 = [v30 objectForKeyedSubscript:v24];
                        v32 = [NSNumber numberWithUnsignedInteger:v17];
                        [v31 addObject:v32];
                      }
                      uint64_t v20 = [v44 countByEnumeratingWithState:&v46 objects:v62 count:16];
                    }
                    while (v20);
                  }

                  v19 = v38;
                }
              }
            }
            uint64_t v42 = [v37 countByEnumeratingWithState:&v50 objects:v63 count:16];
          }
          while (v42);
        }
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v58 objects:v66 count:16];
    }
    while (v33);
  }
}

+ (id)useKeywordTypes
{
  if (qword_1EB58C920 != -1) {
    dispatch_once(&qword_1EB58C920, &__block_literal_global_59);
  }
  v2 = (void *)qword_1EB58C918;
  return v2;
}

void __57__CRFormContentTypeKeywordBasedPredictor_useKeywordTypes__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F39333B8];
  uint64_t v1 = (void *)qword_1EB58C918;
  qword_1EB58C918 = v0;
}

+ (unint64_t)predictContentTypeWithKeywordMatching:(id)a3 locale:(id)a4 keyword:(id *)a5 withPriorityKeywords:(BOOL)a6
{
  BOOL v6 = a6;
  v75[3] = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v56 = a4;
  if (qword_1EB58C928 != -1) {
    dispatch_once(&qword_1EB58C928, &__block_literal_global_84);
  }
  BOOL v50 = v6;
  uint64_t v8 = [a1 _keywordMapForPriorityKeywords:v6];
  uint64_t v9 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v56];
  long long v55 = (void *)v9;
  if (v9) {
    [v53 lowercaseStringWithLocale:v9];
  }
  else {
  long long v54 = [v53 lowercaseString];
  }
  uint64_t v10 = [v55 languageCode];
  long long v59 = v10;
  long long v11 = &stru_1F38EED68;
  if ([v10 isEqualToString:@"zh"])
  {
    long long v46 = &stru_1F38EED68;
    long long v12 = &qword_1EB58C938;
    int v13 = 1;
  }
  else
  {
    int v14 = [v10 isEqualToString:@"ja"];
    int v13 = v14;
    if (!v14) {
      long long v11 = @" ";
    }
    long long v46 = v11;
    long long v12 = &qword_1EB58C930;
    if (v14) {
      long long v12 = &qword_1EB58C938;
    }
  }
  char v15 = [v54 _crStringByReplacingCharactersInSet:*v12 withString:@" "];
  v75[0] = v15;
  uint64_t v16 = 8;
  if (v13) {
    uint64_t v16 = 9;
  }
  unint64_t v17 = [v54 _crStringByReplacingCharactersInSet:_MergedGlobals_10[v16] withString:&stru_1F38EED68];
  int v45 = v13;
  v75[1] = v17;
  v75[2] = v54;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:3];

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  obuint64_t j = v18;
  v19 = v59;
  uint64_t v44 = [obj countByEnumeratingWithState:&v68 objects:v74 count:16];
  if (v44)
  {
    uint64_t v49 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v69 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        uint64_t v21 = [a1 lookupLanguagesForLanguage:v19];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v64 objects:v73 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v65;
          while (2)
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v65 != v23) {
                objc_enumerationMutation(v21);
              }
              uint64_t v25 = *(void *)(*((void *)&v64 + 1) + 8 * j);
              v26 = [NSString stringWithFormat:@"^%@$", v20];
              char v27 = [v8 objectForKeyedSubscript:v25];
              v28 = [v27 objectForKey:v26];

              if (v28)
              {
                v41 = [v28 firstObject];
                unint64_t v40 = [v41 unsignedIntegerValue];

                if (a5) {
                  *a5 = v26;
                }
LABEL_61:

                goto LABEL_62;
              }
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v64 objects:v73 count:16];
            if (v22) {
              continue;
            }
            break;
          }
        }

        if (v45)
        {
          uint64_t v21 = [v20 _crArrayOfComposedCharacters];
          uint64_t v29 = 5;
        }
        else
        {
          uint64_t v21 = [v20 componentsSeparatedByString:@" "];
          uint64_t v29 = 6;
        }
        uint64_t v30 = [v21 count];
        if (v30 >= 1)
        {
          if (v30 >= v29) {
            uint64_t v31 = v29;
          }
          else {
            uint64_t v31 = v30;
          }
          uint64_t v47 = v31;
          do
          {
            for (uint64_t k = 0; k + v47 <= (unint64_t)[v21 count]; ++k)
            {
              int v32 = [v59 isEqualToString:@"ja"] ^ 1;
              if ((unint64_t)v47 > 2) {
                LOBYTE(v32) = 1;
              }
              if ((v32 & 1) != 0 || k + v47 == [v21 count])
              {
                uint64_t v33 = objc_msgSend(v21, "subarrayWithRange:", k, v47);
                v26 = [v33 componentsJoinedByString:v46];

                long long v62 = 0u;
                long long v63 = 0u;
                long long v60 = 0u;
                long long v61 = 0u;
                v28 = [a1 lookupLanguagesForLanguage:v59];
                uint64_t v34 = [v28 countByEnumeratingWithState:&v60 objects:v72 count:16];
                if (v34)
                {
                  uint64_t v35 = *(void *)v61;
                  while (2)
                  {
                    for (uint64_t m = 0; m != v34; ++m)
                    {
                      if (*(void *)v61 != v35) {
                        objc_enumerationMutation(v28);
                      }
                      id v37 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v60 + 1) + 8 * m)];
                      id v38 = [v37 objectForKey:v26];

                      if (v38)
                      {
                        uint64_t v42 = [v38 firstObject];
                        unint64_t v40 = [v42 unsignedIntegerValue];

                        if (a5) {
                          *a5 = v26;
                        }

                        goto LABEL_61;
                      }
                    }
                    uint64_t v34 = [v28 countByEnumeratingWithState:&v60 objects:v72 count:16];
                    if (v34) {
                      continue;
                    }
                    break;
                  }
                }
              }
            }
          }
          while (v47-- > 1);
        }

        v19 = v59;
      }
      uint64_t v44 = [obj countByEnumeratingWithState:&v68 objects:v74 count:16];
    }
    while (v44);
  }

  unint64_t v40 = !v50;
LABEL_62:

  return v40;
}

void __116__CRFormContentTypeKeywordBasedPredictor_predictContentTypeWithKeywordMatching_locale_keyword_withPriorityKeywords___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@":.,;-—_/()[]<>"];
  uint64_t v1 = (void *)qword_1EB58C930;
  qword_1EB58C930 = v0;

  uint64_t v2 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@":：.,;-—_()[]<>"];
  uint64_t v3 = (void *)qword_1EB58C938;
  qword_1EB58C938 = v2;
}

+ (BOOL)_shouldPredictContentTypeForLabel:(id)a3 locale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6
    || !+[CRImageReader languageIsChinese:v6]
    && !+[CRImageReader languageIsJapanese:v6]
    && !+[CRImageReader languageIsKorean:v6])
  {
    uint64_t v8 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v9 = [v5 componentsSeparatedByCharactersInSet:v8];
    unint64_t v10 = [v9 count];

    if (v10 > 0x10) {
      goto LABEL_6;
    }
LABEL_8:
    BOOL v7 = 1;
    goto LABEL_9;
  }
  if ((unint64_t)[v5 length] <= 0x10) {
    goto LABEL_8;
  }
LABEL_6:
  BOOL v7 = 0;
LABEL_9:

  return v7;
}

+ (unint64_t)_nonStructuralContentTypeFromType:(unint64_t)a3
{
  if (qword_1EB58C948 != -1) {
    dispatch_once(&qword_1EB58C948, &__block_literal_global_104);
  }
  uint64_t v4 = (void *)qword_1EB58C940;
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6) {
    a3 = [v6 unsignedIntegerValue];
  }

  return a3;
}

void __76__CRFormContentTypeKeywordBasedPredictor__nonStructuralContentTypeFromType___block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F3932DD0;
  v2[1] = &unk_1F3932E00;
  v3[0] = &unk_1F3932DE8;
  v3[1] = &unk_1F3932DE8;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  uint64_t v1 = (void *)qword_1EB58C940;
  qword_1EB58C940 = v0;
}

@end