@interface PPSocialHighlightMLScorer
+ (id)_oneHotEncodeString:(id)a3 columns:(id)a4 prefix:(id)a5;
+ (id)_scorerFromModelFactorName:(id)a3;
+ (id)_singleItemMultiArrayValueWithConstantValue:(double)a3;
+ (id)clientEncodingForClientId:(id)a3 applicationIdentifiers:(id)a4;
+ (id)sharedFirstPassInstance;
+ (id)sharedTopKInstance;
+ (id)variantEncodingForVariant:(id)a3;
- (PPSocialHighlightMLScorer)initWithModel:(id)a3;
- (double)scoreSocialHighlight:(id)a3;
@end

@implementation PPSocialHighlightMLScorer

id __52__PPSocialHighlightMLScorer_sharedFirstPassInstance__block_invoke_2()
{
  return +[PPSocialHighlightMLScorer _scorerFromModelFactorName:@"social_highlights_scorer.mlmodelc"];
}

id __47__PPSocialHighlightMLScorer_sharedTopKInstance__block_invoke_2()
{
  return +[PPSocialHighlightMLScorer _scorerFromModelFactorName:@"social_highlights_top_k_scorer.mlmodelc"];
}

+ (id)_scorerFromModelFactorName:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[PPTrialWrapper sharedInstance];
  id v10 = 0;
  v5 = [v4 mlModelForModelName:v3 namespaceName:@"PERSONALIZATION_PORTRAIT_SOCIAL_HIGHLIGHT" error:&v10];

  id v6 = v10;
  if (!v5)
  {
    v7 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_error_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_ERROR, "PPSocialHighlightMLScorer: unable to fetch assets: %@", buf, 0xCu);
    }
  }
  v8 = [[PPSocialHighlightMLScorer alloc] initWithModel:v5];

  return v8;
}

- (PPSocialHighlightMLScorer)initWithModel:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPSocialHighlightMLScorer;
  id v6 = [(PPSocialHighlightMLScorer *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    uint64_t v8 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"SocialHighlightScorer-queue"];
    modelQueue = v7->_modelQueue;
    v7->_modelQueue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

+ (id)sharedTopKInstance
{
  if (sharedTopKInstance__pasOnceToken8 != -1) {
    dispatch_once(&sharedTopKInstance__pasOnceToken8, &__block_literal_global_77);
  }
  v2 = (void *)sharedTopKInstance__pasExprOnceResult;
  return (id)[v2 result];
}

+ (id)sharedFirstPassInstance
{
  if (sharedFirstPassInstance__pasOnceToken7 != -1) {
    dispatch_once(&sharedFirstPassInstance__pasOnceToken7, &__block_literal_global_6327);
  }
  v2 = (void *)sharedFirstPassInstance__pasExprOnceResult;
  return (id)[v2 result];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelQueue, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (double)scoreSocialHighlight:(id)a3
{
  id v4 = a3;
  id v5 = [v4 clientIdentifier];
  id v6 = [v4 applicationIdentifiers];
  v7 = +[PPSocialHighlightMLScorer clientEncodingForClientId:v5 applicationIdentifiers:v6];

  uint64_t v8 = [v4 variant];
  v9 = +[PPSocialHighlightMLScorer variantEncodingForVariant:v8];

  id v10 = v4;
  objc_super v11 = v10;
  if (v7)
  {
    objc_super v11 = [MEMORY[0x1E4F1E940] lazyProviderWithFeaturesProvidedBy:v7 addedToFeaturesProvidedBy:v10];
  }
  if (v9)
  {
    uint64_t v12 = [MEMORY[0x1E4F1E940] lazyProviderWithFeaturesProvidedBy:v9 addedToFeaturesProvidedBy:v11];

    objc_super v11 = (void *)v12;
  }
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__6265;
  v31 = __Block_byref_object_dispose__6266;
  id v32 = 0;
  modelQueue = self->_modelQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PPSocialHighlightMLScorer_scoreSocialHighlight___block_invoke;
  block[3] = &unk_1E65D9110;
  v26 = &v27;
  block[4] = self;
  id v14 = v11;
  id v25 = v14;
  dispatch_sync(modelQueue, block);
  v15 = (void *)v28[5];
  if (v15)
  {
    v16 = [v15 featureValueForName:@"score"];
    v17 = v16;
    if (v16)
    {
      v18 = [v16 multiArrayValue];
      v19 = [v18 objectAtIndexedSubscript:0];
      [v19 doubleValue];
      double v21 = v20;
    }
    else
    {
      v18 = pp_default_log_handle();
      double v21 = 0.0;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_fault_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_FAULT, "PPSocialHighlightMLScorer: invalid output keys, score not found", v23, 2u);
      }
    }
  }
  else
  {
    double v21 = 0.0;
  }

  _Block_object_dispose(&v27, 8);
  return v21;
}

void __50__PPSocialHighlightMLScorer_scoreSocialHighlight___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[5];
  id v3 = *(void **)(a1[4] + 8);
  id v9 = 0;
  uint64_t v4 = [v3 predictionFromFeatures:v2 error:&v9];
  id v5 = v9;
  uint64_t v6 = *(void *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v8 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_error_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_ERROR, "PPSocialHighlightMLScorer: unable to score: %@", buf, 0xCu);
    }
  }
}

+ (id)variantEncodingForVariant:(id)a3
{
  uint64_t v3 = variantEncodingForVariant___pasOnceToken21;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&variantEncodingForVariant___pasOnceToken21, &__block_literal_global_109);
  }
  id v5 = +[PPSocialHighlightMLScorer _oneHotEncodeString:v4 columns:variantEncodingForVariant___pasExprOnceResult prefix:@"variant"];

  return v5;
}

void __55__PPSocialHighlightMLScorer_variantEncodingForVariant___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  v1 = (void *)MEMORY[0x1CB79D060]();
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_msgSend(v2, "initWithObjects:", *MEMORY[0x1E4F8A198], *MEMORY[0x1E4F8A190], 0);
  id v4 = (void *)variantEncodingForVariant___pasExprOnceResult;
  variantEncodingForVariant___pasExprOnceResult = v3;
}

+ (id)_oneHotEncodeString:(id)a3 columns:(id)a4 prefix:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v7 = a4;
  id v30 = a5;
  uint64_t v8 = (void *)MEMORY[0x1CB79D060]();
  id v32 = objc_opt_new();
  id v38 = 0;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1E9A8]) initWithShape:&unk_1F256A430 dataType:65600 error:&v38];
  id v10 = v38;
  if (v9)
  {
    [v9 setObject:&unk_1F256B1E0 atIndexedSubscript:0];
    id v11 = [objc_alloc(MEMORY[0x1E4F1E9A8]) initWithShape:&unk_1F256A448 dataType:65600 error:0];
    uint64_t v12 = v11;
    if (v11)
    {
      v26 = v10;
      uint64_t v29 = v8;
      [v11 setObject:&unk_1F256B1F0 atIndexedSubscript:0];
      v28 = v9;
      uint64_t v13 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:v9];
      uint64_t v27 = v12;
      id v14 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:v12];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v15 = v7;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v35 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v34 + 1) + 8 * i);
            if ([v31 isEqual:v20]) {
              double v21 = v13;
            }
            else {
              double v21 = v14;
            }
            v22 = (void *)[[NSString alloc] initWithFormat:@"%@_%@", v30, v20];
            [v32 setObject:v21 forKeyedSubscript:v22];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v17);
      }

      id v33 = v10;
      v23 = (void *)[objc_alloc(MEMORY[0x1E4F1E930]) initWithDictionary:v32 error:&v33];
      id v10 = v33;

      uint64_t v8 = v29;
      uint64_t v12 = v27;
      if (!v23)
      {
        v24 = pp_default_log_handle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v41 = v10;
          _os_log_fault_impl(&dword_1CA9A8000, v24, OS_LOG_TYPE_FAULT, "PPSocialHighlightMLScorer: unable to allocate one hot encoded feature provider. %@", buf, 0xCu);
        }
      }
      id v9 = v28;
    }
    else
    {
      uint64_t v13 = pp_social_highlights_log_handle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v10;
        _os_log_error_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_ERROR, "PPSocialHighlightMLScorer: unable to allocate multiarray: %@", buf, 0xCu);
      }
      v23 = 0;
    }
  }
  else
  {
    uint64_t v12 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v10;
      _os_log_error_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_ERROR, "PPSocialHighlightMLScorer: unable to allocate multiarray: %@", buf, 0xCu);
    }
    v23 = 0;
  }

  return v23;
}

+ (id)_singleItemMultiArrayValueWithConstantValue:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1CB79D060](a1, a2);
  id v11 = 0;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1E9A8]) initWithShape:&unk_1F256A418 dataType:65600 error:&v11];
  id v6 = v11;
  if (v5)
  {
    id v7 = [NSNumber numberWithDouble:a3];
    [v5 setObject:v7 atIndexedSubscript:0];

    uint64_t v8 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:v5];
  }
  else
  {
    id v9 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_error_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_ERROR, "PPSocialHighlightMLScorer: unable to allocate multiarray: %@", buf, 0xCu);
    }

    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)clientEncodingForClientId:(id)a3 applicationIdentifiers:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = (__CFString *)a3;
  id v6 = a4;
  if (clientEncodingForClientId_applicationIdentifiers___pasOnceToken11 != -1) {
    dispatch_once(&clientEncodingForClientId_applicationIdentifiers___pasOnceToken11, &__block_literal_global_83);
  }
  id v7 = (id)clientEncodingForClientId_applicationIdentifiers___pasExprOnceResult;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PPSocialHighlightMLScorer_clientEncodingForClientId_applicationIdentifiers___block_invoke_2;
  block[3] = &unk_1E65DBE30;
  id v8 = v7;
  id v22 = v8;
  if (clientEncodingForClientId_applicationIdentifiers___pasOnceToken12 != -1) {
    dispatch_once(&clientEncodingForClientId_applicationIdentifiers___pasOnceToken12, block);
  }
  id v9 = (id)clientEncodingForClientId_applicationIdentifiers___pasExprOnceResult_85;

  if (clientEncodingForClientId_applicationIdentifiers___pasOnceToken13 != -1) {
    dispatch_once(&clientEncodingForClientId_applicationIdentifiers___pasOnceToken13, &__block_literal_global_88_6312);
  }
  id v10 = (id)clientEncodingForClientId_applicationIdentifiers___pasExprOnceResult_86;
  if (v5)
  {
    if (([(__CFString *)v5 isEqualToString:*MEMORY[0x1E4F89FE0]] & 1) != 0
      || ([(__CFString *)v5 isEqualToString:*MEMORY[0x1E4F89FF0]] & 1) != 0
      || ([v8 containsObject:v5] & 1) == 0
      && +[PPSocialHighlightStorage entitlementStatusForClient:v5 applicationIdentifiers:v6] == 2)
    {

      id v5 = @"WebBrowser";
    }
    id v11 = [v9 dictionary];
    uint64_t v12 = (void *)[v11 mutableCopy];

    id v13 = (void *)[[NSString alloc] initWithFormat:@"%@_%@", @"client", v5];
    [v12 setObject:v10 forKeyedSubscript:v13];

    id v20 = 0;
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1E930]) initWithDictionary:v12 error:&v20];
    id v15 = v20;
    uint64_t v16 = v14;
    if (!v14)
    {
      v19 = pp_social_highlights_log_handle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v15;
        _os_log_error_impl(&dword_1CA9A8000, v19, OS_LOG_TYPE_ERROR, "PPSocialHighlightMLScorer: failed to allocate client dictionary, returning fallback to ensure content remains hidden. %@", buf, 0xCu);
      }

      uint64_t v16 = v9;
    }
    id v17 = v16;
  }
  else
  {
    id v17 = v9;
  }

  return v17;
}

void __78__PPSocialHighlightMLScorer_clientEncodingForClientId_applicationIdentifiers___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v3 = +[PPSocialHighlightMLScorer _oneHotEncodeString:0 columns:*(void *)(a1 + 32) prefix:@"client"];
  id v4 = (void *)clientEncodingForClientId_applicationIdentifiers___pasExprOnceResult_85;
  clientEncodingForClientId_applicationIdentifiers___pasExprOnceResult_85 = v3;
}

void __78__PPSocialHighlightMLScorer_clientEncodingForClientId_applicationIdentifiers___block_invoke_3()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = +[PPSocialHighlightMLScorer _singleItemMultiArrayValueWithConstantValue:1.0];
  id v2 = (void *)clientEncodingForClientId_applicationIdentifiers___pasExprOnceResult_86;
  clientEncodingForClientId_applicationIdentifiers___pasExprOnceResult_86 = v1;
}

void __78__PPSocialHighlightMLScorer_clientEncodingForClientId_applicationIdentifiers___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = (void *)MEMORY[0x1CB79D060]();
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_msgSend(v2, "initWithObjects:", *MEMORY[0x1E4F8A008], *MEMORY[0x1E4F8A018], *MEMORY[0x1E4F8A000], *MEMORY[0x1E4F89FE8], *MEMORY[0x1E4F89FF8], *MEMORY[0x1E4F8A038], @"WebBrowser", 0);
  id v4 = (void *)clientEncodingForClientId_applicationIdentifiers___pasExprOnceResult;
  clientEncodingForClientId_applicationIdentifiers___pasExprOnceResult = v3;
}

void __47__PPSocialHighlightMLScorer_sharedTopKInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F93B60]) initWithBlock:&__block_literal_global_79 idleTimeout:300.0];
  id v2 = (void *)sharedTopKInstance__pasExprOnceResult;
  sharedTopKInstance__pasExprOnceResult = v1;
}

void __52__PPSocialHighlightMLScorer_sharedFirstPassInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F93B60]) initWithBlock:&__block_literal_global_75 idleTimeout:300.0];
  id v2 = (void *)sharedFirstPassInstance__pasExprOnceResult;
  sharedFirstPassInstance__pasExprOnceResult = v1;
}

@end