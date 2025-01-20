@interface FCNotificationPoolOperation
- (FCNotificationPoolOperation)init;
- (FCNotificationPoolOperation)initWithContext:(id)a3 contentVariantProvider:(id)a4;
- (id)completionHandler;
- (id)itemHandler;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setCompletionHandler:(id)a3;
- (void)setItemHandler:(id)a3;
@end

@implementation FCNotificationPoolOperation

- (FCNotificationPoolOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCNotificationPoolOperation init]";
    __int16 v9 = 2080;
    v10 = "FCNotificationPoolOperation.m";
    __int16 v11 = 1024;
    int v12 = 47;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCNotificationPoolOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCNotificationPoolOperation)initWithContext:(id)a3 contentVariantProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCNotificationPoolOperation;
  __int16 v9 = [(FCOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_contentVariantProvider, a4);
  }

  return v10;
}

- (void)performOperation
{
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__FCNotificationPoolOperation_performOperation__block_invoke;
  v13[3] = &unk_1E5B4E758;
  v13[4] = self;
  v3 = [MEMORY[0x1E4F81BF0] firstly:v13];
  uint64_t v4 = zalgo();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__FCNotificationPoolOperation_performOperation__block_invoke_2;
  v12[3] = &unk_1E5B4FCD8;
  v12[4] = self;
  v5 = [v3 thenOn:v4 then:v12];
  id v6 = zalgo();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__FCNotificationPoolOperation_performOperation__block_invoke_3;
  v11[3] = &unk_1E5B4FD00;
  v11[4] = self;
  id v7 = [v5 thenOn:v6 then:v11];
  id v8 = zalgo();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__FCNotificationPoolOperation_performOperation__block_invoke_10;
  v10[3] = &unk_1E5B4FD28;
  v10[4] = self;
  id v9 = (id)[v7 errorOn:v8 error:v10];
}

id __47__FCNotificationPoolOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2 = [*(id *)(v1 + 384) configurationManager];
    v3 = FCCoreConfigurationPromise(v2);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __47__FCNotificationPoolOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = NewsCoreUserDefaults();
  int v5 = [v4 BOOLForKey:@"simulate_notification_pool_with_esl"];

  uint64_t v6 = *(void *)(a1 + 32);
  if (v5)
  {
    id v7 = v3;
    if (v6)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F81BF0]);
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      id v9 = __90__FCNotificationPoolOperation__promiseSimulatedNotificationItemsFromESLWithConfiguration___block_invoke;
LABEL_6:
      v14 = v9;
      uint64_t v15 = &unk_1E5B50378;
      uint64_t v16 = v6;
      id v17 = v7;
      v10 = (void *)[v8 initWithResolver:&v12];

      goto LABEL_7;
    }
  }
  else
  {
    id v7 = v3;
    if (v6)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F81BF0]);
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      id v9 = __74__FCNotificationPoolOperation__promiseNotificationItemsWithConfiguration___block_invoke;
      goto LABEL_6;
    }
  }
  v10 = 0;
LABEL_7:

  return v10;
}

uint64_t __47__FCNotificationPoolOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  int v5 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = v5;
    id v8 = [v6 shortOperationDescription];
    int v12 = 138543618;
    uint64_t v13 = v8;
    __int16 v14 = 2048;
    uint64_t v15 = [v4 count];
    _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will finish with %lu notification items", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    objc_storeStrong((id *)(v9 + 400), a2);
    v10 = *(void **)(a1 + 32);
  }
  else
  {
    v10 = 0;
  }
  [v10 finishedPerformingOperationWithError:0];

  return 0;
}

uint64_t __47__FCNotificationPoolOperation_performOperation__block_invoke_10(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

- (void)operationWillFinishWithError:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(FCNotificationPoolOperation *)self itemHandler];

  if (v5)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    if (self) {
      resultNotificationItems = self->_resultNotificationItems;
    }
    else {
      resultNotificationItems = 0;
    }
    id v7 = resultNotificationItems;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
          uint64_t v13 = [(FCNotificationPoolOperation *)self itemHandler];
          v13[2](v13, v12);

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
  __int16 v14 = [(FCNotificationPoolOperation *)self completionHandler];

  if (v14)
  {
    uint64_t v15 = [(FCNotificationPoolOperation *)self completionHandler];
    ((void (**)(void, id))v15)[2](v15, v4);
  }
}

void __74__FCNotificationPoolOperation__promiseNotificationItemsWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __74__FCNotificationPoolOperation__promiseNotificationItemsWithConfiguration___block_invoke_2;
  v39[3] = &unk_1E5B518C8;
  id v7 = *(void **)(a1 + 40);
  v39[4] = *(void *)(a1 + 32);
  id v40 = v7;
  uint64_t v8 = __74__FCNotificationPoolOperation__promiseNotificationItemsWithConfiguration___block_invoke_2((uint64_t)v39);
  if ([v8 count])
  {
    uint64_t v9 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = v9;
      uint64_t v12 = [v10 shortOperationDescription];
      *(_DWORD *)buf = 138543618;
      v42 = v12;
      __int16 v43 = 2114;
      v44 = v8;
      _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ will fetch from notification item list IDs: %{public}@", buf, 0x16u);
    }
    uint64_t v13 = objc_alloc_init(FCCKBatchedMultiFetchQueryOperation);
    uint64_t v14 = *(void *)(a1 + 32);
    if (v14) {
      uint64_t v15 = *(void **)(v14 + 384);
    }
    else {
      uint64_t v15 = 0;
    }
    long long v16 = [v15 internalContentContext];
    long long v17 = [v16 contentDatabase];
    -[FCCKBatchedMultiFetchQueryOperation setDatabase:]((uint64_t)v13, v17);

    long long v18 = +[FCEdgeCacheHint edgeCacheHintForNotificationPool];
    v20 = v18;
    if (v13)
    {
      objc_setProperty_nonatomic_copy(v13, v19, v18, 416);

      objc_storeStrong((id *)&v13->_recordIDs, v8);
      v13->_maxBatchSize = 1;
    }
    else
    {
    }
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __74__FCNotificationPoolOperation__promiseNotificationItemsWithConfiguration___block_invoke_24;
    v36[3] = &unk_1E5B4BF30;
    v36[4] = *(void *)(a1 + 32);
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v36);
    -[FCCKBatchedMultiFetchQueryOperation setRecordSpecs:]((uint64_t)v13, v21);

    v22 = objc_opt_new();
    newValue[0] = MEMORY[0x1E4F143A8];
    newValue[1] = 3221225472;
    newValue[2] = __74__FCNotificationPoolOperation__promiseNotificationItemsWithConfiguration___block_invoke_2_29;
    newValue[3] = &unk_1E5B51910;
    newValue[4] = *(void *)(a1 + 32);
    id v24 = v22;
    id v35 = v24;
    if (v13) {
      objc_setProperty_nonatomic_copy(v13, v23, newValue, 432);
    }
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __74__FCNotificationPoolOperation__promiseNotificationItemsWithConfiguration___block_invoke_6;
    v30 = &unk_1E5B51938;
    id v32 = v6;
    id v33 = v5;
    id v31 = v24;
    id v26 = v24;
    if (v13) {
      objc_setProperty_nonatomic_copy(v13, v25, &v27, 440);
    }
    objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v13, v27, v28, v29, v30);
    [(FCOperation *)v13 start];
  }
  else
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __74__FCNotificationPoolOperation__promiseNotificationItemsWithConfiguration___block_invoke_5;
    v37[3] = &unk_1E5B4CC80;
    v37[4] = *(void *)(a1 + 32);
    id v38 = v5;
    __74__FCNotificationPoolOperation__promiseNotificationItemsWithConfiguration___block_invoke_5((uint64_t)v37);
  }
}

id __74__FCNotificationPoolOperation__promiseNotificationItemsWithConfiguration___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 392);
  }
  else {
    id v3 = 0;
  }
  id v4 = (void *)[v3 preferredContentVariant];
  if (v4 == (void *)1)
  {
    if (objc_opt_respondsToSelector())
    {
      id v4 = [*(id *)(a1 + 40) paidNotificationItemListIDs];
      goto LABEL_10;
    }
  }
  else
  {
    if (v4) {
      goto LABEL_10;
    }
    if (objc_opt_respondsToSelector())
    {
      id v4 = [*(id *)(a1 + 40) freeNotificationItemListIDs];
      goto LABEL_10;
    }
  }
  id v4 = 0;
LABEL_10:
  return v4;
}

uint64_t __74__FCNotificationPoolOperation__promiseNotificationItemsWithConfiguration___block_invoke_5(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 shortOperationDescription];
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ will end early because there are no notification item list IDs", (uint8_t *)&v7, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __74__FCNotificationPoolOperation__promiseNotificationItemsWithConfiguration___block_invoke_24(uint64_t a1, void *a2)
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  id v6 = v4;
  if (v4) {
    objc_setProperty_nonatomic_copy(v4, v5, @"NotificationItemList", 16);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    uint64_t v8 = *(void **)(v7 + 384);
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = [v8 internalContentContext];
  uint64_t v10 = [v9 notificationItemListRecordSource];
  uint64_t v12 = [v10 desiredKeys];
  if (v6) {
    objc_setProperty_nonatomic_copy(v6, v11, v12, 24);
  }

  v39[0] = @"notificationItemIDs";
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
  if (v6) {
    objc_setProperty_nonatomic_copy(v6, v13, v14, 32);
  }

  [v3 addObject:v6];
  uint64_t v15 = objc_opt_new();
  long long v17 = v15;
  if (v15) {
    objc_setProperty_nonatomic_copy(v15, v16, @"NotificationItem", 16);
  }
  uint64_t v18 = *(void *)(a1 + 32);
  if (v18) {
    long long v19 = *(void **)(v18 + 384);
  }
  else {
    long long v19 = 0;
  }
  v20 = [v19 internalContentContext];
  uint64_t v21 = [v20 notificationItemRecordSource];
  v23 = [v21 desiredKeys];
  if (v17) {
    objc_setProperty_nonatomic_copy(v17, v22, v23, 24);
  }

  id v38 = @"articleID";
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  if (v17) {
    objc_setProperty_nonatomic_copy(v17, v24, v25, 32);
  }

  [v3 addObject:v17];
  id v26 = objc_opt_new();
  uint64_t v28 = v26;
  if (v26) {
    objc_setProperty_nonatomic_copy(v26, v27, @"Article", 16);
  }
  v29 = (void *)MEMORY[0x1E4F82A50];
  uint64_t v30 = *(void *)(a1 + 32);
  if (v30) {
    id v31 = *(void **)(v30 + 384);
  }
  else {
    id v31 = 0;
  }
  id v32 = [v31 internalContentContext];
  id v33 = [v32 articleRecordSource];
  v34 = [v29 keysForArticleRecordWithRecordSource:v33];
  v36 = v34;
  if (v28)
  {
    objc_setProperty_nonatomic_copy(v28, v35, v34, 24);

    objc_setProperty_nonatomic_copy(v28, v37, MEMORY[0x1E4F1CBF0], 32);
  }
  else
  {
  }
  [v3 addObject:v28];
}

void __74__FCNotificationPoolOperation__promiseNotificationItemsWithConfiguration___block_invoke_2_29(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(v4, "fc_dictionaryWithKeyBlock:", &__block_literal_global_33_1);
  id v6 = objc_msgSend(v4, "fc_dictionaryWithKeyBlock:", &__block_literal_global_36);
  id v38 = v4;
  objc_msgSend(v4, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_40);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v41 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (v41)
  {
    uint64_t v40 = *(void *)v55;
    uint64_t v45 = v5;
    uint64_t v46 = a1;
    v44 = v6;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v55 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v54 + 1) + 8 * v7);
        uint64_t v9 = *(void **)(a1 + 32);
        uint64_t v42 = v7;
        if (v9) {
          uint64_t v9 = (void *)v9[48];
        }
        uint64_t v10 = v9;
        uint64_t v11 = [v10 internalContentContext];
        uint64_t v12 = [v11 notificationItemListRecordSource];
        uint64_t v13 = [v12 recordFromCKRecord:v8];

        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        __int16 v43 = v13;
        id v47 = [v13 notificationItemIDs];
        uint64_t v49 = [v47 countByEnumeratingWithState:&v50 objects:v58 count:16];
        if (v49)
        {
          uint64_t v48 = *(void *)v51;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v51 != v48) {
                objc_enumerationMutation(v47);
              }
              uint64_t v15 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v50 + 1) + 8 * v14)];
              uint64_t v16 = *(void *)(a1 + 32);
              if (v16) {
                long long v17 = *(void **)(v16 + 384);
              }
              else {
                long long v17 = 0;
              }
              uint64_t v18 = [v17 internalContentContext];
              long long v19 = [v18 notificationItemRecordSource];
              v20 = [v19 recordFromCKRecord:v15];

              uint64_t v21 = [v20 articleID];

              if (v21)
              {
                v22 = [v20 articleID];
                v23 = [v5 objectForKeyedSubscript:v22];

                uint64_t v24 = *(void *)(a1 + 32);
                id v25 = v23;
                id v26 = v25;
                uint64_t v27 = 0;
                uint64_t v28 = v25;
                if (v24 && v25)
                {
                  v29 = (void *)MEMORY[0x1E4F82A50];
                  id v30 = *(id *)(v24 + 384);
                  id v31 = [v30 contentStoreFrontID];
                  id v32 = [*(id *)(v24 + 384) internalContentContext];
                  id v33 = [v32 articleRecordSource];
                  uint64_t v27 = [v29 feedItemFromCKRecord:v26 storefrontID:v31 recordSource:v33];

                  if (v27)
                  {
                    id v34 = objc_alloc(MEMORY[0x1E4F82AE0]);
                    uint64_t v35 = [v43 notificationSource];
                    v36 = [v43 algoID];
                    uint64_t v28 = (void *)[v34 initWithRecord:v20 feedItem:v27 source:v35 algoID:v36];

                    a1 = v46;
                    [*(id *)(v46 + 40) addObject:v28];
                    id v6 = v44;
                    id v5 = v45;
                    goto LABEL_20;
                  }
                  id v5 = v45;
                  a1 = v46;
                  id v6 = v44;
                }
                else
                {
LABEL_20:
                }
              }

              ++v14;
            }
            while (v49 != v14);
            uint64_t v37 = [v47 countByEnumeratingWithState:&v50 objects:v58 count:16];
            uint64_t v49 = v37;
          }
          while (v37);
        }

        uint64_t v7 = v42 + 1;
      }
      while (v42 + 1 != v41);
      uint64_t v41 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
    }
    while (v41);
  }
}

id __74__FCNotificationPoolOperation__promiseNotificationItemsWithConfiguration___block_invoke_3_30(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 recordType];
  if ([v3 isEqualToString:@"Article"])
  {
    id v4 = [v2 recordID];
    id v5 = [v4 recordName];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

id __74__FCNotificationPoolOperation__promiseNotificationItemsWithConfiguration___block_invoke_4_34(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 recordType];
  if ([v3 isEqualToString:@"NotificationItem"])
  {
    id v4 = [v2 recordID];
    id v5 = [v4 recordName];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t __74__FCNotificationPoolOperation__promiseNotificationItemsWithConfiguration___block_invoke_5_37(uint64_t a1, void *a2)
{
  id v2 = [a2 recordType];
  uint64_t v3 = [v2 isEqualToString:@"NotificationItemList"];

  return v3;
}

void __74__FCNotificationPoolOperation__promiseNotificationItemsWithConfiguration___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  if (v5)
  {
    uint64_t v9 = (void (**)(id, id))*(id *)(a1 + 40);
    id v8 = v5;
    v9[2](v9, v8);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = [*(id *)(a1 + 32) readOnlyArray];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

uint64_t __74__FCNotificationPoolOperation__promiseNotificationItemsWithConfiguration___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __90__FCNotificationPoolOperation__promiseSimulatedNotificationItemsFromESLWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = v7;
    uint64_t v10 = [v8 shortOperationDescription];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v10;
    _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ will simulate notification pool using global ESL inventory", buf, 0xCu);
  }
  uint64_t v11 = [FCGlobalCuratedESLArticlesOperation alloc];
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    uint64_t v13 = *(void **)(v12 + 384);
    uint64_t v14 = *(void *)(v12 + 392);
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }
  uint64_t v15 = *(void *)(a1 + 40);
  id v16 = v13;
  long long v17 = [(FCGlobalCuratedESLArticlesOperation *)v11 initWithContext:v16 configuration:v15 contentVariantProvider:v14];

  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __90__FCNotificationPoolOperation__promiseSimulatedNotificationItemsFromESLWithConfiguration___block_invoke_46;
  v23 = &unk_1E5B514F8;
  id v24 = v6;
  id v25 = v5;
  id v18 = v5;
  id v19 = v6;
  [(FCGlobalCuratedESLArticlesOperation *)v17 setCompletionHandler:&v20];
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v17, v20, v21, v22, v23);
  [(FCOperation *)v17 start];
}

void __90__FCNotificationPoolOperation__promiseSimulatedNotificationItemsFromESLWithConfiguration___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __90__FCNotificationPoolOperation__promiseSimulatedNotificationItemsFromESLWithConfiguration___block_invoke_2;
    id v16 = &unk_1E5B4C7C0;
    id v18 = (void (**)(id, id))*(id *)(a1 + 32);
    id v17 = v6;
    v18[2](v18, v17);

    uint64_t v7 = v18;
  }
  else
  {
    id v8 = objc_opt_new();
    uint64_t v9 = objc_msgSend(v5, "fc_subarrayWithMaxCount:", 2000);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __90__FCNotificationPoolOperation__promiseSimulatedNotificationItemsFromESLWithConfiguration___block_invoke_3;
    v11[3] = &unk_1E5B51960;
    id v12 = v8;
    uint64_t v7 = v8;
    uint64_t v10 = objc_msgSend(v9, "fc_arrayByTransformingWithBlock:", v11);

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __90__FCNotificationPoolOperation__promiseSimulatedNotificationItemsFromESLWithConfiguration___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

id __90__FCNotificationPoolOperation__promiseSimulatedNotificationItemsFromESLWithConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F82AE0];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = FCRandomNotificationItemCloudKitID();
  uint64_t v7 = [v4 articleID];
  id v8 = [v4 clusterID];
  LODWORD(v12) = 0;
  LODWORD(v11) = 7;
  uint64_t v9 = (void *)[v5 initWithIdentifier:v6 canonicalID:v7 clusterID:v8 notabilityScores:*(void *)(a1 + 32) suppressIfFollowingTagIDs:MEMORY[0x1E4F1CBF0] targetMinNewsVersion:0 targetDeviceTypes:v11 feedItem:v4 source:v12 algoID:@"client_simulation"];

  return v9;
}

- (id)itemHandler
{
  return self->_itemHandler;
}

- (void)setItemHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultNotificationItems, 0);
  objc_storeStrong((id *)&self->_contentVariantProvider, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_itemHandler, 0);
}

@end