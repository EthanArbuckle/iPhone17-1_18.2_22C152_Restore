@interface FCCKPrivateSaveDatabaseSubscriptionOperation
- (BOOL)validateOperation;
- (CKNotificationInfo)notificationInfo;
- (NSString)subscriptionID;
- (id)saveDatabaseSubscriptionCompletionBlock;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setNotificationInfo:(id)a3;
- (void)setSaveDatabaseSubscriptionCompletionBlock:(id)a3;
- (void)setSubscriptionID:(id)a3;
@end

@implementation FCCKPrivateSaveDatabaseSubscriptionOperation

- (BOOL)validateOperation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)FCCKPrivateSaveDatabaseSubscriptionOperation;
  BOOL v3 = [(FCCKPrivateDatabaseOperation *)&v7 validateOperation];
  v4 = [(FCCKPrivateSaveDatabaseSubscriptionOperation *)self subscriptionID];

  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)[[NSString alloc] initWithFormat:@"can't save database subscriptions without a subscription ID"];
    *(_DWORD *)buf = 136315906;
    v9 = "-[FCCKPrivateSaveDatabaseSubscriptionOperation validateOperation]";
    __int16 v10 = 2080;
    v11 = "FCCKPrivateSaveDatabaseSubscriptionOperation.m";
    __int16 v12 = 1024;
    int v13 = 20;
    __int16 v14 = 2114;
    v15 = v6;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  return v4 && v3;
}

- (void)performOperation
{
  BOOL v3 = objc_alloc_init(FCCKPrivateDatabaseCKOperationResults);
  char v4 = [(FCCKPrivateDatabaseOperation *)self skipPreflight];
  v5 = [(FCCKPrivateDatabaseOperation *)self database];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__FCCKPrivateSaveDatabaseSubscriptionOperation_performOperation__block_invoke;
  v9[3] = &unk_1E5B4C8D0;
  __int16 v10 = v3;
  v11 = self;
  v6 = v3;
  -[FCCKPrivateDatabase enumerateActiveDestinationsWithOptions:handler:]((uint64_t)v5, v4, v9);

  uint64_t v7 = [(FCCKPrivateSaveDatabaseSubscriptionOperation *)self qualityOfService];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__FCCKPrivateSaveDatabaseSubscriptionOperation_performOperation__block_invoke_4;
  v8[3] = &unk_1E5B4C8F8;
  v8[4] = self;
  [(FCCKPrivateDatabaseCKOperationResults *)v6 notifyWhenFinishWithQoS:v7 completionHandler:v8];
}

void __64__FCCKPrivateSaveDatabaseSubscriptionOperation_performOperation__block_invoke(uint64_t a1, uint64_t a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) operationWillStart];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1A0F0]);
  v5 = [*(id *)(a1 + 40) subscriptionID];
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v4 setSubscriptionIDs:v6];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__FCCKPrivateSaveDatabaseSubscriptionOperation_performOperation__block_invoke_2;
  v9[3] = &unk_1E5B4C8A8;
  int8x16_t v8 = *(int8x16_t *)(a1 + 32);
  id v7 = (id)v8.i64[0];
  int8x16_t v10 = vextq_s8(v8, v8, 8uLL);
  uint64_t v11 = a2;
  [v4 setFetchSubscriptionCompletionBlock:v9];
  [*(id *)(a1 + 40) runChildCKOperation:v4 destination:a2];
}

void __64__FCCKPrivateSaveDatabaseSubscriptionOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [a2 allValues];
  id v7 = [v6 firstObject];

  if (v7)
  {
    int8x16_t v8 = [v7 notificationInfo];
    int v9 = [v8 shouldSendContentAvailable];
    int8x16_t v10 = [*(id *)(a1 + 32) notificationInfo];
    int v11 = [v10 shouldSendContentAvailable];

    if (v9 == v11) {
      goto LABEL_5;
    }
  }
  id v12 = objc_alloc(MEMORY[0x1E4F19F50]);
  int v13 = [*(id *)(a1 + 32) subscriptionID];
  __int16 v14 = (void *)[v12 initWithSubscriptionID:v13];

  v15 = [*(id *)(a1 + 32) notificationInfo];
  [v14 setNotificationInfo:v15];

  if (!v14)
  {
LABEL_5:
    v20 = *(void **)(a1 + 40);
    __int16 v14 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
    v24 = v14;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    [v20 operationDidFinishWithItemIDs:v16 resultItems:0 error:v5];
  }
  else
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1A1B8]);
    v25[0] = v14;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    [v16 setSubscriptionsToSave:v17];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __64__FCCKPrivateSaveDatabaseSubscriptionOperation_performOperation__block_invoke_3;
    v21[3] = &unk_1E5B4C880;
    id v18 = *(id *)(a1 + 40);
    uint64_t v19 = *(void *)(a1 + 48);
    id v22 = v18;
    uint64_t v23 = v19;
    [v16 setModifySubscriptionsCompletionBlock:v21];
    [*(id *)(a1 + 32) runChildCKOperation:v16 destination:*(void *)(a1 + 48)];
  }
}

void __64__FCCKPrivateSaveDatabaseSubscriptionOperation_performOperation__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = NSNumber;
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a4;
  int8x16_t v8 = [v4 numberWithInteger:v6];
  v10[0] = v8;
  int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v5 operationDidFinishWithItemIDs:v9 resultItems:0 error:v7];
}

uint64_t __64__FCCKPrivateSaveDatabaseSubscriptionOperation_performOperation__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:");
}

- (void)operationWillFinishWithError:(id)a3
{
  id v6 = a3;
  id v4 = [(FCCKPrivateSaveDatabaseSubscriptionOperation *)self saveDatabaseSubscriptionCompletionBlock];

  if (v4)
  {
    id v5 = [(FCCKPrivateSaveDatabaseSubscriptionOperation *)self saveDatabaseSubscriptionCompletionBlock];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (NSString)subscriptionID
{
  return self->_subscriptionID;
}

- (void)setSubscriptionID:(id)a3
{
}

- (CKNotificationInfo)notificationInfo
{
  return self->_notificationInfo;
}

- (void)setNotificationInfo:(id)a3
{
}

- (id)saveDatabaseSubscriptionCompletionBlock
{
  return self->_saveDatabaseSubscriptionCompletionBlock;
}

- (void)setSaveDatabaseSubscriptionCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_saveDatabaseSubscriptionCompletionBlock, 0);
  objc_storeStrong((id *)&self->_notificationInfo, 0);
  objc_storeStrong((id *)&self->_subscriptionID, 0);
}

@end