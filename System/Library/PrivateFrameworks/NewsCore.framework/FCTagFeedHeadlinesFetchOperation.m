@interface FCTagFeedHeadlinesFetchOperation
- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4;
- (FCFeedRange)freeFeedRange;
- (FCFeedRange)paidFeedRange;
- (FCTagFeedHeadlinesFetchOperation)initWithConfiguration:(id)a3 cloudContext:(id)a4 feedDescriptor:(id)a5 personalizer:(id)a6;
- (NSArray)precedingHeadlines;
- (NSDate)topOfFeedDate;
- (id)fetchCompletionHandler;
- (int64_t)maxFetchCount;
- (unint64_t)maxRetries;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)prepareOperation;
- (void)resetForRetry;
- (void)setFetchCompletionHandler:(id)a3;
- (void)setFreeFeedRange:(id)a3;
- (void)setMaxFetchCount:(int64_t)a3;
- (void)setPaidFeedRange:(id)a3;
- (void)setPrecedingHeadlines:(id)a3;
- (void)setTopOfFeedDate:(id)a3;
@end

@implementation FCTagFeedHeadlinesFetchOperation

- (FCTagFeedHeadlinesFetchOperation)initWithConfiguration:(id)a3 cloudContext:(id)a4 feedDescriptor:(id)a5 personalizer:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)FCTagFeedHeadlinesFetchOperation;
  v15 = [(FCOperation *)&v29 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_configuration, a3);
    objc_storeStrong((id *)&v16->_cloudContext, a4);
    objc_storeStrong((id *)&v16->_feedDescriptor, a5);
    objc_storeStrong((id *)&v16->_personalizer, a6);
    uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
    topOfFeedDate = v16->_topOfFeedDate;
    v16->_topOfFeedDate = (NSDate *)v17;

    v19 = [MEMORY[0x1E4F1C9C8] date];
    v20 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v19 sinceDate:-21600.0];
    v21 = [[FCDateRange alloc] initWithEarlierDate:v20 laterDate:v19];
    uint64_t v22 = +[FCFeedRange feedRangeFromDateRange:v21];
    freeFeedRange = v16->_freeFeedRange;
    v16->_freeFeedRange = (FCFeedRange *)v22;

    uint64_t v24 = +[FCFeedRange feedRangeFromDateRange:v21];
    paidFeedRange = v16->_paidFeedRange;
    v16->_paidFeedRange = (FCFeedRange *)v24;

    v16->_maxFetchCount = 10;
    uint64_t v26 = [MEMORY[0x1E4F1C978] array];
    precedingHeadlines = v16->_precedingHeadlines;
    v16->_precedingHeadlines = (NSArray *)v26;
  }
  return v16;
}

- (void)prepareOperation
{
  v3 = [(FCTagFeedHeadlinesFetchOperation *)self precedingHeadlines];
  objc_msgSend(v3, "fc_setByTransformingWithBlock:", &__block_literal_global_128);
  v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  shownArticleIDs = self->_shownArticleIDs;
  self->_shownArticleIDs = v4;

  id v8 = [(FCTagFeedHeadlinesFetchOperation *)self precedingHeadlines];
  objc_msgSend(v8, "fc_setByTransformingWithBlock:", &__block_literal_global_5_2);
  v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
  shownClusterIDs = self->_shownClusterIDs;
  self->_shownClusterIDs = v6;
}

uint64_t __52__FCTagFeedHeadlinesFetchOperation_prepareOperation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 articleID];
}

uint64_t __52__FCTagFeedHeadlinesFetchOperation_prepareOperation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 clusterID];
}

- (void)performOperation
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__53;
  v38[4] = __Block_byref_object_dispose__53;
  id v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  char v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__53;
  v34[4] = __Block_byref_object_dispose__53;
  id v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__53;
  v32[4] = __Block_byref_object_dispose__53;
  id v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__53;
  v30[4] = __Block_byref_object_dispose__53;
  id v31 = 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __52__FCTagFeedHeadlinesFetchOperation_performOperation__block_invoke;
  v29[3] = &unk_1E5B58310;
  v29[6] = v32;
  v29[7] = v30;
  v29[8] = v36;
  v29[9] = v34;
  v29[4] = self;
  v29[5] = v38;
  v28 = v29;
  if (self)
  {
    uint64_t v26 = self->_feedDescriptor;
    v3 = [(FCFeedDescriptor *)v26 backingTag];
    if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "tag");
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "-[FCTagFeedHeadlinesFetchOperation _fetchOrdinaryHeadlinesWithCompletionHandler:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "FCTagFeedHeadlinesFetchOperation.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v41) = 184;
      WORD2(v41) = 2114;
      *(void *)((char *)&v41 + 6) = v24;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    v27 = +[FCFeedContext feedContextForTag:v3];
    uint64_t v4 = [v3 tagType];
    BOOL v25 = v4 != 1;
    if (v4 == 1) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 3;
    }
    v6 = [v3 freeFeedIDForBin:v5];
    v7 = [v3 paidFeedIDForBin:v5];
    id v8 = [MEMORY[0x1E4F1CA48] array];
    v9 = [MEMORY[0x1E4F1CA60] dictionary];
    if (v6)
    {
      v10 = objc_alloc_init(FCFeedRequest);
      [(FCFeedRequest *)v10 setFeedID:v6];
      id v11 = [(FCTagFeedHeadlinesFetchOperation *)self freeFeedRange];
      [(FCFeedRequest *)v10 setFeedRange:v11];

      [(FCFeedRequest *)v10 setMaxCount:[(FCTagFeedHeadlinesFetchOperation *)self maxFetchCount]];
      [(FCFeedRequest *)v10 setCachedOnly:self->_fetchOrdinaryItemsFromCache];
      [v8 addObject:v10];
      [v9 setObject:v27 forKey:v6];
    }
    else
    {
      v10 = 0;
    }
    if (v4 != 1)
    {
      id v12 = self->_cloudContext;
      id v13 = [(FCCloudContext *)v12 paidAccessChecker];
      id v14 = [(FCFeedDescriptor *)v26 backingChannel];

      LODWORD(v12) = [v13 canGetSubscriptionToChannel:v14];
      if (v12)
      {
        int v15 = [v7 isEqualToString:v6];
        if (v10)
        {
          if (v15 != 1 && v7)
          {
            v16 = (void *)[(FCFeedRequest *)v10 copy];
            [v16 setFeedID:v7];
            uint64_t v17 = [(FCTagFeedHeadlinesFetchOperation *)self paidFeedRange];
            [v16 setFeedRange:v17];

            [v8 addObject:v16];
            [v9 setObject:v27 forKey:v7];
          }
        }
      }
    }
    v18 = objc_alloc_init(FCFeedRequestOperation);
    [(FCFeedRequestOperation *)v18 setContext:self->_cloudContext];
    [(FCFeedRequestOperation *)v18 setConfiguration:self->_configuration];
    [(FCFeedRequestOperation *)v18 setFeedRequests:v8];
    if (v10) {
      uint64_t v19 = [(FCFeedRequest *)v10 maxCount];
    }
    else {
      uint64_t v19 = [(FCTagFeedHeadlinesFetchOperation *)self maxFetchCount];
    }
    [(FCFeedRequestOperation *)v18 setMaxCount:v19];
    [(FCFeedRequestOperation *)v18 setOptions:14];
    [(FCFeedRequestOperation *)v18 setExpectedNetworkEventCount:1];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __81__FCTagFeedHeadlinesFetchOperation__fetchOrdinaryHeadlinesWithCompletionHandler___block_invoke;
    *(void *)&long long v41 = &unk_1E5B58388;
    v20 = v28;
    id v44 = v9;
    id v45 = v20;
    *((void *)&v41 + 1) = v6;
    id v42 = v7;
    v43 = self;
    BOOL v46 = v25;
    id v21 = v9;
    id v22 = v7;
    id v23 = v6;
    [(FCFeedRequestOperation *)v18 setRequestCompletionHandler:buf];
    [(FCOperation *)self associateChildOperation:v18];
    [(FCOperation *)v18 start];
  }
  _Block_object_dispose(v30, 8);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);
}

void __52__FCTagFeedHeadlinesFetchOperation_performOperation__block_invoke(void *a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  id v38 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a4);
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = a5;
  objc_storeStrong((id *)(*(void *)(a1[9] + 8) + 40), a6);
  int v15 = (void *)a1[4];
  if (*(void *)(*(void *)(a1[9] + 8) + 40))
  {
    objc_msgSend(v15, "finishedPerformingOperationWithError:");
  }
  else
  {
    if (v15) {
      int v15 = (void *)v15[55];
    }
    v16 = [v15 backingTag];
    uint64_t v17 = a1[4];
    if (v17) {
      v18 = *(void **)(v17 + 432);
    }
    else {
      v18 = 0;
    }
    uint64_t v19 = [v18 purchaseProvider];
    id v20 = v16;
    if ([v20 tagType] == 3)
    {
      id v21 = [v20 asSection];

      id v22 = [v21 parentID];
    }
    else
    {
      id v22 = [v20 identifier];
      id v21 = v20;
    }

    id v23 = v22;
    uint64_t v24 = [v19 purchasedTagIDs];
    char v25 = [v24 containsObject:v23];

    if ((v25 & 1) == 0)
    {
      uint64_t v27 = a1[4];
      if (v27)
      {
        uint64_t v28 = *(void *)(v27 + 424);
        uint64_t v29 = *(void *)(v27 + 432);
      }
      else
      {
        uint64_t v28 = 0;
        uint64_t v29 = 0;
      }
      v30 = +[FCFeedTransformationFilter transformationWithFilterOptions:0x2000 configuration:v28 context:v29];
      uint64_t v31 = [v30 transformHeadlines:*(void *)(*(void *)(a1[5] + 8) + 40)];
      uint64_t v32 = *(void *)(a1[5] + 8);
      id v33 = *(void **)(v32 + 40);
      *(void *)(v32 + 40) = v31;
    }
    v34 = (void *)a1[4];
    if (v34)
    {
      objc_setProperty_nonatomic_copy(v34, v26, *(id *)(*(void *)(a1[5] + 8) + 40), 472);
      v34 = (void *)a1[4];
      if (v34)
      {
        objc_setProperty_nonatomic_copy(v34, v35, *(id *)(*(void *)(a1[6] + 8) + 40), 480);
        v34 = (void *)a1[4];
        if (v34)
        {
          objc_setProperty_nonatomic_copy(v34, v36, *(id *)(*(void *)(a1[7] + 8) + 40), 488);
          uint64_t v37 = a1[4];
          if (v37)
          {
            *(unsigned char *)(v37 + 369) = *(unsigned char *)(*(void *)(a1[8] + 8) + 24);
            v34 = (void *)a1[4];
          }
          else
          {
            v34 = 0;
          }
        }
      }
    }
    [v34 finishedPerformingOperationWithError:0];
  }
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  id v11 = [(FCTagFeedHeadlinesFetchOperation *)self fetchCompletionHandler];
  uint64_t v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
  if (self)
  {
    v6 = self->_resultOrdinaryHeadlines;
    v7 = v6;
    if (v6) {
      uint64_t v5 = v6;
    }
    id v8 = self->_resultFetchedFreeRange;
    v9 = self->_resultFetchedPaidRange;
    BOOL resultFinished = self->_resultFinished;
  }
  else
  {
    v9 = 0;
    v7 = 0;
    id v8 = 0;
    BOOL resultFinished = 0;
  }
  ((void (**)(id, NSArray *, FCFeedRange *, FCFeedRange *, BOOL, id))v11)[2](v11, v5, v8, v9, resultFinished, v4);
}

- (unint64_t)maxRetries
{
  return 1;
}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  int v5 = objc_msgSend(a3, "fc_isRequestDroppedError");
  if (v5) {
    *a4 = (id)objc_opt_new();
  }
  return v5;
}

- (void)resetForRetry
{
  if (self) {
    self->_fetchOrdinaryItemsFromCache = 1;
  }
}

void __81__FCTagFeedHeadlinesFetchOperation__fetchOrdinaryHeadlinesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __81__FCTagFeedHeadlinesFetchOperation__fetchOrdinaryHeadlinesWithCompletionHandler___block_invoke_2;
    v48[3] = &unk_1E5B56F90;
    id v49 = *(id *)(a1 + 32);
    v9 = objc_msgSend(v7, "fc_firstObjectPassingTest:", v48);
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __81__FCTagFeedHeadlinesFetchOperation__fetchOrdinaryHeadlinesWithCompletionHandler___block_invoke_3;
    v46[3] = &unk_1E5B56F90;
    id v47 = *(id *)(a1 + 40);
    v10 = objc_msgSend(v7, "fc_firstObjectPassingTest:", v46);
    id v11 = [*(id *)(a1 + 48) topOfFeedDate];
    id v12 = +[FCFeedCursor cursorForDate:v11];

    uint64_t v13 = *(void *)(a1 + 48);
    if (v13) {
      id v14 = *(void **)(v13 + 440);
    }
    else {
      id v14 = 0;
    }
    id v35 = v14;
    int v15 = [v35 backingTag];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    id v38 = __81__FCTagFeedHeadlinesFetchOperation__fetchOrdinaryHeadlinesWithCompletionHandler___block_invoke_4;
    id v39 = &unk_1E5B58360;
    v16 = *(void **)(a1 + 56);
    uint64_t v40 = *(void *)(a1 + 48);
    id v17 = v16;
    char v45 = *(unsigned char *)(a1 + 72);
    id v41 = v17;
    id v42 = v9;
    id v43 = v10;
    id v44 = *(id *)(a1 + 64);
    id v34 = v10;
    id v18 = v9;
    id v36 = v8;
    id v19 = v8;
    id v20 = v15;
    id v21 = v12;
    id v22 = v37;
    if (v13)
    {
      if ([v20 tagType] == 1 && objc_msgSend(v19, "count"))
      {
        uint64_t v31 = [v19 valueForKeyPath:@"@max.order"];
        v30 = [v19 valueForKeyPath:@"@min.order"];
        id v33 = v18;
        uint64_t v29 = objc_msgSend(MEMORY[0x1E4F1C9C8], "fc_dateWithMillisecondTimeIntervalSince1970:", objc_msgSend(v31, "unsignedLongLongValue"));
        uint64_t v28 = objc_msgSend(MEMORY[0x1E4F1C9C8], "fc_dateWithMillisecondTimeIntervalSince1970:", objc_msgSend(v30, "unsignedLongLongValue") - 1);
        uint64_t v27 = +[FCDateRange dateRangeWithStartDate:v29 endDate:v28];
        id v32 = v21;
        id v23 = objc_alloc_init(FCMyArticlesSearchOperation);
        [(FCMyArticlesSearchOperation *)v23 setContext:*(void *)(v13 + 432)];
        uint64_t v24 = [*(id *)(v13 + 440) backingTag];
        char v25 = [v24 identifier];
        uint64_t v26 = +[FCFeedItemFeature featureForTopicID:v25];
        [(FCMyArticlesSearchOperation *)v23 setFeature:v26];

        id v18 = v33;
        [(FCMyArticlesSearchOperation *)v23 setDateRange:v27];
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __92__FCTagFeedHeadlinesFetchOperation_supplementFeedItems_forTag_fromCursor_completionHandler___block_invoke;
        v50[3] = &unk_1E5B583B0;
        v52 = v22;
        id v51 = v19;
        [(FCMyArticlesSearchOperation *)v23 setSearchCompletionHandler:v50];
        [(id)v13 associateChildOperation:v23];
        [(FCOperation *)v23 start];

        id v21 = v32;
      }
      else
      {
        v38((uint64_t)v22, v19);
      }
    }

    id v8 = v36;
  }
}

uint64_t __81__FCTagFeedHeadlinesFetchOperation__fetchOrdinaryHeadlinesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 feedID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __81__FCTagFeedHeadlinesFetchOperation__fetchOrdinaryHeadlinesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 feedID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __81__FCTagFeedHeadlinesFetchOperation__fetchOrdinaryHeadlinesWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v43 = a2;
  if (v2)
  {
    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v3 = *(id *)(v2 + 440);
    id v42 = +[FCFeedTransformationSort transformationWithSortMethod:configurationSet:personalizer:](FCFeedTransformationSort, "transformationWithSortMethod:configurationSet:personalizer:", [v3 feedSortMethod], objc_msgSend(v3, "feedPersonalizationConfigurationSet"), *(void *)(v2 + 448));
    [v38 addObject:v42];
    uint64_t v34 = [v3 feedFilterOptions];
    id v41 = [v3 otherArticleIDs];

    id v47 = [*(id *)(v2 + 456) setByAddingObjectsFromArray:v41];
    uint64_t v4 = *(void **)(v2 + 464);
    id v39 = *(id *)(v2 + 432);
    id v46 = v4;
    uint64_t v40 = [v39 subscriptionList];
    char v45 = [v40 subscribedTagIDs];
    id v36 = *(id *)(v2 + 432);
    uint64_t v37 = [v36 subscriptionList];
    uint64_t v29 = [v37 mutedTagIDs];
    id v32 = *(id *)(v2 + 432);
    id v33 = [v32 readingHistory];
    uint64_t v26 = [v33 readingHistoryItemsByArticleID];
    id v30 = *(id *)(v2 + 432);
    uint64_t v31 = [v30 audioPlaylist];
    char v25 = [v31 articleIDs];
    id v27 = *(id *)(v2 + 432);
    uint64_t v28 = [v27 offlineArticleManager];
    uint64_t v24 = [v28 readableArticleIDs];
    id v5 = *(id *)(v2 + 424);
    v6 = [v5 briefingsTagID];
    id v7 = *(id *)(v2 + 432);
    id v8 = [v7 paidAccessChecker];
    id v9 = *(id *)(v2 + 432);
    v10 = [v9 bundleSubscriptionManager];
    id v11 = [v10 cachedSubscription];
    id v35 = +[FCFeedTransformationFilter transformationWithFilterOptions:v34 otherArticleIDs:v47 otherClusterIDs:v46 subscribedTagIDs:v45 mutedTagIDs:v29 readingHistoryItems:v26 playlistArticleIDs:v25 downloadedArticleIDs:v24 briefingsTagID:v6 paidAccessChecker:v8 bundleSubscription:v11 paywalledArticlesMaxCount:0];

    id v12 = v38;
    [v38 addObject:v35];
  }
  else
  {
    id v12 = 0;
  }
  uint64_t v13 = FCApplyFeedTransformationsAndLog(v43, v12, 0);

  id v14 = *(void **)(a1 + 32);
  if (v14) {
    id v14 = (void *)v14[53];
  }
  int v15 = v14;
  v16 = objc_alloc_init(FCFeedItemHeadlinesOperation);
  [(FCFeedItemHeadlinesOperation *)v16 setConfiguration:v15];
  uint64_t v17 = *(void *)(a1 + 32);
  if (v17) {
    uint64_t v18 = *(void *)(v17 + 432);
  }
  else {
    uint64_t v18 = 0;
  }
  [(FCFeedItemHeadlinesOperation *)v16 setContext:v18];
  uint64_t v19 = *(void *)(a1 + 32);
  if (v19) {
    uint64_t v20 = *(void *)(v19 + 448);
  }
  else {
    uint64_t v20 = 0;
  }
  [(FCFeedItemHeadlinesOperation *)v16 setPersonalizer:v20];
  uint64_t v21 = *(void *)(a1 + 32);
  if (v21) {
    id v22 = *(void **)(v21 + 440);
  }
  else {
    id v22 = 0;
  }
  -[FCFeedItemHeadlinesOperation setFeedPersonalizationConfigurationSet:](v16, "setFeedPersonalizationConfigurationSet:", [v22 feedPersonalizationConfigurationSet]);
  [(FCFeedItemHeadlinesOperation *)v16 setFeedItems:v13];
  [(FCFeedItemHeadlinesOperation *)v16 setFeedContextByFeedID:*(void *)(a1 + 40)];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __81__FCTagFeedHeadlinesFetchOperation__fetchOrdinaryHeadlinesWithCompletionHandler___block_invoke_5;
  v48[3] = &unk_1E5B58338;
  char v53 = *(unsigned char *)(a1 + 72);
  void v48[4] = *(void *)(a1 + 32);
  id v49 = v15;
  id v50 = *(id *)(a1 + 48);
  id v51 = *(id *)(a1 + 56);
  id v52 = *(id *)(a1 + 64);
  id v23 = v15;
  [(FCFeedItemHeadlinesOperation *)v16 setHeadlinesCompletionHandler:v48];
  [*(id *)(a1 + 32) associateChildOperation:v16];
  [(FCOperation *)v16 start];
}

void __81__FCTagFeedHeadlinesFetchOperation__fetchOrdinaryHeadlinesWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  char v5 = *(unsigned char *)(a1 + 72) == 0;
  v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = a2;
  id v9 = [v6 precedingHeadlines];
  uint64_t v10 = [*(id *)(a1 + 40) minimumDistanceBetweenImageOnTopTiles];
  FCPromoteHeadlines(v8, v5, v9, MEMORY[0x1E4F1CBF0], v10);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  if ([*(id *)(a1 + 48) exhaustedRequestRange])
  {
    id v11 = *(void **)(a1 + 56);
    if (v11) {
      uint64_t v12 = [v11 exhaustedRequestRange];
    }
    else {
      uint64_t v12 = 1;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v13 = *(void *)(a1 + 64);
  id v14 = [*(id *)(a1 + 48) feedRange];
  int v15 = [*(id *)(a1 + 56) feedRange];
  (*(void (**)(uint64_t, id, void *, void *, uint64_t, id))(v13 + 16))(v13, v16, v14, v15, v12, v7);
}

void __92__FCTagFeedHeadlinesFetchOperation_supplementFeedItems_forTag_fromCursor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E4F1C978], "fc_arrayByAddingObjectsFromArray:toArray:", a2, *(void *)(a1 + 32));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (id)fetchCompletionHandler
{
  return self->_fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
}

- (NSDate)topOfFeedDate
{
  return self->_topOfFeedDate;
}

- (void)setTopOfFeedDate:(id)a3
{
}

- (FCFeedRange)freeFeedRange
{
  return self->_freeFeedRange;
}

- (void)setFreeFeedRange:(id)a3
{
}

- (FCFeedRange)paidFeedRange
{
  return self->_paidFeedRange;
}

- (void)setPaidFeedRange:(id)a3
{
}

- (int64_t)maxFetchCount
{
  return self->_maxFetchCount;
}

- (void)setMaxFetchCount:(int64_t)a3
{
  self->_maxFetchCount = a3;
}

- (NSArray)precedingHeadlines
{
  return self->_precedingHeadlines;
}

- (void)setPrecedingHeadlines:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultFetchedPaidRange, 0);
  objc_storeStrong((id *)&self->_resultFetchedFreeRange, 0);
  objc_storeStrong((id *)&self->_resultOrdinaryHeadlines, 0);
  objc_storeStrong((id *)&self->_shownClusterIDs, 0);
  objc_storeStrong((id *)&self->_shownArticleIDs, 0);
  objc_storeStrong((id *)&self->_personalizer, 0);
  objc_storeStrong((id *)&self->_feedDescriptor, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_precedingHeadlines, 0);
  objc_storeStrong((id *)&self->_paidFeedRange, 0);
  objc_storeStrong((id *)&self->_freeFeedRange, 0);
  objc_storeStrong((id *)&self->_topOfFeedDate, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
}

@end