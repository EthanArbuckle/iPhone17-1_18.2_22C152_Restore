@interface RKResponseCollection
+ (id)responsesForFixedPhrase:(id)a3 withLanguage:(id)a4;
+ (id)responsesForFullScreenMoments:(id)a3;
+ (id)speechActsForCategory:(unint64_t)a3 platform:(id)a4;
- (NSMutableDictionary)personalizersByLanguageID;
- (NSMutableDictionary)responseCatalog;
- (NSURL)dynamicDataURL;
- (RKDisplayStringsProvider)displayStringsProvider;
- (RKResponseCollection)initWithDynamicDataURL:(id)a3 displayStringsProvider:(id)a4;
- (id)cannedResponsesForCategory:(id)a3 withLanguage:(id)a4 options:(unint64_t)a5;
- (id)personalizerForLanguageID:(id)a3;
- (id)responsesForCategory:(unint64_t)a3 gender:(unint64_t)a4 maximumResponses:(unint64_t)a5 withLanguage:(id)a6 context:(id)a7 options:(unint64_t)a8;
- (id)standardResponsesByCategoryForLanguageIdentifier:(id)a3 andUsage:(id)a4;
- (void)dealloc;
- (void)flushDynamicData;
- (void)registerResponse:(id)a3 forMessage:(id)a4 withLanguage:(id)a5 context:(id)a6 effectiveDate:(id)a7;
- (void)resetRegisteredResponses;
- (void)setPersonalizersByLanguageID:(id)a3;
- (void)setResponseCatalog:(id)a3;
@end

@implementation RKResponseCollection

- (RKResponseCollection)initWithDynamicDataURL:(id)a3 displayStringsProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RKResponseCollection;
  v9 = [(RKResponseCollection *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dynamicDataURL, a3);
    objc_storeStrong((id *)&v10->_displayStringsProvider, a4);
    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    personalizersByLanguageID = v10->_personalizersByLanguageID;
    v10->_personalizersByLanguageID = (NSMutableDictionary *)v11;
  }
  return v10;
}

- (void)dealloc
{
  [(RKResponseCollection *)self flushDynamicData];
  responseCatalog = self->_responseCatalog;
  self->_responseCatalog = 0;

  personalizersByLanguageID = self->_personalizersByLanguageID;
  self->_personalizersByLanguageID = 0;

  v5.receiver = self;
  v5.super_class = (Class)RKResponseCollection;
  [(RKResponseCollection *)&v5 dealloc];
}

- (void)flushDynamicData
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [(RKResponseCollection *)self personalizersByLanguageID];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        v9 = [(RKResponseCollection *)self personalizersByLanguageID];
        v10 = [v9 objectForKey:v8];

        [v10 flushDynamicData];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)resetRegisteredResponses
{
  v3 = [(RKResponseCollection *)self personalizersByLanguageID];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(RKResponseCollection *)self personalizersByLanguageID];
    uint64_t v6 = [v5 allValues];
    uint64_t v7 = [v6 objectAtIndexedSubscript:0];

    uint64_t v8 = [v7 dynamicDataURL];
    +[RKPersistentPersonalizer removeAllDynamicModelsInDirectory:v8];
  }
  id v9 = [(RKResponseCollection *)self personalizersByLanguageID];
  [v9 removeAllObjects];
}

- (id)standardResponsesByCategoryForLanguageIdentifier:(id)a3 andUsage:(id)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263EFF960] canonicalLanguageIdentifierFromString:a3];
  uint64_t v8 = [(RKResponseCollection *)self responseCatalog];
  id v9 = [v8 objectForKeyedSubscript:v7];
  v10 = [v9 objectForKeyedSubscript:v6];

  if (!v10)
  {
    long long v11 = [(RKResponseCollection *)self responseCatalog];

    if (!v11)
    {
      long long v12 = [MEMORY[0x263EFF9A0] dictionary];
      [(RKResponseCollection *)self setResponseCatalog:v12];
    }
    long long v13 = [(RKResponseCollection *)self responseCatalog];
    long long v14 = [v13 objectForKeyedSubscript:v7];

    if (!v14)
    {
      v15 = [MEMORY[0x263EFF9A0] dictionary];
      uint64_t v16 = [(RKResponseCollection *)self responseCatalog];
      [v16 setObject:v15 forKeyedSubscript:v7];
    }
    v17 = [MEMORY[0x263EFF9A0] dictionary];
    v18 = [(RKResponseCollection *)self responseCatalog];
    [v18 objectForKeyedSubscript:v7];
    v19 = v46 = self;
    [v19 setObject:v17 forKeyedSubscript:v6];

    v20 = self;
    v21 = [(RKResponseCollection *)self responseCatalog];
    v22 = [v21 objectForKeyedSubscript:v7];
    v42 = [v22 objectForKeyedSubscript:v6];

    v23 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v7];
    v43 = [v23 objectForKey:*MEMORY[0x263EFF508]];

    id v41 = v6;
    id v24 = v6;
    v25 = [(RKResponseCollection *)self displayStringsProvider];
    v47 = v7;
    v26 = [v25 displayStringsForPlatform:v24 languageID:v7];

    if ([v26 count])
    {
      for (uint64_t i = 0; i != 46; ++i)
      {
        v28 = RKLinguisticCategoryToPreferenceKey(i);
        if (![v28 isEqualToString:@"Unknown"]
          || ([v43 isEqualToString:@"zh"] & 1) == 0
          && ([v43 isEqualToString:@"ja"] & 1) == 0)
        {
          v29 = [MEMORY[0x263EFF980] array];
          uint64_t v44 = i;
          v30 = [(id)objc_opt_class() speechActsForCategory:i platform:v24];
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          obuint64_t j = v30;
          uint64_t v31 = [v30 countByEnumeratingWithState:&v55 objects:v59 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v56;
            do
            {
              for (uint64_t j = 0; j != v32; ++j)
              {
                if (*(void *)v56 != v33) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v35 = *(void *)(*((void *)&v55 + 1) + 8 * j);
                v36 = [v26 objectForKeyedSubscript:v35];
                v48[0] = MEMORY[0x263EF8330];
                v48[1] = 3221225472;
                v48[2] = __82__RKResponseCollection_standardResponsesByCategoryForLanguageIdentifier_andUsage___block_invoke;
                v48[3] = &unk_2642D1EA0;
                id v49 = v24;
                uint64_t v50 = v35;
                v20 = v46;
                id v51 = v28;
                v52 = v46;
                id v53 = v47;
                id v54 = v29;
                [v36 enumerateObjectsUsingBlock:v48];
              }
              uint64_t v32 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
            }
            while (v32);
          }
          if ([v29 count]) {
            [v42 setObject:v29 forKey:v28];
          }

          uint64_t i = v44;
        }
      }
    }

    id v6 = v41;
    uint64_t v7 = v47;
    self = v20;
  }
  v37 = [(RKResponseCollection *)self responseCatalog];
  v38 = [v37 objectForKeyedSubscript:v7];
  v39 = [v38 objectForKeyedSubscript:v6];

  return v39;
}

void __82__RKResponseCollection_standardResponsesByCategoryForLanguageIdentifier_andUsage___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v18 = a2;
  if ([*(id *)(a1 + 32) isEqualToString:@"iOS"]
    && (int v7 = [*(id *)(a1 + 40) hasPrefix:@"YesNo"], a3 >= 2)
    && v7
    || [*(id *)(a1 + 32) isEqualToString:@"iOS"]
    && [*(id *)(a1 + 40) isEqualToString:@"Acknowledgment"]
    && (int v8 = [*(id *)(a1 + 48) isEqualToString:@"Unknown"], a3)
    && v8)
  {
    *a4 = 1;
  }
  else
  {
    id v9 = +[RKUtilities normalizeForPersonalization:v18];
    if (![*(id *)(a1 + 32) isEqualToString:@"iOS"]) {
      goto LABEL_14;
    }
    v10 = [*(id *)(a1 + 56) personalizerForLanguageID:*(void *)(a1 + 64)];
    long long v11 = [v10 headwordsForSynonym:v18];
    long long v12 = [v11 allKeys];
    int v13 = [v12 containsObject:v9];

    if (v13)
    {
      id v14 = v9;
    }
    else
    {
      v15 = [v11 allKeys];
      id v14 = [v15 objectAtIndexedSubscript:0];
    }
    if (!v14) {
LABEL_14:
    }
      id v14 = v18;
    uint64_t v16 = *(void **)(a1 + 72);
    v17 = [[_RKResponse alloc] initWithSpeechAct:*(void *)(a1 + 40) headword:v14 text:v18];
    [v16 addObject:v17];
  }
}

- (id)cannedResponsesForCategory:(id)a3 withLanguage:(id)a4 options:(unint64_t)a5
{
  __int16 v5 = a5;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = @"watchOS";
  if ((v5 & 0x100) == 0) {
    id v9 = @"iOS";
  }
  v10 = v9;
  long long v11 = [(RKResponseCollection *)self standardResponsesByCategoryForLanguageIdentifier:a4 andUsage:v10];
  long long v12 = [v11 objectForKeyedSubscript:v8];

  int v13 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v19, "type", (void)v22) != 4)
        {
          v20 = [v19 text];
          [v13 addObject:v20];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }

  return v13;
}

- (id)responsesForCategory:(unint64_t)a3 gender:(unint64_t)a4 maximumResponses:(unint64_t)a5 withLanguage:(id)a6 context:(id)a7 options:(unint64_t)a8
{
  __int16 v8 = a8;
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v12 = a6;
  id v13 = a7;
  id v14 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v12];
  long long v56 = [v14 languageCode];

  uint64_t v15 = @"watchOS";
  if ((v8 & 0x100) == 0) {
    uint64_t v15 = @"iOS";
  }
  uint64_t v16 = v15;
  uint64_t v17 = [MEMORY[0x263EFF980] array];
  uint64_t v18 = RKLinguisticCategoryToPreferenceKey(a3);
  v19 = [(RKResponseCollection *)self standardResponsesByCategoryForLanguageIdentifier:v12 andUsage:v16];
  id v53 = (void *)v18;
  v20 = [v19 objectForKeyedSubscript:v18];
  v21 = (void *)[v20 mutableCopy];

  long long v55 = v16;
  if ((v8 & 8) == 0 && ([(__CFString *)v16 isEqualToString:@"watchOS"] & 1) == 0)
  {
    long long v22 = [(RKResponseCollection *)self personalizerForLanguageID:v12];
    long long v23 = [MEMORY[0x263EFF980] array];
    v66[0] = MEMORY[0x263EF8330];
    v66[1] = 3221225472;
    v66[2] = __98__RKResponseCollection_responsesForCategory_gender_maximumResponses_withLanguage_context_options___block_invoke;
    v66[3] = &unk_2642D1F18;
    id v67 = v22;
    id v68 = v13;
    id v24 = v23;
    id v69 = v24;
    id v70 = v56;
    id v25 = v22;
    [v21 enumerateObjectsUsingBlock:v66];
    id v26 = v24;

    v21 = v26;
  }
  if (a5 != 0x7FFFFFFF)
  {
    id v51 = v13;
    id v52 = v12;
    uint64_t v27 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v21, "count"));
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v28 = v21;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v62 objects:v71 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      int v31 = 0;
      uint64_t v32 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v63 != v32) {
            objc_enumerationMutation(v28);
          }
          v34 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          BOOL v35 = [v34 type] == 4;
          if ((v35 & v31) == 1)
          {
            [v27 addObject:v34];
            int v31 = 1;
          }
          else
          {
            v31 |= v35;
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v62 objects:v71 count:16];
      }
      while (v30);
    }

    [v28 removeObjectsInArray:v27];
    id v13 = v51;
    id v12 = v52;
  }
  if ((v8 & 2) != 0)
  {
    if ((v8 & 4) != 0) {
      goto LABEL_20;
    }
  }
  else
  {
    v43 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"type == %ul", 1);
    uint64_t v44 = [v21 filteredArrayUsingPredicate:v43];
    [v17 addObjectsFromArray:v44];

    if ((v8 & 4) != 0)
    {
LABEL_20:
      if ((v8 & 0x10) != 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  v45 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"type == %ul", 2);
  v46 = [v21 filteredArrayUsingPredicate:v45];
  [v17 addObjectsFromArray:v46];

  if ((v8 & 0x10) == 0)
  {
LABEL_21:
    v36 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"type == %ul", 4);
    v37 = [v21 filteredArrayUsingPredicate:v36];
    [v17 addObjectsFromArray:v37];
  }
LABEL_22:
  if (responsesForCategory_gender_maximumResponses_withLanguage_context_options__onceToken != -1) {
    dispatch_once(&responsesForCategory_gender_maximumResponses_withLanguage_context_options__onceToken, &__block_literal_global_97);
  }
  [v17 sortUsingComparator:&__block_literal_global_100];
  if ([v17 count] > a5)
  {
    v38 = objc_msgSend(v17, "subarrayWithRange:", 0, a5);
    uint64_t v39 = [v38 mutableCopy];

    uint64_t v17 = (void *)v39;
  }
  [v17 sortUsingComparator:&__block_literal_global_102];
  v40 = [v17 valueForKeyPath:@"@unionOfObjects.text"];
  id v41 = (void *)[v40 mutableCopy];

  if (a4 > 7) {
    v42 = 0;
  }
  else {
    v42 = off_2642D2020[a4];
  }
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __98__RKResponseCollection_responsesForCategory_gender_maximumResponses_withLanguage_context_options___block_invoke_8;
  v58[3] = &unk_2642D1F60;
  unint64_t v61 = a4;
  v59 = v42;
  id v47 = v41;
  id v60 = v47;
  [v47 enumerateObjectsUsingBlock:v58];
  v48 = v60;
  id v49 = v47;

  return v49;
}

void __98__RKResponseCollection_responsesForCategory_gender_maximumResponses_withLanguage_context_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 headword];

  if (v4)
  {
    __int16 v5 = (void *)MEMORY[0x263EFF980];
    id v6 = *(void **)(a1 + 32);
    int v7 = [v3 speechAct];
    __int16 v8 = [v3 headword];
    id v9 = [v6 topSynonymsForSpeechAct:v7 headword:v8 recipientContext:*(void *)(a1 + 40) maxCount:20];
    v10 = [v5 arrayWithArray:v9];

    if (![v10 count])
    {
      long long v11 = [v3 headword];
      [v10 addObject:v11];
    }
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    uint64_t v27 = __98__RKResponseCollection_responsesForCategory_gender_maximumResponses_withLanguage_context_options___block_invoke_2;
    id v28 = &unk_2642D1EF0;
    id v29 = *(id *)(a1 + 48);
    id v12 = v10;
    id v30 = v12;
    [v12 enumerateObjectsWithOptions:2 usingBlock:&v25];
    if (objc_msgSend(v12, "count", v25, v26, v27, v28))
    {
      if (_block_invoke_onceToken != -1) {
        dispatch_once(&_block_invoke_onceToken, &__block_literal_global_90);
      }
      id v13 = [v12 objectAtIndexedSubscript:0];
      id v14 = [v12 objectAtIndexedSubscript:0];
      uint64_t v15 = [v14 lowercaseString];

      uint64_t v16 = [(id)_block_invoke_contractedResponseMap objectForKeyedSubscript:*(void *)(a1 + 56)];
      uint64_t v17 = [v16 objectForKeyedSubscript:v15];

      if (v17)
      {
        uint64_t v18 = [(id)_block_invoke_contractedResponseMap objectForKeyedSubscript:*(void *)(a1 + 56)];
        uint64_t v19 = [v18 objectForKeyedSubscript:v15];

        id v13 = (void *)v19;
      }
      v20 = *(void **)(a1 + 48);
      v21 = [_RKResponse alloc];
      long long v22 = [v3 speechAct];
      long long v23 = [v3 headword];
      id v24 = [(_RKResponse *)v21 initWithSpeechAct:v22 headword:v23 text:v13];
      [v20 addObject:v24];
    }
  }
}

void __98__RKResponseCollection_responsesForCategory_gender_maximumResponses_withLanguage_context_options___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v5 = +[RKUtilities normalizeForPersonalization:a2];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __98__RKResponseCollection_responsesForCategory_gender_maximumResponses_withLanguage_context_options___block_invoke_3;
  v8[3] = &unk_2642D1EC8;
  id v9 = v5;
  id v6 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = a3;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v8];
}

void __98__RKResponseCollection_responsesForCategory_gender_maximumResponses_withLanguage_context_options___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = [a2 text];
  __int16 v8 = +[RKUtilities normalizeForPersonalization:v7];
  uint64_t v9 = [v6 compare:v8];

  if (!v9)
  {
    [*(id *)(a1 + 40) removeObjectAtIndex:*(void *)(a1 + 48)];
    *a4 = 1;
  }
}

uint64_t __98__RKResponseCollection_responsesForCategory_gender_maximumResponses_withLanguage_context_options___block_invoke_4()
{
  _block_invoke_contractedResponseMap = +[RKAssets contractedResponses];

  return MEMORY[0x270F9A758]();
}

void __98__RKResponseCollection_responsesForCategory_gender_maximumResponses_withLanguage_context_options___block_invoke_5()
{
  for (uint64_t i = 0; i != 5; ++i)
    responsesForCategory_gender_maximumResponses_withLanguage_context_options__typePriorities[kTypePriorityOrder[i]] = i;
}

uint64_t __98__RKResponseCollection_responsesForCategory_gender_maximumResponses_withLanguage_context_options___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = responsesForCategory_gender_maximumResponses_withLanguage_context_options__typePriorities[[v4 type]];
  if (v6 >= responsesForCategory_gender_maximumResponses_withLanguage_context_options__typePriorities[[v5 type]])
  {
    int v8 = responsesForCategory_gender_maximumResponses_withLanguage_context_options__typePriorities[[v4 type]];
    uint64_t v7 = v8 > responsesForCategory_gender_maximumResponses_withLanguage_context_options__typePriorities[[v5 type]];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

uint64_t __98__RKResponseCollection_responsesForCategory_gender_maximumResponses_withLanguage_context_options___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 type];
  if (v6 >= [v5 type])
  {
    unint64_t v8 = [v4 type];
    uint64_t v7 = v8 > [v5 type];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

void __98__RKResponseCollection_responsesForCategory_gender_maximumResponses_withLanguage_context_options___block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (*(void *)(a1 + 48))
  {
    id v13 = v5;
    [v5 rangeOfString:@"{"];
    if (v7)
    {
      unint64_t v8 = [v13 componentsSeparatedByString:@"/"];
      uint64_t v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF ENDSWITH %@", *(void *)(a1 + 32)];
      id v10 = [v8 filteredArrayUsingPredicate:v9];

      uint64_t v11 = [v10 objectAtIndexedSubscript:0];
      uint64_t v12 = [v11 stringByReplacingOccurrencesOfString:*(void *)(a1 + 32) withString:&stru_26C8AEFC8];

      id v6 = (id)v12;
    }
    else
    {
      id v6 = v13;
    }
  }
  id v14 = v6;
  [*(id *)(a1 + 40) setObject:v6 atIndexedSubscript:a3];
}

+ (id)responsesForFixedPhrase:(id)a3 withLanguage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (responsesForFixedPhrase_withLanguage__onceToken != -1) {
    dispatch_once(&responsesForFixedPhrase_withLanguage__onceToken, &__block_literal_global_137);
  }
  uint64_t v7 = +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:v6];
  unint64_t v8 = [(id)responsesForFixedPhrase_withLanguage__sPhraseMap objectForKeyedSubscript:v7];

  if (!v8)
  {
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    [(id)responsesForFixedPhrase_withLanguage__sPhraseMap setObject:v9 forKeyedSubscript:v7];

    id v10 = +[RKAssets fixedPhrases];
    uint64_t v11 = [v10 objectForKeyedSubscript:v7];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __61__RKResponseCollection_responsesForFixedPhrase_withLanguage___block_invoke_2;
    v16[3] = &unk_2642D1F88;
    id v17 = v7;
    [v11 enumerateKeysAndObjectsUsingBlock:v16];
  }
  uint64_t v12 = +[RKUtilities normalizeForPersonalization:v5];

  id v13 = [(id)responsesForFixedPhrase_withLanguage__sPhraseMap objectForKeyedSubscript:v7];
  id v14 = [v13 objectForKeyedSubscript:v12];

  return v14;
}

uint64_t __61__RKResponseCollection_responsesForFixedPhrase_withLanguage___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF9A0] dictionary];
  v1 = (void *)responsesForFixedPhrase_withLanguage__sPhraseMap;
  responsesForFixedPhrase_withLanguage__sPhraseMap = v0;

  responsesForFixedPhrase_withLanguage__sNonEmptyStringsPredicate = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF != ''"];

  return MEMORY[0x270F9A758]();
}

void __61__RKResponseCollection_responsesForFixedPhrase_withLanguage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v16 = v6;
  obuint64_t j = [v6 componentsSeparatedByString:@"/"];
  uint64_t v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = [v7 length];
        if (v13)
        {
          id v3 = [v7 componentsSeparatedByString:@"/"];
          id v14 = v3;
        }
        else
        {
          id v14 = (void *)MEMORY[0x263EFFA68];
        }
        uint64_t v15 = [(id)responsesForFixedPhrase_withLanguage__sPhraseMap objectForKeyedSubscript:*(void *)(a1 + 32)];
        [v15 setObject:v14 forKeyedSubscript:v12];

        if (v13) {
      }
        }
      uint64_t v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
}

+ (id)responsesForFullScreenMoments:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F08708];
  id v5 = v4 = a3;
  id v6 = +[RKAssets momentsPhrases];
  id v7 = +[RKUtilities normalizeForPersonalization:v4];

  uint64_t v8 = [v7 componentsSeparatedByCharactersInSet:v5];
  uint64_t v9 = [v8 componentsJoinedByString:&stru_26C8AEFC8];

  uint64_t v10 = +[RKUtilities removeEmoji:v9];

  uint64_t v11 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  uint64_t v12 = [v10 stringByTrimmingCharactersInSet:v11];

  uint64_t v13 = [v6 objectForKeyedSubscript:v12];
  if (v13)
  {
    uint64_t v23 = v12;
    id v24 = v5;
    id v14 = objc_opt_new();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v22 = v13;
    obuint64_t j = v13;
    uint64_t v15 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          [v20 setObject:@"moment" forKeyedSubscript:@"type"];
          [v20 setObject:v19 forKeyedSubscript:@"subtype"];
          [v14 addObject:v20];
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v16);
    }

    id v5 = v24;
    uint64_t v13 = v22;
    uint64_t v12 = v23;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)registerResponse:(id)a3 forMessage:(id)a4 withLanguage:(id)a5 context:(id)a6 effectiveDate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ((unint64_t)[v13 length] <= 0x800)
  {
    uint64_t v17 = +[RKMessageClassifier messageClassification:v13 withLanguageIdentifier:v14];
    long long v18 = [MEMORY[0x263EFF960] canonicalLanguageIdentifierFromString:v14];
    uint64_t v19 = [v17 language];
    if (v19)
    {
      id v20 = (void *)v19;
      id v41 = v16;
      id v21 = v15;
      id v22 = v12;
      uint64_t v23 = self;
      id v24 = [v17 language];
      char v25 = [v24 isEqualToString:@"und"];

      if ((v25 & 1) == 0)
      {
        long long v26 = [v17 language];
        long long v27 = +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:v26];

        long long v28 = +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:v14];
        if (([v27 isEqualToString:v28] & 1) == 0)
        {
          uint64_t v29 = [v17 language];

          long long v18 = (void *)v29;
        }
        self = v23;
        id v12 = v22;
        id v15 = v21;
        id v16 = v41;

        if (!v18) {
          goto LABEL_16;
        }
        goto LABEL_10;
      }
      self = v23;
      id v12 = v22;
      id v15 = v21;
      id v16 = v41;
    }
    if (!v18)
    {
LABEL_16:

      goto LABEL_17;
    }
LABEL_10:
    if (+[RKSentenceClassifier canClassifyLanguageIdentifier:v18])
    {
      id v30 = [(RKResponseCollection *)self personalizerForLanguageID:v18];
      uint64_t v31 = [v30 headwordsForSynonym:v12];
      v42 = v30;
      if (![v31 count])
      {
        [v30 headwordsForSynonymPrefix:v12];
        id v32 = v16;
        id v33 = v15;
        id v34 = v12;
        v36 = BOOL v35 = self;

        uint64_t v31 = (void *)v36;
        self = v35;
        id v12 = v34;
        id v15 = v33;
        id v16 = v32;
        id v30 = v42;
      }
      if ([v31 count])
      {
        v37 = [(RKResponseCollection *)self displayStringsProvider];
        v40 = [v37 displayStringsForPlatform:@"watchOS" languageID:v18];

        v38 = objc_msgSend((id)objc_opt_class(), "speechActsForCategory:platform:", objc_msgSend(v17, "sentenceType"), @"watchOS");
        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __87__RKResponseCollection_registerResponse_forMessage_withLanguage_context_effectiveDate___block_invoke;
        v43[3] = &unk_2642D2000;
        id v44 = v40;
        id v45 = v31;
        id v46 = v42;
        id v47 = v15;
        id v48 = v16;
        id v39 = v40;
        [v38 enumerateObjectsUsingBlock:v43];

        id v30 = v42;
      }
    }
    goto LABEL_16;
  }
LABEL_17:
}

void __87__RKResponseCollection_registerResponse_forMessage_withLanguage_context_effectiveDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __87__RKResponseCollection_registerResponse_forMessage_withLanguage_context_effectiveDate___block_invoke_2;
  v11[3] = &unk_2642D1FD8;
  id v12 = v7;
  uint64_t v8 = *(void **)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v14 = v6;
  id v15 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 64);
  uint64_t v17 = a4;
  id v9 = v6;
  id v10 = v7;
  [v8 enumerateKeysAndObjectsUsingBlock:v11];
}

void __87__RKResponseCollection_registerResponse_forMessage_withLanguage_context_effectiveDate___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  uint64_t v8 = +[RKUtilities normalizeForPersonalization:a2];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __87__RKResponseCollection_registerResponse_forMessage_withLanguage_context_effectiveDate___block_invoke_3;
  v12[3] = &unk_2642D1FB0;
  id v13 = v8;
  id v9 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  id v16 = v7;
  id v17 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 64);
  uint64_t v19 = a4;
  uint64_t v20 = *(void *)(a1 + 72);
  id v10 = v7;
  id v11 = v8;
  [v9 enumerateObjectsUsingBlock:v12];
}

void __87__RKResponseCollection_registerResponse_forMessage_withLanguage_context_effectiveDate___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v7 = +[RKUtilities normalizeForPersonalization:a2];
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:"))
  {
    [*(id *)(a1 + 40) trainSynonymForSpeechAct:*(void *)(a1 + 48) headword:v7 userResponse:*(void *)(a1 + 56) recipientContext:*(void *)(a1 + 64) weight:1 effectiveDate:*(void *)(a1 + 72)];
    *a4 = 1;
    id v6 = *(unsigned char **)(a1 + 88);
    **(unsigned char **)(a1 + 80) = 1;
    *id v6 = 1;
  }
}

- (id)personalizerForLanguageID:(id)a3
{
  id v4 = a3;
  id v5 = +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:v4];
  id v6 = [(RKResponseCollection *)self personalizersByLanguageID];
  id v7 = [v6 objectForKeyedSubscript:v5];

  if (!v7)
  {
    uint64_t v8 = [RKPersistentPersonalizer alloc];
    id v9 = [(RKResponseCollection *)self dynamicDataURL];
    id v10 = [(RKResponseCollection *)self displayStringsProvider];
    id v11 = [(RKPersistentPersonalizer *)v8 initWithLanguageIdentifier:v4 andDynamicDataURL:v9 displayStringsProvider:v10];
    id v12 = [(RKResponseCollection *)self personalizersByLanguageID];
    [v12 setObject:v11 forKeyedSubscript:v5];
  }
  id v13 = [(RKResponseCollection *)self personalizersByLanguageID];
  id v14 = [v13 objectForKeyedSubscript:v5];

  return v14;
}

+ (id)speechActsForCategory:(unint64_t)a3 platform:(id)a4
{
  uint64_t v5 = speechActsForCategory_platform__onceToken;
  id v6 = a4;
  if (v5 != -1) {
    dispatch_once(&speechActsForCategory_platform__onceToken, &__block_literal_global_161);
  }
  id v7 = RKLinguisticCategoryToPreferenceKey(a3);
  uint64_t v8 = [(id)speechActsForCategory_platform__sSpeechActsByPlatformByCategory objectForKeyedSubscript:v6];

  id v9 = [v8 objectForKeyedSubscript:v7];

  return v9;
}

void __55__RKResponseCollection_speechActsForCategory_platform___block_invoke()
{
  uint64_t v0 = (void *)speechActsForCategory_platform__sSpeechActsByPlatformByCategory;
  speechActsForCategory_platform__sSpeechActsByPlatformByCategory = (uint64_t)&unk_26C8EFAE8;
}

- (NSMutableDictionary)responseCatalog
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResponseCatalog:(id)a3
{
}

- (NSMutableDictionary)personalizersByLanguageID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPersonalizersByLanguageID:(id)a3
{
}

- (NSURL)dynamicDataURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (RKDisplayStringsProvider)displayStringsProvider
{
  return (RKDisplayStringsProvider *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayStringsProvider, 0);
  objc_storeStrong((id *)&self->_dynamicDataURL, 0);
  objc_storeStrong((id *)&self->_personalizersByLanguageID, 0);

  objc_storeStrong((id *)&self->_responseCatalog, 0);
}

@end