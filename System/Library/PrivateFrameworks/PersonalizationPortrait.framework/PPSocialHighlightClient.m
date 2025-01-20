@interface PPSocialHighlightClient
+ (id)sharedInstance;
- (BOOL)rankedCollaborationsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 error:(id *)a6 handleBatch:(id)a7;
- (BOOL)rankedHighlightsForSyncedItems:(id)a3 client:(id)a4 variant:(id)a5 error:(id *)a6 handleBatch:(id)a7;
- (BOOL)rankedHighlightsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 error:(id *)a6 handleBatch:(id)a7;
- (PPSocialHighlightClient)init;
- (double)decayInterval;
- (id)_internalRemoteObjectProxy;
- (id)_remoteObjectProxy;
- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)attributionForIdentifier:(id)a3 error:(id *)a4;
- (void)_unblockPendingQueries;
- (void)feedbackForAttribution:(id)a3 type:(unint64_t)a4 client:(id)a5 variant:(id)a6 completion:(id)a7;
- (void)feedbackForHighlight:(id)a3 type:(unint64_t)a4 client:(id)a5 variant:(id)a6 completion:(id)a7;
- (void)rankedHighlightsBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7;
@end

@implementation PPSocialHighlightClient

void __31__PPSocialHighlightClient_init__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    v5 = @"com.apple.proactive.PersonalizationPortrait.SocialHighlight";
    _os_log_error_impl(&dword_18CAA6000, v2, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _unblockPendingQueries];
}

- (void)_unblockPendingQueries
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)[[NSString alloc] initWithFormat:@"connection to %@ was unexpectedly terminated", @"com.apple.proactive.PersonalizationPortrait.SocialHighlight"];
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v5 = *MEMORY[0x1E4F28798];
  uint64_t v8 = *MEMORY[0x1E4F28588];
  v9[0] = v3;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v7 = (void *)[v4 initWithDomain:v5 code:5 userInfo:v6];

  [(PPXPCClientPipelinedBatchQueryManager *)self->_queryManager cancelPendingQueriesWithError:v7];
}

- (PPSocialHighlightClient)init
{
  v24.receiver = self;
  v24.super_class = (Class)PPSocialHighlightClient;
  v2 = [(PPSocialHighlightClient *)&v24 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA7A9A8];
    id v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA71670];
    uint64_t v5 = (void *)MEMORY[0x192F97350]();
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    [v4 setClasses:v8 forSelector:sel_rankedHighlightsBatch_isLast_error_queryId_completion_ argumentIndex:0 ofReply:0];

    id location = 0;
    objc_initWeak(&location, v2);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __31__PPSocialHighlightClient_init__block_invoke;
    v21[3] = &unk_1E550F488;
    objc_copyWeak(&v22, &location);
    v9 = (void *)MEMORY[0x192F975A0](v21);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __31__PPSocialHighlightClient_init__block_invoke_81;
    v19[3] = &unk_1E550F488;
    objc_copyWeak(&v20, &location);
    v10 = (void *)MEMORY[0x192F975A0](v19);
    v11 = [[PPXPCClientHelper alloc] initWithServiceName:@"com.apple.proactive.PersonalizationPortrait.SocialHighlight" allowedServerInterface:v3 allowedClientInterface:v4 clientExportedObject:v2 interruptionHandler:v9 invalidationHandler:v10];
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = v11;

    v13 = [PPXPCClientPipelinedBatchQueryManager alloc];
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    uint64_t v16 = [(PPXPCClientPipelinedBatchQueryManager *)v13 initWithName:v15];
    queryManager = v2->_queryManager;
    v2->_queryManager = (PPXPCClientPipelinedBatchQueryManager *)v16;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __86__PPSocialHighlightClient_rankedHighlightsWithLimit_client_variant_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v4 rankedHighlightsWithLimit:*(void *)(a1 + 56) client:*(void *)(a1 + 40) variant:*(void *)(a1 + 48) queryId:a2];
}

- (id)_remoteObjectProxy
{
  return [(PPXPCClientHelper *)self->_clientHelper remoteObjectProxy];
}

- (void)rankedHighlightsBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  v15 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_debug_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEBUG, "rankedHighlightsBatch called", v16, 2u);
  }

  [(PPXPCClientPipelinedBatchQueryManager *)self->_queryManager handleReplyWithName:@"rankedHighlightsBatch" batch:v14 isLast:v9 error:v13 queryId:a6 completion:v12];
}

void __86__PPSocialHighlightClient_rankedHighlightsWithLimit_client_variant_error_handleBatch___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:v5 forQueryName:v3 hasExpectedContainedType:v4];
  (*(void (**)(void))(a1[5] + 16))();
}

- (BOOL)rankedHighlightsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 error:(id *)a6 handleBatch:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v15 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEBUG, "rankedHighlightsWithLimit called", buf, 2u);
  }

  uint64_t v16 = objc_opt_class();
  queryManager = self->_queryManager;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __86__PPSocialHighlightClient_rankedHighlightsWithLimit_client_variant_error_handleBatch___block_invoke;
  v27[3] = &unk_1E550E438;
  v27[4] = self;
  id v28 = v12;
  id v29 = v13;
  unint64_t v30 = a3;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __86__PPSocialHighlightClient_rankedHighlightsWithLimit_client_variant_error_handleBatch___block_invoke_2;
  v23[3] = &unk_1E550F4D8;
  id v25 = v14;
  uint64_t v26 = v16;
  objc_super v24 = @"rankedHighlightsWithLimit";
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  BOOL v21 = [(PPXPCClientPipelinedBatchQueryManager *)queryManager syncExecuteQueryWithName:@"rankedHighlightsWithLimit" error:a6 queryInitializer:v27 handleBatch:v23];

  return v21;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PPSocialHighlightClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_2916;
  return v2;
}

void __41__PPSocialHighlightClient_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_2916;
  sharedInstance__pasExprOnceResult_2916 = v1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

- (void)feedbackForAttribution:(id)a3 type:(unint64_t)a4 client:(id)a5 variant:(id)a6 completion:(id)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138413058;
    id v21 = v12;
    __int16 v22 = 2048;
    unint64_t v23 = a4;
    __int16 v24 = 2112;
    id v25 = v13;
    __int16 v26 = 2112;
    id v27 = v14;
    _os_log_impl(&dword_18CAA6000, v16, OS_LOG_TYPE_DEFAULT, "Received feedback for attribution: %@ with type: %lu from client: '%@' variant: '%@'", (uint8_t *)&v20, 0x2Au);
  }

  if (v15) {
    v17 = v15;
  }
  else {
    v17 = &__block_literal_global_112;
  }
  id v18 = (void *)MEMORY[0x192F975A0](v17);

  id v19 = [(PPSocialHighlightClient *)self _remoteObjectProxy];
  [v19 feedbackForAttribution:v12 type:a4 client:v13 variant:v14 completion:v18];
}

- (void)feedbackForHighlight:(id)a3 type:(unint64_t)a4 client:(id)a5 variant:(id)a6 completion:(id)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138413058;
    id v21 = v12;
    __int16 v22 = 2048;
    unint64_t v23 = a4;
    __int16 v24 = 2112;
    id v25 = v13;
    __int16 v26 = 2112;
    id v27 = v14;
    _os_log_impl(&dword_18CAA6000, v16, OS_LOG_TYPE_DEFAULT, "Received feedback for highlight: %@ with type: %lu from client: '%@' variant: '%@'", (uint8_t *)&v20, 0x2Au);
  }

  if (v15) {
    v17 = v15;
  }
  else {
    v17 = &__block_literal_global_2855;
  }
  id v18 = (void *)MEMORY[0x192F975A0](v17);

  id v19 = [(PPSocialHighlightClient *)self _remoteObjectProxy];
  [v19 feedbackForHighlight:v12 type:a4 client:v13 variant:v14 completion:v18];
}

- (id)attributionForIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  unint64_t v23 = __Block_byref_object_copy__2857;
  __int16 v24 = __Block_byref_object_dispose__2858;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2857;
  id v18 = __Block_byref_object_dispose__2858;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__PPSocialHighlightClient_attributionForIdentifier_error___block_invoke;
  v13[3] = &unk_1E550E5F8;
  v13[4] = &v20;
  v13[5] = &v14;
  uint64_t v7 = (void *)MEMORY[0x192F975A0](v13);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__PPSocialHighlightClient_attributionForIdentifier_error___block_invoke_2;
  v12[3] = &unk_1E550E488;
  v12[4] = &v20;
  v12[5] = &v14;
  uint64_t v8 = (void *)MEMORY[0x192F975A0](v12);
  BOOL v9 = [(PPSocialHighlightClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v7];
  [v9 attributionForIdentifier:v6 completion:v8];

  if (a4) {
    *a4 = (id) v15[5];
  }
  id v10 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __58__PPSocialHighlightClient_attributionForIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __58__PPSocialHighlightClient_attributionForIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)rankedHighlightsForSyncedItems:(id)a3 client:(id)a4 variant:(id)a5 error:(id *)a6 handleBatch:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18CAA6000, v16, OS_LOG_TYPE_DEBUG, "rankedHighlightsForSyncedItems called", buf, 2u);
  }

  uint64_t v17 = objc_opt_class();
  queryManager = self->_queryManager;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __91__PPSocialHighlightClient_rankedHighlightsForSyncedItems_client_variant_error_handleBatch___block_invoke;
  v29[3] = &unk_1E550E460;
  v29[4] = self;
  id v30 = v12;
  id v31 = v13;
  id v32 = v14;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __91__PPSocialHighlightClient_rankedHighlightsForSyncedItems_client_variant_error_handleBatch___block_invoke_2;
  v25[3] = &unk_1E550F4D8;
  id v27 = v15;
  uint64_t v28 = v17;
  __int16 v26 = @"rankedHighlightsForSyncedItems";
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  BOOL v23 = [(PPXPCClientPipelinedBatchQueryManager *)queryManager syncExecuteQueryWithName:@"rankedHighlightsForSyncedItems" error:a6 queryInitializer:v29 handleBatch:v25];

  return v23;
}

void __91__PPSocialHighlightClient_rankedHighlightsForSyncedItems_client_variant_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v4 rankedHighlightsForSyncedItems:*(void *)(a1 + 40) client:*(void *)(a1 + 48) variant:*(void *)(a1 + 56) queryId:a2];
}

void __91__PPSocialHighlightClient_rankedHighlightsForSyncedItems_client_variant_error_handleBatch___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:v5 forQueryName:v3 hasExpectedContainedType:v4];
  (*(void (**)(void))(a1[5] + 16))();
}

- (BOOL)rankedCollaborationsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 error:(id *)a6 handleBatch:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEBUG, "rankedCollaborationsWithLimit called", buf, 2u);
  }

  uint64_t v16 = objc_opt_class();
  queryManager = self->_queryManager;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __90__PPSocialHighlightClient_rankedCollaborationsWithLimit_client_variant_error_handleBatch___block_invoke;
  v27[3] = &unk_1E550E438;
  v27[4] = self;
  id v28 = v12;
  id v29 = v13;
  unint64_t v30 = a3;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __90__PPSocialHighlightClient_rankedCollaborationsWithLimit_client_variant_error_handleBatch___block_invoke_2;
  v23[3] = &unk_1E550F4D8;
  id v25 = v14;
  uint64_t v26 = v16;
  __int16 v24 = @"rankedCollaborationsWithLimit";
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  BOOL v21 = [(PPXPCClientPipelinedBatchQueryManager *)queryManager syncExecuteQueryWithName:@"rankedCollaborationsWithLimit" error:a6 queryInitializer:v27 handleBatch:v23];

  return v21;
}

void __90__PPSocialHighlightClient_rankedCollaborationsWithLimit_client_variant_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _internalRemoteObjectProxy];
  [v4 rankedCollaborationsWithLimit:*(void *)(a1 + 56) client:*(void *)(a1 + 40) variant:*(void *)(a1 + 48) queryId:a2];
}

void __90__PPSocialHighlightClient_rankedCollaborationsWithLimit_client_variant_error_handleBatch___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:v5 forQueryName:v3 hasExpectedContainedType:v4];
  (*(void (**)(void))(a1[5] + 16))();
}

- (double)decayInterval
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18CAA6000, v3, OS_LOG_TYPE_DEBUG, "decayInterval called", buf, 2u);
  }

  *(void *)buf = 0;
  id v22 = buf;
  uint64_t v23 = 0x3032000000;
  __int16 v24 = __Block_byref_object_copy__2857;
  id v25 = __Block_byref_object_dispose__2858;
  id v26 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__2857;
  id v19 = __Block_byref_object_dispose__2858;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __40__PPSocialHighlightClient_decayInterval__block_invoke;
  v14[3] = &unk_1E550F638;
  v14[4] = &v15;
  uint64_t v4 = (void *)MEMORY[0x192F975A0](v14);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __40__PPSocialHighlightClient_decayInterval__block_invoke_2;
  v13[3] = &unk_1E550E410;
  v13[4] = buf;
  v13[5] = &v15;
  id v5 = (void *)MEMORY[0x192F975A0](v13);
  id v6 = [(PPSocialHighlightClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v4];
  [v6 decayIntervalWithCompletion:v5];

  uint64_t v7 = (void *)*((void *)v22 + 5);
  if (v7) {
    goto LABEL_7;
  }
  uint64_t v8 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = v16[5];
    *(_DWORD *)id v27 = 138412290;
    uint64_t v28 = v12;
    _os_log_error_impl(&dword_18CAA6000, v8, OS_LOG_TYPE_ERROR, "PPSocialHighlightClient: failed to fetch decay interval: %@", v27, 0xCu);
  }

  uint64_t v7 = (void *)*((void *)v22 + 5);
  if (v7)
  {
LABEL_7:
    [v7 doubleValue];
    double v10 = v9;
  }
  else
  {
    double v10 = 31536000.0;
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(buf, 8);

  return v10;
}

void __40__PPSocialHighlightClient_decayInterval__block_invoke(uint64_t a1, void *a2)
{
}

void __40__PPSocialHighlightClient_decayInterval__block_invoke_2(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  uint64_t v6 = [NSNumber numberWithDouble:a3];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return [(PPXPCClientHelper *)self->_clientHelper synchronousRemoteObjectProxyWithErrorHandler:a3];
}

- (id)_internalRemoteObjectProxy
{
  return [(PPXPCClientHelper *)self->_clientHelper remoteObjectProxy];
}

void __31__PPSocialHighlightClient_init__block_invoke_81(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = @"com.apple.proactive.PersonalizationPortrait.SocialHighlight";
    _os_log_impl(&dword_18CAA6000, v2, OS_LOG_TYPE_INFO, "Connection to %@ invalidated.", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _unblockPendingQueries];
}

@end