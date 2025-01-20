@interface FCCKPrivateFetchDatabaseChangesOperation
- (BOOL)resultMoreComing;
- (BOOL)validateOperation;
- (FCCKPrivateDatabaseServerChangeToken)previousServerChangeToken;
- (FCCKPrivateDatabaseServerChangeToken)resultServerChangeToken;
- (NSArray)resultChangedZoneIDs;
- (NSArray)resultDeletedZoneIDs;
- (id)fetchDatabaseChangesCompletionBlock;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setFetchDatabaseChangesCompletionBlock:(id)a3;
- (void)setPreviousServerChangeToken:(id)a3;
- (void)setResultChangedZoneIDs:(id)a3;
- (void)setResultDeletedZoneIDs:(id)a3;
- (void)setResultMoreComing:(BOOL)a3;
- (void)setResultServerChangeToken:(id)a3;
@end

@implementation FCCKPrivateFetchDatabaseChangesOperation

- (BOOL)validateOperation
{
  v3.receiver = self;
  v3.super_class = (Class)FCCKPrivateFetchDatabaseChangesOperation;
  return [(FCCKPrivateDatabaseOperation *)&v3 validateOperation];
}

- (void)performOperation
{
  objc_super v3 = objc_alloc_init(FCThreadSafeMutableArray);
  dispatch_group_t v4 = dispatch_group_create();
  char v5 = [(FCCKPrivateDatabaseOperation *)self skipPreflight];
  v6 = [(FCCKPrivateDatabaseOperation *)self database];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__FCCKPrivateFetchDatabaseChangesOperation_performOperation__block_invoke;
  v14[3] = &unk_1E5B58250;
  dispatch_group_t v15 = v4;
  v16 = self;
  v7 = v3;
  v17 = v7;
  v8 = v4;
  -[FCCKPrivateDatabase enumerateActiveDestinationsWithOptions:handler:]((uint64_t)v6, v5, v14);

  v9 = FCDispatchQueueForQualityOfService([(FCCKPrivateFetchDatabaseChangesOperation *)self qualityOfService]);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__FCCKPrivateFetchDatabaseChangesOperation_performOperation__block_invoke_5;
  block[3] = &unk_1E5B4BE70;
  v12 = v7;
  v13 = self;
  v10 = v7;
  dispatch_group_notify(v8, v9, block);
}

void __60__FCCKPrivateFetchDatabaseChangesOperation_performOperation__block_invoke(uint64_t a1, uint64_t a2)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v4 = objc_alloc_init(MEMORY[0x1E4F1A038]);
  char v5 = [*(id *)(a1 + 40) previousServerChangeToken];
  v6 = [v5 changeTokenForDestination:a2];
  [v4 setPreviousServerChangeToken:v6];

  [v4 setFetchAllChanges:1];
  v7 = objc_opt_new();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __60__FCCKPrivateFetchDatabaseChangesOperation_performOperation__block_invoke_2;
  v21[3] = &unk_1E5B58200;
  id v8 = v7;
  id v22 = v8;
  [v4 setRecordZoneWithIDChangedBlock:v21];
  v9 = [MEMORY[0x1E4F1CA48] array];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __60__FCCKPrivateFetchDatabaseChangesOperation_performOperation__block_invoke_3;
  v19[3] = &unk_1E5B58200;
  id v10 = v9;
  id v20 = v10;
  [v4 setRecordZoneWithIDWasDeletedBlock:v19];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__FCCKPrivateFetchDatabaseChangesOperation_performOperation__block_invoke_4;
  v13[3] = &unk_1E5B58228;
  uint64_t v18 = a2;
  id v14 = v8;
  id v15 = v10;
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 32);
  id v11 = v10;
  id v12 = v8;
  [v4 setFetchDatabaseChangesCompletionBlock:v13];
  [*(id *)(a1 + 40) runChildCKOperation:v4 destination:a2];
}

uint64_t __60__FCCKPrivateFetchDatabaseChangesOperation_performOperation__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

uint64_t __60__FCCKPrivateFetchDatabaseChangesOperation_performOperation__block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

void __60__FCCKPrivateFetchDatabaseChangesOperation_performOperation__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = a2;
  v9 = objc_alloc_init(FCCKPrivateFetchDatabaseChangesSingleDestinationResult);
  [(FCCKPrivateFetchDatabaseChangesSingleDestinationResult *)v9 setDestination:*(void *)(a1 + 64)];
  [(FCCKPrivateFetchDatabaseChangesSingleDestinationResult *)v9 setChangedZoneIDs:*(void *)(a1 + 32)];
  [(FCCKPrivateFetchDatabaseChangesSingleDestinationResult *)v9 setDeletedZoneIDs:*(void *)(a1 + 40)];
  [(FCCKPrivateFetchDatabaseChangesSingleDestinationResult *)v9 setServerChangeToken:v8];

  [(FCCKPrivateFetchDatabaseChangesSingleDestinationResult *)v9 setMoreComing:a3];
  [(FCCKPrivateFetchDatabaseChangesSingleDestinationResult *)v9 setError:v7];

  [*(id *)(a1 + 48) addObject:v9];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __60__FCCKPrivateFetchDatabaseChangesOperation_performOperation__block_invoke_5(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  id v20 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v18 = a1;
  id obj = [*(id *)(a1 + 32) readOnlyArray];
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    LOBYTE(v7) = 0;
    uint64_t v8 = *(void *)v22;
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v11 = [v10 changedZoneIDs];
        [v2 addObjectsFromArray:v11];

        id v12 = [v10 deletedZoneIDs];
        [v3 addObjectsFromArray:v12];

        v13 = [v10 serverChangeToken];

        if (v13)
        {
          id v14 = [v10 serverChangeToken];
          id v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "destination"));
          [v20 setObject:v14 forKeyedSubscript:v15];
        }
        if (v7)
        {
          uint64_t v7 = 1;
          if (v6) {
            goto LABEL_12;
          }
        }
        else
        {
          uint64_t v7 = [v10 moreComing];
          if (v6)
          {
LABEL_12:
            if (!objc_msgSend(v6, "fc_isCKErrorWithCode:", 21)) {
              continue;
            }
          }
        }
        uint64_t v16 = [v10 error];

        v6 = (void *)v16;
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (!v5) {
        goto LABEL_18;
      }
    }
  }
  v6 = 0;
  uint64_t v7 = 0;
LABEL_18:

  [*(id *)(v18 + 40) setResultChangedZoneIDs:v2];
  [*(id *)(v18 + 40) setResultDeletedZoneIDs:v3];
  id v17 = [[FCCKPrivateDatabaseServerChangeToken alloc] initWithChangeTokensByDestination:v20];
  [*(id *)(v18 + 40) setResultServerChangeToken:v17];

  [*(id *)(v18 + 40) setResultMoreComing:v7];
  [*(id *)(v18 + 40) finishedPerformingOperationWithError:v6];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(FCCKPrivateFetchDatabaseChangesOperation *)self resultServerChangeToken];
  BOOL v5 = [(FCCKPrivateFetchDatabaseChangesOperation *)self resultMoreComing];
  if (v10)
  {
    if (!v4)
    {
      uint64_t v4 = [(FCCKPrivateFetchDatabaseChangesOperation *)self previousServerChangeToken];
    }
    BOOL v5 = 1;
  }
  v6 = [(FCCKPrivateFetchDatabaseChangesOperation *)self fetchDatabaseChangesCompletionBlock];

  if (v6)
  {
    uint64_t v7 = [(FCCKPrivateFetchDatabaseChangesOperation *)self fetchDatabaseChangesCompletionBlock];
    uint64_t v8 = [(FCCKPrivateFetchDatabaseChangesOperation *)self resultChangedZoneIDs];
    v9 = [(FCCKPrivateFetchDatabaseChangesOperation *)self resultDeletedZoneIDs];
    ((void (**)(void, void *, void *, void *, BOOL, id))v7)[2](v7, v8, v9, v4, v5, v10);
  }
}

- (FCCKPrivateDatabaseServerChangeToken)previousServerChangeToken
{
  return self->_previousServerChangeToken;
}

- (void)setPreviousServerChangeToken:(id)a3
{
}

- (id)fetchDatabaseChangesCompletionBlock
{
  return self->_fetchDatabaseChangesCompletionBlock;
}

- (void)setFetchDatabaseChangesCompletionBlock:(id)a3
{
}

- (NSArray)resultChangedZoneIDs
{
  return self->_resultChangedZoneIDs;
}

- (void)setResultChangedZoneIDs:(id)a3
{
}

- (NSArray)resultDeletedZoneIDs
{
  return self->_resultDeletedZoneIDs;
}

- (void)setResultDeletedZoneIDs:(id)a3
{
}

- (FCCKPrivateDatabaseServerChangeToken)resultServerChangeToken
{
  return self->_resultServerChangeToken;
}

- (void)setResultServerChangeToken:(id)a3
{
}

- (BOOL)resultMoreComing
{
  return self->_resultMoreComing;
}

- (void)setResultMoreComing:(BOOL)a3
{
  self->_resultMoreComing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultServerChangeToken, 0);
  objc_storeStrong((id *)&self->_resultDeletedZoneIDs, 0);
  objc_storeStrong((id *)&self->_resultChangedZoneIDs, 0);
  objc_storeStrong(&self->_fetchDatabaseChangesCompletionBlock, 0);
  objc_storeStrong((id *)&self->_previousServerChangeToken, 0);
}

@end