@interface PPUniversalSearchSpotlightIndexScorer
- (PPUniversalSearchSpotlightIndexScorer)initWithLocalTopicStore:(id)a3;
- (double)computeSpotlightIndexTopicScoreComponentFromDocumentTopicVector:(id)a3;
- (double)computeSpotlightIndexTopicSubscoreFromPortraitExtractions:(id)a3;
- (id)topicAlgorithmWeights;
@end

@implementation PPUniversalSearchSpotlightIndexScorer

- (void).cxx_destruct
{
}

- (double)computeSpotlightIndexTopicScoreComponentFromDocumentTopicVector:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v6 = [v4 allKeys];
  v7 = (void *)[v5 initWithArray:v6];

  uint64_t v38 = 0;
  v39 = (double *)&v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__19466;
  v36[4] = __Block_byref_object_dispose__19467;
  id v37 = 0;
  id v37 = (id)objc_opt_new();
  v8 = [(_PASLazyPurgeableResult *)self->_cachedPortraitTopicScores result];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __105__PPUniversalSearchSpotlightIndexScorer_computeSpotlightIndexTopicScoreComponentFromDocumentTopicVector___block_invoke;
  v32[3] = &unk_1E65D9B40;
  v34 = &v38;
  id v9 = v7;
  id v33 = v9;
  v35 = v36;
  [v8 enumerateKeysAndObjectsUsingBlock:v32];

  double v10 = v39[3];
  v11 = [(PPUniversalSearchSpotlightIndexScorer *)self topicAlgorithmWeights];
  uint64_t v28 = 0;
  v29 = (double *)&v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v24 = 0;
  v25 = (double *)&v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __105__PPUniversalSearchSpotlightIndexScorer_computeSpotlightIndexTopicScoreComponentFromDocumentTopicVector___block_invoke_2;
  v19[3] = &unk_1E65D9B68;
  v21 = v36;
  id v12 = v11;
  id v20 = v12;
  v22 = &v24;
  v23 = &v28;
  [v4 enumerateKeysAndObjectsUsingBlock:v19];
  double v13 = v25[3];
  double v14 = 0.0;
  if (v13 != 0.0)
  {
    double v15 = sqrt(v10);
    if (v15 != 0.0)
    {
      double v16 = v29[3];
      v17 = pp_universal_search_log_handle();
      double v14 = v16 / sqrt(v13) / v15;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        double v43 = v14;
        _os_log_debug_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEBUG, "PPSpotlightScoring: spotlightQueryScore of %f", buf, 0xCu);
      }
    }
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v38, 8);

  return v14;
}

void __105__PPUniversalSearchSpotlightIndexScorer_computeSpotlightIndexTopicScoreComponentFromDocumentTopicVector___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  [v5 doubleValue];
  double v7 = v6;
  [v5 doubleValue];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + v7 * v8;
  if ([*(id *)(a1 + 32) containsObject:v9]) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v5 forKeyedSubscript:v9];
  }
}

void __105__PPUniversalSearchSpotlightIndexScorer_computeSpotlightIndexTopicScoreComponentFromDocumentTopicVector___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v13 = a3;
  id v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:a2];
  if (v5)
  {
    for (uint64_t i = 0; i != 12; ++i)
    {
      [v13 countForAlgorithm:i];
      double v8 = v7;
      id v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
      [v9 doubleValue];
      double v11 = v8 * v10;

      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 24)
                                                                  + v11 * v11;
      [v5 doubleValue];
      *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                              + 24)
                                                                  + v11 * v12;
    }
  }
}

- (double)computeSpotlightIndexTopicSubscoreFromPortraitExtractions:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v3;
  uint64_t v28 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v35;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v5;
        double v6 = *(void **)(*((void *)&v34 + 1) + 8 * v5);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        double v7 = [v6 topics];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v31 != v10) {
                objc_enumerationMutation(v7);
              }
              double v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              id v13 = [v12 item];
              double v14 = [v13 topicIdentifier];
              int v15 = [v14 hasPrefix:@"Q"];

              if (v15)
              {
                double v16 = [v12 item];
                v17 = [v16 topicIdentifier];
                v18 = [v4 objectForKeyedSubscript:v17];

                if (!v18)
                {
                  v18 = objc_opt_new();
                  v19 = [v12 item];
                  id v20 = [v19 topicIdentifier];
                  [v4 setObject:v18 forKeyedSubscript:v20];
                }
                uint64_t v21 = [v6 topicAlgorithm];
                [v12 score];
                objc_msgSend(v18, "addToCountForAlgorithm:value:", v21);
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v9);
        }

        uint64_t v5 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v28);
  }

  [(PPUniversalSearchSpotlightIndexScorer *)self computeSpotlightIndexTopicScoreComponentFromDocumentTopicVector:v4];
  double v23 = v22;

  return v23;
}

- (id)topicAlgorithmWeights
{
  v2 = objc_opt_new();
  uint64_t v3 = 12;
  do
  {
    [v2 addObject:&unk_1F2569860];
    --v3;
  }
  while (v3);
  return v2;
}

- (PPUniversalSearchSpotlightIndexScorer)initWithLocalTopicStore:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PPUniversalSearchSpotlightIndexScorer;
  double v6 = [(PPUniversalSearchSpotlightIndexScorer *)&v14 init];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F93B60]);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__PPUniversalSearchSpotlightIndexScorer_initWithLocalTopicStore___block_invoke;
    v11[3] = &unk_1E65D9B18;
    id v12 = v5;
    SEL v13 = a2;
    uint64_t v8 = [v7 initWithBlock:v11];
    cachedPortraitTopicScores = v6->_cachedPortraitTopicScores;
    v6->_cachedPortraitTopicScores = (_PASLazyPurgeableResult *)v8;
  }
  return v6;
}

id __65__PPUniversalSearchSpotlightIndexScorer_initWithLocalTopicStore___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) cachedTopicScores];
  if (!v2)
  {
    uint64_t v3 = pp_universal_search_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138412290;
      int v15 = v4;
      _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_DEFAULT, "Failed to read topic cache in %@.  Forcing regeneration", buf, 0xCu);
    }
    id v5 = *(void **)(a1 + 32);
    id v13 = 0;
    char v6 = [v5 computeAndCacheTopicScores:&v13];
    id v7 = v13;
    if ((v6 & 1) == 0)
    {
      uint64_t v8 = pp_universal_search_log_handle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        double v11 = NSStringFromSelector(*(SEL *)(a1 + 40));
        *(_DWORD *)buf = 138412546;
        int v15 = v11;
        __int16 v16 = 2112;
        id v17 = v7;
        _os_log_error_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_ERROR, "Forced topic cache recreation failed in %@ with %@", buf, 0x16u);
      }
    }
    v2 = [*(id *)(a1 + 32) cachedTopicScores];
    if (!v2)
    {
      uint64_t v9 = pp_universal_search_log_handle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v12 = NSStringFromSelector(*(SEL *)(a1 + 40));
        *(_DWORD *)buf = 138412290;
        int v15 = v12;
        _os_log_error_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_ERROR, "Topic cache still empty after successful regeneration in %@", buf, 0xCu);
      }
    }
  }
  return v2;
}

@end