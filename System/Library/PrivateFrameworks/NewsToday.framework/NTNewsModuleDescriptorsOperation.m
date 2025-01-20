@interface NTNewsModuleDescriptorsOperation
- (BOOL)validateOperation;
- (NFCopying)prefetchedContent;
- (NSArray)resultTodayModuleDescriptors;
- (void)_continueOperationWithTodayData:(id)a3;
- (void)_donateTodayConfigDataToNewsd:(id)a3;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setPrefetchedContent:(id)a3;
- (void)setResultTodayModuleDescriptors:(id)a3;
- (void)validateOperation;
@end

@implementation NTNewsModuleDescriptorsOperation

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  v7 = [(NTTodayModuleDescriptorsOperation *)self descriptorsCompletion];
  v5 = [(NTNewsModuleDescriptorsOperation *)self resultTodayModuleDescriptors];
  v6 = [(NTNewsModuleDescriptorsOperation *)self prefetchedContent];
  v7[2](v7, v5, v6, v4);
}

void __52__NTNewsModuleDescriptorsOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)*MEMORY[0x263F592D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F592D0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    v7 = [v5 shortOperationDescription];
    int v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_22592C000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ did fetch private data", (uint8_t *)&v8, 0xCu);
  }
  [*(id *)(a1 + 32) _continueOperationWithTodayData:v3];
}

- (NSArray)resultTodayModuleDescriptors
{
  return self->_resultTodayModuleDescriptors;
}

- (void)performOperation
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = (void *)*MEMORY[0x263F592D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F592D0], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    v5 = [(FCOperation *)self shortOperationDescription];
    *(_DWORD *)buf = 138543362;
    v9 = v5;
    _os_log_impl(&dword_22592C000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ will fetch private data", buf, 0xCu);
  }
  v6 = [(NTTodayModuleDescriptorsOperation *)self privateDataStorage];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__NTNewsModuleDescriptorsOperation_performOperation__block_invoke;
  v7[3] = &unk_26475D4D8;
  v7[4] = self;
  [v6 readPrivateDataSyncWithAccessor:v7];
}

- (BOOL)validateOperation
{
  id v3 = [(NTTodayModuleDescriptorsOperation *)self contentContext];

  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsModuleDescriptorsOperation validateOperation]();
  }
  id v4 = [(NTTodayModuleDescriptorsOperation *)self privateDataStorage];

  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsModuleDescriptorsOperation validateOperation]();
  }
  v5 = [(NTTodayModuleDescriptorsOperation *)self descriptorsCompletion];

  if (!v5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsModuleDescriptorsOperation validateOperation]();
  }
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  return !v6 && v5 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchedContent, 0);

  objc_storeStrong((id *)&self->_resultTodayModuleDescriptors, 0);
}

- (NFCopying)prefetchedContent
{
  return self->_prefetchedContent;
}

- (void)_continueOperationWithTodayData:(id)a3
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v48 = a3;
  id v4 = [(NTTodayModuleDescriptorsOperation *)self contentRequest];
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x3032000000;
  v78[3] = __Block_byref_object_copy__1;
  v78[4] = __Block_byref_object_dispose__1;
  id v79 = 0;
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x3032000000;
  v76[3] = __Block_byref_object_copy__1;
  v76[4] = __Block_byref_object_dispose__1;
  id v77 = 0;
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x3032000000;
  v74[3] = __Block_byref_object_copy__1;
  v74[4] = __Block_byref_object_dispose__1;
  id v75 = 0;
  v5 = [(NTTodayModuleDescriptorsOperation *)self contentContext];
  BOOL v6 = [v5 appConfigurationManager];
  v7 = [v6 possiblyUnfetchedAppConfiguration];
  int v8 = [v7 userSegmentationInWidgetAllowed];

  v9 = NewsCoreUserDefaults();
  int v10 = [v9 BOOLForKey:*MEMORY[0x263F59338]];

  LODWORD(v9) = v10 & v8;
  v11 = dispatch_group_create();
  if v9 && (objc_opt_respondsToSelector())
  {
    dispatch_group_enter(v11);
    v12 = [MEMORY[0x263EFF9A0] dictionary];
    v13 = [v48 bundleSubscription];
    int v14 = [v13 isSubscribed];
    v15 = @"free";
    if (v14) {
      v15 = @"premium";
    }
    v47 = v15;

    [v12 setObject:v47 forKeyedSubscript:@"configType"];
    v16 = [v6 possiblyUnfetchedAppConfiguration];
    int v17 = [v16 articleEmbeddingsEnabled];

    if (v17) {
      [v12 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"articleEmbeddingsEnabled"];
    }
    v18 = [v6 possiblyUnfetchedAppConfiguration];
    int v19 = [v18 widgetFetchOfTodayFeedLiteConfigEnabled];

    if (v19 && ![v4 moduleDescriptorType])
    {
      v42 = [v48 bundleSubscription];
      BOOL v43 = (unint64_t)[v42 unprotectedSubscriptionState] < 2;

      uint64_t v20 = v43;
    }
    else
    {
      uint64_t v20 = 0;
    }
    v21 = (id)*MEMORY[0x263F592D0];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v46 = v20;
      v45 = [(FCOperation *)self shortOperationDescription];
      v22 = @" not";
      if (v20) {
        v22 = &stru_26D9160F8;
      }
      v44 = v22;
      v23 = @"NO";
      if (v19) {
        v23 = @"YES";
      }
      v24 = v23;
      int v25 = [v4 moduleDescriptorType];
      v26 = [v48 bundleSubscription];
      v27 = (void *)[v26 unprotectedSubscriptionState];
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v45;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v44;
      *(_WORD *)&buf[22] = 2114;
      v82 = (uint64_t (*)(uint64_t, uint64_t))v24;
      LOWORD(v83) = 1024;
      *(_DWORD *)((char *)&v83 + 2) = v25;
      HIWORD(v83) = 2048;
      id v84 = v27;
      _os_log_impl(&dword_22592C000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ will%{public}@ fetch todayLiteConfig, enabledInConfig=%{public}@, descriptorType=%d, subscriptionState=%lu", buf, 0x30u);

      uint64_t v20 = v46;
    }

    v68[0] = MEMORY[0x263EF8330];
    v68[1] = 3221225472;
    v68[2] = __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke;
    v68[3] = &unk_26475D528;
    v68[4] = self;
    v71 = v74;
    v72 = v78;
    v73 = v76;
    v69 = v11;
    id v70 = v6;
    [v70 fetchAppWidgetConfigurationWithTodayLiteConfig:v20 additionalFields:v12 completion:v68];
  }
  else
  {
    dispatch_group_enter(v11);
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_2;
    v64[3] = &unk_26475D500;
    v66 = v74;
    v67 = v78;
    v65 = v11;
    v28 = (void *)MEMORY[0x22A638590](v64);
    if ([(NTTodayModuleDescriptorsOperation *)self requireRefreshedAppConfig])
    {
      [(NTNewsModuleDescriptorsOperation *)self qualityOfService];
      v29 = FCDispatchQueueForQualityOfService();
      [v6 refreshAppConfigurationIfNeededWithCompletionQueue:v29 refreshCompletion:v28];
    }
    else
    {
      [v6 fetchAppConfigurationIfNeededWithCompletion:v28];
    }

    v12 = v65;
  }

  v30 = [v4 tagID];
  if (v30)
  {
    v31 = [v4 tagID];
    v80 = v31;
    v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v80 count:1];
  }
  else
  {
    v32 = (void *)MEMORY[0x263EFFA68];
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v82 = __Block_byref_object_copy__1;
  v83 = __Block_byref_object_dispose__1;
  id v84 = 0;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = __Block_byref_object_copy__1;
  v62[4] = __Block_byref_object_dispose__1;
  id v63 = 0;
  v33 = [(NTTodayModuleDescriptorsOperation *)self contentContext];
  v34 = [v33 tagController];

  dispatch_group_enter(v11);
  uint64_t v35 = [(NTNewsModuleDescriptorsOperation *)self qualityOfService];
  [(NTNewsModuleDescriptorsOperation *)self qualityOfService];
  v36 = FCDispatchQueueForQualityOfService();
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_3;
  v58[3] = &unk_26475D550;
  v60 = buf;
  v61 = v62;
  v37 = v11;
  v59 = v37;
  [v34 fetchTagsForTagIDs:v32 qualityOfService:v35 callbackQueue:v36 completionHandler:v58];

  [(NTNewsModuleDescriptorsOperation *)self qualityOfService];
  v38 = FCDispatchQueueForQualityOfService();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_4;
  block[3] = &unk_26475D640;
  block[4] = self;
  id v50 = v48;
  id v51 = v5;
  id v52 = v4;
  v53 = v74;
  v54 = buf;
  v55 = v62;
  v56 = v78;
  v57 = v76;
  id v39 = v4;
  id v40 = v5;
  id v41 = v48;
  dispatch_group_notify(v37, v38, block);

  _Block_object_dispose(v62, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v74, 8);
  _Block_object_dispose(v76, 8);

  _Block_object_dispose(v78, 8);
}

void __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)*MEMORY[0x263F592D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F592D0], OS_LOG_TYPE_DEFAULT))
  {
    int v14 = *(void **)(a1 + 32);
    v15 = v13;
    v16 = [v14 shortOperationDescription];
    *(_DWORD *)buf = 138543618;
    v28 = v16;
    __int16 v29 = 2048;
    uint64_t v30 = [v11 length];
    _os_log_impl(&dword_22592C000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ fetched todayLiteConfig of length %lu", buf, 0x16u);
  }
  [*(id *)(a1 + 32) _donateTodayConfigDataToNewsd:v11];
  uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
  v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v12;
  id v19 = v12;

  if (v19)
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_75;
    v24[3] = &unk_26475D500;
    long long v26 = *(_OWORD *)(a1 + 56);
    uint64_t v20 = *(void **)(a1 + 48);
    id v25 = *(id *)(a1 + 40);
    [v20 fetchAppConfigurationIfNeededWithCompletion:v24];
  }
  else
  {
    uint64_t v21 = [v9 copy];
    uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
    v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_75(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (!v5)
  {
    uint64_t v6 = [v9 copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    int v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (!v5)
  {
    uint64_t v6 = [v9 copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    int v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_3(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 copy];
  uint64_t v7 = *(void *)(a1[5] + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = [v5 copy];
  uint64_t v10 = *(void *)(a1[6] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  id v12 = a1[4];

  dispatch_group_leave(v12);
}

void __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_4(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "finishedPerformingOperationWithError:");
  }
  else
  {
    id v3 = [MEMORY[0x263EFF9A0] dictionary];
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    id v5 = [MEMORY[0x263EFF980] array];
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x3032000000;
    v52[3] = __Block_byref_object_copy__1;
    v52[4] = __Block_byref_object_dispose__1;
    id v53 = 0;
    uint64_t v6 = NTSharedLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [*(id *)(a1 + 40) purchasedTagIDs];
      uint64_t v10 = [*(id *)(a1 + 40) bundleSubscription];
      *(_DWORD *)buf = 138543874;
      id v55 = v8;
      __int16 v56 = 2114;
      v57 = v9;
      __int16 v58 = 2114;
      v59 = v10;
      _os_log_impl(&dword_22592C000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ created access checker with %{public}@ and %{public}@", buf, 0x20u);
    }
    id v11 = objc_alloc(MEMORY[0x263F595A8]);
    uint64_t v12 = *(void *)(a1 + 40);
    v13 = [*(id *)(a1 + 48) configurationManager];
    int v14 = (void *)[v11 initWithPurchaseProvider:v12 bundleSubscriptionProvider:v12 configurationManager:v13];

    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_82;
    v47[3] = &unk_26475D578;
    v47[4] = *(void *)(a1 + 32);
    id v15 = v14;
    id v48 = v15;
    id v16 = v5;
    id v49 = v16;
    id v17 = v3;
    id v50 = v17;
    id v18 = v4;
    id v51 = v18;
    id v19 = (void *)MEMORY[0x22A638590](v47);
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_86;
    v40[3] = &unk_26475D5F0;
    v40[4] = *(void *)(a1 + 32);
    id v41 = *(id *)(a1 + 56);
    long long v45 = *(_OWORD *)(a1 + 72);
    id v20 = v18;
    id v42 = v20;
    id v21 = v17;
    id v43 = v21;
    id v22 = v16;
    id v44 = v22;
    unsigned int v46 = v52;
    v23 = (void *)MEMORY[0x22A638590](v40);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_3_91;
    v31[3] = &unk_26475D618;
    uint64_t v38 = *(void *)(a1 + 88);
    id v32 = *(id *)(a1 + 40);
    id v24 = v21;
    id v39 = v52;
    uint64_t v25 = *(void *)(a1 + 32);
    id v33 = v24;
    uint64_t v34 = v25;
    id v26 = v22;
    id v35 = v26;
    id v27 = v20;
    id v36 = v27;
    id v37 = *(id *)(a1 + 56);
    v28 = (void *)MEMORY[0x22A638590](v31);
    if (*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40))
    {
      __int16 v29 = objc_opt_new();
      [v29 setPurpose:*MEMORY[0x263F592F8]];
      [v29 setConfiguration:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
      [v29 setWidgetConfiguration:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
      [v29 setContext:*(void *)(a1 + 48)];
    }
    else
    {
      __int16 v29 = objc_opt_new();
      [v29 setPurpose:*MEMORY[0x263F592F8]];
      [v29 setConfiguration:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
      [v29 setContext:*(void *)(a1 + 48)];
      uint64_t v30 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) widgetConfigID];
      [v29 setWidgetConfigID:v30];
    }
    [v29 setDefaultConfigCompletionHandler:v19];
    [v29 setSingleTagConfigCompletionHandler:v23];
    [v29 setCompletionBlock:v28];
    [*(id *)(a1 + 32) associateChildOperation:v29];
    [v29 start];

    _Block_object_dispose(v52, 8);
  }
}

void __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_82(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = NTSharedLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    int v20 = 138543874;
    id v21 = v12;
    __int16 v22 = 2114;
    id v23 = v7;
    __int16 v24 = 2048;
    id v25 = v8;
    _os_log_impl(&dword_22592C000, v10, OS_LOG_TYPE_INFO, "%{public}@ fetched default config %{public}@ heldRecordsByType %p", (uint8_t *)&v20, 0x20u);
  }
  uint64_t v13 = *(void *)(a1 + 40);
  int v14 = [v8 objectForKeyedSubscript:&unk_26D9225A0];
  objc_msgSend(v7, "nt_resolveFallbacksWithPaidAccessChecker:heldArticleRecords:", v13, v14);

  id v15 = objc_msgSend(MEMORY[0x263F5A358], "nt_defaultModule");
  [*(id *)(a1 + 48) addObject:v15];
  id v16 = [v15 availableContents];
  id v17 = objc_msgSend(v16, "fc_onlyObject");
  id v18 = [v17 request];
  id v19 = [v18 identifier];

  objc_msgSend(*(id *)(a1 + 56), "fc_safelySetObject:forKey:", v7, v19);
  objc_msgSend(*(id *)(a1 + 64), "fc_safelySetObjectAllowingNil:forKey:", v9, v19);
}

void __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_86(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = NTSharedLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    *(_DWORD *)buf = 138543874;
    id v35 = v12;
    __int16 v36 = 2114;
    id v37 = v7;
    __int16 v38 = 2048;
    id v39 = v8;
    _os_log_impl(&dword_22592C000, v10, OS_LOG_TYPE_INFO, "%{public}@ fetched single tag config %{public}@ heldRecordsByType %p", buf, 0x20u);
  }
  uint64_t v13 = *(void **)(a1 + 40);
  if (!v13 || [v13 moduleDescriptorType] != 1) {
    goto LABEL_12;
  }
  int v14 = [*(id *)(a1 + 40) identifier];
  id v15 = [*(id *)(a1 + 40) tagID];
  id v16 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) objectForKeyedSubscript:v15];
  if (v16)
  {
    id v17 = [v7 configByResolvingWithTag:v16];
    if (v17)
    {
      id v18 = objc_msgSend(MEMORY[0x263F5A358], "nt_moduleWithTagID:", v15);
      [*(id *)(a1 + 56) setObject:v17 forKeyedSubscript:v14];
      [*(id *)(a1 + 64) addObject:v18];
      int v19 = 2;
    }
    else
    {
      uint64_t v23 = MEMORY[0x263EF8330];
      uint64_t v24 = 3221225472;
      id v25 = __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_2_90;
      uint64_t v26 = &unk_26475D5C8;
      id v27 = *(id *)(a1 + 48);
      id v28 = v14;
      id v29 = v9;
      __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_2_90((uint64_t)&v23);

      int v19 = 1;
      id v18 = v27;
    }
  }
  else
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_87;
    v30[3] = &unk_26475D5A0;
    uint64_t v33 = *(void *)(a1 + 80);
    id v31 = *(id *)(a1 + 48);
    id v32 = v14;
    __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_87((uint64_t)v30);

    int v19 = 1;
    id v17 = v31;
  }

  if (v19 == 2)
  {
LABEL_12:
    uint64_t v20 = objc_msgSend(v8, "copy", v23, v24);
    uint64_t v21 = *(void *)(*(void *)(a1 + 88) + 8);
    __int16 v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }
}

void __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_87(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [MEMORY[0x263F087E8] errorWithDomain:@"NewsToday" code:1 userInfo:0];
  }
  id v4 = v3;
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
}

void __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_2_90(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "setObject:forKeyedSubscript:");
  }
  else
  {
    id v3 = [MEMORY[0x263F087E8] errorWithDomain:@"NewsToday" code:2 userInfo:0];
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
  }
}

void __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_3_91(uint64_t a1)
{
  id v5 = [[NTNewsModuleDescriptorsOperationPrefetchedContent alloc] initWithAppConfiguration:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) privateData:*(void *)(a1 + 32) todayConfigsByRequestID:*(void *)(a1 + 40) prefetchedHeldRecordsByType:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
  [*(id *)(a1 + 48) setResultTodayModuleDescriptors:*(void *)(a1 + 56)];
  [*(id *)(a1 + 48) setPrefetchedContent:v5];
  v2 = *(void **)(a1 + 64);
  id v3 = [*(id *)(a1 + 72) identifier];
  id v4 = [v2 objectForKeyedSubscript:v3];

  [*(id *)(a1 + 48) finishedPerformingOperationWithError:v4];
}

- (void)_donateTodayConfigDataToNewsd:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 length])
  {
    ++_donateTodayConfigDataToNewsd__connectionIdentifier;
    id v5 = (NSObject **)MEMORY[0x263F592D0];
    uint64_t v6 = (void *)*MEMORY[0x263F592D0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F592D0], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = [(FCOperation *)self shortOperationDescription];
      *(_DWORD *)buf = 138543362;
      id v17 = v8;
      _os_log_impl(&dword_22592C000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will donate Today Feed config data to newsd", buf, 0xCu);
    }
    id v9 = NDTodayFeedServiceXPCConnection();
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __66__NTNewsModuleDescriptorsOperation__donateTodayConfigDataToNewsd___block_invoke_95;
    v15[3] = &unk_26475C0C0;
    v15[4] = self;
    [v9 setInterruptionHandler:v15];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __66__NTNewsModuleDescriptorsOperation__donateTodayConfigDataToNewsd___block_invoke_96;
    v14[3] = &unk_26475D668;
    v14[4] = self;
    uint64_t v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v14];
    [v9 resume];
    [v10 adoptFeedConfigData:v4];
    [v9 invalidate];
    id v11 = *v5;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v11;
      uint64_t v13 = [(FCOperation *)self shortOperationDescription];
      *(_DWORD *)buf = 138543362;
      id v17 = v13;
      _os_log_impl(&dword_22592C000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ finished donating Today Feed config data to newsd", buf, 0xCu);
    }
  }
}

void __66__NTNewsModuleDescriptorsOperation__donateTodayConfigDataToNewsd___block_invoke_95(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = NTSharedLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) shortOperationDescription];
    int v4 = 138543362;
    id v5 = v3;
    _os_log_impl(&dword_22592C000, v2, OS_LOG_TYPE_INFO, "%{public}@ connection to newsd interrupted", (uint8_t *)&v4, 0xCu);
  }
}

void __66__NTNewsModuleDescriptorsOperation__donateTodayConfigDataToNewsd___block_invoke_96(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = NTSharedLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [*(id *)(a1 + 32) shortOperationDescription];
    int v6 = 138543618;
    id v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_22592C000, v4, OS_LOG_TYPE_INFO, "%{public}@ connection to newsd encountered error with proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)setResultTodayModuleDescriptors:(id)a3
{
}

- (void)setPrefetchedContent:(id)a3
{
}

- (void)validateOperation
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = (void *)[[NSString alloc] initWithFormat:@"module descriptors operation requires content context"];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

@end