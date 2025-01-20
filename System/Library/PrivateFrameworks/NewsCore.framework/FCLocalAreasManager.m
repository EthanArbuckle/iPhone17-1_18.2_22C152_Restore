@interface FCLocalAreasManager
- (FCAsyncSerialQueue)queue;
- (FCContentContext)contentContext;
- (FCLocalAreasManager)initWithContentContext:(id)a3;
- (FCLocalAreasMapping)localAreasMapping;
- (FCOnce)loadFromCacheOnce;
- (NSDate)localAreasMappingFetchDate;
- (void)_loadFromCache;
- (void)_refreshWithQoS:(int64_t)a3 completion:(id)a4;
- (void)fetchLocalAreasProvider:(id)a3;
- (void)setContentContext:(id)a3;
- (void)setLocalAreasMapping:(id)a3;
- (void)setLocalAreasMappingFetchDate:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation FCLocalAreasManager

- (FCLocalAreasManager)initWithContentContext:(id)a3
{
  v4 = (FCContentContext *)a3;
  v13.receiver = self;
  v13.super_class = (Class)FCLocalAreasManager;
  v5 = [(FCLocalAreasManager *)&v13 init];
  contentContext = v5->_contentContext;
  v5->_contentContext = v4;
  v7 = v4;

  v8 = [[FCAsyncSerialQueue alloc] initWithQualityOfService:17];
  queue = v5->_queue;
  v5->_queue = v8;

  v10 = [[FCOnce alloc] initWithOptions:1];
  loadFromCacheOnce = v5->_loadFromCacheOnce;
  v5->_loadFromCacheOnce = v10;

  return v5;
}

- (void)fetchLocalAreasProvider:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  v5 = [(FCLocalAreasManager *)self loadFromCacheOnce];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__FCLocalAreasManager_fetchLocalAreasProvider___block_invoke;
  v8[3] = &unk_1E5B4C018;
  v8[4] = self;
  [v5 executeOnce:v8];

  v6 = [(FCLocalAreasManager *)self localAreasMapping];
  if (v6)
  {
    [(FCLocalAreasManager *)self _refreshWithQoS:17 completion:0];
    v4[2](v4, v6, 0);
  }
  else
  {
    v7 = v4;
    [(FCLocalAreasManager *)self _refreshWithQoS:25 completion:v7];
  }
}

uint64_t __47__FCLocalAreasManager_fetchLocalAreasProvider___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadFromCache];
}

uint64_t __47__FCLocalAreasManager_fetchLocalAreasProvider___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshWithQoS:25 completion:*(void *)(a1 + 40)];
}

- (void)_loadFromCache
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v3 = [(FCLocalAreasManager *)self contentContext];
  v4 = [v3 appConfigurationManager];
  v5 = [v4 possiblyUnfetchedAppConfiguration];
  v6 = [v5 localAreasMappingResourceId];

  if (v6)
  {
    id v7 = v6;
    v8 = [FCResourcesFetchOperation alloc];
    v9 = [(FCLocalAreasManager *)self contentContext];
    v15[0] = v7;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v11 = [(FCResourcesFetchOperation *)v8 initWithContext:v9 resourceIDs:v10 downloadAssets:0];

    [(FCFetchOperation *)v11 setCachePolicy:3];
    [(FCFetchOperation *)v11 setCanSendFetchCompletionSynchronously:1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __37__FCLocalAreasManager__loadFromCache__block_invoke_4;
    v13[3] = &unk_1E5B53EC0;
    v13[4] = self;
    [(FCFetchOperation *)v11 setFetchCompletionBlock:v13];
    [(FCOperation *)v11 start];
    [(FCResourcesFetchOperation *)v11 waitUntilFinished];
  }
  else
  {
    v12 = FCLocalAreasLog;
    if (os_log_type_enabled((os_log_t)FCLocalAreasLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "No cached mapping resource because the config has no resource ID", buf, 2u);
    }
  }
}

void __37__FCLocalAreasManager__loadFromCache__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [a2 fetchedObject];
  v4 = objc_msgSend(v3, "fc_onlyObject");

  if (v4)
  {
    id v5 = v4;
    v6 = [v5 assetHandle];
    id v7 = [v6 dataProvider];
    v8 = [v7 data];

    if (v8)
    {
      id v9 = v8;
      v10 = [[FCLocalAreasMapping alloc] initWithData:v9];
      [*(id *)(a1 + 32) setLocalAreasMapping:v10];

      v11 = [v5 fetchDate];
      [*(id *)(a1 + 32) setLocalAreasMappingFetchDate:v11];

      v12 = (void *)FCLocalAreasLog;
      if (os_log_type_enabled((os_log_t)FCLocalAreasLog, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v13 = v12;
        v14 = [v5 fetchDate];
        int v17 = 138543362;
        v18 = v14;
        _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "Found cached mapping resource with fetch date: %{public}@", (uint8_t *)&v17, 0xCu);
      }
    }
    else
    {
      v16 = FCLocalAreasLog;
      if (os_log_type_enabled((os_log_t)FCLocalAreasLog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1A460D000, v16, OS_LOG_TYPE_DEFAULT, "No cached mapping resource because the asset hasn't been downloaded", (uint8_t *)&v17, 2u);
      }
    }
  }
  else
  {
    v15 = FCLocalAreasLog;
    if (os_log_type_enabled((os_log_t)FCLocalAreasLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1A460D000, v15, OS_LOG_TYPE_DEFAULT, "No cached mapping resource because the record hasn't been fetched", (uint8_t *)&v17, 2u);
    }
  }
}

- (void)_refreshWithQoS:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(FCLocalAreasManager *)self localAreasMappingFetchDate];
  if (v7
    && (v8 = (void *)v7,
        [(FCLocalAreasManager *)self localAreasMappingFetchDate],
        id v9 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "fc_timeIntervalUntilNow"),
        double v11 = v10,
        v9,
        v8,
        v11 <= 86400.0))
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke;
    v18[3] = &unk_1E5B4C7C0;
    v12 = &v19;
    v18[4] = self;
    id v19 = v6;
    id v13 = v6;
    __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke((uint64_t)v18);
  }
  else
  {
    v14 = [(FCLocalAreasManager *)self queue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_2;
    v16[3] = &unk_1E5B53F38;
    v12 = (id *)v17;
    v16[4] = self;
    v17[0] = v6;
    v17[1] = a3;
    id v15 = v6;
    [v14 withQualityOfService:a3 enqueueBlock:v16];
  }
}

void __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) localAreasMapping];
    (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
  }
}

void __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_3;
  aBlock[3] = &unk_1E5B53EE8;
  id v4 = *(id *)(a1 + 40);
  aBlock[4] = *(void *)(a1 + 32);
  id v27 = v4;
  id v5 = v3;
  id v28 = v5;
  id v6 = (void (**)(id, void))_Block_copy(aBlock);
  uint64_t v7 = [*(id *)(a1 + 32) localAreasMappingFetchDate];
  if (v7
    && (v8 = (void *)v7,
        [*(id *)(a1 + 32) localAreasMappingFetchDate],
        id v9 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "fc_timeIntervalUntilNow"),
        double v11 = v10,
        v9,
        v8,
        v11 <= 86400.0))
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_4;
    v24 = &unk_1E5B4CA88;
    v25 = v6;
    v6[2](v6, 0);
    v12 = v6;
  }
  else
  {
    id v13 = FCLocalAreasLog;
    if (os_log_type_enabled((os_log_t)FCLocalAreasLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "Will refresh mapping resource", buf, 2u);
    }
    v14 = [*(id *)(a1 + 32) contentContext];
    id v15 = [v14 appConfigurationManager];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    void v17[2] = __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_13;
    v17[3] = &unk_1E5B53F10;
    v17[4] = *(void *)(a1 + 32);
    v18 = v6;
    uint64_t v19 = *(void *)(a1 + 48);
    v16 = v6;
    FCAppConfigurationFetch(v15, v17);

    v12 = v18;
  }
}

void __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) localAreasMapping];
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v4, v6);
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

uint64_t __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_13(uint64_t a1, uint64_t a2, void *a3)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) contentContext];
  id v6 = [v5 appConfigurationManager];
  uint64_t v7 = [v6 possiblyUnfetchedAppConfiguration];
  v8 = [v7 localAreasMappingResourceId];

  if (v8)
  {
    id v9 = v8;
    double v10 = [FCResourcesFetchOperation alloc];
    double v11 = [*(id *)(a1 + 32) contentContext];
    v31[0] = v9;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    id v13 = [(FCResourcesFetchOperation *)v10 initWithContext:v11 resourceIDs:v12 downloadAssets:1];

    [(FCFetchOperation *)v13 setCachePolicy:4];
    [(FCFetchOperation *)v13 setMaximumCachedAge:86400.0];
    [(FCOperation *)v13 setQualityOfService:*(void *)(a1 + 48)];
    uint64_t v14 = *(void *)(a1 + 48);
    if (v14 == 9) {
      uint64_t v15 = -1;
    }
    else {
      uint64_t v15 = v14 == 33 || v14 == 25;
    }
    [(FCOperation *)v13 setRelativePriority:v15];
    v16 = (void *)FCLocalAreasLog;
    if (os_log_type_enabled((os_log_t)FCLocalAreasLog, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = v16;
      v18 = [(FCOperation *)v13 shortOperationDescription];
      *(_DWORD *)buf = 138543362;
      v30 = v18;
      _os_log_impl(&dword_1A460D000, v17, OS_LOG_TYPE_DEFAULT, "Will issue mapping resource fetch operation: %{public}@", buf, 0xCu);
    }
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_15;
    v23 = &unk_1E5B50870;
    id v19 = *(id *)(a1 + 40);
    uint64_t v24 = *(void *)(a1 + 32);
    id v25 = v19;
    [(FCFetchOperation *)v13 setFetchCompletionBlock:&v20];
    [(FCOperation *)v13 start];
  }
  else
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_2_14;
    v26[3] = &unk_1E5B4C7C0;
    id v28 = *(id *)(a1 + 40);
    id v27 = v4;
    __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_2_14((uint64_t)v26);

    id v9 = v28;
  }
}

uint64_t __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_2_14(uint64_t a1)
{
  id v2 = FCLocalAreasLog;
  if (os_log_type_enabled((os_log_t)FCLocalAreasLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "App config has no mapping resource ID", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_15(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 fetchedObject];
  uint64_t v5 = objc_msgSend(v4, "fc_onlyObject");

  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = [v6 assetHandle];
    v8 = [v7 dataProvider];
    id v9 = [v8 data];

    if (v9)
    {
      id v10 = v9;
      double v11 = [[FCLocalAreasMapping alloc] initWithData:v10];
      [*(id *)(a1 + 32) setLocalAreasMapping:v11];

      v12 = [v6 fetchDate];
      [*(id *)(a1 + 32) setLocalAreasMappingFetchDate:v12];

      id v13 = FCLocalAreasLog;
      if (os_log_type_enabled((os_log_t)FCLocalAreasLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "Successfully fetched mapping resource", v14, 2u);
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      void v15[2] = __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_17;
      v15[3] = &unk_1E5B4CC80;
      id v16 = v6;
      id v17 = *(id *)(a1 + 40);
      __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_17((uint64_t)v15);

      id v10 = v16;
    }
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_2_16;
    v18[3] = &unk_1E5B4CC80;
    id v19 = v3;
    id v20 = *(id *)(a1 + 40);
    __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_2_16((uint64_t)v18);

    id v6 = v19;
  }
}

void __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_2_16(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)FCLocalAreasLog;
  if (os_log_type_enabled((os_log_t)FCLocalAreasLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    uint64_t v5 = [v3 error];
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "Failed to fetch mapping resource with error: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

void __50__FCLocalAreasManager__refreshWithQoS_completion___block_invoke_17(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)FCLocalAreasLog;
  if (os_log_type_enabled((os_log_t)FCLocalAreasLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    uint64_t v5 = [v3 assetHandle];
    uint64_t v6 = [v5 downloadError];
    int v10 = 138543362;
    double v11 = v6;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "Failed to fetch mapping resource with error: %{public}@", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  int v8 = [*(id *)(a1 + 32) assetHandle];
  id v9 = [v8 downloadError];
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);
}

- (FCAsyncSerialQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void)setContentContext:(id)a3
{
}

- (FCLocalAreasMapping)localAreasMapping
{
  return (FCLocalAreasMapping *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalAreasMapping:(id)a3
{
}

- (NSDate)localAreasMappingFetchDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLocalAreasMappingFetchDate:(id)a3
{
}

- (FCOnce)loadFromCacheOnce
{
  return self->_loadFromCacheOnce;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadFromCacheOnce, 0);
  objc_storeStrong((id *)&self->_localAreasMappingFetchDate, 0);
  objc_storeStrong((id *)&self->_localAreasMapping, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end