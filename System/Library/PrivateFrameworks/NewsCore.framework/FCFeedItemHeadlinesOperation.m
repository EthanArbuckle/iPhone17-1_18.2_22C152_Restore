@interface FCFeedItemHeadlinesOperation
- (BOOL)cachedOnly;
- (BOOL)shouldFilterHeadlinesWithoutSourceChannels;
- (BOOL)validateOperation;
- (FCContentContext)context;
- (FCCoreConfiguration)configuration;
- (FCFeedItemHeadlinesOperation)init;
- (FCFeedItemHeadlinesOperationProperties)properties;
- (FCFeedPersonalizing)personalizer;
- (FCMapTable)feedItemScoreProfiles;
- (NSArray)feedItems;
- (NSArray)resultHeadlines;
- (NSDictionary)feedContextByFeedID;
- (id)headlinesCompletionHandler;
- (id)headlinesMapCompletionHandler;
- (id)rapidUpdateRefreshTest;
- (int64_t)feedPersonalizationConfigurationSet;
- (void)_fetchUnadornedHeadlinesWithCompletionHandler:(id)a3;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setCachedOnly:(BOOL)a3;
- (void)setConfiguration:(id)a3;
- (void)setContext:(id)a3;
- (void)setFeedContextByFeedID:(id)a3;
- (void)setFeedItemScoreProfiles:(id)a3;
- (void)setFeedItems:(id)a3;
- (void)setFeedPersonalizationConfigurationSet:(int64_t)a3;
- (void)setHeadlinesCompletionHandler:(id)a3;
- (void)setHeadlinesMapCompletionHandler:(id)a3;
- (void)setPersonalizer:(id)a3;
- (void)setProperties:(id)a3;
- (void)setRapidUpdateRefreshTest:(id)a3;
- (void)setResultHeadlines:(id)a3;
- (void)setShouldFilterHeadlinesWithoutSourceChannels:(BOOL)a3;
@end

@implementation FCFeedItemHeadlinesOperation

- (FCFeedItemHeadlinesOperation)init
{
  v7.receiver = self;
  v7.super_class = (Class)FCFeedItemHeadlinesOperation;
  v2 = [(FCOperation *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_feedPersonalizationConfigurationSet = 0;
    v4 = objc_alloc_init(FCFeedItemHeadlinesOperationProperties);
    properties = v3->_properties;
    v3->_properties = v4;
  }
  return v3;
}

- (FCMapTable)feedItemScoreProfiles
{
  v2 = [(FCFeedItemHeadlinesOperation *)self properties];
  v3 = [v2 feedItemScoreProfiles];

  return (FCMapTable *)v3;
}

- (void)setFeedItemScoreProfiles:(id)a3
{
  id v4 = a3;
  id v5 = [(FCFeedItemHeadlinesOperation *)self properties];
  [v5 setFeedItemScoreProfiles:v4];
}

- (BOOL)validateOperation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(FCFeedItemHeadlinesOperation *)self configuration];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)[[NSString alloc] initWithFormat:@"feed item headlines operation must have a configuration"];
    int v11 = 136315906;
    v12 = "-[FCFeedItemHeadlinesOperation validateOperation]";
    __int16 v13 = 2080;
    v14 = "FCFeedItemHeadlinesOperation.m";
    __int16 v15 = 1024;
    int v16 = 69;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);
  }
  id v4 = [(FCFeedItemHeadlinesOperation *)self context];

  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)[[NSString alloc] initWithFormat:@"feed item headlines operation must have a context"];
    int v11 = 136315906;
    v12 = "-[FCFeedItemHeadlinesOperation validateOperation]";
    __int16 v13 = 2080;
    v14 = "FCFeedItemHeadlinesOperation.m";
    __int16 v15 = 1024;
    int v16 = 70;
    __int16 v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);
  }
  id v5 = [(FCFeedItemHeadlinesOperation *)self configuration];
  if (v5)
  {
    v6 = [(FCFeedItemHeadlinesOperation *)self context];
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
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__FCFeedItemHeadlinesOperation_performOperation__block_invoke;
  v2[3] = &unk_1E5B4C8F8;
  v2[4] = self;
  [(FCFeedItemHeadlinesOperation *)self _fetchUnadornedHeadlinesWithCompletionHandler:v2];
}

void __48__FCFeedItemHeadlinesOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v45 = objc_msgSend(a2, "fc_dictionaryWithKeySelector:", sel_articleID);
    v6 = [*(id *)(a1 + 32) properties];
    uint64_t v7 = [v6 feedItemScoreProfiles];

    uint64_t v8 = a1;
    v44 = (void *)v7;
    if (!v7)
    {
      v9 = NewsCoreUserDefaults();
      char v10 = [v9 BOOLForKey:@"personalization_disabled"];

      if (v10)
      {
        v44 = 0;
      }
      else
      {
        int v11 = [*(id *)(v8 + 32) personalizer];
        v12 = [*(id *)(v8 + 32) feedItems];
        __int16 v13 = objc_msgSend(v11, "sortItems:options:configurationSet:", v12, 1, objc_msgSend(*(id *)(v8 + 32), "feedPersonalizationConfigurationSet"));

        v44 = [v13 scoreProfiles];
      }
    }
    v43 = [MEMORY[0x1E4F1CA48] array];
    v42 = +[FCMapTable mapTableWithKeyOptions:512 valueOptions:0];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = [*(id *)(v8 + 32) feedItems];
    uint64_t v14 = [obj countByEnumeratingWithState:&v50 objects:v63 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v51;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v51 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v50 + 1) + 8 * v17);
          uint64_t v19 = (objc_class *)objc_opt_class();
          v20 = [v18 articleID];
          v21 = [v45 objectForKeyedSubscript:v20];
          v22 = FCCheckedDynamicCast(v19, (uint64_t)v21);

          if (v22)
          {
            uint64_t v23 = v8;
            v24 = [v18 feedID];
            [v22 setSurfacedByBinID:v24];

            objc_msgSend(v22, "setFeedOrder:", objc_msgSend(v18, "order"));
            [v18 globalUserFeedback];
            objc_msgSend(v22, "setGlobalUserFeedback:");
            if ([v18 isEvergreen]) {
              [v22 markAsEvergreen];
            }
            long long v48 = 0u;
            long long v49 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            v25 = [v18 surfacedByArticleListIDs];
            uint64_t v26 = [v25 countByEnumeratingWithState:&v46 objects:v62 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v47;
              do
              {
                for (uint64_t i = 0; i != v27; ++i)
                {
                  if (*(void *)v47 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  [v22 addSurfacedByArticleListID:*(void *)(*((void *)&v46 + 1) + 8 * i)];
                }
                uint64_t v27 = [v25 countByEnumeratingWithState:&v46 objects:v62 count:16];
              }
              while (v27);
            }

            uint64_t v8 = v23;
            v30 = [*(id *)(v23 + 32) feedContextByFeedID];
            v31 = [v18 feedID];
            v32 = objc_msgSend(v30, "fc_safeObjectForKey:", v31);

            if (v32)
            {
              v33 = [v32 sectionID];
              [v22 setSurfacedBySectionID:v33];

              v34 = [v32 channelID];
              [v22 setSurfacedByChannelID:v34];

              v35 = [v32 topicID];
              [v22 setSurfacedByTopicID:v35];

              objc_msgSend(v22, "setTopStoryType:", objc_msgSend(v32, "isTopStories"));
            }
            v36 = [v44 objectForKey:v18];
            if (v36)
            {
              [v22 setScoreProfile:v36];
              [v36 sortingScore];
              objc_msgSend(v22, "setTileProminenceScore:");
            }
            else
            {
              v37 = [*(id *)(v23 + 32) personalizer];

              if (v37
                && !NSClassFromString(&cfstr_Xctest.isa)
                && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                v38 = (void *)[[NSString alloc] initWithFormat:@"personalizer should have provided a score"];
                *(_DWORD *)buf = 136315906;
                v55 = "-[FCFeedItemHeadlinesOperation performOperation]_block_invoke";
                __int16 v56 = 2080;
                v57 = "FCFeedItemHeadlinesOperation.m";
                __int16 v58 = 1024;
                int v59 = 130;
                __int16 v60 = 2114;
                v61 = v38;
                _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
              }
            }
            [v43 addObject:v22];
            [v42 setObject:v22 forKey:v18];
          }
          ++v17;
        }
        while (v17 != v15);
        uint64_t v39 = [obj countByEnumeratingWithState:&v50 objects:v63 count:16];
        uint64_t v15 = v39;
      }
      while (v39);
    }

    [*(id *)(v8 + 32) setResultHeadlines:v43];
    v40 = [*(id *)(v8 + 32) properties];
    [v40 setResultHeadlinesByFeedItem:v42];

    a1 = v8;
    id v5 = 0;
  }
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v5];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v11 = a3;
  id v4 = [(FCFeedItemHeadlinesOperation *)self headlinesCompletionHandler];

  if (v4)
  {
    id v5 = [(FCFeedItemHeadlinesOperation *)self headlinesCompletionHandler];
    v6 = [(FCFeedItemHeadlinesOperation *)self resultHeadlines];
    ((void (**)(void, void *, id))v5)[2](v5, v6, v11);
  }
  uint64_t v7 = [(FCFeedItemHeadlinesOperation *)self headlinesMapCompletionHandler];

  if (v7)
  {
    uint64_t v8 = [(FCFeedItemHeadlinesOperation *)self headlinesMapCompletionHandler];
    v9 = [(FCFeedItemHeadlinesOperation *)self properties];
    char v10 = [v9 resultHeadlinesByFeedItem];
    ((void (**)(void, void *, id))v8)[2](v8, v10, v11);
  }
}

- (void)_fetchUnadornedHeadlinesWithCompletionHandler:(id)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v63 = a3;
  id v4 = [(FCFeedItemHeadlinesOperation *)self context];
  id v5 = [v4 internalContentContext];
  v66 = [v5 articleRecordSource];

  v6 = [(FCFeedItemHeadlinesOperation *)self context];
  uint64_t v7 = [v6 internalContentContext];
  v61 = [v7 issueRecordSource];

  uint64_t v8 = [(FCFeedItemHeadlinesOperation *)self context];
  v9 = [v8 internalContentContext];
  v65 = [v9 tagRecordSource];

  char v10 = [MEMORY[0x1E4F1CA60] dictionary];
  id v11 = [MEMORY[0x1E4F1CA80] set];
  v69 = [MEMORY[0x1E4F1CA80] set];
  v12 = [MEMORY[0x1E4F1CA80] set];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  v68 = self;
  __int16 v13 = [(FCFeedItemHeadlinesOperation *)self feedItems];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v86 objects:v90 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v87;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v87 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        uint64_t v19 = [v18 articleID];
        [v11 addObject:v19];
        v20 = [v18 sourceChannelID];

        if (v20)
        {
          v21 = [v18 sourceChannelID];
          [v69 addObject:v21];
        }
        v22 = [v18 parentIssueID];

        if (v22)
        {
          uint64_t v23 = [v18 parentIssueID];
          [v12 addObject:v23];
        }
        v24 = [v18 feedID];

        if (v24)
        {
          v25 = [v10 objectForKeyedSubscript:v19];
          if (!v25)
          {
            v25 = [MEMORY[0x1E4F1CA48] array];
            [v10 setObject:v25 forKeyedSubscript:v19];
          }
          uint64_t v26 = [v18 feedID];
          [v25 addObject:v26];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v86 objects:v90 count:16];
    }
    while (v15);
  }

  uint64_t v27 = [v11 allObjects];
  uint64_t v28 = [v66 cachedRecordsWithIDs:v27];

  v29 = [(FCFeedItemHeadlinesOperation *)v68 rapidUpdateRefreshTest];

  if (v29)
  {
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __78__FCFeedItemHeadlinesOperation__fetchUnadornedHeadlinesWithCompletionHandler___block_invoke;
    v83[3] = &unk_1E5B501F0;
    id v84 = v10;
    v85 = v68;
    uint64_t v30 = [v28 heldRecordsPassingTest:v83];

    uint64_t v28 = (void *)v30;
  }
  v31 = [v69 allObjects];
  v32 = [v65 cachedRecordsWithIDs:v31];

  v33 = [v12 allObjects];
  v34 = [v61 cachedRecordsWithIDs:v33];

  v35 = [MEMORY[0x1E4F1CA80] set];
  [v35 unionSet:v11];
  [v35 unionSet:v69];
  [v35 unionSet:v12];
  v36 = [v28 allRecordIDs];
  objc_msgSend(v35, "fc_removeObjectsFromArray:", v36);

  __int16 v58 = v32;
  v37 = [v32 allRecordIDs];
  objc_msgSend(v35, "fc_removeObjectsFromArray:", v37);

  __int16 v56 = v34;
  v38 = [v34 allRecordIDs];
  objc_msgSend(v35, "fc_removeObjectsFromArray:", v38);

  uint64_t v39 = (void *)MEMORY[0x1E4F1C978];
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __78__FCFeedItemHeadlinesOperation__fetchUnadornedHeadlinesWithCompletionHandler___block_invoke_2;
  v79[3] = &unk_1E5B50288;
  id v67 = v66;
  id v80 = v67;
  id v54 = v65;
  id v81 = v54;
  id v62 = v61;
  id v82 = v62;
  v40 = objc_msgSend(v39, "fc_array:", v79);
  v41 = objc_alloc_init(FCCKContentBatchedFetchRecordsOperation);
  v42 = [(FCFeedItemHeadlinesOperation *)v68 context];
  v43 = [v42 internalContentContext];
  v44 = [v43 contentDatabase];
  -[FCCKContentBatchedFetchRecordsOperation setDatabase:]((uint64_t)v41, v44);

  long long v46 = v68;
  if (v41) {
    objc_setProperty_nonatomic_copy(v41, v45, v40, 384);
  }
  if (![(FCFeedItemHeadlinesOperation *)v68 cachedOnly])
  {
    long long v47 = [v35 allObjects];
    long long v49 = objc_msgSend(v47, "fc_arrayByTransformingWithBlock:", &__block_literal_global_145);
    if (v41) {
      objc_setProperty_nonatomic_copy(v41, v48, v49, 376);
    }

    long long v46 = v68;
  }
  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __78__FCFeedItemHeadlinesOperation__fetchUnadornedHeadlinesWithCompletionHandler___block_invoke_4;
  newValue[3] = &unk_1E5B597F0;
  id v71 = v67;
  id v72 = v55;
  id v73 = v62;
  v74 = v46;
  id v75 = v28;
  id v76 = v58;
  id v77 = v56;
  id v78 = v63;
  id v64 = v63;
  id v57 = v56;
  id v59 = v58;
  id v60 = v28;
  id v50 = v62;
  id v51 = v55;
  id v53 = v67;
  if (v41) {
    objc_setProperty_nonatomic_copy(v41, v52, newValue, 400);
  }
  [(FCOperation *)v68 associateChildOperation:v41];
  [(FCOperation *)v41 start];
}

uint64_t __78__FCFeedItemHeadlinesOperation__fetchUnadornedHeadlinesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 behaviorFlags])
  {
    id v5 = (void *)MEMORY[0x1E4F1C9C8];
    v6 = [v3 base];
    uint64_t v7 = [v6 fetchDate];
    uint64_t v8 = [v5 dateWithPBDate:v7];
    objc_msgSend(v8, "fc_timeIntervalUntilNow");
    double v10 = v9;

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = *(void **)(a1 + 32);
    v12 = objc_msgSend(v3, "base", 0);
    __int16 v13 = [v12 identifier];
    uint64_t v14 = [v11 objectForKeyedSubscript:v13];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      while (2)
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 8 * v18);
          v20 = [*(id *)(a1 + 40) rapidUpdateRefreshTest];
          LOBYTE(v19) = v20[2](v20, v19, v10);

          if (v19)
          {
            uint64_t v4 = 0;
            goto LABEL_13;
          }
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
    uint64_t v4 = 1;
LABEL_13:
  }
  else
  {
    uint64_t v4 = 1;
  }

  return v4;
}

void __78__FCFeedItemHeadlinesOperation__fetchUnadornedHeadlinesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 desiredKeys];
  [v4 addObjectsFromArray:v5];

  v6 = [*(id *)(a1 + 40) desiredKeys];
  [v4 addObjectsFromArray:v6];

  id v7 = [*(id *)(a1 + 48) desiredKeys];
  [v4 addObjectsFromArray:v7];
}

id __78__FCFeedItemHeadlinesOperation__fetchUnadornedHeadlinesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithRecordName:v3];

  return v4;
}

void __78__FCFeedItemHeadlinesOperation__fetchUnadornedHeadlinesWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v49 = a3;
  id v54 = [MEMORY[0x1E4F1CA48] array];
  id v53 = [MEMORY[0x1E4F1CA48] array];
  long long v52 = [MEMORY[0x1E4F1CA48] array];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v50 = v4;
  id v5 = [v4 allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (!v6) {
    goto LABEL_18;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v58;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v58 != v8) {
        objc_enumerationMutation(v5);
      }
      double v10 = *(void **)(*((void *)&v57 + 1) + 8 * v9);
      id v11 = [v10 recordType];
      int v12 = [v11 isEqualToString:@"Article"];

      if (v12)
      {
        __int16 v13 = v54;
LABEL_12:
        [v13 addObject:v10];
        goto LABEL_13;
      }
      uint64_t v14 = [v10 recordType];
      int v15 = [v14 isEqualToString:@"Tag"];

      if (v15)
      {
        __int16 v13 = v53;
        goto LABEL_12;
      }
      uint64_t v16 = [v10 recordType];
      int v17 = [v16 isEqualToString:@"Issue"];

      if (v17)
      {
        __int16 v13 = v52;
        goto LABEL_12;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v18 = [NSString alloc];
        uint64_t v19 = [v10 recordType];
        v20 = (void *)[v18 initWithFormat:@"unexpected record type %@", v19];
        *(_DWORD *)buf = 136315906;
        id v62 = "-[FCFeedItemHeadlinesOperation _fetchUnadornedHeadlinesWithCompletionHandler:]_block_invoke_4";
        __int16 v63 = 2080;
        id v64 = "FCFeedItemHeadlinesOperation.m";
        __int16 v65 = 1024;
        int v66 = 282;
        __int16 v67 = 2114;
        v68 = v20;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
LABEL_13:
      ++v9;
    }
    while (v7 != v9);
    uint64_t v21 = [v5 countByEnumeratingWithState:&v57 objects:v69 count:16];
    uint64_t v7 = v21;
  }
  while (v21);
LABEL_18:

  uint64_t v22 = [*(id *)(a1 + 32) saveArticleRecords:v54];
  uint64_t v23 = [*(id *)(a1 + 40) saveTagRecords:v53];
  uint64_t v24 = [*(id *)(a1 + 48) saveRecords:v52];
  long long v25 = [*(id *)(a1 + 56) configuration];
  id v51 = (void *)v22;
  uint64_t v26 = +[FCHeldRecords heldRecordsByMerging:v22 with:*(void *)(a1 + 64)];
  long long v47 = (void *)v23;
  uint64_t v27 = +[FCHeldRecords heldRecordsByMerging:v23 with:*(void *)(a1 + 72)];
  long long v46 = (void *)v24;
  uint64_t v28 = +[FCHeldRecords heldRecordsByMerging:v24 with:*(void *)(a1 + 80)];
  v29 = [*(id *)(a1 + 56) feedItems];
  uint64_t v30 = objc_msgSend(v29, "fc_setByTransformingWithBlock:", &__block_literal_global_34_1);

  v31 = [*(id *)(a1 + 56) context];
  v32 = [v31 tagController];
  v44 = (void *)v27;
  v33 = [v32 channelsForTagRecords:v27];

  v34 = [*(id *)(a1 + 56) context];
  v35 = [v34 assetManager];
  v45 = v25;
  v36 = v26;
  v37 = FCHeadlinesByArticleIDFromHeldRecords(v25, v35, v30, v26, v33, v28, [*(id *)(a1 + 56) shouldFilterHeadlinesWithoutSourceChannels], 1);

  v38 = [*(id *)(a1 + 56) feedItems];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __78__FCFeedItemHeadlinesOperation__fetchUnadornedHeadlinesWithCompletionHandler___block_invoke_2_35;
  v55[3] = &unk_1E5B51960;
  id v56 = v37;
  id v39 = v37;
  v40 = objc_msgSend(v38, "fc_arrayByTransformingWithBlock:", v55);

  if ([v40 count])
  {
    v41 = 0;
    v42 = v49;
  }
  else
  {
    v42 = v49;
    v43 = [v49 allValues];
    v41 = [v43 firstObject];
  }
  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
}

uint64_t __78__FCFeedItemHeadlinesOperation__fetchUnadornedHeadlinesWithCompletionHandler___block_invoke_31(uint64_t a1, void *a2)
{
  return [a2 articleID];
}

id __78__FCFeedItemHeadlinesOperation__fetchUnadornedHeadlinesWithCompletionHandler___block_invoke_2_35(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 articleID];
  id v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
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

- (NSArray)feedItems
{
  return self->_feedItems;
}

- (void)setFeedItems:(id)a3
{
}

- (FCFeedPersonalizing)personalizer
{
  return self->_personalizer;
}

- (void)setPersonalizer:(id)a3
{
}

- (int64_t)feedPersonalizationConfigurationSet
{
  return self->_feedPersonalizationConfigurationSet;
}

- (void)setFeedPersonalizationConfigurationSet:(int64_t)a3
{
  self->_feedPersonalizationConfigurationSet = a3;
}

- (BOOL)shouldFilterHeadlinesWithoutSourceChannels
{
  return self->_shouldFilterHeadlinesWithoutSourceChannels;
}

- (void)setShouldFilterHeadlinesWithoutSourceChannels:(BOOL)a3
{
  self->_shouldFilterHeadlinesWithoutSourceChannels = a3;
}

- (BOOL)cachedOnly
{
  return self->_cachedOnly;
}

- (void)setCachedOnly:(BOOL)a3
{
  self->_cachedOnly = a3;
}

- (id)rapidUpdateRefreshTest
{
  return self->_rapidUpdateRefreshTest;
}

- (void)setRapidUpdateRefreshTest:(id)a3
{
}

- (NSDictionary)feedContextByFeedID
{
  return self->_feedContextByFeedID;
}

- (void)setFeedContextByFeedID:(id)a3
{
}

- (id)headlinesCompletionHandler
{
  return self->_headlinesCompletionHandler;
}

- (void)setHeadlinesCompletionHandler:(id)a3
{
}

- (id)headlinesMapCompletionHandler
{
  return self->_headlinesMapCompletionHandler;
}

- (void)setHeadlinesMapCompletionHandler:(id)a3
{
}

- (NSArray)resultHeadlines
{
  return self->_resultHeadlines;
}

- (void)setResultHeadlines:(id)a3
{
}

- (FCFeedItemHeadlinesOperationProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_resultHeadlines, 0);
  objc_storeStrong(&self->_headlinesMapCompletionHandler, 0);
  objc_storeStrong(&self->_headlinesCompletionHandler, 0);
  objc_storeStrong((id *)&self->_feedContextByFeedID, 0);
  objc_storeStrong(&self->_rapidUpdateRefreshTest, 0);
  objc_storeStrong((id *)&self->_personalizer, 0);
  objc_storeStrong((id *)&self->_feedItems, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end