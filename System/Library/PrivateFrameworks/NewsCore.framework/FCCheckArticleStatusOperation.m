@interface FCCheckArticleStatusOperation
- (BOOL)validateOperation;
- (FCCheckArticleStatusOperation)initWithContext:(id)a3 articleID:(id)a4;
- (FCCloudContext)context;
- (NSString)articleID;
- (OS_dispatch_queue)callbackQueue;
- (id)checkStatusCompletion;
- (int64_t)resultStatus;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setArticleID:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setCheckStatusCompletion:(id)a3;
- (void)setContext:(id)a3;
- (void)setResultStatus:(int64_t)a3;
@end

@implementation FCCheckArticleStatusOperation

- (FCCheckArticleStatusOperation)initWithContext:(id)a3 articleID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCCheckArticleStatusOperation;
  v9 = [(FCOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_articleID, a4);
    v10->_resultStatus = 0;
  }

  return v10;
}

- (BOOL)validateOperation
{
  v2 = [(FCCheckArticleStatusOperation *)self articleID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)performOperation
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  v4 = [(FCCheckArticleStatusOperation *)self articleID];
  v5 = (void *)[v3 initWithRecordName:v4];

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"A-canary"];
  id v7 = objc_alloc_init(FCCKContentFetchOperation);
  id v8 = [(FCCheckArticleStatusOperation *)self context];
  v9 = [v8 internalContentContext];
  v10 = [v9 contentDatabase];
  -[FCCKContentFetchOperation setDatabase:]((uint64_t)v7, v10);

  v20[0] = v5;
  v20[1] = v6;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v13 = v11;
  if (v7)
  {
    objc_setProperty_nonatomic_copy(v7, v12, v11, 384);

    objc_setProperty_nonatomic_copy(v7, v14, MEMORY[0x1E4F1CBF0], 400);
  }
  else
  {
  }
  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __49__FCCheckArticleStatusOperation_performOperation__block_invoke;
  newValue[3] = &unk_1E5B55760;
  id v18 = v6;
  v19 = self;
  id v16 = v6;
  if (v7) {
    objc_setProperty_nonatomic_copy(v7, v15, newValue, 416);
  }
  [(FCOperation *)self associateChildOperation:v7];
  [(FCOperation *)v7 start];
}

void __49__FCCheckArticleStatusOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!objc_msgSend(v6, "fc_isCKUnknownItemError")
    || ([v5 objectForKeyedSubscript:*(void *)(a1 + 32)],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    if (v6) {
      goto LABEL_4;
    }
LABEL_7:
    if ([v5 count] != 2 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)[[NSString alloc] initWithFormat:@"should have one article record and one canary if there was no error"];
      int v12 = 136315906;
      v13 = "-[FCCheckArticleStatusOperation performOperation]_block_invoke";
      __int16 v14 = 2080;
      v15 = "FCCheckArticleStatusOperation.m";
      __int16 v16 = 1024;
      int v17 = 65;
      __int16 v18 = 2114;
      v19 = v11;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);
    }
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = 1;
    goto LABEL_11;
  }
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "fc_canaryDownError");

  id v6 = (id)v10;
  if (!v10) {
    goto LABEL_7;
  }
LABEL_4:
  if (objc_msgSend(v6, "fc_isCKUnknownItemError"))
  {
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = 2;
LABEL_11:
    [v8 setResultStatus:v9];
  }
  [*(id *)(a1 + 40) finishedPerformingOperationWithError:v6];
}

- (void)operationWillFinishWithError:(id)a3
{
  v4 = [(FCCheckArticleStatusOperation *)self checkStatusCompletion];

  if (v4)
  {
    id v5 = [(FCCheckArticleStatusOperation *)self callbackQueue];
    id v6 = v5;
    if (!v5)
    {
      id v6 = FCDispatchQueueForQualityOfService([(FCCheckArticleStatusOperation *)self qualityOfService]);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__FCCheckArticleStatusOperation_operationWillFinishWithError___block_invoke;
    block[3] = &unk_1E5B4C018;
    block[4] = self;
    dispatch_async(v6, block);
    if (!v5) {
  }
    }
}

void __62__FCCheckArticleStatusOperation_operationWillFinishWithError___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) checkStatusCompletion];
  v2[2](v2, [*(id *)(a1 + 32) resultStatus]);
}

- (id)checkStatusCompletion
{
  return objc_getProperty(self, a2, 368, 1);
}

- (void)setCheckStatusCompletion:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 376, 1);
}

- (void)setCallbackQueue:(id)a3
{
}

- (FCCloudContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSString)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
}

- (int64_t)resultStatus
{
  return self->_resultStatus;
}

- (void)setResultStatus:(int64_t)a3
{
  self->_resultStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_checkStatusCompletion, 0);
}

@end