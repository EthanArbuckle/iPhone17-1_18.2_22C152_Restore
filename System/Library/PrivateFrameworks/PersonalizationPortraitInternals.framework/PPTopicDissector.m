@interface PPTopicDissector
+ (id)sharedInstance;
- (PPTopicDissector)init;
- (PPTopicDissector)initWithContextClient:(id)a3;
- (id)extractionsFromContextKitWithText:(id)a3 isPlainText:(BOOL)a4 bundleId:(id)a5 language:(id)a6 weight:(double)a7;
- (id)topicsInText:(id)a3 isPlainText:(BOOL)a4 source:(id)a5 cloudSync:(BOOL)a6 language:(id)a7 topicAlgorithms:(id)a8 namedEntityAlgorithms:(id)a9 weight:(double)a10;
- (void)_collectHighLevelTopicsWithText:(id)a3 bundleId:(id)a4 addTopic:(id)a5 weight:(double)a6;
- (void)_collectResultsFromContextKitWithText:(id)a3 isPlainText:(BOOL)a4 bundleId:(id)a5 language:(id)a6 useContextKitTopics:(BOOL)a7 useContextKitNamedEntities:(BOOL)a8 addTopic:(id)a9 addNamedEntity:(id)a10 weight:(double)a11;
@end

@implementation PPTopicDissector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transform, 0);
  objc_storeStrong((id *)&self->_contextClient, 0);
}

- (void)_collectHighLevelTopicsWithText:(id)a3 bundleId:(id)a4 addTopic:(id)a5 weight:(double)a6
{
  id v8 = a5;
  id v9 = a3;
  v10 = pp_default_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEBUG, "HighLevel Topic Extraction beginning for text...", buf, 2u);
  }

  transform = self->_transform;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__PPTopicDissector__collectHighLevelTopicsWithText_bundleId_addTopic_weight___block_invoke;
  v14[3] = &unk_1E65D4F00;
  id v15 = v8;
  id v12 = v8;
  [(PPTextToTopicTransform *)transform iterateTopicsForText:v9 block:v14];

  v13 = pp_default_log_handle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEBUG, "HighLevel Topic Extraction completed for text", buf, 2u);
  }
}

void __77__PPTopicDissector__collectHighLevelTopicsWithText_bundleId_addTopic_weight___block_invoke(uint64_t a1, void *a2, float a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = pp_default_log_handle();
  double v7 = a3;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138740227;
    id v12 = v5;
    __int16 v13 = 2048;
    double v14 = v7;
    _os_log_debug_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEBUG, "topicId: %{sensitive}@, score: %f", (uint8_t *)&v11, 0x16u);
  }

  id v8 = objc_alloc(MEMORY[0x1E4F89F00]);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F89F80]) initWithTopicIdentifier:v5];
  v10 = (void *)[v8 initWithItem:v9 score:v7];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_collectResultsFromContextKitWithText:(id)a3 isPlainText:(BOOL)a4 bundleId:(id)a5 language:(id)a6 useContextKitTopics:(BOOL)a7 useContextKitNamedEntities:(BOOL)a8 addTopic:(id)a9 addNamedEntity:(id)a10 weight:(double)a11
{
  BOOL v12 = a8;
  BOOL v13 = a7;
  BOOL v16 = a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v19 = a9;
  v20 = (void (**)(id, void, uint64_t))a10;
  uint64_t v21 = [(PPTopicDissector *)self extractionsFromContextKitWithText:a3 isPlainText:v16 bundleId:a5 language:a6 weight:a11];
  v22 = (void *)v21;
  if (v13)
  {
    if (v21)
    {
      id v23 = *(id *)(v21 + 8);
      v24 = (void *)v22[3];
    }
    else
    {
      id v23 = 0;
      v24 = 0;
    }
    id v25 = v24;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __166__PPTopicDissector__collectResultsFromContextKitWithText_isPlainText_bundleId_language_useContextKitTopics_useContextKitNamedEntities_addTopic_addNamedEntity_weight___block_invoke;
    v37[3] = &unk_1E65D4ED8;
    id v38 = v25;
    id v39 = v19;
    id v26 = v25;
    [v23 enumerateObjectsUsingBlock:v37];
  }
  if (v12)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    if (v22) {
      v27 = (void *)v22[2];
    }
    else {
      v27 = 0;
    }
    id v28 = v27;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v33 objects:v40 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v34 != v31) {
            objc_enumerationMutation(v28);
          }
          v20[2](v20, *(void *)(*((void *)&v33 + 1) + 8 * i), 15);
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v33 objects:v40 count:16];
      }
      while (v30);
    }
  }
}

void __166__PPTopicDissector__collectResultsFromContextKitWithText_isPlainText_bundleId_language_useContextKitTopics_useContextKitNamedEntities_addTopic_addNamedEntity_weight___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 objectAtIndexedSubscript:a3];
  (*(void (**)(uint64_t, id, id, uint64_t))(v4 + 16))(v4, v6, v7, 1);
}

- (id)topicsInText:(id)a3 isPlainText:(BOOL)a4 source:(id)a5 cloudSync:(BOOL)a6 language:(id)a7 topicAlgorithms:(id)a8 namedEntityAlgorithms:(id)a9 weight:(double)a10
{
  BOOL v15 = a4;
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  id v69 = a9;
  uint64_t v21 = objc_opt_new();
  double v22 = 0.0;
  if (v15)
  {
    id v23 = [v18 bundleId];
    if ([(id)*MEMORY[0x1E4F8A0A8] isEqualToString:v23])
    {

LABEL_5:
      id v25 = +[PPSentiment sharedInstance];
      [v25 sentimentScoreForText:v17];
      double v22 = v26;

      goto LABEL_6;
    }
    int v24 = [(id)*MEMORY[0x1E4F8A098] isEqualToString:v23];

    if (v24) {
      goto LABEL_5;
    }
  }
LABEL_6:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __116__PPTopicDissector_topicsInText_isPlainText_source_cloudSync_language_topicAlgorithms_namedEntityAlgorithms_weight___block_invoke;
  aBlock[3] = &unk_1E65D4E88;
  id v27 = v21;
  id v93 = v27;
  id v28 = v18;
  id v94 = v28;
  BOOL v96 = a6;
  double v95 = v22;
  v68 = _Block_copy(aBlock);
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __116__PPTopicDissector_topicsInText_isPlainText_source_cloudSync_language_topicAlgorithms_namedEntityAlgorithms_weight___block_invoke_2;
  v87[3] = &unk_1E65D4EB0;
  id v67 = v27;
  id v88 = v67;
  id v29 = v28;
  id v89 = v29;
  BOOL v91 = a6;
  double v90 = v22;
  v66 = _Block_copy(v87);
  uint64_t v30 = [v20 containsObject:&unk_1F2568BD0];
  uint64_t v31 = [v69 containsObject:&unk_1F2568BE8];
  uint64_t v32 = v31;
  if ((v30 & 1) != 0 || v31)
  {
    long long v33 = [v29 bundleId];
    [(PPTopicDissector *)self _collectResultsFromContextKitWithText:v17 isPlainText:v15 bundleId:v33 language:v19 useContextKitTopics:v30 useContextKitNamedEntities:v32 addTopic:a10 addNamedEntity:v68 weight:v66];
  }
  v64 = v19;
  if ([v20 containsObject:&unk_1F2568C00])
  {
    long long v34 = [v29 bundleId];
    [(PPTopicDissector *)self _collectHighLevelTopicsWithText:v17 bundleId:v34 addTopic:v68 weight:a10];
  }
  v65 = v17;
  [v67 allValues];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v72 = [obj countByEnumeratingWithState:&v83 objects:v103 count:16];
  if (v72)
  {
    uint64_t v71 = *(void *)v84;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v84 != v71) {
          objc_enumerationMutation(obj);
        }
        uint64_t v74 = v35;
        long long v36 = *(void **)(*((void *)&v83 + 1) + 8 * v35);
        v37 = pp_default_log_handle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          id v38 = [v36 topics];
          uint64_t v39 = [v38 count];
          v40 = objc_msgSend(MEMORY[0x1E4F89F98], "describeAlgorithm:", objc_msgSend(v36, "topicAlgorithm"));
          *(_DWORD *)buf = 134218242;
          uint64_t v100 = v39;
          __int16 v101 = 2112;
          v102 = v40;
          _os_log_impl(&dword_1CA9A8000, v37, OS_LOG_TYPE_DEFAULT, "PPTopicDissector detected %lu topics with algorithm \"%@\".", buf, 0x16u);
        }
        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        v73 = v36;
        uint64_t v41 = [v36 topics];
        uint64_t v42 = [v41 countByEnumeratingWithState:&v79 objects:v98 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v80;
          do
          {
            uint64_t v45 = 0;
            do
            {
              if (*(void *)v80 != v44) {
                objc_enumerationMutation(v41);
              }
              v46 = *(void **)(*((void *)&v79 + 1) + 8 * v45);
              v47 = pp_default_log_handle();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
              {
                v48 = [v46 item];
                v49 = [v48 topicIdentifier];
                *(_DWORD *)buf = 138739971;
                uint64_t v100 = (uint64_t)v49;
                _os_log_debug_impl(&dword_1CA9A8000, v47, OS_LOG_TYPE_DEBUG, "  QID: %{sensitive}@", buf, 0xCu);
              }
              ++v45;
            }
            while (v43 != v45);
            uint64_t v43 = [v41 countByEnumeratingWithState:&v79 objects:v98 count:16];
          }
          while (v43);
        }

        v50 = pp_default_log_handle();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          v51 = [v73 entities];
          uint64_t v52 = [v51 count];
          v53 = objc_msgSend(MEMORY[0x1E4F89EA8], "describeAlgorithm:", objc_msgSend(v73, "entityAlgorithm"));
          *(_DWORD *)buf = 134218242;
          uint64_t v100 = v52;
          __int16 v101 = 2112;
          v102 = v53;
          _os_log_impl(&dword_1CA9A8000, v50, OS_LOG_TYPE_DEFAULT, "PPTopicDissector detected %lu named entities with algorithm \"%@\".", buf, 0x16u);
        }
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        v54 = [v73 entities];
        uint64_t v55 = [v54 countByEnumeratingWithState:&v75 objects:v97 count:16];
        if (v55)
        {
          uint64_t v56 = v55;
          uint64_t v57 = *(void *)v76;
          do
          {
            uint64_t v58 = 0;
            do
            {
              if (*(void *)v76 != v57) {
                objc_enumerationMutation(v54);
              }
              v59 = *(void **)(*((void *)&v75 + 1) + 8 * v58);
              v60 = pp_default_log_handle();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
              {
                v61 = [v59 item];
                v62 = [v61 name];
                *(_DWORD *)buf = 138739971;
                uint64_t v100 = (uint64_t)v62;
                _os_log_debug_impl(&dword_1CA9A8000, v60, OS_LOG_TYPE_DEBUG, "  QID: %{sensitive}@", buf, 0xCu);
              }
              ++v58;
            }
            while (v56 != v58);
            uint64_t v56 = [v54 countByEnumeratingWithState:&v75 objects:v97 count:16];
          }
          while (v56);
        }

        uint64_t v35 = v74 + 1;
      }
      while (v74 + 1 != v72);
      uint64_t v72 = [obj countByEnumeratingWithState:&v83 objects:v103 count:16];
    }
    while (v72);
  }

  return obj;
}

void __116__PPTopicDissector_topicsInText_isPlainText_source_cloudSync_language_topicAlgorithms_namedEntityAlgorithms_weight___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v19 = a2;
  id v7 = a3;
  id v8 = (void *)MEMORY[0x1CB79D060]();
  id v9 = *(void **)(a1 + 32);
  v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"TP_%lu", a4);
  int v11 = [v9 objectForKeyedSubscript:v10];

  if (!v11)
  {
    int v11 = objc_opt_new();
    BOOL v12 = objc_opt_new();
    [v11 setTopics:v12];

    BOOL v13 = objc_opt_new();
    [v11 setTopicsExactMatchesInSourceText:v13];

    [v11 setSource:*(void *)(a1 + 40)];
    [v11 setTopicAlgorithm:a4];
    [v11 setCloudSync:*(unsigned __int8 *)(a1 + 56)];
    [v11 setSentimentScore:*(double *)(a1 + 48)];
    double v14 = *(void **)(a1 + 32);
    BOOL v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"TP_%lu", a4);
    [v14 setObject:v11 forKeyedSubscript:v15];
  }
  BOOL v16 = [v11 topics];
  id v17 = [v16 arrayByAddingObject:v19];
  [v11 setTopics:v17];

  id v18 = [v11 topicsExactMatchesInSourceText];
  [v18 addObject:v7];
}

void __116__PPTopicDissector_topicsInText_isPlainText_source_cloudSync_language_topicAlgorithms_namedEntityAlgorithms_weight___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v14 = a2;
  id v5 = (void *)MEMORY[0x1CB79D060]();
  id v6 = *(void **)(a1 + 32);
  id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"NE_%lu", a3);
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
    id v8 = objc_opt_new();
    id v9 = objc_opt_new();
    [v8 setEntities:v9];

    [v8 setSource:*(void *)(a1 + 40)];
    [v8 setEntityAlgorithm:a3];
    [v8 setCloudSync:*(unsigned __int8 *)(a1 + 56)];
    [v8 setSentimentScore:*(double *)(a1 + 48)];
    v10 = *(void **)(a1 + 32);
    int v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"NE_%lu", a3);
    [v10 setObject:v8 forKeyedSubscript:v11];
  }
  BOOL v12 = [v8 entities];
  BOOL v13 = [v12 arrayByAddingObject:v14];
  [v8 setEntities:v13];
}

- (id)extractionsFromContextKitWithText:(id)a3 isPlainText:(BOOL)a4 bundleId:(id)a5 language:(id)a6 weight:(double)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  BOOL v15 = (void *)[(CKContextClient *)self->_contextClient newRequest];
  [v15 setText:v12];
  BOOL v16 = (void *)MEMORY[0x1E4F1CA20];
  id v17 = v14;
  if (!v14)
  {
    a5 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v17 = [a5 languageCode];
  }
  id v18 = [v16 componentsFromLocaleIdentifier:v17];
  id v19 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];
  [v15 setLanguageTag:v19];

  if (!v14)
  {
  }
  [v15 setTextIsRaw:!v10];
  dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
  uint64_t v21 = objc_opt_new();
  *(unsigned char *)(v21 + 8) = 0;
  uint64_t v22 = objc_opt_new();
  id v23 = *(void **)(v21 + 16);
  *(void *)(v21 + 16) = v22;

  uint64_t v24 = objc_opt_new();
  id v25 = *(void **)(v21 + 24);
  *(void *)(v21 + 24) = v24;

  uint64_t v26 = objc_opt_new();
  id v27 = *(void **)(v21 + 32);
  *(void *)(v21 + 32) = v26;

  id v28 = (void *)[objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v21];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __91__PPTopicDissector_extractionsFromContextKitWithText_isPlainText_bundleId_language_weight___block_invoke;
  v42[3] = &unk_1E65D4E38;
  id v29 = v13;
  id v43 = v29;
  BOOL v48 = v10;
  id v30 = v28;
  id v44 = v30;
  double v47 = a7;
  id v31 = v14;
  id v45 = v31;
  uint64_t v32 = v20;
  v46 = v32;
  [v15 executeWithReply:v42];
  [MEMORY[0x1E4F93B18] waitForSemaphore:v32 timeoutSeconds:0 onAcquire:&__block_literal_global_110 onTimeout:3.0];
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__2941;
  v40 = __Block_byref_object_dispose__2942;
  id v41 = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __91__PPTopicDissector_extractionsFromContextKitWithText_isPlainText_bundleId_language_weight___block_invoke_111;
  v35[3] = &unk_1E65D4E60;
  v35[4] = &v36;
  [v30 runWithLockAcquired:v35];
  id v33 = (id)v37[5];
  _Block_object_dispose(&v36, 8);

  return v33;
}

void __91__PPTopicDissector_extractionsFromContextKitWithText_isPlainText_bundleId_language_weight___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x2020000000;
  __int16 v45 = 0;
  uint64_t v4 = [v3 error];

  if (v4)
  {
    id v5 = pp_default_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v33 = [v3 error];
      *(_DWORD *)buf = 138412290;
      uint64_t v47 = (uint64_t)v33;
      _os_log_error_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_ERROR, "ContextKit error: %@", buf, 0xCu);
    }
    id v6 = [v3 error];
    if ([v6 code] == 4)
    {
      uint64_t v7 = 0;
      uint64_t v8 = 0;
LABEL_24:

LABEL_26:
      id v18 = +[PPLocalTopicStore defaultStore];
      [v18 logDonationErrorForReason:v7 errorCode:v8 source:*(void *)(a1 + 32)];
      goto LABEL_27;
    }
    id v19 = [v3 error];
    BOOL v20 = [v19 code] == 7;

    if (!v20)
    {
      id v6 = [v3 error];
      uint64_t v8 = [v6 code];
      uint64_t v7 = 3;
      goto LABEL_24;
    }
LABEL_25:
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    goto LABEL_26;
  }
  id v9 = [v3 results];
  if (!v9
    || ([v3 results],
        BOOL v10 = objc_claimAutoreleasedReturnValue(),
        BOOL v11 = [v10 count] == 0,
        v10,
        v9,
        v11))
  {
    uint64_t v21 = pp_default_log_handle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_DEFAULT, "nil or empty results received from ContextKit", buf, 2u);
    }

    if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F8A0E8]])
    {
      int v22 = *(unsigned __int8 *)(a1 + 72);
      id v23 = [v3 error];
      id v6 = v23;
      if (v22) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = 2;
      }
      uint64_t v8 = [v23 code];
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  id v12 = pp_default_log_handle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v3 results];
    uint64_t v14 = [v13 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v47 = v14;
    _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, "got %lu results from ContextKit", buf, 0xCu);
  }
  BOOL v15 = pp_default_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    long long v34 = [v3 debug];
    *(_DWORD *)buf = 138739971;
    uint64_t v47 = (uint64_t)v34;
    _os_log_debug_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEBUG, "ContextKit debug info: %{sensitive}@", buf, 0xCu);
  }
  BOOL v16 = [v3 results];
  BOOL v17 = ([v16 count] & 0xFFFFFFFFFFFF0000) != 0;

  if (v17)
  {
    id v18 = pp_default_log_handle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEFAULT, "ignoring excessive results returned from ContextKit.", buf, 2u);
    }
  }
  else
  {
    uint64_t v24 = [v3 results];
    __int16 v25 = [v24 count];

    uint64_t v26 = +[PPConfiguration sharedInstance];
    [v26 halfValuePosition];
    uint64_t v28 = v27;

    id v29 = *(void **)(a1 + 40);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __91__PPTopicDissector_extractionsFromContextKitWithText_isPlainText_bundleId_language_weight___block_invoke_99;
    v35[3] = &unk_1E65D4E10;
    uint64_t v36 = v3;
    uint64_t v38 = &v42;
    uint64_t v30 = *(void *)(a1 + 64);
    uint64_t v39 = v28;
    uint64_t v40 = v30;
    __int16 v41 = v25;
    id v37 = *(id *)(a1 + 48);
    [v29 runWithLockAcquired:v35];
    id v31 = pp_default_log_handle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = *((unsigned __int16 *)v43 + 12);
      *(_DWORD *)buf = 134217984;
      uint64_t v47 = v32;
      _os_log_impl(&dword_1CA9A8000, v31, OS_LOG_TYPE_DEFAULT, "processed %lu results from ContextKit", buf, 0xCu);
    }

    id v18 = v36;
  }
LABEL_27:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  _Block_object_dispose(&v42, 8);
}

void __91__PPTopicDissector_extractionsFromContextKitWithText_isPlainText_bundleId_language_weight___block_invoke_111(uint64_t a1, unsigned char *a2)
{
  a2[8] = 1;
  id v3 = a2;
  uint64_t v4 = [PPContextKitResultContainer alloc];
  id v6 = (void *)v3[2];
  id v5 = (void *)v3[3];
  uint64_t v7 = (void *)v3[4];

  id v8 = v6;
  id v9 = v5;
  id v10 = v7;
  if (v4)
  {
    v14.receiver = v4;
    v14.super_class = (Class)PPContextKitResultContainer;
    BOOL v11 = (PPContextKitResultContainer *)objc_msgSendSuper2(&v14, sel_init);
    uint64_t v4 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_topics, v6);
      objc_storeStrong((id *)&v4->_namedEntities, v5);
      objc_storeStrong((id *)&v4->_topicsExactMatchesInSourceText, v7);
    }
  }

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v4;
}

void __91__PPTopicDissector_extractionsFromContextKitWithText_isPlainText_bundleId_language_weight___block_invoke_108()
{
  v0 = pp_default_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_1CA9A8000, v0, OS_LOG_TYPE_ERROR, "Timeout waiting for ContextKit response.", v1, 2u);
  }
}

void __91__PPTopicDissector_extractionsFromContextKitWithText_isPlainText_bundleId_language_weight___block_invoke_99(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*((unsigned char *)v3 + 8))
  {
    uint64_t v4 = pp_default_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "Exceeded time limit to process ContextKit extractions. Stopping.", buf, 2u);
    }
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v4 = [*(id *)(a1 + 32) results];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v36 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v27;
      id obj = v4;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v27 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v26 + 1) + 8 * v8);
          id v10 = pp_default_log_handle();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            int v22 = [v9 title];
            id v23 = [v9 topicId];
            uint64_t v24 = [v9 category];
            *(_DWORD *)buf = 138740483;
            id v31 = v22;
            __int16 v32 = 2117;
            id v33 = v23;
            __int16 v34 = 2117;
            uint64_t v35 = v24;
            _os_log_debug_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEBUG, "ContextKit title: %{sensitive}@, qid: %{sensitive}@, category: %{sensitive}@", buf, 0x20u);
          }
          BOOL v11 = [v9 topicId];

          LOWORD(v12) = *(_WORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
          double v13 = *(double *)(a1 + 56) / (*(double *)(a1 + 56) + (double)v12);
          if (v11)
          {
            id v14 = objc_alloc(MEMORY[0x1E4F89F80]);
            BOOL v15 = [v9 topicId];
            BOOL v16 = (void *)[v14 initWithTopicIdentifier:v15];

            BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v16 score:*(unsigned __int16 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) resultPosition:*(unsigned __int16 *)(a1 + 72) resultCount:v13 * *(double *)(a1 + 64)];
            [v3[2] addObject:v17];
            id v18 = v3[4];
            id v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "isExactMatch"));
            [v18 addObject:v19];
          }
          else
          {
            id v20 = objc_alloc(MEMORY[0x1E4F89E90]);
            uint64_t v21 = [v9 title];
            BOOL v16 = (void *)[v20 initWithName:v21 category:0 language:*(void *)(a1 + 40)];

            BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v16 score:*(unsigned __int16 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) resultPosition:*(unsigned __int16 *)(a1 + 72) resultCount:v13 * *(double *)(a1 + 64)];
            [v3[3] addObject:v17];
          }

          ++*(_WORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
          ++v8;
        }
        while (v6 != v8);
        uint64_t v4 = obj;
        uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
      }
      while (v6);
    }
  }
}

- (PPTopicDissector)init
{
  if (init__pasOnceToken2 != -1) {
    dispatch_once(&init__pasOnceToken2, &__block_literal_global_2958);
  }
  id v4 = (id)init__pasExprOnceResult;
  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PPTopicDissector.m", 70, @"Invalid parameter not satisfying: %@", @"contextClient" object file lineNumber description];
  }
  uint64_t v5 = [(PPTopicDissector *)self initWithContextClient:v4];

  return v5;
}

void __24__PPTopicDissector_init__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = [MEMORY[0x1E4F5AC38] clientWithDefaultRequestType:2];
  v2 = (void *)init__pasExprOnceResult;
  init__pasExprOnceResult = v1;
}

- (PPTopicDissector)initWithContextClient:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPTopicDissector;
  uint64_t v6 = [(PPTopicDissector *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contextClient, a3);
    uint64_t v8 = +[PPTextToTopicTransform sharedInstance];
    transform = v7->_transform;
    v7->_transform = (PPTextToTopicTransform *)v8;
  }
  return v7;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken12 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken12, &__block_literal_global_114);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_2975;
  return v2;
}

void __34__PPTopicDissector_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_2975;
  sharedInstance__pasExprOnceResult_2975 = v1;
}

@end