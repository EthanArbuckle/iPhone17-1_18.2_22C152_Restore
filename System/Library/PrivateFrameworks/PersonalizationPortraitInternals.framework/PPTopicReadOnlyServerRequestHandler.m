@interface PPTopicReadOnlyServerRequestHandler
+ (id)filterQIDDictionary:(id)a3 withAllowlistOfProcess:(id)a4 allowlist:(id)a5;
+ (id)filterScoredTopicsNotInAllowlist:(id)a3 withAllowlistOfProcess:(id)a4 allowlist:(id)a5;
+ (id)filterTopicRecordsNotInAllowlist:(id)a3 withAllowlistOfProcess:(id)a4 allowlist:(id)a5;
- (NSString)clientProcessName;
- (PPTopicReadOnlyServerRequestHandler)init;
- (_PASBundleIdResolver)bundleIdResolver;
- (void)cachePath:(id)a3;
- (void)rankedTopicsWithQuery:(id)a3 queryId:(unint64_t)a4;
- (void)registerFeedback:(id)a3 completion:(id)a4;
- (void)registerUniversalSearchSpotlightFeedback:(id)a3 completion:(id)a4;
- (void)scoresForTopicMapping:(id)a3 query:(id)a4 queryId:(unint64_t)a5;
- (void)setBundleIdResolver:(id)a3;
- (void)setClientProcessName:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
- (void)topicCacheSandboxExtensionToken:(id)a3;
- (void)topicExtractionsFromText:(id)a3 queryId:(unint64_t)a4;
- (void)topicRecordsWithQuery:(id)a3 queryId:(unint64_t)a4;
- (void)unblockPendingQueries;
- (void)unmapMappedTopicIdentifier:(id)a3 mappingIdentifier:(id)a4 completion:(id)a5;
@end

@implementation PPTopicReadOnlyServerRequestHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdResolver, 0);
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
}

- (void)setBundleIdResolver:(id)a3
{
}

- (_PASBundleIdResolver)bundleIdResolver
{
  return self->_bundleIdResolver;
}

- (void)setClientProcessName:(id)a3
{
}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (void)topicCacheSandboxExtensionToken:(id)a3
{
  v3 = (void (**)(id, void *, id))a3;
  v4 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: topicCacheSandboxExtensionToken", buf, 2u);
  }

  v5 = +[PPLocalTopicStore defaultStore];
  id v8 = 0;
  v6 = [v5 topicCacheSandboxExtensionToken:&v8];
  id v7 = v8;

  v3[2](v3, v6, v7);
}

- (void)cachePath:(id)a3
{
  v3 = (void (**)(id, void *, id))a3;
  v4 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: cachePath", buf, 2u);
  }

  v5 = +[PPLocalTopicStore defaultStore];
  id v8 = 0;
  v6 = [v5 cachePath:&v8];
  id v7 = v8;

  v3[2](v3, v6, v7);
}

- (void)registerUniversalSearchSpotlightFeedback:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[PPLocalTopicStore defaultStore];
  [v7 registerUniversalSearchSpotlightFeedback:v6 completion:v5];
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: registerFeedback", buf, 2u);
  }

  id v8 = +[PPLocalTopicStore defaultStore];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__PPTopicReadOnlyServerRequestHandler_registerFeedback_completion___block_invoke;
  v10[3] = &unk_1E65DA480;
  id v11 = v5;
  id v9 = v5;
  [v8 registerFeedback:v6 completion:v10];
}

uint64_t __67__PPTopicReadOnlyServerRequestHandler_registerFeedback_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)unmapMappedTopicIdentifier:(id)a3 mappingIdentifier:(id)a4 completion:(id)a5
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *, void))a5;
  id v11 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    clientProcessName = self->_clientProcessName;
    *(_DWORD *)buf = 138412290;
    v34 = clientProcessName;
    _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: unmapMappedTopicIdentifier process:%@", buf, 0xCu);
  }

  v13 = pp_topics_signpost_handle();
  os_signpost_id_t v14 = os_signpost_id_generate(v13);

  v15 = pp_topics_signpost_handle();
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PPTopicReadOnlyServer.unmapMappedTopicIdentifier", "", buf, 2u);
  }

  v17 = +[PPLocalTopicStore defaultStore];
  id v32 = 0;
  v18 = [v17 unmapMappedTopicIdentifier:v8 mappingIdentifier:v9 error:&v32];
  id v19 = v32;

  v20 = pp_topics_signpost_handle();
  v21 = v20;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v21, OS_SIGNPOST_INTERVAL_END, v14, "PPTopicReadOnlyServer.unmapMappedTopicIdentifier", "", buf, 2u);
  }

  if (v18 || !v19)
  {
    if (v18)
    {
      v26 = objc_opt_class();
      v27 = self->_clientProcessName;
      v28 = +[PPTopicAllowlist sharedInstance];
      v25 = [v26 filterQIDDictionary:v18 withAllowlistOfProcess:v27 allowlist:v28];
    }
    else
    {
      v29 = pp_xpc_server_log_handle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v29, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: received nil unmapped dictionary.", buf, 2u);
      }

      v25 = (void *)MEMORY[0x1E4F1CC08];
    }
    v10[2](v10, v25, 0);
    v30 = pp_xpc_server_log_handle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = self->_clientProcessName;
      *(_DWORD *)buf = 138412546;
      v34 = v31;
      __int16 v35 = 2112;
      id v36 = v9;
      _os_log_impl(&dword_1CA9A8000, v30, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: unmapMappedTopicIdentifier process:%@ mappingIdentifier:%@", buf, 0x16u);
    }
  }
  else
  {
    id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
    v37 = @"PPServerSideErrorInfoKey";
    v23 = [v19 description];
    v38[0] = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    v25 = (void *)[v22 initWithDomain:@"PPServerSideErrorDomain" code:1 userInfo:v24];

    ((void (**)(id, void *, void *))v10)[2](v10, 0, v25);
  }
}

- (void)scoresForTopicMapping:(id)a3 query:(id)a4 queryId:(unint64_t)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    clientProcessName = self->_clientProcessName;
    *(_DWORD *)buf = 134218242;
    unint64_t v26 = a5;
    __int16 v27 = 2112;
    v28 = clientProcessName;
    _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: scoresForTopicMapping queryId:%llu process:%@", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __75__PPTopicReadOnlyServerRequestHandler_scoresForTopicMapping_query_queryId___block_invoke;
  v19[3] = &unk_1E65D7FE0;
  id v14 = v9;
  id v20 = v14;
  id v15 = v10;
  id v21 = v15;
  id v22 = self;
  unint64_t v23 = a5;
  SEL v24 = a2;
  [(PPXPCServerPipelinedBatchQueryManager *)queryManager runConcurrentlyWithRequestThrottle:v19];
  v16 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = self->_clientProcessName;
    v18 = [v15 customizedDescription];
    *(_DWORD *)buf = 134218754;
    unint64_t v26 = a5;
    __int16 v27 = 2112;
    v28 = v17;
    __int16 v29 = 2112;
    id v30 = v14;
    __int16 v31 = 2112;
    id v32 = v18;
    _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: scoresForTopicMapping queryId:%llu process:%@ mappingId:%@ query:%@", buf, 0x2Au);
  }
}

void __75__PPTopicReadOnlyServerRequestHandler_scoresForTopicMapping_query_queryId___block_invoke(void *a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v2 = pp_topics_signpost_handle();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  v4 = pp_topics_signpost_handle();
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPTopicReadOnlyServer.scoresForTopicMapping", "", (uint8_t *)&buf, 2u);
  }

  id v6 = +[PPLocalTopicStore defaultStore];
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  id v34 = 0;
  id v9 = [v6 scoresForTopicMapping:v7 query:v8 error:&v34 clientProcessName:*(void *)(a1[6] + 24)];
  id v10 = v34;

  id v11 = pp_topics_signpost_handle();
  v12 = v11;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v11))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v12, OS_SIGNPOST_INTERVAL_END, v3, "PPTopicReadOnlyServer.scoresForTopicMapping", "", (uint8_t *)&buf, 2u);
  }

  if (v10)
  {
    v13 = pp_xpc_server_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: scoresForTopicMapping returned an error: %@", (uint8_t *)&buf, 0xCu);
    }

    [*(id *)(a1[6] + 8) scoredMappedTopicBatch:0 isLast:1 error:v10 queryId:a1[7] completion:&__block_literal_global_198];
  }
  else
  {
    id v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", 2 * objc_msgSend(v9, "count"));
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __75__PPTopicReadOnlyServerRequestHandler_scoresForTopicMapping_query_queryId___block_invoke_2;
    v32[3] = &unk_1E65DC338;
    id v15 = v14;
    id v33 = v15;
    [v9 enumerateKeysAndObjectsUsingBlock:v32];
    v16 = pp_xpc_server_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v9 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: scoresForTopicMapping returned %tu results", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v36 = 0x2020000000;
    uint64_t v37 = 0;
    v18 = *(void **)(a1[6] + 16);
    id v19 = (void *)[[NSString alloc] initWithFormat:@"%@-scoresForTopicMapping", *(void *)(a1[6] + 24)];
    uint64_t v20 = a1[7];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __75__PPTopicReadOnlyServerRequestHandler_scoresForTopicMapping_query_queryId___block_invoke_204;
    v27[3] = &unk_1E65D7FB8;
    id v21 = v15;
    uint64_t v22 = a1[8];
    p_long long buf = &buf;
    uint64_t v31 = v22;
    uint64_t v23 = a1[6];
    id v28 = v21;
    uint64_t v29 = v23;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __75__PPTopicReadOnlyServerRequestHandler_scoresForTopicMapping_query_queryId___block_invoke_2_212;
    v26[3] = &unk_1E65DA430;
    uint64_t v24 = a1[7];
    v26[4] = v23;
    v26[5] = v24;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __75__PPTopicReadOnlyServerRequestHandler_scoresForTopicMapping_query_queryId___block_invoke_4;
    v25[3] = &unk_1E65DA458;
    v25[4] = v23;
    v25[5] = v24;
    [v18 sendBatchedResultForQueryWithName:v19 queryId:v20 batchGenerator:v27 sendError:v26 sendBatch:v25];

    _Block_object_dispose(&buf, 8);
  }
}

void __75__PPTopicReadOnlyServerRequestHandler_scoresForTopicMapping_query_queryId___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 addObject:a2];
  [*(id *)(a1 + 32) addObject:v6];
}

uint64_t __75__PPTopicReadOnlyServerRequestHandler_scoresForTopicMapping_query_queryId___block_invoke_204(uint64_t a1, BOOL *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) count];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  unint64_t v6 = v4 - v5;
  if ((unint64_t)(v4 - v5) >= 0x32) {
    uint64_t v7 = 50;
  }
  else {
    uint64_t v7 = v4 - v5;
  }
  if (v7)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 40) file:@"PPTopicReadOnlyServer.m" lineNumber:327 description:@"Batch size should never be odd"];
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", v5, v7);
  *a2 = v6 < 0x33;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v7;
  return result;
}

uint64_t __75__PPTopicReadOnlyServerRequestHandler_scoresForTopicMapping_query_queryId___block_invoke_2_212(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) scoredMappedTopicBatch:0 isLast:1 error:a2 queryId:*(void *)(a1 + 40) completion:&__block_literal_global_214];
}

uint64_t __75__PPTopicReadOnlyServerRequestHandler_scoresForTopicMapping_query_queryId___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) scoredMappedTopicBatch:a2 isLast:a3 error:0 queryId:*(void *)(a1 + 40) completion:a4];
}

- (void)topicExtractionsFromText:(id)a3 queryId:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    clientProcessName = self->_clientProcessName;
    *(_DWORD *)long long buf = 134218242;
    unint64_t v19 = a4;
    __int16 v20 = 2112;
    id v21 = clientProcessName;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: topicExtractionsFromText queryId:%llu process:%@", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__PPTopicReadOnlyServerRequestHandler_topicExtractionsFromText_queryId___block_invoke;
  v14[3] = &unk_1E65DB808;
  id v10 = v6;
  id v15 = v10;
  v16 = self;
  unint64_t v17 = a4;
  [(PPXPCServerPipelinedBatchQueryManager *)queryManager runConcurrentlyWithRequestThrottle:v14];
  id v11 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_clientProcessName;
    uint64_t v13 = [v10 length];
    *(_DWORD *)long long buf = 134218498;
    unint64_t v19 = a4;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2048;
    uint64_t v23 = v13;
    _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: topicExtractionsFromText queryId:%llu process:%@ text size:%tu", buf, 0x20u);
  }
}

void __72__PPTopicReadOnlyServerRequestHandler_topicExtractionsFromText_queryId___block_invoke(void *a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = pp_topics_signpost_handle();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  uint64_t v4 = pp_topics_signpost_handle();
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPTopicReadOnlyServer.topicExtractionsFromText", "", (uint8_t *)&buf, 2u);
  }

  id v6 = +[PPLocalTopicStore defaultStore];
  uint64_t v7 = a1[4];
  uint64_t v8 = *(void *)(a1[5] + 24);
  id v27 = 0;
  id v9 = [v6 topicExtractionsFromText:v7 clientProcessName:v8 error:&v27];
  id v10 = v27;

  id v11 = pp_topics_signpost_handle();
  v12 = v11;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v11))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v12, OS_SIGNPOST_INTERVAL_END, v3, "PPTopicReadOnlyServer.topicExtractionsFromText", "", (uint8_t *)&buf, 2u);
  }

  uint64_t v13 = pp_xpc_server_log_handle();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v14)
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: topicExtractionsFromText returned an error: %@", (uint8_t *)&buf, 0xCu);
    }

    [*(id *)(a1[5] + 8) topicExtractionsFromTextBatch:0 isLast:1 error:v10 queryId:a1[6] completion:&__block_literal_global_189];
  }
  else
  {
    if (v14)
    {
      uint64_t v15 = [v9 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: topicExtractionsFromText returned %tu results", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = 0;
    v16 = *(void **)(a1[5] + 16);
    unint64_t v17 = (void *)[[NSString alloc] initWithFormat:@"%@-topicExtractionsFromText", *(void *)(a1[5] + 24)];
    uint64_t v18 = a1[6];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __72__PPTopicReadOnlyServerRequestHandler_topicExtractionsFromText_queryId___block_invoke_193;
    v24[3] = &unk_1E65DA408;
    id v25 = v9;
    p_long long buf = &buf;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __72__PPTopicReadOnlyServerRequestHandler_topicExtractionsFromText_queryId___block_invoke_2;
    v21[3] = &unk_1E65DA430;
    uint64_t v19 = a1[6];
    uint64_t v22 = a1[5];
    uint64_t v23 = v19;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __72__PPTopicReadOnlyServerRequestHandler_topicExtractionsFromText_queryId___block_invoke_4;
    v20[3] = &unk_1E65DA458;
    v20[4] = v22;
    v20[5] = v19;
    [v16 sendBatchedResultForQueryWithName:v17 queryId:v18 batchGenerator:v24 sendError:v21 sendBatch:v20];

    _Block_object_dispose(&buf, 8);
  }
}

uint64_t __72__PPTopicReadOnlyServerRequestHandler_topicExtractionsFromText_queryId___block_invoke_193(uint64_t a1, BOOL *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) count];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  unint64_t v6 = v4 - v5;
  if ((unint64_t)(v4 - v5) >= 0x32) {
    uint64_t v7 = 50;
  }
  else {
    uint64_t v7 = v4 - v5;
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:");
  *a2 = v6 < 0x33;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v7;
  return result;
}

uint64_t __72__PPTopicReadOnlyServerRequestHandler_topicExtractionsFromText_queryId___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) topicExtractionsFromTextBatch:0 isLast:1 error:a2 queryId:*(void *)(a1 + 40) completion:&__block_literal_global_195];
}

uint64_t __72__PPTopicReadOnlyServerRequestHandler_topicExtractionsFromText_queryId___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) topicExtractionsFromTextBatch:a2 isLast:a3 error:0 queryId:*(void *)(a1 + 40) completion:a4];
}

- (void)topicRecordsWithQuery:(id)a3 queryId:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    clientProcessName = self->_clientProcessName;
    *(_DWORD *)long long buf = 134218242;
    unint64_t v19 = a4;
    __int16 v20 = 2112;
    id v21 = clientProcessName;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: topicRecordsWithQuery queryId:%llu process:%@", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__PPTopicReadOnlyServerRequestHandler_topicRecordsWithQuery_queryId___block_invoke;
  v14[3] = &unk_1E65DB808;
  id v10 = v6;
  v16 = self;
  unint64_t v17 = a4;
  id v15 = v10;
  [(PPXPCServerPipelinedBatchQueryManager *)queryManager runConcurrentlyWithRequestThrottle:v14];
  id v11 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_clientProcessName;
    uint64_t v13 = [v10 customizedDescription];
    *(_DWORD *)long long buf = 134218498;
    unint64_t v19 = a4;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    uint64_t v23 = v13;
    _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: topicRecordsWithQuery queryId:%llu process:%@ query:%@", buf, 0x20u);
  }
}

void __69__PPTopicReadOnlyServerRequestHandler_topicRecordsWithQuery_queryId___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v2 = pp_topics_signpost_handle();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  uint64_t v4 = pp_topics_signpost_handle();
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPTopicReadOnlyServer.topicRecordsWithQuery", "", buf, 2u);
  }

  unint64_t v6 = [*(id *)(a1 + 32) limit];
  uint64_t v7 = (void *)[*(id *)(a1 + 32) copy];
  [v7 setLimit:-1];
  uint64_t v8 = +[PPLocalTopicStore defaultStore];
  id v36 = 0;
  id v9 = [v8 topicRecordsWithQuery:v7 error:&v36];
  id v10 = v36;

  id v11 = pp_topics_signpost_handle();
  v12 = v11;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v11))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v12, OS_SIGNPOST_INTERVAL_END, v3, "PPTopicReadOnlyServer.topicRecordsWithQuery", "", buf, 2u);
  }

  if (v9)
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 24);
    id v15 = +[PPTopicAllowlist sharedInstance];
    v16 = [v13 filterTopicRecordsNotInAllowlist:v9 withAllowlistOfProcess:v14 allowlist:v15];

    if ([v16 count] > v6)
    {
      uint64_t v17 = objc_msgSend(v16, "subarrayWithRange:", 0, v6);

      v16 = (void *)v17;
    }
    uint64_t v18 = pp_xpc_server_log_handle();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v19)
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v10;
        _os_log_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: topicRecordsWithQuery returned an error: %@", buf, 0xCu);
      }

      [*(id *)(*(void *)(a1 + 40) + 8) topicRecordBatch:0 isLast:1 error:v10 queryId:*(void *)(a1 + 48) completion:&__block_literal_global_180];
    }
    else
    {
      if (v19)
      {
        uint64_t v23 = [v16 count];
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = v23;
        _os_log_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: topicRecordsWithQuery returned %tu results", buf, 0xCu);
      }

      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000;
      id v38 = 0;
      uint64_t v24 = *(void **)(*(void *)(a1 + 40) + 16);
      id v25 = (void *)[[NSString alloc] initWithFormat:@"%@-topicRecordsWithQuery", *(void *)(*(void *)(a1 + 40) + 24)];
      uint64_t v26 = *(void *)(a1 + 48);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __69__PPTopicReadOnlyServerRequestHandler_topicRecordsWithQuery_queryId___block_invoke_184;
      v33[3] = &unk_1E65DA408;
      id v27 = v16;
      id v34 = v27;
      __int16 v35 = buf;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __69__PPTopicReadOnlyServerRequestHandler_topicRecordsWithQuery_queryId___block_invoke_2;
      v30[3] = &unk_1E65DA430;
      uint64_t v28 = *(void *)(a1 + 48);
      uint64_t v31 = *(void *)(a1 + 40);
      uint64_t v32 = v28;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __69__PPTopicReadOnlyServerRequestHandler_topicRecordsWithQuery_queryId___block_invoke_4;
      v29[3] = &unk_1E65DA458;
      v29[4] = v31;
      v29[5] = v28;
      [v24 sendBatchedResultForQueryWithName:v25 queryId:v26 batchGenerator:v33 sendError:v30 sendBatch:v29];

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    __int16 v20 = pp_xpc_server_log_handle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void *)(a1 + 48);
      uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 24);
      *(_DWORD *)long long buf = 134218498;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v22;
      *(_WORD *)&buf[22] = 2112;
      id v38 = v10;
      _os_log_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: topicRecordsWithQuery queryId:%llu process:%@ returned nil result with error: %@", buf, 0x20u);
    }

    [*(id *)(*(void *)(a1 + 40) + 8) topicRecordBatch:0 isLast:1 error:v10 queryId:*(void *)(a1 + 48) completion:&__block_literal_global_177];
  }
}

uint64_t __69__PPTopicReadOnlyServerRequestHandler_topicRecordsWithQuery_queryId___block_invoke_184(uint64_t a1, BOOL *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) count];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  unint64_t v6 = v4 - v5;
  if ((unint64_t)(v4 - v5) >= 0x32) {
    uint64_t v7 = 50;
  }
  else {
    uint64_t v7 = v4 - v5;
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:");
  *a2 = v6 < 0x33;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v7;
  return result;
}

uint64_t __69__PPTopicReadOnlyServerRequestHandler_topicRecordsWithQuery_queryId___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) topicRecordBatch:0 isLast:1 error:a2 queryId:*(void *)(a1 + 40) completion:&__block_literal_global_186];
}

uint64_t __69__PPTopicReadOnlyServerRequestHandler_topicRecordsWithQuery_queryId___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) topicRecordBatch:a2 isLast:a3 error:0 queryId:*(void *)(a1 + 40) completion:a4];
}

- (void)rankedTopicsWithQuery:(id)a3 queryId:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    clientProcessName = self->_clientProcessName;
    *(_DWORD *)long long buf = 134218242;
    unint64_t v18 = a4;
    __int16 v19 = 2112;
    __int16 v20 = clientProcessName;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: rankedTopicsWithQuery queryId:%llu process:%@", buf, 0x16u);
  }

  queryManager = self->_queryManager;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__PPTopicReadOnlyServerRequestHandler_rankedTopicsWithQuery_queryId___block_invoke;
  v14[3] = &unk_1E65DB808;
  void v14[4] = self;
  unint64_t v16 = a4;
  id v10 = v6;
  id v15 = v10;
  [(PPXPCServerPipelinedBatchQueryManager *)queryManager runConcurrentlyWithRequestThrottle:v14];
  id v11 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_clientProcessName;
    uint64_t v13 = [v10 customizedDescription];
    *(_DWORD *)long long buf = 134218498;
    unint64_t v18 = a4;
    __int16 v19 = 2112;
    __int16 v20 = v12;
    __int16 v21 = 2112;
    uint64_t v22 = v13;
    _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: rankedTopicsWithQuery queryId:%llu process:%@ query:%@", buf, 0x20u);
  }
}

void __69__PPTopicReadOnlyServerRequestHandler_rankedTopicsWithQuery_queryId___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v2 = pp_topics_signpost_handle();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  uint64_t v4 = pp_topics_signpost_handle();
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPTopicReadOnlyServer.rankedTopicsWithQuery", "", buf, 2u);
  }

  if (![*(id *)(*(void *)(a1 + 32) + 24) isEqualToString:@"Apple Store"]) {
    goto LABEL_37;
  }
  id v6 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEFAULT, "checking client blocklist on behalf of Apple Store", buf, 2u);
  }

  uint64_t v7 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  int v8 = [v7 containsObject:@"com.apple.store.Jolly"];

  if (v8)
  {
    id v9 = pp_xpc_server_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "refusing connection from Apple Store due to client blocklist", buf, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 8) topicBatch:0 isLast:1 error:0 queryId:*(void *)(a1 + 48) completion:&__block_literal_global_14030];
  }
  else
  {
    if (![*(id *)(*(void *)(a1 + 32) + 24) isEqualToString:@"pptool"]) {
      goto LABEL_18;
    }
LABEL_37:
    id v10 = pp_xpc_server_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "checking client blocklist on behalf of pptool", buf, 2u);
    }

    id v11 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
    int v12 = [v11 containsObject:@"com.apple.proactive.PersonalizationPortrait.pptool"];

    if (v12)
    {
      uint64_t v13 = pp_xpc_server_log_handle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "refusing connection from pptool due to client blocklist", buf, 2u);
      }

      [*(id *)(*(void *)(a1 + 32) + 8) topicBatch:0 isLast:1 error:0 queryId:*(void *)(a1 + 48) completion:&__block_literal_global_156];
    }
    else
    {
LABEL_18:
      unint64_t v14 = [*(id *)(a1 + 40) limit];
      id v15 = (void *)[*(id *)(a1 + 40) copy];
      [v15 setLimit:-1];
      unint64_t v16 = +[PPLocalTopicStore defaultStore];
      id v44 = 0;
      uint64_t v17 = [v16 rankedTopicsWithQuery:v15 error:&v44 clientProcessName:*(void *)(*(void *)(a1 + 32) + 24)];
      id v18 = v44;

      __int16 v19 = pp_topics_signpost_handle();
      __int16 v20 = v19;
      if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v19))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v20, OS_SIGNPOST_INTERVAL_END, v3, "PPTopicReadOnlyServer.rankedTopicsWithQuery", "", buf, 2u);
      }

      if (v17)
      {
        __int16 v21 = objc_opt_class();
        uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 24);
        uint64_t v23 = +[PPTopicAllowlist sharedInstance];
        uint64_t v24 = [v21 filterScoredTopicsNotInAllowlist:v17 withAllowlistOfProcess:v22 allowlist:v23];

        if ([v24 count] > v14)
        {
          uint64_t v25 = objc_msgSend(v24, "subarrayWithRange:", 0, v14);

          uint64_t v24 = (void *)v25;
        }
        uint64_t v26 = pp_xpc_server_log_handle();
        BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
        if (v24)
        {
          if (v27)
          {
            uint64_t v28 = [v24 count];
            *(_DWORD *)long long buf = 134217984;
            *(void *)&uint8_t buf[4] = v28;
            _os_log_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: rankedTopicsWithQuery returned %tu results", buf, 0xCu);
          }

          *(void *)long long buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x2020000000;
          id v46 = 0;
          uint64_t v29 = *(void **)(*(void *)(a1 + 32) + 16);
          uint64_t v30 = (void *)[[NSString alloc] initWithFormat:@"%@-rankedTopicsWithQuery", *(void *)(*(void *)(a1 + 32) + 24)];
          uint64_t v31 = *(void *)(a1 + 48);
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __69__PPTopicReadOnlyServerRequestHandler_rankedTopicsWithQuery_queryId___block_invoke_169;
          v41[3] = &unk_1E65DA408;
          id v32 = v24;
          id v42 = v32;
          v43 = buf;
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          void v38[2] = __69__PPTopicReadOnlyServerRequestHandler_rankedTopicsWithQuery_queryId___block_invoke_2;
          v38[3] = &unk_1E65DA430;
          uint64_t v33 = *(void *)(a1 + 48);
          uint64_t v39 = *(void *)(a1 + 32);
          uint64_t v40 = v33;
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __69__PPTopicReadOnlyServerRequestHandler_rankedTopicsWithQuery_queryId___block_invoke_4;
          v37[3] = &unk_1E65DA458;
          v37[4] = v39;
          v37[5] = v33;
          [v29 sendBatchedResultForQueryWithName:v30 queryId:v31 batchGenerator:v41 sendError:v38 sendBatch:v37];

          _Block_object_dispose(buf, 8);
        }
        else
        {
          if (v27)
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v18;
            _os_log_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer: rankedTopicsWithQuery returned an error: %@", buf, 0xCu);
          }

          [*(id *)(*(void *)(a1 + 32) + 8) topicBatch:0 isLast:1 error:v18 queryId:*(void *)(a1 + 48) completion:&__block_literal_global_164];
        }
      }
      else
      {
        id v34 = pp_xpc_server_log_handle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v35 = *(void *)(a1 + 48);
          uint64_t v36 = *(void *)(*(void *)(a1 + 32) + 24);
          *(_DWORD *)long long buf = 134218498;
          *(void *)&uint8_t buf[4] = v35;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v36;
          *(_WORD *)&buf[22] = 2112;
          id v46 = v18;
          _os_log_impl(&dword_1CA9A8000, v34, OS_LOG_TYPE_DEFAULT, "rankedTopicsWithQuery queryId:%llu process:%@ returned nil result with error: %@", buf, 0x20u);
        }

        [*(id *)(*(void *)(a1 + 32) + 8) topicBatch:0 isLast:1 error:v18 queryId:*(void *)(a1 + 48) completion:&__block_literal_global_160_14038];
      }
    }
  }
}

uint64_t __69__PPTopicReadOnlyServerRequestHandler_rankedTopicsWithQuery_queryId___block_invoke_169(uint64_t a1, BOOL *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) count];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  unint64_t v6 = v4 - v5;
  if ((unint64_t)(v4 - v5) >= 0x32) {
    uint64_t v7 = 50;
  }
  else {
    uint64_t v7 = v4 - v5;
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:");
  *a2 = v6 < 0x33;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v7;
  return result;
}

uint64_t __69__PPTopicReadOnlyServerRequestHandler_rankedTopicsWithQuery_queryId___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) topicBatch:0 isLast:1 error:a2 queryId:*(void *)(a1 + 40) completion:&__block_literal_global_172_14042];
}

uint64_t __69__PPTopicReadOnlyServerRequestHandler_rankedTopicsWithQuery_queryId___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) topicBatch:a2 isLast:a3 error:0 queryId:*(void *)(a1 + 40) completion:a4];
}

- (void)unblockPendingQueries
{
}

- (void)setRemoteObjectProxy:(id)a3
{
}

- (PPTopicReadOnlyServerRequestHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)PPTopicReadOnlyServerRequestHandler;
  v2 = [(PPTopicReadOnlyServerRequestHandler *)&v6 init];
  if (v2)
  {
    os_signpost_id_t v3 = [[PPXPCServerPipelinedBatchQueryManager alloc] initWithPipelineDepth:2 pipelinedCallTimeoutNsec:10000000000 maxConcurrentRequestsPerConnection:4];
    queryManager = v2->_queryManager;
    v2->_queryManager = v3;
  }
  return v2;
}

+ (id)filterQIDDictionary:(id)a3 withAllowlistOfProcess:(id)a4 allowlist:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    if ([v7 count] && !objc_msgSend(v9, "shouldBypassAllowlist:", v8))
    {
      id v11 = [v9 filterTopicDictionary:v7 clientProcess:v8];
      unint64_t v12 = [v11 count];
      unint64_t v13 = [v7 count];
      unint64_t v14 = v7;
      if (v12 < v13)
      {
        uint64_t v15 = [v7 count];
        uint64_t v16 = [v11 count];
        uint64_t v17 = pp_topics_log_handle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 134218498;
          uint64_t v20 = v15 - v16;
          __int16 v21 = 2048;
          uint64_t v22 = [v7 count];
          __int16 v23 = 2112;
          id v24 = v8;
          _os_log_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer filtered out %tu of %tu qid records from mapping due to allowlist for client process \"%@\"", (uint8_t *)&v19, 0x20u);
        }

        unint64_t v14 = v11;
      }
      id v10 = v14;
    }
    else
    {
      id v10 = v7;
    }
  }
  else
  {
    id v10 = (id)MEMORY[0x1E4F1CC08];
  }

  return v10;
}

+ (id)filterTopicRecordsNotInAllowlist:(id)a3 withAllowlistOfProcess:(id)a4 allowlist:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    if ([v7 count] && !objc_msgSend(v9, "shouldBypassAllowlist:", v8))
    {
      id v11 = [v9 indicesOfAllowedTopicsInRecordArray:v7 clientProcess:v8];
      unint64_t v12 = [v11 count];
      if (v12 >= [v7 count])
      {
        id v16 = v7;
      }
      else
      {
        uint64_t v13 = [v7 count];
        uint64_t v14 = [v11 count];
        uint64_t v15 = pp_topics_log_handle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 134218498;
          uint64_t v19 = v13 - v14;
          __int16 v20 = 2048;
          uint64_t v21 = [v7 count];
          __int16 v22 = 2112;
          id v23 = v8;
          _os_log_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer filtered out %tu of %tu topic records due to allowance policy for client process \"%@\"", (uint8_t *)&v18, 0x20u);
        }

        id v16 = [v7 objectsAtIndexes:v11];
      }
      id v10 = v16;
    }
    else
    {
      id v10 = v7;
    }
  }
  else
  {
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

+ (id)filterScoredTopicsNotInAllowlist:(id)a3 withAllowlistOfProcess:(id)a4 allowlist:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    if ([v7 count] && !objc_msgSend(v9, "shouldBypassAllowlist:", v8))
    {
      id v11 = [v9 indicesOfAllowedTopicsInScoredTopicArray:v7 clientProcess:v8];
      unint64_t v12 = [v11 count];
      if (v12 >= [v7 count])
      {
        id v16 = v7;
      }
      else
      {
        uint64_t v13 = [v7 count];
        uint64_t v14 = [v11 count];
        uint64_t v15 = pp_topics_log_handle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 134218498;
          uint64_t v19 = v13 - v14;
          __int16 v20 = 2048;
          uint64_t v21 = [v7 count];
          __int16 v22 = 2112;
          id v23 = v8;
          _os_log_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEFAULT, "PPTopicReadOnlyServer filtered out %tu of %tu scored topic due to allowlist for client process \"%@\"", (uint8_t *)&v18, 0x20u);
        }

        id v16 = [v7 objectsAtIndexes:v11];
      }
      id v10 = v16;
    }
    else
    {
      id v10 = v7;
    }
  }
  else
  {
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

@end