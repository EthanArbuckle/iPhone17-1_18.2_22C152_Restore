@interface RKPersistentPersonalizer
+ (id)nonEmptyStringsPredicate;
+ (void)removeAllDynamicModelsInDirectory:(id)a3;
- (NSDate)lastDynamicDataCreationCheckDate;
- (NSDate)lastObservedDynamicDataCreationDate;
- (NSLocale)languageLocale;
- (NSMutableDictionary)synonyms;
- (NSString)languageID;
- (NSURL)dynamicDataURL;
- (RKPersistentPersonalizer)init;
- (RKPersistentPersonalizer)initWithLanguageIdentifier:(id)a3 andDynamicDataURL:(id)a4 displayStringsProvider:(id)a5;
- (id)dynamicDataCreationDate;
- (id)headwordsForSynonym:(id)a3;
- (id)headwordsForSynonymPrefix:(id)a3;
- (id)topSynonymsForSpeechAct:(id)a3 headword:(id)a4 recipientContext:(id)a5 maxCount:(unint64_t)a6;
- (void)createLanguageModel;
- (void)dealloc;
- (void)flushDynamicData;
- (void)initializeDynamicLanguageModel;
- (void)model;
- (void)setDynamicDataURL:(id)a3;
- (void)setLanguageID:(id)a3;
- (void)setLanguageLocale:(id)a3;
- (void)setLastDynamicDataCreationCheckDate:(id)a3;
- (void)setLastObservedDynamicDataCreationDate:(id)a3;
- (void)setSynonyms:(id)a3;
- (void)trainSynonymForSpeechAct:(id)a3 headword:(id)a4 userResponse:(id)a5 recipientContext:(id)a6 weight:(unint64_t)a7 effectiveDate:(id)a8;
@end

@implementation RKPersistentPersonalizer

+ (id)nonEmptyStringsPredicate
{
  if (nonEmptyStringsPredicate_onceToken != -1) {
    dispatch_once(&nonEmptyStringsPredicate_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)nonEmptyStringsPredicate_sNonEmptyStringsPredicate;

  return v2;
}

uint64_t __52__RKPersistentPersonalizer_nonEmptyStringsPredicate__block_invoke()
{
  nonEmptyStringsPredicate_sNonEmptyStringsPredicate = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF != ''"];

  return MEMORY[0x270F9A758]();
}

- (RKPersistentPersonalizer)init
{
  return self;
}

- (RKPersistentPersonalizer)initWithLanguageIdentifier:(id)a3 andDynamicDataURL:(id)a4 displayStringsProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)RKPersistentPersonalizer;
  v12 = [(RKPersistentPersonalizer *)&v30 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_languageID, a3);
    uint64_t v14 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v9];
    languageLocale = v13->_languageLocale;
    v13->_languageLocale = (NSLocale *)v14;

    p_dynamicDataURL = (void **)&v13->_dynamicDataURL;
    objc_storeStrong((id *)&v13->_dynamicDataURL, a4);
    if (!v13->_dynamicDataURL)
    {
      v17 = NSHomeDirectory();
      v18 = [v17 stringByAppendingPathComponent:@"Library/ResponseKit"];

      uint64_t v19 = [NSURL fileURLWithPath:v18 isDirectory:1];
      v20 = *p_dynamicDataURL;
      *p_dynamicDataURL = (void *)v19;
    }
    objc_storeStrong((id *)&v13->_displayStringsProvider, a5);
    v13->_model = [(RKPersistentPersonalizer *)v13 createLanguageModel];
    v21 = [(RKPersistentPersonalizer *)v13 dynamicDataCreationDate];
    objc_storeWeak((id *)&v13->_lastObservedDynamicDataCreationDate, v21);

    v22 = [MEMORY[0x263EFF910] date];
    objc_storeWeak((id *)&v13->_lastDynamicDataCreationCheckDate, v22);

    if (!v13->_model)
    {
      v28 = 0;
      goto LABEL_10;
    }
    v23 = [(RKPersistentPersonalizer *)v13 languageID];
    v24 = +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:v23];

    v25 = +[RKAssets synonyms];
    uint64_t v26 = [v25 objectForKeyedSubscript:v24];
    synonyms = v13->_synonyms;
    v13->_synonyms = (NSMutableDictionary *)v26;

    if (LMLanguageModelDynamicModelIsEmpty()) {
      [(RKPersistentPersonalizer *)v13 initializeDynamicLanguageModel];
    }
  }
  v28 = v13;
LABEL_10:

  return v28;
}

- (id)dynamicDataCreationDate
{
  [(RKPersistentPersonalizer *)self model];
  v2 = (void *)LMLanguageModelCopyDynamicModelBundlePath();
  if (v2)
  {
    v3 = [MEMORY[0x263F08850] defaultManager];
    v4 = [v3 attributesOfItemAtPath:v2 error:0];

    v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F08008]];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)model
{
  v3 = [MEMORY[0x263EFF910] date];
  uint64_t v4 = [(RKPersistentPersonalizer *)self lastDynamicDataCreationCheckDate];
  if (!v4
    || (v5 = (void *)v4,
        [(RKPersistentPersonalizer *)self lastDynamicDataCreationCheckDate],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v3 timeIntervalSinceDate:v6],
        double v8 = v7,
        v6,
        v5,
        v8 > 3600.0))
  {
    [(RKPersistentPersonalizer *)self setLastDynamicDataCreationCheckDate:v3];
    id v9 = [(RKPersistentPersonalizer *)self dynamicDataCreationDate];
    if (v9)
    {
      id v10 = [(RKPersistentPersonalizer *)self lastObservedDynamicDataCreationDate];
      char v11 = [v9 isEqualToDate:v10];

      if ((v11 & 1) == 0)
      {
        if ([(RKPersistentPersonalizer *)self model])
        {
          LMLanguageModelRelease();
          self->_model = 0;
        }
        self->_model = [(RKPersistentPersonalizer *)self createLanguageModel];
        [(RKPersistentPersonalizer *)self setLastObservedDynamicDataCreationDate:v9];
      }
    }
    else
    {
      if ([(RKPersistentPersonalizer *)self model]) {
        LMLanguageModelRelease();
      }
      self->_model = 0;
    }
  }
  model = self->_model;

  return model;
}

- (void)initializeDynamicLanguageModel
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  p_displayStringsProvider = &self->_displayStringsProvider;
  displayStringsProvider = self->_displayStringsProvider;
  v5 = [(RKPersistentPersonalizer *)self languageID];
  v31 = [(RKDisplayStringsProvider *)displayStringsProvider displayStringsForPlatform:@"iOS" languageID:v5];

  v6 = *p_displayStringsProvider;
  double v7 = [(RKPersistentPersonalizer *)self languageID];
  v28 = [(RKDisplayStringsProvider *)v6 displayStringsForPlatform:@"watchOS" languageID:v7];

  double v8 = (void *)MEMORY[0x263EFFA08];
  id v9 = [v31 allKeys];
  id v10 = [v8 setWithArray:v9];
  char v11 = [v28 allKeys];
  v12 = [v10 setByAddingObjectsFromArray:v11];
  v13 = [v12 allObjects];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v13;
  uint64_t v32 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v32)
  {
    uint64_t v30 = *(void *)v49;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v49 != v30)
        {
          uint64_t v15 = v14;
          objc_enumerationMutation(obj);
          uint64_t v14 = v15;
        }
        uint64_t v33 = v14;
        uint64_t v16 = *(void *)(*((void *)&v48 + 1) + 8 * v14);
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        objc_msgSend(v31, "objectForKeyedSubscript:", v16, v28);
        id v34 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = [v34 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v45 != v18) {
                objc_enumerationMutation(v34);
              }
              uint64_t v20 = *(void *)(*((void *)&v44 + 1) + 8 * i);
              v21 = +[RKUtilities normalizeForPersonalization:v20];
              v22 = [(RKPersistentPersonalizer *)self headwordsForSynonym:v20];
              uint64_t v38 = 0;
              v39 = &v38;
              uint64_t v40 = 0x3032000000;
              v41 = __Block_byref_object_copy__0;
              v42 = __Block_byref_object_dispose__0;
              id v43 = 0;
              v35[0] = MEMORY[0x263EF8330];
              v35[1] = 3221225472;
              v35[2] = __58__RKPersistentPersonalizer_initializeDynamicLanguageModel__block_invoke;
              v35[3] = &unk_2642D23E0;
              id v23 = v21;
              id v36 = v23;
              v37 = &v38;
              [v22 enumerateKeysAndObjectsUsingBlock:v35];
              uint64_t v24 = v39[5];
              if (v24) {
                goto LABEL_13;
              }
              v25 = [v22 allKeys];
              uint64_t v26 = [v25 objectAtIndexedSubscript:0];
              v27 = (void *)v39[5];
              v39[5] = v26;

              uint64_t v24 = v39[5];
              if (v24) {
LABEL_13:
              }
                [(RKPersistentPersonalizer *)self trainSynonymForSpeechAct:v16 headword:v24 userResponse:v20 recipientContext:0 weight:3 effectiveDate:0];

              _Block_object_dispose(&v38, 8);
            }
            uint64_t v17 = [v34 countByEnumeratingWithState:&v44 objects:v52 count:16];
          }
          while (v17);
        }

        uint64_t v14 = v33 + 1;
      }
      while (v33 + 1 != v32);
      uint64_t v32 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v32);
  }
}

void __58__RKPersistentPersonalizer_initializeDynamicLanguageModel__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  double v8 = *(void **)(a1 + 32);
  id v10 = v7;
  id v9 = +[RKUtilities normalizeForPersonalization:](RKUtilities, "normalizeForPersonalization:");
  LODWORD(v8) = [v8 isEqualToString:v9];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)trainSynonymForSpeechAct:(id)a3 headword:(id)a4 userResponse:(id)a5 recipientContext:(id)a6 weight:(unint64_t)a7 effectiveDate:(id)a8
{
  v35[3] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  [(RKPersistentPersonalizer *)self model];
  LMLanguageModelSetParameterValue();
  id v32 = v14;
  uint64_t v19 = [NSString stringWithFormat:@"A:%@", v14];
  v35[0] = v19;
  id v31 = v15;
  uint64_t v20 = [NSString stringWithFormat:@"H:%@", v15];
  v35[1] = v20;
  v35[2] = v16;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:3];

  v30[1] = v30;
  v22 = (char *)v30 - ((4 * [v21 count] + 15) & 0xFFFFFFFFFFFFFFF0);
  if ([v21 count])
  {
    unint64_t v23 = 0;
    do
    {
      *(_DWORD *)buf = 0;
      [(RKPersistentPersonalizer *)self model];
      uint64_t v24 = [v21 objectAtIndexedSubscript:v23];
      int TokenIDForString = LMLanguageModelGetTokenIDForString();

      *(_DWORD *)buf = TokenIDForString;
      if (!TokenIDForString)
      {
        [(RKPersistentPersonalizer *)self model];
        uint64_t v26 = [v21 objectAtIndexedSubscript:v23];
        LMLanguageModelAddTokenForString();

        int TokenIDForString = *(_DWORD *)buf;
      }
      *(_DWORD *)&v22[4 * v23++] = TokenIDForString;
    }
    while (v23 < [v21 count]);
  }
  [v18 timeIntervalSinceReferenceDate];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    uint64_t v27 = [v21 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v34 = v27;
    _os_log_impl(&dword_217E21000, &_os_log_internal, OS_LOG_TYPE_INFO, "updating dynamic lm with [%lu] candidate ngrams", buf, 0xCu);
  }
  if (a7)
  {
    uint64_t v28 = 0;
    do
    {
      if ([v21 count])
      {
        unint64_t v29 = 0;
        do
        {
          [(RKPersistentPersonalizer *)self model];
          if (v18) {
            LMLanguageModelIncrementUsageCountWithEffectiveTime();
          }
          else {
            LMLanguageModelIncrementUsageCount();
          }
          ++v29;
        }
        while (v29 < [v21 count]);
      }
      ++v28;
    }
    while (v28 != a7);
  }
}

- (id)topSynonymsForSpeechAct:(id)a3 headword:(id)a4 recipientContext:(id)a5 maxCount:(unint64_t)a6
{
  unint64_t v27 = a6;
  v36[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [MEMORY[0x263EFF980] array];
  [(RKPersistentPersonalizer *)self model];
  LMLanguageModelSetParameterValue();
  v13 = [NSString stringWithFormat:@"A:%@", v9];
  v36[0] = v13;
  id v14 = [NSString stringWithFormat:@"H:%@", v10];
  v36[1] = v14;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];

  uint64_t v28 = &v25;
  id v16 = (char *)&v25 - ((4 * [v15 count] + 15) & 0xFFFFFFFFFFFFFFF0);
  if (![v15 count]) {
    goto LABEL_5;
  }
  id v26 = v11;
  id v17 = v12;
  id v18 = v10;
  id v19 = v9;
  unint64_t v20 = 0;
  char v21 = 1;
  do
  {
    [(RKPersistentPersonalizer *)self model];
    v22 = [v15 objectAtIndexedSubscript:v20];
    int TokenIDForString = LMLanguageModelGetTokenIDForString();

    *(_DWORD *)&v16[4 * v20] = TokenIDForString;
    v21 &= TokenIDForString != 0;
    ++v20;
  }
  while (v20 < [v15 count]);
  id v9 = v19;
  id v10 = v18;
  v12 = v17;
  id v11 = v26;
  if (v21)
  {
LABEL_5:
    [(RKPersistentPersonalizer *)self model];
    [v15 count];
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    id v31 = __87__RKPersistentPersonalizer_topSynonymsForSpeechAct_headword_recipientContext_maxCount___block_invoke;
    id v32 = &unk_2642D2408;
    uint64_t v33 = self;
    id v34 = v12;
    unint64_t v35 = v27;
    LMLanguageModelEnumeratePredictionsWithBlock();
  }

  return v12;
}

void __87__RKPersistentPersonalizer_topSynonymsForSpeechAct_headword_recipientContext_maxCount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, BOOL *a5)
{
  [*(id *)(a1 + 32) model];
  id StringForTokenID = (id)LMLanguageModelCreateStringForTokenID();
  if (StringForTokenID) {
    [*(id *)(a1 + 40) addObject:StringForTokenID];
  }
  *a5 = (unint64_t)[*(id *)(a1 + 40) count] >= *(void *)(a1 + 48);
}

- (void)createLanguageModel
{
  v3 = (void *)MEMORY[0x263EFF960];
  uint64_t v4 = [(RKPersistentPersonalizer *)self languageID];
  v5 = [v3 localeWithLocaleIdentifier:v4];

  if (v5)
  {
    v6 = [MEMORY[0x263EFF9A0] dictionaryWithObject:v5 forKey:*MEMORY[0x263F512A8]];
    uint64_t v7 = MEMORY[0x263EFFA80];
    [v6 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F512D0]];
    [v6 setObject:v7 forKey:*MEMORY[0x263F512C8]];
    [v6 setObject:@"com.apple.MobileSMS" forKey:*MEMORY[0x263F51250]];
    double v8 = [(RKPersistentPersonalizer *)self dynamicDataURL];
    [v6 setObject:v8 forKey:*MEMORY[0x263F51260]];

    [v6 setObject:v7 forKey:*MEMORY[0x263F512A0]];
    id v9 = (void *)LMLanguageModelCreate();
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)dealloc
{
  if (self->_model)
  {
    LMLanguageModelRelease();
    self->_model = 0;
  }
  synonyms = self->_synonyms;
  self->_synonyms = 0;

  v4.receiver = self;
  v4.super_class = (Class)RKPersistentPersonalizer;
  [(RKPersistentPersonalizer *)&v4 dealloc];
}

- (id)headwordsForSynonym:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  unint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  unint64_t v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  if ([v4 length])
  {
    v5 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    v6 = [v4 componentsSeparatedByCharactersInSet:v5];
    uint64_t v7 = [(id)objc_opt_class() nonEmptyStringsPredicate];
    double v8 = [v6 filteredArrayUsingPredicate:v7];
    id v9 = [v8 componentsJoinedByString:@" "];

    id v10 = +[RKUtilities normalizeForPersonalization:v9];
    id v11 = [(RKPersistentPersonalizer *)self synonyms];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __48__RKPersistentPersonalizer_headwordsForSynonym___block_invoke;
    v15[3] = &unk_2642D2430;
    id v12 = v10;
    id v16 = v12;
    id v18 = &v19;
    id v4 = v9;
    id v17 = v4;
    [v11 enumerateKeysAndObjectsUsingBlock:v15];

    id v13 = (id)v20[5];
  }
  else
  {
    id v13 = 0;
  }
  _Block_object_dispose(&v19, 8);

  return v13;
}

void __48__RKPersistentPersonalizer_headwordsForSynonym___block_invoke(void *a1, void *a2, void *a3)
{
  id v9 = a2;
  if ([a3 containsObject:a1[4]])
  {
    v5 = *(void **)(*(void *)(a1[6] + 8) + 40);
    if (!v5)
    {
      uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
      uint64_t v7 = *(void *)(a1[6] + 8);
      double v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      v5 = *(void **)(*(void *)(a1[6] + 8) + 40);
    }
    [v5 setObject:a1[5] forKeyedSubscript:v9];
  }
}

- (id)headwordsForSynonymPrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08708];
  id v5 = a3;
  uint64_t v6 = [v4 whitespaceCharacterSet];
  uint64_t v7 = [v5 componentsSeparatedByCharactersInSet:v6];

  double v8 = [(id)objc_opt_class() nonEmptyStringsPredicate];
  id v9 = [v7 filteredArrayUsingPredicate:v8];
  id v10 = [v9 componentsJoinedByString:@" "];

  id v11 = [v10 componentsSeparatedByString:@" "];
  unint64_t v12 = [v11 count];
  if (v12 >= 4) {
    uint64_t v13 = 4;
  }
  else {
    uint64_t v13 = v12;
  }
  if (v13)
  {
    while (1)
    {
      id v14 = objc_msgSend(v11, "subarrayWithRange:", 0, v13);
      id v15 = [v14 componentsJoinedByString:@" "];

      id v16 = [MEMORY[0x263F08708] punctuationCharacterSet];
      id v17 = [v15 stringByTrimmingCharactersInSet:v16];

      id v18 = [(RKPersistentPersonalizer *)self headwordsForSynonym:v17];

      if (v18) {
        break;
      }
      if (!--v13) {
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    id v18 = 0;
  }

  return v18;
}

- (void)flushDynamicData
{
  v2 = [(RKPersistentPersonalizer *)self model];

  MEMORY[0x270F46B18](v2, 0);
}

+ (void)removeAllDynamicModelsInDirectory:(id)a3
{
}

- (NSURL)dynamicDataURL
{
  return self->_dynamicDataURL;
}

- (void)setDynamicDataURL:(id)a3
{
}

- (NSString)languageID
{
  return self->_languageID;
}

- (void)setLanguageID:(id)a3
{
}

- (NSLocale)languageLocale
{
  return self->_languageLocale;
}

- (void)setLanguageLocale:(id)a3
{
}

- (NSDate)lastObservedDynamicDataCreationDate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastObservedDynamicDataCreationDate);

  return (NSDate *)WeakRetained;
}

- (void)setLastObservedDynamicDataCreationDate:(id)a3
{
}

- (NSDate)lastDynamicDataCreationCheckDate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastDynamicDataCreationCheckDate);

  return (NSDate *)WeakRetained;
}

- (void)setLastDynamicDataCreationCheckDate:(id)a3
{
}

- (NSMutableDictionary)synonyms
{
  return self->_synonyms;
}

- (void)setSynonyms:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_destroyWeak((id *)&self->_lastDynamicDataCreationCheckDate);
  objc_destroyWeak((id *)&self->_lastObservedDynamicDataCreationDate);
  objc_storeStrong((id *)&self->_languageLocale, 0);
  objc_storeStrong((id *)&self->_languageID, 0);
  objc_storeStrong((id *)&self->_dynamicDataURL, 0);

  objc_storeStrong((id *)&self->_displayStringsProvider, 0);
}

@end