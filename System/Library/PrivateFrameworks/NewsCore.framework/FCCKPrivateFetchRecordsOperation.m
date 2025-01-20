@interface FCCKPrivateFetchRecordsOperation
- (BOOL)validateOperation;
- (NSArray)desiredKeys;
- (NSArray)recordIDs;
- (NSDictionary)resultRecordsByRecordID;
- (id)fetchRecordsCompletionBlock;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setDesiredKeys:(id)a3;
- (void)setFetchRecordsCompletionBlock:(id)a3;
- (void)setRecordIDs:(id)a3;
- (void)setResultRecordsByRecordID:(id)a3;
@end

@implementation FCCKPrivateFetchRecordsOperation

- (BOOL)validateOperation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)FCCKPrivateFetchRecordsOperation;
  BOOL v3 = [(FCCKPrivateDatabaseOperation *)&v8 validateOperation];
  v4 = [(FCCKPrivateFetchRecordsOperation *)self recordIDs];
  uint64_t v5 = [v4 count];

  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)[[NSString alloc] initWithFormat:@"can't fetch an empty list of record IDs"];
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCCKPrivateFetchRecordsOperation validateOperation]";
    __int16 v11 = 2080;
    v12 = "FCCKPrivateFetchRecordsOperation.m";
    __int16 v13 = 1024;
    int v14 = 27;
    __int16 v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  return v5 && v3;
}

- (void)performOperation
{
  BOOL v3 = objc_alloc_init(FCCKPrivateDatabaseCKOperationResults);
  if ([(FCCKPrivateDatabaseOperation *)self skipPreflight]) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 2;
  }
  uint64_t v5 = [(FCCKPrivateDatabaseOperation *)self database];
  v6 = [(FCCKPrivateFetchRecordsOperation *)self recordIDs];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__FCCKPrivateFetchRecordsOperation_performOperation__block_invoke;
  v10[3] = &unk_1E5B4E710;
  __int16 v11 = v3;
  v12 = self;
  v7 = v3;
  -[FCCKPrivateDatabase enumeratePayloadsWithRecordIDs:records:zoneIDs:zones:options:payloadHandler:]((uint64_t)v5, v6, 0, 0, 0, v4, v10);

  uint64_t v8 = [(FCCKPrivateFetchRecordsOperation *)self qualityOfService];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__FCCKPrivateFetchRecordsOperation_performOperation__block_invoke_3;
  v9[3] = &unk_1E5B4C8F8;
  v9[4] = self;
  [(FCCKPrivateDatabaseCKOperationResults *)v7 notifyWhenFinishWithQoS:v8 completionHandler:v9];
}

void __52__FCCKPrivateFetchRecordsOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = a2;
  [*(id *)(a1 + 32) operationWillStart];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1A0A8]);
  if (v3) {
    uint64_t v5 = (void *)v3[1];
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  [v4 setRecordIDs:v6];

  v7 = [*(id *)(a1 + 40) desiredKeys];
  [v4 setDesiredKeys:v7];

  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __52__FCCKPrivateFetchRecordsOperation_performOperation__block_invoke_2;
  __int16 v13 = &unk_1E5B55760;
  id v14 = *(id *)(a1 + 32);
  id v15 = v3;
  uint64_t v8 = v3;
  [v4 setFetchRecordsCompletionBlock:&v10];
  if (v3) {
    uint64_t v9 = v8[5];
  }
  else {
    uint64_t v9 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "runChildCKOperation:destination:", v4, v9, v10, v11, v12, v13);
}

void __52__FCCKPrivateFetchRecordsOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  if (v5) {
    uint64_t v8 = *(void **)(v5 + 8);
  }
  else {
    uint64_t v8 = 0;
  }
  id v10 = v8;
  uint64_t v9 = [v7 allValues];

  [v4 operationDidFinishWithItemIDs:v10 resultItems:v9 error:v6];
}

void __52__FCCKPrivateFetchRecordsOperation_performOperation__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  uint64_t v5 = objc_msgSend(a2, "fc_dictionaryWithKeyBlock:", &__block_literal_global_90);
  [*(id *)(a1 + 32) setResultRecordsByRecordID:v5];

  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v6];
}

uint64_t __52__FCCKPrivateFetchRecordsOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 recordID];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v7 = a3;
  id v4 = [(FCCKPrivateFetchRecordsOperation *)self fetchRecordsCompletionBlock];

  if (v4)
  {
    uint64_t v5 = [(FCCKPrivateFetchRecordsOperation *)self fetchRecordsCompletionBlock];
    id v6 = [(FCCKPrivateFetchRecordsOperation *)self resultRecordsByRecordID];
    ((void (**)(void, void *, id))v5)[2](v5, v6, v7);
  }
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(id)a3
{
}

- (id)fetchRecordsCompletionBlock
{
  return self->_fetchRecordsCompletionBlock;
}

- (void)setFetchRecordsCompletionBlock:(id)a3
{
}

- (NSDictionary)resultRecordsByRecordID
{
  return self->_resultRecordsByRecordID;
}

- (void)setResultRecordsByRecordID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultRecordsByRecordID, 0);
  objc_storeStrong(&self->_fetchRecordsCompletionBlock, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
}

@end