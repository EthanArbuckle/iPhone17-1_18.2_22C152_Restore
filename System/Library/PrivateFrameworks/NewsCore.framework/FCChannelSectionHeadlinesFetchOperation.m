@interface FCChannelSectionHeadlinesFetchOperation
- (BOOL)validateOperation;
- (FCChannelProviding)channel;
- (FCChannelSectionHeadlinesFetchOperation)init;
- (FCChannelSectionHeadlinesFetchOperation)initWithCloudContext:(id)a3 channelID:(id)a4 maxHeadlinesCount:(unint64_t)a5 maxHeadlinesPerFeed:(unint64_t)a6 fetchWindow:(id)a7 sectionsCacheTimeToLive:(double)a8 edgeCacheHint:(id)a9;
- (FCCloudContext)cloudContext;
- (FCDateRange)fetchWindow;
- (FCEdgeCacheHint)edgeCacheHint;
- (NSArray)sectionHeadlinesGroups;
- (NSString)channelID;
- (double)sectionsCacheTimeToLive;
- (id)_channelAndSectionTagsPromiseWithChannelID:(id)a3;
- (id)_channelPromiseWithTagsByID:(id)a3 parentChannelID:(id)a4;
- (id)_configurationPromise;
- (id)_createFeedRequestWithFeedID:(id)a3 feedRange:(id)a4;
- (id)_feedItemsPromiseWithChannel:(id)a3 sectionsByID:(id)a4 configuration:(id)a5;
- (id)_feedItemsTransformationWithConfiguration:(id)a3;
- (id)_headlinesAssembledBySectionFromFeedItemMap:(id)a3 sectionIDsByFeedID:(id)a4 sectionsByID:(id)a5;
- (id)_headlinesPromiseWithFeedItems:(id)a3 sectionsByID:(id)a4 configuration:(id)a5;
- (id)_sectionsPromiseWithTagsByID:(id)a3 sectionIDs:(id)a4;
- (id)fetchCompletionHandler;
- (unint64_t)maxHeadlinesCount;
- (unint64_t)maxHeadlinesPerFeed;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setFetchCompletionHandler:(id)a3;
- (void)setSectionHeadlinesGroups:(id)a3;
@end

@implementation FCChannelSectionHeadlinesFetchOperation

- (FCChannelSectionHeadlinesFetchOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCChannelSectionHeadlinesFetchOperation init]";
    __int16 v9 = 2080;
    v10 = "FCChannelSectionHeadlinesFetchOperation.m";
    __int16 v11 = 1024;
    int v12 = 139;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCChannelSectionHeadlinesFetchOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCChannelSectionHeadlinesFetchOperation)initWithCloudContext:(id)a3 channelID:(id)a4 maxHeadlinesCount:(unint64_t)a5 maxHeadlinesPerFeed:(unint64_t)a6 fetchWindow:(id)a7 sectionsCacheTimeToLive:(double)a8 edgeCacheHint:(id)a9
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a7;
  id v20 = a9;
  v26.receiver = self;
  v26.super_class = (Class)FCChannelSectionHeadlinesFetchOperation;
  v21 = [(FCOperation *)&v26 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_cloudContext, a3);
    uint64_t v23 = [v18 copy];
    channelID = v22->_channelID;
    v22->_channelID = (NSString *)v23;

    v22->_maxHeadlinesCount = a5;
    v22->_maxHeadlinesPerFeed = a6;
    objc_storeStrong((id *)&v22->_fetchWindow, a7);
    v22->_sectionsCacheTimeToLive = a8;
    objc_storeStrong((id *)&v22->_edgeCacheHint, a9);
  }

  return v22;
}

- (BOOL)validateOperation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(FCChannelSectionHeadlinesFetchOperation *)self cloudContext];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v9 = (void *)[[NSString alloc] initWithFormat:@"Channel section headlines fetch operation must have a content context"];
    int v12 = 136315906;
    __int16 v13 = "-[FCChannelSectionHeadlinesFetchOperation validateOperation]";
    __int16 v14 = 2080;
    uint64_t v15 = "FCChannelSectionHeadlinesFetchOperation.m";
    __int16 v16 = 1024;
    int v17 = 170;
    __int16 v18 = 2114;
    id v19 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);
  }
  uint64_t v4 = [(FCChannelSectionHeadlinesFetchOperation *)self channelID];

  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)[[NSString alloc] initWithFormat:@"Channel section headlines fetch operation must have a channel ID"];
    int v12 = 136315906;
    __int16 v13 = "-[FCChannelSectionHeadlinesFetchOperation validateOperation]";
    __int16 v14 = 2080;
    uint64_t v15 = "FCChannelSectionHeadlinesFetchOperation.m";
    __int16 v16 = 1024;
    int v17 = 174;
    __int16 v18 = 2114;
    id v19 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);
  }
  v5 = [(FCChannelSectionHeadlinesFetchOperation *)self fetchCompletionHandler];

  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v11 = (void *)[[NSString alloc] initWithFormat:@"Channel section headlines fetch operation must have a fetch completion handler"];
    int v12 = 136315906;
    __int16 v13 = "-[FCChannelSectionHeadlinesFetchOperation validateOperation]";
    __int16 v14 = 2080;
    uint64_t v15 = "FCChannelSectionHeadlinesFetchOperation.m";
    __int16 v16 = 1024;
    int v17 = 178;
    __int16 v18 = 2114;
    id v19 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);
  }
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  return !v6 && v5 != 0;
}

- (void)performOperation
{
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__73;
  v30[4] = __Block_byref_object_dispose__73;
  id v31 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__73;
  v28[4] = __Block_byref_object_dispose__73;
  id v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__73;
  v26[4] = __Block_byref_object_dispose__73;
  id v27 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke;
  v25[3] = &unk_1E5B4E758;
  v25[4] = self;
  int v17 = [MEMORY[0x1E4F81BF0] firstly:v25];
  __int16 v16 = zalgo();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_2;
  v24[3] = &unk_1E5B5A6B0;
  v24[4] = self;
  v24[5] = v30;
  uint64_t v15 = [v17 thenOn:v16 then:v24];
  __int16 v14 = zalgo();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_3;
  v23[3] = &unk_1E5B5A6D8;
  v23[4] = self;
  v23[5] = v28;
  __int16 v13 = [v15 thenOn:v14 then:v23];
  v3 = zalgo();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_4;
  v22[3] = &unk_1E5B5A700;
  v22[4] = self;
  v22[5] = v28;
  uint64_t v4 = [v13 thenOn:v3 then:v22];
  v5 = zalgo();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_5;
  v21[3] = &unk_1E5B5A728;
  v21[4] = self;
  v21[5] = v26;
  v21[6] = v30;
  BOOL v6 = [v4 thenOn:v5 then:v21];
  v7 = zalgo();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_6;
  v20[3] = &unk_1E5B5A750;
  v20[4] = self;
  v20[5] = v26;
  v20[6] = v30;
  v8 = [v6 thenOn:v7 then:v20];
  __int16 v9 = zalgo();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_7;
  v19[3] = &unk_1E5B5A778;
  v19[4] = self;
  v10 = [v8 thenOn:v9 then:v19];
  __int16 v11 = zalgo();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_8;
  v18[3] = &unk_1E5B4FD28;
  v18[4] = self;
  id v12 = (id)[v10 errorOn:v11 error:v18];

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);

  _Block_object_dispose(v30, 8);
}

uint64_t __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configurationPromise];
}

id __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  v5 = *(void **)(a1 + 32);
  BOOL v6 = [v5 channelID];
  v7 = [v5 _channelAndSectionTagsPromiseWithChannelID:v6];

  return v7;
}

id __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v7 = [v5 channelID];
  v8 = [v5 _channelPromiseWithTagsByID:v6 parentChannelID:v7];

  return v8;
}

id __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 424), a2);
  id v4 = a2;
  v5 = *(id **)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v7 = [v5[53] sectionIDs];
  v8 = [v5 _sectionsPromiseWithTagsByID:v6 sectionIDs:v7];

  return v8;
}

id __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_5(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  v5 = [*(id *)(a1 + 32) _feedItemsPromiseWithChannel:*(void *)(*(void *)(a1 + 32) + 424) sectionsByID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) configuration:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

  return v5;
}

uint64_t __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _headlinesPromiseWithFeedItems:a2 sectionsByID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) configuration:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

uint64_t __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_7(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t __59__FCChannelSectionHeadlinesFetchOperation_performOperation__block_invoke_8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v10 = a3;
  id v4 = [FCChannelSectionHeadlinesFetchResult alloc];
  v5 = [(FCChannelSectionHeadlinesFetchOperation *)self channel];
  uint64_t v6 = [(FCChannelSectionHeadlinesFetchOperation *)self sectionHeadlinesGroups];
  v7 = [(FCChannelSectionHeadlinesFetchResult *)v4 initWithChannel:v5 sectionHeadlinesGroups:v6];

  v8 = [(FCChannelSectionHeadlinesFetchOperation *)self fetchCompletionHandler];

  if (v8)
  {
    __int16 v9 = [(FCChannelSectionHeadlinesFetchOperation *)self fetchCompletionHandler];
    ((void (**)(void, FCChannelSectionHeadlinesFetchResult *, id))v9)[2](v9, v7, v10);
  }
}

- (id)_configurationPromise
{
  v2 = [(FCChannelSectionHeadlinesFetchOperation *)self cloudContext];
  v3 = [v2 configurationManager];
  id v4 = FCCoreConfigurationPromise(v3);

  return v4;
}

- (id)_channelAndSectionTagsPromiseWithChannelID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "channelID");
    *(_DWORD *)buf = 136315906;
    __int16 v13 = "-[FCChannelSectionHeadlinesFetchOperation _channelAndSectionTagsPromiseWithChannelID:]";
    __int16 v14 = 2080;
    uint64_t v15 = "FCChannelSectionHeadlinesFetchOperation.m";
    __int16 v16 = 1024;
    int v17 = 229;
    __int16 v18 = 2114;
    id v19 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__FCChannelSectionHeadlinesFetchOperation__channelAndSectionTagsPromiseWithChannelID___block_invoke;
  v10[3] = &unk_1E5B50378;
  v10[4] = self;
  id v11 = v4;
  id v6 = v4;
  v7 = (void *)[v5 initWithResolver:v10];

  return v7;
}

void __86__FCChannelSectionHeadlinesFetchOperation__channelAndSectionTagsPromiseWithChannelID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) cloudContext];
  v8 = [v7 tagController];
  v19[0] = *(void *)(a1 + 40);
  __int16 v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [*(id *)(a1 + 32) sectionsCacheTimeToLive];
  id v10 = objc_msgSend(v8, "fetchOperationForTagsIncludingChildrenWithIDs:softMaxAge:", v9);

  [v10 setCanSendFetchCompletionSynchronously:1];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __86__FCChannelSectionHeadlinesFetchOperation__channelAndSectionTagsPromiseWithChannelID___block_invoke_2;
  __int16 v16 = &unk_1E5B55308;
  id v17 = v6;
  id v18 = v5;
  id v11 = v5;
  id v12 = v6;
  [v10 setFetchCompletionBlock:&v13];
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v10, v13, v14, v15, v16);
  [v10 start];
}

void __86__FCChannelSectionHeadlinesFetchOperation__channelAndSectionTagsPromiseWithChannelID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 error];
  if (v4)
  {
    v7 = (void (**)(id, id))*(id *)(a1 + 32);
    id v6 = v4;
    v7[2](v7, v6);
  }
  else
  {
    id v5 = [v3 fetchedObject];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __86__FCChannelSectionHeadlinesFetchOperation__channelAndSectionTagsPromiseWithChannelID___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_channelPromiseWithTagsByID:(id)a3 parentChannelID:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagsByID");
    *(_DWORD *)buf = 136315906;
    uint64_t v20 = "-[FCChannelSectionHeadlinesFetchOperation _channelPromiseWithTagsByID:parentChannelID:]";
    __int16 v21 = 2080;
    v22 = "FCChannelSectionHeadlinesFetchOperation.m";
    __int16 v23 = 1024;
    int v24 = 256;
    __int16 v25 = 2114;
    objc_super v26 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "parentChannelID");
    *(_DWORD *)buf = 136315906;
    uint64_t v20 = "-[FCChannelSectionHeadlinesFetchOperation _channelPromiseWithTagsByID:parentChannelID:]";
    __int16 v21 = 2080;
    v22 = "FCChannelSectionHeadlinesFetchOperation.m";
    __int16 v23 = 1024;
    int v24 = 257;
    __int16 v25 = 2114;
    objc_super v26 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  id v8 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__FCChannelSectionHeadlinesFetchOperation__channelPromiseWithTagsByID_parentChannelID___block_invoke;
  v15[3] = &unk_1E5B507A0;
  id v16 = v6;
  id v17 = self;
  id v18 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = (void *)[v8 initWithResolver:v15];

  return v11;
}

void __87__FCChannelSectionHeadlinesFetchOperation__channelPromiseWithTagsByID_parentChannelID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) channelID];
  id v9 = [v7 objectForKeyedSubscript:v8];
  id v10 = [v9 asChannel];

  if (v10)
  {
    id v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 48)];
    id v12 = [v11 asChannel];

    v5[2](v5, v12);
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __87__FCChannelSectionHeadlinesFetchOperation__channelPromiseWithTagsByID_parentChannelID___block_invoke_2;
    v13[3] = &unk_1E5B4CC80;
    v13[4] = *(void *)(a1 + 40);
    id v14 = v6;
    __87__FCChannelSectionHeadlinesFetchOperation__channelPromiseWithTagsByID_parentChannelID___block_invoke_2((uint64_t)v13);
  }
}

void __87__FCChannelSectionHeadlinesFetchOperation__channelPromiseWithTagsByID_parentChannelID___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 shortOperationDescription];
    id v6 = [*(id *)(a1 + 32) channelID];
    int v11 = 138543618;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetch failed. The tag with identifer %@ is not a valid channel.", (uint8_t *)&v11, 0x16u);
  }
  id v7 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [*(id *)(a1 + 32) channelID];
  id v10 = objc_msgSend(v7, "fc_invalidChannelErrorForTagID:", v9);
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v10);
}

- (id)_sectionsPromiseWithTagsByID:(id)a3 sectionIDs:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagsByID");
    *(_DWORD *)buf = 136315906;
    uint64_t v20 = "-[FCChannelSectionHeadlinesFetchOperation _sectionsPromiseWithTagsByID:sectionIDs:]";
    __int16 v21 = 2080;
    v22 = "FCChannelSectionHeadlinesFetchOperation.m";
    __int16 v23 = 1024;
    int v24 = 272;
    __int16 v25 = 2114;
    objc_super v26 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "sectionIDs");
    *(_DWORD *)buf = 136315906;
    uint64_t v20 = "-[FCChannelSectionHeadlinesFetchOperation _sectionsPromiseWithTagsByID:sectionIDs:]";
    __int16 v21 = 2080;
    v22 = "FCChannelSectionHeadlinesFetchOperation.m";
    __int16 v23 = 1024;
    int v24 = 273;
    __int16 v25 = 2114;
    objc_super v26 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  id v8 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__FCChannelSectionHeadlinesFetchOperation__sectionsPromiseWithTagsByID_sectionIDs___block_invoke;
  v15[3] = &unk_1E5B507A0;
  id v16 = v7;
  id v17 = v6;
  id v18 = self;
  id v9 = v6;
  id v10 = v7;
  int v11 = (void *)[v8 initWithResolver:v15];

  return v11;
}

void __83__FCChannelSectionHeadlinesFetchOperation__sectionsPromiseWithTagsByID_sectionIDs___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v30 = a2;
  id v29 = a3;
  v32 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = a1[4];
  uint64_t v5 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v36;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v36 != v7) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = *(void *)(*((void *)&v35 + 1) + 8 * v8);
      id v10 = objc_msgSend(a1[5], "objectForKeyedSubscript:", v9, v29);
      int v11 = [v10 asSection];

      if (!v11)
      {
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __83__FCChannelSectionHeadlinesFetchOperation__sectionsPromiseWithTagsByID_sectionIDs___block_invoke_2;
        v33[3] = &unk_1E5B4E088;
        v33[4] = a1[6];
        v33[5] = v9;
        v28 = v29;
        id v34 = v29;
        __83__FCChannelSectionHeadlinesFetchOperation__sectionsPromiseWithTagsByID_sectionIDs___block_invoke_2((uint64_t)v33);

        objc_super v26 = v30;
        uint64_t v27 = v32;
        goto LABEL_18;
      }
      id v12 = [a1[5] objectForKeyedSubscript:v9];
      __int16 v13 = [v12 asSection];

      id v14 = [a1[6] channel];
      uint64_t v15 = [v14 defaultSectionID];
      id v16 = [v13 identifier];
      int v17 = [v15 isEqualToString:v16];

      if (!v17)
      {
        id v18 = [v13 supergroupKnobs];
        if (![v18 isEligible])
        {

LABEL_12:
          __int16 v21 = (void *)FCOperationLog;
          if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
          {
            id v22 = a1[6];
            __int16 v23 = v21;
            int v24 = [v22 shortOperationDescription];
            __int16 v25 = [v13 description];
            *(_DWORD *)buf = 138543618;
            v40 = v24;
            __int16 v41 = 2114;
            v42 = v25;
            _os_log_impl(&dword_1A460D000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: Filtering out ineligible section: %{public}@", buf, 0x16u);
          }
          goto LABEL_14;
        }
        BOOL v19 = +[FCTagController isTagAllowed:v13];

        if (!v19) {
          goto LABEL_12;
        }
      }
      uint64_t v20 = [v13 asSection];
      [v32 setObject:v20 forKeyedSubscript:v9];

LABEL_14:
      if (v6 == ++v8)
      {
        uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  objc_super v26 = v30;
  uint64_t v27 = v32;
  (*((void (**)(id, void *))v30 + 2))(v30, v32);
  v28 = v29;
LABEL_18:
}

void __83__FCChannelSectionHeadlinesFetchOperation__sectionsPromiseWithTagsByID_sectionIDs___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    uint64_t v5 = [v3 shortOperationDescription];
    uint64_t v6 = *(void *)(a1 + 40);
    int v11 = 138543618;
    id v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetch failed. The tag with identifer %@ is not a valid section.", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = [*(id *)(a1 + 32) channelID];
  id v10 = objc_msgSend(v8, "fc_invalidChannelErrorForTagID:", v9);
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);
}

- (id)_feedItemsPromiseWithChannel:(id)a3 sectionsByID:(id)a4 configuration:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "channel");
    *(_DWORD *)buf = 136315906;
    int v24 = "-[FCChannelSectionHeadlinesFetchOperation _feedItemsPromiseWithChannel:sectionsByID:configuration:]";
    __int16 v25 = 2080;
    objc_super v26 = "FCChannelSectionHeadlinesFetchOperation.m";
    __int16 v27 = 1024;
    int v28 = 309;
    __int16 v29 = 2114;
    id v30 = v17;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10) {
      goto LABEL_6;
    }
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "configuration");
    *(_DWORD *)buf = 136315906;
    int v24 = "-[FCChannelSectionHeadlinesFetchOperation _feedItemsPromiseWithChannel:sectionsByID:configuration:]";
    __int16 v25 = 2080;
    objc_super v26 = "FCChannelSectionHeadlinesFetchOperation.m";
    __int16 v27 = 1024;
    int v28 = 310;
    __int16 v29 = 2114;
    id v30 = v18;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  id v11 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __99__FCChannelSectionHeadlinesFetchOperation__feedItemsPromiseWithChannel_sectionsByID_configuration___block_invoke;
  v19[3] = &unk_1E5B5A7C8;
  v19[4] = self;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  uint64_t v15 = (void *)[v11 initWithResolver:v19];

  return v15;
}

void __99__FCChannelSectionHeadlinesFetchOperation__feedItemsPromiseWithChannel_sectionsByID_configuration___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v40 = a2;
  id v39 = a3;
  uint64_t v5 = [a1[4] fetchWindow];
  uint64_t v6 = [v5 laterDate];
  uint64_t v7 = objc_msgSend(v6, "fc_dateByRoundingDownToNearestQuarterHour");

  id v8 = [a1[4] fetchWindow];
  uint64_t v9 = [v8 earlierDate];

  __int16 v41 = (void *)v9;
  v42 = (void *)v7;
  v43 = +[FCFeedRange feedRangeFromDate:v7 toDate:v9];
  id v10 = objc_opt_new();
  id v11 = objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v12 = [a1[5] sectionIDs];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v49 objects:v61 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v50 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        id v18 = [a1[6] objectForKeyedSubscript:v17];

        if (v18)
        {
          BOOL v19 = [a1[5] freeFeedIDForSection:v17 bin:3];
          [v10 setObject:v17 forKeyedSubscript:v19];
          id v20 = [a1[4] _createFeedRequestWithFeedID:v19 feedRange:v43];
          [v11 addObject:v20];

          id v21 = [a1[5] paidFeedIDForSection:v17 bin:3];
          id v22 = v21;
          if (v21 && ([v21 isEqualToString:v19] & 1) == 0)
          {
            [v10 setObject:v17 forKeyedSubscript:v22];
            __int16 v23 = [a1[4] _createFeedRequestWithFeedID:v22 feedRange:v43];
            [v11 addObject:v23];
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v49 objects:v61 count:16];
    }
    while (v14);
  }

  int v24 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = a1[4];
    objc_super v26 = v24;
    __int16 v27 = [v25 shortOperationDescription];
    int v28 = [v43 dateRange];
    uint64_t v29 = [v11 count];
    id v30 = [a1[5] identifier];
    *(_DWORD *)buf = 138544130;
    v54 = v27;
    __int16 v55 = 2112;
    v56 = v28;
    __int16 v57 = 2048;
    uint64_t v58 = v29;
    __int16 v59 = 2112;
    v60 = v30;
    _os_log_impl(&dword_1A460D000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetching feed items in range %@ for %lu number of feeds in channel %@", buf, 0x2Au);
  }
  uint64_t v31 = objc_alloc_init(FCFeedRequestOperation);
  v32 = [a1[4] cloudContext];
  [(FCFeedRequestOperation *)v31 setContext:v32];

  [(FCFeedRequestOperation *)v31 setConfiguration:a1[7]];
  [(FCFeedRequestOperation *)v31 setFeedRequests:v11];
  -[FCFeedRequestOperation setMaxCount:](v31, "setMaxCount:", [a1[4] maxHeadlinesCount]);
  [(FCFeedRequestOperation *)v31 setOptions:14];
  v33 = [a1[4] edgeCacheHint];
  [(FCFeedRequestOperation *)v31 setEdgeCacheHint:v33];

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __99__FCChannelSectionHeadlinesFetchOperation__feedItemsPromiseWithChannel_sectionsByID_configuration___block_invoke_102;
  v44[3] = &unk_1E5B5A7A0;
  id v34 = a1[4];
  id v47 = v39;
  v44[4] = v34;
  id v35 = a1[7];
  id v48 = v40;
  id v45 = v35;
  id v46 = v10;
  id v36 = v10;
  id v37 = v40;
  id v38 = v39;
  [(FCFeedRequestOperation *)v31 setRequestCompletionHandler:v44];
  [a1[4] associateChildOperation:v31];
  [(FCOperation *)v31 start];
}

void __99__FCChannelSectionHeadlinesFetchOperation__feedItemsPromiseWithChannel_sectionsByID_configuration___block_invoke_102(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v13 = (void (**)(id, id))*(id *)(a1 + 56);
    id v12 = v7;
    v13[2](v13, v12);
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) _feedItemsTransformationWithConfiguration:*(void *)(a1 + 40)];
    uint64_t v9 = [v8 transformFeedItems:v6];
    uint64_t v10 = *(void *)(a1 + 64);
    id v11 = [[FCFeedItemsWithIDLookupResult alloc] initWithSectionIDByFeedID:*(void *)(a1 + 48) feedItems:v9];
    (*(void (**)(uint64_t, FCFeedItemsWithIDLookupResult *))(v10 + 16))(v10, v11);
  }
}

uint64_t __99__FCChannelSectionHeadlinesFetchOperation__feedItemsPromiseWithChannel_sectionsByID_configuration___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_headlinesPromiseWithFeedItems:(id)a3 sectionsByID:(id)a4 configuration:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "feedItemsResult");
    *(_DWORD *)buf = 136315906;
    objc_super v26 = "-[FCChannelSectionHeadlinesFetchOperation _headlinesPromiseWithFeedItems:sectionsByID:configuration:]";
    __int16 v27 = 2080;
    int v28 = "FCChannelSectionHeadlinesFetchOperation.m";
    __int16 v29 = 1024;
    int v30 = 376;
    __int16 v31 = 2114;
    v32 = v17;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "sectionsByID");
    *(_DWORD *)buf = 136315906;
    objc_super v26 = "-[FCChannelSectionHeadlinesFetchOperation _headlinesPromiseWithFeedItems:sectionsByID:configuration:]";
    __int16 v27 = 2080;
    int v28 = "FCChannelSectionHeadlinesFetchOperation.m";
    __int16 v29 = 1024;
    int v30 = 377;
    __int16 v31 = 2114;
    v32 = v18;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    BOOL v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "configuration");
    *(_DWORD *)buf = 136315906;
    objc_super v26 = "-[FCChannelSectionHeadlinesFetchOperation _headlinesPromiseWithFeedItems:sectionsByID:configuration:]";
    __int16 v27 = 2080;
    int v28 = "FCChannelSectionHeadlinesFetchOperation.m";
    __int16 v29 = 1024;
    int v30 = 378;
    __int16 v31 = 2114;
    v32 = v19;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v11 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __101__FCChannelSectionHeadlinesFetchOperation__headlinesPromiseWithFeedItems_sectionsByID_configuration___block_invoke;
  v20[3] = &unk_1E5B5A7C8;
  id v21 = v10;
  id v22 = self;
  id v23 = v8;
  id v24 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  uint64_t v15 = (void *)[v11 initWithResolver:v20];

  return v15;
}

void __101__FCChannelSectionHeadlinesFetchOperation__headlinesPromiseWithFeedItems_sectionsByID_configuration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  [v4 setConfiguration:*(void *)(a1 + 32)];
  uint64_t v5 = [*(id *)(a1 + 40) cloudContext];
  [v4 setContext:v5];

  id v6 = [*(id *)(a1 + 48) feedItems];
  [v4 setFeedItems:v6];

  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __101__FCChannelSectionHeadlinesFetchOperation__headlinesPromiseWithFeedItems_sectionsByID_configuration___block_invoke_2;
  id v12 = &unk_1E5B5A7F0;
  id v7 = *(void **)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 40);
  id v14 = v7;
  id v15 = *(id *)(a1 + 56);
  id v16 = v3;
  id v8 = v3;
  [v4 setHeadlinesMapCompletionHandler:&v9];
  objc_msgSend(*(id *)(a1 + 40), "associateChildOperation:", v4, v9, v10, v11, v12, v13);
  [v4 start];
}

void __101__FCChannelSectionHeadlinesFetchOperation__headlinesPromiseWithFeedItems_sectionsByID_configuration___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) sectionIDsByFeedID];
  uint64_t v17 = v3;
  id v6 = [v4 _headlinesAssembledBySectionFromFeedItemMap:v3 sectionIDsByFeedID:v5 sectionsByID:*(void *)(a1 + 48)];

  id v7 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v12);
        id v14 = [FCChannelSectionHeadlinesOperationGroup alloc];
        id v15 = [v8 objectForKeyedSubscript:v13];
        id v16 = [(FCChannelSectionHeadlinesOperationGroup *)v14 initWithSection:v13 headlines:v15];
        [v7 addObject:v16];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)_createFeedRequestWithFeedID:(id)a3 feedRange:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(FCFeedRequest);
  [(FCFeedRequest *)v8 setFeedID:v7];

  [(FCFeedRequest *)v8 setMaxCount:[(FCChannelSectionHeadlinesFetchOperation *)self maxHeadlinesPerFeed]];
  [(FCFeedRequest *)v8 setFeedRange:v6];

  return v8;
}

- (id)_headlinesAssembledBySectionFromFeedItemMap:(id)a3 sectionIDsByFeedID:(id)a4 sectionsByID:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v32 = a4;
  id v7 = a5;
  id v8 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v9 = [v7 allValues];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        id v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v31);
        [v8 setObject:v15 forKeyedSubscript:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v11);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v16 = v31;
  uint64_t v17 = [v31 keyEnumerator];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        uint64_t v23 = objc_msgSend(v22, "feedID", v31);
        id v24 = [v32 objectForKeyedSubscript:v23];

        id v25 = [v7 objectForKeyedSubscript:v24];
        uint64_t v26 = [v16 objectForKey:v22];
        __int16 v27 = (void *)v26;
        if (v25) {
          BOOL v28 = v26 == 0;
        }
        else {
          BOOL v28 = 1;
        }
        if (!v28)
        {
          __int16 v29 = [v8 objectForKeyedSubscript:v25];
          [v29 addObject:v27];

          id v16 = v31;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v19);
  }

  return v8;
}

- (id)_feedItemsTransformationWithConfiguration:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "configuration");
    *(_DWORD *)buf = 136315906;
    uint64_t v20 = "-[FCChannelSectionHeadlinesFetchOperation _feedItemsTransformationWithConfiguration:]";
    __int16 v21 = 2080;
    id v22 = "FCChannelSectionHeadlinesFetchOperation.m";
    __int16 v23 = 1024;
    int v24 = 444;
    __int16 v25 = 2114;
    uint64_t v26 = v16;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v5 = [(FCChannelSectionHeadlinesFetchOperation *)self cloudContext];
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v7 = [(FCChannelSectionHeadlinesFetchOperation *)self channelID];
  uint64_t v18 = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  uint64_t v9 = (void *)[v6 initWithArray:v8];
  uint64_t v10 = +[FCFeedTransformationFilter transformationWithFilterOptions:0x60002213CLL configuration:v4 context:v5 ignoreMutedTagIDs:v9];

  uint64_t v11 = [v5 readingHistory];
  uint64_t v12 = +[FCFeedTransformationUnreadOnly transformationWithReadingHistory:v11];

  v17[0] = v10;
  v17[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  uint64_t v14 = [[FCFeedTransformationComposite alloc] initWithFeedTransformations:v13];

  return v14;
}

- (id)fetchCompletionHandler
{
  return objc_getProperty(self, a2, 368, 1);
}

- (void)setFetchCompletionHandler:(id)a3
{
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (unint64_t)maxHeadlinesCount
{
  return self->_maxHeadlinesCount;
}

- (unint64_t)maxHeadlinesPerFeed
{
  return self->_maxHeadlinesPerFeed;
}

- (FCDateRange)fetchWindow
{
  return self->_fetchWindow;
}

- (double)sectionsCacheTimeToLive
{
  return self->_sectionsCacheTimeToLive;
}

- (FCChannelProviding)channel
{
  return self->_channel;
}

- (NSArray)sectionHeadlinesGroups
{
  return self->_sectionHeadlinesGroups;
}

- (void)setSectionHeadlinesGroups:(id)a3
{
}

- (FCEdgeCacheHint)edgeCacheHint
{
  return self->_edgeCacheHint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeCacheHint, 0);
  objc_storeStrong((id *)&self->_sectionHeadlinesGroups, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_fetchWindow, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
}

@end