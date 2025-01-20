@interface FCOfflineANFArticlesFetchOperation
- (BOOL)validateOperation;
- (id)initWithContext:(void *)a3 config:(void *)a4 ANFHelper:(void *)a5 articleIDs:;
- (id)initWithContext:(void *)a3 config:(void *)a4 ANFHelper:(void *)a5 headlines:;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
@end

@implementation FCOfflineANFArticlesFetchOperation

- (id)initWithContext:(void *)a3 config:(void *)a4 ANFHelper:(void *)a5 articleIDs:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)FCOfflineANFArticlesFetchOperation;
    v14 = (id *)objc_msgSendSuper2(&v18, sel_init);
    a1 = v14;
    if (v14)
    {
      objc_storeStrong(v14 + 53, a2);
      objc_storeStrong(a1 + 54, a3);
      objc_storeStrong(a1 + 55, a4);
      uint64_t v15 = [v13 copy];
      id v16 = a1[56];
      a1[56] = (id)v15;
    }
  }

  return a1;
}

- (id)initWithContext:(void *)a3 config:(void *)a4 ANFHelper:(void *)a5 headlines:
{
  id v9 = a5;
  if (a1)
  {
    id v10 = a4;
    id v11 = a3;
    id v12 = a2;
    id v13 = objc_msgSend(v9, "fc_arrayByTransformingWithBlock:", &__block_literal_global_146);
    v14 = -[FCOfflineANFArticlesFetchOperation initWithContext:config:ANFHelper:articleIDs:](a1, v12, v11, v10, v13);

    if (v14)
    {
      uint64_t v15 = [v9 copy];
      id v16 = v14[57];
      v14[57] = (id)v15;
    }
    a1 = v14;
  }
  return a1;
}

uint64_t __81__FCOfflineANFArticlesFetchOperation_initWithContext_config_ANFHelper_headlines___block_invoke(uint64_t a1, void *a2)
{
  return [a2 articleID];
}

- (BOOL)validateOperation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self && self->_context)
  {
    char v3 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)[[NSString alloc] initWithFormat:@"offline ANF fetch operation requires a context"];
      int v8 = 136315906;
      id v9 = "-[FCOfflineANFArticlesFetchOperation validateOperation]";
      __int16 v10 = 2080;
      id v11 = "FCOfflineANFArticlesFetchOperation.m";
      __int16 v12 = 1024;
      int v13 = 110;
      __int16 v14 = 2114;
      uint64_t v15 = v6;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);
    }
    char v3 = 0;
    if (!self) {
      goto LABEL_9;
    }
  }
  if (self->_ANFHelper)
  {
    char v4 = 1;
    return v4 & v3;
  }
LABEL_9:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)[[NSString alloc] initWithFormat:@"offline ANF fetch operation requires a flint helper"];
    int v8 = 136315906;
    id v9 = "-[FCOfflineANFArticlesFetchOperation validateOperation]";
    __int16 v10 = 2080;
    id v11 = "FCOfflineANFArticlesFetchOperation.m";
    __int16 v12 = 1024;
    int v13 = 114;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);
  }
  char v4 = 0;
  return v4 & v3;
}

- (void)performOperation
{
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__64;
  v20[4] = __Block_byref_object_dispose__64;
  id v21 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __54__FCOfflineANFArticlesFetchOperation_performOperation__block_invoke;
  v19[3] = &unk_1E5B4E758;
  v19[4] = self;
  int v13 = [MEMORY[0x1E4F81BF0] firstly:v19];
  char v3 = zalgo();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __54__FCOfflineANFArticlesFetchOperation_performOperation__block_invoke_2;
  v18[3] = &unk_1E5B51488;
  v18[4] = self;
  v18[5] = v20;
  char v4 = [v13 thenOn:v3 then:v18];
  v5 = zalgo();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __54__FCOfflineANFArticlesFetchOperation_performOperation__block_invoke_24;
  v17[3] = &unk_1E5B51488;
  v17[4] = self;
  v17[5] = v20;
  v6 = [v4 thenOn:v5 then:v17];
  v7 = zalgo();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__FCOfflineANFArticlesFetchOperation_performOperation__block_invoke_2_25;
  v16[3] = &unk_1E5B51488;
  v16[4] = self;
  v16[5] = v20;
  int v8 = [v6 thenOn:v7 then:v16];
  id v9 = zalgo();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__FCOfflineANFArticlesFetchOperation_performOperation__block_invoke_3;
  v15[3] = &unk_1E5B4FD00;
  v15[4] = self;
  __int16 v10 = [v8 thenOn:v9 then:v15];
  id v11 = zalgo();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__FCOfflineANFArticlesFetchOperation_performOperation__block_invoke_4;
  v14[3] = &unk_1E5B4FD28;
  v14[4] = self;
  id v12 = (id)[v10 errorOn:v11 error:v14];

  _Block_object_dispose(v20, 8);
}

id __54__FCOfflineANFArticlesFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = *(id *)(v1 + 456);
    char v3 = objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", &__block_literal_global_28_6);

    unint64_t v4 = [v3 count];
    if (v4 >= [*(id *)(v1 + 448) count])
    {
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      uint64_t v15 = __60__FCOfflineANFArticlesFetchOperation__promiseArticleRecords__block_invoke_2;
      uint64_t v16 = &unk_1E5B4C840;
      id v17 = v3;
      uint64_t v1 = [objc_alloc(MEMORY[0x1E4F81BF0]) initWithValue:v17];
    }
    else
    {
      uint64_t v5 = *(void *)(v1 + 392);
      if (v5) {
        (*(void (**)(double))(v5 + 16))(0.0);
      }
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      uint64_t v15 = __60__FCOfflineANFArticlesFetchOperation__promiseArticleRecords__block_invoke_3;
      uint64_t v16 = &unk_1E5B4E758;
      id v17 = (id)v1;
      v6 = [MEMORY[0x1E4F81BF0] firstly:&v13];
      v7 = zalgo();
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __60__FCOfflineANFArticlesFetchOperation__promiseArticleRecords__block_invoke_4;
      v12[3] = &unk_1E5B4FD00;
      v12[4] = v1;
      int v8 = [v6 thenOn:v7 then:v12];
      id v9 = zalgo();
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __60__FCOfflineANFArticlesFetchOperation__promiseArticleRecords__block_invoke_5;
      v11[3] = &unk_1E5B4FD28;
      v11[4] = v1;
      uint64_t v1 = [v8 errorOn:v9 error:v11];
    }
  }
  return (id)v1;
}

id __54__FCOfflineANFArticlesFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count] == 1)
  {
    unint64_t v4 = objc_msgSend(v3, "fc_onlyObject");
    uint64_t v5 = +[FCDescription descriptionWithObject:v4];
    v6 = [v4 base];
    v7 = [v6 identifier];
    [v5 addField:@"id" object:v7];

    int v8 = (void *)MEMORY[0x1E4F1C9C8];
    id v9 = [v4 base];
    __int16 v10 = [v9 modificationDate];
    id v11 = [v8 dateWithPBDate:v10];
    [v5 addField:@"modificationDate" object:v11];

    id v12 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "backendArticleVersion"));
    [v5 addField:@"backendVersion" object:v12];

    uint64_t v13 = [v4 flintDocumentURL];
    [v5 addField:@"anfURL" object:v13];

    uint64_t v14 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void **)(a1 + 32);
      uint64_t v16 = v14;
      id v17 = [v15 shortOperationDescription];
      objc_super v18 = [v5 descriptionString];
      *(_DWORD *)v27 = 138543618;
      *(void *)&v27[4] = v17;
      *(_WORD *)&v27[12] = 2114;
      *(void *)&v27[14] = v18;
      _os_log_impl(&dword_1A460D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ will fetch contents of article record: %{public}@", v27, 0x16u);
    }
  }
  uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
  v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v3;
  id v21 = v3;

  uint64_t v22 = *(void *)(a1 + 32);
  id v23 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v22)
  {
    id v24 = objc_alloc(MEMORY[0x1E4F81BF0]);
    *(void *)v27 = MEMORY[0x1E4F143A8];
    *(void *)&v27[8] = 3221225472;
    *(void *)&v27[16] = __75__FCOfflineANFArticlesFetchOperation__promiseThumbnailsFromArticleRecords___block_invoke;
    v28 = &unk_1E5B50378;
    id v29 = v23;
    uint64_t v30 = v22;
    v25 = (void *)[v24 initWithResolver:v27];
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

id __54__FCOfflineANFArticlesFetchOperation_performOperation__block_invoke_24(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v1)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __77__FCOfflineANFArticlesFetchOperation__promiseANFDocumentsFromArticleRecords___block_invoke;
    v6[3] = &unk_1E5B50378;
    id v7 = v2;
    uint64_t v8 = v1;
    unint64_t v4 = (void *)[v3 initWithResolver:v6];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

id __54__FCOfflineANFArticlesFetchOperation_performOperation__block_invoke_2_25(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v5 = a2;
  if (v3)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke;
    v9[3] = &unk_1E5B507A0;
    id v10 = v4;
    id v11 = v5;
    uint64_t v12 = v3;
    id v7 = (void *)[v6 initWithResolver:v9];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __54__FCOfflineANFArticlesFetchOperation_performOperation__block_invoke_3(uint64_t a1)
{
  return 0;
}

uint64_t __54__FCOfflineANFArticlesFetchOperation_performOperation__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

- (void)operationWillFinishWithError:(id)a3
{
  fetchCompletionHandler = (uint64_t (**)(void))a3;
  id v5 = fetchCompletionHandler;
  if (self)
  {
    fetchCompletionHandler = (uint64_t (**)(void))self->_fetchCompletionHandler;
    if (fetchCompletionHandler)
    {
      id v6 = v5;
      fetchCompletionHandler = (uint64_t (**)(void))fetchCompletionHandler[2]();
      id v5 = v6;
    }
  }
  MEMORY[0x1F41817F8](fetchCompletionHandler, v5);
}

id __60__FCOfflineANFArticlesFetchOperation__promiseArticleRecords__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v3 = v2;
    }
    else {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  id v5 = [v4 articleRecord];

  return v5;
}

id __60__FCOfflineANFArticlesFetchOperation__promiseArticleRecords__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x1E4F81BF0]) initWithValue:*(void *)(a1 + 32)];
  return v1;
}

id __60__FCOfflineANFArticlesFetchOperation__promiseArticleRecords__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if (*(unsigned char *)(v1 + 368))
    {
      id v2 = *(id *)(v1 + 424);
      uint64_t v3 = [v2 internalContentContext];
      id v4 = [v3 articleRecordSource];
      id v5 = *(id *)(v1 + 448);
      id v6 = [v4 cachedRecordsWithIDs:v5];

      id v7 = *(id *)(v1 + 448);
      uint64_t v8 = [v7 count];
      uint64_t v9 = [v6 count];

      if ((unint64_t)(v8 - v9) <= *(void *)(v1 + 384))
      {
        if (*(void *)(v1 + 400))
        {
          uint64_t v13 = [v6 interestTokensByID];
          uint64_t v14 = [v13 allValues];
          uint64_t v22 = MEMORY[0x1E4F143A8];
          uint64_t v23 = 3221225472;
          id v24 = __66__FCOfflineANFArticlesFetchOperation__promiseCachedArticleRecords__block_invoke_53;
          v25 = &unk_1E5B55268;
          id v26 = (id)v1;
          [v14 enumerateObjectsUsingBlock:&v22];
        }
        if (*(void *)(v1 + 408))
        {
          uint64_t v15 = [v6 allRecords];
          uint64_t v16 = objc_msgSend(v15, "fc_arrayByTransformingWithBlock:", &__block_literal_global_56_3);

          id v17 = *(void (***)(void, void))(v1 + 408);
          objc_super v18 = v17;
          uint64_t v19 = +[FCContentArchive archiveWithChildArchives:v16];
          ((void (**)(void, void *))v17)[2](v18, v19);
        }
        id v20 = objc_alloc(MEMORY[0x1E4F81BF0]);
        id v11 = [v6 allRecords];
        id v10 = (void *)[v20 initWithValue:v11];
      }
      else
      {
        uint64_t v22 = MEMORY[0x1E4F143A8];
        uint64_t v23 = 3221225472;
        id v24 = __66__FCOfflineANFArticlesFetchOperation__promiseCachedArticleRecords__block_invoke;
        v25 = &unk_1E5B59888;
        id v26 = v6;
        uint64_t v27 = v1;
        uint64_t v28 = v8 - v9;
        id v10 = __66__FCOfflineANFArticlesFetchOperation__promiseCachedArticleRecords__block_invoke((uint64_t)&v22);
        id v11 = v26;
      }
    }
    else
    {
      id v12 = objc_alloc(MEMORY[0x1E4F81BF0]);
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      id v24 = __67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke;
      v25 = &unk_1E5B4EEF0;
      id v26 = (id)v1;
      id v10 = (void *)[v12 initWithResolver:&v22];
    }
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

id __60__FCOfflineANFArticlesFetchOperation__promiseArticleRecords__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = *(void *)(v4 + 392);
    if (v5) {
      (*(void (**)(double))(v5 + 16))(0.05);
    }
  }
  return v3;
}

void __60__FCOfflineANFArticlesFetchOperation__promiseArticleRecords__block_invoke_5(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    uint64_t v5 = [v3 shortOperationDescription];
    int v6 = 138543362;
    id v7 = v5;
    _os_log_error_impl(&dword_1A460D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch article records", (uint8_t *)&v6, 0xCu);
  }
}

void __67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(FCCKContentBatchedFetchRecordsOperation);
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    uint64_t v9 = *(void **)(v8 + 424);
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = [v9 internalContentContext];
  id v11 = [v10 contentDatabase];
  -[FCCKContentBatchedFetchRecordsOperation setDatabase:]((uint64_t)v7, v11);

  uint64_t v13 = *(void *)(a1 + 32);
  if (v13)
  {
    unint64_t v14 = *(void *)(v13 + 376);
    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  unint64_t v14 = 0;
  if (v7)
  {
LABEL_5:
    v7->_maxBatchSize = v14;
    uint64_t v13 = *(void *)(a1 + 32);
  }
LABEL_6:
  if (v13)
  {
    uint64_t v15 = [*(id *)(v13 + 424) internalContentContext];
    uint64_t v16 = [v15 articleRecordSource];
    id v17 = [v16 desiredKeys];

    objc_super v18 = objc_msgSend(v17, "fc_arrayByRemovingObjectsPassingTest:", &__block_literal_global_74);

    if (!v7) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  objc_super v18 = 0;
  if (v7) {
LABEL_8:
  }
    objc_setProperty_nonatomic_copy(v7, v12, v18, 384);
LABEL_9:

  uint64_t v19 = *(void *)(a1 + 32);
  if (v19) {
    id v20 = *(void **)(v19 + 448);
  }
  else {
    id v20 = 0;
  }
  uint64_t v22 = objc_msgSend(v20, "fc_arrayByTransformingWithBlock:", &__block_literal_global_34_2);
  if (v7) {
    objc_setProperty_nonatomic_copy(v7, v21, v22, 376);
  }

  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke_3;
  newValue[3] = &unk_1E5B59860;
  newValue[4] = *(void *)(a1 + 32);
  id v27 = v6;
  id v28 = v5;
  id v23 = v5;
  id v25 = v6;
  if (v7) {
    objc_setProperty_nonatomic_copy(v7, v24, newValue, 400);
  }
  [*(id *)(a1 + 32) associateChildOperation:v7];
  [(FCOperation *)v7 start];
}

id __67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithRecordName:v3];

  return v4;
}

void __67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke_4;
    v34 = &unk_1E5B4C7C0;
    v36 = (void (**)(id, id))*(id *)(a1 + 40);
    id v35 = v7;
    v36[2](v36, v35);

    uint64_t v8 = v36;
  }
  else
  {
    uint64_t v9 = *(void **)(a1 + 32);
    if (v9) {
      uint64_t v9 = (void *)v9[56];
    }
    id v10 = v9;
    uint64_t v11 = [v10 count];
    uint64_t v12 = [v6 count];

    unint64_t v13 = *(void *)(a1 + 32);
    if (v13) {
      unint64_t v13 = *(void *)(v13 + 384);
    }
    if (v11 - v12 <= v13)
    {
      id v17 = [MEMORY[0x1E4F1CA48] array];
      objc_super v18 = [v6 allValues];
      uint64_t v19 = *(void *)(a1 + 32);
      if (v19) {
        uint64_t v20 = *(void *)(v19 + 376);
      }
      else {
        uint64_t v20 = 0;
      }
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke_44;
      v24[3] = &unk_1E5B4E3A0;
      v24[4] = v19;
      id v25 = v17;
      uint64_t v8 = v17;
      objc_msgSend(v18, "fc_visitSubarraysWithMaxCount:block:", v20, v24);

      (*(void (**)(void, void (**)(id, id), uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48)
                                                                                              + 16))(*(void *)(a1 + 48), v8, v21, v22, v23);
    }
    else
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke_5;
      v26[3] = &unk_1E5B59818;
      unint64_t v14 = (void (**)(id, id))v6;
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void **)(a1 + 40);
      id v27 = v14;
      uint64_t v28 = v15;
      uint64_t v30 = v11 - v12;
      id v29 = v16;
      __67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke_5((uint64_t)v26);

      uint64_t v8 = v27;
    }
  }
}

uint64_t __67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke_5(uint64_t a1)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) allKeys];
  id v3 = objc_msgSend(v2, "fc_setByTransformingWithBlock:", &__block_literal_global_39_1);

  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = *(void **)(a1 + 40);
  if (v5) {
    id v5 = (void *)v5[56];
  }
  id v6 = v5;
  id v7 = [v4 setWithArray:v6];
  uint64_t v8 = objc_msgSend(v7, "fc_setByMinusingSet:", v3);

  id v29 = @"FCErrorMissingObjectsDescriptionsKey";
  v30[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  id v10 = (id)FCOperationLog;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = [*(id *)(a1 + 40) shortOperationDescription];
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v17 = *(void *)(a1 + 40);
    if (v17) {
      uint64_t v18 = *(void *)(v17 + 384);
    }
    else {
      uint64_t v18 = 0;
    }
    uint64_t v19 = [v8 allObjects];
    uint64_t v20 = objc_msgSend(v19, "fc_subarrayWithMaxCount:", 3);
    int v21 = 138544130;
    uint64_t v22 = v15;
    __int16 v23 = 2048;
    uint64_t v24 = v16;
    __int16 v25 = 2048;
    uint64_t v26 = v18;
    __int16 v27 = 2114;
    uint64_t v28 = v20;
    _os_log_error_impl(&dword_1A460D000, v10, OS_LOG_TYPE_ERROR, "%{public}@ missing too many articles, missing=%lu, max=%lu, sample=%{public}@", (uint8_t *)&v21, 0x2Au);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  if (v11 && *(unsigned char *)(v11 + 368))
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "fc_notCachedErrorWithMissingObjects:", v8);
  }
  else
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "fc_partialFailureErrorWithUserInfo:", v9);
  }
  unint64_t v14 = (void *)v13;
  (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, v13);
}

uint64_t __67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 recordName];
}

void __67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke_44(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v4 = *(void **)(v3 + 424);
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = a2;
  id v6 = [v4 internalContentContext];
  id v7 = [v6 articleRecordSource];
  id v17 = [v7 convertRecords:v5];

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8 && *(void *)(v8 + 408))
  {
    uint64_t v9 = [v17 allRecords];
    id v10 = objc_msgSend(v9, "fc_arrayByTransformingWithBlock:", &__block_literal_global_48_0);

    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      uint64_t v12 = *(void (***)(void, void))(v11 + 408);
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v13 = v12;
    unint64_t v14 = +[FCContentArchive archiveWithChildArchives:v10];
    ((void (**)(void, void *))v12)[2](v13, v14);
  }
  uint64_t v15 = *(void **)(a1 + 40);
  uint64_t v16 = [v17 allRecords];
  [v15 addObjectsFromArray:v16];
}

FCContentArchive *__67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke_2_45(uint64_t a1, uint64_t a2)
{
  return +[FCContentArchive archiveWithRecord:a2];
}

id __66__FCOfflineANFArticlesFetchOperation__promiseCachedArticleRecords__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [*(id *)(a1 + 32) allRecordIDs];
  uint64_t v4 = [v2 setWithArray:v3];

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    uint64_t v6 = *(void *)(v5 + 448);
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
  uint64_t v8 = objc_msgSend(v7, "fc_setByMinusingSet:", v4);

  uint64_t v9 = (id)FCOperationLog;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    unint64_t v14 = [*(id *)(a1 + 40) shortOperationDescription];
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 48);
    if (v15) {
      uint64_t v17 = *(void *)(v15 + 384);
    }
    else {
      uint64_t v17 = 0;
    }
    uint64_t v18 = [v8 allObjects];
    uint64_t v19 = objc_msgSend(v18, "fc_subarrayWithMaxCount:", 3);
    int v20 = 138544130;
    int v21 = v14;
    __int16 v22 = 2048;
    uint64_t v23 = v16;
    __int16 v24 = 2048;
    uint64_t v25 = v17;
    __int16 v26 = 2114;
    __int16 v27 = v19;
    _os_log_error_impl(&dword_1A460D000, v9, OS_LOG_TYPE_ERROR, "%{public}@ missing too many articles, missing=%lu, max=%lu, sample=%{public}@", (uint8_t *)&v20, 0x2Au);
  }
  id v10 = objc_alloc(MEMORY[0x1E4F81BF0]);
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "fc_notCachedErrorWithMissingObjects:", v8);
  uint64_t v12 = (void *)[v10 initWithError:v11];

  return v12;
}

uint64_t __66__FCOfflineANFArticlesFetchOperation__promiseCachedArticleRecords__block_invoke_53(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void *)(v1 + 400);
  }
  else {
    uint64_t v2 = 0;
  }
  return (*(uint64_t (**)(void))(v2 + 16))();
}

FCContentArchive *__66__FCOfflineANFArticlesFetchOperation__promiseCachedArticleRecords__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[FCContentArchive archiveWithRecord:a2];
}

void __75__FCOfflineANFArticlesFetchOperation__promiseThumbnailsFromArticleRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F1C978];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __75__FCOfflineANFArticlesFetchOperation__promiseThumbnailsFromArticleRecords___block_invoke_2;
  v32[3] = &unk_1E5B501A0;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v33 = v8;
  uint64_t v34 = v9;
  id v10 = objc_msgSend(v7, "fc_array:", v32);
  uint64_t v11 = [[FCAssetsFetchOperation alloc] initWithAssetHandles:v10];
  [(FCOperation *)v11 setPurpose:@"offlineDownload"];
  [(FCFetchOperation *)v11 setShouldFailOnMissingObjects:1];
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12)
  {
    if (*(unsigned char *)(v12 + 368)) {
      uint64_t v13 = 3;
    }
    else {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  [(FCFetchOperation *)v11 setCachePolicy:v13];
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    BOOL v15 = *(unsigned __int8 *)(v14 + 368) != 0;
  }
  else {
    BOOL v15 = 0;
  }
  [(FCFetchOperation *)v11 setCanSendFetchCompletionSynchronously:v15];
  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    uint64_t v17 = *(void *)(v16 + 376);
  }
  else {
    uint64_t v17 = 0;
  }
  [(FCAssetsFetchOperation *)v11 setMaxConcurrentFetchCount:v17];
  uint64_t v18 = *(void *)(a1 + 40);
  if (v18) {
    uint64_t v19 = *(void *)(v18 + 400);
  }
  else {
    uint64_t v19 = 0;
  }
  [(FCAssetsFetchOperation *)v11 setInterestTokenHandler:v19];
  uint64_t v20 = *(void *)(a1 + 40);
  if (v20) {
    uint64_t v21 = *(void *)(v20 + 408);
  }
  else {
    uint64_t v21 = 0;
  }
  [(FCAssetsFetchOperation *)v11 setArchiveHandler:v21];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __75__FCOfflineANFArticlesFetchOperation__promiseThumbnailsFromArticleRecords___block_invoke_3;
  v31[3] = &unk_1E5B50848;
  v31[4] = *(void *)(a1 + 40);
  [(FCAssetsFetchOperation *)v11 setProgressHandler:v31];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  __int16 v26 = __75__FCOfflineANFArticlesFetchOperation__promiseThumbnailsFromArticleRecords___block_invoke_4;
  __int16 v27 = &unk_1E5B50778;
  uint64_t v28 = *(void *)(a1 + 40);
  id v29 = v6;
  id v30 = v5;
  id v22 = v5;
  id v23 = v6;
  [(FCFetchOperation *)v11 setFetchCompletionBlock:&v24];
  objc_msgSend(*(id *)(a1 + 40), "associateChildOperation:", v11, v24, v25, v26, v27, v28);
  [(FCOperation *)v11 start];
}

void __75__FCOfflineANFArticlesFetchOperation__promiseThumbnailsFromArticleRecords___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
        uint64_t v9 = *(void **)(a1 + 40);
        if (v9)
        {
          id v10 = (void *)v9[54];
          uint64_t v9 = (void *)v9[53];
        }
        else
        {
          id v10 = 0;
        }
        uint64_t v11 = v9;
        id v12 = v10;
        uint64_t v13 = [v11 assetManager];
        uint64_t v14 = FCOfflineThumbnailAssetHandlesForArticleRecord(v8, v12, v13);

        [v3 addObjectsFromArray:v14];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v15 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v5 = v15;
    }
    while (v15);
  }
}

void __75__FCOfflineANFArticlesFetchOperation__promiseThumbnailsFromArticleRecords___block_invoke_3(uint64_t a1, double a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = *(void (***)(double))(v2 + 392);
    if (v3)
    {
      uint64_t v5 = v3;
      v3[2](a2 * 0.2 + 0.05);
    }
  }
}

void __75__FCOfflineANFArticlesFetchOperation__promiseThumbnailsFromArticleRecords___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 status])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __75__FCOfflineANFArticlesFetchOperation__promiseThumbnailsFromArticleRecords___block_invoke_5;
    v7[3] = &unk_1E5B4EFB8;
    id v8 = v3;
    id v4 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = v4;
    __75__FCOfflineANFArticlesFetchOperation__promiseThumbnailsFromArticleRecords___block_invoke_5((uint64_t)v7);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = [v3 fetchedObject];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

void __75__FCOfflineANFArticlesFetchOperation__promiseThumbnailsFromArticleRecords___block_invoke_5(uint64_t a1)
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
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      _os_log_error_impl(&dword_1A460D000, v9, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch thumbnails: %{public}@", buf, 0x16u);
    }
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

void __77__FCOfflineANFArticlesFetchOperation__promiseANFDocumentsFromArticleRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __77__FCOfflineANFArticlesFetchOperation__promiseANFDocumentsFromArticleRecords___block_invoke_2;
  v26[3] = &unk_1E5B598B0;
  uint64_t v7 = *(void **)(a1 + 32);
  void v26[4] = *(void *)(a1 + 40);
  id v8 = objc_msgSend(v7, "fc_arrayByTransformingWithBlock:", v26);
  uint64_t v9 = [[FCAssetsFetchOperation alloc] initWithAssetHandles:v8];
  [(FCOperation *)v9 setPurpose:@"offlineDownload"];
  [(FCFetchOperation *)v9 setShouldFailOnMissingObjects:1];
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10)
  {
    if (*(unsigned char *)(v10 + 368)) {
      uint64_t v11 = 3;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  [(FCFetchOperation *)v9 setCachePolicy:v11];
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    BOOL v13 = *(unsigned __int8 *)(v12 + 368) != 0;
  }
  else {
    BOOL v13 = 0;
  }
  [(FCFetchOperation *)v9 setCanSendFetchCompletionSynchronously:v13];
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    uint64_t v15 = *(void *)(v14 + 376);
  }
  else {
    uint64_t v15 = 0;
  }
  [(FCAssetsFetchOperation *)v9 setMaxConcurrentFetchCount:v15];
  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    uint64_t v17 = *(void *)(v16 + 400);
  }
  else {
    uint64_t v17 = 0;
  }
  [(FCAssetsFetchOperation *)v9 setInterestTokenHandler:v17];
  uint64_t v18 = *(void *)(a1 + 40);
  if (v18) {
    uint64_t v19 = *(void *)(v18 + 408);
  }
  else {
    uint64_t v19 = 0;
  }
  [(FCAssetsFetchOperation *)v9 setArchiveHandler:v19];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __77__FCOfflineANFArticlesFetchOperation__promiseANFDocumentsFromArticleRecords___block_invoke_3;
  v25[3] = &unk_1E5B50848;
  v25[4] = *(void *)(a1 + 40);
  [(FCAssetsFetchOperation *)v9 setProgressHandler:v25];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __77__FCOfflineANFArticlesFetchOperation__promiseANFDocumentsFromArticleRecords___block_invoke_4;
  v22[3] = &unk_1E5B50778;
  v22[4] = *(void *)(a1 + 40);
  id v23 = v6;
  id v24 = v5;
  id v20 = v5;
  id v21 = v6;
  [(FCFetchOperation *)v9 setFetchCompletionBlock:v22];
  [*(id *)(a1 + 40) associateChildOperation:v9];
  [(FCOperation *)v9 start];
}

id __77__FCOfflineANFArticlesFetchOperation__promiseANFDocumentsFromArticleRecords___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 424);
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = a2;
  id v5 = [v3 assetManager];
  id v6 = [v4 generateFlintDocumentAssetHandleWithAssetManager:v5];

  return v6;
}

void __77__FCOfflineANFArticlesFetchOperation__promiseANFDocumentsFromArticleRecords___block_invoke_3(uint64_t a1, double a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void (***)(double))(v2 + 392);
    if (v3)
    {
      id v5 = v3;
      v3[2](a2 * 0.2 + 0.05);
    }
  }
}

void __77__FCOfflineANFArticlesFetchOperation__promiseANFDocumentsFromArticleRecords___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 status])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __77__FCOfflineANFArticlesFetchOperation__promiseANFDocumentsFromArticleRecords___block_invoke_5;
    v7[3] = &unk_1E5B4EFB8;
    id v8 = v3;
    id v4 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = v4;
    __77__FCOfflineANFArticlesFetchOperation__promiseANFDocumentsFromArticleRecords___block_invoke_5((uint64_t)v7);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = [v3 fetchedObject];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

void __77__FCOfflineANFArticlesFetchOperation__promiseANFDocumentsFromArticleRecords___block_invoke_5(uint64_t a1)
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
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      _os_log_error_impl(&dword_1A460D000, v9, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch ANF documents: %{public}@", buf, 0x16u);
    }
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

void __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_2;
  v32[3] = &unk_1E5B59928;
  id v33 = a1[4];
  id v8 = a1[5];
  id v9 = a1[6];
  id v34 = v8;
  id v35 = v9;
  id v10 = objc_msgSend(v7, "fc_set:", v32);
  uint64_t v11 = [FCResourcesFetchOperation alloc];
  id v12 = a1[6];
  if (v12) {
    id v12 = (void *)v12[53];
  }
  BOOL v13 = v12;
  uint64_t v14 = [v10 allObjects];
  __int16 v15 = [(FCResourcesFetchOperation *)v11 initWithContext:v13 resourceIDs:v14 downloadAssets:1];

  [(FCOperation *)v15 setPurpose:@"offlineDownload"];
  uint64_t v16 = a1[6];
  if (v16) {
    uint64_t v17 = v16[47];
  }
  else {
    uint64_t v17 = 0;
  }
  [(FCResourcesFetchOperation *)v15 setMaxConcurrentFetchCount:v17];
  [(FCFetchOperation *)v15 setShouldFailOnMissingObjects:1];
  uint64_t v18 = a1[6];
  if (v18)
  {
    if (v18[368]) {
      uint64_t v19 = 3;
    }
    else {
      uint64_t v19 = 0;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
  [(FCFetchOperation *)v15 setCachePolicy:v19];
  id v20 = (unsigned __int8 *)a1[6];
  if (v20) {
    BOOL v21 = v20[368] != 0;
  }
  else {
    BOOL v21 = 0;
  }
  [(FCFetchOperation *)v15 setCanSendFetchCompletionSynchronously:v21];
  uint64_t v22 = a1[6];
  if (v22) {
    uint64_t v23 = v22[50];
  }
  else {
    uint64_t v23 = 0;
  }
  [(FCResourcesFetchOperation *)v15 setInterestTokenHandler:v23];
  id v24 = a1[6];
  if (v24) {
    uint64_t v25 = v24[51];
  }
  else {
    uint64_t v25 = 0;
  }
  [(FCResourcesFetchOperation *)v15 setArchiveHandler:v25];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_69;
  v31[3] = &unk_1E5B50848;
  v31[4] = a1[6];
  [(FCResourcesFetchOperation *)v15 setProgressHandler:v31];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_2_70;
  v28[3] = &unk_1E5B50778;
  v28[4] = a1[6];
  id v29 = v6;
  id v30 = v5;
  id v26 = v5;
  id v27 = v6;
  [(FCFetchOperation *)v15 setFetchCompletionBlock:v28];
  [a1[6] associateChildOperation:v15];
  [(FCOperation *)v15 start];
}

void __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v40 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = [*(id *)(*((void *)&v39 + 1) + 8 * i) flintFontResourceIDs];
        objc_msgSend(v3, "fc_safelyAddObjects:", v8);
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v5);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v43 count:16];
  uint64_t v12 = v10;
  if (v10)
  {
    uint64_t v13 = *(void *)v36;
    uint64_t v25 = v28;
    id v26 = v33;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v9);
        }
        __int16 v15 = *(void **)(*((void *)&v35 + 1) + 8 * v14);
        uint64_t v16 = (void *)MEMORY[0x1A6260FD0](v10, v11);
        uint64_t v17 = objc_msgSend(v15, "dataProvider", v25, v26);
        uint64_t v18 = [v17 data];

        if (v18)
        {
          uint64_t v19 = *(void **)(a1 + 48);
          if (v19) {
            uint64_t v19 = (void *)v19[55];
          }
          id v20 = v19;
          BOOL v21 = [v20 manifestFromANFDocumentData:v18];

          if (v21)
          {
            uint64_t v22 = [v21 nonImageResourceIDs];
            objc_msgSend(v3, "fc_safelyAddObjects:", v22);

            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v33[0] = __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_3;
            v33[1] = &unk_1E5B518C8;
            v33[2] = *(void *)(a1 + 48);
            id v34 = v21;
            uint64_t v23 = __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_3((uint64_t)v32);
            v31[0] = 0;
            v31[1] = v31;
            v31[2] = 0x2020000000;
            v31[3] = 0;
            v27[0] = MEMORY[0x1E4F143A8];
            v27[1] = 3221225472;
            v28[0] = __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_64;
            v28[1] = &unk_1E5B59900;
            uint64_t v24 = *(void *)(a1 + 48);
            id v30 = v31;
            v28[2] = v24;
            id v29 = v3;
            [v23 enumerateObjectsUsingBlock:v27];

            _Block_object_dispose(v31, 8);
          }
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v43 count:16];
      uint64_t v12 = v10;
    }
    while (v10);
  }
}

id __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 432);
  }
  else {
    id v3 = 0;
  }
  if ([v3 useSmallestArticleImages])
  {
    id v4 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = v4;
      uint64_t v7 = [v5 shortOperationDescription];
      int v10 = 138543362;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ will download the smallest variant of each article image", (uint8_t *)&v10, 0xCu);
    }
    id v8 = [*(id *)(a1 + 40) smallestImageResourceIDs];
  }
  else
  {
    id v8 = [*(id *)(a1 + 40) optimalImageResourceIDs];
  }
  return v8;
}

void __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_64(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    id v9 = *(void **)(v8 + 432);
  }
  else {
    id v9 = 0;
  }
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v7 >= [v9 maxImagesPerArticle])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_2_65;
    v11[3] = &unk_1E5B598D8;
    uint64_t v10 = *(void *)(a1 + 48);
    v11[4] = *(void *)(a1 + 32);
    void v11[5] = v10;
    v11[6] = a4;
    __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_2_65((uint64_t)v11);
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v6];
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

void __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_2_65(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    uint64_t v5 = [v3 shortOperationDescription];
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ will limit the number of article images to %lld", (uint8_t *)&v7, 0x16u);
  }
  **(unsigned char **)(a1 + 48) = 1;
}

void __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_69(uint64_t a1, double a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = *(void (***)(double))(v2 + 392);
    if (v3)
    {
      uint64_t v5 = v3;
      v3[2](a2 * 0.75 + 0.25);
    }
  }
}

void __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_2_70(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 status])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_3_71;
    v7[3] = &unk_1E5B4EFB8;
    id v8 = v3;
    id v4 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = v4;
    __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_3_71((uint64_t)v7);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = [v3 fetchedObject];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

void __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_3_71(uint64_t a1)
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
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      _os_log_error_impl(&dword_1A460D000, v9, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch ANF resources: %{public}@", buf, 0x16u);
    }
    uint64_t v6 = *(void *)(a1 + 48);
    int v7 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

uint64_t __57__FCOfflineANFArticlesFetchOperation__desiredArticleKeys__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:@"articleRecirculationConfiguration"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputHeadlines, 0);
  objc_storeStrong((id *)&self->_articleIDs, 0);
  objc_storeStrong((id *)&self->_ANFHelper, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong(&self->_archiveHandler, 0);
  objc_storeStrong(&self->_interestTokenHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

@end