@interface FCTagSearchRecordStream
- (BOOL)fetching;
- (BOOL)isFinished;
- (CKQueryCursor)cursor;
- (FCTagSearchRecordStream)init;
- (NSMutableSet)encounteredRecordIDs;
- (id)fetchMoreResultsWithLimit:(unint64_t)a3 qualityOfService:(int64_t)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
- (id)operationConstructor;
- (void)setCursor:(id)a3;
- (void)setEncounteredRecordIDs:(id)a3;
- (void)setFetching:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)setOperationConstructor:(id)a3;
@end

@implementation FCTagSearchRecordStream

- (FCTagSearchRecordStream)init
{
  v6.receiver = self;
  v6.super_class = (Class)FCTagSearchRecordStream;
  v2 = [(FCTagSearchRecordStream *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    encounteredRecordIDs = v2->_encounteredRecordIDs;
    v2->_encounteredRecordIDs = v3;
  }
  return v2;
}

- (id)fetchMoreResultsWithLimit:(unint64_t)a3 qualityOfService:(int64_t)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v10 = a5;
  id v11 = a6;
  if ([(FCTagSearchRecordStream *)self isFinished])
  {
    v12 = 0;
    if (v10 && v11)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __102__FCTagSearchRecordStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke;
      block[3] = &unk_1E5B4CA88;
      id v26 = v11;
      dispatch_async(v10, block);

      v12 = 0;
    }
  }
  else
  {
    if ([(FCTagSearchRecordStream *)self fetching]
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)[[NSString alloc] initWithFormat:@"shouldn't ask a stream for more results while it's fetching"];
      *(_DWORD *)buf = 136315906;
      v28 = "-[FCTagSearchRecordStream fetchMoreResultsWithLimit:qualityOfService:callbackQueue:completionHandler:]";
      __int16 v29 = 2080;
      v30 = "FCTagSearchOperation.m";
      __int16 v31 = 1024;
      int v32 = 236;
      __int16 v33 = 2114;
      v34 = v17;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    [(FCTagSearchRecordStream *)self setFetching:1];
    v13 = [(FCTagSearchRecordStream *)self operationConstructor];
    v14 = [(FCTagSearchRecordStream *)self cursor];
    v12 = ((void (**)(void, void *))v13)[2](v13, v14);

    if (v12) {
      v12[47] = a3;
    }
    [v12 setRelativePriority:1];
    [v12 setQualityOfService:a4];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __102__FCTagSearchRecordStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_110;
    v21 = &unk_1E5B5A338;
    v22 = self;
    id v24 = v11;
    v23 = v10;
    if (v12) {
      objc_setProperty_nonatomic_copy(v12, v15, &v18, 424);
    }
    objc_msgSend(v12, "start", v18, v19, v20, v21, v22);
  }
  return v12;
}

uint64_t __102__FCTagSearchRecordStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __102__FCTagSearchRecordStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_110(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  id v11 = objc_msgSend(v7, "fc_arrayByTransformingWithBlock:", &__block_literal_global_114);
  v12 = [v10 setWithArray:v11];

  if ([v7 count])
  {
    v13 = [*(id *)(a1 + 32) encounteredRecordIDs];
    int v14 = [v12 isSubsetOfSet:v13];

    if (v14)
    {

      id v8 = 0;
    }
  }
  uint64_t v15 = [v12 count];
  if (!v9 && !v15)
  {

    id v8 = 0;
  }
  v16 = [*(id *)(a1 + 32) encounteredRecordIDs];
  [v16 unionSet:v12];

  [*(id *)(a1 + 32) setCursor:v8];
  [*(id *)(a1 + 32) setFinished:v8 == 0];
  [*(id *)(a1 + 32) setFetching:0];
  v17 = *(void **)(a1 + 48);
  if (v17)
  {
    uint64_t v18 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__FCTagSearchRecordStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_3;
    block[3] = &unk_1E5B4F080;
    id v22 = v17;
    id v20 = v7;
    id v21 = v9;
    dispatch_async(v18, block);
  }
}

uint64_t __102__FCTagSearchRecordStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 recordID];
}

uint64_t __102__FCTagSearchRecordStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)operationConstructor
{
  return self->_operationConstructor;
}

- (void)setOperationConstructor:(id)a3
{
}

- (CKQueryCursor)cursor
{
  return self->_cursor;
}

- (void)setCursor:(id)a3
{
}

- (BOOL)fetching
{
  return self->_fetching;
}

- (void)setFetching:(BOOL)a3
{
  self->_fetching = a3;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (NSMutableSet)encounteredRecordIDs
{
  return self->_encounteredRecordIDs;
}

- (void)setEncounteredRecordIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encounteredRecordIDs, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong(&self->_operationConstructor, 0);
}

@end