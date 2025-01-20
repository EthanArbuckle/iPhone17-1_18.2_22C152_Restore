@interface FCTagFeedPromotedHeadlinesFetchOperation
- (BOOL)validateOperation;
- (FCTagFeedPromotedHeadlinesFetchOperation)initWithConfiguration:(id)a3 cloudContext:(id)a4 tagID:(id)a5 expireAfterTimeWindow:(double)a6;
- (id)fetchCompletionHandler;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setFetchCompletionHandler:(id)a3;
@end

@implementation FCTagFeedPromotedHeadlinesFetchOperation

- (FCTagFeedPromotedHeadlinesFetchOperation)initWithConfiguration:(id)a3 cloudContext:(id)a4 tagID:(id)a5 expireAfterTimeWindow:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FCTagFeedPromotedHeadlinesFetchOperation;
  v14 = [(FCOperation *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_configuration, a3);
    objc_storeStrong((id *)&v15->_cloudContext, a4);
    objc_storeStrong((id *)&v15->_tagID, a5);
    v15->_expireAfterTimeWindow = a6;
  }

  return v15;
}

- (BOOL)validateOperation
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self && self->_tagID)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v2)
    {
      v3 = (void *)[[NSString alloc] initWithFormat:@"Promoted headlines operation must have a tag ID"];
      int v5 = 136315906;
      v6 = "-[FCTagFeedPromotedHeadlinesFetchOperation validateOperation]";
      __int16 v7 = 2080;
      v8 = "FCTagFeedPromotedHeadlinesFetchOperation.m";
      __int16 v9 = 1024;
      int v10 = 60;
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);

      LOBYTE(v2) = 0;
    }
  }
  return v2;
}

- (void)performOperation
{
  v24[1] = *(id *)MEMORY[0x1E4F143B8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__FCTagFeedPromotedHeadlinesFetchOperation_performOperation__block_invoke;
  v15[3] = &unk_1E5B4C8F8;
  v15[4] = self;
  v3 = v15;
  if (self)
  {
    v4 = objc_alloc_init(FCRecordChainFetchOperation);
    [(FCRecordChainFetchOperation *)v4 setContext:self->_cloudContext];
    v24[0] = self->_tagID;
    int v5 = (void *)MEMORY[0x1E4F1C978];
    id v6 = v24[0];
    __int16 v7 = [v5 arrayWithObjects:v24 count:1];

    [(FCRecordChainFetchOperation *)v4 setTopLevelRecordIDs:v7];
    v22[0] = @"Article";
    v21[0] = @"sourceChannelTagID";
    v21[1] = @"parentIssueID";
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    v23[0] = v8;
    v22[1] = @"Tag";
    v20 = @"publisherSpecifiedArticleIDs";
    __int16 v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    v22[2] = @"Issue";
    v23[1] = v9;
    v23[2] = MEMORY[0x1E4F1CBF0];
    int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
    [(FCRecordChainFetchOperation *)v4 setLinkKeysByRecordType:v10];

    tagID = self->_tagID;
    __int16 v11 = tagID;
    id v12 = +[FCCachePolicy cachePolicyWithSoftMaxAge:300.0];
    v19 = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&tagID count:1];
    [(FCRecordChainFetchOperation *)v4 setCachePoliciesByRecordID:v13];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __87__FCTagFeedPromotedHeadlinesFetchOperation__fetchPinnedHeadlinesWithCompletionHandler___block_invoke;
    v16[3] = &unk_1E5B54190;
    v14 = v3;
    v16[4] = self;
    id v17 = v14;
    [(FCRecordChainFetchOperation *)v4 setRecordChainCompletionHandler:v16];
    [(FCOperation *)self associateChildOperation:v4];
    [(FCOperation *)v4 start];
  }
}

void __60__FCTagFeedPromotedHeadlinesFetchOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id newValue = a2;
  id v6 = a3;
  __int16 v7 = *(void **)(a1 + 32);
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    if (v7)
    {
      objc_setProperty_nonatomic_copy(v7, v5, newValue, 408);
      __int16 v7 = *(void **)(a1 + 32);
    }
    id v8 = 0;
  }
  [v7 finishedPerformingOperationWithError:v8];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FCTagFeedPromotedHeadlinesFetchOperation *)self fetchCompletionHandler];
  if (self) {
    resultHeadlines = self->_resultHeadlines;
  }
  else {
    resultHeadlines = 0;
  }
  if (resultHeadlines) {
    __int16 v7 = resultHeadlines;
  }
  else {
    __int16 v7 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = (id)v5;
  (*(void (**)(uint64_t, NSArray *, id))(v5 + 16))(v5, v7, v4);
}

void __87__FCTagFeedPromotedHeadlinesFetchOperation__fetchPinnedHeadlinesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v48 = (void (**)(id, void, id))*(id *)(a1 + 40);
    id v47 = v6;
    v48[2](v48, 0, v47);

    __int16 v7 = v48;
  }
  else
  {
    __int16 v7 = [v5 objectForKeyedSubscript:&unk_1EF8D7C68];
    id v8 = [v5 objectForKeyedSubscript:&unk_1EF8D7C80];
    __int16 v9 = [v5 objectForKeyedSubscript:&unk_1EF8D7C98];
    int v10 = *(void **)(a1 + 32);
    if (v10) {
      int v10 = (void *)v10[47];
    }
    v45 = v10;
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      id v12 = *(void **)(v11 + 384);
    }
    else {
      id v12 = 0;
    }
    uint64_t v13 = [v12 tagController];
    v14 = [v13 tagsForTagRecords:v8];

    uint64_t v15 = *(void *)(a1 + 32);
    if (v15) {
      uint64_t v16 = *(void *)(v15 + 392);
    }
    else {
      uint64_t v16 = 0;
    }
    id v17 = [v14 objectForKey:v16];
    v18 = [MEMORY[0x1E4F1C9C8] date];
    v19 = v18;
    uint64_t v20 = *(void *)(a1 + 32);
    v44 = v14;
    if (v20) {
      double v21 = *(double *)(v20 + 400);
    }
    else {
      double v21 = 0.0;
    }
    uint64_t v22 = objc_msgSend(v18, "fc_dateBySubtractingTimeInterval:", v21);

    v23 = [v17 publisherSpecifiedArticleIDsModifiedDate];
    v43 = (void *)v22;
    LOBYTE(v22) = objc_msgSend(v23, "fc_isLaterThan:", v22);

    if (v22)
    {
      v24 = *(void **)(a1 + 32);
      v42 = v8;
      if (v24) {
        v24 = (void *)v24[48];
      }
      v25 = v24;
      v26 = [v25 assetManager];
      v27 = (void *)MEMORY[0x1E4F1CAD0];
      v28 = [v17 publisherSpecifiedArticleIDs];
      v29 = [v27 setWithArray:v28];
      v40 = FCHeadlinesByArticleIDFromHeldRecords(v45, v26, v29, v7, v44, v9, 0, 1);

      uint64_t v30 = *(void *)(a1 + 32);
      v41 = v9;
      if (v30)
      {
        uint64_t v31 = *(void *)(v30 + 384);
        id v32 = *(id *)(v30 + 376);
        v33 = +[FCFeedTransformationFilter transformationWithFilterOptions:0x200002118 configuration:v32 context:v31];
      }
      else
      {
        v33 = 0;
      }
      v34 = objc_msgSend(v17, "publisherSpecifiedArticleIDs", v7);
      v35 = objc_msgSend(v40, "nf_objectsForKeysWithoutMarker:", v34);

      v36 = [v33 transformHeadlines:v35];
      v37 = [v17 publisherSpecifiedArticles];
      v38 = FCAssignHeadlineMetadata(v36, v37, 0);

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      __int16 v9 = v41;
      id v8 = v42;
      __int16 v7 = v39;
    }
    else
    {
      id v46 = *(id *)(a1 + 40);
      (*((void (**)(id, void, void))v46 + 2))(v46, 0, 0);
    }
  }
}

uint64_t __87__FCTagFeedPromotedHeadlinesFetchOperation__fetchPinnedHeadlinesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __87__FCTagFeedPromotedHeadlinesFetchOperation__fetchPinnedHeadlinesWithCompletionHandler___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)fetchCompletionHandler
{
  return self->_fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHeadlines, 0);
  objc_storeStrong((id *)&self->_tagID, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
}

@end