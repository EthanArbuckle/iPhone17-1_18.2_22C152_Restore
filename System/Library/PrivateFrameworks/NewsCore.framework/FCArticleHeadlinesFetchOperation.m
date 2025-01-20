@interface FCArticleHeadlinesFetchOperation
- (BOOL)overrideArticleCachePolicy;
- (BOOL)overrideTagCachePolicy;
- (BOOL)shouldFilterHeadlinesWithoutSourceChannels;
- (FCArticleHeadlinesFetchOperation)init;
- (FCArticleHeadlinesFetchOperation)initWithContext:(id)a3 articleIDs:(id)a4 ignoreCacheForArticleIDs:(id)a5;
- (FCContentContext)context;
- (FCCoreConfiguration)configuration;
- (NSArray)articleIDs;
- (NSArray)ignoreCacheForArticleIDs;
- (NSArray)resultHeadlines;
- (double)articleMaximumCachedAge;
- (double)tagMaximumCachedAge;
- (id)determineAppropriateFetchStepsWithCompletion:(id)a3;
- (id)fetchConfigWithCompletion:(id)a3;
- (id)fetchRecordsWithCompletion:(id)a3;
- (id)interestTokenHandler;
- (unint64_t)articleCachePolicy;
- (unint64_t)tagCachePolicy;
- (void)setArticleCachePolicy:(unint64_t)a3;
- (void)setArticleIDs:(id)a3;
- (void)setArticleMaximumCachedAge:(double)a3;
- (void)setConfiguration:(id)a3;
- (void)setContext:(id)a3;
- (void)setIgnoreCacheForArticleIDs:(id)a3;
- (void)setInterestTokenHandler:(id)a3;
- (void)setOverrideArticleCachePolicy:(BOOL)a3;
- (void)setOverrideTagCachePolicy:(BOOL)a3;
- (void)setResultHeadlines:(id)a3;
- (void)setShouldFilterHeadlinesWithoutSourceChannels:(BOOL)a3;
- (void)setTagCachePolicy:(unint64_t)a3;
- (void)setTagMaximumCachedAge:(double)a3;
@end

@implementation FCArticleHeadlinesFetchOperation

- (FCArticleHeadlinesFetchOperation)initWithContext:(id)a3 articleIDs:(id)a4 ignoreCacheForArticleIDs:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FCArticleHeadlinesFetchOperation;
  v12 = [(FCMultiStepFetchOperation *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_articleIDs, a4);
    objc_storeStrong((id *)&v13->_ignoreCacheForArticleIDs, a5);
    [(FCMultiStepFetchOperation *)v13 addFetchStep:sel_determineAppropriateFetchStepsWithCompletion_];
  }

  return v13;
}

- (void)setConfiguration:(id)a3
{
}

- (id)fetchRecordsWithCompletion:(id)a3
{
  v25[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(FCArticleHeadlinesFetchOperation *)self articleIDs];
  v6 = objc_alloc_init(FCRecordChainFetchOperation);
  v7 = [(FCArticleHeadlinesFetchOperation *)self context];
  [(FCRecordChainFetchOperation *)v6 setContext:v7];

  [(FCRecordChainFetchOperation *)v6 setTopLevelRecordIDs:v5];
  v24[0] = @"Article";
  v23[0] = @"sourceChannelTagID";
  v23[1] = @"parentIssueID";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v25[0] = v8;
  v25[1] = MEMORY[0x1E4F1CBF0];
  v24[1] = @"Tag";
  v24[2] = @"Issue";
  v25[2] = MEMORY[0x1E4F1CBF0];
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
  [(FCRecordChainFetchOperation *)v6 setLinkKeysByRecordType:v9];

  id v10 = objc_opt_new();
  if ([(FCArticleHeadlinesFetchOperation *)self overrideArticleCachePolicy]) {
    unint64_t v11 = [(FCArticleHeadlinesFetchOperation *)self articleCachePolicy];
  }
  else {
    unint64_t v11 = [(FCFetchOperation *)self cachePolicy];
  }
  [v10 setCachePolicy:v11];
  if ([(FCArticleHeadlinesFetchOperation *)self overrideArticleCachePolicy]) {
    [(FCArticleHeadlinesFetchOperation *)self articleMaximumCachedAge];
  }
  else {
    [(FCFetchOperation *)self maximumCachedAge];
  }
  objc_msgSend(v10, "setMaximumCachedAge:");
  v12 = objc_opt_new();
  if ([(FCArticleHeadlinesFetchOperation *)self overrideTagCachePolicy]) {
    unint64_t v13 = [(FCArticleHeadlinesFetchOperation *)self tagCachePolicy];
  }
  else {
    unint64_t v13 = [(FCFetchOperation *)self cachePolicy];
  }
  [v12 setCachePolicy:v13];
  if ([(FCArticleHeadlinesFetchOperation *)self overrideTagCachePolicy]) {
    [(FCArticleHeadlinesFetchOperation *)self tagMaximumCachedAge];
  }
  else {
    [(FCFetchOperation *)self maximumCachedAge];
  }
  objc_msgSend(v12, "setMaximumCachedAge:");
  v21[0] = @"Article";
  v21[1] = @"Tag";
  v22[0] = v10;
  v22[1] = v12;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  [(FCRecordChainFetchOperation *)v6 setCachePoliciesByRecordType:v14];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __63__FCArticleHeadlinesFetchOperation_fetchRecordsWithCompletion___block_invoke;
  v18[3] = &unk_1E5B4C9A8;
  v18[4] = self;
  id v19 = v5;
  id v20 = v4;
  id v15 = v4;
  id v16 = v5;
  [(FCRecordChainFetchOperation *)v6 setRecordChainCompletionHandler:v18];

  return v6;
}

- (BOOL)overrideTagCachePolicy
{
  return self->_overrideTagCachePolicy;
}

- (BOOL)overrideArticleCachePolicy
{
  return self->_overrideArticleCachePolicy;
}

- (NSArray)articleIDs
{
  return self->_articleIDs;
}

void __63__FCArticleHeadlinesFetchOperation_fetchRecordsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = [v6 objectForKeyedSubscript:&unk_1EF8D7DA0];
  v8 = [v6 objectForKeyedSubscript:&unk_1EF8D7DB8];
  id v9 = [v6 objectForKeyedSubscript:&unk_1EF8D7DD0];

  if (v6)
  {
    id v10 = [*(id *)(a1 + 32) context];
    unint64_t v11 = [v10 tagController];
    v44 = [v11 channelsForTagRecords:v8];

    v12 = [*(id *)(a1 + 32) configuration];
    unint64_t v13 = [*(id *)(a1 + 32) context];
    [v13 assetManager];
    id v15 = v14 = v8;
    [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 40)];
    v17 = id v16 = v5;
    FCHeadlinesByArticleIDFromHeldRecords(v12, v15, v17, v7, v44, v9, [*(id *)(a1 + 32) shouldFilterHeadlinesWithoutSourceChannels], 1);
    id v19 = v18 = v7;

    id v5 = v16;
    v8 = v14;

    id v20 = objc_msgSend(v19, "nf_objectsForKeysWithoutMarker:", *(void *)(a1 + 40));
    [*(id *)(a1 + 32) setResultHeadlines:v20];

    v7 = v18;
  }
  v21 = v9;
  v22 = v7;
  v23 = objc_msgSend(*(id *)(a1 + 32), "resultHeadlines", v44);
  uint64_t v24 = [v23 count];
  v25 = [*(id *)(a1 + 32) articleIDs];
  uint64_t v26 = [v25 count];

  if (v24 == v26)
  {
    v27 = [*(id *)(a1 + 32) resultHeadlines];
    v28 = +[FCFetchOperationResult resultWithStatus:0 fetchedObject:v27 error:0];
    v29 = v22;
    v30 = v21;
  }
  else
  {
    v31 = [*(id *)(a1 + 32) resultHeadlines];
    v27 = objc_msgSend(v31, "fc_setByTransformingWithBlock:", &__block_literal_global_80);

    v32 = (void *)MEMORY[0x1E4F1CAD0];
    v33 = [*(id *)(a1 + 32) articleIDs];
    v34 = [v32 setWithArray:v33];
    v35 = objc_msgSend(v34, "fc_setByMinusingSet:", v27);

    v36 = [*(id *)(a1 + 32) resultHeadlines];
    uint64_t v37 = [v36 count];

    if (v37)
    {
      [*(id *)(a1 + 32) resultHeadlines];
      v39 = v38 = v8;
      v28 = +[FCFetchOperationResult resultWithStatus:0 fetchedObject:v39 error:0];

      v8 = v38;
      v29 = v22;
      v30 = v21;
    }
    else
    {
      v29 = v22;
      v30 = v21;
      if ([*(id *)(a1 + 32) cachePolicy] == 3)
      {
        uint64_t v40 = 2;
        id v41 = 0;
      }
      else
      {
        uint64_t v40 = 3;
        id v41 = v5;
      }
      v28 = +[FCFetchOperationResult resultWithStatus:v40 fetchedObject:0 error:v41];
    }
    [v28 setMissingObjectDescriptions:v35];
  }
  v42 = [*(id *)(a1 + 32) interestTokenHandler];

  if (v42)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__FCArticleHeadlinesFetchOperation_fetchRecordsWithCompletion___block_invoke_2;
    aBlock[3] = &unk_1E5B55290;
    aBlock[4] = *(void *)(a1 + 32);
    v43 = (void (**)(void *, void *))_Block_copy(aBlock);
    v43[2](v43, v29);
    v43[2](v43, v8);
    v43[2](v43, v30);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (NSArray)resultHeadlines
{
  return self->_resultHeadlines;
}

- (FCContentContext)context
{
  return self->_context;
}

- (BOOL)shouldFilterHeadlinesWithoutSourceChannels
{
  return self->_shouldFilterHeadlinesWithoutSourceChannels;
}

- (void)setResultHeadlines:(id)a3
{
}

- (id)interestTokenHandler
{
  return self->_interestTokenHandler;
}

- (id)determineAppropriateFetchStepsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = [(FCArticleHeadlinesFetchOperation *)self configuration];

  if (!v5) {
    [(FCMultiStepFetchOperation *)self addNonCriticalFetchStep:sel_fetchConfigWithCompletion_];
  }
  [(FCMultiStepFetchOperation *)self addFetchStep:sel_fetchRecordsWithCompletion_];
  v4[2](v4, 0);

  return 0;
}

- (FCCoreConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHeadlines, 0);
  objc_storeStrong((id *)&self->_ignoreCacheForArticleIDs, 0);
  objc_storeStrong((id *)&self->_articleIDs, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_interestTokenHandler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (FCArticleHeadlinesFetchOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCArticleHeadlinesFetchOperation init]";
    __int16 v9 = 2080;
    id v10 = "FCArticleHeadlinesFetchOperation.m";
    __int16 v11 = 1024;
    int v12 = 259;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCArticleHeadlinesFetchOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (id)fetchConfigWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FCArticleHeadlinesFetchOperation *)self context];
  id v6 = [v5 configurationManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__FCArticleHeadlinesFetchOperation_fetchConfigWithCompletion___block_invoke;
  v9[3] = &unk_1E5B502D8;
  v9[4] = self;
  id v10 = v4;
  id v7 = v4;
  FCCoreConfigurationFetch(v6, v9);

  return 0;
}

void __62__FCArticleHeadlinesFetchOperation_fetchConfigWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v5)
  {

    id v6 = 0;
    uint64_t v7 = 3;
  }
  else
  {
    uint64_t v7 = 0;
    id v6 = v9;
  }
  id v10 = v6;
  [*(id *)(a1 + 32) setConfiguration:v6];
  v8 = +[FCFetchOperationResult resultWithStatus:v7 fetchedObject:v10 error:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __63__FCArticleHeadlinesFetchOperation_fetchRecordsWithCompletion___block_invoke_24(uint64_t a1, void *a2)
{
  return [a2 articleID];
}

void __63__FCArticleHeadlinesFetchOperation_fetchRecordsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 interestTokensByID];
  id v4 = [v3 allValues];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__FCArticleHeadlinesFetchOperation_fetchRecordsWithCompletion___block_invoke_3;
  v5[3] = &unk_1E5B55268;
  v5[4] = *(void *)(a1 + 32);
  [v4 enumerateObjectsUsingBlock:v5];
}

void __63__FCArticleHeadlinesFetchOperation_fetchRecordsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 interestTokenHandler];
  v4[2](v4, v3);
}

- (void)setOverrideArticleCachePolicy:(BOOL)a3
{
  self->_overrideArticleCachePolicy = a3;
}

- (unint64_t)articleCachePolicy
{
  return self->_articleCachePolicy;
}

- (void)setArticleCachePolicy:(unint64_t)a3
{
  self->_articleCachePolicy = a3;
}

- (double)articleMaximumCachedAge
{
  return self->_articleMaximumCachedAge;
}

- (void)setArticleMaximumCachedAge:(double)a3
{
  self->_articleMaximumCachedAge = a3;
}

- (void)setOverrideTagCachePolicy:(BOOL)a3
{
  self->_overrideTagCachePolicy = a3;
}

- (unint64_t)tagCachePolicy
{
  return self->_tagCachePolicy;
}

- (void)setTagCachePolicy:(unint64_t)a3
{
  self->_tagCachePolicy = a3;
}

- (double)tagMaximumCachedAge
{
  return self->_tagMaximumCachedAge;
}

- (void)setTagMaximumCachedAge:(double)a3
{
  self->_tagMaximumCachedAge = a3;
}

- (void)setShouldFilterHeadlinesWithoutSourceChannels:(BOOL)a3
{
  self->_shouldFilterHeadlinesWithoutSourceChannels = a3;
}

- (void)setInterestTokenHandler:(id)a3
{
}

- (void)setContext:(id)a3
{
}

- (void)setArticleIDs:(id)a3
{
}

- (NSArray)ignoreCacheForArticleIDs
{
  return self->_ignoreCacheForArticleIDs;
}

- (void)setIgnoreCacheForArticleIDs:(id)a3
{
}

@end