@interface PPXPCTopicStore
- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4;
- (BOOL)cloudSyncWithError:(id *)a3;
- (BOOL)computeAndCacheTopicScores:(id *)a3;
- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5;
- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)deleteAllTopicsWithTopicId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5;
- (BOOL)donateTopics:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 exactMatchesInSourceText:(id)a8 error:(id *)a9;
- (BOOL)iterRankedTopicsWithQuery:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)iterScoresForTopicMapping:(id)a3 query:(id)a4 error:(id *)a5 block:(id)a6;
- (BOOL)iterTopicRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5;
- (id)_init;
- (id)cachePath:(id *)a3;
- (id)clientIdentifier;
- (id)rankedTopicsWithQuery:(id)a3 error:(id *)a4;
- (id)scoresForTopicMapping:(id)a3 query:(id)a4 error:(id *)a5;
- (id)topicCacheSandboxExtensionToken:(id *)a3;
- (id)topicExtractionsFromText:(id)a3 error:(id *)a4;
- (id)topicRecordsWithQuery:(id)a3 error:(id *)a4;
- (id)unmapMappedTopicIdentifier:(id)a3 mappingIdentifier:(id)a4 error:(id *)a5;
- (void)registerFeedback:(id)a3 completion:(id)a4;
- (void)registerUniversalSearchSpotlightFeedback:(id)a3 completion:(id)a4;
- (void)setClientIdentifier:(id)a3;
@end

@implementation PPXPCTopicStore

- (void).cxx_destruct
{
}

- (id)cachePath:(id *)a3
{
  v4 = +[PPTopicReadOnlyClient sharedInstance];
  v5 = [v4 cachePath:a3];

  return v5;
}

- (id)topicCacheSandboxExtensionToken:(id *)a3
{
  v4 = +[PPTopicReadOnlyClient sharedInstance];
  v5 = [v4 topicCacheSandboxExtensionToken:a3];

  return v5;
}

- (BOOL)computeAndCacheTopicScores:(id *)a3
{
  v4 = +[PPTopicReadWriteClient sharedInstance];
  LOBYTE(a3) = [v4 computeAndCacheTopicScores:a3];

  return (char)a3;
}

- (void)registerUniversalSearchSpotlightFeedback:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = [(PPXPCTopicStore *)self clientIdentifier];
  uint64_t v10 = [v9 length];

  if (!v10)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PPXPCTopicStore.m" lineNumber:301 description:@"The clientIdentifier property must be set on the PPTopicStore in order to send feedback."];
  }
  v11 = [(PPXPCTopicStore *)self clientIdentifier];
  [v8 setClientIdentifier:v11];

  v12 = +[PPTopicReadOnlyClient sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__PPXPCTopicStore_registerUniversalSearchSpotlightFeedback_completion___block_invoke;
  v15[3] = &unk_1E550F8A8;
  v15[4] = self;
  id v16 = v7;
  id v13 = v7;
  [v12 registerUniversalSearchSpotlightFeedback:v8 completion:v15];
}

uint64_t __71__PPXPCTopicStore_registerUniversalSearchSpotlightFeedback_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, a3);
  }
  return MEMORY[0x1F41817F8]();
}

- (void)setClientIdentifier:(id)a3
{
}

- (id)clientIdentifier
{
  return [(PPClientFeedbackHelper *)self->_clientFeedbackHelper clientIdentifier];
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = [(PPXPCTopicStore *)self clientIdentifier];
  uint64_t v10 = [v9 length];

  if (!v10)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PPXPCTopicStore.m" lineNumber:271 description:@"The clientIdentifier property must be set on the PPTopicStore in order to send feedback."];
  }
  v11 = [(PPXPCTopicStore *)self clientIdentifier];
  [v8 setClientIdentifier:v11];

  v12 = +[PPTopicReadOnlyClient sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__PPXPCTopicStore_registerFeedback_completion___block_invoke;
  v15[3] = &unk_1E550F8A8;
  v15[4] = self;
  id v16 = v7;
  id v13 = v7;
  [v12 registerFeedback:v8 completion:v15];
}

uint64_t __47__PPXPCTopicStore_registerFeedback_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, a3);
  }
  return MEMORY[0x1F41817F8]();
}

- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4
{
  uint64_t v6 = +[PPTopicReadWriteClient sharedInstance];
  LOBYTE(a4) = [v6 clearWithError:a3 deletedCount:a4];

  return (char)a4;
}

- (BOOL)cloudSyncWithError:(id *)a3
{
  v4 = +[PPTopicReadWriteClient sharedInstance];
  LOBYTE(a3) = [v4 cloudSyncWithError:a3];

  return (char)a3;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = +[PPTopicReadWriteClient sharedInstance];
  LOBYTE(a5) = [v8 deleteAllTopicsFromSourcesWithBundleId:v7 deletedCount:a4 error:a5];

  return (char)a5;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a3;
  v11 = +[PPTopicReadWriteClient sharedInstance];
  LOBYTE(a6) = [v11 deleteAllTopicsFromSourcesWithBundleId:v10 groupIds:v9 deletedCount:a5 error:a6];

  return (char)a6;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a3;
  v11 = +[PPTopicReadWriteClient sharedInstance];
  LOBYTE(a6) = [v11 deleteAllTopicsFromSourcesWithBundleId:v10 documentIds:v9 deletedCount:a5 error:a6];

  return (char)a6;
}

- (BOOL)deleteAllTopicsWithTopicId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = +[PPTopicReadWriteClient sharedInstance];
  LOBYTE(a5) = [v8 deleteAllTopicsWithTopicId:v7 deletedCount:a4 error:a5];

  return (char)a5;
}

- (BOOL)donateTopics:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 exactMatchesInSourceText:(id)a8 error:(id *)a9
{
  BOOL v12 = a6;
  id v17 = a3;
  id v18 = a4;
  id v19 = a8;
  if (!v17)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"PPXPCTopicStore.m", 198, @"Invalid parameter not satisfying: %@", @"topics" object file lineNumber description];

    if (v18) {
      goto LABEL_3;
    }
LABEL_11:
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"PPXPCTopicStore.m", 199, @"Invalid parameter not satisfying: %@", @"source" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v18) {
    goto LABEL_11;
  }
LABEL_3:
  v20 = pp_topics_signpost_handle();
  os_signpost_id_t v21 = os_signpost_id_generate(v20);

  v22 = pp_topics_signpost_handle();
  v23 = v22;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "PPXPCTopicStore.donateTopics", (const char *)&unk_18CB1211E, buf, 2u);
  }

  v24 = +[PPTopicReadWriteClient sharedInstance];
  char v25 = [v24 donateTopics:v17 source:v18 algorithm:a5 cloudSync:v12 sentimentScore:v19 exactMatchesInSourceText:a9 error:a7];

  v26 = pp_topics_signpost_handle();
  v27 = v26;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)v31 = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v27, OS_SIGNPOST_INTERVAL_END, v21, "PPXPCTopicStore.donateTopics", (const char *)&unk_18CB1211E, v31, 2u);
  }

  return v25;
}

- (id)unmapMappedTopicIdentifier:(id)a3 mappingIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[PPTopicReadOnlyClient sharedInstance];
  id v10 = [v9 unmapMappedTopicIdentifier:v8 mappingIdentifier:v7 error:a5];

  return v10;
}

- (id)topicExtractionsFromText:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  id v7 = pp_topics_signpost_handle();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = pp_topics_signpost_handle();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PPXPCTopicStore.topicExtractionsFromText", (const char *)&unk_18CB1211E, buf, 2u);
  }

  v11 = +[PPTopicReadOnlyClient sharedInstance];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __50__PPXPCTopicStore_topicExtractionsFromText_error___block_invoke;
  v19[3] = &unk_1E550E8E0;
  id v20 = v6;
  id v12 = v6;
  int v13 = [v11 topicExtractionsFromText:v5 error:a4 handleBatch:v19];

  v14 = pp_topics_signpost_handle();
  v15 = v14;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PPXPCTopicStore.topicExtractionsFromText", (const char *)&unk_18CB1211E, buf, 2u);
  }

  if (v13) {
    id v16 = v12;
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;

  return v17;
}

uint64_t __50__PPXPCTopicStore_topicExtractionsFromText_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:a2];
}

- (id)topicRecordsWithQuery:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  id v7 = pp_topics_signpost_handle();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = pp_topics_signpost_handle();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PPXPCTopicStore.topicRecordsWithQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  v11 = +[PPTopicReadOnlyClient sharedInstance];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __47__PPXPCTopicStore_topicRecordsWithQuery_error___block_invoke;
  v27[3] = &unk_1E550E260;
  id v12 = v6;
  id v28 = v12;
  v29 = &v31;
  int v13 = [v11 topicRecordsWithQuery:v5 error:a4 handleBatch:v27];

  v14 = pp_topics_signpost_handle();
  v15 = v14;
  if (v8 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PPXPCTopicStore.topicRecordsWithQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  if (v13)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v17 = (void *)[v16 initWithCapacity:v32[3]];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v18 = v12;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(v17, "addObjectsFromArray:", *(void *)(*((void *)&v23 + 1) + 8 * i), (void)v23);
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
      }
      while (v19);
    }
  }
  else
  {
    id v17 = 0;
  }

  _Block_object_dispose(&v31, 8);
  return v17;
}

void __47__PPXPCTopicStore_topicRecordsWithQuery_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 addObject:v4];
  uint64_t v5 = [v4 count];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v5;
}

- (BOOL)iterTopicRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = pp_topics_signpost_handle();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  v11 = pp_topics_signpost_handle();
  id v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PPXPCTopicStore.iterTopicRecordsWithQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  int v13 = +[PPTopicReadOnlyClient sharedInstance];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __57__PPXPCTopicStore_iterTopicRecordsWithQuery_error_block___block_invoke;
  v19[3] = &unk_1E550F880;
  id v20 = v7;
  id v14 = v7;
  char v15 = [v13 topicRecordsWithQuery:v8 error:a4 handleBatch:v19];

  id v16 = pp_topics_signpost_handle();
  id v17 = v16;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v17, OS_SIGNPOST_INTERVAL_END, v10, "PPXPCTopicStore.iterTopicRecordsWithQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  return v15;
}

void __57__PPXPCTopicStore_iterTopicRecordsWithQuery_error_block___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (!*a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        if (*a3) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (id)scoresForTopicMapping:(id)a3 query:(id)a4 error:(id *)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v32 = a4;
  id v7 = objc_opt_new();
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  uint64_t v8 = pp_topics_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  uint64_t v10 = pp_topics_signpost_handle();
  uint64_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PPXPCTopicStore.scoresForTopicMapping", (const char *)&unk_18CB1211E, buf, 2u);
  }

  long long v12 = +[PPTopicReadOnlyClient sharedInstance];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __53__PPXPCTopicStore_scoresForTopicMapping_query_error___block_invoke;
  v42[3] = &unk_1E550E260;
  id v30 = v7;
  id v43 = v30;
  v44 = &v46;
  int v13 = [v12 scoresForTopicMapping:v31 query:v32 error:a5 handleBatch:v42];

  long long v14 = pp_topics_signpost_handle();
  long long v15 = v14;
  if (v9 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v15, OS_SIGNPOST_INTERVAL_END, v9, "PPXPCTopicStore.scoresForTopicMapping", (const char *)&unk_18CB1211E, buf, 2u);
  }

  if (v13)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v17 = (void *)[v16 initWithCapacity:v47[3]];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    obuint64_t j = v30;
    uint64_t v18 = [obj countByEnumeratingWithState:&v38 objects:v51 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v39 != v19) {
            objc_enumerationMutation(obj);
          }
          os_signpost_id_t v21 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v22 = v21;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v50 count:16];
          if (v23)
          {
            uint64_t v24 = *(void *)v35;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v35 != v24) {
                  objc_enumerationMutation(v22);
                }
                long long v26 = *(void **)(*((void *)&v34 + 1) + 8 * j);
                v27 = [v26 second];
                id v28 = [v26 first];
                [v17 setObject:v27 forKeyedSubscript:v28];
              }
              uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v50 count:16];
            }
            while (v23);
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v38 objects:v51 count:16];
      }
      while (v18);
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  _Block_object_dispose(&v46, 8);
  return v17;
}

void __53__PPXPCTopicStore_scoresForTopicMapping_query_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 addObject:v4];
  uint64_t v5 = [v4 count];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v5;
}

- (BOOL)iterScoresForTopicMapping:(id)a3 query:(id)a4 error:(id *)a5 block:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  long long v12 = pp_topics_signpost_handle();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);

  long long v14 = pp_topics_signpost_handle();
  long long v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PPXPCTopicStore.iterScoresForTopicMapping", (const char *)&unk_18CB1211E, buf, 2u);
  }

  id v16 = +[PPTopicReadOnlyClient sharedInstance];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __63__PPXPCTopicStore_iterScoresForTopicMapping_query_error_block___block_invoke;
  v22[3] = &unk_1E550F880;
  id v23 = v9;
  id v17 = v9;
  char v18 = [v16 scoresForTopicMapping:v11 query:v10 error:a5 handleBatch:v22];

  uint64_t v19 = pp_topics_signpost_handle();
  id v20 = v19;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v20, OS_SIGNPOST_INTERVAL_END, v13, "PPXPCTopicStore.iterScoresForTopicMapping", (const char *)&unk_18CB1211E, buf, 2u);
  }

  return v18;
}

void __63__PPXPCTopicStore_iterScoresForTopicMapping_query_error_block___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (!*a3)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
        uint64_t v13 = *(void *)(a1 + 32);
        long long v14 = objc_msgSend(v12, "first", (void)v16);
        long long v15 = [v12 second];
        (*(void (**)(uint64_t, void *, void *, unsigned char *))(v13 + 16))(v13, v14, v15, a3);

        if (*a3) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (id)rankedTopicsWithQuery:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  id v7 = pp_topics_signpost_handle();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  uint64_t v9 = pp_topics_signpost_handle();
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PPXPCTopicStore.rankedTopicsWithQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  uint64_t v11 = +[PPTopicReadOnlyClient sharedInstance];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __47__PPXPCTopicStore_rankedTopicsWithQuery_error___block_invoke;
  v27[3] = &unk_1E550E260;
  id v12 = v6;
  id v28 = v12;
  v29 = &v31;
  int v13 = [v11 rankedTopicsWithQuery:v5 error:a4 handleBatch:v27];

  long long v14 = pp_topics_signpost_handle();
  long long v15 = v14;
  if (v8 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PPXPCTopicStore.rankedTopicsWithQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  if (v13)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F1CA48]);
    long long v17 = (void *)[v16 initWithCapacity:v32[3]];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v18 = v12;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(v17, "addObjectsFromArray:", *(void *)(*((void *)&v23 + 1) + 8 * i), (void)v23);
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
      }
      while (v19);
    }
  }
  else
  {
    long long v17 = 0;
  }

  _Block_object_dispose(&v31, 8);
  return v17;
}

void __47__PPXPCTopicStore_rankedTopicsWithQuery_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 addObject:v4];
  uint64_t v5 = [v4 count];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v5;
}

- (BOOL)iterRankedTopicsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = pp_topics_signpost_handle();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  uint64_t v11 = pp_topics_signpost_handle();
  id v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PPXPCTopicStore.iterRankedTopicsWithQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  int v13 = +[PPTopicReadOnlyClient sharedInstance];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __57__PPXPCTopicStore_iterRankedTopicsWithQuery_error_block___block_invoke;
  v19[3] = &unk_1E550F880;
  id v20 = v7;
  id v14 = v7;
  char v15 = [v13 rankedTopicsWithQuery:v8 error:a4 handleBatch:v19];

  id v16 = pp_topics_signpost_handle();
  long long v17 = v16;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v17, OS_SIGNPOST_INTERVAL_END, v10, "PPXPCTopicStore.iterRankedTopicsWithQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  return v15;
}

void __57__PPXPCTopicStore_iterRankedTopicsWithQuery_error_block___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (!*a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        if (*a3) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)PPXPCTopicStore;
  v2 = [(PPTopicStore *)&v6 _initFromSubclass];
  if (v2)
  {
    v3 = [[PPClientFeedbackHelper alloc] initWithParentObject:v2];
    id v4 = (void *)v2[1];
    v2[1] = v3;
  }
  return v2;
}

@end