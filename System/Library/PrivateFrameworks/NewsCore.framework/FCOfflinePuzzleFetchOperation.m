@interface FCOfflinePuzzleFetchOperation
- (BOOL)cachedOnly;
- (BOOL)validateOperation;
- (FCOfflinePuzzleFetchOperation)init;
- (FCOfflinePuzzleFetchOperation)initWithContext:(id)a3 puzzle:(id)a4;
- (FCOfflinePuzzleFetchOperation)initWithContext:(id)a3 puzzleID:(id)a4;
- (OS_dispatch_queue)archiveQueue;
- (OS_dispatch_queue)fetchCompletionQueue;
- (OS_dispatch_queue)progressQueue;
- (id)archiveHandler;
- (id)fetchCompletionHandler;
- (id)progressHandler;
- (void)_handleArchive:(void *)a1;
- (void)_updateProgress:(double *)a1;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)prepareOperation;
- (void)setArchiveHandler:(id)a3;
- (void)setArchiveQueue:(id)a3;
- (void)setCachedOnly:(BOOL)a3;
- (void)setFetchCompletionHandler:(id)a3;
- (void)setFetchCompletionQueue:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setProgressQueue:(id)a3;
@end

@implementation FCOfflinePuzzleFetchOperation

- (FCOfflinePuzzleFetchOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCOfflinePuzzleFetchOperation init]";
    __int16 v9 = 2080;
    v10 = "FCOfflinePuzzleFetchOperation.m";
    __int16 v11 = 1024;
    int v12 = 81;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCOfflinePuzzleFetchOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCOfflinePuzzleFetchOperation)initWithContext:(id)a3 puzzleID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FCOfflinePuzzleFetchOperation;
  __int16 v9 = [(FCOperation *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    uint64_t v11 = [v8 copy];
    puzzleID = v10->_puzzleID;
    v10->_puzzleID = (NSString *)v11;

    __int16 v13 = objc_alloc_init(FCThreadSafeMutableArray);
    resultInterestTokens = v10->_resultInterestTokens;
    v10->_resultInterestTokens = v13;
  }
  return v10;
}

- (FCOfflinePuzzleFetchOperation)initWithContext:(id)a3 puzzle:(id)a4
{
  id v6 = a3;
  id v7 = [a4 identifier];
  id v8 = [(FCOfflinePuzzleFetchOperation *)self initWithContext:v6 puzzleID:v7];

  return v8;
}

- (BOOL)validateOperation
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self && self->_context)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v2)
    {
      v3 = (void *)[[NSString alloc] initWithFormat:@"offline puzzle fetch operation requires a context"];
      int v5 = 136315906;
      id v6 = "-[FCOfflinePuzzleFetchOperation validateOperation]";
      __int16 v7 = 2080;
      id v8 = "FCOfflinePuzzleFetchOperation.m";
      __int16 v9 = 1024;
      int v10 = 109;
      __int16 v11 = 2114;
      int v12 = v3;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);

      LOBYTE(v2) = 0;
    }
  }
  return v2;
}

- (void)prepareOperation
{
  BOOL v2 = self;
  if (self) {
    self = (FCOfflinePuzzleFetchOperation *)self->_context;
  }
  id v5 = [(FCOfflinePuzzleFetchOperation *)self appConfigurationManager];
  v3 = [v5 possiblyUnfetchedAppConfiguration];
  uint64_t v4 = [v3 offlineDownloadsConfig];
  if (v2) {
    objc_storeStrong((id *)&v2->_config, v4);
  }
}

- (void)performOperation
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__33;
  v25[4] = __Block_byref_object_dispose__33;
  id v26 = 0;
  v3 = (id)FCOperationLog;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(FCOperation *)self shortOperationDescription];
    if ([(FCOfflinePuzzleFetchOperation *)self cachedOnly]) {
      id v5 = @"lookup cached";
    }
    else {
      id v5 = @"fetch";
    }
    if (self)
    {
      id v6 = self->_puzzleID;
      config = self->_config;
    }
    else
    {
      id v6 = 0;
      config = 0;
    }
    id v8 = config;
    BOOL v9 = [(FCOfflineDownloadsConfiguration *)v8 useSmallestPuzzleThumbnails];
    int v10 = @"normal";
    *(_DWORD *)buf = 138544130;
    v28 = v4;
    __int16 v29 = 2114;
    if (v9) {
      int v10 = @"small";
    }
    v30 = v5;
    __int16 v31 = 2114;
    v32 = v6;
    __int16 v33 = 2114;
    v34 = v10;
    _os_log_impl(&dword_1A460D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will %{public}@ puzzle id=%{public}@, thumbnail variant=%{public}@", buf, 0x2Au);
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __49__FCOfflinePuzzleFetchOperation_performOperation__block_invoke;
  v24[3] = &unk_1E5B4E758;
  v24[4] = self;
  __int16 v11 = [MEMORY[0x1E4F81BF0] firstly:v24];
  int v12 = zalgo();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __49__FCOfflinePuzzleFetchOperation_performOperation__block_invoke_2;
  v23[3] = &unk_1E5B55218;
  v23[4] = self;
  v23[5] = v25;
  uint64_t v13 = [v11 thenOn:v12 then:v23];
  v14 = zalgo();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __49__FCOfflinePuzzleFetchOperation_performOperation__block_invoke_3;
  v22[3] = &unk_1E5B51488;
  v22[4] = self;
  v22[5] = v25;
  uint64_t v15 = [v13 thenOn:v14 then:v22];
  objc_super v16 = zalgo();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __49__FCOfflinePuzzleFetchOperation_performOperation__block_invoke_4;
  v21[3] = &unk_1E5B55240;
  v21[4] = self;
  v17 = [v15 thenOn:v16 then:v21];
  v18 = zalgo();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __49__FCOfflinePuzzleFetchOperation_performOperation__block_invoke_5;
  v20[3] = &unk_1E5B4FD28;
  v20[4] = self;
  id v19 = (id)[v17 errorOn:v18 error:v20];

  _Block_object_dispose(v25, 8);
}

id __49__FCOfflinePuzzleFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  -[FCOfflinePuzzleFetchOperation _updateProgress:](*(double **)(a1 + 32), 0.0);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke;
    v6[3] = &unk_1E5B4EEF0;
    v6[4] = v2;
    uint64_t v4 = (void *)[v3 initWithResolver:v6];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (void)_updateProgress:(double *)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1 && ([a1 isFinished] & 1) == 0)
  {
    if (a1[57] > a2 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v7 = (void *)[[NSString alloc] initWithFormat:@"fetch progress should never go backward"];
      *(_DWORD *)buf = 136315906;
      int v10 = "-[FCOfflinePuzzleFetchOperation _updateProgress:]";
      __int16 v11 = 2080;
      int v12 = "FCOfflinePuzzleFetchOperation.m";
      __int16 v13 = 1024;
      int v14 = 308;
      __int16 v15 = 2114;
      objc_super v16 = v7;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    a1[57] = a2;
    uint64_t v4 = [a1 progressQueue];

    id v5 = [a1 progressHandler];

    if (v4)
    {
      if (!v5) {
        return;
      }
      uint64_t v6 = [a1 progressQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__FCOfflinePuzzleFetchOperation__updateProgress___block_invoke_57;
      block[3] = &unk_1E5B4C018;
      block[4] = a1;
      dispatch_async((dispatch_queue_t)v6, block);
    }
    else
    {
      if (!v5) {
        return;
      }
      uint64_t v6 = [a1 progressHandler];
      (*(void (**)(double))(v6 + 16))(a1[57]);
    }
  }
}

id __49__FCOfflinePuzzleFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  -[FCOfflinePuzzleFetchOperation _updateProgress:](*(double **)(a1 + 32), 0.2);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v5)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__FCOfflinePuzzleFetchOperation__promiseThumbnailsForPuzzleRecords___block_invoke;
    v10[3] = &unk_1E5B50378;
    id v11 = v6;
    uint64_t v12 = v5;
    id v8 = (void *)[v7 initWithResolver:v10];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

id __49__FCOfflinePuzzleFetchOperation_performOperation__block_invoke_3(uint64_t a1)
{
  -[FCOfflinePuzzleFetchOperation _updateProgress:](*(double **)(a1 + 32), 0.4);
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke;
    v7[3] = &unk_1E5B50378;
    id v8 = v3;
    uint64_t v9 = v2;
    uint64_t v5 = (void *)[v4 initWithResolver:v7];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __49__FCOfflinePuzzleFetchOperation_performOperation__block_invoke_4(uint64_t a1)
{
  return 0;
}

uint64_t __49__FCOfflinePuzzleFetchOperation_performOperation__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[FCOfflinePuzzleFetchOperation _updateProgress:]((double *)self, 1.0);
  }
  uint64_t v5 = [(FCOfflinePuzzleFetchOperation *)self fetchCompletionQueue];

  id v6 = [(FCOfflinePuzzleFetchOperation *)self fetchCompletionHandler];

  if (v5)
  {
    if (v6)
    {
      id v7 = [(FCOfflinePuzzleFetchOperation *)self fetchCompletionQueue];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __62__FCOfflinePuzzleFetchOperation_operationWillFinishWithError___block_invoke;
      v12[3] = &unk_1E5B4BE70;
      v12[4] = self;
      id v13 = v4;
      dispatch_async(v7, v12);
    }
  }
  else if (v6)
  {
    id v8 = [(FCOfflinePuzzleFetchOperation *)self fetchCompletionHandler];
    if (self) {
      resultInterestTokens = self->_resultInterestTokens;
    }
    else {
      resultInterestTokens = 0;
    }
    int v10 = resultInterestTokens;
    id v11 = [(FCThreadSafeMutableArray *)v10 readOnlyArray];
    ((void (**)(void, void *, id))v8)[2](v8, v11, v4);
  }
}

void __62__FCOfflinePuzzleFetchOperation_operationWillFinishWithError___block_invoke(uint64_t a1)
{
  uint64_t v5 = [*(id *)(a1 + 32) fetchCompletionHandler];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[56];
  }
  id v3 = v2;
  id v4 = [v3 readOnlyArray];
  v5[2](v5, v4, *(void *)(a1 + 40));
}

void __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(FCRecordChainFetchOperation);
  id v8 = v7;
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    uint64_t v10 = *(void *)(v9 + 424);
  }
  else {
    uint64_t v10 = 0;
  }
  [(FCRecordChainFetchOperation *)v7 setContext:v10];
  id v11 = *(void **)(a1 + 32);
  if (v11) {
    id v11 = (void *)v11[54];
  }
  v30[0] = v11;
  uint64_t v12 = (void *)MEMORY[0x1E4F1C978];
  id v13 = v11;
  int v14 = [v12 arrayWithObjects:v30 count:1];

  [(FCRecordChainFetchOperation *)v8 setTopLevelRecordIDs:v14];
  v28[0] = @"Puzzle";
  v27 = @"puzzleTypeID";
  __int16 v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v28[1] = @"PuzzleType";
  v29[0] = v15;
  v29[1] = MEMORY[0x1E4F1CBF0];
  objc_super v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
  [(FCRecordChainFetchOperation *)v8 setLinkKeysByRecordType:v16];

  if ([*(id *)(a1 + 32) cachedOnly])
  {
    uint64_t v17 = +[FCCachePolicy cachedOnlyCachePolicy];
    [(FCRecordChainFetchOperation *)v8 setCachePolicy:v17];
  }
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_2;
  v23 = &unk_1E5B551A0;
  uint64_t v24 = *(void *)(a1 + 32);
  id v25 = v6;
  id v26 = v5;
  id v18 = v5;
  id v19 = v6;
  [(FCRecordChainFetchOperation *)v8 setRecordChainCompletionHandler:&v20];
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v8, v20, v21, v22, v23, v24);
  [(FCOperation *)v8 start];
}

void __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    uint64_t v24 = __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_3;
    id v25 = &unk_1E5B4BE70;
    id v26 = *(id *)(a1 + 32);
    id v27 = v6;
    [v26 finishedPerformingOperationWithError:v27];
  }
  else
  {
    id v8 = [v5 objectForKeyedSubscript:&unk_1EF8D7D28];
    if ([v8 count])
    {
      uint64_t v9 = [v5 objectForKeyedSubscript:&unk_1EF8D7D40];
      if ([v9 count])
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_2_39;
        aBlock[3] = &unk_1E5B55290;
        aBlock[4] = *(void *)(a1 + 32);
        uint64_t v10 = (void (**)(void *, void *))_Block_copy(aBlock);
        v10[2](v10, v8);
        v10[2](v10, v9);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_4;
        v16[3] = &unk_1E5B55290;
        v16[4] = *(void *)(a1 + 32);
        id v11 = (void (**)(void *, void *))_Block_copy(v16);
        v11[2](v11, v8);
        v11[2](v11, v9);
        uint64_t v12 = *(void *)(a1 + 48);
        id v13 = [v8 onlyRecord];
        int v14 = [v9 onlyRecord];
        __int16 v15 = +[FCPair pairWithFirst:v13 second:v14];
        (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v15);
      }
      else
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_38;
        v18[3] = &unk_1E5B4CA88;
        id v19 = *(id *)(a1 + 40);
        __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_38((uint64_t)v18);
      }
    }
    else
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_34;
      v20[3] = &unk_1E5B4CA88;
      id v21 = *(id *)(a1 + 40);
      __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_34((uint64_t)v20);
      uint64_t v9 = v21;
    }
  }
}

uint64_t __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

void __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_34(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "fc_notAvailableError");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_38(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "fc_notAvailableError");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_2_39(uint64_t a1, void *a2)
{
  id v3 = [a2 interestTokensByID];
  id v4 = [v3 allValues];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_3_40;
  v5[3] = &unk_1E5B55268;
  v5[4] = *(void *)(a1 + 32);
  [v4 enumerateObjectsUsingBlock:v5];
}

uint64_t __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_3_40(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(result + 32);
    if (v2) {
      return [*(id *)(v2 + 448) addObject:a2];
    }
  }
  return result;
}

void __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 recordsByID];
  id v4 = [v3 allValues];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_5;
  v5[3] = &unk_1E5B4E468;
  v5[4] = *(void *)(a1 + 32);
  [v4 enumerateObjectsUsingBlock:v5];
}

void __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = +[FCContentArchive archiveWithRecord:a2];
  -[FCOfflinePuzzleFetchOperation _handleArchive:](v2, v3);
}

- (void)_handleArchive:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1 && v3)
  {
    id v5 = [a1 archiveQueue];

    id v6 = [a1 archiveHandler];

    if (v5)
    {
      if (v6)
      {
        id v7 = [a1 archiveQueue];
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __48__FCOfflinePuzzleFetchOperation__handleArchive___block_invoke_2;
        v9[3] = &unk_1E5B4BE70;
        v9[4] = a1;
        id v10 = v4;
        dispatch_async(v7, v9);
      }
    }
    else if (v6)
    {
      id v8 = [a1 archiveHandler];
      ((void (**)(void, void *))v8)[2](v8, v4);
    }
  }
}

void __68__FCOfflinePuzzleFetchOperation__promiseThumbnailsForPuzzleRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) first];
  id v8 = [*(id *)(a1 + 32) second];
  uint64_t v9 = *(void **)(a1 + 40);
  if (v9)
  {
    id v10 = (void *)v9[55];
    uint64_t v9 = (void *)v9[53];
  }
  else
  {
    id v10 = 0;
  }
  id v11 = v9;
  id v12 = v10;
  id v13 = [v11 assetManager];
  int v14 = FCOfflineThumbnailAssetHandlesForPuzzleRecords(v7, v8, v12, v13);

  __int16 v15 = [[FCAssetsFetchOperation alloc] initWithAssetHandles:v14];
  if ([*(id *)(a1 + 40) cachedOnly]) {
    uint64_t v16 = 3;
  }
  else {
    uint64_t v16 = 0;
  }
  [(FCFetchOperation *)v15 setCachePolicy:v16];
  [(FCFetchOperation *)v15 setShouldFailOnMissingObjects:1];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __68__FCOfflinePuzzleFetchOperation__promiseThumbnailsForPuzzleRecords___block_invoke_2;
  v26[3] = &unk_1E5B552B8;
  v26[4] = *(void *)(a1 + 40);
  [(FCAssetsFetchOperation *)v15 setInterestTokenHandler:v26];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __68__FCOfflinePuzzleFetchOperation__promiseThumbnailsForPuzzleRecords___block_invoke_3;
  v25[3] = &unk_1E5B552E0;
  v25[4] = *(void *)(a1 + 40);
  [(FCAssetsFetchOperation *)v15 setArchiveHandler:v25];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __68__FCOfflinePuzzleFetchOperation__promiseThumbnailsForPuzzleRecords___block_invoke_4;
  uint64_t v22 = &unk_1E5B55308;
  id v23 = v6;
  id v24 = v5;
  id v17 = v5;
  id v18 = v6;
  [(FCFetchOperation *)v15 setFetchCompletionBlock:&v19];
  objc_msgSend(*(id *)(a1 + 40), "associateChildOperation:", v15, v19, v20, v21, v22);
  [(FCOperation *)v15 start];
}

uint64_t __68__FCOfflinePuzzleFetchOperation__promiseThumbnailsForPuzzleRecords___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(result + 32);
    if (v2) {
      return [*(id *)(v2 + 448) addObject:a2];
    }
  }
  return result;
}

void __68__FCOfflinePuzzleFetchOperation__promiseThumbnailsForPuzzleRecords___block_invoke_3(uint64_t a1, void *a2)
{
}

void __68__FCOfflinePuzzleFetchOperation__promiseThumbnailsForPuzzleRecords___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 status])
  {
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v9 = (void (**)(id, void *))*(id *)(a1 + 32);
    id v8 = v3;
    id v4 = objc_msgSend(v8, "error", v7, 3221225472, __68__FCOfflinePuzzleFetchOperation__promiseThumbnailsForPuzzleRecords___block_invoke_5, &unk_1E5B4C7C0);
    v9[2](v9, v4);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [v3 fetchedObject];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

void __68__FCOfflinePuzzleFetchOperation__promiseThumbnailsForPuzzleRecords___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke_2;
  v25[3] = &unk_1E5B4BF30;
  id v26 = *(id *)(a1 + 32);
  id v8 = objc_msgSend(v7, "fc_array:", v25);
  uint64_t v9 = [FCResourcesFetchOperation alloc];
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    uint64_t v11 = *(void *)(v10 + 424);
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = [(FCResourcesFetchOperation *)v9 initWithContext:v11 resourceIDs:v8 downloadAssets:1];
  [(FCFetchOperation *)v12 setShouldFailOnMissingObjects:1];
  if ([*(id *)(a1 + 40) cachedOnly]) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 0;
  }
  [(FCFetchOperation *)v12 setCachePolicy:v13];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke_3;
  v24[3] = &unk_1E5B552B8;
  v24[4] = *(void *)(a1 + 40);
  [(FCResourcesFetchOperation *)v12 setInterestTokenHandler:v24];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke_4;
  v23[3] = &unk_1E5B552E0;
  v23[4] = *(void *)(a1 + 40);
  [(FCResourcesFetchOperation *)v12 setArchiveHandler:v23];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke_5;
  uint64_t v19 = &unk_1E5B50778;
  uint64_t v20 = *(void *)(a1 + 40);
  id v21 = v6;
  id v22 = v5;
  id v14 = v5;
  id v15 = v6;
  [(FCFetchOperation *)v12 setFetchCompletionBlock:&v16];
  objc_msgSend(*(id *)(a1 + 40), "associateChildOperation:", v12, v16, v17, v18, v19, v20);
  [(FCOperation *)v12 start];
}

void __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 first];
  id v6 = [v5 dataResourceID];
  objc_msgSend(v4, "fc_safelyAddObject:", v6);

  id v8 = [*(id *)(a1 + 32) second];
  uint64_t v7 = [v8 engineResourceID];
  objc_msgSend(v4, "fc_safelyAddObject:", v7);
}

uint64_t __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(result + 32);
    if (v2) {
      return [*(id *)(v2 + 448) addObject:a2];
    }
  }
  return result;
}

void __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke_4(uint64_t a1, void *a2)
{
}

void __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 status])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke_6;
    v7[3] = &unk_1E5B4EFB8;
    id v8 = v3;
    id v4 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = v4;
    __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke_6((uint64_t)v7);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = [v3 fetchedObject];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

void __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke_6(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) status] == 1)
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v3 = *(void *)(a1 + 48);
    id v12 = [*(id *)(a1 + 40) errorUserInfo];
    id v4 = objc_msgSend(v2, "fc_operationCancelledErrorWithAdditionalUserInfo:");
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  else
  {
    uint64_t v5 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
    {
      id v8 = *(void **)(a1 + 40);
      uint64_t v9 = v5;
      id v10 = [v8 shortOperationDescription];
      uint64_t v11 = [*(id *)(a1 + 32) missingObjectDescriptions];
      *(_DWORD *)buf = 138543618;
      id v14 = v10;
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      _os_log_error_impl(&dword_1A460D000, v9, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch ANF resources: %{public}@", buf, 0x16u);
    }
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

void __49__FCOfflinePuzzleFetchOperation__updateProgress___block_invoke_57(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) progressHandler];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    v3.n128_u64[0] = *(void *)(v4 + 456);
  }
  else {
    v3.n128_u64[0] = 0;
  }
  id v5 = (id)v2;
  (*(void (**)(__n128))(v2 + 16))(v3);
}

void __48__FCOfflinePuzzleFetchOperation__handleArchive___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) archiveHandler];
  v2[2](v2, *(void *)(a1 + 40));
}

- (id)archiveHandler
{
  return self->archiveHandler;
}

- (void)setArchiveHandler:(id)a3
{
}

- (OS_dispatch_queue)archiveQueue
{
  return self->archiveQueue;
}

- (void)setArchiveQueue:(id)a3
{
}

- (BOOL)cachedOnly
{
  return self->cachedOnly;
}

- (void)setCachedOnly:(BOOL)a3
{
  self->cachedOnly = a3;
}

- (id)fetchCompletionHandler
{
  return self->fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
}

- (OS_dispatch_queue)fetchCompletionQueue
{
  return self->fetchCompletionQueue;
}

- (void)setFetchCompletionQueue:(id)a3
{
}

- (id)progressHandler
{
  return self->progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (OS_dispatch_queue)progressQueue
{
  return self->progressQueue;
}

- (void)setProgressQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_puzzleRecordCachePolicy, 0);
  objc_storeStrong((id *)&self->_resultInterestTokens, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_puzzleID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->progressQueue, 0);
  objc_storeStrong(&self->progressHandler, 0);
  objc_storeStrong((id *)&self->fetchCompletionQueue, 0);
  objc_storeStrong(&self->fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->archiveQueue, 0);
  objc_storeStrong(&self->archiveHandler, 0);
}

@end