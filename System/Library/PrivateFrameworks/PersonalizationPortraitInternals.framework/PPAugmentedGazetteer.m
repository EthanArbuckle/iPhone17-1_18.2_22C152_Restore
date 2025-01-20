@interface PPAugmentedGazetteer
+ (id)textForToken:(void *)a3 text:;
- (PPAugmentedGazetteer)init;
- (PPAugmentedGazetteer)initWithDatabaseAsset:(id)a3 gazetteerPath:(id)a4 contextPredictor:(id)a5;
- (id)metadataForName:(id)a3;
- (void)dealloc;
- (void)iterExtractionsForText:(id)a3 addEntity:(id)a4 addTopic:(id)a5 addLocation:(id)a6;
- (void)iterSentencesForText:(id)a3 block:(id)a4;
- (void)iterTokensForSentence:(id)a3 block:(id)a4;
@end

@implementation PPAugmentedGazetteer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextPredictor, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (void)iterTokensForSentence:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__PPAugmentedGazetteer_iterTokensForSentence_block___block_invoke;
  v11[3] = &unk_1E65D9048;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(_PASLock *)lock runWithLockAcquired:v11];
}

void __52__PPAugmentedGazetteer_iterTokensForSentence_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NLTaggerSetString();
  [*(id *)(a1 + 32) length];
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v4 = v3;
  NLTaggerEnumerateTokens();
  NLTaggerSetString();
}

void __52__PPAugmentedGazetteer_iterTokensForSentence_block___block_invoke_2(uint64_t a1, long long *a2, unsigned char *a3)
{
  id v6 = (void *)MEMORY[0x1CB79D060]();
  id v7 = *(void **)(a1 + 32);
  long long v11 = *a2;
  uint64_t v12 = *((void *)a2 + 2);
  v8 = +[PPAugmentedGazetteer textForToken:text:]((uint64_t)PPAugmentedGazetteer, (uint64_t *)&v11, v7);
  id v9 = (void *)NLTaggerCopyTagForCurrentToken();
  id v10 = [[PPToken alloc] initWithText:v8 tag:v9];
  LOBYTE(v11) = 0;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (a3 && (_BYTE)v11) {
    *a3 = 1;
  }
}

+ (id)textForToken:(void *)a3 text:
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v7 = *a2;
  uint64_t v6 = a2[1];
  v8 = (void *)MEMORY[0x1CB79D060](v5);
  id v9 = objc_msgSend(v4, "substringWithRange:", v7, v6);

  return v9;
}

- (void)iterSentencesForText:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__PPAugmentedGazetteer_iterSentencesForText_block___block_invoke;
  v11[3] = &unk_1E65D9048;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(_PASLock *)lock runWithLockAcquired:v11];
}

void __51__PPAugmentedGazetteer_iterSentencesForText_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 length];
  NLTokenizerSetString();
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  NLTokenizerEnumerateTokens();

  NLTokenizerSetString();
}

void __51__PPAugmentedGazetteer_iterSentencesForText_block___block_invoke_2(uint64_t a1, long long *a2, unsigned char *a3)
{
  char v12 = 0;
  if (a2)
  {
    id v6 = (void *)MEMORY[0x1CB79D060]();
    id v7 = *(void **)(a1 + 32);
    long long v10 = *a2;
    uint64_t v11 = *((void *)a2 + 2);
    v8 = +[PPAugmentedGazetteer textForToken:text:]((uint64_t)PPAugmentedGazetteer, (uint64_t *)&v10, v7);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if (a3)
    {
      if (v12) {
        *a3 = 1;
      }
    }
  }
  else
  {
    id v9 = pp_default_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_error_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_ERROR, "Nil pointer provided from sentence tokenizer.", (uint8_t *)&v10, 2u);
    }
  }
}

- (id)metadataForName:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  db = self->_db;
  id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"SELECT * FROM %s WHERE name = :name", "metadata");
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __40__PPAugmentedGazetteer_metadataForName___block_invoke;
  v15[3] = &unk_1E65DBA80;
  id v16 = v4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __40__PPAugmentedGazetteer_metadataForName___block_invoke_2;
  v13[3] = &unk_1E65DBB40;
  id v8 = v5;
  id v14 = v8;
  id v9 = v4;
  [(_PASSqliteDatabase *)db prepAndRunQuery:v7 onPrep:v15 onRow:v13 onError:&__block_literal_global_67];

  long long v10 = v14;
  id v11 = v8;

  return v11;
}

uint64_t __40__PPAugmentedGazetteer_metadataForName___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":name" toNSString:*(void *)(a1 + 32)];
}

uint64_t __40__PPAugmentedGazetteer_metadataForName___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PPAugmentedGazetteerMetadata alloc] initWithStatement:v3];

  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }
  id v5 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v5;
}

uint64_t __40__PPAugmentedGazetteer_metadataForName___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = pp_default_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_error_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_ERROR, "PPAugmentedGazetteer: error serializing from the database: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x1E4F93C08];
}

- (void)iterExtractionsForText:(id)a3 addEntity:(id)a4 addTopic:(id)a5 addLocation:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__PPAugmentedGazetteer_iterExtractionsForText_addEntity_addTopic_addLocation___block_invoke;
  v16[3] = &unk_1E65D8FD8;
  v16[4] = self;
  id v17 = v10;
  id v18 = v12;
  id v19 = v11;
  id v13 = v11;
  id v14 = v12;
  id v15 = v10;
  [(PPAugmentedGazetteer *)self iterSentencesForText:a3 block:v16];
}

void __78__PPAugmentedGazetteer_iterExtractionsForText_addEntity_addTopic_addLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  int v5 = objc_opt_new();
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __78__PPAugmentedGazetteer_iterExtractionsForText_addEntity_addTopic_addLocation___block_invoke_2;
  v23 = &unk_1E65D8FB0;
  id v24 = v4;
  id v6 = *(void **)(a1 + 32);
  id v26 = *(id *)(a1 + 40);
  id v27 = *(id *)(a1 + 48);
  id v25 = v5;
  id v7 = v5;
  id v8 = v4;
  [v6 iterTokensForSentence:v3 block:&v20];

  id v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "contextForSentence:", v7, v20, v21, v22, v23);
  uint64_t v11 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  id v13 = *(void **)(a1 + 48);
  id v12 = *(void **)(a1 + 56);
  id v14 = v8;
  id v15 = v9;
  id v16 = v10;
  id v17 = v12;
  id v18 = v13;
  if (v11 && [v14 count])
  {
    id v19 = *(void **)(v11 + 8);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __78__PPAugmentedGazetteer_addExtractions_context_addEntity_addTopic_addLocation___block_invoke;
    v28[3] = &unk_1E65D8F88;
    id v29 = v14;
    uint64_t v30 = v11;
    id v31 = v15;
    id v32 = v16;
    id v33 = v17;
    id v34 = v18;
    [v19 readTransaction:v28];
  }
}

void __78__PPAugmentedGazetteer_iterExtractionsForText_addEntity_addTopic_addLocation___block_invoke_2(void *a1, void *a2)
{
  id v20 = a2;
  id v3 = [v20 tag];
  int v4 = [v3 isEqualToString:@"EXTRACTION"];

  if (v4)
  {
    int v5 = (void *)a1[4];
    id v6 = [v20 text];
    [v5 addObject:v6];
  }
  else
  {
    id v7 = [v20 tag];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4F5C738]];

    if (v8)
    {
      uint64_t v9 = a1[6];
      id v6 = [v20 text];
      (*(void (**)(uint64_t, void *, uint64_t, void, uint64_t))(v9 + 16))(v9, v6, 1, 0, 2);
    }
    else
    {
      id v10 = [v20 tag];
      int v11 = [v10 isEqualToString:*MEMORY[0x1E4F5C740]];

      if (v11)
      {
        uint64_t v12 = a1[6];
        id v13 = [v20 text];
        (*(void (**)(uint64_t, void *, uint64_t, void, uint64_t))(v12 + 16))(v12, v13, 5, 0, 2);

        uint64_t v14 = a1[7];
        id v6 = [v20 text];
        (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v14 + 16))(v14, v6, 3, 2);
      }
      else
      {
        id v15 = [v20 tag];
        int v16 = [v15 isEqualToString:*MEMORY[0x1E4F5C730]];

        if (!v16) {
          goto LABEL_10;
        }
        uint64_t v17 = a1[6];
        id v6 = [v20 text];
        (*(void (**)(uint64_t, void *, uint64_t, void, uint64_t))(v17 + 16))(v17, v6, 2, 0, 2);
      }
    }
  }

LABEL_10:
  id v18 = (void *)a1[5];
  id v19 = [v20 text];
  [v18 addObject:v19];
}

void __78__PPAugmentedGazetteer_addExtractions_context_addEntity_addTopic_addLocation___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v18 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = v2;
        id v3 = *(void **)(*((void *)&v25 + 1) + 8 * v2);
        context = (void *)MEMORY[0x1CB79D060]();
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        int v4 = *(void **)(a1 + 40);
        int v5 = [v3 lowercaseString];
        id v6 = [v4 metadataForName:v5];

        uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v22;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v22 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * v10);
              uint64_t v12 = *(void **)(a1 + 48);
              if (v11)
              {
                [v12 probabilityForDomain:*(unsigned int *)(v11 + 12)];
                if (v13 >= *(double *)(v11 + 24))
                {
                  if (*(void *)(v11 + 32))
                  {
                    if (objc_msgSend(MEMORY[0x1E4F89E90], "categoryForDescription:")) {
                      id v14 = 0;
                    }
                    else {
                      id v14 = *(id *)(v11 + 32);
                    }
                    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
                    if (*(void *)(v11 + 40)) {
                      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
                    }
                  }
                  if (*(void *)(v11 + 16)) {
                    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
                  }
                  if (*(unsigned char *)(v11 + 8))
                  {
                    [MEMORY[0x1E4F89E48] categoryForDescription:*(void *)(v11 + 32)];
                    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
                  }
                }
              }
              else
              {
                [v12 probabilityForDomain:0];
              }
              ++v10;
            }
            while (v8 != v10);
            uint64_t v15 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
            uint64_t v8 = v15;
          }
          while (v15);
        }

        uint64_t v2 = v20 + 1;
      }
      while (v20 + 1 != v18);
      uint64_t v18 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v18);
  }
}

- (PPAugmentedGazetteer)initWithDatabaseAsset:(id)a3 gazetteerPath:(id)a4 contextPredictor:(id)a5
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PPAugmentedGazetteer;
  uint64_t v12 = [(PPAugmentedGazetteer *)&v27 init];
  double v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_db, a3);
    objc_storeStrong((id *)&v13->_contextPredictor, a5);
    id v14 = objc_opt_new();
    id v15 = v10;
    self;
    uint64_t v30 = *MEMORY[0x1E4F5C908];
    [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
    uint64_t v16 = *MEMORY[0x1E4F5C960];
    v28[0] = *MEMORY[0x1E4F5C930];
    v28[1] = v16;
    v29[0] = &unk_1F25694A0;
    v29[1] = MEMORY[0x1E4F1CC38];
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
    uint64_t v17 = NLTaggerCreate();
    id v18 = v15;
    self;
    uint64_t v31 = *MEMORY[0x1E4F5C7E0];
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v18];

    v32[0] = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];

    long long v21 = (const void *)NLGazetteerCreate();
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    long long v23 = Mutable;
    if (v21)
    {
      CFArrayAppendValue(Mutable, v21);
      NLTaggerSetGazetteers();
      CFRelease(v21);
    }
    else
    {
      NLTaggerSetGazetteers();
    }
    CFRelease(v23);
    v14[1] = v17;
    self;
    CFLocaleGetSystem();
    v14[2] = NLTokenizerCreate();
    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v14];
    lock = v13->_lock;
    v13->_lock = (_PASLock *)v24;
  }
  return v13;
}

- (PPAugmentedGazetteer)init
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = +[PPTrialWrapper sharedInstance];
  int v4 = [v3 filepathForFactor:@"AugmentedGazetteerMetadata.db" namespaceName:@"PERSONALIZATION_PORTRAIT_GLOBAL"];

  int v5 = +[PPTrialWrapper sharedInstance];
  id v6 = [v5 filepathForFactor:@"AugmentedGazetteer.dat" namespaceName:@"PERSONALIZATION_PORTRAIT_GLOBAL"];

  uint64_t v7 = pp_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = v6;
    __int16 v25 = 2112;
    long long v26 = v4;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPAugmentedGazetteer: initializing with gazetteer at %@ and database at %@", buf, 0x16u);
  }

  if (!v6)
  {
    uint64_t v12 = pp_default_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v20 = "PPAugmentedGazetteer: unable to get gazetteer path.";
LABEL_11:
      _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
    }
LABEL_12:
    id v19 = 0;
    goto LABEL_17;
  }
  if (!v4)
  {
    uint64_t v12 = pp_default_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v20 = "PPAugmentedGazetteer: unable to get SQL path.";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  id v8 = objc_alloc(MEMORY[0x1E4F93BA0]);
  id v9 = (void *)[[NSString alloc] initWithFormat:@"file://%@?immutable=1", v4];
  id v22 = 0;
  id v10 = objc_opt_new();
  id v11 = (void *)[v8 initWithFilename:v9 flags:1 error:&v22 errorHandler:v10];
  uint64_t v12 = v22;

  if (v11)
  {
    double v13 = [PPContextPredictor alloc];
    id v14 = (void *)MEMORY[0x1E4F89D60];
    id v15 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v16 = [v15 languageCode];
    uint64_t v17 = [v14 languageForLocaleIdentifier:v16];
    id v18 = [(PPContextPredictor *)v13 initWithLanguage:v17];

    self = [(PPAugmentedGazetteer *)self initWithDatabaseAsset:v11 gazetteerPath:v6 contextPredictor:v18];
    id v19 = self;
  }
  else
  {
    id v18 = pp_default_log_handle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = v12;
      _os_log_error_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_ERROR, "PPAugmentedGazetteer: unable to open database. %@", buf, 0xCu);
    }
    id v19 = 0;
  }

LABEL_17:
  return v19;
}

- (void)dealloc
{
  [(_PASLock *)self->_lock runWithLockAcquired:&__block_literal_global_17600];
  v3.receiver = self;
  v3.super_class = (Class)PPAugmentedGazetteer;
  [(PPAugmentedGazetteer *)&v3 dealloc];
}

uint64_t __31__PPAugmentedGazetteer_dealloc__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (const void *)a2[1];
  objc_super v3 = a2;
  CFRelease(v2);
  uint64_t v4 = v3[2];

  return MEMORY[0x1F4114168](v4);
}

@end