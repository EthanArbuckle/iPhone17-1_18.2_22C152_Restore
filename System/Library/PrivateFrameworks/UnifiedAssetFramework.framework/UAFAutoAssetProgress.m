@interface UAFAutoAssetProgress
+ (id)getSerialQueue;
- (BOOL)updateIsFinished;
- (NSMutableDictionary)autoAssetSets;
- (NSMutableDictionary)statuses;
- (NSString)name;
- (UAFAutoAssetProgress)initWithAssetSetUsages:(id)a3 configurationManager:(id)a4 detailedProgressWithStatus:(id)a5;
- (id)detailedProgressWithStatus;
- (unint64_t)completedWork;
- (unint64_t)reportedCompletedWork;
- (unint64_t)reportedStatus;
- (unint64_t)reportedTotalWork;
- (unint64_t)totalWork;
- (void)finished:(id)a3 withStatus:(unint64_t)a4;
- (void)finishedOutOfSpace:(id)a3;
- (void)progress:(id)a3;
- (void)reportStatus:(unint64_t)a3;
- (void)setAutoAssetSets:(id)a3;
- (void)setCompletedWork:(unint64_t)a3;
- (void)setDetailedProgressWithStatus:(id)a3;
- (void)setName:(id)a3;
- (void)setReportedCompletedWork:(unint64_t)a3;
- (void)setReportedStatus:(unint64_t)a3;
- (void)setReportedTotalWork:(unint64_t)a3;
- (void)setStatuses:(id)a3;
- (void)setTotalWork:(unint64_t)a3;
- (void)setUpdateIsFinished:(BOOL)a3;
- (void)started:(id)a3;
- (void)summarize;
- (void)updateFinished:(id)a3;
@end

@implementation UAFAutoAssetProgress

uint64_t __32__UAFAutoAssetProgress_started___block_invoke(uint64_t a1)
{
  v2 = [NSNumber numberWithUnsignedInteger:2];
  v3 = [*(id *)(a1 + 32) statuses];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];

  v4 = *(void **)(a1 + 32);

  return [v4 summarize];
}

- (NSMutableDictionary)statuses
{
  return self->_statuses;
}

- (void)started:(id)a3
{
  id v4 = a3;
  v5 = +[UAFAutoAssetProgress getSerialQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__UAFAutoAssetProgress_started___block_invoke;
  v7[3] = &unk_264CEAC18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

+ (id)getSerialQueue
{
  if (_MergedGlobals_7 != -1) {
    dispatch_once(&_MergedGlobals_7, &__block_literal_global_8);
  }
  v2 = (void *)qword_26AF0BA18;

  return v2;
}

- (void)summarize
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  unint64_t v3 = +[UAFAssetSetManager coalesceDownloadStatus:self->_statuses];
  if (![(NSMutableDictionary *)self->_statuses count] && self->_updateIsFinished) {
    unint64_t v3 = 4;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = self->_autoAssetSets;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v20 = v3;
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v12 = [(NSMutableDictionary *)self->_autoAssetSets objectForKeyedSubscript:v11];
        v13 = [v12 downloadProgress];

        if (v13)
        {
          v14 = [(NSMutableDictionary *)self->_autoAssetSets objectForKeyedSubscript:v11];
          v15 = [v14 downloadProgress];
          v7 += [v15 totalExpectedBytes];

          v16 = [(NSMutableDictionary *)self->_autoAssetSets objectForKeyedSubscript:v11];
          v17 = [v16 downloadProgress];
          v8 += [v17 totalWrittenBytes];
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);

    p_totalWork = &self->_totalWork;
    if (v7 > self->_totalWork) {
      unint64_t *p_totalWork = v7;
    }
    p_completedWork = &self->_completedWork;
    unint64_t v3 = v20;
    if (v8 > self->_completedWork) {
      unint64_t *p_completedWork = v8;
    }
  }
  else
  {

    p_totalWork = &self->_totalWork;
    p_completedWork = &self->_completedWork;
  }
  if (v3 == 4) {
    unint64_t *p_completedWork = *p_totalWork;
  }
  [(UAFAutoAssetProgress *)self reportStatus:v3];
}

- (void)reportStatus:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  uint64_t v5 = [(NSMutableDictionary *)self->_statuses count];
  if (v5 != [(NSMutableDictionary *)self->_autoAssetSets count])
  {
    statuses = self->_statuses;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __37__UAFAutoAssetProgress_reportStatus___block_invoke;
    v13[3] = &unk_264CEB8C8;
    v13[4] = self;
    v13[5] = &v14;
    [(NSMutableDictionary *)statuses enumerateKeysAndObjectsUsingBlock:v13];
  }
  if (*((unsigned char *)v15 + 24))
  {
    unint64_t totalWork = self->_totalWork;
    unint64_t completedWork = self->_completedWork;
  }
  else
  {
    unint64_t totalWork = 0;
    unint64_t completedWork = 0;
  }
  if (self->_reportedCompletedWork != completedWork
    || self->_reportedTotalWork != totalWork
    || self->_reportedStatus != a3)
  {
    uint64_t v9 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      uint64_t v11 = UAFSubscriptionDownloadStatusDescription(a3);
      *(_DWORD *)buf = 136316162;
      v19 = "-[UAFAutoAssetProgress reportStatus:]";
      __int16 v20 = 2114;
      long long v21 = name;
      __int16 v22 = 2048;
      unint64_t v23 = completedWork;
      __int16 v24 = 2048;
      unint64_t v25 = totalWork;
      __int16 v26 = 2114;
      v27 = v11;
      _os_log_impl(&dword_23797A000, v9, OS_LOG_TYPE_DEFAULT, "%s Progress for %{public}@: %llu / %llu. Status: %{public}@", buf, 0x34u);
    }
    self->_reportedTotalWork = totalWork;
    self->_reportedCompletedWork = completedWork;
    self->_reportedStatus = a3;
    detailedProgressWithStatus = (void (**)(id, unint64_t, unint64_t, unint64_t))self->_detailedProgressWithStatus;
    if (detailedProgressWithStatus) {
      detailedProgressWithStatus[2](detailedProgressWithStatus, self->_completedWork, self->_totalWork, a3);
    }
  }
  _Block_object_dispose(&v14, 8);
}

- (UAFAutoAssetProgress)initWithAssetSetUsages:(id)a3 configurationManager:(id)a4 detailedProgressWithStatus:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v43.receiver = self;
  v43.super_class = (Class)UAFAutoAssetProgress;
  uint64_t v11 = [(UAFAutoAssetProgress *)&v43 init];
  if (v11)
  {
    id v37 = v10;
    v12 = NSString;
    v13 = [v8 allKeys];
    uint64_t v14 = [v12 stringWithFormat:@"%@", v13];
    v15 = (void *)*((void *)v11 + 2);
    *((void *)v11 + 2) = v14;

    v11[8] = 0;
    *(_OWORD *)(v11 + 24) = 0u;
    *(_OWORD *)(v11 + 40) = 0u;
    *((void *)v11 + 7) = 0;
    uint64_t v16 = objc_opt_new();
    char v17 = (void *)*((void *)v11 + 8);
    *((void *)v11 + 8) = v16;

    uint64_t v18 = objc_opt_new();
    v19 = (void *)*((void *)v11 + 9);
    *((void *)v11 + 9) = v18;

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v38 = v8;
    id v20 = v8;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (!v21) {
      goto LABEL_18;
    }
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v40;
    while (1)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v40 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        __int16 v26 = [v9 getAssetSet:v25];
        v27 = v26;
        if (!v26)
        {
          v31 = UAFGetLogCategory((void **)&UAFLogContextClient);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v45 = "-[UAFAutoAssetProgress initWithAssetSetUsages:configurationManager:detailedProgressWithStatus:]";
            __int16 v46 = 2114;
            uint64_t v47 = v25;
            _os_log_error_impl(&dword_23797A000, v31, OS_LOG_TYPE_ERROR, "%s Could get not get configuration for for asset set %{public}@", buf, 0x16u);
          }

          v29 = NSNumber;
          uint64_t v30 = 0;
          goto LABEL_13;
        }
        uint64_t v28 = [v26 autoAssetType];

        if (v28)
        {
          v29 = NSNumber;
          uint64_t v30 = 1;
LABEL_13:
          v32 = [v29 numberWithUnsignedInteger:v30];
          [*((id *)v11 + 8) setObject:v32 forKeyedSubscript:v25];
          goto LABEL_16;
        }
        v32 = UAFGetLogCategory((void **)&UAFLogContextClient);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v45 = "-[UAFAutoAssetProgress initWithAssetSetUsages:configurationManager:detailedProgressWithStatus:]";
          __int16 v46 = 2114;
          uint64_t v47 = v25;
          _os_log_debug_impl(&dword_23797A000, v32, OS_LOG_TYPE_DEBUG, "%s No auto asset type defined for %{public}@", buf, 0x16u);
        }
LABEL_16:
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v48 count:16];
      if (!v22)
      {
LABEL_18:

        id v10 = v37;
        uint64_t v33 = MEMORY[0x237E26D50](v37);
        v34 = (void *)*((void *)v11 + 10);
        *((void *)v11 + 10) = v33;

        v35 = v11;
        id v8 = v38;
        break;
      }
    }
  }

  return (UAFAutoAssetProgress *)v11;
}

void __37__UAFAutoAssetProgress_reportStatus___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (![v5 intValue]
    || [v5 intValue] == 2
    || [v5 intValue] == 1
    || [v5 intValue] == 3)
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:v7];

    if (!v6) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
}

void __38__UAFAutoAssetProgress_getSerialQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("UAFAutoAssetProgress.Serial", 0);
  v1 = (void *)qword_26AF0BA18;
  qword_26AF0BA18 = (uint64_t)v0;
}

- (void)progress:(id)a3
{
  id v4 = a3;
  id v5 = +[UAFAutoAssetProgress getSerialQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__UAFAutoAssetProgress_progress___block_invoke;
  v7[3] = &unk_264CEAC18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __33__UAFAutoAssetProgress_progress___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) statuses];
  unint64_t v3 = [*(id *)(a1 + 40) assetSetIdentifier];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) autoAssetSets];
    id v7 = [*(id *)(a1 + 40) assetSetIdentifier];
    [v6 setObject:v5 forKeyedSubscript:v7];

    uint64_t v8 = [*(id *)(a1 + 40) downloadProgress];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 40) downloadProgress];
      LODWORD(v8) = [v9 isStalled];
    }
    id v10 = [*(id *)(a1 + 32) statuses];
    uint64_t v11 = [*(id *)(a1 + 40) assetSetIdentifier];
    v12 = [v10 objectForKeyedSubscript:v11];
    uint64_t v13 = [v12 unsignedIntegerValue];

    if (v13 == 3)
    {
      if ((v8 & 1) == 0)
      {
        uint64_t v14 = NSNumber;
        uint64_t v15 = 2;
        goto LABEL_13;
      }
    }
    else if (v13 == 2 && v8)
    {
      uint64_t v14 = NSNumber;
      uint64_t v15 = 3;
LABEL_13:
      char v17 = [v14 numberWithUnsignedInteger:v15];
      uint64_t v18 = [*(id *)(a1 + 32) statuses];
      v19 = [*(id *)(a1 + 40) assetSetIdentifier];
      [v18 setObject:v17 forKeyedSubscript:v19];
    }
    id v20 = *(void **)(a1 + 32);
    [v20 summarize];
    return;
  }
  uint64_t v16 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = [*(id *)(a1 + 40) assetSetIdentifier];
    int v22 = 136315394;
    uint64_t v23 = "-[UAFAutoAssetProgress progress:]_block_invoke";
    __int16 v24 = 2114;
    uint64_t v25 = v21;
    _os_log_error_impl(&dword_23797A000, v16, OS_LOG_TYPE_ERROR, "%s Received progress for unknown auto asset set %{public}@", (uint8_t *)&v22, 0x16u);
  }
}

- (void)finished:(id)a3 withStatus:(unint64_t)a4
{
  id v6 = a3;
  id v7 = +[UAFAutoAssetProgress getSerialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__UAFAutoAssetProgress_finished_withStatus___block_invoke;
  block[3] = &unk_264CEB458;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __44__UAFAutoAssetProgress_finished_withStatus___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) statuses];
  unint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    uint64_t v5 = [*(id *)(a1 + 32) statuses];
    [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

    id v6 = *(void **)(a1 + 32);
    [v6 summarize];
  }
  else
  {
    id v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 136315394;
      id v10 = "-[UAFAutoAssetProgress finished:withStatus:]_block_invoke";
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      _os_log_error_impl(&dword_23797A000, v7, OS_LOG_TYPE_ERROR, "%s Received progress for unknown auto asset set %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)updateFinished:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[UAFAutoAssetProgress getSerialQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__UAFAutoAssetProgress_updateFinished___block_invoke;
  v7[3] = &unk_264CEB0B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __39__UAFAutoAssetProgress_updateFinished___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setUpdateIsFinished:1];
  [*(id *)(a1 + 32) summarize];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)finishedOutOfSpace:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[UAFAutoAssetProgress getSerialQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__UAFAutoAssetProgress_finishedOutOfSpace___block_invoke;
  v7[3] = &unk_264CEAC18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __43__UAFAutoAssetProgress_finishedOutOfSpace___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) statuses];
  unint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [NSNumber numberWithUnsignedInteger:5];
    uint64_t v5 = [*(id *)(a1 + 32) statuses];
    [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

    id v6 = *(void **)(a1 + 32);
    [v6 summarize];
  }
  else
  {
    id v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 136315394;
      id v10 = "-[UAFAutoAssetProgress finishedOutOfSpace:]_block_invoke";
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      _os_log_error_impl(&dword_23797A000, v7, OS_LOG_TYPE_ERROR, "%s Received progress for unknown auto asset set %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)updateIsFinished
{
  return self->_updateIsFinished;
}

- (void)setUpdateIsFinished:(BOOL)a3
{
  self->_updateIsFinished = a3;
}

- (unint64_t)totalWork
{
  return self->_totalWork;
}

- (void)setTotalWork:(unint64_t)a3
{
  self->_unint64_t totalWork = a3;
}

- (unint64_t)completedWork
{
  return self->_completedWork;
}

- (void)setCompletedWork:(unint64_t)a3
{
  self->_unint64_t completedWork = a3;
}

- (unint64_t)reportedTotalWork
{
  return self->_reportedTotalWork;
}

- (void)setReportedTotalWork:(unint64_t)a3
{
  self->_reportedTotalWork = a3;
}

- (unint64_t)reportedCompletedWork
{
  return self->_reportedCompletedWork;
}

- (void)setReportedCompletedWork:(unint64_t)a3
{
  self->_reportedCompletedWork = a3;
}

- (unint64_t)reportedStatus
{
  return self->_reportedStatus;
}

- (void)setReportedStatus:(unint64_t)a3
{
  self->_reportedStatus = a3;
}

- (void)setStatuses:(id)a3
{
}

- (NSMutableDictionary)autoAssetSets
{
  return self->_autoAssetSets;
}

- (void)setAutoAssetSets:(id)a3
{
}

- (id)detailedProgressWithStatus
{
  return self->_detailedProgressWithStatus;
}

- (void)setDetailedProgressWithStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_detailedProgressWithStatus, 0);
  objc_storeStrong((id *)&self->_autoAssetSets, 0);
  objc_storeStrong((id *)&self->_statuses, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end