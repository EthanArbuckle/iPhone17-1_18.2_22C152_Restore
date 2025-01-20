@interface PPTopicReadOnlyClient
+ (id)sharedInstance;
- (BOOL)rankedTopicsWithQuery:(id)a3 error:(id *)a4 handleBatch:(id)a5;
- (BOOL)scoresForTopicMapping:(id)a3 query:(id)a4 error:(id *)a5 handleBatch:(id)a6;
- (BOOL)topicExtractionsFromText:(id)a3 error:(id *)a4 handleBatch:(id)a5;
- (BOOL)topicRecordsWithQuery:(id)a3 error:(id *)a4 handleBatch:(id)a5;
- (PPTopicReadOnlyClient)init;
- (id)_remoteObjectProxy;
- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)cachePath:(id *)a3;
- (id)topicCacheSandboxExtensionToken:(id *)a3;
- (id)unmapMappedTopicIdentifier:(id)a3 mappingIdentifier:(id)a4 error:(id *)a5;
- (void)_unblockPendingQueries;
- (void)registerFeedback:(id)a3 completion:(id)a4;
- (void)registerUniversalSearchSpotlightFeedback:(id)a3 completion:(id)a4;
- (void)scoredMappedTopicBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7;
- (void)topicBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7;
- (void)topicExtractionsFromTextBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7;
- (void)topicRecordBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7;
@end

@implementation PPTopicReadOnlyClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

- (id)topicCacheSandboxExtensionToken:(id *)a3
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__4332;
  v29 = __Block_byref_object_dispose__4333;
  id v30 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __57__PPTopicReadOnlyClient_topicCacheSandboxExtensionToken___block_invoke;
  v24[3] = &unk_1E550F638;
  v24[4] = &v25;
  v5 = (void *)MEMORY[0x192F975A0](v24, a2);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__4332;
  v22 = __Block_byref_object_dispose__4333;
  id v23 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4332;
  v16 = __Block_byref_object_dispose__4333;
  id v17 = 0;
  v6 = [(PPTopicReadOnlyClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__PPTopicReadOnlyClient_topicCacheSandboxExtensionToken___block_invoke_2;
  v11[3] = &unk_1E550E850;
  v11[4] = &v18;
  v11[5] = &v12;
  [v6 topicCacheSandboxExtensionToken:v11];

  if (a3)
  {
    v7 = (void *)v13[5];
    if (v7) {
      *a3 = v7;
    }
  }
  if (a3 && (v8 = (void *)v26[5]) != 0)
  {
    id v9 = 0;
    *a3 = v8;
  }
  else
  {
    id v9 = (id)v19[5];
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v25, 8);

  return v9;
}

void __57__PPTopicReadOnlyClient_topicCacheSandboxExtensionToken___block_invoke(uint64_t a1, void *a2)
{
}

void __57__PPTopicReadOnlyClient_topicCacheSandboxExtensionToken___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (id)cachePath:(id *)a3
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__4332;
  v29 = __Block_byref_object_dispose__4333;
  id v30 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __35__PPTopicReadOnlyClient_cachePath___block_invoke;
  v24[3] = &unk_1E550F638;
  v24[4] = &v25;
  v5 = (void *)MEMORY[0x192F975A0](v24, a2);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__4332;
  v22 = __Block_byref_object_dispose__4333;
  id v23 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4332;
  v16 = __Block_byref_object_dispose__4333;
  id v17 = 0;
  id v6 = [(PPTopicReadOnlyClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __35__PPTopicReadOnlyClient_cachePath___block_invoke_2;
  v11[3] = &unk_1E550E850;
  v11[4] = &v18;
  v11[5] = &v12;
  [v6 cachePath:v11];

  if (a3)
  {
    id v7 = (void *)v13[5];
    if (v7) {
      *a3 = v7;
    }
  }
  if (a3 && (v8 = (void *)v26[5]) != 0)
  {
    id v9 = 0;
    *a3 = v8;
  }
  else
  {
    id v9 = (id)v19[5];
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v25, 8);

  return v9;
}

void __35__PPTopicReadOnlyClient_cachePath___block_invoke(uint64_t a1, void *a2)
{
}

void __35__PPTopicReadOnlyClient_cachePath___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (void)registerUniversalSearchSpotlightFeedback:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PPTopicReadOnlyClient *)self _remoteObjectProxy];
  [v8 registerUniversalSearchSpotlightFeedback:v7 completion:v6];
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PPTopicReadOnlyClient *)self _remoteObjectProxy];
  [v8 registerFeedback:v7 completion:v6];
}

- (id)unmapMappedTopicIdentifier:(id)a3 mappingIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__4332;
  v34 = __Block_byref_object_dispose__4333;
  id v35 = 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __76__PPTopicReadOnlyClient_unmapMappedTopicIdentifier_mappingIdentifier_error___block_invoke;
  v29[3] = &unk_1E550F638;
  v29[4] = &v30;
  v10 = (void *)MEMORY[0x192F975A0](v29);
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__4332;
  uint64_t v27 = __Block_byref_object_dispose__4333;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__4332;
  v21 = __Block_byref_object_dispose__4333;
  id v22 = 0;
  v11 = [(PPTopicReadOnlyClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v10];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__PPTopicReadOnlyClient_unmapMappedTopicIdentifier_mappingIdentifier_error___block_invoke_2;
  v16[3] = &unk_1E550E828;
  v16[4] = &v23;
  v16[5] = &v17;
  [v11 unmapMappedTopicIdentifier:v8 mappingIdentifier:v9 completion:v16];

  if (a5)
  {
    uint64_t v12 = (void *)v18[5];
    if (v12) {
      *a5 = v12;
    }
  }
  if (a5 && (v13 = (void *)v31[5]) != 0)
  {
    id v14 = 0;
    *a5 = v13;
  }
  else
  {
    id v14 = (id)v24[5];
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v30, 8);

  return v14;
}

void __76__PPTopicReadOnlyClient_unmapMappedTopicIdentifier_mappingIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __76__PPTopicReadOnlyClient_unmapMappedTopicIdentifier_mappingIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (BOOL)scoresForTopicMapping:(id)a3 query:(id)a4 error:(id *)a5 handleBatch:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  queryManager = self->_queryManager;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __71__PPTopicReadOnlyClient_scoresForTopicMapping_query_error_handleBatch___block_invoke;
  v26[3] = &unk_1E550F460;
  v26[4] = self;
  id v27 = v11;
  id v28 = v12;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __71__PPTopicReadOnlyClient_scoresForTopicMapping_query_error_handleBatch___block_invoke_2;
  v21[3] = &unk_1E550E800;
  SEL v23 = a2;
  uint64_t v24 = v14;
  uint64_t v25 = v15;
  v21[4] = self;
  id v22 = v13;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  LOBYTE(a5) = [(PPXPCClientPipelinedBatchQueryManager *)queryManager syncExecuteQueryWithName:@"scoresForTopicMapping" error:a5 queryInitializer:v26 handleBatch:v21];

  return (char)a5;
}

void __71__PPTopicReadOnlyClient_scoresForTopicMapping_query_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v4 scoresForTopicMapping:*(void *)(a1 + 40) query:*(void *)(a1 + 48) queryId:a2];
}

void __71__PPTopicReadOnlyClient_scoresForTopicMapping_query_error_handleBatch___block_invoke_2(void *a1, void *a2)
{
  id v11 = a2;
  if ([v11 count])
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a1[6] object:a1[4] file:@"PPTopicReadOnlyClient.m" lineNumber:213 description:@"scoresForTopicMapping unexpectedly received batch size with odd length"];
  }
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", (unint64_t)objc_msgSend(v11, "count") >> 1);
  if ((unint64_t)[v11 count] >= 2)
  {
    unint64_t v4 = 1;
    do
    {
      v5 = (void *)MEMORY[0x192F97350]();
      id v6 = [v11 objectAtIndexedSubscript:v4 - 1];
      id v7 = [v11 objectAtIndexedSubscript:v4];
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_isKindOfClass() & 1) == 0)
      {
        id v9 = [MEMORY[0x1E4F28B00] currentHandler];
        [v9 handleFailureInMethod:a1[6] object:a1[4] file:@"PPTopicReadOnlyClient.m" lineNumber:220 description:@"scoresForTopicMapping unexpectedly received incorrectly typed batch content"];
      }
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v6 second:v7];
      [v3 addObject:v8];

      v4 += 2;
    }
    while (v4 < [v11 count]);
  }
  (*(void (**)(void))(a1[5] + 16))();
}

- (BOOL)topicExtractionsFromText:(id)a3 error:(id *)a4 handleBatch:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_opt_class();
  queryManager = self->_queryManager;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __68__PPTopicReadOnlyClient_topicExtractionsFromText_error_handleBatch___block_invoke;
  v19[3] = &unk_1E550F4B0;
  v19[4] = self;
  id v20 = v8;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__PPTopicReadOnlyClient_topicExtractionsFromText_error_handleBatch___block_invoke_2;
  v15[3] = &unk_1E550F4D8;
  id v17 = v9;
  uint64_t v18 = v10;
  v16 = @"topicExtractionsForText";
  id v12 = v9;
  id v13 = v8;
  LOBYTE(a4) = [(PPXPCClientPipelinedBatchQueryManager *)queryManager syncExecuteQueryWithName:@"topicExtractionsForText" error:a4 queryInitializer:v19 handleBatch:v15];

  return (char)a4;
}

void __68__PPTopicReadOnlyClient_topicExtractionsFromText_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v4 topicExtractionsFromText:*(void *)(a1 + 40) queryId:a2];
}

void __68__PPTopicReadOnlyClient_topicExtractionsFromText_error_handleBatch___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:v5 forQueryName:v3 hasExpectedContainedType:v4];
  (*(void (**)(void))(a1[5] + 16))();
}

- (BOOL)topicRecordsWithQuery:(id)a3 error:(id *)a4 handleBatch:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_opt_class();
  queryManager = self->_queryManager;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__PPTopicReadOnlyClient_topicRecordsWithQuery_error_handleBatch___block_invoke;
  v19[3] = &unk_1E550F4B0;
  v19[4] = self;
  id v20 = v8;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__PPTopicReadOnlyClient_topicRecordsWithQuery_error_handleBatch___block_invoke_2;
  v15[3] = &unk_1E550F4D8;
  id v17 = v9;
  uint64_t v18 = v10;
  v16 = @"topicRecordsWithQuery";
  id v12 = v9;
  id v13 = v8;
  LOBYTE(a4) = [(PPXPCClientPipelinedBatchQueryManager *)queryManager syncExecuteQueryWithName:@"topicRecordsWithQuery" error:a4 queryInitializer:v19 handleBatch:v15];

  return (char)a4;
}

void __65__PPTopicReadOnlyClient_topicRecordsWithQuery_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v4 topicRecordsWithQuery:*(void *)(a1 + 40) queryId:a2];
}

void __65__PPTopicReadOnlyClient_topicRecordsWithQuery_error_handleBatch___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:v5 forQueryName:v3 hasExpectedContainedType:v4];
  (*(void (**)(void))(a1[5] + 16))();
}

- (BOOL)rankedTopicsWithQuery:(id)a3 error:(id *)a4 handleBatch:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_opt_class();
  queryManager = self->_queryManager;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__PPTopicReadOnlyClient_rankedTopicsWithQuery_error_handleBatch___block_invoke;
  v19[3] = &unk_1E550F4B0;
  v19[4] = self;
  id v20 = v8;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__PPTopicReadOnlyClient_rankedTopicsWithQuery_error_handleBatch___block_invoke_2;
  v15[3] = &unk_1E550F4D8;
  id v17 = v9;
  uint64_t v18 = v10;
  v16 = @"rankedTopicsWithQuery";
  id v12 = v9;
  id v13 = v8;
  LOBYTE(a4) = [(PPXPCClientPipelinedBatchQueryManager *)queryManager syncExecuteQueryWithName:@"rankedTopicsWithQuery" error:a4 queryInitializer:v19 handleBatch:v15];

  return (char)a4;
}

void __65__PPTopicReadOnlyClient_rankedTopicsWithQuery_error_handleBatch___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v4 rankedTopicsWithQuery:*(void *)(a1 + 40) queryId:a2];
}

void __65__PPTopicReadOnlyClient_rankedTopicsWithQuery_error_handleBatch___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  +[PPXPCClientPipelinedBatchQueryManager assertBatch:v5 forQueryName:v3 hasExpectedContainedType:v4];
  (*(void (**)(void))(a1[5] + 16))();
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return [(PPXPCClientHelper *)self->_clientHelper synchronousRemoteObjectProxyWithErrorHandler:a3];
}

- (id)_remoteObjectProxy
{
  return [(PPXPCClientHelper *)self->_clientHelper remoteObjectProxy];
}

- (void)scoredMappedTopicBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
}

- (void)topicExtractionsFromTextBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
}

- (void)topicRecordBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
}

- (void)topicBatch:(id)a3 isLast:(BOOL)a4 error:(id)a5 queryId:(unint64_t)a6 completion:(id)a7
{
}

- (void)_unblockPendingQueries
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[[NSString alloc] initWithFormat:@"connection to %@ was unexpectedly terminated", @"com.apple.proactive.PersonalizationPortrait.Topic.readOnly"];
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v5 = *MEMORY[0x1E4F28798];
  uint64_t v8 = *MEMORY[0x1E4F28588];
  v9[0] = v3;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v7 = (void *)[v4 initWithDomain:v5 code:5 userInfo:v6];

  [(PPXPCClientPipelinedBatchQueryManager *)self->_queryManager cancelPendingQueriesWithError:v7];
}

- (PPTopicReadOnlyClient)init
{
  v37.receiver = self;
  v37.super_class = (Class)PPTopicReadOnlyClient;
  v2 = [(PPTopicReadOnlyClient *)&v37 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA7AA68];
    id v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA73538];
    uint64_t v5 = (void *)MEMORY[0x192F97350]();
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    [v4 setClasses:v8 forSelector:sel_topicBatch_isLast_error_queryId_completion_ argumentIndex:0 ofReply:0];

    id v9 = (void *)MEMORY[0x192F97350]();
    id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v11 = objc_opt_class();
    id v12 = objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
    [v4 setClasses:v12 forSelector:sel_topicRecordBatch_isLast_error_queryId_completion_ argumentIndex:0 ofReply:0];

    id v13 = (void *)MEMORY[0x192F97350]();
    id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "initWithObjects:", v15, objc_opt_class(), 0);
    [v4 setClasses:v16 forSelector:sel_topicExtractionsFromTextBatch_isLast_error_queryId_completion_ argumentIndex:0 ofReply:0];

    id v17 = (void *)MEMORY[0x192F97350]();
    id v18 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v18, "initWithObjects:", v19, v20, objc_opt_class(), 0);
    [v4 setClasses:v21 forSelector:sel_scoredMappedTopicBatch_isLast_error_queryId_completion_ argumentIndex:0 ofReply:0];

    id location = 0;
    objc_initWeak(&location, v2);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __29__PPTopicReadOnlyClient_init__block_invoke;
    v34[3] = &unk_1E550F488;
    objc_copyWeak(&v35, &location);
    id v22 = (void *)MEMORY[0x192F975A0](v34);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __29__PPTopicReadOnlyClient_init__block_invoke_96;
    v32[3] = &unk_1E550F488;
    objc_copyWeak(&v33, &location);
    SEL v23 = (void *)MEMORY[0x192F975A0](v32);
    uint64_t v24 = [[PPXPCClientHelper alloc] initWithServiceName:@"com.apple.proactive.PersonalizationPortrait.Topic.readOnly" allowedServerInterface:v3 allowedClientInterface:v4 clientExportedObject:v2 interruptionHandler:v22 invalidationHandler:v23];
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = v24;

    v26 = [PPXPCClientPipelinedBatchQueryManager alloc];
    id v27 = (objc_class *)objc_opt_class();
    id v28 = NSStringFromClass(v27);
    uint64_t v29 = [(PPXPCClientPipelinedBatchQueryManager *)v26 initWithName:v28];
    queryManager = v2->_queryManager;
    v2->_queryManager = (PPXPCClientPipelinedBatchQueryManager *)v29;

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __29__PPTopicReadOnlyClient_init__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    uint64_t v5 = @"com.apple.proactive.PersonalizationPortrait.Topic.readOnly";
    _os_log_error_impl(&dword_18CAA6000, v2, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _unblockPendingQueries];
}

void __29__PPTopicReadOnlyClient_init__block_invoke_96(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = pp_xpc_client_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = @"com.apple.proactive.PersonalizationPortrait.Topic.readOnly";
    _os_log_impl(&dword_18CAA6000, v2, OS_LOG_TYPE_INFO, "Connection to %@ invalidated.", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _unblockPendingQueries];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PPTopicReadOnlyClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken12_4409 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken12_4409, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_4410;
  return v2;
}

void __39__PPTopicReadOnlyClient_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_4410;
  sharedInstance__pasExprOnceResult_4410 = v1;
}

@end