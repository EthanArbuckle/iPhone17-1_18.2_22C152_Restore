@interface FCJSONRecordTreeSource
- (FCContentContext)context;
- (FCJSONRecordTreeSource)initWithContext:(id)a3 jsonRecordSources:(id)a4;
- (NSArray)jsonRecordSources;
- (void)fetchRecordTreeWithRootIDs:(id)a3 branchKeysByRecordType:(id)a4 cachePolicy:(id)a5 completion:(id)a6;
- (void)fetchRecordTreeWithRootIDs:(id)a3 branchKeysByRecordType:(id)a4 cachePolicy:(id)a5 edgeCacheHint:(id)a6 completion:(id)a7;
- (void)setContext:(id)a3;
- (void)setJsonRecordSources:(id)a3;
@end

@implementation FCJSONRecordTreeSource

- (FCJSONRecordTreeSource)initWithContext:(id)a3 jsonRecordSources:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCJSONRecordTreeSource;
  v9 = [(FCJSONRecordTreeSource *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    uint64_t v11 = [v8 copy];
    jsonRecordSources = v10->_jsonRecordSources;
    v10->_jsonRecordSources = (NSArray *)v11;
  }
  return v10;
}

- (void)fetchRecordTreeWithRootIDs:(id)a3 branchKeysByRecordType:(id)a4 cachePolicy:(id)a5 completion:(id)a6
{
}

- (void)fetchRecordTreeWithRootIDs:(id)a3 branchKeysByRecordType:(id)a4 cachePolicy:(id)a5 edgeCacheHint:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = objc_alloc_init(FCRecordChainFetchOperation);
  HIDWORD(v18) = qos_class_self() - 9;
  LODWORD(v18) = HIDWORD(v18);
  uint64_t v19 = 8 * (v18 >> 3) + 9;
  if ((v18 >> 3) >= 4) {
    uint64_t v20 = -1;
  }
  else {
    uint64_t v20 = v19;
  }
  [(FCOperation *)v17 setQualityOfService:v20];
  v21 = [(FCJSONRecordTreeSource *)self context];
  [(FCRecordChainFetchOperation *)v17 setContext:v21];

  v22 = [(FCJSONRecordTreeSource *)self jsonRecordSources];
  [(FCRecordChainFetchOperation *)v17 setAdditionalRecordSources:v22];

  [(FCRecordChainFetchOperation *)v17 setTopLevelRecordIDs:v16];
  [(FCRecordChainFetchOperation *)v17 setLinkKeysByRecordType:v15];

  [(FCRecordChainFetchOperation *)v17 setEdgeCacheHint:v13];
  [(FCRecordChainFetchOperation *)v17 setCachePolicy:v14];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __113__FCJSONRecordTreeSource_fetchRecordTreeWithRootIDs_branchKeysByRecordType_cachePolicy_edgeCacheHint_completion___block_invoke;
  v25[3] = &unk_1E5B4CA60;
  id v26 = v12;
  id v23 = v12;
  [(FCRecordChainFetchOperation *)v17 setRecordChainCompletionHandler:v25];
  v24 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
  [v24 addOperation:v17];
}

void __113__FCJSONRecordTreeSource_fetchRecordTreeWithRootIDs_branchKeysByRecordType_cachePolicy_edgeCacheHint_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v12[1] = MEMORY[0x1E4F143A8];
    v12[2] = 3221225472;
    v12[3] = __113__FCJSONRecordTreeSource_fetchRecordTreeWithRootIDs_branchKeysByRecordType_cachePolicy_edgeCacheHint_completion___block_invoke_2;
    v12[4] = &unk_1E5B4C7C0;
    id v7 = (id *)&v14;
    id v8 = (void (**)(id, void, id))*(id *)(a1 + 32);
    id v14 = v8;
    id v13 = v6;
    v8[2](v8, MEMORY[0x1E4F1CC08], v13);
    v9 = v13;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F1C9E8];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __113__FCJSONRecordTreeSource_fetchRecordTreeWithRootIDs_branchKeysByRecordType_cachePolicy_edgeCacheHint_completion___block_invoke_3;
    v11[3] = &unk_1E5B4BF78;
    id v7 = (id *)v12;
    v12[0] = v5;
    v9 = objc_msgSend(v10, "fc_dictionary:", v11);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __113__FCJSONRecordTreeSource_fetchRecordTreeWithRootIDs_branchKeysByRecordType_cachePolicy_edgeCacheHint_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), MEMORY[0x1E4F1CC08], *(void *)(a1 + 32));
}

void __113__FCJSONRecordTreeSource_fetchRecordTreeWithRootIDs_branchKeysByRecordType_cachePolicy_edgeCacheHint_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 integerValue] == 9)
        {
          v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __113__FCJSONRecordTreeSource_fetchRecordTreeWithRootIDs_branchKeysByRecordType_cachePolicy_edgeCacheHint_completion___block_invoke_4;
          v11[3] = &unk_1E5B4E6C0;
          id v12 = v3;
          [v10 enumerateRecordsAndInterestTokensWithBlock:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

void __113__FCJSONRecordTreeSource_fetchRecordTreeWithRootIDs_branchKeysByRecordType_cachePolicy_edgeCacheHint_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 json];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 base];

  uint64_t v6 = [v5 identifier];
  [v4 setObject:v7 forKeyedSubscript:v6];
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSArray)jsonRecordSources
{
  return self->_jsonRecordSources;
}

- (void)setJsonRecordSources:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonRecordSources, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end