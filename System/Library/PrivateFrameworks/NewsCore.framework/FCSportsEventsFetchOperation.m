@interface FCSportsEventsFetchOperation
- (BOOL)validateOperation;
- (FCCachePolicy)cachePolicy;
- (FCSportsEventsFetchOperation)initWithContext:(id)a3 tagController:(id)a4 sportsEventIDs:(id)a5 delegate:(id)a6;
- (id)delegate;
- (id)fetchCompletionHandler;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setCachePolicy:(id)a3;
- (void)setFetchCompletionHandler:(id)a3;
@end

@implementation FCSportsEventsFetchOperation

- (FCSportsEventsFetchOperation)initWithContext:(id)a3 tagController:(id)a4 sportsEventIDs:(id)a5 delegate:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "context");
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCSportsEventsFetchOperation initWithContext:tagController:sportsEventIDs:delegate:]";
    __int16 v26 = 2080;
    v27 = "FCSportsEventsFetchOperation.m";
    __int16 v28 = 1024;
    int v29 = 46;
    __int16 v30 = 2114;
    v31 = v20;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v12) {
      goto LABEL_6;
    }
  }
  else if (v12)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagController");
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCSportsEventsFetchOperation initWithContext:tagController:sportsEventIDs:delegate:]";
    __int16 v26 = 2080;
    v27 = "FCSportsEventsFetchOperation.m";
    __int16 v28 = 1024;
    int v29 = 47;
    __int16 v30 = 2114;
    v31 = v21;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "sportsEventIDs");
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCSportsEventsFetchOperation initWithContext:tagController:sportsEventIDs:delegate:]";
    __int16 v26 = 2080;
    v27 = "FCSportsEventsFetchOperation.m";
    __int16 v28 = 1024;
    int v29 = 48;
    __int16 v30 = 2114;
    v31 = v22;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v23.receiver = self;
  v23.super_class = (Class)FCSportsEventsFetchOperation;
  v15 = [(FCOperation *)&v23 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_context, a3);
    objc_storeStrong((id *)&v16->_tagController, a4);
    objc_storeStrong((id *)&v16->_sportsEventIDs, a5);
    uint64_t v17 = objc_msgSend(v11, "news_core_ConfigurationManager");
    appConfigurationManager = v16->_appConfigurationManager;
    v16->_appConfigurationManager = (FCNewsAppConfigurationManager *)v17;

    objc_storeWeak((id *)&v16->_delegate, v14);
  }

  return v16;
}

- (BOOL)validateOperation
{
  if (self)
  {
    context = self->_context;
    self = (FCSportsEventsFetchOperation *)self->_sportsEventIDs;
    BOOL v3 = context != 0;
  }
  else
  {
    BOOL v3 = 0;
  }
  return [(FCSportsEventsFetchOperation *)self count] && v3;
}

- (void)performOperation
{
  v12[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_alloc_init(FCRecordChainFetchOperation);
  v4 = v3;
  if (self)
  {
    [(FCRecordChainFetchOperation *)v3 setTopLevelRecordIDs:self->_sportsEventIDs];
    context = self->_context;
  }
  else
  {
    [(FCRecordChainFetchOperation *)v3 setTopLevelRecordIDs:0];
    context = 0;
  }
  [(FCRecordChainFetchOperation *)v4 setContext:context];
  v6 = [(FCSportsEventsFetchOperation *)self cachePolicy];
  [(FCRecordChainFetchOperation *)v4 setCachePolicy:v6];

  v11[0] = @"SportsEvent";
  v10[0] = @"eventCompetitorTagIDs";
  v10[1] = @"eventLeagueTagID";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v11[1] = @"Tag";
  v12[0] = v7;
  v12[1] = MEMORY[0x1E4F1CBF0];
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  [(FCRecordChainFetchOperation *)v4 setLinkKeysByRecordType:v8];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__FCSportsEventsFetchOperation_performOperation__block_invoke;
  v9[3] = &unk_1E5B4E3F0;
  v9[4] = self;
  [(FCRecordChainFetchOperation *)v4 setRecordChainCompletionHandler:v9];
  [(FCOperation *)self associateChildOperation:v4];
  [(FCOperation *)v4 start];
}

void __48__FCSportsEventsFetchOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v13[5] = MEMORY[0x1E4F143A8];
    v13[6] = 3221225472;
    v13[7] = __48__FCSportsEventsFetchOperation_performOperation__block_invoke_2;
    v13[8] = &unk_1E5B4BE70;
    id v14 = *(id *)(a1 + 32);
    id v15 = v5;
    [v14 finishedPerformingOperationWithError:v15];
  }
  else
  {
    v7 = [a2 objectForKeyedSubscript:&unk_1EF8D7818];
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      v9 = *(void **)(v8 + 400);
    }
    else {
      v9 = 0;
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48__FCSportsEventsFetchOperation_performOperation__block_invoke_10;
    v13[3] = &unk_1E5B4F548;
    v13[4] = v8;
    id v10 = v9;
    id v11 = [v7 transformRecordsInOrder:v10 withBlock:v13];
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      objc_storeStrong((id *)(v12 + 424), v11);
    }

    [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
  }
}

uint64_t __48__FCSportsEventsFetchOperation_performOperation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

FCSportsEvent *__48__FCSportsEventsFetchOperation_performOperation__block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v7) {
    v7 = (void *)v7[49];
  }
  uint64_t v8 = v7;
  v9 = [v5 eventCompetitorTagIDs];
  id v10 = [v8 slowCachedTagsForIDs:v9];

  id v11 = [v5 eventCompetitorTagIDs];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __48__FCSportsEventsFetchOperation_performOperation__block_invoke_2_11;
  v38[3] = &unk_1E5B4F4B0;
  id v12 = v10;
  uint64_t v13 = *(void *)(a1 + 32);
  id v39 = v12;
  uint64_t v40 = v13;
  id v14 = v5;
  id v41 = v14;
  id v15 = objc_msgSend(v11, "fc_arrayByTransformingWithBlock:", v38);

  uint64_t v16 = [v15 count];
  uint64_t v17 = [v14 eventCompetitorTagIDs];
  uint64_t v18 = [v17 count];

  if (v16 == v18)
  {
    v19 = *(void **)(a1 + 32);
    if (v19) {
      v19 = (void *)v19[49];
    }
    v20 = v19;
    v21 = [v14 eventLeagueTagID];
    v22 = [v20 slowCachedTagForID:v21];

    id v23 = [v22 asSports];

    if (v23)
    {
      id v23 = v23;
      v24 = [FCSportsEvent alloc];
      v25 = *(void **)(a1 + 32);
      if (v25) {
        v25 = (void *)v25[48];
      }
      __int16 v26 = v25;
      v27 = [v26 assetManager];
      __int16 v28 = [(FCSportsEvent *)v24 initWithSportsEventRecord:v14 eventCompetitorTags:v15 eventLeagueTag:v23 assetManager:v27 interestToken:v6];
    }
    else
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __48__FCSportsEventsFetchOperation_performOperation__block_invoke_19;
      v32[3] = &unk_1E5B4F520;
      v32[4] = *(void *)(a1 + 32);
      id v33 = v14;
      __48__FCSportsEventsFetchOperation_performOperation__block_invoke_19((uint64_t)v32);
      __int16 v28 = (FCSportsEvent *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __48__FCSportsEventsFetchOperation_performOperation__block_invoke_14;
    v34[3] = &unk_1E5B4F4F8;
    id v35 = v14;
    id v29 = v15;
    uint64_t v30 = *(void *)(a1 + 32);
    id v36 = v29;
    uint64_t v37 = v30;
    __48__FCSportsEventsFetchOperation_performOperation__block_invoke_14((uint64_t)v34);
    __int16 v28 = (FCSportsEvent *)objc_claimAutoreleasedReturnValue();

    id v23 = v35;
  }

  return v28;
}

id __48__FCSportsEventsFetchOperation_performOperation__block_invoke_2_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  char v5 = [v4 isSports];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__FCSportsEventsFetchOperation_performOperation__block_invoke_3;
    v8[3] = &unk_1E5B4F488;
    v8[4] = *(void *)(a1 + 40);
    id v9 = v3;
    id v10 = *(id *)(a1 + 48);
    id v6 = __48__FCSportsEventsFetchOperation_performOperation__block_invoke_3((uint64_t)v8);
  }
  return v6;
}

uint64_t __48__FCSportsEventsFetchOperation_performOperation__block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    char v5 = v2;
    id v6 = [v4 shortOperationDescription];
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = [*(id *)(a1 + 48) base];
    id v9 = [v8 identifier];
    int v10 = 138543874;
    id v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    id v15 = v9;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "%{public}@ encountered non-sports tag with id %{public}@ as a competitor tag for sports event with id %{public}@. Ignoring invalid competitor tag.", (uint8_t *)&v10, 0x20u);
  }
  return 0;
}

uint64_t __48__FCSportsEventsFetchOperation_performOperation__block_invoke_14(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v3 = [*(id *)(a1 + 32) eventCompetitorTagIDs];
  v4 = (void *)[v2 initWithArray:v3];

  char v5 = objc_msgSend(*(id *)(a1 + 40), "fc_setByTransformingWithBlock:", &__block_literal_global_26);
  id v6 = objc_msgSend(v4, "fc_setByMinusingSet:", v5);
  uint64_t v7 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
  {
    id v9 = *(void **)(a1 + 48);
    int v10 = v7;
    id v11 = [v9 shortOperationDescription];
    __int16 v12 = [*(id *)(a1 + 32) base];
    uint64_t v13 = [v12 identifier];
    __int16 v14 = [v5 allObjects];
    id v15 = [v6 allObjects];
    int v16 = 138544130;
    uint64_t v17 = v11;
    __int16 v18 = 2114;
    v19 = v13;
    __int16 v20 = 2114;
    v21 = v14;
    __int16 v22 = 2114;
    id v23 = v15;
    _os_log_error_impl(&dword_1A460D000, v10, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch all competitor tags for sports event, discarding sports event record with identifier=%{public}@; fetched competitor tags=%{public}@; unfetched competitor tags=%{public}@",
      (uint8_t *)&v16,
      0x2Au);
  }
  return 0;
}

uint64_t __48__FCSportsEventsFetchOperation_performOperation__block_invoke_2_16(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __48__FCSportsEventsFetchOperation_performOperation__block_invoke_19(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    char v5 = v2;
    id v6 = [v4 shortOperationDescription];
    uint64_t v7 = [*(id *)(a1 + 40) base];
    uint64_t v8 = [v7 identifier];
    id v9 = [*(id *)(a1 + 40) eventLeagueTagID];
    int v10 = 138543874;
    id v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    id v15 = v9;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "%{public}@ failed to get league tag for sports event record, sports event discarded; sportsEventRecord identifier="
      "%{public}@, leagueTag identifier=%{public}@",
      (uint8_t *)&v10,
      0x20u);
  }
  return 0;
}

- (void)operationWillFinishWithError:(id)a3
{
  id v12 = a3;
  v4 = -[FCSportsEventsFetchOperation delegate]((id *)&self->super.super.super.isa);

  if (v4)
  {
    char v5 = -[FCSportsEventsFetchOperation delegate]((id *)&self->super.super.super.isa);
    id v6 = v5;
    if (self) {
      resultSportsEvents = self->_resultSportsEvents;
    }
    else {
      resultSportsEvents = 0;
    }
    [v5 sportsEventsFetchOperation:self didFetchSportsEvents:resultSportsEvents];
  }
  uint64_t v8 = [(FCSportsEventsFetchOperation *)self fetchCompletionHandler];

  if (v8)
  {
    uint64_t v9 = [(FCSportsEventsFetchOperation *)self fetchCompletionHandler];
    int v10 = (void *)v9;
    if (self) {
      id v11 = self->_resultSportsEvents;
    }
    else {
      id v11 = 0;
    }
    (*(void (**)(uint64_t, NSArray *, id))(v9 + 16))(v9, v11, v12);
  }
}

- (id)delegate
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 52);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (FCCachePolicy)cachePolicy
{
  return self->_cachePolicy;
}

- (void)setCachePolicy:(id)a3
{
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
  objc_storeStrong((id *)&self->_resultSportsEvents, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
  objc_storeStrong((id *)&self->_sportsEventIDs, 0);
  objc_storeStrong((id *)&self->_tagController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_cachePolicy, 0);
}

@end