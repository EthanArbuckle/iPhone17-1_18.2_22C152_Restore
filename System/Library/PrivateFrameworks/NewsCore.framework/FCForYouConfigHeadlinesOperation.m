@interface FCForYouConfigHeadlinesOperation
- (BOOL)shouldFetchEditorialSectionTags;
- (BOOL)validateOperation;
- (FCBundleSubscriptionManagerType)bundleSubscriptionManager;
- (FCCachePolicy)articleListCachePolicy;
- (FCCachePolicy)editorialSectionTagCachePolicy;
- (FCCachePolicy)forYouConfigCachePolicy;
- (FCContentContext)context;
- (FCCoreConfiguration)configuration;
- (FCFeedPersonalizing)personalizer;
- (FCForYouConfig)forYouConfig;
- (FCForYouConfig)resultForYouConfig;
- (NSArray)additionalArticleListIDs;
- (NSArray)additionalTagIDs;
- (NSDictionary)resultArticleListsByID;
- (NSDictionary)resultHeadlinesByArticleID;
- (NSDictionary)resultHeadlinesByArticleListID;
- (NSDictionary)resultTagsByID;
- (NSError)error;
- (id)_edgeCacheHint;
- (id)forYouConfigRecordID;
- (id)headlinesAndTagsCompletionHandler;
- (id)headlinesCompletionHandler;
- (id)localTodayFeedConfiguration;
- (int64_t)fields;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setAdditionalArticleListIDs:(id)a3;
- (void)setAdditionalTagIDs:(id)a3;
- (void)setArticleListCachePolicy:(id)a3;
- (void)setBundleSubscriptionManager:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContext:(id)a3;
- (void)setEditorialSectionTagCachePolicy:(id)a3;
- (void)setError:(id)a3;
- (void)setFields:(int64_t)a3;
- (void)setForYouConfig:(id)a3;
- (void)setForYouConfigCachePolicy:(id)a3;
- (void)setHeadlinesAndTagsCompletionHandler:(id)a3;
- (void)setHeadlinesCompletionHandler:(id)a3;
- (void)setPersonalizer:(id)a3;
- (void)setResultArticleListsByID:(id)a3;
- (void)setResultForYouConfig:(id)a3;
- (void)setResultHeadlinesByArticleID:(id)a3;
- (void)setResultHeadlinesByArticleListID:(id)a3;
- (void)setResultTagsByID:(id)a3;
- (void)setShouldFetchEditorialSectionTags:(BOOL)a3;
@end

@implementation FCForYouConfigHeadlinesOperation

- (BOOL)validateOperation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(FCForYouConfigHeadlinesOperation *)self configuration];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)[[NSString alloc] initWithFormat:@"can't fetch ForYouConfig without a configuration"];
    int v15 = 136315906;
    v16 = "-[FCForYouConfigHeadlinesOperation validateOperation]";
    __int16 v17 = 2080;
    v18 = "FCForYouConfigHeadlinesOperation.m";
    __int16 v19 = 1024;
    int v20 = 57;
    __int16 v21 = 2114;
    v22 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);
  }
  v4 = [(FCForYouConfigHeadlinesOperation *)self bundleSubscriptionManager];

  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)[[NSString alloc] initWithFormat:@"can't fetch ForYouConfig headlines without a bundle subscription manager"];
    int v15 = 136315906;
    v16 = "-[FCForYouConfigHeadlinesOperation validateOperation]";
    __int16 v17 = 2080;
    v18 = "FCForYouConfigHeadlinesOperation.m";
    __int16 v19 = 1024;
    int v20 = 61;
    __int16 v21 = 2114;
    v22 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);
  }
  v5 = [(FCForYouConfigHeadlinesOperation *)self context];

  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)[[NSString alloc] initWithFormat:@"can't fetch ForYouConfig headlines without a context"];
    int v15 = 136315906;
    v16 = "-[FCForYouConfigHeadlinesOperation validateOperation]";
    __int16 v17 = 2080;
    v18 = "FCForYouConfigHeadlinesOperation.m";
    __int16 v19 = 1024;
    int v20 = 65;
    __int16 v21 = 2114;
    v22 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);
  }
  int64_t v6 = [(FCForYouConfigHeadlinesOperation *)self fields];
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)[[NSString alloc] initWithFormat:@"must have headline fields to fetch ForYouConfig headlines"];
    int v15 = 136315906;
    v16 = "-[FCForYouConfigHeadlinesOperation validateOperation]";
    __int16 v17 = 2080;
    v18 = "FCForYouConfigHeadlinesOperation.m";
    __int16 v19 = 1024;
    int v20 = 69;
    __int16 v21 = 2114;
    v22 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);
  }
  if (v3) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  return !v7 && v5 != 0 && v6 != 0;
}

- (void)performOperation
{
  v39[6] = *MEMORY[0x1E4F143B8];
  v3 = [(FCForYouConfigHeadlinesOperation *)self configuration];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke;
  v33[3] = &unk_1E5B4BF30;
  v33[4] = self;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v33);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_2;
  v32[3] = &unk_1E5B4BF30;
  v32[4] = self;
  v5 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v32);
  int64_t v6 = (void *)MEMORY[0x1E4F1C978];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_3;
  v30[3] = &unk_1E5B501A0;
  v30[4] = self;
  id v22 = v3;
  id v31 = v22;
  uint64_t v7 = objc_msgSend(v6, "fc_array:", v30);
  v8 = objc_alloc_init(FCRecordChainFetchOperation);
  v9 = [(FCForYouConfigHeadlinesOperation *)self context];
  [(FCRecordChainFetchOperation *)v8 setContext:v9];

  v10 = [(FCForYouConfigHeadlinesOperation *)self _edgeCacheHint];
  [(FCRecordChainFetchOperation *)v8 setEdgeCacheHint:v10];

  uint64_t v23 = (void *)v7;
  [(FCRecordChainFetchOperation *)v8 setTopLevelRecordIDs:v7];
  v38[0] = @"ArticleList";
  v37 = @"articleIDs";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  v39[0] = v11;
  v38[1] = @"Article";
  v36[0] = @"sourceChannelTagID";
  v36[1] = @"parentIssueID";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  v39[1] = v12;
  v39[2] = v5;
  v38[2] = @"AudioConfig";
  v38[3] = @"ForYouConfig";
  v24 = (void *)v4;
  v39[3] = v4;
  v39[4] = MEMORY[0x1E4F1CBF0];
  v38[4] = @"Issue";
  v38[5] = @"Tag";
  v39[5] = MEMORY[0x1E4F1CBF0];
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:6];
  [(FCRecordChainFetchOperation *)v8 setLinkKeysByRecordType:v13];

  v34[0] = @"ArticleList";
  v14 = [(FCForYouConfigHeadlinesOperation *)self articleListCachePolicy];
  int v15 = v14;
  if (!v14)
  {
    int v15 = +[FCCachePolicy defaultCachePolicy];
  }
  v35[0] = v15;
  v34[1] = @"AudioConfig";
  v16 = [(FCForYouConfigHeadlinesOperation *)self forYouConfigCachePolicy];
  __int16 v17 = v16;
  if (!v16)
  {
    __int16 v17 = +[FCCachePolicy defaultCachePolicy];
  }
  v35[1] = v17;
  v34[2] = @"ForYouConfig";
  v18 = [(FCForYouConfigHeadlinesOperation *)self forYouConfigCachePolicy];
  __int16 v19 = v18;
  if (!v18)
  {
    __int16 v19 = +[FCCachePolicy defaultCachePolicy];
  }
  v35[2] = v19;
  int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:3];
  [(FCRecordChainFetchOperation *)v8 setCachePoliciesByRecordType:v20];

  if (!v18) {
  if (!v16)
  }

  if (!v14) {
  if ([(FCForYouConfigHeadlinesOperation *)self shouldFetchEditorialSectionTags])
  }
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_4;
    v27[3] = &unk_1E5B557C8;
    id v28 = v22;
    v29 = self;
    [(FCRecordChainFetchOperation *)v8 setDynamicCachePolicyBlock:v27];
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_5;
  v25[3] = &unk_1E5B55760;
  v25[4] = self;
  id v26 = v22;
  id v21 = v22;
  [(FCRecordChainFetchOperation *)v8 setRecordChainCompletionHandler:v25];
  [(FCOperation *)self associateChildOperation:v8];
  [(FCOperation *)v8 start];
}

void __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) fields] & 2) != 0) {
    [v3 addObject:@"todayFeedTopStoriesArticleIDs"];
  }
  if (([*(id *)(a1 + 32) fields] & 4) != 0) {
    [v3 addObject:@"editorialArticleListIDs"];
  }
  if (([*(id *)(a1 + 32) fields] & 8) != 0) {
    [v3 addObject:@"trendingArticleListID"];
  }
  if (([*(id *)(a1 + 32) fields] & 0x10) != 0) {
    [v3 addObject:@"spotlightArticleID"];
  }
  if ([*(id *)(a1 + 32) shouldFetchEditorialSectionTags]) {
    [v3 addObject:@"editorialSectionTagIDs"];
  }
}

void __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) fields] & 0x40) != 0) {
    [v3 addObject:@"dailyBriefingArticleID"];
  }
}

void __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = [*(id *)(a1 + 32) forYouConfigRecordID];
  [v12 addObject:v3];

  uint64_t v4 = [*(id *)(a1 + 32) additionalArticleListIDs];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    int64_t v6 = [*(id *)(a1 + 32) additionalArticleListIDs];
    [v12 addObjectsFromArray:v6];
  }
  uint64_t v7 = [*(id *)(a1 + 32) additionalTagIDs];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = [*(id *)(a1 + 32) additionalTagIDs];
    [v12 addObjectsFromArray:v9];
  }
  if (([*(id *)(a1 + 32) fields] & 0x40) != 0)
  {
    v10 = [*(id *)(a1 + 40) audioConfigRecordID];

    if (v10)
    {
      v11 = [*(id *)(a1 + 40) audioConfigRecordID];
      [v12 addObject:v11];
    }
  }
}

id __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  int64_t v6 = v5;
  if (a2 == 2
    && ([v5 parentID],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [*(id *)(a1 + 32) editorialChannelID],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v7 isEqualToString:v8],
        v8,
        v7,
        v9))
  {
    v10 = [*(id *)(a1 + 40) editorialSectionTagCachePolicy];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) finishedPerformingOperationWithError:a3];
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_6;
    v20[3] = &unk_1E5B4EEF0;
    v20[4] = *(void *)(a1 + 32);
    uint64_t v7 = (void *)[v6 initWithResolver:v20];
    uint64_t v8 = zalgo();
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_8;
    v19[3] = &unk_1E5B557F0;
    v19[4] = *(void *)(a1 + 32);
    int v9 = [v7 thenOn:v8 then:v19];
    v10 = zalgo();
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_9;
    v15[3] = &unk_1E5B516B0;
    id v11 = v5;
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(void **)(a1 + 40);
    id v16 = v11;
    uint64_t v17 = v12;
    id v18 = v13;
    id v14 = (id)[v9 thenOn:v10 then:v15];
  }
}

void __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) personalizer];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_7;
  v6[3] = &unk_1E5B4CA88;
  id v7 = v3;
  id v5 = v3;
  [v4 prepareForUseWithCompletionHandler:v6];
}

uint64_t __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) localTodayFeedConfiguration];
}

uint64_t __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_9(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:&unk_1EF8D7DE8];
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:&unk_1EF8D7E00];
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:&unk_1EF8D7E18];
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:&unk_1EF8D7E30];
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:&unk_1EF8D7E48];
  uint64_t v7 = [v2 onlyRecord];
  uint64_t v8 = [FCForYouConfig alloc];
  int v9 = [v2 onlyInterestToken];
  v41 = (void *)v7;
  v10 = [(FCForYouConfig *)v8 initWithRecord:v7 interestToken:v9];
  [*(id *)(a1 + 40) setResultForYouConfig:v10];

  id v11 = [*(id *)(a1 + 40) context];
  uint64_t v12 = [v11 tagController];
  v13 = [v12 tagsForTagRecords:v6];
  [*(id *)(a1 + 40) setResultTagsByID:v13];

  v42 = v4;
  id v14 = [v4 transformRecordsByIDWithBlock:&__block_literal_global_81];
  [*(id *)(a1 + 40) setResultArticleListsByID:v14];

  int v15 = *(void **)(a1 + 48);
  id v16 = [*(id *)(a1 + 40) context];
  uint64_t v17 = [v16 assetManager];
  id v18 = [*(id *)(a1 + 40) resultArticleListsByID];
  __int16 v19 = [v18 allValues];
  int v20 = FCHeadlinesByArticleListIDFromHeldRecordsAndArticleLists(v15, v17, v5, v6, v3, v19, 1);
  [*(id *)(a1 + 40) setResultHeadlinesByArticleListID:v20];

  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_2_35;
  v47[3] = &unk_1E5B4C2F0;
  v47[4] = *(void *)(a1 + 40);
  id v21 = objc_msgSend(MEMORY[0x1E4F1CAD0], "fc_set:", v47);
  if ([v21 count])
  {
    id v22 = *(void **)(a1 + 48);
    uint64_t v23 = [*(id *)(a1 + 40) context];
    v24 = [v23 assetManager];
    v25 = [*(id *)(a1 + 40) resultTagsByID];
    id v26 = FCHeadlinesByArticleIDFromHeldRecords(v22, v24, v21, v5, v25, v3, 1, 1);
    [*(id *)(a1 + 40) setResultHeadlinesByArticleID:v26];
  }
  v27 = [*(id *)(a1 + 40) personalizer];

  if (v27)
  {
    v40 = v3;
    id v28 = [MEMORY[0x1E4F1CA48] array];
    v29 = [*(id *)(a1 + 40) resultHeadlinesByArticleID];
    v30 = [v29 allValues];
    [v28 addObjectsFromArray:v30];

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v31 = [*(id *)(a1 + 40) resultHeadlinesByArticleListID];
    v32 = [v31 allValues];

    uint64_t v33 = [v32 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v44;
      do
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v44 != v35) {
            objc_enumerationMutation(v32);
          }
          [v28 addObjectsFromArray:*(void *)(*((void *)&v43 + 1) + 8 * v36++)];
        }
        while (v34 != v36);
        uint64_t v34 = [v32 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v34);
    }

    v37 = [*(id *)(a1 + 40) personalizer];
    FCAssignPersonalizationScoresToHeadlines(v28, v37, 0);

    id v3 = v40;
  }
  v38 = [*(id *)(a1 + 40) resultForYouConfig];
  [*(id *)(a1 + 40) setForYouConfig:v38];

  [*(id *)(a1 + 40) finishedPerformingOperationWithError:0];
  return 0;
}

FCArticleList *__52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [[FCArticleList alloc] initWithRecord:v5 interestToken:v4];

  return v6;
}

void __52__FCForYouConfigHeadlinesOperation_performOperation__block_invoke_2_35(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (([*(id *)(a1 + 32) fields] & 2) != 0)
  {
    id v3 = [*(id *)(a1 + 32) resultForYouConfig];
    id v4 = [v3 todayFeedTopStoriesArticleIDs];
    [v9 addObjectsFromArray:v4];
  }
  if (([*(id *)(a1 + 32) fields] & 0x10) != 0)
  {
    id v5 = [*(id *)(a1 + 32) resultForYouConfig];
    id v6 = [v5 spotlightArticleID];

    if (v6)
    {
      uint64_t v7 = [*(id *)(a1 + 32) resultForYouConfig];
      uint64_t v8 = [v7 spotlightArticleID];
      [v9 addObject:v8];
    }
  }
}

- (void)operationWillFinishWithError:(id)a3
{
  id v17 = a3;
  -[FCForYouConfigHeadlinesOperation setError:](self, "setError:");
  id v4 = [(FCForYouConfigHeadlinesOperation *)self headlinesCompletionHandler];

  if (v4)
  {
    id v5 = [(FCForYouConfigHeadlinesOperation *)self headlinesCompletionHandler];
    id v6 = [(FCForYouConfigHeadlinesOperation *)self resultForYouConfig];
    uint64_t v7 = [(FCForYouConfigHeadlinesOperation *)self resultArticleListsByID];
    uint64_t v8 = [(FCForYouConfigHeadlinesOperation *)self resultHeadlinesByArticleListID];
    id v9 = [(FCForYouConfigHeadlinesOperation *)self resultHeadlinesByArticleID];
    ((void (**)(void, void *, void *, void *, void *, id))v5)[2](v5, v6, v7, v8, v9, v17);
  }
  v10 = [(FCForYouConfigHeadlinesOperation *)self headlinesAndTagsCompletionHandler];

  if (v10)
  {
    id v11 = [(FCForYouConfigHeadlinesOperation *)self headlinesAndTagsCompletionHandler];
    uint64_t v12 = [(FCForYouConfigHeadlinesOperation *)self resultForYouConfig];
    v13 = [(FCForYouConfigHeadlinesOperation *)self resultArticleListsByID];
    id v14 = [(FCForYouConfigHeadlinesOperation *)self resultHeadlinesByArticleListID];
    int v15 = [(FCForYouConfigHeadlinesOperation *)self resultHeadlinesByArticleID];
    id v16 = [(FCForYouConfigHeadlinesOperation *)self resultTagsByID];
    ((void (**)(void, void *, void *, void *, void *, void *, id))v11)[2](v11, v12, v13, v14, v15, v16, v17);
  }
}

- (id)_edgeCacheHint
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (([(FCForYouConfigHeadlinesOperation *)self fields] & 4) != 0)
  {
    id v4 = +[FCEdgeCacheHint edgeCacheHintForEditorial];
    goto LABEL_10;
  }
  if (([(FCForYouConfigHeadlinesOperation *)self fields] & 2) != 0)
  {
    id v4 = +[FCEdgeCacheHint edgeCacheHintForTopStories];
    goto LABEL_10;
  }
  uint64_t v3 = [(FCForYouConfigHeadlinesOperation *)self fields];
  if (v3 <= 7)
  {
    if (v3 == 2)
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      id v6 = (void *)[[NSString alloc] initWithFormat:@"Case unsupported"];
      int v9 = 136315906;
      v10 = "-[FCForYouConfigHeadlinesOperation _edgeCacheHint]";
      __int16 v11 = 2080;
      uint64_t v12 = "FCForYouConfigHeadlinesOperation.m";
      __int16 v13 = 1024;
      int v14 = 283;
      __int16 v15 = 2114;
      id v16 = v6;
      uint64_t v7 = MEMORY[0x1E4F14500];
    }
    else
    {
      if (v3 != 4 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      id v6 = (void *)[[NSString alloc] initWithFormat:@"Case unsupported"];
      int v9 = 136315906;
      v10 = "-[FCForYouConfigHeadlinesOperation _edgeCacheHint]";
      __int16 v11 = 2080;
      uint64_t v12 = "FCForYouConfigHeadlinesOperation.m";
      __int16 v13 = 1024;
      int v14 = 284;
      __int16 v15 = 2114;
      id v16 = v6;
      uint64_t v7 = MEMORY[0x1E4F14500];
    }
    _os_log_error_impl(&dword_1A460D000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

    goto LABEL_11;
  }
  switch(v3)
  {
    case 8:
      id v4 = +[FCEdgeCacheHint edgeCacheHintForTrending];
      goto LABEL_10;
    case 16:
      id v4 = +[FCEdgeCacheHint edgeCacheHintForSpotlight];
LABEL_10:
      if (v4) {
        goto LABEL_14;
      }
      break;
    case 32:
      id v4 = +[FCEdgeCacheHint edgeCacheHintForForYouConfig];
      goto LABEL_10;
  }
LABEL_11:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"expected to have an edge cache hint for all ForYouConfig operations"];
    int v9 = 136315906;
    v10 = "-[FCForYouConfigHeadlinesOperation _edgeCacheHint]";
    __int16 v11 = 2080;
    uint64_t v12 = "FCForYouConfigHeadlinesOperation.m";
    __int16 v13 = 1024;
    int v14 = 294;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);
  }
  id v4 = 0;
LABEL_14:
  return v4;
}

- (id)forYouConfigRecordID
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(FCForYouConfigHeadlinesOperation *)self bundleSubscriptionManager];
  uint64_t v4 = [v3 cachedSubscription];
  id v5 = objc_getAssociatedObject((id)v4, (const void *)(v4 + 1));
  uint64_t v6 = [v5 unsignedIntegerValue];
  char v7 = v6;
  uint64_t v8 = objc_getAssociatedObject((id)v4, (const void *)~v6);
  char v9 = ([v8 unsignedIntegerValue] + 1) ^ (v7 + 1);

  v10 = [(FCForYouConfigHeadlinesOperation *)self configuration];
  __int16 v11 = v10;
  if (v9) {
    [v10 forYouPremiumRecordConfigID];
  }
  else {
  uint64_t v12 = [v10 forYouRecordConfigID];
  }

  __int16 v13 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = v13;
    __int16 v15 = [(FCOperation *)self shortOperationDescription];
    int v17 = 138543618;
    id v18 = v15;
    __int16 v19 = 2114;
    int v20 = v12;
    _os_log_impl(&dword_1A460D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ fetching the ForYouConfig with recordID: %{public}@", (uint8_t *)&v17, 0x16u);
  }
  return v12;
}

- (id)localTodayFeedConfiguration
{
  v2 = NewsCoreUserDefaults();
  int v3 = [v2 BOOLForKey:@"news.modules.today_feed.debug_feed_config.enabled"];

  uint64_t v4 = NewsCoreUserDefaults();
  id v5 = [v4 objectForKey:@"news.modules.today_feed.debug_feed_config.url"];

  if (NFInternalBuild() && v3 && [v5 length])
  {
    uint64_t v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
    char v7 = v6;
    if (v6)
    {
      id v8 = v6;
      id v9 = objc_alloc(MEMORY[0x1E4F81BF0]);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __63__FCForYouConfigHeadlinesOperation_localTodayFeedConfiguration__block_invoke_3;
      v13[3] = &unk_1E5B4EEF0;
      id v14 = v8;
      id v10 = v8;
      __int16 v11 = (void *)[v9 initWithResolver:v13];
    }
    else
    {
      __int16 v11 = (void *)[objc_alloc(MEMORY[0x1E4F81BF0]) initWithValue:0];
    }
  }
  else
  {
    __int16 v11 = (void *)[objc_alloc(MEMORY[0x1E4F81BF0]) initWithValue:0];
  }

  return v11;
}

void __63__FCForYouConfigHeadlinesOperation_localTodayFeedConfiguration__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F18DC0] sharedSession];
  uint64_t v5 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__FCForYouConfigHeadlinesOperation_localTodayFeedConfiguration__block_invoke_4;
  v8[3] = &unk_1E5B55818;
  id v9 = v3;
  id v6 = v3;
  char v7 = [v4 dataTaskWithURL:v5 completionHandler:v8];

  [v7 resume];
}

void __63__FCForYouConfigHeadlinesOperation_localTodayFeedConfiguration__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithData:v4 encoding:4];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (FCCoreConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (FCFeedPersonalizing)personalizer
{
  return self->_personalizer;
}

- (void)setPersonalizer:(id)a3
{
}

- (FCBundleSubscriptionManagerType)bundleSubscriptionManager
{
  return self->_bundleSubscriptionManager;
}

- (void)setBundleSubscriptionManager:(id)a3
{
}

- (int64_t)fields
{
  return self->_fields;
}

- (void)setFields:(int64_t)a3
{
  self->_fields = a3;
}

- (NSArray)additionalArticleListIDs
{
  return self->_additionalArticleListIDs;
}

- (void)setAdditionalArticleListIDs:(id)a3
{
}

- (NSArray)additionalTagIDs
{
  return self->_additionalTagIDs;
}

- (void)setAdditionalTagIDs:(id)a3
{
}

- (BOOL)shouldFetchEditorialSectionTags
{
  return self->_shouldFetchEditorialSectionTags;
}

- (void)setShouldFetchEditorialSectionTags:(BOOL)a3
{
  self->_shouldFetchEditorialSectionTags = a3;
}

- (FCCachePolicy)forYouConfigCachePolicy
{
  return self->_forYouConfigCachePolicy;
}

- (void)setForYouConfigCachePolicy:(id)a3
{
}

- (FCCachePolicy)articleListCachePolicy
{
  return self->_articleListCachePolicy;
}

- (void)setArticleListCachePolicy:(id)a3
{
}

- (FCCachePolicy)editorialSectionTagCachePolicy
{
  return self->_editorialSectionTagCachePolicy;
}

- (void)setEditorialSectionTagCachePolicy:(id)a3
{
}

- (FCForYouConfig)forYouConfig
{
  return (FCForYouConfig *)objc_getProperty(self, a2, 456, 1);
}

- (void)setForYouConfig:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 464, 1);
}

- (void)setError:(id)a3
{
}

- (id)headlinesCompletionHandler
{
  return self->_headlinesCompletionHandler;
}

- (void)setHeadlinesCompletionHandler:(id)a3
{
}

- (id)headlinesAndTagsCompletionHandler
{
  return self->_headlinesAndTagsCompletionHandler;
}

- (void)setHeadlinesAndTagsCompletionHandler:(id)a3
{
}

- (FCForYouConfig)resultForYouConfig
{
  return self->_resultForYouConfig;
}

- (void)setResultForYouConfig:(id)a3
{
}

- (NSDictionary)resultArticleListsByID
{
  return self->_resultArticleListsByID;
}

- (void)setResultArticleListsByID:(id)a3
{
}

- (NSDictionary)resultHeadlinesByArticleListID
{
  return self->_resultHeadlinesByArticleListID;
}

- (void)setResultHeadlinesByArticleListID:(id)a3
{
}

- (NSDictionary)resultHeadlinesByArticleID
{
  return self->_resultHeadlinesByArticleID;
}

- (void)setResultHeadlinesByArticleID:(id)a3
{
}

- (NSDictionary)resultTagsByID
{
  return self->_resultTagsByID;
}

- (void)setResultTagsByID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultTagsByID, 0);
  objc_storeStrong((id *)&self->_resultHeadlinesByArticleID, 0);
  objc_storeStrong((id *)&self->_resultHeadlinesByArticleListID, 0);
  objc_storeStrong((id *)&self->_resultArticleListsByID, 0);
  objc_storeStrong((id *)&self->_resultForYouConfig, 0);
  objc_storeStrong(&self->_headlinesAndTagsCompletionHandler, 0);
  objc_storeStrong(&self->_headlinesCompletionHandler, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_forYouConfig, 0);
  objc_storeStrong((id *)&self->_editorialSectionTagCachePolicy, 0);
  objc_storeStrong((id *)&self->_articleListCachePolicy, 0);
  objc_storeStrong((id *)&self->_forYouConfigCachePolicy, 0);
  objc_storeStrong((id *)&self->_additionalTagIDs, 0);
  objc_storeStrong((id *)&self->_additionalArticleListIDs, 0);
  objc_storeStrong((id *)&self->_bundleSubscriptionManager, 0);
  objc_storeStrong((id *)&self->_personalizer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end