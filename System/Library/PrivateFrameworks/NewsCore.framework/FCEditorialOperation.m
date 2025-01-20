@interface FCEditorialOperation
- (BOOL)validateOperation;
- (FCCloudContext)context;
- (FCCoreConfiguration)configuration;
- (FCSpotlightOperationResult)spotlightResult;
- (NSArray)editorialSectionGroups;
- (NSArray)trendingHeadlines;
- (NSError)error;
- (id)fetchCompletionHandler;
- (void)enumerateEditorialSectionsByRecencyWithBlock:(id)a3;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setConfiguration:(id)a3;
- (void)setContext:(id)a3;
- (void)setEditorialSectionGroups:(id)a3;
- (void)setError:(id)a3;
- (void)setFetchCompletionHandler:(id)a3;
- (void)setSpotlightResult:(id)a3;
- (void)setTrendingHeadlines:(id)a3;
@end

@implementation FCEditorialOperation

- (void)enumerateEditorialSectionsByRecencyWithBlock:(id)a3
{
  id v4 = a3;
  v5 = [(FCEditorialOperation *)self editorialSectionGroups];
  v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_180];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__FCEditorialOperation_enumerateEditorialSectionsByRecencyWithBlock___block_invoke_2;
  v8[3] = &unk_1E5B5B9C8;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v8];
}

uint64_t __69__FCEditorialOperation_enumerateEditorialSectionsByRecencyWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = [a3 publishDate];
  v6 = [v4 publishDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __69__FCEditorialOperation_enumerateEditorialSectionsByRecencyWithBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a2;
  id v8 = [v6 section];
  uint64_t v7 = [v6 headlines];

  (*(void (**)(uint64_t, id, void *, uint64_t))(v5 + 16))(v5, v8, v7, a4);
}

- (BOOL)validateOperation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(FCEditorialOperation *)self configuration];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v9 = (void *)[[NSString alloc] initWithFormat:@"editorial operation must have a configuration"];
    int v11 = 136315906;
    v12 = "-[FCEditorialOperation validateOperation]";
    __int16 v13 = 2080;
    v14 = "FCEditorialOperation.m";
    __int16 v15 = 1024;
    int v16 = 65;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);
  }
  id v4 = [(FCEditorialOperation *)self context];

  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)[[NSString alloc] initWithFormat:@"editorial catch-up operation must have a context"];
    int v11 = 136315906;
    v12 = "-[FCEditorialOperation validateOperation]";
    __int16 v13 = 2080;
    v14 = "FCEditorialOperation.m";
    __int16 v15 = 1024;
    int v16 = 66;
    __int16 v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);
  }
  uint64_t v5 = [(FCEditorialOperation *)self configuration];
  if (v5)
  {
    id v6 = [(FCEditorialOperation *)self context];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)performOperation
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v3 = [(FCEditorialOperation *)self configuration];
  id v4 = objc_alloc_init(FCForYouConfigHeadlinesOperation);
  [(FCForYouConfigHeadlinesOperation *)v4 setConfiguration:v3];
  uint64_t v5 = [(FCEditorialOperation *)self context];
  [(FCForYouConfigHeadlinesOperation *)v4 setContext:v5];

  id v6 = [(FCEditorialOperation *)self context];
  BOOL v7 = [v6 feedPersonalizer];
  [(FCForYouConfigHeadlinesOperation *)v4 setPersonalizer:v7];

  id v8 = [(FCEditorialOperation *)self context];
  id v9 = [v8 bundleSubscriptionManager];
  [(FCForYouConfigHeadlinesOperation *)v4 setBundleSubscriptionManager:v9];

  [(FCForYouConfigHeadlinesOperation *)v4 setFields:92];
  v10 = +[FCCachePolicy cachePolicyWithSoftMaxAge:15.0];
  [(FCForYouConfigHeadlinesOperation *)v4 setForYouConfigCachePolicy:v10];

  int v11 = +[FCCachePolicy cachePolicyWithSoftMaxAge:15.0];
  [(FCForYouConfigHeadlinesOperation *)v4 setArticleListCachePolicy:v11];

  v12 = +[FCCachePolicy cachePolicyWithSoftMaxAge:15.0];
  [(FCForYouConfigHeadlinesOperation *)v4 setEditorialSectionTagCachePolicy:v12];

  __int16 v13 = [v3 editorialChannelID];

  if (v13)
  {
    [(FCForYouConfigHeadlinesOperation *)v4 setShouldFetchEditorialSectionTags:1];
    v14 = [v3 editorialChannelID];
    v23[0] = v14;
    __int16 v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    [(FCForYouConfigHeadlinesOperation *)v4 setAdditionalTagIDs:v15];
  }
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __40__FCEditorialOperation_performOperation__block_invoke;
  v20 = &unk_1E5B5BA18;
  v21 = self;
  id v22 = v3;
  id v16 = v3;
  [(FCForYouConfigHeadlinesOperation *)v4 setHeadlinesAndTagsCompletionHandler:&v17];
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v4, v17, v18, v19, v20, v21);
  [(FCOperation *)v4 start];
}

void __40__FCEditorialOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  uint64_t v19 = v18;
  if (v18)
  {
    uint64_t v38 = MEMORY[0x1E4F143A8];
    uint64_t v39 = 3221225472;
    v40 = __40__FCEditorialOperation_performOperation__block_invoke_2;
    v41 = &unk_1E5B4BE70;
    id v42 = *(id *)(a1 + 32);
    id v43 = v18;
    [v42 finishedPerformingOperationWithError:v43];
  }
  else
  {
    v20 = [v13 trendingArticleListID];
    uint64_t v21 = objc_msgSend(v15, "fc_safeObjectForKey:", v20);
    id v22 = (void *)v21;
    if (v21) {
      uint64_t v23 = v21;
    }
    else {
      uint64_t v23 = MEMORY[0x1E4F1CBF0];
    }
    [*(id *)(a1 + 32) setTrendingHeadlines:v23];

    v24 = [v13 spotlightGroupConfig];
    v25 = [v24 spotlightArticleID];
    v26 = [v16 objectForKey:v25];

    v27 = [FCSpotlightOperationResult alloc];
    v28 = [v13 spotlightGroupConfig];
    v29 = [(FCSpotlightOperationResult *)v27 initWithSpotlightGroupConfig:v28 headline:v26];
    [*(id *)(a1 + 32) setSpotlightResult:v29];

    v30 = (void *)MEMORY[0x1E4F1C978];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __40__FCEditorialOperation_performOperation__block_invoke_3;
    v32[3] = &unk_1E5B5B9F0;
    id v33 = v13;
    id v34 = v17;
    id v35 = v14;
    id v36 = v15;
    id v37 = *(id *)(a1 + 40);
    v31 = objc_msgSend(v30, "fc_array:", v32);
    [*(id *)(a1 + 32) setEditorialSectionGroups:v31];

    [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
  }
}

uint64_t __40__FCEditorialOperation_performOperation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

void __40__FCEditorialOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v4 = [*(id *)(a1 + 32) editorialGroupConfigs];
  uint64_t v33 = [v4 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v33)
  {
    v31 = v4;
    uint64_t v32 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v35 != v32) {
          objc_enumerationMutation(v4);
        }
        id v6 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        BOOL v7 = [v6 sectionID];
        if (v7)
        {
          id v8 = *(void **)(a1 + 40);
          id v9 = [v6 sectionID];
          v10 = [v8 objectForKeyedSubscript:v9];
          int v11 = v10;
          if (v10)
          {
            if ([v10 conformsToProtocol:&unk_1EF90D4F8]) {
              v12 = v11;
            }
            else {
              v12 = 0;
            }
          }
          else
          {
            v12 = 0;
          }
          id v13 = v12;
        }
        else
        {
          id v13 = 0;
        }

        id v14 = [v6 articleListID];
        if (v14)
        {
          id v15 = *(void **)(a1 + 48);
          id v16 = [v6 articleListID];
          id v17 = [v15 objectForKeyedSubscript:v16];
        }
        else
        {
          id v17 = 0;
        }

        id v18 = [v6 articleListID];
        if (v18)
        {
          uint64_t v19 = *(void **)(a1 + 56);
          v20 = [v6 articleListID];
          uint64_t v21 = [v19 objectForKeyedSubscript:v20];
        }
        else
        {
          uint64_t v21 = 0;
        }

        id v22 = [v6 sectionID];
        uint64_t v23 = [*(id *)(a1 + 64) editorialGemsSectionID];
        char v24 = [v22 isEqualToString:v23];

        if (v13 && v17)
        {
          char v25 = [v21 count] ? v24 : 1;
          if ((v25 & 1) == 0)
          {
            v26 = objc_alloc_init(FCEditorialOperationGroup);
            [(FCEditorialOperationGroup *)v26 setSection:v13];
            [(FCEditorialOperationGroup *)v26 setHeadlines:v21];
            v27 = [v17 editorialMetadata];
            v28 = [v27 publishDate];
            if (v28)
            {
              [(FCEditorialOperationGroup *)v26 setPublishDate:v28];
            }
            else
            {
              [v17 lastModifiedDate];
              v30 = id v29 = v3;
              [(FCEditorialOperationGroup *)v26 setPublishDate:v30];

              id v3 = v29;
              id v4 = v31;
            }

            [v3 addObject:v26];
          }
        }
      }
      uint64_t v33 = [v4 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v33);
  }
}

- (void)operationWillFinishWithError:(id)a3
{
  id v6 = a3;
  -[FCEditorialOperation setError:](self, "setError:");
  id v4 = [(FCEditorialOperation *)self fetchCompletionHandler];

  if (v4)
  {
    uint64_t v5 = [(FCEditorialOperation *)self fetchCompletionHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (FCCoreConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (FCCloudContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSArray)trendingHeadlines
{
  return (NSArray *)objc_getProperty(self, a2, 384, 1);
}

- (void)setTrendingHeadlines:(id)a3
{
}

- (FCSpotlightOperationResult)spotlightResult
{
  return (FCSpotlightOperationResult *)objc_getProperty(self, a2, 392, 1);
}

- (void)setSpotlightResult:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 400, 1);
}

- (void)setError:(id)a3
{
}

- (id)fetchCompletionHandler
{
  return objc_getProperty(self, a2, 408, 1);
}

- (void)setFetchCompletionHandler:(id)a3
{
}

- (NSArray)editorialSectionGroups
{
  return (NSArray *)objc_getProperty(self, a2, 416, 1);
}

- (void)setEditorialSectionGroups:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorialSectionGroups, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_spotlightResult, 0);
  objc_storeStrong((id *)&self->_trendingHeadlines, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end