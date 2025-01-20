@interface NTTodayItemOperation
- (BOOL)validateOperation;
- (FCContentContext)contentContext;
- (FCFeedPersonalizing)feedPersonalizer;
- (FCNewsAppConfiguration)appConfiguration;
- (FCTodayPrivateData)todayData;
- (NSArray)feedItems;
- (NSDictionary)catchUpOperationResultsBySectionDescriptor;
- (NSDictionary)resultAssetFileURLsByRemoteURL;
- (NSDictionary)resultTodayItemsBySectionDescriptor;
- (NSObject)resultAssetsHoldToken;
- (NSObject)resultRecordsHoldToken;
- (NTCatchUpOperationForYouFetchInfo)forYouFetchInfo;
- (NTTodayItemOperation)init;
- (NTTodayResultOperationInfoProviding)operationInfo;
- (id)_extractFeedItemsFromInputs;
- (id)todayItemCompletion;
- (void)_fetchProtoitemsWithCompletion:(id)a3;
- (void)_saveWithCompletion:(id)a3;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setAppConfiguration:(id)a3;
- (void)setCatchUpOperationResultsBySectionDescriptor:(id)a3;
- (void)setContentContext:(id)a3;
- (void)setFeedItems:(id)a3;
- (void)setFeedPersonalizer:(id)a3;
- (void)setForYouFetchInfo:(id)a3;
- (void)setOperationInfo:(id)a3;
- (void)setResultAssetFileURLsByRemoteURL:(id)a3;
- (void)setResultAssetsHoldToken:(id)a3;
- (void)setResultRecordsHoldToken:(id)a3;
- (void)setResultTodayItemsBySectionDescriptor:(id)a3;
- (void)setTodayData:(id)a3;
- (void)setTodayItemCompletion:(id)a3;
- (void)validateOperation;
@end

@implementation NTTodayItemOperation

- (NTTodayItemOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTTodayItemOperation;
  return [(FCOperation *)&v3 init];
}

- (BOOL)validateOperation
{
  objc_super v3 = [(NTTodayItemOperation *)self catchUpOperationResultsBySectionDescriptor];

  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayItemOperation validateOperation].cold.7();
  }
  v4 = [(NTTodayItemOperation *)self appConfiguration];

  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayItemOperation validateOperation].cold.6();
  }
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  char v6 = !v5;
  v7 = [(NTTodayItemOperation *)self contentContext];

  if (!v7 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayItemOperation validateOperation].cold.5();
  }
  if (!v7) {
    char v6 = 0;
  }
  v8 = [(NTTodayItemOperation *)self feedPersonalizer];

  if (!v8 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayItemOperation validateOperation].cold.4();
  }
  if (!v8) {
    char v6 = 0;
  }
  v9 = [(NTTodayItemOperation *)self operationInfo];

  if (!v9 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayItemOperation validateOperation]();
  }
  if (v9) {
    char v10 = v6;
  }
  else {
    char v10 = 0;
  }
  v11 = [(NTTodayItemOperation *)self _extractFeedItemsFromInputs];
  [(NTTodayItemOperation *)self setFeedItems:v11];
  if ([v11 count])
  {
    v12 = [(NTTodayItemOperation *)self forYouFetchInfo];

    if (!v12 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[NTTodayItemOperation validateOperation]();
    }
    if (!v12) {
      char v10 = 0;
    }
  }
  v13 = [(NTTodayItemOperation *)self todayItemCompletion];

  if (!v13 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayItemOperation validateOperation]();
  }
  if (v13) {
    BOOL v14 = v10;
  }
  else {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)performOperation
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __40__NTTodayItemOperation_performOperation__block_invoke;
  v2[3] = &unk_26475C110;
  v2[4] = self;
  [(NTTodayItemOperation *)self _fetchProtoitemsWithCompletion:v2];
}

void __40__NTTodayItemOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    [*(id *)(a1 + 32) finishedPerformingOperationWithError:a4];
  }
  else
  {
    v9 = dispatch_group_create();
    char v10 = [*(id *)(a1 + 32) operationInfo];
    v11 = [*(id *)(a1 + 32) contentContext];
    v12 = (void *)MEMORY[0x263EFF8C0];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __40__NTTodayItemOperation_performOperation__block_invoke_2;
    v29[3] = &unk_26475C020;
    id v13 = v7;
    id v30 = v13;
    id v14 = v10;
    id v31 = v14;
    v15 = objc_msgSend(v12, "fc_array:", v29);
    v16 = NTSharedLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v15;
      _os_log_impl(&dword_22592C000, v16, OS_LOG_TYPE_INFO, "Start downloading assetHandles: %@", buf, 0xCu);
    }

    [v15 makeObjectsPerformSelector:sel_downloadIfNeededWithGroup_ withObject:v9];
    [*(id *)(a1 + 32) qualityOfService];
    v17 = FCDispatchQueueForQualityOfService();
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __40__NTTodayItemOperation_performOperation__block_invoke_28;
    v22[3] = &unk_26475C0E8;
    uint64_t v18 = *(void *)(a1 + 32);
    id v23 = v15;
    uint64_t v24 = v18;
    id v25 = v13;
    id v26 = v11;
    id v27 = v14;
    id v28 = v8;
    id v19 = v14;
    id v20 = v11;
    id v21 = v15;
    dispatch_group_notify(v9, v17, v22);
  }
}

void __40__NTTodayItemOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__NTTodayItemOperation_performOperation__block_invoke_3;
  v6[3] = &unk_26475C048;
  v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void __40__NTTodayItemOperation_performOperation__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) assetHandlesWithOperationInfo:*(void *)(a1 + 32)];
        [*(id *)(a1 + 40) addObjectsFromArray:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

void __40__NTTodayItemOperation_performOperation__block_invoke_28(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = NTSharedLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v3;
    _os_log_impl(&dword_22592C000, v2, OS_LOG_TYPE_INFO, "Finished downloading assetHandles: %@", buf, 0xCu);
  }

  id v4 = objc_opt_new();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __40__NTTodayItemOperation_performOperation__block_invoke_30;
  v12[3] = &unk_26475C098;
  uint64_t v5 = *(void **)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 40);
  id v14 = v6;
  uint64_t v15 = v7;
  id v16 = v4;
  id v8 = v4;
  v9 = objc_msgSend(v5, "fc_dictionaryByTransformingValuesWithKeyAndValueBlock:", v12);
  [*(id *)(a1 + 40) setResultTodayItemsBySectionDescriptor:v9];

  [*(id *)(a1 + 40) setResultAssetFileURLsByRemoteURL:v8];
  [*(id *)(a1 + 40) setResultRecordsHoldToken:*(void *)(a1 + 72)];
  [*(id *)(a1 + 40) setResultAssetsHoldToken:*(void *)(a1 + 32)];
  long long v10 = *(void **)(a1 + 40);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__NTTodayItemOperation_performOperation__block_invoke_3_34;
  v11[3] = &unk_26475C0C0;
  v11[4] = v10;
  [v10 _saveWithCompletion:v11];
}

id __40__NTTodayItemOperation_performOperation__block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__NTTodayItemOperation_performOperation__block_invoke_2_31;
  v10[3] = &unk_26475C070;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v13 = v5;
  id v6 = *(void **)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 48);
  id v15 = v6;
  id v7 = v5;
  id v8 = objc_msgSend(a3, "fc_orderedSetByTransformingWithBlock:", v10);

  return v8;
}

id __40__NTTodayItemOperation_performOperation__block_invoke_2_31(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v6 = (void *)a1[7];
  id v7 = a2;
  id v8 = [v6 todayData];
  v9 = [v7 itemWithContentContext:v3 operationInfo:v4 sectionDescriptor:v5 todayData:v8 assetFileURLsByRemoteURL:a1[8]];

  return v9;
}

uint64_t __40__NTTodayItemOperation_performOperation__block_invoke_3_34(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  v9 = [(NTTodayItemOperation *)self todayItemCompletion];
  uint64_t v5 = [(NTTodayItemOperation *)self resultTodayItemsBySectionDescriptor];
  id v6 = [(NTTodayItemOperation *)self resultAssetFileURLsByRemoteURL];
  id v7 = [(NTTodayItemOperation *)self resultRecordsHoldToken];
  id v8 = [(NTTodayItemOperation *)self resultAssetsHoldToken];
  v9[2](v9, v5, v6, v7, v8, v4);
}

- (void)_saveWithCompletion:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayItemOperation _saveWithCompletion:]();
  }
  uint64_t v5 = dispatch_group_create();
  uint64_t v14 = MEMORY[0x263EF8330];
  FCDispatchGroupWrap();
  id v6 = [(NTTodayItemOperation *)self contentContext];
  id v7 = [v6 feedDatabase];

  if (v7)
  {
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    id v11 = __44__NTTodayItemOperation__saveWithCompletion___block_invoke_2;
    id v12 = &unk_26475C138;
    id v13 = self;
    FCDispatchGroupWrap();
  }
  [(NTTodayItemOperation *)self qualityOfService];
  id v8 = FCDispatchQueueForQualityOfService();
  dispatch_group_notify(v5, v8, v4);
}

void __44__NTTodayItemOperation__saveWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 contentContext];
  id v4 = [v5 assetManager];
  [v4 saveWithCompletionHandler:v3];
}

void __44__NTTodayItemOperation__saveWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 contentContext];
  id v4 = [v5 feedDatabase];
  [v4 saveWithCompletionHandler:v3];
}

- (id)_extractFeedItemsFromInputs
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__NTTodayItemOperation__extractFeedItemsFromInputs__block_invoke;
  v4[3] = &unk_26475C1B0;
  v4[4] = self;
  v2 = objc_msgSend(MEMORY[0x263EFF8C0], "fc_array:", v4);

  return v2;
}

void __51__NTTodayItemOperation__extractFeedItemsFromInputs__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) catchUpOperationResultsBySectionDescriptor];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__NTTodayItemOperation__extractFeedItemsFromInputs__block_invoke_2;
  v6[3] = &unk_26475C188;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void __51__NTTodayItemOperation__extractFeedItemsFromInputs__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 items];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__NTTodayItemOperation__extractFeedItemsFromInputs__block_invoke_3;
  v5[3] = &unk_26475C160;
  id v6 = *(id *)(a1 + 32);
  [v4 enumerateObjectsUsingBlock:v5];
}

void __51__NTTodayItemOperation__extractFeedItemsFromInputs__block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 needsFeedItemHeadlinesFetch])
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v5 feedItemForHeadlineFetch];
    [v3 addObject:v4];
  }
}

- (void)_fetchProtoitemsWithCompletion:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayItemOperation _fetchProtoitemsWithCompletion:]();
  }
  id v5 = [(NTTodayItemOperation *)self forYouFetchInfo];
  id v6 = [(NTTodayItemOperation *)self feedItems];
  id v7 = objc_opt_new();
  id v8 = [(NTTodayItemOperation *)self appConfiguration];
  [v7 setConfiguration:v8];

  uint64_t v9 = [(NTTodayItemOperation *)self contentContext];
  [v7 setContext:v9];

  uint64_t v10 = [(NTTodayItemOperation *)self feedPersonalizer];
  [v7 setPersonalizer:v10];

  [v7 setFeedItems:v6];
  id v11 = [v5 feedContextByFeedID];
  [v7 setFeedContextByFeedID:v11];

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __55__NTTodayItemOperation__fetchProtoitemsWithCompletion___block_invoke;
  v22[3] = &unk_26475C1D8;
  id v23 = v5;
  id v12 = v5;
  [v7 setRapidUpdateRefreshTest:v22];
  [v7 setShouldFilterHeadlinesWithoutSourceChannels:1];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __55__NTTodayItemOperation__fetchProtoitemsWithCompletion___block_invoke_2;
  uint64_t v18 = &unk_26475C298;
  id v19 = v6;
  id v20 = self;
  id v21 = v4;
  id v13 = v4;
  id v14 = v6;
  [v7 setHeadlinesMapCompletionHandler:&v15];
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v7, v15, v16, v17, v18);
  [v7 start];
}

uint64_t __55__NTTodayItemOperation__fetchProtoitemsWithCompletion___block_invoke(uint64_t a1, double a2)
{
  if (a2 >= 30.0) {
    return objc_msgSend(*(id *)(a1 + 32), "attemptedCachedOnly", v2, v3) ^ 1;
  }
  else {
    return 0;
  }
}

void __55__NTTodayItemOperation__fetchProtoitemsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v23[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [v5 count];
  if (v7 < [*(id *)(a1 + 32) count])
  {
    id v8 = *(void **)(a1 + 32);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __55__NTTodayItemOperation__fetchProtoitemsWithCompletion___block_invoke_3;
    v20[3] = &unk_26475C200;
    uint64_t v9 = &v21;
    id v21 = v5;
    uint64_t v10 = objc_msgSend(v8, "fc_arrayOfObjectsPassingTest:", v20);
    id v11 = objc_msgSend(v10, "fc_arrayByTransformingWithBlock:", &__block_literal_global);
    uint64_t v22 = *MEMORY[0x263F592C0];
    v23[0] = v11;
    id v12 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    uint64_t v13 = objc_msgSend(MEMORY[0x263F087E8], "fc_partialFailureErrorWithUserInfo:", v12);

    id v14 = 0;
    id v6 = (id)v13;
LABEL_6:

    goto LABEL_7;
  }
  if (!v6)
  {
    uint64_t v15 = [*(id *)(a1 + 40) catchUpOperationResultsBySectionDescriptor];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __55__NTTodayItemOperation__fetchProtoitemsWithCompletion___block_invoke_5;
    v18[3] = &unk_26475C270;
    uint64_t v9 = (id *)v19;
    id v16 = v5;
    uint64_t v17 = *(void *)(a1 + 40);
    v19[0] = v16;
    v19[1] = v17;
    id v14 = objc_msgSend(v15, "fc_dictionaryByTransformingValuesWithKeyAndValueBlock:", v18);

    id v6 = 0;
    goto LABEL_6;
  }
  id v14 = 0;
LABEL_7:
  (*(void (**)(void, void *, id, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v14, v5, v6);
}

BOOL __55__NTTodayItemOperation__fetchProtoitemsWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:a2];
  BOOL v3 = v2 == 0;

  return v3;
}

uint64_t __55__NTTodayItemOperation__fetchProtoitemsWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 articleID];
}

id __55__NTTodayItemOperation__fetchProtoitemsWithCompletion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 items];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__NTTodayItemOperation__fetchProtoitemsWithCompletion___block_invoke_6;
  v9[3] = &unk_26475C248;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  unint64_t v7 = objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", v9);

  return v7;
}

id __55__NTTodayItemOperation__fetchProtoitemsWithCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 feedItemForHeadlineFetch];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) objectForKey:v4];
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = [*(id *)(a1 + 40) appConfiguration];
  unint64_t v7 = [v3 protoitemWithFetchedFeedItemHeadline:v5 configuration:v6];

  return v7;
}

- (NSDictionary)catchUpOperationResultsBySectionDescriptor
{
  return self->_catchUpOperationResultsBySectionDescriptor;
}

- (void)setCatchUpOperationResultsBySectionDescriptor:(id)a3
{
}

- (FCNewsAppConfiguration)appConfiguration
{
  return self->_appConfiguration;
}

- (void)setAppConfiguration:(id)a3
{
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void)setContentContext:(id)a3
{
}

- (FCFeedPersonalizing)feedPersonalizer
{
  return self->_feedPersonalizer;
}

- (void)setFeedPersonalizer:(id)a3
{
}

- (FCTodayPrivateData)todayData
{
  return self->_todayData;
}

- (void)setTodayData:(id)a3
{
}

- (NTTodayResultOperationInfoProviding)operationInfo
{
  return self->_operationInfo;
}

- (void)setOperationInfo:(id)a3
{
}

- (NTCatchUpOperationForYouFetchInfo)forYouFetchInfo
{
  return self->_forYouFetchInfo;
}

- (void)setForYouFetchInfo:(id)a3
{
}

- (id)todayItemCompletion
{
  return self->_todayItemCompletion;
}

- (void)setTodayItemCompletion:(id)a3
{
}

- (NSArray)feedItems
{
  return self->_feedItems;
}

- (void)setFeedItems:(id)a3
{
}

- (NSDictionary)resultTodayItemsBySectionDescriptor
{
  return self->_resultTodayItemsBySectionDescriptor;
}

- (void)setResultTodayItemsBySectionDescriptor:(id)a3
{
}

- (NSDictionary)resultAssetFileURLsByRemoteURL
{
  return self->_resultAssetFileURLsByRemoteURL;
}

- (void)setResultAssetFileURLsByRemoteURL:(id)a3
{
}

- (NSObject)resultRecordsHoldToken
{
  return self->_resultRecordsHoldToken;
}

- (void)setResultRecordsHoldToken:(id)a3
{
}

- (NSObject)resultAssetsHoldToken
{
  return self->_resultAssetsHoldToken;
}

- (void)setResultAssetsHoldToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultAssetsHoldToken, 0);
  objc_storeStrong((id *)&self->_resultRecordsHoldToken, 0);
  objc_storeStrong((id *)&self->_resultAssetFileURLsByRemoteURL, 0);
  objc_storeStrong((id *)&self->_resultTodayItemsBySectionDescriptor, 0);
  objc_storeStrong((id *)&self->_feedItems, 0);
  objc_storeStrong(&self->_todayItemCompletion, 0);
  objc_storeStrong((id *)&self->_forYouFetchInfo, 0);
  objc_storeStrong((id *)&self->_operationInfo, 0);
  objc_storeStrong((id *)&self->_todayData, 0);
  objc_storeStrong((id *)&self->_feedPersonalizer, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_appConfiguration, 0);

  objc_storeStrong((id *)&self->_catchUpOperationResultsBySectionDescriptor, 0);
}

- (void)validateOperation
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"today item operation requires catch up operation results"];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_saveWithCompletion:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completion");
  *(_DWORD *)buf = 136315906;
  uint64_t v2 = "-[NTTodayItemOperation _saveWithCompletion:]";
  __int16 v3 = 2080;
  uint64_t v4 = "NTTodayItemOperation.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

- (void)_fetchProtoitemsWithCompletion:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completion");
  *(_DWORD *)buf = 136315906;
  uint64_t v2 = "-[NTTodayItemOperation _fetchProtoitemsWithCompletion:]";
  __int16 v3 = 2080;
  uint64_t v4 = "NTTodayItemOperation.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

@end