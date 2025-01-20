@interface FCFeedPrewarmOperation
- (FCContentContext)contentContext;
- (FCFeedPrewarmOperation)initWithPrewarmRequest:(id)a3 contentContext:(id)a4;
- (FCFeedPrewarmRequest)prewarmRequest;
- (NFLazy)lazyResultPromise;
- (NSMutableDictionary)feedIDsByCKFeedID;
- (NSMutableDictionary)requestRangeByFeedID;
- (id)_commitQueryResult:(id)a3;
- (void)commitResultsOnceWithCompletionHandler:(id)a3;
- (void)performOperation;
- (void)setLazyResultPromise:(id)a3;
@end

@implementation FCFeedPrewarmOperation

- (FCFeedPrewarmOperation)initWithPrewarmRequest:(id)a3 contentContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FCFeedPrewarmOperation;
  v9 = [(FCOperation *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_prewarmRequest, a3);
    objc_storeStrong((id *)&v10->_contentContext, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    feedIDsByCKFeedID = v10->_feedIDsByCKFeedID;
    v10->_feedIDsByCKFeedID = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    requestRangeByFeedID = v10->_requestRangeByFeedID;
    v10->_requestRangeByFeedID = v13;
  }
  return v10;
}

- (void)commitResultsOnceWithCompletionHandler:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(FCOperation *)self startIfNeeded];
  v5 = [(FCFeedPrewarmOperation *)self lazyResultPromise];

  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)[[NSString alloc] initWithFormat:@"lazy result promise should be created as soon as the operation starts"];
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCFeedPrewarmOperation commitResultsOnceWithCompletionHandler:]";
    __int16 v21 = 2080;
    v22 = "FCFeedPrewarmOperation.m";
    __int16 v23 = 1024;
    int v24 = 65;
    __int16 v25 = 2114;
    v26 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__FCFeedPrewarmOperation_commitResultsOnceWithCompletionHandler___block_invoke;
  v18[3] = &unk_1E5B4E758;
  v18[4] = self;
  v6 = [MEMORY[0x1E4F81BF0] firstly:v18];
  id v7 = zalgo();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__FCFeedPrewarmOperation_commitResultsOnceWithCompletionHandler___block_invoke_2;
  v16[3] = &unk_1E5B4E780;
  id v8 = v4;
  id v17 = v8;
  v9 = [v6 thenOn:v7 then:v16];
  v10 = zalgo();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__FCFeedPrewarmOperation_commitResultsOnceWithCompletionHandler___block_invoke_3;
  v14[3] = &unk_1E5B4E7A8;
  v14[4] = self;
  id v15 = v8;
  id v11 = v8;
  id v12 = (id)[v9 errorOn:v10 error:v14];
}

id __65__FCFeedPrewarmOperation_commitResultsOnceWithCompletionHandler___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) lazyResultPromise];
  v2 = [v1 value];

  return v2;
}

uint64_t __65__FCFeedPrewarmOperation_commitResultsOnceWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return 0;
}

void __65__FCFeedPrewarmOperation_commitResultsOnceWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = [FCFeedPrewarmResult alloc];
  id v6 = [*(id *)(a1 + 32) prewarmRequest];
  id v4 = [v6 feedRequests];
  v5 = [(FCFeedPrewarmResult *)v3 initWithSuccessfulRequests:MEMORY[0x1E4F1CBF0] failedRequests:v4];
  (*(void (**)(uint64_t, FCFeedPrewarmResult *))(v2 + 16))(v2, v5);
}

- (void)performOperation
{
  v3 = [(FCFeedPrewarmOperation *)self prewarmRequest];
  id v4 = [v3 feedRequests];
  v5 = objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_17);

  id v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [(FCFeedPrewarmOperation *)self contentContext];
  id v8 = [v7 internalContentContext];
  v9 = [v8 feedDatabase];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __42__FCFeedPrewarmOperation_performOperation__block_invoke_2;
  v56[3] = &unk_1E5B4E7F0;
  v56[4] = self;
  id v10 = v6;
  id v57 = v10;
  -[FCFeedDatabase enumerateRangesMissingFromLookups:visitor:]((uint64_t)v9, v5, v56);

  if ([v10 count])
  {
    id v11 = objc_alloc_init(FCCKBatchedOrderFeedQueryOperation);
    id v12 = [(FCFeedPrewarmOperation *)self contentContext];
    v13 = [v12 internalContentContext];
    v14 = [v13 contentDatabase];
    -[FCCKBatchedOrderFeedQueryOperation setDatabase:]((uint64_t)v11, v14);

    if (v11)
    {
      objc_setProperty_nonatomic_copy(v11, v15, v10, 376);
      v11->_resultsLimit = 4000;
    }
    objc_super v16 = (void *)MEMORY[0x1E4F82A50];
    id v17 = [(FCFeedPrewarmOperation *)self contentContext];
    uint64_t v18 = [v17 internalContentContext];
    v19 = [(id)v18 articleRecordSource];
    v20 = [v16 keysForFeedItemAndArticleRecordWithRecordSource:v19];

    __int16 v21 = [MEMORY[0x1E4F1CA48] array];
    v22 = [(FCFeedPrewarmOperation *)self prewarmRequest];
    LOBYTE(v18) = [v22 options];

    v49 = v5;
    if ((v18 & 2) != 0)
    {
      __int16 v23 = [(FCFeedPrewarmOperation *)self contentContext];
      int v24 = [v23 internalContentContext];
      __int16 v25 = [v24 articleRecordSource];
      v26 = [v25 desiredKeys];
      uint64_t v27 = [v20 arrayByAddingObjectsFromArray:v26];

      v20 = (void *)v27;
    }
    v28 = [(FCFeedPrewarmOperation *)self prewarmRequest];
    char v29 = [v28 options];

    if ((v29 & 4) != 0)
    {
      v30 = [(FCFeedPrewarmOperation *)self contentContext];
      v31 = [v30 internalContentContext];
      v32 = [v31 tagRecordSource];
      v33 = [v32 desiredKeys];
      uint64_t v34 = [v20 arrayByAddingObjectsFromArray:v33];

      [v21 addObject:@"sourceChannelTagID"];
      v20 = (void *)v34;
    }
    v35 = [(FCFeedPrewarmOperation *)self prewarmRequest];
    char v36 = [v35 options];

    if ((v36 & 8) != 0)
    {
      v38 = [(FCFeedPrewarmOperation *)self contentContext];
      v39 = [v38 internalContentContext];
      v40 = [v39 issueRecordSource];
      v41 = [v40 desiredKeys];
      uint64_t v42 = [v20 arrayByAddingObjectsFromArray:v41];

      [v21 addObject:@"parentIssueID"];
      v20 = (void *)v42;
    }
    v5 = v50;
    if (v11)
    {
      objc_setProperty_nonatomic_copy(v11, v37, v20, 384);
      objc_setProperty_nonatomic_copy(v11, v43, v21, 408);
    }
    newValue[0] = MEMORY[0x1E4F143A8];
    newValue[1] = 3221225472;
    newValue[2] = __42__FCFeedPrewarmOperation_performOperation__block_invoke_5;
    newValue[3] = &unk_1E5B4E818;
    newValue[4] = self;
    if (v11)
    {
      objc_setProperty_nonatomic_copy(v11, v37, newValue, 432);
      queryCompletionPromise = v11->_queryCompletionPromise;
    }
    else
    {
      queryCompletionPromise = 0;
    }
    v45 = queryCompletionPromise;
    id v46 = objc_alloc(MEMORY[0x1E4F81BD0]);
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __42__FCFeedPrewarmOperation_performOperation__block_invoke_6;
    v51[3] = &unk_1E5B4E868;
    v52 = v45;
    v53 = self;
    v47 = v45;
    v48 = (void *)[v46 initWithConstructor:v51];
    [(FCFeedPrewarmOperation *)self setLazyResultPromise:v48];

    [(FCOperation *)self associateChildOperation:v11];
    [(FCOperation *)v11 start];
  }
  else
  {
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __42__FCFeedPrewarmOperation_performOperation__block_invoke_3;
    v55[3] = &unk_1E5B4C018;
    v55[4] = self;
    __42__FCFeedPrewarmOperation_performOperation__block_invoke_3((uint64_t)v55);
  }
}

FCFeedDatabaseLookup *__42__FCFeedPrewarmOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_alloc_init(FCFeedDatabaseLookup);
  v5 = [v2 feedID];
  if (v3) {
    objc_setProperty_nonatomic_copy(v3, v4, v5, 16);
  }

  id v6 = [v2 feedRange];

  if (v3) {
    objc_setProperty_nonatomic_copy(v3, v7, v6, 24);
  }

  return v3;
}

void __42__FCFeedPrewarmOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [v5 firstObject];
  id v8 = [v7 top];
  v9 = [v5 lastObject];

  id v10 = [v9 bottom];
  id v16 = +[FCFeedRange feedRangeWithTop:v8 bottom:v10];

  id v11 = +[FCCKOrderFeedUtilities orderFeedRequestForFeedID:v6 feedRange:v16];
  id v12 = [*(id *)(a1 + 32) feedIDsByCKFeedID];
  if (v11) {
    v13 = (void *)v11[1];
  }
  else {
    v13 = 0;
  }
  id v14 = v13;
  [v12 setObject:v6 forKey:v14];

  id v15 = [*(id *)(a1 + 32) requestRangeByFeedID];
  [v15 setObject:v16 forKey:v6];

  [*(id *)(a1 + 40) addObject:v11];
}

void __42__FCFeedPrewarmOperation_performOperation__block_invoke_3(uint64_t a1)
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F81BD0]) initWithConstructor:&__block_literal_global_17];
  [*(id *)(a1 + 32) setLazyResultPromise:v2];
}

id __42__FCFeedPrewarmOperation_performOperation__block_invoke_4()
{
  id v0 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v1 = [FCFeedPrewarmResult alloc];
  id v2 = [(FCFeedPrewarmResult *)v1 initWithSuccessfulRequests:MEMORY[0x1E4F1CBF0] failedRequests:MEMORY[0x1E4F1CBF0]];
  v3 = (void *)[v0 initWithValue:v2];

  return v3;
}

uint64_t __42__FCFeedPrewarmOperation_performOperation__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:");
}

id __42__FCFeedPrewarmOperation_performOperation__block_invoke_6(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F81BF0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__FCFeedPrewarmOperation_performOperation__block_invoke_7;
  v8[3] = &unk_1E5B4E758;
  id v9 = *(id *)(a1 + 32);
  v3 = [v2 firstly:v8];
  id v4 = zalgo();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__FCFeedPrewarmOperation_performOperation__block_invoke_8;
  v7[3] = &unk_1E5B4E840;
  v7[4] = *(void *)(a1 + 40);
  id v5 = [v3 thenOn:v4 then:v7];

  return v5;
}

id __42__FCFeedPrewarmOperation_performOperation__block_invoke_7(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __42__FCFeedPrewarmOperation_performOperation__block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1A6260FD0]();
  id v5 = [*(id *)(a1 + 32) _commitQueryResult:v3];

  return v5;
}

- (id)_commitQueryResult:(id)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [(FCOperation *)self shortOperationDescription];
    *(_DWORD *)buf = 138543362;
    v91 = v7;
    _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ will commit query response to database", buf, 0xCu);
  }
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  id v9 = [(FCFeedPrewarmOperation *)self feedIDsByCKFeedID];
  id v10 = [(FCFeedPrewarmOperation *)self requestRangeByFeedID];
  if (v4) {
    id v11 = (void *)v4[2];
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;
  v88[0] = MEMORY[0x1E4F143A8];
  v88[1] = 3221225472;
  v88[2] = __45__FCFeedPrewarmOperation__commitQueryResult___block_invoke;
  v88[3] = &unk_1E5B4E890;
  id v13 = v9;
  id v89 = v13;
  v78 = objc_msgSend(v12, "fc_dictionaryWithKeyBlock:valueBlock:", v88, &__block_literal_global_27);

  id v14 = [MEMORY[0x1E4F1C9C8] date];
  if (v4) {
    id v15 = (void *)v4[1];
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;
  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v86[2] = __45__FCFeedPrewarmOperation__commitQueryResult___block_invoke_3;
  v86[3] = &unk_1E5B4E8D8;
  v86[4] = self;
  id v17 = v13;
  id v87 = v17;
  v79 = objc_msgSend(v16, "fc_arrayByTransformingWithBlock:", v86);

  uint64_t v18 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v19 = v18;
    v20 = [(FCOperation *)self shortOperationDescription];
    uint64_t v21 = objc_msgSend(v14, "fc_millisecondTimeIntervalUntilNow");
    *(_DWORD *)buf = 138543618;
    v91 = v20;
    __int16 v92 = 2048;
    uint64_t v93 = v21;
    _os_log_impl(&dword_1A460D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ spent %llums creating feed items", buf, 0x16u);
  }
  v77 = v14;
  v22 = [MEMORY[0x1E4F1C9C8] date];
  __int16 v23 = [(FCFeedPrewarmOperation *)self contentContext];
  int v24 = [v23 internalContentContext];
  __int16 v25 = [v24 feedDatabase];
  v26 = [v17 allValues];
  -[FCFeedDatabase saveFeedItems:feedIDs:extentByFeedID:requestRangeByFeedID:]((uint64_t)v25, v79, v26, v78, v10);

  uint64_t v27 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v28 = v27;
    char v29 = [(FCOperation *)self shortOperationDescription];
    uint64_t v30 = objc_msgSend(v22, "fc_millisecondTimeIntervalUntilNow");
    uint64_t v31 = [v79 count];
    *(_DWORD *)buf = 138543874;
    v91 = v29;
    __int16 v92 = 2048;
    uint64_t v93 = v30;
    __int16 v94 = 2048;
    uint64_t v95 = v31;
    _os_log_impl(&dword_1A460D000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ spent %llums saving %lu feed items", buf, 0x20u);
  }
  v32 = [(FCFeedPrewarmOperation *)self prewarmRequest];
  char v33 = [v32 options];

  if ((v33 & 2) != 0)
  {
    uint64_t v34 = [(FCFeedPrewarmOperation *)self contentContext];
    v35 = [v34 internalContentContext];
    char v36 = [v35 articleRecordSource];
    if (v4) {
      v37 = (void *)v4[1];
    }
    else {
      v37 = 0;
    }
    id v38 = v37;
    id v39 = (id)[v36 saveArticleRecords:v38];
  }
  v40 = [(FCFeedPrewarmOperation *)self prewarmRequest];
  char v41 = [v40 options];

  if ((v41 & 4) != 0)
  {
    uint64_t v42 = [(FCFeedPrewarmOperation *)self contentContext];
    SEL v43 = [v42 internalContentContext];
    v44 = [v43 tagRecordSource];
    if (v4) {
      v45 = (void *)v4[3];
    }
    else {
      v45 = 0;
    }
    id v46 = v45;
    id v47 = (id)[v44 saveTagRecords:v46];
  }
  v48 = [(FCFeedPrewarmOperation *)self prewarmRequest];
  char v49 = [v48 options];

  if ((v49 & 8) != 0)
  {
    v50 = [(FCFeedPrewarmOperation *)self contentContext];
    v51 = [v50 internalContentContext];
    v52 = [v51 issueRecordSource];
    if (v4) {
      v53 = (void *)v4[4];
    }
    else {
      v53 = 0;
    }
    id v54 = v53;
    id v55 = (id)[v52 saveRecords:v54];
  }
  v56 = (void *)MEMORY[0x1E4F1CAD0];
  v76 = v22;
  if (v4) {
    id v57 = (void *)v4[2];
  }
  else {
    id v57 = 0;
  }
  id v58 = v57;
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __45__FCFeedPrewarmOperation__commitQueryResult___block_invoke_31;
  v84[3] = &unk_1E5B4E900;
  id v59 = v17;
  id v85 = v59;
  v60 = objc_msgSend(v58, "fc_arrayByTransformingWithBlock:", v84);
  v61 = [v56 setWithArray:v60];

  v62 = [(FCFeedPrewarmOperation *)self prewarmRequest];
  v63 = [v62 feedRequests];
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __45__FCFeedPrewarmOperation__commitQueryResult___block_invoke_2_32;
  v82[3] = &unk_1E5B4E928;
  id v64 = v61;
  id v83 = v64;
  v65 = objc_msgSend(v63, "fc_arrayOfObjectsPassingTest:", v82);

  v66 = [(FCFeedPrewarmOperation *)self prewarmRequest];
  v67 = [v66 feedRequests];
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __45__FCFeedPrewarmOperation__commitQueryResult___block_invoke_3_34;
  v80[3] = &unk_1E5B4E928;
  id v68 = v64;
  id v81 = v68;
  v69 = objc_msgSend(v67, "fc_arrayOfObjectsPassingTest:", v80);

  v70 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v71 = v70;
    v72 = [(FCOperation *)self shortOperationDescription];
    uint64_t v73 = objc_msgSend(v8, "fc_millisecondTimeIntervalUntilNow");
    *(_DWORD *)buf = 138543618;
    v91 = v72;
    __int16 v92 = 2048;
    uint64_t v93 = v73;
    _os_log_impl(&dword_1A460D000, v71, OS_LOG_TYPE_DEFAULT, "%{public}@ did commit query response to database, total time = %llums", buf, 0x16u);
  }
  v74 = [[FCFeedPrewarmResult alloc] initWithSuccessfulRequests:v65 failedRequests:v69];

  return v74;
}

id __45__FCFeedPrewarmOperation__commitQueryResult___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    id v3 = *(void **)(a2 + 16);
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  id v5 = [v2 objectForKeyedSubscript:v4];

  return v5;
}

uint64_t __45__FCFeedPrewarmOperation__commitQueryResult___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v2 = *(void *)(a2 + 32);
  }
  else {
    uint64_t v2 = 0;
  }
  return [NSNumber numberWithUnsignedLongLong:v2];
}

id __45__FCFeedPrewarmOperation__commitQueryResult___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F82A50];
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 contentContext];
  id v7 = [v6 contentStoreFrontID];
  id v8 = [*(id *)(a1 + 32) contentContext];
  id v9 = [v8 internalContentContext];
  id v10 = [v9 articleRecordSource];
  id v11 = [v3 feedItemFromCKRecord:v5 storefrontID:v7 recordSource:v10];

  id v12 = *(void **)(a1 + 40);
  id v13 = [v11 feedID];
  id v14 = [v12 objectForKeyedSubscript:v13];
  [v11 setFeedID:v14];

  return v11;
}

id __45__FCFeedPrewarmOperation__commitQueryResult___block_invoke_31(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if (*((unsigned char *)v3 + 10))
    {
      id v5 = 0;
      goto LABEL_6;
    }
    id v6 = (void *)*((void *)v3 + 2);
  }
  else
  {
    id v6 = 0;
  }
  id v7 = *(void **)(a1 + 32);
  id v8 = v6;
  id v5 = [v7 objectForKeyedSubscript:v8];

LABEL_6:
  return v5;
}

uint64_t __45__FCFeedPrewarmOperation__commitQueryResult___block_invoke_2_32(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 feedID];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __45__FCFeedPrewarmOperation__commitQueryResult___block_invoke_3_34(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 feedID];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (FCFeedPrewarmRequest)prewarmRequest
{
  return self->_prewarmRequest;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (NSMutableDictionary)feedIDsByCKFeedID
{
  return self->_feedIDsByCKFeedID;
}

- (NSMutableDictionary)requestRangeByFeedID
{
  return self->_requestRangeByFeedID;
}

- (NFLazy)lazyResultPromise
{
  return self->_lazyResultPromise;
}

- (void)setLazyResultPromise:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyResultPromise, 0);
  objc_storeStrong((id *)&self->_requestRangeByFeedID, 0);
  objc_storeStrong((id *)&self->_feedIDsByCKFeedID, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_prewarmRequest, 0);
}

@end