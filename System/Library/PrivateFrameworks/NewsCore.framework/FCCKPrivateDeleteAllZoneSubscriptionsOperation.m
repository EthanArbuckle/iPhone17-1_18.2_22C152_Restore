@interface FCCKPrivateDeleteAllZoneSubscriptionsOperation
- (id)deleteAllZoneSubscriptionsCompletionBlock;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setDeleteAllZoneSubscriptionsCompletionBlock:(id)a3;
@end

@implementation FCCKPrivateDeleteAllZoneSubscriptionsOperation

- (void)performOperation
{
  v3 = [MEMORY[0x1E4F1A0F0] fetchAllSubscriptionsOperation];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__FCCKPrivateDeleteAllZoneSubscriptionsOperation_performOperation__block_invoke;
  v4[3] = &unk_1E5B54048;
  v4[4] = self;
  v4[5] = 1;
  [v3 setFetchSubscriptionCompletionBlock:v4];
  [(FCCKPrivateDatabaseOperation *)self runChildCKOperation:v3 destination:1];
}

void __66__FCCKPrivateDeleteAllZoneSubscriptionsOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = [a2 allValues];
  v7 = objc_msgSend(v6, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_64);

  if ([v7 count])
  {
    v8 = objc_msgSend(v7, "fc_arrayByTransformingWithBlock:", &__block_literal_global_3);
    id v9 = objc_alloc_init(MEMORY[0x1E4F1A1B8]);
    [v9 setSubscriptionIDsToDelete:v8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__FCCKPrivateDeleteAllZoneSubscriptionsOperation_performOperation__block_invoke_4;
    v10[3] = &unk_1E5B4EA68;
    v10[4] = *(void *)(a1 + 32);
    [v9 setModifySubscriptionsCompletionBlock:v10];
    [*(id *)(a1 + 32) runChildCKOperation:v9 destination:*(void *)(a1 + 40)];
  }
  else
  {
    [*(id *)(a1 + 32) finishedPerformingOperationWithError:v5];
  }
}

BOOL __66__FCCKPrivateDeleteAllZoneSubscriptionsOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 subscriptionType] == 2;
}

uint64_t __66__FCCKPrivateDeleteAllZoneSubscriptionsOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 subscriptionID];
}

uint64_t __66__FCCKPrivateDeleteAllZoneSubscriptionsOperation_performOperation__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a4];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v6 = a3;
  v4 = [(FCCKPrivateDeleteAllZoneSubscriptionsOperation *)self deleteAllZoneSubscriptionsCompletionBlock];

  if (v4)
  {
    id v5 = [(FCCKPrivateDeleteAllZoneSubscriptionsOperation *)self deleteAllZoneSubscriptionsCompletionBlock];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (id)deleteAllZoneSubscriptionsCompletionBlock
{
  return self->_deleteAllZoneSubscriptionsCompletionBlock;
}

- (void)setDeleteAllZoneSubscriptionsCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end