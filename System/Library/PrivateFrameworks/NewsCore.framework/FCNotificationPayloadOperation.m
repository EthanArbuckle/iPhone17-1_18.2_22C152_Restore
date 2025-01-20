@interface FCNotificationPayloadOperation
- (FCNotificationPayloadOperation)init;
- (FCNotificationPayloadOperation)initWithContext:(id)a3 notificationItems:(id)a4;
- (id)completionHandler;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setCompletionHandler:(id)a3;
@end

@implementation FCNotificationPayloadOperation

- (FCNotificationPayloadOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCNotificationPayloadOperation init]";
    __int16 v9 = 2080;
    v10 = "FCNotificationPayloadOperation.m";
    __int16 v11 = 1024;
    int v12 = 43;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCNotificationPayloadOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCNotificationPayloadOperation)initWithContext:(id)a3 notificationItems:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCNotificationPayloadOperation;
  __int16 v9 = [(FCOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_notificationItems, a4);
  }

  return v10;
}

- (void)performOperation
{
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__FCNotificationPayloadOperation_performOperation__block_invoke;
  v13[3] = &unk_1E5B4E758;
  v13[4] = self;
  v3 = [MEMORY[0x1E4F81BF0] firstly:v13];
  uint64_t v4 = zalgo();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__FCNotificationPayloadOperation_performOperation__block_invoke_2;
  v12[3] = &unk_1E5B4FCD8;
  v12[4] = self;
  v5 = [v3 thenOn:v4 then:v12];
  id v6 = zalgo();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__FCNotificationPayloadOperation_performOperation__block_invoke_3;
  v11[3] = &unk_1E5B4FD00;
  v11[4] = self;
  id v7 = [v5 thenOn:v6 then:v11];
  id v8 = zalgo();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__FCNotificationPayloadOperation_performOperation__block_invoke_10;
  v10[3] = &unk_1E5B4FD28;
  v10[4] = self;
  id v9 = (id)[v7 errorOn:v8 error:v10];
}

id __50__FCNotificationPayloadOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2 = [*(id *)(v1 + 376) configurationManager];
    v3 = FCCoreConfigurationPromise(v2);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __50__FCNotificationPayloadOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  if (v2)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke;
    v7[3] = &unk_1E5B50378;
    v7[4] = v2;
    id v8 = v3;
    v5 = (void *)[v4 initWithResolver:v7];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __50__FCNotificationPayloadOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = v5;
    id v8 = [v6 shortOperationDescription];
    int v12 = 138543618;
    __int16 v13 = v8;
    __int16 v14 = 2048;
    uint64_t v15 = [v4 count];
    _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will finish with %lu notification payloads", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    objc_storeStrong((id *)(v9 + 392), a2);
    v10 = *(void **)(a1 + 32);
  }
  else
  {
    v10 = 0;
  }
  [v10 finishedPerformingOperationWithError:0];

  return 0;
}

uint64_t __50__FCNotificationPayloadOperation_performOperation__block_invoke_10(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v9 = a3;
  id v4 = [(FCNotificationPayloadOperation *)self completionHandler];

  if (v4)
  {
    uint64_t v5 = [(FCNotificationPayloadOperation *)self completionHandler];
    id v6 = (void *)v5;
    if (self) {
      resultNotificationPayloads = self->_resultNotificationPayloads;
    }
    else {
      resultNotificationPayloads = 0;
    }
    if (resultNotificationPayloads) {
      id v8 = resultNotificationPayloads;
    }
    else {
      id v8 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    (*(void (**)(uint64_t, NSArray *, id))(v5 + 16))(v5, v8, v9);
  }
}

void __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v7) {
    id v7 = (void *)v7[48];
  }
  id v8 = v7;
  id v9 = objc_msgSend(v8, "fc_dictionaryWithKeyBlock:valueBlock:", &__block_literal_global_194, &__block_literal_global_15_3);

  if ([v9 count])
  {
    v10 = (id)FCOperationLog;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = [*(id *)(a1 + 32) shortOperationDescription];
      int v12 = *(void **)(a1 + 32);
      id v31 = v6;
      if (v12) {
        int v12 = (void *)v12[48];
      }
      __int16 v13 = v12;
      uint64_t v14 = [v13 count];
      uint64_t v15 = *(void **)(a1 + 32);
      if (v15) {
        uint64_t v15 = (void *)v15[48];
      }
      uint64_t v16 = v15;
      v17 = objc_msgSend(v16, "fc_arrayByTransformingWithBlock:", &__block_literal_global_20_3);
      *(_DWORD *)buf = 138543874;
      v42 = v11;
      __int16 v43 = 2048;
      uint64_t v44 = v14;
      __int16 v45 = 2114;
      v46 = v17;
      _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ will fetch payloads for %lu notification items: %{public}@@", buf, 0x20u);

      id v6 = v31;
    }

    v18 = objc_alloc_init(FCCKMultiFetchQueryOperation);
    uint64_t v19 = *(void *)(a1 + 32);
    if (v19) {
      v20 = *(void **)(v19 + 376);
    }
    else {
      v20 = 0;
    }
    v21 = [v20 internalContentContext];
    v22 = [v21 contentDatabase];
    -[FCCKMultiFetchQueryOperation setDatabase:]((uint64_t)v18, v22);

    v23 = (void *)MEMORY[0x1E4F1C978];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_23;
    v37[3] = &unk_1E5B4BF30;
    id v38 = v9;
    v24 = objc_msgSend(v23, "fc_array:", v37);
    -[FCCKMultiFetchQueryOperation setRecordIDs:]((uint64_t)v18, v24);

    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_3_27;
    v36[3] = &unk_1E5B4BF30;
    v36[4] = *(void *)(a1 + 32);
    v25 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v36);
    -[FCCKMultiFetchQueryOperation setRecordSpecs:]((uint64_t)v18, v25);

    newValue[0] = MEMORY[0x1E4F143A8];
    newValue[1] = 3221225472;
    newValue[2] = __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_4_29;
    newValue[3] = &unk_1E5B5C780;
    id v26 = v6;
    uint64_t v27 = *(void *)(a1 + 32);
    v28 = *(void **)(a1 + 40);
    id v34 = v26;
    newValue[4] = v27;
    id v33 = v28;
    id v35 = v5;
    id v30 = v5;
    if (v18) {
      objc_setProperty_nonatomic_copy(v18, v29, newValue, 432);
    }
    [*(id *)(a1 + 32) associateChildOperation:v18];
    [(FCOperation *)v18 start];
  }
  else
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_4;
    v39[3] = &unk_1E5B4CC80;
    v39[4] = *(void *)(a1 + 32);
    id v40 = v5;
    v18 = (FCCKMultiFetchQueryOperation *)v5;
    __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_4((uint64_t)v39);
  }
}

uint64_t __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 articleID];
}

uint64_t __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_4(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 shortOperationDescription];
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ will end early because there are no notification items", (uint8_t *)&v7, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_17(uint64_t a1, void *a2)
{
  return [a2 articleID];
}

void __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_23(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_2_24;
  v6[3] = &unk_1E5B57F38;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_2_24(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 addObject:a2];
  [*(id *)(a1 + 32) addObject:v6];
}

void __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_3_27(uint64_t a1, void *a2)
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  id v6 = v4;
  if (v4) {
    objc_setProperty_nonatomic_copy(v4, v5, @"NotificationItem", 16);
  }
  v45[0] = @"body";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
  uint64_t v9 = v7;
  if (v6)
  {
    objc_setProperty_nonatomic_copy(v6, v8, v7, 24);

    objc_setProperty_nonatomic_copy(v6, v10, MEMORY[0x1E4F1CBF0], 32);
  }
  else
  {
  }
  [v3 addObject:v6];
  __int16 v11 = objc_opt_new();
  __int16 v13 = v11;
  if (v11) {
    objc_setProperty_nonatomic_copy(v11, v12, @"Article", 16);
  }
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    uint64_t v15 = *(void **)(v14 + 376);
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = [v15 internalContentContext];
  v17 = [v16 articleRecordSource];
  uint64_t v19 = [v17 desiredKeys];
  if (v13) {
    objc_setProperty_nonatomic_copy(v13, v18, v19, 24);
  }

  v44[0] = @"sourceChannelTagID";
  v44[1] = @"parentIssueID";
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
  if (v13) {
    objc_setProperty_nonatomic_copy(v13, v20, v21, 32);
  }

  [v3 addObject:v13];
  v22 = objc_opt_new();
  v24 = v22;
  if (v22) {
    objc_setProperty_nonatomic_copy(v22, v23, @"Tag", 16);
  }
  uint64_t v25 = *(void *)(a1 + 32);
  if (v25) {
    id v26 = *(void **)(v25 + 376);
  }
  else {
    id v26 = 0;
  }
  uint64_t v27 = [v26 internalContentContext];
  v28 = [v27 tagRecordSource];
  v29 = [v28 desiredKeys];
  id v31 = v29;
  if (v24)
  {
    objc_setProperty_nonatomic_copy(v24, v30, v29, 24);

    objc_setProperty_nonatomic_copy(v24, v32, MEMORY[0x1E4F1CBF0], 32);
  }
  else
  {
  }
  [v3 addObject:v24];
  id v33 = objc_opt_new();
  id v35 = v33;
  if (v33) {
    objc_setProperty_nonatomic_copy(v33, v34, @"Issue", 16);
  }
  uint64_t v36 = *(void *)(a1 + 32);
  if (v36) {
    v37 = *(void **)(v36 + 376);
  }
  else {
    v37 = 0;
  }
  id v38 = [v37 internalContentContext];
  v39 = [v38 issueRecordSource];
  id v40 = [v39 desiredKeys];
  v42 = v40;
  if (v35)
  {
    objc_setProperty_nonatomic_copy(v35, v41, v40, 24);

    objc_setProperty_nonatomic_copy(v35, v43, MEMORY[0x1E4F1CBF0], 32);
  }
  else
  {
  }
  [v3 addObject:v35];
}

void __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_4_29(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    uint64_t v43 = MEMORY[0x1E4F143A8];
    uint64_t v44 = 3221225472;
    __int16 v45 = __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_5;
    v46 = &unk_1E5B4C7C0;
    v48 = (void (**)(id, id))*(id *)(a1 + 48);
    id v47 = v7;
    v48[2](v48, v47);

    id v8 = v48;
  }
  else
  {
    uint64_t v36 = objc_msgSend(v6, "fc_dictionaryWithKeyBlock:", &__block_literal_global_32_3);
    id v8 = objc_msgSend(v6, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_35_1);
    uint64_t v9 = objc_msgSend(v6, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_37_1);
    uint64_t v10 = objc_msgSend(v6, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_39_2);
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      int v12 = *(void **)(v11 + 376);
    }
    else {
      int v12 = 0;
    }
    __int16 v13 = [v12 internalContentContext];
    uint64_t v14 = [v13 articleRecordSource];
    uint64_t v15 = [v14 convertRecords:v8];

    uint64_t v16 = *(void *)(a1 + 32);
    if (v16) {
      v17 = *(void **)(v16 + 376);
    }
    else {
      v17 = 0;
    }
    v18 = [v17 internalContentContext];
    uint64_t v19 = [v18 tagRecordSource];
    id v38 = (void *)v9;
    v20 = [v19 convertRecords:v9];

    uint64_t v21 = *(void *)(a1 + 32);
    if (v21) {
      v22 = *(void **)(v21 + 376);
    }
    else {
      v22 = 0;
    }
    v23 = [v22 internalContentContext];
    v24 = [v23 issueRecordSource];
    v37 = (void *)v10;
    uint64_t v25 = [v24 convertRecords:v10];

    id v26 = *(void **)(a1 + 32);
    uint64_t v27 = *(void **)(a1 + 40);
    if (v26) {
      id v26 = (void *)v26[47];
    }
    v28 = v26;
    v29 = [v28 assetManager];
    id v30 = FCHeadlinesWithHeldRecords(v27, v29, v15, v20, v25, 1, 1);

    uint64_t v31 = *(void *)(a1 + 32);
    if (v31) {
      SEL v32 = *(void **)(v31 + 384);
    }
    else {
      SEL v32 = 0;
    }
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_10;
    v39[3] = &unk_1E5B5C758;
    id v40 = v30;
    uint64_t v41 = v31;
    id v42 = v36;
    id v33 = v36;
    id v34 = v30;
    id v35 = objc_msgSend(v32, "fc_arrayByTransformingWithBlock:", v39);
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

id __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_6(uint64_t a1, void *a2)
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

uint64_t __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = [a2 recordType];
  uint64_t v3 = [v2 isEqualToString:@"Article"];

  return v3;
}

uint64_t __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = [a2 recordType];
  uint64_t v3 = [v2 isEqualToString:@"Tag"];

  return v3;
}

uint64_t __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = [a2 recordType];
  uint64_t v3 = [v2 isEqualToString:@"Issue"];

  return v3;
}

FCNotificationPayload *__80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_10(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  id v5 = [v3 articleID];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = v6;
    id v8 = (void *)a1[6];
    uint64_t v9 = [v3 identifier];
    uint64_t v10 = [v8 objectForKeyedSubscript:v9];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"body"];
    int v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [v7 shortExcerpt];
    }
    uint64_t v15 = v13;

    if (v15)
    {
      id v16 = v15;
      uint64_t v14 = [[FCNotificationPayload alloc] initWithNotificationItem:v3 headline:v7 bodyText:v16];
    }
    else
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_41;
      v18[3] = &unk_1E5B4E868;
      v18[4] = a1[5];
      id v19 = v3;
      __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_41((uint64_t)v18);
      uint64_t v14 = (FCNotificationPayload *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_11;
    v20[3] = &unk_1E5B4E868;
    v20[4] = a1[5];
    id v21 = v3;
    __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_11((uint64_t)v20);
    uint64_t v14 = (FCNotificationPayload *)objc_claimAutoreleasedReturnValue();
  }
  return v14;
}

uint64_t __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_11(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 shortOperationDescription];
    id v6 = [*(id *)(a1 + 40) articleID];
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ omitting payload for notification item because it has no headline, articleID=%{public}@", (uint8_t *)&v8, 0x16u);
  }
  return 0;
}

uint64_t __80__FCNotificationPayloadOperation__promiseNotificationPayloadsWithConfiguration___block_invoke_41(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 shortOperationDescription];
    id v6 = [*(id *)(a1 + 40) articleID];
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ omitting payload for notification item because it has no body text, articleID=%{public}@", (uint8_t *)&v8, 0x16u);
  }
  return 0;
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
  objc_storeStrong((id *)&self->_resultNotificationPayloads, 0);
  objc_storeStrong((id *)&self->_notificationItems, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end