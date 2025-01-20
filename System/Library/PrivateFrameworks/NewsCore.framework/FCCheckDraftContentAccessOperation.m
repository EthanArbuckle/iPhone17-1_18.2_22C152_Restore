@interface FCCheckDraftContentAccessOperation
- (BOOL)validateOperation;
- (FCCheckDraftContentAccessOperation)init;
- (FCContentContext)context;
- (NSArray)channelMemberships;
- (NSDictionary)resultAccessByContentID;
- (NSSet)articleIDs;
- (NSSet)issueIDs;
- (id)checkAccessCompletion;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setArticleIDs:(id)a3;
- (void)setChannelMemberships:(id)a3;
- (void)setCheckAccessCompletion:(id)a3;
- (void)setContext:(id)a3;
- (void)setIssueIDs:(id)a3;
- (void)setResultAccessByContentID:(id)a3;
@end

@implementation FCCheckDraftContentAccessOperation

- (FCCheckDraftContentAccessOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)FCCheckDraftContentAccessOperation;
  return [(FCOperation *)&v3 init];
}

- (BOOL)validateOperation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(FCCheckDraftContentAccessOperation *)self context];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)[[NSString alloc] initWithFormat:@"check draft content access operation requires context"];
    int v16 = 136315906;
    v17 = "-[FCCheckDraftContentAccessOperation validateOperation]";
    __int16 v18 = 2080;
    v19 = "FCCheckDraftContentAccessOperation.m";
    __int16 v20 = 1024;
    int v21 = 36;
    __int16 v22 = 2114;
    v23 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v16, 0x26u);
  }
  v4 = [(FCCheckDraftContentAccessOperation *)self channelMemberships];

  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)[[NSString alloc] initWithFormat:@"check draft content access operation requires channel memberships"];
    int v16 = 136315906;
    v17 = "-[FCCheckDraftContentAccessOperation validateOperation]";
    __int16 v18 = 2080;
    v19 = "FCCheckDraftContentAccessOperation.m";
    __int16 v20 = 1024;
    int v21 = 40;
    __int16 v22 = 2114;
    v23 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v16, 0x26u);
  }
  v5 = [(FCCheckDraftContentAccessOperation *)self issueIDs];
  if (v5)
  {

LABEL_10:
    char v7 = 1;
    goto LABEL_11;
  }
  v6 = [(FCCheckDraftContentAccessOperation *)self articleIDs];

  if (v6) {
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)[[NSString alloc] initWithFormat:@"check draft content access operation requires content IDs"];
    int v16 = 136315906;
    v17 = "-[FCCheckDraftContentAccessOperation validateOperation]";
    __int16 v18 = 2080;
    v19 = "FCCheckDraftContentAccessOperation.m";
    __int16 v20 = 1024;
    int v21 = 44;
    __int16 v22 = 2114;
    v23 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v16, 0x26u);
  }
  char v7 = 0;
LABEL_11:
  v8 = [(FCCheckDraftContentAccessOperation *)self checkAccessCompletion];

  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)[[NSString alloc] initWithFormat:@"check draft content access operation requires completion"];
    int v16 = 136315906;
    v17 = "-[FCCheckDraftContentAccessOperation validateOperation]";
    __int16 v18 = 2080;
    v19 = "FCCheckDraftContentAccessOperation.m";
    __int16 v20 = 1024;
    int v21 = 48;
    __int16 v22 = 2114;
    v23 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v16, 0x26u);
  }
  if (v3) {
    BOOL v9 = v4 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v7;
  }
  return v8 && v10;
}

- (void)performOperation
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(FCCheckDraftContentAccessOperation *)self channelMemberships];
  v4 = [(FCCheckDraftContentAccessOperation *)self articleIDs];
  v5 = [(FCCheckDraftContentAccessOperation *)self issueIDs];
  v6 = objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v49 objects:v60 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v50 != v10) {
          objc_enumerationMutation(v7);
        }
        [v6 addObject:*(void *)(*((void *)&v49 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v49 objects:v60 count:16];
    }
    while (v9);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v46 = 0u;
  long long v45 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v59 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v46 != v15) {
          objc_enumerationMutation(v12);
        }
        [v6 addObject:*(void *)(*((void *)&v45 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v45 objects:v59 count:16];
    }
    while (v14);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v17 = v3;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v58 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v42;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v42 != v20) {
          objc_enumerationMutation(v17);
        }
        __int16 v22 = *(void **)(*((void *)&v41 + 1) + 8 * k);
        v23 = [v22 draftIssueListID];
        objc_msgSend(v6, "fc_safelyAddObject:", v23);

        uint64_t v24 = [v22 draftArticleListID];
        objc_msgSend(v6, "fc_safelyAddObject:", v24);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v58 count:16];
    }
    while (v19);
  }

  v25 = objc_opt_new();
  v26 = [(FCCheckDraftContentAccessOperation *)self context];
  [v25 setContext:v26];

  v27 = [v6 allObjects];
  [v25 setTopLevelRecordIDs:v27];

  v37 = self;
  v56[0] = @"Article";
  v56[1] = @"ArticleList";
  v57[0] = MEMORY[0x1E4F1CBF0];
  v57[1] = MEMORY[0x1E4F1CBF0];
  v57[2] = MEMORY[0x1E4F1CBF0];
  v56[2] = @"Issue";
  v56[3] = @"IssueList";
  v55 = @"issueIDs";
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
  v57[3] = v28;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:4];
  [v25 setLinkKeysByRecordType:v29];

  v53[0] = @"Article";
  v30 = +[FCCachePolicy ignoreCacheCachePolicy];
  v54[0] = v30;
  v53[1] = @"ArticleList";
  v31 = +[FCCachePolicy ignoreCacheCachePolicy];
  v54[1] = v31;
  v53[2] = @"Issue";
  v32 = +[FCCachePolicy ignoreCacheCachePolicy];
  v54[2] = v32;
  v53[3] = @"IssueList";
  v33 = +[FCCachePolicy ignoreCacheCachePolicy];
  v54[3] = v33;
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:4];
  [v25 setCachePoliciesByRecordType:v34];

  [v25 setShouldReturnErrorWhenSomeRecordsMissing:0];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __54__FCCheckDraftContentAccessOperation_performOperation__block_invoke;
  v38[3] = &unk_1E5B56570;
  v38[4] = v37;
  id v39 = v12;
  id v40 = v7;
  id v35 = v7;
  id v36 = v12;
  [v25 setRecordChainCompletionHandler:v38];
  [(FCOperation *)v37 associateChildOperation:v25];
  [v25 start];
}

void __54__FCCheckDraftContentAccessOperation_performOperation__block_invoke(id *a1, void *a2, uint64_t a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    [a1[4] finishedPerformingOperationWithError:a3];
  }
  else
  {
    v6 = objc_opt_new();
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __54__FCCheckDraftContentAccessOperation_performOperation__block_invoke_2;
    v38[3] = &unk_1E5B4C2F0;
    id v27 = v5;
    id v25 = v5;
    id v39 = v25;
    uint64_t v8 = objc_msgSend(v7, "fc_set:", v38);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v9 = a1[5];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "containsObject:", v14));
          [v6 setObject:v15 forKeyedSubscript:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v11);
    }

    int v16 = (void *)MEMORY[0x1E4F1CAD0];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __54__FCCheckDraftContentAccessOperation_performOperation__block_invoke_26;
    v32[3] = &unk_1E5B4C2F0;
    id v33 = v25;
    id v17 = objc_msgSend(v16, "fc_set:", v32);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v26 = a1;
    id v18 = a1[6];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v40 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v28 + 1) + 8 * j);
          uint64_t v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v17, "containsObject:", v23, v26));
          [v6 setObject:v24 forKeyedSubscript:v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v40 count:16];
      }
      while (v20);
    }

    [v26[4] setResultAccessByContentID:v6];
    [v26[4] finishedPerformingOperationWithError:0];

    id v5 = v27;
  }
}

void __54__FCCheckDraftContentAccessOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:&unk_1EF8D7EC0];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = [v4 allRecords];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v24 + 1) + 8 * i) issueIDs];
        objc_msgSend(v3, "fc_safelyAddObjects:", v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:&unk_1EF8D7ED8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v12 = objc_msgSend(v11, "allRecords", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v20 + 1) + 8 * j);
        if (([v17 isDraft] & 1) == 0)
        {
          id v18 = [v17 base];
          uint64_t v19 = [v18 identifier];
          [v3 addObject:v19];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v14);
  }
}

void __54__FCCheckDraftContentAccessOperation_performOperation__block_invoke_26(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:&unk_1EF8D7EF0];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v5 = [v4 allRecords];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v35 + 1) + 8 * i) articleIDs];
        objc_msgSend(v3, "fc_safelyAddObjects:", v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:&unk_1EF8D7ED8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v12 = [v11 allRecords];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [*(id *)(*((void *)&v31 + 1) + 8 * j) allArticleIDs];
        objc_msgSend(v3, "fc_safelyAddObjects:", v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v14);
  }

  id v18 = [*(id *)(a1 + 32) objectForKeyedSubscript:&unk_1EF8D7F08];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v19 = objc_msgSend(v18, "allRecords", 0);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = *(void **)(*((void *)&v27 + 1) + 8 * k);
        if (([v24 isDraft] & 1) == 0)
        {
          long long v25 = [v24 base];
          long long v26 = [v25 identifier];
          [v3 addObject:v26];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v21);
  }
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [(FCCheckDraftContentAccessOperation *)self checkAccessCompletion];
  id v5 = [(FCCheckDraftContentAccessOperation *)self resultAccessByContentID];
  v6[2](v6, v5, v4);
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSArray)channelMemberships
{
  return self->_channelMemberships;
}

- (void)setChannelMemberships:(id)a3
{
}

- (NSSet)issueIDs
{
  return self->_issueIDs;
}

- (void)setIssueIDs:(id)a3
{
}

- (NSSet)articleIDs
{
  return self->_articleIDs;
}

- (void)setArticleIDs:(id)a3
{
}

- (id)checkAccessCompletion
{
  return self->_checkAccessCompletion;
}

- (void)setCheckAccessCompletion:(id)a3
{
}

- (NSDictionary)resultAccessByContentID
{
  return self->_resultAccessByContentID;
}

- (void)setResultAccessByContentID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultAccessByContentID, 0);
  objc_storeStrong(&self->_checkAccessCompletion, 0);
  objc_storeStrong((id *)&self->_articleIDs, 0);
  objc_storeStrong((id *)&self->_issueIDs, 0);
  objc_storeStrong((id *)&self->_channelMemberships, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end