@interface PPSocialHighlightServerRequestHandler
- (NSArray)applicationIdentifiers;
- (NSString)clientProcessName;
- (PPSocialHighlightServerRequestHandler)init;
- (void)attributionForIdentifier:(id)a3 completion:(id)a4;
- (void)decayIntervalWithCompletion:(id)a3;
- (void)feedbackForAttribution:(id)a3 type:(unint64_t)a4 client:(id)a5 variant:(id)a6 completion:(id)a7;
- (void)feedbackForHighlight:(id)a3 type:(unint64_t)a4 client:(id)a5 variant:(id)a6 completion:(id)a7;
- (void)rankedCollaborationsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 queryId:(unint64_t)a6;
- (void)rankedHighlightsForSyncedItems:(id)a3 client:(id)a4 variant:(id)a5 queryId:(unint64_t)a6;
- (void)rankedHighlightsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 queryId:(unint64_t)a6;
- (void)setApplicationIdentifiers:(id)a3;
- (void)setClientProcessName:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
- (void)unblockPendingQueries;
@end

@implementation PPSocialHighlightServerRequestHandler

- (void)setClientProcessName:(id)a3
{
}

- (void)setApplicationIdentifiers:(id)a3
{
}

- (PPSocialHighlightServerRequestHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)PPSocialHighlightServerRequestHandler;
  v2 = [(PPSocialHighlightServerRequestHandler *)&v6 init];
  if (v2)
  {
    v3 = [[PPXPCServerPipelinedBatchQueryManager alloc] initWithPipelineDepth:2 pipelinedCallTimeoutNsec:10000000000 maxConcurrentRequestsPerConnection:4];
    queryManager = v2->_queryManager;
    v2->_queryManager = v3;
  }
  return v2;
}

- (NSArray)applicationIdentifiers
{
  return self->_applicationIdentifiers;
}

- (void)setRemoteObjectProxy:(id)a3
{
}

- (void)rankedHighlightsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 queryId:(unint64_t)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  v12 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219010;
    unint64_t v25 = a3;
    __int16 v26 = 2112;
    id v27 = v10;
    __int16 v28 = 2112;
    id v29 = v11;
    __int16 v30 = 2048;
    unint64_t v31 = a6;
    __int16 v32 = 1024;
    qos_class_t v33 = qos_class_self();
    _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightServer: enqueue rankedHighlightsWithLimit: %tu client: '%@' variant: '%@' queryId: %llu qos: %du", buf, 0x30u);
  }

  if (rankedHighlightsWithLimit_client_variant_queryId___pasOnceToken3 != -1) {
    dispatch_once(&rankedHighlightsWithLimit_client_variant_queryId___pasOnceToken3, &__block_literal_global_252);
  }
  v13 = (void *)rankedHighlightsWithLimit_client_variant_queryId___pasExprOnceResult;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PPSocialHighlightServerRequestHandler_rankedHighlightsWithLimit_client_variant_queryId___block_invoke_2;
  block[3] = &unk_1E65D7FE0;
  id v19 = v10;
  id v20 = v11;
  unint64_t v22 = a3;
  unint64_t v23 = a6;
  v21 = self;
  id v14 = v11;
  id v15 = v10;
  v16 = v13;
  dispatch_block_t v17 = dispatch_block_create((dispatch_block_flags_t)0, block);
  [(PPXPCServerPipelinedBatchQueryManager *)self->_queryManager waitForBlockWithRequestThrottle:v17];
  dispatch_async(v16, v17);
}

void __90__PPSocialHighlightServerRequestHandler_rankedHighlightsWithLimit_client_variant_queryId___block_invoke_2(void *a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v2 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[7];
    uint64_t v6 = a1[8];
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v3;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v32 = v4;
    __int16 v33 = 2048;
    uint64_t v34 = v6;
    __int16 v35 = 1024;
    qos_class_t v36 = qos_class_self();
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightServer: execute rankedHighlightsWithLimit: %tu client: '%@' variant: '%@' queryId: %llu qos: %du", buf, 0x30u);
  }

  v7 = pp_social_highlights_signpost_handle();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  v9 = pp_social_highlights_signpost_handle();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "Server.rankedHighlightsWithLimit", "", buf, 2u);
  }

  id v11 = +[PPLocalSocialHighlightStore defaultStore];
  uint64_t v12 = a1[4];
  uint64_t v13 = a1[5];
  uint64_t v14 = a1[7];
  uint64_t v15 = *(void *)(a1[6] + 32);
  id v30 = 0;
  v16 = [v11 rankedHighlightsWithLimit:v14 client:v12 variant:v13 applicationIdentifiers:v15 error:&v30];
  id v17 = v30;

  v18 = pp_social_highlights_signpost_handle();
  id v19 = v18;
  if (v8 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v19, OS_SIGNPOST_INTERVAL_END, v8, "Server.rankedHighlightsWithLimit", " enableTelemetry=YES ", buf, 2u);
  }

  if (v17)
  {
    [*(id *)(a1[6] + 8) rankedHighlightsBatch:0 isLast:1 error:v17 queryId:a1[8] completion:&__block_literal_global_64];
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    uint64_t v32 = 0;
    id v20 = *(void **)(a1[6] + 16);
    uint64_t v21 = a1[8];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __90__PPSocialHighlightServerRequestHandler_rankedHighlightsWithLimit_client_variant_queryId___block_invoke_2_68;
    v27[3] = &unk_1E65DA408;
    id v28 = v16;
    id v29 = buf;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __90__PPSocialHighlightServerRequestHandler_rankedHighlightsWithLimit_client_variant_queryId___block_invoke_3;
    v24[3] = &unk_1E65DA430;
    uint64_t v22 = a1[8];
    uint64_t v25 = a1[6];
    uint64_t v26 = v22;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __90__PPSocialHighlightServerRequestHandler_rankedHighlightsWithLimit_client_variant_queryId___block_invoke_5;
    v23[3] = &unk_1E65DA458;
    v23[4] = v25;
    v23[5] = v22;
    [v20 sendBatchedResultForQueryWithName:@"rankedHighlightsWithLimit" queryId:v21 batchGenerator:v27 sendError:v24 sendBatch:v23];

    _Block_object_dispose(buf, 8);
  }
}

uint64_t __90__PPSocialHighlightServerRequestHandler_rankedHighlightsWithLimit_client_variant_queryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) rankedHighlightsBatch:a2 isLast:a3 error:0 queryId:*(void *)(a1 + 40) completion:a4];
}

uint64_t __90__PPSocialHighlightServerRequestHandler_rankedHighlightsWithLimit_client_variant_queryId___block_invoke_2_68(uint64_t a1, BOOL *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) count];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  unint64_t v6 = v4 - v5;
  if ((unint64_t)(v4 - v5) >= 0x1F4) {
    uint64_t v7 = 500;
  }
  else {
    uint64_t v7 = v4 - v5;
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:");
  *a2 = v6 < 0x1F5;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v7;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (void)decayIntervalWithCompletion:(id)a3
{
  uint64_t v3 = (void (**)(id, void, double))a3;
  uint64_t v4 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightServer: decayInterval", buf, 2u);
  }

  uint64_t v5 = pp_social_highlights_signpost_handle();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  uint64_t v7 = pp_social_highlights_signpost_handle();
  os_signpost_id_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Server.decayInterval", "", v15, 2u);
  }

  v9 = +[PPConfiguration sharedInstance];
  [v9 socialHighlightDecayInterval];
  double v11 = v10;

  uint64_t v12 = pp_social_highlights_signpost_handle();
  uint64_t v13 = v12;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v6, "Server.decayInterval", " enableTelemetry=YES ", v14, 2u);
  }

  v3[2](v3, 0, v11);
}

- (void)feedbackForAttribution:(id)a3 type:(unint64_t)a4 client:(id)a5 variant:(id)a6 completion:(id)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void (**)(id, uint64_t, void))a7;
  uint64_t v15 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v33 = v11;
    __int16 v34 = 2048;
    unint64_t v35 = a4;
    __int16 v36 = 2112;
    id v37 = v12;
    __int16 v38 = 2112;
    id v39 = v13;
    _os_log_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightServer: feedbackForAttribution: %@ type: %lu client: '%@' variant: '%@'", buf, 0x2Au);
  }

  v16 = pp_social_highlights_signpost_handle();
  os_signpost_id_t v17 = os_signpost_id_generate(v16);

  v18 = pp_social_highlights_signpost_handle();
  id v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "Server.feedbackForAttribution", "", buf, 2u);
  }

  id v20 = +[PPLocalSocialHighlightStore defaultStore];
  id v29 = 0;
  char v21 = [v20 feedbackForAttribution:v11 type:a4 client:v12 variant:v13 error:&v29];
  id v22 = v29;

  unint64_t v23 = pp_social_highlights_signpost_handle();
  v24 = v23;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v24, OS_SIGNPOST_INTERVAL_END, v17, "Server.feedbackForAttribution", " enableTelemetry=YES ", buf, 2u);
  }

  if (v21)
  {
    v14[2](v14, 1, 0);
  }
  else
  {
    id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v30 = @"PPServerSideErrorInfoKey";
    uint64_t v26 = (void *)[[NSString alloc] initWithFormat:@"%@", v22];
    unint64_t v31 = v26;
    id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    id v28 = (void *)[v25 initWithDomain:@"PPServerSideErrorDomain" code:1 userInfo:v27];

    ((void (**)(id, uint64_t, void *))v14)[2](v14, 0, v28);
  }
}

- (void)feedbackForHighlight:(id)a3 type:(unint64_t)a4 client:(id)a5 variant:(id)a6 completion:(id)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void (**)(id, uint64_t, void))a7;
  uint64_t v15 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v33 = v11;
    __int16 v34 = 2048;
    unint64_t v35 = a4;
    __int16 v36 = 2112;
    id v37 = v12;
    __int16 v38 = 2112;
    id v39 = v13;
    _os_log_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightServer: feedbackForHighlight: %@ type: %lu client: '%@' variant: '%@'", buf, 0x2Au);
  }

  v16 = pp_social_highlights_signpost_handle();
  os_signpost_id_t v17 = os_signpost_id_generate(v16);

  v18 = pp_social_highlights_signpost_handle();
  id v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "Server.feedbackForHighlight", "", buf, 2u);
  }

  id v20 = +[PPLocalSocialHighlightStore defaultStore];
  id v29 = 0;
  char v21 = [v20 feedbackForHighlight:v11 type:a4 client:v12 variant:v13 error:&v29];
  id v22 = v29;

  unint64_t v23 = pp_social_highlights_signpost_handle();
  v24 = v23;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v24, OS_SIGNPOST_INTERVAL_END, v17, "Server.feedbackForHighlight", " enableTelemetry=YES ", buf, 2u);
  }

  if (v21)
  {
    v14[2](v14, 1, 0);
  }
  else
  {
    id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v30 = @"PPServerSideErrorInfoKey";
    uint64_t v26 = (void *)[[NSString alloc] initWithFormat:@"%@", v22];
    unint64_t v31 = v26;
    id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    id v28 = (void *)[v25 initWithDomain:@"PPServerSideErrorDomain" code:1 userInfo:v27];

    ((void (**)(id, uint64_t, void *))v14)[2](v14, 0, v28);
  }
}

- (void)attributionForIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_signpost_id_t v6 = (void (**)(id, void *, void))a4;
  uint64_t v7 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v5;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightServer: attributionForIdentifier: %@", buf, 0xCu);
  }

  os_signpost_id_t v8 = pp_social_highlights_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  double v10 = pp_social_highlights_signpost_handle();
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Server.attributionForIdentifier", "", buf, 2u);
  }

  id v12 = +[PPLocalSocialHighlightStore defaultStore];
  id v21 = 0;
  id v13 = [v12 attributionForIdentifier:v5 error:&v21];
  id v14 = v21;

  uint64_t v15 = pp_social_highlights_signpost_handle();
  v16 = v15;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v16, OS_SIGNPOST_INTERVAL_END, v9, "Server.attributionForIdentifier", " enableTelemetry=YES ", buf, 2u);
  }

  if (v13)
  {
    v6[2](v6, v13, 0);
  }
  else
  {
    id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v22 = @"PPServerSideErrorInfoKey";
    v18 = (void *)[[NSString alloc] initWithFormat:@"%@", v14];
    unint64_t v23 = v18;
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v20 = (void *)[v17 initWithDomain:@"PPServerSideErrorDomain" code:1 userInfo:v19];

    ((void (**)(id, void *, void *))v6)[2](v6, 0, v20);
  }
}

- (void)rankedHighlightsForSyncedItems:(id)a3 client:(id)a4 variant:(id)a5 queryId:(unint64_t)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v25 = [v10 count];
    __int16 v26 = 2112;
    id v27 = v11;
    __int16 v28 = 2048;
    unint64_t v29 = a6;
    _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightServer: rankedHighlightsForSyncedItems: %tu client: '%@' queryId: %llu", buf, 0x20u);
  }

  queryManager = self->_queryManager;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __95__PPSocialHighlightServerRequestHandler_rankedHighlightsForSyncedItems_client_variant_queryId___block_invoke;
  v18[3] = &unk_1E65DA228;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v22 = self;
  unint64_t v23 = a6;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [(PPXPCServerPipelinedBatchQueryManager *)queryManager runConcurrentlyWithRequestThrottle:v18];
}

void __95__PPSocialHighlightServerRequestHandler_rankedHighlightsForSyncedItems_client_variant_queryId___block_invoke(void *a1)
{
  v2 = pp_social_highlights_signpost_handle();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  uint64_t v4 = pp_social_highlights_signpost_handle();
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "Server.rankedHighlightsForSyncedItems", "", buf, 2u);
  }

  os_signpost_id_t v6 = +[PPLocalSocialHighlightStore defaultStore];
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  uint64_t v9 = a1[6];
  uint64_t v10 = *(void *)(a1[7] + 32);
  id v29 = 0;
  id v11 = [v6 rankedHighlightsForSyncedItems:v7 client:v8 variant:v9 applicationIdentifiers:v10 error:&v29];
  id v12 = v29;

  id v13 = pp_social_highlights_signpost_handle();
  id v14 = v13;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v14, OS_SIGNPOST_INTERVAL_END, v3, "Server.rankedHighlightsForSyncedItems", " enableTelemetry=YES ", buf, 2u);
  }

  if (v12)
  {
    [*(id *)(a1[7] + 8) rankedHighlightsBatch:0 isLast:1 error:v12 queryId:a1[8] completion:&__block_literal_global_76];
  }
  else
  {
    *(void *)buf = 0;
    __int16 v26 = buf;
    uint64_t v27 = 0x2020000000;
    uint64_t v28 = 0;
    uint64_t v15 = a1[8];
    id v16 = *(void **)(a1[7] + 16);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __95__PPSocialHighlightServerRequestHandler_rankedHighlightsForSyncedItems_client_variant_queryId___block_invoke_2;
    v22[3] = &unk_1E65DA408;
    id v23 = v11;
    v24 = buf;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __95__PPSocialHighlightServerRequestHandler_rankedHighlightsForSyncedItems_client_variant_queryId___block_invoke_3;
    v19[3] = &unk_1E65DA430;
    uint64_t v17 = a1[8];
    uint64_t v20 = a1[7];
    uint64_t v21 = v17;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __95__PPSocialHighlightServerRequestHandler_rankedHighlightsForSyncedItems_client_variant_queryId___block_invoke_5;
    v18[3] = &unk_1E65DA458;
    void v18[4] = v20;
    v18[5] = v17;
    [v16 sendBatchedResultForQueryWithName:@"rankedHighlightsForSyncedItems" queryId:v15 batchGenerator:v22 sendError:v19 sendBatch:v18];

    _Block_object_dispose(buf, 8);
  }
}

uint64_t __95__PPSocialHighlightServerRequestHandler_rankedHighlightsForSyncedItems_client_variant_queryId___block_invoke_2(uint64_t a1, BOOL *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) count];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  unint64_t v6 = v4 - v5;
  if ((unint64_t)(v4 - v5) >= 0x1F4) {
    uint64_t v7 = 500;
  }
  else {
    uint64_t v7 = v4 - v5;
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:");
  *a2 = v6 < 0x1F5;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v7;
  return result;
}

uint64_t __95__PPSocialHighlightServerRequestHandler_rankedHighlightsForSyncedItems_client_variant_queryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) rankedHighlightsBatch:0 isLast:1 error:a2 queryId:*(void *)(a1 + 40) completion:&__block_literal_global_81];
}

uint64_t __95__PPSocialHighlightServerRequestHandler_rankedHighlightsForSyncedItems_client_variant_queryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) rankedHighlightsBatch:a2 isLast:a3 error:0 queryId:*(void *)(a1 + 40) completion:a4];
}

- (void)rankedCollaborationsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 queryId:(unint64_t)a6
{
  applicationIdentifiers = self->_applicationIdentifiers;
  id v11 = a5;
  id v14 = a4;
  id v12 = (NSArray *)[(NSArray *)applicationIdentifiers mutableCopy];
  [(NSArray *)v12 addObject:@"portraitCollaborations"];
  id v13 = self->_applicationIdentifiers;
  self->_applicationIdentifiers = v12;

  [(PPSocialHighlightServerRequestHandler *)self rankedHighlightsWithLimit:a3 client:v14 variant:v11 queryId:a6];
}

uint64_t __90__PPSocialHighlightServerRequestHandler_rankedHighlightsWithLimit_client_variant_queryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) rankedHighlightsBatch:0 isLast:1 error:a2 queryId:*(void *)(a1 + 40) completion:&__block_literal_global_71];
}

void __90__PPSocialHighlightServerRequestHandler_rankedHighlightsWithLimit_client_variant_queryId___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  dispatch_workloop_t v1 = dispatch_workloop_create("rankedHighlightsWithLimit");
  v2 = (void *)rankedHighlightsWithLimit_client_variant_queryId___pasExprOnceResult;
  rankedHighlightsWithLimit_client_variant_queryId___pasExprOnceResult = (uint64_t)v1;
}

- (void)unblockPendingQueries
{
}

@end