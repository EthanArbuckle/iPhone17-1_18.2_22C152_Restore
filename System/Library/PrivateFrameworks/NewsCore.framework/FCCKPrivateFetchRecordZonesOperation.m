@interface FCCKPrivateFetchRecordZonesOperation
- (BOOL)validateOperation;
- (NSArray)recordZoneIDs;
- (NSDictionary)resultRecordZonesByZoneID;
- (id)fetchRecordZonesCompletionBlock;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setFetchRecordZonesCompletionBlock:(id)a3;
- (void)setRecordZoneIDs:(id)a3;
- (void)setResultRecordZonesByZoneID:(id)a3;
@end

@implementation FCCKPrivateFetchRecordZonesOperation

- (BOOL)validateOperation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)FCCKPrivateFetchRecordZonesOperation;
  BOOL v3 = [(FCCKPrivateDatabaseOperation *)&v8 validateOperation];
  v4 = [(FCCKPrivateFetchRecordZonesOperation *)self recordZoneIDs];
  uint64_t v5 = [v4 count];

  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)[[NSString alloc] initWithFormat:@"can't fetch an empty list of record zone IDs"];
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCCKPrivateFetchRecordZonesOperation validateOperation]";
    __int16 v11 = 2080;
    v12 = "FCCKPrivateFetchRecordZonesOperation.m";
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
  uint64_t v4 = [(FCCKPrivateDatabaseOperation *)self skipPreflight];
  uint64_t v5 = [(FCCKPrivateDatabaseOperation *)self database];
  v6 = [(FCCKPrivateFetchRecordZonesOperation *)self recordZoneIDs];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__FCCKPrivateFetchRecordZonesOperation_performOperation__block_invoke;
  v10[3] = &unk_1E5B4E710;
  __int16 v11 = v3;
  v12 = self;
  v7 = v3;
  -[FCCKPrivateDatabase enumeratePayloadsWithRecordIDs:records:zoneIDs:zones:options:payloadHandler:]((uint64_t)v5, 0, 0, v6, 0, v4, v10);

  uint64_t v8 = [(FCCKPrivateFetchRecordZonesOperation *)self qualityOfService];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__FCCKPrivateFetchRecordZonesOperation_performOperation__block_invoke_3;
  v9[3] = &unk_1E5B4C8F8;
  v9[4] = self;
  [(FCCKPrivateDatabaseCKOperationResults *)v7 notifyWhenFinishWithQoS:v8 completionHandler:v9];
}

void __56__FCCKPrivateFetchRecordZonesOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1A090]);
  if (v3) {
    uint64_t v5 = (void *)v3[3];
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  [v4 setRecordZoneIDs:v6];

  [*(id *)(a1 + 32) operationWillStart];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  __int16 v11 = __56__FCCKPrivateFetchRecordZonesOperation_performOperation__block_invoke_2;
  v12 = &unk_1E5B55760;
  id v13 = *(id *)(a1 + 32);
  id v14 = v3;
  v7 = v3;
  [v4 setFetchRecordZonesCompletionBlock:&v9];
  if (v3) {
    uint64_t v8 = v7[5];
  }
  else {
    uint64_t v8 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "runChildCKOperation:destination:", v4, v8, v9, v10, v11, v12);
}

void __56__FCCKPrivateFetchRecordZonesOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  if (v5) {
    uint64_t v8 = *(void **)(v5 + 24);
  }
  else {
    uint64_t v8 = 0;
  }
  id v10 = v8;
  uint64_t v9 = [v7 allValues];

  [v4 operationDidFinishWithItemIDs:v10 resultItems:v9 error:v6];
}

void __56__FCCKPrivateFetchRecordZonesOperation_performOperation__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  uint64_t v5 = objc_msgSend(a2, "fc_dictionaryWithKeyBlock:", &__block_literal_global_79);
  [*(id *)(a1 + 32) setResultRecordZonesByZoneID:v5];

  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v6];
}

uint64_t __56__FCCKPrivateFetchRecordZonesOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 zoneID];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v7 = a3;
  id v4 = [(FCCKPrivateFetchRecordZonesOperation *)self fetchRecordZonesCompletionBlock];

  if (v4)
  {
    uint64_t v5 = [(FCCKPrivateFetchRecordZonesOperation *)self fetchRecordZonesCompletionBlock];
    id v6 = [(FCCKPrivateFetchRecordZonesOperation *)self resultRecordZonesByZoneID];
    ((void (**)(void, void *, id))v5)[2](v5, v6, v7);
  }
}

- (NSArray)recordZoneIDs
{
  return self->_recordZoneIDs;
}

- (void)setRecordZoneIDs:(id)a3
{
}

- (id)fetchRecordZonesCompletionBlock
{
  return self->_fetchRecordZonesCompletionBlock;
}

- (void)setFetchRecordZonesCompletionBlock:(id)a3
{
}

- (NSDictionary)resultRecordZonesByZoneID
{
  return self->_resultRecordZonesByZoneID;
}

- (void)setResultRecordZonesByZoneID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultRecordZonesByZoneID, 0);
  objc_storeStrong(&self->_fetchRecordZonesCompletionBlock, 0);
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
}

@end